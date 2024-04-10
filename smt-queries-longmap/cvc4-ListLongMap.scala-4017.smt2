; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54650 () Bool)

(assert start!54650)

(declare-fun b!597526 () Bool)

(declare-fun res!383037 () Bool)

(declare-fun e!341463 () Bool)

(assert (=> b!597526 (=> (not res!383037) (not e!341463))))

(declare-datatypes ((array!37041 0))(
  ( (array!37042 (arr!17783 (Array (_ BitVec 32) (_ BitVec 64))) (size!18147 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37041)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!597526 (= res!383037 (validKeyInArray!0 (select (arr!17783 a!2986) j!136)))))

(declare-fun b!597527 () Bool)

(declare-fun e!341460 () Bool)

(declare-fun e!341452 () Bool)

(assert (=> b!597527 (= e!341460 (not e!341452))))

(declare-fun res!383047 () Bool)

(assert (=> b!597527 (=> res!383047 e!341452)))

(declare-datatypes ((SeekEntryResult!6223 0))(
  ( (MissingZero!6223 (index!27143 (_ BitVec 32))) (Found!6223 (index!27144 (_ BitVec 32))) (Intermediate!6223 (undefined!7035 Bool) (index!27145 (_ BitVec 32)) (x!55940 (_ BitVec 32))) (Undefined!6223) (MissingVacant!6223 (index!27146 (_ BitVec 32))) )
))
(declare-fun lt!271479 () SeekEntryResult!6223)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!597527 (= res!383047 (not (= lt!271479 (Found!6223 index!984))))))

(declare-datatypes ((Unit!18810 0))(
  ( (Unit!18811) )
))
(declare-fun lt!271475 () Unit!18810)

(declare-fun e!341461 () Unit!18810)

(assert (=> b!597527 (= lt!271475 e!341461)))

(declare-fun c!67613 () Bool)

(assert (=> b!597527 (= c!67613 (= lt!271479 Undefined!6223))))

(declare-fun lt!271483 () array!37041)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!271481 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37041 (_ BitVec 32)) SeekEntryResult!6223)

(assert (=> b!597527 (= lt!271479 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271481 lt!271483 mask!3053))))

(declare-fun e!341462 () Bool)

(assert (=> b!597527 e!341462))

(declare-fun res!383042 () Bool)

(assert (=> b!597527 (=> (not res!383042) (not e!341462))))

(declare-fun lt!271472 () SeekEntryResult!6223)

(declare-fun lt!271473 () (_ BitVec 32))

(assert (=> b!597527 (= res!383042 (= lt!271472 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271473 vacantSpotIndex!68 lt!271481 lt!271483 mask!3053)))))

