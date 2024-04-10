; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92850 () Bool)

(assert start!92850)

(declare-fun b!1054446 () Bool)

(declare-fun e!599059 () Bool)

(assert (=> b!1054446 (= e!599059 true)))

(declare-datatypes ((array!66510 0))(
  ( (array!66511 (arr!31987 (Array (_ BitVec 32) (_ BitVec 64))) (size!32523 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66510)

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((List!22299 0))(
  ( (Nil!22296) (Cons!22295 (h!23504 (_ BitVec 64)) (t!31606 List!22299)) )
))
(declare-fun arrayNoDuplicates!0 (array!66510 (_ BitVec 32) List!22299) Bool)

(assert (=> b!1054446 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22296)))

(declare-datatypes ((Unit!34532 0))(
  ( (Unit!34533) )
))
(declare-fun lt!465413 () Unit!34532)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66510 (_ BitVec 32) (_ BitVec 32)) Unit!34532)

(assert (=> b!1054446 (= lt!465413 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1054447 () Bool)

(declare-fun res!703389 () Bool)

(declare-fun e!599057 () Bool)

(assert (=> b!1054447 (=> (not res!703389) (not e!599057))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054447 (= res!703389 (validKeyInArray!0 k!2747))))

(declare-fun b!1054448 () Bool)

(declare-fun e!599060 () Bool)

(assert (=> b!1054448 (= e!599060 (not e!599059))))

(declare-fun res!703391 () Bool)

(assert (=> b!1054448 (=> res!703391 e!599059)))

(declare-fun lt!465414 () (_ BitVec 32))

(assert (=> b!1054448 (= res!703391 (bvsle lt!465414 i!1381))))

(declare-fun e!599056 () Bool)

(assert (=> b!1054448 e!599056))

(declare-fun res!703390 () Bool)

(assert (=> b!1054448 (=> (not res!703390) (not e!599056))))

(assert (=> b!1054448 (= res!703390 (= (select (store (arr!31987 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465414) k!2747))))

(declare-fun b!1054449 () Bool)

(declare-fun e!599061 () Bool)

(assert (=> b!1054449 (= e!599056 e!599061)))

(declare-fun res!703388 () Bool)

(assert (=> b!1054449 (=> res!703388 e!599061)))

(assert (=> b!1054449 (= res!703388 (bvsle lt!465414 i!1381))))

(declare-fun b!1054450 () Bool)

(declare-fun e!599062 () Bool)

(assert (=> b!1054450 (= e!599062 e!599060)))

(declare-fun res!703394 () Bool)

(assert (=> b!1054450 (=> (not res!703394) (not e!599060))))

(assert (=> b!1054450 (= res!703394 (not (= lt!465414 i!1381)))))

(declare-fun lt!465412 () array!66510)

(declare-fun arrayScanForKey!0 (array!66510 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054450 (= lt!465414 (arrayScanForKey!0 lt!465412 k!2747 #b00000000000000000000000000000000))))

(declare-fun res!703386 () Bool)

(assert (=> start!92850 (=> (not res!703386) (not e!599057))))

(assert (=> start!92850 (= res!703386 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32523 a!3488)) (bvslt (size!32523 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92850 e!599057))

(assert (=> start!92850 true))

(declare-fun array_inv!24767 (array!66510) Bool)

(assert (=> start!92850 (array_inv!24767 a!3488)))

(declare-fun b!1054451 () Bool)

(declare-fun res!703393 () Bool)

(assert (=> b!1054451 (=> (not res!703393) (not e!599057))))

(assert (=> b!1054451 (= res!703393 (= (select (arr!31987 a!3488) i!1381) k!2747))))

(declare-fun b!1054452 () Bool)

(assert (=> b!1054452 (= e!599057 e!599062)))

(declare-fun res!703392 () Bool)

(assert (=> b!1054452 (=> (not res!703392) (not e!599062))))

(declare-fun arrayContainsKey!0 (array!66510 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054452 (= res!703392 (arrayContainsKey!0 lt!465412 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1054452 (= lt!465412 (array!66511 (store (arr!31987 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32523 a!3488)))))

(declare-fun b!1054453 () Bool)

(assert (=> b!1054453 (= e!599061 (arrayContainsKey!0 a!3488 k!2747 lt!465414))))

(declare-fun b!1054454 () Bool)

(declare-fun res!703387 () Bool)

(assert (=> b!1054454 (=> (not res!703387) (not e!599057))))

(assert (=> b!1054454 (= res!703387 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22296))))

(assert (= (and start!92850 res!703386) b!1054454))

(assert (= (and b!1054454 res!703387) b!1054447))

(assert (= (and b!1054447 res!703389) b!1054451))

(assert (= (and b!1054451 res!703393) b!1054452))

(assert (= (and b!1054452 res!703392) b!1054450))

(assert (= (and b!1054450 res!703394) b!1054448))

(assert (= (and b!1054448 res!703390) b!1054449))

(assert (= (and b!1054449 (not res!703388)) b!1054453))

(assert (= (and b!1054448 (not res!703391)) b!1054446))

(declare-fun m!974513 () Bool)

(assert (=> b!1054448 m!974513))

(declare-fun m!974515 () Bool)

(assert (=> b!1054448 m!974515))

(declare-fun m!974517 () Bool)

(assert (=> start!92850 m!974517))

(declare-fun m!974519 () Bool)

(assert (=> b!1054452 m!974519))

(assert (=> b!1054452 m!974513))

(declare-fun m!974521 () Bool)

(assert (=> b!1054447 m!974521))

(declare-fun m!974523 () Bool)

(assert (=> b!1054450 m!974523))

(declare-fun m!974525 () Bool)

(assert (=> b!1054454 m!974525))

(declare-fun m!974527 () Bool)

(assert (=> b!1054453 m!974527))

(declare-fun m!974529 () Bool)

(assert (=> b!1054451 m!974529))

(declare-fun m!974531 () Bool)

(assert (=> b!1054446 m!974531))

(declare-fun m!974533 () Bool)

(assert (=> b!1054446 m!974533))

(push 1)

