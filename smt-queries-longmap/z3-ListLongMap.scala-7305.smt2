; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93666 () Bool)

(assert start!93666)

(declare-fun b!1059574 () Bool)

(declare-fun e!602863 () Bool)

(declare-fun e!602862 () Bool)

(assert (=> b!1059574 (= e!602863 e!602862)))

(declare-fun res!707350 () Bool)

(assert (=> b!1059574 (=> (not res!707350) (not e!602862))))

(declare-datatypes ((array!66784 0))(
  ( (array!66785 (arr!32104 (Array (_ BitVec 32) (_ BitVec 64))) (size!32641 (_ BitVec 32))) )
))
(declare-fun lt!467298 () array!66784)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66784 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1059574 (= res!707350 (arrayContainsKey!0 lt!467298 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66784)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1059574 (= lt!467298 (array!66785 (store (arr!32104 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32641 a!3488)))))

(declare-fun b!1059575 () Bool)

(declare-fun e!602865 () Bool)

(declare-fun e!602859 () Bool)

(assert (=> b!1059575 (= e!602865 (not e!602859))))

(declare-fun res!707347 () Bool)

(assert (=> b!1059575 (=> res!707347 e!602859)))

(declare-fun lt!467301 () (_ BitVec 32))

(assert (=> b!1059575 (= res!707347 (or (bvsgt lt!467301 i!1381) (bvsle i!1381 lt!467301)))))

(declare-fun e!602860 () Bool)

(assert (=> b!1059575 e!602860))

(declare-fun res!707352 () Bool)

(assert (=> b!1059575 (=> (not res!707352) (not e!602860))))

