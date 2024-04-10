; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92330 () Bool)

(assert start!92330)

(declare-fun res!698595 () Bool)

(declare-fun e!595437 () Bool)

(assert (=> start!92330 (=> (not res!698595) (not e!595437))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66131 0))(
  ( (array!66132 (arr!31805 (Array (_ BitVec 32) (_ BitVec 64))) (size!32341 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66131)

(assert (=> start!92330 (= res!698595 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32341 a!3488)) (bvslt (size!32341 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92330 e!595437))

(assert (=> start!92330 true))

(declare-fun array_inv!24585 (array!66131) Bool)

(assert (=> start!92330 (array_inv!24585 a!3488)))

(declare-fun b!1049466 () Bool)

(declare-fun lt!463525 () (_ BitVec 32))

(declare-fun e!595432 () Bool)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66131 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049466 (= e!595432 (arrayContainsKey!0 a!3488 k0!2747 lt!463525))))

(declare-fun b!1049467 () Bool)

(declare-fun res!698602 () Bool)

(assert (=> b!1049467 (=> (not res!698602) (not e!595437))))

(declare-datatypes ((List!22117 0))(
  ( (Nil!22114) (Cons!22113 (h!23322 (_ BitVec 64)) (t!31424 List!22117)) )
))
(declare-fun arrayNoDuplicates!0 (array!66131 (_ BitVec 32) List!22117) Bool)

(assert (=> b!1049467 (= res!698602 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22114))))

(declare-fun b!1049468 () Bool)

(declare-fun e!595433 () Bool)

(assert (=> b!1049468 (= e!595433 true)))

(declare-fun lt!463523 () Bool)

(declare-fun contains!6110 (List!22117 (_ BitVec 64)) Bool)

(assert (=> b!1049468 (= lt!463523 (contains!6110 Nil!22114 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049469 () Bool)

(declare-fun res!698603 () Bool)

(assert (=> b!1049469 (=> res!698603 e!595433)))

(declare-fun noDuplicate!1495 (List!22117) Bool)

(assert (=> b!1049469 (= res!698603 (not (noDuplicate!1495 Nil!22114)))))

(declare-fun b!1049470 () Bool)

(declare-fun res!698597 () Bool)

(assert (=> b!1049470 (=> (not res!698597) (not e!595437))))

(assert (=> b!1049470 (= res!698597 (= (select (arr!31805 a!3488) i!1381) k0!2747))))

(declare-fun b!1049471 () Bool)

(declare-fun e!595436 () Bool)

(assert (=> b!1049471 (= e!595436 e!595433)))

(declare-fun res!698596 () Bool)

(assert (=> b!1049471 (=> res!698596 e!595433)))

(assert (=> b!1049471 (= res!698596 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32341 a!3488)))))

(assert (=> b!1049471 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34330 0))(
  ( (Unit!34331) )
))
(declare-fun lt!463526 () Unit!34330)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66131 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34330)

(assert (=> b!1049471 (= lt!463526 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!463525 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1049471 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22114)))

(declare-fun lt!463524 () Unit!34330)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66131 (_ BitVec 32) (_ BitVec 32)) Unit!34330)

