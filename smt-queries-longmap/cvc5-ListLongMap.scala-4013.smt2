; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54550 () Bool)

(assert start!54550)

(declare-fun b!596344 () Bool)

(declare-datatypes ((Unit!18754 0))(
  ( (Unit!18755) )
))
(declare-fun e!340722 () Unit!18754)

(declare-fun Unit!18756 () Unit!18754)

(assert (=> b!596344 (= e!340722 Unit!18756)))

(declare-fun b!596345 () Bool)

(declare-fun e!340723 () Bool)

(declare-fun e!340721 () Bool)

(assert (=> b!596345 (= e!340723 e!340721)))

(declare-fun res!382140 () Bool)

(assert (=> b!596345 (=> (not res!382140) (not e!340721))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6209 0))(
  ( (MissingZero!6209 (index!27084 (_ BitVec 32))) (Found!6209 (index!27085 (_ BitVec 32))) (Intermediate!6209 (undefined!7021 Bool) (index!27086 (_ BitVec 32)) (x!55885 (_ BitVec 32))) (Undefined!6209) (MissingVacant!6209 (index!27087 (_ BitVec 32))) )
))
(declare-fun lt!270846 () SeekEntryResult!6209)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37010 0))(
  ( (array!37011 (arr!17769 (Array (_ BitVec 32) (_ BitVec 64))) (size!18133 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37010)

(assert (=> b!596345 (= res!382140 (and (= lt!270846 (Found!6209 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17769 a!2986) index!984) (select (arr!17769 a!2986) j!136))) (not (= (select (arr!17769 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37010 (_ BitVec 32)) SeekEntryResult!6209)

(assert (=> b!596345 (= lt!270846 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17769 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!596346 () Bool)

(declare-fun res!382154 () Bool)

(declare-fun e!340719 () Bool)

(assert (=> b!596346 (=> (not res!382154) (not e!340719))))

(declare-datatypes ((List!11810 0))(
  ( (Nil!11807) (Cons!11806 (h!12851 (_ BitVec 64)) (t!18038 List!11810)) )
))
(declare-fun arrayNoDuplicates!0 (array!37010 (_ BitVec 32) List!11810) Bool)

(assert (=> b!596346 (= res!382154 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11807))))

(declare-fun b!596347 () Bool)

(declare-fun e!340720 () Bool)

(assert (=> b!596347 (= e!340720 e!340719)))

(declare-fun res!382153 () Bool)

(assert (=> b!596347 (=> (not res!382153) (not e!340719))))

(declare-fun lt!270842 () SeekEntryResult!6209)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!596347 (= res!382153 (or (= lt!270842 (MissingZero!6209 i!1108)) (= lt!270842 (MissingVacant!6209 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37010 (_ BitVec 32)) SeekEntryResult!6209)

(assert (=> b!596347 (= lt!270842 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!596348 () Bool)

(declare-fun res!382152 () Bool)

(assert (=> b!596348 (=> (not res!382152) (not e!340719))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37010 (_ BitVec 32)) Bool)

(assert (=> b!596348 (= res!382152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!596349 () Bool)

(declare-fun res!382144 () Bool)

(assert (=> b!596349 (=> (not res!382144) (not e!340720))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!596349 (= res!382144 (validKeyInArray!0 k!1786))))

(declare-fun b!596350 () Bool)

(declare-fun Unit!18757 () Unit!18754)

(assert (=> b!596350 (= e!340722 Unit!18757)))

(assert (=> b!596350 false))

(declare-fun b!596351 () Bool)

(declare-fun res!382141 () Bool)

(declare-fun e!340716 () Bool)

(assert (=> b!596351 (=> res!382141 e!340716)))

(declare-fun noDuplicate!264 (List!11810) Bool)

(assert (=> b!596351 (= res!382141 (not (noDuplicate!264 Nil!11807)))))

(declare-fun b!596353 () Bool)

(declare-fun e!340724 () Bool)

(assert (=> b!596353 (= e!340721 (not e!340724))))

(declare-fun res!382149 () Bool)

(assert (=> b!596353 (=> res!382149 e!340724)))

(declare-fun lt!270848 () SeekEntryResult!6209)

(assert (=> b!596353 (= res!382149 (not (= lt!270848 (Found!6209 index!984))))))

(declare-fun lt!270847 () Unit!18754)

(assert (=> b!596353 (= lt!270847 e!340722)))

(declare-fun c!67469 () Bool)

(assert (=> b!596353 (= c!67469 (= lt!270848 Undefined!6209))))

(declare-fun lt!270849 () array!37010)

(declare-fun lt!270843 () (_ BitVec 64))

(assert (=> b!596353 (= lt!270848 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270843 lt!270849 mask!3053))))

(declare-fun e!340718 () Bool)

(assert (=> b!596353 e!340718))

(declare-fun res!382160 () Bool)

(assert (=> b!596353 (=> (not res!382160) (not e!340718))))

(declare-fun lt!270853 () SeekEntryResult!6209)

(declare-fun lt!270850 () (_ BitVec 32))

(assert (=> b!596353 (= res!382160 (= lt!270853 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270850 vacantSpotIndex!68 lt!270843 lt!270849 mask!3053)))))

(assert (=> b!596353 (= lt!270853 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270850 vacantSpotIndex!68 (select (arr!17769 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!596353 (= lt!270843 (select (store (arr!17769 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!270844 () Unit!18754)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37010 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18754)

(assert (=> b!596353 (= lt!270844 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270850 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!596353 (= lt!270850 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!596354 () Bool)

(declare-fun res!382147 () Bool)

(assert (=> b!596354 (=> (not res!382147) (not e!340719))))

(assert (=> b!596354 (= res!382147 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17769 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!596355 () Bool)

(assert (=> b!596355 (= e!340718 (= lt!270846 lt!270853))))

(declare-fun b!596356 () Bool)

(assert (=> b!596356 (= e!340719 e!340723)))

(declare-fun res!382150 () Bool)

(assert (=> b!596356 (=> (not res!382150) (not e!340723))))

(assert (=> b!596356 (= res!382150 (= (select (store (arr!17769 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!596356 (= lt!270849 (array!37011 (store (arr!17769 a!2986) i!1108 k!1786) (size!18133 a!2986)))))

(declare-fun b!596357 () Bool)

(declare-fun e!340714 () Bool)

(assert (=> b!596357 (= e!340714 e!340716)))

(declare-fun res!382155 () Bool)

(assert (=> b!596357 (=> res!382155 e!340716)))

(assert (=> b!596357 (= res!382155 (or (bvsge (size!18133 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18133 a!2986))))))

(declare-fun arrayContainsKey!0 (array!37010 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!596357 (arrayContainsKey!0 lt!270849 (select (arr!17769 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270845 () Unit!18754)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37010 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18754)

(assert (=> b!596357 (= lt!270845 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270849 (select (arr!17769 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!596358 () Bool)

(declare-fun res!382142 () Bool)

(assert (=> b!596358 (=> res!382142 e!340716)))

(declare-fun contains!2945 (List!11810 (_ BitVec 64)) Bool)

(assert (=> b!596358 (= res!382142 (contains!2945 Nil!11807 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!596359 () Bool)

(declare-fun e!340725 () Bool)

(declare-fun e!340717 () Bool)

(assert (=> b!596359 (= e!340725 e!340717)))

(declare-fun res!382159 () Bool)

(assert (=> b!596359 (=> (not res!382159) (not e!340717))))

(assert (=> b!596359 (= res!382159 (arrayContainsKey!0 lt!270849 (select (arr!17769 a!2986) j!136) j!136))))

(declare-fun b!596360 () Bool)

(declare-fun res!382148 () Bool)

(assert (=> b!596360 (=> (not res!382148) (not e!340720))))

(assert (=> b!596360 (= res!382148 (and (= (size!18133 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18133 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18133 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!596361 () Bool)

(assert (=> b!596361 (= e!340724 e!340714)))

(declare-fun res!382146 () Bool)

(assert (=> b!596361 (=> res!382146 e!340714)))

(declare-fun lt!270852 () (_ BitVec 64))

(assert (=> b!596361 (= res!382146 (or (not (= (select (arr!17769 a!2986) j!136) lt!270843)) (not (= (select (arr!17769 a!2986) j!136) lt!270852)) (bvsge j!136 index!984)))))

(declare-fun e!340715 () Bool)

(assert (=> b!596361 e!340715))

(declare-fun res!382158 () Bool)

(assert (=> b!596361 (=> (not res!382158) (not e!340715))))

(assert (=> b!596361 (= res!382158 (= lt!270852 (select (arr!17769 a!2986) j!136)))))

(assert (=> b!596361 (= lt!270852 (select (store (arr!17769 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!596362 () Bool)

(assert (=> b!596362 (= e!340716 true)))

(declare-fun lt!270851 () Bool)

(assert (=> b!596362 (= lt!270851 (contains!2945 Nil!11807 k!1786))))

(declare-fun res!382145 () Bool)

(assert (=> start!54550 (=> (not res!382145) (not e!340720))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54550 (= res!382145 (validMask!0 mask!3053))))

(assert (=> start!54550 e!340720))

(assert (=> start!54550 true))

(declare-fun array_inv!13565 (array!37010) Bool)

(assert (=> start!54550 (array_inv!13565 a!2986)))

(declare-fun b!596352 () Bool)

(declare-fun res!382151 () Bool)

(assert (=> b!596352 (=> res!382151 e!340716)))

(assert (=> b!596352 (= res!382151 (contains!2945 Nil!11807 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!596363 () Bool)

(assert (=> b!596363 (= e!340715 e!340725)))

(declare-fun res!382143 () Bool)

(assert (=> b!596363 (=> res!382143 e!340725)))

(assert (=> b!596363 (= res!382143 (or (not (= (select (arr!17769 a!2986) j!136) lt!270843)) (not (= (select (arr!17769 a!2986) j!136) lt!270852)) (bvsge j!136 index!984)))))

(declare-fun b!596364 () Bool)

(declare-fun res!382156 () Bool)

(assert (=> b!596364 (=> (not res!382156) (not e!340720))))

(assert (=> b!596364 (= res!382156 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!596365 () Bool)

(declare-fun res!382157 () Bool)

(assert (=> b!596365 (=> (not res!382157) (not e!340720))))

(assert (=> b!596365 (= res!382157 (validKeyInArray!0 (select (arr!17769 a!2986) j!136)))))

(declare-fun b!596366 () Bool)

(assert (=> b!596366 (= e!340717 (arrayContainsKey!0 lt!270849 (select (arr!17769 a!2986) j!136) index!984))))

(assert (= (and start!54550 res!382145) b!596360))

(assert (= (and b!596360 res!382148) b!596365))

(assert (= (and b!596365 res!382157) b!596349))

(assert (= (and b!596349 res!382144) b!596364))

(assert (= (and b!596364 res!382156) b!596347))

(assert (= (and b!596347 res!382153) b!596348))

(assert (= (and b!596348 res!382152) b!596346))

(assert (= (and b!596346 res!382154) b!596354))

(assert (= (and b!596354 res!382147) b!596356))

(assert (= (and b!596356 res!382150) b!596345))

(assert (= (and b!596345 res!382140) b!596353))

(assert (= (and b!596353 res!382160) b!596355))

(assert (= (and b!596353 c!67469) b!596350))

(assert (= (and b!596353 (not c!67469)) b!596344))

(assert (= (and b!596353 (not res!382149)) b!596361))

(assert (= (and b!596361 res!382158) b!596363))

(assert (= (and b!596363 (not res!382143)) b!596359))

(assert (= (and b!596359 res!382159) b!596366))

(assert (= (and b!596361 (not res!382146)) b!596357))

(assert (= (and b!596357 (not res!382155)) b!596351))

(assert (= (and b!596351 (not res!382141)) b!596352))

(assert (= (and b!596352 (not res!382151)) b!596358))

(assert (= (and b!596358 (not res!382142)) b!596362))

(declare-fun m!573851 () Bool)

(assert (=> b!596365 m!573851))

(assert (=> b!596365 m!573851))

(declare-fun m!573853 () Bool)

(assert (=> b!596365 m!573853))

(declare-fun m!573855 () Bool)

(assert (=> b!596356 m!573855))

(declare-fun m!573857 () Bool)

(assert (=> b!596356 m!573857))

(declare-fun m!573859 () Bool)

(assert (=> b!596348 m!573859))

(declare-fun m!573861 () Bool)

(assert (=> b!596352 m!573861))

(declare-fun m!573863 () Bool)

(assert (=> b!596362 m!573863))

(declare-fun m!573865 () Bool)

(assert (=> b!596364 m!573865))

(assert (=> b!596361 m!573851))

(assert (=> b!596361 m!573855))

(declare-fun m!573867 () Bool)

(assert (=> b!596361 m!573867))

(declare-fun m!573869 () Bool)

(assert (=> b!596353 m!573869))

(declare-fun m!573871 () Bool)

(assert (=> b!596353 m!573871))

(declare-fun m!573873 () Bool)

(assert (=> b!596353 m!573873))

(assert (=> b!596353 m!573851))

(assert (=> b!596353 m!573851))

(declare-fun m!573875 () Bool)

(assert (=> b!596353 m!573875))

(assert (=> b!596353 m!573855))

(declare-fun m!573877 () Bool)

(assert (=> b!596353 m!573877))

(declare-fun m!573879 () Bool)

(assert (=> b!596353 m!573879))

(declare-fun m!573881 () Bool)

(assert (=> b!596351 m!573881))

(declare-fun m!573883 () Bool)

(assert (=> b!596354 m!573883))

(assert (=> b!596359 m!573851))

(assert (=> b!596359 m!573851))

(declare-fun m!573885 () Bool)

(assert (=> b!596359 m!573885))

(assert (=> b!596357 m!573851))

(assert (=> b!596357 m!573851))

(declare-fun m!573887 () Bool)

(assert (=> b!596357 m!573887))

(assert (=> b!596357 m!573851))

(declare-fun m!573889 () Bool)

(assert (=> b!596357 m!573889))

(declare-fun m!573891 () Bool)

(assert (=> b!596349 m!573891))

(assert (=> b!596366 m!573851))

(assert (=> b!596366 m!573851))

(declare-fun m!573893 () Bool)

(assert (=> b!596366 m!573893))

(declare-fun m!573895 () Bool)

(assert (=> b!596345 m!573895))

(assert (=> b!596345 m!573851))

(assert (=> b!596345 m!573851))

(declare-fun m!573897 () Bool)

(assert (=> b!596345 m!573897))

(declare-fun m!573899 () Bool)

(assert (=> b!596358 m!573899))

(declare-fun m!573901 () Bool)

(assert (=> start!54550 m!573901))

(declare-fun m!573903 () Bool)

(assert (=> start!54550 m!573903))

(assert (=> b!596363 m!573851))

(declare-fun m!573905 () Bool)

(assert (=> b!596347 m!573905))

(declare-fun m!573907 () Bool)

(assert (=> b!596346 m!573907))

(push 1)

