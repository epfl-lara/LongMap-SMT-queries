; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116780 () Bool)

(assert start!116780)

(declare-fun b!1375905 () Bool)

(declare-fun res!918311 () Bool)

(declare-fun e!779571 () Bool)

(assert (=> b!1375905 (=> (not res!918311) (not e!779571))))

(declare-datatypes ((array!93371 0))(
  ( (array!93372 (arr!45087 (Array (_ BitVec 32) (_ BitVec 64))) (size!45638 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93371)

(assert (=> b!1375905 (= res!918311 (bvslt (size!45638 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1375906 () Bool)

(declare-fun e!779570 () Bool)

(assert (=> b!1375906 (= e!779571 (not e!779570))))

(declare-fun res!918312 () Bool)

(assert (=> b!1375906 (=> res!918312 e!779570)))

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> b!1375906 (= res!918312 (or (bvslt (size!45638 a!4142) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000)))))

(declare-fun lt!604335 () (_ BitVec 32))

(declare-fun lt!604338 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93371 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375906 (= (bvadd lt!604335 lt!604338) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45638 a!4142)))))

(declare-datatypes ((Unit!45408 0))(
  ( (Unit!45409) )
))
(declare-fun lt!604333 () Unit!45408)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93371 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45408)

(assert (=> b!1375906 (= lt!604333 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45638 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!604336 () (_ BitVec 32))

(assert (=> b!1375906 (= lt!604336 lt!604338)))

(assert (=> b!1375906 (= lt!604338 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45638 a!4142)))))

(declare-fun lt!604331 () array!93371)

(assert (=> b!1375906 (= lt!604336 (arrayCountValidKeys!0 lt!604331 (bvadd #b00000000000000000000000000000001 i!1457) (size!45638 a!4142)))))

(declare-fun lt!604332 () Unit!45408)

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93371 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45408)

(assert (=> b!1375906 (= lt!604332 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!604330 () (_ BitVec 32))

(assert (=> b!1375906 (= lt!604330 (bvsub lt!604335 #b00000000000000000000000000000001))))

(assert (=> b!1375906 (= lt!604330 (arrayCountValidKeys!0 lt!604331 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375906 (= lt!604335 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375906 (= lt!604331 (array!93372 (store (arr!45087 a!4142) i!1457 k!2959) (size!45638 a!4142)))))

(declare-fun lt!604334 () Unit!45408)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93371 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45408)

(assert (=> b!1375906 (= lt!604334 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1375907 () Bool)

(declare-fun res!918309 () Bool)

(assert (=> b!1375907 (=> (not res!918309) (not e!779571))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375907 (= res!918309 (validKeyInArray!0 (select (arr!45087 a!4142) i!1457)))))

(declare-fun res!918310 () Bool)

(assert (=> start!116780 (=> (not res!918310) (not e!779571))))

(assert (=> start!116780 (= res!918310 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45638 a!4142))))))

(assert (=> start!116780 e!779571))

(assert (=> start!116780 true))

(declare-fun array_inv!34368 (array!93371) Bool)

(assert (=> start!116780 (array_inv!34368 a!4142)))

(declare-fun b!1375908 () Bool)

(declare-fun res!918308 () Bool)

(assert (=> b!1375908 (=> (not res!918308) (not e!779571))))

(assert (=> b!1375908 (= res!918308 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1375909 () Bool)

(assert (=> b!1375909 (= e!779570 true)))

(assert (=> b!1375909 (= (bvadd lt!604330 lt!604336) (arrayCountValidKeys!0 lt!604331 #b00000000000000000000000000000000 (size!45638 a!4142)))))

(declare-fun lt!604337 () Unit!45408)

(assert (=> b!1375909 (= lt!604337 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!604331 #b00000000000000000000000000000000 (size!45638 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (= (and start!116780 res!918310) b!1375907))

(assert (= (and b!1375907 res!918309) b!1375908))

(assert (= (and b!1375908 res!918308) b!1375905))

(assert (= (and b!1375905 res!918311) b!1375906))

(assert (= (and b!1375906 (not res!918312)) b!1375909))

(declare-fun m!1259743 () Bool)

(assert (=> b!1375907 m!1259743))

(assert (=> b!1375907 m!1259743))

(declare-fun m!1259745 () Bool)

(assert (=> b!1375907 m!1259745))

(declare-fun m!1259747 () Bool)

(assert (=> b!1375906 m!1259747))

(declare-fun m!1259749 () Bool)

(assert (=> b!1375906 m!1259749))

(declare-fun m!1259751 () Bool)

(assert (=> b!1375906 m!1259751))

(declare-fun m!1259753 () Bool)

(assert (=> b!1375906 m!1259753))

(declare-fun m!1259755 () Bool)

(assert (=> b!1375906 m!1259755))

(declare-fun m!1259757 () Bool)

(assert (=> b!1375906 m!1259757))

(declare-fun m!1259759 () Bool)

(assert (=> b!1375906 m!1259759))

(declare-fun m!1259761 () Bool)

(assert (=> b!1375906 m!1259761))

(declare-fun m!1259763 () Bool)

(assert (=> b!1375906 m!1259763))

(declare-fun m!1259765 () Bool)

(assert (=> b!1375908 m!1259765))

(declare-fun m!1259767 () Bool)

(assert (=> start!116780 m!1259767))

(declare-fun m!1259769 () Bool)

(assert (=> b!1375909 m!1259769))

(declare-fun m!1259771 () Bool)

(assert (=> b!1375909 m!1259771))

(push 1)

(assert (not start!116780))

(assert (not b!1375907))

(assert (not b!1375906))

(assert (not b!1375909))

(assert (not b!1375908))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

