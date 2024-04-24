; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56148 () Bool)

(assert start!56148)

(declare-fun b!619207 () Bool)

(declare-datatypes ((Unit!20407 0))(
  ( (Unit!20408) )
))
(declare-fun e!355129 () Unit!20407)

(declare-fun Unit!20409 () Unit!20407)

(assert (=> b!619207 (= e!355129 Unit!20409)))

(declare-fun b!619208 () Bool)

(declare-fun res!398943 () Bool)

(declare-fun e!355127 () Bool)

(assert (=> b!619208 (=> (not res!398943) (not e!355127))))

(declare-datatypes ((array!37563 0))(
  ( (array!37564 (arr!18025 (Array (_ BitVec 32) (_ BitVec 64))) (size!18389 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37563)

(declare-datatypes ((List!11973 0))(
  ( (Nil!11970) (Cons!11969 (h!13017 (_ BitVec 64)) (t!18193 List!11973)) )
))
(declare-fun arrayNoDuplicates!0 (array!37563 (_ BitVec 32) List!11973) Bool)

(assert (=> b!619208 (= res!398943 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11970))))

(declare-fun b!619209 () Bool)

(declare-fun res!398935 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!619209 (= res!398935 (bvsge j!136 index!984))))

(declare-fun e!355122 () Bool)

(assert (=> b!619209 (=> res!398935 e!355122)))

(declare-fun e!355124 () Bool)

(assert (=> b!619209 (= e!355124 e!355122)))

(declare-fun b!619210 () Bool)

(declare-fun e!355119 () Unit!20407)

(declare-fun Unit!20410 () Unit!20407)

(assert (=> b!619210 (= e!355119 Unit!20410)))

(declare-fun b!619211 () Bool)

(declare-fun e!355123 () Unit!20407)

(declare-fun Unit!20411 () Unit!20407)

(assert (=> b!619211 (= e!355123 Unit!20411)))

(declare-fun b!619212 () Bool)

(assert (=> b!619212 false))

(declare-fun lt!285675 () array!37563)

(declare-fun lt!285665 () Unit!20407)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37563 (_ BitVec 64) (_ BitVec 32) List!11973) Unit!20407)

(assert (=> b!619212 (= lt!285665 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285675 (select (arr!18025 a!2986) j!136) j!136 Nil!11970))))

(assert (=> b!619212 (arrayNoDuplicates!0 lt!285675 j!136 Nil!11970)))

(declare-fun lt!285676 () Unit!20407)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37563 (_ BitVec 32) (_ BitVec 32)) Unit!20407)

