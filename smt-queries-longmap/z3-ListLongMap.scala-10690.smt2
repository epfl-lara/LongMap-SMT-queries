; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125280 () Bool)

(assert start!125280)

(declare-fun b!1462713 () Bool)

(declare-fun res!992101 () Bool)

(declare-fun e!822194 () Bool)

(assert (=> b!1462713 (=> (not res!992101) (not e!822194))))

(declare-datatypes ((array!98728 0))(
  ( (array!98729 (arr!47652 (Array (_ BitVec 32) (_ BitVec 64))) (size!48202 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98728)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11904 0))(
  ( (MissingZero!11904 (index!50008 (_ BitVec 32))) (Found!11904 (index!50009 (_ BitVec 32))) (Intermediate!11904 (undefined!12716 Bool) (index!50010 (_ BitVec 32)) (x!131601 (_ BitVec 32))) (Undefined!11904) (MissingVacant!11904 (index!50011 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98728 (_ BitVec 32)) SeekEntryResult!11904)

(assert (=> b!1462713 (= res!992101 (= (seekEntryOrOpen!0 (select (arr!47652 a!2862) j!93) a!2862 mask!2687) (Found!11904 j!93)))))

(declare-fun b!1462714 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1462714 (= e!822194 (or (= (select (arr!47652 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47652 a!2862) intermediateBeforeIndex!19) (select (arr!47652 a!2862) j!93))))))

(declare-fun b!1462715 () Bool)

(declare-fun res!992098 () Bool)

(declare-fun e!822192 () Bool)

(assert (=> b!1462715 (=> (not res!992098) (not e!822192))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1462715 (= res!992098 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48202 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48202 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48202 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1462716 () Bool)

(declare-fun e!822197 () Bool)

(assert (=> b!1462716 (= e!822192 e!822197)))

(declare-fun res!992100 () Bool)

(assert (=> b!1462716 (=> (not res!992100) (not e!822197))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1462716 (= res!992100 (= (select (store (arr!47652 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!640537 () array!98728)

(assert (=> b!1462716 (= lt!640537 (array!98729 (store (arr!47652 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48202 a!2862)))))

(declare-fun b!1462717 () Bool)

(declare-fun res!992109 () Bool)

(assert (=> b!1462717 (=> (not res!992109) (not e!822192))))

(declare-datatypes ((List!34153 0))(
  ( (Nil!34150) (Cons!34149 (h!35499 (_ BitVec 64)) (t!48847 List!34153)) )
))
(declare-fun arrayNoDuplicates!0 (array!98728 (_ BitVec 32) List!34153) Bool)

(assert (=> b!1462717 (= res!992109 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34150))))

(declare-fun b!1462718 () Bool)

(declare-fun res!992097 () Bool)

(assert (=> b!1462718 (=> (not res!992097) (not e!822192))))

(assert (=> b!1462718 (= res!992097 (and (= (size!48202 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48202 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48202 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!992105 () Bool)

(assert (=> start!125280 (=> (not res!992105) (not e!822192))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125280 (= res!992105 (validMask!0 mask!2687))))

(assert (=> start!125280 e!822192))

(assert (=> start!125280 true))

(declare-fun array_inv!36680 (array!98728) Bool)

(assert (=> start!125280 (array_inv!36680 a!2862)))

(declare-fun b!1462719 () Bool)

(declare-fun e!822198 () Bool)

(declare-fun e!822193 () Bool)

(assert (=> b!1462719 (= e!822198 e!822193)))

(declare-fun res!992112 () Bool)

(assert (=> b!1462719 (=> (not res!992112) (not e!822193))))

(declare-fun lt!640538 () SeekEntryResult!11904)

(assert (=> b!1462719 (= res!992112 (= lt!640538 (Intermediate!11904 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!640542 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98728 (_ BitVec 32)) SeekEntryResult!11904)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462719 (= lt!640538 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640542 mask!2687) lt!640542 lt!640537 mask!2687))))

(assert (=> b!1462719 (= lt!640542 (select (store (arr!47652 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1462720 () Bool)

(declare-fun e!822199 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98728 (_ BitVec 32)) SeekEntryResult!11904)

(assert (=> b!1462720 (= e!822199 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640542 lt!640537 mask!2687) (seekEntryOrOpen!0 lt!640542 lt!640537 mask!2687)))))

(declare-fun b!1462721 () Bool)

(declare-fun res!992113 () Bool)

(assert (=> b!1462721 (=> (not res!992113) (not e!822192))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1462721 (= res!992113 (validKeyInArray!0 (select (arr!47652 a!2862) i!1006)))))

(declare-fun e!822195 () Bool)

(declare-fun lt!640541 () (_ BitVec 32))

(declare-fun b!1462722 () Bool)

(assert (=> b!1462722 (= e!822195 (not (= lt!640538 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640541 lt!640542 lt!640537 mask!2687))))))

(declare-fun b!1462723 () Bool)

(assert (=> b!1462723 (= e!822197 e!822198)))

(declare-fun res!992111 () Bool)

(assert (=> b!1462723 (=> (not res!992111) (not e!822198))))

(declare-fun lt!640540 () SeekEntryResult!11904)

(assert (=> b!1462723 (= res!992111 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47652 a!2862) j!93) mask!2687) (select (arr!47652 a!2862) j!93) a!2862 mask!2687) lt!640540))))

(assert (=> b!1462723 (= lt!640540 (Intermediate!11904 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1462724 () Bool)

(assert (=> b!1462724 (= e!822199 (= lt!640538 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640542 lt!640537 mask!2687)))))

(declare-fun b!1462725 () Bool)

(declare-fun e!822191 () Bool)

(assert (=> b!1462725 (= e!822191 true)))

(declare-fun lt!640536 () Bool)

(assert (=> b!1462725 (= lt!640536 e!822195)))

(declare-fun c!134819 () Bool)

(assert (=> b!1462725 (= c!134819 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1462726 () Bool)

(declare-fun res!992104 () Bool)

(assert (=> b!1462726 (=> (not res!992104) (not e!822198))))

(assert (=> b!1462726 (= res!992104 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47652 a!2862) j!93) a!2862 mask!2687) lt!640540))))

(declare-fun b!1462727 () Bool)

(declare-fun e!822196 () Bool)

(assert (=> b!1462727 (= e!822193 (not e!822196))))

(declare-fun res!992103 () Bool)

(assert (=> b!1462727 (=> res!992103 e!822196)))

(assert (=> b!1462727 (= res!992103 (or (and (= (select (arr!47652 a!2862) index!646) (select (store (arr!47652 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47652 a!2862) index!646) (select (arr!47652 a!2862) j!93))) (= (select (arr!47652 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1462727 e!822194))

(declare-fun res!992110 () Bool)

(assert (=> b!1462727 (=> (not res!992110) (not e!822194))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98728 (_ BitVec 32)) Bool)

(assert (=> b!1462727 (= res!992110 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49304 0))(
  ( (Unit!49305) )
))
(declare-fun lt!640539 () Unit!49304)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98728 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49304)

(assert (=> b!1462727 (= lt!640539 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1462728 () Bool)

(declare-fun res!992096 () Bool)

(assert (=> b!1462728 (=> (not res!992096) (not e!822192))))

(assert (=> b!1462728 (= res!992096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1462729 () Bool)

(declare-fun res!992102 () Bool)

(assert (=> b!1462729 (=> res!992102 e!822191)))

(assert (=> b!1462729 (= res!992102 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640541 (select (arr!47652 a!2862) j!93) a!2862 mask!2687) lt!640540)))))

(declare-fun b!1462730 () Bool)

(declare-fun res!992099 () Bool)

(assert (=> b!1462730 (=> (not res!992099) (not e!822193))))

(assert (=> b!1462730 (= res!992099 e!822199)))

(declare-fun c!134820 () Bool)

(assert (=> b!1462730 (= c!134820 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1462731 () Bool)

(assert (=> b!1462731 (= e!822196 e!822191)))

(declare-fun res!992107 () Bool)

(assert (=> b!1462731 (=> res!992107 e!822191)))

(assert (=> b!1462731 (= res!992107 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640541 #b00000000000000000000000000000000) (bvsge lt!640541 (size!48202 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462731 (= lt!640541 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1462732 () Bool)

(assert (=> b!1462732 (= e!822195 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640541 intermediateAfterIndex!19 lt!640542 lt!640537 mask!2687) (seekEntryOrOpen!0 lt!640542 lt!640537 mask!2687))))))

(declare-fun b!1462733 () Bool)

(declare-fun res!992106 () Bool)

(assert (=> b!1462733 (=> (not res!992106) (not e!822192))))

(assert (=> b!1462733 (= res!992106 (validKeyInArray!0 (select (arr!47652 a!2862) j!93)))))

(declare-fun b!1462734 () Bool)

(declare-fun res!992108 () Bool)

(assert (=> b!1462734 (=> (not res!992108) (not e!822193))))

(assert (=> b!1462734 (= res!992108 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!125280 res!992105) b!1462718))

(assert (= (and b!1462718 res!992097) b!1462721))

(assert (= (and b!1462721 res!992113) b!1462733))

(assert (= (and b!1462733 res!992106) b!1462728))

(assert (= (and b!1462728 res!992096) b!1462717))

(assert (= (and b!1462717 res!992109) b!1462715))

(assert (= (and b!1462715 res!992098) b!1462716))

(assert (= (and b!1462716 res!992100) b!1462723))

(assert (= (and b!1462723 res!992111) b!1462726))

(assert (= (and b!1462726 res!992104) b!1462719))

(assert (= (and b!1462719 res!992112) b!1462730))

(assert (= (and b!1462730 c!134820) b!1462724))

(assert (= (and b!1462730 (not c!134820)) b!1462720))

(assert (= (and b!1462730 res!992099) b!1462734))

(assert (= (and b!1462734 res!992108) b!1462727))

(assert (= (and b!1462727 res!992110) b!1462713))

(assert (= (and b!1462713 res!992101) b!1462714))

(assert (= (and b!1462727 (not res!992103)) b!1462731))

(assert (= (and b!1462731 (not res!992107)) b!1462729))

(assert (= (and b!1462729 (not res!992102)) b!1462725))

(assert (= (and b!1462725 c!134819) b!1462722))

(assert (= (and b!1462725 (not c!134819)) b!1462732))

(declare-fun m!1350137 () Bool)

(assert (=> b!1462719 m!1350137))

(assert (=> b!1462719 m!1350137))

(declare-fun m!1350139 () Bool)

(assert (=> b!1462719 m!1350139))

(declare-fun m!1350141 () Bool)

(assert (=> b!1462719 m!1350141))

(declare-fun m!1350143 () Bool)

(assert (=> b!1462719 m!1350143))

(declare-fun m!1350145 () Bool)

(assert (=> b!1462724 m!1350145))

(assert (=> b!1462716 m!1350141))

(declare-fun m!1350147 () Bool)

(assert (=> b!1462716 m!1350147))

(declare-fun m!1350149 () Bool)

(assert (=> b!1462714 m!1350149))

(declare-fun m!1350151 () Bool)

(assert (=> b!1462714 m!1350151))

(assert (=> b!1462729 m!1350151))

(assert (=> b!1462729 m!1350151))

(declare-fun m!1350153 () Bool)

(assert (=> b!1462729 m!1350153))

(declare-fun m!1350155 () Bool)

(assert (=> b!1462722 m!1350155))

(declare-fun m!1350157 () Bool)

(assert (=> b!1462721 m!1350157))

(assert (=> b!1462721 m!1350157))

(declare-fun m!1350159 () Bool)

(assert (=> b!1462721 m!1350159))

(declare-fun m!1350161 () Bool)

(assert (=> b!1462720 m!1350161))

(declare-fun m!1350163 () Bool)

(assert (=> b!1462720 m!1350163))

(assert (=> b!1462713 m!1350151))

(assert (=> b!1462713 m!1350151))

(declare-fun m!1350165 () Bool)

(assert (=> b!1462713 m!1350165))

(assert (=> b!1462723 m!1350151))

(assert (=> b!1462723 m!1350151))

(declare-fun m!1350167 () Bool)

(assert (=> b!1462723 m!1350167))

(assert (=> b!1462723 m!1350167))

(assert (=> b!1462723 m!1350151))

(declare-fun m!1350169 () Bool)

(assert (=> b!1462723 m!1350169))

(assert (=> b!1462726 m!1350151))

(assert (=> b!1462726 m!1350151))

(declare-fun m!1350171 () Bool)

(assert (=> b!1462726 m!1350171))

(declare-fun m!1350173 () Bool)

(assert (=> b!1462731 m!1350173))

(declare-fun m!1350175 () Bool)

(assert (=> b!1462732 m!1350175))

(assert (=> b!1462732 m!1350163))

(declare-fun m!1350177 () Bool)

(assert (=> b!1462717 m!1350177))

(declare-fun m!1350179 () Bool)

(assert (=> start!125280 m!1350179))

(declare-fun m!1350181 () Bool)

(assert (=> start!125280 m!1350181))

(assert (=> b!1462733 m!1350151))

(assert (=> b!1462733 m!1350151))

(declare-fun m!1350183 () Bool)

(assert (=> b!1462733 m!1350183))

(declare-fun m!1350185 () Bool)

(assert (=> b!1462727 m!1350185))

(assert (=> b!1462727 m!1350141))

(declare-fun m!1350187 () Bool)

(assert (=> b!1462727 m!1350187))

(declare-fun m!1350189 () Bool)

(assert (=> b!1462727 m!1350189))

(declare-fun m!1350191 () Bool)

(assert (=> b!1462727 m!1350191))

(assert (=> b!1462727 m!1350151))

(declare-fun m!1350193 () Bool)

(assert (=> b!1462728 m!1350193))

(check-sat (not b!1462727) (not b!1462722) (not b!1462732) (not b!1462713) (not b!1462719) (not b!1462717) (not b!1462724) (not b!1462731) (not b!1462723) (not b!1462729) (not b!1462721) (not b!1462728) (not start!125280) (not b!1462720) (not b!1462726) (not b!1462733))
(check-sat)
