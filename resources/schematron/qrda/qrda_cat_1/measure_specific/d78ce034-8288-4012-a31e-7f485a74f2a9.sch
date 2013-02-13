<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://purl.oclc.org/dsdl/schematron C:/Users/rickg/workspaces-svn/ClientProjects/QRDATesting/measure-specific-schematron/schematron.xsd">
	<ns uri="urn:hl7-org:v3" prefix="cda"/>
	<ns uri="urn:hl7-org:sdtc" prefix="sdtc"/>
	<phase id="warnings">
		<active pattern="p"/>
	</phase>
	<pattern id="p">
		<rule context="/cda:ClinicalDocument">
			<assert test="//*[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.7'][descendant::*/@sdtc:valueSet='2.16.840.1.113883.3.666.5.820']">For QDT pattern 'Device, Applied: Hospital Measures-Indwelling urinary catheter', QRDA template id "2.16.840.1.113883.10.20.24.3.7" SHOULD be present and SHOULD be bound to value set "2.16.840.1.113883.3.666.5.820". </assert>
			<assert test="//*[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.7'][descendant::*/@sdtc:valueSet='2.16.840.1.113883.3.666.5.1086']">For QDT pattern 'Device, Applied: Hospital measures-Pacemaker or implantable defibrillator device', QRDA template id "2.16.840.1.113883.10.20.24.3.7" SHOULD be present and SHOULD be bound to value set "2.16.840.1.113883.3.666.5.1086". </assert>
			<assert test="//*[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.7'][descendant::*/@sdtc:valueSet='2.16.840.1.113883.3.666.5.827']">For QDT pattern 'Device, Applied: Hospital Measures-Suprapubic catheter', QRDA template id "2.16.840.1.113883.10.20.24.3.7" SHOULD be present and SHOULD be bound to value set "2.16.840.1.113883.3.666.5.827". </assert>
			<assert test="//*[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.23'][descendant::*/@sdtc:valueSet='2.16.840.1.113883.3.666.5.307']">For QDT pattern 'Encounter, Performed: Encounter Inpatient', QRDA template id "2.16.840.1.113883.10.20.24.3.23" SHOULD be present and SHOULD be bound to value set "2.16.840.1.113883.3.666.5.307". </assert>
			<assert test="//*[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.32'][descendant::*/@sdtc:valueSet='2.16.840.1.113883.3.666.5.825']">For QDT pattern 'Intervention, Performed: Hospital Measures-Intermittent Catheterization', QRDA template id "2.16.840.1.113883.10.20.24.3.32" SHOULD be present and SHOULD be bound to value set "2.16.840.1.113883.3.666.5.825". </assert>
			<assert test="//*[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.42'][descendant::*/@sdtc:valueSet='2.16.840.1.113883.3.666.5.829']">For QDT pattern 'Medication, Administered: Hospital Measures-Diuretics RxNorm', QRDA template id "2.16.840.1.113883.10.20.24.3.42" SHOULD be present and SHOULD be bound to value set "2.16.840.1.113883.3.666.5.829". </assert>
			<assert test="//*[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.51'][descendant::*/@sdtc:valueSet='2.16.840.1.113883.3.526.2.643']">For QDT pattern 'Patient Characteristic: Clinical Trial Participant', QRDA template id "2.16.840.1.113883.10.20.24.3.51" SHOULD be present and SHOULD be bound to value set "2.16.840.1.113883.3.526.2.643". </assert>
			<assert test="//*[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.54'][descendant::*/@sdtc:valueSet='2.16.840.1.113883.3.666.5.730']">For QDT pattern 'Patient Characteristic: Expired', QRDA template id "2.16.840.1.113883.10.20.24.3.54" SHOULD be present and SHOULD be bound to value set "2.16.840.1.113883.3.666.5.730". </assert>
			<assert test="//*[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.57'][descendant::*/@sdtc:valueSet='2.16.840.1.113883.3.666.5.822']">For QDT pattern 'Physical Exam, Finding: Hospital Measures-SCIP urinary diversion', QRDA template id "2.16.840.1.113883.10.20.24.3.57" SHOULD be present and SHOULD be bound to value set "2.16.840.1.113883.3.666.5.822". </assert>
			<assert test="//*[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.64'][descendant::*/@sdtc:valueSet='2.16.840.1.113883.3.666.5.694']">For QDT pattern 'Procedure, Performed: Hospital measures-CABG', QRDA template id "2.16.840.1.113883.10.20.24.3.64" SHOULD be present and SHOULD be bound to value set "2.16.840.1.113883.3.666.5.694". </assert>
			<assert test="//*[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.64'][descendant::*/@sdtc:valueSet='1.3.6.1.4.1.33895.1.3.0.31']">For QDT pattern 'Procedure, Performed: Hospital Measures-Joint Commission Evidence of a surgical procedure requiring general or neuraxial anesthesia', QRDA template id "2.16.840.1.113883.10.20.24.3.64" SHOULD be present and SHOULD be bound to value set "1.3.6.1.4.1.33895.1.3.0.31". </assert>
			<assert test="//*[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.64'][descendant::*/@sdtc:valueSet='2.16.840.1.113883.3.666.5.701']">For QDT pattern 'Procedure, Performed: Hospital measures-Other Cardiac Surgery', QRDA template id "2.16.840.1.113883.10.20.24.3.64" SHOULD be present and SHOULD be bound to value set "2.16.840.1.113883.3.666.5.701". </assert>
			<assert test="//*[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.64'][descendant::*/@sdtc:valueSet='2.16.840.1.113883.3.666.5.1087']">For QDT pattern 'Procedure, Performed: Hospital Measures-Pacemaker or implantable defibrillator procedure', QRDA template id "2.16.840.1.113883.10.20.24.3.64" SHOULD be present and SHOULD be bound to value set "2.16.840.1.113883.3.666.5.1087". </assert>
			<assert test="//*[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.64'][descendant::*/@sdtc:valueSet='2.16.840.1.113883.3.666.5.1050']">For QDT pattern 'Procedure, Performed: Hospital Measures-SCIP urinary diversion procedures', QRDA template id "2.16.840.1.113883.10.20.24.3.64" SHOULD be present and SHOULD be bound to value set "2.16.840.1.113883.3.666.5.1050". </assert>
			<assert test="//*[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.64'][descendant::*/@sdtc:valueSet='2.16.840.1.113883.3.666.5.819']">For QDT pattern 'Procedure, Performed: Hospital Measures-SCIP Urological/Perineal procedures with potential need of indwelling catheters', QRDA template id "2.16.840.1.113883.10.20.24.3.64" SHOULD be present and SHOULD be bound to value set "2.16.840.1.113883.3.666.5.819". </assert>
			<assert test="//*[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.64'][descendant::*/@sdtc:valueSet='2.16.840.1.113883.3.117.1.7.1.2']">For QDT pattern 'Procedure, Performed: SCIP Major Surgical Procedure', QRDA template id "2.16.840.1.113883.10.20.24.3.64" SHOULD be present and SHOULD be bound to value set "2.16.840.1.113883.3.117.1.7.1.2". </assert>
			<assert test="//*[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.55'][descendant::*/@sdtc:valueSet='2.16.840.1.114222.4.11.3591']">For QDT pattern 'Patient Characteristic Payer: Payer', QRDA template id "2.16.840.1.113883.10.20.24.3.55" SHOULD be present and SHOULD be bound to value set "2.16.840.1.114222.4.11.3591". </assert>
		</rule>
	</pattern>
</schema>