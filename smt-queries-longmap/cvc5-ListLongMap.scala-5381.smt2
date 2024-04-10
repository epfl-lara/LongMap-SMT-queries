; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71884 () Bool)

(assert start!71884)

(declare-fun b!835328 () Bool)

(declare-fun res!568205 () Bool)

(declare-fun e!466009 () Bool)

(assert (=> b!835328 (=> (not res!568205) (not e!466009))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835328 (= res!568205 (validKeyInArray!0 k!2968))))

(declare-fun b!835329 () Bool)

(declare-fun res!568200 () Bool)

(declare-fun e!466010 () Bool)

(assert (=> b!835329 (=> (not res!568200) (not e!466010))))

(declare-datatypes ((array!46794 0))(
  ( (array!46795 (arr!22431 (Array (_ BitVec 32) (_ BitVec 64))) (size!22852 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46794)

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835329 (= res!568200 (validKeyInArray!0 (select (arr!22431 a!4227) to!390)))))

(declare-fun b!835330 () Bool)

(declare-fun res!568204 () Bool)

(assert (=> b!835330 (=> (not res!568204) (not e!466009))))

(declare-fun i!1466 () (_ BitVec 32))

(assert (=> b!835330 (= res!568204 (and (bvslt (size!22852 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22852 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835331 () Bool)

(assert (=> b!835331 (= e!466009 e!466010)))

(declare-fun res!568199 () Bool)

(assert (=> b!835331 (=> (not res!568199) (not e!466010))))

(declare-fun lt!379694 () (_ BitVec 32))

(declare-fun lt!379696 () (_ BitVec 32))

(assert (=> b!835331 (= res!568199 (and (= lt!379696 lt!379694) (not (= to!390 (size!22852 a!4227)))))))

(declare-fun arrayCountValidKeys!0 (array!46794 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835331 (= lt!379694 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835331 (= lt!379696 (arrayCountValidKeys!0 (array!46795 (store (arr!22431 a!4227) i!1466 k!2968) (size!22852 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!835332 () Bool)

(declare-fun res!568203 () Bool)

(assert (=> b!835332 (=> (not res!568203) (not e!466009))))

(assert (=> b!835332 (= res!568203 (not (validKeyInArray!0 (select (arr!22431 a!4227) i!1466))))))

(declare-fun res!568202 () Bool)

(assert (=> start!71884 (=> (not res!568202) (not e!466009))))

(assert (=> start!71884 (= res!568202 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22852 a!4227))))))

(assert (=> start!71884 e!466009))

(assert (=> start!71884 true))

(declare-fun array_inv!17878 (array!46794) Bool)

(assert (=> start!71884 (array_inv!17878 a!4227)))

(declare-fun b!835333 () Bool)

(declare-fun e!466008 () Bool)

(assert (=> b!835333 (= e!466010 (not e!466008))))

(declare-fun res!568201 () Bool)

(assert (=> b!835333 (=> (not res!568201) (not e!466008))))

(assert (=> b!835333 (= res!568201 (and (bvsge (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000) (bvslt to!390 (size!22852 a!4227))))))

(assert (=> b!835333 (= (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (bvadd #b00000000000000000000000000000001 lt!379694))))

(declare-datatypes ((Unit!28713 0))(
  ( (Unit!28714) )
))
(declare-fun lt!379695 () Unit!28713)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46794 (_ BitVec 32) (_ BitVec 32)) Unit!28713)

(assert (=> b!835333 (= lt!379695 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!835334 () Bool)

(assert (=> b!835334 (= e!466008 (validKeyInArray!0 (select (store (arr!22431 a!4227) i!1466 k!2968) to!390)))))

(assert (= (and start!71884 res!568202) b!835332))

(assert (= (and b!835332 res!568203) b!835328))

(assert (= (and b!835328 res!568205) b!835330))

(assert (= (and b!835330 res!568204) b!835331))

(assert (= (and b!835331 res!568199) b!835329))

(assert (= (and b!835329 res!568200) b!835333))

(assert (= (and b!835333 res!568201) b!835334))

(declare-fun m!780489 () Bool)

(assert (=> b!835329 m!780489))

(assert (=> b!835329 m!780489))

(declare-fun m!780491 () Bool)

(assert (=> b!835329 m!780491))

(declare-fun m!780493 () Bool)

(assert (=> b!835328 m!780493))

(declare-fun m!780495 () Bool)

(assert (=> b!835334 m!780495))

(declare-fun m!780497 () Bool)

(assert (=> b!835334 m!780497))

(assert (=> b!835334 m!780497))

(declare-fun m!780499 () Bool)

(assert (=> b!835334 m!780499))

(declare-fun m!780501 () Bool)

(assert (=> b!835332 m!780501))

(assert (=> b!835332 m!780501))

(declare-fun m!780503 () Bool)

(assert (=> b!835332 m!780503))

(declare-fun m!780505 () Bool)

(assert (=> start!71884 m!780505))

(declare-fun m!780507 () Bool)

(assert (=> b!835331 m!780507))

(assert (=> b!835331 m!780495))

(declare-fun m!780509 () Bool)

(assert (=> b!835331 m!780509))

(declare-fun m!780511 () Bool)

(assert (=> b!835333 m!780511))

(declare-fun m!780513 () Bool)

(assert (=> b!835333 m!780513))

(push 1)

(assert (not start!71884))

(assert (not b!835328))

(assert (not b!835333))

(assert (not b!835329))

(assert (not b!835331))

(assert (not b!835334))

(assert (not b!835332))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

