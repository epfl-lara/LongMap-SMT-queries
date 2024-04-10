; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55246 () Bool)

(assert start!55246)

(declare-fun b!605122 () Bool)

(declare-fun res!388786 () Bool)

(declare-fun e!346314 () Bool)

(assert (=> b!605122 (=> (not res!388786) (not e!346314))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37238 0))(
  ( (array!37239 (arr!17874 (Array (_ BitVec 32) (_ BitVec 64))) (size!18238 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37238)

(assert (=> b!605122 (= res!388786 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17874 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!605123 () Bool)

(declare-fun res!388773 () Bool)

(assert (=> b!605123 (=> (not res!388773) (not e!346314))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37238 (_ BitVec 32)) Bool)

(assert (=> b!605123 (= res!388773 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!388780 () Bool)

(declare-fun e!346311 () Bool)

(assert (=> start!55246 (=> (not res!388780) (not e!346311))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55246 (= res!388780 (validMask!0 mask!3053))))

(assert (=> start!55246 e!346311))

(assert (=> start!55246 true))

(declare-fun array_inv!13670 (array!37238) Bool)

(assert (=> start!55246 (array_inv!13670 a!2986)))

(declare-fun b!605124 () Bool)

(declare-fun res!388783 () Bool)

(assert (=> b!605124 (=> (not res!388783) (not e!346311))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!605124 (= res!388783 (validKeyInArray!0 k!1786))))

(declare-fun b!605125 () Bool)

(declare-fun e!346322 () Bool)

(declare-fun e!346309 () Bool)

(assert (=> b!605125 (= e!346322 (not e!346309))))

(declare-fun res!388775 () Bool)

(assert (=> b!605125 (=> res!388775 e!346309)))

(declare-datatypes ((SeekEntryResult!6314 0))(
  ( (MissingZero!6314 (index!27522 (_ BitVec 32))) (Found!6314 (index!27523 (_ BitVec 32))) (Intermediate!6314 (undefined!7126 Bool) (index!27524 (_ BitVec 32)) (x!56324 (_ BitVec 32))) (Undefined!6314) (MissingVacant!6314 (index!27525 (_ BitVec 32))) )
))
(declare-fun lt!276061 () SeekEntryResult!6314)

(assert (=> b!605125 (= res!388775 (not (= lt!276061 (Found!6314 index!984))))))

(declare-datatypes ((Unit!19264 0))(
  ( (Unit!19265) )
))
(declare-fun lt!276056 () Unit!19264)

(declare-fun e!346310 () Unit!19264)

(assert (=> b!605125 (= lt!276056 e!346310)))

(declare-fun c!68542 () Bool)

(assert (=> b!605125 (= c!68542 (= lt!276061 Undefined!6314))))

(declare-fun lt!276049 () array!37238)

(declare-fun lt!276054 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37238 (_ BitVec 32)) SeekEntryResult!6314)

(assert (=> b!605125 (= lt!276061 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!276054 lt!276049 mask!3053))))

(declare-fun e!346313 () Bool)

(assert (=> b!605125 e!346313))

(declare-fun res!388776 () Bool)

(assert (=> b!605125 (=> (not res!388776) (not e!346313))))

(declare-fun lt!276052 () (_ BitVec 32))

(declare-fun lt!276057 () SeekEntryResult!6314)

(assert (=> b!605125 (= res!388776 (= lt!276057 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276052 vacantSpotIndex!68 lt!276054 lt!276049 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!605125 (= lt!276057 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276052 vacantSpotIndex!68 (select (arr!17874 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!605125 (= lt!276054 (select (store (arr!17874 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!276063 () Unit!19264)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37238 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19264)

(assert (=> b!605125 (= lt!276063 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276052 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!605125 (= lt!276052 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!605126 () Bool)

(declare-fun e!346312 () Unit!19264)

(declare-fun Unit!19266 () Unit!19264)

(assert (=> b!605126 (= e!346312 Unit!19266)))

(declare-fun e!346317 () Bool)

(declare-fun b!605127 () Bool)

(declare-fun arrayContainsKey!0 (array!37238 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!605127 (= e!346317 (arrayContainsKey!0 lt!276049 (select (arr!17874 a!2986) j!136) index!984))))

(declare-fun b!605128 () Bool)

(declare-fun e!346315 () Bool)

(assert (=> b!605128 (= e!346315 (arrayContainsKey!0 lt!276049 (select (arr!17874 a!2986) j!136) index!984))))

(declare-fun b!605129 () Bool)

(declare-fun res!388788 () Bool)

(assert (=> b!605129 (=> (not res!388788) (not e!346311))))

(assert (=> b!605129 (= res!388788 (validKeyInArray!0 (select (arr!17874 a!2986) j!136)))))

(declare-fun b!605130 () Bool)

(declare-fun lt!276064 () SeekEntryResult!6314)

(assert (=> b!605130 (= e!346313 (= lt!276064 lt!276057))))

(declare-fun b!605131 () Bool)

(assert (=> b!605131 (= e!346311 e!346314)))

(declare-fun res!388787 () Bool)

(assert (=> b!605131 (=> (not res!388787) (not e!346314))))

(declare-fun lt!276055 () SeekEntryResult!6314)

(assert (=> b!605131 (= res!388787 (or (= lt!276055 (MissingZero!6314 i!1108)) (= lt!276055 (MissingVacant!6314 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37238 (_ BitVec 32)) SeekEntryResult!6314)

(assert (=> b!605131 (= lt!276055 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!605132 () Bool)

(declare-fun Unit!19267 () Unit!19264)

(assert (=> b!605132 (= e!346310 Unit!19267)))

(declare-fun b!605133 () Bool)

(declare-fun e!346323 () Bool)

(assert (=> b!605133 (= e!346323 e!346317)))

(declare-fun res!388782 () Bool)

(assert (=> b!605133 (=> (not res!388782) (not e!346317))))

(assert (=> b!605133 (= res!388782 (arrayContainsKey!0 lt!276049 (select (arr!17874 a!2986) j!136) j!136))))

(declare-fun b!605134 () Bool)

(declare-fun e!346316 () Bool)

(declare-fun e!346318 () Bool)

(assert (=> b!605134 (= e!346316 e!346318)))

(declare-fun res!388777 () Bool)

(assert (=> b!605134 (=> res!388777 e!346318)))

(assert (=> b!605134 (= res!388777 (bvsge index!984 j!136))))

(declare-fun lt!276058 () Unit!19264)

(assert (=> b!605134 (= lt!276058 e!346312)))

(declare-fun c!68543 () Bool)

(assert (=> b!605134 (= c!68543 (bvslt j!136 index!984))))

(declare-fun b!605135 () Bool)

(declare-fun e!346320 () Bool)

(assert (=> b!605135 (= e!346314 e!346320)))

(declare-fun res!388785 () Bool)

(assert (=> b!605135 (=> (not res!388785) (not e!346320))))

(assert (=> b!605135 (= res!388785 (= (select (store (arr!17874 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!605135 (= lt!276049 (array!37239 (store (arr!17874 a!2986) i!1108 k!1786) (size!18238 a!2986)))))

(declare-fun b!605136 () Bool)

(declare-fun Unit!19268 () Unit!19264)

(assert (=> b!605136 (= e!346310 Unit!19268)))

(assert (=> b!605136 false))

(declare-fun b!605137 () Bool)

(assert (=> b!605137 (= e!346320 e!346322)))

(declare-fun res!388774 () Bool)

(assert (=> b!605137 (=> (not res!388774) (not e!346322))))

(assert (=> b!605137 (= res!388774 (and (= lt!276064 (Found!6314 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17874 a!2986) index!984) (select (arr!17874 a!2986) j!136))) (not (= (select (arr!17874 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!605137 (= lt!276064 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17874 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!605138 () Bool)

(declare-fun res!388784 () Bool)

(assert (=> b!605138 (=> (not res!388784) (not e!346311))))

(assert (=> b!605138 (= res!388784 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!605139 () Bool)

(declare-fun res!388790 () Bool)

(assert (=> b!605139 (=> (not res!388790) (not e!346311))))

(assert (=> b!605139 (= res!388790 (and (= (size!18238 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18238 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18238 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!605140 () Bool)

(assert (=> b!605140 (= e!346318 (bvsle #b00000000000000000000000000000000 (size!18238 a!2986)))))

(assert (=> b!605140 (arrayContainsKey!0 lt!276049 (select (arr!17874 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!276053 () Unit!19264)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37238 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19264)

(assert (=> b!605140 (= lt!276053 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276049 (select (arr!17874 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!605140 e!346315))

(declare-fun res!388772 () Bool)

(assert (=> b!605140 (=> (not res!388772) (not e!346315))))

(assert (=> b!605140 (= res!388772 (arrayContainsKey!0 lt!276049 (select (arr!17874 a!2986) j!136) j!136))))

(declare-fun b!605141 () Bool)

(declare-fun res!388779 () Bool)

(assert (=> b!605141 (=> (not res!388779) (not e!346314))))

(declare-datatypes ((List!11915 0))(
  ( (Nil!11912) (Cons!11911 (h!12956 (_ BitVec 64)) (t!18143 List!11915)) )
))
(declare-fun arrayNoDuplicates!0 (array!37238 (_ BitVec 32) List!11915) Bool)

(assert (=> b!605141 (= res!388779 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11912))))

(declare-fun b!605142 () Bool)

(declare-fun Unit!19269 () Unit!19264)

(assert (=> b!605142 (= e!346312 Unit!19269)))

(declare-fun lt!276051 () Unit!19264)

(assert (=> b!605142 (= lt!276051 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276049 (select (arr!17874 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!605142 (arrayContainsKey!0 lt!276049 (select (arr!17874 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!276062 () Unit!19264)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37238 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11915) Unit!19264)

(assert (=> b!605142 (= lt!276062 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11912))))

(assert (=> b!605142 (arrayNoDuplicates!0 lt!276049 #b00000000000000000000000000000000 Nil!11912)))

(declare-fun lt!276060 () Unit!19264)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37238 (_ BitVec 32) (_ BitVec 32)) Unit!19264)

(assert (=> b!605142 (= lt!276060 (lemmaNoDuplicateFromThenFromBigger!0 lt!276049 #b00000000000000000000000000000000 j!136))))

(assert (=> b!605142 (arrayNoDuplicates!0 lt!276049 j!136 Nil!11912)))

(declare-fun lt!276050 () Unit!19264)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37238 (_ BitVec 64) (_ BitVec 32) List!11915) Unit!19264)

(assert (=> b!605142 (= lt!276050 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!276049 (select (arr!17874 a!2986) j!136) j!136 Nil!11912))))

(assert (=> b!605142 false))

(declare-fun b!605143 () Bool)

(assert (=> b!605143 (= e!346309 e!346316)))

(declare-fun res!388789 () Bool)

(assert (=> b!605143 (=> res!388789 e!346316)))

(declare-fun lt!276059 () (_ BitVec 64))

(assert (=> b!605143 (= res!388789 (or (not (= (select (arr!17874 a!2986) j!136) lt!276054)) (not (= (select (arr!17874 a!2986) j!136) lt!276059))))))

(declare-fun e!346321 () Bool)

(assert (=> b!605143 e!346321))

(declare-fun res!388778 () Bool)

(assert (=> b!605143 (=> (not res!388778) (not e!346321))))

(assert (=> b!605143 (= res!388778 (= lt!276059 (select (arr!17874 a!2986) j!136)))))

(assert (=> b!605143 (= lt!276059 (select (store (arr!17874 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!605144 () Bool)

(assert (=> b!605144 (= e!346321 e!346323)))

(declare-fun res!388781 () Bool)

(assert (=> b!605144 (=> res!388781 e!346323)))

(assert (=> b!605144 (= res!388781 (or (not (= (select (arr!17874 a!2986) j!136) lt!276054)) (not (= (select (arr!17874 a!2986) j!136) lt!276059)) (bvsge j!136 index!984)))))

(assert (= (and start!55246 res!388780) b!605139))

(assert (= (and b!605139 res!388790) b!605129))

(assert (= (and b!605129 res!388788) b!605124))

(assert (= (and b!605124 res!388783) b!605138))

(assert (= (and b!605138 res!388784) b!605131))

(assert (= (and b!605131 res!388787) b!605123))

(assert (= (and b!605123 res!388773) b!605141))

(assert (= (and b!605141 res!388779) b!605122))

(assert (= (and b!605122 res!388786) b!605135))

(assert (= (and b!605135 res!388785) b!605137))

(assert (= (and b!605137 res!388774) b!605125))

(assert (= (and b!605125 res!388776) b!605130))

(assert (= (and b!605125 c!68542) b!605136))

(assert (= (and b!605125 (not c!68542)) b!605132))

(assert (= (and b!605125 (not res!388775)) b!605143))

(assert (= (and b!605143 res!388778) b!605144))

(assert (= (and b!605144 (not res!388781)) b!605133))

(assert (= (and b!605133 res!388782) b!605127))

(assert (= (and b!605143 (not res!388789)) b!605134))

(assert (= (and b!605134 c!68543) b!605142))

(assert (= (and b!605134 (not c!68543)) b!605126))

(assert (= (and b!605134 (not res!388777)) b!605140))

(assert (= (and b!605140 res!388772) b!605128))

(declare-fun m!581999 () Bool)

(assert (=> b!605125 m!581999))

(declare-fun m!582001 () Bool)

(assert (=> b!605125 m!582001))

(declare-fun m!582003 () Bool)

(assert (=> b!605125 m!582003))

(declare-fun m!582005 () Bool)

(assert (=> b!605125 m!582005))

(declare-fun m!582007 () Bool)

(assert (=> b!605125 m!582007))

(declare-fun m!582009 () Bool)

(assert (=> b!605125 m!582009))

(declare-fun m!582011 () Bool)

(assert (=> b!605125 m!582011))

(declare-fun m!582013 () Bool)

(assert (=> b!605125 m!582013))

(assert (=> b!605125 m!582011))

(assert (=> b!605142 m!582011))

(declare-fun m!582015 () Bool)

(assert (=> b!605142 m!582015))

(assert (=> b!605142 m!582011))

(assert (=> b!605142 m!582011))

(declare-fun m!582017 () Bool)

(assert (=> b!605142 m!582017))

(assert (=> b!605142 m!582011))

(declare-fun m!582019 () Bool)

(assert (=> b!605142 m!582019))

(declare-fun m!582021 () Bool)

(assert (=> b!605142 m!582021))

(declare-fun m!582023 () Bool)

(assert (=> b!605142 m!582023))

(declare-fun m!582025 () Bool)

(assert (=> b!605142 m!582025))

(declare-fun m!582027 () Bool)

(assert (=> b!605142 m!582027))

(declare-fun m!582029 () Bool)

(assert (=> b!605137 m!582029))

(assert (=> b!605137 m!582011))

(assert (=> b!605137 m!582011))

(declare-fun m!582031 () Bool)

(assert (=> b!605137 m!582031))

(declare-fun m!582033 () Bool)

(assert (=> b!605122 m!582033))

(assert (=> b!605144 m!582011))

(declare-fun m!582035 () Bool)

(assert (=> start!55246 m!582035))

(declare-fun m!582037 () Bool)

(assert (=> start!55246 m!582037))

(assert (=> b!605143 m!582011))

(assert (=> b!605143 m!582005))

(declare-fun m!582039 () Bool)

(assert (=> b!605143 m!582039))

(assert (=> b!605127 m!582011))

(assert (=> b!605127 m!582011))

(declare-fun m!582041 () Bool)

(assert (=> b!605127 m!582041))

(assert (=> b!605129 m!582011))

(assert (=> b!605129 m!582011))

(declare-fun m!582043 () Bool)

(assert (=> b!605129 m!582043))

(assert (=> b!605140 m!582011))

(assert (=> b!605140 m!582011))

(declare-fun m!582045 () Bool)

(assert (=> b!605140 m!582045))

(assert (=> b!605140 m!582011))

(declare-fun m!582047 () Bool)

(assert (=> b!605140 m!582047))

(assert (=> b!605140 m!582011))

(declare-fun m!582049 () Bool)

(assert (=> b!605140 m!582049))

(declare-fun m!582051 () Bool)

(assert (=> b!605141 m!582051))

(assert (=> b!605133 m!582011))

(assert (=> b!605133 m!582011))

(assert (=> b!605133 m!582049))

(assert (=> b!605135 m!582005))

(declare-fun m!582053 () Bool)

(assert (=> b!605135 m!582053))

(assert (=> b!605128 m!582011))

(assert (=> b!605128 m!582011))

(assert (=> b!605128 m!582041))

(declare-fun m!582055 () Bool)

(assert (=> b!605138 m!582055))

(declare-fun m!582057 () Bool)

(assert (=> b!605131 m!582057))

(declare-fun m!582059 () Bool)

(assert (=> b!605124 m!582059))

(declare-fun m!582061 () Bool)

(assert (=> b!605123 m!582061))

(push 1)

