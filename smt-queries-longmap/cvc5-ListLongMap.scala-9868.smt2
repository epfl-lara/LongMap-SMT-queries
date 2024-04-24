; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117128 () Bool)

(assert start!117128)

(declare-fun res!920732 () Bool)

(declare-fun e!781132 () Bool)

(assert (=> start!117128 (=> (not res!920732) (not e!781132))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93683 0))(
  ( (array!93684 (arr!45240 (Array (_ BitVec 32) (_ BitVec 64))) (size!45791 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93683)

(assert (=> start!117128 (= res!920732 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45791 a!4032))))))

(assert (=> start!117128 e!781132))

(assert (=> start!117128 true))

(declare-fun array_inv!34521 (array!93683) Bool)

(assert (=> start!117128 (array_inv!34521 a!4032)))

(declare-fun b!1378802 () Bool)

(declare-fun res!920730 () Bool)

(assert (=> b!1378802 (=> (not res!920730) (not e!781132))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378802 (= res!920730 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1378804 () Bool)

(assert (=> b!1378804 (= e!781132 false)))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun lt!606557 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93683 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378804 (= lt!606557 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!606558 () (_ BitVec 32))

(assert (=> b!1378804 (= lt!606558 (arrayCountValidKeys!0 (array!93684 (store (arr!45240 a!4032) i!1445 k!2947) (size!45791 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1378803 () Bool)

(declare-fun res!920731 () Bool)

(assert (=> b!1378803 (=> (not res!920731) (not e!781132))))

(assert (=> b!1378803 (= res!920731 (and (bvslt (size!45791 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45791 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1378801 () Bool)

(declare-fun res!920733 () Bool)

(assert (=> b!1378801 (=> (not res!920733) (not e!781132))))

(assert (=> b!1378801 (= res!920733 (validKeyInArray!0 (select (arr!45240 a!4032) i!1445)))))

(assert (= (and start!117128 res!920732) b!1378801))

(assert (= (and b!1378801 res!920733) b!1378802))

(assert (= (and b!1378802 res!920730) b!1378803))

(assert (= (and b!1378803 res!920731) b!1378804))

(declare-fun m!1263445 () Bool)

(assert (=> start!117128 m!1263445))

(declare-fun m!1263447 () Bool)

(assert (=> b!1378802 m!1263447))

(declare-fun m!1263449 () Bool)

(assert (=> b!1378804 m!1263449))

(declare-fun m!1263451 () Bool)

(assert (=> b!1378804 m!1263451))

(declare-fun m!1263453 () Bool)

(assert (=> b!1378804 m!1263453))

(declare-fun m!1263455 () Bool)

(assert (=> b!1378801 m!1263455))

(assert (=> b!1378801 m!1263455))

(declare-fun m!1263457 () Bool)

(assert (=> b!1378801 m!1263457))

(push 1)

(assert (not b!1378804))

(assert (not start!117128))

(assert (not b!1378802))

(assert (not b!1378801))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

