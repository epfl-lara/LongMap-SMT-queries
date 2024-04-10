; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51988 () Bool)

(assert start!51988)

(declare-fun b!568022 () Bool)

(declare-fun e!326838 () Bool)

(declare-fun e!326839 () Bool)

(assert (=> b!568022 (= e!326838 e!326839)))

(declare-fun res!358412 () Bool)

(assert (=> b!568022 (=> (not res!358412) (not e!326839))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!258781 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5556 0))(
  ( (MissingZero!5556 (index!24451 (_ BitVec 32))) (Found!5556 (index!24452 (_ BitVec 32))) (Intermediate!5556 (undefined!6368 Bool) (index!24453 (_ BitVec 32)) (x!53323 (_ BitVec 32))) (Undefined!5556) (MissingVacant!5556 (index!24454 (_ BitVec 32))) )
))
(declare-fun lt!258778 () SeekEntryResult!5556)

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35625 0))(
  ( (array!35626 (arr!17107 (Array (_ BitVec 32) (_ BitVec 64))) (size!17471 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35625)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35625 (_ BitVec 32)) SeekEntryResult!5556)

(assert (=> b!568022 (= res!358412 (= lt!258778 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258781 (select (store (arr!17107 a!3118) i!1132 k0!1914) j!142) (array!35626 (store (arr!17107 a!3118) i!1132 k0!1914) (size!17471 a!3118)) mask!3119)))))

(declare-fun lt!258780 () (_ BitVec 32))

