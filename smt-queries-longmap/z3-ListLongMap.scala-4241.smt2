; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58608 () Bool)

(assert start!58608)

(declare-fun b!646823 () Bool)

(declare-fun res!419118 () Bool)

(declare-fun e!370800 () Bool)

(assert (=> b!646823 (=> (not res!419118) (not e!370800))))

(declare-datatypes ((array!38481 0))(
  ( (array!38482 (arr!18448 (Array (_ BitVec 32) (_ BitVec 64))) (size!18812 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38481)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38481 (_ BitVec 32)) Bool)

(assert (=> b!646823 (= res!419118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!646824 () Bool)

(declare-fun e!370795 () Bool)

(declare-fun e!370808 () Bool)

(assert (=> b!646824 (= e!370795 e!370808)))

(declare-fun res!419116 () Bool)

(assert (=> b!646824 (=> res!419116 e!370808)))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!646824 (= res!419116 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!21963 0))(
  ( (Unit!21964) )
))
(declare-fun lt!300123 () Unit!21963)

(declare-fun e!370804 () Unit!21963)

(assert (=> b!646824 (= lt!300123 e!370804)))

(declare-fun c!74231 () Bool)

(assert (=> b!646824 (= c!74231 (bvslt j!136 index!984))))

(declare-fun b!646825 () Bool)

(declare-fun e!370796 () Bool)

(assert (=> b!646825 (= e!370808 e!370796)))

(declare-fun res!419106 () Bool)

(assert (=> b!646825 (=> res!419106 e!370796)))

(assert (=> b!646825 (= res!419106 (or (bvsge (size!18812 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18812 a!2986))))))

(declare-fun lt!300133 () array!38481)

(declare-fun arrayContainsKey!0 (array!38481 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!646825 (arrayContainsKey!0 lt!300133 (select (arr!18448 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!300128 () Unit!21963)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38481 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21963)

(assert (=> b!646825 (= lt!300128 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300133 (select (arr!18448 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!370805 () Bool)

(assert (=> b!646825 e!370805))

(declare-fun res!419108 () Bool)

(assert (=> b!646825 (=> (not res!419108) (not e!370805))))

(assert (=> b!646825 (= res!419108 (arrayContainsKey!0 lt!300133 (select (arr!18448 a!2986) j!136) j!136))))

(declare-fun b!646826 () Bool)

(declare-fun e!370803 () Bool)

(assert (=> b!646826 (= e!370803 (arrayContainsKey!0 lt!300133 (select (arr!18448 a!2986) j!136) index!984))))

(declare-fun res!419111 () Bool)

(declare-fun e!370801 () Bool)

(assert (=> start!58608 (=> (not res!419111) (not e!370801))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58608 (= res!419111 (validMask!0 mask!3053))))

(assert (=> start!58608 e!370801))

(assert (=> start!58608 true))

(declare-fun array_inv!14307 (array!38481) Bool)

(assert (=> start!58608 (array_inv!14307 a!2986)))

(declare-fun b!646827 () Bool)

(declare-fun e!370806 () Unit!21963)

(declare-fun Unit!21965 () Unit!21963)

(assert (=> b!646827 (= e!370806 Unit!21965)))

(assert (=> b!646827 false))

(declare-fun b!646828 () Bool)

(declare-fun e!370798 () Bool)

(declare-fun e!370802 () Bool)

(assert (=> b!646828 (= e!370798 (not e!370802))))

(declare-fun res!419104 () Bool)

(assert (=> b!646828 (=> res!419104 e!370802)))

(declare-datatypes ((SeekEntryResult!6844 0))(
  ( (MissingZero!6844 (index!29714 (_ BitVec 32))) (Found!6844 (index!29715 (_ BitVec 32))) (Intermediate!6844 (undefined!7656 Bool) (index!29716 (_ BitVec 32)) (x!58641 (_ BitVec 32))) (Undefined!6844) (MissingVacant!6844 (index!29717 (_ BitVec 32))) )
))
(declare-fun lt!300120 () SeekEntryResult!6844)

(assert (=> b!646828 (= res!419104 (not (= lt!300120 (Found!6844 index!984))))))

(declare-fun lt!300131 () Unit!21963)

(assert (=> b!646828 (= lt!300131 e!370806)))

(declare-fun c!74230 () Bool)

(assert (=> b!646828 (= c!74230 (= lt!300120 Undefined!6844))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!300119 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38481 (_ BitVec 32)) SeekEntryResult!6844)

(assert (=> b!646828 (= lt!300120 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!300119 lt!300133 mask!3053))))

(declare-fun e!370799 () Bool)

(assert (=> b!646828 e!370799))

(declare-fun res!419110 () Bool)

(assert (=> b!646828 (=> (not res!419110) (not e!370799))))

(declare-fun lt!300121 () SeekEntryResult!6844)

(declare-fun lt!300125 () (_ BitVec 32))

(assert (=> b!646828 (= res!419110 (= lt!300121 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300125 vacantSpotIndex!68 lt!300119 lt!300133 mask!3053)))))

(assert (=> b!646828 (= lt!300121 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300125 vacantSpotIndex!68 (select (arr!18448 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!646828 (= lt!300119 (select (store (arr!18448 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!300122 () Unit!21963)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38481 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21963)

(assert (=> b!646828 (= lt!300122 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300125 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!646828 (= lt!300125 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!646829 () Bool)

(assert (=> b!646829 (= e!370801 e!370800)))

(declare-fun res!419103 () Bool)

(assert (=> b!646829 (=> (not res!419103) (not e!370800))))

(declare-fun lt!300124 () SeekEntryResult!6844)

(assert (=> b!646829 (= res!419103 (or (= lt!300124 (MissingZero!6844 i!1108)) (= lt!300124 (MissingVacant!6844 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38481 (_ BitVec 32)) SeekEntryResult!6844)

(assert (=> b!646829 (= lt!300124 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!646830 () Bool)

(declare-fun res!419102 () Bool)

(assert (=> b!646830 (=> (not res!419102) (not e!370801))))

(assert (=> b!646830 (= res!419102 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!646831 () Bool)

(declare-fun res!419105 () Bool)

(assert (=> b!646831 (=> (not res!419105) (not e!370801))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!646831 (= res!419105 (validKeyInArray!0 k0!1786))))

(declare-fun b!646832 () Bool)

(declare-fun res!419115 () Bool)

(assert (=> b!646832 (=> (not res!419115) (not e!370800))))

(declare-datatypes ((List!12396 0))(
  ( (Nil!12393) (Cons!12392 (h!13440 (_ BitVec 64)) (t!18616 List!12396)) )
))
(declare-fun arrayNoDuplicates!0 (array!38481 (_ BitVec 32) List!12396) Bool)

(assert (=> b!646832 (= res!419115 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12393))))

(declare-fun b!646833 () Bool)

(declare-fun Unit!21966 () Unit!21963)

(assert (=> b!646833 (= e!370804 Unit!21966)))

(declare-fun lt!300126 () Unit!21963)

(assert (=> b!646833 (= lt!300126 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300133 (select (arr!18448 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!646833 (arrayContainsKey!0 lt!300133 (select (arr!18448 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!300130 () Unit!21963)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38481 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12396) Unit!21963)

(assert (=> b!646833 (= lt!300130 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12393))))

(assert (=> b!646833 (arrayNoDuplicates!0 lt!300133 #b00000000000000000000000000000000 Nil!12393)))

(declare-fun lt!300127 () Unit!21963)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38481 (_ BitVec 32) (_ BitVec 32)) Unit!21963)

(assert (=> b!646833 (= lt!300127 (lemmaNoDuplicateFromThenFromBigger!0 lt!300133 #b00000000000000000000000000000000 j!136))))

(assert (=> b!646833 (arrayNoDuplicates!0 lt!300133 j!136 Nil!12393)))

(declare-fun lt!300129 () Unit!21963)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38481 (_ BitVec 64) (_ BitVec 32) List!12396) Unit!21963)

(assert (=> b!646833 (= lt!300129 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!300133 (select (arr!18448 a!2986) j!136) j!136 Nil!12393))))

(assert (=> b!646833 false))

(declare-fun b!646834 () Bool)

(declare-fun Unit!21967 () Unit!21963)

(assert (=> b!646834 (= e!370804 Unit!21967)))

(declare-fun b!646835 () Bool)

(declare-fun res!419107 () Bool)

(assert (=> b!646835 (=> (not res!419107) (not e!370800))))

(assert (=> b!646835 (= res!419107 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18448 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!646836 () Bool)

(declare-fun lt!300118 () SeekEntryResult!6844)

(assert (=> b!646836 (= e!370799 (= lt!300118 lt!300121))))

(declare-fun b!646837 () Bool)

(declare-fun e!370807 () Bool)

(assert (=> b!646837 (= e!370807 e!370798)))

(declare-fun res!419117 () Bool)

(assert (=> b!646837 (=> (not res!419117) (not e!370798))))

(assert (=> b!646837 (= res!419117 (and (= lt!300118 (Found!6844 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18448 a!2986) index!984) (select (arr!18448 a!2986) j!136))) (not (= (select (arr!18448 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!646837 (= lt!300118 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18448 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!646838 () Bool)

(assert (=> b!646838 (= e!370805 (arrayContainsKey!0 lt!300133 (select (arr!18448 a!2986) j!136) index!984))))

(declare-fun b!646839 () Bool)

(assert (=> b!646839 (= e!370800 e!370807)))

(declare-fun res!419113 () Bool)

(assert (=> b!646839 (=> (not res!419113) (not e!370807))))

(assert (=> b!646839 (= res!419113 (= (select (store (arr!18448 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!646839 (= lt!300133 (array!38482 (store (arr!18448 a!2986) i!1108 k0!1786) (size!18812 a!2986)))))

(declare-fun b!646840 () Bool)

(declare-fun res!419109 () Bool)

(assert (=> b!646840 (=> (not res!419109) (not e!370801))))

(assert (=> b!646840 (= res!419109 (and (= (size!18812 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18812 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18812 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!646841 () Bool)

(declare-fun e!370809 () Bool)

(declare-fun e!370797 () Bool)

(assert (=> b!646841 (= e!370809 e!370797)))

(declare-fun res!419114 () Bool)

(assert (=> b!646841 (=> res!419114 e!370797)))

(declare-fun lt!300132 () (_ BitVec 64))

(assert (=> b!646841 (= res!419114 (or (not (= (select (arr!18448 a!2986) j!136) lt!300119)) (not (= (select (arr!18448 a!2986) j!136) lt!300132)) (bvsge j!136 index!984)))))

(declare-fun b!646842 () Bool)

(declare-fun res!419101 () Bool)

(assert (=> b!646842 (=> (not res!419101) (not e!370801))))

(assert (=> b!646842 (= res!419101 (validKeyInArray!0 (select (arr!18448 a!2986) j!136)))))

(declare-fun b!646843 () Bool)

(declare-fun noDuplicate!415 (List!12396) Bool)

(assert (=> b!646843 (= e!370796 (noDuplicate!415 Nil!12393))))

(declare-fun b!646844 () Bool)

(assert (=> b!646844 (= e!370802 e!370795)))

(declare-fun res!419100 () Bool)

(assert (=> b!646844 (=> res!419100 e!370795)))

(assert (=> b!646844 (= res!419100 (or (not (= (select (arr!18448 a!2986) j!136) lt!300119)) (not (= (select (arr!18448 a!2986) j!136) lt!300132))))))

(assert (=> b!646844 e!370809))

(declare-fun res!419119 () Bool)

(assert (=> b!646844 (=> (not res!419119) (not e!370809))))

(assert (=> b!646844 (= res!419119 (= lt!300132 (select (arr!18448 a!2986) j!136)))))

(assert (=> b!646844 (= lt!300132 (select (store (arr!18448 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!646845 () Bool)

(assert (=> b!646845 (= e!370797 e!370803)))

(declare-fun res!419112 () Bool)

(assert (=> b!646845 (=> (not res!419112) (not e!370803))))

(assert (=> b!646845 (= res!419112 (arrayContainsKey!0 lt!300133 (select (arr!18448 a!2986) j!136) j!136))))

(declare-fun b!646846 () Bool)

(declare-fun Unit!21968 () Unit!21963)

(assert (=> b!646846 (= e!370806 Unit!21968)))

(assert (= (and start!58608 res!419111) b!646840))

(assert (= (and b!646840 res!419109) b!646842))

(assert (= (and b!646842 res!419101) b!646831))

(assert (= (and b!646831 res!419105) b!646830))

(assert (= (and b!646830 res!419102) b!646829))

(assert (= (and b!646829 res!419103) b!646823))

(assert (= (and b!646823 res!419118) b!646832))

(assert (= (and b!646832 res!419115) b!646835))

(assert (= (and b!646835 res!419107) b!646839))

(assert (= (and b!646839 res!419113) b!646837))

(assert (= (and b!646837 res!419117) b!646828))

(assert (= (and b!646828 res!419110) b!646836))

(assert (= (and b!646828 c!74230) b!646827))

(assert (= (and b!646828 (not c!74230)) b!646846))

(assert (= (and b!646828 (not res!419104)) b!646844))

(assert (= (and b!646844 res!419119) b!646841))

(assert (= (and b!646841 (not res!419114)) b!646845))

(assert (= (and b!646845 res!419112) b!646826))

(assert (= (and b!646844 (not res!419100)) b!646824))

(assert (= (and b!646824 c!74231) b!646833))

(assert (= (and b!646824 (not c!74231)) b!646834))

(assert (= (and b!646824 (not res!419116)) b!646825))

(assert (= (and b!646825 res!419108) b!646838))

(assert (= (and b!646825 (not res!419106)) b!646843))

(declare-fun m!620689 () Bool)

(assert (=> b!646829 m!620689))

(declare-fun m!620691 () Bool)

(assert (=> b!646839 m!620691))

(declare-fun m!620693 () Bool)

(assert (=> b!646839 m!620693))

(declare-fun m!620695 () Bool)

(assert (=> b!646828 m!620695))

(declare-fun m!620697 () Bool)

(assert (=> b!646828 m!620697))

(assert (=> b!646828 m!620691))

(declare-fun m!620699 () Bool)

(assert (=> b!646828 m!620699))

(declare-fun m!620701 () Bool)

(assert (=> b!646828 m!620701))

(assert (=> b!646828 m!620697))

(declare-fun m!620703 () Bool)

(assert (=> b!646828 m!620703))

(declare-fun m!620705 () Bool)

(assert (=> b!646828 m!620705))

(declare-fun m!620707 () Bool)

(assert (=> b!646828 m!620707))

(assert (=> b!646825 m!620697))

(assert (=> b!646825 m!620697))

(declare-fun m!620709 () Bool)

(assert (=> b!646825 m!620709))

(assert (=> b!646825 m!620697))

(declare-fun m!620711 () Bool)

(assert (=> b!646825 m!620711))

(assert (=> b!646825 m!620697))

(declare-fun m!620713 () Bool)

(assert (=> b!646825 m!620713))

(declare-fun m!620715 () Bool)

(assert (=> b!646837 m!620715))

(assert (=> b!646837 m!620697))

(assert (=> b!646837 m!620697))

(declare-fun m!620717 () Bool)

(assert (=> b!646837 m!620717))

(declare-fun m!620719 () Bool)

(assert (=> b!646823 m!620719))

(assert (=> b!646842 m!620697))

(assert (=> b!646842 m!620697))

(declare-fun m!620721 () Bool)

(assert (=> b!646842 m!620721))

(assert (=> b!646845 m!620697))

(assert (=> b!646845 m!620697))

(assert (=> b!646845 m!620713))

(declare-fun m!620723 () Bool)

(assert (=> b!646843 m!620723))

(declare-fun m!620725 () Bool)

(assert (=> b!646831 m!620725))

(assert (=> b!646838 m!620697))

(assert (=> b!646838 m!620697))

(declare-fun m!620727 () Bool)

(assert (=> b!646838 m!620727))

(declare-fun m!620729 () Bool)

(assert (=> b!646835 m!620729))

(declare-fun m!620731 () Bool)

(assert (=> b!646832 m!620731))

(declare-fun m!620733 () Bool)

(assert (=> start!58608 m!620733))

(declare-fun m!620735 () Bool)

(assert (=> start!58608 m!620735))

(assert (=> b!646833 m!620697))

(declare-fun m!620737 () Bool)

(assert (=> b!646833 m!620737))

(assert (=> b!646833 m!620697))

(assert (=> b!646833 m!620697))

(declare-fun m!620739 () Bool)

(assert (=> b!646833 m!620739))

(assert (=> b!646833 m!620697))

(declare-fun m!620741 () Bool)

(assert (=> b!646833 m!620741))

(declare-fun m!620743 () Bool)

(assert (=> b!646833 m!620743))

(declare-fun m!620745 () Bool)

(assert (=> b!646833 m!620745))

(declare-fun m!620747 () Bool)

(assert (=> b!646833 m!620747))

(declare-fun m!620749 () Bool)

(assert (=> b!646833 m!620749))

(assert (=> b!646844 m!620697))

(assert (=> b!646844 m!620691))

(declare-fun m!620751 () Bool)

(assert (=> b!646844 m!620751))

(assert (=> b!646841 m!620697))

(declare-fun m!620753 () Bool)

(assert (=> b!646830 m!620753))

(assert (=> b!646826 m!620697))

(assert (=> b!646826 m!620697))

(assert (=> b!646826 m!620727))

(check-sat (not b!646825) (not b!646830) (not start!58608) (not b!646826) (not b!646838) (not b!646823) (not b!646843) (not b!646845) (not b!646828) (not b!646842) (not b!646832) (not b!646833) (not b!646831) (not b!646837) (not b!646829))
(check-sat)
(get-model)

(declare-fun b!647003 () Bool)

(declare-fun e!370914 () SeekEntryResult!6844)

(assert (=> b!647003 (= e!370914 (MissingVacant!6844 vacantSpotIndex!68))))

(declare-fun b!647004 () Bool)

(declare-fun e!370913 () SeekEntryResult!6844)

(declare-fun e!370912 () SeekEntryResult!6844)

(assert (=> b!647004 (= e!370913 e!370912)))

(declare-fun lt!300234 () (_ BitVec 64))

(declare-fun c!74250 () Bool)

(assert (=> b!647004 (= c!74250 (= lt!300234 (select (arr!18448 a!2986) j!136)))))

(declare-fun lt!300235 () SeekEntryResult!6844)

(declare-fun d!91495 () Bool)

(get-info :version)

(assert (=> d!91495 (and (or ((_ is Undefined!6844) lt!300235) (not ((_ is Found!6844) lt!300235)) (and (bvsge (index!29715 lt!300235) #b00000000000000000000000000000000) (bvslt (index!29715 lt!300235) (size!18812 a!2986)))) (or ((_ is Undefined!6844) lt!300235) ((_ is Found!6844) lt!300235) (not ((_ is MissingVacant!6844) lt!300235)) (not (= (index!29717 lt!300235) vacantSpotIndex!68)) (and (bvsge (index!29717 lt!300235) #b00000000000000000000000000000000) (bvslt (index!29717 lt!300235) (size!18812 a!2986)))) (or ((_ is Undefined!6844) lt!300235) (ite ((_ is Found!6844) lt!300235) (= (select (arr!18448 a!2986) (index!29715 lt!300235)) (select (arr!18448 a!2986) j!136)) (and ((_ is MissingVacant!6844) lt!300235) (= (index!29717 lt!300235) vacantSpotIndex!68) (= (select (arr!18448 a!2986) (index!29717 lt!300235)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91495 (= lt!300235 e!370913)))

(declare-fun c!74251 () Bool)

(assert (=> d!91495 (= c!74251 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!91495 (= lt!300234 (select (arr!18448 a!2986) lt!300125))))

(assert (=> d!91495 (validMask!0 mask!3053)))

(assert (=> d!91495 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300125 vacantSpotIndex!68 (select (arr!18448 a!2986) j!136) a!2986 mask!3053) lt!300235)))

(declare-fun b!647005 () Bool)

(assert (=> b!647005 (= e!370912 (Found!6844 lt!300125))))

(declare-fun b!647006 () Bool)

(assert (=> b!647006 (= e!370913 Undefined!6844)))

(declare-fun b!647007 () Bool)

(declare-fun c!74252 () Bool)

(assert (=> b!647007 (= c!74252 (= lt!300234 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!647007 (= e!370912 e!370914)))

(declare-fun b!647008 () Bool)

(assert (=> b!647008 (= e!370914 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!300125 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18448 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!91495 c!74251) b!647006))

(assert (= (and d!91495 (not c!74251)) b!647004))

(assert (= (and b!647004 c!74250) b!647005))

(assert (= (and b!647004 (not c!74250)) b!647007))

(assert (= (and b!647007 c!74252) b!647003))

(assert (= (and b!647007 (not c!74252)) b!647008))

(declare-fun m!620887 () Bool)

(assert (=> d!91495 m!620887))

(declare-fun m!620889 () Bool)

(assert (=> d!91495 m!620889))

(declare-fun m!620891 () Bool)

(assert (=> d!91495 m!620891))

(assert (=> d!91495 m!620733))

(declare-fun m!620893 () Bool)

(assert (=> b!647008 m!620893))

(assert (=> b!647008 m!620893))

(assert (=> b!647008 m!620697))

(declare-fun m!620895 () Bool)

(assert (=> b!647008 m!620895))

(assert (=> b!646828 d!91495))

(declare-fun b!647009 () Bool)

(declare-fun e!370917 () SeekEntryResult!6844)

(assert (=> b!647009 (= e!370917 (MissingVacant!6844 vacantSpotIndex!68))))

(declare-fun b!647010 () Bool)

(declare-fun e!370916 () SeekEntryResult!6844)

(declare-fun e!370915 () SeekEntryResult!6844)

(assert (=> b!647010 (= e!370916 e!370915)))

(declare-fun c!74253 () Bool)

(declare-fun lt!300236 () (_ BitVec 64))

(assert (=> b!647010 (= c!74253 (= lt!300236 lt!300119))))

(declare-fun lt!300237 () SeekEntryResult!6844)

(declare-fun d!91497 () Bool)

(assert (=> d!91497 (and (or ((_ is Undefined!6844) lt!300237) (not ((_ is Found!6844) lt!300237)) (and (bvsge (index!29715 lt!300237) #b00000000000000000000000000000000) (bvslt (index!29715 lt!300237) (size!18812 lt!300133)))) (or ((_ is Undefined!6844) lt!300237) ((_ is Found!6844) lt!300237) (not ((_ is MissingVacant!6844) lt!300237)) (not (= (index!29717 lt!300237) vacantSpotIndex!68)) (and (bvsge (index!29717 lt!300237) #b00000000000000000000000000000000) (bvslt (index!29717 lt!300237) (size!18812 lt!300133)))) (or ((_ is Undefined!6844) lt!300237) (ite ((_ is Found!6844) lt!300237) (= (select (arr!18448 lt!300133) (index!29715 lt!300237)) lt!300119) (and ((_ is MissingVacant!6844) lt!300237) (= (index!29717 lt!300237) vacantSpotIndex!68) (= (select (arr!18448 lt!300133) (index!29717 lt!300237)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91497 (= lt!300237 e!370916)))

(declare-fun c!74254 () Bool)

(assert (=> d!91497 (= c!74254 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!91497 (= lt!300236 (select (arr!18448 lt!300133) lt!300125))))

(assert (=> d!91497 (validMask!0 mask!3053)))

(assert (=> d!91497 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300125 vacantSpotIndex!68 lt!300119 lt!300133 mask!3053) lt!300237)))

(declare-fun b!647011 () Bool)

(assert (=> b!647011 (= e!370915 (Found!6844 lt!300125))))

(declare-fun b!647012 () Bool)

(assert (=> b!647012 (= e!370916 Undefined!6844)))

(declare-fun b!647013 () Bool)

(declare-fun c!74255 () Bool)

(assert (=> b!647013 (= c!74255 (= lt!300236 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!647013 (= e!370915 e!370917)))

(declare-fun b!647014 () Bool)

(assert (=> b!647014 (= e!370917 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!300125 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!300119 lt!300133 mask!3053))))

(assert (= (and d!91497 c!74254) b!647012))

(assert (= (and d!91497 (not c!74254)) b!647010))

(assert (= (and b!647010 c!74253) b!647011))

(assert (= (and b!647010 (not c!74253)) b!647013))

(assert (= (and b!647013 c!74255) b!647009))

(assert (= (and b!647013 (not c!74255)) b!647014))

(declare-fun m!620897 () Bool)

(assert (=> d!91497 m!620897))

(declare-fun m!620899 () Bool)

(assert (=> d!91497 m!620899))

(declare-fun m!620901 () Bool)

(assert (=> d!91497 m!620901))

(assert (=> d!91497 m!620733))

(assert (=> b!647014 m!620893))

(assert (=> b!647014 m!620893))

(declare-fun m!620903 () Bool)

(assert (=> b!647014 m!620903))

(assert (=> b!646828 d!91497))

(declare-fun d!91499 () Bool)

(declare-fun e!370920 () Bool)

(assert (=> d!91499 e!370920))

(declare-fun res!419242 () Bool)

(assert (=> d!91499 (=> (not res!419242) (not e!370920))))

(assert (=> d!91499 (= res!419242 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18812 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18812 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18812 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18812 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18812 a!2986))))))

(declare-fun lt!300240 () Unit!21963)

(declare-fun choose!9 (array!38481 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21963)

(assert (=> d!91499 (= lt!300240 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300125 vacantSpotIndex!68 mask!3053))))

(assert (=> d!91499 (validMask!0 mask!3053)))

(assert (=> d!91499 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300125 vacantSpotIndex!68 mask!3053) lt!300240)))

(declare-fun b!647017 () Bool)

(assert (=> b!647017 (= e!370920 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300125 vacantSpotIndex!68 (select (arr!18448 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300125 vacantSpotIndex!68 (select (store (arr!18448 a!2986) i!1108 k0!1786) j!136) (array!38482 (store (arr!18448 a!2986) i!1108 k0!1786) (size!18812 a!2986)) mask!3053)))))

(assert (= (and d!91499 res!419242) b!647017))

(declare-fun m!620905 () Bool)

(assert (=> d!91499 m!620905))

(assert (=> d!91499 m!620733))

(assert (=> b!647017 m!620691))

(assert (=> b!647017 m!620697))

(assert (=> b!647017 m!620697))

(assert (=> b!647017 m!620703))

(assert (=> b!647017 m!620695))

(declare-fun m!620907 () Bool)

(assert (=> b!647017 m!620907))

(assert (=> b!647017 m!620695))

(assert (=> b!646828 d!91499))

(declare-fun d!91501 () Bool)

(declare-fun lt!300243 () (_ BitVec 32))

(assert (=> d!91501 (and (bvsge lt!300243 #b00000000000000000000000000000000) (bvslt lt!300243 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91501 (= lt!300243 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!91501 (validMask!0 mask!3053)))

(assert (=> d!91501 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!300243)))

(declare-fun bs!19337 () Bool)

(assert (= bs!19337 d!91501))

(declare-fun m!620909 () Bool)

(assert (=> bs!19337 m!620909))

(assert (=> bs!19337 m!620733))

(assert (=> b!646828 d!91501))

(declare-fun b!647018 () Bool)

(declare-fun e!370923 () SeekEntryResult!6844)

(assert (=> b!647018 (= e!370923 (MissingVacant!6844 vacantSpotIndex!68))))

(declare-fun b!647019 () Bool)

(declare-fun e!370922 () SeekEntryResult!6844)

(declare-fun e!370921 () SeekEntryResult!6844)

(assert (=> b!647019 (= e!370922 e!370921)))

(declare-fun c!74256 () Bool)

(declare-fun lt!300244 () (_ BitVec 64))

(assert (=> b!647019 (= c!74256 (= lt!300244 lt!300119))))

(declare-fun d!91503 () Bool)

(declare-fun lt!300245 () SeekEntryResult!6844)

(assert (=> d!91503 (and (or ((_ is Undefined!6844) lt!300245) (not ((_ is Found!6844) lt!300245)) (and (bvsge (index!29715 lt!300245) #b00000000000000000000000000000000) (bvslt (index!29715 lt!300245) (size!18812 lt!300133)))) (or ((_ is Undefined!6844) lt!300245) ((_ is Found!6844) lt!300245) (not ((_ is MissingVacant!6844) lt!300245)) (not (= (index!29717 lt!300245) vacantSpotIndex!68)) (and (bvsge (index!29717 lt!300245) #b00000000000000000000000000000000) (bvslt (index!29717 lt!300245) (size!18812 lt!300133)))) (or ((_ is Undefined!6844) lt!300245) (ite ((_ is Found!6844) lt!300245) (= (select (arr!18448 lt!300133) (index!29715 lt!300245)) lt!300119) (and ((_ is MissingVacant!6844) lt!300245) (= (index!29717 lt!300245) vacantSpotIndex!68) (= (select (arr!18448 lt!300133) (index!29717 lt!300245)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91503 (= lt!300245 e!370922)))

(declare-fun c!74257 () Bool)

(assert (=> d!91503 (= c!74257 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!91503 (= lt!300244 (select (arr!18448 lt!300133) index!984))))

(assert (=> d!91503 (validMask!0 mask!3053)))

(assert (=> d!91503 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!300119 lt!300133 mask!3053) lt!300245)))

(declare-fun b!647020 () Bool)

(assert (=> b!647020 (= e!370921 (Found!6844 index!984))))

(declare-fun b!647021 () Bool)

(assert (=> b!647021 (= e!370922 Undefined!6844)))

(declare-fun b!647022 () Bool)

(declare-fun c!74258 () Bool)

(assert (=> b!647022 (= c!74258 (= lt!300244 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!647022 (= e!370921 e!370923)))

(declare-fun b!647023 () Bool)

(assert (=> b!647023 (= e!370923 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!300119 lt!300133 mask!3053))))

(assert (= (and d!91503 c!74257) b!647021))

(assert (= (and d!91503 (not c!74257)) b!647019))

(assert (= (and b!647019 c!74256) b!647020))

(assert (= (and b!647019 (not c!74256)) b!647022))

(assert (= (and b!647022 c!74258) b!647018))

(assert (= (and b!647022 (not c!74258)) b!647023))

(declare-fun m!620911 () Bool)

(assert (=> d!91503 m!620911))

(declare-fun m!620913 () Bool)

(assert (=> d!91503 m!620913))

(declare-fun m!620915 () Bool)

(assert (=> d!91503 m!620915))

(assert (=> d!91503 m!620733))

(declare-fun m!620917 () Bool)

(assert (=> b!647023 m!620917))

(assert (=> b!647023 m!620917))

(declare-fun m!620919 () Bool)

(assert (=> b!647023 m!620919))

(assert (=> b!646828 d!91503))

(declare-fun d!91505 () Bool)

(declare-fun res!419253 () Bool)

(declare-fun e!370934 () Bool)

(assert (=> d!91505 (=> res!419253 e!370934)))

(assert (=> d!91505 (= res!419253 (= (select (arr!18448 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!91505 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!370934)))

(declare-fun b!647034 () Bool)

(declare-fun e!370935 () Bool)

(assert (=> b!647034 (= e!370934 e!370935)))

(declare-fun res!419254 () Bool)

(assert (=> b!647034 (=> (not res!419254) (not e!370935))))

(assert (=> b!647034 (= res!419254 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18812 a!2986)))))

(declare-fun b!647035 () Bool)

(assert (=> b!647035 (= e!370935 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!91505 (not res!419253)) b!647034))

(assert (= (and b!647034 res!419254) b!647035))

(declare-fun m!620925 () Bool)

(assert (=> d!91505 m!620925))

(declare-fun m!620927 () Bool)

(assert (=> b!647035 m!620927))

(assert (=> b!646830 d!91505))

(declare-fun b!647094 () Bool)

(declare-fun c!74283 () Bool)

(declare-fun lt!300269 () (_ BitVec 64))

(assert (=> b!647094 (= c!74283 (= lt!300269 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!370972 () SeekEntryResult!6844)

(declare-fun e!370970 () SeekEntryResult!6844)

(assert (=> b!647094 (= e!370972 e!370970)))

(declare-fun d!91511 () Bool)

(declare-fun lt!300267 () SeekEntryResult!6844)

(assert (=> d!91511 (and (or ((_ is Undefined!6844) lt!300267) (not ((_ is Found!6844) lt!300267)) (and (bvsge (index!29715 lt!300267) #b00000000000000000000000000000000) (bvslt (index!29715 lt!300267) (size!18812 a!2986)))) (or ((_ is Undefined!6844) lt!300267) ((_ is Found!6844) lt!300267) (not ((_ is MissingZero!6844) lt!300267)) (and (bvsge (index!29714 lt!300267) #b00000000000000000000000000000000) (bvslt (index!29714 lt!300267) (size!18812 a!2986)))) (or ((_ is Undefined!6844) lt!300267) ((_ is Found!6844) lt!300267) ((_ is MissingZero!6844) lt!300267) (not ((_ is MissingVacant!6844) lt!300267)) (and (bvsge (index!29717 lt!300267) #b00000000000000000000000000000000) (bvslt (index!29717 lt!300267) (size!18812 a!2986)))) (or ((_ is Undefined!6844) lt!300267) (ite ((_ is Found!6844) lt!300267) (= (select (arr!18448 a!2986) (index!29715 lt!300267)) k0!1786) (ite ((_ is MissingZero!6844) lt!300267) (= (select (arr!18448 a!2986) (index!29714 lt!300267)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6844) lt!300267) (= (select (arr!18448 a!2986) (index!29717 lt!300267)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!370971 () SeekEntryResult!6844)

(assert (=> d!91511 (= lt!300267 e!370971)))

(declare-fun c!74284 () Bool)

(declare-fun lt!300268 () SeekEntryResult!6844)

(assert (=> d!91511 (= c!74284 (and ((_ is Intermediate!6844) lt!300268) (undefined!7656 lt!300268)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38481 (_ BitVec 32)) SeekEntryResult!6844)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91511 (= lt!300268 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!91511 (validMask!0 mask!3053)))

(assert (=> d!91511 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!300267)))

(declare-fun b!647095 () Bool)

(assert (=> b!647095 (= e!370972 (Found!6844 (index!29716 lt!300268)))))

(declare-fun b!647096 () Bool)

(assert (=> b!647096 (= e!370971 Undefined!6844)))

(declare-fun b!647097 () Bool)

(assert (=> b!647097 (= e!370970 (MissingZero!6844 (index!29716 lt!300268)))))

(declare-fun b!647098 () Bool)

(assert (=> b!647098 (= e!370970 (seekKeyOrZeroReturnVacant!0 (x!58641 lt!300268) (index!29716 lt!300268) (index!29716 lt!300268) k0!1786 a!2986 mask!3053))))

(declare-fun b!647099 () Bool)

(assert (=> b!647099 (= e!370971 e!370972)))

(assert (=> b!647099 (= lt!300269 (select (arr!18448 a!2986) (index!29716 lt!300268)))))

(declare-fun c!74285 () Bool)

(assert (=> b!647099 (= c!74285 (= lt!300269 k0!1786))))

(assert (= (and d!91511 c!74284) b!647096))

(assert (= (and d!91511 (not c!74284)) b!647099))

(assert (= (and b!647099 c!74285) b!647095))

(assert (= (and b!647099 (not c!74285)) b!647094))

(assert (= (and b!647094 c!74283) b!647097))

(assert (= (and b!647094 (not c!74283)) b!647098))

(declare-fun m!620963 () Bool)

(assert (=> d!91511 m!620963))

(declare-fun m!620965 () Bool)

(assert (=> d!91511 m!620965))

(declare-fun m!620967 () Bool)

(assert (=> d!91511 m!620967))

(declare-fun m!620969 () Bool)

(assert (=> d!91511 m!620969))

(assert (=> d!91511 m!620733))

(declare-fun m!620971 () Bool)

(assert (=> d!91511 m!620971))

(assert (=> d!91511 m!620965))

(declare-fun m!620975 () Bool)

(assert (=> b!647098 m!620975))

(declare-fun m!620977 () Bool)

(assert (=> b!647099 m!620977))

(assert (=> b!646829 d!91511))

(declare-fun d!91535 () Bool)

(declare-fun res!419265 () Bool)

(declare-fun e!370973 () Bool)

(assert (=> d!91535 (=> res!419265 e!370973)))

(assert (=> d!91535 (= res!419265 (= (select (arr!18448 lt!300133) index!984) (select (arr!18448 a!2986) j!136)))))

(assert (=> d!91535 (= (arrayContainsKey!0 lt!300133 (select (arr!18448 a!2986) j!136) index!984) e!370973)))

(declare-fun b!647100 () Bool)

(declare-fun e!370974 () Bool)

(assert (=> b!647100 (= e!370973 e!370974)))

(declare-fun res!419266 () Bool)

(assert (=> b!647100 (=> (not res!419266) (not e!370974))))

(assert (=> b!647100 (= res!419266 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18812 lt!300133)))))

(declare-fun b!647101 () Bool)

(assert (=> b!647101 (= e!370974 (arrayContainsKey!0 lt!300133 (select (arr!18448 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91535 (not res!419265)) b!647100))

(assert (= (and b!647100 res!419266) b!647101))

(assert (=> d!91535 m!620915))

(assert (=> b!647101 m!620697))

(declare-fun m!620979 () Bool)

(assert (=> b!647101 m!620979))

(assert (=> b!646826 d!91535))

(declare-fun d!91537 () Bool)

(declare-fun res!419267 () Bool)

(declare-fun e!370975 () Bool)

(assert (=> d!91537 (=> res!419267 e!370975)))

(assert (=> d!91537 (= res!419267 (= (select (arr!18448 lt!300133) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18448 a!2986) j!136)))))

(assert (=> d!91537 (= (arrayContainsKey!0 lt!300133 (select (arr!18448 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!370975)))

(declare-fun b!647102 () Bool)

(declare-fun e!370976 () Bool)

(assert (=> b!647102 (= e!370975 e!370976)))

(declare-fun res!419268 () Bool)

(assert (=> b!647102 (=> (not res!419268) (not e!370976))))

(assert (=> b!647102 (= res!419268 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18812 lt!300133)))))

(declare-fun b!647103 () Bool)

(assert (=> b!647103 (= e!370976 (arrayContainsKey!0 lt!300133 (select (arr!18448 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91537 (not res!419267)) b!647102))

(assert (= (and b!647102 res!419268) b!647103))

(declare-fun m!620981 () Bool)

(assert (=> d!91537 m!620981))

(assert (=> b!647103 m!620697))

(declare-fun m!620983 () Bool)

(assert (=> b!647103 m!620983))

(assert (=> b!646825 d!91537))

(declare-fun d!91539 () Bool)

(assert (=> d!91539 (arrayContainsKey!0 lt!300133 (select (arr!18448 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!300275 () Unit!21963)

(declare-fun choose!114 (array!38481 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21963)

(assert (=> d!91539 (= lt!300275 (choose!114 lt!300133 (select (arr!18448 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!91539 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!91539 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300133 (select (arr!18448 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!300275)))

(declare-fun bs!19339 () Bool)

(assert (= bs!19339 d!91539))

(assert (=> bs!19339 m!620697))

(assert (=> bs!19339 m!620709))

(assert (=> bs!19339 m!620697))

(declare-fun m!620989 () Bool)

(assert (=> bs!19339 m!620989))

(assert (=> b!646825 d!91539))

(declare-fun d!91543 () Bool)

(declare-fun res!419275 () Bool)

(declare-fun e!370983 () Bool)

(assert (=> d!91543 (=> res!419275 e!370983)))

(assert (=> d!91543 (= res!419275 (= (select (arr!18448 lt!300133) j!136) (select (arr!18448 a!2986) j!136)))))

(assert (=> d!91543 (= (arrayContainsKey!0 lt!300133 (select (arr!18448 a!2986) j!136) j!136) e!370983)))

(declare-fun b!647110 () Bool)

(declare-fun e!370984 () Bool)

(assert (=> b!647110 (= e!370983 e!370984)))

(declare-fun res!419276 () Bool)

(assert (=> b!647110 (=> (not res!419276) (not e!370984))))

(assert (=> b!647110 (= res!419276 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18812 lt!300133)))))

(declare-fun b!647111 () Bool)

(assert (=> b!647111 (= e!370984 (arrayContainsKey!0 lt!300133 (select (arr!18448 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91543 (not res!419275)) b!647110))

(assert (= (and b!647110 res!419276) b!647111))

(declare-fun m!620991 () Bool)

(assert (=> d!91543 m!620991))

(assert (=> b!647111 m!620697))

(declare-fun m!620993 () Bool)

(assert (=> b!647111 m!620993))

(assert (=> b!646825 d!91543))

(declare-fun d!91545 () Bool)

(assert (=> d!91545 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!58608 d!91545))

(declare-fun d!91559 () Bool)

(assert (=> d!91559 (= (array_inv!14307 a!2986) (bvsge (size!18812 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!58608 d!91559))

(assert (=> b!646838 d!91535))

(declare-fun b!647144 () Bool)

(declare-fun e!371004 () SeekEntryResult!6844)

(assert (=> b!647144 (= e!371004 (MissingVacant!6844 vacantSpotIndex!68))))

(declare-fun b!647145 () Bool)

(declare-fun e!371003 () SeekEntryResult!6844)

(declare-fun e!371002 () SeekEntryResult!6844)

(assert (=> b!647145 (= e!371003 e!371002)))

(declare-fun c!74301 () Bool)

(declare-fun lt!300289 () (_ BitVec 64))

(assert (=> b!647145 (= c!74301 (= lt!300289 (select (arr!18448 a!2986) j!136)))))

(declare-fun d!91563 () Bool)

(declare-fun lt!300290 () SeekEntryResult!6844)

(assert (=> d!91563 (and (or ((_ is Undefined!6844) lt!300290) (not ((_ is Found!6844) lt!300290)) (and (bvsge (index!29715 lt!300290) #b00000000000000000000000000000000) (bvslt (index!29715 lt!300290) (size!18812 a!2986)))) (or ((_ is Undefined!6844) lt!300290) ((_ is Found!6844) lt!300290) (not ((_ is MissingVacant!6844) lt!300290)) (not (= (index!29717 lt!300290) vacantSpotIndex!68)) (and (bvsge (index!29717 lt!300290) #b00000000000000000000000000000000) (bvslt (index!29717 lt!300290) (size!18812 a!2986)))) (or ((_ is Undefined!6844) lt!300290) (ite ((_ is Found!6844) lt!300290) (= (select (arr!18448 a!2986) (index!29715 lt!300290)) (select (arr!18448 a!2986) j!136)) (and ((_ is MissingVacant!6844) lt!300290) (= (index!29717 lt!300290) vacantSpotIndex!68) (= (select (arr!18448 a!2986) (index!29717 lt!300290)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91563 (= lt!300290 e!371003)))

(declare-fun c!74302 () Bool)

(assert (=> d!91563 (= c!74302 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!91563 (= lt!300289 (select (arr!18448 a!2986) index!984))))

(assert (=> d!91563 (validMask!0 mask!3053)))

(assert (=> d!91563 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18448 a!2986) j!136) a!2986 mask!3053) lt!300290)))

(declare-fun b!647146 () Bool)

(assert (=> b!647146 (= e!371002 (Found!6844 index!984))))

(declare-fun b!647147 () Bool)

(assert (=> b!647147 (= e!371003 Undefined!6844)))

(declare-fun b!647148 () Bool)

(declare-fun c!74303 () Bool)

(assert (=> b!647148 (= c!74303 (= lt!300289 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!647148 (= e!371002 e!371004)))

(declare-fun b!647149 () Bool)

(assert (=> b!647149 (= e!371004 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18448 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!91563 c!74302) b!647147))

(assert (= (and d!91563 (not c!74302)) b!647145))

(assert (= (and b!647145 c!74301) b!647146))

(assert (= (and b!647145 (not c!74301)) b!647148))

(assert (= (and b!647148 c!74303) b!647144))

(assert (= (and b!647148 (not c!74303)) b!647149))

(declare-fun m!621027 () Bool)

(assert (=> d!91563 m!621027))

(declare-fun m!621029 () Bool)

(assert (=> d!91563 m!621029))

(assert (=> d!91563 m!620715))

(assert (=> d!91563 m!620733))

(assert (=> b!647149 m!620917))

(assert (=> b!647149 m!620917))

(assert (=> b!647149 m!620697))

(declare-fun m!621031 () Bool)

(assert (=> b!647149 m!621031))

(assert (=> b!646837 d!91563))

(declare-fun d!91565 () Bool)

(declare-fun res!419288 () Bool)

(declare-fun e!371016 () Bool)

(assert (=> d!91565 (=> res!419288 e!371016)))

(assert (=> d!91565 (= res!419288 (bvsge #b00000000000000000000000000000000 (size!18812 a!2986)))))

(assert (=> d!91565 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!371016)))

(declare-fun b!647163 () Bool)

(declare-fun e!371018 () Bool)

(declare-fun call!33666 () Bool)

(assert (=> b!647163 (= e!371018 call!33666)))

(declare-fun bm!33663 () Bool)

(assert (=> bm!33663 (= call!33666 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!647164 () Bool)

(assert (=> b!647164 (= e!371016 e!371018)))

(declare-fun c!74306 () Bool)

(assert (=> b!647164 (= c!74306 (validKeyInArray!0 (select (arr!18448 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!647165 () Bool)

(declare-fun e!371017 () Bool)

(assert (=> b!647165 (= e!371017 call!33666)))

(declare-fun b!647166 () Bool)

(assert (=> b!647166 (= e!371018 e!371017)))

(declare-fun lt!300302 () (_ BitVec 64))

(assert (=> b!647166 (= lt!300302 (select (arr!18448 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!300300 () Unit!21963)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38481 (_ BitVec 64) (_ BitVec 32)) Unit!21963)

(assert (=> b!647166 (= lt!300300 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!300302 #b00000000000000000000000000000000))))

(assert (=> b!647166 (arrayContainsKey!0 a!2986 lt!300302 #b00000000000000000000000000000000)))

(declare-fun lt!300301 () Unit!21963)

(assert (=> b!647166 (= lt!300301 lt!300300)))

(declare-fun res!419289 () Bool)

(assert (=> b!647166 (= res!419289 (= (seekEntryOrOpen!0 (select (arr!18448 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6844 #b00000000000000000000000000000000)))))

(assert (=> b!647166 (=> (not res!419289) (not e!371017))))

(assert (= (and d!91565 (not res!419288)) b!647164))

(assert (= (and b!647164 c!74306) b!647166))

(assert (= (and b!647164 (not c!74306)) b!647163))

(assert (= (and b!647166 res!419289) b!647165))

(assert (= (or b!647165 b!647163) bm!33663))

(declare-fun m!621041 () Bool)

(assert (=> bm!33663 m!621041))

(assert (=> b!647164 m!620925))

(assert (=> b!647164 m!620925))

(declare-fun m!621043 () Bool)

(assert (=> b!647164 m!621043))

(assert (=> b!647166 m!620925))

(declare-fun m!621045 () Bool)

(assert (=> b!647166 m!621045))

(declare-fun m!621047 () Bool)

(assert (=> b!647166 m!621047))

(assert (=> b!647166 m!620925))

(declare-fun m!621049 () Bool)

(assert (=> b!647166 m!621049))

(assert (=> b!646823 d!91565))

(declare-fun d!91573 () Bool)

(declare-fun res!419290 () Bool)

(declare-fun e!371019 () Bool)

(assert (=> d!91573 (=> res!419290 e!371019)))

(assert (=> d!91573 (= res!419290 (= (select (arr!18448 lt!300133) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18448 a!2986) j!136)))))

(assert (=> d!91573 (= (arrayContainsKey!0 lt!300133 (select (arr!18448 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!371019)))

(declare-fun b!647167 () Bool)

(declare-fun e!371020 () Bool)

(assert (=> b!647167 (= e!371019 e!371020)))

(declare-fun res!419291 () Bool)

(assert (=> b!647167 (=> (not res!419291) (not e!371020))))

(assert (=> b!647167 (= res!419291 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18812 lt!300133)))))

(declare-fun b!647168 () Bool)

(assert (=> b!647168 (= e!371020 (arrayContainsKey!0 lt!300133 (select (arr!18448 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91573 (not res!419290)) b!647167))

(assert (= (and b!647167 res!419291) b!647168))

(declare-fun m!621051 () Bool)

(assert (=> d!91573 m!621051))

(assert (=> b!647168 m!620697))

(declare-fun m!621053 () Bool)

(assert (=> b!647168 m!621053))

(assert (=> b!646833 d!91573))

(declare-fun d!91575 () Bool)

(assert (=> d!91575 (arrayNoDuplicates!0 lt!300133 j!136 Nil!12393)))

(declare-fun lt!300311 () Unit!21963)

(declare-fun choose!39 (array!38481 (_ BitVec 32) (_ BitVec 32)) Unit!21963)

(assert (=> d!91575 (= lt!300311 (choose!39 lt!300133 #b00000000000000000000000000000000 j!136))))

(assert (=> d!91575 (bvslt (size!18812 lt!300133) #b01111111111111111111111111111111)))

(assert (=> d!91575 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!300133 #b00000000000000000000000000000000 j!136) lt!300311)))

(declare-fun bs!19341 () Bool)

(assert (= bs!19341 d!91575))

(assert (=> bs!19341 m!620749))

(declare-fun m!621055 () Bool)

(assert (=> bs!19341 m!621055))

(assert (=> b!646833 d!91575))

(declare-fun b!647224 () Bool)

(declare-fun e!371059 () Bool)

(declare-fun e!371062 () Bool)

(assert (=> b!647224 (= e!371059 e!371062)))

(declare-fun res!419315 () Bool)

(assert (=> b!647224 (=> (not res!419315) (not e!371062))))

(declare-fun e!371060 () Bool)

(assert (=> b!647224 (= res!419315 (not e!371060))))

(declare-fun res!419313 () Bool)

(assert (=> b!647224 (=> (not res!419313) (not e!371060))))

(assert (=> b!647224 (= res!419313 (validKeyInArray!0 (select (arr!18448 lt!300133) #b00000000000000000000000000000000)))))

(declare-fun b!647225 () Bool)

(declare-fun e!371061 () Bool)

(declare-fun call!33675 () Bool)

(assert (=> b!647225 (= e!371061 call!33675)))

(declare-fun bm!33672 () Bool)

(declare-fun c!74324 () Bool)

(assert (=> bm!33672 (= call!33675 (arrayNoDuplicates!0 lt!300133 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74324 (Cons!12392 (select (arr!18448 lt!300133) #b00000000000000000000000000000000) Nil!12393) Nil!12393)))))

(declare-fun b!647227 () Bool)

(assert (=> b!647227 (= e!371062 e!371061)))

(assert (=> b!647227 (= c!74324 (validKeyInArray!0 (select (arr!18448 lt!300133) #b00000000000000000000000000000000)))))

(declare-fun b!647228 () Bool)

(declare-fun contains!3129 (List!12396 (_ BitVec 64)) Bool)

(assert (=> b!647228 (= e!371060 (contains!3129 Nil!12393 (select (arr!18448 lt!300133) #b00000000000000000000000000000000)))))

(declare-fun d!91577 () Bool)

(declare-fun res!419314 () Bool)

(assert (=> d!91577 (=> res!419314 e!371059)))

(assert (=> d!91577 (= res!419314 (bvsge #b00000000000000000000000000000000 (size!18812 lt!300133)))))

(assert (=> d!91577 (= (arrayNoDuplicates!0 lt!300133 #b00000000000000000000000000000000 Nil!12393) e!371059)))

(declare-fun b!647226 () Bool)

(assert (=> b!647226 (= e!371061 call!33675)))

(assert (= (and d!91577 (not res!419314)) b!647224))

(assert (= (and b!647224 res!419313) b!647228))

(assert (= (and b!647224 res!419315) b!647227))

(assert (= (and b!647227 c!74324) b!647226))

(assert (= (and b!647227 (not c!74324)) b!647225))

(assert (= (or b!647226 b!647225) bm!33672))

(declare-fun m!621080 () Bool)

(assert (=> b!647224 m!621080))

(assert (=> b!647224 m!621080))

(declare-fun m!621083 () Bool)

(assert (=> b!647224 m!621083))

(assert (=> bm!33672 m!621080))

(declare-fun m!621089 () Bool)

(assert (=> bm!33672 m!621089))

(assert (=> b!647227 m!621080))

(assert (=> b!647227 m!621080))

(assert (=> b!647227 m!621083))

(assert (=> b!647228 m!621080))

(assert (=> b!647228 m!621080))

(declare-fun m!621091 () Bool)

(assert (=> b!647228 m!621091))

(assert (=> b!646833 d!91577))

(declare-fun d!91585 () Bool)

(assert (=> d!91585 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18812 lt!300133)) (not (= (select (arr!18448 lt!300133) j!136) (select (arr!18448 a!2986) j!136))))))

(declare-fun lt!300327 () Unit!21963)

(declare-fun choose!21 (array!38481 (_ BitVec 64) (_ BitVec 32) List!12396) Unit!21963)

(assert (=> d!91585 (= lt!300327 (choose!21 lt!300133 (select (arr!18448 a!2986) j!136) j!136 Nil!12393))))

(assert (=> d!91585 (bvslt (size!18812 lt!300133) #b01111111111111111111111111111111)))

(assert (=> d!91585 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!300133 (select (arr!18448 a!2986) j!136) j!136 Nil!12393) lt!300327)))

(declare-fun bs!19343 () Bool)

(assert (= bs!19343 d!91585))

(assert (=> bs!19343 m!620991))

(assert (=> bs!19343 m!620697))

(declare-fun m!621111 () Bool)

(assert (=> bs!19343 m!621111))

(assert (=> b!646833 d!91585))

(declare-fun d!91595 () Bool)

(assert (=> d!91595 (arrayContainsKey!0 lt!300133 (select (arr!18448 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!300330 () Unit!21963)

(assert (=> d!91595 (= lt!300330 (choose!114 lt!300133 (select (arr!18448 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!91595 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!91595 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300133 (select (arr!18448 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!300330)))

(declare-fun bs!19344 () Bool)

(assert (= bs!19344 d!91595))

(assert (=> bs!19344 m!620697))

(assert (=> bs!19344 m!620741))

(assert (=> bs!19344 m!620697))

(declare-fun m!621113 () Bool)

(assert (=> bs!19344 m!621113))

(assert (=> b!646833 d!91595))

(declare-fun d!91597 () Bool)

(declare-fun e!371084 () Bool)

(assert (=> d!91597 e!371084))

(declare-fun res!419335 () Bool)

(assert (=> d!91597 (=> (not res!419335) (not e!371084))))

(assert (=> d!91597 (= res!419335 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18812 a!2986))))))

(declare-fun lt!300337 () Unit!21963)

(declare-fun choose!41 (array!38481 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12396) Unit!21963)

(assert (=> d!91597 (= lt!300337 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12393))))

(assert (=> d!91597 (bvslt (size!18812 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!91597 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12393) lt!300337)))

(declare-fun b!647252 () Bool)

(assert (=> b!647252 (= e!371084 (arrayNoDuplicates!0 (array!38482 (store (arr!18448 a!2986) i!1108 k0!1786) (size!18812 a!2986)) #b00000000000000000000000000000000 Nil!12393))))

(assert (= (and d!91597 res!419335) b!647252))

(declare-fun m!621127 () Bool)

(assert (=> d!91597 m!621127))

(assert (=> b!647252 m!620691))

(declare-fun m!621129 () Bool)

(assert (=> b!647252 m!621129))

(assert (=> b!646833 d!91597))

(declare-fun b!647253 () Bool)

(declare-fun e!371085 () Bool)

(declare-fun e!371088 () Bool)

(assert (=> b!647253 (= e!371085 e!371088)))

(declare-fun res!419338 () Bool)

(assert (=> b!647253 (=> (not res!419338) (not e!371088))))

(declare-fun e!371086 () Bool)

(assert (=> b!647253 (= res!419338 (not e!371086))))

(declare-fun res!419336 () Bool)

(assert (=> b!647253 (=> (not res!419336) (not e!371086))))

(assert (=> b!647253 (= res!419336 (validKeyInArray!0 (select (arr!18448 lt!300133) j!136)))))

(declare-fun b!647254 () Bool)

(declare-fun e!371087 () Bool)

(declare-fun call!33678 () Bool)

(assert (=> b!647254 (= e!371087 call!33678)))

(declare-fun bm!33675 () Bool)

(declare-fun c!74327 () Bool)

(assert (=> bm!33675 (= call!33678 (arrayNoDuplicates!0 lt!300133 (bvadd j!136 #b00000000000000000000000000000001) (ite c!74327 (Cons!12392 (select (arr!18448 lt!300133) j!136) Nil!12393) Nil!12393)))))

(declare-fun b!647256 () Bool)

(assert (=> b!647256 (= e!371088 e!371087)))

(assert (=> b!647256 (= c!74327 (validKeyInArray!0 (select (arr!18448 lt!300133) j!136)))))

(declare-fun b!647257 () Bool)

(assert (=> b!647257 (= e!371086 (contains!3129 Nil!12393 (select (arr!18448 lt!300133) j!136)))))

(declare-fun d!91605 () Bool)

(declare-fun res!419337 () Bool)

(assert (=> d!91605 (=> res!419337 e!371085)))

(assert (=> d!91605 (= res!419337 (bvsge j!136 (size!18812 lt!300133)))))

(assert (=> d!91605 (= (arrayNoDuplicates!0 lt!300133 j!136 Nil!12393) e!371085)))

(declare-fun b!647255 () Bool)

(assert (=> b!647255 (= e!371087 call!33678)))

(assert (= (and d!91605 (not res!419337)) b!647253))

(assert (= (and b!647253 res!419336) b!647257))

(assert (= (and b!647253 res!419338) b!647256))

(assert (= (and b!647256 c!74327) b!647255))

(assert (= (and b!647256 (not c!74327)) b!647254))

(assert (= (or b!647255 b!647254) bm!33675))

(assert (=> b!647253 m!620991))

(assert (=> b!647253 m!620991))

(declare-fun m!621131 () Bool)

(assert (=> b!647253 m!621131))

(assert (=> bm!33675 m!620991))

(declare-fun m!621133 () Bool)

(assert (=> bm!33675 m!621133))

(assert (=> b!647256 m!620991))

(assert (=> b!647256 m!620991))

(assert (=> b!647256 m!621131))

(assert (=> b!647257 m!620991))

(assert (=> b!647257 m!620991))

(declare-fun m!621135 () Bool)

(assert (=> b!647257 m!621135))

(assert (=> b!646833 d!91605))

(assert (=> b!646845 d!91543))

(declare-fun d!91607 () Bool)

(assert (=> d!91607 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!646831 d!91607))

(declare-fun d!91609 () Bool)

(assert (=> d!91609 (= (validKeyInArray!0 (select (arr!18448 a!2986) j!136)) (and (not (= (select (arr!18448 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18448 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!646842 d!91609))

(declare-fun d!91613 () Bool)

(declare-fun res!419345 () Bool)

(declare-fun e!371098 () Bool)

(assert (=> d!91613 (=> res!419345 e!371098)))

(assert (=> d!91613 (= res!419345 ((_ is Nil!12393) Nil!12393))))

(assert (=> d!91613 (= (noDuplicate!415 Nil!12393) e!371098)))

(declare-fun b!647270 () Bool)

(declare-fun e!371099 () Bool)

(assert (=> b!647270 (= e!371098 e!371099)))

(declare-fun res!419346 () Bool)

(assert (=> b!647270 (=> (not res!419346) (not e!371099))))

(assert (=> b!647270 (= res!419346 (not (contains!3129 (t!18616 Nil!12393) (h!13440 Nil!12393))))))

(declare-fun b!647271 () Bool)

(assert (=> b!647271 (= e!371099 (noDuplicate!415 (t!18616 Nil!12393)))))

(assert (= (and d!91613 (not res!419345)) b!647270))

(assert (= (and b!647270 res!419346) b!647271))

(declare-fun m!621145 () Bool)

(assert (=> b!647270 m!621145))

(declare-fun m!621147 () Bool)

(assert (=> b!647271 m!621147))

(assert (=> b!646843 d!91613))

(declare-fun b!647272 () Bool)

(declare-fun e!371100 () Bool)

(declare-fun e!371103 () Bool)

(assert (=> b!647272 (= e!371100 e!371103)))

(declare-fun res!419349 () Bool)

(assert (=> b!647272 (=> (not res!419349) (not e!371103))))

(declare-fun e!371101 () Bool)

(assert (=> b!647272 (= res!419349 (not e!371101))))

(declare-fun res!419347 () Bool)

(assert (=> b!647272 (=> (not res!419347) (not e!371101))))

(assert (=> b!647272 (= res!419347 (validKeyInArray!0 (select (arr!18448 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!647273 () Bool)

(declare-fun e!371102 () Bool)

(declare-fun call!33679 () Bool)

(assert (=> b!647273 (= e!371102 call!33679)))

(declare-fun bm!33676 () Bool)

(declare-fun c!74331 () Bool)

(assert (=> bm!33676 (= call!33679 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74331 (Cons!12392 (select (arr!18448 a!2986) #b00000000000000000000000000000000) Nil!12393) Nil!12393)))))

(declare-fun b!647275 () Bool)

(assert (=> b!647275 (= e!371103 e!371102)))

(assert (=> b!647275 (= c!74331 (validKeyInArray!0 (select (arr!18448 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!647276 () Bool)

(assert (=> b!647276 (= e!371101 (contains!3129 Nil!12393 (select (arr!18448 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!91617 () Bool)

(declare-fun res!419348 () Bool)

(assert (=> d!91617 (=> res!419348 e!371100)))

(assert (=> d!91617 (= res!419348 (bvsge #b00000000000000000000000000000000 (size!18812 a!2986)))))

(assert (=> d!91617 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12393) e!371100)))

(declare-fun b!647274 () Bool)

(assert (=> b!647274 (= e!371102 call!33679)))

(assert (= (and d!91617 (not res!419348)) b!647272))

(assert (= (and b!647272 res!419347) b!647276))

(assert (= (and b!647272 res!419349) b!647275))

(assert (= (and b!647275 c!74331) b!647274))

(assert (= (and b!647275 (not c!74331)) b!647273))

(assert (= (or b!647274 b!647273) bm!33676))

(assert (=> b!647272 m!620925))

(assert (=> b!647272 m!620925))

(assert (=> b!647272 m!621043))

(assert (=> bm!33676 m!620925))

(declare-fun m!621151 () Bool)

(assert (=> bm!33676 m!621151))

(assert (=> b!647275 m!620925))

(assert (=> b!647275 m!620925))

(assert (=> b!647275 m!621043))

(assert (=> b!647276 m!620925))

(assert (=> b!647276 m!620925))

(declare-fun m!621155 () Bool)

(assert (=> b!647276 m!621155))

(assert (=> b!646832 d!91617))

(check-sat (not d!91597) (not b!647253) (not b!647168) (not b!647008) (not d!91501) (not b!647017) (not d!91575) (not bm!33663) (not d!91503) (not bm!33675) (not b!647166) (not bm!33676) (not d!91539) (not b!647149) (not b!647111) (not b!647101) (not b!647256) (not b!647252) (not b!647270) (not b!647098) (not b!647272) (not b!647275) (not b!647035) (not d!91585) (not d!91495) (not b!647103) (not d!91563) (not b!647228) (not b!647227) (not d!91511) (not b!647257) (not b!647224) (not b!647023) (not d!91499) (not b!647164) (not d!91497) (not d!91595) (not b!647276) (not b!647014) (not b!647271) (not bm!33672))
(check-sat)
