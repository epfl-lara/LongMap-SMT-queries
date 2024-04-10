; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59566 () Bool)

(assert start!59566)

(declare-fun b!657629 () Bool)

(assert (=> b!657629 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((Unit!22744 0))(
  ( (Unit!22745) )
))
(declare-fun lt!307221 () Unit!22744)

(declare-datatypes ((array!38724 0))(
  ( (array!38725 (arr!18559 (Array (_ BitVec 32) (_ BitVec 64))) (size!18923 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38724)

(declare-fun lt!307216 () array!38724)

(declare-datatypes ((List!12600 0))(
  ( (Nil!12597) (Cons!12596 (h!13641 (_ BitVec 64)) (t!18828 List!12600)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38724 (_ BitVec 64) (_ BitVec 32) List!12600) Unit!22744)

(assert (=> b!657629 (= lt!307221 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307216 (select (arr!18559 a!2986) j!136) j!136 Nil!12597))))

(declare-fun arrayNoDuplicates!0 (array!38724 (_ BitVec 32) List!12600) Bool)

(assert (=> b!657629 (arrayNoDuplicates!0 lt!307216 j!136 Nil!12597)))

(declare-fun lt!307226 () Unit!22744)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38724 (_ BitVec 32) (_ BitVec 32)) Unit!22744)

(assert (=> b!657629 (= lt!307226 (lemmaNoDuplicateFromThenFromBigger!0 lt!307216 #b00000000000000000000000000000000 j!136))))

(assert (=> b!657629 (arrayNoDuplicates!0 lt!307216 #b00000000000000000000000000000000 Nil!12597)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!307224 () Unit!22744)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38724 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12600) Unit!22744)

(assert (=> b!657629 (= lt!307224 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12597))))

(declare-fun arrayContainsKey!0 (array!38724 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!657629 (arrayContainsKey!0 lt!307216 (select (arr!18559 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!307217 () Unit!22744)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38724 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22744)

(assert (=> b!657629 (= lt!307217 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307216 (select (arr!18559 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!377777 () Unit!22744)

(declare-fun Unit!22746 () Unit!22744)

(assert (=> b!657629 (= e!377777 Unit!22746)))

(declare-fun b!657630 () Bool)

(declare-fun res!426452 () Bool)

(assert (=> b!657630 (= res!426452 (bvsge j!136 index!984))))

(declare-fun e!377787 () Bool)

(assert (=> b!657630 (=> res!426452 e!377787)))

(declare-fun e!377779 () Bool)

(assert (=> b!657630 (= e!377779 e!377787)))

(declare-fun b!657631 () Bool)

(assert (=> b!657631 false))

(declare-fun lt!307220 () Unit!22744)

(assert (=> b!657631 (= lt!307220 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307216 (select (arr!18559 a!2986) j!136) index!984 Nil!12597))))

(assert (=> b!657631 (arrayNoDuplicates!0 lt!307216 index!984 Nil!12597)))

(declare-fun lt!307213 () Unit!22744)

(assert (=> b!657631 (= lt!307213 (lemmaNoDuplicateFromThenFromBigger!0 lt!307216 #b00000000000000000000000000000000 index!984))))

(assert (=> b!657631 (arrayNoDuplicates!0 lt!307216 #b00000000000000000000000000000000 Nil!12597)))

(declare-fun lt!307211 () Unit!22744)

(assert (=> b!657631 (= lt!307211 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12597))))

(assert (=> b!657631 (arrayContainsKey!0 lt!307216 (select (arr!18559 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!307219 () Unit!22744)

(assert (=> b!657631 (= lt!307219 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307216 (select (arr!18559 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!377775 () Bool)

(assert (=> b!657631 e!377775))

(declare-fun res!426455 () Bool)

(assert (=> b!657631 (=> (not res!426455) (not e!377775))))

(assert (=> b!657631 (= res!426455 (arrayContainsKey!0 lt!307216 (select (arr!18559 a!2986) j!136) j!136))))

(declare-fun e!377780 () Unit!22744)

(declare-fun Unit!22747 () Unit!22744)

(assert (=> b!657631 (= e!377780 Unit!22747)))

(declare-fun b!657632 () Bool)

(declare-fun res!426447 () Bool)

(declare-fun e!377785 () Bool)

(assert (=> b!657632 (=> (not res!426447) (not e!377785))))

(assert (=> b!657632 (= res!426447 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!657633 () Bool)

(declare-fun res!426449 () Bool)

(assert (=> b!657633 (=> (not res!426449) (not e!377785))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!657633 (= res!426449 (validKeyInArray!0 (select (arr!18559 a!2986) j!136)))))

(declare-fun b!657634 () Bool)

(declare-fun e!377786 () Bool)

(assert (=> b!657634 (= e!377786 true)))

(assert (=> b!657634 (= (select (store (arr!18559 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun res!426453 () Bool)

(declare-fun b!657635 () Bool)

(assert (=> b!657635 (= res!426453 (arrayContainsKey!0 lt!307216 (select (arr!18559 a!2986) j!136) j!136))))

(declare-fun e!377774 () Bool)

(assert (=> b!657635 (=> (not res!426453) (not e!377774))))

(assert (=> b!657635 (= e!377787 e!377774)))

(declare-fun b!657636 () Bool)

(declare-fun e!377783 () Unit!22744)

(declare-fun Unit!22748 () Unit!22744)

(assert (=> b!657636 (= e!377783 Unit!22748)))

(declare-fun b!657637 () Bool)

(declare-fun res!426457 () Bool)

(assert (=> b!657637 (=> (not res!426457) (not e!377785))))

(assert (=> b!657637 (= res!426457 (validKeyInArray!0 k0!1786))))

(declare-fun b!657638 () Bool)

(assert (=> b!657638 (= e!377775 (arrayContainsKey!0 lt!307216 (select (arr!18559 a!2986) j!136) index!984))))

(declare-fun b!657639 () Bool)

(declare-fun res!426445 () Bool)

(declare-fun e!377778 () Bool)

(assert (=> b!657639 (=> (not res!426445) (not e!377778))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38724 (_ BitVec 32)) Bool)

(assert (=> b!657639 (= res!426445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!657640 () Bool)

(declare-fun e!377782 () Bool)

(assert (=> b!657640 (= e!377782 (not e!377786))))

(declare-fun res!426450 () Bool)

(assert (=> b!657640 (=> res!426450 e!377786)))

(declare-datatypes ((SeekEntryResult!6999 0))(
  ( (MissingZero!6999 (index!30361 (_ BitVec 32))) (Found!6999 (index!30362 (_ BitVec 32))) (Intermediate!6999 (undefined!7811 Bool) (index!30363 (_ BitVec 32)) (x!59154 (_ BitVec 32))) (Undefined!6999) (MissingVacant!6999 (index!30364 (_ BitVec 32))) )
))
(declare-fun lt!307218 () SeekEntryResult!6999)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!657640 (= res!426450 (not (= lt!307218 (MissingVacant!6999 vacantSpotIndex!68))))))

(declare-fun lt!307228 () Unit!22744)

(assert (=> b!657640 (= lt!307228 e!377783)))

(declare-fun c!75962 () Bool)

(assert (=> b!657640 (= c!75962 (= lt!307218 (Found!6999 index!984)))))

(declare-fun lt!307209 () Unit!22744)

(declare-fun e!377781 () Unit!22744)

(assert (=> b!657640 (= lt!307209 e!377781)))

(declare-fun c!75959 () Bool)

(assert (=> b!657640 (= c!75959 (= lt!307218 Undefined!6999))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!307210 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38724 (_ BitVec 32)) SeekEntryResult!6999)

(assert (=> b!657640 (= lt!307218 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!307210 lt!307216 mask!3053))))

(declare-fun e!377784 () Bool)

(assert (=> b!657640 e!377784))

(declare-fun res!426461 () Bool)

(assert (=> b!657640 (=> (not res!426461) (not e!377784))))

(declare-fun lt!307227 () (_ BitVec 32))

(declare-fun lt!307225 () SeekEntryResult!6999)

(assert (=> b!657640 (= res!426461 (= lt!307225 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307227 vacantSpotIndex!68 lt!307210 lt!307216 mask!3053)))))

(assert (=> b!657640 (= lt!307225 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307227 vacantSpotIndex!68 (select (arr!18559 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!657640 (= lt!307210 (select (store (arr!18559 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!307215 () Unit!22744)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38724 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22744)

(assert (=> b!657640 (= lt!307215 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!307227 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!657640 (= lt!307227 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!657641 () Bool)

(assert (=> b!657641 (= e!377774 (arrayContainsKey!0 lt!307216 (select (arr!18559 a!2986) j!136) index!984))))

(declare-fun b!657642 () Bool)

(declare-fun e!377773 () Bool)

(assert (=> b!657642 (= e!377773 e!377782)))

(declare-fun res!426460 () Bool)

(assert (=> b!657642 (=> (not res!426460) (not e!377782))))

(declare-fun lt!307212 () SeekEntryResult!6999)

(assert (=> b!657642 (= res!426460 (and (= lt!307212 (Found!6999 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18559 a!2986) index!984) (select (arr!18559 a!2986) j!136))) (not (= (select (arr!18559 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!657642 (= lt!307212 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18559 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!657643 () Bool)

(assert (=> b!657643 (= e!377785 e!377778)))

(declare-fun res!426448 () Bool)

(assert (=> b!657643 (=> (not res!426448) (not e!377778))))

(declare-fun lt!307214 () SeekEntryResult!6999)

(assert (=> b!657643 (= res!426448 (or (= lt!307214 (MissingZero!6999 i!1108)) (= lt!307214 (MissingVacant!6999 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38724 (_ BitVec 32)) SeekEntryResult!6999)

(assert (=> b!657643 (= lt!307214 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!657644 () Bool)

(declare-fun res!426456 () Bool)

(assert (=> b!657644 (=> (not res!426456) (not e!377785))))

(assert (=> b!657644 (= res!426456 (and (= (size!18923 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18923 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18923 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!426446 () Bool)

(assert (=> start!59566 (=> (not res!426446) (not e!377785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59566 (= res!426446 (validMask!0 mask!3053))))

(assert (=> start!59566 e!377785))

(assert (=> start!59566 true))

(declare-fun array_inv!14355 (array!38724) Bool)

(assert (=> start!59566 (array_inv!14355 a!2986)))

(declare-fun b!657645 () Bool)

(declare-fun res!426451 () Bool)

(assert (=> b!657645 (=> (not res!426451) (not e!377778))))

(assert (=> b!657645 (= res!426451 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18559 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!657646 () Bool)

(declare-fun Unit!22749 () Unit!22744)

(assert (=> b!657646 (= e!377781 Unit!22749)))

(assert (=> b!657646 false))

(declare-fun b!657647 () Bool)

(declare-fun Unit!22750 () Unit!22744)

(assert (=> b!657647 (= e!377781 Unit!22750)))

(declare-fun b!657648 () Bool)

(assert (=> b!657648 (= e!377784 (= lt!307212 lt!307225))))

(declare-fun b!657649 () Bool)

(assert (=> b!657649 (= e!377778 e!377773)))

(declare-fun res!426454 () Bool)

(assert (=> b!657649 (=> (not res!426454) (not e!377773))))

(assert (=> b!657649 (= res!426454 (= (select (store (arr!18559 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!657649 (= lt!307216 (array!38725 (store (arr!18559 a!2986) i!1108 k0!1786) (size!18923 a!2986)))))

(declare-fun b!657650 () Bool)

(declare-fun res!426459 () Bool)

(assert (=> b!657650 (=> (not res!426459) (not e!377778))))

(assert (=> b!657650 (= res!426459 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12597))))

(declare-fun b!657651 () Bool)

(declare-fun Unit!22751 () Unit!22744)

(assert (=> b!657651 (= e!377783 Unit!22751)))

(declare-fun res!426458 () Bool)

(assert (=> b!657651 (= res!426458 (= (select (store (arr!18559 a!2986) i!1108 k0!1786) index!984) (select (arr!18559 a!2986) j!136)))))

(assert (=> b!657651 (=> (not res!426458) (not e!377779))))

(assert (=> b!657651 e!377779))

(declare-fun c!75960 () Bool)

(assert (=> b!657651 (= c!75960 (bvslt j!136 index!984))))

(declare-fun lt!307223 () Unit!22744)

(assert (=> b!657651 (= lt!307223 e!377777)))

(declare-fun c!75961 () Bool)

(assert (=> b!657651 (= c!75961 (bvslt index!984 j!136))))

(declare-fun lt!307222 () Unit!22744)

(assert (=> b!657651 (= lt!307222 e!377780)))

(assert (=> b!657651 false))

(declare-fun b!657652 () Bool)

(declare-fun Unit!22752 () Unit!22744)

(assert (=> b!657652 (= e!377780 Unit!22752)))

(declare-fun b!657653 () Bool)

(declare-fun Unit!22753 () Unit!22744)

(assert (=> b!657653 (= e!377777 Unit!22753)))

(assert (= (and start!59566 res!426446) b!657644))

(assert (= (and b!657644 res!426456) b!657633))

(assert (= (and b!657633 res!426449) b!657637))

(assert (= (and b!657637 res!426457) b!657632))

(assert (= (and b!657632 res!426447) b!657643))

(assert (= (and b!657643 res!426448) b!657639))

(assert (= (and b!657639 res!426445) b!657650))

(assert (= (and b!657650 res!426459) b!657645))

(assert (= (and b!657645 res!426451) b!657649))

(assert (= (and b!657649 res!426454) b!657642))

(assert (= (and b!657642 res!426460) b!657640))

(assert (= (and b!657640 res!426461) b!657648))

(assert (= (and b!657640 c!75959) b!657646))

(assert (= (and b!657640 (not c!75959)) b!657647))

(assert (= (and b!657640 c!75962) b!657651))

(assert (= (and b!657640 (not c!75962)) b!657636))

(assert (= (and b!657651 res!426458) b!657630))

(assert (= (and b!657630 (not res!426452)) b!657635))

(assert (= (and b!657635 res!426453) b!657641))

(assert (= (and b!657651 c!75960) b!657629))

(assert (= (and b!657651 (not c!75960)) b!657653))

(assert (= (and b!657651 c!75961) b!657631))

(assert (= (and b!657651 (not c!75961)) b!657652))

(assert (= (and b!657631 res!426455) b!657638))

(assert (= (and b!657640 (not res!426450)) b!657634))

(declare-fun m!630657 () Bool)

(assert (=> b!657634 m!630657))

(declare-fun m!630659 () Bool)

(assert (=> b!657634 m!630659))

(assert (=> b!657649 m!630657))

(declare-fun m!630661 () Bool)

(assert (=> b!657649 m!630661))

(declare-fun m!630663 () Bool)

(assert (=> b!657638 m!630663))

(assert (=> b!657638 m!630663))

(declare-fun m!630665 () Bool)

(assert (=> b!657638 m!630665))

(declare-fun m!630667 () Bool)

(assert (=> b!657639 m!630667))

(declare-fun m!630669 () Bool)

(assert (=> b!657642 m!630669))

(assert (=> b!657642 m!630663))

(assert (=> b!657642 m!630663))

(declare-fun m!630671 () Bool)

(assert (=> b!657642 m!630671))

(declare-fun m!630673 () Bool)

(assert (=> b!657640 m!630673))

(declare-fun m!630675 () Bool)

(assert (=> b!657640 m!630675))

(assert (=> b!657640 m!630663))

(assert (=> b!657640 m!630657))

(declare-fun m!630677 () Bool)

(assert (=> b!657640 m!630677))

(declare-fun m!630679 () Bool)

(assert (=> b!657640 m!630679))

(assert (=> b!657640 m!630663))

(declare-fun m!630681 () Bool)

(assert (=> b!657640 m!630681))

(declare-fun m!630683 () Bool)

(assert (=> b!657640 m!630683))

(declare-fun m!630685 () Bool)

(assert (=> b!657637 m!630685))

(declare-fun m!630687 () Bool)

(assert (=> b!657645 m!630687))

(declare-fun m!630689 () Bool)

(assert (=> b!657629 m!630689))

(assert (=> b!657629 m!630663))

(declare-fun m!630691 () Bool)

(assert (=> b!657629 m!630691))

(assert (=> b!657629 m!630663))

(assert (=> b!657629 m!630663))

(declare-fun m!630693 () Bool)

(assert (=> b!657629 m!630693))

(declare-fun m!630695 () Bool)

(assert (=> b!657629 m!630695))

(assert (=> b!657629 m!630663))

(declare-fun m!630697 () Bool)

(assert (=> b!657629 m!630697))

(declare-fun m!630699 () Bool)

(assert (=> b!657629 m!630699))

(declare-fun m!630701 () Bool)

(assert (=> b!657629 m!630701))

(assert (=> b!657633 m!630663))

(assert (=> b!657633 m!630663))

(declare-fun m!630703 () Bool)

(assert (=> b!657633 m!630703))

(declare-fun m!630705 () Bool)

(assert (=> start!59566 m!630705))

(declare-fun m!630707 () Bool)

(assert (=> start!59566 m!630707))

(assert (=> b!657641 m!630663))

(assert (=> b!657641 m!630663))

(assert (=> b!657641 m!630665))

(assert (=> b!657651 m!630657))

(assert (=> b!657651 m!630659))

(assert (=> b!657651 m!630663))

(declare-fun m!630709 () Bool)

(assert (=> b!657632 m!630709))

(assert (=> b!657635 m!630663))

(assert (=> b!657635 m!630663))

(declare-fun m!630711 () Bool)

(assert (=> b!657635 m!630711))

(assert (=> b!657631 m!630663))

(declare-fun m!630713 () Bool)

(assert (=> b!657631 m!630713))

(assert (=> b!657631 m!630663))

(declare-fun m!630715 () Bool)

(assert (=> b!657631 m!630715))

(assert (=> b!657631 m!630663))

(assert (=> b!657631 m!630663))

(declare-fun m!630717 () Bool)

(assert (=> b!657631 m!630717))

(assert (=> b!657631 m!630663))

(assert (=> b!657631 m!630711))

(declare-fun m!630719 () Bool)

(assert (=> b!657631 m!630719))

(assert (=> b!657631 m!630701))

(assert (=> b!657631 m!630699))

(declare-fun m!630721 () Bool)

(assert (=> b!657631 m!630721))

(declare-fun m!630723 () Bool)

(assert (=> b!657643 m!630723))

(declare-fun m!630725 () Bool)

(assert (=> b!657650 m!630725))

(check-sat (not b!657631) (not b!657629) (not b!657633) (not b!657639) (not b!657642) (not b!657643) (not b!657637) (not b!657640) (not b!657650) (not b!657638) (not b!657641) (not b!657635) (not b!657632) (not start!59566))
(check-sat)
