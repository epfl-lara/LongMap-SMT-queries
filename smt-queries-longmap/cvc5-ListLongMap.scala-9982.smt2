; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117898 () Bool)

(assert start!117898)

(declare-fun res!923105 () Bool)

(declare-fun e!783106 () Bool)

(assert (=> start!117898 (=> (not res!923105) (not e!783106))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117898 (= res!923105 (validMask!0 mask!3034))))

(assert (=> start!117898 e!783106))

(assert (=> start!117898 true))

(declare-datatypes ((array!94289 0))(
  ( (array!94290 (arr!45527 (Array (_ BitVec 32) (_ BitVec 64))) (size!46077 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94289)

(declare-fun array_inv!34555 (array!94289) Bool)

(assert (=> start!117898 (array_inv!34555 a!2971)))

(declare-fun b!1381477 () Bool)

(declare-fun res!923107 () Bool)

(assert (=> b!1381477 (=> (not res!923107) (not e!783106))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381477 (= res!923107 (and (= (size!46077 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46077 a!2971))))))

(declare-fun b!1381478 () Bool)

(declare-fun res!923106 () Bool)

(assert (=> b!1381478 (=> (not res!923106) (not e!783106))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381478 (= res!923106 (validKeyInArray!0 (select (arr!45527 a!2971) i!1094)))))

(declare-fun b!1381479 () Bool)

(assert (=> b!1381479 (= e!783106 false)))

(declare-fun lt!608217 () Bool)

(declare-datatypes ((List!32061 0))(
  ( (Nil!32058) (Cons!32057 (h!33266 (_ BitVec 64)) (t!46755 List!32061)) )
))
(declare-fun arrayNoDuplicates!0 (array!94289 (_ BitVec 32) List!32061) Bool)

(assert (=> b!1381479 (= lt!608217 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32058))))

(assert (= (and start!117898 res!923105) b!1381477))

(assert (= (and b!1381477 res!923107) b!1381478))

(assert (= (and b!1381478 res!923106) b!1381479))

(declare-fun m!1266663 () Bool)

(assert (=> start!117898 m!1266663))

(declare-fun m!1266665 () Bool)

(assert (=> start!117898 m!1266665))

(declare-fun m!1266667 () Bool)

(assert (=> b!1381478 m!1266667))

(assert (=> b!1381478 m!1266667))

(declare-fun m!1266669 () Bool)

(assert (=> b!1381478 m!1266669))

(declare-fun m!1266671 () Bool)

(assert (=> b!1381479 m!1266671))

(push 1)

(assert (not b!1381479))

(assert (not start!117898))

(assert (not b!1381478))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

