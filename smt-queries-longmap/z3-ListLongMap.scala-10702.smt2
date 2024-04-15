; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125320 () Bool)

(assert start!125320)

(declare-fun b!1464828 () Bool)

(declare-fun res!993922 () Bool)

(declare-fun e!823128 () Bool)

(assert (=> b!1464828 (=> (not res!993922) (not e!823128))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1464828 (= res!993922 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1464829 () Bool)

(declare-fun res!993910 () Bool)

(declare-fun e!823127 () Bool)

(assert (=> b!1464829 (=> (not res!993910) (not e!823127))))

(declare-datatypes ((array!98746 0))(
  ( (array!98747 (arr!47662 (Array (_ BitVec 32) (_ BitVec 64))) (size!48214 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98746)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98746 (_ BitVec 32)) Bool)

(assert (=> b!1464829 (= res!993910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1464830 () Bool)

(declare-fun res!993912 () Bool)

(assert (=> b!1464830 (=> (not res!993912) (not e!823127))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1464830 (= res!993912 (and (= (size!48214 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48214 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48214 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1464831 () Bool)

(declare-fun res!993918 () Bool)

(declare-fun e!823134 () Bool)

(assert (=> b!1464831 (=> (not res!993918) (not e!823134))))

(declare-datatypes ((SeekEntryResult!11939 0))(
  ( (MissingZero!11939 (index!50148 (_ BitVec 32))) (Found!11939 (index!50149 (_ BitVec 32))) (Intermediate!11939 (undefined!12751 Bool) (index!50150 (_ BitVec 32)) (x!131727 (_ BitVec 32))) (Undefined!11939) (MissingVacant!11939 (index!50151 (_ BitVec 32))) )
))
(declare-fun lt!641043 () SeekEntryResult!11939)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98746 (_ BitVec 32)) SeekEntryResult!11939)

(assert (=> b!1464831 (= res!993918 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47662 a!2862) j!93) a!2862 mask!2687) lt!641043))))

(declare-fun lt!641037 () (_ BitVec 64))

(declare-fun b!1464832 () Bool)

(declare-fun lt!641041 () (_ BitVec 32))

(declare-fun lt!641042 () array!98746)

(declare-fun lt!641039 () SeekEntryResult!11939)

(declare-fun e!823125 () Bool)

(assert (=> b!1464832 (= e!823125 (not (= lt!641039 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641041 lt!641037 lt!641042 mask!2687))))))

(declare-fun b!1464833 () Bool)

(declare-fun res!993916 () Bool)

(declare-fun e!823130 () Bool)

(assert (=> b!1464833 (=> (not res!993916) (not e!823130))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98746 (_ BitVec 32)) SeekEntryResult!11939)

(assert (=> b!1464833 (= res!993916 (= (seekEntryOrOpen!0 (select (arr!47662 a!2862) j!93) a!2862 mask!2687) (Found!11939 j!93)))))

(declare-fun e!823133 () Bool)

(declare-fun b!1464834 () Bool)

(assert (=> b!1464834 (= e!823133 (= lt!641039 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641037 lt!641042 mask!2687)))))

(declare-fun b!1464835 () Bool)

(declare-fun e!823131 () Bool)

(assert (=> b!1464835 (= e!823127 e!823131)))

(declare-fun res!993913 () Bool)

(assert (=> b!1464835 (=> (not res!993913) (not e!823131))))

(assert (=> b!1464835 (= res!993913 (= (select (store (arr!47662 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1464835 (= lt!641042 (array!98747 (store (arr!47662 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48214 a!2862)))))

(declare-fun b!1464836 () Bool)

(declare-fun e!823129 () Bool)

(assert (=> b!1464836 (= e!823128 (not e!823129))))

(declare-fun res!993923 () Bool)

(assert (=> b!1464836 (=> res!993923 e!823129)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1464836 (= res!993923 (or (and (= (select (arr!47662 a!2862) index!646) (select (store (arr!47662 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47662 a!2862) index!646) (select (arr!47662 a!2862) j!93))) (= (select (arr!47662 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1464836 e!823130))

(declare-fun res!993914 () Bool)

(assert (=> b!1464836 (=> (not res!993914) (not e!823130))))

(assert (=> b!1464836 (= res!993914 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49215 0))(
  ( (Unit!49216) )
))
(declare-fun lt!641040 () Unit!49215)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98746 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49215)

(assert (=> b!1464836 (= lt!641040 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1464837 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98746 (_ BitVec 32)) SeekEntryResult!11939)

(assert (=> b!1464837 (= e!823125 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641041 intermediateAfterIndex!19 lt!641037 lt!641042 mask!2687) (seekEntryOrOpen!0 lt!641037 lt!641042 mask!2687))))))

(declare-fun b!1464838 () Bool)

(declare-fun e!823132 () Bool)

(assert (=> b!1464838 (= e!823129 e!823132)))

(declare-fun res!993909 () Bool)

(assert (=> b!1464838 (=> res!993909 e!823132)))

(assert (=> b!1464838 (= res!993909 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641041 #b00000000000000000000000000000000) (bvsge lt!641041 (size!48214 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464838 (= lt!641041 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1464839 () Bool)

(assert (=> b!1464839 (= e!823130 (or (= (select (arr!47662 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47662 a!2862) intermediateBeforeIndex!19) (select (arr!47662 a!2862) j!93))))))

(declare-fun res!993924 () Bool)

(assert (=> start!125320 (=> (not res!993924) (not e!823127))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125320 (= res!993924 (validMask!0 mask!2687))))

(assert (=> start!125320 e!823127))

(assert (=> start!125320 true))

(declare-fun array_inv!36895 (array!98746) Bool)

(assert (=> start!125320 (array_inv!36895 a!2862)))

(declare-fun b!1464840 () Bool)

(declare-fun res!993925 () Bool)

(assert (=> b!1464840 (=> (not res!993925) (not e!823127))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1464840 (= res!993925 (validKeyInArray!0 (select (arr!47662 a!2862) j!93)))))

(declare-fun b!1464841 () Bool)

(declare-fun res!993908 () Bool)

(assert (=> b!1464841 (=> (not res!993908) (not e!823128))))

(assert (=> b!1464841 (= res!993908 e!823133)))

(declare-fun c!134974 () Bool)

(assert (=> b!1464841 (= c!134974 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1464842 () Bool)

(assert (=> b!1464842 (= e!823134 e!823128)))

(declare-fun res!993921 () Bool)

(assert (=> b!1464842 (=> (not res!993921) (not e!823128))))

(assert (=> b!1464842 (= res!993921 (= lt!641039 (Intermediate!11939 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464842 (= lt!641039 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641037 mask!2687) lt!641037 lt!641042 mask!2687))))

(assert (=> b!1464842 (= lt!641037 (select (store (arr!47662 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1464843 () Bool)

(declare-fun res!993911 () Bool)

(assert (=> b!1464843 (=> (not res!993911) (not e!823127))))

(assert (=> b!1464843 (= res!993911 (validKeyInArray!0 (select (arr!47662 a!2862) i!1006)))))

(declare-fun b!1464844 () Bool)

(declare-fun res!993915 () Bool)

(assert (=> b!1464844 (=> (not res!993915) (not e!823127))))

(assert (=> b!1464844 (= res!993915 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48214 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48214 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48214 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1464845 () Bool)

(assert (=> b!1464845 (= e!823131 e!823134)))

(declare-fun res!993920 () Bool)

(assert (=> b!1464845 (=> (not res!993920) (not e!823134))))

(assert (=> b!1464845 (= res!993920 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47662 a!2862) j!93) mask!2687) (select (arr!47662 a!2862) j!93) a!2862 mask!2687) lt!641043))))

(assert (=> b!1464845 (= lt!641043 (Intermediate!11939 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1464846 () Bool)

(assert (=> b!1464846 (= e!823132 true)))

(declare-fun lt!641038 () Bool)

(assert (=> b!1464846 (= lt!641038 e!823125)))

(declare-fun c!134973 () Bool)

(assert (=> b!1464846 (= c!134973 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1464847 () Bool)

(declare-fun res!993919 () Bool)

(assert (=> b!1464847 (=> (not res!993919) (not e!823127))))

(declare-datatypes ((List!34241 0))(
  ( (Nil!34238) (Cons!34237 (h!35587 (_ BitVec 64)) (t!48927 List!34241)) )
))
(declare-fun arrayNoDuplicates!0 (array!98746 (_ BitVec 32) List!34241) Bool)

(assert (=> b!1464847 (= res!993919 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34238))))

(declare-fun b!1464848 () Bool)

(declare-fun res!993917 () Bool)

(assert (=> b!1464848 (=> res!993917 e!823132)))

(assert (=> b!1464848 (= res!993917 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641041 (select (arr!47662 a!2862) j!93) a!2862 mask!2687) lt!641043)))))

(declare-fun b!1464849 () Bool)

(assert (=> b!1464849 (= e!823133 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641037 lt!641042 mask!2687) (seekEntryOrOpen!0 lt!641037 lt!641042 mask!2687)))))

(assert (= (and start!125320 res!993924) b!1464830))

(assert (= (and b!1464830 res!993912) b!1464843))

(assert (= (and b!1464843 res!993911) b!1464840))

(assert (= (and b!1464840 res!993925) b!1464829))

(assert (= (and b!1464829 res!993910) b!1464847))

(assert (= (and b!1464847 res!993919) b!1464844))

(assert (= (and b!1464844 res!993915) b!1464835))

(assert (= (and b!1464835 res!993913) b!1464845))

(assert (= (and b!1464845 res!993920) b!1464831))

(assert (= (and b!1464831 res!993918) b!1464842))

(assert (= (and b!1464842 res!993921) b!1464841))

(assert (= (and b!1464841 c!134974) b!1464834))

(assert (= (and b!1464841 (not c!134974)) b!1464849))

(assert (= (and b!1464841 res!993908) b!1464828))

(assert (= (and b!1464828 res!993922) b!1464836))

(assert (= (and b!1464836 res!993914) b!1464833))

(assert (= (and b!1464833 res!993916) b!1464839))

(assert (= (and b!1464836 (not res!993923)) b!1464838))

(assert (= (and b!1464838 (not res!993909)) b!1464848))

(assert (= (and b!1464848 (not res!993917)) b!1464846))

(assert (= (and b!1464846 c!134973) b!1464832))

(assert (= (and b!1464846 (not c!134973)) b!1464837))

(declare-fun m!1351491 () Bool)

(assert (=> b!1464838 m!1351491))

(declare-fun m!1351493 () Bool)

(assert (=> b!1464837 m!1351493))

(declare-fun m!1351495 () Bool)

(assert (=> b!1464837 m!1351495))

(declare-fun m!1351497 () Bool)

(assert (=> b!1464829 m!1351497))

(declare-fun m!1351499 () Bool)

(assert (=> b!1464848 m!1351499))

(assert (=> b!1464848 m!1351499))

(declare-fun m!1351501 () Bool)

(assert (=> b!1464848 m!1351501))

(declare-fun m!1351503 () Bool)

(assert (=> b!1464843 m!1351503))

(assert (=> b!1464843 m!1351503))

(declare-fun m!1351505 () Bool)

(assert (=> b!1464843 m!1351505))

(declare-fun m!1351507 () Bool)

(assert (=> b!1464849 m!1351507))

(assert (=> b!1464849 m!1351495))

(declare-fun m!1351509 () Bool)

(assert (=> b!1464847 m!1351509))

(declare-fun m!1351511 () Bool)

(assert (=> b!1464836 m!1351511))

(declare-fun m!1351513 () Bool)

(assert (=> b!1464836 m!1351513))

(declare-fun m!1351515 () Bool)

(assert (=> b!1464836 m!1351515))

(declare-fun m!1351517 () Bool)

(assert (=> b!1464836 m!1351517))

(declare-fun m!1351519 () Bool)

(assert (=> b!1464836 m!1351519))

(assert (=> b!1464836 m!1351499))

(assert (=> b!1464833 m!1351499))

(assert (=> b!1464833 m!1351499))

(declare-fun m!1351521 () Bool)

(assert (=> b!1464833 m!1351521))

(declare-fun m!1351523 () Bool)

(assert (=> b!1464834 m!1351523))

(declare-fun m!1351525 () Bool)

(assert (=> b!1464839 m!1351525))

(assert (=> b!1464839 m!1351499))

(assert (=> b!1464835 m!1351513))

(declare-fun m!1351527 () Bool)

(assert (=> b!1464835 m!1351527))

(assert (=> b!1464831 m!1351499))

(assert (=> b!1464831 m!1351499))

(declare-fun m!1351529 () Bool)

(assert (=> b!1464831 m!1351529))

(declare-fun m!1351531 () Bool)

(assert (=> b!1464842 m!1351531))

(assert (=> b!1464842 m!1351531))

(declare-fun m!1351533 () Bool)

(assert (=> b!1464842 m!1351533))

(assert (=> b!1464842 m!1351513))

(declare-fun m!1351535 () Bool)

(assert (=> b!1464842 m!1351535))

(assert (=> b!1464840 m!1351499))

(assert (=> b!1464840 m!1351499))

(declare-fun m!1351537 () Bool)

(assert (=> b!1464840 m!1351537))

(assert (=> b!1464845 m!1351499))

(assert (=> b!1464845 m!1351499))

(declare-fun m!1351539 () Bool)

(assert (=> b!1464845 m!1351539))

(assert (=> b!1464845 m!1351539))

(assert (=> b!1464845 m!1351499))

(declare-fun m!1351541 () Bool)

(assert (=> b!1464845 m!1351541))

(declare-fun m!1351543 () Bool)

(assert (=> b!1464832 m!1351543))

(declare-fun m!1351545 () Bool)

(assert (=> start!125320 m!1351545))

(declare-fun m!1351547 () Bool)

(assert (=> start!125320 m!1351547))

(check-sat (not b!1464843) (not b!1464837) (not b!1464838) (not b!1464840) (not b!1464833) (not b!1464836) (not b!1464834) (not b!1464829) (not b!1464845) (not b!1464847) (not b!1464849) (not b!1464832) (not b!1464831) (not b!1464842) (not b!1464848) (not start!125320))
(check-sat)
