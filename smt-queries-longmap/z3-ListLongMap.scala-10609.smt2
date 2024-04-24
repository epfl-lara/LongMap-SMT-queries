; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125010 () Bool)

(assert start!125010)

(declare-fun b!1449127 () Bool)

(declare-fun res!979921 () Bool)

(declare-fun e!816215 () Bool)

(assert (=> b!1449127 (=> (not res!979921) (not e!816215))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1449127 (= res!979921 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1449128 () Bool)

(declare-fun e!816217 () Bool)

(declare-fun e!816221 () Bool)

(assert (=> b!1449128 (= e!816217 e!816221)))

(declare-fun res!979919 () Bool)

(assert (=> b!1449128 (=> res!979919 e!816221)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((array!98353 0))(
  ( (array!98354 (arr!47461 (Array (_ BitVec 32) (_ BitVec 64))) (size!48012 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98353)

(assert (=> b!1449128 (= res!979919 (or (and (= (select (arr!47461 a!2862) index!646) (select (store (arr!47461 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47461 a!2862) index!646) (select (arr!47461 a!2862) j!93))) (not (= (select (arr!47461 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1449129 () Bool)

(declare-fun e!816222 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1449129 (= e!816222 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1449130 () Bool)

(declare-fun res!979924 () Bool)

(declare-fun e!816218 () Bool)

(assert (=> b!1449130 (=> (not res!979924) (not e!816218))))

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1449130 (= res!979924 (and (= (size!48012 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48012 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48012 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1449131 () Bool)

(declare-fun e!816213 () Bool)

(declare-fun e!816219 () Bool)

(assert (=> b!1449131 (= e!816213 e!816219)))

(declare-fun res!979918 () Bool)

(assert (=> b!1449131 (=> (not res!979918) (not e!816219))))

(declare-datatypes ((SeekEntryResult!11610 0))(
  ( (MissingZero!11610 (index!48832 (_ BitVec 32))) (Found!11610 (index!48833 (_ BitVec 32))) (Intermediate!11610 (undefined!12422 Bool) (index!48834 (_ BitVec 32)) (x!130683 (_ BitVec 32))) (Undefined!11610) (MissingVacant!11610 (index!48835 (_ BitVec 32))) )
))
(declare-fun lt!635776 () SeekEntryResult!11610)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98353 (_ BitVec 32)) SeekEntryResult!11610)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1449131 (= res!979918 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47461 a!2862) j!93) mask!2687) (select (arr!47461 a!2862) j!93) a!2862 mask!2687) lt!635776))))

(assert (=> b!1449131 (= lt!635776 (Intermediate!11610 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1449133 () Bool)

(declare-fun e!816216 () Bool)

(assert (=> b!1449133 (= e!816216 true)))

(declare-fun lt!635774 () SeekEntryResult!11610)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98353 (_ BitVec 32)) SeekEntryResult!11610)

(assert (=> b!1449133 (= lt!635774 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47461 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1449134 () Bool)

(declare-fun res!979930 () Bool)

(assert (=> b!1449134 (=> (not res!979930) (not e!816218))))

(declare-datatypes ((List!33949 0))(
  ( (Nil!33946) (Cons!33945 (h!35306 (_ BitVec 64)) (t!48635 List!33949)) )
))
(declare-fun arrayNoDuplicates!0 (array!98353 (_ BitVec 32) List!33949) Bool)

(assert (=> b!1449134 (= res!979930 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33946))))

(declare-fun b!1449135 () Bool)

(declare-fun res!979917 () Bool)

(assert (=> b!1449135 (=> (not res!979917) (not e!816218))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98353 (_ BitVec 32)) Bool)

(assert (=> b!1449135 (= res!979917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1449136 () Bool)

(assert (=> b!1449136 (= e!816215 (not e!816216))))

(declare-fun res!979929 () Bool)

(assert (=> b!1449136 (=> res!979929 e!816216)))

(assert (=> b!1449136 (= res!979929 (or (and (= (select (arr!47461 a!2862) index!646) (select (store (arr!47461 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47461 a!2862) index!646) (select (arr!47461 a!2862) j!93))) (not (= (select (arr!47461 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47461 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1449136 e!816217))

(declare-fun res!979916 () Bool)

(assert (=> b!1449136 (=> (not res!979916) (not e!816217))))

(declare-fun lt!635778 () SeekEntryResult!11610)

(assert (=> b!1449136 (= res!979916 (and (= lt!635778 (Found!11610 j!93)) (or (= (select (arr!47461 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47461 a!2862) intermediateBeforeIndex!19) (select (arr!47461 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98353 (_ BitVec 32)) SeekEntryResult!11610)

(assert (=> b!1449136 (= lt!635778 (seekEntryOrOpen!0 (select (arr!47461 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1449136 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48749 0))(
  ( (Unit!48750) )
))
(declare-fun lt!635777 () Unit!48749)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98353 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48749)

(assert (=> b!1449136 (= lt!635777 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1449137 () Bool)

(declare-fun res!979931 () Bool)

(assert (=> b!1449137 (=> (not res!979931) (not e!816218))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1449137 (= res!979931 (validKeyInArray!0 (select (arr!47461 a!2862) i!1006)))))

(declare-fun b!1449138 () Bool)

(assert (=> b!1449138 (= e!816218 e!816213)))

(declare-fun res!979928 () Bool)

(assert (=> b!1449138 (=> (not res!979928) (not e!816213))))

(assert (=> b!1449138 (= res!979928 (= (select (store (arr!47461 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!635779 () array!98353)

(assert (=> b!1449138 (= lt!635779 (array!98354 (store (arr!47461 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48012 a!2862)))))

(declare-fun lt!635775 () (_ BitVec 64))

(declare-fun e!816214 () Bool)

(declare-fun lt!635773 () SeekEntryResult!11610)

(declare-fun b!1449139 () Bool)

(assert (=> b!1449139 (= e!816214 (= lt!635773 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635775 lt!635779 mask!2687)))))

(declare-fun b!1449140 () Bool)

(assert (=> b!1449140 (= e!816214 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635775 lt!635779 mask!2687) (seekEntryOrOpen!0 lt!635775 lt!635779 mask!2687)))))

(declare-fun b!1449141 () Bool)

(declare-fun res!979915 () Bool)

(assert (=> b!1449141 (=> (not res!979915) (not e!816218))))

(assert (=> b!1449141 (= res!979915 (validKeyInArray!0 (select (arr!47461 a!2862) j!93)))))

(declare-fun b!1449142 () Bool)

(declare-fun res!979927 () Bool)

(assert (=> b!1449142 (=> (not res!979927) (not e!816215))))

(assert (=> b!1449142 (= res!979927 e!816214)))

(declare-fun c!134125 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1449142 (= c!134125 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1449143 () Bool)

(declare-fun res!979923 () Bool)

(assert (=> b!1449143 (=> (not res!979923) (not e!816218))))

(assert (=> b!1449143 (= res!979923 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48012 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48012 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48012 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1449144 () Bool)

(assert (=> b!1449144 (= e!816221 e!816222)))

(declare-fun res!979922 () Bool)

(assert (=> b!1449144 (=> (not res!979922) (not e!816222))))

(assert (=> b!1449144 (= res!979922 (= lt!635778 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47461 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1449145 () Bool)

(declare-fun res!979926 () Bool)

(assert (=> b!1449145 (=> (not res!979926) (not e!816219))))

(assert (=> b!1449145 (= res!979926 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47461 a!2862) j!93) a!2862 mask!2687) lt!635776))))

(declare-fun b!1449132 () Bool)

(assert (=> b!1449132 (= e!816219 e!816215)))

(declare-fun res!979920 () Bool)

(assert (=> b!1449132 (=> (not res!979920) (not e!816215))))

(assert (=> b!1449132 (= res!979920 (= lt!635773 (Intermediate!11610 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1449132 (= lt!635773 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635775 mask!2687) lt!635775 lt!635779 mask!2687))))

(assert (=> b!1449132 (= lt!635775 (select (store (arr!47461 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!979925 () Bool)

(assert (=> start!125010 (=> (not res!979925) (not e!816218))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125010 (= res!979925 (validMask!0 mask!2687))))

(assert (=> start!125010 e!816218))

(assert (=> start!125010 true))

(declare-fun array_inv!36742 (array!98353) Bool)

(assert (=> start!125010 (array_inv!36742 a!2862)))

(assert (= (and start!125010 res!979925) b!1449130))

(assert (= (and b!1449130 res!979924) b!1449137))

(assert (= (and b!1449137 res!979931) b!1449141))

(assert (= (and b!1449141 res!979915) b!1449135))

(assert (= (and b!1449135 res!979917) b!1449134))

(assert (= (and b!1449134 res!979930) b!1449143))

(assert (= (and b!1449143 res!979923) b!1449138))

(assert (= (and b!1449138 res!979928) b!1449131))

(assert (= (and b!1449131 res!979918) b!1449145))

(assert (= (and b!1449145 res!979926) b!1449132))

(assert (= (and b!1449132 res!979920) b!1449142))

(assert (= (and b!1449142 c!134125) b!1449139))

(assert (= (and b!1449142 (not c!134125)) b!1449140))

(assert (= (and b!1449142 res!979927) b!1449127))

(assert (= (and b!1449127 res!979921) b!1449136))

(assert (= (and b!1449136 res!979916) b!1449128))

(assert (= (and b!1449128 (not res!979919)) b!1449144))

(assert (= (and b!1449144 res!979922) b!1449129))

(assert (= (and b!1449136 (not res!979929)) b!1449133))

(declare-fun m!1338037 () Bool)

(assert (=> b!1449128 m!1338037))

(declare-fun m!1338039 () Bool)

(assert (=> b!1449128 m!1338039))

(declare-fun m!1338041 () Bool)

(assert (=> b!1449128 m!1338041))

(declare-fun m!1338043 () Bool)

(assert (=> b!1449128 m!1338043))

(declare-fun m!1338045 () Bool)

(assert (=> b!1449137 m!1338045))

(assert (=> b!1449137 m!1338045))

(declare-fun m!1338047 () Bool)

(assert (=> b!1449137 m!1338047))

(assert (=> b!1449144 m!1338043))

(assert (=> b!1449144 m!1338043))

(declare-fun m!1338049 () Bool)

(assert (=> b!1449144 m!1338049))

(assert (=> b!1449131 m!1338043))

(assert (=> b!1449131 m!1338043))

(declare-fun m!1338051 () Bool)

(assert (=> b!1449131 m!1338051))

(assert (=> b!1449131 m!1338051))

(assert (=> b!1449131 m!1338043))

(declare-fun m!1338053 () Bool)

(assert (=> b!1449131 m!1338053))

(declare-fun m!1338055 () Bool)

(assert (=> b!1449134 m!1338055))

(assert (=> b!1449145 m!1338043))

(assert (=> b!1449145 m!1338043))

(declare-fun m!1338057 () Bool)

(assert (=> b!1449145 m!1338057))

(assert (=> b!1449133 m!1338043))

(assert (=> b!1449133 m!1338043))

(declare-fun m!1338059 () Bool)

(assert (=> b!1449133 m!1338059))

(declare-fun m!1338061 () Bool)

(assert (=> start!125010 m!1338061))

(declare-fun m!1338063 () Bool)

(assert (=> start!125010 m!1338063))

(assert (=> b!1449141 m!1338043))

(assert (=> b!1449141 m!1338043))

(declare-fun m!1338065 () Bool)

(assert (=> b!1449141 m!1338065))

(declare-fun m!1338067 () Bool)

(assert (=> b!1449136 m!1338067))

(assert (=> b!1449136 m!1338039))

(declare-fun m!1338069 () Bool)

(assert (=> b!1449136 m!1338069))

(assert (=> b!1449136 m!1338041))

(assert (=> b!1449136 m!1338037))

(assert (=> b!1449136 m!1338043))

(declare-fun m!1338071 () Bool)

(assert (=> b!1449136 m!1338071))

(declare-fun m!1338073 () Bool)

(assert (=> b!1449136 m!1338073))

(assert (=> b!1449136 m!1338043))

(declare-fun m!1338075 () Bool)

(assert (=> b!1449135 m!1338075))

(declare-fun m!1338077 () Bool)

(assert (=> b!1449132 m!1338077))

(assert (=> b!1449132 m!1338077))

(declare-fun m!1338079 () Bool)

(assert (=> b!1449132 m!1338079))

(assert (=> b!1449132 m!1338039))

(declare-fun m!1338081 () Bool)

(assert (=> b!1449132 m!1338081))

(declare-fun m!1338083 () Bool)

(assert (=> b!1449140 m!1338083))

(declare-fun m!1338085 () Bool)

(assert (=> b!1449140 m!1338085))

(declare-fun m!1338087 () Bool)

(assert (=> b!1449139 m!1338087))

(assert (=> b!1449138 m!1338039))

(declare-fun m!1338089 () Bool)

(assert (=> b!1449138 m!1338089))

(check-sat (not b!1449137) (not b!1449132) (not b!1449133) (not b!1449144) (not b!1449141) (not b!1449145) (not start!125010) (not b!1449136) (not b!1449135) (not b!1449131) (not b!1449134) (not b!1449139) (not b!1449140))
(check-sat)
