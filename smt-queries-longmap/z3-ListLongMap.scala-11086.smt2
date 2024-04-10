; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129350 () Bool)

(assert start!129350)

(declare-fun res!1039545 () Bool)

(declare-fun e!847654 () Bool)

(assert (=> start!129350 (=> (not res!1039545) (not e!847654))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129350 (= res!1039545 (validMask!0 mask!2512))))

(assert (=> start!129350 e!847654))

(assert (=> start!129350 true))

(declare-datatypes ((array!101206 0))(
  ( (array!101207 (arr!48840 (Array (_ BitVec 32) (_ BitVec 64))) (size!49390 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101206)

(declare-fun array_inv!37868 (array!101206) Bool)

(assert (=> start!129350 (array_inv!37868 a!2804)))

(declare-fun b!1519633 () Bool)

(declare-fun res!1039541 () Bool)

(assert (=> b!1519633 (=> (not res!1039541) (not e!847654))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1519633 (= res!1039541 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49390 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49390 a!2804))))))

(declare-fun b!1519634 () Bool)

(declare-fun res!1039540 () Bool)

(assert (=> b!1519634 (=> (not res!1039540) (not e!847654))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1519634 (= res!1039540 (validKeyInArray!0 (select (arr!48840 a!2804) i!961)))))

(declare-fun b!1519635 () Bool)

(declare-fun res!1039546 () Bool)

(assert (=> b!1519635 (=> (not res!1039546) (not e!847654))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1519635 (= res!1039546 (validKeyInArray!0 (select (arr!48840 a!2804) j!70)))))

(declare-fun b!1519636 () Bool)

(declare-fun res!1039543 () Bool)

(assert (=> b!1519636 (=> (not res!1039543) (not e!847654))))

(declare-datatypes ((List!35323 0))(
  ( (Nil!35320) (Cons!35319 (h!36731 (_ BitVec 64)) (t!50017 List!35323)) )
))
(declare-fun arrayNoDuplicates!0 (array!101206 (_ BitVec 32) List!35323) Bool)

(assert (=> b!1519636 (= res!1039543 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35320))))

(declare-fun b!1519637 () Bool)

(declare-fun res!1039539 () Bool)

