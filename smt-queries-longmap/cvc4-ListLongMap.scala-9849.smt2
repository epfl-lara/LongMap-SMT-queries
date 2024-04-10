; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116784 () Bool)

(assert start!116784)

(declare-fun b!1376334 () Bool)

(declare-fun res!919219 () Bool)

(declare-fun e!779685 () Bool)

(assert (=> b!1376334 (=> (not res!919219) (not e!779685))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376334 (= res!919219 (not (validKeyInArray!0 k!2947)))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun b!1376335 () Bool)

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93453 0))(
  ( (array!93454 (arr!45130 (Array (_ BitVec 32) (_ BitVec 64))) (size!45680 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93453)

(assert (=> b!1376335 (= e!779685 (and (= to!206 (size!45680 a!4032)) (bvslt (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000)))))

(declare-fun res!919221 () Bool)

(assert (=> start!116784 (=> (not res!919221) (not e!779685))))

(assert (=> start!116784 (= res!919221 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45680 a!4032))))))

(assert (=> start!116784 e!779685))

(assert (=> start!116784 true))

(declare-fun array_inv!34158 (array!93453) Bool)

(assert (=> start!116784 (array_inv!34158 a!4032)))

(declare-fun b!1376336 () Bool)

(declare-fun res!919222 () Bool)

(assert (=> b!1376336 (=> (not res!919222) (not e!779685))))

(assert (=> b!1376336 (= res!919222 (and (bvslt (size!45680 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45680 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376337 () Bool)

(declare-fun res!919220 () Bool)

(assert (=> b!1376337 (=> (not res!919220) (not e!779685))))

(declare-fun arrayCountValidKeys!0 (array!93453 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376337 (= res!919220 (= (arrayCountValidKeys!0 (array!93454 (store (arr!45130 a!4032) i!1445 k!2947) (size!45680 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206)))))

(declare-fun b!1376338 () Bool)

(declare-fun res!919218 () Bool)

(assert (=> b!1376338 (=> (not res!919218) (not e!779685))))

(assert (=> b!1376338 (= res!919218 (validKeyInArray!0 (select (arr!45130 a!4032) i!1445)))))

(assert (= (and start!116784 res!919221) b!1376338))

(assert (= (and b!1376338 res!919218) b!1376334))

(assert (= (and b!1376334 res!919219) b!1376336))

(assert (= (and b!1376336 res!919222) b!1376337))

(assert (= (and b!1376337 res!919220) b!1376335))

(declare-fun m!1260395 () Bool)

(assert (=> b!1376334 m!1260395))

(declare-fun m!1260397 () Bool)

(assert (=> start!116784 m!1260397))

(declare-fun m!1260399 () Bool)

(assert (=> b!1376337 m!1260399))

(declare-fun m!1260401 () Bool)

(assert (=> b!1376337 m!1260401))

(declare-fun m!1260403 () Bool)

(assert (=> b!1376337 m!1260403))

(declare-fun m!1260405 () Bool)

(assert (=> b!1376338 m!1260405))

(assert (=> b!1376338 m!1260405))

(declare-fun m!1260407 () Bool)

(assert (=> b!1376338 m!1260407))

(push 1)

(assert (not b!1376338))

(assert (not b!1376337))

(assert (not b!1376334))

(assert (not start!116784))

(check-sat)

(pop 1)

(push 1)

