; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51812 () Bool)

(assert start!51812)

(declare-fun b!566491 () Bool)

(declare-fun res!357410 () Bool)

(declare-fun e!326001 () Bool)

(assert (=> b!566491 (=> (not res!357410) (not e!326001))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35572 0))(
  ( (array!35573 (arr!17084 (Array (_ BitVec 32) (_ BitVec 64))) (size!17449 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35572)

(assert (=> b!566491 (= res!357410 (and (= (size!17449 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17449 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17449 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!566492 () Bool)

(declare-fun res!357406 () Bool)

(declare-fun e!325999 () Bool)

(assert (=> b!566492 (=> (not res!357406) (not e!325999))))

(declare-datatypes ((List!11203 0))(
  ( (Nil!11200) (Cons!11199 (h!12208 (_ BitVec 64)) (t!17422 List!11203)) )
))
(declare-fun arrayNoDuplicates!0 (array!35572 (_ BitVec 32) List!11203) Bool)

(assert (=> b!566492 (= res!357406 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11200))))

(declare-fun b!566493 () Bool)

(declare-fun e!325998 () Bool)

(declare-datatypes ((SeekEntryResult!5530 0))(
  ( (MissingZero!5530 (index!24347 (_ BitVec 32))) (Found!5530 (index!24348 (_ BitVec 32))) (Intermediate!5530 (undefined!6342 Bool) (index!24349 (_ BitVec 32)) (x!53224 (_ BitVec 32))) (Undefined!5530) (MissingVacant!5530 (index!24350 (_ BitVec 32))) )
))
(declare-fun lt!258055 () SeekEntryResult!5530)

(get-info :version)

(assert (=> b!566493 (= e!325998 (not (or (not ((_ is Intermediate!5530) lt!258055)) (undefined!6342 lt!258055) (and (bvsge (index!24349 lt!258055) #b00000000000000000000000000000000) (bvslt (index!24349 lt!258055) (size!17449 a!3118))))))))

(declare-fun e!325997 () Bool)

(assert (=> b!566493 e!325997))

(declare-fun res!357409 () Bool)

(assert (=> b!566493 (=> (not res!357409) (not e!325997))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35572 (_ BitVec 32)) Bool)

(assert (=> b!566493 (= res!357409 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17748 0))(
  ( (Unit!17749) )
))
(declare-fun lt!258057 () Unit!17748)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35572 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17748)

(assert (=> b!566493 (= lt!258057 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!566494 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35572 (_ BitVec 32)) SeekEntryResult!5530)

(assert (=> b!566494 (= e!325997 (= (seekEntryOrOpen!0 (select (arr!17084 a!3118) j!142) a!3118 mask!3119) (Found!5530 j!142)))))

(declare-fun b!566495 () Bool)

(assert (=> b!566495 (= e!325999 e!325998)))

(declare-fun res!357405 () Bool)

(assert (=> b!566495 (=> (not res!357405) (not e!325998))))

(declare-fun lt!258056 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35572 (_ BitVec 32)) SeekEntryResult!5530)

(assert (=> b!566495 (= res!357405 (= lt!258055 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258056 (select (store (arr!17084 a!3118) i!1132 k0!1914) j!142) (array!35573 (store (arr!17084 a!3118) i!1132 k0!1914) (size!17449 a!3118)) mask!3119)))))

(declare-fun lt!258058 () (_ BitVec 32))

(assert (=> b!566495 (= lt!258055 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258058 (select (arr!17084 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!566495 (= lt!258056 (toIndex!0 (select (store (arr!17084 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!566495 (= lt!258058 (toIndex!0 (select (arr!17084 a!3118) j!142) mask!3119))))

(declare-fun b!566496 () Bool)

(assert (=> b!566496 (= e!326001 e!325999)))

(declare-fun res!357408 () Bool)

(assert (=> b!566496 (=> (not res!357408) (not e!325999))))

(declare-fun lt!258054 () SeekEntryResult!5530)

(assert (=> b!566496 (= res!357408 (or (= lt!258054 (MissingZero!5530 i!1132)) (= lt!258054 (MissingVacant!5530 i!1132))))))

(assert (=> b!566496 (= lt!258054 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!357404 () Bool)

(assert (=> start!51812 (=> (not res!357404) (not e!326001))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51812 (= res!357404 (validMask!0 mask!3119))))

(assert (=> start!51812 e!326001))

(assert (=> start!51812 true))

(declare-fun array_inv!12967 (array!35572) Bool)

(assert (=> start!51812 (array_inv!12967 a!3118)))

(declare-fun b!566497 () Bool)

(declare-fun res!357402 () Bool)

(assert (=> b!566497 (=> (not res!357402) (not e!326001))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!566497 (= res!357402 (validKeyInArray!0 k0!1914))))

(declare-fun b!566498 () Bool)

(declare-fun res!357403 () Bool)

(assert (=> b!566498 (=> (not res!357403) (not e!325999))))

(assert (=> b!566498 (= res!357403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!566499 () Bool)

(declare-fun res!357401 () Bool)

(assert (=> b!566499 (=> (not res!357401) (not e!326001))))

(declare-fun arrayContainsKey!0 (array!35572 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!566499 (= res!357401 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!566500 () Bool)

(declare-fun res!357407 () Bool)

(assert (=> b!566500 (=> (not res!357407) (not e!326001))))

(assert (=> b!566500 (= res!357407 (validKeyInArray!0 (select (arr!17084 a!3118) j!142)))))

(assert (= (and start!51812 res!357404) b!566491))

(assert (= (and b!566491 res!357410) b!566500))

(assert (= (and b!566500 res!357407) b!566497))

(assert (= (and b!566497 res!357402) b!566499))

(assert (= (and b!566499 res!357401) b!566496))

(assert (= (and b!566496 res!357408) b!566498))

(assert (= (and b!566498 res!357403) b!566492))

(assert (= (and b!566492 res!357406) b!566495))

(assert (= (and b!566495 res!357405) b!566493))

(assert (= (and b!566493 res!357409) b!566494))

(declare-fun m!544589 () Bool)

(assert (=> b!566500 m!544589))

(assert (=> b!566500 m!544589))

(declare-fun m!544591 () Bool)

(assert (=> b!566500 m!544591))

(declare-fun m!544593 () Bool)

(assert (=> b!566497 m!544593))

(declare-fun m!544595 () Bool)

(assert (=> start!51812 m!544595))

(declare-fun m!544597 () Bool)

(assert (=> start!51812 m!544597))

(declare-fun m!544599 () Bool)

(assert (=> b!566496 m!544599))

(assert (=> b!566495 m!544589))

(declare-fun m!544601 () Bool)

(assert (=> b!566495 m!544601))

(assert (=> b!566495 m!544589))

(assert (=> b!566495 m!544589))

(declare-fun m!544603 () Bool)

(assert (=> b!566495 m!544603))

(declare-fun m!544605 () Bool)

(assert (=> b!566495 m!544605))

(declare-fun m!544607 () Bool)

(assert (=> b!566495 m!544607))

(assert (=> b!566495 m!544605))

(declare-fun m!544609 () Bool)

(assert (=> b!566495 m!544609))

(assert (=> b!566495 m!544605))

(declare-fun m!544611 () Bool)

(assert (=> b!566495 m!544611))

(declare-fun m!544613 () Bool)

(assert (=> b!566499 m!544613))

(declare-fun m!544615 () Bool)

(assert (=> b!566498 m!544615))

(declare-fun m!544617 () Bool)

(assert (=> b!566492 m!544617))

(declare-fun m!544619 () Bool)

(assert (=> b!566493 m!544619))

(declare-fun m!544621 () Bool)

(assert (=> b!566493 m!544621))

(assert (=> b!566494 m!544589))

(assert (=> b!566494 m!544589))

(declare-fun m!544623 () Bool)

(assert (=> b!566494 m!544623))

(check-sat (not b!566497) (not b!566500) (not b!566498) (not b!566495) (not b!566499) (not b!566493) (not b!566496) (not b!566492) (not b!566494) (not start!51812))
(check-sat)
(get-model)

(declare-fun d!83981 () Bool)

(declare-fun res!357475 () Bool)

(declare-fun e!326036 () Bool)

(assert (=> d!83981 (=> res!357475 e!326036)))

(assert (=> d!83981 (= res!357475 (= (select (arr!17084 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!83981 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!326036)))

(declare-fun b!566565 () Bool)

(declare-fun e!326037 () Bool)

(assert (=> b!566565 (= e!326036 e!326037)))

(declare-fun res!357476 () Bool)

(assert (=> b!566565 (=> (not res!357476) (not e!326037))))

(assert (=> b!566565 (= res!357476 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17449 a!3118)))))

(declare-fun b!566566 () Bool)

(assert (=> b!566566 (= e!326037 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83981 (not res!357475)) b!566565))

(assert (= (and b!566565 res!357476) b!566566))

(declare-fun m!544697 () Bool)

(assert (=> d!83981 m!544697))

(declare-fun m!544699 () Bool)

(assert (=> b!566566 m!544699))

(assert (=> b!566499 d!83981))

(declare-fun b!566591 () Bool)

(declare-fun e!326055 () SeekEntryResult!5530)

(declare-fun e!326053 () SeekEntryResult!5530)

(assert (=> b!566591 (= e!326055 e!326053)))

(declare-fun lt!258107 () (_ BitVec 64))

(declare-fun lt!258108 () SeekEntryResult!5530)

(assert (=> b!566591 (= lt!258107 (select (arr!17084 a!3118) (index!24349 lt!258108)))))

(declare-fun c!64903 () Bool)

(assert (=> b!566591 (= c!64903 (= lt!258107 (select (arr!17084 a!3118) j!142)))))

(declare-fun d!83983 () Bool)

(declare-fun lt!258109 () SeekEntryResult!5530)

(assert (=> d!83983 (and (or ((_ is Undefined!5530) lt!258109) (not ((_ is Found!5530) lt!258109)) (and (bvsge (index!24348 lt!258109) #b00000000000000000000000000000000) (bvslt (index!24348 lt!258109) (size!17449 a!3118)))) (or ((_ is Undefined!5530) lt!258109) ((_ is Found!5530) lt!258109) (not ((_ is MissingZero!5530) lt!258109)) (and (bvsge (index!24347 lt!258109) #b00000000000000000000000000000000) (bvslt (index!24347 lt!258109) (size!17449 a!3118)))) (or ((_ is Undefined!5530) lt!258109) ((_ is Found!5530) lt!258109) ((_ is MissingZero!5530) lt!258109) (not ((_ is MissingVacant!5530) lt!258109)) (and (bvsge (index!24350 lt!258109) #b00000000000000000000000000000000) (bvslt (index!24350 lt!258109) (size!17449 a!3118)))) (or ((_ is Undefined!5530) lt!258109) (ite ((_ is Found!5530) lt!258109) (= (select (arr!17084 a!3118) (index!24348 lt!258109)) (select (arr!17084 a!3118) j!142)) (ite ((_ is MissingZero!5530) lt!258109) (= (select (arr!17084 a!3118) (index!24347 lt!258109)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5530) lt!258109) (= (select (arr!17084 a!3118) (index!24350 lt!258109)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83983 (= lt!258109 e!326055)))

(declare-fun c!64905 () Bool)

(assert (=> d!83983 (= c!64905 (and ((_ is Intermediate!5530) lt!258108) (undefined!6342 lt!258108)))))

(assert (=> d!83983 (= lt!258108 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17084 a!3118) j!142) mask!3119) (select (arr!17084 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83983 (validMask!0 mask!3119)))

(assert (=> d!83983 (= (seekEntryOrOpen!0 (select (arr!17084 a!3118) j!142) a!3118 mask!3119) lt!258109)))

(declare-fun b!566592 () Bool)

(declare-fun c!64904 () Bool)

(assert (=> b!566592 (= c!64904 (= lt!258107 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!326054 () SeekEntryResult!5530)

(assert (=> b!566592 (= e!326053 e!326054)))

(declare-fun b!566593 () Bool)

(assert (=> b!566593 (= e!326055 Undefined!5530)))

(declare-fun b!566594 () Bool)

(assert (=> b!566594 (= e!326053 (Found!5530 (index!24349 lt!258108)))))

(declare-fun b!566595 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35572 (_ BitVec 32)) SeekEntryResult!5530)

(assert (=> b!566595 (= e!326054 (seekKeyOrZeroReturnVacant!0 (x!53224 lt!258108) (index!24349 lt!258108) (index!24349 lt!258108) (select (arr!17084 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!566596 () Bool)

(assert (=> b!566596 (= e!326054 (MissingZero!5530 (index!24349 lt!258108)))))

(assert (= (and d!83983 c!64905) b!566593))

(assert (= (and d!83983 (not c!64905)) b!566591))

(assert (= (and b!566591 c!64903) b!566594))

(assert (= (and b!566591 (not c!64903)) b!566592))

(assert (= (and b!566592 c!64904) b!566596))

(assert (= (and b!566592 (not c!64904)) b!566595))

(declare-fun m!544709 () Bool)

(assert (=> b!566591 m!544709))

(declare-fun m!544711 () Bool)

(assert (=> d!83983 m!544711))

(assert (=> d!83983 m!544595))

(assert (=> d!83983 m!544601))

(assert (=> d!83983 m!544589))

(declare-fun m!544713 () Bool)

(assert (=> d!83983 m!544713))

(assert (=> d!83983 m!544589))

(assert (=> d!83983 m!544601))

(declare-fun m!544715 () Bool)

(assert (=> d!83983 m!544715))

(declare-fun m!544717 () Bool)

(assert (=> d!83983 m!544717))

(assert (=> b!566595 m!544589))

(declare-fun m!544719 () Bool)

(assert (=> b!566595 m!544719))

(assert (=> b!566494 d!83983))

(declare-fun d!83995 () Bool)

(declare-fun res!357488 () Bool)

(declare-fun e!326071 () Bool)

(assert (=> d!83995 (=> res!357488 e!326071)))

(assert (=> d!83995 (= res!357488 (bvsge j!142 (size!17449 a!3118)))))

(assert (=> d!83995 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!326071)))

(declare-fun bm!32476 () Bool)

(declare-fun call!32479 () Bool)

(assert (=> bm!32476 (= call!32479 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!566623 () Bool)

(declare-fun e!326073 () Bool)

(assert (=> b!566623 (= e!326071 e!326073)))

(declare-fun c!64917 () Bool)

(assert (=> b!566623 (= c!64917 (validKeyInArray!0 (select (arr!17084 a!3118) j!142)))))

(declare-fun b!566624 () Bool)

(declare-fun e!326072 () Bool)

(assert (=> b!566624 (= e!326072 call!32479)))

(declare-fun b!566625 () Bool)

(assert (=> b!566625 (= e!326073 call!32479)))

(declare-fun b!566626 () Bool)

(assert (=> b!566626 (= e!326073 e!326072)))

(declare-fun lt!258126 () (_ BitVec 64))

(assert (=> b!566626 (= lt!258126 (select (arr!17084 a!3118) j!142))))

(declare-fun lt!258127 () Unit!17748)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35572 (_ BitVec 64) (_ BitVec 32)) Unit!17748)

(assert (=> b!566626 (= lt!258127 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258126 j!142))))

(assert (=> b!566626 (arrayContainsKey!0 a!3118 lt!258126 #b00000000000000000000000000000000)))

(declare-fun lt!258125 () Unit!17748)

(assert (=> b!566626 (= lt!258125 lt!258127)))

(declare-fun res!357487 () Bool)

(assert (=> b!566626 (= res!357487 (= (seekEntryOrOpen!0 (select (arr!17084 a!3118) j!142) a!3118 mask!3119) (Found!5530 j!142)))))

(assert (=> b!566626 (=> (not res!357487) (not e!326072))))

(assert (= (and d!83995 (not res!357488)) b!566623))

(assert (= (and b!566623 c!64917) b!566626))

(assert (= (and b!566623 (not c!64917)) b!566625))

(assert (= (and b!566626 res!357487) b!566624))

(assert (= (or b!566624 b!566625) bm!32476))

(declare-fun m!544733 () Bool)

(assert (=> bm!32476 m!544733))

(assert (=> b!566623 m!544589))

(assert (=> b!566623 m!544589))

(assert (=> b!566623 m!544591))

(assert (=> b!566626 m!544589))

(declare-fun m!544735 () Bool)

(assert (=> b!566626 m!544735))

(declare-fun m!544737 () Bool)

(assert (=> b!566626 m!544737))

(assert (=> b!566626 m!544589))

(assert (=> b!566626 m!544623))

(assert (=> b!566493 d!83995))

(declare-fun d!84001 () Bool)

(assert (=> d!84001 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!258136 () Unit!17748)

(declare-fun choose!38 (array!35572 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17748)

(assert (=> d!84001 (= lt!258136 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84001 (validMask!0 mask!3119)))

(assert (=> d!84001 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!258136)))

(declare-fun bs!17573 () Bool)

(assert (= bs!17573 d!84001))

(assert (=> bs!17573 m!544619))

(declare-fun m!544739 () Bool)

(assert (=> bs!17573 m!544739))

(assert (=> bs!17573 m!544595))

(assert (=> b!566493 d!84001))

(declare-fun b!566727 () Bool)

(declare-fun e!326143 () SeekEntryResult!5530)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!566727 (= e!326143 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258056 #b00000000000000000000000000000000 mask!3119) (select (store (arr!17084 a!3118) i!1132 k0!1914) j!142) (array!35573 (store (arr!17084 a!3118) i!1132 k0!1914) (size!17449 a!3118)) mask!3119))))

(declare-fun b!566728 () Bool)

(declare-fun e!326145 () SeekEntryResult!5530)

(assert (=> b!566728 (= e!326145 (Intermediate!5530 true lt!258056 #b00000000000000000000000000000000))))

(declare-fun d!84003 () Bool)

(declare-fun e!326144 () Bool)

(assert (=> d!84003 e!326144))

(declare-fun c!64949 () Bool)

(declare-fun lt!258163 () SeekEntryResult!5530)

(assert (=> d!84003 (= c!64949 (and ((_ is Intermediate!5530) lt!258163) (undefined!6342 lt!258163)))))

(assert (=> d!84003 (= lt!258163 e!326145)))

(declare-fun c!64950 () Bool)

(assert (=> d!84003 (= c!64950 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!258162 () (_ BitVec 64))

(assert (=> d!84003 (= lt!258162 (select (arr!17084 (array!35573 (store (arr!17084 a!3118) i!1132 k0!1914) (size!17449 a!3118))) lt!258056))))

(assert (=> d!84003 (validMask!0 mask!3119)))

(assert (=> d!84003 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258056 (select (store (arr!17084 a!3118) i!1132 k0!1914) j!142) (array!35573 (store (arr!17084 a!3118) i!1132 k0!1914) (size!17449 a!3118)) mask!3119) lt!258163)))

(declare-fun b!566729 () Bool)

(assert (=> b!566729 (= e!326143 (Intermediate!5530 false lt!258056 #b00000000000000000000000000000000))))

(declare-fun b!566730 () Bool)

(declare-fun e!326142 () Bool)

(assert (=> b!566730 (= e!326144 e!326142)))

(declare-fun res!357527 () Bool)

(assert (=> b!566730 (= res!357527 (and ((_ is Intermediate!5530) lt!258163) (not (undefined!6342 lt!258163)) (bvslt (x!53224 lt!258163) #b01111111111111111111111111111110) (bvsge (x!53224 lt!258163) #b00000000000000000000000000000000) (bvsge (x!53224 lt!258163) #b00000000000000000000000000000000)))))

(assert (=> b!566730 (=> (not res!357527) (not e!326142))))

(declare-fun b!566731 () Bool)

(assert (=> b!566731 (and (bvsge (index!24349 lt!258163) #b00000000000000000000000000000000) (bvslt (index!24349 lt!258163) (size!17449 (array!35573 (store (arr!17084 a!3118) i!1132 k0!1914) (size!17449 a!3118)))))))

(declare-fun res!357528 () Bool)

(assert (=> b!566731 (= res!357528 (= (select (arr!17084 (array!35573 (store (arr!17084 a!3118) i!1132 k0!1914) (size!17449 a!3118))) (index!24349 lt!258163)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!326141 () Bool)

(assert (=> b!566731 (=> res!357528 e!326141)))

(declare-fun b!566732 () Bool)

(assert (=> b!566732 (and (bvsge (index!24349 lt!258163) #b00000000000000000000000000000000) (bvslt (index!24349 lt!258163) (size!17449 (array!35573 (store (arr!17084 a!3118) i!1132 k0!1914) (size!17449 a!3118)))))))

(assert (=> b!566732 (= e!326141 (= (select (arr!17084 (array!35573 (store (arr!17084 a!3118) i!1132 k0!1914) (size!17449 a!3118))) (index!24349 lt!258163)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!566733 () Bool)

(assert (=> b!566733 (and (bvsge (index!24349 lt!258163) #b00000000000000000000000000000000) (bvslt (index!24349 lt!258163) (size!17449 (array!35573 (store (arr!17084 a!3118) i!1132 k0!1914) (size!17449 a!3118)))))))

(declare-fun res!357529 () Bool)

(assert (=> b!566733 (= res!357529 (= (select (arr!17084 (array!35573 (store (arr!17084 a!3118) i!1132 k0!1914) (size!17449 a!3118))) (index!24349 lt!258163)) (select (store (arr!17084 a!3118) i!1132 k0!1914) j!142)))))

(assert (=> b!566733 (=> res!357529 e!326141)))

(assert (=> b!566733 (= e!326142 e!326141)))

(declare-fun b!566734 () Bool)

(assert (=> b!566734 (= e!326145 e!326143)))

(declare-fun c!64951 () Bool)

(assert (=> b!566734 (= c!64951 (or (= lt!258162 (select (store (arr!17084 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!258162 lt!258162) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!566735 () Bool)

(assert (=> b!566735 (= e!326144 (bvsge (x!53224 lt!258163) #b01111111111111111111111111111110))))

(assert (= (and d!84003 c!64950) b!566728))

(assert (= (and d!84003 (not c!64950)) b!566734))

(assert (= (and b!566734 c!64951) b!566729))

(assert (= (and b!566734 (not c!64951)) b!566727))

(assert (= (and d!84003 c!64949) b!566735))

(assert (= (and d!84003 (not c!64949)) b!566730))

(assert (= (and b!566730 res!357527) b!566733))

(assert (= (and b!566733 (not res!357529)) b!566731))

(assert (= (and b!566731 (not res!357528)) b!566732))

(declare-fun m!544813 () Bool)

(assert (=> d!84003 m!544813))

(assert (=> d!84003 m!544595))

(declare-fun m!544815 () Bool)

(assert (=> b!566727 m!544815))

(assert (=> b!566727 m!544815))

(assert (=> b!566727 m!544605))

(declare-fun m!544817 () Bool)

(assert (=> b!566727 m!544817))

(declare-fun m!544819 () Bool)

(assert (=> b!566732 m!544819))

(assert (=> b!566733 m!544819))

(assert (=> b!566731 m!544819))

(assert (=> b!566495 d!84003))

(declare-fun b!566736 () Bool)

(declare-fun e!326148 () SeekEntryResult!5530)

(assert (=> b!566736 (= e!326148 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258058 #b00000000000000000000000000000000 mask!3119) (select (arr!17084 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!566737 () Bool)

(declare-fun e!326150 () SeekEntryResult!5530)

(assert (=> b!566737 (= e!326150 (Intermediate!5530 true lt!258058 #b00000000000000000000000000000000))))

(declare-fun d!84029 () Bool)

(declare-fun e!326149 () Bool)

(assert (=> d!84029 e!326149))

(declare-fun c!64952 () Bool)

(declare-fun lt!258165 () SeekEntryResult!5530)

(assert (=> d!84029 (= c!64952 (and ((_ is Intermediate!5530) lt!258165) (undefined!6342 lt!258165)))))

(assert (=> d!84029 (= lt!258165 e!326150)))

(declare-fun c!64953 () Bool)

(assert (=> d!84029 (= c!64953 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!258164 () (_ BitVec 64))

(assert (=> d!84029 (= lt!258164 (select (arr!17084 a!3118) lt!258058))))

(assert (=> d!84029 (validMask!0 mask!3119)))

(assert (=> d!84029 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258058 (select (arr!17084 a!3118) j!142) a!3118 mask!3119) lt!258165)))

(declare-fun b!566738 () Bool)

(assert (=> b!566738 (= e!326148 (Intermediate!5530 false lt!258058 #b00000000000000000000000000000000))))

(declare-fun b!566739 () Bool)

(declare-fun e!326147 () Bool)

(assert (=> b!566739 (= e!326149 e!326147)))

(declare-fun res!357530 () Bool)

(assert (=> b!566739 (= res!357530 (and ((_ is Intermediate!5530) lt!258165) (not (undefined!6342 lt!258165)) (bvslt (x!53224 lt!258165) #b01111111111111111111111111111110) (bvsge (x!53224 lt!258165) #b00000000000000000000000000000000) (bvsge (x!53224 lt!258165) #b00000000000000000000000000000000)))))

(assert (=> b!566739 (=> (not res!357530) (not e!326147))))

(declare-fun b!566740 () Bool)

(assert (=> b!566740 (and (bvsge (index!24349 lt!258165) #b00000000000000000000000000000000) (bvslt (index!24349 lt!258165) (size!17449 a!3118)))))

(declare-fun res!357531 () Bool)

(assert (=> b!566740 (= res!357531 (= (select (arr!17084 a!3118) (index!24349 lt!258165)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!326146 () Bool)

(assert (=> b!566740 (=> res!357531 e!326146)))

(declare-fun b!566741 () Bool)

(assert (=> b!566741 (and (bvsge (index!24349 lt!258165) #b00000000000000000000000000000000) (bvslt (index!24349 lt!258165) (size!17449 a!3118)))))

(assert (=> b!566741 (= e!326146 (= (select (arr!17084 a!3118) (index!24349 lt!258165)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!566742 () Bool)

(assert (=> b!566742 (and (bvsge (index!24349 lt!258165) #b00000000000000000000000000000000) (bvslt (index!24349 lt!258165) (size!17449 a!3118)))))

(declare-fun res!357532 () Bool)

(assert (=> b!566742 (= res!357532 (= (select (arr!17084 a!3118) (index!24349 lt!258165)) (select (arr!17084 a!3118) j!142)))))

(assert (=> b!566742 (=> res!357532 e!326146)))

(assert (=> b!566742 (= e!326147 e!326146)))

(declare-fun b!566743 () Bool)

(assert (=> b!566743 (= e!326150 e!326148)))

(declare-fun c!64954 () Bool)

(assert (=> b!566743 (= c!64954 (or (= lt!258164 (select (arr!17084 a!3118) j!142)) (= (bvadd lt!258164 lt!258164) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!566744 () Bool)

(assert (=> b!566744 (= e!326149 (bvsge (x!53224 lt!258165) #b01111111111111111111111111111110))))

(assert (= (and d!84029 c!64953) b!566737))

(assert (= (and d!84029 (not c!64953)) b!566743))

(assert (= (and b!566743 c!64954) b!566738))

(assert (= (and b!566743 (not c!64954)) b!566736))

(assert (= (and d!84029 c!64952) b!566744))

(assert (= (and d!84029 (not c!64952)) b!566739))

(assert (= (and b!566739 res!357530) b!566742))

(assert (= (and b!566742 (not res!357532)) b!566740))

(assert (= (and b!566740 (not res!357531)) b!566741))

(declare-fun m!544821 () Bool)

(assert (=> d!84029 m!544821))

(assert (=> d!84029 m!544595))

(declare-fun m!544823 () Bool)

(assert (=> b!566736 m!544823))

(assert (=> b!566736 m!544823))

(assert (=> b!566736 m!544589))

(declare-fun m!544825 () Bool)

(assert (=> b!566736 m!544825))

(declare-fun m!544827 () Bool)

(assert (=> b!566741 m!544827))

(assert (=> b!566742 m!544827))

(assert (=> b!566740 m!544827))

(assert (=> b!566495 d!84029))

(declare-fun d!84031 () Bool)

(declare-fun lt!258177 () (_ BitVec 32))

(declare-fun lt!258176 () (_ BitVec 32))

(assert (=> d!84031 (= lt!258177 (bvmul (bvxor lt!258176 (bvlshr lt!258176 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84031 (= lt!258176 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17084 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!17084 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84031 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!357533 (let ((h!12211 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17084 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!17084 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53228 (bvmul (bvxor h!12211 (bvlshr h!12211 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53228 (bvlshr x!53228 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!357533 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!357533 #b00000000000000000000000000000000))))))

(assert (=> d!84031 (= (toIndex!0 (select (store (arr!17084 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!258177 (bvlshr lt!258177 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!566495 d!84031))

(declare-fun d!84041 () Bool)

(declare-fun lt!258179 () (_ BitVec 32))

(declare-fun lt!258178 () (_ BitVec 32))

(assert (=> d!84041 (= lt!258179 (bvmul (bvxor lt!258178 (bvlshr lt!258178 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84041 (= lt!258178 ((_ extract 31 0) (bvand (bvxor (select (arr!17084 a!3118) j!142) (bvlshr (select (arr!17084 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84041 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!357533 (let ((h!12211 ((_ extract 31 0) (bvand (bvxor (select (arr!17084 a!3118) j!142) (bvlshr (select (arr!17084 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53228 (bvmul (bvxor h!12211 (bvlshr h!12211 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53228 (bvlshr x!53228 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!357533 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!357533 #b00000000000000000000000000000000))))))

(assert (=> d!84041 (= (toIndex!0 (select (arr!17084 a!3118) j!142) mask!3119) (bvand (bvxor lt!258179 (bvlshr lt!258179 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!566495 d!84041))

(declare-fun d!84045 () Bool)

(assert (=> d!84045 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51812 d!84045))

(declare-fun d!84047 () Bool)

(assert (=> d!84047 (= (array_inv!12967 a!3118) (bvsge (size!17449 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51812 d!84047))

(declare-fun d!84049 () Bool)

(assert (=> d!84049 (= (validKeyInArray!0 (select (arr!17084 a!3118) j!142)) (and (not (= (select (arr!17084 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17084 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!566500 d!84049))

(declare-fun b!566755 () Bool)

(declare-fun e!326162 () SeekEntryResult!5530)

(declare-fun e!326160 () SeekEntryResult!5530)

(assert (=> b!566755 (= e!326162 e!326160)))

(declare-fun lt!258180 () (_ BitVec 64))

(declare-fun lt!258181 () SeekEntryResult!5530)

(assert (=> b!566755 (= lt!258180 (select (arr!17084 a!3118) (index!24349 lt!258181)))))

(declare-fun c!64956 () Bool)

(assert (=> b!566755 (= c!64956 (= lt!258180 k0!1914))))

(declare-fun d!84051 () Bool)

(declare-fun lt!258182 () SeekEntryResult!5530)

(assert (=> d!84051 (and (or ((_ is Undefined!5530) lt!258182) (not ((_ is Found!5530) lt!258182)) (and (bvsge (index!24348 lt!258182) #b00000000000000000000000000000000) (bvslt (index!24348 lt!258182) (size!17449 a!3118)))) (or ((_ is Undefined!5530) lt!258182) ((_ is Found!5530) lt!258182) (not ((_ is MissingZero!5530) lt!258182)) (and (bvsge (index!24347 lt!258182) #b00000000000000000000000000000000) (bvslt (index!24347 lt!258182) (size!17449 a!3118)))) (or ((_ is Undefined!5530) lt!258182) ((_ is Found!5530) lt!258182) ((_ is MissingZero!5530) lt!258182) (not ((_ is MissingVacant!5530) lt!258182)) (and (bvsge (index!24350 lt!258182) #b00000000000000000000000000000000) (bvslt (index!24350 lt!258182) (size!17449 a!3118)))) (or ((_ is Undefined!5530) lt!258182) (ite ((_ is Found!5530) lt!258182) (= (select (arr!17084 a!3118) (index!24348 lt!258182)) k0!1914) (ite ((_ is MissingZero!5530) lt!258182) (= (select (arr!17084 a!3118) (index!24347 lt!258182)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5530) lt!258182) (= (select (arr!17084 a!3118) (index!24350 lt!258182)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84051 (= lt!258182 e!326162)))

(declare-fun c!64958 () Bool)

(assert (=> d!84051 (= c!64958 (and ((_ is Intermediate!5530) lt!258181) (undefined!6342 lt!258181)))))

(assert (=> d!84051 (= lt!258181 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!84051 (validMask!0 mask!3119)))

(assert (=> d!84051 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!258182)))

(declare-fun b!566756 () Bool)

(declare-fun c!64957 () Bool)

(assert (=> b!566756 (= c!64957 (= lt!258180 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!326161 () SeekEntryResult!5530)

(assert (=> b!566756 (= e!326160 e!326161)))

(declare-fun b!566757 () Bool)

(assert (=> b!566757 (= e!326162 Undefined!5530)))

(declare-fun b!566758 () Bool)

(assert (=> b!566758 (= e!326160 (Found!5530 (index!24349 lt!258181)))))

(declare-fun b!566759 () Bool)

(assert (=> b!566759 (= e!326161 (seekKeyOrZeroReturnVacant!0 (x!53224 lt!258181) (index!24349 lt!258181) (index!24349 lt!258181) k0!1914 a!3118 mask!3119))))

(declare-fun b!566760 () Bool)

(assert (=> b!566760 (= e!326161 (MissingZero!5530 (index!24349 lt!258181)))))

(assert (= (and d!84051 c!64958) b!566757))

(assert (= (and d!84051 (not c!64958)) b!566755))

(assert (= (and b!566755 c!64956) b!566758))

(assert (= (and b!566755 (not c!64956)) b!566756))

(assert (= (and b!566756 c!64957) b!566760))

(assert (= (and b!566756 (not c!64957)) b!566759))

(declare-fun m!544841 () Bool)

(assert (=> b!566755 m!544841))

(declare-fun m!544843 () Bool)

(assert (=> d!84051 m!544843))

(assert (=> d!84051 m!544595))

(declare-fun m!544845 () Bool)

(assert (=> d!84051 m!544845))

(declare-fun m!544847 () Bool)

(assert (=> d!84051 m!544847))

(assert (=> d!84051 m!544845))

(declare-fun m!544849 () Bool)

(assert (=> d!84051 m!544849))

(declare-fun m!544851 () Bool)

(assert (=> d!84051 m!544851))

(declare-fun m!544853 () Bool)

(assert (=> b!566759 m!544853))

(assert (=> b!566496 d!84051))

(declare-fun d!84053 () Bool)

(declare-fun res!357543 () Bool)

(declare-fun e!326163 () Bool)

(assert (=> d!84053 (=> res!357543 e!326163)))

(assert (=> d!84053 (= res!357543 (bvsge #b00000000000000000000000000000000 (size!17449 a!3118)))))

(assert (=> d!84053 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!326163)))

(declare-fun bm!32488 () Bool)

(declare-fun call!32491 () Bool)

(assert (=> bm!32488 (= call!32491 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!566761 () Bool)

(declare-fun e!326165 () Bool)

(assert (=> b!566761 (= e!326163 e!326165)))

(declare-fun c!64959 () Bool)

(assert (=> b!566761 (= c!64959 (validKeyInArray!0 (select (arr!17084 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!566762 () Bool)

(declare-fun e!326164 () Bool)

(assert (=> b!566762 (= e!326164 call!32491)))

(declare-fun b!566763 () Bool)

(assert (=> b!566763 (= e!326165 call!32491)))

(declare-fun b!566764 () Bool)

(assert (=> b!566764 (= e!326165 e!326164)))

(declare-fun lt!258184 () (_ BitVec 64))

(assert (=> b!566764 (= lt!258184 (select (arr!17084 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!258185 () Unit!17748)

(assert (=> b!566764 (= lt!258185 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258184 #b00000000000000000000000000000000))))

(assert (=> b!566764 (arrayContainsKey!0 a!3118 lt!258184 #b00000000000000000000000000000000)))

(declare-fun lt!258183 () Unit!17748)

(assert (=> b!566764 (= lt!258183 lt!258185)))

(declare-fun res!357542 () Bool)

(assert (=> b!566764 (= res!357542 (= (seekEntryOrOpen!0 (select (arr!17084 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5530 #b00000000000000000000000000000000)))))

(assert (=> b!566764 (=> (not res!357542) (not e!326164))))

(assert (= (and d!84053 (not res!357543)) b!566761))

(assert (= (and b!566761 c!64959) b!566764))

(assert (= (and b!566761 (not c!64959)) b!566763))

(assert (= (and b!566764 res!357542) b!566762))

(assert (= (or b!566762 b!566763) bm!32488))

(declare-fun m!544855 () Bool)

(assert (=> bm!32488 m!544855))

(assert (=> b!566761 m!544697))

(assert (=> b!566761 m!544697))

(declare-fun m!544857 () Bool)

(assert (=> b!566761 m!544857))

(assert (=> b!566764 m!544697))

(declare-fun m!544859 () Bool)

(assert (=> b!566764 m!544859))

(declare-fun m!544861 () Bool)

(assert (=> b!566764 m!544861))

(assert (=> b!566764 m!544697))

(declare-fun m!544863 () Bool)

(assert (=> b!566764 m!544863))

(assert (=> b!566498 d!84053))

(declare-fun d!84055 () Bool)

(assert (=> d!84055 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!566497 d!84055))

(declare-fun b!566811 () Bool)

(declare-fun e!326194 () Bool)

(declare-fun e!326195 () Bool)

(assert (=> b!566811 (= e!326194 e!326195)))

(declare-fun res!357564 () Bool)

(assert (=> b!566811 (=> (not res!357564) (not e!326195))))

(declare-fun e!326196 () Bool)

(assert (=> b!566811 (= res!357564 (not e!326196))))

(declare-fun res!357562 () Bool)

(assert (=> b!566811 (=> (not res!357562) (not e!326196))))

(assert (=> b!566811 (= res!357562 (validKeyInArray!0 (select (arr!17084 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32491 () Bool)

(declare-fun call!32494 () Bool)

(declare-fun c!64974 () Bool)

(assert (=> bm!32491 (= call!32494 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64974 (Cons!11199 (select (arr!17084 a!3118) #b00000000000000000000000000000000) Nil!11200) Nil!11200)))))

(declare-fun b!566812 () Bool)

(declare-fun contains!2850 (List!11203 (_ BitVec 64)) Bool)

(assert (=> b!566812 (= e!326196 (contains!2850 Nil!11200 (select (arr!17084 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!566813 () Bool)

(declare-fun e!326197 () Bool)

(assert (=> b!566813 (= e!326195 e!326197)))

(assert (=> b!566813 (= c!64974 (validKeyInArray!0 (select (arr!17084 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!84057 () Bool)

(declare-fun res!357563 () Bool)

(assert (=> d!84057 (=> res!357563 e!326194)))

(assert (=> d!84057 (= res!357563 (bvsge #b00000000000000000000000000000000 (size!17449 a!3118)))))

(assert (=> d!84057 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11200) e!326194)))

(declare-fun b!566814 () Bool)

(assert (=> b!566814 (= e!326197 call!32494)))

(declare-fun b!566815 () Bool)

(assert (=> b!566815 (= e!326197 call!32494)))

(assert (= (and d!84057 (not res!357563)) b!566811))

(assert (= (and b!566811 res!357562) b!566812))

(assert (= (and b!566811 res!357564) b!566813))

(assert (= (and b!566813 c!64974) b!566815))

(assert (= (and b!566813 (not c!64974)) b!566814))

(assert (= (or b!566815 b!566814) bm!32491))

(assert (=> b!566811 m!544697))

(assert (=> b!566811 m!544697))

(assert (=> b!566811 m!544857))

(assert (=> bm!32491 m!544697))

(declare-fun m!544865 () Bool)

(assert (=> bm!32491 m!544865))

(assert (=> b!566812 m!544697))

(assert (=> b!566812 m!544697))

(declare-fun m!544867 () Bool)

(assert (=> b!566812 m!544867))

(assert (=> b!566813 m!544697))

(assert (=> b!566813 m!544697))

(assert (=> b!566813 m!544857))

(assert (=> b!566492 d!84057))

(check-sat (not d!84003) (not d!84029) (not b!566626) (not d!83983) (not d!84051) (not b!566759) (not b!566595) (not b!566623) (not b!566727) (not b!566811) (not b!566764) (not bm!32491) (not d!84001) (not b!566736) (not bm!32488) (not b!566566) (not b!566812) (not b!566761) (not b!566813) (not bm!32476))
(check-sat)
