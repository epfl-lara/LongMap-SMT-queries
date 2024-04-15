; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127064 () Bool)

(assert start!127064)

(declare-fun b!1493719 () Bool)

(declare-fun e!836687 () Bool)

(declare-fun e!836690 () Bool)

(assert (=> b!1493719 (= e!836687 e!836690)))

(declare-fun res!1016364 () Bool)

(assert (=> b!1493719 (=> (not res!1016364) (not e!836690))))

(declare-datatypes ((SeekEntryResult!12389 0))(
  ( (MissingZero!12389 (index!51948 (_ BitVec 32))) (Found!12389 (index!51949 (_ BitVec 32))) (Intermediate!12389 (undefined!13201 Bool) (index!51950 (_ BitVec 32)) (x!133542 (_ BitVec 32))) (Undefined!12389) (MissingVacant!12389 (index!51951 (_ BitVec 32))) )
))
(declare-fun lt!650942 () SeekEntryResult!12389)

(declare-datatypes ((array!99709 0))(
  ( (array!99710 (arr!48124 (Array (_ BitVec 32) (_ BitVec 64))) (size!48676 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99709)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99709 (_ BitVec 32)) SeekEntryResult!12389)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493719 (= res!1016364 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48124 a!2862) j!93) mask!2687) (select (arr!48124 a!2862) j!93) a!2862 mask!2687) lt!650942))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1493719 (= lt!650942 (Intermediate!12389 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1493720 () Bool)

(declare-fun e!836692 () Bool)

(declare-fun e!836693 () Bool)

(assert (=> b!1493720 (= e!836692 (not e!836693))))

(declare-fun res!1016359 () Bool)

(assert (=> b!1493720 (=> res!1016359 e!836693)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1493720 (= res!1016359 (or (and (= (select (arr!48124 a!2862) index!646) (select (store (arr!48124 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48124 a!2862) index!646) (select (arr!48124 a!2862) j!93))) (= (select (arr!48124 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!836691 () Bool)

(assert (=> b!1493720 e!836691))

(declare-fun res!1016370 () Bool)

(assert (=> b!1493720 (=> (not res!1016370) (not e!836691))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99709 (_ BitVec 32)) Bool)

(assert (=> b!1493720 (= res!1016370 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49959 0))(
  ( (Unit!49960) )
))
(declare-fun lt!650938 () Unit!49959)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99709 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49959)

(assert (=> b!1493720 (= lt!650938 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1493721 () Bool)

(assert (=> b!1493721 (= e!836693 true)))

(declare-fun lt!650940 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493721 (= lt!650940 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!650937 () (_ BitVec 64))

(declare-fun e!836686 () Bool)

(declare-fun lt!650939 () array!99709)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1493722 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99709 (_ BitVec 32)) SeekEntryResult!12389)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99709 (_ BitVec 32)) SeekEntryResult!12389)

(assert (=> b!1493722 (= e!836686 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650937 lt!650939 mask!2687) (seekEntryOrOpen!0 lt!650937 lt!650939 mask!2687)))))

(declare-fun res!1016369 () Bool)

(declare-fun e!836688 () Bool)

(assert (=> start!127064 (=> (not res!1016369) (not e!836688))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127064 (= res!1016369 (validMask!0 mask!2687))))

(assert (=> start!127064 e!836688))

(assert (=> start!127064 true))

(declare-fun array_inv!37357 (array!99709) Bool)

(assert (=> start!127064 (array_inv!37357 a!2862)))

(declare-fun b!1493723 () Bool)

(declare-fun res!1016362 () Bool)

(assert (=> b!1493723 (=> (not res!1016362) (not e!836688))))

(assert (=> b!1493723 (= res!1016362 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48676 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48676 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48676 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1493724 () Bool)

(declare-fun res!1016366 () Bool)

(assert (=> b!1493724 (=> (not res!1016366) (not e!836688))))

(declare-datatypes ((List!34703 0))(
  ( (Nil!34700) (Cons!34699 (h!36088 (_ BitVec 64)) (t!49389 List!34703)) )
))
(declare-fun arrayNoDuplicates!0 (array!99709 (_ BitVec 32) List!34703) Bool)

(assert (=> b!1493724 (= res!1016366 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34700))))

(declare-fun b!1493725 () Bool)

(declare-fun res!1016367 () Bool)

(assert (=> b!1493725 (=> (not res!1016367) (not e!836688))))

(assert (=> b!1493725 (= res!1016367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1493726 () Bool)

(declare-fun res!1016368 () Bool)

(assert (=> b!1493726 (=> (not res!1016368) (not e!836691))))

(assert (=> b!1493726 (= res!1016368 (= (seekEntryOrOpen!0 (select (arr!48124 a!2862) j!93) a!2862 mask!2687) (Found!12389 j!93)))))

(declare-fun b!1493727 () Bool)

(declare-fun res!1016357 () Bool)

(assert (=> b!1493727 (=> (not res!1016357) (not e!836692))))

(assert (=> b!1493727 (= res!1016357 e!836686)))

(declare-fun c!138214 () Bool)

(assert (=> b!1493727 (= c!138214 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1493728 () Bool)

(assert (=> b!1493728 (= e!836691 (or (= (select (arr!48124 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48124 a!2862) intermediateBeforeIndex!19) (select (arr!48124 a!2862) j!93))))))

(declare-fun b!1493729 () Bool)

(declare-fun res!1016358 () Bool)

(assert (=> b!1493729 (=> (not res!1016358) (not e!836688))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1493729 (= res!1016358 (validKeyInArray!0 (select (arr!48124 a!2862) j!93)))))

(declare-fun b!1493730 () Bool)

(assert (=> b!1493730 (= e!836688 e!836687)))

(declare-fun res!1016361 () Bool)

(assert (=> b!1493730 (=> (not res!1016361) (not e!836687))))

(assert (=> b!1493730 (= res!1016361 (= (select (store (arr!48124 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1493730 (= lt!650939 (array!99710 (store (arr!48124 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48676 a!2862)))))

(declare-fun b!1493731 () Bool)

(declare-fun res!1016360 () Bool)

(assert (=> b!1493731 (=> (not res!1016360) (not e!836692))))

(assert (=> b!1493731 (= res!1016360 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1493732 () Bool)

(declare-fun res!1016365 () Bool)

(assert (=> b!1493732 (=> (not res!1016365) (not e!836690))))

(assert (=> b!1493732 (= res!1016365 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48124 a!2862) j!93) a!2862 mask!2687) lt!650942))))

(declare-fun b!1493733 () Bool)

(declare-fun res!1016363 () Bool)

(assert (=> b!1493733 (=> (not res!1016363) (not e!836688))))

(assert (=> b!1493733 (= res!1016363 (validKeyInArray!0 (select (arr!48124 a!2862) i!1006)))))

(declare-fun b!1493734 () Bool)

(assert (=> b!1493734 (= e!836690 e!836692)))

(declare-fun res!1016371 () Bool)

(assert (=> b!1493734 (=> (not res!1016371) (not e!836692))))

(declare-fun lt!650941 () SeekEntryResult!12389)

(assert (=> b!1493734 (= res!1016371 (= lt!650941 (Intermediate!12389 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1493734 (= lt!650941 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650937 mask!2687) lt!650937 lt!650939 mask!2687))))

(assert (=> b!1493734 (= lt!650937 (select (store (arr!48124 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1493735 () Bool)

(assert (=> b!1493735 (= e!836686 (= lt!650941 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650937 lt!650939 mask!2687)))))

(declare-fun b!1493736 () Bool)

(declare-fun res!1016356 () Bool)

(assert (=> b!1493736 (=> (not res!1016356) (not e!836688))))

(assert (=> b!1493736 (= res!1016356 (and (= (size!48676 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48676 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48676 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!127064 res!1016369) b!1493736))

(assert (= (and b!1493736 res!1016356) b!1493733))

(assert (= (and b!1493733 res!1016363) b!1493729))

(assert (= (and b!1493729 res!1016358) b!1493725))

(assert (= (and b!1493725 res!1016367) b!1493724))

(assert (= (and b!1493724 res!1016366) b!1493723))

(assert (= (and b!1493723 res!1016362) b!1493730))

(assert (= (and b!1493730 res!1016361) b!1493719))

(assert (= (and b!1493719 res!1016364) b!1493732))

(assert (= (and b!1493732 res!1016365) b!1493734))

(assert (= (and b!1493734 res!1016371) b!1493727))

(assert (= (and b!1493727 c!138214) b!1493735))

(assert (= (and b!1493727 (not c!138214)) b!1493722))

(assert (= (and b!1493727 res!1016357) b!1493731))

(assert (= (and b!1493731 res!1016360) b!1493720))

(assert (= (and b!1493720 res!1016370) b!1493726))

(assert (= (and b!1493726 res!1016368) b!1493728))

(assert (= (and b!1493720 (not res!1016359)) b!1493721))

(declare-fun m!1376943 () Bool)

(assert (=> b!1493734 m!1376943))

(assert (=> b!1493734 m!1376943))

(declare-fun m!1376945 () Bool)

(assert (=> b!1493734 m!1376945))

(declare-fun m!1376947 () Bool)

(assert (=> b!1493734 m!1376947))

(declare-fun m!1376949 () Bool)

(assert (=> b!1493734 m!1376949))

(declare-fun m!1376951 () Bool)

(assert (=> b!1493729 m!1376951))

(assert (=> b!1493729 m!1376951))

(declare-fun m!1376953 () Bool)

(assert (=> b!1493729 m!1376953))

(assert (=> b!1493732 m!1376951))

(assert (=> b!1493732 m!1376951))

(declare-fun m!1376955 () Bool)

(assert (=> b!1493732 m!1376955))

(declare-fun m!1376957 () Bool)

(assert (=> b!1493725 m!1376957))

(declare-fun m!1376959 () Bool)

(assert (=> start!127064 m!1376959))

(declare-fun m!1376961 () Bool)

(assert (=> start!127064 m!1376961))

(declare-fun m!1376963 () Bool)

(assert (=> b!1493722 m!1376963))

(declare-fun m!1376965 () Bool)

(assert (=> b!1493722 m!1376965))

(declare-fun m!1376967 () Bool)

(assert (=> b!1493735 m!1376967))

(declare-fun m!1376969 () Bool)

(assert (=> b!1493724 m!1376969))

(declare-fun m!1376971 () Bool)

(assert (=> b!1493733 m!1376971))

(assert (=> b!1493733 m!1376971))

(declare-fun m!1376973 () Bool)

(assert (=> b!1493733 m!1376973))

(declare-fun m!1376975 () Bool)

(assert (=> b!1493728 m!1376975))

(assert (=> b!1493728 m!1376951))

(assert (=> b!1493726 m!1376951))

(assert (=> b!1493726 m!1376951))

(declare-fun m!1376977 () Bool)

(assert (=> b!1493726 m!1376977))

(assert (=> b!1493730 m!1376947))

(declare-fun m!1376979 () Bool)

(assert (=> b!1493730 m!1376979))

(assert (=> b!1493719 m!1376951))

(assert (=> b!1493719 m!1376951))

(declare-fun m!1376981 () Bool)

(assert (=> b!1493719 m!1376981))

(assert (=> b!1493719 m!1376981))

(assert (=> b!1493719 m!1376951))

(declare-fun m!1376983 () Bool)

(assert (=> b!1493719 m!1376983))

(declare-fun m!1376985 () Bool)

(assert (=> b!1493720 m!1376985))

(assert (=> b!1493720 m!1376947))

(declare-fun m!1376987 () Bool)

(assert (=> b!1493720 m!1376987))

(declare-fun m!1376989 () Bool)

(assert (=> b!1493720 m!1376989))

(declare-fun m!1376991 () Bool)

(assert (=> b!1493720 m!1376991))

(assert (=> b!1493720 m!1376951))

(declare-fun m!1376993 () Bool)

(assert (=> b!1493721 m!1376993))

(check-sat (not start!127064) (not b!1493724) (not b!1493721) (not b!1493719) (not b!1493735) (not b!1493726) (not b!1493729) (not b!1493725) (not b!1493732) (not b!1493722) (not b!1493734) (not b!1493733) (not b!1493720))
(check-sat)
