; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57190 () Bool)

(assert start!57190)

(declare-fun b!633057 () Bool)

(declare-fun res!409429 () Bool)

(declare-fun e!361943 () Bool)

(assert (=> b!633057 (=> (not res!409429) (not e!361943))))

(declare-datatypes ((array!38152 0))(
  ( (array!38153 (arr!18307 (Array (_ BitVec 32) (_ BitVec 64))) (size!18671 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38152)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!633057 (= res!409429 (validKeyInArray!0 (select (arr!18307 a!2986) j!136)))))

(declare-fun b!633058 () Bool)

(declare-fun res!409425 () Bool)

(assert (=> b!633058 (=> (not res!409425) (not e!361943))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!633058 (= res!409425 (and (= (size!18671 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18671 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18671 a!2986)) (not (= i!1108 j!136))))))

(declare-fun e!361949 () Bool)

(declare-fun b!633059 () Bool)

(declare-fun lt!292594 () array!38152)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38152 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!633059 (= e!361949 (arrayContainsKey!0 lt!292594 (select (arr!18307 a!2986) j!136) index!984))))

(declare-fun b!633061 () Bool)

(declare-fun e!361940 () Bool)

(declare-fun e!361941 () Bool)

(assert (=> b!633061 (= e!361940 e!361941)))

(declare-fun res!409424 () Bool)

(assert (=> b!633061 (=> res!409424 e!361941)))

(declare-fun lt!292598 () (_ BitVec 64))

(declare-fun lt!292602 () (_ BitVec 64))

(assert (=> b!633061 (= res!409424 (or (not (= (select (arr!18307 a!2986) j!136) lt!292598)) (not (= (select (arr!18307 a!2986) j!136) lt!292602)) (bvsge j!136 index!984)))))

(declare-fun b!633062 () Bool)

(assert (=> b!633062 (= e!361941 (arrayContainsKey!0 lt!292594 (select (arr!18307 a!2986) j!136) j!136))))

(declare-fun b!633063 () Bool)

(declare-fun res!409420 () Bool)

