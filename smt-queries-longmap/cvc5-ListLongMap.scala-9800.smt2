; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116450 () Bool)

(assert start!116450)

(declare-fun b!1373881 () Bool)

(declare-fun res!917065 () Bool)

(declare-fun e!778320 () Bool)

(assert (=> b!1373881 (=> (not res!917065) (not e!778320))))

(declare-datatypes ((array!93150 0))(
  ( (array!93151 (arr!44981 (Array (_ BitVec 32) (_ BitVec 64))) (size!45531 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93150)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1373881 (= res!917065 (validKeyInArray!0 (select (arr!44981 a!4142) i!1457)))))

(declare-fun b!1373883 () Bool)

(declare-fun res!917068 () Bool)

(assert (=> b!1373883 (=> (not res!917068) (not e!778320))))

(assert (=> b!1373883 (= res!917068 (and (bvslt (size!45531 a!4142) #b01111111111111111111111111111111) (bvsle i!1457 (size!45531 a!4142))))))

(declare-fun res!917067 () Bool)

(assert (=> start!116450 (=> (not res!917067) (not e!778320))))

(assert (=> start!116450 (= res!917067 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45531 a!4142))))))

(assert (=> start!116450 e!778320))

(assert (=> start!116450 true))

(declare-fun array_inv!34009 (array!93150) Bool)

(assert (=> start!116450 (array_inv!34009 a!4142)))

(declare-fun b!1373884 () Bool)

(assert (=> b!1373884 (= e!778320 false)))

(declare-fun lt!603130 () (_ BitVec 32))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93150 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1373884 (= lt!603130 (arrayCountValidKeys!0 (array!93151 (store (arr!44981 a!4142) i!1457 k!2959) (size!45531 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603129 () (_ BitVec 32))

(assert (=> b!1373884 (= lt!603129 (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1373882 () Bool)

(declare-fun res!917066 () Bool)

(assert (=> b!1373882 (=> (not res!917066) (not e!778320))))

(assert (=> b!1373882 (= res!917066 (not (validKeyInArray!0 k!2959)))))

(assert (= (and start!116450 res!917067) b!1373881))

(assert (= (and b!1373881 res!917065) b!1373882))

(assert (= (and b!1373882 res!917066) b!1373883))

(assert (= (and b!1373883 res!917068) b!1373884))

(declare-fun m!1257061 () Bool)

(assert (=> b!1373881 m!1257061))

(assert (=> b!1373881 m!1257061))

(declare-fun m!1257063 () Bool)

(assert (=> b!1373881 m!1257063))

(declare-fun m!1257065 () Bool)

(assert (=> start!116450 m!1257065))

(declare-fun m!1257067 () Bool)

(assert (=> b!1373884 m!1257067))

(declare-fun m!1257069 () Bool)

(assert (=> b!1373884 m!1257069))

(declare-fun m!1257071 () Bool)

(assert (=> b!1373884 m!1257071))

(declare-fun m!1257073 () Bool)

(assert (=> b!1373882 m!1257073))

(push 1)

(assert (not b!1373884))

(assert (not b!1373882))

(assert (not b!1373881))

(assert (not start!116450))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

