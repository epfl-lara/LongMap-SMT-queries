; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125166 () Bool)

(assert start!125166)

(declare-fun b!1459122 () Bool)

(declare-fun res!989119 () Bool)

(declare-fun e!820631 () Bool)

(assert (=> b!1459122 (=> (not res!989119) (not e!820631))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11847 0))(
  ( (MissingZero!11847 (index!49780 (_ BitVec 32))) (Found!11847 (index!49781 (_ BitVec 32))) (Intermediate!11847 (undefined!12659 Bool) (index!49782 (_ BitVec 32)) (x!131392 (_ BitVec 32))) (Undefined!11847) (MissingVacant!11847 (index!49783 (_ BitVec 32))) )
))
(declare-fun lt!639318 () SeekEntryResult!11847)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98614 0))(
  ( (array!98615 (arr!47595 (Array (_ BitVec 32) (_ BitVec 64))) (size!48145 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98614)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98614 (_ BitVec 32)) SeekEntryResult!11847)

(assert (=> b!1459122 (= res!989119 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47595 a!2862) j!93) a!2862 mask!2687) lt!639318))))

(declare-fun b!1459123 () Bool)

(declare-fun e!820637 () Bool)

(assert (=> b!1459123 (= e!820631 e!820637)))

(declare-fun res!989121 () Bool)

