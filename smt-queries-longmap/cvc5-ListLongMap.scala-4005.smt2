; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54502 () Bool)

(assert start!54502)

(declare-fun b!594688 () Bool)

(declare-fun e!339785 () Bool)

(declare-fun e!339780 () Bool)

(assert (=> b!594688 (= e!339785 e!339780)))

(declare-fun res!380634 () Bool)

(assert (=> b!594688 (=> (not res!380634) (not e!339780))))

(declare-datatypes ((SeekEntryResult!6185 0))(
  ( (MissingZero!6185 (index!26988 (_ BitVec 32))) (Found!6185 (index!26989 (_ BitVec 32))) (Intermediate!6185 (undefined!6997 Bool) (index!26990 (_ BitVec 32)) (x!55797 (_ BitVec 32))) (Undefined!6185) (MissingVacant!6185 (index!26991 (_ BitVec 32))) )
))
(declare-fun lt!269983 () SeekEntryResult!6185)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!594688 (= res!380634 (or (= lt!269983 (MissingZero!6185 i!1108)) (= lt!269983 (MissingVacant!6185 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36962 0))(
  ( (array!36963 (arr!17745 (Array (_ BitVec 32) (_ BitVec 64))) (size!18109 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36962)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36962 (_ BitVec 32)) SeekEntryResult!6185)

(assert (=> b!594688 (= lt!269983 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!594689 () Bool)

(declare-fun e!339784 () Bool)

(declare-fun e!339786 () Bool)

(assert (=> b!594689 (= e!339784 (not e!339786))))

(declare-fun res!380638 () Bool)

(assert (=> b!594689 (=> res!380638 e!339786)))

(declare-fun lt!269979 () SeekEntryResult!6185)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!594689 (= res!380638 (not (= lt!269979 (Found!6185 index!984))))))

(declare-datatypes ((Unit!18658 0))(
  ( (Unit!18659) )
))
(declare-fun lt!269981 () Unit!18658)

(declare-fun e!339781 () Unit!18658)

(assert (=> b!594689 (= lt!269981 e!339781)))

(declare-fun c!67397 () Bool)

(assert (=> b!594689 (= c!67397 (= lt!269979 Undefined!6185))))

(declare-fun lt!269978 () (_ BitVec 64))

(declare-fun lt!269985 () array!36962)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36962 (_ BitVec 32)) SeekEntryResult!6185)

(assert (=> b!594689 (= lt!269979 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!269978 lt!269985 mask!3053))))

(declare-fun e!339788 () Bool)

(assert (=> b!594689 e!339788))

(declare-fun res!380630 () Bool)

(assert (=> b!594689 (=> (not res!380630) (not e!339788))))

(declare-fun lt!269986 () (_ BitVec 32))

(declare-fun lt!269982 () SeekEntryResult!6185)

