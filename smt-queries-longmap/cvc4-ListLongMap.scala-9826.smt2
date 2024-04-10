; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116646 () Bool)

(assert start!116646)

(declare-fun b!1375057 () Bool)

(declare-fun res!918121 () Bool)

(declare-fun e!778965 () Bool)

(assert (=> b!1375057 (=> (not res!918121) (not e!778965))))

(declare-datatypes ((array!93315 0))(
  ( (array!93316 (arr!45061 (Array (_ BitVec 32) (_ BitVec 64))) (size!45611 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93315)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375057 (= res!918121 (validKeyInArray!0 (select (arr!45061 a!4142) i!1457)))))

(declare-fun b!1375060 () Bool)

(assert (=> b!1375060 (= e!778965 (not (and (bvsge (size!45611 a!4142) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000))))))

(declare-fun lt!603987 () array!93315)

(declare-fun arrayCountValidKeys!0 (array!93315 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375060 (= (arrayCountValidKeys!0 lt!603987 (bvadd #b00000000000000000000000000000001 i!1457) (size!45611 a!4142)) (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45611 a!4142)))))

(declare-datatypes ((Unit!45511 0))(
  ( (Unit!45512) )
))
(declare-fun lt!603988 () Unit!45511)

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93315 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45511)

(assert (=> b!1375060 (= lt!603988 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375060 (= (arrayCountValidKeys!0 lt!603987 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(assert (=> b!1375060 (= lt!603987 (array!93316 (store (arr!45061 a!4142) i!1457 k!2959) (size!45611 a!4142)))))

(declare-fun lt!603986 () Unit!45511)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93315 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45511)

(assert (=> b!1375060 (= lt!603986 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1375059 () Bool)

(declare-fun res!918122 () Bool)

(assert (=> b!1375059 (=> (not res!918122) (not e!778965))))

(assert (=> b!1375059 (= res!918122 (bvslt (size!45611 a!4142) #b01111111111111111111111111111111))))

(declare-fun res!918124 () Bool)

(assert (=> start!116646 (=> (not res!918124) (not e!778965))))

(assert (=> start!116646 (= res!918124 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45611 a!4142))))))

(assert (=> start!116646 e!778965))

(assert (=> start!116646 true))

(declare-fun array_inv!34089 (array!93315) Bool)

(assert (=> start!116646 (array_inv!34089 a!4142)))

(declare-fun b!1375058 () Bool)

(declare-fun res!918123 () Bool)

(assert (=> b!1375058 (=> (not res!918123) (not e!778965))))

(assert (=> b!1375058 (= res!918123 (not (validKeyInArray!0 k!2959)))))

(assert (= (and start!116646 res!918124) b!1375057))

(assert (= (and b!1375057 res!918121) b!1375058))

(assert (= (and b!1375058 res!918123) b!1375059))

(assert (= (and b!1375059 res!918122) b!1375060))

(declare-fun m!1258689 () Bool)

(assert (=> b!1375057 m!1258689))

(assert (=> b!1375057 m!1258689))

(declare-fun m!1258691 () Bool)

(assert (=> b!1375057 m!1258691))

(declare-fun m!1258693 () Bool)

(assert (=> b!1375060 m!1258693))

(declare-fun m!1258695 () Bool)

(assert (=> b!1375060 m!1258695))

(declare-fun m!1258697 () Bool)

(assert (=> b!1375060 m!1258697))

(declare-fun m!1258699 () Bool)

(assert (=> b!1375060 m!1258699))

(declare-fun m!1258701 () Bool)

(assert (=> b!1375060 m!1258701))

(declare-fun m!1258703 () Bool)

(assert (=> b!1375060 m!1258703))

(declare-fun m!1258705 () Bool)

(assert (=> b!1375060 m!1258705))

(declare-fun m!1258707 () Bool)

(assert (=> start!116646 m!1258707))

(declare-fun m!1258709 () Bool)

(assert (=> b!1375058 m!1258709))

(push 1)

