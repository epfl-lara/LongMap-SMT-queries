; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126748 () Bool)

(assert start!126748)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!834072 () Bool)

(declare-fun lt!649031 () (_ BitVec 64))

(declare-datatypes ((array!99584 0))(
  ( (array!99585 (arr!48065 (Array (_ BitVec 32) (_ BitVec 64))) (size!48615 (_ BitVec 32))) )
))
(declare-fun lt!649033 () array!99584)

(declare-fun b!1488003 () Bool)

(declare-fun lt!649030 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12305 0))(
  ( (MissingZero!12305 (index!51612 (_ BitVec 32))) (Found!12305 (index!51613 (_ BitVec 32))) (Intermediate!12305 (undefined!13117 Bool) (index!51614 (_ BitVec 32)) (x!133205 (_ BitVec 32))) (Undefined!12305) (MissingVacant!12305 (index!51615 (_ BitVec 32))) )
))
(declare-fun lt!649034 () SeekEntryResult!12305)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99584 (_ BitVec 32)) SeekEntryResult!12305)

(assert (=> b!1488003 (= e!834072 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649030 intermediateAfterIndex!19 lt!649031 lt!649033 mask!2687) lt!649034))))

(declare-fun b!1488004 () Bool)

(declare-fun res!1011961 () Bool)

(declare-fun e!834080 () Bool)

(assert (=> b!1488004 (=> (not res!1011961) (not e!834080))))

(declare-fun a!2862 () array!99584)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1488004 (= res!1011961 (validKeyInArray!0 (select (arr!48065 a!2862) j!93)))))

(declare-fun b!1488005 () Bool)

(declare-fun res!1011954 () Bool)

(assert (=> b!1488005 (=> (not res!1011954) (not e!834080))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1488005 (= res!1011954 (validKeyInArray!0 (select (arr!48065 a!2862) i!1006)))))

(declare-fun b!1488006 () Bool)

(declare-fun res!1011950 () Bool)

