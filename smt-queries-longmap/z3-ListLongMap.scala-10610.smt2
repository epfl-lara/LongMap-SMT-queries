; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124800 () Bool)

(assert start!124800)

(declare-fun b!1448028 () Bool)

(declare-fun res!979626 () Bool)

(declare-fun e!815496 () Bool)

(assert (=> b!1448028 (=> (not res!979626) (not e!815496))))

(declare-datatypes ((array!98248 0))(
  ( (array!98249 (arr!47412 (Array (_ BitVec 32) (_ BitVec 64))) (size!47962 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98248)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98248 (_ BitVec 32)) Bool)

(assert (=> b!1448028 (= res!979626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1448029 () Bool)

(declare-fun e!815503 () Bool)

(declare-fun e!815499 () Bool)

(assert (=> b!1448029 (= e!815503 e!815499)))

(declare-fun res!979627 () Bool)

(assert (=> b!1448029 (=> res!979627 e!815499)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1448029 (= res!979627 (or (and (= (select (arr!47412 a!2862) index!646) (select (store (arr!47412 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47412 a!2862) index!646) (select (arr!47412 a!2862) j!93))) (not (= (select (arr!47412 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!635382 () array!98248)

(declare-fun b!1448030 () Bool)

(declare-fun e!815504 () Bool)

(declare-fun lt!635383 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11664 0))(
  ( (MissingZero!11664 (index!49048 (_ BitVec 32))) (Found!11664 (index!49049 (_ BitVec 32))) (Intermediate!11664 (undefined!12476 Bool) (index!49050 (_ BitVec 32)) (x!130721 (_ BitVec 32))) (Undefined!11664) (MissingVacant!11664 (index!49051 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98248 (_ BitVec 32)) SeekEntryResult!11664)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98248 (_ BitVec 32)) SeekEntryResult!11664)

(assert (=> b!1448030 (= e!815504 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635383 lt!635382 mask!2687) (seekEntryOrOpen!0 lt!635383 lt!635382 mask!2687)))))

(declare-fun b!1448032 () Bool)

(declare-fun res!979633 () Bool)

(declare-fun e!815498 () Bool)

(assert (=> b!1448032 (=> (not res!979633) (not e!815498))))

(assert (=> b!1448032 (= res!979633 e!815504)))

(declare-fun c!133716 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1448032 (= c!133716 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1448033 () Bool)

(declare-fun res!979620 () Bool)

(assert (=> b!1448033 (=> (not res!979620) (not e!815498))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1448033 (= res!979620 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1448034 () Bool)

(declare-fun res!979629 () Bool)

(assert (=> b!1448034 (=> (not res!979629) (not e!815496))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1448034 (= res!979629 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47962 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47962 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47962 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1448035 () Bool)

(declare-fun res!979621 () Bool)

(declare-fun e!815495 () Bool)

(assert (=> b!1448035 (=> (not res!979621) (not e!815495))))

(declare-fun lt!635384 () SeekEntryResult!11664)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98248 (_ BitVec 32)) SeekEntryResult!11664)

(assert (=> b!1448035 (= res!979621 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47412 a!2862) j!93) a!2862 mask!2687) lt!635384))))

(declare-fun b!1448036 () Bool)

(declare-fun res!979628 () Bool)

(assert (=> b!1448036 (=> (not res!979628) (not e!815496))))

(declare-datatypes ((List!33913 0))(
  ( (Nil!33910) (Cons!33909 (h!35259 (_ BitVec 64)) (t!48607 List!33913)) )
))
(declare-fun arrayNoDuplicates!0 (array!98248 (_ BitVec 32) List!33913) Bool)

(assert (=> b!1448036 (= res!979628 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33910))))

(declare-fun b!1448037 () Bool)

(declare-fun e!815502 () Bool)

(assert (=> b!1448037 (= e!815502 e!815495)))

(declare-fun res!979624 () Bool)

(assert (=> b!1448037 (=> (not res!979624) (not e!815495))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1448037 (= res!979624 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47412 a!2862) j!93) mask!2687) (select (arr!47412 a!2862) j!93) a!2862 mask!2687) lt!635384))))

(assert (=> b!1448037 (= lt!635384 (Intermediate!11664 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1448038 () Bool)

(declare-fun e!815501 () Bool)

(assert (=> b!1448038 (= e!815501 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1448039 () Bool)

(assert (=> b!1448039 (= e!815495 e!815498)))

(declare-fun res!979630 () Bool)

(assert (=> b!1448039 (=> (not res!979630) (not e!815498))))

(declare-fun lt!635380 () SeekEntryResult!11664)

(assert (=> b!1448039 (= res!979630 (= lt!635380 (Intermediate!11664 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1448039 (= lt!635380 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635383 mask!2687) lt!635383 lt!635382 mask!2687))))

(assert (=> b!1448039 (= lt!635383 (select (store (arr!47412 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1448040 () Bool)

(declare-fun res!979623 () Bool)

(assert (=> b!1448040 (=> (not res!979623) (not e!815496))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1448040 (= res!979623 (validKeyInArray!0 (select (arr!47412 a!2862) j!93)))))

(declare-fun b!1448041 () Bool)

(declare-fun res!979622 () Bool)

(assert (=> b!1448041 (=> (not res!979622) (not e!815496))))

(assert (=> b!1448041 (= res!979622 (and (= (size!47962 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47962 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47962 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1448042 () Bool)

(assert (=> b!1448042 (= e!815499 e!815501)))

(declare-fun res!979619 () Bool)

(assert (=> b!1448042 (=> (not res!979619) (not e!815501))))

(declare-fun lt!635381 () SeekEntryResult!11664)

(assert (=> b!1448042 (= res!979619 (= lt!635381 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47412 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1448031 () Bool)

(declare-fun e!815500 () Bool)

(assert (=> b!1448031 (= e!815498 (not e!815500))))

(declare-fun res!979632 () Bool)

(assert (=> b!1448031 (=> res!979632 e!815500)))

(assert (=> b!1448031 (= res!979632 (or (and (= (select (arr!47412 a!2862) index!646) (select (store (arr!47412 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47412 a!2862) index!646) (select (arr!47412 a!2862) j!93))) (not (= (select (arr!47412 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47412 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1448031 e!815503))

(declare-fun res!979617 () Bool)

(assert (=> b!1448031 (=> (not res!979617) (not e!815503))))

(assert (=> b!1448031 (= res!979617 (and (= lt!635381 (Found!11664 j!93)) (or (= (select (arr!47412 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47412 a!2862) intermediateBeforeIndex!19) (select (arr!47412 a!2862) j!93)))))))

(assert (=> b!1448031 (= lt!635381 (seekEntryOrOpen!0 (select (arr!47412 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1448031 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48824 0))(
  ( (Unit!48825) )
))
(declare-fun lt!635385 () Unit!48824)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98248 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48824)

(assert (=> b!1448031 (= lt!635385 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!979631 () Bool)

(assert (=> start!124800 (=> (not res!979631) (not e!815496))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124800 (= res!979631 (validMask!0 mask!2687))))

(assert (=> start!124800 e!815496))

(assert (=> start!124800 true))

(declare-fun array_inv!36440 (array!98248) Bool)

(assert (=> start!124800 (array_inv!36440 a!2862)))

(declare-fun b!1448043 () Bool)

(assert (=> b!1448043 (= e!815496 e!815502)))

(declare-fun res!979618 () Bool)

(assert (=> b!1448043 (=> (not res!979618) (not e!815502))))

(assert (=> b!1448043 (= res!979618 (= (select (store (arr!47412 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1448043 (= lt!635382 (array!98249 (store (arr!47412 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47962 a!2862)))))

(declare-fun b!1448044 () Bool)

(declare-fun res!979625 () Bool)

(assert (=> b!1448044 (=> (not res!979625) (not e!815496))))

(assert (=> b!1448044 (= res!979625 (validKeyInArray!0 (select (arr!47412 a!2862) i!1006)))))

(declare-fun b!1448045 () Bool)

(assert (=> b!1448045 (= e!815504 (= lt!635380 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635383 lt!635382 mask!2687)))))

(declare-fun b!1448046 () Bool)

(assert (=> b!1448046 (= e!815500 true)))

(declare-fun lt!635379 () SeekEntryResult!11664)

(assert (=> b!1448046 (= lt!635379 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47412 a!2862) j!93) a!2862 mask!2687))))

(assert (= (and start!124800 res!979631) b!1448041))

(assert (= (and b!1448041 res!979622) b!1448044))

(assert (= (and b!1448044 res!979625) b!1448040))

(assert (= (and b!1448040 res!979623) b!1448028))

(assert (= (and b!1448028 res!979626) b!1448036))

(assert (= (and b!1448036 res!979628) b!1448034))

(assert (= (and b!1448034 res!979629) b!1448043))

(assert (= (and b!1448043 res!979618) b!1448037))

(assert (= (and b!1448037 res!979624) b!1448035))

(assert (= (and b!1448035 res!979621) b!1448039))

(assert (= (and b!1448039 res!979630) b!1448032))

(assert (= (and b!1448032 c!133716) b!1448045))

(assert (= (and b!1448032 (not c!133716)) b!1448030))

(assert (= (and b!1448032 res!979633) b!1448033))

(assert (= (and b!1448033 res!979620) b!1448031))

(assert (= (and b!1448031 res!979617) b!1448029))

(assert (= (and b!1448029 (not res!979627)) b!1448042))

(assert (= (and b!1448042 res!979619) b!1448038))

(assert (= (and b!1448031 (not res!979632)) b!1448046))

(declare-fun m!1336813 () Bool)

(assert (=> b!1448040 m!1336813))

(assert (=> b!1448040 m!1336813))

(declare-fun m!1336815 () Bool)

(assert (=> b!1448040 m!1336815))

(declare-fun m!1336817 () Bool)

(assert (=> b!1448045 m!1336817))

(declare-fun m!1336819 () Bool)

(assert (=> b!1448044 m!1336819))

(assert (=> b!1448044 m!1336819))

(declare-fun m!1336821 () Bool)

(assert (=> b!1448044 m!1336821))

(declare-fun m!1336823 () Bool)

(assert (=> b!1448031 m!1336823))

(declare-fun m!1336825 () Bool)

(assert (=> b!1448031 m!1336825))

(declare-fun m!1336827 () Bool)

(assert (=> b!1448031 m!1336827))

(declare-fun m!1336829 () Bool)

(assert (=> b!1448031 m!1336829))

(declare-fun m!1336831 () Bool)

(assert (=> b!1448031 m!1336831))

(assert (=> b!1448031 m!1336813))

(declare-fun m!1336833 () Bool)

(assert (=> b!1448031 m!1336833))

(declare-fun m!1336835 () Bool)

(assert (=> b!1448031 m!1336835))

(assert (=> b!1448031 m!1336813))

(assert (=> b!1448046 m!1336813))

(assert (=> b!1448046 m!1336813))

(declare-fun m!1336837 () Bool)

(assert (=> b!1448046 m!1336837))

(declare-fun m!1336839 () Bool)

(assert (=> b!1448030 m!1336839))

(declare-fun m!1336841 () Bool)

(assert (=> b!1448030 m!1336841))

(assert (=> b!1448042 m!1336813))

(assert (=> b!1448042 m!1336813))

(declare-fun m!1336843 () Bool)

(assert (=> b!1448042 m!1336843))

(declare-fun m!1336845 () Bool)

(assert (=> start!124800 m!1336845))

(declare-fun m!1336847 () Bool)

(assert (=> start!124800 m!1336847))

(assert (=> b!1448029 m!1336831))

(assert (=> b!1448029 m!1336825))

(assert (=> b!1448029 m!1336829))

(assert (=> b!1448029 m!1336813))

(assert (=> b!1448037 m!1336813))

(assert (=> b!1448037 m!1336813))

(declare-fun m!1336849 () Bool)

(assert (=> b!1448037 m!1336849))

(assert (=> b!1448037 m!1336849))

(assert (=> b!1448037 m!1336813))

(declare-fun m!1336851 () Bool)

(assert (=> b!1448037 m!1336851))

(declare-fun m!1336853 () Bool)

(assert (=> b!1448036 m!1336853))

(assert (=> b!1448043 m!1336825))

(declare-fun m!1336855 () Bool)

(assert (=> b!1448043 m!1336855))

(declare-fun m!1336857 () Bool)

(assert (=> b!1448039 m!1336857))

(assert (=> b!1448039 m!1336857))

(declare-fun m!1336859 () Bool)

(assert (=> b!1448039 m!1336859))

(assert (=> b!1448039 m!1336825))

(declare-fun m!1336861 () Bool)

(assert (=> b!1448039 m!1336861))

(declare-fun m!1336863 () Bool)

(assert (=> b!1448028 m!1336863))

(assert (=> b!1448035 m!1336813))

(assert (=> b!1448035 m!1336813))

(declare-fun m!1336865 () Bool)

(assert (=> b!1448035 m!1336865))

(check-sat (not b!1448035) (not b!1448030) (not b!1448028) (not b!1448046) (not b!1448044) (not b!1448045) (not b!1448040) (not b!1448037) (not b!1448042) (not b!1448039) (not b!1448036) (not b!1448031) (not start!124800))
(check-sat)
