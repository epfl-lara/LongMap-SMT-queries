; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116796 () Bool)

(assert start!116796)

(declare-fun b!1376384 () Bool)

(declare-fun e!779707 () Bool)

(declare-fun to!206 () (_ BitVec 32))

(declare-datatypes ((array!93419 0))(
  ( (array!93420 (arr!45113 (Array (_ BitVec 32) (_ BitVec 64))) (size!45665 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93419)

(assert (=> b!1376384 (= e!779707 (and (not (= to!206 (size!45665 a!4032))) (bvsge to!206 (size!45665 a!4032))))))

(declare-fun b!1376385 () Bool)

(declare-fun res!919307 () Bool)

(assert (=> b!1376385 (=> (not res!919307) (not e!779707))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376385 (= res!919307 (not (validKeyInArray!0 k!2947)))))

(declare-fun res!919304 () Bool)

(assert (=> start!116796 (=> (not res!919304) (not e!779707))))

(declare-fun i!1445 () (_ BitVec 32))

(assert (=> start!116796 (= res!919304 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45665 a!4032))))))

(assert (=> start!116796 e!779707))

(assert (=> start!116796 true))

(declare-fun array_inv!34346 (array!93419) Bool)

(assert (=> start!116796 (array_inv!34346 a!4032)))

(declare-fun b!1376386 () Bool)

(declare-fun res!919303 () Bool)

(assert (=> b!1376386 (=> (not res!919303) (not e!779707))))

(declare-fun arrayCountValidKeys!0 (array!93419 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376386 (= res!919303 (= (arrayCountValidKeys!0 (array!93420 (store (arr!45113 a!4032) i!1445 k!2947) (size!45665 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206)))))

(declare-fun b!1376387 () Bool)

(declare-fun res!919306 () Bool)

(assert (=> b!1376387 (=> (not res!919306) (not e!779707))))

(assert (=> b!1376387 (= res!919306 (validKeyInArray!0 (select (arr!45113 a!4032) i!1445)))))

(declare-fun b!1376388 () Bool)

(declare-fun res!919305 () Bool)

(assert (=> b!1376388 (=> (not res!919305) (not e!779707))))

(assert (=> b!1376388 (= res!919305 (and (bvslt (size!45665 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45665 a!4032)) (bvsgt to!206 i!1445)))))

(assert (= (and start!116796 res!919304) b!1376387))

(assert (= (and b!1376387 res!919306) b!1376385))

(assert (= (and b!1376385 res!919307) b!1376388))

(assert (= (and b!1376388 res!919305) b!1376386))

(assert (= (and b!1376386 res!919303) b!1376384))

(declare-fun m!1260013 () Bool)

(assert (=> b!1376385 m!1260013))

(declare-fun m!1260015 () Bool)

(assert (=> start!116796 m!1260015))

(declare-fun m!1260017 () Bool)

(assert (=> b!1376386 m!1260017))

(declare-fun m!1260019 () Bool)

(assert (=> b!1376386 m!1260019))

(declare-fun m!1260021 () Bool)

(assert (=> b!1376386 m!1260021))

(declare-fun m!1260023 () Bool)

(assert (=> b!1376387 m!1260023))

(assert (=> b!1376387 m!1260023))

(declare-fun m!1260025 () Bool)

(assert (=> b!1376387 m!1260025))

(push 1)

(assert (not start!116796))

(assert (not b!1376385))

(assert (not b!1376387))

(assert (not b!1376386))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

