; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56170 () Bool)

(assert start!56170)

(declare-fun b!621633 () Bool)

(declare-datatypes ((Unit!20788 0))(
  ( (Unit!20789) )
))
(declare-fun e!356547 () Unit!20788)

(declare-fun Unit!20790 () Unit!20788)

(assert (=> b!621633 (= e!356547 Unit!20790)))

(assert (=> b!621633 false))

(declare-fun b!621634 () Bool)

(declare-fun e!356555 () Bool)

(declare-fun e!356556 () Bool)

(assert (=> b!621634 (= e!356555 e!356556)))

(declare-fun res!400596 () Bool)

(assert (=> b!621634 (=> (not res!400596) (not e!356556))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37640 0))(
  ( (array!37641 (arr!18066 (Array (_ BitVec 32) (_ BitVec 64))) (size!18430 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37640)

(assert (=> b!621634 (= res!400596 (= (select (store (arr!18066 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!287735 () array!37640)

(assert (=> b!621634 (= lt!287735 (array!37641 (store (arr!18066 a!2986) i!1108 k!1786) (size!18430 a!2986)))))

(declare-fun b!621635 () Bool)

(declare-fun e!356550 () Unit!20788)

(declare-fun Unit!20791 () Unit!20788)

(assert (=> b!621635 (= e!356550 Unit!20791)))

(declare-fun res!400610 () Bool)

(declare-fun e!356543 () Bool)

(assert (=> start!56170 (=> (not res!400610) (not e!356543))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56170 (= res!400610 (validMask!0 mask!3053))))

(assert (=> start!56170 e!356543))

(assert (=> start!56170 true))

(declare-fun array_inv!13862 (array!37640) Bool)

(assert (=> start!56170 (array_inv!13862 a!2986)))

(declare-fun b!621636 () Bool)

(declare-fun res!400608 () Bool)

(assert (=> b!621636 (=> (not res!400608) (not e!356555))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!621636 (= res!400608 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18066 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!621637 () Bool)

(declare-fun e!356545 () Bool)

(assert (=> b!621637 (= e!356545 (not true))))

(declare-fun lt!287727 () Unit!20788)

(assert (=> b!621637 (= lt!287727 e!356550)))

(declare-fun c!70886 () Bool)

(declare-datatypes ((SeekEntryResult!6506 0))(
  ( (MissingZero!6506 (index!28308 (_ BitVec 32))) (Found!6506 (index!28309 (_ BitVec 32))) (Intermediate!6506 (undefined!7318 Bool) (index!28310 (_ BitVec 32)) (x!57082 (_ BitVec 32))) (Undefined!6506) (MissingVacant!6506 (index!28311 (_ BitVec 32))) )
))
(declare-fun lt!287729 () SeekEntryResult!6506)

(assert (=> b!621637 (= c!70886 (= lt!287729 (Found!6506 index!984)))))

(declare-fun lt!287733 () Unit!20788)

(assert (=> b!621637 (= lt!287733 e!356547)))

(declare-fun c!70889 () Bool)

(assert (=> b!621637 (= c!70889 (= lt!287729 Undefined!6506))))

(declare-fun lt!287737 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37640 (_ BitVec 32)) SeekEntryResult!6506)

(assert (=> b!621637 (= lt!287729 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!287737 lt!287735 mask!3053))))

(declare-fun e!356554 () Bool)

(assert (=> b!621637 e!356554))

(declare-fun res!400609 () Bool)

(assert (=> b!621637 (=> (not res!400609) (not e!356554))))

(declare-fun lt!287730 () (_ BitVec 32))

(declare-fun lt!287722 () SeekEntryResult!6506)

(assert (=> b!621637 (= res!400609 (= lt!287722 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287730 vacantSpotIndex!68 lt!287737 lt!287735 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!621637 (= lt!287722 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287730 vacantSpotIndex!68 (select (arr!18066 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!621637 (= lt!287737 (select (store (arr!18066 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!287736 () Unit!20788)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37640 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20788)

(assert (=> b!621637 (= lt!287736 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!287730 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!621637 (= lt!287730 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!621638 () Bool)

(assert (=> b!621638 (= e!356556 e!356545)))

(declare-fun res!400599 () Bool)

(assert (=> b!621638 (=> (not res!400599) (not e!356545))))

(declare-fun lt!287731 () SeekEntryResult!6506)

(assert (=> b!621638 (= res!400599 (and (= lt!287731 (Found!6506 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18066 a!2986) index!984) (select (arr!18066 a!2986) j!136))) (not (= (select (arr!18066 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!621638 (= lt!287731 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18066 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!621639 () Bool)

(declare-fun res!400606 () Bool)

(assert (=> b!621639 (=> (not res!400606) (not e!356543))))

(assert (=> b!621639 (= res!400606 (and (= (size!18430 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18430 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18430 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!621640 () Bool)

(declare-fun res!400598 () Bool)

(assert (=> b!621640 (=> (not res!400598) (not e!356543))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!621640 (= res!400598 (validKeyInArray!0 (select (arr!18066 a!2986) j!136)))))

(declare-fun b!621641 () Bool)

(declare-fun e!356546 () Unit!20788)

(declare-fun Unit!20792 () Unit!20788)

(assert (=> b!621641 (= e!356546 Unit!20792)))

(declare-fun b!621642 () Bool)

(declare-fun Unit!20793 () Unit!20788)

(assert (=> b!621642 (= e!356547 Unit!20793)))

(declare-fun b!621643 () Bool)

(declare-fun res!400607 () Bool)

(assert (=> b!621643 (= res!400607 (bvsge j!136 index!984))))

(declare-fun e!356551 () Bool)

(assert (=> b!621643 (=> res!400607 e!356551)))

(declare-fun e!356549 () Bool)

(assert (=> b!621643 (= e!356549 e!356551)))

(declare-fun b!621644 () Bool)

(declare-fun Unit!20794 () Unit!20788)

(assert (=> b!621644 (= e!356550 Unit!20794)))

(declare-fun res!400605 () Bool)

(assert (=> b!621644 (= res!400605 (= (select (store (arr!18066 a!2986) i!1108 k!1786) index!984) (select (arr!18066 a!2986) j!136)))))

(assert (=> b!621644 (=> (not res!400605) (not e!356549))))

(assert (=> b!621644 e!356549))

(declare-fun c!70887 () Bool)

(assert (=> b!621644 (= c!70887 (bvslt j!136 index!984))))

(declare-fun lt!287734 () Unit!20788)

(declare-fun e!356544 () Unit!20788)

(assert (=> b!621644 (= lt!287734 e!356544)))

(declare-fun c!70888 () Bool)

(assert (=> b!621644 (= c!70888 (bvslt index!984 j!136))))

(declare-fun lt!287723 () Unit!20788)

(assert (=> b!621644 (= lt!287723 e!356546)))

(assert (=> b!621644 false))

(declare-fun b!621645 () Bool)

(assert (=> b!621645 (= e!356543 e!356555)))

(declare-fun res!400602 () Bool)

(assert (=> b!621645 (=> (not res!400602) (not e!356555))))

(declare-fun lt!287725 () SeekEntryResult!6506)

(assert (=> b!621645 (= res!400602 (or (= lt!287725 (MissingZero!6506 i!1108)) (= lt!287725 (MissingVacant!6506 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37640 (_ BitVec 32)) SeekEntryResult!6506)

(assert (=> b!621645 (= lt!287725 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!621646 () Bool)

(declare-fun Unit!20795 () Unit!20788)

(assert (=> b!621646 (= e!356544 Unit!20795)))

(declare-fun b!621647 () Bool)

(declare-fun e!356553 () Bool)

(declare-fun arrayContainsKey!0 (array!37640 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!621647 (= e!356553 (arrayContainsKey!0 lt!287735 (select (arr!18066 a!2986) j!136) index!984))))

(declare-fun b!621648 () Bool)

(declare-fun res!400600 () Bool)

(assert (=> b!621648 (=> (not res!400600) (not e!356555))))

(declare-datatypes ((List!12107 0))(
  ( (Nil!12104) (Cons!12103 (h!13148 (_ BitVec 64)) (t!18335 List!12107)) )
))
(declare-fun arrayNoDuplicates!0 (array!37640 (_ BitVec 32) List!12107) Bool)

(assert (=> b!621648 (= res!400600 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12104))))

(declare-fun b!621649 () Bool)

(declare-fun e!356552 () Bool)

(assert (=> b!621649 (= e!356552 (arrayContainsKey!0 lt!287735 (select (arr!18066 a!2986) j!136) index!984))))

(declare-fun b!621650 () Bool)

(declare-fun res!400601 () Bool)

(assert (=> b!621650 (=> (not res!400601) (not e!356543))))

(assert (=> b!621650 (= res!400601 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!621651 () Bool)

(declare-fun res!400597 () Bool)

(assert (=> b!621651 (= res!400597 (arrayContainsKey!0 lt!287735 (select (arr!18066 a!2986) j!136) j!136))))

(assert (=> b!621651 (=> (not res!400597) (not e!356553))))

(assert (=> b!621651 (= e!356551 e!356553)))

(declare-fun b!621652 () Bool)

(assert (=> b!621652 (= e!356554 (= lt!287731 lt!287722))))

(declare-fun b!621653 () Bool)

(declare-fun res!400604 () Bool)

(assert (=> b!621653 (=> (not res!400604) (not e!356543))))

(assert (=> b!621653 (= res!400604 (validKeyInArray!0 k!1786))))

(declare-fun b!621654 () Bool)

(assert (=> b!621654 false))

(declare-fun lt!287720 () Unit!20788)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37640 (_ BitVec 64) (_ BitVec 32) List!12107) Unit!20788)

(assert (=> b!621654 (= lt!287720 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287735 (select (arr!18066 a!2986) j!136) index!984 Nil!12104))))

(assert (=> b!621654 (arrayNoDuplicates!0 lt!287735 index!984 Nil!12104)))

(declare-fun lt!287728 () Unit!20788)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37640 (_ BitVec 32) (_ BitVec 32)) Unit!20788)

(assert (=> b!621654 (= lt!287728 (lemmaNoDuplicateFromThenFromBigger!0 lt!287735 #b00000000000000000000000000000000 index!984))))

(assert (=> b!621654 (arrayNoDuplicates!0 lt!287735 #b00000000000000000000000000000000 Nil!12104)))

(declare-fun lt!287721 () Unit!20788)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37640 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12107) Unit!20788)

(assert (=> b!621654 (= lt!287721 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12104))))

(assert (=> b!621654 (arrayContainsKey!0 lt!287735 (select (arr!18066 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!287724 () Unit!20788)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37640 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20788)

(assert (=> b!621654 (= lt!287724 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287735 (select (arr!18066 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!621654 e!356552))

(declare-fun res!400603 () Bool)

(assert (=> b!621654 (=> (not res!400603) (not e!356552))))

(assert (=> b!621654 (= res!400603 (arrayContainsKey!0 lt!287735 (select (arr!18066 a!2986) j!136) j!136))))

(declare-fun Unit!20796 () Unit!20788)

(assert (=> b!621654 (= e!356546 Unit!20796)))

(declare-fun b!621655 () Bool)

(declare-fun res!400595 () Bool)

(assert (=> b!621655 (=> (not res!400595) (not e!356555))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37640 (_ BitVec 32)) Bool)

(assert (=> b!621655 (= res!400595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!621656 () Bool)

(assert (=> b!621656 false))

(declare-fun lt!287718 () Unit!20788)

(assert (=> b!621656 (= lt!287718 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287735 (select (arr!18066 a!2986) j!136) j!136 Nil!12104))))

(assert (=> b!621656 (arrayNoDuplicates!0 lt!287735 j!136 Nil!12104)))

(declare-fun lt!287719 () Unit!20788)

(assert (=> b!621656 (= lt!287719 (lemmaNoDuplicateFromThenFromBigger!0 lt!287735 #b00000000000000000000000000000000 j!136))))

(assert (=> b!621656 (arrayNoDuplicates!0 lt!287735 #b00000000000000000000000000000000 Nil!12104)))

(declare-fun lt!287732 () Unit!20788)

(assert (=> b!621656 (= lt!287732 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12104))))

(assert (=> b!621656 (arrayContainsKey!0 lt!287735 (select (arr!18066 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!287726 () Unit!20788)

(assert (=> b!621656 (= lt!287726 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287735 (select (arr!18066 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20797 () Unit!20788)

(assert (=> b!621656 (= e!356544 Unit!20797)))

(assert (= (and start!56170 res!400610) b!621639))

(assert (= (and b!621639 res!400606) b!621640))

(assert (= (and b!621640 res!400598) b!621653))

(assert (= (and b!621653 res!400604) b!621650))

(assert (= (and b!621650 res!400601) b!621645))

(assert (= (and b!621645 res!400602) b!621655))

(assert (= (and b!621655 res!400595) b!621648))

(assert (= (and b!621648 res!400600) b!621636))

(assert (= (and b!621636 res!400608) b!621634))

(assert (= (and b!621634 res!400596) b!621638))

(assert (= (and b!621638 res!400599) b!621637))

(assert (= (and b!621637 res!400609) b!621652))

(assert (= (and b!621637 c!70889) b!621633))

(assert (= (and b!621637 (not c!70889)) b!621642))

(assert (= (and b!621637 c!70886) b!621644))

(assert (= (and b!621637 (not c!70886)) b!621635))

(assert (= (and b!621644 res!400605) b!621643))

(assert (= (and b!621643 (not res!400607)) b!621651))

(assert (= (and b!621651 res!400597) b!621647))

(assert (= (and b!621644 c!70887) b!621656))

(assert (= (and b!621644 (not c!70887)) b!621646))

(assert (= (and b!621644 c!70888) b!621654))

(assert (= (and b!621644 (not c!70888)) b!621641))

(assert (= (and b!621654 res!400603) b!621649))

(declare-fun m!597521 () Bool)

(assert (=> b!621655 m!597521))

(declare-fun m!597523 () Bool)

(assert (=> b!621645 m!597523))

(declare-fun m!597525 () Bool)

(assert (=> b!621638 m!597525))

(declare-fun m!597527 () Bool)

(assert (=> b!621638 m!597527))

(assert (=> b!621638 m!597527))

(declare-fun m!597529 () Bool)

(assert (=> b!621638 m!597529))

(assert (=> b!621651 m!597527))

(assert (=> b!621651 m!597527))

(declare-fun m!597531 () Bool)

(assert (=> b!621651 m!597531))

(declare-fun m!597533 () Bool)

(assert (=> b!621636 m!597533))

(assert (=> b!621647 m!597527))

(assert (=> b!621647 m!597527))

(declare-fun m!597535 () Bool)

(assert (=> b!621647 m!597535))

(declare-fun m!597537 () Bool)

(assert (=> b!621644 m!597537))

(declare-fun m!597539 () Bool)

(assert (=> b!621644 m!597539))

(assert (=> b!621644 m!597527))

(assert (=> b!621654 m!597527))

(declare-fun m!597541 () Bool)

(assert (=> b!621654 m!597541))

(assert (=> b!621654 m!597527))

(declare-fun m!597543 () Bool)

(assert (=> b!621654 m!597543))

(declare-fun m!597545 () Bool)

(assert (=> b!621654 m!597545))

(assert (=> b!621654 m!597527))

(assert (=> b!621654 m!597531))

(declare-fun m!597547 () Bool)

(assert (=> b!621654 m!597547))

(declare-fun m!597549 () Bool)

(assert (=> b!621654 m!597549))

(declare-fun m!597551 () Bool)

(assert (=> b!621654 m!597551))

(assert (=> b!621654 m!597527))

(declare-fun m!597553 () Bool)

(assert (=> b!621654 m!597553))

(assert (=> b!621654 m!597527))

(assert (=> b!621634 m!597537))

(declare-fun m!597555 () Bool)

(assert (=> b!621634 m!597555))

(declare-fun m!597557 () Bool)

(assert (=> b!621637 m!597557))

(assert (=> b!621637 m!597527))

(assert (=> b!621637 m!597537))

(declare-fun m!597559 () Bool)

(assert (=> b!621637 m!597559))

(declare-fun m!597561 () Bool)

(assert (=> b!621637 m!597561))

(declare-fun m!597563 () Bool)

(assert (=> b!621637 m!597563))

(declare-fun m!597565 () Bool)

(assert (=> b!621637 m!597565))

(assert (=> b!621637 m!597527))

(declare-fun m!597567 () Bool)

(assert (=> b!621637 m!597567))

(assert (=> b!621649 m!597527))

(assert (=> b!621649 m!597527))

(assert (=> b!621649 m!597535))

(declare-fun m!597569 () Bool)

(assert (=> b!621648 m!597569))

(declare-fun m!597571 () Bool)

(assert (=> b!621653 m!597571))

(declare-fun m!597573 () Bool)

(assert (=> start!56170 m!597573))

(declare-fun m!597575 () Bool)

(assert (=> start!56170 m!597575))

(declare-fun m!597577 () Bool)

(assert (=> b!621650 m!597577))

(assert (=> b!621640 m!597527))

(assert (=> b!621640 m!597527))

(declare-fun m!597579 () Bool)

(assert (=> b!621640 m!597579))

(declare-fun m!597581 () Bool)

(assert (=> b!621656 m!597581))

(declare-fun m!597583 () Bool)

(assert (=> b!621656 m!597583))

(assert (=> b!621656 m!597527))

(declare-fun m!597585 () Bool)

(assert (=> b!621656 m!597585))

(assert (=> b!621656 m!597547))

(assert (=> b!621656 m!597527))

(assert (=> b!621656 m!597527))

(declare-fun m!597587 () Bool)

(assert (=> b!621656 m!597587))

(assert (=> b!621656 m!597527))

(declare-fun m!597589 () Bool)

(assert (=> b!621656 m!597589))

(assert (=> b!621656 m!597551))

(push 1)

