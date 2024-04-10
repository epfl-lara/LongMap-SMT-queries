; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125928 () Bool)

(assert start!125928)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!99205 0))(
  ( (array!99206 (arr!47886 (Array (_ BitVec 32) (_ BitVec 64))) (size!48436 (_ BitVec 32))) )
))
(declare-fun lt!644338 () array!99205)

(declare-fun e!827389 () Bool)

(declare-datatypes ((SeekEntryResult!12126 0))(
  ( (MissingZero!12126 (index!50896 (_ BitVec 32))) (Found!12126 (index!50897 (_ BitVec 32))) (Intermediate!12126 (undefined!12938 Bool) (index!50898 (_ BitVec 32)) (x!132474 (_ BitVec 32))) (Undefined!12126) (MissingVacant!12126 (index!50899 (_ BitVec 32))) )
))
(declare-fun lt!644340 () SeekEntryResult!12126)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1474716 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!644341 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99205 (_ BitVec 32)) SeekEntryResult!12126)

(assert (=> b!1474716 (= e!827389 (= lt!644340 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644341 lt!644338 mask!2687)))))

(declare-fun b!1474717 () Bool)

(declare-fun e!827390 () Bool)

(declare-fun e!827388 () Bool)

(assert (=> b!1474717 (= e!827390 e!827388)))

(declare-fun res!1001899 () Bool)

(assert (=> b!1474717 (=> (not res!1001899) (not e!827388))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1474717 (= res!1001899 (= lt!644340 (Intermediate!12126 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1474717 (= lt!644340 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644341 mask!2687) lt!644341 lt!644338 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99205)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1474717 (= lt!644341 (select (store (arr!47886 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1474718 () Bool)

(declare-fun res!1001891 () Bool)

(assert (=> b!1474718 (=> (not res!1001891) (not e!827388))))

(assert (=> b!1474718 (= res!1001891 e!827389)))

(declare-fun c!135930 () Bool)

(assert (=> b!1474718 (= c!135930 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!1001894 () Bool)

(declare-fun e!827391 () Bool)

(assert (=> start!125928 (=> (not res!1001894) (not e!827391))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125928 (= res!1001894 (validMask!0 mask!2687))))

(assert (=> start!125928 e!827391))

(assert (=> start!125928 true))

(declare-fun array_inv!36914 (array!99205) Bool)

(assert (=> start!125928 (array_inv!36914 a!2862)))

(declare-fun b!1474719 () Bool)

(declare-fun res!1001892 () Bool)

(assert (=> b!1474719 (=> (not res!1001892) (not e!827391))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99205 (_ BitVec 32)) Bool)

(assert (=> b!1474719 (= res!1001892 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1474720 () Bool)

(declare-fun e!827387 () Bool)

(assert (=> b!1474720 (= e!827387 e!827390)))

(declare-fun res!1001898 () Bool)

(assert (=> b!1474720 (=> (not res!1001898) (not e!827390))))

(declare-fun lt!644343 () SeekEntryResult!12126)

(assert (=> b!1474720 (= res!1001898 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47886 a!2862) j!93) mask!2687) (select (arr!47886 a!2862) j!93) a!2862 mask!2687) lt!644343))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1474720 (= lt!644343 (Intermediate!12126 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1474721 () Bool)

(declare-fun res!1001895 () Bool)

(assert (=> b!1474721 (=> (not res!1001895) (not e!827390))))

(assert (=> b!1474721 (= res!1001895 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47886 a!2862) j!93) a!2862 mask!2687) lt!644343))))

(declare-fun b!1474722 () Bool)

(declare-fun res!1001886 () Bool)

(assert (=> b!1474722 (=> (not res!1001886) (not e!827391))))

(declare-datatypes ((List!34387 0))(
  ( (Nil!34384) (Cons!34383 (h!35742 (_ BitVec 64)) (t!49081 List!34387)) )
))
(declare-fun arrayNoDuplicates!0 (array!99205 (_ BitVec 32) List!34387) Bool)

(assert (=> b!1474722 (= res!1001886 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34384))))

(declare-fun b!1474723 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99205 (_ BitVec 32)) SeekEntryResult!12126)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99205 (_ BitVec 32)) SeekEntryResult!12126)

(assert (=> b!1474723 (= e!827389 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644341 lt!644338 mask!2687) (seekEntryOrOpen!0 lt!644341 lt!644338 mask!2687)))))

(declare-fun b!1474724 () Bool)

(assert (=> b!1474724 (= e!827391 e!827387)))

(declare-fun res!1001888 () Bool)

(assert (=> b!1474724 (=> (not res!1001888) (not e!827387))))

