; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92590 () Bool)

(assert start!92590)

(declare-fun b!1053001 () Bool)

(declare-fun res!702127 () Bool)

(declare-fun e!597936 () Bool)

(assert (=> b!1053001 (=> (not res!702127) (not e!597936))))

(declare-datatypes ((array!66391 0))(
  ( (array!66392 (arr!31935 (Array (_ BitVec 32) (_ BitVec 64))) (size!32471 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66391)

(declare-datatypes ((List!22247 0))(
  ( (Nil!22244) (Cons!22243 (h!23452 (_ BitVec 64)) (t!31554 List!22247)) )
))
(declare-fun arrayNoDuplicates!0 (array!66391 (_ BitVec 32) List!22247) Bool)

(assert (=> b!1053001 (= res!702127 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22244))))

(declare-fun b!1053002 () Bool)

(declare-fun res!702129 () Bool)

(assert (=> b!1053002 (=> (not res!702129) (not e!597936))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053002 (= res!702129 (validKeyInArray!0 k!2747))))

(declare-fun res!702128 () Bool)

(assert (=> start!92590 (=> (not res!702128) (not e!597936))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> start!92590 (= res!702128 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32471 a!3488)) (bvslt (size!32471 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92590 e!597936))

(assert (=> start!92590 true))

(declare-fun array_inv!24715 (array!66391) Bool)

(assert (=> start!92590 (array_inv!24715 a!3488)))

(declare-fun lt!465027 () array!66391)

(declare-fun b!1053003 () Bool)

(declare-fun e!597935 () Bool)

(declare-fun arrayScanForKey!0 (array!66391 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053003 (= e!597935 (= (arrayScanForKey!0 lt!465027 k!2747 #b00000000000000000000000000000000) i!1381))))

(declare-fun b!1053004 () Bool)

(assert (=> b!1053004 (= e!597936 e!597935)))

(declare-fun res!702131 () Bool)

(assert (=> b!1053004 (=> (not res!702131) (not e!597935))))

(declare-fun arrayContainsKey!0 (array!66391 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053004 (= res!702131 (arrayContainsKey!0 lt!465027 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053004 (= lt!465027 (array!66392 (store (arr!31935 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32471 a!3488)))))

(declare-fun b!1053005 () Bool)

(declare-fun res!702130 () Bool)

(assert (=> b!1053005 (=> (not res!702130) (not e!597936))))

(assert (=> b!1053005 (= res!702130 (= (select (arr!31935 a!3488) i!1381) k!2747))))

(assert (= (and start!92590 res!702128) b!1053001))

(assert (= (and b!1053001 res!702127) b!1053002))

(assert (= (and b!1053002 res!702129) b!1053005))

(assert (= (and b!1053005 res!702130) b!1053004))

(assert (= (and b!1053004 res!702131) b!1053003))

(declare-fun m!973389 () Bool)

(assert (=> b!1053003 m!973389))

(declare-fun m!973391 () Bool)

(assert (=> b!1053001 m!973391))

(declare-fun m!973393 () Bool)

(assert (=> b!1053005 m!973393))

(declare-fun m!973395 () Bool)

(assert (=> b!1053004 m!973395))

(declare-fun m!973397 () Bool)

(assert (=> b!1053004 m!973397))

(declare-fun m!973399 () Bool)

(assert (=> b!1053002 m!973399))

(declare-fun m!973401 () Bool)

(assert (=> start!92590 m!973401))

(push 1)

(assert (not b!1053003))

(assert (not b!1053004))

(assert (not b!1053001))

(assert (not start!92590))

(assert (not b!1053002))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!127803 () Bool)

(assert (=> d!127803 (= (array_inv!24715 a!3488) (bvsge (size!32471 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92590 d!127803))

(declare-fun d!127807 () Bool)

(declare-fun res!702148 () Bool)

(declare-fun e!597954 () Bool)

(assert (=> d!127807 (=> res!702148 e!597954)))

(assert (=> d!127807 (= res!702148 (= (select (arr!31935 lt!465027) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!127807 (= (arrayContainsKey!0 lt!465027 k!2747 #b00000000000000000000000000000000) e!597954)))

(declare-fun b!1053022 () Bool)

(declare-fun e!597955 () Bool)

(assert (=> b!1053022 (= e!597954 e!597955)))

(declare-fun res!702149 () Bool)

(assert (=> b!1053022 (=> (not res!702149) (not e!597955))))

(assert (=> b!1053022 (= res!702149 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32471 lt!465027)))))

(declare-fun b!1053023 () Bool)

(assert (=> b!1053023 (= e!597955 (arrayContainsKey!0 lt!465027 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127807 (not res!702148)) b!1053022))

(assert (= (and b!1053022 res!702149) b!1053023))

(declare-fun m!973411 () Bool)

(assert (=> d!127807 m!973411))

(declare-fun m!973413 () Bool)

(assert (=> b!1053023 m!973413))

(assert (=> b!1053004 d!127807))

(declare-fun d!127811 () Bool)

(declare-fun lt!465030 () (_ BitVec 32))

(assert (=> d!127811 (and (or (bvslt lt!465030 #b00000000000000000000000000000000) (bvsge lt!465030 (size!32471 lt!465027)) (and (bvsge lt!465030 #b00000000000000000000000000000000) (bvslt lt!465030 (size!32471 lt!465027)))) (bvsge lt!465030 #b00000000000000000000000000000000) (bvslt lt!465030 (size!32471 lt!465027)) (= (select (arr!31935 lt!465027) lt!465030) k!2747))))

(declare-fun e!597982 () (_ BitVec 32))

(assert (=> d!127811 (= lt!465030 e!597982)))

(declare-fun c!106905 () Bool)

(assert (=> d!127811 (= c!106905 (= (select (arr!31935 lt!465027) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!127811 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32471 lt!465027)) (bvslt (size!32471 lt!465027) #b01111111111111111111111111111111))))

(assert (=> d!127811 (= (arrayScanForKey!0 lt!465027 k!2747 #b00000000000000000000000000000000) lt!465030)))

(declare-fun b!1053058 () Bool)

(assert (=> b!1053058 (= e!597982 #b00000000000000000000000000000000)))

(declare-fun b!1053059 () Bool)

(assert (=> b!1053059 (= e!597982 (arrayScanForKey!0 lt!465027 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127811 c!106905) b!1053058))

(assert (= (and d!127811 (not c!106905)) b!1053059))

(declare-fun m!973425 () Bool)

(assert (=> d!127811 m!973425))

(assert (=> d!127811 m!973411))

(declare-fun m!973429 () Bool)

(assert (=> b!1053059 m!973429))

(assert (=> b!1053003 d!127811))

(declare-fun d!127815 () Bool)

(assert (=> d!127815 (= (validKeyInArray!0 k!2747) (and (not (= k!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

