; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52316 () Bool)

(assert start!52316)

(declare-fun b!571024 () Bool)

(declare-fun e!328410 () Bool)

(declare-fun e!328405 () Bool)

(assert (=> b!571024 (= e!328410 e!328405)))

(declare-fun res!360808 () Bool)

(assert (=> b!571024 (=> (not res!360808) (not e!328405))))

(declare-datatypes ((array!35776 0))(
  ( (array!35777 (arr!17178 (Array (_ BitVec 32) (_ BitVec 64))) (size!17542 (_ BitVec 32))) )
))
(declare-fun lt!260357 () array!35776)

(declare-datatypes ((SeekEntryResult!5627 0))(
  ( (MissingZero!5627 (index!24735 (_ BitVec 32))) (Found!5627 (index!24736 (_ BitVec 32))) (Intermediate!5627 (undefined!6439 Bool) (index!24737 (_ BitVec 32)) (x!53607 (_ BitVec 32))) (Undefined!5627) (MissingVacant!5627 (index!24738 (_ BitVec 32))) )
))
(declare-fun lt!260358 () SeekEntryResult!5627)

(declare-fun lt!260356 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!260361 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35776 (_ BitVec 32)) SeekEntryResult!5627)

(assert (=> b!571024 (= res!360808 (= lt!260358 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260356 lt!260361 lt!260357 mask!3119)))))

(declare-fun lt!260362 () (_ BitVec 32))