(assert (=> b!1474724 (= res!1001888 (= (select (store (arr!47886 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1474724 (= lt!644338 (array!99206 (store (arr!47886 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48436 a!2862)))))

(declare-fun b!1474725 () Bool)

(declare-fun res!1001887 () Bool)

(assert (=> b!1474725 (=> (not res!1001887) (not e!827391))))

(assert (=> b!1474725 (= res!1001887 (and (= (size!48436 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48436 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48436 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1474726 () Bool)

(declare-fun res!1001896 () Bool)

(assert (=> b!1474726 (=> (not res!1001896) (not e!827391))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1474726 (= res!1001896 (validKeyInArray!0 (select (arr!47886 a!2862) j!93)))))

(declare-fun b!1474727 () Bool)

(declare-fun res!1001890 () Bool)

(assert (=> b!1474727 (=> (not res!1001890) (not e!827391))))

(assert (=> b!1474727 (= res!1001890 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48436 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48436 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48436 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun e!827393 () Bool)

(declare-fun lt!644342 () SeekEntryResult!12126)

(declare-fun b!1474728 () Bool)

(assert (=> b!1474728 (= e!827393 (= lt!644342 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47886 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1474729 () Bool)

(declare-fun res!1001897 () Bool)

(assert (=> b!1474729 (=> (not res!1001897) (not e!827388))))

(assert (=> b!1474729 (= res!1001897 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1474730 () Bool)

(declare-fun res!1001893 () Bool)

(assert (=> b!1474730 (=> (not res!1001893) (not e!827391))))

(assert (=> b!1474730 (= res!1001893 (validKeyInArray!0 (select (arr!47886 a!2862) i!1006)))))

(declare-fun b!1474731 () Bool)

(assert (=> b!1474731 (= e!827388 (not e!827393))))

(declare-fun res!1001889 () Bool)

(assert (=> b!1474731 (=> res!1001889 e!827393)))

(assert (=> b!1474731 (= res!1001889 (or (and (= (select (arr!47886 a!2862) index!646) (select (store (arr!47886 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47886 a!2862) index!646) (select (arr!47886 a!2862) j!93))) (not (= (select (arr!47886 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1474731 (and (= lt!644342 (Found!12126 j!93)) (or (= (select (arr!47886 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47886 a!2862) intermediateBeforeIndex!19) (select (arr!47886 a!2862) j!93))))))

(assert (=> b!1474731 (= lt!644342 (seekEntryOrOpen!0 (select (arr!47886 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1474731 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49592 0))(
  ( (Unit!49593) )
))
(declare-fun lt!644339 () Unit!49592)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99205 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49592)

(assert (=> b!1474731 (= lt!644339 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!125928 res!1001894) b!1474725))

(assert (= (and b!1474725 res!1001887) b!1474730))

(assert (= (and b!1474730 res!1001893) b!1474726))

(assert (= (and b!1474726 res!1001896) b!1474719))

(assert (= (and b!1474719 res!1001892) b!1474722))

(assert (= (and b!1474722 res!1001886) b!1474727))

(assert (= (and b!1474727 res!1001890) b!1474724))

(assert (= (and b!1474724 res!1001888) b!1474720))

(assert (= (and b!1474720 res!1001898) b!1474721))

(assert (= (and b!1474721 res!1001895) b!1474717))

(assert (= (and b!1474717 res!1001899) b!1474718))

(assert (= (and b!1474718 c!135930) b!1474716))

(assert (= (and b!1474718 (not c!135930)) b!1474723))

(assert (= (and b!1474718 res!1001891) b!1474729))

(assert (= (and b!1474729 res!1001897) b!1474731))

(assert (= (and b!1474731 (not res!1001889)) b!1474728))

(declare-fun m!1361147 () Bool)

(assert (=> b!1474724 m!1361147))

(declare-fun m!1361149 () Bool)

(assert (=> b!1474724 m!1361149))

(declare-fun m!1361151 () Bool)

(assert (=> b!1474723 m!1361151))

(declare-fun m!1361153 () Bool)

(assert (=> b!1474723 m!1361153))

(declare-fun m!1361155 () Bool)

(assert (=> b!1474719 m!1361155))

(declare-fun m!1361157 () Bool)

(assert (=> b!1474722 m!1361157))

(declare-fun m!1361159 () Bool)

(assert (=> b!1474728 m!1361159))

(assert (=> b!1474728 m!1361159))

(declare-fun m!1361161 () Bool)

(assert (=> b!1474728 m!1361161))

(assert (=> b!1474720 m!1361159))

(assert (=> b!1474720 m!1361159))

(declare-fun m!1361163 () Bool)

(assert (=> b!1474720 m!1361163))

(assert (=> b!1474720 m!1361163))

(assert (=> b!1474720 m!1361159))

(declare-fun m!1361165 () Bool)

(assert (=> b!1474720 m!1361165))

(declare-fun m!1361167 () Bool)

(assert (=> b!1474731 m!1361167))

(assert (=> b!1474731 m!1361147))

(declare-fun m!1361169 () Bool)

(assert (=> b!1474731 m!1361169))

(declare-fun m!1361171 () Bool)

(assert (=> b!1474731 m!1361171))

(declare-fun m!1361173 () Bool)

(assert (=> b!1474731 m!1361173))

(assert (=> b!1474731 m!1361159))

(declare-fun m!1361175 () Bool)

(assert (=> b!1474731 m!1361175))

(declare-fun m!1361177 () Bool)

(assert (=> b!1474731 m!1361177))

(assert (=> b!1474731 m!1361159))

(declare-fun m!1361179 () Bool)

(assert (=> start!125928 m!1361179))

(declare-fun m!1361181 () Bool)

(assert (=> start!125928 m!1361181))

(assert (=> b!1474721 m!1361159))

(assert (=> b!1474721 m!1361159))

(declare-fun m!1361183 () Bool)

(assert (=> b!1474721 m!1361183))

(declare-fun m!1361185 () Bool)

(assert (=> b!1474716 m!1361185))

(declare-fun m!1361187 () Bool)

(assert (=> b!1474730 m!1361187))

(assert (=> b!1474730 m!1361187))

(declare-fun m!1361189 () Bool)

(assert (=> b!1474730 m!1361189))

(assert (=> b!1474726 m!1361159))

(assert (=> b!1474726 m!1361159))

(declare-fun m!1361191 () Bool)

(assert (=> b!1474726 m!1361191))

(declare-fun m!1361193 () Bool)

(assert (=> b!1474717 m!1361193))

(assert (=> b!1474717 m!1361193))

(declare-fun m!1361195 () Bool)

(assert (=> b!1474717 m!1361195))

(assert (=> b!1474717 m!1361147))

(declare-fun m!1361197 () Bool)

(assert (=> b!1474717 m!1361197))

(check-sat (not b!1474731) (not b!1474723) (not b!1474719) (not b!1474726) (not b!1474722) (not start!125928) (not b!1474721) (not b!1474730) (not b!1474720) (not b!1474728) (not b!1474717) (not b!1474716))
(check-sat)
(get-model)

(declare-fun d!155663 () Bool)

(declare-fun lt!644367 () SeekEntryResult!12126)

(get-info :version)

(assert (=> d!155663 (and (or ((_ is Undefined!12126) lt!644367) (not ((_ is Found!12126) lt!644367)) (and (bvsge (index!50897 lt!644367) #b00000000000000000000000000000000) (bvslt (index!50897 lt!644367) (size!48436 lt!644338)))) (or ((_ is Undefined!12126) lt!644367) ((_ is Found!12126) lt!644367) (not ((_ is MissingVacant!12126) lt!644367)) (not (= (index!50899 lt!644367) intermediateAfterIndex!19)) (and (bvsge (index!50899 lt!644367) #b00000000000000000000000000000000) (bvslt (index!50899 lt!644367) (size!48436 lt!644338)))) (or ((_ is Undefined!12126) lt!644367) (ite ((_ is Found!12126) lt!644367) (= (select (arr!47886 lt!644338) (index!50897 lt!644367)) lt!644341) (and ((_ is MissingVacant!12126) lt!644367) (= (index!50899 lt!644367) intermediateAfterIndex!19) (= (select (arr!47886 lt!644338) (index!50899 lt!644367)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!827422 () SeekEntryResult!12126)

(assert (=> d!155663 (= lt!644367 e!827422)))

(declare-fun c!135940 () Bool)

(assert (=> d!155663 (= c!135940 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!644366 () (_ BitVec 64))

(assert (=> d!155663 (= lt!644366 (select (arr!47886 lt!644338) index!646))))

(assert (=> d!155663 (validMask!0 mask!2687)))

(assert (=> d!155663 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644341 lt!644338 mask!2687) lt!644367)))

(declare-fun b!1474792 () Bool)

(declare-fun e!827423 () SeekEntryResult!12126)

(assert (=> b!1474792 (= e!827422 e!827423)))

(declare-fun c!135941 () Bool)

(assert (=> b!1474792 (= c!135941 (= lt!644366 lt!644341))))

(declare-fun b!1474793 () Bool)

(assert (=> b!1474793 (= e!827423 (Found!12126 index!646))))

(declare-fun b!1474794 () Bool)

(declare-fun c!135942 () Bool)

(assert (=> b!1474794 (= c!135942 (= lt!644366 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!827421 () SeekEntryResult!12126)

(assert (=> b!1474794 (= e!827423 e!827421)))

(declare-fun b!1474795 () Bool)

(assert (=> b!1474795 (= e!827422 Undefined!12126)))

(declare-fun b!1474796 () Bool)

(assert (=> b!1474796 (= e!827421 (MissingVacant!12126 intermediateAfterIndex!19))))

(declare-fun b!1474797 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1474797 (= e!827421 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!644341 lt!644338 mask!2687))))

(assert (= (and d!155663 c!135940) b!1474795))

(assert (= (and d!155663 (not c!135940)) b!1474792))

(assert (= (and b!1474792 c!135941) b!1474793))

(assert (= (and b!1474792 (not c!135941)) b!1474794))

(assert (= (and b!1474794 c!135942) b!1474796))

(assert (= (and b!1474794 (not c!135942)) b!1474797))

(declare-fun m!1361251 () Bool)

(assert (=> d!155663 m!1361251))

(declare-fun m!1361253 () Bool)

(assert (=> d!155663 m!1361253))

(declare-fun m!1361255 () Bool)

(assert (=> d!155663 m!1361255))

(assert (=> d!155663 m!1361179))

(declare-fun m!1361257 () Bool)

(assert (=> b!1474797 m!1361257))

(assert (=> b!1474797 m!1361257))

(declare-fun m!1361259 () Bool)

(assert (=> b!1474797 m!1361259))

(assert (=> b!1474723 d!155663))

(declare-fun b!1474810 () Bool)

(declare-fun e!827430 () SeekEntryResult!12126)

(declare-fun e!827432 () SeekEntryResult!12126)

(assert (=> b!1474810 (= e!827430 e!827432)))

(declare-fun lt!644375 () (_ BitVec 64))

(declare-fun lt!644376 () SeekEntryResult!12126)

(assert (=> b!1474810 (= lt!644375 (select (arr!47886 lt!644338) (index!50898 lt!644376)))))

(declare-fun c!135949 () Bool)

(assert (=> b!1474810 (= c!135949 (= lt!644375 lt!644341))))

(declare-fun b!1474811 () Bool)

(declare-fun c!135951 () Bool)

(assert (=> b!1474811 (= c!135951 (= lt!644375 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!827431 () SeekEntryResult!12126)

(assert (=> b!1474811 (= e!827432 e!827431)))

(declare-fun d!155665 () Bool)

(declare-fun lt!644374 () SeekEntryResult!12126)

(assert (=> d!155665 (and (or ((_ is Undefined!12126) lt!644374) (not ((_ is Found!12126) lt!644374)) (and (bvsge (index!50897 lt!644374) #b00000000000000000000000000000000) (bvslt (index!50897 lt!644374) (size!48436 lt!644338)))) (or ((_ is Undefined!12126) lt!644374) ((_ is Found!12126) lt!644374) (not ((_ is MissingZero!12126) lt!644374)) (and (bvsge (index!50896 lt!644374) #b00000000000000000000000000000000) (bvslt (index!50896 lt!644374) (size!48436 lt!644338)))) (or ((_ is Undefined!12126) lt!644374) ((_ is Found!12126) lt!644374) ((_ is MissingZero!12126) lt!644374) (not ((_ is MissingVacant!12126) lt!644374)) (and (bvsge (index!50899 lt!644374) #b00000000000000000000000000000000) (bvslt (index!50899 lt!644374) (size!48436 lt!644338)))) (or ((_ is Undefined!12126) lt!644374) (ite ((_ is Found!12126) lt!644374) (= (select (arr!47886 lt!644338) (index!50897 lt!644374)) lt!644341) (ite ((_ is MissingZero!12126) lt!644374) (= (select (arr!47886 lt!644338) (index!50896 lt!644374)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12126) lt!644374) (= (select (arr!47886 lt!644338) (index!50899 lt!644374)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155665 (= lt!644374 e!827430)))

(declare-fun c!135950 () Bool)

(assert (=> d!155665 (= c!135950 (and ((_ is Intermediate!12126) lt!644376) (undefined!12938 lt!644376)))))

(assert (=> d!155665 (= lt!644376 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644341 mask!2687) lt!644341 lt!644338 mask!2687))))

(assert (=> d!155665 (validMask!0 mask!2687)))

(assert (=> d!155665 (= (seekEntryOrOpen!0 lt!644341 lt!644338 mask!2687) lt!644374)))

(declare-fun b!1474812 () Bool)

(assert (=> b!1474812 (= e!827431 (seekKeyOrZeroReturnVacant!0 (x!132474 lt!644376) (index!50898 lt!644376) (index!50898 lt!644376) lt!644341 lt!644338 mask!2687))))

(declare-fun b!1474813 () Bool)

(assert (=> b!1474813 (= e!827430 Undefined!12126)))

(declare-fun b!1474814 () Bool)

(assert (=> b!1474814 (= e!827432 (Found!12126 (index!50898 lt!644376)))))

(declare-fun b!1474815 () Bool)

(assert (=> b!1474815 (= e!827431 (MissingZero!12126 (index!50898 lt!644376)))))

(assert (= (and d!155665 c!135950) b!1474813))

(assert (= (and d!155665 (not c!135950)) b!1474810))

(assert (= (and b!1474810 c!135949) b!1474814))

(assert (= (and b!1474810 (not c!135949)) b!1474811))

(assert (= (and b!1474811 c!135951) b!1474815))

(assert (= (and b!1474811 (not c!135951)) b!1474812))

(declare-fun m!1361261 () Bool)

(assert (=> b!1474810 m!1361261))

(assert (=> d!155665 m!1361193))

(assert (=> d!155665 m!1361193))

(assert (=> d!155665 m!1361195))

(declare-fun m!1361263 () Bool)

(assert (=> d!155665 m!1361263))

(assert (=> d!155665 m!1361179))

(declare-fun m!1361265 () Bool)

(assert (=> d!155665 m!1361265))

(declare-fun m!1361267 () Bool)

(assert (=> d!155665 m!1361267))

(declare-fun m!1361269 () Bool)

(assert (=> b!1474812 m!1361269))

(assert (=> b!1474723 d!155665))

(declare-fun d!155667 () Bool)

(assert (=> d!155667 (= (validKeyInArray!0 (select (arr!47886 a!2862) j!93)) (and (not (= (select (arr!47886 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47886 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1474726 d!155667))

(declare-fun b!1474834 () Bool)

(declare-fun lt!644382 () SeekEntryResult!12126)

(assert (=> b!1474834 (and (bvsge (index!50898 lt!644382) #b00000000000000000000000000000000) (bvslt (index!50898 lt!644382) (size!48436 lt!644338)))))

(declare-fun res!1001950 () Bool)

(assert (=> b!1474834 (= res!1001950 (= (select (arr!47886 lt!644338) (index!50898 lt!644382)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!827445 () Bool)

(assert (=> b!1474834 (=> res!1001950 e!827445)))

(declare-fun b!1474835 () Bool)

(declare-fun e!827446 () SeekEntryResult!12126)

(declare-fun e!827447 () SeekEntryResult!12126)

(assert (=> b!1474835 (= e!827446 e!827447)))

(declare-fun c!135959 () Bool)

(declare-fun lt!644381 () (_ BitVec 64))

(assert (=> b!1474835 (= c!135959 (or (= lt!644381 lt!644341) (= (bvadd lt!644381 lt!644381) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!155669 () Bool)

(declare-fun e!827444 () Bool)

(assert (=> d!155669 e!827444))

(declare-fun c!135960 () Bool)

(assert (=> d!155669 (= c!135960 (and ((_ is Intermediate!12126) lt!644382) (undefined!12938 lt!644382)))))

(assert (=> d!155669 (= lt!644382 e!827446)))

(declare-fun c!135958 () Bool)

(assert (=> d!155669 (= c!135958 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155669 (= lt!644381 (select (arr!47886 lt!644338) index!646))))

(assert (=> d!155669 (validMask!0 mask!2687)))

(assert (=> d!155669 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644341 lt!644338 mask!2687) lt!644382)))

(declare-fun b!1474836 () Bool)

(assert (=> b!1474836 (= e!827444 (bvsge (x!132474 lt!644382) #b01111111111111111111111111111110))))

(declare-fun b!1474837 () Bool)

(assert (=> b!1474837 (= e!827447 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!644341 lt!644338 mask!2687))))

(declare-fun b!1474838 () Bool)

(assert (=> b!1474838 (and (bvsge (index!50898 lt!644382) #b00000000000000000000000000000000) (bvslt (index!50898 lt!644382) (size!48436 lt!644338)))))

(assert (=> b!1474838 (= e!827445 (= (select (arr!47886 lt!644338) (index!50898 lt!644382)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1474839 () Bool)

(assert (=> b!1474839 (and (bvsge (index!50898 lt!644382) #b00000000000000000000000000000000) (bvslt (index!50898 lt!644382) (size!48436 lt!644338)))))

(declare-fun res!1001948 () Bool)

(assert (=> b!1474839 (= res!1001948 (= (select (arr!47886 lt!644338) (index!50898 lt!644382)) lt!644341))))

(assert (=> b!1474839 (=> res!1001948 e!827445)))

(declare-fun e!827443 () Bool)

(assert (=> b!1474839 (= e!827443 e!827445)))

(declare-fun b!1474840 () Bool)

(assert (=> b!1474840 (= e!827447 (Intermediate!12126 false index!646 x!665))))

(declare-fun b!1474841 () Bool)

(assert (=> b!1474841 (= e!827446 (Intermediate!12126 true index!646 x!665))))

(declare-fun b!1474842 () Bool)

(assert (=> b!1474842 (= e!827444 e!827443)))

(declare-fun res!1001949 () Bool)

(assert (=> b!1474842 (= res!1001949 (and ((_ is Intermediate!12126) lt!644382) (not (undefined!12938 lt!644382)) (bvslt (x!132474 lt!644382) #b01111111111111111111111111111110) (bvsge (x!132474 lt!644382) #b00000000000000000000000000000000) (bvsge (x!132474 lt!644382) x!665)))))

(assert (=> b!1474842 (=> (not res!1001949) (not e!827443))))

(assert (= (and d!155669 c!135958) b!1474841))

(assert (= (and d!155669 (not c!135958)) b!1474835))

(assert (= (and b!1474835 c!135959) b!1474840))

(assert (= (and b!1474835 (not c!135959)) b!1474837))

(assert (= (and d!155669 c!135960) b!1474836))

(assert (= (and d!155669 (not c!135960)) b!1474842))

(assert (= (and b!1474842 res!1001949) b!1474839))

(assert (= (and b!1474839 (not res!1001948)) b!1474834))

(assert (= (and b!1474834 (not res!1001950)) b!1474838))

(assert (=> b!1474837 m!1361257))

(assert (=> b!1474837 m!1361257))

(declare-fun m!1361271 () Bool)

(assert (=> b!1474837 m!1361271))

(assert (=> d!155669 m!1361255))

(assert (=> d!155669 m!1361179))

(declare-fun m!1361273 () Bool)

(assert (=> b!1474838 m!1361273))

(assert (=> b!1474834 m!1361273))

(assert (=> b!1474839 m!1361273))

(assert (=> b!1474716 d!155669))

(declare-fun d!155671 () Bool)

(assert (=> d!155671 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!125928 d!155671))

(declare-fun d!155675 () Bool)

(assert (=> d!155675 (= (array_inv!36914 a!2862) (bvsge (size!48436 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!125928 d!155675))

(declare-fun b!1474843 () Bool)

(declare-fun lt!644384 () SeekEntryResult!12126)

(assert (=> b!1474843 (and (bvsge (index!50898 lt!644384) #b00000000000000000000000000000000) (bvslt (index!50898 lt!644384) (size!48436 lt!644338)))))

(declare-fun res!1001953 () Bool)

(assert (=> b!1474843 (= res!1001953 (= (select (arr!47886 lt!644338) (index!50898 lt!644384)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!827450 () Bool)

(assert (=> b!1474843 (=> res!1001953 e!827450)))

(declare-fun b!1474844 () Bool)

(declare-fun e!827451 () SeekEntryResult!12126)

(declare-fun e!827452 () SeekEntryResult!12126)

(assert (=> b!1474844 (= e!827451 e!827452)))

(declare-fun c!135962 () Bool)

(declare-fun lt!644383 () (_ BitVec 64))

(assert (=> b!1474844 (= c!135962 (or (= lt!644383 lt!644341) (= (bvadd lt!644383 lt!644383) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!155677 () Bool)

(declare-fun e!827449 () Bool)

(assert (=> d!155677 e!827449))

(declare-fun c!135963 () Bool)

(assert (=> d!155677 (= c!135963 (and ((_ is Intermediate!12126) lt!644384) (undefined!12938 lt!644384)))))

(assert (=> d!155677 (= lt!644384 e!827451)))

(declare-fun c!135961 () Bool)

(assert (=> d!155677 (= c!135961 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!155677 (= lt!644383 (select (arr!47886 lt!644338) (toIndex!0 lt!644341 mask!2687)))))

(assert (=> d!155677 (validMask!0 mask!2687)))

(assert (=> d!155677 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644341 mask!2687) lt!644341 lt!644338 mask!2687) lt!644384)))

(declare-fun b!1474845 () Bool)

(assert (=> b!1474845 (= e!827449 (bvsge (x!132474 lt!644384) #b01111111111111111111111111111110))))

(declare-fun b!1474846 () Bool)

(assert (=> b!1474846 (= e!827452 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!644341 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!644341 lt!644338 mask!2687))))

(declare-fun b!1474847 () Bool)

(assert (=> b!1474847 (and (bvsge (index!50898 lt!644384) #b00000000000000000000000000000000) (bvslt (index!50898 lt!644384) (size!48436 lt!644338)))))

(assert (=> b!1474847 (= e!827450 (= (select (arr!47886 lt!644338) (index!50898 lt!644384)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1474848 () Bool)

(assert (=> b!1474848 (and (bvsge (index!50898 lt!644384) #b00000000000000000000000000000000) (bvslt (index!50898 lt!644384) (size!48436 lt!644338)))))

(declare-fun res!1001951 () Bool)

(assert (=> b!1474848 (= res!1001951 (= (select (arr!47886 lt!644338) (index!50898 lt!644384)) lt!644341))))

(assert (=> b!1474848 (=> res!1001951 e!827450)))

(declare-fun e!827448 () Bool)

(assert (=> b!1474848 (= e!827448 e!827450)))

(declare-fun b!1474849 () Bool)

(assert (=> b!1474849 (= e!827452 (Intermediate!12126 false (toIndex!0 lt!644341 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1474850 () Bool)

(assert (=> b!1474850 (= e!827451 (Intermediate!12126 true (toIndex!0 lt!644341 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1474851 () Bool)

(assert (=> b!1474851 (= e!827449 e!827448)))

(declare-fun res!1001952 () Bool)

(assert (=> b!1474851 (= res!1001952 (and ((_ is Intermediate!12126) lt!644384) (not (undefined!12938 lt!644384)) (bvslt (x!132474 lt!644384) #b01111111111111111111111111111110) (bvsge (x!132474 lt!644384) #b00000000000000000000000000000000) (bvsge (x!132474 lt!644384) #b00000000000000000000000000000000)))))

(assert (=> b!1474851 (=> (not res!1001952) (not e!827448))))

(assert (= (and d!155677 c!135961) b!1474850))

(assert (= (and d!155677 (not c!135961)) b!1474844))

(assert (= (and b!1474844 c!135962) b!1474849))

(assert (= (and b!1474844 (not c!135962)) b!1474846))

(assert (= (and d!155677 c!135963) b!1474845))

(assert (= (and d!155677 (not c!135963)) b!1474851))

(assert (= (and b!1474851 res!1001952) b!1474848))

(assert (= (and b!1474848 (not res!1001951)) b!1474843))

(assert (= (and b!1474843 (not res!1001953)) b!1474847))

(assert (=> b!1474846 m!1361193))

(declare-fun m!1361275 () Bool)

(assert (=> b!1474846 m!1361275))

(assert (=> b!1474846 m!1361275))

(declare-fun m!1361277 () Bool)

(assert (=> b!1474846 m!1361277))

(assert (=> d!155677 m!1361193))

(declare-fun m!1361279 () Bool)

(assert (=> d!155677 m!1361279))

(assert (=> d!155677 m!1361179))

(declare-fun m!1361281 () Bool)

(assert (=> b!1474847 m!1361281))

(assert (=> b!1474843 m!1361281))

(assert (=> b!1474848 m!1361281))

(assert (=> b!1474717 d!155677))

(declare-fun d!155679 () Bool)

(declare-fun lt!644399 () (_ BitVec 32))

(declare-fun lt!644398 () (_ BitVec 32))

(assert (=> d!155679 (= lt!644399 (bvmul (bvxor lt!644398 (bvlshr lt!644398 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155679 (= lt!644398 ((_ extract 31 0) (bvand (bvxor lt!644341 (bvlshr lt!644341 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155679 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1001954 (let ((h!35744 ((_ extract 31 0) (bvand (bvxor lt!644341 (bvlshr lt!644341 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132478 (bvmul (bvxor h!35744 (bvlshr h!35744 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132478 (bvlshr x!132478 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1001954 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1001954 #b00000000000000000000000000000000))))))

(assert (=> d!155679 (= (toIndex!0 lt!644341 mask!2687) (bvand (bvxor lt!644399 (bvlshr lt!644399 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1474717 d!155679))

(declare-fun lt!644401 () SeekEntryResult!12126)

(declare-fun d!155683 () Bool)

(assert (=> d!155683 (and (or ((_ is Undefined!12126) lt!644401) (not ((_ is Found!12126) lt!644401)) (and (bvsge (index!50897 lt!644401) #b00000000000000000000000000000000) (bvslt (index!50897 lt!644401) (size!48436 a!2862)))) (or ((_ is Undefined!12126) lt!644401) ((_ is Found!12126) lt!644401) (not ((_ is MissingVacant!12126) lt!644401)) (not (= (index!50899 lt!644401) index!646)) (and (bvsge (index!50899 lt!644401) #b00000000000000000000000000000000) (bvslt (index!50899 lt!644401) (size!48436 a!2862)))) (or ((_ is Undefined!12126) lt!644401) (ite ((_ is Found!12126) lt!644401) (= (select (arr!47886 a!2862) (index!50897 lt!644401)) (select (arr!47886 a!2862) j!93)) (and ((_ is MissingVacant!12126) lt!644401) (= (index!50899 lt!644401) index!646) (= (select (arr!47886 a!2862) (index!50899 lt!644401)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!827463 () SeekEntryResult!12126)

(assert (=> d!155683 (= lt!644401 e!827463)))

(declare-fun c!135967 () Bool)

(assert (=> d!155683 (= c!135967 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!644400 () (_ BitVec 64))

(assert (=> d!155683 (= lt!644400 (select (arr!47886 a!2862) index!646))))

(assert (=> d!155683 (validMask!0 mask!2687)))

(assert (=> d!155683 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47886 a!2862) j!93) a!2862 mask!2687) lt!644401)))

(declare-fun b!1474864 () Bool)

(declare-fun e!827464 () SeekEntryResult!12126)

(assert (=> b!1474864 (= e!827463 e!827464)))

(declare-fun c!135968 () Bool)

(assert (=> b!1474864 (= c!135968 (= lt!644400 (select (arr!47886 a!2862) j!93)))))

(declare-fun b!1474865 () Bool)

(assert (=> b!1474865 (= e!827464 (Found!12126 index!646))))

(declare-fun b!1474866 () Bool)

(declare-fun c!135969 () Bool)

(assert (=> b!1474866 (= c!135969 (= lt!644400 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!827462 () SeekEntryResult!12126)

(assert (=> b!1474866 (= e!827464 e!827462)))

(declare-fun b!1474867 () Bool)

(assert (=> b!1474867 (= e!827463 Undefined!12126)))

(declare-fun b!1474868 () Bool)

(assert (=> b!1474868 (= e!827462 (MissingVacant!12126 index!646))))

(declare-fun b!1474869 () Bool)

(assert (=> b!1474869 (= e!827462 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) index!646 (select (arr!47886 a!2862) j!93) a!2862 mask!2687))))

(assert (= (and d!155683 c!135967) b!1474867))

(assert (= (and d!155683 (not c!135967)) b!1474864))

(assert (= (and b!1474864 c!135968) b!1474865))

(assert (= (and b!1474864 (not c!135968)) b!1474866))

(assert (= (and b!1474866 c!135969) b!1474868))

(assert (= (and b!1474866 (not c!135969)) b!1474869))

(declare-fun m!1361295 () Bool)

(assert (=> d!155683 m!1361295))

(declare-fun m!1361297 () Bool)

(assert (=> d!155683 m!1361297))

(assert (=> d!155683 m!1361173))

(assert (=> d!155683 m!1361179))

(assert (=> b!1474869 m!1361257))

(assert (=> b!1474869 m!1361257))

(assert (=> b!1474869 m!1361159))

(declare-fun m!1361299 () Bool)

(assert (=> b!1474869 m!1361299))

(assert (=> b!1474728 d!155683))

(declare-fun b!1474878 () Bool)

(declare-fun e!827471 () Bool)

(declare-fun call!67765 () Bool)

(assert (=> b!1474878 (= e!827471 call!67765)))

(declare-fun d!155687 () Bool)

(declare-fun res!1001966 () Bool)

(declare-fun e!827473 () Bool)

(assert (=> d!155687 (=> res!1001966 e!827473)))

(assert (=> d!155687 (= res!1001966 (bvsge #b00000000000000000000000000000000 (size!48436 a!2862)))))

(assert (=> d!155687 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!827473)))

(declare-fun bm!67762 () Bool)

(assert (=> bm!67762 (= call!67765 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1474879 () Bool)

(declare-fun e!827472 () Bool)

(assert (=> b!1474879 (= e!827473 e!827472)))

(declare-fun c!135972 () Bool)

(assert (=> b!1474879 (= c!135972 (validKeyInArray!0 (select (arr!47886 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1474880 () Bool)

(assert (=> b!1474880 (= e!827472 e!827471)))

(declare-fun lt!644408 () (_ BitVec 64))

(assert (=> b!1474880 (= lt!644408 (select (arr!47886 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!644410 () Unit!49592)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99205 (_ BitVec 64) (_ BitVec 32)) Unit!49592)

(assert (=> b!1474880 (= lt!644410 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!644408 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99205 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1474880 (arrayContainsKey!0 a!2862 lt!644408 #b00000000000000000000000000000000)))

(declare-fun lt!644409 () Unit!49592)

(assert (=> b!1474880 (= lt!644409 lt!644410)))

(declare-fun res!1001965 () Bool)

(assert (=> b!1474880 (= res!1001965 (= (seekEntryOrOpen!0 (select (arr!47886 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12126 #b00000000000000000000000000000000)))))

(assert (=> b!1474880 (=> (not res!1001965) (not e!827471))))

(declare-fun b!1474881 () Bool)

(assert (=> b!1474881 (= e!827472 call!67765)))

(assert (= (and d!155687 (not res!1001966)) b!1474879))

(assert (= (and b!1474879 c!135972) b!1474880))

(assert (= (and b!1474879 (not c!135972)) b!1474881))

(assert (= (and b!1474880 res!1001965) b!1474878))

(assert (= (or b!1474878 b!1474881) bm!67762))

(declare-fun m!1361301 () Bool)

(assert (=> bm!67762 m!1361301))

(declare-fun m!1361303 () Bool)

(assert (=> b!1474879 m!1361303))

(assert (=> b!1474879 m!1361303))

(declare-fun m!1361305 () Bool)

(assert (=> b!1474879 m!1361305))

(assert (=> b!1474880 m!1361303))

(declare-fun m!1361307 () Bool)

(assert (=> b!1474880 m!1361307))

(declare-fun m!1361309 () Bool)

(assert (=> b!1474880 m!1361309))

(assert (=> b!1474880 m!1361303))

(declare-fun m!1361311 () Bool)

(assert (=> b!1474880 m!1361311))

(assert (=> b!1474719 d!155687))

(declare-fun d!155689 () Bool)

(assert (=> d!155689 (= (validKeyInArray!0 (select (arr!47886 a!2862) i!1006)) (and (not (= (select (arr!47886 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47886 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1474730 d!155689))

(declare-fun b!1474882 () Bool)

(declare-fun lt!644412 () SeekEntryResult!12126)

(assert (=> b!1474882 (and (bvsge (index!50898 lt!644412) #b00000000000000000000000000000000) (bvslt (index!50898 lt!644412) (size!48436 a!2862)))))

(declare-fun res!1001969 () Bool)

(assert (=> b!1474882 (= res!1001969 (= (select (arr!47886 a!2862) (index!50898 lt!644412)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!827476 () Bool)

(assert (=> b!1474882 (=> res!1001969 e!827476)))

(declare-fun b!1474883 () Bool)

(declare-fun e!827477 () SeekEntryResult!12126)

(declare-fun e!827478 () SeekEntryResult!12126)

(assert (=> b!1474883 (= e!827477 e!827478)))

(declare-fun lt!644411 () (_ BitVec 64))

(declare-fun c!135974 () Bool)

(assert (=> b!1474883 (= c!135974 (or (= lt!644411 (select (arr!47886 a!2862) j!93)) (= (bvadd lt!644411 lt!644411) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!155691 () Bool)

(declare-fun e!827475 () Bool)

(assert (=> d!155691 e!827475))

(declare-fun c!135975 () Bool)

(assert (=> d!155691 (= c!135975 (and ((_ is Intermediate!12126) lt!644412) (undefined!12938 lt!644412)))))

(assert (=> d!155691 (= lt!644412 e!827477)))

(declare-fun c!135973 () Bool)

(assert (=> d!155691 (= c!135973 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!155691 (= lt!644411 (select (arr!47886 a!2862) (toIndex!0 (select (arr!47886 a!2862) j!93) mask!2687)))))

(assert (=> d!155691 (validMask!0 mask!2687)))

(assert (=> d!155691 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47886 a!2862) j!93) mask!2687) (select (arr!47886 a!2862) j!93) a!2862 mask!2687) lt!644412)))

(declare-fun b!1474884 () Bool)

(assert (=> b!1474884 (= e!827475 (bvsge (x!132474 lt!644412) #b01111111111111111111111111111110))))

(declare-fun b!1474885 () Bool)

(assert (=> b!1474885 (= e!827478 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47886 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47886 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1474886 () Bool)

(assert (=> b!1474886 (and (bvsge (index!50898 lt!644412) #b00000000000000000000000000000000) (bvslt (index!50898 lt!644412) (size!48436 a!2862)))))

(assert (=> b!1474886 (= e!827476 (= (select (arr!47886 a!2862) (index!50898 lt!644412)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1474887 () Bool)

(assert (=> b!1474887 (and (bvsge (index!50898 lt!644412) #b00000000000000000000000000000000) (bvslt (index!50898 lt!644412) (size!48436 a!2862)))))

(declare-fun res!1001967 () Bool)

(assert (=> b!1474887 (= res!1001967 (= (select (arr!47886 a!2862) (index!50898 lt!644412)) (select (arr!47886 a!2862) j!93)))))

(assert (=> b!1474887 (=> res!1001967 e!827476)))

(declare-fun e!827474 () Bool)

(assert (=> b!1474887 (= e!827474 e!827476)))

(declare-fun b!1474888 () Bool)

(assert (=> b!1474888 (= e!827478 (Intermediate!12126 false (toIndex!0 (select (arr!47886 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1474889 () Bool)

(assert (=> b!1474889 (= e!827477 (Intermediate!12126 true (toIndex!0 (select (arr!47886 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1474890 () Bool)

(assert (=> b!1474890 (= e!827475 e!827474)))

(declare-fun res!1001968 () Bool)

(assert (=> b!1474890 (= res!1001968 (and ((_ is Intermediate!12126) lt!644412) (not (undefined!12938 lt!644412)) (bvslt (x!132474 lt!644412) #b01111111111111111111111111111110) (bvsge (x!132474 lt!644412) #b00000000000000000000000000000000) (bvsge (x!132474 lt!644412) #b00000000000000000000000000000000)))))

(assert (=> b!1474890 (=> (not res!1001968) (not e!827474))))

(assert (= (and d!155691 c!135973) b!1474889))

(assert (= (and d!155691 (not c!135973)) b!1474883))

(assert (= (and b!1474883 c!135974) b!1474888))

(assert (= (and b!1474883 (not c!135974)) b!1474885))

(assert (= (and d!155691 c!135975) b!1474884))

(assert (= (and d!155691 (not c!135975)) b!1474890))

(assert (= (and b!1474890 res!1001968) b!1474887))

(assert (= (and b!1474887 (not res!1001967)) b!1474882))

(assert (= (and b!1474882 (not res!1001969)) b!1474886))

(assert (=> b!1474885 m!1361163))

(declare-fun m!1361313 () Bool)

(assert (=> b!1474885 m!1361313))

(assert (=> b!1474885 m!1361313))

(assert (=> b!1474885 m!1361159))

(declare-fun m!1361315 () Bool)

(assert (=> b!1474885 m!1361315))

(assert (=> d!155691 m!1361163))

(declare-fun m!1361317 () Bool)

(assert (=> d!155691 m!1361317))

(assert (=> d!155691 m!1361179))

(declare-fun m!1361319 () Bool)

(assert (=> b!1474886 m!1361319))

(assert (=> b!1474882 m!1361319))

(assert (=> b!1474887 m!1361319))

(assert (=> b!1474720 d!155691))

(declare-fun d!155693 () Bool)

(declare-fun lt!644418 () (_ BitVec 32))

(declare-fun lt!644417 () (_ BitVec 32))

(assert (=> d!155693 (= lt!644418 (bvmul (bvxor lt!644417 (bvlshr lt!644417 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155693 (= lt!644417 ((_ extract 31 0) (bvand (bvxor (select (arr!47886 a!2862) j!93) (bvlshr (select (arr!47886 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155693 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1001954 (let ((h!35744 ((_ extract 31 0) (bvand (bvxor (select (arr!47886 a!2862) j!93) (bvlshr (select (arr!47886 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132478 (bvmul (bvxor h!35744 (bvlshr h!35744 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132478 (bvlshr x!132478 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1001954 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1001954 #b00000000000000000000000000000000))))))

(assert (=> d!155693 (= (toIndex!0 (select (arr!47886 a!2862) j!93) mask!2687) (bvand (bvxor lt!644418 (bvlshr lt!644418 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1474720 d!155693))

(declare-fun b!1474899 () Bool)

(declare-fun e!827483 () SeekEntryResult!12126)

(declare-fun e!827485 () SeekEntryResult!12126)

(assert (=> b!1474899 (= e!827483 e!827485)))

(declare-fun lt!644420 () (_ BitVec 64))

(declare-fun lt!644421 () SeekEntryResult!12126)

(assert (=> b!1474899 (= lt!644420 (select (arr!47886 a!2862) (index!50898 lt!644421)))))

(declare-fun c!135980 () Bool)

(assert (=> b!1474899 (= c!135980 (= lt!644420 (select (arr!47886 a!2862) j!93)))))

(declare-fun b!1474900 () Bool)

(declare-fun c!135982 () Bool)

(assert (=> b!1474900 (= c!135982 (= lt!644420 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!827484 () SeekEntryResult!12126)

(assert (=> b!1474900 (= e!827485 e!827484)))

(declare-fun d!155695 () Bool)

(declare-fun lt!644419 () SeekEntryResult!12126)

(assert (=> d!155695 (and (or ((_ is Undefined!12126) lt!644419) (not ((_ is Found!12126) lt!644419)) (and (bvsge (index!50897 lt!644419) #b00000000000000000000000000000000) (bvslt (index!50897 lt!644419) (size!48436 a!2862)))) (or ((_ is Undefined!12126) lt!644419) ((_ is Found!12126) lt!644419) (not ((_ is MissingZero!12126) lt!644419)) (and (bvsge (index!50896 lt!644419) #b00000000000000000000000000000000) (bvslt (index!50896 lt!644419) (size!48436 a!2862)))) (or ((_ is Undefined!12126) lt!644419) ((_ is Found!12126) lt!644419) ((_ is MissingZero!12126) lt!644419) (not ((_ is MissingVacant!12126) lt!644419)) (and (bvsge (index!50899 lt!644419) #b00000000000000000000000000000000) (bvslt (index!50899 lt!644419) (size!48436 a!2862)))) (or ((_ is Undefined!12126) lt!644419) (ite ((_ is Found!12126) lt!644419) (= (select (arr!47886 a!2862) (index!50897 lt!644419)) (select (arr!47886 a!2862) j!93)) (ite ((_ is MissingZero!12126) lt!644419) (= (select (arr!47886 a!2862) (index!50896 lt!644419)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12126) lt!644419) (= (select (arr!47886 a!2862) (index!50899 lt!644419)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155695 (= lt!644419 e!827483)))

(declare-fun c!135981 () Bool)

(assert (=> d!155695 (= c!135981 (and ((_ is Intermediate!12126) lt!644421) (undefined!12938 lt!644421)))))

(assert (=> d!155695 (= lt!644421 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47886 a!2862) j!93) mask!2687) (select (arr!47886 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!155695 (validMask!0 mask!2687)))

(assert (=> d!155695 (= (seekEntryOrOpen!0 (select (arr!47886 a!2862) j!93) a!2862 mask!2687) lt!644419)))

(declare-fun b!1474901 () Bool)

(assert (=> b!1474901 (= e!827484 (seekKeyOrZeroReturnVacant!0 (x!132474 lt!644421) (index!50898 lt!644421) (index!50898 lt!644421) (select (arr!47886 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1474902 () Bool)

(assert (=> b!1474902 (= e!827483 Undefined!12126)))

(declare-fun b!1474903 () Bool)

(assert (=> b!1474903 (= e!827485 (Found!12126 (index!50898 lt!644421)))))

(declare-fun b!1474904 () Bool)

(assert (=> b!1474904 (= e!827484 (MissingZero!12126 (index!50898 lt!644421)))))

(assert (= (and d!155695 c!135981) b!1474902))

(assert (= (and d!155695 (not c!135981)) b!1474899))

(assert (= (and b!1474899 c!135980) b!1474903))

(assert (= (and b!1474899 (not c!135980)) b!1474900))

(assert (= (and b!1474900 c!135982) b!1474904))

(assert (= (and b!1474900 (not c!135982)) b!1474901))

(declare-fun m!1361321 () Bool)

(assert (=> b!1474899 m!1361321))

(assert (=> d!155695 m!1361159))

(assert (=> d!155695 m!1361163))

(assert (=> d!155695 m!1361163))

(assert (=> d!155695 m!1361159))

(assert (=> d!155695 m!1361165))

(declare-fun m!1361323 () Bool)

(assert (=> d!155695 m!1361323))

(assert (=> d!155695 m!1361179))

(declare-fun m!1361325 () Bool)

(assert (=> d!155695 m!1361325))

(declare-fun m!1361327 () Bool)

(assert (=> d!155695 m!1361327))

(assert (=> b!1474901 m!1361159))

(declare-fun m!1361329 () Bool)

(assert (=> b!1474901 m!1361329))

(assert (=> b!1474731 d!155695))

(declare-fun b!1474913 () Bool)

(declare-fun e!827492 () Bool)

(declare-fun call!67766 () Bool)

(assert (=> b!1474913 (= e!827492 call!67766)))

(declare-fun d!155697 () Bool)

(declare-fun res!1001975 () Bool)

(declare-fun e!827494 () Bool)

(assert (=> d!155697 (=> res!1001975 e!827494)))

(assert (=> d!155697 (= res!1001975 (bvsge j!93 (size!48436 a!2862)))))

(assert (=> d!155697 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!827494)))

(declare-fun bm!67763 () Bool)

(assert (=> bm!67763 (= call!67766 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1474914 () Bool)

(declare-fun e!827493 () Bool)

(assert (=> b!1474914 (= e!827494 e!827493)))

(declare-fun c!135985 () Bool)

(assert (=> b!1474914 (= c!135985 (validKeyInArray!0 (select (arr!47886 a!2862) j!93)))))

(declare-fun b!1474915 () Bool)

(assert (=> b!1474915 (= e!827493 e!827492)))

(declare-fun lt!644422 () (_ BitVec 64))

(assert (=> b!1474915 (= lt!644422 (select (arr!47886 a!2862) j!93))))

(declare-fun lt!644424 () Unit!49592)

(assert (=> b!1474915 (= lt!644424 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!644422 j!93))))

(assert (=> b!1474915 (arrayContainsKey!0 a!2862 lt!644422 #b00000000000000000000000000000000)))

(declare-fun lt!644423 () Unit!49592)

(assert (=> b!1474915 (= lt!644423 lt!644424)))

(declare-fun res!1001974 () Bool)

(assert (=> b!1474915 (= res!1001974 (= (seekEntryOrOpen!0 (select (arr!47886 a!2862) j!93) a!2862 mask!2687) (Found!12126 j!93)))))

(assert (=> b!1474915 (=> (not res!1001974) (not e!827492))))

(declare-fun b!1474916 () Bool)

(assert (=> b!1474916 (= e!827493 call!67766)))

(assert (= (and d!155697 (not res!1001975)) b!1474914))

(assert (= (and b!1474914 c!135985) b!1474915))

(assert (= (and b!1474914 (not c!135985)) b!1474916))

(assert (= (and b!1474915 res!1001974) b!1474913))

(assert (= (or b!1474913 b!1474916) bm!67763))

(declare-fun m!1361331 () Bool)

(assert (=> bm!67763 m!1361331))

(assert (=> b!1474914 m!1361159))

(assert (=> b!1474914 m!1361159))

(assert (=> b!1474914 m!1361191))

(assert (=> b!1474915 m!1361159))

(declare-fun m!1361333 () Bool)

(assert (=> b!1474915 m!1361333))

(declare-fun m!1361335 () Bool)

(assert (=> b!1474915 m!1361335))

(assert (=> b!1474915 m!1361159))

(assert (=> b!1474915 m!1361175))

(assert (=> b!1474731 d!155697))

(declare-fun d!155699 () Bool)

(assert (=> d!155699 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!644433 () Unit!49592)

(declare-fun choose!38 (array!99205 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49592)

(assert (=> d!155699 (= lt!644433 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!155699 (validMask!0 mask!2687)))

(assert (=> d!155699 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!644433)))

(declare-fun bs!42569 () Bool)

(assert (= bs!42569 d!155699))

(assert (=> bs!42569 m!1361177))

(declare-fun m!1361345 () Bool)

(assert (=> bs!42569 m!1361345))

(assert (=> bs!42569 m!1361179))

(assert (=> b!1474731 d!155699))

(declare-fun b!1474946 () Bool)

(declare-fun lt!644435 () SeekEntryResult!12126)

(assert (=> b!1474946 (and (bvsge (index!50898 lt!644435) #b00000000000000000000000000000000) (bvslt (index!50898 lt!644435) (size!48436 a!2862)))))

(declare-fun res!1001989 () Bool)

(assert (=> b!1474946 (= res!1001989 (= (select (arr!47886 a!2862) (index!50898 lt!644435)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!827512 () Bool)

(assert (=> b!1474946 (=> res!1001989 e!827512)))

(declare-fun b!1474947 () Bool)

(declare-fun e!827513 () SeekEntryResult!12126)

(declare-fun e!827514 () SeekEntryResult!12126)

(assert (=> b!1474947 (= e!827513 e!827514)))

(declare-fun lt!644434 () (_ BitVec 64))

(declare-fun c!135996 () Bool)

(assert (=> b!1474947 (= c!135996 (or (= lt!644434 (select (arr!47886 a!2862) j!93)) (= (bvadd lt!644434 lt!644434) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!155703 () Bool)

(declare-fun e!827511 () Bool)

(assert (=> d!155703 e!827511))

(declare-fun c!135997 () Bool)

(assert (=> d!155703 (= c!135997 (and ((_ is Intermediate!12126) lt!644435) (undefined!12938 lt!644435)))))

(assert (=> d!155703 (= lt!644435 e!827513)))

(declare-fun c!135995 () Bool)

(assert (=> d!155703 (= c!135995 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155703 (= lt!644434 (select (arr!47886 a!2862) index!646))))

(assert (=> d!155703 (validMask!0 mask!2687)))

(assert (=> d!155703 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47886 a!2862) j!93) a!2862 mask!2687) lt!644435)))

(declare-fun b!1474948 () Bool)

(assert (=> b!1474948 (= e!827511 (bvsge (x!132474 lt!644435) #b01111111111111111111111111111110))))

(declare-fun b!1474949 () Bool)

(assert (=> b!1474949 (= e!827514 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47886 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1474950 () Bool)

(assert (=> b!1474950 (and (bvsge (index!50898 lt!644435) #b00000000000000000000000000000000) (bvslt (index!50898 lt!644435) (size!48436 a!2862)))))

(assert (=> b!1474950 (= e!827512 (= (select (arr!47886 a!2862) (index!50898 lt!644435)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1474951 () Bool)

(assert (=> b!1474951 (and (bvsge (index!50898 lt!644435) #b00000000000000000000000000000000) (bvslt (index!50898 lt!644435) (size!48436 a!2862)))))

(declare-fun res!1001987 () Bool)

(assert (=> b!1474951 (= res!1001987 (= (select (arr!47886 a!2862) (index!50898 lt!644435)) (select (arr!47886 a!2862) j!93)))))

(assert (=> b!1474951 (=> res!1001987 e!827512)))

(declare-fun e!827510 () Bool)

(assert (=> b!1474951 (= e!827510 e!827512)))

(declare-fun b!1474952 () Bool)

(assert (=> b!1474952 (= e!827514 (Intermediate!12126 false index!646 x!665))))

(declare-fun b!1474953 () Bool)

(assert (=> b!1474953 (= e!827513 (Intermediate!12126 true index!646 x!665))))

(declare-fun b!1474954 () Bool)

(assert (=> b!1474954 (= e!827511 e!827510)))

(declare-fun res!1001988 () Bool)

(assert (=> b!1474954 (= res!1001988 (and ((_ is Intermediate!12126) lt!644435) (not (undefined!12938 lt!644435)) (bvslt (x!132474 lt!644435) #b01111111111111111111111111111110) (bvsge (x!132474 lt!644435) #b00000000000000000000000000000000) (bvsge (x!132474 lt!644435) x!665)))))

(assert (=> b!1474954 (=> (not res!1001988) (not e!827510))))

(assert (= (and d!155703 c!135995) b!1474953))

(assert (= (and d!155703 (not c!135995)) b!1474947))

(assert (= (and b!1474947 c!135996) b!1474952))

(assert (= (and b!1474947 (not c!135996)) b!1474949))

(assert (= (and d!155703 c!135997) b!1474948))

(assert (= (and d!155703 (not c!135997)) b!1474954))

(assert (= (and b!1474954 res!1001988) b!1474951))

(assert (= (and b!1474951 (not res!1001987)) b!1474946))

(assert (= (and b!1474946 (not res!1001989)) b!1474950))

(assert (=> b!1474949 m!1361257))

(assert (=> b!1474949 m!1361257))

(assert (=> b!1474949 m!1361159))

(declare-fun m!1361347 () Bool)

(assert (=> b!1474949 m!1361347))

(assert (=> d!155703 m!1361173))

(assert (=> d!155703 m!1361179))

(declare-fun m!1361349 () Bool)

(assert (=> b!1474950 m!1361349))

(assert (=> b!1474946 m!1361349))

(assert (=> b!1474951 m!1361349))

(assert (=> b!1474721 d!155703))

(declare-fun b!1474974 () Bool)

(declare-fun e!827531 () Bool)

(declare-fun contains!9905 (List!34387 (_ BitVec 64)) Bool)

(assert (=> b!1474974 (= e!827531 (contains!9905 Nil!34384 (select (arr!47886 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1474975 () Bool)

(declare-fun e!827529 () Bool)

(declare-fun e!827528 () Bool)

(assert (=> b!1474975 (= e!827529 e!827528)))

(declare-fun res!1002001 () Bool)

(assert (=> b!1474975 (=> (not res!1002001) (not e!827528))))

(assert (=> b!1474975 (= res!1002001 (not e!827531))))

(declare-fun res!1002002 () Bool)

(assert (=> b!1474975 (=> (not res!1002002) (not e!827531))))

(assert (=> b!1474975 (= res!1002002 (validKeyInArray!0 (select (arr!47886 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1474976 () Bool)

(declare-fun e!827530 () Bool)

(declare-fun call!67769 () Bool)

(assert (=> b!1474976 (= e!827530 call!67769)))

(declare-fun bm!67766 () Bool)

(declare-fun c!136003 () Bool)

(assert (=> bm!67766 (= call!67769 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!136003 (Cons!34383 (select (arr!47886 a!2862) #b00000000000000000000000000000000) Nil!34384) Nil!34384)))))

(declare-fun b!1474977 () Bool)

(assert (=> b!1474977 (= e!827528 e!827530)))

(assert (=> b!1474977 (= c!136003 (validKeyInArray!0 (select (arr!47886 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1474978 () Bool)

(assert (=> b!1474978 (= e!827530 call!67769)))

(declare-fun d!155705 () Bool)

(declare-fun res!1002000 () Bool)

(assert (=> d!155705 (=> res!1002000 e!827529)))

(assert (=> d!155705 (= res!1002000 (bvsge #b00000000000000000000000000000000 (size!48436 a!2862)))))

(assert (=> d!155705 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34384) e!827529)))

(assert (= (and d!155705 (not res!1002000)) b!1474975))

(assert (= (and b!1474975 res!1002002) b!1474974))

(assert (= (and b!1474975 res!1002001) b!1474977))

(assert (= (and b!1474977 c!136003) b!1474976))

(assert (= (and b!1474977 (not c!136003)) b!1474978))

(assert (= (or b!1474976 b!1474978) bm!67766))

(assert (=> b!1474974 m!1361303))

(assert (=> b!1474974 m!1361303))

(declare-fun m!1361359 () Bool)

(assert (=> b!1474974 m!1361359))

(assert (=> b!1474975 m!1361303))

(assert (=> b!1474975 m!1361303))

(assert (=> b!1474975 m!1361305))

(assert (=> bm!67766 m!1361303))

(declare-fun m!1361361 () Bool)

(assert (=> bm!67766 m!1361361))

(assert (=> b!1474977 m!1361303))

(assert (=> b!1474977 m!1361303))

(assert (=> b!1474977 m!1361305))

(assert (=> b!1474722 d!155705))

(check-sat (not d!155669) (not b!1474812) (not b!1474879) (not b!1474915) (not b!1474914) (not bm!67762) (not b!1474974) (not b!1474880) (not d!155663) (not d!155703) (not d!155665) (not b!1474885) (not d!155677) (not bm!67763) (not b!1474977) (not d!155695) (not b!1474797) (not b!1474846) (not d!155691) (not d!155699) (not b!1474949) (not b!1474837) (not bm!67766) (not b!1474975) (not b!1474901) (not b!1474869) (not d!155683))
(check-sat)
