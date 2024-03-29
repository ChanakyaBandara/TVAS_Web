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
		$stmt = $conn->prepare("SELECT * FROM `transformers` where `trName` LIKE \"%" . $_POST['loadTrTblSearch'] . "%\" ;");
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

	if(isset($_POST['loadAnalizeTRID'])) {
		//loadAnalizeCom
		$ComVal = $_POST['loadAnalizeCom'];
		$db = new DbConnect;
		$conn = $db->connect();
		$stmt = $conn->prepare("SELECT * FROM `datafiles` WHERE `trID`=" . $_POST['loadAnalizeTRID'] . " AND `load_condition`=" . $_POST['loadAnalizeLC'] . ";");
		$stmt->execute();
		$command = "powershell python c:/xampp/htdocs/TVAS_Web/python/calculate3.py ".$ComVal;
		if($result = $stmt->fetchAll(PDO::FETCH_ASSOC))
			{
				foreach ($result as $rows) {
						$date =$rows['date'];
						$filename =$rows['filename'];
						$command = $command . " '".$date."'" . " '".$filename."'";
					}
			}  
		
		$output = shell_exec($command);
		echo $output;
		
	}
	//Windows
	if(isset($_POST['getAnalizeData1']) && isset($_POST['getAnalizeData2'])) {
		$output = shell_exec("powershell python c:/xampp/htdocs/TVAS_Web/python/calculate.py '". $_POST['getAnalizeData1'] ."' '". $_POST['getAnalizeData2'] ."'");
		echo $output;
	}

	//Linux
	// if(isset($_POST['getAnalizeData1']) && isset($_POST['getAnalizeData2'])) {
	// 	$command = "python3 /opt/lampp/htdocs/TVAS/python/calculate2.py '". $_POST['getAnalizeData1'] ."' '". $_POST['getAnalizeData2'] ."'";
	// 	$output = shell_exec("python3 /opt/lampp/htdocs/TVAS/python/calculate2.py '619facfee81f51.24360656.xlsx' '619fad17cb0538.61721619.xlsx'");
	// 	echo $output;
	// }
	
    if(isset($_POST['addDataFile'])){
		
		$trID = $_POST['trID'];
        $LCDrop = $_POST['LCDrop'];
        $trDate = $_POST['trDate'];
        $fanCondition = $_POST['fanCondition'];
        $tapPosition = $_POST['tapPosition'];

		$file_new_name ="0";
		
		if ($_FILES['file']['size'] <> 0){
			$file = $_FILES['file'];
			$allowd = array('xlsx','xls');
			$fileDestination = '../Upload';
			$file_new_name = uploadfile($file,$allowd,$fileDestination);
		}


        $db = new DbConnect;
		$sql = "INSERT INTO `datafiles`(`trID`, `load_condition`, `date`, `fan`, `tap`, `filename`) VALUES (" . $trID . "," . $LCDrop . ",\"" . $trDate . "\"," . $fanCondition . "," . $tapPosition . ",\"" . $file_new_name . "\");";

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
					window.alert("Data File Updated !");
					window.location.href = "../add_data_table.html"
					</script>';
					exit();
    	}
	}
	
	if(isset($_POST['loadFileTbl'])) {
		$db = new DbConnect;
		$conn = $db->connect();
		$stmt = $conn->prepare("SELECT * FROM `transformers`,`datafiles` WHERE transformers.trID=datafiles.trID ORDER BY DID DESC;");
		$stmt->execute();
		$dtfiles = $stmt->fetchAll(PDO::FETCH_ASSOC);
		echo json_encode($dtfiles);
	}


	if(isset($_POST['DeleteDatabyID'])) {
		$db = new DbConnect;
		$conn = $db->connect();
		$stmt = $conn->prepare("DELETE FROM `datafiles` WHERE `datafiles`.`DID` =" . $_POST['DeleteDatabyID'] . ";");
		$stmt->execute();
		$dtfiles = $stmt->fetchAll(PDO::FETCH_ASSOC);
		echo json_encode($dtfiles);
	}
	
	if(isset($_POST['DeleteTransfomerbyID'])) {
		$db = new DbConnect;
		$conn = $db->connect();
		$stmt = $conn->prepare("DELETE FROM `transformers` WHERE `transformers`.`trID` = " . $_POST['DeleteTransfomerbyID'] . ";");
		$stmt->execute();
		$dtfiles = $stmt->fetchAll(PDO::FETCH_ASSOC);
		echo json_encode($dtfiles);
	}

?>