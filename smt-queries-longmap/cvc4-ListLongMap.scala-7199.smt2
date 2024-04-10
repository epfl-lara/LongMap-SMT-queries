; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92260 () Bool)

(assert start!92260)

(declare-fun b!1048516 () Bool)

(declare-fun e!594724 () Bool)

(assert (=> b!1048516 (= e!594724 (not true))))

(declare-fun e!594723 () Bool)

(assert (=> b!1048516 e!594723))

(declare-fun res!697649 () Bool)

(assert (=> b!1048516 (=> (not res!697649) (not e!594723))))

(declare-datatypes ((array!66061 0))(
  ( (array!66062 (arr!31770 (Array (_ BitVec 32) (_ BitVec 64))) (size!32306 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66061)

(declare-fun lt!463218 () (_ BitVec 32))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1048516 (= res!697649 (= (select (store (arr!31770 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463218) k!2747))))

(declare-fun b!1048517 () Bool)

(declare-fun e!594720 () Bool)

(assert (=> b!1048517 (= e!594720 e!594724)))

(declare-fun res!697644 () Bool)

(assert (=> b!1048517 (=> (not res!697644) (not e!594724))))

(assert (=> b!1048517 (= res!697644 (not (= lt!463218 i!1381)))))

(declare-fun lt!463217 () array!66061)

(declare-fun arrayScanForKey!0 (array!66061 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048517 (= lt!463218 (arrayScanForKey!0 lt!463217 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1048518 () Bool)

(declare-fun e!594719 () Bool)

(declare-fun arrayContainsKey!0 (array!66061 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048518 (= e!594719 (arrayContainsKey!0 a!3488 k!2747 lt!463218))))

(declare-fun b!1048519 () Bool)

(declare-fun res!697643 () Bool)

(declare-fun e!594722 () Bool)

(assert (=> b!1048519 (=> (not res!697643) (not e!594722))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048519 (= res!697643 (validKeyInArray!0 k!2747))))

(declare-fun b!1048521 () Bool)

(declare-fun res!697645 () Bool)

(assert (=> b!1048521 (=> (not res!697645) (not e!594722))))

(declare-datatypes ((List!22082 0))(
  ( (Nil!22079) (Cons!22078 (h!23287 (_ BitVec 64)) (t!31389 List!22082)) )
))
(declare-fun arrayNoDuplicates!0 (array!66061 (_ BitVec 32) List!22082) Bool)

(assert (=> b!1048521 (= res!697645 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22079))))

(declare-fun b!1048522 () Bool)

(declare-fun res!697648 () Bool)

(assert (=> b!1048522 (=> (not res!697648) (not e!594722))))

(assert (=> b!1048522 (= res!697648 (= (select (arr!31770 a!3488) i!1381) k!2747))))

(declare-fun b!1048523 () Bool)

(assert (=> b!1048523 (= e!594722 e!594720)))

(declare-fun res!697647 () Bool)

(assert (=> b!1048523 (=> (not res!697647) (not e!594720))))

(assert (=> b!1048523 (= res!697647 (arrayContainsKey!0 lt!463217 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1048523 (= lt!463217 (array!66062 (store (arr!31770 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32306 a!3488)))))

(declare-fun res!697646 () Bool)

(assert (=> start!92260 (=> (not res!697646) (not e!594722))))

(assert (=> start!92260 (= res!697646 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32306 a!3488)) (bvslt (size!32306 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92260 e!594722))

(assert (=> start!92260 true))

(declare-fun array_inv!24550 (array!66061) Bool)

(assert (=> start!92260 (array_inv!24550 a!3488)))

(declare-fun b!1048520 () Bool)

(assert (=> b!1048520 (= e!594723 e!594719)))

(declare-fun res!697642 () Bool)

(assert (=> b!1048520 (=> res!697642 e!594719)))

(assert (=> b!1048520 (= res!697642 (bvsle lt!463218 i!1381))))

(assert (= (and start!92260 res!697646) b!1048521))

(assert (= (and b!1048521 res!697645) b!1048519))

(assert (= (and b!1048519 res!697643) b!1048522))

(assert (= (and b!1048522 res!697648) b!1048523))

(assert (= (and b!1048523 res!697647) b!1048517))

(assert (= (and b!1048517 res!697644) b!1048516))

(assert (= (and b!1048516 res!697649) b!1048520))

(assert (= (and b!1048520 (not res!697642)) b!1048518))

(declare-fun m!969467 () Bool)

(assert (=> b!1048519 m!969467))

(declare-fun m!969469 () Bool)

(assert (=> b!1048523 m!969469))

(declare-fun m!969471 () Bool)

(assert (=> b!1048523 m!969471))

(declare-fun m!969473 () Bool)

(assert (=> b!1048521 m!969473))

(declare-fun m!969475 () Bool)

(assert (=> b!1048517 m!969475))

(declare-fun m!969477 () Bool)

(assert (=> b!1048522 m!969477))

(declare-fun m!969479 () Bool)

(assert (=> start!92260 m!969479))

(assert (=> b!1048516 m!969471))

(declare-fun m!969481 () Bool)

(assert (=> b!1048516 m!969481))

(declare-fun m!969483 () Bool)

(assert (=> b!1048518 m!969483))

(push 1)

(assert (not start!92260))

