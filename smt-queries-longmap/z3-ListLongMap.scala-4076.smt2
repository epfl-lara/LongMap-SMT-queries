; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55938 () Bool)

(assert start!55938)

(declare-fun b!613347 () Bool)

(declare-datatypes ((Unit!19746 0))(
  ( (Unit!19747) )
))
(declare-fun e!351601 () Unit!19746)

(declare-fun Unit!19748 () Unit!19746)

(assert (=> b!613347 (= e!351601 Unit!19748)))

(declare-fun b!613348 () Bool)

(declare-fun e!351597 () Bool)

(declare-datatypes ((SeekEntryResult!6394 0))(
  ( (MissingZero!6394 (index!27860 (_ BitVec 32))) (Found!6394 (index!27861 (_ BitVec 32))) (Intermediate!6394 (undefined!7206 Bool) (index!27862 (_ BitVec 32)) (x!56677 (_ BitVec 32))) (Undefined!6394) (MissingVacant!6394 (index!27863 (_ BitVec 32))) )
))
(declare-fun lt!281064 () SeekEntryResult!6394)

(declare-fun lt!281053 () SeekEntryResult!6394)

(assert (=> b!613348 (= e!351597 (= lt!281064 lt!281053))))

(declare-fun b!613349 () Bool)

(declare-fun res!394889 () Bool)

(declare-fun e!351604 () Bool)

(assert (=> b!613349 (=> (not res!394889) (not e!351604))))

