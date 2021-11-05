<?php
date_default_timezone_set("asia/colombo");
require 'dbconnect.php';
require 'Upload_file.php';

    if(isset($_POST["saveTr"]))
    {
        $db = new DbConnect;
        $conn = $db->connect();
        
        $trID = $_POST["trID"];
        $phaseDrop = $_POST["phaseDrop"];
        $location = $_POST["location"];
        $capacity = $_POST["capacity"];
        $manufacture = $_POST["manufacture"];
        $commisionedYear = $_POST["commisionedYear"];
        
        $sql = "INSERT INTO `transformers`(`trName`, `location`, `capascity`, `phase`, `manufacture`, `year`)  VALUES (\"".$trID."\",\"".$location."\",\"".$capacity."\",\"".$phaseDrop."\",\"".$manufacture."\",\"".$commisionedYear."\");";

        echo $sql;
        $stmt = $conn->prepare($sql);
        if($stmt->execute()){
            echo "Update1 Successfull! <br>";
        }

    }

    if(isset($_POST['loadTrTbl'])) {
		$db = new DbConnect;
		$conn = $db->connect();
		$stmt = $conn->prepare("SELECT * FROM `transformers`;");
		$stmt->execute();
		$trs = $stmt->fetchAll(PDO::FETCH_ASSOC);
		echo json_encode($trs);
	}

    if(isset($_POST['loadTrTblSearch'])) {
		$db = new DbConnect;
		$conn = $db->connect();
		$stmt = $conn->prepare("SELECT * FROM `transformers` where `trName`=\"" . $_POST['loadTrTblSearch'] . "\" ;");
		$stmt->execute();
		$trs = $stmt->fetchAll(PDO::FETCH_ASSOC);
		echo json_encode($trs);
	}

	if(isset($_POST['loadAnalizeSearch'])) {
		$db = new DbConnect;
		$conn = $db->connect();
		$stmt = $conn->prepare("SELECT * FROM `datafiles` WHERE `trID`=" . $_POST['loadAnalizeSearch'] . ";");
		$stmt->execute();
		$trs = $stmt->fetchAll(PDO::FETCH_ASSOC);
		echo json_encode($trs);
	}

	if(isset($_POST['getAnalizeData1']) && isset($_POST['getAnalizeData2'])) {
		$output = shell_exec("powershell python c:/xampp/htdocs/TVAS_Web/python/calculate2.py 'TR_60MW_set1.xlsx' 'TR_60MW_set2.xlsx'");
		echo $output;
	}
	
    if(isset($_POST['addDataFile'])){
		
		$trID = $_POST['trID'];
        $LCDrop = $_POST['LCDrop'];
        $trDate = $_POST['trDate'];

		$file_new_name ="0";
		
		if ($_FILES['file']['size'] <> 0){
			$file = $_FILES['file'];
			$allowd = array('xlsx','xls');
			$fileDestination = '../Upload';
			$file_new_name = uploadfile($file,$allowd,$fileDestination);
		}


        $db = new DbConnect;
		$sql = "INSERT INTO `datafiles`(`trID`, `load_condition`, `date`, `filename`) VALUES (" . $trID . "," . $LCDrop . ",\"" . $trDate . "\",\"" . $file_new_name . "\");";

		echo $sql;

		if(!$conn = $db->connect())
			
		{
			echo'<script language="javascript">
					window.alert("SQL ERROR. Please check the SQL code ")
					</script>';
					exit();
		}
		else
		{
			$stmt = $conn->prepare($sql);
			$stmt->execute();
			echo '<script language="javascript">
					window.alert("Data File Updated !")
					</script>';
					exit();
    	}
	}

	if(isset($_POST['loadFileTbl'])) {
		$db = new DbConnect;
		$conn = $db->connect();
		$stmt = $conn->prepare("SELECT * FROM `transformers`,`datafiles` WHERE transformers.trID=datafiles.trID;");
		$stmt->execute();
		$dtfiles = $stmt->fetchAll(PDO::FETCH_ASSOC);
		echo json_encode($dtfiles);
	}

?>