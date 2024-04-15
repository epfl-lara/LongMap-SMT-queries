; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116516 () Bool)

(assert start!116516)

(declare-fun b!1374319 () Bool)

(declare-fun res!917549 () Bool)

(declare-fun e!778569 () Bool)

(assert (=> b!1374319 (=> (not res!917549) (not e!778569))))

(declare-datatypes ((array!93175 0))(
  ( (array!93176 (arr!44994 (Array (_ BitVec 32) (_ BitVec 64))) (size!45546 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93175)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374319 (= res!917549 (validKeyInArray!0 (select (arr!44994 a!4142) i!1457)))))

(declare-fun b!1374321 () Bool)

(declare-fun res!917547 () Bool)

(assert (=> b!1374321 (=> (not res!917547) (not e!778569))))

(assert (=> b!1374321 (= res!917547 (bvslt (size!45546 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374322 () Bool)

(assert (=> b!1374322 (= e!778569 (not true))))

(declare-fun lt!603288 () array!93175)

(declare-fun arrayCountValidKeys!0 (array!93175 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374322 (= (arrayCountValidKeys!0 lt!603288 (bvadd #b00000000000000000000000000000001 i!1457) (size!45546 a!4142)) (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45546 a!4142)))))

(declare-datatypes ((Unit!45280 0))(
  ( (Unit!45281) )
))
(declare-fun lt!603287 () Unit!45280)

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93175 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45280)

(assert (=> b!1374322 (= lt!603287 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374322 (= (arrayCountValidKeys!0 lt!603288 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(assert (=> b!1374322 (= lt!603288 (array!93176 (store (arr!44994 a!4142) i!1457 k!2959) (size!45546 a!4142)))))

(declare-fun lt!603286 () Unit!45280)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93175 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45280)

(assert (=> b!1374322 (= lt!603286 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1374320 () Bool)

(declare-fun res!917546 () Bool)

(assert (=> b!1374320 (=> (not res!917546) (not e!778569))))

(assert (=> b!1374320 (= res!917546 (not (validKeyInArray!0 k!2959)))))

(declare-fun res!917548 () Bool)

(assert (=> start!116516 (=> (not res!917548) (not e!778569))))

(assert (=> start!116516 (= res!917548 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45546 a!4142))))))

(assert (=> start!116516 e!778569))

(assert (=> start!116516 true))

(declare-fun array_inv!34227 (array!93175) Bool)

(assert (=> start!116516 (array_inv!34227 a!4142)))

(assert (= (and start!116516 res!917548) b!1374319))

(assert (= (and b!1374319 res!917549) b!1374320))

(assert (= (and b!1374320 res!917546) b!1374321))

(assert (= (and b!1374321 res!917547) b!1374322))

(declare-fun m!1257191 () Bool)

(assert (=> b!1374319 m!1257191))

(assert (=> b!1374319 m!1257191))

(declare-fun m!1257193 () Bool)

(assert (=> b!1374319 m!1257193))

(declare-fun m!1257195 () Bool)

(assert (=> b!1374322 m!1257195))

(declare-fun m!1257197 () Bool)

(assert (=> b!1374322 m!1257197))

(declare-fun m!1257199 () Bool)

(assert (=> b!1374322 m!1257199))

(declare-fun m!1257201 () Bool)

(assert (=> b!1374322 m!1257201))

(declare-fun m!1257203 () Bool)

(assert (=> b!1374322 m!1257203))

(declare-fun m!1257205 () Bool)

(assert (=> b!1374322 m!1257205))

(declare-fun m!1257207 () Bool)

(assert (=> b!1374322 m!1257207))

(declare-fun m!1257209 () Bool)

(assert (=> b!1374320 m!1257209))

(declare-fun m!1257211 () Bool)

(assert (=> start!116516 m!1257211))

(push 1)

(assert (not b!1374320))

(assert (not start!116516))

(assert (not b!1374322))

(assert (not b!1374319))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

