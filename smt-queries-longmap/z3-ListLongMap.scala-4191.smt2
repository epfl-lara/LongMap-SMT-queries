; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57108 () Bool)

(assert start!57108)

(declare-fun b!632308 () Bool)

(declare-fun e!361474 () Bool)

(declare-fun e!361477 () Bool)

(assert (=> b!632308 (= e!361474 e!361477)))

(declare-fun res!409033 () Bool)

(assert (=> b!632308 (=> res!409033 e!361477)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!292146 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38139 0))(
  ( (array!38140 (arr!18302 (Array (_ BitVec 32) (_ BitVec 64))) (size!18667 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38139)

(assert (=> b!632308 (= res!409033 (or (not (= (select (arr!18302 a!2986) j!136) lt!292146)) (not (= (select (arr!18302 a!2986) j!136) (select (store (arr!18302 a!2986) i!1108 k0!1786) index!984))) (bvsge j!136 index!984)))))

(assert (=> b!632308 (= (select (store (arr!18302 a!2986) i!1108 k0!1786) index!984) (select (arr!18302 a!2986) j!136))))

(declare-fun b!632309 () Bool)

(declare-fun res!409039 () Bool)

(declare-fun e!361478 () Bool)

(assert (=> b!632309 (=> (not res!409039) (not e!361478))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!632309 (= res!409039 (and (= (size!18667 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18667 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18667 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!632310 () Bool)

(declare-datatypes ((Unit!21284 0))(
  ( (Unit!21285) )
))
(declare-fun e!361472 () Unit!21284)

(declare-fun Unit!21286 () Unit!21284)

(assert (=> b!632310 (= e!361472 Unit!21286)))

(assert (=> b!632310 false))

(declare-fun b!632311 () Bool)

(declare-fun res!409031 () Bool)

(declare-fun e!361479 () Bool)

(assert (=> b!632311 (=> (not res!409031) (not e!361479))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38139 (_ BitVec 32)) Bool)

(assert (=> b!632311 (= res!409031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!632313 () Bool)

(declare-fun res!409040 () Bool)

(assert (=> b!632313 (=> (not res!409040) (not e!361478))))

(declare-fun arrayContainsKey!0 (array!38139 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!632313 (= res!409040 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!632314 () Bool)

(declare-fun res!409036 () Bool)

(assert (=> b!632314 (=> (not res!409036) (not e!361478))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!632314 (= res!409036 (validKeyInArray!0 k0!1786))))

(declare-fun b!632315 () Bool)

(declare-fun e!361475 () Bool)

(assert (=> b!632315 (= e!361475 (not e!361474))))

(declare-fun res!409042 () Bool)

(assert (=> b!632315 (=> res!409042 e!361474)))

(declare-datatypes ((SeekEntryResult!6739 0))(
  ( (MissingZero!6739 (index!29249 (_ BitVec 32))) (Found!6739 (index!29250 (_ BitVec 32))) (Intermediate!6739 (undefined!7551 Bool) (index!29251 (_ BitVec 32)) (x!57993 (_ BitVec 32))) (Undefined!6739) (MissingVacant!6739 (index!29252 (_ BitVec 32))) )
))
(declare-fun lt!292147 () SeekEntryResult!6739)

(assert (=> b!632315 (= res!409042 (not (= lt!292147 (Found!6739 index!984))))))

(declare-fun lt!292142 () Unit!21284)

(assert (=> b!632315 (= lt!292142 e!361472)))

(declare-fun c!72006 () Bool)

(assert (=> b!632315 (= c!72006 (= lt!292147 Undefined!6739))))

(declare-fun lt!292144 () array!38139)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38139 (_ BitVec 32)) SeekEntryResult!6739)

(assert (=> b!632315 (= lt!292147 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292146 lt!292144 mask!3053))))

(declare-fun e!361476 () Bool)

(assert (=> b!632315 e!361476))

(declare-fun res!409030 () Bool)

(assert (=> b!632315 (=> (not res!409030) (not e!361476))))

(declare-fun lt!292141 () SeekEntryResult!6739)

(declare-fun lt!292140 () (_ BitVec 32))

(assert (=> b!632315 (= res!409030 (= lt!292141 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292140 vacantSpotIndex!68 lt!292146 lt!292144 mask!3053)))))

(assert (=> b!632315 (= lt!292141 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292140 vacantSpotIndex!68 (select (arr!18302 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!632315 (= lt!292146 (select (store (arr!18302 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!292139 () Unit!21284)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38139 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21284)

(assert (=> b!632315 (= lt!292139 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292140 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!632315 (= lt!292140 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!632316 () Bool)

(declare-fun res!409035 () Bool)

(assert (=> b!632316 (=> (not res!409035) (not e!361479))))

(declare-datatypes ((List!12382 0))(
  ( (Nil!12379) (Cons!12378 (h!13423 (_ BitVec 64)) (t!18601 List!12382)) )
))
(declare-fun arrayNoDuplicates!0 (array!38139 (_ BitVec 32) List!12382) Bool)

(assert (=> b!632316 (= res!409035 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12379))))

(declare-fun b!632317 () Bool)

(assert (=> b!632317 (= e!361478 e!361479)))

(declare-fun res!409043 () Bool)

(assert (=> b!632317 (=> (not res!409043) (not e!361479))))

(declare-fun lt!292143 () SeekEntryResult!6739)

(assert (=> b!632317 (= res!409043 (or (= lt!292143 (MissingZero!6739 i!1108)) (= lt!292143 (MissingVacant!6739 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38139 (_ BitVec 32)) SeekEntryResult!6739)

(assert (=> b!632317 (= lt!292143 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!632318 () Bool)

(assert (=> b!632318 (= e!361477 (arrayContainsKey!0 lt!292144 (select (arr!18302 a!2986) j!136) j!136))))

(declare-fun b!632319 () Bool)

(declare-fun e!361473 () Bool)

(assert (=> b!632319 (= e!361479 e!361473)))

(declare-fun res!409037 () Bool)

(assert (=> b!632319 (=> (not res!409037) (not e!361473))))

(assert (=> b!632319 (= res!409037 (= (select (store (arr!18302 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!632319 (= lt!292144 (array!38140 (store (arr!18302 a!2986) i!1108 k0!1786) (size!18667 a!2986)))))

(declare-fun res!409032 () Bool)

(assert (=> start!57108 (=> (not res!409032) (not e!361478))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57108 (= res!409032 (validMask!0 mask!3053))))

(assert (=> start!57108 e!361478))

(assert (=> start!57108 true))

(declare-fun array_inv!14185 (array!38139) Bool)

(assert (=> start!57108 (array_inv!14185 a!2986)))

(declare-fun b!632312 () Bool)

(declare-fun Unit!21287 () Unit!21284)

(assert (=> b!632312 (= e!361472 Unit!21287)))

(declare-fun b!632320 () Bool)

(declare-fun res!409034 () Bool)

(assert (=> b!632320 (=> (not res!409034) (not e!361479))))

(assert (=> b!632320 (= res!409034 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18302 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!632321 () Bool)

(declare-fun lt!292145 () SeekEntryResult!6739)

(assert (=> b!632321 (= e!361476 (= lt!292145 lt!292141))))

(declare-fun b!632322 () Bool)

(declare-fun res!409038 () Bool)

(assert (=> b!632322 (=> (not res!409038) (not e!361478))))

(assert (=> b!632322 (= res!409038 (validKeyInArray!0 (select (arr!18302 a!2986) j!136)))))

(declare-fun b!632323 () Bool)

(assert (=> b!632323 (= e!361473 e!361475)))

(declare-fun res!409041 () Bool)

(assert (=> b!632323 (=> (not res!409041) (not e!361475))))

(assert (=> b!632323 (= res!409041 (and (= lt!292145 (Found!6739 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18302 a!2986) index!984) (select (arr!18302 a!2986) j!136))) (not (= (select (arr!18302 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!632323 (= lt!292145 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18302 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!57108 res!409032) b!632309))

(assert (= (and b!632309 res!409039) b!632322))

(assert (= (and b!632322 res!409038) b!632314))

(assert (= (and b!632314 res!409036) b!632313))

(assert (= (and b!632313 res!409040) b!632317))

(assert (= (and b!632317 res!409043) b!632311))

(assert (= (and b!632311 res!409031) b!632316))

(assert (= (and b!632316 res!409035) b!632320))

(assert (= (and b!632320 res!409034) b!632319))

(assert (= (and b!632319 res!409037) b!632323))

(assert (= (and b!632323 res!409041) b!632315))

(assert (= (and b!632315 res!409030) b!632321))

(assert (= (and b!632315 c!72006) b!632310))

(assert (= (and b!632315 (not c!72006)) b!632312))

(assert (= (and b!632315 (not res!409042)) b!632308))

(assert (= (and b!632308 (not res!409033)) b!632318))

(declare-fun m!606631 () Bool)

(assert (=> b!632323 m!606631))

(declare-fun m!606633 () Bool)

(assert (=> b!632323 m!606633))

(assert (=> b!632323 m!606633))

(declare-fun m!606635 () Bool)

(assert (=> b!632323 m!606635))

(declare-fun m!606637 () Bool)

(assert (=> b!632320 m!606637))

(declare-fun m!606639 () Bool)

(assert (=> start!57108 m!606639))

(declare-fun m!606641 () Bool)

(assert (=> start!57108 m!606641))

(assert (=> b!632322 m!606633))

(assert (=> b!632322 m!606633))

(declare-fun m!606643 () Bool)

(assert (=> b!632322 m!606643))

(assert (=> b!632318 m!606633))

(assert (=> b!632318 m!606633))

(declare-fun m!606645 () Bool)

(assert (=> b!632318 m!606645))

(declare-fun m!606647 () Bool)

(assert (=> b!632311 m!606647))

(declare-fun m!606649 () Bool)

(assert (=> b!632317 m!606649))

(declare-fun m!606651 () Bool)

(assert (=> b!632319 m!606651))

(declare-fun m!606653 () Bool)

(assert (=> b!632319 m!606653))

(declare-fun m!606655 () Bool)

(assert (=> b!632313 m!606655))

(declare-fun m!606657 () Bool)

(assert (=> b!632315 m!606657))

(assert (=> b!632315 m!606633))

(declare-fun m!606659 () Bool)

(assert (=> b!632315 m!606659))

(assert (=> b!632315 m!606633))

(assert (=> b!632315 m!606651))

(declare-fun m!606661 () Bool)

(assert (=> b!632315 m!606661))

(declare-fun m!606663 () Bool)

(assert (=> b!632315 m!606663))

(declare-fun m!606665 () Bool)

(assert (=> b!632315 m!606665))

(declare-fun m!606667 () Bool)

(assert (=> b!632315 m!606667))

(declare-fun m!606669 () Bool)

(assert (=> b!632314 m!606669))

(declare-fun m!606671 () Bool)

(assert (=> b!632316 m!606671))

(assert (=> b!632308 m!606633))

(assert (=> b!632308 m!606651))

(declare-fun m!606673 () Bool)

(assert (=> b!632308 m!606673))

(check-sat (not b!632318) (not b!632313) (not b!632315) (not b!632323) (not b!632322) (not b!632316) (not b!632311) (not start!57108) (not b!632317) (not b!632314))
(check-sat)
(get-model)

(declare-fun d!89203 () Bool)

(assert (=> d!89203 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!632314 d!89203))

(declare-fun d!89205 () Bool)

(assert (=> d!89205 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57108 d!89205))

(declare-fun d!89207 () Bool)

(assert (=> d!89207 (= (array_inv!14185 a!2986) (bvsge (size!18667 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57108 d!89207))

(declare-fun d!89209 () Bool)

(declare-fun e!361536 () Bool)

(assert (=> d!89209 e!361536))

(declare-fun res!409130 () Bool)

(assert (=> d!89209 (=> (not res!409130) (not e!361536))))

(assert (=> d!89209 (= res!409130 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18667 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18667 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18667 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18667 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18667 a!2986))))))

(declare-fun lt!292204 () Unit!21284)

(declare-fun choose!9 (array!38139 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21284)

(assert (=> d!89209 (= lt!292204 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292140 vacantSpotIndex!68 mask!3053))))

(assert (=> d!89209 (validMask!0 mask!3053)))

(assert (=> d!89209 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292140 vacantSpotIndex!68 mask!3053) lt!292204)))

(declare-fun b!632422 () Bool)

(assert (=> b!632422 (= e!361536 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292140 vacantSpotIndex!68 (select (arr!18302 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292140 vacantSpotIndex!68 (select (store (arr!18302 a!2986) i!1108 k0!1786) j!136) (array!38140 (store (arr!18302 a!2986) i!1108 k0!1786) (size!18667 a!2986)) mask!3053)))))

(assert (= (and d!89209 res!409130) b!632422))

(declare-fun m!606763 () Bool)

(assert (=> d!89209 m!606763))

(assert (=> d!89209 m!606639))

(assert (=> b!632422 m!606657))

(declare-fun m!606765 () Bool)

(assert (=> b!632422 m!606765))

(assert (=> b!632422 m!606633))

(assert (=> b!632422 m!606657))

(assert (=> b!632422 m!606633))

(assert (=> b!632422 m!606659))

(assert (=> b!632422 m!606651))

(assert (=> b!632315 d!89209))

(declare-fun b!632435 () Bool)

(declare-fun e!361544 () SeekEntryResult!6739)

(assert (=> b!632435 (= e!361544 (MissingVacant!6739 vacantSpotIndex!68))))

(declare-fun b!632436 () Bool)

(declare-fun c!72021 () Bool)

(declare-fun lt!292209 () (_ BitVec 64))

(assert (=> b!632436 (= c!72021 (= lt!292209 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!361545 () SeekEntryResult!6739)

(assert (=> b!632436 (= e!361545 e!361544)))

(declare-fun b!632437 () Bool)

(declare-fun e!361543 () SeekEntryResult!6739)

(assert (=> b!632437 (= e!361543 Undefined!6739)))

(declare-fun b!632439 () Bool)

(assert (=> b!632439 (= e!361545 (Found!6739 lt!292140))))

(declare-fun b!632440 () Bool)

(assert (=> b!632440 (= e!361543 e!361545)))

(declare-fun c!72019 () Bool)

(assert (=> b!632440 (= c!72019 (= lt!292209 (select (arr!18302 a!2986) j!136)))))

(declare-fun b!632438 () Bool)

(assert (=> b!632438 (= e!361544 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!292140 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18302 a!2986) j!136) a!2986 mask!3053))))

(declare-fun d!89211 () Bool)

(declare-fun lt!292210 () SeekEntryResult!6739)

(get-info :version)

(assert (=> d!89211 (and (or ((_ is Undefined!6739) lt!292210) (not ((_ is Found!6739) lt!292210)) (and (bvsge (index!29250 lt!292210) #b00000000000000000000000000000000) (bvslt (index!29250 lt!292210) (size!18667 a!2986)))) (or ((_ is Undefined!6739) lt!292210) ((_ is Found!6739) lt!292210) (not ((_ is MissingVacant!6739) lt!292210)) (not (= (index!29252 lt!292210) vacantSpotIndex!68)) (and (bvsge (index!29252 lt!292210) #b00000000000000000000000000000000) (bvslt (index!29252 lt!292210) (size!18667 a!2986)))) (or ((_ is Undefined!6739) lt!292210) (ite ((_ is Found!6739) lt!292210) (= (select (arr!18302 a!2986) (index!29250 lt!292210)) (select (arr!18302 a!2986) j!136)) (and ((_ is MissingVacant!6739) lt!292210) (= (index!29252 lt!292210) vacantSpotIndex!68) (= (select (arr!18302 a!2986) (index!29252 lt!292210)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89211 (= lt!292210 e!361543)))

(declare-fun c!72020 () Bool)

(assert (=> d!89211 (= c!72020 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89211 (= lt!292209 (select (arr!18302 a!2986) lt!292140))))

(assert (=> d!89211 (validMask!0 mask!3053)))

(assert (=> d!89211 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292140 vacantSpotIndex!68 (select (arr!18302 a!2986) j!136) a!2986 mask!3053) lt!292210)))

(assert (= (and d!89211 c!72020) b!632437))

(assert (= (and d!89211 (not c!72020)) b!632440))

(assert (= (and b!632440 c!72019) b!632439))

(assert (= (and b!632440 (not c!72019)) b!632436))

(assert (= (and b!632436 c!72021) b!632435))

(assert (= (and b!632436 (not c!72021)) b!632438))

(declare-fun m!606767 () Bool)

(assert (=> b!632438 m!606767))

(assert (=> b!632438 m!606767))

(assert (=> b!632438 m!606633))

(declare-fun m!606769 () Bool)

(assert (=> b!632438 m!606769))

(declare-fun m!606771 () Bool)

(assert (=> d!89211 m!606771))

(declare-fun m!606773 () Bool)

(assert (=> d!89211 m!606773))

(declare-fun m!606775 () Bool)

(assert (=> d!89211 m!606775))

(assert (=> d!89211 m!606639))

(assert (=> b!632315 d!89211))

(declare-fun b!632441 () Bool)

(declare-fun e!361547 () SeekEntryResult!6739)

(assert (=> b!632441 (= e!361547 (MissingVacant!6739 vacantSpotIndex!68))))

(declare-fun b!632442 () Bool)

(declare-fun c!72024 () Bool)

(declare-fun lt!292211 () (_ BitVec 64))

(assert (=> b!632442 (= c!72024 (= lt!292211 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!361548 () SeekEntryResult!6739)

(assert (=> b!632442 (= e!361548 e!361547)))

(declare-fun b!632443 () Bool)

(declare-fun e!361546 () SeekEntryResult!6739)

(assert (=> b!632443 (= e!361546 Undefined!6739)))

(declare-fun b!632445 () Bool)

(assert (=> b!632445 (= e!361548 (Found!6739 lt!292140))))

(declare-fun b!632446 () Bool)

(assert (=> b!632446 (= e!361546 e!361548)))

(declare-fun c!72022 () Bool)

(assert (=> b!632446 (= c!72022 (= lt!292211 lt!292146))))

(declare-fun b!632444 () Bool)

(assert (=> b!632444 (= e!361547 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!292140 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!292146 lt!292144 mask!3053))))

(declare-fun lt!292212 () SeekEntryResult!6739)

(declare-fun d!89213 () Bool)

(assert (=> d!89213 (and (or ((_ is Undefined!6739) lt!292212) (not ((_ is Found!6739) lt!292212)) (and (bvsge (index!29250 lt!292212) #b00000000000000000000000000000000) (bvslt (index!29250 lt!292212) (size!18667 lt!292144)))) (or ((_ is Undefined!6739) lt!292212) ((_ is Found!6739) lt!292212) (not ((_ is MissingVacant!6739) lt!292212)) (not (= (index!29252 lt!292212) vacantSpotIndex!68)) (and (bvsge (index!29252 lt!292212) #b00000000000000000000000000000000) (bvslt (index!29252 lt!292212) (size!18667 lt!292144)))) (or ((_ is Undefined!6739) lt!292212) (ite ((_ is Found!6739) lt!292212) (= (select (arr!18302 lt!292144) (index!29250 lt!292212)) lt!292146) (and ((_ is MissingVacant!6739) lt!292212) (= (index!29252 lt!292212) vacantSpotIndex!68) (= (select (arr!18302 lt!292144) (index!29252 lt!292212)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89213 (= lt!292212 e!361546)))

(declare-fun c!72023 () Bool)

(assert (=> d!89213 (= c!72023 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89213 (= lt!292211 (select (arr!18302 lt!292144) lt!292140))))

(assert (=> d!89213 (validMask!0 mask!3053)))

(assert (=> d!89213 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292140 vacantSpotIndex!68 lt!292146 lt!292144 mask!3053) lt!292212)))

(assert (= (and d!89213 c!72023) b!632443))

(assert (= (and d!89213 (not c!72023)) b!632446))

(assert (= (and b!632446 c!72022) b!632445))

(assert (= (and b!632446 (not c!72022)) b!632442))

(assert (= (and b!632442 c!72024) b!632441))

(assert (= (and b!632442 (not c!72024)) b!632444))

(assert (=> b!632444 m!606767))

(assert (=> b!632444 m!606767))

(declare-fun m!606777 () Bool)

(assert (=> b!632444 m!606777))

(declare-fun m!606779 () Bool)

(assert (=> d!89213 m!606779))

(declare-fun m!606781 () Bool)

(assert (=> d!89213 m!606781))

(declare-fun m!606783 () Bool)

(assert (=> d!89213 m!606783))

(assert (=> d!89213 m!606639))

(assert (=> b!632315 d!89213))

(declare-fun b!632447 () Bool)

(declare-fun e!361550 () SeekEntryResult!6739)

(assert (=> b!632447 (= e!361550 (MissingVacant!6739 vacantSpotIndex!68))))

(declare-fun b!632448 () Bool)

(declare-fun c!72027 () Bool)

(declare-fun lt!292213 () (_ BitVec 64))

(assert (=> b!632448 (= c!72027 (= lt!292213 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!361551 () SeekEntryResult!6739)

(assert (=> b!632448 (= e!361551 e!361550)))

(declare-fun b!632449 () Bool)

(declare-fun e!361549 () SeekEntryResult!6739)

(assert (=> b!632449 (= e!361549 Undefined!6739)))

(declare-fun b!632451 () Bool)

(assert (=> b!632451 (= e!361551 (Found!6739 index!984))))

(declare-fun b!632452 () Bool)

(assert (=> b!632452 (= e!361549 e!361551)))

(declare-fun c!72025 () Bool)

(assert (=> b!632452 (= c!72025 (= lt!292213 lt!292146))))

(declare-fun b!632450 () Bool)

(assert (=> b!632450 (= e!361550 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!292146 lt!292144 mask!3053))))

(declare-fun lt!292214 () SeekEntryResult!6739)

(declare-fun d!89215 () Bool)

(assert (=> d!89215 (and (or ((_ is Undefined!6739) lt!292214) (not ((_ is Found!6739) lt!292214)) (and (bvsge (index!29250 lt!292214) #b00000000000000000000000000000000) (bvslt (index!29250 lt!292214) (size!18667 lt!292144)))) (or ((_ is Undefined!6739) lt!292214) ((_ is Found!6739) lt!292214) (not ((_ is MissingVacant!6739) lt!292214)) (not (= (index!29252 lt!292214) vacantSpotIndex!68)) (and (bvsge (index!29252 lt!292214) #b00000000000000000000000000000000) (bvslt (index!29252 lt!292214) (size!18667 lt!292144)))) (or ((_ is Undefined!6739) lt!292214) (ite ((_ is Found!6739) lt!292214) (= (select (arr!18302 lt!292144) (index!29250 lt!292214)) lt!292146) (and ((_ is MissingVacant!6739) lt!292214) (= (index!29252 lt!292214) vacantSpotIndex!68) (= (select (arr!18302 lt!292144) (index!29252 lt!292214)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89215 (= lt!292214 e!361549)))

(declare-fun c!72026 () Bool)

(assert (=> d!89215 (= c!72026 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89215 (= lt!292213 (select (arr!18302 lt!292144) index!984))))

(assert (=> d!89215 (validMask!0 mask!3053)))

(assert (=> d!89215 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292146 lt!292144 mask!3053) lt!292214)))

(assert (= (and d!89215 c!72026) b!632449))

(assert (= (and d!89215 (not c!72026)) b!632452))

(assert (= (and b!632452 c!72025) b!632451))

(assert (= (and b!632452 (not c!72025)) b!632448))

(assert (= (and b!632448 c!72027) b!632447))

(assert (= (and b!632448 (not c!72027)) b!632450))

(assert (=> b!632450 m!606665))

(assert (=> b!632450 m!606665))

(declare-fun m!606785 () Bool)

(assert (=> b!632450 m!606785))

(declare-fun m!606787 () Bool)

(assert (=> d!89215 m!606787))

(declare-fun m!606789 () Bool)

(assert (=> d!89215 m!606789))

(declare-fun m!606791 () Bool)

(assert (=> d!89215 m!606791))

(assert (=> d!89215 m!606639))

(assert (=> b!632315 d!89215))

(declare-fun d!89217 () Bool)

(declare-fun lt!292217 () (_ BitVec 32))

(assert (=> d!89217 (and (bvsge lt!292217 #b00000000000000000000000000000000) (bvslt lt!292217 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89217 (= lt!292217 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!89217 (validMask!0 mask!3053)))

(assert (=> d!89217 (= (nextIndex!0 index!984 x!910 mask!3053) lt!292217)))

(declare-fun bs!19021 () Bool)

(assert (= bs!19021 d!89217))

(declare-fun m!606793 () Bool)

(assert (=> bs!19021 m!606793))

(assert (=> bs!19021 m!606639))

(assert (=> b!632315 d!89217))

(declare-fun b!632471 () Bool)

(declare-fun e!361569 () Bool)

(declare-fun call!33322 () Bool)

(assert (=> b!632471 (= e!361569 call!33322)))

(declare-fun b!632472 () Bool)

(declare-fun e!361571 () Bool)

(assert (=> b!632472 (= e!361571 e!361569)))

(declare-fun c!72030 () Bool)

(assert (=> b!632472 (= c!72030 (validKeyInArray!0 (select (arr!18302 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33319 () Bool)

(assert (=> bm!33319 (= call!33322 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!72030 (Cons!12378 (select (arr!18302 a!2986) #b00000000000000000000000000000000) Nil!12379) Nil!12379)))))

(declare-fun b!632473 () Bool)

(declare-fun e!361568 () Bool)

(declare-fun contains!3075 (List!12382 (_ BitVec 64)) Bool)

(assert (=> b!632473 (= e!361568 (contains!3075 Nil!12379 (select (arr!18302 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!632474 () Bool)

(declare-fun e!361570 () Bool)

(assert (=> b!632474 (= e!361570 e!361571)))

(declare-fun res!409146 () Bool)

(assert (=> b!632474 (=> (not res!409146) (not e!361571))))

(assert (=> b!632474 (= res!409146 (not e!361568))))

(declare-fun res!409147 () Bool)

(assert (=> b!632474 (=> (not res!409147) (not e!361568))))

(assert (=> b!632474 (= res!409147 (validKeyInArray!0 (select (arr!18302 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!89223 () Bool)

(declare-fun res!409145 () Bool)

(assert (=> d!89223 (=> res!409145 e!361570)))

(assert (=> d!89223 (= res!409145 (bvsge #b00000000000000000000000000000000 (size!18667 a!2986)))))

(assert (=> d!89223 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12379) e!361570)))

(declare-fun b!632475 () Bool)

(assert (=> b!632475 (= e!361569 call!33322)))

(assert (= (and d!89223 (not res!409145)) b!632474))

(assert (= (and b!632474 res!409147) b!632473))

(assert (= (and b!632474 res!409146) b!632472))

(assert (= (and b!632472 c!72030) b!632471))

(assert (= (and b!632472 (not c!72030)) b!632475))

(assert (= (or b!632471 b!632475) bm!33319))

(declare-fun m!606803 () Bool)

(assert (=> b!632472 m!606803))

(assert (=> b!632472 m!606803))

(declare-fun m!606805 () Bool)

(assert (=> b!632472 m!606805))

(assert (=> bm!33319 m!606803))

(declare-fun m!606807 () Bool)

(assert (=> bm!33319 m!606807))

(assert (=> b!632473 m!606803))

(assert (=> b!632473 m!606803))

(declare-fun m!606809 () Bool)

(assert (=> b!632473 m!606809))

(assert (=> b!632474 m!606803))

(assert (=> b!632474 m!606803))

(assert (=> b!632474 m!606805))

(assert (=> b!632316 d!89223))

(declare-fun b!632503 () Bool)

(declare-fun e!361588 () Bool)

(declare-fun call!33325 () Bool)

(assert (=> b!632503 (= e!361588 call!33325)))

(declare-fun bm!33322 () Bool)

(assert (=> bm!33322 (= call!33325 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun d!89229 () Bool)

(declare-fun res!409152 () Bool)

(declare-fun e!361587 () Bool)

(assert (=> d!89229 (=> res!409152 e!361587)))

(assert (=> d!89229 (= res!409152 (bvsge #b00000000000000000000000000000000 (size!18667 a!2986)))))

(assert (=> d!89229 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!361587)))

(declare-fun b!632502 () Bool)

(declare-fun e!361589 () Bool)

(assert (=> b!632502 (= e!361589 e!361588)))

(declare-fun lt!292232 () (_ BitVec 64))

(assert (=> b!632502 (= lt!292232 (select (arr!18302 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!292230 () Unit!21284)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38139 (_ BitVec 64) (_ BitVec 32)) Unit!21284)

(assert (=> b!632502 (= lt!292230 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!292232 #b00000000000000000000000000000000))))

(assert (=> b!632502 (arrayContainsKey!0 a!2986 lt!292232 #b00000000000000000000000000000000)))

(declare-fun lt!292231 () Unit!21284)

(assert (=> b!632502 (= lt!292231 lt!292230)))

(declare-fun res!409153 () Bool)

(assert (=> b!632502 (= res!409153 (= (seekEntryOrOpen!0 (select (arr!18302 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6739 #b00000000000000000000000000000000)))))

(assert (=> b!632502 (=> (not res!409153) (not e!361588))))

(declare-fun b!632504 () Bool)

(assert (=> b!632504 (= e!361587 e!361589)))

(declare-fun c!72042 () Bool)

(assert (=> b!632504 (= c!72042 (validKeyInArray!0 (select (arr!18302 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!632505 () Bool)

(assert (=> b!632505 (= e!361589 call!33325)))

(assert (= (and d!89229 (not res!409152)) b!632504))

(assert (= (and b!632504 c!72042) b!632502))

(assert (= (and b!632504 (not c!72042)) b!632505))

(assert (= (and b!632502 res!409153) b!632503))

(assert (= (or b!632503 b!632505) bm!33322))

(declare-fun m!606817 () Bool)

(assert (=> bm!33322 m!606817))

(assert (=> b!632502 m!606803))

(declare-fun m!606819 () Bool)

(assert (=> b!632502 m!606819))

(declare-fun m!606821 () Bool)

(assert (=> b!632502 m!606821))

(assert (=> b!632502 m!606803))

(declare-fun m!606823 () Bool)

(assert (=> b!632502 m!606823))

(assert (=> b!632504 m!606803))

(assert (=> b!632504 m!606803))

(assert (=> b!632504 m!606805))

(assert (=> b!632311 d!89229))

(declare-fun d!89237 () Bool)

(assert (=> d!89237 (= (validKeyInArray!0 (select (arr!18302 a!2986) j!136)) (and (not (= (select (arr!18302 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18302 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!632322 d!89237))

(declare-fun d!89239 () Bool)

(declare-fun lt!292254 () SeekEntryResult!6739)

(assert (=> d!89239 (and (or ((_ is Undefined!6739) lt!292254) (not ((_ is Found!6739) lt!292254)) (and (bvsge (index!29250 lt!292254) #b00000000000000000000000000000000) (bvslt (index!29250 lt!292254) (size!18667 a!2986)))) (or ((_ is Undefined!6739) lt!292254) ((_ is Found!6739) lt!292254) (not ((_ is MissingZero!6739) lt!292254)) (and (bvsge (index!29249 lt!292254) #b00000000000000000000000000000000) (bvslt (index!29249 lt!292254) (size!18667 a!2986)))) (or ((_ is Undefined!6739) lt!292254) ((_ is Found!6739) lt!292254) ((_ is MissingZero!6739) lt!292254) (not ((_ is MissingVacant!6739) lt!292254)) (and (bvsge (index!29252 lt!292254) #b00000000000000000000000000000000) (bvslt (index!29252 lt!292254) (size!18667 a!2986)))) (or ((_ is Undefined!6739) lt!292254) (ite ((_ is Found!6739) lt!292254) (= (select (arr!18302 a!2986) (index!29250 lt!292254)) k0!1786) (ite ((_ is MissingZero!6739) lt!292254) (= (select (arr!18302 a!2986) (index!29249 lt!292254)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6739) lt!292254) (= (select (arr!18302 a!2986) (index!29252 lt!292254)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!361618 () SeekEntryResult!6739)

(assert (=> d!89239 (= lt!292254 e!361618)))

(declare-fun c!72068 () Bool)

(declare-fun lt!292255 () SeekEntryResult!6739)

(assert (=> d!89239 (= c!72068 (and ((_ is Intermediate!6739) lt!292255) (undefined!7551 lt!292255)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38139 (_ BitVec 32)) SeekEntryResult!6739)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89239 (= lt!292255 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!89239 (validMask!0 mask!3053)))

(assert (=> d!89239 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!292254)))

(declare-fun b!632558 () Bool)

(declare-fun e!361619 () SeekEntryResult!6739)

(assert (=> b!632558 (= e!361619 (Found!6739 (index!29251 lt!292255)))))

(declare-fun b!632559 () Bool)

(assert (=> b!632559 (= e!361618 Undefined!6739)))

(declare-fun b!632560 () Bool)

(declare-fun c!72069 () Bool)

(declare-fun lt!292256 () (_ BitVec 64))

(assert (=> b!632560 (= c!72069 (= lt!292256 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!361620 () SeekEntryResult!6739)

(assert (=> b!632560 (= e!361619 e!361620)))

(declare-fun b!632561 () Bool)

(assert (=> b!632561 (= e!361620 (MissingZero!6739 (index!29251 lt!292255)))))

(declare-fun b!632562 () Bool)

(assert (=> b!632562 (= e!361618 e!361619)))

(assert (=> b!632562 (= lt!292256 (select (arr!18302 a!2986) (index!29251 lt!292255)))))

(declare-fun c!72067 () Bool)

(assert (=> b!632562 (= c!72067 (= lt!292256 k0!1786))))

(declare-fun b!632563 () Bool)

(assert (=> b!632563 (= e!361620 (seekKeyOrZeroReturnVacant!0 (x!57993 lt!292255) (index!29251 lt!292255) (index!29251 lt!292255) k0!1786 a!2986 mask!3053))))

(assert (= (and d!89239 c!72068) b!632559))

(assert (= (and d!89239 (not c!72068)) b!632562))

(assert (= (and b!632562 c!72067) b!632558))

(assert (= (and b!632562 (not c!72067)) b!632560))

(assert (= (and b!632560 c!72069) b!632561))

(assert (= (and b!632560 (not c!72069)) b!632563))

(assert (=> d!89239 m!606639))

(declare-fun m!606847 () Bool)

(assert (=> d!89239 m!606847))

(declare-fun m!606851 () Bool)

(assert (=> d!89239 m!606851))

(declare-fun m!606853 () Bool)

(assert (=> d!89239 m!606853))

(declare-fun m!606855 () Bool)

(assert (=> d!89239 m!606855))

(assert (=> d!89239 m!606853))

(declare-fun m!606857 () Bool)

(assert (=> d!89239 m!606857))

(declare-fun m!606859 () Bool)

(assert (=> b!632562 m!606859))

(declare-fun m!606861 () Bool)

(assert (=> b!632563 m!606861))

(assert (=> b!632317 d!89239))

(declare-fun b!632566 () Bool)

(declare-fun e!361624 () SeekEntryResult!6739)

(assert (=> b!632566 (= e!361624 (MissingVacant!6739 vacantSpotIndex!68))))

(declare-fun b!632567 () Bool)

(declare-fun c!72072 () Bool)

(declare-fun lt!292257 () (_ BitVec 64))

(assert (=> b!632567 (= c!72072 (= lt!292257 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!361625 () SeekEntryResult!6739)

(assert (=> b!632567 (= e!361625 e!361624)))

(declare-fun b!632568 () Bool)

(declare-fun e!361623 () SeekEntryResult!6739)

(assert (=> b!632568 (= e!361623 Undefined!6739)))

(declare-fun b!632570 () Bool)

(assert (=> b!632570 (= e!361625 (Found!6739 index!984))))

(declare-fun b!632571 () Bool)

(assert (=> b!632571 (= e!361623 e!361625)))

(declare-fun c!72070 () Bool)

(assert (=> b!632571 (= c!72070 (= lt!292257 (select (arr!18302 a!2986) j!136)))))

(declare-fun b!632569 () Bool)

(assert (=> b!632569 (= e!361624 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18302 a!2986) j!136) a!2986 mask!3053))))

(declare-fun lt!292258 () SeekEntryResult!6739)

(declare-fun d!89247 () Bool)

(assert (=> d!89247 (and (or ((_ is Undefined!6739) lt!292258) (not ((_ is Found!6739) lt!292258)) (and (bvsge (index!29250 lt!292258) #b00000000000000000000000000000000) (bvslt (index!29250 lt!292258) (size!18667 a!2986)))) (or ((_ is Undefined!6739) lt!292258) ((_ is Found!6739) lt!292258) (not ((_ is MissingVacant!6739) lt!292258)) (not (= (index!29252 lt!292258) vacantSpotIndex!68)) (and (bvsge (index!29252 lt!292258) #b00000000000000000000000000000000) (bvslt (index!29252 lt!292258) (size!18667 a!2986)))) (or ((_ is Undefined!6739) lt!292258) (ite ((_ is Found!6739) lt!292258) (= (select (arr!18302 a!2986) (index!29250 lt!292258)) (select (arr!18302 a!2986) j!136)) (and ((_ is MissingVacant!6739) lt!292258) (= (index!29252 lt!292258) vacantSpotIndex!68) (= (select (arr!18302 a!2986) (index!29252 lt!292258)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89247 (= lt!292258 e!361623)))

(declare-fun c!72071 () Bool)

(assert (=> d!89247 (= c!72071 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89247 (= lt!292257 (select (arr!18302 a!2986) index!984))))

(assert (=> d!89247 (validMask!0 mask!3053)))

(assert (=> d!89247 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18302 a!2986) j!136) a!2986 mask!3053) lt!292258)))

(assert (= (and d!89247 c!72071) b!632568))

(assert (= (and d!89247 (not c!72071)) b!632571))

(assert (= (and b!632571 c!72070) b!632570))

(assert (= (and b!632571 (not c!72070)) b!632567))

(assert (= (and b!632567 c!72072) b!632566))

(assert (= (and b!632567 (not c!72072)) b!632569))

(assert (=> b!632569 m!606665))

(assert (=> b!632569 m!606665))

(assert (=> b!632569 m!606633))

(declare-fun m!606863 () Bool)

(assert (=> b!632569 m!606863))

(declare-fun m!606865 () Bool)

(assert (=> d!89247 m!606865))

(declare-fun m!606867 () Bool)

(assert (=> d!89247 m!606867))

(assert (=> d!89247 m!606631))

(assert (=> d!89247 m!606639))

(assert (=> b!632323 d!89247))

(declare-fun d!89249 () Bool)

(declare-fun res!409164 () Bool)

(declare-fun e!361630 () Bool)

(assert (=> d!89249 (=> res!409164 e!361630)))

(assert (=> d!89249 (= res!409164 (= (select (arr!18302 lt!292144) j!136) (select (arr!18302 a!2986) j!136)))))

(assert (=> d!89249 (= (arrayContainsKey!0 lt!292144 (select (arr!18302 a!2986) j!136) j!136) e!361630)))

(declare-fun b!632576 () Bool)

(declare-fun e!361631 () Bool)

(assert (=> b!632576 (= e!361630 e!361631)))

(declare-fun res!409165 () Bool)

(assert (=> b!632576 (=> (not res!409165) (not e!361631))))

(assert (=> b!632576 (= res!409165 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18667 lt!292144)))))

(declare-fun b!632577 () Bool)

(assert (=> b!632577 (= e!361631 (arrayContainsKey!0 lt!292144 (select (arr!18302 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!89249 (not res!409164)) b!632576))

(assert (= (and b!632576 res!409165) b!632577))

(declare-fun m!606869 () Bool)

(assert (=> d!89249 m!606869))

(assert (=> b!632577 m!606633))

(declare-fun m!606871 () Bool)

(assert (=> b!632577 m!606871))

(assert (=> b!632318 d!89249))

(declare-fun d!89251 () Bool)

(declare-fun res!409166 () Bool)

(declare-fun e!361632 () Bool)

(assert (=> d!89251 (=> res!409166 e!361632)))

(assert (=> d!89251 (= res!409166 (= (select (arr!18302 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!89251 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!361632)))

(declare-fun b!632578 () Bool)

(declare-fun e!361633 () Bool)

(assert (=> b!632578 (= e!361632 e!361633)))

(declare-fun res!409167 () Bool)

(assert (=> b!632578 (=> (not res!409167) (not e!361633))))

(assert (=> b!632578 (= res!409167 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18667 a!2986)))))

(declare-fun b!632579 () Bool)

(assert (=> b!632579 (= e!361633 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89251 (not res!409166)) b!632578))

(assert (= (and b!632578 res!409167) b!632579))

(assert (=> d!89251 m!606803))

(declare-fun m!606873 () Bool)

(assert (=> b!632579 m!606873))

(assert (=> b!632313 d!89251))

(check-sat (not d!89215) (not b!632569) (not b!632422) (not b!632473) (not b!632444) (not d!89239) (not d!89213) (not b!632579) (not b!632577) (not b!632438) (not b!632502) (not b!632450) (not b!632474) (not d!89209) (not b!632563) (not bm!33319) (not b!632472) (not d!89247) (not d!89217) (not b!632504) (not bm!33322) (not d!89211))
(check-sat)
