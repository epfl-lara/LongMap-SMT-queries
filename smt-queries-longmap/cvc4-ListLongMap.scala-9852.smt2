; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116802 () Bool)

(assert start!116802)

(declare-fun b!1376460 () Bool)

(declare-fun res!919348 () Bool)

(declare-fun e!779739 () Bool)

(assert (=> b!1376460 (=> (not res!919348) (not e!779739))))

(declare-datatypes ((array!93471 0))(
  ( (array!93472 (arr!45139 (Array (_ BitVec 32) (_ BitVec 64))) (size!45689 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93471)

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376460 (= res!919348 (validKeyInArray!0 (select (arr!45139 a!4032) i!1445)))))

(declare-fun res!919344 () Bool)

(assert (=> start!116802 (=> (not res!919344) (not e!779739))))

(assert (=> start!116802 (= res!919344 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45689 a!4032))))))

(assert (=> start!116802 e!779739))

(assert (=> start!116802 true))

(declare-fun array_inv!34167 (array!93471) Bool)

(assert (=> start!116802 (array_inv!34167 a!4032)))

(declare-fun b!1376461 () Bool)

(declare-fun res!919345 () Bool)

(assert (=> b!1376461 (=> (not res!919345) (not e!779739))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1376461 (= res!919345 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1376462 () Bool)

(declare-fun res!919347 () Bool)

(assert (=> b!1376462 (=> (not res!919347) (not e!779739))))

(declare-fun to!206 () (_ BitVec 32))

(assert (=> b!1376462 (= res!919347 (and (bvslt (size!45689 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45689 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376463 () Bool)

(assert (=> b!1376463 (= e!779739 (and (not (= to!206 (size!45689 a!4032))) (bvsge to!206 (size!45689 a!4032))))))

(declare-fun b!1376464 () Bool)

(declare-fun res!919346 () Bool)

(assert (=> b!1376464 (=> (not res!919346) (not e!779739))))

(declare-fun arrayCountValidKeys!0 (array!93471 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376464 (= res!919346 (= (arrayCountValidKeys!0 (array!93472 (store (arr!45139 a!4032) i!1445 k!2947) (size!45689 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206)))))

(assert (= (and start!116802 res!919344) b!1376460))

(assert (= (and b!1376460 res!919348) b!1376461))

(assert (= (and b!1376461 res!919345) b!1376462))

(assert (= (and b!1376462 res!919347) b!1376464))

(assert (= (and b!1376464 res!919346) b!1376463))

(declare-fun m!1260521 () Bool)

(assert (=> b!1376460 m!1260521))

(assert (=> b!1376460 m!1260521))

(declare-fun m!1260523 () Bool)

(assert (=> b!1376460 m!1260523))

(declare-fun m!1260525 () Bool)

(assert (=> start!116802 m!1260525))

(declare-fun m!1260527 () Bool)

(assert (=> b!1376461 m!1260527))

(declare-fun m!1260529 () Bool)

(assert (=> b!1376464 m!1260529))

(declare-fun m!1260531 () Bool)

(assert (=> b!1376464 m!1260531))

(declare-fun m!1260533 () Bool)

(assert (=> b!1376464 m!1260533))

(push 1)

(assert (not b!1376464))

(assert (not start!116802))

(assert (not b!1376460))

(assert (not b!1376461))

(check-sat)

(pop 1)

(push 1)

(check-sat)

