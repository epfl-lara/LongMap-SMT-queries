; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57858 () Bool)

(assert start!57858)

(declare-fun b!639301 () Bool)

(declare-fun e!365875 () Bool)

(declare-fun e!365874 () Bool)

(assert (=> b!639301 (= e!365875 e!365874)))

(declare-fun res!413784 () Bool)

(assert (=> b!639301 (=> (not res!413784) (not e!365874))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38298 0))(
  ( (array!38299 (arr!18367 (Array (_ BitVec 32) (_ BitVec 64))) (size!18731 (_ BitVec 32))) )
))
(declare-fun lt!295693 () array!38298)

(declare-fun a!2986 () array!38298)

(declare-fun arrayContainsKey!0 (array!38298 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!639301 (= res!413784 (arrayContainsKey!0 lt!295693 (select (arr!18367 a!2986) j!136) j!136))))

(declare-fun b!639302 () Bool)

(declare-fun res!413780 () Bool)

(declare-fun e!365877 () Bool)

(assert (=> b!639302 (=> (not res!413780) (not e!365877))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!639302 (= res!413780 (validKeyInArray!0 (select (arr!18367 a!2986) j!136)))))

(declare-fun b!639303 () Bool)

(declare-datatypes ((Unit!21561 0))(
  ( (Unit!21562) )
))
(declare-fun e!365880 () Unit!21561)

(declare-fun Unit!21563 () Unit!21561)

(assert (=> b!639303 (= e!365880 Unit!21563)))

(assert (=> b!639303 false))

(declare-fun b!639304 () Bool)

(declare-fun e!365882 () Bool)

(declare-fun e!365883 () Bool)

(assert (=> b!639304 (= e!365882 e!365883)))

(declare-fun res!413772 () Bool)

