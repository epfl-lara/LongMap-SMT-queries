; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93660 () Bool)

(assert start!93660)

(declare-fun e!602794 () Bool)

(declare-datatypes ((array!66778 0))(
  ( (array!66779 (arr!32101 (Array (_ BitVec 32) (_ BitVec 64))) (size!32638 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66778)

(declare-fun b!1059466 () Bool)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66778 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1059466 (= e!602794 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun res!707241 () Bool)

(declare-fun e!602792 () Bool)

(assert (=> start!93660 (=> (not res!707241) (not e!602792))))

(assert (=> start!93660 (= res!707241 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32638 a!3488)) (bvslt (size!32638 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93660 e!602792))

(assert (=> start!93660 true))

(declare-fun array_inv!24883 (array!66778) Bool)

(assert (=> start!93660 (array_inv!24883 a!3488)))

(declare-fun b!1059467 () Bool)

(declare-fun e!602790 () Bool)

(declare-fun e!602791 () Bool)

(assert (=> b!1059467 (= e!602790 e!602791)))

(declare-fun res!707235 () Bool)

(assert (=> b!1059467 (=> (not res!707235) (not e!602791))))

(declare-fun lt!467245 () (_ BitVec 32))

(assert (=> b!1059467 (= res!707235 (not (= lt!467245 i!1381)))))

(declare-fun lt!467249 () array!66778)

(declare-fun arrayScanForKey!0 (array!66778 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1059467 (= lt!467245 (arrayScanForKey!0 lt!467249 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1059468 () Bool)

(declare-fun res!707242 () Bool)

(assert (=> b!1059468 (=> (not res!707242) (not e!602792))))

(assert (=> b!1059468 (= res!707242 (= (select (arr!32101 a!3488) i!1381) k0!2747))))

(declare-fun b!1059469 () Bool)

(declare-fun res!707236 () Bool)

(declare-fun e!602793 () Bool)

(assert (=> b!1059469 (=> res!707236 e!602793)))

(declare-datatypes ((List!22383 0))(
  ( (Nil!22380) (Cons!22379 (h!23597 (_ BitVec 64)) (t!31682 List!22383)) )
))
(declare-fun contains!6230 (List!22383 (_ BitVec 64)) Bool)

(assert (=> b!1059469 (= res!707236 (contains!6230 Nil!22380 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1059470 () Bool)

(assert (=> b!1059470 (= e!602792 e!602790)))

(declare-fun res!707240 () Bool)

(assert (=> b!1059470 (=> (not res!707240) (not e!602790))))

(assert (=> b!1059470 (= res!707240 (arrayContainsKey!0 lt!467249 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1059470 (= lt!467249 (array!66779 (store (arr!32101 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32638 a!3488)))))

(declare-fun b!1059471 () Bool)

(declare-fun res!707246 () Bool)

(assert (=> b!1059471 (=> res!707246 e!602793)))

(declare-fun noDuplicate!1579 (List!22383) Bool)

(assert (=> b!1059471 (= res!707246 (not (noDuplicate!1579 Nil!22380)))))

(declare-fun b!1059472 () Bool)

(declare-fun e!602788 () Bool)

(assert (=> b!1059472 (= e!602791 (not e!602788))))

(declare-fun res!707239 () Bool)

(assert (=> b!1059472 (=> res!707239 e!602788)))

(assert (=> b!1059472 (= res!707239 (or (bvsgt lt!467245 i!1381) (bvsle i!1381 lt!467245)))))

(declare-fun e!602789 () Bool)

(assert (=> b!1059472 e!602789))

(declare-fun res!707244 () Bool)

(assert (=> b!1059472 (=> (not res!707244) (not e!602789))))

(assert (=> b!1059472 (= res!707244 (= (select (store (arr!32101 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!467245) k0!2747))))

(declare-fun b!1059473 () Bool)

(declare-fun res!707237 () Bool)

(assert (=> b!1059473 (=> (not res!707237) (not e!602792))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1059473 (= res!707237 (validKeyInArray!0 k0!2747))))

(declare-fun b!1059474 () Bool)

(assert (=> b!1059474 (= e!602788 e!602793)))

(declare-fun res!707238 () Bool)

(assert (=> b!1059474 (=> res!707238 e!602793)))

(declare-fun lt!467248 () (_ BitVec 32))

(assert (=> b!1059474 (= res!707238 (or (bvslt lt!467245 #b00000000000000000000000000000000) (bvsge lt!467248 (size!32638 a!3488)) (bvsge lt!467245 (size!32638 a!3488))))))

(assert (=> b!1059474 (arrayContainsKey!0 a!3488 k0!2747 lt!467248)))

(declare-datatypes ((Unit!34693 0))(
  ( (Unit!34694) )
))
(declare-fun lt!467244 () Unit!34693)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66778 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34693)

(assert (=> b!1059474 (= lt!467244 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!467248))))

(assert (=> b!1059474 (= lt!467248 (bvadd #b00000000000000000000000000000001 lt!467245))))

(declare-fun arrayNoDuplicates!0 (array!66778 (_ BitVec 32) List!22383) Bool)

(assert (=> b!1059474 (arrayNoDuplicates!0 a!3488 lt!467245 Nil!22380)))

(declare-fun lt!467246 () Unit!34693)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66778 (_ BitVec 32) (_ BitVec 32)) Unit!34693)

(assert (=> b!1059474 (= lt!467246 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!467245))))

(declare-fun b!1059475 () Bool)

(assert (=> b!1059475 (= e!602793 true)))

(declare-fun lt!467247 () Bool)

(assert (=> b!1059475 (= lt!467247 (contains!6230 Nil!22380 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1059476 () Bool)

(assert (=> b!1059476 (= e!602789 e!602794)))

(declare-fun res!707243 () Bool)

(assert (=> b!1059476 (=> res!707243 e!602794)))

(assert (=> b!1059476 (= res!707243 (or (bvsgt lt!467245 i!1381) (bvsle i!1381 lt!467245)))))

(declare-fun b!1059477 () Bool)

(declare-fun res!707245 () Bool)

(assert (=> b!1059477 (=> (not res!707245) (not e!602792))))

(assert (=> b!1059477 (= res!707245 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22380))))

(assert (= (and start!93660 res!707241) b!1059477))

(assert (= (and b!1059477 res!707245) b!1059473))

(assert (= (and b!1059473 res!707237) b!1059468))

(assert (= (and b!1059468 res!707242) b!1059470))

(assert (= (and b!1059470 res!707240) b!1059467))

(assert (= (and b!1059467 res!707235) b!1059472))

(assert (= (and b!1059472 res!707244) b!1059476))

(assert (= (and b!1059476 (not res!707243)) b!1059466))

(assert (= (and b!1059472 (not res!707239)) b!1059474))

(assert (= (and b!1059474 (not res!707238)) b!1059471))

(assert (= (and b!1059471 (not res!707246)) b!1059469))

(assert (= (and b!1059469 (not res!707236)) b!1059475))

(declare-fun m!979463 () Bool)

(assert (=> b!1059467 m!979463))

(declare-fun m!979465 () Bool)

(assert (=> b!1059466 m!979465))

(declare-fun m!979467 () Bool)

(assert (=> b!1059477 m!979467))

(declare-fun m!979469 () Bool)

(assert (=> b!1059471 m!979469))

(declare-fun m!979471 () Bool)

(assert (=> b!1059469 m!979471))

(declare-fun m!979473 () Bool)

(assert (=> b!1059472 m!979473))

(declare-fun m!979475 () Bool)

(assert (=> b!1059472 m!979475))

(declare-fun m!979477 () Bool)

(assert (=> b!1059473 m!979477))

(declare-fun m!979479 () Bool)

(assert (=> b!1059468 m!979479))

(declare-fun m!979481 () Bool)

(assert (=> b!1059470 m!979481))

(assert (=> b!1059470 m!979473))

(declare-fun m!979483 () Bool)

(assert (=> b!1059475 m!979483))

(declare-fun m!979485 () Bool)

(assert (=> b!1059474 m!979485))

(declare-fun m!979487 () Bool)

(assert (=> b!1059474 m!979487))

(declare-fun m!979489 () Bool)

(assert (=> b!1059474 m!979489))

(declare-fun m!979491 () Bool)

(assert (=> b!1059474 m!979491))

(declare-fun m!979493 () Bool)

(assert (=> start!93660 m!979493))

(check-sat (not b!1059473) (not b!1059477) (not b!1059470) (not b!1059474) (not b!1059466) (not b!1059475) (not b!1059471) (not b!1059467) (not start!93660) (not b!1059469))
(check-sat)
