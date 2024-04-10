; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55604 () Bool)

(assert start!55604)

(declare-fun res!392144 () Bool)

(declare-fun e!349171 () Bool)

(assert (=> start!55604 (=> (not res!392144) (not e!349171))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55604 (= res!392144 (validMask!0 mask!3053))))

(assert (=> start!55604 e!349171))

(assert (=> start!55604 true))

(declare-datatypes ((array!37335 0))(
  ( (array!37336 (arr!17918 (Array (_ BitVec 32) (_ BitVec 64))) (size!18282 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37335)

(declare-fun array_inv!13714 (array!37335) Bool)

(assert (=> start!55604 (array_inv!13714 a!2986)))

(declare-fun b!609645 () Bool)

(declare-fun e!349166 () Bool)

(declare-fun e!349167 () Bool)

(assert (=> b!609645 (= e!349166 e!349167)))

(declare-fun res!392137 () Bool)

(assert (=> b!609645 (=> (not res!392137) (not e!349167))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6358 0))(
  ( (MissingZero!6358 (index!27707 (_ BitVec 32))) (Found!6358 (index!27708 (_ BitVec 32))) (Intermediate!6358 (undefined!7170 Bool) (index!27709 (_ BitVec 32)) (x!56507 (_ BitVec 32))) (Undefined!6358) (MissingVacant!6358 (index!27710 (_ BitVec 32))) )
))
(declare-fun lt!278723 () SeekEntryResult!6358)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!609645 (= res!392137 (and (= lt!278723 (Found!6358 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17918 a!2986) index!984) (select (arr!17918 a!2986) j!136))) (not (= (select (arr!17918 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37335 (_ BitVec 32)) SeekEntryResult!6358)

(assert (=> b!609645 (= lt!278723 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17918 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!609646 () Bool)

(declare-fun res!392157 () Bool)

(assert (=> b!609646 (=> (not res!392157) (not e!349171))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!609646 (= res!392157 (and (= (size!18282 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18282 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18282 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!609647 () Bool)

(declare-datatypes ((Unit!19528 0))(
  ( (Unit!19529) )
))
(declare-fun e!349173 () Unit!19528)

(declare-fun Unit!19530 () Unit!19528)

(assert (=> b!609647 (= e!349173 Unit!19530)))

(declare-fun b!609648 () Bool)

(declare-fun e!349170 () Bool)

(assert (=> b!609648 (= e!349170 true)))

(declare-fun lt!278714 () Bool)

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((List!11959 0))(
  ( (Nil!11956) (Cons!11955 (h!13000 (_ BitVec 64)) (t!18187 List!11959)) )
))
(declare-fun contains!3035 (List!11959 (_ BitVec 64)) Bool)

(assert (=> b!609648 (= lt!278714 (contains!3035 Nil!11956 k!1786))))

(declare-fun b!609649 () Bool)

(declare-fun res!392146 () Bool)

(assert (=> b!609649 (=> (not res!392146) (not e!349171))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!609649 (= res!392146 (validKeyInArray!0 (select (arr!17918 a!2986) j!136)))))

(declare-fun b!609650 () Bool)

(declare-fun e!349162 () Bool)

(declare-fun e!349161 () Bool)

(assert (=> b!609650 (= e!349162 e!349161)))

(declare-fun res!392145 () Bool)

(assert (=> b!609650 (=> res!392145 e!349161)))

(declare-fun lt!278713 () (_ BitVec 64))

(declare-fun lt!278718 () (_ BitVec 64))

(assert (=> b!609650 (= res!392145 (or (not (= (select (arr!17918 a!2986) j!136) lt!278718)) (not (= (select (arr!17918 a!2986) j!136) lt!278713))))))

(declare-fun e!349172 () Bool)

(assert (=> b!609650 e!349172))

(declare-fun res!392158 () Bool)

(assert (=> b!609650 (=> (not res!392158) (not e!349172))))

(assert (=> b!609650 (= res!392158 (= lt!278713 (select (arr!17918 a!2986) j!136)))))

(assert (=> b!609650 (= lt!278713 (select (store (arr!17918 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!609651 () Bool)

(declare-fun e!349159 () Bool)

(assert (=> b!609651 (= e!349159 e!349166)))

(declare-fun res!392139 () Bool)

(assert (=> b!609651 (=> (not res!392139) (not e!349166))))

(assert (=> b!609651 (= res!392139 (= (select (store (arr!17918 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!278719 () array!37335)

(assert (=> b!609651 (= lt!278719 (array!37336 (store (arr!17918 a!2986) i!1108 k!1786) (size!18282 a!2986)))))

(declare-fun b!609652 () Bool)

(declare-fun e!349169 () Bool)

(assert (=> b!609652 (= e!349161 e!349169)))

(declare-fun res!392141 () Bool)

(assert (=> b!609652 (=> res!392141 e!349169)))

(assert (=> b!609652 (= res!392141 (bvsge index!984 j!136))))

(declare-fun lt!278721 () Unit!19528)

(assert (=> b!609652 (= lt!278721 e!349173)))

(declare-fun c!69121 () Bool)

(assert (=> b!609652 (= c!69121 (bvslt j!136 index!984))))

(declare-fun e!349158 () Bool)

(declare-fun b!609653 () Bool)

(declare-fun arrayContainsKey!0 (array!37335 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!609653 (= e!349158 (arrayContainsKey!0 lt!278719 (select (arr!17918 a!2986) j!136) index!984))))

(declare-fun b!609654 () Bool)

(declare-fun e!349165 () Unit!19528)

(declare-fun Unit!19531 () Unit!19528)

(assert (=> b!609654 (= e!349165 Unit!19531)))

(declare-fun b!609655 () Bool)

(declare-fun res!392148 () Bool)

(assert (=> b!609655 (=> (not res!392148) (not e!349159))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37335 (_ BitVec 32)) Bool)

(assert (=> b!609655 (= res!392148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!609656 () Bool)

(declare-fun e!349160 () Bool)

(declare-fun lt!278720 () SeekEntryResult!6358)

(assert (=> b!609656 (= e!349160 (= lt!278723 lt!278720))))

(declare-fun b!609657 () Bool)

(declare-fun res!392154 () Bool)

(assert (=> b!609657 (=> res!392154 e!349170)))

(assert (=> b!609657 (= res!392154 (contains!3035 Nil!11956 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!609658 () Bool)

(declare-fun res!392149 () Bool)

(assert (=> b!609658 (=> (not res!392149) (not e!349171))))

(assert (=> b!609658 (= res!392149 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!609659 () Bool)

(declare-fun Unit!19532 () Unit!19528)

(assert (=> b!609659 (= e!349173 Unit!19532)))

(declare-fun lt!278725 () Unit!19528)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37335 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19528)

(assert (=> b!609659 (= lt!278725 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278719 (select (arr!17918 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!609659 (arrayContainsKey!0 lt!278719 (select (arr!17918 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!278717 () Unit!19528)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37335 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11959) Unit!19528)

(assert (=> b!609659 (= lt!278717 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11956))))

(declare-fun arrayNoDuplicates!0 (array!37335 (_ BitVec 32) List!11959) Bool)

(assert (=> b!609659 (arrayNoDuplicates!0 lt!278719 #b00000000000000000000000000000000 Nil!11956)))

(declare-fun lt!278724 () Unit!19528)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37335 (_ BitVec 32) (_ BitVec 32)) Unit!19528)

(assert (=> b!609659 (= lt!278724 (lemmaNoDuplicateFromThenFromBigger!0 lt!278719 #b00000000000000000000000000000000 j!136))))

(assert (=> b!609659 (arrayNoDuplicates!0 lt!278719 j!136 Nil!11956)))

(declare-fun lt!278727 () Unit!19528)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37335 (_ BitVec 64) (_ BitVec 32) List!11959) Unit!19528)

(assert (=> b!609659 (= lt!278727 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!278719 (select (arr!17918 a!2986) j!136) j!136 Nil!11956))))

(assert (=> b!609659 false))

(declare-fun b!609660 () Bool)

(declare-fun res!392138 () Bool)

(assert (=> b!609660 (=> res!392138 e!349170)))

(assert (=> b!609660 (= res!392138 (contains!3035 Nil!11956 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!609661 () Bool)

(declare-fun res!392153 () Bool)

(assert (=> b!609661 (=> (not res!392153) (not e!349159))))

(assert (=> b!609661 (= res!392153 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17918 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!609662 () Bool)

(assert (=> b!609662 (= e!349169 e!349170)))

(declare-fun res!392151 () Bool)

(assert (=> b!609662 (=> res!392151 e!349170)))

(assert (=> b!609662 (= res!392151 (or (bvsge (size!18282 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18282 a!2986))))))

(assert (=> b!609662 (arrayContainsKey!0 lt!278719 (select (arr!17918 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!278726 () Unit!19528)

(assert (=> b!609662 (= lt!278726 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278719 (select (arr!17918 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!349168 () Bool)

(assert (=> b!609662 e!349168))

(declare-fun res!392140 () Bool)

(assert (=> b!609662 (=> (not res!392140) (not e!349168))))

(assert (=> b!609662 (= res!392140 (arrayContainsKey!0 lt!278719 (select (arr!17918 a!2986) j!136) j!136))))

(declare-fun b!609663 () Bool)

(declare-fun res!392150 () Bool)

(assert (=> b!609663 (=> (not res!392150) (not e!349171))))

(assert (=> b!609663 (= res!392150 (validKeyInArray!0 k!1786))))

(declare-fun b!609664 () Bool)

(assert (=> b!609664 (= e!349168 (arrayContainsKey!0 lt!278719 (select (arr!17918 a!2986) j!136) index!984))))

(declare-fun b!609665 () Bool)

(assert (=> b!609665 (= e!349171 e!349159)))

(declare-fun res!392155 () Bool)

(assert (=> b!609665 (=> (not res!392155) (not e!349159))))

(declare-fun lt!278722 () SeekEntryResult!6358)

(assert (=> b!609665 (= res!392155 (or (= lt!278722 (MissingZero!6358 i!1108)) (= lt!278722 (MissingVacant!6358 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37335 (_ BitVec 32)) SeekEntryResult!6358)

(assert (=> b!609665 (= lt!278722 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!609666 () Bool)

(declare-fun res!392142 () Bool)

(assert (=> b!609666 (=> (not res!392142) (not e!349159))))

(assert (=> b!609666 (= res!392142 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11956))))

(declare-fun b!609667 () Bool)

(declare-fun e!349163 () Bool)

(assert (=> b!609667 (= e!349172 e!349163)))

(declare-fun res!392143 () Bool)

(assert (=> b!609667 (=> res!392143 e!349163)))

(assert (=> b!609667 (= res!392143 (or (not (= (select (arr!17918 a!2986) j!136) lt!278718)) (not (= (select (arr!17918 a!2986) j!136) lt!278713)) (bvsge j!136 index!984)))))

(declare-fun b!609668 () Bool)

(declare-fun res!392152 () Bool)

(assert (=> b!609668 (=> res!392152 e!349170)))

(declare-fun noDuplicate!341 (List!11959) Bool)

(assert (=> b!609668 (= res!392152 (not (noDuplicate!341 Nil!11956)))))

(declare-fun b!609669 () Bool)

(assert (=> b!609669 (= e!349163 e!349158)))

(declare-fun res!392159 () Bool)

(assert (=> b!609669 (=> (not res!392159) (not e!349158))))

(assert (=> b!609669 (= res!392159 (arrayContainsKey!0 lt!278719 (select (arr!17918 a!2986) j!136) j!136))))

(declare-fun b!609670 () Bool)

(declare-fun Unit!19533 () Unit!19528)

(assert (=> b!609670 (= e!349165 Unit!19533)))

(assert (=> b!609670 false))

(declare-fun b!609671 () Bool)

(assert (=> b!609671 (= e!349167 (not e!349162))))

(declare-fun res!392156 () Bool)

(assert (=> b!609671 (=> res!392156 e!349162)))

(declare-fun lt!278716 () SeekEntryResult!6358)

(assert (=> b!609671 (= res!392156 (not (= lt!278716 (Found!6358 index!984))))))

(declare-fun lt!278712 () Unit!19528)

(assert (=> b!609671 (= lt!278712 e!349165)))

(declare-fun c!69122 () Bool)

(assert (=> b!609671 (= c!69122 (= lt!278716 Undefined!6358))))

(assert (=> b!609671 (= lt!278716 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!278718 lt!278719 mask!3053))))

(assert (=> b!609671 e!349160))

(declare-fun res!392147 () Bool)

(assert (=> b!609671 (=> (not res!392147) (not e!349160))))

(declare-fun lt!278715 () (_ BitVec 32))

(assert (=> b!609671 (= res!392147 (= lt!278720 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278715 vacantSpotIndex!68 lt!278718 lt!278719 mask!3053)))))

(assert (=> b!609671 (= lt!278720 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278715 vacantSpotIndex!68 (select (arr!17918 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!609671 (= lt!278718 (select (store (arr!17918 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!278728 () Unit!19528)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37335 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19528)

(assert (=> b!609671 (= lt!278728 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278715 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!609671 (= lt!278715 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!55604 res!392144) b!609646))

(assert (= (and b!609646 res!392157) b!609649))

(assert (= (and b!609649 res!392146) b!609663))

(assert (= (and b!609663 res!392150) b!609658))

(assert (= (and b!609658 res!392149) b!609665))

(assert (= (and b!609665 res!392155) b!609655))

(assert (= (and b!609655 res!392148) b!609666))

(assert (= (and b!609666 res!392142) b!609661))

(assert (= (and b!609661 res!392153) b!609651))

(assert (= (and b!609651 res!392139) b!609645))

(assert (= (and b!609645 res!392137) b!609671))

(assert (= (and b!609671 res!392147) b!609656))

(assert (= (and b!609671 c!69122) b!609670))

(assert (= (and b!609671 (not c!69122)) b!609654))

(assert (= (and b!609671 (not res!392156)) b!609650))

(assert (= (and b!609650 res!392158) b!609667))

(assert (= (and b!609667 (not res!392143)) b!609669))

(assert (= (and b!609669 res!392159) b!609653))

(assert (= (and b!609650 (not res!392145)) b!609652))

(assert (= (and b!609652 c!69121) b!609659))

(assert (= (and b!609652 (not c!69121)) b!609647))

(assert (= (and b!609652 (not res!392141)) b!609662))

(assert (= (and b!609662 res!392140) b!609664))

(assert (= (and b!609662 (not res!392151)) b!609668))

(assert (= (and b!609668 (not res!392152)) b!609660))

(assert (= (and b!609660 (not res!392138)) b!609657))

(assert (= (and b!609657 (not res!392154)) b!609648))

(declare-fun m!586139 () Bool)

(assert (=> b!609661 m!586139))

(declare-fun m!586141 () Bool)

(assert (=> b!609649 m!586141))

(assert (=> b!609649 m!586141))

(declare-fun m!586143 () Bool)

(assert (=> b!609649 m!586143))

(declare-fun m!586145 () Bool)

(assert (=> b!609648 m!586145))

(declare-fun m!586147 () Bool)

(assert (=> b!609665 m!586147))

(declare-fun m!586149 () Bool)

(assert (=> b!609671 m!586149))

(declare-fun m!586151 () Bool)

(assert (=> b!609671 m!586151))

(declare-fun m!586153 () Bool)

(assert (=> b!609671 m!586153))

(assert (=> b!609671 m!586141))

(declare-fun m!586155 () Bool)

(assert (=> b!609671 m!586155))

(declare-fun m!586157 () Bool)

(assert (=> b!609671 m!586157))

(declare-fun m!586159 () Bool)

(assert (=> b!609671 m!586159))

(assert (=> b!609671 m!586141))

(declare-fun m!586161 () Bool)

(assert (=> b!609671 m!586161))

(assert (=> b!609667 m!586141))

(assert (=> b!609669 m!586141))

(assert (=> b!609669 m!586141))

(declare-fun m!586163 () Bool)

(assert (=> b!609669 m!586163))

(assert (=> b!609651 m!586157))

(declare-fun m!586165 () Bool)

(assert (=> b!609651 m!586165))

(assert (=> b!609662 m!586141))

(assert (=> b!609662 m!586141))

(declare-fun m!586167 () Bool)

(assert (=> b!609662 m!586167))

(assert (=> b!609662 m!586141))

(declare-fun m!586169 () Bool)

(assert (=> b!609662 m!586169))

(assert (=> b!609662 m!586141))

(assert (=> b!609662 m!586163))

(declare-fun m!586171 () Bool)

(assert (=> b!609658 m!586171))

(declare-fun m!586173 () Bool)

(assert (=> b!609660 m!586173))

(assert (=> b!609664 m!586141))

(assert (=> b!609664 m!586141))

(declare-fun m!586175 () Bool)

(assert (=> b!609664 m!586175))

(declare-fun m!586177 () Bool)

(assert (=> start!55604 m!586177))

(declare-fun m!586179 () Bool)

(assert (=> start!55604 m!586179))

(assert (=> b!609659 m!586141))

(declare-fun m!586181 () Bool)

(assert (=> b!609659 m!586181))

(declare-fun m!586183 () Bool)

(assert (=> b!609659 m!586183))

(declare-fun m!586185 () Bool)

(assert (=> b!609659 m!586185))

(assert (=> b!609659 m!586141))

(declare-fun m!586187 () Bool)

(assert (=> b!609659 m!586187))

(assert (=> b!609659 m!586141))

(declare-fun m!586189 () Bool)

(assert (=> b!609659 m!586189))

(declare-fun m!586191 () Bool)

(assert (=> b!609659 m!586191))

(assert (=> b!609659 m!586141))

(declare-fun m!586193 () Bool)

(assert (=> b!609659 m!586193))

(declare-fun m!586195 () Bool)

(assert (=> b!609666 m!586195))

(declare-fun m!586197 () Bool)

(assert (=> b!609655 m!586197))

(declare-fun m!586199 () Bool)

(assert (=> b!609668 m!586199))

(declare-fun m!586201 () Bool)

(assert (=> b!609663 m!586201))

(assert (=> b!609653 m!586141))

(assert (=> b!609653 m!586141))

(assert (=> b!609653 m!586175))

(declare-fun m!586203 () Bool)

(assert (=> b!609657 m!586203))

(assert (=> b!609650 m!586141))

(assert (=> b!609650 m!586157))

(declare-fun m!586205 () Bool)

(assert (=> b!609650 m!586205))

(declare-fun m!586207 () Bool)

(assert (=> b!609645 m!586207))

(assert (=> b!609645 m!586141))

(assert (=> b!609645 m!586141))

(declare-fun m!586209 () Bool)

(assert (=> b!609645 m!586209))

(push 1)

