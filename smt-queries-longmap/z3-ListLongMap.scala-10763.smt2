; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125898 () Bool)

(assert start!125898)

(declare-fun res!1001213 () Bool)

(declare-fun e!827066 () Bool)

(assert (=> start!125898 (=> (not res!1001213) (not e!827066))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125898 (= res!1001213 (validMask!0 mask!2687))))

(assert (=> start!125898 e!827066))

(assert (=> start!125898 true))

(declare-datatypes ((array!99175 0))(
  ( (array!99176 (arr!47871 (Array (_ BitVec 32) (_ BitVec 64))) (size!48421 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99175)

(declare-fun array_inv!36899 (array!99175) Bool)

(assert (=> start!125898 (array_inv!36899 a!2862)))

(declare-fun b!1473943 () Bool)

(declare-fun res!1001215 () Bool)

(assert (=> b!1473943 (=> (not res!1001215) (not e!827066))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1473943 (= res!1001215 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48421 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48421 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48421 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1473944 () Bool)

(declare-fun res!1001211 () Bool)

(assert (=> b!1473944 (=> (not res!1001211) (not e!827066))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1473944 (= res!1001211 (validKeyInArray!0 (select (arr!47871 a!2862) j!93)))))

(declare-fun b!1473945 () Bool)

(declare-fun e!827059 () Bool)

(assert (=> b!1473945 (= e!827059 (or (= (select (arr!47871 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47871 a!2862) intermediateBeforeIndex!19) (select (arr!47871 a!2862) j!93))))))

(declare-fun b!1473946 () Bool)

(declare-fun res!1001217 () Bool)

(assert (=> b!1473946 (=> (not res!1001217) (not e!827066))))

(declare-datatypes ((List!34372 0))(
  ( (Nil!34369) (Cons!34368 (h!35727 (_ BitVec 64)) (t!49066 List!34372)) )
))
(declare-fun arrayNoDuplicates!0 (array!99175 (_ BitVec 32) List!34372) Bool)

(assert (=> b!1473946 (= res!1001217 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34369))))

(declare-fun b!1473947 () Bool)

(declare-fun res!1001208 () Bool)

(assert (=> b!1473947 (=> (not res!1001208) (not e!827066))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1473947 (= res!1001208 (validKeyInArray!0 (select (arr!47871 a!2862) i!1006)))))

(declare-fun b!1473948 () Bool)

(declare-fun res!1001205 () Bool)

(declare-fun e!827062 () Bool)

(assert (=> b!1473948 (=> (not res!1001205) (not e!827062))))

(declare-datatypes ((SeekEntryResult!12111 0))(
  ( (MissingZero!12111 (index!50836 (_ BitVec 32))) (Found!12111 (index!50837 (_ BitVec 32))) (Intermediate!12111 (undefined!12923 Bool) (index!50838 (_ BitVec 32)) (x!132419 (_ BitVec 32))) (Undefined!12111) (MissingVacant!12111 (index!50839 (_ BitVec 32))) )
))
(declare-fun lt!644098 () SeekEntryResult!12111)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99175 (_ BitVec 32)) SeekEntryResult!12111)

(assert (=> b!1473948 (= res!1001205 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47871 a!2862) j!93) a!2862 mask!2687) lt!644098))))

(declare-fun e!827064 () Bool)

(declare-fun lt!644099 () array!99175)

(declare-fun b!1473949 () Bool)

(declare-fun lt!644095 () SeekEntryResult!12111)

(declare-fun lt!644097 () (_ BitVec 64))

(assert (=> b!1473949 (= e!827064 (= lt!644095 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644097 lt!644099 mask!2687)))))

(declare-fun b!1473950 () Bool)

(declare-fun res!1001216 () Bool)

(assert (=> b!1473950 (=> (not res!1001216) (not e!827066))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99175 (_ BitVec 32)) Bool)

