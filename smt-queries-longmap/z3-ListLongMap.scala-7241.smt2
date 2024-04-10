; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92510 () Bool)

(assert start!92510)

(declare-fun b!1052121 () Bool)

(declare-fun e!597312 () Bool)

(declare-fun e!597319 () Bool)

(assert (=> b!1052121 (= e!597312 e!597319)))

(declare-fun res!701257 () Bool)

(assert (=> b!1052121 (=> res!701257 e!597319)))

(declare-fun lt!464600 () (_ BitVec 32))

(declare-datatypes ((array!66311 0))(
  ( (array!66312 (arr!31895 (Array (_ BitVec 32) (_ BitVec 64))) (size!32431 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66311)

(declare-fun lt!464604 () (_ BitVec 32))

(assert (=> b!1052121 (= res!701257 (or (bvslt lt!464604 #b00000000000000000000000000000000) (bvsge lt!464600 (size!32431 a!3488)) (bvsge lt!464604 (size!32431 a!3488))))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66311 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052121 (arrayContainsKey!0 a!3488 k0!2747 lt!464600)))

(declare-datatypes ((Unit!34462 0))(
  ( (Unit!34463) )
))
(declare-fun lt!464601 () Unit!34462)

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66311 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34462)

(assert (=> b!1052121 (= lt!464601 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!464600))))

(assert (=> b!1052121 (= lt!464600 (bvadd #b00000000000000000000000000000001 lt!464604))))

(declare-datatypes ((List!22207 0))(
  ( (Nil!22204) (Cons!22203 (h!23412 (_ BitVec 64)) (t!31514 List!22207)) )
))
(declare-fun arrayNoDuplicates!0 (array!66311 (_ BitVec 32) List!22207) Bool)

(assert (=> b!1052121 (arrayNoDuplicates!0 a!3488 lt!464604 Nil!22204)))

(declare-fun lt!464603 () Unit!34462)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66311 (_ BitVec 32) (_ BitVec 32)) Unit!34462)

(assert (=> b!1052121 (= lt!464603 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464604))))

(declare-fun b!1052122 () Bool)

(declare-fun e!597314 () Bool)

(declare-fun e!597313 () Bool)

(assert (=> b!1052122 (= e!597314 e!597313)))

(declare-fun res!701251 () Bool)

(assert (=> b!1052122 (=> (not res!701251) (not e!597313))))

(assert (=> b!1052122 (= res!701251 (not (= lt!464604 i!1381)))))

(declare-fun lt!464599 () array!66311)

(declare-fun arrayScanForKey!0 (array!66311 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052122 (= lt!464604 (arrayScanForKey!0 lt!464599 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052123 () Bool)

(declare-fun res!701252 () Bool)

(declare-fun e!597316 () Bool)

(assert (=> b!1052123 (=> (not res!701252) (not e!597316))))

(assert (=> b!1052123 (= res!701252 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22204))))

(declare-fun res!701253 () Bool)

(assert (=> start!92510 (=> (not res!701253) (not e!597316))))

(assert (=> start!92510 (= res!701253 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32431 a!3488)) (bvslt (size!32431 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92510 e!597316))

(assert (=> start!92510 true))

(declare-fun array_inv!24675 (array!66311) Bool)

(assert (=> start!92510 (array_inv!24675 a!3488)))

(declare-fun e!597315 () Bool)

(declare-fun b!1052124 () Bool)

(assert (=> b!1052124 (= e!597315 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1052125 () Bool)

(assert (=> b!1052125 (= e!597319 true)))

(declare-fun lt!464602 () Bool)

(declare-fun contains!6149 (List!22207 (_ BitVec 64)) Bool)

(assert (=> b!1052125 (= lt!464602 (contains!6149 Nil!22204 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1052126 () Bool)

(declare-fun res!701258 () Bool)

(assert (=> b!1052126 (=> (not res!701258) (not e!597316))))

(assert (=> b!1052126 (= res!701258 (= (select (arr!31895 a!3488) i!1381) k0!2747))))

(declare-fun b!1052127 () Bool)

(declare-fun res!701247 () Bool)

(assert (=> b!1052127 (=> (not res!701247) (not e!597316))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052127 (= res!701247 (validKeyInArray!0 k0!2747))))

(declare-fun b!1052128 () Bool)

(declare-fun res!701256 () Bool)

(assert (=> b!1052128 (=> res!701256 e!597319)))

(assert (=> b!1052128 (= res!701256 (contains!6149 Nil!22204 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1052129 () Bool)

(assert (=> b!1052129 (= e!597313 (not e!597312))))

(declare-fun res!701249 () Bool)

(assert (=> b!1052129 (=> res!701249 e!597312)))

(assert (=> b!1052129 (= res!701249 (or (bvsgt lt!464604 i!1381) (bvsle i!1381 lt!464604)))))

(declare-fun e!597317 () Bool)

(assert (=> b!1052129 e!597317))

(declare-fun res!701250 () Bool)

(assert (=> b!1052129 (=> (not res!701250) (not e!597317))))

(assert (=> b!1052129 (= res!701250 (= (select (store (arr!31895 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464604) k0!2747))))

(declare-fun b!1052130 () Bool)

(declare-fun res!701254 () Bool)

(assert (=> b!1052130 (=> res!701254 e!597319)))

(declare-fun noDuplicate!1534 (List!22207) Bool)

(assert (=> b!1052130 (= res!701254 (not (noDuplicate!1534 Nil!22204)))))

(declare-fun b!1052131 () Bool)

(assert (=> b!1052131 (= e!597316 e!597314)))

(declare-fun res!701248 () Bool)

(assert (=> b!1052131 (=> (not res!701248) (not e!597314))))

(assert (=> b!1052131 (= res!701248 (arrayContainsKey!0 lt!464599 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052131 (= lt!464599 (array!66312 (store (arr!31895 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32431 a!3488)))))

(declare-fun b!1052132 () Bool)

(assert (=> b!1052132 (= e!597317 e!597315)))

(declare-fun res!701255 () Bool)

(assert (=> b!1052132 (=> res!701255 e!597315)))

(assert (=> b!1052132 (= res!701255 (or (bvsgt lt!464604 i!1381) (bvsle i!1381 lt!464604)))))

(assert (= (and start!92510 res!701253) b!1052123))

(assert (= (and b!1052123 res!701252) b!1052127))

(assert (= (and b!1052127 res!701247) b!1052126))

(assert (= (and b!1052126 res!701258) b!1052131))

(assert (= (and b!1052131 res!701248) b!1052122))

(assert (= (and b!1052122 res!701251) b!1052129))

(assert (= (and b!1052129 res!701250) b!1052132))

(assert (= (and b!1052132 (not res!701255)) b!1052124))

(assert (= (and b!1052129 (not res!701249)) b!1052121))

(assert (= (and b!1052121 (not res!701257)) b!1052130))

(assert (= (and b!1052130 (not res!701254)) b!1052128))

(assert (= (and b!1052128 (not res!701256)) b!1052125))

(declare-fun m!972535 () Bool)

(assert (=> b!1052129 m!972535))

(declare-fun m!972537 () Bool)

(assert (=> b!1052129 m!972537))

(declare-fun m!972539 () Bool)

(assert (=> b!1052126 m!972539))

(declare-fun m!972541 () Bool)

(assert (=> b!1052127 m!972541))

(declare-fun m!972543 () Bool)

(assert (=> b!1052130 m!972543))

(declare-fun m!972545 () Bool)

(assert (=> b!1052121 m!972545))

(declare-fun m!972547 () Bool)

(assert (=> b!1052121 m!972547))

(declare-fun m!972549 () Bool)

(assert (=> b!1052121 m!972549))

(declare-fun m!972551 () Bool)

(assert (=> b!1052121 m!972551))

(declare-fun m!972553 () Bool)

(assert (=> b!1052128 m!972553))

(declare-fun m!972555 () Bool)

(assert (=> b!1052122 m!972555))

(declare-fun m!972557 () Bool)

(assert (=> b!1052123 m!972557))

(declare-fun m!972559 () Bool)

(assert (=> b!1052124 m!972559))

(declare-fun m!972561 () Bool)

(assert (=> b!1052131 m!972561))

(assert (=> b!1052131 m!972535))

(declare-fun m!972563 () Bool)

(assert (=> b!1052125 m!972563))

(declare-fun m!972565 () Bool)

(assert (=> start!92510 m!972565))

(check-sat (not b!1052124) (not b!1052131) (not b!1052128) (not b!1052121) (not b!1052125) (not b!1052127) (not start!92510) (not b!1052122) (not b!1052130) (not b!1052123))
(check-sat)
