; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120478 () Bool)

(assert start!120478)

(declare-fun b!1402833 () Bool)

(declare-fun e!794337 () Bool)

(assert (=> b!1402833 (= e!794337 true)))

(declare-datatypes ((SeekEntryResult!10611 0))(
  ( (MissingZero!10611 (index!44821 (_ BitVec 32))) (Found!10611 (index!44822 (_ BitVec 32))) (Intermediate!10611 (undefined!11423 Bool) (index!44823 (_ BitVec 32)) (x!126438 (_ BitVec 32))) (Undefined!10611) (MissingVacant!10611 (index!44824 (_ BitVec 32))) )
))
(declare-fun lt!618117 () SeekEntryResult!10611)

(declare-fun lt!618119 () SeekEntryResult!10611)

(assert (=> b!1402833 (= lt!618117 lt!618119)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95887 0))(
  ( (array!95888 (arr!46294 (Array (_ BitVec 32) (_ BitVec 64))) (size!46844 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95887)

(declare-datatypes ((Unit!47226 0))(
  ( (Unit!47227) )
))
(declare-fun lt!618122 () Unit!47226)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!618114 () (_ BitVec 32))

(declare-fun lt!618118 () SeekEntryResult!10611)

(declare-fun lt!618115 () SeekEntryResult!10611)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95887 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47226)

(assert (=> b!1402833 (= lt!618122 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!618114 (x!126438 lt!618115) (index!44823 lt!618115) (x!126438 lt!618118) (index!44823 lt!618118) mask!2840))))

(declare-fun b!1402834 () Bool)

(declare-fun res!941346 () Bool)

(declare-fun e!794339 () Bool)

(assert (=> b!1402834 (=> (not res!941346) (not e!794339))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95887 (_ BitVec 32)) Bool)