(assert (=> b!1473950 (= res!1001216 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1473951 () Bool)

(declare-fun e!827060 () Bool)

(assert (=> b!1473951 (= e!827062 e!827060)))

(declare-fun res!1001218 () Bool)

(assert (=> b!1473951 (=> (not res!1001218) (not e!827060))))

(assert (=> b!1473951 (= res!1001218 (= lt!644095 (Intermediate!12111 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1473951 (= lt!644095 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644097 mask!2687) lt!644097 lt!644099 mask!2687))))

(assert (=> b!1473951 (= lt!644097 (select (store (arr!47871 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1473952 () Bool)

(declare-fun e!827063 () Bool)

(assert (=> b!1473952 (= e!827063 e!827062)))

(declare-fun res!1001207 () Bool)

(assert (=> b!1473952 (=> (not res!1001207) (not e!827062))))

(assert (=> b!1473952 (= res!1001207 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47871 a!2862) j!93) mask!2687) (select (arr!47871 a!2862) j!93) a!2862 mask!2687) lt!644098))))

(assert (=> b!1473952 (= lt!644098 (Intermediate!12111 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1473953 () Bool)

(assert (=> b!1473953 (= e!827066 e!827063)))

(declare-fun res!1001206 () Bool)

(assert (=> b!1473953 (=> (not res!1001206) (not e!827063))))

(assert (=> b!1473953 (= res!1001206 (= (select (store (arr!47871 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1473953 (= lt!644099 (array!99176 (store (arr!47871 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48421 a!2862)))))

(declare-fun b!1473954 () Bool)

(declare-fun res!1001204 () Bool)

(assert (=> b!1473954 (=> (not res!1001204) (not e!827059))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99175 (_ BitVec 32)) SeekEntryResult!12111)

(assert (=> b!1473954 (= res!1001204 (= (seekEntryOrOpen!0 (select (arr!47871 a!2862) j!93) a!2862 mask!2687) (Found!12111 j!93)))))

(declare-fun b!1473955 () Bool)

(declare-fun res!1001210 () Bool)

(assert (=> b!1473955 (=> (not res!1001210) (not e!827066))))

(assert (=> b!1473955 (= res!1001210 (and (= (size!48421 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48421 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48421 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1473956 () Bool)

(declare-fun e!827065 () Bool)

(assert (=> b!1473956 (= e!827060 (not e!827065))))

(declare-fun res!1001212 () Bool)

(assert (=> b!1473956 (=> res!1001212 e!827065)))

(assert (=> b!1473956 (= res!1001212 (or (not (= (select (arr!47871 a!2862) index!646) (select (store (arr!47871 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47871 a!2862) index!646) (select (arr!47871 a!2862) j!93)))))))

(assert (=> b!1473956 e!827059))

(declare-fun res!1001203 () Bool)

(assert (=> b!1473956 (=> (not res!1001203) (not e!827059))))

(assert (=> b!1473956 (= res!1001203 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49562 0))(
  ( (Unit!49563) )
))
(declare-fun lt!644096 () Unit!49562)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99175 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49562)

(assert (=> b!1473956 (= lt!644096 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1473957 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99175 (_ BitVec 32)) SeekEntryResult!12111)

(assert (=> b!1473957 (= e!827064 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644097 lt!644099 mask!2687) (seekEntryOrOpen!0 lt!644097 lt!644099 mask!2687)))))

(declare-fun b!1473958 () Bool)

(declare-fun res!1001214 () Bool)

(assert (=> b!1473958 (=> (not res!1001214) (not e!827060))))

(assert (=> b!1473958 (= res!1001214 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1473959 () Bool)

(assert (=> b!1473959 (= e!827065 true)))

(declare-fun lt!644100 () SeekEntryResult!12111)

(assert (=> b!1473959 (= lt!644100 (seekEntryOrOpen!0 lt!644097 lt!644099 mask!2687))))

(declare-fun b!1473960 () Bool)

(declare-fun res!1001209 () Bool)

(assert (=> b!1473960 (=> (not res!1001209) (not e!827060))))

(assert (=> b!1473960 (= res!1001209 e!827064)))

(declare-fun c!135885 () Bool)

(assert (=> b!1473960 (= c!135885 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!125898 res!1001213) b!1473955))

(assert (= (and b!1473955 res!1001210) b!1473947))

(assert (= (and b!1473947 res!1001208) b!1473944))

(assert (= (and b!1473944 res!1001211) b!1473950))

(assert (= (and b!1473950 res!1001216) b!1473946))

(assert (= (and b!1473946 res!1001217) b!1473943))

(assert (= (and b!1473943 res!1001215) b!1473953))

(assert (= (and b!1473953 res!1001206) b!1473952))

(assert (= (and b!1473952 res!1001207) b!1473948))

(assert (= (and b!1473948 res!1001205) b!1473951))

(assert (= (and b!1473951 res!1001218) b!1473960))

(assert (= (and b!1473960 c!135885) b!1473949))

(assert (= (and b!1473960 (not c!135885)) b!1473957))

(assert (= (and b!1473960 res!1001209) b!1473958))

(assert (= (and b!1473958 res!1001214) b!1473956))

(assert (= (and b!1473956 res!1001203) b!1473954))

(assert (= (and b!1473954 res!1001204) b!1473945))

(assert (= (and b!1473956 (not res!1001212)) b!1473959))

(declare-fun m!1360431 () Bool)

(assert (=> b!1473956 m!1360431))

(declare-fun m!1360433 () Bool)

(assert (=> b!1473956 m!1360433))

(declare-fun m!1360435 () Bool)

(assert (=> b!1473956 m!1360435))

(declare-fun m!1360437 () Bool)

(assert (=> b!1473956 m!1360437))

(declare-fun m!1360439 () Bool)

(assert (=> b!1473956 m!1360439))

(declare-fun m!1360441 () Bool)

(assert (=> b!1473956 m!1360441))

(declare-fun m!1360443 () Bool)

(assert (=> b!1473950 m!1360443))

(declare-fun m!1360445 () Bool)

(assert (=> start!125898 m!1360445))

(declare-fun m!1360447 () Bool)

(assert (=> start!125898 m!1360447))

(assert (=> b!1473952 m!1360441))

(assert (=> b!1473952 m!1360441))

(declare-fun m!1360449 () Bool)

(assert (=> b!1473952 m!1360449))

(assert (=> b!1473952 m!1360449))

(assert (=> b!1473952 m!1360441))

(declare-fun m!1360451 () Bool)

(assert (=> b!1473952 m!1360451))

(declare-fun m!1360453 () Bool)

(assert (=> b!1473947 m!1360453))

(assert (=> b!1473947 m!1360453))

(declare-fun m!1360455 () Bool)

(assert (=> b!1473947 m!1360455))

(declare-fun m!1360457 () Bool)

(assert (=> b!1473951 m!1360457))

(assert (=> b!1473951 m!1360457))

(declare-fun m!1360459 () Bool)

(assert (=> b!1473951 m!1360459))

(assert (=> b!1473951 m!1360433))

(declare-fun m!1360461 () Bool)

(assert (=> b!1473951 m!1360461))

(assert (=> b!1473953 m!1360433))

(declare-fun m!1360463 () Bool)

(assert (=> b!1473953 m!1360463))

(assert (=> b!1473954 m!1360441))

(assert (=> b!1473954 m!1360441))

(declare-fun m!1360465 () Bool)

(assert (=> b!1473954 m!1360465))

(assert (=> b!1473948 m!1360441))

(assert (=> b!1473948 m!1360441))

(declare-fun m!1360467 () Bool)

(assert (=> b!1473948 m!1360467))

(assert (=> b!1473944 m!1360441))

(assert (=> b!1473944 m!1360441))

(declare-fun m!1360469 () Bool)

(assert (=> b!1473944 m!1360469))

(declare-fun m!1360471 () Bool)

(assert (=> b!1473957 m!1360471))

(declare-fun m!1360473 () Bool)

(assert (=> b!1473957 m!1360473))

(declare-fun m!1360475 () Bool)

(assert (=> b!1473946 m!1360475))

(declare-fun m!1360477 () Bool)

(assert (=> b!1473949 m!1360477))

(assert (=> b!1473959 m!1360473))

(declare-fun m!1360479 () Bool)

(assert (=> b!1473945 m!1360479))

(assert (=> b!1473945 m!1360441))

(check-sat (not b!1473952) (not b!1473944) (not b!1473951) (not b!1473954) (not b!1473956) (not b!1473946) (not b!1473949) (not b!1473950) (not start!125898) (not b!1473957) (not b!1473947) (not b!1473959) (not b!1473948))
(check-sat)
