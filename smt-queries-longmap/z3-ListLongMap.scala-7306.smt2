; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93436 () Bool)

(assert start!93436)

(declare-fun b!1058210 () Bool)

(declare-fun res!706869 () Bool)

(declare-fun e!601998 () Bool)

(assert (=> b!1058210 (=> (not res!706869) (not e!601998))))

(declare-datatypes ((array!66680 0))(
  ( (array!66681 (arr!32058 (Array (_ BitVec 32) (_ BitVec 64))) (size!32596 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66680)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1058210 (= res!706869 (= (select (arr!32058 a!3488) i!1381) k0!2747))))

(declare-fun res!706876 () Bool)

(assert (=> start!93436 (=> (not res!706876) (not e!601998))))

(assert (=> start!93436 (= res!706876 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32596 a!3488)) (bvslt (size!32596 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93436 e!601998))

(assert (=> start!93436 true))

(declare-fun array_inv!24841 (array!66680) Bool)

(assert (=> start!93436 (array_inv!24841 a!3488)))

(declare-fun b!1058211 () Bool)

(declare-fun e!601999 () Bool)

(assert (=> b!1058211 (= e!601998 e!601999)))

(declare-fun res!706870 () Bool)

(assert (=> b!1058211 (=> (not res!706870) (not e!601999))))

(declare-fun lt!466640 () array!66680)

(declare-fun arrayContainsKey!0 (array!66680 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058211 (= res!706870 (arrayContainsKey!0 lt!466640 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1058211 (= lt!466640 (array!66681 (store (arr!32058 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32596 a!3488)))))

(declare-fun b!1058212 () Bool)

(declare-fun res!706875 () Bool)

(assert (=> b!1058212 (=> (not res!706875) (not e!601998))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058212 (= res!706875 (validKeyInArray!0 k0!2747))))

(declare-fun b!1058213 () Bool)

(declare-fun e!602001 () Bool)

(assert (=> b!1058213 (= e!602001 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1058214 () Bool)

(declare-fun e!601996 () Bool)

(assert (=> b!1058214 (= e!601996 e!602001)))

(declare-fun res!706874 () Bool)

(assert (=> b!1058214 (=> res!706874 e!602001)))

(declare-fun lt!466638 () (_ BitVec 32))

(assert (=> b!1058214 (= res!706874 (or (bvsgt lt!466638 i!1381) (bvsle i!1381 lt!466638)))))

(declare-fun b!1058215 () Bool)

(declare-fun e!601995 () Bool)

(declare-fun e!602000 () Bool)

(assert (=> b!1058215 (= e!601995 (not e!602000))))

(declare-fun res!706872 () Bool)

(assert (=> b!1058215 (=> res!706872 e!602000)))

(assert (=> b!1058215 (= res!706872 (or (bvsgt lt!466638 i!1381) (bvsle i!1381 lt!466638)))))

(assert (=> b!1058215 e!601996))

(declare-fun res!706871 () Bool)

(assert (=> b!1058215 (=> (not res!706871) (not e!601996))))

(assert (=> b!1058215 (= res!706871 (= (select (store (arr!32058 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466638) k0!2747))))

(declare-fun b!1058216 () Bool)

(declare-fun res!706873 () Bool)

(assert (=> b!1058216 (=> (not res!706873) (not e!601998))))

(declare-datatypes ((List!22429 0))(
  ( (Nil!22426) (Cons!22425 (h!23634 (_ BitVec 64)) (t!31727 List!22429)) )
))
(declare-fun arrayNoDuplicates!0 (array!66680 (_ BitVec 32) List!22429) Bool)

(assert (=> b!1058216 (= res!706873 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22426))))

(declare-fun b!1058217 () Bool)

(assert (=> b!1058217 (= e!602000 false)))

(assert (=> b!1058217 (not (= (select (arr!32058 a!3488) lt!466638) k0!2747))))

(declare-datatypes ((Unit!34571 0))(
  ( (Unit!34572) )
))
(declare-fun lt!466637 () Unit!34571)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66680 (_ BitVec 64) (_ BitVec 32) List!22429) Unit!34571)

(assert (=> b!1058217 (= lt!466637 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k0!2747 lt!466638 Nil!22426))))

(declare-fun lt!466642 () (_ BitVec 32))

(assert (=> b!1058217 (arrayContainsKey!0 a!3488 k0!2747 lt!466642)))

(declare-fun lt!466639 () Unit!34571)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66680 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34571)

(assert (=> b!1058217 (= lt!466639 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!466642))))

(assert (=> b!1058217 (= lt!466642 (bvadd #b00000000000000000000000000000001 lt!466638))))

(assert (=> b!1058217 (arrayNoDuplicates!0 a!3488 lt!466638 Nil!22426)))

(declare-fun lt!466641 () Unit!34571)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66680 (_ BitVec 32) (_ BitVec 32)) Unit!34571)

(assert (=> b!1058217 (= lt!466641 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466638))))

(declare-fun b!1058218 () Bool)

(assert (=> b!1058218 (= e!601999 e!601995)))

(declare-fun res!706868 () Bool)

(assert (=> b!1058218 (=> (not res!706868) (not e!601995))))

(assert (=> b!1058218 (= res!706868 (not (= lt!466638 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66680 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058218 (= lt!466638 (arrayScanForKey!0 lt!466640 k0!2747 #b00000000000000000000000000000000))))

(assert (= (and start!93436 res!706876) b!1058216))

(assert (= (and b!1058216 res!706873) b!1058212))

(assert (= (and b!1058212 res!706875) b!1058210))

(assert (= (and b!1058210 res!706869) b!1058211))

(assert (= (and b!1058211 res!706870) b!1058218))

(assert (= (and b!1058218 res!706868) b!1058215))

(assert (= (and b!1058215 res!706871) b!1058214))

(assert (= (and b!1058214 (not res!706874)) b!1058213))

(assert (= (and b!1058215 (not res!706872)) b!1058217))

(declare-fun m!977363 () Bool)

(assert (=> b!1058217 m!977363))

(declare-fun m!977365 () Bool)

(assert (=> b!1058217 m!977365))

(declare-fun m!977367 () Bool)

(assert (=> b!1058217 m!977367))

(declare-fun m!977369 () Bool)

(assert (=> b!1058217 m!977369))

(declare-fun m!977371 () Bool)

(assert (=> b!1058217 m!977371))

(declare-fun m!977373 () Bool)

(assert (=> b!1058217 m!977373))

(declare-fun m!977375 () Bool)

(assert (=> b!1058216 m!977375))

(declare-fun m!977377 () Bool)

(assert (=> b!1058212 m!977377))

(declare-fun m!977379 () Bool)

(assert (=> start!93436 m!977379))

(declare-fun m!977381 () Bool)

(assert (=> b!1058215 m!977381))

(declare-fun m!977383 () Bool)

(assert (=> b!1058215 m!977383))

(declare-fun m!977385 () Bool)

(assert (=> b!1058211 m!977385))

(assert (=> b!1058211 m!977381))

(declare-fun m!977387 () Bool)

(assert (=> b!1058210 m!977387))

(declare-fun m!977389 () Bool)

(assert (=> b!1058213 m!977389))

(declare-fun m!977391 () Bool)

(assert (=> b!1058218 m!977391))

(check-sat (not b!1058211) (not b!1058212) (not start!93436) (not b!1058216) (not b!1058217) (not b!1058213) (not b!1058218))
(check-sat)
