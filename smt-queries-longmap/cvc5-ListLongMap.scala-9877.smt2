; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116978 () Bool)

(assert start!116978)

(declare-fun res!920426 () Bool)

(declare-fun e!780477 () Bool)

(assert (=> start!116978 (=> (not res!920426) (not e!780477))))

(declare-fun to!360 () (_ BitVec 32))

(declare-datatypes ((array!93620 0))(
  ( (array!93621 (arr!45212 (Array (_ BitVec 32) (_ BitVec 64))) (size!45762 (_ BitVec 32))) )
))
(declare-fun a!4197 () array!93620)

(declare-fun from!3564 () (_ BitVec 32))

(assert (=> start!116978 (= res!920426 (and (bvslt (size!45762 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge to!360 from!3564) (bvslt to!360 (size!45762 a!4197))))))

(assert (=> start!116978 e!780477))

(declare-fun array_inv!34240 (array!93620) Bool)

(assert (=> start!116978 (array_inv!34240 a!4197)))

(assert (=> start!116978 true))

(declare-fun b!1377800 () Bool)

(declare-fun res!920427 () Bool)

(assert (=> b!1377800 (=> (not res!920427) (not e!780477))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377800 (= res!920427 (validKeyInArray!0 (select (arr!45212 a!4197) to!360)))))

(declare-fun b!1377801 () Bool)

(declare-fun res!920428 () Bool)

(assert (=> b!1377801 (=> (not res!920428) (not e!780477))))

(assert (=> b!1377801 (= res!920428 (and (bvsge (bvadd #b00000000000000000000000000000001 to!360) from!3564) (bvsle to!360 (bvadd #b00000000000000000000000000000001 to!360))))))

(declare-fun b!1377802 () Bool)

(assert (=> b!1377802 (= e!780477 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93620 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377802 (= (bvadd (arrayCountValidKeys!0 a!4197 from!3564 to!360) (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360))) (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-datatypes ((Unit!45717 0))(
  ( (Unit!45718) )
))
(declare-fun lt!606193 () Unit!45717)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93620 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45717)

(assert (=> b!1377802 (= lt!606193 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360))))

(assert (= (and start!116978 res!920426) b!1377800))

(assert (= (and b!1377800 res!920427) b!1377801))

(assert (= (and b!1377801 res!920428) b!1377802))

(declare-fun m!1262189 () Bool)

(assert (=> start!116978 m!1262189))

(declare-fun m!1262191 () Bool)

(assert (=> b!1377800 m!1262191))

(assert (=> b!1377800 m!1262191))

(declare-fun m!1262193 () Bool)

(assert (=> b!1377800 m!1262193))

(declare-fun m!1262195 () Bool)

(assert (=> b!1377802 m!1262195))

(declare-fun m!1262197 () Bool)

(assert (=> b!1377802 m!1262197))

(declare-fun m!1262199 () Bool)

(assert (=> b!1377802 m!1262199))

(declare-fun m!1262201 () Bool)

(assert (=> b!1377802 m!1262201))

(push 1)

(assert (not b!1377800))

(assert (not b!1377802))

(assert (not start!116978))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

