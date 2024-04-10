; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116664 () Bool)

(assert start!116664)

(declare-fun b!1375173 () Bool)

(declare-fun e!779029 () Bool)

(assert (=> b!1375173 (= e!779029 true)))

(declare-fun lt!604187 () (_ BitVec 32))

(declare-datatypes ((array!93333 0))(
  ( (array!93334 (arr!45070 (Array (_ BitVec 32) (_ BitVec 64))) (size!45620 (_ BitVec 32))) )
))
(declare-fun lt!604192 () array!93333)

(declare-fun a!4142 () array!93333)

(declare-fun lt!604194 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93333 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375173 (= (bvadd lt!604194 lt!604187) (arrayCountValidKeys!0 lt!604192 #b00000000000000000000000000000000 (size!45620 a!4142)))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((Unit!45529 0))(
  ( (Unit!45530) )
))
(declare-fun lt!604195 () Unit!45529)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93333 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45529)

(assert (=> b!1375173 (= lt!604195 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!604192 #b00000000000000000000000000000000 (size!45620 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1375175 () Bool)

(declare-fun res!918241 () Bool)

(declare-fun e!779028 () Bool)

(assert (=> b!1375175 (=> (not res!918241) (not e!779028))))

(assert (=> b!1375175 (= res!918241 (bvslt (size!45620 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1375176 () Bool)

(declare-fun res!918237 () Bool)

(assert (=> b!1375176 (=> (not res!918237) (not e!779028))))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375176 (= res!918237 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1375177 () Bool)

(declare-fun res!918239 () Bool)

(assert (=> b!1375177 (=> (not res!918239) (not e!779028))))

(assert (=> b!1375177 (= res!918239 (validKeyInArray!0 (select (arr!45070 a!4142) i!1457)))))

(declare-fun res!918238 () Bool)

(assert (=> start!116664 (=> (not res!918238) (not e!779028))))

(assert (=> start!116664 (= res!918238 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45620 a!4142))))))

(assert (=> start!116664 e!779028))

(assert (=> start!116664 true))

(declare-fun array_inv!34098 (array!93333) Bool)

(assert (=> start!116664 (array_inv!34098 a!4142)))

(declare-fun b!1375174 () Bool)

(assert (=> b!1375174 (= e!779028 (not e!779029))))

(declare-fun res!918240 () Bool)

(assert (=> b!1375174 (=> res!918240 e!779029)))

(assert (=> b!1375174 (= res!918240 (or (bvslt (size!45620 a!4142) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000)))))

(declare-fun lt!604189 () (_ BitVec 32))

(declare-fun lt!604193 () (_ BitVec 32))

(assert (=> b!1375174 (= (bvadd lt!604189 lt!604193) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45620 a!4142)))))

(declare-fun lt!604191 () Unit!45529)

(assert (=> b!1375174 (= lt!604191 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45620 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375174 (= lt!604187 lt!604193)))

(assert (=> b!1375174 (= lt!604193 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45620 a!4142)))))

(assert (=> b!1375174 (= lt!604187 (arrayCountValidKeys!0 lt!604192 (bvadd #b00000000000000000000000000000001 i!1457) (size!45620 a!4142)))))

(declare-fun lt!604190 () Unit!45529)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93333 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45529)

(assert (=> b!1375174 (= lt!604190 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375174 (= lt!604194 (bvsub lt!604189 #b00000000000000000000000000000001))))

(assert (=> b!1375174 (= lt!604194 (arrayCountValidKeys!0 lt!604192 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375174 (= lt!604189 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375174 (= lt!604192 (array!93334 (store (arr!45070 a!4142) i!1457 k!2959) (size!45620 a!4142)))))

(declare-fun lt!604188 () Unit!45529)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93333 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45529)

(assert (=> b!1375174 (= lt!604188 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(assert (= (and start!116664 res!918238) b!1375177))

(assert (= (and b!1375177 res!918239) b!1375176))

(assert (= (and b!1375176 res!918237) b!1375175))

(assert (= (and b!1375175 res!918241) b!1375174))

(assert (= (and b!1375174 (not res!918240)) b!1375173))

(declare-fun m!1258927 () Bool)

(assert (=> start!116664 m!1258927))

(declare-fun m!1258929 () Bool)

(assert (=> b!1375177 m!1258929))

(assert (=> b!1375177 m!1258929))

(declare-fun m!1258931 () Bool)

(assert (=> b!1375177 m!1258931))

(declare-fun m!1258933 () Bool)

(assert (=> b!1375176 m!1258933))

(declare-fun m!1258935 () Bool)

(assert (=> b!1375174 m!1258935))

(declare-fun m!1258937 () Bool)

(assert (=> b!1375174 m!1258937))

(declare-fun m!1258939 () Bool)

(assert (=> b!1375174 m!1258939))

(declare-fun m!1258941 () Bool)

(assert (=> b!1375174 m!1258941))

(declare-fun m!1258943 () Bool)

(assert (=> b!1375174 m!1258943))

(declare-fun m!1258945 () Bool)

(assert (=> b!1375174 m!1258945))

(declare-fun m!1258947 () Bool)

(assert (=> b!1375174 m!1258947))

(declare-fun m!1258949 () Bool)

(assert (=> b!1375174 m!1258949))

(declare-fun m!1258951 () Bool)

(assert (=> b!1375174 m!1258951))

(declare-fun m!1258953 () Bool)

(assert (=> b!1375173 m!1258953))

(declare-fun m!1258955 () Bool)

(assert (=> b!1375173 m!1258955))

(push 1)

