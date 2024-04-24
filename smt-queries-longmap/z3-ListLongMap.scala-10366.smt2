; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122198 () Bool)

(assert start!122198)

(declare-fun b!1417281 () Bool)

(declare-fun e!802248 () Bool)

(declare-fun e!802250 () Bool)

(assert (=> b!1417281 (= e!802248 e!802250)))

(declare-fun res!952644 () Bool)

(assert (=> b!1417281 (=> res!952644 e!802250)))

(declare-datatypes ((SeekEntryResult!10946 0))(
  ( (MissingZero!10946 (index!46176 (_ BitVec 32))) (Found!10946 (index!46177 (_ BitVec 32))) (Intermediate!10946 (undefined!11758 Bool) (index!46178 (_ BitVec 32)) (x!127932 (_ BitVec 32))) (Undefined!10946) (MissingVacant!10946 (index!46179 (_ BitVec 32))) )
))
(declare-fun lt!625095 () SeekEntryResult!10946)

(declare-fun lt!625096 () SeekEntryResult!10946)

(get-info :version)

(assert (=> b!1417281 (= res!952644 (or (= lt!625095 lt!625096) (not ((_ is Intermediate!10946) lt!625096))))))

(declare-fun lt!625100 () (_ BitVec 64))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96806 0))(
  ( (array!96807 (arr!46732 (Array (_ BitVec 32) (_ BitVec 64))) (size!47283 (_ BitVec 32))) )
))
(declare-fun lt!625091 () array!96806)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96806 (_ BitVec 32)) SeekEntryResult!10946)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417281 (= lt!625096 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!625100 mask!2840) lt!625100 lt!625091 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun a!2901 () array!96806)

