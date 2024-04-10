; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124922 () Bool)

(assert start!124922)

(declare-fun b!1451534 () Bool)

(declare-fun e!817262 () Bool)

(declare-fun e!817260 () Bool)

(assert (=> b!1451534 (= e!817262 e!817260)))

(declare-fun res!982759 () Bool)

(assert (=> b!1451534 (=> (not res!982759) (not e!817260))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98370 0))(
  ( (array!98371 (arr!47473 (Array (_ BitVec 32) (_ BitVec 64))) (size!48023 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98370)

(assert (=> b!1451534 (= res!982759 (= (select (store (arr!47473 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!636684 () array!98370)

(assert (=> b!1451534 (= lt!636684 (array!98371 (store (arr!47473 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48023 a!2862)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!636682 () (_ BitVec 64))

(declare-fun b!1451535 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!817256 () Bool)

(declare-datatypes ((SeekEntryResult!11725 0))(
  ( (MissingZero!11725 (index!49292 (_ BitVec 32))) (Found!11725 (index!49293 (_ BitVec 32))) (Intermediate!11725 (undefined!12537 Bool) (index!49294 (_ BitVec 32)) (x!130942 (_ BitVec 32))) (Undefined!11725) (MissingVacant!11725 (index!49295 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98370 (_ BitVec 32)) SeekEntryResult!11725)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98370 (_ BitVec 32)) SeekEntryResult!11725)

(assert (=> b!1451535 (= e!817256 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636682 lt!636684 mask!2687) (seekEntryOrOpen!0 lt!636682 lt!636684 mask!2687)))))

(declare-fun b!1451537 () Bool)

(declare-fun res!982765 () Bool)

(assert (=> b!1451537 (=> (not res!982765) (not e!817262))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1451537 (= res!982765 (validKeyInArray!0 (select (arr!47473 a!2862) j!93)))))

(declare-fun b!1451538 () Bool)

(declare-fun res!982766 () Bool)

(declare-fun e!817259 () Bool)

(assert (=> b!1451538 (=> (not res!982766) (not e!817259))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1451538 (= res!982766 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1451539 () Bool)

(declare-fun e!817261 () Bool)

(assert (=> b!1451539 (= e!817261 e!817259)))

(declare-fun res!982767 () Bool)

(assert (=> b!1451539 (=> (not res!982767) (not e!817259))))

(declare-fun lt!636681 () SeekEntryResult!11725)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1451539 (= res!982767 (= lt!636681 (Intermediate!11725 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98370 (_ BitVec 32)) SeekEntryResult!11725)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1451539 (= lt!636681 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636682 mask!2687) lt!636682 lt!636684 mask!2687))))

(assert (=> b!1451539 (= lt!636682 (select (store (arr!47473 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1451540 () Bool)

(declare-fun res!982764 () Bool)

(assert (=> b!1451540 (=> (not res!982764) (not e!817261))))

(declare-fun lt!636683 () SeekEntryResult!11725)

(assert (=> b!1451540 (= res!982764 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47473 a!2862) j!93) a!2862 mask!2687) lt!636683))))

(declare-fun b!1451541 () Bool)

(declare-fun res!982760 () Bool)

(assert (=> b!1451541 (=> (not res!982760) (not e!817262))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1451541 (= res!982760 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48023 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48023 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48023 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1451542 () Bool)

(declare-fun res!982769 () Bool)

(assert (=> b!1451542 (=> (not res!982769) (not e!817262))))

(assert (=> b!1451542 (= res!982769 (and (= (size!48023 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48023 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48023 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1451543 () Bool)

(assert (=> b!1451543 (= e!817259 (not true))))

(declare-fun e!817257 () Bool)

(assert (=> b!1451543 e!817257))

(declare-fun res!982771 () Bool)

(assert (=> b!1451543 (=> (not res!982771) (not e!817257))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98370 (_ BitVec 32)) Bool)

(assert (=> b!1451543 (= res!982771 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48946 0))(
  ( (Unit!48947) )
))
(declare-fun lt!636680 () Unit!48946)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98370 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48946)

(assert (=> b!1451543 (= lt!636680 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1451544 () Bool)

(assert (=> b!1451544 (= e!817257 (and (or (= (select (arr!47473 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47473 a!2862) intermediateBeforeIndex!19) (select (arr!47473 a!2862) j!93))) (or (and (= (select (arr!47473 a!2862) index!646) (select (store (arr!47473 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47473 a!2862) index!646) (select (arr!47473 a!2862) j!93))) (= (select (arr!47473 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47473 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1451545 () Bool)

(declare-fun res!982761 () Bool)

(assert (=> b!1451545 (=> (not res!982761) (not e!817259))))

(assert (=> b!1451545 (= res!982761 e!817256)))

(declare-fun c!133899 () Bool)

(assert (=> b!1451545 (= c!133899 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1451546 () Bool)

(declare-fun res!982758 () Bool)

(assert (=> b!1451546 (=> (not res!982758) (not e!817262))))

(assert (=> b!1451546 (= res!982758 (validKeyInArray!0 (select (arr!47473 a!2862) i!1006)))))

(declare-fun b!1451536 () Bool)

(assert (=> b!1451536 (= e!817256 (= lt!636681 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636682 lt!636684 mask!2687)))))

(declare-fun res!982768 () Bool)

(assert (=> start!124922 (=> (not res!982768) (not e!817262))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124922 (= res!982768 (validMask!0 mask!2687))))

(assert (=> start!124922 e!817262))

(assert (=> start!124922 true))

(declare-fun array_inv!36501 (array!98370) Bool)

(assert (=> start!124922 (array_inv!36501 a!2862)))

(declare-fun b!1451547 () Bool)

(declare-fun res!982762 () Bool)

(assert (=> b!1451547 (=> (not res!982762) (not e!817262))))

(assert (=> b!1451547 (= res!982762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1451548 () Bool)

(declare-fun res!982770 () Bool)

(assert (=> b!1451548 (=> (not res!982770) (not e!817257))))

(assert (=> b!1451548 (= res!982770 (= (seekEntryOrOpen!0 (select (arr!47473 a!2862) j!93) a!2862 mask!2687) (Found!11725 j!93)))))

(declare-fun b!1451549 () Bool)

(assert (=> b!1451549 (= e!817260 e!817261)))

(declare-fun res!982763 () Bool)

(assert (=> b!1451549 (=> (not res!982763) (not e!817261))))

(assert (=> b!1451549 (= res!982763 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47473 a!2862) j!93) mask!2687) (select (arr!47473 a!2862) j!93) a!2862 mask!2687) lt!636683))))

(assert (=> b!1451549 (= lt!636683 (Intermediate!11725 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1451550 () Bool)

(declare-fun res!982757 () Bool)

(assert (=> b!1451550 (=> (not res!982757) (not e!817262))))

(declare-datatypes ((List!33974 0))(
  ( (Nil!33971) (Cons!33970 (h!35320 (_ BitVec 64)) (t!48668 List!33974)) )
))
(declare-fun arrayNoDuplicates!0 (array!98370 (_ BitVec 32) List!33974) Bool)

(assert (=> b!1451550 (= res!982757 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33971))))

(assert (= (and start!124922 res!982768) b!1451542))

(assert (= (and b!1451542 res!982769) b!1451546))

(assert (= (and b!1451546 res!982758) b!1451537))

(assert (= (and b!1451537 res!982765) b!1451547))

(assert (= (and b!1451547 res!982762) b!1451550))

(assert (= (and b!1451550 res!982757) b!1451541))

(assert (= (and b!1451541 res!982760) b!1451534))

(assert (= (and b!1451534 res!982759) b!1451549))

(assert (= (and b!1451549 res!982763) b!1451540))

(assert (= (and b!1451540 res!982764) b!1451539))

(assert (= (and b!1451539 res!982767) b!1451545))

(assert (= (and b!1451545 c!133899) b!1451536))

(assert (= (and b!1451545 (not c!133899)) b!1451535))

(assert (= (and b!1451545 res!982761) b!1451538))

(assert (= (and b!1451538 res!982766) b!1451543))

(assert (= (and b!1451543 res!982771) b!1451548))

(assert (= (and b!1451548 res!982770) b!1451544))

(declare-fun m!1340129 () Bool)

(assert (=> b!1451547 m!1340129))

(declare-fun m!1340131 () Bool)

(assert (=> b!1451535 m!1340131))

(declare-fun m!1340133 () Bool)

(assert (=> b!1451535 m!1340133))

(declare-fun m!1340135 () Bool)

(assert (=> b!1451546 m!1340135))

(assert (=> b!1451546 m!1340135))

(declare-fun m!1340137 () Bool)

(assert (=> b!1451546 m!1340137))

(declare-fun m!1340139 () Bool)

(assert (=> b!1451549 m!1340139))

(assert (=> b!1451549 m!1340139))

(declare-fun m!1340141 () Bool)

(assert (=> b!1451549 m!1340141))

(assert (=> b!1451549 m!1340141))

(assert (=> b!1451549 m!1340139))

(declare-fun m!1340143 () Bool)

(assert (=> b!1451549 m!1340143))

(declare-fun m!1340145 () Bool)

(assert (=> start!124922 m!1340145))

(declare-fun m!1340147 () Bool)

(assert (=> start!124922 m!1340147))

(declare-fun m!1340149 () Bool)

(assert (=> b!1451550 m!1340149))

(declare-fun m!1340151 () Bool)

(assert (=> b!1451539 m!1340151))

(assert (=> b!1451539 m!1340151))

(declare-fun m!1340153 () Bool)

(assert (=> b!1451539 m!1340153))

(declare-fun m!1340155 () Bool)

(assert (=> b!1451539 m!1340155))

(declare-fun m!1340157 () Bool)

(assert (=> b!1451539 m!1340157))

(assert (=> b!1451540 m!1340139))

(assert (=> b!1451540 m!1340139))

(declare-fun m!1340159 () Bool)

(assert (=> b!1451540 m!1340159))

(assert (=> b!1451544 m!1340155))

(declare-fun m!1340161 () Bool)

(assert (=> b!1451544 m!1340161))

(declare-fun m!1340163 () Bool)

(assert (=> b!1451544 m!1340163))

(declare-fun m!1340165 () Bool)

(assert (=> b!1451544 m!1340165))

(assert (=> b!1451544 m!1340139))

(assert (=> b!1451534 m!1340155))

(declare-fun m!1340167 () Bool)

(assert (=> b!1451534 m!1340167))

(declare-fun m!1340169 () Bool)

(assert (=> b!1451536 m!1340169))

(assert (=> b!1451537 m!1340139))

(assert (=> b!1451537 m!1340139))

(declare-fun m!1340171 () Bool)

(assert (=> b!1451537 m!1340171))

(declare-fun m!1340173 () Bool)

(assert (=> b!1451543 m!1340173))

(declare-fun m!1340175 () Bool)

(assert (=> b!1451543 m!1340175))

(assert (=> b!1451548 m!1340139))

(assert (=> b!1451548 m!1340139))

(declare-fun m!1340177 () Bool)

(assert (=> b!1451548 m!1340177))

(push 1)

