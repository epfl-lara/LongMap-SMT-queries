; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116484 () Bool)

(assert start!116484)

(declare-fun b!1374086 () Bool)

(declare-fun res!917271 () Bool)

(declare-fun e!778423 () Bool)

(assert (=> b!1374086 (=> (not res!917271) (not e!778423))))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374086 (= res!917271 (not (validKeyInArray!0 k!2959)))))

(declare-fun res!917269 () Bool)

(assert (=> start!116484 (=> (not res!917269) (not e!778423))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93184 0))(
  ( (array!93185 (arr!44998 (Array (_ BitVec 32) (_ BitVec 64))) (size!45548 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93184)

(assert (=> start!116484 (= res!917269 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45548 a!4142))))))

(assert (=> start!116484 e!778423))

(assert (=> start!116484 true))

(declare-fun array_inv!34026 (array!93184) Bool)

(assert (=> start!116484 (array_inv!34026 a!4142)))

(declare-fun b!1374085 () Bool)

(declare-fun res!917272 () Bool)

(assert (=> b!1374085 (=> (not res!917272) (not e!778423))))

(assert (=> b!1374085 (= res!917272 (validKeyInArray!0 (select (arr!44998 a!4142) i!1457)))))

(declare-fun b!1374087 () Bool)

(declare-fun res!917270 () Bool)

(assert (=> b!1374087 (=> (not res!917270) (not e!778423))))

(assert (=> b!1374087 (= res!917270 (and (bvslt (size!45548 a!4142) #b01111111111111111111111111111111) (bvsle i!1457 (size!45548 a!4142))))))

(declare-fun b!1374088 () Bool)

(assert (=> b!1374088 (= e!778423 false)))

(declare-fun lt!603232 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93184 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374088 (= lt!603232 (arrayCountValidKeys!0 (array!93185 (store (arr!44998 a!4142) i!1457 k!2959) (size!45548 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603231 () (_ BitVec 32))

(assert (=> b!1374088 (= lt!603231 (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (= (and start!116484 res!917269) b!1374085))

(assert (= (and b!1374085 res!917272) b!1374086))

(assert (= (and b!1374086 res!917271) b!1374087))

(assert (= (and b!1374087 res!917270) b!1374088))

(declare-fun m!1257299 () Bool)

(assert (=> b!1374086 m!1257299))

(declare-fun m!1257301 () Bool)

(assert (=> start!116484 m!1257301))

(declare-fun m!1257303 () Bool)

(assert (=> b!1374085 m!1257303))

(assert (=> b!1374085 m!1257303))

(declare-fun m!1257305 () Bool)

(assert (=> b!1374085 m!1257305))

(declare-fun m!1257307 () Bool)

(assert (=> b!1374088 m!1257307))

(declare-fun m!1257309 () Bool)

(assert (=> b!1374088 m!1257309))

(declare-fun m!1257311 () Bool)

(assert (=> b!1374088 m!1257311))

(push 1)

(assert (not b!1374086))

(assert (not b!1374088))

(assert (not start!116484))

(assert (not b!1374085))

(check-sat)

