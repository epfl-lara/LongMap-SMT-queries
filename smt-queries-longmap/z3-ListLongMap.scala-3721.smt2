; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51256 () Bool)

(assert start!51256)

(declare-fun e!322399 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5343 0))(
  ( (MissingZero!5343 (index!23599 (_ BitVec 32))) (Found!5343 (index!23600 (_ BitVec 32))) (Intermediate!5343 (undefined!6155 Bool) (index!23601 (_ BitVec 32)) (x!52509 (_ BitVec 32))) (Undefined!5343) (MissingVacant!5343 (index!23602 (_ BitVec 32))) )
))
(declare-fun lt!254350 () SeekEntryResult!5343)

(declare-datatypes ((array!35184 0))(
  ( (array!35185 (arr!16894 (Array (_ BitVec 32) (_ BitVec 64))) (size!17258 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35184)

(declare-fun lt!254353 () SeekEntryResult!5343)

(declare-fun b!559620 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35184 (_ BitVec 32)) SeekEntryResult!5343)

(assert (=> b!559620 (= e!322399 (= lt!254350 (seekKeyOrZeroReturnVacant!0 (x!52509 lt!254353) (index!23601 lt!254353) (index!23601 lt!254353) (select (arr!16894 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!559621 () Bool)

(declare-fun e!322400 () Bool)

(declare-fun e!322402 () Bool)

(assert (=> b!559621 (= e!322400 e!322402)))

(declare-fun res!351010 () Bool)

(assert (=> b!559621 (=> res!351010 e!322402)))

(get-info :version)

(assert (=> b!559621 (= res!351010 (or (undefined!6155 lt!254353) (not ((_ is Intermediate!5343) lt!254353))))))

(declare-fun b!559622 () Bool)

(declare-fun res!351015 () Bool)

(declare-fun e!322403 () Bool)

(assert (=> b!559622 (=> (not res!351015) (not e!322403))))

(declare-datatypes ((List!10974 0))(
  ( (Nil!10971) (Cons!10970 (h!11970 (_ BitVec 64)) (t!17202 List!10974)) )
))
(declare-fun arrayNoDuplicates!0 (array!35184 (_ BitVec 32) List!10974) Bool)

(assert (=> b!559622 (= res!351015 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10971))))

(declare-fun b!559623 () Bool)

(assert (=> b!559623 (= e!322402 e!322399)))

(declare-fun res!351014 () Bool)

(assert (=> b!559623 (=> res!351014 e!322399)))

(declare-fun lt!254349 () (_ BitVec 64))

(assert (=> b!559623 (= res!351014 (or (= lt!254349 (select (arr!16894 a!3118) j!142)) (= lt!254349 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!559623 (= lt!254349 (select (arr!16894 a!3118) (index!23601 lt!254353)))))

(declare-fun b!559624 () Bool)

(declare-fun res!351020 () Bool)

(declare-fun e!322398 () Bool)

(assert (=> b!559624 (=> (not res!351020) (not e!322398))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!559624 (= res!351020 (validKeyInArray!0 (select (arr!16894 a!3118) j!142)))))

(declare-fun b!559625 () Bool)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun e!322401 () Bool)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!559625 (= e!322401 (not (or (undefined!6155 lt!254353) (not ((_ is Intermediate!5343) lt!254353)) (let ((bdg!16975 (select (arr!16894 a!3118) (index!23601 lt!254353)))) (or (= bdg!16975 (select (arr!16894 a!3118) j!142)) (= bdg!16975 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000) (bvslt (index!23601 lt!254353) #b00000000000000000000000000000000) (bvsge (index!23601 lt!254353) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52509 lt!254353) #b01111111111111111111111111111110) (bvslt (x!52509 lt!254353) #b00000000000000000000000000000000) (= (select (store (arr!16894 a!3118) i!1132 k0!1914) (index!23601 lt!254353)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!559625 e!322400))

(declare-fun res!351009 () Bool)

(assert (=> b!559625 (=> (not res!351009) (not e!322400))))

(assert (=> b!559625 (= res!351009 (= lt!254350 (Found!5343 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35184 (_ BitVec 32)) SeekEntryResult!5343)

(assert (=> b!559625 (= lt!254350 (seekEntryOrOpen!0 (select (arr!16894 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35184 (_ BitVec 32)) Bool)

(assert (=> b!559625 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17460 0))(
  ( (Unit!17461) )
))
(declare-fun lt!254354 () Unit!17460)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35184 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17460)

(assert (=> b!559625 (= lt!254354 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!559626 () Bool)

(assert (=> b!559626 (= e!322403 e!322401)))

(declare-fun res!351013 () Bool)

(assert (=> b!559626 (=> (not res!351013) (not e!322401))))

(declare-fun lt!254351 () (_ BitVec 64))

(declare-fun lt!254356 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35184 (_ BitVec 32)) SeekEntryResult!5343)

(assert (=> b!559626 (= res!351013 (= lt!254353 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254356 lt!254351 (array!35185 (store (arr!16894 a!3118) i!1132 k0!1914) (size!17258 a!3118)) mask!3119)))))

(declare-fun lt!254352 () (_ BitVec 32))

(assert (=> b!559626 (= lt!254353 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254352 (select (arr!16894 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!559626 (= lt!254356 (toIndex!0 lt!254351 mask!3119))))

(assert (=> b!559626 (= lt!254351 (select (store (arr!16894 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!559626 (= lt!254352 (toIndex!0 (select (arr!16894 a!3118) j!142) mask!3119))))

(declare-fun b!559627 () Bool)

(declare-fun res!351017 () Bool)

(assert (=> b!559627 (=> (not res!351017) (not e!322398))))

(declare-fun arrayContainsKey!0 (array!35184 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!559627 (= res!351017 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!559628 () Bool)

(declare-fun res!351012 () Bool)

(assert (=> b!559628 (=> (not res!351012) (not e!322398))))

(assert (=> b!559628 (= res!351012 (validKeyInArray!0 k0!1914))))

(declare-fun res!351019 () Bool)

(assert (=> start!51256 (=> (not res!351019) (not e!322398))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51256 (= res!351019 (validMask!0 mask!3119))))

(assert (=> start!51256 e!322398))

(assert (=> start!51256 true))

(declare-fun array_inv!12690 (array!35184) Bool)

(assert (=> start!51256 (array_inv!12690 a!3118)))

(declare-fun b!559629 () Bool)

(declare-fun res!351018 () Bool)

(assert (=> b!559629 (=> (not res!351018) (not e!322398))))

(assert (=> b!559629 (= res!351018 (and (= (size!17258 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17258 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17258 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!559630 () Bool)

(declare-fun res!351016 () Bool)

(assert (=> b!559630 (=> (not res!351016) (not e!322403))))

(assert (=> b!559630 (= res!351016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!559631 () Bool)

(assert (=> b!559631 (= e!322398 e!322403)))

(declare-fun res!351011 () Bool)

(assert (=> b!559631 (=> (not res!351011) (not e!322403))))

(declare-fun lt!254355 () SeekEntryResult!5343)

(assert (=> b!559631 (= res!351011 (or (= lt!254355 (MissingZero!5343 i!1132)) (= lt!254355 (MissingVacant!5343 i!1132))))))

(assert (=> b!559631 (= lt!254355 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!51256 res!351019) b!559629))

(assert (= (and b!559629 res!351018) b!559624))

(assert (= (and b!559624 res!351020) b!559628))

(assert (= (and b!559628 res!351012) b!559627))

(assert (= (and b!559627 res!351017) b!559631))

(assert (= (and b!559631 res!351011) b!559630))

(assert (= (and b!559630 res!351016) b!559622))

(assert (= (and b!559622 res!351015) b!559626))

(assert (= (and b!559626 res!351013) b!559625))

(assert (= (and b!559625 res!351009) b!559621))

(assert (= (and b!559621 (not res!351010)) b!559623))

(assert (= (and b!559623 (not res!351014)) b!559620))

(declare-fun m!537453 () Bool)

(assert (=> b!559627 m!537453))

(declare-fun m!537455 () Bool)

(assert (=> b!559628 m!537455))

(declare-fun m!537457 () Bool)

(assert (=> b!559620 m!537457))

(assert (=> b!559620 m!537457))

(declare-fun m!537459 () Bool)

(assert (=> b!559620 m!537459))

(declare-fun m!537461 () Bool)

(assert (=> b!559630 m!537461))

(assert (=> b!559624 m!537457))

(assert (=> b!559624 m!537457))

(declare-fun m!537463 () Bool)

(assert (=> b!559624 m!537463))

(assert (=> b!559625 m!537457))

(declare-fun m!537465 () Bool)

(assert (=> b!559625 m!537465))

(declare-fun m!537467 () Bool)

(assert (=> b!559625 m!537467))

(declare-fun m!537469 () Bool)

(assert (=> b!559625 m!537469))

(declare-fun m!537471 () Bool)

(assert (=> b!559625 m!537471))

(declare-fun m!537473 () Bool)

(assert (=> b!559625 m!537473))

(assert (=> b!559625 m!537457))

(declare-fun m!537475 () Bool)

(assert (=> b!559625 m!537475))

(declare-fun m!537477 () Bool)

(assert (=> start!51256 m!537477))

(declare-fun m!537479 () Bool)

(assert (=> start!51256 m!537479))

(assert (=> b!559623 m!537457))

(assert (=> b!559623 m!537467))

(declare-fun m!537481 () Bool)

(assert (=> b!559631 m!537481))

(assert (=> b!559626 m!537457))

(declare-fun m!537483 () Bool)

(assert (=> b!559626 m!537483))

(assert (=> b!559626 m!537457))

(assert (=> b!559626 m!537457))

(declare-fun m!537485 () Bool)

(assert (=> b!559626 m!537485))

(declare-fun m!537487 () Bool)

(assert (=> b!559626 m!537487))

(declare-fun m!537489 () Bool)

(assert (=> b!559626 m!537489))

(declare-fun m!537491 () Bool)

(assert (=> b!559626 m!537491))

(assert (=> b!559626 m!537469))

(declare-fun m!537493 () Bool)

(assert (=> b!559622 m!537493))

(check-sat (not b!559627) (not b!559628) (not start!51256) (not b!559624) (not b!559625) (not b!559631) (not b!559626) (not b!559620) (not b!559622) (not b!559630))
(check-sat)
(get-model)

(declare-fun d!83779 () Bool)

(assert (=> d!83779 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!559628 d!83779))

(declare-fun d!83781 () Bool)

(declare-fun res!351061 () Bool)

(declare-fun e!322430 () Bool)

(assert (=> d!83781 (=> res!351061 e!322430)))

(assert (=> d!83781 (= res!351061 (= (select (arr!16894 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!83781 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!322430)))

(declare-fun b!559672 () Bool)

(declare-fun e!322431 () Bool)

(assert (=> b!559672 (= e!322430 e!322431)))

(declare-fun res!351062 () Bool)

(assert (=> b!559672 (=> (not res!351062) (not e!322431))))

(assert (=> b!559672 (= res!351062 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17258 a!3118)))))

(declare-fun b!559673 () Bool)

(assert (=> b!559673 (= e!322431 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83781 (not res!351061)) b!559672))

(assert (= (and b!559672 res!351062) b!559673))

(declare-fun m!537537 () Bool)

(assert (=> d!83781 m!537537))

(declare-fun m!537539 () Bool)

(assert (=> b!559673 m!537539))

(assert (=> b!559627 d!83781))

(declare-fun b!559684 () Bool)

(declare-fun e!322443 () Bool)

(declare-fun e!322442 () Bool)

(assert (=> b!559684 (= e!322443 e!322442)))

(declare-fun c!64652 () Bool)

(assert (=> b!559684 (= c!64652 (validKeyInArray!0 (select (arr!16894 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!559685 () Bool)

(declare-fun call!32438 () Bool)

(assert (=> b!559685 (= e!322442 call!32438)))

(declare-fun d!83783 () Bool)

(declare-fun res!351071 () Bool)

(declare-fun e!322441 () Bool)

(assert (=> d!83783 (=> res!351071 e!322441)))

(assert (=> d!83783 (= res!351071 (bvsge #b00000000000000000000000000000000 (size!17258 a!3118)))))

(assert (=> d!83783 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10971) e!322441)))

(declare-fun bm!32435 () Bool)

(assert (=> bm!32435 (= call!32438 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64652 (Cons!10970 (select (arr!16894 a!3118) #b00000000000000000000000000000000) Nil!10971) Nil!10971)))))

(declare-fun b!559686 () Bool)

(declare-fun e!322440 () Bool)

(declare-fun contains!2859 (List!10974 (_ BitVec 64)) Bool)

(assert (=> b!559686 (= e!322440 (contains!2859 Nil!10971 (select (arr!16894 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!559687 () Bool)

(assert (=> b!559687 (= e!322442 call!32438)))

(declare-fun b!559688 () Bool)

(assert (=> b!559688 (= e!322441 e!322443)))

(declare-fun res!351069 () Bool)

(assert (=> b!559688 (=> (not res!351069) (not e!322443))))

(assert (=> b!559688 (= res!351069 (not e!322440))))

(declare-fun res!351070 () Bool)

(assert (=> b!559688 (=> (not res!351070) (not e!322440))))

(assert (=> b!559688 (= res!351070 (validKeyInArray!0 (select (arr!16894 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!83783 (not res!351071)) b!559688))

(assert (= (and b!559688 res!351070) b!559686))

(assert (= (and b!559688 res!351069) b!559684))

(assert (= (and b!559684 c!64652) b!559687))

(assert (= (and b!559684 (not c!64652)) b!559685))

(assert (= (or b!559687 b!559685) bm!32435))

(assert (=> b!559684 m!537537))

(assert (=> b!559684 m!537537))

(declare-fun m!537541 () Bool)

(assert (=> b!559684 m!537541))

(assert (=> bm!32435 m!537537))

(declare-fun m!537543 () Bool)

(assert (=> bm!32435 m!537543))

(assert (=> b!559686 m!537537))

(assert (=> b!559686 m!537537))

(declare-fun m!537545 () Bool)

(assert (=> b!559686 m!537545))

(assert (=> b!559688 m!537537))

(assert (=> b!559688 m!537537))

(assert (=> b!559688 m!537541))

(assert (=> b!559622 d!83783))

(declare-fun d!83785 () Bool)

(assert (=> d!83785 (= (validKeyInArray!0 (select (arr!16894 a!3118) j!142)) (and (not (= (select (arr!16894 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16894 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!559624 d!83785))

(declare-fun d!83787 () Bool)

(assert (=> d!83787 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51256 d!83787))

(declare-fun d!83789 () Bool)

(assert (=> d!83789 (= (array_inv!12690 a!3118) (bvsge (size!17258 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51256 d!83789))

(declare-fun b!559716 () Bool)

(declare-fun e!322463 () SeekEntryResult!5343)

(declare-fun lt!254388 () SeekEntryResult!5343)

(assert (=> b!559716 (= e!322463 (MissingZero!5343 (index!23601 lt!254388)))))

(declare-fun b!559717 () Bool)

(declare-fun e!322464 () SeekEntryResult!5343)

(declare-fun e!322462 () SeekEntryResult!5343)

(assert (=> b!559717 (= e!322464 e!322462)))

(declare-fun lt!254389 () (_ BitVec 64))

(assert (=> b!559717 (= lt!254389 (select (arr!16894 a!3118) (index!23601 lt!254388)))))

(declare-fun c!64663 () Bool)

(assert (=> b!559717 (= c!64663 (= lt!254389 (select (arr!16894 a!3118) j!142)))))

(declare-fun b!559718 () Bool)

(assert (=> b!559718 (= e!322462 (Found!5343 (index!23601 lt!254388)))))

(declare-fun b!559719 () Bool)

(declare-fun c!64662 () Bool)

(assert (=> b!559719 (= c!64662 (= lt!254389 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!559719 (= e!322462 e!322463)))

(declare-fun b!559720 () Bool)

(assert (=> b!559720 (= e!322463 (seekKeyOrZeroReturnVacant!0 (x!52509 lt!254388) (index!23601 lt!254388) (index!23601 lt!254388) (select (arr!16894 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!83791 () Bool)

(declare-fun lt!254387 () SeekEntryResult!5343)

(assert (=> d!83791 (and (or ((_ is Undefined!5343) lt!254387) (not ((_ is Found!5343) lt!254387)) (and (bvsge (index!23600 lt!254387) #b00000000000000000000000000000000) (bvslt (index!23600 lt!254387) (size!17258 a!3118)))) (or ((_ is Undefined!5343) lt!254387) ((_ is Found!5343) lt!254387) (not ((_ is MissingZero!5343) lt!254387)) (and (bvsge (index!23599 lt!254387) #b00000000000000000000000000000000) (bvslt (index!23599 lt!254387) (size!17258 a!3118)))) (or ((_ is Undefined!5343) lt!254387) ((_ is Found!5343) lt!254387) ((_ is MissingZero!5343) lt!254387) (not ((_ is MissingVacant!5343) lt!254387)) (and (bvsge (index!23602 lt!254387) #b00000000000000000000000000000000) (bvslt (index!23602 lt!254387) (size!17258 a!3118)))) (or ((_ is Undefined!5343) lt!254387) (ite ((_ is Found!5343) lt!254387) (= (select (arr!16894 a!3118) (index!23600 lt!254387)) (select (arr!16894 a!3118) j!142)) (ite ((_ is MissingZero!5343) lt!254387) (= (select (arr!16894 a!3118) (index!23599 lt!254387)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5343) lt!254387) (= (select (arr!16894 a!3118) (index!23602 lt!254387)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83791 (= lt!254387 e!322464)))

(declare-fun c!64664 () Bool)

(assert (=> d!83791 (= c!64664 (and ((_ is Intermediate!5343) lt!254388) (undefined!6155 lt!254388)))))

(assert (=> d!83791 (= lt!254388 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16894 a!3118) j!142) mask!3119) (select (arr!16894 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83791 (validMask!0 mask!3119)))

(assert (=> d!83791 (= (seekEntryOrOpen!0 (select (arr!16894 a!3118) j!142) a!3118 mask!3119) lt!254387)))

(declare-fun b!559721 () Bool)

(assert (=> b!559721 (= e!322464 Undefined!5343)))

(assert (= (and d!83791 c!64664) b!559721))

(assert (= (and d!83791 (not c!64664)) b!559717))

(assert (= (and b!559717 c!64663) b!559718))

(assert (= (and b!559717 (not c!64663)) b!559719))

(assert (= (and b!559719 c!64662) b!559716))

(assert (= (and b!559719 (not c!64662)) b!559720))

(declare-fun m!537555 () Bool)

(assert (=> b!559717 m!537555))

(assert (=> b!559720 m!537457))

(declare-fun m!537557 () Bool)

(assert (=> b!559720 m!537557))

(declare-fun m!537559 () Bool)

(assert (=> d!83791 m!537559))

(assert (=> d!83791 m!537457))

(assert (=> d!83791 m!537483))

(declare-fun m!537561 () Bool)

(assert (=> d!83791 m!537561))

(assert (=> d!83791 m!537477))

(declare-fun m!537563 () Bool)

(assert (=> d!83791 m!537563))

(assert (=> d!83791 m!537483))

(assert (=> d!83791 m!537457))

(declare-fun m!537565 () Bool)

(assert (=> d!83791 m!537565))

(assert (=> b!559625 d!83791))

(declare-fun b!559760 () Bool)

(declare-fun e!322490 () Bool)

(declare-fun e!322489 () Bool)

(assert (=> b!559760 (= e!322490 e!322489)))

(declare-fun c!64679 () Bool)

(assert (=> b!559760 (= c!64679 (validKeyInArray!0 (select (arr!16894 a!3118) j!142)))))

(declare-fun b!559761 () Bool)

(declare-fun e!322491 () Bool)

(declare-fun call!32447 () Bool)

(assert (=> b!559761 (= e!322491 call!32447)))

(declare-fun bm!32444 () Bool)

(assert (=> bm!32444 (= call!32447 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!559762 () Bool)

(assert (=> b!559762 (= e!322489 call!32447)))

(declare-fun b!559763 () Bool)

(assert (=> b!559763 (= e!322489 e!322491)))

(declare-fun lt!254415 () (_ BitVec 64))

(assert (=> b!559763 (= lt!254415 (select (arr!16894 a!3118) j!142))))

(declare-fun lt!254414 () Unit!17460)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35184 (_ BitVec 64) (_ BitVec 32)) Unit!17460)

(assert (=> b!559763 (= lt!254414 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!254415 j!142))))

(assert (=> b!559763 (arrayContainsKey!0 a!3118 lt!254415 #b00000000000000000000000000000000)))

(declare-fun lt!254416 () Unit!17460)

(assert (=> b!559763 (= lt!254416 lt!254414)))

(declare-fun res!351092 () Bool)

(assert (=> b!559763 (= res!351092 (= (seekEntryOrOpen!0 (select (arr!16894 a!3118) j!142) a!3118 mask!3119) (Found!5343 j!142)))))

(assert (=> b!559763 (=> (not res!351092) (not e!322491))))

(declare-fun d!83799 () Bool)

(declare-fun res!351091 () Bool)

(assert (=> d!83799 (=> res!351091 e!322490)))

(assert (=> d!83799 (= res!351091 (bvsge j!142 (size!17258 a!3118)))))

(assert (=> d!83799 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!322490)))

(assert (= (and d!83799 (not res!351091)) b!559760))

(assert (= (and b!559760 c!64679) b!559763))

(assert (= (and b!559760 (not c!64679)) b!559762))

(assert (= (and b!559763 res!351092) b!559761))

(assert (= (or b!559761 b!559762) bm!32444))

(assert (=> b!559760 m!537457))

(assert (=> b!559760 m!537457))

(assert (=> b!559760 m!537463))

(declare-fun m!537593 () Bool)

(assert (=> bm!32444 m!537593))

(assert (=> b!559763 m!537457))

(declare-fun m!537595 () Bool)

(assert (=> b!559763 m!537595))

(declare-fun m!537597 () Bool)

(assert (=> b!559763 m!537597))

(assert (=> b!559763 m!537457))

(assert (=> b!559763 m!537475))

(assert (=> b!559625 d!83799))

(declare-fun d!83805 () Bool)

(assert (=> d!83805 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!254425 () Unit!17460)

(declare-fun choose!38 (array!35184 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17460)

(assert (=> d!83805 (= lt!254425 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!83805 (validMask!0 mask!3119)))

(assert (=> d!83805 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!254425)))

(declare-fun bs!17401 () Bool)

(assert (= bs!17401 d!83805))

(assert (=> bs!17401 m!537465))

(declare-fun m!537599 () Bool)

(assert (=> bs!17401 m!537599))

(assert (=> bs!17401 m!537477))

(assert (=> b!559625 d!83805))

(declare-fun b!559824 () Bool)

(declare-fun e!322528 () SeekEntryResult!5343)

(assert (=> b!559824 (= e!322528 Undefined!5343)))

(declare-fun b!559825 () Bool)

(declare-fun e!322530 () SeekEntryResult!5343)

(assert (=> b!559825 (= e!322530 (MissingVacant!5343 (index!23601 lt!254353)))))

(declare-fun b!559826 () Bool)

(declare-fun e!322529 () SeekEntryResult!5343)

(assert (=> b!559826 (= e!322529 (Found!5343 (index!23601 lt!254353)))))

(declare-fun lt!254443 () SeekEntryResult!5343)

(declare-fun d!83807 () Bool)

(assert (=> d!83807 (and (or ((_ is Undefined!5343) lt!254443) (not ((_ is Found!5343) lt!254443)) (and (bvsge (index!23600 lt!254443) #b00000000000000000000000000000000) (bvslt (index!23600 lt!254443) (size!17258 a!3118)))) (or ((_ is Undefined!5343) lt!254443) ((_ is Found!5343) lt!254443) (not ((_ is MissingVacant!5343) lt!254443)) (not (= (index!23602 lt!254443) (index!23601 lt!254353))) (and (bvsge (index!23602 lt!254443) #b00000000000000000000000000000000) (bvslt (index!23602 lt!254443) (size!17258 a!3118)))) (or ((_ is Undefined!5343) lt!254443) (ite ((_ is Found!5343) lt!254443) (= (select (arr!16894 a!3118) (index!23600 lt!254443)) (select (arr!16894 a!3118) j!142)) (and ((_ is MissingVacant!5343) lt!254443) (= (index!23602 lt!254443) (index!23601 lt!254353)) (= (select (arr!16894 a!3118) (index!23602 lt!254443)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!83807 (= lt!254443 e!322528)))

(declare-fun c!64705 () Bool)

(assert (=> d!83807 (= c!64705 (bvsge (x!52509 lt!254353) #b01111111111111111111111111111110))))

(declare-fun lt!254444 () (_ BitVec 64))

(assert (=> d!83807 (= lt!254444 (select (arr!16894 a!3118) (index!23601 lt!254353)))))

(assert (=> d!83807 (validMask!0 mask!3119)))

(assert (=> d!83807 (= (seekKeyOrZeroReturnVacant!0 (x!52509 lt!254353) (index!23601 lt!254353) (index!23601 lt!254353) (select (arr!16894 a!3118) j!142) a!3118 mask!3119) lt!254443)))

(declare-fun b!559827 () Bool)

(declare-fun c!64704 () Bool)

(assert (=> b!559827 (= c!64704 (= lt!254444 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!559827 (= e!322529 e!322530)))

(declare-fun b!559828 () Bool)

(assert (=> b!559828 (= e!322528 e!322529)))

(declare-fun c!64706 () Bool)

(assert (=> b!559828 (= c!64706 (= lt!254444 (select (arr!16894 a!3118) j!142)))))

(declare-fun b!559829 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!559829 (= e!322530 (seekKeyOrZeroReturnVacant!0 (bvadd (x!52509 lt!254353) #b00000000000000000000000000000001) (nextIndex!0 (index!23601 lt!254353) (x!52509 lt!254353) mask!3119) (index!23601 lt!254353) (select (arr!16894 a!3118) j!142) a!3118 mask!3119))))

(assert (= (and d!83807 c!64705) b!559824))

(assert (= (and d!83807 (not c!64705)) b!559828))

(assert (= (and b!559828 c!64706) b!559826))

(assert (= (and b!559828 (not c!64706)) b!559827))

(assert (= (and b!559827 c!64704) b!559825))

(assert (= (and b!559827 (not c!64704)) b!559829))

(declare-fun m!537619 () Bool)

(assert (=> d!83807 m!537619))

(declare-fun m!537621 () Bool)

(assert (=> d!83807 m!537621))

(assert (=> d!83807 m!537467))

(assert (=> d!83807 m!537477))

(declare-fun m!537623 () Bool)

(assert (=> b!559829 m!537623))

(assert (=> b!559829 m!537623))

(assert (=> b!559829 m!537457))

(declare-fun m!537625 () Bool)

(assert (=> b!559829 m!537625))

(assert (=> b!559620 d!83807))

(declare-fun b!559840 () Bool)

(declare-fun e!322540 () Bool)

(declare-fun e!322539 () Bool)

(assert (=> b!559840 (= e!322540 e!322539)))

(declare-fun c!64709 () Bool)

(assert (=> b!559840 (= c!64709 (validKeyInArray!0 (select (arr!16894 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!559841 () Bool)

(declare-fun e!322541 () Bool)

(declare-fun call!32451 () Bool)

(assert (=> b!559841 (= e!322541 call!32451)))

(declare-fun bm!32448 () Bool)

(assert (=> bm!32448 (= call!32451 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!559842 () Bool)

(assert (=> b!559842 (= e!322539 call!32451)))

(declare-fun b!559843 () Bool)

(assert (=> b!559843 (= e!322539 e!322541)))

(declare-fun lt!254446 () (_ BitVec 64))

(assert (=> b!559843 (= lt!254446 (select (arr!16894 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!254445 () Unit!17460)

(assert (=> b!559843 (= lt!254445 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!254446 #b00000000000000000000000000000000))))

(assert (=> b!559843 (arrayContainsKey!0 a!3118 lt!254446 #b00000000000000000000000000000000)))

(declare-fun lt!254447 () Unit!17460)

(assert (=> b!559843 (= lt!254447 lt!254445)))

(declare-fun res!351112 () Bool)

(assert (=> b!559843 (= res!351112 (= (seekEntryOrOpen!0 (select (arr!16894 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5343 #b00000000000000000000000000000000)))))

(assert (=> b!559843 (=> (not res!351112) (not e!322541))))

(declare-fun d!83817 () Bool)

(declare-fun res!351111 () Bool)

(assert (=> d!83817 (=> res!351111 e!322540)))

(assert (=> d!83817 (= res!351111 (bvsge #b00000000000000000000000000000000 (size!17258 a!3118)))))

(assert (=> d!83817 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!322540)))

(assert (= (and d!83817 (not res!351111)) b!559840))

(assert (= (and b!559840 c!64709) b!559843))

(assert (= (and b!559840 (not c!64709)) b!559842))

(assert (= (and b!559843 res!351112) b!559841))

(assert (= (or b!559841 b!559842) bm!32448))

(assert (=> b!559840 m!537537))

(assert (=> b!559840 m!537537))

(assert (=> b!559840 m!537541))

(declare-fun m!537627 () Bool)

(assert (=> bm!32448 m!537627))

(assert (=> b!559843 m!537537))

(declare-fun m!537629 () Bool)

(assert (=> b!559843 m!537629))

(declare-fun m!537631 () Bool)

(assert (=> b!559843 m!537631))

(assert (=> b!559843 m!537537))

(declare-fun m!537633 () Bool)

(assert (=> b!559843 m!537633))

(assert (=> b!559630 d!83817))

(declare-fun b!559844 () Bool)

(declare-fun e!322543 () SeekEntryResult!5343)

(declare-fun lt!254449 () SeekEntryResult!5343)

(assert (=> b!559844 (= e!322543 (MissingZero!5343 (index!23601 lt!254449)))))

(declare-fun b!559845 () Bool)

(declare-fun e!322544 () SeekEntryResult!5343)

(declare-fun e!322542 () SeekEntryResult!5343)

(assert (=> b!559845 (= e!322544 e!322542)))

(declare-fun lt!254450 () (_ BitVec 64))

(assert (=> b!559845 (= lt!254450 (select (arr!16894 a!3118) (index!23601 lt!254449)))))

(declare-fun c!64711 () Bool)

(assert (=> b!559845 (= c!64711 (= lt!254450 k0!1914))))

(declare-fun b!559846 () Bool)

(assert (=> b!559846 (= e!322542 (Found!5343 (index!23601 lt!254449)))))

(declare-fun b!559847 () Bool)

(declare-fun c!64710 () Bool)

(assert (=> b!559847 (= c!64710 (= lt!254450 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!559847 (= e!322542 e!322543)))

(declare-fun b!559848 () Bool)

(assert (=> b!559848 (= e!322543 (seekKeyOrZeroReturnVacant!0 (x!52509 lt!254449) (index!23601 lt!254449) (index!23601 lt!254449) k0!1914 a!3118 mask!3119))))

(declare-fun d!83819 () Bool)

(declare-fun lt!254448 () SeekEntryResult!5343)

(assert (=> d!83819 (and (or ((_ is Undefined!5343) lt!254448) (not ((_ is Found!5343) lt!254448)) (and (bvsge (index!23600 lt!254448) #b00000000000000000000000000000000) (bvslt (index!23600 lt!254448) (size!17258 a!3118)))) (or ((_ is Undefined!5343) lt!254448) ((_ is Found!5343) lt!254448) (not ((_ is MissingZero!5343) lt!254448)) (and (bvsge (index!23599 lt!254448) #b00000000000000000000000000000000) (bvslt (index!23599 lt!254448) (size!17258 a!3118)))) (or ((_ is Undefined!5343) lt!254448) ((_ is Found!5343) lt!254448) ((_ is MissingZero!5343) lt!254448) (not ((_ is MissingVacant!5343) lt!254448)) (and (bvsge (index!23602 lt!254448) #b00000000000000000000000000000000) (bvslt (index!23602 lt!254448) (size!17258 a!3118)))) (or ((_ is Undefined!5343) lt!254448) (ite ((_ is Found!5343) lt!254448) (= (select (arr!16894 a!3118) (index!23600 lt!254448)) k0!1914) (ite ((_ is MissingZero!5343) lt!254448) (= (select (arr!16894 a!3118) (index!23599 lt!254448)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5343) lt!254448) (= (select (arr!16894 a!3118) (index!23602 lt!254448)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83819 (= lt!254448 e!322544)))

(declare-fun c!64712 () Bool)

(assert (=> d!83819 (= c!64712 (and ((_ is Intermediate!5343) lt!254449) (undefined!6155 lt!254449)))))

(assert (=> d!83819 (= lt!254449 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!83819 (validMask!0 mask!3119)))

(assert (=> d!83819 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!254448)))

(declare-fun b!559849 () Bool)

(assert (=> b!559849 (= e!322544 Undefined!5343)))

(assert (= (and d!83819 c!64712) b!559849))

(assert (= (and d!83819 (not c!64712)) b!559845))

(assert (= (and b!559845 c!64711) b!559846))

(assert (= (and b!559845 (not c!64711)) b!559847))

(assert (= (and b!559847 c!64710) b!559844))

(assert (= (and b!559847 (not c!64710)) b!559848))

(declare-fun m!537635 () Bool)

(assert (=> b!559845 m!537635))

(declare-fun m!537637 () Bool)

(assert (=> b!559848 m!537637))

(declare-fun m!537639 () Bool)

(assert (=> d!83819 m!537639))

(declare-fun m!537641 () Bool)

(assert (=> d!83819 m!537641))

(declare-fun m!537643 () Bool)

(assert (=> d!83819 m!537643))

(assert (=> d!83819 m!537477))

(declare-fun m!537645 () Bool)

(assert (=> d!83819 m!537645))

(assert (=> d!83819 m!537641))

(declare-fun m!537647 () Bool)

(assert (=> d!83819 m!537647))

(assert (=> b!559631 d!83819))

(declare-fun lt!254457 () SeekEntryResult!5343)

(declare-fun b!559879 () Bool)

(assert (=> b!559879 (and (bvsge (index!23601 lt!254457) #b00000000000000000000000000000000) (bvslt (index!23601 lt!254457) (size!17258 (array!35185 (store (arr!16894 a!3118) i!1132 k0!1914) (size!17258 a!3118)))))))

(declare-fun res!351123 () Bool)

(assert (=> b!559879 (= res!351123 (= (select (arr!16894 (array!35185 (store (arr!16894 a!3118) i!1132 k0!1914) (size!17258 a!3118))) (index!23601 lt!254457)) lt!254351))))

(declare-fun e!322566 () Bool)

(assert (=> b!559879 (=> res!351123 e!322566)))

(declare-fun e!322564 () Bool)

(assert (=> b!559879 (= e!322564 e!322566)))

(declare-fun b!559880 () Bool)

(assert (=> b!559880 (and (bvsge (index!23601 lt!254457) #b00000000000000000000000000000000) (bvslt (index!23601 lt!254457) (size!17258 (array!35185 (store (arr!16894 a!3118) i!1132 k0!1914) (size!17258 a!3118)))))))

(assert (=> b!559880 (= e!322566 (= (select (arr!16894 (array!35185 (store (arr!16894 a!3118) i!1132 k0!1914) (size!17258 a!3118))) (index!23601 lt!254457)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!559882 () Bool)

(declare-fun e!322563 () SeekEntryResult!5343)

(assert (=> b!559882 (= e!322563 (Intermediate!5343 true lt!254356 #b00000000000000000000000000000000))))

(declare-fun b!559883 () Bool)

(declare-fun e!322565 () SeekEntryResult!5343)

(assert (=> b!559883 (= e!322563 e!322565)))

(declare-fun c!64725 () Bool)

(declare-fun lt!254458 () (_ BitVec 64))

(assert (=> b!559883 (= c!64725 (or (= lt!254458 lt!254351) (= (bvadd lt!254458 lt!254458) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!559884 () Bool)

(declare-fun e!322562 () Bool)

(assert (=> b!559884 (= e!322562 e!322564)))

(declare-fun res!351122 () Bool)

(assert (=> b!559884 (= res!351122 (and ((_ is Intermediate!5343) lt!254457) (not (undefined!6155 lt!254457)) (bvslt (x!52509 lt!254457) #b01111111111111111111111111111110) (bvsge (x!52509 lt!254457) #b00000000000000000000000000000000) (bvsge (x!52509 lt!254457) #b00000000000000000000000000000000)))))

(assert (=> b!559884 (=> (not res!351122) (not e!322564))))

(declare-fun b!559885 () Bool)

(assert (=> b!559885 (and (bvsge (index!23601 lt!254457) #b00000000000000000000000000000000) (bvslt (index!23601 lt!254457) (size!17258 (array!35185 (store (arr!16894 a!3118) i!1132 k0!1914) (size!17258 a!3118)))))))

(declare-fun res!351124 () Bool)

(assert (=> b!559885 (= res!351124 (= (select (arr!16894 (array!35185 (store (arr!16894 a!3118) i!1132 k0!1914) (size!17258 a!3118))) (index!23601 lt!254457)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!559885 (=> res!351124 e!322566)))

(declare-fun b!559886 () Bool)

(assert (=> b!559886 (= e!322562 (bvsge (x!52509 lt!254457) #b01111111111111111111111111111110))))

(declare-fun b!559887 () Bool)

(assert (=> b!559887 (= e!322565 (Intermediate!5343 false lt!254356 #b00000000000000000000000000000000))))

(declare-fun d!83821 () Bool)

(assert (=> d!83821 e!322562))

(declare-fun c!64724 () Bool)

(assert (=> d!83821 (= c!64724 (and ((_ is Intermediate!5343) lt!254457) (undefined!6155 lt!254457)))))

(assert (=> d!83821 (= lt!254457 e!322563)))

(declare-fun c!64723 () Bool)

(assert (=> d!83821 (= c!64723 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!83821 (= lt!254458 (select (arr!16894 (array!35185 (store (arr!16894 a!3118) i!1132 k0!1914) (size!17258 a!3118))) lt!254356))))

(assert (=> d!83821 (validMask!0 mask!3119)))

(assert (=> d!83821 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254356 lt!254351 (array!35185 (store (arr!16894 a!3118) i!1132 k0!1914) (size!17258 a!3118)) mask!3119) lt!254457)))

(declare-fun b!559881 () Bool)

(assert (=> b!559881 (= e!322565 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!254356 #b00000000000000000000000000000000 mask!3119) lt!254351 (array!35185 (store (arr!16894 a!3118) i!1132 k0!1914) (size!17258 a!3118)) mask!3119))))

(assert (= (and d!83821 c!64723) b!559882))

(assert (= (and d!83821 (not c!64723)) b!559883))

(assert (= (and b!559883 c!64725) b!559887))

(assert (= (and b!559883 (not c!64725)) b!559881))

(assert (= (and d!83821 c!64724) b!559886))

(assert (= (and d!83821 (not c!64724)) b!559884))

(assert (= (and b!559884 res!351122) b!559879))

(assert (= (and b!559879 (not res!351123)) b!559885))

(assert (= (and b!559885 (not res!351124)) b!559880))

(declare-fun m!537661 () Bool)

(assert (=> b!559879 m!537661))

(assert (=> b!559885 m!537661))

(declare-fun m!537663 () Bool)

(assert (=> d!83821 m!537663))

(assert (=> d!83821 m!537477))

(declare-fun m!537665 () Bool)

(assert (=> b!559881 m!537665))

(assert (=> b!559881 m!537665))

(declare-fun m!537667 () Bool)

(assert (=> b!559881 m!537667))

(assert (=> b!559880 m!537661))

(assert (=> b!559626 d!83821))

(declare-fun b!559888 () Bool)

(declare-fun lt!254459 () SeekEntryResult!5343)

(assert (=> b!559888 (and (bvsge (index!23601 lt!254459) #b00000000000000000000000000000000) (bvslt (index!23601 lt!254459) (size!17258 a!3118)))))

(declare-fun res!351126 () Bool)

(assert (=> b!559888 (= res!351126 (= (select (arr!16894 a!3118) (index!23601 lt!254459)) (select (arr!16894 a!3118) j!142)))))

(declare-fun e!322571 () Bool)

(assert (=> b!559888 (=> res!351126 e!322571)))

(declare-fun e!322569 () Bool)

(assert (=> b!559888 (= e!322569 e!322571)))

(declare-fun b!559889 () Bool)

(assert (=> b!559889 (and (bvsge (index!23601 lt!254459) #b00000000000000000000000000000000) (bvslt (index!23601 lt!254459) (size!17258 a!3118)))))

(assert (=> b!559889 (= e!322571 (= (select (arr!16894 a!3118) (index!23601 lt!254459)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!559891 () Bool)

(declare-fun e!322568 () SeekEntryResult!5343)

(assert (=> b!559891 (= e!322568 (Intermediate!5343 true lt!254352 #b00000000000000000000000000000000))))

(declare-fun b!559892 () Bool)

(declare-fun e!322570 () SeekEntryResult!5343)

(assert (=> b!559892 (= e!322568 e!322570)))

(declare-fun c!64728 () Bool)

(declare-fun lt!254460 () (_ BitVec 64))

(assert (=> b!559892 (= c!64728 (or (= lt!254460 (select (arr!16894 a!3118) j!142)) (= (bvadd lt!254460 lt!254460) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!559893 () Bool)

(declare-fun e!322567 () Bool)

(assert (=> b!559893 (= e!322567 e!322569)))

(declare-fun res!351125 () Bool)

(assert (=> b!559893 (= res!351125 (and ((_ is Intermediate!5343) lt!254459) (not (undefined!6155 lt!254459)) (bvslt (x!52509 lt!254459) #b01111111111111111111111111111110) (bvsge (x!52509 lt!254459) #b00000000000000000000000000000000) (bvsge (x!52509 lt!254459) #b00000000000000000000000000000000)))))

(assert (=> b!559893 (=> (not res!351125) (not e!322569))))

(declare-fun b!559894 () Bool)

(assert (=> b!559894 (and (bvsge (index!23601 lt!254459) #b00000000000000000000000000000000) (bvslt (index!23601 lt!254459) (size!17258 a!3118)))))

(declare-fun res!351127 () Bool)

(assert (=> b!559894 (= res!351127 (= (select (arr!16894 a!3118) (index!23601 lt!254459)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!559894 (=> res!351127 e!322571)))

(declare-fun b!559895 () Bool)

(assert (=> b!559895 (= e!322567 (bvsge (x!52509 lt!254459) #b01111111111111111111111111111110))))

(declare-fun b!559896 () Bool)

(assert (=> b!559896 (= e!322570 (Intermediate!5343 false lt!254352 #b00000000000000000000000000000000))))

(declare-fun d!83839 () Bool)

(assert (=> d!83839 e!322567))

(declare-fun c!64727 () Bool)

(assert (=> d!83839 (= c!64727 (and ((_ is Intermediate!5343) lt!254459) (undefined!6155 lt!254459)))))

(assert (=> d!83839 (= lt!254459 e!322568)))

(declare-fun c!64726 () Bool)

(assert (=> d!83839 (= c!64726 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!83839 (= lt!254460 (select (arr!16894 a!3118) lt!254352))))

(assert (=> d!83839 (validMask!0 mask!3119)))

(assert (=> d!83839 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254352 (select (arr!16894 a!3118) j!142) a!3118 mask!3119) lt!254459)))

(declare-fun b!559890 () Bool)

(assert (=> b!559890 (= e!322570 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!254352 #b00000000000000000000000000000000 mask!3119) (select (arr!16894 a!3118) j!142) a!3118 mask!3119))))

(assert (= (and d!83839 c!64726) b!559891))

(assert (= (and d!83839 (not c!64726)) b!559892))

(assert (= (and b!559892 c!64728) b!559896))

(assert (= (and b!559892 (not c!64728)) b!559890))

(assert (= (and d!83839 c!64727) b!559895))

(assert (= (and d!83839 (not c!64727)) b!559893))

(assert (= (and b!559893 res!351125) b!559888))

(assert (= (and b!559888 (not res!351126)) b!559894))

(assert (= (and b!559894 (not res!351127)) b!559889))

(declare-fun m!537669 () Bool)

(assert (=> b!559888 m!537669))

(assert (=> b!559894 m!537669))

(declare-fun m!537671 () Bool)

(assert (=> d!83839 m!537671))

(assert (=> d!83839 m!537477))

(declare-fun m!537673 () Bool)

(assert (=> b!559890 m!537673))

(assert (=> b!559890 m!537673))

(assert (=> b!559890 m!537457))

(declare-fun m!537675 () Bool)

(assert (=> b!559890 m!537675))

(assert (=> b!559889 m!537669))

(assert (=> b!559626 d!83839))

(declare-fun d!83841 () Bool)

(declare-fun lt!254466 () (_ BitVec 32))

(declare-fun lt!254465 () (_ BitVec 32))

(assert (=> d!83841 (= lt!254466 (bvmul (bvxor lt!254465 (bvlshr lt!254465 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83841 (= lt!254465 ((_ extract 31 0) (bvand (bvxor lt!254351 (bvlshr lt!254351 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83841 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!351128 (let ((h!11972 ((_ extract 31 0) (bvand (bvxor lt!254351 (bvlshr lt!254351 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52515 (bvmul (bvxor h!11972 (bvlshr h!11972 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52515 (bvlshr x!52515 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!351128 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!351128 #b00000000000000000000000000000000))))))

(assert (=> d!83841 (= (toIndex!0 lt!254351 mask!3119) (bvand (bvxor lt!254466 (bvlshr lt!254466 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!559626 d!83841))

(declare-fun d!83843 () Bool)

(declare-fun lt!254472 () (_ BitVec 32))

(declare-fun lt!254471 () (_ BitVec 32))

(assert (=> d!83843 (= lt!254472 (bvmul (bvxor lt!254471 (bvlshr lt!254471 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83843 (= lt!254471 ((_ extract 31 0) (bvand (bvxor (select (arr!16894 a!3118) j!142) (bvlshr (select (arr!16894 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83843 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!351128 (let ((h!11972 ((_ extract 31 0) (bvand (bvxor (select (arr!16894 a!3118) j!142) (bvlshr (select (arr!16894 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52515 (bvmul (bvxor h!11972 (bvlshr h!11972 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52515 (bvlshr x!52515 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!351128 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!351128 #b00000000000000000000000000000000))))))

(assert (=> d!83843 (= (toIndex!0 (select (arr!16894 a!3118) j!142) mask!3119) (bvand (bvxor lt!254472 (bvlshr lt!254472 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!559626 d!83843))

(check-sat (not d!83805) (not b!559840) (not bm!32444) (not b!559881) (not b!559688) (not b!559829) (not d!83839) (not b!559843) (not b!559760) (not d!83807) (not b!559848) (not b!559720) (not d!83791) (not bm!32435) (not b!559673) (not b!559684) (not bm!32448) (not d!83819) (not d!83821) (not b!559686) (not b!559763) (not b!559890))
(check-sat)
