; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116822 () Bool)

(assert start!116822)

(declare-fun res!919561 () Bool)

(declare-fun e!779811 () Bool)

(assert (=> start!116822 (=> (not res!919561) (not e!779811))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93445 0))(
  ( (array!93446 (arr!45126 (Array (_ BitVec 32) (_ BitVec 64))) (size!45678 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93445)

(assert (=> start!116822 (= res!919561 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45678 a!4032))))))

(assert (=> start!116822 e!779811))

(assert (=> start!116822 true))

(declare-fun array_inv!34359 (array!93445) Bool)

(assert (=> start!116822 (array_inv!34359 a!4032)))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun b!1376640 () Bool)

(assert (=> b!1376640 (= e!779811 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000) (bvsge to!206 (size!45678 a!4032))))))

(declare-fun b!1376641 () Bool)

(declare-fun res!919565 () Bool)

(assert (=> b!1376641 (=> (not res!919565) (not e!779811))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93445 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376641 (= res!919565 (= (arrayCountValidKeys!0 (array!93446 (store (arr!45126 a!4032) i!1445 k!2947) (size!45678 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206)))))

(declare-fun b!1376642 () Bool)

(declare-fun res!919563 () Bool)

(assert (=> b!1376642 (=> (not res!919563) (not e!779811))))

(assert (=> b!1376642 (= res!919563 (not (= to!206 (size!45678 a!4032))))))

(declare-fun b!1376643 () Bool)

(declare-fun res!919562 () Bool)

(assert (=> b!1376643 (=> (not res!919562) (not e!779811))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376643 (= res!919562 (not (validKeyInArray!0 (select (arr!45126 a!4032) to!206))))))

(declare-fun b!1376644 () Bool)

(declare-fun res!919559 () Bool)

(assert (=> b!1376644 (=> (not res!919559) (not e!779811))))

(assert (=> b!1376644 (= res!919559 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1376645 () Bool)

(declare-fun res!919560 () Bool)

(assert (=> b!1376645 (=> (not res!919560) (not e!779811))))

(assert (=> b!1376645 (= res!919560 (and (bvslt (size!45678 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45678 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376646 () Bool)

(declare-fun res!919564 () Bool)

(assert (=> b!1376646 (=> (not res!919564) (not e!779811))))

(assert (=> b!1376646 (= res!919564 (validKeyInArray!0 (select (arr!45126 a!4032) i!1445)))))

(assert (= (and start!116822 res!919561) b!1376646))

(assert (= (and b!1376646 res!919564) b!1376644))

(assert (= (and b!1376644 res!919559) b!1376645))

(assert (= (and b!1376645 res!919560) b!1376641))

(assert (= (and b!1376641 res!919565) b!1376642))

(assert (= (and b!1376642 res!919563) b!1376643))

(assert (= (and b!1376643 res!919562) b!1376640))

(declare-fun m!1260275 () Bool)

(assert (=> start!116822 m!1260275))

(declare-fun m!1260277 () Bool)

(assert (=> b!1376644 m!1260277))

(declare-fun m!1260279 () Bool)

(assert (=> b!1376643 m!1260279))

(assert (=> b!1376643 m!1260279))

(declare-fun m!1260281 () Bool)

(assert (=> b!1376643 m!1260281))

(declare-fun m!1260283 () Bool)

(assert (=> b!1376646 m!1260283))

(assert (=> b!1376646 m!1260283))

(declare-fun m!1260285 () Bool)

(assert (=> b!1376646 m!1260285))

(declare-fun m!1260287 () Bool)

(assert (=> b!1376641 m!1260287))

(declare-fun m!1260289 () Bool)

(assert (=> b!1376641 m!1260289))

(declare-fun m!1260291 () Bool)

(assert (=> b!1376641 m!1260291))

(push 1)

(assert (not start!116822))

(assert (not b!1376641))

(assert (not b!1376643))

(assert (not b!1376644))

(assert (not b!1376646))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

