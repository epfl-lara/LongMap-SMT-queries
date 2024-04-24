; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51966 () Bool)

(assert start!51966)

(declare-fun b!567794 () Bool)

(declare-fun res!358277 () Bool)

(declare-fun e!326714 () Bool)

(assert (=> b!567794 (=> (not res!358277) (not e!326714))))

(declare-datatypes ((array!35607 0))(
  ( (array!35608 (arr!17098 (Array (_ BitVec 32) (_ BitVec 64))) (size!17462 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35607)

(declare-datatypes ((List!11085 0))(
  ( (Nil!11082) (Cons!11081 (h!12096 (_ BitVec 64)) (t!17305 List!11085)) )
))
(declare-fun arrayNoDuplicates!0 (array!35607 (_ BitVec 32) List!11085) Bool)

(assert (=> b!567794 (= res!358277 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11082))))

(declare-fun b!567795 () Bool)

(declare-fun res!358273 () Bool)

(assert (=> b!567795 (=> (not res!358273) (not e!326714))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35607 (_ BitVec 32)) Bool)

(assert (=> b!567795 (= res!358273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!567796 () Bool)

(declare-fun e!326711 () Bool)

(assert (=> b!567796 (= e!326711 e!326714)))

(declare-fun res!358282 () Bool)

(assert (=> b!567796 (=> (not res!358282) (not e!326714))))

(declare-datatypes ((SeekEntryResult!5503 0))(
  ( (MissingZero!5503 (index!24239 (_ BitVec 32))) (Found!5503 (index!24240 (_ BitVec 32))) (Intermediate!5503 (undefined!6315 Bool) (index!24241 (_ BitVec 32)) (x!53259 (_ BitVec 32))) (Undefined!5503) (MissingVacant!5503 (index!24242 (_ BitVec 32))) )
))
(declare-fun lt!258676 () SeekEntryResult!5503)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!567796 (= res!358282 (or (= lt!258676 (MissingZero!5503 i!1132)) (= lt!258676 (MissingVacant!5503 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35607 (_ BitVec 32)) SeekEntryResult!5503)

(assert (=> b!567796 (= lt!258676 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!567797 () Bool)

(declare-fun res!358279 () Bool)

(assert (=> b!567797 (=> (not res!358279) (not e!326711))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!567797 (= res!358279 (validKeyInArray!0 k0!1914))))

(declare-fun b!567798 () Bool)

(declare-fun res!358278 () Bool)

(assert (=> b!567798 (=> (not res!358278) (not e!326711))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!567798 (= res!358278 (validKeyInArray!0 (select (arr!17098 a!3118) j!142)))))

(declare-fun b!567799 () Bool)

(declare-fun res!358280 () Bool)

(assert (=> b!567799 (=> (not res!358280) (not e!326711))))

(declare-fun arrayContainsKey!0 (array!35607 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!567799 (= res!358280 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun e!326712 () Bool)

(declare-fun lt!258673 () array!35607)

(declare-fun lt!258674 () (_ BitVec 64))

(declare-fun lt!258672 () SeekEntryResult!5503)

(declare-fun b!567800 () Bool)

(assert (=> b!567800 (= e!326712 (= lt!258672 (seekEntryOrOpen!0 lt!258674 lt!258673 mask!3119)))))

(declare-fun b!567801 () Bool)

(declare-fun e!326715 () Bool)

(assert (=> b!567801 (= e!326714 e!326715)))

(declare-fun res!358276 () Bool)

(assert (=> b!567801 (=> (not res!358276) (not e!326715))))

(declare-fun lt!258675 () (_ BitVec 32))

(declare-fun lt!258671 () SeekEntryResult!5503)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35607 (_ BitVec 32)) SeekEntryResult!5503)

(assert (=> b!567801 (= res!358276 (= lt!258671 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258675 lt!258674 lt!258673 mask!3119)))))

(declare-fun lt!258669 () (_ BitVec 32))

(assert (=> b!567801 (= lt!258671 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258669 (select (arr!17098 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567801 (= lt!258675 (toIndex!0 lt!258674 mask!3119))))

(assert (=> b!567801 (= lt!258674 (select (store (arr!17098 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!567801 (= lt!258669 (toIndex!0 (select (arr!17098 a!3118) j!142) mask!3119))))

(assert (=> b!567801 (= lt!258673 (array!35608 (store (arr!17098 a!3118) i!1132 k0!1914) (size!17462 a!3118)))))

(declare-fun b!567802 () Bool)

(declare-fun res!358275 () Bool)

(assert (=> b!567802 (=> (not res!358275) (not e!326711))))

(assert (=> b!567802 (= res!358275 (and (= (size!17462 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17462 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17462 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!358281 () Bool)

(assert (=> start!51966 (=> (not res!358281) (not e!326711))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51966 (= res!358281 (validMask!0 mask!3119))))

(assert (=> start!51966 e!326711))

(assert (=> start!51966 true))

(declare-fun array_inv!12957 (array!35607) Bool)

(assert (=> start!51966 (array_inv!12957 a!3118)))

(declare-fun b!567793 () Bool)

(assert (=> b!567793 (= e!326715 (not e!326712))))

(declare-fun res!358274 () Bool)

(assert (=> b!567793 (=> res!358274 e!326712)))

(get-info :version)

(assert (=> b!567793 (= res!358274 (or (undefined!6315 lt!258671) (not ((_ is Intermediate!5503) lt!258671)) (not (= (select (arr!17098 a!3118) (index!24241 lt!258671)) (select (arr!17098 a!3118) j!142)))))))

(assert (=> b!567793 (= lt!258672 (Found!5503 j!142))))

(assert (=> b!567793 (= lt!258672 (seekEntryOrOpen!0 (select (arr!17098 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!567793 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17779 0))(
  ( (Unit!17780) )
))
(declare-fun lt!258670 () Unit!17779)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35607 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17779)

(assert (=> b!567793 (= lt!258670 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!51966 res!358281) b!567802))

(assert (= (and b!567802 res!358275) b!567798))

(assert (= (and b!567798 res!358278) b!567797))

(assert (= (and b!567797 res!358279) b!567799))

(assert (= (and b!567799 res!358280) b!567796))

(assert (= (and b!567796 res!358282) b!567795))

(assert (= (and b!567795 res!358273) b!567794))

(assert (= (and b!567794 res!358277) b!567801))

(assert (= (and b!567801 res!358276) b!567793))

(assert (= (and b!567793 (not res!358274)) b!567800))

(declare-fun m!546551 () Bool)

(assert (=> b!567793 m!546551))

(declare-fun m!546553 () Bool)

(assert (=> b!567793 m!546553))

(declare-fun m!546555 () Bool)

(assert (=> b!567793 m!546555))

(declare-fun m!546557 () Bool)

(assert (=> b!567793 m!546557))

(assert (=> b!567793 m!546551))

(declare-fun m!546559 () Bool)

(assert (=> b!567793 m!546559))

(declare-fun m!546561 () Bool)

(assert (=> b!567799 m!546561))

(assert (=> b!567798 m!546551))

(assert (=> b!567798 m!546551))

(declare-fun m!546563 () Bool)

(assert (=> b!567798 m!546563))

(declare-fun m!546565 () Bool)

(assert (=> b!567800 m!546565))

(assert (=> b!567801 m!546551))

(declare-fun m!546567 () Bool)

(assert (=> b!567801 m!546567))

(declare-fun m!546569 () Bool)

(assert (=> b!567801 m!546569))

(assert (=> b!567801 m!546551))

(declare-fun m!546571 () Bool)

(assert (=> b!567801 m!546571))

(assert (=> b!567801 m!546551))

(declare-fun m!546573 () Bool)

(assert (=> b!567801 m!546573))

(declare-fun m!546575 () Bool)

(assert (=> b!567801 m!546575))

(declare-fun m!546577 () Bool)

(assert (=> b!567801 m!546577))

(declare-fun m!546579 () Bool)

(assert (=> b!567794 m!546579))

(declare-fun m!546581 () Bool)

(assert (=> b!567797 m!546581))

(declare-fun m!546583 () Bool)

(assert (=> start!51966 m!546583))

(declare-fun m!546585 () Bool)

(assert (=> start!51966 m!546585))

(declare-fun m!546587 () Bool)

(assert (=> b!567796 m!546587))

(declare-fun m!546589 () Bool)

(assert (=> b!567795 m!546589))

(check-sat (not b!567800) (not b!567795) (not b!567798) (not b!567797) (not start!51966) (not b!567796) (not b!567799) (not b!567794) (not b!567801) (not b!567793))
(check-sat)
(get-model)

(declare-fun d!84401 () Bool)

(declare-fun res!358347 () Bool)

(declare-fun e!326750 () Bool)

(assert (=> d!84401 (=> res!358347 e!326750)))

(assert (=> d!84401 (= res!358347 (= (select (arr!17098 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!84401 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!326750)))

(declare-fun b!567867 () Bool)

(declare-fun e!326751 () Bool)

(assert (=> b!567867 (= e!326750 e!326751)))

(declare-fun res!358348 () Bool)

(assert (=> b!567867 (=> (not res!358348) (not e!326751))))

(assert (=> b!567867 (= res!358348 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17462 a!3118)))))

(declare-fun b!567868 () Bool)

(assert (=> b!567868 (= e!326751 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84401 (not res!358347)) b!567867))

(assert (= (and b!567867 res!358348) b!567868))

(declare-fun m!546671 () Bool)

(assert (=> d!84401 m!546671))

(declare-fun m!546673 () Bool)

(assert (=> b!567868 m!546673))

(assert (=> b!567799 d!84401))

(declare-fun d!84403 () Bool)

(assert (=> d!84403 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51966 d!84403))

(declare-fun d!84405 () Bool)

(assert (=> d!84405 (= (array_inv!12957 a!3118) (bvsge (size!17462 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51966 d!84405))

(declare-fun bm!32523 () Bool)

(declare-fun call!32526 () Bool)

(declare-fun c!65114 () Bool)

(assert (=> bm!32523 (= call!32526 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!65114 (Cons!11081 (select (arr!17098 a!3118) #b00000000000000000000000000000000) Nil!11082) Nil!11082)))))

(declare-fun d!84407 () Bool)

(declare-fun res!358356 () Bool)

(declare-fun e!326762 () Bool)

(assert (=> d!84407 (=> res!358356 e!326762)))

(assert (=> d!84407 (= res!358356 (bvsge #b00000000000000000000000000000000 (size!17462 a!3118)))))

(assert (=> d!84407 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11082) e!326762)))

(declare-fun b!567879 () Bool)

(declare-fun e!326763 () Bool)

(declare-fun e!326760 () Bool)

(assert (=> b!567879 (= e!326763 e!326760)))

(assert (=> b!567879 (= c!65114 (validKeyInArray!0 (select (arr!17098 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!567880 () Bool)

(assert (=> b!567880 (= e!326760 call!32526)))

(declare-fun b!567881 () Bool)

(assert (=> b!567881 (= e!326760 call!32526)))

(declare-fun b!567882 () Bool)

(assert (=> b!567882 (= e!326762 e!326763)))

(declare-fun res!358355 () Bool)

(assert (=> b!567882 (=> (not res!358355) (not e!326763))))

(declare-fun e!326761 () Bool)

(assert (=> b!567882 (= res!358355 (not e!326761))))

(declare-fun res!358357 () Bool)

(assert (=> b!567882 (=> (not res!358357) (not e!326761))))

(assert (=> b!567882 (= res!358357 (validKeyInArray!0 (select (arr!17098 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!567883 () Bool)

(declare-fun contains!2844 (List!11085 (_ BitVec 64)) Bool)

(assert (=> b!567883 (= e!326761 (contains!2844 Nil!11082 (select (arr!17098 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!84407 (not res!358356)) b!567882))

(assert (= (and b!567882 res!358357) b!567883))

(assert (= (and b!567882 res!358355) b!567879))

(assert (= (and b!567879 c!65114) b!567880))

(assert (= (and b!567879 (not c!65114)) b!567881))

(assert (= (or b!567880 b!567881) bm!32523))

(assert (=> bm!32523 m!546671))

(declare-fun m!546675 () Bool)

(assert (=> bm!32523 m!546675))

(assert (=> b!567879 m!546671))

(assert (=> b!567879 m!546671))

(declare-fun m!546677 () Bool)

(assert (=> b!567879 m!546677))

(assert (=> b!567882 m!546671))

(assert (=> b!567882 m!546671))

(assert (=> b!567882 m!546677))

(assert (=> b!567883 m!546671))

(assert (=> b!567883 m!546671))

(declare-fun m!546679 () Bool)

(assert (=> b!567883 m!546679))

(assert (=> b!567794 d!84407))

(declare-fun d!84409 () Bool)

(assert (=> d!84409 (= (validKeyInArray!0 (select (arr!17098 a!3118) j!142)) (and (not (= (select (arr!17098 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17098 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!567798 d!84409))

(declare-fun d!84411 () Bool)

(declare-fun lt!258737 () SeekEntryResult!5503)

(assert (=> d!84411 (and (or ((_ is Undefined!5503) lt!258737) (not ((_ is Found!5503) lt!258737)) (and (bvsge (index!24240 lt!258737) #b00000000000000000000000000000000) (bvslt (index!24240 lt!258737) (size!17462 a!3118)))) (or ((_ is Undefined!5503) lt!258737) ((_ is Found!5503) lt!258737) (not ((_ is MissingZero!5503) lt!258737)) (and (bvsge (index!24239 lt!258737) #b00000000000000000000000000000000) (bvslt (index!24239 lt!258737) (size!17462 a!3118)))) (or ((_ is Undefined!5503) lt!258737) ((_ is Found!5503) lt!258737) ((_ is MissingZero!5503) lt!258737) (not ((_ is MissingVacant!5503) lt!258737)) (and (bvsge (index!24242 lt!258737) #b00000000000000000000000000000000) (bvslt (index!24242 lt!258737) (size!17462 a!3118)))) (or ((_ is Undefined!5503) lt!258737) (ite ((_ is Found!5503) lt!258737) (= (select (arr!17098 a!3118) (index!24240 lt!258737)) (select (arr!17098 a!3118) j!142)) (ite ((_ is MissingZero!5503) lt!258737) (= (select (arr!17098 a!3118) (index!24239 lt!258737)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5503) lt!258737) (= (select (arr!17098 a!3118) (index!24242 lt!258737)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!326775 () SeekEntryResult!5503)

(assert (=> d!84411 (= lt!258737 e!326775)))

(declare-fun c!65127 () Bool)

(declare-fun lt!258735 () SeekEntryResult!5503)

(assert (=> d!84411 (= c!65127 (and ((_ is Intermediate!5503) lt!258735) (undefined!6315 lt!258735)))))

(assert (=> d!84411 (= lt!258735 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17098 a!3118) j!142) mask!3119) (select (arr!17098 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84411 (validMask!0 mask!3119)))

(assert (=> d!84411 (= (seekEntryOrOpen!0 (select (arr!17098 a!3118) j!142) a!3118 mask!3119) lt!258737)))

(declare-fun b!567904 () Bool)

(assert (=> b!567904 (= e!326775 Undefined!5503)))

(declare-fun b!567905 () Bool)

(declare-fun e!326776 () SeekEntryResult!5503)

(assert (=> b!567905 (= e!326775 e!326776)))

(declare-fun lt!258736 () (_ BitVec 64))

(assert (=> b!567905 (= lt!258736 (select (arr!17098 a!3118) (index!24241 lt!258735)))))

(declare-fun c!65126 () Bool)

(assert (=> b!567905 (= c!65126 (= lt!258736 (select (arr!17098 a!3118) j!142)))))

(declare-fun b!567906 () Bool)

(declare-fun c!65125 () Bool)

(assert (=> b!567906 (= c!65125 (= lt!258736 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!326774 () SeekEntryResult!5503)

(assert (=> b!567906 (= e!326776 e!326774)))

(declare-fun b!567907 () Bool)

(assert (=> b!567907 (= e!326774 (MissingZero!5503 (index!24241 lt!258735)))))

(declare-fun b!567908 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35607 (_ BitVec 32)) SeekEntryResult!5503)

(assert (=> b!567908 (= e!326774 (seekKeyOrZeroReturnVacant!0 (x!53259 lt!258735) (index!24241 lt!258735) (index!24241 lt!258735) (select (arr!17098 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!567909 () Bool)

(assert (=> b!567909 (= e!326776 (Found!5503 (index!24241 lt!258735)))))

(assert (= (and d!84411 c!65127) b!567904))

(assert (= (and d!84411 (not c!65127)) b!567905))

(assert (= (and b!567905 c!65126) b!567909))

(assert (= (and b!567905 (not c!65126)) b!567906))

(assert (= (and b!567906 c!65125) b!567907))

(assert (= (and b!567906 (not c!65125)) b!567908))

(assert (=> d!84411 m!546567))

(assert (=> d!84411 m!546551))

(declare-fun m!546681 () Bool)

(assert (=> d!84411 m!546681))

(declare-fun m!546683 () Bool)

(assert (=> d!84411 m!546683))

(assert (=> d!84411 m!546551))

(assert (=> d!84411 m!546567))

(declare-fun m!546685 () Bool)

(assert (=> d!84411 m!546685))

(declare-fun m!546687 () Bool)

(assert (=> d!84411 m!546687))

(assert (=> d!84411 m!546583))

(declare-fun m!546689 () Bool)

(assert (=> b!567905 m!546689))

(assert (=> b!567908 m!546551))

(declare-fun m!546691 () Bool)

(assert (=> b!567908 m!546691))

(assert (=> b!567793 d!84411))

(declare-fun b!567964 () Bool)

(declare-fun e!326810 () Bool)

(declare-fun call!32529 () Bool)

(assert (=> b!567964 (= e!326810 call!32529)))

(declare-fun d!84417 () Bool)

(declare-fun res!358375 () Bool)

(declare-fun e!326809 () Bool)

(assert (=> d!84417 (=> res!358375 e!326809)))

(assert (=> d!84417 (= res!358375 (bvsge j!142 (size!17462 a!3118)))))

(assert (=> d!84417 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!326809)))

(declare-fun b!567965 () Bool)

(declare-fun e!326808 () Bool)

(assert (=> b!567965 (= e!326809 e!326808)))

(declare-fun c!65147 () Bool)

(assert (=> b!567965 (= c!65147 (validKeyInArray!0 (select (arr!17098 a!3118) j!142)))))

(declare-fun b!567966 () Bool)

(assert (=> b!567966 (= e!326808 call!32529)))

(declare-fun bm!32526 () Bool)

(assert (=> bm!32526 (= call!32529 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!567967 () Bool)

(assert (=> b!567967 (= e!326808 e!326810)))

(declare-fun lt!258757 () (_ BitVec 64))

(assert (=> b!567967 (= lt!258757 (select (arr!17098 a!3118) j!142))))

(declare-fun lt!258759 () Unit!17779)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35607 (_ BitVec 64) (_ BitVec 32)) Unit!17779)

(assert (=> b!567967 (= lt!258759 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258757 j!142))))

(assert (=> b!567967 (arrayContainsKey!0 a!3118 lt!258757 #b00000000000000000000000000000000)))

(declare-fun lt!258758 () Unit!17779)

(assert (=> b!567967 (= lt!258758 lt!258759)))

(declare-fun res!358376 () Bool)

(assert (=> b!567967 (= res!358376 (= (seekEntryOrOpen!0 (select (arr!17098 a!3118) j!142) a!3118 mask!3119) (Found!5503 j!142)))))

(assert (=> b!567967 (=> (not res!358376) (not e!326810))))

(assert (= (and d!84417 (not res!358375)) b!567965))

(assert (= (and b!567965 c!65147) b!567967))

(assert (= (and b!567965 (not c!65147)) b!567966))

(assert (= (and b!567967 res!358376) b!567964))

(assert (= (or b!567964 b!567966) bm!32526))

(assert (=> b!567965 m!546551))

(assert (=> b!567965 m!546551))

(assert (=> b!567965 m!546563))

(declare-fun m!546723 () Bool)

(assert (=> bm!32526 m!546723))

(assert (=> b!567967 m!546551))

(declare-fun m!546725 () Bool)

(assert (=> b!567967 m!546725))

(declare-fun m!546727 () Bool)

(assert (=> b!567967 m!546727))

(assert (=> b!567967 m!546551))

(assert (=> b!567967 m!546559))

(assert (=> b!567793 d!84417))

(declare-fun d!84425 () Bool)

(assert (=> d!84425 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!258770 () Unit!17779)

(declare-fun choose!38 (array!35607 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17779)

(assert (=> d!84425 (= lt!258770 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84425 (validMask!0 mask!3119)))

(assert (=> d!84425 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!258770)))

(declare-fun bs!17642 () Bool)

(assert (= bs!17642 d!84425))

(assert (=> bs!17642 m!546553))

(declare-fun m!546729 () Bool)

(assert (=> bs!17642 m!546729))

(assert (=> bs!17642 m!546583))

(assert (=> b!567793 d!84425))

(declare-fun d!84431 () Bool)

(declare-fun lt!258773 () SeekEntryResult!5503)

(assert (=> d!84431 (and (or ((_ is Undefined!5503) lt!258773) (not ((_ is Found!5503) lt!258773)) (and (bvsge (index!24240 lt!258773) #b00000000000000000000000000000000) (bvslt (index!24240 lt!258773) (size!17462 a!3118)))) (or ((_ is Undefined!5503) lt!258773) ((_ is Found!5503) lt!258773) (not ((_ is MissingZero!5503) lt!258773)) (and (bvsge (index!24239 lt!258773) #b00000000000000000000000000000000) (bvslt (index!24239 lt!258773) (size!17462 a!3118)))) (or ((_ is Undefined!5503) lt!258773) ((_ is Found!5503) lt!258773) ((_ is MissingZero!5503) lt!258773) (not ((_ is MissingVacant!5503) lt!258773)) (and (bvsge (index!24242 lt!258773) #b00000000000000000000000000000000) (bvslt (index!24242 lt!258773) (size!17462 a!3118)))) (or ((_ is Undefined!5503) lt!258773) (ite ((_ is Found!5503) lt!258773) (= (select (arr!17098 a!3118) (index!24240 lt!258773)) k0!1914) (ite ((_ is MissingZero!5503) lt!258773) (= (select (arr!17098 a!3118) (index!24239 lt!258773)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5503) lt!258773) (= (select (arr!17098 a!3118) (index!24242 lt!258773)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!326812 () SeekEntryResult!5503)

(assert (=> d!84431 (= lt!258773 e!326812)))

(declare-fun c!65150 () Bool)

(declare-fun lt!258771 () SeekEntryResult!5503)

(assert (=> d!84431 (= c!65150 (and ((_ is Intermediate!5503) lt!258771) (undefined!6315 lt!258771)))))

(assert (=> d!84431 (= lt!258771 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!84431 (validMask!0 mask!3119)))

(assert (=> d!84431 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!258773)))

(declare-fun b!567968 () Bool)

(assert (=> b!567968 (= e!326812 Undefined!5503)))

(declare-fun b!567969 () Bool)

(declare-fun e!326813 () SeekEntryResult!5503)

(assert (=> b!567969 (= e!326812 e!326813)))

(declare-fun lt!258772 () (_ BitVec 64))

(assert (=> b!567969 (= lt!258772 (select (arr!17098 a!3118) (index!24241 lt!258771)))))

(declare-fun c!65149 () Bool)

(assert (=> b!567969 (= c!65149 (= lt!258772 k0!1914))))

(declare-fun b!567970 () Bool)

(declare-fun c!65148 () Bool)

(assert (=> b!567970 (= c!65148 (= lt!258772 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!326811 () SeekEntryResult!5503)

(assert (=> b!567970 (= e!326813 e!326811)))

(declare-fun b!567971 () Bool)

(assert (=> b!567971 (= e!326811 (MissingZero!5503 (index!24241 lt!258771)))))

(declare-fun b!567972 () Bool)

(assert (=> b!567972 (= e!326811 (seekKeyOrZeroReturnVacant!0 (x!53259 lt!258771) (index!24241 lt!258771) (index!24241 lt!258771) k0!1914 a!3118 mask!3119))))

(declare-fun b!567973 () Bool)

(assert (=> b!567973 (= e!326813 (Found!5503 (index!24241 lt!258771)))))

(assert (= (and d!84431 c!65150) b!567968))

(assert (= (and d!84431 (not c!65150)) b!567969))

(assert (= (and b!567969 c!65149) b!567973))

(assert (= (and b!567969 (not c!65149)) b!567970))

(assert (= (and b!567970 c!65148) b!567971))

(assert (= (and b!567970 (not c!65148)) b!567972))

(declare-fun m!546731 () Bool)

(assert (=> d!84431 m!546731))

(declare-fun m!546733 () Bool)

(assert (=> d!84431 m!546733))

(declare-fun m!546735 () Bool)

(assert (=> d!84431 m!546735))

(assert (=> d!84431 m!546731))

(declare-fun m!546737 () Bool)

(assert (=> d!84431 m!546737))

(declare-fun m!546739 () Bool)

(assert (=> d!84431 m!546739))

(assert (=> d!84431 m!546583))

(declare-fun m!546741 () Bool)

(assert (=> b!567969 m!546741))

(declare-fun m!546743 () Bool)

(assert (=> b!567972 m!546743))

(assert (=> b!567796 d!84431))

(declare-fun d!84433 () Bool)

(assert (=> d!84433 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!567797 d!84433))

(declare-fun d!84435 () Bool)

(declare-fun lt!258776 () SeekEntryResult!5503)

(assert (=> d!84435 (and (or ((_ is Undefined!5503) lt!258776) (not ((_ is Found!5503) lt!258776)) (and (bvsge (index!24240 lt!258776) #b00000000000000000000000000000000) (bvslt (index!24240 lt!258776) (size!17462 lt!258673)))) (or ((_ is Undefined!5503) lt!258776) ((_ is Found!5503) lt!258776) (not ((_ is MissingZero!5503) lt!258776)) (and (bvsge (index!24239 lt!258776) #b00000000000000000000000000000000) (bvslt (index!24239 lt!258776) (size!17462 lt!258673)))) (or ((_ is Undefined!5503) lt!258776) ((_ is Found!5503) lt!258776) ((_ is MissingZero!5503) lt!258776) (not ((_ is MissingVacant!5503) lt!258776)) (and (bvsge (index!24242 lt!258776) #b00000000000000000000000000000000) (bvslt (index!24242 lt!258776) (size!17462 lt!258673)))) (or ((_ is Undefined!5503) lt!258776) (ite ((_ is Found!5503) lt!258776) (= (select (arr!17098 lt!258673) (index!24240 lt!258776)) lt!258674) (ite ((_ is MissingZero!5503) lt!258776) (= (select (arr!17098 lt!258673) (index!24239 lt!258776)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5503) lt!258776) (= (select (arr!17098 lt!258673) (index!24242 lt!258776)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!326823 () SeekEntryResult!5503)

(assert (=> d!84435 (= lt!258776 e!326823)))

(declare-fun c!65155 () Bool)

(declare-fun lt!258774 () SeekEntryResult!5503)

(assert (=> d!84435 (= c!65155 (and ((_ is Intermediate!5503) lt!258774) (undefined!6315 lt!258774)))))

(assert (=> d!84435 (= lt!258774 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!258674 mask!3119) lt!258674 lt!258673 mask!3119))))

(assert (=> d!84435 (validMask!0 mask!3119)))

(assert (=> d!84435 (= (seekEntryOrOpen!0 lt!258674 lt!258673 mask!3119) lt!258776)))

(declare-fun b!567984 () Bool)

(assert (=> b!567984 (= e!326823 Undefined!5503)))

(declare-fun b!567985 () Bool)

(declare-fun e!326824 () SeekEntryResult!5503)

(assert (=> b!567985 (= e!326823 e!326824)))

(declare-fun lt!258775 () (_ BitVec 64))

(assert (=> b!567985 (= lt!258775 (select (arr!17098 lt!258673) (index!24241 lt!258774)))))

(declare-fun c!65154 () Bool)

(assert (=> b!567985 (= c!65154 (= lt!258775 lt!258674))))

(declare-fun b!567986 () Bool)

(declare-fun c!65153 () Bool)

(assert (=> b!567986 (= c!65153 (= lt!258775 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!326822 () SeekEntryResult!5503)

(assert (=> b!567986 (= e!326824 e!326822)))

(declare-fun b!567987 () Bool)

(assert (=> b!567987 (= e!326822 (MissingZero!5503 (index!24241 lt!258774)))))

(declare-fun b!567988 () Bool)

(assert (=> b!567988 (= e!326822 (seekKeyOrZeroReturnVacant!0 (x!53259 lt!258774) (index!24241 lt!258774) (index!24241 lt!258774) lt!258674 lt!258673 mask!3119))))

(declare-fun b!567989 () Bool)

(assert (=> b!567989 (= e!326824 (Found!5503 (index!24241 lt!258774)))))

(assert (= (and d!84435 c!65155) b!567984))

(assert (= (and d!84435 (not c!65155)) b!567985))

(assert (= (and b!567985 c!65154) b!567989))

(assert (= (and b!567985 (not c!65154)) b!567986))

(assert (= (and b!567986 c!65153) b!567987))

(assert (= (and b!567986 (not c!65153)) b!567988))

(assert (=> d!84435 m!546569))

(declare-fun m!546745 () Bool)

(assert (=> d!84435 m!546745))

(declare-fun m!546747 () Bool)

(assert (=> d!84435 m!546747))

(assert (=> d!84435 m!546569))

(declare-fun m!546749 () Bool)

(assert (=> d!84435 m!546749))

(declare-fun m!546751 () Bool)

(assert (=> d!84435 m!546751))

(assert (=> d!84435 m!546583))

(declare-fun m!546753 () Bool)

(assert (=> b!567985 m!546753))

(declare-fun m!546755 () Bool)

(assert (=> b!567988 m!546755))

(assert (=> b!567800 d!84435))

(declare-fun b!567990 () Bool)

(declare-fun e!326827 () Bool)

(declare-fun call!32532 () Bool)

(assert (=> b!567990 (= e!326827 call!32532)))

(declare-fun d!84437 () Bool)

(declare-fun res!358383 () Bool)

(declare-fun e!326826 () Bool)

(assert (=> d!84437 (=> res!358383 e!326826)))

(assert (=> d!84437 (= res!358383 (bvsge #b00000000000000000000000000000000 (size!17462 a!3118)))))

(assert (=> d!84437 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!326826)))

(declare-fun b!567991 () Bool)

(declare-fun e!326825 () Bool)

(assert (=> b!567991 (= e!326826 e!326825)))

(declare-fun c!65156 () Bool)

(assert (=> b!567991 (= c!65156 (validKeyInArray!0 (select (arr!17098 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!567992 () Bool)

(assert (=> b!567992 (= e!326825 call!32532)))

(declare-fun bm!32529 () Bool)

(assert (=> bm!32529 (= call!32532 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!567993 () Bool)

(assert (=> b!567993 (= e!326825 e!326827)))

(declare-fun lt!258777 () (_ BitVec 64))

(assert (=> b!567993 (= lt!258777 (select (arr!17098 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!258779 () Unit!17779)

(assert (=> b!567993 (= lt!258779 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258777 #b00000000000000000000000000000000))))

(assert (=> b!567993 (arrayContainsKey!0 a!3118 lt!258777 #b00000000000000000000000000000000)))

(declare-fun lt!258778 () Unit!17779)

(assert (=> b!567993 (= lt!258778 lt!258779)))

(declare-fun res!358384 () Bool)

(assert (=> b!567993 (= res!358384 (= (seekEntryOrOpen!0 (select (arr!17098 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5503 #b00000000000000000000000000000000)))))

(assert (=> b!567993 (=> (not res!358384) (not e!326827))))

(assert (= (and d!84437 (not res!358383)) b!567991))

(assert (= (and b!567991 c!65156) b!567993))

(assert (= (and b!567991 (not c!65156)) b!567992))

(assert (= (and b!567993 res!358384) b!567990))

(assert (= (or b!567990 b!567992) bm!32529))

(assert (=> b!567991 m!546671))

(assert (=> b!567991 m!546671))

(assert (=> b!567991 m!546677))

(declare-fun m!546757 () Bool)

(assert (=> bm!32529 m!546757))

(assert (=> b!567993 m!546671))

(declare-fun m!546759 () Bool)

(assert (=> b!567993 m!546759))

(declare-fun m!546761 () Bool)

(assert (=> b!567993 m!546761))

(assert (=> b!567993 m!546671))

(declare-fun m!546763 () Bool)

(assert (=> b!567993 m!546763))

(assert (=> b!567795 d!84437))

(declare-fun d!84439 () Bool)

(declare-fun e!326864 () Bool)

(assert (=> d!84439 e!326864))

(declare-fun c!65174 () Bool)

(declare-fun lt!258798 () SeekEntryResult!5503)

(assert (=> d!84439 (= c!65174 (and ((_ is Intermediate!5503) lt!258798) (undefined!6315 lt!258798)))))

(declare-fun e!326862 () SeekEntryResult!5503)

(assert (=> d!84439 (= lt!258798 e!326862)))

(declare-fun c!65175 () Bool)

(assert (=> d!84439 (= c!65175 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!258797 () (_ BitVec 64))

(assert (=> d!84439 (= lt!258797 (select (arr!17098 lt!258673) lt!258675))))

(assert (=> d!84439 (validMask!0 mask!3119)))

(assert (=> d!84439 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258675 lt!258674 lt!258673 mask!3119) lt!258798)))

(declare-fun b!568047 () Bool)

(assert (=> b!568047 (= e!326864 (bvsge (x!53259 lt!258798) #b01111111111111111111111111111110))))

(declare-fun b!568048 () Bool)

(assert (=> b!568048 (and (bvsge (index!24241 lt!258798) #b00000000000000000000000000000000) (bvslt (index!24241 lt!258798) (size!17462 lt!258673)))))

(declare-fun e!326865 () Bool)

(assert (=> b!568048 (= e!326865 (= (select (arr!17098 lt!258673) (index!24241 lt!258798)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!568049 () Bool)

(assert (=> b!568049 (and (bvsge (index!24241 lt!258798) #b00000000000000000000000000000000) (bvslt (index!24241 lt!258798) (size!17462 lt!258673)))))

(declare-fun res!358406 () Bool)

(assert (=> b!568049 (= res!358406 (= (select (arr!17098 lt!258673) (index!24241 lt!258798)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!568049 (=> res!358406 e!326865)))

(declare-fun b!568050 () Bool)

(declare-fun e!326861 () SeekEntryResult!5503)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!568050 (= e!326861 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258675 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) lt!258674 lt!258673 mask!3119))))

(declare-fun b!568051 () Bool)

(assert (=> b!568051 (and (bvsge (index!24241 lt!258798) #b00000000000000000000000000000000) (bvslt (index!24241 lt!258798) (size!17462 lt!258673)))))

(declare-fun res!358408 () Bool)

(assert (=> b!568051 (= res!358408 (= (select (arr!17098 lt!258673) (index!24241 lt!258798)) lt!258674))))

(assert (=> b!568051 (=> res!358408 e!326865)))

(declare-fun e!326863 () Bool)

(assert (=> b!568051 (= e!326863 e!326865)))

(declare-fun b!568052 () Bool)

(assert (=> b!568052 (= e!326862 (Intermediate!5503 true lt!258675 #b00000000000000000000000000000000))))

(declare-fun b!568053 () Bool)

(assert (=> b!568053 (= e!326864 e!326863)))

(declare-fun res!358407 () Bool)

(assert (=> b!568053 (= res!358407 (and ((_ is Intermediate!5503) lt!258798) (not (undefined!6315 lt!258798)) (bvslt (x!53259 lt!258798) #b01111111111111111111111111111110) (bvsge (x!53259 lt!258798) #b00000000000000000000000000000000) (bvsge (x!53259 lt!258798) #b00000000000000000000000000000000)))))

(assert (=> b!568053 (=> (not res!358407) (not e!326863))))

(declare-fun b!568054 () Bool)

(assert (=> b!568054 (= e!326861 (Intermediate!5503 false lt!258675 #b00000000000000000000000000000000))))

(declare-fun b!568055 () Bool)

(assert (=> b!568055 (= e!326862 e!326861)))

(declare-fun c!65173 () Bool)

(assert (=> b!568055 (= c!65173 (or (= lt!258797 lt!258674) (= (bvadd lt!258797 lt!258797) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!84439 c!65175) b!568052))

(assert (= (and d!84439 (not c!65175)) b!568055))

(assert (= (and b!568055 c!65173) b!568054))

(assert (= (and b!568055 (not c!65173)) b!568050))

(assert (= (and d!84439 c!65174) b!568047))

(assert (= (and d!84439 (not c!65174)) b!568053))

(assert (= (and b!568053 res!358407) b!568051))

(assert (= (and b!568051 (not res!358408)) b!568049))

(assert (= (and b!568049 (not res!358406)) b!568048))

(declare-fun m!546781 () Bool)

(assert (=> d!84439 m!546781))

(assert (=> d!84439 m!546583))

(declare-fun m!546783 () Bool)

(assert (=> b!568050 m!546783))

(assert (=> b!568050 m!546783))

(declare-fun m!546785 () Bool)

(assert (=> b!568050 m!546785))

(declare-fun m!546787 () Bool)

(assert (=> b!568048 m!546787))

(assert (=> b!568049 m!546787))

(assert (=> b!568051 m!546787))

(assert (=> b!567801 d!84439))

(declare-fun d!84451 () Bool)

(declare-fun e!326869 () Bool)

(assert (=> d!84451 e!326869))

(declare-fun c!65177 () Bool)

(declare-fun lt!258800 () SeekEntryResult!5503)

(assert (=> d!84451 (= c!65177 (and ((_ is Intermediate!5503) lt!258800) (undefined!6315 lt!258800)))))

(declare-fun e!326867 () SeekEntryResult!5503)

(assert (=> d!84451 (= lt!258800 e!326867)))

(declare-fun c!65178 () Bool)

(assert (=> d!84451 (= c!65178 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!258799 () (_ BitVec 64))

(assert (=> d!84451 (= lt!258799 (select (arr!17098 a!3118) lt!258669))))

(assert (=> d!84451 (validMask!0 mask!3119)))

(assert (=> d!84451 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258669 (select (arr!17098 a!3118) j!142) a!3118 mask!3119) lt!258800)))

(declare-fun b!568056 () Bool)

(assert (=> b!568056 (= e!326869 (bvsge (x!53259 lt!258800) #b01111111111111111111111111111110))))

(declare-fun b!568057 () Bool)

(assert (=> b!568057 (and (bvsge (index!24241 lt!258800) #b00000000000000000000000000000000) (bvslt (index!24241 lt!258800) (size!17462 a!3118)))))

(declare-fun e!326870 () Bool)

(assert (=> b!568057 (= e!326870 (= (select (arr!17098 a!3118) (index!24241 lt!258800)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!568058 () Bool)

(assert (=> b!568058 (and (bvsge (index!24241 lt!258800) #b00000000000000000000000000000000) (bvslt (index!24241 lt!258800) (size!17462 a!3118)))))

(declare-fun res!358409 () Bool)

(assert (=> b!568058 (= res!358409 (= (select (arr!17098 a!3118) (index!24241 lt!258800)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!568058 (=> res!358409 e!326870)))

(declare-fun e!326866 () SeekEntryResult!5503)

(declare-fun b!568059 () Bool)

(assert (=> b!568059 (= e!326866 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258669 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (arr!17098 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!568060 () Bool)

(assert (=> b!568060 (and (bvsge (index!24241 lt!258800) #b00000000000000000000000000000000) (bvslt (index!24241 lt!258800) (size!17462 a!3118)))))

(declare-fun res!358411 () Bool)

(assert (=> b!568060 (= res!358411 (= (select (arr!17098 a!3118) (index!24241 lt!258800)) (select (arr!17098 a!3118) j!142)))))

(assert (=> b!568060 (=> res!358411 e!326870)))

(declare-fun e!326868 () Bool)

(assert (=> b!568060 (= e!326868 e!326870)))

(declare-fun b!568061 () Bool)

(assert (=> b!568061 (= e!326867 (Intermediate!5503 true lt!258669 #b00000000000000000000000000000000))))

(declare-fun b!568062 () Bool)

(assert (=> b!568062 (= e!326869 e!326868)))

(declare-fun res!358410 () Bool)

(assert (=> b!568062 (= res!358410 (and ((_ is Intermediate!5503) lt!258800) (not (undefined!6315 lt!258800)) (bvslt (x!53259 lt!258800) #b01111111111111111111111111111110) (bvsge (x!53259 lt!258800) #b00000000000000000000000000000000) (bvsge (x!53259 lt!258800) #b00000000000000000000000000000000)))))

(assert (=> b!568062 (=> (not res!358410) (not e!326868))))

(declare-fun b!568063 () Bool)

(assert (=> b!568063 (= e!326866 (Intermediate!5503 false lt!258669 #b00000000000000000000000000000000))))

(declare-fun b!568064 () Bool)

(assert (=> b!568064 (= e!326867 e!326866)))

(declare-fun c!65176 () Bool)

(assert (=> b!568064 (= c!65176 (or (= lt!258799 (select (arr!17098 a!3118) j!142)) (= (bvadd lt!258799 lt!258799) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!84451 c!65178) b!568061))

(assert (= (and d!84451 (not c!65178)) b!568064))

(assert (= (and b!568064 c!65176) b!568063))

(assert (= (and b!568064 (not c!65176)) b!568059))

(assert (= (and d!84451 c!65177) b!568056))

(assert (= (and d!84451 (not c!65177)) b!568062))

(assert (= (and b!568062 res!358410) b!568060))

(assert (= (and b!568060 (not res!358411)) b!568058))

(assert (= (and b!568058 (not res!358409)) b!568057))

(declare-fun m!546789 () Bool)

(assert (=> d!84451 m!546789))

(assert (=> d!84451 m!546583))

(declare-fun m!546791 () Bool)

(assert (=> b!568059 m!546791))

(assert (=> b!568059 m!546791))

(assert (=> b!568059 m!546551))

(declare-fun m!546793 () Bool)

(assert (=> b!568059 m!546793))

(declare-fun m!546795 () Bool)

(assert (=> b!568057 m!546795))

(assert (=> b!568058 m!546795))

(assert (=> b!568060 m!546795))

(assert (=> b!567801 d!84451))

(declare-fun d!84453 () Bool)

(declare-fun lt!258816 () (_ BitVec 32))

(declare-fun lt!258815 () (_ BitVec 32))

(assert (=> d!84453 (= lt!258816 (bvmul (bvxor lt!258815 (bvlshr lt!258815 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84453 (= lt!258815 ((_ extract 31 0) (bvand (bvxor lt!258674 (bvlshr lt!258674 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84453 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!358412 (let ((h!12100 ((_ extract 31 0) (bvand (bvxor lt!258674 (bvlshr lt!258674 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53266 (bvmul (bvxor h!12100 (bvlshr h!12100 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53266 (bvlshr x!53266 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!358412 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!358412 #b00000000000000000000000000000000))))))

(assert (=> d!84453 (= (toIndex!0 lt!258674 mask!3119) (bvand (bvxor lt!258816 (bvlshr lt!258816 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!567801 d!84453))

(declare-fun d!84459 () Bool)

(declare-fun lt!258818 () (_ BitVec 32))

(declare-fun lt!258817 () (_ BitVec 32))

(assert (=> d!84459 (= lt!258818 (bvmul (bvxor lt!258817 (bvlshr lt!258817 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84459 (= lt!258817 ((_ extract 31 0) (bvand (bvxor (select (arr!17098 a!3118) j!142) (bvlshr (select (arr!17098 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84459 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!358412 (let ((h!12100 ((_ extract 31 0) (bvand (bvxor (select (arr!17098 a!3118) j!142) (bvlshr (select (arr!17098 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53266 (bvmul (bvxor h!12100 (bvlshr h!12100 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53266 (bvlshr x!53266 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!358412 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!358412 #b00000000000000000000000000000000))))))

(assert (=> d!84459 (= (toIndex!0 (select (arr!17098 a!3118) j!142) mask!3119) (bvand (bvxor lt!258818 (bvlshr lt!258818 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!567801 d!84459))

(check-sat (not bm!32529) (not b!567967) (not b!567965) (not d!84435) (not d!84431) (not b!567993) (not d!84439) (not b!567972) (not b!567868) (not d!84411) (not b!567991) (not bm!32526) (not b!568059) (not b!567882) (not b!567883) (not b!567908) (not d!84425) (not b!568050) (not bm!32523) (not b!567879) (not d!84451) (not b!567988))
(check-sat)
