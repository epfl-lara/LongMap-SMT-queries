; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53992 () Bool)

(assert start!53992)

(declare-fun b!589908 () Bool)

(declare-datatypes ((Unit!18442 0))(
  ( (Unit!18443) )
))
(declare-fun e!336770 () Unit!18442)

(declare-fun Unit!18444 () Unit!18442)

(assert (=> b!589908 (= e!336770 Unit!18444)))

(declare-fun b!589909 () Bool)

(declare-fun Unit!18445 () Unit!18442)

(assert (=> b!589909 (= e!336770 Unit!18445)))

(assert (=> b!589909 false))

(declare-fun b!589910 () Bool)

(declare-fun e!336774 () Bool)

(declare-fun e!336773 () Bool)

(assert (=> b!589910 (= e!336774 e!336773)))

(declare-fun res!377371 () Bool)

(assert (=> b!589910 (=> (not res!377371) (not e!336773))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!36836 0))(
  ( (array!36837 (arr!17691 (Array (_ BitVec 32) (_ BitVec 64))) (size!18055 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36836)

(assert (=> b!589910 (= res!377371 (= (select (store (arr!17691 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!267618 () array!36836)

(assert (=> b!589910 (= lt!267618 (array!36837 (store (arr!17691 a!2986) i!1108 k!1786) (size!18055 a!2986)))))

(declare-fun b!589911 () Bool)

(declare-fun res!377372 () Bool)

(declare-fun e!336769 () Bool)

(assert (=> b!589911 (=> (not res!377372) (not e!336769))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!589911 (= res!377372 (and (= (size!18055 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18055 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18055 a!2986)) (not (= i!1108 j!136))))))

(declare-fun e!336767 () Bool)

(declare-fun lt!267614 () (_ BitVec 64))

(declare-fun b!589912 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!589912 (= e!336767 (or (not (= (select (arr!17691 a!2986) j!136) lt!267614)) (not (= (select (arr!17691 a!2986) j!136) (select (store (arr!17691 a!2986) i!1108 k!1786) index!984))) (bvsge j!136 index!984) (bvslt (size!18055 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!589912 (= (select (store (arr!17691 a!2986) i!1108 k!1786) index!984) (select (arr!17691 a!2986) j!136))))

(declare-fun b!589913 () Bool)

(declare-fun e!336768 () Bool)

(assert (=> b!589913 (= e!336773 e!336768)))

(declare-fun res!377369 () Bool)

(assert (=> b!589913 (=> (not res!377369) (not e!336768))))

(declare-datatypes ((SeekEntryResult!6131 0))(
  ( (MissingZero!6131 (index!26754 (_ BitVec 32))) (Found!6131 (index!26755 (_ BitVec 32))) (Intermediate!6131 (undefined!6943 Bool) (index!26756 (_ BitVec 32)) (x!55545 (_ BitVec 32))) (Undefined!6131) (MissingVacant!6131 (index!26757 (_ BitVec 32))) )
))
(declare-fun lt!267612 () SeekEntryResult!6131)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!589913 (= res!377369 (and (= lt!267612 (Found!6131 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17691 a!2986) index!984) (select (arr!17691 a!2986) j!136))) (not (= (select (arr!17691 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36836 (_ BitVec 32)) SeekEntryResult!6131)

(assert (=> b!589913 (= lt!267612 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17691 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!377362 () Bool)

(assert (=> start!53992 (=> (not res!377362) (not e!336769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53992 (= res!377362 (validMask!0 mask!3053))))

(assert (=> start!53992 e!336769))

(assert (=> start!53992 true))

(declare-fun array_inv!13487 (array!36836) Bool)

(assert (=> start!53992 (array_inv!13487 a!2986)))

(declare-fun b!589914 () Bool)

(declare-fun res!377366 () Bool)

(assert (=> b!589914 (=> (not res!377366) (not e!336774))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36836 (_ BitVec 32)) Bool)

(assert (=> b!589914 (= res!377366 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!589915 () Bool)

(declare-fun res!377360 () Bool)

(assert (=> b!589915 (=> (not res!377360) (not e!336769))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!589915 (= res!377360 (validKeyInArray!0 (select (arr!17691 a!2986) j!136)))))

(declare-fun b!589916 () Bool)

(declare-fun res!377370 () Bool)

(assert (=> b!589916 (=> (not res!377370) (not e!336774))))

(assert (=> b!589916 (= res!377370 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17691 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!589917 () Bool)

(declare-fun res!377368 () Bool)

(assert (=> b!589917 (=> (not res!377368) (not e!336769))))

(declare-fun arrayContainsKey!0 (array!36836 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!589917 (= res!377368 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!589918 () Bool)

(assert (=> b!589918 (= e!336769 e!336774)))

(declare-fun res!377367 () Bool)

(assert (=> b!589918 (=> (not res!377367) (not e!336774))))

(declare-fun lt!267611 () SeekEntryResult!6131)

(assert (=> b!589918 (= res!377367 (or (= lt!267611 (MissingZero!6131 i!1108)) (= lt!267611 (MissingVacant!6131 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36836 (_ BitVec 32)) SeekEntryResult!6131)

(assert (=> b!589918 (= lt!267611 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!589919 () Bool)

(declare-fun e!336772 () Bool)

(declare-fun lt!267613 () SeekEntryResult!6131)

(assert (=> b!589919 (= e!336772 (= lt!267612 lt!267613))))

(declare-fun b!589920 () Bool)

(assert (=> b!589920 (= e!336768 (not e!336767))))

(declare-fun res!377364 () Bool)

(assert (=> b!589920 (=> res!377364 e!336767)))

(declare-fun lt!267615 () SeekEntryResult!6131)

(assert (=> b!589920 (= res!377364 (not (= lt!267615 (Found!6131 index!984))))))

(declare-fun lt!267617 () Unit!18442)

(assert (=> b!589920 (= lt!267617 e!336770)))

(declare-fun c!66641 () Bool)

(assert (=> b!589920 (= c!66641 (= lt!267615 Undefined!6131))))

(assert (=> b!589920 (= lt!267615 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267614 lt!267618 mask!3053))))

(assert (=> b!589920 e!336772))

(declare-fun res!377365 () Bool)

(assert (=> b!589920 (=> (not res!377365) (not e!336772))))

(declare-fun lt!267619 () (_ BitVec 32))

(assert (=> b!589920 (= res!377365 (= lt!267613 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267619 vacantSpotIndex!68 lt!267614 lt!267618 mask!3053)))))

(assert (=> b!589920 (= lt!267613 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267619 vacantSpotIndex!68 (select (arr!17691 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!589920 (= lt!267614 (select (store (arr!17691 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!267616 () Unit!18442)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36836 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18442)

(assert (=> b!589920 (= lt!267616 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267619 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!589920 (= lt!267619 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!589921 () Bool)

(declare-fun res!377361 () Bool)

(assert (=> b!589921 (=> (not res!377361) (not e!336769))))

(assert (=> b!589921 (= res!377361 (validKeyInArray!0 k!1786))))

(declare-fun b!589922 () Bool)

(declare-fun res!377363 () Bool)

(assert (=> b!589922 (=> (not res!377363) (not e!336774))))

(declare-datatypes ((List!11732 0))(
  ( (Nil!11729) (Cons!11728 (h!12773 (_ BitVec 64)) (t!17960 List!11732)) )
))
(declare-fun arrayNoDuplicates!0 (array!36836 (_ BitVec 32) List!11732) Bool)

(assert (=> b!589922 (= res!377363 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11729))))

(assert (= (and start!53992 res!377362) b!589911))

(assert (= (and b!589911 res!377372) b!589915))

(assert (= (and b!589915 res!377360) b!589921))

(assert (= (and b!589921 res!377361) b!589917))

(assert (= (and b!589917 res!377368) b!589918))

(assert (= (and b!589918 res!377367) b!589914))

(assert (= (and b!589914 res!377366) b!589922))

(assert (= (and b!589922 res!377363) b!589916))

(assert (= (and b!589916 res!377370) b!589910))

(assert (= (and b!589910 res!377371) b!589913))

(assert (= (and b!589913 res!377369) b!589920))

(assert (= (and b!589920 res!377365) b!589919))

(assert (= (and b!589920 c!66641) b!589909))

(assert (= (and b!589920 (not c!66641)) b!589908))

(assert (= (and b!589920 (not res!377364)) b!589912))

(declare-fun m!568405 () Bool)

(assert (=> b!589914 m!568405))

(declare-fun m!568407 () Bool)

(assert (=> b!589918 m!568407))

(declare-fun m!568409 () Bool)

(assert (=> b!589920 m!568409))

(declare-fun m!568411 () Bool)

(assert (=> b!589920 m!568411))

(declare-fun m!568413 () Bool)

(assert (=> b!589920 m!568413))

(declare-fun m!568415 () Bool)

(assert (=> b!589920 m!568415))

(assert (=> b!589920 m!568413))

(declare-fun m!568417 () Bool)

(assert (=> b!589920 m!568417))

(declare-fun m!568419 () Bool)

(assert (=> b!589920 m!568419))

(declare-fun m!568421 () Bool)

(assert (=> b!589920 m!568421))

(declare-fun m!568423 () Bool)

(assert (=> b!589920 m!568423))

(assert (=> b!589910 m!568415))

(declare-fun m!568425 () Bool)

(assert (=> b!589910 m!568425))

(assert (=> b!589912 m!568413))

(assert (=> b!589912 m!568415))

(declare-fun m!568427 () Bool)

(assert (=> b!589912 m!568427))

(declare-fun m!568429 () Bool)

(assert (=> b!589916 m!568429))

(assert (=> b!589915 m!568413))

(assert (=> b!589915 m!568413))

(declare-fun m!568431 () Bool)

(assert (=> b!589915 m!568431))

(declare-fun m!568433 () Bool)

(assert (=> b!589913 m!568433))

(assert (=> b!589913 m!568413))

(assert (=> b!589913 m!568413))

(declare-fun m!568435 () Bool)

(assert (=> b!589913 m!568435))

(declare-fun m!568437 () Bool)

(assert (=> b!589922 m!568437))

(declare-fun m!568439 () Bool)

(assert (=> start!53992 m!568439))

(declare-fun m!568441 () Bool)

(assert (=> start!53992 m!568441))

(declare-fun m!568443 () Bool)

(assert (=> b!589921 m!568443))

(declare-fun m!568445 () Bool)

(assert (=> b!589917 m!568445))

(push 1)

(assert (not b!589921))

(assert (not start!53992))

(assert (not b!589917))

(assert (not b!589918))

(assert (not b!589915))

(assert (not b!589913))

(assert (not b!589922))

(assert (not b!589920))

(assert (not b!589914))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86035 () Bool)

(declare-fun lt!267701 () SeekEntryResult!6131)

(assert (=> d!86035 (and (or (is-Undefined!6131 lt!267701) (not (is-Found!6131 lt!267701)) (and (bvsge (index!26755 lt!267701) #b00000000000000000000000000000000) (bvslt (index!26755 lt!267701) (size!18055 a!2986)))) (or (is-Undefined!6131 lt!267701) (is-Found!6131 lt!267701) (not (is-MissingVacant!6131 lt!267701)) (not (= (index!26757 lt!267701) vacantSpotIndex!68)) (and (bvsge (index!26757 lt!267701) #b00000000000000000000000000000000) (bvslt (index!26757 lt!267701) (size!18055 a!2986)))) (or (is-Undefined!6131 lt!267701) (ite (is-Found!6131 lt!267701) (= (select (arr!17691 a!2986) (index!26755 lt!267701)) (select (arr!17691 a!2986) j!136)) (and (is-MissingVacant!6131 lt!267701) (= (index!26757 lt!267701) vacantSpotIndex!68) (= (select (arr!17691 a!2986) (index!26757 lt!267701)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!336853 () SeekEntryResult!6131)

(assert (=> d!86035 (= lt!267701 e!336853)))

(declare-fun c!66672 () Bool)

(assert (=> d!86035 (= c!66672 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!267700 () (_ BitVec 64))

(assert (=> d!86035 (= lt!267700 (select (arr!17691 a!2986) index!984))))

(assert (=> d!86035 (validMask!0 mask!3053)))

(assert (=> d!86035 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17691 a!2986) j!136) a!2986 mask!3053) lt!267701)))

(declare-fun b!590066 () Bool)

(declare-fun e!336854 () SeekEntryResult!6131)

(assert (=> b!590066 (= e!336854 (Found!6131 index!984))))

(declare-fun b!590067 () Bool)

(assert (=> b!590067 (= e!336853 Undefined!6131)))

(declare-fun b!590068 () Bool)

(declare-fun c!66673 () Bool)

(assert (=> b!590068 (= c!66673 (= lt!267700 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!336855 () SeekEntryResult!6131)

(assert (=> b!590068 (= e!336854 e!336855)))

(declare-fun b!590069 () Bool)

(assert (=> b!590069 (= e!336855 (MissingVacant!6131 vacantSpotIndex!68))))

(declare-fun b!590070 () Bool)

(assert (=> b!590070 (= e!336853 e!336854)))

(declare-fun c!66671 () Bool)

(assert (=> b!590070 (= c!66671 (= lt!267700 (select (arr!17691 a!2986) j!136)))))

(declare-fun b!590071 () Bool)

(assert (=> b!590071 (= e!336855 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17691 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!86035 c!66672) b!590067))

(assert (= (and d!86035 (not c!66672)) b!590070))

(assert (= (and b!590070 c!66671) b!590066))

(assert (= (and b!590070 (not c!66671)) b!590068))

(assert (= (and b!590068 c!66673) b!590069))

(assert (= (and b!590068 (not c!66673)) b!590071))

(declare-fun m!568563 () Bool)

(assert (=> d!86035 m!568563))

(declare-fun m!568565 () Bool)

(assert (=> d!86035 m!568565))

(assert (=> d!86035 m!568433))

(assert (=> d!86035 m!568439))

(assert (=> b!590071 m!568409))

(assert (=> b!590071 m!568409))

(assert (=> b!590071 m!568413))

(declare-fun m!568567 () Bool)

(assert (=> b!590071 m!568567))

(assert (=> b!589913 d!86035))

(declare-fun lt!267717 () SeekEntryResult!6131)

(declare-fun e!336888 () SeekEntryResult!6131)

(declare-fun b!590121 () Bool)

(assert (=> b!590121 (= e!336888 (seekKeyOrZeroReturnVacant!0 (x!55545 lt!267717) (index!26756 lt!267717) (index!26756 lt!267717) k!1786 a!2986 mask!3053))))

(declare-fun b!590122 () Bool)

(declare-fun e!336887 () SeekEntryResult!6131)

(assert (=> b!590122 (= e!336887 Undefined!6131)))

(declare-fun d!86047 () Bool)

(declare-fun lt!267718 () SeekEntryResult!6131)

(assert (=> d!86047 (and (or (is-Undefined!6131 lt!267718) (not (is-Found!6131 lt!267718)) (and (bvsge (index!26755 lt!267718) #b00000000000000000000000000000000) (bvslt (index!26755 lt!267718) (size!18055 a!2986)))) (or (is-Undefined!6131 lt!267718) (is-Found!6131 lt!267718) (not (is-MissingZero!6131 lt!267718)) (and (bvsge (index!26754 lt!267718) #b00000000000000000000000000000000) (bvslt (index!26754 lt!267718) (size!18055 a!2986)))) (or (is-Undefined!6131 lt!267718) (is-Found!6131 lt!267718) (is-MissingZero!6131 lt!267718) (not (is-MissingVacant!6131 lt!267718)) (and (bvsge (index!26757 lt!267718) #b00000000000000000000000000000000) (bvslt (index!26757 lt!267718) (size!18055 a!2986)))) (or (is-Undefined!6131 lt!267718) (ite (is-Found!6131 lt!267718) (= (select (arr!17691 a!2986) (index!26755 lt!267718)) k!1786) (ite (is-MissingZero!6131 lt!267718) (= (select (arr!17691 a!2986) (index!26754 lt!267718)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6131 lt!267718) (= (select (arr!17691 a!2986) (index!26757 lt!267718)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!86047 (= lt!267718 e!336887)))

(declare-fun c!66693 () Bool)

(assert (=> d!86047 (= c!66693 (and (is-Intermediate!6131 lt!267717) (undefined!6943 lt!267717)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36836 (_ BitVec 32)) SeekEntryResult!6131)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86047 (= lt!267717 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!86047 (validMask!0 mask!3053)))

(assert (=> d!86047 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!267718)))

(declare-fun b!590123 () Bool)

(assert (=> b!590123 (= e!336888 (MissingZero!6131 (index!26756 lt!267717)))))

(declare-fun b!590124 () Bool)

(declare-fun c!66695 () Bool)

(declare-fun lt!267719 () (_ BitVec 64))

(assert (=> b!590124 (= c!66695 (= lt!267719 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!336886 () SeekEntryResult!6131)

(assert (=> b!590124 (= e!336886 e!336888)))

(declare-fun b!590125 () Bool)

(assert (=> b!590125 (= e!336886 (Found!6131 (index!26756 lt!267717)))))

(declare-fun b!590126 () Bool)

(assert (=> b!590126 (= e!336887 e!336886)))

(assert (=> b!590126 (= lt!267719 (select (arr!17691 a!2986) (index!26756 lt!267717)))))

(declare-fun c!66694 () Bool)

(assert (=> b!590126 (= c!66694 (= lt!267719 k!1786))))

(assert (= (and d!86047 c!66693) b!590122))

(assert (= (and d!86047 (not c!66693)) b!590126))

(assert (= (and b!590126 c!66694) b!590125))

(assert (= (and b!590126 (not c!66694)) b!590124))

(assert (= (and b!590124 c!66695) b!590123))

(assert (= (and b!590124 (not c!66695)) b!590121))

(declare-fun m!568591 () Bool)

(assert (=> b!590121 m!568591))

(declare-fun m!568593 () Bool)

(assert (=> d!86047 m!568593))

(declare-fun m!568595 () Bool)

(assert (=> d!86047 m!568595))

(declare-fun m!568597 () Bool)

(assert (=> d!86047 m!568597))

(assert (=> d!86047 m!568595))

(declare-fun m!568599 () Bool)

(assert (=> d!86047 m!568599))

(assert (=> d!86047 m!568439))

(declare-fun m!568601 () Bool)

(assert (=> d!86047 m!568601))

(declare-fun m!568603 () Bool)

(assert (=> b!590126 m!568603))

(assert (=> b!589918 d!86047))

(declare-fun b!590171 () Bool)

(declare-fun e!336915 () Bool)

(declare-fun e!336913 () Bool)

(assert (=> b!590171 (= e!336915 e!336913)))

(declare-fun c!66716 () Bool)

(assert (=> b!590171 (= c!66716 (validKeyInArray!0 (select (arr!17691 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!86055 () Bool)

(declare-fun res!377474 () Bool)

(assert (=> d!86055 (=> res!377474 e!336915)))

(assert (=> d!86055 (= res!377474 (bvsge #b00000000000000000000000000000000 (size!18055 a!2986)))))

(assert (=> d!86055 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!336915)))

(declare-fun b!590172 () Bool)

(declare-fun e!336914 () Bool)

(assert (=> b!590172 (= e!336913 e!336914)))

(declare-fun lt!267744 () (_ BitVec 64))

(assert (=> b!590172 (= lt!267744 (select (arr!17691 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!267743 () Unit!18442)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!36836 (_ BitVec 64) (_ BitVec 32)) Unit!18442)

(assert (=> b!590172 (= lt!267743 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!267744 #b00000000000000000000000000000000))))

(assert (=> b!590172 (arrayContainsKey!0 a!2986 lt!267744 #b00000000000000000000000000000000)))

(declare-fun lt!267745 () Unit!18442)

(assert (=> b!590172 (= lt!267745 lt!267743)))

(declare-fun res!377473 () Bool)

(assert (=> b!590172 (= res!377473 (= (seekEntryOrOpen!0 (select (arr!17691 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6131 #b00000000000000000000000000000000)))))

(assert (=> b!590172 (=> (not res!377473) (not e!336914))))

(declare-fun bm!32801 () Bool)

(declare-fun call!32804 () Bool)

(assert (=> bm!32801 (= call!32804 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!590173 () Bool)

(assert (=> b!590173 (= e!336913 call!32804)))

(declare-fun b!590174 () Bool)

(assert (=> b!590174 (= e!336914 call!32804)))

(assert (= (and d!86055 (not res!377474)) b!590171))

(assert (= (and b!590171 c!66716) b!590172))

(assert (= (and b!590171 (not c!66716)) b!590173))

(assert (= (and b!590172 res!377473) b!590174))

(assert (= (or b!590174 b!590173) bm!32801))

(declare-fun m!568625 () Bool)

(assert (=> b!590171 m!568625))

(assert (=> b!590171 m!568625))

(declare-fun m!568627 () Bool)

(assert (=> b!590171 m!568627))

(assert (=> b!590172 m!568625))

(declare-fun m!568629 () Bool)

(assert (=> b!590172 m!568629))

(declare-fun m!568631 () Bool)

(assert (=> b!590172 m!568631))

(assert (=> b!590172 m!568625))

(declare-fun m!568633 () Bool)

(assert (=> b!590172 m!568633))

(declare-fun m!568635 () Bool)

(assert (=> bm!32801 m!568635))

(assert (=> b!589914 d!86055))

(declare-fun d!86061 () Bool)

(assert (=> d!86061 (= (validKeyInArray!0 (select (arr!17691 a!2986) j!136)) (and (not (= (select (arr!17691 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17691 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!589915 d!86061))

(declare-fun d!86063 () Bool)

(declare-fun e!336936 () Bool)

(assert (=> d!86063 e!336936))

(declare-fun res!377483 () Bool)

(assert (=> d!86063 (=> (not res!377483) (not e!336936))))

(assert (=> d!86063 (= res!377483 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18055 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18055 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18055 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18055 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18055 a!2986))))))

(declare-fun lt!267760 () Unit!18442)

(declare-fun choose!9 (array!36836 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18442)

(assert (=> d!86063 (= lt!267760 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267619 vacantSpotIndex!68 mask!3053))))

(assert (=> d!86063 (validMask!0 mask!3053)))

(assert (=> d!86063 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267619 vacantSpotIndex!68 mask!3053) lt!267760)))

(declare-fun b!590207 () Bool)

(assert (=> b!590207 (= e!336936 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267619 vacantSpotIndex!68 (select (arr!17691 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267619 vacantSpotIndex!68 (select (store (arr!17691 a!2986) i!1108 k!1786) j!136) (array!36837 (store (arr!17691 a!2986) i!1108 k!1786) (size!18055 a!2986)) mask!3053)))))

(assert (= (and d!86063 res!377483) b!590207))

(declare-fun m!568681 () Bool)

(assert (=> d!86063 m!568681))

(assert (=> d!86063 m!568439))

(assert (=> b!590207 m!568411))

(declare-fun m!568683 () Bool)

(assert (=> b!590207 m!568683))

(assert (=> b!590207 m!568413))

(assert (=> b!590207 m!568413))

(assert (=> b!590207 m!568417))

(assert (=> b!590207 m!568415))

(assert (=> b!590207 m!568411))

(assert (=> b!589920 d!86063))

(declare-fun d!86079 () Bool)

(declare-fun lt!267763 () (_ BitVec 32))

(assert (=> d!86079 (and (bvsge lt!267763 #b00000000000000000000000000000000) (bvslt lt!267763 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86079 (= lt!267763 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!86079 (validMask!0 mask!3053)))

(assert (=> d!86079 (= (nextIndex!0 index!984 x!910 mask!3053) lt!267763)))

(declare-fun bs!18249 () Bool)

(assert (= bs!18249 d!86079))

(declare-fun m!568685 () Bool)

(assert (=> bs!18249 m!568685))

(assert (=> bs!18249 m!568439))

(assert (=> b!589920 d!86079))

(declare-fun d!86081 () Bool)

(declare-fun lt!267765 () SeekEntryResult!6131)

(assert (=> d!86081 (and (or (is-Undefined!6131 lt!267765) (not (is-Found!6131 lt!267765)) (and (bvsge (index!26755 lt!267765) #b00000000000000000000000000000000) (bvslt (index!26755 lt!267765) (size!18055 lt!267618)))) (or (is-Undefined!6131 lt!267765) (is-Found!6131 lt!267765) (not (is-MissingVacant!6131 lt!267765)) (not (= (index!26757 lt!267765) vacantSpotIndex!68)) (and (bvsge (index!26757 lt!267765) #b00000000000000000000000000000000) (bvslt (index!26757 lt!267765) (size!18055 lt!267618)))) (or (is-Undefined!6131 lt!267765) (ite (is-Found!6131 lt!267765) (= (select (arr!17691 lt!267618) (index!26755 lt!267765)) lt!267614) (and (is-MissingVacant!6131 lt!267765) (= (index!26757 lt!267765) vacantSpotIndex!68) (= (select (arr!17691 lt!267618) (index!26757 lt!267765)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!336937 () SeekEntryResult!6131)

(assert (=> d!86081 (= lt!267765 e!336937)))

(declare-fun c!66730 () Bool)

(assert (=> d!86081 (= c!66730 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!267764 () (_ BitVec 64))

(assert (=> d!86081 (= lt!267764 (select (arr!17691 lt!267618) lt!267619))))

(assert (=> d!86081 (validMask!0 mask!3053)))

(assert (=> d!86081 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267619 vacantSpotIndex!68 lt!267614 lt!267618 mask!3053) lt!267765)))

(declare-fun b!590208 () Bool)

(declare-fun e!336938 () SeekEntryResult!6131)

(assert (=> b!590208 (= e!336938 (Found!6131 lt!267619))))

(declare-fun b!590209 () Bool)

(assert (=> b!590209 (= e!336937 Undefined!6131)))

(declare-fun b!590210 () Bool)

(declare-fun c!66731 () Bool)

(assert (=> b!590210 (= c!66731 (= lt!267764 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!336939 () SeekEntryResult!6131)

(assert (=> b!590210 (= e!336938 e!336939)))

(declare-fun b!590211 () Bool)

(assert (=> b!590211 (= e!336939 (MissingVacant!6131 vacantSpotIndex!68))))

(declare-fun b!590212 () Bool)

(assert (=> b!590212 (= e!336937 e!336938)))

(declare-fun c!66729 () Bool)

(assert (=> b!590212 (= c!66729 (= lt!267764 lt!267614))))

(declare-fun b!590213 () Bool)

(assert (=> b!590213 (= e!336939 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!267619 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!267614 lt!267618 mask!3053))))

(assert (= (and d!86081 c!66730) b!590209))

(assert (= (and d!86081 (not c!66730)) b!590212))

(assert (= (and b!590212 c!66729) b!590208))

(assert (= (and b!590212 (not c!66729)) b!590210))

(assert (= (and b!590210 c!66731) b!590211))

(assert (= (and b!590210 (not c!66731)) b!590213))

(declare-fun m!568687 () Bool)

(assert (=> d!86081 m!568687))

(declare-fun m!568689 () Bool)

(assert (=> d!86081 m!568689))

(declare-fun m!568691 () Bool)

(assert (=> d!86081 m!568691))

(assert (=> d!86081 m!568439))

(declare-fun m!568693 () Bool)

(assert (=> b!590213 m!568693))

(assert (=> b!590213 m!568693))

(declare-fun m!568695 () Bool)

(assert (=> b!590213 m!568695))

(assert (=> b!589920 d!86081))

(declare-fun d!86083 () Bool)

(declare-fun lt!267767 () SeekEntryResult!6131)

(assert (=> d!86083 (and (or (is-Undefined!6131 lt!267767) (not (is-Found!6131 lt!267767)) (and (bvsge (index!26755 lt!267767) #b00000000000000000000000000000000) (bvslt (index!26755 lt!267767) (size!18055 lt!267618)))) (or (is-Undefined!6131 lt!267767) (is-Found!6131 lt!267767) (not (is-MissingVacant!6131 lt!267767)) (not (= (index!26757 lt!267767) vacantSpotIndex!68)) (and (bvsge (index!26757 lt!267767) #b00000000000000000000000000000000) (bvslt (index!26757 lt!267767) (size!18055 lt!267618)))) (or (is-Undefined!6131 lt!267767) (ite (is-Found!6131 lt!267767) (= (select (arr!17691 lt!267618) (index!26755 lt!267767)) lt!267614) (and (is-MissingVacant!6131 lt!267767) (= (index!26757 lt!267767) vacantSpotIndex!68) (= (select (arr!17691 lt!267618) (index!26757 lt!267767)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!336940 () SeekEntryResult!6131)

(assert (=> d!86083 (= lt!267767 e!336940)))

(declare-fun c!66733 () Bool)

(assert (=> d!86083 (= c!66733 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!267766 () (_ BitVec 64))

(assert (=> d!86083 (= lt!267766 (select (arr!17691 lt!267618) index!984))))

(assert (=> d!86083 (validMask!0 mask!3053)))

