; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54606 () Bool)

(assert start!54606)

(declare-fun b!596760 () Bool)

(declare-fun res!382439 () Bool)

(declare-fun e!340966 () Bool)

(assert (=> b!596760 (=> (not res!382439) (not e!340966))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!596760 (= res!382439 (validKeyInArray!0 k0!1786))))

(declare-fun b!596761 () Bool)

(declare-datatypes ((Unit!18745 0))(
  ( (Unit!18746) )
))
(declare-fun e!340969 () Unit!18745)

(declare-fun Unit!18747 () Unit!18745)

(assert (=> b!596761 (= e!340969 Unit!18747)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!340967 () Bool)

(declare-datatypes ((array!37011 0))(
  ( (array!37012 (arr!17767 (Array (_ BitVec 32) (_ BitVec 64))) (size!18131 (_ BitVec 32))) )
))
(declare-fun lt!271057 () array!37011)

(declare-fun b!596762 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37011)

(declare-fun arrayContainsKey!0 (array!37011 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!596762 (= e!340967 (arrayContainsKey!0 lt!271057 (select (arr!17767 a!2986) j!136) index!984))))

(declare-fun b!596763 () Bool)

(declare-fun res!382446 () Bool)

(declare-fun e!340971 () Bool)

(assert (=> b!596763 (=> res!382446 e!340971)))

(declare-datatypes ((List!11715 0))(
  ( (Nil!11712) (Cons!11711 (h!12759 (_ BitVec 64)) (t!17935 List!11715)) )
))
(declare-fun contains!2924 (List!11715 (_ BitVec 64)) Bool)

(assert (=> b!596763 (= res!382446 (contains!2924 Nil!11712 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!596764 () Bool)

(declare-fun res!382449 () Bool)

(declare-fun e!340964 () Bool)

(assert (=> b!596764 (=> (not res!382449) (not e!340964))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37011 (_ BitVec 32)) Bool)

(assert (=> b!596764 (= res!382449 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!596765 () Bool)

(declare-fun e!340962 () Bool)

(declare-datatypes ((SeekEntryResult!6163 0))(
  ( (MissingZero!6163 (index!26900 (_ BitVec 32))) (Found!6163 (index!26901 (_ BitVec 32))) (Intermediate!6163 (undefined!6975 Bool) (index!26902 (_ BitVec 32)) (x!55850 (_ BitVec 32))) (Undefined!6163) (MissingVacant!6163 (index!26903 (_ BitVec 32))) )
))
(declare-fun lt!271052 () SeekEntryResult!6163)

(declare-fun lt!271055 () SeekEntryResult!6163)

(assert (=> b!596765 (= e!340962 (= lt!271052 lt!271055))))

(declare-fun b!596766 () Bool)

(declare-fun e!340961 () Bool)

(declare-fun e!340963 () Bool)

(assert (=> b!596766 (= e!340961 e!340963)))

(declare-fun res!382448 () Bool)

(assert (=> b!596766 (=> res!382448 e!340963)))

(declare-fun lt!271063 () (_ BitVec 64))

(declare-fun lt!271058 () (_ BitVec 64))

(assert (=> b!596766 (= res!382448 (or (not (= (select (arr!17767 a!2986) j!136) lt!271058)) (not (= (select (arr!17767 a!2986) j!136) lt!271063)) (bvsge j!136 index!984)))))

(declare-fun b!596767 () Bool)

(declare-fun res!382435 () Bool)

(assert (=> b!596767 (=> (not res!382435) (not e!340964))))

(declare-fun arrayNoDuplicates!0 (array!37011 (_ BitVec 32) List!11715) Bool)

(assert (=> b!596767 (= res!382435 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11712))))

(declare-fun b!596768 () Bool)

(assert (=> b!596768 (= e!340963 e!340967)))

(declare-fun res!382442 () Bool)

(assert (=> b!596768 (=> (not res!382442) (not e!340967))))

(assert (=> b!596768 (= res!382442 (arrayContainsKey!0 lt!271057 (select (arr!17767 a!2986) j!136) j!136))))

(declare-fun res!382440 () Bool)

(assert (=> start!54606 (=> (not res!382440) (not e!340966))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54606 (= res!382440 (validMask!0 mask!3053))))

(assert (=> start!54606 e!340966))

(assert (=> start!54606 true))

(declare-fun array_inv!13626 (array!37011) Bool)

(assert (=> start!54606 (array_inv!13626 a!2986)))

(declare-fun b!596769 () Bool)

(assert (=> b!596769 (= e!340966 e!340964)))

(declare-fun res!382436 () Bool)

(assert (=> b!596769 (=> (not res!382436) (not e!340964))))

(declare-fun lt!271054 () SeekEntryResult!6163)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!596769 (= res!382436 (or (= lt!271054 (MissingZero!6163 i!1108)) (= lt!271054 (MissingVacant!6163 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37011 (_ BitVec 32)) SeekEntryResult!6163)

(assert (=> b!596769 (= lt!271054 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!596770 () Bool)

(declare-fun e!340965 () Bool)

(declare-fun e!340970 () Bool)

(assert (=> b!596770 (= e!340965 e!340970)))

(declare-fun res!382451 () Bool)

(assert (=> b!596770 (=> (not res!382451) (not e!340970))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!596770 (= res!382451 (and (= lt!271052 (Found!6163 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17767 a!2986) index!984) (select (arr!17767 a!2986) j!136))) (not (= (select (arr!17767 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37011 (_ BitVec 32)) SeekEntryResult!6163)

(assert (=> b!596770 (= lt!271052 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17767 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!596771 () Bool)

(assert (=> b!596771 (= e!340964 e!340965)))

(declare-fun res!382447 () Bool)

(assert (=> b!596771 (=> (not res!382447) (not e!340965))))

(assert (=> b!596771 (= res!382447 (= (select (store (arr!17767 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!596771 (= lt!271057 (array!37012 (store (arr!17767 a!2986) i!1108 k0!1786) (size!18131 a!2986)))))

(declare-fun b!596772 () Bool)

(declare-fun res!382441 () Bool)

(assert (=> b!596772 (=> res!382441 e!340971)))

(assert (=> b!596772 (= res!382441 (contains!2924 Nil!11712 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!596773 () Bool)

(declare-fun Unit!18748 () Unit!18745)

(assert (=> b!596773 (= e!340969 Unit!18748)))

(assert (=> b!596773 false))

(declare-fun b!596774 () Bool)

(assert (=> b!596774 (= e!340971 true)))

(declare-fun lt!271056 () Bool)

(assert (=> b!596774 (= lt!271056 (contains!2924 Nil!11712 k0!1786))))

(declare-fun b!596775 () Bool)

(declare-fun res!382452 () Bool)

(assert (=> b!596775 (=> res!382452 e!340971)))

(declare-fun noDuplicate!271 (List!11715) Bool)

(assert (=> b!596775 (= res!382452 (not (noDuplicate!271 Nil!11712)))))

(declare-fun b!596776 () Bool)

(declare-fun res!382443 () Bool)

(assert (=> b!596776 (=> (not res!382443) (not e!340966))))

(assert (=> b!596776 (= res!382443 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!596777 () Bool)

(declare-fun e!340968 () Bool)

(assert (=> b!596777 (= e!340968 e!340971)))

(declare-fun res!382450 () Bool)

(assert (=> b!596777 (=> res!382450 e!340971)))

(assert (=> b!596777 (= res!382450 (or (bvsge (size!18131 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18131 a!2986))))))

(assert (=> b!596777 (arrayContainsKey!0 lt!271057 (select (arr!17767 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271060 () Unit!18745)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37011 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18745)

(assert (=> b!596777 (= lt!271060 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271057 (select (arr!17767 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!596778 () Bool)

(declare-fun res!382434 () Bool)

(assert (=> b!596778 (=> (not res!382434) (not e!340966))))

(assert (=> b!596778 (= res!382434 (and (= (size!18131 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18131 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18131 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!596779 () Bool)

(declare-fun e!340960 () Bool)

(assert (=> b!596779 (= e!340970 (not e!340960))))

(declare-fun res!382444 () Bool)

(assert (=> b!596779 (=> res!382444 e!340960)))

(declare-fun lt!271053 () SeekEntryResult!6163)

(assert (=> b!596779 (= res!382444 (not (= lt!271053 (Found!6163 index!984))))))

(declare-fun lt!271062 () Unit!18745)

(assert (=> b!596779 (= lt!271062 e!340969)))

(declare-fun c!67532 () Bool)

(assert (=> b!596779 (= c!67532 (= lt!271053 Undefined!6163))))

(assert (=> b!596779 (= lt!271053 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271058 lt!271057 mask!3053))))

(assert (=> b!596779 e!340962))

(declare-fun res!382437 () Bool)

(assert (=> b!596779 (=> (not res!382437) (not e!340962))))

(declare-fun lt!271061 () (_ BitVec 32))

(assert (=> b!596779 (= res!382437 (= lt!271055 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271061 vacantSpotIndex!68 lt!271058 lt!271057 mask!3053)))))

(assert (=> b!596779 (= lt!271055 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271061 vacantSpotIndex!68 (select (arr!17767 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!596779 (= lt!271058 (select (store (arr!17767 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!271059 () Unit!18745)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37011 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18745)

(assert (=> b!596779 (= lt!271059 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271061 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!596779 (= lt!271061 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!596780 () Bool)

(declare-fun res!382433 () Bool)

(assert (=> b!596780 (=> (not res!382433) (not e!340964))))

(assert (=> b!596780 (= res!382433 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17767 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!596781 () Bool)

(declare-fun res!382438 () Bool)

(assert (=> b!596781 (=> (not res!382438) (not e!340966))))

(assert (=> b!596781 (= res!382438 (validKeyInArray!0 (select (arr!17767 a!2986) j!136)))))

(declare-fun b!596782 () Bool)

(assert (=> b!596782 (= e!340960 e!340968)))

(declare-fun res!382445 () Bool)

(assert (=> b!596782 (=> res!382445 e!340968)))

(assert (=> b!596782 (= res!382445 (or (not (= (select (arr!17767 a!2986) j!136) lt!271058)) (not (= (select (arr!17767 a!2986) j!136) lt!271063)) (bvsge j!136 index!984)))))

(assert (=> b!596782 e!340961))

(declare-fun res!382453 () Bool)

(assert (=> b!596782 (=> (not res!382453) (not e!340961))))

(assert (=> b!596782 (= res!382453 (= lt!271063 (select (arr!17767 a!2986) j!136)))))

(assert (=> b!596782 (= lt!271063 (select (store (arr!17767 a!2986) i!1108 k0!1786) index!984))))

(assert (= (and start!54606 res!382440) b!596778))

(assert (= (and b!596778 res!382434) b!596781))

(assert (= (and b!596781 res!382438) b!596760))

(assert (= (and b!596760 res!382439) b!596776))

(assert (= (and b!596776 res!382443) b!596769))

(assert (= (and b!596769 res!382436) b!596764))

(assert (= (and b!596764 res!382449) b!596767))

(assert (= (and b!596767 res!382435) b!596780))

(assert (= (and b!596780 res!382433) b!596771))

(assert (= (and b!596771 res!382447) b!596770))

(assert (= (and b!596770 res!382451) b!596779))

(assert (= (and b!596779 res!382437) b!596765))

(assert (= (and b!596779 c!67532) b!596773))

(assert (= (and b!596779 (not c!67532)) b!596761))

(assert (= (and b!596779 (not res!382444)) b!596782))

(assert (= (and b!596782 res!382453) b!596766))

(assert (= (and b!596766 (not res!382448)) b!596768))

(assert (= (and b!596768 res!382442) b!596762))

(assert (= (and b!596782 (not res!382445)) b!596777))

(assert (= (and b!596777 (not res!382450)) b!596775))

(assert (= (and b!596775 (not res!382452)) b!596763))

(assert (= (and b!596763 (not res!382446)) b!596772))

(assert (= (and b!596772 (not res!382441)) b!596774))

(declare-fun m!574439 () Bool)

(assert (=> b!596766 m!574439))

(declare-fun m!574441 () Bool)

(assert (=> b!596767 m!574441))

(declare-fun m!574443 () Bool)

(assert (=> b!596770 m!574443))

(assert (=> b!596770 m!574439))

(assert (=> b!596770 m!574439))

(declare-fun m!574445 () Bool)

(assert (=> b!596770 m!574445))

(assert (=> b!596782 m!574439))

(declare-fun m!574447 () Bool)

(assert (=> b!596782 m!574447))

(declare-fun m!574449 () Bool)

(assert (=> b!596782 m!574449))

(declare-fun m!574451 () Bool)

(assert (=> b!596769 m!574451))

(assert (=> b!596768 m!574439))

(assert (=> b!596768 m!574439))

(declare-fun m!574453 () Bool)

(assert (=> b!596768 m!574453))

(declare-fun m!574455 () Bool)

(assert (=> b!596780 m!574455))

(declare-fun m!574457 () Bool)

(assert (=> b!596779 m!574457))

(assert (=> b!596779 m!574439))

(assert (=> b!596779 m!574447))

(declare-fun m!574459 () Bool)

(assert (=> b!596779 m!574459))

(declare-fun m!574461 () Bool)

(assert (=> b!596779 m!574461))

(declare-fun m!574463 () Bool)

(assert (=> b!596779 m!574463))

(declare-fun m!574465 () Bool)

(assert (=> b!596779 m!574465))

(assert (=> b!596779 m!574439))

(declare-fun m!574467 () Bool)

(assert (=> b!596779 m!574467))

(declare-fun m!574469 () Bool)

(assert (=> b!596764 m!574469))

(declare-fun m!574471 () Bool)

(assert (=> b!596776 m!574471))

(declare-fun m!574473 () Bool)

(assert (=> b!596763 m!574473))

(assert (=> b!596781 m!574439))

(assert (=> b!596781 m!574439))

(declare-fun m!574475 () Bool)

(assert (=> b!596781 m!574475))

(assert (=> b!596762 m!574439))

(assert (=> b!596762 m!574439))

(declare-fun m!574477 () Bool)

(assert (=> b!596762 m!574477))

(declare-fun m!574479 () Bool)

(assert (=> b!596774 m!574479))

(assert (=> b!596777 m!574439))

(assert (=> b!596777 m!574439))

(declare-fun m!574481 () Bool)

(assert (=> b!596777 m!574481))

(assert (=> b!596777 m!574439))

(declare-fun m!574483 () Bool)

(assert (=> b!596777 m!574483))

(declare-fun m!574485 () Bool)

(assert (=> b!596775 m!574485))

(declare-fun m!574487 () Bool)

(assert (=> b!596772 m!574487))

(declare-fun m!574489 () Bool)

(assert (=> start!54606 m!574489))

(declare-fun m!574491 () Bool)

(assert (=> start!54606 m!574491))

(declare-fun m!574493 () Bool)

(assert (=> b!596760 m!574493))

(assert (=> b!596771 m!574447))

(declare-fun m!574495 () Bool)

(assert (=> b!596771 m!574495))

(check-sat (not b!596764) (not b!596774) (not b!596775) (not b!596776) (not b!596781) (not start!54606) (not b!596779) (not b!596772) (not b!596760) (not b!596768) (not b!596767) (not b!596769) (not b!596763) (not b!596762) (not b!596777) (not b!596770))
(check-sat)
