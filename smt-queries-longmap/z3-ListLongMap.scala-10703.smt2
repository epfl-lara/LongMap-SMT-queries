; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125326 () Bool)

(assert start!125326)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1465026 () Bool)

(declare-fun e!823218 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98752 0))(
  ( (array!98753 (arr!47665 (Array (_ BitVec 32) (_ BitVec 64))) (size!48217 (_ BitVec 32))) )
))
(declare-fun lt!641102 () array!98752)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!641103 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11942 0))(
  ( (MissingZero!11942 (index!50160 (_ BitVec 32))) (Found!11942 (index!50161 (_ BitVec 32))) (Intermediate!11942 (undefined!12754 Bool) (index!50162 (_ BitVec 32)) (x!131738 (_ BitVec 32))) (Undefined!11942) (MissingVacant!11942 (index!50163 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98752 (_ BitVec 32)) SeekEntryResult!11942)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98752 (_ BitVec 32)) SeekEntryResult!11942)

(assert (=> b!1465026 (= e!823218 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641103 lt!641102 mask!2687) (seekEntryOrOpen!0 lt!641103 lt!641102 mask!2687)))))

(declare-fun res!994084 () Bool)

(declare-fun e!823219 () Bool)

(assert (=> start!125326 (=> (not res!994084) (not e!823219))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125326 (= res!994084 (validMask!0 mask!2687))))

(assert (=> start!125326 e!823219))

(assert (=> start!125326 true))

(declare-fun a!2862 () array!98752)

(declare-fun array_inv!36898 (array!98752) Bool)

(assert (=> start!125326 (array_inv!36898 a!2862)))

(declare-fun b!1465027 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun e!823220 () Bool)

(assert (=> b!1465027 (= e!823220 (or (= (select (arr!47665 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47665 a!2862) intermediateBeforeIndex!19) (select (arr!47665 a!2862) j!93))))))

(declare-fun b!1465028 () Bool)

(declare-fun res!994085 () Bool)

(assert (=> b!1465028 (=> (not res!994085) (not e!823219))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98752 (_ BitVec 32)) Bool)

(assert (=> b!1465028 (= res!994085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1465029 () Bool)

(declare-fun lt!641100 () SeekEntryResult!11942)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98752 (_ BitVec 32)) SeekEntryResult!11942)

(assert (=> b!1465029 (= e!823218 (= lt!641100 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641103 lt!641102 mask!2687)))))

(declare-fun b!1465030 () Bool)

(declare-fun res!994078 () Bool)

(declare-fun e!823215 () Bool)

(assert (=> b!1465030 (=> res!994078 e!823215)))

(declare-fun lt!641105 () (_ BitVec 32))

(declare-fun lt!641101 () SeekEntryResult!11942)

(assert (=> b!1465030 (= res!994078 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641105 (select (arr!47665 a!2862) j!93) a!2862 mask!2687) lt!641101)))))

(declare-fun b!1465031 () Bool)

(declare-fun res!994076 () Bool)

(assert (=> b!1465031 (=> (not res!994076) (not e!823219))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1465031 (= res!994076 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48217 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48217 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48217 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1465032 () Bool)

(declare-fun res!994073 () Bool)

(assert (=> b!1465032 (=> (not res!994073) (not e!823219))))

(declare-datatypes ((List!34244 0))(
  ( (Nil!34241) (Cons!34240 (h!35590 (_ BitVec 64)) (t!48930 List!34244)) )
))
(declare-fun arrayNoDuplicates!0 (array!98752 (_ BitVec 32) List!34244) Bool)

(assert (=> b!1465032 (= res!994073 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34241))))

(declare-fun e!823222 () Bool)

(declare-fun b!1465033 () Bool)

(assert (=> b!1465033 (= e!823222 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641105 intermediateAfterIndex!19 lt!641103 lt!641102 mask!2687) (seekEntryOrOpen!0 lt!641103 lt!641102 mask!2687))))))

(declare-fun b!1465034 () Bool)

(declare-fun res!994071 () Bool)

(assert (=> b!1465034 (=> (not res!994071) (not e!823219))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1465034 (= res!994071 (validKeyInArray!0 (select (arr!47665 a!2862) j!93)))))

(declare-fun b!1465035 () Bool)

(declare-fun e!823216 () Bool)

(declare-fun e!823217 () Bool)

(assert (=> b!1465035 (= e!823216 e!823217)))

(declare-fun res!994087 () Bool)

(assert (=> b!1465035 (=> (not res!994087) (not e!823217))))

