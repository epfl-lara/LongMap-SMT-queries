; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117204 () Bool)

(assert start!117204)

(declare-fun b!1379171 () Bool)

(declare-fun res!921752 () Bool)

(declare-fun e!781286 () Bool)

(assert (=> b!1379171 (=> (not res!921752) (not e!781286))))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93775 0))(
  ( (array!93776 (arr!45288 (Array (_ BitVec 32) (_ BitVec 64))) (size!45840 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93775)

(assert (=> b!1379171 (= res!921752 (and (bvslt (size!45840 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45840 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun res!921751 () Bool)

(assert (=> start!117204 (=> (not res!921751) (not e!781286))))

(assert (=> start!117204 (= res!921751 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45840 a!4094))))))

(assert (=> start!117204 e!781286))

(assert (=> start!117204 true))

(declare-fun array_inv!34521 (array!93775) Bool)

(assert (=> start!117204 (array_inv!34521 a!4094)))

(declare-fun b!1379172 () Bool)

(declare-fun res!921748 () Bool)

(assert (=> b!1379172 (=> (not res!921748) (not e!781286))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379172 (= res!921748 (validKeyInArray!0 (select (arr!45288 a!4094) i!1451)))))

(declare-fun b!1379173 () Bool)

(declare-fun e!781287 () Bool)

(assert (=> b!1379173 (= e!781287 (not (and (bvsle (bvsub from!3466 #b00000000000000000000000000000001) (size!45840 a!4094)) (bvsge i!1451 (bvsub from!3466 #b00000000000000000000000000000001)))))))

(declare-fun lt!607089 () (_ BitVec 32))

(declare-fun lt!607088 () array!93775)

(declare-fun arrayCountValidKeys!0 (array!93775 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379173 (= (bvadd (arrayCountValidKeys!0 lt!607088 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607089) (arrayCountValidKeys!0 lt!607088 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45694 0))(
  ( (Unit!45695) )
))
(declare-fun lt!607087 () Unit!45694)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93775 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45694)

(assert (=> b!1379173 (= lt!607087 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607088 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!607090 () (_ BitVec 32))

(assert (=> b!1379173 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607090) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607091 () Unit!45694)

(assert (=> b!1379173 (= lt!607091 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1379174 () Bool)

(declare-fun res!921750 () Bool)

(assert (=> b!1379174 (=> (not res!921750) (not e!781286))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1379174 (= res!921750 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1379175 () Bool)

(assert (=> b!1379175 (= e!781286 e!781287)))

(declare-fun res!921749 () Bool)

(assert (=> b!1379175 (=> (not res!921749) (not e!781287))))

(assert (=> b!1379175 (= res!921749 (and (= lt!607089 (bvsub lt!607090 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1379175 (= lt!607089 (arrayCountValidKeys!0 lt!607088 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379175 (= lt!607090 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379175 (= lt!607088 (array!93776 (store (arr!45288 a!4094) i!1451 k!2953) (size!45840 a!4094)))))

(assert (= (and start!117204 res!921751) b!1379172))

(assert (= (and b!1379172 res!921748) b!1379174))

(assert (= (and b!1379174 res!921750) b!1379171))

(assert (= (and b!1379171 res!921752) b!1379175))

(assert (= (and b!1379175 res!921749) b!1379173))

(declare-fun m!1263727 () Bool)

(assert (=> b!1379175 m!1263727))

(declare-fun m!1263729 () Bool)

(assert (=> b!1379175 m!1263729))

(declare-fun m!1263731 () Bool)

(assert (=> b!1379175 m!1263731))

(declare-fun m!1263733 () Bool)

(assert (=> b!1379173 m!1263733))

(declare-fun m!1263735 () Bool)

(assert (=> b!1379173 m!1263735))

(declare-fun m!1263737 () Bool)

(assert (=> b!1379173 m!1263737))

(declare-fun m!1263739 () Bool)

(assert (=> b!1379173 m!1263739))

(declare-fun m!1263741 () Bool)

(assert (=> b!1379173 m!1263741))

(declare-fun m!1263743 () Bool)

(assert (=> b!1379173 m!1263743))

(declare-fun m!1263745 () Bool)

(assert (=> b!1379174 m!1263745))

(declare-fun m!1263747 () Bool)

(assert (=> start!117204 m!1263747))

(declare-fun m!1263749 () Bool)

(assert (=> b!1379172 m!1263749))

(assert (=> b!1379172 m!1263749))

(declare-fun m!1263751 () Bool)

(assert (=> b!1379172 m!1263751))

(push 1)

(assert (not b!1379174))

(assert (not b!1379173))

(assert (not b!1379175))

(assert (not start!117204))

(assert (not b!1379172))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

