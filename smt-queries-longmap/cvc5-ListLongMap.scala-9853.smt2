; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116804 () Bool)

(assert start!116804)

(declare-fun b!1376479 () Bool)

(declare-fun res!919369 () Bool)

(declare-fun e!779745 () Bool)

(assert (=> b!1376479 (=> (not res!919369) (not e!779745))))

(declare-fun to!206 () (_ BitVec 32))

(declare-datatypes ((array!93473 0))(
  ( (array!93474 (arr!45140 (Array (_ BitVec 32) (_ BitVec 64))) (size!45690 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93473)

(assert (=> b!1376479 (= res!919369 (not (= to!206 (size!45690 a!4032))))))

(declare-fun b!1376480 () Bool)

(declare-fun res!919365 () Bool)

(assert (=> b!1376480 (=> (not res!919365) (not e!779745))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376480 (= res!919365 (validKeyInArray!0 (select (arr!45140 a!4032) i!1445)))))

(declare-fun b!1376481 () Bool)

(declare-fun res!919366 () Bool)

(assert (=> b!1376481 (=> (not res!919366) (not e!779745))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1376481 (= res!919366 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1376482 () Bool)

(assert (=> b!1376482 (= e!779745 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000) (bvsge to!206 (size!45690 a!4032))))))

(declare-fun b!1376483 () Bool)

(declare-fun res!919368 () Bool)

(assert (=> b!1376483 (=> (not res!919368) (not e!779745))))

(assert (=> b!1376483 (= res!919368 (validKeyInArray!0 (select (arr!45140 a!4032) to!206)))))

(declare-fun res!919363 () Bool)

(assert (=> start!116804 (=> (not res!919363) (not e!779745))))

(assert (=> start!116804 (= res!919363 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45690 a!4032))))))

(assert (=> start!116804 e!779745))

(assert (=> start!116804 true))

(declare-fun array_inv!34168 (array!93473) Bool)

(assert (=> start!116804 (array_inv!34168 a!4032)))

(declare-fun b!1376484 () Bool)

(declare-fun res!919367 () Bool)

(assert (=> b!1376484 (=> (not res!919367) (not e!779745))))

(assert (=> b!1376484 (= res!919367 (and (bvslt (size!45690 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45690 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376485 () Bool)

(declare-fun res!919364 () Bool)

(assert (=> b!1376485 (=> (not res!919364) (not e!779745))))

(declare-fun arrayCountValidKeys!0 (array!93473 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376485 (= res!919364 (= (arrayCountValidKeys!0 (array!93474 (store (arr!45140 a!4032) i!1445 k!2947) (size!45690 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206)))))

(assert (= (and start!116804 res!919363) b!1376480))

(assert (= (and b!1376480 res!919365) b!1376481))

(assert (= (and b!1376481 res!919366) b!1376484))

(assert (= (and b!1376484 res!919367) b!1376485))

(assert (= (and b!1376485 res!919364) b!1376479))

(assert (= (and b!1376479 res!919369) b!1376483))

(assert (= (and b!1376483 res!919368) b!1376482))

(declare-fun m!1260535 () Bool)

(assert (=> b!1376480 m!1260535))

(assert (=> b!1376480 m!1260535))

(declare-fun m!1260537 () Bool)

(assert (=> b!1376480 m!1260537))

(declare-fun m!1260539 () Bool)

(assert (=> b!1376485 m!1260539))

(declare-fun m!1260541 () Bool)

(assert (=> b!1376485 m!1260541))

(declare-fun m!1260543 () Bool)

(assert (=> b!1376485 m!1260543))

(declare-fun m!1260545 () Bool)

(assert (=> b!1376481 m!1260545))

(declare-fun m!1260547 () Bool)

(assert (=> b!1376483 m!1260547))

(assert (=> b!1376483 m!1260547))

(declare-fun m!1260549 () Bool)

(assert (=> b!1376483 m!1260549))

(declare-fun m!1260551 () Bool)

(assert (=> start!116804 m!1260551))

(push 1)

(assert (not b!1376485))

(assert (not b!1376483))

(assert (not b!1376480))

(assert (not start!116804))

(assert (not b!1376481))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

