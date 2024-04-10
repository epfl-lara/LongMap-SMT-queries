; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116474 () Bool)

(assert start!116474)

(declare-fun b!1374025 () Bool)

(declare-fun res!917212 () Bool)

(declare-fun e!778392 () Bool)

(assert (=> b!1374025 (=> (not res!917212) (not e!778392))))

(declare-datatypes ((array!93174 0))(
  ( (array!93175 (arr!44993 (Array (_ BitVec 32) (_ BitVec 64))) (size!45543 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93174)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374025 (= res!917212 (validKeyInArray!0 (select (arr!44993 a!4142) i!1457)))))

(declare-fun b!1374027 () Bool)

(declare-fun res!917210 () Bool)

(assert (=> b!1374027 (=> (not res!917210) (not e!778392))))

(assert (=> b!1374027 (= res!917210 (and (bvslt (size!45543 a!4142) #b01111111111111111111111111111111) (bvsle i!1457 (size!45543 a!4142))))))

(declare-fun b!1374028 () Bool)

(assert (=> b!1374028 (= e!778392 false)))

(declare-fun lt!603202 () (_ BitVec 32))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93174 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374028 (= lt!603202 (arrayCountValidKeys!0 (array!93175 (store (arr!44993 a!4142) i!1457 k!2959) (size!45543 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603201 () (_ BitVec 32))

(assert (=> b!1374028 (= lt!603201 (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374026 () Bool)

(declare-fun res!917211 () Bool)

(assert (=> b!1374026 (=> (not res!917211) (not e!778392))))

(assert (=> b!1374026 (= res!917211 (not (validKeyInArray!0 k!2959)))))

(declare-fun res!917209 () Bool)

(assert (=> start!116474 (=> (not res!917209) (not e!778392))))

(assert (=> start!116474 (= res!917209 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45543 a!4142))))))

(assert (=> start!116474 e!778392))

(assert (=> start!116474 true))

(declare-fun array_inv!34021 (array!93174) Bool)

(assert (=> start!116474 (array_inv!34021 a!4142)))

(assert (= (and start!116474 res!917209) b!1374025))

(assert (= (and b!1374025 res!917212) b!1374026))

(assert (= (and b!1374026 res!917211) b!1374027))

(assert (= (and b!1374027 res!917210) b!1374028))

(declare-fun m!1257229 () Bool)

(assert (=> b!1374025 m!1257229))

(assert (=> b!1374025 m!1257229))

(declare-fun m!1257231 () Bool)

(assert (=> b!1374025 m!1257231))

(declare-fun m!1257233 () Bool)

(assert (=> b!1374028 m!1257233))

(declare-fun m!1257235 () Bool)

(assert (=> b!1374028 m!1257235))

(declare-fun m!1257237 () Bool)

(assert (=> b!1374028 m!1257237))

(declare-fun m!1257239 () Bool)

(assert (=> b!1374026 m!1257239))

(declare-fun m!1257241 () Bool)

(assert (=> start!116474 m!1257241))

(push 1)

(assert (not b!1374026))

(assert (not b!1374025))

(assert (not start!116474))

(assert (not b!1374028))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

