; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124774 () Bool)

(assert start!124774)

(declare-fun b!1447947 () Bool)

(declare-fun res!979653 () Bool)

(declare-fun e!815445 () Bool)

(assert (=> b!1447947 (=> (not res!979653) (not e!815445))))

(declare-datatypes ((array!98200 0))(
  ( (array!98201 (arr!47389 (Array (_ BitVec 32) (_ BitVec 64))) (size!47941 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98200)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1447947 (= res!979653 (validKeyInArray!0 (select (arr!47389 a!2862) i!1006)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1447948 () Bool)

(declare-fun lt!635191 () array!98200)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!635188 () (_ BitVec 64))

(declare-fun e!815444 () Bool)

(declare-datatypes ((SeekEntryResult!11666 0))(
  ( (MissingZero!11666 (index!49056 (_ BitVec 32))) (Found!11666 (index!49057 (_ BitVec 32))) (Intermediate!11666 (undefined!12478 Bool) (index!49058 (_ BitVec 32)) (x!130726 (_ BitVec 32))) (Undefined!11666) (MissingVacant!11666 (index!49059 (_ BitVec 32))) )
))
(declare-fun lt!635189 () SeekEntryResult!11666)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98200 (_ BitVec 32)) SeekEntryResult!11666)

(assert (=> b!1447948 (= e!815444 (= lt!635189 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635188 lt!635191 mask!2687)))))

(declare-fun b!1447949 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun e!815442 () Bool)

(assert (=> b!1447949 (= e!815442 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1447950 () Bool)

(declare-fun res!979650 () Bool)

(assert (=> b!1447950 (=> (not res!979650) (not e!815445))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98200 (_ BitVec 32)) Bool)

(assert (=> b!1447950 (= res!979650 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1447951 () Bool)

(declare-fun res!979641 () Bool)

(assert (=> b!1447951 (=> (not res!979641) (not e!815445))))

(declare-datatypes ((List!33968 0))(
  ( (Nil!33965) (Cons!33964 (h!35314 (_ BitVec 64)) (t!48654 List!33968)) )
))
(declare-fun arrayNoDuplicates!0 (array!98200 (_ BitVec 32) List!33968) Bool)

(assert (=> b!1447951 (= res!979641 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33965))))

(declare-fun b!1447952 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98200 (_ BitVec 32)) SeekEntryResult!11666)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98200 (_ BitVec 32)) SeekEntryResult!11666)

(assert (=> b!1447952 (= e!815444 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635188 lt!635191 mask!2687) (seekEntryOrOpen!0 lt!635188 lt!635191 mask!2687)))))

(declare-fun b!1447953 () Bool)

(declare-fun res!979655 () Bool)

(declare-fun e!815439 () Bool)

(assert (=> b!1447953 (=> (not res!979655) (not e!815439))))

