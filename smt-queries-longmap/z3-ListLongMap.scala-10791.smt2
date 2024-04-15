; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126214 () Bool)

(assert start!126214)

(declare-fun b!1479404 () Bool)

(declare-fun e!829813 () Bool)

(declare-fun e!829820 () Bool)

(assert (=> b!1479404 (= e!829813 e!829820)))

(declare-fun res!1005415 () Bool)

(assert (=> b!1479404 (=> (not res!1005415) (not e!829820))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12194 0))(
  ( (MissingZero!12194 (index!51168 (_ BitVec 32))) (Found!12194 (index!51169 (_ BitVec 32))) (Intermediate!12194 (undefined!13006 Bool) (index!51170 (_ BitVec 32)) (x!132748 (_ BitVec 32))) (Undefined!12194) (MissingVacant!12194 (index!51171 (_ BitVec 32))) )
))
(declare-fun lt!645861 () SeekEntryResult!12194)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1479404 (= res!1005415 (= lt!645861 (Intermediate!12194 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-datatypes ((array!99298 0))(
  ( (array!99299 (arr!47929 (Array (_ BitVec 32) (_ BitVec 64))) (size!48481 (_ BitVec 32))) )
))
(declare-fun lt!645860 () array!99298)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!645859 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99298 (_ BitVec 32)) SeekEntryResult!12194)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1479404 (= lt!645861 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645859 mask!2687) lt!645859 lt!645860 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99298)

