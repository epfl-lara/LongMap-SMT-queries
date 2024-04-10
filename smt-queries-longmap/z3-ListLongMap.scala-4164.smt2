; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56674 () Bool)

(assert start!56674)

(declare-fun b!628273 () Bool)

(declare-fun e!359483 () Bool)

(declare-fun e!359484 () Bool)

(assert (=> b!628273 (= e!359483 e!359484)))

(declare-fun res!405974 () Bool)

(assert (=> b!628273 (=> (not res!405974) (not e!359484))))

(declare-datatypes ((SeekEntryResult!6663 0))(
  ( (MissingZero!6663 (index!28936 (_ BitVec 32))) (Found!6663 (index!28937 (_ BitVec 32))) (Intermediate!6663 (undefined!7475 Bool) (index!28938 (_ BitVec 32)) (x!57667 (_ BitVec 32))) (Undefined!6663) (MissingVacant!6663 (index!28939 (_ BitVec 32))) )
))
(declare-fun lt!290431 () SeekEntryResult!6663)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!628273 (= res!405974 (or (= lt!290431 (MissingZero!6663 i!1108)) (= lt!290431 (MissingVacant!6663 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!37966 0))(
  ( (array!37967 (arr!18223 (Array (_ BitVec 32) (_ BitVec 64))) (size!18587 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37966)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37966 (_ BitVec 32)) SeekEntryResult!6663)

(assert (=> b!628273 (= lt!290431 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!628274 () Bool)

(declare-fun res!405973 () Bool)

(assert (=> b!628274 (=> (not res!405973) (not e!359484))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!628274 (= res!405973 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18223 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18223 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!628275 () Bool)

(declare-fun res!405981 () Bool)

(assert (=> b!628275 (=> (not res!405981) (not e!359484))))

(declare-datatypes ((List!12264 0))(
  ( (Nil!12261) (Cons!12260 (h!13305 (_ BitVec 64)) (t!18492 List!12264)) )
))
(declare-fun arrayNoDuplicates!0 (array!37966 (_ BitVec 32) List!12264) Bool)

(assert (=> b!628275 (= res!405981 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12261))))

(declare-fun b!628276 () Bool)

(declare-fun res!405977 () Bool)

(assert (=> b!628276 (=> (not res!405977) (not e!359483))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!628276 (= res!405977 (and (= (size!18587 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18587 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18587 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!628277 () Bool)

(declare-fun res!405979 () Bool)

(assert (=> b!628277 (=> (not res!405979) (not e!359483))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!628277 (= res!405979 (validKeyInArray!0 (select (arr!18223 a!2986) j!136)))))

(declare-fun b!628278 () Bool)

(declare-fun res!405976 () Bool)

(assert (=> b!628278 (=> (not res!405976) (not e!359484))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37966 (_ BitVec 32)) Bool)

(assert (=> b!628278 (= res!405976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!405978 () Bool)

(assert (=> start!56674 (=> (not res!405978) (not e!359483))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56674 (= res!405978 (validMask!0 mask!3053))))

(assert (=> start!56674 e!359483))

(assert (=> start!56674 true))

(declare-fun array_inv!14019 (array!37966) Bool)

(assert (=> start!56674 (array_inv!14019 a!2986)))

(declare-fun b!628279 () Bool)

(declare-fun res!405983 () Bool)

(assert (=> b!628279 (=> (not res!405983) (not e!359483))))

(assert (=> b!628279 (= res!405983 (validKeyInArray!0 k0!1786))))

(declare-fun b!628280 () Bool)

(declare-fun res!405982 () Bool)

(assert (=> b!628280 (=> (not res!405982) (not e!359484))))

(assert (=> b!628280 (= res!405982 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18223 a!2986) index!984) (select (arr!18223 a!2986) j!136))) (not (= (select (arr!18223 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!628281 () Bool)

(declare-fun lt!290430 () (_ BitVec 32))

(assert (=> b!628281 (= e!359484 (or (bvslt lt!290430 #b00000000000000000000000000000000) (bvsge lt!290430 (bvadd mask!3053 #b00000000000000000000000000000001))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!628281 (= lt!290430 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!628282 () Bool)

(declare-fun res!405980 () Bool)

(assert (=> b!628282 (=> (not res!405980) (not e!359484))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37966 (_ BitVec 32)) SeekEntryResult!6663)

(assert (=> b!628282 (= res!405980 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18223 a!2986) j!136) a!2986 mask!3053) (Found!6663 j!136)))))

(declare-fun b!628283 () Bool)

(declare-fun res!405975 () Bool)

(assert (=> b!628283 (=> (not res!405975) (not e!359483))))

(declare-fun arrayContainsKey!0 (array!37966 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!628283 (= res!405975 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!56674 res!405978) b!628276))

(assert (= (and b!628276 res!405977) b!628277))

(assert (= (and b!628277 res!405979) b!628279))

(assert (= (and b!628279 res!405983) b!628283))

(assert (= (and b!628283 res!405975) b!628273))

(assert (= (and b!628273 res!405974) b!628278))

(assert (= (and b!628278 res!405976) b!628275))

(assert (= (and b!628275 res!405981) b!628274))

(assert (= (and b!628274 res!405973) b!628282))

(assert (= (and b!628282 res!405980) b!628280))

(assert (= (and b!628280 res!405982) b!628281))

(declare-fun m!603507 () Bool)

(assert (=> b!628274 m!603507))

(declare-fun m!603509 () Bool)

(assert (=> b!628274 m!603509))

(declare-fun m!603511 () Bool)

(assert (=> b!628274 m!603511))

(declare-fun m!603513 () Bool)

(assert (=> start!56674 m!603513))

(declare-fun m!603515 () Bool)

(assert (=> start!56674 m!603515))

(declare-fun m!603517 () Bool)

(assert (=> b!628275 m!603517))

(declare-fun m!603519 () Bool)

(assert (=> b!628273 m!603519))

(declare-fun m!603521 () Bool)

(assert (=> b!628280 m!603521))

(declare-fun m!603523 () Bool)

(assert (=> b!628280 m!603523))

(declare-fun m!603525 () Bool)

(assert (=> b!628278 m!603525))

(assert (=> b!628277 m!603523))

(assert (=> b!628277 m!603523))

(declare-fun m!603527 () Bool)

(assert (=> b!628277 m!603527))

(declare-fun m!603529 () Bool)

(assert (=> b!628281 m!603529))

(declare-fun m!603531 () Bool)

(assert (=> b!628283 m!603531))

(assert (=> b!628282 m!603523))

(assert (=> b!628282 m!603523))

(declare-fun m!603533 () Bool)

(assert (=> b!628282 m!603533))

(declare-fun m!603535 () Bool)

(assert (=> b!628279 m!603535))

(check-sat (not b!628279) (not b!628277) (not b!628282) (not start!56674) (not b!628273) (not b!628283) (not b!628278) (not b!628281) (not b!628275))
(check-sat)
(get-model)

(declare-fun d!88987 () Bool)

(assert (=> d!88987 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!628279 d!88987))

(declare-fun d!88989 () Bool)

(declare-fun res!406021 () Bool)

(declare-fun e!359498 () Bool)

(assert (=> d!88989 (=> res!406021 e!359498)))

(assert (=> d!88989 (= res!406021 (= (select (arr!18223 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!88989 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!359498)))

(declare-fun b!628321 () Bool)

(declare-fun e!359499 () Bool)

(assert (=> b!628321 (= e!359498 e!359499)))

(declare-fun res!406022 () Bool)

(assert (=> b!628321 (=> (not res!406022) (not e!359499))))

(assert (=> b!628321 (= res!406022 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18587 a!2986)))))

(declare-fun b!628322 () Bool)

(assert (=> b!628322 (= e!359499 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!88989 (not res!406021)) b!628321))

(assert (= (and b!628321 res!406022) b!628322))

(declare-fun m!603567 () Bool)

(assert (=> d!88989 m!603567))

(declare-fun m!603569 () Bool)

(assert (=> b!628322 m!603569))

(assert (=> b!628283 d!88989))

(declare-fun b!628352 () Bool)

(declare-fun e!359525 () Bool)

(declare-fun call!33260 () Bool)

(assert (=> b!628352 (= e!359525 call!33260)))

(declare-fun b!628353 () Bool)

(declare-fun e!359524 () Bool)

(assert (=> b!628353 (= e!359524 e!359525)))

(declare-fun c!71522 () Bool)

(assert (=> b!628353 (= c!71522 (validKeyInArray!0 (select (arr!18223 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!628354 () Bool)

(declare-fun e!359526 () Bool)

(assert (=> b!628354 (= e!359526 call!33260)))

(declare-fun d!88991 () Bool)

(declare-fun res!406043 () Bool)

(assert (=> d!88991 (=> res!406043 e!359524)))

(assert (=> d!88991 (= res!406043 (bvsge #b00000000000000000000000000000000 (size!18587 a!2986)))))

(assert (=> d!88991 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!359524)))

(declare-fun b!628355 () Bool)

(assert (=> b!628355 (= e!359525 e!359526)))

(declare-fun lt!290445 () (_ BitVec 64))

(assert (=> b!628355 (= lt!290445 (select (arr!18223 a!2986) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!21098 0))(
  ( (Unit!21099) )
))
(declare-fun lt!290444 () Unit!21098)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37966 (_ BitVec 64) (_ BitVec 32)) Unit!21098)

(assert (=> b!628355 (= lt!290444 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!290445 #b00000000000000000000000000000000))))

(assert (=> b!628355 (arrayContainsKey!0 a!2986 lt!290445 #b00000000000000000000000000000000)))

(declare-fun lt!290446 () Unit!21098)

(assert (=> b!628355 (= lt!290446 lt!290444)))

(declare-fun res!406042 () Bool)

(assert (=> b!628355 (= res!406042 (= (seekEntryOrOpen!0 (select (arr!18223 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6663 #b00000000000000000000000000000000)))))

(assert (=> b!628355 (=> (not res!406042) (not e!359526))))

(declare-fun bm!33257 () Bool)

(assert (=> bm!33257 (= call!33260 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(assert (= (and d!88991 (not res!406043)) b!628353))

(assert (= (and b!628353 c!71522) b!628355))

(assert (= (and b!628353 (not c!71522)) b!628352))

(assert (= (and b!628355 res!406042) b!628354))

(assert (= (or b!628354 b!628352) bm!33257))

(assert (=> b!628353 m!603567))

(assert (=> b!628353 m!603567))

(declare-fun m!603581 () Bool)

(assert (=> b!628353 m!603581))

(assert (=> b!628355 m!603567))

(declare-fun m!603583 () Bool)

(assert (=> b!628355 m!603583))

(declare-fun m!603585 () Bool)

(assert (=> b!628355 m!603585))

(assert (=> b!628355 m!603567))

(declare-fun m!603587 () Bool)

(assert (=> b!628355 m!603587))

(declare-fun m!603589 () Bool)

(assert (=> bm!33257 m!603589))

(assert (=> b!628278 d!88991))

(declare-fun b!628401 () Bool)

(declare-fun e!359555 () SeekEntryResult!6663)

(declare-fun lt!290459 () SeekEntryResult!6663)

(assert (=> b!628401 (= e!359555 (MissingZero!6663 (index!28938 lt!290459)))))

(declare-fun d!89007 () Bool)

(declare-fun lt!290460 () SeekEntryResult!6663)

(get-info :version)

(assert (=> d!89007 (and (or ((_ is Undefined!6663) lt!290460) (not ((_ is Found!6663) lt!290460)) (and (bvsge (index!28937 lt!290460) #b00000000000000000000000000000000) (bvslt (index!28937 lt!290460) (size!18587 a!2986)))) (or ((_ is Undefined!6663) lt!290460) ((_ is Found!6663) lt!290460) (not ((_ is MissingZero!6663) lt!290460)) (and (bvsge (index!28936 lt!290460) #b00000000000000000000000000000000) (bvslt (index!28936 lt!290460) (size!18587 a!2986)))) (or ((_ is Undefined!6663) lt!290460) ((_ is Found!6663) lt!290460) ((_ is MissingZero!6663) lt!290460) (not ((_ is MissingVacant!6663) lt!290460)) (and (bvsge (index!28939 lt!290460) #b00000000000000000000000000000000) (bvslt (index!28939 lt!290460) (size!18587 a!2986)))) (or ((_ is Undefined!6663) lt!290460) (ite ((_ is Found!6663) lt!290460) (= (select (arr!18223 a!2986) (index!28937 lt!290460)) k0!1786) (ite ((_ is MissingZero!6663) lt!290460) (= (select (arr!18223 a!2986) (index!28936 lt!290460)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6663) lt!290460) (= (select (arr!18223 a!2986) (index!28939 lt!290460)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!359556 () SeekEntryResult!6663)

(assert (=> d!89007 (= lt!290460 e!359556)))

(declare-fun c!71541 () Bool)

(assert (=> d!89007 (= c!71541 (and ((_ is Intermediate!6663) lt!290459) (undefined!7475 lt!290459)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37966 (_ BitVec 32)) SeekEntryResult!6663)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89007 (= lt!290459 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!89007 (validMask!0 mask!3053)))

(assert (=> d!89007 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!290460)))

(declare-fun b!628402 () Bool)

(assert (=> b!628402 (= e!359556 Undefined!6663)))

(declare-fun b!628403 () Bool)

(declare-fun e!359554 () SeekEntryResult!6663)

(assert (=> b!628403 (= e!359554 (Found!6663 (index!28938 lt!290459)))))

(declare-fun b!628404 () Bool)

(assert (=> b!628404 (= e!359556 e!359554)))

(declare-fun lt!290461 () (_ BitVec 64))

(assert (=> b!628404 (= lt!290461 (select (arr!18223 a!2986) (index!28938 lt!290459)))))

(declare-fun c!71542 () Bool)

(assert (=> b!628404 (= c!71542 (= lt!290461 k0!1786))))

(declare-fun b!628405 () Bool)

(declare-fun c!71543 () Bool)

(assert (=> b!628405 (= c!71543 (= lt!290461 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!628405 (= e!359554 e!359555)))

(declare-fun b!628406 () Bool)

(assert (=> b!628406 (= e!359555 (seekKeyOrZeroReturnVacant!0 (x!57667 lt!290459) (index!28938 lt!290459) (index!28938 lt!290459) k0!1786 a!2986 mask!3053))))

(assert (= (and d!89007 c!71541) b!628402))

(assert (= (and d!89007 (not c!71541)) b!628404))

(assert (= (and b!628404 c!71542) b!628403))

(assert (= (and b!628404 (not c!71542)) b!628405))

(assert (= (and b!628405 c!71543) b!628401))

(assert (= (and b!628405 (not c!71543)) b!628406))

(declare-fun m!603605 () Bool)

(assert (=> d!89007 m!603605))

(declare-fun m!603607 () Bool)

(assert (=> d!89007 m!603607))

(declare-fun m!603609 () Bool)

(assert (=> d!89007 m!603609))

(assert (=> d!89007 m!603605))

(declare-fun m!603611 () Bool)

(assert (=> d!89007 m!603611))

(assert (=> d!89007 m!603513))

(declare-fun m!603613 () Bool)

(assert (=> d!89007 m!603613))

(declare-fun m!603615 () Bool)

(assert (=> b!628404 m!603615))

(declare-fun m!603617 () Bool)

(assert (=> b!628406 m!603617))

(assert (=> b!628273 d!89007))

(declare-fun b!628467 () Bool)

(declare-fun e!359588 () SeekEntryResult!6663)

(assert (=> b!628467 (= e!359588 (Found!6663 index!984))))

(declare-fun lt!290491 () SeekEntryResult!6663)

(declare-fun d!89013 () Bool)

(assert (=> d!89013 (and (or ((_ is Undefined!6663) lt!290491) (not ((_ is Found!6663) lt!290491)) (and (bvsge (index!28937 lt!290491) #b00000000000000000000000000000000) (bvslt (index!28937 lt!290491) (size!18587 a!2986)))) (or ((_ is Undefined!6663) lt!290491) ((_ is Found!6663) lt!290491) (not ((_ is MissingVacant!6663) lt!290491)) (not (= (index!28939 lt!290491) vacantSpotIndex!68)) (and (bvsge (index!28939 lt!290491) #b00000000000000000000000000000000) (bvslt (index!28939 lt!290491) (size!18587 a!2986)))) (or ((_ is Undefined!6663) lt!290491) (ite ((_ is Found!6663) lt!290491) (= (select (arr!18223 a!2986) (index!28937 lt!290491)) (select (arr!18223 a!2986) j!136)) (and ((_ is MissingVacant!6663) lt!290491) (= (index!28939 lt!290491) vacantSpotIndex!68) (= (select (arr!18223 a!2986) (index!28939 lt!290491)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!359589 () SeekEntryResult!6663)

(assert (=> d!89013 (= lt!290491 e!359589)))

(declare-fun c!71574 () Bool)

(assert (=> d!89013 (= c!71574 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!290492 () (_ BitVec 64))

(assert (=> d!89013 (= lt!290492 (select (arr!18223 a!2986) index!984))))

(assert (=> d!89013 (validMask!0 mask!3053)))

(assert (=> d!89013 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18223 a!2986) j!136) a!2986 mask!3053) lt!290491)))

(declare-fun b!628468 () Bool)

(assert (=> b!628468 (= e!359589 Undefined!6663)))

(declare-fun b!628469 () Bool)

(declare-fun e!359587 () SeekEntryResult!6663)

(assert (=> b!628469 (= e!359587 (MissingVacant!6663 vacantSpotIndex!68))))

(declare-fun b!628470 () Bool)

(assert (=> b!628470 (= e!359589 e!359588)))

(declare-fun c!71575 () Bool)

(assert (=> b!628470 (= c!71575 (= lt!290492 (select (arr!18223 a!2986) j!136)))))

(declare-fun b!628471 () Bool)

(assert (=> b!628471 (= e!359587 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18223 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!628472 () Bool)

(declare-fun c!71576 () Bool)

(assert (=> b!628472 (= c!71576 (= lt!290492 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!628472 (= e!359588 e!359587)))

(assert (= (and d!89013 c!71574) b!628468))

(assert (= (and d!89013 (not c!71574)) b!628470))

(assert (= (and b!628470 c!71575) b!628467))

(assert (= (and b!628470 (not c!71575)) b!628472))

(assert (= (and b!628472 c!71576) b!628469))

(assert (= (and b!628472 (not c!71576)) b!628471))

(declare-fun m!603649 () Bool)

(assert (=> d!89013 m!603649))

(declare-fun m!603651 () Bool)

(assert (=> d!89013 m!603651))

(assert (=> d!89013 m!603521))

(assert (=> d!89013 m!603513))

(assert (=> b!628471 m!603529))

(assert (=> b!628471 m!603529))

(assert (=> b!628471 m!603523))

(declare-fun m!603653 () Bool)

(assert (=> b!628471 m!603653))

(assert (=> b!628282 d!89013))

(declare-fun d!89021 () Bool)

(assert (=> d!89021 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!56674 d!89021))

(declare-fun d!89031 () Bool)

(assert (=> d!89031 (= (array_inv!14019 a!2986) (bvsge (size!18587 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!56674 d!89031))

(declare-fun d!89033 () Bool)

(assert (=> d!89033 (= (validKeyInArray!0 (select (arr!18223 a!2986) j!136)) (and (not (= (select (arr!18223 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18223 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!628277 d!89033))

(declare-fun b!628507 () Bool)

(declare-fun e!359619 () Bool)

(declare-fun contains!3081 (List!12264 (_ BitVec 64)) Bool)

(assert (=> b!628507 (= e!359619 (contains!3081 Nil!12261 (select (arr!18223 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!628508 () Bool)

(declare-fun e!359617 () Bool)

(declare-fun e!359616 () Bool)

(assert (=> b!628508 (= e!359617 e!359616)))

(declare-fun c!71585 () Bool)

(assert (=> b!628508 (= c!71585 (validKeyInArray!0 (select (arr!18223 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33266 () Bool)

(declare-fun call!33269 () Bool)

(assert (=> bm!33266 (= call!33269 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!71585 (Cons!12260 (select (arr!18223 a!2986) #b00000000000000000000000000000000) Nil!12261) Nil!12261)))))

(declare-fun d!89035 () Bool)

(declare-fun res!406073 () Bool)

(declare-fun e!359618 () Bool)

(assert (=> d!89035 (=> res!406073 e!359618)))

(assert (=> d!89035 (= res!406073 (bvsge #b00000000000000000000000000000000 (size!18587 a!2986)))))

(assert (=> d!89035 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12261) e!359618)))

(declare-fun b!628509 () Bool)

(assert (=> b!628509 (= e!359618 e!359617)))

(declare-fun res!406071 () Bool)

(assert (=> b!628509 (=> (not res!406071) (not e!359617))))

(assert (=> b!628509 (= res!406071 (not e!359619))))

(declare-fun res!406072 () Bool)

(assert (=> b!628509 (=> (not res!406072) (not e!359619))))

(assert (=> b!628509 (= res!406072 (validKeyInArray!0 (select (arr!18223 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!628510 () Bool)

(assert (=> b!628510 (= e!359616 call!33269)))

(declare-fun b!628511 () Bool)

(assert (=> b!628511 (= e!359616 call!33269)))

(assert (= (and d!89035 (not res!406073)) b!628509))

(assert (= (and b!628509 res!406072) b!628507))

(assert (= (and b!628509 res!406071) b!628508))

(assert (= (and b!628508 c!71585) b!628511))

(assert (= (and b!628508 (not c!71585)) b!628510))

(assert (= (or b!628511 b!628510) bm!33266))

(assert (=> b!628507 m!603567))

(assert (=> b!628507 m!603567))

(declare-fun m!603673 () Bool)

(assert (=> b!628507 m!603673))

(assert (=> b!628508 m!603567))

(assert (=> b!628508 m!603567))

(assert (=> b!628508 m!603581))

(assert (=> bm!33266 m!603567))

(declare-fun m!603675 () Bool)

(assert (=> bm!33266 m!603675))

(assert (=> b!628509 m!603567))

(assert (=> b!628509 m!603567))

(assert (=> b!628509 m!603581))

(assert (=> b!628275 d!89035))

(declare-fun d!89045 () Bool)

(declare-fun lt!290515 () (_ BitVec 32))

(assert (=> d!89045 (and (bvsge lt!290515 #b00000000000000000000000000000000) (bvslt lt!290515 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89045 (= lt!290515 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!89045 (validMask!0 mask!3053)))

(assert (=> d!89045 (= (nextIndex!0 index!984 x!910 mask!3053) lt!290515)))

(declare-fun bs!18957 () Bool)

(assert (= bs!18957 d!89045))

(declare-fun m!603677 () Bool)

(assert (=> bs!18957 m!603677))

(assert (=> bs!18957 m!603513))

(assert (=> b!628281 d!89045))

(check-sat (not d!89013) (not b!628509) (not b!628406) (not b!628471) (not bm!33266) (not b!628507) (not b!628508) (not d!89007) (not d!89045) (not bm!33257) (not b!628322) (not b!628353) (not b!628355))
(check-sat)
