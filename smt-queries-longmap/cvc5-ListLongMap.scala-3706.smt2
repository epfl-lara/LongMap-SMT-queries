; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50852 () Bool)

(assert start!50852)

(declare-fun b!556559 () Bool)

(declare-fun e!320626 () Bool)

(declare-fun e!320624 () Bool)

(assert (=> b!556559 (= e!320626 e!320624)))

(declare-fun res!348977 () Bool)

(assert (=> b!556559 (=> (not res!348977) (not e!320624))))

(declare-datatypes ((SeekEntryResult!5297 0))(
  ( (MissingZero!5297 (index!23415 (_ BitVec 32))) (Found!5297 (index!23416 (_ BitVec 32))) (Intermediate!5297 (undefined!6109 Bool) (index!23417 (_ BitVec 32)) (x!52307 (_ BitVec 32))) (Undefined!5297) (MissingVacant!5297 (index!23418 (_ BitVec 32))) )
))
(declare-fun lt!252919 () SeekEntryResult!5297)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!556559 (= res!348977 (or (= lt!252919 (MissingZero!5297 i!1132)) (= lt!252919 (MissingVacant!5297 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!35077 0))(
  ( (array!35078 (arr!16848 (Array (_ BitVec 32) (_ BitVec 64))) (size!17212 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35077)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35077 (_ BitVec 32)) SeekEntryResult!5297)

(assert (=> b!556559 (= lt!252919 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!556560 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun e!320628 () Bool)

(assert (=> b!556560 (= e!320628 (= (seekEntryOrOpen!0 (select (arr!16848 a!3118) j!142) a!3118 mask!3119) (Found!5297 j!142)))))

(declare-fun b!556561 () Bool)

(declare-fun res!348972 () Bool)

(assert (=> b!556561 (=> (not res!348972) (not e!320624))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35077 (_ BitVec 32)) Bool)

(assert (=> b!556561 (= res!348972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!556562 () Bool)

(declare-fun res!348973 () Bool)

(assert (=> b!556562 (=> (not res!348973) (not e!320626))))

(declare-fun arrayContainsKey!0 (array!35077 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!556562 (= res!348973 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!556563 () Bool)

(declare-fun res!348978 () Bool)

(assert (=> b!556563 (=> (not res!348978) (not e!320626))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!556563 (= res!348978 (validKeyInArray!0 k!1914))))

(declare-fun b!556565 () Bool)

(declare-fun res!348971 () Bool)

(assert (=> b!556565 (=> (not res!348971) (not e!320626))))

(assert (=> b!556565 (= res!348971 (and (= (size!17212 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17212 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17212 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!556566 () Bool)

(declare-fun e!320627 () Bool)

(declare-fun lt!252918 () SeekEntryResult!5297)

(assert (=> b!556566 (= e!320627 (not (or (not (is-Intermediate!5297 lt!252918)) (undefined!6109 lt!252918) (= (select (arr!16848 a!3118) (index!23417 lt!252918)) (select (arr!16848 a!3118) j!142)) (= (select (arr!16848 a!3118) (index!23417 lt!252918)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000) (and (bvsge (index!23417 lt!252918) #b00000000000000000000000000000000) (bvslt (index!23417 lt!252918) (bvadd #b00000000000000000000000000000001 mask!3119))))))))

(assert (=> b!556566 e!320628))

(declare-fun res!348974 () Bool)

(assert (=> b!556566 (=> (not res!348974) (not e!320628))))

(assert (=> b!556566 (= res!348974 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17368 0))(
  ( (Unit!17369) )
))
(declare-fun lt!252920 () Unit!17368)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35077 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17368)

(assert (=> b!556566 (= lt!252920 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!348980 () Bool)

(assert (=> start!50852 (=> (not res!348980) (not e!320626))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50852 (= res!348980 (validMask!0 mask!3119))))

(assert (=> start!50852 e!320626))

(assert (=> start!50852 true))

(declare-fun array_inv!12644 (array!35077) Bool)

(assert (=> start!50852 (array_inv!12644 a!3118)))

(declare-fun b!556564 () Bool)

(declare-fun res!348976 () Bool)

(assert (=> b!556564 (=> (not res!348976) (not e!320624))))

(declare-datatypes ((List!10928 0))(
  ( (Nil!10925) (Cons!10924 (h!11909 (_ BitVec 64)) (t!17156 List!10928)) )
))
(declare-fun arrayNoDuplicates!0 (array!35077 (_ BitVec 32) List!10928) Bool)

(assert (=> b!556564 (= res!348976 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10925))))

(declare-fun b!556567 () Bool)

(declare-fun res!348979 () Bool)

(assert (=> b!556567 (=> (not res!348979) (not e!320626))))

(assert (=> b!556567 (= res!348979 (validKeyInArray!0 (select (arr!16848 a!3118) j!142)))))

(declare-fun b!556568 () Bool)

(assert (=> b!556568 (= e!320624 e!320627)))

(declare-fun res!348975 () Bool)

(assert (=> b!556568 (=> (not res!348975) (not e!320627))))

(declare-fun lt!252922 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35077 (_ BitVec 32)) SeekEntryResult!5297)

(assert (=> b!556568 (= res!348975 (= lt!252918 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252922 (select (store (arr!16848 a!3118) i!1132 k!1914) j!142) (array!35078 (store (arr!16848 a!3118) i!1132 k!1914) (size!17212 a!3118)) mask!3119)))))

(declare-fun lt!252921 () (_ BitVec 32))

(assert (=> b!556568 (= lt!252918 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252921 (select (arr!16848 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556568 (= lt!252922 (toIndex!0 (select (store (arr!16848 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!556568 (= lt!252921 (toIndex!0 (select (arr!16848 a!3118) j!142) mask!3119))))

(assert (= (and start!50852 res!348980) b!556565))

(assert (= (and b!556565 res!348971) b!556567))

(assert (= (and b!556567 res!348979) b!556563))

(assert (= (and b!556563 res!348978) b!556562))

(assert (= (and b!556562 res!348973) b!556559))

(assert (= (and b!556559 res!348977) b!556561))

(assert (= (and b!556561 res!348972) b!556564))

(assert (= (and b!556564 res!348976) b!556568))

(assert (= (and b!556568 res!348975) b!556566))

(assert (= (and b!556566 res!348974) b!556560))

(declare-fun m!534579 () Bool)

(assert (=> start!50852 m!534579))

(declare-fun m!534581 () Bool)

(assert (=> start!50852 m!534581))

(declare-fun m!534583 () Bool)

(assert (=> b!556566 m!534583))

(declare-fun m!534585 () Bool)

(assert (=> b!556566 m!534585))

(declare-fun m!534587 () Bool)

(assert (=> b!556566 m!534587))

(declare-fun m!534589 () Bool)

(assert (=> b!556566 m!534589))

(declare-fun m!534591 () Bool)

(assert (=> b!556564 m!534591))

(declare-fun m!534593 () Bool)

(assert (=> b!556561 m!534593))

(assert (=> b!556568 m!534585))

(declare-fun m!534595 () Bool)

(assert (=> b!556568 m!534595))

(assert (=> b!556568 m!534585))

(declare-fun m!534597 () Bool)

(assert (=> b!556568 m!534597))

(declare-fun m!534599 () Bool)

(assert (=> b!556568 m!534599))

(assert (=> b!556568 m!534585))

(declare-fun m!534601 () Bool)

(assert (=> b!556568 m!534601))

(assert (=> b!556568 m!534597))

(declare-fun m!534603 () Bool)

(assert (=> b!556568 m!534603))

(assert (=> b!556568 m!534597))

(declare-fun m!534605 () Bool)

(assert (=> b!556568 m!534605))

(assert (=> b!556560 m!534585))

(assert (=> b!556560 m!534585))

(declare-fun m!534607 () Bool)

(assert (=> b!556560 m!534607))

(declare-fun m!534609 () Bool)

(assert (=> b!556563 m!534609))

(assert (=> b!556567 m!534585))

(assert (=> b!556567 m!534585))

(declare-fun m!534611 () Bool)

(assert (=> b!556567 m!534611))

(declare-fun m!534613 () Bool)

(assert (=> b!556562 m!534613))

(declare-fun m!534615 () Bool)

(assert (=> b!556559 m!534615))

(push 1)

(assert (not b!556564))

(assert (not b!556560))

(assert (not b!556566))

(assert (not b!556568))

(assert (not b!556562))

(assert (not b!556563))

(assert (not start!50852))

(assert (not b!556559))

(assert (not b!556567))

(assert (not b!556561))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!556699 () Bool)

(declare-fun e!320703 () SeekEntryResult!5297)

(declare-fun lt!252982 () SeekEntryResult!5297)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35077 (_ BitVec 32)) SeekEntryResult!5297)

(assert (=> b!556699 (= e!320703 (seekKeyOrZeroReturnVacant!0 (x!52307 lt!252982) (index!23417 lt!252982) (index!23417 lt!252982) k!1914 a!3118 mask!3119))))

(declare-fun d!83295 () Bool)

(declare-fun lt!252984 () SeekEntryResult!5297)

(assert (=> d!83295 (and (or (is-Undefined!5297 lt!252984) (not (is-Found!5297 lt!252984)) (and (bvsge (index!23416 lt!252984) #b00000000000000000000000000000000) (bvslt (index!23416 lt!252984) (size!17212 a!3118)))) (or (is-Undefined!5297 lt!252984) (is-Found!5297 lt!252984) (not (is-MissingZero!5297 lt!252984)) (and (bvsge (index!23415 lt!252984) #b00000000000000000000000000000000) (bvslt (index!23415 lt!252984) (size!17212 a!3118)))) (or (is-Undefined!5297 lt!252984) (is-Found!5297 lt!252984) (is-MissingZero!5297 lt!252984) (not (is-MissingVacant!5297 lt!252984)) (and (bvsge (index!23418 lt!252984) #b00000000000000000000000000000000) (bvslt (index!23418 lt!252984) (size!17212 a!3118)))) (or (is-Undefined!5297 lt!252984) (ite (is-Found!5297 lt!252984) (= (select (arr!16848 a!3118) (index!23416 lt!252984)) k!1914) (ite (is-MissingZero!5297 lt!252984) (= (select (arr!16848 a!3118) (index!23415 lt!252984)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5297 lt!252984) (= (select (arr!16848 a!3118) (index!23418 lt!252984)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!320704 () SeekEntryResult!5297)

(assert (=> d!83295 (= lt!252984 e!320704)))

(declare-fun c!64155 () Bool)

(assert (=> d!83295 (= c!64155 (and (is-Intermediate!5297 lt!252982) (undefined!6109 lt!252982)))))

(assert (=> d!83295 (= lt!252982 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!83295 (validMask!0 mask!3119)))

(assert (=> d!83295 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!252984)))

(declare-fun b!556700 () Bool)

(assert (=> b!556700 (= e!320704 Undefined!5297)))

(declare-fun b!556701 () Bool)

(declare-fun c!64154 () Bool)

(declare-fun lt!252983 () (_ BitVec 64))

(assert (=> b!556701 (= c!64154 (= lt!252983 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!320705 () SeekEntryResult!5297)

(assert (=> b!556701 (= e!320705 e!320703)))

(declare-fun b!556702 () Bool)

(assert (=> b!556702 (= e!320703 (MissingZero!5297 (index!23417 lt!252982)))))

(declare-fun b!556703 () Bool)

(assert (=> b!556703 (= e!320705 (Found!5297 (index!23417 lt!252982)))))

(declare-fun b!556704 () Bool)

(assert (=> b!556704 (= e!320704 e!320705)))

(assert (=> b!556704 (= lt!252983 (select (arr!16848 a!3118) (index!23417 lt!252982)))))

(declare-fun c!64153 () Bool)

(assert (=> b!556704 (= c!64153 (= lt!252983 k!1914))))

(assert (= (and d!83295 c!64155) b!556700))

(assert (= (and d!83295 (not c!64155)) b!556704))

(assert (= (and b!556704 c!64153) b!556703))

(assert (= (and b!556704 (not c!64153)) b!556701))

(assert (= (and b!556701 c!64154) b!556702))

(assert (= (and b!556701 (not c!64154)) b!556699))

(declare-fun m!534733 () Bool)

(assert (=> b!556699 m!534733))

(declare-fun m!534735 () Bool)

(assert (=> d!83295 m!534735))

(declare-fun m!534737 () Bool)

(assert (=> d!83295 m!534737))

(declare-fun m!534739 () Bool)

(assert (=> d!83295 m!534739))

(assert (=> d!83295 m!534579))

(assert (=> d!83295 m!534737))

(declare-fun m!534741 () Bool)

(assert (=> d!83295 m!534741))

(declare-fun m!534743 () Bool)

(assert (=> d!83295 m!534743))

(declare-fun m!534745 () Bool)

(assert (=> b!556704 m!534745))

(assert (=> b!556559 d!83295))

(declare-fun b!556717 () Bool)

(declare-fun e!320716 () Bool)

(declare-fun e!320714 () Bool)

(assert (=> b!556717 (= e!320716 e!320714)))

(declare-fun res!349075 () Bool)

(assert (=> b!556717 (=> (not res!349075) (not e!320714))))

(declare-fun e!320715 () Bool)

(assert (=> b!556717 (= res!349075 (not e!320715))))

(declare-fun res!349076 () Bool)

(assert (=> b!556717 (=> (not res!349076) (not e!320715))))

(assert (=> b!556717 (= res!349076 (validKeyInArray!0 (select (arr!16848 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!83305 () Bool)

(declare-fun res!349074 () Bool)

(assert (=> d!83305 (=> res!349074 e!320716)))

(assert (=> d!83305 (= res!349074 (bvsge #b00000000000000000000000000000000 (size!17212 a!3118)))))

(assert (=> d!83305 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10925) e!320716)))

(declare-fun b!556718 () Bool)

(declare-fun e!320717 () Bool)

(assert (=> b!556718 (= e!320714 e!320717)))

(declare-fun c!64158 () Bool)

(assert (=> b!556718 (= c!64158 (validKeyInArray!0 (select (arr!16848 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!556719 () Bool)

(declare-fun contains!2845 (List!10928 (_ BitVec 64)) Bool)

(assert (=> b!556719 (= e!320715 (contains!2845 Nil!10925 (select (arr!16848 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!556720 () Bool)

(declare-fun call!32337 () Bool)

(assert (=> b!556720 (= e!320717 call!32337)))

(declare-fun bm!32334 () Bool)

(assert (=> bm!32334 (= call!32337 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64158 (Cons!10924 (select (arr!16848 a!3118) #b00000000000000000000000000000000) Nil!10925) Nil!10925)))))

(declare-fun b!556721 () Bool)

(assert (=> b!556721 (= e!320717 call!32337)))

(assert (= (and d!83305 (not res!349074)) b!556717))

(assert (= (and b!556717 res!349076) b!556719))

(assert (= (and b!556717 res!349075) b!556718))

(assert (= (and b!556718 c!64158) b!556721))

(assert (= (and b!556718 (not c!64158)) b!556720))

(assert (= (or b!556721 b!556720) bm!32334))

(declare-fun m!534747 () Bool)

(assert (=> b!556717 m!534747))

(assert (=> b!556717 m!534747))

(declare-fun m!534749 () Bool)

(assert (=> b!556717 m!534749))

(assert (=> b!556718 m!534747))

(assert (=> b!556718 m!534747))

(assert (=> b!556718 m!534749))

(assert (=> b!556719 m!534747))

(assert (=> b!556719 m!534747))

(declare-fun m!534751 () Bool)

(assert (=> b!556719 m!534751))

(assert (=> bm!32334 m!534747))

(declare-fun m!534753 () Bool)

(assert (=> bm!32334 m!534753))

(assert (=> b!556564 d!83305))

(declare-fun b!556738 () Bool)

(declare-fun lt!252997 () SeekEntryResult!5297)

(declare-fun e!320730 () SeekEntryResult!5297)

(assert (=> b!556738 (= e!320730 (seekKeyOrZeroReturnVacant!0 (x!52307 lt!252997) (index!23417 lt!252997) (index!23417 lt!252997) (select (arr!16848 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!83311 () Bool)

(declare-fun lt!252999 () SeekEntryResult!5297)

(assert (=> d!83311 (and (or (is-Undefined!5297 lt!252999) (not (is-Found!5297 lt!252999)) (and (bvsge (index!23416 lt!252999) #b00000000000000000000000000000000) (bvslt (index!23416 lt!252999) (size!17212 a!3118)))) (or (is-Undefined!5297 lt!252999) (is-Found!5297 lt!252999) (not (is-MissingZero!5297 lt!252999)) (and (bvsge (index!23415 lt!252999) #b00000000000000000000000000000000) (bvslt (index!23415 lt!252999) (size!17212 a!3118)))) (or (is-Undefined!5297 lt!252999) (is-Found!5297 lt!252999) (is-MissingZero!5297 lt!252999) (not (is-MissingVacant!5297 lt!252999)) (and (bvsge (index!23418 lt!252999) #b00000000000000000000000000000000) (bvslt (index!23418 lt!252999) (size!17212 a!3118)))) (or (is-Undefined!5297 lt!252999) (ite (is-Found!5297 lt!252999) (= (select (arr!16848 a!3118) (index!23416 lt!252999)) (select (arr!16848 a!3118) j!142)) (ite (is-MissingZero!5297 lt!252999) (= (select (arr!16848 a!3118) (index!23415 lt!252999)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5297 lt!252999) (= (select (arr!16848 a!3118) (index!23418 lt!252999)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!320731 () SeekEntryResult!5297)

(assert (=> d!83311 (= lt!252999 e!320731)))

(declare-fun c!64167 () Bool)

(assert (=> d!83311 (= c!64167 (and (is-Intermediate!5297 lt!252997) (undefined!6109 lt!252997)))))

(assert (=> d!83311 (= lt!252997 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16848 a!3118) j!142) mask!3119) (select (arr!16848 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83311 (validMask!0 mask!3119)))

(assert (=> d!83311 (= (seekEntryOrOpen!0 (select (arr!16848 a!3118) j!142) a!3118 mask!3119) lt!252999)))

(declare-fun b!556739 () Bool)

(assert (=> b!556739 (= e!320731 Undefined!5297)))

(declare-fun b!556740 () Bool)

(declare-fun c!64166 () Bool)

(declare-fun lt!252998 () (_ BitVec 64))

(assert (=> b!556740 (= c!64166 (= lt!252998 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!320732 () SeekEntryResult!5297)

(assert (=> b!556740 (= e!320732 e!320730)))

(declare-fun b!556741 () Bool)

(assert (=> b!556741 (= e!320730 (MissingZero!5297 (index!23417 lt!252997)))))

(declare-fun b!556742 () Bool)

(assert (=> b!556742 (= e!320732 (Found!5297 (index!23417 lt!252997)))))

(declare-fun b!556743 () Bool)

(assert (=> b!556743 (= e!320731 e!320732)))

(assert (=> b!556743 (= lt!252998 (select (arr!16848 a!3118) (index!23417 lt!252997)))))

(declare-fun c!64165 () Bool)

(assert (=> b!556743 (= c!64165 (= lt!252998 (select (arr!16848 a!3118) j!142)))))

(assert (= (and d!83311 c!64167) b!556739))

(assert (= (and d!83311 (not c!64167)) b!556743))

(assert (= (and b!556743 c!64165) b!556742))

(assert (= (and b!556743 (not c!64165)) b!556740))

(assert (= (and b!556740 c!64166) b!556741))

(assert (= (and b!556740 (not c!64166)) b!556738))

(assert (=> b!556738 m!534585))

(declare-fun m!534755 () Bool)

(assert (=> b!556738 m!534755))

(declare-fun m!534757 () Bool)

(assert (=> d!83311 m!534757))

(assert (=> d!83311 m!534585))

(assert (=> d!83311 m!534595))

(declare-fun m!534759 () Bool)

(assert (=> d!83311 m!534759))

(assert (=> d!83311 m!534579))

(assert (=> d!83311 m!534595))

(assert (=> d!83311 m!534585))

(declare-fun m!534761 () Bool)

(assert (=> d!83311 m!534761))

(declare-fun m!534763 () Bool)

(assert (=> d!83311 m!534763))

(declare-fun m!534765 () Bool)

(assert (=> b!556743 m!534765))

(assert (=> b!556560 d!83311))

(declare-fun b!556785 () Bool)

(declare-fun e!320760 () Bool)

(declare-fun call!32343 () Bool)

(assert (=> b!556785 (= e!320760 call!32343)))

(declare-fun b!556786 () Bool)

(declare-fun e!320759 () Bool)

(assert (=> b!556786 (= e!320759 call!32343)))

(declare-fun d!83313 () Bool)

(declare-fun res!349103 () Bool)

(declare-fun e!320761 () Bool)

(assert (=> d!83313 (=> res!349103 e!320761)))

(assert (=> d!83313 (= res!349103 (bvsge #b00000000000000000000000000000000 (size!17212 a!3118)))))

(assert (=> d!83313 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!320761)))

(declare-fun b!556787 () Bool)

(assert (=> b!556787 (= e!320759 e!320760)))

(declare-fun lt!253012 () (_ BitVec 64))

(assert (=> b!556787 (= lt!253012 (select (arr!16848 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!253011 () Unit!17368)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35077 (_ BitVec 64) (_ BitVec 32)) Unit!17368)

(assert (=> b!556787 (= lt!253011 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!253012 #b00000000000000000000000000000000))))

(assert (=> b!556787 (arrayContainsKey!0 a!3118 lt!253012 #b00000000000000000000000000000000)))

(declare-fun lt!253010 () Unit!17368)

(assert (=> b!556787 (= lt!253010 lt!253011)))

(declare-fun res!349104 () Bool)

(assert (=> b!556787 (= res!349104 (= (seekEntryOrOpen!0 (select (arr!16848 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5297 #b00000000000000000000000000000000)))))

(assert (=> b!556787 (=> (not res!349104) (not e!320760))))

(declare-fun b!556788 () Bool)

(assert (=> b!556788 (= e!320761 e!320759)))

(declare-fun c!64179 () Bool)

(assert (=> b!556788 (= c!64179 (validKeyInArray!0 (select (arr!16848 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32340 () Bool)

(assert (=> bm!32340 (= call!32343 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!83313 (not res!349103)) b!556788))

(assert (= (and b!556788 c!64179) b!556787))

(assert (= (and b!556788 (not c!64179)) b!556786))

(assert (= (and b!556787 res!349104) b!556785))

(assert (= (or b!556785 b!556786) bm!32340))

(assert (=> b!556787 m!534747))

(declare-fun m!534787 () Bool)

(assert (=> b!556787 m!534787))

(declare-fun m!534789 () Bool)

(assert (=> b!556787 m!534789))

(assert (=> b!556787 m!534747))

(declare-fun m!534791 () Bool)

(assert (=> b!556787 m!534791))

(assert (=> b!556788 m!534747))

(assert (=> b!556788 m!534747))

(assert (=> b!556788 m!534749))

(declare-fun m!534793 () Bool)

(assert (=> bm!32340 m!534793))

(assert (=> b!556561 d!83313))

(declare-fun b!556789 () Bool)

(declare-fun e!320763 () Bool)

(declare-fun call!32344 () Bool)

(assert (=> b!556789 (= e!320763 call!32344)))

(declare-fun b!556790 () Bool)

(declare-fun e!320762 () Bool)

(assert (=> b!556790 (= e!320762 call!32344)))

(declare-fun d!83321 () Bool)

(declare-fun res!349105 () Bool)

(declare-fun e!320764 () Bool)

(assert (=> d!83321 (=> res!349105 e!320764)))

(assert (=> d!83321 (= res!349105 (bvsge j!142 (size!17212 a!3118)))))

(assert (=> d!83321 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!320764)))

(declare-fun b!556791 () Bool)

(assert (=> b!556791 (= e!320762 e!320763)))

(declare-fun lt!253015 () (_ BitVec 64))

(assert (=> b!556791 (= lt!253015 (select (arr!16848 a!3118) j!142))))

(declare-fun lt!253014 () Unit!17368)

(assert (=> b!556791 (= lt!253014 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!253015 j!142))))

(assert (=> b!556791 (arrayContainsKey!0 a!3118 lt!253015 #b00000000000000000000000000000000)))

(declare-fun lt!253013 () Unit!17368)

(assert (=> b!556791 (= lt!253013 lt!253014)))

(declare-fun res!349106 () Bool)

(assert (=> b!556791 (= res!349106 (= (seekEntryOrOpen!0 (select (arr!16848 a!3118) j!142) a!3118 mask!3119) (Found!5297 j!142)))))

(assert (=> b!556791 (=> (not res!349106) (not e!320763))))

(declare-fun b!556792 () Bool)

(assert (=> b!556792 (= e!320764 e!320762)))

(declare-fun c!64180 () Bool)

(assert (=> b!556792 (= c!64180 (validKeyInArray!0 (select (arr!16848 a!3118) j!142)))))

(declare-fun bm!32341 () Bool)

(assert (=> bm!32341 (= call!32344 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!83321 (not res!349105)) b!556792))

(assert (= (and b!556792 c!64180) b!556791))

(assert (= (and b!556792 (not c!64180)) b!556790))

(assert (= (and b!556791 res!349106) b!556789))

(assert (= (or b!556789 b!556790) bm!32341))

(assert (=> b!556791 m!534585))

(declare-fun m!534795 () Bool)

(assert (=> b!556791 m!534795))

(declare-fun m!534797 () Bool)

(assert (=> b!556791 m!534797))

(assert (=> b!556791 m!534585))

(assert (=> b!556791 m!534607))

(assert (=> b!556792 m!534585))

(assert (=> b!556792 m!534585))

(assert (=> b!556792 m!534611))

(declare-fun m!534799 () Bool)

(assert (=> bm!32341 m!534799))

(assert (=> b!556566 d!83321))

(declare-fun d!83323 () Bool)

(assert (=> d!83323 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!253026 () Unit!17368)

(declare-fun choose!38 (array!35077 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17368)

(assert (=> d!83323 (= lt!253026 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!83323 (validMask!0 mask!3119)))

(assert (=> d!83323 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!253026)))

(declare-fun bs!17342 () Bool)

(assert (= bs!17342 d!83323))

(assert (=> bs!17342 m!534587))

(declare-fun m!534801 () Bool)

(assert (=> bs!17342 m!534801))

(assert (=> bs!17342 m!534579))

(assert (=> b!556566 d!83323))

(declare-fun d!83331 () Bool)

(assert (=> d!83331 (= (validKeyInArray!0 (select (arr!16848 a!3118) j!142)) (and (not (= (select (arr!16848 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16848 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!556567 d!83331))

(declare-fun d!83333 () Bool)

(declare-fun res!349111 () Bool)

(declare-fun e!320775 () Bool)

(assert (=> d!83333 (=> res!349111 e!320775)))

(assert (=> d!83333 (= res!349111 (= (select (arr!16848 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!83333 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!320775)))

(declare-fun b!556809 () Bool)

(declare-fun e!320776 () Bool)

(assert (=> b!556809 (= e!320775 e!320776)))

(declare-fun res!349112 () Bool)

(assert (=> b!556809 (=> (not res!349112) (not e!320776))))

(assert (=> b!556809 (= res!349112 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17212 a!3118)))))

(declare-fun b!556810 () Bool)

(assert (=> b!556810 (= e!320776 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83333 (not res!349111)) b!556809))

(assert (= (and b!556809 res!349112) b!556810))

(assert (=> d!83333 m!534747))

(declare-fun m!534803 () Bool)

(assert (=> b!556810 m!534803))

(assert (=> b!556562 d!83333))

(declare-fun d!83335 () Bool)

(assert (=> d!83335 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!556563 d!83335))

(declare-fun e!320818 () SeekEntryResult!5297)

(declare-fun b!556875 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556875 (= e!320818 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!252922 #b00000000000000000000000000000000 mask!3119) (select (store (arr!16848 a!3118) i!1132 k!1914) j!142) (array!35078 (store (arr!16848 a!3118) i!1132 k!1914) (size!17212 a!3118)) mask!3119))))

(declare-fun lt!253052 () SeekEntryResult!5297)

(declare-fun b!556876 () Bool)

(assert (=> b!556876 (and (bvsge (index!23417 lt!253052) #b00000000000000000000000000000000) (bvslt (index!23417 lt!253052) (size!17212 (array!35078 (store (arr!16848 a!3118) i!1132 k!1914) (size!17212 a!3118)))))))

(declare-fun res!349132 () Bool)

(assert (=> b!556876 (= res!349132 (= (select (arr!16848 (array!35078 (store (arr!16848 a!3118) i!1132 k!1914) (size!17212 a!3118))) (index!23417 lt!253052)) (select (store (arr!16848 a!3118) i!1132 k!1914) j!142)))))

(declare-fun e!320819 () Bool)

(assert (=> b!556876 (=> res!349132 e!320819)))

(declare-fun e!320816 () Bool)

(assert (=> b!556876 (= e!320816 e!320819)))

(declare-fun b!556877 () Bool)

(declare-fun e!320820 () SeekEntryResult!5297)

(assert (=> b!556877 (= e!320820 e!320818)))

(declare-fun c!64210 () Bool)

(declare-fun lt!253053 () (_ BitVec 64))

(assert (=> b!556877 (= c!64210 (or (= lt!253053 (select (store (arr!16848 a!3118) i!1132 k!1914) j!142)) (= (bvadd lt!253053 lt!253053) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!83337 () Bool)

(declare-fun e!320817 () Bool)

(assert (=> d!83337 e!320817))

(declare-fun c!64211 () Bool)

(assert (=> d!83337 (= c!64211 (and (is-Intermediate!5297 lt!253052) (undefined!6109 lt!253052)))))

(assert (=> d!83337 (= lt!253052 e!320820)))

(declare-fun c!64212 () Bool)

(assert (=> d!83337 (= c!64212 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!83337 (= lt!253053 (select (arr!16848 (array!35078 (store (arr!16848 a!3118) i!1132 k!1914) (size!17212 a!3118))) lt!252922))))

(assert (=> d!83337 (validMask!0 mask!3119)))

(assert (=> d!83337 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252922 (select (store (arr!16848 a!3118) i!1132 k!1914) j!142) (array!35078 (store (arr!16848 a!3118) i!1132 k!1914) (size!17212 a!3118)) mask!3119) lt!253052)))

(declare-fun b!556878 () Bool)

(assert (=> b!556878 (= e!320817 (bvsge (x!52307 lt!253052) #b01111111111111111111111111111110))))

(declare-fun b!556879 () Bool)

(assert (=> b!556879 (= e!320820 (Intermediate!5297 true lt!252922 #b00000000000000000000000000000000))))

(declare-fun b!556880 () Bool)

(assert (=> b!556880 (and (bvsge (index!23417 lt!253052) #b00000000000000000000000000000000) (bvslt (index!23417 lt!253052) (size!17212 (array!35078 (store (arr!16848 a!3118) i!1132 k!1914) (size!17212 a!3118)))))))

(assert (=> b!556880 (= e!320819 (= (select (arr!16848 (array!35078 (store (arr!16848 a!3118) i!1132 k!1914) (size!17212 a!3118))) (index!23417 lt!253052)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!556881 () Bool)

(assert (=> b!556881 (= e!320817 e!320816)))

(declare-fun res!349133 () Bool)

(assert (=> b!556881 (= res!349133 (and (is-Intermediate!5297 lt!253052) (not (undefined!6109 lt!253052)) (bvslt (x!52307 lt!253052) #b01111111111111111111111111111110) (bvsge (x!52307 lt!253052) #b00000000000000000000000000000000) (bvsge (x!52307 lt!253052) #b00000000000000000000000000000000)))))

(assert (=> b!556881 (=> (not res!349133) (not e!320816))))

(declare-fun b!556882 () Bool)

(assert (=> b!556882 (= e!320818 (Intermediate!5297 false lt!252922 #b00000000000000000000000000000000))))

(declare-fun b!556883 () Bool)

(assert (=> b!556883 (and (bvsge (index!23417 lt!253052) #b00000000000000000000000000000000) (bvslt (index!23417 lt!253052) (size!17212 (array!35078 (store (arr!16848 a!3118) i!1132 k!1914) (size!17212 a!3118)))))))

(declare-fun res!349131 () Bool)

(assert (=> b!556883 (= res!349131 (= (select (arr!16848 (array!35078 (store (arr!16848 a!3118) i!1132 k!1914) (size!17212 a!3118))) (index!23417 lt!253052)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!556883 (=> res!349131 e!320819)))

(assert (= (and d!83337 c!64212) b!556879))

(assert (= (and d!83337 (not c!64212)) b!556877))

(assert (= (and b!556877 c!64210) b!556882))

(assert (= (and b!556877 (not c!64210)) b!556875))

(assert (= (and d!83337 c!64211) b!556878))

(assert (= (and d!83337 (not c!64211)) b!556881))

(assert (= (and b!556881 res!349133) b!556876))

(assert (= (and b!556876 (not res!349132)) b!556883))

(assert (= (and b!556883 (not res!349131)) b!556880))

(declare-fun m!534849 () Bool)

(assert (=> d!83337 m!534849))

(assert (=> d!83337 m!534579))

(declare-fun m!534853 () Bool)

(assert (=> b!556880 m!534853))

(assert (=> b!556883 m!534853))

(declare-fun m!534855 () Bool)

(assert (=> b!556875 m!534855))

(assert (=> b!556875 m!534855))

(assert (=> b!556875 m!534597))

(declare-fun m!534859 () Bool)

(assert (=> b!556875 m!534859))

(assert (=> b!556876 m!534853))

(assert (=> b!556568 d!83337))

(declare-fun e!320827 () SeekEntryResult!5297)

(declare-fun b!556889 () Bool)

(assert (=> b!556889 (= e!320827 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!252921 #b00000000000000000000000000000000 mask!3119) (select (arr!16848 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!556890 () Bool)

(declare-fun lt!253054 () SeekEntryResult!5297)

(assert (=> b!556890 (and (bvsge (index!23417 lt!253054) #b00000000000000000000000000000000) (bvslt (index!23417 lt!253054) (size!17212 a!3118)))))

(declare-fun res!349138 () Bool)

(assert (=> b!556890 (= res!349138 (= (select (arr!16848 a!3118) (index!23417 lt!253054)) (select (arr!16848 a!3118) j!142)))))

(declare-fun e!320828 () Bool)

(assert (=> b!556890 (=> res!349138 e!320828)))

(declare-fun e!320825 () Bool)

(assert (=> b!556890 (= e!320825 e!320828)))

(declare-fun b!556891 () Bool)

(declare-fun e!320829 () SeekEntryResult!5297)

(assert (=> b!556891 (= e!320829 e!320827)))

(declare-fun c!64214 () Bool)

(declare-fun lt!253055 () (_ BitVec 64))

(assert (=> b!556891 (= c!64214 (or (= lt!253055 (select (arr!16848 a!3118) j!142)) (= (bvadd lt!253055 lt!253055) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!83357 () Bool)

(declare-fun e!320826 () Bool)

(assert (=> d!83357 e!320826))

(declare-fun c!64215 () Bool)

(assert (=> d!83357 (= c!64215 (and (is-Intermediate!5297 lt!253054) (undefined!6109 lt!253054)))))

(assert (=> d!83357 (= lt!253054 e!320829)))

(declare-fun c!64216 () Bool)

(assert (=> d!83357 (= c!64216 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!83357 (= lt!253055 (select (arr!16848 a!3118) lt!252921))))

(assert (=> d!83357 (validMask!0 mask!3119)))

(assert (=> d!83357 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252921 (select (arr!16848 a!3118) j!142) a!3118 mask!3119) lt!253054)))

(declare-fun b!556892 () Bool)

(assert (=> b!556892 (= e!320826 (bvsge (x!52307 lt!253054) #b01111111111111111111111111111110))))

(declare-fun b!556893 () Bool)

(assert (=> b!556893 (= e!320829 (Intermediate!5297 true lt!252921 #b00000000000000000000000000000000))))

(declare-fun b!556894 () Bool)

(assert (=> b!556894 (and (bvsge (index!23417 lt!253054) #b00000000000000000000000000000000) (bvslt (index!23417 lt!253054) (size!17212 a!3118)))))

(assert (=> b!556894 (= e!320828 (= (select (arr!16848 a!3118) (index!23417 lt!253054)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!556895 () Bool)

(assert (=> b!556895 (= e!320826 e!320825)))

(declare-fun res!349139 () Bool)

(assert (=> b!556895 (= res!349139 (and (is-Intermediate!5297 lt!253054) (not (undefined!6109 lt!253054)) (bvslt (x!52307 lt!253054) #b01111111111111111111111111111110) (bvsge (x!52307 lt!253054) #b00000000000000000000000000000000) (bvsge (x!52307 lt!253054) #b00000000000000000000000000000000)))))

(assert (=> b!556895 (=> (not res!349139) (not e!320825))))

(declare-fun b!556896 () Bool)

(assert (=> b!556896 (= e!320827 (Intermediate!5297 false lt!252921 #b00000000000000000000000000000000))))

(declare-fun b!556897 () Bool)

(assert (=> b!556897 (and (bvsge (index!23417 lt!253054) #b00000000000000000000000000000000) (bvslt (index!23417 lt!253054) (size!17212 a!3118)))))

(declare-fun res!349137 () Bool)

(assert (=> b!556897 (= res!349137 (= (select (arr!16848 a!3118) (index!23417 lt!253054)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!556897 (=> res!349137 e!320828)))

(assert (= (and d!83357 c!64216) b!556893))

(assert (= (and d!83357 (not c!64216)) b!556891))

(assert (= (and b!556891 c!64214) b!556896))

(assert (= (and b!556891 (not c!64214)) b!556889))

(assert (= (and d!83357 c!64215) b!556892))

(assert (= (and d!83357 (not c!64215)) b!556895))

(assert (= (and b!556895 res!349139) b!556890))

(assert (= (and b!556890 (not res!349138)) b!556897))

(assert (= (and b!556897 (not res!349137)) b!556894))

(declare-fun m!534861 () Bool)

(assert (=> d!83357 m!534861))

(assert (=> d!83357 m!534579))

(declare-fun m!534863 () Bool)

(assert (=> b!556894 m!534863))

(assert (=> b!556897 m!534863))

(declare-fun m!534865 () Bool)

(assert (=> b!556889 m!534865))

(assert (=> b!556889 m!534865))

(assert (=> b!556889 m!534585))

(declare-fun m!534867 () Bool)

(assert (=> b!556889 m!534867))

(assert (=> b!556890 m!534863))

(assert (=> b!556568 d!83357))

(declare-fun d!83359 () Bool)

(declare-fun lt!253061 () (_ BitVec 32))

(declare-fun lt!253060 () (_ BitVec 32))

(assert (=> d!83359 (= lt!253061 (bvmul (bvxor lt!253060 (bvlshr lt!253060 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83359 (= lt!253060 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16848 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!16848 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83359 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!349140 (let ((h!11914 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16848 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!16848 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52315 (bvmul (bvxor h!11914 (bvlshr h!11914 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52315 (bvlshr x!52315 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!349140 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!349140 #b00000000000000000000000000000000))))))

(assert (=> d!83359 (= (toIndex!0 (select (store (arr!16848 a!3118) i!1132 k!1914) j!142) mask!3119) (bvand (bvxor lt!253061 (bvlshr lt!253061 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!556568 d!83359))

(declare-fun d!83361 () Bool)

(declare-fun lt!253063 () (_ BitVec 32))

(declare-fun lt!253062 () (_ BitVec 32))

(assert (=> d!83361 (= lt!253063 (bvmul (bvxor lt!253062 (bvlshr lt!253062 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83361 (= lt!253062 ((_ extract 31 0) (bvand (bvxor (select (arr!16848 a!3118) j!142) (bvlshr (select (arr!16848 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83361 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!349140 (let ((h!11914 ((_ extract 31 0) (bvand (bvxor (select (arr!16848 a!3118) j!142) (bvlshr (select (arr!16848 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52315 (bvmul (bvxor h!11914 (bvlshr h!11914 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52315 (bvlshr x!52315 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!349140 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!349140 #b00000000000000000000000000000000))))))

(assert (=> d!83361 (= (toIndex!0 (select (arr!16848 a!3118) j!142) mask!3119) (bvand (bvxor lt!253063 (bvlshr lt!253063 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!556568 d!83361))

(declare-fun d!83363 () Bool)

(assert (=> d!83363 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!50852 d!83363))

(declare-fun d!83369 () Bool)

(assert (=> d!83369 (= (array_inv!12644 a!3118) (bvsge (size!17212 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!50852 d!83369))

(push 1)

(assert (not b!556889))

(assert (not d!83323))

(assert (not d!83357))

(assert (not b!556717))

(assert (not b!556810))

(assert (not b!556738))

(assert (not d!83295))

(assert (not b!556719))

(assert (not b!556791))

(assert (not b!556788))

(assert (not bm!32340))

(assert (not bm!32341))

(assert (not b!556718))

(assert (not d!83337))

(assert (not b!556699))

(assert (not d!83311))

(assert (not bm!32334))

(assert (not b!556792))

(assert (not b!556875))

(assert (not b!556787))

(check-sat)

(pop 1)

(push 1)

(check-sat)

