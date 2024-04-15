; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58010 () Bool)

(assert start!58010)

(declare-fun b!641178 () Bool)

(declare-fun e!367107 () Bool)

(declare-fun e!367106 () Bool)

(assert (=> b!641178 (= e!367107 e!367106)))

(declare-fun res!415336 () Bool)

(assert (=> b!641178 (=> res!415336 e!367106)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!296742 () (_ BitVec 64))

(declare-fun lt!296734 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38367 0))(
  ( (array!38368 (arr!18401 (Array (_ BitVec 32) (_ BitVec 64))) (size!18766 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38367)

(assert (=> b!641178 (= res!415336 (or (not (= (select (arr!18401 a!2986) j!136) lt!296742)) (not (= (select (arr!18401 a!2986) j!136) lt!296734)) (bvsge j!136 index!984)))))

(declare-fun e!367102 () Bool)

(assert (=> b!641178 e!367102))

(declare-fun res!415328 () Bool)

(assert (=> b!641178 (=> (not res!415328) (not e!367102))))

(assert (=> b!641178 (= res!415328 (= lt!296734 (select (arr!18401 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!641178 (= lt!296734 (select (store (arr!18401 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!641179 () Bool)

(declare-datatypes ((Unit!21680 0))(
  ( (Unit!21681) )
))
(declare-fun e!367104 () Unit!21680)

(declare-fun Unit!21682 () Unit!21680)

(assert (=> b!641179 (= e!367104 Unit!21682)))

(declare-fun b!641180 () Bool)

(declare-fun e!367101 () Bool)

(declare-fun e!367096 () Bool)

(assert (=> b!641180 (= e!367101 e!367096)))

(declare-fun res!415326 () Bool)

(assert (=> b!641180 (=> (not res!415326) (not e!367096))))

(declare-fun lt!296738 () array!38367)

(declare-fun arrayContainsKey!0 (array!38367 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!641180 (= res!415326 (arrayContainsKey!0 lt!296738 (select (arr!18401 a!2986) j!136) j!136))))

(declare-fun b!641181 () Bool)

(declare-fun res!415334 () Bool)

(declare-fun e!367105 () Bool)

(assert (=> b!641181 (=> (not res!415334) (not e!367105))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!641181 (= res!415334 (validKeyInArray!0 (select (arr!18401 a!2986) j!136)))))

(declare-fun b!641182 () Bool)

(declare-fun e!367109 () Bool)

(declare-fun e!367098 () Bool)

(assert (=> b!641182 (= e!367109 e!367098)))

(declare-fun res!415323 () Bool)

(assert (=> b!641182 (=> (not res!415323) (not e!367098))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!641182 (= res!415323 (= (select (store (arr!18401 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!641182 (= lt!296738 (array!38368 (store (arr!18401 a!2986) i!1108 k0!1786) (size!18766 a!2986)))))

(declare-fun b!641183 () Bool)

(declare-fun res!415327 () Bool)

(assert (=> b!641183 (=> (not res!415327) (not e!367105))))

(assert (=> b!641183 (= res!415327 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!641184 () Bool)

(declare-fun e!367099 () Bool)

(declare-fun e!367108 () Bool)

(assert (=> b!641184 (= e!367099 e!367108)))

(declare-fun res!415321 () Bool)

(assert (=> b!641184 (=> (not res!415321) (not e!367108))))

(declare-datatypes ((List!12481 0))(
  ( (Nil!12478) (Cons!12477 (h!13522 (_ BitVec 64)) (t!18700 List!12481)) )
))
(declare-fun contains!3114 (List!12481 (_ BitVec 64)) Bool)

(assert (=> b!641184 (= res!415321 (not (contains!3114 Nil!12478 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!641185 () Bool)

(declare-fun Unit!21683 () Unit!21680)

(assert (=> b!641185 (= e!367104 Unit!21683)))

(assert (=> b!641185 false))

(declare-fun b!641186 () Bool)

(assert (=> b!641186 (= e!367106 e!367099)))

(declare-fun res!415322 () Bool)

(assert (=> b!641186 (=> res!415322 e!367099)))

(assert (=> b!641186 (= res!415322 (or (bvsge (size!18766 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18766 a!2986))))))

(declare-fun arrayNoDuplicates!0 (array!38367 (_ BitVec 32) List!12481) Bool)

(assert (=> b!641186 (arrayNoDuplicates!0 lt!296738 j!136 Nil!12478)))

(declare-fun lt!296739 () Unit!21680)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38367 (_ BitVec 32) (_ BitVec 32)) Unit!21680)

(assert (=> b!641186 (= lt!296739 (lemmaNoDuplicateFromThenFromBigger!0 lt!296738 #b00000000000000000000000000000000 j!136))))

(assert (=> b!641186 (arrayNoDuplicates!0 lt!296738 #b00000000000000000000000000000000 Nil!12478)))

(declare-fun lt!296741 () Unit!21680)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38367 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12481) Unit!21680)

(assert (=> b!641186 (= lt!296741 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12478))))

(assert (=> b!641186 (arrayContainsKey!0 lt!296738 (select (arr!18401 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296733 () Unit!21680)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38367 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21680)

(assert (=> b!641186 (= lt!296733 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296738 (select (arr!18401 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!641187 () Bool)

(declare-fun e!367097 () Bool)

(assert (=> b!641187 (= e!367097 (not e!367107))))

(declare-fun res!415332 () Bool)

(assert (=> b!641187 (=> res!415332 e!367107)))

(declare-datatypes ((SeekEntryResult!6838 0))(
  ( (MissingZero!6838 (index!29675 (_ BitVec 32))) (Found!6838 (index!29676 (_ BitVec 32))) (Intermediate!6838 (undefined!7650 Bool) (index!29677 (_ BitVec 32)) (x!58446 (_ BitVec 32))) (Undefined!6838) (MissingVacant!6838 (index!29678 (_ BitVec 32))) )
))
(declare-fun lt!296744 () SeekEntryResult!6838)

(assert (=> b!641187 (= res!415332 (not (= lt!296744 (Found!6838 index!984))))))

(declare-fun lt!296745 () Unit!21680)

(assert (=> b!641187 (= lt!296745 e!367104)))

(declare-fun c!73296 () Bool)

(assert (=> b!641187 (= c!73296 (= lt!296744 Undefined!6838))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38367 (_ BitVec 32)) SeekEntryResult!6838)

(assert (=> b!641187 (= lt!296744 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296742 lt!296738 mask!3053))))

(declare-fun e!367103 () Bool)

(assert (=> b!641187 e!367103))

(declare-fun res!415338 () Bool)

(assert (=> b!641187 (=> (not res!415338) (not e!367103))))

(declare-fun lt!296737 () SeekEntryResult!6838)

(declare-fun lt!296736 () (_ BitVec 32))

(assert (=> b!641187 (= res!415338 (= lt!296737 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296736 vacantSpotIndex!68 lt!296742 lt!296738 mask!3053)))))

(assert (=> b!641187 (= lt!296737 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296736 vacantSpotIndex!68 (select (arr!18401 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!641187 (= lt!296742 (select (store (arr!18401 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!296740 () Unit!21680)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38367 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21680)

(assert (=> b!641187 (= lt!296740 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296736 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!641187 (= lt!296736 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!641188 () Bool)

(assert (=> b!641188 (= e!367108 (not (contains!3114 Nil!12478 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!641189 () Bool)

(declare-fun lt!296735 () SeekEntryResult!6838)

(assert (=> b!641189 (= e!367103 (= lt!296735 lt!296737))))

(declare-fun res!415324 () Bool)

(assert (=> start!58010 (=> (not res!415324) (not e!367105))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58010 (= res!415324 (validMask!0 mask!3053))))

(assert (=> start!58010 e!367105))

(assert (=> start!58010 true))

(declare-fun array_inv!14284 (array!38367) Bool)

(assert (=> start!58010 (array_inv!14284 a!2986)))

(declare-fun b!641190 () Bool)

(assert (=> b!641190 (= e!367096 (arrayContainsKey!0 lt!296738 (select (arr!18401 a!2986) j!136) index!984))))

(declare-fun b!641191 () Bool)

(declare-fun res!415331 () Bool)

(assert (=> b!641191 (=> (not res!415331) (not e!367105))))

(assert (=> b!641191 (= res!415331 (validKeyInArray!0 k0!1786))))

(declare-fun b!641192 () Bool)

(declare-fun res!415325 () Bool)

(assert (=> b!641192 (=> (not res!415325) (not e!367109))))

(assert (=> b!641192 (= res!415325 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12478))))

(declare-fun b!641193 () Bool)

(declare-fun res!415339 () Bool)

(assert (=> b!641193 (=> res!415339 e!367099)))

(declare-fun noDuplicate!407 (List!12481) Bool)

(assert (=> b!641193 (= res!415339 (not (noDuplicate!407 Nil!12478)))))

(declare-fun b!641194 () Bool)

(declare-fun res!415329 () Bool)

(assert (=> b!641194 (=> (not res!415329) (not e!367105))))

(assert (=> b!641194 (= res!415329 (and (= (size!18766 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18766 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18766 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!641195 () Bool)

(assert (=> b!641195 (= e!367102 e!367101)))

(declare-fun res!415333 () Bool)

(assert (=> b!641195 (=> res!415333 e!367101)))

(assert (=> b!641195 (= res!415333 (or (not (= (select (arr!18401 a!2986) j!136) lt!296742)) (not (= (select (arr!18401 a!2986) j!136) lt!296734)) (bvsge j!136 index!984)))))

(declare-fun b!641196 () Bool)

(declare-fun res!415337 () Bool)

(assert (=> b!641196 (=> (not res!415337) (not e!367109))))

(assert (=> b!641196 (= res!415337 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18401 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!641197 () Bool)

(assert (=> b!641197 (= e!367098 e!367097)))

(declare-fun res!415320 () Bool)

(assert (=> b!641197 (=> (not res!415320) (not e!367097))))

(assert (=> b!641197 (= res!415320 (and (= lt!296735 (Found!6838 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18401 a!2986) index!984) (select (arr!18401 a!2986) j!136))) (not (= (select (arr!18401 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!641197 (= lt!296735 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18401 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!641198 () Bool)

(declare-fun res!415330 () Bool)

(assert (=> b!641198 (=> (not res!415330) (not e!367109))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38367 (_ BitVec 32)) Bool)

(assert (=> b!641198 (= res!415330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!641199 () Bool)

(assert (=> b!641199 (= e!367105 e!367109)))

(declare-fun res!415335 () Bool)

(assert (=> b!641199 (=> (not res!415335) (not e!367109))))

(declare-fun lt!296743 () SeekEntryResult!6838)

(assert (=> b!641199 (= res!415335 (or (= lt!296743 (MissingZero!6838 i!1108)) (= lt!296743 (MissingVacant!6838 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38367 (_ BitVec 32)) SeekEntryResult!6838)

(assert (=> b!641199 (= lt!296743 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!58010 res!415324) b!641194))

(assert (= (and b!641194 res!415329) b!641181))

(assert (= (and b!641181 res!415334) b!641191))

(assert (= (and b!641191 res!415331) b!641183))

(assert (= (and b!641183 res!415327) b!641199))

(assert (= (and b!641199 res!415335) b!641198))

(assert (= (and b!641198 res!415330) b!641192))

(assert (= (and b!641192 res!415325) b!641196))

(assert (= (and b!641196 res!415337) b!641182))

(assert (= (and b!641182 res!415323) b!641197))

(assert (= (and b!641197 res!415320) b!641187))

(assert (= (and b!641187 res!415338) b!641189))

(assert (= (and b!641187 c!73296) b!641185))

(assert (= (and b!641187 (not c!73296)) b!641179))

(assert (= (and b!641187 (not res!415332)) b!641178))

(assert (= (and b!641178 res!415328) b!641195))

(assert (= (and b!641195 (not res!415333)) b!641180))

(assert (= (and b!641180 res!415326) b!641190))

(assert (= (and b!641178 (not res!415336)) b!641186))

(assert (= (and b!641186 (not res!415322)) b!641193))

(assert (= (and b!641193 (not res!415339)) b!641184))

(assert (= (and b!641184 res!415321) b!641188))

(declare-fun m!614499 () Bool)

(assert (=> b!641188 m!614499))

(declare-fun m!614501 () Bool)

(assert (=> b!641197 m!614501))

(declare-fun m!614503 () Bool)

(assert (=> b!641197 m!614503))

(assert (=> b!641197 m!614503))

(declare-fun m!614505 () Bool)

(assert (=> b!641197 m!614505))

(declare-fun m!614507 () Bool)

(assert (=> b!641192 m!614507))

(declare-fun m!614509 () Bool)

(assert (=> b!641191 m!614509))

(declare-fun m!614511 () Bool)

(assert (=> b!641198 m!614511))

(declare-fun m!614513 () Bool)

(assert (=> start!58010 m!614513))

(declare-fun m!614515 () Bool)

(assert (=> start!58010 m!614515))

(declare-fun m!614517 () Bool)

(assert (=> b!641199 m!614517))

(declare-fun m!614519 () Bool)

(assert (=> b!641182 m!614519))

(declare-fun m!614521 () Bool)

(assert (=> b!641182 m!614521))

(declare-fun m!614523 () Bool)

(assert (=> b!641193 m!614523))

(assert (=> b!641180 m!614503))

(assert (=> b!641180 m!614503))

(declare-fun m!614525 () Bool)

(assert (=> b!641180 m!614525))

(assert (=> b!641186 m!614503))

(declare-fun m!614527 () Bool)

(assert (=> b!641186 m!614527))

(declare-fun m!614529 () Bool)

(assert (=> b!641186 m!614529))

(assert (=> b!641186 m!614503))

(declare-fun m!614531 () Bool)

(assert (=> b!641186 m!614531))

(declare-fun m!614533 () Bool)

(assert (=> b!641186 m!614533))

(assert (=> b!641186 m!614503))

(declare-fun m!614535 () Bool)

(assert (=> b!641186 m!614535))

(declare-fun m!614537 () Bool)

(assert (=> b!641186 m!614537))

(assert (=> b!641195 m!614503))

(declare-fun m!614539 () Bool)

(assert (=> b!641196 m!614539))

(assert (=> b!641181 m!614503))

(assert (=> b!641181 m!614503))

(declare-fun m!614541 () Bool)

(assert (=> b!641181 m!614541))

(assert (=> b!641190 m!614503))

(assert (=> b!641190 m!614503))

(declare-fun m!614543 () Bool)

(assert (=> b!641190 m!614543))

(assert (=> b!641178 m!614503))

(assert (=> b!641178 m!614519))

(declare-fun m!614545 () Bool)

(assert (=> b!641178 m!614545))

(declare-fun m!614547 () Bool)

(assert (=> b!641184 m!614547))

(declare-fun m!614549 () Bool)

(assert (=> b!641183 m!614549))

(declare-fun m!614551 () Bool)

(assert (=> b!641187 m!614551))

(declare-fun m!614553 () Bool)

(assert (=> b!641187 m!614553))

(declare-fun m!614555 () Bool)

(assert (=> b!641187 m!614555))

(assert (=> b!641187 m!614503))

(assert (=> b!641187 m!614519))

(declare-fun m!614557 () Bool)

(assert (=> b!641187 m!614557))

(assert (=> b!641187 m!614503))

(declare-fun m!614559 () Bool)

(assert (=> b!641187 m!614559))

(declare-fun m!614561 () Bool)

(assert (=> b!641187 m!614561))

(check-sat (not b!641186) (not b!641197) (not b!641183) (not b!641199) (not b!641198) (not b!641191) (not b!641192) (not b!641188) (not b!641184) (not b!641180) (not start!58010) (not b!641181) (not b!641190) (not b!641187) (not b!641193))
(check-sat)
(get-model)

(declare-fun b!641342 () Bool)

(declare-fun e!367203 () Bool)

(declare-fun e!367205 () Bool)

(assert (=> b!641342 (= e!367203 e!367205)))

(declare-fun res!415467 () Bool)

(assert (=> b!641342 (=> (not res!415467) (not e!367205))))

(declare-fun e!367204 () Bool)

(assert (=> b!641342 (= res!415467 (not e!367204))))

(declare-fun res!415468 () Bool)

(assert (=> b!641342 (=> (not res!415468) (not e!367204))))

(assert (=> b!641342 (= res!415468 (validKeyInArray!0 (select (arr!18401 lt!296738) #b00000000000000000000000000000000)))))

(declare-fun b!641343 () Bool)

(assert (=> b!641343 (= e!367204 (contains!3114 Nil!12478 (select (arr!18401 lt!296738) #b00000000000000000000000000000000)))))

(declare-fun b!641344 () Bool)

(declare-fun e!367202 () Bool)

(assert (=> b!641344 (= e!367205 e!367202)))

(declare-fun c!73305 () Bool)

(assert (=> b!641344 (= c!73305 (validKeyInArray!0 (select (arr!18401 lt!296738) #b00000000000000000000000000000000)))))

(declare-fun bm!33508 () Bool)

(declare-fun call!33511 () Bool)

(assert (=> bm!33508 (= call!33511 (arrayNoDuplicates!0 lt!296738 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73305 (Cons!12477 (select (arr!18401 lt!296738) #b00000000000000000000000000000000) Nil!12478) Nil!12478)))))

(declare-fun b!641345 () Bool)

(assert (=> b!641345 (= e!367202 call!33511)))

(declare-fun d!90409 () Bool)

(declare-fun res!415466 () Bool)

(assert (=> d!90409 (=> res!415466 e!367203)))

(assert (=> d!90409 (= res!415466 (bvsge #b00000000000000000000000000000000 (size!18766 lt!296738)))))

(assert (=> d!90409 (= (arrayNoDuplicates!0 lt!296738 #b00000000000000000000000000000000 Nil!12478) e!367203)))

(declare-fun b!641346 () Bool)

(assert (=> b!641346 (= e!367202 call!33511)))

(assert (= (and d!90409 (not res!415466)) b!641342))

(assert (= (and b!641342 res!415468) b!641343))

(assert (= (and b!641342 res!415467) b!641344))

(assert (= (and b!641344 c!73305) b!641346))

(assert (= (and b!641344 (not c!73305)) b!641345))

(assert (= (or b!641346 b!641345) bm!33508))

(declare-fun m!614691 () Bool)

(assert (=> b!641342 m!614691))

(assert (=> b!641342 m!614691))

(declare-fun m!614693 () Bool)

(assert (=> b!641342 m!614693))

(assert (=> b!641343 m!614691))

(assert (=> b!641343 m!614691))

(declare-fun m!614695 () Bool)

(assert (=> b!641343 m!614695))

(assert (=> b!641344 m!614691))

(assert (=> b!641344 m!614691))

(assert (=> b!641344 m!614693))

(assert (=> bm!33508 m!614691))

(declare-fun m!614697 () Bool)

(assert (=> bm!33508 m!614697))

(assert (=> b!641186 d!90409))

(declare-fun d!90411 () Bool)

(declare-fun res!415473 () Bool)

(declare-fun e!367210 () Bool)

(assert (=> d!90411 (=> res!415473 e!367210)))

(assert (=> d!90411 (= res!415473 (= (select (arr!18401 lt!296738) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18401 a!2986) j!136)))))

(assert (=> d!90411 (= (arrayContainsKey!0 lt!296738 (select (arr!18401 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!367210)))

(declare-fun b!641351 () Bool)

(declare-fun e!367211 () Bool)

(assert (=> b!641351 (= e!367210 e!367211)))

(declare-fun res!415474 () Bool)

(assert (=> b!641351 (=> (not res!415474) (not e!367211))))

(assert (=> b!641351 (= res!415474 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18766 lt!296738)))))

(declare-fun b!641352 () Bool)

(assert (=> b!641352 (= e!367211 (arrayContainsKey!0 lt!296738 (select (arr!18401 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90411 (not res!415473)) b!641351))

(assert (= (and b!641351 res!415474) b!641352))

(declare-fun m!614699 () Bool)

(assert (=> d!90411 m!614699))

(assert (=> b!641352 m!614503))

(declare-fun m!614701 () Bool)

(assert (=> b!641352 m!614701))

(assert (=> b!641186 d!90411))

(declare-fun d!90413 () Bool)

(assert (=> d!90413 (arrayContainsKey!0 lt!296738 (select (arr!18401 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296826 () Unit!21680)

(declare-fun choose!114 (array!38367 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21680)

(assert (=> d!90413 (= lt!296826 (choose!114 lt!296738 (select (arr!18401 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!90413 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!90413 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296738 (select (arr!18401 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!296826)))

(declare-fun bs!19176 () Bool)

(assert (= bs!19176 d!90413))

(assert (=> bs!19176 m!614503))

(assert (=> bs!19176 m!614531))

(assert (=> bs!19176 m!614503))

(declare-fun m!614703 () Bool)

(assert (=> bs!19176 m!614703))

(assert (=> b!641186 d!90413))

(declare-fun b!641353 () Bool)

(declare-fun e!367213 () Bool)

(declare-fun e!367215 () Bool)

(assert (=> b!641353 (= e!367213 e!367215)))

(declare-fun res!415476 () Bool)

(assert (=> b!641353 (=> (not res!415476) (not e!367215))))

(declare-fun e!367214 () Bool)

(assert (=> b!641353 (= res!415476 (not e!367214))))

(declare-fun res!415477 () Bool)

(assert (=> b!641353 (=> (not res!415477) (not e!367214))))

(assert (=> b!641353 (= res!415477 (validKeyInArray!0 (select (arr!18401 lt!296738) j!136)))))

(declare-fun b!641354 () Bool)

(assert (=> b!641354 (= e!367214 (contains!3114 Nil!12478 (select (arr!18401 lt!296738) j!136)))))

(declare-fun b!641355 () Bool)

(declare-fun e!367212 () Bool)

(assert (=> b!641355 (= e!367215 e!367212)))

(declare-fun c!73306 () Bool)

(assert (=> b!641355 (= c!73306 (validKeyInArray!0 (select (arr!18401 lt!296738) j!136)))))

(declare-fun bm!33509 () Bool)

(declare-fun call!33512 () Bool)

(assert (=> bm!33509 (= call!33512 (arrayNoDuplicates!0 lt!296738 (bvadd j!136 #b00000000000000000000000000000001) (ite c!73306 (Cons!12477 (select (arr!18401 lt!296738) j!136) Nil!12478) Nil!12478)))))

(declare-fun b!641356 () Bool)

(assert (=> b!641356 (= e!367212 call!33512)))

(declare-fun d!90415 () Bool)

(declare-fun res!415475 () Bool)

(assert (=> d!90415 (=> res!415475 e!367213)))

(assert (=> d!90415 (= res!415475 (bvsge j!136 (size!18766 lt!296738)))))

(assert (=> d!90415 (= (arrayNoDuplicates!0 lt!296738 j!136 Nil!12478) e!367213)))

(declare-fun b!641357 () Bool)

(assert (=> b!641357 (= e!367212 call!33512)))

(assert (= (and d!90415 (not res!415475)) b!641353))

(assert (= (and b!641353 res!415477) b!641354))

(assert (= (and b!641353 res!415476) b!641355))

(assert (= (and b!641355 c!73306) b!641357))

(assert (= (and b!641355 (not c!73306)) b!641356))

(assert (= (or b!641357 b!641356) bm!33509))

(declare-fun m!614705 () Bool)

(assert (=> b!641353 m!614705))

(assert (=> b!641353 m!614705))

(declare-fun m!614707 () Bool)

(assert (=> b!641353 m!614707))

(assert (=> b!641354 m!614705))

(assert (=> b!641354 m!614705))

(declare-fun m!614709 () Bool)

(assert (=> b!641354 m!614709))

(assert (=> b!641355 m!614705))

(assert (=> b!641355 m!614705))

(assert (=> b!641355 m!614707))

(assert (=> bm!33509 m!614705))

(declare-fun m!614711 () Bool)

(assert (=> bm!33509 m!614711))

(assert (=> b!641186 d!90415))

(declare-fun d!90417 () Bool)

(assert (=> d!90417 (arrayNoDuplicates!0 lt!296738 j!136 Nil!12478)))

(declare-fun lt!296829 () Unit!21680)

(declare-fun choose!39 (array!38367 (_ BitVec 32) (_ BitVec 32)) Unit!21680)

(assert (=> d!90417 (= lt!296829 (choose!39 lt!296738 #b00000000000000000000000000000000 j!136))))

(assert (=> d!90417 (bvslt (size!18766 lt!296738) #b01111111111111111111111111111111)))

(assert (=> d!90417 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!296738 #b00000000000000000000000000000000 j!136) lt!296829)))

(declare-fun bs!19177 () Bool)

(assert (= bs!19177 d!90417))

(assert (=> bs!19177 m!614533))

(declare-fun m!614713 () Bool)

(assert (=> bs!19177 m!614713))

(assert (=> b!641186 d!90417))

(declare-fun d!90419 () Bool)

(declare-fun e!367218 () Bool)

(assert (=> d!90419 e!367218))

(declare-fun res!415480 () Bool)

(assert (=> d!90419 (=> (not res!415480) (not e!367218))))

(assert (=> d!90419 (= res!415480 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18766 a!2986))))))

(declare-fun lt!296832 () Unit!21680)

(declare-fun choose!41 (array!38367 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12481) Unit!21680)

(assert (=> d!90419 (= lt!296832 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12478))))

(assert (=> d!90419 (bvslt (size!18766 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!90419 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12478) lt!296832)))

(declare-fun b!641360 () Bool)

(assert (=> b!641360 (= e!367218 (arrayNoDuplicates!0 (array!38368 (store (arr!18401 a!2986) i!1108 k0!1786) (size!18766 a!2986)) #b00000000000000000000000000000000 Nil!12478))))

(assert (= (and d!90419 res!415480) b!641360))

(declare-fun m!614715 () Bool)

(assert (=> d!90419 m!614715))

(assert (=> b!641360 m!614519))

(declare-fun m!614717 () Bool)

(assert (=> b!641360 m!614717))

(assert (=> b!641186 d!90419))

(declare-fun b!641373 () Bool)

(declare-fun e!367227 () SeekEntryResult!6838)

(assert (=> b!641373 (= e!367227 (MissingVacant!6838 vacantSpotIndex!68))))

(declare-fun b!641374 () Bool)

(declare-fun c!73313 () Bool)

(declare-fun lt!296838 () (_ BitVec 64))

(assert (=> b!641374 (= c!73313 (= lt!296838 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!367225 () SeekEntryResult!6838)

(assert (=> b!641374 (= e!367225 e!367227)))

(declare-fun b!641375 () Bool)

(declare-fun e!367226 () SeekEntryResult!6838)

(assert (=> b!641375 (= e!367226 Undefined!6838)))

(declare-fun lt!296837 () SeekEntryResult!6838)

(declare-fun d!90421 () Bool)

(get-info :version)

(assert (=> d!90421 (and (or ((_ is Undefined!6838) lt!296837) (not ((_ is Found!6838) lt!296837)) (and (bvsge (index!29676 lt!296837) #b00000000000000000000000000000000) (bvslt (index!29676 lt!296837) (size!18766 a!2986)))) (or ((_ is Undefined!6838) lt!296837) ((_ is Found!6838) lt!296837) (not ((_ is MissingVacant!6838) lt!296837)) (not (= (index!29678 lt!296837) vacantSpotIndex!68)) (and (bvsge (index!29678 lt!296837) #b00000000000000000000000000000000) (bvslt (index!29678 lt!296837) (size!18766 a!2986)))) (or ((_ is Undefined!6838) lt!296837) (ite ((_ is Found!6838) lt!296837) (= (select (arr!18401 a!2986) (index!29676 lt!296837)) (select (arr!18401 a!2986) j!136)) (and ((_ is MissingVacant!6838) lt!296837) (= (index!29678 lt!296837) vacantSpotIndex!68) (= (select (arr!18401 a!2986) (index!29678 lt!296837)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90421 (= lt!296837 e!367226)))

(declare-fun c!73314 () Bool)

(assert (=> d!90421 (= c!73314 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!90421 (= lt!296838 (select (arr!18401 a!2986) index!984))))

(assert (=> d!90421 (validMask!0 mask!3053)))

(assert (=> d!90421 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18401 a!2986) j!136) a!2986 mask!3053) lt!296837)))

(declare-fun b!641376 () Bool)

(assert (=> b!641376 (= e!367226 e!367225)))

(declare-fun c!73315 () Bool)

(assert (=> b!641376 (= c!73315 (= lt!296838 (select (arr!18401 a!2986) j!136)))))

(declare-fun b!641377 () Bool)

(assert (=> b!641377 (= e!367225 (Found!6838 index!984))))

(declare-fun b!641378 () Bool)

(assert (=> b!641378 (= e!367227 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18401 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!90421 c!73314) b!641375))

(assert (= (and d!90421 (not c!73314)) b!641376))

(assert (= (and b!641376 c!73315) b!641377))

(assert (= (and b!641376 (not c!73315)) b!641374))

(assert (= (and b!641374 c!73313) b!641373))

(assert (= (and b!641374 (not c!73313)) b!641378))

(declare-fun m!614719 () Bool)

(assert (=> d!90421 m!614719))

(declare-fun m!614721 () Bool)

(assert (=> d!90421 m!614721))

(assert (=> d!90421 m!614501))

(assert (=> d!90421 m!614513))

(assert (=> b!641378 m!614551))

(assert (=> b!641378 m!614551))

(assert (=> b!641378 m!614503))

(declare-fun m!614723 () Bool)

(assert (=> b!641378 m!614723))

(assert (=> b!641197 d!90421))

(declare-fun d!90423 () Bool)

(declare-fun lt!296845 () SeekEntryResult!6838)

(assert (=> d!90423 (and (or ((_ is Undefined!6838) lt!296845) (not ((_ is Found!6838) lt!296845)) (and (bvsge (index!29676 lt!296845) #b00000000000000000000000000000000) (bvslt (index!29676 lt!296845) (size!18766 a!2986)))) (or ((_ is Undefined!6838) lt!296845) ((_ is Found!6838) lt!296845) (not ((_ is MissingZero!6838) lt!296845)) (and (bvsge (index!29675 lt!296845) #b00000000000000000000000000000000) (bvslt (index!29675 lt!296845) (size!18766 a!2986)))) (or ((_ is Undefined!6838) lt!296845) ((_ is Found!6838) lt!296845) ((_ is MissingZero!6838) lt!296845) (not ((_ is MissingVacant!6838) lt!296845)) (and (bvsge (index!29678 lt!296845) #b00000000000000000000000000000000) (bvslt (index!29678 lt!296845) (size!18766 a!2986)))) (or ((_ is Undefined!6838) lt!296845) (ite ((_ is Found!6838) lt!296845) (= (select (arr!18401 a!2986) (index!29676 lt!296845)) k0!1786) (ite ((_ is MissingZero!6838) lt!296845) (= (select (arr!18401 a!2986) (index!29675 lt!296845)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6838) lt!296845) (= (select (arr!18401 a!2986) (index!29678 lt!296845)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!367235 () SeekEntryResult!6838)

(assert (=> d!90423 (= lt!296845 e!367235)))

(declare-fun c!73324 () Bool)

(declare-fun lt!296846 () SeekEntryResult!6838)

(assert (=> d!90423 (= c!73324 (and ((_ is Intermediate!6838) lt!296846) (undefined!7650 lt!296846)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38367 (_ BitVec 32)) SeekEntryResult!6838)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90423 (= lt!296846 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!90423 (validMask!0 mask!3053)))

(assert (=> d!90423 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!296845)))

(declare-fun b!641391 () Bool)

(declare-fun e!367236 () SeekEntryResult!6838)

(assert (=> b!641391 (= e!367236 (Found!6838 (index!29677 lt!296846)))))

(declare-fun b!641392 () Bool)

(declare-fun c!73323 () Bool)

(declare-fun lt!296847 () (_ BitVec 64))

(assert (=> b!641392 (= c!73323 (= lt!296847 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!367234 () SeekEntryResult!6838)

(assert (=> b!641392 (= e!367236 e!367234)))

(declare-fun b!641393 () Bool)

(assert (=> b!641393 (= e!367234 (seekKeyOrZeroReturnVacant!0 (x!58446 lt!296846) (index!29677 lt!296846) (index!29677 lt!296846) k0!1786 a!2986 mask!3053))))

(declare-fun b!641394 () Bool)

(assert (=> b!641394 (= e!367235 e!367236)))

(assert (=> b!641394 (= lt!296847 (select (arr!18401 a!2986) (index!29677 lt!296846)))))

(declare-fun c!73322 () Bool)

(assert (=> b!641394 (= c!73322 (= lt!296847 k0!1786))))

(declare-fun b!641395 () Bool)

(assert (=> b!641395 (= e!367234 (MissingZero!6838 (index!29677 lt!296846)))))

(declare-fun b!641396 () Bool)

(assert (=> b!641396 (= e!367235 Undefined!6838)))

(assert (= (and d!90423 c!73324) b!641396))

(assert (= (and d!90423 (not c!73324)) b!641394))

(assert (= (and b!641394 c!73322) b!641391))

(assert (= (and b!641394 (not c!73322)) b!641392))

(assert (= (and b!641392 c!73323) b!641395))

(assert (= (and b!641392 (not c!73323)) b!641393))

(declare-fun m!614725 () Bool)

(assert (=> d!90423 m!614725))

(declare-fun m!614727 () Bool)

(assert (=> d!90423 m!614727))

(declare-fun m!614729 () Bool)

(assert (=> d!90423 m!614729))

(declare-fun m!614731 () Bool)

(assert (=> d!90423 m!614731))

(assert (=> d!90423 m!614513))

(declare-fun m!614733 () Bool)

(assert (=> d!90423 m!614733))

(assert (=> d!90423 m!614729))

(declare-fun m!614735 () Bool)

(assert (=> b!641393 m!614735))

(declare-fun m!614737 () Bool)

(assert (=> b!641394 m!614737))

(assert (=> b!641199 d!90423))

(declare-fun bm!33512 () Bool)

(declare-fun call!33515 () Bool)

(assert (=> bm!33512 (= call!33515 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun d!90429 () Bool)

(declare-fun res!415485 () Bool)

(declare-fun e!367251 () Bool)

(assert (=> d!90429 (=> res!415485 e!367251)))

(assert (=> d!90429 (= res!415485 (bvsge #b00000000000000000000000000000000 (size!18766 a!2986)))))

(assert (=> d!90429 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!367251)))

(declare-fun b!641417 () Bool)

(declare-fun e!367250 () Bool)

(assert (=> b!641417 (= e!367250 call!33515)))

(declare-fun b!641418 () Bool)

(declare-fun e!367249 () Bool)

(assert (=> b!641418 (= e!367250 e!367249)))

(declare-fun lt!296863 () (_ BitVec 64))

(assert (=> b!641418 (= lt!296863 (select (arr!18401 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!296864 () Unit!21680)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38367 (_ BitVec 64) (_ BitVec 32)) Unit!21680)

(assert (=> b!641418 (= lt!296864 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!296863 #b00000000000000000000000000000000))))

(assert (=> b!641418 (arrayContainsKey!0 a!2986 lt!296863 #b00000000000000000000000000000000)))

(declare-fun lt!296865 () Unit!21680)

(assert (=> b!641418 (= lt!296865 lt!296864)))

(declare-fun res!415486 () Bool)

(assert (=> b!641418 (= res!415486 (= (seekEntryOrOpen!0 (select (arr!18401 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6838 #b00000000000000000000000000000000)))))

(assert (=> b!641418 (=> (not res!415486) (not e!367249))))

(declare-fun b!641419 () Bool)

(assert (=> b!641419 (= e!367249 call!33515)))

(declare-fun b!641420 () Bool)

(assert (=> b!641420 (= e!367251 e!367250)))

(declare-fun c!73333 () Bool)

(assert (=> b!641420 (= c!73333 (validKeyInArray!0 (select (arr!18401 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!90429 (not res!415485)) b!641420))

(assert (= (and b!641420 c!73333) b!641418))

(assert (= (and b!641420 (not c!73333)) b!641417))

(assert (= (and b!641418 res!415486) b!641419))

(assert (= (or b!641419 b!641417) bm!33512))

(declare-fun m!614741 () Bool)

(assert (=> bm!33512 m!614741))

(declare-fun m!614743 () Bool)

(assert (=> b!641418 m!614743))

(declare-fun m!614745 () Bool)

(assert (=> b!641418 m!614745))

(declare-fun m!614747 () Bool)

(assert (=> b!641418 m!614747))

(assert (=> b!641418 m!614743))

(declare-fun m!614749 () Bool)

(assert (=> b!641418 m!614749))

(assert (=> b!641420 m!614743))

(assert (=> b!641420 m!614743))

(declare-fun m!614751 () Bool)

(assert (=> b!641420 m!614751))

(assert (=> b!641198 d!90429))

(declare-fun b!641421 () Bool)

(declare-fun e!367254 () SeekEntryResult!6838)

(assert (=> b!641421 (= e!367254 (MissingVacant!6838 vacantSpotIndex!68))))

(declare-fun b!641422 () Bool)

(declare-fun c!73334 () Bool)

(declare-fun lt!296867 () (_ BitVec 64))

(assert (=> b!641422 (= c!73334 (= lt!296867 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!367252 () SeekEntryResult!6838)

(assert (=> b!641422 (= e!367252 e!367254)))

(declare-fun b!641423 () Bool)

(declare-fun e!367253 () SeekEntryResult!6838)

(assert (=> b!641423 (= e!367253 Undefined!6838)))

(declare-fun d!90433 () Bool)

(declare-fun lt!296866 () SeekEntryResult!6838)

(assert (=> d!90433 (and (or ((_ is Undefined!6838) lt!296866) (not ((_ is Found!6838) lt!296866)) (and (bvsge (index!29676 lt!296866) #b00000000000000000000000000000000) (bvslt (index!29676 lt!296866) (size!18766 lt!296738)))) (or ((_ is Undefined!6838) lt!296866) ((_ is Found!6838) lt!296866) (not ((_ is MissingVacant!6838) lt!296866)) (not (= (index!29678 lt!296866) vacantSpotIndex!68)) (and (bvsge (index!29678 lt!296866) #b00000000000000000000000000000000) (bvslt (index!29678 lt!296866) (size!18766 lt!296738)))) (or ((_ is Undefined!6838) lt!296866) (ite ((_ is Found!6838) lt!296866) (= (select (arr!18401 lt!296738) (index!29676 lt!296866)) lt!296742) (and ((_ is MissingVacant!6838) lt!296866) (= (index!29678 lt!296866) vacantSpotIndex!68) (= (select (arr!18401 lt!296738) (index!29678 lt!296866)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90433 (= lt!296866 e!367253)))

(declare-fun c!73335 () Bool)

(assert (=> d!90433 (= c!73335 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!90433 (= lt!296867 (select (arr!18401 lt!296738) lt!296736))))

(assert (=> d!90433 (validMask!0 mask!3053)))

(assert (=> d!90433 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296736 vacantSpotIndex!68 lt!296742 lt!296738 mask!3053) lt!296866)))

(declare-fun b!641424 () Bool)

(assert (=> b!641424 (= e!367253 e!367252)))

(declare-fun c!73336 () Bool)

(assert (=> b!641424 (= c!73336 (= lt!296867 lt!296742))))

(declare-fun b!641425 () Bool)

(assert (=> b!641425 (= e!367252 (Found!6838 lt!296736))))

(declare-fun b!641426 () Bool)

(assert (=> b!641426 (= e!367254 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!296736 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!296742 lt!296738 mask!3053))))

(assert (= (and d!90433 c!73335) b!641423))

(assert (= (and d!90433 (not c!73335)) b!641424))

(assert (= (and b!641424 c!73336) b!641425))

(assert (= (and b!641424 (not c!73336)) b!641422))

(assert (= (and b!641422 c!73334) b!641421))

(assert (= (and b!641422 (not c!73334)) b!641426))

(declare-fun m!614753 () Bool)

(assert (=> d!90433 m!614753))

(declare-fun m!614755 () Bool)

(assert (=> d!90433 m!614755))

(declare-fun m!614757 () Bool)

(assert (=> d!90433 m!614757))

(assert (=> d!90433 m!614513))

(declare-fun m!614759 () Bool)

(assert (=> b!641426 m!614759))

(assert (=> b!641426 m!614759))

(declare-fun m!614761 () Bool)

(assert (=> b!641426 m!614761))

(assert (=> b!641187 d!90433))

(declare-fun b!641429 () Bool)

(declare-fun e!367259 () SeekEntryResult!6838)

(assert (=> b!641429 (= e!367259 (MissingVacant!6838 vacantSpotIndex!68))))

(declare-fun b!641430 () Bool)

(declare-fun c!73337 () Bool)

(declare-fun lt!296869 () (_ BitVec 64))

(assert (=> b!641430 (= c!73337 (= lt!296869 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!367257 () SeekEntryResult!6838)

(assert (=> b!641430 (= e!367257 e!367259)))

(declare-fun b!641431 () Bool)

(declare-fun e!367258 () SeekEntryResult!6838)

(assert (=> b!641431 (= e!367258 Undefined!6838)))

(declare-fun lt!296868 () SeekEntryResult!6838)

(declare-fun d!90435 () Bool)

(assert (=> d!90435 (and (or ((_ is Undefined!6838) lt!296868) (not ((_ is Found!6838) lt!296868)) (and (bvsge (index!29676 lt!296868) #b00000000000000000000000000000000) (bvslt (index!29676 lt!296868) (size!18766 a!2986)))) (or ((_ is Undefined!6838) lt!296868) ((_ is Found!6838) lt!296868) (not ((_ is MissingVacant!6838) lt!296868)) (not (= (index!29678 lt!296868) vacantSpotIndex!68)) (and (bvsge (index!29678 lt!296868) #b00000000000000000000000000000000) (bvslt (index!29678 lt!296868) (size!18766 a!2986)))) (or ((_ is Undefined!6838) lt!296868) (ite ((_ is Found!6838) lt!296868) (= (select (arr!18401 a!2986) (index!29676 lt!296868)) (select (arr!18401 a!2986) j!136)) (and ((_ is MissingVacant!6838) lt!296868) (= (index!29678 lt!296868) vacantSpotIndex!68) (= (select (arr!18401 a!2986) (index!29678 lt!296868)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90435 (= lt!296868 e!367258)))

(declare-fun c!73338 () Bool)

(assert (=> d!90435 (= c!73338 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!90435 (= lt!296869 (select (arr!18401 a!2986) lt!296736))))

(assert (=> d!90435 (validMask!0 mask!3053)))

(assert (=> d!90435 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296736 vacantSpotIndex!68 (select (arr!18401 a!2986) j!136) a!2986 mask!3053) lt!296868)))

(declare-fun b!641432 () Bool)

(assert (=> b!641432 (= e!367258 e!367257)))

(declare-fun c!73339 () Bool)

(assert (=> b!641432 (= c!73339 (= lt!296869 (select (arr!18401 a!2986) j!136)))))

(declare-fun b!641433 () Bool)

(assert (=> b!641433 (= e!367257 (Found!6838 lt!296736))))

(declare-fun b!641434 () Bool)

(assert (=> b!641434 (= e!367259 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!296736 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18401 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!90435 c!73338) b!641431))

(assert (= (and d!90435 (not c!73338)) b!641432))

(assert (= (and b!641432 c!73339) b!641433))

(assert (= (and b!641432 (not c!73339)) b!641430))

(assert (= (and b!641430 c!73337) b!641429))

(assert (= (and b!641430 (not c!73337)) b!641434))

(declare-fun m!614763 () Bool)

(assert (=> d!90435 m!614763))

(declare-fun m!614765 () Bool)

(assert (=> d!90435 m!614765))

(declare-fun m!614767 () Bool)

(assert (=> d!90435 m!614767))

(assert (=> d!90435 m!614513))

(assert (=> b!641434 m!614759))

(assert (=> b!641434 m!614759))

(assert (=> b!641434 m!614503))

(declare-fun m!614769 () Bool)

(assert (=> b!641434 m!614769))

(assert (=> b!641187 d!90435))

(declare-fun d!90437 () Bool)

(declare-fun lt!296875 () (_ BitVec 32))

(assert (=> d!90437 (and (bvsge lt!296875 #b00000000000000000000000000000000) (bvslt lt!296875 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90437 (= lt!296875 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!90437 (validMask!0 mask!3053)))

(assert (=> d!90437 (= (nextIndex!0 index!984 x!910 mask!3053) lt!296875)))

(declare-fun bs!19179 () Bool)

(assert (= bs!19179 d!90437))

(declare-fun m!614785 () Bool)

(assert (=> bs!19179 m!614785))

(assert (=> bs!19179 m!614513))

(assert (=> b!641187 d!90437))

(declare-fun b!641453 () Bool)

(declare-fun e!367275 () SeekEntryResult!6838)

(assert (=> b!641453 (= e!367275 (MissingVacant!6838 vacantSpotIndex!68))))

(declare-fun b!641454 () Bool)

(declare-fun c!73345 () Bool)

(declare-fun lt!296877 () (_ BitVec 64))

(assert (=> b!641454 (= c!73345 (= lt!296877 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!367273 () SeekEntryResult!6838)

(assert (=> b!641454 (= e!367273 e!367275)))

(declare-fun b!641455 () Bool)

(declare-fun e!367274 () SeekEntryResult!6838)

(assert (=> b!641455 (= e!367274 Undefined!6838)))

(declare-fun lt!296876 () SeekEntryResult!6838)

(declare-fun d!90441 () Bool)

(assert (=> d!90441 (and (or ((_ is Undefined!6838) lt!296876) (not ((_ is Found!6838) lt!296876)) (and (bvsge (index!29676 lt!296876) #b00000000000000000000000000000000) (bvslt (index!29676 lt!296876) (size!18766 lt!296738)))) (or ((_ is Undefined!6838) lt!296876) ((_ is Found!6838) lt!296876) (not ((_ is MissingVacant!6838) lt!296876)) (not (= (index!29678 lt!296876) vacantSpotIndex!68)) (and (bvsge (index!29678 lt!296876) #b00000000000000000000000000000000) (bvslt (index!29678 lt!296876) (size!18766 lt!296738)))) (or ((_ is Undefined!6838) lt!296876) (ite ((_ is Found!6838) lt!296876) (= (select (arr!18401 lt!296738) (index!29676 lt!296876)) lt!296742) (and ((_ is MissingVacant!6838) lt!296876) (= (index!29678 lt!296876) vacantSpotIndex!68) (= (select (arr!18401 lt!296738) (index!29678 lt!296876)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90441 (= lt!296876 e!367274)))

(declare-fun c!73346 () Bool)

(assert (=> d!90441 (= c!73346 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!90441 (= lt!296877 (select (arr!18401 lt!296738) index!984))))

(assert (=> d!90441 (validMask!0 mask!3053)))

(assert (=> d!90441 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296742 lt!296738 mask!3053) lt!296876)))

(declare-fun b!641456 () Bool)

(assert (=> b!641456 (= e!367274 e!367273)))

(declare-fun c!73347 () Bool)

(assert (=> b!641456 (= c!73347 (= lt!296877 lt!296742))))

(declare-fun b!641457 () Bool)

(assert (=> b!641457 (= e!367273 (Found!6838 index!984))))

(declare-fun b!641458 () Bool)

(assert (=> b!641458 (= e!367275 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!296742 lt!296738 mask!3053))))

(assert (= (and d!90441 c!73346) b!641455))

(assert (= (and d!90441 (not c!73346)) b!641456))

(assert (= (and b!641456 c!73347) b!641457))

(assert (= (and b!641456 (not c!73347)) b!641454))

(assert (= (and b!641454 c!73345) b!641453))

(assert (= (and b!641454 (not c!73345)) b!641458))

(declare-fun m!614787 () Bool)

(assert (=> d!90441 m!614787))

(declare-fun m!614789 () Bool)

(assert (=> d!90441 m!614789))

(declare-fun m!614791 () Bool)

(assert (=> d!90441 m!614791))

(assert (=> d!90441 m!614513))

(assert (=> b!641458 m!614551))

(assert (=> b!641458 m!614551))

(declare-fun m!614793 () Bool)

(assert (=> b!641458 m!614793))

(assert (=> b!641187 d!90441))

(declare-fun d!90443 () Bool)

(declare-fun e!367317 () Bool)

(assert (=> d!90443 e!367317))

(declare-fun res!415533 () Bool)

(assert (=> d!90443 (=> (not res!415533) (not e!367317))))

(assert (=> d!90443 (= res!415533 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18766 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18766 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18766 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18766 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18766 a!2986))))))

(declare-fun lt!296886 () Unit!21680)

(declare-fun choose!9 (array!38367 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21680)

(assert (=> d!90443 (= lt!296886 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296736 vacantSpotIndex!68 mask!3053))))

(assert (=> d!90443 (validMask!0 mask!3053)))

(assert (=> d!90443 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296736 vacantSpotIndex!68 mask!3053) lt!296886)))

(declare-fun b!641505 () Bool)

(assert (=> b!641505 (= e!367317 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296736 vacantSpotIndex!68 (select (arr!18401 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296736 vacantSpotIndex!68 (select (store (arr!18401 a!2986) i!1108 k0!1786) j!136) (array!38368 (store (arr!18401 a!2986) i!1108 k0!1786) (size!18766 a!2986)) mask!3053)))))

(assert (= (and d!90443 res!415533) b!641505))

(declare-fun m!614841 () Bool)

(assert (=> d!90443 m!614841))

(assert (=> d!90443 m!614513))

(assert (=> b!641505 m!614553))

(assert (=> b!641505 m!614519))

(assert (=> b!641505 m!614553))

(declare-fun m!614843 () Bool)

(assert (=> b!641505 m!614843))

(assert (=> b!641505 m!614503))

(assert (=> b!641505 m!614559))

(assert (=> b!641505 m!614503))

(assert (=> b!641187 d!90443))

(declare-fun d!90463 () Bool)

(declare-fun lt!296895 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!245 (List!12481) (InoxSet (_ BitVec 64)))

(assert (=> d!90463 (= lt!296895 (select (content!245 Nil!12478) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!367333 () Bool)

(assert (=> d!90463 (= lt!296895 e!367333)))

(declare-fun res!415547 () Bool)

(assert (=> d!90463 (=> (not res!415547) (not e!367333))))

(assert (=> d!90463 (= res!415547 ((_ is Cons!12477) Nil!12478))))

(assert (=> d!90463 (= (contains!3114 Nil!12478 #b1000000000000000000000000000000000000000000000000000000000000000) lt!296895)))

(declare-fun b!641522 () Bool)

(declare-fun e!367332 () Bool)

(assert (=> b!641522 (= e!367333 e!367332)))

(declare-fun res!415546 () Bool)

(assert (=> b!641522 (=> res!415546 e!367332)))

(assert (=> b!641522 (= res!415546 (= (h!13522 Nil!12478) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!641523 () Bool)

(assert (=> b!641523 (= e!367332 (contains!3114 (t!18700 Nil!12478) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!90463 res!415547) b!641522))

(assert (= (and b!641522 (not res!415546)) b!641523))

(declare-fun m!614865 () Bool)

(assert (=> d!90463 m!614865))

(declare-fun m!614867 () Bool)

(assert (=> d!90463 m!614867))

(declare-fun m!614869 () Bool)

(assert (=> b!641523 m!614869))

(assert (=> b!641188 d!90463))

(declare-fun d!90475 () Bool)

(assert (=> d!90475 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!641191 d!90475))

(declare-fun b!641524 () Bool)

(declare-fun e!367335 () Bool)

(declare-fun e!367337 () Bool)

(assert (=> b!641524 (= e!367335 e!367337)))

(declare-fun res!415549 () Bool)

(assert (=> b!641524 (=> (not res!415549) (not e!367337))))

(declare-fun e!367336 () Bool)

(assert (=> b!641524 (= res!415549 (not e!367336))))

(declare-fun res!415550 () Bool)

(assert (=> b!641524 (=> (not res!415550) (not e!367336))))

(assert (=> b!641524 (= res!415550 (validKeyInArray!0 (select (arr!18401 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!641525 () Bool)

(assert (=> b!641525 (= e!367336 (contains!3114 Nil!12478 (select (arr!18401 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!641526 () Bool)

(declare-fun e!367334 () Bool)

(assert (=> b!641526 (= e!367337 e!367334)))

(declare-fun c!73355 () Bool)

(assert (=> b!641526 (= c!73355 (validKeyInArray!0 (select (arr!18401 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33522 () Bool)

(declare-fun call!33525 () Bool)

(assert (=> bm!33522 (= call!33525 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73355 (Cons!12477 (select (arr!18401 a!2986) #b00000000000000000000000000000000) Nil!12478) Nil!12478)))))

(declare-fun b!641527 () Bool)

(assert (=> b!641527 (= e!367334 call!33525)))

(declare-fun d!90477 () Bool)

(declare-fun res!415548 () Bool)

(assert (=> d!90477 (=> res!415548 e!367335)))

(assert (=> d!90477 (= res!415548 (bvsge #b00000000000000000000000000000000 (size!18766 a!2986)))))

(assert (=> d!90477 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12478) e!367335)))

(declare-fun b!641528 () Bool)

(assert (=> b!641528 (= e!367334 call!33525)))

(assert (= (and d!90477 (not res!415548)) b!641524))

(assert (= (and b!641524 res!415550) b!641525))

(assert (= (and b!641524 res!415549) b!641526))

(assert (= (and b!641526 c!73355) b!641528))

(assert (= (and b!641526 (not c!73355)) b!641527))

(assert (= (or b!641528 b!641527) bm!33522))

(assert (=> b!641524 m!614743))

(assert (=> b!641524 m!614743))

(assert (=> b!641524 m!614751))

(assert (=> b!641525 m!614743))

(assert (=> b!641525 m!614743))

(declare-fun m!614871 () Bool)

(assert (=> b!641525 m!614871))

(assert (=> b!641526 m!614743))

(assert (=> b!641526 m!614743))

(assert (=> b!641526 m!614751))

(assert (=> bm!33522 m!614743))

(declare-fun m!614873 () Bool)

(assert (=> bm!33522 m!614873))

(assert (=> b!641192 d!90477))

(declare-fun d!90479 () Bool)

(assert (=> d!90479 (= (validKeyInArray!0 (select (arr!18401 a!2986) j!136)) (and (not (= (select (arr!18401 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18401 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!641181 d!90479))

(declare-fun d!90481 () Bool)

(assert (=> d!90481 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!58010 d!90481))

(declare-fun d!90495 () Bool)

(assert (=> d!90495 (= (array_inv!14284 a!2986) (bvsge (size!18766 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!58010 d!90495))

(declare-fun d!90497 () Bool)

(declare-fun res!415562 () Bool)

(declare-fun e!367349 () Bool)

(assert (=> d!90497 (=> res!415562 e!367349)))

(assert (=> d!90497 (= res!415562 (= (select (arr!18401 lt!296738) index!984) (select (arr!18401 a!2986) j!136)))))

(assert (=> d!90497 (= (arrayContainsKey!0 lt!296738 (select (arr!18401 a!2986) j!136) index!984) e!367349)))

(declare-fun b!641540 () Bool)

(declare-fun e!367350 () Bool)

(assert (=> b!641540 (= e!367349 e!367350)))

(declare-fun res!415563 () Bool)

(assert (=> b!641540 (=> (not res!415563) (not e!367350))))

(assert (=> b!641540 (= res!415563 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18766 lt!296738)))))

(declare-fun b!641541 () Bool)

(assert (=> b!641541 (= e!367350 (arrayContainsKey!0 lt!296738 (select (arr!18401 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!90497 (not res!415562)) b!641540))

(assert (= (and b!641540 res!415563) b!641541))

(assert (=> d!90497 m!614791))

(assert (=> b!641541 m!614503))

(declare-fun m!614889 () Bool)

(assert (=> b!641541 m!614889))

(assert (=> b!641190 d!90497))

(declare-fun d!90499 () Bool)

(declare-fun res!415564 () Bool)

(declare-fun e!367351 () Bool)

(assert (=> d!90499 (=> res!415564 e!367351)))

(assert (=> d!90499 (= res!415564 (= (select (arr!18401 lt!296738) j!136) (select (arr!18401 a!2986) j!136)))))

(assert (=> d!90499 (= (arrayContainsKey!0 lt!296738 (select (arr!18401 a!2986) j!136) j!136) e!367351)))

(declare-fun b!641542 () Bool)

(declare-fun e!367352 () Bool)

(assert (=> b!641542 (= e!367351 e!367352)))

(declare-fun res!415565 () Bool)

(assert (=> b!641542 (=> (not res!415565) (not e!367352))))

(assert (=> b!641542 (= res!415565 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18766 lt!296738)))))

(declare-fun b!641543 () Bool)

(assert (=> b!641543 (= e!367352 (arrayContainsKey!0 lt!296738 (select (arr!18401 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90499 (not res!415564)) b!641542))

(assert (= (and b!641542 res!415565) b!641543))

(assert (=> d!90499 m!614705))

(assert (=> b!641543 m!614503))

(declare-fun m!614891 () Bool)

(assert (=> b!641543 m!614891))

(assert (=> b!641180 d!90499))

(declare-fun d!90501 () Bool)

(declare-fun res!415566 () Bool)

(declare-fun e!367353 () Bool)

(assert (=> d!90501 (=> res!415566 e!367353)))

(assert (=> d!90501 (= res!415566 (= (select (arr!18401 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!90501 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!367353)))

(declare-fun b!641544 () Bool)

(declare-fun e!367354 () Bool)

(assert (=> b!641544 (= e!367353 e!367354)))

(declare-fun res!415567 () Bool)

(assert (=> b!641544 (=> (not res!415567) (not e!367354))))

(assert (=> b!641544 (= res!415567 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18766 a!2986)))))

(declare-fun b!641545 () Bool)

(assert (=> b!641545 (= e!367354 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!90501 (not res!415566)) b!641544))

(assert (= (and b!641544 res!415567) b!641545))

(assert (=> d!90501 m!614743))

(declare-fun m!614893 () Bool)

(assert (=> b!641545 m!614893))

(assert (=> b!641183 d!90501))

(declare-fun d!90503 () Bool)

(declare-fun lt!296902 () Bool)

(assert (=> d!90503 (= lt!296902 (select (content!245 Nil!12478) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!367356 () Bool)

(assert (=> d!90503 (= lt!296902 e!367356)))

(declare-fun res!415569 () Bool)

(assert (=> d!90503 (=> (not res!415569) (not e!367356))))

(assert (=> d!90503 (= res!415569 ((_ is Cons!12477) Nil!12478))))

(assert (=> d!90503 (= (contains!3114 Nil!12478 #b0000000000000000000000000000000000000000000000000000000000000000) lt!296902)))

(declare-fun b!641546 () Bool)

(declare-fun e!367355 () Bool)

(assert (=> b!641546 (= e!367356 e!367355)))

(declare-fun res!415568 () Bool)

(assert (=> b!641546 (=> res!415568 e!367355)))

(assert (=> b!641546 (= res!415568 (= (h!13522 Nil!12478) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!641547 () Bool)

(assert (=> b!641547 (= e!367355 (contains!3114 (t!18700 Nil!12478) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!90503 res!415569) b!641546))

(assert (= (and b!641546 (not res!415568)) b!641547))

(assert (=> d!90503 m!614865))

(declare-fun m!614895 () Bool)

(assert (=> d!90503 m!614895))

(declare-fun m!614897 () Bool)

(assert (=> b!641547 m!614897))

(assert (=> b!641184 d!90503))

(declare-fun d!90505 () Bool)

(declare-fun res!415574 () Bool)

(declare-fun e!367361 () Bool)

(assert (=> d!90505 (=> res!415574 e!367361)))

(assert (=> d!90505 (= res!415574 ((_ is Nil!12478) Nil!12478))))

(assert (=> d!90505 (= (noDuplicate!407 Nil!12478) e!367361)))

(declare-fun b!641552 () Bool)

(declare-fun e!367362 () Bool)

(assert (=> b!641552 (= e!367361 e!367362)))

(declare-fun res!415575 () Bool)

(assert (=> b!641552 (=> (not res!415575) (not e!367362))))

(assert (=> b!641552 (= res!415575 (not (contains!3114 (t!18700 Nil!12478) (h!13522 Nil!12478))))))

(declare-fun b!641553 () Bool)

(assert (=> b!641553 (= e!367362 (noDuplicate!407 (t!18700 Nil!12478)))))

(assert (= (and d!90505 (not res!415574)) b!641552))

(assert (= (and b!641552 res!415575) b!641553))

(declare-fun m!614899 () Bool)

(assert (=> b!641552 m!614899))

(declare-fun m!614901 () Bool)

(assert (=> b!641553 m!614901))

(assert (=> b!641193 d!90505))

(check-sat (not d!90421) (not b!641553) (not b!641547) (not bm!33508) (not b!641524) (not b!641523) (not b!641393) (not b!641420) (not b!641426) (not d!90419) (not b!641525) (not d!90463) (not d!90417) (not b!641343) (not d!90433) (not b!641458) (not b!641354) (not b!641355) (not b!641505) (not bm!33512) (not b!641344) (not d!90443) (not d!90435) (not b!641418) (not b!641353) (not bm!33522) (not d!90503) (not b!641434) (not bm!33509) (not b!641543) (not b!641360) (not d!90437) (not b!641541) (not b!641552) (not d!90423) (not b!641526) (not d!90441) (not b!641352) (not b!641545) (not b!641378) (not b!641342) (not d!90413))
(check-sat)
