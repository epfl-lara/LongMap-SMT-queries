; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56238 () Bool)

(assert start!56238)

(declare-fun b!622490 () Bool)

(declare-fun res!401132 () Bool)

(declare-fun e!357060 () Bool)

(assert (=> b!622490 (=> (not res!401132) (not e!357060))))

(declare-datatypes ((array!37653 0))(
  ( (array!37654 (arr!18070 (Array (_ BitVec 32) (_ BitVec 64))) (size!18434 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37653)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!622490 (= res!401132 (validKeyInArray!0 (select (arr!18070 a!2986) j!136)))))

(declare-fun b!622491 () Bool)

(declare-fun e!357062 () Bool)

(declare-datatypes ((SeekEntryResult!6466 0))(
  ( (MissingZero!6466 (index!28148 (_ BitVec 32))) (Found!6466 (index!28149 (_ BitVec 32))) (Intermediate!6466 (undefined!7278 Bool) (index!28150 (_ BitVec 32)) (x!57069 (_ BitVec 32))) (Undefined!6466) (MissingVacant!6466 (index!28151 (_ BitVec 32))) )
))
(declare-fun lt!288363 () SeekEntryResult!6466)

(declare-fun lt!288375 () SeekEntryResult!6466)

(assert (=> b!622491 (= e!357062 (= lt!288363 lt!288375))))

(declare-fun b!622492 () Bool)

(declare-fun res!401144 () Bool)

(assert (=> b!622492 (=> (not res!401144) (not e!357060))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37653 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!622492 (= res!401144 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!622493 () Bool)

(declare-datatypes ((Unit!20857 0))(
  ( (Unit!20858) )
))
(declare-fun e!357055 () Unit!20857)

(declare-fun Unit!20859 () Unit!20857)

(assert (=> b!622493 (= e!357055 Unit!20859)))

(declare-fun b!622494 () Bool)

(declare-fun res!401133 () Bool)

(assert (=> b!622494 (=> (not res!401133) (not e!357060))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!622494 (= res!401133 (and (= (size!18434 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18434 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18434 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!622495 () Bool)

(declare-fun e!357054 () Unit!20857)

(declare-fun Unit!20860 () Unit!20857)

(assert (=> b!622495 (= e!357054 Unit!20860)))

(declare-fun lt!288376 () array!37653)

(declare-fun b!622496 () Bool)

(declare-fun e!357053 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!622496 (= e!357053 (arrayContainsKey!0 lt!288376 (select (arr!18070 a!2986) j!136) index!984))))

(declare-fun b!622497 () Bool)

(declare-fun e!357061 () Unit!20857)

(declare-fun Unit!20861 () Unit!20857)

(assert (=> b!622497 (= e!357061 Unit!20861)))

(assert (=> b!622497 false))

(declare-fun b!622498 () Bool)

(declare-fun res!401146 () Bool)

(assert (=> b!622498 (=> (not res!401146) (not e!357060))))

(assert (=> b!622498 (= res!401146 (validKeyInArray!0 k0!1786))))

(declare-fun b!622499 () Bool)

(declare-fun Unit!20862 () Unit!20857)

(assert (=> b!622499 (= e!357055 Unit!20862)))

(declare-fun res!401142 () Bool)

(assert (=> b!622499 (= res!401142 (= (select (store (arr!18070 a!2986) i!1108 k0!1786) index!984) (select (arr!18070 a!2986) j!136)))))

(declare-fun e!357051 () Bool)

(assert (=> b!622499 (=> (not res!401142) (not e!357051))))

(assert (=> b!622499 e!357051))

(declare-fun c!71049 () Bool)

(assert (=> b!622499 (= c!71049 (bvslt j!136 index!984))))

(declare-fun lt!288379 () Unit!20857)

(assert (=> b!622499 (= lt!288379 e!357054)))

(declare-fun c!71048 () Bool)

(assert (=> b!622499 (= c!71048 (bvslt index!984 j!136))))

(declare-fun lt!288370 () Unit!20857)

(declare-fun e!357057 () Unit!20857)

(assert (=> b!622499 (= lt!288370 e!357057)))

(assert (=> b!622499 false))

(declare-fun b!622500 () Bool)

(declare-fun res!401134 () Bool)

(assert (=> b!622500 (= res!401134 (arrayContainsKey!0 lt!288376 (select (arr!18070 a!2986) j!136) j!136))))

(declare-fun e!357059 () Bool)

(assert (=> b!622500 (=> (not res!401134) (not e!357059))))

(declare-fun e!357056 () Bool)

(assert (=> b!622500 (= e!357056 e!357059)))

(declare-fun b!622501 () Bool)

(declare-fun res!401136 () Bool)

(declare-fun e!357052 () Bool)

(assert (=> b!622501 (=> (not res!401136) (not e!357052))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37653 (_ BitVec 32)) Bool)

(assert (=> b!622501 (= res!401136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!401139 () Bool)

(assert (=> start!56238 (=> (not res!401139) (not e!357060))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56238 (= res!401139 (validMask!0 mask!3053))))

(assert (=> start!56238 e!357060))

(assert (=> start!56238 true))

(declare-fun array_inv!13929 (array!37653) Bool)

(assert (=> start!56238 (array_inv!13929 a!2986)))

(declare-fun b!622502 () Bool)

(declare-fun e!357050 () Bool)

(assert (=> b!622502 (= e!357050 (not true))))

(declare-fun lt!288377 () Unit!20857)

(assert (=> b!622502 (= lt!288377 e!357055)))

(declare-fun c!71050 () Bool)

(declare-fun lt!288374 () SeekEntryResult!6466)

(assert (=> b!622502 (= c!71050 (= lt!288374 (Found!6466 index!984)))))

(declare-fun lt!288372 () Unit!20857)

(assert (=> b!622502 (= lt!288372 e!357061)))

(declare-fun c!71051 () Bool)

(assert (=> b!622502 (= c!71051 (= lt!288374 Undefined!6466))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!288368 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37653 (_ BitVec 32)) SeekEntryResult!6466)

(assert (=> b!622502 (= lt!288374 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!288368 lt!288376 mask!3053))))

(assert (=> b!622502 e!357062))

(declare-fun res!401137 () Bool)

(assert (=> b!622502 (=> (not res!401137) (not e!357062))))

(declare-fun lt!288361 () (_ BitVec 32))

(assert (=> b!622502 (= res!401137 (= lt!288375 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288361 vacantSpotIndex!68 lt!288368 lt!288376 mask!3053)))))

(assert (=> b!622502 (= lt!288375 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288361 vacantSpotIndex!68 (select (arr!18070 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!622502 (= lt!288368 (select (store (arr!18070 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!288366 () Unit!20857)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37653 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20857)

(assert (=> b!622502 (= lt!288366 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!288361 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!622502 (= lt!288361 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!622503 () Bool)

(declare-fun Unit!20863 () Unit!20857)

(assert (=> b!622503 (= e!357061 Unit!20863)))

(declare-fun b!622504 () Bool)

(declare-fun res!401138 () Bool)

(assert (=> b!622504 (= res!401138 (bvsge j!136 index!984))))

(assert (=> b!622504 (=> res!401138 e!357056)))

(assert (=> b!622504 (= e!357051 e!357056)))

(declare-fun b!622505 () Bool)

(assert (=> b!622505 (= e!357060 e!357052)))

(declare-fun res!401141 () Bool)

(assert (=> b!622505 (=> (not res!401141) (not e!357052))))

(declare-fun lt!288362 () SeekEntryResult!6466)

(assert (=> b!622505 (= res!401141 (or (= lt!288362 (MissingZero!6466 i!1108)) (= lt!288362 (MissingVacant!6466 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37653 (_ BitVec 32)) SeekEntryResult!6466)

(assert (=> b!622505 (= lt!288362 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!622506 () Bool)

(declare-fun res!401143 () Bool)

(assert (=> b!622506 (=> (not res!401143) (not e!357052))))

(assert (=> b!622506 (= res!401143 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18070 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!622507 () Bool)

(assert (=> b!622507 false))

(declare-fun lt!288371 () Unit!20857)

(declare-datatypes ((List!12018 0))(
  ( (Nil!12015) (Cons!12014 (h!13062 (_ BitVec 64)) (t!18238 List!12018)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37653 (_ BitVec 64) (_ BitVec 32) List!12018) Unit!20857)

(assert (=> b!622507 (= lt!288371 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288376 (select (arr!18070 a!2986) j!136) index!984 Nil!12015))))

(declare-fun arrayNoDuplicates!0 (array!37653 (_ BitVec 32) List!12018) Bool)

(assert (=> b!622507 (arrayNoDuplicates!0 lt!288376 index!984 Nil!12015)))

(declare-fun lt!288365 () Unit!20857)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37653 (_ BitVec 32) (_ BitVec 32)) Unit!20857)

(assert (=> b!622507 (= lt!288365 (lemmaNoDuplicateFromThenFromBigger!0 lt!288376 #b00000000000000000000000000000000 index!984))))

(assert (=> b!622507 (arrayNoDuplicates!0 lt!288376 #b00000000000000000000000000000000 Nil!12015)))

(declare-fun lt!288373 () Unit!20857)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37653 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12018) Unit!20857)

(assert (=> b!622507 (= lt!288373 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12015))))

(assert (=> b!622507 (arrayContainsKey!0 lt!288376 (select (arr!18070 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!288378 () Unit!20857)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37653 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20857)

(assert (=> b!622507 (= lt!288378 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288376 (select (arr!18070 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!622507 e!357053))

(declare-fun res!401140 () Bool)

(assert (=> b!622507 (=> (not res!401140) (not e!357053))))

(assert (=> b!622507 (= res!401140 (arrayContainsKey!0 lt!288376 (select (arr!18070 a!2986) j!136) j!136))))

(declare-fun Unit!20864 () Unit!20857)

(assert (=> b!622507 (= e!357057 Unit!20864)))

(declare-fun b!622508 () Bool)

(declare-fun e!357063 () Bool)

(assert (=> b!622508 (= e!357063 e!357050)))

(declare-fun res!401135 () Bool)

(assert (=> b!622508 (=> (not res!401135) (not e!357050))))

(assert (=> b!622508 (= res!401135 (and (= lt!288363 (Found!6466 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18070 a!2986) index!984) (select (arr!18070 a!2986) j!136))) (not (= (select (arr!18070 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!622508 (= lt!288363 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18070 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!622509 () Bool)

(declare-fun Unit!20865 () Unit!20857)

(assert (=> b!622509 (= e!357057 Unit!20865)))

(declare-fun b!622510 () Bool)

(assert (=> b!622510 false))

(declare-fun lt!288367 () Unit!20857)

(assert (=> b!622510 (= lt!288367 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288376 (select (arr!18070 a!2986) j!136) j!136 Nil!12015))))

(assert (=> b!622510 (arrayNoDuplicates!0 lt!288376 j!136 Nil!12015)))

(declare-fun lt!288364 () Unit!20857)

(assert (=> b!622510 (= lt!288364 (lemmaNoDuplicateFromThenFromBigger!0 lt!288376 #b00000000000000000000000000000000 j!136))))

(assert (=> b!622510 (arrayNoDuplicates!0 lt!288376 #b00000000000000000000000000000000 Nil!12015)))

(declare-fun lt!288369 () Unit!20857)

(assert (=> b!622510 (= lt!288369 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12015))))

(assert (=> b!622510 (arrayContainsKey!0 lt!288376 (select (arr!18070 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!288360 () Unit!20857)

(assert (=> b!622510 (= lt!288360 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288376 (select (arr!18070 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20866 () Unit!20857)

(assert (=> b!622510 (= e!357054 Unit!20866)))

(declare-fun b!622511 () Bool)

(assert (=> b!622511 (= e!357059 (arrayContainsKey!0 lt!288376 (select (arr!18070 a!2986) j!136) index!984))))

(declare-fun b!622512 () Bool)

(declare-fun res!401131 () Bool)

(assert (=> b!622512 (=> (not res!401131) (not e!357052))))

(assert (=> b!622512 (= res!401131 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12015))))

(declare-fun b!622513 () Bool)

(assert (=> b!622513 (= e!357052 e!357063)))

(declare-fun res!401145 () Bool)

(assert (=> b!622513 (=> (not res!401145) (not e!357063))))

(assert (=> b!622513 (= res!401145 (= (select (store (arr!18070 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!622513 (= lt!288376 (array!37654 (store (arr!18070 a!2986) i!1108 k0!1786) (size!18434 a!2986)))))

(assert (= (and start!56238 res!401139) b!622494))

(assert (= (and b!622494 res!401133) b!622490))

(assert (= (and b!622490 res!401132) b!622498))

(assert (= (and b!622498 res!401146) b!622492))

(assert (= (and b!622492 res!401144) b!622505))

(assert (= (and b!622505 res!401141) b!622501))

(assert (= (and b!622501 res!401136) b!622512))

(assert (= (and b!622512 res!401131) b!622506))

(assert (= (and b!622506 res!401143) b!622513))

(assert (= (and b!622513 res!401145) b!622508))

(assert (= (and b!622508 res!401135) b!622502))

(assert (= (and b!622502 res!401137) b!622491))

(assert (= (and b!622502 c!71051) b!622497))

(assert (= (and b!622502 (not c!71051)) b!622503))

(assert (= (and b!622502 c!71050) b!622499))

(assert (= (and b!622502 (not c!71050)) b!622493))

(assert (= (and b!622499 res!401142) b!622504))

(assert (= (and b!622504 (not res!401138)) b!622500))

(assert (= (and b!622500 res!401134) b!622511))

(assert (= (and b!622499 c!71049) b!622510))

(assert (= (and b!622499 (not c!71049)) b!622495))

(assert (= (and b!622499 c!71048) b!622507))

(assert (= (and b!622499 (not c!71048)) b!622509))

(assert (= (and b!622507 res!401140) b!622496))

(declare-fun m!598637 () Bool)

(assert (=> b!622510 m!598637))

(declare-fun m!598639 () Bool)

(assert (=> b!622510 m!598639))

(assert (=> b!622510 m!598637))

(declare-fun m!598641 () Bool)

(assert (=> b!622510 m!598641))

(declare-fun m!598643 () Bool)

(assert (=> b!622510 m!598643))

(assert (=> b!622510 m!598637))

(declare-fun m!598645 () Bool)

(assert (=> b!622510 m!598645))

(declare-fun m!598647 () Bool)

(assert (=> b!622510 m!598647))

(assert (=> b!622510 m!598637))

(declare-fun m!598649 () Bool)

(assert (=> b!622510 m!598649))

(declare-fun m!598651 () Bool)

(assert (=> b!622510 m!598651))

(declare-fun m!598653 () Bool)

(assert (=> b!622499 m!598653))

(declare-fun m!598655 () Bool)

(assert (=> b!622499 m!598655))

(assert (=> b!622499 m!598637))

(declare-fun m!598657 () Bool)

(assert (=> b!622492 m!598657))

(declare-fun m!598659 () Bool)

(assert (=> b!622498 m!598659))

(assert (=> b!622511 m!598637))

(assert (=> b!622511 m!598637))

(declare-fun m!598661 () Bool)

(assert (=> b!622511 m!598661))

(assert (=> b!622496 m!598637))

(assert (=> b!622496 m!598637))

(assert (=> b!622496 m!598661))

(declare-fun m!598663 () Bool)

(assert (=> start!56238 m!598663))

(declare-fun m!598665 () Bool)

(assert (=> start!56238 m!598665))

(declare-fun m!598667 () Bool)

(assert (=> b!622512 m!598667))

(declare-fun m!598669 () Bool)

(assert (=> b!622505 m!598669))

(declare-fun m!598671 () Bool)

(assert (=> b!622508 m!598671))

(assert (=> b!622508 m!598637))

(assert (=> b!622508 m!598637))

(declare-fun m!598673 () Bool)

(assert (=> b!622508 m!598673))

(declare-fun m!598675 () Bool)

(assert (=> b!622502 m!598675))

(declare-fun m!598677 () Bool)

(assert (=> b!622502 m!598677))

(assert (=> b!622502 m!598637))

(assert (=> b!622502 m!598653))

(assert (=> b!622502 m!598637))

(declare-fun m!598679 () Bool)

(assert (=> b!622502 m!598679))

(declare-fun m!598681 () Bool)

(assert (=> b!622502 m!598681))

(declare-fun m!598683 () Bool)

(assert (=> b!622502 m!598683))

(declare-fun m!598685 () Bool)

(assert (=> b!622502 m!598685))

(declare-fun m!598687 () Bool)

(assert (=> b!622501 m!598687))

(declare-fun m!598689 () Bool)

(assert (=> b!622506 m!598689))

(assert (=> b!622513 m!598653))

(declare-fun m!598691 () Bool)

(assert (=> b!622513 m!598691))

(assert (=> b!622490 m!598637))

(assert (=> b!622490 m!598637))

(declare-fun m!598693 () Bool)

(assert (=> b!622490 m!598693))

(assert (=> b!622507 m!598637))

(declare-fun m!598695 () Bool)

(assert (=> b!622507 m!598695))

(assert (=> b!622507 m!598637))

(assert (=> b!622507 m!598637))

(declare-fun m!598697 () Bool)

(assert (=> b!622507 m!598697))

(declare-fun m!598699 () Bool)

(assert (=> b!622507 m!598699))

(assert (=> b!622507 m!598647))

(declare-fun m!598701 () Bool)

(assert (=> b!622507 m!598701))

(assert (=> b!622507 m!598637))

(declare-fun m!598703 () Bool)

(assert (=> b!622507 m!598703))

(assert (=> b!622507 m!598637))

(declare-fun m!598705 () Bool)

(assert (=> b!622507 m!598705))

(assert (=> b!622507 m!598651))

(assert (=> b!622500 m!598637))

(assert (=> b!622500 m!598637))

(assert (=> b!622500 m!598697))

(check-sat (not start!56238) (not b!622502) (not b!622496) (not b!622505) (not b!622511) (not b!622501) (not b!622490) (not b!622507) (not b!622500) (not b!622492) (not b!622512) (not b!622498) (not b!622508) (not b!622510))
(check-sat)
