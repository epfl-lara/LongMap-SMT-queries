; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92260 () Bool)

(assert start!92260)

(declare-fun b!1048389 () Bool)

(declare-fun e!594648 () Bool)

(declare-fun e!594650 () Bool)

(assert (=> b!1048389 (= e!594648 e!594650)))

(declare-fun res!697603 () Bool)

(assert (=> b!1048389 (=> (not res!697603) (not e!594650))))

(declare-datatypes ((array!66002 0))(
  ( (array!66003 (arr!31740 (Array (_ BitVec 32) (_ BitVec 64))) (size!32278 (_ BitVec 32))) )
))
(declare-fun lt!463024 () array!66002)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66002 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048389 (= res!697603 (arrayContainsKey!0 lt!463024 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66002)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1048389 (= lt!463024 (array!66003 (store (arr!31740 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32278 a!3488)))))

(declare-fun res!697605 () Bool)

(assert (=> start!92260 (=> (not res!697605) (not e!594648))))

(assert (=> start!92260 (= res!697605 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32278 a!3488)) (bvslt (size!32278 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92260 e!594648))

(assert (=> start!92260 true))

(declare-fun array_inv!24523 (array!66002) Bool)

(assert (=> start!92260 (array_inv!24523 a!3488)))

(declare-fun b!1048390 () Bool)

(declare-fun res!697606 () Bool)

(assert (=> b!1048390 (=> (not res!697606) (not e!594648))))

(assert (=> b!1048390 (= res!697606 (= (select (arr!31740 a!3488) i!1381) k0!2747))))

(declare-fun b!1048391 () Bool)

(declare-fun res!697604 () Bool)

(assert (=> b!1048391 (=> (not res!697604) (not e!594648))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048391 (= res!697604 (validKeyInArray!0 k0!2747))))

(declare-fun b!1048392 () Bool)

(declare-fun e!594646 () Bool)

(assert (=> b!1048392 (= e!594646 (not true))))

(declare-fun e!594651 () Bool)

(assert (=> b!1048392 e!594651))

(declare-fun res!697600 () Bool)

(assert (=> b!1048392 (=> (not res!697600) (not e!594651))))

(declare-fun lt!463023 () (_ BitVec 32))

(assert (=> b!1048392 (= res!697600 (= (select (store (arr!31740 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463023) k0!2747))))

(declare-fun b!1048393 () Bool)

(assert (=> b!1048393 (= e!594650 e!594646)))

(declare-fun res!697601 () Bool)

(assert (=> b!1048393 (=> (not res!697601) (not e!594646))))

(assert (=> b!1048393 (= res!697601 (not (= lt!463023 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66002 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048393 (= lt!463023 (arrayScanForKey!0 lt!463024 k0!2747 #b00000000000000000000000000000000))))

(declare-fun e!594649 () Bool)

(declare-fun b!1048394 () Bool)

(assert (=> b!1048394 (= e!594649 (arrayContainsKey!0 a!3488 k0!2747 lt!463023))))

(declare-fun b!1048395 () Bool)

(declare-fun res!697602 () Bool)

(assert (=> b!1048395 (=> (not res!697602) (not e!594648))))

(declare-datatypes ((List!22111 0))(
  ( (Nil!22108) (Cons!22107 (h!23316 (_ BitVec 64)) (t!31409 List!22111)) )
))
(declare-fun arrayNoDuplicates!0 (array!66002 (_ BitVec 32) List!22111) Bool)

(assert (=> b!1048395 (= res!697602 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22108))))

(declare-fun b!1048396 () Bool)

(assert (=> b!1048396 (= e!594651 e!594649)))

(declare-fun res!697599 () Bool)

(assert (=> b!1048396 (=> res!697599 e!594649)))

(assert (=> b!1048396 (= res!697599 (bvsle lt!463023 i!1381))))

(assert (= (and start!92260 res!697605) b!1048395))

(assert (= (and b!1048395 res!697602) b!1048391))

(assert (= (and b!1048391 res!697604) b!1048390))

(assert (= (and b!1048390 res!697606) b!1048389))

(assert (= (and b!1048389 res!697603) b!1048393))

(assert (= (and b!1048393 res!697601) b!1048392))

(assert (= (and b!1048392 res!697600) b!1048396))

(assert (= (and b!1048396 (not res!697599)) b!1048394))

(declare-fun m!968869 () Bool)

(assert (=> b!1048393 m!968869))

(declare-fun m!968871 () Bool)

(assert (=> b!1048392 m!968871))

(declare-fun m!968873 () Bool)

(assert (=> b!1048392 m!968873))

(declare-fun m!968875 () Bool)

(assert (=> start!92260 m!968875))

(declare-fun m!968877 () Bool)

(assert (=> b!1048389 m!968877))

(assert (=> b!1048389 m!968871))

(declare-fun m!968879 () Bool)

(assert (=> b!1048391 m!968879))

(declare-fun m!968881 () Bool)

(assert (=> b!1048390 m!968881))

(declare-fun m!968883 () Bool)

(assert (=> b!1048395 m!968883))

(declare-fun m!968885 () Bool)

(assert (=> b!1048394 m!968885))

(check-sat (not b!1048394) (not b!1048391) (not b!1048395) (not b!1048389) (not b!1048393) (not start!92260))
(check-sat)
