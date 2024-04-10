; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56200 () Bool)

(assert start!56200)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!357177 () Bool)

(declare-datatypes ((array!37670 0))(
  ( (array!37671 (arr!18081 (Array (_ BitVec 32) (_ BitVec 64))) (size!18445 (_ BitVec 32))) )
))
(declare-fun lt!288628 () array!37670)

(declare-fun b!622713 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37670)

(declare-fun arrayContainsKey!0 (array!37670 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!622713 (= e!357177 (arrayContainsKey!0 lt!288628 (select (arr!18081 a!2986) j!136) index!984))))

(declare-fun b!622714 () Bool)

(declare-fun e!357179 () Bool)

(declare-fun e!357178 () Bool)

(assert (=> b!622714 (= e!357179 e!357178)))

(declare-fun res!401328 () Bool)

(assert (=> b!622714 (=> (not res!401328) (not e!357178))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!622714 (= res!401328 (= (select (store (arr!18081 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!622714 (= lt!288628 (array!37671 (store (arr!18081 a!2986) i!1108 k!1786) (size!18445 a!2986)))))

(declare-fun b!622716 () Bool)

(declare-fun e!357174 () Bool)

(assert (=> b!622716 (= e!357174 (not true))))

(declare-datatypes ((Unit!20938 0))(
  ( (Unit!20939) )
))
(declare-fun lt!288632 () Unit!20938)

(declare-fun e!357182 () Unit!20938)

(assert (=> b!622716 (= lt!288632 e!357182)))

(declare-fun c!71067 () Bool)

(declare-datatypes ((SeekEntryResult!6521 0))(
  ( (MissingZero!6521 (index!28368 (_ BitVec 32))) (Found!6521 (index!28369 (_ BitVec 32))) (Intermediate!6521 (undefined!7333 Bool) (index!28370 (_ BitVec 32)) (x!57137 (_ BitVec 32))) (Undefined!6521) (MissingVacant!6521 (index!28371 (_ BitVec 32))) )
))
(declare-fun lt!288630 () SeekEntryResult!6521)

(assert (=> b!622716 (= c!71067 (= lt!288630 (Found!6521 index!984)))))

(declare-fun lt!288629 () Unit!20938)

(declare-fun e!357175 () Unit!20938)

(assert (=> b!622716 (= lt!288629 e!357175)))

(declare-fun c!71068 () Bool)

(assert (=> b!622716 (= c!71068 (= lt!288630 Undefined!6521))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!288618 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37670 (_ BitVec 32)) SeekEntryResult!6521)

(assert (=> b!622716 (= lt!288630 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!288618 lt!288628 mask!3053))))

(declare-fun e!357176 () Bool)

(assert (=> b!622716 e!357176))

(declare-fun res!401318 () Bool)

(assert (=> b!622716 (=> (not res!401318) (not e!357176))))

(declare-fun lt!288622 () (_ BitVec 32))

(declare-fun lt!288625 () SeekEntryResult!6521)

(assert (=> b!622716 (= res!401318 (= lt!288625 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288622 vacantSpotIndex!68 lt!288618 lt!288628 mask!3053)))))

(assert (=> b!622716 (= lt!288625 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288622 vacantSpotIndex!68 (select (arr!18081 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!622716 (= lt!288618 (select (store (arr!18081 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!288633 () Unit!20938)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37670 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20938)

(assert (=> b!622716 (= lt!288633 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!288622 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!622716 (= lt!288622 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!622717 () Bool)

(declare-fun res!401317 () Bool)

(assert (=> b!622717 (= res!401317 (bvsge j!136 index!984))))

(declare-fun e!357185 () Bool)

(assert (=> b!622717 (=> res!401317 e!357185)))

(declare-fun e!357180 () Bool)

(assert (=> b!622717 (= e!357180 e!357185)))

(declare-fun b!622718 () Bool)

(declare-fun e!357186 () Bool)

(assert (=> b!622718 (= e!357186 e!357179)))

(declare-fun res!401325 () Bool)

(assert (=> b!622718 (=> (not res!401325) (not e!357179))))

(declare-fun lt!288624 () SeekEntryResult!6521)

(assert (=> b!622718 (= res!401325 (or (= lt!288624 (MissingZero!6521 i!1108)) (= lt!288624 (MissingVacant!6521 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37670 (_ BitVec 32)) SeekEntryResult!6521)

(assert (=> b!622718 (= lt!288624 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!622719 () Bool)

(declare-fun res!401330 () Bool)

(assert (=> b!622719 (= res!401330 (arrayContainsKey!0 lt!288628 (select (arr!18081 a!2986) j!136) j!136))))

(assert (=> b!622719 (=> (not res!401330) (not e!357177))))

(assert (=> b!622719 (= e!357185 e!357177)))

(declare-fun b!622720 () Bool)

(declare-fun lt!288627 () SeekEntryResult!6521)

(assert (=> b!622720 (= e!357176 (= lt!288627 lt!288625))))

(declare-fun e!357183 () Bool)

(declare-fun b!622721 () Bool)

(assert (=> b!622721 (= e!357183 (arrayContainsKey!0 lt!288628 (select (arr!18081 a!2986) j!136) index!984))))

(declare-fun b!622722 () Bool)

(declare-fun Unit!20940 () Unit!20938)

(assert (=> b!622722 (= e!357182 Unit!20940)))

(declare-fun b!622723 () Bool)

(declare-fun res!401327 () Bool)

(assert (=> b!622723 (=> (not res!401327) (not e!357179))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37670 (_ BitVec 32)) Bool)

(assert (=> b!622723 (= res!401327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!622724 () Bool)

(assert (=> b!622724 false))

(declare-fun lt!288637 () Unit!20938)

(declare-datatypes ((List!12122 0))(
  ( (Nil!12119) (Cons!12118 (h!13163 (_ BitVec 64)) (t!18350 List!12122)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37670 (_ BitVec 64) (_ BitVec 32) List!12122) Unit!20938)

(assert (=> b!622724 (= lt!288637 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288628 (select (arr!18081 a!2986) j!136) j!136 Nil!12119))))

(declare-fun arrayNoDuplicates!0 (array!37670 (_ BitVec 32) List!12122) Bool)

(assert (=> b!622724 (arrayNoDuplicates!0 lt!288628 j!136 Nil!12119)))

(declare-fun lt!288620 () Unit!20938)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37670 (_ BitVec 32) (_ BitVec 32)) Unit!20938)

(assert (=> b!622724 (= lt!288620 (lemmaNoDuplicateFromThenFromBigger!0 lt!288628 #b00000000000000000000000000000000 j!136))))

(assert (=> b!622724 (arrayNoDuplicates!0 lt!288628 #b00000000000000000000000000000000 Nil!12119)))

(declare-fun lt!288635 () Unit!20938)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37670 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12122) Unit!20938)

(assert (=> b!622724 (= lt!288635 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12119))))

(assert (=> b!622724 (arrayContainsKey!0 lt!288628 (select (arr!18081 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!288619 () Unit!20938)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37670 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20938)

(assert (=> b!622724 (= lt!288619 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288628 (select (arr!18081 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!357184 () Unit!20938)

(declare-fun Unit!20941 () Unit!20938)

(assert (=> b!622724 (= e!357184 Unit!20941)))

(declare-fun b!622725 () Bool)

(declare-fun e!357173 () Unit!20938)

(declare-fun Unit!20942 () Unit!20938)

(assert (=> b!622725 (= e!357173 Unit!20942)))

(declare-fun b!622726 () Bool)

(assert (=> b!622726 (= e!357178 e!357174)))

(declare-fun res!401321 () Bool)

(assert (=> b!622726 (=> (not res!401321) (not e!357174))))

(assert (=> b!622726 (= res!401321 (and (= lt!288627 (Found!6521 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18081 a!2986) index!984) (select (arr!18081 a!2986) j!136))) (not (= (select (arr!18081 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!622726 (= lt!288627 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18081 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!622715 () Bool)

(declare-fun res!401329 () Bool)

(assert (=> b!622715 (=> (not res!401329) (not e!357186))))

(assert (=> b!622715 (= res!401329 (and (= (size!18445 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18445 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18445 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!401323 () Bool)

(assert (=> start!56200 (=> (not res!401323) (not e!357186))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56200 (= res!401323 (validMask!0 mask!3053))))

(assert (=> start!56200 e!357186))

(assert (=> start!56200 true))

(declare-fun array_inv!13877 (array!37670) Bool)

(assert (=> start!56200 (array_inv!13877 a!2986)))

(declare-fun b!622727 () Bool)

(declare-fun res!401322 () Bool)

(assert (=> b!622727 (=> (not res!401322) (not e!357186))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!622727 (= res!401322 (validKeyInArray!0 (select (arr!18081 a!2986) j!136)))))

(declare-fun b!622728 () Bool)

(declare-fun res!401316 () Bool)

(assert (=> b!622728 (=> (not res!401316) (not e!357186))))

(assert (=> b!622728 (= res!401316 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!622729 () Bool)

(assert (=> b!622729 false))

(declare-fun lt!288623 () Unit!20938)

(assert (=> b!622729 (= lt!288623 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288628 (select (arr!18081 a!2986) j!136) index!984 Nil!12119))))

(assert (=> b!622729 (arrayNoDuplicates!0 lt!288628 index!984 Nil!12119)))

(declare-fun lt!288626 () Unit!20938)

(assert (=> b!622729 (= lt!288626 (lemmaNoDuplicateFromThenFromBigger!0 lt!288628 #b00000000000000000000000000000000 index!984))))

(assert (=> b!622729 (arrayNoDuplicates!0 lt!288628 #b00000000000000000000000000000000 Nil!12119)))

(declare-fun lt!288634 () Unit!20938)

(assert (=> b!622729 (= lt!288634 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12119))))

(assert (=> b!622729 (arrayContainsKey!0 lt!288628 (select (arr!18081 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!288631 () Unit!20938)

(assert (=> b!622729 (= lt!288631 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288628 (select (arr!18081 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!622729 e!357183))

(declare-fun res!401320 () Bool)

(assert (=> b!622729 (=> (not res!401320) (not e!357183))))

(assert (=> b!622729 (= res!401320 (arrayContainsKey!0 lt!288628 (select (arr!18081 a!2986) j!136) j!136))))

(declare-fun Unit!20943 () Unit!20938)

(assert (=> b!622729 (= e!357173 Unit!20943)))

(declare-fun b!622730 () Bool)

(declare-fun res!401324 () Bool)

(assert (=> b!622730 (=> (not res!401324) (not e!357179))))

(assert (=> b!622730 (= res!401324 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18081 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!622731 () Bool)

(declare-fun Unit!20944 () Unit!20938)

(assert (=> b!622731 (= e!357182 Unit!20944)))

(declare-fun res!401326 () Bool)

(assert (=> b!622731 (= res!401326 (= (select (store (arr!18081 a!2986) i!1108 k!1786) index!984) (select (arr!18081 a!2986) j!136)))))

(assert (=> b!622731 (=> (not res!401326) (not e!357180))))

(assert (=> b!622731 e!357180))

(declare-fun c!71066 () Bool)

(assert (=> b!622731 (= c!71066 (bvslt j!136 index!984))))

(declare-fun lt!288636 () Unit!20938)

(assert (=> b!622731 (= lt!288636 e!357184)))

(declare-fun c!71069 () Bool)

(assert (=> b!622731 (= c!71069 (bvslt index!984 j!136))))

(declare-fun lt!288621 () Unit!20938)

(assert (=> b!622731 (= lt!288621 e!357173)))

(assert (=> b!622731 false))

(declare-fun b!622732 () Bool)

(declare-fun Unit!20945 () Unit!20938)

(assert (=> b!622732 (= e!357184 Unit!20945)))

(declare-fun b!622733 () Bool)

(declare-fun Unit!20946 () Unit!20938)

(assert (=> b!622733 (= e!357175 Unit!20946)))

(declare-fun b!622734 () Bool)

(declare-fun res!401315 () Bool)

(assert (=> b!622734 (=> (not res!401315) (not e!357186))))

(assert (=> b!622734 (= res!401315 (validKeyInArray!0 k!1786))))

(declare-fun b!622735 () Bool)

(declare-fun Unit!20947 () Unit!20938)

(assert (=> b!622735 (= e!357175 Unit!20947)))

(assert (=> b!622735 false))

(declare-fun b!622736 () Bool)

(declare-fun res!401319 () Bool)

(assert (=> b!622736 (=> (not res!401319) (not e!357179))))

(assert (=> b!622736 (= res!401319 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12119))))

(assert (= (and start!56200 res!401323) b!622715))

(assert (= (and b!622715 res!401329) b!622727))

(assert (= (and b!622727 res!401322) b!622734))

(assert (= (and b!622734 res!401315) b!622728))

(assert (= (and b!622728 res!401316) b!622718))

(assert (= (and b!622718 res!401325) b!622723))

(assert (= (and b!622723 res!401327) b!622736))

(assert (= (and b!622736 res!401319) b!622730))

(assert (= (and b!622730 res!401324) b!622714))

(assert (= (and b!622714 res!401328) b!622726))

(assert (= (and b!622726 res!401321) b!622716))

(assert (= (and b!622716 res!401318) b!622720))

(assert (= (and b!622716 c!71068) b!622735))

(assert (= (and b!622716 (not c!71068)) b!622733))

(assert (= (and b!622716 c!71067) b!622731))

(assert (= (and b!622716 (not c!71067)) b!622722))

(assert (= (and b!622731 res!401326) b!622717))

(assert (= (and b!622717 (not res!401317)) b!622719))

(assert (= (and b!622719 res!401330) b!622713))

(assert (= (and b!622731 c!71066) b!622724))

(assert (= (and b!622731 (not c!71066)) b!622732))

(assert (= (and b!622731 c!71069) b!622729))

(assert (= (and b!622731 (not c!71069)) b!622725))

(assert (= (and b!622729 res!401320) b!622721))

(declare-fun m!598571 () Bool)

(assert (=> b!622731 m!598571))

(declare-fun m!598573 () Bool)

(assert (=> b!622731 m!598573))

(declare-fun m!598575 () Bool)

(assert (=> b!622731 m!598575))

(declare-fun m!598577 () Bool)

(assert (=> b!622724 m!598577))

(assert (=> b!622724 m!598575))

(declare-fun m!598579 () Bool)

(assert (=> b!622724 m!598579))

(declare-fun m!598581 () Bool)

(assert (=> b!622724 m!598581))

(assert (=> b!622724 m!598575))

(assert (=> b!622724 m!598575))

(declare-fun m!598583 () Bool)

(assert (=> b!622724 m!598583))

(declare-fun m!598585 () Bool)

(assert (=> b!622724 m!598585))

(assert (=> b!622724 m!598575))

(declare-fun m!598587 () Bool)

(assert (=> b!622724 m!598587))

(declare-fun m!598589 () Bool)

(assert (=> b!622724 m!598589))

(declare-fun m!598591 () Bool)

(assert (=> b!622734 m!598591))

(declare-fun m!598593 () Bool)

(assert (=> b!622726 m!598593))

(assert (=> b!622726 m!598575))

(assert (=> b!622726 m!598575))

(declare-fun m!598595 () Bool)

(assert (=> b!622726 m!598595))

(assert (=> b!622713 m!598575))

(assert (=> b!622713 m!598575))

(declare-fun m!598597 () Bool)

(assert (=> b!622713 m!598597))

(assert (=> b!622721 m!598575))

(assert (=> b!622721 m!598575))

(assert (=> b!622721 m!598597))

(assert (=> b!622729 m!598577))

(assert (=> b!622729 m!598575))

(assert (=> b!622729 m!598575))

(declare-fun m!598599 () Bool)

(assert (=> b!622729 m!598599))

(assert (=> b!622729 m!598575))

(declare-fun m!598601 () Bool)

(assert (=> b!622729 m!598601))

(assert (=> b!622729 m!598589))

(declare-fun m!598603 () Bool)

(assert (=> b!622729 m!598603))

(assert (=> b!622729 m!598575))

(declare-fun m!598605 () Bool)

(assert (=> b!622729 m!598605))

(assert (=> b!622729 m!598575))

(declare-fun m!598607 () Bool)

(assert (=> b!622729 m!598607))

(declare-fun m!598609 () Bool)

(assert (=> b!622729 m!598609))

(declare-fun m!598611 () Bool)

(assert (=> b!622723 m!598611))

(declare-fun m!598613 () Bool)

(assert (=> b!622716 m!598613))

(declare-fun m!598615 () Bool)

(assert (=> b!622716 m!598615))

(declare-fun m!598617 () Bool)

(assert (=> b!622716 m!598617))

(assert (=> b!622716 m!598575))

(declare-fun m!598619 () Bool)

(assert (=> b!622716 m!598619))

(declare-fun m!598621 () Bool)

(assert (=> b!622716 m!598621))

(assert (=> b!622716 m!598575))

(declare-fun m!598623 () Bool)

(assert (=> b!622716 m!598623))

(assert (=> b!622716 m!598571))

(assert (=> b!622727 m!598575))

(assert (=> b!622727 m!598575))

(declare-fun m!598625 () Bool)

(assert (=> b!622727 m!598625))

(assert (=> b!622719 m!598575))

(assert (=> b!622719 m!598575))

(assert (=> b!622719 m!598607))

(declare-fun m!598627 () Bool)

(assert (=> b!622736 m!598627))

(declare-fun m!598629 () Bool)

(assert (=> b!622730 m!598629))

(declare-fun m!598631 () Bool)

(assert (=> start!56200 m!598631))

(declare-fun m!598633 () Bool)

(assert (=> start!56200 m!598633))

(declare-fun m!598635 () Bool)

(assert (=> b!622728 m!598635))

(declare-fun m!598637 () Bool)

(assert (=> b!622718 m!598637))

(assert (=> b!622714 m!598571))

(declare-fun m!598639 () Bool)

(assert (=> b!622714 m!598639))

(push 1)

