; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92856 () Bool)

(assert start!92856)

(declare-fun b!1054527 () Bool)

(declare-fun res!703474 () Bool)

(declare-fun e!599124 () Bool)

(assert (=> b!1054527 (=> (not res!703474) (not e!599124))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054527 (= res!703474 (validKeyInArray!0 k!2747))))

(declare-fun b!1054528 () Bool)

(declare-fun e!599125 () Bool)

(declare-fun e!599121 () Bool)

(assert (=> b!1054528 (= e!599125 (not e!599121))))

(declare-fun res!703473 () Bool)

(assert (=> b!1054528 (=> res!703473 e!599121)))

(declare-fun lt!465441 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054528 (= res!703473 (bvsle lt!465441 i!1381))))

(declare-fun e!599122 () Bool)

(assert (=> b!1054528 e!599122))

(declare-fun res!703475 () Bool)

(assert (=> b!1054528 (=> (not res!703475) (not e!599122))))

(declare-datatypes ((array!66516 0))(
  ( (array!66517 (arr!31990 (Array (_ BitVec 32) (_ BitVec 64))) (size!32526 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66516)

(assert (=> b!1054528 (= res!703475 (= (select (store (arr!31990 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465441) k!2747))))

(declare-fun e!599120 () Bool)

(declare-fun b!1054529 () Bool)

(declare-fun arrayContainsKey!0 (array!66516 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054529 (= e!599120 (arrayContainsKey!0 a!3488 k!2747 lt!465441))))

(declare-fun b!1054530 () Bool)

(assert (=> b!1054530 (= e!599121 true)))

(assert (=> b!1054530 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34538 0))(
  ( (Unit!34539) )
))
(declare-fun lt!465444 () Unit!34538)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66516 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34538)

(assert (=> b!1054530 (= lt!465444 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!465441 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-datatypes ((List!22302 0))(
  ( (Nil!22299) (Cons!22298 (h!23507 (_ BitVec 64)) (t!31609 List!22302)) )
))
(declare-fun arrayNoDuplicates!0 (array!66516 (_ BitVec 32) List!22302) Bool)

(assert (=> b!1054530 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22299)))

(declare-fun lt!465442 () Unit!34538)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66516 (_ BitVec 32) (_ BitVec 32)) Unit!34538)

(assert (=> b!1054530 (= lt!465442 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1054531 () Bool)

(declare-fun res!703470 () Bool)

(assert (=> b!1054531 (=> (not res!703470) (not e!599124))))

(assert (=> b!1054531 (= res!703470 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22299))))

(declare-fun res!703467 () Bool)

(assert (=> start!92856 (=> (not res!703467) (not e!599124))))

(assert (=> start!92856 (= res!703467 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32526 a!3488)) (bvslt (size!32526 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92856 e!599124))

(assert (=> start!92856 true))

(declare-fun array_inv!24770 (array!66516) Bool)

(assert (=> start!92856 (array_inv!24770 a!3488)))

(declare-fun b!1054532 () Bool)

(declare-fun e!599123 () Bool)

(assert (=> b!1054532 (= e!599123 e!599125)))

(declare-fun res!703472 () Bool)

(assert (=> b!1054532 (=> (not res!703472) (not e!599125))))

(assert (=> b!1054532 (= res!703472 (not (= lt!465441 i!1381)))))

(declare-fun lt!465443 () array!66516)

(declare-fun arrayScanForKey!0 (array!66516 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054532 (= lt!465441 (arrayScanForKey!0 lt!465443 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1054533 () Bool)

(assert (=> b!1054533 (= e!599122 e!599120)))

(declare-fun res!703471 () Bool)

(assert (=> b!1054533 (=> res!703471 e!599120)))

(assert (=> b!1054533 (= res!703471 (bvsle lt!465441 i!1381))))

(declare-fun b!1054534 () Bool)

(declare-fun res!703468 () Bool)

(assert (=> b!1054534 (=> (not res!703468) (not e!599124))))

(assert (=> b!1054534 (= res!703468 (= (select (arr!31990 a!3488) i!1381) k!2747))))

(declare-fun b!1054535 () Bool)

(assert (=> b!1054535 (= e!599124 e!599123)))

(declare-fun res!703469 () Bool)

(assert (=> b!1054535 (=> (not res!703469) (not e!599123))))

(assert (=> b!1054535 (= res!703469 (arrayContainsKey!0 lt!465443 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1054535 (= lt!465443 (array!66517 (store (arr!31990 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32526 a!3488)))))

(assert (= (and start!92856 res!703467) b!1054531))

(assert (= (and b!1054531 res!703470) b!1054527))

(assert (= (and b!1054527 res!703474) b!1054534))

(assert (= (and b!1054534 res!703468) b!1054535))

(assert (= (and b!1054535 res!703469) b!1054532))

(assert (= (and b!1054532 res!703472) b!1054528))

(assert (= (and b!1054528 res!703475) b!1054533))

(assert (= (and b!1054533 (not res!703471)) b!1054529))

(assert (= (and b!1054528 (not res!703473)) b!1054530))

(declare-fun m!974579 () Bool)

(assert (=> b!1054528 m!974579))

(declare-fun m!974581 () Bool)

(assert (=> b!1054528 m!974581))

(declare-fun m!974583 () Bool)

(assert (=> b!1054534 m!974583))

(declare-fun m!974585 () Bool)

(assert (=> b!1054535 m!974585))

(assert (=> b!1054535 m!974579))

(declare-fun m!974587 () Bool)

(assert (=> b!1054529 m!974587))

(declare-fun m!974589 () Bool)

(assert (=> b!1054532 m!974589))

(declare-fun m!974591 () Bool)

(assert (=> b!1054531 m!974591))

(declare-fun m!974593 () Bool)

(assert (=> start!92856 m!974593))

(declare-fun m!974595 () Bool)

(assert (=> b!1054530 m!974595))

(declare-fun m!974597 () Bool)

(assert (=> b!1054530 m!974597))

(declare-fun m!974599 () Bool)

(assert (=> b!1054530 m!974599))

(declare-fun m!974601 () Bool)

(assert (=> b!1054530 m!974601))

(declare-fun m!974603 () Bool)

(assert (=> b!1054527 m!974603))

(push 1)

