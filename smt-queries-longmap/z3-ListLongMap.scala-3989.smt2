; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54114 () Bool)

(assert start!54114)

(declare-fun b!590679 () Bool)

(declare-fun e!337235 () Bool)

(declare-fun e!337236 () Bool)

(assert (=> b!590679 (= e!337235 e!337236)))

(declare-fun res!377793 () Bool)

(assert (=> b!590679 (=> (not res!377793) (not e!337236))))

(declare-datatypes ((SeekEntryResult!6088 0))(
  ( (MissingZero!6088 (index!26585 (_ BitVec 32))) (Found!6088 (index!26586 (_ BitVec 32))) (Intermediate!6088 (undefined!6900 Bool) (index!26587 (_ BitVec 32)) (x!55530 (_ BitVec 32))) (Undefined!6088) (MissingVacant!6088 (index!26588 (_ BitVec 32))) )
))
(declare-fun lt!267986 () SeekEntryResult!6088)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!590679 (= res!377793 (or (= lt!267986 (MissingZero!6088 i!1108)) (= lt!267986 (MissingVacant!6088 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36846 0))(
  ( (array!36847 (arr!17692 (Array (_ BitVec 32) (_ BitVec 64))) (size!18056 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36846)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36846 (_ BitVec 32)) SeekEntryResult!6088)

(assert (=> b!590679 (= lt!267986 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!590680 () Bool)

(declare-fun res!377795 () Bool)

(assert (=> b!590680 (=> (not res!377795) (not e!337236))))

(declare-datatypes ((List!11640 0))(
  ( (Nil!11637) (Cons!11636 (h!12684 (_ BitVec 64)) (t!17860 List!11640)) )
))
(declare-fun arrayNoDuplicates!0 (array!36846 (_ BitVec 32) List!11640) Bool)

(assert (=> b!590680 (= res!377795 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11637))))

(declare-fun b!590682 () Bool)

(declare-fun res!377801 () Bool)

(assert (=> b!590682 (=> (not res!377801) (not e!337235))))

(declare-fun arrayContainsKey!0 (array!36846 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!590682 (= res!377801 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!267988 () (_ BitVec 64))

(declare-fun e!337233 () Bool)

(declare-fun b!590683 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!590683 (= e!337233 (or (not (= (select (arr!17692 a!2986) j!136) lt!267988)) (not (= (select (arr!17692 a!2986) j!136) (select (store (arr!17692 a!2986) i!1108 k0!1786) index!984))) (bvsge j!136 index!984) (bvslt index!984 (size!18056 a!2986))))))

(declare-fun e!337234 () Bool)

(assert (=> b!590683 e!337234))

(declare-fun res!377792 () Bool)

(assert (=> b!590683 (=> (not res!377792) (not e!337234))))

(assert (=> b!590683 (= res!377792 (= (select (store (arr!17692 a!2986) i!1108 k0!1786) index!984) (select (arr!17692 a!2986) j!136)))))

(declare-fun b!590684 () Bool)

(declare-fun e!337237 () Bool)

(assert (=> b!590684 (= e!337237 (not e!337233))))

(declare-fun res!377803 () Bool)

(assert (=> b!590684 (=> res!377803 e!337233)))

(declare-fun lt!267987 () SeekEntryResult!6088)

(assert (=> b!590684 (= res!377803 (not (= lt!267987 (Found!6088 index!984))))))

(declare-datatypes ((Unit!18445 0))(
  ( (Unit!18446) )
))
(declare-fun lt!267985 () Unit!18445)

(declare-fun e!337242 () Unit!18445)

(assert (=> b!590684 (= lt!267985 e!337242)))

(declare-fun c!66812 () Bool)

(assert (=> b!590684 (= c!66812 (= lt!267987 Undefined!6088))))

(declare-fun lt!267991 () array!36846)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36846 (_ BitVec 32)) SeekEntryResult!6088)

(assert (=> b!590684 (= lt!267987 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267988 lt!267991 mask!3053))))

(declare-fun e!337240 () Bool)

(assert (=> b!590684 e!337240))

(declare-fun res!377796 () Bool)

(assert (=> b!590684 (=> (not res!377796) (not e!337240))))

(declare-fun lt!267989 () (_ BitVec 32))

(declare-fun lt!267990 () SeekEntryResult!6088)

(assert (=> b!590684 (= res!377796 (= lt!267990 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267989 vacantSpotIndex!68 lt!267988 lt!267991 mask!3053)))))

(assert (=> b!590684 (= lt!267990 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267989 vacantSpotIndex!68 (select (arr!17692 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!590684 (= lt!267988 (select (store (arr!17692 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!267983 () Unit!18445)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36846 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18445)

(assert (=> b!590684 (= lt!267983 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267989 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!590684 (= lt!267989 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!590685 () Bool)

(declare-fun res!377799 () Bool)

(assert (=> b!590685 (=> (not res!377799) (not e!337235))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!590685 (= res!377799 (validKeyInArray!0 (select (arr!17692 a!2986) j!136)))))

(declare-fun b!590686 () Bool)

(declare-fun e!337239 () Bool)

(assert (=> b!590686 (= e!337234 e!337239)))

(declare-fun res!377805 () Bool)

(assert (=> b!590686 (=> res!377805 e!337239)))

(assert (=> b!590686 (= res!377805 (or (not (= (select (arr!17692 a!2986) j!136) lt!267988)) (not (= (select (arr!17692 a!2986) j!136) (select (store (arr!17692 a!2986) i!1108 k0!1786) index!984))) (bvsge j!136 index!984)))))

(declare-fun b!590687 () Bool)

(declare-fun res!377798 () Bool)

(assert (=> b!590687 (=> (not res!377798) (not e!337235))))

(assert (=> b!590687 (= res!377798 (and (= (size!18056 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18056 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18056 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!590688 () Bool)

(declare-fun e!337241 () Bool)

(assert (=> b!590688 (= e!337236 e!337241)))

(declare-fun res!377804 () Bool)

(assert (=> b!590688 (=> (not res!377804) (not e!337241))))

(assert (=> b!590688 (= res!377804 (= (select (store (arr!17692 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!590688 (= lt!267991 (array!36847 (store (arr!17692 a!2986) i!1108 k0!1786) (size!18056 a!2986)))))

(declare-fun b!590689 () Bool)

(assert (=> b!590689 (= e!337241 e!337237)))

(declare-fun res!377800 () Bool)

(assert (=> b!590689 (=> (not res!377800) (not e!337237))))

(declare-fun lt!267984 () SeekEntryResult!6088)

(assert (=> b!590689 (= res!377800 (and (= lt!267984 (Found!6088 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17692 a!2986) index!984) (select (arr!17692 a!2986) j!136))) (not (= (select (arr!17692 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!590689 (= lt!267984 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17692 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!590690 () Bool)

(declare-fun Unit!18447 () Unit!18445)

(assert (=> b!590690 (= e!337242 Unit!18447)))

(declare-fun b!590691 () Bool)

(assert (=> b!590691 (= e!337240 (= lt!267984 lt!267990))))

(declare-fun b!590692 () Bool)

(declare-fun Unit!18448 () Unit!18445)

(assert (=> b!590692 (= e!337242 Unit!18448)))

(assert (=> b!590692 false))

(declare-fun b!590681 () Bool)

(assert (=> b!590681 (= e!337239 (arrayContainsKey!0 lt!267991 (select (arr!17692 a!2986) j!136) j!136))))

(declare-fun res!377794 () Bool)

(assert (=> start!54114 (=> (not res!377794) (not e!337235))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54114 (= res!377794 (validMask!0 mask!3053))))

(assert (=> start!54114 e!337235))

(assert (=> start!54114 true))

(declare-fun array_inv!13551 (array!36846) Bool)

(assert (=> start!54114 (array_inv!13551 a!2986)))

(declare-fun b!590693 () Bool)

(declare-fun res!377802 () Bool)

(assert (=> b!590693 (=> (not res!377802) (not e!337236))))

(assert (=> b!590693 (= res!377802 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17692 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!590694 () Bool)

(declare-fun res!377797 () Bool)

(assert (=> b!590694 (=> (not res!377797) (not e!337235))))

(assert (=> b!590694 (= res!377797 (validKeyInArray!0 k0!1786))))

(declare-fun b!590695 () Bool)

(declare-fun res!377806 () Bool)

(assert (=> b!590695 (=> (not res!377806) (not e!337236))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36846 (_ BitVec 32)) Bool)

(assert (=> b!590695 (= res!377806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!54114 res!377794) b!590687))

(assert (= (and b!590687 res!377798) b!590685))

(assert (= (and b!590685 res!377799) b!590694))

(assert (= (and b!590694 res!377797) b!590682))

(assert (= (and b!590682 res!377801) b!590679))

(assert (= (and b!590679 res!377793) b!590695))

(assert (= (and b!590695 res!377806) b!590680))

(assert (= (and b!590680 res!377795) b!590693))

(assert (= (and b!590693 res!377802) b!590688))

(assert (= (and b!590688 res!377804) b!590689))

(assert (= (and b!590689 res!377800) b!590684))

(assert (= (and b!590684 res!377796) b!590691))

(assert (= (and b!590684 c!66812) b!590692))

(assert (= (and b!590684 (not c!66812)) b!590690))

(assert (= (and b!590684 (not res!377803)) b!590683))

(assert (= (and b!590683 res!377792) b!590686))

(assert (= (and b!590686 (not res!377805)) b!590681))

(declare-fun m!569243 () Bool)

(assert (=> b!590693 m!569243))

(declare-fun m!569245 () Bool)

(assert (=> b!590685 m!569245))

(assert (=> b!590685 m!569245))

(declare-fun m!569247 () Bool)

(assert (=> b!590685 m!569247))

(assert (=> b!590686 m!569245))

(declare-fun m!569249 () Bool)

(assert (=> b!590686 m!569249))

(declare-fun m!569251 () Bool)

(assert (=> b!590686 m!569251))

(declare-fun m!569253 () Bool)

(assert (=> b!590679 m!569253))

(declare-fun m!569255 () Bool)

(assert (=> b!590680 m!569255))

(declare-fun m!569257 () Bool)

(assert (=> b!590684 m!569257))

(declare-fun m!569259 () Bool)

(assert (=> b!590684 m!569259))

(declare-fun m!569261 () Bool)

(assert (=> b!590684 m!569261))

(assert (=> b!590684 m!569245))

(assert (=> b!590684 m!569249))

(assert (=> b!590684 m!569245))

(declare-fun m!569263 () Bool)

(assert (=> b!590684 m!569263))

(declare-fun m!569265 () Bool)

(assert (=> b!590684 m!569265))

(declare-fun m!569267 () Bool)

(assert (=> b!590684 m!569267))

(assert (=> b!590688 m!569249))

(declare-fun m!569269 () Bool)

(assert (=> b!590688 m!569269))

(declare-fun m!569271 () Bool)

(assert (=> b!590695 m!569271))

(declare-fun m!569273 () Bool)

(assert (=> b!590694 m!569273))

(assert (=> b!590681 m!569245))

(assert (=> b!590681 m!569245))

(declare-fun m!569275 () Bool)

(assert (=> b!590681 m!569275))

(declare-fun m!569277 () Bool)

(assert (=> start!54114 m!569277))

(declare-fun m!569279 () Bool)

(assert (=> start!54114 m!569279))

(declare-fun m!569281 () Bool)

(assert (=> b!590689 m!569281))

(assert (=> b!590689 m!569245))

(assert (=> b!590689 m!569245))

(declare-fun m!569283 () Bool)

(assert (=> b!590689 m!569283))

(assert (=> b!590683 m!569245))

(assert (=> b!590683 m!569249))

(assert (=> b!590683 m!569251))

(declare-fun m!569285 () Bool)

(assert (=> b!590682 m!569285))

(check-sat (not b!590694) (not b!590684) (not b!590679) (not b!590685) (not b!590689) (not b!590682) (not b!590681) (not b!590695) (not start!54114) (not b!590680))
(check-sat)