(assert (=> b!1402834 (= res!941346 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402835 () Bool)

(declare-fun res!941351 () Bool)

(assert (=> b!1402835 (=> (not res!941351) (not e!794339))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402835 (= res!941351 (validKeyInArray!0 (select (arr!46294 a!2901) i!1037)))))

(declare-fun b!1402836 () Bool)

(declare-fun res!941353 () Bool)

(assert (=> b!1402836 (=> (not res!941353) (not e!794339))))

(assert (=> b!1402836 (= res!941353 (and (= (size!46844 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46844 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46844 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402837 () Bool)

(declare-fun e!794338 () Bool)

(assert (=> b!1402837 (= e!794339 (not e!794338))))

(declare-fun res!941352 () Bool)

(assert (=> b!1402837 (=> res!941352 e!794338)))

(assert (=> b!1402837 (= res!941352 (or (not (is-Intermediate!10611 lt!618115)) (undefined!11423 lt!618115)))))

(assert (=> b!1402837 (= lt!618117 (Found!10611 j!112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95887 (_ BitVec 32)) SeekEntryResult!10611)

(assert (=> b!1402837 (= lt!618117 (seekEntryOrOpen!0 (select (arr!46294 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402837 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!618121 () Unit!47226)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95887 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47226)

(assert (=> b!1402837 (= lt!618121 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95887 (_ BitVec 32)) SeekEntryResult!10611)

(assert (=> b!1402837 (= lt!618115 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!618114 (select (arr!46294 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402837 (= lt!618114 (toIndex!0 (select (arr!46294 a!2901) j!112) mask!2840))))

(declare-fun res!941345 () Bool)

(assert (=> start!120478 (=> (not res!941345) (not e!794339))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120478 (= res!941345 (validMask!0 mask!2840))))

(assert (=> start!120478 e!794339))

(assert (=> start!120478 true))

(declare-fun array_inv!35322 (array!95887) Bool)

(assert (=> start!120478 (array_inv!35322 a!2901)))

(declare-fun b!1402838 () Bool)

(declare-fun res!941350 () Bool)

(assert (=> b!1402838 (=> (not res!941350) (not e!794339))))

(declare-datatypes ((List!32813 0))(
  ( (Nil!32810) (Cons!32809 (h!34057 (_ BitVec 64)) (t!47507 List!32813)) )
))
(declare-fun arrayNoDuplicates!0 (array!95887 (_ BitVec 32) List!32813) Bool)

(assert (=> b!1402838 (= res!941350 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32810))))

(declare-fun b!1402839 () Bool)

(declare-fun e!794335 () Bool)

(assert (=> b!1402839 (= e!794335 e!794337)))

(declare-fun res!941349 () Bool)

(assert (=> b!1402839 (=> res!941349 e!794337)))

(assert (=> b!1402839 (= res!941349 (or (bvslt (x!126438 lt!618115) #b00000000000000000000000000000000) (bvsgt (x!126438 lt!618115) #b01111111111111111111111111111110) (bvslt (x!126438 lt!618118) #b00000000000000000000000000000000) (bvsgt (x!126438 lt!618118) #b01111111111111111111111111111110) (bvslt lt!618114 #b00000000000000000000000000000000) (bvsge lt!618114 (size!46844 a!2901)) (bvslt (index!44823 lt!618115) #b00000000000000000000000000000000) (bvsge (index!44823 lt!618115) (size!46844 a!2901)) (bvslt (index!44823 lt!618118) #b00000000000000000000000000000000) (bvsge (index!44823 lt!618118) (size!46844 a!2901)) (not (= lt!618115 (Intermediate!10611 false (index!44823 lt!618115) (x!126438 lt!618115)))) (not (= lt!618118 (Intermediate!10611 false (index!44823 lt!618118) (x!126438 lt!618118))))))))

(declare-fun lt!618116 () array!95887)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95887 (_ BitVec 32)) SeekEntryResult!10611)

(assert (=> b!1402839 (= lt!618119 (seekKeyOrZeroReturnVacant!0 (x!126438 lt!618118) (index!44823 lt!618118) (index!44823 lt!618118) (select (arr!46294 a!2901) j!112) lt!618116 mask!2840))))

(declare-fun lt!618120 () (_ BitVec 64))

(assert (=> b!1402839 (= lt!618119 (seekEntryOrOpen!0 lt!618120 lt!618116 mask!2840))))

(assert (=> b!1402839 (and (not (undefined!11423 lt!618118)) (= (index!44823 lt!618118) i!1037) (bvslt (x!126438 lt!618118) (x!126438 lt!618115)) (= (select (store (arr!46294 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44823 lt!618118)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!618123 () Unit!47226)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95887 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47226)

(assert (=> b!1402839 (= lt!618123 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!618114 (x!126438 lt!618115) (index!44823 lt!618115) (x!126438 lt!618118) (index!44823 lt!618118) (undefined!11423 lt!618118) mask!2840))))

(declare-fun b!1402840 () Bool)

(declare-fun res!941347 () Bool)

(assert (=> b!1402840 (=> res!941347 e!794337)))

(assert (=> b!1402840 (= res!941347 (not (= lt!618118 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!618114 lt!618120 lt!618116 mask!2840))))))

(declare-fun b!1402841 () Bool)

(declare-fun res!941344 () Bool)

(assert (=> b!1402841 (=> (not res!941344) (not e!794339))))

(assert (=> b!1402841 (= res!941344 (validKeyInArray!0 (select (arr!46294 a!2901) j!112)))))

(declare-fun b!1402842 () Bool)

(assert (=> b!1402842 (= e!794338 e!794335)))

(declare-fun res!941348 () Bool)

(assert (=> b!1402842 (=> res!941348 e!794335)))

(assert (=> b!1402842 (= res!941348 (or (= lt!618115 lt!618118) (not (is-Intermediate!10611 lt!618118))))))

(assert (=> b!1402842 (= lt!618118 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!618120 mask!2840) lt!618120 lt!618116 mask!2840))))

(assert (=> b!1402842 (= lt!618120 (select (store (arr!46294 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402842 (= lt!618116 (array!95888 (store (arr!46294 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46844 a!2901)))))

(assert (= (and start!120478 res!941345) b!1402836))

(assert (= (and b!1402836 res!941353) b!1402835))

(assert (= (and b!1402835 res!941351) b!1402841))

(assert (= (and b!1402841 res!941344) b!1402834))

(assert (= (and b!1402834 res!941346) b!1402838))

(assert (= (and b!1402838 res!941350) b!1402837))

(assert (= (and b!1402837 (not res!941352)) b!1402842))

(assert (= (and b!1402842 (not res!941348)) b!1402839))

(assert (= (and b!1402839 (not res!941349)) b!1402840))

(assert (= (and b!1402840 (not res!941347)) b!1402833))

(declare-fun m!1291205 () Bool)

(assert (=> b!1402841 m!1291205))

(assert (=> b!1402841 m!1291205))

(declare-fun m!1291207 () Bool)

(assert (=> b!1402841 m!1291207))

(declare-fun m!1291209 () Bool)

(assert (=> b!1402842 m!1291209))

(assert (=> b!1402842 m!1291209))

(declare-fun m!1291211 () Bool)

(assert (=> b!1402842 m!1291211))

(declare-fun m!1291213 () Bool)

(assert (=> b!1402842 m!1291213))

(declare-fun m!1291215 () Bool)

(assert (=> b!1402842 m!1291215))

(declare-fun m!1291217 () Bool)

(assert (=> b!1402835 m!1291217))

(assert (=> b!1402835 m!1291217))

(declare-fun m!1291219 () Bool)

(assert (=> b!1402835 m!1291219))

(assert (=> b!1402837 m!1291205))

(declare-fun m!1291221 () Bool)

(assert (=> b!1402837 m!1291221))

(assert (=> b!1402837 m!1291205))

(declare-fun m!1291223 () Bool)

(assert (=> b!1402837 m!1291223))

(assert (=> b!1402837 m!1291205))

(declare-fun m!1291225 () Bool)

(assert (=> b!1402837 m!1291225))

(declare-fun m!1291227 () Bool)

(assert (=> b!1402837 m!1291227))

(assert (=> b!1402837 m!1291205))

(declare-fun m!1291229 () Bool)

(assert (=> b!1402837 m!1291229))

(declare-fun m!1291231 () Bool)

(assert (=> b!1402839 m!1291231))

(assert (=> b!1402839 m!1291205))

(declare-fun m!1291233 () Bool)

(assert (=> b!1402839 m!1291233))

(declare-fun m!1291235 () Bool)

(assert (=> b!1402839 m!1291235))

(assert (=> b!1402839 m!1291205))

(declare-fun m!1291237 () Bool)

(assert (=> b!1402839 m!1291237))

(assert (=> b!1402839 m!1291213))

(declare-fun m!1291239 () Bool)

(assert (=> b!1402838 m!1291239))

(declare-fun m!1291241 () Bool)

(assert (=> b!1402834 m!1291241))

(declare-fun m!1291243 () Bool)

(assert (=> start!120478 m!1291243))

(declare-fun m!1291245 () Bool)

(assert (=> start!120478 m!1291245))

(declare-fun m!1291247 () Bool)

(assert (=> b!1402840 m!1291247))

(declare-fun m!1291249 () Bool)

(assert (=> b!1402833 m!1291249))

(push 1)

