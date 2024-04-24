; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58926 () Bool)

(assert start!58926)

(declare-fun b!649358 () Bool)

(declare-fun e!372461 () Bool)

(declare-fun e!372465 () Bool)

(assert (=> b!649358 (= e!372461 e!372465)))

(declare-fun res!420805 () Bool)

(assert (=> b!649358 (=> res!420805 e!372465)))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!649358 (= res!420805 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!22071 0))(
  ( (Unit!22072) )
))
(declare-fun lt!301481 () Unit!22071)

(declare-fun e!372471 () Unit!22071)

(assert (=> b!649358 (= lt!301481 e!372471)))

(declare-fun c!74654 () Bool)

(assert (=> b!649358 (= c!74654 (bvslt j!136 index!984))))

(declare-fun b!649359 () Bool)

(declare-fun res!420810 () Bool)

(declare-fun e!372473 () Bool)

(assert (=> b!649359 (=> (not res!420810) (not e!372473))))

(declare-datatypes ((array!38526 0))(
  ( (array!38527 (arr!18466 (Array (_ BitVec 32) (_ BitVec 64))) (size!18830 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38526)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38526 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!649359 (= res!420810 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!649360 () Bool)

(declare-fun Unit!22073 () Unit!22071)

(assert (=> b!649360 (= e!372471 Unit!22073)))

(declare-fun b!649361 () Bool)

(declare-fun res!420806 () Bool)

(declare-fun e!372460 () Bool)

(assert (=> b!649361 (=> (not res!420806) (not e!372460))))

(declare-datatypes ((List!12414 0))(
  ( (Nil!12411) (Cons!12410 (h!13458 (_ BitVec 64)) (t!18634 List!12414)) )
))
(declare-fun arrayNoDuplicates!0 (array!38526 (_ BitVec 32) List!12414) Bool)

(assert (=> b!649361 (= res!420806 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12411))))

(declare-fun b!649362 () Bool)

(declare-fun e!372468 () Unit!22071)

(declare-fun Unit!22074 () Unit!22071)

(assert (=> b!649362 (= e!372468 Unit!22074)))

(declare-fun b!649363 () Bool)

(declare-fun e!372474 () Bool)

(declare-datatypes ((SeekEntryResult!6862 0))(
  ( (MissingZero!6862 (index!29795 (_ BitVec 32))) (Found!6862 (index!29796 (_ BitVec 32))) (Intermediate!6862 (undefined!7674 Bool) (index!29797 (_ BitVec 32)) (x!58734 (_ BitVec 32))) (Undefined!6862) (MissingVacant!6862 (index!29798 (_ BitVec 32))) )
))
(declare-fun lt!301495 () SeekEntryResult!6862)

(declare-fun lt!301480 () SeekEntryResult!6862)

(assert (=> b!649363 (= e!372474 (= lt!301495 lt!301480))))

(declare-fun b!649364 () Bool)

(declare-fun res!420793 () Bool)

(assert (=> b!649364 (=> (not res!420793) (not e!372473))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!649364 (= res!420793 (and (= (size!18830 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18830 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18830 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!649365 () Bool)

(declare-fun res!420808 () Bool)

(assert (=> b!649365 (=> (not res!420808) (not e!372473))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!649365 (= res!420808 (validKeyInArray!0 k0!1786))))

(declare-fun b!649366 () Bool)

(declare-fun res!420796 () Bool)

(assert (=> b!649366 (=> (not res!420796) (not e!372460))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!649366 (= res!420796 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18466 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!649367 () Bool)

(declare-fun e!372469 () Bool)

(assert (=> b!649367 (= e!372465 e!372469)))

(declare-fun res!420794 () Bool)

(assert (=> b!649367 (=> res!420794 e!372469)))

(assert (=> b!649367 (= res!420794 (or (bvsge (size!18830 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18830 a!2986))))))

(declare-fun lt!301484 () array!38526)

(assert (=> b!649367 (arrayContainsKey!0 lt!301484 (select (arr!18466 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!301492 () Unit!22071)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38526 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22071)

(assert (=> b!649367 (= lt!301492 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301484 (select (arr!18466 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!372467 () Bool)

(assert (=> b!649367 e!372467))

(declare-fun res!420799 () Bool)

(assert (=> b!649367 (=> (not res!420799) (not e!372467))))

(assert (=> b!649367 (= res!420799 (arrayContainsKey!0 lt!301484 (select (arr!18466 a!2986) j!136) j!136))))

(declare-fun b!649368 () Bool)

(declare-fun e!372462 () Bool)

(assert (=> b!649368 (= e!372460 e!372462)))

(declare-fun res!420804 () Bool)

(assert (=> b!649368 (=> (not res!420804) (not e!372462))))

(assert (=> b!649368 (= res!420804 (= (select (store (arr!18466 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!649368 (= lt!301484 (array!38527 (store (arr!18466 a!2986) i!1108 k0!1786) (size!18830 a!2986)))))

(declare-fun res!420809 () Bool)

(assert (=> start!58926 (=> (not res!420809) (not e!372473))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58926 (= res!420809 (validMask!0 mask!3053))))

(assert (=> start!58926 e!372473))

(assert (=> start!58926 true))

(declare-fun array_inv!14325 (array!38526) Bool)

(assert (=> start!58926 (array_inv!14325 a!2986)))

(declare-fun b!649369 () Bool)

(declare-fun e!372472 () Bool)

(assert (=> b!649369 (= e!372472 (arrayContainsKey!0 lt!301484 (select (arr!18466 a!2986) j!136) index!984))))

(declare-fun b!649370 () Bool)

(declare-fun res!420792 () Bool)

(assert (=> b!649370 (=> res!420792 e!372469)))

(declare-fun noDuplicate!433 (List!12414) Bool)

(assert (=> b!649370 (= res!420792 (not (noDuplicate!433 Nil!12411)))))

(declare-fun b!649371 () Bool)

(declare-fun res!420789 () Bool)

(assert (=> b!649371 (=> res!420789 e!372469)))

(declare-fun contains!3146 (List!12414 (_ BitVec 64)) Bool)

(assert (=> b!649371 (= res!420789 (contains!3146 Nil!12411 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!649372 () Bool)

(declare-fun e!372459 () Bool)

(assert (=> b!649372 (= e!372462 e!372459)))

(declare-fun res!420795 () Bool)

(assert (=> b!649372 (=> (not res!420795) (not e!372459))))

(assert (=> b!649372 (= res!420795 (and (= lt!301495 (Found!6862 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18466 a!2986) index!984) (select (arr!18466 a!2986) j!136))) (not (= (select (arr!18466 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38526 (_ BitVec 32)) SeekEntryResult!6862)

(assert (=> b!649372 (= lt!301495 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18466 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!649373 () Bool)

(declare-fun Unit!22075 () Unit!22071)

(assert (=> b!649373 (= e!372468 Unit!22075)))

(assert (=> b!649373 false))

(declare-fun b!649374 () Bool)

(declare-fun Unit!22076 () Unit!22071)

(assert (=> b!649374 (= e!372471 Unit!22076)))

(declare-fun lt!301486 () Unit!22071)

(assert (=> b!649374 (= lt!301486 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301484 (select (arr!18466 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!649374 (arrayContainsKey!0 lt!301484 (select (arr!18466 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!301494 () Unit!22071)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38526 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12414) Unit!22071)

(assert (=> b!649374 (= lt!301494 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12411))))

(assert (=> b!649374 (arrayNoDuplicates!0 lt!301484 #b00000000000000000000000000000000 Nil!12411)))

(declare-fun lt!301479 () Unit!22071)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38526 (_ BitVec 32) (_ BitVec 32)) Unit!22071)

(assert (=> b!649374 (= lt!301479 (lemmaNoDuplicateFromThenFromBigger!0 lt!301484 #b00000000000000000000000000000000 j!136))))

(assert (=> b!649374 (arrayNoDuplicates!0 lt!301484 j!136 Nil!12411)))

(declare-fun lt!301490 () Unit!22071)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38526 (_ BitVec 64) (_ BitVec 32) List!12414) Unit!22071)

(assert (=> b!649374 (= lt!301490 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!301484 (select (arr!18466 a!2986) j!136) j!136 Nil!12411))))

(assert (=> b!649374 false))

(declare-fun b!649375 () Bool)

(declare-fun e!372470 () Bool)

(declare-fun e!372463 () Bool)

(assert (=> b!649375 (= e!372470 e!372463)))

(declare-fun res!420802 () Bool)

(assert (=> b!649375 (=> res!420802 e!372463)))

(declare-fun lt!301485 () (_ BitVec 64))

(declare-fun lt!301489 () (_ BitVec 64))

(assert (=> b!649375 (= res!420802 (or (not (= (select (arr!18466 a!2986) j!136) lt!301485)) (not (= (select (arr!18466 a!2986) j!136) lt!301489)) (bvsge j!136 index!984)))))

(declare-fun b!649376 () Bool)

(assert (=> b!649376 (= e!372467 (arrayContainsKey!0 lt!301484 (select (arr!18466 a!2986) j!136) index!984))))

(declare-fun b!649377 () Bool)

(declare-fun res!420797 () Bool)

(assert (=> b!649377 (=> (not res!420797) (not e!372473))))

(assert (=> b!649377 (= res!420797 (validKeyInArray!0 (select (arr!18466 a!2986) j!136)))))

(declare-fun b!649378 () Bool)

(declare-fun res!420790 () Bool)

(assert (=> b!649378 (=> (not res!420790) (not e!372460))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38526 (_ BitVec 32)) Bool)

(assert (=> b!649378 (= res!420790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!649379 () Bool)

(declare-fun e!372464 () Bool)

(assert (=> b!649379 (= e!372464 e!372461)))

(declare-fun res!420801 () Bool)

(assert (=> b!649379 (=> res!420801 e!372461)))

(assert (=> b!649379 (= res!420801 (or (not (= (select (arr!18466 a!2986) j!136) lt!301485)) (not (= (select (arr!18466 a!2986) j!136) lt!301489))))))

(assert (=> b!649379 e!372470))

(declare-fun res!420811 () Bool)

(assert (=> b!649379 (=> (not res!420811) (not e!372470))))

(assert (=> b!649379 (= res!420811 (= lt!301489 (select (arr!18466 a!2986) j!136)))))

(assert (=> b!649379 (= lt!301489 (select (store (arr!18466 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!649380 () Bool)

(assert (=> b!649380 (= e!372469 true)))

(declare-fun lt!301491 () Bool)

(assert (=> b!649380 (= lt!301491 (contains!3146 Nil!12411 k0!1786))))

(declare-fun b!649381 () Bool)

(assert (=> b!649381 (= e!372459 (not e!372464))))

(declare-fun res!420800 () Bool)

(assert (=> b!649381 (=> res!420800 e!372464)))

(declare-fun lt!301487 () SeekEntryResult!6862)

(assert (=> b!649381 (= res!420800 (not (= lt!301487 (Found!6862 index!984))))))

(declare-fun lt!301483 () Unit!22071)

(assert (=> b!649381 (= lt!301483 e!372468)))

(declare-fun c!74653 () Bool)

(assert (=> b!649381 (= c!74653 (= lt!301487 Undefined!6862))))

(assert (=> b!649381 (= lt!301487 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!301485 lt!301484 mask!3053))))

(assert (=> b!649381 e!372474))

(declare-fun res!420803 () Bool)

(assert (=> b!649381 (=> (not res!420803) (not e!372474))))

(declare-fun lt!301488 () (_ BitVec 32))

(assert (=> b!649381 (= res!420803 (= lt!301480 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301488 vacantSpotIndex!68 lt!301485 lt!301484 mask!3053)))))

(assert (=> b!649381 (= lt!301480 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301488 vacantSpotIndex!68 (select (arr!18466 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!649381 (= lt!301485 (select (store (arr!18466 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!301493 () Unit!22071)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38526 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22071)

(assert (=> b!649381 (= lt!301493 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301488 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!649381 (= lt!301488 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!649382 () Bool)

(assert (=> b!649382 (= e!372473 e!372460)))

(declare-fun res!420807 () Bool)

(assert (=> b!649382 (=> (not res!420807) (not e!372460))))

(declare-fun lt!301482 () SeekEntryResult!6862)

(assert (=> b!649382 (= res!420807 (or (= lt!301482 (MissingZero!6862 i!1108)) (= lt!301482 (MissingVacant!6862 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38526 (_ BitVec 32)) SeekEntryResult!6862)

(assert (=> b!649382 (= lt!301482 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!649383 () Bool)

(assert (=> b!649383 (= e!372463 e!372472)))

(declare-fun res!420791 () Bool)

(assert (=> b!649383 (=> (not res!420791) (not e!372472))))

(assert (=> b!649383 (= res!420791 (arrayContainsKey!0 lt!301484 (select (arr!18466 a!2986) j!136) j!136))))

(declare-fun b!649384 () Bool)

(declare-fun res!420798 () Bool)

(assert (=> b!649384 (=> res!420798 e!372469)))

(assert (=> b!649384 (= res!420798 (contains!3146 Nil!12411 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!58926 res!420809) b!649364))

(assert (= (and b!649364 res!420793) b!649377))

(assert (= (and b!649377 res!420797) b!649365))

(assert (= (and b!649365 res!420808) b!649359))

(assert (= (and b!649359 res!420810) b!649382))

(assert (= (and b!649382 res!420807) b!649378))

(assert (= (and b!649378 res!420790) b!649361))

(assert (= (and b!649361 res!420806) b!649366))

(assert (= (and b!649366 res!420796) b!649368))

(assert (= (and b!649368 res!420804) b!649372))

(assert (= (and b!649372 res!420795) b!649381))

(assert (= (and b!649381 res!420803) b!649363))

(assert (= (and b!649381 c!74653) b!649373))

(assert (= (and b!649381 (not c!74653)) b!649362))

(assert (= (and b!649381 (not res!420800)) b!649379))

(assert (= (and b!649379 res!420811) b!649375))

(assert (= (and b!649375 (not res!420802)) b!649383))

(assert (= (and b!649383 res!420791) b!649369))

(assert (= (and b!649379 (not res!420801)) b!649358))

(assert (= (and b!649358 c!74654) b!649374))

(assert (= (and b!649358 (not c!74654)) b!649360))

(assert (= (and b!649358 (not res!420805)) b!649367))

(assert (= (and b!649367 res!420799) b!649376))

(assert (= (and b!649367 (not res!420794)) b!649370))

(assert (= (and b!649370 (not res!420792)) b!649371))

(assert (= (and b!649371 (not res!420789)) b!649384))

(assert (= (and b!649384 (not res!420798)) b!649380))

(declare-fun m!623077 () Bool)

(assert (=> b!649377 m!623077))

(assert (=> b!649377 m!623077))

(declare-fun m!623079 () Bool)

(assert (=> b!649377 m!623079))

(declare-fun m!623081 () Bool)

(assert (=> b!649378 m!623081))

(declare-fun m!623083 () Bool)

(assert (=> start!58926 m!623083))

(declare-fun m!623085 () Bool)

(assert (=> start!58926 m!623085))

(declare-fun m!623087 () Bool)

(assert (=> b!649372 m!623087))

(assert (=> b!649372 m!623077))

(assert (=> b!649372 m!623077))

(declare-fun m!623089 () Bool)

(assert (=> b!649372 m!623089))

(assert (=> b!649379 m!623077))

(declare-fun m!623091 () Bool)

(assert (=> b!649379 m!623091))

(declare-fun m!623093 () Bool)

(assert (=> b!649379 m!623093))

(declare-fun m!623095 () Bool)

(assert (=> b!649381 m!623095))

(assert (=> b!649381 m!623077))

(assert (=> b!649381 m!623091))

(declare-fun m!623097 () Bool)

(assert (=> b!649381 m!623097))

(assert (=> b!649381 m!623077))

(declare-fun m!623099 () Bool)

(assert (=> b!649381 m!623099))

(declare-fun m!623101 () Bool)

(assert (=> b!649381 m!623101))

(declare-fun m!623103 () Bool)

(assert (=> b!649381 m!623103))

(declare-fun m!623105 () Bool)

(assert (=> b!649381 m!623105))

(declare-fun m!623107 () Bool)

(assert (=> b!649361 m!623107))

(assert (=> b!649376 m!623077))

(assert (=> b!649376 m!623077))

(declare-fun m!623109 () Bool)

(assert (=> b!649376 m!623109))

(assert (=> b!649368 m!623091))

(declare-fun m!623111 () Bool)

(assert (=> b!649368 m!623111))

(declare-fun m!623113 () Bool)

(assert (=> b!649366 m!623113))

(assert (=> b!649374 m!623077))

(declare-fun m!623115 () Bool)

(assert (=> b!649374 m!623115))

(assert (=> b!649374 m!623077))

(declare-fun m!623117 () Bool)

(assert (=> b!649374 m!623117))

(assert (=> b!649374 m!623077))

(declare-fun m!623119 () Bool)

(assert (=> b!649374 m!623119))

(assert (=> b!649374 m!623077))

(declare-fun m!623121 () Bool)

(assert (=> b!649374 m!623121))

(declare-fun m!623123 () Bool)

(assert (=> b!649374 m!623123))

(declare-fun m!623125 () Bool)

(assert (=> b!649374 m!623125))

(declare-fun m!623127 () Bool)

(assert (=> b!649374 m!623127))

(declare-fun m!623129 () Bool)

(assert (=> b!649382 m!623129))

(declare-fun m!623131 () Bool)

(assert (=> b!649380 m!623131))

(declare-fun m!623133 () Bool)

(assert (=> b!649365 m!623133))

(assert (=> b!649367 m!623077))

(assert (=> b!649367 m!623077))

(declare-fun m!623135 () Bool)

(assert (=> b!649367 m!623135))

(assert (=> b!649367 m!623077))

(declare-fun m!623137 () Bool)

(assert (=> b!649367 m!623137))

(assert (=> b!649367 m!623077))

(declare-fun m!623139 () Bool)

(assert (=> b!649367 m!623139))

(assert (=> b!649369 m!623077))

(assert (=> b!649369 m!623077))

(assert (=> b!649369 m!623109))

(assert (=> b!649375 m!623077))

(declare-fun m!623141 () Bool)

(assert (=> b!649384 m!623141))

(declare-fun m!623143 () Bool)

(assert (=> b!649371 m!623143))

(declare-fun m!623145 () Bool)

(assert (=> b!649370 m!623145))

(assert (=> b!649383 m!623077))

(assert (=> b!649383 m!623077))

(assert (=> b!649383 m!623139))

(declare-fun m!623147 () Bool)

(assert (=> b!649359 m!623147))

(check-sat (not b!649361) (not b!649376) (not b!649380) (not b!649372) (not b!649383) (not b!649367) (not start!58926) (not b!649370) (not b!649374) (not b!649369) (not b!649381) (not b!649378) (not b!649371) (not b!649384) (not b!649365) (not b!649377) (not b!649382) (not b!649359))
(check-sat)
