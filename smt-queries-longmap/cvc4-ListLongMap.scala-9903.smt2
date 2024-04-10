; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117166 () Bool)

(assert start!117166)

(declare-fun b!1378907 () Bool)

(declare-fun e!781130 () Bool)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(assert (=> b!1378907 (= e!781130 (and (bvsgt from!3466 #b00000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 i!1451) (bvsub from!3466 #b00000000000000000000000000000001)) (bvslt from!3466 (bvsub from!3466 #b00000000000000000000000000000001)) (bvsgt from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))))

(declare-fun b!1378908 () Bool)

(declare-fun res!921445 () Bool)

(assert (=> b!1378908 (=> (not res!921445) (not e!781130))))

(declare-datatypes ((array!93783 0))(
  ( (array!93784 (arr!45292 (Array (_ BitVec 32) (_ BitVec 64))) (size!45842 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93783)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378908 (= res!921445 (validKeyInArray!0 (select (arr!45292 a!4094) i!1451)))))

(declare-fun res!921442 () Bool)

(assert (=> start!117166 (=> (not res!921442) (not e!781130))))

(assert (=> start!117166 (= res!921442 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45842 a!4094))))))

(assert (=> start!117166 e!781130))

(assert (=> start!117166 true))

(declare-fun array_inv!34320 (array!93783) Bool)

(assert (=> start!117166 (array_inv!34320 a!4094)))

(declare-fun b!1378909 () Bool)

(declare-fun res!921441 () Bool)

(assert (=> b!1378909 (=> (not res!921441) (not e!781130))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93783 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378909 (= res!921441 (= (arrayCountValidKeys!0 (array!93784 (store (arr!45292 a!4094) i!1451 k!2953) (size!45842 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001)))))

(declare-fun b!1378910 () Bool)

(declare-fun res!921444 () Bool)

(assert (=> b!1378910 (=> (not res!921444) (not e!781130))))

(assert (=> b!1378910 (= res!921444 (and (bvslt (size!45842 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45842 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378911 () Bool)

(declare-fun res!921443 () Bool)

(assert (=> b!1378911 (=> (not res!921443) (not e!781130))))

(assert (=> b!1378911 (= res!921443 (not (validKeyInArray!0 k!2953)))))

(assert (= (and start!117166 res!921442) b!1378908))

(assert (= (and b!1378908 res!921445) b!1378911))

(assert (= (and b!1378911 res!921443) b!1378910))

(assert (= (and b!1378910 res!921444) b!1378909))

(assert (= (and b!1378909 res!921441) b!1378907))

(declare-fun m!1263733 () Bool)

(assert (=> b!1378908 m!1263733))

(assert (=> b!1378908 m!1263733))

(declare-fun m!1263735 () Bool)

(assert (=> b!1378908 m!1263735))

(declare-fun m!1263737 () Bool)

(assert (=> start!117166 m!1263737))

(declare-fun m!1263739 () Bool)

(assert (=> b!1378909 m!1263739))

(declare-fun m!1263741 () Bool)

(assert (=> b!1378909 m!1263741))

(declare-fun m!1263743 () Bool)

(assert (=> b!1378909 m!1263743))

(declare-fun m!1263745 () Bool)

(assert (=> b!1378911 m!1263745))

(push 1)

(assert (not b!1378911))

(assert (not b!1378909))

(assert (not b!1378908))

(assert (not start!117166))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