(assert (=> b!1479404 (= lt!645859 (select (store (arr!47929 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1479405 () Bool)

(declare-fun res!1005410 () Bool)

(declare-fun e!829815 () Bool)

(assert (=> b!1479405 (=> (not res!1005410) (not e!829815))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1479405 (= res!1005410 (validKeyInArray!0 (select (arr!47929 a!2862) j!93)))))

(declare-fun b!1479406 () Bool)

(declare-fun e!829821 () Bool)

(assert (=> b!1479406 (= e!829815 e!829821)))

(declare-fun res!1005419 () Bool)

(assert (=> b!1479406 (=> (not res!1005419) (not e!829821))))

(assert (=> b!1479406 (= res!1005419 (= (select (store (arr!47929 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1479406 (= lt!645860 (array!99299 (store (arr!47929 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48481 a!2862)))))

(declare-fun b!1479407 () Bool)

(declare-fun res!1005416 () Bool)

(assert (=> b!1479407 (=> (not res!1005416) (not e!829815))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99298 (_ BitVec 32)) Bool)

(assert (=> b!1479407 (= res!1005416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1479408 () Bool)

(declare-fun e!829819 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1479408 (= e!829819 (= lt!645861 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645859 lt!645860 mask!2687)))))

(declare-fun b!1479409 () Bool)

(declare-fun e!829818 () Bool)

(assert (=> b!1479409 (= e!829820 (not e!829818))))

(declare-fun res!1005413 () Bool)

(assert (=> b!1479409 (=> res!1005413 e!829818)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1479409 (= res!1005413 (or (and (= (select (arr!47929 a!2862) index!646) (select (store (arr!47929 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47929 a!2862) index!646) (select (arr!47929 a!2862) j!93))) (not (= (select (arr!47929 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47929 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!829817 () Bool)

(assert (=> b!1479409 e!829817))

(declare-fun res!1005414 () Bool)

(assert (=> b!1479409 (=> (not res!1005414) (not e!829817))))

(declare-fun lt!645858 () SeekEntryResult!12194)

(declare-fun lt!645856 () SeekEntryResult!12194)

(assert (=> b!1479409 (= res!1005414 (and (= lt!645856 lt!645858) (or (= (select (arr!47929 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47929 a!2862) intermediateBeforeIndex!19) (select (arr!47929 a!2862) j!93)))))))

(assert (=> b!1479409 (= lt!645858 (Found!12194 j!93))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99298 (_ BitVec 32)) SeekEntryResult!12194)

(assert (=> b!1479409 (= lt!645856 (seekEntryOrOpen!0 (select (arr!47929 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1479409 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49569 0))(
  ( (Unit!49570) )
))
(declare-fun lt!645857 () Unit!49569)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99298 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49569)

(assert (=> b!1479409 (= lt!645857 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1479410 () Bool)

(assert (=> b!1479410 (= e!829818 true)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99298 (_ BitVec 32)) SeekEntryResult!12194)

(assert (=> b!1479410 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645859 lt!645860 mask!2687) lt!645858)))

(declare-fun lt!645854 () Unit!49569)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!99298 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49569)

(assert (=> b!1479410 (= lt!645854 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1479411 () Bool)

(declare-fun res!1005420 () Bool)

(assert (=> b!1479411 (=> (not res!1005420) (not e!829815))))

(assert (=> b!1479411 (= res!1005420 (validKeyInArray!0 (select (arr!47929 a!2862) i!1006)))))

(declare-fun b!1479412 () Bool)

(declare-fun res!1005423 () Bool)

(assert (=> b!1479412 (=> (not res!1005423) (not e!829820))))

(assert (=> b!1479412 (= res!1005423 e!829819)))

(declare-fun c!136519 () Bool)

(assert (=> b!1479412 (= c!136519 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1479413 () Bool)

(declare-fun e!829812 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1479413 (= e!829812 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1479414 () Bool)

(declare-fun e!829816 () Bool)

(assert (=> b!1479414 (= e!829816 e!829812)))

(declare-fun res!1005417 () Bool)

(assert (=> b!1479414 (=> (not res!1005417) (not e!829812))))

(assert (=> b!1479414 (= res!1005417 (= lt!645856 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47929 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1479415 () Bool)

(assert (=> b!1479415 (= e!829819 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645859 lt!645860 mask!2687) (seekEntryOrOpen!0 lt!645859 lt!645860 mask!2687)))))

(declare-fun b!1479416 () Bool)

(declare-fun res!1005418 () Bool)

(assert (=> b!1479416 (=> (not res!1005418) (not e!829815))))

(assert (=> b!1479416 (= res!1005418 (and (= (size!48481 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48481 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48481 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!1005422 () Bool)

(assert (=> start!126214 (=> (not res!1005422) (not e!829815))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126214 (= res!1005422 (validMask!0 mask!2687))))

(assert (=> start!126214 e!829815))

(assert (=> start!126214 true))

(declare-fun array_inv!37162 (array!99298) Bool)

(assert (=> start!126214 (array_inv!37162 a!2862)))

(declare-fun b!1479417 () Bool)

(declare-fun res!1005412 () Bool)

(assert (=> b!1479417 (=> res!1005412 e!829818)))

(assert (=> b!1479417 (= res!1005412 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47929 a!2862) j!93) a!2862 mask!2687) lt!645858)))))

(declare-fun b!1479418 () Bool)

(declare-fun res!1005427 () Bool)

(assert (=> b!1479418 (=> (not res!1005427) (not e!829820))))

(assert (=> b!1479418 (= res!1005427 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1479419 () Bool)

(assert (=> b!1479419 (= e!829817 e!829816)))

(declare-fun res!1005411 () Bool)

(assert (=> b!1479419 (=> res!1005411 e!829816)))

(assert (=> b!1479419 (= res!1005411 (or (and (= (select (arr!47929 a!2862) index!646) (select (store (arr!47929 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47929 a!2862) index!646) (select (arr!47929 a!2862) j!93))) (not (= (select (arr!47929 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1479420 () Bool)

(assert (=> b!1479420 (= e!829821 e!829813)))

(declare-fun res!1005424 () Bool)

(assert (=> b!1479420 (=> (not res!1005424) (not e!829813))))

(declare-fun lt!645855 () SeekEntryResult!12194)

(assert (=> b!1479420 (= res!1005424 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47929 a!2862) j!93) mask!2687) (select (arr!47929 a!2862) j!93) a!2862 mask!2687) lt!645855))))

(assert (=> b!1479420 (= lt!645855 (Intermediate!12194 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1479421 () Bool)

(declare-fun res!1005421 () Bool)

(assert (=> b!1479421 (=> (not res!1005421) (not e!829815))))

(declare-datatypes ((List!34508 0))(
  ( (Nil!34505) (Cons!34504 (h!35872 (_ BitVec 64)) (t!49194 List!34508)) )
))
(declare-fun arrayNoDuplicates!0 (array!99298 (_ BitVec 32) List!34508) Bool)

(assert (=> b!1479421 (= res!1005421 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34505))))

(declare-fun b!1479422 () Bool)

(declare-fun res!1005425 () Bool)

(assert (=> b!1479422 (=> (not res!1005425) (not e!829813))))

(assert (=> b!1479422 (= res!1005425 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47929 a!2862) j!93) a!2862 mask!2687) lt!645855))))

(declare-fun b!1479423 () Bool)

(declare-fun res!1005426 () Bool)

(assert (=> b!1479423 (=> (not res!1005426) (not e!829815))))

(assert (=> b!1479423 (= res!1005426 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48481 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48481 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48481 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!126214 res!1005422) b!1479416))

(assert (= (and b!1479416 res!1005418) b!1479411))

(assert (= (and b!1479411 res!1005420) b!1479405))

(assert (= (and b!1479405 res!1005410) b!1479407))

(assert (= (and b!1479407 res!1005416) b!1479421))

(assert (= (and b!1479421 res!1005421) b!1479423))

(assert (= (and b!1479423 res!1005426) b!1479406))

(assert (= (and b!1479406 res!1005419) b!1479420))

(assert (= (and b!1479420 res!1005424) b!1479422))

(assert (= (and b!1479422 res!1005425) b!1479404))

(assert (= (and b!1479404 res!1005415) b!1479412))

(assert (= (and b!1479412 c!136519) b!1479408))

(assert (= (and b!1479412 (not c!136519)) b!1479415))

(assert (= (and b!1479412 res!1005423) b!1479418))

(assert (= (and b!1479418 res!1005427) b!1479409))

(assert (= (and b!1479409 res!1005414) b!1479419))

(assert (= (and b!1479419 (not res!1005411)) b!1479414))

(assert (= (and b!1479414 res!1005417) b!1479413))

(assert (= (and b!1479409 (not res!1005413)) b!1479417))

(assert (= (and b!1479417 (not res!1005412)) b!1479410))

(declare-fun m!1364781 () Bool)

(assert (=> b!1479409 m!1364781))

(declare-fun m!1364783 () Bool)

(assert (=> b!1479409 m!1364783))

(declare-fun m!1364785 () Bool)

(assert (=> b!1479409 m!1364785))

(declare-fun m!1364787 () Bool)

(assert (=> b!1479409 m!1364787))

(declare-fun m!1364789 () Bool)

(assert (=> b!1479409 m!1364789))

(declare-fun m!1364791 () Bool)

(assert (=> b!1479409 m!1364791))

(declare-fun m!1364793 () Bool)

(assert (=> b!1479409 m!1364793))

(declare-fun m!1364795 () Bool)

(assert (=> b!1479409 m!1364795))

(assert (=> b!1479409 m!1364791))

(assert (=> b!1479405 m!1364791))

(assert (=> b!1479405 m!1364791))

(declare-fun m!1364797 () Bool)

(assert (=> b!1479405 m!1364797))

(declare-fun m!1364799 () Bool)

(assert (=> b!1479415 m!1364799))

(declare-fun m!1364801 () Bool)

(assert (=> b!1479415 m!1364801))

(declare-fun m!1364803 () Bool)

(assert (=> b!1479421 m!1364803))

(assert (=> b!1479419 m!1364789))

(assert (=> b!1479419 m!1364783))

(assert (=> b!1479419 m!1364787))

(assert (=> b!1479419 m!1364791))

(declare-fun m!1364805 () Bool)

(assert (=> b!1479408 m!1364805))

(assert (=> b!1479417 m!1364791))

(assert (=> b!1479417 m!1364791))

(declare-fun m!1364807 () Bool)

(assert (=> b!1479417 m!1364807))

(assert (=> b!1479414 m!1364791))

(assert (=> b!1479414 m!1364791))

(declare-fun m!1364809 () Bool)

(assert (=> b!1479414 m!1364809))

(declare-fun m!1364811 () Bool)

(assert (=> b!1479411 m!1364811))

(assert (=> b!1479411 m!1364811))

(declare-fun m!1364813 () Bool)

(assert (=> b!1479411 m!1364813))

(assert (=> b!1479422 m!1364791))

(assert (=> b!1479422 m!1364791))

(declare-fun m!1364815 () Bool)

(assert (=> b!1479422 m!1364815))

(declare-fun m!1364817 () Bool)

(assert (=> b!1479407 m!1364817))

(assert (=> b!1479410 m!1364799))

(declare-fun m!1364819 () Bool)

(assert (=> b!1479410 m!1364819))

(assert (=> b!1479420 m!1364791))

(assert (=> b!1479420 m!1364791))

(declare-fun m!1364821 () Bool)

(assert (=> b!1479420 m!1364821))

(assert (=> b!1479420 m!1364821))

(assert (=> b!1479420 m!1364791))

(declare-fun m!1364823 () Bool)

(assert (=> b!1479420 m!1364823))

(declare-fun m!1364825 () Bool)

(assert (=> b!1479404 m!1364825))

(assert (=> b!1479404 m!1364825))

(declare-fun m!1364827 () Bool)

(assert (=> b!1479404 m!1364827))

(assert (=> b!1479404 m!1364783))

(declare-fun m!1364829 () Bool)

(assert (=> b!1479404 m!1364829))

(declare-fun m!1364831 () Bool)

(assert (=> start!126214 m!1364831))

(declare-fun m!1364833 () Bool)

(assert (=> start!126214 m!1364833))

(assert (=> b!1479406 m!1364783))

(declare-fun m!1364835 () Bool)

(assert (=> b!1479406 m!1364835))

(check-sat (not b!1479422) (not b!1479409) (not b!1479404) (not start!126214) (not b!1479405) (not b!1479410) (not b!1479408) (not b!1479414) (not b!1479420) (not b!1479417) (not b!1479407) (not b!1479421) (not b!1479411) (not b!1479415))
(check-sat)
