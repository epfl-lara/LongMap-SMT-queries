; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129352 () Bool)

(assert start!129352)

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun b!1519667 () Bool)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101208 0))(
  ( (array!101209 (arr!48841 (Array (_ BitVec 32) (_ BitVec 64))) (size!49391 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101208)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun e!847666 () Bool)

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1519667 (= e!847666 (not (or (not (= (select (arr!48841 a!2804) j!70) (select (store (arr!48841 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (= index!487 resIndex!21))))))

(declare-fun e!847668 () Bool)

(assert (=> b!1519667 e!847668))

(declare-fun res!1039579 () Bool)

(assert (=> b!1519667 (=> (not res!1039579) (not e!847668))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101208 (_ BitVec 32)) Bool)

(assert (=> b!1519667 (= res!1039579 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50892 0))(
  ( (Unit!50893) )
))
(declare-fun lt!658734 () Unit!50892)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101208 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50892)

(assert (=> b!1519667 (= lt!658734 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1519668 () Bool)

(declare-fun res!1039572 () Bool)

(assert (=> b!1519668 (=> (not res!1039572) (not e!847666))))

(declare-datatypes ((SeekEntryResult!13012 0))(
  ( (MissingZero!13012 (index!54443 (_ BitVec 32))) (Found!13012 (index!54444 (_ BitVec 32))) (Intermediate!13012 (undefined!13824 Bool) (index!54445 (_ BitVec 32)) (x!136106 (_ BitVec 32))) (Undefined!13012) (MissingVacant!13012 (index!54446 (_ BitVec 32))) )
))
(declare-fun lt!658735 () SeekEntryResult!13012)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101208 (_ BitVec 32)) SeekEntryResult!13012)

(assert (=> b!1519668 (= res!1039572 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48841 a!2804) j!70) a!2804 mask!2512) lt!658735))))

(declare-fun b!1519669 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101208 (_ BitVec 32)) SeekEntryResult!13012)

(assert (=> b!1519669 (= e!847668 (= (seekEntry!0 (select (arr!48841 a!2804) j!70) a!2804 mask!2512) (Found!13012 j!70)))))

(declare-fun b!1519670 () Bool)

(declare-fun res!1039569 () Bool)

(declare-fun e!847667 () Bool)

(assert (=> b!1519670 (=> (not res!1039569) (not e!847667))))

(assert (=> b!1519670 (= res!1039569 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49391 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49391 a!2804))))))

(declare-fun b!1519671 () Bool)

(declare-fun res!1039571 () Bool)

(assert (=> b!1519671 (=> (not res!1039571) (not e!847667))))

