; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93464 () Bool)

(assert start!93464)

(declare-fun res!707247 () Bool)

(declare-fun e!602319 () Bool)

(assert (=> start!93464 (=> (not res!707247) (not e!602319))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66767 0))(
  ( (array!66768 (arr!32102 (Array (_ BitVec 32) (_ BitVec 64))) (size!32638 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66767)

(assert (=> start!93464 (= res!707247 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32638 a!3488)) (bvslt (size!32638 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93464 e!602319))

(assert (=> start!93464 true))

(declare-fun array_inv!24882 (array!66767) Bool)

(assert (=> start!93464 (array_inv!24882 a!3488)))

(declare-fun b!1058670 () Bool)

(declare-fun res!707245 () Bool)

(assert (=> b!1058670 (=> (not res!707245) (not e!602319))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058670 (= res!707245 (validKeyInArray!0 k0!2747))))

(declare-fun b!1058671 () Bool)

(declare-fun res!707248 () Bool)

(assert (=> b!1058671 (=> (not res!707248) (not e!602319))))

(declare-datatypes ((List!22414 0))(
  ( (Nil!22411) (Cons!22410 (h!23619 (_ BitVec 64)) (t!31721 List!22414)) )
))
(declare-fun arrayNoDuplicates!0 (array!66767 (_ BitVec 32) List!22414) Bool)

(assert (=> b!1058671 (= res!707248 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22411))))

(declare-fun b!1058672 () Bool)

(declare-fun e!602320 () Bool)

(declare-fun lt!467016 () (_ BitVec 32))

(assert (=> b!1058672 (= e!602320 (not (or (bvsgt lt!467016 i!1381) (bvsgt i!1381 lt!467016))))))

(assert (=> b!1058672 (= (select (store (arr!32102 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!467016) k0!2747)))

(declare-fun b!1058673 () Bool)

(declare-fun e!602318 () Bool)

(assert (=> b!1058673 (= e!602318 e!602320)))

(declare-fun res!707244 () Bool)

(assert (=> b!1058673 (=> (not res!707244) (not e!602320))))

(assert (=> b!1058673 (= res!707244 (not (= lt!467016 i!1381)))))

(declare-fun lt!467015 () array!66767)

(declare-fun arrayScanForKey!0 (array!66767 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058673 (= lt!467016 (arrayScanForKey!0 lt!467015 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1058674 () Bool)

(assert (=> b!1058674 (= e!602319 e!602318)))

(declare-fun res!707249 () Bool)

(assert (=> b!1058674 (=> (not res!707249) (not e!602318))))

(declare-fun arrayContainsKey!0 (array!66767 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058674 (= res!707249 (arrayContainsKey!0 lt!467015 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1058674 (= lt!467015 (array!66768 (store (arr!32102 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32638 a!3488)))))

(declare-fun b!1058675 () Bool)

(declare-fun res!707246 () Bool)

(assert (=> b!1058675 (=> (not res!707246) (not e!602319))))

(assert (=> b!1058675 (= res!707246 (= (select (arr!32102 a!3488) i!1381) k0!2747))))

(assert (= (and start!93464 res!707247) b!1058671))

(assert (= (and b!1058671 res!707248) b!1058670))

(assert (= (and b!1058670 res!707245) b!1058675))

(assert (= (and b!1058675 res!707246) b!1058674))

(assert (= (and b!1058674 res!707249) b!1058673))

(assert (= (and b!1058673 res!707244) b!1058672))

(declare-fun m!978321 () Bool)

(assert (=> start!93464 m!978321))

(declare-fun m!978323 () Bool)

(assert (=> b!1058671 m!978323))

(declare-fun m!978325 () Bool)

(assert (=> b!1058675 m!978325))

(declare-fun m!978327 () Bool)

(assert (=> b!1058673 m!978327))

(declare-fun m!978329 () Bool)

(assert (=> b!1058674 m!978329))

(declare-fun m!978331 () Bool)

(assert (=> b!1058674 m!978331))

(assert (=> b!1058672 m!978331))

(declare-fun m!978333 () Bool)

(assert (=> b!1058672 m!978333))

(declare-fun m!978335 () Bool)

(assert (=> b!1058670 m!978335))

(check-sat (not b!1058673) (not start!93464) (not b!1058671) (not b!1058674) (not b!1058670))
(check-sat)
