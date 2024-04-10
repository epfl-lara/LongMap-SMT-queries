; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127100 () Bool)

(assert start!127100)

(declare-fun b!1493710 () Bool)

(declare-fun res!1016165 () Bool)

(declare-fun e!836752 () Bool)

(assert (=> b!1493710 (=> (not res!1016165) (not e!836752))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99747 0))(
  ( (array!99748 (arr!48142 (Array (_ BitVec 32) (_ BitVec 64))) (size!48692 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99747)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12382 0))(
  ( (MissingZero!12382 (index!51920 (_ BitVec 32))) (Found!12382 (index!51921 (_ BitVec 32))) (Intermediate!12382 (undefined!13194 Bool) (index!51922 (_ BitVec 32)) (x!133518 (_ BitVec 32))) (Undefined!12382) (MissingVacant!12382 (index!51923 (_ BitVec 32))) )
))
(declare-fun lt!651119 () SeekEntryResult!12382)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99747 (_ BitVec 32)) SeekEntryResult!12382)

(assert (=> b!1493710 (= res!1016165 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48142 a!2862) j!93) a!2862 mask!2687) lt!651119))))

(declare-fun res!1016169 () Bool)

(declare-fun e!836746 () Bool)

(assert (=> start!127100 (=> (not res!1016169) (not e!836746))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127100 (= res!1016169 (validMask!0 mask!2687))))

(assert (=> start!127100 e!836746))

(assert (=> start!127100 true))

(declare-fun array_inv!37170 (array!99747) Bool)

(assert (=> start!127100 (array_inv!37170 a!2862)))

(declare-fun b!1493711 () Bool)

(declare-fun res!1016166 () Bool)

(declare-fun e!836748 () Bool)

(assert (=> b!1493711 (=> (not res!1016166) (not e!836748))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99747 (_ BitVec 32)) SeekEntryResult!12382)

(assert (=> b!1493711 (= res!1016166 (= (seekEntryOrOpen!0 (select (arr!48142 a!2862) j!93) a!2862 mask!2687) (Found!12382 j!93)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1493712 () Bool)

(assert (=> b!1493712 (= e!836748 (or (= (select (arr!48142 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48142 a!2862) intermediateBeforeIndex!19) (select (arr!48142 a!2862) j!93))))))

(declare-fun b!1493713 () Bool)

(declare-fun e!836747 () Bool)

(assert (=> b!1493713 (= e!836747 true)))

(declare-fun lt!651120 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493713 (= lt!651120 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun e!836750 () Bool)

(declare-fun lt!651118 () array!99747)

(declare-fun b!1493714 () Bool)

(declare-fun lt!651116 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99747 (_ BitVec 32)) SeekEntryResult!12382)

(assert (=> b!1493714 (= e!836750 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651116 lt!651118 mask!2687) (seekEntryOrOpen!0 lt!651116 lt!651118 mask!2687)))))

(declare-fun b!1493715 () Bool)

(declare-fun lt!651117 () SeekEntryResult!12382)

(assert (=> b!1493715 (= e!836750 (= lt!651117 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651116 lt!651118 mask!2687)))))

(declare-fun b!1493716 () Bool)

(declare-fun res!1016179 () Bool)

(assert (=> b!1493716 (=> (not res!1016179) (not e!836746))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1493716 (= res!1016179 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48692 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48692 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48692 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1493717 () Bool)

(declare-fun e!836751 () Bool)

(assert (=> b!1493717 (= e!836751 e!836752)))

(declare-fun res!1016176 () Bool)

(assert (=> b!1493717 (=> (not res!1016176) (not e!836752))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493717 (= res!1016176 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48142 a!2862) j!93) mask!2687) (select (arr!48142 a!2862) j!93) a!2862 mask!2687) lt!651119))))

