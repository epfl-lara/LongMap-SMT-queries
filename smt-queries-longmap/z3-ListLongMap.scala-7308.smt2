; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93448 () Bool)

(assert start!93448)

(declare-fun b!1058372 () Bool)

(declare-fun e!602124 () Bool)

(assert (=> b!1058372 (= e!602124 true)))

(declare-datatypes ((array!66692 0))(
  ( (array!66693 (arr!32064 (Array (_ BitVec 32) (_ BitVec 64))) (size!32602 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66692)

(declare-fun lt!466746 () (_ BitVec 32))

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1058372 (not (= (select (arr!32064 a!3488) lt!466746) k0!2747))))

(declare-datatypes ((Unit!34583 0))(
  ( (Unit!34584) )
))
(declare-fun lt!466745 () Unit!34583)

(declare-datatypes ((List!22435 0))(
  ( (Nil!22432) (Cons!22431 (h!23640 (_ BitVec 64)) (t!31733 List!22435)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66692 (_ BitVec 64) (_ BitVec 32) List!22435) Unit!34583)

(assert (=> b!1058372 (= lt!466745 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k0!2747 lt!466746 Nil!22432))))

(declare-fun lt!466750 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66692 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058372 (arrayContainsKey!0 a!3488 k0!2747 lt!466750)))

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun lt!466748 () Unit!34583)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66692 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34583)

(assert (=> b!1058372 (= lt!466748 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!466750))))

(assert (=> b!1058372 (= lt!466750 (bvadd #b00000000000000000000000000000001 lt!466746))))

(declare-fun arrayNoDuplicates!0 (array!66692 (_ BitVec 32) List!22435) Bool)

(assert (=> b!1058372 (arrayNoDuplicates!0 a!3488 lt!466746 Nil!22432)))

(declare-fun lt!466747 () Unit!34583)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66692 (_ BitVec 32) (_ BitVec 32)) Unit!34583)

(assert (=> b!1058372 (= lt!466747 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466746))))

(declare-fun b!1058373 () Bool)

(declare-fun e!602127 () Bool)

(assert (=> b!1058373 (= e!602127 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1058374 () Bool)

(declare-fun res!707031 () Bool)

(declare-fun e!602123 () Bool)

(assert (=> b!1058374 (=> (not res!707031) (not e!602123))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058374 (= res!707031 (validKeyInArray!0 k0!2747))))

(declare-fun res!707037 () Bool)

(assert (=> start!93448 (=> (not res!707037) (not e!602123))))

(assert (=> start!93448 (= res!707037 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32602 a!3488)) (bvslt (size!32602 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93448 e!602123))

(assert (=> start!93448 true))

(declare-fun array_inv!24847 (array!66692) Bool)

(assert (=> start!93448 (array_inv!24847 a!3488)))

(declare-fun b!1058375 () Bool)

(declare-fun res!707034 () Bool)

(assert (=> b!1058375 (=> (not res!707034) (not e!602123))))

(assert (=> b!1058375 (= res!707034 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22432))))

(declare-fun b!1058376 () Bool)

(declare-fun e!602126 () Bool)

(assert (=> b!1058376 (= e!602126 (not e!602124))))

(declare-fun res!707038 () Bool)

(assert (=> b!1058376 (=> res!707038 e!602124)))

(assert (=> b!1058376 (= res!707038 (or (bvsgt lt!466746 i!1381) (bvsle i!1381 lt!466746)))))

(declare-fun e!602125 () Bool)

(assert (=> b!1058376 e!602125))

(declare-fun res!707030 () Bool)

(assert (=> b!1058376 (=> (not res!707030) (not e!602125))))

(assert (=> b!1058376 (= res!707030 (= (select (store (arr!32064 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466746) k0!2747))))

(declare-fun b!1058377 () Bool)

(declare-fun res!707035 () Bool)

(assert (=> b!1058377 (=> (not res!707035) (not e!602123))))

(assert (=> b!1058377 (= res!707035 (= (select (arr!32064 a!3488) i!1381) k0!2747))))

(declare-fun b!1058378 () Bool)

(assert (=> b!1058378 (= e!602125 e!602127)))

(declare-fun res!707036 () Bool)

(assert (=> b!1058378 (=> res!707036 e!602127)))

(assert (=> b!1058378 (= res!707036 (or (bvsgt lt!466746 i!1381) (bvsle i!1381 lt!466746)))))

(declare-fun b!1058379 () Bool)

(declare-fun e!602122 () Bool)

(assert (=> b!1058379 (= e!602123 e!602122)))

(declare-fun res!707032 () Bool)

(assert (=> b!1058379 (=> (not res!707032) (not e!602122))))

(declare-fun lt!466749 () array!66692)

(assert (=> b!1058379 (= res!707032 (arrayContainsKey!0 lt!466749 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1058379 (= lt!466749 (array!66693 (store (arr!32064 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32602 a!3488)))))

(declare-fun b!1058380 () Bool)

(assert (=> b!1058380 (= e!602122 e!602126)))

(declare-fun res!707033 () Bool)

(assert (=> b!1058380 (=> (not res!707033) (not e!602126))))

(assert (=> b!1058380 (= res!707033 (not (= lt!466746 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66692 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058380 (= lt!466746 (arrayScanForKey!0 lt!466749 k0!2747 #b00000000000000000000000000000000))))

(assert (= (and start!93448 res!707037) b!1058375))

(assert (= (and b!1058375 res!707034) b!1058374))

(assert (= (and b!1058374 res!707031) b!1058377))

(assert (= (and b!1058377 res!707035) b!1058379))

(assert (= (and b!1058379 res!707032) b!1058380))

(assert (= (and b!1058380 res!707033) b!1058376))

(assert (= (and b!1058376 res!707030) b!1058378))

(assert (= (and b!1058378 (not res!707036)) b!1058373))

(assert (= (and b!1058376 (not res!707038)) b!1058372))

(declare-fun m!977543 () Bool)

(assert (=> b!1058374 m!977543))

(declare-fun m!977545 () Bool)

(assert (=> b!1058376 m!977545))

(declare-fun m!977547 () Bool)

(assert (=> b!1058376 m!977547))

(declare-fun m!977549 () Bool)

(assert (=> b!1058379 m!977549))

(assert (=> b!1058379 m!977545))

(declare-fun m!977551 () Bool)

(assert (=> b!1058375 m!977551))

(declare-fun m!977553 () Bool)

(assert (=> b!1058373 m!977553))

(declare-fun m!977555 () Bool)

(assert (=> b!1058372 m!977555))

(declare-fun m!977557 () Bool)

(assert (=> b!1058372 m!977557))

(declare-fun m!977559 () Bool)

(assert (=> b!1058372 m!977559))

(declare-fun m!977561 () Bool)

(assert (=> b!1058372 m!977561))

(declare-fun m!977563 () Bool)

(assert (=> b!1058372 m!977563))

(declare-fun m!977565 () Bool)

(assert (=> b!1058372 m!977565))

(declare-fun m!977567 () Bool)

(assert (=> b!1058380 m!977567))

(declare-fun m!977569 () Bool)

(assert (=> b!1058377 m!977569))

(declare-fun m!977571 () Bool)

(assert (=> start!93448 m!977571))

(check-sat (not b!1058374) (not b!1058380) (not b!1058379) (not b!1058372) (not start!93448) (not b!1058373) (not b!1058375))
(check-sat)
