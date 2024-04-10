; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56002 () Bool)

(assert start!56002)

(declare-fun b!615432 () Bool)

(declare-fun e!352868 () Bool)

(declare-fun e!352862 () Bool)

(assert (=> b!615432 (= e!352868 e!352862)))

(declare-fun res!396411 () Bool)

(assert (=> b!615432 (=> (not res!396411) (not e!352862))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6422 0))(
  ( (MissingZero!6422 (index!27972 (_ BitVec 32))) (Found!6422 (index!27973 (_ BitVec 32))) (Intermediate!6422 (undefined!7234 Bool) (index!27974 (_ BitVec 32)) (x!56774 (_ BitVec 32))) (Undefined!6422) (MissingVacant!6422 (index!27975 (_ BitVec 32))) )
))
(declare-fun lt!282697 () SeekEntryResult!6422)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37472 0))(
  ( (array!37473 (arr!17982 (Array (_ BitVec 32) (_ BitVec 64))) (size!18346 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37472)

(assert (=> b!615432 (= res!396411 (and (= lt!282697 (Found!6422 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17982 a!2986) index!984) (select (arr!17982 a!2986) j!136))) (not (= (select (arr!17982 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37472 (_ BitVec 32)) SeekEntryResult!6422)

(assert (=> b!615432 (= lt!282697 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17982 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!615433 () Bool)

(declare-datatypes ((Unit!19948 0))(
  ( (Unit!19949) )
))
(declare-fun e!352866 () Unit!19948)

(declare-fun Unit!19950 () Unit!19948)

(assert (=> b!615433 (= e!352866 Unit!19950)))

(declare-fun res!396421 () Bool)

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!615433 (= res!396421 (= (select (store (arr!17982 a!2986) i!1108 k!1786) index!984) (select (arr!17982 a!2986) j!136)))))

(declare-fun e!352873 () Bool)

(assert (=> b!615433 (=> (not res!396421) (not e!352873))))

(assert (=> b!615433 e!352873))

(declare-fun c!69880 () Bool)

(assert (=> b!615433 (= c!69880 (bvslt j!136 index!984))))

(declare-fun lt!282678 () Unit!19948)

(declare-fun e!352874 () Unit!19948)

(assert (=> b!615433 (= lt!282678 e!352874)))

(declare-fun c!69879 () Bool)

(assert (=> b!615433 (= c!69879 (bvslt index!984 j!136))))

(declare-fun lt!282685 () Unit!19948)

(declare-fun e!352872 () Unit!19948)

(assert (=> b!615433 (= lt!282685 e!352872)))

(assert (=> b!615433 false))

(declare-fun b!615434 () Bool)

(declare-fun res!396414 () Bool)

(declare-fun e!352869 () Bool)

(assert (=> b!615434 (=> (not res!396414) (not e!352869))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!615434 (= res!396414 (validKeyInArray!0 (select (arr!17982 a!2986) j!136)))))

(declare-fun b!615435 () Bool)

(declare-fun Unit!19951 () Unit!19948)

(assert (=> b!615435 (= e!352866 Unit!19951)))

(declare-fun b!615436 () Bool)

(declare-fun res!396415 () Bool)

(assert (=> b!615436 (=> (not res!396415) (not e!352869))))

(assert (=> b!615436 (= res!396415 (and (= (size!18346 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18346 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18346 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!615437 () Bool)

(assert (=> b!615437 false))

(declare-fun lt!282693 () array!37472)

(declare-fun lt!282681 () Unit!19948)

(declare-datatypes ((List!12023 0))(
  ( (Nil!12020) (Cons!12019 (h!13064 (_ BitVec 64)) (t!18251 List!12023)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37472 (_ BitVec 64) (_ BitVec 32) List!12023) Unit!19948)

(assert (=> b!615437 (= lt!282681 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282693 (select (arr!17982 a!2986) j!136) j!136 Nil!12020))))

(declare-fun arrayNoDuplicates!0 (array!37472 (_ BitVec 32) List!12023) Bool)

(assert (=> b!615437 (arrayNoDuplicates!0 lt!282693 j!136 Nil!12020)))

(declare-fun lt!282694 () Unit!19948)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37472 (_ BitVec 32) (_ BitVec 32)) Unit!19948)

(assert (=> b!615437 (= lt!282694 (lemmaNoDuplicateFromThenFromBigger!0 lt!282693 #b00000000000000000000000000000000 j!136))))

(assert (=> b!615437 (arrayNoDuplicates!0 lt!282693 #b00000000000000000000000000000000 Nil!12020)))

(declare-fun lt!282683 () Unit!19948)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37472 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12023) Unit!19948)

(assert (=> b!615437 (= lt!282683 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12020))))

(declare-fun arrayContainsKey!0 (array!37472 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!615437 (arrayContainsKey!0 lt!282693 (select (arr!17982 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!282687 () Unit!19948)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37472 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19948)

(assert (=> b!615437 (= lt!282687 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282693 (select (arr!17982 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!19952 () Unit!19948)

(assert (=> b!615437 (= e!352874 Unit!19952)))

(declare-fun res!396422 () Bool)

(declare-fun b!615438 () Bool)

(assert (=> b!615438 (= res!396422 (arrayContainsKey!0 lt!282693 (select (arr!17982 a!2986) j!136) j!136))))

(declare-fun e!352867 () Bool)

(assert (=> b!615438 (=> (not res!396422) (not e!352867))))

(declare-fun e!352864 () Bool)

(assert (=> b!615438 (= e!352864 e!352867)))

(declare-fun b!615440 () Bool)

(declare-fun Unit!19953 () Unit!19948)

(assert (=> b!615440 (= e!352874 Unit!19953)))

(declare-fun b!615441 () Bool)

(declare-fun e!352865 () Unit!19948)

(declare-fun Unit!19954 () Unit!19948)

(assert (=> b!615441 (= e!352865 Unit!19954)))

(assert (=> b!615441 false))

(declare-fun b!615442 () Bool)

(declare-fun e!352863 () Bool)

(assert (=> b!615442 (= e!352863 e!352868)))

(declare-fun res!396412 () Bool)

(assert (=> b!615442 (=> (not res!396412) (not e!352868))))

(assert (=> b!615442 (= res!396412 (= (select (store (arr!17982 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!615442 (= lt!282693 (array!37473 (store (arr!17982 a!2986) i!1108 k!1786) (size!18346 a!2986)))))

(declare-fun b!615443 () Bool)

(declare-fun res!396423 () Bool)

(assert (=> b!615443 (=> (not res!396423) (not e!352863))))

(assert (=> b!615443 (= res!396423 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12020))))

(declare-fun b!615444 () Bool)

(assert (=> b!615444 (= e!352869 e!352863)))

(declare-fun res!396424 () Bool)

(assert (=> b!615444 (=> (not res!396424) (not e!352863))))

(declare-fun lt!282680 () SeekEntryResult!6422)

(assert (=> b!615444 (= res!396424 (or (= lt!282680 (MissingZero!6422 i!1108)) (= lt!282680 (MissingVacant!6422 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37472 (_ BitVec 32)) SeekEntryResult!6422)

(assert (=> b!615444 (= lt!282680 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!615445 () Bool)

(declare-fun Unit!19955 () Unit!19948)

(assert (=> b!615445 (= e!352872 Unit!19955)))

(declare-fun b!615446 () Bool)

(declare-fun res!396417 () Bool)

(assert (=> b!615446 (= res!396417 (bvsge j!136 index!984))))

(assert (=> b!615446 (=> res!396417 e!352864)))

(assert (=> b!615446 (= e!352873 e!352864)))

(declare-fun b!615447 () Bool)

(declare-fun res!396416 () Bool)

(assert (=> b!615447 (=> (not res!396416) (not e!352869))))

(assert (=> b!615447 (= res!396416 (validKeyInArray!0 k!1786))))

(declare-fun b!615448 () Bool)

(declare-fun e!352871 () Bool)

(declare-fun lt!282679 () SeekEntryResult!6422)

(assert (=> b!615448 (= e!352871 (= lt!282697 lt!282679))))

(declare-fun b!615449 () Bool)

(declare-fun Unit!19956 () Unit!19948)

(assert (=> b!615449 (= e!352865 Unit!19956)))

(declare-fun b!615450 () Bool)

(declare-fun res!396419 () Bool)

(assert (=> b!615450 (=> (not res!396419) (not e!352869))))

(assert (=> b!615450 (= res!396419 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!615451 () Bool)

(assert (=> b!615451 false))

(declare-fun lt!282688 () Unit!19948)

(assert (=> b!615451 (= lt!282688 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282693 (select (arr!17982 a!2986) j!136) index!984 Nil!12020))))

(assert (=> b!615451 (arrayNoDuplicates!0 lt!282693 index!984 Nil!12020)))

(declare-fun lt!282692 () Unit!19948)

(assert (=> b!615451 (= lt!282692 (lemmaNoDuplicateFromThenFromBigger!0 lt!282693 #b00000000000000000000000000000000 index!984))))

(assert (=> b!615451 (arrayNoDuplicates!0 lt!282693 #b00000000000000000000000000000000 Nil!12020)))

(declare-fun lt!282696 () Unit!19948)

(assert (=> b!615451 (= lt!282696 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12020))))

(assert (=> b!615451 (arrayContainsKey!0 lt!282693 (select (arr!17982 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!282682 () Unit!19948)

(assert (=> b!615451 (= lt!282682 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282693 (select (arr!17982 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!352870 () Bool)

(assert (=> b!615451 e!352870))

(declare-fun res!396410 () Bool)

(assert (=> b!615451 (=> (not res!396410) (not e!352870))))

(assert (=> b!615451 (= res!396410 (arrayContainsKey!0 lt!282693 (select (arr!17982 a!2986) j!136) j!136))))

(declare-fun Unit!19957 () Unit!19948)

(assert (=> b!615451 (= e!352872 Unit!19957)))

(declare-fun b!615452 () Bool)

(assert (=> b!615452 (= e!352870 (arrayContainsKey!0 lt!282693 (select (arr!17982 a!2986) j!136) index!984))))

(declare-fun b!615453 () Bool)

(declare-fun res!396420 () Bool)

(assert (=> b!615453 (=> (not res!396420) (not e!352863))))

(assert (=> b!615453 (= res!396420 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17982 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!396425 () Bool)

(assert (=> start!56002 (=> (not res!396425) (not e!352869))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56002 (= res!396425 (validMask!0 mask!3053))))

(assert (=> start!56002 e!352869))

(assert (=> start!56002 true))

(declare-fun array_inv!13778 (array!37472) Bool)

(assert (=> start!56002 (array_inv!13778 a!2986)))

(declare-fun b!615439 () Bool)

(declare-fun res!396418 () Bool)

(assert (=> b!615439 (=> (not res!396418) (not e!352863))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37472 (_ BitVec 32)) Bool)

(assert (=> b!615439 (= res!396418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!615454 () Bool)

(assert (=> b!615454 (= e!352867 (arrayContainsKey!0 lt!282693 (select (arr!17982 a!2986) j!136) index!984))))

(declare-fun b!615455 () Bool)

(assert (=> b!615455 (= e!352862 (not true))))

(declare-fun lt!282689 () Unit!19948)

(assert (=> b!615455 (= lt!282689 e!352866)))

(declare-fun c!69881 () Bool)

(declare-fun lt!282691 () SeekEntryResult!6422)

(assert (=> b!615455 (= c!69881 (= lt!282691 (Found!6422 index!984)))))

(declare-fun lt!282686 () Unit!19948)

(assert (=> b!615455 (= lt!282686 e!352865)))

(declare-fun c!69878 () Bool)

(assert (=> b!615455 (= c!69878 (= lt!282691 Undefined!6422))))

(declare-fun lt!282695 () (_ BitVec 64))

(assert (=> b!615455 (= lt!282691 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!282695 lt!282693 mask!3053))))

(assert (=> b!615455 e!352871))

(declare-fun res!396413 () Bool)

(assert (=> b!615455 (=> (not res!396413) (not e!352871))))

(declare-fun lt!282690 () (_ BitVec 32))

(assert (=> b!615455 (= res!396413 (= lt!282679 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282690 vacantSpotIndex!68 lt!282695 lt!282693 mask!3053)))))

(assert (=> b!615455 (= lt!282679 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282690 vacantSpotIndex!68 (select (arr!17982 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!615455 (= lt!282695 (select (store (arr!17982 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!282684 () Unit!19948)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37472 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19948)

(assert (=> b!615455 (= lt!282684 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!282690 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!615455 (= lt!282690 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!56002 res!396425) b!615436))

(assert (= (and b!615436 res!396415) b!615434))

(assert (= (and b!615434 res!396414) b!615447))

(assert (= (and b!615447 res!396416) b!615450))

(assert (= (and b!615450 res!396419) b!615444))

(assert (= (and b!615444 res!396424) b!615439))

(assert (= (and b!615439 res!396418) b!615443))

(assert (= (and b!615443 res!396423) b!615453))

(assert (= (and b!615453 res!396420) b!615442))

(assert (= (and b!615442 res!396412) b!615432))

(assert (= (and b!615432 res!396411) b!615455))

(assert (= (and b!615455 res!396413) b!615448))

(assert (= (and b!615455 c!69878) b!615441))

(assert (= (and b!615455 (not c!69878)) b!615449))

(assert (= (and b!615455 c!69881) b!615433))

(assert (= (and b!615455 (not c!69881)) b!615435))

(assert (= (and b!615433 res!396421) b!615446))

(assert (= (and b!615446 (not res!396417)) b!615438))

(assert (= (and b!615438 res!396422) b!615454))

(assert (= (and b!615433 c!69880) b!615437))

(assert (= (and b!615433 (not c!69880)) b!615440))

(assert (= (and b!615433 c!69879) b!615451))

(assert (= (and b!615433 (not c!69879)) b!615445))

(assert (= (and b!615451 res!396410) b!615452))

(declare-fun m!591635 () Bool)

(assert (=> b!615434 m!591635))

(assert (=> b!615434 m!591635))

(declare-fun m!591637 () Bool)

(assert (=> b!615434 m!591637))

(assert (=> b!615437 m!591635))

(declare-fun m!591639 () Bool)

(assert (=> b!615437 m!591639))

(declare-fun m!591641 () Bool)

(assert (=> b!615437 m!591641))

(assert (=> b!615437 m!591635))

(declare-fun m!591643 () Bool)

(assert (=> b!615437 m!591643))

(declare-fun m!591645 () Bool)

(assert (=> b!615437 m!591645))

(declare-fun m!591647 () Bool)

(assert (=> b!615437 m!591647))

(assert (=> b!615437 m!591635))

(declare-fun m!591649 () Bool)

(assert (=> b!615437 m!591649))

(assert (=> b!615437 m!591635))

(declare-fun m!591651 () Bool)

(assert (=> b!615437 m!591651))

(assert (=> b!615438 m!591635))

(assert (=> b!615438 m!591635))

(declare-fun m!591653 () Bool)

(assert (=> b!615438 m!591653))

(declare-fun m!591655 () Bool)

(assert (=> b!615453 m!591655))

(declare-fun m!591657 () Bool)

(assert (=> b!615450 m!591657))

(declare-fun m!591659 () Bool)

(assert (=> b!615432 m!591659))

(assert (=> b!615432 m!591635))

(assert (=> b!615432 m!591635))

(declare-fun m!591661 () Bool)

(assert (=> b!615432 m!591661))

(assert (=> b!615451 m!591635))

(assert (=> b!615451 m!591635))

(declare-fun m!591663 () Bool)

(assert (=> b!615451 m!591663))

(assert (=> b!615451 m!591635))

(assert (=> b!615451 m!591653))

(assert (=> b!615451 m!591641))

(assert (=> b!615451 m!591647))

(assert (=> b!615451 m!591635))

(declare-fun m!591665 () Bool)

(assert (=> b!615451 m!591665))

(declare-fun m!591667 () Bool)

(assert (=> b!615451 m!591667))

(declare-fun m!591669 () Bool)

(assert (=> b!615451 m!591669))

(assert (=> b!615451 m!591635))

(declare-fun m!591671 () Bool)

(assert (=> b!615451 m!591671))

(assert (=> b!615454 m!591635))

(assert (=> b!615454 m!591635))

(declare-fun m!591673 () Bool)

(assert (=> b!615454 m!591673))

(declare-fun m!591675 () Bool)

(assert (=> b!615444 m!591675))

(declare-fun m!591677 () Bool)

(assert (=> b!615455 m!591677))

(declare-fun m!591679 () Bool)

(assert (=> b!615455 m!591679))

(declare-fun m!591681 () Bool)

(assert (=> b!615455 m!591681))

(assert (=> b!615455 m!591635))

(declare-fun m!591683 () Bool)

(assert (=> b!615455 m!591683))

(declare-fun m!591685 () Bool)

(assert (=> b!615455 m!591685))

(assert (=> b!615455 m!591635))

(declare-fun m!591687 () Bool)

(assert (=> b!615455 m!591687))

(declare-fun m!591689 () Bool)

(assert (=> b!615455 m!591689))

(assert (=> b!615452 m!591635))

(assert (=> b!615452 m!591635))

(assert (=> b!615452 m!591673))

(declare-fun m!591691 () Bool)

(assert (=> b!615439 m!591691))

(declare-fun m!591693 () Bool)

(assert (=> start!56002 m!591693))

(declare-fun m!591695 () Bool)

(assert (=> start!56002 m!591695))

(declare-fun m!591697 () Bool)

(assert (=> b!615447 m!591697))

(assert (=> b!615442 m!591689))

(declare-fun m!591699 () Bool)

(assert (=> b!615442 m!591699))

(assert (=> b!615433 m!591689))

(declare-fun m!591701 () Bool)

(assert (=> b!615433 m!591701))

(assert (=> b!615433 m!591635))

(declare-fun m!591703 () Bool)

(assert (=> b!615443 m!591703))

(push 1)