(declare-datatypes ((array!37422 0))(
  ( (array!37423 (arr!17957 (Array (_ BitVec 32) (_ BitVec 64))) (size!18322 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37422)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37422 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!613349 (= res!394889 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!613350 () Bool)

(declare-fun res!394888 () Bool)

(declare-fun e!351608 () Bool)

(assert (=> b!613350 (=> res!394888 e!351608)))

(declare-datatypes ((List!12037 0))(
  ( (Nil!12034) (Cons!12033 (h!13078 (_ BitVec 64)) (t!18256 List!12037)) )
))
(declare-fun contains!3041 (List!12037 (_ BitVec 64)) Bool)

(assert (=> b!613350 (= res!394888 (contains!3041 Nil!12034 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!613351 () Bool)

(declare-fun Unit!19749 () Unit!19746)

(assert (=> b!613351 (= e!351601 Unit!19749)))

(assert (=> b!613351 false))

(declare-fun res!394881 () Bool)

(assert (=> start!55938 (=> (not res!394881) (not e!351604))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55938 (= res!394881 (validMask!0 mask!3053))))

(assert (=> start!55938 e!351604))

(assert (=> start!55938 true))

(declare-fun array_inv!13840 (array!37422) Bool)

(assert (=> start!55938 (array_inv!13840 a!2986)))

(declare-fun b!613352 () Bool)

(declare-fun e!351598 () Bool)

(assert (=> b!613352 (= e!351604 e!351598)))

(declare-fun res!394871 () Bool)

(assert (=> b!613352 (=> (not res!394871) (not e!351598))))

(declare-fun lt!281051 () SeekEntryResult!6394)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!613352 (= res!394871 (or (= lt!281051 (MissingZero!6394 i!1108)) (= lt!281051 (MissingVacant!6394 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37422 (_ BitVec 32)) SeekEntryResult!6394)

(assert (=> b!613352 (= lt!281051 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!613353 () Bool)

(declare-fun res!394872 () Bool)

(assert (=> b!613353 (=> res!394872 e!351608)))

(declare-fun noDuplicate!365 (List!12037) Bool)

(assert (=> b!613353 (= res!394872 (not (noDuplicate!365 Nil!12034)))))

(declare-fun b!613354 () Bool)

(declare-fun res!394890 () Bool)

(assert (=> b!613354 (=> (not res!394890) (not e!351598))))

(declare-fun arrayNoDuplicates!0 (array!37422 (_ BitVec 32) List!12037) Bool)

(assert (=> b!613354 (= res!394890 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12034))))

(declare-fun b!613355 () Bool)

(assert (=> b!613355 (= e!351608 true)))

(declare-fun lt!281049 () Bool)

(assert (=> b!613355 (= lt!281049 (contains!3041 Nil!12034 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!613356 () Bool)

(declare-fun res!394878 () Bool)

(assert (=> b!613356 (=> (not res!394878) (not e!351598))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!613356 (= res!394878 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17957 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!613357 () Bool)

(declare-fun e!351602 () Bool)

(declare-fun e!351595 () Bool)

(assert (=> b!613357 (= e!351602 e!351595)))

(declare-fun res!394873 () Bool)

(assert (=> b!613357 (=> (not res!394873) (not e!351595))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!613357 (= res!394873 (and (= lt!281064 (Found!6394 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17957 a!2986) index!984) (select (arr!17957 a!2986) j!136))) (not (= (select (arr!17957 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37422 (_ BitVec 32)) SeekEntryResult!6394)

(assert (=> b!613357 (= lt!281064 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17957 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!613358 () Bool)

(declare-fun e!351609 () Bool)

(assert (=> b!613358 (= e!351595 (not e!351609))))

(declare-fun res!394877 () Bool)

(assert (=> b!613358 (=> res!394877 e!351609)))

(declare-fun lt!281061 () SeekEntryResult!6394)

(assert (=> b!613358 (= res!394877 (not (= lt!281061 (Found!6394 index!984))))))

(declare-fun lt!281050 () Unit!19746)

(assert (=> b!613358 (= lt!281050 e!351601)))

(declare-fun c!69605 () Bool)

(assert (=> b!613358 (= c!69605 (= lt!281061 Undefined!6394))))

(declare-fun lt!281054 () array!37422)

(declare-fun lt!281056 () (_ BitVec 64))

(assert (=> b!613358 (= lt!281061 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!281056 lt!281054 mask!3053))))

(assert (=> b!613358 e!351597))

(declare-fun res!394891 () Bool)

(assert (=> b!613358 (=> (not res!394891) (not e!351597))))

(declare-fun lt!281052 () (_ BitVec 32))

(assert (=> b!613358 (= res!394891 (= lt!281053 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!281052 vacantSpotIndex!68 lt!281056 lt!281054 mask!3053)))))

(assert (=> b!613358 (= lt!281053 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!281052 vacantSpotIndex!68 (select (arr!17957 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!613358 (= lt!281056 (select (store (arr!17957 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!281060 () Unit!19746)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37422 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19746)

(assert (=> b!613358 (= lt!281060 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!281052 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!613358 (= lt!281052 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!613359 () Bool)

(declare-fun e!351596 () Unit!19746)

(declare-fun Unit!19750 () Unit!19746)

(assert (=> b!613359 (= e!351596 Unit!19750)))

(declare-fun b!613360 () Bool)

(declare-fun e!351599 () Bool)

(declare-fun e!351606 () Bool)

(assert (=> b!613360 (= e!351599 e!351606)))

(declare-fun res!394883 () Bool)

(assert (=> b!613360 (=> (not res!394883) (not e!351606))))

(assert (=> b!613360 (= res!394883 (arrayContainsKey!0 lt!281054 (select (arr!17957 a!2986) j!136) j!136))))

(declare-fun b!613361 () Bool)

(declare-fun res!394876 () Bool)

(assert (=> b!613361 (=> (not res!394876) (not e!351604))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!613361 (= res!394876 (validKeyInArray!0 (select (arr!17957 a!2986) j!136)))))

(declare-fun b!613362 () Bool)

(assert (=> b!613362 (= e!351606 (arrayContainsKey!0 lt!281054 (select (arr!17957 a!2986) j!136) index!984))))

(declare-fun b!613363 () Bool)

(declare-fun e!351594 () Bool)

(declare-fun e!351600 () Bool)

(assert (=> b!613363 (= e!351594 e!351600)))

(declare-fun res!394886 () Bool)

(assert (=> b!613363 (=> res!394886 e!351600)))

(assert (=> b!613363 (= res!394886 (bvsge index!984 j!136))))

(declare-fun lt!281065 () Unit!19746)

(assert (=> b!613363 (= lt!281065 e!351596)))

(declare-fun c!69606 () Bool)

(assert (=> b!613363 (= c!69606 (bvslt j!136 index!984))))

(declare-fun b!613364 () Bool)

(declare-fun res!394879 () Bool)

(assert (=> b!613364 (=> (not res!394879) (not e!351604))))

(assert (=> b!613364 (= res!394879 (and (= (size!18322 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18322 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18322 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!613365 () Bool)

(declare-fun res!394884 () Bool)

(assert (=> b!613365 (=> (not res!394884) (not e!351604))))

(assert (=> b!613365 (= res!394884 (validKeyInArray!0 k0!1786))))

(declare-fun b!613366 () Bool)

(declare-fun Unit!19751 () Unit!19746)

(assert (=> b!613366 (= e!351596 Unit!19751)))

(declare-fun lt!281062 () Unit!19746)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37422 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19746)

(assert (=> b!613366 (= lt!281062 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!281054 (select (arr!17957 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!613366 (arrayContainsKey!0 lt!281054 (select (arr!17957 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!281047 () Unit!19746)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37422 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12037) Unit!19746)

(assert (=> b!613366 (= lt!281047 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12034))))

(assert (=> b!613366 (arrayNoDuplicates!0 lt!281054 #b00000000000000000000000000000000 Nil!12034)))

(declare-fun lt!281048 () Unit!19746)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37422 (_ BitVec 32) (_ BitVec 32)) Unit!19746)

(assert (=> b!613366 (= lt!281048 (lemmaNoDuplicateFromThenFromBigger!0 lt!281054 #b00000000000000000000000000000000 j!136))))

(assert (=> b!613366 (arrayNoDuplicates!0 lt!281054 j!136 Nil!12034)))

(declare-fun lt!281063 () Unit!19746)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37422 (_ BitVec 64) (_ BitVec 32) List!12037) Unit!19746)

(assert (=> b!613366 (= lt!281063 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!281054 (select (arr!17957 a!2986) j!136) j!136 Nil!12034))))

(assert (=> b!613366 false))

(declare-fun b!613367 () Bool)

(declare-fun res!394880 () Bool)

(assert (=> b!613367 (=> (not res!394880) (not e!351598))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37422 (_ BitVec 32)) Bool)

(assert (=> b!613367 (= res!394880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!613368 () Bool)

(assert (=> b!613368 (= e!351600 e!351608)))

(declare-fun res!394874 () Bool)

(assert (=> b!613368 (=> res!394874 e!351608)))

(assert (=> b!613368 (= res!394874 (or (bvsge (size!18322 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 index!984) (size!18322 a!2986)) (bvsge index!984 (size!18322 a!2986))))))

(assert (=> b!613368 (arrayNoDuplicates!0 lt!281054 index!984 Nil!12034)))

(declare-fun lt!281055 () Unit!19746)

(assert (=> b!613368 (= lt!281055 (lemmaNoDuplicateFromThenFromBigger!0 lt!281054 #b00000000000000000000000000000000 index!984))))

(assert (=> b!613368 (arrayNoDuplicates!0 lt!281054 #b00000000000000000000000000000000 Nil!12034)))

(declare-fun lt!281058 () Unit!19746)

(assert (=> b!613368 (= lt!281058 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12034))))

(assert (=> b!613368 (arrayContainsKey!0 lt!281054 (select (arr!17957 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!281057 () Unit!19746)

(assert (=> b!613368 (= lt!281057 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!281054 (select (arr!17957 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!351603 () Bool)

(assert (=> b!613368 e!351603))

(declare-fun res!394875 () Bool)

(assert (=> b!613368 (=> (not res!394875) (not e!351603))))

(assert (=> b!613368 (= res!394875 (arrayContainsKey!0 lt!281054 (select (arr!17957 a!2986) j!136) j!136))))

(declare-fun b!613369 () Bool)

(assert (=> b!613369 (= e!351598 e!351602)))

(declare-fun res!394892 () Bool)

(assert (=> b!613369 (=> (not res!394892) (not e!351602))))

(assert (=> b!613369 (= res!394892 (= (select (store (arr!17957 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!613369 (= lt!281054 (array!37423 (store (arr!17957 a!2986) i!1108 k0!1786) (size!18322 a!2986)))))

(declare-fun b!613370 () Bool)

(assert (=> b!613370 (= e!351609 e!351594)))

(declare-fun res!394882 () Bool)

(assert (=> b!613370 (=> res!394882 e!351594)))

(declare-fun lt!281059 () (_ BitVec 64))

(assert (=> b!613370 (= res!394882 (or (not (= (select (arr!17957 a!2986) j!136) lt!281056)) (not (= (select (arr!17957 a!2986) j!136) lt!281059))))))

(declare-fun e!351607 () Bool)

(assert (=> b!613370 e!351607))

(declare-fun res!394887 () Bool)

(assert (=> b!613370 (=> (not res!394887) (not e!351607))))

(assert (=> b!613370 (= res!394887 (= lt!281059 (select (arr!17957 a!2986) j!136)))))

(assert (=> b!613370 (= lt!281059 (select (store (arr!17957 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!613371 () Bool)

(assert (=> b!613371 (= e!351603 (arrayContainsKey!0 lt!281054 (select (arr!17957 a!2986) j!136) index!984))))

(declare-fun b!613372 () Bool)

(assert (=> b!613372 (= e!351607 e!351599)))

(declare-fun res!394885 () Bool)

(assert (=> b!613372 (=> res!394885 e!351599)))

(assert (=> b!613372 (= res!394885 (or (not (= (select (arr!17957 a!2986) j!136) lt!281056)) (not (= (select (arr!17957 a!2986) j!136) lt!281059)) (bvsge j!136 index!984)))))

(assert (= (and start!55938 res!394881) b!613364))

(assert (= (and b!613364 res!394879) b!613361))

(assert (= (and b!613361 res!394876) b!613365))

(assert (= (and b!613365 res!394884) b!613349))

(assert (= (and b!613349 res!394889) b!613352))

(assert (= (and b!613352 res!394871) b!613367))

(assert (= (and b!613367 res!394880) b!613354))

(assert (= (and b!613354 res!394890) b!613356))

(assert (= (and b!613356 res!394878) b!613369))

(assert (= (and b!613369 res!394892) b!613357))

(assert (= (and b!613357 res!394873) b!613358))

(assert (= (and b!613358 res!394891) b!613348))

(assert (= (and b!613358 c!69605) b!613351))

(assert (= (and b!613358 (not c!69605)) b!613347))

(assert (= (and b!613358 (not res!394877)) b!613370))

(assert (= (and b!613370 res!394887) b!613372))

(assert (= (and b!613372 (not res!394885)) b!613360))

(assert (= (and b!613360 res!394883) b!613362))

(assert (= (and b!613370 (not res!394882)) b!613363))

(assert (= (and b!613363 c!69606) b!613366))

(assert (= (and b!613363 (not c!69606)) b!613359))

(assert (= (and b!613363 (not res!394886)) b!613368))

(assert (= (and b!613368 res!394875) b!613371))

(assert (= (and b!613368 (not res!394874)) b!613353))

(assert (= (and b!613353 (not res!394872)) b!613350))

(assert (= (and b!613350 (not res!394888)) b!613355))

(declare-fun m!589123 () Bool)

(assert (=> b!613360 m!589123))

(assert (=> b!613360 m!589123))

(declare-fun m!589125 () Bool)

(assert (=> b!613360 m!589125))

(declare-fun m!589127 () Bool)

(assert (=> start!55938 m!589127))

(declare-fun m!589129 () Bool)

(assert (=> start!55938 m!589129))

(declare-fun m!589131 () Bool)

(assert (=> b!613355 m!589131))

(declare-fun m!589133 () Bool)

(assert (=> b!613357 m!589133))

(assert (=> b!613357 m!589123))

(assert (=> b!613357 m!589123))

(declare-fun m!589135 () Bool)

(assert (=> b!613357 m!589135))

(declare-fun m!589137 () Bool)

(assert (=> b!613358 m!589137))

(declare-fun m!589139 () Bool)

(assert (=> b!613358 m!589139))

(assert (=> b!613358 m!589123))

(declare-fun m!589141 () Bool)

(assert (=> b!613358 m!589141))

(assert (=> b!613358 m!589123))

(declare-fun m!589143 () Bool)

(assert (=> b!613358 m!589143))

(declare-fun m!589145 () Bool)

(assert (=> b!613358 m!589145))

(declare-fun m!589147 () Bool)

(assert (=> b!613358 m!589147))

(declare-fun m!589149 () Bool)

(assert (=> b!613358 m!589149))

(declare-fun m!589151 () Bool)

(assert (=> b!613356 m!589151))

(declare-fun m!589153 () Bool)

(assert (=> b!613352 m!589153))

(assert (=> b!613368 m!589123))

(declare-fun m!589155 () Bool)

(assert (=> b!613368 m!589155))

(assert (=> b!613368 m!589123))

(declare-fun m!589157 () Bool)

(assert (=> b!613368 m!589157))

(declare-fun m!589159 () Bool)

(assert (=> b!613368 m!589159))

(assert (=> b!613368 m!589123))

(assert (=> b!613368 m!589125))

(declare-fun m!589161 () Bool)

(assert (=> b!613368 m!589161))

(declare-fun m!589163 () Bool)

(assert (=> b!613368 m!589163))

(assert (=> b!613368 m!589123))

(declare-fun m!589165 () Bool)

(assert (=> b!613368 m!589165))

(assert (=> b!613362 m!589123))

(assert (=> b!613362 m!589123))

(declare-fun m!589167 () Bool)

(assert (=> b!613362 m!589167))

(assert (=> b!613372 m!589123))

(assert (=> b!613361 m!589123))

(assert (=> b!613361 m!589123))

(declare-fun m!589169 () Bool)

(assert (=> b!613361 m!589169))

(assert (=> b!613371 m!589123))

(assert (=> b!613371 m!589123))

(assert (=> b!613371 m!589167))

(declare-fun m!589171 () Bool)

(assert (=> b!613367 m!589171))

(assert (=> b!613370 m!589123))

(assert (=> b!613370 m!589141))

(declare-fun m!589173 () Bool)

(assert (=> b!613370 m!589173))

(declare-fun m!589175 () Bool)

(assert (=> b!613365 m!589175))

(declare-fun m!589177 () Bool)

(assert (=> b!613354 m!589177))

(assert (=> b!613369 m!589141))

(declare-fun m!589179 () Bool)

(assert (=> b!613369 m!589179))

(declare-fun m!589181 () Bool)

(assert (=> b!613353 m!589181))

(assert (=> b!613366 m!589123))

(declare-fun m!589183 () Bool)

(assert (=> b!613366 m!589183))

(assert (=> b!613366 m!589123))

(assert (=> b!613366 m!589123))

(declare-fun m!589185 () Bool)

(assert (=> b!613366 m!589185))

(declare-fun m!589187 () Bool)

(assert (=> b!613366 m!589187))

(declare-fun m!589189 () Bool)

(assert (=> b!613366 m!589189))

(assert (=> b!613366 m!589161))

(assert (=> b!613366 m!589123))

(declare-fun m!589191 () Bool)

(assert (=> b!613366 m!589191))

(assert (=> b!613366 m!589159))

(declare-fun m!589193 () Bool)

(assert (=> b!613350 m!589193))

(declare-fun m!589195 () Bool)

(assert (=> b!613349 m!589195))

(check-sat (not b!613362) (not b!613368) (not b!613353) (not b!613357) (not b!613355) (not b!613350) (not b!613365) (not b!613360) (not start!55938) (not b!613366) (not b!613367) (not b!613358) (not b!613361) (not b!613354) (not b!613352) (not b!613349) (not b!613371))
(check-sat)
