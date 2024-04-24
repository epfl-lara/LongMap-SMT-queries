; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92760 () Bool)

(assert start!92760)

(declare-fun b!1053724 () Bool)

(declare-fun res!702049 () Bool)

(declare-fun e!598350 () Bool)

(assert (=> b!1053724 (=> res!702049 e!598350)))

(declare-datatypes ((List!22203 0))(
  ( (Nil!22200) (Cons!22199 (h!23417 (_ BitVec 64)) (t!31502 List!22203)) )
))
(declare-fun noDuplicate!1558 (List!22203) Bool)

(assert (=> b!1053724 (= res!702049 (not (noDuplicate!1558 Nil!22200)))))

(declare-fun b!1053725 () Bool)

(declare-fun res!702056 () Bool)

(assert (=> b!1053725 (=> res!702056 e!598350)))

(declare-fun contains!6182 (List!22203 (_ BitVec 64)) Bool)

(assert (=> b!1053725 (= res!702056 (contains!6182 Nil!22200 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1053727 () Bool)

(assert (=> b!1053727 (= e!598350 true)))

(declare-fun lt!465263 () Bool)

(assert (=> b!1053727 (= lt!465263 (contains!6182 Nil!22200 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1053728 () Bool)

(declare-fun res!702054 () Bool)

(declare-fun e!598354 () Bool)

(assert (=> b!1053728 (=> (not res!702054) (not e!598354))))

(declare-datatypes ((array!66376 0))(
  ( (array!66377 (arr!31921 (Array (_ BitVec 32) (_ BitVec 64))) (size!32458 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66376)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053728 (= res!702054 (= (select (arr!31921 a!3488) i!1381) k0!2747))))

(declare-fun b!1053729 () Bool)

(declare-fun e!598351 () Bool)

(declare-fun arrayContainsKey!0 (array!66376 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053729 (= e!598351 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1053730 () Bool)

(declare-fun e!598348 () Bool)

(assert (=> b!1053730 (= e!598348 e!598351)))

(declare-fun res!702055 () Bool)

(assert (=> b!1053730 (=> res!702055 e!598351)))

(declare-fun lt!465260 () (_ BitVec 32))

(assert (=> b!1053730 (= res!702055 (or (bvsgt lt!465260 i!1381) (bvsle i!1381 lt!465260)))))

(declare-fun b!1053731 () Bool)

(declare-fun e!598349 () Bool)

(declare-fun e!598353 () Bool)

(assert (=> b!1053731 (= e!598349 (not e!598353))))

(declare-fun res!702052 () Bool)

(assert (=> b!1053731 (=> res!702052 e!598353)))

(assert (=> b!1053731 (= res!702052 (or (bvsgt lt!465260 i!1381) (bvsle i!1381 lt!465260)))))

(assert (=> b!1053731 e!598348))

(declare-fun res!702047 () Bool)

(assert (=> b!1053731 (=> (not res!702047) (not e!598348))))

(assert (=> b!1053731 (= res!702047 (= (select (store (arr!31921 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465260) k0!2747))))

(declare-fun b!1053732 () Bool)

(declare-fun res!702046 () Bool)

(assert (=> b!1053732 (=> (not res!702046) (not e!598354))))

(declare-fun arrayNoDuplicates!0 (array!66376 (_ BitVec 32) List!22203) Bool)

(assert (=> b!1053732 (= res!702046 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22200))))

(declare-fun b!1053733 () Bool)

(declare-fun res!702048 () Bool)

(assert (=> b!1053733 (=> (not res!702048) (not e!598354))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053733 (= res!702048 (validKeyInArray!0 k0!2747))))

(declare-fun b!1053734 () Bool)

(assert (=> b!1053734 (= e!598353 e!598350)))

(declare-fun res!702053 () Bool)

(assert (=> b!1053734 (=> res!702053 e!598350)))

(declare-fun lt!465262 () (_ BitVec 32))

(assert (=> b!1053734 (= res!702053 (or (bvslt lt!465260 #b00000000000000000000000000000000) (bvsge lt!465262 (size!32458 a!3488)) (bvsge lt!465260 (size!32458 a!3488))))))

(assert (=> b!1053734 (arrayContainsKey!0 a!3488 k0!2747 lt!465262)))

(declare-datatypes ((Unit!34483 0))(
  ( (Unit!34484) )
))
(declare-fun lt!465258 () Unit!34483)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66376 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34483)

(assert (=> b!1053734 (= lt!465258 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!465262))))

(assert (=> b!1053734 (= lt!465262 (bvadd #b00000000000000000000000000000001 lt!465260))))

(assert (=> b!1053734 (arrayNoDuplicates!0 a!3488 lt!465260 Nil!22200)))

(declare-fun lt!465261 () Unit!34483)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66376 (_ BitVec 32) (_ BitVec 32)) Unit!34483)

(assert (=> b!1053734 (= lt!465261 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!465260))))

(declare-fun b!1053735 () Bool)

(declare-fun e!598352 () Bool)

(assert (=> b!1053735 (= e!598354 e!598352)))

(declare-fun res!702051 () Bool)

(assert (=> b!1053735 (=> (not res!702051) (not e!598352))))

(declare-fun lt!465259 () array!66376)

(assert (=> b!1053735 (= res!702051 (arrayContainsKey!0 lt!465259 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053735 (= lt!465259 (array!66377 (store (arr!31921 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32458 a!3488)))))

(declare-fun b!1053726 () Bool)

(assert (=> b!1053726 (= e!598352 e!598349)))

(declare-fun res!702050 () Bool)

(assert (=> b!1053726 (=> (not res!702050) (not e!598349))))

(assert (=> b!1053726 (= res!702050 (not (= lt!465260 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66376 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053726 (= lt!465260 (arrayScanForKey!0 lt!465259 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!702045 () Bool)

(assert (=> start!92760 (=> (not res!702045) (not e!598354))))

(assert (=> start!92760 (= res!702045 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32458 a!3488)) (bvslt (size!32458 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92760 e!598354))

(assert (=> start!92760 true))

(declare-fun array_inv!24703 (array!66376) Bool)

(assert (=> start!92760 (array_inv!24703 a!3488)))

(assert (= (and start!92760 res!702045) b!1053732))

(assert (= (and b!1053732 res!702046) b!1053733))

(assert (= (and b!1053733 res!702048) b!1053728))

(assert (= (and b!1053728 res!702054) b!1053735))

(assert (= (and b!1053735 res!702051) b!1053726))

(assert (= (and b!1053726 res!702050) b!1053731))

(assert (= (and b!1053731 res!702047) b!1053730))

(assert (= (and b!1053730 (not res!702055)) b!1053729))

(assert (= (and b!1053731 (not res!702052)) b!1053734))

(assert (= (and b!1053734 (not res!702053)) b!1053724))

(assert (= (and b!1053724 (not res!702049)) b!1053725))

(assert (= (and b!1053725 (not res!702056)) b!1053727))

(declare-fun m!974459 () Bool)

(assert (=> b!1053731 m!974459))

(declare-fun m!974461 () Bool)

(assert (=> b!1053731 m!974461))

(declare-fun m!974463 () Bool)

(assert (=> b!1053725 m!974463))

(declare-fun m!974465 () Bool)

(assert (=> b!1053735 m!974465))

(assert (=> b!1053735 m!974459))

(declare-fun m!974467 () Bool)

(assert (=> b!1053734 m!974467))

(declare-fun m!974469 () Bool)

(assert (=> b!1053734 m!974469))

(declare-fun m!974471 () Bool)

(assert (=> b!1053734 m!974471))

(declare-fun m!974473 () Bool)

(assert (=> b!1053734 m!974473))

(declare-fun m!974475 () Bool)

(assert (=> b!1053726 m!974475))

(declare-fun m!974477 () Bool)

(assert (=> b!1053732 m!974477))

(declare-fun m!974479 () Bool)

(assert (=> b!1053727 m!974479))

(declare-fun m!974481 () Bool)

(assert (=> b!1053733 m!974481))

(declare-fun m!974483 () Bool)

(assert (=> b!1053728 m!974483))

(declare-fun m!974485 () Bool)

(assert (=> start!92760 m!974485))

(declare-fun m!974487 () Bool)

(assert (=> b!1053729 m!974487))

(declare-fun m!974489 () Bool)

(assert (=> b!1053724 m!974489))

(check-sat (not b!1053732) (not b!1053729) (not b!1053733) (not b!1053727) (not b!1053734) (not start!92760) (not b!1053735) (not b!1053725) (not b!1053724) (not b!1053726))
(check-sat)
