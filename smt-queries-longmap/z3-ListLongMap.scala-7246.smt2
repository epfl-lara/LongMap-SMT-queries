; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92772 () Bool)

(assert start!92772)

(declare-fun b!1053907 () Bool)

(declare-fun e!598486 () Bool)

(declare-fun e!598485 () Bool)

(assert (=> b!1053907 (= e!598486 e!598485)))

(declare-fun res!702230 () Bool)

(assert (=> b!1053907 (=> res!702230 e!598485)))

(declare-fun lt!465369 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053907 (= res!702230 (or (bvsgt lt!465369 i!1381) (bvsle i!1381 lt!465369)))))

(declare-fun b!1053908 () Bool)

(declare-fun e!598484 () Bool)

(declare-fun e!598480 () Bool)

(assert (=> b!1053908 (= e!598484 (not e!598480))))

(declare-fun res!702236 () Bool)

(assert (=> b!1053908 (=> res!702236 e!598480)))

(assert (=> b!1053908 (= res!702236 (or (bvsgt lt!465369 i!1381) (bvsle i!1381 lt!465369)))))

(assert (=> b!1053908 e!598486))

(declare-fun res!702234 () Bool)

(assert (=> b!1053908 (=> (not res!702234) (not e!598486))))

(declare-datatypes ((array!66388 0))(
  ( (array!66389 (arr!31927 (Array (_ BitVec 32) (_ BitVec 64))) (size!32464 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66388)

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1053908 (= res!702234 (= (select (store (arr!31927 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465369) k0!2747))))

(declare-fun b!1053909 () Bool)

(declare-fun arrayContainsKey!0 (array!66388 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053909 (= e!598485 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun res!702232 () Bool)

(declare-fun e!598482 () Bool)

(assert (=> start!92772 (=> (not res!702232) (not e!598482))))

(assert (=> start!92772 (= res!702232 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32464 a!3488)) (bvslt (size!32464 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92772 e!598482))

(assert (=> start!92772 true))

(declare-fun array_inv!24709 (array!66388) Bool)

(assert (=> start!92772 (array_inv!24709 a!3488)))

(declare-fun b!1053910 () Bool)

(declare-fun e!598481 () Bool)

(assert (=> b!1053910 (= e!598481 e!598484)))

(declare-fun res!702229 () Bool)

(assert (=> b!1053910 (=> (not res!702229) (not e!598484))))

(assert (=> b!1053910 (= res!702229 (not (= lt!465369 i!1381)))))

(declare-fun lt!465370 () array!66388)

(declare-fun arrayScanForKey!0 (array!66388 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053910 (= lt!465369 (arrayScanForKey!0 lt!465370 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1053911 () Bool)

(declare-fun res!702228 () Bool)

(assert (=> b!1053911 (=> (not res!702228) (not e!598482))))

(declare-datatypes ((List!22209 0))(
  ( (Nil!22206) (Cons!22205 (h!23423 (_ BitVec 64)) (t!31508 List!22209)) )
))
(declare-fun arrayNoDuplicates!0 (array!66388 (_ BitVec 32) List!22209) Bool)

(assert (=> b!1053911 (= res!702228 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22206))))

(declare-fun b!1053912 () Bool)

(declare-fun res!702233 () Bool)

(assert (=> b!1053912 (=> (not res!702233) (not e!598482))))

(assert (=> b!1053912 (= res!702233 (= (select (arr!31927 a!3488) i!1381) k0!2747))))

(declare-fun b!1053913 () Bool)

(assert (=> b!1053913 (= e!598480 true)))

(assert (=> b!1053913 (not (= (select (arr!31927 a!3488) lt!465369) k0!2747))))

(declare-datatypes ((Unit!34495 0))(
  ( (Unit!34496) )
))
(declare-fun lt!465371 () Unit!34495)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66388 (_ BitVec 64) (_ BitVec 32) List!22209) Unit!34495)

(assert (=> b!1053913 (= lt!465371 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k0!2747 lt!465369 Nil!22206))))

(declare-fun lt!465367 () (_ BitVec 32))

(assert (=> b!1053913 (arrayContainsKey!0 a!3488 k0!2747 lt!465367)))

(declare-fun lt!465368 () Unit!34495)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66388 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34495)

(assert (=> b!1053913 (= lt!465368 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!465367))))

(assert (=> b!1053913 (= lt!465367 (bvadd #b00000000000000000000000000000001 lt!465369))))

(assert (=> b!1053913 (arrayNoDuplicates!0 a!3488 lt!465369 Nil!22206)))

(declare-fun lt!465366 () Unit!34495)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66388 (_ BitVec 32) (_ BitVec 32)) Unit!34495)

(assert (=> b!1053913 (= lt!465366 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!465369))))

(declare-fun b!1053914 () Bool)

(declare-fun res!702231 () Bool)

(assert (=> b!1053914 (=> (not res!702231) (not e!598482))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053914 (= res!702231 (validKeyInArray!0 k0!2747))))

(declare-fun b!1053915 () Bool)

(assert (=> b!1053915 (= e!598482 e!598481)))

(declare-fun res!702235 () Bool)

(assert (=> b!1053915 (=> (not res!702235) (not e!598481))))

(assert (=> b!1053915 (= res!702235 (arrayContainsKey!0 lt!465370 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053915 (= lt!465370 (array!66389 (store (arr!31927 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32464 a!3488)))))

(assert (= (and start!92772 res!702232) b!1053911))

(assert (= (and b!1053911 res!702228) b!1053914))

(assert (= (and b!1053914 res!702231) b!1053912))

(assert (= (and b!1053912 res!702233) b!1053915))

(assert (= (and b!1053915 res!702235) b!1053910))

(assert (= (and b!1053910 res!702229) b!1053908))

(assert (= (and b!1053908 res!702234) b!1053907))

(assert (= (and b!1053907 (not res!702230)) b!1053909))

(assert (= (and b!1053908 (not res!702236)) b!1053913))

(declare-fun m!974645 () Bool)

(assert (=> b!1053908 m!974645))

(declare-fun m!974647 () Bool)

(assert (=> b!1053908 m!974647))

(declare-fun m!974649 () Bool)

(assert (=> b!1053910 m!974649))

(declare-fun m!974651 () Bool)

(assert (=> b!1053915 m!974651))

(assert (=> b!1053915 m!974645))

(declare-fun m!974653 () Bool)

(assert (=> b!1053913 m!974653))

(declare-fun m!974655 () Bool)

(assert (=> b!1053913 m!974655))

(declare-fun m!974657 () Bool)

(assert (=> b!1053913 m!974657))

(declare-fun m!974659 () Bool)

(assert (=> b!1053913 m!974659))

(declare-fun m!974661 () Bool)

(assert (=> b!1053913 m!974661))

(declare-fun m!974663 () Bool)

(assert (=> b!1053913 m!974663))

(declare-fun m!974665 () Bool)

(assert (=> b!1053909 m!974665))

(declare-fun m!974667 () Bool)

(assert (=> b!1053912 m!974667))

(declare-fun m!974669 () Bool)

(assert (=> b!1053914 m!974669))

(declare-fun m!974671 () Bool)

(assert (=> start!92772 m!974671))

(declare-fun m!974673 () Bool)

(assert (=> b!1053911 m!974673))

(check-sat (not b!1053915) (not b!1053909) (not b!1053910) (not b!1053911) (not b!1053913) (not b!1053914) (not start!92772))
(check-sat)
