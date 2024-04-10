; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116774 () Bool)

(assert start!116774)

(declare-fun b!1376266 () Bool)

(declare-fun res!919150 () Bool)

(declare-fun e!779655 () Bool)

(assert (=> b!1376266 (=> (not res!919150) (not e!779655))))

(declare-datatypes ((array!93443 0))(
  ( (array!93444 (arr!45125 (Array (_ BitVec 32) (_ BitVec 64))) (size!45675 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93443)

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376266 (= res!919150 (validKeyInArray!0 (select (arr!45125 a!4032) i!1445)))))

(declare-fun b!1376268 () Bool)

(declare-fun res!919153 () Bool)

(assert (=> b!1376268 (=> (not res!919153) (not e!779655))))

(declare-fun to!206 () (_ BitVec 32))

(assert (=> b!1376268 (= res!919153 (and (bvslt (size!45675 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45675 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376269 () Bool)

(assert (=> b!1376269 (= e!779655 false)))

(declare-fun lt!605254 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93443 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376269 (= lt!605254 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun lt!605253 () (_ BitVec 32))

(assert (=> b!1376269 (= lt!605253 (arrayCountValidKeys!0 (array!93444 (store (arr!45125 a!4032) i!1445 k!2947) (size!45675 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun res!919151 () Bool)

(assert (=> start!116774 (=> (not res!919151) (not e!779655))))

(assert (=> start!116774 (= res!919151 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45675 a!4032))))))

(assert (=> start!116774 e!779655))

(assert (=> start!116774 true))

(declare-fun array_inv!34153 (array!93443) Bool)

(assert (=> start!116774 (array_inv!34153 a!4032)))

(declare-fun b!1376267 () Bool)

(declare-fun res!919152 () Bool)

(assert (=> b!1376267 (=> (not res!919152) (not e!779655))))

(assert (=> b!1376267 (= res!919152 (not (validKeyInArray!0 k!2947)))))

(assert (= (and start!116774 res!919151) b!1376266))

(assert (= (and b!1376266 res!919150) b!1376267))

(assert (= (and b!1376267 res!919152) b!1376268))

(assert (= (and b!1376268 res!919153) b!1376269))

(declare-fun m!1260325 () Bool)

(assert (=> b!1376266 m!1260325))

(assert (=> b!1376266 m!1260325))

(declare-fun m!1260327 () Bool)

(assert (=> b!1376266 m!1260327))

(declare-fun m!1260329 () Bool)

(assert (=> b!1376269 m!1260329))

(declare-fun m!1260331 () Bool)

(assert (=> b!1376269 m!1260331))

(declare-fun m!1260333 () Bool)

(assert (=> b!1376269 m!1260333))

(declare-fun m!1260335 () Bool)

(assert (=> start!116774 m!1260335))

(declare-fun m!1260337 () Bool)

(assert (=> b!1376267 m!1260337))

(push 1)

(assert (not start!116774))

(assert (not b!1376266))

(assert (not b!1376267))

(assert (not b!1376269))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

