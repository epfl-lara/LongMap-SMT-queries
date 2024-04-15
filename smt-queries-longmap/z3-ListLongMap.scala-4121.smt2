; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56208 () Bool)

(assert start!56208)

(declare-fun b!623287 () Bool)

(declare-fun res!401767 () Bool)

(declare-fun e!357490 () Bool)

(assert (=> b!623287 (=> (not res!401767) (not e!357490))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37692 0))(
  ( (array!37693 (arr!18092 (Array (_ BitVec 32) (_ BitVec 64))) (size!18457 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37692)

(assert (=> b!623287 (= res!401767 (and (= (size!18457 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18457 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18457 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!623288 () Bool)

(declare-fun res!401761 () Bool)

(declare-fun e!357492 () Bool)

(assert (=> b!623288 (=> (not res!401761) (not e!357492))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!623288 (= res!401761 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18092 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18092 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!623289 () Bool)

(assert (=> b!623289 (= e!357490 e!357492)))

(declare-fun res!401759 () Bool)

(assert (=> b!623289 (=> (not res!401759) (not e!357492))))

(declare-datatypes ((SeekEntryResult!6529 0))(
  ( (MissingZero!6529 (index!28400 (_ BitVec 32))) (Found!6529 (index!28401 (_ BitVec 32))) (Intermediate!6529 (undefined!7341 Bool) (index!28402 (_ BitVec 32)) (x!57172 (_ BitVec 32))) (Undefined!6529) (MissingVacant!6529 (index!28403 (_ BitVec 32))) )
))
(declare-fun lt!289066 () SeekEntryResult!6529)

(assert (=> b!623289 (= res!401759 (or (= lt!289066 (MissingZero!6529 i!1108)) (= lt!289066 (MissingVacant!6529 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37692 (_ BitVec 32)) SeekEntryResult!6529)

(assert (=> b!623289 (= lt!289066 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!401763 () Bool)

(assert (=> start!56208 (=> (not res!401763) (not e!357490))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56208 (= res!401763 (validMask!0 mask!3053))))

(assert (=> start!56208 e!357490))

(assert (=> start!56208 true))

(declare-fun array_inv!13975 (array!37692) Bool)

(assert (=> start!56208 (array_inv!13975 a!2986)))

(declare-fun b!623290 () Bool)

(declare-fun res!401760 () Bool)

(assert (=> b!623290 (=> (not res!401760) (not e!357490))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!623290 (= res!401760 (validKeyInArray!0 k0!1786))))

(declare-fun b!623291 () Bool)

(declare-fun res!401765 () Bool)

(assert (=> b!623291 (=> (not res!401765) (not e!357492))))

(declare-datatypes ((List!12172 0))(
  ( (Nil!12169) (Cons!12168 (h!13213 (_ BitVec 64)) (t!18391 List!12172)) )
))
(declare-fun arrayNoDuplicates!0 (array!37692 (_ BitVec 32) List!12172) Bool)

(assert (=> b!623291 (= res!401765 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12169))))

(declare-fun b!623292 () Bool)

(declare-fun res!401762 () Bool)

(assert (=> b!623292 (=> (not res!401762) (not e!357490))))

(assert (=> b!623292 (= res!401762 (validKeyInArray!0 (select (arr!18092 a!2986) j!136)))))

(declare-fun b!623293 () Bool)

(declare-fun res!401768 () Bool)

(assert (=> b!623293 (=> (not res!401768) (not e!357492))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37692 (_ BitVec 32)) Bool)

(assert (=> b!623293 (= res!401768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!623294 () Bool)

(declare-fun res!401766 () Bool)

(assert (=> b!623294 (=> (not res!401766) (not e!357492))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37692 (_ BitVec 32)) SeekEntryResult!6529)

(assert (=> b!623294 (= res!401766 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18092 a!2986) j!136) a!2986 mask!3053) (Found!6529 j!136)))))

(declare-fun b!623295 () Bool)

(declare-fun res!401764 () Bool)

(assert (=> b!623295 (=> (not res!401764) (not e!357490))))

(declare-fun arrayContainsKey!0 (array!37692 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!623295 (= res!401764 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!623296 () Bool)

(assert (=> b!623296 (= e!357492 (and (bvslt x!910 #b01111111111111111111111111111110) (= (select (arr!18092 a!2986) index!984) (select (arr!18092 a!2986) j!136)) (not (= index!984 j!136))))))

(assert (= (and start!56208 res!401763) b!623287))

(assert (= (and b!623287 res!401767) b!623292))

(assert (= (and b!623292 res!401762) b!623290))

(assert (= (and b!623290 res!401760) b!623295))

(assert (= (and b!623295 res!401764) b!623289))

(assert (= (and b!623289 res!401759) b!623293))

(assert (= (and b!623293 res!401768) b!623291))

(assert (= (and b!623291 res!401765) b!623288))

(assert (= (and b!623288 res!401761) b!623294))

(assert (= (and b!623294 res!401766) b!623296))

(declare-fun m!598645 () Bool)

(assert (=> b!623292 m!598645))

(assert (=> b!623292 m!598645))

(declare-fun m!598647 () Bool)

(assert (=> b!623292 m!598647))

(declare-fun m!598649 () Bool)

(assert (=> b!623291 m!598649))

(declare-fun m!598651 () Bool)

(assert (=> b!623296 m!598651))

(assert (=> b!623296 m!598645))

(declare-fun m!598653 () Bool)

(assert (=> b!623290 m!598653))

(declare-fun m!598655 () Bool)

(assert (=> b!623289 m!598655))

(declare-fun m!598657 () Bool)

(assert (=> b!623288 m!598657))

(declare-fun m!598659 () Bool)

(assert (=> b!623288 m!598659))

(declare-fun m!598661 () Bool)

(assert (=> b!623288 m!598661))

(declare-fun m!598663 () Bool)

(assert (=> b!623295 m!598663))

(assert (=> b!623294 m!598645))

(assert (=> b!623294 m!598645))

(declare-fun m!598665 () Bool)

(assert (=> b!623294 m!598665))

(declare-fun m!598667 () Bool)

(assert (=> b!623293 m!598667))

(declare-fun m!598669 () Bool)

(assert (=> start!56208 m!598669))

(declare-fun m!598671 () Bool)

(assert (=> start!56208 m!598671))

(check-sat (not b!623292) (not b!623295) (not b!623294) (not b!623293) (not b!623289) (not b!623290) (not start!56208) (not b!623291))
(check-sat)
(get-model)

(declare-fun d!88469 () Bool)

(declare-fun res!401833 () Bool)

(declare-fun e!357515 () Bool)

(assert (=> d!88469 (=> res!401833 e!357515)))

(assert (=> d!88469 (= res!401833 (= (select (arr!18092 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!88469 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!357515)))

(declare-fun b!623361 () Bool)

(declare-fun e!357516 () Bool)

(assert (=> b!623361 (= e!357515 e!357516)))

(declare-fun res!401834 () Bool)

(assert (=> b!623361 (=> (not res!401834) (not e!357516))))

(assert (=> b!623361 (= res!401834 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18457 a!2986)))))

(declare-fun b!623362 () Bool)

(assert (=> b!623362 (= e!357516 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!88469 (not res!401833)) b!623361))

(assert (= (and b!623361 res!401834) b!623362))

(declare-fun m!598729 () Bool)

(assert (=> d!88469 m!598729))

(declare-fun m!598731 () Bool)

(assert (=> b!623362 m!598731))

(assert (=> b!623295 d!88469))

(declare-fun d!88471 () Bool)

(assert (=> d!88471 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!623290 d!88471))

(declare-fun b!623387 () Bool)

(declare-fun c!71140 () Bool)

(declare-fun lt!289089 () (_ BitVec 64))

(assert (=> b!623387 (= c!71140 (= lt!289089 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!357534 () SeekEntryResult!6529)

(declare-fun e!357532 () SeekEntryResult!6529)

(assert (=> b!623387 (= e!357534 e!357532)))

(declare-fun b!623388 () Bool)

(declare-fun lt!289090 () SeekEntryResult!6529)

(assert (=> b!623388 (= e!357532 (MissingZero!6529 (index!28402 lt!289090)))))

(declare-fun b!623389 () Bool)

(assert (=> b!623389 (= e!357532 (seekKeyOrZeroReturnVacant!0 (x!57172 lt!289090) (index!28402 lt!289090) (index!28402 lt!289090) k0!1786 a!2986 mask!3053))))

(declare-fun b!623390 () Bool)

(declare-fun e!357533 () SeekEntryResult!6529)

(assert (=> b!623390 (= e!357533 Undefined!6529)))

(declare-fun d!88473 () Bool)

(declare-fun lt!289088 () SeekEntryResult!6529)

(get-info :version)

(assert (=> d!88473 (and (or ((_ is Undefined!6529) lt!289088) (not ((_ is Found!6529) lt!289088)) (and (bvsge (index!28401 lt!289088) #b00000000000000000000000000000000) (bvslt (index!28401 lt!289088) (size!18457 a!2986)))) (or ((_ is Undefined!6529) lt!289088) ((_ is Found!6529) lt!289088) (not ((_ is MissingZero!6529) lt!289088)) (and (bvsge (index!28400 lt!289088) #b00000000000000000000000000000000) (bvslt (index!28400 lt!289088) (size!18457 a!2986)))) (or ((_ is Undefined!6529) lt!289088) ((_ is Found!6529) lt!289088) ((_ is MissingZero!6529) lt!289088) (not ((_ is MissingVacant!6529) lt!289088)) (and (bvsge (index!28403 lt!289088) #b00000000000000000000000000000000) (bvslt (index!28403 lt!289088) (size!18457 a!2986)))) (or ((_ is Undefined!6529) lt!289088) (ite ((_ is Found!6529) lt!289088) (= (select (arr!18092 a!2986) (index!28401 lt!289088)) k0!1786) (ite ((_ is MissingZero!6529) lt!289088) (= (select (arr!18092 a!2986) (index!28400 lt!289088)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6529) lt!289088) (= (select (arr!18092 a!2986) (index!28403 lt!289088)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!88473 (= lt!289088 e!357533)))

(declare-fun c!71141 () Bool)

(assert (=> d!88473 (= c!71141 (and ((_ is Intermediate!6529) lt!289090) (undefined!7341 lt!289090)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37692 (_ BitVec 32)) SeekEntryResult!6529)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88473 (= lt!289090 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!88473 (validMask!0 mask!3053)))

(assert (=> d!88473 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!289088)))

(declare-fun b!623391 () Bool)

(assert (=> b!623391 (= e!357533 e!357534)))

(assert (=> b!623391 (= lt!289089 (select (arr!18092 a!2986) (index!28402 lt!289090)))))

(declare-fun c!71142 () Bool)

(assert (=> b!623391 (= c!71142 (= lt!289089 k0!1786))))

(declare-fun b!623392 () Bool)

(assert (=> b!623392 (= e!357534 (Found!6529 (index!28402 lt!289090)))))

(assert (= (and d!88473 c!71141) b!623390))

(assert (= (and d!88473 (not c!71141)) b!623391))

(assert (= (and b!623391 c!71142) b!623392))

(assert (= (and b!623391 (not c!71142)) b!623387))

(assert (= (and b!623387 c!71140) b!623388))

(assert (= (and b!623387 (not c!71140)) b!623389))

(declare-fun m!598745 () Bool)

(assert (=> b!623389 m!598745))

(declare-fun m!598747 () Bool)

(assert (=> d!88473 m!598747))

(declare-fun m!598749 () Bool)

(assert (=> d!88473 m!598749))

(declare-fun m!598751 () Bool)

(assert (=> d!88473 m!598751))

(declare-fun m!598753 () Bool)

(assert (=> d!88473 m!598753))

(declare-fun m!598755 () Bool)

(assert (=> d!88473 m!598755))

(assert (=> d!88473 m!598669))

(assert (=> d!88473 m!598747))

(declare-fun m!598757 () Bool)

(assert (=> b!623391 m!598757))

(assert (=> b!623289 d!88473))

(declare-fun lt!289108 () SeekEntryResult!6529)

(declare-fun d!88481 () Bool)

(assert (=> d!88481 (and (or ((_ is Undefined!6529) lt!289108) (not ((_ is Found!6529) lt!289108)) (and (bvsge (index!28401 lt!289108) #b00000000000000000000000000000000) (bvslt (index!28401 lt!289108) (size!18457 a!2986)))) (or ((_ is Undefined!6529) lt!289108) ((_ is Found!6529) lt!289108) (not ((_ is MissingVacant!6529) lt!289108)) (not (= (index!28403 lt!289108) vacantSpotIndex!68)) (and (bvsge (index!28403 lt!289108) #b00000000000000000000000000000000) (bvslt (index!28403 lt!289108) (size!18457 a!2986)))) (or ((_ is Undefined!6529) lt!289108) (ite ((_ is Found!6529) lt!289108) (= (select (arr!18092 a!2986) (index!28401 lt!289108)) (select (arr!18092 a!2986) j!136)) (and ((_ is MissingVacant!6529) lt!289108) (= (index!28403 lt!289108) vacantSpotIndex!68) (= (select (arr!18092 a!2986) (index!28403 lt!289108)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!357555 () SeekEntryResult!6529)

(assert (=> d!88481 (= lt!289108 e!357555)))

(declare-fun c!71163 () Bool)

(assert (=> d!88481 (= c!71163 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!289107 () (_ BitVec 64))

(assert (=> d!88481 (= lt!289107 (select (arr!18092 a!2986) index!984))))

(assert (=> d!88481 (validMask!0 mask!3053)))

(assert (=> d!88481 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18092 a!2986) j!136) a!2986 mask!3053) lt!289108)))

(declare-fun b!623429 () Bool)

(declare-fun c!71161 () Bool)

(assert (=> b!623429 (= c!71161 (= lt!289107 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!357554 () SeekEntryResult!6529)

(declare-fun e!357553 () SeekEntryResult!6529)

(assert (=> b!623429 (= e!357554 e!357553)))

(declare-fun b!623430 () Bool)

(assert (=> b!623430 (= e!357553 (MissingVacant!6529 vacantSpotIndex!68))))

(declare-fun b!623431 () Bool)

(assert (=> b!623431 (= e!357555 Undefined!6529)))

(declare-fun b!623432 () Bool)

(assert (=> b!623432 (= e!357554 (Found!6529 index!984))))

(declare-fun b!623433 () Bool)

(assert (=> b!623433 (= e!357555 e!357554)))

(declare-fun c!71162 () Bool)

(assert (=> b!623433 (= c!71162 (= lt!289107 (select (arr!18092 a!2986) j!136)))))

(declare-fun b!623434 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!623434 (= e!357553 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18092 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!88481 c!71163) b!623431))

(assert (= (and d!88481 (not c!71163)) b!623433))

(assert (= (and b!623433 c!71162) b!623432))

(assert (= (and b!623433 (not c!71162)) b!623429))

(assert (= (and b!623429 c!71161) b!623430))

(assert (= (and b!623429 (not c!71161)) b!623434))

(declare-fun m!598759 () Bool)

(assert (=> d!88481 m!598759))

(declare-fun m!598761 () Bool)

(assert (=> d!88481 m!598761))

(assert (=> d!88481 m!598651))

(assert (=> d!88481 m!598669))

(declare-fun m!598763 () Bool)

(assert (=> b!623434 m!598763))

(assert (=> b!623434 m!598763))

(assert (=> b!623434 m!598645))

(declare-fun m!598765 () Bool)

(assert (=> b!623434 m!598765))

(assert (=> b!623294 d!88481))

(declare-fun b!623461 () Bool)

(declare-fun e!357576 () Bool)

(declare-fun e!357575 () Bool)

(assert (=> b!623461 (= e!357576 e!357575)))

(declare-fun lt!289123 () (_ BitVec 64))

(assert (=> b!623461 (= lt!289123 (select (arr!18092 a!2986) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!21038 0))(
  ( (Unit!21039) )
))
(declare-fun lt!289121 () Unit!21038)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37692 (_ BitVec 64) (_ BitVec 32)) Unit!21038)

(assert (=> b!623461 (= lt!289121 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!289123 #b00000000000000000000000000000000))))

(assert (=> b!623461 (arrayContainsKey!0 a!2986 lt!289123 #b00000000000000000000000000000000)))

(declare-fun lt!289122 () Unit!21038)

(assert (=> b!623461 (= lt!289122 lt!289121)))

(declare-fun res!401851 () Bool)

(assert (=> b!623461 (= res!401851 (= (seekEntryOrOpen!0 (select (arr!18092 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6529 #b00000000000000000000000000000000)))))

(assert (=> b!623461 (=> (not res!401851) (not e!357575))))

(declare-fun b!623462 () Bool)

(declare-fun call!33163 () Bool)

(assert (=> b!623462 (= e!357575 call!33163)))

(declare-fun b!623463 () Bool)

(assert (=> b!623463 (= e!357576 call!33163)))

(declare-fun d!88483 () Bool)

(declare-fun res!401852 () Bool)

(declare-fun e!357574 () Bool)

(assert (=> d!88483 (=> res!401852 e!357574)))

(assert (=> d!88483 (= res!401852 (bvsge #b00000000000000000000000000000000 (size!18457 a!2986)))))

(assert (=> d!88483 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!357574)))

(declare-fun bm!33160 () Bool)

(assert (=> bm!33160 (= call!33163 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!623464 () Bool)

(assert (=> b!623464 (= e!357574 e!357576)))

(declare-fun c!71172 () Bool)

(assert (=> b!623464 (= c!71172 (validKeyInArray!0 (select (arr!18092 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!88483 (not res!401852)) b!623464))

(assert (= (and b!623464 c!71172) b!623461))

(assert (= (and b!623464 (not c!71172)) b!623463))

(assert (= (and b!623461 res!401851) b!623462))

(assert (= (or b!623462 b!623463) bm!33160))

(assert (=> b!623461 m!598729))

(declare-fun m!598797 () Bool)

(assert (=> b!623461 m!598797))

(declare-fun m!598799 () Bool)

(assert (=> b!623461 m!598799))

(assert (=> b!623461 m!598729))

(declare-fun m!598801 () Bool)

(assert (=> b!623461 m!598801))

(declare-fun m!598803 () Bool)

(assert (=> bm!33160 m!598803))

(assert (=> b!623464 m!598729))

(assert (=> b!623464 m!598729))

(declare-fun m!598805 () Bool)

(assert (=> b!623464 m!598805))

(assert (=> b!623293 d!88483))

(declare-fun d!88497 () Bool)

(assert (=> d!88497 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!56208 d!88497))

(declare-fun d!88501 () Bool)

(assert (=> d!88501 (= (array_inv!13975 a!2986) (bvsge (size!18457 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!56208 d!88501))

(declare-fun d!88507 () Bool)

(assert (=> d!88507 (= (validKeyInArray!0 (select (arr!18092 a!2986) j!136)) (and (not (= (select (arr!18092 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18092 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!623292 d!88507))

(declare-fun b!623541 () Bool)

(declare-fun e!357627 () Bool)

(declare-fun e!357628 () Bool)

(assert (=> b!623541 (= e!357627 e!357628)))

(declare-fun c!71199 () Bool)

(assert (=> b!623541 (= c!71199 (validKeyInArray!0 (select (arr!18092 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!623542 () Bool)

(declare-fun call!33172 () Bool)

(assert (=> b!623542 (= e!357628 call!33172)))

(declare-fun bm!33169 () Bool)

(assert (=> bm!33169 (= call!33172 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!71199 (Cons!12168 (select (arr!18092 a!2986) #b00000000000000000000000000000000) Nil!12169) Nil!12169)))))

(declare-fun b!623544 () Bool)

(declare-fun e!357629 () Bool)

(assert (=> b!623544 (= e!357629 e!357627)))

(declare-fun res!401879 () Bool)

(assert (=> b!623544 (=> (not res!401879) (not e!357627))))

(declare-fun e!357630 () Bool)

(assert (=> b!623544 (= res!401879 (not e!357630))))

(declare-fun res!401877 () Bool)

(assert (=> b!623544 (=> (not res!401877) (not e!357630))))

(assert (=> b!623544 (= res!401877 (validKeyInArray!0 (select (arr!18092 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!623545 () Bool)

(declare-fun contains!3057 (List!12172 (_ BitVec 64)) Bool)

(assert (=> b!623545 (= e!357630 (contains!3057 Nil!12169 (select (arr!18092 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!623543 () Bool)

(assert (=> b!623543 (= e!357628 call!33172)))

(declare-fun d!88509 () Bool)

(declare-fun res!401878 () Bool)

(assert (=> d!88509 (=> res!401878 e!357629)))

(assert (=> d!88509 (= res!401878 (bvsge #b00000000000000000000000000000000 (size!18457 a!2986)))))

(assert (=> d!88509 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12169) e!357629)))

(assert (= (and d!88509 (not res!401878)) b!623544))

(assert (= (and b!623544 res!401877) b!623545))

(assert (= (and b!623544 res!401879) b!623541))

(assert (= (and b!623541 c!71199) b!623542))

(assert (= (and b!623541 (not c!71199)) b!623543))

(assert (= (or b!623542 b!623543) bm!33169))

(assert (=> b!623541 m!598729))

(assert (=> b!623541 m!598729))

(assert (=> b!623541 m!598805))

(assert (=> bm!33169 m!598729))

(declare-fun m!598835 () Bool)

(assert (=> bm!33169 m!598835))

(assert (=> b!623544 m!598729))

(assert (=> b!623544 m!598729))

(assert (=> b!623544 m!598805))

(assert (=> b!623545 m!598729))

(assert (=> b!623545 m!598729))

(declare-fun m!598837 () Bool)

(assert (=> b!623545 m!598837))

(assert (=> b!623291 d!88509))

(check-sat (not b!623541) (not d!88481) (not b!623389) (not b!623461) (not b!623434) (not b!623362) (not bm!33169) (not b!623544) (not b!623464) (not b!623545) (not d!88473) (not bm!33160))
(check-sat)
