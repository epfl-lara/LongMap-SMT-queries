; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56208 () Bool)

(assert start!56208)

(declare-fun b!621410 () Bool)

(declare-fun e!356429 () Bool)

(declare-fun e!356425 () Bool)

(assert (=> b!621410 (= e!356429 e!356425)))

(declare-fun res!400419 () Bool)

(assert (=> b!621410 (=> (not res!400419) (not e!356425))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37623 0))(
  ( (array!37624 (arr!18055 (Array (_ BitVec 32) (_ BitVec 64))) (size!18419 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37623)

(assert (=> b!621410 (= res!400419 (= (select (store (arr!18055 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!287473 () array!37623)

(assert (=> b!621410 (= lt!287473 (array!37624 (store (arr!18055 a!2986) i!1108 k0!1786) (size!18419 a!2986)))))

(declare-fun b!621411 () Bool)

(declare-fun res!400417 () Bool)

(declare-fun e!356421 () Bool)

(assert (=> b!621411 (=> (not res!400417) (not e!356421))))

(declare-fun arrayContainsKey!0 (array!37623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!621411 (= res!400417 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!621413 () Bool)

(declare-datatypes ((Unit!20707 0))(
  ( (Unit!20708) )
))
(declare-fun e!356432 () Unit!20707)

(declare-fun Unit!20709 () Unit!20707)

(assert (=> b!621413 (= e!356432 Unit!20709)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun res!400415 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!621413 (= res!400415 (= (select (store (arr!18055 a!2986) i!1108 k0!1786) index!984) (select (arr!18055 a!2986) j!136)))))

(declare-fun e!356427 () Bool)

(assert (=> b!621413 (=> (not res!400415) (not e!356427))))

(assert (=> b!621413 e!356427))

(declare-fun c!70869 () Bool)

(assert (=> b!621413 (= c!70869 (bvslt j!136 index!984))))

(declare-fun lt!287472 () Unit!20707)

(declare-fun e!356422 () Unit!20707)

(assert (=> b!621413 (= lt!287472 e!356422)))

(declare-fun c!70868 () Bool)

(assert (=> b!621413 (= c!70868 (bvslt index!984 j!136))))

(declare-fun lt!287462 () Unit!20707)

(declare-fun e!356423 () Unit!20707)

(assert (=> b!621413 (= lt!287462 e!356423)))

(assert (=> b!621413 false))

(declare-fun b!621414 () Bool)

(declare-fun res!400423 () Bool)

(assert (=> b!621414 (=> (not res!400423) (not e!356421))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!621414 (= res!400423 (validKeyInArray!0 k0!1786))))

(declare-fun b!621415 () Bool)

(assert (=> b!621415 false))

(declare-fun lt!287474 () Unit!20707)

(declare-datatypes ((List!12003 0))(
  ( (Nil!12000) (Cons!11999 (h!13047 (_ BitVec 64)) (t!18223 List!12003)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37623 (_ BitVec 64) (_ BitVec 32) List!12003) Unit!20707)

(assert (=> b!621415 (= lt!287474 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287473 (select (arr!18055 a!2986) j!136) index!984 Nil!12000))))

(declare-fun arrayNoDuplicates!0 (array!37623 (_ BitVec 32) List!12003) Bool)

(assert (=> b!621415 (arrayNoDuplicates!0 lt!287473 index!984 Nil!12000)))

(declare-fun lt!287464 () Unit!20707)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37623 (_ BitVec 32) (_ BitVec 32)) Unit!20707)

(assert (=> b!621415 (= lt!287464 (lemmaNoDuplicateFromThenFromBigger!0 lt!287473 #b00000000000000000000000000000000 index!984))))

(assert (=> b!621415 (arrayNoDuplicates!0 lt!287473 #b00000000000000000000000000000000 Nil!12000)))

(declare-fun lt!287461 () Unit!20707)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37623 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12003) Unit!20707)

(assert (=> b!621415 (= lt!287461 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12000))))

(assert (=> b!621415 (arrayContainsKey!0 lt!287473 (select (arr!18055 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!287460 () Unit!20707)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37623 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20707)

(assert (=> b!621415 (= lt!287460 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287473 (select (arr!18055 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!356420 () Bool)

(assert (=> b!621415 e!356420))

(declare-fun res!400416 () Bool)

(assert (=> b!621415 (=> (not res!400416) (not e!356420))))

(assert (=> b!621415 (= res!400416 (arrayContainsKey!0 lt!287473 (select (arr!18055 a!2986) j!136) j!136))))

(declare-fun Unit!20710 () Unit!20707)

(assert (=> b!621415 (= e!356423 Unit!20710)))

(declare-fun b!621416 () Bool)

(declare-fun e!356428 () Bool)

(assert (=> b!621416 (= e!356428 (not true))))

(declare-fun lt!287466 () Unit!20707)

(assert (=> b!621416 (= lt!287466 e!356432)))

(declare-fun c!70871 () Bool)

(declare-datatypes ((SeekEntryResult!6451 0))(
  ( (MissingZero!6451 (index!28088 (_ BitVec 32))) (Found!6451 (index!28089 (_ BitVec 32))) (Intermediate!6451 (undefined!7263 Bool) (index!28090 (_ BitVec 32)) (x!57014 (_ BitVec 32))) (Undefined!6451) (MissingVacant!6451 (index!28091 (_ BitVec 32))) )
))
(declare-fun lt!287467 () SeekEntryResult!6451)

(assert (=> b!621416 (= c!70871 (= lt!287467 (Found!6451 index!984)))))

(declare-fun lt!287468 () Unit!20707)

(declare-fun e!356424 () Unit!20707)

(assert (=> b!621416 (= lt!287468 e!356424)))

(declare-fun c!70870 () Bool)

(assert (=> b!621416 (= c!70870 (= lt!287467 Undefined!6451))))

(declare-fun lt!287470 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37623 (_ BitVec 32)) SeekEntryResult!6451)

(assert (=> b!621416 (= lt!287467 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!287470 lt!287473 mask!3053))))

(declare-fun e!356426 () Bool)

(assert (=> b!621416 e!356426))

(declare-fun res!400411 () Bool)

(assert (=> b!621416 (=> (not res!400411) (not e!356426))))

(declare-fun lt!287475 () SeekEntryResult!6451)

(declare-fun lt!287469 () (_ BitVec 32))

(assert (=> b!621416 (= res!400411 (= lt!287475 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287469 vacantSpotIndex!68 lt!287470 lt!287473 mask!3053)))))

(assert (=> b!621416 (= lt!287475 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287469 vacantSpotIndex!68 (select (arr!18055 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!621416 (= lt!287470 (select (store (arr!18055 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!287471 () Unit!20707)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37623 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20707)

(assert (=> b!621416 (= lt!287471 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!287469 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!621416 (= lt!287469 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!621417 () Bool)

(declare-fun res!400426 () Bool)

(assert (=> b!621417 (=> (not res!400426) (not e!356429))))

(assert (=> b!621417 (= res!400426 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18055 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!356430 () Bool)

(declare-fun b!621418 () Bool)

(assert (=> b!621418 (= e!356430 (arrayContainsKey!0 lt!287473 (select (arr!18055 a!2986) j!136) index!984))))

(declare-fun b!621419 () Bool)

(declare-fun res!400413 () Bool)

(assert (=> b!621419 (=> (not res!400413) (not e!356421))))

(assert (=> b!621419 (= res!400413 (validKeyInArray!0 (select (arr!18055 a!2986) j!136)))))

(declare-fun b!621420 () Bool)

(declare-fun res!400422 () Bool)

(assert (=> b!621420 (= res!400422 (bvsge j!136 index!984))))

(declare-fun e!356433 () Bool)

(assert (=> b!621420 (=> res!400422 e!356433)))

(assert (=> b!621420 (= e!356427 e!356433)))

(declare-fun b!621421 () Bool)

(declare-fun Unit!20711 () Unit!20707)

(assert (=> b!621421 (= e!356432 Unit!20711)))

(declare-fun b!621422 () Bool)

(declare-fun Unit!20712 () Unit!20707)

(assert (=> b!621422 (= e!356424 Unit!20712)))

(declare-fun b!621423 () Bool)

(assert (=> b!621423 (= e!356425 e!356428)))

(declare-fun res!400421 () Bool)

(assert (=> b!621423 (=> (not res!400421) (not e!356428))))

(declare-fun lt!287477 () SeekEntryResult!6451)

(assert (=> b!621423 (= res!400421 (and (= lt!287477 (Found!6451 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18055 a!2986) index!984) (select (arr!18055 a!2986) j!136))) (not (= (select (arr!18055 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!621423 (= lt!287477 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18055 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!621424 () Bool)

(declare-fun res!400412 () Bool)

(assert (=> b!621424 (=> (not res!400412) (not e!356421))))

(assert (=> b!621424 (= res!400412 (and (= (size!18419 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18419 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18419 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!621425 () Bool)

(assert (=> b!621425 (= e!356421 e!356429)))

(declare-fun res!400425 () Bool)

(assert (=> b!621425 (=> (not res!400425) (not e!356429))))

(declare-fun lt!287465 () SeekEntryResult!6451)

(assert (=> b!621425 (= res!400425 (or (= lt!287465 (MissingZero!6451 i!1108)) (= lt!287465 (MissingVacant!6451 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37623 (_ BitVec 32)) SeekEntryResult!6451)

(assert (=> b!621425 (= lt!287465 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!621426 () Bool)

(declare-fun Unit!20713 () Unit!20707)

(assert (=> b!621426 (= e!356422 Unit!20713)))

(declare-fun res!400414 () Bool)

(assert (=> start!56208 (=> (not res!400414) (not e!356421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56208 (= res!400414 (validMask!0 mask!3053))))

(assert (=> start!56208 e!356421))

(assert (=> start!56208 true))

(declare-fun array_inv!13914 (array!37623) Bool)

(assert (=> start!56208 (array_inv!13914 a!2986)))

(declare-fun b!621412 () Bool)

(declare-fun Unit!20714 () Unit!20707)

(assert (=> b!621412 (= e!356424 Unit!20714)))

(assert (=> b!621412 false))

(declare-fun b!621427 () Bool)

(assert (=> b!621427 (= e!356426 (= lt!287477 lt!287475))))

(declare-fun b!621428 () Bool)

(declare-fun res!400424 () Bool)

(assert (=> b!621428 (=> (not res!400424) (not e!356429))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37623 (_ BitVec 32)) Bool)

(assert (=> b!621428 (= res!400424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!621429 () Bool)

(declare-fun Unit!20715 () Unit!20707)

(assert (=> b!621429 (= e!356423 Unit!20715)))

(declare-fun b!621430 () Bool)

(declare-fun res!400418 () Bool)

(assert (=> b!621430 (=> (not res!400418) (not e!356429))))

(assert (=> b!621430 (= res!400418 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12000))))

(declare-fun res!400420 () Bool)

(declare-fun b!621431 () Bool)

(assert (=> b!621431 (= res!400420 (arrayContainsKey!0 lt!287473 (select (arr!18055 a!2986) j!136) j!136))))

(assert (=> b!621431 (=> (not res!400420) (not e!356430))))

(assert (=> b!621431 (= e!356433 e!356430)))

(declare-fun b!621432 () Bool)

(assert (=> b!621432 (= e!356420 (arrayContainsKey!0 lt!287473 (select (arr!18055 a!2986) j!136) index!984))))

(declare-fun b!621433 () Bool)

(assert (=> b!621433 false))

(declare-fun lt!287476 () Unit!20707)

(assert (=> b!621433 (= lt!287476 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287473 (select (arr!18055 a!2986) j!136) j!136 Nil!12000))))

(assert (=> b!621433 (arrayNoDuplicates!0 lt!287473 j!136 Nil!12000)))

(declare-fun lt!287479 () Unit!20707)

(assert (=> b!621433 (= lt!287479 (lemmaNoDuplicateFromThenFromBigger!0 lt!287473 #b00000000000000000000000000000000 j!136))))

(assert (=> b!621433 (arrayNoDuplicates!0 lt!287473 #b00000000000000000000000000000000 Nil!12000)))

(declare-fun lt!287463 () Unit!20707)

(assert (=> b!621433 (= lt!287463 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12000))))

(assert (=> b!621433 (arrayContainsKey!0 lt!287473 (select (arr!18055 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!287478 () Unit!20707)

(assert (=> b!621433 (= lt!287478 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287473 (select (arr!18055 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20716 () Unit!20707)

(assert (=> b!621433 (= e!356422 Unit!20716)))

(assert (= (and start!56208 res!400414) b!621424))

(assert (= (and b!621424 res!400412) b!621419))

(assert (= (and b!621419 res!400413) b!621414))

(assert (= (and b!621414 res!400423) b!621411))

(assert (= (and b!621411 res!400417) b!621425))

(assert (= (and b!621425 res!400425) b!621428))

(assert (= (and b!621428 res!400424) b!621430))

(assert (= (and b!621430 res!400418) b!621417))

(assert (= (and b!621417 res!400426) b!621410))

(assert (= (and b!621410 res!400419) b!621423))

(assert (= (and b!621423 res!400421) b!621416))

(assert (= (and b!621416 res!400411) b!621427))

(assert (= (and b!621416 c!70870) b!621412))

(assert (= (and b!621416 (not c!70870)) b!621422))

(assert (= (and b!621416 c!70871) b!621413))

(assert (= (and b!621416 (not c!70871)) b!621421))

(assert (= (and b!621413 res!400415) b!621420))

(assert (= (and b!621420 (not res!400422)) b!621431))

(assert (= (and b!621431 res!400420) b!621418))

(assert (= (and b!621413 c!70869) b!621433))

(assert (= (and b!621413 (not c!70869)) b!621426))

(assert (= (and b!621413 c!70868) b!621415))

(assert (= (and b!621413 (not c!70868)) b!621429))

(assert (= (and b!621415 res!400416) b!621432))

(declare-fun m!597587 () Bool)

(assert (=> b!621413 m!597587))

(declare-fun m!597589 () Bool)

(assert (=> b!621413 m!597589))

(declare-fun m!597591 () Bool)

(assert (=> b!621413 m!597591))

(assert (=> b!621418 m!597591))

(assert (=> b!621418 m!597591))

(declare-fun m!597593 () Bool)

(assert (=> b!621418 m!597593))

(assert (=> b!621431 m!597591))

(assert (=> b!621431 m!597591))

(declare-fun m!597595 () Bool)

(assert (=> b!621431 m!597595))

(declare-fun m!597597 () Bool)

(assert (=> b!621425 m!597597))

(assert (=> b!621432 m!597591))

(assert (=> b!621432 m!597591))

(assert (=> b!621432 m!597593))

(assert (=> b!621419 m!597591))

(assert (=> b!621419 m!597591))

(declare-fun m!597599 () Bool)

(assert (=> b!621419 m!597599))

(assert (=> b!621410 m!597587))

(declare-fun m!597601 () Bool)

(assert (=> b!621410 m!597601))

(declare-fun m!597603 () Bool)

(assert (=> b!621411 m!597603))

(declare-fun m!597605 () Bool)

(assert (=> b!621428 m!597605))

(declare-fun m!597607 () Bool)

(assert (=> b!621416 m!597607))

(declare-fun m!597609 () Bool)

(assert (=> b!621416 m!597609))

(assert (=> b!621416 m!597591))

(declare-fun m!597611 () Bool)

(assert (=> b!621416 m!597611))

(assert (=> b!621416 m!597587))

(declare-fun m!597613 () Bool)

(assert (=> b!621416 m!597613))

(declare-fun m!597615 () Bool)

(assert (=> b!621416 m!597615))

(assert (=> b!621416 m!597591))

(declare-fun m!597617 () Bool)

(assert (=> b!621416 m!597617))

(declare-fun m!597619 () Bool)

(assert (=> b!621414 m!597619))

(declare-fun m!597621 () Bool)

(assert (=> b!621417 m!597621))

(assert (=> b!621415 m!597591))

(assert (=> b!621415 m!597591))

(declare-fun m!597623 () Bool)

(assert (=> b!621415 m!597623))

(declare-fun m!597625 () Bool)

(assert (=> b!621415 m!597625))

(assert (=> b!621415 m!597591))

(declare-fun m!597627 () Bool)

(assert (=> b!621415 m!597627))

(assert (=> b!621415 m!597591))

(declare-fun m!597629 () Bool)

(assert (=> b!621415 m!597629))

(declare-fun m!597631 () Bool)

(assert (=> b!621415 m!597631))

(declare-fun m!597633 () Bool)

(assert (=> b!621415 m!597633))

(assert (=> b!621415 m!597591))

(assert (=> b!621415 m!597595))

(declare-fun m!597635 () Bool)

(assert (=> b!621415 m!597635))

(declare-fun m!597637 () Bool)

(assert (=> b!621433 m!597637))

(assert (=> b!621433 m!597591))

(assert (=> b!621433 m!597591))

(declare-fun m!597639 () Bool)

(assert (=> b!621433 m!597639))

(declare-fun m!597641 () Bool)

(assert (=> b!621433 m!597641))

(assert (=> b!621433 m!597631))

(assert (=> b!621433 m!597633))

(assert (=> b!621433 m!597591))

(declare-fun m!597643 () Bool)

(assert (=> b!621433 m!597643))

(assert (=> b!621433 m!597591))

(declare-fun m!597645 () Bool)

(assert (=> b!621433 m!597645))

(declare-fun m!597647 () Bool)

(assert (=> b!621430 m!597647))

(declare-fun m!597649 () Bool)

(assert (=> start!56208 m!597649))

(declare-fun m!597651 () Bool)

(assert (=> start!56208 m!597651))

(declare-fun m!597653 () Bool)

(assert (=> b!621423 m!597653))

(assert (=> b!621423 m!597591))

(assert (=> b!621423 m!597591))

(declare-fun m!597655 () Bool)

(assert (=> b!621423 m!597655))

(check-sat (not b!621431) (not b!621423) (not b!621418) (not b!621414) (not b!621428) (not b!621432) (not start!56208) (not b!621419) (not b!621430) (not b!621411) (not b!621433) (not b!621416) (not b!621425) (not b!621415))
(check-sat)
