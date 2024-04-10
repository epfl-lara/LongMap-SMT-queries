; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116768 () Bool)

(assert start!116768)

(declare-fun res!919111 () Bool)

(declare-fun e!779638 () Bool)

(assert (=> start!116768 (=> (not res!919111) (not e!779638))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93437 0))(
  ( (array!93438 (arr!45122 (Array (_ BitVec 32) (_ BitVec 64))) (size!45672 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93437)

(assert (=> start!116768 (= res!919111 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45672 a!4032))))))

(assert (=> start!116768 e!779638))

(assert (=> start!116768 true))

(declare-fun array_inv!34150 (array!93437) Bool)

(assert (=> start!116768 (array_inv!34150 a!4032)))

(declare-fun b!1376223 () Bool)

(declare-fun res!919110 () Bool)

(assert (=> b!1376223 (=> (not res!919110) (not e!779638))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376223 (= res!919110 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1376224 () Bool)

(declare-fun res!919107 () Bool)

(assert (=> b!1376224 (=> (not res!919107) (not e!779638))))

(declare-fun to!206 () (_ BitVec 32))

(assert (=> b!1376224 (= res!919107 (and (bvslt (size!45672 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45672 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376225 () Bool)

(declare-fun res!919108 () Bool)

(assert (=> b!1376225 (=> (not res!919108) (not e!779638))))

(assert (=> b!1376225 (= res!919108 (validKeyInArray!0 (select (arr!45122 a!4032) i!1445)))))

(declare-fun b!1376226 () Bool)

(declare-fun res!919109 () Bool)

(assert (=> b!1376226 (=> (not res!919109) (not e!779638))))

(declare-fun arrayCountValidKeys!0 (array!93437 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376226 (= res!919109 (= (arrayCountValidKeys!0 (array!93438 (store (arr!45122 a!4032) i!1445 k!2947) (size!45672 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206)))))

(declare-fun b!1376227 () Bool)

(assert (=> b!1376227 (= e!779638 (and (= to!206 (size!45672 a!4032)) (bvslt (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000)))))

(assert (= (and start!116768 res!919111) b!1376225))

(assert (= (and b!1376225 res!919108) b!1376223))

(assert (= (and b!1376223 res!919110) b!1376224))

(assert (= (and b!1376224 res!919107) b!1376226))

(assert (= (and b!1376226 res!919109) b!1376227))

(declare-fun m!1260283 () Bool)

(assert (=> start!116768 m!1260283))

(declare-fun m!1260285 () Bool)

(assert (=> b!1376223 m!1260285))

(declare-fun m!1260287 () Bool)

(assert (=> b!1376225 m!1260287))

(assert (=> b!1376225 m!1260287))

(declare-fun m!1260289 () Bool)

(assert (=> b!1376225 m!1260289))

(declare-fun m!1260291 () Bool)

(assert (=> b!1376226 m!1260291))

(declare-fun m!1260293 () Bool)

(assert (=> b!1376226 m!1260293))

(declare-fun m!1260295 () Bool)

(assert (=> b!1376226 m!1260295))

(push 1)

(assert (not b!1376225))

(assert (not b!1376226))

(assert (not start!116768))

(assert (not b!1376223))

(check-sat)

(pop 1)

(push 1)

(check-sat)

