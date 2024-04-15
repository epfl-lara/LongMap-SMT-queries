; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123848 () Bool)

(assert start!123848)

(declare-fun b!1435137 () Bool)

(declare-fun res!968252 () Bool)

(declare-fun e!809977 () Bool)

(assert (=> b!1435137 (=> (not res!968252) (not e!809977))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-datatypes ((array!97557 0))(
  ( (array!97558 (arr!47080 (Array (_ BitVec 32) (_ BitVec 64))) (size!47632 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97557)

(assert (=> b!1435137 (= res!968252 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47632 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47632 a!2831))))))

(declare-fun b!1435138 () Bool)

(declare-fun res!968256 () Bool)

(declare-fun e!809979 () Bool)

(assert (=> b!1435138 (=> (not res!968256) (not e!809979))))

(declare-datatypes ((SeekEntryResult!11386 0))(
  ( (MissingZero!11386 (index!47936 (_ BitVec 32))) (Found!11386 (index!47937 (_ BitVec 32))) (Intermediate!11386 (undefined!12198 Bool) (index!47938 (_ BitVec 32)) (x!129595 (_ BitVec 32))) (Undefined!11386) (MissingVacant!11386 (index!47939 (_ BitVec 32))) )
))
(declare-fun lt!631604 () SeekEntryResult!11386)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97557 (_ BitVec 32)) SeekEntryResult!11386)

(assert (=> b!1435138 (= res!968256 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47080 a!2831) j!81) a!2831 mask!2608) lt!631604))))

(declare-fun b!1435139 () Bool)

(declare-fun res!968250 () Bool)

(assert (=> b!1435139 (=> (not res!968250) (not e!809977))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97557 (_ BitVec 32)) Bool)

