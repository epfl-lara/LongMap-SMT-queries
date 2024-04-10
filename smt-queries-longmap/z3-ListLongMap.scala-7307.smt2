; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93446 () Bool)

(assert start!93446)

(declare-fun b!1058469 () Bool)

(declare-fun res!707048 () Bool)

(declare-fun e!602171 () Bool)

(assert (=> b!1058469 (=> (not res!707048) (not e!602171))))

(declare-datatypes ((array!66749 0))(
  ( (array!66750 (arr!32093 (Array (_ BitVec 32) (_ BitVec 64))) (size!32629 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66749)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1058469 (= res!707048 (= (select (arr!32093 a!3488) i!1381) k0!2747))))

(declare-fun b!1058470 () Bool)

(declare-fun res!707051 () Bool)

(assert (=> b!1058470 (=> (not res!707051) (not e!602171))))

(declare-datatypes ((List!22405 0))(
  ( (Nil!22402) (Cons!22401 (h!23610 (_ BitVec 64)) (t!31712 List!22405)) )
))
(declare-fun arrayNoDuplicates!0 (array!66749 (_ BitVec 32) List!22405) Bool)

(assert (=> b!1058470 (= res!707051 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22402))))

(declare-fun b!1058471 () Bool)

(declare-fun e!602176 () Bool)

(declare-fun e!602175 () Bool)

(assert (=> b!1058471 (= e!602176 e!602175)))

(declare-fun res!707045 () Bool)

(assert (=> b!1058471 (=> (not res!707045) (not e!602175))))

(declare-fun lt!466912 () (_ BitVec 32))

(assert (=> b!1058471 (= res!707045 (not (= lt!466912 i!1381)))))

(declare-fun lt!466911 () array!66749)

(declare-fun arrayScanForKey!0 (array!66749 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058471 (= lt!466912 (arrayScanForKey!0 lt!466911 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1058472 () Bool)

(declare-fun e!602172 () Bool)

(assert (=> b!1058472 (= e!602172 true)))

(assert (=> b!1058472 (not (= (select (arr!32093 a!3488) lt!466912) k0!2747))))

(declare-datatypes ((Unit!34708 0))(
  ( (Unit!34709) )
))
(declare-fun lt!466914 () Unit!34708)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66749 (_ BitVec 64) (_ BitVec 32) List!22405) Unit!34708)

(assert (=> b!1058472 (= lt!466914 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k0!2747 lt!466912 Nil!22402))))

(declare-fun lt!466913 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66749 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058472 (arrayContainsKey!0 a!3488 k0!2747 lt!466913)))

(declare-fun lt!466909 () Unit!34708)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66749 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34708)

(assert (=> b!1058472 (= lt!466909 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!466913))))

(assert (=> b!1058472 (= lt!466913 (bvadd #b00000000000000000000000000000001 lt!466912))))

(assert (=> b!1058472 (arrayNoDuplicates!0 a!3488 lt!466912 Nil!22402)))

(declare-fun lt!466910 () Unit!34708)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66749 (_ BitVec 32) (_ BitVec 32)) Unit!34708)

(assert (=> b!1058472 (= lt!466910 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466912))))

(declare-fun b!1058473 () Bool)

(assert (=> b!1058473 (= e!602171 e!602176)))

(declare-fun res!707047 () Bool)

(assert (=> b!1058473 (=> (not res!707047) (not e!602176))))

(assert (=> b!1058473 (= res!707047 (arrayContainsKey!0 lt!466911 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1058473 (= lt!466911 (array!66750 (store (arr!32093 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32629 a!3488)))))

(declare-fun b!1058474 () Bool)

(declare-fun e!602174 () Bool)

(assert (=> b!1058474 (= e!602174 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun res!707046 () Bool)

(assert (=> start!93446 (=> (not res!707046) (not e!602171))))

(assert (=> start!93446 (= res!707046 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32629 a!3488)) (bvslt (size!32629 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93446 e!602171))

(assert (=> start!93446 true))

(declare-fun array_inv!24873 (array!66749) Bool)

(assert (=> start!93446 (array_inv!24873 a!3488)))

(declare-fun b!1058475 () Bool)

(assert (=> b!1058475 (= e!602175 (not e!602172))))

(declare-fun res!707044 () Bool)

(assert (=> b!1058475 (=> res!707044 e!602172)))

(assert (=> b!1058475 (= res!707044 (or (bvsgt lt!466912 i!1381) (bvsle i!1381 lt!466912)))))

(declare-fun e!602170 () Bool)

(assert (=> b!1058475 e!602170))

(declare-fun res!707043 () Bool)

(assert (=> b!1058475 (=> (not res!707043) (not e!602170))))

(assert (=> b!1058475 (= res!707043 (= (select (store (arr!32093 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466912) k0!2747))))

(declare-fun b!1058476 () Bool)

(assert (=> b!1058476 (= e!602170 e!602174)))

(declare-fun res!707050 () Bool)

(assert (=> b!1058476 (=> res!707050 e!602174)))

(assert (=> b!1058476 (= res!707050 (or (bvsgt lt!466912 i!1381) (bvsle i!1381 lt!466912)))))

(declare-fun b!1058477 () Bool)

(declare-fun res!707049 () Bool)

(assert (=> b!1058477 (=> (not res!707049) (not e!602171))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058477 (= res!707049 (validKeyInArray!0 k0!2747))))

(assert (= (and start!93446 res!707046) b!1058470))

(assert (= (and b!1058470 res!707051) b!1058477))

(assert (= (and b!1058477 res!707049) b!1058469))

(assert (= (and b!1058469 res!707048) b!1058473))

(assert (= (and b!1058473 res!707047) b!1058471))

(assert (= (and b!1058471 res!707045) b!1058475))

(assert (= (and b!1058475 res!707043) b!1058476))

(assert (= (and b!1058476 (not res!707050)) b!1058474))

(assert (= (and b!1058475 (not res!707044)) b!1058472))

(declare-fun m!978107 () Bool)

(assert (=> b!1058471 m!978107))

(declare-fun m!978109 () Bool)

(assert (=> b!1058474 m!978109))

(declare-fun m!978111 () Bool)

(assert (=> b!1058473 m!978111))

(declare-fun m!978113 () Bool)

(assert (=> b!1058473 m!978113))

(assert (=> b!1058475 m!978113))

(declare-fun m!978115 () Bool)

(assert (=> b!1058475 m!978115))

(declare-fun m!978117 () Bool)

(assert (=> b!1058477 m!978117))

(declare-fun m!978119 () Bool)

(assert (=> b!1058470 m!978119))

(declare-fun m!978121 () Bool)

(assert (=> b!1058472 m!978121))

(declare-fun m!978123 () Bool)

(assert (=> b!1058472 m!978123))

(declare-fun m!978125 () Bool)

(assert (=> b!1058472 m!978125))

(declare-fun m!978127 () Bool)

(assert (=> b!1058472 m!978127))

(declare-fun m!978129 () Bool)

(assert (=> b!1058472 m!978129))

(declare-fun m!978131 () Bool)

(assert (=> b!1058472 m!978131))

(declare-fun m!978133 () Bool)

(assert (=> start!93446 m!978133))

(declare-fun m!978135 () Bool)

(assert (=> b!1058469 m!978135))

(check-sat (not start!93446) (not b!1058471) (not b!1058470) (not b!1058472) (not b!1058473) (not b!1058474) (not b!1058477))
(check-sat)
