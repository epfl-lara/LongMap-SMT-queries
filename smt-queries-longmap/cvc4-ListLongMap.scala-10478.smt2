; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123250 () Bool)

(assert start!123250)

(declare-fun b!1429137 () Bool)

(declare-fun res!963772 () Bool)

(declare-fun e!807023 () Bool)

(assert (=> b!1429137 (=> (not res!963772) (not e!807023))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1429137 (= res!963772 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1429138 () Bool)

(declare-fun res!963770 () Bool)

(assert (=> b!1429138 (=> (not res!963770) (not e!807023))))

(declare-fun lt!629250 () (_ BitVec 64))

(declare-datatypes ((array!97411 0))(
  ( (array!97412 (arr!47017 (Array (_ BitVec 32) (_ BitVec 64))) (size!47567 (_ BitVec 32))) )
))
(declare-fun lt!629251 () array!97411)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11296 0))(
  ( (MissingZero!11296 (index!47576 (_ BitVec 32))) (Found!11296 (index!47577 (_ BitVec 32))) (Intermediate!11296 (undefined!12108 Bool) (index!47578 (_ BitVec 32)) (x!129210 (_ BitVec 32))) (Undefined!11296) (MissingVacant!11296 (index!47579 (_ BitVec 32))) )
))
(declare-fun lt!629249 () SeekEntryResult!11296)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97411 (_ BitVec 32)) SeekEntryResult!11296)

(assert (=> b!1429138 (= res!963770 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629250 lt!629251 mask!2608) lt!629249))))

(declare-fun b!1429139 () Bool)

(declare-fun res!963776 () Bool)

(declare-fun e!807024 () Bool)

(assert (=> b!1429139 (=> (not res!963776) (not e!807024))))

(declare-fun a!2831 () array!97411)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1429139 (= res!963776 (validKeyInArray!0 (select (arr!47017 a!2831) j!81)))))

(declare-fun e!807022 () Bool)

(declare-fun b!1429140 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97411 (_ BitVec 32)) SeekEntryResult!11296)

(assert (=> b!1429140 (= e!807022 (= (seekEntryOrOpen!0 (select (arr!47017 a!2831) j!81) a!2831 mask!2608) (Found!11296 j!81)))))

(declare-fun b!1429141 () Bool)

(declare-fun e!807025 () Bool)

(assert (=> b!1429141 (= e!807024 e!807025)))

(declare-fun res!963768 () Bool)

(assert (=> b!1429141 (=> (not res!963768) (not e!807025))))

(declare-fun lt!629253 () SeekEntryResult!11296)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429141 (= res!963768 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47017 a!2831) j!81) mask!2608) (select (arr!47017 a!2831) j!81) a!2831 mask!2608) lt!629253))))

(assert (=> b!1429141 (= lt!629253 (Intermediate!11296 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1429142 () Bool)

(declare-fun res!963766 () Bool)

(assert (=> b!1429142 (=> (not res!963766) (not e!807024))))

(assert (=> b!1429142 (= res!963766 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47567 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47567 a!2831))))))

(declare-fun b!1429143 () Bool)

(assert (=> b!1429143 (= e!807025 e!807023)))

(declare-fun res!963767 () Bool)

(assert (=> b!1429143 (=> (not res!963767) (not e!807023))))

(assert (=> b!1429143 (= res!963767 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629250 mask!2608) lt!629250 lt!629251 mask!2608) lt!629249))))

