; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92522 () Bool)

(assert start!92522)

(declare-fun b!1052337 () Bool)

(declare-fun res!701463 () Bool)

(declare-fun e!597459 () Bool)

(assert (=> b!1052337 (=> (not res!701463) (not e!597459))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052337 (= res!701463 (validKeyInArray!0 k0!2747))))

(declare-fun b!1052338 () Bool)

(declare-fun res!701474 () Bool)

(assert (=> b!1052338 (=> (not res!701474) (not e!597459))))

(declare-datatypes ((array!66323 0))(
  ( (array!66324 (arr!31901 (Array (_ BitVec 32) (_ BitVec 64))) (size!32437 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66323)

(declare-datatypes ((List!22213 0))(
  ( (Nil!22210) (Cons!22209 (h!23418 (_ BitVec 64)) (t!31520 List!22213)) )
))
(declare-fun arrayNoDuplicates!0 (array!66323 (_ BitVec 32) List!22213) Bool)

(assert (=> b!1052338 (= res!701474 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22210))))

(declare-fun b!1052339 () Bool)

(declare-fun e!597462 () Bool)

(declare-fun e!597458 () Bool)

(assert (=> b!1052339 (= e!597462 e!597458)))

(declare-fun res!701470 () Bool)

(assert (=> b!1052339 (=> res!701470 e!597458)))

(declare-fun lt!464711 () (_ BitVec 32))

(declare-fun lt!464710 () (_ BitVec 32))

(assert (=> b!1052339 (= res!701470 (or (bvslt lt!464710 #b00000000000000000000000000000000) (bvsge lt!464711 (size!32437 a!3488)) (bvsge lt!464710 (size!32437 a!3488))))))

(declare-fun arrayContainsKey!0 (array!66323 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052339 (arrayContainsKey!0 a!3488 k0!2747 lt!464711)))

(declare-datatypes ((Unit!34474 0))(
  ( (Unit!34475) )
))
(declare-fun lt!464709 () Unit!34474)

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66323 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34474)

(assert (=> b!1052339 (= lt!464709 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!464711))))

(assert (=> b!1052339 (= lt!464711 (bvadd #b00000000000000000000000000000001 lt!464710))))

(assert (=> b!1052339 (arrayNoDuplicates!0 a!3488 lt!464710 Nil!22210)))

(declare-fun lt!464707 () Unit!34474)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66323 (_ BitVec 32) (_ BitVec 32)) Unit!34474)

(assert (=> b!1052339 (= lt!464707 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464710))))

(declare-fun b!1052340 () Bool)

(declare-fun res!701464 () Bool)

(assert (=> b!1052340 (=> (not res!701464) (not e!597459))))

(assert (=> b!1052340 (= res!701464 (= (select (arr!31901 a!3488) i!1381) k0!2747))))

(declare-fun b!1052341 () Bool)

(declare-fun res!701473 () Bool)

(assert (=> b!1052341 (=> res!701473 e!597458)))

(declare-fun contains!6155 (List!22213 (_ BitVec 64)) Bool)

(assert (=> b!1052341 (= res!701473 (contains!6155 Nil!22210 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1052342 () Bool)

(declare-fun e!597460 () Bool)

(assert (=> b!1052342 (= e!597459 e!597460)))

(declare-fun res!701471 () Bool)

(assert (=> b!1052342 (=> (not res!701471) (not e!597460))))

(declare-fun lt!464708 () array!66323)

(assert (=> b!1052342 (= res!701471 (arrayContainsKey!0 lt!464708 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052342 (= lt!464708 (array!66324 (store (arr!31901 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32437 a!3488)))))

(declare-fun b!1052343 () Bool)

(declare-fun res!701472 () Bool)

(assert (=> b!1052343 (=> res!701472 e!597458)))

(declare-fun noDuplicate!1540 (List!22213) Bool)

(assert (=> b!1052343 (= res!701472 (not (noDuplicate!1540 Nil!22210)))))

(declare-fun b!1052344 () Bool)

(declare-fun e!597461 () Bool)

(assert (=> b!1052344 (= e!597461 (not e!597462))))

(declare-fun res!701469 () Bool)

(assert (=> b!1052344 (=> res!701469 e!597462)))

(assert (=> b!1052344 (= res!701469 (or (bvsgt lt!464710 i!1381) (bvsle i!1381 lt!464710)))))

(declare-fun e!597456 () Bool)

(assert (=> b!1052344 e!597456))

(declare-fun res!701465 () Bool)

(assert (=> b!1052344 (=> (not res!701465) (not e!597456))))

(assert (=> b!1052344 (= res!701465 (= (select (store (arr!31901 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464710) k0!2747))))

(declare-fun b!1052345 () Bool)

(declare-fun e!597457 () Bool)

(assert (=> b!1052345 (= e!597456 e!597457)))

(declare-fun res!701468 () Bool)

(assert (=> b!1052345 (=> res!701468 e!597457)))

(assert (=> b!1052345 (= res!701468 (or (bvsgt lt!464710 i!1381) (bvsle i!1381 lt!464710)))))

(declare-fun res!701467 () Bool)

(assert (=> start!92522 (=> (not res!701467) (not e!597459))))

(assert (=> start!92522 (= res!701467 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32437 a!3488)) (bvslt (size!32437 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92522 e!597459))

(assert (=> start!92522 true))

(declare-fun array_inv!24681 (array!66323) Bool)

(assert (=> start!92522 (array_inv!24681 a!3488)))

(declare-fun b!1052346 () Bool)

(assert (=> b!1052346 (= e!597458 true)))

(declare-fun lt!464712 () Bool)

(assert (=> b!1052346 (= lt!464712 (contains!6155 Nil!22210 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1052347 () Bool)

(assert (=> b!1052347 (= e!597460 e!597461)))

(declare-fun res!701466 () Bool)

(assert (=> b!1052347 (=> (not res!701466) (not e!597461))))

(assert (=> b!1052347 (= res!701466 (not (= lt!464710 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66323 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052347 (= lt!464710 (arrayScanForKey!0 lt!464708 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052348 () Bool)

(assert (=> b!1052348 (= e!597457 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(assert (= (and start!92522 res!701467) b!1052338))

(assert (= (and b!1052338 res!701474) b!1052337))

(assert (= (and b!1052337 res!701463) b!1052340))

(assert (= (and b!1052340 res!701464) b!1052342))

(assert (= (and b!1052342 res!701471) b!1052347))

(assert (= (and b!1052347 res!701466) b!1052344))

(assert (= (and b!1052344 res!701465) b!1052345))

(assert (= (and b!1052345 (not res!701468)) b!1052348))

(assert (= (and b!1052344 (not res!701469)) b!1052339))

(assert (= (and b!1052339 (not res!701470)) b!1052343))

(assert (= (and b!1052343 (not res!701472)) b!1052341))

(assert (= (and b!1052341 (not res!701473)) b!1052346))

(declare-fun m!972727 () Bool)

(assert (=> b!1052340 m!972727))

(declare-fun m!972729 () Bool)

(assert (=> b!1052337 m!972729))

(declare-fun m!972731 () Bool)

(assert (=> b!1052344 m!972731))

(declare-fun m!972733 () Bool)

(assert (=> b!1052344 m!972733))

(declare-fun m!972735 () Bool)

(assert (=> b!1052347 m!972735))

(declare-fun m!972737 () Bool)

(assert (=> b!1052341 m!972737))

(declare-fun m!972739 () Bool)

(assert (=> b!1052343 m!972739))

(declare-fun m!972741 () Bool)

(assert (=> b!1052339 m!972741))

(declare-fun m!972743 () Bool)

(assert (=> b!1052339 m!972743))

(declare-fun m!972745 () Bool)

(assert (=> b!1052339 m!972745))

(declare-fun m!972747 () Bool)

(assert (=> b!1052339 m!972747))

(declare-fun m!972749 () Bool)

(assert (=> b!1052342 m!972749))

(assert (=> b!1052342 m!972731))

(declare-fun m!972751 () Bool)

(assert (=> b!1052348 m!972751))

(declare-fun m!972753 () Bool)

(assert (=> b!1052346 m!972753))

(declare-fun m!972755 () Bool)

(assert (=> b!1052338 m!972755))

(declare-fun m!972757 () Bool)

(assert (=> start!92522 m!972757))

(check-sat (not b!1052347) (not b!1052338) (not b!1052342) (not b!1052348) (not b!1052346) (not start!92522) (not b!1052339) (not b!1052341) (not b!1052337) (not b!1052343))
(check-sat)
