; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92754 () Bool)

(assert start!92754)

(declare-fun b!1053616 () Bool)

(declare-fun e!598279 () Bool)

(declare-fun e!598278 () Bool)

(assert (=> b!1053616 (= e!598279 e!598278)))

(declare-fun res!701946 () Bool)

(assert (=> b!1053616 (=> (not res!701946) (not e!598278))))

(declare-datatypes ((array!66370 0))(
  ( (array!66371 (arr!31918 (Array (_ BitVec 32) (_ BitVec 64))) (size!32455 (_ BitVec 32))) )
))
(declare-fun lt!465208 () array!66370)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66370 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053616 (= res!701946 (arrayContainsKey!0 lt!465208 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66370)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053616 (= lt!465208 (array!66371 (store (arr!31918 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32455 a!3488)))))

(declare-fun b!1053617 () Bool)

(declare-fun e!598275 () Bool)

(declare-fun e!598280 () Bool)

(assert (=> b!1053617 (= e!598275 (not e!598280))))

(declare-fun res!701947 () Bool)

(assert (=> b!1053617 (=> res!701947 e!598280)))

(declare-fun lt!465206 () (_ BitVec 32))

(assert (=> b!1053617 (= res!701947 (or (bvsgt lt!465206 i!1381) (bvsle i!1381 lt!465206)))))

(declare-fun e!598277 () Bool)

(assert (=> b!1053617 e!598277))

(declare-fun res!701945 () Bool)

(assert (=> b!1053617 (=> (not res!701945) (not e!598277))))

