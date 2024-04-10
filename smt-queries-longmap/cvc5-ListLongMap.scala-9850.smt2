; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116786 () Bool)

(assert start!116786)

(declare-fun b!1376350 () Bool)

(declare-fun e!779692 () Bool)

(assert (=> b!1376350 (= e!779692 false)))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93455 0))(
  ( (array!93456 (arr!45131 (Array (_ BitVec 32) (_ BitVec 64))) (size!45681 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93455)

(declare-fun lt!605272 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93455 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376350 (= lt!605272 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun lt!605271 () (_ BitVec 32))

(assert (=> b!1376350 (= lt!605271 (arrayCountValidKeys!0 (array!93456 (store (arr!45131 a!4032) i!1445 k!2947) (size!45681 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376348 () Bool)

(declare-fun res!919233 () Bool)

(assert (=> b!1376348 (=> (not res!919233) (not e!779692))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376348 (= res!919233 (not (validKeyInArray!0 k!2947)))))

(declare-fun res!919232 () Bool)

(assert (=> start!116786 (=> (not res!919232) (not e!779692))))

(assert (=> start!116786 (= res!919232 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45681 a!4032))))))

(assert (=> start!116786 e!779692))

(assert (=> start!116786 true))

(declare-fun array_inv!34159 (array!93455) Bool)

(assert (=> start!116786 (array_inv!34159 a!4032)))

(declare-fun b!1376347 () Bool)

(declare-fun res!919231 () Bool)

(assert (=> b!1376347 (=> (not res!919231) (not e!779692))))

(assert (=> b!1376347 (= res!919231 (validKeyInArray!0 (select (arr!45131 a!4032) i!1445)))))

(declare-fun b!1376349 () Bool)

(declare-fun res!919234 () Bool)

(assert (=> b!1376349 (=> (not res!919234) (not e!779692))))

(assert (=> b!1376349 (= res!919234 (and (bvslt (size!45681 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45681 a!4032)) (bvsgt to!206 i!1445)))))

(assert (= (and start!116786 res!919232) b!1376347))

(assert (= (and b!1376347 res!919231) b!1376348))

(assert (= (and b!1376348 res!919233) b!1376349))

(assert (= (and b!1376349 res!919234) b!1376350))

(declare-fun m!1260409 () Bool)

(assert (=> b!1376350 m!1260409))

(declare-fun m!1260411 () Bool)

(assert (=> b!1376350 m!1260411))

(declare-fun m!1260413 () Bool)

(assert (=> b!1376350 m!1260413))

(declare-fun m!1260415 () Bool)

(assert (=> b!1376348 m!1260415))

(declare-fun m!1260417 () Bool)

(assert (=> start!116786 m!1260417))

(declare-fun m!1260419 () Bool)

(assert (=> b!1376347 m!1260419))

(assert (=> b!1376347 m!1260419))

(declare-fun m!1260421 () Bool)

(assert (=> b!1376347 m!1260421))

(push 1)

(assert (not b!1376350))

(assert (not start!116786))

(assert (not b!1376347))

(assert (not b!1376348))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