(assert (=> b!594689 (= res!380630 (= lt!269982 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269986 vacantSpotIndex!68 lt!269978 lt!269985 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!594689 (= lt!269982 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269986 vacantSpotIndex!68 (select (arr!17745 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!594689 (= lt!269978 (select (store (arr!17745 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!269980 () Unit!18658)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36962 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18658)

(assert (=> b!594689 (= lt!269980 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269986 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!594689 (= lt!269986 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!594690 () Bool)

(declare-fun res!380645 () Bool)

(assert (=> b!594690 (=> (not res!380645) (not e!339780))))

(declare-datatypes ((List!11786 0))(
  ( (Nil!11783) (Cons!11782 (h!12827 (_ BitVec 64)) (t!18014 List!11786)) )
))
(declare-fun arrayNoDuplicates!0 (array!36962 (_ BitVec 32) List!11786) Bool)

(assert (=> b!594690 (= res!380645 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11783))))

(declare-fun b!594691 () Bool)

(declare-fun res!380637 () Bool)

(assert (=> b!594691 (=> (not res!380637) (not e!339785))))

(declare-fun arrayContainsKey!0 (array!36962 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!594691 (= res!380637 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!594692 () Bool)

(declare-fun Unit!18660 () Unit!18658)

(assert (=> b!594692 (= e!339781 Unit!18660)))

(assert (=> b!594692 false))

(declare-fun b!594693 () Bool)

(declare-fun res!380646 () Bool)

(assert (=> b!594693 (=> (not res!380646) (not e!339785))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!594693 (= res!380646 (validKeyInArray!0 k!1786))))

(declare-fun b!594694 () Bool)

(declare-fun e!339779 () Bool)

(declare-fun e!339787 () Bool)

(assert (=> b!594694 (= e!339779 e!339787)))

(declare-fun res!380631 () Bool)

(assert (=> b!594694 (=> res!380631 e!339787)))

(declare-fun lt!269989 () (_ BitVec 64))

(assert (=> b!594694 (= res!380631 (or (not (= (select (arr!17745 a!2986) j!136) lt!269978)) (not (= (select (arr!17745 a!2986) j!136) lt!269989)) (bvsge j!136 index!984)))))

(declare-fun b!594695 () Bool)

(declare-fun res!380628 () Bool)

(assert (=> b!594695 (=> (not res!380628) (not e!339785))))

(assert (=> b!594695 (= res!380628 (and (= (size!18109 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18109 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18109 a!2986)) (not (= i!1108 j!136))))))

(declare-fun e!339783 () Bool)

(declare-fun b!594696 () Bool)

(assert (=> b!594696 (= e!339783 (arrayContainsKey!0 lt!269985 (select (arr!17745 a!2986) j!136) index!984))))

(declare-fun res!380644 () Bool)

(assert (=> start!54502 (=> (not res!380644) (not e!339785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54502 (= res!380644 (validMask!0 mask!3053))))

(assert (=> start!54502 e!339785))

(assert (=> start!54502 true))

(declare-fun array_inv!13541 (array!36962) Bool)

(assert (=> start!54502 (array_inv!13541 a!2986)))

(declare-fun b!594697 () Bool)

(declare-fun res!380648 () Bool)

(declare-fun e!339782 () Bool)

(assert (=> b!594697 (=> res!380648 e!339782)))

(declare-fun noDuplicate!240 (List!11786) Bool)

(assert (=> b!594697 (= res!380648 (not (noDuplicate!240 Nil!11783)))))

(declare-fun b!594698 () Bool)

(declare-fun res!380640 () Bool)

(assert (=> b!594698 (=> (not res!380640) (not e!339780))))

(assert (=> b!594698 (= res!380640 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17745 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!594699 () Bool)

(declare-fun e!339789 () Bool)

(assert (=> b!594699 (= e!339786 e!339789)))

(declare-fun res!380639 () Bool)

(assert (=> b!594699 (=> res!380639 e!339789)))

(assert (=> b!594699 (= res!380639 (or (not (= (select (arr!17745 a!2986) j!136) lt!269978)) (not (= (select (arr!17745 a!2986) j!136) lt!269989)) (bvsge j!136 index!984)))))

(assert (=> b!594699 e!339779))

(declare-fun res!380635 () Bool)

(assert (=> b!594699 (=> (not res!380635) (not e!339779))))

(assert (=> b!594699 (= res!380635 (= lt!269989 (select (arr!17745 a!2986) j!136)))))

(assert (=> b!594699 (= lt!269989 (select (store (arr!17745 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!594700 () Bool)

(declare-fun Unit!18661 () Unit!18658)

(assert (=> b!594700 (= e!339781 Unit!18661)))

(declare-fun b!594701 () Bool)

(declare-fun res!380647 () Bool)

(assert (=> b!594701 (=> res!380647 e!339782)))

(declare-fun contains!2921 (List!11786 (_ BitVec 64)) Bool)

(assert (=> b!594701 (= res!380647 (contains!2921 Nil!11783 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!594702 () Bool)

(assert (=> b!594702 (= e!339787 e!339783)))

(declare-fun res!380632 () Bool)

(assert (=> b!594702 (=> (not res!380632) (not e!339783))))

(assert (=> b!594702 (= res!380632 (arrayContainsKey!0 lt!269985 (select (arr!17745 a!2986) j!136) j!136))))

(declare-fun b!594703 () Bool)

(declare-fun lt!269987 () SeekEntryResult!6185)

(assert (=> b!594703 (= e!339788 (= lt!269987 lt!269982))))

(declare-fun b!594704 () Bool)

(declare-fun res!380633 () Bool)

(assert (=> b!594704 (=> (not res!380633) (not e!339785))))

(assert (=> b!594704 (= res!380633 (validKeyInArray!0 (select (arr!17745 a!2986) j!136)))))

(declare-fun b!594705 () Bool)

(assert (=> b!594705 (= e!339782 true)))

(declare-fun lt!269988 () Bool)

(assert (=> b!594705 (= lt!269988 (contains!2921 Nil!11783 k!1786))))

(declare-fun b!594706 () Bool)

(declare-fun e!339777 () Bool)

(assert (=> b!594706 (= e!339780 e!339777)))

(declare-fun res!380636 () Bool)

(assert (=> b!594706 (=> (not res!380636) (not e!339777))))

(assert (=> b!594706 (= res!380636 (= (select (store (arr!17745 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!594706 (= lt!269985 (array!36963 (store (arr!17745 a!2986) i!1108 k!1786) (size!18109 a!2986)))))

(declare-fun b!594707 () Bool)

(assert (=> b!594707 (= e!339777 e!339784)))

(declare-fun res!380643 () Bool)

(assert (=> b!594707 (=> (not res!380643) (not e!339784))))

(assert (=> b!594707 (= res!380643 (and (= lt!269987 (Found!6185 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17745 a!2986) index!984) (select (arr!17745 a!2986) j!136))) (not (= (select (arr!17745 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!594707 (= lt!269987 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17745 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!594708 () Bool)

(declare-fun res!380641 () Bool)

(assert (=> b!594708 (=> (not res!380641) (not e!339780))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36962 (_ BitVec 32)) Bool)

(assert (=> b!594708 (= res!380641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!594709 () Bool)

(declare-fun res!380642 () Bool)

(assert (=> b!594709 (=> res!380642 e!339782)))

(assert (=> b!594709 (= res!380642 (contains!2921 Nil!11783 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!594710 () Bool)

(assert (=> b!594710 (= e!339789 e!339782)))

(declare-fun res!380629 () Bool)

(assert (=> b!594710 (=> res!380629 e!339782)))

(assert (=> b!594710 (= res!380629 (or (bvsge (size!18109 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18109 a!2986))))))

(assert (=> b!594710 (arrayContainsKey!0 lt!269985 (select (arr!17745 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269984 () Unit!18658)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36962 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18658)

(assert (=> b!594710 (= lt!269984 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269985 (select (arr!17745 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (= (and start!54502 res!380644) b!594695))

(assert (= (and b!594695 res!380628) b!594704))

(assert (= (and b!594704 res!380633) b!594693))

(assert (= (and b!594693 res!380646) b!594691))

(assert (= (and b!594691 res!380637) b!594688))

(assert (= (and b!594688 res!380634) b!594708))

(assert (= (and b!594708 res!380641) b!594690))

(assert (= (and b!594690 res!380645) b!594698))

(assert (= (and b!594698 res!380640) b!594706))

(assert (= (and b!594706 res!380636) b!594707))

(assert (= (and b!594707 res!380643) b!594689))

(assert (= (and b!594689 res!380630) b!594703))

(assert (= (and b!594689 c!67397) b!594692))

(assert (= (and b!594689 (not c!67397)) b!594700))

(assert (= (and b!594689 (not res!380638)) b!594699))

(assert (= (and b!594699 res!380635) b!594694))

(assert (= (and b!594694 (not res!380631)) b!594702))

(assert (= (and b!594702 res!380632) b!594696))

(assert (= (and b!594699 (not res!380639)) b!594710))

(assert (= (and b!594710 (not res!380629)) b!594697))

(assert (= (and b!594697 (not res!380648)) b!594701))

(assert (= (and b!594701 (not res!380647)) b!594709))

(assert (= (and b!594709 (not res!380642)) b!594705))

(declare-fun m!572459 () Bool)

(assert (=> b!594699 m!572459))

(declare-fun m!572461 () Bool)

(assert (=> b!594699 m!572461))

(declare-fun m!572463 () Bool)

(assert (=> b!594699 m!572463))

(declare-fun m!572465 () Bool)

(assert (=> b!594708 m!572465))

(declare-fun m!572467 () Bool)

(assert (=> b!594691 m!572467))

(declare-fun m!572469 () Bool)

(assert (=> b!594705 m!572469))

(declare-fun m!572471 () Bool)

(assert (=> b!594701 m!572471))

(declare-fun m!572473 () Bool)

(assert (=> start!54502 m!572473))

(declare-fun m!572475 () Bool)

(assert (=> start!54502 m!572475))

(assert (=> b!594710 m!572459))

(assert (=> b!594710 m!572459))

(declare-fun m!572477 () Bool)

(assert (=> b!594710 m!572477))

(assert (=> b!594710 m!572459))

(declare-fun m!572479 () Bool)

(assert (=> b!594710 m!572479))

(assert (=> b!594706 m!572461))

(declare-fun m!572481 () Bool)

(assert (=> b!594706 m!572481))

(assert (=> b!594694 m!572459))

(declare-fun m!572483 () Bool)

(assert (=> b!594688 m!572483))

(assert (=> b!594704 m!572459))

(assert (=> b!594704 m!572459))

(declare-fun m!572485 () Bool)

(assert (=> b!594704 m!572485))

(declare-fun m!572487 () Bool)

(assert (=> b!594690 m!572487))

(declare-fun m!572489 () Bool)

(assert (=> b!594707 m!572489))

(assert (=> b!594707 m!572459))

(assert (=> b!594707 m!572459))

(declare-fun m!572491 () Bool)

(assert (=> b!594707 m!572491))

(assert (=> b!594696 m!572459))

(assert (=> b!594696 m!572459))

(declare-fun m!572493 () Bool)

(assert (=> b!594696 m!572493))

(assert (=> b!594702 m!572459))

(assert (=> b!594702 m!572459))

(declare-fun m!572495 () Bool)

(assert (=> b!594702 m!572495))

(declare-fun m!572497 () Bool)

(assert (=> b!594698 m!572497))

(declare-fun m!572499 () Bool)

(assert (=> b!594693 m!572499))

(declare-fun m!572501 () Bool)

(assert (=> b!594709 m!572501))

(declare-fun m!572503 () Bool)

(assert (=> b!594697 m!572503))

(declare-fun m!572505 () Bool)

(assert (=> b!594689 m!572505))

(declare-fun m!572507 () Bool)

(assert (=> b!594689 m!572507))

(assert (=> b!594689 m!572459))

(assert (=> b!594689 m!572461))

(assert (=> b!594689 m!572459))

(declare-fun m!572509 () Bool)

(assert (=> b!594689 m!572509))

(declare-fun m!572511 () Bool)

(assert (=> b!594689 m!572511))

(declare-fun m!572513 () Bool)

(assert (=> b!594689 m!572513))

(declare-fun m!572515 () Bool)

(assert (=> b!594689 m!572515))

(push 1)

