; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93678 () Bool)

(assert start!93678)

(declare-fun e!602997 () Bool)

(declare-datatypes ((array!66796 0))(
  ( (array!66797 (arr!32110 (Array (_ BitVec 32) (_ BitVec 64))) (size!32647 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66796)

(declare-fun b!1059757 () Bool)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66796 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1059757 (= e!602997 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1059758 () Bool)

(declare-fun e!602993 () Bool)

(declare-fun e!602998 () Bool)

(assert (=> b!1059758 (= e!602993 e!602998)))

(declare-fun res!707533 () Bool)

(assert (=> b!1059758 (=> (not res!707533) (not e!602998))))

(declare-fun lt!467406 () (_ BitVec 32))

(assert (=> b!1059758 (= res!707533 (not (= lt!467406 i!1381)))))

(declare-fun lt!467407 () array!66796)

(declare-fun arrayScanForKey!0 (array!66796 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1059758 (= lt!467406 (arrayScanForKey!0 lt!467407 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1059759 () Bool)

(declare-fun e!602996 () Bool)

(assert (=> b!1059759 (= e!602996 true)))

(assert (=> b!1059759 (not (= (select (arr!32110 a!3488) lt!467406) k0!2747))))

(declare-datatypes ((Unit!34711 0))(
  ( (Unit!34712) )
))
(declare-fun lt!467410 () Unit!34711)

(declare-datatypes ((List!22392 0))(
  ( (Nil!22389) (Cons!22388 (h!23606 (_ BitVec 64)) (t!31691 List!22392)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66796 (_ BitVec 64) (_ BitVec 32) List!22392) Unit!34711)

(assert (=> b!1059759 (= lt!467410 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k0!2747 lt!467406 Nil!22389))))

(declare-fun lt!467409 () (_ BitVec 32))

(assert (=> b!1059759 (arrayContainsKey!0 a!3488 k0!2747 lt!467409)))

(declare-fun lt!467408 () Unit!34711)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66796 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34711)

(assert (=> b!1059759 (= lt!467408 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!467409))))

(assert (=> b!1059759 (= lt!467409 (bvadd #b00000000000000000000000000000001 lt!467406))))

(declare-fun arrayNoDuplicates!0 (array!66796 (_ BitVec 32) List!22392) Bool)

(assert (=> b!1059759 (arrayNoDuplicates!0 a!3488 lt!467406 Nil!22389)))

(declare-fun lt!467411 () Unit!34711)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66796 (_ BitVec 32) (_ BitVec 32)) Unit!34711)

(assert (=> b!1059759 (= lt!467411 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!467406))))

(declare-fun res!707534 () Bool)

(declare-fun e!602995 () Bool)

(assert (=> start!93678 (=> (not res!707534) (not e!602995))))

(assert (=> start!93678 (= res!707534 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32647 a!3488)) (bvslt (size!32647 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93678 e!602995))

(assert (=> start!93678 true))

(declare-fun array_inv!24892 (array!66796) Bool)

(assert (=> start!93678 (array_inv!24892 a!3488)))

(declare-fun b!1059760 () Bool)

(declare-fun res!707532 () Bool)

(assert (=> b!1059760 (=> (not res!707532) (not e!602995))))

(assert (=> b!1059760 (= res!707532 (= (select (arr!32110 a!3488) i!1381) k0!2747))))

(declare-fun b!1059761 () Bool)

(declare-fun res!707526 () Bool)

(assert (=> b!1059761 (=> (not res!707526) (not e!602995))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1059761 (= res!707526 (validKeyInArray!0 k0!2747))))

(declare-fun b!1059762 () Bool)

(assert (=> b!1059762 (= e!602995 e!602993)))

(declare-fun res!707527 () Bool)

(assert (=> b!1059762 (=> (not res!707527) (not e!602993))))

(assert (=> b!1059762 (= res!707527 (arrayContainsKey!0 lt!467407 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1059762 (= lt!467407 (array!66797 (store (arr!32110 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32647 a!3488)))))

(declare-fun b!1059763 () Bool)

(declare-fun res!707530 () Bool)

(assert (=> b!1059763 (=> (not res!707530) (not e!602995))))

(assert (=> b!1059763 (= res!707530 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22389))))

(declare-fun b!1059764 () Bool)

(assert (=> b!1059764 (= e!602998 (not e!602996))))

(declare-fun res!707531 () Bool)

(assert (=> b!1059764 (=> res!707531 e!602996)))

(assert (=> b!1059764 (= res!707531 (or (bvsgt lt!467406 i!1381) (bvsle i!1381 lt!467406)))))

(declare-fun e!602992 () Bool)

(assert (=> b!1059764 e!602992))

(declare-fun res!707528 () Bool)

(assert (=> b!1059764 (=> (not res!707528) (not e!602992))))

(assert (=> b!1059764 (= res!707528 (= (select (store (arr!32110 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!467406) k0!2747))))

(declare-fun b!1059765 () Bool)

(assert (=> b!1059765 (= e!602992 e!602997)))

(declare-fun res!707529 () Bool)

(assert (=> b!1059765 (=> res!707529 e!602997)))

(assert (=> b!1059765 (= res!707529 (or (bvsgt lt!467406 i!1381) (bvsle i!1381 lt!467406)))))

(assert (= (and start!93678 res!707534) b!1059763))

(assert (= (and b!1059763 res!707530) b!1059761))

(assert (= (and b!1059761 res!707526) b!1059760))

(assert (= (and b!1059760 res!707532) b!1059762))

(assert (= (and b!1059762 res!707527) b!1059758))

(assert (= (and b!1059758 res!707533) b!1059764))

(assert (= (and b!1059764 res!707528) b!1059765))

(assert (= (and b!1059765 (not res!707529)) b!1059757))

(assert (= (and b!1059764 (not res!707531)) b!1059759))

(declare-fun m!979745 () Bool)

(assert (=> b!1059757 m!979745))

(declare-fun m!979747 () Bool)

(assert (=> start!93678 m!979747))

(declare-fun m!979749 () Bool)

(assert (=> b!1059761 m!979749))

(declare-fun m!979751 () Bool)

(assert (=> b!1059764 m!979751))

(declare-fun m!979753 () Bool)

(assert (=> b!1059764 m!979753))

(declare-fun m!979755 () Bool)

(assert (=> b!1059759 m!979755))

(declare-fun m!979757 () Bool)

(assert (=> b!1059759 m!979757))

(declare-fun m!979759 () Bool)

(assert (=> b!1059759 m!979759))

(declare-fun m!979761 () Bool)

(assert (=> b!1059759 m!979761))

(declare-fun m!979763 () Bool)

(assert (=> b!1059759 m!979763))

(declare-fun m!979765 () Bool)

(assert (=> b!1059759 m!979765))

(declare-fun m!979767 () Bool)

(assert (=> b!1059758 m!979767))

(declare-fun m!979769 () Bool)

(assert (=> b!1059763 m!979769))

(declare-fun m!979771 () Bool)

(assert (=> b!1059760 m!979771))

(declare-fun m!979773 () Bool)

(assert (=> b!1059762 m!979773))

(assert (=> b!1059762 m!979751))

(check-sat (not b!1059757) (not b!1059759) (not b!1059758) (not b!1059761) (not start!93678) (not b!1059762) (not b!1059763))
(check-sat)
