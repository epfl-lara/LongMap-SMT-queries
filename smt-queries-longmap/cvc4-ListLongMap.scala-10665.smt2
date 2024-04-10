; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125132 () Bool)

(assert start!125132)

(declare-fun b!1458000 () Bool)

(declare-fun res!988214 () Bool)

(declare-fun e!820145 () Bool)

(assert (=> b!1458000 (=> (not res!988214) (not e!820145))))

(declare-datatypes ((array!98580 0))(
  ( (array!98581 (arr!47578 (Array (_ BitVec 32) (_ BitVec 64))) (size!48128 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98580)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1458000 (= res!988214 (validKeyInArray!0 (select (arr!47578 a!2862) j!93)))))

(declare-fun b!1458001 () Bool)

(declare-fun e!820150 () Bool)

(declare-fun e!820143 () Bool)

(assert (=> b!1458001 (= e!820150 e!820143)))

(declare-fun res!988205 () Bool)

(assert (=> b!1458001 (=> res!988205 e!820143)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!638889 () (_ BitVec 32))

(assert (=> b!1458001 (= res!988205 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638889 #b00000000000000000000000000000000) (bvsge lt!638889 (size!48128 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458001 (= lt!638889 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!638883 () (_ BitVec 64))

(declare-fun lt!638888 () array!98580)

(declare-datatypes ((SeekEntryResult!11830 0))(
  ( (MissingZero!11830 (index!49712 (_ BitVec 32))) (Found!11830 (index!49713 (_ BitVec 32))) (Intermediate!11830 (undefined!12642 Bool) (index!49714 (_ BitVec 32)) (x!131327 (_ BitVec 32))) (Undefined!11830) (MissingVacant!11830 (index!49715 (_ BitVec 32))) )
))
(declare-fun lt!638887 () SeekEntryResult!11830)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98580 (_ BitVec 32)) SeekEntryResult!11830)

(assert (=> b!1458001 (= lt!638887 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638883 lt!638888 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98580 (_ BitVec 32)) SeekEntryResult!11830)

(assert (=> b!1458001 (= lt!638887 (seekEntryOrOpen!0 lt!638883 lt!638888 mask!2687))))

(declare-fun b!1458003 () Bool)

(declare-fun res!988210 () Bool)

(assert (=> b!1458003 (=> (not res!988210) (not e!820145))))

(declare-datatypes ((List!34079 0))(
  ( (Nil!34076) (Cons!34075 (h!35425 (_ BitVec 64)) (t!48773 List!34079)) )
))
(declare-fun arrayNoDuplicates!0 (array!98580 (_ BitVec 32) List!34079) Bool)

(assert (=> b!1458003 (= res!988210 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34076))))

(declare-fun b!1458004 () Bool)

(declare-fun res!988200 () Bool)

(assert (=> b!1458004 (=> res!988200 e!820143)))

(declare-fun lt!638885 () SeekEntryResult!11830)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98580 (_ BitVec 32)) SeekEntryResult!11830)

(assert (=> b!1458004 (= res!988200 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638889 (select (arr!47578 a!2862) j!93) a!2862 mask!2687) lt!638885)))))

(declare-fun e!820146 () Bool)

(declare-fun b!1458005 () Bool)

(assert (=> b!1458005 (= e!820146 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638889 intermediateAfterIndex!19 lt!638883 lt!638888 mask!2687) lt!638887)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun b!1458006 () Bool)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun e!820149 () Bool)