(assert (=> b!1519637 (=> (not res!1039539) (not e!847654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101206 (_ BitVec 32)) Bool)

(assert (=> b!1519637 (= res!1039539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1519638 () Bool)

(declare-fun e!847657 () Bool)

(assert (=> b!1519638 (= e!847657 (not (or (not (= (select (arr!48840 a!2804) j!70) (select (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (= index!487 resIndex!21))))))

(declare-fun e!847656 () Bool)

(assert (=> b!1519638 e!847656))

(declare-fun res!1039538 () Bool)

(assert (=> b!1519638 (=> (not res!1039538) (not e!847656))))

(assert (=> b!1519638 (= res!1039538 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50890 0))(
  ( (Unit!50891) )
))
(declare-fun lt!658724 () Unit!50890)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101206 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50890)

(assert (=> b!1519638 (= lt!658724 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1519639 () Bool)

(declare-fun res!1039536 () Bool)

(assert (=> b!1519639 (=> (not res!1039536) (not e!847654))))

(assert (=> b!1519639 (= res!1039536 (and (= (size!49390 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49390 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49390 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1519640 () Bool)

(declare-fun res!1039544 () Bool)

(assert (=> b!1519640 (=> (not res!1039544) (not e!847657))))

(declare-datatypes ((SeekEntryResult!13011 0))(
  ( (MissingZero!13011 (index!54439 (_ BitVec 32))) (Found!13011 (index!54440 (_ BitVec 32))) (Intermediate!13011 (undefined!13823 Bool) (index!54441 (_ BitVec 32)) (x!136105 (_ BitVec 32))) (Undefined!13011) (MissingVacant!13011 (index!54442 (_ BitVec 32))) )
))
(declare-fun lt!658726 () SeekEntryResult!13011)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101206 (_ BitVec 32)) SeekEntryResult!13011)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519640 (= res!1039544 (= lt!658726 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101207 (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49390 a!2804)) mask!2512)))))

(declare-fun b!1519641 () Bool)

(declare-fun res!1039537 () Bool)

(assert (=> b!1519641 (=> (not res!1039537) (not e!847657))))

(declare-fun lt!658725 () SeekEntryResult!13011)

(assert (=> b!1519641 (= res!1039537 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48840 a!2804) j!70) a!2804 mask!2512) lt!658725))))

(declare-fun b!1519642 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101206 (_ BitVec 32)) SeekEntryResult!13011)

(assert (=> b!1519642 (= e!847656 (= (seekEntry!0 (select (arr!48840 a!2804) j!70) a!2804 mask!2512) (Found!13011 j!70)))))

(declare-fun b!1519643 () Bool)

(assert (=> b!1519643 (= e!847654 e!847657)))

(declare-fun res!1039542 () Bool)

(assert (=> b!1519643 (=> (not res!1039542) (not e!847657))))

(assert (=> b!1519643 (= res!1039542 (= lt!658726 lt!658725))))

(assert (=> b!1519643 (= lt!658725 (Intermediate!13011 false resIndex!21 resX!21))))

(assert (=> b!1519643 (= lt!658726 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48840 a!2804) j!70) mask!2512) (select (arr!48840 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129350 res!1039545) b!1519639))

(assert (= (and b!1519639 res!1039536) b!1519634))

(assert (= (and b!1519634 res!1039540) b!1519635))

(assert (= (and b!1519635 res!1039546) b!1519637))

(assert (= (and b!1519637 res!1039539) b!1519636))

(assert (= (and b!1519636 res!1039543) b!1519633))

(assert (= (and b!1519633 res!1039541) b!1519643))

(assert (= (and b!1519643 res!1039542) b!1519641))

(assert (= (and b!1519641 res!1039537) b!1519640))

(assert (= (and b!1519640 res!1039544) b!1519638))

(assert (= (and b!1519638 res!1039538) b!1519642))

(declare-fun m!1403059 () Bool)

(assert (=> b!1519642 m!1403059))

(assert (=> b!1519642 m!1403059))

(declare-fun m!1403061 () Bool)

(assert (=> b!1519642 m!1403061))

(assert (=> b!1519635 m!1403059))

(assert (=> b!1519635 m!1403059))

(declare-fun m!1403063 () Bool)

(assert (=> b!1519635 m!1403063))

(assert (=> b!1519643 m!1403059))

(assert (=> b!1519643 m!1403059))

(declare-fun m!1403065 () Bool)

(assert (=> b!1519643 m!1403065))

(assert (=> b!1519643 m!1403065))

(assert (=> b!1519643 m!1403059))

(declare-fun m!1403067 () Bool)

(assert (=> b!1519643 m!1403067))

(declare-fun m!1403069 () Bool)

(assert (=> b!1519637 m!1403069))

(declare-fun m!1403071 () Bool)

(assert (=> start!129350 m!1403071))

(declare-fun m!1403073 () Bool)

(assert (=> start!129350 m!1403073))

(declare-fun m!1403075 () Bool)

(assert (=> b!1519636 m!1403075))

(declare-fun m!1403077 () Bool)

(assert (=> b!1519640 m!1403077))

(declare-fun m!1403079 () Bool)

(assert (=> b!1519640 m!1403079))

(assert (=> b!1519640 m!1403079))

(declare-fun m!1403081 () Bool)

(assert (=> b!1519640 m!1403081))

(assert (=> b!1519640 m!1403081))

(assert (=> b!1519640 m!1403079))

(declare-fun m!1403083 () Bool)

(assert (=> b!1519640 m!1403083))

(assert (=> b!1519638 m!1403059))

(declare-fun m!1403085 () Bool)

(assert (=> b!1519638 m!1403085))

(assert (=> b!1519638 m!1403077))

(assert (=> b!1519638 m!1403079))

(declare-fun m!1403087 () Bool)

(assert (=> b!1519638 m!1403087))

(declare-fun m!1403089 () Bool)

(assert (=> b!1519634 m!1403089))

(assert (=> b!1519634 m!1403089))

(declare-fun m!1403091 () Bool)

(assert (=> b!1519634 m!1403091))

(assert (=> b!1519641 m!1403059))

(assert (=> b!1519641 m!1403059))

(declare-fun m!1403093 () Bool)

(assert (=> b!1519641 m!1403093))

(check-sat (not b!1519641) (not b!1519635) (not b!1519636) (not b!1519634) (not start!129350) (not b!1519640) (not b!1519642) (not b!1519637) (not b!1519638) (not b!1519643))
(check-sat)
(get-model)

(declare-fun d!158701 () Bool)

(assert (=> d!158701 (= (validKeyInArray!0 (select (arr!48840 a!2804) i!961)) (and (not (= (select (arr!48840 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48840 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1519634 d!158701))

(declare-fun b!1519713 () Bool)

(declare-fun lt!658752 () SeekEntryResult!13011)

(assert (=> b!1519713 (and (bvsge (index!54441 lt!658752) #b00000000000000000000000000000000) (bvslt (index!54441 lt!658752) (size!49390 (array!101207 (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49390 a!2804)))))))

(declare-fun res!1039587 () Bool)

(assert (=> b!1519713 (= res!1039587 (= (select (arr!48840 (array!101207 (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49390 a!2804))) (index!54441 lt!658752)) (select (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(declare-fun e!847693 () Bool)

(assert (=> b!1519713 (=> res!1039587 e!847693)))

(declare-fun e!847691 () Bool)

(assert (=> b!1519713 (= e!847691 e!847693)))

(declare-fun b!1519714 () Bool)

(declare-fun e!847689 () SeekEntryResult!13011)

(assert (=> b!1519714 (= e!847689 (Intermediate!13011 true (toIndex!0 (select (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1519715 () Bool)

(declare-fun e!847692 () SeekEntryResult!13011)

(assert (=> b!1519715 (= e!847689 e!847692)))

(declare-fun lt!658753 () (_ BitVec 64))

(declare-fun c!139605 () Bool)

(assert (=> b!1519715 (= c!139605 (or (= lt!658753 (select (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!658753 lt!658753) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!158703 () Bool)

(declare-fun e!847690 () Bool)

(assert (=> d!158703 e!847690))

(declare-fun c!139606 () Bool)

(get-info :version)

(assert (=> d!158703 (= c!139606 (and ((_ is Intermediate!13011) lt!658752) (undefined!13823 lt!658752)))))

(assert (=> d!158703 (= lt!658752 e!847689)))

(declare-fun c!139607 () Bool)

(assert (=> d!158703 (= c!139607 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!158703 (= lt!658753 (select (arr!48840 (array!101207 (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49390 a!2804))) (toIndex!0 (select (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!158703 (validMask!0 mask!2512)))

(assert (=> d!158703 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101207 (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49390 a!2804)) mask!2512) lt!658752)))

(declare-fun b!1519716 () Bool)

(assert (=> b!1519716 (= e!847690 e!847691)))

(declare-fun res!1039588 () Bool)

(assert (=> b!1519716 (= res!1039588 (and ((_ is Intermediate!13011) lt!658752) (not (undefined!13823 lt!658752)) (bvslt (x!136105 lt!658752) #b01111111111111111111111111111110) (bvsge (x!136105 lt!658752) #b00000000000000000000000000000000) (bvsge (x!136105 lt!658752) #b00000000000000000000000000000000)))))

(assert (=> b!1519716 (=> (not res!1039588) (not e!847691))))

(declare-fun b!1519717 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519717 (= e!847692 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101207 (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49390 a!2804)) mask!2512))))

(declare-fun b!1519718 () Bool)

(assert (=> b!1519718 (= e!847692 (Intermediate!13011 false (toIndex!0 (select (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1519719 () Bool)

(assert (=> b!1519719 (and (bvsge (index!54441 lt!658752) #b00000000000000000000000000000000) (bvslt (index!54441 lt!658752) (size!49390 (array!101207 (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49390 a!2804)))))))

(declare-fun res!1039586 () Bool)

(assert (=> b!1519719 (= res!1039586 (= (select (arr!48840 (array!101207 (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49390 a!2804))) (index!54441 lt!658752)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1519719 (=> res!1039586 e!847693)))

(declare-fun b!1519720 () Bool)

(assert (=> b!1519720 (and (bvsge (index!54441 lt!658752) #b00000000000000000000000000000000) (bvslt (index!54441 lt!658752) (size!49390 (array!101207 (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49390 a!2804)))))))

(assert (=> b!1519720 (= e!847693 (= (select (arr!48840 (array!101207 (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49390 a!2804))) (index!54441 lt!658752)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1519721 () Bool)

(assert (=> b!1519721 (= e!847690 (bvsge (x!136105 lt!658752) #b01111111111111111111111111111110))))

(assert (= (and d!158703 c!139607) b!1519714))

(assert (= (and d!158703 (not c!139607)) b!1519715))

(assert (= (and b!1519715 c!139605) b!1519718))

(assert (= (and b!1519715 (not c!139605)) b!1519717))

(assert (= (and d!158703 c!139606) b!1519721))

(assert (= (and d!158703 (not c!139606)) b!1519716))

(assert (= (and b!1519716 res!1039588) b!1519713))

(assert (= (and b!1519713 (not res!1039587)) b!1519719))

(assert (= (and b!1519719 (not res!1039586)) b!1519720))

(assert (=> d!158703 m!1403081))

(declare-fun m!1403137 () Bool)

(assert (=> d!158703 m!1403137))

(assert (=> d!158703 m!1403071))

(assert (=> b!1519717 m!1403081))

(declare-fun m!1403139 () Bool)

(assert (=> b!1519717 m!1403139))

(assert (=> b!1519717 m!1403139))

(assert (=> b!1519717 m!1403079))

(declare-fun m!1403141 () Bool)

(assert (=> b!1519717 m!1403141))

(declare-fun m!1403143 () Bool)

(assert (=> b!1519713 m!1403143))

(assert (=> b!1519720 m!1403143))

(assert (=> b!1519719 m!1403143))

(assert (=> b!1519640 d!158703))

(declare-fun d!158711 () Bool)

(declare-fun lt!658765 () (_ BitVec 32))

(declare-fun lt!658764 () (_ BitVec 32))

(assert (=> d!158711 (= lt!658765 (bvmul (bvxor lt!658764 (bvlshr lt!658764 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158711 (= lt!658764 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158711 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1039589 (let ((h!36733 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136108 (bvmul (bvxor h!36733 (bvlshr h!36733 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136108 (bvlshr x!136108 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1039589 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1039589 #b00000000000000000000000000000000))))))

(assert (=> d!158711 (= (toIndex!0 (select (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!658765 (bvlshr lt!658765 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1519640 d!158711))

(declare-fun d!158713 () Bool)

(assert (=> d!158713 (= (validKeyInArray!0 (select (arr!48840 a!2804) j!70)) (and (not (= (select (arr!48840 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48840 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1519635 d!158713))

(declare-fun d!158715 () Bool)

(assert (=> d!158715 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!129350 d!158715))

(declare-fun d!158721 () Bool)

(assert (=> d!158721 (= (array_inv!37868 a!2804) (bvsge (size!49390 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!129350 d!158721))

(declare-fun b!1519771 () Bool)

(declare-fun e!847729 () Bool)

(declare-fun contains!9976 (List!35323 (_ BitVec 64)) Bool)

(assert (=> b!1519771 (= e!847729 (contains!9976 Nil!35320 (select (arr!48840 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1519772 () Bool)

(declare-fun e!847727 () Bool)

(declare-fun e!847726 () Bool)

(assert (=> b!1519772 (= e!847727 e!847726)))

(declare-fun c!139622 () Bool)

(assert (=> b!1519772 (= c!139622 (validKeyInArray!0 (select (arr!48840 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68313 () Bool)

(declare-fun call!68316 () Bool)

(assert (=> bm!68313 (= call!68316 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139622 (Cons!35319 (select (arr!48840 a!2804) #b00000000000000000000000000000000) Nil!35320) Nil!35320)))))

(declare-fun b!1519773 () Bool)

(declare-fun e!847728 () Bool)

(assert (=> b!1519773 (= e!847728 e!847727)))

(declare-fun res!1039613 () Bool)

(assert (=> b!1519773 (=> (not res!1039613) (not e!847727))))

(assert (=> b!1519773 (= res!1039613 (not e!847729))))

(declare-fun res!1039614 () Bool)

(assert (=> b!1519773 (=> (not res!1039614) (not e!847729))))

(assert (=> b!1519773 (= res!1039614 (validKeyInArray!0 (select (arr!48840 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1519774 () Bool)

(assert (=> b!1519774 (= e!847726 call!68316)))

(declare-fun b!1519775 () Bool)

(assert (=> b!1519775 (= e!847726 call!68316)))

(declare-fun d!158723 () Bool)

(declare-fun res!1039612 () Bool)

(assert (=> d!158723 (=> res!1039612 e!847728)))

(assert (=> d!158723 (= res!1039612 (bvsge #b00000000000000000000000000000000 (size!49390 a!2804)))))

(assert (=> d!158723 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35320) e!847728)))

(assert (= (and d!158723 (not res!1039612)) b!1519773))

(assert (= (and b!1519773 res!1039614) b!1519771))

(assert (= (and b!1519773 res!1039613) b!1519772))

(assert (= (and b!1519772 c!139622) b!1519774))

(assert (= (and b!1519772 (not c!139622)) b!1519775))

(assert (= (or b!1519774 b!1519775) bm!68313))

(declare-fun m!1403163 () Bool)

(assert (=> b!1519771 m!1403163))

(assert (=> b!1519771 m!1403163))

(declare-fun m!1403165 () Bool)

(assert (=> b!1519771 m!1403165))

(assert (=> b!1519772 m!1403163))

(assert (=> b!1519772 m!1403163))

(declare-fun m!1403167 () Bool)

(assert (=> b!1519772 m!1403167))

(assert (=> bm!68313 m!1403163))

(declare-fun m!1403169 () Bool)

(assert (=> bm!68313 m!1403169))

(assert (=> b!1519773 m!1403163))

(assert (=> b!1519773 m!1403163))

(assert (=> b!1519773 m!1403167))

(assert (=> b!1519636 d!158723))

(declare-fun b!1519776 () Bool)

(declare-fun lt!658778 () SeekEntryResult!13011)

(assert (=> b!1519776 (and (bvsge (index!54441 lt!658778) #b00000000000000000000000000000000) (bvslt (index!54441 lt!658778) (size!49390 a!2804)))))

(declare-fun res!1039616 () Bool)

(assert (=> b!1519776 (= res!1039616 (= (select (arr!48840 a!2804) (index!54441 lt!658778)) (select (arr!48840 a!2804) j!70)))))

(declare-fun e!847734 () Bool)

(assert (=> b!1519776 (=> res!1039616 e!847734)))

(declare-fun e!847732 () Bool)

(assert (=> b!1519776 (= e!847732 e!847734)))

(declare-fun b!1519777 () Bool)

(declare-fun e!847730 () SeekEntryResult!13011)

(assert (=> b!1519777 (= e!847730 (Intermediate!13011 true index!487 x!534))))

(declare-fun b!1519778 () Bool)

(declare-fun e!847733 () SeekEntryResult!13011)

(assert (=> b!1519778 (= e!847730 e!847733)))

(declare-fun lt!658779 () (_ BitVec 64))

(declare-fun c!139623 () Bool)

(assert (=> b!1519778 (= c!139623 (or (= lt!658779 (select (arr!48840 a!2804) j!70)) (= (bvadd lt!658779 lt!658779) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!158727 () Bool)

(declare-fun e!847731 () Bool)

(assert (=> d!158727 e!847731))

(declare-fun c!139624 () Bool)

(assert (=> d!158727 (= c!139624 (and ((_ is Intermediate!13011) lt!658778) (undefined!13823 lt!658778)))))

(assert (=> d!158727 (= lt!658778 e!847730)))

(declare-fun c!139625 () Bool)

(assert (=> d!158727 (= c!139625 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!158727 (= lt!658779 (select (arr!48840 a!2804) index!487))))

(assert (=> d!158727 (validMask!0 mask!2512)))

(assert (=> d!158727 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48840 a!2804) j!70) a!2804 mask!2512) lt!658778)))

(declare-fun b!1519779 () Bool)

(assert (=> b!1519779 (= e!847731 e!847732)))

(declare-fun res!1039617 () Bool)

(assert (=> b!1519779 (= res!1039617 (and ((_ is Intermediate!13011) lt!658778) (not (undefined!13823 lt!658778)) (bvslt (x!136105 lt!658778) #b01111111111111111111111111111110) (bvsge (x!136105 lt!658778) #b00000000000000000000000000000000) (bvsge (x!136105 lt!658778) x!534)))))

(assert (=> b!1519779 (=> (not res!1039617) (not e!847732))))

(declare-fun b!1519780 () Bool)

(assert (=> b!1519780 (= e!847733 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48840 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519781 () Bool)

(assert (=> b!1519781 (= e!847733 (Intermediate!13011 false index!487 x!534))))

(declare-fun b!1519782 () Bool)

(assert (=> b!1519782 (and (bvsge (index!54441 lt!658778) #b00000000000000000000000000000000) (bvslt (index!54441 lt!658778) (size!49390 a!2804)))))

(declare-fun res!1039615 () Bool)

(assert (=> b!1519782 (= res!1039615 (= (select (arr!48840 a!2804) (index!54441 lt!658778)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1519782 (=> res!1039615 e!847734)))

(declare-fun b!1519783 () Bool)

(assert (=> b!1519783 (and (bvsge (index!54441 lt!658778) #b00000000000000000000000000000000) (bvslt (index!54441 lt!658778) (size!49390 a!2804)))))

(assert (=> b!1519783 (= e!847734 (= (select (arr!48840 a!2804) (index!54441 lt!658778)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1519784 () Bool)

(assert (=> b!1519784 (= e!847731 (bvsge (x!136105 lt!658778) #b01111111111111111111111111111110))))

(assert (= (and d!158727 c!139625) b!1519777))

(assert (= (and d!158727 (not c!139625)) b!1519778))

(assert (= (and b!1519778 c!139623) b!1519781))

(assert (= (and b!1519778 (not c!139623)) b!1519780))

(assert (= (and d!158727 c!139624) b!1519784))

(assert (= (and d!158727 (not c!139624)) b!1519779))

(assert (= (and b!1519779 res!1039617) b!1519776))

(assert (= (and b!1519776 (not res!1039616)) b!1519782))

(assert (= (and b!1519782 (not res!1039615)) b!1519783))

(declare-fun m!1403171 () Bool)

(assert (=> d!158727 m!1403171))

(assert (=> d!158727 m!1403071))

(declare-fun m!1403173 () Bool)

(assert (=> b!1519780 m!1403173))

(assert (=> b!1519780 m!1403173))

(assert (=> b!1519780 m!1403059))

(declare-fun m!1403175 () Bool)

(assert (=> b!1519780 m!1403175))

(declare-fun m!1403177 () Bool)

(assert (=> b!1519776 m!1403177))

(assert (=> b!1519783 m!1403177))

(assert (=> b!1519782 m!1403177))

(assert (=> b!1519641 d!158727))

(declare-fun d!158729 () Bool)

(declare-fun lt!658810 () SeekEntryResult!13011)

(assert (=> d!158729 (and (or ((_ is MissingVacant!13011) lt!658810) (not ((_ is Found!13011) lt!658810)) (and (bvsge (index!54440 lt!658810) #b00000000000000000000000000000000) (bvslt (index!54440 lt!658810) (size!49390 a!2804)))) (not ((_ is MissingVacant!13011) lt!658810)) (or (not ((_ is Found!13011) lt!658810)) (= (select (arr!48840 a!2804) (index!54440 lt!658810)) (select (arr!48840 a!2804) j!70))))))

(declare-fun e!847778 () SeekEntryResult!13011)

(assert (=> d!158729 (= lt!658810 e!847778)))

(declare-fun c!139649 () Bool)

(declare-fun lt!658809 () SeekEntryResult!13011)

(assert (=> d!158729 (= c!139649 (and ((_ is Intermediate!13011) lt!658809) (undefined!13823 lt!658809)))))

(assert (=> d!158729 (= lt!658809 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48840 a!2804) j!70) mask!2512) (select (arr!48840 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!158729 (validMask!0 mask!2512)))

(assert (=> d!158729 (= (seekEntry!0 (select (arr!48840 a!2804) j!70) a!2804 mask!2512) lt!658810)))

(declare-fun b!1519851 () Bool)

(declare-fun e!847779 () SeekEntryResult!13011)

(assert (=> b!1519851 (= e!847778 e!847779)))

(declare-fun lt!658811 () (_ BitVec 64))

(assert (=> b!1519851 (= lt!658811 (select (arr!48840 a!2804) (index!54441 lt!658809)))))

(declare-fun c!139647 () Bool)

(assert (=> b!1519851 (= c!139647 (= lt!658811 (select (arr!48840 a!2804) j!70)))))

(declare-fun b!1519852 () Bool)

(declare-fun c!139648 () Bool)

(assert (=> b!1519852 (= c!139648 (= lt!658811 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!847777 () SeekEntryResult!13011)

(assert (=> b!1519852 (= e!847779 e!847777)))

(declare-fun b!1519853 () Bool)

(assert (=> b!1519853 (= e!847779 (Found!13011 (index!54441 lt!658809)))))

(declare-fun b!1519854 () Bool)

(declare-fun lt!658812 () SeekEntryResult!13011)

(assert (=> b!1519854 (= e!847777 (ite ((_ is MissingVacant!13011) lt!658812) (MissingZero!13011 (index!54442 lt!658812)) lt!658812))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101206 (_ BitVec 32)) SeekEntryResult!13011)

(assert (=> b!1519854 (= lt!658812 (seekKeyOrZeroReturnVacant!0 (x!136105 lt!658809) (index!54441 lt!658809) (index!54441 lt!658809) (select (arr!48840 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519855 () Bool)

(assert (=> b!1519855 (= e!847778 Undefined!13011)))

(declare-fun b!1519856 () Bool)

(assert (=> b!1519856 (= e!847777 (MissingZero!13011 (index!54441 lt!658809)))))

(assert (= (and d!158729 c!139649) b!1519855))

(assert (= (and d!158729 (not c!139649)) b!1519851))

(assert (= (and b!1519851 c!139647) b!1519853))

(assert (= (and b!1519851 (not c!139647)) b!1519852))

(assert (= (and b!1519852 c!139648) b!1519856))

(assert (= (and b!1519852 (not c!139648)) b!1519854))

(declare-fun m!1403203 () Bool)

(assert (=> d!158729 m!1403203))

(assert (=> d!158729 m!1403059))

(assert (=> d!158729 m!1403065))

(assert (=> d!158729 m!1403065))

(assert (=> d!158729 m!1403059))

(assert (=> d!158729 m!1403067))

(assert (=> d!158729 m!1403071))

(declare-fun m!1403205 () Bool)

(assert (=> b!1519851 m!1403205))

(assert (=> b!1519854 m!1403059))

(declare-fun m!1403207 () Bool)

(assert (=> b!1519854 m!1403207))

(assert (=> b!1519642 d!158729))

(declare-fun bm!68322 () Bool)

(declare-fun call!68325 () Bool)

(assert (=> bm!68322 (= call!68325 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1519892 () Bool)

(declare-fun e!847802 () Bool)

(declare-fun e!847803 () Bool)

(assert (=> b!1519892 (= e!847802 e!847803)))

(declare-fun lt!658836 () (_ BitVec 64))

(assert (=> b!1519892 (= lt!658836 (select (arr!48840 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!658837 () Unit!50890)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101206 (_ BitVec 64) (_ BitVec 32)) Unit!50890)

(assert (=> b!1519892 (= lt!658837 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!658836 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101206 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1519892 (arrayContainsKey!0 a!2804 lt!658836 #b00000000000000000000000000000000)))

(declare-fun lt!658838 () Unit!50890)

(assert (=> b!1519892 (= lt!658838 lt!658837)))

(declare-fun res!1039656 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101206 (_ BitVec 32)) SeekEntryResult!13011)

(assert (=> b!1519892 (= res!1039656 (= (seekEntryOrOpen!0 (select (arr!48840 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13011 #b00000000000000000000000000000000)))))

(assert (=> b!1519892 (=> (not res!1039656) (not e!847803))))

(declare-fun b!1519894 () Bool)

(declare-fun e!847801 () Bool)

(assert (=> b!1519894 (= e!847801 e!847802)))

(declare-fun c!139661 () Bool)

(assert (=> b!1519894 (= c!139661 (validKeyInArray!0 (select (arr!48840 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1519895 () Bool)

(assert (=> b!1519895 (= e!847802 call!68325)))

(declare-fun b!1519893 () Bool)

(assert (=> b!1519893 (= e!847803 call!68325)))

(declare-fun d!158739 () Bool)

(declare-fun res!1039657 () Bool)

(assert (=> d!158739 (=> res!1039657 e!847801)))

(assert (=> d!158739 (= res!1039657 (bvsge #b00000000000000000000000000000000 (size!49390 a!2804)))))

(assert (=> d!158739 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!847801)))

(assert (= (and d!158739 (not res!1039657)) b!1519894))

(assert (= (and b!1519894 c!139661) b!1519892))

(assert (= (and b!1519894 (not c!139661)) b!1519895))

(assert (= (and b!1519892 res!1039656) b!1519893))

(assert (= (or b!1519893 b!1519895) bm!68322))

(declare-fun m!1403235 () Bool)

(assert (=> bm!68322 m!1403235))

(assert (=> b!1519892 m!1403163))

(declare-fun m!1403237 () Bool)

(assert (=> b!1519892 m!1403237))

(declare-fun m!1403239 () Bool)

(assert (=> b!1519892 m!1403239))

(assert (=> b!1519892 m!1403163))

(declare-fun m!1403241 () Bool)

(assert (=> b!1519892 m!1403241))

(assert (=> b!1519894 m!1403163))

(assert (=> b!1519894 m!1403163))

(assert (=> b!1519894 m!1403167))

(assert (=> b!1519637 d!158739))

(declare-fun call!68326 () Bool)

(declare-fun bm!68323 () Bool)

(assert (=> bm!68323 (= call!68326 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1519896 () Bool)

(declare-fun e!847805 () Bool)

(declare-fun e!847806 () Bool)

(assert (=> b!1519896 (= e!847805 e!847806)))

(declare-fun lt!658839 () (_ BitVec 64))

(assert (=> b!1519896 (= lt!658839 (select (arr!48840 a!2804) j!70))))

(declare-fun lt!658840 () Unit!50890)

(assert (=> b!1519896 (= lt!658840 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!658839 j!70))))

(assert (=> b!1519896 (arrayContainsKey!0 a!2804 lt!658839 #b00000000000000000000000000000000)))

(declare-fun lt!658841 () Unit!50890)

(assert (=> b!1519896 (= lt!658841 lt!658840)))

(declare-fun res!1039658 () Bool)

(assert (=> b!1519896 (= res!1039658 (= (seekEntryOrOpen!0 (select (arr!48840 a!2804) j!70) a!2804 mask!2512) (Found!13011 j!70)))))

(assert (=> b!1519896 (=> (not res!1039658) (not e!847806))))

(declare-fun b!1519898 () Bool)

(declare-fun e!847804 () Bool)

(assert (=> b!1519898 (= e!847804 e!847805)))

(declare-fun c!139662 () Bool)

(assert (=> b!1519898 (= c!139662 (validKeyInArray!0 (select (arr!48840 a!2804) j!70)))))

(declare-fun b!1519899 () Bool)

(assert (=> b!1519899 (= e!847805 call!68326)))

(declare-fun b!1519897 () Bool)

(assert (=> b!1519897 (= e!847806 call!68326)))

(declare-fun d!158757 () Bool)

(declare-fun res!1039659 () Bool)

(assert (=> d!158757 (=> res!1039659 e!847804)))

(assert (=> d!158757 (= res!1039659 (bvsge j!70 (size!49390 a!2804)))))

(assert (=> d!158757 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!847804)))

(assert (= (and d!158757 (not res!1039659)) b!1519898))

(assert (= (and b!1519898 c!139662) b!1519896))

(assert (= (and b!1519898 (not c!139662)) b!1519899))

(assert (= (and b!1519896 res!1039658) b!1519897))

(assert (= (or b!1519897 b!1519899) bm!68323))

(declare-fun m!1403243 () Bool)

(assert (=> bm!68323 m!1403243))

(assert (=> b!1519896 m!1403059))

(declare-fun m!1403245 () Bool)

(assert (=> b!1519896 m!1403245))

(declare-fun m!1403247 () Bool)

(assert (=> b!1519896 m!1403247))

(assert (=> b!1519896 m!1403059))

(declare-fun m!1403249 () Bool)

(assert (=> b!1519896 m!1403249))

(assert (=> b!1519898 m!1403059))

(assert (=> b!1519898 m!1403059))

(assert (=> b!1519898 m!1403063))

(assert (=> b!1519638 d!158757))

(declare-fun d!158759 () Bool)

(assert (=> d!158759 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!658844 () Unit!50890)

(declare-fun choose!38 (array!101206 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50890)

(assert (=> d!158759 (= lt!658844 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!158759 (validMask!0 mask!2512)))

(assert (=> d!158759 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!658844)))

(declare-fun bs!43617 () Bool)

(assert (= bs!43617 d!158759))

(assert (=> bs!43617 m!1403087))

(declare-fun m!1403251 () Bool)

(assert (=> bs!43617 m!1403251))

(assert (=> bs!43617 m!1403071))

(assert (=> b!1519638 d!158759))

(declare-fun b!1519900 () Bool)

(declare-fun lt!658845 () SeekEntryResult!13011)

(assert (=> b!1519900 (and (bvsge (index!54441 lt!658845) #b00000000000000000000000000000000) (bvslt (index!54441 lt!658845) (size!49390 a!2804)))))

(declare-fun res!1039661 () Bool)

(assert (=> b!1519900 (= res!1039661 (= (select (arr!48840 a!2804) (index!54441 lt!658845)) (select (arr!48840 a!2804) j!70)))))

(declare-fun e!847811 () Bool)

(assert (=> b!1519900 (=> res!1039661 e!847811)))

(declare-fun e!847809 () Bool)

(assert (=> b!1519900 (= e!847809 e!847811)))

(declare-fun e!847807 () SeekEntryResult!13011)

(declare-fun b!1519901 () Bool)

(assert (=> b!1519901 (= e!847807 (Intermediate!13011 true (toIndex!0 (select (arr!48840 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1519902 () Bool)

(declare-fun e!847810 () SeekEntryResult!13011)

(assert (=> b!1519902 (= e!847807 e!847810)))

(declare-fun lt!658846 () (_ BitVec 64))

(declare-fun c!139663 () Bool)

(assert (=> b!1519902 (= c!139663 (or (= lt!658846 (select (arr!48840 a!2804) j!70)) (= (bvadd lt!658846 lt!658846) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!158761 () Bool)

(declare-fun e!847808 () Bool)

(assert (=> d!158761 e!847808))

(declare-fun c!139664 () Bool)

(assert (=> d!158761 (= c!139664 (and ((_ is Intermediate!13011) lt!658845) (undefined!13823 lt!658845)))))

(assert (=> d!158761 (= lt!658845 e!847807)))

(declare-fun c!139665 () Bool)

(assert (=> d!158761 (= c!139665 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!158761 (= lt!658846 (select (arr!48840 a!2804) (toIndex!0 (select (arr!48840 a!2804) j!70) mask!2512)))))

(assert (=> d!158761 (validMask!0 mask!2512)))

(assert (=> d!158761 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48840 a!2804) j!70) mask!2512) (select (arr!48840 a!2804) j!70) a!2804 mask!2512) lt!658845)))

(declare-fun b!1519903 () Bool)

(assert (=> b!1519903 (= e!847808 e!847809)))

(declare-fun res!1039662 () Bool)

(assert (=> b!1519903 (= res!1039662 (and ((_ is Intermediate!13011) lt!658845) (not (undefined!13823 lt!658845)) (bvslt (x!136105 lt!658845) #b01111111111111111111111111111110) (bvsge (x!136105 lt!658845) #b00000000000000000000000000000000) (bvsge (x!136105 lt!658845) #b00000000000000000000000000000000)))))

(assert (=> b!1519903 (=> (not res!1039662) (not e!847809))))

(declare-fun b!1519904 () Bool)

(assert (=> b!1519904 (= e!847810 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48840 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48840 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519905 () Bool)

(assert (=> b!1519905 (= e!847810 (Intermediate!13011 false (toIndex!0 (select (arr!48840 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1519906 () Bool)

(assert (=> b!1519906 (and (bvsge (index!54441 lt!658845) #b00000000000000000000000000000000) (bvslt (index!54441 lt!658845) (size!49390 a!2804)))))

(declare-fun res!1039660 () Bool)

(assert (=> b!1519906 (= res!1039660 (= (select (arr!48840 a!2804) (index!54441 lt!658845)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1519906 (=> res!1039660 e!847811)))

(declare-fun b!1519907 () Bool)

(assert (=> b!1519907 (and (bvsge (index!54441 lt!658845) #b00000000000000000000000000000000) (bvslt (index!54441 lt!658845) (size!49390 a!2804)))))

(assert (=> b!1519907 (= e!847811 (= (select (arr!48840 a!2804) (index!54441 lt!658845)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1519908 () Bool)

(assert (=> b!1519908 (= e!847808 (bvsge (x!136105 lt!658845) #b01111111111111111111111111111110))))

(assert (= (and d!158761 c!139665) b!1519901))

(assert (= (and d!158761 (not c!139665)) b!1519902))

(assert (= (and b!1519902 c!139663) b!1519905))

(assert (= (and b!1519902 (not c!139663)) b!1519904))

(assert (= (and d!158761 c!139664) b!1519908))

(assert (= (and d!158761 (not c!139664)) b!1519903))

(assert (= (and b!1519903 res!1039662) b!1519900))

(assert (= (and b!1519900 (not res!1039661)) b!1519906))

(assert (= (and b!1519906 (not res!1039660)) b!1519907))

(assert (=> d!158761 m!1403065))

(declare-fun m!1403253 () Bool)

(assert (=> d!158761 m!1403253))

(assert (=> d!158761 m!1403071))

(assert (=> b!1519904 m!1403065))

(declare-fun m!1403255 () Bool)

(assert (=> b!1519904 m!1403255))

(assert (=> b!1519904 m!1403255))

(assert (=> b!1519904 m!1403059))

(declare-fun m!1403257 () Bool)

(assert (=> b!1519904 m!1403257))

(declare-fun m!1403259 () Bool)

(assert (=> b!1519900 m!1403259))

(assert (=> b!1519907 m!1403259))

(assert (=> b!1519906 m!1403259))

(assert (=> b!1519643 d!158761))

(declare-fun d!158769 () Bool)

(declare-fun lt!658848 () (_ BitVec 32))

(declare-fun lt!658847 () (_ BitVec 32))

(assert (=> d!158769 (= lt!658848 (bvmul (bvxor lt!658847 (bvlshr lt!658847 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158769 (= lt!658847 ((_ extract 31 0) (bvand (bvxor (select (arr!48840 a!2804) j!70) (bvlshr (select (arr!48840 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158769 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1039589 (let ((h!36733 ((_ extract 31 0) (bvand (bvxor (select (arr!48840 a!2804) j!70) (bvlshr (select (arr!48840 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136108 (bvmul (bvxor h!36733 (bvlshr h!36733 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136108 (bvlshr x!136108 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1039589 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1039589 #b00000000000000000000000000000000))))))

(assert (=> d!158769 (= (toIndex!0 (select (arr!48840 a!2804) j!70) mask!2512) (bvand (bvxor lt!658848 (bvlshr lt!658848 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1519643 d!158769))

(check-sat (not b!1519904) (not d!158727) (not bm!68323) (not d!158703) (not d!158729) (not bm!68322) (not b!1519771) (not b!1519772) (not b!1519898) (not bm!68313) (not b!1519892) (not b!1519780) (not b!1519896) (not b!1519773) (not d!158759) (not b!1519854) (not b!1519717) (not b!1519894) (not d!158761))
(check-sat)
(get-model)

(declare-fun b!1519959 () Bool)

(declare-fun lt!658871 () SeekEntryResult!13011)

(assert (=> b!1519959 (and (bvsge (index!54441 lt!658871) #b00000000000000000000000000000000) (bvslt (index!54441 lt!658871) (size!49390 (array!101207 (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49390 a!2804)))))))

(declare-fun res!1039680 () Bool)

(assert (=> b!1519959 (= res!1039680 (= (select (arr!48840 (array!101207 (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49390 a!2804))) (index!54441 lt!658871)) (select (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(declare-fun e!847848 () Bool)

(assert (=> b!1519959 (=> res!1039680 e!847848)))

(declare-fun e!847846 () Bool)

(assert (=> b!1519959 (= e!847846 e!847848)))

(declare-fun e!847844 () SeekEntryResult!13011)

(declare-fun b!1519960 () Bool)

(assert (=> b!1519960 (= e!847844 (Intermediate!13011 true (nextIndex!0 (toIndex!0 (select (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1519961 () Bool)

(declare-fun e!847847 () SeekEntryResult!13011)

(assert (=> b!1519961 (= e!847844 e!847847)))

(declare-fun lt!658872 () (_ BitVec 64))

(declare-fun c!139683 () Bool)

(assert (=> b!1519961 (= c!139683 (or (= lt!658872 (select (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!658872 lt!658872) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!158785 () Bool)

(declare-fun e!847845 () Bool)

(assert (=> d!158785 e!847845))

(declare-fun c!139684 () Bool)

(assert (=> d!158785 (= c!139684 (and ((_ is Intermediate!13011) lt!658871) (undefined!13823 lt!658871)))))

(assert (=> d!158785 (= lt!658871 e!847844)))

(declare-fun c!139685 () Bool)

(assert (=> d!158785 (= c!139685 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!158785 (= lt!658872 (select (arr!48840 (array!101207 (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49390 a!2804))) (nextIndex!0 (toIndex!0 (select (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512)))))

(assert (=> d!158785 (validMask!0 mask!2512)))

(assert (=> d!158785 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101207 (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49390 a!2804)) mask!2512) lt!658871)))

(declare-fun b!1519962 () Bool)

(assert (=> b!1519962 (= e!847845 e!847846)))

(declare-fun res!1039681 () Bool)

(assert (=> b!1519962 (= res!1039681 (and ((_ is Intermediate!13011) lt!658871) (not (undefined!13823 lt!658871)) (bvslt (x!136105 lt!658871) #b01111111111111111111111111111110) (bvsge (x!136105 lt!658871) #b00000000000000000000000000000000) (bvsge (x!136105 lt!658871) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1519962 (=> (not res!1039681) (not e!847846))))

(declare-fun b!1519963 () Bool)

(assert (=> b!1519963 (= e!847847 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 (select (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101207 (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49390 a!2804)) mask!2512))))

(declare-fun b!1519964 () Bool)

(assert (=> b!1519964 (= e!847847 (Intermediate!13011 false (nextIndex!0 (toIndex!0 (select (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1519965 () Bool)

(assert (=> b!1519965 (and (bvsge (index!54441 lt!658871) #b00000000000000000000000000000000) (bvslt (index!54441 lt!658871) (size!49390 (array!101207 (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49390 a!2804)))))))

(declare-fun res!1039679 () Bool)

(assert (=> b!1519965 (= res!1039679 (= (select (arr!48840 (array!101207 (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49390 a!2804))) (index!54441 lt!658871)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1519965 (=> res!1039679 e!847848)))

(declare-fun b!1519966 () Bool)

(assert (=> b!1519966 (and (bvsge (index!54441 lt!658871) #b00000000000000000000000000000000) (bvslt (index!54441 lt!658871) (size!49390 (array!101207 (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49390 a!2804)))))))

(assert (=> b!1519966 (= e!847848 (= (select (arr!48840 (array!101207 (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49390 a!2804))) (index!54441 lt!658871)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1519967 () Bool)

(assert (=> b!1519967 (= e!847845 (bvsge (x!136105 lt!658871) #b01111111111111111111111111111110))))

(assert (= (and d!158785 c!139685) b!1519960))

(assert (= (and d!158785 (not c!139685)) b!1519961))

(assert (= (and b!1519961 c!139683) b!1519964))

(assert (= (and b!1519961 (not c!139683)) b!1519963))

(assert (= (and d!158785 c!139684) b!1519967))

(assert (= (and d!158785 (not c!139684)) b!1519962))

(assert (= (and b!1519962 res!1039681) b!1519959))

(assert (= (and b!1519959 (not res!1039680)) b!1519965))

(assert (= (and b!1519965 (not res!1039679)) b!1519966))

(assert (=> d!158785 m!1403139))

(declare-fun m!1403299 () Bool)

(assert (=> d!158785 m!1403299))

(assert (=> d!158785 m!1403071))

(assert (=> b!1519963 m!1403139))

(declare-fun m!1403301 () Bool)

(assert (=> b!1519963 m!1403301))

(assert (=> b!1519963 m!1403301))

(assert (=> b!1519963 m!1403079))

(declare-fun m!1403303 () Bool)

(assert (=> b!1519963 m!1403303))

(declare-fun m!1403305 () Bool)

(assert (=> b!1519959 m!1403305))

(assert (=> b!1519966 m!1403305))

(assert (=> b!1519965 m!1403305))

(assert (=> b!1519717 d!158785))

(declare-fun d!158787 () Bool)

(declare-fun lt!658875 () (_ BitVec 32))

(assert (=> d!158787 (and (bvsge lt!658875 #b00000000000000000000000000000000) (bvslt lt!658875 (bvadd mask!2512 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!158787 (= lt!658875 (choose!52 (toIndex!0 (select (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512))))

(assert (=> d!158787 (validMask!0 mask!2512)))

(assert (=> d!158787 (= (nextIndex!0 (toIndex!0 (select (store (arr!48840 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) lt!658875)))

(declare-fun bs!43618 () Bool)

(assert (= bs!43618 d!158787))

(assert (=> bs!43618 m!1403081))

(declare-fun m!1403307 () Bool)

(assert (=> bs!43618 m!1403307))

(assert (=> bs!43618 m!1403071))

(assert (=> b!1519717 d!158787))

(declare-fun b!1519968 () Bool)

(declare-fun e!847852 () Bool)

(assert (=> b!1519968 (= e!847852 (contains!9976 (ite c!139622 (Cons!35319 (select (arr!48840 a!2804) #b00000000000000000000000000000000) Nil!35320) Nil!35320) (select (arr!48840 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1519969 () Bool)

(declare-fun e!847850 () Bool)

(declare-fun e!847849 () Bool)

(assert (=> b!1519969 (= e!847850 e!847849)))

(declare-fun c!139686 () Bool)

(assert (=> b!1519969 (= c!139686 (validKeyInArray!0 (select (arr!48840 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!68329 () Bool)

(declare-fun call!68332 () Bool)

(assert (=> bm!68329 (= call!68332 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!139686 (Cons!35319 (select (arr!48840 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!139622 (Cons!35319 (select (arr!48840 a!2804) #b00000000000000000000000000000000) Nil!35320) Nil!35320)) (ite c!139622 (Cons!35319 (select (arr!48840 a!2804) #b00000000000000000000000000000000) Nil!35320) Nil!35320))))))

(declare-fun b!1519970 () Bool)

(declare-fun e!847851 () Bool)

(assert (=> b!1519970 (= e!847851 e!847850)))

(declare-fun res!1039683 () Bool)

(assert (=> b!1519970 (=> (not res!1039683) (not e!847850))))

(assert (=> b!1519970 (= res!1039683 (not e!847852))))

(declare-fun res!1039684 () Bool)

(assert (=> b!1519970 (=> (not res!1039684) (not e!847852))))

(assert (=> b!1519970 (= res!1039684 (validKeyInArray!0 (select (arr!48840 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1519971 () Bool)

(assert (=> b!1519971 (= e!847849 call!68332)))

(declare-fun b!1519972 () Bool)

(assert (=> b!1519972 (= e!847849 call!68332)))

(declare-fun d!158789 () Bool)

(declare-fun res!1039682 () Bool)

(assert (=> d!158789 (=> res!1039682 e!847851)))

(assert (=> d!158789 (= res!1039682 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!49390 a!2804)))))

(assert (=> d!158789 (= (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139622 (Cons!35319 (select (arr!48840 a!2804) #b00000000000000000000000000000000) Nil!35320) Nil!35320)) e!847851)))

(assert (= (and d!158789 (not res!1039682)) b!1519970))

(assert (= (and b!1519970 res!1039684) b!1519968))

(assert (= (and b!1519970 res!1039683) b!1519969))

(assert (= (and b!1519969 c!139686) b!1519971))

(assert (= (and b!1519969 (not c!139686)) b!1519972))

(assert (= (or b!1519971 b!1519972) bm!68329))

(declare-fun m!1403309 () Bool)

(assert (=> b!1519968 m!1403309))

(assert (=> b!1519968 m!1403309))

(declare-fun m!1403311 () Bool)

(assert (=> b!1519968 m!1403311))

(assert (=> b!1519969 m!1403309))

(assert (=> b!1519969 m!1403309))

(declare-fun m!1403313 () Bool)

(assert (=> b!1519969 m!1403313))

(assert (=> bm!68329 m!1403309))

(declare-fun m!1403315 () Bool)

(assert (=> bm!68329 m!1403315))

(assert (=> b!1519970 m!1403309))

(assert (=> b!1519970 m!1403309))

(assert (=> b!1519970 m!1403313))

(assert (=> bm!68313 d!158789))

(assert (=> d!158703 d!158715))

(declare-fun d!158791 () Bool)

(assert (=> d!158791 (= (validKeyInArray!0 (select (arr!48840 a!2804) #b00000000000000000000000000000000)) (and (not (= (select (arr!48840 a!2804) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48840 a!2804) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1519773 d!158791))

(assert (=> d!158729 d!158761))

(assert (=> d!158729 d!158769))

(assert (=> d!158729 d!158715))

(assert (=> d!158727 d!158715))

(declare-fun bm!68330 () Bool)

(declare-fun call!68333 () Bool)

(assert (=> bm!68330 (= call!68333 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1519973 () Bool)

(declare-fun e!847854 () Bool)

(declare-fun e!847855 () Bool)

(assert (=> b!1519973 (= e!847854 e!847855)))

(declare-fun lt!658876 () (_ BitVec 64))

(assert (=> b!1519973 (= lt!658876 (select (arr!48840 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!658877 () Unit!50890)

(assert (=> b!1519973 (= lt!658877 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!658876 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1519973 (arrayContainsKey!0 a!2804 lt!658876 #b00000000000000000000000000000000)))

(declare-fun lt!658878 () Unit!50890)

(assert (=> b!1519973 (= lt!658878 lt!658877)))

(declare-fun res!1039685 () Bool)

(assert (=> b!1519973 (= res!1039685 (= (seekEntryOrOpen!0 (select (arr!48840 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!2804 mask!2512) (Found!13011 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1519973 (=> (not res!1039685) (not e!847855))))

(declare-fun b!1519975 () Bool)

(declare-fun e!847853 () Bool)

(assert (=> b!1519975 (= e!847853 e!847854)))

(declare-fun c!139687 () Bool)

(assert (=> b!1519975 (= c!139687 (validKeyInArray!0 (select (arr!48840 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1519976 () Bool)

(assert (=> b!1519976 (= e!847854 call!68333)))

(declare-fun b!1519974 () Bool)

(assert (=> b!1519974 (= e!847855 call!68333)))

(declare-fun d!158793 () Bool)

(declare-fun res!1039686 () Bool)

(assert (=> d!158793 (=> res!1039686 e!847853)))

(assert (=> d!158793 (= res!1039686 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!49390 a!2804)))))

(assert (=> d!158793 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512) e!847853)))

(assert (= (and d!158793 (not res!1039686)) b!1519975))

(assert (= (and b!1519975 c!139687) b!1519973))

(assert (= (and b!1519975 (not c!139687)) b!1519976))

(assert (= (and b!1519973 res!1039685) b!1519974))

(assert (= (or b!1519974 b!1519976) bm!68330))

(declare-fun m!1403317 () Bool)

(assert (=> bm!68330 m!1403317))

(assert (=> b!1519973 m!1403309))

(declare-fun m!1403319 () Bool)

(assert (=> b!1519973 m!1403319))

(declare-fun m!1403321 () Bool)

(assert (=> b!1519973 m!1403321))

(assert (=> b!1519973 m!1403309))

(declare-fun m!1403323 () Bool)

(assert (=> b!1519973 m!1403323))

(assert (=> b!1519975 m!1403309))

(assert (=> b!1519975 m!1403309))

(assert (=> b!1519975 m!1403313))

(assert (=> bm!68322 d!158793))

(declare-fun d!158795 () Bool)

(assert (=> d!158795 (arrayContainsKey!0 a!2804 lt!658836 #b00000000000000000000000000000000)))

(declare-fun lt!658881 () Unit!50890)

(declare-fun choose!13 (array!101206 (_ BitVec 64) (_ BitVec 32)) Unit!50890)

(assert (=> d!158795 (= lt!658881 (choose!13 a!2804 lt!658836 #b00000000000000000000000000000000))))

(assert (=> d!158795 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!158795 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!658836 #b00000000000000000000000000000000) lt!658881)))

(declare-fun bs!43619 () Bool)

(assert (= bs!43619 d!158795))

(assert (=> bs!43619 m!1403239))

(declare-fun m!1403325 () Bool)

(assert (=> bs!43619 m!1403325))

(assert (=> b!1519892 d!158795))

(declare-fun d!158797 () Bool)

(declare-fun res!1039691 () Bool)

(declare-fun e!847860 () Bool)

(assert (=> d!158797 (=> res!1039691 e!847860)))

(assert (=> d!158797 (= res!1039691 (= (select (arr!48840 a!2804) #b00000000000000000000000000000000) lt!658836))))

(assert (=> d!158797 (= (arrayContainsKey!0 a!2804 lt!658836 #b00000000000000000000000000000000) e!847860)))

(declare-fun b!1519981 () Bool)

(declare-fun e!847861 () Bool)

(assert (=> b!1519981 (= e!847860 e!847861)))

(declare-fun res!1039692 () Bool)

(assert (=> b!1519981 (=> (not res!1039692) (not e!847861))))

(assert (=> b!1519981 (= res!1039692 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!49390 a!2804)))))

(declare-fun b!1519982 () Bool)

(assert (=> b!1519982 (= e!847861 (arrayContainsKey!0 a!2804 lt!658836 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!158797 (not res!1039691)) b!1519981))

(assert (= (and b!1519981 res!1039692) b!1519982))

(assert (=> d!158797 m!1403163))

(declare-fun m!1403327 () Bool)

(assert (=> b!1519982 m!1403327))

(assert (=> b!1519892 d!158797))

(declare-fun b!1519995 () Bool)

(declare-fun c!139696 () Bool)

(declare-fun lt!658890 () (_ BitVec 64))

(assert (=> b!1519995 (= c!139696 (= lt!658890 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!847870 () SeekEntryResult!13011)

(declare-fun e!847869 () SeekEntryResult!13011)

(assert (=> b!1519995 (= e!847870 e!847869)))

(declare-fun b!1519996 () Bool)

(declare-fun lt!658889 () SeekEntryResult!13011)

(assert (=> b!1519996 (= e!847869 (MissingZero!13011 (index!54441 lt!658889)))))

(declare-fun b!1519997 () Bool)

(declare-fun e!847868 () SeekEntryResult!13011)

(assert (=> b!1519997 (= e!847868 e!847870)))

(assert (=> b!1519997 (= lt!658890 (select (arr!48840 a!2804) (index!54441 lt!658889)))))

(declare-fun c!139694 () Bool)

(assert (=> b!1519997 (= c!139694 (= lt!658890 (select (arr!48840 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!158799 () Bool)

(declare-fun lt!658888 () SeekEntryResult!13011)

(assert (=> d!158799 (and (or ((_ is Undefined!13011) lt!658888) (not ((_ is Found!13011) lt!658888)) (and (bvsge (index!54440 lt!658888) #b00000000000000000000000000000000) (bvslt (index!54440 lt!658888) (size!49390 a!2804)))) (or ((_ is Undefined!13011) lt!658888) ((_ is Found!13011) lt!658888) (not ((_ is MissingZero!13011) lt!658888)) (and (bvsge (index!54439 lt!658888) #b00000000000000000000000000000000) (bvslt (index!54439 lt!658888) (size!49390 a!2804)))) (or ((_ is Undefined!13011) lt!658888) ((_ is Found!13011) lt!658888) ((_ is MissingZero!13011) lt!658888) (not ((_ is MissingVacant!13011) lt!658888)) (and (bvsge (index!54442 lt!658888) #b00000000000000000000000000000000) (bvslt (index!54442 lt!658888) (size!49390 a!2804)))) (or ((_ is Undefined!13011) lt!658888) (ite ((_ is Found!13011) lt!658888) (= (select (arr!48840 a!2804) (index!54440 lt!658888)) (select (arr!48840 a!2804) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!13011) lt!658888) (= (select (arr!48840 a!2804) (index!54439 lt!658888)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13011) lt!658888) (= (select (arr!48840 a!2804) (index!54442 lt!658888)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!158799 (= lt!658888 e!847868)))

(declare-fun c!139695 () Bool)

(assert (=> d!158799 (= c!139695 (and ((_ is Intermediate!13011) lt!658889) (undefined!13823 lt!658889)))))

(assert (=> d!158799 (= lt!658889 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48840 a!2804) #b00000000000000000000000000000000) mask!2512) (select (arr!48840 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512))))

(assert (=> d!158799 (validMask!0 mask!2512)))

(assert (=> d!158799 (= (seekEntryOrOpen!0 (select (arr!48840 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) lt!658888)))

(declare-fun b!1519998 () Bool)

(assert (=> b!1519998 (= e!847870 (Found!13011 (index!54441 lt!658889)))))

(declare-fun b!1519999 () Bool)

(assert (=> b!1519999 (= e!847868 Undefined!13011)))

(declare-fun b!1520000 () Bool)

(assert (=> b!1520000 (= e!847869 (seekKeyOrZeroReturnVacant!0 (x!136105 lt!658889) (index!54441 lt!658889) (index!54441 lt!658889) (select (arr!48840 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512))))

(assert (= (and d!158799 c!139695) b!1519999))

(assert (= (and d!158799 (not c!139695)) b!1519997))

(assert (= (and b!1519997 c!139694) b!1519998))

(assert (= (and b!1519997 (not c!139694)) b!1519995))

(assert (= (and b!1519995 c!139696) b!1519996))

(assert (= (and b!1519995 (not c!139696)) b!1520000))

(declare-fun m!1403329 () Bool)

(assert (=> b!1519997 m!1403329))

(declare-fun m!1403331 () Bool)

(assert (=> d!158799 m!1403331))

(declare-fun m!1403333 () Bool)

(assert (=> d!158799 m!1403333))

(assert (=> d!158799 m!1403163))

(declare-fun m!1403335 () Bool)

(assert (=> d!158799 m!1403335))

(declare-fun m!1403337 () Bool)

(assert (=> d!158799 m!1403337))

(assert (=> d!158799 m!1403071))

(assert (=> d!158799 m!1403335))

(assert (=> d!158799 m!1403163))

(declare-fun m!1403339 () Bool)

(assert (=> d!158799 m!1403339))

(assert (=> b!1520000 m!1403163))

(declare-fun m!1403341 () Bool)

(assert (=> b!1520000 m!1403341))

(assert (=> b!1519892 d!158799))

(assert (=> d!158761 d!158715))

(assert (=> b!1519894 d!158791))

(declare-fun call!68334 () Bool)

(declare-fun bm!68331 () Bool)

(assert (=> bm!68331 (= call!68334 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1520001 () Bool)

(declare-fun e!847872 () Bool)

(declare-fun e!847873 () Bool)

(assert (=> b!1520001 (= e!847872 e!847873)))

(declare-fun lt!658891 () (_ BitVec 64))

(assert (=> b!1520001 (= lt!658891 (select (arr!48840 a!2804) (bvadd j!70 #b00000000000000000000000000000001)))))

(declare-fun lt!658892 () Unit!50890)

(assert (=> b!1520001 (= lt!658892 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!658891 (bvadd j!70 #b00000000000000000000000000000001)))))

(assert (=> b!1520001 (arrayContainsKey!0 a!2804 lt!658891 #b00000000000000000000000000000000)))

(declare-fun lt!658893 () Unit!50890)

(assert (=> b!1520001 (= lt!658893 lt!658892)))

(declare-fun res!1039693 () Bool)

(assert (=> b!1520001 (= res!1039693 (= (seekEntryOrOpen!0 (select (arr!48840 a!2804) (bvadd j!70 #b00000000000000000000000000000001)) a!2804 mask!2512) (Found!13011 (bvadd j!70 #b00000000000000000000000000000001))))))

(assert (=> b!1520001 (=> (not res!1039693) (not e!847873))))

(declare-fun b!1520003 () Bool)

(declare-fun e!847871 () Bool)

(assert (=> b!1520003 (= e!847871 e!847872)))

(declare-fun c!139697 () Bool)

(assert (=> b!1520003 (= c!139697 (validKeyInArray!0 (select (arr!48840 a!2804) (bvadd j!70 #b00000000000000000000000000000001))))))

(declare-fun b!1520004 () Bool)

(assert (=> b!1520004 (= e!847872 call!68334)))

(declare-fun b!1520002 () Bool)

(assert (=> b!1520002 (= e!847873 call!68334)))

(declare-fun d!158801 () Bool)

(declare-fun res!1039694 () Bool)

(assert (=> d!158801 (=> res!1039694 e!847871)))

(assert (=> d!158801 (= res!1039694 (bvsge (bvadd j!70 #b00000000000000000000000000000001) (size!49390 a!2804)))))

(assert (=> d!158801 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512) e!847871)))

(assert (= (and d!158801 (not res!1039694)) b!1520003))

(assert (= (and b!1520003 c!139697) b!1520001))

(assert (= (and b!1520003 (not c!139697)) b!1520004))

(assert (= (and b!1520001 res!1039693) b!1520002))

(assert (= (or b!1520002 b!1520004) bm!68331))

(declare-fun m!1403343 () Bool)

(assert (=> bm!68331 m!1403343))

(declare-fun m!1403345 () Bool)

(assert (=> b!1520001 m!1403345))

(declare-fun m!1403347 () Bool)

(assert (=> b!1520001 m!1403347))

(declare-fun m!1403349 () Bool)

(assert (=> b!1520001 m!1403349))

(assert (=> b!1520001 m!1403345))

(declare-fun m!1403351 () Bool)

(assert (=> b!1520001 m!1403351))

(assert (=> b!1520003 m!1403345))

(assert (=> b!1520003 m!1403345))

(declare-fun m!1403353 () Bool)

(assert (=> b!1520003 m!1403353))

(assert (=> bm!68323 d!158801))

(declare-fun b!1520005 () Bool)

(declare-fun lt!658894 () SeekEntryResult!13011)

(assert (=> b!1520005 (and (bvsge (index!54441 lt!658894) #b00000000000000000000000000000000) (bvslt (index!54441 lt!658894) (size!49390 a!2804)))))

(declare-fun res!1039696 () Bool)

(assert (=> b!1520005 (= res!1039696 (= (select (arr!48840 a!2804) (index!54441 lt!658894)) (select (arr!48840 a!2804) j!70)))))

(declare-fun e!847878 () Bool)

(assert (=> b!1520005 (=> res!1039696 e!847878)))

(declare-fun e!847876 () Bool)

(assert (=> b!1520005 (= e!847876 e!847878)))

(declare-fun e!847874 () SeekEntryResult!13011)

(declare-fun b!1520006 () Bool)

(assert (=> b!1520006 (= e!847874 (Intermediate!13011 true (nextIndex!0 (toIndex!0 (select (arr!48840 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1520007 () Bool)

(declare-fun e!847877 () SeekEntryResult!13011)

(assert (=> b!1520007 (= e!847874 e!847877)))

(declare-fun lt!658895 () (_ BitVec 64))

(declare-fun c!139698 () Bool)

(assert (=> b!1520007 (= c!139698 (or (= lt!658895 (select (arr!48840 a!2804) j!70)) (= (bvadd lt!658895 lt!658895) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!158803 () Bool)

(declare-fun e!847875 () Bool)

(assert (=> d!158803 e!847875))

(declare-fun c!139699 () Bool)

(assert (=> d!158803 (= c!139699 (and ((_ is Intermediate!13011) lt!658894) (undefined!13823 lt!658894)))))

(assert (=> d!158803 (= lt!658894 e!847874)))

(declare-fun c!139700 () Bool)

(assert (=> d!158803 (= c!139700 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!158803 (= lt!658895 (select (arr!48840 a!2804) (nextIndex!0 (toIndex!0 (select (arr!48840 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512)))))

(assert (=> d!158803 (validMask!0 mask!2512)))

(assert (=> d!158803 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48840 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48840 a!2804) j!70) a!2804 mask!2512) lt!658894)))

(declare-fun b!1520008 () Bool)

(assert (=> b!1520008 (= e!847875 e!847876)))

(declare-fun res!1039697 () Bool)

(assert (=> b!1520008 (= res!1039697 (and ((_ is Intermediate!13011) lt!658894) (not (undefined!13823 lt!658894)) (bvslt (x!136105 lt!658894) #b01111111111111111111111111111110) (bvsge (x!136105 lt!658894) #b00000000000000000000000000000000) (bvsge (x!136105 lt!658894) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1520008 (=> (not res!1039697) (not e!847876))))

(declare-fun b!1520009 () Bool)

(assert (=> b!1520009 (= e!847877 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 (select (arr!48840 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (arr!48840 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1520010 () Bool)

(assert (=> b!1520010 (= e!847877 (Intermediate!13011 false (nextIndex!0 (toIndex!0 (select (arr!48840 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1520011 () Bool)

(assert (=> b!1520011 (and (bvsge (index!54441 lt!658894) #b00000000000000000000000000000000) (bvslt (index!54441 lt!658894) (size!49390 a!2804)))))

(declare-fun res!1039695 () Bool)

(assert (=> b!1520011 (= res!1039695 (= (select (arr!48840 a!2804) (index!54441 lt!658894)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1520011 (=> res!1039695 e!847878)))

(declare-fun b!1520012 () Bool)

(assert (=> b!1520012 (and (bvsge (index!54441 lt!658894) #b00000000000000000000000000000000) (bvslt (index!54441 lt!658894) (size!49390 a!2804)))))

(assert (=> b!1520012 (= e!847878 (= (select (arr!48840 a!2804) (index!54441 lt!658894)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1520013 () Bool)

(assert (=> b!1520013 (= e!847875 (bvsge (x!136105 lt!658894) #b01111111111111111111111111111110))))

(assert (= (and d!158803 c!139700) b!1520006))

(assert (= (and d!158803 (not c!139700)) b!1520007))

(assert (= (and b!1520007 c!139698) b!1520010))

(assert (= (and b!1520007 (not c!139698)) b!1520009))

(assert (= (and d!158803 c!139699) b!1520013))

(assert (= (and d!158803 (not c!139699)) b!1520008))

(assert (= (and b!1520008 res!1039697) b!1520005))

(assert (= (and b!1520005 (not res!1039696)) b!1520011))

(assert (= (and b!1520011 (not res!1039695)) b!1520012))

(assert (=> d!158803 m!1403255))

(declare-fun m!1403355 () Bool)

(assert (=> d!158803 m!1403355))

(assert (=> d!158803 m!1403071))

(assert (=> b!1520009 m!1403255))

(declare-fun m!1403357 () Bool)

(assert (=> b!1520009 m!1403357))

(assert (=> b!1520009 m!1403357))

(assert (=> b!1520009 m!1403059))

(declare-fun m!1403359 () Bool)

(assert (=> b!1520009 m!1403359))

(declare-fun m!1403361 () Bool)

(assert (=> b!1520005 m!1403361))

(assert (=> b!1520012 m!1403361))

(assert (=> b!1520011 m!1403361))

(assert (=> b!1519904 d!158803))

(declare-fun d!158805 () Bool)

(declare-fun lt!658896 () (_ BitVec 32))

(assert (=> d!158805 (and (bvsge lt!658896 #b00000000000000000000000000000000) (bvslt lt!658896 (bvadd mask!2512 #b00000000000000000000000000000001)))))

(assert (=> d!158805 (= lt!658896 (choose!52 (toIndex!0 (select (arr!48840 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512))))

(assert (=> d!158805 (validMask!0 mask!2512)))

(assert (=> d!158805 (= (nextIndex!0 (toIndex!0 (select (arr!48840 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) lt!658896)))

(declare-fun bs!43620 () Bool)

(assert (= bs!43620 d!158805))

(assert (=> bs!43620 m!1403065))

(declare-fun m!1403363 () Bool)

(assert (=> bs!43620 m!1403363))

(assert (=> bs!43620 m!1403071))

(assert (=> b!1519904 d!158805))

(declare-fun d!158807 () Bool)

(assert (=> d!158807 (arrayContainsKey!0 a!2804 lt!658839 #b00000000000000000000000000000000)))

(declare-fun lt!658897 () Unit!50890)

(assert (=> d!158807 (= lt!658897 (choose!13 a!2804 lt!658839 j!70))))

(assert (=> d!158807 (bvsge j!70 #b00000000000000000000000000000000)))

(assert (=> d!158807 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!658839 j!70) lt!658897)))

(declare-fun bs!43621 () Bool)

(assert (= bs!43621 d!158807))

(assert (=> bs!43621 m!1403247))

(declare-fun m!1403365 () Bool)

(assert (=> bs!43621 m!1403365))

(assert (=> b!1519896 d!158807))

(declare-fun d!158809 () Bool)

(declare-fun res!1039698 () Bool)

(declare-fun e!847879 () Bool)

(assert (=> d!158809 (=> res!1039698 e!847879)))

(assert (=> d!158809 (= res!1039698 (= (select (arr!48840 a!2804) #b00000000000000000000000000000000) lt!658839))))

(assert (=> d!158809 (= (arrayContainsKey!0 a!2804 lt!658839 #b00000000000000000000000000000000) e!847879)))

(declare-fun b!1520014 () Bool)

(declare-fun e!847880 () Bool)

(assert (=> b!1520014 (= e!847879 e!847880)))

(declare-fun res!1039699 () Bool)

(assert (=> b!1520014 (=> (not res!1039699) (not e!847880))))

(assert (=> b!1520014 (= res!1039699 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!49390 a!2804)))))

(declare-fun b!1520015 () Bool)

(assert (=> b!1520015 (= e!847880 (arrayContainsKey!0 a!2804 lt!658839 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!158809 (not res!1039698)) b!1520014))

(assert (= (and b!1520014 res!1039699) b!1520015))

(assert (=> d!158809 m!1403163))

(declare-fun m!1403367 () Bool)

(assert (=> b!1520015 m!1403367))

(assert (=> b!1519896 d!158809))

(declare-fun b!1520016 () Bool)

(declare-fun c!139703 () Bool)

(declare-fun lt!658900 () (_ BitVec 64))

(assert (=> b!1520016 (= c!139703 (= lt!658900 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!847883 () SeekEntryResult!13011)

(declare-fun e!847882 () SeekEntryResult!13011)

(assert (=> b!1520016 (= e!847883 e!847882)))

(declare-fun b!1520017 () Bool)

(declare-fun lt!658899 () SeekEntryResult!13011)

(assert (=> b!1520017 (= e!847882 (MissingZero!13011 (index!54441 lt!658899)))))

(declare-fun b!1520018 () Bool)

(declare-fun e!847881 () SeekEntryResult!13011)

(assert (=> b!1520018 (= e!847881 e!847883)))

(assert (=> b!1520018 (= lt!658900 (select (arr!48840 a!2804) (index!54441 lt!658899)))))

(declare-fun c!139701 () Bool)

(assert (=> b!1520018 (= c!139701 (= lt!658900 (select (arr!48840 a!2804) j!70)))))

(declare-fun d!158811 () Bool)

(declare-fun lt!658898 () SeekEntryResult!13011)

(assert (=> d!158811 (and (or ((_ is Undefined!13011) lt!658898) (not ((_ is Found!13011) lt!658898)) (and (bvsge (index!54440 lt!658898) #b00000000000000000000000000000000) (bvslt (index!54440 lt!658898) (size!49390 a!2804)))) (or ((_ is Undefined!13011) lt!658898) ((_ is Found!13011) lt!658898) (not ((_ is MissingZero!13011) lt!658898)) (and (bvsge (index!54439 lt!658898) #b00000000000000000000000000000000) (bvslt (index!54439 lt!658898) (size!49390 a!2804)))) (or ((_ is Undefined!13011) lt!658898) ((_ is Found!13011) lt!658898) ((_ is MissingZero!13011) lt!658898) (not ((_ is MissingVacant!13011) lt!658898)) (and (bvsge (index!54442 lt!658898) #b00000000000000000000000000000000) (bvslt (index!54442 lt!658898) (size!49390 a!2804)))) (or ((_ is Undefined!13011) lt!658898) (ite ((_ is Found!13011) lt!658898) (= (select (arr!48840 a!2804) (index!54440 lt!658898)) (select (arr!48840 a!2804) j!70)) (ite ((_ is MissingZero!13011) lt!658898) (= (select (arr!48840 a!2804) (index!54439 lt!658898)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13011) lt!658898) (= (select (arr!48840 a!2804) (index!54442 lt!658898)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!158811 (= lt!658898 e!847881)))

(declare-fun c!139702 () Bool)

(assert (=> d!158811 (= c!139702 (and ((_ is Intermediate!13011) lt!658899) (undefined!13823 lt!658899)))))

(assert (=> d!158811 (= lt!658899 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48840 a!2804) j!70) mask!2512) (select (arr!48840 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!158811 (validMask!0 mask!2512)))

(assert (=> d!158811 (= (seekEntryOrOpen!0 (select (arr!48840 a!2804) j!70) a!2804 mask!2512) lt!658898)))

(declare-fun b!1520019 () Bool)

(assert (=> b!1520019 (= e!847883 (Found!13011 (index!54441 lt!658899)))))

(declare-fun b!1520020 () Bool)

(assert (=> b!1520020 (= e!847881 Undefined!13011)))

(declare-fun b!1520021 () Bool)

(assert (=> b!1520021 (= e!847882 (seekKeyOrZeroReturnVacant!0 (x!136105 lt!658899) (index!54441 lt!658899) (index!54441 lt!658899) (select (arr!48840 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and d!158811 c!139702) b!1520020))

(assert (= (and d!158811 (not c!139702)) b!1520018))

(assert (= (and b!1520018 c!139701) b!1520019))

(assert (= (and b!1520018 (not c!139701)) b!1520016))

(assert (= (and b!1520016 c!139703) b!1520017))

(assert (= (and b!1520016 (not c!139703)) b!1520021))

(declare-fun m!1403369 () Bool)

(assert (=> b!1520018 m!1403369))

(declare-fun m!1403371 () Bool)

(assert (=> d!158811 m!1403371))

(declare-fun m!1403373 () Bool)

(assert (=> d!158811 m!1403373))

(assert (=> d!158811 m!1403059))

(assert (=> d!158811 m!1403065))

(declare-fun m!1403375 () Bool)

(assert (=> d!158811 m!1403375))

(assert (=> d!158811 m!1403071))

(assert (=> d!158811 m!1403065))

(assert (=> d!158811 m!1403059))

(assert (=> d!158811 m!1403067))

(assert (=> b!1520021 m!1403059))

(declare-fun m!1403377 () Bool)

(assert (=> b!1520021 m!1403377))

(assert (=> b!1519896 d!158811))

(declare-fun d!158813 () Bool)

(declare-fun lt!658903 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!787 (List!35323) (InoxSet (_ BitVec 64)))

(assert (=> d!158813 (= lt!658903 (select (content!787 Nil!35320) (select (arr!48840 a!2804) #b00000000000000000000000000000000)))))

(declare-fun e!847889 () Bool)

(assert (=> d!158813 (= lt!658903 e!847889)))

(declare-fun res!1039704 () Bool)

(assert (=> d!158813 (=> (not res!1039704) (not e!847889))))

(assert (=> d!158813 (= res!1039704 ((_ is Cons!35319) Nil!35320))))

(assert (=> d!158813 (= (contains!9976 Nil!35320 (select (arr!48840 a!2804) #b00000000000000000000000000000000)) lt!658903)))

(declare-fun b!1520026 () Bool)

(declare-fun e!847888 () Bool)

(assert (=> b!1520026 (= e!847889 e!847888)))

(declare-fun res!1039705 () Bool)

(assert (=> b!1520026 (=> res!1039705 e!847888)))

(assert (=> b!1520026 (= res!1039705 (= (h!36731 Nil!35320) (select (arr!48840 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1520027 () Bool)

(assert (=> b!1520027 (= e!847888 (contains!9976 (t!50017 Nil!35320) (select (arr!48840 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!158813 res!1039704) b!1520026))

(assert (= (and b!1520026 (not res!1039705)) b!1520027))

(declare-fun m!1403379 () Bool)

(assert (=> d!158813 m!1403379))

(assert (=> d!158813 m!1403163))

(declare-fun m!1403381 () Bool)

(assert (=> d!158813 m!1403381))

(assert (=> b!1520027 m!1403163))

(declare-fun m!1403383 () Bool)

(assert (=> b!1520027 m!1403383))

(assert (=> b!1519771 d!158813))

(declare-fun b!1520040 () Bool)

(declare-fun e!847896 () SeekEntryResult!13011)

(assert (=> b!1520040 (= e!847896 Undefined!13011)))

(declare-fun b!1520041 () Bool)

(declare-fun e!847897 () SeekEntryResult!13011)

(assert (=> b!1520041 (= e!847897 (Found!13011 (index!54441 lt!658809)))))

(declare-fun b!1520042 () Bool)

(declare-fun e!847898 () SeekEntryResult!13011)

(assert (=> b!1520042 (= e!847898 (MissingVacant!13011 (index!54441 lt!658809)))))

(declare-fun d!158815 () Bool)

(declare-fun lt!658909 () SeekEntryResult!13011)

(assert (=> d!158815 (and (or ((_ is Undefined!13011) lt!658909) (not ((_ is Found!13011) lt!658909)) (and (bvsge (index!54440 lt!658909) #b00000000000000000000000000000000) (bvslt (index!54440 lt!658909) (size!49390 a!2804)))) (or ((_ is Undefined!13011) lt!658909) ((_ is Found!13011) lt!658909) (not ((_ is MissingVacant!13011) lt!658909)) (not (= (index!54442 lt!658909) (index!54441 lt!658809))) (and (bvsge (index!54442 lt!658909) #b00000000000000000000000000000000) (bvslt (index!54442 lt!658909) (size!49390 a!2804)))) (or ((_ is Undefined!13011) lt!658909) (ite ((_ is Found!13011) lt!658909) (= (select (arr!48840 a!2804) (index!54440 lt!658909)) (select (arr!48840 a!2804) j!70)) (and ((_ is MissingVacant!13011) lt!658909) (= (index!54442 lt!658909) (index!54441 lt!658809)) (= (select (arr!48840 a!2804) (index!54442 lt!658909)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!158815 (= lt!658909 e!847896)))

(declare-fun c!139712 () Bool)

(assert (=> d!158815 (= c!139712 (bvsge (x!136105 lt!658809) #b01111111111111111111111111111110))))

(declare-fun lt!658908 () (_ BitVec 64))

(assert (=> d!158815 (= lt!658908 (select (arr!48840 a!2804) (index!54441 lt!658809)))))

(assert (=> d!158815 (validMask!0 mask!2512)))

(assert (=> d!158815 (= (seekKeyOrZeroReturnVacant!0 (x!136105 lt!658809) (index!54441 lt!658809) (index!54441 lt!658809) (select (arr!48840 a!2804) j!70) a!2804 mask!2512) lt!658909)))

(declare-fun b!1520043 () Bool)

(assert (=> b!1520043 (= e!847896 e!847897)))

(declare-fun c!139710 () Bool)

(assert (=> b!1520043 (= c!139710 (= lt!658908 (select (arr!48840 a!2804) j!70)))))

(declare-fun b!1520044 () Bool)

(declare-fun c!139711 () Bool)

(assert (=> b!1520044 (= c!139711 (= lt!658908 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1520044 (= e!847897 e!847898)))

(declare-fun b!1520045 () Bool)

(assert (=> b!1520045 (= e!847898 (seekKeyOrZeroReturnVacant!0 (bvadd (x!136105 lt!658809) #b00000000000000000000000000000001) (nextIndex!0 (index!54441 lt!658809) (x!136105 lt!658809) mask!2512) (index!54441 lt!658809) (select (arr!48840 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and d!158815 c!139712) b!1520040))

(assert (= (and d!158815 (not c!139712)) b!1520043))

(assert (= (and b!1520043 c!139710) b!1520041))

(assert (= (and b!1520043 (not c!139710)) b!1520044))

(assert (= (and b!1520044 c!139711) b!1520042))

(assert (= (and b!1520044 (not c!139711)) b!1520045))

(declare-fun m!1403385 () Bool)

(assert (=> d!158815 m!1403385))

(declare-fun m!1403387 () Bool)

(assert (=> d!158815 m!1403387))

(assert (=> d!158815 m!1403205))

(assert (=> d!158815 m!1403071))

(declare-fun m!1403389 () Bool)

(assert (=> b!1520045 m!1403389))

(assert (=> b!1520045 m!1403389))

(assert (=> b!1520045 m!1403059))

(declare-fun m!1403391 () Bool)

(assert (=> b!1520045 m!1403391))

(assert (=> b!1519854 d!158815))

(assert (=> b!1519898 d!158713))

(assert (=> d!158759 d!158757))

(declare-fun d!158817 () Bool)

(assert (=> d!158817 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(assert (=> d!158817 true))

(declare-fun _$72!164 () Unit!50890)

(assert (=> d!158817 (= (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) _$72!164)))

(declare-fun bs!43622 () Bool)

(assert (= bs!43622 d!158817))

(assert (=> bs!43622 m!1403087))

(assert (=> d!158759 d!158817))

(assert (=> d!158759 d!158715))

(declare-fun b!1520046 () Bool)

(declare-fun lt!658910 () SeekEntryResult!13011)

(assert (=> b!1520046 (and (bvsge (index!54441 lt!658910) #b00000000000000000000000000000000) (bvslt (index!54441 lt!658910) (size!49390 a!2804)))))

(declare-fun res!1039707 () Bool)

(assert (=> b!1520046 (= res!1039707 (= (select (arr!48840 a!2804) (index!54441 lt!658910)) (select (arr!48840 a!2804) j!70)))))

(declare-fun e!847903 () Bool)

(assert (=> b!1520046 (=> res!1039707 e!847903)))

(declare-fun e!847901 () Bool)

(assert (=> b!1520046 (= e!847901 e!847903)))

(declare-fun b!1520047 () Bool)

(declare-fun e!847899 () SeekEntryResult!13011)

(assert (=> b!1520047 (= e!847899 (Intermediate!13011 true (nextIndex!0 index!487 x!534 mask!2512) (bvadd x!534 #b00000000000000000000000000000001)))))

(declare-fun b!1520048 () Bool)

(declare-fun e!847902 () SeekEntryResult!13011)

(assert (=> b!1520048 (= e!847899 e!847902)))

(declare-fun lt!658911 () (_ BitVec 64))

(declare-fun c!139713 () Bool)

(assert (=> b!1520048 (= c!139713 (or (= lt!658911 (select (arr!48840 a!2804) j!70)) (= (bvadd lt!658911 lt!658911) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!158819 () Bool)

(declare-fun e!847900 () Bool)

(assert (=> d!158819 e!847900))

(declare-fun c!139714 () Bool)

(assert (=> d!158819 (= c!139714 (and ((_ is Intermediate!13011) lt!658910) (undefined!13823 lt!658910)))))

(assert (=> d!158819 (= lt!658910 e!847899)))

(declare-fun c!139715 () Bool)

(assert (=> d!158819 (= c!139715 (bvsge (bvadd x!534 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!158819 (= lt!658911 (select (arr!48840 a!2804) (nextIndex!0 index!487 x!534 mask!2512)))))

(assert (=> d!158819 (validMask!0 mask!2512)))

(assert (=> d!158819 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48840 a!2804) j!70) a!2804 mask!2512) lt!658910)))

(declare-fun b!1520049 () Bool)

(assert (=> b!1520049 (= e!847900 e!847901)))

(declare-fun res!1039708 () Bool)

(assert (=> b!1520049 (= res!1039708 (and ((_ is Intermediate!13011) lt!658910) (not (undefined!13823 lt!658910)) (bvslt (x!136105 lt!658910) #b01111111111111111111111111111110) (bvsge (x!136105 lt!658910) #b00000000000000000000000000000000) (bvsge (x!136105 lt!658910) (bvadd x!534 #b00000000000000000000000000000001))))))

(assert (=> b!1520049 (=> (not res!1039708) (not e!847901))))

(declare-fun b!1520050 () Bool)

(assert (=> b!1520050 (= e!847902 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!487 x!534 mask!2512) (bvadd x!534 #b00000000000000000000000000000001) mask!2512) (select (arr!48840 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1520051 () Bool)

(assert (=> b!1520051 (= e!847902 (Intermediate!13011 false (nextIndex!0 index!487 x!534 mask!2512) (bvadd x!534 #b00000000000000000000000000000001)))))

(declare-fun b!1520052 () Bool)

(assert (=> b!1520052 (and (bvsge (index!54441 lt!658910) #b00000000000000000000000000000000) (bvslt (index!54441 lt!658910) (size!49390 a!2804)))))

(declare-fun res!1039706 () Bool)

(assert (=> b!1520052 (= res!1039706 (= (select (arr!48840 a!2804) (index!54441 lt!658910)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1520052 (=> res!1039706 e!847903)))

(declare-fun b!1520053 () Bool)

(assert (=> b!1520053 (and (bvsge (index!54441 lt!658910) #b00000000000000000000000000000000) (bvslt (index!54441 lt!658910) (size!49390 a!2804)))))

(assert (=> b!1520053 (= e!847903 (= (select (arr!48840 a!2804) (index!54441 lt!658910)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1520054 () Bool)

(assert (=> b!1520054 (= e!847900 (bvsge (x!136105 lt!658910) #b01111111111111111111111111111110))))

(assert (= (and d!158819 c!139715) b!1520047))

(assert (= (and d!158819 (not c!139715)) b!1520048))

(assert (= (and b!1520048 c!139713) b!1520051))

(assert (= (and b!1520048 (not c!139713)) b!1520050))

(assert (= (and d!158819 c!139714) b!1520054))

(assert (= (and d!158819 (not c!139714)) b!1520049))

(assert (= (and b!1520049 res!1039708) b!1520046))

(assert (= (and b!1520046 (not res!1039707)) b!1520052))

(assert (= (and b!1520052 (not res!1039706)) b!1520053))

(assert (=> d!158819 m!1403173))

(declare-fun m!1403393 () Bool)

(assert (=> d!158819 m!1403393))

(assert (=> d!158819 m!1403071))

(assert (=> b!1520050 m!1403173))

(declare-fun m!1403395 () Bool)

(assert (=> b!1520050 m!1403395))

(assert (=> b!1520050 m!1403395))

(assert (=> b!1520050 m!1403059))

(declare-fun m!1403397 () Bool)

(assert (=> b!1520050 m!1403397))

(declare-fun m!1403399 () Bool)

(assert (=> b!1520046 m!1403399))

(assert (=> b!1520053 m!1403399))

(assert (=> b!1520052 m!1403399))

(assert (=> b!1519780 d!158819))

(declare-fun d!158821 () Bool)

(declare-fun lt!658912 () (_ BitVec 32))

(assert (=> d!158821 (and (bvsge lt!658912 #b00000000000000000000000000000000) (bvslt lt!658912 (bvadd mask!2512 #b00000000000000000000000000000001)))))

(assert (=> d!158821 (= lt!658912 (choose!52 index!487 x!534 mask!2512))))

(assert (=> d!158821 (validMask!0 mask!2512)))

(assert (=> d!158821 (= (nextIndex!0 index!487 x!534 mask!2512) lt!658912)))

(declare-fun bs!43623 () Bool)

(assert (= bs!43623 d!158821))

(declare-fun m!1403401 () Bool)

(assert (=> bs!43623 m!1403401))

(assert (=> bs!43623 m!1403071))

(assert (=> b!1519780 d!158821))

(assert (=> b!1519772 d!158791))

(check-sat (not b!1519969) (not d!158795) (not d!158817) (not d!158803) (not d!158821) (not b!1520021) (not b!1520009) (not b!1520045) (not b!1520050) (not d!158819) (not b!1520027) (not b!1519982) (not b!1520001) (not b!1519968) (not b!1519963) (not b!1519975) (not d!158785) (not d!158811) (not bm!68329) (not d!158815) (not bm!68330) (not d!158807) (not b!1520015) (not b!1520000) (not b!1519973) (not bm!68331) (not d!158813) (not d!158799) (not b!1519970) (not b!1520003) (not d!158787) (not d!158805))
(check-sat)
