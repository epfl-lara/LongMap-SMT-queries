; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92526 () Bool)

(assert start!92526)

(declare-fun b!1052409 () Bool)

(declare-fun res!701539 () Bool)

(declare-fun e!597507 () Bool)

(assert (=> b!1052409 (=> (not res!701539) (not e!597507))))

(declare-datatypes ((array!66327 0))(
  ( (array!66328 (arr!31903 (Array (_ BitVec 32) (_ BitVec 64))) (size!32439 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66327)

(declare-datatypes ((List!22215 0))(
  ( (Nil!22212) (Cons!22211 (h!23420 (_ BitVec 64)) (t!31522 List!22215)) )
))
(declare-fun arrayNoDuplicates!0 (array!66327 (_ BitVec 32) List!22215) Bool)

(assert (=> b!1052409 (= res!701539 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22212))))

(declare-fun b!1052410 () Bool)

(declare-fun e!597506 () Bool)

(assert (=> b!1052410 (= e!597507 e!597506)))

(declare-fun res!701542 () Bool)

(assert (=> b!1052410 (=> (not res!701542) (not e!597506))))

(declare-fun lt!464744 () array!66327)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66327 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052410 (= res!701542 (arrayContainsKey!0 lt!464744 k!2747 #b00000000000000000000000000000000))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1052410 (= lt!464744 (array!66328 (store (arr!31903 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32439 a!3488)))))

(declare-fun b!1052411 () Bool)

(declare-fun e!597504 () Bool)

(declare-fun e!597509 () Bool)

(assert (=> b!1052411 (= e!597504 e!597509)))

(declare-fun res!701545 () Bool)

(assert (=> b!1052411 (=> res!701545 e!597509)))

(declare-fun lt!464745 () (_ BitVec 32))

(assert (=> b!1052411 (= res!701545 (or (bvsgt lt!464745 i!1381) (bvsle i!1381 lt!464745)))))

(declare-fun b!1052412 () Bool)

(assert (=> b!1052412 (= e!597509 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1052413 () Bool)

(declare-fun e!597511 () Bool)

(assert (=> b!1052413 (= e!597511 true)))

(declare-fun lt!464743 () Bool)

(declare-fun contains!6157 (List!22215 (_ BitVec 64)) Bool)

(assert (=> b!1052413 (= lt!464743 (contains!6157 Nil!22212 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1052414 () Bool)

(declare-fun e!597508 () Bool)

(declare-fun e!597510 () Bool)

(assert (=> b!1052414 (= e!597508 (not e!597510))))

(declare-fun res!701537 () Bool)

(assert (=> b!1052414 (=> res!701537 e!597510)))

(assert (=> b!1052414 (= res!701537 (or (bvsgt lt!464745 i!1381) (bvsle i!1381 lt!464745)))))

(assert (=> b!1052414 e!597504))

(declare-fun res!701541 () Bool)

(assert (=> b!1052414 (=> (not res!701541) (not e!597504))))

(assert (=> b!1052414 (= res!701541 (= (select (store (arr!31903 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464745) k!2747))))

(declare-fun b!1052415 () Bool)

(declare-fun res!701540 () Bool)

(assert (=> b!1052415 (=> res!701540 e!597511)))

(declare-fun noDuplicate!1542 (List!22215) Bool)

(assert (=> b!1052415 (= res!701540 (not (noDuplicate!1542 Nil!22212)))))

(declare-fun b!1052416 () Bool)

(declare-fun res!701546 () Bool)

(assert (=> b!1052416 (=> (not res!701546) (not e!597507))))

(assert (=> b!1052416 (= res!701546 (= (select (arr!31903 a!3488) i!1381) k!2747))))

(declare-fun res!701536 () Bool)

(assert (=> start!92526 (=> (not res!701536) (not e!597507))))

(assert (=> start!92526 (= res!701536 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32439 a!3488)) (bvslt (size!32439 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92526 e!597507))

(assert (=> start!92526 true))

(declare-fun array_inv!24683 (array!66327) Bool)

(assert (=> start!92526 (array_inv!24683 a!3488)))

(declare-fun b!1052417 () Bool)

(assert (=> b!1052417 (= e!597510 e!597511)))

(declare-fun res!701543 () Bool)

(assert (=> b!1052417 (=> res!701543 e!597511)))

(declare-fun lt!464747 () (_ BitVec 32))

(assert (=> b!1052417 (= res!701543 (or (bvslt lt!464745 #b00000000000000000000000000000000) (bvsge lt!464747 (size!32439 a!3488)) (bvsge lt!464745 (size!32439 a!3488))))))

(assert (=> b!1052417 (arrayContainsKey!0 a!3488 k!2747 lt!464747)))

(declare-datatypes ((Unit!34478 0))(
  ( (Unit!34479) )
))
(declare-fun lt!464746 () Unit!34478)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66327 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34478)

(assert (=> b!1052417 (= lt!464746 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!464747))))

(assert (=> b!1052417 (= lt!464747 (bvadd #b00000000000000000000000000000001 lt!464745))))

(assert (=> b!1052417 (arrayNoDuplicates!0 a!3488 lt!464745 Nil!22212)))

(declare-fun lt!464748 () Unit!34478)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66327 (_ BitVec 32) (_ BitVec 32)) Unit!34478)

(assert (=> b!1052417 (= lt!464748 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464745))))

(declare-fun b!1052418 () Bool)

(assert (=> b!1052418 (= e!597506 e!597508)))

(declare-fun res!701538 () Bool)

(assert (=> b!1052418 (=> (not res!701538) (not e!597508))))

(assert (=> b!1052418 (= res!701538 (not (= lt!464745 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66327 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052418 (= lt!464745 (arrayScanForKey!0 lt!464744 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052419 () Bool)

(declare-fun res!701535 () Bool)

(assert (=> b!1052419 (=> (not res!701535) (not e!597507))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052419 (= res!701535 (validKeyInArray!0 k!2747))))

(declare-fun b!1052420 () Bool)

(declare-fun res!701544 () Bool)

(assert (=> b!1052420 (=> res!701544 e!597511)))

(assert (=> b!1052420 (= res!701544 (contains!6157 Nil!22212 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!92526 res!701536) b!1052409))

(assert (= (and b!1052409 res!701539) b!1052419))

(assert (= (and b!1052419 res!701535) b!1052416))

(assert (= (and b!1052416 res!701546) b!1052410))

(assert (= (and b!1052410 res!701542) b!1052418))

(assert (= (and b!1052418 res!701538) b!1052414))

(assert (= (and b!1052414 res!701541) b!1052411))

(assert (= (and b!1052411 (not res!701545)) b!1052412))

(assert (= (and b!1052414 (not res!701537)) b!1052417))

(assert (= (and b!1052417 (not res!701543)) b!1052415))

(assert (= (and b!1052415 (not res!701540)) b!1052420))

(assert (= (and b!1052420 (not res!701544)) b!1052413))

(declare-fun m!972791 () Bool)

(assert (=> b!1052412 m!972791))

(declare-fun m!972793 () Bool)

(assert (=> b!1052410 m!972793))

(declare-fun m!972795 () Bool)

(assert (=> b!1052410 m!972795))

(declare-fun m!972797 () Bool)

(assert (=> b!1052413 m!972797))

(declare-fun m!972799 () Bool)

(assert (=> b!1052415 m!972799))

(declare-fun m!972801 () Bool)

(assert (=> b!1052420 m!972801))

(declare-fun m!972803 () Bool)

(assert (=> b!1052409 m!972803))

(declare-fun m!972805 () Bool)

(assert (=> b!1052416 m!972805))

(declare-fun m!972807 () Bool)

(assert (=> b!1052418 m!972807))

(assert (=> b!1052414 m!972795))

(declare-fun m!972809 () Bool)

(assert (=> b!1052414 m!972809))

(declare-fun m!972811 () Bool)

(assert (=> start!92526 m!972811))

(declare-fun m!972813 () Bool)

(assert (=> b!1052419 m!972813))

(declare-fun m!972815 () Bool)

(assert (=> b!1052417 m!972815))

(declare-fun m!972817 () Bool)

(assert (=> b!1052417 m!972817))

(declare-fun m!972819 () Bool)

(assert (=> b!1052417 m!972819))

(declare-fun m!972821 () Bool)

(assert (=> b!1052417 m!972821))

(push 1)

(assert (not b!1052420))

(assert (not b!1052415))

(assert (not b!1052419))

(assert (not b!1052417))

(assert (not b!1052410))

(assert (not b!1052412))

(assert (not b!1052413))

(assert (not b!1052418))

(assert (not start!92526))

(assert (not b!1052409))

(check-sat)

(pop 1)

