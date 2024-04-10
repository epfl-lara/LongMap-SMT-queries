; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126506 () Bool)

(assert start!126506)

(declare-fun res!1008584 () Bool)

(declare-fun e!831941 () Bool)

(assert (=> start!126506 (=> (not res!1008584) (not e!831941))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126506 (= res!1008584 (validMask!0 mask!2687))))

(assert (=> start!126506 e!831941))

(assert (=> start!126506 true))

(declare-datatypes ((array!99468 0))(
  ( (array!99469 (arr!48010 (Array (_ BitVec 32) (_ BitVec 64))) (size!48560 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99468)

(declare-fun array_inv!37038 (array!99468) Bool)

(assert (=> start!126506 (array_inv!37038 a!2862)))

(declare-fun b!1483729 () Bool)

(declare-fun e!831943 () Bool)

(assert (=> b!1483729 (= e!831941 e!831943)))

(declare-fun res!1008582 () Bool)

(assert (=> b!1483729 (=> (not res!1008582) (not e!831943))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1483729 (= res!1008582 (= (select (store (arr!48010 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!647527 () array!99468)

(assert (=> b!1483729 (= lt!647527 (array!99469 (store (arr!48010 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48560 a!2862)))))

(declare-fun b!1483730 () Bool)

(declare-fun res!1008590 () Bool)

(assert (=> b!1483730 (=> (not res!1008590) (not e!831941))))

(declare-datatypes ((List!34511 0))(
  ( (Nil!34508) (Cons!34507 (h!35881 (_ BitVec 64)) (t!49205 List!34511)) )
))
(declare-fun arrayNoDuplicates!0 (array!99468 (_ BitVec 32) List!34511) Bool)

(assert (=> b!1483730 (= res!1008590 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34508))))

(declare-fun b!1483731 () Bool)

(declare-fun res!1008576 () Bool)

(declare-fun e!831945 () Bool)

(assert (=> b!1483731 (=> (not res!1008576) (not e!831945))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1483731 (= res!1008576 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1483732 () Bool)

(declare-fun res!1008586 () Bool)

(assert (=> b!1483732 (=> (not res!1008586) (not e!831941))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1483732 (= res!1008586 (validKeyInArray!0 (select (arr!48010 a!2862) j!93)))))

(declare-fun b!1483733 () Bool)

(declare-fun res!1008577 () Bool)

(assert (=> b!1483733 (=> (not res!1008577) (not e!831941))))

(assert (=> b!1483733 (= res!1008577 (and (= (size!48560 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48560 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48560 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1483734 () Bool)

(declare-fun e!831947 () Bool)

(declare-fun e!831942 () Bool)

(assert (=> b!1483734 (= e!831947 e!831942)))

(declare-fun res!1008578 () Bool)

(assert (=> b!1483734 (=> (not res!1008578) (not e!831942))))

(declare-fun lt!647524 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1483734 (= res!1008578 (and (= index!646 intermediateAfterIndex!19) (= lt!647524 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1483735 () Bool)

(declare-fun res!1008580 () Bool)

(declare-fun e!831939 () Bool)

(assert (=> b!1483735 (=> (not res!1008580) (not e!831939))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1483735 (= res!1008580 (or (= (select (arr!48010 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48010 a!2862) intermediateBeforeIndex!19) (select (arr!48010 a!2862) j!93))))))

(declare-fun e!831946 () Bool)

(declare-fun b!1483736 () Bool)

(declare-fun lt!647529 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12250 0))(
  ( (MissingZero!12250 (index!51392 (_ BitVec 32))) (Found!12250 (index!51393 (_ BitVec 32))) (Intermediate!12250 (undefined!13062 Bool) (index!51394 (_ BitVec 32)) (x!132974 (_ BitVec 32))) (Undefined!12250) (MissingVacant!12250 (index!51395 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99468 (_ BitVec 32)) SeekEntryResult!12250)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99468 (_ BitVec 32)) SeekEntryResult!12250)

(assert (=> b!1483736 (= e!831946 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647529 lt!647527 mask!2687) (seekEntryOrOpen!0 lt!647529 lt!647527 mask!2687)))))

(declare-fun b!1483737 () Bool)

(declare-fun res!1008574 () Bool)

(assert (=> b!1483737 (=> (not res!1008574) (not e!831941))))

(assert (=> b!1483737 (= res!1008574 (validKeyInArray!0 (select (arr!48010 a!2862) i!1006)))))

(declare-fun b!1483738 () Bool)

(declare-fun res!1008592 () Bool)

(assert (=> b!1483738 (=> (not res!1008592) (not e!831941))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99468 (_ BitVec 32)) Bool)

(assert (=> b!1483738 (= res!1008592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1483739 () Bool)

(declare-fun e!831940 () Bool)

(assert (=> b!1483739 (= e!831940 e!831945)))

(declare-fun res!1008591 () Bool)

(assert (=> b!1483739 (=> (not res!1008591) (not e!831945))))

(declare-fun lt!647525 () SeekEntryResult!12250)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1483739 (= res!1008591 (= lt!647525 (Intermediate!12250 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99468 (_ BitVec 32)) SeekEntryResult!12250)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483739 (= lt!647525 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647529 mask!2687) lt!647529 lt!647527 mask!2687))))

(assert (=> b!1483739 (= lt!647529 (select (store (arr!48010 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1483740 () Bool)

(declare-fun e!831938 () Bool)

(assert (=> b!1483740 (= e!831938 true)))

(declare-fun lt!647528 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483740 (= lt!647528 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1483741 () Bool)

(assert (=> b!1483741 (= e!831939 e!831947)))

(declare-fun res!1008583 () Bool)

(assert (=> b!1483741 (=> res!1008583 e!831947)))

(assert (=> b!1483741 (= res!1008583 (or (and (= (select (arr!48010 a!2862) index!646) lt!647524) (= (select (arr!48010 a!2862) index!646) (select (arr!48010 a!2862) j!93))) (= (select (arr!48010 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1483741 (= lt!647524 (select (store (arr!48010 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1483742 () Bool)

(assert (=> b!1483742 (= e!831945 (not e!831938))))

(declare-fun res!1008579 () Bool)

(assert (=> b!1483742 (=> res!1008579 e!831938)))

(assert (=> b!1483742 (= res!1008579 (or (and (= (select (arr!48010 a!2862) index!646) (select (store (arr!48010 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48010 a!2862) index!646) (select (arr!48010 a!2862) j!93))) (= (select (arr!48010 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1483742 e!831939))

(declare-fun res!1008575 () Bool)

(assert (=> b!1483742 (=> (not res!1008575) (not e!831939))))

(assert (=> b!1483742 (= res!1008575 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49840 0))(
  ( (Unit!49841) )
))
(declare-fun lt!647523 () Unit!49840)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99468 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49840)

(assert (=> b!1483742 (= lt!647523 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1483743 () Bool)

(declare-fun res!1008585 () Bool)

(assert (=> b!1483743 (=> (not res!1008585) (not e!831945))))

(assert (=> b!1483743 (= res!1008585 e!831946)))

(declare-fun c!137100 () Bool)

(assert (=> b!1483743 (= c!137100 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1483744 () Bool)

(assert (=> b!1483744 (= e!831943 e!831940)))

(declare-fun res!1008588 () Bool)

(assert (=> b!1483744 (=> (not res!1008588) (not e!831940))))

(declare-fun lt!647526 () SeekEntryResult!12250)

(assert (=> b!1483744 (= res!1008588 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48010 a!2862) j!93) mask!2687) (select (arr!48010 a!2862) j!93) a!2862 mask!2687) lt!647526))))

(assert (=> b!1483744 (= lt!647526 (Intermediate!12250 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1483745 () Bool)

(declare-fun res!1008589 () Bool)

(assert (=> b!1483745 (=> (not res!1008589) (not e!831940))))

(assert (=> b!1483745 (= res!1008589 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48010 a!2862) j!93) a!2862 mask!2687) lt!647526))))

(declare-fun b!1483746 () Bool)

(declare-fun res!1008581 () Bool)

(assert (=> b!1483746 (=> (not res!1008581) (not e!831941))))

(assert (=> b!1483746 (= res!1008581 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48560 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48560 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48560 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1483747 () Bool)

(assert (=> b!1483747 (= e!831942 (= (seekEntryOrOpen!0 lt!647529 lt!647527 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647529 lt!647527 mask!2687)))))

(declare-fun b!1483748 () Bool)

(declare-fun res!1008587 () Bool)

(assert (=> b!1483748 (=> (not res!1008587) (not e!831939))))

(assert (=> b!1483748 (= res!1008587 (= (seekEntryOrOpen!0 (select (arr!48010 a!2862) j!93) a!2862 mask!2687) (Found!12250 j!93)))))

(declare-fun b!1483749 () Bool)

(assert (=> b!1483749 (= e!831946 (= lt!647525 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647529 lt!647527 mask!2687)))))

(assert (= (and start!126506 res!1008584) b!1483733))

(assert (= (and b!1483733 res!1008577) b!1483737))

(assert (= (and b!1483737 res!1008574) b!1483732))

(assert (= (and b!1483732 res!1008586) b!1483738))

(assert (= (and b!1483738 res!1008592) b!1483730))

(assert (= (and b!1483730 res!1008590) b!1483746))

(assert (= (and b!1483746 res!1008581) b!1483729))

(assert (= (and b!1483729 res!1008582) b!1483744))

(assert (= (and b!1483744 res!1008588) b!1483745))

(assert (= (and b!1483745 res!1008589) b!1483739))

(assert (= (and b!1483739 res!1008591) b!1483743))

(assert (= (and b!1483743 c!137100) b!1483749))

(assert (= (and b!1483743 (not c!137100)) b!1483736))

(assert (= (and b!1483743 res!1008585) b!1483731))

(assert (= (and b!1483731 res!1008576) b!1483742))

(assert (= (and b!1483742 res!1008575) b!1483748))

(assert (= (and b!1483748 res!1008587) b!1483735))

(assert (= (and b!1483735 res!1008580) b!1483741))

(assert (= (and b!1483741 (not res!1008583)) b!1483734))

(assert (= (and b!1483734 res!1008578) b!1483747))

(assert (= (and b!1483742 (not res!1008579)) b!1483740))

(declare-fun m!1369161 () Bool)

(assert (=> b!1483736 m!1369161))

(declare-fun m!1369163 () Bool)

(assert (=> b!1483736 m!1369163))

(declare-fun m!1369165 () Bool)

(assert (=> b!1483732 m!1369165))

(assert (=> b!1483732 m!1369165))

(declare-fun m!1369167 () Bool)

(assert (=> b!1483732 m!1369167))

(declare-fun m!1369169 () Bool)

(assert (=> start!126506 m!1369169))

(declare-fun m!1369171 () Bool)

(assert (=> start!126506 m!1369171))

(assert (=> b!1483748 m!1369165))

(assert (=> b!1483748 m!1369165))

(declare-fun m!1369173 () Bool)

(assert (=> b!1483748 m!1369173))

(declare-fun m!1369175 () Bool)

(assert (=> b!1483740 m!1369175))

(declare-fun m!1369177 () Bool)

(assert (=> b!1483738 m!1369177))

(declare-fun m!1369179 () Bool)

(assert (=> b!1483730 m!1369179))

(declare-fun m!1369181 () Bool)

(assert (=> b!1483737 m!1369181))

(assert (=> b!1483737 m!1369181))

(declare-fun m!1369183 () Bool)

(assert (=> b!1483737 m!1369183))

(declare-fun m!1369185 () Bool)

(assert (=> b!1483749 m!1369185))

(declare-fun m!1369187 () Bool)

(assert (=> b!1483741 m!1369187))

(assert (=> b!1483741 m!1369165))

(declare-fun m!1369189 () Bool)

(assert (=> b!1483741 m!1369189))

(declare-fun m!1369191 () Bool)

(assert (=> b!1483741 m!1369191))

(declare-fun m!1369193 () Bool)

(assert (=> b!1483739 m!1369193))

(assert (=> b!1483739 m!1369193))

(declare-fun m!1369195 () Bool)

(assert (=> b!1483739 m!1369195))

(assert (=> b!1483739 m!1369189))

(declare-fun m!1369197 () Bool)

(assert (=> b!1483739 m!1369197))

(assert (=> b!1483747 m!1369163))

(assert (=> b!1483747 m!1369161))

(declare-fun m!1369199 () Bool)

(assert (=> b!1483742 m!1369199))

(assert (=> b!1483742 m!1369189))

(assert (=> b!1483742 m!1369191))

(assert (=> b!1483742 m!1369187))

(declare-fun m!1369201 () Bool)

(assert (=> b!1483742 m!1369201))

(assert (=> b!1483742 m!1369165))

(declare-fun m!1369203 () Bool)

(assert (=> b!1483735 m!1369203))

(assert (=> b!1483735 m!1369165))

(assert (=> b!1483745 m!1369165))

(assert (=> b!1483745 m!1369165))

(declare-fun m!1369205 () Bool)

(assert (=> b!1483745 m!1369205))

(assert (=> b!1483729 m!1369189))

(declare-fun m!1369207 () Bool)

(assert (=> b!1483729 m!1369207))

(assert (=> b!1483744 m!1369165))

(assert (=> b!1483744 m!1369165))

(declare-fun m!1369209 () Bool)

(assert (=> b!1483744 m!1369209))

(assert (=> b!1483744 m!1369209))

(assert (=> b!1483744 m!1369165))

(declare-fun m!1369211 () Bool)

(assert (=> b!1483744 m!1369211))

(push 1)

