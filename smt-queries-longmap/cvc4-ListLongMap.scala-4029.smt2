; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54884 () Bool)

(assert start!54884)

(declare-fun res!385337 () Bool)

(declare-fun e!343301 () Bool)

(assert (=> start!54884 (=> (not res!385337) (not e!343301))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54884 (= res!385337 (validMask!0 mask!3053))))

(assert (=> start!54884 e!343301))

(assert (=> start!54884 true))

(declare-datatypes ((array!37119 0))(
  ( (array!37120 (arr!17819 (Array (_ BitVec 32) (_ BitVec 64))) (size!18183 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37119)

(declare-fun array_inv!13615 (array!37119) Bool)

(assert (=> start!54884 (array_inv!13615 a!2986)))

(declare-fun b!600449 () Bool)

(declare-fun res!385351 () Bool)

(declare-fun e!343305 () Bool)

(assert (=> b!600449 (=> (not res!385351) (not e!343305))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37119 (_ BitVec 32)) Bool)

(assert (=> b!600449 (= res!385351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!600450 () Bool)

(declare-fun e!343300 () Bool)

(declare-datatypes ((SeekEntryResult!6259 0))(
  ( (MissingZero!6259 (index!27293 (_ BitVec 32))) (Found!6259 (index!27294 (_ BitVec 32))) (Intermediate!6259 (undefined!7071 Bool) (index!27295 (_ BitVec 32)) (x!56090 (_ BitVec 32))) (Undefined!6259) (MissingVacant!6259 (index!27296 (_ BitVec 32))) )
))
(declare-fun lt!273148 () SeekEntryResult!6259)

(declare-fun lt!273139 () SeekEntryResult!6259)

(assert (=> b!600450 (= e!343300 (= lt!273148 lt!273139))))

(declare-fun b!600451 () Bool)

(declare-fun e!343309 () Bool)

(assert (=> b!600451 (= e!343305 e!343309)))

(declare-fun res!385335 () Bool)

(assert (=> b!600451 (=> (not res!385335) (not e!343309))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!600451 (= res!385335 (= (select (store (arr!17819 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!273143 () array!37119)

(assert (=> b!600451 (= lt!273143 (array!37120 (store (arr!17819 a!2986) i!1108 k!1786) (size!18183 a!2986)))))

(declare-fun b!600452 () Bool)

(declare-fun e!343306 () Bool)

(declare-fun e!343303 () Bool)

(assert (=> b!600452 (= e!343306 e!343303)))

(declare-fun res!385350 () Bool)

(assert (=> b!600452 (=> (not res!385350) (not e!343303))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37119 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!600452 (= res!385350 (arrayContainsKey!0 lt!273143 (select (arr!17819 a!2986) j!136) j!136))))

(declare-fun b!600453 () Bool)

(declare-fun e!343311 () Bool)

(assert (=> b!600453 (= e!343311 true)))

(declare-fun lt!273144 () Bool)

(declare-datatypes ((List!11860 0))(
  ( (Nil!11857) (Cons!11856 (h!12901 (_ BitVec 64)) (t!18088 List!11860)) )
))
(declare-fun contains!2976 (List!11860 (_ BitVec 64)) Bool)

(assert (=> b!600453 (= lt!273144 (contains!2976 Nil!11857 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600454 () Bool)

(declare-fun e!343302 () Bool)

(assert (=> b!600454 (= e!343302 e!343311)))

(declare-fun res!385333 () Bool)

(assert (=> b!600454 (=> res!385333 e!343311)))

(assert (=> b!600454 (= res!385333 (or (bvsge (size!18183 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18183 a!2986))))))

(declare-fun arrayNoDuplicates!0 (array!37119 (_ BitVec 32) List!11860) Bool)

(assert (=> b!600454 (arrayNoDuplicates!0 lt!273143 j!136 Nil!11857)))

(declare-datatypes ((Unit!18954 0))(
  ( (Unit!18955) )
))
(declare-fun lt!273149 () Unit!18954)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37119 (_ BitVec 32) (_ BitVec 32)) Unit!18954)

(assert (=> b!600454 (= lt!273149 (lemmaNoDuplicateFromThenFromBigger!0 lt!273143 #b00000000000000000000000000000000 j!136))))

(assert (=> b!600454 (arrayNoDuplicates!0 lt!273143 #b00000000000000000000000000000000 Nil!11857)))

(declare-fun lt!273142 () Unit!18954)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37119 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11860) Unit!18954)

(assert (=> b!600454 (= lt!273142 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11857))))

(assert (=> b!600454 (arrayContainsKey!0 lt!273143 (select (arr!17819 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!273147 () Unit!18954)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37119 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18954)

(assert (=> b!600454 (= lt!273147 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273143 (select (arr!17819 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!600455 () Bool)

(declare-fun e!343304 () Unit!18954)

(declare-fun Unit!18956 () Unit!18954)

(assert (=> b!600455 (= e!343304 Unit!18956)))

(declare-fun b!600456 () Bool)

(assert (=> b!600456 (= e!343303 (arrayContainsKey!0 lt!273143 (select (arr!17819 a!2986) j!136) index!984))))

(declare-fun b!600457 () Bool)

(declare-fun res!385349 () Bool)

(assert (=> b!600457 (=> (not res!385349) (not e!343301))))

(assert (=> b!600457 (= res!385349 (and (= (size!18183 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18183 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18183 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!600458 () Bool)

(declare-fun res!385340 () Bool)

(assert (=> b!600458 (=> (not res!385340) (not e!343305))))

(assert (=> b!600458 (= res!385340 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11857))))

(declare-fun b!600459 () Bool)

(assert (=> b!600459 (= e!343301 e!343305)))

(declare-fun res!385336 () Bool)

(assert (=> b!600459 (=> (not res!385336) (not e!343305))))

(declare-fun lt!273151 () SeekEntryResult!6259)

(assert (=> b!600459 (= res!385336 (or (= lt!273151 (MissingZero!6259 i!1108)) (= lt!273151 (MissingVacant!6259 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37119 (_ BitVec 32)) SeekEntryResult!6259)

(assert (=> b!600459 (= lt!273151 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!600460 () Bool)

(declare-fun e!343308 () Bool)

(assert (=> b!600460 (= e!343308 e!343306)))

(declare-fun res!385352 () Bool)

(assert (=> b!600460 (=> res!385352 e!343306)))

(declare-fun lt!273146 () (_ BitVec 64))

(declare-fun lt!273138 () (_ BitVec 64))

(assert (=> b!600460 (= res!385352 (or (not (= (select (arr!17819 a!2986) j!136) lt!273146)) (not (= (select (arr!17819 a!2986) j!136) lt!273138)) (bvsge j!136 index!984)))))

(declare-fun b!600461 () Bool)

(declare-fun res!385347 () Bool)

(assert (=> b!600461 (=> (not res!385347) (not e!343305))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!600461 (= res!385347 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17819 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!600462 () Bool)

(declare-fun e!343307 () Bool)

(assert (=> b!600462 (= e!343307 e!343302)))

(declare-fun res!385334 () Bool)

(assert (=> b!600462 (=> res!385334 e!343302)))

(assert (=> b!600462 (= res!385334 (or (not (= (select (arr!17819 a!2986) j!136) lt!273146)) (not (= (select (arr!17819 a!2986) j!136) lt!273138)) (bvsge j!136 index!984)))))

(assert (=> b!600462 e!343308))

(declare-fun res!385345 () Bool)

(assert (=> b!600462 (=> (not res!385345) (not e!343308))))

(assert (=> b!600462 (= res!385345 (= lt!273138 (select (arr!17819 a!2986) j!136)))))

(assert (=> b!600462 (= lt!273138 (select (store (arr!17819 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!600463 () Bool)

(declare-fun res!385338 () Bool)

(assert (=> b!600463 (=> res!385338 e!343311)))

(declare-fun noDuplicate!293 (List!11860) Bool)

(assert (=> b!600463 (= res!385338 (not (noDuplicate!293 Nil!11857)))))

(declare-fun b!600464 () Bool)

(declare-fun res!385339 () Bool)

(assert (=> b!600464 (=> (not res!385339) (not e!343301))))

(assert (=> b!600464 (= res!385339 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!600465 () Bool)

(declare-fun res!385344 () Bool)

(assert (=> b!600465 (=> res!385344 e!343311)))

(assert (=> b!600465 (= res!385344 (contains!2976 Nil!11857 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600466 () Bool)

(declare-fun res!385341 () Bool)

(assert (=> b!600466 (=> (not res!385341) (not e!343301))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!600466 (= res!385341 (validKeyInArray!0 k!1786))))

(declare-fun b!600467 () Bool)

(declare-fun Unit!18957 () Unit!18954)

(assert (=> b!600467 (= e!343304 Unit!18957)))

(assert (=> b!600467 false))

(declare-fun b!600468 () Bool)

(declare-fun e!343310 () Bool)

(assert (=> b!600468 (= e!343309 e!343310)))

(declare-fun res!385342 () Bool)

(assert (=> b!600468 (=> (not res!385342) (not e!343310))))

(assert (=> b!600468 (= res!385342 (and (= lt!273148 (Found!6259 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17819 a!2986) index!984) (select (arr!17819 a!2986) j!136))) (not (= (select (arr!17819 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37119 (_ BitVec 32)) SeekEntryResult!6259)

(assert (=> b!600468 (= lt!273148 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17819 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!600469 () Bool)

(declare-fun res!385348 () Bool)

(assert (=> b!600469 (=> (not res!385348) (not e!343301))))

(assert (=> b!600469 (= res!385348 (validKeyInArray!0 (select (arr!17819 a!2986) j!136)))))

(declare-fun b!600470 () Bool)

(assert (=> b!600470 (= e!343310 (not e!343307))))

(declare-fun res!385346 () Bool)

(assert (=> b!600470 (=> res!385346 e!343307)))

(declare-fun lt!273141 () SeekEntryResult!6259)

(assert (=> b!600470 (= res!385346 (not (= lt!273141 (Found!6259 index!984))))))

(declare-fun lt!273150 () Unit!18954)

(assert (=> b!600470 (= lt!273150 e!343304)))

(declare-fun c!67925 () Bool)

(assert (=> b!600470 (= c!67925 (= lt!273141 Undefined!6259))))

(assert (=> b!600470 (= lt!273141 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273146 lt!273143 mask!3053))))

(assert (=> b!600470 e!343300))

(declare-fun res!385343 () Bool)

(assert (=> b!600470 (=> (not res!385343) (not e!343300))))

(declare-fun lt!273140 () (_ BitVec 32))

(assert (=> b!600470 (= res!385343 (= lt!273139 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273140 vacantSpotIndex!68 lt!273146 lt!273143 mask!3053)))))

(assert (=> b!600470 (= lt!273139 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273140 vacantSpotIndex!68 (select (arr!17819 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!600470 (= lt!273146 (select (store (arr!17819 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!273145 () Unit!18954)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37119 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18954)

(assert (=> b!600470 (= lt!273145 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273140 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!600470 (= lt!273140 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!54884 res!385337) b!600457))

(assert (= (and b!600457 res!385349) b!600469))

(assert (= (and b!600469 res!385348) b!600466))

(assert (= (and b!600466 res!385341) b!600464))

(assert (= (and b!600464 res!385339) b!600459))

(assert (= (and b!600459 res!385336) b!600449))

(assert (= (and b!600449 res!385351) b!600458))

(assert (= (and b!600458 res!385340) b!600461))

(assert (= (and b!600461 res!385347) b!600451))

(assert (= (and b!600451 res!385335) b!600468))

(assert (= (and b!600468 res!385342) b!600470))

(assert (= (and b!600470 res!385343) b!600450))

(assert (= (and b!600470 c!67925) b!600467))

(assert (= (and b!600470 (not c!67925)) b!600455))

(assert (= (and b!600470 (not res!385346)) b!600462))

(assert (= (and b!600462 res!385345) b!600460))

(assert (= (and b!600460 (not res!385352)) b!600452))

(assert (= (and b!600452 res!385350) b!600456))

(assert (= (and b!600462 (not res!385334)) b!600454))

(assert (= (and b!600454 (not res!385333)) b!600463))

(assert (= (and b!600463 (not res!385338)) b!600465))

(assert (= (and b!600465 (not res!385344)) b!600453))

(declare-fun m!577669 () Bool)

(assert (=> b!600449 m!577669))

(declare-fun m!577671 () Bool)

(assert (=> b!600461 m!577671))

(declare-fun m!577673 () Bool)

(assert (=> start!54884 m!577673))

(declare-fun m!577675 () Bool)

(assert (=> start!54884 m!577675))

(declare-fun m!577677 () Bool)

(assert (=> b!600460 m!577677))

(declare-fun m!577679 () Bool)

(assert (=> b!600464 m!577679))

(assert (=> b!600452 m!577677))

(assert (=> b!600452 m!577677))

(declare-fun m!577681 () Bool)

(assert (=> b!600452 m!577681))

(declare-fun m!577683 () Bool)

(assert (=> b!600465 m!577683))

(assert (=> b!600454 m!577677))

(declare-fun m!577685 () Bool)

(assert (=> b!600454 m!577685))

(assert (=> b!600454 m!577677))

(declare-fun m!577687 () Bool)

(assert (=> b!600454 m!577687))

(declare-fun m!577689 () Bool)

(assert (=> b!600454 m!577689))

(declare-fun m!577691 () Bool)

(assert (=> b!600454 m!577691))

(assert (=> b!600454 m!577677))

(declare-fun m!577693 () Bool)

(assert (=> b!600454 m!577693))

(declare-fun m!577695 () Bool)

(assert (=> b!600454 m!577695))

(declare-fun m!577697 () Bool)

(assert (=> b!600458 m!577697))

(declare-fun m!577699 () Bool)

(assert (=> b!600466 m!577699))

(declare-fun m!577701 () Bool)

(assert (=> b!600459 m!577701))

(declare-fun m!577703 () Bool)

(assert (=> b!600453 m!577703))

(assert (=> b!600462 m!577677))

(declare-fun m!577705 () Bool)

(assert (=> b!600462 m!577705))

(declare-fun m!577707 () Bool)

(assert (=> b!600462 m!577707))

(assert (=> b!600451 m!577705))

(declare-fun m!577709 () Bool)

(assert (=> b!600451 m!577709))

(declare-fun m!577711 () Bool)

(assert (=> b!600470 m!577711))

(declare-fun m!577713 () Bool)

(assert (=> b!600470 m!577713))

(declare-fun m!577715 () Bool)

(assert (=> b!600470 m!577715))

(assert (=> b!600470 m!577677))

(assert (=> b!600470 m!577705))

(assert (=> b!600470 m!577677))

(declare-fun m!577717 () Bool)

(assert (=> b!600470 m!577717))

(declare-fun m!577719 () Bool)

(assert (=> b!600470 m!577719))

(declare-fun m!577721 () Bool)

(assert (=> b!600470 m!577721))

(declare-fun m!577723 () Bool)

(assert (=> b!600463 m!577723))

(assert (=> b!600469 m!577677))

(assert (=> b!600469 m!577677))

(declare-fun m!577725 () Bool)

(assert (=> b!600469 m!577725))

(declare-fun m!577727 () Bool)

(assert (=> b!600468 m!577727))

(assert (=> b!600468 m!577677))

(assert (=> b!600468 m!577677))

(declare-fun m!577729 () Bool)

(assert (=> b!600468 m!577729))

(assert (=> b!600456 m!577677))

(assert (=> b!600456 m!577677))

(declare-fun m!577731 () Bool)

(assert (=> b!600456 m!577731))

(push 1)

