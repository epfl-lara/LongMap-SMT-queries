; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71882 () Bool)

(assert start!71882)

(declare-fun b!835308 () Bool)

(declare-fun res!568184 () Bool)

(declare-fun e!465997 () Bool)

(assert (=> b!835308 (=> (not res!568184) (not e!465997))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835308 (= res!568184 (validKeyInArray!0 k!2968))))

(declare-fun b!835310 () Bool)

(declare-fun e!465998 () Bool)

(assert (=> b!835310 (= e!465998 (not true))))

(declare-datatypes ((array!46792 0))(
  ( (array!46793 (arr!22430 (Array (_ BitVec 32) (_ BitVec 64))) (size!22851 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46792)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun lt!379687 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46792 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835310 (= (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (bvadd #b00000000000000000000000000000001 lt!379687))))

(declare-datatypes ((Unit!28711 0))(
  ( (Unit!28712) )
))
(declare-fun lt!379686 () Unit!28711)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46792 (_ BitVec 32) (_ BitVec 32)) Unit!28711)

(assert (=> b!835310 (= lt!379686 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!835311 () Bool)

(declare-fun res!568179 () Bool)

(assert (=> b!835311 (=> (not res!568179) (not e!465997))))

(assert (=> b!835311 (= res!568179 (not (validKeyInArray!0 (select (arr!22430 a!4227) i!1466))))))

(declare-fun b!835312 () Bool)

(declare-fun res!568181 () Bool)

(assert (=> b!835312 (=> (not res!568181) (not e!465997))))

(assert (=> b!835312 (= res!568181 (and (bvslt (size!22851 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22851 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835313 () Bool)

(declare-fun res!568182 () Bool)

(assert (=> b!835313 (=> (not res!568182) (not e!465998))))

(assert (=> b!835313 (= res!568182 (validKeyInArray!0 (select (arr!22430 a!4227) to!390)))))

(declare-fun res!568183 () Bool)

(assert (=> start!71882 (=> (not res!568183) (not e!465997))))

(assert (=> start!71882 (= res!568183 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22851 a!4227))))))

(assert (=> start!71882 e!465997))

(assert (=> start!71882 true))

(declare-fun array_inv!17877 (array!46792) Bool)

(assert (=> start!71882 (array_inv!17877 a!4227)))

(declare-fun b!835309 () Bool)

(assert (=> b!835309 (= e!465997 e!465998)))

(declare-fun res!568180 () Bool)

(assert (=> b!835309 (=> (not res!568180) (not e!465998))))

(declare-fun lt!379685 () (_ BitVec 32))

(assert (=> b!835309 (= res!568180 (and (= lt!379685 lt!379687) (not (= to!390 (size!22851 a!4227)))))))

(assert (=> b!835309 (= lt!379687 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835309 (= lt!379685 (arrayCountValidKeys!0 (array!46793 (store (arr!22430 a!4227) i!1466 k!2968) (size!22851 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (= (and start!71882 res!568183) b!835311))

(assert (= (and b!835311 res!568179) b!835308))

(assert (= (and b!835308 res!568184) b!835312))

(assert (= (and b!835312 res!568181) b!835309))

(assert (= (and b!835309 res!568180) b!835313))

(assert (= (and b!835313 res!568182) b!835310))

(declare-fun m!780467 () Bool)

(assert (=> b!835308 m!780467))

(declare-fun m!780469 () Bool)

(assert (=> b!835311 m!780469))

(assert (=> b!835311 m!780469))

(declare-fun m!780471 () Bool)

(assert (=> b!835311 m!780471))

(declare-fun m!780473 () Bool)

(assert (=> b!835309 m!780473))

(declare-fun m!780475 () Bool)

(assert (=> b!835309 m!780475))

(declare-fun m!780477 () Bool)

(assert (=> b!835309 m!780477))

(declare-fun m!780479 () Bool)

(assert (=> b!835310 m!780479))

(declare-fun m!780481 () Bool)

(assert (=> b!835310 m!780481))

(declare-fun m!780483 () Bool)

(assert (=> start!71882 m!780483))

(declare-fun m!780485 () Bool)

(assert (=> b!835313 m!780485))

(assert (=> b!835313 m!780485))

(declare-fun m!780487 () Bool)

(assert (=> b!835313 m!780487))

(push 1)

(assert (not b!835308))

(assert (not b!835311))

(assert (not b!835313))

(assert (not start!71882))

(assert (not b!835310))

(assert (not b!835309))

(check-sat)

(pop 1)

