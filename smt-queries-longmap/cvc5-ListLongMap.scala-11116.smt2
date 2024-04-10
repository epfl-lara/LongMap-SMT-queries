; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129800 () Bool)

(assert start!129800)

(declare-fun b!1523679 () Bool)

(declare-fun res!1042586 () Bool)

(declare-fun e!849430 () Bool)

(assert (=> b!1523679 (=> (not res!1042586) (not e!849430))))

(declare-datatypes ((array!101396 0))(
  ( (array!101397 (arr!48929 (Array (_ BitVec 32) (_ BitVec 64))) (size!49479 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101396)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523679 (= res!1042586 (validKeyInArray!0 (select (arr!48929 a!2804) j!70)))))

(declare-fun b!1523680 () Bool)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun e!849432 () Bool)

(declare-datatypes ((SeekEntryResult!13094 0))(
  ( (MissingZero!13094 (index!54771 (_ BitVec 32))) (Found!13094 (index!54772 (_ BitVec 32))) (Intermediate!13094 (undefined!13906 Bool) (index!54773 (_ BitVec 32)) (x!136460 (_ BitVec 32))) (Undefined!13094) (MissingVacant!13094 (index!54774 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101396 (_ BitVec 32)) SeekEntryResult!13094)

(assert (=> b!1523680 (= e!849432 (= (seekEntry!0 (select (arr!48929 a!2804) j!70) a!2804 mask!2512) (Found!13094 j!70)))))

(declare-fun b!1523681 () Bool)

(declare-fun e!849431 () Bool)

(declare-fun e!849428 () Bool)

(assert (=> b!1523681 (= e!849431 e!849428)))

(declare-fun res!1042589 () Bool)

(assert (=> b!1523681 (=> (not res!1042589) (not e!849428))))

(declare-fun lt!660022 () (_ BitVec 64))

(declare-fun lt!660023 () SeekEntryResult!13094)

(declare-fun lt!660025 () array!101396)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101396 (_ BitVec 32)) SeekEntryResult!13094)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523681 (= res!1042589 (= lt!660023 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660022 mask!2512) lt!660022 lt!660025 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1523681 (= lt!660022 (select (store (arr!48929 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1523681 (= lt!660025 (array!101397 (store (arr!48929 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49479 a!2804)))))

(declare-fun e!849429 () Bool)

(declare-fun b!1523682 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101396 (_ BitVec 32)) SeekEntryResult!13094)

(assert (=> b!1523682 (= e!849429 (= (seekEntryOrOpen!0 (select (arr!48929 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!660022 lt!660025 mask!2512)))))

(declare-fun b!1523683 () Bool)

(declare-fun res!1042596 () Bool)

(assert (=> b!1523683 (=> (not res!1042596) (not e!849430))))

(declare-datatypes ((List!35412 0))(
  ( (Nil!35409) (Cons!35408 (h!36832 (_ BitVec 64)) (t!50106 List!35412)) )
))
(declare-fun arrayNoDuplicates!0 (array!101396 (_ BitVec 32) List!35412) Bool)

(assert (=> b!1523683 (= res!1042596 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35409))))

(declare-fun b!1523684 () Bool)

(declare-fun res!1042587 () Bool)

(assert (=> b!1523684 (=> (not res!1042587) (not e!849431))))

(declare-fun lt!660021 () SeekEntryResult!13094)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1523684 (= res!1042587 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48929 a!2804) j!70) a!2804 mask!2512) lt!660021))))

(declare-fun b!1523685 () Bool)

(declare-fun res!1042588 () Bool)

(assert (=> b!1523685 (=> (not res!1042588) (not e!849430))))