(assert (=> b!1465035 (= res!994087 (= lt!641100 (Intermediate!11942 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465035 (= lt!641100 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641103 mask!2687) lt!641103 lt!641102 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1465035 (= lt!641103 (select (store (arr!47665 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1465036 () Bool)

(declare-fun res!994074 () Bool)

(assert (=> b!1465036 (=> (not res!994074) (not e!823216))))

(assert (=> b!1465036 (= res!994074 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47665 a!2862) j!93) a!2862 mask!2687) lt!641101))))

(declare-fun b!1465037 () Bool)

(declare-fun res!994081 () Bool)

(assert (=> b!1465037 (=> (not res!994081) (not e!823217))))

(assert (=> b!1465037 (= res!994081 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1465038 () Bool)

(assert (=> b!1465038 (= e!823222 (not (= lt!641100 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641105 lt!641103 lt!641102 mask!2687))))))

(declare-fun b!1465039 () Bool)

(declare-fun res!994083 () Bool)

(assert (=> b!1465039 (=> (not res!994083) (not e!823217))))

(assert (=> b!1465039 (= res!994083 e!823218)))

(declare-fun c!134991 () Bool)

(assert (=> b!1465039 (= c!134991 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1465040 () Bool)

(declare-fun e!823223 () Bool)

(assert (=> b!1465040 (= e!823223 e!823215)))

(declare-fun res!994075 () Bool)

(assert (=> b!1465040 (=> res!994075 e!823215)))

(assert (=> b!1465040 (= res!994075 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641105 #b00000000000000000000000000000000) (bvsge lt!641105 (size!48217 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465040 (= lt!641105 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1465041 () Bool)

(declare-fun res!994072 () Bool)

(assert (=> b!1465041 (=> (not res!994072) (not e!823219))))

(assert (=> b!1465041 (= res!994072 (and (= (size!48217 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48217 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48217 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1465042 () Bool)

(assert (=> b!1465042 (= e!823215 true)))

(declare-fun lt!641106 () Bool)

(assert (=> b!1465042 (= lt!641106 e!823222)))

(declare-fun c!134992 () Bool)

(assert (=> b!1465042 (= c!134992 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1465043 () Bool)

(declare-fun e!823221 () Bool)

(assert (=> b!1465043 (= e!823221 e!823216)))

(declare-fun res!994070 () Bool)

(assert (=> b!1465043 (=> (not res!994070) (not e!823216))))

(assert (=> b!1465043 (= res!994070 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47665 a!2862) j!93) mask!2687) (select (arr!47665 a!2862) j!93) a!2862 mask!2687) lt!641101))))

(assert (=> b!1465043 (= lt!641101 (Intermediate!11942 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1465044 () Bool)

(assert (=> b!1465044 (= e!823219 e!823221)))

(declare-fun res!994082 () Bool)

(assert (=> b!1465044 (=> (not res!994082) (not e!823221))))

(assert (=> b!1465044 (= res!994082 (= (select (store (arr!47665 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1465044 (= lt!641102 (array!98753 (store (arr!47665 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48217 a!2862)))))

(declare-fun b!1465045 () Bool)

(declare-fun res!994080 () Bool)

(assert (=> b!1465045 (=> (not res!994080) (not e!823219))))

(assert (=> b!1465045 (= res!994080 (validKeyInArray!0 (select (arr!47665 a!2862) i!1006)))))

(declare-fun b!1465046 () Bool)

(assert (=> b!1465046 (= e!823217 (not e!823223))))

(declare-fun res!994086 () Bool)

(assert (=> b!1465046 (=> res!994086 e!823223)))

(assert (=> b!1465046 (= res!994086 (or (and (= (select (arr!47665 a!2862) index!646) (select (store (arr!47665 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47665 a!2862) index!646) (select (arr!47665 a!2862) j!93))) (= (select (arr!47665 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1465046 e!823220))

(declare-fun res!994077 () Bool)

(assert (=> b!1465046 (=> (not res!994077) (not e!823220))))

(assert (=> b!1465046 (= res!994077 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49221 0))(
  ( (Unit!49222) )
))
(declare-fun lt!641104 () Unit!49221)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98752 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49221)

(assert (=> b!1465046 (= lt!641104 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1465047 () Bool)

(declare-fun res!994079 () Bool)

(assert (=> b!1465047 (=> (not res!994079) (not e!823220))))

(assert (=> b!1465047 (= res!994079 (= (seekEntryOrOpen!0 (select (arr!47665 a!2862) j!93) a!2862 mask!2687) (Found!11942 j!93)))))

(assert (= (and start!125326 res!994084) b!1465041))

(assert (= (and b!1465041 res!994072) b!1465045))

(assert (= (and b!1465045 res!994080) b!1465034))

(assert (= (and b!1465034 res!994071) b!1465028))

(assert (= (and b!1465028 res!994085) b!1465032))

(assert (= (and b!1465032 res!994073) b!1465031))

(assert (= (and b!1465031 res!994076) b!1465044))

(assert (= (and b!1465044 res!994082) b!1465043))

(assert (= (and b!1465043 res!994070) b!1465036))

(assert (= (and b!1465036 res!994074) b!1465035))

(assert (= (and b!1465035 res!994087) b!1465039))

(assert (= (and b!1465039 c!134991) b!1465029))

(assert (= (and b!1465039 (not c!134991)) b!1465026))

(assert (= (and b!1465039 res!994083) b!1465037))

(assert (= (and b!1465037 res!994081) b!1465046))

(assert (= (and b!1465046 res!994077) b!1465047))

(assert (= (and b!1465047 res!994079) b!1465027))

(assert (= (and b!1465046 (not res!994086)) b!1465040))

(assert (= (and b!1465040 (not res!994075)) b!1465030))

(assert (= (and b!1465030 (not res!994078)) b!1465042))

(assert (= (and b!1465042 c!134992) b!1465038))

(assert (= (and b!1465042 (not c!134992)) b!1465033))

(declare-fun m!1351665 () Bool)

(assert (=> b!1465028 m!1351665))

(declare-fun m!1351667 () Bool)

(assert (=> b!1465029 m!1351667))

(declare-fun m!1351669 () Bool)

(assert (=> b!1465026 m!1351669))

(declare-fun m!1351671 () Bool)

(assert (=> b!1465026 m!1351671))

(declare-fun m!1351673 () Bool)

(assert (=> b!1465033 m!1351673))

(assert (=> b!1465033 m!1351671))

(declare-fun m!1351675 () Bool)

(assert (=> b!1465036 m!1351675))

(assert (=> b!1465036 m!1351675))

(declare-fun m!1351677 () Bool)

(assert (=> b!1465036 m!1351677))

(declare-fun m!1351679 () Bool)

(assert (=> b!1465032 m!1351679))

(declare-fun m!1351681 () Bool)

(assert (=> start!125326 m!1351681))

(declare-fun m!1351683 () Bool)

(assert (=> start!125326 m!1351683))

(declare-fun m!1351685 () Bool)

(assert (=> b!1465035 m!1351685))

(assert (=> b!1465035 m!1351685))

(declare-fun m!1351687 () Bool)

(assert (=> b!1465035 m!1351687))

(declare-fun m!1351689 () Bool)

(assert (=> b!1465035 m!1351689))

(declare-fun m!1351691 () Bool)

(assert (=> b!1465035 m!1351691))

(declare-fun m!1351693 () Bool)

(assert (=> b!1465045 m!1351693))

(assert (=> b!1465045 m!1351693))

(declare-fun m!1351695 () Bool)

(assert (=> b!1465045 m!1351695))

(assert (=> b!1465044 m!1351689))

(declare-fun m!1351697 () Bool)

(assert (=> b!1465044 m!1351697))

(assert (=> b!1465030 m!1351675))

(assert (=> b!1465030 m!1351675))

(declare-fun m!1351699 () Bool)

(assert (=> b!1465030 m!1351699))

(declare-fun m!1351701 () Bool)

(assert (=> b!1465027 m!1351701))

(assert (=> b!1465027 m!1351675))

(assert (=> b!1465047 m!1351675))

(assert (=> b!1465047 m!1351675))

(declare-fun m!1351703 () Bool)

(assert (=> b!1465047 m!1351703))

(declare-fun m!1351705 () Bool)

(assert (=> b!1465046 m!1351705))

(assert (=> b!1465046 m!1351689))

(declare-fun m!1351707 () Bool)

(assert (=> b!1465046 m!1351707))

(declare-fun m!1351709 () Bool)

(assert (=> b!1465046 m!1351709))

(declare-fun m!1351711 () Bool)

(assert (=> b!1465046 m!1351711))

(assert (=> b!1465046 m!1351675))

(declare-fun m!1351713 () Bool)

(assert (=> b!1465038 m!1351713))

(assert (=> b!1465043 m!1351675))

(assert (=> b!1465043 m!1351675))

(declare-fun m!1351715 () Bool)

(assert (=> b!1465043 m!1351715))

(assert (=> b!1465043 m!1351715))

(assert (=> b!1465043 m!1351675))

(declare-fun m!1351717 () Bool)

(assert (=> b!1465043 m!1351717))

(assert (=> b!1465034 m!1351675))

(assert (=> b!1465034 m!1351675))

(declare-fun m!1351719 () Bool)

(assert (=> b!1465034 m!1351719))

(declare-fun m!1351721 () Bool)

(assert (=> b!1465040 m!1351721))

(check-sat (not b!1465043) (not b!1465045) (not b!1465034) (not b!1465033) (not b!1465035) (not b!1465030) (not b!1465038) (not b!1465026) (not b!1465047) (not b!1465029) (not b!1465028) (not b!1465036) (not b!1465040) (not b!1465046) (not b!1465032) (not start!125326))
(check-sat)
