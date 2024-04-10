; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59594 () Bool)

(assert start!59594)

(declare-fun b!658659 () Bool)

(declare-fun res!427148 () Bool)

(declare-fun e!378392 () Bool)

(assert (=> b!658659 (=> (not res!427148) (not e!378392))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!658659 (= res!427148 (validKeyInArray!0 k!1786))))

(declare-fun b!658660 () Bool)

(declare-fun res!427140 () Bool)

(declare-fun e!378386 () Bool)

(assert (=> b!658660 (=> (not res!427140) (not e!378386))))

(declare-datatypes ((array!38752 0))(
  ( (array!38753 (arr!18573 (Array (_ BitVec 32) (_ BitVec 64))) (size!18937 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38752)

(declare-datatypes ((List!12614 0))(
  ( (Nil!12611) (Cons!12610 (h!13655 (_ BitVec 64)) (t!18842 List!12614)) )
))
(declare-fun arrayNoDuplicates!0 (array!38752 (_ BitVec 32) List!12614) Bool)

(assert (=> b!658660 (= res!427140 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12611))))

(declare-fun b!658661 () Bool)

(declare-fun res!427147 () Bool)

(assert (=> b!658661 (=> (not res!427147) (not e!378392))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!658661 (= res!427147 (and (= (size!18937 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18937 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18937 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!658662 () Bool)

(declare-fun e!378388 () Bool)

(declare-datatypes ((SeekEntryResult!7013 0))(
  ( (MissingZero!7013 (index!30417 (_ BitVec 32))) (Found!7013 (index!30418 (_ BitVec 32))) (Intermediate!7013 (undefined!7825 Bool) (index!30419 (_ BitVec 32)) (x!59208 (_ BitVec 32))) (Undefined!7013) (MissingVacant!7013 (index!30420 (_ BitVec 32))) )
))
(declare-fun lt!308065 () SeekEntryResult!7013)

(declare-fun lt!308061 () SeekEntryResult!7013)

(assert (=> b!658662 (= e!378388 (= lt!308065 lt!308061))))

(declare-fun b!658663 () Bool)

(declare-fun e!378384 () Bool)

(assert (=> b!658663 (= e!378386 e!378384)))

(declare-fun res!427149 () Bool)

(assert (=> b!658663 (=> (not res!427149) (not e!378384))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!658663 (= res!427149 (= (select (store (arr!18573 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!308062 () array!38752)

(assert (=> b!658663 (= lt!308062 (array!38753 (store (arr!18573 a!2986) i!1108 k!1786) (size!18937 a!2986)))))

(declare-fun b!658665 () Bool)

(declare-fun e!378385 () Bool)

(assert (=> b!658665 (= e!378385 (not true))))

(declare-datatypes ((Unit!22884 0))(
  ( (Unit!22885) )
))
(declare-fun lt!308059 () Unit!22884)

(declare-fun e!378383 () Unit!22884)

(assert (=> b!658665 (= lt!308059 e!378383)))

(declare-fun c!76127 () Bool)

(declare-fun lt!308056 () SeekEntryResult!7013)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!658665 (= c!76127 (= lt!308056 (Found!7013 index!984)))))

(declare-fun lt!308068 () Unit!22884)

(declare-fun e!378391 () Unit!22884)

(assert (=> b!658665 (= lt!308068 e!378391)))

(declare-fun c!76130 () Bool)

(assert (=> b!658665 (= c!76130 (= lt!308056 Undefined!7013))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!308053 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38752 (_ BitVec 32)) SeekEntryResult!7013)

(assert (=> b!658665 (= lt!308056 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!308053 lt!308062 mask!3053))))

(assert (=> b!658665 e!378388))

(declare-fun res!427146 () Bool)

(assert (=> b!658665 (=> (not res!427146) (not e!378388))))

(declare-fun lt!308066 () (_ BitVec 32))

(assert (=> b!658665 (= res!427146 (= lt!308061 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308066 vacantSpotIndex!68 lt!308053 lt!308062 mask!3053)))))

(assert (=> b!658665 (= lt!308061 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308066 vacantSpotIndex!68 (select (arr!18573 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!658665 (= lt!308053 (select (store (arr!18573 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!308060 () Unit!22884)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38752 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22884)

(assert (=> b!658665 (= lt!308060 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!308066 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!658665 (= lt!308066 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!658666 () Bool)

(declare-fun res!427150 () Bool)

(assert (=> b!658666 (=> (not res!427150) (not e!378386))))

(assert (=> b!658666 (= res!427150 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18573 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!658667 () Bool)

(assert (=> b!658667 false))

(declare-fun lt!308057 () Unit!22884)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38752 (_ BitVec 64) (_ BitVec 32) List!12614) Unit!22884)

(assert (=> b!658667 (= lt!308057 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!308062 (select (arr!18573 a!2986) j!136) j!136 Nil!12611))))

(assert (=> b!658667 (arrayNoDuplicates!0 lt!308062 j!136 Nil!12611)))

(declare-fun lt!308051 () Unit!22884)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38752 (_ BitVec 32) (_ BitVec 32)) Unit!22884)

(assert (=> b!658667 (= lt!308051 (lemmaNoDuplicateFromThenFromBigger!0 lt!308062 #b00000000000000000000000000000000 j!136))))

(assert (=> b!658667 (arrayNoDuplicates!0 lt!308062 #b00000000000000000000000000000000 Nil!12611)))

(declare-fun lt!308055 () Unit!22884)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38752 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12614) Unit!22884)

(assert (=> b!658667 (= lt!308055 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12611))))

(declare-fun arrayContainsKey!0 (array!38752 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!658667 (arrayContainsKey!0 lt!308062 (select (arr!18573 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!308063 () Unit!22884)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38752 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22884)

(assert (=> b!658667 (= lt!308063 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!308062 (select (arr!18573 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!378393 () Unit!22884)

(declare-fun Unit!22886 () Unit!22884)

(assert (=> b!658667 (= e!378393 Unit!22886)))

(declare-fun b!658668 () Bool)

(declare-fun Unit!22887 () Unit!22884)

(assert (=> b!658668 (= e!378391 Unit!22887)))

(assert (=> b!658668 false))

(declare-fun b!658669 () Bool)

(declare-fun res!427144 () Bool)

(assert (=> b!658669 (=> (not res!427144) (not e!378386))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38752 (_ BitVec 32)) Bool)

(assert (=> b!658669 (= res!427144 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!658670 () Bool)

(declare-fun Unit!22888 () Unit!22884)

(assert (=> b!658670 (= e!378393 Unit!22888)))

(declare-fun e!378394 () Bool)

(declare-fun b!658671 () Bool)

(assert (=> b!658671 (= e!378394 (arrayContainsKey!0 lt!308062 (select (arr!18573 a!2986) j!136) index!984))))

(declare-fun b!658672 () Bool)

(declare-fun e!378395 () Bool)

(assert (=> b!658672 (= e!378395 (arrayContainsKey!0 lt!308062 (select (arr!18573 a!2986) j!136) index!984))))

(declare-fun b!658673 () Bool)

(declare-fun res!427142 () Bool)

(assert (=> b!658673 (= res!427142 (bvsge j!136 index!984))))

(declare-fun e!378389 () Bool)

(assert (=> b!658673 (=> res!427142 e!378389)))

(declare-fun e!378387 () Bool)

(assert (=> b!658673 (= e!378387 e!378389)))

(declare-fun res!427141 () Bool)

(declare-fun b!658674 () Bool)

(assert (=> b!658674 (= res!427141 (arrayContainsKey!0 lt!308062 (select (arr!18573 a!2986) j!136) j!136))))

(assert (=> b!658674 (=> (not res!427141) (not e!378395))))

(assert (=> b!658674 (= e!378389 e!378395)))

(declare-fun b!658675 () Bool)

(declare-fun Unit!22889 () Unit!22884)

(assert (=> b!658675 (= e!378391 Unit!22889)))

(declare-fun b!658676 () Bool)

(assert (=> b!658676 (= e!378392 e!378386)))

(declare-fun res!427151 () Bool)

(assert (=> b!658676 (=> (not res!427151) (not e!378386))))

(declare-fun lt!308052 () SeekEntryResult!7013)

(assert (=> b!658676 (= res!427151 (or (= lt!308052 (MissingZero!7013 i!1108)) (= lt!308052 (MissingVacant!7013 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38752 (_ BitVec 32)) SeekEntryResult!7013)

(assert (=> b!658676 (= lt!308052 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!658677 () Bool)

(assert (=> b!658677 false))

(declare-fun lt!308050 () Unit!22884)

(assert (=> b!658677 (= lt!308050 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!308062 (select (arr!18573 a!2986) j!136) index!984 Nil!12611))))

(assert (=> b!658677 (arrayNoDuplicates!0 lt!308062 index!984 Nil!12611)))

(declare-fun lt!308058 () Unit!22884)

(assert (=> b!658677 (= lt!308058 (lemmaNoDuplicateFromThenFromBigger!0 lt!308062 #b00000000000000000000000000000000 index!984))))

(assert (=> b!658677 (arrayNoDuplicates!0 lt!308062 #b00000000000000000000000000000000 Nil!12611)))

(declare-fun lt!308054 () Unit!22884)

(assert (=> b!658677 (= lt!308054 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12611))))

(assert (=> b!658677 (arrayContainsKey!0 lt!308062 (select (arr!18573 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!308064 () Unit!22884)

(assert (=> b!658677 (= lt!308064 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!308062 (select (arr!18573 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!658677 e!378394))

(declare-fun res!427152 () Bool)

(assert (=> b!658677 (=> (not res!427152) (not e!378394))))

(assert (=> b!658677 (= res!427152 (arrayContainsKey!0 lt!308062 (select (arr!18573 a!2986) j!136) j!136))))

(declare-fun e!378390 () Unit!22884)

(declare-fun Unit!22890 () Unit!22884)

(assert (=> b!658677 (= e!378390 Unit!22890)))

(declare-fun b!658678 () Bool)

(declare-fun res!427139 () Bool)

(assert (=> b!658678 (=> (not res!427139) (not e!378392))))

(assert (=> b!658678 (= res!427139 (validKeyInArray!0 (select (arr!18573 a!2986) j!136)))))

(declare-fun b!658664 () Bool)

(declare-fun Unit!22891 () Unit!22884)

(assert (=> b!658664 (= e!378383 Unit!22891)))

(declare-fun res!427143 () Bool)

(assert (=> b!658664 (= res!427143 (= (select (store (arr!18573 a!2986) i!1108 k!1786) index!984) (select (arr!18573 a!2986) j!136)))))

(assert (=> b!658664 (=> (not res!427143) (not e!378387))))

(assert (=> b!658664 e!378387))

(declare-fun c!76128 () Bool)

(assert (=> b!658664 (= c!76128 (bvslt j!136 index!984))))

(declare-fun lt!308049 () Unit!22884)

(assert (=> b!658664 (= lt!308049 e!378393)))

(declare-fun c!76129 () Bool)

(assert (=> b!658664 (= c!76129 (bvslt index!984 j!136))))

(declare-fun lt!308067 () Unit!22884)

(assert (=> b!658664 (= lt!308067 e!378390)))

(assert (=> b!658664 false))

(declare-fun res!427154 () Bool)

(assert (=> start!59594 (=> (not res!427154) (not e!378392))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59594 (= res!427154 (validMask!0 mask!3053))))

(assert (=> start!59594 e!378392))

(assert (=> start!59594 true))

(declare-fun array_inv!14369 (array!38752) Bool)

(assert (=> start!59594 (array_inv!14369 a!2986)))

(declare-fun b!658679 () Bool)

(declare-fun Unit!22892 () Unit!22884)

(assert (=> b!658679 (= e!378383 Unit!22892)))

(declare-fun b!658680 () Bool)

(declare-fun Unit!22893 () Unit!22884)

(assert (=> b!658680 (= e!378390 Unit!22893)))

(declare-fun b!658681 () Bool)

(assert (=> b!658681 (= e!378384 e!378385)))

(declare-fun res!427153 () Bool)

(assert (=> b!658681 (=> (not res!427153) (not e!378385))))

(assert (=> b!658681 (= res!427153 (and (= lt!308065 (Found!7013 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18573 a!2986) index!984) (select (arr!18573 a!2986) j!136))) (not (= (select (arr!18573 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!658681 (= lt!308065 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18573 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!658682 () Bool)

(declare-fun res!427145 () Bool)

(assert (=> b!658682 (=> (not res!427145) (not e!378392))))

(assert (=> b!658682 (= res!427145 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!59594 res!427154) b!658661))

(assert (= (and b!658661 res!427147) b!658678))

(assert (= (and b!658678 res!427139) b!658659))

(assert (= (and b!658659 res!427148) b!658682))

(assert (= (and b!658682 res!427145) b!658676))

(assert (= (and b!658676 res!427151) b!658669))

(assert (= (and b!658669 res!427144) b!658660))

(assert (= (and b!658660 res!427140) b!658666))

(assert (= (and b!658666 res!427150) b!658663))

(assert (= (and b!658663 res!427149) b!658681))

(assert (= (and b!658681 res!427153) b!658665))

(assert (= (and b!658665 res!427146) b!658662))

(assert (= (and b!658665 c!76130) b!658668))

(assert (= (and b!658665 (not c!76130)) b!658675))

(assert (= (and b!658665 c!76127) b!658664))

(assert (= (and b!658665 (not c!76127)) b!658679))

(assert (= (and b!658664 res!427143) b!658673))

(assert (= (and b!658673 (not res!427142)) b!658674))

(assert (= (and b!658674 res!427141) b!658672))

(assert (= (and b!658664 c!76128) b!658667))

(assert (= (and b!658664 (not c!76128)) b!658670))

(assert (= (and b!658664 c!76129) b!658677))

(assert (= (and b!658664 (not c!76129)) b!658680))

(assert (= (and b!658677 res!427152) b!658671))

(declare-fun m!631637 () Bool)

(assert (=> b!658672 m!631637))

(assert (=> b!658672 m!631637))

(declare-fun m!631639 () Bool)

(assert (=> b!658672 m!631639))

(declare-fun m!631641 () Bool)

(assert (=> b!658666 m!631641))

(declare-fun m!631643 () Bool)

(assert (=> b!658664 m!631643))

(declare-fun m!631645 () Bool)

(assert (=> b!658664 m!631645))

(assert (=> b!658664 m!631637))

(assert (=> b!658663 m!631643))

(declare-fun m!631647 () Bool)

(assert (=> b!658663 m!631647))

(declare-fun m!631649 () Bool)

(assert (=> b!658676 m!631649))

(assert (=> b!658671 m!631637))

(assert (=> b!658671 m!631637))

(assert (=> b!658671 m!631639))

(assert (=> b!658678 m!631637))

(assert (=> b!658678 m!631637))

(declare-fun m!631651 () Bool)

(assert (=> b!658678 m!631651))

(assert (=> b!658677 m!631637))

(declare-fun m!631653 () Bool)

(assert (=> b!658677 m!631653))

(declare-fun m!631655 () Bool)

(assert (=> b!658677 m!631655))

(assert (=> b!658677 m!631637))

(assert (=> b!658677 m!631637))

(declare-fun m!631657 () Bool)

(assert (=> b!658677 m!631657))

(declare-fun m!631659 () Bool)

(assert (=> b!658677 m!631659))

(assert (=> b!658677 m!631637))

(declare-fun m!631661 () Bool)

(assert (=> b!658677 m!631661))

(declare-fun m!631663 () Bool)

(assert (=> b!658677 m!631663))

(assert (=> b!658677 m!631637))

(declare-fun m!631665 () Bool)

(assert (=> b!658677 m!631665))

(declare-fun m!631667 () Bool)

(assert (=> b!658677 m!631667))

(declare-fun m!631669 () Bool)

(assert (=> b!658660 m!631669))

(assert (=> b!658674 m!631637))

(assert (=> b!658674 m!631637))

(assert (=> b!658674 m!631653))

(declare-fun m!631671 () Bool)

(assert (=> b!658659 m!631671))

(declare-fun m!631673 () Bool)

(assert (=> b!658669 m!631673))

(declare-fun m!631675 () Bool)

(assert (=> b!658665 m!631675))

(declare-fun m!631677 () Bool)

(assert (=> b!658665 m!631677))

(assert (=> b!658665 m!631643))

(declare-fun m!631679 () Bool)

(assert (=> b!658665 m!631679))

(declare-fun m!631681 () Bool)

(assert (=> b!658665 m!631681))

(declare-fun m!631683 () Bool)

(assert (=> b!658665 m!631683))

(assert (=> b!658665 m!631637))

(declare-fun m!631685 () Bool)

(assert (=> b!658665 m!631685))

(assert (=> b!658665 m!631637))

(assert (=> b!658667 m!631637))

(declare-fun m!631687 () Bool)

(assert (=> b!658667 m!631687))

(assert (=> b!658667 m!631637))

(assert (=> b!658667 m!631637))

(declare-fun m!631689 () Bool)

(assert (=> b!658667 m!631689))

(assert (=> b!658667 m!631637))

(declare-fun m!631691 () Bool)

(assert (=> b!658667 m!631691))

(declare-fun m!631693 () Bool)

(assert (=> b!658667 m!631693))

(declare-fun m!631695 () Bool)

(assert (=> b!658667 m!631695))

(assert (=> b!658667 m!631659))

(assert (=> b!658667 m!631663))

(declare-fun m!631697 () Bool)

(assert (=> b!658681 m!631697))

(assert (=> b!658681 m!631637))

(assert (=> b!658681 m!631637))

(declare-fun m!631699 () Bool)

(assert (=> b!658681 m!631699))

(declare-fun m!631701 () Bool)

(assert (=> b!658682 m!631701))

(declare-fun m!631703 () Bool)

(assert (=> start!59594 m!631703))

(declare-fun m!631705 () Bool)

(assert (=> start!59594 m!631705))

(push 1)

