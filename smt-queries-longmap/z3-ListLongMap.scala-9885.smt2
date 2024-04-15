; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117050 () Bool)

(assert start!117050)

(declare-fun res!920582 () Bool)

(declare-fun e!780628 () Bool)

(assert (=> start!117050 (=> (not res!920582) (not e!780628))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93621 0))(
  ( (array!93622 (arr!45211 (Array (_ BitVec 32) (_ BitVec 64))) (size!45763 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93621)

(assert (=> start!117050 (= res!920582 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45763 a!4094))))))

(assert (=> start!117050 e!780628))

(assert (=> start!117050 true))

(declare-fun array_inv!34444 (array!93621) Bool)

(assert (=> start!117050 (array_inv!34444 a!4094)))

(declare-fun b!1378003 () Bool)

(declare-fun res!920581 () Bool)

(assert (=> b!1378003 (=> (not res!920581) (not e!780628))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378003 (= res!920581 (validKeyInArray!0 (select (arr!45211 a!4094) i!1451)))))

(declare-fun b!1378004 () Bool)

(declare-fun res!920580 () Bool)

(assert (=> b!1378004 (=> (not res!920580) (not e!780628))))

(declare-fun k0!2953 () (_ BitVec 64))

(assert (=> b!1378004 (= res!920580 (not (validKeyInArray!0 k0!2953)))))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun b!1378005 () Bool)

(assert (=> b!1378005 (= e!780628 (and (bvslt (size!45763 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45763 a!4094)) (bvsge i!1451 from!3466) (bvsgt from!3466 (bvadd #b00000000000000000000000000000001 i!1451))))))

(assert (= (and start!117050 res!920582) b!1378003))

(assert (= (and b!1378003 res!920581) b!1378004))

(assert (= (and b!1378004 res!920580) b!1378005))

(declare-fun m!1262013 () Bool)

(assert (=> start!117050 m!1262013))

(declare-fun m!1262015 () Bool)

(assert (=> b!1378003 m!1262015))

(assert (=> b!1378003 m!1262015))

(declare-fun m!1262017 () Bool)

(assert (=> b!1378003 m!1262017))

(declare-fun m!1262019 () Bool)

(assert (=> b!1378004 m!1262019))

(check-sat (not b!1378004) (not start!117050) (not b!1378003))
(check-sat)
