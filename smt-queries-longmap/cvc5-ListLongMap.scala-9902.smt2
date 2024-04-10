; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117156 () Bool)

(assert start!117156)

(declare-fun b!1378842 () Bool)

(declare-fun e!781100 () Bool)

(assert (=> b!1378842 (= e!781100 false)))

(declare-datatypes ((array!93773 0))(
  ( (array!93774 (arr!45287 (Array (_ BitVec 32) (_ BitVec 64))) (size!45837 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93773)

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun lt!607002 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93773 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378842 (= lt!607002 (arrayCountValidKeys!0 (array!93774 (store (arr!45287 a!4094) i!1451 k!2953) (size!45837 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607001 () (_ BitVec 32))

(assert (=> b!1378842 (= lt!607001 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun res!921374 () Bool)

(assert (=> start!117156 (=> (not res!921374) (not e!781100))))

(assert (=> start!117156 (= res!921374 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45837 a!4094))))))

(assert (=> start!117156 e!781100))

(assert (=> start!117156 true))

(declare-fun array_inv!34315 (array!93773) Bool)

(assert (=> start!117156 (array_inv!34315 a!4094)))

(declare-fun b!1378840 () Bool)

(declare-fun res!921375 () Bool)

(assert (=> b!1378840 (=> (not res!921375) (not e!781100))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378840 (= res!921375 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1378839 () Bool)

(declare-fun res!921373 () Bool)

(assert (=> b!1378839 (=> (not res!921373) (not e!781100))))

(assert (=> b!1378839 (= res!921373 (validKeyInArray!0 (select (arr!45287 a!4094) i!1451)))))

(declare-fun b!1378841 () Bool)

(declare-fun res!921376 () Bool)

(assert (=> b!1378841 (=> (not res!921376) (not e!781100))))

(assert (=> b!1378841 (= res!921376 (and (bvslt (size!45837 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45837 a!4094)) (bvsge i!1451 from!3466)))))

(assert (= (and start!117156 res!921374) b!1378839))

(assert (= (and b!1378839 res!921373) b!1378840))

(assert (= (and b!1378840 res!921375) b!1378841))

(assert (= (and b!1378841 res!921376) b!1378842))

(declare-fun m!1263663 () Bool)

(assert (=> b!1378842 m!1263663))

(declare-fun m!1263665 () Bool)

(assert (=> b!1378842 m!1263665))

(declare-fun m!1263667 () Bool)

(assert (=> b!1378842 m!1263667))

(declare-fun m!1263669 () Bool)

(assert (=> start!117156 m!1263669))

(declare-fun m!1263671 () Bool)

(assert (=> b!1378840 m!1263671))

(declare-fun m!1263673 () Bool)

(assert (=> b!1378839 m!1263673))

(assert (=> b!1378839 m!1263673))

(declare-fun m!1263675 () Bool)

(assert (=> b!1378839 m!1263675))

(push 1)

(assert (not start!117156))

(assert (not b!1378842))

(assert (not b!1378840))

(assert (not b!1378839))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

