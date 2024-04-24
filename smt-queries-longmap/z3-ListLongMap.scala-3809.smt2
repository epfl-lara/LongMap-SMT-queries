; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52254 () Bool)

(assert start!52254)

(declare-fun b!570187 () Bool)

(declare-fun res!360105 () Bool)

(declare-fun e!327946 () Bool)

(assert (=> b!570187 (=> (not res!360105) (not e!327946))))

(declare-datatypes ((array!35724 0))(
  ( (array!35725 (arr!17152 (Array (_ BitVec 32) (_ BitVec 64))) (size!17516 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35724)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35724 (_ BitVec 32)) Bool)

(assert (=> b!570187 (= res!360105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!570188 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun e!327944 () Bool)

(declare-datatypes ((SeekEntryResult!5557 0))(
  ( (MissingZero!5557 (index!24455 (_ BitVec 32))) (Found!5557 (index!24456 (_ BitVec 32))) (Intermediate!5557 (undefined!6369 Bool) (index!24457 (_ BitVec 32)) (x!53475 (_ BitVec 32))) (Undefined!5557) (MissingVacant!5557 (index!24458 (_ BitVec 32))) )
))
(declare-fun lt!259937 () SeekEntryResult!5557)

(declare-fun lt!259935 () SeekEntryResult!5557)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35724 (_ BitVec 32)) SeekEntryResult!5557)

(assert (=> b!570188 (= e!327944 (= lt!259937 (seekKeyOrZeroReturnVacant!0 (x!53475 lt!259935) (index!24457 lt!259935) (index!24457 lt!259935) (select (arr!17152 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!570189 () Bool)

(declare-fun e!327945 () Bool)

(assert (=> b!570189 (= e!327945 e!327946)))

(declare-fun res!360100 () Bool)

(assert (=> b!570189 (=> (not res!360100) (not e!327946))))

(declare-fun lt!259934 () SeekEntryResult!5557)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!570189 (= res!360100 (or (= lt!259934 (MissingZero!5557 i!1132)) (= lt!259934 (MissingVacant!5557 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35724 (_ BitVec 32)) SeekEntryResult!5557)

(assert (=> b!570189 (= lt!259934 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!570190 () Bool)

(declare-fun e!327948 () Bool)

(assert (=> b!570190 (= e!327946 e!327948)))

(declare-fun res!360107 () Bool)

(assert (=> b!570190 (=> (not res!360107) (not e!327948))))

(declare-fun lt!259936 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35724 (_ BitVec 32)) SeekEntryResult!5557)

(assert (=> b!570190 (= res!360107 (= lt!259935 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259936 (select (store (arr!17152 a!3118) i!1132 k0!1914) j!142) (array!35725 (store (arr!17152 a!3118) i!1132 k0!1914) (size!17516 a!3118)) mask!3119)))))

(declare-fun lt!259939 () (_ BitVec 32))

(assert (=> b!570190 (= lt!259935 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259939 (select (arr!17152 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570190 (= lt!259936 (toIndex!0 (select (store (arr!17152 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!570190 (= lt!259939 (toIndex!0 (select (arr!17152 a!3118) j!142) mask!3119))))

(declare-fun b!570192 () Bool)

(declare-fun res!360103 () Bool)

(assert (=> b!570192 (=> (not res!360103) (not e!327946))))

(declare-datatypes ((List!11139 0))(
  ( (Nil!11136) (Cons!11135 (h!12159 (_ BitVec 64)) (t!17359 List!11139)) )
))
(declare-fun arrayNoDuplicates!0 (array!35724 (_ BitVec 32) List!11139) Bool)

(assert (=> b!570192 (= res!360103 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11136))))

(declare-fun b!570191 () Bool)

(declare-fun res!360101 () Bool)

(assert (=> b!570191 (=> (not res!360101) (not e!327945))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!570191 (= res!360101 (validKeyInArray!0 k0!1914))))

(declare-fun res!360102 () Bool)

(assert (=> start!52254 (=> (not res!360102) (not e!327945))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52254 (= res!360102 (validMask!0 mask!3119))))

(assert (=> start!52254 e!327945))

(assert (=> start!52254 true))

(declare-fun array_inv!13011 (array!35724) Bool)

(assert (=> start!52254 (array_inv!13011 a!3118)))

(declare-fun b!570193 () Bool)

(declare-fun res!360109 () Bool)

(assert (=> b!570193 (=> (not res!360109) (not e!327945))))

(declare-fun arrayContainsKey!0 (array!35724 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!570193 (= res!360109 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!570194 () Bool)

(assert (=> b!570194 (= e!327948 (not e!327944))))

(declare-fun res!360104 () Bool)

(assert (=> b!570194 (=> res!360104 e!327944)))

(get-info :version)

(assert (=> b!570194 (= res!360104 (or (undefined!6369 lt!259935) (not ((_ is Intermediate!5557) lt!259935)) (= (select (arr!17152 a!3118) (index!24457 lt!259935)) (select (arr!17152 a!3118) j!142)) (= (select (arr!17152 a!3118) (index!24457 lt!259935)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!570194 (= lt!259937 (Found!5557 j!142))))

(assert (=> b!570194 (= lt!259937 (seekEntryOrOpen!0 (select (arr!17152 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!570194 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17887 0))(
  ( (Unit!17888) )
))
(declare-fun lt!259938 () Unit!17887)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35724 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17887)

(assert (=> b!570194 (= lt!259938 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!570195 () Bool)

(declare-fun res!360106 () Bool)

(assert (=> b!570195 (=> (not res!360106) (not e!327945))))

(assert (=> b!570195 (= res!360106 (validKeyInArray!0 (select (arr!17152 a!3118) j!142)))))

(declare-fun b!570196 () Bool)

(declare-fun res!360108 () Bool)

(assert (=> b!570196 (=> (not res!360108) (not e!327945))))

(assert (=> b!570196 (= res!360108 (and (= (size!17516 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17516 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17516 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!52254 res!360102) b!570196))

(assert (= (and b!570196 res!360108) b!570195))

(assert (= (and b!570195 res!360106) b!570191))

(assert (= (and b!570191 res!360101) b!570193))

(assert (= (and b!570193 res!360109) b!570189))

(assert (= (and b!570189 res!360100) b!570187))

(assert (= (and b!570187 res!360105) b!570192))

(assert (= (and b!570192 res!360103) b!570190))

(assert (= (and b!570190 res!360107) b!570194))

(assert (= (and b!570194 (not res!360104)) b!570188))

(declare-fun m!549239 () Bool)

(assert (=> b!570189 m!549239))

(declare-fun m!549241 () Bool)

(assert (=> b!570188 m!549241))

(assert (=> b!570188 m!549241))

(declare-fun m!549243 () Bool)

(assert (=> b!570188 m!549243))

(assert (=> b!570190 m!549241))

(declare-fun m!549245 () Bool)

(assert (=> b!570190 m!549245))

(declare-fun m!549247 () Bool)

(assert (=> b!570190 m!549247))

(declare-fun m!549249 () Bool)

(assert (=> b!570190 m!549249))

(assert (=> b!570190 m!549241))

(declare-fun m!549251 () Bool)

(assert (=> b!570190 m!549251))

(assert (=> b!570190 m!549241))

(assert (=> b!570190 m!549247))

(declare-fun m!549253 () Bool)

(assert (=> b!570190 m!549253))

(assert (=> b!570190 m!549247))

(declare-fun m!549255 () Bool)

(assert (=> b!570190 m!549255))

(declare-fun m!549257 () Bool)

(assert (=> b!570193 m!549257))

(declare-fun m!549259 () Bool)

(assert (=> b!570191 m!549259))

(declare-fun m!549261 () Bool)

(assert (=> b!570187 m!549261))

(declare-fun m!549263 () Bool)

(assert (=> start!52254 m!549263))

(declare-fun m!549265 () Bool)

(assert (=> start!52254 m!549265))

(assert (=> b!570195 m!549241))

(assert (=> b!570195 m!549241))

(declare-fun m!549267 () Bool)

(assert (=> b!570195 m!549267))

(assert (=> b!570194 m!549241))

(declare-fun m!549269 () Bool)

(assert (=> b!570194 m!549269))

(declare-fun m!549271 () Bool)

(assert (=> b!570194 m!549271))

(declare-fun m!549273 () Bool)

(assert (=> b!570194 m!549273))

(assert (=> b!570194 m!549241))

(declare-fun m!549275 () Bool)

(assert (=> b!570194 m!549275))

(declare-fun m!549277 () Bool)

(assert (=> b!570192 m!549277))

(check-sat (not start!52254) (not b!570192) (not b!570187) (not b!570194) (not b!570188) (not b!570195) (not b!570193) (not b!570191) (not b!570189) (not b!570190))
(check-sat)
(get-model)

(declare-fun d!84713 () Bool)

(declare-fun res!360174 () Bool)

(declare-fun e!327983 () Bool)

(assert (=> d!84713 (=> res!360174 e!327983)))

(assert (=> d!84713 (= res!360174 (= (select (arr!17152 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!84713 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!327983)))

(declare-fun b!570261 () Bool)

(declare-fun e!327984 () Bool)

(assert (=> b!570261 (= e!327983 e!327984)))

(declare-fun res!360175 () Bool)

(assert (=> b!570261 (=> (not res!360175) (not e!327984))))

(assert (=> b!570261 (= res!360175 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17516 a!3118)))))

(declare-fun b!570262 () Bool)

(assert (=> b!570262 (= e!327984 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84713 (not res!360174)) b!570261))

(assert (= (and b!570261 res!360175) b!570262))

(declare-fun m!549359 () Bool)

(assert (=> d!84713 m!549359))

(declare-fun m!549361 () Bool)

(assert (=> b!570262 m!549361))

(assert (=> b!570193 d!84713))

(declare-fun d!84715 () Bool)

(declare-fun lt!259981 () SeekEntryResult!5557)

(assert (=> d!84715 (and (or ((_ is Undefined!5557) lt!259981) (not ((_ is Found!5557) lt!259981)) (and (bvsge (index!24456 lt!259981) #b00000000000000000000000000000000) (bvslt (index!24456 lt!259981) (size!17516 a!3118)))) (or ((_ is Undefined!5557) lt!259981) ((_ is Found!5557) lt!259981) (not ((_ is MissingVacant!5557) lt!259981)) (not (= (index!24458 lt!259981) (index!24457 lt!259935))) (and (bvsge (index!24458 lt!259981) #b00000000000000000000000000000000) (bvslt (index!24458 lt!259981) (size!17516 a!3118)))) (or ((_ is Undefined!5557) lt!259981) (ite ((_ is Found!5557) lt!259981) (= (select (arr!17152 a!3118) (index!24456 lt!259981)) (select (arr!17152 a!3118) j!142)) (and ((_ is MissingVacant!5557) lt!259981) (= (index!24458 lt!259981) (index!24457 lt!259935)) (= (select (arr!17152 a!3118) (index!24458 lt!259981)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!327992 () SeekEntryResult!5557)

(assert (=> d!84715 (= lt!259981 e!327992)))

(declare-fun c!65407 () Bool)

(assert (=> d!84715 (= c!65407 (bvsge (x!53475 lt!259935) #b01111111111111111111111111111110))))

(declare-fun lt!259980 () (_ BitVec 64))

(assert (=> d!84715 (= lt!259980 (select (arr!17152 a!3118) (index!24457 lt!259935)))))

(assert (=> d!84715 (validMask!0 mask!3119)))

(assert (=> d!84715 (= (seekKeyOrZeroReturnVacant!0 (x!53475 lt!259935) (index!24457 lt!259935) (index!24457 lt!259935) (select (arr!17152 a!3118) j!142) a!3118 mask!3119) lt!259981)))

(declare-fun b!570275 () Bool)

(declare-fun e!327991 () SeekEntryResult!5557)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570275 (= e!327991 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53475 lt!259935) #b00000000000000000000000000000001) (nextIndex!0 (index!24457 lt!259935) (bvadd (x!53475 lt!259935) #b00000000000000000000000000000001) mask!3119) (index!24457 lt!259935) (select (arr!17152 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!570276 () Bool)

(assert (=> b!570276 (= e!327992 Undefined!5557)))

(declare-fun b!570277 () Bool)

(declare-fun e!327993 () SeekEntryResult!5557)

(assert (=> b!570277 (= e!327992 e!327993)))

(declare-fun c!65406 () Bool)

(assert (=> b!570277 (= c!65406 (= lt!259980 (select (arr!17152 a!3118) j!142)))))

(declare-fun b!570278 () Bool)

(declare-fun c!65408 () Bool)

(assert (=> b!570278 (= c!65408 (= lt!259980 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!570278 (= e!327993 e!327991)))

(declare-fun b!570279 () Bool)

(assert (=> b!570279 (= e!327993 (Found!5557 (index!24457 lt!259935)))))

(declare-fun b!570280 () Bool)

(assert (=> b!570280 (= e!327991 (MissingVacant!5557 (index!24457 lt!259935)))))

(assert (= (and d!84715 c!65407) b!570276))

(assert (= (and d!84715 (not c!65407)) b!570277))

(assert (= (and b!570277 c!65406) b!570279))

(assert (= (and b!570277 (not c!65406)) b!570278))

(assert (= (and b!570278 c!65408) b!570280))

(assert (= (and b!570278 (not c!65408)) b!570275))

(declare-fun m!549363 () Bool)

(assert (=> d!84715 m!549363))

(declare-fun m!549365 () Bool)

(assert (=> d!84715 m!549365))

(assert (=> d!84715 m!549271))

(assert (=> d!84715 m!549263))

(declare-fun m!549367 () Bool)

(assert (=> b!570275 m!549367))

(assert (=> b!570275 m!549367))

(assert (=> b!570275 m!549241))

(declare-fun m!549369 () Bool)

(assert (=> b!570275 m!549369))

(assert (=> b!570188 d!84715))

(declare-fun d!84717 () Bool)

(declare-fun res!360180 () Bool)

(declare-fun e!328002 () Bool)

(assert (=> d!84717 (=> res!360180 e!328002)))

(assert (=> d!84717 (= res!360180 (bvsge #b00000000000000000000000000000000 (size!17516 a!3118)))))

(assert (=> d!84717 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!328002)))

(declare-fun b!570289 () Bool)

(declare-fun e!328000 () Bool)

(assert (=> b!570289 (= e!328002 e!328000)))

(declare-fun c!65411 () Bool)

(assert (=> b!570289 (= c!65411 (validKeyInArray!0 (select (arr!17152 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!570290 () Bool)

(declare-fun e!328001 () Bool)

(assert (=> b!570290 (= e!328000 e!328001)))

(declare-fun lt!259988 () (_ BitVec 64))

(assert (=> b!570290 (= lt!259988 (select (arr!17152 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!259990 () Unit!17887)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35724 (_ BitVec 64) (_ BitVec 32)) Unit!17887)

(assert (=> b!570290 (= lt!259990 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!259988 #b00000000000000000000000000000000))))

(assert (=> b!570290 (arrayContainsKey!0 a!3118 lt!259988 #b00000000000000000000000000000000)))

(declare-fun lt!259989 () Unit!17887)

(assert (=> b!570290 (= lt!259989 lt!259990)))

(declare-fun res!360181 () Bool)

(assert (=> b!570290 (= res!360181 (= (seekEntryOrOpen!0 (select (arr!17152 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5557 #b00000000000000000000000000000000)))))

(assert (=> b!570290 (=> (not res!360181) (not e!328001))))

(declare-fun b!570291 () Bool)

(declare-fun call!32589 () Bool)

(assert (=> b!570291 (= e!328001 call!32589)))

(declare-fun b!570292 () Bool)

(assert (=> b!570292 (= e!328000 call!32589)))

(declare-fun bm!32586 () Bool)

(assert (=> bm!32586 (= call!32589 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!84717 (not res!360180)) b!570289))

(assert (= (and b!570289 c!65411) b!570290))

(assert (= (and b!570289 (not c!65411)) b!570292))

(assert (= (and b!570290 res!360181) b!570291))

(assert (= (or b!570291 b!570292) bm!32586))

(assert (=> b!570289 m!549359))

(assert (=> b!570289 m!549359))

(declare-fun m!549371 () Bool)

(assert (=> b!570289 m!549371))

(assert (=> b!570290 m!549359))

(declare-fun m!549373 () Bool)

(assert (=> b!570290 m!549373))

(declare-fun m!549375 () Bool)

(assert (=> b!570290 m!549375))

(assert (=> b!570290 m!549359))

(declare-fun m!549377 () Bool)

(assert (=> b!570290 m!549377))

(declare-fun m!549379 () Bool)

(assert (=> bm!32586 m!549379))

(assert (=> b!570187 d!84717))

(declare-fun b!570303 () Bool)

(declare-fun e!328014 () Bool)

(declare-fun contains!2851 (List!11139 (_ BitVec 64)) Bool)

(assert (=> b!570303 (= e!328014 (contains!2851 Nil!11136 (select (arr!17152 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!570304 () Bool)

(declare-fun e!328012 () Bool)

(declare-fun e!328013 () Bool)

(assert (=> b!570304 (= e!328012 e!328013)))

(declare-fun c!65414 () Bool)

(assert (=> b!570304 (= c!65414 (validKeyInArray!0 (select (arr!17152 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32589 () Bool)

(declare-fun call!32592 () Bool)

(assert (=> bm!32589 (= call!32592 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!65414 (Cons!11135 (select (arr!17152 a!3118) #b00000000000000000000000000000000) Nil!11136) Nil!11136)))))

(declare-fun b!570305 () Bool)

(assert (=> b!570305 (= e!328013 call!32592)))

(declare-fun b!570306 () Bool)

(assert (=> b!570306 (= e!328013 call!32592)))

(declare-fun b!570307 () Bool)

(declare-fun e!328011 () Bool)

(assert (=> b!570307 (= e!328011 e!328012)))

(declare-fun res!360189 () Bool)

(assert (=> b!570307 (=> (not res!360189) (not e!328012))))

(assert (=> b!570307 (= res!360189 (not e!328014))))

(declare-fun res!360188 () Bool)

(assert (=> b!570307 (=> (not res!360188) (not e!328014))))

(assert (=> b!570307 (= res!360188 (validKeyInArray!0 (select (arr!17152 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!84719 () Bool)

(declare-fun res!360190 () Bool)

(assert (=> d!84719 (=> res!360190 e!328011)))

(assert (=> d!84719 (= res!360190 (bvsge #b00000000000000000000000000000000 (size!17516 a!3118)))))

(assert (=> d!84719 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11136) e!328011)))

(assert (= (and d!84719 (not res!360190)) b!570307))

(assert (= (and b!570307 res!360188) b!570303))

(assert (= (and b!570307 res!360189) b!570304))

(assert (= (and b!570304 c!65414) b!570306))

(assert (= (and b!570304 (not c!65414)) b!570305))

(assert (= (or b!570306 b!570305) bm!32589))

(assert (=> b!570303 m!549359))

(assert (=> b!570303 m!549359))

(declare-fun m!549381 () Bool)

(assert (=> b!570303 m!549381))

(assert (=> b!570304 m!549359))

(assert (=> b!570304 m!549359))

(assert (=> b!570304 m!549371))

(assert (=> bm!32589 m!549359))

(declare-fun m!549383 () Bool)

(assert (=> bm!32589 m!549383))

(assert (=> b!570307 m!549359))

(assert (=> b!570307 m!549359))

(assert (=> b!570307 m!549371))

(assert (=> b!570192 d!84719))

(declare-fun d!84723 () Bool)

(assert (=> d!84723 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!570191 d!84723))

(declare-fun d!84725 () Bool)

(assert (=> d!84725 (= (validKeyInArray!0 (select (arr!17152 a!3118) j!142)) (and (not (= (select (arr!17152 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17152 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!570195 d!84725))

(declare-fun b!570350 () Bool)

(declare-fun lt!260002 () SeekEntryResult!5557)

(assert (=> b!570350 (and (bvsge (index!24457 lt!260002) #b00000000000000000000000000000000) (bvslt (index!24457 lt!260002) (size!17516 (array!35725 (store (arr!17152 a!3118) i!1132 k0!1914) (size!17516 a!3118)))))))

(declare-fun e!328040 () Bool)

(assert (=> b!570350 (= e!328040 (= (select (arr!17152 (array!35725 (store (arr!17152 a!3118) i!1132 k0!1914) (size!17516 a!3118))) (index!24457 lt!260002)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!570351 () Bool)

(declare-fun e!328041 () Bool)

(declare-fun e!328044 () Bool)

(assert (=> b!570351 (= e!328041 e!328044)))

(declare-fun res!360203 () Bool)

(assert (=> b!570351 (= res!360203 (and ((_ is Intermediate!5557) lt!260002) (not (undefined!6369 lt!260002)) (bvslt (x!53475 lt!260002) #b01111111111111111111111111111110) (bvsge (x!53475 lt!260002) #b00000000000000000000000000000000) (bvsge (x!53475 lt!260002) #b00000000000000000000000000000000)))))

(assert (=> b!570351 (=> (not res!360203) (not e!328044))))

(declare-fun b!570353 () Bool)

(assert (=> b!570353 (= e!328041 (bvsge (x!53475 lt!260002) #b01111111111111111111111111111110))))

(declare-fun b!570354 () Bool)

(assert (=> b!570354 (and (bvsge (index!24457 lt!260002) #b00000000000000000000000000000000) (bvslt (index!24457 lt!260002) (size!17516 (array!35725 (store (arr!17152 a!3118) i!1132 k0!1914) (size!17516 a!3118)))))))

(declare-fun res!360204 () Bool)

(assert (=> b!570354 (= res!360204 (= (select (arr!17152 (array!35725 (store (arr!17152 a!3118) i!1132 k0!1914) (size!17516 a!3118))) (index!24457 lt!260002)) (select (store (arr!17152 a!3118) i!1132 k0!1914) j!142)))))

(assert (=> b!570354 (=> res!360204 e!328040)))

(assert (=> b!570354 (= e!328044 e!328040)))

(declare-fun b!570355 () Bool)

(declare-fun e!328042 () SeekEntryResult!5557)

(assert (=> b!570355 (= e!328042 (Intermediate!5557 false lt!259936 #b00000000000000000000000000000000))))

(declare-fun b!570356 () Bool)

(declare-fun e!328043 () SeekEntryResult!5557)

(assert (=> b!570356 (= e!328043 (Intermediate!5557 true lt!259936 #b00000000000000000000000000000000))))

(declare-fun b!570352 () Bool)

(assert (=> b!570352 (and (bvsge (index!24457 lt!260002) #b00000000000000000000000000000000) (bvslt (index!24457 lt!260002) (size!17516 (array!35725 (store (arr!17152 a!3118) i!1132 k0!1914) (size!17516 a!3118)))))))

(declare-fun res!360205 () Bool)

(assert (=> b!570352 (= res!360205 (= (select (arr!17152 (array!35725 (store (arr!17152 a!3118) i!1132 k0!1914) (size!17516 a!3118))) (index!24457 lt!260002)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!570352 (=> res!360205 e!328040)))

(declare-fun d!84727 () Bool)

(assert (=> d!84727 e!328041))

(declare-fun c!65432 () Bool)

(assert (=> d!84727 (= c!65432 (and ((_ is Intermediate!5557) lt!260002) (undefined!6369 lt!260002)))))

(assert (=> d!84727 (= lt!260002 e!328043)))

(declare-fun c!65430 () Bool)

(assert (=> d!84727 (= c!65430 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!260001 () (_ BitVec 64))

(assert (=> d!84727 (= lt!260001 (select (arr!17152 (array!35725 (store (arr!17152 a!3118) i!1132 k0!1914) (size!17516 a!3118))) lt!259936))))

(assert (=> d!84727 (validMask!0 mask!3119)))

(assert (=> d!84727 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259936 (select (store (arr!17152 a!3118) i!1132 k0!1914) j!142) (array!35725 (store (arr!17152 a!3118) i!1132 k0!1914) (size!17516 a!3118)) mask!3119) lt!260002)))

(declare-fun b!570357 () Bool)

(assert (=> b!570357 (= e!328042 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!259936 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (store (arr!17152 a!3118) i!1132 k0!1914) j!142) (array!35725 (store (arr!17152 a!3118) i!1132 k0!1914) (size!17516 a!3118)) mask!3119))))

(declare-fun b!570358 () Bool)

(assert (=> b!570358 (= e!328043 e!328042)))

(declare-fun c!65431 () Bool)

(assert (=> b!570358 (= c!65431 (or (= lt!260001 (select (store (arr!17152 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!260001 lt!260001) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!84727 c!65430) b!570356))

(assert (= (and d!84727 (not c!65430)) b!570358))

(assert (= (and b!570358 c!65431) b!570355))

(assert (= (and b!570358 (not c!65431)) b!570357))

(assert (= (and d!84727 c!65432) b!570353))

(assert (= (and d!84727 (not c!65432)) b!570351))

(assert (= (and b!570351 res!360203) b!570354))

(assert (= (and b!570354 (not res!360204)) b!570352))

(assert (= (and b!570352 (not res!360205)) b!570350))

(declare-fun m!549397 () Bool)

(assert (=> b!570354 m!549397))

(assert (=> b!570352 m!549397))

(declare-fun m!549399 () Bool)

(assert (=> d!84727 m!549399))

(assert (=> d!84727 m!549263))

(declare-fun m!549401 () Bool)

(assert (=> b!570357 m!549401))

(assert (=> b!570357 m!549401))

(assert (=> b!570357 m!549247))

(declare-fun m!549403 () Bool)

(assert (=> b!570357 m!549403))

(assert (=> b!570350 m!549397))

(assert (=> b!570190 d!84727))

(declare-fun b!570359 () Bool)

(declare-fun lt!260004 () SeekEntryResult!5557)

(assert (=> b!570359 (and (bvsge (index!24457 lt!260004) #b00000000000000000000000000000000) (bvslt (index!24457 lt!260004) (size!17516 a!3118)))))

(declare-fun e!328045 () Bool)

(assert (=> b!570359 (= e!328045 (= (select (arr!17152 a!3118) (index!24457 lt!260004)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!570360 () Bool)

(declare-fun e!328046 () Bool)

(declare-fun e!328049 () Bool)

(assert (=> b!570360 (= e!328046 e!328049)))

(declare-fun res!360206 () Bool)

(assert (=> b!570360 (= res!360206 (and ((_ is Intermediate!5557) lt!260004) (not (undefined!6369 lt!260004)) (bvslt (x!53475 lt!260004) #b01111111111111111111111111111110) (bvsge (x!53475 lt!260004) #b00000000000000000000000000000000) (bvsge (x!53475 lt!260004) #b00000000000000000000000000000000)))))

(assert (=> b!570360 (=> (not res!360206) (not e!328049))))

(declare-fun b!570362 () Bool)

(assert (=> b!570362 (= e!328046 (bvsge (x!53475 lt!260004) #b01111111111111111111111111111110))))

(declare-fun b!570363 () Bool)

(assert (=> b!570363 (and (bvsge (index!24457 lt!260004) #b00000000000000000000000000000000) (bvslt (index!24457 lt!260004) (size!17516 a!3118)))))

(declare-fun res!360207 () Bool)

(assert (=> b!570363 (= res!360207 (= (select (arr!17152 a!3118) (index!24457 lt!260004)) (select (arr!17152 a!3118) j!142)))))

(assert (=> b!570363 (=> res!360207 e!328045)))

(assert (=> b!570363 (= e!328049 e!328045)))

(declare-fun b!570364 () Bool)

(declare-fun e!328047 () SeekEntryResult!5557)

(assert (=> b!570364 (= e!328047 (Intermediate!5557 false lt!259939 #b00000000000000000000000000000000))))

(declare-fun b!570365 () Bool)

(declare-fun e!328048 () SeekEntryResult!5557)

(assert (=> b!570365 (= e!328048 (Intermediate!5557 true lt!259939 #b00000000000000000000000000000000))))

(declare-fun b!570361 () Bool)

(assert (=> b!570361 (and (bvsge (index!24457 lt!260004) #b00000000000000000000000000000000) (bvslt (index!24457 lt!260004) (size!17516 a!3118)))))

(declare-fun res!360208 () Bool)

(assert (=> b!570361 (= res!360208 (= (select (arr!17152 a!3118) (index!24457 lt!260004)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!570361 (=> res!360208 e!328045)))

(declare-fun d!84735 () Bool)

(assert (=> d!84735 e!328046))

(declare-fun c!65435 () Bool)

(assert (=> d!84735 (= c!65435 (and ((_ is Intermediate!5557) lt!260004) (undefined!6369 lt!260004)))))

(assert (=> d!84735 (= lt!260004 e!328048)))

(declare-fun c!65433 () Bool)

(assert (=> d!84735 (= c!65433 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!260003 () (_ BitVec 64))

(assert (=> d!84735 (= lt!260003 (select (arr!17152 a!3118) lt!259939))))

(assert (=> d!84735 (validMask!0 mask!3119)))

(assert (=> d!84735 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259939 (select (arr!17152 a!3118) j!142) a!3118 mask!3119) lt!260004)))

(declare-fun b!570366 () Bool)

(assert (=> b!570366 (= e!328047 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!259939 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (arr!17152 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!570367 () Bool)

(assert (=> b!570367 (= e!328048 e!328047)))

(declare-fun c!65434 () Bool)

(assert (=> b!570367 (= c!65434 (or (= lt!260003 (select (arr!17152 a!3118) j!142)) (= (bvadd lt!260003 lt!260003) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!84735 c!65433) b!570365))

(assert (= (and d!84735 (not c!65433)) b!570367))

(assert (= (and b!570367 c!65434) b!570364))

(assert (= (and b!570367 (not c!65434)) b!570366))

(assert (= (and d!84735 c!65435) b!570362))

(assert (= (and d!84735 (not c!65435)) b!570360))

(assert (= (and b!570360 res!360206) b!570363))

(assert (= (and b!570363 (not res!360207)) b!570361))

(assert (= (and b!570361 (not res!360208)) b!570359))

(declare-fun m!549405 () Bool)

(assert (=> b!570363 m!549405))

(assert (=> b!570361 m!549405))

(declare-fun m!549407 () Bool)

(assert (=> d!84735 m!549407))

(assert (=> d!84735 m!549263))

(declare-fun m!549409 () Bool)

(assert (=> b!570366 m!549409))

(assert (=> b!570366 m!549409))

(assert (=> b!570366 m!549241))

(declare-fun m!549411 () Bool)

(assert (=> b!570366 m!549411))

(assert (=> b!570359 m!549405))

(assert (=> b!570190 d!84735))

(declare-fun d!84737 () Bool)

(declare-fun lt!260019 () (_ BitVec 32))

(declare-fun lt!260018 () (_ BitVec 32))

(assert (=> d!84737 (= lt!260019 (bvmul (bvxor lt!260018 (bvlshr lt!260018 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84737 (= lt!260018 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17152 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!17152 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84737 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!360209 (let ((h!12162 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17152 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!17152 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53481 (bvmul (bvxor h!12162 (bvlshr h!12162 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53481 (bvlshr x!53481 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!360209 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!360209 #b00000000000000000000000000000000))))))

(assert (=> d!84737 (= (toIndex!0 (select (store (arr!17152 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!260019 (bvlshr lt!260019 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!570190 d!84737))

(declare-fun d!84739 () Bool)

(declare-fun lt!260021 () (_ BitVec 32))

(declare-fun lt!260020 () (_ BitVec 32))

(assert (=> d!84739 (= lt!260021 (bvmul (bvxor lt!260020 (bvlshr lt!260020 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84739 (= lt!260020 ((_ extract 31 0) (bvand (bvxor (select (arr!17152 a!3118) j!142) (bvlshr (select (arr!17152 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84739 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!360209 (let ((h!12162 ((_ extract 31 0) (bvand (bvxor (select (arr!17152 a!3118) j!142) (bvlshr (select (arr!17152 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53481 (bvmul (bvxor h!12162 (bvlshr h!12162 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53481 (bvlshr x!53481 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!360209 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!360209 #b00000000000000000000000000000000))))))

(assert (=> d!84739 (= (toIndex!0 (select (arr!17152 a!3118) j!142) mask!3119) (bvand (bvxor lt!260021 (bvlshr lt!260021 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!570190 d!84739))

(declare-fun b!570410 () Bool)

(declare-fun c!65454 () Bool)

(declare-fun lt!260036 () (_ BitVec 64))

(assert (=> b!570410 (= c!65454 (= lt!260036 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!328074 () SeekEntryResult!5557)

(declare-fun e!328076 () SeekEntryResult!5557)

(assert (=> b!570410 (= e!328074 e!328076)))

(declare-fun b!570411 () Bool)

(declare-fun lt!260034 () SeekEntryResult!5557)

(assert (=> b!570411 (= e!328076 (MissingZero!5557 (index!24457 lt!260034)))))

(declare-fun b!570412 () Bool)

(declare-fun e!328075 () SeekEntryResult!5557)

(assert (=> b!570412 (= e!328075 Undefined!5557)))

(declare-fun b!570413 () Bool)

(assert (=> b!570413 (= e!328076 (seekKeyOrZeroReturnVacant!0 (x!53475 lt!260034) (index!24457 lt!260034) (index!24457 lt!260034) k0!1914 a!3118 mask!3119))))

(declare-fun b!570414 () Bool)

(assert (=> b!570414 (= e!328075 e!328074)))

(assert (=> b!570414 (= lt!260036 (select (arr!17152 a!3118) (index!24457 lt!260034)))))

(declare-fun c!65456 () Bool)

(assert (=> b!570414 (= c!65456 (= lt!260036 k0!1914))))

(declare-fun d!84743 () Bool)

(declare-fun lt!260035 () SeekEntryResult!5557)

(assert (=> d!84743 (and (or ((_ is Undefined!5557) lt!260035) (not ((_ is Found!5557) lt!260035)) (and (bvsge (index!24456 lt!260035) #b00000000000000000000000000000000) (bvslt (index!24456 lt!260035) (size!17516 a!3118)))) (or ((_ is Undefined!5557) lt!260035) ((_ is Found!5557) lt!260035) (not ((_ is MissingZero!5557) lt!260035)) (and (bvsge (index!24455 lt!260035) #b00000000000000000000000000000000) (bvslt (index!24455 lt!260035) (size!17516 a!3118)))) (or ((_ is Undefined!5557) lt!260035) ((_ is Found!5557) lt!260035) ((_ is MissingZero!5557) lt!260035) (not ((_ is MissingVacant!5557) lt!260035)) (and (bvsge (index!24458 lt!260035) #b00000000000000000000000000000000) (bvslt (index!24458 lt!260035) (size!17516 a!3118)))) (or ((_ is Undefined!5557) lt!260035) (ite ((_ is Found!5557) lt!260035) (= (select (arr!17152 a!3118) (index!24456 lt!260035)) k0!1914) (ite ((_ is MissingZero!5557) lt!260035) (= (select (arr!17152 a!3118) (index!24455 lt!260035)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5557) lt!260035) (= (select (arr!17152 a!3118) (index!24458 lt!260035)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84743 (= lt!260035 e!328075)))

(declare-fun c!65455 () Bool)

(assert (=> d!84743 (= c!65455 (and ((_ is Intermediate!5557) lt!260034) (undefined!6369 lt!260034)))))

(assert (=> d!84743 (= lt!260034 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!84743 (validMask!0 mask!3119)))

(assert (=> d!84743 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!260035)))

(declare-fun b!570415 () Bool)

(assert (=> b!570415 (= e!328074 (Found!5557 (index!24457 lt!260034)))))

(assert (= (and d!84743 c!65455) b!570412))

(assert (= (and d!84743 (not c!65455)) b!570414))

(assert (= (and b!570414 c!65456) b!570415))

(assert (= (and b!570414 (not c!65456)) b!570410))

(assert (= (and b!570410 c!65454) b!570411))

(assert (= (and b!570410 (not c!65454)) b!570413))

(declare-fun m!549433 () Bool)

(assert (=> b!570413 m!549433))

(declare-fun m!549435 () Bool)

(assert (=> b!570414 m!549435))

(declare-fun m!549437 () Bool)

(assert (=> d!84743 m!549437))

(declare-fun m!549439 () Bool)

(assert (=> d!84743 m!549439))

(assert (=> d!84743 m!549437))

(declare-fun m!549441 () Bool)

(assert (=> d!84743 m!549441))

(declare-fun m!549443 () Bool)

(assert (=> d!84743 m!549443))

(declare-fun m!549445 () Bool)

(assert (=> d!84743 m!549445))

(assert (=> d!84743 m!549263))

(assert (=> b!570189 d!84743))

(declare-fun d!84753 () Bool)

(assert (=> d!84753 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52254 d!84753))

(declare-fun d!84755 () Bool)

(assert (=> d!84755 (= (array_inv!13011 a!3118) (bvsge (size!17516 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52254 d!84755))

(declare-fun b!570446 () Bool)

(declare-fun c!65469 () Bool)

(declare-fun lt!260049 () (_ BitVec 64))

(assert (=> b!570446 (= c!65469 (= lt!260049 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!328093 () SeekEntryResult!5557)

(declare-fun e!328095 () SeekEntryResult!5557)

(assert (=> b!570446 (= e!328093 e!328095)))

(declare-fun b!570447 () Bool)

(declare-fun lt!260047 () SeekEntryResult!5557)

(assert (=> b!570447 (= e!328095 (MissingZero!5557 (index!24457 lt!260047)))))

(declare-fun b!570448 () Bool)

(declare-fun e!328094 () SeekEntryResult!5557)

(assert (=> b!570448 (= e!328094 Undefined!5557)))

(declare-fun b!570449 () Bool)

(assert (=> b!570449 (= e!328095 (seekKeyOrZeroReturnVacant!0 (x!53475 lt!260047) (index!24457 lt!260047) (index!24457 lt!260047) (select (arr!17152 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!570450 () Bool)

(assert (=> b!570450 (= e!328094 e!328093)))

(assert (=> b!570450 (= lt!260049 (select (arr!17152 a!3118) (index!24457 lt!260047)))))

(declare-fun c!65471 () Bool)

(assert (=> b!570450 (= c!65471 (= lt!260049 (select (arr!17152 a!3118) j!142)))))

(declare-fun d!84757 () Bool)

(declare-fun lt!260048 () SeekEntryResult!5557)

(assert (=> d!84757 (and (or ((_ is Undefined!5557) lt!260048) (not ((_ is Found!5557) lt!260048)) (and (bvsge (index!24456 lt!260048) #b00000000000000000000000000000000) (bvslt (index!24456 lt!260048) (size!17516 a!3118)))) (or ((_ is Undefined!5557) lt!260048) ((_ is Found!5557) lt!260048) (not ((_ is MissingZero!5557) lt!260048)) (and (bvsge (index!24455 lt!260048) #b00000000000000000000000000000000) (bvslt (index!24455 lt!260048) (size!17516 a!3118)))) (or ((_ is Undefined!5557) lt!260048) ((_ is Found!5557) lt!260048) ((_ is MissingZero!5557) lt!260048) (not ((_ is MissingVacant!5557) lt!260048)) (and (bvsge (index!24458 lt!260048) #b00000000000000000000000000000000) (bvslt (index!24458 lt!260048) (size!17516 a!3118)))) (or ((_ is Undefined!5557) lt!260048) (ite ((_ is Found!5557) lt!260048) (= (select (arr!17152 a!3118) (index!24456 lt!260048)) (select (arr!17152 a!3118) j!142)) (ite ((_ is MissingZero!5557) lt!260048) (= (select (arr!17152 a!3118) (index!24455 lt!260048)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5557) lt!260048) (= (select (arr!17152 a!3118) (index!24458 lt!260048)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84757 (= lt!260048 e!328094)))

(declare-fun c!65470 () Bool)

(assert (=> d!84757 (= c!65470 (and ((_ is Intermediate!5557) lt!260047) (undefined!6369 lt!260047)))))

(assert (=> d!84757 (= lt!260047 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17152 a!3118) j!142) mask!3119) (select (arr!17152 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84757 (validMask!0 mask!3119)))

(assert (=> d!84757 (= (seekEntryOrOpen!0 (select (arr!17152 a!3118) j!142) a!3118 mask!3119) lt!260048)))

(declare-fun b!570451 () Bool)

(assert (=> b!570451 (= e!328093 (Found!5557 (index!24457 lt!260047)))))

(assert (= (and d!84757 c!65470) b!570448))

(assert (= (and d!84757 (not c!65470)) b!570450))

(assert (= (and b!570450 c!65471) b!570451))

(assert (= (and b!570450 (not c!65471)) b!570446))

(assert (= (and b!570446 c!65469) b!570447))

(assert (= (and b!570446 (not c!65469)) b!570449))

(assert (=> b!570449 m!549241))

(declare-fun m!549447 () Bool)

(assert (=> b!570449 m!549447))

(declare-fun m!549449 () Bool)

(assert (=> b!570450 m!549449))

(assert (=> d!84757 m!549245))

(assert (=> d!84757 m!549241))

(declare-fun m!549451 () Bool)

(assert (=> d!84757 m!549451))

(assert (=> d!84757 m!549241))

(assert (=> d!84757 m!549245))

(declare-fun m!549453 () Bool)

(assert (=> d!84757 m!549453))

(declare-fun m!549455 () Bool)

(assert (=> d!84757 m!549455))

(declare-fun m!549457 () Bool)

(assert (=> d!84757 m!549457))

(assert (=> d!84757 m!549263))

(assert (=> b!570194 d!84757))

(declare-fun d!84759 () Bool)

(declare-fun res!360222 () Bool)

(declare-fun e!328098 () Bool)

(assert (=> d!84759 (=> res!360222 e!328098)))

(assert (=> d!84759 (= res!360222 (bvsge j!142 (size!17516 a!3118)))))

(assert (=> d!84759 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!328098)))

(declare-fun b!570452 () Bool)

(declare-fun e!328096 () Bool)

(assert (=> b!570452 (= e!328098 e!328096)))

(declare-fun c!65472 () Bool)

(assert (=> b!570452 (= c!65472 (validKeyInArray!0 (select (arr!17152 a!3118) j!142)))))

(declare-fun b!570453 () Bool)

(declare-fun e!328097 () Bool)

(assert (=> b!570453 (= e!328096 e!328097)))

(declare-fun lt!260050 () (_ BitVec 64))

(assert (=> b!570453 (= lt!260050 (select (arr!17152 a!3118) j!142))))

(declare-fun lt!260052 () Unit!17887)

(assert (=> b!570453 (= lt!260052 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!260050 j!142))))

(assert (=> b!570453 (arrayContainsKey!0 a!3118 lt!260050 #b00000000000000000000000000000000)))

(declare-fun lt!260051 () Unit!17887)

(assert (=> b!570453 (= lt!260051 lt!260052)))

(declare-fun res!360223 () Bool)

(assert (=> b!570453 (= res!360223 (= (seekEntryOrOpen!0 (select (arr!17152 a!3118) j!142) a!3118 mask!3119) (Found!5557 j!142)))))

(assert (=> b!570453 (=> (not res!360223) (not e!328097))))

(declare-fun b!570454 () Bool)

(declare-fun call!32596 () Bool)

(assert (=> b!570454 (= e!328097 call!32596)))

(declare-fun b!570455 () Bool)

(assert (=> b!570455 (= e!328096 call!32596)))

(declare-fun bm!32593 () Bool)

(assert (=> bm!32593 (= call!32596 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!84759 (not res!360222)) b!570452))

(assert (= (and b!570452 c!65472) b!570453))

(assert (= (and b!570452 (not c!65472)) b!570455))

(assert (= (and b!570453 res!360223) b!570454))

(assert (= (or b!570454 b!570455) bm!32593))

(assert (=> b!570452 m!549241))

(assert (=> b!570452 m!549241))

(assert (=> b!570452 m!549267))

(assert (=> b!570453 m!549241))

(declare-fun m!549459 () Bool)

(assert (=> b!570453 m!549459))

(declare-fun m!549461 () Bool)

(assert (=> b!570453 m!549461))

(assert (=> b!570453 m!549241))

(assert (=> b!570453 m!549275))

(declare-fun m!549463 () Bool)

(assert (=> bm!32593 m!549463))

(assert (=> b!570194 d!84759))

(declare-fun d!84761 () Bool)

(assert (=> d!84761 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!260062 () Unit!17887)

(declare-fun choose!38 (array!35724 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17887)

(assert (=> d!84761 (= lt!260062 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84761 (validMask!0 mask!3119)))

(assert (=> d!84761 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!260062)))

(declare-fun bs!17705 () Bool)

(assert (= bs!17705 d!84761))

(assert (=> bs!17705 m!549269))

(declare-fun m!549495 () Bool)

(assert (=> bs!17705 m!549495))

(assert (=> bs!17705 m!549263))

(assert (=> b!570194 d!84761))

(check-sat (not b!570275) (not b!570303) (not d!84735) (not d!84757) (not b!570449) (not b!570452) (not b!570262) (not b!570290) (not bm!32586) (not b!570289) (not b!570413) (not d!84761) (not d!84743) (not b!570357) (not b!570307) (not bm!32589) (not bm!32593) (not b!570366) (not b!570453) (not d!84715) (not b!570304) (not d!84727))
(check-sat)