(assert (=> b!597527 (= lt!271472 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271473 vacantSpotIndex!68 (select (arr!17783 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!597527 (= lt!271481 (select (store (arr!17783 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!271478 () Unit!18810)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37041 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18810)

(assert (=> b!597527 (= lt!271478 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271473 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!597527 (= lt!271473 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!597528 () Bool)

(declare-fun e!341456 () Bool)

(assert (=> b!597528 (= e!341463 e!341456)))

(declare-fun res!383038 () Bool)

(assert (=> b!597528 (=> (not res!383038) (not e!341456))))

(declare-fun lt!271482 () SeekEntryResult!6223)

(assert (=> b!597528 (= res!383038 (or (= lt!271482 (MissingZero!6223 i!1108)) (= lt!271482 (MissingVacant!6223 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37041 (_ BitVec 32)) SeekEntryResult!6223)

(assert (=> b!597528 (= lt!271482 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!597529 () Bool)

(declare-fun e!341458 () Bool)

(declare-fun e!341454 () Bool)

(assert (=> b!597529 (= e!341458 e!341454)))

(declare-fun res!383034 () Bool)

(assert (=> b!597529 (=> res!383034 e!341454)))

(declare-fun lt!271474 () (_ BitVec 64))

(assert (=> b!597529 (= res!383034 (or (not (= (select (arr!17783 a!2986) j!136) lt!271481)) (not (= (select (arr!17783 a!2986) j!136) lt!271474)) (bvsge j!136 index!984)))))

(declare-fun b!597530 () Bool)

(declare-fun lt!271480 () SeekEntryResult!6223)

(assert (=> b!597530 (= e!341462 (= lt!271480 lt!271472))))

(declare-fun b!597532 () Bool)

(declare-fun e!341459 () Bool)

(declare-fun arrayContainsKey!0 (array!37041 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!597532 (= e!341459 (arrayContainsKey!0 lt!271483 (select (arr!17783 a!2986) j!136) index!984))))

(declare-fun b!597533 () Bool)

(declare-fun Unit!18812 () Unit!18810)

(assert (=> b!597533 (= e!341461 Unit!18812)))

(assert (=> b!597533 false))

(declare-fun b!597534 () Bool)

(declare-fun e!341457 () Bool)

(assert (=> b!597534 (= e!341456 e!341457)))

(declare-fun res!383049 () Bool)

(assert (=> b!597534 (=> (not res!383049) (not e!341457))))

(assert (=> b!597534 (= res!383049 (= (select (store (arr!17783 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!597534 (= lt!271483 (array!37042 (store (arr!17783 a!2986) i!1108 k!1786) (size!18147 a!2986)))))

(declare-fun b!597535 () Bool)

(assert (=> b!597535 (= e!341454 e!341459)))

(declare-fun res!383043 () Bool)

(assert (=> b!597535 (=> (not res!383043) (not e!341459))))

(assert (=> b!597535 (= res!383043 (arrayContainsKey!0 lt!271483 (select (arr!17783 a!2986) j!136) j!136))))

(declare-fun b!597536 () Bool)

(declare-fun e!341453 () Bool)

(assert (=> b!597536 (= e!341452 e!341453)))

(declare-fun res!383041 () Bool)

(assert (=> b!597536 (=> res!383041 e!341453)))

(assert (=> b!597536 (= res!383041 (or (not (= (select (arr!17783 a!2986) j!136) lt!271481)) (not (= (select (arr!17783 a!2986) j!136) lt!271474)) (bvsge j!136 index!984)))))

(assert (=> b!597536 e!341458))

(declare-fun res!383048 () Bool)

(assert (=> b!597536 (=> (not res!383048) (not e!341458))))

(assert (=> b!597536 (= res!383048 (= lt!271474 (select (arr!17783 a!2986) j!136)))))

(assert (=> b!597536 (= lt!271474 (select (store (arr!17783 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!597537 () Bool)

(declare-fun res!383035 () Bool)

(assert (=> b!597537 (=> (not res!383035) (not e!341456))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37041 (_ BitVec 32)) Bool)

(assert (=> b!597537 (= res!383035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!597538 () Bool)

(declare-fun res!383046 () Bool)

(assert (=> b!597538 (=> (not res!383046) (not e!341463))))

(assert (=> b!597538 (= res!383046 (validKeyInArray!0 k!1786))))

(declare-fun b!597539 () Bool)

(declare-fun res!383051 () Bool)

(assert (=> b!597539 (=> (not res!383051) (not e!341463))))

(assert (=> b!597539 (= res!383051 (and (= (size!18147 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18147 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18147 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!597540 () Bool)

(assert (=> b!597540 (= e!341457 e!341460)))

(declare-fun res!383040 () Bool)

(assert (=> b!597540 (=> (not res!383040) (not e!341460))))

(assert (=> b!597540 (= res!383040 (and (= lt!271480 (Found!6223 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17783 a!2986) index!984) (select (arr!17783 a!2986) j!136))) (not (= (select (arr!17783 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!597540 (= lt!271480 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17783 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!597541 () Bool)

(declare-fun e!341455 () Bool)

(declare-datatypes ((List!11824 0))(
  ( (Nil!11821) (Cons!11820 (h!12865 (_ BitVec 64)) (t!18052 List!11824)) )
))
(declare-fun noDuplicate!272 (List!11824) Bool)

(assert (=> b!597541 (= e!341455 (noDuplicate!272 Nil!11821))))

(declare-fun b!597531 () Bool)

(declare-fun res!383036 () Bool)

(assert (=> b!597531 (=> (not res!383036) (not e!341456))))

(declare-fun arrayNoDuplicates!0 (array!37041 (_ BitVec 32) List!11824) Bool)

(assert (=> b!597531 (= res!383036 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11821))))

(declare-fun res!383050 () Bool)

(assert (=> start!54650 (=> (not res!383050) (not e!341463))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54650 (= res!383050 (validMask!0 mask!3053))))

(assert (=> start!54650 e!341463))

(assert (=> start!54650 true))

(declare-fun array_inv!13579 (array!37041) Bool)

(assert (=> start!54650 (array_inv!13579 a!2986)))

(declare-fun b!597542 () Bool)

(declare-fun res!383044 () Bool)

(assert (=> b!597542 (=> (not res!383044) (not e!341463))))

(assert (=> b!597542 (= res!383044 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!597543 () Bool)

(declare-fun res!383045 () Bool)

(assert (=> b!597543 (=> (not res!383045) (not e!341456))))

(assert (=> b!597543 (= res!383045 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17783 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!597544 () Bool)

(assert (=> b!597544 (= e!341453 e!341455)))

(declare-fun res!383039 () Bool)

(assert (=> b!597544 (=> res!383039 e!341455)))

(assert (=> b!597544 (= res!383039 (or (bvsgt #b00000000000000000000000000000000 (size!18147 a!2986)) (bvsge (size!18147 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!597544 (arrayNoDuplicates!0 lt!271483 #b00000000000000000000000000000000 Nil!11821)))

(declare-fun lt!271476 () Unit!18810)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37041 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11824) Unit!18810)

(assert (=> b!597544 (= lt!271476 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11821))))

(assert (=> b!597544 (arrayContainsKey!0 lt!271483 (select (arr!17783 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271477 () Unit!18810)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37041 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18810)

(assert (=> b!597544 (= lt!271477 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271483 (select (arr!17783 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!597545 () Bool)

(declare-fun Unit!18813 () Unit!18810)

(assert (=> b!597545 (= e!341461 Unit!18813)))

(assert (= (and start!54650 res!383050) b!597539))

(assert (= (and b!597539 res!383051) b!597526))

(assert (= (and b!597526 res!383037) b!597538))

(assert (= (and b!597538 res!383046) b!597542))

(assert (= (and b!597542 res!383044) b!597528))

(assert (= (and b!597528 res!383038) b!597537))

(assert (= (and b!597537 res!383035) b!597531))

(assert (= (and b!597531 res!383036) b!597543))

(assert (= (and b!597543 res!383045) b!597534))

(assert (= (and b!597534 res!383049) b!597540))

(assert (= (and b!597540 res!383040) b!597527))

(assert (= (and b!597527 res!383042) b!597530))

(assert (= (and b!597527 c!67613) b!597533))

(assert (= (and b!597527 (not c!67613)) b!597545))

(assert (= (and b!597527 (not res!383047)) b!597536))

(assert (= (and b!597536 res!383048) b!597529))

(assert (= (and b!597529 (not res!383034)) b!597535))

(assert (= (and b!597535 res!383043) b!597532))

(assert (= (and b!597536 (not res!383041)) b!597544))

(assert (= (and b!597544 (not res!383039)) b!597541))

(declare-fun m!574917 () Bool)

(assert (=> b!597538 m!574917))

(declare-fun m!574919 () Bool)

(assert (=> b!597527 m!574919))

(declare-fun m!574921 () Bool)

(assert (=> b!597527 m!574921))

(declare-fun m!574923 () Bool)

(assert (=> b!597527 m!574923))

(declare-fun m!574925 () Bool)

(assert (=> b!597527 m!574925))

(declare-fun m!574927 () Bool)

(assert (=> b!597527 m!574927))

(declare-fun m!574929 () Bool)

(assert (=> b!597527 m!574929))

(declare-fun m!574931 () Bool)

(assert (=> b!597527 m!574931))

(assert (=> b!597527 m!574923))

(declare-fun m!574933 () Bool)

(assert (=> b!597527 m!574933))

(assert (=> b!597529 m!574923))

(assert (=> b!597535 m!574923))

(assert (=> b!597535 m!574923))

(declare-fun m!574935 () Bool)

(assert (=> b!597535 m!574935))

(declare-fun m!574937 () Bool)

(assert (=> start!54650 m!574937))

(declare-fun m!574939 () Bool)

(assert (=> start!54650 m!574939))

(declare-fun m!574941 () Bool)

(assert (=> b!597528 m!574941))

(declare-fun m!574943 () Bool)

(assert (=> b!597540 m!574943))

(assert (=> b!597540 m!574923))

(assert (=> b!597540 m!574923))

(declare-fun m!574945 () Bool)

(assert (=> b!597540 m!574945))

(declare-fun m!574947 () Bool)

(assert (=> b!597531 m!574947))

(declare-fun m!574949 () Bool)

(assert (=> b!597543 m!574949))

(assert (=> b!597532 m!574923))

(assert (=> b!597532 m!574923))

(declare-fun m!574951 () Bool)

(assert (=> b!597532 m!574951))

(declare-fun m!574953 () Bool)

(assert (=> b!597541 m!574953))

(declare-fun m!574955 () Bool)

(assert (=> b!597542 m!574955))

(assert (=> b!597534 m!574927))

(declare-fun m!574957 () Bool)

(assert (=> b!597534 m!574957))

(assert (=> b!597526 m!574923))

(assert (=> b!597526 m!574923))

(declare-fun m!574959 () Bool)

(assert (=> b!597526 m!574959))

(assert (=> b!597544 m!574923))

(declare-fun m!574961 () Bool)

(assert (=> b!597544 m!574961))

(assert (=> b!597544 m!574923))

(assert (=> b!597544 m!574923))

(declare-fun m!574963 () Bool)

(assert (=> b!597544 m!574963))

(declare-fun m!574965 () Bool)

(assert (=> b!597544 m!574965))

(declare-fun m!574967 () Bool)

(assert (=> b!597544 m!574967))

(declare-fun m!574969 () Bool)

(assert (=> b!597537 m!574969))

(assert (=> b!597536 m!574923))

(assert (=> b!597536 m!574927))

(declare-fun m!574971 () Bool)

(assert (=> b!597536 m!574971))

(push 1)

(assert (not b!597542))

(assert (not b!597531))

(assert (not b!597540))

(assert (not b!597541))

(assert (not b!597527))

(assert (not b!597537))

(assert (not b!597532))

(assert (not b!597535))

(assert (not b!597538))

(assert (not b!597526))

(assert (not start!54650))

(assert (not b!597544))

(assert (not b!597528))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86853 () Bool)

(declare-fun lt!271505 () SeekEntryResult!6223)

(assert (=> d!86853 (and (or (is-Undefined!6223 lt!271505) (not (is-Found!6223 lt!271505)) (and (bvsge (index!27144 lt!271505) #b00000000000000000000000000000000) (bvslt (index!27144 lt!271505) (size!18147 a!2986)))) (or (is-Undefined!6223 lt!271505) (is-Found!6223 lt!271505) (not (is-MissingVacant!6223 lt!271505)) (not (= (index!27146 lt!271505) vacantSpotIndex!68)) (and (bvsge (index!27146 lt!271505) #b00000000000000000000000000000000) (bvslt (index!27146 lt!271505) (size!18147 a!2986)))) (or (is-Undefined!6223 lt!271505) (ite (is-Found!6223 lt!271505) (= (select (arr!17783 a!2986) (index!27144 lt!271505)) (select (arr!17783 a!2986) j!136)) (and (is-MissingVacant!6223 lt!271505) (= (index!27146 lt!271505) vacantSpotIndex!68) (= (select (arr!17783 a!2986) (index!27146 lt!271505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!341524 () SeekEntryResult!6223)

(assert (=> d!86853 (= lt!271505 e!341524)))

(declare-fun c!67641 () Bool)

(assert (=> d!86853 (= c!67641 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!271504 () (_ BitVec 64))

(assert (=> d!86853 (= lt!271504 (select (arr!17783 a!2986) index!984))))

(assert (=> d!86853 (validMask!0 mask!3053)))

(assert (=> d!86853 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17783 a!2986) j!136) a!2986 mask!3053) lt!271505)))

(declare-fun b!597633 () Bool)

(declare-fun e!341526 () SeekEntryResult!6223)

(assert (=> b!597633 (= e!341526 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17783 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!597634 () Bool)

(declare-fun e!341525 () SeekEntryResult!6223)

(assert (=> b!597634 (= e!341525 (Found!6223 index!984))))

(declare-fun b!597635 () Bool)

(assert (=> b!597635 (= e!341524 Undefined!6223)))

(declare-fun b!597636 () Bool)

(assert (=> b!597636 (= e!341526 (MissingVacant!6223 vacantSpotIndex!68))))

(declare-fun b!597637 () Bool)

(declare-fun c!67643 () Bool)

(assert (=> b!597637 (= c!67643 (= lt!271504 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!597637 (= e!341525 e!341526)))

(declare-fun b!597638 () Bool)

(assert (=> b!597638 (= e!341524 e!341525)))

(declare-fun c!67642 () Bool)

(assert (=> b!597638 (= c!67642 (= lt!271504 (select (arr!17783 a!2986) j!136)))))

(assert (= (and d!86853 c!67641) b!597635))

(assert (= (and d!86853 (not c!67641)) b!597638))

(assert (= (and b!597638 c!67642) b!597634))

(assert (= (and b!597638 (not c!67642)) b!597637))

(assert (= (and b!597637 c!67643) b!597636))

(assert (= (and b!597637 (not c!67643)) b!597633))

(declare-fun m!575029 () Bool)

(assert (=> d!86853 m!575029))

(declare-fun m!575031 () Bool)

(assert (=> d!86853 m!575031))

(assert (=> d!86853 m!574943))

(assert (=> d!86853 m!574937))

(assert (=> b!597633 m!574919))

(assert (=> b!597633 m!574919))

(assert (=> b!597633 m!574923))

(declare-fun m!575033 () Bool)

(assert (=> b!597633 m!575033))

(assert (=> b!597540 d!86853))

(declare-fun d!86865 () Bool)

(assert (=> d!86865 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!597538 d!86865))

(declare-fun b!597695 () Bool)

(declare-fun e!341567 () SeekEntryResult!6223)

(assert (=> b!597695 (= e!341567 Undefined!6223)))

(declare-fun b!597696 () Bool)

(declare-fun e!341566 () SeekEntryResult!6223)

(declare-fun lt!271531 () SeekEntryResult!6223)

(assert (=> b!597696 (= e!341566 (Found!6223 (index!27145 lt!271531)))))

(declare-fun b!597697 () Bool)

(declare-fun e!341565 () SeekEntryResult!6223)

(assert (=> b!597697 (= e!341565 (MissingZero!6223 (index!27145 lt!271531)))))

(declare-fun b!597698 () Bool)

(declare-fun c!67664 () Bool)

(declare-fun lt!271532 () (_ BitVec 64))

(assert (=> b!597698 (= c!67664 (= lt!271532 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!597698 (= e!341566 e!341565)))

(declare-fun b!597699 () Bool)

(assert (=> b!597699 (= e!341565 (seekKeyOrZeroReturnVacant!0 (x!55940 lt!271531) (index!27145 lt!271531) (index!27145 lt!271531) k!1786 a!2986 mask!3053))))

(declare-fun b!597700 () Bool)

(assert (=> b!597700 (= e!341567 e!341566)))

(assert (=> b!597700 (= lt!271532 (select (arr!17783 a!2986) (index!27145 lt!271531)))))

(declare-fun c!67663 () Bool)

(assert (=> b!597700 (= c!67663 (= lt!271532 k!1786))))

(declare-fun d!86867 () Bool)

(declare-fun lt!271530 () SeekEntryResult!6223)

(assert (=> d!86867 (and (or (is-Undefined!6223 lt!271530) (not (is-Found!6223 lt!271530)) (and (bvsge (index!27144 lt!271530) #b00000000000000000000000000000000) (bvslt (index!27144 lt!271530) (size!18147 a!2986)))) (or (is-Undefined!6223 lt!271530) (is-Found!6223 lt!271530) (not (is-MissingZero!6223 lt!271530)) (and (bvsge (index!27143 lt!271530) #b00000000000000000000000000000000) (bvslt (index!27143 lt!271530) (size!18147 a!2986)))) (or (is-Undefined!6223 lt!271530) (is-Found!6223 lt!271530) (is-MissingZero!6223 lt!271530) (not (is-MissingVacant!6223 lt!271530)) (and (bvsge (index!27146 lt!271530) #b00000000000000000000000000000000) (bvslt (index!27146 lt!271530) (size!18147 a!2986)))) (or (is-Undefined!6223 lt!271530) (ite (is-Found!6223 lt!271530) (= (select (arr!17783 a!2986) (index!27144 lt!271530)) k!1786) (ite (is-MissingZero!6223 lt!271530) (= (select (arr!17783 a!2986) (index!27143 lt!271530)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6223 lt!271530) (= (select (arr!17783 a!2986) (index!27146 lt!271530)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!86867 (= lt!271530 e!341567)))

(declare-fun c!67662 () Bool)

(assert (=> d!86867 (= c!67662 (and (is-Intermediate!6223 lt!271531) (undefined!7035 lt!271531)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37041 (_ BitVec 32)) SeekEntryResult!6223)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86867 (= lt!271531 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!86867 (validMask!0 mask!3053)))

(assert (=> d!86867 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!271530)))

(assert (= (and d!86867 c!67662) b!597695))

(assert (= (and d!86867 (not c!67662)) b!597700))

(assert (= (and b!597700 c!67663) b!597696))

(assert (= (and b!597700 (not c!67663)) b!597698))

(assert (= (and b!597698 c!67664) b!597697))

(assert (= (and b!597698 (not c!67664)) b!597699))

(declare-fun m!575067 () Bool)

(assert (=> b!597699 m!575067))

(declare-fun m!575069 () Bool)

(assert (=> b!597700 m!575069))

(declare-fun m!575071 () Bool)

(assert (=> d!86867 m!575071))

(declare-fun m!575073 () Bool)

(assert (=> d!86867 m!575073))

(declare-fun m!575075 () Bool)

(assert (=> d!86867 m!575075))

(declare-fun m!575077 () Bool)

(assert (=> d!86867 m!575077))

(declare-fun m!575079 () Bool)

(assert (=> d!86867 m!575079))

(assert (=> d!86867 m!575075))

(assert (=> d!86867 m!574937))

(assert (=> b!597528 d!86867))

(declare-fun b!597721 () Bool)

(declare-fun e!341582 () Bool)

(declare-fun e!341581 () Bool)

(assert (=> b!597721 (= e!341582 e!341581)))

(declare-fun lt!271544 () (_ BitVec 64))

(assert (=> b!597721 (= lt!271544 (select (arr!17783 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!271543 () Unit!18810)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37041 (_ BitVec 64) (_ BitVec 32)) Unit!18810)

(assert (=> b!597721 (= lt!271543 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!271544 #b00000000000000000000000000000000))))

(assert (=> b!597721 (arrayContainsKey!0 a!2986 lt!271544 #b00000000000000000000000000000000)))

(declare-fun lt!271545 () Unit!18810)

(assert (=> b!597721 (= lt!271545 lt!271543)))

(declare-fun res!383110 () Bool)

(assert (=> b!597721 (= res!383110 (= (seekEntryOrOpen!0 (select (arr!17783 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6223 #b00000000000000000000000000000000)))))

(assert (=> b!597721 (=> (not res!383110) (not e!341581))))

(declare-fun b!597722 () Bool)

(declare-fun e!341580 () Bool)

(assert (=> b!597722 (= e!341580 e!341582)))

(declare-fun c!67673 () Bool)

(assert (=> b!597722 (= c!67673 (validKeyInArray!0 (select (arr!17783 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!597723 () Bool)

(declare-fun call!32936 () Bool)

(assert (=> b!597723 (= e!341581 call!32936)))

(declare-fun bm!32933 () Bool)

(assert (=> bm!32933 (= call!32936 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun d!86885 () Bool)

(declare-fun res!383109 () Bool)

(assert (=> d!86885 (=> res!383109 e!341580)))

(assert (=> d!86885 (= res!383109 (bvsge #b00000000000000000000000000000000 (size!18147 a!2986)))))

(assert (=> d!86885 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!341580)))

(declare-fun b!597724 () Bool)

(assert (=> b!597724 (= e!341582 call!32936)))

(assert (= (and d!86885 (not res!383109)) b!597722))

(assert (= (and b!597722 c!67673) b!597721))

(assert (= (and b!597722 (not c!67673)) b!597724))

(assert (= (and b!597721 res!383110) b!597723))

(assert (= (or b!597723 b!597724) bm!32933))

(declare-fun m!575081 () Bool)

(assert (=> b!597721 m!575081))

(declare-fun m!575083 () Bool)

(assert (=> b!597721 m!575083))

(declare-fun m!575085 () Bool)

(assert (=> b!597721 m!575085))

(assert (=> b!597721 m!575081))

(declare-fun m!575087 () Bool)

(assert (=> b!597721 m!575087))

(assert (=> b!597722 m!575081))

(assert (=> b!597722 m!575081))

(declare-fun m!575089 () Bool)

(assert (=> b!597722 m!575089))

(declare-fun m!575091 () Bool)

(assert (=> bm!32933 m!575091))

(assert (=> b!597537 d!86885))

(declare-fun d!86887 () Bool)

(assert (=> d!86887 (= (validKeyInArray!0 (select (arr!17783 a!2986) j!136)) (and (not (= (select (arr!17783 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17783 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!597526 d!86887))

(declare-fun d!86889 () Bool)

(declare-fun lt!271554 () (_ BitVec 32))

(assert (=> d!86889 (and (bvsge lt!271554 #b00000000000000000000000000000000) (bvslt lt!271554 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86889 (= lt!271554 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!86889 (validMask!0 mask!3053)))

(assert (=> d!86889 (= (nextIndex!0 index!984 x!910 mask!3053) lt!271554)))

(declare-fun bs!18374 () Bool)

(assert (= bs!18374 d!86889))

(declare-fun m!575093 () Bool)

(assert (=> bs!18374 m!575093))

(assert (=> bs!18374 m!574937))

(assert (=> b!597527 d!86889))

(declare-fun d!86891 () Bool)

(declare-fun e!341619 () Bool)

(assert (=> d!86891 e!341619))

(declare-fun res!383125 () Bool)

(assert (=> d!86891 (=> (not res!383125) (not e!341619))))

(assert (=> d!86891 (= res!383125 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18147 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18147 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18147 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18147 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18147 a!2986))))))

(declare-fun lt!271574 () Unit!18810)

(declare-fun choose!9 (array!37041 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18810)

(assert (=> d!86891 (= lt!271574 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271473 vacantSpotIndex!68 mask!3053))))

(assert (=> d!86891 (validMask!0 mask!3053)))

(assert (=> d!86891 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271473 vacantSpotIndex!68 mask!3053) lt!271574)))

(declare-fun b!597783 () Bool)

(assert (=> b!597783 (= e!341619 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271473 vacantSpotIndex!68 (select (arr!17783 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271473 vacantSpotIndex!68 (select (store (arr!17783 a!2986) i!1108 k!1786) j!136) (array!37042 (store (arr!17783 a!2986) i!1108 k!1786) (size!18147 a!2986)) mask!3053)))))

(assert (= (and d!86891 res!383125) b!597783))

(declare-fun m!575163 () Bool)

(assert (=> d!86891 m!575163))

(assert (=> d!86891 m!574937))

(assert (=> b!597783 m!574927))

(assert (=> b!597783 m!574921))

(declare-fun m!575165 () Bool)

(assert (=> b!597783 m!575165))

(assert (=> b!597783 m!574923))

(assert (=> b!597783 m!574923))

(assert (=> b!597783 m!574933))

(assert (=> b!597783 m!574921))

(assert (=> b!597527 d!86891))

(declare-fun lt!271578 () SeekEntryResult!6223)

(declare-fun d!86917 () Bool)

(assert (=> d!86917 (and (or (is-Undefined!6223 lt!271578) (not (is-Found!6223 lt!271578)) (and (bvsge (index!27144 lt!271578) #b00000000000000000000000000000000) (bvslt (index!27144 lt!271578) (size!18147 a!2986)))) (or (is-Undefined!6223 lt!271578) (is-Found!6223 lt!271578) (not (is-MissingVacant!6223 lt!271578)) (not (= (index!27146 lt!271578) vacantSpotIndex!68)) (and (bvsge (index!27146 lt!271578) #b00000000000000000000000000000000) (bvslt (index!27146 lt!271578) (size!18147 a!2986)))) (or (is-Undefined!6223 lt!271578) (ite (is-Found!6223 lt!271578) (= (select (arr!17783 a!2986) (index!27144 lt!271578)) (select (arr!17783 a!2986) j!136)) (and (is-MissingVacant!6223 lt!271578) (= (index!27146 lt!271578) vacantSpotIndex!68) (= (select (arr!17783 a!2986) (index!27146 lt!271578)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!341620 () SeekEntryResult!6223)

(assert (=> d!86917 (= lt!271578 e!341620)))

(declare-fun c!67696 () Bool)

(assert (=> d!86917 (= c!67696 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!271577 () (_ BitVec 64))

(assert (=> d!86917 (= lt!271577 (select (arr!17783 a!2986) lt!271473))))

(assert (=> d!86917 (validMask!0 mask!3053)))

(assert (=> d!86917 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271473 vacantSpotIndex!68 (select (arr!17783 a!2986) j!136) a!2986 mask!3053) lt!271578)))

(declare-fun e!341622 () SeekEntryResult!6223)

(declare-fun b!597784 () Bool)

(assert (=> b!597784 (= e!341622 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!271473 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17783 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!597785 () Bool)

(declare-fun e!341621 () SeekEntryResult!6223)

(assert (=> b!597785 (= e!341621 (Found!6223 lt!271473))))

(declare-fun b!597786 () Bool)

(assert (=> b!597786 (= e!341620 Undefined!6223)))

(declare-fun b!597787 () Bool)

(assert (=> b!597787 (= e!341622 (MissingVacant!6223 vacantSpotIndex!68))))

(declare-fun b!597788 () Bool)

(declare-fun c!67698 () Bool)

(assert (=> b!597788 (= c!67698 (= lt!271577 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!597788 (= e!341621 e!341622)))

(declare-fun b!597789 () Bool)

(assert (=> b!597789 (= e!341620 e!341621)))

(declare-fun c!67697 () Bool)

(assert (=> b!597789 (= c!67697 (= lt!271577 (select (arr!17783 a!2986) j!136)))))

(assert (= (and d!86917 c!67696) b!597786))

(assert (= (and d!86917 (not c!67696)) b!597789))

(assert (= (and b!597789 c!67697) b!597785))

(assert (= (and b!597789 (not c!67697)) b!597788))

(assert (= (and b!597788 c!67698) b!597787))

(assert (= (and b!597788 (not c!67698)) b!597784))

(declare-fun m!575169 () Bool)

(assert (=> d!86917 m!575169))

(declare-fun m!575171 () Bool)

(assert (=> d!86917 m!575171))

(declare-fun m!575173 () Bool)

(assert (=> d!86917 m!575173))

(assert (=> d!86917 m!574937))

(declare-fun m!575175 () Bool)

(assert (=> b!597784 m!575175))

(assert (=> b!597784 m!575175))

(assert (=> b!597784 m!574923))

(declare-fun m!575177 () Bool)

(assert (=> b!597784 m!575177))

(assert (=> b!597527 d!86917))

(declare-fun d!86919 () Bool)

(declare-fun lt!271581 () SeekEntryResult!6223)

(assert (=> d!86919 (and (or (is-Undefined!6223 lt!271581) (not (is-Found!6223 lt!271581)) (and (bvsge (index!27144 lt!271581) #b00000000000000000000000000000000) (bvslt (index!27144 lt!271581) (size!18147 lt!271483)))) (or (is-Undefined!6223 lt!271581) (is-Found!6223 lt!271581) (not (is-MissingVacant!6223 lt!271581)) (not (= (index!27146 lt!271581) vacantSpotIndex!68)) (and (bvsge (index!27146 lt!271581) #b00000000000000000000000000000000) (bvslt (index!27146 lt!271581) (size!18147 lt!271483)))) (or (is-Undefined!6223 lt!271581) (ite (is-Found!6223 lt!271581) (= (select (arr!17783 lt!271483) (index!27144 lt!271581)) lt!271481) (and (is-MissingVacant!6223 lt!271581) (= (index!27146 lt!271581) vacantSpotIndex!68) (= (select (arr!17783 lt!271483) (index!27146 lt!271581)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!341623 () SeekEntryResult!6223)

(assert (=> d!86919 (= lt!271581 e!341623)))

(declare-fun c!67699 () Bool)

(assert (=> d!86919 (= c!67699 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!271580 () (_ BitVec 64))

(assert (=> d!86919 (= lt!271580 (select (arr!17783 lt!271483) index!984))))

(assert (=> d!86919 (validMask!0 mask!3053)))

(assert (=> d!86919 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271481 lt!271483 mask!3053) lt!271581)))

(declare-fun e!341625 () SeekEntryResult!6223)

(declare-fun b!597790 () Bool)

(assert (=> b!597790 (= e!341625 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!271481 lt!271483 mask!3053))))

(declare-fun b!597791 () Bool)

(declare-fun e!341624 () SeekEntryResult!6223)

(assert (=> b!597791 (= e!341624 (Found!6223 index!984))))

(declare-fun b!597792 () Bool)

(assert (=> b!597792 (= e!341623 Undefined!6223)))

(declare-fun b!597793 () Bool)

(assert (=> b!597793 (= e!341625 (MissingVacant!6223 vacantSpotIndex!68))))

(declare-fun b!597794 () Bool)

(declare-fun c!67701 () Bool)

(assert (=> b!597794 (= c!67701 (= lt!271580 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!597794 (= e!341624 e!341625)))

(declare-fun b!597795 () Bool)

(assert (=> b!597795 (= e!341623 e!341624)))

(declare-fun c!67700 () Bool)

(assert (=> b!597795 (= c!67700 (= lt!271580 lt!271481))))

(assert (= (and d!86919 c!67699) b!597792))

(assert (= (and d!86919 (not c!67699)) b!597795))

(assert (= (and b!597795 c!67700) b!597791))

(assert (= (and b!597795 (not c!67700)) b!597794))

(assert (= (and b!597794 c!67701) b!597793))

(assert (= (and b!597794 (not c!67701)) b!597790))

(declare-fun m!575179 () Bool)

(assert (=> d!86919 m!575179))

(declare-fun m!575181 () Bool)

(assert (=> d!86919 m!575181))

(declare-fun m!575183 () Bool)

(assert (=> d!86919 m!575183))

(assert (=> d!86919 m!574937))

(assert (=> b!597790 m!574919))

(assert (=> b!597790 m!574919))

(declare-fun m!575185 () Bool)

(assert (=> b!597790 m!575185))

(assert (=> b!597527 d!86919))

(declare-fun lt!271583 () SeekEntryResult!6223)

(declare-fun d!86921 () Bool)

(assert (=> d!86921 (and (or (is-Undefined!6223 lt!271583) (not (is-Found!6223 lt!271583)) (and (bvsge (index!27144 lt!271583) #b00000000000000000000000000000000) (bvslt (index!27144 lt!271583) (size!18147 lt!271483)))) (or (is-Undefined!6223 lt!271583) (is-Found!6223 lt!271583) (not (is-MissingVacant!6223 lt!271583)) (not (= (index!27146 lt!271583) vacantSpotIndex!68)) (and (bvsge (index!27146 lt!271583) #b00000000000000000000000000000000) (bvslt (index!27146 lt!271583) (size!18147 lt!271483)))) (or (is-Undefined!6223 lt!271583) (ite (is-Found!6223 lt!271583) (= (select (arr!17783 lt!271483) (index!27144 lt!271583)) lt!271481) (and (is-MissingVacant!6223 lt!271583) (= (index!27146 lt!271583) vacantSpotIndex!68) (= (select (arr!17783 lt!271483) (index!27146 lt!271583)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!341626 () SeekEntryResult!6223)

(assert (=> d!86921 (= lt!271583 e!341626)))

(declare-fun c!67702 () Bool)

(assert (=> d!86921 (= c!67702 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!271582 () (_ BitVec 64))

(assert (=> d!86921 (= lt!271582 (select (arr!17783 lt!271483) lt!271473))))

(assert (=> d!86921 (validMask!0 mask!3053)))

