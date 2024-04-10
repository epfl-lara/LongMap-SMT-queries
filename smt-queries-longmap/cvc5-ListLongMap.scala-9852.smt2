; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116798 () Bool)

(assert start!116798)

(declare-fun b!1376430 () Bool)

(declare-fun res!919318 () Bool)

(declare-fun e!779727 () Bool)

(assert (=> b!1376430 (=> (not res!919318) (not e!779727))))

(declare-datatypes ((array!93467 0))(
  ( (array!93468 (arr!45137 (Array (_ BitVec 32) (_ BitVec 64))) (size!45687 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93467)

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376430 (= res!919318 (validKeyInArray!0 (select (arr!45137 a!4032) i!1445)))))

(declare-fun b!1376431 () Bool)

(declare-fun res!919315 () Bool)

(assert (=> b!1376431 (=> (not res!919315) (not e!779727))))

(declare-fun to!206 () (_ BitVec 32))

(assert (=> b!1376431 (= res!919315 (and (bvslt (size!45687 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45687 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376432 () Bool)

(declare-fun res!919316 () Bool)

(assert (=> b!1376432 (=> (not res!919316) (not e!779727))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93467 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376432 (= res!919316 (= (arrayCountValidKeys!0 (array!93468 (store (arr!45137 a!4032) i!1445 k!2947) (size!45687 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206)))))

(declare-fun res!919317 () Bool)

(assert (=> start!116798 (=> (not res!919317) (not e!779727))))

(assert (=> start!116798 (= res!919317 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45687 a!4032))))))

(assert (=> start!116798 e!779727))

(assert (=> start!116798 true))

(declare-fun array_inv!34165 (array!93467) Bool)

(assert (=> start!116798 (array_inv!34165 a!4032)))

(declare-fun b!1376433 () Bool)

(assert (=> b!1376433 (= e!779727 (and (not (= to!206 (size!45687 a!4032))) (bvsge to!206 (size!45687 a!4032))))))

(declare-fun b!1376434 () Bool)

(declare-fun res!919314 () Bool)

(assert (=> b!1376434 (=> (not res!919314) (not e!779727))))

(assert (=> b!1376434 (= res!919314 (not (validKeyInArray!0 k!2947)))))

(assert (= (and start!116798 res!919317) b!1376430))

(assert (= (and b!1376430 res!919318) b!1376434))

(assert (= (and b!1376434 res!919314) b!1376431))

(assert (= (and b!1376431 res!919315) b!1376432))

(assert (= (and b!1376432 res!919316) b!1376433))

(declare-fun m!1260493 () Bool)

(assert (=> b!1376430 m!1260493))

(assert (=> b!1376430 m!1260493))

(declare-fun m!1260495 () Bool)

(assert (=> b!1376430 m!1260495))

(declare-fun m!1260497 () Bool)

(assert (=> b!1376432 m!1260497))

(declare-fun m!1260499 () Bool)

(assert (=> b!1376432 m!1260499))

(declare-fun m!1260501 () Bool)

(assert (=> b!1376432 m!1260501))

(declare-fun m!1260503 () Bool)

(assert (=> start!116798 m!1260503))

(declare-fun m!1260505 () Bool)

(assert (=> b!1376434 m!1260505))

(push 1)

(assert (not b!1376434))

(assert (not start!116798))

(assert (not b!1376430))

(assert (not b!1376432))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

