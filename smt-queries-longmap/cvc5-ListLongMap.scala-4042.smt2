; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55126 () Bool)

(assert start!55126)

(declare-fun b!603547 () Bool)

(declare-fun e!345275 () Bool)

(declare-fun e!345274 () Bool)

(assert (=> b!603547 (= e!345275 e!345274)))

(declare-fun res!387637 () Bool)

(assert (=> b!603547 (=> res!387637 e!345274)))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!603547 (= res!387637 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!19156 0))(
  ( (Unit!19157) )
))
(declare-fun lt!275069 () Unit!19156)

(declare-fun e!345283 () Unit!19156)

(assert (=> b!603547 (= lt!275069 e!345283)))

(declare-fun c!68329 () Bool)

(assert (=> b!603547 (= c!68329 (bvslt j!136 index!984))))

(declare-fun b!603548 () Bool)

(declare-fun e!345273 () Bool)

(declare-fun e!345284 () Bool)

(assert (=> b!603548 (= e!345273 e!345284)))

(declare-fun res!387626 () Bool)

(assert (=> b!603548 (=> (not res!387626) (not e!345284))))

(declare-datatypes ((SeekEntryResult!6296 0))(
  ( (MissingZero!6296 (index!27447 (_ BitVec 32))) (Found!6296 (index!27448 (_ BitVec 32))) (Intermediate!6296 (undefined!7108 Bool) (index!27449 (_ BitVec 32)) (x!56249 (_ BitVec 32))) (Undefined!6296) (MissingVacant!6296 (index!27450 (_ BitVec 32))) )
))
(declare-fun lt!275071 () SeekEntryResult!6296)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!603548 (= res!387626 (or (= lt!275071 (MissingZero!6296 i!1108)) (= lt!275071 (MissingVacant!6296 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!37199 0))(
  ( (array!37200 (arr!17856 (Array (_ BitVec 32) (_ BitVec 64))) (size!18220 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37199)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37199 (_ BitVec 32)) SeekEntryResult!6296)

(assert (=> b!603548 (= lt!275071 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!603549 () Bool)

(declare-fun e!345277 () Unit!19156)

(declare-fun Unit!19158 () Unit!19156)

(assert (=> b!603549 (= e!345277 Unit!19158)))

(declare-fun b!603550 () Bool)

(declare-fun res!387629 () Bool)

(assert (=> b!603550 (=> (not res!387629) (not e!345273))))

(assert (=> b!603550 (= res!387629 (and (= (size!18220 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18220 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18220 a!2986)) (not (= i!1108 j!136))))))

(declare-fun lt!275064 () array!37199)

(declare-fun e!345285 () Bool)

(declare-fun b!603551 () Bool)

(declare-fun arrayContainsKey!0 (array!37199 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!603551 (= e!345285 (arrayContainsKey!0 lt!275064 (select (arr!17856 a!2986) j!136) index!984))))

(declare-fun b!603553 () Bool)

(assert (=> b!603553 (= e!345274 true)))

(declare-fun e!345281 () Bool)

(assert (=> b!603553 e!345281))

(declare-fun res!387634 () Bool)

(assert (=> b!603553 (=> (not res!387634) (not e!345281))))

(assert (=> b!603553 (= res!387634 (arrayContainsKey!0 lt!275064 (select (arr!17856 a!2986) j!136) j!136))))

(declare-fun b!603554 () Bool)

(declare-fun e!345279 () Bool)

(declare-fun e!345272 () Bool)

(assert (=> b!603554 (= e!345279 e!345272)))

(declare-fun res!387633 () Bool)

(assert (=> b!603554 (=> res!387633 e!345272)))

(declare-fun lt!275077 () (_ BitVec 64))

(declare-fun lt!275074 () (_ BitVec 64))

(assert (=> b!603554 (= res!387633 (or (not (= (select (arr!17856 a!2986) j!136) lt!275074)) (not (= (select (arr!17856 a!2986) j!136) lt!275077)) (bvsge j!136 index!984)))))

(declare-fun b!603555 () Bool)

(declare-fun res!387636 () Bool)

(assert (=> b!603555 (=> (not res!387636) (not e!345284))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37199 (_ BitVec 32)) Bool)

(assert (=> b!603555 (= res!387636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!603556 () Bool)

(declare-fun e!345282 () Bool)

(assert (=> b!603556 (= e!345284 e!345282)))

(declare-fun res!387632 () Bool)

(assert (=> b!603556 (=> (not res!387632) (not e!345282))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!603556 (= res!387632 (= (select (store (arr!17856 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!603556 (= lt!275064 (array!37200 (store (arr!17856 a!2986) i!1108 k!1786) (size!18220 a!2986)))))

(declare-fun b!603557 () Bool)

(assert (=> b!603557 (= e!345281 (arrayContainsKey!0 lt!275064 (select (arr!17856 a!2986) j!136) index!984))))

(declare-fun b!603558 () Bool)

(declare-fun res!387638 () Bool)

(assert (=> b!603558 (=> (not res!387638) (not e!345273))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!603558 (= res!387638 (validKeyInArray!0 (select (arr!17856 a!2986) j!136)))))

(declare-fun b!603559 () Bool)

(declare-fun res!387635 () Bool)

(assert (=> b!603559 (=> (not res!387635) (not e!345273))))

(assert (=> b!603559 (= res!387635 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!603560 () Bool)

(declare-fun e!345271 () Bool)

(declare-fun lt!275066 () SeekEntryResult!6296)

(declare-fun lt!275067 () SeekEntryResult!6296)

(assert (=> b!603560 (= e!345271 (= lt!275066 lt!275067))))

(declare-fun b!603561 () Bool)

(assert (=> b!603561 (= e!345272 e!345285)))

(declare-fun res!387628 () Bool)

(assert (=> b!603561 (=> (not res!387628) (not e!345285))))

(assert (=> b!603561 (= res!387628 (arrayContainsKey!0 lt!275064 (select (arr!17856 a!2986) j!136) j!136))))

(declare-fun b!603562 () Bool)

(declare-fun res!387624 () Bool)

(assert (=> b!603562 (=> (not res!387624) (not e!345284))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!603562 (= res!387624 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17856 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!603563 () Bool)

(declare-fun Unit!19159 () Unit!19156)

(assert (=> b!603563 (= e!345277 Unit!19159)))

(assert (=> b!603563 false))

(declare-fun b!603564 () Bool)

(declare-fun e!345278 () Bool)

(assert (=> b!603564 (= e!345282 e!345278)))

(declare-fun res!387625 () Bool)

(assert (=> b!603564 (=> (not res!387625) (not e!345278))))

(assert (=> b!603564 (= res!387625 (and (= lt!275066 (Found!6296 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17856 a!2986) index!984) (select (arr!17856 a!2986) j!136))) (not (= (select (arr!17856 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37199 (_ BitVec 32)) SeekEntryResult!6296)

(assert (=> b!603564 (= lt!275066 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17856 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!603552 () Bool)

(declare-fun res!387639 () Bool)

(assert (=> b!603552 (=> (not res!387639) (not e!345284))))

(declare-datatypes ((List!11897 0))(
  ( (Nil!11894) (Cons!11893 (h!12938 (_ BitVec 64)) (t!18125 List!11897)) )
))
(declare-fun arrayNoDuplicates!0 (array!37199 (_ BitVec 32) List!11897) Bool)

(assert (=> b!603552 (= res!387639 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11894))))

(declare-fun res!387640 () Bool)

(assert (=> start!55126 (=> (not res!387640) (not e!345273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55126 (= res!387640 (validMask!0 mask!3053))))

(assert (=> start!55126 e!345273))

(assert (=> start!55126 true))

(declare-fun array_inv!13652 (array!37199) Bool)

(assert (=> start!55126 (array_inv!13652 a!2986)))

(declare-fun b!603565 () Bool)

(declare-fun res!387641 () Bool)

(assert (=> b!603565 (=> (not res!387641) (not e!345273))))

(assert (=> b!603565 (= res!387641 (validKeyInArray!0 k!1786))))

(declare-fun b!603566 () Bool)

(declare-fun e!345276 () Bool)

(assert (=> b!603566 (= e!345276 e!345275)))

(declare-fun res!387623 () Bool)

(assert (=> b!603566 (=> res!387623 e!345275)))

(assert (=> b!603566 (= res!387623 (or (not (= (select (arr!17856 a!2986) j!136) lt!275074)) (not (= (select (arr!17856 a!2986) j!136) lt!275077))))))

(assert (=> b!603566 e!345279))

(declare-fun res!387630 () Bool)

(assert (=> b!603566 (=> (not res!387630) (not e!345279))))

(assert (=> b!603566 (= res!387630 (= lt!275077 (select (arr!17856 a!2986) j!136)))))

(assert (=> b!603566 (= lt!275077 (select (store (arr!17856 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!603567 () Bool)

(assert (=> b!603567 (= e!345278 (not e!345276))))

(declare-fun res!387627 () Bool)

(assert (=> b!603567 (=> res!387627 e!345276)))

(declare-fun lt!275073 () SeekEntryResult!6296)

(assert (=> b!603567 (= res!387627 (not (= lt!275073 (Found!6296 index!984))))))

(declare-fun lt!275063 () Unit!19156)

(assert (=> b!603567 (= lt!275063 e!345277)))

(declare-fun c!68330 () Bool)

(assert (=> b!603567 (= c!68330 (= lt!275073 Undefined!6296))))

(assert (=> b!603567 (= lt!275073 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!275074 lt!275064 mask!3053))))

(assert (=> b!603567 e!345271))

(declare-fun res!387631 () Bool)

(assert (=> b!603567 (=> (not res!387631) (not e!345271))))

(declare-fun lt!275075 () (_ BitVec 32))

(assert (=> b!603567 (= res!387631 (= lt!275067 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275075 vacantSpotIndex!68 lt!275074 lt!275064 mask!3053)))))

(assert (=> b!603567 (= lt!275067 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275075 vacantSpotIndex!68 (select (arr!17856 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!603567 (= lt!275074 (select (store (arr!17856 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!275068 () Unit!19156)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37199 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19156)

(assert (=> b!603567 (= lt!275068 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275075 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!603567 (= lt!275075 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!603568 () Bool)

(declare-fun Unit!19160 () Unit!19156)

(assert (=> b!603568 (= e!345283 Unit!19160)))

(declare-fun lt!275070 () Unit!19156)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37199 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19156)

(assert (=> b!603568 (= lt!275070 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275064 (select (arr!17856 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!603568 (arrayContainsKey!0 lt!275064 (select (arr!17856 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!275072 () Unit!19156)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37199 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11897) Unit!19156)

(assert (=> b!603568 (= lt!275072 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11894))))

(assert (=> b!603568 (arrayNoDuplicates!0 lt!275064 #b00000000000000000000000000000000 Nil!11894)))

(declare-fun lt!275076 () Unit!19156)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37199 (_ BitVec 32) (_ BitVec 32)) Unit!19156)

(assert (=> b!603568 (= lt!275076 (lemmaNoDuplicateFromThenFromBigger!0 lt!275064 #b00000000000000000000000000000000 j!136))))

(assert (=> b!603568 (arrayNoDuplicates!0 lt!275064 j!136 Nil!11894)))

(declare-fun lt!275065 () Unit!19156)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37199 (_ BitVec 64) (_ BitVec 32) List!11897) Unit!19156)

(assert (=> b!603568 (= lt!275065 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!275064 (select (arr!17856 a!2986) j!136) j!136 Nil!11894))))

(assert (=> b!603568 false))

(declare-fun b!603569 () Bool)

(declare-fun Unit!19161 () Unit!19156)

(assert (=> b!603569 (= e!345283 Unit!19161)))

(assert (= (and start!55126 res!387640) b!603550))

(assert (= (and b!603550 res!387629) b!603558))

(assert (= (and b!603558 res!387638) b!603565))

(assert (= (and b!603565 res!387641) b!603559))

(assert (= (and b!603559 res!387635) b!603548))

(assert (= (and b!603548 res!387626) b!603555))

(assert (= (and b!603555 res!387636) b!603552))

(assert (= (and b!603552 res!387639) b!603562))

(assert (= (and b!603562 res!387624) b!603556))

(assert (= (and b!603556 res!387632) b!603564))

(assert (= (and b!603564 res!387625) b!603567))

(assert (= (and b!603567 res!387631) b!603560))

(assert (= (and b!603567 c!68330) b!603563))

(assert (= (and b!603567 (not c!68330)) b!603549))

(assert (= (and b!603567 (not res!387627)) b!603566))

(assert (= (and b!603566 res!387630) b!603554))

(assert (= (and b!603554 (not res!387633)) b!603561))

(assert (= (and b!603561 res!387628) b!603551))

(assert (= (and b!603566 (not res!387623)) b!603547))

(assert (= (and b!603547 c!68329) b!603568))

(assert (= (and b!603547 (not c!68329)) b!603569))

(assert (= (and b!603547 (not res!387637)) b!603553))

(assert (= (and b!603553 res!387634) b!603557))

(declare-fun m!580553 () Bool)

(assert (=> b!603559 m!580553))

(declare-fun m!580555 () Bool)

(assert (=> b!603548 m!580555))

(declare-fun m!580557 () Bool)

(assert (=> b!603564 m!580557))

(declare-fun m!580559 () Bool)

(assert (=> b!603564 m!580559))

(assert (=> b!603564 m!580559))

(declare-fun m!580561 () Bool)

(assert (=> b!603564 m!580561))

(assert (=> b!603558 m!580559))

(assert (=> b!603558 m!580559))

(declare-fun m!580563 () Bool)

(assert (=> b!603558 m!580563))

(assert (=> b!603553 m!580559))

(assert (=> b!603553 m!580559))

(declare-fun m!580565 () Bool)

(assert (=> b!603553 m!580565))

(assert (=> b!603561 m!580559))

(assert (=> b!603561 m!580559))

(assert (=> b!603561 m!580565))

(declare-fun m!580567 () Bool)

(assert (=> b!603556 m!580567))

(declare-fun m!580569 () Bool)

(assert (=> b!603556 m!580569))

(assert (=> b!603557 m!580559))

(assert (=> b!603557 m!580559))

(declare-fun m!580571 () Bool)

(assert (=> b!603557 m!580571))

(assert (=> b!603551 m!580559))

(assert (=> b!603551 m!580559))

(assert (=> b!603551 m!580571))

(assert (=> b!603566 m!580559))

(assert (=> b!603566 m!580567))

(declare-fun m!580573 () Bool)

(assert (=> b!603566 m!580573))

(declare-fun m!580575 () Bool)

(assert (=> b!603552 m!580575))

(assert (=> b!603554 m!580559))

(declare-fun m!580577 () Bool)

(assert (=> start!55126 m!580577))

(declare-fun m!580579 () Bool)

(assert (=> start!55126 m!580579))

(declare-fun m!580581 () Bool)

(assert (=> b!603567 m!580581))

(assert (=> b!603567 m!580559))

(declare-fun m!580583 () Bool)

(assert (=> b!603567 m!580583))

(assert (=> b!603567 m!580567))

(declare-fun m!580585 () Bool)

(assert (=> b!603567 m!580585))

(declare-fun m!580587 () Bool)

(assert (=> b!603567 m!580587))

(declare-fun m!580589 () Bool)

(assert (=> b!603567 m!580589))

(declare-fun m!580591 () Bool)

(assert (=> b!603567 m!580591))

(assert (=> b!603567 m!580559))

(assert (=> b!603568 m!580559))

(declare-fun m!580593 () Bool)

(assert (=> b!603568 m!580593))

(declare-fun m!580595 () Bool)

(assert (=> b!603568 m!580595))

(assert (=> b!603568 m!580559))

(declare-fun m!580597 () Bool)

(assert (=> b!603568 m!580597))

(assert (=> b!603568 m!580559))

(declare-fun m!580599 () Bool)

(assert (=> b!603568 m!580599))

(declare-fun m!580601 () Bool)

(assert (=> b!603568 m!580601))

(declare-fun m!580603 () Bool)

(assert (=> b!603568 m!580603))

(assert (=> b!603568 m!580559))

(declare-fun m!580605 () Bool)

(assert (=> b!603568 m!580605))

(declare-fun m!580607 () Bool)

(assert (=> b!603565 m!580607))

(declare-fun m!580609 () Bool)

(assert (=> b!603562 m!580609))

(declare-fun m!580611 () Bool)

(assert (=> b!603555 m!580611))

(push 1)