(assert (=> b!1519671 (= res!1039571 (and (= (size!49391 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49391 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49391 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1519672 () Bool)

(assert (=> b!1519672 (= e!847667 e!847666)))

(declare-fun res!1039578 () Bool)

(assert (=> b!1519672 (=> (not res!1039578) (not e!847666))))

(declare-fun lt!658733 () SeekEntryResult!13012)

(assert (=> b!1519672 (= res!1039578 (= lt!658733 lt!658735))))

(assert (=> b!1519672 (= lt!658735 (Intermediate!13012 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519672 (= lt!658733 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48841 a!2804) j!70) mask!2512) (select (arr!48841 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519673 () Bool)

(declare-fun res!1039570 () Bool)

(assert (=> b!1519673 (=> (not res!1039570) (not e!847667))))

(declare-datatypes ((List!35324 0))(
  ( (Nil!35321) (Cons!35320 (h!36732 (_ BitVec 64)) (t!50018 List!35324)) )
))
(declare-fun arrayNoDuplicates!0 (array!101208 (_ BitVec 32) List!35324) Bool)

(assert (=> b!1519673 (= res!1039570 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35321))))

(declare-fun b!1519674 () Bool)

(declare-fun res!1039577 () Bool)

(assert (=> b!1519674 (=> (not res!1039577) (not e!847666))))

(assert (=> b!1519674 (= res!1039577 (= lt!658733 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48841 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48841 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101209 (store (arr!48841 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49391 a!2804)) mask!2512)))))

(declare-fun b!1519675 () Bool)

(declare-fun res!1039574 () Bool)

(assert (=> b!1519675 (=> (not res!1039574) (not e!847667))))

(assert (=> b!1519675 (= res!1039574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1519676 () Bool)

(declare-fun res!1039573 () Bool)

(assert (=> b!1519676 (=> (not res!1039573) (not e!847667))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1519676 (= res!1039573 (validKeyInArray!0 (select (arr!48841 a!2804) j!70)))))

(declare-fun res!1039576 () Bool)

(assert (=> start!129352 (=> (not res!1039576) (not e!847667))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129352 (= res!1039576 (validMask!0 mask!2512))))

(assert (=> start!129352 e!847667))

(assert (=> start!129352 true))

(declare-fun array_inv!37869 (array!101208) Bool)

(assert (=> start!129352 (array_inv!37869 a!2804)))

(declare-fun b!1519666 () Bool)

(declare-fun res!1039575 () Bool)

(assert (=> b!1519666 (=> (not res!1039575) (not e!847667))))

(assert (=> b!1519666 (= res!1039575 (validKeyInArray!0 (select (arr!48841 a!2804) i!961)))))

(assert (= (and start!129352 res!1039576) b!1519671))

(assert (= (and b!1519671 res!1039571) b!1519666))

(assert (= (and b!1519666 res!1039575) b!1519676))

(assert (= (and b!1519676 res!1039573) b!1519675))

(assert (= (and b!1519675 res!1039574) b!1519673))

(assert (= (and b!1519673 res!1039570) b!1519670))

(assert (= (and b!1519670 res!1039569) b!1519672))

(assert (= (and b!1519672 res!1039578) b!1519668))

(assert (= (and b!1519668 res!1039572) b!1519674))

(assert (= (and b!1519674 res!1039577) b!1519667))

(assert (= (and b!1519667 res!1039579) b!1519669))

(declare-fun m!1403095 () Bool)

(assert (=> b!1519669 m!1403095))

(assert (=> b!1519669 m!1403095))

(declare-fun m!1403097 () Bool)

(assert (=> b!1519669 m!1403097))

(declare-fun m!1403099 () Bool)

(assert (=> b!1519674 m!1403099))

(declare-fun m!1403101 () Bool)

(assert (=> b!1519674 m!1403101))

(assert (=> b!1519674 m!1403101))

(declare-fun m!1403103 () Bool)

(assert (=> b!1519674 m!1403103))

(assert (=> b!1519674 m!1403103))

(assert (=> b!1519674 m!1403101))

(declare-fun m!1403105 () Bool)

(assert (=> b!1519674 m!1403105))

(assert (=> b!1519667 m!1403095))

(declare-fun m!1403107 () Bool)

(assert (=> b!1519667 m!1403107))

(assert (=> b!1519667 m!1403099))

(assert (=> b!1519667 m!1403101))

(declare-fun m!1403109 () Bool)

(assert (=> b!1519667 m!1403109))

(declare-fun m!1403111 () Bool)

(assert (=> b!1519675 m!1403111))

(declare-fun m!1403113 () Bool)

(assert (=> start!129352 m!1403113))

(declare-fun m!1403115 () Bool)

(assert (=> start!129352 m!1403115))

(assert (=> b!1519672 m!1403095))

(assert (=> b!1519672 m!1403095))

(declare-fun m!1403117 () Bool)

(assert (=> b!1519672 m!1403117))

(assert (=> b!1519672 m!1403117))

(assert (=> b!1519672 m!1403095))

(declare-fun m!1403119 () Bool)

(assert (=> b!1519672 m!1403119))

(declare-fun m!1403121 () Bool)

(assert (=> b!1519673 m!1403121))

(declare-fun m!1403123 () Bool)

(assert (=> b!1519666 m!1403123))

(assert (=> b!1519666 m!1403123))

(declare-fun m!1403125 () Bool)

(assert (=> b!1519666 m!1403125))

(assert (=> b!1519676 m!1403095))

(assert (=> b!1519676 m!1403095))

(declare-fun m!1403127 () Bool)

(assert (=> b!1519676 m!1403127))

(assert (=> b!1519668 m!1403095))

(assert (=> b!1519668 m!1403095))

(declare-fun m!1403129 () Bool)

(assert (=> b!1519668 m!1403129))

(push 1)

(assert (not start!129352))

(assert (not b!1519667))

(assert (not b!1519666))

(assert (not b!1519668))

(assert (not b!1519673))

(assert (not b!1519669))

(assert (not b!1519674))

(assert (not b!1519672))

(assert (not b!1519676))

(assert (not b!1519675))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1519730 () Bool)

(declare-fun e!847702 () Bool)

(declare-fun e!847701 () Bool)

(assert (=> b!1519730 (= e!847702 e!847701)))

(declare-fun c!139610 () Bool)

(assert (=> b!1519730 (= c!139610 (validKeyInArray!0 (select (arr!48841 a!2804) j!70)))))

(declare-fun b!1519731 () Bool)

(declare-fun e!847700 () Bool)

(assert (=> b!1519731 (= e!847701 e!847700)))

(declare-fun lt!658767 () (_ BitVec 64))

(assert (=> b!1519731 (= lt!658767 (select (arr!48841 a!2804) j!70))))

(declare-fun lt!658768 () Unit!50892)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101208 (_ BitVec 64) (_ BitVec 32)) Unit!50892)

(assert (=> b!1519731 (= lt!658768 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!658767 j!70))))

(declare-fun arrayContainsKey!0 (array!101208 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1519731 (arrayContainsKey!0 a!2804 lt!658767 #b00000000000000000000000000000000)))

(declare-fun lt!658766 () Unit!50892)

(assert (=> b!1519731 (= lt!658766 lt!658768)))

(declare-fun res!1039595 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101208 (_ BitVec 32)) SeekEntryResult!13012)

(assert (=> b!1519731 (= res!1039595 (= (seekEntryOrOpen!0 (select (arr!48841 a!2804) j!70) a!2804 mask!2512) (Found!13012 j!70)))))

(assert (=> b!1519731 (=> (not res!1039595) (not e!847700))))

(declare-fun b!1519732 () Bool)

(declare-fun call!68313 () Bool)

(assert (=> b!1519732 (= e!847700 call!68313)))

(declare-fun d!158707 () Bool)

(declare-fun res!1039594 () Bool)

(assert (=> d!158707 (=> res!1039594 e!847702)))

(assert (=> d!158707 (= res!1039594 (bvsge j!70 (size!49391 a!2804)))))

(assert (=> d!158707 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!847702)))

(declare-fun bm!68310 () Bool)

(assert (=> bm!68310 (= call!68313 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1519733 () Bool)

(assert (=> b!1519733 (= e!847701 call!68313)))

(assert (= (and d!158707 (not res!1039594)) b!1519730))

(assert (= (and b!1519730 c!139610) b!1519731))

(assert (= (and b!1519730 (not c!139610)) b!1519733))

(assert (= (and b!1519731 res!1039595) b!1519732))

(assert (= (or b!1519732 b!1519733) bm!68310))

(assert (=> b!1519730 m!1403095))

(assert (=> b!1519730 m!1403095))

(assert (=> b!1519730 m!1403127))

(assert (=> b!1519731 m!1403095))

(declare-fun m!1403145 () Bool)

(assert (=> b!1519731 m!1403145))

(declare-fun m!1403147 () Bool)

(assert (=> b!1519731 m!1403147))

(assert (=> b!1519731 m!1403095))

(declare-fun m!1403149 () Bool)

(assert (=> b!1519731 m!1403149))

(declare-fun m!1403151 () Bool)

(assert (=> bm!68310 m!1403151))

(assert (=> b!1519667 d!158707))

(declare-fun d!158717 () Bool)

(assert (=> d!158717 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!658771 () Unit!50892)

(declare-fun choose!38 (array!101208 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50892)

(assert (=> d!158717 (= lt!658771 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!158717 (validMask!0 mask!2512)))

(assert (=> d!158717 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!658771)))

(declare-fun bs!43615 () Bool)

(assert (= bs!43615 d!158717))

(assert (=> bs!43615 m!1403109))

(declare-fun m!1403153 () Bool)

(assert (=> bs!43615 m!1403153))

(assert (=> bs!43615 m!1403113))

(assert (=> b!1519667 d!158717))

(declare-fun b!1519803 () Bool)

(declare-fun e!847745 () SeekEntryResult!13012)

(declare-fun e!847747 () SeekEntryResult!13012)

(assert (=> b!1519803 (= e!847745 e!847747)))

(declare-fun lt!658791 () (_ BitVec 64))

(declare-fun c!139634 () Bool)

(assert (=> b!1519803 (= c!139634 (or (= lt!658791 (select (arr!48841 a!2804) j!70)) (= (bvadd lt!658791 lt!658791) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1519804 () Bool)

(declare-fun lt!658790 () SeekEntryResult!13012)

(assert (=> b!1519804 (and (bvsge (index!54445 lt!658790) #b00000000000000000000000000000000) (bvslt (index!54445 lt!658790) (size!49391 a!2804)))))

(declare-fun e!847749 () Bool)

(assert (=> b!1519804 (= e!847749 (= (select (arr!48841 a!2804) (index!54445 lt!658790)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1519805 () Bool)

(assert (=> b!1519805 (and (bvsge (index!54445 lt!658790) #b00000000000000000000000000000000) (bvslt (index!54445 lt!658790) (size!49391 a!2804)))))

(declare-fun res!1039626 () Bool)

(assert (=> b!1519805 (= res!1039626 (= (select (arr!48841 a!2804) (index!54445 lt!658790)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1519805 (=> res!1039626 e!847749)))

(declare-fun b!1519806 () Bool)

(assert (=> b!1519806 (and (bvsge (index!54445 lt!658790) #b00000000000000000000000000000000) (bvslt (index!54445 lt!658790) (size!49391 a!2804)))))

(declare-fun res!1039624 () Bool)

(assert (=> b!1519806 (= res!1039624 (= (select (arr!48841 a!2804) (index!54445 lt!658790)) (select (arr!48841 a!2804) j!70)))))

(assert (=> b!1519806 (=> res!1039624 e!847749)))

(declare-fun e!847748 () Bool)

(assert (=> b!1519806 (= e!847748 e!847749)))

(declare-fun b!1519807 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519807 (= e!847747 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48841 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519808 () Bool)

(assert (=> b!1519808 (= e!847745 (Intermediate!13012 true index!487 x!534))))

(declare-fun b!1519809 () Bool)

(declare-fun e!847746 () Bool)

(assert (=> b!1519809 (= e!847746 e!847748)))

(declare-fun res!1039625 () Bool)

(assert (=> b!1519809 (= res!1039625 (and (is-Intermediate!13012 lt!658790) (not (undefined!13824 lt!658790)) (bvslt (x!136106 lt!658790) #b01111111111111111111111111111110) (bvsge (x!136106 lt!658790) #b00000000000000000000000000000000) (bvsge (x!136106 lt!658790) x!534)))))

(assert (=> b!1519809 (=> (not res!1039625) (not e!847748))))

(declare-fun b!1519810 () Bool)

(assert (=> b!1519810 (= e!847746 (bvsge (x!136106 lt!658790) #b01111111111111111111111111111110))))

(declare-fun d!158719 () Bool)

(assert (=> d!158719 e!847746))

(declare-fun c!139633 () Bool)

(assert (=> d!158719 (= c!139633 (and (is-Intermediate!13012 lt!658790) (undefined!13824 lt!658790)))))

(assert (=> d!158719 (= lt!658790 e!847745)))

(declare-fun c!139632 () Bool)

(assert (=> d!158719 (= c!139632 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!158719 (= lt!658791 (select (arr!48841 a!2804) index!487))))

(assert (=> d!158719 (validMask!0 mask!2512)))

(assert (=> d!158719 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48841 a!2804) j!70) a!2804 mask!2512) lt!658790)))

(declare-fun b!1519811 () Bool)

(assert (=> b!1519811 (= e!847747 (Intermediate!13012 false index!487 x!534))))

(assert (= (and d!158719 c!139632) b!1519808))

(assert (= (and d!158719 (not c!139632)) b!1519803))

(assert (= (and b!1519803 c!139634) b!1519811))

(assert (= (and b!1519803 (not c!139634)) b!1519807))

(assert (= (and d!158719 c!139633) b!1519810))

(assert (= (and d!158719 (not c!139633)) b!1519809))

(assert (= (and b!1519809 res!1039625) b!1519806))

(assert (= (and b!1519806 (not res!1039624)) b!1519805))

(assert (= (and b!1519805 (not res!1039626)) b!1519804))

(declare-fun m!1403179 () Bool)

(assert (=> d!158719 m!1403179))

(assert (=> d!158719 m!1403113))

(declare-fun m!1403181 () Bool)

(assert (=> b!1519807 m!1403181))

(assert (=> b!1519807 m!1403181))

(assert (=> b!1519807 m!1403095))

(declare-fun m!1403183 () Bool)

(assert (=> b!1519807 m!1403183))

(declare-fun m!1403185 () Bool)

(assert (=> b!1519804 m!1403185))

(assert (=> b!1519806 m!1403185))

(assert (=> b!1519805 m!1403185))

(assert (=> b!1519668 d!158719))

(declare-fun b!1519846 () Bool)

(declare-fun e!847774 () Bool)

(declare-fun contains!9977 (List!35324 (_ BitVec 64)) Bool)

(assert (=> b!1519846 (= e!847774 (contains!9977 Nil!35321 (select (arr!48841 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1519847 () Bool)

(declare-fun e!847775 () Bool)

(declare-fun call!68322 () Bool)

(assert (=> b!1519847 (= e!847775 call!68322)))

(declare-fun b!1519848 () Bool)

(assert (=> b!1519848 (= e!847775 call!68322)))

(declare-fun bm!68319 () Bool)

(declare-fun c!139646 () Bool)

(assert (=> bm!68319 (= call!68322 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139646 (Cons!35320 (select (arr!48841 a!2804) #b00000000000000000000000000000000) Nil!35321) Nil!35321)))))

(declare-fun d!158733 () Bool)

(declare-fun res!1039639 () Bool)

(declare-fun e!847773 () Bool)

(assert (=> d!158733 (=> res!1039639 e!847773)))

(assert (=> d!158733 (= res!1039639 (bvsge #b00000000000000000000000000000000 (size!49391 a!2804)))))

(assert (=> d!158733 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35321) e!847773)))

(declare-fun b!1519849 () Bool)

(declare-fun e!847776 () Bool)

(assert (=> b!1519849 (= e!847776 e!847775)))

(assert (=> b!1519849 (= c!139646 (validKeyInArray!0 (select (arr!48841 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1519850 () Bool)

(assert (=> b!1519850 (= e!847773 e!847776)))

(declare-fun res!1039641 () Bool)

(assert (=> b!1519850 (=> (not res!1039641) (not e!847776))))

(assert (=> b!1519850 (= res!1039641 (not e!847774))))

(declare-fun res!1039640 () Bool)

(assert (=> b!1519850 (=> (not res!1039640) (not e!847774))))

(assert (=> b!1519850 (= res!1039640 (validKeyInArray!0 (select (arr!48841 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!158733 (not res!1039639)) b!1519850))

(assert (= (and b!1519850 res!1039640) b!1519846))

(assert (= (and b!1519850 res!1039641) b!1519849))

(assert (= (and b!1519849 c!139646) b!1519847))

(assert (= (and b!1519849 (not c!139646)) b!1519848))

(assert (= (or b!1519847 b!1519848) bm!68319))

(declare-fun m!1403195 () Bool)

(assert (=> b!1519846 m!1403195))

(assert (=> b!1519846 m!1403195))

(declare-fun m!1403197 () Bool)

(assert (=> b!1519846 m!1403197))

(assert (=> bm!68319 m!1403195))

(declare-fun m!1403199 () Bool)

(assert (=> bm!68319 m!1403199))

(assert (=> b!1519849 m!1403195))

(assert (=> b!1519849 m!1403195))

(declare-fun m!1403201 () Bool)

(assert (=> b!1519849 m!1403201))

(assert (=> b!1519850 m!1403195))

(assert (=> b!1519850 m!1403195))

(assert (=> b!1519850 m!1403201))

(assert (=> b!1519673 d!158733))

(declare-fun b!1519857 () Bool)

(declare-fun e!847780 () SeekEntryResult!13012)

(declare-fun e!847782 () SeekEntryResult!13012)

(assert (=> b!1519857 (= e!847780 e!847782)))

(declare-fun lt!658814 () (_ BitVec 64))

(declare-fun c!139652 () Bool)

(assert (=> b!1519857 (= c!139652 (or (= lt!658814 (select (store (arr!48841 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!658814 lt!658814) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1519858 () Bool)

(declare-fun lt!658813 () SeekEntryResult!13012)

(assert (=> b!1519858 (and (bvsge (index!54445 lt!658813) #b00000000000000000000000000000000) (bvslt (index!54445 lt!658813) (size!49391 (array!101209 (store (arr!48841 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49391 a!2804)))))))

(declare-fun e!847784 () Bool)

(assert (=> b!1519858 (= e!847784 (= (select (arr!48841 (array!101209 (store (arr!48841 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49391 a!2804))) (index!54445 lt!658813)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1519859 () Bool)

(assert (=> b!1519859 (and (bvsge (index!54445 lt!658813) #b00000000000000000000000000000000) (bvslt (index!54445 lt!658813) (size!49391 (array!101209 (store (arr!48841 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49391 a!2804)))))))

(declare-fun res!1039644 () Bool)

(assert (=> b!1519859 (= res!1039644 (= (select (arr!48841 (array!101209 (store (arr!48841 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49391 a!2804))) (index!54445 lt!658813)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1519859 (=> res!1039644 e!847784)))

(declare-fun b!1519860 () Bool)

(assert (=> b!1519860 (and (bvsge (index!54445 lt!658813) #b00000000000000000000000000000000) (bvslt (index!54445 lt!658813) (size!49391 (array!101209 (store (arr!48841 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49391 a!2804)))))))

(declare-fun res!1039642 () Bool)

(assert (=> b!1519860 (= res!1039642 (= (select (arr!48841 (array!101209 (store (arr!48841 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49391 a!2804))) (index!54445 lt!658813)) (select (store (arr!48841 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(assert (=> b!1519860 (=> res!1039642 e!847784)))

(declare-fun e!847783 () Bool)

(assert (=> b!1519860 (= e!847783 e!847784)))

(declare-fun b!1519861 () Bool)

(assert (=> b!1519861 (= e!847782 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!48841 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (store (arr!48841 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101209 (store (arr!48841 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49391 a!2804)) mask!2512))))

(declare-fun b!1519862 () Bool)

(assert (=> b!1519862 (= e!847780 (Intermediate!13012 true (toIndex!0 (select (store (arr!48841 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1519863 () Bool)

(declare-fun e!847781 () Bool)

(assert (=> b!1519863 (= e!847781 e!847783)))

(declare-fun res!1039643 () Bool)

(assert (=> b!1519863 (= res!1039643 (and (is-Intermediate!13012 lt!658813) (not (undefined!13824 lt!658813)) (bvslt (x!136106 lt!658813) #b01111111111111111111111111111110) (bvsge (x!136106 lt!658813) #b00000000000000000000000000000000) (bvsge (x!136106 lt!658813) #b00000000000000000000000000000000)))))

(assert (=> b!1519863 (=> (not res!1039643) (not e!847783))))

(declare-fun b!1519864 () Bool)

(assert (=> b!1519864 (= e!847781 (bvsge (x!136106 lt!658813) #b01111111111111111111111111111110))))

(declare-fun d!158737 () Bool)

(assert (=> d!158737 e!847781))

(declare-fun c!139651 () Bool)

(assert (=> d!158737 (= c!139651 (and (is-Intermediate!13012 lt!658813) (undefined!13824 lt!658813)))))

(assert (=> d!158737 (= lt!658813 e!847780)))

(declare-fun c!139650 () Bool)

(assert (=> d!158737 (= c!139650 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!158737 (= lt!658814 (select (arr!48841 (array!101209 (store (arr!48841 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49391 a!2804))) (toIndex!0 (select (store (arr!48841 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!158737 (validMask!0 mask!2512)))

(assert (=> d!158737 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48841 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48841 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101209 (store (arr!48841 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49391 a!2804)) mask!2512) lt!658813)))

(declare-fun b!1519865 () Bool)

(assert (=> b!1519865 (= e!847782 (Intermediate!13012 false (toIndex!0 (select (store (arr!48841 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(assert (= (and d!158737 c!139650) b!1519862))

(assert (= (and d!158737 (not c!139650)) b!1519857))

(assert (= (and b!1519857 c!139652) b!1519865))

(assert (= (and b!1519857 (not c!139652)) b!1519861))

(assert (= (and d!158737 c!139651) b!1519864))

(assert (= (and d!158737 (not c!139651)) b!1519863))

(assert (= (and b!1519863 res!1039643) b!1519860))

(assert (= (and b!1519860 (not res!1039642)) b!1519859))

(assert (= (and b!1519859 (not res!1039644)) b!1519858))

(assert (=> d!158737 m!1403103))

(declare-fun m!1403209 () Bool)

(assert (=> d!158737 m!1403209))

(assert (=> d!158737 m!1403113))

(assert (=> b!1519861 m!1403103))

(declare-fun m!1403213 () Bool)

(assert (=> b!1519861 m!1403213))

(assert (=> b!1519861 m!1403213))

(assert (=> b!1519861 m!1403101))

(declare-fun m!1403215 () Bool)

(assert (=> b!1519861 m!1403215))

(declare-fun m!1403217 () Bool)

(assert (=> b!1519858 m!1403217))

(assert (=> b!1519860 m!1403217))

(assert (=> b!1519859 m!1403217))

(assert (=> b!1519674 d!158737))

(declare-fun d!158743 () Bool)

(declare-fun lt!658829 () (_ BitVec 32))

(declare-fun lt!658828 () (_ BitVec 32))

(assert (=> d!158743 (= lt!658829 (bvmul (bvxor lt!658828 (bvlshr lt!658828 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158743 (= lt!658828 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48841 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48841 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158743 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1039645 (let ((h!36735 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48841 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48841 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136112 (bvmul (bvxor h!36735 (bvlshr h!36735 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136112 (bvlshr x!136112 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1039645 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1039645 #b00000000000000000000000000000000))))))

(assert (=> d!158743 (= (toIndex!0 (select (store (arr!48841 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!658829 (bvlshr lt!658829 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1519674 d!158743))

(declare-fun d!158755 () Bool)

(assert (=> d!158755 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!129352 d!158755))

(declare-fun d!158767 () Bool)

(assert (=> d!158767 (= (array_inv!37869 a!2804) (bvsge (size!49391 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!129352 d!158767))

(declare-fun b!1519940 () Bool)

(declare-fun e!847835 () SeekEntryResult!13012)

(declare-fun lt!658863 () SeekEntryResult!13012)

(assert (=> b!1519940 (= e!847835 (ite (is-MissingVacant!13012 lt!658863) (MissingZero!13012 (index!54446 lt!658863)) lt!658863))))

(declare-fun lt!658862 () SeekEntryResult!13012)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101208 (_ BitVec 32)) SeekEntryResult!13012)

(assert (=> b!1519940 (= lt!658863 (seekKeyOrZeroReturnVacant!0 (x!136106 lt!658862) (index!54445 lt!658862) (index!54445 lt!658862) (select (arr!48841 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519941 () Bool)

(declare-fun e!847834 () SeekEntryResult!13012)

(assert (=> b!1519941 (= e!847834 Undefined!13012)))

(declare-fun b!1519942 () Bool)

(declare-fun e!847833 () SeekEntryResult!13012)

(assert (=> b!1519942 (= e!847833 (Found!13012 (index!54445 lt!658862)))))

(declare-fun d!158771 () Bool)

(declare-fun lt!658860 () SeekEntryResult!13012)

(assert (=> d!158771 (and (or (is-MissingVacant!13012 lt!658860) (not (is-Found!13012 lt!658860)) (and (bvsge (index!54444 lt!658860) #b00000000000000000000000000000000) (bvslt (index!54444 lt!658860) (size!49391 a!2804)))) (not (is-MissingVacant!13012 lt!658860)) (or (not (is-Found!13012 lt!658860)) (= (select (arr!48841 a!2804) (index!54444 lt!658860)) (select (arr!48841 a!2804) j!70))))))

(assert (=> d!158771 (= lt!658860 e!847834)))

(declare-fun c!139678 () Bool)

(assert (=> d!158771 (= c!139678 (and (is-Intermediate!13012 lt!658862) (undefined!13824 lt!658862)))))

(assert (=> d!158771 (= lt!658862 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48841 a!2804) j!70) mask!2512) (select (arr!48841 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!158771 (validMask!0 mask!2512)))

(assert (=> d!158771 (= (seekEntry!0 (select (arr!48841 a!2804) j!70) a!2804 mask!2512) lt!658860)))

(declare-fun b!1519943 () Bool)

(assert (=> b!1519943 (= e!847834 e!847833)))

(declare-fun lt!658861 () (_ BitVec 64))

(assert (=> b!1519943 (= lt!658861 (select (arr!48841 a!2804) (index!54445 lt!658862)))))

(declare-fun c!139676 () Bool)

(assert (=> b!1519943 (= c!139676 (= lt!658861 (select (arr!48841 a!2804) j!70)))))

(declare-fun b!1519944 () Bool)

(assert (=> b!1519944 (= e!847835 (MissingZero!13012 (index!54445 lt!658862)))))

(declare-fun b!1519945 () Bool)

(declare-fun c!139677 () Bool)

(assert (=> b!1519945 (= c!139677 (= lt!658861 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1519945 (= e!847833 e!847835)))

(assert (= (and d!158771 c!139678) b!1519941))

(assert (= (and d!158771 (not c!139678)) b!1519943))

(assert (= (and b!1519943 c!139676) b!1519942))

(assert (= (and b!1519943 (not c!139676)) b!1519945))

(assert (= (and b!1519945 c!139677) b!1519944))

(assert (= (and b!1519945 (not c!139677)) b!1519940))

(assert (=> b!1519940 m!1403095))

(declare-fun m!1403277 () Bool)

(assert (=> b!1519940 m!1403277))

(declare-fun m!1403279 () Bool)

(assert (=> d!158771 m!1403279))

(assert (=> d!158771 m!1403095))

(assert (=> d!158771 m!1403117))

(assert (=> d!158771 m!1403117))

(assert (=> d!158771 m!1403095))

(assert (=> d!158771 m!1403119))

(assert (=> d!158771 m!1403113))

(declare-fun m!1403281 () Bool)

(assert (=> b!1519943 m!1403281))

(assert (=> b!1519669 d!158771))

(declare-fun b!1519946 () Bool)

(declare-fun e!847838 () Bool)

(declare-fun e!847837 () Bool)

(assert (=> b!1519946 (= e!847838 e!847837)))

(declare-fun c!139679 () Bool)

(assert (=> b!1519946 (= c!139679 (validKeyInArray!0 (select (arr!48841 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1519947 () Bool)

(declare-fun e!847836 () Bool)

(assert (=> b!1519947 (= e!847837 e!847836)))

(declare-fun lt!658865 () (_ BitVec 64))

(assert (=> b!1519947 (= lt!658865 (select (arr!48841 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!658866 () Unit!50892)

(assert (=> b!1519947 (= lt!658866 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!658865 #b00000000000000000000000000000000))))

(assert (=> b!1519947 (arrayContainsKey!0 a!2804 lt!658865 #b00000000000000000000000000000000)))

(declare-fun lt!658864 () Unit!50892)

(assert (=> b!1519947 (= lt!658864 lt!658866)))

(declare-fun res!1039675 () Bool)

(assert (=> b!1519947 (= res!1039675 (= (seekEntryOrOpen!0 (select (arr!48841 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13012 #b00000000000000000000000000000000)))))

(assert (=> b!1519947 (=> (not res!1039675) (not e!847836))))

(declare-fun b!1519948 () Bool)

(declare-fun call!68331 () Bool)

(assert (=> b!1519948 (= e!847836 call!68331)))

(declare-fun d!158775 () Bool)

(declare-fun res!1039674 () Bool)

(assert (=> d!158775 (=> res!1039674 e!847838)))

(assert (=> d!158775 (= res!1039674 (bvsge #b00000000000000000000000000000000 (size!49391 a!2804)))))

(assert (=> d!158775 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!847838)))

(declare-fun bm!68328 () Bool)

(assert (=> bm!68328 (= call!68331 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1519949 () Bool)

(assert (=> b!1519949 (= e!847837 call!68331)))

(assert (= (and d!158775 (not res!1039674)) b!1519946))

(assert (= (and b!1519946 c!139679) b!1519947))

(assert (= (and b!1519946 (not c!139679)) b!1519949))

(assert (= (and b!1519947 res!1039675) b!1519948))

(assert (= (or b!1519948 b!1519949) bm!68328))

(assert (=> b!1519946 m!1403195))

(assert (=> b!1519946 m!1403195))

(assert (=> b!1519946 m!1403201))

(assert (=> b!1519947 m!1403195))

(declare-fun m!1403283 () Bool)

(assert (=> b!1519947 m!1403283))

(declare-fun m!1403285 () Bool)

(assert (=> b!1519947 m!1403285))

(assert (=> b!1519947 m!1403195))

(declare-fun m!1403287 () Bool)

(assert (=> b!1519947 m!1403287))

(declare-fun m!1403289 () Bool)

(assert (=> bm!68328 m!1403289))

(assert (=> b!1519675 d!158775))

(declare-fun d!158777 () Bool)

(assert (=> d!158777 (= (validKeyInArray!0 (select (arr!48841 a!2804) j!70)) (and (not (= (select (arr!48841 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48841 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1519676 d!158777))

(declare-fun d!158779 () Bool)

(assert (=> d!158779 (= (validKeyInArray!0 (select (arr!48841 a!2804) i!961)) (and (not (= (select (arr!48841 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48841 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1519666 d!158779))

(declare-fun b!1519950 () Bool)

(declare-fun e!847839 () SeekEntryResult!13012)

(declare-fun e!847841 () SeekEntryResult!13012)

(assert (=> b!1519950 (= e!847839 e!847841)))

(declare-fun c!139682 () Bool)

(declare-fun lt!658868 () (_ BitVec 64))

(assert (=> b!1519950 (= c!139682 (or (= lt!658868 (select (arr!48841 a!2804) j!70)) (= (bvadd lt!658868 lt!658868) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1519951 () Bool)

(declare-fun lt!658867 () SeekEntryResult!13012)

(assert (=> b!1519951 (and (bvsge (index!54445 lt!658867) #b00000000000000000000000000000000) (bvslt (index!54445 lt!658867) (size!49391 a!2804)))))

(declare-fun e!847843 () Bool)

(assert (=> b!1519951 (= e!847843 (= (select (arr!48841 a!2804) (index!54445 lt!658867)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1519952 () Bool)

(assert (=> b!1519952 (and (bvsge (index!54445 lt!658867) #b00000000000000000000000000000000) (bvslt (index!54445 lt!658867) (size!49391 a!2804)))))

(declare-fun res!1039678 () Bool)

(assert (=> b!1519952 (= res!1039678 (= (select (arr!48841 a!2804) (index!54445 lt!658867)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1519952 (=> res!1039678 e!847843)))

(declare-fun b!1519953 () Bool)

(assert (=> b!1519953 (and (bvsge (index!54445 lt!658867) #b00000000000000000000000000000000) (bvslt (index!54445 lt!658867) (size!49391 a!2804)))))

(declare-fun res!1039676 () Bool)

(assert (=> b!1519953 (= res!1039676 (= (select (arr!48841 a!2804) (index!54445 lt!658867)) (select (arr!48841 a!2804) j!70)))))

(assert (=> b!1519953 (=> res!1039676 e!847843)))

(declare-fun e!847842 () Bool)

(assert (=> b!1519953 (= e!847842 e!847843)))

(declare-fun b!1519954 () Bool)

(assert (=> b!1519954 (= e!847841 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48841 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48841 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519955 () Bool)

(assert (=> b!1519955 (= e!847839 (Intermediate!13012 true (toIndex!0 (select (arr!48841 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1519956 () Bool)

(declare-fun e!847840 () Bool)

(assert (=> b!1519956 (= e!847840 e!847842)))

(declare-fun res!1039677 () Bool)

(assert (=> b!1519956 (= res!1039677 (and (is-Intermediate!13012 lt!658867) (not (undefined!13824 lt!658867)) (bvslt (x!136106 lt!658867) #b01111111111111111111111111111110) (bvsge (x!136106 lt!658867) #b00000000000000000000000000000000) (bvsge (x!136106 lt!658867) #b00000000000000000000000000000000)))))

(assert (=> b!1519956 (=> (not res!1039677) (not e!847842))))

(declare-fun b!1519957 () Bool)

(assert (=> b!1519957 (= e!847840 (bvsge (x!136106 lt!658867) #b01111111111111111111111111111110))))

(declare-fun d!158781 () Bool)

(assert (=> d!158781 e!847840))

(declare-fun c!139681 () Bool)

(assert (=> d!158781 (= c!139681 (and (is-Intermediate!13012 lt!658867) (undefined!13824 lt!658867)))))

(assert (=> d!158781 (= lt!658867 e!847839)))

(declare-fun c!139680 () Bool)

(assert (=> d!158781 (= c!139680 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!158781 (= lt!658868 (select (arr!48841 a!2804) (toIndex!0 (select (arr!48841 a!2804) j!70) mask!2512)))))

(assert (=> d!158781 (validMask!0 mask!2512)))

(assert (=> d!158781 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48841 a!2804) j!70) mask!2512) (select (arr!48841 a!2804) j!70) a!2804 mask!2512) lt!658867)))

(declare-fun b!1519958 () Bool)

(assert (=> b!1519958 (= e!847841 (Intermediate!13012 false (toIndex!0 (select (arr!48841 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(assert (= (and d!158781 c!139680) b!1519955))

(assert (= (and d!158781 (not c!139680)) b!1519950))

(assert (= (and b!1519950 c!139682) b!1519958))

(assert (= (and b!1519950 (not c!139682)) b!1519954))

(assert (= (and d!158781 c!139681) b!1519957))

(assert (= (and d!158781 (not c!139681)) b!1519956))

(assert (= (and b!1519956 res!1039677) b!1519953))

(assert (= (and b!1519953 (not res!1039676)) b!1519952))

(assert (= (and b!1519952 (not res!1039678)) b!1519951))

(assert (=> d!158781 m!1403117))

(declare-fun m!1403291 () Bool)

(assert (=> d!158781 m!1403291))

(assert (=> d!158781 m!1403113))

(assert (=> b!1519954 m!1403117))

(declare-fun m!1403293 () Bool)

(assert (=> b!1519954 m!1403293))

(assert (=> b!1519954 m!1403293))

(assert (=> b!1519954 m!1403095))

(declare-fun m!1403295 () Bool)

(assert (=> b!1519954 m!1403295))

(declare-fun m!1403297 () Bool)

(assert (=> b!1519951 m!1403297))

(assert (=> b!1519953 m!1403297))

(assert (=> b!1519952 m!1403297))

(assert (=> b!1519672 d!158781))

(declare-fun d!158783 () Bool)

(declare-fun lt!658870 () (_ BitVec 32))

(declare-fun lt!658869 () (_ BitVec 32))

(assert (=> d!158783 (= lt!658870 (bvmul (bvxor lt!658869 (bvlshr lt!658869 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158783 (= lt!658869 ((_ extract 31 0) (bvand (bvxor (select (arr!48841 a!2804) j!70) (bvlshr (select (arr!48841 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158783 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1039645 (let ((h!36735 ((_ extract 31 0) (bvand (bvxor (select (arr!48841 a!2804) j!70) (bvlshr (select (arr!48841 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136112 (bvmul (bvxor h!36735 (bvlshr h!36735 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136112 (bvlshr x!136112 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1039645 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1039645 #b00000000000000000000000000000000))))))

(assert (=> d!158783 (= (toIndex!0 (select (arr!48841 a!2804) j!70) mask!2512) (bvand (bvxor lt!658870 (bvlshr lt!658870 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1519672 d!158783))

(push 1)

(assert (not b!1519861))

(assert (not d!158717))

(assert (not d!158737))

(assert (not b!1519807))

(assert (not bm!68310))

(assert (not b!1519940))

(assert (not b!1519946))

(assert (not bm!68328))

(assert (not b!1519849))

(assert (not b!1519731))

(assert (not d!158771))

(assert (not b!1519954))

(assert (not bm!68319))

(assert (not d!158719))

(assert (not b!1519850))

(assert (not b!1519947))

(assert (not b!1519846))

(assert (not d!158781))

(assert (not b!1519730))

(check-sat)

(pop 1)

(push 1)

(check-sat)