(assert (=> b!1447953 (= res!979655 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1447954 () Bool)

(declare-fun res!979645 () Bool)

(assert (=> b!1447954 (=> (not res!979645) (not e!815439))))

(assert (=> b!1447954 (= res!979645 e!815444)))

(declare-fun c!133666 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1447954 (= c!133666 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1447955 () Bool)

(declare-fun res!979652 () Bool)

(assert (=> b!1447955 (=> (not res!979652) (not e!815445))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1447955 (= res!979652 (and (= (size!47941 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47941 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47941 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!979642 () Bool)

(assert (=> start!124774 (=> (not res!979642) (not e!815445))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124774 (= res!979642 (validMask!0 mask!2687))))

(assert (=> start!124774 e!815445))

(assert (=> start!124774 true))

(declare-fun array_inv!36622 (array!98200) Bool)

(assert (=> start!124774 (array_inv!36622 a!2862)))

(declare-fun b!1447956 () Bool)

(declare-fun e!815447 () Bool)

(assert (=> b!1447956 (= e!815445 e!815447)))

(declare-fun res!979646 () Bool)

(assert (=> b!1447956 (=> (not res!979646) (not e!815447))))

(assert (=> b!1447956 (= res!979646 (= (select (store (arr!47389 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1447956 (= lt!635191 (array!98201 (store (arr!47389 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47941 a!2862)))))

(declare-fun b!1447957 () Bool)

(declare-fun res!979657 () Bool)

(assert (=> b!1447957 (=> (not res!979657) (not e!815445))))

(assert (=> b!1447957 (= res!979657 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47941 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47941 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47941 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1447958 () Bool)

(declare-fun e!815446 () Bool)

(assert (=> b!1447958 (= e!815439 (not e!815446))))

(declare-fun res!979649 () Bool)

(assert (=> b!1447958 (=> res!979649 e!815446)))

(assert (=> b!1447958 (= res!979649 (or (and (= (select (arr!47389 a!2862) index!646) (select (store (arr!47389 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47389 a!2862) index!646) (select (arr!47389 a!2862) j!93))) (not (= (select (arr!47389 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47389 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!815443 () Bool)

(assert (=> b!1447958 e!815443))

(declare-fun res!979643 () Bool)

(assert (=> b!1447958 (=> (not res!979643) (not e!815443))))

(declare-fun lt!635193 () SeekEntryResult!11666)

(assert (=> b!1447958 (= res!979643 (and (= lt!635193 (Found!11666 j!93)) (or (= (select (arr!47389 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47389 a!2862) intermediateBeforeIndex!19) (select (arr!47389 a!2862) j!93)))))))

(assert (=> b!1447958 (= lt!635193 (seekEntryOrOpen!0 (select (arr!47389 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1447958 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48669 0))(
  ( (Unit!48670) )
))
(declare-fun lt!635190 () Unit!48669)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98200 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48669)

(assert (=> b!1447958 (= lt!635190 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1447959 () Bool)

(declare-fun e!815448 () Bool)

(assert (=> b!1447959 (= e!815443 e!815448)))

(declare-fun res!979648 () Bool)

(assert (=> b!1447959 (=> res!979648 e!815448)))

(assert (=> b!1447959 (= res!979648 (or (and (= (select (arr!47389 a!2862) index!646) (select (store (arr!47389 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47389 a!2862) index!646) (select (arr!47389 a!2862) j!93))) (not (= (select (arr!47389 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1447960 () Bool)

(assert (=> b!1447960 (= e!815446 true)))

(declare-fun lt!635192 () SeekEntryResult!11666)

(assert (=> b!1447960 (= lt!635192 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47389 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1447961 () Bool)

(declare-fun e!815440 () Bool)

(assert (=> b!1447961 (= e!815440 e!815439)))

(declare-fun res!979656 () Bool)

(assert (=> b!1447961 (=> (not res!979656) (not e!815439))))

(assert (=> b!1447961 (= res!979656 (= lt!635189 (Intermediate!11666 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1447961 (= lt!635189 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635188 mask!2687) lt!635188 lt!635191 mask!2687))))

(assert (=> b!1447961 (= lt!635188 (select (store (arr!47389 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1447962 () Bool)

(declare-fun res!979644 () Bool)

(assert (=> b!1447962 (=> (not res!979644) (not e!815440))))

(declare-fun lt!635187 () SeekEntryResult!11666)

(assert (=> b!1447962 (= res!979644 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47389 a!2862) j!93) a!2862 mask!2687) lt!635187))))

(declare-fun b!1447963 () Bool)

(declare-fun res!979654 () Bool)

(assert (=> b!1447963 (=> (not res!979654) (not e!815445))))

(assert (=> b!1447963 (= res!979654 (validKeyInArray!0 (select (arr!47389 a!2862) j!93)))))

(declare-fun b!1447964 () Bool)

(assert (=> b!1447964 (= e!815448 e!815442)))

(declare-fun res!979651 () Bool)

(assert (=> b!1447964 (=> (not res!979651) (not e!815442))))

(assert (=> b!1447964 (= res!979651 (= lt!635193 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47389 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1447965 () Bool)

(assert (=> b!1447965 (= e!815447 e!815440)))

(declare-fun res!979647 () Bool)

(assert (=> b!1447965 (=> (not res!979647) (not e!815440))))

(assert (=> b!1447965 (= res!979647 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47389 a!2862) j!93) mask!2687) (select (arr!47389 a!2862) j!93) a!2862 mask!2687) lt!635187))))

(assert (=> b!1447965 (= lt!635187 (Intermediate!11666 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!124774 res!979642) b!1447955))

(assert (= (and b!1447955 res!979652) b!1447947))

(assert (= (and b!1447947 res!979653) b!1447963))

(assert (= (and b!1447963 res!979654) b!1447950))

(assert (= (and b!1447950 res!979650) b!1447951))

(assert (= (and b!1447951 res!979641) b!1447957))

(assert (= (and b!1447957 res!979657) b!1447956))

(assert (= (and b!1447956 res!979646) b!1447965))

(assert (= (and b!1447965 res!979647) b!1447962))

(assert (= (and b!1447962 res!979644) b!1447961))

(assert (= (and b!1447961 res!979656) b!1447954))

(assert (= (and b!1447954 c!133666) b!1447948))

(assert (= (and b!1447954 (not c!133666)) b!1447952))

(assert (= (and b!1447954 res!979645) b!1447953))

(assert (= (and b!1447953 res!979655) b!1447958))

(assert (= (and b!1447958 res!979643) b!1447959))

(assert (= (and b!1447959 (not res!979648)) b!1447964))

(assert (= (and b!1447964 res!979651) b!1447949))

(assert (= (and b!1447958 (not res!979649)) b!1447960))

(declare-fun m!1336245 () Bool)

(assert (=> b!1447956 m!1336245))

(declare-fun m!1336247 () Bool)

(assert (=> b!1447956 m!1336247))

(declare-fun m!1336249 () Bool)

(assert (=> b!1447959 m!1336249))

(assert (=> b!1447959 m!1336245))

(declare-fun m!1336251 () Bool)

(assert (=> b!1447959 m!1336251))

(declare-fun m!1336253 () Bool)

(assert (=> b!1447959 m!1336253))

(assert (=> b!1447964 m!1336253))

(assert (=> b!1447964 m!1336253))

(declare-fun m!1336255 () Bool)

(assert (=> b!1447964 m!1336255))

(assert (=> b!1447962 m!1336253))

(assert (=> b!1447962 m!1336253))

(declare-fun m!1336257 () Bool)

(assert (=> b!1447962 m!1336257))

(declare-fun m!1336259 () Bool)

(assert (=> b!1447950 m!1336259))

(assert (=> b!1447960 m!1336253))

(assert (=> b!1447960 m!1336253))

(declare-fun m!1336261 () Bool)

(assert (=> b!1447960 m!1336261))

(assert (=> b!1447965 m!1336253))

(assert (=> b!1447965 m!1336253))

(declare-fun m!1336263 () Bool)

(assert (=> b!1447965 m!1336263))

(assert (=> b!1447965 m!1336263))

(assert (=> b!1447965 m!1336253))

(declare-fun m!1336265 () Bool)

(assert (=> b!1447965 m!1336265))

(declare-fun m!1336267 () Bool)

(assert (=> b!1447951 m!1336267))

(declare-fun m!1336269 () Bool)

(assert (=> b!1447961 m!1336269))

(assert (=> b!1447961 m!1336269))

(declare-fun m!1336271 () Bool)

(assert (=> b!1447961 m!1336271))

(assert (=> b!1447961 m!1336245))

(declare-fun m!1336273 () Bool)

(assert (=> b!1447961 m!1336273))

(declare-fun m!1336275 () Bool)

(assert (=> b!1447952 m!1336275))

(declare-fun m!1336277 () Bool)

(assert (=> b!1447952 m!1336277))

(declare-fun m!1336279 () Bool)

(assert (=> b!1447958 m!1336279))

(assert (=> b!1447958 m!1336245))

(declare-fun m!1336281 () Bool)

(assert (=> b!1447958 m!1336281))

(assert (=> b!1447958 m!1336251))

(assert (=> b!1447958 m!1336249))

(assert (=> b!1447958 m!1336253))

(declare-fun m!1336283 () Bool)

(assert (=> b!1447958 m!1336283))

(declare-fun m!1336285 () Bool)

(assert (=> b!1447958 m!1336285))

(assert (=> b!1447958 m!1336253))

(declare-fun m!1336287 () Bool)

(assert (=> b!1447947 m!1336287))

(assert (=> b!1447947 m!1336287))

(declare-fun m!1336289 () Bool)

(assert (=> b!1447947 m!1336289))

(declare-fun m!1336291 () Bool)

(assert (=> b!1447948 m!1336291))

(declare-fun m!1336293 () Bool)

(assert (=> start!124774 m!1336293))

(declare-fun m!1336295 () Bool)

(assert (=> start!124774 m!1336295))

(assert (=> b!1447963 m!1336253))

(assert (=> b!1447963 m!1336253))

(declare-fun m!1336297 () Bool)

(assert (=> b!1447963 m!1336297))

(check-sat (not b!1447950) (not b!1447961) (not b!1447947) (not b!1447951) (not b!1447952) (not b!1447958) (not b!1447960) (not b!1447964) (not b!1447963) (not b!1447962) (not b!1447965) (not start!124774) (not b!1447948))
(check-sat)
