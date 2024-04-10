; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116780 () Bool)

(assert start!116780)

(declare-fun res!919192 () Bool)

(declare-fun e!779673 () Bool)

(assert (=> start!116780 (=> (not res!919192) (not e!779673))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93449 0))(
  ( (array!93450 (arr!45128 (Array (_ BitVec 32) (_ BitVec 64))) (size!45678 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93449)

(assert (=> start!116780 (= res!919192 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45678 a!4032))))))

(assert (=> start!116780 e!779673))

(assert (=> start!116780 true))

(declare-fun array_inv!34156 (array!93449) Bool)

(assert (=> start!116780 (array_inv!34156 a!4032)))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun b!1376304 () Bool)

(assert (=> b!1376304 (= e!779673 (and (= to!206 (size!45678 a!4032)) (bvslt (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000)))))

(declare-fun b!1376305 () Bool)

(declare-fun res!919188 () Bool)

(assert (=> b!1376305 (=> (not res!919188) (not e!779673))))

(assert (=> b!1376305 (= res!919188 (and (bvslt (size!45678 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45678 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376306 () Bool)

(declare-fun res!919191 () Bool)

(assert (=> b!1376306 (=> (not res!919191) (not e!779673))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376306 (= res!919191 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1376307 () Bool)

(declare-fun res!919190 () Bool)

(assert (=> b!1376307 (=> (not res!919190) (not e!779673))))

(declare-fun arrayCountValidKeys!0 (array!93449 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376307 (= res!919190 (= (arrayCountValidKeys!0 (array!93450 (store (arr!45128 a!4032) i!1445 k!2947) (size!45678 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206)))))

(declare-fun b!1376308 () Bool)

(declare-fun res!919189 () Bool)

(assert (=> b!1376308 (=> (not res!919189) (not e!779673))))

(assert (=> b!1376308 (= res!919189 (validKeyInArray!0 (select (arr!45128 a!4032) i!1445)))))

(assert (= (and start!116780 res!919192) b!1376308))

(assert (= (and b!1376308 res!919189) b!1376306))

(assert (= (and b!1376306 res!919191) b!1376305))

(assert (= (and b!1376305 res!919188) b!1376307))

(assert (= (and b!1376307 res!919190) b!1376304))

(declare-fun m!1260367 () Bool)

(assert (=> start!116780 m!1260367))

(declare-fun m!1260369 () Bool)

(assert (=> b!1376306 m!1260369))

(declare-fun m!1260371 () Bool)

(assert (=> b!1376307 m!1260371))

(declare-fun m!1260373 () Bool)

(assert (=> b!1376307 m!1260373))

(declare-fun m!1260375 () Bool)

(assert (=> b!1376307 m!1260375))

(declare-fun m!1260377 () Bool)

(assert (=> b!1376308 m!1260377))

(assert (=> b!1376308 m!1260377))

(declare-fun m!1260379 () Bool)

(assert (=> b!1376308 m!1260379))

(push 1)

(assert (not start!116780))

(assert (not b!1376306))

(assert (not b!1376307))

(assert (not b!1376308))

(check-sat)

(pop 1)

(push 1)

(check-sat)

