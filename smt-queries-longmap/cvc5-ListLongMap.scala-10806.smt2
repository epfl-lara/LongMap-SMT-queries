; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126484 () Bool)

(assert start!126484)

(declare-fun b!1483036 () Bool)

(declare-fun e!831611 () Bool)

(declare-fun e!831608 () Bool)

(assert (=> b!1483036 (= e!831611 e!831608)))

(declare-fun res!1007955 () Bool)

(assert (=> b!1483036 (=> res!1007955 e!831608)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99446 0))(
  ( (array!99447 (arr!47999 (Array (_ BitVec 32) (_ BitVec 64))) (size!48549 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99446)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!647298 () (_ BitVec 64))

(assert (=> b!1483036 (= res!1007955 (or (and (= (select (arr!47999 a!2862) index!646) lt!647298) (= (select (arr!47999 a!2862) index!646) (select (arr!47999 a!2862) j!93))) (= (select (arr!47999 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1483036 (= lt!647298 (select (store (arr!47999 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1483037 () Bool)

(declare-fun res!1007954 () Bool)

(declare-fun e!831610 () Bool)

(assert (=> b!1483037 (=> (not res!1007954) (not e!831610))))

(declare-datatypes ((List!34500 0))(
  ( (Nil!34497) (Cons!34496 (h!35870 (_ BitVec 64)) (t!49194 List!34500)) )
))
(declare-fun arrayNoDuplicates!0 (array!99446 (_ BitVec 32) List!34500) Bool)

(assert (=> b!1483037 (= res!1007954 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34497))))

(declare-fun b!1483038 () Bool)

(declare-fun res!1007957 () Bool)

(declare-fun e!831609 () Bool)

(assert (=> b!1483038 (=> (not res!1007957) (not e!831609))))

(declare-fun e!831613 () Bool)

(assert (=> b!1483038 (= res!1007957 e!831613)))

(declare-fun c!137067 () Bool)

(assert (=> b!1483038 (= c!137067 (bvsle x!665 intermediateAfterX!19))))

(declare-fun lt!647294 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!647296 () array!99446)

(declare-datatypes ((SeekEntryResult!12239 0))(
  ( (MissingZero!12239 (index!51348 (_ BitVec 32))) (Found!12239 (index!51349 (_ BitVec 32))) (Intermediate!12239 (undefined!13051 Bool) (index!51350 (_ BitVec 32)) (x!132939 (_ BitVec 32))) (Undefined!12239) (MissingVacant!12239 (index!51351 (_ BitVec 32))) )
))
(declare-fun lt!647295 () SeekEntryResult!12239)

(declare-fun b!1483039 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99446 (_ BitVec 32)) SeekEntryResult!12239)

(assert (=> b!1483039 (= e!831613 (= lt!647295 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647294 lt!647296 mask!2687)))))

(declare-fun b!1483040 () Bool)

(declare-fun res!1007961 () Bool)

(assert (=> b!1483040 (=> (not res!1007961) (not e!831611))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1483040 (= res!1007961 (or (= (select (arr!47999 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47999 a!2862) intermediateBeforeIndex!19) (select (arr!47999 a!2862) j!93))))))

(declare-fun b!1483041 () Bool)

(declare-fun res!1007963 () Bool)

(assert (=> b!1483041 (=> (not res!1007963) (not e!831609))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1483041 (= res!1007963 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1483042 () Bool)

(declare-fun res!1007951 () Bool)

(assert (=> b!1483042 (=> (not res!1007951) (not e!831611))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99446 (_ BitVec 32)) SeekEntryResult!12239)

(assert (=> b!1483042 (= res!1007951 (= (seekEntryOrOpen!0 (select (arr!47999 a!2862) j!93) a!2862 mask!2687) (Found!12239 j!93)))))

(declare-fun b!1483043 () Bool)

(declare-fun e!831616 () Bool)

(assert (=> b!1483043 (= e!831616 true)))

(declare-fun lt!647297 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483043 (= lt!647297 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1483044 () Bool)

(declare-fun res!1007948 () Bool)

(assert (=> b!1483044 (=> (not res!1007948) (not e!831610))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1483044 (= res!1007948 (validKeyInArray!0 (select (arr!47999 a!2862) j!93)))))

(declare-fun b!1483045 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99446 (_ BitVec 32)) SeekEntryResult!12239)

(assert (=> b!1483045 (= e!831613 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647294 lt!647296 mask!2687) (seekEntryOrOpen!0 lt!647294 lt!647296 mask!2687)))))

(declare-fun b!1483046 () Bool)

(declare-fun e!831612 () Bool)

(assert (=> b!1483046 (= e!831608 e!831612)))

(declare-fun res!1007964 () Bool)

(assert (=> b!1483046 (=> (not res!1007964) (not e!831612))))

(assert (=> b!1483046 (= res!1007964 (and (= index!646 intermediateAfterIndex!19) (= lt!647298 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1483047 () Bool)

(declare-fun res!1007953 () Bool)

(assert (=> b!1483047 (=> (not res!1007953) (not e!831610))))

(assert (=> b!1483047 (= res!1007953 (validKeyInArray!0 (select (arr!47999 a!2862) i!1006)))))

(declare-fun b!1483048 () Bool)

(declare-fun e!831617 () Bool)

(declare-fun e!831615 () Bool)

(assert (=> b!1483048 (= e!831617 e!831615)))

(declare-fun res!1007952 () Bool)

(assert (=> b!1483048 (=> (not res!1007952) (not e!831615))))

(declare-fun lt!647292 () SeekEntryResult!12239)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483048 (= res!1007952 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47999 a!2862) j!93) mask!2687) (select (arr!47999 a!2862) j!93) a!2862 mask!2687) lt!647292))))

(assert (=> b!1483048 (= lt!647292 (Intermediate!12239 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!1007959 () Bool)

(assert (=> start!126484 (=> (not res!1007959) (not e!831610))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126484 (= res!1007959 (validMask!0 mask!2687))))

(assert (=> start!126484 e!831610))

(assert (=> start!126484 true))

(declare-fun array_inv!37027 (array!99446) Bool)

(assert (=> start!126484 (array_inv!37027 a!2862)))

(declare-fun b!1483049 () Bool)

(assert (=> b!1483049 (= e!831615 e!831609)))

(declare-fun res!1007960 () Bool)

(assert (=> b!1483049 (=> (not res!1007960) (not e!831609))))

(assert (=> b!1483049 (= res!1007960 (= lt!647295 (Intermediate!12239 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1483049 (= lt!647295 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647294 mask!2687) lt!647294 lt!647296 mask!2687))))

(assert (=> b!1483049 (= lt!647294 (select (store (arr!47999 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1483050 () Bool)

(declare-fun res!1007947 () Bool)

(assert (=> b!1483050 (=> (not res!1007947) (not e!831615))))

(assert (=> b!1483050 (= res!1007947 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47999 a!2862) j!93) a!2862 mask!2687) lt!647292))))

(declare-fun b!1483051 () Bool)

(declare-fun res!1007956 () Bool)

(assert (=> b!1483051 (=> (not res!1007956) (not e!831610))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99446 (_ BitVec 32)) Bool)

(assert (=> b!1483051 (= res!1007956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1483052 () Bool)

(declare-fun res!1007949 () Bool)

(assert (=> b!1483052 (=> (not res!1007949) (not e!831610))))

(assert (=> b!1483052 (= res!1007949 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48549 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48549 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48549 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1483053 () Bool)

(assert (=> b!1483053 (= e!831609 (not e!831616))))

(declare-fun res!1007962 () Bool)

(assert (=> b!1483053 (=> res!1007962 e!831616)))

(assert (=> b!1483053 (= res!1007962 (or (and (= (select (arr!47999 a!2862) index!646) (select (store (arr!47999 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47999 a!2862) index!646) (select (arr!47999 a!2862) j!93))) (= (select (arr!47999 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1483053 e!831611))

(declare-fun res!1007965 () Bool)

(assert (=> b!1483053 (=> (not res!1007965) (not e!831611))))

(assert (=> b!1483053 (= res!1007965 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49818 0))(
  ( (Unit!49819) )
))
(declare-fun lt!647293 () Unit!49818)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99446 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49818)

(assert (=> b!1483053 (= lt!647293 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1483054 () Bool)

(assert (=> b!1483054 (= e!831610 e!831617)))

(declare-fun res!1007950 () Bool)

(assert (=> b!1483054 (=> (not res!1007950) (not e!831617))))

(assert (=> b!1483054 (= res!1007950 (= (select (store (arr!47999 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1483054 (= lt!647296 (array!99447 (store (arr!47999 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48549 a!2862)))))

(declare-fun b!1483055 () Bool)

(declare-fun res!1007958 () Bool)

(assert (=> b!1483055 (=> (not res!1007958) (not e!831610))))

(assert (=> b!1483055 (= res!1007958 (and (= (size!48549 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48549 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48549 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1483056 () Bool)

(assert (=> b!1483056 (= e!831612 (= (seekEntryOrOpen!0 lt!647294 lt!647296 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647294 lt!647296 mask!2687)))))

(assert (= (and start!126484 res!1007959) b!1483055))

(assert (= (and b!1483055 res!1007958) b!1483047))

(assert (= (and b!1483047 res!1007953) b!1483044))

(assert (= (and b!1483044 res!1007948) b!1483051))

(assert (= (and b!1483051 res!1007956) b!1483037))

(assert (= (and b!1483037 res!1007954) b!1483052))

(assert (= (and b!1483052 res!1007949) b!1483054))

(assert (= (and b!1483054 res!1007950) b!1483048))

(assert (= (and b!1483048 res!1007952) b!1483050))

(assert (= (and b!1483050 res!1007947) b!1483049))

(assert (= (and b!1483049 res!1007960) b!1483038))

(assert (= (and b!1483038 c!137067) b!1483039))

(assert (= (and b!1483038 (not c!137067)) b!1483045))

(assert (= (and b!1483038 res!1007957) b!1483041))

(assert (= (and b!1483041 res!1007963) b!1483053))

(assert (= (and b!1483053 res!1007965) b!1483042))

(assert (= (and b!1483042 res!1007951) b!1483040))

(assert (= (and b!1483040 res!1007961) b!1483036))

(assert (= (and b!1483036 (not res!1007955)) b!1483046))

(assert (= (and b!1483046 res!1007964) b!1483056))

(assert (= (and b!1483053 (not res!1007962)) b!1483043))

(declare-fun m!1368589 () Bool)

(assert (=> b!1483040 m!1368589))

(declare-fun m!1368591 () Bool)

(assert (=> b!1483040 m!1368591))

(assert (=> b!1483050 m!1368591))

(assert (=> b!1483050 m!1368591))

(declare-fun m!1368593 () Bool)

(assert (=> b!1483050 m!1368593))

(declare-fun m!1368595 () Bool)

(assert (=> b!1483054 m!1368595))

(declare-fun m!1368597 () Bool)

(assert (=> b!1483054 m!1368597))

(declare-fun m!1368599 () Bool)

(assert (=> b!1483039 m!1368599))

(declare-fun m!1368601 () Bool)

(assert (=> b!1483036 m!1368601))

(assert (=> b!1483036 m!1368591))

(assert (=> b!1483036 m!1368595))

(declare-fun m!1368603 () Bool)

(assert (=> b!1483036 m!1368603))

(declare-fun m!1368605 () Bool)

(assert (=> b!1483053 m!1368605))

(assert (=> b!1483053 m!1368595))

(assert (=> b!1483053 m!1368603))

(assert (=> b!1483053 m!1368601))

(declare-fun m!1368607 () Bool)

(assert (=> b!1483053 m!1368607))

(assert (=> b!1483053 m!1368591))

(declare-fun m!1368609 () Bool)

(assert (=> b!1483051 m!1368609))

(declare-fun m!1368611 () Bool)

(assert (=> b!1483037 m!1368611))

(declare-fun m!1368613 () Bool)

(assert (=> b!1483049 m!1368613))

(assert (=> b!1483049 m!1368613))

(declare-fun m!1368615 () Bool)

(assert (=> b!1483049 m!1368615))

(assert (=> b!1483049 m!1368595))

(declare-fun m!1368617 () Bool)

(assert (=> b!1483049 m!1368617))

(declare-fun m!1368619 () Bool)

(assert (=> b!1483043 m!1368619))

(declare-fun m!1368621 () Bool)

(assert (=> b!1483047 m!1368621))

(assert (=> b!1483047 m!1368621))

(declare-fun m!1368623 () Bool)

(assert (=> b!1483047 m!1368623))

(declare-fun m!1368625 () Bool)

(assert (=> b!1483056 m!1368625))

(declare-fun m!1368627 () Bool)

(assert (=> b!1483056 m!1368627))

(declare-fun m!1368629 () Bool)

(assert (=> start!126484 m!1368629))

(declare-fun m!1368631 () Bool)

(assert (=> start!126484 m!1368631))

(assert (=> b!1483044 m!1368591))

(assert (=> b!1483044 m!1368591))

(declare-fun m!1368633 () Bool)

(assert (=> b!1483044 m!1368633))

(assert (=> b!1483042 m!1368591))

(assert (=> b!1483042 m!1368591))

(declare-fun m!1368635 () Bool)

(assert (=> b!1483042 m!1368635))

(assert (=> b!1483045 m!1368627))

(assert (=> b!1483045 m!1368625))

(assert (=> b!1483048 m!1368591))

(assert (=> b!1483048 m!1368591))

(declare-fun m!1368637 () Bool)

(assert (=> b!1483048 m!1368637))

(assert (=> b!1483048 m!1368637))

(assert (=> b!1483048 m!1368591))

(declare-fun m!1368639 () Bool)

(assert (=> b!1483048 m!1368639))

(push 1)

