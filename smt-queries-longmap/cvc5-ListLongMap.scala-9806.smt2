; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116486 () Bool)

(assert start!116486)

(declare-fun b!1374099 () Bool)

(declare-fun res!917287 () Bool)

(declare-fun e!778432 () Bool)

(assert (=> b!1374099 (=> (not res!917287) (not e!778432))))

(declare-datatypes ((array!93186 0))(
  ( (array!93187 (arr!44999 (Array (_ BitVec 32) (_ BitVec 64))) (size!45549 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93186)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374099 (= res!917287 (validKeyInArray!0 (select (arr!44999 a!4142) i!1457)))))

(declare-fun res!917284 () Bool)

(assert (=> start!116486 (=> (not res!917284) (not e!778432))))

(assert (=> start!116486 (= res!917284 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45549 a!4142))))))

(assert (=> start!116486 e!778432))

(assert (=> start!116486 true))

(declare-fun array_inv!34027 (array!93186) Bool)

(assert (=> start!116486 (array_inv!34027 a!4142)))

(declare-fun b!1374100 () Bool)

(declare-fun e!778431 () Bool)

(assert (=> b!1374100 (= e!778432 (not e!778431))))

(declare-fun res!917285 () Bool)

(assert (=> b!1374100 (=> res!917285 e!778431)))

(assert (=> b!1374100 (= res!917285 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) i!1457)))))

(declare-fun lt!603241 () array!93186)

(declare-fun arrayCountValidKeys!0 (array!93186 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374100 (= (arrayCountValidKeys!0 lt!603241 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1374100 (= lt!603241 (array!93187 (store (arr!44999 a!4142) i!1457 k!2959) (size!45549 a!4142)))))

(declare-datatypes ((Unit!45399 0))(
  ( (Unit!45400) )
))
(declare-fun lt!603244 () Unit!45399)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93186 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45399)

(assert (=> b!1374100 (= lt!603244 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1374101 () Bool)

(declare-fun res!917283 () Bool)

(assert (=> b!1374101 (=> (not res!917283) (not e!778432))))

(assert (=> b!1374101 (= res!917283 (bvslt (size!45549 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374102 () Bool)

(assert (=> b!1374102 (= e!778431 true)))

(declare-fun lt!603242 () (_ BitVec 32))

(assert (=> b!1374102 (= lt!603242 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603243 () (_ BitVec 32))

(assert (=> b!1374102 (= lt!603243 (arrayCountValidKeys!0 lt!603241 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374103 () Bool)

(declare-fun res!917286 () Bool)

(assert (=> b!1374103 (=> (not res!917286) (not e!778432))))

(assert (=> b!1374103 (= res!917286 (not (validKeyInArray!0 k!2959)))))

(assert (= (and start!116486 res!917284) b!1374099))

(assert (= (and b!1374099 res!917287) b!1374103))

(assert (= (and b!1374103 res!917286) b!1374101))

(assert (= (and b!1374101 res!917283) b!1374100))

(assert (= (and b!1374100 (not res!917285)) b!1374102))

(declare-fun m!1257313 () Bool)

(assert (=> start!116486 m!1257313))

(declare-fun m!1257315 () Bool)

(assert (=> b!1374103 m!1257315))

(declare-fun m!1257317 () Bool)

(assert (=> b!1374099 m!1257317))

(assert (=> b!1374099 m!1257317))

(declare-fun m!1257319 () Bool)

(assert (=> b!1374099 m!1257319))

(declare-fun m!1257321 () Bool)

(assert (=> b!1374102 m!1257321))

(declare-fun m!1257323 () Bool)

(assert (=> b!1374102 m!1257323))

(declare-fun m!1257325 () Bool)

(assert (=> b!1374100 m!1257325))

(declare-fun m!1257327 () Bool)

(assert (=> b!1374100 m!1257327))

(declare-fun m!1257329 () Bool)

(assert (=> b!1374100 m!1257329))

(declare-fun m!1257331 () Bool)

(assert (=> b!1374100 m!1257331))

(push 1)

(assert (not b!1374100))

(assert (not b!1374103))

(assert (not b!1374102))

(assert (not start!116486))

(assert (not b!1374099))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

