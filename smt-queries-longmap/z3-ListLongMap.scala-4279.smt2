; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59584 () Bool)

(assert start!59584)

(declare-fun b!658299 () Bool)

(declare-fun res!426901 () Bool)

(declare-fun e!378182 () Bool)

(assert (=> b!658299 (=> (not res!426901) (not e!378182))))

(declare-datatypes ((array!38742 0))(
  ( (array!38743 (arr!18568 (Array (_ BitVec 32) (_ BitVec 64))) (size!18932 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38742)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38742 (_ BitVec 32)) Bool)

(assert (=> b!658299 (= res!426901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!658300 () Bool)

(declare-fun e!378175 () Bool)

(assert (=> b!658300 (= e!378175 e!378182)))

(declare-fun res!426908 () Bool)

(assert (=> b!658300 (=> (not res!426908) (not e!378182))))

(declare-datatypes ((SeekEntryResult!7008 0))(
  ( (MissingZero!7008 (index!30397 (_ BitVec 32))) (Found!7008 (index!30398 (_ BitVec 32))) (Intermediate!7008 (undefined!7820 Bool) (index!30399 (_ BitVec 32)) (x!59187 (_ BitVec 32))) (Undefined!7008) (MissingVacant!7008 (index!30400 (_ BitVec 32))) )
))
(declare-fun lt!307757 () SeekEntryResult!7008)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!658300 (= res!426908 (or (= lt!307757 (MissingZero!7008 i!1108)) (= lt!307757 (MissingVacant!7008 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38742 (_ BitVec 32)) SeekEntryResult!7008)

(assert (=> b!658300 (= lt!307757 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!426907 () Bool)

(assert (=> start!59584 (=> (not res!426907) (not e!378175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59584 (= res!426907 (validMask!0 mask!3053))))

(assert (=> start!59584 e!378175))

(assert (=> start!59584 true))

(declare-fun array_inv!14364 (array!38742) Bool)

(assert (=> start!59584 (array_inv!14364 a!2986)))

(declare-fun e!378176 () Bool)

(declare-fun b!658301 () Bool)

(declare-fun lt!307768 () array!38742)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38742 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!658301 (= e!378176 (arrayContainsKey!0 lt!307768 (select (arr!18568 a!2986) j!136) index!984))))

(declare-fun b!658302 () Bool)

(declare-fun res!426902 () Bool)

(assert (=> b!658302 (= res!426902 (arrayContainsKey!0 lt!307768 (select (arr!18568 a!2986) j!136) j!136))))

(declare-fun e!378178 () Bool)

(assert (=> b!658302 (=> (not res!426902) (not e!378178))))

(declare-fun e!378186 () Bool)

(assert (=> b!658302 (= e!378186 e!378178)))

(declare-fun b!658303 () Bool)

(declare-fun res!426914 () Bool)

(assert (=> b!658303 (=> (not res!426914) (not e!378175))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!658303 (= res!426914 (validKeyInArray!0 (select (arr!18568 a!2986) j!136)))))

(declare-fun b!658304 () Bool)

(declare-datatypes ((Unit!22834 0))(
  ( (Unit!22835) )
))
(declare-fun e!378177 () Unit!22834)

(declare-fun Unit!22836 () Unit!22834)

(assert (=> b!658304 (= e!378177 Unit!22836)))

(declare-fun res!426912 () Bool)

(assert (=> b!658304 (= res!426912 (= (select (store (arr!18568 a!2986) i!1108 k0!1786) index!984) (select (arr!18568 a!2986) j!136)))))

(declare-fun e!378183 () Bool)

(assert (=> b!658304 (=> (not res!426912) (not e!378183))))

(assert (=> b!658304 e!378183))

(declare-fun c!76070 () Bool)

(assert (=> b!658304 (= c!76070 (bvslt j!136 index!984))))

(declare-fun lt!307756 () Unit!22834)

(declare-fun e!378173 () Unit!22834)

(assert (=> b!658304 (= lt!307756 e!378173)))

(declare-fun c!76068 () Bool)

(assert (=> b!658304 (= c!76068 (bvslt index!984 j!136))))

(declare-fun lt!307762 () Unit!22834)

(declare-fun e!378184 () Unit!22834)

(assert (=> b!658304 (= lt!307762 e!378184)))

(assert (=> b!658304 false))

(declare-fun b!658305 () Bool)

(declare-fun e!378185 () Bool)

(assert (=> b!658305 (= e!378182 e!378185)))

(declare-fun res!426904 () Bool)

(assert (=> b!658305 (=> (not res!426904) (not e!378185))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!658305 (= res!426904 (= (select (store (arr!18568 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!658305 (= lt!307768 (array!38743 (store (arr!18568 a!2986) i!1108 k0!1786) (size!18932 a!2986)))))

(declare-fun b!658306 () Bool)

(declare-fun e!378180 () Bool)

(assert (=> b!658306 (= e!378180 (not true))))

(declare-fun lt!307755 () Unit!22834)

(assert (=> b!658306 (= lt!307755 e!378177)))

(declare-fun c!76069 () Bool)

(declare-fun lt!307754 () SeekEntryResult!7008)

(assert (=> b!658306 (= c!76069 (= lt!307754 (Found!7008 index!984)))))

(declare-fun lt!307763 () Unit!22834)

(declare-fun e!378179 () Unit!22834)

(assert (=> b!658306 (= lt!307763 e!378179)))

(declare-fun c!76067 () Bool)

(assert (=> b!658306 (= c!76067 (= lt!307754 Undefined!7008))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!307765 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38742 (_ BitVec 32)) SeekEntryResult!7008)

(assert (=> b!658306 (= lt!307754 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!307765 lt!307768 mask!3053))))

(declare-fun e!378174 () Bool)

(assert (=> b!658306 e!378174))

(declare-fun res!426910 () Bool)

(assert (=> b!658306 (=> (not res!426910) (not e!378174))))

(declare-fun lt!307749 () SeekEntryResult!7008)

(declare-fun lt!307750 () (_ BitVec 32))

(assert (=> b!658306 (= res!426910 (= lt!307749 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307750 vacantSpotIndex!68 lt!307765 lt!307768 mask!3053)))))

(assert (=> b!658306 (= lt!307749 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307750 vacantSpotIndex!68 (select (arr!18568 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!658306 (= lt!307765 (select (store (arr!18568 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!307767 () Unit!22834)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38742 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22834)

(assert (=> b!658306 (= lt!307767 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!307750 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!658306 (= lt!307750 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!658307 () Bool)

(assert (=> b!658307 (= e!378178 (arrayContainsKey!0 lt!307768 (select (arr!18568 a!2986) j!136) index!984))))

(declare-fun b!658308 () Bool)

(assert (=> b!658308 (= e!378185 e!378180)))

(declare-fun res!426899 () Bool)

(assert (=> b!658308 (=> (not res!426899) (not e!378180))))

(declare-fun lt!307761 () SeekEntryResult!7008)

(assert (=> b!658308 (= res!426899 (and (= lt!307761 (Found!7008 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18568 a!2986) index!984) (select (arr!18568 a!2986) j!136))) (not (= (select (arr!18568 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!658308 (= lt!307761 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18568 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!658309 () Bool)

(declare-fun Unit!22837 () Unit!22834)

(assert (=> b!658309 (= e!378179 Unit!22837)))

(assert (=> b!658309 false))

(declare-fun b!658310 () Bool)

(declare-fun Unit!22838 () Unit!22834)

(assert (=> b!658310 (= e!378184 Unit!22838)))

(declare-fun b!658311 () Bool)

(assert (=> b!658311 false))

(declare-fun lt!307751 () Unit!22834)

(declare-datatypes ((List!12609 0))(
  ( (Nil!12606) (Cons!12605 (h!13650 (_ BitVec 64)) (t!18837 List!12609)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38742 (_ BitVec 64) (_ BitVec 32) List!12609) Unit!22834)

(assert (=> b!658311 (= lt!307751 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307768 (select (arr!18568 a!2986) j!136) j!136 Nil!12606))))

(declare-fun arrayNoDuplicates!0 (array!38742 (_ BitVec 32) List!12609) Bool)

(assert (=> b!658311 (arrayNoDuplicates!0 lt!307768 j!136 Nil!12606)))

(declare-fun lt!307760 () Unit!22834)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38742 (_ BitVec 32) (_ BitVec 32)) Unit!22834)

(assert (=> b!658311 (= lt!307760 (lemmaNoDuplicateFromThenFromBigger!0 lt!307768 #b00000000000000000000000000000000 j!136))))

(assert (=> b!658311 (arrayNoDuplicates!0 lt!307768 #b00000000000000000000000000000000 Nil!12606)))

(declare-fun lt!307759 () Unit!22834)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38742 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12609) Unit!22834)

(assert (=> b!658311 (= lt!307759 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12606))))

(assert (=> b!658311 (arrayContainsKey!0 lt!307768 (select (arr!18568 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!307752 () Unit!22834)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38742 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22834)

(assert (=> b!658311 (= lt!307752 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307768 (select (arr!18568 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22839 () Unit!22834)

(assert (=> b!658311 (= e!378173 Unit!22839)))

(declare-fun b!658312 () Bool)

(declare-fun Unit!22840 () Unit!22834)

(assert (=> b!658312 (= e!378173 Unit!22840)))

(declare-fun b!658313 () Bool)

(assert (=> b!658313 false))

(declare-fun lt!307766 () Unit!22834)

(assert (=> b!658313 (= lt!307766 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307768 (select (arr!18568 a!2986) j!136) index!984 Nil!12606))))

(assert (=> b!658313 (arrayNoDuplicates!0 lt!307768 index!984 Nil!12606)))

(declare-fun lt!307758 () Unit!22834)

(assert (=> b!658313 (= lt!307758 (lemmaNoDuplicateFromThenFromBigger!0 lt!307768 #b00000000000000000000000000000000 index!984))))

(assert (=> b!658313 (arrayNoDuplicates!0 lt!307768 #b00000000000000000000000000000000 Nil!12606)))

(declare-fun lt!307753 () Unit!22834)

(assert (=> b!658313 (= lt!307753 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12606))))

(assert (=> b!658313 (arrayContainsKey!0 lt!307768 (select (arr!18568 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!307764 () Unit!22834)

(assert (=> b!658313 (= lt!307764 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307768 (select (arr!18568 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!658313 e!378176))

(declare-fun res!426905 () Bool)

(assert (=> b!658313 (=> (not res!426905) (not e!378176))))

(assert (=> b!658313 (= res!426905 (arrayContainsKey!0 lt!307768 (select (arr!18568 a!2986) j!136) j!136))))

(declare-fun Unit!22841 () Unit!22834)

(assert (=> b!658313 (= e!378184 Unit!22841)))

(declare-fun b!658314 () Bool)

(declare-fun Unit!22842 () Unit!22834)

(assert (=> b!658314 (= e!378179 Unit!22842)))

(declare-fun b!658315 () Bool)

(declare-fun res!426913 () Bool)

(assert (=> b!658315 (=> (not res!426913) (not e!378182))))

(assert (=> b!658315 (= res!426913 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12606))))

(declare-fun b!658316 () Bool)

(declare-fun res!426909 () Bool)

(assert (=> b!658316 (=> (not res!426909) (not e!378175))))

(assert (=> b!658316 (= res!426909 (and (= (size!18932 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18932 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18932 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!658317 () Bool)

(declare-fun res!426903 () Bool)

(assert (=> b!658317 (= res!426903 (bvsge j!136 index!984))))

(assert (=> b!658317 (=> res!426903 e!378186)))

(assert (=> b!658317 (= e!378183 e!378186)))

(declare-fun b!658318 () Bool)

(declare-fun res!426906 () Bool)

(assert (=> b!658318 (=> (not res!426906) (not e!378175))))

(assert (=> b!658318 (= res!426906 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!658319 () Bool)

(declare-fun res!426900 () Bool)

(assert (=> b!658319 (=> (not res!426900) (not e!378175))))

(assert (=> b!658319 (= res!426900 (validKeyInArray!0 k0!1786))))

(declare-fun b!658320 () Bool)

(assert (=> b!658320 (= e!378174 (= lt!307761 lt!307749))))

(declare-fun b!658321 () Bool)

(declare-fun Unit!22843 () Unit!22834)

(assert (=> b!658321 (= e!378177 Unit!22843)))

(declare-fun b!658322 () Bool)

(declare-fun res!426911 () Bool)

(assert (=> b!658322 (=> (not res!426911) (not e!378182))))

(assert (=> b!658322 (= res!426911 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18568 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59584 res!426907) b!658316))

(assert (= (and b!658316 res!426909) b!658303))

(assert (= (and b!658303 res!426914) b!658319))

(assert (= (and b!658319 res!426900) b!658318))

(assert (= (and b!658318 res!426906) b!658300))

(assert (= (and b!658300 res!426908) b!658299))

(assert (= (and b!658299 res!426901) b!658315))

(assert (= (and b!658315 res!426913) b!658322))

(assert (= (and b!658322 res!426911) b!658305))

(assert (= (and b!658305 res!426904) b!658308))

(assert (= (and b!658308 res!426899) b!658306))

(assert (= (and b!658306 res!426910) b!658320))

(assert (= (and b!658306 c!76067) b!658309))

(assert (= (and b!658306 (not c!76067)) b!658314))

(assert (= (and b!658306 c!76069) b!658304))

(assert (= (and b!658306 (not c!76069)) b!658321))

(assert (= (and b!658304 res!426912) b!658317))

(assert (= (and b!658317 (not res!426903)) b!658302))

(assert (= (and b!658302 res!426902) b!658307))

(assert (= (and b!658304 c!76070) b!658311))

(assert (= (and b!658304 (not c!76070)) b!658312))

(assert (= (and b!658304 c!76068) b!658313))

(assert (= (and b!658304 (not c!76068)) b!658310))

(assert (= (and b!658313 res!426905) b!658301))

(declare-fun m!631287 () Bool)

(assert (=> b!658303 m!631287))

(assert (=> b!658303 m!631287))

(declare-fun m!631289 () Bool)

(assert (=> b!658303 m!631289))

(assert (=> b!658302 m!631287))

(assert (=> b!658302 m!631287))

(declare-fun m!631291 () Bool)

(assert (=> b!658302 m!631291))

(declare-fun m!631293 () Bool)

(assert (=> b!658300 m!631293))

(declare-fun m!631295 () Bool)

(assert (=> b!658318 m!631295))

(declare-fun m!631297 () Bool)

(assert (=> b!658322 m!631297))

(declare-fun m!631299 () Bool)

(assert (=> b!658305 m!631299))

(declare-fun m!631301 () Bool)

(assert (=> b!658305 m!631301))

(assert (=> b!658301 m!631287))

(assert (=> b!658301 m!631287))

(declare-fun m!631303 () Bool)

(assert (=> b!658301 m!631303))

(assert (=> b!658304 m!631299))

(declare-fun m!631305 () Bool)

(assert (=> b!658304 m!631305))

(assert (=> b!658304 m!631287))

(declare-fun m!631307 () Bool)

(assert (=> b!658306 m!631307))

(declare-fun m!631309 () Bool)

(assert (=> b!658306 m!631309))

(assert (=> b!658306 m!631287))

(assert (=> b!658306 m!631299))

(declare-fun m!631311 () Bool)

(assert (=> b!658306 m!631311))

(declare-fun m!631313 () Bool)

(assert (=> b!658306 m!631313))

(declare-fun m!631315 () Bool)

(assert (=> b!658306 m!631315))

(assert (=> b!658306 m!631287))

(declare-fun m!631317 () Bool)

(assert (=> b!658306 m!631317))

(declare-fun m!631319 () Bool)

(assert (=> b!658315 m!631319))

(declare-fun m!631321 () Bool)

(assert (=> b!658308 m!631321))

(assert (=> b!658308 m!631287))

(assert (=> b!658308 m!631287))

(declare-fun m!631323 () Bool)

(assert (=> b!658308 m!631323))

(declare-fun m!631325 () Bool)

(assert (=> b!658299 m!631325))

(declare-fun m!631327 () Bool)

(assert (=> b!658311 m!631327))

(assert (=> b!658311 m!631287))

(declare-fun m!631329 () Bool)

(assert (=> b!658311 m!631329))

(assert (=> b!658311 m!631287))

(declare-fun m!631331 () Bool)

(assert (=> b!658311 m!631331))

(declare-fun m!631333 () Bool)

(assert (=> b!658311 m!631333))

(assert (=> b!658311 m!631287))

(declare-fun m!631335 () Bool)

(assert (=> b!658311 m!631335))

(assert (=> b!658311 m!631287))

(declare-fun m!631337 () Bool)

(assert (=> b!658311 m!631337))

(declare-fun m!631339 () Bool)

(assert (=> b!658311 m!631339))

(declare-fun m!631341 () Bool)

(assert (=> b!658319 m!631341))

(declare-fun m!631343 () Bool)

(assert (=> b!658313 m!631343))

(assert (=> b!658313 m!631287))

(assert (=> b!658313 m!631287))

(assert (=> b!658313 m!631291))

(assert (=> b!658313 m!631287))

(declare-fun m!631345 () Bool)

(assert (=> b!658313 m!631345))

(assert (=> b!658313 m!631333))

(assert (=> b!658313 m!631287))

(declare-fun m!631347 () Bool)

(assert (=> b!658313 m!631347))

(assert (=> b!658313 m!631287))

(declare-fun m!631349 () Bool)

(assert (=> b!658313 m!631349))

(declare-fun m!631351 () Bool)

(assert (=> b!658313 m!631351))

(assert (=> b!658313 m!631339))

(declare-fun m!631353 () Bool)

(assert (=> start!59584 m!631353))

(declare-fun m!631355 () Bool)

(assert (=> start!59584 m!631355))

(assert (=> b!658307 m!631287))

(assert (=> b!658307 m!631287))

(assert (=> b!658307 m!631303))

(check-sat (not b!658299) (not b!658318) (not b!658315) (not start!59584) (not b!658313) (not b!658301) (not b!658308) (not b!658319) (not b!658311) (not b!658307) (not b!658300) (not b!658306) (not b!658302) (not b!658303))
(check-sat)