(assert (=> b!1049471 (= lt!463524 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1049472 () Bool)

(declare-fun e!595431 () Bool)

(assert (=> b!1049472 (= e!595437 e!595431)))

(declare-fun res!698600 () Bool)

(assert (=> b!1049472 (=> (not res!698600) (not e!595431))))

(declare-fun lt!463527 () array!66131)

(assert (=> b!1049472 (= res!698600 (arrayContainsKey!0 lt!463527 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1049472 (= lt!463527 (array!66132 (store (arr!31805 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32341 a!3488)))))

(declare-fun b!1049473 () Bool)

(declare-fun res!698601 () Bool)

(assert (=> b!1049473 (=> (not res!698601) (not e!595437))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049473 (= res!698601 (validKeyInArray!0 k0!2747))))

(declare-fun b!1049474 () Bool)

(declare-fun e!595435 () Bool)

(assert (=> b!1049474 (= e!595435 (not e!595436))))

(declare-fun res!698598 () Bool)

(assert (=> b!1049474 (=> res!698598 e!595436)))

(assert (=> b!1049474 (= res!698598 (bvsle lt!463525 i!1381))))

(declare-fun e!595434 () Bool)

(assert (=> b!1049474 e!595434))

(declare-fun res!698592 () Bool)

(assert (=> b!1049474 (=> (not res!698592) (not e!595434))))

(assert (=> b!1049474 (= res!698592 (= (select (store (arr!31805 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463525) k0!2747))))

(declare-fun b!1049475 () Bool)

(assert (=> b!1049475 (= e!595434 e!595432)))

(declare-fun res!698594 () Bool)

(assert (=> b!1049475 (=> res!698594 e!595432)))

(assert (=> b!1049475 (= res!698594 (bvsle lt!463525 i!1381))))

(declare-fun b!1049476 () Bool)

(declare-fun res!698593 () Bool)

(assert (=> b!1049476 (=> res!698593 e!595433)))

(assert (=> b!1049476 (= res!698593 (contains!6110 Nil!22114 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049477 () Bool)

(assert (=> b!1049477 (= e!595431 e!595435)))

(declare-fun res!698599 () Bool)

(assert (=> b!1049477 (=> (not res!698599) (not e!595435))))

(assert (=> b!1049477 (= res!698599 (not (= lt!463525 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66131 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049477 (= lt!463525 (arrayScanForKey!0 lt!463527 k0!2747 #b00000000000000000000000000000000))))

(assert (= (and start!92330 res!698595) b!1049467))

(assert (= (and b!1049467 res!698602) b!1049473))

(assert (= (and b!1049473 res!698601) b!1049470))

(assert (= (and b!1049470 res!698597) b!1049472))

(assert (= (and b!1049472 res!698600) b!1049477))

(assert (= (and b!1049477 res!698599) b!1049474))

(assert (= (and b!1049474 res!698592) b!1049475))

(assert (= (and b!1049475 (not res!698594)) b!1049466))

(assert (= (and b!1049474 (not res!698598)) b!1049471))

(assert (= (and b!1049471 (not res!698596)) b!1049469))

(assert (= (and b!1049469 (not res!698603)) b!1049476))

(assert (= (and b!1049476 (not res!698593)) b!1049468))

(declare-fun m!970225 () Bool)

(assert (=> start!92330 m!970225))

(declare-fun m!970227 () Bool)

(assert (=> b!1049474 m!970227))

(declare-fun m!970229 () Bool)

(assert (=> b!1049474 m!970229))

(declare-fun m!970231 () Bool)

(assert (=> b!1049476 m!970231))

(declare-fun m!970233 () Bool)

(assert (=> b!1049468 m!970233))

(declare-fun m!970235 () Bool)

(assert (=> b!1049467 m!970235))

(declare-fun m!970237 () Bool)

(assert (=> b!1049472 m!970237))

(assert (=> b!1049472 m!970227))

(declare-fun m!970239 () Bool)

(assert (=> b!1049470 m!970239))

(declare-fun m!970241 () Bool)

(assert (=> b!1049471 m!970241))

(declare-fun m!970243 () Bool)

(assert (=> b!1049471 m!970243))

(declare-fun m!970245 () Bool)

(assert (=> b!1049471 m!970245))

(declare-fun m!970247 () Bool)

(assert (=> b!1049471 m!970247))

(declare-fun m!970249 () Bool)

(assert (=> b!1049477 m!970249))

(declare-fun m!970251 () Bool)

(assert (=> b!1049473 m!970251))

(declare-fun m!970253 () Bool)

(assert (=> b!1049466 m!970253))

(declare-fun m!970255 () Bool)

(assert (=> b!1049469 m!970255))

(check-sat (not b!1049473) (not b!1049472) (not b!1049471) (not b!1049476) (not start!92330) (not b!1049468) (not b!1049467) (not b!1049477) (not b!1049466) (not b!1049469))
