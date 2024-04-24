; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128672 () Bool)

(assert start!128672)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100558 0))(
  ( (array!100559 (arr!48520 (Array (_ BitVec 32) (_ BitVec 64))) (size!49071 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100558)

(declare-fun e!842810 () Bool)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun b!1507742 () Bool)

(assert (=> b!1507742 (= e!842810 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49071 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49071 a!2804)) (bvsge mask!2512 #b00000000000000000000000000000000) (bvsgt mask!2512 #b00111111111111111111111111111111)))))

(declare-fun b!1507743 () Bool)

(declare-fun res!1026961 () Bool)

(assert (=> b!1507743 (=> (not res!1026961) (not e!842810))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100558 (_ BitVec 32)) Bool)

(assert (=> b!1507743 (= res!1026961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1507744 () Bool)

(declare-fun res!1026959 () Bool)

(assert (=> b!1507744 (=> (not res!1026959) (not e!842810))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507744 (= res!1026959 (validKeyInArray!0 (select (arr!48520 a!2804) j!70)))))

(declare-fun b!1507745 () Bool)

(declare-fun res!1026957 () Bool)

(assert (=> b!1507745 (=> (not res!1026957) (not e!842810))))

(declare-datatypes ((List!34990 0))(
  ( (Nil!34987) (Cons!34986 (h!36398 (_ BitVec 64)) (t!49676 List!34990)) )
))
(declare-fun arrayNoDuplicates!0 (array!100558 (_ BitVec 32) List!34990) Bool)

(assert (=> b!1507745 (= res!1026957 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34987))))

(declare-fun res!1026962 () Bool)

(assert (=> start!128672 (=> (not res!1026962) (not e!842810))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128672 (= res!1026962 (validMask!0 mask!2512))))

(assert (=> start!128672 e!842810))

(assert (=> start!128672 true))

(declare-fun array_inv!37801 (array!100558) Bool)

(assert (=> start!128672 (array_inv!37801 a!2804)))

(declare-fun b!1507746 () Bool)

(declare-fun res!1026958 () Bool)

(assert (=> b!1507746 (=> (not res!1026958) (not e!842810))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1507746 (= res!1026958 (and (= (size!49071 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49071 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49071 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1507747 () Bool)

(declare-fun res!1026960 () Bool)

(assert (=> b!1507747 (=> (not res!1026960) (not e!842810))))

(assert (=> b!1507747 (= res!1026960 (validKeyInArray!0 (select (arr!48520 a!2804) i!961)))))

(assert (= (and start!128672 res!1026962) b!1507746))

(assert (= (and b!1507746 res!1026958) b!1507747))

(assert (= (and b!1507747 res!1026960) b!1507744))

(assert (= (and b!1507744 res!1026959) b!1507743))

(assert (= (and b!1507743 res!1026961) b!1507745))

(assert (= (and b!1507745 res!1026957) b!1507742))

(declare-fun m!1390767 () Bool)

(assert (=> b!1507743 m!1390767))

(declare-fun m!1390769 () Bool)

(assert (=> b!1507744 m!1390769))

(assert (=> b!1507744 m!1390769))

(declare-fun m!1390771 () Bool)

(assert (=> b!1507744 m!1390771))

(declare-fun m!1390773 () Bool)

(assert (=> start!128672 m!1390773))

(declare-fun m!1390775 () Bool)

(assert (=> start!128672 m!1390775))

(declare-fun m!1390777 () Bool)

(assert (=> b!1507745 m!1390777))

(declare-fun m!1390779 () Bool)

(assert (=> b!1507747 m!1390779))

(assert (=> b!1507747 m!1390779))

(declare-fun m!1390781 () Bool)

(assert (=> b!1507747 m!1390781))

(check-sat (not b!1507743) (not b!1507745) (not b!1507747) (not start!128672) (not b!1507744))
(check-sat)
(get-model)

(declare-fun d!158667 () Bool)

(assert (=> d!158667 (= (validKeyInArray!0 (select (arr!48520 a!2804) j!70)) (and (not (= (select (arr!48520 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48520 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1507744 d!158667))

(declare-fun bm!68307 () Bool)

(declare-fun call!68310 () Bool)

(declare-fun c!139939 () Bool)

(assert (=> bm!68307 (= call!68310 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139939 (Cons!34986 (select (arr!48520 a!2804) #b00000000000000000000000000000000) Nil!34987) Nil!34987)))))

(declare-fun b!1507794 () Bool)

(declare-fun e!842835 () Bool)

(declare-fun contains!10005 (List!34990 (_ BitVec 64)) Bool)

(assert (=> b!1507794 (= e!842835 (contains!10005 Nil!34987 (select (arr!48520 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!158669 () Bool)

(declare-fun res!1027007 () Bool)

(declare-fun e!842833 () Bool)

(assert (=> d!158669 (=> res!1027007 e!842833)))

(assert (=> d!158669 (= res!1027007 (bvsge #b00000000000000000000000000000000 (size!49071 a!2804)))))

(assert (=> d!158669 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34987) e!842833)))

(declare-fun b!1507795 () Bool)

(declare-fun e!842832 () Bool)

(assert (=> b!1507795 (= e!842833 e!842832)))

(declare-fun res!1027006 () Bool)

(assert (=> b!1507795 (=> (not res!1027006) (not e!842832))))

(assert (=> b!1507795 (= res!1027006 (not e!842835))))

(declare-fun res!1027005 () Bool)

(assert (=> b!1507795 (=> (not res!1027005) (not e!842835))))

(assert (=> b!1507795 (= res!1027005 (validKeyInArray!0 (select (arr!48520 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1507796 () Bool)

(declare-fun e!842834 () Bool)

(assert (=> b!1507796 (= e!842834 call!68310)))

(declare-fun b!1507797 () Bool)

(assert (=> b!1507797 (= e!842832 e!842834)))

(assert (=> b!1507797 (= c!139939 (validKeyInArray!0 (select (arr!48520 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1507798 () Bool)

(assert (=> b!1507798 (= e!842834 call!68310)))

(assert (= (and d!158669 (not res!1027007)) b!1507795))

(assert (= (and b!1507795 res!1027005) b!1507794))

(assert (= (and b!1507795 res!1027006) b!1507797))

(assert (= (and b!1507797 c!139939) b!1507796))

(assert (= (and b!1507797 (not c!139939)) b!1507798))

(assert (= (or b!1507796 b!1507798) bm!68307))

(declare-fun m!1390815 () Bool)

(assert (=> bm!68307 m!1390815))

(declare-fun m!1390817 () Bool)

(assert (=> bm!68307 m!1390817))

(assert (=> b!1507794 m!1390815))

(assert (=> b!1507794 m!1390815))

(declare-fun m!1390819 () Bool)

(assert (=> b!1507794 m!1390819))

(assert (=> b!1507795 m!1390815))

(assert (=> b!1507795 m!1390815))

(declare-fun m!1390821 () Bool)

(assert (=> b!1507795 m!1390821))

(assert (=> b!1507797 m!1390815))

(assert (=> b!1507797 m!1390815))

(assert (=> b!1507797 m!1390821))

(assert (=> b!1507745 d!158669))

(declare-fun bm!68310 () Bool)

(declare-fun call!68313 () Bool)

(assert (=> bm!68310 (= call!68313 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1507807 () Bool)

(declare-fun e!842844 () Bool)

(declare-fun e!842842 () Bool)

(assert (=> b!1507807 (= e!842844 e!842842)))

(declare-fun c!139942 () Bool)

(assert (=> b!1507807 (= c!139942 (validKeyInArray!0 (select (arr!48520 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1507808 () Bool)

(assert (=> b!1507808 (= e!842842 call!68313)))

(declare-fun b!1507809 () Bool)

(declare-fun e!842843 () Bool)

(assert (=> b!1507809 (= e!842842 e!842843)))

(declare-fun lt!654787 () (_ BitVec 64))

(assert (=> b!1507809 (= lt!654787 (select (arr!48520 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50241 0))(
  ( (Unit!50242) )
))
(declare-fun lt!654785 () Unit!50241)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100558 (_ BitVec 64) (_ BitVec 32)) Unit!50241)

(assert (=> b!1507809 (= lt!654785 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!654787 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100558 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1507809 (arrayContainsKey!0 a!2804 lt!654787 #b00000000000000000000000000000000)))

(declare-fun lt!654786 () Unit!50241)

(assert (=> b!1507809 (= lt!654786 lt!654785)))

(declare-fun res!1027012 () Bool)

(declare-datatypes ((SeekEntryResult!12599 0))(
  ( (MissingZero!12599 (index!52791 (_ BitVec 32))) (Found!12599 (index!52792 (_ BitVec 32))) (Intermediate!12599 (undefined!13411 Bool) (index!52793 (_ BitVec 32)) (x!134711 (_ BitVec 32))) (Undefined!12599) (MissingVacant!12599 (index!52794 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100558 (_ BitVec 32)) SeekEntryResult!12599)

(assert (=> b!1507809 (= res!1027012 (= (seekEntryOrOpen!0 (select (arr!48520 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12599 #b00000000000000000000000000000000)))))

(assert (=> b!1507809 (=> (not res!1027012) (not e!842843))))

(declare-fun d!158671 () Bool)

(declare-fun res!1027013 () Bool)

(assert (=> d!158671 (=> res!1027013 e!842844)))

(assert (=> d!158671 (= res!1027013 (bvsge #b00000000000000000000000000000000 (size!49071 a!2804)))))

(assert (=> d!158671 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!842844)))

(declare-fun b!1507810 () Bool)

(assert (=> b!1507810 (= e!842843 call!68313)))

(assert (= (and d!158671 (not res!1027013)) b!1507807))

(assert (= (and b!1507807 c!139942) b!1507809))

(assert (= (and b!1507807 (not c!139942)) b!1507808))

(assert (= (and b!1507809 res!1027012) b!1507810))

(assert (= (or b!1507810 b!1507808) bm!68310))

(declare-fun m!1390823 () Bool)

(assert (=> bm!68310 m!1390823))

(assert (=> b!1507807 m!1390815))

(assert (=> b!1507807 m!1390815))

(assert (=> b!1507807 m!1390821))

(assert (=> b!1507809 m!1390815))

(declare-fun m!1390825 () Bool)

(assert (=> b!1507809 m!1390825))

(declare-fun m!1390827 () Bool)

(assert (=> b!1507809 m!1390827))

(assert (=> b!1507809 m!1390815))

(declare-fun m!1390829 () Bool)

(assert (=> b!1507809 m!1390829))

(assert (=> b!1507743 d!158671))

(declare-fun d!158677 () Bool)

(assert (=> d!158677 (= (validKeyInArray!0 (select (arr!48520 a!2804) i!961)) (and (not (= (select (arr!48520 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48520 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1507747 d!158677))

(declare-fun d!158679 () Bool)

(assert (=> d!158679 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128672 d!158679))

(declare-fun d!158689 () Bool)

(assert (=> d!158689 (= (array_inv!37801 a!2804) (bvsge (size!49071 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128672 d!158689))

(check-sat (not b!1507794) (not bm!68307) (not b!1507797) (not b!1507807) (not bm!68310) (not b!1507795) (not b!1507809))
(check-sat)
