; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93046 () Bool)

(assert start!93046)

(declare-fun b!1055477 () Bool)

(declare-fun res!704376 () Bool)

(declare-fun e!599894 () Bool)

(assert (=> b!1055477 (=> (not res!704376) (not e!599894))))

(declare-datatypes ((array!66512 0))(
  ( (array!66513 (arr!31983 (Array (_ BitVec 32) (_ BitVec 64))) (size!32521 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66512)

(declare-datatypes ((List!22354 0))(
  ( (Nil!22351) (Cons!22350 (h!23559 (_ BitVec 64)) (t!31652 List!22354)) )
))
(declare-fun arrayNoDuplicates!0 (array!66512 (_ BitVec 32) List!22354) Bool)

(assert (=> b!1055477 (= res!704376 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22351))))

(declare-fun b!1055478 () Bool)

(declare-fun res!704381 () Bool)

(declare-fun e!599896 () Bool)

(assert (=> b!1055478 (=> res!704381 e!599896)))

(declare-fun contains!6157 (List!22354 (_ BitVec 64)) Bool)

(assert (=> b!1055478 (= res!704381 (contains!6157 Nil!22351 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1055479 () Bool)

(declare-fun e!599893 () Bool)

(declare-fun e!599895 () Bool)

(assert (=> b!1055479 (= e!599893 e!599895)))

(declare-fun res!704385 () Bool)

(assert (=> b!1055479 (=> (not res!704385) (not e!599895))))

(declare-fun lt!465637 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1055479 (= res!704385 (not (= lt!465637 i!1381)))))

(declare-fun lt!465635 () array!66512)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66512 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055479 (= lt!465637 (arrayScanForKey!0 lt!465635 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!704378 () Bool)

(assert (=> start!93046 (=> (not res!704378) (not e!599894))))

(assert (=> start!93046 (= res!704378 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32521 a!3488)) (bvslt (size!32521 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93046 e!599894))

(assert (=> start!93046 true))

(declare-fun array_inv!24766 (array!66512) Bool)

(assert (=> start!93046 (array_inv!24766 a!3488)))

(declare-fun b!1055480 () Bool)

(assert (=> b!1055480 (= e!599896 true)))

(declare-fun lt!465634 () Bool)

(assert (=> b!1055480 (= lt!465634 (contains!6157 Nil!22351 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1055481 () Bool)

(assert (=> b!1055481 (= e!599894 e!599893)))

(declare-fun res!704386 () Bool)

(assert (=> b!1055481 (=> (not res!704386) (not e!599893))))

(declare-fun arrayContainsKey!0 (array!66512 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055481 (= res!704386 (arrayContainsKey!0 lt!465635 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1055481 (= lt!465635 (array!66513 (store (arr!31983 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32521 a!3488)))))

(declare-fun b!1055482 () Bool)

(declare-fun res!704379 () Bool)

(assert (=> b!1055482 (=> (not res!704379) (not e!599894))))

(assert (=> b!1055482 (= res!704379 (= (select (arr!31983 a!3488) i!1381) k0!2747))))

(declare-fun b!1055483 () Bool)

(declare-fun res!704380 () Bool)

(assert (=> b!1055483 (=> (not res!704380) (not e!599894))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055483 (= res!704380 (validKeyInArray!0 k0!2747))))

(declare-fun b!1055484 () Bool)

(declare-fun e!599897 () Bool)

(assert (=> b!1055484 (= e!599895 (not e!599897))))

(declare-fun res!704382 () Bool)

(assert (=> b!1055484 (=> res!704382 e!599897)))

(assert (=> b!1055484 (= res!704382 (bvsle lt!465637 i!1381))))

(declare-fun e!599898 () Bool)

(assert (=> b!1055484 e!599898))

(declare-fun res!704384 () Bool)

(assert (=> b!1055484 (=> (not res!704384) (not e!599898))))

(assert (=> b!1055484 (= res!704384 (= (select (store (arr!31983 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465637) k0!2747))))

(declare-fun b!1055485 () Bool)

(declare-fun e!599891 () Bool)

(assert (=> b!1055485 (= e!599898 e!599891)))

(declare-fun res!704375 () Bool)

(assert (=> b!1055485 (=> res!704375 e!599891)))

(assert (=> b!1055485 (= res!704375 (bvsle lt!465637 i!1381))))

(declare-fun b!1055486 () Bool)

(assert (=> b!1055486 (= e!599897 e!599896)))

(declare-fun res!704377 () Bool)

(assert (=> b!1055486 (=> res!704377 e!599896)))

(assert (=> b!1055486 (= res!704377 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32521 a!3488)))))

(assert (=> b!1055486 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34457 0))(
  ( (Unit!34458) )
))
(declare-fun lt!465636 () Unit!34457)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66512 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34457)

(assert (=> b!1055486 (= lt!465636 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!465637 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1055486 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22351)))

(declare-fun lt!465633 () Unit!34457)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66512 (_ BitVec 32) (_ BitVec 32)) Unit!34457)

(assert (=> b!1055486 (= lt!465633 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1055487 () Bool)

(declare-fun res!704383 () Bool)

(assert (=> b!1055487 (=> res!704383 e!599896)))

(declare-fun noDuplicate!1567 (List!22354) Bool)

(assert (=> b!1055487 (= res!704383 (not (noDuplicate!1567 Nil!22351)))))

(declare-fun b!1055488 () Bool)

(assert (=> b!1055488 (= e!599891 (arrayContainsKey!0 a!3488 k0!2747 lt!465637))))

(assert (= (and start!93046 res!704378) b!1055477))

(assert (= (and b!1055477 res!704376) b!1055483))

(assert (= (and b!1055483 res!704380) b!1055482))

(assert (= (and b!1055482 res!704379) b!1055481))

(assert (= (and b!1055481 res!704386) b!1055479))

(assert (= (and b!1055479 res!704385) b!1055484))

(assert (= (and b!1055484 res!704384) b!1055485))

(assert (= (and b!1055485 (not res!704375)) b!1055488))

(assert (= (and b!1055484 (not res!704382)) b!1055486))

(assert (= (and b!1055486 (not res!704377)) b!1055487))

(assert (= (and b!1055487 (not res!704383)) b!1055478))

(assert (= (and b!1055478 (not res!704381)) b!1055480))

(declare-fun m!974989 () Bool)

(assert (=> b!1055477 m!974989))

(declare-fun m!974991 () Bool)

(assert (=> start!93046 m!974991))

(declare-fun m!974993 () Bool)

(assert (=> b!1055480 m!974993))

(declare-fun m!974995 () Bool)

(assert (=> b!1055481 m!974995))

(declare-fun m!974997 () Bool)

(assert (=> b!1055481 m!974997))

(declare-fun m!974999 () Bool)

(assert (=> b!1055479 m!974999))

(declare-fun m!975001 () Bool)

(assert (=> b!1055488 m!975001))

(declare-fun m!975003 () Bool)

(assert (=> b!1055486 m!975003))

(declare-fun m!975005 () Bool)

(assert (=> b!1055486 m!975005))

(declare-fun m!975007 () Bool)

(assert (=> b!1055486 m!975007))

(declare-fun m!975009 () Bool)

(assert (=> b!1055486 m!975009))

(declare-fun m!975011 () Bool)

(assert (=> b!1055483 m!975011))

(declare-fun m!975013 () Bool)

(assert (=> b!1055487 m!975013))

(assert (=> b!1055484 m!974997))

(declare-fun m!975015 () Bool)

(assert (=> b!1055484 m!975015))

(declare-fun m!975017 () Bool)

(assert (=> b!1055478 m!975017))

(declare-fun m!975019 () Bool)

(assert (=> b!1055482 m!975019))

(check-sat (not b!1055480) (not b!1055478) (not b!1055483) (not b!1055479) (not b!1055486) (not b!1055481) (not start!93046) (not b!1055477) (not b!1055488) (not b!1055487))
(check-sat)