(assert (=> b!1435139 (= res!968250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1435140 () Bool)

(declare-fun res!968260 () Bool)

(assert (=> b!1435140 (=> (not res!968260) (not e!809979))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1435140 (= res!968260 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1435141 () Bool)

(declare-fun res!968262 () Bool)

(assert (=> b!1435141 (=> (not res!968262) (not e!809977))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1435141 (= res!968262 (and (= (size!47632 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47632 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47632 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1435142 () Bool)

(declare-fun res!968257 () Bool)

(assert (=> b!1435142 (=> (not res!968257) (not e!809977))))

(declare-datatypes ((List!33668 0))(
  ( (Nil!33665) (Cons!33664 (h!34999 (_ BitVec 64)) (t!48354 List!33668)) )
))
(declare-fun arrayNoDuplicates!0 (array!97557 (_ BitVec 32) List!33668) Bool)

(assert (=> b!1435142 (= res!968257 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33665))))

(declare-fun b!1435143 () Bool)

(declare-fun e!809980 () Bool)

(assert (=> b!1435143 (= e!809980 true)))

(declare-fun lt!631602 () (_ BitVec 32))

(declare-fun lt!631607 () array!97557)

(declare-fun lt!631605 () SeekEntryResult!11386)

(declare-fun lt!631603 () (_ BitVec 64))

(assert (=> b!1435143 (= lt!631605 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631602 lt!631603 lt!631607 mask!2608))))

(declare-fun b!1435145 () Bool)

(declare-fun res!968251 () Bool)

(assert (=> b!1435145 (=> (not res!968251) (not e!809977))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1435145 (= res!968251 (validKeyInArray!0 (select (arr!47080 a!2831) j!81)))))

(declare-fun b!1435146 () Bool)

(declare-fun e!809978 () Bool)

(assert (=> b!1435146 (= e!809977 e!809978)))

(declare-fun res!968258 () Bool)

(assert (=> b!1435146 (=> (not res!968258) (not e!809978))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1435146 (= res!968258 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47080 a!2831) j!81) mask!2608) (select (arr!47080 a!2831) j!81) a!2831 mask!2608) lt!631604))))

(assert (=> b!1435146 (= lt!631604 (Intermediate!11386 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1435147 () Bool)

(declare-fun e!809976 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97557 (_ BitVec 32)) SeekEntryResult!11386)

(assert (=> b!1435147 (= e!809976 (= (seekEntryOrOpen!0 (select (arr!47080 a!2831) j!81) a!2831 mask!2608) (Found!11386 j!81)))))

(declare-fun b!1435148 () Bool)

(declare-fun res!968248 () Bool)

(assert (=> b!1435148 (=> (not res!968248) (not e!809977))))

(assert (=> b!1435148 (= res!968248 (validKeyInArray!0 (select (arr!47080 a!2831) i!982)))))

(declare-fun b!1435149 () Bool)

(declare-fun res!968254 () Bool)

(assert (=> b!1435149 (=> res!968254 e!809980)))

(assert (=> b!1435149 (= res!968254 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631602 (select (arr!47080 a!2831) j!81) a!2831 mask!2608) lt!631604)))))

(declare-fun b!1435150 () Bool)

(declare-fun e!809981 () Bool)

(assert (=> b!1435150 (= e!809979 (not e!809981))))

(declare-fun res!968261 () Bool)

(assert (=> b!1435150 (=> res!968261 e!809981)))

(assert (=> b!1435150 (= res!968261 (or (= (select (arr!47080 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47080 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47080 a!2831) index!585) (select (arr!47080 a!2831) j!81)) (= (select (store (arr!47080 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1435150 e!809976))

(declare-fun res!968249 () Bool)

(assert (=> b!1435150 (=> (not res!968249) (not e!809976))))

(assert (=> b!1435150 (= res!968249 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48357 0))(
  ( (Unit!48358) )
))
(declare-fun lt!631608 () Unit!48357)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97557 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48357)

(assert (=> b!1435150 (= lt!631608 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1435151 () Bool)

(assert (=> b!1435151 (= e!809978 e!809979)))

(declare-fun res!968255 () Bool)

(assert (=> b!1435151 (=> (not res!968255) (not e!809979))))

(declare-fun lt!631606 () SeekEntryResult!11386)

(assert (=> b!1435151 (= res!968255 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631603 mask!2608) lt!631603 lt!631607 mask!2608) lt!631606))))

(assert (=> b!1435151 (= lt!631606 (Intermediate!11386 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1435151 (= lt!631603 (select (store (arr!47080 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1435151 (= lt!631607 (array!97558 (store (arr!47080 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47632 a!2831)))))

(declare-fun b!1435152 () Bool)

(declare-fun res!968263 () Bool)

(assert (=> b!1435152 (=> (not res!968263) (not e!809979))))

(assert (=> b!1435152 (= res!968263 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631603 lt!631607 mask!2608) lt!631606))))

(declare-fun b!1435144 () Bool)

(assert (=> b!1435144 (= e!809981 e!809980)))

(declare-fun res!968253 () Bool)

(assert (=> b!1435144 (=> res!968253 e!809980)))

(assert (=> b!1435144 (= res!968253 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!631602 #b00000000000000000000000000000000) (bvsge lt!631602 (size!47632 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1435144 (= lt!631602 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun res!968259 () Bool)

(assert (=> start!123848 (=> (not res!968259) (not e!809977))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123848 (= res!968259 (validMask!0 mask!2608))))

(assert (=> start!123848 e!809977))

(assert (=> start!123848 true))

(declare-fun array_inv!36313 (array!97557) Bool)

(assert (=> start!123848 (array_inv!36313 a!2831)))

(assert (= (and start!123848 res!968259) b!1435141))

(assert (= (and b!1435141 res!968262) b!1435148))

(assert (= (and b!1435148 res!968248) b!1435145))

(assert (= (and b!1435145 res!968251) b!1435139))

(assert (= (and b!1435139 res!968250) b!1435142))

(assert (= (and b!1435142 res!968257) b!1435137))

(assert (= (and b!1435137 res!968252) b!1435146))

(assert (= (and b!1435146 res!968258) b!1435151))

(assert (= (and b!1435151 res!968255) b!1435138))

(assert (= (and b!1435138 res!968256) b!1435152))

(assert (= (and b!1435152 res!968263) b!1435140))

(assert (= (and b!1435140 res!968260) b!1435150))

(assert (= (and b!1435150 res!968249) b!1435147))

(assert (= (and b!1435150 (not res!968261)) b!1435144))

(assert (= (and b!1435144 (not res!968253)) b!1435149))

(assert (= (and b!1435149 (not res!968254)) b!1435143))

(declare-fun m!1324013 () Bool)

(assert (=> b!1435142 m!1324013))

(declare-fun m!1324015 () Bool)

(assert (=> b!1435150 m!1324015))

(declare-fun m!1324017 () Bool)

(assert (=> b!1435150 m!1324017))

(declare-fun m!1324019 () Bool)

(assert (=> b!1435150 m!1324019))

(declare-fun m!1324021 () Bool)

(assert (=> b!1435150 m!1324021))

(declare-fun m!1324023 () Bool)

(assert (=> b!1435150 m!1324023))

(declare-fun m!1324025 () Bool)

(assert (=> b!1435150 m!1324025))

(declare-fun m!1324027 () Bool)

(assert (=> b!1435143 m!1324027))

(declare-fun m!1324029 () Bool)

(assert (=> b!1435144 m!1324029))

(declare-fun m!1324031 () Bool)

(assert (=> b!1435139 m!1324031))

(assert (=> b!1435149 m!1324023))

(assert (=> b!1435149 m!1324023))

(declare-fun m!1324033 () Bool)

(assert (=> b!1435149 m!1324033))

(assert (=> b!1435146 m!1324023))

(assert (=> b!1435146 m!1324023))

(declare-fun m!1324035 () Bool)

(assert (=> b!1435146 m!1324035))

(assert (=> b!1435146 m!1324035))

(assert (=> b!1435146 m!1324023))

(declare-fun m!1324037 () Bool)

(assert (=> b!1435146 m!1324037))

(declare-fun m!1324039 () Bool)

(assert (=> b!1435151 m!1324039))

(assert (=> b!1435151 m!1324039))

(declare-fun m!1324041 () Bool)

(assert (=> b!1435151 m!1324041))

(assert (=> b!1435151 m!1324015))

(declare-fun m!1324043 () Bool)

(assert (=> b!1435151 m!1324043))

(declare-fun m!1324045 () Bool)

(assert (=> b!1435152 m!1324045))

(declare-fun m!1324047 () Bool)

(assert (=> start!123848 m!1324047))

(declare-fun m!1324049 () Bool)

(assert (=> start!123848 m!1324049))

(assert (=> b!1435138 m!1324023))

(assert (=> b!1435138 m!1324023))

(declare-fun m!1324051 () Bool)

(assert (=> b!1435138 m!1324051))

(assert (=> b!1435147 m!1324023))

(assert (=> b!1435147 m!1324023))

(declare-fun m!1324053 () Bool)

(assert (=> b!1435147 m!1324053))

(declare-fun m!1324055 () Bool)

(assert (=> b!1435148 m!1324055))

(assert (=> b!1435148 m!1324055))

(declare-fun m!1324057 () Bool)

(assert (=> b!1435148 m!1324057))

(assert (=> b!1435145 m!1324023))

(assert (=> b!1435145 m!1324023))

(declare-fun m!1324059 () Bool)

(assert (=> b!1435145 m!1324059))

(check-sat (not b!1435139) (not b!1435152) (not b!1435143) (not b!1435147) (not b!1435142) (not b!1435145) (not b!1435148) (not b!1435146) (not b!1435144) (not b!1435151) (not b!1435138) (not start!123848) (not b!1435150) (not b!1435149))
(check-sat)
