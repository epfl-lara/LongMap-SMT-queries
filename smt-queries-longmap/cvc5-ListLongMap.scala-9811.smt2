; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116744 () Bool)

(assert start!116744)

(declare-fun b!1375653 () Bool)

(declare-fun res!918060 () Bool)

(declare-fun e!779426 () Bool)

(assert (=> b!1375653 (=> (not res!918060) (not e!779426))))

(declare-datatypes ((array!93335 0))(
  ( (array!93336 (arr!45069 (Array (_ BitVec 32) (_ BitVec 64))) (size!45620 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93335)

(assert (=> b!1375653 (= res!918060 (bvslt (size!45620 a!4142) #b01111111111111111111111111111111))))

(declare-fun res!918057 () Bool)

(assert (=> start!116744 (=> (not res!918057) (not e!779426))))

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> start!116744 (= res!918057 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45620 a!4142))))))

(assert (=> start!116744 e!779426))

(assert (=> start!116744 true))

(declare-fun array_inv!34350 (array!93335) Bool)

(assert (=> start!116744 (array_inv!34350 a!4142)))

(declare-fun b!1375654 () Bool)

(declare-fun res!918058 () Bool)

(assert (=> b!1375654 (=> (not res!918058) (not e!779426))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375654 (= res!918058 (validKeyInArray!0 (select (arr!45069 a!4142) i!1457)))))

(declare-fun b!1375655 () Bool)

(declare-fun e!779428 () Bool)

(assert (=> b!1375655 (= e!779426 (not e!779428))))

(declare-fun res!918056 () Bool)

(assert (=> b!1375655 (=> res!918056 e!779428)))

(assert (=> b!1375655 (= res!918056 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) i!1457)))))

(declare-fun lt!603921 () array!93335)

(declare-fun arrayCountValidKeys!0 (array!93335 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375655 (= (arrayCountValidKeys!0 lt!603921 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1375655 (= lt!603921 (array!93336 (store (arr!45069 a!4142) i!1457 k!2959) (size!45620 a!4142)))))

(declare-datatypes ((Unit!45372 0))(
  ( (Unit!45373) )
))
(declare-fun lt!603922 () Unit!45372)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93335 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45372)

(assert (=> b!1375655 (= lt!603922 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1375656 () Bool)

(declare-fun res!918059 () Bool)

(assert (=> b!1375656 (=> (not res!918059) (not e!779426))))

(assert (=> b!1375656 (= res!918059 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1375657 () Bool)

(assert (=> b!1375657 (= e!779428 true)))

(declare-fun lt!603923 () (_ BitVec 32))

(assert (=> b!1375657 (= lt!603923 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603924 () (_ BitVec 32))

(assert (=> b!1375657 (= lt!603924 (arrayCountValidKeys!0 lt!603921 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (= (and start!116744 res!918057) b!1375654))

(assert (= (and b!1375654 res!918058) b!1375656))

(assert (= (and b!1375656 res!918059) b!1375653))

(assert (= (and b!1375653 res!918060) b!1375655))

(assert (= (and b!1375655 (not res!918056)) b!1375657))

(declare-fun m!1259249 () Bool)

(assert (=> b!1375656 m!1259249))

(declare-fun m!1259251 () Bool)

(assert (=> b!1375654 m!1259251))

(assert (=> b!1375654 m!1259251))

(declare-fun m!1259253 () Bool)

(assert (=> b!1375654 m!1259253))

(declare-fun m!1259255 () Bool)

(assert (=> b!1375655 m!1259255))

(declare-fun m!1259257 () Bool)

(assert (=> b!1375655 m!1259257))

(declare-fun m!1259259 () Bool)

(assert (=> b!1375655 m!1259259))

(declare-fun m!1259261 () Bool)

(assert (=> b!1375655 m!1259261))

(declare-fun m!1259263 () Bool)

(assert (=> b!1375657 m!1259263))

(declare-fun m!1259265 () Bool)

(assert (=> b!1375657 m!1259265))

(declare-fun m!1259267 () Bool)

(assert (=> start!116744 m!1259267))

(push 1)

(assert (not b!1375657))

(assert (not b!1375654))

(assert (not b!1375656))

(assert (not b!1375655))

(assert (not start!116744))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

