; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130752 () Bool)

(assert start!130752)

(declare-fun b!1532718 () Bool)

(declare-fun res!1048758 () Bool)

(declare-fun e!854218 () Bool)

(assert (=> b!1532718 (=> (not res!1048758) (not e!854218))))

(declare-datatypes ((array!101782 0))(
  ( (array!101783 (arr!49108 (Array (_ BitVec 32) (_ BitVec 64))) (size!49659 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101782)

(declare-datatypes ((List!35578 0))(
  ( (Nil!35575) (Cons!35574 (h!37031 (_ BitVec 64)) (t!50264 List!35578)) )
))
(declare-fun arrayNoDuplicates!0 (array!101782 (_ BitVec 32) List!35578) Bool)

(assert (=> b!1532718 (= res!1048758 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35575))))

(declare-fun b!1532719 () Bool)

(declare-fun res!1048760 () Bool)

(declare-fun e!854220 () Bool)

(assert (=> b!1532719 (=> (not res!1048760) (not e!854220))))

(declare-datatypes ((SeekEntryResult!13166 0))(
  ( (MissingZero!13166 (index!55059 (_ BitVec 32))) (Found!13166 (index!55060 (_ BitVec 32))) (Intermediate!13166 (undefined!13978 Bool) (index!55061 (_ BitVec 32)) (x!136957 (_ BitVec 32))) (Undefined!13166) (MissingVacant!13166 (index!55062 (_ BitVec 32))) )
))
(declare-fun lt!663690 () SeekEntryResult!13166)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101782 (_ BitVec 32)) SeekEntryResult!13166)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1532719 (= res!1048760 (= lt!663690 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49108 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49108 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101783 (store (arr!49108 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49659 a!2804)) mask!2512)))))

(declare-fun b!1532720 () Bool)

(declare-fun res!1048762 () Bool)

(assert (=> b!1532720 (=> (not res!1048762) (not e!854218))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532720 (= res!1048762 (validKeyInArray!0 (select (arr!49108 a!2804) i!961)))))

(declare-fun b!1532721 () Bool)

(assert (=> b!1532721 (= e!854218 e!854220)))

(declare-fun res!1048756 () Bool)

(assert (=> b!1532721 (=> (not res!1048756) (not e!854220))))

(declare-fun lt!663687 () SeekEntryResult!13166)

(assert (=> b!1532721 (= res!1048756 (= lt!663690 lt!663687))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1532721 (= lt!663687 (Intermediate!13166 false resIndex!21 resX!21))))

(assert (=> b!1532721 (= lt!663690 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49108 a!2804) j!70) mask!2512) (select (arr!49108 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1532722 () Bool)

(declare-fun res!1048766 () Bool)

(assert (=> b!1532722 (=> (not res!1048766) (not e!854218))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1532722 (= res!1048766 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49659 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49659 a!2804))))))

(declare-fun b!1532723 () Bool)

(declare-fun res!1048767 () Bool)

(assert (=> b!1532723 (=> (not res!1048767) (not e!854218))))

(assert (=> b!1532723 (= res!1048767 (validKeyInArray!0 (select (arr!49108 a!2804) j!70)))))

(declare-fun b!1532724 () Bool)

(declare-fun res!1048765 () Bool)

(assert (=> b!1532724 (=> (not res!1048765) (not e!854220))))

(assert (=> b!1532724 (= res!1048765 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49108 a!2804) j!70) a!2804 mask!2512) lt!663687))))

(declare-fun e!854217 () Bool)

(declare-fun b!1532725 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101782 (_ BitVec 32)) SeekEntryResult!13166)

(assert (=> b!1532725 (= e!854217 (= (seekEntry!0 (select (arr!49108 a!2804) j!70) a!2804 mask!2512) (Found!13166 j!70)))))

(declare-fun res!1048763 () Bool)

(assert (=> start!130752 (=> (not res!1048763) (not e!854218))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130752 (= res!1048763 (validMask!0 mask!2512))))

(assert (=> start!130752 e!854218))

(assert (=> start!130752 true))

(declare-fun array_inv!38389 (array!101782) Bool)

(assert (=> start!130752 (array_inv!38389 a!2804)))

(declare-fun b!1532726 () Bool)

(declare-fun res!1048764 () Bool)

(assert (=> b!1532726 (=> (not res!1048764) (not e!854218))))

