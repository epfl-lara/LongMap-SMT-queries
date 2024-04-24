; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129332 () Bool)

(assert start!129332)

(declare-fun b!1515111 () Bool)

(declare-fun res!1033841 () Bool)

(declare-fun e!845726 () Bool)

(assert (=> b!1515111 (=> (not res!1033841) (not e!845726))))

(declare-datatypes ((array!101002 0))(
  ( (array!101003 (arr!48733 (Array (_ BitVec 32) (_ BitVec 64))) (size!49284 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101002)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515111 (= res!1033841 (validKeyInArray!0 (select (arr!48733 a!2804) j!70)))))

(declare-fun b!1515112 () Bool)

(declare-fun res!1033840 () Bool)

(declare-fun e!845728 () Bool)

(assert (=> b!1515112 (=> (not res!1033840) (not e!845728))))

(declare-datatypes ((SeekEntryResult!12797 0))(
  ( (MissingZero!12797 (index!53583 (_ BitVec 32))) (Found!12797 (index!53584 (_ BitVec 32))) (Intermediate!12797 (undefined!13609 Bool) (index!53585 (_ BitVec 32)) (x!135504 (_ BitVec 32))) (Undefined!12797) (MissingVacant!12797 (index!53586 (_ BitVec 32))) )
))
(declare-fun lt!656584 () SeekEntryResult!12797)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101002 (_ BitVec 32)) SeekEntryResult!12797)

(assert (=> b!1515112 (= res!1033840 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48733 a!2804) j!70) a!2804 mask!2512) lt!656584))))

(declare-fun b!1515113 () Bool)

(declare-fun e!845729 () Bool)

(assert (=> b!1515113 (= e!845728 e!845729)))

(declare-fun res!1033839 () Bool)

(assert (=> b!1515113 (=> (not res!1033839) (not e!845729))))

(declare-fun lt!656583 () (_ BitVec 64))

(declare-fun lt!656587 () SeekEntryResult!12797)

(declare-fun lt!656585 () array!101002)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515113 (= res!1033839 (= lt!656587 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656583 mask!2512) lt!656583 lt!656585 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1515113 (= lt!656583 (select (store (arr!48733 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1515113 (= lt!656585 (array!101003 (store (arr!48733 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49284 a!2804)))))

(declare-fun b!1515114 () Bool)

(declare-fun res!1033838 () Bool)

(assert (=> b!1515114 (=> (not res!1033838) (not e!845726))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101002 (_ BitVec 32)) Bool)

(assert (=> b!1515114 (= res!1033838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun e!845724 () Bool)

(declare-fun b!1515115 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101002 (_ BitVec 32)) SeekEntryResult!12797)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101002 (_ BitVec 32)) SeekEntryResult!12797)

(assert (=> b!1515115 (= e!845724 (= (seekEntryOrOpen!0 lt!656583 lt!656585 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656583 lt!656585 mask!2512)))))

(declare-fun b!1515116 () Bool)

(declare-fun res!1033842 () Bool)

(assert (=> b!1515116 (=> (not res!1033842) (not e!845726))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1515116 (= res!1033842 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49284 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49284 a!2804))))))

(declare-fun b!1515118 () Bool)

(declare-fun e!845730 () Bool)

(assert (=> b!1515118 (= e!845730 e!845724)))

(declare-fun res!1033846 () Bool)

(assert (=> b!1515118 (=> (not res!1033846) (not e!845724))))

