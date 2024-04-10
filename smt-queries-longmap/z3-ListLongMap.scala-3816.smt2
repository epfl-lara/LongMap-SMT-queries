; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52318 () Bool)

(assert start!52318)

(declare-fun res!360857 () Bool)

(declare-fun e!328435 () Bool)

(assert (=> start!52318 (=> (not res!360857) (not e!328435))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52318 (= res!360857 (validMask!0 mask!3119))))

(assert (=> start!52318 e!328435))

(assert (=> start!52318 true))

(declare-datatypes ((array!35778 0))(
  ( (array!35779 (arr!17179 (Array (_ BitVec 32) (_ BitVec 64))) (size!17543 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35778)

(declare-fun array_inv!12975 (array!35778) Bool)

(assert (=> start!52318 (array_inv!12975 a!3118)))

(declare-fun b!571066 () Bool)

(declare-fun res!360859 () Bool)

(assert (=> b!571066 (=> (not res!360859) (not e!328435))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!571066 (= res!360859 (validKeyInArray!0 (select (arr!17179 a!3118) j!142)))))

(declare-fun b!571067 () Bool)

(declare-fun res!360856 () Bool)

(assert (=> b!571067 (=> (not res!360856) (not e!328435))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!571067 (= res!360856 (validKeyInArray!0 k0!1914))))

(declare-fun b!571068 () Bool)

(declare-fun e!328432 () Bool)

(assert (=> b!571068 (= e!328435 e!328432)))

(declare-fun res!360849 () Bool)

(assert (=> b!571068 (=> (not res!360849) (not e!328432))))

(declare-datatypes ((SeekEntryResult!5628 0))(
  ( (MissingZero!5628 (index!24739 (_ BitVec 32))) (Found!5628 (index!24740 (_ BitVec 32))) (Intermediate!5628 (undefined!6440 Bool) (index!24741 (_ BitVec 32)) (x!53608 (_ BitVec 32))) (Undefined!5628) (MissingVacant!5628 (index!24742 (_ BitVec 32))) )
))
(declare-fun lt!260390 () SeekEntryResult!5628)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!571068 (= res!360849 (or (= lt!260390 (MissingZero!5628 i!1132)) (= lt!260390 (MissingVacant!5628 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35778 (_ BitVec 32)) SeekEntryResult!5628)

(assert (=> b!571068 (= lt!260390 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!571069 () Bool)

(declare-fun res!360855 () Bool)

(assert (=> b!571069 (=> (not res!360855) (not e!328432))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35778 (_ BitVec 32)) Bool)

(assert (=> b!571069 (= res!360855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!571070 () Bool)

(declare-fun e!328434 () Bool)

(declare-fun e!328439 () Bool)

(assert (=> b!571070 (= e!328434 (not e!328439))))

(declare-fun res!360850 () Bool)

(assert (=> b!571070 (=> res!360850 e!328439)))

(declare-fun lt!260392 () SeekEntryResult!5628)

(get-info :version)

(assert (=> b!571070 (= res!360850 (or (undefined!6440 lt!260392) (not ((_ is Intermediate!5628) lt!260392))))))

(declare-fun e!328433 () Bool)

(assert (=> b!571070 e!328433))

(declare-fun res!360854 () Bool)

(assert (=> b!571070 (=> (not res!360854) (not e!328433))))

(declare-fun lt!260391 () SeekEntryResult!5628)

(assert (=> b!571070 (= res!360854 (= lt!260391 (Found!5628 j!142)))))

(assert (=> b!571070 (= lt!260391 (seekEntryOrOpen!0 (select (arr!17179 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!571070 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17958 0))(
  ( (Unit!17959) )
))
(declare-fun lt!260394 () Unit!17958)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35778 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17958)

(assert (=> b!571070 (= lt!260394 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!571071 () Bool)

(declare-fun e!328440 () Bool)

(assert (=> b!571071 (= e!328433 e!328440)))

(declare-fun res!360860 () Bool)

(assert (=> b!571071 (=> res!360860 e!328440)))

(assert (=> b!571071 (= res!360860 (or (undefined!6440 lt!260392) (not ((_ is Intermediate!5628) lt!260392))))))

(declare-fun b!571072 () Bool)

(declare-fun e!328436 () Bool)

(assert (=> b!571072 (= e!328440 e!328436)))

(declare-fun res!360852 () Bool)

(assert (=> b!571072 (=> res!360852 e!328436)))

(declare-fun lt!260393 () (_ BitVec 64))

(assert (=> b!571072 (= res!360852 (or (= lt!260393 (select (arr!17179 a!3118) j!142)) (= lt!260393 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!571072 (= lt!260393 (select (arr!17179 a!3118) (index!24741 lt!260392)))))

(declare-fun b!571073 () Bool)

(assert (=> b!571073 (= e!328432 e!328434)))

(declare-fun res!360847 () Bool)

(assert (=> b!571073 (=> (not res!360847) (not e!328434))))

(declare-fun lt!260386 () (_ BitVec 32))

(declare-fun lt!260387 () (_ BitVec 64))

(declare-fun lt!260395 () array!35778)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35778 (_ BitVec 32)) SeekEntryResult!5628)

(assert (=> b!571073 (= res!360847 (= lt!260392 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260386 lt!260387 lt!260395 mask!3119)))))

(declare-fun lt!260389 () (_ BitVec 32))

(assert (=> b!571073 (= lt!260392 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260389 (select (arr!17179 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!571073 (= lt!260386 (toIndex!0 lt!260387 mask!3119))))

(assert (=> b!571073 (= lt!260387 (select (store (arr!17179 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!571073 (= lt!260389 (toIndex!0 (select (arr!17179 a!3118) j!142) mask!3119))))

(assert (=> b!571073 (= lt!260395 (array!35779 (store (arr!17179 a!3118) i!1132 k0!1914) (size!17543 a!3118)))))

(declare-fun b!571074 () Bool)

(declare-fun res!360848 () Bool)

(assert (=> b!571074 (=> (not res!360848) (not e!328435))))

(declare-fun arrayContainsKey!0 (array!35778 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!571074 (= res!360848 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!571075 () Bool)

(declare-fun res!360858 () Bool)

(assert (=> b!571075 (=> (not res!360858) (not e!328432))))

(declare-datatypes ((List!11259 0))(
  ( (Nil!11256) (Cons!11255 (h!12279 (_ BitVec 64)) (t!17487 List!11259)) )
))
(declare-fun arrayNoDuplicates!0 (array!35778 (_ BitVec 32) List!11259) Bool)

(assert (=> b!571075 (= res!360858 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11256))))

(declare-fun b!571076 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35778 (_ BitVec 32)) SeekEntryResult!5628)

(assert (=> b!571076 (= e!328436 (= lt!260391 (seekKeyOrZeroReturnVacant!0 (x!53608 lt!260392) (index!24741 lt!260392) (index!24741 lt!260392) (select (arr!17179 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!571077 () Bool)

(declare-fun e!328438 () Bool)

(assert (=> b!571077 (= e!328438 (= (seekEntryOrOpen!0 lt!260387 lt!260395 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53608 lt!260392) (index!24741 lt!260392) (index!24741 lt!260392) lt!260387 lt!260395 mask!3119)))))

(declare-fun b!571078 () Bool)

(declare-fun res!360851 () Bool)

(assert (=> b!571078 (=> (not res!360851) (not e!328435))))

(assert (=> b!571078 (= res!360851 (and (= (size!17543 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17543 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17543 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!571079 () Bool)

(assert (=> b!571079 (= e!328439 e!328438)))

(declare-fun res!360853 () Bool)

(assert (=> b!571079 (=> res!360853 e!328438)))

(declare-fun lt!260388 () (_ BitVec 64))

(assert (=> b!571079 (= res!360853 (or (= lt!260388 (select (arr!17179 a!3118) j!142)) (= lt!260388 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!571079 (= lt!260388 (select (arr!17179 a!3118) (index!24741 lt!260392)))))

(assert (= (and start!52318 res!360857) b!571078))

(assert (= (and b!571078 res!360851) b!571066))

(assert (= (and b!571066 res!360859) b!571067))

(assert (= (and b!571067 res!360856) b!571074))

(assert (= (and b!571074 res!360848) b!571068))

(assert (= (and b!571068 res!360849) b!571069))

(assert (= (and b!571069 res!360855) b!571075))

(assert (= (and b!571075 res!360858) b!571073))

(assert (= (and b!571073 res!360847) b!571070))

(assert (= (and b!571070 res!360854) b!571071))

(assert (= (and b!571071 (not res!360860)) b!571072))

(assert (= (and b!571072 (not res!360852)) b!571076))

(assert (= (and b!571070 (not res!360850)) b!571079))

(assert (= (and b!571079 (not res!360853)) b!571077))

(declare-fun m!550013 () Bool)

(assert (=> b!571072 m!550013))

(declare-fun m!550015 () Bool)

(assert (=> b!571072 m!550015))

(declare-fun m!550017 () Bool)

(assert (=> start!52318 m!550017))

(declare-fun m!550019 () Bool)

(assert (=> start!52318 m!550019))

(declare-fun m!550021 () Bool)

(assert (=> b!571074 m!550021))

(assert (=> b!571070 m!550013))

(assert (=> b!571070 m!550013))

(declare-fun m!550023 () Bool)

(assert (=> b!571070 m!550023))

(declare-fun m!550025 () Bool)

(assert (=> b!571070 m!550025))

(declare-fun m!550027 () Bool)

(assert (=> b!571070 m!550027))

(declare-fun m!550029 () Bool)

(assert (=> b!571069 m!550029))

(declare-fun m!550031 () Bool)

(assert (=> b!571077 m!550031))

(declare-fun m!550033 () Bool)

(assert (=> b!571077 m!550033))

(assert (=> b!571066 m!550013))

(assert (=> b!571066 m!550013))

(declare-fun m!550035 () Bool)

(assert (=> b!571066 m!550035))

(assert (=> b!571073 m!550013))

(declare-fun m!550037 () Bool)

(assert (=> b!571073 m!550037))

(declare-fun m!550039 () Bool)

(assert (=> b!571073 m!550039))

(declare-fun m!550041 () Bool)

(assert (=> b!571073 m!550041))

(declare-fun m!550043 () Bool)

(assert (=> b!571073 m!550043))

(declare-fun m!550045 () Bool)

(assert (=> b!571073 m!550045))

(assert (=> b!571073 m!550013))

(declare-fun m!550047 () Bool)

(assert (=> b!571073 m!550047))

(assert (=> b!571073 m!550013))

(declare-fun m!550049 () Bool)

(assert (=> b!571067 m!550049))

(declare-fun m!550051 () Bool)

(assert (=> b!571068 m!550051))

(declare-fun m!550053 () Bool)

(assert (=> b!571075 m!550053))

(assert (=> b!571079 m!550013))

(assert (=> b!571079 m!550015))

(assert (=> b!571076 m!550013))

(assert (=> b!571076 m!550013))

(declare-fun m!550055 () Bool)

(assert (=> b!571076 m!550055))

(check-sat (not b!571066) (not b!571077) (not b!571069) (not b!571074) (not start!52318) (not b!571075) (not b!571076) (not b!571068) (not b!571070) (not b!571067) (not b!571073))
(check-sat)
(get-model)

(declare-fun d!84713 () Bool)

(assert (=> d!84713 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52318 d!84713))

(declare-fun d!84715 () Bool)

(assert (=> d!84715 (= (array_inv!12975 a!3118) (bvsge (size!17543 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52318 d!84715))

(declare-fun b!571132 () Bool)

(declare-fun e!328477 () Bool)

(declare-fun e!328479 () Bool)

(assert (=> b!571132 (= e!328477 e!328479)))

(declare-fun res!360909 () Bool)

(assert (=> b!571132 (=> (not res!360909) (not e!328479))))

(declare-fun e!328476 () Bool)

(assert (=> b!571132 (= res!360909 (not e!328476))))

(declare-fun res!360911 () Bool)

(assert (=> b!571132 (=> (not res!360911) (not e!328476))))

(assert (=> b!571132 (= res!360911 (validKeyInArray!0 (select (arr!17179 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!84717 () Bool)

(declare-fun res!360910 () Bool)

(assert (=> d!84717 (=> res!360910 e!328477)))

(assert (=> d!84717 (= res!360910 (bvsge #b00000000000000000000000000000000 (size!17543 a!3118)))))

(assert (=> d!84717 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11256) e!328477)))

(declare-fun bm!32603 () Bool)

(declare-fun call!32606 () Bool)

(declare-fun c!65468 () Bool)

(assert (=> bm!32603 (= call!32606 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!65468 (Cons!11255 (select (arr!17179 a!3118) #b00000000000000000000000000000000) Nil!11256) Nil!11256)))))

(declare-fun b!571133 () Bool)

(declare-fun e!328478 () Bool)

(assert (=> b!571133 (= e!328478 call!32606)))

(declare-fun b!571134 () Bool)

(declare-fun contains!2880 (List!11259 (_ BitVec 64)) Bool)

(assert (=> b!571134 (= e!328476 (contains!2880 Nil!11256 (select (arr!17179 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!571135 () Bool)

(assert (=> b!571135 (= e!328479 e!328478)))

(assert (=> b!571135 (= c!65468 (validKeyInArray!0 (select (arr!17179 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!571136 () Bool)

(assert (=> b!571136 (= e!328478 call!32606)))

(assert (= (and d!84717 (not res!360910)) b!571132))

(assert (= (and b!571132 res!360911) b!571134))

(assert (= (and b!571132 res!360909) b!571135))

(assert (= (and b!571135 c!65468) b!571133))

(assert (= (and b!571135 (not c!65468)) b!571136))

(assert (= (or b!571133 b!571136) bm!32603))

(declare-fun m!550101 () Bool)

(assert (=> b!571132 m!550101))

(assert (=> b!571132 m!550101))

(declare-fun m!550103 () Bool)

(assert (=> b!571132 m!550103))

(assert (=> bm!32603 m!550101))

(declare-fun m!550105 () Bool)

(assert (=> bm!32603 m!550105))

(assert (=> b!571134 m!550101))

(assert (=> b!571134 m!550101))

(declare-fun m!550107 () Bool)

(assert (=> b!571134 m!550107))

(assert (=> b!571135 m!550101))

(assert (=> b!571135 m!550101))

(assert (=> b!571135 m!550103))

(assert (=> b!571075 d!84717))

(declare-fun lt!260431 () SeekEntryResult!5628)

(declare-fun d!84719 () Bool)

(assert (=> d!84719 (and (or ((_ is Undefined!5628) lt!260431) (not ((_ is Found!5628) lt!260431)) (and (bvsge (index!24740 lt!260431) #b00000000000000000000000000000000) (bvslt (index!24740 lt!260431) (size!17543 a!3118)))) (or ((_ is Undefined!5628) lt!260431) ((_ is Found!5628) lt!260431) (not ((_ is MissingVacant!5628) lt!260431)) (not (= (index!24742 lt!260431) (index!24741 lt!260392))) (and (bvsge (index!24742 lt!260431) #b00000000000000000000000000000000) (bvslt (index!24742 lt!260431) (size!17543 a!3118)))) (or ((_ is Undefined!5628) lt!260431) (ite ((_ is Found!5628) lt!260431) (= (select (arr!17179 a!3118) (index!24740 lt!260431)) (select (arr!17179 a!3118) j!142)) (and ((_ is MissingVacant!5628) lt!260431) (= (index!24742 lt!260431) (index!24741 lt!260392)) (= (select (arr!17179 a!3118) (index!24742 lt!260431)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!328488 () SeekEntryResult!5628)

(assert (=> d!84719 (= lt!260431 e!328488)))

(declare-fun c!65475 () Bool)

(assert (=> d!84719 (= c!65475 (bvsge (x!53608 lt!260392) #b01111111111111111111111111111110))))

(declare-fun lt!260430 () (_ BitVec 64))

(assert (=> d!84719 (= lt!260430 (select (arr!17179 a!3118) (index!24741 lt!260392)))))

(assert (=> d!84719 (validMask!0 mask!3119)))

(assert (=> d!84719 (= (seekKeyOrZeroReturnVacant!0 (x!53608 lt!260392) (index!24741 lt!260392) (index!24741 lt!260392) (select (arr!17179 a!3118) j!142) a!3118 mask!3119) lt!260431)))

(declare-fun b!571149 () Bool)

(assert (=> b!571149 (= e!328488 Undefined!5628)))

(declare-fun b!571150 () Bool)

(declare-fun e!328486 () SeekEntryResult!5628)

(assert (=> b!571150 (= e!328486 (MissingVacant!5628 (index!24741 lt!260392)))))

(declare-fun b!571151 () Bool)

(declare-fun c!65476 () Bool)

(assert (=> b!571151 (= c!65476 (= lt!260430 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!328487 () SeekEntryResult!5628)

(assert (=> b!571151 (= e!328487 e!328486)))

(declare-fun b!571152 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!571152 (= e!328486 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53608 lt!260392) #b00000000000000000000000000000001) (nextIndex!0 (index!24741 lt!260392) (x!53608 lt!260392) mask!3119) (index!24741 lt!260392) (select (arr!17179 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!571153 () Bool)

(assert (=> b!571153 (= e!328488 e!328487)))

(declare-fun c!65477 () Bool)

(assert (=> b!571153 (= c!65477 (= lt!260430 (select (arr!17179 a!3118) j!142)))))

(declare-fun b!571154 () Bool)

(assert (=> b!571154 (= e!328487 (Found!5628 (index!24741 lt!260392)))))

(assert (= (and d!84719 c!65475) b!571149))

(assert (= (and d!84719 (not c!65475)) b!571153))

(assert (= (and b!571153 c!65477) b!571154))

(assert (= (and b!571153 (not c!65477)) b!571151))

(assert (= (and b!571151 c!65476) b!571150))

(assert (= (and b!571151 (not c!65476)) b!571152))

(declare-fun m!550109 () Bool)

(assert (=> d!84719 m!550109))

(declare-fun m!550111 () Bool)

(assert (=> d!84719 m!550111))

(assert (=> d!84719 m!550015))

(assert (=> d!84719 m!550017))

(declare-fun m!550113 () Bool)

(assert (=> b!571152 m!550113))

(assert (=> b!571152 m!550113))

(assert (=> b!571152 m!550013))

(declare-fun m!550115 () Bool)

(assert (=> b!571152 m!550115))

(assert (=> b!571076 d!84719))

(declare-fun d!84721 () Bool)

(assert (=> d!84721 (= (validKeyInArray!0 (select (arr!17179 a!3118) j!142)) (and (not (= (select (arr!17179 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17179 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!571066 d!84721))

(declare-fun e!328509 () SeekEntryResult!5628)

(declare-fun b!571191 () Bool)

(assert (=> b!571191 (= e!328509 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!260386 #b00000000000000000000000000000000 mask!3119) lt!260387 lt!260395 mask!3119))))

(declare-fun b!571192 () Bool)

(declare-fun lt!260443 () SeekEntryResult!5628)

(assert (=> b!571192 (and (bvsge (index!24741 lt!260443) #b00000000000000000000000000000000) (bvslt (index!24741 lt!260443) (size!17543 lt!260395)))))

(declare-fun res!360919 () Bool)

(assert (=> b!571192 (= res!360919 (= (select (arr!17179 lt!260395) (index!24741 lt!260443)) lt!260387))))

(declare-fun e!328510 () Bool)

(assert (=> b!571192 (=> res!360919 e!328510)))

(declare-fun e!328512 () Bool)

(assert (=> b!571192 (= e!328512 e!328510)))

(declare-fun b!571193 () Bool)

(declare-fun e!328508 () Bool)

(assert (=> b!571193 (= e!328508 e!328512)))

(declare-fun res!360920 () Bool)

(assert (=> b!571193 (= res!360920 (and ((_ is Intermediate!5628) lt!260443) (not (undefined!6440 lt!260443)) (bvslt (x!53608 lt!260443) #b01111111111111111111111111111110) (bvsge (x!53608 lt!260443) #b00000000000000000000000000000000) (bvsge (x!53608 lt!260443) #b00000000000000000000000000000000)))))

(assert (=> b!571193 (=> (not res!360920) (not e!328512))))

(declare-fun b!571195 () Bool)

(assert (=> b!571195 (and (bvsge (index!24741 lt!260443) #b00000000000000000000000000000000) (bvslt (index!24741 lt!260443) (size!17543 lt!260395)))))

(declare-fun res!360918 () Bool)

(assert (=> b!571195 (= res!360918 (= (select (arr!17179 lt!260395) (index!24741 lt!260443)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!571195 (=> res!360918 e!328510)))

(declare-fun b!571196 () Bool)

(assert (=> b!571196 (= e!328508 (bvsge (x!53608 lt!260443) #b01111111111111111111111111111110))))

(declare-fun b!571197 () Bool)

(assert (=> b!571197 (= e!328509 (Intermediate!5628 false lt!260386 #b00000000000000000000000000000000))))

(declare-fun b!571198 () Bool)

(declare-fun e!328511 () SeekEntryResult!5628)

(assert (=> b!571198 (= e!328511 (Intermediate!5628 true lt!260386 #b00000000000000000000000000000000))))

(declare-fun b!571199 () Bool)

(assert (=> b!571199 (and (bvsge (index!24741 lt!260443) #b00000000000000000000000000000000) (bvslt (index!24741 lt!260443) (size!17543 lt!260395)))))

(assert (=> b!571199 (= e!328510 (= (select (arr!17179 lt!260395) (index!24741 lt!260443)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!571194 () Bool)

(assert (=> b!571194 (= e!328511 e!328509)))

(declare-fun c!65494 () Bool)

(declare-fun lt!260442 () (_ BitVec 64))

(assert (=> b!571194 (= c!65494 (or (= lt!260442 lt!260387) (= (bvadd lt!260442 lt!260442) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!84723 () Bool)

(assert (=> d!84723 e!328508))

(declare-fun c!65495 () Bool)

(assert (=> d!84723 (= c!65495 (and ((_ is Intermediate!5628) lt!260443) (undefined!6440 lt!260443)))))

(assert (=> d!84723 (= lt!260443 e!328511)))

(declare-fun c!65493 () Bool)

(assert (=> d!84723 (= c!65493 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84723 (= lt!260442 (select (arr!17179 lt!260395) lt!260386))))

(assert (=> d!84723 (validMask!0 mask!3119)))

(assert (=> d!84723 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260386 lt!260387 lt!260395 mask!3119) lt!260443)))

(assert (= (and d!84723 c!65493) b!571198))

(assert (= (and d!84723 (not c!65493)) b!571194))

(assert (= (and b!571194 c!65494) b!571197))

(assert (= (and b!571194 (not c!65494)) b!571191))

(assert (= (and d!84723 c!65495) b!571196))

(assert (= (and d!84723 (not c!65495)) b!571193))

(assert (= (and b!571193 res!360920) b!571192))

(assert (= (and b!571192 (not res!360919)) b!571195))

(assert (= (and b!571195 (not res!360918)) b!571199))

(declare-fun m!550125 () Bool)

(assert (=> b!571192 m!550125))

(declare-fun m!550127 () Bool)

(assert (=> d!84723 m!550127))

(assert (=> d!84723 m!550017))

(declare-fun m!550129 () Bool)

(assert (=> b!571191 m!550129))

(assert (=> b!571191 m!550129))

(declare-fun m!550131 () Bool)

(assert (=> b!571191 m!550131))

(assert (=> b!571199 m!550125))

(assert (=> b!571195 m!550125))

(assert (=> b!571073 d!84723))

(declare-fun e!328514 () SeekEntryResult!5628)

(declare-fun b!571200 () Bool)

(assert (=> b!571200 (= e!328514 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!260389 #b00000000000000000000000000000000 mask!3119) (select (arr!17179 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!571201 () Bool)

(declare-fun lt!260445 () SeekEntryResult!5628)

(assert (=> b!571201 (and (bvsge (index!24741 lt!260445) #b00000000000000000000000000000000) (bvslt (index!24741 lt!260445) (size!17543 a!3118)))))

(declare-fun res!360922 () Bool)

(assert (=> b!571201 (= res!360922 (= (select (arr!17179 a!3118) (index!24741 lt!260445)) (select (arr!17179 a!3118) j!142)))))

(declare-fun e!328515 () Bool)

(assert (=> b!571201 (=> res!360922 e!328515)))

(declare-fun e!328517 () Bool)

(assert (=> b!571201 (= e!328517 e!328515)))

(declare-fun b!571202 () Bool)

(declare-fun e!328513 () Bool)

(assert (=> b!571202 (= e!328513 e!328517)))

(declare-fun res!360923 () Bool)

(assert (=> b!571202 (= res!360923 (and ((_ is Intermediate!5628) lt!260445) (not (undefined!6440 lt!260445)) (bvslt (x!53608 lt!260445) #b01111111111111111111111111111110) (bvsge (x!53608 lt!260445) #b00000000000000000000000000000000) (bvsge (x!53608 lt!260445) #b00000000000000000000000000000000)))))

(assert (=> b!571202 (=> (not res!360923) (not e!328517))))

(declare-fun b!571204 () Bool)

(assert (=> b!571204 (and (bvsge (index!24741 lt!260445) #b00000000000000000000000000000000) (bvslt (index!24741 lt!260445) (size!17543 a!3118)))))

(declare-fun res!360921 () Bool)

(assert (=> b!571204 (= res!360921 (= (select (arr!17179 a!3118) (index!24741 lt!260445)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!571204 (=> res!360921 e!328515)))

(declare-fun b!571205 () Bool)

(assert (=> b!571205 (= e!328513 (bvsge (x!53608 lt!260445) #b01111111111111111111111111111110))))

(declare-fun b!571206 () Bool)

(assert (=> b!571206 (= e!328514 (Intermediate!5628 false lt!260389 #b00000000000000000000000000000000))))

(declare-fun b!571207 () Bool)

(declare-fun e!328516 () SeekEntryResult!5628)

(assert (=> b!571207 (= e!328516 (Intermediate!5628 true lt!260389 #b00000000000000000000000000000000))))

(declare-fun b!571208 () Bool)

(assert (=> b!571208 (and (bvsge (index!24741 lt!260445) #b00000000000000000000000000000000) (bvslt (index!24741 lt!260445) (size!17543 a!3118)))))

(assert (=> b!571208 (= e!328515 (= (select (arr!17179 a!3118) (index!24741 lt!260445)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!571203 () Bool)

(assert (=> b!571203 (= e!328516 e!328514)))

(declare-fun c!65497 () Bool)

(declare-fun lt!260444 () (_ BitVec 64))

(assert (=> b!571203 (= c!65497 (or (= lt!260444 (select (arr!17179 a!3118) j!142)) (= (bvadd lt!260444 lt!260444) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!84731 () Bool)

(assert (=> d!84731 e!328513))

(declare-fun c!65498 () Bool)

(assert (=> d!84731 (= c!65498 (and ((_ is Intermediate!5628) lt!260445) (undefined!6440 lt!260445)))))

(assert (=> d!84731 (= lt!260445 e!328516)))

(declare-fun c!65496 () Bool)

(assert (=> d!84731 (= c!65496 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84731 (= lt!260444 (select (arr!17179 a!3118) lt!260389))))

(assert (=> d!84731 (validMask!0 mask!3119)))

(assert (=> d!84731 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260389 (select (arr!17179 a!3118) j!142) a!3118 mask!3119) lt!260445)))

(assert (= (and d!84731 c!65496) b!571207))

(assert (= (and d!84731 (not c!65496)) b!571203))

(assert (= (and b!571203 c!65497) b!571206))

(assert (= (and b!571203 (not c!65497)) b!571200))

(assert (= (and d!84731 c!65498) b!571205))

(assert (= (and d!84731 (not c!65498)) b!571202))

(assert (= (and b!571202 res!360923) b!571201))

(assert (= (and b!571201 (not res!360922)) b!571204))

(assert (= (and b!571204 (not res!360921)) b!571208))

(declare-fun m!550133 () Bool)

(assert (=> b!571201 m!550133))

(declare-fun m!550135 () Bool)

(assert (=> d!84731 m!550135))

(assert (=> d!84731 m!550017))

(declare-fun m!550137 () Bool)

(assert (=> b!571200 m!550137))

(assert (=> b!571200 m!550137))

(assert (=> b!571200 m!550013))

(declare-fun m!550139 () Bool)

(assert (=> b!571200 m!550139))

(assert (=> b!571208 m!550133))

(assert (=> b!571204 m!550133))

(assert (=> b!571073 d!84731))

(declare-fun d!84733 () Bool)

(declare-fun lt!260451 () (_ BitVec 32))

(declare-fun lt!260450 () (_ BitVec 32))

(assert (=> d!84733 (= lt!260451 (bvmul (bvxor lt!260450 (bvlshr lt!260450 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84733 (= lt!260450 ((_ extract 31 0) (bvand (bvxor lt!260387 (bvlshr lt!260387 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84733 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!360924 (let ((h!12281 ((_ extract 31 0) (bvand (bvxor lt!260387 (bvlshr lt!260387 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53613 (bvmul (bvxor h!12281 (bvlshr h!12281 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53613 (bvlshr x!53613 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!360924 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!360924 #b00000000000000000000000000000000))))))

(assert (=> d!84733 (= (toIndex!0 lt!260387 mask!3119) (bvand (bvxor lt!260451 (bvlshr lt!260451 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!571073 d!84733))

(declare-fun d!84735 () Bool)

(declare-fun lt!260453 () (_ BitVec 32))

(declare-fun lt!260452 () (_ BitVec 32))

(assert (=> d!84735 (= lt!260453 (bvmul (bvxor lt!260452 (bvlshr lt!260452 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84735 (= lt!260452 ((_ extract 31 0) (bvand (bvxor (select (arr!17179 a!3118) j!142) (bvlshr (select (arr!17179 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84735 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!360924 (let ((h!12281 ((_ extract 31 0) (bvand (bvxor (select (arr!17179 a!3118) j!142) (bvlshr (select (arr!17179 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53613 (bvmul (bvxor h!12281 (bvlshr h!12281 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53613 (bvlshr x!53613 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!360924 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!360924 #b00000000000000000000000000000000))))))

(assert (=> d!84735 (= (toIndex!0 (select (arr!17179 a!3118) j!142) mask!3119) (bvand (bvxor lt!260453 (bvlshr lt!260453 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!571073 d!84735))

(declare-fun d!84737 () Bool)

(declare-fun res!360929 () Bool)

(declare-fun e!328522 () Bool)

(assert (=> d!84737 (=> res!360929 e!328522)))

(assert (=> d!84737 (= res!360929 (= (select (arr!17179 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!84737 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!328522)))

(declare-fun b!571213 () Bool)

(declare-fun e!328523 () Bool)

(assert (=> b!571213 (= e!328522 e!328523)))

(declare-fun res!360930 () Bool)

(assert (=> b!571213 (=> (not res!360930) (not e!328523))))

(assert (=> b!571213 (= res!360930 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17543 a!3118)))))

(declare-fun b!571214 () Bool)

(assert (=> b!571214 (= e!328523 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84737 (not res!360929)) b!571213))

(assert (= (and b!571213 res!360930) b!571214))

(assert (=> d!84737 m!550101))

(declare-fun m!550141 () Bool)

(assert (=> b!571214 m!550141))

(assert (=> b!571074 d!84737))

(declare-fun b!571231 () Bool)

(declare-fun e!328537 () Bool)

(declare-fun e!328536 () Bool)

(assert (=> b!571231 (= e!328537 e!328536)))

(declare-fun c!65503 () Bool)

(assert (=> b!571231 (= c!65503 (validKeyInArray!0 (select (arr!17179 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32608 () Bool)

(declare-fun call!32611 () Bool)

(assert (=> bm!32608 (= call!32611 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!571232 () Bool)

(assert (=> b!571232 (= e!328536 call!32611)))

(declare-fun d!84747 () Bool)

(declare-fun res!360939 () Bool)

(assert (=> d!84747 (=> res!360939 e!328537)))

(assert (=> d!84747 (= res!360939 (bvsge #b00000000000000000000000000000000 (size!17543 a!3118)))))

(assert (=> d!84747 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!328537)))

(declare-fun b!571233 () Bool)

(declare-fun e!328538 () Bool)

(assert (=> b!571233 (= e!328536 e!328538)))

(declare-fun lt!260468 () (_ BitVec 64))

(assert (=> b!571233 (= lt!260468 (select (arr!17179 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!260466 () Unit!17958)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35778 (_ BitVec 64) (_ BitVec 32)) Unit!17958)

(assert (=> b!571233 (= lt!260466 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!260468 #b00000000000000000000000000000000))))

(assert (=> b!571233 (arrayContainsKey!0 a!3118 lt!260468 #b00000000000000000000000000000000)))

(declare-fun lt!260467 () Unit!17958)

(assert (=> b!571233 (= lt!260467 lt!260466)))

(declare-fun res!360940 () Bool)

(assert (=> b!571233 (= res!360940 (= (seekEntryOrOpen!0 (select (arr!17179 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5628 #b00000000000000000000000000000000)))))

(assert (=> b!571233 (=> (not res!360940) (not e!328538))))

(declare-fun b!571234 () Bool)

(assert (=> b!571234 (= e!328538 call!32611)))

(assert (= (and d!84747 (not res!360939)) b!571231))

(assert (= (and b!571231 c!65503) b!571233))

(assert (= (and b!571231 (not c!65503)) b!571232))

(assert (= (and b!571233 res!360940) b!571234))

(assert (= (or b!571234 b!571232) bm!32608))

(assert (=> b!571231 m!550101))

(assert (=> b!571231 m!550101))

(assert (=> b!571231 m!550103))

(declare-fun m!550143 () Bool)

(assert (=> bm!32608 m!550143))

(assert (=> b!571233 m!550101))

(declare-fun m!550145 () Bool)

(assert (=> b!571233 m!550145))

(declare-fun m!550149 () Bool)

(assert (=> b!571233 m!550149))

(assert (=> b!571233 m!550101))

(declare-fun m!550153 () Bool)

(assert (=> b!571233 m!550153))

(assert (=> b!571069 d!84747))

(declare-fun b!571296 () Bool)

(declare-fun e!328577 () SeekEntryResult!5628)

(declare-fun lt!260492 () SeekEntryResult!5628)

(assert (=> b!571296 (= e!328577 (Found!5628 (index!24741 lt!260492)))))

(declare-fun b!571297 () Bool)

(declare-fun e!328576 () SeekEntryResult!5628)

(assert (=> b!571297 (= e!328576 (seekKeyOrZeroReturnVacant!0 (x!53608 lt!260492) (index!24741 lt!260492) (index!24741 lt!260492) (select (arr!17179 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!571298 () Bool)

(assert (=> b!571298 (= e!328576 (MissingZero!5628 (index!24741 lt!260492)))))

(declare-fun b!571299 () Bool)

(declare-fun e!328575 () SeekEntryResult!5628)

(assert (=> b!571299 (= e!328575 Undefined!5628)))

(declare-fun b!571300 () Bool)

(declare-fun c!65530 () Bool)

(declare-fun lt!260490 () (_ BitVec 64))

(assert (=> b!571300 (= c!65530 (= lt!260490 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!571300 (= e!328577 e!328576)))

(declare-fun d!84751 () Bool)

(declare-fun lt!260491 () SeekEntryResult!5628)

(assert (=> d!84751 (and (or ((_ is Undefined!5628) lt!260491) (not ((_ is Found!5628) lt!260491)) (and (bvsge (index!24740 lt!260491) #b00000000000000000000000000000000) (bvslt (index!24740 lt!260491) (size!17543 a!3118)))) (or ((_ is Undefined!5628) lt!260491) ((_ is Found!5628) lt!260491) (not ((_ is MissingZero!5628) lt!260491)) (and (bvsge (index!24739 lt!260491) #b00000000000000000000000000000000) (bvslt (index!24739 lt!260491) (size!17543 a!3118)))) (or ((_ is Undefined!5628) lt!260491) ((_ is Found!5628) lt!260491) ((_ is MissingZero!5628) lt!260491) (not ((_ is MissingVacant!5628) lt!260491)) (and (bvsge (index!24742 lt!260491) #b00000000000000000000000000000000) (bvslt (index!24742 lt!260491) (size!17543 a!3118)))) (or ((_ is Undefined!5628) lt!260491) (ite ((_ is Found!5628) lt!260491) (= (select (arr!17179 a!3118) (index!24740 lt!260491)) (select (arr!17179 a!3118) j!142)) (ite ((_ is MissingZero!5628) lt!260491) (= (select (arr!17179 a!3118) (index!24739 lt!260491)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5628) lt!260491) (= (select (arr!17179 a!3118) (index!24742 lt!260491)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84751 (= lt!260491 e!328575)))

(declare-fun c!65529 () Bool)

(assert (=> d!84751 (= c!65529 (and ((_ is Intermediate!5628) lt!260492) (undefined!6440 lt!260492)))))

(assert (=> d!84751 (= lt!260492 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17179 a!3118) j!142) mask!3119) (select (arr!17179 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84751 (validMask!0 mask!3119)))

(assert (=> d!84751 (= (seekEntryOrOpen!0 (select (arr!17179 a!3118) j!142) a!3118 mask!3119) lt!260491)))

(declare-fun b!571301 () Bool)

(assert (=> b!571301 (= e!328575 e!328577)))

(assert (=> b!571301 (= lt!260490 (select (arr!17179 a!3118) (index!24741 lt!260492)))))

(declare-fun c!65531 () Bool)

(assert (=> b!571301 (= c!65531 (= lt!260490 (select (arr!17179 a!3118) j!142)))))

(assert (= (and d!84751 c!65529) b!571299))

(assert (= (and d!84751 (not c!65529)) b!571301))

(assert (= (and b!571301 c!65531) b!571296))

(assert (= (and b!571301 (not c!65531)) b!571300))

(assert (= (and b!571300 c!65530) b!571298))

(assert (= (and b!571300 (not c!65530)) b!571297))

(assert (=> b!571297 m!550013))

(declare-fun m!550179 () Bool)

(assert (=> b!571297 m!550179))

(declare-fun m!550181 () Bool)

(assert (=> d!84751 m!550181))

(assert (=> d!84751 m!550037))

(assert (=> d!84751 m!550013))

(declare-fun m!550185 () Bool)

(assert (=> d!84751 m!550185))

(assert (=> d!84751 m!550017))

(assert (=> d!84751 m!550013))

(assert (=> d!84751 m!550037))

(declare-fun m!550193 () Bool)

(assert (=> d!84751 m!550193))

(declare-fun m!550195 () Bool)

(assert (=> d!84751 m!550195))

(declare-fun m!550199 () Bool)

(assert (=> b!571301 m!550199))

(assert (=> b!571070 d!84751))

(declare-fun b!571308 () Bool)

(declare-fun e!328582 () Bool)

(declare-fun e!328581 () Bool)

(assert (=> b!571308 (= e!328582 e!328581)))

(declare-fun c!65535 () Bool)

(assert (=> b!571308 (= c!65535 (validKeyInArray!0 (select (arr!17179 a!3118) j!142)))))

(declare-fun bm!32613 () Bool)

(declare-fun call!32616 () Bool)

(assert (=> bm!32613 (= call!32616 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!571309 () Bool)

(assert (=> b!571309 (= e!328581 call!32616)))

(declare-fun d!84759 () Bool)

(declare-fun res!360952 () Bool)

(assert (=> d!84759 (=> res!360952 e!328582)))

(assert (=> d!84759 (= res!360952 (bvsge j!142 (size!17543 a!3118)))))

(assert (=> d!84759 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!328582)))

(declare-fun b!571310 () Bool)

(declare-fun e!328583 () Bool)

(assert (=> b!571310 (= e!328581 e!328583)))

(declare-fun lt!260498 () (_ BitVec 64))

(assert (=> b!571310 (= lt!260498 (select (arr!17179 a!3118) j!142))))

(declare-fun lt!260496 () Unit!17958)

(assert (=> b!571310 (= lt!260496 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!260498 j!142))))

(assert (=> b!571310 (arrayContainsKey!0 a!3118 lt!260498 #b00000000000000000000000000000000)))

(declare-fun lt!260497 () Unit!17958)

(assert (=> b!571310 (= lt!260497 lt!260496)))

(declare-fun res!360953 () Bool)

(assert (=> b!571310 (= res!360953 (= (seekEntryOrOpen!0 (select (arr!17179 a!3118) j!142) a!3118 mask!3119) (Found!5628 j!142)))))

(assert (=> b!571310 (=> (not res!360953) (not e!328583))))

(declare-fun b!571311 () Bool)

(assert (=> b!571311 (= e!328583 call!32616)))

(assert (= (and d!84759 (not res!360952)) b!571308))

(assert (= (and b!571308 c!65535) b!571310))

(assert (= (and b!571308 (not c!65535)) b!571309))

(assert (= (and b!571310 res!360953) b!571311))

(assert (= (or b!571311 b!571309) bm!32613))

(assert (=> b!571308 m!550013))

(assert (=> b!571308 m!550013))

(assert (=> b!571308 m!550035))

(declare-fun m!550205 () Bool)

(assert (=> bm!32613 m!550205))

(assert (=> b!571310 m!550013))

(declare-fun m!550207 () Bool)

(assert (=> b!571310 m!550207))

(declare-fun m!550209 () Bool)

(assert (=> b!571310 m!550209))

(assert (=> b!571310 m!550013))

(assert (=> b!571310 m!550023))

(assert (=> b!571070 d!84759))

(declare-fun d!84763 () Bool)

(assert (=> d!84763 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!260507 () Unit!17958)

(declare-fun choose!38 (array!35778 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17958)

(assert (=> d!84763 (= lt!260507 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84763 (validMask!0 mask!3119)))

(assert (=> d!84763 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!260507)))

(declare-fun bs!17710 () Bool)

(assert (= bs!17710 d!84763))

(assert (=> bs!17710 m!550025))

(declare-fun m!550229 () Bool)

(assert (=> bs!17710 m!550229))

(assert (=> bs!17710 m!550017))

(assert (=> b!571070 d!84763))

(declare-fun b!571322 () Bool)

(declare-fun e!328592 () SeekEntryResult!5628)

(declare-fun lt!260510 () SeekEntryResult!5628)

(assert (=> b!571322 (= e!328592 (Found!5628 (index!24741 lt!260510)))))

(declare-fun b!571323 () Bool)

(declare-fun e!328591 () SeekEntryResult!5628)

(assert (=> b!571323 (= e!328591 (seekKeyOrZeroReturnVacant!0 (x!53608 lt!260510) (index!24741 lt!260510) (index!24741 lt!260510) lt!260387 lt!260395 mask!3119))))

(declare-fun b!571324 () Bool)

(assert (=> b!571324 (= e!328591 (MissingZero!5628 (index!24741 lt!260510)))))

(declare-fun b!571325 () Bool)

(declare-fun e!328590 () SeekEntryResult!5628)

(assert (=> b!571325 (= e!328590 Undefined!5628)))

(declare-fun b!571326 () Bool)

(declare-fun c!65541 () Bool)

(declare-fun lt!260508 () (_ BitVec 64))

(assert (=> b!571326 (= c!65541 (= lt!260508 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!571326 (= e!328592 e!328591)))

(declare-fun d!84769 () Bool)

(declare-fun lt!260509 () SeekEntryResult!5628)

(assert (=> d!84769 (and (or ((_ is Undefined!5628) lt!260509) (not ((_ is Found!5628) lt!260509)) (and (bvsge (index!24740 lt!260509) #b00000000000000000000000000000000) (bvslt (index!24740 lt!260509) (size!17543 lt!260395)))) (or ((_ is Undefined!5628) lt!260509) ((_ is Found!5628) lt!260509) (not ((_ is MissingZero!5628) lt!260509)) (and (bvsge (index!24739 lt!260509) #b00000000000000000000000000000000) (bvslt (index!24739 lt!260509) (size!17543 lt!260395)))) (or ((_ is Undefined!5628) lt!260509) ((_ is Found!5628) lt!260509) ((_ is MissingZero!5628) lt!260509) (not ((_ is MissingVacant!5628) lt!260509)) (and (bvsge (index!24742 lt!260509) #b00000000000000000000000000000000) (bvslt (index!24742 lt!260509) (size!17543 lt!260395)))) (or ((_ is Undefined!5628) lt!260509) (ite ((_ is Found!5628) lt!260509) (= (select (arr!17179 lt!260395) (index!24740 lt!260509)) lt!260387) (ite ((_ is MissingZero!5628) lt!260509) (= (select (arr!17179 lt!260395) (index!24739 lt!260509)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5628) lt!260509) (= (select (arr!17179 lt!260395) (index!24742 lt!260509)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84769 (= lt!260509 e!328590)))

(declare-fun c!65540 () Bool)

(assert (=> d!84769 (= c!65540 (and ((_ is Intermediate!5628) lt!260510) (undefined!6440 lt!260510)))))

(assert (=> d!84769 (= lt!260510 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!260387 mask!3119) lt!260387 lt!260395 mask!3119))))

(assert (=> d!84769 (validMask!0 mask!3119)))

(assert (=> d!84769 (= (seekEntryOrOpen!0 lt!260387 lt!260395 mask!3119) lt!260509)))

(declare-fun b!571327 () Bool)

(assert (=> b!571327 (= e!328590 e!328592)))

(assert (=> b!571327 (= lt!260508 (select (arr!17179 lt!260395) (index!24741 lt!260510)))))

(declare-fun c!65542 () Bool)

(assert (=> b!571327 (= c!65542 (= lt!260508 lt!260387))))

(assert (= (and d!84769 c!65540) b!571325))

(assert (= (and d!84769 (not c!65540)) b!571327))

(assert (= (and b!571327 c!65542) b!571322))

(assert (= (and b!571327 (not c!65542)) b!571326))

(assert (= (and b!571326 c!65541) b!571324))

(assert (= (and b!571326 (not c!65541)) b!571323))

(declare-fun m!550231 () Bool)

(assert (=> b!571323 m!550231))

(declare-fun m!550233 () Bool)

(assert (=> d!84769 m!550233))

(assert (=> d!84769 m!550045))

(declare-fun m!550235 () Bool)

(assert (=> d!84769 m!550235))

(assert (=> d!84769 m!550017))

(assert (=> d!84769 m!550045))

(declare-fun m!550237 () Bool)

(assert (=> d!84769 m!550237))

(declare-fun m!550239 () Bool)

(assert (=> d!84769 m!550239))

(declare-fun m!550241 () Bool)

(assert (=> b!571327 m!550241))

(assert (=> b!571077 d!84769))

(declare-fun lt!260519 () SeekEntryResult!5628)

(declare-fun d!84771 () Bool)

(assert (=> d!84771 (and (or ((_ is Undefined!5628) lt!260519) (not ((_ is Found!5628) lt!260519)) (and (bvsge (index!24740 lt!260519) #b00000000000000000000000000000000) (bvslt (index!24740 lt!260519) (size!17543 lt!260395)))) (or ((_ is Undefined!5628) lt!260519) ((_ is Found!5628) lt!260519) (not ((_ is MissingVacant!5628) lt!260519)) (not (= (index!24742 lt!260519) (index!24741 lt!260392))) (and (bvsge (index!24742 lt!260519) #b00000000000000000000000000000000) (bvslt (index!24742 lt!260519) (size!17543 lt!260395)))) (or ((_ is Undefined!5628) lt!260519) (ite ((_ is Found!5628) lt!260519) (= (select (arr!17179 lt!260395) (index!24740 lt!260519)) lt!260387) (and ((_ is MissingVacant!5628) lt!260519) (= (index!24742 lt!260519) (index!24741 lt!260392)) (= (select (arr!17179 lt!260395) (index!24742 lt!260519)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!328597 () SeekEntryResult!5628)

(assert (=> d!84771 (= lt!260519 e!328597)))

(declare-fun c!65544 () Bool)

(assert (=> d!84771 (= c!65544 (bvsge (x!53608 lt!260392) #b01111111111111111111111111111110))))

(declare-fun lt!260518 () (_ BitVec 64))

(assert (=> d!84771 (= lt!260518 (select (arr!17179 lt!260395) (index!24741 lt!260392)))))

(assert (=> d!84771 (validMask!0 mask!3119)))

(assert (=> d!84771 (= (seekKeyOrZeroReturnVacant!0 (x!53608 lt!260392) (index!24741 lt!260392) (index!24741 lt!260392) lt!260387 lt!260395 mask!3119) lt!260519)))

(declare-fun b!571332 () Bool)

(assert (=> b!571332 (= e!328597 Undefined!5628)))

(declare-fun b!571333 () Bool)

(declare-fun e!328594 () SeekEntryResult!5628)

(assert (=> b!571333 (= e!328594 (MissingVacant!5628 (index!24741 lt!260392)))))

(declare-fun b!571334 () Bool)

(declare-fun c!65546 () Bool)

(assert (=> b!571334 (= c!65546 (= lt!260518 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!328596 () SeekEntryResult!5628)

(assert (=> b!571334 (= e!328596 e!328594)))

(declare-fun b!571335 () Bool)

(assert (=> b!571335 (= e!328594 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53608 lt!260392) #b00000000000000000000000000000001) (nextIndex!0 (index!24741 lt!260392) (x!53608 lt!260392) mask!3119) (index!24741 lt!260392) lt!260387 lt!260395 mask!3119))))

(declare-fun b!571336 () Bool)

(assert (=> b!571336 (= e!328597 e!328596)))

(declare-fun c!65547 () Bool)

(assert (=> b!571336 (= c!65547 (= lt!260518 lt!260387))))

(declare-fun b!571337 () Bool)

(assert (=> b!571337 (= e!328596 (Found!5628 (index!24741 lt!260392)))))

(assert (= (and d!84771 c!65544) b!571332))

(assert (= (and d!84771 (not c!65544)) b!571336))

(assert (= (and b!571336 c!65547) b!571337))

(assert (= (and b!571336 (not c!65547)) b!571334))

(assert (= (and b!571334 c!65546) b!571333))

(assert (= (and b!571334 (not c!65546)) b!571335))

(declare-fun m!550245 () Bool)

(assert (=> d!84771 m!550245))

(declare-fun m!550247 () Bool)

(assert (=> d!84771 m!550247))

(declare-fun m!550249 () Bool)

(assert (=> d!84771 m!550249))

(assert (=> d!84771 m!550017))

(assert (=> b!571335 m!550113))

(assert (=> b!571335 m!550113))

(declare-fun m!550251 () Bool)

(assert (=> b!571335 m!550251))

(assert (=> b!571077 d!84771))

(declare-fun d!84775 () Bool)

(assert (=> d!84775 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!571067 d!84775))

(declare-fun b!571346 () Bool)

(declare-fun e!328604 () SeekEntryResult!5628)

(declare-fun lt!260524 () SeekEntryResult!5628)

(assert (=> b!571346 (= e!328604 (Found!5628 (index!24741 lt!260524)))))

(declare-fun b!571347 () Bool)

(declare-fun e!328603 () SeekEntryResult!5628)

(assert (=> b!571347 (= e!328603 (seekKeyOrZeroReturnVacant!0 (x!53608 lt!260524) (index!24741 lt!260524) (index!24741 lt!260524) k0!1914 a!3118 mask!3119))))

(declare-fun b!571348 () Bool)

(assert (=> b!571348 (= e!328603 (MissingZero!5628 (index!24741 lt!260524)))))

(declare-fun b!571349 () Bool)

(declare-fun e!328602 () SeekEntryResult!5628)

(assert (=> b!571349 (= e!328602 Undefined!5628)))

(declare-fun b!571350 () Bool)

(declare-fun c!65553 () Bool)

(declare-fun lt!260522 () (_ BitVec 64))

(assert (=> b!571350 (= c!65553 (= lt!260522 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!571350 (= e!328604 e!328603)))

(declare-fun d!84777 () Bool)

(declare-fun lt!260523 () SeekEntryResult!5628)

(assert (=> d!84777 (and (or ((_ is Undefined!5628) lt!260523) (not ((_ is Found!5628) lt!260523)) (and (bvsge (index!24740 lt!260523) #b00000000000000000000000000000000) (bvslt (index!24740 lt!260523) (size!17543 a!3118)))) (or ((_ is Undefined!5628) lt!260523) ((_ is Found!5628) lt!260523) (not ((_ is MissingZero!5628) lt!260523)) (and (bvsge (index!24739 lt!260523) #b00000000000000000000000000000000) (bvslt (index!24739 lt!260523) (size!17543 a!3118)))) (or ((_ is Undefined!5628) lt!260523) ((_ is Found!5628) lt!260523) ((_ is MissingZero!5628) lt!260523) (not ((_ is MissingVacant!5628) lt!260523)) (and (bvsge (index!24742 lt!260523) #b00000000000000000000000000000000) (bvslt (index!24742 lt!260523) (size!17543 a!3118)))) (or ((_ is Undefined!5628) lt!260523) (ite ((_ is Found!5628) lt!260523) (= (select (arr!17179 a!3118) (index!24740 lt!260523)) k0!1914) (ite ((_ is MissingZero!5628) lt!260523) (= (select (arr!17179 a!3118) (index!24739 lt!260523)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5628) lt!260523) (= (select (arr!17179 a!3118) (index!24742 lt!260523)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84777 (= lt!260523 e!328602)))

(declare-fun c!65552 () Bool)

(assert (=> d!84777 (= c!65552 (and ((_ is Intermediate!5628) lt!260524) (undefined!6440 lt!260524)))))

(assert (=> d!84777 (= lt!260524 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!84777 (validMask!0 mask!3119)))

(assert (=> d!84777 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!260523)))

(declare-fun b!571351 () Bool)

(assert (=> b!571351 (= e!328602 e!328604)))

(assert (=> b!571351 (= lt!260522 (select (arr!17179 a!3118) (index!24741 lt!260524)))))

(declare-fun c!65554 () Bool)

(assert (=> b!571351 (= c!65554 (= lt!260522 k0!1914))))

(assert (= (and d!84777 c!65552) b!571349))

(assert (= (and d!84777 (not c!65552)) b!571351))

(assert (= (and b!571351 c!65554) b!571346))

(assert (= (and b!571351 (not c!65554)) b!571350))

(assert (= (and b!571350 c!65553) b!571348))

(assert (= (and b!571350 (not c!65553)) b!571347))

(declare-fun m!550253 () Bool)

(assert (=> b!571347 m!550253))

(declare-fun m!550255 () Bool)

(assert (=> d!84777 m!550255))

(declare-fun m!550257 () Bool)

(assert (=> d!84777 m!550257))

(declare-fun m!550259 () Bool)

(assert (=> d!84777 m!550259))

(assert (=> d!84777 m!550017))

(assert (=> d!84777 m!550257))

(declare-fun m!550261 () Bool)

(assert (=> d!84777 m!550261))

(declare-fun m!550263 () Bool)

(assert (=> d!84777 m!550263))

(declare-fun m!550265 () Bool)

(assert (=> b!571351 m!550265))

(assert (=> b!571068 d!84777))

(check-sat (not b!571132) (not b!571135) (not b!571297) (not d!84731) (not b!571152) (not b!571214) (not d!84719) (not b!571310) (not b!571231) (not b!571134) (not b!571347) (not d!84723) (not d!84751) (not b!571200) (not b!571323) (not b!571335) (not d!84769) (not d!84763) (not d!84777) (not b!571191) (not b!571308) (not bm!32613) (not bm!32608) (not bm!32603) (not d!84771) (not b!571233))
(check-sat)
