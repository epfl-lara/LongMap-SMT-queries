; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124682 () Bool)

(assert start!124682)

(declare-fun b!1444847 () Bool)

(declare-fun res!976797 () Bool)

(declare-fun e!814004 () Bool)

(assert (=> b!1444847 (=> (not res!976797) (not e!814004))))

(declare-datatypes ((array!98130 0))(
  ( (array!98131 (arr!47353 (Array (_ BitVec 32) (_ BitVec 64))) (size!47903 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98130)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1444847 (= res!976797 (validKeyInArray!0 (select (arr!47353 a!2862) j!93)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!814002 () Bool)

(declare-fun lt!634325 () array!98130)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!634326 () (_ BitVec 64))

(declare-fun b!1444848 () Bool)

(declare-datatypes ((SeekEntryResult!11605 0))(
  ( (MissingZero!11605 (index!48812 (_ BitVec 32))) (Found!11605 (index!48813 (_ BitVec 32))) (Intermediate!11605 (undefined!12417 Bool) (index!48814 (_ BitVec 32)) (x!130502 (_ BitVec 32))) (Undefined!11605) (MissingVacant!11605 (index!48815 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98130 (_ BitVec 32)) SeekEntryResult!11605)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98130 (_ BitVec 32)) SeekEntryResult!11605)

(assert (=> b!1444848 (= e!814002 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634326 lt!634325 mask!2687) (seekEntryOrOpen!0 lt!634326 lt!634325 mask!2687)))))

(declare-fun b!1444849 () Bool)

(declare-fun res!976802 () Bool)

(assert (=> b!1444849 (=> (not res!976802) (not e!814004))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1444849 (= res!976802 (validKeyInArray!0 (select (arr!47353 a!2862) i!1006)))))

(declare-fun b!1444850 () Bool)

(declare-fun res!976790 () Bool)

(declare-fun e!814003 () Bool)

(assert (=> b!1444850 (=> (not res!976790) (not e!814003))))

(assert (=> b!1444850 (= res!976790 (= (seekEntryOrOpen!0 (select (arr!47353 a!2862) j!93) a!2862 mask!2687) (Found!11605 j!93)))))

(declare-fun b!1444851 () Bool)

(declare-fun e!813998 () Bool)

(assert (=> b!1444851 (= e!814004 e!813998)))

(declare-fun res!976804 () Bool)

(assert (=> b!1444851 (=> (not res!976804) (not e!813998))))

(assert (=> b!1444851 (= res!976804 (= (select (store (arr!47353 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1444851 (= lt!634325 (array!98131 (store (arr!47353 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47903 a!2862)))))

(declare-fun b!1444852 () Bool)

(declare-fun res!976791 () Bool)

(assert (=> b!1444852 (=> (not res!976791) (not e!814004))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1444852 (= res!976791 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47903 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47903 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47903 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1444853 () Bool)

(declare-fun e!814000 () Bool)

(assert (=> b!1444853 (= e!813998 e!814000)))

(declare-fun res!976803 () Bool)

(assert (=> b!1444853 (=> (not res!976803) (not e!814000))))

(declare-fun lt!634322 () SeekEntryResult!11605)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98130 (_ BitVec 32)) SeekEntryResult!11605)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1444853 (= res!976803 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47353 a!2862) j!93) mask!2687) (select (arr!47353 a!2862) j!93) a!2862 mask!2687) lt!634322))))

(assert (=> b!1444853 (= lt!634322 (Intermediate!11605 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1444854 () Bool)

(declare-fun res!976798 () Bool)

(declare-fun e!814001 () Bool)

(assert (=> b!1444854 (=> (not res!976798) (not e!814001))))

(assert (=> b!1444854 (= res!976798 e!814002)))

(declare-fun c!133539 () Bool)

(assert (=> b!1444854 (= c!133539 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1444855 () Bool)

(assert (=> b!1444855 (= e!814003 (or (= (select (arr!47353 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47353 a!2862) intermediateBeforeIndex!19) (select (arr!47353 a!2862) j!93))))))

(declare-fun res!976795 () Bool)

(assert (=> start!124682 (=> (not res!976795) (not e!814004))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124682 (= res!976795 (validMask!0 mask!2687))))

(assert (=> start!124682 e!814004))

(assert (=> start!124682 true))

(declare-fun array_inv!36381 (array!98130) Bool)

(assert (=> start!124682 (array_inv!36381 a!2862)))

(declare-fun b!1444856 () Bool)

(declare-fun lt!634324 () SeekEntryResult!11605)

(assert (=> b!1444856 (= e!814002 (= lt!634324 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634326 lt!634325 mask!2687)))))

(declare-fun b!1444857 () Bool)

(assert (=> b!1444857 (= e!814001 (not (or (and (= (select (arr!47353 a!2862) index!646) (select (store (arr!47353 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47353 a!2862) index!646) (select (arr!47353 a!2862) j!93))) (not (= (select (arr!47353 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(assert (=> b!1444857 e!814003))

(declare-fun res!976792 () Bool)

(assert (=> b!1444857 (=> (not res!976792) (not e!814003))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98130 (_ BitVec 32)) Bool)

(assert (=> b!1444857 (= res!976792 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48706 0))(
  ( (Unit!48707) )
))
(declare-fun lt!634323 () Unit!48706)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98130 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48706)

(assert (=> b!1444857 (= lt!634323 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1444858 () Bool)

(declare-fun res!976793 () Bool)

(assert (=> b!1444858 (=> (not res!976793) (not e!814004))))

(assert (=> b!1444858 (= res!976793 (and (= (size!47903 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47903 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47903 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1444859 () Bool)

(declare-fun res!976794 () Bool)

(assert (=> b!1444859 (=> (not res!976794) (not e!814004))))

(assert (=> b!1444859 (= res!976794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1444860 () Bool)

(declare-fun res!976800 () Bool)

(assert (=> b!1444860 (=> (not res!976800) (not e!814004))))

(declare-datatypes ((List!33854 0))(
  ( (Nil!33851) (Cons!33850 (h!35200 (_ BitVec 64)) (t!48548 List!33854)) )
))
(declare-fun arrayNoDuplicates!0 (array!98130 (_ BitVec 32) List!33854) Bool)

(assert (=> b!1444860 (= res!976800 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33851))))

(declare-fun b!1444861 () Bool)

(declare-fun res!976801 () Bool)

(assert (=> b!1444861 (=> (not res!976801) (not e!814000))))

(assert (=> b!1444861 (= res!976801 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47353 a!2862) j!93) a!2862 mask!2687) lt!634322))))

(declare-fun b!1444862 () Bool)

(declare-fun res!976799 () Bool)

(assert (=> b!1444862 (=> (not res!976799) (not e!814001))))

(assert (=> b!1444862 (= res!976799 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1444863 () Bool)

(assert (=> b!1444863 (= e!814000 e!814001)))

(declare-fun res!976796 () Bool)

(assert (=> b!1444863 (=> (not res!976796) (not e!814001))))

(assert (=> b!1444863 (= res!976796 (= lt!634324 (Intermediate!11605 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1444863 (= lt!634324 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634326 mask!2687) lt!634326 lt!634325 mask!2687))))

(assert (=> b!1444863 (= lt!634326 (select (store (arr!47353 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!124682 res!976795) b!1444858))

(assert (= (and b!1444858 res!976793) b!1444849))

(assert (= (and b!1444849 res!976802) b!1444847))

(assert (= (and b!1444847 res!976797) b!1444859))

(assert (= (and b!1444859 res!976794) b!1444860))

(assert (= (and b!1444860 res!976800) b!1444852))

(assert (= (and b!1444852 res!976791) b!1444851))

(assert (= (and b!1444851 res!976804) b!1444853))

(assert (= (and b!1444853 res!976803) b!1444861))

(assert (= (and b!1444861 res!976801) b!1444863))

(assert (= (and b!1444863 res!976796) b!1444854))

(assert (= (and b!1444854 c!133539) b!1444856))

(assert (= (and b!1444854 (not c!133539)) b!1444848))

(assert (= (and b!1444854 res!976798) b!1444862))

(assert (= (and b!1444862 res!976799) b!1444857))

(assert (= (and b!1444857 res!976792) b!1444850))

(assert (= (and b!1444850 res!976790) b!1444855))

(declare-fun m!1333847 () Bool)

(assert (=> b!1444857 m!1333847))

(declare-fun m!1333849 () Bool)

(assert (=> b!1444857 m!1333849))

(declare-fun m!1333851 () Bool)

(assert (=> b!1444857 m!1333851))

(declare-fun m!1333853 () Bool)

(assert (=> b!1444857 m!1333853))

(declare-fun m!1333855 () Bool)

(assert (=> b!1444857 m!1333855))

(declare-fun m!1333857 () Bool)

(assert (=> b!1444857 m!1333857))

(assert (=> b!1444847 m!1333857))

(assert (=> b!1444847 m!1333857))

(declare-fun m!1333859 () Bool)

(assert (=> b!1444847 m!1333859))

(assert (=> b!1444861 m!1333857))

(assert (=> b!1444861 m!1333857))

(declare-fun m!1333861 () Bool)

(assert (=> b!1444861 m!1333861))

(declare-fun m!1333863 () Bool)

(assert (=> b!1444860 m!1333863))

(declare-fun m!1333865 () Bool)

(assert (=> b!1444848 m!1333865))

(declare-fun m!1333867 () Bool)

(assert (=> b!1444848 m!1333867))

(declare-fun m!1333869 () Bool)

(assert (=> start!124682 m!1333869))

(declare-fun m!1333871 () Bool)

(assert (=> start!124682 m!1333871))

(declare-fun m!1333873 () Bool)

(assert (=> b!1444856 m!1333873))

(declare-fun m!1333875 () Bool)

(assert (=> b!1444849 m!1333875))

(assert (=> b!1444849 m!1333875))

(declare-fun m!1333877 () Bool)

(assert (=> b!1444849 m!1333877))

(declare-fun m!1333879 () Bool)

(assert (=> b!1444855 m!1333879))

(assert (=> b!1444855 m!1333857))

(declare-fun m!1333881 () Bool)

(assert (=> b!1444859 m!1333881))

(declare-fun m!1333883 () Bool)

(assert (=> b!1444863 m!1333883))

(assert (=> b!1444863 m!1333883))

(declare-fun m!1333885 () Bool)

(assert (=> b!1444863 m!1333885))

(assert (=> b!1444863 m!1333849))

(declare-fun m!1333887 () Bool)

(assert (=> b!1444863 m!1333887))

(assert (=> b!1444850 m!1333857))

(assert (=> b!1444850 m!1333857))

(declare-fun m!1333889 () Bool)

(assert (=> b!1444850 m!1333889))

(assert (=> b!1444851 m!1333849))

(declare-fun m!1333891 () Bool)

(assert (=> b!1444851 m!1333891))

(assert (=> b!1444853 m!1333857))

(assert (=> b!1444853 m!1333857))

(declare-fun m!1333893 () Bool)

(assert (=> b!1444853 m!1333893))

(assert (=> b!1444853 m!1333893))

(assert (=> b!1444853 m!1333857))

(declare-fun m!1333895 () Bool)

(assert (=> b!1444853 m!1333895))

(push 1)

(assert (not b!1444857))

(assert (not b!1444853))

