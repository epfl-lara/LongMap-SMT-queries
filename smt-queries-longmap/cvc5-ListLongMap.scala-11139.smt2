; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130516 () Bool)

(assert start!130516)

(declare-fun b!1529984 () Bool)

(declare-fun e!852881 () Bool)

(declare-fun e!852883 () Bool)

(assert (=> b!1529984 (= e!852881 (not e!852883))))

(declare-fun res!1046544 () Bool)

(assert (=> b!1529984 (=> res!1046544 e!852883)))

(declare-fun lt!662421 () (_ BitVec 64))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101666 0))(
  ( (array!101667 (arr!49053 (Array (_ BitVec 32) (_ BitVec 64))) (size!49604 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101666)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1529984 (= res!1046544 (or (not (= (select (arr!49053 a!2804) j!70) lt!662421)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49053 a!2804) index!487) (select (arr!49053 a!2804) j!70)) (not (= (select (arr!49053 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!852880 () Bool)

(assert (=> b!1529984 e!852880))

(declare-fun res!1046534 () Bool)

(assert (=> b!1529984 (=> (not res!1046534) (not e!852880))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101666 (_ BitVec 32)) Bool)

(assert (=> b!1529984 (= res!1046534 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51041 0))(
  ( (Unit!51042) )
))
(declare-fun lt!662419 () Unit!51041)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101666 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51041)

(assert (=> b!1529984 (= lt!662419 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1529985 () Bool)

(declare-fun res!1046538 () Bool)

(declare-fun e!852886 () Bool)

(assert (=> b!1529985 (=> (not res!1046538) (not e!852886))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529985 (= res!1046538 (validKeyInArray!0 (select (arr!49053 a!2804) i!961)))))

(declare-fun b!1529986 () Bool)

(declare-fun e!852885 () Bool)

(assert (=> b!1529986 (= e!852885 e!852881)))

(declare-fun res!1046541 () Bool)

(assert (=> b!1529986 (=> (not res!1046541) (not e!852881))))

(declare-datatypes ((SeekEntryResult!13111 0))(
  ( (MissingZero!13111 (index!54839 (_ BitVec 32))) (Found!13111 (index!54840 (_ BitVec 32))) (Intermediate!13111 (undefined!13923 Bool) (index!54841 (_ BitVec 32)) (x!136732 (_ BitVec 32))) (Undefined!13111) (MissingVacant!13111 (index!54842 (_ BitVec 32))) )
))
(declare-fun lt!662416 () SeekEntryResult!13111)

(declare-fun lt!662417 () array!101666)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101666 (_ BitVec 32)) SeekEntryResult!13111)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529986 (= res!1046541 (= lt!662416 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!662421 mask!2512) lt!662421 lt!662417 mask!2512)))))

(assert (=> b!1529986 (= lt!662421 (select (store (arr!49053 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1529986 (= lt!662417 (array!101667 (store (arr!49053 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49604 a!2804)))))

(declare-fun b!1529987 () Bool)

(declare-fun res!1046540 () Bool)

(assert (=> b!1529987 (=> (not res!1046540) (not e!852886))))

(assert (=> b!1529987 (= res!1046540 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49604 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49604 a!2804))))))

(declare-fun b!1529988 () Bool)

(assert (=> b!1529988 (= e!852886 e!852885)))

(declare-fun res!1046533 () Bool)

(assert (=> b!1529988 (=> (not res!1046533) (not e!852885))))

(declare-fun lt!662420 () SeekEntryResult!13111)

(assert (=> b!1529988 (= res!1046533 (= lt!662416 lt!662420))))

(assert (=> b!1529988 (= lt!662420 (Intermediate!13111 false resIndex!21 resX!21))))

(assert (=> b!1529988 (= lt!662416 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49053 a!2804) j!70) mask!2512) (select (arr!49053 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1529989 () Bool)

(declare-fun lt!662415 () SeekEntryResult!13111)

(assert (=> b!1529989 (= e!852883 (= lt!662415 (Found!13111 j!70)))))

(declare-fun e!852882 () Bool)

(assert (=> b!1529989 e!852882))

(declare-fun res!1046543 () Bool)

(assert (=> b!1529989 (=> (not res!1046543) (not e!852882))))

(declare-fun lt!662418 () SeekEntryResult!13111)

(assert (=> b!1529989 (= res!1046543 (= lt!662418 lt!662415))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101666 (_ BitVec 32)) SeekEntryResult!13111)

(assert (=> b!1529989 (= lt!662415 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49053 a!2804) j!70) a!2804 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101666 (_ BitVec 32)) SeekEntryResult!13111)

(assert (=> b!1529989 (= lt!662418 (seekEntryOrOpen!0 (select (arr!49053 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1529990 () Bool)

(declare-fun res!1046535 () Bool)

(assert (=> b!1529990 (=> (not res!1046535) (not e!852886))))

(declare-datatypes ((List!35523 0))(
  ( (Nil!35520) (Cons!35519 (h!36970 (_ BitVec 64)) (t!50209 List!35523)) )
))
(declare-fun arrayNoDuplicates!0 (array!101666 (_ BitVec 32) List!35523) Bool)

(assert (=> b!1529990 (= res!1046535 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35520))))

(declare-fun b!1529991 () Bool)

(declare-fun res!1046532 () Bool)

(assert (=> b!1529991 (=> (not res!1046532) (not e!852886))))

(assert (=> b!1529991 (= res!1046532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1046536 () Bool)

(assert (=> start!130516 (=> (not res!1046536) (not e!852886))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130516 (= res!1046536 (validMask!0 mask!2512))))

(assert (=> start!130516 e!852886))

(assert (=> start!130516 true))

(declare-fun array_inv!38334 (array!101666) Bool)

(assert (=> start!130516 (array_inv!38334 a!2804)))

(declare-fun b!1529992 () Bool)

(declare-fun res!1046542 () Bool)

(assert (=> b!1529992 (=> (not res!1046542) (not e!852886))))

(assert (=> b!1529992 (= res!1046542 (validKeyInArray!0 (select (arr!49053 a!2804) j!70)))))

(declare-fun b!1529993 () Bool)

(declare-fun res!1046537 () Bool)

(assert (=> b!1529993 (=> (not res!1046537) (not e!852885))))

(assert (=> b!1529993 (= res!1046537 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49053 a!2804) j!70) a!2804 mask!2512) lt!662420))))

(declare-fun b!1529994 () Bool)

(assert (=> b!1529994 (= e!852882 (= (seekEntryOrOpen!0 lt!662421 lt!662417 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!662421 lt!662417 mask!2512)))))

(declare-fun b!1529995 () Bool)

(declare-fun res!1046539 () Bool)

(assert (=> b!1529995 (=> (not res!1046539) (not e!852886))))

(assert (=> b!1529995 (= res!1046539 (and (= (size!49604 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49604 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49604 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1529996 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101666 (_ BitVec 32)) SeekEntryResult!13111)

(assert (=> b!1529996 (= e!852880 (= (seekEntry!0 (select (arr!49053 a!2804) j!70) a!2804 mask!2512) (Found!13111 j!70)))))

(assert (= (and start!130516 res!1046536) b!1529995))

(assert (= (and b!1529995 res!1046539) b!1529985))

(assert (= (and b!1529985 res!1046538) b!1529992))

(assert (= (and b!1529992 res!1046542) b!1529991))

(assert (= (and b!1529991 res!1046532) b!1529990))

(assert (= (and b!1529990 res!1046535) b!1529987))

(assert (= (and b!1529987 res!1046540) b!1529988))

(assert (= (and b!1529988 res!1046533) b!1529993))

(assert (= (and b!1529993 res!1046537) b!1529986))

(assert (= (and b!1529986 res!1046541) b!1529984))

(assert (= (and b!1529984 res!1046534) b!1529996))

(assert (= (and b!1529984 (not res!1046544)) b!1529989))

(assert (= (and b!1529989 res!1046543) b!1529994))

(declare-fun m!1412763 () Bool)

(assert (=> b!1529988 m!1412763))

(assert (=> b!1529988 m!1412763))

(declare-fun m!1412765 () Bool)

(assert (=> b!1529988 m!1412765))

(assert (=> b!1529988 m!1412765))

(assert (=> b!1529988 m!1412763))

(declare-fun m!1412767 () Bool)

(assert (=> b!1529988 m!1412767))

(assert (=> b!1529989 m!1412763))

(assert (=> b!1529989 m!1412763))

(declare-fun m!1412769 () Bool)

(assert (=> b!1529989 m!1412769))

(assert (=> b!1529989 m!1412763))

(declare-fun m!1412771 () Bool)

(assert (=> b!1529989 m!1412771))

(declare-fun m!1412773 () Bool)

(assert (=> b!1529994 m!1412773))

(declare-fun m!1412775 () Bool)

(assert (=> b!1529994 m!1412775))

(declare-fun m!1412777 () Bool)

(assert (=> b!1529986 m!1412777))

(assert (=> b!1529986 m!1412777))

(declare-fun m!1412779 () Bool)

(assert (=> b!1529986 m!1412779))

(declare-fun m!1412781 () Bool)

(assert (=> b!1529986 m!1412781))

(declare-fun m!1412783 () Bool)

(assert (=> b!1529986 m!1412783))

(assert (=> b!1529992 m!1412763))

(assert (=> b!1529992 m!1412763))

(declare-fun m!1412785 () Bool)

(assert (=> b!1529992 m!1412785))

(declare-fun m!1412787 () Bool)

(assert (=> b!1529991 m!1412787))

(assert (=> b!1529993 m!1412763))

(assert (=> b!1529993 m!1412763))

(declare-fun m!1412789 () Bool)

(assert (=> b!1529993 m!1412789))

(declare-fun m!1412791 () Bool)

(assert (=> b!1529985 m!1412791))

(assert (=> b!1529985 m!1412791))

(declare-fun m!1412793 () Bool)

(assert (=> b!1529985 m!1412793))

(assert (=> b!1529984 m!1412763))

(declare-fun m!1412795 () Bool)

(assert (=> b!1529984 m!1412795))

(declare-fun m!1412797 () Bool)

(assert (=> b!1529984 m!1412797))

(declare-fun m!1412799 () Bool)

(assert (=> b!1529984 m!1412799))

(declare-fun m!1412801 () Bool)

(assert (=> b!1529990 m!1412801))

(declare-fun m!1412803 () Bool)

(assert (=> start!130516 m!1412803))

(declare-fun m!1412805 () Bool)

(assert (=> start!130516 m!1412805))

(assert (=> b!1529996 m!1412763))

(assert (=> b!1529996 m!1412763))

(declare-fun m!1412807 () Bool)

(assert (=> b!1529996 m!1412807))

(push 1)

(assert (not b!1529992))

(assert (not b!1529991))

(assert (not b!1529986))

(assert (not b!1529990))

(assert (not b!1529996))

(assert (not b!1529989))

(assert (not b!1529984))

(assert (not b!1529988))

(assert (not b!1529985))

(assert (not b!1529993))

(assert (not start!130516))

(assert (not b!1529994))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1530007 () Bool)

(declare-fun e!852898 () Bool)

(declare-fun e!852897 () Bool)

(assert (=> b!1530007 (= e!852898 e!852897)))

(declare-fun c!141292 () Bool)

(assert (=> b!1530007 (= c!141292 (validKeyInArray!0 (select (arr!49053 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1530008 () Bool)

(declare-fun e!852896 () Bool)

(declare-fun contains!10045 (List!35523 (_ BitVec 64)) Bool)

(assert (=> b!1530008 (= e!852896 (contains!10045 Nil!35520 (select (arr!49053 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1530009 () Bool)

(declare-fun e!852895 () Bool)

(assert (=> b!1530009 (= e!852895 e!852898)))

(declare-fun res!1046553 () Bool)

(assert (=> b!1530009 (=> (not res!1046553) (not e!852898))))

(assert (=> b!1530009 (= res!1046553 (not e!852896))))

(declare-fun res!1046552 () Bool)

(assert (=> b!1530009 (=> (not res!1046552) (not e!852896))))

(assert (=> b!1530009 (= res!1046552 (validKeyInArray!0 (select (arr!49053 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!160261 () Bool)

(declare-fun res!1046551 () Bool)

(assert (=> d!160261 (=> res!1046551 e!852895)))

(assert (=> d!160261 (= res!1046551 (bvsge #b00000000000000000000000000000000 (size!49604 a!2804)))))

(assert (=> d!160261 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35520) e!852895)))

(declare-fun bm!68601 () Bool)

(declare-fun call!68604 () Bool)

(assert (=> bm!68601 (= call!68604 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!141292 (Cons!35519 (select (arr!49053 a!2804) #b00000000000000000000000000000000) Nil!35520) Nil!35520)))))

(declare-fun b!1530010 () Bool)

(assert (=> b!1530010 (= e!852897 call!68604)))

(declare-fun b!1530011 () Bool)

(assert (=> b!1530011 (= e!852897 call!68604)))

(assert (= (and d!160261 (not res!1046551)) b!1530009))

(assert (= (and b!1530009 res!1046552) b!1530008))

(assert (= (and b!1530009 res!1046553) b!1530007))

(assert (= (and b!1530007 c!141292) b!1530011))

(assert (= (and b!1530007 (not c!141292)) b!1530010))

(assert (= (or b!1530011 b!1530010) bm!68601))

(declare-fun m!1412809 () Bool)

(assert (=> b!1530007 m!1412809))

(assert (=> b!1530007 m!1412809))

(declare-fun m!1412811 () Bool)

(assert (=> b!1530007 m!1412811))

(assert (=> b!1530008 m!1412809))

(assert (=> b!1530008 m!1412809))

(declare-fun m!1412813 () Bool)

(assert (=> b!1530008 m!1412813))

(assert (=> b!1530009 m!1412809))

(assert (=> b!1530009 m!1412809))

(assert (=> b!1530009 m!1412811))

(assert (=> bm!68601 m!1412809))

(declare-fun m!1412815 () Bool)

(assert (=> bm!68601 m!1412815))

(assert (=> b!1529990 d!160261))

(declare-fun b!1530039 () Bool)

(declare-fun e!852918 () SeekEntryResult!13111)

(assert (=> b!1530039 (= e!852918 (Found!13111 index!487))))

(declare-fun b!1530040 () Bool)

(declare-fun e!852917 () SeekEntryResult!13111)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530040 (= e!852917 (seekKeyOrZeroReturnVacant!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 (bvadd x!534 #b00000000000000000000000000000001) mask!2512) index!487 (select (arr!49053 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530041 () Bool)

(declare-fun c!141303 () Bool)

(declare-fun lt!662426 () (_ BitVec 64))

(assert (=> b!1530041 (= c!141303 (= lt!662426 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1530041 (= e!852918 e!852917)))

(declare-fun lt!662427 () SeekEntryResult!13111)

(declare-fun d!160263 () Bool)

(assert (=> d!160263 (and (or (is-Undefined!13111 lt!662427) (not (is-Found!13111 lt!662427)) (and (bvsge (index!54840 lt!662427) #b00000000000000000000000000000000) (bvslt (index!54840 lt!662427) (size!49604 a!2804)))) (or (is-Undefined!13111 lt!662427) (is-Found!13111 lt!662427) (not (is-MissingVacant!13111 lt!662427)) (not (= (index!54842 lt!662427) index!487)) (and (bvsge (index!54842 lt!662427) #b00000000000000000000000000000000) (bvslt (index!54842 lt!662427) (size!49604 a!2804)))) (or (is-Undefined!13111 lt!662427) (ite (is-Found!13111 lt!662427) (= (select (arr!49053 a!2804) (index!54840 lt!662427)) (select (arr!49053 a!2804) j!70)) (and (is-MissingVacant!13111 lt!662427) (= (index!54842 lt!662427) index!487) (= (select (arr!49053 a!2804) (index!54842 lt!662427)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!852919 () SeekEntryResult!13111)

(assert (=> d!160263 (= lt!662427 e!852919)))

(declare-fun c!141302 () Bool)

(assert (=> d!160263 (= c!141302 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!160263 (= lt!662426 (select (arr!49053 a!2804) index!487))))

(assert (=> d!160263 (validMask!0 mask!2512)))

(assert (=> d!160263 (= (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49053 a!2804) j!70) a!2804 mask!2512) lt!662427)))

(declare-fun b!1530042 () Bool)

(assert (=> b!1530042 (= e!852919 Undefined!13111)))

(declare-fun b!1530043 () Bool)

(assert (=> b!1530043 (= e!852919 e!852918)))

(declare-fun c!141304 () Bool)

(assert (=> b!1530043 (= c!141304 (= lt!662426 (select (arr!49053 a!2804) j!70)))))

(declare-fun b!1530044 () Bool)

(assert (=> b!1530044 (= e!852917 (MissingVacant!13111 index!487))))

(assert (= (and d!160263 c!141302) b!1530042))

(assert (= (and d!160263 (not c!141302)) b!1530043))

(assert (= (and b!1530043 c!141304) b!1530039))

(assert (= (and b!1530043 (not c!141304)) b!1530041))

(assert (= (and b!1530041 c!141303) b!1530044))

(assert (= (and b!1530041 (not c!141303)) b!1530040))

(declare-fun m!1412825 () Bool)

(assert (=> b!1530040 m!1412825))

(assert (=> b!1530040 m!1412825))

(assert (=> b!1530040 m!1412763))

(declare-fun m!1412827 () Bool)

(assert (=> b!1530040 m!1412827))

(declare-fun m!1412829 () Bool)

(assert (=> d!160263 m!1412829))

(declare-fun m!1412831 () Bool)

(assert (=> d!160263 m!1412831))

(assert (=> d!160263 m!1412795))

(assert (=> d!160263 m!1412803))

(assert (=> b!1529989 d!160263))

(declare-fun b!1530075 () Bool)

(declare-fun e!852936 () SeekEntryResult!13111)

(declare-fun e!852935 () SeekEntryResult!13111)

(assert (=> b!1530075 (= e!852936 e!852935)))

(declare-fun lt!662444 () (_ BitVec 64))

(declare-fun lt!662443 () SeekEntryResult!13111)

(assert (=> b!1530075 (= lt!662444 (select (arr!49053 a!2804) (index!54841 lt!662443)))))

(declare-fun c!141321 () Bool)

(assert (=> b!1530075 (= c!141321 (= lt!662444 (select (arr!49053 a!2804) j!70)))))

(declare-fun d!160269 () Bool)

(declare-fun lt!662445 () SeekEntryResult!13111)

(assert (=> d!160269 (and (or (is-Undefined!13111 lt!662445) (not (is-Found!13111 lt!662445)) (and (bvsge (index!54840 lt!662445) #b00000000000000000000000000000000) (bvslt (index!54840 lt!662445) (size!49604 a!2804)))) (or (is-Undefined!13111 lt!662445) (is-Found!13111 lt!662445) (not (is-MissingZero!13111 lt!662445)) (and (bvsge (index!54839 lt!662445) #b00000000000000000000000000000000) (bvslt (index!54839 lt!662445) (size!49604 a!2804)))) (or (is-Undefined!13111 lt!662445) (is-Found!13111 lt!662445) (is-MissingZero!13111 lt!662445) (not (is-MissingVacant!13111 lt!662445)) (and (bvsge (index!54842 lt!662445) #b00000000000000000000000000000000) (bvslt (index!54842 lt!662445) (size!49604 a!2804)))) (or (is-Undefined!13111 lt!662445) (ite (is-Found!13111 lt!662445) (= (select (arr!49053 a!2804) (index!54840 lt!662445)) (select (arr!49053 a!2804) j!70)) (ite (is-MissingZero!13111 lt!662445) (= (select (arr!49053 a!2804) (index!54839 lt!662445)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!13111 lt!662445) (= (select (arr!49053 a!2804) (index!54842 lt!662445)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!160269 (= lt!662445 e!852936)))

(declare-fun c!141322 () Bool)

(assert (=> d!160269 (= c!141322 (and (is-Intermediate!13111 lt!662443) (undefined!13923 lt!662443)))))

(assert (=> d!160269 (= lt!662443 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49053 a!2804) j!70) mask!2512) (select (arr!49053 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!160269 (validMask!0 mask!2512)))

(assert (=> d!160269 (= (seekEntryOrOpen!0 (select (arr!49053 a!2804) j!70) a!2804 mask!2512) lt!662445)))

(declare-fun b!1530076 () Bool)

(assert (=> b!1530076 (= e!852936 Undefined!13111)))

(declare-fun b!1530077 () Bool)

(declare-fun e!852937 () SeekEntryResult!13111)

(assert (=> b!1530077 (= e!852937 (seekKeyOrZeroReturnVacant!0 (x!136732 lt!662443) (index!54841 lt!662443) (index!54841 lt!662443) (select (arr!49053 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530078 () Bool)

(assert (=> b!1530078 (= e!852935 (Found!13111 (index!54841 lt!662443)))))

(declare-fun b!1530079 () Bool)

(assert (=> b!1530079 (= e!852937 (MissingZero!13111 (index!54841 lt!662443)))))

(declare-fun b!1530080 () Bool)

(declare-fun c!141320 () Bool)

(assert (=> b!1530080 (= c!141320 (= lt!662444 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1530080 (= e!852935 e!852937)))

(assert (= (and d!160269 c!141322) b!1530076))

(assert (= (and d!160269 (not c!141322)) b!1530075))

(assert (= (and b!1530075 c!141321) b!1530078))

(assert (= (and b!1530075 (not c!141321)) b!1530080))

(assert (= (and b!1530080 c!141320) b!1530079))

(assert (= (and b!1530080 (not c!141320)) b!1530077))

(declare-fun m!1412843 () Bool)

(assert (=> b!1530075 m!1412843))

(declare-fun m!1412845 () Bool)

(assert (=> d!160269 m!1412845))

(declare-fun m!1412847 () Bool)

(assert (=> d!160269 m!1412847))

(assert (=> d!160269 m!1412803))

(declare-fun m!1412849 () Bool)

(assert (=> d!160269 m!1412849))

(assert (=> d!160269 m!1412763))

(assert (=> d!160269 m!1412765))

(assert (=> d!160269 m!1412765))

(assert (=> d!160269 m!1412763))

(assert (=> d!160269 m!1412767))

(assert (=> b!1530077 m!1412763))

(declare-fun m!1412851 () Bool)

(assert (=> b!1530077 m!1412851))

(assert (=> b!1529989 d!160269))

(declare-fun b!1530129 () Bool)

(declare-fun e!852967 () Bool)

(declare-fun lt!662461 () SeekEntryResult!13111)

(assert (=> b!1530129 (= e!852967 (bvsge (x!136732 lt!662461) #b01111111111111111111111111111110))))

(declare-fun b!1530130 () Bool)

(assert (=> b!1530130 (and (bvsge (index!54841 lt!662461) #b00000000000000000000000000000000) (bvslt (index!54841 lt!662461) (size!49604 a!2804)))))

(declare-fun e!852966 () Bool)

(assert (=> b!1530130 (= e!852966 (= (select (arr!49053 a!2804) (index!54841 lt!662461)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1530131 () Bool)

(assert (=> b!1530131 (and (bvsge (index!54841 lt!662461) #b00000000000000000000000000000000) (bvslt (index!54841 lt!662461) (size!49604 a!2804)))))

(declare-fun res!1046569 () Bool)

(assert (=> b!1530131 (= res!1046569 (= (select (arr!49053 a!2804) (index!54841 lt!662461)) (select (arr!49053 a!2804) j!70)))))

(assert (=> b!1530131 (=> res!1046569 e!852966)))

(declare-fun e!852965 () Bool)

(assert (=> b!1530131 (= e!852965 e!852966)))

(declare-fun b!1530132 () Bool)

(declare-fun e!852963 () SeekEntryResult!13111)

(declare-fun e!852964 () SeekEntryResult!13111)

(assert (=> b!1530132 (= e!852963 e!852964)))

(declare-fun lt!662462 () (_ BitVec 64))

(declare-fun c!141345 () Bool)

(assert (=> b!1530132 (= c!141345 (or (= lt!662462 (select (arr!49053 a!2804) j!70)) (= (bvadd lt!662462 lt!662462) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1530133 () Bool)

(assert (=> b!1530133 (= e!852964 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!49053 a!2804) j!70) mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (arr!49053 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530134 () Bool)

(assert (=> b!1530134 (and (bvsge (index!54841 lt!662461) #b00000000000000000000000000000000) (bvslt (index!54841 lt!662461) (size!49604 a!2804)))))

(declare-fun res!1046570 () Bool)

(assert (=> b!1530134 (= res!1046570 (= (select (arr!49053 a!2804) (index!54841 lt!662461)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1530134 (=> res!1046570 e!852966)))

(declare-fun b!1530135 () Bool)

(assert (=> b!1530135 (= e!852964 (Intermediate!13111 false (toIndex!0 (select (arr!49053 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun d!160273 () Bool)

(assert (=> d!160273 e!852967))

(declare-fun c!141346 () Bool)

(assert (=> d!160273 (= c!141346 (and (is-Intermediate!13111 lt!662461) (undefined!13923 lt!662461)))))

(assert (=> d!160273 (= lt!662461 e!852963)))

(declare-fun c!141344 () Bool)

(assert (=> d!160273 (= c!141344 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!160273 (= lt!662462 (select (arr!49053 a!2804) (toIndex!0 (select (arr!49053 a!2804) j!70) mask!2512)))))

(assert (=> d!160273 (validMask!0 mask!2512)))

(assert (=> d!160273 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49053 a!2804) j!70) mask!2512) (select (arr!49053 a!2804) j!70) a!2804 mask!2512) lt!662461)))

(declare-fun b!1530136 () Bool)

(assert (=> b!1530136 (= e!852967 e!852965)))

(declare-fun res!1046571 () Bool)

(assert (=> b!1530136 (= res!1046571 (and (is-Intermediate!13111 lt!662461) (not (undefined!13923 lt!662461)) (bvslt (x!136732 lt!662461) #b01111111111111111111111111111110) (bvsge (x!136732 lt!662461) #b00000000000000000000000000000000) (bvsge (x!136732 lt!662461) #b00000000000000000000000000000000)))))

(assert (=> b!1530136 (=> (not res!1046571) (not e!852965))))

(declare-fun b!1530137 () Bool)

(assert (=> b!1530137 (= e!852963 (Intermediate!13111 true (toIndex!0 (select (arr!49053 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(assert (= (and d!160273 c!141344) b!1530137))

(assert (= (and d!160273 (not c!141344)) b!1530132))

(assert (= (and b!1530132 c!141345) b!1530135))

(assert (= (and b!1530132 (not c!141345)) b!1530133))

(assert (= (and d!160273 c!141346) b!1530129))

(assert (= (and d!160273 (not c!141346)) b!1530136))

(assert (= (and b!1530136 res!1046571) b!1530131))

(assert (= (and b!1530131 (not res!1046569)) b!1530134))

(assert (= (and b!1530134 (not res!1046570)) b!1530130))

(assert (=> b!1530133 m!1412765))

(declare-fun m!1412879 () Bool)

(assert (=> b!1530133 m!1412879))

(assert (=> b!1530133 m!1412879))

(assert (=> b!1530133 m!1412763))

(declare-fun m!1412881 () Bool)

(assert (=> b!1530133 m!1412881))

(assert (=> d!160273 m!1412765))

(declare-fun m!1412883 () Bool)

(assert (=> d!160273 m!1412883))

(assert (=> d!160273 m!1412803))

(declare-fun m!1412885 () Bool)

(assert (=> b!1530134 m!1412885))

(assert (=> b!1530131 m!1412885))

(assert (=> b!1530130 m!1412885))

(assert (=> b!1529988 d!160273))

(declare-fun d!160283 () Bool)

(declare-fun lt!662472 () (_ BitVec 32))

(declare-fun lt!662471 () (_ BitVec 32))

(assert (=> d!160283 (= lt!662472 (bvmul (bvxor lt!662471 (bvlshr lt!662471 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!160283 (= lt!662471 ((_ extract 31 0) (bvand (bvxor (select (arr!49053 a!2804) j!70) (bvlshr (select (arr!49053 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!160283 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1046572 (let ((h!36971 ((_ extract 31 0) (bvand (bvxor (select (arr!49053 a!2804) j!70) (bvlshr (select (arr!49053 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136736 (bvmul (bvxor h!36971 (bvlshr h!36971 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136736 (bvlshr x!136736 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1046572 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1046572 #b00000000000000000000000000000000))))))

(assert (=> d!160283 (= (toIndex!0 (select (arr!49053 a!2804) j!70) mask!2512) (bvand (bvxor lt!662472 (bvlshr lt!662472 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1529988 d!160283))

(declare-fun b!1530146 () Bool)

(declare-fun e!852976 () Bool)

(declare-fun lt!662473 () SeekEntryResult!13111)

(assert (=> b!1530146 (= e!852976 (bvsge (x!136732 lt!662473) #b01111111111111111111111111111110))))

(declare-fun b!1530147 () Bool)

(assert (=> b!1530147 (and (bvsge (index!54841 lt!662473) #b00000000000000000000000000000000) (bvslt (index!54841 lt!662473) (size!49604 lt!662417)))))

(declare-fun e!852975 () Bool)

(assert (=> b!1530147 (= e!852975 (= (select (arr!49053 lt!662417) (index!54841 lt!662473)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1530148 () Bool)

(assert (=> b!1530148 (and (bvsge (index!54841 lt!662473) #b00000000000000000000000000000000) (bvslt (index!54841 lt!662473) (size!49604 lt!662417)))))

(declare-fun res!1046573 () Bool)

(assert (=> b!1530148 (= res!1046573 (= (select (arr!49053 lt!662417) (index!54841 lt!662473)) lt!662421))))

(assert (=> b!1530148 (=> res!1046573 e!852975)))

(declare-fun e!852974 () Bool)

(assert (=> b!1530148 (= e!852974 e!852975)))

(declare-fun b!1530149 () Bool)

(declare-fun e!852972 () SeekEntryResult!13111)

(declare-fun e!852973 () SeekEntryResult!13111)

(assert (=> b!1530149 (= e!852972 e!852973)))

(declare-fun c!141352 () Bool)

(declare-fun lt!662474 () (_ BitVec 64))

(assert (=> b!1530149 (= c!141352 (or (= lt!662474 lt!662421) (= (bvadd lt!662474 lt!662474) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1530150 () Bool)

(assert (=> b!1530150 (= e!852973 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!662421 mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) lt!662421 lt!662417 mask!2512))))

(declare-fun b!1530151 () Bool)

(assert (=> b!1530151 (and (bvsge (index!54841 lt!662473) #b00000000000000000000000000000000) (bvslt (index!54841 lt!662473) (size!49604 lt!662417)))))

(declare-fun res!1046574 () Bool)

(assert (=> b!1530151 (= res!1046574 (= (select (arr!49053 lt!662417) (index!54841 lt!662473)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1530151 (=> res!1046574 e!852975)))

(declare-fun b!1530152 () Bool)

(assert (=> b!1530152 (= e!852973 (Intermediate!13111 false (toIndex!0 lt!662421 mask!2512) #b00000000000000000000000000000000))))

(declare-fun d!160285 () Bool)

(assert (=> d!160285 e!852976))

(declare-fun c!141353 () Bool)

(assert (=> d!160285 (= c!141353 (and (is-Intermediate!13111 lt!662473) (undefined!13923 lt!662473)))))

(assert (=> d!160285 (= lt!662473 e!852972)))

(declare-fun c!141351 () Bool)

(assert (=> d!160285 (= c!141351 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!160285 (= lt!662474 (select (arr!49053 lt!662417) (toIndex!0 lt!662421 mask!2512)))))

(assert (=> d!160285 (validMask!0 mask!2512)))

(assert (=> d!160285 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!662421 mask!2512) lt!662421 lt!662417 mask!2512) lt!662473)))

(declare-fun b!1530153 () Bool)

(assert (=> b!1530153 (= e!852976 e!852974)))

(declare-fun res!1046575 () Bool)

(assert (=> b!1530153 (= res!1046575 (and (is-Intermediate!13111 lt!662473) (not (undefined!13923 lt!662473)) (bvslt (x!136732 lt!662473) #b01111111111111111111111111111110) (bvsge (x!136732 lt!662473) #b00000000000000000000000000000000) (bvsge (x!136732 lt!662473) #b00000000000000000000000000000000)))))

(assert (=> b!1530153 (=> (not res!1046575) (not e!852974))))

(declare-fun b!1530154 () Bool)

(assert (=> b!1530154 (= e!852972 (Intermediate!13111 true (toIndex!0 lt!662421 mask!2512) #b00000000000000000000000000000000))))

(assert (= (and d!160285 c!141351) b!1530154))

(assert (= (and d!160285 (not c!141351)) b!1530149))

(assert (= (and b!1530149 c!141352) b!1530152))

(assert (= (and b!1530149 (not c!141352)) b!1530150))

(assert (= (and d!160285 c!141353) b!1530146))

(assert (= (and d!160285 (not c!141353)) b!1530153))

(assert (= (and b!1530153 res!1046575) b!1530148))

(assert (= (and b!1530148 (not res!1046573)) b!1530151))

(assert (= (and b!1530151 (not res!1046574)) b!1530147))

(assert (=> b!1530150 m!1412777))

(declare-fun m!1412887 () Bool)

(assert (=> b!1530150 m!1412887))

(assert (=> b!1530150 m!1412887))

(declare-fun m!1412889 () Bool)

(assert (=> b!1530150 m!1412889))

(assert (=> d!160285 m!1412777))

(declare-fun m!1412891 () Bool)

(assert (=> d!160285 m!1412891))

(assert (=> d!160285 m!1412803))

(declare-fun m!1412893 () Bool)

(assert (=> b!1530151 m!1412893))

(assert (=> b!1530148 m!1412893))

(assert (=> b!1530147 m!1412893))

(assert (=> b!1529986 d!160285))

(declare-fun d!160287 () Bool)

(declare-fun lt!662476 () (_ BitVec 32))

(declare-fun lt!662475 () (_ BitVec 32))

(assert (=> d!160287 (= lt!662476 (bvmul (bvxor lt!662475 (bvlshr lt!662475 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!160287 (= lt!662475 ((_ extract 31 0) (bvand (bvxor lt!662421 (bvlshr lt!662421 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!160287 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1046572 (let ((h!36971 ((_ extract 31 0) (bvand (bvxor lt!662421 (bvlshr lt!662421 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136736 (bvmul (bvxor h!36971 (bvlshr h!36971 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136736 (bvlshr x!136736 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1046572 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1046572 #b00000000000000000000000000000000))))))

(assert (=> d!160287 (= (toIndex!0 lt!662421 mask!2512) (bvand (bvxor lt!662476 (bvlshr lt!662476 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1529986 d!160287))

(declare-fun b!1530204 () Bool)

(declare-fun e!853006 () SeekEntryResult!13111)

(declare-fun lt!662499 () SeekEntryResult!13111)

(assert (=> b!1530204 (= e!853006 (MissingZero!13111 (index!54841 lt!662499)))))

(declare-fun b!1530205 () Bool)

(declare-fun e!853005 () SeekEntryResult!13111)

(assert (=> b!1530205 (= e!853005 (Found!13111 (index!54841 lt!662499)))))

(declare-fun b!1530206 () Bool)

(declare-fun c!141371 () Bool)

(declare-fun lt!662501 () (_ BitVec 64))

(assert (=> b!1530206 (= c!141371 (= lt!662501 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1530206 (= e!853005 e!853006)))

(declare-fun b!1530207 () Bool)

(declare-fun e!853004 () SeekEntryResult!13111)

(assert (=> b!1530207 (= e!853004 e!853005)))

(assert (=> b!1530207 (= lt!662501 (select (arr!49053 a!2804) (index!54841 lt!662499)))))

(declare-fun c!141373 () Bool)

(assert (=> b!1530207 (= c!141373 (= lt!662501 (select (arr!49053 a!2804) j!70)))))

(declare-fun d!160289 () Bool)

(declare-fun lt!662502 () SeekEntryResult!13111)

(assert (=> d!160289 (and (or (is-MissingVacant!13111 lt!662502) (not (is-Found!13111 lt!662502)) (and (bvsge (index!54840 lt!662502) #b00000000000000000000000000000000) (bvslt (index!54840 lt!662502) (size!49604 a!2804)))) (not (is-MissingVacant!13111 lt!662502)) (or (not (is-Found!13111 lt!662502)) (= (select (arr!49053 a!2804) (index!54840 lt!662502)) (select (arr!49053 a!2804) j!70))))))

(assert (=> d!160289 (= lt!662502 e!853004)))

(declare-fun c!141372 () Bool)

(assert (=> d!160289 (= c!141372 (and (is-Intermediate!13111 lt!662499) (undefined!13923 lt!662499)))))

(assert (=> d!160289 (= lt!662499 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49053 a!2804) j!70) mask!2512) (select (arr!49053 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!160289 (validMask!0 mask!2512)))

(assert (=> d!160289 (= (seekEntry!0 (select (arr!49053 a!2804) j!70) a!2804 mask!2512) lt!662502)))

(declare-fun b!1530208 () Bool)

(assert (=> b!1530208 (= e!853004 Undefined!13111)))

(declare-fun b!1530209 () Bool)

(declare-fun lt!662500 () SeekEntryResult!13111)

(assert (=> b!1530209 (= e!853006 (ite (is-MissingVacant!13111 lt!662500) (MissingZero!13111 (index!54842 lt!662500)) lt!662500))))

(assert (=> b!1530209 (= lt!662500 (seekKeyOrZeroReturnVacant!0 (x!136732 lt!662499) (index!54841 lt!662499) (index!54841 lt!662499) (select (arr!49053 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and d!160289 c!141372) b!1530208))

(assert (= (and d!160289 (not c!141372)) b!1530207))

(assert (= (and b!1530207 c!141373) b!1530205))

(assert (= (and b!1530207 (not c!141373)) b!1530206))

(assert (= (and b!1530206 c!141371) b!1530204))

(assert (= (and b!1530206 (not c!141371)) b!1530209))

(declare-fun m!1412915 () Bool)

(assert (=> b!1530207 m!1412915))

(declare-fun m!1412917 () Bool)

(assert (=> d!160289 m!1412917))

(assert (=> d!160289 m!1412763))

(assert (=> d!160289 m!1412765))

(assert (=> d!160289 m!1412765))

(assert (=> d!160289 m!1412763))

(assert (=> d!160289 m!1412767))

(assert (=> d!160289 m!1412803))

(assert (=> b!1530209 m!1412763))

(declare-fun m!1412919 () Bool)

(assert (=> b!1530209 m!1412919))

(assert (=> b!1529996 d!160289))

(declare-fun d!160303 () Bool)

(assert (=> d!160303 (= (validKeyInArray!0 (select (arr!49053 a!2804) i!961)) (and (not (= (select (arr!49053 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49053 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1529985 d!160303))

(declare-fun b!1530230 () Bool)

(declare-fun e!853023 () Bool)

(declare-fun call!68613 () Bool)

(assert (=> b!1530230 (= e!853023 call!68613)))

(declare-fun d!160305 () Bool)

(declare-fun res!1046603 () Bool)

(declare-fun e!853024 () Bool)

(assert (=> d!160305 (=> res!1046603 e!853024)))

(assert (=> d!160305 (= res!1046603 (bvsge j!70 (size!49604 a!2804)))))

(assert (=> d!160305 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!853024)))

(declare-fun b!1530231 () Bool)

(declare-fun e!853022 () Bool)

(assert (=> b!1530231 (= e!853022 e!853023)))

(declare-fun lt!662519 () (_ BitVec 64))

(assert (=> b!1530231 (= lt!662519 (select (arr!49053 a!2804) j!70))))

(declare-fun lt!662518 () Unit!51041)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101666 (_ BitVec 64) (_ BitVec 32)) Unit!51041)

(assert (=> b!1530231 (= lt!662518 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!662519 j!70))))

(declare-fun arrayContainsKey!0 (array!101666 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1530231 (arrayContainsKey!0 a!2804 lt!662519 #b00000000000000000000000000000000)))

(declare-fun lt!662520 () Unit!51041)

(assert (=> b!1530231 (= lt!662520 lt!662518)))

(declare-fun res!1046602 () Bool)

(assert (=> b!1530231 (= res!1046602 (= (seekEntryOrOpen!0 (select (arr!49053 a!2804) j!70) a!2804 mask!2512) (Found!13111 j!70)))))

(assert (=> b!1530231 (=> (not res!1046602) (not e!853023))))

(declare-fun bm!68610 () Bool)

(assert (=> bm!68610 (= call!68613 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1530232 () Bool)

(assert (=> b!1530232 (= e!853022 call!68613)))

(declare-fun b!1530233 () Bool)

(assert (=> b!1530233 (= e!853024 e!853022)))

(declare-fun c!141379 () Bool)

(assert (=> b!1530233 (= c!141379 (validKeyInArray!0 (select (arr!49053 a!2804) j!70)))))

(assert (= (and d!160305 (not res!1046603)) b!1530233))

(assert (= (and b!1530233 c!141379) b!1530231))

(assert (= (and b!1530233 (not c!141379)) b!1530232))

(assert (= (and b!1530231 res!1046602) b!1530230))

(assert (= (or b!1530230 b!1530232) bm!68610))

(assert (=> b!1530231 m!1412763))

(declare-fun m!1412929 () Bool)

(assert (=> b!1530231 m!1412929))

(declare-fun m!1412931 () Bool)

(assert (=> b!1530231 m!1412931))

(assert (=> b!1530231 m!1412763))

(assert (=> b!1530231 m!1412771))

(declare-fun m!1412933 () Bool)

(assert (=> bm!68610 m!1412933))

(assert (=> b!1530233 m!1412763))

(assert (=> b!1530233 m!1412763))

(assert (=> b!1530233 m!1412785))

(assert (=> b!1529984 d!160305))

(declare-fun d!160309 () Bool)

(assert (=> d!160309 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!662523 () Unit!51041)

(declare-fun choose!38 (array!101666 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51041)

(assert (=> d!160309 (= lt!662523 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!160309 (validMask!0 mask!2512)))

(assert (=> d!160309 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!662523)))

(declare-fun bs!43838 () Bool)

(assert (= bs!43838 d!160309))

(assert (=> bs!43838 m!1412797))

(declare-fun m!1412935 () Bool)

(assert (=> bs!43838 m!1412935))

(assert (=> bs!43838 m!1412803))

(assert (=> b!1529984 d!160309))

(declare-fun b!1530234 () Bool)

(declare-fun e!853026 () SeekEntryResult!13111)

(declare-fun e!853025 () SeekEntryResult!13111)

(assert (=> b!1530234 (= e!853026 e!853025)))

(declare-fun lt!662525 () (_ BitVec 64))

(declare-fun lt!662524 () SeekEntryResult!13111)

(assert (=> b!1530234 (= lt!662525 (select (arr!49053 lt!662417) (index!54841 lt!662524)))))

(declare-fun c!141381 () Bool)

(assert (=> b!1530234 (= c!141381 (= lt!662525 lt!662421))))

(declare-fun d!160311 () Bool)

(declare-fun lt!662526 () SeekEntryResult!13111)

(assert (=> d!160311 (and (or (is-Undefined!13111 lt!662526) (not (is-Found!13111 lt!662526)) (and (bvsge (index!54840 lt!662526) #b00000000000000000000000000000000) (bvslt (index!54840 lt!662526) (size!49604 lt!662417)))) (or (is-Undefined!13111 lt!662526) (is-Found!13111 lt!662526) (not (is-MissingZero!13111 lt!662526)) (and (bvsge (index!54839 lt!662526) #b00000000000000000000000000000000) (bvslt (index!54839 lt!662526) (size!49604 lt!662417)))) (or (is-Undefined!13111 lt!662526) (is-Found!13111 lt!662526) (is-MissingZero!13111 lt!662526) (not (is-MissingVacant!13111 lt!662526)) (and (bvsge (index!54842 lt!662526) #b00000000000000000000000000000000) (bvslt (index!54842 lt!662526) (size!49604 lt!662417)))) (or (is-Undefined!13111 lt!662526) (ite (is-Found!13111 lt!662526) (= (select (arr!49053 lt!662417) (index!54840 lt!662526)) lt!662421) (ite (is-MissingZero!13111 lt!662526) (= (select (arr!49053 lt!662417) (index!54839 lt!662526)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!13111 lt!662526) (= (select (arr!49053 lt!662417) (index!54842 lt!662526)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!160311 (= lt!662526 e!853026)))

(declare-fun c!141382 () Bool)

(assert (=> d!160311 (= c!141382 (and (is-Intermediate!13111 lt!662524) (undefined!13923 lt!662524)))))

(assert (=> d!160311 (= lt!662524 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!662421 mask!2512) lt!662421 lt!662417 mask!2512))))

(assert (=> d!160311 (validMask!0 mask!2512)))

(assert (=> d!160311 (= (seekEntryOrOpen!0 lt!662421 lt!662417 mask!2512) lt!662526)))

(declare-fun b!1530235 () Bool)

(assert (=> b!1530235 (= e!853026 Undefined!13111)))

(declare-fun e!853027 () SeekEntryResult!13111)

(declare-fun b!1530236 () Bool)

(assert (=> b!1530236 (= e!853027 (seekKeyOrZeroReturnVacant!0 (x!136732 lt!662524) (index!54841 lt!662524) (index!54841 lt!662524) lt!662421 lt!662417 mask!2512))))

(declare-fun b!1530237 () Bool)

(assert (=> b!1530237 (= e!853025 (Found!13111 (index!54841 lt!662524)))))

(declare-fun b!1530238 () Bool)

(assert (=> b!1530238 (= e!853027 (MissingZero!13111 (index!54841 lt!662524)))))

(declare-fun b!1530239 () Bool)

(declare-fun c!141380 () Bool)

(assert (=> b!1530239 (= c!141380 (= lt!662525 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1530239 (= e!853025 e!853027)))

(assert (= (and d!160311 c!141382) b!1530235))

(assert (= (and d!160311 (not c!141382)) b!1530234))

(assert (= (and b!1530234 c!141381) b!1530237))

(assert (= (and b!1530234 (not c!141381)) b!1530239))

(assert (= (and b!1530239 c!141380) b!1530238))

(assert (= (and b!1530239 (not c!141380)) b!1530236))

(declare-fun m!1412937 () Bool)

(assert (=> b!1530234 m!1412937))

(declare-fun m!1412939 () Bool)

(assert (=> d!160311 m!1412939))

(declare-fun m!1412941 () Bool)

(assert (=> d!160311 m!1412941))

(assert (=> d!160311 m!1412803))

(declare-fun m!1412943 () Bool)

(assert (=> d!160311 m!1412943))

(assert (=> d!160311 m!1412777))

(assert (=> d!160311 m!1412777))

(assert (=> d!160311 m!1412779))

(declare-fun m!1412945 () Bool)

(assert (=> b!1530236 m!1412945))

(assert (=> b!1529994 d!160311))

(declare-fun b!1530240 () Bool)

(declare-fun e!853029 () SeekEntryResult!13111)

(assert (=> b!1530240 (= e!853029 (Found!13111 index!487))))

(declare-fun b!1530241 () Bool)

(declare-fun e!853028 () SeekEntryResult!13111)

(assert (=> b!1530241 (= e!853028 (seekKeyOrZeroReturnVacant!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 (bvadd x!534 #b00000000000000000000000000000001) mask!2512) index!487 lt!662421 lt!662417 mask!2512))))

(declare-fun b!1530242 () Bool)

(declare-fun c!141384 () Bool)

(declare-fun lt!662527 () (_ BitVec 64))

(assert (=> b!1530242 (= c!141384 (= lt!662527 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1530242 (= e!853029 e!853028)))

(declare-fun d!160313 () Bool)

(declare-fun lt!662528 () SeekEntryResult!13111)

(assert (=> d!160313 (and (or (is-Undefined!13111 lt!662528) (not (is-Found!13111 lt!662528)) (and (bvsge (index!54840 lt!662528) #b00000000000000000000000000000000) (bvslt (index!54840 lt!662528) (size!49604 lt!662417)))) (or (is-Undefined!13111 lt!662528) (is-Found!13111 lt!662528) (not (is-MissingVacant!13111 lt!662528)) (not (= (index!54842 lt!662528) index!487)) (and (bvsge (index!54842 lt!662528) #b00000000000000000000000000000000) (bvslt (index!54842 lt!662528) (size!49604 lt!662417)))) (or (is-Undefined!13111 lt!662528) (ite (is-Found!13111 lt!662528) (= (select (arr!49053 lt!662417) (index!54840 lt!662528)) lt!662421) (and (is-MissingVacant!13111 lt!662528) (= (index!54842 lt!662528) index!487) (= (select (arr!49053 lt!662417) (index!54842 lt!662528)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!853030 () SeekEntryResult!13111)

(assert (=> d!160313 (= lt!662528 e!853030)))

(declare-fun c!141383 () Bool)

(assert (=> d!160313 (= c!141383 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!160313 (= lt!662527 (select (arr!49053 lt!662417) index!487))))

(assert (=> d!160313 (validMask!0 mask!2512)))

(assert (=> d!160313 (= (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!662421 lt!662417 mask!2512) lt!662528)))

(declare-fun b!1530243 () Bool)

(assert (=> b!1530243 (= e!853030 Undefined!13111)))

(declare-fun b!1530244 () Bool)

(assert (=> b!1530244 (= e!853030 e!853029)))

(declare-fun c!141385 () Bool)

(assert (=> b!1530244 (= c!141385 (= lt!662527 lt!662421))))

(declare-fun b!1530245 () Bool)

(assert (=> b!1530245 (= e!853028 (MissingVacant!13111 index!487))))

(assert (= (and d!160313 c!141383) b!1530243))

(assert (= (and d!160313 (not c!141383)) b!1530244))

(assert (= (and b!1530244 c!141385) b!1530240))

(assert (= (and b!1530244 (not c!141385)) b!1530242))

(assert (= (and b!1530242 c!141384) b!1530245))

(assert (= (and b!1530242 (not c!141384)) b!1530241))

(assert (=> b!1530241 m!1412825))

(assert (=> b!1530241 m!1412825))

(declare-fun m!1412947 () Bool)

(assert (=> b!1530241 m!1412947))

(declare-fun m!1412949 () Bool)

(assert (=> d!160313 m!1412949))

(declare-fun m!1412951 () Bool)

(assert (=> d!160313 m!1412951))

(declare-fun m!1412953 () Bool)

(assert (=> d!160313 m!1412953))

(assert (=> d!160313 m!1412803))

(assert (=> b!1529994 d!160313))

(declare-fun b!1530246 () Bool)

(declare-fun e!853035 () Bool)

(declare-fun lt!662531 () SeekEntryResult!13111)

(assert (=> b!1530246 (= e!853035 (bvsge (x!136732 lt!662531) #b01111111111111111111111111111110))))

(declare-fun b!1530247 () Bool)

(assert (=> b!1530247 (and (bvsge (index!54841 lt!662531) #b00000000000000000000000000000000) (bvslt (index!54841 lt!662531) (size!49604 a!2804)))))

(declare-fun e!853034 () Bool)

(assert (=> b!1530247 (= e!853034 (= (select (arr!49053 a!2804) (index!54841 lt!662531)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1530248 () Bool)

(assert (=> b!1530248 (and (bvsge (index!54841 lt!662531) #b00000000000000000000000000000000) (bvslt (index!54841 lt!662531) (size!49604 a!2804)))))

(declare-fun res!1046604 () Bool)

(assert (=> b!1530248 (= res!1046604 (= (select (arr!49053 a!2804) (index!54841 lt!662531)) (select (arr!49053 a!2804) j!70)))))

(assert (=> b!1530248 (=> res!1046604 e!853034)))

(declare-fun e!853033 () Bool)

(assert (=> b!1530248 (= e!853033 e!853034)))

(declare-fun b!1530249 () Bool)

(declare-fun e!853031 () SeekEntryResult!13111)

(declare-fun e!853032 () SeekEntryResult!13111)

(assert (=> b!1530249 (= e!853031 e!853032)))

(declare-fun c!141387 () Bool)

(declare-fun lt!662532 () (_ BitVec 64))

(assert (=> b!1530249 (= c!141387 (or (= lt!662532 (select (arr!49053 a!2804) j!70)) (= (bvadd lt!662532 lt!662532) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1530250 () Bool)

(assert (=> b!1530250 (= e!853032 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 (bvadd x!534 #b00000000000000000000000000000001) mask!2512) (select (arr!49053 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530251 () Bool)

(assert (=> b!1530251 (and (bvsge (index!54841 lt!662531) #b00000000000000000000000000000000) (bvslt (index!54841 lt!662531) (size!49604 a!2804)))))

(declare-fun res!1046605 () Bool)

(assert (=> b!1530251 (= res!1046605 (= (select (arr!49053 a!2804) (index!54841 lt!662531)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1530251 (=> res!1046605 e!853034)))

(declare-fun b!1530252 () Bool)

(assert (=> b!1530252 (= e!853032 (Intermediate!13111 false index!487 x!534))))

(declare-fun d!160315 () Bool)

(assert (=> d!160315 e!853035))

(declare-fun c!141388 () Bool)

(assert (=> d!160315 (= c!141388 (and (is-Intermediate!13111 lt!662531) (undefined!13923 lt!662531)))))

(assert (=> d!160315 (= lt!662531 e!853031)))

(declare-fun c!141386 () Bool)

(assert (=> d!160315 (= c!141386 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!160315 (= lt!662532 (select (arr!49053 a!2804) index!487))))

(assert (=> d!160315 (validMask!0 mask!2512)))

(assert (=> d!160315 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49053 a!2804) j!70) a!2804 mask!2512) lt!662531)))

(declare-fun b!1530253 () Bool)

(assert (=> b!1530253 (= e!853035 e!853033)))

(declare-fun res!1046606 () Bool)

(assert (=> b!1530253 (= res!1046606 (and (is-Intermediate!13111 lt!662531) (not (undefined!13923 lt!662531)) (bvslt (x!136732 lt!662531) #b01111111111111111111111111111110) (bvsge (x!136732 lt!662531) #b00000000000000000000000000000000) (bvsge (x!136732 lt!662531) x!534)))))

(assert (=> b!1530253 (=> (not res!1046606) (not e!853033))))

(declare-fun b!1530254 () Bool)

(assert (=> b!1530254 (= e!853031 (Intermediate!13111 true index!487 x!534))))

(assert (= (and d!160315 c!141386) b!1530254))

(assert (= (and d!160315 (not c!141386)) b!1530249))

(assert (= (and b!1530249 c!141387) b!1530252))

(assert (= (and b!1530249 (not c!141387)) b!1530250))

(assert (= (and d!160315 c!141388) b!1530246))

(assert (= (and d!160315 (not c!141388)) b!1530253))

(assert (= (and b!1530253 res!1046606) b!1530248))

(assert (= (and b!1530248 (not res!1046604)) b!1530251))

(assert (= (and b!1530251 (not res!1046605)) b!1530247))

(assert (=> b!1530250 m!1412825))

(assert (=> b!1530250 m!1412825))

(assert (=> b!1530250 m!1412763))

(declare-fun m!1412955 () Bool)

(assert (=> b!1530250 m!1412955))

(assert (=> d!160315 m!1412795))

(assert (=> d!160315 m!1412803))

(declare-fun m!1412957 () Bool)

(assert (=> b!1530251 m!1412957))

(assert (=> b!1530248 m!1412957))

(assert (=> b!1530247 m!1412957))

(assert (=> b!1529993 d!160315))

(declare-fun d!160317 () Bool)

(assert (=> d!160317 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!130516 d!160317))

(declare-fun d!160321 () Bool)

(assert (=> d!160321 (= (array_inv!38334 a!2804) (bvsge (size!49604 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!130516 d!160321))

(declare-fun d!160323 () Bool)

(assert (=> d!160323 (= (validKeyInArray!0 (select (arr!49053 a!2804) j!70)) (and (not (= (select (arr!49053 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49053 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1529992 d!160323))

(declare-fun b!1530273 () Bool)

(declare-fun e!853046 () Bool)

(declare-fun call!68614 () Bool)

(assert (=> b!1530273 (= e!853046 call!68614)))

(declare-fun d!160325 () Bool)

(declare-fun res!1046608 () Bool)

(declare-fun e!853047 () Bool)

(assert (=> d!160325 (=> res!1046608 e!853047)))

(assert (=> d!160325 (= res!1046608 (bvsge #b00000000000000000000000000000000 (size!49604 a!2804)))))

(assert (=> d!160325 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!853047)))

(declare-fun b!1530274 () Bool)

(declare-fun e!853045 () Bool)

(assert (=> b!1530274 (= e!853045 e!853046)))

(declare-fun lt!662544 () (_ BitVec 64))

(assert (=> b!1530274 (= lt!662544 (select (arr!49053 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!662543 () Unit!51041)

(assert (=> b!1530274 (= lt!662543 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!662544 #b00000000000000000000000000000000))))

(assert (=> b!1530274 (arrayContainsKey!0 a!2804 lt!662544 #b00000000000000000000000000000000)))

(declare-fun lt!662545 () Unit!51041)

(assert (=> b!1530274 (= lt!662545 lt!662543)))

(declare-fun res!1046607 () Bool)

(assert (=> b!1530274 (= res!1046607 (= (seekEntryOrOpen!0 (select (arr!49053 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13111 #b00000000000000000000000000000000)))))

(assert (=> b!1530274 (=> (not res!1046607) (not e!853046))))

(declare-fun bm!68611 () Bool)

(assert (=> bm!68611 (= call!68614 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1530275 () Bool)

(assert (=> b!1530275 (= e!853045 call!68614)))

(declare-fun b!1530276 () Bool)

(assert (=> b!1530276 (= e!853047 e!853045)))

(declare-fun c!141398 () Bool)

(assert (=> b!1530276 (= c!141398 (validKeyInArray!0 (select (arr!49053 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!160325 (not res!1046608)) b!1530276))

(assert (= (and b!1530276 c!141398) b!1530274))

(assert (= (and b!1530276 (not c!141398)) b!1530275))

(assert (= (and b!1530274 res!1046607) b!1530273))

(assert (= (or b!1530273 b!1530275) bm!68611))

(assert (=> b!1530274 m!1412809))

(declare-fun m!1412965 () Bool)

(assert (=> b!1530274 m!1412965))

(declare-fun m!1412967 () Bool)

(assert (=> b!1530274 m!1412967))

(assert (=> b!1530274 m!1412809))

(declare-fun m!1412969 () Bool)

(assert (=> b!1530274 m!1412969))

(declare-fun m!1412971 () Bool)

(assert (=> bm!68611 m!1412971))

(assert (=> b!1530276 m!1412809))

(assert (=> b!1530276 m!1412809))

(assert (=> b!1530276 m!1412811))

(assert (=> b!1529991 d!160325))

(push 1)

(assert (not bm!68610))

(assert (not b!1530233))

(assert (not b!1530276))

(assert (not b!1530209))

(assert (not b!1530241))

(assert (not d!160285))

(assert (not b!1530231))

(assert (not d!160269))

(assert (not b!1530009))

(assert (not d!160263))

(assert (not bm!68611))

(assert (not b!1530077))

(assert (not d!160309))

(assert (not b!1530274))

(assert (not b!1530007))

(assert (not b!1530040))

(assert (not d!160313))

(assert (not d!160273))

(assert (not b!1530008))

(assert (not b!1530133))

(assert (not b!1530250))

(assert (not b!1530150))

(assert (not bm!68601))

(assert (not d!160311))

(assert (not b!1530236))

(assert (not d!160315))

(assert (not d!160289))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

