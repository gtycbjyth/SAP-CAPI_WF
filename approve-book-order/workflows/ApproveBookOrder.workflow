{
	"contents": {
		"4c09ceee-311f-4b6b-876f-5bc9e20123a6": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "approvebookorder",
			"subject": "ApproveBookOrder",
			"name": "ApproveBookOrder",
			"documentation": "Approve Book Order",
			"lastIds": "62d7f4ed-4063-4c44-af8b-39050bd44926",
			"events": {
				"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
					"name": "Start Approval Process"
				},
				"2798f4e7-bc42-4fad-a248-159095a2f40a": {
					"name": "Approved"
				},
				"cf192a09-beff-4966-b7ed-b941d99d34b6": {
					"name": "rejected"
				}
			},
			"activities": {
				"288254c2-ca6c-4a5b-b527-600afdf506ed": {
					"name": "Init history"
				},
				"f3082f0e-d384-4cf3-aaba-342d43a7ba2a": {
					"name": "Approval Needed?"
				},
				"e4a51764-b1ad-454a-a2c7-ac2d69115629": {
					"name": "Approve by Department Manager"
				},
				"a242532b-042d-4f05-b177-1145b05c085d": {
					"name": "Process Department Manager Decision"
				},
				"8360ee03-0181-4d1b-8b86-2700d1a3d9b5": {
					"name": "Department Manager Approval Decision"
				}
			},
			"sequenceFlows": {
				"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
					"name": "SequenceFlow1"
				},
				"125f6aa0-1dd9-4213-86f6-dc7291aefdf4": {
					"name": "SequenceFlow2"
				},
				"a16d0f36-dffe-4091-ac6c-90d8d57c1652": {
					"name": "yes"
				},
				"fdf321e9-6b91-43a1-beb0-f5ac0110ea51": {
					"name": "SequenceFlow4"
				},
				"2fe53379-66aa-432f-b635-2bd011c485f4": {
					"name": "SequenceFlow5"
				},
				"386527ce-b312-4d5d-8b92-56421d964a8f": {
					"name": "Approved"
				},
				"cb1d5eed-db6b-4e90-b05e-d2886c3ab674": {
					"name": "Rejected"
				},
				"bf808f31-9a9a-43e3-9b0e-cdc786f54381": {
					"name": "no"
				}
			},
			"diagrams": {
				"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {}
			}
		},
		"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "Start Approval Process",
			"sampleContextRefs": {
				"ca3850ec-ea4a-482a-b08d-4fcd19d5d27e": {}
			}
		},
		"2798f4e7-bc42-4fad-a248-159095a2f40a": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "Approved"
		},
		"288254c2-ca6c-4a5b-b527-600afdf506ed": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/ApproveBookOrder/ScriptOperations.js",
			"id": "scripttask1",
			"name": "Init history"
		},
		"f3082f0e-d384-4cf3-aaba-342d43a7ba2a": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway1",
			"name": "Approval Needed?",
			"default": "bf808f31-9a9a-43e3-9b0e-cdc786f54381"
		},
		"e4a51764-b1ad-454a-a2c7-ac2d69115629": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Approval for \"${context.WorkflowDetails.title}",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "${info.startedBy}",
			"formReference": "/forms/ApproveBookOrder/ApproveBookOrder.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "approvebookorder"
			}, {
				"key": "formRevision",
				"value": "1.0"
			}],
			"id": "usertask1",
			"name": "Approve by Department Manager"
		},
		"a242532b-042d-4f05-b177-1145b05c085d": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/ApproveBookOrder/ScriptOperations.js",
			"id": "scripttask2",
			"name": "Process Department Manager Decision"
		},
		"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "288254c2-ca6c-4a5b-b527-600afdf506ed"
		},
		"125f6aa0-1dd9-4213-86f6-dc7291aefdf4": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "288254c2-ca6c-4a5b-b527-600afdf506ed",
			"targetRef": "f3082f0e-d384-4cf3-aaba-342d43a7ba2a"
		},
		"a16d0f36-dffe-4091-ac6c-90d8d57c1652": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow3",
			"name": "yes",
			"sourceRef": "f3082f0e-d384-4cf3-aaba-342d43a7ba2a",
			"targetRef": "e4a51764-b1ad-454a-a2c7-ac2d69115629"
		},
		"fdf321e9-6b91-43a1-beb0-f5ac0110ea51": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow4",
			"name": "SequenceFlow4",
			"sourceRef": "e4a51764-b1ad-454a-a2c7-ac2d69115629",
			"targetRef": "a242532b-042d-4f05-b177-1145b05c085d"
		},
		"2fe53379-66aa-432f-b635-2bd011c485f4": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow5",
			"name": "SequenceFlow5",
			"sourceRef": "a242532b-042d-4f05-b177-1145b05c085d",
			"targetRef": "8360ee03-0181-4d1b-8b86-2700d1a3d9b5"
		},
		"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"df898b52-91e1-4778-baad-2ad9a261d30e": {},
				"53e54950-7757-4161-82c9-afa7e86cff2c": {},
				"6bb141da-d485-4317-93b8-e17711df4c32": {},
				"71f1d34c-027d-4217-b48b-5aebb3af7349": {},
				"a4402d44-bbc3-4b22-9a5b-c84b0f29b733": {},
				"b3f26ecf-1a50-48a1-b73e-5ec4de51b76b": {},
				"6a311d3f-fca1-4efe-be29-e539c2f569b0": {},
				"482e02dc-fbcb-4a53-be37-6ac43500fcad": {},
				"d0dd64c6-08c9-4b09-a9d4-79a1fdf4d5c5": {},
				"32eb3b16-caa6-4657-ad55-d566282aef5d": {},
				"57057d8a-cfbc-4d91-929d-4951acba876b": {},
				"eb66a7df-e3d5-4c53-ba4a-8b153c85f2c6": {},
				"332be9f8-2a15-4e85-945e-e19e7fd2dae2": {},
				"1844d89b-3da3-4ded-b7bd-b79b30d1ea57": {},
				"48fc2c71-9513-47cc-882a-d60a8cbffb66": {},
				"fd92e422-9287-4c22-846e-5794b49926d0": {}
			}
		},
		"ca3850ec-ea4a-482a-b08d-4fcd19d5d27e": {
			"classDefinition": "com.sap.bpm.wfs.SampleContext",
			"reference": "/sample-data/ApproveBookOrder/SampleStartPayload.json",
			"id": "default-start-context"
		},
		"df898b52-91e1-4778-baad-2ad9a261d30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 12,
			"y": 56,
			"width": 32,
			"height": 32,
			"object": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"53e54950-7757-4161-82c9-afa7e86cff2c": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 747.9999988079071,
			"y": 137,
			"width": 35,
			"height": 35,
			"object": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"6bb141da-d485-4317-93b8-e17711df4c32": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "44,72 94,72",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "71f1d34c-027d-4217-b48b-5aebb3af7349",
			"object": "c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f"
		},
		"71f1d34c-027d-4217-b48b-5aebb3af7349": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 94,
			"y": 42,
			"width": 100,
			"height": 60,
			"object": "288254c2-ca6c-4a5b-b527-600afdf506ed"
		},
		"a4402d44-bbc3-4b22-9a5b-c84b0f29b733": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "194,72 244,72",
			"sourceSymbol": "71f1d34c-027d-4217-b48b-5aebb3af7349",
			"targetSymbol": "b3f26ecf-1a50-48a1-b73e-5ec4de51b76b",
			"object": "125f6aa0-1dd9-4213-86f6-dc7291aefdf4"
		},
		"b3f26ecf-1a50-48a1-b73e-5ec4de51b76b": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 244,
			"y": 51,
			"object": "f3082f0e-d384-4cf3-aaba-342d43a7ba2a"
		},
		"6a311d3f-fca1-4efe-be29-e539c2f569b0": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "286,72 336,72",
			"sourceSymbol": "b3f26ecf-1a50-48a1-b73e-5ec4de51b76b",
			"targetSymbol": "482e02dc-fbcb-4a53-be37-6ac43500fcad",
			"object": "a16d0f36-dffe-4091-ac6c-90d8d57c1652"
		},
		"482e02dc-fbcb-4a53-be37-6ac43500fcad": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 336,
			"y": 42,
			"width": 100,
			"height": 60,
			"object": "e4a51764-b1ad-454a-a2c7-ac2d69115629"
		},
		"d0dd64c6-08c9-4b09-a9d4-79a1fdf4d5c5": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "436,72 486,72",
			"sourceSymbol": "482e02dc-fbcb-4a53-be37-6ac43500fcad",
			"targetSymbol": "32eb3b16-caa6-4657-ad55-d566282aef5d",
			"object": "fdf321e9-6b91-43a1-beb0-f5ac0110ea51"
		},
		"32eb3b16-caa6-4657-ad55-d566282aef5d": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 486,
			"y": 42,
			"width": 100,
			"height": 60,
			"object": "a242532b-042d-4f05-b177-1145b05c085d"
		},
		"57057d8a-cfbc-4d91-929d-4951acba876b": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "586,72 636,72",
			"sourceSymbol": "32eb3b16-caa6-4657-ad55-d566282aef5d",
			"targetSymbol": "eb66a7df-e3d5-4c53-ba4a-8b153c85f2c6",
			"object": "2fe53379-66aa-432f-b635-2bd011c485f4"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"terminateeventdefinition": 2,
			"sequenceflow": 8,
			"startevent": 1,
			"endevent": 3,
			"usertask": 1,
			"scripttask": 2,
			"mailtask": 1,
			"exclusivegateway": 2
		},
		"8360ee03-0181-4d1b-8b86-2700d1a3d9b5": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway2",
			"name": "Department Manager Approval Decision",
			"default": "cb1d5eed-db6b-4e90-b05e-d2886c3ab674"
		},
		"eb66a7df-e3d5-4c53-ba4a-8b153c85f2c6": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 636,
			"y": 51,
			"object": "8360ee03-0181-4d1b-8b86-2700d1a3d9b5"
		},
		"386527ce-b312-4d5d-8b92-56421d964a8f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${usertasks.usertask1.last.decision == \"approve\"}",
			"id": "sequenceflow6",
			"name": "Approved",
			"sourceRef": "8360ee03-0181-4d1b-8b86-2700d1a3d9b5",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"332be9f8-2a15-4e85-945e-e19e7fd2dae2": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "678,72 713,72 713,154.5 747.9999988079071,154.5",
			"sourceSymbol": "eb66a7df-e3d5-4c53-ba4a-8b153c85f2c6",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "386527ce-b312-4d5d-8b92-56421d964a8f"
		},
		"cf192a09-beff-4966-b7ed-b941d99d34b6": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent3",
			"name": "rejected",
			"eventDefinitions": {
				"60786d53-6e79-406f-b183-f175a0cc49e3": {}
			}
		},
		"60786d53-6e79-406f-b183-f175a0cc49e3": {
			"classDefinition": "com.sap.bpm.wfs.TerminateEventDefinition",
			"id": "terminateeventdefinition2"
		},
		"1844d89b-3da3-4ded-b7bd-b79b30d1ea57": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 747.9999988079071,
			"y": -98,
			"width": 35,
			"height": 35,
			"object": "cf192a09-beff-4966-b7ed-b941d99d34b6"
		},
		"cb1d5eed-db6b-4e90-b05e-d2886c3ab674": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow7",
			"name": "Rejected",
			"sourceRef": "8360ee03-0181-4d1b-8b86-2700d1a3d9b5",
			"targetRef": "cf192a09-beff-4966-b7ed-b941d99d34b6"
		},
		"48fc2c71-9513-47cc-882a-d60a8cbffb66": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "678,72 713,72 713,-80.5 747.9999988079071,-80.5",
			"sourceSymbol": "eb66a7df-e3d5-4c53-ba4a-8b153c85f2c6",
			"targetSymbol": "1844d89b-3da3-4ded-b7bd-b79b30d1ea57",
			"object": "cb1d5eed-db6b-4e90-b05e-d2886c3ab674"
		},
		"bf808f31-9a9a-43e3-9b0e-cdc786f54381": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow8",
			"name": "no",
			"sourceRef": "f3082f0e-d384-4cf3-aaba-342d43a7ba2a",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"fd92e422-9287-4c22-846e-5794b49926d0": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "265,72 265,163 750,163",
			"sourceSymbol": "b3f26ecf-1a50-48a1-b73e-5ec4de51b76b",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "bf808f31-9a9a-43e3-9b0e-cdc786f54381"
		}
	}
}