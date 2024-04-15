; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129384 () Bool)

(assert start!129384)

(declare-fun b!1519833 () Bool)

(declare-fun res!1039631 () Bool)

(declare-fun e!847760 () Bool)

(assert (=> b!1519833 (=> (not res!1039631) (not e!847760))))

(declare-datatypes ((array!101161 0))(
  ( (array!101162 (arr!48817 (Array (_ BitVec 32) (_ BitVec 64))) (size!49369 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101161)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1519833 (= res!1039631 (validKeyInArray!0 (select (arr!48817 a!2804) j!70)))))

(declare-fun b!1519834 () Bool)

(declare-fun e!847759 () Bool)

(assert (=> b!1519834 (= e!847760 e!847759)))

(declare-fun res!1039632 () Bool)

(assert (=> b!1519834 (=> (not res!1039632) (not e!847759))))

(declare-datatypes ((SeekEntryResult!13011 0))(
  ( (MissingZero!13011 (index!54439 (_ BitVec 32))) (Found!13011 (index!54440 (_ BitVec 32))) (Intermediate!13011 (undefined!13823 Bool) (index!54441 (_ BitVec 32)) (x!136117 (_ BitVec 32))) (Undefined!13011) (MissingVacant!13011 (index!54442 (_ BitVec 32))) )
))
(declare-fun lt!658668 () SeekEntryResult!13011)

(declare-fun lt!658667 () SeekEntryResult!13011)

(assert (=> b!1519834 (= res!1039632 (= lt!658668 lt!658667))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1519834 (= lt!658667 (Intermediate!13011 false resIndex!21 resX!21))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101161 (_ BitVec 32)) SeekEntryResult!13011)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519834 (= lt!658668 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48817 a!2804) j!70) mask!2512) (select (arr!48817 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519835 () Bool)

(declare-fun res!1039635 () Bool)

(assert (=> b!1519835 (=> (not res!1039635) (not e!847760))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101161 (_ BitVec 32)) Bool)

(assert (=> b!1519835 (= res!1039635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1519836 () Bool)

(declare-fun res!1039630 () Bool)

(assert (=> b!1519836 (=> (not res!1039630) (not e!847759))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1519836 (= res!1039630 (= lt!658668 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48817 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48817 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101162 (store (arr!48817 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49369 a!2804)) mask!2512)))))

(declare-fun e!847761 () Bool)

(declare-fun b!1519837 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101161 (_ BitVec 32)) SeekEntryResult!13011)

(assert (=> b!1519837 (= e!847761 (= (seekEntry!0 (select (arr!48817 a!2804) j!70) a!2804 mask!2512) (Found!13011 j!70)))))

(declare-fun res!1039633 () Bool)

(assert (=> start!129384 (=> (not res!1039633) (not e!847760))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129384 (= res!1039633 (validMask!0 mask!2512))))

(assert (=> start!129384 e!847760))

(assert (=> start!129384 true))

(declare-fun array_inv!38050 (array!101161) Bool)

(assert (=> start!129384 (array_inv!38050 a!2804)))

(declare-fun b!1519838 () Bool)

(declare-fun res!1039637 () Bool)

(assert (=> b!1519838 (=> (not res!1039637) (not e!847759))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1519838 (= res!1039637 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48817 a!2804) j!70) a!2804 mask!2512) lt!658667))))

(declare-fun b!1519839 () Bool)

