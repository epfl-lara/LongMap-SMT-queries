; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116834 () Bool)

(assert start!116834)

(declare-fun b!1376176 () Bool)

(declare-fun e!779710 () Bool)

(assert (=> b!1376176 (= e!779710 (not true))))

(declare-datatypes ((array!93410 0))(
  ( (array!93411 (arr!45105 (Array (_ BitVec 32) (_ BitVec 64))) (size!45656 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93410)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93410 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376176 (= (arrayCountValidKeys!0 (array!93411 (store (arr!45105 a!4142) i!1457 k!2959) (size!45656 a!4142)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!45432 0))(
  ( (Unit!45433) )
))
(declare-fun lt!604389 () Unit!45432)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93410 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45432)

(assert (=> b!1376176 (= lt!604389 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1376174 () Bool)

(declare-fun res!918518 () Bool)

(assert (=> b!1376174 (=> (not res!918518) (not e!779710))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376174 (= res!918518 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1376173 () Bool)

(declare-fun res!918517 () Bool)

(assert (=> b!1376173 (=> (not res!918517) (not e!779710))))

(assert (=> b!1376173 (= res!918517 (validKeyInArray!0 (select (arr!45105 a!4142) i!1457)))))

(declare-fun res!918516 () Bool)

(assert (=> start!116834 (=> (not res!918516) (not e!779710))))

(assert (=> start!116834 (= res!918516 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45656 a!4142))))))

(assert (=> start!116834 e!779710))

(assert (=> start!116834 true))

(declare-fun array_inv!34386 (array!93410) Bool)

(assert (=> start!116834 (array_inv!34386 a!4142)))

(declare-fun b!1376175 () Bool)

(declare-fun res!918519 () Bool)

(assert (=> b!1376175 (=> (not res!918519) (not e!779710))))

(assert (=> b!1376175 (= res!918519 (bvslt (size!45656 a!4142) #b01111111111111111111111111111111))))

(assert (= (and start!116834 res!918516) b!1376173))

(assert (= (and b!1376173 res!918517) b!1376174))

(assert (= (and b!1376174 res!918518) b!1376175))

(assert (= (and b!1376175 res!918519) b!1376176))

(declare-fun m!1260055 () Bool)

(assert (=> b!1376176 m!1260055))

(declare-fun m!1260057 () Bool)

(assert (=> b!1376176 m!1260057))

(declare-fun m!1260059 () Bool)

(assert (=> b!1376176 m!1260059))

(declare-fun m!1260061 () Bool)

(assert (=> b!1376176 m!1260061))

(declare-fun m!1260063 () Bool)

(assert (=> b!1376174 m!1260063))

(declare-fun m!1260065 () Bool)

(assert (=> b!1376173 m!1260065))

(assert (=> b!1376173 m!1260065))

(declare-fun m!1260067 () Bool)

(assert (=> b!1376173 m!1260067))

(declare-fun m!1260069 () Bool)

(assert (=> start!116834 m!1260069))

(push 1)

(assert (not b!1376176))

(assert (not start!116834))

(assert (not b!1376174))

(assert (not b!1376173))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

