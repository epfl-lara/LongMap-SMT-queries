; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126872 () Bool)

(assert start!126872)

(declare-fun b!1491337 () Bool)

(declare-fun e!835518 () Bool)

(declare-fun e!835523 () Bool)

(assert (=> b!1491337 (= e!835518 e!835523)))

(declare-fun res!1014715 () Bool)

(assert (=> b!1491337 (=> (not res!1014715) (not e!835523))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99643 0))(
  ( (array!99644 (arr!48094 (Array (_ BitVec 32) (_ BitVec 64))) (size!48646 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99643)

(assert (=> b!1491337 (= res!1014715 (= (select (store (arr!48094 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!650063 () array!99643)

(assert (=> b!1491337 (= lt!650063 (array!99644 (store (arr!48094 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48646 a!2862)))))

(declare-fun b!1491338 () Bool)

(declare-fun res!1014710 () Bool)

(declare-fun e!835521 () Bool)

(assert (=> b!1491338 (=> (not res!1014710) (not e!835521))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1491338 (= res!1014710 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1491339 () Bool)

(declare-fun res!1014704 () Bool)

(assert (=> b!1491339 (=> (not res!1014704) (not e!835518))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1491339 (= res!1014704 (validKeyInArray!0 (select (arr!48094 a!2862) j!93)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1491340 () Bool)

(declare-fun e!835520 () Bool)

(assert (=> b!1491340 (= e!835520 (or (= (select (arr!48094 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48094 a!2862) intermediateBeforeIndex!19) (select (arr!48094 a!2862) j!93))))))

(declare-fun b!1491341 () Bool)

(declare-fun e!835517 () Bool)

(assert (=> b!1491341 (= e!835523 e!835517)))

(declare-fun res!1014714 () Bool)

(assert (=> b!1491341 (=> (not res!1014714) (not e!835517))))

(declare-datatypes ((SeekEntryResult!12359 0))(
  ( (MissingZero!12359 (index!51828 (_ BitVec 32))) (Found!12359 (index!51829 (_ BitVec 32))) (Intermediate!12359 (undefined!13171 Bool) (index!51830 (_ BitVec 32)) (x!133408 (_ BitVec 32))) (Undefined!12359) (MissingVacant!12359 (index!51831 (_ BitVec 32))) )
))
(declare-fun lt!650061 () SeekEntryResult!12359)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99643 (_ BitVec 32)) SeekEntryResult!12359)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491341 (= res!1014714 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48094 a!2862) j!93) mask!2687) (select (arr!48094 a!2862) j!93) a!2862 mask!2687) lt!650061))))

(assert (=> b!1491341 (= lt!650061 (Intermediate!12359 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1491342 () Bool)

(declare-fun res!1014703 () Bool)

(assert (=> b!1491342 (=> (not res!1014703) (not e!835518))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1491342 (= res!1014703 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48646 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48646 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48646 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1491344 () Bool)

(declare-fun res!1014711 () Bool)

(assert (=> b!1491344 (=> (not res!1014711) (not e!835521))))

(declare-fun e!835519 () Bool)

(assert (=> b!1491344 (= res!1014711 e!835519)))

(declare-fun c!137848 () Bool)

(assert (=> b!1491344 (= c!137848 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1491345 () Bool)

(assert (=> b!1491345 (= e!835517 e!835521)))

(declare-fun res!1014702 () Bool)

(assert (=> b!1491345 (=> (not res!1014702) (not e!835521))))

(declare-fun lt!650064 () SeekEntryResult!12359)

(assert (=> b!1491345 (= res!1014702 (= lt!650064 (Intermediate!12359 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!650062 () (_ BitVec 64))

(assert (=> b!1491345 (= lt!650064 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650062 mask!2687) lt!650062 lt!650063 mask!2687))))

(assert (=> b!1491345 (= lt!650062 (select (store (arr!48094 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1491346 () Bool)

(assert (=> b!1491346 (= e!835519 (= lt!650064 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650062 lt!650063 mask!2687)))))

(declare-fun b!1491347 () Bool)

(declare-fun e!835522 () Bool)

(assert (=> b!1491347 (= e!835522 true)))

(declare-fun lt!650066 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491347 (= lt!650066 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1491348 () Bool)

(declare-fun res!1014709 () Bool)

(assert (=> b!1491348 (=> (not res!1014709) (not e!835517))))

(assert (=> b!1491348 (= res!1014709 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48094 a!2862) j!93) a!2862 mask!2687) lt!650061))))

(declare-fun b!1491349 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99643 (_ BitVec 32)) SeekEntryResult!12359)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99643 (_ BitVec 32)) SeekEntryResult!12359)

(assert (=> b!1491349 (= e!835519 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650062 lt!650063 mask!2687) (seekEntryOrOpen!0 lt!650062 lt!650063 mask!2687)))))

(declare-fun b!1491350 () Bool)

(declare-fun res!1014705 () Bool)

(assert (=> b!1491350 (=> (not res!1014705) (not e!835518))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99643 (_ BitVec 32)) Bool)

(assert (=> b!1491350 (= res!1014705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1491351 () Bool)

(declare-fun res!1014700 () Bool)

(assert (=> b!1491351 (=> (not res!1014700) (not e!835518))))

(assert (=> b!1491351 (= res!1014700 (and (= (size!48646 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48646 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48646 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1491352 () Bool)

(assert (=> b!1491352 (= e!835521 (not e!835522))))

(declare-fun res!1014708 () Bool)

(assert (=> b!1491352 (=> res!1014708 e!835522)))

(assert (=> b!1491352 (= res!1014708 (or (and (= (select (arr!48094 a!2862) index!646) (select (store (arr!48094 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48094 a!2862) index!646) (select (arr!48094 a!2862) j!93))) (= (select (arr!48094 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1491352 e!835520))

(declare-fun res!1014713 () Bool)

(assert (=> b!1491352 (=> (not res!1014713) (not e!835520))))

(assert (=> b!1491352 (= res!1014713 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49899 0))(
  ( (Unit!49900) )
))
(declare-fun lt!650065 () Unit!49899)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99643 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49899)

(assert (=> b!1491352 (= lt!650065 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!1014707 () Bool)

(assert (=> start!126872 (=> (not res!1014707) (not e!835518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126872 (= res!1014707 (validMask!0 mask!2687))))

(assert (=> start!126872 e!835518))

(assert (=> start!126872 true))

(declare-fun array_inv!37327 (array!99643) Bool)

(assert (=> start!126872 (array_inv!37327 a!2862)))

(declare-fun b!1491343 () Bool)

(declare-fun res!1014712 () Bool)

(assert (=> b!1491343 (=> (not res!1014712) (not e!835518))))

(assert (=> b!1491343 (= res!1014712 (validKeyInArray!0 (select (arr!48094 a!2862) i!1006)))))

(declare-fun b!1491353 () Bool)

(declare-fun res!1014701 () Bool)

(assert (=> b!1491353 (=> (not res!1014701) (not e!835520))))

(assert (=> b!1491353 (= res!1014701 (= (seekEntryOrOpen!0 (select (arr!48094 a!2862) j!93) a!2862 mask!2687) (Found!12359 j!93)))))

(declare-fun b!1491354 () Bool)

(declare-fun res!1014706 () Bool)

(assert (=> b!1491354 (=> (not res!1014706) (not e!835518))))

(declare-datatypes ((List!34673 0))(
  ( (Nil!34670) (Cons!34669 (h!36052 (_ BitVec 64)) (t!49359 List!34673)) )
))
(declare-fun arrayNoDuplicates!0 (array!99643 (_ BitVec 32) List!34673) Bool)

(assert (=> b!1491354 (= res!1014706 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34670))))

(assert (= (and start!126872 res!1014707) b!1491351))

(assert (= (and b!1491351 res!1014700) b!1491343))

(assert (= (and b!1491343 res!1014712) b!1491339))

(assert (= (and b!1491339 res!1014704) b!1491350))

(assert (= (and b!1491350 res!1014705) b!1491354))

(assert (= (and b!1491354 res!1014706) b!1491342))

(assert (= (and b!1491342 res!1014703) b!1491337))

(assert (= (and b!1491337 res!1014715) b!1491341))

(assert (= (and b!1491341 res!1014714) b!1491348))

(assert (= (and b!1491348 res!1014709) b!1491345))

(assert (= (and b!1491345 res!1014702) b!1491344))

(assert (= (and b!1491344 c!137848) b!1491346))

(assert (= (and b!1491344 (not c!137848)) b!1491349))

(assert (= (and b!1491344 res!1014711) b!1491338))

(assert (= (and b!1491338 res!1014710) b!1491352))

(assert (= (and b!1491352 res!1014713) b!1491353))

(assert (= (and b!1491353 res!1014701) b!1491340))

(assert (= (and b!1491352 (not res!1014708)) b!1491347))

(declare-fun m!1374915 () Bool)

(assert (=> b!1491345 m!1374915))

(assert (=> b!1491345 m!1374915))

(declare-fun m!1374917 () Bool)

(assert (=> b!1491345 m!1374917))

(declare-fun m!1374919 () Bool)

(assert (=> b!1491345 m!1374919))

(declare-fun m!1374921 () Bool)

(assert (=> b!1491345 m!1374921))

(declare-fun m!1374923 () Bool)

(assert (=> b!1491341 m!1374923))

(assert (=> b!1491341 m!1374923))

(declare-fun m!1374925 () Bool)

(assert (=> b!1491341 m!1374925))

(assert (=> b!1491341 m!1374925))

(assert (=> b!1491341 m!1374923))

(declare-fun m!1374927 () Bool)

(assert (=> b!1491341 m!1374927))

(assert (=> b!1491339 m!1374923))

(assert (=> b!1491339 m!1374923))

(declare-fun m!1374929 () Bool)

(assert (=> b!1491339 m!1374929))

(declare-fun m!1374931 () Bool)

(assert (=> b!1491349 m!1374931))

(declare-fun m!1374933 () Bool)

(assert (=> b!1491349 m!1374933))

(assert (=> b!1491353 m!1374923))

(assert (=> b!1491353 m!1374923))

(declare-fun m!1374935 () Bool)

(assert (=> b!1491353 m!1374935))

(declare-fun m!1374937 () Bool)

(assert (=> b!1491340 m!1374937))

(assert (=> b!1491340 m!1374923))

(declare-fun m!1374939 () Bool)

(assert (=> b!1491347 m!1374939))

(declare-fun m!1374941 () Bool)

(assert (=> b!1491352 m!1374941))

(assert (=> b!1491352 m!1374919))

(declare-fun m!1374943 () Bool)

(assert (=> b!1491352 m!1374943))

(declare-fun m!1374945 () Bool)

(assert (=> b!1491352 m!1374945))

(declare-fun m!1374947 () Bool)

(assert (=> b!1491352 m!1374947))

(assert (=> b!1491352 m!1374923))

(declare-fun m!1374949 () Bool)

(assert (=> b!1491354 m!1374949))

(declare-fun m!1374951 () Bool)

(assert (=> start!126872 m!1374951))

(declare-fun m!1374953 () Bool)

(assert (=> start!126872 m!1374953))

(assert (=> b!1491348 m!1374923))

(assert (=> b!1491348 m!1374923))

(declare-fun m!1374955 () Bool)

(assert (=> b!1491348 m!1374955))

(declare-fun m!1374957 () Bool)

(assert (=> b!1491343 m!1374957))

(assert (=> b!1491343 m!1374957))

(declare-fun m!1374959 () Bool)

(assert (=> b!1491343 m!1374959))

(assert (=> b!1491337 m!1374919))

(declare-fun m!1374961 () Bool)

(assert (=> b!1491337 m!1374961))

(declare-fun m!1374963 () Bool)

(assert (=> b!1491350 m!1374963))

(declare-fun m!1374965 () Bool)

(assert (=> b!1491346 m!1374965))

(check-sat (not b!1491348) (not b!1491352) (not b!1491350) (not b!1491349) (not b!1491343) (not start!126872) (not b!1491345) (not b!1491354) (not b!1491339) (not b!1491341) (not b!1491346) (not b!1491353) (not b!1491347))
(check-sat)
