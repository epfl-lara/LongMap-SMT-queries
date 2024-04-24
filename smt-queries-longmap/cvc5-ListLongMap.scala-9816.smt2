; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116774 () Bool)

(assert start!116774)

(declare-fun b!1375860 () Bool)

(declare-fun res!918263 () Bool)

(declare-fun e!779544 () Bool)

(assert (=> b!1375860 (=> (not res!918263) (not e!779544))))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375860 (= res!918263 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1375861 () Bool)

(declare-fun e!779543 () Bool)

(assert (=> b!1375861 (= e!779544 (not e!779543))))

(declare-fun res!918266 () Bool)

(assert (=> b!1375861 (=> res!918266 e!779543)))

(declare-datatypes ((array!93365 0))(
  ( (array!93366 (arr!45084 (Array (_ BitVec 32) (_ BitVec 64))) (size!45635 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93365)

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> b!1375861 (= res!918266 (or (bvslt (size!45635 a!4142) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000)))))

(declare-fun lt!604256 () (_ BitVec 32))

(declare-fun lt!604250 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93365 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375861 (= (bvadd lt!604256 lt!604250) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45635 a!4142)))))

(declare-datatypes ((Unit!45402 0))(
  ( (Unit!45403) )
))
(declare-fun lt!604257 () Unit!45402)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93365 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45402)

(assert (=> b!1375861 (= lt!604257 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45635 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!604249 () (_ BitVec 32))

(assert (=> b!1375861 (= lt!604249 lt!604250)))

(assert (=> b!1375861 (= lt!604250 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45635 a!4142)))))

(declare-fun lt!604255 () array!93365)

(assert (=> b!1375861 (= lt!604249 (arrayCountValidKeys!0 lt!604255 (bvadd #b00000000000000000000000000000001 i!1457) (size!45635 a!4142)))))

(declare-fun lt!604252 () Unit!45402)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93365 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45402)

(assert (=> b!1375861 (= lt!604252 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!604254 () (_ BitVec 32))

(assert (=> b!1375861 (= lt!604254 (bvsub lt!604256 #b00000000000000000000000000000001))))

(assert (=> b!1375861 (= lt!604254 (arrayCountValidKeys!0 lt!604255 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375861 (= lt!604256 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375861 (= lt!604255 (array!93366 (store (arr!45084 a!4142) i!1457 k!2959) (size!45635 a!4142)))))

(declare-fun lt!604253 () Unit!45402)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93365 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45402)

(assert (=> b!1375861 (= lt!604253 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1375862 () Bool)

(declare-fun res!918267 () Bool)

(assert (=> b!1375862 (=> (not res!918267) (not e!779544))))

(assert (=> b!1375862 (= res!918267 (bvslt (size!45635 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1375863 () Bool)

(assert (=> b!1375863 (= e!779543 true)))

(assert (=> b!1375863 (= (bvadd lt!604254 lt!604249) (arrayCountValidKeys!0 lt!604255 #b00000000000000000000000000000000 (size!45635 a!4142)))))

(declare-fun lt!604251 () Unit!45402)

(assert (=> b!1375863 (= lt!604251 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!604255 #b00000000000000000000000000000000 (size!45635 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1375864 () Bool)

(declare-fun res!918264 () Bool)

(assert (=> b!1375864 (=> (not res!918264) (not e!779544))))

(assert (=> b!1375864 (= res!918264 (validKeyInArray!0 (select (arr!45084 a!4142) i!1457)))))

(declare-fun res!918265 () Bool)

(assert (=> start!116774 (=> (not res!918265) (not e!779544))))

(assert (=> start!116774 (= res!918265 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45635 a!4142))))))

(assert (=> start!116774 e!779544))

(assert (=> start!116774 true))

(declare-fun array_inv!34365 (array!93365) Bool)

(assert (=> start!116774 (array_inv!34365 a!4142)))

(assert (= (and start!116774 res!918265) b!1375864))

(assert (= (and b!1375864 res!918264) b!1375860))

(assert (= (and b!1375860 res!918263) b!1375862))

(assert (= (and b!1375862 res!918267) b!1375861))

(assert (= (and b!1375861 (not res!918266)) b!1375863))

(declare-fun m!1259653 () Bool)

(assert (=> b!1375861 m!1259653))

(declare-fun m!1259655 () Bool)

(assert (=> b!1375861 m!1259655))

(declare-fun m!1259657 () Bool)

(assert (=> b!1375861 m!1259657))

(declare-fun m!1259659 () Bool)

(assert (=> b!1375861 m!1259659))

(declare-fun m!1259661 () Bool)

(assert (=> b!1375861 m!1259661))

(declare-fun m!1259663 () Bool)

(assert (=> b!1375861 m!1259663))

(declare-fun m!1259665 () Bool)

(assert (=> b!1375861 m!1259665))

(declare-fun m!1259667 () Bool)

(assert (=> b!1375861 m!1259667))

(declare-fun m!1259669 () Bool)

(assert (=> b!1375861 m!1259669))

(declare-fun m!1259671 () Bool)

(assert (=> b!1375864 m!1259671))

(assert (=> b!1375864 m!1259671))

(declare-fun m!1259673 () Bool)

(assert (=> b!1375864 m!1259673))

(declare-fun m!1259675 () Bool)

(assert (=> b!1375860 m!1259675))

(declare-fun m!1259677 () Bool)

(assert (=> b!1375863 m!1259677))

(declare-fun m!1259679 () Bool)

(assert (=> b!1375863 m!1259679))

(declare-fun m!1259681 () Bool)

(assert (=> start!116774 m!1259681))

(push 1)

(assert (not start!116774))

(assert (not b!1375864))

(assert (not b!1375860))

(assert (not b!1375863))

(assert (not b!1375861))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