(assert (=> b!1053617 (= res!701945 (= (select (store (arr!31918 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465206) k0!2747))))

(declare-fun b!1053618 () Bool)

(declare-fun res!701943 () Bool)

(assert (=> b!1053618 (=> (not res!701943) (not e!598279))))

(declare-datatypes ((List!22200 0))(
  ( (Nil!22197) (Cons!22196 (h!23414 (_ BitVec 64)) (t!31499 List!22200)) )
))
(declare-fun arrayNoDuplicates!0 (array!66370 (_ BitVec 32) List!22200) Bool)

(assert (=> b!1053618 (= res!701943 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22197))))

(declare-fun b!1053619 () Bool)

(declare-fun e!598281 () Bool)

(assert (=> b!1053619 (= e!598280 e!598281)))

(declare-fun res!701937 () Bool)

(assert (=> b!1053619 (=> res!701937 e!598281)))

(declare-fun lt!465209 () (_ BitVec 32))

(assert (=> b!1053619 (= res!701937 (or (bvslt lt!465206 #b00000000000000000000000000000000) (bvsge lt!465209 (size!32455 a!3488)) (bvsge lt!465206 (size!32455 a!3488))))))

(assert (=> b!1053619 (arrayContainsKey!0 a!3488 k0!2747 lt!465209)))

(declare-datatypes ((Unit!34477 0))(
  ( (Unit!34478) )
))
(declare-fun lt!465207 () Unit!34477)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66370 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34477)

(assert (=> b!1053619 (= lt!465207 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!465209))))

(assert (=> b!1053619 (= lt!465209 (bvadd #b00000000000000000000000000000001 lt!465206))))

(assert (=> b!1053619 (arrayNoDuplicates!0 a!3488 lt!465206 Nil!22197)))

(declare-fun lt!465204 () Unit!34477)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66370 (_ BitVec 32) (_ BitVec 32)) Unit!34477)

(assert (=> b!1053619 (= lt!465204 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!465206))))

(declare-fun b!1053620 () Bool)

(declare-fun e!598282 () Bool)

(assert (=> b!1053620 (= e!598282 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1053621 () Bool)

(declare-fun res!701944 () Bool)

(assert (=> b!1053621 (=> res!701944 e!598281)))

(declare-fun contains!6179 (List!22200 (_ BitVec 64)) Bool)

(assert (=> b!1053621 (= res!701944 (contains!6179 Nil!22197 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!701939 () Bool)

(assert (=> start!92754 (=> (not res!701939) (not e!598279))))

(assert (=> start!92754 (= res!701939 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32455 a!3488)) (bvslt (size!32455 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92754 e!598279))

(assert (=> start!92754 true))

(declare-fun array_inv!24700 (array!66370) Bool)

(assert (=> start!92754 (array_inv!24700 a!3488)))

(declare-fun b!1053622 () Bool)

(declare-fun res!701942 () Bool)

(assert (=> b!1053622 (=> res!701942 e!598281)))

(declare-fun noDuplicate!1555 (List!22200) Bool)

(assert (=> b!1053622 (= res!701942 (not (noDuplicate!1555 Nil!22197)))))

(declare-fun b!1053623 () Bool)

(assert (=> b!1053623 (= e!598278 e!598275)))

(declare-fun res!701948 () Bool)

(assert (=> b!1053623 (=> (not res!701948) (not e!598275))))

(assert (=> b!1053623 (= res!701948 (not (= lt!465206 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66370 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053623 (= lt!465206 (arrayScanForKey!0 lt!465208 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1053624 () Bool)

(declare-fun res!701938 () Bool)

(assert (=> b!1053624 (=> (not res!701938) (not e!598279))))

(assert (=> b!1053624 (= res!701938 (= (select (arr!31918 a!3488) i!1381) k0!2747))))

(declare-fun b!1053625 () Bool)

(assert (=> b!1053625 (= e!598281 true)))

(declare-fun lt!465205 () Bool)

(assert (=> b!1053625 (= lt!465205 (contains!6179 Nil!22197 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1053626 () Bool)

(declare-fun res!701940 () Bool)

(assert (=> b!1053626 (=> (not res!701940) (not e!598279))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053626 (= res!701940 (validKeyInArray!0 k0!2747))))

(declare-fun b!1053627 () Bool)

(assert (=> b!1053627 (= e!598277 e!598282)))

(declare-fun res!701941 () Bool)

(assert (=> b!1053627 (=> res!701941 e!598282)))

(assert (=> b!1053627 (= res!701941 (or (bvsgt lt!465206 i!1381) (bvsle i!1381 lt!465206)))))

(assert (= (and start!92754 res!701939) b!1053618))

(assert (= (and b!1053618 res!701943) b!1053626))

(assert (= (and b!1053626 res!701940) b!1053624))

(assert (= (and b!1053624 res!701938) b!1053616))

(assert (= (and b!1053616 res!701946) b!1053623))

(assert (= (and b!1053623 res!701948) b!1053617))

(assert (= (and b!1053617 res!701945) b!1053627))

(assert (= (and b!1053627 (not res!701941)) b!1053620))

(assert (= (and b!1053617 (not res!701947)) b!1053619))

(assert (= (and b!1053619 (not res!701937)) b!1053622))

(assert (= (and b!1053622 (not res!701942)) b!1053621))

(assert (= (and b!1053621 (not res!701944)) b!1053625))

(declare-fun m!974363 () Bool)

(assert (=> b!1053621 m!974363))

(declare-fun m!974365 () Bool)

(assert (=> b!1053625 m!974365))

(declare-fun m!974367 () Bool)

(assert (=> b!1053617 m!974367))

(declare-fun m!974369 () Bool)

(assert (=> b!1053617 m!974369))

(declare-fun m!974371 () Bool)

(assert (=> b!1053619 m!974371))

(declare-fun m!974373 () Bool)

(assert (=> b!1053619 m!974373))

(declare-fun m!974375 () Bool)

(assert (=> b!1053619 m!974375))

(declare-fun m!974377 () Bool)

(assert (=> b!1053619 m!974377))

(declare-fun m!974379 () Bool)

(assert (=> b!1053624 m!974379))

(declare-fun m!974381 () Bool)

(assert (=> b!1053622 m!974381))

(declare-fun m!974383 () Bool)

(assert (=> b!1053618 m!974383))

(declare-fun m!974385 () Bool)

(assert (=> b!1053626 m!974385))

(declare-fun m!974387 () Bool)

(assert (=> b!1053616 m!974387))

(assert (=> b!1053616 m!974367))

(declare-fun m!974389 () Bool)

(assert (=> b!1053620 m!974389))

(declare-fun m!974391 () Bool)

(assert (=> start!92754 m!974391))

(declare-fun m!974393 () Bool)

(assert (=> b!1053623 m!974393))

(check-sat (not b!1053620) (not b!1053618) (not b!1053616) (not b!1053621) (not b!1053623) (not b!1053625) (not start!92754) (not b!1053626) (not b!1053622) (not b!1053619))
(check-sat)