(assert (=> b!1459123 (=> (not res!989121) (not e!820637))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!639319 () SeekEntryResult!11847)

(assert (=> b!1459123 (= res!989121 (= lt!639319 (Intermediate!11847 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!639313 () (_ BitVec 64))

(declare-fun lt!639317 () array!98614)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459123 (= lt!639319 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639313 mask!2687) lt!639313 lt!639317 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1459123 (= lt!639313 (select (store (arr!47595 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1459124 () Bool)

(declare-fun res!989133 () Bool)

(declare-fun e!820634 () Bool)

(assert (=> b!1459124 (=> (not res!989133) (not e!820634))))

(assert (=> b!1459124 (= res!989133 (and (= (size!48145 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48145 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48145 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1459125 () Bool)

(declare-fun res!989134 () Bool)

(declare-fun e!820632 () Bool)

(assert (=> b!1459125 (=> res!989134 e!820632)))

(declare-fun lt!639320 () (_ BitVec 32))

(assert (=> b!1459125 (= res!989134 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639320 (select (arr!47595 a!2862) j!93) a!2862 mask!2687) lt!639318)))))

(declare-fun b!1459126 () Bool)

(declare-fun res!989127 () Bool)

(assert (=> b!1459126 (=> (not res!989127) (not e!820634))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98614 (_ BitVec 32)) Bool)

(assert (=> b!1459126 (= res!989127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1459127 () Bool)

(declare-fun res!989124 () Bool)

(assert (=> b!1459127 (=> (not res!989124) (not e!820637))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1459127 (= res!989124 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1459128 () Bool)

(declare-fun res!989120 () Bool)

(assert (=> b!1459128 (=> (not res!989120) (not e!820637))))

(declare-fun e!820635 () Bool)

(assert (=> b!1459128 (= res!989120 e!820635)))

(declare-fun c!134513 () Bool)

(assert (=> b!1459128 (= c!134513 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1459129 () Bool)

(declare-fun res!989129 () Bool)

(assert (=> b!1459129 (=> (not res!989129) (not e!820634))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1459129 (= res!989129 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48145 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48145 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48145 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1459130 () Bool)

(declare-fun e!820636 () Bool)

(assert (=> b!1459130 (= e!820637 (not e!820636))))

(declare-fun res!989130 () Bool)

(assert (=> b!1459130 (=> res!989130 e!820636)))

(assert (=> b!1459130 (= res!989130 (or (and (= (select (arr!47595 a!2862) index!646) (select (store (arr!47595 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47595 a!2862) index!646) (select (arr!47595 a!2862) j!93))) (= (select (arr!47595 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun lt!639315 () SeekEntryResult!11847)

(assert (=> b!1459130 (and (= lt!639315 (Found!11847 j!93)) (or (= (select (arr!47595 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47595 a!2862) intermediateBeforeIndex!19) (select (arr!47595 a!2862) j!93))) (let ((bdg!53483 (select (store (arr!47595 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47595 a!2862) index!646) bdg!53483) (= (select (arr!47595 a!2862) index!646) (select (arr!47595 a!2862) j!93))) (= (select (arr!47595 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53483 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98614 (_ BitVec 32)) SeekEntryResult!11847)

(assert (=> b!1459130 (= lt!639315 (seekEntryOrOpen!0 (select (arr!47595 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1459130 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49190 0))(
  ( (Unit!49191) )
))
(declare-fun lt!639316 () Unit!49190)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98614 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49190)

(assert (=> b!1459130 (= lt!639316 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1459131 () Bool)

(declare-fun e!820633 () Bool)

(assert (=> b!1459131 (= e!820633 e!820631)))

(declare-fun res!989132 () Bool)

(assert (=> b!1459131 (=> (not res!989132) (not e!820631))))

(assert (=> b!1459131 (= res!989132 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47595 a!2862) j!93) mask!2687) (select (arr!47595 a!2862) j!93) a!2862 mask!2687) lt!639318))))

(assert (=> b!1459131 (= lt!639318 (Intermediate!11847 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1459132 () Bool)

(declare-fun res!989131 () Bool)

(assert (=> b!1459132 (=> (not res!989131) (not e!820634))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1459132 (= res!989131 (validKeyInArray!0 (select (arr!47595 a!2862) j!93)))))

(declare-fun b!1459133 () Bool)

(declare-fun res!989122 () Bool)

(assert (=> b!1459133 (=> res!989122 e!820632)))

(declare-fun e!820629 () Bool)

(assert (=> b!1459133 (= res!989122 e!820629)))

(declare-fun c!134514 () Bool)

(assert (=> b!1459133 (= c!134514 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1459134 () Bool)

(assert (=> b!1459134 (= e!820636 e!820632)))

(declare-fun res!989118 () Bool)

(assert (=> b!1459134 (=> res!989118 e!820632)))

(assert (=> b!1459134 (= res!989118 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639320 #b00000000000000000000000000000000) (bvsge lt!639320 (size!48145 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459134 (= lt!639320 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!639321 () SeekEntryResult!11847)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98614 (_ BitVec 32)) SeekEntryResult!11847)

(assert (=> b!1459134 (= lt!639321 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639313 lt!639317 mask!2687))))

(assert (=> b!1459134 (= lt!639321 (seekEntryOrOpen!0 lt!639313 lt!639317 mask!2687))))

(declare-fun b!1459135 () Bool)

(declare-fun res!989125 () Bool)

(assert (=> b!1459135 (=> res!989125 e!820632)))

(assert (=> b!1459135 (= res!989125 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1459136 () Bool)

(declare-fun res!989117 () Bool)

(assert (=> b!1459136 (=> (not res!989117) (not e!820634))))

(assert (=> b!1459136 (= res!989117 (validKeyInArray!0 (select (arr!47595 a!2862) i!1006)))))

(declare-fun b!1459137 () Bool)

(assert (=> b!1459137 (= e!820635 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639313 lt!639317 mask!2687) (seekEntryOrOpen!0 lt!639313 lt!639317 mask!2687)))))

(declare-fun res!989128 () Bool)

(assert (=> start!125166 (=> (not res!989128) (not e!820634))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125166 (= res!989128 (validMask!0 mask!2687))))

(assert (=> start!125166 e!820634))

(assert (=> start!125166 true))

(declare-fun array_inv!36623 (array!98614) Bool)

(assert (=> start!125166 (array_inv!36623 a!2862)))

(declare-fun b!1459138 () Bool)

(assert (=> b!1459138 (= e!820634 e!820633)))

(declare-fun res!989126 () Bool)

(assert (=> b!1459138 (=> (not res!989126) (not e!820633))))

(assert (=> b!1459138 (= res!989126 (= (select (store (arr!47595 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1459138 (= lt!639317 (array!98615 (store (arr!47595 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48145 a!2862)))))

(declare-fun b!1459139 () Bool)

(assert (=> b!1459139 (= e!820629 (not (= lt!639319 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639320 lt!639313 lt!639317 mask!2687))))))

(declare-fun b!1459140 () Bool)

(declare-fun res!989123 () Bool)

(assert (=> b!1459140 (=> (not res!989123) (not e!820634))))

(declare-datatypes ((List!34096 0))(
  ( (Nil!34093) (Cons!34092 (h!35442 (_ BitVec 64)) (t!48790 List!34096)) )
))
(declare-fun arrayNoDuplicates!0 (array!98614 (_ BitVec 32) List!34096) Bool)

(assert (=> b!1459140 (= res!989123 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34093))))

(declare-fun b!1459141 () Bool)

(assert (=> b!1459141 (= e!820632 true)))

(assert (=> b!1459141 (= lt!639315 lt!639321)))

(declare-fun lt!639314 () Unit!49190)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98614 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49190)

(assert (=> b!1459141 (= lt!639314 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!639320 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1459142 () Bool)

(assert (=> b!1459142 (= e!820635 (= lt!639319 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639313 lt!639317 mask!2687)))))

(declare-fun b!1459143 () Bool)

(assert (=> b!1459143 (= e!820629 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639320 intermediateAfterIndex!19 lt!639313 lt!639317 mask!2687) lt!639321)))))

(assert (= (and start!125166 res!989128) b!1459124))

(assert (= (and b!1459124 res!989133) b!1459136))

(assert (= (and b!1459136 res!989117) b!1459132))

(assert (= (and b!1459132 res!989131) b!1459126))

(assert (= (and b!1459126 res!989127) b!1459140))

(assert (= (and b!1459140 res!989123) b!1459129))

(assert (= (and b!1459129 res!989129) b!1459138))

(assert (= (and b!1459138 res!989126) b!1459131))

(assert (= (and b!1459131 res!989132) b!1459122))

(assert (= (and b!1459122 res!989119) b!1459123))

(assert (= (and b!1459123 res!989121) b!1459128))

(assert (= (and b!1459128 c!134513) b!1459142))

(assert (= (and b!1459128 (not c!134513)) b!1459137))

(assert (= (and b!1459128 res!989120) b!1459127))

(assert (= (and b!1459127 res!989124) b!1459130))

(assert (= (and b!1459130 (not res!989130)) b!1459134))

(assert (= (and b!1459134 (not res!989118)) b!1459125))

(assert (= (and b!1459125 (not res!989134)) b!1459133))

(assert (= (and b!1459133 c!134514) b!1459139))

(assert (= (and b!1459133 (not c!134514)) b!1459143))

(assert (= (and b!1459133 (not res!989122)) b!1459135))

(assert (= (and b!1459135 (not res!989125)) b!1459141))

(declare-fun m!1346911 () Bool)

(assert (=> b!1459136 m!1346911))

(assert (=> b!1459136 m!1346911))

(declare-fun m!1346913 () Bool)

(assert (=> b!1459136 m!1346913))

(declare-fun m!1346915 () Bool)

(assert (=> b!1459130 m!1346915))

(declare-fun m!1346917 () Bool)

(assert (=> b!1459130 m!1346917))

(declare-fun m!1346919 () Bool)

(assert (=> b!1459130 m!1346919))

(declare-fun m!1346921 () Bool)

(assert (=> b!1459130 m!1346921))

(declare-fun m!1346923 () Bool)

(assert (=> b!1459130 m!1346923))

(declare-fun m!1346925 () Bool)

(assert (=> b!1459130 m!1346925))

(declare-fun m!1346927 () Bool)

(assert (=> b!1459130 m!1346927))

(declare-fun m!1346929 () Bool)

(assert (=> b!1459130 m!1346929))

(assert (=> b!1459130 m!1346925))

(assert (=> b!1459122 m!1346925))

(assert (=> b!1459122 m!1346925))

(declare-fun m!1346931 () Bool)

(assert (=> b!1459122 m!1346931))

(assert (=> b!1459131 m!1346925))

(assert (=> b!1459131 m!1346925))

(declare-fun m!1346933 () Bool)

(assert (=> b!1459131 m!1346933))

(assert (=> b!1459131 m!1346933))

(assert (=> b!1459131 m!1346925))

(declare-fun m!1346935 () Bool)

(assert (=> b!1459131 m!1346935))

(declare-fun m!1346937 () Bool)

(assert (=> b!1459142 m!1346937))

(declare-fun m!1346939 () Bool)

(assert (=> b!1459123 m!1346939))

(assert (=> b!1459123 m!1346939))

(declare-fun m!1346941 () Bool)

(assert (=> b!1459123 m!1346941))

(assert (=> b!1459123 m!1346917))

(declare-fun m!1346943 () Bool)

(assert (=> b!1459123 m!1346943))

(assert (=> b!1459132 m!1346925))

(assert (=> b!1459132 m!1346925))

(declare-fun m!1346945 () Bool)

(assert (=> b!1459132 m!1346945))

(declare-fun m!1346947 () Bool)

(assert (=> b!1459137 m!1346947))

(declare-fun m!1346949 () Bool)

(assert (=> b!1459137 m!1346949))

(declare-fun m!1346951 () Bool)

(assert (=> b!1459126 m!1346951))

(declare-fun m!1346953 () Bool)

(assert (=> b!1459134 m!1346953))

(assert (=> b!1459134 m!1346947))

(assert (=> b!1459134 m!1346949))

(declare-fun m!1346955 () Bool)

(assert (=> b!1459141 m!1346955))

(declare-fun m!1346957 () Bool)

(assert (=> b!1459143 m!1346957))

(declare-fun m!1346959 () Bool)

(assert (=> b!1459140 m!1346959))

(assert (=> b!1459125 m!1346925))

(assert (=> b!1459125 m!1346925))

(declare-fun m!1346961 () Bool)

(assert (=> b!1459125 m!1346961))

(declare-fun m!1346963 () Bool)

(assert (=> start!125166 m!1346963))

(declare-fun m!1346965 () Bool)

(assert (=> start!125166 m!1346965))

(assert (=> b!1459138 m!1346917))

(declare-fun m!1346967 () Bool)

(assert (=> b!1459138 m!1346967))

(declare-fun m!1346969 () Bool)

(assert (=> b!1459139 m!1346969))

(check-sat (not b!1459136) (not b!1459130) (not b!1459122) (not b!1459131) (not b!1459132) (not b!1459134) (not b!1459142) (not b!1459139) (not b!1459125) (not b!1459140) (not b!1459126) (not b!1459123) (not b!1459143) (not b!1459141) (not start!125166) (not b!1459137))
(check-sat)
