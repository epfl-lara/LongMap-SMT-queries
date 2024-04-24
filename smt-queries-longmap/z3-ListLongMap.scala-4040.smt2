; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55164 () Bool)

(assert start!55164)

(declare-fun b!603342 () Bool)

(declare-fun e!345141 () Bool)

(declare-fun e!345140 () Bool)

(assert (=> b!603342 (= e!345141 e!345140)))

(declare-fun res!387398 () Bool)

(assert (=> b!603342 (=> res!387398 e!345140)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!274900 () (_ BitVec 64))

(declare-fun lt!274898 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37182 0))(
  ( (array!37183 (arr!17845 (Array (_ BitVec 32) (_ BitVec 64))) (size!18209 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37182)

(assert (=> b!603342 (= res!387398 (or (not (= (select (arr!17845 a!2986) j!136) lt!274900)) (not (= (select (arr!17845 a!2986) j!136) lt!274898)) (bvsge j!136 index!984)))))

(declare-fun b!603343 () Bool)

(declare-fun res!387385 () Bool)

(declare-fun e!345134 () Bool)

(assert (=> b!603343 (=> (not res!387385) (not e!345134))))

(declare-datatypes ((List!11793 0))(
  ( (Nil!11790) (Cons!11789 (h!12837 (_ BitVec 64)) (t!18013 List!11793)) )
))
(declare-fun arrayNoDuplicates!0 (array!37182 (_ BitVec 32) List!11793) Bool)

(assert (=> b!603343 (= res!387385 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11790))))

(declare-fun b!603344 () Bool)

(declare-datatypes ((Unit!19099 0))(
  ( (Unit!19100) )
))
(declare-fun e!345135 () Unit!19099)

(declare-fun Unit!19101 () Unit!19099)

(assert (=> b!603344 (= e!345135 Unit!19101)))

(declare-fun b!603345 () Bool)

(declare-fun lt!274907 () array!37182)

(declare-fun e!345130 () Bool)

(declare-fun arrayContainsKey!0 (array!37182 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!603345 (= e!345130 (arrayContainsKey!0 lt!274907 (select (arr!17845 a!2986) j!136) index!984))))

(declare-fun b!603346 () Bool)

(declare-fun res!387403 () Bool)

(declare-fun e!345139 () Bool)

(assert (=> b!603346 (=> (not res!387403) (not e!345139))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!603346 (= res!387403 (validKeyInArray!0 (select (arr!17845 a!2986) j!136)))))

(declare-fun res!387392 () Bool)

(assert (=> start!55164 (=> (not res!387392) (not e!345139))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55164 (= res!387392 (validMask!0 mask!3053))))

(assert (=> start!55164 e!345139))

(assert (=> start!55164 true))

(declare-fun array_inv!13704 (array!37182) Bool)

(assert (=> start!55164 (array_inv!13704 a!2986)))

(declare-fun b!603347 () Bool)

(assert (=> b!603347 (= e!345139 e!345134)))

(declare-fun res!387393 () Bool)

(assert (=> b!603347 (=> (not res!387393) (not e!345134))))

(declare-datatypes ((SeekEntryResult!6241 0))(
  ( (MissingZero!6241 (index!27227 (_ BitVec 32))) (Found!6241 (index!27228 (_ BitVec 32))) (Intermediate!6241 (undefined!7053 Bool) (index!27229 (_ BitVec 32)) (x!56181 (_ BitVec 32))) (Undefined!6241) (MissingVacant!6241 (index!27230 (_ BitVec 32))) )
))
(declare-fun lt!274903 () SeekEntryResult!6241)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!603347 (= res!387393 (or (= lt!274903 (MissingZero!6241 i!1108)) (= lt!274903 (MissingVacant!6241 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37182 (_ BitVec 32)) SeekEntryResult!6241)

(assert (=> b!603347 (= lt!274903 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!603348 () Bool)

(declare-fun e!345131 () Bool)

(declare-fun lt!274908 () SeekEntryResult!6241)

(declare-fun lt!274906 () SeekEntryResult!6241)

(assert (=> b!603348 (= e!345131 (= lt!274908 lt!274906))))

(declare-fun b!603349 () Bool)

(declare-fun res!387386 () Bool)

(assert (=> b!603349 (=> (not res!387386) (not e!345134))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!603349 (= res!387386 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17845 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!603350 () Bool)

(declare-fun e!345133 () Unit!19099)

(declare-fun Unit!19102 () Unit!19099)

(assert (=> b!603350 (= e!345133 Unit!19102)))

(assert (=> b!603350 false))

(declare-fun b!603351 () Bool)

(declare-fun Unit!19103 () Unit!19099)

(assert (=> b!603351 (= e!345133 Unit!19103)))

(declare-fun b!603352 () Bool)

(declare-fun res!387400 () Bool)

(assert (=> b!603352 (=> (not res!387400) (not e!345134))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37182 (_ BitVec 32)) Bool)

(assert (=> b!603352 (= res!387400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!603353 () Bool)

(declare-fun res!387397 () Bool)

(assert (=> b!603353 (=> (not res!387397) (not e!345139))))

(assert (=> b!603353 (= res!387397 (validKeyInArray!0 k0!1786))))

(declare-fun b!603354 () Bool)

(declare-fun e!345143 () Bool)

(assert (=> b!603354 (= e!345143 true)))

(declare-fun e!345136 () Bool)

(assert (=> b!603354 e!345136))

(declare-fun res!387389 () Bool)

(assert (=> b!603354 (=> (not res!387389) (not e!345136))))

(assert (=> b!603354 (= res!387389 (arrayContainsKey!0 lt!274907 (select (arr!17845 a!2986) j!136) j!136))))

(declare-fun b!603355 () Bool)

(assert (=> b!603355 (= e!345136 (arrayContainsKey!0 lt!274907 (select (arr!17845 a!2986) j!136) index!984))))

(declare-fun b!603356 () Bool)

(declare-fun res!387394 () Bool)

(assert (=> b!603356 (=> (not res!387394) (not e!345139))))

(assert (=> b!603356 (= res!387394 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!603357 () Bool)

(declare-fun e!345144 () Bool)

(assert (=> b!603357 (= e!345144 e!345143)))

(declare-fun res!387395 () Bool)

(assert (=> b!603357 (=> res!387395 e!345143)))

(assert (=> b!603357 (= res!387395 (bvsge index!984 j!136))))

(declare-fun lt!274904 () Unit!19099)

(assert (=> b!603357 (= lt!274904 e!345135)))

(declare-fun c!68348 () Bool)

(assert (=> b!603357 (= c!68348 (bvslt j!136 index!984))))

(declare-fun b!603358 () Bool)

(declare-fun e!345142 () Bool)

(assert (=> b!603358 (= e!345134 e!345142)))

(declare-fun res!387387 () Bool)

(assert (=> b!603358 (=> (not res!387387) (not e!345142))))

(assert (=> b!603358 (= res!387387 (= (select (store (arr!17845 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!603358 (= lt!274907 (array!37183 (store (arr!17845 a!2986) i!1108 k0!1786) (size!18209 a!2986)))))

(declare-fun b!603359 () Bool)

(declare-fun e!345137 () Bool)

(assert (=> b!603359 (= e!345137 e!345144)))

(declare-fun res!387390 () Bool)

(assert (=> b!603359 (=> res!387390 e!345144)))

(assert (=> b!603359 (= res!387390 (or (not (= (select (arr!17845 a!2986) j!136) lt!274900)) (not (= (select (arr!17845 a!2986) j!136) lt!274898))))))

(assert (=> b!603359 e!345141))

(declare-fun res!387388 () Bool)

(assert (=> b!603359 (=> (not res!387388) (not e!345141))))

(assert (=> b!603359 (= res!387388 (= lt!274898 (select (arr!17845 a!2986) j!136)))))

(assert (=> b!603359 (= lt!274898 (select (store (arr!17845 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!603360 () Bool)

(declare-fun res!387396 () Bool)

(assert (=> b!603360 (=> (not res!387396) (not e!345139))))

(assert (=> b!603360 (= res!387396 (and (= (size!18209 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18209 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18209 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!603361 () Bool)

(declare-fun e!345132 () Bool)

(assert (=> b!603361 (= e!345132 (not e!345137))))

(declare-fun res!387399 () Bool)

(assert (=> b!603361 (=> res!387399 e!345137)))

(declare-fun lt!274902 () SeekEntryResult!6241)

(assert (=> b!603361 (= res!387399 (not (= lt!274902 (Found!6241 index!984))))))

(declare-fun lt!274901 () Unit!19099)

(assert (=> b!603361 (= lt!274901 e!345133)))

(declare-fun c!68347 () Bool)

(assert (=> b!603361 (= c!68347 (= lt!274902 Undefined!6241))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37182 (_ BitVec 32)) SeekEntryResult!6241)

(assert (=> b!603361 (= lt!274902 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!274900 lt!274907 mask!3053))))

(assert (=> b!603361 e!345131))

(declare-fun res!387401 () Bool)

(assert (=> b!603361 (=> (not res!387401) (not e!345131))))

(declare-fun lt!274895 () (_ BitVec 32))

(assert (=> b!603361 (= res!387401 (= lt!274906 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274895 vacantSpotIndex!68 lt!274900 lt!274907 mask!3053)))))

(assert (=> b!603361 (= lt!274906 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274895 vacantSpotIndex!68 (select (arr!17845 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!603361 (= lt!274900 (select (store (arr!17845 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!274899 () Unit!19099)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37182 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19099)

(assert (=> b!603361 (= lt!274899 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274895 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!603361 (= lt!274895 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!603362 () Bool)

(declare-fun Unit!19104 () Unit!19099)

(assert (=> b!603362 (= e!345135 Unit!19104)))

(declare-fun lt!274897 () Unit!19099)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37182 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19099)

(assert (=> b!603362 (= lt!274897 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!274907 (select (arr!17845 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!603362 (arrayContainsKey!0 lt!274907 (select (arr!17845 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!274905 () Unit!19099)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37182 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11793) Unit!19099)

(assert (=> b!603362 (= lt!274905 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11790))))

(assert (=> b!603362 (arrayNoDuplicates!0 lt!274907 #b00000000000000000000000000000000 Nil!11790)))

(declare-fun lt!274909 () Unit!19099)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37182 (_ BitVec 32) (_ BitVec 32)) Unit!19099)

(assert (=> b!603362 (= lt!274909 (lemmaNoDuplicateFromThenFromBigger!0 lt!274907 #b00000000000000000000000000000000 j!136))))

(assert (=> b!603362 (arrayNoDuplicates!0 lt!274907 j!136 Nil!11790)))

(declare-fun lt!274896 () Unit!19099)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37182 (_ BitVec 64) (_ BitVec 32) List!11793) Unit!19099)

(assert (=> b!603362 (= lt!274896 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!274907 (select (arr!17845 a!2986) j!136) j!136 Nil!11790))))

(assert (=> b!603362 false))

(declare-fun b!603363 () Bool)

(assert (=> b!603363 (= e!345142 e!345132)))

(declare-fun res!387391 () Bool)

(assert (=> b!603363 (=> (not res!387391) (not e!345132))))

(assert (=> b!603363 (= res!387391 (and (= lt!274908 (Found!6241 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17845 a!2986) index!984) (select (arr!17845 a!2986) j!136))) (not (= (select (arr!17845 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!603363 (= lt!274908 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17845 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!603364 () Bool)

(assert (=> b!603364 (= e!345140 e!345130)))

(declare-fun res!387402 () Bool)

(assert (=> b!603364 (=> (not res!387402) (not e!345130))))

(assert (=> b!603364 (= res!387402 (arrayContainsKey!0 lt!274907 (select (arr!17845 a!2986) j!136) j!136))))

(assert (= (and start!55164 res!387392) b!603360))

(assert (= (and b!603360 res!387396) b!603346))

(assert (= (and b!603346 res!387403) b!603353))

(assert (= (and b!603353 res!387397) b!603356))

(assert (= (and b!603356 res!387394) b!603347))

(assert (= (and b!603347 res!387393) b!603352))

(assert (= (and b!603352 res!387400) b!603343))

(assert (= (and b!603343 res!387385) b!603349))

(assert (= (and b!603349 res!387386) b!603358))

(assert (= (and b!603358 res!387387) b!603363))

(assert (= (and b!603363 res!387391) b!603361))

(assert (= (and b!603361 res!387401) b!603348))

(assert (= (and b!603361 c!68347) b!603350))

(assert (= (and b!603361 (not c!68347)) b!603351))

(assert (= (and b!603361 (not res!387399)) b!603359))

(assert (= (and b!603359 res!387388) b!603342))

(assert (= (and b!603342 (not res!387398)) b!603364))

(assert (= (and b!603364 res!387402) b!603345))

(assert (= (and b!603359 (not res!387390)) b!603357))

(assert (= (and b!603357 c!68348) b!603362))

(assert (= (and b!603357 (not c!68348)) b!603344))

(assert (= (and b!603357 (not res!387395)) b!603354))

(assert (= (and b!603354 res!387389) b!603355))

(declare-fun m!580637 () Bool)

(assert (=> b!603353 m!580637))

(declare-fun m!580639 () Bool)

(assert (=> b!603345 m!580639))

(assert (=> b!603345 m!580639))

(declare-fun m!580641 () Bool)

(assert (=> b!603345 m!580641))

(declare-fun m!580643 () Bool)

(assert (=> start!55164 m!580643))

(declare-fun m!580645 () Bool)

(assert (=> start!55164 m!580645))

(declare-fun m!580647 () Bool)

(assert (=> b!603356 m!580647))

(declare-fun m!580649 () Bool)

(assert (=> b!603363 m!580649))

(assert (=> b!603363 m!580639))

(assert (=> b!603363 m!580639))

(declare-fun m!580651 () Bool)

(assert (=> b!603363 m!580651))

(declare-fun m!580653 () Bool)

(assert (=> b!603343 m!580653))

(assert (=> b!603354 m!580639))

(assert (=> b!603354 m!580639))

(declare-fun m!580655 () Bool)

(assert (=> b!603354 m!580655))

(assert (=> b!603342 m!580639))

(declare-fun m!580657 () Bool)

(assert (=> b!603352 m!580657))

(declare-fun m!580659 () Bool)

(assert (=> b!603347 m!580659))

(assert (=> b!603355 m!580639))

(assert (=> b!603355 m!580639))

(assert (=> b!603355 m!580641))

(assert (=> b!603359 m!580639))

(declare-fun m!580661 () Bool)

(assert (=> b!603359 m!580661))

(declare-fun m!580663 () Bool)

(assert (=> b!603359 m!580663))

(assert (=> b!603364 m!580639))

(assert (=> b!603364 m!580639))

(assert (=> b!603364 m!580655))

(declare-fun m!580665 () Bool)

(assert (=> b!603349 m!580665))

(declare-fun m!580667 () Bool)

(assert (=> b!603362 m!580667))

(assert (=> b!603362 m!580639))

(assert (=> b!603362 m!580639))

(declare-fun m!580669 () Bool)

(assert (=> b!603362 m!580669))

(assert (=> b!603362 m!580639))

(declare-fun m!580671 () Bool)

(assert (=> b!603362 m!580671))

(declare-fun m!580673 () Bool)

(assert (=> b!603362 m!580673))

(declare-fun m!580675 () Bool)

(assert (=> b!603362 m!580675))

(assert (=> b!603362 m!580639))

(declare-fun m!580677 () Bool)

(assert (=> b!603362 m!580677))

(declare-fun m!580679 () Bool)

(assert (=> b!603362 m!580679))

(declare-fun m!580681 () Bool)

(assert (=> b!603361 m!580681))

(declare-fun m!580683 () Bool)

(assert (=> b!603361 m!580683))

(declare-fun m!580685 () Bool)

(assert (=> b!603361 m!580685))

(assert (=> b!603361 m!580639))

(assert (=> b!603361 m!580661))

(declare-fun m!580687 () Bool)

(assert (=> b!603361 m!580687))

(declare-fun m!580689 () Bool)

(assert (=> b!603361 m!580689))

(assert (=> b!603361 m!580639))

(declare-fun m!580691 () Bool)

(assert (=> b!603361 m!580691))

(assert (=> b!603358 m!580661))

(declare-fun m!580693 () Bool)

(assert (=> b!603358 m!580693))

(assert (=> b!603346 m!580639))

(assert (=> b!603346 m!580639))

(declare-fun m!580695 () Bool)

(assert (=> b!603346 m!580695))

(check-sat (not b!603354) (not b!603361) (not b!603345) (not b!603352) (not b!603356) (not b!603353) (not b!603346) (not start!55164) (not b!603364) (not b!603347) (not b!603355) (not b!603362) (not b!603343) (not b!603363))
(check-sat)
