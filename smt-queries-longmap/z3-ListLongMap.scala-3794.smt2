; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52060 () Bool)

(assert start!52060)

(declare-fun b!568488 () Bool)

(declare-fun res!358695 () Bool)

(declare-fun e!327100 () Bool)

(assert (=> b!568488 (=> (not res!358695) (not e!327100))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!568488 (= res!358695 (validKeyInArray!0 k0!1914))))

(declare-fun res!358697 () Bool)

(assert (=> start!52060 (=> (not res!358697) (not e!327100))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52060 (= res!358697 (validMask!0 mask!3119))))

(assert (=> start!52060 e!327100))

(assert (=> start!52060 true))

(declare-datatypes ((array!35640 0))(
  ( (array!35641 (arr!17113 (Array (_ BitVec 32) (_ BitVec 64))) (size!17477 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35640)

(declare-fun array_inv!12909 (array!35640) Bool)

(assert (=> start!52060 (array_inv!12909 a!3118)))

(declare-fun b!568489 () Bool)

(declare-fun res!358691 () Bool)

(assert (=> b!568489 (=> (not res!358691) (not e!327100))))

(declare-fun arrayContainsKey!0 (array!35640 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!568489 (= res!358691 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!568490 () Bool)

(declare-fun e!327102 () Bool)

(declare-fun e!327101 () Bool)

(assert (=> b!568490 (= e!327102 e!327101)))

(declare-fun res!358692 () Bool)

(assert (=> b!568490 (=> (not res!358692) (not e!327101))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5562 0))(
  ( (MissingZero!5562 (index!24475 (_ BitVec 32))) (Found!5562 (index!24476 (_ BitVec 32))) (Intermediate!5562 (undefined!6374 Bool) (index!24477 (_ BitVec 32)) (x!53351 (_ BitVec 32))) (Undefined!5562) (MissingVacant!5562 (index!24478 (_ BitVec 32))) )
))
(declare-fun lt!258977 () SeekEntryResult!5562)

(declare-fun lt!258978 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35640 (_ BitVec 32)) SeekEntryResult!5562)

(assert (=> b!568490 (= res!358692 (= lt!258977 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258978 (select (store (arr!17113 a!3118) i!1132 k0!1914) j!142) (array!35641 (store (arr!17113 a!3118) i!1132 k0!1914) (size!17477 a!3118)) mask!3119)))))

(declare-fun lt!258975 () (_ BitVec 32))

(assert (=> b!568490 (= lt!258977 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258975 (select (arr!17113 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!568490 (= lt!258978 (toIndex!0 (select (store (arr!17113 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!568490 (= lt!258975 (toIndex!0 (select (arr!17113 a!3118) j!142) mask!3119))))

(declare-fun b!568491 () Bool)

(declare-fun res!358690 () Bool)

(assert (=> b!568491 (=> (not res!358690) (not e!327100))))

(assert (=> b!568491 (= res!358690 (and (= (size!17477 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17477 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17477 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!568492 () Bool)

(declare-fun res!358694 () Bool)

(assert (=> b!568492 (=> (not res!358694) (not e!327102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35640 (_ BitVec 32)) Bool)

(assert (=> b!568492 (= res!358694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!568493 () Bool)

(declare-fun res!358689 () Bool)

(assert (=> b!568493 (=> (not res!358689) (not e!327100))))

(assert (=> b!568493 (= res!358689 (validKeyInArray!0 (select (arr!17113 a!3118) j!142)))))

(declare-fun lt!258976 () SeekEntryResult!5562)

(declare-fun b!568494 () Bool)

(get-info :version)

(assert (=> b!568494 (= e!327101 (not (or (not ((_ is Intermediate!5562) lt!258977)) (undefined!6374 lt!258977) (= (select (arr!17113 a!3118) (index!24477 lt!258977)) (select (arr!17113 a!3118) j!142)) (not (= (select (arr!17113 a!3118) (index!24477 lt!258977)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!258976 (MissingZero!5562 (index!24477 lt!258977))))))))

(assert (=> b!568494 (= lt!258976 (Found!5562 j!142))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35640 (_ BitVec 32)) SeekEntryResult!5562)

(assert (=> b!568494 (= lt!258976 (seekEntryOrOpen!0 (select (arr!17113 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!568494 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17826 0))(
  ( (Unit!17827) )
))
(declare-fun lt!258979 () Unit!17826)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35640 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17826)

(assert (=> b!568494 (= lt!258979 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!568495 () Bool)

(assert (=> b!568495 (= e!327100 e!327102)))

(declare-fun res!358693 () Bool)

(assert (=> b!568495 (=> (not res!358693) (not e!327102))))

(declare-fun lt!258974 () SeekEntryResult!5562)

(assert (=> b!568495 (= res!358693 (or (= lt!258974 (MissingZero!5562 i!1132)) (= lt!258974 (MissingVacant!5562 i!1132))))))

(assert (=> b!568495 (= lt!258974 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!568496 () Bool)

(declare-fun res!358696 () Bool)

(assert (=> b!568496 (=> (not res!358696) (not e!327102))))

(declare-datatypes ((List!11193 0))(
  ( (Nil!11190) (Cons!11189 (h!12207 (_ BitVec 64)) (t!17421 List!11193)) )
))
(declare-fun arrayNoDuplicates!0 (array!35640 (_ BitVec 32) List!11193) Bool)

(assert (=> b!568496 (= res!358696 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11190))))

(assert (= (and start!52060 res!358697) b!568491))

(assert (= (and b!568491 res!358690) b!568493))

(assert (= (and b!568493 res!358689) b!568488))

(assert (= (and b!568488 res!358695) b!568489))

(assert (= (and b!568489 res!358691) b!568495))

(assert (= (and b!568495 res!358693) b!568492))

(assert (= (and b!568492 res!358694) b!568496))

(assert (= (and b!568496 res!358696) b!568490))

(assert (= (and b!568490 res!358692) b!568494))

(declare-fun m!547037 () Bool)

(assert (=> b!568494 m!547037))

(declare-fun m!547039 () Bool)

(assert (=> b!568494 m!547039))

(declare-fun m!547041 () Bool)

(assert (=> b!568494 m!547041))

(declare-fun m!547043 () Bool)

(assert (=> b!568494 m!547043))

(assert (=> b!568494 m!547039))

(declare-fun m!547045 () Bool)

(assert (=> b!568494 m!547045))

(declare-fun m!547047 () Bool)

(assert (=> b!568488 m!547047))

(declare-fun m!547049 () Bool)

(assert (=> b!568490 m!547049))

(declare-fun m!547051 () Bool)

(assert (=> b!568490 m!547051))

(assert (=> b!568490 m!547039))

(declare-fun m!547053 () Bool)

(assert (=> b!568490 m!547053))

(assert (=> b!568490 m!547039))

(assert (=> b!568490 m!547049))

(assert (=> b!568490 m!547039))

(declare-fun m!547055 () Bool)

(assert (=> b!568490 m!547055))

(declare-fun m!547057 () Bool)

(assert (=> b!568490 m!547057))

(assert (=> b!568490 m!547049))

(declare-fun m!547059 () Bool)

(assert (=> b!568490 m!547059))

(declare-fun m!547061 () Bool)

(assert (=> start!52060 m!547061))

(declare-fun m!547063 () Bool)

(assert (=> start!52060 m!547063))

(declare-fun m!547065 () Bool)

(assert (=> b!568492 m!547065))

(assert (=> b!568493 m!547039))

(assert (=> b!568493 m!547039))

(declare-fun m!547067 () Bool)

(assert (=> b!568493 m!547067))

(declare-fun m!547069 () Bool)

(assert (=> b!568496 m!547069))

(declare-fun m!547071 () Bool)

(assert (=> b!568495 m!547071))

(declare-fun m!547073 () Bool)

(assert (=> b!568489 m!547073))

(check-sat (not b!568496) (not b!568492) (not b!568488) (not b!568490) (not b!568489) (not b!568494) (not b!568493) (not b!568495) (not start!52060))
(check-sat)
(get-model)

(declare-fun d!84483 () Bool)

(assert (=> d!84483 (= (validKeyInArray!0 (select (arr!17113 a!3118) j!142)) (and (not (= (select (arr!17113 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17113 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!568493 d!84483))

(declare-fun b!568532 () Bool)

(declare-fun e!327121 () Bool)

(declare-fun call!32564 () Bool)

(assert (=> b!568532 (= e!327121 call!32564)))

(declare-fun bm!32561 () Bool)

(assert (=> bm!32561 (= call!32564 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun d!84485 () Bool)

(declare-fun res!358729 () Bool)

(declare-fun e!327123 () Bool)

(assert (=> d!84485 (=> res!358729 e!327123)))

(assert (=> d!84485 (= res!358729 (bvsge #b00000000000000000000000000000000 (size!17477 a!3118)))))

(assert (=> d!84485 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!327123)))

(declare-fun b!568533 () Bool)

(declare-fun e!327122 () Bool)

(assert (=> b!568533 (= e!327121 e!327122)))

(declare-fun lt!259006 () (_ BitVec 64))

(assert (=> b!568533 (= lt!259006 (select (arr!17113 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!259005 () Unit!17826)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35640 (_ BitVec 64) (_ BitVec 32)) Unit!17826)

(assert (=> b!568533 (= lt!259005 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!259006 #b00000000000000000000000000000000))))

(assert (=> b!568533 (arrayContainsKey!0 a!3118 lt!259006 #b00000000000000000000000000000000)))

(declare-fun lt!259004 () Unit!17826)

(assert (=> b!568533 (= lt!259004 lt!259005)))

(declare-fun res!358730 () Bool)

(assert (=> b!568533 (= res!358730 (= (seekEntryOrOpen!0 (select (arr!17113 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5562 #b00000000000000000000000000000000)))))

(assert (=> b!568533 (=> (not res!358730) (not e!327122))))

(declare-fun b!568534 () Bool)

(assert (=> b!568534 (= e!327122 call!32564)))

(declare-fun b!568535 () Bool)

(assert (=> b!568535 (= e!327123 e!327121)))

(declare-fun c!65255 () Bool)

(assert (=> b!568535 (= c!65255 (validKeyInArray!0 (select (arr!17113 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!84485 (not res!358729)) b!568535))

(assert (= (and b!568535 c!65255) b!568533))

(assert (= (and b!568535 (not c!65255)) b!568532))

(assert (= (and b!568533 res!358730) b!568534))

(assert (= (or b!568534 b!568532) bm!32561))

(declare-fun m!547113 () Bool)

(assert (=> bm!32561 m!547113))

(declare-fun m!547115 () Bool)

(assert (=> b!568533 m!547115))

(declare-fun m!547117 () Bool)

(assert (=> b!568533 m!547117))

(declare-fun m!547119 () Bool)

(assert (=> b!568533 m!547119))

(assert (=> b!568533 m!547115))

(declare-fun m!547121 () Bool)

(assert (=> b!568533 m!547121))

(assert (=> b!568535 m!547115))

(assert (=> b!568535 m!547115))

(declare-fun m!547123 () Bool)

(assert (=> b!568535 m!547123))

(assert (=> b!568492 d!84485))

(declare-fun d!84487 () Bool)

(assert (=> d!84487 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52060 d!84487))

(declare-fun d!84495 () Bool)

(assert (=> d!84495 (= (array_inv!12909 a!3118) (bvsge (size!17477 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52060 d!84495))

(declare-fun d!84497 () Bool)

(declare-fun res!358752 () Bool)

(declare-fun e!327153 () Bool)

(assert (=> d!84497 (=> res!358752 e!327153)))

(assert (=> d!84497 (= res!358752 (bvsge #b00000000000000000000000000000000 (size!17477 a!3118)))))

(assert (=> d!84497 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11190) e!327153)))

(declare-fun b!568567 () Bool)

(declare-fun e!327152 () Bool)

(declare-fun contains!2877 (List!11193 (_ BitVec 64)) Bool)

(assert (=> b!568567 (= e!327152 (contains!2877 Nil!11190 (select (arr!17113 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!568568 () Bool)

(declare-fun e!327150 () Bool)

(declare-fun call!32570 () Bool)

(assert (=> b!568568 (= e!327150 call!32570)))

(declare-fun b!568569 () Bool)

(declare-fun e!327151 () Bool)

(assert (=> b!568569 (= e!327151 e!327150)))

(declare-fun c!65261 () Bool)

(assert (=> b!568569 (= c!65261 (validKeyInArray!0 (select (arr!17113 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!568570 () Bool)

(assert (=> b!568570 (= e!327150 call!32570)))

(declare-fun b!568571 () Bool)

(assert (=> b!568571 (= e!327153 e!327151)))

(declare-fun res!358753 () Bool)

(assert (=> b!568571 (=> (not res!358753) (not e!327151))))

(assert (=> b!568571 (= res!358753 (not e!327152))))

(declare-fun res!358754 () Bool)

(assert (=> b!568571 (=> (not res!358754) (not e!327152))))

(assert (=> b!568571 (= res!358754 (validKeyInArray!0 (select (arr!17113 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32567 () Bool)

(assert (=> bm!32567 (= call!32570 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!65261 (Cons!11189 (select (arr!17113 a!3118) #b00000000000000000000000000000000) Nil!11190) Nil!11190)))))

(assert (= (and d!84497 (not res!358752)) b!568571))

(assert (= (and b!568571 res!358754) b!568567))

(assert (= (and b!568571 res!358753) b!568569))

(assert (= (and b!568569 c!65261) b!568570))

(assert (= (and b!568569 (not c!65261)) b!568568))

(assert (= (or b!568570 b!568568) bm!32567))

(assert (=> b!568567 m!547115))

(assert (=> b!568567 m!547115))

(declare-fun m!547135 () Bool)

(assert (=> b!568567 m!547135))

(assert (=> b!568569 m!547115))

(assert (=> b!568569 m!547115))

(assert (=> b!568569 m!547123))

(assert (=> b!568571 m!547115))

(assert (=> b!568571 m!547115))

(assert (=> b!568571 m!547123))

(assert (=> bm!32567 m!547115))

(declare-fun m!547137 () Bool)

(assert (=> bm!32567 m!547137))

(assert (=> b!568496 d!84497))

(declare-fun b!568650 () Bool)

(declare-fun e!327202 () SeekEntryResult!5562)

(assert (=> b!568650 (= e!327202 (Intermediate!5562 false lt!258978 #b00000000000000000000000000000000))))

(declare-fun b!568651 () Bool)

(declare-fun e!327199 () SeekEntryResult!5562)

(assert (=> b!568651 (= e!327199 (Intermediate!5562 true lt!258978 #b00000000000000000000000000000000))))

(declare-fun b!568652 () Bool)

(declare-fun lt!259034 () SeekEntryResult!5562)

(assert (=> b!568652 (and (bvsge (index!24477 lt!259034) #b00000000000000000000000000000000) (bvslt (index!24477 lt!259034) (size!17477 (array!35641 (store (arr!17113 a!3118) i!1132 k0!1914) (size!17477 a!3118)))))))

(declare-fun res!358782 () Bool)

(assert (=> b!568652 (= res!358782 (= (select (arr!17113 (array!35641 (store (arr!17113 a!3118) i!1132 k0!1914) (size!17477 a!3118))) (index!24477 lt!259034)) (select (store (arr!17113 a!3118) i!1132 k0!1914) j!142)))))

(declare-fun e!327203 () Bool)

(assert (=> b!568652 (=> res!358782 e!327203)))

(declare-fun e!327200 () Bool)

(assert (=> b!568652 (= e!327200 e!327203)))

(declare-fun b!568653 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!568653 (= e!327202 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258978 #b00000000000000000000000000000000 mask!3119) (select (store (arr!17113 a!3118) i!1132 k0!1914) j!142) (array!35641 (store (arr!17113 a!3118) i!1132 k0!1914) (size!17477 a!3118)) mask!3119))))

(declare-fun b!568654 () Bool)

(assert (=> b!568654 (and (bvsge (index!24477 lt!259034) #b00000000000000000000000000000000) (bvslt (index!24477 lt!259034) (size!17477 (array!35641 (store (arr!17113 a!3118) i!1132 k0!1914) (size!17477 a!3118)))))))

(declare-fun res!358780 () Bool)

(assert (=> b!568654 (= res!358780 (= (select (arr!17113 (array!35641 (store (arr!17113 a!3118) i!1132 k0!1914) (size!17477 a!3118))) (index!24477 lt!259034)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!568654 (=> res!358780 e!327203)))

(declare-fun b!568655 () Bool)

(assert (=> b!568655 (= e!327199 e!327202)))

(declare-fun c!65291 () Bool)

(declare-fun lt!259035 () (_ BitVec 64))

(assert (=> b!568655 (= c!65291 (or (= lt!259035 (select (store (arr!17113 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!259035 lt!259035) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!84503 () Bool)

(declare-fun e!327201 () Bool)

(assert (=> d!84503 e!327201))

(declare-fun c!65290 () Bool)

(assert (=> d!84503 (= c!65290 (and ((_ is Intermediate!5562) lt!259034) (undefined!6374 lt!259034)))))

(assert (=> d!84503 (= lt!259034 e!327199)))

(declare-fun c!65289 () Bool)

(assert (=> d!84503 (= c!65289 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84503 (= lt!259035 (select (arr!17113 (array!35641 (store (arr!17113 a!3118) i!1132 k0!1914) (size!17477 a!3118))) lt!258978))))

(assert (=> d!84503 (validMask!0 mask!3119)))

(assert (=> d!84503 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258978 (select (store (arr!17113 a!3118) i!1132 k0!1914) j!142) (array!35641 (store (arr!17113 a!3118) i!1132 k0!1914) (size!17477 a!3118)) mask!3119) lt!259034)))

(declare-fun b!568656 () Bool)

(assert (=> b!568656 (= e!327201 e!327200)))

(declare-fun res!358781 () Bool)

(assert (=> b!568656 (= res!358781 (and ((_ is Intermediate!5562) lt!259034) (not (undefined!6374 lt!259034)) (bvslt (x!53351 lt!259034) #b01111111111111111111111111111110) (bvsge (x!53351 lt!259034) #b00000000000000000000000000000000) (bvsge (x!53351 lt!259034) #b00000000000000000000000000000000)))))

(assert (=> b!568656 (=> (not res!358781) (not e!327200))))

(declare-fun b!568657 () Bool)

(assert (=> b!568657 (and (bvsge (index!24477 lt!259034) #b00000000000000000000000000000000) (bvslt (index!24477 lt!259034) (size!17477 (array!35641 (store (arr!17113 a!3118) i!1132 k0!1914) (size!17477 a!3118)))))))

(assert (=> b!568657 (= e!327203 (= (select (arr!17113 (array!35641 (store (arr!17113 a!3118) i!1132 k0!1914) (size!17477 a!3118))) (index!24477 lt!259034)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!568658 () Bool)

(assert (=> b!568658 (= e!327201 (bvsge (x!53351 lt!259034) #b01111111111111111111111111111110))))

(assert (= (and d!84503 c!65289) b!568651))

(assert (= (and d!84503 (not c!65289)) b!568655))

(assert (= (and b!568655 c!65291) b!568650))

(assert (= (and b!568655 (not c!65291)) b!568653))

(assert (= (and d!84503 c!65290) b!568658))

(assert (= (and d!84503 (not c!65290)) b!568656))

(assert (= (and b!568656 res!358781) b!568652))

(assert (= (and b!568652 (not res!358782)) b!568654))

(assert (= (and b!568654 (not res!358780)) b!568657))

(declare-fun m!547163 () Bool)

(assert (=> b!568657 m!547163))

(assert (=> b!568654 m!547163))

(declare-fun m!547165 () Bool)

(assert (=> d!84503 m!547165))

(assert (=> d!84503 m!547061))

(assert (=> b!568652 m!547163))

(declare-fun m!547167 () Bool)

(assert (=> b!568653 m!547167))

(assert (=> b!568653 m!547167))

(assert (=> b!568653 m!547049))

(declare-fun m!547169 () Bool)

(assert (=> b!568653 m!547169))

(assert (=> b!568490 d!84503))

(declare-fun b!568659 () Bool)

(declare-fun e!327207 () SeekEntryResult!5562)

(assert (=> b!568659 (= e!327207 (Intermediate!5562 false lt!258975 #b00000000000000000000000000000000))))

(declare-fun b!568660 () Bool)

(declare-fun e!327204 () SeekEntryResult!5562)

(assert (=> b!568660 (= e!327204 (Intermediate!5562 true lt!258975 #b00000000000000000000000000000000))))

(declare-fun b!568661 () Bool)

(declare-fun lt!259036 () SeekEntryResult!5562)

(assert (=> b!568661 (and (bvsge (index!24477 lt!259036) #b00000000000000000000000000000000) (bvslt (index!24477 lt!259036) (size!17477 a!3118)))))

(declare-fun res!358785 () Bool)

(assert (=> b!568661 (= res!358785 (= (select (arr!17113 a!3118) (index!24477 lt!259036)) (select (arr!17113 a!3118) j!142)))))

(declare-fun e!327208 () Bool)

(assert (=> b!568661 (=> res!358785 e!327208)))

(declare-fun e!327205 () Bool)

(assert (=> b!568661 (= e!327205 e!327208)))

(declare-fun b!568662 () Bool)

(assert (=> b!568662 (= e!327207 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258975 #b00000000000000000000000000000000 mask!3119) (select (arr!17113 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!568663 () Bool)

(assert (=> b!568663 (and (bvsge (index!24477 lt!259036) #b00000000000000000000000000000000) (bvslt (index!24477 lt!259036) (size!17477 a!3118)))))

(declare-fun res!358783 () Bool)

(assert (=> b!568663 (= res!358783 (= (select (arr!17113 a!3118) (index!24477 lt!259036)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!568663 (=> res!358783 e!327208)))

(declare-fun b!568664 () Bool)

(assert (=> b!568664 (= e!327204 e!327207)))

(declare-fun lt!259037 () (_ BitVec 64))

(declare-fun c!65294 () Bool)

(assert (=> b!568664 (= c!65294 (or (= lt!259037 (select (arr!17113 a!3118) j!142)) (= (bvadd lt!259037 lt!259037) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!84511 () Bool)

(declare-fun e!327206 () Bool)

(assert (=> d!84511 e!327206))

(declare-fun c!65293 () Bool)

(assert (=> d!84511 (= c!65293 (and ((_ is Intermediate!5562) lt!259036) (undefined!6374 lt!259036)))))

(assert (=> d!84511 (= lt!259036 e!327204)))

(declare-fun c!65292 () Bool)

(assert (=> d!84511 (= c!65292 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84511 (= lt!259037 (select (arr!17113 a!3118) lt!258975))))

(assert (=> d!84511 (validMask!0 mask!3119)))

(assert (=> d!84511 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258975 (select (arr!17113 a!3118) j!142) a!3118 mask!3119) lt!259036)))

(declare-fun b!568665 () Bool)

(assert (=> b!568665 (= e!327206 e!327205)))

(declare-fun res!358784 () Bool)

(assert (=> b!568665 (= res!358784 (and ((_ is Intermediate!5562) lt!259036) (not (undefined!6374 lt!259036)) (bvslt (x!53351 lt!259036) #b01111111111111111111111111111110) (bvsge (x!53351 lt!259036) #b00000000000000000000000000000000) (bvsge (x!53351 lt!259036) #b00000000000000000000000000000000)))))

(assert (=> b!568665 (=> (not res!358784) (not e!327205))))

(declare-fun b!568666 () Bool)

(assert (=> b!568666 (and (bvsge (index!24477 lt!259036) #b00000000000000000000000000000000) (bvslt (index!24477 lt!259036) (size!17477 a!3118)))))

(assert (=> b!568666 (= e!327208 (= (select (arr!17113 a!3118) (index!24477 lt!259036)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!568667 () Bool)

(assert (=> b!568667 (= e!327206 (bvsge (x!53351 lt!259036) #b01111111111111111111111111111110))))

(assert (= (and d!84511 c!65292) b!568660))

(assert (= (and d!84511 (not c!65292)) b!568664))

(assert (= (and b!568664 c!65294) b!568659))

(assert (= (and b!568664 (not c!65294)) b!568662))

(assert (= (and d!84511 c!65293) b!568667))

(assert (= (and d!84511 (not c!65293)) b!568665))

(assert (= (and b!568665 res!358784) b!568661))

(assert (= (and b!568661 (not res!358785)) b!568663))

(assert (= (and b!568663 (not res!358783)) b!568666))

(declare-fun m!547171 () Bool)

(assert (=> b!568666 m!547171))

(assert (=> b!568663 m!547171))

(declare-fun m!547173 () Bool)

(assert (=> d!84511 m!547173))

(assert (=> d!84511 m!547061))

(assert (=> b!568661 m!547171))

(declare-fun m!547175 () Bool)

(assert (=> b!568662 m!547175))

(assert (=> b!568662 m!547175))

(assert (=> b!568662 m!547039))

(declare-fun m!547177 () Bool)

(assert (=> b!568662 m!547177))

(assert (=> b!568490 d!84511))

(declare-fun d!84513 () Bool)

(declare-fun lt!259057 () (_ BitVec 32))

(declare-fun lt!259056 () (_ BitVec 32))

(assert (=> d!84513 (= lt!259057 (bvmul (bvxor lt!259056 (bvlshr lt!259056 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84513 (= lt!259056 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17113 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!17113 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84513 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!358786 (let ((h!12210 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17113 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!17113 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53356 (bvmul (bvxor h!12210 (bvlshr h!12210 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53356 (bvlshr x!53356 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!358786 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!358786 #b00000000000000000000000000000000))))))

(assert (=> d!84513 (= (toIndex!0 (select (store (arr!17113 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!259057 (bvlshr lt!259057 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!568490 d!84513))

(declare-fun d!84523 () Bool)

(declare-fun lt!259059 () (_ BitVec 32))

(declare-fun lt!259058 () (_ BitVec 32))

(assert (=> d!84523 (= lt!259059 (bvmul (bvxor lt!259058 (bvlshr lt!259058 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84523 (= lt!259058 ((_ extract 31 0) (bvand (bvxor (select (arr!17113 a!3118) j!142) (bvlshr (select (arr!17113 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84523 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!358786 (let ((h!12210 ((_ extract 31 0) (bvand (bvxor (select (arr!17113 a!3118) j!142) (bvlshr (select (arr!17113 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53356 (bvmul (bvxor h!12210 (bvlshr h!12210 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53356 (bvlshr x!53356 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!358786 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!358786 #b00000000000000000000000000000000))))))

(assert (=> d!84523 (= (toIndex!0 (select (arr!17113 a!3118) j!142) mask!3119) (bvand (bvxor lt!259059 (bvlshr lt!259059 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!568490 d!84523))

(declare-fun b!568726 () Bool)

(declare-fun e!327242 () SeekEntryResult!5562)

(declare-fun lt!259082 () SeekEntryResult!5562)

(assert (=> b!568726 (= e!327242 (MissingZero!5562 (index!24477 lt!259082)))))

(declare-fun b!568727 () Bool)

(declare-fun e!327241 () SeekEntryResult!5562)

(assert (=> b!568727 (= e!327241 Undefined!5562)))

(declare-fun b!568728 () Bool)

(declare-fun e!327240 () SeekEntryResult!5562)

(assert (=> b!568728 (= e!327241 e!327240)))

(declare-fun lt!259083 () (_ BitVec 64))

(assert (=> b!568728 (= lt!259083 (select (arr!17113 a!3118) (index!24477 lt!259082)))))

(declare-fun c!65322 () Bool)

(assert (=> b!568728 (= c!65322 (= lt!259083 k0!1914))))

(declare-fun b!568729 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35640 (_ BitVec 32)) SeekEntryResult!5562)

(assert (=> b!568729 (= e!327242 (seekKeyOrZeroReturnVacant!0 (x!53351 lt!259082) (index!24477 lt!259082) (index!24477 lt!259082) k0!1914 a!3118 mask!3119))))

(declare-fun d!84525 () Bool)

(declare-fun lt!259084 () SeekEntryResult!5562)

(assert (=> d!84525 (and (or ((_ is Undefined!5562) lt!259084) (not ((_ is Found!5562) lt!259084)) (and (bvsge (index!24476 lt!259084) #b00000000000000000000000000000000) (bvslt (index!24476 lt!259084) (size!17477 a!3118)))) (or ((_ is Undefined!5562) lt!259084) ((_ is Found!5562) lt!259084) (not ((_ is MissingZero!5562) lt!259084)) (and (bvsge (index!24475 lt!259084) #b00000000000000000000000000000000) (bvslt (index!24475 lt!259084) (size!17477 a!3118)))) (or ((_ is Undefined!5562) lt!259084) ((_ is Found!5562) lt!259084) ((_ is MissingZero!5562) lt!259084) (not ((_ is MissingVacant!5562) lt!259084)) (and (bvsge (index!24478 lt!259084) #b00000000000000000000000000000000) (bvslt (index!24478 lt!259084) (size!17477 a!3118)))) (or ((_ is Undefined!5562) lt!259084) (ite ((_ is Found!5562) lt!259084) (= (select (arr!17113 a!3118) (index!24476 lt!259084)) k0!1914) (ite ((_ is MissingZero!5562) lt!259084) (= (select (arr!17113 a!3118) (index!24475 lt!259084)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5562) lt!259084) (= (select (arr!17113 a!3118) (index!24478 lt!259084)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84525 (= lt!259084 e!327241)))

(declare-fun c!65321 () Bool)

(assert (=> d!84525 (= c!65321 (and ((_ is Intermediate!5562) lt!259082) (undefined!6374 lt!259082)))))

(assert (=> d!84525 (= lt!259082 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!84525 (validMask!0 mask!3119)))

(assert (=> d!84525 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!259084)))

(declare-fun b!568730 () Bool)

(declare-fun c!65320 () Bool)

(assert (=> b!568730 (= c!65320 (= lt!259083 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!568730 (= e!327240 e!327242)))

(declare-fun b!568731 () Bool)

(assert (=> b!568731 (= e!327240 (Found!5562 (index!24477 lt!259082)))))

(assert (= (and d!84525 c!65321) b!568727))

(assert (= (and d!84525 (not c!65321)) b!568728))

(assert (= (and b!568728 c!65322) b!568731))

(assert (= (and b!568728 (not c!65322)) b!568730))

(assert (= (and b!568730 c!65320) b!568726))

(assert (= (and b!568730 (not c!65320)) b!568729))

(declare-fun m!547211 () Bool)

(assert (=> b!568728 m!547211))

(declare-fun m!547213 () Bool)

(assert (=> b!568729 m!547213))

(declare-fun m!547215 () Bool)

(assert (=> d!84525 m!547215))

(declare-fun m!547217 () Bool)

(assert (=> d!84525 m!547217))

(declare-fun m!547219 () Bool)

(assert (=> d!84525 m!547219))

(assert (=> d!84525 m!547061))

(declare-fun m!547221 () Bool)

(assert (=> d!84525 m!547221))

(assert (=> d!84525 m!547221))

(declare-fun m!547223 () Bool)

(assert (=> d!84525 m!547223))

(assert (=> b!568495 d!84525))

(declare-fun d!84533 () Bool)

(declare-fun res!358802 () Bool)

(declare-fun e!327252 () Bool)

(assert (=> d!84533 (=> res!358802 e!327252)))

(assert (=> d!84533 (= res!358802 (= (select (arr!17113 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!84533 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!327252)))

(declare-fun b!568745 () Bool)

(declare-fun e!327253 () Bool)

(assert (=> b!568745 (= e!327252 e!327253)))

(declare-fun res!358803 () Bool)

(assert (=> b!568745 (=> (not res!358803) (not e!327253))))

(assert (=> b!568745 (= res!358803 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17477 a!3118)))))

(declare-fun b!568746 () Bool)

(assert (=> b!568746 (= e!327253 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84533 (not res!358802)) b!568745))

(assert (= (and b!568745 res!358803) b!568746))

(assert (=> d!84533 m!547115))

(declare-fun m!547233 () Bool)

(assert (=> b!568746 m!547233))

(assert (=> b!568489 d!84533))

(declare-fun b!568762 () Bool)

(declare-fun e!327265 () SeekEntryResult!5562)

(declare-fun lt!259095 () SeekEntryResult!5562)

(assert (=> b!568762 (= e!327265 (MissingZero!5562 (index!24477 lt!259095)))))

(declare-fun b!568763 () Bool)

(declare-fun e!327264 () SeekEntryResult!5562)

(assert (=> b!568763 (= e!327264 Undefined!5562)))

(declare-fun b!568764 () Bool)

(declare-fun e!327263 () SeekEntryResult!5562)

(assert (=> b!568764 (= e!327264 e!327263)))

(declare-fun lt!259096 () (_ BitVec 64))

(assert (=> b!568764 (= lt!259096 (select (arr!17113 a!3118) (index!24477 lt!259095)))))

(declare-fun c!65333 () Bool)

(assert (=> b!568764 (= c!65333 (= lt!259096 (select (arr!17113 a!3118) j!142)))))

(declare-fun b!568765 () Bool)

(assert (=> b!568765 (= e!327265 (seekKeyOrZeroReturnVacant!0 (x!53351 lt!259095) (index!24477 lt!259095) (index!24477 lt!259095) (select (arr!17113 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!84537 () Bool)

(declare-fun lt!259097 () SeekEntryResult!5562)

(assert (=> d!84537 (and (or ((_ is Undefined!5562) lt!259097) (not ((_ is Found!5562) lt!259097)) (and (bvsge (index!24476 lt!259097) #b00000000000000000000000000000000) (bvslt (index!24476 lt!259097) (size!17477 a!3118)))) (or ((_ is Undefined!5562) lt!259097) ((_ is Found!5562) lt!259097) (not ((_ is MissingZero!5562) lt!259097)) (and (bvsge (index!24475 lt!259097) #b00000000000000000000000000000000) (bvslt (index!24475 lt!259097) (size!17477 a!3118)))) (or ((_ is Undefined!5562) lt!259097) ((_ is Found!5562) lt!259097) ((_ is MissingZero!5562) lt!259097) (not ((_ is MissingVacant!5562) lt!259097)) (and (bvsge (index!24478 lt!259097) #b00000000000000000000000000000000) (bvslt (index!24478 lt!259097) (size!17477 a!3118)))) (or ((_ is Undefined!5562) lt!259097) (ite ((_ is Found!5562) lt!259097) (= (select (arr!17113 a!3118) (index!24476 lt!259097)) (select (arr!17113 a!3118) j!142)) (ite ((_ is MissingZero!5562) lt!259097) (= (select (arr!17113 a!3118) (index!24475 lt!259097)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5562) lt!259097) (= (select (arr!17113 a!3118) (index!24478 lt!259097)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84537 (= lt!259097 e!327264)))

(declare-fun c!65332 () Bool)

(assert (=> d!84537 (= c!65332 (and ((_ is Intermediate!5562) lt!259095) (undefined!6374 lt!259095)))))

(assert (=> d!84537 (= lt!259095 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17113 a!3118) j!142) mask!3119) (select (arr!17113 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84537 (validMask!0 mask!3119)))

(assert (=> d!84537 (= (seekEntryOrOpen!0 (select (arr!17113 a!3118) j!142) a!3118 mask!3119) lt!259097)))

(declare-fun b!568766 () Bool)

(declare-fun c!65331 () Bool)

(assert (=> b!568766 (= c!65331 (= lt!259096 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!568766 (= e!327263 e!327265)))

(declare-fun b!568767 () Bool)

(assert (=> b!568767 (= e!327263 (Found!5562 (index!24477 lt!259095)))))

(assert (= (and d!84537 c!65332) b!568763))

(assert (= (and d!84537 (not c!65332)) b!568764))

(assert (= (and b!568764 c!65333) b!568767))

(assert (= (and b!568764 (not c!65333)) b!568766))

(assert (= (and b!568766 c!65331) b!568762))

(assert (= (and b!568766 (not c!65331)) b!568765))

(declare-fun m!547243 () Bool)

(assert (=> b!568764 m!547243))

(assert (=> b!568765 m!547039))

(declare-fun m!547245 () Bool)

(assert (=> b!568765 m!547245))

(declare-fun m!547247 () Bool)

(assert (=> d!84537 m!547247))

(declare-fun m!547249 () Bool)

(assert (=> d!84537 m!547249))

(declare-fun m!547251 () Bool)

(assert (=> d!84537 m!547251))

(assert (=> d!84537 m!547061))

(assert (=> d!84537 m!547039))

(assert (=> d!84537 m!547053))

(assert (=> d!84537 m!547053))

(assert (=> d!84537 m!547039))

(declare-fun m!547253 () Bool)

(assert (=> d!84537 m!547253))

(assert (=> b!568494 d!84537))

(declare-fun b!568770 () Bool)

(declare-fun e!327268 () Bool)

(declare-fun call!32577 () Bool)

(assert (=> b!568770 (= e!327268 call!32577)))

(declare-fun bm!32574 () Bool)

(assert (=> bm!32574 (= call!32577 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun d!84541 () Bool)

(declare-fun res!358811 () Bool)

(declare-fun e!327270 () Bool)

(assert (=> d!84541 (=> res!358811 e!327270)))

(assert (=> d!84541 (= res!358811 (bvsge j!142 (size!17477 a!3118)))))

(assert (=> d!84541 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!327270)))

(declare-fun b!568771 () Bool)

(declare-fun e!327269 () Bool)

(assert (=> b!568771 (= e!327268 e!327269)))

(declare-fun lt!259100 () (_ BitVec 64))

(assert (=> b!568771 (= lt!259100 (select (arr!17113 a!3118) j!142))))

(declare-fun lt!259099 () Unit!17826)

(assert (=> b!568771 (= lt!259099 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!259100 j!142))))

(assert (=> b!568771 (arrayContainsKey!0 a!3118 lt!259100 #b00000000000000000000000000000000)))

(declare-fun lt!259098 () Unit!17826)

(assert (=> b!568771 (= lt!259098 lt!259099)))

(declare-fun res!358812 () Bool)

(assert (=> b!568771 (= res!358812 (= (seekEntryOrOpen!0 (select (arr!17113 a!3118) j!142) a!3118 mask!3119) (Found!5562 j!142)))))

(assert (=> b!568771 (=> (not res!358812) (not e!327269))))

(declare-fun b!568772 () Bool)

(assert (=> b!568772 (= e!327269 call!32577)))

(declare-fun b!568773 () Bool)

(assert (=> b!568773 (= e!327270 e!327268)))

(declare-fun c!65334 () Bool)

(assert (=> b!568773 (= c!65334 (validKeyInArray!0 (select (arr!17113 a!3118) j!142)))))

(assert (= (and d!84541 (not res!358811)) b!568773))

(assert (= (and b!568773 c!65334) b!568771))

(assert (= (and b!568773 (not c!65334)) b!568770))

(assert (= (and b!568771 res!358812) b!568772))

(assert (= (or b!568772 b!568770) bm!32574))

(declare-fun m!547255 () Bool)

(assert (=> bm!32574 m!547255))

(assert (=> b!568771 m!547039))

(declare-fun m!547257 () Bool)

(assert (=> b!568771 m!547257))

(declare-fun m!547259 () Bool)

(assert (=> b!568771 m!547259))

(assert (=> b!568771 m!547039))

(assert (=> b!568771 m!547045))

(assert (=> b!568773 m!547039))

(assert (=> b!568773 m!547039))

(assert (=> b!568773 m!547067))

(assert (=> b!568494 d!84541))

(declare-fun d!84543 () Bool)

(assert (=> d!84543 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!259114 () Unit!17826)

(declare-fun choose!38 (array!35640 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17826)

(assert (=> d!84543 (= lt!259114 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84543 (validMask!0 mask!3119)))

(assert (=> d!84543 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!259114)))

(declare-fun bs!17639 () Bool)

(assert (= bs!17639 d!84543))

(assert (=> bs!17639 m!547041))

(declare-fun m!547267 () Bool)

(assert (=> bs!17639 m!547267))

(assert (=> bs!17639 m!547061))

(assert (=> b!568494 d!84543))

(declare-fun d!84551 () Bool)

(assert (=> d!84551 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!568488 d!84551))

(check-sat (not b!568535) (not b!568567) (not d!84537) (not d!84525) (not bm!32567) (not b!568765) (not b!568569) (not b!568729) (not b!568773) (not b!568746) (not b!568653) (not d!84543) (not d!84511) (not bm!32574) (not b!568533) (not d!84503) (not b!568571) (not b!568662) (not b!568771) (not bm!32561))
(check-sat)
