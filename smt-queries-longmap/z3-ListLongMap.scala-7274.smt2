; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92860 () Bool)

(assert start!92860)

(declare-fun e!599097 () Bool)

(declare-datatypes ((array!66461 0))(
  ( (array!66462 (arr!31962 (Array (_ BitVec 32) (_ BitVec 64))) (size!32500 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66461)

(declare-fun lt!465277 () (_ BitVec 32))

(declare-fun b!1054457 () Bool)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66461 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054457 (= e!599097 (arrayContainsKey!0 a!3488 k0!2747 lt!465277))))

(declare-fun b!1054458 () Bool)

(declare-fun res!703487 () Bool)

(declare-fun e!599091 () Bool)

(assert (=> b!1054458 (=> (not res!703487) (not e!599091))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054458 (= res!703487 (= (select (arr!31962 a!3488) i!1381) k0!2747))))

(declare-fun b!1054459 () Bool)

(declare-fun res!703489 () Bool)

(assert (=> b!1054459 (=> (not res!703489) (not e!599091))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054459 (= res!703489 (validKeyInArray!0 k0!2747))))

(declare-fun b!1054460 () Bool)

(declare-fun res!703486 () Bool)

(assert (=> b!1054460 (=> (not res!703486) (not e!599091))))

(declare-datatypes ((List!22333 0))(
  ( (Nil!22330) (Cons!22329 (h!23538 (_ BitVec 64)) (t!31631 List!22333)) )
))
(declare-fun arrayNoDuplicates!0 (array!66461 (_ BitVec 32) List!22333) Bool)

(assert (=> b!1054460 (= res!703486 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22330))))

(declare-fun b!1054461 () Bool)

(declare-fun e!599093 () Bool)

(assert (=> b!1054461 (= e!599091 e!599093)))

(declare-fun res!703482 () Bool)

(assert (=> b!1054461 (=> (not res!703482) (not e!599093))))

(declare-fun lt!465280 () array!66461)

(assert (=> b!1054461 (= res!703482 (arrayContainsKey!0 lt!465280 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1054461 (= lt!465280 (array!66462 (store (arr!31962 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32500 a!3488)))))

(declare-fun b!1054462 () Bool)

(declare-fun e!599096 () Bool)

(declare-fun e!599092 () Bool)

(assert (=> b!1054462 (= e!599096 (not e!599092))))

(declare-fun res!703485 () Bool)

(assert (=> b!1054462 (=> res!703485 e!599092)))

(assert (=> b!1054462 (= res!703485 (bvsle lt!465277 i!1381))))

(declare-fun e!599094 () Bool)

(assert (=> b!1054462 e!599094))

(declare-fun res!703484 () Bool)

(assert (=> b!1054462 (=> (not res!703484) (not e!599094))))

(assert (=> b!1054462 (= res!703484 (= (select (store (arr!31962 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465277) k0!2747))))

(declare-fun b!1054463 () Bool)

(assert (=> b!1054463 (= e!599093 e!599096)))

(declare-fun res!703483 () Bool)

(assert (=> b!1054463 (=> (not res!703483) (not e!599096))))

(assert (=> b!1054463 (= res!703483 (not (= lt!465277 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66461 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054463 (= lt!465277 (arrayScanForKey!0 lt!465280 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!703488 () Bool)

(assert (=> start!92860 (=> (not res!703488) (not e!599091))))

(assert (=> start!92860 (= res!703488 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32500 a!3488)) (bvslt (size!32500 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92860 e!599091))

(assert (=> start!92860 true))

(declare-fun array_inv!24745 (array!66461) Bool)

(assert (=> start!92860 (array_inv!24745 a!3488)))

(declare-fun b!1054464 () Bool)

(assert (=> b!1054464 (= e!599094 e!599097)))

(declare-fun res!703481 () Bool)

(assert (=> b!1054464 (=> res!703481 e!599097)))

(assert (=> b!1054464 (= res!703481 (bvsle lt!465277 i!1381))))

(declare-fun b!1054465 () Bool)

(assert (=> b!1054465 (= e!599092 true)))

(assert (=> b!1054465 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34415 0))(
  ( (Unit!34416) )
))
(declare-fun lt!465278 () Unit!34415)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66461 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34415)

(assert (=> b!1054465 (= lt!465278 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!465277 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1054465 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22330)))

(declare-fun lt!465279 () Unit!34415)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66461 (_ BitVec 32) (_ BitVec 32)) Unit!34415)

(assert (=> b!1054465 (= lt!465279 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(assert (= (and start!92860 res!703488) b!1054460))

(assert (= (and b!1054460 res!703486) b!1054459))

(assert (= (and b!1054459 res!703489) b!1054458))

(assert (= (and b!1054458 res!703487) b!1054461))

(assert (= (and b!1054461 res!703482) b!1054463))

(assert (= (and b!1054463 res!703483) b!1054462))

(assert (= (and b!1054462 res!703484) b!1054464))

(assert (= (and b!1054464 (not res!703481)) b!1054457))

(assert (= (and b!1054462 (not res!703485)) b!1054465))

(declare-fun m!974041 () Bool)

(assert (=> b!1054460 m!974041))

(declare-fun m!974043 () Bool)

(assert (=> b!1054465 m!974043))

(declare-fun m!974045 () Bool)

(assert (=> b!1054465 m!974045))

(declare-fun m!974047 () Bool)

(assert (=> b!1054465 m!974047))

(declare-fun m!974049 () Bool)

(assert (=> b!1054465 m!974049))

(declare-fun m!974051 () Bool)

(assert (=> b!1054463 m!974051))

(declare-fun m!974053 () Bool)

(assert (=> b!1054459 m!974053))

(declare-fun m!974055 () Bool)

(assert (=> b!1054458 m!974055))

(declare-fun m!974057 () Bool)

(assert (=> start!92860 m!974057))

(declare-fun m!974059 () Bool)

(assert (=> b!1054462 m!974059))

(declare-fun m!974061 () Bool)

(assert (=> b!1054462 m!974061))

(declare-fun m!974063 () Bool)

(assert (=> b!1054457 m!974063))

(declare-fun m!974065 () Bool)

(assert (=> b!1054461 m!974065))

(assert (=> b!1054461 m!974059))

(check-sat (not b!1054460) (not b!1054457) (not start!92860) (not b!1054461) (not b!1054465) (not b!1054463) (not b!1054459))
(check-sat)
