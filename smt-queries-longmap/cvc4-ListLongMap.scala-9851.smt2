; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116796 () Bool)

(assert start!116796)

(declare-fun b!1376415 () Bool)

(declare-fun res!919302 () Bool)

(declare-fun e!779721 () Bool)

(assert (=> b!1376415 (=> (not res!919302) (not e!779721))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93465 0))(
  ( (array!93466 (arr!45136 (Array (_ BitVec 32) (_ BitVec 64))) (size!45686 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93465)

(declare-fun arrayCountValidKeys!0 (array!93465 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376415 (= res!919302 (= (arrayCountValidKeys!0 (array!93466 (store (arr!45136 a!4032) i!1445 k!2947) (size!45686 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206)))))

(declare-fun b!1376416 () Bool)

(declare-fun res!919300 () Bool)

(assert (=> b!1376416 (=> (not res!919300) (not e!779721))))

(assert (=> b!1376416 (= res!919300 (and (bvslt (size!45686 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45686 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376417 () Bool)

(declare-fun res!919303 () Bool)

(assert (=> b!1376417 (=> (not res!919303) (not e!779721))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376417 (= res!919303 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1376418 () Bool)

(assert (=> b!1376418 (= e!779721 (bvslt (bvsub (bvadd #b00000000000000000000000000000001 (size!45686 a!4032)) to!206) #b00000000000000000000000000000000))))

(declare-fun res!919301 () Bool)

(assert (=> start!116796 (=> (not res!919301) (not e!779721))))

(assert (=> start!116796 (= res!919301 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45686 a!4032))))))

(assert (=> start!116796 e!779721))

(assert (=> start!116796 true))

(declare-fun array_inv!34164 (array!93465) Bool)

(assert (=> start!116796 (array_inv!34164 a!4032)))

(declare-fun b!1376419 () Bool)

(declare-fun res!919299 () Bool)

(assert (=> b!1376419 (=> (not res!919299) (not e!779721))))

(assert (=> b!1376419 (= res!919299 (validKeyInArray!0 (select (arr!45136 a!4032) i!1445)))))

(assert (= (and start!116796 res!919301) b!1376419))

(assert (= (and b!1376419 res!919299) b!1376417))

(assert (= (and b!1376417 res!919303) b!1376416))

(assert (= (and b!1376416 res!919300) b!1376415))

(assert (= (and b!1376415 res!919302) b!1376418))

(declare-fun m!1260479 () Bool)

(assert (=> b!1376415 m!1260479))

(declare-fun m!1260481 () Bool)

(assert (=> b!1376415 m!1260481))

(declare-fun m!1260483 () Bool)

(assert (=> b!1376415 m!1260483))

(declare-fun m!1260485 () Bool)

(assert (=> b!1376417 m!1260485))

(declare-fun m!1260487 () Bool)

(assert (=> start!116796 m!1260487))

(declare-fun m!1260489 () Bool)

(assert (=> b!1376419 m!1260489))

(assert (=> b!1376419 m!1260489))

(declare-fun m!1260491 () Bool)

(assert (=> b!1376419 m!1260491))

(push 1)

(assert (not b!1376417))

(assert (not b!1376419))

(assert (not start!116796))

(assert (not b!1376415))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