(assert (=> b!568022 (= lt!258778 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258780 (select (arr!17107 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!568022 (= lt!258781 (toIndex!0 (select (store (arr!17107 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!568022 (= lt!258780 (toIndex!0 (select (arr!17107 a!3118) j!142) mask!3119))))

(declare-fun b!568023 () Bool)

(declare-fun e!326840 () Bool)

(assert (=> b!568023 (= e!326840 e!326838)))

(declare-fun res!358407 () Bool)

(assert (=> b!568023 (=> (not res!358407) (not e!326838))))

(declare-fun lt!258779 () SeekEntryResult!5556)

(assert (=> b!568023 (= res!358407 (or (= lt!258779 (MissingZero!5556 i!1132)) (= lt!258779 (MissingVacant!5556 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35625 (_ BitVec 32)) SeekEntryResult!5556)

(assert (=> b!568023 (= lt!258779 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!568025 () Bool)

(get-info :version)

(assert (=> b!568025 (= e!326839 (not (or (not ((_ is Intermediate!5556) lt!258778)) (undefined!6368 lt!258778) (= (select (arr!17107 a!3118) (index!24453 lt!258778)) (select (arr!17107 a!3118) j!142)) (and (bvsge (index!24453 lt!258778) #b00000000000000000000000000000000) (bvslt (index!24453 lt!258778) (size!17471 a!3118))))))))

(declare-fun e!326837 () Bool)

(assert (=> b!568025 e!326837))

(declare-fun res!358408 () Bool)

(assert (=> b!568025 (=> (not res!358408) (not e!326837))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35625 (_ BitVec 32)) Bool)

(assert (=> b!568025 (= res!358408 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17814 0))(
  ( (Unit!17815) )
))
(declare-fun lt!258777 () Unit!17814)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35625 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17814)

(assert (=> b!568025 (= lt!258777 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!568026 () Bool)

(declare-fun res!358406 () Bool)

(assert (=> b!568026 (=> (not res!358406) (not e!326840))))

(declare-fun arrayContainsKey!0 (array!35625 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!568026 (= res!358406 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!568027 () Bool)

(declare-fun res!358415 () Bool)

(assert (=> b!568027 (=> (not res!358415) (not e!326840))))

(assert (=> b!568027 (= res!358415 (and (= (size!17471 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17471 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17471 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!568028 () Bool)

(declare-fun res!358409 () Bool)

(assert (=> b!568028 (=> (not res!358409) (not e!326840))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!568028 (= res!358409 (validKeyInArray!0 k0!1914))))

(declare-fun b!568029 () Bool)

(declare-fun res!358414 () Bool)

(assert (=> b!568029 (=> (not res!358414) (not e!326838))))

(assert (=> b!568029 (= res!358414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!568030 () Bool)

(assert (=> b!568030 (= e!326837 (= (seekEntryOrOpen!0 (select (arr!17107 a!3118) j!142) a!3118 mask!3119) (Found!5556 j!142)))))

(declare-fun b!568031 () Bool)

(declare-fun res!358410 () Bool)

(assert (=> b!568031 (=> (not res!358410) (not e!326840))))

(assert (=> b!568031 (= res!358410 (validKeyInArray!0 (select (arr!17107 a!3118) j!142)))))

(declare-fun res!358411 () Bool)

(assert (=> start!51988 (=> (not res!358411) (not e!326840))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51988 (= res!358411 (validMask!0 mask!3119))))

(assert (=> start!51988 e!326840))

(assert (=> start!51988 true))

(declare-fun array_inv!12903 (array!35625) Bool)

(assert (=> start!51988 (array_inv!12903 a!3118)))

(declare-fun b!568024 () Bool)

(declare-fun res!358413 () Bool)

(assert (=> b!568024 (=> (not res!358413) (not e!326838))))

(declare-datatypes ((List!11187 0))(
  ( (Nil!11184) (Cons!11183 (h!12198 (_ BitVec 64)) (t!17415 List!11187)) )
))
(declare-fun arrayNoDuplicates!0 (array!35625 (_ BitVec 32) List!11187) Bool)

(assert (=> b!568024 (= res!358413 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11184))))

(assert (= (and start!51988 res!358411) b!568027))

(assert (= (and b!568027 res!358415) b!568031))

(assert (= (and b!568031 res!358410) b!568028))

(assert (= (and b!568028 res!358409) b!568026))

(assert (= (and b!568026 res!358406) b!568023))

(assert (= (and b!568023 res!358407) b!568029))

(assert (= (and b!568029 res!358414) b!568024))

(assert (= (and b!568024 res!358413) b!568022))

(assert (= (and b!568022 res!358412) b!568025))

(assert (= (and b!568025 res!358408) b!568030))

(declare-fun m!546611 () Bool)

(assert (=> b!568031 m!546611))

(assert (=> b!568031 m!546611))

(declare-fun m!546613 () Bool)

(assert (=> b!568031 m!546613))

(declare-fun m!546615 () Bool)

(assert (=> b!568025 m!546615))

(assert (=> b!568025 m!546611))

(declare-fun m!546617 () Bool)

(assert (=> b!568025 m!546617))

(declare-fun m!546619 () Bool)

(assert (=> b!568025 m!546619))

(assert (=> b!568030 m!546611))

(assert (=> b!568030 m!546611))

(declare-fun m!546621 () Bool)

(assert (=> b!568030 m!546621))

(declare-fun m!546623 () Bool)

(assert (=> start!51988 m!546623))

(declare-fun m!546625 () Bool)

(assert (=> start!51988 m!546625))

(declare-fun m!546627 () Bool)

(assert (=> b!568029 m!546627))

(declare-fun m!546629 () Bool)

(assert (=> b!568026 m!546629))

(declare-fun m!546631 () Bool)

(assert (=> b!568023 m!546631))

(declare-fun m!546633 () Bool)

(assert (=> b!568028 m!546633))

(assert (=> b!568022 m!546611))

(declare-fun m!546635 () Bool)

(assert (=> b!568022 m!546635))

(assert (=> b!568022 m!546611))

(declare-fun m!546637 () Bool)

(assert (=> b!568022 m!546637))

(assert (=> b!568022 m!546637))

(declare-fun m!546639 () Bool)

(assert (=> b!568022 m!546639))

(declare-fun m!546641 () Bool)

(assert (=> b!568022 m!546641))

(assert (=> b!568022 m!546611))

(declare-fun m!546643 () Bool)

(assert (=> b!568022 m!546643))

(assert (=> b!568022 m!546637))

(declare-fun m!546645 () Bool)

(assert (=> b!568022 m!546645))

(declare-fun m!546647 () Bool)

(assert (=> b!568024 m!546647))

(check-sat (not b!568028) (not b!568030) (not b!568024) (not b!568025) (not b!568022) (not b!568026) (not b!568031) (not start!51988) (not b!568023) (not b!568029))
(check-sat)
(get-model)

(declare-fun b!568074 () Bool)

(declare-fun e!326865 () SeekEntryResult!5556)

(declare-fun lt!258803 () SeekEntryResult!5556)

(assert (=> b!568074 (= e!326865 (MissingZero!5556 (index!24453 lt!258803)))))

(declare-fun b!568075 () Bool)

(declare-fun e!326864 () SeekEntryResult!5556)

(assert (=> b!568075 (= e!326864 (Found!5556 (index!24453 lt!258803)))))

(declare-fun b!568076 () Bool)

(declare-fun e!326863 () SeekEntryResult!5556)

(assert (=> b!568076 (= e!326863 e!326864)))

(declare-fun lt!258805 () (_ BitVec 64))

(assert (=> b!568076 (= lt!258805 (select (arr!17107 a!3118) (index!24453 lt!258803)))))

(declare-fun c!65168 () Bool)

(assert (=> b!568076 (= c!65168 (= lt!258805 k0!1914))))

(declare-fun b!568077 () Bool)

(declare-fun c!65166 () Bool)

(assert (=> b!568077 (= c!65166 (= lt!258805 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!568077 (= e!326864 e!326865)))

(declare-fun d!84389 () Bool)

(declare-fun lt!258804 () SeekEntryResult!5556)

(assert (=> d!84389 (and (or ((_ is Undefined!5556) lt!258804) (not ((_ is Found!5556) lt!258804)) (and (bvsge (index!24452 lt!258804) #b00000000000000000000000000000000) (bvslt (index!24452 lt!258804) (size!17471 a!3118)))) (or ((_ is Undefined!5556) lt!258804) ((_ is Found!5556) lt!258804) (not ((_ is MissingZero!5556) lt!258804)) (and (bvsge (index!24451 lt!258804) #b00000000000000000000000000000000) (bvslt (index!24451 lt!258804) (size!17471 a!3118)))) (or ((_ is Undefined!5556) lt!258804) ((_ is Found!5556) lt!258804) ((_ is MissingZero!5556) lt!258804) (not ((_ is MissingVacant!5556) lt!258804)) (and (bvsge (index!24454 lt!258804) #b00000000000000000000000000000000) (bvslt (index!24454 lt!258804) (size!17471 a!3118)))) (or ((_ is Undefined!5556) lt!258804) (ite ((_ is Found!5556) lt!258804) (= (select (arr!17107 a!3118) (index!24452 lt!258804)) k0!1914) (ite ((_ is MissingZero!5556) lt!258804) (= (select (arr!17107 a!3118) (index!24451 lt!258804)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5556) lt!258804) (= (select (arr!17107 a!3118) (index!24454 lt!258804)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84389 (= lt!258804 e!326863)))

(declare-fun c!65167 () Bool)

(assert (=> d!84389 (= c!65167 (and ((_ is Intermediate!5556) lt!258803) (undefined!6368 lt!258803)))))

(assert (=> d!84389 (= lt!258803 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!84389 (validMask!0 mask!3119)))

(assert (=> d!84389 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!258804)))

(declare-fun b!568078 () Bool)

(assert (=> b!568078 (= e!326863 Undefined!5556)))

(declare-fun b!568079 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35625 (_ BitVec 32)) SeekEntryResult!5556)

(assert (=> b!568079 (= e!326865 (seekKeyOrZeroReturnVacant!0 (x!53323 lt!258803) (index!24453 lt!258803) (index!24453 lt!258803) k0!1914 a!3118 mask!3119))))

(assert (= (and d!84389 c!65167) b!568078))

(assert (= (and d!84389 (not c!65167)) b!568076))

(assert (= (and b!568076 c!65168) b!568075))

(assert (= (and b!568076 (not c!65168)) b!568077))

(assert (= (and b!568077 c!65166) b!568074))

(assert (= (and b!568077 (not c!65166)) b!568079))

(declare-fun m!546687 () Bool)

(assert (=> b!568076 m!546687))

(declare-fun m!546689 () Bool)

(assert (=> d!84389 m!546689))

(declare-fun m!546691 () Bool)

(assert (=> d!84389 m!546691))

(assert (=> d!84389 m!546689))

(declare-fun m!546693 () Bool)

(assert (=> d!84389 m!546693))

(assert (=> d!84389 m!546623))

(declare-fun m!546695 () Bool)

(assert (=> d!84389 m!546695))

(declare-fun m!546697 () Bool)

(assert (=> d!84389 m!546697))

(declare-fun m!546699 () Bool)

(assert (=> b!568079 m!546699))

(assert (=> b!568023 d!84389))

(declare-fun d!84393 () Bool)

(assert (=> d!84393 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!568028 d!84393))

(declare-fun b!568080 () Bool)

(declare-fun e!326868 () SeekEntryResult!5556)

(declare-fun lt!258806 () SeekEntryResult!5556)

(assert (=> b!568080 (= e!326868 (MissingZero!5556 (index!24453 lt!258806)))))

(declare-fun b!568081 () Bool)

(declare-fun e!326867 () SeekEntryResult!5556)

(assert (=> b!568081 (= e!326867 (Found!5556 (index!24453 lt!258806)))))

(declare-fun b!568082 () Bool)

(declare-fun e!326866 () SeekEntryResult!5556)

(assert (=> b!568082 (= e!326866 e!326867)))

(declare-fun lt!258808 () (_ BitVec 64))

(assert (=> b!568082 (= lt!258808 (select (arr!17107 a!3118) (index!24453 lt!258806)))))

(declare-fun c!65171 () Bool)

(assert (=> b!568082 (= c!65171 (= lt!258808 (select (arr!17107 a!3118) j!142)))))

(declare-fun b!568083 () Bool)

(declare-fun c!65169 () Bool)

(assert (=> b!568083 (= c!65169 (= lt!258808 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!568083 (= e!326867 e!326868)))

(declare-fun d!84395 () Bool)

(declare-fun lt!258807 () SeekEntryResult!5556)

(assert (=> d!84395 (and (or ((_ is Undefined!5556) lt!258807) (not ((_ is Found!5556) lt!258807)) (and (bvsge (index!24452 lt!258807) #b00000000000000000000000000000000) (bvslt (index!24452 lt!258807) (size!17471 a!3118)))) (or ((_ is Undefined!5556) lt!258807) ((_ is Found!5556) lt!258807) (not ((_ is MissingZero!5556) lt!258807)) (and (bvsge (index!24451 lt!258807) #b00000000000000000000000000000000) (bvslt (index!24451 lt!258807) (size!17471 a!3118)))) (or ((_ is Undefined!5556) lt!258807) ((_ is Found!5556) lt!258807) ((_ is MissingZero!5556) lt!258807) (not ((_ is MissingVacant!5556) lt!258807)) (and (bvsge (index!24454 lt!258807) #b00000000000000000000000000000000) (bvslt (index!24454 lt!258807) (size!17471 a!3118)))) (or ((_ is Undefined!5556) lt!258807) (ite ((_ is Found!5556) lt!258807) (= (select (arr!17107 a!3118) (index!24452 lt!258807)) (select (arr!17107 a!3118) j!142)) (ite ((_ is MissingZero!5556) lt!258807) (= (select (arr!17107 a!3118) (index!24451 lt!258807)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5556) lt!258807) (= (select (arr!17107 a!3118) (index!24454 lt!258807)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84395 (= lt!258807 e!326866)))

(declare-fun c!65170 () Bool)

(assert (=> d!84395 (= c!65170 (and ((_ is Intermediate!5556) lt!258806) (undefined!6368 lt!258806)))))

(assert (=> d!84395 (= lt!258806 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17107 a!3118) j!142) mask!3119) (select (arr!17107 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84395 (validMask!0 mask!3119)))

(assert (=> d!84395 (= (seekEntryOrOpen!0 (select (arr!17107 a!3118) j!142) a!3118 mask!3119) lt!258807)))

(declare-fun b!568084 () Bool)

(assert (=> b!568084 (= e!326866 Undefined!5556)))

(declare-fun b!568085 () Bool)

(assert (=> b!568085 (= e!326868 (seekKeyOrZeroReturnVacant!0 (x!53323 lt!258806) (index!24453 lt!258806) (index!24453 lt!258806) (select (arr!17107 a!3118) j!142) a!3118 mask!3119))))

(assert (= (and d!84395 c!65170) b!568084))

(assert (= (and d!84395 (not c!65170)) b!568082))

(assert (= (and b!568082 c!65171) b!568081))

(assert (= (and b!568082 (not c!65171)) b!568083))

(assert (= (and b!568083 c!65169) b!568080))

(assert (= (and b!568083 (not c!65169)) b!568085))

(declare-fun m!546701 () Bool)

(assert (=> b!568082 m!546701))

(assert (=> d!84395 m!546635))

(assert (=> d!84395 m!546611))

(declare-fun m!546703 () Bool)

(assert (=> d!84395 m!546703))

(assert (=> d!84395 m!546611))

(assert (=> d!84395 m!546635))

(declare-fun m!546705 () Bool)

(assert (=> d!84395 m!546705))

(assert (=> d!84395 m!546623))

(declare-fun m!546707 () Bool)

(assert (=> d!84395 m!546707))

(declare-fun m!546709 () Bool)

(assert (=> d!84395 m!546709))

(assert (=> b!568085 m!546611))

(declare-fun m!546711 () Bool)

(assert (=> b!568085 m!546711))

(assert (=> b!568030 d!84395))

(declare-fun b!568098 () Bool)

(declare-fun e!326879 () Bool)

(declare-fun call!32543 () Bool)

(assert (=> b!568098 (= e!326879 call!32543)))

(declare-fun bm!32540 () Bool)

(assert (=> bm!32540 (= call!32543 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!568099 () Bool)

(declare-fun e!326878 () Bool)

(assert (=> b!568099 (= e!326878 e!326879)))

(declare-fun c!65176 () Bool)

(assert (=> b!568099 (= c!65176 (validKeyInArray!0 (select (arr!17107 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!568100 () Bool)

(declare-fun e!326877 () Bool)

(assert (=> b!568100 (= e!326879 e!326877)))

(declare-fun lt!258821 () (_ BitVec 64))

(assert (=> b!568100 (= lt!258821 (select (arr!17107 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!258820 () Unit!17814)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35625 (_ BitVec 64) (_ BitVec 32)) Unit!17814)

(assert (=> b!568100 (= lt!258820 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258821 #b00000000000000000000000000000000))))

(assert (=> b!568100 (arrayContainsKey!0 a!3118 lt!258821 #b00000000000000000000000000000000)))

(declare-fun lt!258819 () Unit!17814)

(assert (=> b!568100 (= lt!258819 lt!258820)))

(declare-fun res!358451 () Bool)

(assert (=> b!568100 (= res!358451 (= (seekEntryOrOpen!0 (select (arr!17107 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5556 #b00000000000000000000000000000000)))))

(assert (=> b!568100 (=> (not res!358451) (not e!326877))))

(declare-fun b!568101 () Bool)

(assert (=> b!568101 (= e!326877 call!32543)))

(declare-fun d!84397 () Bool)

(declare-fun res!358450 () Bool)

(assert (=> d!84397 (=> res!358450 e!326878)))

(assert (=> d!84397 (= res!358450 (bvsge #b00000000000000000000000000000000 (size!17471 a!3118)))))

(assert (=> d!84397 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!326878)))

(assert (= (and d!84397 (not res!358450)) b!568099))

(assert (= (and b!568099 c!65176) b!568100))

(assert (= (and b!568099 (not c!65176)) b!568098))

(assert (= (and b!568100 res!358451) b!568101))

(assert (= (or b!568101 b!568098) bm!32540))

(declare-fun m!546713 () Bool)

(assert (=> bm!32540 m!546713))

(declare-fun m!546715 () Bool)

(assert (=> b!568099 m!546715))

(assert (=> b!568099 m!546715))

(declare-fun m!546717 () Bool)

(assert (=> b!568099 m!546717))

(assert (=> b!568100 m!546715))

(declare-fun m!546719 () Bool)

(assert (=> b!568100 m!546719))

(declare-fun m!546721 () Bool)

(assert (=> b!568100 m!546721))

(assert (=> b!568100 m!546715))

(declare-fun m!546723 () Bool)

(assert (=> b!568100 m!546723))

(assert (=> b!568029 d!84397))

(declare-fun b!568126 () Bool)

(declare-fun e!326898 () Bool)

(declare-fun call!32546 () Bool)

(assert (=> b!568126 (= e!326898 call!32546)))

(declare-fun b!568127 () Bool)

(assert (=> b!568127 (= e!326898 call!32546)))

(declare-fun d!84401 () Bool)

(declare-fun res!358460 () Bool)

(declare-fun e!326895 () Bool)

(assert (=> d!84401 (=> res!358460 e!326895)))

(assert (=> d!84401 (= res!358460 (bvsge #b00000000000000000000000000000000 (size!17471 a!3118)))))

(assert (=> d!84401 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11184) e!326895)))

(declare-fun b!568128 () Bool)

(declare-fun e!326896 () Bool)

(assert (=> b!568128 (= e!326896 e!326898)))

(declare-fun c!65186 () Bool)

(assert (=> b!568128 (= c!65186 (validKeyInArray!0 (select (arr!17107 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32543 () Bool)

(assert (=> bm!32543 (= call!32546 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!65186 (Cons!11183 (select (arr!17107 a!3118) #b00000000000000000000000000000000) Nil!11184) Nil!11184)))))

(declare-fun b!568129 () Bool)

(assert (=> b!568129 (= e!326895 e!326896)))

(declare-fun res!358458 () Bool)

(assert (=> b!568129 (=> (not res!358458) (not e!326896))))

(declare-fun e!326897 () Bool)

(assert (=> b!568129 (= res!358458 (not e!326897))))

(declare-fun res!358459 () Bool)

(assert (=> b!568129 (=> (not res!358459) (not e!326897))))

(assert (=> b!568129 (= res!358459 (validKeyInArray!0 (select (arr!17107 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!568130 () Bool)

(declare-fun contains!2873 (List!11187 (_ BitVec 64)) Bool)

(assert (=> b!568130 (= e!326897 (contains!2873 Nil!11184 (select (arr!17107 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!84401 (not res!358460)) b!568129))

(assert (= (and b!568129 res!358459) b!568130))

(assert (= (and b!568129 res!358458) b!568128))

(assert (= (and b!568128 c!65186) b!568127))

(assert (= (and b!568128 (not c!65186)) b!568126))

(assert (= (or b!568127 b!568126) bm!32543))

(assert (=> b!568128 m!546715))

(assert (=> b!568128 m!546715))

(assert (=> b!568128 m!546717))

(assert (=> bm!32543 m!546715))

(declare-fun m!546739 () Bool)

(assert (=> bm!32543 m!546739))

(assert (=> b!568129 m!546715))

(assert (=> b!568129 m!546715))

(assert (=> b!568129 m!546717))

(assert (=> b!568130 m!546715))

(assert (=> b!568130 m!546715))

(declare-fun m!546741 () Bool)

(assert (=> b!568130 m!546741))

(assert (=> b!568024 d!84401))

(declare-fun d!84405 () Bool)

(assert (=> d!84405 (= (validKeyInArray!0 (select (arr!17107 a!3118) j!142)) (and (not (= (select (arr!17107 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17107 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!568031 d!84405))

(declare-fun d!84407 () Bool)

(declare-fun res!358471 () Bool)

(declare-fun e!326913 () Bool)

(assert (=> d!84407 (=> res!358471 e!326913)))

(assert (=> d!84407 (= res!358471 (= (select (arr!17107 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!84407 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!326913)))

(declare-fun b!568153 () Bool)

(declare-fun e!326914 () Bool)

(assert (=> b!568153 (= e!326913 e!326914)))

(declare-fun res!358472 () Bool)

(assert (=> b!568153 (=> (not res!358472) (not e!326914))))

(assert (=> b!568153 (= res!358472 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17471 a!3118)))))

(declare-fun b!568154 () Bool)

(assert (=> b!568154 (= e!326914 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84407 (not res!358471)) b!568153))

(assert (= (and b!568153 res!358472) b!568154))

(assert (=> d!84407 m!546715))

(declare-fun m!546743 () Bool)

(assert (=> b!568154 m!546743))

(assert (=> b!568026 d!84407))

(declare-fun b!568155 () Bool)

(declare-fun e!326917 () Bool)

(declare-fun call!32547 () Bool)

(assert (=> b!568155 (= e!326917 call!32547)))

(declare-fun bm!32544 () Bool)

(assert (=> bm!32544 (= call!32547 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!568156 () Bool)

(declare-fun e!326916 () Bool)

(assert (=> b!568156 (= e!326916 e!326917)))

(declare-fun c!65193 () Bool)

(assert (=> b!568156 (= c!65193 (validKeyInArray!0 (select (arr!17107 a!3118) j!142)))))

(declare-fun b!568157 () Bool)

(declare-fun e!326915 () Bool)

(assert (=> b!568157 (= e!326917 e!326915)))

(declare-fun lt!258833 () (_ BitVec 64))

(assert (=> b!568157 (= lt!258833 (select (arr!17107 a!3118) j!142))))

(declare-fun lt!258832 () Unit!17814)

(assert (=> b!568157 (= lt!258832 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258833 j!142))))

(assert (=> b!568157 (arrayContainsKey!0 a!3118 lt!258833 #b00000000000000000000000000000000)))

(declare-fun lt!258831 () Unit!17814)

(assert (=> b!568157 (= lt!258831 lt!258832)))

(declare-fun res!358474 () Bool)

(assert (=> b!568157 (= res!358474 (= (seekEntryOrOpen!0 (select (arr!17107 a!3118) j!142) a!3118 mask!3119) (Found!5556 j!142)))))

(assert (=> b!568157 (=> (not res!358474) (not e!326915))))

(declare-fun b!568158 () Bool)

(assert (=> b!568158 (= e!326915 call!32547)))

(declare-fun d!84409 () Bool)

(declare-fun res!358473 () Bool)

(assert (=> d!84409 (=> res!358473 e!326916)))

(assert (=> d!84409 (= res!358473 (bvsge j!142 (size!17471 a!3118)))))

(assert (=> d!84409 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!326916)))

(assert (= (and d!84409 (not res!358473)) b!568156))

(assert (= (and b!568156 c!65193) b!568157))

(assert (= (and b!568156 (not c!65193)) b!568155))

(assert (= (and b!568157 res!358474) b!568158))

(assert (= (or b!568158 b!568155) bm!32544))

(declare-fun m!546745 () Bool)

(assert (=> bm!32544 m!546745))

(assert (=> b!568156 m!546611))

(assert (=> b!568156 m!546611))

(assert (=> b!568156 m!546613))

(assert (=> b!568157 m!546611))

(declare-fun m!546747 () Bool)

(assert (=> b!568157 m!546747))

(declare-fun m!546749 () Bool)

(assert (=> b!568157 m!546749))

(assert (=> b!568157 m!546611))

(assert (=> b!568157 m!546621))

(assert (=> b!568025 d!84409))

(declare-fun d!84411 () Bool)

(assert (=> d!84411 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!258849 () Unit!17814)

(declare-fun choose!38 (array!35625 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17814)

(assert (=> d!84411 (= lt!258849 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84411 (validMask!0 mask!3119)))

(assert (=> d!84411 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!258849)))

(declare-fun bs!17629 () Bool)

(assert (= bs!17629 d!84411))

(assert (=> bs!17629 m!546617))

(declare-fun m!546769 () Bool)

(assert (=> bs!17629 m!546769))

(assert (=> bs!17629 m!546623))

(assert (=> b!568025 d!84411))

(declare-fun b!568238 () Bool)

(declare-fun e!326971 () SeekEntryResult!5556)

(assert (=> b!568238 (= e!326971 (Intermediate!5556 true lt!258781 #b00000000000000000000000000000000))))

(declare-fun b!568239 () Bool)

(declare-fun e!326973 () SeekEntryResult!5556)

(assert (=> b!568239 (= e!326971 e!326973)))

(declare-fun c!65217 () Bool)

(declare-fun lt!258872 () (_ BitVec 64))

(assert (=> b!568239 (= c!65217 (or (= lt!258872 (select (store (arr!17107 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!258872 lt!258872) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!568240 () Bool)

(assert (=> b!568240 (= e!326973 (Intermediate!5556 false lt!258781 #b00000000000000000000000000000000))))

(declare-fun d!84417 () Bool)

(declare-fun e!326975 () Bool)

(assert (=> d!84417 e!326975))

(declare-fun c!65218 () Bool)

(declare-fun lt!258871 () SeekEntryResult!5556)

(assert (=> d!84417 (= c!65218 (and ((_ is Intermediate!5556) lt!258871) (undefined!6368 lt!258871)))))

(assert (=> d!84417 (= lt!258871 e!326971)))

(declare-fun c!65216 () Bool)

(assert (=> d!84417 (= c!65216 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84417 (= lt!258872 (select (arr!17107 (array!35626 (store (arr!17107 a!3118) i!1132 k0!1914) (size!17471 a!3118))) lt!258781))))

(assert (=> d!84417 (validMask!0 mask!3119)))

(assert (=> d!84417 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258781 (select (store (arr!17107 a!3118) i!1132 k0!1914) j!142) (array!35626 (store (arr!17107 a!3118) i!1132 k0!1914) (size!17471 a!3118)) mask!3119) lt!258871)))

(declare-fun b!568241 () Bool)

(declare-fun e!326974 () Bool)

(assert (=> b!568241 (= e!326975 e!326974)))

(declare-fun res!358512 () Bool)

(assert (=> b!568241 (= res!358512 (and ((_ is Intermediate!5556) lt!258871) (not (undefined!6368 lt!258871)) (bvslt (x!53323 lt!258871) #b01111111111111111111111111111110) (bvsge (x!53323 lt!258871) #b00000000000000000000000000000000) (bvsge (x!53323 lt!258871) #b00000000000000000000000000000000)))))

(assert (=> b!568241 (=> (not res!358512) (not e!326974))))

(declare-fun b!568242 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!568242 (= e!326973 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258781 #b00000000000000000000000000000000 mask!3119) (select (store (arr!17107 a!3118) i!1132 k0!1914) j!142) (array!35626 (store (arr!17107 a!3118) i!1132 k0!1914) (size!17471 a!3118)) mask!3119))))

(declare-fun b!568243 () Bool)

(assert (=> b!568243 (= e!326975 (bvsge (x!53323 lt!258871) #b01111111111111111111111111111110))))

(declare-fun b!568244 () Bool)

(assert (=> b!568244 (and (bvsge (index!24453 lt!258871) #b00000000000000000000000000000000) (bvslt (index!24453 lt!258871) (size!17471 (array!35626 (store (arr!17107 a!3118) i!1132 k0!1914) (size!17471 a!3118)))))))

(declare-fun res!358513 () Bool)

(assert (=> b!568244 (= res!358513 (= (select (arr!17107 (array!35626 (store (arr!17107 a!3118) i!1132 k0!1914) (size!17471 a!3118))) (index!24453 lt!258871)) (select (store (arr!17107 a!3118) i!1132 k0!1914) j!142)))))

(declare-fun e!326972 () Bool)

(assert (=> b!568244 (=> res!358513 e!326972)))

(assert (=> b!568244 (= e!326974 e!326972)))

(declare-fun b!568245 () Bool)

(assert (=> b!568245 (and (bvsge (index!24453 lt!258871) #b00000000000000000000000000000000) (bvslt (index!24453 lt!258871) (size!17471 (array!35626 (store (arr!17107 a!3118) i!1132 k0!1914) (size!17471 a!3118)))))))

(assert (=> b!568245 (= e!326972 (= (select (arr!17107 (array!35626 (store (arr!17107 a!3118) i!1132 k0!1914) (size!17471 a!3118))) (index!24453 lt!258871)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!568246 () Bool)

(assert (=> b!568246 (and (bvsge (index!24453 lt!258871) #b00000000000000000000000000000000) (bvslt (index!24453 lt!258871) (size!17471 (array!35626 (store (arr!17107 a!3118) i!1132 k0!1914) (size!17471 a!3118)))))))

(declare-fun res!358511 () Bool)

(assert (=> b!568246 (= res!358511 (= (select (arr!17107 (array!35626 (store (arr!17107 a!3118) i!1132 k0!1914) (size!17471 a!3118))) (index!24453 lt!258871)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!568246 (=> res!358511 e!326972)))

(assert (= (and d!84417 c!65216) b!568238))

(assert (= (and d!84417 (not c!65216)) b!568239))

(assert (= (and b!568239 c!65217) b!568240))

(assert (= (and b!568239 (not c!65217)) b!568242))

(assert (= (and d!84417 c!65218) b!568243))

(assert (= (and d!84417 (not c!65218)) b!568241))

(assert (= (and b!568241 res!358512) b!568244))

(assert (= (and b!568244 (not res!358513)) b!568246))

(assert (= (and b!568246 (not res!358511)) b!568245))

(declare-fun m!546809 () Bool)

(assert (=> b!568244 m!546809))

(declare-fun m!546811 () Bool)

(assert (=> b!568242 m!546811))

(assert (=> b!568242 m!546811))

(assert (=> b!568242 m!546637))

(declare-fun m!546813 () Bool)

(assert (=> b!568242 m!546813))

(declare-fun m!546815 () Bool)

(assert (=> d!84417 m!546815))

(assert (=> d!84417 m!546623))

(assert (=> b!568245 m!546809))

(assert (=> b!568246 m!546809))

(assert (=> b!568022 d!84417))

(declare-fun b!568247 () Bool)

(declare-fun e!326976 () SeekEntryResult!5556)

(assert (=> b!568247 (= e!326976 (Intermediate!5556 true lt!258780 #b00000000000000000000000000000000))))

(declare-fun b!568248 () Bool)

(declare-fun e!326978 () SeekEntryResult!5556)

(assert (=> b!568248 (= e!326976 e!326978)))

(declare-fun lt!258874 () (_ BitVec 64))

(declare-fun c!65220 () Bool)

(assert (=> b!568248 (= c!65220 (or (= lt!258874 (select (arr!17107 a!3118) j!142)) (= (bvadd lt!258874 lt!258874) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!568249 () Bool)

(assert (=> b!568249 (= e!326978 (Intermediate!5556 false lt!258780 #b00000000000000000000000000000000))))

(declare-fun d!84439 () Bool)

(declare-fun e!326980 () Bool)

(assert (=> d!84439 e!326980))

(declare-fun c!65221 () Bool)

(declare-fun lt!258873 () SeekEntryResult!5556)

(assert (=> d!84439 (= c!65221 (and ((_ is Intermediate!5556) lt!258873) (undefined!6368 lt!258873)))))

(assert (=> d!84439 (= lt!258873 e!326976)))

(declare-fun c!65219 () Bool)

(assert (=> d!84439 (= c!65219 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84439 (= lt!258874 (select (arr!17107 a!3118) lt!258780))))

(assert (=> d!84439 (validMask!0 mask!3119)))

(assert (=> d!84439 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258780 (select (arr!17107 a!3118) j!142) a!3118 mask!3119) lt!258873)))

(declare-fun b!568250 () Bool)

(declare-fun e!326979 () Bool)

(assert (=> b!568250 (= e!326980 e!326979)))

(declare-fun res!358515 () Bool)

(assert (=> b!568250 (= res!358515 (and ((_ is Intermediate!5556) lt!258873) (not (undefined!6368 lt!258873)) (bvslt (x!53323 lt!258873) #b01111111111111111111111111111110) (bvsge (x!53323 lt!258873) #b00000000000000000000000000000000) (bvsge (x!53323 lt!258873) #b00000000000000000000000000000000)))))

(assert (=> b!568250 (=> (not res!358515) (not e!326979))))

(declare-fun b!568251 () Bool)

(assert (=> b!568251 (= e!326978 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258780 #b00000000000000000000000000000000 mask!3119) (select (arr!17107 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!568252 () Bool)

(assert (=> b!568252 (= e!326980 (bvsge (x!53323 lt!258873) #b01111111111111111111111111111110))))

(declare-fun b!568253 () Bool)

(assert (=> b!568253 (and (bvsge (index!24453 lt!258873) #b00000000000000000000000000000000) (bvslt (index!24453 lt!258873) (size!17471 a!3118)))))

(declare-fun res!358516 () Bool)

(assert (=> b!568253 (= res!358516 (= (select (arr!17107 a!3118) (index!24453 lt!258873)) (select (arr!17107 a!3118) j!142)))))

(declare-fun e!326977 () Bool)

(assert (=> b!568253 (=> res!358516 e!326977)))

(assert (=> b!568253 (= e!326979 e!326977)))

(declare-fun b!568254 () Bool)

(assert (=> b!568254 (and (bvsge (index!24453 lt!258873) #b00000000000000000000000000000000) (bvslt (index!24453 lt!258873) (size!17471 a!3118)))))

(assert (=> b!568254 (= e!326977 (= (select (arr!17107 a!3118) (index!24453 lt!258873)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!568255 () Bool)

(assert (=> b!568255 (and (bvsge (index!24453 lt!258873) #b00000000000000000000000000000000) (bvslt (index!24453 lt!258873) (size!17471 a!3118)))))

(declare-fun res!358514 () Bool)

(assert (=> b!568255 (= res!358514 (= (select (arr!17107 a!3118) (index!24453 lt!258873)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!568255 (=> res!358514 e!326977)))

(assert (= (and d!84439 c!65219) b!568247))

(assert (= (and d!84439 (not c!65219)) b!568248))

(assert (= (and b!568248 c!65220) b!568249))

(assert (= (and b!568248 (not c!65220)) b!568251))

(assert (= (and d!84439 c!65221) b!568252))

(assert (= (and d!84439 (not c!65221)) b!568250))

(assert (= (and b!568250 res!358515) b!568253))

(assert (= (and b!568253 (not res!358516)) b!568255))

(assert (= (and b!568255 (not res!358514)) b!568254))

(declare-fun m!546817 () Bool)

(assert (=> b!568253 m!546817))

(declare-fun m!546819 () Bool)

(assert (=> b!568251 m!546819))

(assert (=> b!568251 m!546819))

(assert (=> b!568251 m!546611))

(declare-fun m!546821 () Bool)

(assert (=> b!568251 m!546821))

(declare-fun m!546823 () Bool)

(assert (=> d!84439 m!546823))

(assert (=> d!84439 m!546623))

(assert (=> b!568254 m!546817))

(assert (=> b!568255 m!546817))

(assert (=> b!568022 d!84439))

(declare-fun d!84441 () Bool)

(declare-fun lt!258886 () (_ BitVec 32))

(declare-fun lt!258885 () (_ BitVec 32))

(assert (=> d!84441 (= lt!258886 (bvmul (bvxor lt!258885 (bvlshr lt!258885 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84441 (= lt!258885 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17107 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!17107 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84441 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!358517 (let ((h!12201 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17107 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!17107 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53328 (bvmul (bvxor h!12201 (bvlshr h!12201 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53328 (bvlshr x!53328 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!358517 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!358517 #b00000000000000000000000000000000))))))

(assert (=> d!84441 (= (toIndex!0 (select (store (arr!17107 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!258886 (bvlshr lt!258886 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!568022 d!84441))

(declare-fun d!84449 () Bool)

(declare-fun lt!258888 () (_ BitVec 32))

(declare-fun lt!258887 () (_ BitVec 32))

(assert (=> d!84449 (= lt!258888 (bvmul (bvxor lt!258887 (bvlshr lt!258887 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84449 (= lt!258887 ((_ extract 31 0) (bvand (bvxor (select (arr!17107 a!3118) j!142) (bvlshr (select (arr!17107 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84449 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!358517 (let ((h!12201 ((_ extract 31 0) (bvand (bvxor (select (arr!17107 a!3118) j!142) (bvlshr (select (arr!17107 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53328 (bvmul (bvxor h!12201 (bvlshr h!12201 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53328 (bvlshr x!53328 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!358517 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!358517 #b00000000000000000000000000000000))))))

(assert (=> d!84449 (= (toIndex!0 (select (arr!17107 a!3118) j!142) mask!3119) (bvand (bvxor lt!258888 (bvlshr lt!258888 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!568022 d!84449))

(declare-fun d!84451 () Bool)

(assert (=> d!84451 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51988 d!84451))

(declare-fun d!84455 () Bool)

(assert (=> d!84455 (= (array_inv!12903 a!3118) (bvsge (size!17471 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51988 d!84455))

(check-sat (not d!84395) (not bm!32540) (not d!84389) (not d!84417) (not b!568251) (not b!568085) (not b!568128) (not b!568156) (not b!568129) (not bm!32543) (not b!568130) (not bm!32544) (not d!84411) (not d!84439) (not b!568100) (not b!568242) (not b!568157) (not b!568099) (not b!568079) (not b!568154))
(check-sat)