(assert (=> b!1458006 (= e!820149 (and (or (= (select (arr!47578 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47578 a!2862) intermediateBeforeIndex!19) (select (arr!47578 a!2862) j!93))) (let ((bdg!53383 (select (store (arr!47578 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47578 a!2862) index!646) bdg!53383) (= (select (arr!47578 a!2862) index!646) (select (arr!47578 a!2862) j!93))) (= (select (arr!47578 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53383 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1458007 () Bool)

(declare-fun res!988213 () Bool)

(assert (=> b!1458007 (=> (not res!988213) (not e!820145))))

(assert (=> b!1458007 (= res!988213 (and (= (size!48128 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48128 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48128 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1458008 () Bool)

(declare-fun res!988211 () Bool)

(assert (=> b!1458008 (=> (not res!988211) (not e!820149))))

(assert (=> b!1458008 (= res!988211 (= (seekEntryOrOpen!0 (select (arr!47578 a!2862) j!93) a!2862 mask!2687) (Found!11830 j!93)))))

(declare-fun b!1458009 () Bool)

(declare-fun e!820148 () Bool)

(assert (=> b!1458009 (= e!820148 (not e!820150))))

(declare-fun res!988216 () Bool)

(assert (=> b!1458009 (=> res!988216 e!820150)))

(assert (=> b!1458009 (= res!988216 (or (and (= (select (arr!47578 a!2862) index!646) (select (store (arr!47578 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47578 a!2862) index!646) (select (arr!47578 a!2862) j!93))) (= (select (arr!47578 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1458009 e!820149))

(declare-fun res!988206 () Bool)

(assert (=> b!1458009 (=> (not res!988206) (not e!820149))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98580 (_ BitVec 32)) Bool)

(assert (=> b!1458009 (= res!988206 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49156 0))(
  ( (Unit!49157) )
))
(declare-fun lt!638886 () Unit!49156)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98580 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49156)

(assert (=> b!1458009 (= lt!638886 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1458010 () Bool)

(declare-fun res!988203 () Bool)

(assert (=> b!1458010 (=> (not res!988203) (not e!820145))))

(assert (=> b!1458010 (= res!988203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1458011 () Bool)

(declare-fun e!820147 () Bool)

(assert (=> b!1458011 (= e!820147 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638883 lt!638888 mask!2687) (seekEntryOrOpen!0 lt!638883 lt!638888 mask!2687)))))

(declare-fun b!1458012 () Bool)

(declare-fun res!988204 () Bool)

(assert (=> b!1458012 (=> (not res!988204) (not e!820145))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1458012 (= res!988204 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48128 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48128 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48128 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1458013 () Bool)

(declare-fun res!988212 () Bool)

(declare-fun e!820142 () Bool)

(assert (=> b!1458013 (=> (not res!988212) (not e!820142))))

(assert (=> b!1458013 (= res!988212 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47578 a!2862) j!93) a!2862 mask!2687) lt!638885))))

(declare-fun b!1458014 () Bool)

(declare-fun e!820144 () Bool)

(assert (=> b!1458014 (= e!820144 e!820142)))

(declare-fun res!988199 () Bool)

(assert (=> b!1458014 (=> (not res!988199) (not e!820142))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458014 (= res!988199 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47578 a!2862) j!93) mask!2687) (select (arr!47578 a!2862) j!93) a!2862 mask!2687) lt!638885))))

(assert (=> b!1458014 (= lt!638885 (Intermediate!11830 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun lt!638884 () SeekEntryResult!11830)

(declare-fun b!1458002 () Bool)

(assert (=> b!1458002 (= e!820146 (not (= lt!638884 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638889 lt!638883 lt!638888 mask!2687))))))

(declare-fun res!988201 () Bool)

(assert (=> start!125132 (=> (not res!988201) (not e!820145))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125132 (= res!988201 (validMask!0 mask!2687))))

(assert (=> start!125132 e!820145))

(assert (=> start!125132 true))

(declare-fun array_inv!36606 (array!98580) Bool)

(assert (=> start!125132 (array_inv!36606 a!2862)))

(declare-fun b!1458015 () Bool)

(assert (=> b!1458015 (= e!820142 e!820148)))

(declare-fun res!988208 () Bool)

(assert (=> b!1458015 (=> (not res!988208) (not e!820148))))

(assert (=> b!1458015 (= res!988208 (= lt!638884 (Intermediate!11830 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1458015 (= lt!638884 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638883 mask!2687) lt!638883 lt!638888 mask!2687))))

(assert (=> b!1458015 (= lt!638883 (select (store (arr!47578 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1458016 () Bool)

(declare-fun res!988215 () Bool)

(assert (=> b!1458016 (=> (not res!988215) (not e!820145))))

(assert (=> b!1458016 (= res!988215 (validKeyInArray!0 (select (arr!47578 a!2862) i!1006)))))

(declare-fun b!1458017 () Bool)

(assert (=> b!1458017 (= e!820147 (= lt!638884 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638883 lt!638888 mask!2687)))))

(declare-fun b!1458018 () Bool)

(assert (=> b!1458018 (= e!820143 true)))

(declare-fun lt!638882 () Bool)

(assert (=> b!1458018 (= lt!638882 e!820146)))

(declare-fun c!134412 () Bool)

(assert (=> b!1458018 (= c!134412 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1458019 () Bool)

(declare-fun res!988207 () Bool)

(assert (=> b!1458019 (=> (not res!988207) (not e!820148))))

(assert (=> b!1458019 (= res!988207 e!820147)))

(declare-fun c!134411 () Bool)

(assert (=> b!1458019 (= c!134411 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1458020 () Bool)

(declare-fun res!988202 () Bool)

(assert (=> b!1458020 (=> (not res!988202) (not e!820148))))

(assert (=> b!1458020 (= res!988202 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1458021 () Bool)

(assert (=> b!1458021 (= e!820145 e!820144)))

(declare-fun res!988209 () Bool)

(assert (=> b!1458021 (=> (not res!988209) (not e!820144))))

(assert (=> b!1458021 (= res!988209 (= (select (store (arr!47578 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1458021 (= lt!638888 (array!98581 (store (arr!47578 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48128 a!2862)))))

(assert (= (and start!125132 res!988201) b!1458007))

(assert (= (and b!1458007 res!988213) b!1458016))

(assert (= (and b!1458016 res!988215) b!1458000))

(assert (= (and b!1458000 res!988214) b!1458010))

(assert (= (and b!1458010 res!988203) b!1458003))

(assert (= (and b!1458003 res!988210) b!1458012))

(assert (= (and b!1458012 res!988204) b!1458021))

(assert (= (and b!1458021 res!988209) b!1458014))

(assert (= (and b!1458014 res!988199) b!1458013))

(assert (= (and b!1458013 res!988212) b!1458015))

(assert (= (and b!1458015 res!988208) b!1458019))

(assert (= (and b!1458019 c!134411) b!1458017))

(assert (= (and b!1458019 (not c!134411)) b!1458011))

(assert (= (and b!1458019 res!988207) b!1458020))

(assert (= (and b!1458020 res!988202) b!1458009))

(assert (= (and b!1458009 res!988206) b!1458008))

(assert (= (and b!1458008 res!988211) b!1458006))

(assert (= (and b!1458009 (not res!988216)) b!1458001))

(assert (= (and b!1458001 (not res!988205)) b!1458004))

(assert (= (and b!1458004 (not res!988200)) b!1458018))

(assert (= (and b!1458018 c!134412) b!1458002))

(assert (= (and b!1458018 (not c!134412)) b!1458005))

(declare-fun m!1345911 () Bool)

(assert (=> b!1458011 m!1345911))

(declare-fun m!1345913 () Bool)

(assert (=> b!1458011 m!1345913))

(declare-fun m!1345915 () Bool)

(assert (=> b!1458013 m!1345915))

(assert (=> b!1458013 m!1345915))

(declare-fun m!1345917 () Bool)

(assert (=> b!1458013 m!1345917))

(declare-fun m!1345919 () Bool)

(assert (=> b!1458002 m!1345919))

(assert (=> b!1458008 m!1345915))

(assert (=> b!1458008 m!1345915))

(declare-fun m!1345921 () Bool)

(assert (=> b!1458008 m!1345921))

(declare-fun m!1345923 () Bool)

(assert (=> b!1458017 m!1345923))

(declare-fun m!1345925 () Bool)

(assert (=> b!1458010 m!1345925))

(declare-fun m!1345927 () Bool)

(assert (=> b!1458021 m!1345927))

(declare-fun m!1345929 () Bool)

(assert (=> b!1458021 m!1345929))

(declare-fun m!1345931 () Bool)

(assert (=> b!1458009 m!1345931))

(assert (=> b!1458009 m!1345927))

(declare-fun m!1345933 () Bool)

(assert (=> b!1458009 m!1345933))

(declare-fun m!1345935 () Bool)

(assert (=> b!1458009 m!1345935))

(declare-fun m!1345937 () Bool)

(assert (=> b!1458009 m!1345937))

(assert (=> b!1458009 m!1345915))

(assert (=> b!1458014 m!1345915))

(assert (=> b!1458014 m!1345915))

(declare-fun m!1345939 () Bool)

(assert (=> b!1458014 m!1345939))

(assert (=> b!1458014 m!1345939))

(assert (=> b!1458014 m!1345915))

(declare-fun m!1345941 () Bool)

(assert (=> b!1458014 m!1345941))

(assert (=> b!1458006 m!1345927))

(declare-fun m!1345943 () Bool)

(assert (=> b!1458006 m!1345943))

(assert (=> b!1458006 m!1345933))

(assert (=> b!1458006 m!1345935))

(assert (=> b!1458006 m!1345915))

(declare-fun m!1345945 () Bool)

(assert (=> b!1458015 m!1345945))

(assert (=> b!1458015 m!1345945))

(declare-fun m!1345947 () Bool)

(assert (=> b!1458015 m!1345947))

(assert (=> b!1458015 m!1345927))

(declare-fun m!1345949 () Bool)

(assert (=> b!1458015 m!1345949))

(declare-fun m!1345951 () Bool)

(assert (=> start!125132 m!1345951))

(declare-fun m!1345953 () Bool)

(assert (=> start!125132 m!1345953))

(assert (=> b!1458004 m!1345915))

(assert (=> b!1458004 m!1345915))

(declare-fun m!1345955 () Bool)

(assert (=> b!1458004 m!1345955))

(declare-fun m!1345957 () Bool)

(assert (=> b!1458001 m!1345957))

(assert (=> b!1458001 m!1345911))

(assert (=> b!1458001 m!1345913))

(assert (=> b!1458000 m!1345915))

(assert (=> b!1458000 m!1345915))

(declare-fun m!1345959 () Bool)

(assert (=> b!1458000 m!1345959))

(declare-fun m!1345961 () Bool)

(assert (=> b!1458005 m!1345961))

(declare-fun m!1345963 () Bool)

(assert (=> b!1458016 m!1345963))

(assert (=> b!1458016 m!1345963))

(declare-fun m!1345965 () Bool)

(assert (=> b!1458016 m!1345965))

(declare-fun m!1345967 () Bool)

(assert (=> b!1458003 m!1345967))

(push 1)