(assert (=> b!1532726 (= res!1048764 (and (= (size!49659 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49659 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49659 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1532727 () Bool)

(declare-fun e!854221 () Bool)

(assert (=> b!1532727 (= e!854220 (not e!854221))))

(declare-fun res!1048759 () Bool)

(assert (=> b!1532727 (=> res!1048759 e!854221)))

(assert (=> b!1532727 (= res!1048759 (or (not (= (select (arr!49108 a!2804) j!70) (select (store (arr!49108 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1532727 e!854217))

(declare-fun res!1048757 () Bool)

(assert (=> b!1532727 (=> (not res!1048757) (not e!854217))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101782 (_ BitVec 32)) Bool)

(assert (=> b!1532727 (= res!1048757 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51151 0))(
  ( (Unit!51152) )
))
(declare-fun lt!663689 () Unit!51151)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101782 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51151)

(assert (=> b!1532727 (= lt!663689 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1532728 () Bool)

(declare-fun res!1048761 () Bool)

(assert (=> b!1532728 (=> (not res!1048761) (not e!854218))))

(assert (=> b!1532728 (= res!1048761 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1532729 () Bool)

(declare-fun lt!663688 () (_ BitVec 32))

(assert (=> b!1532729 (= e!854221 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (and (bvsge lt!663688 #b00000000000000000000000000000000) (bvslt lt!663688 (size!49659 a!2804)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1532729 (= lt!663688 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(assert (= (and start!130752 res!1048763) b!1532726))

(assert (= (and b!1532726 res!1048764) b!1532720))

(assert (= (and b!1532720 res!1048762) b!1532723))

(assert (= (and b!1532723 res!1048767) b!1532728))

(assert (= (and b!1532728 res!1048761) b!1532718))

(assert (= (and b!1532718 res!1048758) b!1532722))

(assert (= (and b!1532722 res!1048766) b!1532721))

(assert (= (and b!1532721 res!1048756) b!1532724))

(assert (= (and b!1532724 res!1048765) b!1532719))

(assert (= (and b!1532719 res!1048760) b!1532727))

(assert (= (and b!1532727 res!1048757) b!1532725))

(assert (= (and b!1532727 (not res!1048759)) b!1532729))

(declare-fun m!1415443 () Bool)

(assert (=> start!130752 m!1415443))

(declare-fun m!1415445 () Bool)

(assert (=> start!130752 m!1415445))

(declare-fun m!1415447 () Bool)

(assert (=> b!1532725 m!1415447))

(assert (=> b!1532725 m!1415447))

(declare-fun m!1415449 () Bool)

(assert (=> b!1532725 m!1415449))

(assert (=> b!1532721 m!1415447))

(assert (=> b!1532721 m!1415447))

(declare-fun m!1415451 () Bool)

(assert (=> b!1532721 m!1415451))

(assert (=> b!1532721 m!1415451))

(assert (=> b!1532721 m!1415447))

(declare-fun m!1415453 () Bool)

(assert (=> b!1532721 m!1415453))

(declare-fun m!1415455 () Bool)

(assert (=> b!1532719 m!1415455))

(declare-fun m!1415457 () Bool)

(assert (=> b!1532719 m!1415457))

(assert (=> b!1532719 m!1415457))

(declare-fun m!1415459 () Bool)

(assert (=> b!1532719 m!1415459))

(assert (=> b!1532719 m!1415459))

(assert (=> b!1532719 m!1415457))

(declare-fun m!1415461 () Bool)

(assert (=> b!1532719 m!1415461))

(assert (=> b!1532727 m!1415447))

(declare-fun m!1415463 () Bool)

(assert (=> b!1532727 m!1415463))

(assert (=> b!1532727 m!1415455))

(assert (=> b!1532727 m!1415457))

(declare-fun m!1415465 () Bool)

(assert (=> b!1532727 m!1415465))

(declare-fun m!1415467 () Bool)

(assert (=> b!1532718 m!1415467))

(declare-fun m!1415469 () Bool)

(assert (=> b!1532720 m!1415469))

(assert (=> b!1532720 m!1415469))

(declare-fun m!1415471 () Bool)

(assert (=> b!1532720 m!1415471))

(assert (=> b!1532724 m!1415447))

(assert (=> b!1532724 m!1415447))

(declare-fun m!1415473 () Bool)

(assert (=> b!1532724 m!1415473))

(assert (=> b!1532723 m!1415447))

(assert (=> b!1532723 m!1415447))

(declare-fun m!1415475 () Bool)

(assert (=> b!1532723 m!1415475))

(declare-fun m!1415477 () Bool)

(assert (=> b!1532728 m!1415477))

(declare-fun m!1415479 () Bool)

(assert (=> b!1532729 m!1415479))

(check-sat (not b!1532721) (not b!1532725) (not b!1532719) (not b!1532727) (not b!1532729) (not b!1532728) (not b!1532720) (not b!1532724) (not b!1532718) (not start!130752) (not b!1532723))
(check-sat)
(get-model)

(declare-fun b!1532812 () Bool)

(declare-fun e!854260 () Bool)

(declare-fun contains!10049 (List!35578 (_ BitVec 64)) Bool)

(assert (=> b!1532812 (= e!854260 (contains!10049 Nil!35575 (select (arr!49108 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1532813 () Bool)

(declare-fun e!854262 () Bool)

(declare-fun e!854263 () Bool)

(assert (=> b!1532813 (= e!854262 e!854263)))

(declare-fun res!1048846 () Bool)

(assert (=> b!1532813 (=> (not res!1048846) (not e!854263))))

(assert (=> b!1532813 (= res!1048846 (not e!854260))))

(declare-fun res!1048848 () Bool)

(assert (=> b!1532813 (=> (not res!1048848) (not e!854260))))

(assert (=> b!1532813 (= res!1048848 (validKeyInArray!0 (select (arr!49108 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!160497 () Bool)

(declare-fun res!1048847 () Bool)

(assert (=> d!160497 (=> res!1048847 e!854262)))

(assert (=> d!160497 (= res!1048847 (bvsge #b00000000000000000000000000000000 (size!49659 a!2804)))))

(assert (=> d!160497 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35575) e!854262)))

(declare-fun bm!68643 () Bool)

(declare-fun call!68646 () Bool)

(declare-fun c!141550 () Bool)

(assert (=> bm!68643 (= call!68646 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!141550 (Cons!35574 (select (arr!49108 a!2804) #b00000000000000000000000000000000) Nil!35575) Nil!35575)))))

(declare-fun b!1532814 () Bool)

(declare-fun e!854261 () Bool)

(assert (=> b!1532814 (= e!854261 call!68646)))

(declare-fun b!1532815 () Bool)

(assert (=> b!1532815 (= e!854263 e!854261)))

(assert (=> b!1532815 (= c!141550 (validKeyInArray!0 (select (arr!49108 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1532816 () Bool)

(assert (=> b!1532816 (= e!854261 call!68646)))

(assert (= (and d!160497 (not res!1048847)) b!1532813))

(assert (= (and b!1532813 res!1048848) b!1532812))

(assert (= (and b!1532813 res!1048846) b!1532815))

(assert (= (and b!1532815 c!141550) b!1532816))

(assert (= (and b!1532815 (not c!141550)) b!1532814))

(assert (= (or b!1532816 b!1532814) bm!68643))

(declare-fun m!1415557 () Bool)

(assert (=> b!1532812 m!1415557))

(assert (=> b!1532812 m!1415557))

(declare-fun m!1415559 () Bool)

(assert (=> b!1532812 m!1415559))

(assert (=> b!1532813 m!1415557))

(assert (=> b!1532813 m!1415557))

(declare-fun m!1415561 () Bool)

(assert (=> b!1532813 m!1415561))

(assert (=> bm!68643 m!1415557))

(declare-fun m!1415563 () Bool)

(assert (=> bm!68643 m!1415563))

(assert (=> b!1532815 m!1415557))

(assert (=> b!1532815 m!1415557))

(assert (=> b!1532815 m!1415561))

(assert (=> b!1532718 d!160497))

(declare-fun d!160499 () Bool)

(assert (=> d!160499 (= (validKeyInArray!0 (select (arr!49108 a!2804) j!70)) (and (not (= (select (arr!49108 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49108 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1532723 d!160499))

(declare-fun b!1532835 () Bool)

(declare-fun e!854276 () Bool)

(declare-fun lt!663720 () SeekEntryResult!13166)

(assert (=> b!1532835 (= e!854276 (bvsge (x!136957 lt!663720) #b01111111111111111111111111111110))))

(declare-fun b!1532836 () Bool)

(declare-fun e!854277 () SeekEntryResult!13166)

(assert (=> b!1532836 (= e!854277 (Intermediate!13166 false index!487 x!534))))

(declare-fun b!1532837 () Bool)

(assert (=> b!1532837 (and (bvsge (index!55061 lt!663720) #b00000000000000000000000000000000) (bvslt (index!55061 lt!663720) (size!49659 a!2804)))))

(declare-fun res!1048856 () Bool)

(assert (=> b!1532837 (= res!1048856 (= (select (arr!49108 a!2804) (index!55061 lt!663720)) (select (arr!49108 a!2804) j!70)))))

(declare-fun e!854278 () Bool)

(assert (=> b!1532837 (=> res!1048856 e!854278)))

(declare-fun e!854274 () Bool)

(assert (=> b!1532837 (= e!854274 e!854278)))

(declare-fun d!160501 () Bool)

(assert (=> d!160501 e!854276))

(declare-fun c!141559 () Bool)

(get-info :version)

(assert (=> d!160501 (= c!141559 (and ((_ is Intermediate!13166) lt!663720) (undefined!13978 lt!663720)))))

(declare-fun e!854275 () SeekEntryResult!13166)

(assert (=> d!160501 (= lt!663720 e!854275)))

(declare-fun c!141558 () Bool)

(assert (=> d!160501 (= c!141558 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!663719 () (_ BitVec 64))

(assert (=> d!160501 (= lt!663719 (select (arr!49108 a!2804) index!487))))

(assert (=> d!160501 (validMask!0 mask!2512)))

(assert (=> d!160501 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49108 a!2804) j!70) a!2804 mask!2512) lt!663720)))

(declare-fun b!1532838 () Bool)

(assert (=> b!1532838 (and (bvsge (index!55061 lt!663720) #b00000000000000000000000000000000) (bvslt (index!55061 lt!663720) (size!49659 a!2804)))))

(assert (=> b!1532838 (= e!854278 (= (select (arr!49108 a!2804) (index!55061 lt!663720)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1532839 () Bool)

(assert (=> b!1532839 (= e!854277 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 (bvadd x!534 #b00000000000000000000000000000001) mask!2512) (select (arr!49108 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1532840 () Bool)

(assert (=> b!1532840 (= e!854275 (Intermediate!13166 true index!487 x!534))))

(declare-fun b!1532841 () Bool)

(assert (=> b!1532841 (= e!854276 e!854274)))

(declare-fun res!1048855 () Bool)

(assert (=> b!1532841 (= res!1048855 (and ((_ is Intermediate!13166) lt!663720) (not (undefined!13978 lt!663720)) (bvslt (x!136957 lt!663720) #b01111111111111111111111111111110) (bvsge (x!136957 lt!663720) #b00000000000000000000000000000000) (bvsge (x!136957 lt!663720) x!534)))))

(assert (=> b!1532841 (=> (not res!1048855) (not e!854274))))

(declare-fun b!1532842 () Bool)

(assert (=> b!1532842 (and (bvsge (index!55061 lt!663720) #b00000000000000000000000000000000) (bvslt (index!55061 lt!663720) (size!49659 a!2804)))))

(declare-fun res!1048857 () Bool)

(assert (=> b!1532842 (= res!1048857 (= (select (arr!49108 a!2804) (index!55061 lt!663720)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1532842 (=> res!1048857 e!854278)))

(declare-fun b!1532843 () Bool)

(assert (=> b!1532843 (= e!854275 e!854277)))

(declare-fun c!141557 () Bool)

(assert (=> b!1532843 (= c!141557 (or (= lt!663719 (select (arr!49108 a!2804) j!70)) (= (bvadd lt!663719 lt!663719) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!160501 c!141558) b!1532840))

(assert (= (and d!160501 (not c!141558)) b!1532843))

(assert (= (and b!1532843 c!141557) b!1532836))

(assert (= (and b!1532843 (not c!141557)) b!1532839))

(assert (= (and d!160501 c!141559) b!1532835))

(assert (= (and d!160501 (not c!141559)) b!1532841))

(assert (= (and b!1532841 res!1048855) b!1532837))

(assert (= (and b!1532837 (not res!1048856)) b!1532842))

(assert (= (and b!1532842 (not res!1048857)) b!1532838))

(declare-fun m!1415565 () Bool)

(assert (=> b!1532839 m!1415565))

(assert (=> b!1532839 m!1415565))

(assert (=> b!1532839 m!1415447))

(declare-fun m!1415567 () Bool)

(assert (=> b!1532839 m!1415567))

(declare-fun m!1415569 () Bool)

(assert (=> b!1532842 m!1415569))

(assert (=> b!1532837 m!1415569))

(declare-fun m!1415571 () Bool)

(assert (=> d!160501 m!1415571))

(assert (=> d!160501 m!1415443))

(assert (=> b!1532838 m!1415569))

(assert (=> b!1532724 d!160501))

(declare-fun d!160507 () Bool)

(declare-fun lt!663731 () (_ BitVec 32))

(assert (=> d!160507 (and (bvsge lt!663731 #b00000000000000000000000000000000) (bvslt lt!663731 (bvadd mask!2512 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!160507 (= lt!663731 (choose!52 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(assert (=> d!160507 (validMask!0 mask!2512)))

(assert (=> d!160507 (= (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512) lt!663731)))

(declare-fun bs!43904 () Bool)

(assert (= bs!43904 d!160507))

(declare-fun m!1415573 () Bool)

(assert (=> bs!43904 m!1415573))

(assert (=> bs!43904 m!1415443))

(assert (=> b!1532729 d!160507))

(declare-fun b!1532856 () Bool)

(declare-fun e!854287 () Bool)

(declare-fun lt!663733 () SeekEntryResult!13166)

(assert (=> b!1532856 (= e!854287 (bvsge (x!136957 lt!663733) #b01111111111111111111111111111110))))

(declare-fun b!1532857 () Bool)

(declare-fun e!854288 () SeekEntryResult!13166)

(assert (=> b!1532857 (= e!854288 (Intermediate!13166 false (toIndex!0 (select (store (arr!49108 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1532858 () Bool)

(assert (=> b!1532858 (and (bvsge (index!55061 lt!663733) #b00000000000000000000000000000000) (bvslt (index!55061 lt!663733) (size!49659 (array!101783 (store (arr!49108 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49659 a!2804)))))))

(declare-fun res!1048859 () Bool)

(assert (=> b!1532858 (= res!1048859 (= (select (arr!49108 (array!101783 (store (arr!49108 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49659 a!2804))) (index!55061 lt!663733)) (select (store (arr!49108 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(declare-fun e!854289 () Bool)

(assert (=> b!1532858 (=> res!1048859 e!854289)))

(declare-fun e!854285 () Bool)

(assert (=> b!1532858 (= e!854285 e!854289)))

(declare-fun d!160509 () Bool)

(assert (=> d!160509 e!854287))

(declare-fun c!141568 () Bool)

(assert (=> d!160509 (= c!141568 (and ((_ is Intermediate!13166) lt!663733) (undefined!13978 lt!663733)))))

(declare-fun e!854286 () SeekEntryResult!13166)

(assert (=> d!160509 (= lt!663733 e!854286)))

(declare-fun c!141567 () Bool)

(assert (=> d!160509 (= c!141567 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!663732 () (_ BitVec 64))

(assert (=> d!160509 (= lt!663732 (select (arr!49108 (array!101783 (store (arr!49108 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49659 a!2804))) (toIndex!0 (select (store (arr!49108 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!160509 (validMask!0 mask!2512)))

(assert (=> d!160509 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49108 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49108 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101783 (store (arr!49108 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49659 a!2804)) mask!2512) lt!663733)))

(declare-fun b!1532859 () Bool)

(assert (=> b!1532859 (and (bvsge (index!55061 lt!663733) #b00000000000000000000000000000000) (bvslt (index!55061 lt!663733) (size!49659 (array!101783 (store (arr!49108 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49659 a!2804)))))))

(assert (=> b!1532859 (= e!854289 (= (select (arr!49108 (array!101783 (store (arr!49108 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49659 a!2804))) (index!55061 lt!663733)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1532860 () Bool)

(assert (=> b!1532860 (= e!854288 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!49108 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (store (arr!49108 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101783 (store (arr!49108 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49659 a!2804)) mask!2512))))

(declare-fun b!1532861 () Bool)

(assert (=> b!1532861 (= e!854286 (Intermediate!13166 true (toIndex!0 (select (store (arr!49108 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1532862 () Bool)

(assert (=> b!1532862 (= e!854287 e!854285)))

(declare-fun res!1048858 () Bool)

(assert (=> b!1532862 (= res!1048858 (and ((_ is Intermediate!13166) lt!663733) (not (undefined!13978 lt!663733)) (bvslt (x!136957 lt!663733) #b01111111111111111111111111111110) (bvsge (x!136957 lt!663733) #b00000000000000000000000000000000) (bvsge (x!136957 lt!663733) #b00000000000000000000000000000000)))))

(assert (=> b!1532862 (=> (not res!1048858) (not e!854285))))

(declare-fun b!1532863 () Bool)

(assert (=> b!1532863 (and (bvsge (index!55061 lt!663733) #b00000000000000000000000000000000) (bvslt (index!55061 lt!663733) (size!49659 (array!101783 (store (arr!49108 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49659 a!2804)))))))

(declare-fun res!1048860 () Bool)

(assert (=> b!1532863 (= res!1048860 (= (select (arr!49108 (array!101783 (store (arr!49108 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49659 a!2804))) (index!55061 lt!663733)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1532863 (=> res!1048860 e!854289)))

(declare-fun b!1532864 () Bool)

(assert (=> b!1532864 (= e!854286 e!854288)))

(declare-fun c!141566 () Bool)

(assert (=> b!1532864 (= c!141566 (or (= lt!663732 (select (store (arr!49108 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!663732 lt!663732) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!160509 c!141567) b!1532861))

(assert (= (and d!160509 (not c!141567)) b!1532864))

(assert (= (and b!1532864 c!141566) b!1532857))

(assert (= (and b!1532864 (not c!141566)) b!1532860))

(assert (= (and d!160509 c!141568) b!1532856))

(assert (= (and d!160509 (not c!141568)) b!1532862))

(assert (= (and b!1532862 res!1048858) b!1532858))

(assert (= (and b!1532858 (not res!1048859)) b!1532863))

(assert (= (and b!1532863 (not res!1048860)) b!1532859))

(assert (=> b!1532860 m!1415459))

(declare-fun m!1415575 () Bool)

(assert (=> b!1532860 m!1415575))

(assert (=> b!1532860 m!1415575))

(assert (=> b!1532860 m!1415457))

(declare-fun m!1415577 () Bool)

(assert (=> b!1532860 m!1415577))

(declare-fun m!1415579 () Bool)

(assert (=> b!1532863 m!1415579))

(assert (=> b!1532858 m!1415579))

(assert (=> d!160509 m!1415459))

(declare-fun m!1415581 () Bool)

(assert (=> d!160509 m!1415581))

(assert (=> d!160509 m!1415443))

(assert (=> b!1532859 m!1415579))

(assert (=> b!1532719 d!160509))

(declare-fun d!160511 () Bool)

(declare-fun lt!663743 () (_ BitVec 32))

(declare-fun lt!663742 () (_ BitVec 32))

(assert (=> d!160511 (= lt!663743 (bvmul (bvxor lt!663742 (bvlshr lt!663742 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!160511 (= lt!663742 ((_ extract 31 0) (bvand (bvxor (select (store (arr!49108 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!49108 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!160511 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1048861 (let ((h!37034 ((_ extract 31 0) (bvand (bvxor (select (store (arr!49108 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!49108 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136962 (bvmul (bvxor h!37034 (bvlshr h!37034 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136962 (bvlshr x!136962 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1048861 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1048861 #b00000000000000000000000000000000))))))

(assert (=> d!160511 (= (toIndex!0 (select (store (arr!49108 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!663743 (bvlshr lt!663743 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1532719 d!160511))

(declare-fun d!160515 () Bool)

(assert (=> d!160515 (= (validKeyInArray!0 (select (arr!49108 a!2804) i!961)) (and (not (= (select (arr!49108 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49108 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1532720 d!160515))

(declare-fun b!1532928 () Bool)

(declare-fun e!854326 () SeekEntryResult!13166)

(assert (=> b!1532928 (= e!854326 Undefined!13166)))

(declare-fun d!160517 () Bool)

(declare-fun lt!663762 () SeekEntryResult!13166)

(assert (=> d!160517 (and (or ((_ is MissingVacant!13166) lt!663762) (not ((_ is Found!13166) lt!663762)) (and (bvsge (index!55060 lt!663762) #b00000000000000000000000000000000) (bvslt (index!55060 lt!663762) (size!49659 a!2804)))) (not ((_ is MissingVacant!13166) lt!663762)) (or (not ((_ is Found!13166) lt!663762)) (= (select (arr!49108 a!2804) (index!55060 lt!663762)) (select (arr!49108 a!2804) j!70))))))

(assert (=> d!160517 (= lt!663762 e!854326)))

(declare-fun c!141595 () Bool)

(declare-fun lt!663765 () SeekEntryResult!13166)

(assert (=> d!160517 (= c!141595 (and ((_ is Intermediate!13166) lt!663765) (undefined!13978 lt!663765)))))

(assert (=> d!160517 (= lt!663765 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49108 a!2804) j!70) mask!2512) (select (arr!49108 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!160517 (validMask!0 mask!2512)))

(assert (=> d!160517 (= (seekEntry!0 (select (arr!49108 a!2804) j!70) a!2804 mask!2512) lt!663762)))

(declare-fun b!1532929 () Bool)

(declare-fun e!854324 () SeekEntryResult!13166)

(assert (=> b!1532929 (= e!854324 (MissingZero!13166 (index!55061 lt!663765)))))

(declare-fun b!1532930 () Bool)

(declare-fun c!141593 () Bool)

(declare-fun lt!663763 () (_ BitVec 64))

(assert (=> b!1532930 (= c!141593 (= lt!663763 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!854325 () SeekEntryResult!13166)

(assert (=> b!1532930 (= e!854325 e!854324)))

(declare-fun b!1532931 () Bool)

(assert (=> b!1532931 (= e!854325 (Found!13166 (index!55061 lt!663765)))))

(declare-fun b!1532932 () Bool)

(declare-fun lt!663764 () SeekEntryResult!13166)

(assert (=> b!1532932 (= e!854324 (ite ((_ is MissingVacant!13166) lt!663764) (MissingZero!13166 (index!55062 lt!663764)) lt!663764))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101782 (_ BitVec 32)) SeekEntryResult!13166)

(assert (=> b!1532932 (= lt!663764 (seekKeyOrZeroReturnVacant!0 (x!136957 lt!663765) (index!55061 lt!663765) (index!55061 lt!663765) (select (arr!49108 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1532933 () Bool)

(assert (=> b!1532933 (= e!854326 e!854325)))

(assert (=> b!1532933 (= lt!663763 (select (arr!49108 a!2804) (index!55061 lt!663765)))))

(declare-fun c!141594 () Bool)

(assert (=> b!1532933 (= c!141594 (= lt!663763 (select (arr!49108 a!2804) j!70)))))

(assert (= (and d!160517 c!141595) b!1532928))

(assert (= (and d!160517 (not c!141595)) b!1532933))

(assert (= (and b!1532933 c!141594) b!1532931))

(assert (= (and b!1532933 (not c!141594)) b!1532930))

(assert (= (and b!1532930 c!141593) b!1532929))

(assert (= (and b!1532930 (not c!141593)) b!1532932))

(declare-fun m!1415597 () Bool)

(assert (=> d!160517 m!1415597))

(assert (=> d!160517 m!1415447))

(assert (=> d!160517 m!1415451))

(assert (=> d!160517 m!1415451))

(assert (=> d!160517 m!1415447))

(assert (=> d!160517 m!1415453))

(assert (=> d!160517 m!1415443))

(assert (=> b!1532932 m!1415447))

(declare-fun m!1415599 () Bool)

(assert (=> b!1532932 m!1415599))

(declare-fun m!1415601 () Bool)

(assert (=> b!1532933 m!1415601))

(assert (=> b!1532725 d!160517))

(declare-fun d!160521 () Bool)

(assert (=> d!160521 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!130752 d!160521))

(declare-fun d!160531 () Bool)

(assert (=> d!160531 (= (array_inv!38389 a!2804) (bvsge (size!49659 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!130752 d!160531))

(declare-fun b!1532957 () Bool)

(declare-fun e!854344 () Bool)

(declare-fun lt!663784 () SeekEntryResult!13166)

(assert (=> b!1532957 (= e!854344 (bvsge (x!136957 lt!663784) #b01111111111111111111111111111110))))

(declare-fun e!854345 () SeekEntryResult!13166)

(declare-fun b!1532958 () Bool)

(assert (=> b!1532958 (= e!854345 (Intermediate!13166 false (toIndex!0 (select (arr!49108 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1532959 () Bool)

(assert (=> b!1532959 (and (bvsge (index!55061 lt!663784) #b00000000000000000000000000000000) (bvslt (index!55061 lt!663784) (size!49659 a!2804)))))

(declare-fun res!1048887 () Bool)

(assert (=> b!1532959 (= res!1048887 (= (select (arr!49108 a!2804) (index!55061 lt!663784)) (select (arr!49108 a!2804) j!70)))))

(declare-fun e!854346 () Bool)

(assert (=> b!1532959 (=> res!1048887 e!854346)))

(declare-fun e!854342 () Bool)

(assert (=> b!1532959 (= e!854342 e!854346)))

(declare-fun d!160533 () Bool)

(assert (=> d!160533 e!854344))

(declare-fun c!141605 () Bool)

(assert (=> d!160533 (= c!141605 (and ((_ is Intermediate!13166) lt!663784) (undefined!13978 lt!663784)))))

(declare-fun e!854343 () SeekEntryResult!13166)

(assert (=> d!160533 (= lt!663784 e!854343)))

(declare-fun c!141604 () Bool)

(assert (=> d!160533 (= c!141604 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!663783 () (_ BitVec 64))

(assert (=> d!160533 (= lt!663783 (select (arr!49108 a!2804) (toIndex!0 (select (arr!49108 a!2804) j!70) mask!2512)))))

(assert (=> d!160533 (validMask!0 mask!2512)))

(assert (=> d!160533 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49108 a!2804) j!70) mask!2512) (select (arr!49108 a!2804) j!70) a!2804 mask!2512) lt!663784)))

(declare-fun b!1532960 () Bool)

(assert (=> b!1532960 (and (bvsge (index!55061 lt!663784) #b00000000000000000000000000000000) (bvslt (index!55061 lt!663784) (size!49659 a!2804)))))

(assert (=> b!1532960 (= e!854346 (= (select (arr!49108 a!2804) (index!55061 lt!663784)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1532961 () Bool)

(assert (=> b!1532961 (= e!854345 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!49108 a!2804) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (arr!49108 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1532962 () Bool)

(assert (=> b!1532962 (= e!854343 (Intermediate!13166 true (toIndex!0 (select (arr!49108 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1532963 () Bool)

(assert (=> b!1532963 (= e!854344 e!854342)))

(declare-fun res!1048886 () Bool)

(assert (=> b!1532963 (= res!1048886 (and ((_ is Intermediate!13166) lt!663784) (not (undefined!13978 lt!663784)) (bvslt (x!136957 lt!663784) #b01111111111111111111111111111110) (bvsge (x!136957 lt!663784) #b00000000000000000000000000000000) (bvsge (x!136957 lt!663784) #b00000000000000000000000000000000)))))

(assert (=> b!1532963 (=> (not res!1048886) (not e!854342))))

(declare-fun b!1532964 () Bool)

(assert (=> b!1532964 (and (bvsge (index!55061 lt!663784) #b00000000000000000000000000000000) (bvslt (index!55061 lt!663784) (size!49659 a!2804)))))

(declare-fun res!1048888 () Bool)

(assert (=> b!1532964 (= res!1048888 (= (select (arr!49108 a!2804) (index!55061 lt!663784)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1532964 (=> res!1048888 e!854346)))

(declare-fun b!1532965 () Bool)

(assert (=> b!1532965 (= e!854343 e!854345)))

(declare-fun c!141603 () Bool)

(assert (=> b!1532965 (= c!141603 (or (= lt!663783 (select (arr!49108 a!2804) j!70)) (= (bvadd lt!663783 lt!663783) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!160533 c!141604) b!1532962))

(assert (= (and d!160533 (not c!141604)) b!1532965))

(assert (= (and b!1532965 c!141603) b!1532958))

(assert (= (and b!1532965 (not c!141603)) b!1532961))

(assert (= (and d!160533 c!141605) b!1532957))

(assert (= (and d!160533 (not c!141605)) b!1532963))

(assert (= (and b!1532963 res!1048886) b!1532959))

(assert (= (and b!1532959 (not res!1048887)) b!1532964))

(assert (= (and b!1532964 (not res!1048888)) b!1532960))

(assert (=> b!1532961 m!1415451))

(declare-fun m!1415613 () Bool)

(assert (=> b!1532961 m!1415613))

(assert (=> b!1532961 m!1415613))

(assert (=> b!1532961 m!1415447))

(declare-fun m!1415615 () Bool)

(assert (=> b!1532961 m!1415615))

(declare-fun m!1415617 () Bool)

(assert (=> b!1532964 m!1415617))

(assert (=> b!1532959 m!1415617))

(assert (=> d!160533 m!1415451))

(declare-fun m!1415619 () Bool)

(assert (=> d!160533 m!1415619))

(assert (=> d!160533 m!1415443))

(assert (=> b!1532960 m!1415617))

(assert (=> b!1532721 d!160533))

(declare-fun d!160535 () Bool)

(declare-fun lt!663786 () (_ BitVec 32))

(declare-fun lt!663785 () (_ BitVec 32))

(assert (=> d!160535 (= lt!663786 (bvmul (bvxor lt!663785 (bvlshr lt!663785 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!160535 (= lt!663785 ((_ extract 31 0) (bvand (bvxor (select (arr!49108 a!2804) j!70) (bvlshr (select (arr!49108 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!160535 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1048861 (let ((h!37034 ((_ extract 31 0) (bvand (bvxor (select (arr!49108 a!2804) j!70) (bvlshr (select (arr!49108 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136962 (bvmul (bvxor h!37034 (bvlshr h!37034 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136962 (bvlshr x!136962 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1048861 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1048861 #b00000000000000000000000000000000))))))

(assert (=> d!160535 (= (toIndex!0 (select (arr!49108 a!2804) j!70) mask!2512) (bvand (bvxor lt!663786 (bvlshr lt!663786 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1532721 d!160535))

(declare-fun b!1533001 () Bool)

(declare-fun e!854374 () Bool)

(declare-fun e!854373 () Bool)

(assert (=> b!1533001 (= e!854374 e!854373)))

(declare-fun lt!663818 () (_ BitVec 64))

(assert (=> b!1533001 (= lt!663818 (select (arr!49108 a!2804) j!70))))

(declare-fun lt!663817 () Unit!51151)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101782 (_ BitVec 64) (_ BitVec 32)) Unit!51151)

(assert (=> b!1533001 (= lt!663817 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!663818 j!70))))

(declare-fun arrayContainsKey!0 (array!101782 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1533001 (arrayContainsKey!0 a!2804 lt!663818 #b00000000000000000000000000000000)))

(declare-fun lt!663816 () Unit!51151)

(assert (=> b!1533001 (= lt!663816 lt!663817)))

(declare-fun res!1048906 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101782 (_ BitVec 32)) SeekEntryResult!13166)

(assert (=> b!1533001 (= res!1048906 (= (seekEntryOrOpen!0 (select (arr!49108 a!2804) j!70) a!2804 mask!2512) (Found!13166 j!70)))))

(assert (=> b!1533001 (=> (not res!1048906) (not e!854373))))

(declare-fun b!1533002 () Bool)

(declare-fun call!68657 () Bool)

(assert (=> b!1533002 (= e!854373 call!68657)))

(declare-fun d!160537 () Bool)

(declare-fun res!1048907 () Bool)

(declare-fun e!854372 () Bool)

(assert (=> d!160537 (=> res!1048907 e!854372)))

(assert (=> d!160537 (= res!1048907 (bvsge j!70 (size!49659 a!2804)))))

(assert (=> d!160537 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!854372)))

(declare-fun b!1533003 () Bool)

(assert (=> b!1533003 (= e!854372 e!854374)))

(declare-fun c!141615 () Bool)

(assert (=> b!1533003 (= c!141615 (validKeyInArray!0 (select (arr!49108 a!2804) j!70)))))

(declare-fun b!1533004 () Bool)

(assert (=> b!1533004 (= e!854374 call!68657)))

(declare-fun bm!68654 () Bool)

(assert (=> bm!68654 (= call!68657 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(assert (= (and d!160537 (not res!1048907)) b!1533003))

(assert (= (and b!1533003 c!141615) b!1533001))

(assert (= (and b!1533003 (not c!141615)) b!1533004))

(assert (= (and b!1533001 res!1048906) b!1533002))

(assert (= (or b!1533002 b!1533004) bm!68654))

(assert (=> b!1533001 m!1415447))

(declare-fun m!1415675 () Bool)

(assert (=> b!1533001 m!1415675))

(declare-fun m!1415677 () Bool)

(assert (=> b!1533001 m!1415677))

(assert (=> b!1533001 m!1415447))

(declare-fun m!1415679 () Bool)

(assert (=> b!1533001 m!1415679))

(assert (=> b!1533003 m!1415447))

(assert (=> b!1533003 m!1415447))

(assert (=> b!1533003 m!1415475))

(declare-fun m!1415681 () Bool)

(assert (=> bm!68654 m!1415681))

(assert (=> b!1532727 d!160537))

(declare-fun d!160555 () Bool)

(assert (=> d!160555 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!663829 () Unit!51151)

(declare-fun choose!38 (array!101782 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51151)

(assert (=> d!160555 (= lt!663829 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!160555 (validMask!0 mask!2512)))

(assert (=> d!160555 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!663829)))

(declare-fun bs!43909 () Bool)

(assert (= bs!43909 d!160555))

(assert (=> bs!43909 m!1415465))

(declare-fun m!1415691 () Bool)

(assert (=> bs!43909 m!1415691))

(assert (=> bs!43909 m!1415443))

(assert (=> b!1532727 d!160555))

(declare-fun b!1533014 () Bool)

(declare-fun e!854382 () Bool)

(declare-fun e!854381 () Bool)

(assert (=> b!1533014 (= e!854382 e!854381)))

(declare-fun lt!663832 () (_ BitVec 64))

(assert (=> b!1533014 (= lt!663832 (select (arr!49108 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!663831 () Unit!51151)

(assert (=> b!1533014 (= lt!663831 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!663832 #b00000000000000000000000000000000))))

(assert (=> b!1533014 (arrayContainsKey!0 a!2804 lt!663832 #b00000000000000000000000000000000)))

(declare-fun lt!663830 () Unit!51151)

(assert (=> b!1533014 (= lt!663830 lt!663831)))

(declare-fun res!1048913 () Bool)

(assert (=> b!1533014 (= res!1048913 (= (seekEntryOrOpen!0 (select (arr!49108 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13166 #b00000000000000000000000000000000)))))

(assert (=> b!1533014 (=> (not res!1048913) (not e!854381))))

(declare-fun b!1533015 () Bool)

(declare-fun call!68658 () Bool)

(assert (=> b!1533015 (= e!854381 call!68658)))

(declare-fun d!160563 () Bool)

(declare-fun res!1048914 () Bool)

(declare-fun e!854380 () Bool)

(assert (=> d!160563 (=> res!1048914 e!854380)))

(assert (=> d!160563 (= res!1048914 (bvsge #b00000000000000000000000000000000 (size!49659 a!2804)))))

(assert (=> d!160563 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!854380)))

(declare-fun b!1533016 () Bool)

(assert (=> b!1533016 (= e!854380 e!854382)))

(declare-fun c!141619 () Bool)

(assert (=> b!1533016 (= c!141619 (validKeyInArray!0 (select (arr!49108 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1533017 () Bool)

(assert (=> b!1533017 (= e!854382 call!68658)))

(declare-fun bm!68655 () Bool)

(assert (=> bm!68655 (= call!68658 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(assert (= (and d!160563 (not res!1048914)) b!1533016))

(assert (= (and b!1533016 c!141619) b!1533014))

(assert (= (and b!1533016 (not c!141619)) b!1533017))

(assert (= (and b!1533014 res!1048913) b!1533015))

(assert (= (or b!1533015 b!1533017) bm!68655))

(assert (=> b!1533014 m!1415557))

(declare-fun m!1415693 () Bool)

(assert (=> b!1533014 m!1415693))

(declare-fun m!1415695 () Bool)

(assert (=> b!1533014 m!1415695))

(assert (=> b!1533014 m!1415557))

(declare-fun m!1415697 () Bool)

(assert (=> b!1533014 m!1415697))

(assert (=> b!1533016 m!1415557))

(assert (=> b!1533016 m!1415557))

(assert (=> b!1533016 m!1415561))

(declare-fun m!1415699 () Bool)

(assert (=> bm!68655 m!1415699))

(assert (=> b!1532728 d!160563))

(check-sat (not bm!68654) (not b!1532961) (not d!160555) (not b!1532932) (not b!1533016) (not b!1532839) (not d!160509) (not bm!68643) (not d!160501) (not d!160507) (not d!160517) (not b!1532812) (not b!1532860) (not b!1533003) (not b!1533014) (not b!1532813) (not b!1533001) (not b!1532815) (not bm!68655) (not d!160533))
(check-sat)
