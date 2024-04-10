; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117172 () Bool)

(assert start!117172)

(declare-fun b!1378960 () Bool)

(declare-fun e!781157 () Bool)

(declare-fun e!781156 () Bool)

(assert (=> b!1378960 (= e!781157 e!781156)))

(declare-fun res!921494 () Bool)

(assert (=> b!1378960 (=> (not res!921494) (not e!781156))))

(declare-datatypes ((array!93789 0))(
  ( (array!93790 (arr!45295 (Array (_ BitVec 32) (_ BitVec 64))) (size!45845 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93789)

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun lt!607031 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93789 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378960 (= res!921494 (= (arrayCountValidKeys!0 (array!93790 (store (arr!45295 a!4094) i!1451 k!2953) (size!45845 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub lt!607031 #b00000000000000000000000000000001)))))

(assert (=> b!1378960 (= lt!607031 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1378961 () Bool)

(declare-fun res!921497 () Bool)

(assert (=> b!1378961 (=> (not res!921497) (not e!781157))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378961 (= res!921497 (not (validKeyInArray!0 k!2953)))))

(declare-fun res!921495 () Bool)

(assert (=> start!117172 (=> (not res!921495) (not e!781157))))

(assert (=> start!117172 (= res!921495 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45845 a!4094))))))

(assert (=> start!117172 e!781157))

(assert (=> start!117172 true))

(declare-fun array_inv!34323 (array!93789) Bool)

(assert (=> start!117172 (array_inv!34323 a!4094)))

(declare-fun b!1378962 () Bool)

(declare-fun res!921498 () Bool)

(assert (=> b!1378962 (=> (not res!921498) (not e!781157))))

(assert (=> b!1378962 (= res!921498 (and (bvslt (size!45845 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45845 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378963 () Bool)

(declare-fun res!921496 () Bool)

(assert (=> b!1378963 (=> (not res!921496) (not e!781157))))

(assert (=> b!1378963 (= res!921496 (validKeyInArray!0 (select (arr!45295 a!4094) i!1451)))))

(declare-fun b!1378964 () Bool)

(assert (=> b!1378964 (= e!781156 (not true))))

(assert (=> b!1378964 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607031) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45817 0))(
  ( (Unit!45818) )
))
(declare-fun lt!607032 () Unit!45817)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93789 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45817)

(assert (=> b!1378964 (= lt!607032 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1378965 () Bool)

(declare-fun res!921499 () Bool)

(assert (=> b!1378965 (=> (not res!921499) (not e!781156))))

(assert (=> b!1378965 (= res!921499 (bvsgt from!3466 #b00000000000000000000000000000000))))

(assert (= (and start!117172 res!921495) b!1378963))

(assert (= (and b!1378963 res!921496) b!1378961))

(assert (= (and b!1378961 res!921497) b!1378962))

(assert (= (and b!1378962 res!921498) b!1378960))

(assert (= (and b!1378960 res!921494) b!1378965))

(assert (= (and b!1378965 res!921499) b!1378964))

(declare-fun m!1263787 () Bool)

(assert (=> b!1378963 m!1263787))

(assert (=> b!1378963 m!1263787))

(declare-fun m!1263789 () Bool)

(assert (=> b!1378963 m!1263789))

(declare-fun m!1263791 () Bool)

(assert (=> b!1378960 m!1263791))

(declare-fun m!1263793 () Bool)

(assert (=> b!1378960 m!1263793))

(declare-fun m!1263795 () Bool)

(assert (=> b!1378960 m!1263795))

(declare-fun m!1263797 () Bool)

(assert (=> start!117172 m!1263797))

(declare-fun m!1263799 () Bool)

(assert (=> b!1378964 m!1263799))

(declare-fun m!1263801 () Bool)

(assert (=> b!1378964 m!1263801))

(declare-fun m!1263803 () Bool)

(assert (=> b!1378964 m!1263803))

(declare-fun m!1263805 () Bool)

(assert (=> b!1378961 m!1263805))

(push 1)

(assert (not b!1378961))

(assert (not start!117172))

(assert (not b!1378963))

(assert (not b!1378964))

(assert (not b!1378960))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