(assert (=> b!1488006 (=> (not res!1011950) (not e!834080))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1488006 (= res!1011950 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48615 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48615 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48615 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1488007 () Bool)

(declare-fun res!1011953 () Bool)

(assert (=> b!1488007 (=> (not res!1011953) (not e!834080))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99584 (_ BitVec 32)) Bool)

(assert (=> b!1488007 (= res!1011953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1488008 () Bool)

(declare-fun e!834076 () Bool)

(assert (=> b!1488008 (= e!834080 e!834076)))

(declare-fun res!1011958 () Bool)

(assert (=> b!1488008 (=> (not res!1011958) (not e!834076))))

(assert (=> b!1488008 (= res!1011958 (= (select (store (arr!48065 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488008 (= lt!649033 (array!99585 (store (arr!48065 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48615 a!2862)))))

(declare-fun b!1488009 () Bool)

(declare-fun res!1011966 () Bool)

(declare-fun e!834078 () Bool)

(assert (=> b!1488009 (=> res!1011966 e!834078)))

(declare-fun lt!649029 () SeekEntryResult!12305)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99584 (_ BitVec 32)) SeekEntryResult!12305)

(assert (=> b!1488009 (= res!1011966 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649030 (select (arr!48065 a!2862) j!93) a!2862 mask!2687) lt!649029)))))

(declare-fun e!834075 () Bool)

(declare-fun b!1488010 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99584 (_ BitVec 32)) SeekEntryResult!12305)

(assert (=> b!1488010 (= e!834075 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649031 lt!649033 mask!2687) (seekEntryOrOpen!0 lt!649031 lt!649033 mask!2687)))))

(declare-fun b!1488011 () Bool)

(declare-fun e!834074 () Bool)

(declare-fun e!834071 () Bool)

(assert (=> b!1488011 (= e!834074 (not e!834071))))

(declare-fun res!1011964 () Bool)

(assert (=> b!1488011 (=> res!1011964 e!834071)))

(assert (=> b!1488011 (= res!1011964 (or (and (= (select (arr!48065 a!2862) index!646) (select (store (arr!48065 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48065 a!2862) index!646) (select (arr!48065 a!2862) j!93))) (= (select (arr!48065 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!834073 () Bool)

(assert (=> b!1488011 e!834073))

(declare-fun res!1011951 () Bool)

(assert (=> b!1488011 (=> (not res!1011951) (not e!834073))))

(assert (=> b!1488011 (= res!1011951 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49950 0))(
  ( (Unit!49951) )
))
(declare-fun lt!649035 () Unit!49950)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99584 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49950)

(assert (=> b!1488011 (= lt!649035 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1488012 () Bool)

(assert (=> b!1488012 (= e!834071 e!834078)))

(declare-fun res!1011952 () Bool)

(assert (=> b!1488012 (=> res!1011952 e!834078)))

(assert (=> b!1488012 (= res!1011952 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649030 #b00000000000000000000000000000000) (bvsge lt!649030 (size!48615 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1488012 (= lt!649030 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1488012 (= lt!649034 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649031 lt!649033 mask!2687))))

(assert (=> b!1488012 (= lt!649034 (seekEntryOrOpen!0 lt!649031 lt!649033 mask!2687))))

(declare-fun b!1488013 () Bool)

(assert (=> b!1488013 (= e!834073 (and (or (= (select (arr!48065 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48065 a!2862) intermediateBeforeIndex!19) (select (arr!48065 a!2862) j!93))) (let ((bdg!54636 (select (store (arr!48065 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48065 a!2862) index!646) bdg!54636) (= (select (arr!48065 a!2862) index!646) (select (arr!48065 a!2862) j!93))) (= (select (arr!48065 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54636 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1488014 () Bool)

(declare-fun res!1011957 () Bool)

(assert (=> b!1488014 (=> (not res!1011957) (not e!834080))))

(declare-datatypes ((List!34566 0))(
  ( (Nil!34563) (Cons!34562 (h!35942 (_ BitVec 64)) (t!49260 List!34566)) )
))
(declare-fun arrayNoDuplicates!0 (array!99584 (_ BitVec 32) List!34566) Bool)

(assert (=> b!1488014 (= res!1011957 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34563))))

(declare-fun b!1488015 () Bool)

(declare-fun res!1011959 () Bool)

(assert (=> b!1488015 (=> (not res!1011959) (not e!834073))))

(assert (=> b!1488015 (= res!1011959 (= (seekEntryOrOpen!0 (select (arr!48065 a!2862) j!93) a!2862 mask!2687) (Found!12305 j!93)))))

(declare-fun b!1488016 () Bool)

(declare-fun res!1011965 () Bool)

(assert (=> b!1488016 (=> (not res!1011965) (not e!834074))))

(assert (=> b!1488016 (= res!1011965 e!834075)))

(declare-fun c!137552 () Bool)

(assert (=> b!1488016 (= c!137552 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!1011955 () Bool)

(assert (=> start!126748 (=> (not res!1011955) (not e!834080))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126748 (= res!1011955 (validMask!0 mask!2687))))

(assert (=> start!126748 e!834080))

(assert (=> start!126748 true))

(declare-fun array_inv!37093 (array!99584) Bool)

(assert (=> start!126748 (array_inv!37093 a!2862)))

(declare-fun b!1488017 () Bool)

(assert (=> b!1488017 (= e!834078 e!834072)))

(declare-fun c!137553 () Bool)

(assert (=> b!1488017 (= c!137553 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1488018 () Bool)

(declare-fun res!1011963 () Bool)

(declare-fun e!834079 () Bool)

(assert (=> b!1488018 (=> (not res!1011963) (not e!834079))))

(assert (=> b!1488018 (= res!1011963 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48065 a!2862) j!93) a!2862 mask!2687) lt!649029))))

(declare-fun lt!649032 () SeekEntryResult!12305)

(declare-fun b!1488019 () Bool)

(assert (=> b!1488019 (= e!834075 (= lt!649032 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649031 lt!649033 mask!2687)))))

(declare-fun b!1488020 () Bool)

(assert (=> b!1488020 (= e!834079 e!834074)))

(declare-fun res!1011962 () Bool)

(assert (=> b!1488020 (=> (not res!1011962) (not e!834074))))

(assert (=> b!1488020 (= res!1011962 (= lt!649032 (Intermediate!12305 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1488020 (= lt!649032 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649031 mask!2687) lt!649031 lt!649033 mask!2687))))

(assert (=> b!1488020 (= lt!649031 (select (store (arr!48065 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1488021 () Bool)

(declare-fun res!1011960 () Bool)

(assert (=> b!1488021 (=> (not res!1011960) (not e!834080))))

(assert (=> b!1488021 (= res!1011960 (and (= (size!48615 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48615 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48615 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1488022 () Bool)

(assert (=> b!1488022 (= e!834076 e!834079)))

(declare-fun res!1011956 () Bool)

(assert (=> b!1488022 (=> (not res!1011956) (not e!834079))))

(assert (=> b!1488022 (= res!1011956 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48065 a!2862) j!93) mask!2687) (select (arr!48065 a!2862) j!93) a!2862 mask!2687) lt!649029))))

(assert (=> b!1488022 (= lt!649029 (Intermediate!12305 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1488023 () Bool)

(assert (=> b!1488023 (= e!834072 (= lt!649032 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649030 lt!649031 lt!649033 mask!2687)))))

(declare-fun b!1488024 () Bool)

(declare-fun res!1011967 () Bool)

(assert (=> b!1488024 (=> (not res!1011967) (not e!834074))))

(assert (=> b!1488024 (= res!1011967 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!126748 res!1011955) b!1488021))

(assert (= (and b!1488021 res!1011960) b!1488005))

(assert (= (and b!1488005 res!1011954) b!1488004))

(assert (= (and b!1488004 res!1011961) b!1488007))

(assert (= (and b!1488007 res!1011953) b!1488014))

(assert (= (and b!1488014 res!1011957) b!1488006))

(assert (= (and b!1488006 res!1011950) b!1488008))

(assert (= (and b!1488008 res!1011958) b!1488022))

(assert (= (and b!1488022 res!1011956) b!1488018))

(assert (= (and b!1488018 res!1011963) b!1488020))

(assert (= (and b!1488020 res!1011962) b!1488016))

(assert (= (and b!1488016 c!137552) b!1488019))

(assert (= (and b!1488016 (not c!137552)) b!1488010))

(assert (= (and b!1488016 res!1011965) b!1488024))

(assert (= (and b!1488024 res!1011967) b!1488011))

(assert (= (and b!1488011 res!1011951) b!1488015))

(assert (= (and b!1488015 res!1011959) b!1488013))

(assert (= (and b!1488011 (not res!1011964)) b!1488012))

(assert (= (and b!1488012 (not res!1011952)) b!1488009))

(assert (= (and b!1488009 (not res!1011966)) b!1488017))

(assert (= (and b!1488017 c!137553) b!1488023))

(assert (= (and b!1488017 (not c!137553)) b!1488003))

(declare-fun m!1372525 () Bool)

(assert (=> b!1488013 m!1372525))

(declare-fun m!1372527 () Bool)

(assert (=> b!1488013 m!1372527))

(declare-fun m!1372529 () Bool)

(assert (=> b!1488013 m!1372529))

(declare-fun m!1372531 () Bool)

(assert (=> b!1488013 m!1372531))

(declare-fun m!1372533 () Bool)

(assert (=> b!1488013 m!1372533))

(assert (=> b!1488009 m!1372533))

(assert (=> b!1488009 m!1372533))

(declare-fun m!1372535 () Bool)

(assert (=> b!1488009 m!1372535))

(declare-fun m!1372537 () Bool)

(assert (=> b!1488023 m!1372537))

(declare-fun m!1372539 () Bool)

(assert (=> b!1488010 m!1372539))

(declare-fun m!1372541 () Bool)

(assert (=> b!1488010 m!1372541))

(declare-fun m!1372543 () Bool)

(assert (=> b!1488012 m!1372543))

(assert (=> b!1488012 m!1372539))

(assert (=> b!1488012 m!1372541))

(declare-fun m!1372545 () Bool)

(assert (=> b!1488020 m!1372545))

(assert (=> b!1488020 m!1372545))

(declare-fun m!1372547 () Bool)

(assert (=> b!1488020 m!1372547))

(assert (=> b!1488020 m!1372525))

(declare-fun m!1372549 () Bool)

(assert (=> b!1488020 m!1372549))

(assert (=> b!1488004 m!1372533))

(assert (=> b!1488004 m!1372533))

(declare-fun m!1372551 () Bool)

(assert (=> b!1488004 m!1372551))

(assert (=> b!1488022 m!1372533))

(assert (=> b!1488022 m!1372533))

(declare-fun m!1372553 () Bool)

(assert (=> b!1488022 m!1372553))

(assert (=> b!1488022 m!1372553))

(assert (=> b!1488022 m!1372533))

(declare-fun m!1372555 () Bool)

(assert (=> b!1488022 m!1372555))

(declare-fun m!1372557 () Bool)

(assert (=> start!126748 m!1372557))

(declare-fun m!1372559 () Bool)

(assert (=> start!126748 m!1372559))

(declare-fun m!1372561 () Bool)

(assert (=> b!1488019 m!1372561))

(declare-fun m!1372563 () Bool)

(assert (=> b!1488005 m!1372563))

(assert (=> b!1488005 m!1372563))

(declare-fun m!1372565 () Bool)

(assert (=> b!1488005 m!1372565))

(declare-fun m!1372567 () Bool)

(assert (=> b!1488011 m!1372567))

(assert (=> b!1488011 m!1372525))

(assert (=> b!1488011 m!1372529))

(assert (=> b!1488011 m!1372531))

(declare-fun m!1372569 () Bool)

(assert (=> b!1488011 m!1372569))

(assert (=> b!1488011 m!1372533))

(assert (=> b!1488008 m!1372525))

(declare-fun m!1372571 () Bool)

(assert (=> b!1488008 m!1372571))

(declare-fun m!1372573 () Bool)

(assert (=> b!1488014 m!1372573))

(assert (=> b!1488018 m!1372533))

(assert (=> b!1488018 m!1372533))

(declare-fun m!1372575 () Bool)

(assert (=> b!1488018 m!1372575))

(assert (=> b!1488015 m!1372533))

(assert (=> b!1488015 m!1372533))

(declare-fun m!1372577 () Bool)

(assert (=> b!1488015 m!1372577))

(declare-fun m!1372579 () Bool)

(assert (=> b!1488003 m!1372579))

(declare-fun m!1372581 () Bool)

(assert (=> b!1488007 m!1372581))

(push 1)

(assert (not b!1488023))

(assert (not b!1488019))

(assert (not b!1488022))

(assert (not b!1488007))

(assert (not b!1488005))

(assert (not b!1488014))

(assert (not b!1488010))

(assert (not b!1488009))

(assert (not b!1488004))

(assert (not start!126748))

(assert (not b!1488003))

(assert (not b!1488012))

(assert (not b!1488018))

(assert (not b!1488020))

(assert (not b!1488015))

(assert (not b!1488011))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1488295 () Bool)

(declare-fun lt!649129 () SeekEntryResult!12305)

(assert (=> b!1488295 (and (bvsge (index!51614 lt!649129) #b00000000000000000000000000000000) (bvslt (index!51614 lt!649129) (size!48615 a!2862)))))

(declare-fun res!1012108 () Bool)

(assert (=> b!1488295 (= res!1012108 (= (select (arr!48065 a!2862) (index!51614 lt!649129)) (select (arr!48065 a!2862) j!93)))))

(declare-fun e!834217 () Bool)

(assert (=> b!1488295 (=> res!1012108 e!834217)))

(declare-fun e!834216 () Bool)

(assert (=> b!1488295 (= e!834216 e!834217)))

(declare-fun b!1488296 () Bool)

(declare-fun e!834215 () SeekEntryResult!12305)

(declare-fun e!834218 () SeekEntryResult!12305)

(assert (=> b!1488296 (= e!834215 e!834218)))

(declare-fun c!137622 () Bool)

(declare-fun lt!649130 () (_ BitVec 64))

(assert (=> b!1488296 (= c!137622 (or (= lt!649130 (select (arr!48065 a!2862) j!93)) (= (bvadd lt!649130 lt!649130) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1488297 () Bool)

(declare-fun e!834219 () Bool)

(assert (=> b!1488297 (= e!834219 e!834216)))

(declare-fun res!1012107 () Bool)

(assert (=> b!1488297 (= res!1012107 (and (is-Intermediate!12305 lt!649129) (not (undefined!13117 lt!649129)) (bvslt (x!133205 lt!649129) #b01111111111111111111111111111110) (bvsge (x!133205 lt!649129) #b00000000000000000000000000000000) (bvsge (x!133205 lt!649129) #b00000000000000000000000000000000)))))

(assert (=> b!1488297 (=> (not res!1012107) (not e!834216))))

(declare-fun b!1488298 () Bool)

(assert (=> b!1488298 (= e!834218 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48065 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!48065 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!156677 () Bool)

(assert (=> d!156677 e!834219))

(declare-fun c!137620 () Bool)

(assert (=> d!156677 (= c!137620 (and (is-Intermediate!12305 lt!649129) (undefined!13117 lt!649129)))))

(assert (=> d!156677 (= lt!649129 e!834215)))

(declare-fun c!137621 () Bool)

(assert (=> d!156677 (= c!137621 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!156677 (= lt!649130 (select (arr!48065 a!2862) (toIndex!0 (select (arr!48065 a!2862) j!93) mask!2687)))))

(assert (=> d!156677 (validMask!0 mask!2687)))

(assert (=> d!156677 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48065 a!2862) j!93) mask!2687) (select (arr!48065 a!2862) j!93) a!2862 mask!2687) lt!649129)))

(declare-fun b!1488299 () Bool)

(assert (=> b!1488299 (= e!834219 (bvsge (x!133205 lt!649129) #b01111111111111111111111111111110))))

(declare-fun b!1488300 () Bool)

(assert (=> b!1488300 (and (bvsge (index!51614 lt!649129) #b00000000000000000000000000000000) (bvslt (index!51614 lt!649129) (size!48615 a!2862)))))

(assert (=> b!1488300 (= e!834217 (= (select (arr!48065 a!2862) (index!51614 lt!649129)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1488301 () Bool)

(assert (=> b!1488301 (and (bvsge (index!51614 lt!649129) #b00000000000000000000000000000000) (bvslt (index!51614 lt!649129) (size!48615 a!2862)))))

(declare-fun res!1012109 () Bool)

(assert (=> b!1488301 (= res!1012109 (= (select (arr!48065 a!2862) (index!51614 lt!649129)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488301 (=> res!1012109 e!834217)))

(declare-fun b!1488302 () Bool)

(assert (=> b!1488302 (= e!834215 (Intermediate!12305 true (toIndex!0 (select (arr!48065 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1488303 () Bool)

(assert (=> b!1488303 (= e!834218 (Intermediate!12305 false (toIndex!0 (select (arr!48065 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!156677 c!137621) b!1488302))

(assert (= (and d!156677 (not c!137621)) b!1488296))

(assert (= (and b!1488296 c!137622) b!1488303))

(assert (= (and b!1488296 (not c!137622)) b!1488298))

(assert (= (and d!156677 c!137620) b!1488299))

(assert (= (and d!156677 (not c!137620)) b!1488297))

(assert (= (and b!1488297 res!1012107) b!1488295))

(assert (= (and b!1488295 (not res!1012108)) b!1488301))

(assert (= (and b!1488301 (not res!1012109)) b!1488300))

(assert (=> b!1488298 m!1372553))

(declare-fun m!1372763 () Bool)

(assert (=> b!1488298 m!1372763))

(assert (=> b!1488298 m!1372763))

(assert (=> b!1488298 m!1372533))

(declare-fun m!1372765 () Bool)

(assert (=> b!1488298 m!1372765))

(declare-fun m!1372767 () Bool)

(assert (=> b!1488300 m!1372767))

(assert (=> b!1488301 m!1372767))

(assert (=> d!156677 m!1372553))

(declare-fun m!1372769 () Bool)

(assert (=> d!156677 m!1372769))

(assert (=> d!156677 m!1372557))

(assert (=> b!1488295 m!1372767))

(assert (=> b!1488022 d!156677))

(declare-fun d!156693 () Bool)

(declare-fun lt!649149 () (_ BitVec 32))

(declare-fun lt!649148 () (_ BitVec 32))

(assert (=> d!156693 (= lt!649149 (bvmul (bvxor lt!649148 (bvlshr lt!649148 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156693 (= lt!649148 ((_ extract 31 0) (bvand (bvxor (select (arr!48065 a!2862) j!93) (bvlshr (select (arr!48065 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156693 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1012114 (let ((h!35946 ((_ extract 31 0) (bvand (bvxor (select (arr!48065 a!2862) j!93) (bvlshr (select (arr!48065 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133214 (bvmul (bvxor h!35946 (bvlshr h!35946 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133214 (bvlshr x!133214 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1012114 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1012114 #b00000000000000000000000000000000))))))

(assert (=> d!156693 (= (toIndex!0 (select (arr!48065 a!2862) j!93) mask!2687) (bvand (bvxor lt!649149 (bvlshr lt!649149 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1488022 d!156693))

(declare-fun b!1488343 () Bool)

(declare-fun lt!649152 () SeekEntryResult!12305)

(assert (=> b!1488343 (and (bvsge (index!51614 lt!649152) #b00000000000000000000000000000000) (bvslt (index!51614 lt!649152) (size!48615 lt!649033)))))

(declare-fun res!1012127 () Bool)

(assert (=> b!1488343 (= res!1012127 (= (select (arr!48065 lt!649033) (index!51614 lt!649152)) lt!649031))))

(declare-fun e!834246 () Bool)

(assert (=> b!1488343 (=> res!1012127 e!834246)))

(declare-fun e!834245 () Bool)

(assert (=> b!1488343 (= e!834245 e!834246)))

(declare-fun b!1488344 () Bool)

(declare-fun e!834244 () SeekEntryResult!12305)

(declare-fun e!834247 () SeekEntryResult!12305)

(assert (=> b!1488344 (= e!834244 e!834247)))

(declare-fun c!137637 () Bool)

(declare-fun lt!649153 () (_ BitVec 64))

(assert (=> b!1488344 (= c!137637 (or (= lt!649153 lt!649031) (= (bvadd lt!649153 lt!649153) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1488345 () Bool)

(declare-fun e!834248 () Bool)

(assert (=> b!1488345 (= e!834248 e!834245)))

(declare-fun res!1012126 () Bool)

(assert (=> b!1488345 (= res!1012126 (and (is-Intermediate!12305 lt!649152) (not (undefined!13117 lt!649152)) (bvslt (x!133205 lt!649152) #b01111111111111111111111111111110) (bvsge (x!133205 lt!649152) #b00000000000000000000000000000000) (bvsge (x!133205 lt!649152) (bvadd #b00000000000000000000000000000001 x!665))))))

(assert (=> b!1488345 (=> (not res!1012126) (not e!834245))))

(declare-fun b!1488346 () Bool)

(assert (=> b!1488346 (= e!834247 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!649030 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) lt!649031 lt!649033 mask!2687))))

(declare-fun d!156701 () Bool)

(assert (=> d!156701 e!834248))

(declare-fun c!137635 () Bool)

(assert (=> d!156701 (= c!137635 (and (is-Intermediate!12305 lt!649152) (undefined!13117 lt!649152)))))

(assert (=> d!156701 (= lt!649152 e!834244)))

(declare-fun c!137636 () Bool)

(assert (=> d!156701 (= c!137636 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(assert (=> d!156701 (= lt!649153 (select (arr!48065 lt!649033) lt!649030))))

(assert (=> d!156701 (validMask!0 mask!2687)))

(assert (=> d!156701 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649030 lt!649031 lt!649033 mask!2687) lt!649152)))

(declare-fun b!1488347 () Bool)

(assert (=> b!1488347 (= e!834248 (bvsge (x!133205 lt!649152) #b01111111111111111111111111111110))))

(declare-fun b!1488348 () Bool)

(assert (=> b!1488348 (and (bvsge (index!51614 lt!649152) #b00000000000000000000000000000000) (bvslt (index!51614 lt!649152) (size!48615 lt!649033)))))

(assert (=> b!1488348 (= e!834246 (= (select (arr!48065 lt!649033) (index!51614 lt!649152)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1488349 () Bool)

(assert (=> b!1488349 (and (bvsge (index!51614 lt!649152) #b00000000000000000000000000000000) (bvslt (index!51614 lt!649152) (size!48615 lt!649033)))))

(declare-fun res!1012128 () Bool)

(assert (=> b!1488349 (= res!1012128 (= (select (arr!48065 lt!649033) (index!51614 lt!649152)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488349 (=> res!1012128 e!834246)))

(declare-fun b!1488350 () Bool)

(assert (=> b!1488350 (= e!834244 (Intermediate!12305 true lt!649030 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1488351 () Bool)

(assert (=> b!1488351 (= e!834247 (Intermediate!12305 false lt!649030 (bvadd #b00000000000000000000000000000001 x!665)))))

(assert (= (and d!156701 c!137636) b!1488350))

(assert (= (and d!156701 (not c!137636)) b!1488344))

(assert (= (and b!1488344 c!137637) b!1488351))

(assert (= (and b!1488344 (not c!137637)) b!1488346))

(assert (= (and d!156701 c!137635) b!1488347))

(assert (= (and d!156701 (not c!137635)) b!1488345))

(assert (= (and b!1488345 res!1012126) b!1488343))

(assert (= (and b!1488343 (not res!1012127)) b!1488349))

(assert (= (and b!1488349 (not res!1012128)) b!1488348))

(declare-fun m!1372801 () Bool)

(assert (=> b!1488346 m!1372801))

(assert (=> b!1488346 m!1372801))

(declare-fun m!1372803 () Bool)

(assert (=> b!1488346 m!1372803))

(declare-fun m!1372805 () Bool)

(assert (=> b!1488348 m!1372805))

(assert (=> b!1488349 m!1372805))

(declare-fun m!1372807 () Bool)

(assert (=> d!156701 m!1372807))

(assert (=> d!156701 m!1372557))

(assert (=> b!1488343 m!1372805))

(assert (=> b!1488023 d!156701))

(declare-fun d!156705 () Bool)

(declare-fun lt!649159 () (_ BitVec 32))

(assert (=> d!156705 (and (bvsge lt!649159 #b00000000000000000000000000000000) (bvslt lt!649159 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!156705 (= lt!649159 (choose!52 index!646 x!665 mask!2687))))

(assert (=> d!156705 (validMask!0 mask!2687)))

(assert (=> d!156705 (= (nextIndex!0 index!646 x!665 mask!2687) lt!649159)))

(declare-fun bs!42795 () Bool)

(assert (= bs!42795 d!156705))

(declare-fun m!1372815 () Bool)

(assert (=> bs!42795 m!1372815))

(assert (=> bs!42795 m!1372557))

(assert (=> b!1488012 d!156705))

(declare-fun b!1488401 () Bool)

(declare-fun c!137658 () Bool)

(declare-fun lt!649176 () (_ BitVec 64))

(assert (=> b!1488401 (= c!137658 (= lt!649176 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!834279 () SeekEntryResult!12305)

(declare-fun e!834280 () SeekEntryResult!12305)

(assert (=> b!1488401 (= e!834279 e!834280)))

(declare-fun b!1488402 () Bool)

(declare-fun e!834281 () SeekEntryResult!12305)

(assert (=> b!1488402 (= e!834281 e!834279)))

(declare-fun c!137657 () Bool)

(assert (=> b!1488402 (= c!137657 (= lt!649176 lt!649031))))

(declare-fun b!1488403 () Bool)

(assert (=> b!1488403 (= e!834281 Undefined!12305)))

(declare-fun lt!649177 () SeekEntryResult!12305)

(declare-fun d!156709 () Bool)

(assert (=> d!156709 (and (or (is-Undefined!12305 lt!649177) (not (is-Found!12305 lt!649177)) (and (bvsge (index!51613 lt!649177) #b00000000000000000000000000000000) (bvslt (index!51613 lt!649177) (size!48615 lt!649033)))) (or (is-Undefined!12305 lt!649177) (is-Found!12305 lt!649177) (not (is-MissingVacant!12305 lt!649177)) (not (= (index!51615 lt!649177) intermediateAfterIndex!19)) (and (bvsge (index!51615 lt!649177) #b00000000000000000000000000000000) (bvslt (index!51615 lt!649177) (size!48615 lt!649033)))) (or (is-Undefined!12305 lt!649177) (ite (is-Found!12305 lt!649177) (= (select (arr!48065 lt!649033) (index!51613 lt!649177)) lt!649031) (and (is-MissingVacant!12305 lt!649177) (= (index!51615 lt!649177) intermediateAfterIndex!19) (= (select (arr!48065 lt!649033) (index!51615 lt!649177)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!156709 (= lt!649177 e!834281)))

(declare-fun c!137659 () Bool)

(assert (=> d!156709 (= c!137659 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156709 (= lt!649176 (select (arr!48065 lt!649033) index!646))))

(assert (=> d!156709 (validMask!0 mask!2687)))

(assert (=> d!156709 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649031 lt!649033 mask!2687) lt!649177)))

(declare-fun b!1488404 () Bool)

(assert (=> b!1488404 (= e!834279 (Found!12305 index!646))))

(declare-fun b!1488405 () Bool)

(assert (=> b!1488405 (= e!834280 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!649031 lt!649033 mask!2687))))

(declare-fun b!1488406 () Bool)

(assert (=> b!1488406 (= e!834280 (MissingVacant!12305 intermediateAfterIndex!19))))

(assert (= (and d!156709 c!137659) b!1488403))

(assert (= (and d!156709 (not c!137659)) b!1488402))

(assert (= (and b!1488402 c!137657) b!1488404))

(assert (= (and b!1488402 (not c!137657)) b!1488401))

(assert (= (and b!1488401 c!137658) b!1488406))

(assert (= (and b!1488401 (not c!137658)) b!1488405))

(declare-fun m!1372833 () Bool)

(assert (=> d!156709 m!1372833))

(declare-fun m!1372835 () Bool)

(assert (=> d!156709 m!1372835))

(declare-fun m!1372837 () Bool)

(assert (=> d!156709 m!1372837))

(assert (=> d!156709 m!1372557))

(assert (=> b!1488405 m!1372543))

(assert (=> b!1488405 m!1372543))

(declare-fun m!1372839 () Bool)

(assert (=> b!1488405 m!1372839))

(assert (=> b!1488012 d!156709))

(declare-fun d!156719 () Bool)

(declare-fun lt!649196 () SeekEntryResult!12305)

(assert (=> d!156719 (and (or (is-Undefined!12305 lt!649196) (not (is-Found!12305 lt!649196)) (and (bvsge (index!51613 lt!649196) #b00000000000000000000000000000000) (bvslt (index!51613 lt!649196) (size!48615 lt!649033)))) (or (is-Undefined!12305 lt!649196) (is-Found!12305 lt!649196) (not (is-MissingZero!12305 lt!649196)) (and (bvsge (index!51612 lt!649196) #b00000000000000000000000000000000) (bvslt (index!51612 lt!649196) (size!48615 lt!649033)))) (or (is-Undefined!12305 lt!649196) (is-Found!12305 lt!649196) (is-MissingZero!12305 lt!649196) (not (is-MissingVacant!12305 lt!649196)) (and (bvsge (index!51615 lt!649196) #b00000000000000000000000000000000) (bvslt (index!51615 lt!649196) (size!48615 lt!649033)))) (or (is-Undefined!12305 lt!649196) (ite (is-Found!12305 lt!649196) (= (select (arr!48065 lt!649033) (index!51613 lt!649196)) lt!649031) (ite (is-MissingZero!12305 lt!649196) (= (select (arr!48065 lt!649033) (index!51612 lt!649196)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12305 lt!649196) (= (select (arr!48065 lt!649033) (index!51615 lt!649196)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!834299 () SeekEntryResult!12305)

(assert (=> d!156719 (= lt!649196 e!834299)))

(declare-fun c!137671 () Bool)

(declare-fun lt!649198 () SeekEntryResult!12305)

(assert (=> d!156719 (= c!137671 (and (is-Intermediate!12305 lt!649198) (undefined!13117 lt!649198)))))

(assert (=> d!156719 (= lt!649198 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649031 mask!2687) lt!649031 lt!649033 mask!2687))))

(assert (=> d!156719 (validMask!0 mask!2687)))

(assert (=> d!156719 (= (seekEntryOrOpen!0 lt!649031 lt!649033 mask!2687) lt!649196)))

(declare-fun b!1488431 () Bool)

(declare-fun c!137669 () Bool)

(declare-fun lt!649197 () (_ BitVec 64))

(assert (=> b!1488431 (= c!137669 (= lt!649197 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!834298 () SeekEntryResult!12305)

(declare-fun e!834297 () SeekEntryResult!12305)

(assert (=> b!1488431 (= e!834298 e!834297)))

(declare-fun b!1488432 () Bool)

(assert (=> b!1488432 (= e!834299 e!834298)))

(assert (=> b!1488432 (= lt!649197 (select (arr!48065 lt!649033) (index!51614 lt!649198)))))

(declare-fun c!137670 () Bool)

(assert (=> b!1488432 (= c!137670 (= lt!649197 lt!649031))))

(declare-fun b!1488433 () Bool)

(assert (=> b!1488433 (= e!834299 Undefined!12305)))

(declare-fun b!1488434 () Bool)

(assert (=> b!1488434 (= e!834297 (MissingZero!12305 (index!51614 lt!649198)))))

(declare-fun b!1488435 () Bool)

(assert (=> b!1488435 (= e!834298 (Found!12305 (index!51614 lt!649198)))))

(declare-fun b!1488436 () Bool)

(assert (=> b!1488436 (= e!834297 (seekKeyOrZeroReturnVacant!0 (x!133205 lt!649198) (index!51614 lt!649198) (index!51614 lt!649198) lt!649031 lt!649033 mask!2687))))

(assert (= (and d!156719 c!137671) b!1488433))

(assert (= (and d!156719 (not c!137671)) b!1488432))

(assert (= (and b!1488432 c!137670) b!1488435))

(assert (= (and b!1488432 (not c!137670)) b!1488431))

(assert (= (and b!1488431 c!137669) b!1488434))

(assert (= (and b!1488431 (not c!137669)) b!1488436))

(assert (=> d!156719 m!1372545))

(assert (=> d!156719 m!1372547))

(declare-fun m!1372855 () Bool)

(assert (=> d!156719 m!1372855))

(assert (=> d!156719 m!1372545))

(declare-fun m!1372857 () Bool)

(assert (=> d!156719 m!1372857))

(assert (=> d!156719 m!1372557))

(declare-fun m!1372859 () Bool)

(assert (=> d!156719 m!1372859))

(declare-fun m!1372861 () Bool)

(assert (=> b!1488432 m!1372861))

(declare-fun m!1372863 () Bool)

(assert (=> b!1488436 m!1372863))

(assert (=> b!1488012 d!156719))

(assert (=> b!1488010 d!156709))

(assert (=> b!1488010 d!156719))

(declare-fun d!156725 () Bool)

(declare-fun res!1012157 () Bool)

(declare-fun e!834329 () Bool)

(assert (=> d!156725 (=> res!1012157 e!834329)))

(assert (=> d!156725 (= res!1012157 (bvsge j!93 (size!48615 a!2862)))))

(assert (=> d!156725 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!834329)))

(declare-fun bm!67925 () Bool)

(declare-fun call!67928 () Bool)

(assert (=> bm!67925 (= call!67928 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1488487 () Bool)

(declare-fun e!834328 () Bool)

(assert (=> b!1488487 (= e!834328 call!67928)))

(declare-fun b!1488488 () Bool)

(declare-fun e!834330 () Bool)

(assert (=> b!1488488 (= e!834330 call!67928)))

(declare-fun b!1488489 () Bool)

(assert (=> b!1488489 (= e!834330 e!834328)))

(declare-fun lt!649219 () (_ BitVec 64))

(assert (=> b!1488489 (= lt!649219 (select (arr!48065 a!2862) j!93))))

(declare-fun lt!649220 () Unit!49950)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99584 (_ BitVec 64) (_ BitVec 32)) Unit!49950)

(assert (=> b!1488489 (= lt!649220 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!649219 j!93))))

(declare-fun arrayContainsKey!0 (array!99584 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1488489 (arrayContainsKey!0 a!2862 lt!649219 #b00000000000000000000000000000000)))

(declare-fun lt!649218 () Unit!49950)

(assert (=> b!1488489 (= lt!649218 lt!649220)))

(declare-fun res!1012156 () Bool)

(assert (=> b!1488489 (= res!1012156 (= (seekEntryOrOpen!0 (select (arr!48065 a!2862) j!93) a!2862 mask!2687) (Found!12305 j!93)))))

(assert (=> b!1488489 (=> (not res!1012156) (not e!834328))))

(declare-fun b!1488490 () Bool)

(assert (=> b!1488490 (= e!834329 e!834330)))

(declare-fun c!137692 () Bool)

(assert (=> b!1488490 (= c!137692 (validKeyInArray!0 (select (arr!48065 a!2862) j!93)))))

(assert (= (and d!156725 (not res!1012157)) b!1488490))

(assert (= (and b!1488490 c!137692) b!1488489))

(assert (= (and b!1488490 (not c!137692)) b!1488488))

(assert (= (and b!1488489 res!1012156) b!1488487))

(assert (= (or b!1488487 b!1488488) bm!67925))

(declare-fun m!1372889 () Bool)

(assert (=> bm!67925 m!1372889))

(assert (=> b!1488489 m!1372533))

(declare-fun m!1372893 () Bool)

(assert (=> b!1488489 m!1372893))

(declare-fun m!1372897 () Bool)

(assert (=> b!1488489 m!1372897))

(assert (=> b!1488489 m!1372533))

(assert (=> b!1488489 m!1372577))

(assert (=> b!1488490 m!1372533))

(assert (=> b!1488490 m!1372533))

(assert (=> b!1488490 m!1372551))

(assert (=> b!1488011 d!156725))

(declare-fun d!156735 () Bool)

(assert (=> d!156735 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!649227 () Unit!49950)

(declare-fun choose!38 (array!99584 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49950)

(assert (=> d!156735 (= lt!649227 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!156735 (validMask!0 mask!2687)))

(assert (=> d!156735 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!649227)))

(declare-fun bs!42798 () Bool)

(assert (= bs!42798 d!156735))

(assert (=> bs!42798 m!1372569))

(declare-fun m!1372911 () Bool)

(assert (=> bs!42798 m!1372911))

(assert (=> bs!42798 m!1372557))

(assert (=> b!1488011 d!156735))

(declare-fun b!1488523 () Bool)

(declare-fun e!834355 () Bool)

(declare-fun call!67932 () Bool)

(assert (=> b!1488523 (= e!834355 call!67932)))

(declare-fun b!1488524 () Bool)

(declare-fun e!834352 () Bool)

(declare-fun contains!9923 (List!34566 (_ BitVec 64)) Bool)

(assert (=> b!1488524 (= e!834352 (contains!9923 Nil!34563 (select (arr!48065 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1488525 () Bool)

(declare-fun e!834354 () Bool)

(assert (=> b!1488525 (= e!834354 e!834355)))

(declare-fun c!137702 () Bool)

(assert (=> b!1488525 (= c!137702 (validKeyInArray!0 (select (arr!48065 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!156743 () Bool)

(declare-fun res!1012175 () Bool)

(declare-fun e!834353 () Bool)

(assert (=> d!156743 (=> res!1012175 e!834353)))

(assert (=> d!156743 (= res!1012175 (bvsge #b00000000000000000000000000000000 (size!48615 a!2862)))))

(assert (=> d!156743 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34563) e!834353)))

(declare-fun b!1488526 () Bool)

(assert (=> b!1488526 (= e!834355 call!67932)))

(declare-fun bm!67929 () Bool)

(assert (=> bm!67929 (= call!67932 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!137702 (Cons!34562 (select (arr!48065 a!2862) #b00000000000000000000000000000000) Nil!34563) Nil!34563)))))

(declare-fun b!1488527 () Bool)

(assert (=> b!1488527 (= e!834353 e!834354)))

(declare-fun res!1012174 () Bool)

(assert (=> b!1488527 (=> (not res!1012174) (not e!834354))))

(assert (=> b!1488527 (= res!1012174 (not e!834352))))

(declare-fun res!1012173 () Bool)

(assert (=> b!1488527 (=> (not res!1012173) (not e!834352))))

(assert (=> b!1488527 (= res!1012173 (validKeyInArray!0 (select (arr!48065 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!156743 (not res!1012175)) b!1488527))

(assert (= (and b!1488527 res!1012173) b!1488524))

(assert (= (and b!1488527 res!1012174) b!1488525))

(assert (= (and b!1488525 c!137702) b!1488523))

(assert (= (and b!1488525 (not c!137702)) b!1488526))

(assert (= (or b!1488523 b!1488526) bm!67929))

(declare-fun m!1372919 () Bool)

(assert (=> b!1488524 m!1372919))

(assert (=> b!1488524 m!1372919))

(declare-fun m!1372921 () Bool)

(assert (=> b!1488524 m!1372921))

(assert (=> b!1488525 m!1372919))

(assert (=> b!1488525 m!1372919))

(declare-fun m!1372923 () Bool)

(assert (=> b!1488525 m!1372923))

(assert (=> bm!67929 m!1372919))

(declare-fun m!1372925 () Bool)

(assert (=> bm!67929 m!1372925))

(assert (=> b!1488527 m!1372919))

(assert (=> b!1488527 m!1372919))

(assert (=> b!1488527 m!1372923))

(assert (=> b!1488014 d!156743))

(declare-fun d!156749 () Bool)

(declare-fun lt!649237 () SeekEntryResult!12305)

(assert (=> d!156749 (and (or (is-Undefined!12305 lt!649237) (not (is-Found!12305 lt!649237)) (and (bvsge (index!51613 lt!649237) #b00000000000000000000000000000000) (bvslt (index!51613 lt!649237) (size!48615 a!2862)))) (or (is-Undefined!12305 lt!649237) (is-Found!12305 lt!649237) (not (is-MissingZero!12305 lt!649237)) (and (bvsge (index!51612 lt!649237) #b00000000000000000000000000000000) (bvslt (index!51612 lt!649237) (size!48615 a!2862)))) (or (is-Undefined!12305 lt!649237) (is-Found!12305 lt!649237) (is-MissingZero!12305 lt!649237) (not (is-MissingVacant!12305 lt!649237)) (and (bvsge (index!51615 lt!649237) #b00000000000000000000000000000000) (bvslt (index!51615 lt!649237) (size!48615 a!2862)))) (or (is-Undefined!12305 lt!649237) (ite (is-Found!12305 lt!649237) (= (select (arr!48065 a!2862) (index!51613 lt!649237)) (select (arr!48065 a!2862) j!93)) (ite (is-MissingZero!12305 lt!649237) (= (select (arr!48065 a!2862) (index!51612 lt!649237)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12305 lt!649237) (= (select (arr!48065 a!2862) (index!51615 lt!649237)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!834358 () SeekEntryResult!12305)

(assert (=> d!156749 (= lt!649237 e!834358)))

(declare-fun c!137705 () Bool)

(declare-fun lt!649239 () SeekEntryResult!12305)

(assert (=> d!156749 (= c!137705 (and (is-Intermediate!12305 lt!649239) (undefined!13117 lt!649239)))))

(assert (=> d!156749 (= lt!649239 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48065 a!2862) j!93) mask!2687) (select (arr!48065 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!156749 (validMask!0 mask!2687)))

(assert (=> d!156749 (= (seekEntryOrOpen!0 (select (arr!48065 a!2862) j!93) a!2862 mask!2687) lt!649237)))

(declare-fun b!1488528 () Bool)

(declare-fun c!137703 () Bool)

(declare-fun lt!649238 () (_ BitVec 64))

(assert (=> b!1488528 (= c!137703 (= lt!649238 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!834357 () SeekEntryResult!12305)

(declare-fun e!834356 () SeekEntryResult!12305)

(assert (=> b!1488528 (= e!834357 e!834356)))

(declare-fun b!1488529 () Bool)

(assert (=> b!1488529 (= e!834358 e!834357)))

(assert (=> b!1488529 (= lt!649238 (select (arr!48065 a!2862) (index!51614 lt!649239)))))

(declare-fun c!137704 () Bool)

(assert (=> b!1488529 (= c!137704 (= lt!649238 (select (arr!48065 a!2862) j!93)))))

(declare-fun b!1488530 () Bool)

(assert (=> b!1488530 (= e!834358 Undefined!12305)))

(declare-fun b!1488531 () Bool)

(assert (=> b!1488531 (= e!834356 (MissingZero!12305 (index!51614 lt!649239)))))

(declare-fun b!1488532 () Bool)

(assert (=> b!1488532 (= e!834357 (Found!12305 (index!51614 lt!649239)))))

(declare-fun b!1488533 () Bool)

(assert (=> b!1488533 (= e!834356 (seekKeyOrZeroReturnVacant!0 (x!133205 lt!649239) (index!51614 lt!649239) (index!51614 lt!649239) (select (arr!48065 a!2862) j!93) a!2862 mask!2687))))

(assert (= (and d!156749 c!137705) b!1488530))

(assert (= (and d!156749 (not c!137705)) b!1488529))

(assert (= (and b!1488529 c!137704) b!1488532))

(assert (= (and b!1488529 (not c!137704)) b!1488528))

(assert (= (and b!1488528 c!137703) b!1488531))

(assert (= (and b!1488528 (not c!137703)) b!1488533))

(assert (=> d!156749 m!1372553))

(assert (=> d!156749 m!1372533))

(assert (=> d!156749 m!1372555))

(declare-fun m!1372927 () Bool)

(assert (=> d!156749 m!1372927))

(assert (=> d!156749 m!1372533))

(assert (=> d!156749 m!1372553))

(declare-fun m!1372929 () Bool)

(assert (=> d!156749 m!1372929))

(assert (=> d!156749 m!1372557))

(declare-fun m!1372931 () Bool)

(assert (=> d!156749 m!1372931))

(declare-fun m!1372933 () Bool)

(assert (=> b!1488529 m!1372933))

(assert (=> b!1488533 m!1372533))

(declare-fun m!1372937 () Bool)

(assert (=> b!1488533 m!1372937))

(assert (=> b!1488015 d!156749))

(declare-fun d!156751 () Bool)

(assert (=> d!156751 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!126748 d!156751))

(declare-fun d!156757 () Bool)

(assert (=> d!156757 (= (array_inv!37093 a!2862) (bvsge (size!48615 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!126748 d!156757))

(declare-fun d!156759 () Bool)

(assert (=> d!156759 (= (validKeyInArray!0 (select (arr!48065 a!2862) j!93)) (and (not (= (select (arr!48065 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48065 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1488004 d!156759))

(declare-fun b!1488541 () Bool)

(declare-fun c!137711 () Bool)

(declare-fun lt!649245 () (_ BitVec 64))

(assert (=> b!1488541 (= c!137711 (= lt!649245 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!834365 () SeekEntryResult!12305)

(declare-fun e!834368 () SeekEntryResult!12305)

(assert (=> b!1488541 (= e!834365 e!834368)))

(declare-fun b!1488543 () Bool)

(declare-fun e!834369 () SeekEntryResult!12305)

(assert (=> b!1488543 (= e!834369 e!834365)))

(declare-fun c!137710 () Bool)

(assert (=> b!1488543 (= c!137710 (= lt!649245 lt!649031))))

(declare-fun b!1488545 () Bool)

(assert (=> b!1488545 (= e!834369 Undefined!12305)))

(declare-fun lt!649248 () SeekEntryResult!12305)

(declare-fun d!156765 () Bool)

(assert (=> d!156765 (and (or (is-Undefined!12305 lt!649248) (not (is-Found!12305 lt!649248)) (and (bvsge (index!51613 lt!649248) #b00000000000000000000000000000000) (bvslt (index!51613 lt!649248) (size!48615 lt!649033)))) (or (is-Undefined!12305 lt!649248) (is-Found!12305 lt!649248) (not (is-MissingVacant!12305 lt!649248)) (not (= (index!51615 lt!649248) intermediateAfterIndex!19)) (and (bvsge (index!51615 lt!649248) #b00000000000000000000000000000000) (bvslt (index!51615 lt!649248) (size!48615 lt!649033)))) (or (is-Undefined!12305 lt!649248) (ite (is-Found!12305 lt!649248) (= (select (arr!48065 lt!649033) (index!51613 lt!649248)) lt!649031) (and (is-MissingVacant!12305 lt!649248) (= (index!51615 lt!649248) intermediateAfterIndex!19) (= (select (arr!48065 lt!649033) (index!51615 lt!649248)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!156765 (= lt!649248 e!834369)))

(declare-fun c!137714 () Bool)

(assert (=> d!156765 (= c!137714 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(assert (=> d!156765 (= lt!649245 (select (arr!48065 lt!649033) lt!649030))))

(assert (=> d!156765 (validMask!0 mask!2687)))

(assert (=> d!156765 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649030 intermediateAfterIndex!19 lt!649031 lt!649033 mask!2687) lt!649248)))

(declare-fun b!1488547 () Bool)

(assert (=> b!1488547 (= e!834365 (Found!12305 lt!649030))))

(declare-fun b!1488549 () Bool)

(assert (=> b!1488549 (= e!834368 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!649030 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) intermediateAfterIndex!19 lt!649031 lt!649033 mask!2687))))

(declare-fun b!1488551 () Bool)

(assert (=> b!1488551 (= e!834368 (MissingVacant!12305 intermediateAfterIndex!19))))

(assert (= (and d!156765 c!137714) b!1488545))

(assert (= (and d!156765 (not c!137714)) b!1488543))

(assert (= (and b!1488543 c!137710) b!1488547))

(assert (= (and b!1488543 (not c!137710)) b!1488541))

(assert (= (and b!1488541 c!137711) b!1488551))

(assert (= (and b!1488541 (not c!137711)) b!1488549))

(declare-fun m!1372945 () Bool)

(assert (=> d!156765 m!1372945))

(declare-fun m!1372947 () Bool)

(assert (=> d!156765 m!1372947))

(assert (=> d!156765 m!1372807))

(assert (=> d!156765 m!1372557))

(assert (=> b!1488549 m!1372801))

(assert (=> b!1488549 m!1372801))

(declare-fun m!1372951 () Bool)

(assert (=> b!1488549 m!1372951))

(assert (=> b!1488003 d!156765))

(declare-fun d!156767 () Bool)

(declare-fun res!1012180 () Bool)

(declare-fun e!834371 () Bool)

(assert (=> d!156767 (=> res!1012180 e!834371)))

(assert (=> d!156767 (= res!1012180 (bvsge #b00000000000000000000000000000000 (size!48615 a!2862)))))

(assert (=> d!156767 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!834371)))

(declare-fun bm!67930 () Bool)

(declare-fun call!67933 () Bool)

(assert (=> bm!67930 (= call!67933 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1488555 () Bool)

(declare-fun e!834370 () Bool)

(assert (=> b!1488555 (= e!834370 call!67933)))

(declare-fun b!1488556 () Bool)

(declare-fun e!834372 () Bool)

(assert (=> b!1488556 (= e!834372 call!67933)))

(declare-fun b!1488557 () Bool)

(assert (=> b!1488557 (= e!834372 e!834370)))

(declare-fun lt!649250 () (_ BitVec 64))

(assert (=> b!1488557 (= lt!649250 (select (arr!48065 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!649251 () Unit!49950)

(assert (=> b!1488557 (= lt!649251 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!649250 #b00000000000000000000000000000000))))

(assert (=> b!1488557 (arrayContainsKey!0 a!2862 lt!649250 #b00000000000000000000000000000000)))

(declare-fun lt!649249 () Unit!49950)

(assert (=> b!1488557 (= lt!649249 lt!649251)))

(declare-fun res!1012179 () Bool)

(assert (=> b!1488557 (= res!1012179 (= (seekEntryOrOpen!0 (select (arr!48065 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12305 #b00000000000000000000000000000000)))))

(assert (=> b!1488557 (=> (not res!1012179) (not e!834370))))

(declare-fun b!1488558 () Bool)

(assert (=> b!1488558 (= e!834371 e!834372)))

(declare-fun c!137715 () Bool)

(assert (=> b!1488558 (= c!137715 (validKeyInArray!0 (select (arr!48065 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!156767 (not res!1012180)) b!1488558))

(assert (= (and b!1488558 c!137715) b!1488557))

(assert (= (and b!1488558 (not c!137715)) b!1488556))

(assert (= (and b!1488557 res!1012179) b!1488555))

(assert (= (or b!1488555 b!1488556) bm!67930))

(declare-fun m!1372959 () Bool)

(assert (=> bm!67930 m!1372959))

(assert (=> b!1488557 m!1372919))

(declare-fun m!1372961 () Bool)

(assert (=> b!1488557 m!1372961))

(declare-fun m!1372963 () Bool)

(assert (=> b!1488557 m!1372963))

(assert (=> b!1488557 m!1372919))

(declare-fun m!1372965 () Bool)

(assert (=> b!1488557 m!1372965))

(assert (=> b!1488558 m!1372919))

(assert (=> b!1488558 m!1372919))

(assert (=> b!1488558 m!1372923))

(assert (=> b!1488007 d!156767))

(declare-fun d!156773 () Bool)

(assert (=> d!156773 (= (validKeyInArray!0 (select (arr!48065 a!2862) i!1006)) (and (not (= (select (arr!48065 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48065 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1488005 d!156773))

(declare-fun b!1488559 () Bool)

(declare-fun lt!649254 () SeekEntryResult!12305)

(assert (=> b!1488559 (and (bvsge (index!51614 lt!649254) #b00000000000000000000000000000000) (bvslt (index!51614 lt!649254) (size!48615 a!2862)))))

(declare-fun res!1012182 () Bool)

(assert (=> b!1488559 (= res!1012182 (= (select (arr!48065 a!2862) (index!51614 lt!649254)) (select (arr!48065 a!2862) j!93)))))

(declare-fun e!834375 () Bool)

(assert (=> b!1488559 (=> res!1012182 e!834375)))

(declare-fun e!834374 () Bool)

(assert (=> b!1488559 (= e!834374 e!834375)))

(declare-fun b!1488560 () Bool)

(declare-fun e!834373 () SeekEntryResult!12305)

(declare-fun e!834376 () SeekEntryResult!12305)

(assert (=> b!1488560 (= e!834373 e!834376)))

(declare-fun lt!649255 () (_ BitVec 64))

(declare-fun c!137718 () Bool)

(assert (=> b!1488560 (= c!137718 (or (= lt!649255 (select (arr!48065 a!2862) j!93)) (= (bvadd lt!649255 lt!649255) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1488561 () Bool)

(declare-fun e!834377 () Bool)

(assert (=> b!1488561 (= e!834377 e!834374)))

(declare-fun res!1012181 () Bool)

(assert (=> b!1488561 (= res!1012181 (and (is-Intermediate!12305 lt!649254) (not (undefined!13117 lt!649254)) (bvslt (x!133205 lt!649254) #b01111111111111111111111111111110) (bvsge (x!133205 lt!649254) #b00000000000000000000000000000000) (bvsge (x!133205 lt!649254) (bvadd #b00000000000000000000000000000001 x!665))))))

(assert (=> b!1488561 (=> (not res!1012181) (not e!834374))))

(declare-fun b!1488562 () Bool)

(assert (=> b!1488562 (= e!834376 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!649030 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) (select (arr!48065 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!156775 () Bool)

(assert (=> d!156775 e!834377))

(declare-fun c!137716 () Bool)

(assert (=> d!156775 (= c!137716 (and (is-Intermediate!12305 lt!649254) (undefined!13117 lt!649254)))))

(assert (=> d!156775 (= lt!649254 e!834373)))

(declare-fun c!137717 () Bool)

(assert (=> d!156775 (= c!137717 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(assert (=> d!156775 (= lt!649255 (select (arr!48065 a!2862) lt!649030))))

(assert (=> d!156775 (validMask!0 mask!2687)))

(assert (=> d!156775 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649030 (select (arr!48065 a!2862) j!93) a!2862 mask!2687) lt!649254)))

(declare-fun b!1488563 () Bool)

(assert (=> b!1488563 (= e!834377 (bvsge (x!133205 lt!649254) #b01111111111111111111111111111110))))

(declare-fun b!1488564 () Bool)

(assert (=> b!1488564 (and (bvsge (index!51614 lt!649254) #b00000000000000000000000000000000) (bvslt (index!51614 lt!649254) (size!48615 a!2862)))))

(assert (=> b!1488564 (= e!834375 (= (select (arr!48065 a!2862) (index!51614 lt!649254)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1488565 () Bool)

(assert (=> b!1488565 (and (bvsge (index!51614 lt!649254) #b00000000000000000000000000000000) (bvslt (index!51614 lt!649254) (size!48615 a!2862)))))

(declare-fun res!1012183 () Bool)

(assert (=> b!1488565 (= res!1012183 (= (select (arr!48065 a!2862) (index!51614 lt!649254)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488565 (=> res!1012183 e!834375)))

(declare-fun b!1488566 () Bool)

(assert (=> b!1488566 (= e!834373 (Intermediate!12305 true lt!649030 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1488567 () Bool)

(assert (=> b!1488567 (= e!834376 (Intermediate!12305 false lt!649030 (bvadd #b00000000000000000000000000000001 x!665)))))

(assert (= (and d!156775 c!137717) b!1488566))

(assert (= (and d!156775 (not c!137717)) b!1488560))

(assert (= (and b!1488560 c!137718) b!1488567))

(assert (= (and b!1488560 (not c!137718)) b!1488562))

(assert (= (and d!156775 c!137716) b!1488563))

(assert (= (and d!156775 (not c!137716)) b!1488561))

(assert (= (and b!1488561 res!1012181) b!1488559))

(assert (= (and b!1488559 (not res!1012182)) b!1488565))

(assert (= (and b!1488565 (not res!1012183)) b!1488564))

(assert (=> b!1488562 m!1372801))

(assert (=> b!1488562 m!1372801))

(assert (=> b!1488562 m!1372533))

(declare-fun m!1372967 () Bool)

(assert (=> b!1488562 m!1372967))

(declare-fun m!1372969 () Bool)

(assert (=> b!1488564 m!1372969))

(assert (=> b!1488565 m!1372969))

(declare-fun m!1372971 () Bool)

(assert (=> d!156775 m!1372971))

(assert (=> d!156775 m!1372557))

(assert (=> b!1488559 m!1372969))

(assert (=> b!1488009 d!156775))

(declare-fun b!1488568 () Bool)

(declare-fun lt!649256 () SeekEntryResult!12305)

(assert (=> b!1488568 (and (bvsge (index!51614 lt!649256) #b00000000000000000000000000000000) (bvslt (index!51614 lt!649256) (size!48615 lt!649033)))))

(declare-fun res!1012185 () Bool)

(assert (=> b!1488568 (= res!1012185 (= (select (arr!48065 lt!649033) (index!51614 lt!649256)) lt!649031))))

(declare-fun e!834380 () Bool)

(assert (=> b!1488568 (=> res!1012185 e!834380)))

(declare-fun e!834379 () Bool)

(assert (=> b!1488568 (= e!834379 e!834380)))

(declare-fun b!1488569 () Bool)

(declare-fun e!834378 () SeekEntryResult!12305)

(declare-fun e!834381 () SeekEntryResult!12305)

(assert (=> b!1488569 (= e!834378 e!834381)))

(declare-fun c!137721 () Bool)

(declare-fun lt!649257 () (_ BitVec 64))

(assert (=> b!1488569 (= c!137721 (or (= lt!649257 lt!649031) (= (bvadd lt!649257 lt!649257) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1488570 () Bool)

(declare-fun e!834382 () Bool)

(assert (=> b!1488570 (= e!834382 e!834379)))

(declare-fun res!1012184 () Bool)

(assert (=> b!1488570 (= res!1012184 (and (is-Intermediate!12305 lt!649256) (not (undefined!13117 lt!649256)) (bvslt (x!133205 lt!649256) #b01111111111111111111111111111110) (bvsge (x!133205 lt!649256) #b00000000000000000000000000000000) (bvsge (x!133205 lt!649256) #b00000000000000000000000000000000)))))

(assert (=> b!1488570 (=> (not res!1012184) (not e!834379))))

(declare-fun b!1488571 () Bool)

(assert (=> b!1488571 (= e!834381 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!649031 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!649031 lt!649033 mask!2687))))

(declare-fun d!156777 () Bool)

(assert (=> d!156777 e!834382))

(declare-fun c!137719 () Bool)

(assert (=> d!156777 (= c!137719 (and (is-Intermediate!12305 lt!649256) (undefined!13117 lt!649256)))))

(assert (=> d!156777 (= lt!649256 e!834378)))

(declare-fun c!137720 () Bool)

(assert (=> d!156777 (= c!137720 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!156777 (= lt!649257 (select (arr!48065 lt!649033) (toIndex!0 lt!649031 mask!2687)))))

(assert (=> d!156777 (validMask!0 mask!2687)))

(assert (=> d!156777 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649031 mask!2687) lt!649031 lt!649033 mask!2687) lt!649256)))

(declare-fun b!1488572 () Bool)

(assert (=> b!1488572 (= e!834382 (bvsge (x!133205 lt!649256) #b01111111111111111111111111111110))))

(declare-fun b!1488573 () Bool)

(assert (=> b!1488573 (and (bvsge (index!51614 lt!649256) #b00000000000000000000000000000000) (bvslt (index!51614 lt!649256) (size!48615 lt!649033)))))

(assert (=> b!1488573 (= e!834380 (= (select (arr!48065 lt!649033) (index!51614 lt!649256)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1488574 () Bool)

(assert (=> b!1488574 (and (bvsge (index!51614 lt!649256) #b00000000000000000000000000000000) (bvslt (index!51614 lt!649256) (size!48615 lt!649033)))))

(declare-fun res!1012186 () Bool)

(assert (=> b!1488574 (= res!1012186 (= (select (arr!48065 lt!649033) (index!51614 lt!649256)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488574 (=> res!1012186 e!834380)))

(declare-fun b!1488575 () Bool)

(assert (=> b!1488575 (= e!834378 (Intermediate!12305 true (toIndex!0 lt!649031 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1488576 () Bool)

(assert (=> b!1488576 (= e!834381 (Intermediate!12305 false (toIndex!0 lt!649031 mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!156777 c!137720) b!1488575))

(assert (= (and d!156777 (not c!137720)) b!1488569))

(assert (= (and b!1488569 c!137721) b!1488576))

(assert (= (and b!1488569 (not c!137721)) b!1488571))

(assert (= (and d!156777 c!137719) b!1488572))

(assert (= (and d!156777 (not c!137719)) b!1488570))

(assert (= (and b!1488570 res!1012184) b!1488568))

(assert (= (and b!1488568 (not res!1012185)) b!1488574))

(assert (= (and b!1488574 (not res!1012186)) b!1488573))

(assert (=> b!1488571 m!1372545))

(declare-fun m!1372973 () Bool)

(assert (=> b!1488571 m!1372973))

(assert (=> b!1488571 m!1372973))

(declare-fun m!1372975 () Bool)

(assert (=> b!1488571 m!1372975))

(declare-fun m!1372977 () Bool)

(assert (=> b!1488573 m!1372977))

(assert (=> b!1488574 m!1372977))

(assert (=> d!156777 m!1372545))

(declare-fun m!1372979 () Bool)

(assert (=> d!156777 m!1372979))

(assert (=> d!156777 m!1372557))

(assert (=> b!1488568 m!1372977))

(assert (=> b!1488020 d!156777))

(declare-fun d!156779 () Bool)

(declare-fun lt!649259 () (_ BitVec 32))

(declare-fun lt!649258 () (_ BitVec 32))

(assert (=> d!156779 (= lt!649259 (bvmul (bvxor lt!649258 (bvlshr lt!649258 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156779 (= lt!649258 ((_ extract 31 0) (bvand (bvxor lt!649031 (bvlshr lt!649031 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156779 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1012114 (let ((h!35946 ((_ extract 31 0) (bvand (bvxor lt!649031 (bvlshr lt!649031 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133214 (bvmul (bvxor h!35946 (bvlshr h!35946 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133214 (bvlshr x!133214 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1012114 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1012114 #b00000000000000000000000000000000))))))

(assert (=> d!156779 (= (toIndex!0 lt!649031 mask!2687) (bvand (bvxor lt!649259 (bvlshr lt!649259 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1488020 d!156779))

(declare-fun b!1488579 () Bool)

(declare-fun lt!649260 () SeekEntryResult!12305)

(assert (=> b!1488579 (and (bvsge (index!51614 lt!649260) #b00000000000000000000000000000000) (bvslt (index!51614 lt!649260) (size!48615 a!2862)))))

(declare-fun res!1012190 () Bool)

(assert (=> b!1488579 (= res!1012190 (= (select (arr!48065 a!2862) (index!51614 lt!649260)) (select (arr!48065 a!2862) j!93)))))

(declare-fun e!834389 () Bool)

(assert (=> b!1488579 (=> res!1012190 e!834389)))

(declare-fun e!834386 () Bool)

(assert (=> b!1488579 (= e!834386 e!834389)))

(declare-fun b!1488580 () Bool)

(declare-fun e!834385 () SeekEntryResult!12305)

(declare-fun e!834390 () SeekEntryResult!12305)

(assert (=> b!1488580 (= e!834385 e!834390)))

(declare-fun c!137724 () Bool)

(declare-fun lt!649261 () (_ BitVec 64))

(assert (=> b!1488580 (= c!137724 (or (= lt!649261 (select (arr!48065 a!2862) j!93)) (= (bvadd lt!649261 lt!649261) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1488581 () Bool)

(declare-fun e!834391 () Bool)

(assert (=> b!1488581 (= e!834391 e!834386)))

(declare-fun res!1012189 () Bool)

(assert (=> b!1488581 (= res!1012189 (and (is-Intermediate!12305 lt!649260) (not (undefined!13117 lt!649260)) (bvslt (x!133205 lt!649260) #b01111111111111111111111111111110) (bvsge (x!133205 lt!649260) #b00000000000000000000000000000000) (bvsge (x!133205 lt!649260) x!665)))))

(assert (=> b!1488581 (=> (not res!1012189) (not e!834386))))

(declare-fun b!1488582 () Bool)

(assert (=> b!1488582 (= e!834390 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!48065 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!156781 () Bool)

(assert (=> d!156781 e!834391))

(declare-fun c!137722 () Bool)

(assert (=> d!156781 (= c!137722 (and (is-Intermediate!12305 lt!649260) (undefined!13117 lt!649260)))))

(assert (=> d!156781 (= lt!649260 e!834385)))

(declare-fun c!137723 () Bool)

(assert (=> d!156781 (= c!137723 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156781 (= lt!649261 (select (arr!48065 a!2862) index!646))))

(assert (=> d!156781 (validMask!0 mask!2687)))

(assert (=> d!156781 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48065 a!2862) j!93) a!2862 mask!2687) lt!649260)))

(declare-fun b!1488583 () Bool)

(assert (=> b!1488583 (= e!834391 (bvsge (x!133205 lt!649260) #b01111111111111111111111111111110))))

(declare-fun b!1488584 () Bool)

(assert (=> b!1488584 (and (bvsge (index!51614 lt!649260) #b00000000000000000000000000000000) (bvslt (index!51614 lt!649260) (size!48615 a!2862)))))

(assert (=> b!1488584 (= e!834389 (= (select (arr!48065 a!2862) (index!51614 lt!649260)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1488585 () Bool)

(assert (=> b!1488585 (and (bvsge (index!51614 lt!649260) #b00000000000000000000000000000000) (bvslt (index!51614 lt!649260) (size!48615 a!2862)))))

(declare-fun res!1012191 () Bool)

(assert (=> b!1488585 (= res!1012191 (= (select (arr!48065 a!2862) (index!51614 lt!649260)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488585 (=> res!1012191 e!834389)))

(declare-fun b!1488586 () Bool)

(assert (=> b!1488586 (= e!834385 (Intermediate!12305 true index!646 x!665))))

(declare-fun b!1488587 () Bool)

(assert (=> b!1488587 (= e!834390 (Intermediate!12305 false index!646 x!665))))

(assert (= (and d!156781 c!137723) b!1488586))

(assert (= (and d!156781 (not c!137723)) b!1488580))

(assert (= (and b!1488580 c!137724) b!1488587))

(assert (= (and b!1488580 (not c!137724)) b!1488582))

(assert (= (and d!156781 c!137722) b!1488583))

(assert (= (and d!156781 (not c!137722)) b!1488581))

(assert (= (and b!1488581 res!1012189) b!1488579))

(assert (= (and b!1488579 (not res!1012190)) b!1488585))

(assert (= (and b!1488585 (not res!1012191)) b!1488584))

(assert (=> b!1488582 m!1372543))

(assert (=> b!1488582 m!1372543))

(assert (=> b!1488582 m!1372533))

(declare-fun m!1372981 () Bool)

(assert (=> b!1488582 m!1372981))

(declare-fun m!1372983 () Bool)

(assert (=> b!1488584 m!1372983))

(assert (=> b!1488585 m!1372983))

(assert (=> d!156781 m!1372531))

(assert (=> d!156781 m!1372557))

(assert (=> b!1488579 m!1372983))

(assert (=> b!1488018 d!156781))

(declare-fun b!1488596 () Bool)

(declare-fun lt!649262 () SeekEntryResult!12305)

(assert (=> b!1488596 (and (bvsge (index!51614 lt!649262) #b00000000000000000000000000000000) (bvslt (index!51614 lt!649262) (size!48615 lt!649033)))))

(declare-fun res!1012197 () Bool)

(assert (=> b!1488596 (= res!1012197 (= (select (arr!48065 lt!649033) (index!51614 lt!649262)) lt!649031))))

(declare-fun e!834398 () Bool)

(assert (=> b!1488596 (=> res!1012197 e!834398)))

(declare-fun e!834397 () Bool)

(assert (=> b!1488596 (= e!834397 e!834398)))

(declare-fun b!1488597 () Bool)

(declare-fun e!834396 () SeekEntryResult!12305)

(declare-fun e!834399 () SeekEntryResult!12305)

(assert (=> b!1488597 (= e!834396 e!834399)))

(declare-fun c!137729 () Bool)

(declare-fun lt!649263 () (_ BitVec 64))

(assert (=> b!1488597 (= c!137729 (or (= lt!649263 lt!649031) (= (bvadd lt!649263 lt!649263) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1488598 () Bool)

(declare-fun e!834400 () Bool)

(assert (=> b!1488598 (= e!834400 e!834397)))

(declare-fun res!1012196 () Bool)

(assert (=> b!1488598 (= res!1012196 (and (is-Intermediate!12305 lt!649262) (not (undefined!13117 lt!649262)) (bvslt (x!133205 lt!649262) #b01111111111111111111111111111110) (bvsge (x!133205 lt!649262) #b00000000000000000000000000000000) (bvsge (x!133205 lt!649262) x!665)))))

(assert (=> b!1488598 (=> (not res!1012196) (not e!834397))))

(declare-fun b!1488599 () Bool)

(assert (=> b!1488599 (= e!834399 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!649031 lt!649033 mask!2687))))

(declare-fun d!156783 () Bool)

(assert (=> d!156783 e!834400))

(declare-fun c!137727 () Bool)

(assert (=> d!156783 (= c!137727 (and (is-Intermediate!12305 lt!649262) (undefined!13117 lt!649262)))))

(assert (=> d!156783 (= lt!649262 e!834396)))

(declare-fun c!137728 () Bool)

(assert (=> d!156783 (= c!137728 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156783 (= lt!649263 (select (arr!48065 lt!649033) index!646))))

(assert (=> d!156783 (validMask!0 mask!2687)))

(assert (=> d!156783 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649031 lt!649033 mask!2687) lt!649262)))

(declare-fun b!1488600 () Bool)

(assert (=> b!1488600 (= e!834400 (bvsge (x!133205 lt!649262) #b01111111111111111111111111111110))))

(declare-fun b!1488601 () Bool)

(assert (=> b!1488601 (and (bvsge (index!51614 lt!649262) #b00000000000000000000000000000000) (bvslt (index!51614 lt!649262) (size!48615 lt!649033)))))

(assert (=> b!1488601 (= e!834398 (= (select (arr!48065 lt!649033) (index!51614 lt!649262)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1488602 () Bool)

(assert (=> b!1488602 (and (bvsge (index!51614 lt!649262) #b00000000000000000000000000000000) (bvslt (index!51614 lt!649262) (size!48615 lt!649033)))))

(declare-fun res!1012198 () Bool)

(assert (=> b!1488602 (= res!1012198 (= (select (arr!48065 lt!649033) (index!51614 lt!649262)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488602 (=> res!1012198 e!834398)))

(declare-fun b!1488603 () Bool)

(assert (=> b!1488603 (= e!834396 (Intermediate!12305 true index!646 x!665))))

(declare-fun b!1488604 () Bool)

(assert (=> b!1488604 (= e!834399 (Intermediate!12305 false index!646 x!665))))

(assert (= (and d!156783 c!137728) b!1488603))

(assert (= (and d!156783 (not c!137728)) b!1488597))

(assert (= (and b!1488597 c!137729) b!1488604))

(assert (= (and b!1488597 (not c!137729)) b!1488599))

(assert (= (and d!156783 c!137727) b!1488600))

(assert (= (and d!156783 (not c!137727)) b!1488598))

(assert (= (and b!1488598 res!1012196) b!1488596))

(assert (= (and b!1488596 (not res!1012197)) b!1488602))

(assert (= (and b!1488602 (not res!1012198)) b!1488601))

(assert (=> b!1488599 m!1372543))

(assert (=> b!1488599 m!1372543))

(declare-fun m!1372985 () Bool)

(assert (=> b!1488599 m!1372985))

(declare-fun m!1372987 () Bool)

(assert (=> b!1488601 m!1372987))

(assert (=> b!1488602 m!1372987))

(assert (=> d!156783 m!1372837))

(assert (=> d!156783 m!1372557))

(assert (=> b!1488596 m!1372987))

(assert (=> b!1488019 d!156783))

(push 1)