(assert (=> b!639304 (=> (not res!413772) (not e!365883))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6763 0))(
  ( (MissingZero!6763 (index!29369 (_ BitVec 32))) (Found!6763 (index!29370 (_ BitVec 32))) (Intermediate!6763 (undefined!7575 Bool) (index!29371 (_ BitVec 32)) (x!58281 (_ BitVec 32))) (Undefined!6763) (MissingVacant!6763 (index!29372 (_ BitVec 32))) )
))
(declare-fun lt!295695 () SeekEntryResult!6763)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!639304 (= res!413772 (and (= lt!295695 (Found!6763 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18367 a!2986) index!984) (select (arr!18367 a!2986) j!136))) (not (= (select (arr!18367 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38298 (_ BitVec 32)) SeekEntryResult!6763)

(assert (=> b!639304 (= lt!295695 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18367 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!639305 () Bool)

(declare-fun e!365873 () Bool)

(assert (=> b!639305 (= e!365873 e!365882)))

(declare-fun res!413787 () Bool)

(assert (=> b!639305 (=> (not res!413787) (not e!365882))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!639305 (= res!413787 (= (select (store (arr!18367 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!639305 (= lt!295693 (array!38299 (store (arr!18367 a!2986) i!1108 k0!1786) (size!18731 a!2986)))))

(declare-fun b!639306 () Bool)

(declare-fun e!365872 () Bool)

(assert (=> b!639306 (= e!365883 (not e!365872))))

(declare-fun res!413779 () Bool)

(assert (=> b!639306 (=> res!413779 e!365872)))

(declare-fun lt!295688 () SeekEntryResult!6763)

(assert (=> b!639306 (= res!413779 (not (= lt!295688 (Found!6763 index!984))))))

(declare-fun lt!295691 () Unit!21561)

(assert (=> b!639306 (= lt!295691 e!365880)))

(declare-fun c!73133 () Bool)

(assert (=> b!639306 (= c!73133 (= lt!295688 Undefined!6763))))

(declare-fun lt!295694 () (_ BitVec 64))

(assert (=> b!639306 (= lt!295688 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295694 lt!295693 mask!3053))))

(declare-fun e!365879 () Bool)

(assert (=> b!639306 e!365879))

(declare-fun res!413781 () Bool)

(assert (=> b!639306 (=> (not res!413781) (not e!365879))))

(declare-fun lt!295689 () (_ BitVec 32))

(declare-fun lt!295686 () SeekEntryResult!6763)

(assert (=> b!639306 (= res!413781 (= lt!295686 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295689 vacantSpotIndex!68 lt!295694 lt!295693 mask!3053)))))

(assert (=> b!639306 (= lt!295686 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295689 vacantSpotIndex!68 (select (arr!18367 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!639306 (= lt!295694 (select (store (arr!18367 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!295692 () Unit!21561)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38298 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21561)

(assert (=> b!639306 (= lt!295692 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295689 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!639306 (= lt!295689 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!639307 () Bool)

(declare-fun e!365876 () Bool)

(assert (=> b!639307 (= e!365872 e!365876)))

(declare-fun res!413773 () Bool)

(assert (=> b!639307 (=> res!413773 e!365876)))

(declare-fun lt!295687 () (_ BitVec 64))

(assert (=> b!639307 (= res!413773 (or (not (= (select (arr!18367 a!2986) j!136) lt!295694)) (not (= (select (arr!18367 a!2986) j!136) lt!295687)) (bvsge j!136 index!984)))))

(declare-fun e!365878 () Bool)

(assert (=> b!639307 e!365878))

(declare-fun res!413786 () Bool)

(assert (=> b!639307 (=> (not res!413786) (not e!365878))))

(assert (=> b!639307 (= res!413786 (= lt!295687 (select (arr!18367 a!2986) j!136)))))

(assert (=> b!639307 (= lt!295687 (select (store (arr!18367 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!639308 () Bool)

(assert (=> b!639308 (= e!365874 (arrayContainsKey!0 lt!295693 (select (arr!18367 a!2986) j!136) index!984))))

(declare-fun b!639309 () Bool)

(assert (=> b!639309 (= e!365878 e!365875)))

(declare-fun res!413783 () Bool)

(assert (=> b!639309 (=> res!413783 e!365875)))

(assert (=> b!639309 (= res!413783 (or (not (= (select (arr!18367 a!2986) j!136) lt!295694)) (not (= (select (arr!18367 a!2986) j!136) lt!295687)) (bvsge j!136 index!984)))))

(declare-fun b!639310 () Bool)

(declare-fun res!413788 () Bool)

(assert (=> b!639310 (=> (not res!413788) (not e!365873))))

(assert (=> b!639310 (= res!413788 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18367 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!639311 () Bool)

(declare-fun Unit!21564 () Unit!21561)

(assert (=> b!639311 (= e!365880 Unit!21564)))

(declare-fun b!639312 () Bool)

(declare-fun res!413785 () Bool)

(assert (=> b!639312 (=> (not res!413785) (not e!365873))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38298 (_ BitVec 32)) Bool)

(assert (=> b!639312 (= res!413785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!639313 () Bool)

(assert (=> b!639313 (= e!365876 true)))

(declare-datatypes ((List!12315 0))(
  ( (Nil!12312) (Cons!12311 (h!13359 (_ BitVec 64)) (t!18535 List!12315)) )
))
(declare-fun arrayNoDuplicates!0 (array!38298 (_ BitVec 32) List!12315) Bool)

(assert (=> b!639313 (arrayNoDuplicates!0 lt!295693 #b00000000000000000000000000000000 Nil!12312)))

(declare-fun lt!295696 () Unit!21561)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38298 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12315) Unit!21561)

(assert (=> b!639313 (= lt!295696 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12312))))

(assert (=> b!639313 (arrayContainsKey!0 lt!295693 (select (arr!18367 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295690 () Unit!21561)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38298 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21561)

(assert (=> b!639313 (= lt!295690 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295693 (select (arr!18367 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun res!413774 () Bool)

(assert (=> start!57858 (=> (not res!413774) (not e!365877))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57858 (= res!413774 (validMask!0 mask!3053))))

(assert (=> start!57858 e!365877))

(assert (=> start!57858 true))

(declare-fun array_inv!14226 (array!38298) Bool)

(assert (=> start!57858 (array_inv!14226 a!2986)))

(declare-fun b!639314 () Bool)

(assert (=> b!639314 (= e!365877 e!365873)))

(declare-fun res!413775 () Bool)

(assert (=> b!639314 (=> (not res!413775) (not e!365873))))

(declare-fun lt!295685 () SeekEntryResult!6763)

(assert (=> b!639314 (= res!413775 (or (= lt!295685 (MissingZero!6763 i!1108)) (= lt!295685 (MissingVacant!6763 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38298 (_ BitVec 32)) SeekEntryResult!6763)

(assert (=> b!639314 (= lt!295685 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!639315 () Bool)

(declare-fun res!413778 () Bool)

(assert (=> b!639315 (=> (not res!413778) (not e!365873))))

(assert (=> b!639315 (= res!413778 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12312))))

(declare-fun b!639316 () Bool)

(declare-fun res!413777 () Bool)

(assert (=> b!639316 (=> (not res!413777) (not e!365877))))

(assert (=> b!639316 (= res!413777 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!639317 () Bool)

(assert (=> b!639317 (= e!365879 (= lt!295695 lt!295686))))

(declare-fun b!639318 () Bool)

(declare-fun res!413776 () Bool)

(assert (=> b!639318 (=> (not res!413776) (not e!365877))))

(assert (=> b!639318 (= res!413776 (validKeyInArray!0 k0!1786))))

(declare-fun b!639319 () Bool)

(declare-fun res!413782 () Bool)

(assert (=> b!639319 (=> (not res!413782) (not e!365877))))

(assert (=> b!639319 (= res!413782 (and (= (size!18731 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18731 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18731 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!57858 res!413774) b!639319))

(assert (= (and b!639319 res!413782) b!639302))

(assert (= (and b!639302 res!413780) b!639318))

(assert (= (and b!639318 res!413776) b!639316))

(assert (= (and b!639316 res!413777) b!639314))

(assert (= (and b!639314 res!413775) b!639312))

(assert (= (and b!639312 res!413785) b!639315))

(assert (= (and b!639315 res!413778) b!639310))

(assert (= (and b!639310 res!413788) b!639305))

(assert (= (and b!639305 res!413787) b!639304))

(assert (= (and b!639304 res!413772) b!639306))

(assert (= (and b!639306 res!413781) b!639317))

(assert (= (and b!639306 c!73133) b!639303))

(assert (= (and b!639306 (not c!73133)) b!639311))

(assert (= (and b!639306 (not res!413779)) b!639307))

(assert (= (and b!639307 res!413786) b!639309))

(assert (= (and b!639309 (not res!413783)) b!639301))

(assert (= (and b!639301 res!413784) b!639308))

(assert (= (and b!639307 (not res!413773)) b!639313))

(declare-fun m!613555 () Bool)

(assert (=> b!639312 m!613555))

(declare-fun m!613557 () Bool)

(assert (=> b!639301 m!613557))

(assert (=> b!639301 m!613557))

(declare-fun m!613559 () Bool)

(assert (=> b!639301 m!613559))

(declare-fun m!613561 () Bool)

(assert (=> b!639314 m!613561))

(declare-fun m!613563 () Bool)

(assert (=> b!639315 m!613563))

(declare-fun m!613565 () Bool)

(assert (=> b!639305 m!613565))

(declare-fun m!613567 () Bool)

(assert (=> b!639305 m!613567))

(declare-fun m!613569 () Bool)

(assert (=> b!639304 m!613569))

(assert (=> b!639304 m!613557))

(assert (=> b!639304 m!613557))

(declare-fun m!613571 () Bool)

(assert (=> b!639304 m!613571))

(assert (=> b!639308 m!613557))

(assert (=> b!639308 m!613557))

(declare-fun m!613573 () Bool)

(assert (=> b!639308 m!613573))

(declare-fun m!613575 () Bool)

(assert (=> b!639313 m!613575))

(assert (=> b!639313 m!613557))

(assert (=> b!639313 m!613557))

(declare-fun m!613577 () Bool)

(assert (=> b!639313 m!613577))

(assert (=> b!639313 m!613557))

(declare-fun m!613579 () Bool)

(assert (=> b!639313 m!613579))

(declare-fun m!613581 () Bool)

(assert (=> b!639313 m!613581))

(declare-fun m!613583 () Bool)

(assert (=> b!639316 m!613583))

(assert (=> b!639302 m!613557))

(assert (=> b!639302 m!613557))

(declare-fun m!613585 () Bool)

(assert (=> b!639302 m!613585))

(declare-fun m!613587 () Bool)

(assert (=> b!639310 m!613587))

(assert (=> b!639307 m!613557))

(assert (=> b!639307 m!613565))

(declare-fun m!613589 () Bool)

(assert (=> b!639307 m!613589))

(declare-fun m!613591 () Bool)

(assert (=> b!639318 m!613591))

(assert (=> b!639309 m!613557))

(declare-fun m!613593 () Bool)

(assert (=> b!639306 m!613593))

(assert (=> b!639306 m!613557))

(assert (=> b!639306 m!613565))

(declare-fun m!613595 () Bool)

(assert (=> b!639306 m!613595))

(declare-fun m!613597 () Bool)

(assert (=> b!639306 m!613597))

(declare-fun m!613599 () Bool)

(assert (=> b!639306 m!613599))

(declare-fun m!613601 () Bool)

(assert (=> b!639306 m!613601))

(assert (=> b!639306 m!613557))

(declare-fun m!613603 () Bool)

(assert (=> b!639306 m!613603))

(declare-fun m!613605 () Bool)

(assert (=> start!57858 m!613605))

(declare-fun m!613607 () Bool)

(assert (=> start!57858 m!613607))

(check-sat (not b!639308) (not b!639313) (not start!57858) (not b!639301) (not b!639316) (not b!639315) (not b!639314) (not b!639304) (not b!639318) (not b!639312) (not b!639302) (not b!639306))
(check-sat)
