; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117138 () Bool)

(assert start!117138)

(declare-fun res!921259 () Bool)

(declare-fun e!781046 () Bool)

(assert (=> start!117138 (=> (not res!921259) (not e!781046))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93755 0))(
  ( (array!93756 (arr!45278 (Array (_ BitVec 32) (_ BitVec 64))) (size!45828 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93755)

(assert (=> start!117138 (= res!921259 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45828 a!4094))))))

(assert (=> start!117138 e!781046))

(assert (=> start!117138 true))

(declare-fun array_inv!34306 (array!93755) Bool)

(assert (=> start!117138 (array_inv!34306 a!4094)))

(declare-fun b!1378724 () Bool)

(declare-fun res!921256 () Bool)

(assert (=> b!1378724 (=> (not res!921256) (not e!781046))))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1378724 (= res!921256 (and (bvslt (size!45828 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45828 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378723 () Bool)

(declare-fun res!921257 () Bool)

(assert (=> b!1378723 (=> (not res!921257) (not e!781046))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378723 (= res!921257 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1378722 () Bool)

(declare-fun res!921258 () Bool)

(assert (=> b!1378722 (=> (not res!921258) (not e!781046))))

(assert (=> b!1378722 (= res!921258 (validKeyInArray!0 (select (arr!45278 a!4094) i!1451)))))

(declare-fun b!1378725 () Bool)

(assert (=> b!1378725 (= e!781046 false)))

(declare-fun lt!606966 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93755 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378725 (= lt!606966 (arrayCountValidKeys!0 (array!93756 (store (arr!45278 a!4094) i!1451 k!2953) (size!45828 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606965 () (_ BitVec 32))

(assert (=> b!1378725 (= lt!606965 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (= (and start!117138 res!921259) b!1378722))

(assert (= (and b!1378722 res!921258) b!1378723))

(assert (= (and b!1378723 res!921257) b!1378724))

(assert (= (and b!1378724 res!921256) b!1378725))

(declare-fun m!1263537 () Bool)

(assert (=> start!117138 m!1263537))

(declare-fun m!1263539 () Bool)

(assert (=> b!1378723 m!1263539))

(declare-fun m!1263541 () Bool)

(assert (=> b!1378722 m!1263541))

(assert (=> b!1378722 m!1263541))

(declare-fun m!1263543 () Bool)

(assert (=> b!1378722 m!1263543))

(declare-fun m!1263545 () Bool)

(assert (=> b!1378725 m!1263545))

(declare-fun m!1263547 () Bool)

(assert (=> b!1378725 m!1263547))

(declare-fun m!1263549 () Bool)

(assert (=> b!1378725 m!1263549))

(push 1)

(assert (not b!1378723))

(assert (not b!1378722))

(assert (not start!117138))

(assert (not b!1378725))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

