; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56052 () Bool)

(assert start!56052)

(declare-fun b!615641 () Bool)

(declare-datatypes ((Unit!19927 0))(
  ( (Unit!19928) )
))
(declare-fun e!352991 () Unit!19927)

(declare-fun Unit!19929 () Unit!19927)

(assert (=> b!615641 (= e!352991 Unit!19929)))

(declare-fun b!615642 () Bool)

(declare-fun e!352996 () Unit!19927)

(declare-fun Unit!19930 () Unit!19927)

(assert (=> b!615642 (= e!352996 Unit!19930)))

(declare-fun b!615643 () Bool)

(declare-fun res!396522 () Bool)

(declare-fun e!353002 () Bool)

(assert (=> b!615643 (=> (not res!396522) (not e!353002))))

(declare-datatypes ((array!37467 0))(
  ( (array!37468 (arr!17977 (Array (_ BitVec 32) (_ BitVec 64))) (size!18341 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37467)

(declare-datatypes ((List!11925 0))(
  ( (Nil!11922) (Cons!11921 (h!12969 (_ BitVec 64)) (t!18145 List!11925)) )
))
(declare-fun arrayNoDuplicates!0 (array!37467 (_ BitVec 32) List!11925) Bool)

(assert (=> b!615643 (= res!396522 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11922))))

(declare-fun res!396517 () Bool)

(declare-fun e!353003 () Bool)

(assert (=> start!56052 (=> (not res!396517) (not e!353003))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56052 (= res!396517 (validMask!0 mask!3053))))

(assert (=> start!56052 e!353003))

(assert (=> start!56052 true))

(declare-fun array_inv!13836 (array!37467) Bool)

(assert (=> start!56052 (array_inv!13836 a!2986)))

(declare-fun b!615644 () Bool)

(declare-fun res!396529 () Bool)

(assert (=> b!615644 (=> (not res!396529) (not e!353003))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!615644 (= res!396529 (validKeyInArray!0 (select (arr!17977 a!2986) j!136)))))

(declare-fun b!615645 () Bool)

(declare-fun res!396523 () Bool)

(assert (=> b!615645 (=> (not res!396523) (not e!353002))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!615645 (= res!396523 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17977 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!615646 () Bool)

(declare-fun e!352993 () Bool)

(declare-datatypes ((SeekEntryResult!6373 0))(
  ( (MissingZero!6373 (index!27776 (_ BitVec 32))) (Found!6373 (index!27777 (_ BitVec 32))) (Intermediate!6373 (undefined!7185 Bool) (index!27778 (_ BitVec 32)) (x!56728 (_ BitVec 32))) (Undefined!6373) (MissingVacant!6373 (index!27779 (_ BitVec 32))) )
))
(declare-fun lt!282789 () SeekEntryResult!6373)

(declare-fun lt!282796 () SeekEntryResult!6373)

(assert (=> b!615646 (= e!352993 (= lt!282789 lt!282796))))

(declare-fun b!615647 () Bool)

(declare-fun e!352999 () Bool)

(assert (=> b!615647 (= e!352999 (not true))))

(declare-fun lt!282788 () Unit!19927)

(assert (=> b!615647 (= lt!282788 e!352991)))

(declare-fun c!69935 () Bool)

(declare-fun lt!282799 () SeekEntryResult!6373)

(assert (=> b!615647 (= c!69935 (= lt!282799 (Found!6373 index!984)))))

(declare-fun lt!282785 () Unit!19927)

(declare-fun e!353004 () Unit!19927)

(assert (=> b!615647 (= lt!282785 e!353004)))

(declare-fun c!69932 () Bool)

(assert (=> b!615647 (= c!69932 (= lt!282799 Undefined!6373))))

(declare-fun lt!282782 () (_ BitVec 64))

(declare-fun lt!282784 () array!37467)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37467 (_ BitVec 32)) SeekEntryResult!6373)

(assert (=> b!615647 (= lt!282799 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!282782 lt!282784 mask!3053))))

(assert (=> b!615647 e!352993))

(declare-fun res!396526 () Bool)

(assert (=> b!615647 (=> (not res!396526) (not e!352993))))

(declare-fun lt!282791 () (_ BitVec 32))

(assert (=> b!615647 (= res!396526 (= lt!282796 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282791 vacantSpotIndex!68 lt!282782 lt!282784 mask!3053)))))

(assert (=> b!615647 (= lt!282796 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282791 vacantSpotIndex!68 (select (arr!17977 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!615647 (= lt!282782 (select (store (arr!17977 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!282780 () Unit!19927)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37467 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19927)

(assert (=> b!615647 (= lt!282780 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!282791 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!615647 (= lt!282791 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!615648 () Bool)

(declare-fun Unit!19931 () Unit!19927)

(assert (=> b!615648 (= e!353004 Unit!19931)))

(assert (=> b!615648 false))

(declare-fun b!615649 () Bool)

(declare-fun e!353000 () Unit!19927)

(declare-fun Unit!19932 () Unit!19927)

(assert (=> b!615649 (= e!353000 Unit!19932)))

(declare-fun b!615650 () Bool)

(declare-fun res!396516 () Bool)

(assert (=> b!615650 (=> (not res!396516) (not e!353002))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37467 (_ BitVec 32)) Bool)

(assert (=> b!615650 (= res!396516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!615651 () Bool)

(declare-fun res!396518 () Bool)

(assert (=> b!615651 (=> (not res!396518) (not e!353003))))

(declare-fun arrayContainsKey!0 (array!37467 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!615651 (= res!396518 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun e!352998 () Bool)

(declare-fun b!615652 () Bool)

(assert (=> b!615652 (= e!352998 (arrayContainsKey!0 lt!282784 (select (arr!17977 a!2986) j!136) index!984))))

(declare-fun b!615653 () Bool)

(declare-fun res!396524 () Bool)

(assert (=> b!615653 (=> (not res!396524) (not e!353003))))

(assert (=> b!615653 (= res!396524 (and (= (size!18341 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18341 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18341 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!615654 () Bool)

(declare-fun e!352995 () Bool)

(assert (=> b!615654 (= e!352995 (arrayContainsKey!0 lt!282784 (select (arr!17977 a!2986) j!136) index!984))))

(declare-fun b!615655 () Bool)

(assert (=> b!615655 (= e!353003 e!353002)))

(declare-fun res!396520 () Bool)

(assert (=> b!615655 (=> (not res!396520) (not e!353002))))

(declare-fun lt!282793 () SeekEntryResult!6373)

(assert (=> b!615655 (= res!396520 (or (= lt!282793 (MissingZero!6373 i!1108)) (= lt!282793 (MissingVacant!6373 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37467 (_ BitVec 32)) SeekEntryResult!6373)

(assert (=> b!615655 (= lt!282793 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!615656 () Bool)

(declare-fun res!396514 () Bool)

(assert (=> b!615656 (= res!396514 (arrayContainsKey!0 lt!282784 (select (arr!17977 a!2986) j!136) j!136))))

(assert (=> b!615656 (=> (not res!396514) (not e!352995))))

(declare-fun e!352992 () Bool)

(assert (=> b!615656 (= e!352992 e!352995)))

(declare-fun b!615657 () Bool)

(assert (=> b!615657 false))

(declare-fun lt!282794 () Unit!19927)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37467 (_ BitVec 64) (_ BitVec 32) List!11925) Unit!19927)

(assert (=> b!615657 (= lt!282794 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282784 (select (arr!17977 a!2986) j!136) j!136 Nil!11922))))

(assert (=> b!615657 (arrayNoDuplicates!0 lt!282784 j!136 Nil!11922)))

(declare-fun lt!282798 () Unit!19927)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37467 (_ BitVec 32) (_ BitVec 32)) Unit!19927)

(assert (=> b!615657 (= lt!282798 (lemmaNoDuplicateFromThenFromBigger!0 lt!282784 #b00000000000000000000000000000000 j!136))))

(assert (=> b!615657 (arrayNoDuplicates!0 lt!282784 #b00000000000000000000000000000000 Nil!11922)))

(declare-fun lt!282787 () Unit!19927)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37467 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11925) Unit!19927)

(assert (=> b!615657 (= lt!282787 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11922))))

(assert (=> b!615657 (arrayContainsKey!0 lt!282784 (select (arr!17977 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!282795 () Unit!19927)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37467 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19927)

(assert (=> b!615657 (= lt!282795 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282784 (select (arr!17977 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!19933 () Unit!19927)

(assert (=> b!615657 (= e!352996 Unit!19933)))

(declare-fun b!615658 () Bool)

(declare-fun e!352994 () Bool)

(assert (=> b!615658 (= e!353002 e!352994)))

(declare-fun res!396525 () Bool)

(assert (=> b!615658 (=> (not res!396525) (not e!352994))))

(assert (=> b!615658 (= res!396525 (= (select (store (arr!17977 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!615658 (= lt!282784 (array!37468 (store (arr!17977 a!2986) i!1108 k0!1786) (size!18341 a!2986)))))

(declare-fun b!615659 () Bool)

(declare-fun Unit!19934 () Unit!19927)

(assert (=> b!615659 (= e!353004 Unit!19934)))

(declare-fun b!615660 () Bool)

(declare-fun Unit!19935 () Unit!19927)

(assert (=> b!615660 (= e!352991 Unit!19935)))

(declare-fun res!396519 () Bool)

(assert (=> b!615660 (= res!396519 (= (select (store (arr!17977 a!2986) i!1108 k0!1786) index!984) (select (arr!17977 a!2986) j!136)))))

(declare-fun e!353001 () Bool)

(assert (=> b!615660 (=> (not res!396519) (not e!353001))))

(assert (=> b!615660 e!353001))

(declare-fun c!69933 () Bool)

(assert (=> b!615660 (= c!69933 (bvslt j!136 index!984))))

(declare-fun lt!282797 () Unit!19927)

(assert (=> b!615660 (= lt!282797 e!352996)))

(declare-fun c!69934 () Bool)

(assert (=> b!615660 (= c!69934 (bvslt index!984 j!136))))

(declare-fun lt!282792 () Unit!19927)

(assert (=> b!615660 (= lt!282792 e!353000)))

(assert (=> b!615660 false))

(declare-fun b!615661 () Bool)

(declare-fun res!396515 () Bool)

(assert (=> b!615661 (= res!396515 (bvsge j!136 index!984))))

(assert (=> b!615661 (=> res!396515 e!352992)))

(assert (=> b!615661 (= e!353001 e!352992)))

(declare-fun b!615662 () Bool)

(assert (=> b!615662 (= e!352994 e!352999)))

(declare-fun res!396528 () Bool)

(assert (=> b!615662 (=> (not res!396528) (not e!352999))))

(assert (=> b!615662 (= res!396528 (and (= lt!282789 (Found!6373 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17977 a!2986) index!984) (select (arr!17977 a!2986) j!136))) (not (= (select (arr!17977 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!615662 (= lt!282789 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17977 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!615663 () Bool)

(assert (=> b!615663 false))

(declare-fun lt!282790 () Unit!19927)

(assert (=> b!615663 (= lt!282790 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282784 (select (arr!17977 a!2986) j!136) index!984 Nil!11922))))

(assert (=> b!615663 (arrayNoDuplicates!0 lt!282784 index!984 Nil!11922)))

(declare-fun lt!282786 () Unit!19927)

(assert (=> b!615663 (= lt!282786 (lemmaNoDuplicateFromThenFromBigger!0 lt!282784 #b00000000000000000000000000000000 index!984))))

(assert (=> b!615663 (arrayNoDuplicates!0 lt!282784 #b00000000000000000000000000000000 Nil!11922)))

(declare-fun lt!282783 () Unit!19927)

(assert (=> b!615663 (= lt!282783 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11922))))

(assert (=> b!615663 (arrayContainsKey!0 lt!282784 (select (arr!17977 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!282781 () Unit!19927)

(assert (=> b!615663 (= lt!282781 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282784 (select (arr!17977 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!615663 e!352998))

(declare-fun res!396521 () Bool)

(assert (=> b!615663 (=> (not res!396521) (not e!352998))))

(assert (=> b!615663 (= res!396521 (arrayContainsKey!0 lt!282784 (select (arr!17977 a!2986) j!136) j!136))))

(declare-fun Unit!19936 () Unit!19927)

(assert (=> b!615663 (= e!353000 Unit!19936)))

(declare-fun b!615664 () Bool)

(declare-fun res!396527 () Bool)

(assert (=> b!615664 (=> (not res!396527) (not e!353003))))

(assert (=> b!615664 (= res!396527 (validKeyInArray!0 k0!1786))))

(assert (= (and start!56052 res!396517) b!615653))

(assert (= (and b!615653 res!396524) b!615644))

(assert (= (and b!615644 res!396529) b!615664))

(assert (= (and b!615664 res!396527) b!615651))

(assert (= (and b!615651 res!396518) b!615655))

(assert (= (and b!615655 res!396520) b!615650))

(assert (= (and b!615650 res!396516) b!615643))

(assert (= (and b!615643 res!396522) b!615645))

(assert (= (and b!615645 res!396523) b!615658))

(assert (= (and b!615658 res!396525) b!615662))

(assert (= (and b!615662 res!396528) b!615647))

(assert (= (and b!615647 res!396526) b!615646))

(assert (= (and b!615647 c!69932) b!615648))

(assert (= (and b!615647 (not c!69932)) b!615659))

(assert (= (and b!615647 c!69935) b!615660))

(assert (= (and b!615647 (not c!69935)) b!615641))

(assert (= (and b!615660 res!396519) b!615661))

(assert (= (and b!615661 (not res!396515)) b!615656))

(assert (= (and b!615656 res!396514) b!615654))

(assert (= (and b!615660 c!69933) b!615657))

(assert (= (and b!615660 (not c!69933)) b!615642))

(assert (= (and b!615660 c!69934) b!615663))

(assert (= (and b!615660 (not c!69934)) b!615649))

(assert (= (and b!615663 res!396521) b!615652))

(declare-fun m!592121 () Bool)

(assert (=> b!615658 m!592121))

(declare-fun m!592123 () Bool)

(assert (=> b!615658 m!592123))

(declare-fun m!592125 () Bool)

(assert (=> b!615652 m!592125))

(assert (=> b!615652 m!592125))

(declare-fun m!592127 () Bool)

(assert (=> b!615652 m!592127))

(assert (=> b!615657 m!592125))

(declare-fun m!592129 () Bool)

(assert (=> b!615657 m!592129))

(assert (=> b!615657 m!592125))

(assert (=> b!615657 m!592125))

(declare-fun m!592131 () Bool)

(assert (=> b!615657 m!592131))

(declare-fun m!592133 () Bool)

(assert (=> b!615657 m!592133))

(declare-fun m!592135 () Bool)

(assert (=> b!615657 m!592135))

(assert (=> b!615657 m!592125))

(declare-fun m!592137 () Bool)

(assert (=> b!615657 m!592137))

(declare-fun m!592139 () Bool)

(assert (=> b!615657 m!592139))

(declare-fun m!592141 () Bool)

(assert (=> b!615657 m!592141))

(declare-fun m!592143 () Bool)

(assert (=> b!615650 m!592143))

(declare-fun m!592145 () Bool)

(assert (=> b!615645 m!592145))

(declare-fun m!592147 () Bool)

(assert (=> b!615664 m!592147))

(declare-fun m!592149 () Bool)

(assert (=> start!56052 m!592149))

(declare-fun m!592151 () Bool)

(assert (=> start!56052 m!592151))

(assert (=> b!615656 m!592125))

(assert (=> b!615656 m!592125))

(declare-fun m!592153 () Bool)

(assert (=> b!615656 m!592153))

(assert (=> b!615660 m!592121))

(declare-fun m!592155 () Bool)

(assert (=> b!615660 m!592155))

(assert (=> b!615660 m!592125))

(declare-fun m!592157 () Bool)

(assert (=> b!615647 m!592157))

(assert (=> b!615647 m!592125))

(assert (=> b!615647 m!592121))

(declare-fun m!592159 () Bool)

(assert (=> b!615647 m!592159))

(declare-fun m!592161 () Bool)

(assert (=> b!615647 m!592161))

(assert (=> b!615647 m!592125))

(declare-fun m!592163 () Bool)

(assert (=> b!615647 m!592163))

(declare-fun m!592165 () Bool)

(assert (=> b!615647 m!592165))

(declare-fun m!592167 () Bool)

(assert (=> b!615647 m!592167))

(declare-fun m!592169 () Bool)

(assert (=> b!615655 m!592169))

(assert (=> b!615644 m!592125))

(assert (=> b!615644 m!592125))

(declare-fun m!592171 () Bool)

(assert (=> b!615644 m!592171))

(assert (=> b!615654 m!592125))

(assert (=> b!615654 m!592125))

(assert (=> b!615654 m!592127))

(declare-fun m!592173 () Bool)

(assert (=> b!615651 m!592173))

(declare-fun m!592175 () Bool)

(assert (=> b!615662 m!592175))

(assert (=> b!615662 m!592125))

(assert (=> b!615662 m!592125))

(declare-fun m!592177 () Bool)

(assert (=> b!615662 m!592177))

(declare-fun m!592179 () Bool)

(assert (=> b!615643 m!592179))

(assert (=> b!615663 m!592125))

(assert (=> b!615663 m!592125))

(declare-fun m!592181 () Bool)

(assert (=> b!615663 m!592181))

(assert (=> b!615663 m!592125))

(assert (=> b!615663 m!592153))

(assert (=> b!615663 m!592135))

(declare-fun m!592183 () Bool)

(assert (=> b!615663 m!592183))

(declare-fun m!592185 () Bool)

(assert (=> b!615663 m!592185))

(assert (=> b!615663 m!592141))

(assert (=> b!615663 m!592125))

(declare-fun m!592187 () Bool)

(assert (=> b!615663 m!592187))

(assert (=> b!615663 m!592125))

(declare-fun m!592189 () Bool)

(assert (=> b!615663 m!592189))

(check-sat (not b!615662) (not b!615655) (not b!615663) (not b!615647) (not b!615651) (not b!615657) (not b!615654) (not b!615644) (not b!615656) (not b!615643) (not b!615650) (not b!615664) (not start!56052) (not b!615652))
(check-sat)
