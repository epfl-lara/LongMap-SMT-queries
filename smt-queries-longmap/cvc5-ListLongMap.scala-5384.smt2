; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71902 () Bool)

(assert start!71902)

(declare-fun res!568381 () Bool)

(declare-fun e!466091 () Bool)

(assert (=> start!71902 (=> (not res!568381) (not e!466091))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-datatypes ((array!46812 0))(
  ( (array!46813 (arr!22440 (Array (_ BitVec 32) (_ BitVec 64))) (size!22861 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46812)

(assert (=> start!71902 (= res!568381 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22861 a!4227))))))

(assert (=> start!71902 e!466091))

(assert (=> start!71902 true))

(declare-fun array_inv!17887 (array!46812) Bool)

(assert (=> start!71902 (array_inv!17887 a!4227)))

(declare-fun b!835508 () Bool)

(declare-fun res!568384 () Bool)

(assert (=> b!835508 (=> (not res!568384) (not e!466091))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835508 (= res!568384 (validKeyInArray!0 k!2968))))

(declare-fun b!835509 () Bool)

(declare-fun e!466089 () Bool)

(assert (=> b!835509 (= e!466091 e!466089)))

(declare-fun res!568382 () Bool)

(assert (=> b!835509 (=> (not res!568382) (not e!466089))))

(declare-fun lt!379748 () (_ BitVec 32))

(declare-fun lt!379749 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835509 (= res!568382 (and (= lt!379749 lt!379748) (not (= to!390 (size!22861 a!4227)))))))

(declare-fun arrayCountValidKeys!0 (array!46812 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835509 (= lt!379748 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835509 (= lt!379749 (arrayCountValidKeys!0 (array!46813 (store (arr!22440 a!4227) i!1466 k!2968) (size!22861 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!835510 () Bool)

(declare-fun res!568379 () Bool)

(assert (=> b!835510 (=> (not res!568379) (not e!466091))))

(assert (=> b!835510 (= res!568379 (not (validKeyInArray!0 (select (arr!22440 a!4227) i!1466))))))

(declare-fun b!835511 () Bool)

(declare-fun e!466090 () Bool)

(assert (=> b!835511 (= e!466089 (not e!466090))))

(declare-fun res!568383 () Bool)

(assert (=> b!835511 (=> (not res!568383) (not e!466090))))

(assert (=> b!835511 (= res!568383 (and (bvsge (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000) (bvslt to!390 (size!22861 a!4227))))))

(assert (=> b!835511 (= (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) lt!379748)))

(declare-datatypes ((Unit!28725 0))(
  ( (Unit!28726) )
))
(declare-fun lt!379750 () Unit!28725)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46812 (_ BitVec 32) (_ BitVec 32)) Unit!28725)

(assert (=> b!835511 (= lt!379750 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!835512 () Bool)

(declare-fun res!568380 () Bool)

(assert (=> b!835512 (=> (not res!568380) (not e!466089))))

(assert (=> b!835512 (= res!568380 (not (validKeyInArray!0 (select (arr!22440 a!4227) to!390))))))

(declare-fun b!835513 () Bool)

(declare-fun res!568385 () Bool)

(assert (=> b!835513 (=> (not res!568385) (not e!466091))))

(assert (=> b!835513 (= res!568385 (and (bvslt (size!22861 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22861 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835514 () Bool)

(assert (=> b!835514 (= e!466090 (not (validKeyInArray!0 (select (store (arr!22440 a!4227) i!1466 k!2968) to!390))))))

(assert (= (and start!71902 res!568381) b!835510))

(assert (= (and b!835510 res!568379) b!835508))

(assert (= (and b!835508 res!568384) b!835513))

(assert (= (and b!835513 res!568385) b!835509))

(assert (= (and b!835509 res!568382) b!835512))

(assert (= (and b!835512 res!568380) b!835511))

(assert (= (and b!835511 res!568383) b!835514))

(declare-fun m!780687 () Bool)

(assert (=> start!71902 m!780687))

(declare-fun m!780689 () Bool)

(assert (=> b!835508 m!780689))

(declare-fun m!780691 () Bool)

(assert (=> b!835510 m!780691))

(assert (=> b!835510 m!780691))

(declare-fun m!780693 () Bool)

(assert (=> b!835510 m!780693))

(declare-fun m!780695 () Bool)

(assert (=> b!835509 m!780695))

(declare-fun m!780697 () Bool)

(assert (=> b!835509 m!780697))

(declare-fun m!780699 () Bool)

(assert (=> b!835509 m!780699))

(declare-fun m!780701 () Bool)

(assert (=> b!835511 m!780701))

(declare-fun m!780703 () Bool)

(assert (=> b!835511 m!780703))

(declare-fun m!780705 () Bool)

(assert (=> b!835512 m!780705))

(assert (=> b!835512 m!780705))

(declare-fun m!780707 () Bool)

(assert (=> b!835512 m!780707))

(assert (=> b!835514 m!780697))

(declare-fun m!780709 () Bool)

(assert (=> b!835514 m!780709))

(assert (=> b!835514 m!780709))

(declare-fun m!780711 () Bool)

(assert (=> b!835514 m!780711))

(push 1)

(assert (not b!835508))

(assert (not b!835512))

(assert (not b!835514))

(assert (not start!71902))

(assert (not b!835510))

(assert (not b!835509))

(assert (not b!835511))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

