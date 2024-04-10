; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58444 () Bool)

(assert start!58444)

(declare-fun b!645505 () Bool)

(declare-fun e!369941 () Bool)

(declare-fun e!369931 () Bool)

(assert (=> b!645505 (= e!369941 e!369931)))

(declare-fun res!418243 () Bool)

(assert (=> b!645505 (=> (not res!418243) (not e!369931))))

(declare-datatypes ((SeekEntryResult!6882 0))(
  ( (MissingZero!6882 (index!29863 (_ BitVec 32))) (Found!6882 (index!29864 (_ BitVec 32))) (Intermediate!6882 (undefined!7694 Bool) (index!29865 (_ BitVec 32)) (x!58635 (_ BitVec 32))) (Undefined!6882) (MissingVacant!6882 (index!29866 (_ BitVec 32))) )
))
(declare-fun lt!299354 () SeekEntryResult!6882)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!645505 (= res!418243 (or (= lt!299354 (MissingZero!6882 i!1108)) (= lt!299354 (MissingVacant!6882 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!38460 0))(
  ( (array!38461 (arr!18442 (Array (_ BitVec 32) (_ BitVec 64))) (size!18806 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38460)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38460 (_ BitVec 32)) SeekEntryResult!6882)

(assert (=> b!645505 (= lt!299354 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!369940 () Bool)

(declare-fun lt!299349 () array!38460)

(declare-fun b!645506 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38460 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!645506 (= e!369940 (arrayContainsKey!0 lt!299349 (select (arr!18442 a!2986) j!136) index!984))))

(declare-fun b!645507 () Bool)

(declare-datatypes ((Unit!21918 0))(
  ( (Unit!21919) )
))
(declare-fun e!369932 () Unit!21918)

(declare-fun Unit!21920 () Unit!21918)

(assert (=> b!645507 (= e!369932 Unit!21920)))

(assert (=> b!645507 false))

(declare-fun b!645508 () Bool)

(declare-fun e!369938 () Bool)

(declare-fun e!369935 () Bool)

(assert (=> b!645508 (= e!369938 e!369935)))

(declare-fun res!418246 () Bool)

(assert (=> b!645508 (=> res!418246 e!369935)))

(declare-fun lt!299348 () (_ BitVec 64))

(declare-fun lt!299355 () (_ BitVec 64))

(assert (=> b!645508 (= res!418246 (or (not (= (select (arr!18442 a!2986) j!136) lt!299348)) (not (= (select (arr!18442 a!2986) j!136) lt!299355))))))

(declare-fun e!369937 () Bool)

(assert (=> b!645508 e!369937))

(declare-fun res!418239 () Bool)

(assert (=> b!645508 (=> (not res!418239) (not e!369937))))

(assert (=> b!645508 (= res!418239 (= lt!299355 (select (arr!18442 a!2986) j!136)))))

(assert (=> b!645508 (= lt!299355 (select (store (arr!18442 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!645509 () Bool)

(declare-fun res!418235 () Bool)

(assert (=> b!645509 (=> (not res!418235) (not e!369941))))

(assert (=> b!645509 (= res!418235 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!645510 () Bool)

(declare-fun res!418240 () Bool)

(assert (=> b!645510 (=> (not res!418240) (not e!369931))))

(declare-datatypes ((List!12483 0))(
  ( (Nil!12480) (Cons!12479 (h!13524 (_ BitVec 64)) (t!18711 List!12483)) )
))
(declare-fun arrayNoDuplicates!0 (array!38460 (_ BitVec 32) List!12483) Bool)

(assert (=> b!645510 (= res!418240 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12480))))

(declare-fun b!645511 () Bool)

(declare-fun e!369939 () Bool)

(assert (=> b!645511 (= e!369939 (not e!369938))))

(declare-fun res!418245 () Bool)

(assert (=> b!645511 (=> res!418245 e!369938)))

(declare-fun lt!299346 () SeekEntryResult!6882)

(assert (=> b!645511 (= res!418245 (not (= lt!299346 (Found!6882 index!984))))))

(declare-fun lt!299343 () Unit!21918)

(assert (=> b!645511 (= lt!299343 e!369932)))

(declare-fun c!74002 () Bool)

(assert (=> b!645511 (= c!74002 (= lt!299346 Undefined!6882))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38460 (_ BitVec 32)) SeekEntryResult!6882)

(assert (=> b!645511 (= lt!299346 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!299348 lt!299349 mask!3053))))

(declare-fun e!369933 () Bool)

(assert (=> b!645511 e!369933))

(declare-fun res!418251 () Bool)

(assert (=> b!645511 (=> (not res!418251) (not e!369933))))

(declare-fun lt!299351 () (_ BitVec 32))

(declare-fun lt!299345 () SeekEntryResult!6882)

(assert (=> b!645511 (= res!418251 (= lt!299345 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299351 vacantSpotIndex!68 lt!299348 lt!299349 mask!3053)))))

(assert (=> b!645511 (= lt!299345 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299351 vacantSpotIndex!68 (select (arr!18442 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!645511 (= lt!299348 (select (store (arr!18442 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!299347 () Unit!21918)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38460 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21918)

(assert (=> b!645511 (= lt!299347 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299351 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!645511 (= lt!299351 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!645512 () Bool)

(declare-fun res!418247 () Bool)

(assert (=> b!645512 (=> (not res!418247) (not e!369931))))

(assert (=> b!645512 (= res!418247 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18442 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!645513 () Bool)

(declare-fun res!418253 () Bool)

(assert (=> b!645513 (=> (not res!418253) (not e!369931))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38460 (_ BitVec 32)) Bool)

(assert (=> b!645513 (= res!418253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!645514 () Bool)

(declare-fun e!369934 () Unit!21918)

(declare-fun Unit!21921 () Unit!21918)

(assert (=> b!645514 (= e!369934 Unit!21921)))

(declare-fun res!418236 () Bool)

(assert (=> start!58444 (=> (not res!418236) (not e!369941))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58444 (= res!418236 (validMask!0 mask!3053))))

(assert (=> start!58444 e!369941))

(assert (=> start!58444 true))

(declare-fun array_inv!14238 (array!38460) Bool)

(assert (=> start!58444 (array_inv!14238 a!2986)))

(declare-fun b!645515 () Bool)

(declare-fun e!369928 () Bool)

(assert (=> b!645515 (= e!369928 (arrayContainsKey!0 lt!299349 (select (arr!18442 a!2986) j!136) index!984))))

(declare-fun b!645516 () Bool)

(declare-fun e!369929 () Bool)

(assert (=> b!645516 (= e!369935 e!369929)))

(declare-fun res!418252 () Bool)

(assert (=> b!645516 (=> res!418252 e!369929)))

(assert (=> b!645516 (= res!418252 (bvsge index!984 j!136))))

(declare-fun lt!299344 () Unit!21918)

(assert (=> b!645516 (= lt!299344 e!369934)))

(declare-fun c!74003 () Bool)

(assert (=> b!645516 (= c!74003 (bvslt j!136 index!984))))

(declare-fun b!645517 () Bool)

(declare-fun e!369942 () Bool)

(assert (=> b!645517 (= e!369937 e!369942)))

(declare-fun res!418242 () Bool)

(assert (=> b!645517 (=> res!418242 e!369942)))

(assert (=> b!645517 (= res!418242 (or (not (= (select (arr!18442 a!2986) j!136) lt!299348)) (not (= (select (arr!18442 a!2986) j!136) lt!299355)) (bvsge j!136 index!984)))))

(declare-fun b!645518 () Bool)

(declare-fun Unit!21922 () Unit!21918)

(assert (=> b!645518 (= e!369934 Unit!21922)))

(declare-fun lt!299341 () Unit!21918)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38460 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21918)

(assert (=> b!645518 (= lt!299341 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299349 (select (arr!18442 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!645518 (arrayContainsKey!0 lt!299349 (select (arr!18442 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!299352 () Unit!21918)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38460 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12483) Unit!21918)

(assert (=> b!645518 (= lt!299352 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12480))))

(assert (=> b!645518 (arrayNoDuplicates!0 lt!299349 #b00000000000000000000000000000000 Nil!12480)))

(declare-fun lt!299342 () Unit!21918)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38460 (_ BitVec 32) (_ BitVec 32)) Unit!21918)

(assert (=> b!645518 (= lt!299342 (lemmaNoDuplicateFromThenFromBigger!0 lt!299349 #b00000000000000000000000000000000 j!136))))

(assert (=> b!645518 (arrayNoDuplicates!0 lt!299349 j!136 Nil!12480)))

(declare-fun lt!299356 () Unit!21918)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38460 (_ BitVec 64) (_ BitVec 32) List!12483) Unit!21918)

(assert (=> b!645518 (= lt!299356 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!299349 (select (arr!18442 a!2986) j!136) j!136 Nil!12480))))

(assert (=> b!645518 false))

(declare-fun b!645519 () Bool)

(declare-fun e!369930 () Bool)

(assert (=> b!645519 (= e!369930 e!369939)))

(declare-fun res!418238 () Bool)

(assert (=> b!645519 (=> (not res!418238) (not e!369939))))

(declare-fun lt!299350 () SeekEntryResult!6882)

(assert (=> b!645519 (= res!418238 (and (= lt!299350 (Found!6882 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18442 a!2986) index!984) (select (arr!18442 a!2986) j!136))) (not (= (select (arr!18442 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!645519 (= lt!299350 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18442 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!645520 () Bool)

(declare-fun res!418244 () Bool)

(assert (=> b!645520 (=> (not res!418244) (not e!369941))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!645520 (= res!418244 (validKeyInArray!0 (select (arr!18442 a!2986) j!136)))))

(declare-fun b!645521 () Bool)

(declare-fun Unit!21923 () Unit!21918)

(assert (=> b!645521 (= e!369932 Unit!21923)))

(declare-fun b!645522 () Bool)

(assert (=> b!645522 (= e!369931 e!369930)))

(declare-fun res!418248 () Bool)

(assert (=> b!645522 (=> (not res!418248) (not e!369930))))

(assert (=> b!645522 (= res!418248 (= (select (store (arr!18442 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!645522 (= lt!299349 (array!38461 (store (arr!18442 a!2986) i!1108 k0!1786) (size!18806 a!2986)))))

(declare-fun b!645523 () Bool)

(assert (=> b!645523 (= e!369929 true)))

(assert (=> b!645523 (arrayContainsKey!0 lt!299349 (select (arr!18442 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!299353 () Unit!21918)

(assert (=> b!645523 (= lt!299353 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299349 (select (arr!18442 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!645523 e!369928))

(declare-fun res!418237 () Bool)

(assert (=> b!645523 (=> (not res!418237) (not e!369928))))

(assert (=> b!645523 (= res!418237 (arrayContainsKey!0 lt!299349 (select (arr!18442 a!2986) j!136) j!136))))

(declare-fun b!645524 () Bool)

(declare-fun res!418250 () Bool)

(assert (=> b!645524 (=> (not res!418250) (not e!369941))))

(assert (=> b!645524 (= res!418250 (validKeyInArray!0 k0!1786))))

(declare-fun b!645525 () Bool)

(assert (=> b!645525 (= e!369942 e!369940)))

(declare-fun res!418249 () Bool)

(assert (=> b!645525 (=> (not res!418249) (not e!369940))))

(assert (=> b!645525 (= res!418249 (arrayContainsKey!0 lt!299349 (select (arr!18442 a!2986) j!136) j!136))))

(declare-fun b!645526 () Bool)

(assert (=> b!645526 (= e!369933 (= lt!299350 lt!299345))))

(declare-fun b!645527 () Bool)

(declare-fun res!418241 () Bool)

(assert (=> b!645527 (=> (not res!418241) (not e!369941))))

(assert (=> b!645527 (= res!418241 (and (= (size!18806 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18806 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18806 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!58444 res!418236) b!645527))

(assert (= (and b!645527 res!418241) b!645520))

(assert (= (and b!645520 res!418244) b!645524))

(assert (= (and b!645524 res!418250) b!645509))

(assert (= (and b!645509 res!418235) b!645505))

(assert (= (and b!645505 res!418243) b!645513))

(assert (= (and b!645513 res!418253) b!645510))

(assert (= (and b!645510 res!418240) b!645512))

(assert (= (and b!645512 res!418247) b!645522))

(assert (= (and b!645522 res!418248) b!645519))

(assert (= (and b!645519 res!418238) b!645511))

(assert (= (and b!645511 res!418251) b!645526))

(assert (= (and b!645511 c!74002) b!645507))

(assert (= (and b!645511 (not c!74002)) b!645521))

(assert (= (and b!645511 (not res!418245)) b!645508))

(assert (= (and b!645508 res!418239) b!645517))

(assert (= (and b!645517 (not res!418242)) b!645525))

(assert (= (and b!645525 res!418249) b!645506))

(assert (= (and b!645508 (not res!418246)) b!645516))

(assert (= (and b!645516 c!74003) b!645518))

(assert (= (and b!645516 (not c!74003)) b!645514))

(assert (= (and b!645516 (not res!418252)) b!645523))

(assert (= (and b!645523 res!418237) b!645515))

(declare-fun m!619017 () Bool)

(assert (=> b!645517 m!619017))

(declare-fun m!619019 () Bool)

(assert (=> b!645524 m!619019))

(assert (=> b!645506 m!619017))

(assert (=> b!645506 m!619017))

(declare-fun m!619021 () Bool)

(assert (=> b!645506 m!619021))

(declare-fun m!619023 () Bool)

(assert (=> b!645519 m!619023))

(assert (=> b!645519 m!619017))

(assert (=> b!645519 m!619017))

(declare-fun m!619025 () Bool)

(assert (=> b!645519 m!619025))

(declare-fun m!619027 () Bool)

(assert (=> b!645512 m!619027))

(assert (=> b!645508 m!619017))

(declare-fun m!619029 () Bool)

(assert (=> b!645508 m!619029))

(declare-fun m!619031 () Bool)

(assert (=> b!645508 m!619031))

(assert (=> b!645525 m!619017))

(assert (=> b!645525 m!619017))

(declare-fun m!619033 () Bool)

(assert (=> b!645525 m!619033))

(declare-fun m!619035 () Bool)

(assert (=> b!645510 m!619035))

(assert (=> b!645522 m!619029))

(declare-fun m!619037 () Bool)

(assert (=> b!645522 m!619037))

(assert (=> b!645518 m!619017))

(declare-fun m!619039 () Bool)

(assert (=> b!645518 m!619039))

(assert (=> b!645518 m!619017))

(declare-fun m!619041 () Bool)

(assert (=> b!645518 m!619041))

(assert (=> b!645518 m!619017))

(declare-fun m!619043 () Bool)

(assert (=> b!645518 m!619043))

(declare-fun m!619045 () Bool)

(assert (=> b!645518 m!619045))

(declare-fun m!619047 () Bool)

(assert (=> b!645518 m!619047))

(declare-fun m!619049 () Bool)

(assert (=> b!645518 m!619049))

(assert (=> b!645518 m!619017))

(declare-fun m!619051 () Bool)

(assert (=> b!645518 m!619051))

(assert (=> b!645515 m!619017))

(assert (=> b!645515 m!619017))

(assert (=> b!645515 m!619021))

(assert (=> b!645520 m!619017))

(assert (=> b!645520 m!619017))

(declare-fun m!619053 () Bool)

(assert (=> b!645520 m!619053))

(declare-fun m!619055 () Bool)

(assert (=> b!645505 m!619055))

(assert (=> b!645523 m!619017))

(assert (=> b!645523 m!619017))

(declare-fun m!619057 () Bool)

(assert (=> b!645523 m!619057))

(assert (=> b!645523 m!619017))

(declare-fun m!619059 () Bool)

(assert (=> b!645523 m!619059))

(assert (=> b!645523 m!619017))

(assert (=> b!645523 m!619033))

(declare-fun m!619061 () Bool)

(assert (=> start!58444 m!619061))

(declare-fun m!619063 () Bool)

(assert (=> start!58444 m!619063))

(declare-fun m!619065 () Bool)

(assert (=> b!645513 m!619065))

(declare-fun m!619067 () Bool)

(assert (=> b!645509 m!619067))

(declare-fun m!619069 () Bool)

(assert (=> b!645511 m!619069))

(declare-fun m!619071 () Bool)

(assert (=> b!645511 m!619071))

(assert (=> b!645511 m!619017))

(assert (=> b!645511 m!619017))

(declare-fun m!619073 () Bool)

(assert (=> b!645511 m!619073))

(declare-fun m!619075 () Bool)

(assert (=> b!645511 m!619075))

(declare-fun m!619077 () Bool)

(assert (=> b!645511 m!619077))

(declare-fun m!619079 () Bool)

(assert (=> b!645511 m!619079))

(assert (=> b!645511 m!619029))

(check-sat (not b!645520) (not b!645525) (not b!645513) (not b!645505) (not b!645524) (not start!58444) (not b!645518) (not b!645511) (not b!645510) (not b!645515) (not b!645519) (not b!645506) (not b!645509) (not b!645523))
(check-sat)
