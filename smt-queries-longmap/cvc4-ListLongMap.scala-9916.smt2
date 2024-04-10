; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117268 () Bool)

(assert start!117268)

(declare-fun b!1379624 () Bool)

(declare-fun res!922066 () Bool)

(declare-fun e!781536 () Bool)

(assert (=> b!1379624 (=> (not res!922066) (not e!781536))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379624 (= res!922066 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1379625 () Bool)

(declare-datatypes ((array!93864 0))(
  ( (array!93865 (arr!45331 (Array (_ BitVec 32) (_ BitVec 64))) (size!45881 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93864)

(declare-fun e!781538 () Bool)

(declare-fun lt!607680 () array!93864)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93864 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379625 (= e!781538 (not (= (arrayCountValidKeys!0 lt!607680 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001))))))

(declare-fun b!1379626 () Bool)

(declare-fun res!922061 () Bool)

(assert (=> b!1379626 (=> (not res!922061) (not e!781536))))

(assert (=> b!1379626 (= res!922061 (validKeyInArray!0 (select (arr!45331 a!4094) i!1451)))))

(declare-fun b!1379627 () Bool)

(declare-fun res!922063 () Bool)

(assert (=> b!1379627 (=> (not res!922063) (not e!781538))))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1379627 (= res!922063 (bvsle from!3466 #b00000000000000000000000000000000))))

(declare-fun b!1379628 () Bool)

(assert (=> b!1379628 (= e!781536 e!781538)))

(declare-fun res!922064 () Bool)

(assert (=> b!1379628 (=> (not res!922064) (not e!781538))))

(assert (=> b!1379628 (= res!922064 (= (arrayCountValidKeys!0 lt!607680 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001)))))

(assert (=> b!1379628 (= lt!607680 (array!93865 (store (arr!45331 a!4094) i!1451 k!2953) (size!45881 a!4094)))))

(declare-fun b!1379623 () Bool)

(declare-fun res!922065 () Bool)

(assert (=> b!1379623 (=> (not res!922065) (not e!781536))))

(assert (=> b!1379623 (= res!922065 (and (bvslt (size!45881 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45881 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun res!922062 () Bool)

(assert (=> start!117268 (=> (not res!922062) (not e!781536))))

(assert (=> start!117268 (= res!922062 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45881 a!4094))))))

(assert (=> start!117268 e!781536))

(assert (=> start!117268 true))

(declare-fun array_inv!34359 (array!93864) Bool)

(assert (=> start!117268 (array_inv!34359 a!4094)))

(assert (= (and start!117268 res!922062) b!1379626))

(assert (= (and b!1379626 res!922061) b!1379624))

(assert (= (and b!1379624 res!922066) b!1379623))

(assert (= (and b!1379623 res!922065) b!1379628))

(assert (= (and b!1379628 res!922064) b!1379627))

(assert (= (and b!1379627 res!922063) b!1379625))

(declare-fun m!1264779 () Bool)

(assert (=> b!1379624 m!1264779))

(declare-fun m!1264781 () Bool)

(assert (=> b!1379625 m!1264781))

(declare-fun m!1264783 () Bool)

(assert (=> b!1379625 m!1264783))

(declare-fun m!1264785 () Bool)

(assert (=> b!1379626 m!1264785))

(assert (=> b!1379626 m!1264785))

(declare-fun m!1264787 () Bool)

(assert (=> b!1379626 m!1264787))

(declare-fun m!1264789 () Bool)

(assert (=> b!1379628 m!1264789))

(declare-fun m!1264791 () Bool)

(assert (=> b!1379628 m!1264791))

(declare-fun m!1264793 () Bool)

(assert (=> b!1379628 m!1264793))

(declare-fun m!1264795 () Bool)

(assert (=> start!117268 m!1264795))

(push 1)

(assert (not b!1379625))

(assert (not b!1379626))

(assert (not b!1379628))

(assert (not start!117268))

(assert (not b!1379624))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