(assert (=> b!1429143 (= lt!629249 (Intermediate!11296 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1429143 (= lt!629250 (select (store (arr!47017 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1429143 (= lt!629251 (array!97412 (store (arr!47017 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47567 a!2831)))))

(declare-fun b!1429144 () Bool)

(declare-fun res!963775 () Bool)

(assert (=> b!1429144 (=> (not res!963775) (not e!807024))))

(declare-datatypes ((List!33527 0))(
  ( (Nil!33524) (Cons!33523 (h!34837 (_ BitVec 64)) (t!48221 List!33527)) )
))
(declare-fun arrayNoDuplicates!0 (array!97411 (_ BitVec 32) List!33527) Bool)

(assert (=> b!1429144 (= res!963775 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33524))))

(declare-fun res!963777 () Bool)

(assert (=> start!123250 (=> (not res!963777) (not e!807024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123250 (= res!963777 (validMask!0 mask!2608))))

(assert (=> start!123250 e!807024))

(assert (=> start!123250 true))

(declare-fun array_inv!36045 (array!97411) Bool)

(assert (=> start!123250 (array_inv!36045 a!2831)))

(declare-fun b!1429145 () Bool)

(declare-fun res!963778 () Bool)

(assert (=> b!1429145 (=> (not res!963778) (not e!807024))))

(assert (=> b!1429145 (= res!963778 (and (= (size!47567 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47567 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47567 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1429146 () Bool)

(declare-fun res!963774 () Bool)

(assert (=> b!1429146 (=> (not res!963774) (not e!807024))))

(assert (=> b!1429146 (= res!963774 (validKeyInArray!0 (select (arr!47017 a!2831) i!982)))))

(declare-fun b!1429147 () Bool)

(assert (=> b!1429147 (= e!807023 (not true))))

(assert (=> b!1429147 e!807022))

(declare-fun res!963771 () Bool)

(assert (=> b!1429147 (=> (not res!963771) (not e!807022))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97411 (_ BitVec 32)) Bool)

(assert (=> b!1429147 (= res!963771 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48338 0))(
  ( (Unit!48339) )
))
(declare-fun lt!629252 () Unit!48338)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97411 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48338)

(assert (=> b!1429147 (= lt!629252 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1429148 () Bool)

(declare-fun res!963769 () Bool)

(assert (=> b!1429148 (=> (not res!963769) (not e!807023))))

(assert (=> b!1429148 (= res!963769 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47017 a!2831) j!81) a!2831 mask!2608) lt!629253))))

(declare-fun b!1429149 () Bool)

(declare-fun res!963773 () Bool)

(assert (=> b!1429149 (=> (not res!963773) (not e!807024))))

(assert (=> b!1429149 (= res!963773 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!123250 res!963777) b!1429145))

(assert (= (and b!1429145 res!963778) b!1429146))

(assert (= (and b!1429146 res!963774) b!1429139))

(assert (= (and b!1429139 res!963776) b!1429149))

(assert (= (and b!1429149 res!963773) b!1429144))

(assert (= (and b!1429144 res!963775) b!1429142))

(assert (= (and b!1429142 res!963766) b!1429141))

(assert (= (and b!1429141 res!963768) b!1429143))

(assert (= (and b!1429143 res!963767) b!1429148))

(assert (= (and b!1429148 res!963769) b!1429138))

(assert (= (and b!1429138 res!963770) b!1429137))

(assert (= (and b!1429137 res!963772) b!1429147))

(assert (= (and b!1429147 res!963771) b!1429140))

(declare-fun m!1319245 () Bool)

(assert (=> b!1429147 m!1319245))

(declare-fun m!1319247 () Bool)

(assert (=> b!1429147 m!1319247))

(declare-fun m!1319249 () Bool)

(assert (=> start!123250 m!1319249))

(declare-fun m!1319251 () Bool)

(assert (=> start!123250 m!1319251))

(declare-fun m!1319253 () Bool)

(assert (=> b!1429138 m!1319253))

(declare-fun m!1319255 () Bool)

(assert (=> b!1429140 m!1319255))

(assert (=> b!1429140 m!1319255))

(declare-fun m!1319257 () Bool)

(assert (=> b!1429140 m!1319257))

(declare-fun m!1319259 () Bool)

(assert (=> b!1429143 m!1319259))

(assert (=> b!1429143 m!1319259))

(declare-fun m!1319261 () Bool)

(assert (=> b!1429143 m!1319261))

(declare-fun m!1319263 () Bool)

(assert (=> b!1429143 m!1319263))

(declare-fun m!1319265 () Bool)

(assert (=> b!1429143 m!1319265))

(assert (=> b!1429141 m!1319255))

(assert (=> b!1429141 m!1319255))

(declare-fun m!1319267 () Bool)

(assert (=> b!1429141 m!1319267))

(assert (=> b!1429141 m!1319267))

(assert (=> b!1429141 m!1319255))

(declare-fun m!1319269 () Bool)

(assert (=> b!1429141 m!1319269))

(declare-fun m!1319271 () Bool)

(assert (=> b!1429146 m!1319271))

(assert (=> b!1429146 m!1319271))

(declare-fun m!1319273 () Bool)

(assert (=> b!1429146 m!1319273))

(assert (=> b!1429139 m!1319255))

(assert (=> b!1429139 m!1319255))

(declare-fun m!1319275 () Bool)

(assert (=> b!1429139 m!1319275))

(declare-fun m!1319277 () Bool)

(assert (=> b!1429149 m!1319277))

(declare-fun m!1319279 () Bool)

(assert (=> b!1429144 m!1319279))

(assert (=> b!1429148 m!1319255))

(assert (=> b!1429148 m!1319255))

(declare-fun m!1319281 () Bool)

(assert (=> b!1429148 m!1319281))

(push 1)