(assert (=> b!1059575 (= res!707352 (= (select (store (arr!32104 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!467301) k0!2747))))

(declare-fun b!1059576 () Bool)

(declare-fun res!707343 () Bool)

(declare-fun e!602866 () Bool)

(assert (=> b!1059576 (=> res!707343 e!602866)))

(declare-datatypes ((List!22386 0))(
  ( (Nil!22383) (Cons!22382 (h!23600 (_ BitVec 64)) (t!31685 List!22386)) )
))
(declare-fun noDuplicate!1582 (List!22386) Bool)

(assert (=> b!1059576 (= res!707343 (not (noDuplicate!1582 Nil!22383)))))

(declare-fun b!1059577 () Bool)

(assert (=> b!1059577 (= e!602866 true)))

(declare-fun lt!467302 () Bool)

(declare-fun contains!6233 (List!22386 (_ BitVec 64)) Bool)

(assert (=> b!1059577 (= lt!467302 (contains!6233 Nil!22383 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1059578 () Bool)

(declare-fun res!707348 () Bool)

(assert (=> b!1059578 (=> (not res!707348) (not e!602863))))

(assert (=> b!1059578 (= res!707348 (= (select (arr!32104 a!3488) i!1381) k0!2747))))

(declare-fun b!1059579 () Bool)

(declare-fun res!707354 () Bool)

(assert (=> b!1059579 (=> res!707354 e!602866)))

(assert (=> b!1059579 (= res!707354 (contains!6233 Nil!22383 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1059580 () Bool)

(assert (=> b!1059580 (= e!602859 e!602866)))

(declare-fun res!707353 () Bool)

(assert (=> b!1059580 (=> res!707353 e!602866)))

(declare-fun lt!467299 () (_ BitVec 32))

(assert (=> b!1059580 (= res!707353 (or (bvslt lt!467301 #b00000000000000000000000000000000) (bvsge lt!467299 (size!32641 a!3488)) (bvsge lt!467301 (size!32641 a!3488))))))

(assert (=> b!1059580 (arrayContainsKey!0 a!3488 k0!2747 lt!467299)))

(declare-datatypes ((Unit!34699 0))(
  ( (Unit!34700) )
))
(declare-fun lt!467300 () Unit!34699)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66784 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34699)

(assert (=> b!1059580 (= lt!467300 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!467299))))

(assert (=> b!1059580 (= lt!467299 (bvadd #b00000000000000000000000000000001 lt!467301))))

(declare-fun arrayNoDuplicates!0 (array!66784 (_ BitVec 32) List!22386) Bool)

(assert (=> b!1059580 (arrayNoDuplicates!0 a!3488 lt!467301 Nil!22383)))

(declare-fun lt!467303 () Unit!34699)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66784 (_ BitVec 32) (_ BitVec 32)) Unit!34699)

(assert (=> b!1059580 (= lt!467303 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!467301))))

(declare-fun b!1059581 () Bool)

(declare-fun res!707346 () Bool)

(assert (=> b!1059581 (=> (not res!707346) (not e!602863))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1059581 (= res!707346 (validKeyInArray!0 k0!2747))))

(declare-fun b!1059583 () Bool)

(declare-fun e!602861 () Bool)

(assert (=> b!1059583 (= e!602860 e!602861)))

(declare-fun res!707351 () Bool)

(assert (=> b!1059583 (=> res!707351 e!602861)))

(assert (=> b!1059583 (= res!707351 (or (bvsgt lt!467301 i!1381) (bvsle i!1381 lt!467301)))))

(declare-fun b!1059584 () Bool)

(declare-fun res!707344 () Bool)

(assert (=> b!1059584 (=> (not res!707344) (not e!602863))))

(assert (=> b!1059584 (= res!707344 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22383))))

(declare-fun b!1059585 () Bool)

(assert (=> b!1059585 (= e!602861 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1059582 () Bool)

(assert (=> b!1059582 (= e!602862 e!602865)))

(declare-fun res!707345 () Bool)

(assert (=> b!1059582 (=> (not res!707345) (not e!602865))))

(assert (=> b!1059582 (= res!707345 (not (= lt!467301 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66784 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1059582 (= lt!467301 (arrayScanForKey!0 lt!467298 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!707349 () Bool)

(assert (=> start!93666 (=> (not res!707349) (not e!602863))))

(assert (=> start!93666 (= res!707349 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32641 a!3488)) (bvslt (size!32641 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93666 e!602863))

(assert (=> start!93666 true))

(declare-fun array_inv!24886 (array!66784) Bool)

(assert (=> start!93666 (array_inv!24886 a!3488)))

(assert (= (and start!93666 res!707349) b!1059584))

(assert (= (and b!1059584 res!707344) b!1059581))

(assert (= (and b!1059581 res!707346) b!1059578))

(assert (= (and b!1059578 res!707348) b!1059574))

(assert (= (and b!1059574 res!707350) b!1059582))

(assert (= (and b!1059582 res!707345) b!1059575))

(assert (= (and b!1059575 res!707352) b!1059583))

(assert (= (and b!1059583 (not res!707351)) b!1059585))

(assert (= (and b!1059575 (not res!707347)) b!1059580))

(assert (= (and b!1059580 (not res!707353)) b!1059576))

(assert (= (and b!1059576 (not res!707343)) b!1059579))

(assert (= (and b!1059579 (not res!707354)) b!1059577))

(declare-fun m!979559 () Bool)

(assert (=> b!1059576 m!979559))

(declare-fun m!979561 () Bool)

(assert (=> b!1059584 m!979561))

(declare-fun m!979563 () Bool)

(assert (=> b!1059582 m!979563))

(declare-fun m!979565 () Bool)

(assert (=> b!1059575 m!979565))

(declare-fun m!979567 () Bool)

(assert (=> b!1059575 m!979567))

(declare-fun m!979569 () Bool)

(assert (=> b!1059580 m!979569))

(declare-fun m!979571 () Bool)

(assert (=> b!1059580 m!979571))

(declare-fun m!979573 () Bool)

(assert (=> b!1059580 m!979573))

(declare-fun m!979575 () Bool)

(assert (=> b!1059580 m!979575))

(declare-fun m!979577 () Bool)

(assert (=> b!1059585 m!979577))

(declare-fun m!979579 () Bool)

(assert (=> b!1059577 m!979579))

(declare-fun m!979581 () Bool)

(assert (=> start!93666 m!979581))

(declare-fun m!979583 () Bool)

(assert (=> b!1059574 m!979583))

(assert (=> b!1059574 m!979565))

(declare-fun m!979585 () Bool)

(assert (=> b!1059578 m!979585))

(declare-fun m!979587 () Bool)

(assert (=> b!1059581 m!979587))

(declare-fun m!979589 () Bool)

(assert (=> b!1059579 m!979589))

(check-sat (not b!1059576) (not b!1059579) (not b!1059580) (not b!1059581) (not b!1059584) (not b!1059585) (not b!1059574) (not b!1059577) (not b!1059582) (not start!93666))
(check-sat)
