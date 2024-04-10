; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128722 () Bool)

(assert start!128722)

(declare-fun b!1508544 () Bool)

(declare-fun res!1028555 () Bool)

(declare-fun e!842738 () Bool)

(assert (=> b!1508544 (=> (not res!1028555) (not e!842738))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100617 0))(
  ( (array!100618 (arr!48547 (Array (_ BitVec 32) (_ BitVec 64))) (size!49097 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100617)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1508544 (= res!1028555 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49097 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49097 a!2804))))))

(declare-fun b!1508545 () Bool)

(declare-fun res!1028557 () Bool)

(assert (=> b!1508545 (=> (not res!1028557) (not e!842738))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508545 (= res!1028557 (validKeyInArray!0 (select (arr!48547 a!2804) j!70)))))

(declare-fun b!1508546 () Bool)

(declare-fun e!842739 () Bool)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun lt!654655 () (_ BitVec 32))

(assert (=> b!1508546 (= e!842739 (and (bvsge mask!2512 #b00000000000000000000000000000000) (or (bvslt lt!654655 #b00000000000000000000000000000000) (bvsge lt!654655 (bvadd #b00000000000000000000000000000001 mask!2512)))))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508546 (= lt!654655 (toIndex!0 (select (store (arr!48547 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(declare-fun b!1508547 () Bool)

(declare-fun res!1028560 () Bool)

(assert (=> b!1508547 (=> (not res!1028560) (not e!842738))))

(declare-datatypes ((List!35030 0))(
  ( (Nil!35027) (Cons!35026 (h!36435 (_ BitVec 64)) (t!49724 List!35030)) )
))
(declare-fun arrayNoDuplicates!0 (array!100617 (_ BitVec 32) List!35030) Bool)

(assert (=> b!1508547 (= res!1028560 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35027))))

(declare-fun b!1508548 () Bool)

(declare-fun res!1028552 () Bool)

(assert (=> b!1508548 (=> (not res!1028552) (not e!842738))))

(assert (=> b!1508548 (= res!1028552 (validKeyInArray!0 (select (arr!48547 a!2804) i!961)))))

(declare-fun b!1508549 () Bool)

(assert (=> b!1508549 (= e!842738 e!842739)))

(declare-fun res!1028553 () Bool)

(assert (=> b!1508549 (=> (not res!1028553) (not e!842739))))

(declare-datatypes ((SeekEntryResult!12718 0))(
  ( (MissingZero!12718 (index!53267 (_ BitVec 32))) (Found!12718 (index!53268 (_ BitVec 32))) (Intermediate!12718 (undefined!13530 Bool) (index!53269 (_ BitVec 32)) (x!135022 (_ BitVec 32))) (Undefined!12718) (MissingVacant!12718 (index!53270 (_ BitVec 32))) )
))
(declare-fun lt!654654 () SeekEntryResult!12718)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100617 (_ BitVec 32)) SeekEntryResult!12718)

(assert (=> b!1508549 (= res!1028553 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48547 a!2804) j!70) mask!2512) (select (arr!48547 a!2804) j!70) a!2804 mask!2512) lt!654654))))

(assert (=> b!1508549 (= lt!654654 (Intermediate!12718 false resIndex!21 resX!21))))

(declare-fun b!1508550 () Bool)

(declare-fun res!1028554 () Bool)

(assert (=> b!1508550 (=> (not res!1028554) (not e!842738))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100617 (_ BitVec 32)) Bool)

