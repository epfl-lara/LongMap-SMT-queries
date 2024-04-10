; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93452 () Bool)

(assert start!93452)

(declare-fun b!1058550 () Bool)

(declare-fun e!602234 () Bool)

(declare-fun e!602239 () Bool)

(assert (=> b!1058550 (= e!602234 e!602239)))

(declare-fun res!707124 () Bool)

(assert (=> b!1058550 (=> (not res!707124) (not e!602239))))

(declare-fun lt!466963 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1058550 (= res!707124 (not (= lt!466963 i!1381)))))

(declare-datatypes ((array!66755 0))(
  ( (array!66756 (arr!32096 (Array (_ BitVec 32) (_ BitVec 64))) (size!32632 (_ BitVec 32))) )
))
(declare-fun lt!466965 () array!66755)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66755 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058550 (= lt!466963 (arrayScanForKey!0 lt!466965 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1058551 () Bool)

(declare-fun e!602233 () Bool)

(declare-fun e!602235 () Bool)

(assert (=> b!1058551 (= e!602233 e!602235)))

(declare-fun res!707128 () Bool)

(assert (=> b!1058551 (=> res!707128 e!602235)))

(assert (=> b!1058551 (= res!707128 (or (bvsgt lt!466963 i!1381) (bvsle i!1381 lt!466963)))))

(declare-fun b!1058552 () Bool)

(declare-fun e!602236 () Bool)

(assert (=> b!1058552 (= e!602239 (not e!602236))))

(declare-fun res!707130 () Bool)

(assert (=> b!1058552 (=> res!707130 e!602236)))

(assert (=> b!1058552 (= res!707130 (or (bvsgt lt!466963 i!1381) (bvsle i!1381 lt!466963)))))

(assert (=> b!1058552 e!602233))

(declare-fun res!707132 () Bool)

(assert (=> b!1058552 (=> (not res!707132) (not e!602233))))

(declare-fun a!3488 () array!66755)

(assert (=> b!1058552 (= res!707132 (= (select (store (arr!32096 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466963) k0!2747))))

(declare-fun res!707129 () Bool)

(declare-fun e!602238 () Bool)

(assert (=> start!93452 (=> (not res!707129) (not e!602238))))

(assert (=> start!93452 (= res!707129 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32632 a!3488)) (bvslt (size!32632 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93452 e!602238))

(assert (=> start!93452 true))

(declare-fun array_inv!24876 (array!66755) Bool)

(assert (=> start!93452 (array_inv!24876 a!3488)))

(declare-fun b!1058553 () Bool)

(declare-fun res!707127 () Bool)

(assert (=> b!1058553 (=> (not res!707127) (not e!602238))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058553 (= res!707127 (validKeyInArray!0 k0!2747))))

(declare-fun b!1058554 () Bool)

(declare-fun res!707131 () Bool)

(assert (=> b!1058554 (=> (not res!707131) (not e!602238))))

(assert (=> b!1058554 (= res!707131 (= (select (arr!32096 a!3488) i!1381) k0!2747))))

(declare-fun b!1058555 () Bool)

(declare-fun res!707126 () Bool)

(assert (=> b!1058555 (=> (not res!707126) (not e!602238))))

(declare-datatypes ((List!22408 0))(
  ( (Nil!22405) (Cons!22404 (h!23613 (_ BitVec 64)) (t!31715 List!22408)) )
))
(declare-fun arrayNoDuplicates!0 (array!66755 (_ BitVec 32) List!22408) Bool)

(assert (=> b!1058555 (= res!707126 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22405))))

(declare-fun b!1058556 () Bool)

(declare-fun arrayContainsKey!0 (array!66755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058556 (= e!602235 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1058557 () Bool)

(assert (=> b!1058557 (= e!602238 e!602234)))

(declare-fun res!707125 () Bool)

(assert (=> b!1058557 (=> (not res!707125) (not e!602234))))

(assert (=> b!1058557 (= res!707125 (arrayContainsKey!0 lt!466965 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1058557 (= lt!466965 (array!66756 (store (arr!32096 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32632 a!3488)))))

(declare-fun b!1058558 () Bool)

(assert (=> b!1058558 (= e!602236 true)))

(assert (=> b!1058558 (not (= (select (arr!32096 a!3488) lt!466963) k0!2747))))

(declare-datatypes ((Unit!34714 0))(
  ( (Unit!34715) )
))
(declare-fun lt!466964 () Unit!34714)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66755 (_ BitVec 64) (_ BitVec 32) List!22408) Unit!34714)

(assert (=> b!1058558 (= lt!466964 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k0!2747 lt!466963 Nil!22405))))

(declare-fun lt!466966 () (_ BitVec 32))

(assert (=> b!1058558 (arrayContainsKey!0 a!3488 k0!2747 lt!466966)))

(declare-fun lt!466968 () Unit!34714)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66755 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34714)

(assert (=> b!1058558 (= lt!466968 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!466966))))

(assert (=> b!1058558 (= lt!466966 (bvadd #b00000000000000000000000000000001 lt!466963))))

(assert (=> b!1058558 (arrayNoDuplicates!0 a!3488 lt!466963 Nil!22405)))

(declare-fun lt!466967 () Unit!34714)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66755 (_ BitVec 32) (_ BitVec 32)) Unit!34714)

(assert (=> b!1058558 (= lt!466967 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466963))))

(assert (= (and start!93452 res!707129) b!1058555))

(assert (= (and b!1058555 res!707126) b!1058553))

(assert (= (and b!1058553 res!707127) b!1058554))

(assert (= (and b!1058554 res!707131) b!1058557))

(assert (= (and b!1058557 res!707125) b!1058550))

(assert (= (and b!1058550 res!707124) b!1058552))

(assert (= (and b!1058552 res!707132) b!1058551))

(assert (= (and b!1058551 (not res!707128)) b!1058556))

(assert (= (and b!1058552 (not res!707130)) b!1058558))

(declare-fun m!978197 () Bool)

(assert (=> b!1058552 m!978197))

(declare-fun m!978199 () Bool)

(assert (=> b!1058552 m!978199))

(declare-fun m!978201 () Bool)

(assert (=> b!1058553 m!978201))

(declare-fun m!978203 () Bool)

(assert (=> b!1058558 m!978203))

(declare-fun m!978205 () Bool)

(assert (=> b!1058558 m!978205))

(declare-fun m!978207 () Bool)

(assert (=> b!1058558 m!978207))

(declare-fun m!978209 () Bool)

(assert (=> b!1058558 m!978209))

(declare-fun m!978211 () Bool)

(assert (=> b!1058558 m!978211))

(declare-fun m!978213 () Bool)

(assert (=> b!1058558 m!978213))

(declare-fun m!978215 () Bool)

(assert (=> b!1058557 m!978215))

(assert (=> b!1058557 m!978197))

(declare-fun m!978217 () Bool)

(assert (=> b!1058556 m!978217))

(declare-fun m!978219 () Bool)

(assert (=> b!1058554 m!978219))

(declare-fun m!978221 () Bool)

(assert (=> start!93452 m!978221))

(declare-fun m!978223 () Bool)

(assert (=> b!1058550 m!978223))

(declare-fun m!978225 () Bool)

(assert (=> b!1058555 m!978225))

(check-sat (not b!1058557) (not b!1058556) (not b!1058553) (not b!1058550) (not b!1058555) (not start!93452) (not b!1058558))
(check-sat)
