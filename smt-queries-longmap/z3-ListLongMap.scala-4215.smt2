; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57808 () Bool)

(assert start!57808)

(declare-fun b!639305 () Bool)

(declare-datatypes ((Unit!21598 0))(
  ( (Unit!21599) )
))
(declare-fun e!365877 () Unit!21598)

(declare-fun Unit!21600 () Unit!21598)

(assert (=> b!639305 (= e!365877 Unit!21600)))

(assert (=> b!639305 false))

(declare-fun b!639306 () Bool)

(declare-fun e!365875 () Bool)

(declare-fun e!365878 () Bool)

(assert (=> b!639306 (= e!365875 e!365878)))

(declare-fun res!413872 () Bool)

(assert (=> b!639306 (=> (not res!413872) (not e!365878))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6816 0))(
  ( (MissingZero!6816 (index!29581 (_ BitVec 32))) (Found!6816 (index!29582 (_ BitVec 32))) (Intermediate!6816 (undefined!7628 Bool) (index!29583 (_ BitVec 32)) (x!58339 (_ BitVec 32))) (Undefined!6816) (MissingVacant!6816 (index!29584 (_ BitVec 32))) )
))
(declare-fun lt!295727 () SeekEntryResult!6816)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38310 0))(
  ( (array!38311 (arr!18376 (Array (_ BitVec 32) (_ BitVec 64))) (size!18740 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38310)

(assert (=> b!639306 (= res!413872 (and (= lt!295727 (Found!6816 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18376 a!2986) index!984) (select (arr!18376 a!2986) j!136))) (not (= (select (arr!18376 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38310 (_ BitVec 32)) SeekEntryResult!6816)

(assert (=> b!639306 (= lt!295727 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18376 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!639307 () Bool)

(declare-fun res!413865 () Bool)

(declare-fun e!365884 () Bool)

(assert (=> b!639307 (=> (not res!413865) (not e!365884))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!639307 (= res!413865 (and (= (size!18740 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18740 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18740 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!639308 () Bool)

(declare-fun e!365881 () Bool)

(declare-fun e!365886 () Bool)

(assert (=> b!639308 (= e!365881 e!365886)))

(declare-fun res!413871 () Bool)

(assert (=> b!639308 (=> res!413871 e!365886)))

(declare-fun lt!295735 () (_ BitVec 64))

(declare-fun lt!295738 () (_ BitVec 64))

(assert (=> b!639308 (= res!413871 (or (not (= (select (arr!18376 a!2986) j!136) lt!295738)) (not (= (select (arr!18376 a!2986) j!136) lt!295735)) (bvsge j!136 index!984)))))

(declare-fun b!639309 () Bool)

(declare-fun e!365876 () Bool)

(assert (=> b!639309 (= e!365886 e!365876)))

(declare-fun res!413879 () Bool)

(assert (=> b!639309 (=> (not res!413879) (not e!365876))))

(declare-fun lt!295733 () array!38310)

(declare-fun arrayContainsKey!0 (array!38310 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!639309 (= res!413879 (arrayContainsKey!0 lt!295733 (select (arr!18376 a!2986) j!136) j!136))))

(declare-fun b!639310 () Bool)

(declare-fun e!365882 () Bool)

(assert (=> b!639310 (= e!365878 (not e!365882))))

(declare-fun res!413877 () Bool)

(assert (=> b!639310 (=> res!413877 e!365882)))

(declare-fun lt!295734 () SeekEntryResult!6816)

(assert (=> b!639310 (= res!413877 (not (= lt!295734 (Found!6816 index!984))))))

(declare-fun lt!295731 () Unit!21598)

(assert (=> b!639310 (= lt!295731 e!365877)))

(declare-fun c!73088 () Bool)

(assert (=> b!639310 (= c!73088 (= lt!295734 Undefined!6816))))

(assert (=> b!639310 (= lt!295734 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295738 lt!295733 mask!3053))))

(declare-fun e!365879 () Bool)

(assert (=> b!639310 e!365879))

(declare-fun res!413869 () Bool)

(assert (=> b!639310 (=> (not res!413869) (not e!365879))))

(declare-fun lt!295737 () SeekEntryResult!6816)

(declare-fun lt!295732 () (_ BitVec 32))

(assert (=> b!639310 (= res!413869 (= lt!295737 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295732 vacantSpotIndex!68 lt!295738 lt!295733 mask!3053)))))

(assert (=> b!639310 (= lt!295737 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295732 vacantSpotIndex!68 (select (arr!18376 a!2986) j!136) a!2986 mask!3053))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!639310 (= lt!295738 (select (store (arr!18376 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!295736 () Unit!21598)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38310 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21598)

(assert (=> b!639310 (= lt!295736 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295732 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!639310 (= lt!295732 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!639311 () Bool)

(declare-fun res!413876 () Bool)

(declare-fun e!365883 () Bool)

(assert (=> b!639311 (=> (not res!413876) (not e!365883))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38310 (_ BitVec 32)) Bool)

(assert (=> b!639311 (= res!413876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!413878 () Bool)

(assert (=> start!57808 (=> (not res!413878) (not e!365884))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57808 (= res!413878 (validMask!0 mask!3053))))

(assert (=> start!57808 e!365884))

(assert (=> start!57808 true))

(declare-fun array_inv!14172 (array!38310) Bool)

(assert (=> start!57808 (array_inv!14172 a!2986)))

(declare-fun b!639312 () Bool)

(assert (=> b!639312 (= e!365884 e!365883)))

(declare-fun res!413864 () Bool)

(assert (=> b!639312 (=> (not res!413864) (not e!365883))))

(declare-fun lt!295730 () SeekEntryResult!6816)

(assert (=> b!639312 (= res!413864 (or (= lt!295730 (MissingZero!6816 i!1108)) (= lt!295730 (MissingVacant!6816 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38310 (_ BitVec 32)) SeekEntryResult!6816)

(assert (=> b!639312 (= lt!295730 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!639313 () Bool)

(assert (=> b!639313 (= e!365879 (= lt!295727 lt!295737))))

(declare-fun b!639314 () Bool)

(declare-fun Unit!21601 () Unit!21598)

(assert (=> b!639314 (= e!365877 Unit!21601)))

(declare-fun b!639315 () Bool)

(assert (=> b!639315 (= e!365883 e!365875)))

(declare-fun res!413873 () Bool)

(assert (=> b!639315 (=> (not res!413873) (not e!365875))))

(assert (=> b!639315 (= res!413873 (= (select (store (arr!18376 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!639315 (= lt!295733 (array!38311 (store (arr!18376 a!2986) i!1108 k0!1786) (size!18740 a!2986)))))

(declare-fun b!639316 () Bool)

(declare-fun res!413863 () Bool)

(assert (=> b!639316 (=> (not res!413863) (not e!365883))))

(assert (=> b!639316 (= res!413863 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18376 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!639317 () Bool)

(declare-fun res!413868 () Bool)

(assert (=> b!639317 (=> (not res!413868) (not e!365884))))

(assert (=> b!639317 (= res!413868 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!639318 () Bool)

(declare-fun res!413874 () Bool)

(assert (=> b!639318 (=> (not res!413874) (not e!365883))))

(declare-datatypes ((List!12417 0))(
  ( (Nil!12414) (Cons!12413 (h!13458 (_ BitVec 64)) (t!18645 List!12417)) )
))
(declare-fun arrayNoDuplicates!0 (array!38310 (_ BitVec 32) List!12417) Bool)

(assert (=> b!639318 (= res!413874 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12414))))

(declare-fun b!639319 () Bool)

(assert (=> b!639319 (= e!365876 (arrayContainsKey!0 lt!295733 (select (arr!18376 a!2986) j!136) index!984))))

(declare-fun b!639320 () Bool)

(declare-fun e!365885 () Bool)

(assert (=> b!639320 (= e!365882 e!365885)))

(declare-fun res!413870 () Bool)

(assert (=> b!639320 (=> res!413870 e!365885)))

(assert (=> b!639320 (= res!413870 (or (not (= (select (arr!18376 a!2986) j!136) lt!295738)) (not (= (select (arr!18376 a!2986) j!136) lt!295735)) (bvsge j!136 index!984)))))

(assert (=> b!639320 e!365881))

(declare-fun res!413875 () Bool)

(assert (=> b!639320 (=> (not res!413875) (not e!365881))))

(assert (=> b!639320 (= res!413875 (= lt!295735 (select (arr!18376 a!2986) j!136)))))

(assert (=> b!639320 (= lt!295735 (select (store (arr!18376 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!639321 () Bool)

(assert (=> b!639321 (= e!365885 (or (bvsge (size!18740 a!2986) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (size!18740 a!2986))))))

(assert (=> b!639321 (arrayNoDuplicates!0 lt!295733 #b00000000000000000000000000000000 Nil!12414)))

(declare-fun lt!295729 () Unit!21598)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38310 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12417) Unit!21598)

(assert (=> b!639321 (= lt!295729 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12414))))

(assert (=> b!639321 (arrayContainsKey!0 lt!295733 (select (arr!18376 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295728 () Unit!21598)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38310 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21598)

(assert (=> b!639321 (= lt!295728 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295733 (select (arr!18376 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!639322 () Bool)

(declare-fun res!413867 () Bool)

(assert (=> b!639322 (=> (not res!413867) (not e!365884))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!639322 (= res!413867 (validKeyInArray!0 (select (arr!18376 a!2986) j!136)))))

(declare-fun b!639323 () Bool)

(declare-fun res!413866 () Bool)

(assert (=> b!639323 (=> (not res!413866) (not e!365884))))

(assert (=> b!639323 (= res!413866 (validKeyInArray!0 k0!1786))))

(assert (= (and start!57808 res!413878) b!639307))

(assert (= (and b!639307 res!413865) b!639322))

(assert (= (and b!639322 res!413867) b!639323))

(assert (= (and b!639323 res!413866) b!639317))

(assert (= (and b!639317 res!413868) b!639312))

(assert (= (and b!639312 res!413864) b!639311))

(assert (= (and b!639311 res!413876) b!639318))

(assert (= (and b!639318 res!413874) b!639316))

(assert (= (and b!639316 res!413863) b!639315))

(assert (= (and b!639315 res!413873) b!639306))

(assert (= (and b!639306 res!413872) b!639310))

(assert (= (and b!639310 res!413869) b!639313))

(assert (= (and b!639310 c!73088) b!639305))

(assert (= (and b!639310 (not c!73088)) b!639314))

(assert (= (and b!639310 (not res!413877)) b!639320))

(assert (= (and b!639320 res!413875) b!639308))

(assert (= (and b!639308 (not res!413871)) b!639309))

(assert (= (and b!639309 res!413879) b!639319))

(assert (= (and b!639320 (not res!413870)) b!639321))

(declare-fun m!613175 () Bool)

(assert (=> b!639317 m!613175))

(declare-fun m!613177 () Bool)

(assert (=> b!639321 m!613177))

(declare-fun m!613179 () Bool)

(assert (=> b!639321 m!613179))

(declare-fun m!613181 () Bool)

(assert (=> b!639321 m!613181))

(assert (=> b!639321 m!613179))

(declare-fun m!613183 () Bool)

(assert (=> b!639321 m!613183))

(assert (=> b!639321 m!613179))

(declare-fun m!613185 () Bool)

(assert (=> b!639321 m!613185))

(declare-fun m!613187 () Bool)

(assert (=> b!639311 m!613187))

(assert (=> b!639319 m!613179))

(assert (=> b!639319 m!613179))

(declare-fun m!613189 () Bool)

(assert (=> b!639319 m!613189))

(declare-fun m!613191 () Bool)

(assert (=> b!639312 m!613191))

(declare-fun m!613193 () Bool)

(assert (=> b!639316 m!613193))

(declare-fun m!613195 () Bool)

(assert (=> b!639306 m!613195))

(assert (=> b!639306 m!613179))

(assert (=> b!639306 m!613179))

(declare-fun m!613197 () Bool)

(assert (=> b!639306 m!613197))

(declare-fun m!613199 () Bool)

(assert (=> start!57808 m!613199))

(declare-fun m!613201 () Bool)

(assert (=> start!57808 m!613201))

(assert (=> b!639322 m!613179))

(assert (=> b!639322 m!613179))

(declare-fun m!613203 () Bool)

(assert (=> b!639322 m!613203))

(assert (=> b!639320 m!613179))

(declare-fun m!613205 () Bool)

(assert (=> b!639320 m!613205))

(declare-fun m!613207 () Bool)

(assert (=> b!639320 m!613207))

(declare-fun m!613209 () Bool)

(assert (=> b!639310 m!613209))

(declare-fun m!613211 () Bool)

(assert (=> b!639310 m!613211))

(assert (=> b!639310 m!613179))

(assert (=> b!639310 m!613205))

(assert (=> b!639310 m!613179))

(declare-fun m!613213 () Bool)

(assert (=> b!639310 m!613213))

(declare-fun m!613215 () Bool)

(assert (=> b!639310 m!613215))

(declare-fun m!613217 () Bool)

(assert (=> b!639310 m!613217))

(declare-fun m!613219 () Bool)

(assert (=> b!639310 m!613219))

(declare-fun m!613221 () Bool)

(assert (=> b!639323 m!613221))

(assert (=> b!639309 m!613179))

(assert (=> b!639309 m!613179))

(declare-fun m!613223 () Bool)

(assert (=> b!639309 m!613223))

(assert (=> b!639315 m!613205))

(declare-fun m!613225 () Bool)

(assert (=> b!639315 m!613225))

(declare-fun m!613227 () Bool)

(assert (=> b!639318 m!613227))

(assert (=> b!639308 m!613179))

(check-sat (not b!639306) (not b!639322) (not b!639311) (not b!639312) (not b!639309) (not b!639321) (not b!639318) (not b!639317) (not b!639319) (not start!57808) (not b!639323) (not b!639310))
(check-sat)
