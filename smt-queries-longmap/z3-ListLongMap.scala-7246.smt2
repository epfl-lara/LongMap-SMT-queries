; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92540 () Bool)

(assert start!92540)

(declare-fun b!1052619 () Bool)

(declare-fun e!597664 () Bool)

(assert (=> b!1052619 (= e!597664 true)))

(declare-datatypes ((array!66341 0))(
  ( (array!66342 (arr!31910 (Array (_ BitVec 32) (_ BitVec 64))) (size!32446 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66341)

(declare-fun lt!464873 () (_ BitVec 32))

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1052619 (not (= (select (arr!31910 a!3488) lt!464873) k0!2747))))

(declare-datatypes ((Unit!34492 0))(
  ( (Unit!34493) )
))
(declare-fun lt!464870 () Unit!34492)

(declare-datatypes ((List!22222 0))(
  ( (Nil!22219) (Cons!22218 (h!23427 (_ BitVec 64)) (t!31529 List!22222)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66341 (_ BitVec 64) (_ BitVec 32) List!22222) Unit!34492)

(assert (=> b!1052619 (= lt!464870 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k0!2747 lt!464873 Nil!22219))))

(declare-fun lt!464869 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66341 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052619 (arrayContainsKey!0 a!3488 k0!2747 lt!464869)))

(declare-fun lt!464871 () Unit!34492)

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66341 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34492)

(assert (=> b!1052619 (= lt!464871 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!464869))))

(assert (=> b!1052619 (= lt!464869 (bvadd #b00000000000000000000000000000001 lt!464873))))

(declare-fun arrayNoDuplicates!0 (array!66341 (_ BitVec 32) List!22222) Bool)

(assert (=> b!1052619 (arrayNoDuplicates!0 a!3488 lt!464873 Nil!22219)))

(declare-fun lt!464872 () Unit!34492)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66341 (_ BitVec 32) (_ BitVec 32)) Unit!34492)

(assert (=> b!1052619 (= lt!464872 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464873))))

(declare-fun b!1052620 () Bool)

(declare-fun e!597660 () Bool)

(declare-fun e!597663 () Bool)

(assert (=> b!1052620 (= e!597660 e!597663)))

(declare-fun res!701750 () Bool)

(assert (=> b!1052620 (=> (not res!701750) (not e!597663))))

(assert (=> b!1052620 (= res!701750 (not (= lt!464873 i!1381)))))

(declare-fun lt!464874 () array!66341)

(declare-fun arrayScanForKey!0 (array!66341 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052620 (= lt!464873 (arrayScanForKey!0 lt!464874 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052621 () Bool)

(declare-fun e!597659 () Bool)

(assert (=> b!1052621 (= e!597659 e!597660)))

(declare-fun res!701753 () Bool)

(assert (=> b!1052621 (=> (not res!701753) (not e!597660))))

(assert (=> b!1052621 (= res!701753 (arrayContainsKey!0 lt!464874 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052621 (= lt!464874 (array!66342 (store (arr!31910 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32446 a!3488)))))

(declare-fun b!1052622 () Bool)

(declare-fun e!597661 () Bool)

(declare-fun e!597658 () Bool)

(assert (=> b!1052622 (= e!597661 e!597658)))

(declare-fun res!701747 () Bool)

(assert (=> b!1052622 (=> res!701747 e!597658)))

(assert (=> b!1052622 (= res!701747 (or (bvsgt lt!464873 i!1381) (bvsle i!1381 lt!464873)))))

(declare-fun b!1052623 () Bool)

(declare-fun res!701748 () Bool)

(assert (=> b!1052623 (=> (not res!701748) (not e!597659))))

(assert (=> b!1052623 (= res!701748 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22219))))

(declare-fun b!1052624 () Bool)

(declare-fun res!701746 () Bool)

(assert (=> b!1052624 (=> (not res!701746) (not e!597659))))

(assert (=> b!1052624 (= res!701746 (= (select (arr!31910 a!3488) i!1381) k0!2747))))

(declare-fun b!1052625 () Bool)

(declare-fun res!701752 () Bool)

(assert (=> b!1052625 (=> (not res!701752) (not e!597659))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052625 (= res!701752 (validKeyInArray!0 k0!2747))))

(declare-fun b!1052626 () Bool)

(assert (=> b!1052626 (= e!597658 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1052627 () Bool)

(assert (=> b!1052627 (= e!597663 (not e!597664))))

(declare-fun res!701745 () Bool)

(assert (=> b!1052627 (=> res!701745 e!597664)))

(assert (=> b!1052627 (= res!701745 (or (bvsgt lt!464873 i!1381) (bvsle i!1381 lt!464873)))))

(assert (=> b!1052627 e!597661))

(declare-fun res!701751 () Bool)

(assert (=> b!1052627 (=> (not res!701751) (not e!597661))))

(assert (=> b!1052627 (= res!701751 (= (select (store (arr!31910 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464873) k0!2747))))

(declare-fun res!701749 () Bool)

(assert (=> start!92540 (=> (not res!701749) (not e!597659))))

(assert (=> start!92540 (= res!701749 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32446 a!3488)) (bvslt (size!32446 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92540 e!597659))

(assert (=> start!92540 true))

(declare-fun array_inv!24690 (array!66341) Bool)

(assert (=> start!92540 (array_inv!24690 a!3488)))

(assert (= (and start!92540 res!701749) b!1052623))

(assert (= (and b!1052623 res!701748) b!1052625))

(assert (= (and b!1052625 res!701752) b!1052624))

(assert (= (and b!1052624 res!701746) b!1052621))

(assert (= (and b!1052621 res!701753) b!1052620))

(assert (= (and b!1052620 res!701750) b!1052627))

(assert (= (and b!1052627 res!701751) b!1052622))

(assert (= (and b!1052622 (not res!701747)) b!1052626))

(assert (= (and b!1052627 (not res!701745)) b!1052619))

(declare-fun m!973007 () Bool)

(assert (=> b!1052623 m!973007))

(declare-fun m!973009 () Bool)

(assert (=> b!1052625 m!973009))

(declare-fun m!973011 () Bool)

(assert (=> b!1052624 m!973011))

(declare-fun m!973013 () Bool)

(assert (=> b!1052621 m!973013))

(declare-fun m!973015 () Bool)

(assert (=> b!1052621 m!973015))

(assert (=> b!1052627 m!973015))

(declare-fun m!973017 () Bool)

(assert (=> b!1052627 m!973017))

(declare-fun m!973019 () Bool)

(assert (=> b!1052626 m!973019))

(declare-fun m!973021 () Bool)

(assert (=> b!1052620 m!973021))

(declare-fun m!973023 () Bool)

(assert (=> b!1052619 m!973023))

(declare-fun m!973025 () Bool)

(assert (=> b!1052619 m!973025))

(declare-fun m!973027 () Bool)

(assert (=> b!1052619 m!973027))

(declare-fun m!973029 () Bool)

(assert (=> b!1052619 m!973029))

(declare-fun m!973031 () Bool)

(assert (=> b!1052619 m!973031))

(declare-fun m!973033 () Bool)

(assert (=> b!1052619 m!973033))

(declare-fun m!973035 () Bool)

(assert (=> start!92540 m!973035))

(check-sat (not b!1052626) (not b!1052619) (not b!1052623) (not b!1052620) (not b!1052621) (not start!92540) (not b!1052625))
(check-sat)