(assert (=> b!1519839 (= e!847759 (not (or (not (= (select (arr!48817 a!2804) j!70) (select (store (arr!48817 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (not (= (select (arr!48817 a!2804) index!487) (select (arr!48817 a!2804) j!70))) (= j!70 index!487))))))

(assert (=> b!1519839 e!847761))

(declare-fun res!1039636 () Bool)

(assert (=> b!1519839 (=> (not res!1039636) (not e!847761))))

(assert (=> b!1519839 (= res!1039636 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50729 0))(
  ( (Unit!50730) )
))
(declare-fun lt!658666 () Unit!50729)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101161 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50729)

(assert (=> b!1519839 (= lt!658666 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1519840 () Bool)

(declare-fun res!1039627 () Bool)

(assert (=> b!1519840 (=> (not res!1039627) (not e!847760))))

(assert (=> b!1519840 (= res!1039627 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49369 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49369 a!2804))))))

(declare-fun b!1519841 () Bool)

(declare-fun res!1039628 () Bool)

(assert (=> b!1519841 (=> (not res!1039628) (not e!847760))))

(assert (=> b!1519841 (= res!1039628 (and (= (size!49369 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49369 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49369 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1519842 () Bool)

(declare-fun res!1039629 () Bool)

(assert (=> b!1519842 (=> (not res!1039629) (not e!847760))))

(declare-datatypes ((List!35378 0))(
  ( (Nil!35375) (Cons!35374 (h!36790 (_ BitVec 64)) (t!50064 List!35378)) )
))
(declare-fun arrayNoDuplicates!0 (array!101161 (_ BitVec 32) List!35378) Bool)

(assert (=> b!1519842 (= res!1039629 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35375))))

(declare-fun b!1519843 () Bool)

(declare-fun res!1039634 () Bool)

(assert (=> b!1519843 (=> (not res!1039634) (not e!847760))))

(assert (=> b!1519843 (= res!1039634 (validKeyInArray!0 (select (arr!48817 a!2804) i!961)))))

(assert (= (and start!129384 res!1039633) b!1519841))

(assert (= (and b!1519841 res!1039628) b!1519843))

(assert (= (and b!1519843 res!1039634) b!1519833))

(assert (= (and b!1519833 res!1039631) b!1519835))

(assert (= (and b!1519835 res!1039635) b!1519842))

(assert (= (and b!1519842 res!1039629) b!1519840))

(assert (= (and b!1519840 res!1039627) b!1519834))

(assert (= (and b!1519834 res!1039632) b!1519838))

(assert (= (and b!1519838 res!1039637) b!1519836))

(assert (= (and b!1519836 res!1039630) b!1519839))

(assert (= (and b!1519839 res!1039636) b!1519837))

(declare-fun m!1402599 () Bool)

(assert (=> b!1519842 m!1402599))

(declare-fun m!1402601 () Bool)

(assert (=> b!1519836 m!1402601))

(declare-fun m!1402603 () Bool)

(assert (=> b!1519836 m!1402603))

(assert (=> b!1519836 m!1402603))

(declare-fun m!1402605 () Bool)

(assert (=> b!1519836 m!1402605))

(assert (=> b!1519836 m!1402605))

(assert (=> b!1519836 m!1402603))

(declare-fun m!1402607 () Bool)

(assert (=> b!1519836 m!1402607))

(declare-fun m!1402609 () Bool)

(assert (=> b!1519833 m!1402609))

(assert (=> b!1519833 m!1402609))

(declare-fun m!1402611 () Bool)

(assert (=> b!1519833 m!1402611))

(assert (=> b!1519838 m!1402609))

(assert (=> b!1519838 m!1402609))

(declare-fun m!1402613 () Bool)

(assert (=> b!1519838 m!1402613))

(declare-fun m!1402615 () Bool)

(assert (=> start!129384 m!1402615))

(declare-fun m!1402617 () Bool)

(assert (=> start!129384 m!1402617))

(declare-fun m!1402619 () Bool)

(assert (=> b!1519843 m!1402619))

(assert (=> b!1519843 m!1402619))

(declare-fun m!1402621 () Bool)

(assert (=> b!1519843 m!1402621))

(assert (=> b!1519837 m!1402609))

(assert (=> b!1519837 m!1402609))

(declare-fun m!1402623 () Bool)

(assert (=> b!1519837 m!1402623))

(assert (=> b!1519839 m!1402609))

(declare-fun m!1402625 () Bool)

(assert (=> b!1519839 m!1402625))

(assert (=> b!1519839 m!1402601))

(declare-fun m!1402627 () Bool)

(assert (=> b!1519839 m!1402627))

(assert (=> b!1519839 m!1402603))

(declare-fun m!1402629 () Bool)

(assert (=> b!1519839 m!1402629))

(declare-fun m!1402631 () Bool)

(assert (=> b!1519835 m!1402631))

(assert (=> b!1519834 m!1402609))

(assert (=> b!1519834 m!1402609))

(declare-fun m!1402633 () Bool)

(assert (=> b!1519834 m!1402633))

(assert (=> b!1519834 m!1402633))

(assert (=> b!1519834 m!1402609))

(declare-fun m!1402635 () Bool)

(assert (=> b!1519834 m!1402635))

(check-sat (not start!129384) (not b!1519834) (not b!1519835) (not b!1519833) (not b!1519836) (not b!1519843) (not b!1519839) (not b!1519842) (not b!1519838) (not b!1519837))
(check-sat)
(get-model)

(declare-fun d!158601 () Bool)

(declare-fun res!1039708 () Bool)

(declare-fun e!847793 () Bool)

(assert (=> d!158601 (=> res!1039708 e!847793)))

(assert (=> d!158601 (= res!1039708 (bvsge #b00000000000000000000000000000000 (size!49369 a!2804)))))

(assert (=> d!158601 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!847793)))

(declare-fun b!1519918 () Bool)

(declare-fun e!847792 () Bool)

(declare-fun e!847794 () Bool)

(assert (=> b!1519918 (= e!847792 e!847794)))

(declare-fun lt!658693 () (_ BitVec 64))

(assert (=> b!1519918 (= lt!658693 (select (arr!48817 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!658695 () Unit!50729)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101161 (_ BitVec 64) (_ BitVec 32)) Unit!50729)

(assert (=> b!1519918 (= lt!658695 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!658693 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101161 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1519918 (arrayContainsKey!0 a!2804 lt!658693 #b00000000000000000000000000000000)))

(declare-fun lt!658694 () Unit!50729)

(assert (=> b!1519918 (= lt!658694 lt!658695)))

(declare-fun res!1039709 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101161 (_ BitVec 32)) SeekEntryResult!13011)

(assert (=> b!1519918 (= res!1039709 (= (seekEntryOrOpen!0 (select (arr!48817 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13011 #b00000000000000000000000000000000)))))

(assert (=> b!1519918 (=> (not res!1039709) (not e!847794))))

(declare-fun bm!68300 () Bool)

(declare-fun call!68303 () Bool)

(assert (=> bm!68300 (= call!68303 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1519919 () Bool)

(assert (=> b!1519919 (= e!847794 call!68303)))

(declare-fun b!1519920 () Bool)

(assert (=> b!1519920 (= e!847792 call!68303)))

(declare-fun b!1519921 () Bool)

(assert (=> b!1519921 (= e!847793 e!847792)))

(declare-fun c!139651 () Bool)

(assert (=> b!1519921 (= c!139651 (validKeyInArray!0 (select (arr!48817 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!158601 (not res!1039708)) b!1519921))

(assert (= (and b!1519921 c!139651) b!1519918))

(assert (= (and b!1519921 (not c!139651)) b!1519920))

(assert (= (and b!1519918 res!1039709) b!1519919))

(assert (= (or b!1519919 b!1519920) bm!68300))

(declare-fun m!1402713 () Bool)

(assert (=> b!1519918 m!1402713))

(declare-fun m!1402715 () Bool)

(assert (=> b!1519918 m!1402715))

(declare-fun m!1402717 () Bool)

(assert (=> b!1519918 m!1402717))

(assert (=> b!1519918 m!1402713))

(declare-fun m!1402719 () Bool)

(assert (=> b!1519918 m!1402719))

(declare-fun m!1402721 () Bool)

(assert (=> bm!68300 m!1402721))

(assert (=> b!1519921 m!1402713))

(assert (=> b!1519921 m!1402713))

(declare-fun m!1402723 () Bool)

(assert (=> b!1519921 m!1402723))

(assert (=> b!1519835 d!158601))

(declare-fun d!158603 () Bool)

(assert (=> d!158603 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!129384 d!158603))

(declare-fun d!158609 () Bool)

(assert (=> d!158609 (= (array_inv!38050 a!2804) (bvsge (size!49369 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!129384 d!158609))

(declare-fun b!1519987 () Bool)

(declare-fun lt!658730 () SeekEntryResult!13011)

(assert (=> b!1519987 (and (bvsge (index!54441 lt!658730) #b00000000000000000000000000000000) (bvslt (index!54441 lt!658730) (size!49369 (array!101162 (store (arr!48817 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49369 a!2804)))))))

(declare-fun res!1039743 () Bool)

(assert (=> b!1519987 (= res!1039743 (= (select (arr!48817 (array!101162 (store (arr!48817 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49369 a!2804))) (index!54441 lt!658730)) (select (store (arr!48817 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(declare-fun e!847844 () Bool)

(assert (=> b!1519987 (=> res!1039743 e!847844)))

(declare-fun e!847845 () Bool)

(assert (=> b!1519987 (= e!847845 e!847844)))

(declare-fun b!1519988 () Bool)

(assert (=> b!1519988 (and (bvsge (index!54441 lt!658730) #b00000000000000000000000000000000) (bvslt (index!54441 lt!658730) (size!49369 (array!101162 (store (arr!48817 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49369 a!2804)))))))

(declare-fun res!1039742 () Bool)

(assert (=> b!1519988 (= res!1039742 (= (select (arr!48817 (array!101162 (store (arr!48817 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49369 a!2804))) (index!54441 lt!658730)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1519988 (=> res!1039742 e!847844)))

(declare-fun b!1519989 () Bool)

(declare-fun e!847841 () SeekEntryResult!13011)

(declare-fun e!847843 () SeekEntryResult!13011)

(assert (=> b!1519989 (= e!847841 e!847843)))

(declare-fun lt!658731 () (_ BitVec 64))

(declare-fun c!139670 () Bool)

(assert (=> b!1519989 (= c!139670 (or (= lt!658731 (select (store (arr!48817 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!658731 lt!658731) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!158611 () Bool)

(declare-fun e!847842 () Bool)

(assert (=> d!158611 e!847842))

(declare-fun c!139671 () Bool)

(get-info :version)

(assert (=> d!158611 (= c!139671 (and ((_ is Intermediate!13011) lt!658730) (undefined!13823 lt!658730)))))

(assert (=> d!158611 (= lt!658730 e!847841)))

(declare-fun c!139669 () Bool)

(assert (=> d!158611 (= c!139669 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!158611 (= lt!658731 (select (arr!48817 (array!101162 (store (arr!48817 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49369 a!2804))) (toIndex!0 (select (store (arr!48817 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!158611 (validMask!0 mask!2512)))

(assert (=> d!158611 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48817 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48817 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101162 (store (arr!48817 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49369 a!2804)) mask!2512) lt!658730)))

(declare-fun b!1519990 () Bool)

(assert (=> b!1519990 (= e!847842 e!847845)))

(declare-fun res!1039741 () Bool)

(assert (=> b!1519990 (= res!1039741 (and ((_ is Intermediate!13011) lt!658730) (not (undefined!13823 lt!658730)) (bvslt (x!136117 lt!658730) #b01111111111111111111111111111110) (bvsge (x!136117 lt!658730) #b00000000000000000000000000000000) (bvsge (x!136117 lt!658730) #b00000000000000000000000000000000)))))

(assert (=> b!1519990 (=> (not res!1039741) (not e!847845))))

(declare-fun b!1519991 () Bool)

(assert (=> b!1519991 (= e!847843 (Intermediate!13011 false (toIndex!0 (select (store (arr!48817 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1519992 () Bool)

(assert (=> b!1519992 (and (bvsge (index!54441 lt!658730) #b00000000000000000000000000000000) (bvslt (index!54441 lt!658730) (size!49369 (array!101162 (store (arr!48817 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49369 a!2804)))))))

(assert (=> b!1519992 (= e!847844 (= (select (arr!48817 (array!101162 (store (arr!48817 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49369 a!2804))) (index!54441 lt!658730)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1519993 () Bool)

(assert (=> b!1519993 (= e!847841 (Intermediate!13011 true (toIndex!0 (select (store (arr!48817 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1519994 () Bool)

(assert (=> b!1519994 (= e!847842 (bvsge (x!136117 lt!658730) #b01111111111111111111111111111110))))

(declare-fun b!1519995 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519995 (= e!847843 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!48817 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (store (arr!48817 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101162 (store (arr!48817 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49369 a!2804)) mask!2512))))

(assert (= (and d!158611 c!139669) b!1519993))

(assert (= (and d!158611 (not c!139669)) b!1519989))

(assert (= (and b!1519989 c!139670) b!1519991))

(assert (= (and b!1519989 (not c!139670)) b!1519995))

(assert (= (and d!158611 c!139671) b!1519994))

(assert (= (and d!158611 (not c!139671)) b!1519990))

(assert (= (and b!1519990 res!1039741) b!1519987))

(assert (= (and b!1519987 (not res!1039743)) b!1519988))

(assert (= (and b!1519988 (not res!1039742)) b!1519992))

(assert (=> b!1519995 m!1402605))

(declare-fun m!1402773 () Bool)

(assert (=> b!1519995 m!1402773))

(assert (=> b!1519995 m!1402773))

(assert (=> b!1519995 m!1402603))

(declare-fun m!1402775 () Bool)

(assert (=> b!1519995 m!1402775))

(assert (=> d!158611 m!1402605))

(declare-fun m!1402777 () Bool)

(assert (=> d!158611 m!1402777))

(assert (=> d!158611 m!1402615))

(declare-fun m!1402779 () Bool)

(assert (=> b!1519988 m!1402779))

(assert (=> b!1519992 m!1402779))

(assert (=> b!1519987 m!1402779))

(assert (=> b!1519836 d!158611))

(declare-fun d!158629 () Bool)

(declare-fun lt!658737 () (_ BitVec 32))

(declare-fun lt!658736 () (_ BitVec 32))

(assert (=> d!158629 (= lt!658737 (bvmul (bvxor lt!658736 (bvlshr lt!658736 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158629 (= lt!658736 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48817 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48817 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158629 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1039744 (let ((h!36793 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48817 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48817 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136121 (bvmul (bvxor h!36793 (bvlshr h!36793 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136121 (bvlshr x!136121 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1039744 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1039744 #b00000000000000000000000000000000))))))

(assert (=> d!158629 (= (toIndex!0 (select (store (arr!48817 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!658737 (bvlshr lt!658737 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1519836 d!158629))

(declare-fun d!158631 () Bool)

(declare-fun res!1039757 () Bool)

(declare-fun e!847865 () Bool)

(assert (=> d!158631 (=> res!1039757 e!847865)))

(assert (=> d!158631 (= res!1039757 (bvsge #b00000000000000000000000000000000 (size!49369 a!2804)))))

(assert (=> d!158631 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35375) e!847865)))

(declare-fun b!1520024 () Bool)

(declare-fun e!847867 () Bool)

(declare-fun e!847866 () Bool)

(assert (=> b!1520024 (= e!847867 e!847866)))

(declare-fun c!139680 () Bool)

(assert (=> b!1520024 (= c!139680 (validKeyInArray!0 (select (arr!48817 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1520025 () Bool)

(declare-fun call!68317 () Bool)

(assert (=> b!1520025 (= e!847866 call!68317)))

(declare-fun b!1520026 () Bool)

(assert (=> b!1520026 (= e!847865 e!847867)))

(declare-fun res!1039758 () Bool)

(assert (=> b!1520026 (=> (not res!1039758) (not e!847867))))

(declare-fun e!847864 () Bool)

(assert (=> b!1520026 (= res!1039758 (not e!847864))))

(declare-fun res!1039759 () Bool)

(assert (=> b!1520026 (=> (not res!1039759) (not e!847864))))

(assert (=> b!1520026 (= res!1039759 (validKeyInArray!0 (select (arr!48817 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1520027 () Bool)

(declare-fun contains!9945 (List!35378 (_ BitVec 64)) Bool)

(assert (=> b!1520027 (= e!847864 (contains!9945 Nil!35375 (select (arr!48817 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1520028 () Bool)

(assert (=> b!1520028 (= e!847866 call!68317)))

(declare-fun bm!68314 () Bool)

(assert (=> bm!68314 (= call!68317 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139680 (Cons!35374 (select (arr!48817 a!2804) #b00000000000000000000000000000000) Nil!35375) Nil!35375)))))

(assert (= (and d!158631 (not res!1039757)) b!1520026))

(assert (= (and b!1520026 res!1039759) b!1520027))

(assert (= (and b!1520026 res!1039758) b!1520024))

(assert (= (and b!1520024 c!139680) b!1520025))

(assert (= (and b!1520024 (not c!139680)) b!1520028))

(assert (= (or b!1520025 b!1520028) bm!68314))

(assert (=> b!1520024 m!1402713))

(assert (=> b!1520024 m!1402713))

(assert (=> b!1520024 m!1402723))

(assert (=> b!1520026 m!1402713))

(assert (=> b!1520026 m!1402713))

(assert (=> b!1520026 m!1402723))

(assert (=> b!1520027 m!1402713))

(assert (=> b!1520027 m!1402713))

(declare-fun m!1402781 () Bool)

(assert (=> b!1520027 m!1402781))

(assert (=> bm!68314 m!1402713))

(declare-fun m!1402783 () Bool)

(assert (=> bm!68314 m!1402783))

(assert (=> b!1519842 d!158631))

(declare-fun b!1520086 () Bool)

(declare-fun e!847900 () SeekEntryResult!13011)

(declare-fun e!847899 () SeekEntryResult!13011)

(assert (=> b!1520086 (= e!847900 e!847899)))

(declare-fun lt!658771 () (_ BitVec 64))

(declare-fun lt!658769 () SeekEntryResult!13011)

(assert (=> b!1520086 (= lt!658771 (select (arr!48817 a!2804) (index!54441 lt!658769)))))

(declare-fun c!139702 () Bool)

(assert (=> b!1520086 (= c!139702 (= lt!658771 (select (arr!48817 a!2804) j!70)))))

(declare-fun b!1520087 () Bool)

(declare-fun c!139703 () Bool)

(assert (=> b!1520087 (= c!139703 (= lt!658771 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!847901 () SeekEntryResult!13011)

(assert (=> b!1520087 (= e!847899 e!847901)))

(declare-fun b!1520088 () Bool)

(declare-fun lt!658770 () SeekEntryResult!13011)

(assert (=> b!1520088 (= e!847901 (ite ((_ is MissingVacant!13011) lt!658770) (MissingZero!13011 (index!54442 lt!658770)) lt!658770))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101161 (_ BitVec 32)) SeekEntryResult!13011)

(assert (=> b!1520088 (= lt!658770 (seekKeyOrZeroReturnVacant!0 (x!136117 lt!658769) (index!54441 lt!658769) (index!54441 lt!658769) (select (arr!48817 a!2804) j!70) a!2804 mask!2512))))

(declare-fun d!158637 () Bool)

(declare-fun lt!658768 () SeekEntryResult!13011)

(assert (=> d!158637 (and (or ((_ is MissingVacant!13011) lt!658768) (not ((_ is Found!13011) lt!658768)) (and (bvsge (index!54440 lt!658768) #b00000000000000000000000000000000) (bvslt (index!54440 lt!658768) (size!49369 a!2804)))) (not ((_ is MissingVacant!13011) lt!658768)) (or (not ((_ is Found!13011) lt!658768)) (= (select (arr!48817 a!2804) (index!54440 lt!658768)) (select (arr!48817 a!2804) j!70))))))

(assert (=> d!158637 (= lt!658768 e!847900)))

(declare-fun c!139704 () Bool)

(assert (=> d!158637 (= c!139704 (and ((_ is Intermediate!13011) lt!658769) (undefined!13823 lt!658769)))))

(assert (=> d!158637 (= lt!658769 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48817 a!2804) j!70) mask!2512) (select (arr!48817 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!158637 (validMask!0 mask!2512)))

(assert (=> d!158637 (= (seekEntry!0 (select (arr!48817 a!2804) j!70) a!2804 mask!2512) lt!658768)))

(declare-fun b!1520089 () Bool)

(assert (=> b!1520089 (= e!847899 (Found!13011 (index!54441 lt!658769)))))

(declare-fun b!1520090 () Bool)

(assert (=> b!1520090 (= e!847900 Undefined!13011)))

(declare-fun b!1520091 () Bool)

(assert (=> b!1520091 (= e!847901 (MissingZero!13011 (index!54441 lt!658769)))))

(assert (= (and d!158637 c!139704) b!1520090))

(assert (= (and d!158637 (not c!139704)) b!1520086))

(assert (= (and b!1520086 c!139702) b!1520089))

(assert (= (and b!1520086 (not c!139702)) b!1520087))

(assert (= (and b!1520087 c!139703) b!1520091))

(assert (= (and b!1520087 (not c!139703)) b!1520088))

(declare-fun m!1402807 () Bool)

(assert (=> b!1520086 m!1402807))

(assert (=> b!1520088 m!1402609))

(declare-fun m!1402809 () Bool)

(assert (=> b!1520088 m!1402809))

(declare-fun m!1402811 () Bool)

(assert (=> d!158637 m!1402811))

(assert (=> d!158637 m!1402609))

(assert (=> d!158637 m!1402633))

(assert (=> d!158637 m!1402633))

(assert (=> d!158637 m!1402609))

(assert (=> d!158637 m!1402635))

(assert (=> d!158637 m!1402615))

(assert (=> b!1519837 d!158637))

(declare-fun b!1520092 () Bool)

(declare-fun lt!658772 () SeekEntryResult!13011)

(assert (=> b!1520092 (and (bvsge (index!54441 lt!658772) #b00000000000000000000000000000000) (bvslt (index!54441 lt!658772) (size!49369 a!2804)))))

(declare-fun res!1039778 () Bool)

(assert (=> b!1520092 (= res!1039778 (= (select (arr!48817 a!2804) (index!54441 lt!658772)) (select (arr!48817 a!2804) j!70)))))

(declare-fun e!847905 () Bool)

(assert (=> b!1520092 (=> res!1039778 e!847905)))

(declare-fun e!847906 () Bool)

(assert (=> b!1520092 (= e!847906 e!847905)))

(declare-fun b!1520093 () Bool)

(assert (=> b!1520093 (and (bvsge (index!54441 lt!658772) #b00000000000000000000000000000000) (bvslt (index!54441 lt!658772) (size!49369 a!2804)))))

(declare-fun res!1039777 () Bool)

(assert (=> b!1520093 (= res!1039777 (= (select (arr!48817 a!2804) (index!54441 lt!658772)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1520093 (=> res!1039777 e!847905)))

(declare-fun b!1520094 () Bool)

(declare-fun e!847902 () SeekEntryResult!13011)

(declare-fun e!847904 () SeekEntryResult!13011)

(assert (=> b!1520094 (= e!847902 e!847904)))

(declare-fun c!139706 () Bool)

(declare-fun lt!658773 () (_ BitVec 64))

(assert (=> b!1520094 (= c!139706 (or (= lt!658773 (select (arr!48817 a!2804) j!70)) (= (bvadd lt!658773 lt!658773) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!158653 () Bool)

(declare-fun e!847903 () Bool)

(assert (=> d!158653 e!847903))

(declare-fun c!139707 () Bool)

(assert (=> d!158653 (= c!139707 (and ((_ is Intermediate!13011) lt!658772) (undefined!13823 lt!658772)))))

(assert (=> d!158653 (= lt!658772 e!847902)))

(declare-fun c!139705 () Bool)

(assert (=> d!158653 (= c!139705 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!158653 (= lt!658773 (select (arr!48817 a!2804) index!487))))

(assert (=> d!158653 (validMask!0 mask!2512)))

(assert (=> d!158653 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48817 a!2804) j!70) a!2804 mask!2512) lt!658772)))

(declare-fun b!1520095 () Bool)

(assert (=> b!1520095 (= e!847903 e!847906)))

(declare-fun res!1039776 () Bool)

(assert (=> b!1520095 (= res!1039776 (and ((_ is Intermediate!13011) lt!658772) (not (undefined!13823 lt!658772)) (bvslt (x!136117 lt!658772) #b01111111111111111111111111111110) (bvsge (x!136117 lt!658772) #b00000000000000000000000000000000) (bvsge (x!136117 lt!658772) x!534)))))

(assert (=> b!1520095 (=> (not res!1039776) (not e!847906))))

(declare-fun b!1520096 () Bool)

(assert (=> b!1520096 (= e!847904 (Intermediate!13011 false index!487 x!534))))

(declare-fun b!1520097 () Bool)

(assert (=> b!1520097 (and (bvsge (index!54441 lt!658772) #b00000000000000000000000000000000) (bvslt (index!54441 lt!658772) (size!49369 a!2804)))))

(assert (=> b!1520097 (= e!847905 (= (select (arr!48817 a!2804) (index!54441 lt!658772)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1520098 () Bool)

(assert (=> b!1520098 (= e!847902 (Intermediate!13011 true index!487 x!534))))

(declare-fun b!1520099 () Bool)

(assert (=> b!1520099 (= e!847903 (bvsge (x!136117 lt!658772) #b01111111111111111111111111111110))))

(declare-fun b!1520100 () Bool)

(assert (=> b!1520100 (= e!847904 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48817 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and d!158653 c!139705) b!1520098))

(assert (= (and d!158653 (not c!139705)) b!1520094))

(assert (= (and b!1520094 c!139706) b!1520096))

(assert (= (and b!1520094 (not c!139706)) b!1520100))

(assert (= (and d!158653 c!139707) b!1520099))

(assert (= (and d!158653 (not c!139707)) b!1520095))

(assert (= (and b!1520095 res!1039776) b!1520092))

(assert (= (and b!1520092 (not res!1039778)) b!1520093))

(assert (= (and b!1520093 (not res!1039777)) b!1520097))

(declare-fun m!1402813 () Bool)

(assert (=> b!1520100 m!1402813))

(assert (=> b!1520100 m!1402813))

(assert (=> b!1520100 m!1402609))

(declare-fun m!1402815 () Bool)

(assert (=> b!1520100 m!1402815))

(assert (=> d!158653 m!1402627))

(assert (=> d!158653 m!1402615))

(declare-fun m!1402817 () Bool)

(assert (=> b!1520093 m!1402817))

(assert (=> b!1520097 m!1402817))

(assert (=> b!1520092 m!1402817))

(assert (=> b!1519838 d!158653))

(declare-fun d!158655 () Bool)

(assert (=> d!158655 (= (validKeyInArray!0 (select (arr!48817 a!2804) i!961)) (and (not (= (select (arr!48817 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48817 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1519843 d!158655))

(declare-fun d!158657 () Bool)

(assert (=> d!158657 (= (validKeyInArray!0 (select (arr!48817 a!2804) j!70)) (and (not (= (select (arr!48817 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48817 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1519833 d!158657))

(declare-fun b!1520110 () Bool)

(declare-fun lt!658776 () SeekEntryResult!13011)

(assert (=> b!1520110 (and (bvsge (index!54441 lt!658776) #b00000000000000000000000000000000) (bvslt (index!54441 lt!658776) (size!49369 a!2804)))))

(declare-fun res!1039784 () Bool)

(assert (=> b!1520110 (= res!1039784 (= (select (arr!48817 a!2804) (index!54441 lt!658776)) (select (arr!48817 a!2804) j!70)))))

(declare-fun e!847915 () Bool)

(assert (=> b!1520110 (=> res!1039784 e!847915)))

(declare-fun e!847916 () Bool)

(assert (=> b!1520110 (= e!847916 e!847915)))

(declare-fun b!1520111 () Bool)

(assert (=> b!1520111 (and (bvsge (index!54441 lt!658776) #b00000000000000000000000000000000) (bvslt (index!54441 lt!658776) (size!49369 a!2804)))))

(declare-fun res!1039783 () Bool)

(assert (=> b!1520111 (= res!1039783 (= (select (arr!48817 a!2804) (index!54441 lt!658776)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1520111 (=> res!1039783 e!847915)))

(declare-fun b!1520112 () Bool)

(declare-fun e!847912 () SeekEntryResult!13011)

(declare-fun e!847914 () SeekEntryResult!13011)

(assert (=> b!1520112 (= e!847912 e!847914)))

(declare-fun c!139712 () Bool)

(declare-fun lt!658777 () (_ BitVec 64))

(assert (=> b!1520112 (= c!139712 (or (= lt!658777 (select (arr!48817 a!2804) j!70)) (= (bvadd lt!658777 lt!658777) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!158659 () Bool)

(declare-fun e!847913 () Bool)

(assert (=> d!158659 e!847913))

(declare-fun c!139713 () Bool)

(assert (=> d!158659 (= c!139713 (and ((_ is Intermediate!13011) lt!658776) (undefined!13823 lt!658776)))))

(assert (=> d!158659 (= lt!658776 e!847912)))

(declare-fun c!139711 () Bool)

(assert (=> d!158659 (= c!139711 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!158659 (= lt!658777 (select (arr!48817 a!2804) (toIndex!0 (select (arr!48817 a!2804) j!70) mask!2512)))))

(assert (=> d!158659 (validMask!0 mask!2512)))

(assert (=> d!158659 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48817 a!2804) j!70) mask!2512) (select (arr!48817 a!2804) j!70) a!2804 mask!2512) lt!658776)))

(declare-fun b!1520113 () Bool)

(assert (=> b!1520113 (= e!847913 e!847916)))

(declare-fun res!1039782 () Bool)

(assert (=> b!1520113 (= res!1039782 (and ((_ is Intermediate!13011) lt!658776) (not (undefined!13823 lt!658776)) (bvslt (x!136117 lt!658776) #b01111111111111111111111111111110) (bvsge (x!136117 lt!658776) #b00000000000000000000000000000000) (bvsge (x!136117 lt!658776) #b00000000000000000000000000000000)))))

(assert (=> b!1520113 (=> (not res!1039782) (not e!847916))))

(declare-fun b!1520114 () Bool)

(assert (=> b!1520114 (= e!847914 (Intermediate!13011 false (toIndex!0 (select (arr!48817 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1520115 () Bool)

(assert (=> b!1520115 (and (bvsge (index!54441 lt!658776) #b00000000000000000000000000000000) (bvslt (index!54441 lt!658776) (size!49369 a!2804)))))

(assert (=> b!1520115 (= e!847915 (= (select (arr!48817 a!2804) (index!54441 lt!658776)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1520116 () Bool)

(assert (=> b!1520116 (= e!847912 (Intermediate!13011 true (toIndex!0 (select (arr!48817 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1520117 () Bool)

(assert (=> b!1520117 (= e!847913 (bvsge (x!136117 lt!658776) #b01111111111111111111111111111110))))

(declare-fun b!1520118 () Bool)

(assert (=> b!1520118 (= e!847914 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48817 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48817 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and d!158659 c!139711) b!1520116))

(assert (= (and d!158659 (not c!139711)) b!1520112))

(assert (= (and b!1520112 c!139712) b!1520114))

(assert (= (and b!1520112 (not c!139712)) b!1520118))

(assert (= (and d!158659 c!139713) b!1520117))

(assert (= (and d!158659 (not c!139713)) b!1520113))

(assert (= (and b!1520113 res!1039782) b!1520110))

(assert (= (and b!1520110 (not res!1039784)) b!1520111))

(assert (= (and b!1520111 (not res!1039783)) b!1520115))

(assert (=> b!1520118 m!1402633))

(declare-fun m!1402825 () Bool)

(assert (=> b!1520118 m!1402825))

(assert (=> b!1520118 m!1402825))

(assert (=> b!1520118 m!1402609))

(declare-fun m!1402829 () Bool)

(assert (=> b!1520118 m!1402829))

(assert (=> d!158659 m!1402633))

(declare-fun m!1402833 () Bool)

(assert (=> d!158659 m!1402833))

(assert (=> d!158659 m!1402615))

(declare-fun m!1402837 () Bool)

(assert (=> b!1520111 m!1402837))

(assert (=> b!1520115 m!1402837))

(assert (=> b!1520110 m!1402837))

(assert (=> b!1519834 d!158659))

(declare-fun d!158663 () Bool)

(declare-fun lt!658781 () (_ BitVec 32))

(declare-fun lt!658780 () (_ BitVec 32))

(assert (=> d!158663 (= lt!658781 (bvmul (bvxor lt!658780 (bvlshr lt!658780 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158663 (= lt!658780 ((_ extract 31 0) (bvand (bvxor (select (arr!48817 a!2804) j!70) (bvlshr (select (arr!48817 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158663 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1039744 (let ((h!36793 ((_ extract 31 0) (bvand (bvxor (select (arr!48817 a!2804) j!70) (bvlshr (select (arr!48817 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136121 (bvmul (bvxor h!36793 (bvlshr h!36793 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136121 (bvlshr x!136121 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1039744 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1039744 #b00000000000000000000000000000000))))))

(assert (=> d!158663 (= (toIndex!0 (select (arr!48817 a!2804) j!70) mask!2512) (bvand (bvxor lt!658781 (bvlshr lt!658781 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1519834 d!158663))

(declare-fun d!158667 () Bool)

(declare-fun res!1039788 () Bool)

(declare-fun e!847923 () Bool)

(assert (=> d!158667 (=> res!1039788 e!847923)))

(assert (=> d!158667 (= res!1039788 (bvsge j!70 (size!49369 a!2804)))))

(assert (=> d!158667 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!847923)))

(declare-fun b!1520128 () Bool)

(declare-fun e!847922 () Bool)

(declare-fun e!847924 () Bool)

(assert (=> b!1520128 (= e!847922 e!847924)))

(declare-fun lt!658782 () (_ BitVec 64))

(assert (=> b!1520128 (= lt!658782 (select (arr!48817 a!2804) j!70))))

(declare-fun lt!658784 () Unit!50729)

(assert (=> b!1520128 (= lt!658784 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!658782 j!70))))

(assert (=> b!1520128 (arrayContainsKey!0 a!2804 lt!658782 #b00000000000000000000000000000000)))

(declare-fun lt!658783 () Unit!50729)

(assert (=> b!1520128 (= lt!658783 lt!658784)))

(declare-fun res!1039789 () Bool)

(assert (=> b!1520128 (= res!1039789 (= (seekEntryOrOpen!0 (select (arr!48817 a!2804) j!70) a!2804 mask!2512) (Found!13011 j!70)))))

(assert (=> b!1520128 (=> (not res!1039789) (not e!847924))))

(declare-fun call!68318 () Bool)

(declare-fun bm!68315 () Bool)

(assert (=> bm!68315 (= call!68318 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1520129 () Bool)

(assert (=> b!1520129 (= e!847924 call!68318)))

(declare-fun b!1520130 () Bool)

(assert (=> b!1520130 (= e!847922 call!68318)))

(declare-fun b!1520131 () Bool)

(assert (=> b!1520131 (= e!847923 e!847922)))

(declare-fun c!139717 () Bool)

(assert (=> b!1520131 (= c!139717 (validKeyInArray!0 (select (arr!48817 a!2804) j!70)))))

(assert (= (and d!158667 (not res!1039788)) b!1520131))

(assert (= (and b!1520131 c!139717) b!1520128))

(assert (= (and b!1520131 (not c!139717)) b!1520130))

(assert (= (and b!1520128 res!1039789) b!1520129))

(assert (= (or b!1520129 b!1520130) bm!68315))

(assert (=> b!1520128 m!1402609))

(declare-fun m!1402841 () Bool)

(assert (=> b!1520128 m!1402841))

(declare-fun m!1402843 () Bool)

(assert (=> b!1520128 m!1402843))

(assert (=> b!1520128 m!1402609))

(declare-fun m!1402845 () Bool)

(assert (=> b!1520128 m!1402845))

(declare-fun m!1402847 () Bool)

(assert (=> bm!68315 m!1402847))

(assert (=> b!1520131 m!1402609))

(assert (=> b!1520131 m!1402609))

(assert (=> b!1520131 m!1402611))

(assert (=> b!1519839 d!158667))

(declare-fun d!158669 () Bool)

(assert (=> d!158669 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!658795 () Unit!50729)

(declare-fun choose!38 (array!101161 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50729)

(assert (=> d!158669 (= lt!658795 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!158669 (validMask!0 mask!2512)))

(assert (=> d!158669 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!658795)))

(declare-fun bs!43589 () Bool)

(assert (= bs!43589 d!158669))

(assert (=> bs!43589 m!1402629))

(declare-fun m!1402849 () Bool)

(assert (=> bs!43589 m!1402849))

(assert (=> bs!43589 m!1402615))

(assert (=> b!1519839 d!158669))

(check-sat (not b!1520027) (not b!1520024) (not b!1520088) (not bm!68315) (not bm!68314) (not b!1520131) (not b!1519921) (not b!1520128) (not bm!68300) (not b!1520026) (not b!1519918) (not b!1519995) (not b!1520100) (not d!158611) (not d!158637) (not b!1520118) (not d!158669) (not d!158659) (not d!158653))
(check-sat)
