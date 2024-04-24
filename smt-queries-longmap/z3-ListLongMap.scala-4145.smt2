; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56562 () Bool)

(assert start!56562)

(declare-fun b!626458 () Bool)

(declare-fun res!404205 () Bool)

(declare-fun e!358955 () Bool)

(assert (=> b!626458 (=> (not res!404205) (not e!358955))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37842 0))(
  ( (array!37843 (arr!18160 (Array (_ BitVec 32) (_ BitVec 64))) (size!18524 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37842)

(declare-datatypes ((SeekEntryResult!6556 0))(
  ( (MissingZero!6556 (index!28508 (_ BitVec 32))) (Found!6556 (index!28509 (_ BitVec 32))) (Intermediate!6556 (undefined!7368 Bool) (index!28510 (_ BitVec 32)) (x!57408 (_ BitVec 32))) (Undefined!6556) (MissingVacant!6556 (index!28511 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37842 (_ BitVec 32)) SeekEntryResult!6556)

(assert (=> b!626458 (= res!404205 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18160 a!2986) j!136) a!2986 mask!3053) (Found!6556 j!136)))))

(declare-fun b!626459 () Bool)

(declare-fun res!404202 () Bool)

(declare-fun e!358956 () Bool)

(assert (=> b!626459 (=> (not res!404202) (not e!358956))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!626459 (= res!404202 (validKeyInArray!0 k0!1786))))

(declare-fun b!626460 () Bool)

(declare-fun res!404206 () Bool)

(assert (=> b!626460 (=> (not res!404206) (not e!358956))))

(declare-fun arrayContainsKey!0 (array!37842 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!626460 (= res!404206 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!626461 () Bool)

(declare-fun res!404199 () Bool)

(assert (=> b!626461 (=> (not res!404199) (not e!358955))))

(declare-datatypes ((List!12108 0))(
  ( (Nil!12105) (Cons!12104 (h!13152 (_ BitVec 64)) (t!18328 List!12108)) )
))
(declare-fun arrayNoDuplicates!0 (array!37842 (_ BitVec 32) List!12108) Bool)

(assert (=> b!626461 (= res!404199 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12105))))

(declare-fun b!626462 () Bool)

(declare-fun res!404198 () Bool)

(assert (=> b!626462 (=> (not res!404198) (not e!358956))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!626462 (= res!404198 (and (= (size!18524 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18524 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18524 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!626463 () Bool)

(declare-fun res!404203 () Bool)

(assert (=> b!626463 (=> (not res!404203) (not e!358955))))

(assert (=> b!626463 (= res!404203 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18160 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18160 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!626464 () Bool)

(assert (=> b!626464 (= e!358956 e!358955)))

(declare-fun res!404200 () Bool)

(assert (=> b!626464 (=> (not res!404200) (not e!358955))))

(declare-fun lt!290119 () SeekEntryResult!6556)

(assert (=> b!626464 (= res!404200 (or (= lt!290119 (MissingZero!6556 i!1108)) (= lt!290119 (MissingVacant!6556 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37842 (_ BitVec 32)) SeekEntryResult!6556)

(assert (=> b!626464 (= lt!290119 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!626465 () Bool)

(declare-fun res!404201 () Bool)

(assert (=> b!626465 (=> (not res!404201) (not e!358955))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37842 (_ BitVec 32)) Bool)

(assert (=> b!626465 (= res!404201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!404197 () Bool)

(assert (=> start!56562 (=> (not res!404197) (not e!358956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56562 (= res!404197 (validMask!0 mask!3053))))

(assert (=> start!56562 e!358956))

(assert (=> start!56562 true))

(declare-fun array_inv!14019 (array!37842) Bool)

(assert (=> start!56562 (array_inv!14019 a!2986)))

(declare-fun b!626466 () Bool)

(declare-fun res!404204 () Bool)

(assert (=> b!626466 (=> (not res!404204) (not e!358956))))

(assert (=> b!626466 (= res!404204 (validKeyInArray!0 (select (arr!18160 a!2986) j!136)))))

(declare-fun b!626467 () Bool)

(assert (=> b!626467 (= e!358955 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18160 a!2986) index!984) (select (arr!18160 a!2986) j!136))) (= (select (arr!18160 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!56562 res!404197) b!626462))

(assert (= (and b!626462 res!404198) b!626466))

(assert (= (and b!626466 res!404204) b!626459))

(assert (= (and b!626459 res!404202) b!626460))

(assert (= (and b!626460 res!404206) b!626464))

(assert (= (and b!626464 res!404200) b!626465))

(assert (= (and b!626465 res!404201) b!626461))

(assert (= (and b!626461 res!404199) b!626463))

(assert (= (and b!626463 res!404203) b!626458))

(assert (= (and b!626458 res!404205) b!626467))

(declare-fun m!602203 () Bool)

(assert (=> b!626464 m!602203))

(declare-fun m!602205 () Bool)

(assert (=> b!626460 m!602205))

(declare-fun m!602207 () Bool)

(assert (=> b!626459 m!602207))

(declare-fun m!602209 () Bool)

(assert (=> b!626465 m!602209))

(declare-fun m!602211 () Bool)

(assert (=> b!626461 m!602211))

(declare-fun m!602213 () Bool)

(assert (=> b!626458 m!602213))

(assert (=> b!626458 m!602213))

(declare-fun m!602215 () Bool)

(assert (=> b!626458 m!602215))

(declare-fun m!602217 () Bool)

(assert (=> b!626463 m!602217))

(declare-fun m!602219 () Bool)

(assert (=> b!626463 m!602219))

(declare-fun m!602221 () Bool)

(assert (=> b!626463 m!602221))

(declare-fun m!602223 () Bool)

(assert (=> start!56562 m!602223))

(declare-fun m!602225 () Bool)

(assert (=> start!56562 m!602225))

(declare-fun m!602227 () Bool)

(assert (=> b!626467 m!602227))

(assert (=> b!626467 m!602213))

(assert (=> b!626466 m!602213))

(assert (=> b!626466 m!602213))

(declare-fun m!602229 () Bool)

(assert (=> b!626466 m!602229))

(check-sat (not b!626460) (not b!626459) (not b!626466) (not b!626465) (not b!626458) (not b!626464) (not start!56562) (not b!626461))
(check-sat)
(get-model)

(declare-fun b!626538 () Bool)

(declare-fun e!358985 () Bool)

(declare-fun call!33243 () Bool)

(assert (=> b!626538 (= e!358985 call!33243)))

(declare-fun b!626539 () Bool)

(declare-fun e!358986 () Bool)

(declare-fun contains!3053 (List!12108 (_ BitVec 64)) Bool)

(assert (=> b!626539 (= e!358986 (contains!3053 Nil!12105 (select (arr!18160 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!626540 () Bool)

(assert (=> b!626540 (= e!358985 call!33243)))

(declare-fun b!626541 () Bool)

(declare-fun e!358984 () Bool)

(assert (=> b!626541 (= e!358984 e!358985)))

(declare-fun c!71501 () Bool)

(assert (=> b!626541 (= c!71501 (validKeyInArray!0 (select (arr!18160 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!89011 () Bool)

(declare-fun res!404273 () Bool)

(declare-fun e!358983 () Bool)

(assert (=> d!89011 (=> res!404273 e!358983)))

(assert (=> d!89011 (= res!404273 (bvsge #b00000000000000000000000000000000 (size!18524 a!2986)))))

(assert (=> d!89011 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12105) e!358983)))

(declare-fun bm!33240 () Bool)

(assert (=> bm!33240 (= call!33243 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!71501 (Cons!12104 (select (arr!18160 a!2986) #b00000000000000000000000000000000) Nil!12105) Nil!12105)))))

(declare-fun b!626542 () Bool)

(assert (=> b!626542 (= e!358983 e!358984)))

(declare-fun res!404274 () Bool)

(assert (=> b!626542 (=> (not res!404274) (not e!358984))))

(assert (=> b!626542 (= res!404274 (not e!358986))))

(declare-fun res!404275 () Bool)

(assert (=> b!626542 (=> (not res!404275) (not e!358986))))

(assert (=> b!626542 (= res!404275 (validKeyInArray!0 (select (arr!18160 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!89011 (not res!404273)) b!626542))

(assert (= (and b!626542 res!404275) b!626539))

(assert (= (and b!626542 res!404274) b!626541))

(assert (= (and b!626541 c!71501) b!626538))

(assert (= (and b!626541 (not c!71501)) b!626540))

(assert (= (or b!626538 b!626540) bm!33240))

(declare-fun m!602287 () Bool)

(assert (=> b!626539 m!602287))

(assert (=> b!626539 m!602287))

(declare-fun m!602289 () Bool)

(assert (=> b!626539 m!602289))

(assert (=> b!626541 m!602287))

(assert (=> b!626541 m!602287))

(declare-fun m!602291 () Bool)

(assert (=> b!626541 m!602291))

(assert (=> bm!33240 m!602287))

(declare-fun m!602293 () Bool)

(assert (=> bm!33240 m!602293))

(assert (=> b!626542 m!602287))

(assert (=> b!626542 m!602287))

(assert (=> b!626542 m!602291))

(assert (=> b!626461 d!89011))

(declare-fun d!89013 () Bool)

(assert (=> d!89013 (= (validKeyInArray!0 (select (arr!18160 a!2986) j!136)) (and (not (= (select (arr!18160 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18160 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!626466 d!89013))

(declare-fun d!89015 () Bool)

(declare-fun res!404280 () Bool)

(declare-fun e!358991 () Bool)

(assert (=> d!89015 (=> res!404280 e!358991)))

(assert (=> d!89015 (= res!404280 (= (select (arr!18160 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!89015 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!358991)))

(declare-fun b!626547 () Bool)

(declare-fun e!358992 () Bool)

(assert (=> b!626547 (= e!358991 e!358992)))

(declare-fun res!404281 () Bool)

(assert (=> b!626547 (=> (not res!404281) (not e!358992))))

(assert (=> b!626547 (= res!404281 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18524 a!2986)))))

(declare-fun b!626548 () Bool)

(assert (=> b!626548 (= e!358992 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89015 (not res!404280)) b!626547))

(assert (= (and b!626547 res!404281) b!626548))

(assert (=> d!89015 m!602287))

(declare-fun m!602295 () Bool)

(assert (=> b!626548 m!602295))

(assert (=> b!626460 d!89015))

(declare-fun b!626557 () Bool)

(declare-fun e!359001 () Bool)

(declare-fun e!359000 () Bool)

(assert (=> b!626557 (= e!359001 e!359000)))

(declare-fun c!71504 () Bool)

(assert (=> b!626557 (= c!71504 (validKeyInArray!0 (select (arr!18160 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33243 () Bool)

(declare-fun call!33246 () Bool)

(assert (=> bm!33243 (= call!33246 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!626558 () Bool)

(declare-fun e!358999 () Bool)

(assert (=> b!626558 (= e!358999 call!33246)))

(declare-fun b!626560 () Bool)

(assert (=> b!626560 (= e!359000 e!358999)))

(declare-fun lt!290132 () (_ BitVec 64))

(assert (=> b!626560 (= lt!290132 (select (arr!18160 a!2986) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!21073 0))(
  ( (Unit!21074) )
))
(declare-fun lt!290133 () Unit!21073)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37842 (_ BitVec 64) (_ BitVec 32)) Unit!21073)

(assert (=> b!626560 (= lt!290133 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!290132 #b00000000000000000000000000000000))))

(assert (=> b!626560 (arrayContainsKey!0 a!2986 lt!290132 #b00000000000000000000000000000000)))

(declare-fun lt!290134 () Unit!21073)

(assert (=> b!626560 (= lt!290134 lt!290133)))

(declare-fun res!404286 () Bool)

(assert (=> b!626560 (= res!404286 (= (seekEntryOrOpen!0 (select (arr!18160 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6556 #b00000000000000000000000000000000)))))

(assert (=> b!626560 (=> (not res!404286) (not e!358999))))

(declare-fun d!89017 () Bool)

(declare-fun res!404287 () Bool)

(assert (=> d!89017 (=> res!404287 e!359001)))

(assert (=> d!89017 (= res!404287 (bvsge #b00000000000000000000000000000000 (size!18524 a!2986)))))

(assert (=> d!89017 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!359001)))

(declare-fun b!626559 () Bool)

(assert (=> b!626559 (= e!359000 call!33246)))

(assert (= (and d!89017 (not res!404287)) b!626557))

(assert (= (and b!626557 c!71504) b!626560))

(assert (= (and b!626557 (not c!71504)) b!626559))

(assert (= (and b!626560 res!404286) b!626558))

(assert (= (or b!626558 b!626559) bm!33243))

(assert (=> b!626557 m!602287))

(assert (=> b!626557 m!602287))

(assert (=> b!626557 m!602291))

(declare-fun m!602297 () Bool)

(assert (=> bm!33243 m!602297))

(assert (=> b!626560 m!602287))

(declare-fun m!602299 () Bool)

(assert (=> b!626560 m!602299))

(declare-fun m!602301 () Bool)

(assert (=> b!626560 m!602301))

(assert (=> b!626560 m!602287))

(declare-fun m!602303 () Bool)

(assert (=> b!626560 m!602303))

(assert (=> b!626465 d!89017))

(declare-fun d!89023 () Bool)

(assert (=> d!89023 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!626459 d!89023))

(declare-fun d!89025 () Bool)

(assert (=> d!89025 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!56562 d!89025))

(declare-fun d!89031 () Bool)

(assert (=> d!89031 (= (array_inv!14019 a!2986) (bvsge (size!18524 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!56562 d!89031))

(declare-fun d!89035 () Bool)

(declare-fun lt!290160 () SeekEntryResult!6556)

(get-info :version)

(assert (=> d!89035 (and (or ((_ is Undefined!6556) lt!290160) (not ((_ is Found!6556) lt!290160)) (and (bvsge (index!28509 lt!290160) #b00000000000000000000000000000000) (bvslt (index!28509 lt!290160) (size!18524 a!2986)))) (or ((_ is Undefined!6556) lt!290160) ((_ is Found!6556) lt!290160) (not ((_ is MissingZero!6556) lt!290160)) (and (bvsge (index!28508 lt!290160) #b00000000000000000000000000000000) (bvslt (index!28508 lt!290160) (size!18524 a!2986)))) (or ((_ is Undefined!6556) lt!290160) ((_ is Found!6556) lt!290160) ((_ is MissingZero!6556) lt!290160) (not ((_ is MissingVacant!6556) lt!290160)) (and (bvsge (index!28511 lt!290160) #b00000000000000000000000000000000) (bvslt (index!28511 lt!290160) (size!18524 a!2986)))) (or ((_ is Undefined!6556) lt!290160) (ite ((_ is Found!6556) lt!290160) (= (select (arr!18160 a!2986) (index!28509 lt!290160)) k0!1786) (ite ((_ is MissingZero!6556) lt!290160) (= (select (arr!18160 a!2986) (index!28508 lt!290160)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6556) lt!290160) (= (select (arr!18160 a!2986) (index!28511 lt!290160)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!359050 () SeekEntryResult!6556)

(assert (=> d!89035 (= lt!290160 e!359050)))

(declare-fun c!71526 () Bool)

(declare-fun lt!290161 () SeekEntryResult!6556)

(assert (=> d!89035 (= c!71526 (and ((_ is Intermediate!6556) lt!290161) (undefined!7368 lt!290161)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37842 (_ BitVec 32)) SeekEntryResult!6556)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89035 (= lt!290161 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!89035 (validMask!0 mask!3053)))

(assert (=> d!89035 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!290160)))

(declare-fun b!626630 () Bool)

(declare-fun c!71528 () Bool)

(declare-fun lt!290159 () (_ BitVec 64))

(assert (=> b!626630 (= c!71528 (= lt!290159 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!359052 () SeekEntryResult!6556)

(declare-fun e!359051 () SeekEntryResult!6556)

(assert (=> b!626630 (= e!359052 e!359051)))

(declare-fun b!626631 () Bool)

(assert (=> b!626631 (= e!359052 (Found!6556 (index!28510 lt!290161)))))

(declare-fun b!626632 () Bool)

(assert (=> b!626632 (= e!359051 (seekKeyOrZeroReturnVacant!0 (x!57408 lt!290161) (index!28510 lt!290161) (index!28510 lt!290161) k0!1786 a!2986 mask!3053))))

(declare-fun b!626633 () Bool)

(assert (=> b!626633 (= e!359051 (MissingZero!6556 (index!28510 lt!290161)))))

(declare-fun b!626634 () Bool)

(assert (=> b!626634 (= e!359050 e!359052)))

(assert (=> b!626634 (= lt!290159 (select (arr!18160 a!2986) (index!28510 lt!290161)))))

(declare-fun c!71527 () Bool)

(assert (=> b!626634 (= c!71527 (= lt!290159 k0!1786))))

(declare-fun b!626635 () Bool)

(assert (=> b!626635 (= e!359050 Undefined!6556)))

(assert (= (and d!89035 c!71526) b!626635))

(assert (= (and d!89035 (not c!71526)) b!626634))

(assert (= (and b!626634 c!71527) b!626631))

(assert (= (and b!626634 (not c!71527)) b!626630))

(assert (= (and b!626630 c!71528) b!626633))

(assert (= (and b!626630 (not c!71528)) b!626632))

(declare-fun m!602341 () Bool)

(assert (=> d!89035 m!602341))

(declare-fun m!602343 () Bool)

(assert (=> d!89035 m!602343))

(declare-fun m!602345 () Bool)

(assert (=> d!89035 m!602345))

(declare-fun m!602347 () Bool)

(assert (=> d!89035 m!602347))

(declare-fun m!602349 () Bool)

(assert (=> d!89035 m!602349))

(assert (=> d!89035 m!602223))

(assert (=> d!89035 m!602347))

(declare-fun m!602351 () Bool)

(assert (=> b!626632 m!602351))

(declare-fun m!602353 () Bool)

(assert (=> b!626634 m!602353))

(assert (=> b!626464 d!89035))

(declare-fun b!626678 () Bool)

(declare-fun e!359075 () SeekEntryResult!6556)

(declare-fun e!359074 () SeekEntryResult!6556)

(assert (=> b!626678 (= e!359075 e!359074)))

(declare-fun lt!290180 () (_ BitVec 64))

(declare-fun c!71552 () Bool)

(assert (=> b!626678 (= c!71552 (= lt!290180 (select (arr!18160 a!2986) j!136)))))

(declare-fun b!626679 () Bool)

(assert (=> b!626679 (= e!359074 (Found!6556 index!984))))

(declare-fun b!626680 () Bool)

(declare-fun e!359076 () SeekEntryResult!6556)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!626680 (= e!359076 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18160 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!626681 () Bool)

(assert (=> b!626681 (= e!359076 (MissingVacant!6556 vacantSpotIndex!68))))

(declare-fun d!89045 () Bool)

(declare-fun lt!290179 () SeekEntryResult!6556)

(assert (=> d!89045 (and (or ((_ is Undefined!6556) lt!290179) (not ((_ is Found!6556) lt!290179)) (and (bvsge (index!28509 lt!290179) #b00000000000000000000000000000000) (bvslt (index!28509 lt!290179) (size!18524 a!2986)))) (or ((_ is Undefined!6556) lt!290179) ((_ is Found!6556) lt!290179) (not ((_ is MissingVacant!6556) lt!290179)) (not (= (index!28511 lt!290179) vacantSpotIndex!68)) (and (bvsge (index!28511 lt!290179) #b00000000000000000000000000000000) (bvslt (index!28511 lt!290179) (size!18524 a!2986)))) (or ((_ is Undefined!6556) lt!290179) (ite ((_ is Found!6556) lt!290179) (= (select (arr!18160 a!2986) (index!28509 lt!290179)) (select (arr!18160 a!2986) j!136)) (and ((_ is MissingVacant!6556) lt!290179) (= (index!28511 lt!290179) vacantSpotIndex!68) (= (select (arr!18160 a!2986) (index!28511 lt!290179)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89045 (= lt!290179 e!359075)))

(declare-fun c!71551 () Bool)

(assert (=> d!89045 (= c!71551 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89045 (= lt!290180 (select (arr!18160 a!2986) index!984))))

(assert (=> d!89045 (validMask!0 mask!3053)))

(assert (=> d!89045 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18160 a!2986) j!136) a!2986 mask!3053) lt!290179)))

(declare-fun b!626682 () Bool)

(declare-fun c!71550 () Bool)

(assert (=> b!626682 (= c!71550 (= lt!290180 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!626682 (= e!359074 e!359076)))

(declare-fun b!626683 () Bool)

(assert (=> b!626683 (= e!359075 Undefined!6556)))

(assert (= (and d!89045 c!71551) b!626683))

(assert (= (and d!89045 (not c!71551)) b!626678))

(assert (= (and b!626678 c!71552) b!626679))

(assert (= (and b!626678 (not c!71552)) b!626682))

(assert (= (and b!626682 c!71550) b!626681))

(assert (= (and b!626682 (not c!71550)) b!626680))

(declare-fun m!602369 () Bool)

(assert (=> b!626680 m!602369))

(assert (=> b!626680 m!602369))

(assert (=> b!626680 m!602213))

(declare-fun m!602371 () Bool)

(assert (=> b!626680 m!602371))

(declare-fun m!602373 () Bool)

(assert (=> d!89045 m!602373))

(declare-fun m!602375 () Bool)

(assert (=> d!89045 m!602375))

(assert (=> d!89045 m!602227))

(assert (=> d!89045 m!602223))

(assert (=> b!626458 d!89045))

(check-sat (not b!626557) (not b!626542) (not d!89035) (not b!626539) (not b!626560) (not d!89045) (not b!626680) (not bm!33240) (not b!626548) (not b!626632) (not bm!33243) (not b!626541))
(check-sat)
