; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126668 () Bool)

(assert start!126668)

(declare-fun b!1487134 () Bool)

(declare-fun e!833611 () Bool)

(declare-fun e!833606 () Bool)

(assert (=> b!1487134 (= e!833611 e!833606)))

(declare-fun res!1011424 () Bool)

(assert (=> b!1487134 (=> res!1011424 e!833606)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!648701 () (_ BitVec 64))

(declare-datatypes ((array!99567 0))(
  ( (array!99568 (arr!48058 (Array (_ BitVec 32) (_ BitVec 64))) (size!48608 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99567)

(assert (=> b!1487134 (= res!1011424 (or (and (= (select (arr!48058 a!2862) index!646) lt!648701) (= (select (arr!48058 a!2862) index!646) (select (arr!48058 a!2862) j!93))) (= (select (arr!48058 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1487134 (= lt!648701 (select (store (arr!48058 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun lt!648705 () (_ BitVec 64))

(declare-fun lt!648700 () array!99567)

(declare-fun b!1487135 () Bool)

(declare-fun e!833608 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12298 0))(
  ( (MissingZero!12298 (index!51584 (_ BitVec 32))) (Found!12298 (index!51585 (_ BitVec 32))) (Intermediate!12298 (undefined!13110 Bool) (index!51586 (_ BitVec 32)) (x!133162 (_ BitVec 32))) (Undefined!12298) (MissingVacant!12298 (index!51587 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99567 (_ BitVec 32)) SeekEntryResult!12298)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99567 (_ BitVec 32)) SeekEntryResult!12298)

(assert (=> b!1487135 (= e!833608 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648705 lt!648700 mask!2687) (seekEntryOrOpen!0 lt!648705 lt!648700 mask!2687)))))

(declare-fun b!1487136 () Bool)

(declare-fun e!833607 () Bool)

(declare-fun e!833612 () Bool)

(assert (=> b!1487136 (= e!833607 (not e!833612))))

(declare-fun res!1011425 () Bool)

(assert (=> b!1487136 (=> res!1011425 e!833612)))

(assert (=> b!1487136 (= res!1011425 (or (and (= (select (arr!48058 a!2862) index!646) (select (store (arr!48058 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48058 a!2862) index!646) (select (arr!48058 a!2862) j!93))) (= (select (arr!48058 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1487136 e!833611))

(declare-fun res!1011423 () Bool)

(assert (=> b!1487136 (=> (not res!1011423) (not e!833611))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99567 (_ BitVec 32)) Bool)

(assert (=> b!1487136 (= res!1011423 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49936 0))(
  ( (Unit!49937) )
))
(declare-fun lt!648702 () Unit!49936)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99567 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49936)

(assert (=> b!1487136 (= lt!648702 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1487137 () Bool)

(declare-fun res!1011436 () Bool)

(declare-fun e!833604 () Bool)

(assert (=> b!1487137 (=> (not res!1011436) (not e!833604))))

(assert (=> b!1487137 (= res!1011436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!1011431 () Bool)

(assert (=> start!126668 (=> (not res!1011431) (not e!833604))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126668 (= res!1011431 (validMask!0 mask!2687))))

(assert (=> start!126668 e!833604))

(assert (=> start!126668 true))

(declare-fun array_inv!37086 (array!99567) Bool)

(assert (=> start!126668 (array_inv!37086 a!2862)))

(declare-fun b!1487138 () Bool)

(declare-fun e!833610 () Bool)

(assert (=> b!1487138 (= e!833604 e!833610)))

(declare-fun res!1011428 () Bool)

(assert (=> b!1487138 (=> (not res!1011428) (not e!833610))))

(assert (=> b!1487138 (= res!1011428 (= (select (store (arr!48058 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487138 (= lt!648700 (array!99568 (store (arr!48058 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48608 a!2862)))))

(declare-fun b!1487139 () Bool)

(declare-fun res!1011420 () Bool)

(assert (=> b!1487139 (=> (not res!1011420) (not e!833604))))

(assert (=> b!1487139 (= res!1011420 (and (= (size!48608 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48608 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48608 a!2862)) (not (= i!1006 j!93))))))

(declare-fun e!833609 () Bool)

(declare-fun b!1487140 () Bool)

(assert (=> b!1487140 (= e!833609 (= (seekEntryOrOpen!0 lt!648705 lt!648700 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648705 lt!648700 mask!2687)))))

(declare-fun b!1487141 () Bool)

(declare-fun e!833605 () Bool)

(assert (=> b!1487141 (= e!833605 e!833607)))

(declare-fun res!1011422 () Bool)

(assert (=> b!1487141 (=> (not res!1011422) (not e!833607))))

(declare-fun lt!648704 () SeekEntryResult!12298)

(assert (=> b!1487141 (= res!1011422 (= lt!648704 (Intermediate!12298 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99567 (_ BitVec 32)) SeekEntryResult!12298)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1487141 (= lt!648704 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648705 mask!2687) lt!648705 lt!648700 mask!2687))))

(assert (=> b!1487141 (= lt!648705 (select (store (arr!48058 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1487142 () Bool)

(declare-fun res!1011427 () Bool)

(assert (=> b!1487142 (=> (not res!1011427) (not e!833604))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1487142 (= res!1011427 (validKeyInArray!0 (select (arr!48058 a!2862) i!1006)))))

(declare-fun b!1487143 () Bool)

(declare-fun res!1011434 () Bool)

(assert (=> b!1487143 (=> (not res!1011434) (not e!833607))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1487143 (= res!1011434 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1487144 () Bool)

(declare-fun res!1011426 () Bool)

(assert (=> b!1487144 (=> (not res!1011426) (not e!833611))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1487144 (= res!1011426 (or (= (select (arr!48058 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48058 a!2862) intermediateBeforeIndex!19) (select (arr!48058 a!2862) j!93))))))

(declare-fun b!1487145 () Bool)

(declare-fun res!1011429 () Bool)

(assert (=> b!1487145 (=> (not res!1011429) (not e!833604))))

(declare-datatypes ((List!34559 0))(
  ( (Nil!34556) (Cons!34555 (h!35932 (_ BitVec 64)) (t!49253 List!34559)) )
))
(declare-fun arrayNoDuplicates!0 (array!99567 (_ BitVec 32) List!34559) Bool)

(assert (=> b!1487145 (= res!1011429 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34556))))

(declare-fun b!1487146 () Bool)

(assert (=> b!1487146 (= e!833612 true)))

(declare-fun lt!648703 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1487146 (= lt!648703 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1487147 () Bool)

(declare-fun res!1011433 () Bool)

(assert (=> b!1487147 (=> (not res!1011433) (not e!833604))))

(assert (=> b!1487147 (= res!1011433 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48608 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48608 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48608 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1487148 () Bool)

(declare-fun res!1011432 () Bool)

(assert (=> b!1487148 (=> (not res!1011432) (not e!833604))))

(assert (=> b!1487148 (= res!1011432 (validKeyInArray!0 (select (arr!48058 a!2862) j!93)))))

(declare-fun b!1487149 () Bool)

(assert (=> b!1487149 (= e!833610 e!833605)))

(declare-fun res!1011418 () Bool)

(assert (=> b!1487149 (=> (not res!1011418) (not e!833605))))

(declare-fun lt!648699 () SeekEntryResult!12298)

(assert (=> b!1487149 (= res!1011418 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48058 a!2862) j!93) mask!2687) (select (arr!48058 a!2862) j!93) a!2862 mask!2687) lt!648699))))

(assert (=> b!1487149 (= lt!648699 (Intermediate!12298 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1487150 () Bool)

(declare-fun res!1011430 () Bool)

(assert (=> b!1487150 (=> (not res!1011430) (not e!833607))))

(assert (=> b!1487150 (= res!1011430 e!833608)))

(declare-fun c!137382 () Bool)

(assert (=> b!1487150 (= c!137382 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1487151 () Bool)

(assert (=> b!1487151 (= e!833606 e!833609)))

(declare-fun res!1011419 () Bool)

(assert (=> b!1487151 (=> (not res!1011419) (not e!833609))))

(assert (=> b!1487151 (= res!1011419 (and (= index!646 intermediateAfterIndex!19) (= lt!648701 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1487152 () Bool)

(declare-fun res!1011435 () Bool)

(assert (=> b!1487152 (=> (not res!1011435) (not e!833605))))

(assert (=> b!1487152 (= res!1011435 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48058 a!2862) j!93) a!2862 mask!2687) lt!648699))))

(declare-fun b!1487153 () Bool)

(assert (=> b!1487153 (= e!833608 (= lt!648704 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648705 lt!648700 mask!2687)))))

(declare-fun b!1487154 () Bool)

(declare-fun res!1011421 () Bool)

(assert (=> b!1487154 (=> (not res!1011421) (not e!833611))))

(assert (=> b!1487154 (= res!1011421 (= (seekEntryOrOpen!0 (select (arr!48058 a!2862) j!93) a!2862 mask!2687) (Found!12298 j!93)))))

(assert (= (and start!126668 res!1011431) b!1487139))

(assert (= (and b!1487139 res!1011420) b!1487142))

(assert (= (and b!1487142 res!1011427) b!1487148))

(assert (= (and b!1487148 res!1011432) b!1487137))

(assert (= (and b!1487137 res!1011436) b!1487145))

(assert (= (and b!1487145 res!1011429) b!1487147))

(assert (= (and b!1487147 res!1011433) b!1487138))

(assert (= (and b!1487138 res!1011428) b!1487149))

(assert (= (and b!1487149 res!1011418) b!1487152))

(assert (= (and b!1487152 res!1011435) b!1487141))

(assert (= (and b!1487141 res!1011422) b!1487150))

(assert (= (and b!1487150 c!137382) b!1487153))

(assert (= (and b!1487150 (not c!137382)) b!1487135))

(assert (= (and b!1487150 res!1011430) b!1487143))

(assert (= (and b!1487143 res!1011434) b!1487136))

(assert (= (and b!1487136 res!1011423) b!1487154))

(assert (= (and b!1487154 res!1011421) b!1487144))

(assert (= (and b!1487144 res!1011426) b!1487134))

(assert (= (and b!1487134 (not res!1011424)) b!1487151))

(assert (= (and b!1487151 res!1011419) b!1487140))

(assert (= (and b!1487136 (not res!1011425)) b!1487146))

(declare-fun m!1371891 () Bool)

(assert (=> b!1487138 m!1371891))

(declare-fun m!1371893 () Bool)

(assert (=> b!1487138 m!1371893))

(declare-fun m!1371895 () Bool)

(assert (=> b!1487153 m!1371895))

(declare-fun m!1371897 () Bool)

(assert (=> b!1487145 m!1371897))

(declare-fun m!1371899 () Bool)

(assert (=> b!1487148 m!1371899))

(assert (=> b!1487148 m!1371899))

(declare-fun m!1371901 () Bool)

(assert (=> b!1487148 m!1371901))

(declare-fun m!1371903 () Bool)

(assert (=> b!1487141 m!1371903))

(assert (=> b!1487141 m!1371903))

(declare-fun m!1371905 () Bool)

(assert (=> b!1487141 m!1371905))

(assert (=> b!1487141 m!1371891))

(declare-fun m!1371907 () Bool)

(assert (=> b!1487141 m!1371907))

(declare-fun m!1371909 () Bool)

(assert (=> start!126668 m!1371909))

(declare-fun m!1371911 () Bool)

(assert (=> start!126668 m!1371911))

(declare-fun m!1371913 () Bool)

(assert (=> b!1487135 m!1371913))

(declare-fun m!1371915 () Bool)

(assert (=> b!1487135 m!1371915))

(assert (=> b!1487154 m!1371899))

(assert (=> b!1487154 m!1371899))

(declare-fun m!1371917 () Bool)

(assert (=> b!1487154 m!1371917))

(declare-fun m!1371919 () Bool)

(assert (=> b!1487136 m!1371919))

(assert (=> b!1487136 m!1371891))

(declare-fun m!1371921 () Bool)

(assert (=> b!1487136 m!1371921))

(declare-fun m!1371923 () Bool)

(assert (=> b!1487136 m!1371923))

(declare-fun m!1371925 () Bool)

(assert (=> b!1487136 m!1371925))

(assert (=> b!1487136 m!1371899))

(assert (=> b!1487149 m!1371899))

(assert (=> b!1487149 m!1371899))

(declare-fun m!1371927 () Bool)

(assert (=> b!1487149 m!1371927))

(assert (=> b!1487149 m!1371927))

(assert (=> b!1487149 m!1371899))

(declare-fun m!1371929 () Bool)

(assert (=> b!1487149 m!1371929))

(declare-fun m!1371931 () Bool)

(assert (=> b!1487142 m!1371931))

(assert (=> b!1487142 m!1371931))

(declare-fun m!1371933 () Bool)

(assert (=> b!1487142 m!1371933))

(declare-fun m!1371935 () Bool)

(assert (=> b!1487146 m!1371935))

(declare-fun m!1371937 () Bool)

(assert (=> b!1487144 m!1371937))

(assert (=> b!1487144 m!1371899))

(assert (=> b!1487140 m!1371915))

(assert (=> b!1487140 m!1371913))

(declare-fun m!1371939 () Bool)

(assert (=> b!1487137 m!1371939))

(assert (=> b!1487152 m!1371899))

(assert (=> b!1487152 m!1371899))

(declare-fun m!1371941 () Bool)

(assert (=> b!1487152 m!1371941))

(assert (=> b!1487134 m!1371923))

(assert (=> b!1487134 m!1371899))

(assert (=> b!1487134 m!1371891))

(assert (=> b!1487134 m!1371921))

(push 1)

