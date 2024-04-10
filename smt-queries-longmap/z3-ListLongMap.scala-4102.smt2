; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56112 () Bool)

(assert start!56112)

(declare-fun b!619523 () Bool)

(declare-fun res!399197 () Bool)

(declare-fun e!355303 () Bool)

(assert (=> b!619523 (=> (not res!399197) (not e!355303))))

(declare-datatypes ((array!37582 0))(
  ( (array!37583 (arr!18037 (Array (_ BitVec 32) (_ BitVec 64))) (size!18401 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37582)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!619523 (= res!399197 (validKeyInArray!0 (select (arr!18037 a!2986) j!136)))))

(declare-fun b!619524 () Bool)

(declare-fun res!399192 () Bool)

(assert (=> b!619524 (=> (not res!399192) (not e!355303))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!619524 (= res!399192 (validKeyInArray!0 k0!1786))))

(declare-fun b!619525 () Bool)

(declare-fun lt!285988 () array!37582)

(declare-fun res!399191 () Bool)

(declare-fun arrayContainsKey!0 (array!37582 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!619525 (= res!399191 (arrayContainsKey!0 lt!285988 (select (arr!18037 a!2986) j!136) j!136))))

(declare-fun e!355308 () Bool)

(assert (=> b!619525 (=> (not res!399191) (not e!355308))))

(declare-fun e!355309 () Bool)

(assert (=> b!619525 (= e!355309 e!355308)))

(declare-fun b!619526 () Bool)

(declare-fun e!355314 () Bool)

(declare-fun e!355312 () Bool)

(assert (=> b!619526 (= e!355314 e!355312)))

(declare-fun res!399188 () Bool)

(assert (=> b!619526 (=> (not res!399188) (not e!355312))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!619526 (= res!399188 (= (select (store (arr!18037 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!619526 (= lt!285988 (array!37583 (store (arr!18037 a!2986) i!1108 k0!1786) (size!18401 a!2986)))))

(declare-fun b!619527 () Bool)

(declare-datatypes ((Unit!20498 0))(
  ( (Unit!20499) )
))
(declare-fun e!355315 () Unit!20498)

(declare-fun Unit!20500 () Unit!20498)

(assert (=> b!619527 (= e!355315 Unit!20500)))

(declare-fun res!399181 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!619527 (= res!399181 (= (select (store (arr!18037 a!2986) i!1108 k0!1786) index!984) (select (arr!18037 a!2986) j!136)))))

(declare-fun e!355317 () Bool)

(assert (=> b!619527 (=> (not res!399181) (not e!355317))))

(assert (=> b!619527 e!355317))

(declare-fun c!70539 () Bool)

(assert (=> b!619527 (= c!70539 (bvslt j!136 index!984))))

(declare-fun lt!285978 () Unit!20498)

(declare-fun e!355306 () Unit!20498)

(assert (=> b!619527 (= lt!285978 e!355306)))

(declare-fun c!70538 () Bool)

(assert (=> b!619527 (= c!70538 (bvslt index!984 j!136))))

(declare-fun lt!285992 () Unit!20498)

(declare-fun e!355313 () Unit!20498)

(assert (=> b!619527 (= lt!285992 e!355313)))

(assert (=> b!619527 false))

(declare-fun b!619528 () Bool)

(declare-fun e!355307 () Bool)

(assert (=> b!619528 (= e!355307 (arrayContainsKey!0 lt!285988 (select (arr!18037 a!2986) j!136) index!984))))

(declare-fun b!619529 () Bool)

(assert (=> b!619529 (= e!355303 e!355314)))

(declare-fun res!399193 () Bool)

(assert (=> b!619529 (=> (not res!399193) (not e!355314))))

(declare-datatypes ((SeekEntryResult!6477 0))(
  ( (MissingZero!6477 (index!28192 (_ BitVec 32))) (Found!6477 (index!28193 (_ BitVec 32))) (Intermediate!6477 (undefined!7289 Bool) (index!28194 (_ BitVec 32)) (x!56973 (_ BitVec 32))) (Undefined!6477) (MissingVacant!6477 (index!28195 (_ BitVec 32))) )
))
(declare-fun lt!285985 () SeekEntryResult!6477)

(assert (=> b!619529 (= res!399193 (or (= lt!285985 (MissingZero!6477 i!1108)) (= lt!285985 (MissingVacant!6477 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37582 (_ BitVec 32)) SeekEntryResult!6477)

(assert (=> b!619529 (= lt!285985 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!619530 () Bool)

(assert (=> b!619530 false))

(declare-fun lt!285991 () Unit!20498)

(declare-datatypes ((List!12078 0))(
  ( (Nil!12075) (Cons!12074 (h!13119 (_ BitVec 64)) (t!18306 List!12078)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37582 (_ BitVec 64) (_ BitVec 32) List!12078) Unit!20498)

(assert (=> b!619530 (= lt!285991 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285988 (select (arr!18037 a!2986) j!136) j!136 Nil!12075))))

(declare-fun arrayNoDuplicates!0 (array!37582 (_ BitVec 32) List!12078) Bool)

(assert (=> b!619530 (arrayNoDuplicates!0 lt!285988 j!136 Nil!12075)))

(declare-fun lt!285986 () Unit!20498)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37582 (_ BitVec 32) (_ BitVec 32)) Unit!20498)

(assert (=> b!619530 (= lt!285986 (lemmaNoDuplicateFromThenFromBigger!0 lt!285988 #b00000000000000000000000000000000 j!136))))

(assert (=> b!619530 (arrayNoDuplicates!0 lt!285988 #b00000000000000000000000000000000 Nil!12075)))

(declare-fun lt!285984 () Unit!20498)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37582 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12078) Unit!20498)

(assert (=> b!619530 (= lt!285984 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12075))))

(assert (=> b!619530 (arrayContainsKey!0 lt!285988 (select (arr!18037 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!285980 () Unit!20498)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37582 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20498)

(assert (=> b!619530 (= lt!285980 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285988 (select (arr!18037 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20501 () Unit!20498)

(assert (=> b!619530 (= e!355306 Unit!20501)))

(declare-fun b!619531 () Bool)

(declare-fun res!399185 () Bool)

(assert (=> b!619531 (=> (not res!399185) (not e!355314))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!619531 (= res!399185 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18037 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!619532 () Bool)

(declare-fun Unit!20502 () Unit!20498)

(assert (=> b!619532 (= e!355306 Unit!20502)))

(declare-fun b!619533 () Bool)

(declare-fun e!355305 () Bool)

(declare-fun lt!285981 () SeekEntryResult!6477)

(declare-fun lt!285990 () SeekEntryResult!6477)

(assert (=> b!619533 (= e!355305 (= lt!285981 lt!285990))))

(declare-fun b!619534 () Bool)

(declare-fun res!399195 () Bool)

(assert (=> b!619534 (=> (not res!399195) (not e!355303))))

(assert (=> b!619534 (= res!399195 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!619535 () Bool)

(declare-fun e!355304 () Unit!20498)

(declare-fun Unit!20503 () Unit!20498)

(assert (=> b!619535 (= e!355304 Unit!20503)))

(declare-fun res!399182 () Bool)

(assert (=> start!56112 (=> (not res!399182) (not e!355303))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56112 (= res!399182 (validMask!0 mask!3053))))

(assert (=> start!56112 e!355303))

(assert (=> start!56112 true))

(declare-fun array_inv!13833 (array!37582) Bool)

(assert (=> start!56112 (array_inv!13833 a!2986)))

(declare-fun b!619536 () Bool)

(declare-fun e!355316 () Bool)

(assert (=> b!619536 (= e!355316 true)))

(assert (=> b!619536 (= (select (store (arr!18037 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!619537 () Bool)

(declare-fun e!355311 () Bool)

(assert (=> b!619537 (= e!355311 (not e!355316))))

(declare-fun res!399194 () Bool)

(assert (=> b!619537 (=> res!399194 e!355316)))

(declare-fun lt!285997 () SeekEntryResult!6477)

(assert (=> b!619537 (= res!399194 (not (= lt!285997 (MissingVacant!6477 vacantSpotIndex!68))))))

(declare-fun lt!285979 () Unit!20498)

(assert (=> b!619537 (= lt!285979 e!355315)))

(declare-fun c!70541 () Bool)

(assert (=> b!619537 (= c!70541 (= lt!285997 (Found!6477 index!984)))))

(declare-fun lt!285994 () Unit!20498)

(assert (=> b!619537 (= lt!285994 e!355304)))

(declare-fun c!70540 () Bool)

(assert (=> b!619537 (= c!70540 (= lt!285997 Undefined!6477))))

(declare-fun lt!285987 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37582 (_ BitVec 32)) SeekEntryResult!6477)

(assert (=> b!619537 (= lt!285997 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!285987 lt!285988 mask!3053))))

(assert (=> b!619537 e!355305))

(declare-fun res!399189 () Bool)

(assert (=> b!619537 (=> (not res!399189) (not e!355305))))

(declare-fun lt!285996 () (_ BitVec 32))

(assert (=> b!619537 (= res!399189 (= lt!285990 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285996 vacantSpotIndex!68 lt!285987 lt!285988 mask!3053)))))

(assert (=> b!619537 (= lt!285990 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285996 vacantSpotIndex!68 (select (arr!18037 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!619537 (= lt!285987 (select (store (arr!18037 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!285993 () Unit!20498)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37582 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20498)

(assert (=> b!619537 (= lt!285993 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!285996 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!619537 (= lt!285996 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!619538 () Bool)

(declare-fun Unit!20504 () Unit!20498)

(assert (=> b!619538 (= e!355315 Unit!20504)))

(declare-fun b!619539 () Bool)

(declare-fun res!399187 () Bool)

(assert (=> b!619539 (=> (not res!399187) (not e!355303))))

(assert (=> b!619539 (= res!399187 (and (= (size!18401 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18401 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18401 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!619540 () Bool)

(declare-fun res!399196 () Bool)

(assert (=> b!619540 (=> (not res!399196) (not e!355314))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37582 (_ BitVec 32)) Bool)

(assert (=> b!619540 (= res!399196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!619541 () Bool)

(assert (=> b!619541 false))

(declare-fun lt!285995 () Unit!20498)

(assert (=> b!619541 (= lt!285995 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285988 (select (arr!18037 a!2986) j!136) index!984 Nil!12075))))

(assert (=> b!619541 (arrayNoDuplicates!0 lt!285988 index!984 Nil!12075)))

(declare-fun lt!285983 () Unit!20498)

(assert (=> b!619541 (= lt!285983 (lemmaNoDuplicateFromThenFromBigger!0 lt!285988 #b00000000000000000000000000000000 index!984))))

(assert (=> b!619541 (arrayNoDuplicates!0 lt!285988 #b00000000000000000000000000000000 Nil!12075)))

(declare-fun lt!285982 () Unit!20498)

(assert (=> b!619541 (= lt!285982 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12075))))

(assert (=> b!619541 (arrayContainsKey!0 lt!285988 (select (arr!18037 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!285989 () Unit!20498)

(assert (=> b!619541 (= lt!285989 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285988 (select (arr!18037 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!619541 e!355307))

(declare-fun res!399184 () Bool)

(assert (=> b!619541 (=> (not res!399184) (not e!355307))))

(assert (=> b!619541 (= res!399184 (arrayContainsKey!0 lt!285988 (select (arr!18037 a!2986) j!136) j!136))))

(declare-fun Unit!20505 () Unit!20498)

(assert (=> b!619541 (= e!355313 Unit!20505)))

(declare-fun b!619542 () Bool)

(declare-fun Unit!20506 () Unit!20498)

(assert (=> b!619542 (= e!355313 Unit!20506)))

(declare-fun b!619543 () Bool)

(declare-fun res!399183 () Bool)

(assert (=> b!619543 (=> (not res!399183) (not e!355314))))

(assert (=> b!619543 (= res!399183 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12075))))

(declare-fun b!619544 () Bool)

(declare-fun Unit!20507 () Unit!20498)

(assert (=> b!619544 (= e!355304 Unit!20507)))

(assert (=> b!619544 false))

(declare-fun b!619545 () Bool)

(assert (=> b!619545 (= e!355312 e!355311)))

(declare-fun res!399186 () Bool)

(assert (=> b!619545 (=> (not res!399186) (not e!355311))))

(assert (=> b!619545 (= res!399186 (and (= lt!285981 (Found!6477 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18037 a!2986) index!984) (select (arr!18037 a!2986) j!136))) (not (= (select (arr!18037 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!619545 (= lt!285981 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18037 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!619546 () Bool)

(declare-fun res!399190 () Bool)

(assert (=> b!619546 (= res!399190 (bvsge j!136 index!984))))

(assert (=> b!619546 (=> res!399190 e!355309)))

(assert (=> b!619546 (= e!355317 e!355309)))

(declare-fun b!619547 () Bool)

(assert (=> b!619547 (= e!355308 (arrayContainsKey!0 lt!285988 (select (arr!18037 a!2986) j!136) index!984))))

(assert (= (and start!56112 res!399182) b!619539))

(assert (= (and b!619539 res!399187) b!619523))

(assert (= (and b!619523 res!399197) b!619524))

(assert (= (and b!619524 res!399192) b!619534))

(assert (= (and b!619534 res!399195) b!619529))

(assert (= (and b!619529 res!399193) b!619540))

(assert (= (and b!619540 res!399196) b!619543))

(assert (= (and b!619543 res!399183) b!619531))

(assert (= (and b!619531 res!399185) b!619526))

(assert (= (and b!619526 res!399188) b!619545))

(assert (= (and b!619545 res!399186) b!619537))

(assert (= (and b!619537 res!399189) b!619533))

(assert (= (and b!619537 c!70540) b!619544))

(assert (= (and b!619537 (not c!70540)) b!619535))

(assert (= (and b!619537 c!70541) b!619527))

(assert (= (and b!619537 (not c!70541)) b!619538))

(assert (= (and b!619527 res!399181) b!619546))

(assert (= (and b!619546 (not res!399190)) b!619525))

(assert (= (and b!619525 res!399191) b!619547))

(assert (= (and b!619527 c!70539) b!619530))

(assert (= (and b!619527 (not c!70539)) b!619532))

(assert (= (and b!619527 c!70538) b!619541))

(assert (= (and b!619527 (not c!70538)) b!619542))

(assert (= (and b!619541 res!399184) b!619528))

(assert (= (and b!619537 (not res!399194)) b!619536))

(declare-fun m!595491 () Bool)

(assert (=> b!619524 m!595491))

(declare-fun m!595493 () Bool)

(assert (=> b!619526 m!595493))

(declare-fun m!595495 () Bool)

(assert (=> b!619526 m!595495))

(declare-fun m!595497 () Bool)

(assert (=> b!619530 m!595497))

(declare-fun m!595499 () Bool)

(assert (=> b!619530 m!595499))

(declare-fun m!595501 () Bool)

(assert (=> b!619530 m!595501))

(assert (=> b!619530 m!595499))

(assert (=> b!619530 m!595499))

(declare-fun m!595503 () Bool)

(assert (=> b!619530 m!595503))

(declare-fun m!595505 () Bool)

(assert (=> b!619530 m!595505))

(assert (=> b!619530 m!595499))

(declare-fun m!595507 () Bool)

(assert (=> b!619530 m!595507))

(declare-fun m!595509 () Bool)

(assert (=> b!619530 m!595509))

(declare-fun m!595511 () Bool)

(assert (=> b!619530 m!595511))

(assert (=> b!619527 m!595493))

(declare-fun m!595513 () Bool)

(assert (=> b!619527 m!595513))

(assert (=> b!619527 m!595499))

(declare-fun m!595515 () Bool)

(assert (=> b!619537 m!595515))

(declare-fun m!595517 () Bool)

(assert (=> b!619537 m!595517))

(assert (=> b!619537 m!595499))

(declare-fun m!595519 () Bool)

(assert (=> b!619537 m!595519))

(assert (=> b!619537 m!595499))

(assert (=> b!619537 m!595493))

(declare-fun m!595521 () Bool)

(assert (=> b!619537 m!595521))

(declare-fun m!595523 () Bool)

(assert (=> b!619537 m!595523))

(declare-fun m!595525 () Bool)

(assert (=> b!619537 m!595525))

(declare-fun m!595527 () Bool)

(assert (=> b!619543 m!595527))

(assert (=> b!619525 m!595499))

(assert (=> b!619525 m!595499))

(declare-fun m!595529 () Bool)

(assert (=> b!619525 m!595529))

(declare-fun m!595531 () Bool)

(assert (=> b!619529 m!595531))

(assert (=> b!619523 m!595499))

(assert (=> b!619523 m!595499))

(declare-fun m!595533 () Bool)

(assert (=> b!619523 m!595533))

(assert (=> b!619541 m!595499))

(declare-fun m!595535 () Bool)

(assert (=> b!619541 m!595535))

(assert (=> b!619541 m!595511))

(declare-fun m!595537 () Bool)

(assert (=> b!619541 m!595537))

(assert (=> b!619541 m!595499))

(declare-fun m!595539 () Bool)

(assert (=> b!619541 m!595539))

(declare-fun m!595541 () Bool)

(assert (=> b!619541 m!595541))

(assert (=> b!619541 m!595505))

(assert (=> b!619541 m!595499))

(assert (=> b!619541 m!595499))

(declare-fun m!595543 () Bool)

(assert (=> b!619541 m!595543))

(assert (=> b!619541 m!595499))

(assert (=> b!619541 m!595529))

(assert (=> b!619528 m!595499))

(assert (=> b!619528 m!595499))

(declare-fun m!595545 () Bool)

(assert (=> b!619528 m!595545))

(declare-fun m!595547 () Bool)

(assert (=> b!619531 m!595547))

(declare-fun m!595549 () Bool)

(assert (=> b!619534 m!595549))

(declare-fun m!595551 () Bool)

(assert (=> start!56112 m!595551))

(declare-fun m!595553 () Bool)

(assert (=> start!56112 m!595553))

(declare-fun m!595555 () Bool)

(assert (=> b!619540 m!595555))

(assert (=> b!619547 m!595499))

(assert (=> b!619547 m!595499))

(assert (=> b!619547 m!595545))

(assert (=> b!619536 m!595493))

(assert (=> b!619536 m!595513))

(declare-fun m!595557 () Bool)

(assert (=> b!619545 m!595557))

(assert (=> b!619545 m!595499))

(assert (=> b!619545 m!595499))

(declare-fun m!595559 () Bool)

(assert (=> b!619545 m!595559))

(check-sat (not b!619529) (not b!619543) (not b!619530) (not b!619540) (not b!619525) (not start!56112) (not b!619524) (not b!619541) (not b!619547) (not b!619534) (not b!619528) (not b!619537) (not b!619523) (not b!619545))
(check-sat)