(declare-fun a!3118 () array!35776)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!571024 (= lt!260358 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260362 (select (arr!17178 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!571024 (= lt!260356 (toIndex!0 lt!260361 mask!3119))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!571024 (= lt!260361 (select (store (arr!17178 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!571024 (= lt!260362 (toIndex!0 (select (arr!17178 a!3118) j!142) mask!3119))))

(assert (=> b!571024 (= lt!260357 (array!35777 (store (arr!17178 a!3118) i!1132 k!1914) (size!17542 a!3118)))))

(declare-fun b!571025 () Bool)

(declare-fun res!360817 () Bool)

(declare-fun e!328412 () Bool)

(assert (=> b!571025 (=> (not res!360817) (not e!328412))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!571025 (= res!360817 (validKeyInArray!0 (select (arr!17178 a!3118) j!142)))))

(declare-fun b!571026 () Bool)

(declare-fun e!328409 () Bool)

(declare-fun e!328408 () Bool)

(assert (=> b!571026 (= e!328409 e!328408)))

(declare-fun res!360806 () Bool)

(assert (=> b!571026 (=> res!360806 e!328408)))

(declare-fun lt!260360 () (_ BitVec 64))

(assert (=> b!571026 (= res!360806 (or (= lt!260360 (select (arr!17178 a!3118) j!142)) (= lt!260360 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!571026 (= lt!260360 (select (arr!17178 a!3118) (index!24737 lt!260358)))))

(declare-fun b!571027 () Bool)

(assert (=> b!571027 (= e!328412 e!328410)))

(declare-fun res!360813 () Bool)

(assert (=> b!571027 (=> (not res!360813) (not e!328410))))

(declare-fun lt!260364 () SeekEntryResult!5627)

(assert (=> b!571027 (= res!360813 (or (= lt!260364 (MissingZero!5627 i!1132)) (= lt!260364 (MissingVacant!5627 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35776 (_ BitVec 32)) SeekEntryResult!5627)

(assert (=> b!571027 (= lt!260364 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!571028 () Bool)

(assert (=> b!571028 (= e!328405 (not e!328409))))

(declare-fun res!360807 () Bool)

(assert (=> b!571028 (=> res!360807 e!328409)))

(assert (=> b!571028 (= res!360807 (or (undefined!6439 lt!260358) (not (is-Intermediate!5627 lt!260358))))))

(declare-fun e!328406 () Bool)

(assert (=> b!571028 e!328406))

(declare-fun res!360818 () Bool)

(assert (=> b!571028 (=> (not res!360818) (not e!328406))))

(declare-fun lt!260359 () SeekEntryResult!5627)

(assert (=> b!571028 (= res!360818 (= lt!260359 (Found!5627 j!142)))))

(assert (=> b!571028 (= lt!260359 (seekEntryOrOpen!0 (select (arr!17178 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35776 (_ BitVec 32)) Bool)

(assert (=> b!571028 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17956 0))(
  ( (Unit!17957) )
))
(declare-fun lt!260365 () Unit!17956)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35776 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17956)

(assert (=> b!571028 (= lt!260365 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!571030 () Bool)

(declare-fun res!360812 () Bool)

(assert (=> b!571030 (=> (not res!360812) (not e!328410))))

(assert (=> b!571030 (= res!360812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!571031 () Bool)

(declare-fun res!360809 () Bool)

(assert (=> b!571031 (=> (not res!360809) (not e!328412))))

(assert (=> b!571031 (= res!360809 (and (= (size!17542 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17542 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17542 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!571032 () Bool)

(declare-fun e!328413 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35776 (_ BitVec 32)) SeekEntryResult!5627)

(assert (=> b!571032 (= e!328413 (= lt!260359 (seekKeyOrZeroReturnVacant!0 (x!53607 lt!260358) (index!24737 lt!260358) (index!24737 lt!260358) (select (arr!17178 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!571033 () Bool)

(declare-fun res!360811 () Bool)

(assert (=> b!571033 (=> (not res!360811) (not e!328412))))

(assert (=> b!571033 (= res!360811 (validKeyInArray!0 k!1914))))

(declare-fun b!571034 () Bool)

(declare-fun e!328407 () Bool)

(assert (=> b!571034 (= e!328407 e!328413)))

(declare-fun res!360814 () Bool)

(assert (=> b!571034 (=> res!360814 e!328413)))

(declare-fun lt!260363 () (_ BitVec 64))

(assert (=> b!571034 (= res!360814 (or (= lt!260363 (select (arr!17178 a!3118) j!142)) (= lt!260363 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!571034 (= lt!260363 (select (arr!17178 a!3118) (index!24737 lt!260358)))))

(declare-fun b!571035 () Bool)

(declare-fun res!360815 () Bool)

(assert (=> b!571035 (=> (not res!360815) (not e!328410))))

(declare-datatypes ((List!11258 0))(
  ( (Nil!11255) (Cons!11254 (h!12278 (_ BitVec 64)) (t!17486 List!11258)) )
))
(declare-fun arrayNoDuplicates!0 (array!35776 (_ BitVec 32) List!11258) Bool)

(assert (=> b!571035 (= res!360815 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11255))))

(declare-fun b!571036 () Bool)

(assert (=> b!571036 (= e!328406 e!328407)))

(declare-fun res!360810 () Bool)

(assert (=> b!571036 (=> res!360810 e!328407)))

(assert (=> b!571036 (= res!360810 (or (undefined!6439 lt!260358) (not (is-Intermediate!5627 lt!260358))))))

(declare-fun b!571037 () Bool)

(assert (=> b!571037 (= e!328408 (= (seekEntryOrOpen!0 lt!260361 lt!260357 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53607 lt!260358) (index!24737 lt!260358) (index!24737 lt!260358) lt!260361 lt!260357 mask!3119)))))

(declare-fun res!360805 () Bool)

(assert (=> start!52316 (=> (not res!360805) (not e!328412))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52316 (= res!360805 (validMask!0 mask!3119))))

(assert (=> start!52316 e!328412))

(assert (=> start!52316 true))

(declare-fun array_inv!12974 (array!35776) Bool)

(assert (=> start!52316 (array_inv!12974 a!3118)))

(declare-fun b!571029 () Bool)

(declare-fun res!360816 () Bool)

(assert (=> b!571029 (=> (not res!360816) (not e!328412))))

(declare-fun arrayContainsKey!0 (array!35776 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!571029 (= res!360816 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!52316 res!360805) b!571031))

(assert (= (and b!571031 res!360809) b!571025))

(assert (= (and b!571025 res!360817) b!571033))

(assert (= (and b!571033 res!360811) b!571029))

(assert (= (and b!571029 res!360816) b!571027))

(assert (= (and b!571027 res!360813) b!571030))

(assert (= (and b!571030 res!360812) b!571035))

(assert (= (and b!571035 res!360815) b!571024))

(assert (= (and b!571024 res!360808) b!571028))

(assert (= (and b!571028 res!360818) b!571036))

(assert (= (and b!571036 (not res!360810)) b!571034))

(assert (= (and b!571034 (not res!360814)) b!571032))

(assert (= (and b!571028 (not res!360807)) b!571026))

(assert (= (and b!571026 (not res!360806)) b!571037))

(declare-fun m!549969 () Bool)

(assert (=> b!571033 m!549969))

(declare-fun m!549971 () Bool)

(assert (=> b!571030 m!549971))

(declare-fun m!549973 () Bool)

(assert (=> b!571035 m!549973))

(declare-fun m!549975 () Bool)

(assert (=> b!571034 m!549975))

(declare-fun m!549977 () Bool)

(assert (=> b!571034 m!549977))

(assert (=> b!571028 m!549975))

(assert (=> b!571028 m!549975))

(declare-fun m!549979 () Bool)

(assert (=> b!571028 m!549979))

(declare-fun m!549981 () Bool)

(assert (=> b!571028 m!549981))

(declare-fun m!549983 () Bool)

(assert (=> b!571028 m!549983))

(assert (=> b!571026 m!549975))

(assert (=> b!571026 m!549977))

(declare-fun m!549985 () Bool)

(assert (=> b!571037 m!549985))

(declare-fun m!549987 () Bool)

(assert (=> b!571037 m!549987))

(assert (=> b!571024 m!549975))

(declare-fun m!549989 () Bool)

(assert (=> b!571024 m!549989))

(declare-fun m!549991 () Bool)

(assert (=> b!571024 m!549991))

(assert (=> b!571024 m!549975))

(declare-fun m!549993 () Bool)

(assert (=> b!571024 m!549993))

(declare-fun m!549995 () Bool)

(assert (=> b!571024 m!549995))

(declare-fun m!549997 () Bool)

(assert (=> b!571024 m!549997))

(assert (=> b!571024 m!549975))

(declare-fun m!549999 () Bool)

(assert (=> b!571024 m!549999))

(declare-fun m!550001 () Bool)

(assert (=> start!52316 m!550001))

(declare-fun m!550003 () Bool)

(assert (=> start!52316 m!550003))

(assert (=> b!571032 m!549975))

(assert (=> b!571032 m!549975))

(declare-fun m!550005 () Bool)

(assert (=> b!571032 m!550005))

(declare-fun m!550007 () Bool)

(assert (=> b!571027 m!550007))

(assert (=> b!571025 m!549975))

(assert (=> b!571025 m!549975))

(declare-fun m!550009 () Bool)

(assert (=> b!571025 m!550009))

(declare-fun m!550011 () Bool)

(assert (=> b!571029 m!550011))

(push 1)

(assert (not b!571025))

(assert (not b!571027))

(assert (not b!571037))

(assert (not b!571035))

(assert (not b!571028))

(assert (not b!571033))

(assert (not b!571024))

(assert (not b!571030))

(assert (not start!52316))

(assert (not b!571029))

(assert (not b!571032))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!571185 () Bool)

(declare-fun c!65491 () Bool)

(declare-fun lt!260440 () (_ BitVec 64))

(assert (=> b!571185 (= c!65491 (= lt!260440 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!328507 () SeekEntryResult!5627)

(declare-fun e!328505 () SeekEntryResult!5627)

(assert (=> b!571185 (= e!328507 e!328505)))

(declare-fun d!84725 () Bool)

(declare-fun lt!260441 () SeekEntryResult!5627)

(assert (=> d!84725 (and (or (is-Undefined!5627 lt!260441) (not (is-Found!5627 lt!260441)) (and (bvsge (index!24736 lt!260441) #b00000000000000000000000000000000) (bvslt (index!24736 lt!260441) (size!17542 a!3118)))) (or (is-Undefined!5627 lt!260441) (is-Found!5627 lt!260441) (not (is-MissingVacant!5627 lt!260441)) (not (= (index!24738 lt!260441) (index!24737 lt!260358))) (and (bvsge (index!24738 lt!260441) #b00000000000000000000000000000000) (bvslt (index!24738 lt!260441) (size!17542 a!3118)))) (or (is-Undefined!5627 lt!260441) (ite (is-Found!5627 lt!260441) (= (select (arr!17178 a!3118) (index!24736 lt!260441)) (select (arr!17178 a!3118) j!142)) (and (is-MissingVacant!5627 lt!260441) (= (index!24738 lt!260441) (index!24737 lt!260358)) (= (select (arr!17178 a!3118) (index!24738 lt!260441)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!328506 () SeekEntryResult!5627)

(assert (=> d!84725 (= lt!260441 e!328506)))

(declare-fun c!65492 () Bool)

(assert (=> d!84725 (= c!65492 (bvsge (x!53607 lt!260358) #b01111111111111111111111111111110))))

(assert (=> d!84725 (= lt!260440 (select (arr!17178 a!3118) (index!24737 lt!260358)))))

(assert (=> d!84725 (validMask!0 mask!3119)))

(assert (=> d!84725 (= (seekKeyOrZeroReturnVacant!0 (x!53607 lt!260358) (index!24737 lt!260358) (index!24737 lt!260358) (select (arr!17178 a!3118) j!142) a!3118 mask!3119) lt!260441)))

(declare-fun b!571186 () Bool)

(assert (=> b!571186 (= e!328507 (Found!5627 (index!24737 lt!260358)))))

(declare-fun b!571187 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!571187 (= e!328505 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53607 lt!260358) #b00000000000000000000000000000001) (nextIndex!0 (index!24737 lt!260358) (x!53607 lt!260358) mask!3119) (index!24737 lt!260358) (select (arr!17178 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!571188 () Bool)

(assert (=> b!571188 (= e!328506 Undefined!5627)))

(declare-fun b!571189 () Bool)

(assert (=> b!571189 (= e!328505 (MissingVacant!5627 (index!24737 lt!260358)))))

(declare-fun b!571190 () Bool)

(assert (=> b!571190 (= e!328506 e!328507)))

(declare-fun c!65490 () Bool)

(assert (=> b!571190 (= c!65490 (= lt!260440 (select (arr!17178 a!3118) j!142)))))

(assert (= (and d!84725 c!65492) b!571188))

(assert (= (and d!84725 (not c!65492)) b!571190))

(assert (= (and b!571190 c!65490) b!571186))

(assert (= (and b!571190 (not c!65490)) b!571185))

(assert (= (and b!571185 c!65491) b!571189))

(assert (= (and b!571185 (not c!65491)) b!571187))

(declare-fun m!550117 () Bool)

(assert (=> d!84725 m!550117))

(declare-fun m!550119 () Bool)

(assert (=> d!84725 m!550119))

(assert (=> d!84725 m!549977))

(assert (=> d!84725 m!550001))

(declare-fun m!550121 () Bool)

(assert (=> b!571187 m!550121))

(assert (=> b!571187 m!550121))

(assert (=> b!571187 m!549975))

(declare-fun m!550123 () Bool)

(assert (=> b!571187 m!550123))

(assert (=> b!571032 d!84725))

(declare-fun d!84729 () Bool)

(assert (=> d!84729 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52316 d!84729))

(declare-fun d!84743 () Bool)

(assert (=> d!84743 (= (array_inv!12974 a!3118) (bvsge (size!17542 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52316 d!84743))

(declare-fun d!84745 () Bool)

(assert (=> d!84745 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!571033 d!84745))

(declare-fun b!571235 () Bool)

(declare-fun e!328539 () Bool)

(declare-fun call!32612 () Bool)

(assert (=> b!571235 (= e!328539 call!32612)))

(declare-fun b!571236 () Bool)

(declare-fun e!328540 () Bool)

(declare-fun e!328541 () Bool)

(assert (=> b!571236 (= e!328540 e!328541)))

(declare-fun c!65504 () Bool)

(assert (=> b!571236 (= c!65504 (validKeyInArray!0 (select (arr!17178 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!84749 () Bool)

(declare-fun res!360941 () Bool)

(assert (=> d!84749 (=> res!360941 e!328540)))

(assert (=> d!84749 (= res!360941 (bvsge #b00000000000000000000000000000000 (size!17542 a!3118)))))

(assert (=> d!84749 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!328540)))

(declare-fun b!571237 () Bool)

(assert (=> b!571237 (= e!328541 e!328539)))

(declare-fun lt!260469 () (_ BitVec 64))

(assert (=> b!571237 (= lt!260469 (select (arr!17178 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!260471 () Unit!17956)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35776 (_ BitVec 64) (_ BitVec 32)) Unit!17956)

(assert (=> b!571237 (= lt!260471 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!260469 #b00000000000000000000000000000000))))

(assert (=> b!571237 (arrayContainsKey!0 a!3118 lt!260469 #b00000000000000000000000000000000)))

(declare-fun lt!260470 () Unit!17956)

(assert (=> b!571237 (= lt!260470 lt!260471)))

(declare-fun res!360942 () Bool)

(assert (=> b!571237 (= res!360942 (= (seekEntryOrOpen!0 (select (arr!17178 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5627 #b00000000000000000000000000000000)))))

(assert (=> b!571237 (=> (not res!360942) (not e!328539))))

(declare-fun b!571238 () Bool)

(assert (=> b!571238 (= e!328541 call!32612)))

(declare-fun bm!32609 () Bool)

(assert (=> bm!32609 (= call!32612 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!84749 (not res!360941)) b!571236))

(assert (= (and b!571236 c!65504) b!571237))

(assert (= (and b!571236 (not c!65504)) b!571238))

(assert (= (and b!571237 res!360942) b!571235))

(assert (= (or b!571235 b!571238) bm!32609))

(declare-fun m!550147 () Bool)

(assert (=> b!571236 m!550147))

(assert (=> b!571236 m!550147))

(declare-fun m!550151 () Bool)

(assert (=> b!571236 m!550151))

(assert (=> b!571237 m!550147))

(declare-fun m!550155 () Bool)

(assert (=> b!571237 m!550155))

(declare-fun m!550157 () Bool)

(assert (=> b!571237 m!550157))

(assert (=> b!571237 m!550147))

(declare-fun m!550159 () Bool)

(assert (=> b!571237 m!550159))

(declare-fun m!550161 () Bool)

(assert (=> bm!32609 m!550161))

(assert (=> b!571030 d!84749))

(declare-fun b!571302 () Bool)

(declare-fun e!328579 () SeekEntryResult!5627)

(declare-fun e!328580 () SeekEntryResult!5627)

(assert (=> b!571302 (= e!328579 e!328580)))

(declare-fun lt!260495 () (_ BitVec 64))

(declare-fun lt!260494 () SeekEntryResult!5627)

(assert (=> b!571302 (= lt!260495 (select (arr!17178 a!3118) (index!24737 lt!260494)))))

(declare-fun c!65533 () Bool)

(assert (=> b!571302 (= c!65533 (= lt!260495 k!1914))))

(declare-fun b!571303 () Bool)

(declare-fun c!65532 () Bool)

(assert (=> b!571303 (= c!65532 (= lt!260495 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!328578 () SeekEntryResult!5627)

(assert (=> b!571303 (= e!328580 e!328578)))

(declare-fun d!84753 () Bool)

(declare-fun lt!260493 () SeekEntryResult!5627)

(assert (=> d!84753 (and (or (is-Undefined!5627 lt!260493) (not (is-Found!5627 lt!260493)) (and (bvsge (index!24736 lt!260493) #b00000000000000000000000000000000) (bvslt (index!24736 lt!260493) (size!17542 a!3118)))) (or (is-Undefined!5627 lt!260493) (is-Found!5627 lt!260493) (not (is-MissingZero!5627 lt!260493)) (and (bvsge (index!24735 lt!260493) #b00000000000000000000000000000000) (bvslt (index!24735 lt!260493) (size!17542 a!3118)))) (or (is-Undefined!5627 lt!260493) (is-Found!5627 lt!260493) (is-MissingZero!5627 lt!260493) (not (is-MissingVacant!5627 lt!260493)) (and (bvsge (index!24738 lt!260493) #b00000000000000000000000000000000) (bvslt (index!24738 lt!260493) (size!17542 a!3118)))) (or (is-Undefined!5627 lt!260493) (ite (is-Found!5627 lt!260493) (= (select (arr!17178 a!3118) (index!24736 lt!260493)) k!1914) (ite (is-MissingZero!5627 lt!260493) (= (select (arr!17178 a!3118) (index!24735 lt!260493)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5627 lt!260493) (= (select (arr!17178 a!3118) (index!24738 lt!260493)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84753 (= lt!260493 e!328579)))

(declare-fun c!65534 () Bool)

(assert (=> d!84753 (= c!65534 (and (is-Intermediate!5627 lt!260494) (undefined!6439 lt!260494)))))

(assert (=> d!84753 (= lt!260494 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!84753 (validMask!0 mask!3119)))

(assert (=> d!84753 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!260493)))

(declare-fun b!571304 () Bool)

(assert (=> b!571304 (= e!328579 Undefined!5627)))

(declare-fun b!571305 () Bool)

(assert (=> b!571305 (= e!328578 (seekKeyOrZeroReturnVacant!0 (x!53607 lt!260494) (index!24737 lt!260494) (index!24737 lt!260494) k!1914 a!3118 mask!3119))))

(declare-fun b!571306 () Bool)

(assert (=> b!571306 (= e!328580 (Found!5627 (index!24737 lt!260494)))))

(declare-fun b!571307 () Bool)

(assert (=> b!571307 (= e!328578 (MissingZero!5627 (index!24737 lt!260494)))))

(assert (= (and d!84753 c!65534) b!571304))

(assert (= (and d!84753 (not c!65534)) b!571302))

(assert (= (and b!571302 c!65533) b!571306))

(assert (= (and b!571302 (not c!65533)) b!571303))

(assert (= (and b!571303 c!65532) b!571307))

(assert (= (and b!571303 (not c!65532)) b!571305))

(declare-fun m!550183 () Bool)

(assert (=> b!571302 m!550183))

(declare-fun m!550187 () Bool)

(assert (=> d!84753 m!550187))

(declare-fun m!550189 () Bool)

(assert (=> d!84753 m!550189))

(declare-fun m!550191 () Bool)

(assert (=> d!84753 m!550191))

(assert (=> d!84753 m!550189))

(declare-fun m!550197 () Bool)

(assert (=> d!84753 m!550197))

(declare-fun m!550201 () Bool)

(assert (=> d!84753 m!550201))

(assert (=> d!84753 m!550001))

(declare-fun m!550203 () Bool)

(assert (=> b!571305 m!550203))

(assert (=> b!571027 d!84753))

(declare-fun b!571312 () Bool)

(declare-fun e!328585 () SeekEntryResult!5627)

(declare-fun e!328586 () SeekEntryResult!5627)

(assert (=> b!571312 (= e!328585 e!328586)))

(declare-fun lt!260501 () (_ BitVec 64))

(declare-fun lt!260500 () SeekEntryResult!5627)

(assert (=> b!571312 (= lt!260501 (select (arr!17178 a!3118) (index!24737 lt!260500)))))

(declare-fun c!65537 () Bool)

(assert (=> b!571312 (= c!65537 (= lt!260501 (select (arr!17178 a!3118) j!142)))))

(declare-fun b!571313 () Bool)

(declare-fun c!65536 () Bool)

(assert (=> b!571313 (= c!65536 (= lt!260501 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!328584 () SeekEntryResult!5627)

(assert (=> b!571313 (= e!328586 e!328584)))

(declare-fun d!84761 () Bool)

(declare-fun lt!260499 () SeekEntryResult!5627)

(assert (=> d!84761 (and (or (is-Undefined!5627 lt!260499) (not (is-Found!5627 lt!260499)) (and (bvsge (index!24736 lt!260499) #b00000000000000000000000000000000) (bvslt (index!24736 lt!260499) (size!17542 a!3118)))) (or (is-Undefined!5627 lt!260499) (is-Found!5627 lt!260499) (not (is-MissingZero!5627 lt!260499)) (and (bvsge (index!24735 lt!260499) #b00000000000000000000000000000000) (bvslt (index!24735 lt!260499) (size!17542 a!3118)))) (or (is-Undefined!5627 lt!260499) (is-Found!5627 lt!260499) (is-MissingZero!5627 lt!260499) (not (is-MissingVacant!5627 lt!260499)) (and (bvsge (index!24738 lt!260499) #b00000000000000000000000000000000) (bvslt (index!24738 lt!260499) (size!17542 a!3118)))) (or (is-Undefined!5627 lt!260499) (ite (is-Found!5627 lt!260499) (= (select (arr!17178 a!3118) (index!24736 lt!260499)) (select (arr!17178 a!3118) j!142)) (ite (is-MissingZero!5627 lt!260499) (= (select (arr!17178 a!3118) (index!24735 lt!260499)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5627 lt!260499) (= (select (arr!17178 a!3118) (index!24738 lt!260499)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84761 (= lt!260499 e!328585)))

(declare-fun c!65538 () Bool)

(assert (=> d!84761 (= c!65538 (and (is-Intermediate!5627 lt!260500) (undefined!6439 lt!260500)))))

(assert (=> d!84761 (= lt!260500 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17178 a!3118) j!142) mask!3119) (select (arr!17178 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84761 (validMask!0 mask!3119)))

(assert (=> d!84761 (= (seekEntryOrOpen!0 (select (arr!17178 a!3118) j!142) a!3118 mask!3119) lt!260499)))

(declare-fun b!571314 () Bool)

(assert (=> b!571314 (= e!328585 Undefined!5627)))

(declare-fun b!571315 () Bool)

(assert (=> b!571315 (= e!328584 (seekKeyOrZeroReturnVacant!0 (x!53607 lt!260500) (index!24737 lt!260500) (index!24737 lt!260500) (select (arr!17178 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!571316 () Bool)

(assert (=> b!571316 (= e!328586 (Found!5627 (index!24737 lt!260500)))))

(declare-fun b!571317 () Bool)

(assert (=> b!571317 (= e!328584 (MissingZero!5627 (index!24737 lt!260500)))))

(assert (= (and d!84761 c!65538) b!571314))

(assert (= (and d!84761 (not c!65538)) b!571312))

(assert (= (and b!571312 c!65537) b!571316))

(assert (= (and b!571312 (not c!65537)) b!571313))

(assert (= (and b!571313 c!65536) b!571317))

(assert (= (and b!571313 (not c!65536)) b!571315))

(declare-fun m!550211 () Bool)

(assert (=> b!571312 m!550211))

(declare-fun m!550213 () Bool)

(assert (=> d!84761 m!550213))

(assert (=> d!84761 m!549989))

(assert (=> d!84761 m!549975))

(declare-fun m!550215 () Bool)

(assert (=> d!84761 m!550215))

(assert (=> d!84761 m!549975))

(assert (=> d!84761 m!549989))

(declare-fun m!550217 () Bool)

(assert (=> d!84761 m!550217))

(declare-fun m!550219 () Bool)

(assert (=> d!84761 m!550219))

(assert (=> d!84761 m!550001))

(assert (=> b!571315 m!549975))

(declare-fun m!550221 () Bool)

(assert (=> b!571315 m!550221))

(assert (=> b!571028 d!84761))

(declare-fun b!571318 () Bool)

(declare-fun e!328587 () Bool)

(declare-fun call!32617 () Bool)

(assert (=> b!571318 (= e!328587 call!32617)))

(declare-fun b!571319 () Bool)

(declare-fun e!328588 () Bool)

(declare-fun e!328589 () Bool)

(assert (=> b!571319 (= e!328588 e!328589)))

(declare-fun c!65539 () Bool)

(assert (=> b!571319 (= c!65539 (validKeyInArray!0 (select (arr!17178 a!3118) j!142)))))

(declare-fun d!84765 () Bool)

(declare-fun res!360954 () Bool)

(assert (=> d!84765 (=> res!360954 e!328588)))

(assert (=> d!84765 (= res!360954 (bvsge j!142 (size!17542 a!3118)))))

(assert (=> d!84765 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!328588)))

(declare-fun b!571320 () Bool)

(assert (=> b!571320 (= e!328589 e!328587)))

(declare-fun lt!260502 () (_ BitVec 64))

(assert (=> b!571320 (= lt!260502 (select (arr!17178 a!3118) j!142))))

(declare-fun lt!260504 () Unit!17956)

(assert (=> b!571320 (= lt!260504 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!260502 j!142))))

(assert (=> b!571320 (arrayContainsKey!0 a!3118 lt!260502 #b00000000000000000000000000000000)))

(declare-fun lt!260503 () Unit!17956)

(assert (=> b!571320 (= lt!260503 lt!260504)))

(declare-fun res!360955 () Bool)

(assert (=> b!571320 (= res!360955 (= (seekEntryOrOpen!0 (select (arr!17178 a!3118) j!142) a!3118 mask!3119) (Found!5627 j!142)))))

(assert (=> b!571320 (=> (not res!360955) (not e!328587))))

(declare-fun b!571321 () Bool)

(assert (=> b!571321 (= e!328589 call!32617)))

(declare-fun bm!32614 () Bool)

(assert (=> bm!32614 (= call!32617 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!84765 (not res!360954)) b!571319))

(assert (= (and b!571319 c!65539) b!571320))

(assert (= (and b!571319 (not c!65539)) b!571321))

(assert (= (and b!571320 res!360955) b!571318))

(assert (= (or b!571318 b!571321) bm!32614))

(assert (=> b!571319 m!549975))

(assert (=> b!571319 m!549975))

(assert (=> b!571319 m!550009))

(assert (=> b!571320 m!549975))

(declare-fun m!550223 () Bool)

(assert (=> b!571320 m!550223))

(declare-fun m!550225 () Bool)

(assert (=> b!571320 m!550225))

(assert (=> b!571320 m!549975))

(assert (=> b!571320 m!549979))

(declare-fun m!550227 () Bool)

(assert (=> bm!32614 m!550227))

(assert (=> b!571028 d!84765))

(declare-fun d!84767 () Bool)

(assert (=> d!84767 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!260517 () Unit!17956)

(declare-fun choose!38 (array!35776 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17956)

(assert (=> d!84767 (= lt!260517 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84767 (validMask!0 mask!3119)))

(assert (=> d!84767 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!260517)))

(declare-fun bs!17711 () Bool)

(assert (= bs!17711 d!84767))

(assert (=> bs!17711 m!549981))

(declare-fun m!550243 () Bool)

(assert (=> bs!17711 m!550243))

(assert (=> bs!17711 m!550001))

(assert (=> b!571028 d!84767))

(declare-fun d!84773 () Bool)

(declare-fun res!360960 () Bool)

(declare-fun e!328609 () Bool)

(assert (=> d!84773 (=> res!360960 e!328609)))

(assert (=> d!84773 (= res!360960 (= (select (arr!17178 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!84773 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!328609)))

(declare-fun b!571356 () Bool)

(declare-fun e!328610 () Bool)

(assert (=> b!571356 (= e!328609 e!328610)))

(declare-fun res!360961 () Bool)

(assert (=> b!571356 (=> (not res!360961) (not e!328610))))

(assert (=> b!571356 (= res!360961 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17542 a!3118)))))

(declare-fun b!571357 () Bool)

(assert (=> b!571357 (= e!328610 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84773 (not res!360960)) b!571356))

(assert (= (and b!571356 res!360961) b!571357))

(assert (=> d!84773 m!550147))

(declare-fun m!550267 () Bool)

(assert (=> b!571357 m!550267))

(assert (=> b!571029 d!84773))

(declare-fun b!571394 () Bool)

(declare-fun e!328636 () Bool)

(declare-fun e!328633 () Bool)

(assert (=> b!571394 (= e!328636 e!328633)))

(declare-fun res!360976 () Bool)

(declare-fun lt!260541 () SeekEntryResult!5627)

(assert (=> b!571394 (= res!360976 (and (is-Intermediate!5627 lt!260541) (not (undefined!6439 lt!260541)) (bvslt (x!53607 lt!260541) #b01111111111111111111111111111110) (bvsge (x!53607 lt!260541) #b00000000000000000000000000000000) (bvsge (x!53607 lt!260541) #b00000000000000000000000000000000)))))

(assert (=> b!571394 (=> (not res!360976) (not e!328633))))

(declare-fun b!571395 () Bool)

(declare-fun e!328637 () SeekEntryResult!5627)

(assert (=> b!571395 (= e!328637 (Intermediate!5627 false lt!260356 #b00000000000000000000000000000000))))

(declare-fun b!571396 () Bool)

(assert (=> b!571396 (and (bvsge (index!24737 lt!260541) #b00000000000000000000000000000000) (bvslt (index!24737 lt!260541) (size!17542 lt!260357)))))

(declare-fun e!328635 () Bool)

(assert (=> b!571396 (= e!328635 (= (select (arr!17178 lt!260357) (index!24737 lt!260541)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!84779 () Bool)

(assert (=> d!84779 e!328636))

(declare-fun c!65568 () Bool)

(assert (=> d!84779 (= c!65568 (and (is-Intermediate!5627 lt!260541) (undefined!6439 lt!260541)))))

(declare-fun e!328634 () SeekEntryResult!5627)

(assert (=> d!84779 (= lt!260541 e!328634)))

(declare-fun c!65569 () Bool)

(assert (=> d!84779 (= c!65569 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!260542 () (_ BitVec 64))

(assert (=> d!84779 (= lt!260542 (select (arr!17178 lt!260357) lt!260356))))

(assert (=> d!84779 (validMask!0 mask!3119)))

(assert (=> d!84779 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260356 lt!260361 lt!260357 mask!3119) lt!260541)))

(declare-fun b!571397 () Bool)

(assert (=> b!571397 (and (bvsge (index!24737 lt!260541) #b00000000000000000000000000000000) (bvslt (index!24737 lt!260541) (size!17542 lt!260357)))))

(declare-fun res!360974 () Bool)

(assert (=> b!571397 (= res!360974 (= (select (arr!17178 lt!260357) (index!24737 lt!260541)) lt!260361))))

(assert (=> b!571397 (=> res!360974 e!328635)))

(assert (=> b!571397 (= e!328633 e!328635)))

(declare-fun b!571398 () Bool)

(assert (=> b!571398 (= e!328634 e!328637)))

(declare-fun c!65567 () Bool)

(assert (=> b!571398 (= c!65567 (or (= lt!260542 lt!260361) (= (bvadd lt!260542 lt!260542) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!571399 () Bool)

(assert (=> b!571399 (= e!328637 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!260356 #b00000000000000000000000000000000 mask!3119) lt!260361 lt!260357 mask!3119))))

(declare-fun b!571400 () Bool)

(assert (=> b!571400 (= e!328636 (bvsge (x!53607 lt!260541) #b01111111111111111111111111111110))))

(declare-fun b!571401 () Bool)

(assert (=> b!571401 (= e!328634 (Intermediate!5627 true lt!260356 #b00000000000000000000000000000000))))

(declare-fun b!571402 () Bool)

(assert (=> b!571402 (and (bvsge (index!24737 lt!260541) #b00000000000000000000000000000000) (bvslt (index!24737 lt!260541) (size!17542 lt!260357)))))

(declare-fun res!360975 () Bool)

(assert (=> b!571402 (= res!360975 (= (select (arr!17178 lt!260357) (index!24737 lt!260541)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!571402 (=> res!360975 e!328635)))

(assert (= (and d!84779 c!65569) b!571401))

(assert (= (and d!84779 (not c!65569)) b!571398))

(assert (= (and b!571398 c!65567) b!571395))

(assert (= (and b!571398 (not c!65567)) b!571399))

(assert (= (and d!84779 c!65568) b!571400))

(assert (= (and d!84779 (not c!65568)) b!571394))

(assert (= (and b!571394 res!360976) b!571397))

(assert (= (and b!571397 (not res!360974)) b!571402))

(assert (= (and b!571402 (not res!360975)) b!571396))

(declare-fun m!550291 () Bool)

(assert (=> b!571397 m!550291))

(declare-fun m!550293 () Bool)

(assert (=> d!84779 m!550293))

(assert (=> d!84779 m!550001))

(assert (=> b!571396 m!550291))

(declare-fun m!550295 () Bool)

(assert (=> b!571399 m!550295))

(assert (=> b!571399 m!550295))

(declare-fun m!550297 () Bool)

(assert (=> b!571399 m!550297))

(assert (=> b!571402 m!550291))

(assert (=> b!571024 d!84779))

(declare-fun b!571403 () Bool)

(declare-fun e!328641 () Bool)

(declare-fun e!328638 () Bool)

(assert (=> b!571403 (= e!328641 e!328638)))

(declare-fun res!360979 () Bool)

(declare-fun lt!260543 () SeekEntryResult!5627)

(assert (=> b!571403 (= res!360979 (and (is-Intermediate!5627 lt!260543) (not (undefined!6439 lt!260543)) (bvslt (x!53607 lt!260543) #b01111111111111111111111111111110) (bvsge (x!53607 lt!260543) #b00000000000000000000000000000000) (bvsge (x!53607 lt!260543) #b00000000000000000000000000000000)))))

(assert (=> b!571403 (=> (not res!360979) (not e!328638))))

(declare-fun b!571404 () Bool)

(declare-fun e!328642 () SeekEntryResult!5627)

(assert (=> b!571404 (= e!328642 (Intermediate!5627 false lt!260362 #b00000000000000000000000000000000))))

(declare-fun b!571405 () Bool)

(assert (=> b!571405 (and (bvsge (index!24737 lt!260543) #b00000000000000000000000000000000) (bvslt (index!24737 lt!260543) (size!17542 a!3118)))))

(declare-fun e!328640 () Bool)

(assert (=> b!571405 (= e!328640 (= (select (arr!17178 a!3118) (index!24737 lt!260543)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!84787 () Bool)

(assert (=> d!84787 e!328641))

(declare-fun c!65571 () Bool)

(assert (=> d!84787 (= c!65571 (and (is-Intermediate!5627 lt!260543) (undefined!6439 lt!260543)))))

(declare-fun e!328639 () SeekEntryResult!5627)

(assert (=> d!84787 (= lt!260543 e!328639)))

(declare-fun c!65572 () Bool)

(assert (=> d!84787 (= c!65572 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!260544 () (_ BitVec 64))

(assert (=> d!84787 (= lt!260544 (select (arr!17178 a!3118) lt!260362))))

(assert (=> d!84787 (validMask!0 mask!3119)))

(assert (=> d!84787 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260362 (select (arr!17178 a!3118) j!142) a!3118 mask!3119) lt!260543)))

(declare-fun b!571406 () Bool)

(assert (=> b!571406 (and (bvsge (index!24737 lt!260543) #b00000000000000000000000000000000) (bvslt (index!24737 lt!260543) (size!17542 a!3118)))))

(declare-fun res!360977 () Bool)

(assert (=> b!571406 (= res!360977 (= (select (arr!17178 a!3118) (index!24737 lt!260543)) (select (arr!17178 a!3118) j!142)))))

(assert (=> b!571406 (=> res!360977 e!328640)))

(assert (=> b!571406 (= e!328638 e!328640)))

(declare-fun b!571407 () Bool)

(assert (=> b!571407 (= e!328639 e!328642)))

(declare-fun c!65570 () Bool)

(assert (=> b!571407 (= c!65570 (or (= lt!260544 (select (arr!17178 a!3118) j!142)) (= (bvadd lt!260544 lt!260544) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!571408 () Bool)

(assert (=> b!571408 (= e!328642 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!260362 #b00000000000000000000000000000000 mask!3119) (select (arr!17178 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!571409 () Bool)

(assert (=> b!571409 (= e!328641 (bvsge (x!53607 lt!260543) #b01111111111111111111111111111110))))

(declare-fun b!571410 () Bool)

(assert (=> b!571410 (= e!328639 (Intermediate!5627 true lt!260362 #b00000000000000000000000000000000))))

(declare-fun b!571411 () Bool)

(assert (=> b!571411 (and (bvsge (index!24737 lt!260543) #b00000000000000000000000000000000) (bvslt (index!24737 lt!260543) (size!17542 a!3118)))))

(declare-fun res!360978 () Bool)

(assert (=> b!571411 (= res!360978 (= (select (arr!17178 a!3118) (index!24737 lt!260543)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!571411 (=> res!360978 e!328640)))

(assert (= (and d!84787 c!65572) b!571410))

(assert (= (and d!84787 (not c!65572)) b!571407))

(assert (= (and b!571407 c!65570) b!571404))

(assert (= (and b!571407 (not c!65570)) b!571408))

(assert (= (and d!84787 c!65571) b!571409))

(assert (= (and d!84787 (not c!65571)) b!571403))

(assert (= (and b!571403 res!360979) b!571406))

(assert (= (and b!571406 (not res!360977)) b!571411))

(assert (= (and b!571411 (not res!360978)) b!571405))

(declare-fun m!550299 () Bool)

(assert (=> b!571406 m!550299))

(declare-fun m!550301 () Bool)

(assert (=> d!84787 m!550301))

(assert (=> d!84787 m!550001))

(assert (=> b!571405 m!550299))

(declare-fun m!550303 () Bool)

(assert (=> b!571408 m!550303))

(assert (=> b!571408 m!550303))

(assert (=> b!571408 m!549975))

(declare-fun m!550305 () Bool)

(assert (=> b!571408 m!550305))

(assert (=> b!571411 m!550299))

(assert (=> b!571024 d!84787))

(declare-fun d!84789 () Bool)

(declare-fun lt!260550 () (_ BitVec 32))

(declare-fun lt!260549 () (_ BitVec 32))

(assert (=> d!84789 (= lt!260550 (bvmul (bvxor lt!260549 (bvlshr lt!260549 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84789 (= lt!260549 ((_ extract 31 0) (bvand (bvxor lt!260361 (bvlshr lt!260361 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84789 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!360984 (let ((h!12282 ((_ extract 31 0) (bvand (bvxor lt!260361 (bvlshr lt!260361 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53616 (bvmul (bvxor h!12282 (bvlshr h!12282 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53616 (bvlshr x!53616 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!360984 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!360984 #b00000000000000000000000000000000))))))

(assert (=> d!84789 (= (toIndex!0 lt!260361 mask!3119) (bvand (bvxor lt!260550 (bvlshr lt!260550 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!571024 d!84789))

(declare-fun d!84793 () Bool)

(declare-fun lt!260552 () (_ BitVec 32))

(declare-fun lt!260551 () (_ BitVec 32))

(assert (=> d!84793 (= lt!260552 (bvmul (bvxor lt!260551 (bvlshr lt!260551 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84793 (= lt!260551 ((_ extract 31 0) (bvand (bvxor (select (arr!17178 a!3118) j!142) (bvlshr (select (arr!17178 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84793 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!360984 (let ((h!12282 ((_ extract 31 0) (bvand (bvxor (select (arr!17178 a!3118) j!142) (bvlshr (select (arr!17178 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53616 (bvmul (bvxor h!12282 (bvlshr h!12282 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53616 (bvlshr x!53616 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!360984 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!360984 #b00000000000000000000000000000000))))))

(assert (=> d!84793 (= (toIndex!0 (select (arr!17178 a!3118) j!142) mask!3119) (bvand (bvxor lt!260552 (bvlshr lt!260552 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!571024 d!84793))

(declare-fun b!571428 () Bool)

(declare-fun e!328660 () Bool)

(declare-fun e!328658 () Bool)

(assert (=> b!571428 (= e!328660 e!328658)))

(declare-fun res!360995 () Bool)

(assert (=> b!571428 (=> (not res!360995) (not e!328658))))

(declare-fun e!328659 () Bool)

(assert (=> b!571428 (= res!360995 (not e!328659))))

(declare-fun res!360993 () Bool)

(assert (=> b!571428 (=> (not res!360993) (not e!328659))))

(assert (=> b!571428 (= res!360993 (validKeyInArray!0 (select (arr!17178 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!571429 () Bool)

(declare-fun e!328657 () Bool)

(declare-fun call!32623 () Bool)

(assert (=> b!571429 (= e!328657 call!32623)))

(declare-fun bm!32620 () Bool)

(declare-fun c!65575 () Bool)

(assert (=> bm!32620 (= call!32623 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!65575 (Cons!11254 (select (arr!17178 a!3118) #b00000000000000000000000000000000) Nil!11255) Nil!11255)))))

(declare-fun b!571430 () Bool)

(declare-fun contains!2882 (List!11258 (_ BitVec 64)) Bool)

(assert (=> b!571430 (= e!328659 (contains!2882 Nil!11255 (select (arr!17178 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!571431 () Bool)

(assert (=> b!571431 (= e!328657 call!32623)))

(declare-fun d!84795 () Bool)

(declare-fun res!360994 () Bool)

(assert (=> d!84795 (=> res!360994 e!328660)))

(assert (=> d!84795 (= res!360994 (bvsge #b00000000000000000000000000000000 (size!17542 a!3118)))))

(assert (=> d!84795 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11255) e!328660)))

(declare-fun b!571432 () Bool)

(assert (=> b!571432 (= e!328658 e!328657)))

(assert (=> b!571432 (= c!65575 (validKeyInArray!0 (select (arr!17178 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!84795 (not res!360994)) b!571428))

(assert (= (and b!571428 res!360993) b!571430))

(assert (= (and b!571428 res!360995) b!571432))

(assert (= (and b!571432 c!65575) b!571431))

(assert (= (and b!571432 (not c!65575)) b!571429))

(assert (= (or b!571431 b!571429) bm!32620))

(assert (=> b!571428 m!550147))

(assert (=> b!571428 m!550147))

(assert (=> b!571428 m!550151))

(assert (=> bm!32620 m!550147))

(declare-fun m!550309 () Bool)

(assert (=> bm!32620 m!550309))

(assert (=> b!571430 m!550147))

(assert (=> b!571430 m!550147))

(declare-fun m!550311 () Bool)

(assert (=> b!571430 m!550311))

(assert (=> b!571432 m!550147))

(assert (=> b!571432 m!550147))

(assert (=> b!571432 m!550151))

(assert (=> b!571035 d!84795))

(declare-fun d!84797 () Bool)

(assert (=> d!84797 (= (validKeyInArray!0 (select (arr!17178 a!3118) j!142)) (and (not (= (select (arr!17178 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17178 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!571025 d!84797))

(declare-fun b!571433 () Bool)

(declare-fun e!328662 () SeekEntryResult!5627)

(declare-fun e!328663 () SeekEntryResult!5627)

(assert (=> b!571433 (= e!328662 e!328663)))

(declare-fun lt!260555 () (_ BitVec 64))

(declare-fun lt!260554 () SeekEntryResult!5627)

(assert (=> b!571433 (= lt!260555 (select (arr!17178 lt!260357) (index!24737 lt!260554)))))

(declare-fun c!65577 () Bool)

(assert (=> b!571433 (= c!65577 (= lt!260555 lt!260361))))

(declare-fun b!571434 () Bool)

(declare-fun c!65576 () Bool)

(assert (=> b!571434 (= c!65576 (= lt!260555 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!328661 () SeekEntryResult!5627)

(assert (=> b!571434 (= e!328663 e!328661)))

(declare-fun d!84799 () Bool)

(declare-fun lt!260553 () SeekEntryResult!5627)

(assert (=> d!84799 (and (or (is-Undefined!5627 lt!260553) (not (is-Found!5627 lt!260553)) (and (bvsge (index!24736 lt!260553) #b00000000000000000000000000000000) (bvslt (index!24736 lt!260553) (size!17542 lt!260357)))) (or (is-Undefined!5627 lt!260553) (is-Found!5627 lt!260553) (not (is-MissingZero!5627 lt!260553)) (and (bvsge (index!24735 lt!260553) #b00000000000000000000000000000000) (bvslt (index!24735 lt!260553) (size!17542 lt!260357)))) (or (is-Undefined!5627 lt!260553) (is-Found!5627 lt!260553) (is-MissingZero!5627 lt!260553) (not (is-MissingVacant!5627 lt!260553)) (and (bvsge (index!24738 lt!260553) #b00000000000000000000000000000000) (bvslt (index!24738 lt!260553) (size!17542 lt!260357)))) (or (is-Undefined!5627 lt!260553) (ite (is-Found!5627 lt!260553) (= (select (arr!17178 lt!260357) (index!24736 lt!260553)) lt!260361) (ite (is-MissingZero!5627 lt!260553) (= (select (arr!17178 lt!260357) (index!24735 lt!260553)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5627 lt!260553) (= (select (arr!17178 lt!260357) (index!24738 lt!260553)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84799 (= lt!260553 e!328662)))

(declare-fun c!65578 () Bool)

(assert (=> d!84799 (= c!65578 (and (is-Intermediate!5627 lt!260554) (undefined!6439 lt!260554)))))

(assert (=> d!84799 (= lt!260554 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!260361 mask!3119) lt!260361 lt!260357 mask!3119))))

(assert (=> d!84799 (validMask!0 mask!3119)))

(assert (=> d!84799 (= (seekEntryOrOpen!0 lt!260361 lt!260357 mask!3119) lt!260553)))

(declare-fun b!571435 () Bool)

(assert (=> b!571435 (= e!328662 Undefined!5627)))

(declare-fun b!571436 () Bool)

(assert (=> b!571436 (= e!328661 (seekKeyOrZeroReturnVacant!0 (x!53607 lt!260554) (index!24737 lt!260554) (index!24737 lt!260554) lt!260361 lt!260357 mask!3119))))

(declare-fun b!571437 () Bool)

(assert (=> b!571437 (= e!328663 (Found!5627 (index!24737 lt!260554)))))

(declare-fun b!571438 () Bool)

(assert (=> b!571438 (= e!328661 (MissingZero!5627 (index!24737 lt!260554)))))

(assert (= (and d!84799 c!65578) b!571435))

(assert (= (and d!84799 (not c!65578)) b!571433))

(assert (= (and b!571433 c!65577) b!571437))

(assert (= (and b!571433 (not c!65577)) b!571434))

(assert (= (and b!571434 c!65576) b!571438))

(assert (= (and b!571434 (not c!65576)) b!571436))

(declare-fun m!550313 () Bool)

(assert (=> b!571433 m!550313))

(declare-fun m!550315 () Bool)

(assert (=> d!84799 m!550315))

(assert (=> d!84799 m!549993))

(declare-fun m!550317 () Bool)

(assert (=> d!84799 m!550317))

(assert (=> d!84799 m!549993))

(declare-fun m!550319 () Bool)

(assert (=> d!84799 m!550319))

(declare-fun m!550321 () Bool)

(assert (=> d!84799 m!550321))

(assert (=> d!84799 m!550001))

(declare-fun m!550323 () Bool)

(assert (=> b!571436 m!550323))

(assert (=> b!571037 d!84799))

(declare-fun b!571439 () Bool)

