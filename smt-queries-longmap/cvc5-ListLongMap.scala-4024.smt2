; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54850 () Bool)

(assert start!54850)

(declare-fun b!599327 () Bool)

(declare-datatypes ((Unit!18886 0))(
  ( (Unit!18887) )
))
(declare-fun e!342642 () Unit!18886)

(declare-fun Unit!18888 () Unit!18886)

(assert (=> b!599327 (= e!342642 Unit!18888)))

(assert (=> b!599327 false))

(declare-fun b!599328 () Bool)

(declare-fun res!384328 () Bool)

(declare-fun e!342640 () Bool)

(assert (=> b!599328 (=> (not res!384328) (not e!342640))))

(declare-datatypes ((array!37085 0))(
  ( (array!37086 (arr!17802 (Array (_ BitVec 32) (_ BitVec 64))) (size!18166 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37085)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37085 (_ BitVec 32)) Bool)

(assert (=> b!599328 (= res!384328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!384322 () Bool)

(declare-fun e!342641 () Bool)

(assert (=> start!54850 (=> (not res!384322) (not e!342641))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54850 (= res!384322 (validMask!0 mask!3053))))

(assert (=> start!54850 e!342641))

(assert (=> start!54850 true))

(declare-fun array_inv!13598 (array!37085) Bool)

(assert (=> start!54850 (array_inv!13598 a!2986)))

(declare-fun b!599329 () Bool)

(declare-fun res!384318 () Bool)

(declare-fun e!342639 () Bool)

(assert (=> b!599329 (=> res!384318 e!342639)))

(declare-datatypes ((List!11843 0))(
  ( (Nil!11840) (Cons!11839 (h!12884 (_ BitVec 64)) (t!18071 List!11843)) )
))
(declare-fun contains!2959 (List!11843 (_ BitVec 64)) Bool)

(assert (=> b!599329 (= res!384318 (contains!2959 Nil!11840 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!599330 () Bool)

(declare-fun res!384332 () Bool)

(assert (=> b!599330 (=> (not res!384332) (not e!342641))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37085 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!599330 (= res!384332 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!599331 () Bool)

(declare-fun Unit!18889 () Unit!18886)

(assert (=> b!599331 (= e!342642 Unit!18889)))

(declare-fun b!599332 () Bool)

(declare-fun res!384316 () Bool)

(assert (=> b!599332 (=> (not res!384316) (not e!342641))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!599332 (= res!384316 (validKeyInArray!0 (select (arr!17802 a!2986) j!136)))))

(declare-fun b!599333 () Bool)

(declare-fun e!342643 () Bool)

(declare-datatypes ((SeekEntryResult!6242 0))(
  ( (MissingZero!6242 (index!27225 (_ BitVec 32))) (Found!6242 (index!27226 (_ BitVec 32))) (Intermediate!6242 (undefined!7054 Bool) (index!27227 (_ BitVec 32)) (x!56033 (_ BitVec 32))) (Undefined!6242) (MissingVacant!6242 (index!27228 (_ BitVec 32))) )
))
(declare-fun lt!272432 () SeekEntryResult!6242)

(declare-fun lt!272436 () SeekEntryResult!6242)

(assert (=> b!599333 (= e!342643 (= lt!272432 lt!272436))))

(declare-fun b!599334 () Bool)

(declare-fun res!384326 () Bool)

(assert (=> b!599334 (=> res!384326 e!342639)))

(declare-fun noDuplicate!276 (List!11843) Bool)

(assert (=> b!599334 (= res!384326 (not (noDuplicate!276 Nil!11840)))))

(declare-fun b!599335 () Bool)

(assert (=> b!599335 (= e!342641 e!342640)))

(declare-fun res!384331 () Bool)

(assert (=> b!599335 (=> (not res!384331) (not e!342640))))

(declare-fun lt!272426 () SeekEntryResult!6242)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!599335 (= res!384331 (or (= lt!272426 (MissingZero!6242 i!1108)) (= lt!272426 (MissingVacant!6242 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37085 (_ BitVec 32)) SeekEntryResult!6242)

(assert (=> b!599335 (= lt!272426 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun lt!272434 () array!37085)

(declare-fun b!599336 () Bool)

(declare-fun e!342646 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!599336 (= e!342646 (arrayContainsKey!0 lt!272434 (select (arr!17802 a!2986) j!136) index!984))))

(declare-fun b!599337 () Bool)

(declare-fun e!342637 () Bool)

(declare-fun e!342638 () Bool)

(assert (=> b!599337 (= e!342637 e!342638)))

(declare-fun res!384324 () Bool)

(assert (=> b!599337 (=> res!384324 e!342638)))

(declare-fun lt!272430 () (_ BitVec 64))

(declare-fun lt!272428 () (_ BitVec 64))

(assert (=> b!599337 (= res!384324 (or (not (= (select (arr!17802 a!2986) j!136) lt!272428)) (not (= (select (arr!17802 a!2986) j!136) lt!272430)) (bvsge j!136 index!984)))))

(declare-fun b!599338 () Bool)

(assert (=> b!599338 (= e!342639 true)))

(declare-fun lt!272435 () Bool)

(assert (=> b!599338 (= lt!272435 (contains!2959 Nil!11840 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!599339 () Bool)

(declare-fun res!384323 () Bool)

(assert (=> b!599339 (=> (not res!384323) (not e!342641))))

(assert (=> b!599339 (= res!384323 (and (= (size!18166 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18166 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18166 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!599340 () Bool)

(declare-fun e!342636 () Bool)

(assert (=> b!599340 (= e!342640 e!342636)))

(declare-fun res!384327 () Bool)

(assert (=> b!599340 (=> (not res!384327) (not e!342636))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!599340 (= res!384327 (= (select (store (arr!17802 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!599340 (= lt!272434 (array!37086 (store (arr!17802 a!2986) i!1108 k!1786) (size!18166 a!2986)))))

(declare-fun b!599341 () Bool)

(declare-fun e!342644 () Bool)

(declare-fun e!342648 () Bool)

(assert (=> b!599341 (= e!342644 e!342648)))

(declare-fun res!384325 () Bool)

(assert (=> b!599341 (=> res!384325 e!342648)))

(assert (=> b!599341 (= res!384325 (or (not (= (select (arr!17802 a!2986) j!136) lt!272428)) (not (= (select (arr!17802 a!2986) j!136) lt!272430)) (bvsge j!136 index!984)))))

(assert (=> b!599341 e!342637))

(declare-fun res!384321 () Bool)

(assert (=> b!599341 (=> (not res!384321) (not e!342637))))

(assert (=> b!599341 (= res!384321 (= lt!272430 (select (arr!17802 a!2986) j!136)))))

(assert (=> b!599341 (= lt!272430 (select (store (arr!17802 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!599342 () Bool)

(assert (=> b!599342 (= e!342648 e!342639)))

(declare-fun res!384314 () Bool)

(assert (=> b!599342 (=> res!384314 e!342639)))

(assert (=> b!599342 (= res!384314 (or (bvsge (size!18166 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18166 a!2986))))))

(declare-fun arrayNoDuplicates!0 (array!37085 (_ BitVec 32) List!11843) Bool)

(assert (=> b!599342 (arrayNoDuplicates!0 lt!272434 j!136 Nil!11840)))

(declare-fun lt!272429 () Unit!18886)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37085 (_ BitVec 32) (_ BitVec 32)) Unit!18886)

(assert (=> b!599342 (= lt!272429 (lemmaNoDuplicateFromThenFromBigger!0 lt!272434 #b00000000000000000000000000000000 j!136))))

(assert (=> b!599342 (arrayNoDuplicates!0 lt!272434 #b00000000000000000000000000000000 Nil!11840)))

(declare-fun lt!272425 () Unit!18886)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37085 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11843) Unit!18886)

(assert (=> b!599342 (= lt!272425 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11840))))

(assert (=> b!599342 (arrayContainsKey!0 lt!272434 (select (arr!17802 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272431 () Unit!18886)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37085 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18886)

(assert (=> b!599342 (= lt!272431 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272434 (select (arr!17802 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!599343 () Bool)

(declare-fun e!342647 () Bool)

(assert (=> b!599343 (= e!342647 (not e!342644))))

(declare-fun res!384313 () Bool)

(assert (=> b!599343 (=> res!384313 e!342644)))

(declare-fun lt!272427 () SeekEntryResult!6242)

(assert (=> b!599343 (= res!384313 (not (= lt!272427 (Found!6242 index!984))))))

(declare-fun lt!272424 () Unit!18886)

(assert (=> b!599343 (= lt!272424 e!342642)))

(declare-fun c!67874 () Bool)

(assert (=> b!599343 (= c!67874 (= lt!272427 Undefined!6242))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37085 (_ BitVec 32)) SeekEntryResult!6242)

(assert (=> b!599343 (= lt!272427 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272428 lt!272434 mask!3053))))

(assert (=> b!599343 e!342643))

(declare-fun res!384320 () Bool)

(assert (=> b!599343 (=> (not res!384320) (not e!342643))))

(declare-fun lt!272433 () (_ BitVec 32))

(assert (=> b!599343 (= res!384320 (= lt!272436 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272433 vacantSpotIndex!68 lt!272428 lt!272434 mask!3053)))))

(assert (=> b!599343 (= lt!272436 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272433 vacantSpotIndex!68 (select (arr!17802 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!599343 (= lt!272428 (select (store (arr!17802 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!272437 () Unit!18886)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37085 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18886)

(assert (=> b!599343 (= lt!272437 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272433 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!599343 (= lt!272433 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!599344 () Bool)

(assert (=> b!599344 (= e!342636 e!342647)))

(declare-fun res!384319 () Bool)

(assert (=> b!599344 (=> (not res!384319) (not e!342647))))

(assert (=> b!599344 (= res!384319 (and (= lt!272432 (Found!6242 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17802 a!2986) index!984) (select (arr!17802 a!2986) j!136))) (not (= (select (arr!17802 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!599344 (= lt!272432 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17802 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!599345 () Bool)

(declare-fun res!384330 () Bool)

(assert (=> b!599345 (=> (not res!384330) (not e!342641))))

(assert (=> b!599345 (= res!384330 (validKeyInArray!0 k!1786))))

(declare-fun b!599346 () Bool)

(declare-fun res!384329 () Bool)

(assert (=> b!599346 (=> (not res!384329) (not e!342640))))

(assert (=> b!599346 (= res!384329 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11840))))

(declare-fun b!599347 () Bool)

(assert (=> b!599347 (= e!342638 e!342646)))

(declare-fun res!384317 () Bool)

(assert (=> b!599347 (=> (not res!384317) (not e!342646))))

(assert (=> b!599347 (= res!384317 (arrayContainsKey!0 lt!272434 (select (arr!17802 a!2986) j!136) j!136))))

(declare-fun b!599348 () Bool)

(declare-fun res!384315 () Bool)

(assert (=> b!599348 (=> (not res!384315) (not e!342640))))

(assert (=> b!599348 (= res!384315 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17802 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!54850 res!384322) b!599339))

(assert (= (and b!599339 res!384323) b!599332))

(assert (= (and b!599332 res!384316) b!599345))

(assert (= (and b!599345 res!384330) b!599330))

(assert (= (and b!599330 res!384332) b!599335))

(assert (= (and b!599335 res!384331) b!599328))

(assert (= (and b!599328 res!384328) b!599346))

(assert (= (and b!599346 res!384329) b!599348))

(assert (= (and b!599348 res!384315) b!599340))

(assert (= (and b!599340 res!384327) b!599344))

(assert (= (and b!599344 res!384319) b!599343))

(assert (= (and b!599343 res!384320) b!599333))

(assert (= (and b!599343 c!67874) b!599327))

(assert (= (and b!599343 (not c!67874)) b!599331))

(assert (= (and b!599343 (not res!384313)) b!599341))

(assert (= (and b!599341 res!384321) b!599337))

(assert (= (and b!599337 (not res!384324)) b!599347))

(assert (= (and b!599347 res!384317) b!599336))

(assert (= (and b!599341 (not res!384325)) b!599342))

(assert (= (and b!599342 (not res!384314)) b!599334))

(assert (= (and b!599334 (not res!384326)) b!599329))

(assert (= (and b!599329 (not res!384318)) b!599338))

(declare-fun m!576581 () Bool)

(assert (=> b!599340 m!576581))

(declare-fun m!576583 () Bool)

(assert (=> b!599340 m!576583))

(declare-fun m!576585 () Bool)

(assert (=> b!599334 m!576585))

(declare-fun m!576587 () Bool)

(assert (=> b!599344 m!576587))

(declare-fun m!576589 () Bool)

(assert (=> b!599344 m!576589))

(assert (=> b!599344 m!576589))

(declare-fun m!576591 () Bool)

(assert (=> b!599344 m!576591))

(declare-fun m!576593 () Bool)

(assert (=> b!599343 m!576593))

(declare-fun m!576595 () Bool)

(assert (=> b!599343 m!576595))

(assert (=> b!599343 m!576589))

(declare-fun m!576597 () Bool)

(assert (=> b!599343 m!576597))

(assert (=> b!599343 m!576581))

(declare-fun m!576599 () Bool)

(assert (=> b!599343 m!576599))

(declare-fun m!576601 () Bool)

(assert (=> b!599343 m!576601))

(assert (=> b!599343 m!576589))

(declare-fun m!576603 () Bool)

(assert (=> b!599343 m!576603))

(assert (=> b!599337 m!576589))

(assert (=> b!599336 m!576589))

(assert (=> b!599336 m!576589))

(declare-fun m!576605 () Bool)

(assert (=> b!599336 m!576605))

(declare-fun m!576607 () Bool)

(assert (=> b!599338 m!576607))

(assert (=> b!599332 m!576589))

(assert (=> b!599332 m!576589))

(declare-fun m!576609 () Bool)

(assert (=> b!599332 m!576609))

(assert (=> b!599347 m!576589))

(assert (=> b!599347 m!576589))

(declare-fun m!576611 () Bool)

(assert (=> b!599347 m!576611))

(declare-fun m!576613 () Bool)

(assert (=> b!599330 m!576613))

(declare-fun m!576615 () Bool)

(assert (=> b!599346 m!576615))

(assert (=> b!599341 m!576589))

(assert (=> b!599341 m!576581))

(declare-fun m!576617 () Bool)

(assert (=> b!599341 m!576617))

(declare-fun m!576619 () Bool)

(assert (=> b!599348 m!576619))

(declare-fun m!576621 () Bool)

(assert (=> b!599328 m!576621))

(declare-fun m!576623 () Bool)

(assert (=> b!599342 m!576623))

(declare-fun m!576625 () Bool)

(assert (=> b!599342 m!576625))

(assert (=> b!599342 m!576589))

(assert (=> b!599342 m!576589))

(declare-fun m!576627 () Bool)

(assert (=> b!599342 m!576627))

(declare-fun m!576629 () Bool)

(assert (=> b!599342 m!576629))

(assert (=> b!599342 m!576589))

(declare-fun m!576631 () Bool)

(assert (=> b!599342 m!576631))

(declare-fun m!576633 () Bool)

(assert (=> b!599342 m!576633))

(declare-fun m!576635 () Bool)

(assert (=> b!599345 m!576635))

(declare-fun m!576637 () Bool)

(assert (=> b!599329 m!576637))

(declare-fun m!576639 () Bool)

(assert (=> start!54850 m!576639))

(declare-fun m!576641 () Bool)

(assert (=> start!54850 m!576641))

(declare-fun m!576643 () Bool)

(assert (=> b!599335 m!576643))

(push 1)