(assert (=> b!1417281 (= lt!625100 (select (store (arr!46732 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1417281 (= lt!625091 (array!96807 (store (arr!46732 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47283 a!2901)))))

(declare-fun b!1417282 () Bool)

(declare-fun e!802247 () Bool)

(assert (=> b!1417282 (= e!802247 true)))

(declare-fun lt!625092 () SeekEntryResult!10946)

(declare-fun lt!625098 () SeekEntryResult!10946)

(assert (=> b!1417282 (= lt!625092 lt!625098)))

(declare-fun lt!625093 () (_ BitVec 32))

(declare-datatypes ((Unit!47893 0))(
  ( (Unit!47894) )
))
(declare-fun lt!625099 () Unit!47893)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!96806 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47893)

(assert (=> b!1417282 (= lt!625099 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!625093 (x!127932 lt!625095) (index!46178 lt!625095) (x!127932 lt!625096) (index!46178 lt!625096) mask!2840))))

(declare-fun b!1417283 () Bool)

(declare-fun res!952648 () Bool)

(declare-fun e!802246 () Bool)

(assert (=> b!1417283 (=> (not res!952648) (not e!802246))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417283 (= res!952648 (validKeyInArray!0 (select (arr!46732 a!2901) j!112)))))

(declare-fun b!1417284 () Bool)

(declare-fun res!952645 () Bool)

(assert (=> b!1417284 (=> (not res!952645) (not e!802246))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96806 (_ BitVec 32)) Bool)

(assert (=> b!1417284 (= res!952645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1417285 () Bool)

(declare-fun res!952647 () Bool)

(assert (=> b!1417285 (=> (not res!952647) (not e!802246))))

(assert (=> b!1417285 (= res!952647 (and (= (size!47283 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47283 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47283 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1417286 () Bool)

(assert (=> b!1417286 (= e!802250 e!802247)))

(declare-fun res!952640 () Bool)

(assert (=> b!1417286 (=> res!952640 e!802247)))

(assert (=> b!1417286 (= res!952640 (or (bvslt (x!127932 lt!625095) #b00000000000000000000000000000000) (bvsgt (x!127932 lt!625095) #b01111111111111111111111111111110) (bvslt (x!127932 lt!625096) #b00000000000000000000000000000000) (bvsgt (x!127932 lt!625096) #b01111111111111111111111111111110) (bvslt lt!625093 #b00000000000000000000000000000000) (bvsge lt!625093 (size!47283 a!2901)) (bvslt (index!46178 lt!625095) #b00000000000000000000000000000000) (bvsge (index!46178 lt!625095) (size!47283 a!2901)) (bvslt (index!46178 lt!625096) #b00000000000000000000000000000000) (bvsge (index!46178 lt!625096) (size!47283 a!2901)) (not (= lt!625095 (Intermediate!10946 false (index!46178 lt!625095) (x!127932 lt!625095)))) (not (= lt!625096 (Intermediate!10946 false (index!46178 lt!625096) (x!127932 lt!625096))))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96806 (_ BitVec 32)) SeekEntryResult!10946)

(assert (=> b!1417286 (= lt!625098 (seekKeyOrZeroReturnVacant!0 (x!127932 lt!625096) (index!46178 lt!625096) (index!46178 lt!625096) (select (arr!46732 a!2901) j!112) lt!625091 mask!2840))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96806 (_ BitVec 32)) SeekEntryResult!10946)

(assert (=> b!1417286 (= lt!625098 (seekEntryOrOpen!0 lt!625100 lt!625091 mask!2840))))

(assert (=> b!1417286 (and (not (undefined!11758 lt!625096)) (= (index!46178 lt!625096) i!1037) (bvslt (x!127932 lt!625096) (x!127932 lt!625095)) (= (select (store (arr!46732 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46178 lt!625096)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!625094 () Unit!47893)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96806 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47893)

(assert (=> b!1417286 (= lt!625094 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!625093 (x!127932 lt!625095) (index!46178 lt!625095) (x!127932 lt!625096) (index!46178 lt!625096) (undefined!11758 lt!625096) mask!2840))))

(declare-fun b!1417287 () Bool)

(declare-fun res!952639 () Bool)

(assert (=> b!1417287 (=> res!952639 e!802247)))

(assert (=> b!1417287 (= res!952639 (not (= lt!625096 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!625093 lt!625100 lt!625091 mask!2840))))))

(declare-fun b!1417288 () Bool)

(declare-fun res!952641 () Bool)

(assert (=> b!1417288 (=> (not res!952641) (not e!802246))))

(declare-datatypes ((List!33238 0))(
  ( (Nil!33235) (Cons!33234 (h!34529 (_ BitVec 64)) (t!47924 List!33238)) )
))
(declare-fun arrayNoDuplicates!0 (array!96806 (_ BitVec 32) List!33238) Bool)

(assert (=> b!1417288 (= res!952641 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33235))))

(declare-fun b!1417289 () Bool)

(declare-fun res!952643 () Bool)

(assert (=> b!1417289 (=> (not res!952643) (not e!802246))))

(assert (=> b!1417289 (= res!952643 (validKeyInArray!0 (select (arr!46732 a!2901) i!1037)))))

(declare-fun b!1417290 () Bool)

(assert (=> b!1417290 (= e!802246 (not e!802248))))

(declare-fun res!952642 () Bool)

(assert (=> b!1417290 (=> res!952642 e!802248)))

(assert (=> b!1417290 (= res!952642 (or (not ((_ is Intermediate!10946) lt!625095)) (undefined!11758 lt!625095)))))

(assert (=> b!1417290 (= lt!625092 (Found!10946 j!112))))

(assert (=> b!1417290 (= lt!625092 (seekEntryOrOpen!0 (select (arr!46732 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1417290 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!625097 () Unit!47893)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96806 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47893)

(assert (=> b!1417290 (= lt!625097 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1417290 (= lt!625095 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!625093 (select (arr!46732 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1417290 (= lt!625093 (toIndex!0 (select (arr!46732 a!2901) j!112) mask!2840))))

(declare-fun res!952646 () Bool)

(assert (=> start!122198 (=> (not res!952646) (not e!802246))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122198 (= res!952646 (validMask!0 mask!2840))))

(assert (=> start!122198 e!802246))

(assert (=> start!122198 true))

(declare-fun array_inv!36013 (array!96806) Bool)

(assert (=> start!122198 (array_inv!36013 a!2901)))

(assert (= (and start!122198 res!952646) b!1417285))

(assert (= (and b!1417285 res!952647) b!1417289))

(assert (= (and b!1417289 res!952643) b!1417283))

(assert (= (and b!1417283 res!952648) b!1417284))

(assert (= (and b!1417284 res!952645) b!1417288))

(assert (= (and b!1417288 res!952641) b!1417290))

(assert (= (and b!1417290 (not res!952642)) b!1417281))

(assert (= (and b!1417281 (not res!952644)) b!1417286))

(assert (= (and b!1417286 (not res!952640)) b!1417287))

(assert (= (and b!1417287 (not res!952639)) b!1417282))

(declare-fun m!1308079 () Bool)

(assert (=> b!1417286 m!1308079))

(declare-fun m!1308081 () Bool)

(assert (=> b!1417286 m!1308081))

(declare-fun m!1308083 () Bool)

(assert (=> b!1417286 m!1308083))

(assert (=> b!1417286 m!1308079))

(declare-fun m!1308085 () Bool)

(assert (=> b!1417286 m!1308085))

(declare-fun m!1308087 () Bool)

(assert (=> b!1417286 m!1308087))

(declare-fun m!1308089 () Bool)

(assert (=> b!1417286 m!1308089))

(declare-fun m!1308091 () Bool)

(assert (=> b!1417288 m!1308091))

(declare-fun m!1308093 () Bool)

(assert (=> b!1417281 m!1308093))

(assert (=> b!1417281 m!1308093))

(declare-fun m!1308095 () Bool)

(assert (=> b!1417281 m!1308095))

(assert (=> b!1417281 m!1308089))

(declare-fun m!1308097 () Bool)

(assert (=> b!1417281 m!1308097))

(declare-fun m!1308099 () Bool)

(assert (=> b!1417287 m!1308099))

(assert (=> b!1417290 m!1308079))

(declare-fun m!1308101 () Bool)

(assert (=> b!1417290 m!1308101))

(assert (=> b!1417290 m!1308079))

(declare-fun m!1308103 () Bool)

(assert (=> b!1417290 m!1308103))

(assert (=> b!1417290 m!1308079))

(declare-fun m!1308105 () Bool)

(assert (=> b!1417290 m!1308105))

(assert (=> b!1417290 m!1308079))

(declare-fun m!1308107 () Bool)

(assert (=> b!1417290 m!1308107))

(declare-fun m!1308109 () Bool)

(assert (=> b!1417290 m!1308109))

(declare-fun m!1308111 () Bool)

(assert (=> b!1417282 m!1308111))

(declare-fun m!1308113 () Bool)

(assert (=> start!122198 m!1308113))

(declare-fun m!1308115 () Bool)

(assert (=> start!122198 m!1308115))

(declare-fun m!1308117 () Bool)

(assert (=> b!1417289 m!1308117))

(assert (=> b!1417289 m!1308117))

(declare-fun m!1308119 () Bool)

(assert (=> b!1417289 m!1308119))

(declare-fun m!1308121 () Bool)

(assert (=> b!1417284 m!1308121))

(assert (=> b!1417283 m!1308079))

(assert (=> b!1417283 m!1308079))

(declare-fun m!1308123 () Bool)

(assert (=> b!1417283 m!1308123))

(check-sat (not b!1417286) (not b!1417289) (not b!1417288) (not b!1417282) (not b!1417290) (not b!1417283) (not b!1417287) (not b!1417284) (not start!122198) (not b!1417281))
(check-sat)
