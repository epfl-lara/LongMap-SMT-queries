; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71906 () Bool)

(assert start!71906)

(declare-fun b!835550 () Bool)

(declare-fun e!466114 () Bool)

(declare-fun e!466115 () Bool)

(assert (=> b!835550 (= e!466114 (not e!466115))))

(declare-fun res!568425 () Bool)

(assert (=> b!835550 (=> (not res!568425) (not e!466115))))

(declare-datatypes ((array!46816 0))(
  ( (array!46817 (arr!22442 (Array (_ BitVec 32) (_ BitVec 64))) (size!22863 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46816)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835550 (= res!568425 (and (bvsge (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000) (bvslt to!390 (size!22863 a!4227))))))

(declare-fun lt!379768 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46816 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835550 (= (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) lt!379768)))

(declare-datatypes ((Unit!28729 0))(
  ( (Unit!28730) )
))
(declare-fun lt!379766 () Unit!28729)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46816 (_ BitVec 32) (_ BitVec 32)) Unit!28729)

(assert (=> b!835550 (= lt!379766 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!835551 () Bool)

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835551 (= e!466115 (not (validKeyInArray!0 (select (store (arr!22442 a!4227) i!1466 k!2968) to!390))))))

(declare-fun res!568421 () Bool)

(declare-fun e!466113 () Bool)

(assert (=> start!71906 (=> (not res!568421) (not e!466113))))

(assert (=> start!71906 (= res!568421 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22863 a!4227))))))

(assert (=> start!71906 e!466113))

(assert (=> start!71906 true))

(declare-fun array_inv!17889 (array!46816) Bool)

(assert (=> start!71906 (array_inv!17889 a!4227)))

(declare-fun b!835552 () Bool)

(declare-fun res!568422 () Bool)

(assert (=> b!835552 (=> (not res!568422) (not e!466113))))

(assert (=> b!835552 (= res!568422 (not (validKeyInArray!0 (select (arr!22442 a!4227) i!1466))))))

(declare-fun b!835553 () Bool)

(declare-fun res!568424 () Bool)

(assert (=> b!835553 (=> (not res!568424) (not e!466114))))

(assert (=> b!835553 (= res!568424 (not (validKeyInArray!0 (select (arr!22442 a!4227) to!390))))))

(declare-fun b!835554 () Bool)

(assert (=> b!835554 (= e!466113 e!466114)))

(declare-fun res!568426 () Bool)

(assert (=> b!835554 (=> (not res!568426) (not e!466114))))

(declare-fun lt!379767 () (_ BitVec 32))

(assert (=> b!835554 (= res!568426 (and (= lt!379767 lt!379768) (not (= to!390 (size!22863 a!4227)))))))

(assert (=> b!835554 (= lt!379768 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835554 (= lt!379767 (arrayCountValidKeys!0 (array!46817 (store (arr!22442 a!4227) i!1466 k!2968) (size!22863 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!835555 () Bool)

(declare-fun res!568427 () Bool)

(assert (=> b!835555 (=> (not res!568427) (not e!466113))))

(assert (=> b!835555 (= res!568427 (validKeyInArray!0 k!2968))))

(declare-fun b!835556 () Bool)

(declare-fun res!568423 () Bool)

(assert (=> b!835556 (=> (not res!568423) (not e!466113))))

(assert (=> b!835556 (= res!568423 (and (bvslt (size!22863 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22863 a!4227)) (bvsgt to!390 i!1466)))))

(assert (= (and start!71906 res!568421) b!835552))

(assert (= (and b!835552 res!568422) b!835555))

(assert (= (and b!835555 res!568427) b!835556))

(assert (= (and b!835556 res!568423) b!835554))

(assert (= (and b!835554 res!568426) b!835553))

(assert (= (and b!835553 res!568424) b!835550))

(assert (= (and b!835550 res!568425) b!835551))

(declare-fun m!780739 () Bool)

(assert (=> b!835552 m!780739))

(assert (=> b!835552 m!780739))

(declare-fun m!780741 () Bool)

(assert (=> b!835552 m!780741))

(declare-fun m!780743 () Bool)

(assert (=> b!835554 m!780743))

(declare-fun m!780745 () Bool)

(assert (=> b!835554 m!780745))

(declare-fun m!780747 () Bool)

(assert (=> b!835554 m!780747))

(declare-fun m!780749 () Bool)

(assert (=> start!71906 m!780749))

(declare-fun m!780751 () Bool)

(assert (=> b!835550 m!780751))

(declare-fun m!780753 () Bool)

(assert (=> b!835550 m!780753))

(declare-fun m!780755 () Bool)

(assert (=> b!835555 m!780755))

(declare-fun m!780757 () Bool)

(assert (=> b!835553 m!780757))

(assert (=> b!835553 m!780757))

(declare-fun m!780759 () Bool)

(assert (=> b!835553 m!780759))

(assert (=> b!835551 m!780745))

(declare-fun m!780761 () Bool)

(assert (=> b!835551 m!780761))

(assert (=> b!835551 m!780761))

(declare-fun m!780763 () Bool)

(assert (=> b!835551 m!780763))

(push 1)

(assert (not start!71906))

(assert (not b!835552))

(assert (not b!835553))

(assert (not b!835554))

(assert (not b!835550))

(assert (not b!835555))

(assert (not b!835551))

(check-sat)

(pop 1)

(push 1)

(check-sat)