(assert (=> b!1515118 (= res!1033846 (= (seekEntryOrOpen!0 (select (arr!48733 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48733 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1515119 () Bool)

(assert (=> b!1515119 (= e!845729 (not true))))

(declare-fun e!845725 () Bool)

(assert (=> b!1515119 e!845725))

(declare-fun res!1033850 () Bool)

(assert (=> b!1515119 (=> (not res!1033850) (not e!845725))))

(assert (=> b!1515119 (= res!1033850 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50497 0))(
  ( (Unit!50498) )
))
(declare-fun lt!656586 () Unit!50497)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101002 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50497)

(assert (=> b!1515119 (= lt!656586 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515120 () Bool)

(declare-fun res!1033843 () Bool)

(assert (=> b!1515120 (=> (not res!1033843) (not e!845725))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101002 (_ BitVec 32)) SeekEntryResult!12797)

(assert (=> b!1515120 (= res!1033843 (= (seekEntry!0 (select (arr!48733 a!2804) j!70) a!2804 mask!2512) (Found!12797 j!70)))))

(declare-fun b!1515121 () Bool)

(assert (=> b!1515121 (= e!845726 e!845728)))

(declare-fun res!1033848 () Bool)

(assert (=> b!1515121 (=> (not res!1033848) (not e!845728))))

(assert (=> b!1515121 (= res!1033848 (= lt!656587 lt!656584))))

(assert (=> b!1515121 (= lt!656584 (Intermediate!12797 false resIndex!21 resX!21))))

(assert (=> b!1515121 (= lt!656587 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48733 a!2804) j!70) mask!2512) (select (arr!48733 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515122 () Bool)

(declare-fun res!1033849 () Bool)

(assert (=> b!1515122 (=> (not res!1033849) (not e!845726))))

(assert (=> b!1515122 (= res!1033849 (validKeyInArray!0 (select (arr!48733 a!2804) i!961)))))

(declare-fun b!1515123 () Bool)

(declare-fun res!1033837 () Bool)

(assert (=> b!1515123 (=> (not res!1033837) (not e!845726))))

(assert (=> b!1515123 (= res!1033837 (and (= (size!49284 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49284 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49284 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1515124 () Bool)

(assert (=> b!1515124 (= e!845725 e!845730)))

(declare-fun res!1033845 () Bool)

(assert (=> b!1515124 (=> res!1033845 e!845730)))

(assert (=> b!1515124 (= res!1033845 (or (not (= (select (arr!48733 a!2804) j!70) lt!656583)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48733 a!2804) index!487) (select (arr!48733 a!2804) j!70)) (not (= (select (arr!48733 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1033847 () Bool)

(assert (=> start!129332 (=> (not res!1033847) (not e!845726))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129332 (= res!1033847 (validMask!0 mask!2512))))

(assert (=> start!129332 e!845726))

(assert (=> start!129332 true))

(declare-fun array_inv!38014 (array!101002) Bool)

(assert (=> start!129332 (array_inv!38014 a!2804)))

(declare-fun b!1515117 () Bool)

(declare-fun res!1033844 () Bool)

(assert (=> b!1515117 (=> (not res!1033844) (not e!845726))))

(declare-datatypes ((List!35203 0))(
  ( (Nil!35200) (Cons!35199 (h!36626 (_ BitVec 64)) (t!49889 List!35203)) )
))
(declare-fun arrayNoDuplicates!0 (array!101002 (_ BitVec 32) List!35203) Bool)

(assert (=> b!1515117 (= res!1033844 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35200))))

(assert (= (and start!129332 res!1033847) b!1515123))

(assert (= (and b!1515123 res!1033837) b!1515122))

(assert (= (and b!1515122 res!1033849) b!1515111))

(assert (= (and b!1515111 res!1033841) b!1515114))

(assert (= (and b!1515114 res!1033838) b!1515117))

(assert (= (and b!1515117 res!1033844) b!1515116))

(assert (= (and b!1515116 res!1033842) b!1515121))

(assert (= (and b!1515121 res!1033848) b!1515112))

(assert (= (and b!1515112 res!1033840) b!1515113))

(assert (= (and b!1515113 res!1033839) b!1515119))

(assert (= (and b!1515119 res!1033850) b!1515120))

(assert (= (and b!1515120 res!1033843) b!1515124))

(assert (= (and b!1515124 (not res!1033845)) b!1515118))

(assert (= (and b!1515118 res!1033846) b!1515115))

(declare-fun m!1397919 () Bool)

(assert (=> start!129332 m!1397919))

(declare-fun m!1397921 () Bool)

(assert (=> start!129332 m!1397921))

(declare-fun m!1397923 () Bool)

(assert (=> b!1515120 m!1397923))

(assert (=> b!1515120 m!1397923))

(declare-fun m!1397925 () Bool)

(assert (=> b!1515120 m!1397925))

(declare-fun m!1397927 () Bool)

(assert (=> b!1515114 m!1397927))

(assert (=> b!1515118 m!1397923))

(assert (=> b!1515118 m!1397923))

(declare-fun m!1397929 () Bool)

(assert (=> b!1515118 m!1397929))

(assert (=> b!1515118 m!1397923))

(declare-fun m!1397931 () Bool)

(assert (=> b!1515118 m!1397931))

(declare-fun m!1397933 () Bool)

(assert (=> b!1515113 m!1397933))

(assert (=> b!1515113 m!1397933))

(declare-fun m!1397935 () Bool)

(assert (=> b!1515113 m!1397935))

(declare-fun m!1397937 () Bool)

(assert (=> b!1515113 m!1397937))

(declare-fun m!1397939 () Bool)

(assert (=> b!1515113 m!1397939))

(assert (=> b!1515112 m!1397923))

(assert (=> b!1515112 m!1397923))

(declare-fun m!1397941 () Bool)

(assert (=> b!1515112 m!1397941))

(assert (=> b!1515121 m!1397923))

(assert (=> b!1515121 m!1397923))

(declare-fun m!1397943 () Bool)

(assert (=> b!1515121 m!1397943))

(assert (=> b!1515121 m!1397943))

(assert (=> b!1515121 m!1397923))

(declare-fun m!1397945 () Bool)

(assert (=> b!1515121 m!1397945))

(declare-fun m!1397947 () Bool)

(assert (=> b!1515119 m!1397947))

(declare-fun m!1397949 () Bool)

(assert (=> b!1515119 m!1397949))

(declare-fun m!1397951 () Bool)

(assert (=> b!1515122 m!1397951))

(assert (=> b!1515122 m!1397951))

(declare-fun m!1397953 () Bool)

(assert (=> b!1515122 m!1397953))

(assert (=> b!1515124 m!1397923))

(declare-fun m!1397955 () Bool)

(assert (=> b!1515124 m!1397955))

(assert (=> b!1515111 m!1397923))

(assert (=> b!1515111 m!1397923))

(declare-fun m!1397957 () Bool)

(assert (=> b!1515111 m!1397957))

(declare-fun m!1397959 () Bool)

(assert (=> b!1515117 m!1397959))

(declare-fun m!1397961 () Bool)

(assert (=> b!1515115 m!1397961))

(declare-fun m!1397963 () Bool)

(assert (=> b!1515115 m!1397963))

(check-sat (not b!1515119) (not b!1515121) (not b!1515118) (not b!1515115) (not b!1515111) (not b!1515112) (not b!1515117) (not b!1515113) (not b!1515120) (not b!1515114) (not b!1515122) (not start!129332))
(check-sat)