(assert (=> b!1493717 (= lt!651119 (Intermediate!12382 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1493718 () Bool)

(declare-fun e!836749 () Bool)

(assert (=> b!1493718 (= e!836752 e!836749)))

(declare-fun res!1016171 () Bool)

(assert (=> b!1493718 (=> (not res!1016171) (not e!836749))))

(assert (=> b!1493718 (= res!1016171 (= lt!651117 (Intermediate!12382 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1493718 (= lt!651117 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651116 mask!2687) lt!651116 lt!651118 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1493718 (= lt!651116 (select (store (arr!48142 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1493719 () Bool)

(declare-fun res!1016170 () Bool)

(assert (=> b!1493719 (=> (not res!1016170) (not e!836746))))

(assert (=> b!1493719 (= res!1016170 (and (= (size!48692 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48692 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48692 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1493720 () Bool)

(declare-fun res!1016175 () Bool)

(assert (=> b!1493720 (=> (not res!1016175) (not e!836746))))

(declare-datatypes ((List!34643 0))(
  ( (Nil!34640) (Cons!34639 (h!36028 (_ BitVec 64)) (t!49337 List!34643)) )
))
(declare-fun arrayNoDuplicates!0 (array!99747 (_ BitVec 32) List!34643) Bool)

(assert (=> b!1493720 (= res!1016175 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34640))))

(declare-fun b!1493721 () Bool)

(declare-fun res!1016164 () Bool)

(assert (=> b!1493721 (=> (not res!1016164) (not e!836746))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1493721 (= res!1016164 (validKeyInArray!0 (select (arr!48142 a!2862) j!93)))))

(declare-fun b!1493722 () Bool)

(declare-fun res!1016172 () Bool)

(assert (=> b!1493722 (=> (not res!1016172) (not e!836749))))

(assert (=> b!1493722 (= res!1016172 e!836750)))

(declare-fun c!138303 () Bool)

(assert (=> b!1493722 (= c!138303 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1493723 () Bool)

(declare-fun res!1016168 () Bool)

(assert (=> b!1493723 (=> (not res!1016168) (not e!836746))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99747 (_ BitVec 32)) Bool)

(assert (=> b!1493723 (= res!1016168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1493724 () Bool)

(assert (=> b!1493724 (= e!836749 (not e!836747))))

(declare-fun res!1016173 () Bool)

(assert (=> b!1493724 (=> res!1016173 e!836747)))

(assert (=> b!1493724 (= res!1016173 (or (and (= (select (arr!48142 a!2862) index!646) (select (store (arr!48142 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48142 a!2862) index!646) (select (arr!48142 a!2862) j!93))) (= (select (arr!48142 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1493724 e!836748))

(declare-fun res!1016178 () Bool)

(assert (=> b!1493724 (=> (not res!1016178) (not e!836748))))

(assert (=> b!1493724 (= res!1016178 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50104 0))(
  ( (Unit!50105) )
))
(declare-fun lt!651115 () Unit!50104)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99747 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50104)

(assert (=> b!1493724 (= lt!651115 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1493725 () Bool)

(declare-fun res!1016167 () Bool)

(assert (=> b!1493725 (=> (not res!1016167) (not e!836749))))

(assert (=> b!1493725 (= res!1016167 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1493726 () Bool)

(assert (=> b!1493726 (= e!836746 e!836751)))

(declare-fun res!1016177 () Bool)

(assert (=> b!1493726 (=> (not res!1016177) (not e!836751))))

(assert (=> b!1493726 (= res!1016177 (= (select (store (arr!48142 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1493726 (= lt!651118 (array!99748 (store (arr!48142 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48692 a!2862)))))

(declare-fun b!1493727 () Bool)

(declare-fun res!1016174 () Bool)

(assert (=> b!1493727 (=> (not res!1016174) (not e!836746))))

(assert (=> b!1493727 (= res!1016174 (validKeyInArray!0 (select (arr!48142 a!2862) i!1006)))))

(assert (= (and start!127100 res!1016169) b!1493719))

(assert (= (and b!1493719 res!1016170) b!1493727))

(assert (= (and b!1493727 res!1016174) b!1493721))

(assert (= (and b!1493721 res!1016164) b!1493723))

(assert (= (and b!1493723 res!1016168) b!1493720))

(assert (= (and b!1493720 res!1016175) b!1493716))

(assert (= (and b!1493716 res!1016179) b!1493726))

(assert (= (and b!1493726 res!1016177) b!1493717))

(assert (= (and b!1493717 res!1016176) b!1493710))

(assert (= (and b!1493710 res!1016165) b!1493718))

(assert (= (and b!1493718 res!1016171) b!1493722))

(assert (= (and b!1493722 c!138303) b!1493715))

(assert (= (and b!1493722 (not c!138303)) b!1493714))

(assert (= (and b!1493722 res!1016172) b!1493725))

(assert (= (and b!1493725 res!1016167) b!1493724))

(assert (= (and b!1493724 res!1016178) b!1493711))

(assert (= (and b!1493711 res!1016166) b!1493712))

(assert (= (and b!1493724 (not res!1016173)) b!1493713))

(declare-fun m!1377483 () Bool)

(assert (=> b!1493721 m!1377483))

(assert (=> b!1493721 m!1377483))

(declare-fun m!1377485 () Bool)

(assert (=> b!1493721 m!1377485))

(declare-fun m!1377487 () Bool)

(assert (=> b!1493713 m!1377487))

(declare-fun m!1377489 () Bool)

(assert (=> b!1493718 m!1377489))

(assert (=> b!1493718 m!1377489))

(declare-fun m!1377491 () Bool)

(assert (=> b!1493718 m!1377491))

(declare-fun m!1377493 () Bool)

(assert (=> b!1493718 m!1377493))

(declare-fun m!1377495 () Bool)

(assert (=> b!1493718 m!1377495))

(declare-fun m!1377497 () Bool)

(assert (=> b!1493715 m!1377497))

(assert (=> b!1493717 m!1377483))

(assert (=> b!1493717 m!1377483))

(declare-fun m!1377499 () Bool)

(assert (=> b!1493717 m!1377499))

(assert (=> b!1493717 m!1377499))

(assert (=> b!1493717 m!1377483))

(declare-fun m!1377501 () Bool)

(assert (=> b!1493717 m!1377501))

(declare-fun m!1377503 () Bool)

(assert (=> b!1493714 m!1377503))

(declare-fun m!1377505 () Bool)

(assert (=> b!1493714 m!1377505))

(assert (=> b!1493726 m!1377493))

(declare-fun m!1377507 () Bool)

(assert (=> b!1493726 m!1377507))

(declare-fun m!1377509 () Bool)

(assert (=> b!1493723 m!1377509))

(declare-fun m!1377511 () Bool)

(assert (=> b!1493724 m!1377511))

(assert (=> b!1493724 m!1377493))

(declare-fun m!1377513 () Bool)

(assert (=> b!1493724 m!1377513))

(declare-fun m!1377515 () Bool)

(assert (=> b!1493724 m!1377515))

(declare-fun m!1377517 () Bool)

(assert (=> b!1493724 m!1377517))

(assert (=> b!1493724 m!1377483))

(declare-fun m!1377519 () Bool)

(assert (=> b!1493720 m!1377519))

(assert (=> b!1493710 m!1377483))

(assert (=> b!1493710 m!1377483))

(declare-fun m!1377521 () Bool)

(assert (=> b!1493710 m!1377521))

(assert (=> b!1493711 m!1377483))

(assert (=> b!1493711 m!1377483))

(declare-fun m!1377523 () Bool)

(assert (=> b!1493711 m!1377523))

(declare-fun m!1377525 () Bool)

(assert (=> start!127100 m!1377525))

(declare-fun m!1377527 () Bool)

(assert (=> start!127100 m!1377527))

(declare-fun m!1377529 () Bool)

(assert (=> b!1493727 m!1377529))

(assert (=> b!1493727 m!1377529))

(declare-fun m!1377531 () Bool)

(assert (=> b!1493727 m!1377531))

(declare-fun m!1377533 () Bool)

(assert (=> b!1493712 m!1377533))

(assert (=> b!1493712 m!1377483))

(push 1)

