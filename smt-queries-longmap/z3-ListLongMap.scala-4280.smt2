; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59646 () Bool)

(assert start!59646)

(declare-fun b!658667 () Bool)

(declare-fun e!378410 () Bool)

(declare-fun e!378401 () Bool)

(assert (=> b!658667 (= e!378410 e!378401)))

(declare-fun res!427117 () Bool)

(assert (=> b!658667 (=> (not res!427117) (not e!378401))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38742 0))(
  ( (array!38743 (arr!18565 (Array (_ BitVec 32) (_ BitVec 64))) (size!18929 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38742)

(assert (=> b!658667 (= res!427117 (= (select (store (arr!18565 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!307986 () array!38742)

(assert (=> b!658667 (= lt!307986 (array!38743 (store (arr!18565 a!2986) i!1108 k0!1786) (size!18929 a!2986)))))

(declare-fun b!658668 () Bool)

(declare-fun res!427119 () Bool)

(declare-fun e!378400 () Bool)

(assert (=> b!658668 (=> (not res!427119) (not e!378400))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!658668 (= res!427119 (validKeyInArray!0 k0!1786))))

(declare-fun b!658669 () Bool)

(declare-datatypes ((Unit!22833 0))(
  ( (Unit!22834) )
))
(declare-fun e!378403 () Unit!22833)

(declare-fun Unit!22835 () Unit!22833)

(assert (=> b!658669 (= e!378403 Unit!22835)))

(declare-fun b!658670 () Bool)

(declare-fun e!378407 () Bool)

(declare-datatypes ((SeekEntryResult!6961 0))(
  ( (MissingZero!6961 (index!30209 (_ BitVec 32))) (Found!6961 (index!30210 (_ BitVec 32))) (Intermediate!6961 (undefined!7773 Bool) (index!30211 (_ BitVec 32)) (x!59151 (_ BitVec 32))) (Undefined!6961) (MissingVacant!6961 (index!30212 (_ BitVec 32))) )
))
(declare-fun lt!307971 () SeekEntryResult!6961)

(declare-fun lt!307981 () SeekEntryResult!6961)

(assert (=> b!658670 (= e!378407 (= lt!307971 lt!307981))))

(declare-fun b!658671 () Bool)

(assert (=> b!658671 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!307979 () Unit!22833)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((List!12513 0))(
  ( (Nil!12510) (Cons!12509 (h!13557 (_ BitVec 64)) (t!18733 List!12513)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38742 (_ BitVec 64) (_ BitVec 32) List!12513) Unit!22833)

(assert (=> b!658671 (= lt!307979 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307986 (select (arr!18565 a!2986) j!136) index!984 Nil!12510))))

(declare-fun arrayNoDuplicates!0 (array!38742 (_ BitVec 32) List!12513) Bool)

(assert (=> b!658671 (arrayNoDuplicates!0 lt!307986 index!984 Nil!12510)))

(declare-fun lt!307990 () Unit!22833)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38742 (_ BitVec 32) (_ BitVec 32)) Unit!22833)

(assert (=> b!658671 (= lt!307990 (lemmaNoDuplicateFromThenFromBigger!0 lt!307986 #b00000000000000000000000000000000 index!984))))

(assert (=> b!658671 (arrayNoDuplicates!0 lt!307986 #b00000000000000000000000000000000 Nil!12510)))

(declare-fun lt!307977 () Unit!22833)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38742 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12513) Unit!22833)

(assert (=> b!658671 (= lt!307977 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12510))))

(declare-fun arrayContainsKey!0 (array!38742 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!658671 (arrayContainsKey!0 lt!307986 (select (arr!18565 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!307983 () Unit!22833)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38742 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22833)

(assert (=> b!658671 (= lt!307983 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307986 (select (arr!18565 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!378404 () Bool)

(assert (=> b!658671 e!378404))

(declare-fun res!427112 () Bool)

(assert (=> b!658671 (=> (not res!427112) (not e!378404))))

(assert (=> b!658671 (= res!427112 (arrayContainsKey!0 lt!307986 (select (arr!18565 a!2986) j!136) j!136))))

(declare-fun e!378399 () Unit!22833)

(declare-fun Unit!22836 () Unit!22833)

(assert (=> b!658671 (= e!378399 Unit!22836)))

(declare-fun b!658672 () Bool)

(declare-fun Unit!22837 () Unit!22833)

(assert (=> b!658672 (= e!378403 Unit!22837)))

(declare-fun res!427109 () Bool)

(assert (=> b!658672 (= res!427109 (= (select (store (arr!18565 a!2986) i!1108 k0!1786) index!984) (select (arr!18565 a!2986) j!136)))))

(declare-fun e!378406 () Bool)

(assert (=> b!658672 (=> (not res!427109) (not e!378406))))

(assert (=> b!658672 e!378406))

(declare-fun c!76148 () Bool)

(assert (=> b!658672 (= c!76148 (bvslt j!136 index!984))))

(declare-fun lt!307982 () Unit!22833)

(declare-fun e!378398 () Unit!22833)

(assert (=> b!658672 (= lt!307982 e!378398)))

(declare-fun c!76150 () Bool)

(assert (=> b!658672 (= c!76150 (bvslt index!984 j!136))))

(declare-fun lt!307976 () Unit!22833)

(assert (=> b!658672 (= lt!307976 e!378399)))

(assert (=> b!658672 false))

(declare-fun b!658673 () Bool)

(declare-fun e!378402 () Unit!22833)

(declare-fun Unit!22838 () Unit!22833)

(assert (=> b!658673 (= e!378402 Unit!22838)))

(assert (=> b!658673 false))

(declare-fun b!658674 () Bool)

(assert (=> b!658674 false))

(declare-fun lt!307985 () Unit!22833)

(assert (=> b!658674 (= lt!307985 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307986 (select (arr!18565 a!2986) j!136) j!136 Nil!12510))))

(assert (=> b!658674 (arrayNoDuplicates!0 lt!307986 j!136 Nil!12510)))

(declare-fun lt!307972 () Unit!22833)

(assert (=> b!658674 (= lt!307972 (lemmaNoDuplicateFromThenFromBigger!0 lt!307986 #b00000000000000000000000000000000 j!136))))

(assert (=> b!658674 (arrayNoDuplicates!0 lt!307986 #b00000000000000000000000000000000 Nil!12510)))

(declare-fun lt!307974 () Unit!22833)

(assert (=> b!658674 (= lt!307974 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12510))))

(assert (=> b!658674 (arrayContainsKey!0 lt!307986 (select (arr!18565 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!307989 () Unit!22833)

(assert (=> b!658674 (= lt!307989 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307986 (select (arr!18565 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22839 () Unit!22833)

(assert (=> b!658674 (= e!378398 Unit!22839)))

(declare-fun b!658675 () Bool)

(declare-fun res!427122 () Bool)

(assert (=> b!658675 (=> (not res!427122) (not e!378410))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38742 (_ BitVec 32)) Bool)

(assert (=> b!658675 (= res!427122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!658676 () Bool)

(declare-fun res!427111 () Bool)

(assert (=> b!658676 (=> (not res!427111) (not e!378410))))

(assert (=> b!658676 (= res!427111 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12510))))

(declare-fun b!658677 () Bool)

(declare-fun res!427114 () Bool)

(assert (=> b!658677 (=> (not res!427114) (not e!378400))))

(assert (=> b!658677 (= res!427114 (and (= (size!18929 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18929 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18929 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!658678 () Bool)

(assert (=> b!658678 (= e!378404 (arrayContainsKey!0 lt!307986 (select (arr!18565 a!2986) j!136) index!984))))

(declare-fun b!658679 () Bool)

(declare-fun res!427120 () Bool)

(assert (=> b!658679 (=> (not res!427120) (not e!378400))))

(assert (=> b!658679 (= res!427120 (validKeyInArray!0 (select (arr!18565 a!2986) j!136)))))

(declare-fun b!658680 () Bool)

(declare-fun Unit!22840 () Unit!22833)

(assert (=> b!658680 (= e!378399 Unit!22840)))

(declare-fun b!658681 () Bool)

(declare-fun Unit!22841 () Unit!22833)

(assert (=> b!658681 (= e!378402 Unit!22841)))

(declare-fun b!658682 () Bool)

(declare-fun Unit!22842 () Unit!22833)

(assert (=> b!658682 (= e!378398 Unit!22842)))

(declare-fun b!658683 () Bool)

(declare-fun res!427116 () Bool)

(assert (=> b!658683 (= res!427116 (bvsge j!136 index!984))))

(declare-fun e!378405 () Bool)

(assert (=> b!658683 (=> res!427116 e!378405)))

(assert (=> b!658683 (= e!378406 e!378405)))

(declare-fun res!427123 () Bool)

(declare-fun b!658684 () Bool)

(assert (=> b!658684 (= res!427123 (arrayContainsKey!0 lt!307986 (select (arr!18565 a!2986) j!136) j!136))))

(declare-fun e!378408 () Bool)

(assert (=> b!658684 (=> (not res!427123) (not e!378408))))

(assert (=> b!658684 (= e!378405 e!378408)))

(declare-fun b!658685 () Bool)

(assert (=> b!658685 (= e!378408 (arrayContainsKey!0 lt!307986 (select (arr!18565 a!2986) j!136) index!984))))

(declare-fun b!658686 () Bool)

(declare-fun res!427115 () Bool)

(assert (=> b!658686 (=> (not res!427115) (not e!378400))))

(assert (=> b!658686 (= res!427115 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!658687 () Bool)

(declare-fun e!378409 () Bool)

(assert (=> b!658687 (= e!378409 (not true))))

(declare-fun lt!307973 () Unit!22833)

(assert (=> b!658687 (= lt!307973 e!378403)))

(declare-fun c!76151 () Bool)

(declare-fun lt!307980 () SeekEntryResult!6961)

(assert (=> b!658687 (= c!76151 (= lt!307980 (Found!6961 index!984)))))

(declare-fun lt!307987 () Unit!22833)

(assert (=> b!658687 (= lt!307987 e!378402)))

(declare-fun c!76149 () Bool)

(assert (=> b!658687 (= c!76149 (= lt!307980 Undefined!6961))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!307984 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38742 (_ BitVec 32)) SeekEntryResult!6961)

(assert (=> b!658687 (= lt!307980 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!307984 lt!307986 mask!3053))))

(assert (=> b!658687 e!378407))

(declare-fun res!427110 () Bool)

(assert (=> b!658687 (=> (not res!427110) (not e!378407))))

(declare-fun lt!307975 () (_ BitVec 32))

(assert (=> b!658687 (= res!427110 (= lt!307981 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307975 vacantSpotIndex!68 lt!307984 lt!307986 mask!3053)))))

(assert (=> b!658687 (= lt!307981 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307975 vacantSpotIndex!68 (select (arr!18565 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!658687 (= lt!307984 (select (store (arr!18565 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!307978 () Unit!22833)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38742 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22833)

(assert (=> b!658687 (= lt!307978 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!307975 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!658687 (= lt!307975 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!658688 () Bool)

(assert (=> b!658688 (= e!378400 e!378410)))

(declare-fun res!427121 () Bool)

(assert (=> b!658688 (=> (not res!427121) (not e!378410))))

(declare-fun lt!307988 () SeekEntryResult!6961)

(assert (=> b!658688 (= res!427121 (or (= lt!307988 (MissingZero!6961 i!1108)) (= lt!307988 (MissingVacant!6961 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38742 (_ BitVec 32)) SeekEntryResult!6961)

(assert (=> b!658688 (= lt!307988 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!427118 () Bool)

(assert (=> start!59646 (=> (not res!427118) (not e!378400))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59646 (= res!427118 (validMask!0 mask!3053))))

(assert (=> start!59646 e!378400))

(assert (=> start!59646 true))

(declare-fun array_inv!14424 (array!38742) Bool)

(assert (=> start!59646 (array_inv!14424 a!2986)))

(declare-fun b!658689 () Bool)

(assert (=> b!658689 (= e!378401 e!378409)))

(declare-fun res!427113 () Bool)

(assert (=> b!658689 (=> (not res!427113) (not e!378409))))

(assert (=> b!658689 (= res!427113 (and (= lt!307971 (Found!6961 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18565 a!2986) index!984) (select (arr!18565 a!2986) j!136))) (not (= (select (arr!18565 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!658689 (= lt!307971 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18565 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!658690 () Bool)

(declare-fun res!427108 () Bool)

(assert (=> b!658690 (=> (not res!427108) (not e!378410))))

(assert (=> b!658690 (= res!427108 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18565 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59646 res!427118) b!658677))

(assert (= (and b!658677 res!427114) b!658679))

(assert (= (and b!658679 res!427120) b!658668))

(assert (= (and b!658668 res!427119) b!658686))

(assert (= (and b!658686 res!427115) b!658688))

(assert (= (and b!658688 res!427121) b!658675))

(assert (= (and b!658675 res!427122) b!658676))

(assert (= (and b!658676 res!427111) b!658690))

(assert (= (and b!658690 res!427108) b!658667))

(assert (= (and b!658667 res!427117) b!658689))

(assert (= (and b!658689 res!427113) b!658687))

(assert (= (and b!658687 res!427110) b!658670))

(assert (= (and b!658687 c!76149) b!658673))

(assert (= (and b!658687 (not c!76149)) b!658681))

(assert (= (and b!658687 c!76151) b!658672))

(assert (= (and b!658687 (not c!76151)) b!658669))

(assert (= (and b!658672 res!427109) b!658683))

(assert (= (and b!658683 (not res!427116)) b!658684))

(assert (= (and b!658684 res!427123) b!658685))

(assert (= (and b!658672 c!76148) b!658674))

(assert (= (and b!658672 (not c!76148)) b!658682))

(assert (= (and b!658672 c!76150) b!658671))

(assert (= (and b!658672 (not c!76150)) b!658680))

(assert (= (and b!658671 res!427112) b!658678))

(declare-fun m!632119 () Bool)

(assert (=> b!658686 m!632119))

(declare-fun m!632121 () Bool)

(assert (=> b!658684 m!632121))

(assert (=> b!658684 m!632121))

(declare-fun m!632123 () Bool)

(assert (=> b!658684 m!632123))

(declare-fun m!632125 () Bool)

(assert (=> b!658690 m!632125))

(assert (=> b!658674 m!632121))

(assert (=> b!658674 m!632121))

(declare-fun m!632127 () Bool)

(assert (=> b!658674 m!632127))

(declare-fun m!632129 () Bool)

(assert (=> b!658674 m!632129))

(assert (=> b!658674 m!632121))

(declare-fun m!632131 () Bool)

(assert (=> b!658674 m!632131))

(assert (=> b!658674 m!632121))

(declare-fun m!632133 () Bool)

(assert (=> b!658674 m!632133))

(declare-fun m!632135 () Bool)

(assert (=> b!658674 m!632135))

(declare-fun m!632137 () Bool)

(assert (=> b!658674 m!632137))

(declare-fun m!632139 () Bool)

(assert (=> b!658674 m!632139))

(declare-fun m!632141 () Bool)

(assert (=> b!658672 m!632141))

(declare-fun m!632143 () Bool)

(assert (=> b!658672 m!632143))

(assert (=> b!658672 m!632121))

(declare-fun m!632145 () Bool)

(assert (=> start!59646 m!632145))

(declare-fun m!632147 () Bool)

(assert (=> start!59646 m!632147))

(declare-fun m!632149 () Bool)

(assert (=> b!658676 m!632149))

(declare-fun m!632151 () Bool)

(assert (=> b!658688 m!632151))

(assert (=> b!658671 m!632121))

(declare-fun m!632153 () Bool)

(assert (=> b!658671 m!632153))

(assert (=> b!658671 m!632121))

(declare-fun m!632155 () Bool)

(assert (=> b!658671 m!632155))

(assert (=> b!658671 m!632121))

(declare-fun m!632157 () Bool)

(assert (=> b!658671 m!632157))

(assert (=> b!658671 m!632121))

(assert (=> b!658671 m!632123))

(declare-fun m!632159 () Bool)

(assert (=> b!658671 m!632159))

(assert (=> b!658671 m!632135))

(assert (=> b!658671 m!632139))

(assert (=> b!658671 m!632121))

(declare-fun m!632161 () Bool)

(assert (=> b!658671 m!632161))

(assert (=> b!658679 m!632121))

(assert (=> b!658679 m!632121))

(declare-fun m!632163 () Bool)

(assert (=> b!658679 m!632163))

(declare-fun m!632165 () Bool)

(assert (=> b!658689 m!632165))

(assert (=> b!658689 m!632121))

(assert (=> b!658689 m!632121))

(declare-fun m!632167 () Bool)

(assert (=> b!658689 m!632167))

(declare-fun m!632169 () Bool)

(assert (=> b!658675 m!632169))

(assert (=> b!658685 m!632121))

(assert (=> b!658685 m!632121))

(declare-fun m!632171 () Bool)

(assert (=> b!658685 m!632171))

(declare-fun m!632173 () Bool)

(assert (=> b!658687 m!632173))

(declare-fun m!632175 () Bool)

(assert (=> b!658687 m!632175))

(assert (=> b!658687 m!632121))

(declare-fun m!632177 () Bool)

(assert (=> b!658687 m!632177))

(declare-fun m!632179 () Bool)

(assert (=> b!658687 m!632179))

(assert (=> b!658687 m!632141))

(declare-fun m!632181 () Bool)

(assert (=> b!658687 m!632181))

(declare-fun m!632183 () Bool)

(assert (=> b!658687 m!632183))

(assert (=> b!658687 m!632121))

(assert (=> b!658667 m!632141))

(declare-fun m!632185 () Bool)

(assert (=> b!658667 m!632185))

(declare-fun m!632187 () Bool)

(assert (=> b!658668 m!632187))

(assert (=> b!658678 m!632121))

(assert (=> b!658678 m!632121))

(assert (=> b!658678 m!632171))

(check-sat (not b!658668) (not start!59646) (not b!658674) (not b!658688) (not b!658675) (not b!658684) (not b!658685) (not b!658679) (not b!658678) (not b!658676) (not b!658689) (not b!658686) (not b!658687) (not b!658671))
(check-sat)