(assert (=> b!633063 (=> (not res!409420) (not e!361943))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!633063 (= res!409420 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!633064 () Bool)

(declare-datatypes ((Unit!21322 0))(
  ( (Unit!21323) )
))
(declare-fun e!361947 () Unit!21322)

(declare-fun Unit!21324 () Unit!21322)

(assert (=> b!633064 (= e!361947 Unit!21324)))

(declare-fun b!633065 () Bool)

(declare-fun e!361948 () Bool)

(assert (=> b!633065 (= e!361943 e!361948)))

(declare-fun res!409427 () Bool)

(assert (=> b!633065 (=> (not res!409427) (not e!361948))))

(declare-datatypes ((SeekEntryResult!6747 0))(
  ( (MissingZero!6747 (index!29284 (_ BitVec 32))) (Found!6747 (index!29285 (_ BitVec 32))) (Intermediate!6747 (undefined!7559 Bool) (index!29286 (_ BitVec 32)) (x!58023 (_ BitVec 32))) (Undefined!6747) (MissingVacant!6747 (index!29287 (_ BitVec 32))) )
))
(declare-fun lt!292596 () SeekEntryResult!6747)

(assert (=> b!633065 (= res!409427 (or (= lt!292596 (MissingZero!6747 i!1108)) (= lt!292596 (MissingVacant!6747 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38152 (_ BitVec 32)) SeekEntryResult!6747)

(assert (=> b!633065 (= lt!292596 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!633066 () Bool)

(declare-fun res!409421 () Bool)

(assert (=> b!633066 (=> (not res!409421) (not e!361943))))

(assert (=> b!633066 (= res!409421 (validKeyInArray!0 k0!1786))))

(declare-fun b!633067 () Bool)

(declare-fun e!361950 () Bool)

(declare-fun e!361946 () Bool)

(assert (=> b!633067 (= e!361950 (not e!361946))))

(declare-fun res!409416 () Bool)

(assert (=> b!633067 (=> res!409416 e!361946)))

(declare-fun lt!292595 () SeekEntryResult!6747)

(assert (=> b!633067 (= res!409416 (not (= lt!292595 (Found!6747 index!984))))))

(declare-fun lt!292597 () Unit!21322)

(assert (=> b!633067 (= lt!292597 e!361947)))

(declare-fun c!72188 () Bool)

(assert (=> b!633067 (= c!72188 (= lt!292595 Undefined!6747))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38152 (_ BitVec 32)) SeekEntryResult!6747)

(assert (=> b!633067 (= lt!292595 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292598 lt!292594 mask!3053))))

(declare-fun e!361945 () Bool)

(assert (=> b!633067 e!361945))

(declare-fun res!409418 () Bool)

(assert (=> b!633067 (=> (not res!409418) (not e!361945))))

(declare-fun lt!292600 () SeekEntryResult!6747)

(declare-fun lt!292603 () (_ BitVec 32))

(assert (=> b!633067 (= res!409418 (= lt!292600 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292603 vacantSpotIndex!68 lt!292598 lt!292594 mask!3053)))))

(assert (=> b!633067 (= lt!292600 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292603 vacantSpotIndex!68 (select (arr!18307 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!633067 (= lt!292598 (select (store (arr!18307 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!292601 () Unit!21322)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38152 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21322)

(assert (=> b!633067 (= lt!292601 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292603 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!633067 (= lt!292603 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!633068 () Bool)

(declare-fun e!361944 () Bool)

(assert (=> b!633068 (= e!361948 e!361944)))

(declare-fun res!409430 () Bool)

(assert (=> b!633068 (=> (not res!409430) (not e!361944))))

(assert (=> b!633068 (= res!409430 (= (select (store (arr!18307 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!633068 (= lt!292594 (array!38153 (store (arr!18307 a!2986) i!1108 k0!1786) (size!18671 a!2986)))))

(declare-fun res!409422 () Bool)

(assert (=> start!57190 (=> (not res!409422) (not e!361943))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57190 (= res!409422 (validMask!0 mask!3053))))

(assert (=> start!57190 e!361943))

(assert (=> start!57190 true))

(declare-fun array_inv!14103 (array!38152) Bool)

(assert (=> start!57190 (array_inv!14103 a!2986)))

(declare-fun b!633060 () Bool)

(declare-fun lt!292599 () SeekEntryResult!6747)

(assert (=> b!633060 (= e!361945 (= lt!292599 lt!292600))))

(declare-fun b!633069 () Bool)

(assert (=> b!633069 (= e!361946 e!361949)))

(declare-fun res!409419 () Bool)

(assert (=> b!633069 (=> res!409419 e!361949)))

(assert (=> b!633069 (= res!409419 (or (not (= (select (arr!18307 a!2986) j!136) lt!292598)) (not (= (select (arr!18307 a!2986) j!136) lt!292602)) (bvsge j!136 index!984)))))

(assert (=> b!633069 e!361940))

(declare-fun res!409415 () Bool)

(assert (=> b!633069 (=> (not res!409415) (not e!361940))))

(assert (=> b!633069 (= res!409415 (= lt!292602 (select (arr!18307 a!2986) j!136)))))

(assert (=> b!633069 (= lt!292602 (select (store (arr!18307 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!633070 () Bool)

(declare-fun res!409423 () Bool)

(assert (=> b!633070 (=> (not res!409423) (not e!361948))))

(declare-datatypes ((List!12348 0))(
  ( (Nil!12345) (Cons!12344 (h!13389 (_ BitVec 64)) (t!18576 List!12348)) )
))
(declare-fun arrayNoDuplicates!0 (array!38152 (_ BitVec 32) List!12348) Bool)

(assert (=> b!633070 (= res!409423 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12345))))

(declare-fun b!633071 () Bool)

(declare-fun res!409426 () Bool)

(assert (=> b!633071 (=> (not res!409426) (not e!361948))))

(assert (=> b!633071 (= res!409426 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18307 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!633072 () Bool)

(declare-fun res!409417 () Bool)

(assert (=> b!633072 (=> (not res!409417) (not e!361948))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38152 (_ BitVec 32)) Bool)

(assert (=> b!633072 (= res!409417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!633073 () Bool)

(declare-fun Unit!21325 () Unit!21322)

(assert (=> b!633073 (= e!361947 Unit!21325)))

(assert (=> b!633073 false))

(declare-fun b!633074 () Bool)

(assert (=> b!633074 (= e!361944 e!361950)))

(declare-fun res!409428 () Bool)

(assert (=> b!633074 (=> (not res!409428) (not e!361950))))

(assert (=> b!633074 (= res!409428 (and (= lt!292599 (Found!6747 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18307 a!2986) index!984) (select (arr!18307 a!2986) j!136))) (not (= (select (arr!18307 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!633074 (= lt!292599 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18307 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!57190 res!409422) b!633058))

(assert (= (and b!633058 res!409425) b!633057))

(assert (= (and b!633057 res!409429) b!633066))

(assert (= (and b!633066 res!409421) b!633063))

(assert (= (and b!633063 res!409420) b!633065))

(assert (= (and b!633065 res!409427) b!633072))

(assert (= (and b!633072 res!409417) b!633070))

(assert (= (and b!633070 res!409423) b!633071))

(assert (= (and b!633071 res!409426) b!633068))

(assert (= (and b!633068 res!409430) b!633074))

(assert (= (and b!633074 res!409428) b!633067))

(assert (= (and b!633067 res!409418) b!633060))

(assert (= (and b!633067 c!72188) b!633073))

(assert (= (and b!633067 (not c!72188)) b!633064))

(assert (= (and b!633067 (not res!409416)) b!633069))

(assert (= (and b!633069 res!409415) b!633061))

(assert (= (and b!633061 (not res!409424)) b!633062))

(assert (= (and b!633069 (not res!409419)) b!633059))

(declare-fun m!607795 () Bool)

(assert (=> b!633061 m!607795))

(assert (=> b!633057 m!607795))

(assert (=> b!633057 m!607795))

(declare-fun m!607797 () Bool)

(assert (=> b!633057 m!607797))

(declare-fun m!607799 () Bool)

(assert (=> b!633072 m!607799))

(declare-fun m!607801 () Bool)

(assert (=> b!633071 m!607801))

(assert (=> b!633062 m!607795))

(assert (=> b!633062 m!607795))

(declare-fun m!607803 () Bool)

(assert (=> b!633062 m!607803))

(declare-fun m!607805 () Bool)

(assert (=> b!633063 m!607805))

(declare-fun m!607807 () Bool)

(assert (=> start!57190 m!607807))

(declare-fun m!607809 () Bool)

(assert (=> start!57190 m!607809))

(assert (=> b!633069 m!607795))

(declare-fun m!607811 () Bool)

(assert (=> b!633069 m!607811))

(declare-fun m!607813 () Bool)

(assert (=> b!633069 m!607813))

(declare-fun m!607815 () Bool)

(assert (=> b!633074 m!607815))

(assert (=> b!633074 m!607795))

(assert (=> b!633074 m!607795))

(declare-fun m!607817 () Bool)

(assert (=> b!633074 m!607817))

(assert (=> b!633059 m!607795))

(assert (=> b!633059 m!607795))

(declare-fun m!607819 () Bool)

(assert (=> b!633059 m!607819))

(declare-fun m!607821 () Bool)

(assert (=> b!633070 m!607821))

(declare-fun m!607823 () Bool)

(assert (=> b!633065 m!607823))

(declare-fun m!607825 () Bool)

(assert (=> b!633066 m!607825))

(assert (=> b!633068 m!607811))

(declare-fun m!607827 () Bool)

(assert (=> b!633068 m!607827))

(declare-fun m!607829 () Bool)

(assert (=> b!633067 m!607829))

(declare-fun m!607831 () Bool)

(assert (=> b!633067 m!607831))

(declare-fun m!607833 () Bool)

(assert (=> b!633067 m!607833))

(assert (=> b!633067 m!607795))

(declare-fun m!607835 () Bool)

(assert (=> b!633067 m!607835))

(assert (=> b!633067 m!607811))

(declare-fun m!607837 () Bool)

(assert (=> b!633067 m!607837))

(assert (=> b!633067 m!607795))

(declare-fun m!607839 () Bool)

(assert (=> b!633067 m!607839))

(check-sat (not b!633070) (not b!633059) (not b!633074) (not b!633066) (not b!633072) (not b!633062) (not b!633065) (not start!57190) (not b!633057) (not b!633063) (not b!633067))
(check-sat)
(get-model)

(declare-fun d!89505 () Bool)

(assert (=> d!89505 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!633066 d!89505))

(declare-fun d!89507 () Bool)

(assert (=> d!89507 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57190 d!89507))

(declare-fun d!89509 () Bool)

(assert (=> d!89509 (= (array_inv!14103 a!2986) (bvsge (size!18671 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57190 d!89509))

(declare-fun b!633137 () Bool)

(declare-fun e!361992 () Bool)

(declare-fun e!361990 () Bool)

(assert (=> b!633137 (= e!361992 e!361990)))

(declare-fun c!72194 () Bool)

(assert (=> b!633137 (= c!72194 (validKeyInArray!0 (select (arr!18307 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!633138 () Bool)

(declare-fun e!361991 () Bool)

(assert (=> b!633138 (= e!361990 e!361991)))

(declare-fun lt!292641 () (_ BitVec 64))

(assert (=> b!633138 (= lt!292641 (select (arr!18307 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!292640 () Unit!21322)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38152 (_ BitVec 64) (_ BitVec 32)) Unit!21322)

(assert (=> b!633138 (= lt!292640 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!292641 #b00000000000000000000000000000000))))

(assert (=> b!633138 (arrayContainsKey!0 a!2986 lt!292641 #b00000000000000000000000000000000)))

(declare-fun lt!292642 () Unit!21322)

(assert (=> b!633138 (= lt!292642 lt!292640)))

(declare-fun res!409484 () Bool)

(assert (=> b!633138 (= res!409484 (= (seekEntryOrOpen!0 (select (arr!18307 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6747 #b00000000000000000000000000000000)))))

(assert (=> b!633138 (=> (not res!409484) (not e!361991))))

(declare-fun d!89511 () Bool)

(declare-fun res!409483 () Bool)

(assert (=> d!89511 (=> res!409483 e!361992)))

(assert (=> d!89511 (= res!409483 (bvsge #b00000000000000000000000000000000 (size!18671 a!2986)))))

(assert (=> d!89511 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!361992)))

(declare-fun bm!33362 () Bool)

(declare-fun call!33365 () Bool)

(assert (=> bm!33362 (= call!33365 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!633139 () Bool)

(assert (=> b!633139 (= e!361991 call!33365)))

(declare-fun b!633140 () Bool)

(assert (=> b!633140 (= e!361990 call!33365)))

(assert (= (and d!89511 (not res!409483)) b!633137))

(assert (= (and b!633137 c!72194) b!633138))

(assert (= (and b!633137 (not c!72194)) b!633140))

(assert (= (and b!633138 res!409484) b!633139))

(assert (= (or b!633139 b!633140) bm!33362))

(declare-fun m!607887 () Bool)

(assert (=> b!633137 m!607887))

(assert (=> b!633137 m!607887))

(declare-fun m!607889 () Bool)

(assert (=> b!633137 m!607889))

(assert (=> b!633138 m!607887))

(declare-fun m!607891 () Bool)

(assert (=> b!633138 m!607891))

(declare-fun m!607893 () Bool)

(assert (=> b!633138 m!607893))

(assert (=> b!633138 m!607887))

(declare-fun m!607895 () Bool)

(assert (=> b!633138 m!607895))

(declare-fun m!607897 () Bool)

(assert (=> bm!33362 m!607897))

(assert (=> b!633072 d!89511))

(declare-fun d!89513 () Bool)

(declare-fun res!409489 () Bool)

(declare-fun e!361997 () Bool)

(assert (=> d!89513 (=> res!409489 e!361997)))

(assert (=> d!89513 (= res!409489 (= (select (arr!18307 lt!292594) index!984) (select (arr!18307 a!2986) j!136)))))

(assert (=> d!89513 (= (arrayContainsKey!0 lt!292594 (select (arr!18307 a!2986) j!136) index!984) e!361997)))

(declare-fun b!633145 () Bool)

(declare-fun e!361998 () Bool)

(assert (=> b!633145 (= e!361997 e!361998)))

(declare-fun res!409490 () Bool)

(assert (=> b!633145 (=> (not res!409490) (not e!361998))))

(assert (=> b!633145 (= res!409490 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18671 lt!292594)))))

(declare-fun b!633146 () Bool)

(assert (=> b!633146 (= e!361998 (arrayContainsKey!0 lt!292594 (select (arr!18307 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!89513 (not res!409489)) b!633145))

(assert (= (and b!633145 res!409490) b!633146))

(declare-fun m!607899 () Bool)

(assert (=> d!89513 m!607899))

(assert (=> b!633146 m!607795))

(declare-fun m!607901 () Bool)

(assert (=> b!633146 m!607901))

(assert (=> b!633059 d!89513))

(declare-fun b!633157 () Bool)

(declare-fun e!362010 () Bool)

(declare-fun e!362009 () Bool)

(assert (=> b!633157 (= e!362010 e!362009)))

(declare-fun c!72197 () Bool)

(assert (=> b!633157 (= c!72197 (validKeyInArray!0 (select (arr!18307 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!633158 () Bool)

(declare-fun call!33368 () Bool)

(assert (=> b!633158 (= e!362009 call!33368)))

(declare-fun bm!33365 () Bool)

(assert (=> bm!33365 (= call!33368 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!72197 (Cons!12344 (select (arr!18307 a!2986) #b00000000000000000000000000000000) Nil!12345) Nil!12345)))))

(declare-fun b!633159 () Bool)

(declare-fun e!362008 () Bool)

(declare-fun contains!3093 (List!12348 (_ BitVec 64)) Bool)

(assert (=> b!633159 (= e!362008 (contains!3093 Nil!12345 (select (arr!18307 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!633161 () Bool)

(assert (=> b!633161 (= e!362009 call!33368)))

(declare-fun d!89515 () Bool)

(declare-fun res!409498 () Bool)

(declare-fun e!362007 () Bool)

(assert (=> d!89515 (=> res!409498 e!362007)))

(assert (=> d!89515 (= res!409498 (bvsge #b00000000000000000000000000000000 (size!18671 a!2986)))))

(assert (=> d!89515 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12345) e!362007)))

(declare-fun b!633160 () Bool)

(assert (=> b!633160 (= e!362007 e!362010)))

(declare-fun res!409499 () Bool)

(assert (=> b!633160 (=> (not res!409499) (not e!362010))))

(assert (=> b!633160 (= res!409499 (not e!362008))))

(declare-fun res!409497 () Bool)

(assert (=> b!633160 (=> (not res!409497) (not e!362008))))

(assert (=> b!633160 (= res!409497 (validKeyInArray!0 (select (arr!18307 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!89515 (not res!409498)) b!633160))

(assert (= (and b!633160 res!409497) b!633159))

(assert (= (and b!633160 res!409499) b!633157))

(assert (= (and b!633157 c!72197) b!633161))

(assert (= (and b!633157 (not c!72197)) b!633158))

(assert (= (or b!633161 b!633158) bm!33365))

(assert (=> b!633157 m!607887))

(assert (=> b!633157 m!607887))

(assert (=> b!633157 m!607889))

(assert (=> bm!33365 m!607887))

(declare-fun m!607903 () Bool)

(assert (=> bm!33365 m!607903))

(assert (=> b!633159 m!607887))

(assert (=> b!633159 m!607887))

(declare-fun m!607905 () Bool)

(assert (=> b!633159 m!607905))

(assert (=> b!633160 m!607887))

(assert (=> b!633160 m!607887))

(assert (=> b!633160 m!607889))

(assert (=> b!633070 d!89515))

(declare-fun b!633180 () Bool)

(declare-fun c!72204 () Bool)

(declare-fun lt!292651 () (_ BitVec 64))

(assert (=> b!633180 (= c!72204 (= lt!292651 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!362025 () SeekEntryResult!6747)

(declare-fun e!362024 () SeekEntryResult!6747)

(assert (=> b!633180 (= e!362025 e!362024)))

(declare-fun b!633181 () Bool)

(declare-fun lt!292649 () SeekEntryResult!6747)

(assert (=> b!633181 (= e!362024 (MissingZero!6747 (index!29286 lt!292649)))))

(declare-fun b!633182 () Bool)

(declare-fun e!362023 () SeekEntryResult!6747)

(assert (=> b!633182 (= e!362023 e!362025)))

(assert (=> b!633182 (= lt!292651 (select (arr!18307 a!2986) (index!29286 lt!292649)))))

(declare-fun c!72205 () Bool)

(assert (=> b!633182 (= c!72205 (= lt!292651 k0!1786))))

(declare-fun b!633183 () Bool)

(assert (=> b!633183 (= e!362025 (Found!6747 (index!29286 lt!292649)))))

(declare-fun d!89517 () Bool)

(declare-fun lt!292650 () SeekEntryResult!6747)

(get-info :version)

(assert (=> d!89517 (and (or ((_ is Undefined!6747) lt!292650) (not ((_ is Found!6747) lt!292650)) (and (bvsge (index!29285 lt!292650) #b00000000000000000000000000000000) (bvslt (index!29285 lt!292650) (size!18671 a!2986)))) (or ((_ is Undefined!6747) lt!292650) ((_ is Found!6747) lt!292650) (not ((_ is MissingZero!6747) lt!292650)) (and (bvsge (index!29284 lt!292650) #b00000000000000000000000000000000) (bvslt (index!29284 lt!292650) (size!18671 a!2986)))) (or ((_ is Undefined!6747) lt!292650) ((_ is Found!6747) lt!292650) ((_ is MissingZero!6747) lt!292650) (not ((_ is MissingVacant!6747) lt!292650)) (and (bvsge (index!29287 lt!292650) #b00000000000000000000000000000000) (bvslt (index!29287 lt!292650) (size!18671 a!2986)))) (or ((_ is Undefined!6747) lt!292650) (ite ((_ is Found!6747) lt!292650) (= (select (arr!18307 a!2986) (index!29285 lt!292650)) k0!1786) (ite ((_ is MissingZero!6747) lt!292650) (= (select (arr!18307 a!2986) (index!29284 lt!292650)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6747) lt!292650) (= (select (arr!18307 a!2986) (index!29287 lt!292650)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!89517 (= lt!292650 e!362023)))

(declare-fun c!72206 () Bool)

(assert (=> d!89517 (= c!72206 (and ((_ is Intermediate!6747) lt!292649) (undefined!7559 lt!292649)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38152 (_ BitVec 32)) SeekEntryResult!6747)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89517 (= lt!292649 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!89517 (validMask!0 mask!3053)))

(assert (=> d!89517 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!292650)))

(declare-fun b!633184 () Bool)

(assert (=> b!633184 (= e!362023 Undefined!6747)))

(declare-fun b!633185 () Bool)

(assert (=> b!633185 (= e!362024 (seekKeyOrZeroReturnVacant!0 (x!58023 lt!292649) (index!29286 lt!292649) (index!29286 lt!292649) k0!1786 a!2986 mask!3053))))

(assert (= (and d!89517 c!72206) b!633184))

(assert (= (and d!89517 (not c!72206)) b!633182))

(assert (= (and b!633182 c!72205) b!633183))

(assert (= (and b!633182 (not c!72205)) b!633180))

(assert (= (and b!633180 c!72204) b!633181))

(assert (= (and b!633180 (not c!72204)) b!633185))

(declare-fun m!607911 () Bool)

(assert (=> b!633182 m!607911))

(assert (=> d!89517 m!607807))

(declare-fun m!607913 () Bool)

(assert (=> d!89517 m!607913))

(assert (=> d!89517 m!607913))

(declare-fun m!607915 () Bool)

(assert (=> d!89517 m!607915))

(declare-fun m!607917 () Bool)

(assert (=> d!89517 m!607917))

(declare-fun m!607919 () Bool)

(assert (=> d!89517 m!607919))

(declare-fun m!607921 () Bool)

(assert (=> d!89517 m!607921))

(declare-fun m!607923 () Bool)

(assert (=> b!633185 m!607923))

(assert (=> b!633065 d!89517))

(declare-fun d!89527 () Bool)

(declare-fun res!409506 () Bool)

(declare-fun e!362026 () Bool)

(assert (=> d!89527 (=> res!409506 e!362026)))

(assert (=> d!89527 (= res!409506 (= (select (arr!18307 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!89527 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!362026)))

(declare-fun b!633186 () Bool)

(declare-fun e!362027 () Bool)

(assert (=> b!633186 (= e!362026 e!362027)))

(declare-fun res!409507 () Bool)

(assert (=> b!633186 (=> (not res!409507) (not e!362027))))

(assert (=> b!633186 (= res!409507 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18671 a!2986)))))

(declare-fun b!633187 () Bool)

(assert (=> b!633187 (= e!362027 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89527 (not res!409506)) b!633186))

(assert (= (and b!633186 res!409507) b!633187))

(assert (=> d!89527 m!607887))

(declare-fun m!607925 () Bool)

(assert (=> b!633187 m!607925))

(assert (=> b!633063 d!89527))

(declare-fun e!362054 () SeekEntryResult!6747)

(declare-fun b!633223 () Bool)

(assert (=> b!633223 (= e!362054 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18307 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!633224 () Bool)

(declare-fun c!72216 () Bool)

(declare-fun lt!292656 () (_ BitVec 64))

(assert (=> b!633224 (= c!72216 (= lt!292656 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!362055 () SeekEntryResult!6747)

(assert (=> b!633224 (= e!362055 e!362054)))

(declare-fun b!633225 () Bool)

(assert (=> b!633225 (= e!362055 (Found!6747 index!984))))

(declare-fun b!633226 () Bool)

(declare-fun e!362056 () SeekEntryResult!6747)

(assert (=> b!633226 (= e!362056 Undefined!6747)))

(declare-fun b!633227 () Bool)

(assert (=> b!633227 (= e!362054 (MissingVacant!6747 vacantSpotIndex!68))))

(declare-fun b!633228 () Bool)

(assert (=> b!633228 (= e!362056 e!362055)))

(declare-fun c!72217 () Bool)

(assert (=> b!633228 (= c!72217 (= lt!292656 (select (arr!18307 a!2986) j!136)))))

(declare-fun d!89529 () Bool)

(declare-fun lt!292657 () SeekEntryResult!6747)

(assert (=> d!89529 (and (or ((_ is Undefined!6747) lt!292657) (not ((_ is Found!6747) lt!292657)) (and (bvsge (index!29285 lt!292657) #b00000000000000000000000000000000) (bvslt (index!29285 lt!292657) (size!18671 a!2986)))) (or ((_ is Undefined!6747) lt!292657) ((_ is Found!6747) lt!292657) (not ((_ is MissingVacant!6747) lt!292657)) (not (= (index!29287 lt!292657) vacantSpotIndex!68)) (and (bvsge (index!29287 lt!292657) #b00000000000000000000000000000000) (bvslt (index!29287 lt!292657) (size!18671 a!2986)))) (or ((_ is Undefined!6747) lt!292657) (ite ((_ is Found!6747) lt!292657) (= (select (arr!18307 a!2986) (index!29285 lt!292657)) (select (arr!18307 a!2986) j!136)) (and ((_ is MissingVacant!6747) lt!292657) (= (index!29287 lt!292657) vacantSpotIndex!68) (= (select (arr!18307 a!2986) (index!29287 lt!292657)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89529 (= lt!292657 e!362056)))

(declare-fun c!72218 () Bool)

(assert (=> d!89529 (= c!72218 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89529 (= lt!292656 (select (arr!18307 a!2986) index!984))))

(assert (=> d!89529 (validMask!0 mask!3053)))

(assert (=> d!89529 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18307 a!2986) j!136) a!2986 mask!3053) lt!292657)))

(assert (= (and d!89529 c!72218) b!633226))

(assert (= (and d!89529 (not c!72218)) b!633228))

(assert (= (and b!633228 c!72217) b!633225))

(assert (= (and b!633228 (not c!72217)) b!633224))

(assert (= (and b!633224 c!72216) b!633227))

(assert (= (and b!633224 (not c!72216)) b!633223))

(assert (=> b!633223 m!607829))

(assert (=> b!633223 m!607829))

(assert (=> b!633223 m!607795))

(declare-fun m!607941 () Bool)

(assert (=> b!633223 m!607941))

(declare-fun m!607943 () Bool)

(assert (=> d!89529 m!607943))

(declare-fun m!607945 () Bool)

(assert (=> d!89529 m!607945))

(assert (=> d!89529 m!607815))

(assert (=> d!89529 m!607807))

(assert (=> b!633074 d!89529))

(declare-fun e!362057 () SeekEntryResult!6747)

(declare-fun b!633229 () Bool)

(assert (=> b!633229 (= e!362057 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!292603 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18307 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!633230 () Bool)

(declare-fun c!72219 () Bool)

(declare-fun lt!292658 () (_ BitVec 64))

(assert (=> b!633230 (= c!72219 (= lt!292658 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!362058 () SeekEntryResult!6747)

(assert (=> b!633230 (= e!362058 e!362057)))

(declare-fun b!633231 () Bool)

(assert (=> b!633231 (= e!362058 (Found!6747 lt!292603))))

(declare-fun b!633232 () Bool)

(declare-fun e!362059 () SeekEntryResult!6747)

(assert (=> b!633232 (= e!362059 Undefined!6747)))

(declare-fun b!633233 () Bool)

(assert (=> b!633233 (= e!362057 (MissingVacant!6747 vacantSpotIndex!68))))

(declare-fun b!633234 () Bool)

(assert (=> b!633234 (= e!362059 e!362058)))

(declare-fun c!72220 () Bool)

(assert (=> b!633234 (= c!72220 (= lt!292658 (select (arr!18307 a!2986) j!136)))))

(declare-fun d!89539 () Bool)

(declare-fun lt!292659 () SeekEntryResult!6747)

(assert (=> d!89539 (and (or ((_ is Undefined!6747) lt!292659) (not ((_ is Found!6747) lt!292659)) (and (bvsge (index!29285 lt!292659) #b00000000000000000000000000000000) (bvslt (index!29285 lt!292659) (size!18671 a!2986)))) (or ((_ is Undefined!6747) lt!292659) ((_ is Found!6747) lt!292659) (not ((_ is MissingVacant!6747) lt!292659)) (not (= (index!29287 lt!292659) vacantSpotIndex!68)) (and (bvsge (index!29287 lt!292659) #b00000000000000000000000000000000) (bvslt (index!29287 lt!292659) (size!18671 a!2986)))) (or ((_ is Undefined!6747) lt!292659) (ite ((_ is Found!6747) lt!292659) (= (select (arr!18307 a!2986) (index!29285 lt!292659)) (select (arr!18307 a!2986) j!136)) (and ((_ is MissingVacant!6747) lt!292659) (= (index!29287 lt!292659) vacantSpotIndex!68) (= (select (arr!18307 a!2986) (index!29287 lt!292659)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89539 (= lt!292659 e!362059)))

(declare-fun c!72221 () Bool)

(assert (=> d!89539 (= c!72221 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89539 (= lt!292658 (select (arr!18307 a!2986) lt!292603))))

(assert (=> d!89539 (validMask!0 mask!3053)))

(assert (=> d!89539 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292603 vacantSpotIndex!68 (select (arr!18307 a!2986) j!136) a!2986 mask!3053) lt!292659)))

(assert (= (and d!89539 c!72221) b!633232))

(assert (= (and d!89539 (not c!72221)) b!633234))

(assert (= (and b!633234 c!72220) b!633231))

(assert (= (and b!633234 (not c!72220)) b!633230))

(assert (= (and b!633230 c!72219) b!633233))

(assert (= (and b!633230 (not c!72219)) b!633229))

(declare-fun m!607947 () Bool)

(assert (=> b!633229 m!607947))

(assert (=> b!633229 m!607947))

(assert (=> b!633229 m!607795))

(declare-fun m!607949 () Bool)

(assert (=> b!633229 m!607949))

(declare-fun m!607951 () Bool)

(assert (=> d!89539 m!607951))

(declare-fun m!607953 () Bool)

(assert (=> d!89539 m!607953))

(declare-fun m!607955 () Bool)

(assert (=> d!89539 m!607955))

(assert (=> d!89539 m!607807))

(assert (=> b!633067 d!89539))

(declare-fun d!89541 () Bool)

(declare-fun lt!292666 () (_ BitVec 32))

(assert (=> d!89541 (and (bvsge lt!292666 #b00000000000000000000000000000000) (bvslt lt!292666 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89541 (= lt!292666 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!89541 (validMask!0 mask!3053)))

(assert (=> d!89541 (= (nextIndex!0 index!984 x!910 mask!3053) lt!292666)))

(declare-fun bs!19057 () Bool)

(assert (= bs!19057 d!89541))

(declare-fun m!607957 () Bool)

(assert (=> bs!19057 m!607957))

(assert (=> bs!19057 m!607807))

(assert (=> b!633067 d!89541))

(declare-fun b!633247 () Bool)

(declare-fun e!362066 () SeekEntryResult!6747)

(assert (=> b!633247 (= e!362066 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!292603 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!292598 lt!292594 mask!3053))))

(declare-fun b!633248 () Bool)

(declare-fun c!72228 () Bool)

(declare-fun lt!292667 () (_ BitVec 64))

(assert (=> b!633248 (= c!72228 (= lt!292667 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!362067 () SeekEntryResult!6747)

(assert (=> b!633248 (= e!362067 e!362066)))

(declare-fun b!633249 () Bool)

(assert (=> b!633249 (= e!362067 (Found!6747 lt!292603))))

(declare-fun b!633250 () Bool)

(declare-fun e!362068 () SeekEntryResult!6747)

(assert (=> b!633250 (= e!362068 Undefined!6747)))

(declare-fun b!633251 () Bool)

(assert (=> b!633251 (= e!362066 (MissingVacant!6747 vacantSpotIndex!68))))

(declare-fun b!633252 () Bool)

(assert (=> b!633252 (= e!362068 e!362067)))

(declare-fun c!72229 () Bool)

(assert (=> b!633252 (= c!72229 (= lt!292667 lt!292598))))

(declare-fun d!89543 () Bool)

(declare-fun lt!292668 () SeekEntryResult!6747)

(assert (=> d!89543 (and (or ((_ is Undefined!6747) lt!292668) (not ((_ is Found!6747) lt!292668)) (and (bvsge (index!29285 lt!292668) #b00000000000000000000000000000000) (bvslt (index!29285 lt!292668) (size!18671 lt!292594)))) (or ((_ is Undefined!6747) lt!292668) ((_ is Found!6747) lt!292668) (not ((_ is MissingVacant!6747) lt!292668)) (not (= (index!29287 lt!292668) vacantSpotIndex!68)) (and (bvsge (index!29287 lt!292668) #b00000000000000000000000000000000) (bvslt (index!29287 lt!292668) (size!18671 lt!292594)))) (or ((_ is Undefined!6747) lt!292668) (ite ((_ is Found!6747) lt!292668) (= (select (arr!18307 lt!292594) (index!29285 lt!292668)) lt!292598) (and ((_ is MissingVacant!6747) lt!292668) (= (index!29287 lt!292668) vacantSpotIndex!68) (= (select (arr!18307 lt!292594) (index!29287 lt!292668)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89543 (= lt!292668 e!362068)))

(declare-fun c!72230 () Bool)

(assert (=> d!89543 (= c!72230 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89543 (= lt!292667 (select (arr!18307 lt!292594) lt!292603))))

(assert (=> d!89543 (validMask!0 mask!3053)))

(assert (=> d!89543 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292603 vacantSpotIndex!68 lt!292598 lt!292594 mask!3053) lt!292668)))

(assert (= (and d!89543 c!72230) b!633250))

(assert (= (and d!89543 (not c!72230)) b!633252))

(assert (= (and b!633252 c!72229) b!633249))

(assert (= (and b!633252 (not c!72229)) b!633248))

(assert (= (and b!633248 c!72228) b!633251))

(assert (= (and b!633248 (not c!72228)) b!633247))

(assert (=> b!633247 m!607947))

(assert (=> b!633247 m!607947))

(declare-fun m!607959 () Bool)

(assert (=> b!633247 m!607959))

(declare-fun m!607961 () Bool)

(assert (=> d!89543 m!607961))

(declare-fun m!607963 () Bool)

(assert (=> d!89543 m!607963))

(declare-fun m!607965 () Bool)

(assert (=> d!89543 m!607965))

(assert (=> d!89543 m!607807))

(assert (=> b!633067 d!89543))

(declare-fun d!89545 () Bool)

(declare-fun e!362086 () Bool)

(assert (=> d!89545 e!362086))

(declare-fun res!409527 () Bool)

(assert (=> d!89545 (=> (not res!409527) (not e!362086))))

(assert (=> d!89545 (= res!409527 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18671 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18671 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18671 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18671 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18671 a!2986))))))

(declare-fun lt!292684 () Unit!21322)

(declare-fun choose!9 (array!38152 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21322)

(assert (=> d!89545 (= lt!292684 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292603 vacantSpotIndex!68 mask!3053))))

(assert (=> d!89545 (validMask!0 mask!3053)))

(assert (=> d!89545 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292603 vacantSpotIndex!68 mask!3053) lt!292684)))

(declare-fun b!633285 () Bool)

(assert (=> b!633285 (= e!362086 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292603 vacantSpotIndex!68 (select (arr!18307 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292603 vacantSpotIndex!68 (select (store (arr!18307 a!2986) i!1108 k0!1786) j!136) (array!38153 (store (arr!18307 a!2986) i!1108 k0!1786) (size!18671 a!2986)) mask!3053)))))

(assert (= (and d!89545 res!409527) b!633285))

(declare-fun m!607995 () Bool)

(assert (=> d!89545 m!607995))

(assert (=> d!89545 m!607807))

(assert (=> b!633285 m!607795))

(assert (=> b!633285 m!607831))

(declare-fun m!607997 () Bool)

(assert (=> b!633285 m!607997))

(assert (=> b!633285 m!607811))

(assert (=> b!633285 m!607795))

(assert (=> b!633285 m!607835))

(assert (=> b!633285 m!607831))

(assert (=> b!633067 d!89545))

(declare-fun e!362087 () SeekEntryResult!6747)

(declare-fun b!633286 () Bool)

(assert (=> b!633286 (= e!362087 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!292598 lt!292594 mask!3053))))

(declare-fun b!633287 () Bool)

(declare-fun c!72246 () Bool)

(declare-fun lt!292685 () (_ BitVec 64))

(assert (=> b!633287 (= c!72246 (= lt!292685 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!362088 () SeekEntryResult!6747)

(assert (=> b!633287 (= e!362088 e!362087)))

(declare-fun b!633288 () Bool)

(assert (=> b!633288 (= e!362088 (Found!6747 index!984))))

(declare-fun b!633289 () Bool)

(declare-fun e!362089 () SeekEntryResult!6747)

(assert (=> b!633289 (= e!362089 Undefined!6747)))

(declare-fun b!633290 () Bool)

(assert (=> b!633290 (= e!362087 (MissingVacant!6747 vacantSpotIndex!68))))

(declare-fun b!633291 () Bool)

(assert (=> b!633291 (= e!362089 e!362088)))

(declare-fun c!72247 () Bool)

(assert (=> b!633291 (= c!72247 (= lt!292685 lt!292598))))

(declare-fun d!89555 () Bool)

(declare-fun lt!292686 () SeekEntryResult!6747)

(assert (=> d!89555 (and (or ((_ is Undefined!6747) lt!292686) (not ((_ is Found!6747) lt!292686)) (and (bvsge (index!29285 lt!292686) #b00000000000000000000000000000000) (bvslt (index!29285 lt!292686) (size!18671 lt!292594)))) (or ((_ is Undefined!6747) lt!292686) ((_ is Found!6747) lt!292686) (not ((_ is MissingVacant!6747) lt!292686)) (not (= (index!29287 lt!292686) vacantSpotIndex!68)) (and (bvsge (index!29287 lt!292686) #b00000000000000000000000000000000) (bvslt (index!29287 lt!292686) (size!18671 lt!292594)))) (or ((_ is Undefined!6747) lt!292686) (ite ((_ is Found!6747) lt!292686) (= (select (arr!18307 lt!292594) (index!29285 lt!292686)) lt!292598) (and ((_ is MissingVacant!6747) lt!292686) (= (index!29287 lt!292686) vacantSpotIndex!68) (= (select (arr!18307 lt!292594) (index!29287 lt!292686)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89555 (= lt!292686 e!362089)))

(declare-fun c!72248 () Bool)

(assert (=> d!89555 (= c!72248 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89555 (= lt!292685 (select (arr!18307 lt!292594) index!984))))

(assert (=> d!89555 (validMask!0 mask!3053)))

(assert (=> d!89555 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292598 lt!292594 mask!3053) lt!292686)))

(assert (= (and d!89555 c!72248) b!633289))

(assert (= (and d!89555 (not c!72248)) b!633291))

(assert (= (and b!633291 c!72247) b!633288))

(assert (= (and b!633291 (not c!72247)) b!633287))

(assert (= (and b!633287 c!72246) b!633290))

(assert (= (and b!633287 (not c!72246)) b!633286))

(assert (=> b!633286 m!607829))

(assert (=> b!633286 m!607829))

(declare-fun m!607999 () Bool)

(assert (=> b!633286 m!607999))

(declare-fun m!608001 () Bool)

(assert (=> d!89555 m!608001))

(declare-fun m!608003 () Bool)

(assert (=> d!89555 m!608003))

(assert (=> d!89555 m!607899))

(assert (=> d!89555 m!607807))

(assert (=> b!633067 d!89555))

(declare-fun d!89557 () Bool)

(declare-fun res!409528 () Bool)

(declare-fun e!362090 () Bool)

(assert (=> d!89557 (=> res!409528 e!362090)))

(assert (=> d!89557 (= res!409528 (= (select (arr!18307 lt!292594) j!136) (select (arr!18307 a!2986) j!136)))))

(assert (=> d!89557 (= (arrayContainsKey!0 lt!292594 (select (arr!18307 a!2986) j!136) j!136) e!362090)))

(declare-fun b!633292 () Bool)

(declare-fun e!362091 () Bool)

(assert (=> b!633292 (= e!362090 e!362091)))

(declare-fun res!409529 () Bool)

(assert (=> b!633292 (=> (not res!409529) (not e!362091))))

(assert (=> b!633292 (= res!409529 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18671 lt!292594)))))

(declare-fun b!633293 () Bool)

(assert (=> b!633293 (= e!362091 (arrayContainsKey!0 lt!292594 (select (arr!18307 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!89557 (not res!409528)) b!633292))

(assert (= (and b!633292 res!409529) b!633293))

(declare-fun m!608005 () Bool)

(assert (=> d!89557 m!608005))

(assert (=> b!633293 m!607795))

(declare-fun m!608007 () Bool)

(assert (=> b!633293 m!608007))

(assert (=> b!633062 d!89557))

(declare-fun d!89559 () Bool)

(assert (=> d!89559 (= (validKeyInArray!0 (select (arr!18307 a!2986) j!136)) (and (not (= (select (arr!18307 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18307 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!633057 d!89559))

(check-sat (not bm!33362) (not b!633229) (not b!633187) (not d!89555) (not b!633137) (not d!89541) (not d!89529) (not b!633160) (not b!633223) (not b!633285) (not d!89539) (not b!633159) (not d!89545) (not b!633138) (not b!633293) (not d!89517) (not b!633157) (not b!633286) (not bm!33365) (not b!633146) (not d!89543) (not b!633247) (not b!633185))
(check-sat)
