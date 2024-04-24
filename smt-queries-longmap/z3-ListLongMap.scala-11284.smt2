; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131958 () Bool)

(assert start!131958)

(declare-fun b!1543759 () Bool)

(declare-fun res!1058730 () Bool)

(declare-fun e!858766 () Bool)

(assert (=> b!1543759 (=> (not res!1058730) (not e!858766))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-datatypes ((array!102569 0))(
  ( (array!102570 (arr!49486 (Array (_ BitVec 32) (_ BitVec 64))) (size!50037 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102569)

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1543759 (= res!1058730 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!50037 a!3920))))))

(declare-fun b!1543760 () Bool)

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102569 (_ BitVec 32)) Bool)

(assert (=> b!1543760 (= e!858766 (not (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052)))))

(declare-fun b!1543758 () Bool)

(declare-fun res!1058729 () Bool)

(assert (=> b!1543758 (=> (not res!1058729) (not e!858766))))

(assert (=> b!1543758 (= res!1058729 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1543757 () Bool)

(declare-fun res!1058728 () Bool)

(assert (=> b!1543757 (=> (not res!1058728) (not e!858766))))

(assert (=> b!1543757 (= res!1058728 (and (= (size!50037 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!50037 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!50037 a!3920))))))

(declare-fun res!1058727 () Bool)

(assert (=> start!131958 (=> (not res!1058727) (not e!858766))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131958 (= res!1058727 (validMask!0 mask!4052))))

(assert (=> start!131958 e!858766))

(assert (=> start!131958 true))

(declare-fun array_inv!38767 (array!102569) Bool)

(assert (=> start!131958 (array_inv!38767 a!3920)))

(assert (= (and start!131958 res!1058727) b!1543757))

(assert (= (and b!1543757 res!1058728) b!1543758))

(assert (= (and b!1543758 res!1058729) b!1543759))

(assert (= (and b!1543759 res!1058730) b!1543760))

(declare-fun m!1425575 () Bool)

(assert (=> b!1543760 m!1425575))

(declare-fun m!1425577 () Bool)

(assert (=> b!1543758 m!1425577))

(declare-fun m!1425579 () Bool)

(assert (=> start!131958 m!1425579))

(declare-fun m!1425581 () Bool)

(assert (=> start!131958 m!1425581))

(check-sat (not b!1543760) (not start!131958) (not b!1543758))
(check-sat)
(get-model)

(declare-fun b!1543793 () Bool)

(declare-fun e!858785 () Bool)

(declare-fun e!858787 () Bool)

(assert (=> b!1543793 (= e!858785 e!858787)))

(declare-fun c!142087 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1543793 (= c!142087 (validKeyInArray!0 (select (arr!49486 a!3920) (bvadd #b00000000000000000000000000000001 from!3298))))))

(declare-fun b!1543794 () Bool)

(declare-fun e!858786 () Bool)

(declare-fun call!68823 () Bool)

(assert (=> b!1543794 (= e!858786 call!68823)))

(declare-fun b!1543795 () Bool)

(assert (=> b!1543795 (= e!858787 call!68823)))

(declare-fun b!1543796 () Bool)

(assert (=> b!1543796 (= e!858787 e!858786)))

(declare-fun lt!666565 () (_ BitVec 64))

(assert (=> b!1543796 (= lt!666565 (select (arr!49486 a!3920) (bvadd #b00000000000000000000000000000001 from!3298)))))

(declare-datatypes ((Unit!51403 0))(
  ( (Unit!51404) )
))
(declare-fun lt!666566 () Unit!51403)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102569 (_ BitVec 64) (_ BitVec 32)) Unit!51403)

(assert (=> b!1543796 (= lt!666566 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3920 lt!666565 (bvadd #b00000000000000000000000000000001 from!3298)))))

(declare-fun arrayContainsKey!0 (array!102569 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1543796 (arrayContainsKey!0 a!3920 lt!666565 #b00000000000000000000000000000000)))

(declare-fun lt!666567 () Unit!51403)

(assert (=> b!1543796 (= lt!666567 lt!666566)))

(declare-fun res!1058759 () Bool)

(declare-datatypes ((SeekEntryResult!13453 0))(
  ( (MissingZero!13453 (index!56210 (_ BitVec 32))) (Found!13453 (index!56211 (_ BitVec 32))) (Intermediate!13453 (undefined!14265 Bool) (index!56212 (_ BitVec 32)) (x!138302 (_ BitVec 32))) (Undefined!13453) (MissingVacant!13453 (index!56213 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!102569 (_ BitVec 32)) SeekEntryResult!13453)

(assert (=> b!1543796 (= res!1058759 (= (seekEntryOrOpen!0 (select (arr!49486 a!3920) (bvadd #b00000000000000000000000000000001 from!3298)) a!3920 mask!4052) (Found!13453 (bvadd #b00000000000000000000000000000001 from!3298))))))

(assert (=> b!1543796 (=> (not res!1058759) (not e!858786))))

(declare-fun d!161353 () Bool)

(declare-fun res!1058760 () Bool)

(assert (=> d!161353 (=> res!1058760 e!858785)))

(assert (=> d!161353 (= res!1058760 (bvsge (bvadd #b00000000000000000000000000000001 from!3298) (size!50037 a!3920)))))

(assert (=> d!161353 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052) e!858785)))

(declare-fun bm!68820 () Bool)

(assert (=> bm!68820 (= call!68823 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298 #b00000000000000000000000000000001) a!3920 mask!4052))))

(assert (= (and d!161353 (not res!1058760)) b!1543793))

(assert (= (and b!1543793 c!142087) b!1543796))

(assert (= (and b!1543793 (not c!142087)) b!1543795))

(assert (= (and b!1543796 res!1058759) b!1543794))

(assert (= (or b!1543794 b!1543795) bm!68820))

(declare-fun m!1425599 () Bool)

(assert (=> b!1543793 m!1425599))

(assert (=> b!1543793 m!1425599))

(declare-fun m!1425601 () Bool)

(assert (=> b!1543793 m!1425601))

(assert (=> b!1543796 m!1425599))

(declare-fun m!1425603 () Bool)

(assert (=> b!1543796 m!1425603))

(declare-fun m!1425605 () Bool)

(assert (=> b!1543796 m!1425605))

(assert (=> b!1543796 m!1425599))

(declare-fun m!1425607 () Bool)

(assert (=> b!1543796 m!1425607))

(declare-fun m!1425609 () Bool)

(assert (=> bm!68820 m!1425609))

(assert (=> b!1543760 d!161353))

(declare-fun d!161357 () Bool)

(assert (=> d!161357 (= (validMask!0 mask!4052) (and (or (= mask!4052 #b00000000000000000000000000000111) (= mask!4052 #b00000000000000000000000000001111) (= mask!4052 #b00000000000000000000000000011111) (= mask!4052 #b00000000000000000000000000111111) (= mask!4052 #b00000000000000000000000001111111) (= mask!4052 #b00000000000000000000000011111111) (= mask!4052 #b00000000000000000000000111111111) (= mask!4052 #b00000000000000000000001111111111) (= mask!4052 #b00000000000000000000011111111111) (= mask!4052 #b00000000000000000000111111111111) (= mask!4052 #b00000000000000000001111111111111) (= mask!4052 #b00000000000000000011111111111111) (= mask!4052 #b00000000000000000111111111111111) (= mask!4052 #b00000000000000001111111111111111) (= mask!4052 #b00000000000000011111111111111111) (= mask!4052 #b00000000000000111111111111111111) (= mask!4052 #b00000000000001111111111111111111) (= mask!4052 #b00000000000011111111111111111111) (= mask!4052 #b00000000000111111111111111111111) (= mask!4052 #b00000000001111111111111111111111) (= mask!4052 #b00000000011111111111111111111111) (= mask!4052 #b00000000111111111111111111111111) (= mask!4052 #b00000001111111111111111111111111) (= mask!4052 #b00000011111111111111111111111111) (= mask!4052 #b00000111111111111111111111111111) (= mask!4052 #b00001111111111111111111111111111) (= mask!4052 #b00011111111111111111111111111111) (= mask!4052 #b00111111111111111111111111111111)) (bvsle mask!4052 #b00111111111111111111111111111111)))))

(assert (=> start!131958 d!161357))

(declare-fun d!161363 () Bool)

(assert (=> d!161363 (= (array_inv!38767 a!3920) (bvsge (size!50037 a!3920) #b00000000000000000000000000000000))))

(assert (=> start!131958 d!161363))

(declare-fun b!1543809 () Bool)

(declare-fun e!858797 () Bool)

(declare-fun e!858799 () Bool)

(assert (=> b!1543809 (= e!858797 e!858799)))

(declare-fun c!142091 () Bool)

(assert (=> b!1543809 (= c!142091 (validKeyInArray!0 (select (arr!49486 a!3920) from!3298)))))

(declare-fun b!1543810 () Bool)

(declare-fun e!858798 () Bool)

(declare-fun call!68827 () Bool)

(assert (=> b!1543810 (= e!858798 call!68827)))

(declare-fun b!1543811 () Bool)

(assert (=> b!1543811 (= e!858799 call!68827)))

(declare-fun b!1543812 () Bool)

(assert (=> b!1543812 (= e!858799 e!858798)))

(declare-fun lt!666577 () (_ BitVec 64))

(assert (=> b!1543812 (= lt!666577 (select (arr!49486 a!3920) from!3298))))

(declare-fun lt!666578 () Unit!51403)

(assert (=> b!1543812 (= lt!666578 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3920 lt!666577 from!3298))))

(assert (=> b!1543812 (arrayContainsKey!0 a!3920 lt!666577 #b00000000000000000000000000000000)))

(declare-fun lt!666579 () Unit!51403)

(assert (=> b!1543812 (= lt!666579 lt!666578)))

(declare-fun res!1058767 () Bool)

(assert (=> b!1543812 (= res!1058767 (= (seekEntryOrOpen!0 (select (arr!49486 a!3920) from!3298) a!3920 mask!4052) (Found!13453 from!3298)))))

(assert (=> b!1543812 (=> (not res!1058767) (not e!858798))))

(declare-fun d!161365 () Bool)

(declare-fun res!1058768 () Bool)

(assert (=> d!161365 (=> res!1058768 e!858797)))

(assert (=> d!161365 (= res!1058768 (bvsge from!3298 (size!50037 a!3920)))))

(assert (=> d!161365 (= (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052) e!858797)))

(declare-fun bm!68824 () Bool)

(assert (=> bm!68824 (= call!68827 (arrayForallSeekEntryOrOpenFound!0 (bvadd from!3298 #b00000000000000000000000000000001) a!3920 mask!4052))))

(assert (= (and d!161365 (not res!1058768)) b!1543809))

(assert (= (and b!1543809 c!142091) b!1543812))

(assert (= (and b!1543809 (not c!142091)) b!1543811))

(assert (= (and b!1543812 res!1058767) b!1543810))

(assert (= (or b!1543810 b!1543811) bm!68824))

(declare-fun m!1425623 () Bool)

(assert (=> b!1543809 m!1425623))

(assert (=> b!1543809 m!1425623))

(declare-fun m!1425625 () Bool)

(assert (=> b!1543809 m!1425625))

(assert (=> b!1543812 m!1425623))

(declare-fun m!1425627 () Bool)

(assert (=> b!1543812 m!1425627))

(declare-fun m!1425629 () Bool)

(assert (=> b!1543812 m!1425629))

(assert (=> b!1543812 m!1425623))

(declare-fun m!1425631 () Bool)

(assert (=> b!1543812 m!1425631))

(declare-fun m!1425633 () Bool)

(assert (=> bm!68824 m!1425633))

(assert (=> b!1543758 d!161365))

(check-sat (not bm!68820) (not bm!68824) (not b!1543796) (not b!1543793) (not b!1543809) (not b!1543812))
(check-sat)