(assert (=> b!1508550 (= res!1028554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1508551 () Bool)

(declare-fun res!1028556 () Bool)

(assert (=> b!1508551 (=> (not res!1028556) (not e!842738))))

(assert (=> b!1508551 (= res!1028556 (and (= (size!49097 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49097 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49097 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508552 () Bool)

(declare-fun res!1028558 () Bool)

(assert (=> b!1508552 (=> (not res!1028558) (not e!842739))))

(assert (=> b!1508552 (= res!1028558 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48547 a!2804) j!70) a!2804 mask!2512) lt!654654))))

(declare-fun res!1028559 () Bool)

(assert (=> start!128722 (=> (not res!1028559) (not e!842738))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128722 (= res!1028559 (validMask!0 mask!2512))))

(assert (=> start!128722 e!842738))

(assert (=> start!128722 true))

(declare-fun array_inv!37575 (array!100617) Bool)

(assert (=> start!128722 (array_inv!37575 a!2804)))

(assert (= (and start!128722 res!1028559) b!1508551))

(assert (= (and b!1508551 res!1028556) b!1508548))

(assert (= (and b!1508548 res!1028552) b!1508545))

(assert (= (and b!1508545 res!1028557) b!1508550))

(assert (= (and b!1508550 res!1028554) b!1508547))

(assert (= (and b!1508547 res!1028560) b!1508544))

(assert (= (and b!1508544 res!1028555) b!1508549))

(assert (= (and b!1508549 res!1028553) b!1508552))

(assert (= (and b!1508552 res!1028558) b!1508546))

(declare-fun m!1391055 () Bool)

(assert (=> b!1508546 m!1391055))

(declare-fun m!1391057 () Bool)

(assert (=> b!1508546 m!1391057))

(assert (=> b!1508546 m!1391057))

(declare-fun m!1391059 () Bool)

(assert (=> b!1508546 m!1391059))

(declare-fun m!1391061 () Bool)

(assert (=> b!1508552 m!1391061))

(assert (=> b!1508552 m!1391061))

(declare-fun m!1391063 () Bool)

(assert (=> b!1508552 m!1391063))

(declare-fun m!1391065 () Bool)

(assert (=> b!1508550 m!1391065))

(declare-fun m!1391067 () Bool)

(assert (=> b!1508548 m!1391067))

(assert (=> b!1508548 m!1391067))

(declare-fun m!1391069 () Bool)

(assert (=> b!1508548 m!1391069))

(assert (=> b!1508549 m!1391061))

(assert (=> b!1508549 m!1391061))

(declare-fun m!1391071 () Bool)

(assert (=> b!1508549 m!1391071))

(assert (=> b!1508549 m!1391071))

(assert (=> b!1508549 m!1391061))

(declare-fun m!1391073 () Bool)

(assert (=> b!1508549 m!1391073))

(declare-fun m!1391075 () Bool)

(assert (=> b!1508547 m!1391075))

(assert (=> b!1508545 m!1391061))

(assert (=> b!1508545 m!1391061))

(declare-fun m!1391077 () Bool)

(assert (=> b!1508545 m!1391077))

(declare-fun m!1391079 () Bool)

(assert (=> start!128722 m!1391079))

(declare-fun m!1391081 () Bool)

(assert (=> start!128722 m!1391081))

(push 1)

(assert (not b!1508550))

(assert (not b!1508549))

(assert (not b!1508546))

(assert (not b!1508545))

(assert (not start!128722))

(assert (not b!1508552))

(assert (not b!1508547))

(assert (not b!1508548))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!158453 () Bool)

(declare-fun lt!654673 () (_ BitVec 32))

(declare-fun lt!654672 () (_ BitVec 32))

(assert (=> d!158453 (= lt!654673 (bvmul (bvxor lt!654672 (bvlshr lt!654672 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158453 (= lt!654672 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48547 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48547 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158453 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1028573 (let ((h!36436 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48547 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48547 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!135024 (bvmul (bvxor h!36436 (bvlshr h!36436 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!135024 (bvlshr x!135024 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1028573 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1028573 #b00000000000000000000000000000000))))))

(assert (=> d!158453 (= (toIndex!0 (select (store (arr!48547 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!654673 (bvlshr lt!654673 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1508546 d!158453))

(declare-fun b!1508624 () Bool)

(declare-fun e!842784 () Bool)

(declare-fun call!68295 () Bool)

(assert (=> b!1508624 (= e!842784 call!68295)))

(declare-fun b!1508625 () Bool)

(declare-fun e!842783 () Bool)

(declare-fun e!842782 () Bool)

(assert (=> b!1508625 (= e!842783 e!842782)))

(declare-fun c!139559 () Bool)

(assert (=> b!1508625 (= c!139559 (validKeyInArray!0 (select (arr!48547 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!158457 () Bool)

(declare-fun res!1028589 () Bool)

(assert (=> d!158457 (=> res!1028589 e!842783)))

(assert (=> d!158457 (= res!1028589 (bvsge #b00000000000000000000000000000000 (size!49097 a!2804)))))

(assert (=> d!158457 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!842783)))

(declare-fun b!1508626 () Bool)

(assert (=> b!1508626 (= e!842782 call!68295)))

(declare-fun b!1508627 () Bool)

(assert (=> b!1508627 (= e!842782 e!842784)))

(declare-fun lt!654690 () (_ BitVec 64))

(assert (=> b!1508627 (= lt!654690 (select (arr!48547 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50344 0))(
  ( (Unit!50345) )
))
(declare-fun lt!654689 () Unit!50344)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100617 (_ BitVec 64) (_ BitVec 32)) Unit!50344)

(assert (=> b!1508627 (= lt!654689 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!654690 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100617 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1508627 (arrayContainsKey!0 a!2804 lt!654690 #b00000000000000000000000000000000)))

(declare-fun lt!654688 () Unit!50344)

(assert (=> b!1508627 (= lt!654688 lt!654689)))

(declare-fun res!1028588 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100617 (_ BitVec 32)) SeekEntryResult!12718)

(assert (=> b!1508627 (= res!1028588 (= (seekEntryOrOpen!0 (select (arr!48547 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12718 #b00000000000000000000000000000000)))))

(assert (=> b!1508627 (=> (not res!1028588) (not e!842784))))

(declare-fun bm!68292 () Bool)

(assert (=> bm!68292 (= call!68295 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(assert (= (and d!158457 (not res!1028589)) b!1508625))

(assert (= (and b!1508625 c!139559) b!1508627))

(assert (= (and b!1508625 (not c!139559)) b!1508626))

(assert (= (and b!1508627 res!1028588) b!1508624))

(assert (= (or b!1508624 b!1508626) bm!68292))

(declare-fun m!1391107 () Bool)

(assert (=> b!1508625 m!1391107))

(assert (=> b!1508625 m!1391107))

(declare-fun m!1391109 () Bool)

(assert (=> b!1508625 m!1391109))

(assert (=> b!1508627 m!1391107))

(declare-fun m!1391111 () Bool)

(assert (=> b!1508627 m!1391111))

(declare-fun m!1391113 () Bool)

(assert (=> b!1508627 m!1391113))

(assert (=> b!1508627 m!1391107))

(declare-fun m!1391115 () Bool)

(assert (=> b!1508627 m!1391115))

(declare-fun m!1391117 () Bool)

(assert (=> bm!68292 m!1391117))

(assert (=> b!1508550 d!158457))

(declare-fun d!158463 () Bool)

(assert (=> d!158463 (= (validKeyInArray!0 (select (arr!48547 a!2804) j!70)) (and (not (= (select (arr!48547 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48547 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1508545 d!158463))

(declare-fun b!1508692 () Bool)

(declare-fun lt!654716 () SeekEntryResult!12718)

(assert (=> b!1508692 (and (bvsge (index!53269 lt!654716) #b00000000000000000000000000000000) (bvslt (index!53269 lt!654716) (size!49097 a!2804)))))

(declare-fun e!842833 () Bool)

(assert (=> b!1508692 (= e!842833 (= (select (arr!48547 a!2804) (index!53269 lt!654716)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1508693 () Bool)

(declare-fun e!842829 () Bool)

(declare-fun e!842830 () Bool)

(assert (=> b!1508693 (= e!842829 e!842830)))

(declare-fun res!1028621 () Bool)

(assert (=> b!1508693 (= res!1028621 (and (is-Intermediate!12718 lt!654716) (not (undefined!13530 lt!654716)) (bvslt (x!135022 lt!654716) #b01111111111111111111111111111110) (bvsge (x!135022 lt!654716) #b00000000000000000000000000000000) (bvsge (x!135022 lt!654716) #b00000000000000000000000000000000)))))

(assert (=> b!1508693 (=> (not res!1028621) (not e!842830))))

(declare-fun b!1508694 () Bool)

(declare-fun e!842832 () SeekEntryResult!12718)

(declare-fun e!842831 () SeekEntryResult!12718)

(assert (=> b!1508694 (= e!842832 e!842831)))

(declare-fun lt!654717 () (_ BitVec 64))

(declare-fun c!139578 () Bool)

(assert (=> b!1508694 (= c!139578 (or (= lt!654717 (select (arr!48547 a!2804) j!70)) (= (bvadd lt!654717 lt!654717) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1508695 () Bool)

(assert (=> b!1508695 (= e!842831 (Intermediate!12718 false (toIndex!0 (select (arr!48547 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1508696 () Bool)

(assert (=> b!1508696 (= e!842829 (bvsge (x!135022 lt!654716) #b01111111111111111111111111111110))))

(declare-fun b!1508697 () Bool)

(assert (=> b!1508697 (and (bvsge (index!53269 lt!654716) #b00000000000000000000000000000000) (bvslt (index!53269 lt!654716) (size!49097 a!2804)))))

(declare-fun res!1028622 () Bool)

(assert (=> b!1508697 (= res!1028622 (= (select (arr!48547 a!2804) (index!53269 lt!654716)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1508697 (=> res!1028622 e!842833)))

(declare-fun b!1508698 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508698 (= e!842831 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48547 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48547 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1508699 () Bool)

(assert (=> b!1508699 (= e!842832 (Intermediate!12718 true (toIndex!0 (select (arr!48547 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1508700 () Bool)

(assert (=> b!1508700 (and (bvsge (index!53269 lt!654716) #b00000000000000000000000000000000) (bvslt (index!53269 lt!654716) (size!49097 a!2804)))))

(declare-fun res!1028623 () Bool)

(assert (=> b!1508700 (= res!1028623 (= (select (arr!48547 a!2804) (index!53269 lt!654716)) (select (arr!48547 a!2804) j!70)))))

(assert (=> b!1508700 (=> res!1028623 e!842833)))

(assert (=> b!1508700 (= e!842830 e!842833)))

(declare-fun d!158469 () Bool)

(assert (=> d!158469 e!842829))

(declare-fun c!139579 () Bool)

(assert (=> d!158469 (= c!139579 (and (is-Intermediate!12718 lt!654716) (undefined!13530 lt!654716)))))

(assert (=> d!158469 (= lt!654716 e!842832)))

(declare-fun c!139577 () Bool)

(assert (=> d!158469 (= c!139577 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!158469 (= lt!654717 (select (arr!48547 a!2804) (toIndex!0 (select (arr!48547 a!2804) j!70) mask!2512)))))

(assert (=> d!158469 (validMask!0 mask!2512)))

(assert (=> d!158469 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48547 a!2804) j!70) mask!2512) (select (arr!48547 a!2804) j!70) a!2804 mask!2512) lt!654716)))

(assert (= (and d!158469 c!139577) b!1508699))

(assert (= (and d!158469 (not c!139577)) b!1508694))

(assert (= (and b!1508694 c!139578) b!1508695))

(assert (= (and b!1508694 (not c!139578)) b!1508698))

(assert (= (and d!158469 c!139579) b!1508696))

(assert (= (and d!158469 (not c!139579)) b!1508693))

(assert (= (and b!1508693 res!1028621) b!1508700))

(assert (= (and b!1508700 (not res!1028623)) b!1508697))

(assert (= (and b!1508697 (not res!1028622)) b!1508692))

(declare-fun m!1391143 () Bool)

(assert (=> b!1508700 m!1391143))

(assert (=> b!1508698 m!1391071))

(declare-fun m!1391145 () Bool)

(assert (=> b!1508698 m!1391145))

(assert (=> b!1508698 m!1391145))

(assert (=> b!1508698 m!1391061))

(declare-fun m!1391147 () Bool)

(assert (=> b!1508698 m!1391147))

(assert (=> b!1508692 m!1391143))

(assert (=> b!1508697 m!1391143))

(assert (=> d!158469 m!1391071))

(declare-fun m!1391149 () Bool)

(assert (=> d!158469 m!1391149))

(assert (=> d!158469 m!1391079))

(assert (=> b!1508549 d!158469))

(declare-fun d!158489 () Bool)

(declare-fun lt!654719 () (_ BitVec 32))

(declare-fun lt!654718 () (_ BitVec 32))

(assert (=> d!158489 (= lt!654719 (bvmul (bvxor lt!654718 (bvlshr lt!654718 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158489 (= lt!654718 ((_ extract 31 0) (bvand (bvxor (select (arr!48547 a!2804) j!70) (bvlshr (select (arr!48547 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158489 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1028573 (let ((h!36436 ((_ extract 31 0) (bvand (bvxor (select (arr!48547 a!2804) j!70) (bvlshr (select (arr!48547 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!135024 (bvmul (bvxor h!36436 (bvlshr h!36436 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!135024 (bvlshr x!135024 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1028573 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1028573 #b00000000000000000000000000000000))))))

(assert (=> d!158489 (= (toIndex!0 (select (arr!48547 a!2804) j!70) mask!2512) (bvand (bvxor lt!654719 (bvlshr lt!654719 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1508549 d!158489))

(declare-fun d!158491 () Bool)

(assert (=> d!158491 (= (validKeyInArray!0 (select (arr!48547 a!2804) i!961)) (and (not (= (select (arr!48547 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48547 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1508548 d!158491))

(declare-fun b!1508706 () Bool)

(declare-fun lt!654720 () SeekEntryResult!12718)

(assert (=> b!1508706 (and (bvsge (index!53269 lt!654720) #b00000000000000000000000000000000) (bvslt (index!53269 lt!654720) (size!49097 a!2804)))))

(declare-fun e!842842 () Bool)

(assert (=> b!1508706 (= e!842842 (= (select (arr!48547 a!2804) (index!53269 lt!654720)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1508707 () Bool)

(declare-fun e!842838 () Bool)

(declare-fun e!842839 () Bool)

(assert (=> b!1508707 (= e!842838 e!842839)))

(declare-fun res!1028627 () Bool)

(assert (=> b!1508707 (= res!1028627 (and (is-Intermediate!12718 lt!654720) (not (undefined!13530 lt!654720)) (bvslt (x!135022 lt!654720) #b01111111111111111111111111111110) (bvsge (x!135022 lt!654720) #b00000000000000000000000000000000) (bvsge (x!135022 lt!654720) x!534)))))

(assert (=> b!1508707 (=> (not res!1028627) (not e!842839))))

(declare-fun b!1508708 () Bool)

(declare-fun e!842841 () SeekEntryResult!12718)

(declare-fun e!842840 () SeekEntryResult!12718)

(assert (=> b!1508708 (= e!842841 e!842840)))

(declare-fun c!139582 () Bool)

(declare-fun lt!654721 () (_ BitVec 64))

(assert (=> b!1508708 (= c!139582 (or (= lt!654721 (select (arr!48547 a!2804) j!70)) (= (bvadd lt!654721 lt!654721) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1508709 () Bool)

(assert (=> b!1508709 (= e!842840 (Intermediate!12718 false index!487 x!534))))

(declare-fun b!1508710 () Bool)

(assert (=> b!1508710 (= e!842838 (bvsge (x!135022 lt!654720) #b01111111111111111111111111111110))))

(declare-fun b!1508711 () Bool)

(assert (=> b!1508711 (and (bvsge (index!53269 lt!654720) #b00000000000000000000000000000000) (bvslt (index!53269 lt!654720) (size!49097 a!2804)))))

(declare-fun res!1028628 () Bool)

(assert (=> b!1508711 (= res!1028628 (= (select (arr!48547 a!2804) (index!53269 lt!654720)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1508711 (=> res!1028628 e!842842)))

(declare-fun b!1508712 () Bool)

(assert (=> b!1508712 (= e!842840 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48547 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1508713 () Bool)

(assert (=> b!1508713 (= e!842841 (Intermediate!12718 true index!487 x!534))))

(declare-fun b!1508714 () Bool)

(assert (=> b!1508714 (and (bvsge (index!53269 lt!654720) #b00000000000000000000000000000000) (bvslt (index!53269 lt!654720) (size!49097 a!2804)))))

(declare-fun res!1028629 () Bool)

(assert (=> b!1508714 (= res!1028629 (= (select (arr!48547 a!2804) (index!53269 lt!654720)) (select (arr!48547 a!2804) j!70)))))

(assert (=> b!1508714 (=> res!1028629 e!842842)))

(assert (=> b!1508714 (= e!842839 e!842842)))

(declare-fun d!158493 () Bool)

(assert (=> d!158493 e!842838))

(declare-fun c!139583 () Bool)

(assert (=> d!158493 (= c!139583 (and (is-Intermediate!12718 lt!654720) (undefined!13530 lt!654720)))))

(assert (=> d!158493 (= lt!654720 e!842841)))

(declare-fun c!139581 () Bool)

(assert (=> d!158493 (= c!139581 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!158493 (= lt!654721 (select (arr!48547 a!2804) index!487))))

(assert (=> d!158493 (validMask!0 mask!2512)))

(assert (=> d!158493 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48547 a!2804) j!70) a!2804 mask!2512) lt!654720)))

(assert (= (and d!158493 c!139581) b!1508713))

(assert (= (and d!158493 (not c!139581)) b!1508708))

(assert (= (and b!1508708 c!139582) b!1508709))

(assert (= (and b!1508708 (not c!139582)) b!1508712))

(assert (= (and d!158493 c!139583) b!1508710))

(assert (= (and d!158493 (not c!139583)) b!1508707))

(assert (= (and b!1508707 res!1028627) b!1508714))

(assert (= (and b!1508714 (not res!1028629)) b!1508711))

(assert (= (and b!1508711 (not res!1028628)) b!1508706))

(declare-fun m!1391159 () Bool)

(assert (=> b!1508714 m!1391159))

(declare-fun m!1391161 () Bool)

(assert (=> b!1508712 m!1391161))

(assert (=> b!1508712 m!1391161))

(assert (=> b!1508712 m!1391061))

(declare-fun m!1391163 () Bool)

(assert (=> b!1508712 m!1391163))

(assert (=> b!1508706 m!1391159))

(assert (=> b!1508711 m!1391159))

(declare-fun m!1391165 () Bool)

(assert (=> d!158493 m!1391165))

(assert (=> d!158493 m!1391079))

(assert (=> b!1508552 d!158493))

(declare-fun d!158499 () Bool)

(assert (=> d!158499 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128722 d!158499))

(declare-fun d!158501 () Bool)

(assert (=> d!158501 (= (array_inv!37575 a!2804) (bvsge (size!49097 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128722 d!158501))

(declare-fun b!1508737 () Bool)

(declare-fun e!842862 () Bool)

(declare-fun e!842860 () Bool)

(assert (=> b!1508737 (= e!842862 e!842860)))

(declare-fun res!1028642 () Bool)

(assert (=> b!1508737 (=> (not res!1028642) (not e!842860))))

(declare-fun e!842861 () Bool)

(assert (=> b!1508737 (= res!1028642 (not e!842861))))

(declare-fun res!1028644 () Bool)

(assert (=> b!1508737 (=> (not res!1028644) (not e!842861))))

(assert (=> b!1508737 (= res!1028644 (validKeyInArray!0 (select (arr!48547 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68307 () Bool)

(declare-fun call!68310 () Bool)

(declare-fun c!139589 () Bool)

(assert (=> bm!68307 (= call!68310 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139589 (Cons!35026 (select (arr!48547 a!2804) #b00000000000000000000000000000000) Nil!35027) Nil!35027)))))

(declare-fun d!158503 () Bool)

(declare-fun res!1028643 () Bool)

(assert (=> d!158503 (=> res!1028643 e!842862)))

(assert (=> d!158503 (= res!1028643 (bvsge #b00000000000000000000000000000000 (size!49097 a!2804)))))

(assert (=> d!158503 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35027) e!842862)))

(declare-fun b!1508738 () Bool)

(declare-fun e!842863 () Bool)

(assert (=> b!1508738 (= e!842860 e!842863)))

(assert (=> b!1508738 (= c!139589 (validKeyInArray!0 (select (arr!48547 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1508739 () Bool)

(assert (=> b!1508739 (= e!842863 call!68310)))

(declare-fun b!1508740 () Bool)

(declare-fun contains!9975 (List!35030 (_ BitVec 64)) Bool)

(assert (=> b!1508740 (= e!842861 (contains!9975 Nil!35027 (select (arr!48547 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1508741 () Bool)

(assert (=> b!1508741 (= e!842863 call!68310)))

(assert (= (and d!158503 (not res!1028643)) b!1508737))

(assert (= (and b!1508737 res!1028644) b!1508740))

(assert (= (and b!1508737 res!1028642) b!1508738))

(assert (= (and b!1508738 c!139589) b!1508741))

(assert (= (and b!1508738 (not c!139589)) b!1508739))

(assert (= (or b!1508741 b!1508739) bm!68307))

(assert (=> b!1508737 m!1391107))

(assert (=> b!1508737 m!1391107))

(assert (=> b!1508737 m!1391109))

(assert (=> bm!68307 m!1391107))

(declare-fun m!1391175 () Bool)

(assert (=> bm!68307 m!1391175))

(assert (=> b!1508738 m!1391107))

(assert (=> b!1508738 m!1391107))

(assert (=> b!1508738 m!1391109))

(assert (=> b!1508740 m!1391107))

(assert (=> b!1508740 m!1391107))

(declare-fun m!1391177 () Bool)

(assert (=> b!1508740 m!1391177))

(assert (=> b!1508547 d!158503))

(push 1)

