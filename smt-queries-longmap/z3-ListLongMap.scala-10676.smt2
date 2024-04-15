; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125164 () Bool)

(assert start!125164)

(declare-fun b!1459853 () Bool)

(declare-fun e!820899 () Bool)

(declare-fun e!820897 () Bool)

(assert (=> b!1459853 (= e!820899 e!820897)))

(declare-fun res!989800 () Bool)

(assert (=> b!1459853 (=> (not res!989800) (not e!820897))))

(declare-datatypes ((SeekEntryResult!11861 0))(
  ( (MissingZero!11861 (index!49836 (_ BitVec 32))) (Found!11861 (index!49837 (_ BitVec 32))) (Intermediate!11861 (undefined!12673 Bool) (index!49838 (_ BitVec 32)) (x!131441 (_ BitVec 32))) (Undefined!11861) (MissingVacant!11861 (index!49839 (_ BitVec 32))) )
))
(declare-fun lt!639461 () SeekEntryResult!11861)

(declare-datatypes ((array!98590 0))(
  ( (array!98591 (arr!47584 (Array (_ BitVec 32) (_ BitVec 64))) (size!48136 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98590)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98590 (_ BitVec 32)) SeekEntryResult!11861)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459853 (= res!989800 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47584 a!2862) j!93) mask!2687) (select (arr!47584 a!2862) j!93) a!2862 mask!2687) lt!639461))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1459853 (= lt!639461 (Intermediate!11861 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1459854 () Bool)

(declare-fun res!989811 () Bool)

(declare-fun e!820900 () Bool)

(assert (=> b!1459854 (=> (not res!989811) (not e!820900))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1459854 (= res!989811 (and (= (size!48136 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48136 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48136 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1459855 () Bool)

(declare-fun res!989815 () Bool)

(assert (=> b!1459855 (=> (not res!989815) (not e!820900))))

(declare-datatypes ((List!34163 0))(
  ( (Nil!34160) (Cons!34159 (h!35509 (_ BitVec 64)) (t!48849 List!34163)) )
))
(declare-fun arrayNoDuplicates!0 (array!98590 (_ BitVec 32) List!34163) Bool)

(assert (=> b!1459855 (= res!989815 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34160))))

(declare-fun b!1459856 () Bool)

(declare-fun res!989798 () Bool)

(declare-fun e!820901 () Bool)

(assert (=> b!1459856 (=> (not res!989798) (not e!820901))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1459856 (= res!989798 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!989814 () Bool)

(assert (=> start!125164 (=> (not res!989814) (not e!820900))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125164 (= res!989814 (validMask!0 mask!2687))))

(assert (=> start!125164 e!820900))

(assert (=> start!125164 true))

(declare-fun array_inv!36817 (array!98590) Bool)

(assert (=> start!125164 (array_inv!36817 a!2862)))

(declare-fun b!1459857 () Bool)

(declare-fun e!820898 () Bool)

(declare-fun e!820902 () Bool)

(assert (=> b!1459857 (= e!820898 e!820902)))

(declare-fun res!989799 () Bool)

(assert (=> b!1459857 (=> res!989799 e!820902)))

(assert (=> b!1459857 (= res!989799 (bvslt mask!2687 #b00000000000000000000000000000000))))

(declare-fun lt!639465 () SeekEntryResult!11861)

(declare-fun lt!639457 () SeekEntryResult!11861)

(assert (=> b!1459857 (= lt!639465 lt!639457)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!639463 () (_ BitVec 32))

(declare-datatypes ((Unit!49059 0))(
  ( (Unit!49060) )
))
(declare-fun lt!639458 () Unit!49059)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98590 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49059)

(assert (=> b!1459857 (= lt!639458 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!639463 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun lt!639459 () array!98590)

(declare-fun lt!639464 () (_ BitVec 64))

(declare-fun b!1459858 () Bool)

(declare-fun e!820895 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98590 (_ BitVec 32)) SeekEntryResult!11861)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98590 (_ BitVec 32)) SeekEntryResult!11861)

(assert (=> b!1459858 (= e!820895 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639464 lt!639459 mask!2687) (seekEntryOrOpen!0 lt!639464 lt!639459 mask!2687)))))

(declare-fun lt!639460 () SeekEntryResult!11861)

(declare-fun e!820893 () Bool)

(declare-fun b!1459859 () Bool)

(assert (=> b!1459859 (= e!820893 (not (= lt!639460 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639463 lt!639464 lt!639459 mask!2687))))))

(declare-fun b!1459860 () Bool)

(assert (=> b!1459860 (= e!820895 (= lt!639460 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639464 lt!639459 mask!2687)))))

(declare-fun b!1459861 () Bool)

(declare-fun res!989802 () Bool)

(assert (=> b!1459861 (=> (not res!989802) (not e!820900))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1459861 (= res!989802 (validKeyInArray!0 (select (arr!47584 a!2862) i!1006)))))

(declare-fun b!1459862 () Bool)

(declare-fun res!989812 () Bool)

(assert (=> b!1459862 (=> (not res!989812) (not e!820900))))

(assert (=> b!1459862 (= res!989812 (validKeyInArray!0 (select (arr!47584 a!2862) j!93)))))

(declare-fun b!1459863 () Bool)

(declare-fun e!820896 () Bool)

(assert (=> b!1459863 (= e!820901 (not e!820896))))

(declare-fun res!989810 () Bool)

(assert (=> b!1459863 (=> res!989810 e!820896)))

(assert (=> b!1459863 (= res!989810 (or (and (= (select (arr!47584 a!2862) index!646) (select (store (arr!47584 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47584 a!2862) index!646) (select (arr!47584 a!2862) j!93))) (= (select (arr!47584 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1459863 (and (= lt!639465 (Found!11861 j!93)) (or (= (select (arr!47584 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47584 a!2862) intermediateBeforeIndex!19) (select (arr!47584 a!2862) j!93))) (let ((bdg!53561 (select (store (arr!47584 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47584 a!2862) index!646) bdg!53561) (= (select (arr!47584 a!2862) index!646) (select (arr!47584 a!2862) j!93))) (= (select (arr!47584 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53561 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1459863 (= lt!639465 (seekEntryOrOpen!0 (select (arr!47584 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98590 (_ BitVec 32)) Bool)

(assert (=> b!1459863 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!639462 () Unit!49059)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98590 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49059)

(assert (=> b!1459863 (= lt!639462 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1459864 () Bool)

(assert (=> b!1459864 (= e!820897 e!820901)))

(declare-fun res!989808 () Bool)

(assert (=> b!1459864 (=> (not res!989808) (not e!820901))))

(assert (=> b!1459864 (= res!989808 (= lt!639460 (Intermediate!11861 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1459864 (= lt!639460 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639464 mask!2687) lt!639464 lt!639459 mask!2687))))

(assert (=> b!1459864 (= lt!639464 (select (store (arr!47584 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1459865 () Bool)

(declare-fun res!989809 () Bool)

(assert (=> b!1459865 (=> (not res!989809) (not e!820901))))

(assert (=> b!1459865 (= res!989809 e!820895)))

(declare-fun c!134541 () Bool)

(assert (=> b!1459865 (= c!134541 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1459866 () Bool)

(declare-fun res!989797 () Bool)

(assert (=> b!1459866 (=> (not res!989797) (not e!820900))))

(assert (=> b!1459866 (= res!989797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1459867 () Bool)

(declare-fun res!989803 () Bool)

(assert (=> b!1459867 (=> res!989803 e!820898)))

(assert (=> b!1459867 (= res!989803 e!820893)))

(declare-fun c!134542 () Bool)

(assert (=> b!1459867 (= c!134542 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1459868 () Bool)

(declare-fun res!989805 () Bool)

(assert (=> b!1459868 (=> res!989805 e!820898)))

(assert (=> b!1459868 (= res!989805 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1459869 () Bool)

(assert (=> b!1459869 (= e!820893 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639463 intermediateAfterIndex!19 lt!639464 lt!639459 mask!2687) lt!639457)))))

(declare-fun b!1459870 () Bool)

(declare-fun res!989807 () Bool)

(assert (=> b!1459870 (=> res!989807 e!820898)))

(assert (=> b!1459870 (= res!989807 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639463 (select (arr!47584 a!2862) j!93) a!2862 mask!2687) lt!639461)))))

(declare-fun b!1459871 () Bool)

(declare-fun res!989801 () Bool)

(assert (=> b!1459871 (=> (not res!989801) (not e!820900))))

(assert (=> b!1459871 (= res!989801 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48136 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48136 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48136 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1459872 () Bool)

(assert (=> b!1459872 (= e!820902 (validKeyInArray!0 lt!639464))))

(declare-fun b!1459873 () Bool)

(declare-fun res!989804 () Bool)

(assert (=> b!1459873 (=> (not res!989804) (not e!820897))))

(assert (=> b!1459873 (= res!989804 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47584 a!2862) j!93) a!2862 mask!2687) lt!639461))))

(declare-fun b!1459874 () Bool)

(assert (=> b!1459874 (= e!820900 e!820899)))

(declare-fun res!989806 () Bool)

(assert (=> b!1459874 (=> (not res!989806) (not e!820899))))

(assert (=> b!1459874 (= res!989806 (= (select (store (arr!47584 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1459874 (= lt!639459 (array!98591 (store (arr!47584 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48136 a!2862)))))

(declare-fun b!1459875 () Bool)

(assert (=> b!1459875 (= e!820896 e!820898)))

(declare-fun res!989813 () Bool)

(assert (=> b!1459875 (=> res!989813 e!820898)))

(assert (=> b!1459875 (= res!989813 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639463 #b00000000000000000000000000000000) (bvsge lt!639463 (size!48136 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459875 (= lt!639463 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1459875 (= lt!639457 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639464 lt!639459 mask!2687))))

(assert (=> b!1459875 (= lt!639457 (seekEntryOrOpen!0 lt!639464 lt!639459 mask!2687))))

(assert (= (and start!125164 res!989814) b!1459854))

(assert (= (and b!1459854 res!989811) b!1459861))

(assert (= (and b!1459861 res!989802) b!1459862))

(assert (= (and b!1459862 res!989812) b!1459866))

(assert (= (and b!1459866 res!989797) b!1459855))

(assert (= (and b!1459855 res!989815) b!1459871))

(assert (= (and b!1459871 res!989801) b!1459874))

(assert (= (and b!1459874 res!989806) b!1459853))

(assert (= (and b!1459853 res!989800) b!1459873))

(assert (= (and b!1459873 res!989804) b!1459864))

(assert (= (and b!1459864 res!989808) b!1459865))

(assert (= (and b!1459865 c!134541) b!1459860))

(assert (= (and b!1459865 (not c!134541)) b!1459858))

(assert (= (and b!1459865 res!989809) b!1459856))

(assert (= (and b!1459856 res!989798) b!1459863))

(assert (= (and b!1459863 (not res!989810)) b!1459875))

(assert (= (and b!1459875 (not res!989813)) b!1459870))

(assert (= (and b!1459870 (not res!989807)) b!1459867))

(assert (= (and b!1459867 c!134542) b!1459859))

(assert (= (and b!1459867 (not c!134542)) b!1459869))

(assert (= (and b!1459867 (not res!989803)) b!1459868))

(assert (= (and b!1459868 (not res!989805)) b!1459857))

(assert (= (and b!1459857 (not res!989799)) b!1459872))

(declare-fun m!1347075 () Bool)

(assert (=> b!1459861 m!1347075))

(assert (=> b!1459861 m!1347075))

(declare-fun m!1347077 () Bool)

(assert (=> b!1459861 m!1347077))

(declare-fun m!1347079 () Bool)

(assert (=> b!1459874 m!1347079))

(declare-fun m!1347081 () Bool)

(assert (=> b!1459874 m!1347081))

(declare-fun m!1347083 () Bool)

(assert (=> start!125164 m!1347083))

(declare-fun m!1347085 () Bool)

(assert (=> start!125164 m!1347085))

(declare-fun m!1347087 () Bool)

(assert (=> b!1459869 m!1347087))

(declare-fun m!1347089 () Bool)

(assert (=> b!1459864 m!1347089))

(assert (=> b!1459864 m!1347089))

(declare-fun m!1347091 () Bool)

(assert (=> b!1459864 m!1347091))

(assert (=> b!1459864 m!1347079))

(declare-fun m!1347093 () Bool)

(assert (=> b!1459864 m!1347093))

(declare-fun m!1347095 () Bool)

(assert (=> b!1459859 m!1347095))

(declare-fun m!1347097 () Bool)

(assert (=> b!1459875 m!1347097))

(declare-fun m!1347099 () Bool)

(assert (=> b!1459875 m!1347099))

(declare-fun m!1347101 () Bool)

(assert (=> b!1459875 m!1347101))

(declare-fun m!1347103 () Bool)

(assert (=> b!1459862 m!1347103))

(assert (=> b!1459862 m!1347103))

(declare-fun m!1347105 () Bool)

(assert (=> b!1459862 m!1347105))

(assert (=> b!1459873 m!1347103))

(assert (=> b!1459873 m!1347103))

(declare-fun m!1347107 () Bool)

(assert (=> b!1459873 m!1347107))

(declare-fun m!1347109 () Bool)

(assert (=> b!1459872 m!1347109))

(declare-fun m!1347111 () Bool)

(assert (=> b!1459855 m!1347111))

(assert (=> b!1459870 m!1347103))

(assert (=> b!1459870 m!1347103))

(declare-fun m!1347113 () Bool)

(assert (=> b!1459870 m!1347113))

(assert (=> b!1459853 m!1347103))

(assert (=> b!1459853 m!1347103))

(declare-fun m!1347115 () Bool)

(assert (=> b!1459853 m!1347115))

(assert (=> b!1459853 m!1347115))

(assert (=> b!1459853 m!1347103))

(declare-fun m!1347117 () Bool)

(assert (=> b!1459853 m!1347117))

(declare-fun m!1347119 () Bool)

(assert (=> b!1459866 m!1347119))

(assert (=> b!1459858 m!1347099))

(assert (=> b!1459858 m!1347101))

(declare-fun m!1347121 () Bool)

(assert (=> b!1459860 m!1347121))

(declare-fun m!1347123 () Bool)

(assert (=> b!1459857 m!1347123))

(declare-fun m!1347125 () Bool)

(assert (=> b!1459863 m!1347125))

(assert (=> b!1459863 m!1347079))

(declare-fun m!1347127 () Bool)

(assert (=> b!1459863 m!1347127))

(declare-fun m!1347129 () Bool)

(assert (=> b!1459863 m!1347129))

(declare-fun m!1347131 () Bool)

(assert (=> b!1459863 m!1347131))

(assert (=> b!1459863 m!1347103))

(declare-fun m!1347133 () Bool)

(assert (=> b!1459863 m!1347133))

(declare-fun m!1347135 () Bool)

(assert (=> b!1459863 m!1347135))

(assert (=> b!1459863 m!1347103))

(check-sat (not b!1459873) (not b!1459862) (not b!1459857) (not b!1459866) (not b!1459863) (not b!1459875) (not b!1459860) (not b!1459858) (not start!125164) (not b!1459859) (not b!1459872) (not b!1459869) (not b!1459870) (not b!1459855) (not b!1459853) (not b!1459861) (not b!1459864))
(check-sat)
