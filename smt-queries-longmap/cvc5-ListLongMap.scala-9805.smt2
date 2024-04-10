; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116480 () Bool)

(assert start!116480)

(declare-fun b!1374064 () Bool)

(declare-fun e!778411 () Bool)

(assert (=> b!1374064 (= e!778411 false)))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93180 0))(
  ( (array!93181 (arr!44996 (Array (_ BitVec 32) (_ BitVec 64))) (size!45546 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93180)

(declare-fun lt!603219 () (_ BitVec 32))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93180 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374064 (= lt!603219 (arrayCountValidKeys!0 (array!93181 (store (arr!44996 a!4142) i!1457 k!2959) (size!45546 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603220 () (_ BitVec 32))

(assert (=> b!1374064 (= lt!603220 (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374062 () Bool)

(declare-fun res!917246 () Bool)

(assert (=> b!1374062 (=> (not res!917246) (not e!778411))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374062 (= res!917246 (not (validKeyInArray!0 k!2959)))))

(declare-fun res!917247 () Bool)

(assert (=> start!116480 (=> (not res!917247) (not e!778411))))

(assert (=> start!116480 (= res!917247 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45546 a!4142))))))

(assert (=> start!116480 e!778411))

(assert (=> start!116480 true))

(declare-fun array_inv!34024 (array!93180) Bool)

(assert (=> start!116480 (array_inv!34024 a!4142)))

(declare-fun b!1374063 () Bool)

(declare-fun res!917245 () Bool)

(assert (=> b!1374063 (=> (not res!917245) (not e!778411))))

(assert (=> b!1374063 (= res!917245 (and (bvslt (size!45546 a!4142) #b01111111111111111111111111111111) (bvsle i!1457 (size!45546 a!4142))))))

(declare-fun b!1374061 () Bool)

(declare-fun res!917248 () Bool)

(assert (=> b!1374061 (=> (not res!917248) (not e!778411))))

(assert (=> b!1374061 (= res!917248 (validKeyInArray!0 (select (arr!44996 a!4142) i!1457)))))

(assert (= (and start!116480 res!917247) b!1374061))

(assert (= (and b!1374061 res!917248) b!1374062))

(assert (= (and b!1374062 res!917246) b!1374063))

(assert (= (and b!1374063 res!917245) b!1374064))

(declare-fun m!1257271 () Bool)

(assert (=> b!1374064 m!1257271))

(declare-fun m!1257273 () Bool)

(assert (=> b!1374064 m!1257273))

(declare-fun m!1257275 () Bool)

(assert (=> b!1374064 m!1257275))

(declare-fun m!1257277 () Bool)

(assert (=> b!1374062 m!1257277))

(declare-fun m!1257279 () Bool)

(assert (=> start!116480 m!1257279))

(declare-fun m!1257281 () Bool)

(assert (=> b!1374061 m!1257281))

(assert (=> b!1374061 m!1257281))

(declare-fun m!1257283 () Bool)

(assert (=> b!1374061 m!1257283))

(push 1)

(assert (not b!1374064))

(assert (not b!1374061))

(assert (not start!116480))

(assert (not b!1374062))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