(assert (=> b!619212 (= lt!285676 (lemmaNoDuplicateFromThenFromBigger!0 lt!285675 #b00000000000000000000000000000000 j!136))))

(assert (=> b!619212 (arrayNoDuplicates!0 lt!285675 #b00000000000000000000000000000000 Nil!11970)))

(declare-fun lt!285668 () Unit!20407)

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37563 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11973) Unit!20407)

(assert (=> b!619212 (= lt!285668 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11970))))

(declare-fun arrayContainsKey!0 (array!37563 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!619212 (arrayContainsKey!0 lt!285675 (select (arr!18025 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!285664 () Unit!20407)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37563 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20407)

(assert (=> b!619212 (= lt!285664 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285675 (select (arr!18025 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20412 () Unit!20407)

(assert (=> b!619212 (= e!355119 Unit!20412)))

(declare-fun res!398940 () Bool)

(declare-fun e!355118 () Bool)

(assert (=> start!56148 (=> (not res!398940) (not e!355118))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56148 (= res!398940 (validMask!0 mask!3053))))

(assert (=> start!56148 e!355118))

(assert (=> start!56148 true))

(declare-fun array_inv!13884 (array!37563) Bool)

(assert (=> start!56148 (array_inv!13884 a!2986)))

(declare-fun b!619213 () Bool)

(declare-fun e!355128 () Bool)

(declare-fun e!355131 () Bool)

(assert (=> b!619213 (= e!355128 (not e!355131))))

(declare-fun res!398933 () Bool)

(assert (=> b!619213 (=> res!398933 e!355131)))

(declare-datatypes ((SeekEntryResult!6421 0))(
  ( (MissingZero!6421 (index!27968 (_ BitVec 32))) (Found!6421 (index!27969 (_ BitVec 32))) (Intermediate!6421 (undefined!7233 Bool) (index!27970 (_ BitVec 32)) (x!56904 (_ BitVec 32))) (Undefined!6421) (MissingVacant!6421 (index!27971 (_ BitVec 32))) )
))
(declare-fun lt!285660 () SeekEntryResult!6421)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!619213 (= res!398933 (not (= lt!285660 (MissingVacant!6421 vacantSpotIndex!68))))))

(declare-fun lt!285663 () Unit!20407)

(declare-fun e!355121 () Unit!20407)

(assert (=> b!619213 (= lt!285663 e!355121)))

(declare-fun c!70509 () Bool)

(assert (=> b!619213 (= c!70509 (= lt!285660 (Found!6421 index!984)))))

(declare-fun lt!285661 () Unit!20407)

(assert (=> b!619213 (= lt!285661 e!355123)))

(declare-fun c!70511 () Bool)

(assert (=> b!619213 (= c!70511 (= lt!285660 Undefined!6421))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!285669 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37563 (_ BitVec 32)) SeekEntryResult!6421)

(assert (=> b!619213 (= lt!285660 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!285669 lt!285675 mask!3053))))

(declare-fun e!355117 () Bool)

(assert (=> b!619213 e!355117))

(declare-fun res!398934 () Bool)

(assert (=> b!619213 (=> (not res!398934) (not e!355117))))

(declare-fun lt!285678 () (_ BitVec 32))

(declare-fun lt!285672 () SeekEntryResult!6421)

(assert (=> b!619213 (= res!398934 (= lt!285672 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285678 vacantSpotIndex!68 lt!285669 lt!285675 mask!3053)))))

(assert (=> b!619213 (= lt!285672 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285678 vacantSpotIndex!68 (select (arr!18025 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!619213 (= lt!285669 (select (store (arr!18025 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!285674 () Unit!20407)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37563 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20407)

(assert (=> b!619213 (= lt!285674 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!285678 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!619213 (= lt!285678 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!619214 () Bool)

(declare-fun e!355120 () Bool)

(assert (=> b!619214 (= e!355120 e!355128)))

(declare-fun res!398932 () Bool)

(assert (=> b!619214 (=> (not res!398932) (not e!355128))))

(declare-fun lt!285673 () SeekEntryResult!6421)

(assert (=> b!619214 (= res!398932 (and (= lt!285673 (Found!6421 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18025 a!2986) index!984) (select (arr!18025 a!2986) j!136))) (not (= (select (arr!18025 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!619214 (= lt!285673 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18025 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!619215 () Bool)

(declare-fun Unit!20413 () Unit!20407)

(assert (=> b!619215 (= e!355123 Unit!20413)))

(assert (=> b!619215 false))

(declare-fun b!619216 () Bool)

(declare-fun Unit!20414 () Unit!20407)

(assert (=> b!619216 (= e!355121 Unit!20414)))

(declare-fun res!398928 () Bool)

(assert (=> b!619216 (= res!398928 (= (select (store (arr!18025 a!2986) i!1108 k0!1786) index!984) (select (arr!18025 a!2986) j!136)))))

(assert (=> b!619216 (=> (not res!398928) (not e!355124))))

(assert (=> b!619216 e!355124))

(declare-fun c!70508 () Bool)

(assert (=> b!619216 (= c!70508 (bvslt j!136 index!984))))

(declare-fun lt!285670 () Unit!20407)

(assert (=> b!619216 (= lt!285670 e!355119)))

(declare-fun c!70510 () Bool)

(assert (=> b!619216 (= c!70510 (bvslt index!984 j!136))))

(declare-fun lt!285667 () Unit!20407)

(assert (=> b!619216 (= lt!285667 e!355129)))

(assert (=> b!619216 false))

(declare-fun b!619217 () Bool)

(assert (=> b!619217 false))

(declare-fun lt!285662 () Unit!20407)

(assert (=> b!619217 (= lt!285662 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285675 (select (arr!18025 a!2986) j!136) index!984 Nil!11970))))

(assert (=> b!619217 (arrayNoDuplicates!0 lt!285675 index!984 Nil!11970)))

(declare-fun lt!285677 () Unit!20407)

(assert (=> b!619217 (= lt!285677 (lemmaNoDuplicateFromThenFromBigger!0 lt!285675 #b00000000000000000000000000000000 index!984))))

(assert (=> b!619217 (arrayNoDuplicates!0 lt!285675 #b00000000000000000000000000000000 Nil!11970)))

(declare-fun lt!285679 () Unit!20407)

(assert (=> b!619217 (= lt!285679 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11970))))

(assert (=> b!619217 (arrayContainsKey!0 lt!285675 (select (arr!18025 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!285671 () Unit!20407)

(assert (=> b!619217 (= lt!285671 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285675 (select (arr!18025 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!355130 () Bool)

(assert (=> b!619217 e!355130))

(declare-fun res!398936 () Bool)

(assert (=> b!619217 (=> (not res!398936) (not e!355130))))

(assert (=> b!619217 (= res!398936 (arrayContainsKey!0 lt!285675 (select (arr!18025 a!2986) j!136) j!136))))

(declare-fun Unit!20415 () Unit!20407)

(assert (=> b!619217 (= e!355129 Unit!20415)))

(declare-fun b!619218 () Bool)

(declare-fun res!398941 () Bool)

(assert (=> b!619218 (=> (not res!398941) (not e!355127))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37563 (_ BitVec 32)) Bool)

(assert (=> b!619218 (= res!398941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!619219 () Bool)

(assert (=> b!619219 (= e!355131 true)))

(assert (=> b!619219 (= (select (store (arr!18025 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!619220 () Bool)

(declare-fun Unit!20416 () Unit!20407)

(assert (=> b!619220 (= e!355121 Unit!20416)))

(declare-fun b!619221 () Bool)

(declare-fun res!398929 () Bool)

(assert (=> b!619221 (=> (not res!398929) (not e!355118))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!619221 (= res!398929 (validKeyInArray!0 (select (arr!18025 a!2986) j!136)))))

(declare-fun b!619222 () Bool)

(declare-fun res!398937 () Bool)

(assert (=> b!619222 (=> (not res!398937) (not e!355127))))

(assert (=> b!619222 (= res!398937 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18025 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!619223 () Bool)

(assert (=> b!619223 (= e!355127 e!355120)))

(declare-fun res!398942 () Bool)

(assert (=> b!619223 (=> (not res!398942) (not e!355120))))

(assert (=> b!619223 (= res!398942 (= (select (store (arr!18025 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!619223 (= lt!285675 (array!37564 (store (arr!18025 a!2986) i!1108 k0!1786) (size!18389 a!2986)))))

(declare-fun b!619224 () Bool)

(assert (=> b!619224 (= e!355118 e!355127)))

(declare-fun res!398939 () Bool)

(assert (=> b!619224 (=> (not res!398939) (not e!355127))))

(declare-fun lt!285666 () SeekEntryResult!6421)

(assert (=> b!619224 (= res!398939 (or (= lt!285666 (MissingZero!6421 i!1108)) (= lt!285666 (MissingVacant!6421 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37563 (_ BitVec 32)) SeekEntryResult!6421)

(assert (=> b!619224 (= lt!285666 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun e!355125 () Bool)

(declare-fun b!619225 () Bool)

(assert (=> b!619225 (= e!355125 (arrayContainsKey!0 lt!285675 (select (arr!18025 a!2986) j!136) index!984))))

(declare-fun b!619226 () Bool)

(assert (=> b!619226 (= e!355117 (= lt!285673 lt!285672))))

(declare-fun b!619227 () Bool)

(assert (=> b!619227 (= e!355130 (arrayContainsKey!0 lt!285675 (select (arr!18025 a!2986) j!136) index!984))))

(declare-fun b!619228 () Bool)

(declare-fun res!398930 () Bool)

(assert (=> b!619228 (=> (not res!398930) (not e!355118))))

(assert (=> b!619228 (= res!398930 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!619229 () Bool)

(declare-fun res!398938 () Bool)

(assert (=> b!619229 (=> (not res!398938) (not e!355118))))

(assert (=> b!619229 (= res!398938 (and (= (size!18389 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18389 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18389 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!619230 () Bool)

(declare-fun res!398931 () Bool)

(assert (=> b!619230 (= res!398931 (arrayContainsKey!0 lt!285675 (select (arr!18025 a!2986) j!136) j!136))))

(assert (=> b!619230 (=> (not res!398931) (not e!355125))))

(assert (=> b!619230 (= e!355122 e!355125)))

(declare-fun b!619231 () Bool)

(declare-fun res!398944 () Bool)

(assert (=> b!619231 (=> (not res!398944) (not e!355118))))

(assert (=> b!619231 (= res!398944 (validKeyInArray!0 k0!1786))))

(assert (= (and start!56148 res!398940) b!619229))

(assert (= (and b!619229 res!398938) b!619221))

(assert (= (and b!619221 res!398929) b!619231))

(assert (= (and b!619231 res!398944) b!619228))

(assert (= (and b!619228 res!398930) b!619224))

(assert (= (and b!619224 res!398939) b!619218))

(assert (= (and b!619218 res!398941) b!619208))

(assert (= (and b!619208 res!398943) b!619222))

(assert (= (and b!619222 res!398937) b!619223))

(assert (= (and b!619223 res!398942) b!619214))

(assert (= (and b!619214 res!398932) b!619213))

(assert (= (and b!619213 res!398934) b!619226))

(assert (= (and b!619213 c!70511) b!619215))

(assert (= (and b!619213 (not c!70511)) b!619211))

(assert (= (and b!619213 c!70509) b!619216))

(assert (= (and b!619213 (not c!70509)) b!619220))

(assert (= (and b!619216 res!398928) b!619209))

(assert (= (and b!619209 (not res!398935)) b!619230))

(assert (= (and b!619230 res!398931) b!619225))

(assert (= (and b!619216 c!70508) b!619212))

(assert (= (and b!619216 (not c!70508)) b!619210))

(assert (= (and b!619216 c!70510) b!619217))

(assert (= (and b!619216 (not c!70510)) b!619207))

(assert (= (and b!619217 res!398936) b!619227))

(assert (= (and b!619213 (not res!398933)) b!619219))

(declare-fun m!595487 () Bool)

(assert (=> b!619227 m!595487))

(assert (=> b!619227 m!595487))

(declare-fun m!595489 () Bool)

(assert (=> b!619227 m!595489))

(declare-fun m!595491 () Bool)

(assert (=> b!619219 m!595491))

(declare-fun m!595493 () Bool)

(assert (=> b!619219 m!595493))

(assert (=> b!619223 m!595491))

(declare-fun m!595495 () Bool)

(assert (=> b!619223 m!595495))

(assert (=> b!619217 m!595487))

(declare-fun m!595497 () Bool)

(assert (=> b!619217 m!595497))

(assert (=> b!619217 m!595487))

(declare-fun m!595499 () Bool)

(assert (=> b!619217 m!595499))

(assert (=> b!619217 m!595487))

(declare-fun m!595501 () Bool)

(assert (=> b!619217 m!595501))

(declare-fun m!595503 () Bool)

(assert (=> b!619217 m!595503))

(assert (=> b!619217 m!595487))

(declare-fun m!595505 () Bool)

(assert (=> b!619217 m!595505))

(declare-fun m!595507 () Bool)

(assert (=> b!619217 m!595507))

(declare-fun m!595509 () Bool)

(assert (=> b!619217 m!595509))

(assert (=> b!619217 m!595487))

(declare-fun m!595511 () Bool)

(assert (=> b!619217 m!595511))

(declare-fun m!595513 () Bool)

(assert (=> b!619224 m!595513))

(declare-fun m!595515 () Bool)

(assert (=> b!619228 m!595515))

(assert (=> b!619230 m!595487))

(assert (=> b!619230 m!595487))

(assert (=> b!619230 m!595497))

(declare-fun m!595517 () Bool)

(assert (=> start!56148 m!595517))

(declare-fun m!595519 () Bool)

(assert (=> start!56148 m!595519))

(assert (=> b!619216 m!595491))

(assert (=> b!619216 m!595493))

(assert (=> b!619216 m!595487))

(assert (=> b!619221 m!595487))

(assert (=> b!619221 m!595487))

(declare-fun m!595521 () Bool)

(assert (=> b!619221 m!595521))

(declare-fun m!595523 () Bool)

(assert (=> b!619213 m!595523))

(declare-fun m!595525 () Bool)

(assert (=> b!619213 m!595525))

(assert (=> b!619213 m!595487))

(assert (=> b!619213 m!595491))

(declare-fun m!595527 () Bool)

(assert (=> b!619213 m!595527))

(assert (=> b!619213 m!595487))

(declare-fun m!595529 () Bool)

(assert (=> b!619213 m!595529))

(declare-fun m!595531 () Bool)

(assert (=> b!619213 m!595531))

(declare-fun m!595533 () Bool)

(assert (=> b!619213 m!595533))

(declare-fun m!595535 () Bool)

(assert (=> b!619214 m!595535))

(assert (=> b!619214 m!595487))

(assert (=> b!619214 m!595487))

(declare-fun m!595537 () Bool)

(assert (=> b!619214 m!595537))

(declare-fun m!595539 () Bool)

(assert (=> b!619231 m!595539))

(assert (=> b!619212 m!595487))

(assert (=> b!619212 m!595487))

(declare-fun m!595541 () Bool)

(assert (=> b!619212 m!595541))

(assert (=> b!619212 m!595487))

(declare-fun m!595543 () Bool)

(assert (=> b!619212 m!595543))

(declare-fun m!595545 () Bool)

(assert (=> b!619212 m!595545))

(assert (=> b!619212 m!595487))

(declare-fun m!595547 () Bool)

(assert (=> b!619212 m!595547))

(assert (=> b!619212 m!595507))

(assert (=> b!619212 m!595499))

(declare-fun m!595549 () Bool)

(assert (=> b!619212 m!595549))

(declare-fun m!595551 () Bool)

(assert (=> b!619218 m!595551))

(assert (=> b!619225 m!595487))

(assert (=> b!619225 m!595487))

(assert (=> b!619225 m!595489))

(declare-fun m!595553 () Bool)

(assert (=> b!619222 m!595553))

(declare-fun m!595555 () Bool)

(assert (=> b!619208 m!595555))

(check-sat (not b!619227) (not start!56148) (not b!619228) (not b!619218) (not b!619224) (not b!619225) (not b!619230) (not b!619217) (not b!619214) (not b!619221) (not b!619231) (not b!619208) (not b!619212) (not b!619213))
(check-sat)
