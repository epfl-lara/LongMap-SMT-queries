; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116778 () Bool)

(assert start!116778)

(declare-fun res!919176 () Bool)

(declare-fun e!779668 () Bool)

(assert (=> start!116778 (=> (not res!919176) (not e!779668))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93447 0))(
  ( (array!93448 (arr!45127 (Array (_ BitVec 32) (_ BitVec 64))) (size!45677 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93447)

(assert (=> start!116778 (= res!919176 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45677 a!4032))))))

(assert (=> start!116778 e!779668))

(assert (=> start!116778 true))

(declare-fun array_inv!34155 (array!93447) Bool)

(assert (=> start!116778 (array_inv!34155 a!4032)))

(declare-fun b!1376291 () Bool)

(declare-fun res!919174 () Bool)

(assert (=> b!1376291 (=> (not res!919174) (not e!779668))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376291 (= res!919174 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1376293 () Bool)

(assert (=> b!1376293 (= e!779668 false)))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun lt!605266 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93447 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376293 (= lt!605266 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!605265 () (_ BitVec 32))

(assert (=> b!1376293 (= lt!605265 (arrayCountValidKeys!0 (array!93448 (store (arr!45127 a!4032) i!1445 k!2947) (size!45677 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376290 () Bool)

(declare-fun res!919177 () Bool)

(assert (=> b!1376290 (=> (not res!919177) (not e!779668))))

(assert (=> b!1376290 (= res!919177 (validKeyInArray!0 (select (arr!45127 a!4032) i!1445)))))

(declare-fun b!1376292 () Bool)

(declare-fun res!919175 () Bool)

(assert (=> b!1376292 (=> (not res!919175) (not e!779668))))

(assert (=> b!1376292 (= res!919175 (and (bvslt (size!45677 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45677 a!4032)) (bvsgt to!206 i!1445)))))

(assert (= (and start!116778 res!919176) b!1376290))

(assert (= (and b!1376290 res!919177) b!1376291))

(assert (= (and b!1376291 res!919174) b!1376292))

(assert (= (and b!1376292 res!919175) b!1376293))

(declare-fun m!1260353 () Bool)

(assert (=> start!116778 m!1260353))

(declare-fun m!1260355 () Bool)

(assert (=> b!1376291 m!1260355))

(declare-fun m!1260357 () Bool)

(assert (=> b!1376293 m!1260357))

(declare-fun m!1260359 () Bool)

(assert (=> b!1376293 m!1260359))

(declare-fun m!1260361 () Bool)

(assert (=> b!1376293 m!1260361))

(declare-fun m!1260363 () Bool)

(assert (=> b!1376290 m!1260363))

(assert (=> b!1376290 m!1260363))

(declare-fun m!1260365 () Bool)

(assert (=> b!1376290 m!1260365))

(push 1)

(assert (not b!1376293))

(assert (not b!1376290))

(assert (not start!116778))

(assert (not b!1376291))

(check-sat)

