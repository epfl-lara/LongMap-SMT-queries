; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116792 () Bool)

(assert start!116792)

(declare-fun b!1376385 () Bool)

(declare-fun res!919271 () Bool)

(declare-fun e!779709 () Bool)

(assert (=> b!1376385 (=> (not res!919271) (not e!779709))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93461 0))(
  ( (array!93462 (arr!45134 (Array (_ BitVec 32) (_ BitVec 64))) (size!45684 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93461)

(assert (=> b!1376385 (= res!919271 (and (bvslt (size!45684 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45684 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376386 () Bool)

(declare-fun res!919270 () Bool)

(assert (=> b!1376386 (=> (not res!919270) (not e!779709))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93461 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376386 (= res!919270 (= (arrayCountValidKeys!0 (array!93462 (store (arr!45134 a!4032) i!1445 k!2947) (size!45684 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206)))))

(declare-fun b!1376387 () Bool)

(declare-fun res!919273 () Bool)

(assert (=> b!1376387 (=> (not res!919273) (not e!779709))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376387 (= res!919273 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1376388 () Bool)

(declare-fun res!919272 () Bool)

(assert (=> b!1376388 (=> (not res!919272) (not e!779709))))

(assert (=> b!1376388 (= res!919272 (validKeyInArray!0 (select (arr!45134 a!4032) i!1445)))))

(declare-fun res!919269 () Bool)

(assert (=> start!116792 (=> (not res!919269) (not e!779709))))

(assert (=> start!116792 (= res!919269 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45684 a!4032))))))

(assert (=> start!116792 e!779709))

(assert (=> start!116792 true))

(declare-fun array_inv!34162 (array!93461) Bool)

(assert (=> start!116792 (array_inv!34162 a!4032)))

(declare-fun b!1376389 () Bool)

(assert (=> b!1376389 (= e!779709 (bvslt (bvsub (bvadd #b00000000000000000000000000000001 (size!45684 a!4032)) to!206) #b00000000000000000000000000000000))))

(assert (= (and start!116792 res!919269) b!1376388))

(assert (= (and b!1376388 res!919272) b!1376387))

(assert (= (and b!1376387 res!919273) b!1376385))

(assert (= (and b!1376385 res!919271) b!1376386))

(assert (= (and b!1376386 res!919270) b!1376389))

(declare-fun m!1260451 () Bool)

(assert (=> b!1376386 m!1260451))

(declare-fun m!1260453 () Bool)

(assert (=> b!1376386 m!1260453))

(declare-fun m!1260455 () Bool)

(assert (=> b!1376386 m!1260455))

(declare-fun m!1260457 () Bool)

(assert (=> b!1376387 m!1260457))

(declare-fun m!1260459 () Bool)

(assert (=> b!1376388 m!1260459))

(assert (=> b!1376388 m!1260459))

(declare-fun m!1260461 () Bool)

(assert (=> b!1376388 m!1260461))

(declare-fun m!1260463 () Bool)

(assert (=> start!116792 m!1260463))

(push 1)

(assert (not start!116792))

(assert (not b!1376386))

(assert (not b!1376387))

(assert (not b!1376388))

(check-sat)

(pop 1)

(push 1)

(check-sat)