(assert (=> b!1523685 (= res!1042588 (and (= (size!49479 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49479 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49479 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1523686 () Bool)

(assert (=> b!1523686 (= e!849428 (not e!849429))))

(declare-fun res!1042591 () Bool)

(assert (=> b!1523686 (=> res!1042591 e!849429)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1523686 (= res!1042591 (or (not (= (select (arr!48929 a!2804) j!70) lt!660022)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (not (= (select (arr!48929 a!2804) index!487) (select (arr!48929 a!2804) j!70))) (not (= j!70 index!487))))))

(assert (=> b!1523686 e!849432))

(declare-fun res!1042597 () Bool)

(assert (=> b!1523686 (=> (not res!1042597) (not e!849432))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101396 (_ BitVec 32)) Bool)

(assert (=> b!1523686 (= res!1042597 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50972 0))(
  ( (Unit!50973) )
))
(declare-fun lt!660024 () Unit!50972)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101396 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50972)

(assert (=> b!1523686 (= lt!660024 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1042593 () Bool)

(assert (=> start!129800 (=> (not res!1042593) (not e!849430))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129800 (= res!1042593 (validMask!0 mask!2512))))

(assert (=> start!129800 e!849430))

(assert (=> start!129800 true))

(declare-fun array_inv!37957 (array!101396) Bool)

(assert (=> start!129800 (array_inv!37957 a!2804)))

(declare-fun b!1523687 () Bool)

(declare-fun res!1042595 () Bool)

(assert (=> b!1523687 (=> (not res!1042595) (not e!849430))))

(assert (=> b!1523687 (= res!1042595 (validKeyInArray!0 (select (arr!48929 a!2804) i!961)))))

(declare-fun b!1523688 () Bool)

(declare-fun res!1042594 () Bool)

(assert (=> b!1523688 (=> (not res!1042594) (not e!849430))))

(assert (=> b!1523688 (= res!1042594 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49479 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49479 a!2804))))))

(declare-fun b!1523689 () Bool)

(declare-fun res!1042590 () Bool)

(assert (=> b!1523689 (=> (not res!1042590) (not e!849430))))

(assert (=> b!1523689 (= res!1042590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1523690 () Bool)

(assert (=> b!1523690 (= e!849430 e!849431)))

(declare-fun res!1042592 () Bool)

(assert (=> b!1523690 (=> (not res!1042592) (not e!849431))))

(assert (=> b!1523690 (= res!1042592 (= lt!660023 lt!660021))))

(assert (=> b!1523690 (= lt!660021 (Intermediate!13094 false resIndex!21 resX!21))))

(assert (=> b!1523690 (= lt!660023 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48929 a!2804) j!70) mask!2512) (select (arr!48929 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129800 res!1042593) b!1523685))

(assert (= (and b!1523685 res!1042588) b!1523687))

(assert (= (and b!1523687 res!1042595) b!1523679))

(assert (= (and b!1523679 res!1042586) b!1523689))

(assert (= (and b!1523689 res!1042590) b!1523683))

(assert (= (and b!1523683 res!1042596) b!1523688))

(assert (= (and b!1523688 res!1042594) b!1523690))

(assert (= (and b!1523690 res!1042592) b!1523684))

(assert (= (and b!1523684 res!1042587) b!1523681))

(assert (= (and b!1523681 res!1042589) b!1523686))

(assert (= (and b!1523686 res!1042597) b!1523680))

(assert (= (and b!1523686 (not res!1042591)) b!1523682))

(declare-fun m!1406817 () Bool)

(assert (=> b!1523683 m!1406817))

(declare-fun m!1406819 () Bool)

(assert (=> b!1523681 m!1406819))

(assert (=> b!1523681 m!1406819))

(declare-fun m!1406821 () Bool)

(assert (=> b!1523681 m!1406821))

(declare-fun m!1406823 () Bool)

(assert (=> b!1523681 m!1406823))

(declare-fun m!1406825 () Bool)

(assert (=> b!1523681 m!1406825))

(declare-fun m!1406827 () Bool)

(assert (=> b!1523679 m!1406827))

(assert (=> b!1523679 m!1406827))

(declare-fun m!1406829 () Bool)

(assert (=> b!1523679 m!1406829))

(assert (=> b!1523684 m!1406827))

(assert (=> b!1523684 m!1406827))

(declare-fun m!1406831 () Bool)

(assert (=> b!1523684 m!1406831))

(assert (=> b!1523682 m!1406827))

(assert (=> b!1523682 m!1406827))

(declare-fun m!1406833 () Bool)

(assert (=> b!1523682 m!1406833))

(declare-fun m!1406835 () Bool)

(assert (=> b!1523682 m!1406835))

(assert (=> b!1523690 m!1406827))

(assert (=> b!1523690 m!1406827))

(declare-fun m!1406837 () Bool)

(assert (=> b!1523690 m!1406837))

(assert (=> b!1523690 m!1406837))

(assert (=> b!1523690 m!1406827))

(declare-fun m!1406839 () Bool)

(assert (=> b!1523690 m!1406839))

(declare-fun m!1406841 () Bool)

(assert (=> b!1523689 m!1406841))

(assert (=> b!1523686 m!1406827))

(declare-fun m!1406843 () Bool)

(assert (=> b!1523686 m!1406843))

(declare-fun m!1406845 () Bool)

(assert (=> b!1523686 m!1406845))

(declare-fun m!1406847 () Bool)

(assert (=> b!1523686 m!1406847))

(declare-fun m!1406849 () Bool)

(assert (=> b!1523687 m!1406849))

(assert (=> b!1523687 m!1406849))

(declare-fun m!1406851 () Bool)

(assert (=> b!1523687 m!1406851))

(declare-fun m!1406853 () Bool)

(assert (=> start!129800 m!1406853))

(declare-fun m!1406855 () Bool)

(assert (=> start!129800 m!1406855))

(assert (=> b!1523680 m!1406827))

(assert (=> b!1523680 m!1406827))

(declare-fun m!1406857 () Bool)

(assert (=> b!1523680 m!1406857))

(push 1)

(assert (not b!1523690))

(assert (not b!1523687))

(assert (not b!1523681))

(assert (not b!1523679))

(assert (not b!1523682))

(assert (not b!1523683))

(assert (not b!1523686))

(assert (not start!129800))

(assert (not b!1523680))

(assert (not b!1523689))

(assert (not b!1523684))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!68406 () Bool)

(declare-fun call!68409 () Bool)

(declare-fun c!140105 () Bool)

(assert (=> bm!68406 (= call!68409 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!140105 (Cons!35408 (select (arr!48929 a!2804) #b00000000000000000000000000000000) Nil!35409) Nil!35409)))))

(declare-fun b!1523791 () Bool)

(declare-fun e!849488 () Bool)

(declare-fun e!849487 () Bool)

(assert (=> b!1523791 (= e!849488 e!849487)))

(declare-fun res!1042676 () Bool)

(assert (=> b!1523791 (=> (not res!1042676) (not e!849487))))

(declare-fun e!849489 () Bool)

(assert (=> b!1523791 (= res!1042676 (not e!849489))))

(declare-fun res!1042678 () Bool)

(assert (=> b!1523791 (=> (not res!1042678) (not e!849489))))

(assert (=> b!1523791 (= res!1042678 (validKeyInArray!0 (select (arr!48929 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1523792 () Bool)

(declare-fun e!849490 () Bool)

(assert (=> b!1523792 (= e!849487 e!849490)))

(assert (=> b!1523792 (= c!140105 (validKeyInArray!0 (select (arr!48929 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1523793 () Bool)

(assert (=> b!1523793 (= e!849490 call!68409)))

(declare-fun b!1523795 () Bool)

(assert (=> b!1523795 (= e!849490 call!68409)))

(declare-fun b!1523794 () Bool)

(declare-fun contains!9988 (List!35412 (_ BitVec 64)) Bool)

(assert (=> b!1523794 (= e!849489 (contains!9988 Nil!35409 (select (arr!48929 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!159251 () Bool)

(declare-fun res!1042677 () Bool)

(assert (=> d!159251 (=> res!1042677 e!849488)))

(assert (=> d!159251 (= res!1042677 (bvsge #b00000000000000000000000000000000 (size!49479 a!2804)))))

(assert (=> d!159251 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35409) e!849488)))

(assert (= (and d!159251 (not res!1042677)) b!1523791))

(assert (= (and b!1523791 res!1042678) b!1523794))

(assert (= (and b!1523791 res!1042676) b!1523792))

(assert (= (and b!1523792 c!140105) b!1523793))

(assert (= (and b!1523792 (not c!140105)) b!1523795))

(assert (= (or b!1523793 b!1523795) bm!68406))

(declare-fun m!1406949 () Bool)

(assert (=> bm!68406 m!1406949))

(declare-fun m!1406951 () Bool)

(assert (=> bm!68406 m!1406951))

(assert (=> b!1523791 m!1406949))

(assert (=> b!1523791 m!1406949))

(declare-fun m!1406953 () Bool)

(assert (=> b!1523791 m!1406953))

(assert (=> b!1523792 m!1406949))

(assert (=> b!1523792 m!1406949))

(assert (=> b!1523792 m!1406953))

(assert (=> b!1523794 m!1406949))

(assert (=> b!1523794 m!1406949))

(declare-fun m!1406955 () Bool)

(assert (=> b!1523794 m!1406955))

(assert (=> b!1523683 d!159251))

(declare-fun b!1523826 () Bool)

(declare-fun lt!660079 () SeekEntryResult!13094)

(assert (=> b!1523826 (and (bvsge (index!54773 lt!660079) #b00000000000000000000000000000000) (bvslt (index!54773 lt!660079) (size!49479 a!2804)))))

(declare-fun e!849511 () Bool)

(assert (=> b!1523826 (= e!849511 (= (select (arr!48929 a!2804) (index!54773 lt!660079)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1523827 () Bool)

(assert (=> b!1523827 (and (bvsge (index!54773 lt!660079) #b00000000000000000000000000000000) (bvslt (index!54773 lt!660079) (size!49479 a!2804)))))

(declare-fun res!1042686 () Bool)

(assert (=> b!1523827 (= res!1042686 (= (select (arr!48929 a!2804) (index!54773 lt!660079)) (select (arr!48929 a!2804) j!70)))))

(assert (=> b!1523827 (=> res!1042686 e!849511)))

(declare-fun e!849509 () Bool)

(assert (=> b!1523827 (= e!849509 e!849511)))

(declare-fun d!159255 () Bool)

(declare-fun e!849508 () Bool)

(assert (=> d!159255 e!849508))

(declare-fun c!140120 () Bool)

(assert (=> d!159255 (= c!140120 (and (is-Intermediate!13094 lt!660079) (undefined!13906 lt!660079)))))

(declare-fun e!849507 () SeekEntryResult!13094)

(assert (=> d!159255 (= lt!660079 e!849507)))

(declare-fun c!140118 () Bool)

(assert (=> d!159255 (= c!140118 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!660078 () (_ BitVec 64))

(assert (=> d!159255 (= lt!660078 (select (arr!48929 a!2804) index!487))))

(assert (=> d!159255 (validMask!0 mask!2512)))

(assert (=> d!159255 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48929 a!2804) j!70) a!2804 mask!2512) lt!660079)))

(declare-fun e!849510 () SeekEntryResult!13094)

(declare-fun b!1523828 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523828 (= e!849510 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48929 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523829 () Bool)

(assert (=> b!1523829 (and (bvsge (index!54773 lt!660079) #b00000000000000000000000000000000) (bvslt (index!54773 lt!660079) (size!49479 a!2804)))))

(declare-fun res!1042685 () Bool)

(assert (=> b!1523829 (= res!1042685 (= (select (arr!48929 a!2804) (index!54773 lt!660079)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1523829 (=> res!1042685 e!849511)))

(declare-fun b!1523830 () Bool)

(assert (=> b!1523830 (= e!849507 e!849510)))

(declare-fun c!140119 () Bool)

(assert (=> b!1523830 (= c!140119 (or (= lt!660078 (select (arr!48929 a!2804) j!70)) (= (bvadd lt!660078 lt!660078) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1523831 () Bool)

(assert (=> b!1523831 (= e!849508 (bvsge (x!136460 lt!660079) #b01111111111111111111111111111110))))

(declare-fun b!1523832 () Bool)

(assert (=> b!1523832 (= e!849510 (Intermediate!13094 false index!487 x!534))))

(declare-fun b!1523833 () Bool)

(assert (=> b!1523833 (= e!849507 (Intermediate!13094 true index!487 x!534))))

(declare-fun b!1523834 () Bool)

(assert (=> b!1523834 (= e!849508 e!849509)))

(declare-fun res!1042687 () Bool)

(assert (=> b!1523834 (= res!1042687 (and (is-Intermediate!13094 lt!660079) (not (undefined!13906 lt!660079)) (bvslt (x!136460 lt!660079) #b01111111111111111111111111111110) (bvsge (x!136460 lt!660079) #b00000000000000000000000000000000) (bvsge (x!136460 lt!660079) x!534)))))

(assert (=> b!1523834 (=> (not res!1042687) (not e!849509))))

(assert (= (and d!159255 c!140118) b!1523833))

(assert (= (and d!159255 (not c!140118)) b!1523830))

(assert (= (and b!1523830 c!140119) b!1523832))

(assert (= (and b!1523830 (not c!140119)) b!1523828))

(assert (= (and d!159255 c!140120) b!1523831))

(assert (= (and d!159255 (not c!140120)) b!1523834))

(assert (= (and b!1523834 res!1042687) b!1523827))

(assert (= (and b!1523827 (not res!1042686)) b!1523829))

(assert (= (and b!1523829 (not res!1042685)) b!1523826))

(declare-fun m!1406957 () Bool)

(assert (=> b!1523827 m!1406957))

(assert (=> b!1523826 m!1406957))

(assert (=> b!1523829 m!1406957))

(declare-fun m!1406959 () Bool)

(assert (=> b!1523828 m!1406959))

(assert (=> b!1523828 m!1406959))

(assert (=> b!1523828 m!1406827))

(declare-fun m!1406961 () Bool)

(assert (=> b!1523828 m!1406961))

(assert (=> d!159255 m!1406843))

(assert (=> d!159255 m!1406853))

(assert (=> b!1523684 d!159255))

(declare-fun b!1523920 () Bool)

(declare-fun e!849566 () SeekEntryResult!13094)

(declare-fun e!849567 () SeekEntryResult!13094)

(assert (=> b!1523920 (= e!849566 e!849567)))

(declare-fun lt!660127 () (_ BitVec 64))

(declare-fun lt!660125 () SeekEntryResult!13094)

(assert (=> b!1523920 (= lt!660127 (select (arr!48929 a!2804) (index!54773 lt!660125)))))

(declare-fun c!140154 () Bool)

(assert (=> b!1523920 (= c!140154 (= lt!660127 (select (arr!48929 a!2804) j!70)))))

(declare-fun b!1523921 () Bool)

(declare-fun e!849568 () SeekEntryResult!13094)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101396 (_ BitVec 32)) SeekEntryResult!13094)

(assert (=> b!1523921 (= e!849568 (seekKeyOrZeroReturnVacant!0 (x!136460 lt!660125) (index!54773 lt!660125) (index!54773 lt!660125) (select (arr!48929 a!2804) j!70) a!2804 mask!2512))))

(declare-fun d!159263 () Bool)

(declare-fun lt!660126 () SeekEntryResult!13094)

(assert (=> d!159263 (and (or (is-Undefined!13094 lt!660126) (not (is-Found!13094 lt!660126)) (and (bvsge (index!54772 lt!660126) #b00000000000000000000000000000000) (bvslt (index!54772 lt!660126) (size!49479 a!2804)))) (or (is-Undefined!13094 lt!660126) (is-Found!13094 lt!660126) (not (is-MissingZero!13094 lt!660126)) (and (bvsge (index!54771 lt!660126) #b00000000000000000000000000000000) (bvslt (index!54771 lt!660126) (size!49479 a!2804)))) (or (is-Undefined!13094 lt!660126) (is-Found!13094 lt!660126) (is-MissingZero!13094 lt!660126) (not (is-MissingVacant!13094 lt!660126)) (and (bvsge (index!54774 lt!660126) #b00000000000000000000000000000000) (bvslt (index!54774 lt!660126) (size!49479 a!2804)))) (or (is-Undefined!13094 lt!660126) (ite (is-Found!13094 lt!660126) (= (select (arr!48929 a!2804) (index!54772 lt!660126)) (select (arr!48929 a!2804) j!70)) (ite (is-MissingZero!13094 lt!660126) (= (select (arr!48929 a!2804) (index!54771 lt!660126)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!13094 lt!660126) (= (select (arr!48929 a!2804) (index!54774 lt!660126)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!159263 (= lt!660126 e!849566)))

(declare-fun c!140152 () Bool)

(assert (=> d!159263 (= c!140152 (and (is-Intermediate!13094 lt!660125) (undefined!13906 lt!660125)))))

(assert (=> d!159263 (= lt!660125 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48929 a!2804) j!70) mask!2512) (select (arr!48929 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159263 (validMask!0 mask!2512)))

(assert (=> d!159263 (= (seekEntryOrOpen!0 (select (arr!48929 a!2804) j!70) a!2804 mask!2512) lt!660126)))

(declare-fun b!1523922 () Bool)

(declare-fun c!140153 () Bool)

(assert (=> b!1523922 (= c!140153 (= lt!660127 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1523922 (= e!849567 e!849568)))

(declare-fun b!1523923 () Bool)

(assert (=> b!1523923 (= e!849567 (Found!13094 (index!54773 lt!660125)))))

(declare-fun b!1523924 () Bool)

(assert (=> b!1523924 (= e!849568 (MissingZero!13094 (index!54773 lt!660125)))))

(declare-fun b!1523925 () Bool)

(assert (=> b!1523925 (= e!849566 Undefined!13094)))

(assert (= (and d!159263 c!140152) b!1523925))

(assert (= (and d!159263 (not c!140152)) b!1523920))

(assert (= (and b!1523920 c!140154) b!1523923))

(assert (= (and b!1523920 (not c!140154)) b!1523922))

(assert (= (and b!1523922 c!140153) b!1523924))

(assert (= (and b!1523922 (not c!140153)) b!1523921))

(declare-fun m!1407023 () Bool)

(assert (=> b!1523920 m!1407023))

(assert (=> b!1523921 m!1406827))

(declare-fun m!1407025 () Bool)

(assert (=> b!1523921 m!1407025))

(declare-fun m!1407027 () Bool)

(assert (=> d!159263 m!1407027))

(declare-fun m!1407029 () Bool)

(assert (=> d!159263 m!1407029))

(declare-fun m!1407031 () Bool)

(assert (=> d!159263 m!1407031))

(assert (=> d!159263 m!1406837))

(assert (=> d!159263 m!1406827))

(assert (=> d!159263 m!1406839))

(assert (=> d!159263 m!1406853))

(assert (=> d!159263 m!1406827))

(assert (=> d!159263 m!1406837))

(assert (=> b!1523682 d!159263))

(declare-fun b!1523926 () Bool)

(declare-fun e!849569 () SeekEntryResult!13094)

(declare-fun e!849570 () SeekEntryResult!13094)

(assert (=> b!1523926 (= e!849569 e!849570)))

(declare-fun lt!660132 () (_ BitVec 64))

(declare-fun lt!660130 () SeekEntryResult!13094)

(assert (=> b!1523926 (= lt!660132 (select (arr!48929 lt!660025) (index!54773 lt!660130)))))

(declare-fun c!140157 () Bool)

(assert (=> b!1523926 (= c!140157 (= lt!660132 lt!660022))))

(declare-fun e!849571 () SeekEntryResult!13094)

(declare-fun b!1523927 () Bool)

(assert (=> b!1523927 (= e!849571 (seekKeyOrZeroReturnVacant!0 (x!136460 lt!660130) (index!54773 lt!660130) (index!54773 lt!660130) lt!660022 lt!660025 mask!2512))))

(declare-fun d!159279 () Bool)

(declare-fun lt!660131 () SeekEntryResult!13094)

(assert (=> d!159279 (and (or (is-Undefined!13094 lt!660131) (not (is-Found!13094 lt!660131)) (and (bvsge (index!54772 lt!660131) #b00000000000000000000000000000000) (bvslt (index!54772 lt!660131) (size!49479 lt!660025)))) (or (is-Undefined!13094 lt!660131) (is-Found!13094 lt!660131) (not (is-MissingZero!13094 lt!660131)) (and (bvsge (index!54771 lt!660131) #b00000000000000000000000000000000) (bvslt (index!54771 lt!660131) (size!49479 lt!660025)))) (or (is-Undefined!13094 lt!660131) (is-Found!13094 lt!660131) (is-MissingZero!13094 lt!660131) (not (is-MissingVacant!13094 lt!660131)) (and (bvsge (index!54774 lt!660131) #b00000000000000000000000000000000) (bvslt (index!54774 lt!660131) (size!49479 lt!660025)))) (or (is-Undefined!13094 lt!660131) (ite (is-Found!13094 lt!660131) (= (select (arr!48929 lt!660025) (index!54772 lt!660131)) lt!660022) (ite (is-MissingZero!13094 lt!660131) (= (select (arr!48929 lt!660025) (index!54771 lt!660131)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!13094 lt!660131) (= (select (arr!48929 lt!660025) (index!54774 lt!660131)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!159279 (= lt!660131 e!849569)))

(declare-fun c!140155 () Bool)

(assert (=> d!159279 (= c!140155 (and (is-Intermediate!13094 lt!660130) (undefined!13906 lt!660130)))))

(assert (=> d!159279 (= lt!660130 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660022 mask!2512) lt!660022 lt!660025 mask!2512))))

(assert (=> d!159279 (validMask!0 mask!2512)))

(assert (=> d!159279 (= (seekEntryOrOpen!0 lt!660022 lt!660025 mask!2512) lt!660131)))

(declare-fun b!1523928 () Bool)

(declare-fun c!140156 () Bool)

(assert (=> b!1523928 (= c!140156 (= lt!660132 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1523928 (= e!849570 e!849571)))

(declare-fun b!1523929 () Bool)

(assert (=> b!1523929 (= e!849570 (Found!13094 (index!54773 lt!660130)))))

(declare-fun b!1523930 () Bool)

(assert (=> b!1523930 (= e!849571 (MissingZero!13094 (index!54773 lt!660130)))))

(declare-fun b!1523931 () Bool)

(assert (=> b!1523931 (= e!849569 Undefined!13094)))

(assert (= (and d!159279 c!140155) b!1523931))

(assert (= (and d!159279 (not c!140155)) b!1523926))

(assert (= (and b!1523926 c!140157) b!1523929))

(assert (= (and b!1523926 (not c!140157)) b!1523928))

(assert (= (and b!1523928 c!140156) b!1523930))

(assert (= (and b!1523928 (not c!140156)) b!1523927))

(declare-fun m!1407035 () Bool)

(assert (=> b!1523926 m!1407035))

(declare-fun m!1407037 () Bool)

(assert (=> b!1523927 m!1407037))

(declare-fun m!1407039 () Bool)

(assert (=> d!159279 m!1407039))

(declare-fun m!1407041 () Bool)

(assert (=> d!159279 m!1407041))

(declare-fun m!1407043 () Bool)

(assert (=> d!159279 m!1407043))

(assert (=> d!159279 m!1406819))

(assert (=> d!159279 m!1406821))

(assert (=> d!159279 m!1406853))

(assert (=> d!159279 m!1406819))

(assert (=> b!1523682 d!159279))

(declare-fun d!159283 () Bool)

(assert (=> d!159283 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!129800 d!159283))

(declare-fun d!159287 () Bool)

(assert (=> d!159287 (= (array_inv!37957 a!2804) (bvsge (size!49479 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!129800 d!159287))

(declare-fun b!1523932 () Bool)

(declare-fun lt!660135 () SeekEntryResult!13094)

(assert (=> b!1523932 (and (bvsge (index!54773 lt!660135) #b00000000000000000000000000000000) (bvslt (index!54773 lt!660135) (size!49479 lt!660025)))))

(declare-fun e!849576 () Bool)

(assert (=> b!1523932 (= e!849576 (= (select (arr!48929 lt!660025) (index!54773 lt!660135)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1523933 () Bool)

(assert (=> b!1523933 (and (bvsge (index!54773 lt!660135) #b00000000000000000000000000000000) (bvslt (index!54773 lt!660135) (size!49479 lt!660025)))))

(declare-fun res!1042712 () Bool)

(assert (=> b!1523933 (= res!1042712 (= (select (arr!48929 lt!660025) (index!54773 lt!660135)) lt!660022))))

(assert (=> b!1523933 (=> res!1042712 e!849576)))

(declare-fun e!849574 () Bool)

(assert (=> b!1523933 (= e!849574 e!849576)))

(declare-fun d!159289 () Bool)

(declare-fun e!849573 () Bool)

(assert (=> d!159289 e!849573))

(declare-fun c!140160 () Bool)

(assert (=> d!159289 (= c!140160 (and (is-Intermediate!13094 lt!660135) (undefined!13906 lt!660135)))))

(declare-fun e!849572 () SeekEntryResult!13094)

(assert (=> d!159289 (= lt!660135 e!849572)))

(declare-fun c!140158 () Bool)

(assert (=> d!159289 (= c!140158 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!660134 () (_ BitVec 64))

(assert (=> d!159289 (= lt!660134 (select (arr!48929 lt!660025) (toIndex!0 lt!660022 mask!2512)))))

(assert (=> d!159289 (validMask!0 mask!2512)))

(assert (=> d!159289 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660022 mask!2512) lt!660022 lt!660025 mask!2512) lt!660135)))

(declare-fun e!849575 () SeekEntryResult!13094)

(declare-fun b!1523934 () Bool)

(assert (=> b!1523934 (= e!849575 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!660022 mask!2512) #b00000000000000000000000000000000 mask!2512) lt!660022 lt!660025 mask!2512))))

(declare-fun b!1523935 () Bool)

(assert (=> b!1523935 (and (bvsge (index!54773 lt!660135) #b00000000000000000000000000000000) (bvslt (index!54773 lt!660135) (size!49479 lt!660025)))))

(declare-fun res!1042711 () Bool)

(assert (=> b!1523935 (= res!1042711 (= (select (arr!48929 lt!660025) (index!54773 lt!660135)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1523935 (=> res!1042711 e!849576)))

(declare-fun b!1523936 () Bool)

(assert (=> b!1523936 (= e!849572 e!849575)))

(declare-fun c!140159 () Bool)

(assert (=> b!1523936 (= c!140159 (or (= lt!660134 lt!660022) (= (bvadd lt!660134 lt!660134) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1523937 () Bool)

(assert (=> b!1523937 (= e!849573 (bvsge (x!136460 lt!660135) #b01111111111111111111111111111110))))

(declare-fun b!1523938 () Bool)

(assert (=> b!1523938 (= e!849575 (Intermediate!13094 false (toIndex!0 lt!660022 mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1523939 () Bool)

(assert (=> b!1523939 (= e!849572 (Intermediate!13094 true (toIndex!0 lt!660022 mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1523940 () Bool)

(assert (=> b!1523940 (= e!849573 e!849574)))

(declare-fun res!1042713 () Bool)

(assert (=> b!1523940 (= res!1042713 (and (is-Intermediate!13094 lt!660135) (not (undefined!13906 lt!660135)) (bvslt (x!136460 lt!660135) #b01111111111111111111111111111110) (bvsge (x!136460 lt!660135) #b00000000000000000000000000000000) (bvsge (x!136460 lt!660135) #b00000000000000000000000000000000)))))

(assert (=> b!1523940 (=> (not res!1042713) (not e!849574))))

(assert (= (and d!159289 c!140158) b!1523939))

(assert (= (and d!159289 (not c!140158)) b!1523936))

(assert (= (and b!1523936 c!140159) b!1523938))

(assert (= (and b!1523936 (not c!140159)) b!1523934))

(assert (= (and d!159289 c!140160) b!1523937))

(assert (= (and d!159289 (not c!140160)) b!1523940))

(assert (= (and b!1523940 res!1042713) b!1523933))

(assert (= (and b!1523933 (not res!1042712)) b!1523935))

(assert (= (and b!1523935 (not res!1042711)) b!1523932))

(declare-fun m!1407045 () Bool)

(assert (=> b!1523933 m!1407045))

(assert (=> b!1523932 m!1407045))

(assert (=> b!1523935 m!1407045))

(assert (=> b!1523934 m!1406819))

(declare-fun m!1407047 () Bool)

(assert (=> b!1523934 m!1407047))

(assert (=> b!1523934 m!1407047))

(declare-fun m!1407049 () Bool)

(assert (=> b!1523934 m!1407049))

(assert (=> d!159289 m!1406819))

(declare-fun m!1407051 () Bool)

(assert (=> d!159289 m!1407051))

(assert (=> d!159289 m!1406853))

(assert (=> b!1523681 d!159289))

(declare-fun d!159291 () Bool)

(declare-fun lt!660149 () (_ BitVec 32))

(declare-fun lt!660148 () (_ BitVec 32))

(assert (=> d!159291 (= lt!660149 (bvmul (bvxor lt!660148 (bvlshr lt!660148 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159291 (= lt!660148 ((_ extract 31 0) (bvand (bvxor lt!660022 (bvlshr lt!660022 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159291 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1042714 (let ((h!36835 ((_ extract 31 0) (bvand (bvxor lt!660022 (bvlshr lt!660022 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136464 (bvmul (bvxor h!36835 (bvlshr h!36835 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136464 (bvlshr x!136464 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1042714 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1042714 #b00000000000000000000000000000000))))))

(assert (=> d!159291 (= (toIndex!0 lt!660022 mask!2512) (bvand (bvxor lt!660149 (bvlshr lt!660149 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1523681 d!159291))

(declare-fun b!1523973 () Bool)

(declare-fun lt!660151 () SeekEntryResult!13094)

(assert (=> b!1523973 (and (bvsge (index!54773 lt!660151) #b00000000000000000000000000000000) (bvslt (index!54773 lt!660151) (size!49479 a!2804)))))

(declare-fun e!849599 () Bool)

(assert (=> b!1523973 (= e!849599 (= (select (arr!48929 a!2804) (index!54773 lt!660151)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1523974 () Bool)

(assert (=> b!1523974 (and (bvsge (index!54773 lt!660151) #b00000000000000000000000000000000) (bvslt (index!54773 lt!660151) (size!49479 a!2804)))))

(declare-fun res!1042724 () Bool)

(assert (=> b!1523974 (= res!1042724 (= (select (arr!48929 a!2804) (index!54773 lt!660151)) (select (arr!48929 a!2804) j!70)))))

(assert (=> b!1523974 (=> res!1042724 e!849599)))

(declare-fun e!849597 () Bool)

(assert (=> b!1523974 (= e!849597 e!849599)))

(declare-fun d!159293 () Bool)

(declare-fun e!849596 () Bool)

(assert (=> d!159293 e!849596))

(declare-fun c!140175 () Bool)

(assert (=> d!159293 (= c!140175 (and (is-Intermediate!13094 lt!660151) (undefined!13906 lt!660151)))))

(declare-fun e!849595 () SeekEntryResult!13094)

(assert (=> d!159293 (= lt!660151 e!849595)))

(declare-fun c!140173 () Bool)

(assert (=> d!159293 (= c!140173 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!660150 () (_ BitVec 64))

(assert (=> d!159293 (= lt!660150 (select (arr!48929 a!2804) (toIndex!0 (select (arr!48929 a!2804) j!70) mask!2512)))))

(assert (=> d!159293 (validMask!0 mask!2512)))

(assert (=> d!159293 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48929 a!2804) j!70) mask!2512) (select (arr!48929 a!2804) j!70) a!2804 mask!2512) lt!660151)))

(declare-fun b!1523975 () Bool)

(declare-fun e!849598 () SeekEntryResult!13094)

(assert (=> b!1523975 (= e!849598 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48929 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48929 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523976 () Bool)

(assert (=> b!1523976 (and (bvsge (index!54773 lt!660151) #b00000000000000000000000000000000) (bvslt (index!54773 lt!660151) (size!49479 a!2804)))))

(declare-fun res!1042723 () Bool)

(assert (=> b!1523976 (= res!1042723 (= (select (arr!48929 a!2804) (index!54773 lt!660151)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1523976 (=> res!1042723 e!849599)))

(declare-fun b!1523977 () Bool)

(assert (=> b!1523977 (= e!849595 e!849598)))

(declare-fun c!140174 () Bool)

(assert (=> b!1523977 (= c!140174 (or (= lt!660150 (select (arr!48929 a!2804) j!70)) (= (bvadd lt!660150 lt!660150) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1523978 () Bool)

(assert (=> b!1523978 (= e!849596 (bvsge (x!136460 lt!660151) #b01111111111111111111111111111110))))

(declare-fun b!1523979 () Bool)

(assert (=> b!1523979 (= e!849598 (Intermediate!13094 false (toIndex!0 (select (arr!48929 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1523980 () Bool)

(assert (=> b!1523980 (= e!849595 (Intermediate!13094 true (toIndex!0 (select (arr!48929 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1523981 () Bool)

(assert (=> b!1523981 (= e!849596 e!849597)))

(declare-fun res!1042725 () Bool)

(assert (=> b!1523981 (= res!1042725 (and (is-Intermediate!13094 lt!660151) (not (undefined!13906 lt!660151)) (bvslt (x!136460 lt!660151) #b01111111111111111111111111111110) (bvsge (x!136460 lt!660151) #b00000000000000000000000000000000) (bvsge (x!136460 lt!660151) #b00000000000000000000000000000000)))))

(assert (=> b!1523981 (=> (not res!1042725) (not e!849597))))

(assert (= (and d!159293 c!140173) b!1523980))

(assert (= (and d!159293 (not c!140173)) b!1523977))

(assert (= (and b!1523977 c!140174) b!1523979))

(assert (= (and b!1523977 (not c!140174)) b!1523975))

(assert (= (and d!159293 c!140175) b!1523978))

(assert (= (and d!159293 (not c!140175)) b!1523981))

(assert (= (and b!1523981 res!1042725) b!1523974))

(assert (= (and b!1523974 (not res!1042724)) b!1523976))

(assert (= (and b!1523976 (not res!1042723)) b!1523973))

(declare-fun m!1407053 () Bool)

(assert (=> b!1523974 m!1407053))

(assert (=> b!1523973 m!1407053))

(assert (=> b!1523976 m!1407053))

(assert (=> b!1523975 m!1406837))

(declare-fun m!1407055 () Bool)

(assert (=> b!1523975 m!1407055))

(assert (=> b!1523975 m!1407055))

(assert (=> b!1523975 m!1406827))

(declare-fun m!1407057 () Bool)

(assert (=> b!1523975 m!1407057))

(assert (=> d!159293 m!1406837))

(declare-fun m!1407059 () Bool)

(assert (=> d!159293 m!1407059))

(assert (=> d!159293 m!1406853))

(assert (=> b!1523690 d!159293))

(declare-fun d!159295 () Bool)

(declare-fun lt!660153 () (_ BitVec 32))

(declare-fun lt!660152 () (_ BitVec 32))

(assert (=> d!159295 (= lt!660153 (bvmul (bvxor lt!660152 (bvlshr lt!660152 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159295 (= lt!660152 ((_ extract 31 0) (bvand (bvxor (select (arr!48929 a!2804) j!70) (bvlshr (select (arr!48929 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159295 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1042714 (let ((h!36835 ((_ extract 31 0) (bvand (bvxor (select (arr!48929 a!2804) j!70) (bvlshr (select (arr!48929 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136464 (bvmul (bvxor h!36835 (bvlshr h!36835 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136464 (bvlshr x!136464 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1042714 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1042714 #b00000000000000000000000000000000))))))

(assert (=> d!159295 (= (toIndex!0 (select (arr!48929 a!2804) j!70) mask!2512) (bvand (bvxor lt!660153 (bvlshr lt!660153 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1523690 d!159295))

(declare-fun d!159297 () Bool)

(assert (=> d!159297 (= (validKeyInArray!0 (select (arr!48929 a!2804) j!70)) (and (not (= (select (arr!48929 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48929 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1523679 d!159297))

(declare-fun d!159299 () Bool)

(declare-fun lt!660190 () SeekEntryResult!13094)

(assert (=> d!159299 (and (or (is-MissingVacant!13094 lt!660190) (not (is-Found!13094 lt!660190)) (and (bvsge (index!54772 lt!660190) #b00000000000000000000000000000000) (bvslt (index!54772 lt!660190) (size!49479 a!2804)))) (not (is-MissingVacant!13094 lt!660190)) (or (not (is-Found!13094 lt!660190)) (= (select (arr!48929 a!2804) (index!54772 lt!660190)) (select (arr!48929 a!2804) j!70))))))

(declare-fun e!849633 () SeekEntryResult!13094)

(assert (=> d!159299 (= lt!660190 e!849633)))

(declare-fun c!140195 () Bool)

(declare-fun lt!660192 () SeekEntryResult!13094)

(assert (=> d!159299 (= c!140195 (and (is-Intermediate!13094 lt!660192) (undefined!13906 lt!660192)))))

(assert (=> d!159299 (= lt!660192 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48929 a!2804) j!70) mask!2512) (select (arr!48929 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159299 (validMask!0 mask!2512)))

(assert (=> d!159299 (= (seekEntry!0 (select (arr!48929 a!2804) j!70) a!2804 mask!2512) lt!660190)))

(declare-fun b!1524038 () Bool)

(declare-fun e!849632 () SeekEntryResult!13094)

(declare-fun lt!660193 () SeekEntryResult!13094)

(assert (=> b!1524038 (= e!849632 (ite (is-MissingVacant!13094 lt!660193) (MissingZero!13094 (index!54774 lt!660193)) lt!660193))))

(assert (=> b!1524038 (= lt!660193 (seekKeyOrZeroReturnVacant!0 (x!136460 lt!660192) (index!54773 lt!660192) (index!54773 lt!660192) (select (arr!48929 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1524039 () Bool)

(declare-fun e!849631 () SeekEntryResult!13094)

(assert (=> b!1524039 (= e!849633 e!849631)))

(declare-fun lt!660191 () (_ BitVec 64))

(assert (=> b!1524039 (= lt!660191 (select (arr!48929 a!2804) (index!54773 lt!660192)))))

(declare-fun c!140196 () Bool)

(assert (=> b!1524039 (= c!140196 (= lt!660191 (select (arr!48929 a!2804) j!70)))))

(declare-fun b!1524040 () Bool)

(assert (=> b!1524040 (= e!849632 (MissingZero!13094 (index!54773 lt!660192)))))

(declare-fun b!1524041 () Bool)

(assert (=> b!1524041 (= e!849633 Undefined!13094)))

(declare-fun b!1524042 () Bool)

(assert (=> b!1524042 (= e!849631 (Found!13094 (index!54773 lt!660192)))))

(declare-fun b!1524043 () Bool)

(declare-fun c!140197 () Bool)

(assert (=> b!1524043 (= c!140197 (= lt!660191 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1524043 (= e!849631 e!849632)))

(assert (= (and d!159299 c!140195) b!1524041))

(assert (= (and d!159299 (not c!140195)) b!1524039))

(assert (= (and b!1524039 c!140196) b!1524042))

(assert (= (and b!1524039 (not c!140196)) b!1524043))

(assert (= (and b!1524043 c!140197) b!1524040))

(assert (= (and b!1524043 (not c!140197)) b!1524038))

(declare-fun m!1407099 () Bool)

(assert (=> d!159299 m!1407099))

(assert (=> d!159299 m!1406827))

(assert (=> d!159299 m!1406837))

(assert (=> d!159299 m!1406837))

(assert (=> d!159299 m!1406827))

(assert (=> d!159299 m!1406839))

(assert (=> d!159299 m!1406853))

(assert (=> b!1524038 m!1406827))

(declare-fun m!1407101 () Bool)

(assert (=> b!1524038 m!1407101))

(declare-fun m!1407103 () Bool)

(assert (=> b!1524039 m!1407103))

(assert (=> b!1523680 d!159299))

(declare-fun bm!68420 () Bool)

(declare-fun call!68423 () Bool)

(assert (=> bm!68420 (= call!68423 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1524064 () Bool)

(declare-fun e!849646 () Bool)

(assert (=> b!1524064 (= e!849646 call!68423)))

(declare-fun b!1524065 () Bool)

(declare-fun e!849648 () Bool)

(assert (=> b!1524065 (= e!849648 call!68423)))

(declare-fun b!1524066 () Bool)

(assert (=> b!1524066 (= e!849648 e!849646)))

(declare-fun lt!660208 () (_ BitVec 64))

(assert (=> b!1524066 (= lt!660208 (select (arr!48929 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!660207 () Unit!50972)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101396 (_ BitVec 64) (_ BitVec 32)) Unit!50972)

(assert (=> b!1524066 (= lt!660207 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!660208 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101396 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1524066 (arrayContainsKey!0 a!2804 lt!660208 #b00000000000000000000000000000000)))

(declare-fun lt!660206 () Unit!50972)

(assert (=> b!1524066 (= lt!660206 lt!660207)))

(declare-fun res!1042751 () Bool)

(assert (=> b!1524066 (= res!1042751 (= (seekEntryOrOpen!0 (select (arr!48929 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13094 #b00000000000000000000000000000000)))))

(assert (=> b!1524066 (=> (not res!1042751) (not e!849646))))

(declare-fun b!1524067 () Bool)

(declare-fun e!849647 () Bool)

(assert (=> b!1524067 (= e!849647 e!849648)))

(declare-fun c!140206 () Bool)

(assert (=> b!1524067 (= c!140206 (validKeyInArray!0 (select (arr!48929 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!159321 () Bool)

(declare-fun res!1042750 () Bool)

(assert (=> d!159321 (=> res!1042750 e!849647)))

(assert (=> d!159321 (= res!1042750 (bvsge #b00000000000000000000000000000000 (size!49479 a!2804)))))

(assert (=> d!159321 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!849647)))

(assert (= (and d!159321 (not res!1042750)) b!1524067))

(assert (= (and b!1524067 c!140206) b!1524066))

(assert (= (and b!1524067 (not c!140206)) b!1524065))

(assert (= (and b!1524066 res!1042751) b!1524064))

(assert (= (or b!1524064 b!1524065) bm!68420))

(declare-fun m!1407105 () Bool)

(assert (=> bm!68420 m!1407105))

(assert (=> b!1524066 m!1406949))

(declare-fun m!1407107 () Bool)

(assert (=> b!1524066 m!1407107))

(declare-fun m!1407109 () Bool)

(assert (=> b!1524066 m!1407109))

(assert (=> b!1524066 m!1406949))

(declare-fun m!1407111 () Bool)

(assert (=> b!1524066 m!1407111))

(assert (=> b!1524067 m!1406949))

(assert (=> b!1524067 m!1406949))

(assert (=> b!1524067 m!1406953))

(assert (=> b!1523689 d!159321))

(declare-fun d!159323 () Bool)

(assert (=> d!159323 (= (validKeyInArray!0 (select (arr!48929 a!2804) i!961)) (and (not (= (select (arr!48929 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48929 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1523687 d!159323))

(declare-fun bm!68421 () Bool)

(declare-fun call!68424 () Bool)

(assert (=> bm!68421 (= call!68424 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1524068 () Bool)

(declare-fun e!849649 () Bool)

(assert (=> b!1524068 (= e!849649 call!68424)))

(declare-fun b!1524069 () Bool)

(declare-fun e!849651 () Bool)

(assert (=> b!1524069 (= e!849651 call!68424)))

(declare-fun b!1524070 () Bool)

(assert (=> b!1524070 (= e!849651 e!849649)))

(declare-fun lt!660211 () (_ BitVec 64))

(assert (=> b!1524070 (= lt!660211 (select (arr!48929 a!2804) j!70))))

(declare-fun lt!660210 () Unit!50972)

(assert (=> b!1524070 (= lt!660210 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!660211 j!70))))

(assert (=> b!1524070 (arrayContainsKey!0 a!2804 lt!660211 #b00000000000000000000000000000000)))

(declare-fun lt!660209 () Unit!50972)

(assert (=> b!1524070 (= lt!660209 lt!660210)))

(declare-fun res!1042753 () Bool)

(assert (=> b!1524070 (= res!1042753 (= (seekEntryOrOpen!0 (select (arr!48929 a!2804) j!70) a!2804 mask!2512) (Found!13094 j!70)))))

(assert (=> b!1524070 (=> (not res!1042753) (not e!849649))))

(declare-fun b!1524071 () Bool)

(declare-fun e!849650 () Bool)

(assert (=> b!1524071 (= e!849650 e!849651)))

(declare-fun c!140207 () Bool)

(assert (=> b!1524071 (= c!140207 (validKeyInArray!0 (select (arr!48929 a!2804) j!70)))))

(declare-fun d!159325 () Bool)

(declare-fun res!1042752 () Bool)

(assert (=> d!159325 (=> res!1042752 e!849650)))

(assert (=> d!159325 (= res!1042752 (bvsge j!70 (size!49479 a!2804)))))

(assert (=> d!159325 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!849650)))

(assert (= (and d!159325 (not res!1042752)) b!1524071))

(assert (= (and b!1524071 c!140207) b!1524070))

(assert (= (and b!1524071 (not c!140207)) b!1524069))

(assert (= (and b!1524070 res!1042753) b!1524068))

(assert (= (or b!1524068 b!1524069) bm!68421))

(declare-fun m!1407113 () Bool)

(assert (=> bm!68421 m!1407113))

(assert (=> b!1524070 m!1406827))

(declare-fun m!1407115 () Bool)

(assert (=> b!1524070 m!1407115))

(declare-fun m!1407117 () Bool)

(assert (=> b!1524070 m!1407117))

(assert (=> b!1524070 m!1406827))

(assert (=> b!1524070 m!1406833))

(assert (=> b!1524071 m!1406827))

(assert (=> b!1524071 m!1406827))

(assert (=> b!1524071 m!1406829))

(assert (=> b!1523686 d!159325))

(declare-fun d!159327 () Bool)

(assert (=> d!159327 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!660220 () Unit!50972)

(declare-fun choose!38 (array!101396 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50972)

(assert (=> d!159327 (= lt!660220 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!159327 (validMask!0 mask!2512)))

(assert (=> d!159327 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!660220)))

(declare-fun bs!43743 () Bool)

(assert (= bs!43743 d!159327))

(assert (=> bs!43743 m!1406845))

(declare-fun m!1407139 () Bool)

(assert (=> bs!43743 m!1407139))

(assert (=> bs!43743 m!1406853))

(assert (=> b!1523686 d!159327))

(push 1)

