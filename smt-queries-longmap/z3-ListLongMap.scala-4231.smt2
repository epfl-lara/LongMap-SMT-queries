; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58380 () Bool)

(assert start!58380)

(declare-fun b!644091 () Bool)

(declare-fun res!417154 () Bool)

(declare-fun e!369003 () Bool)

(assert (=> b!644091 (=> (not res!417154) (not e!369003))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!644091 (= res!417154 (validKeyInArray!0 k0!1786))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!644092 () Bool)

(declare-fun e!368997 () Bool)

(declare-datatypes ((array!38415 0))(
  ( (array!38416 (arr!18418 (Array (_ BitVec 32) (_ BitVec 64))) (size!18782 (_ BitVec 32))) )
))
(declare-fun lt!298440 () array!38415)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38415)

(declare-fun arrayContainsKey!0 (array!38415 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!644092 (= e!368997 (arrayContainsKey!0 lt!298440 (select (arr!18418 a!2986) j!136) index!984))))

(declare-fun b!644093 () Bool)

(declare-fun e!369000 () Bool)

(declare-datatypes ((SeekEntryResult!6814 0))(
  ( (MissingZero!6814 (index!29588 (_ BitVec 32))) (Found!6814 (index!29589 (_ BitVec 32))) (Intermediate!6814 (undefined!7626 Bool) (index!29590 (_ BitVec 32)) (x!58513 (_ BitVec 32))) (Undefined!6814) (MissingVacant!6814 (index!29591 (_ BitVec 32))) )
))
(declare-fun lt!298444 () SeekEntryResult!6814)

(declare-fun lt!298438 () SeekEntryResult!6814)

(assert (=> b!644093 (= e!369000 (= lt!298444 lt!298438))))

(declare-fun b!644094 () Bool)

(declare-fun e!368998 () Bool)

(declare-fun e!368993 () Bool)

(assert (=> b!644094 (= e!368998 e!368993)))

(declare-fun res!417157 () Bool)

(assert (=> b!644094 (=> (not res!417157) (not e!368993))))

(assert (=> b!644094 (= res!417157 (arrayContainsKey!0 lt!298440 (select (arr!18418 a!2986) j!136) j!136))))

(declare-fun b!644096 () Bool)

(declare-fun e!368999 () Bool)

(assert (=> b!644096 (= e!368999 true)))

(assert (=> b!644096 e!368997))

(declare-fun res!417153 () Bool)

(assert (=> b!644096 (=> (not res!417153) (not e!368997))))

(assert (=> b!644096 (= res!417153 (arrayContainsKey!0 lt!298440 (select (arr!18418 a!2986) j!136) j!136))))

(declare-fun b!644097 () Bool)

(declare-fun e!368994 () Bool)

(declare-fun e!368996 () Bool)

(assert (=> b!644097 (= e!368994 e!368996)))

(declare-fun res!417148 () Bool)

(assert (=> b!644097 (=> (not res!417148) (not e!368996))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!644097 (= res!417148 (= (select (store (arr!18418 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!644097 (= lt!298440 (array!38416 (store (arr!18418 a!2986) i!1108 k0!1786) (size!18782 a!2986)))))

(declare-fun b!644098 () Bool)

(declare-fun e!369005 () Bool)

(assert (=> b!644098 (= e!369005 e!368998)))

(declare-fun res!417162 () Bool)

(assert (=> b!644098 (=> res!417162 e!368998)))

(declare-fun lt!298434 () (_ BitVec 64))

(declare-fun lt!298431 () (_ BitVec 64))

(assert (=> b!644098 (= res!417162 (or (not (= (select (arr!18418 a!2986) j!136) lt!298431)) (not (= (select (arr!18418 a!2986) j!136) lt!298434)) (bvsge j!136 index!984)))))

(declare-fun b!644099 () Bool)

(declare-datatypes ((Unit!21783 0))(
  ( (Unit!21784) )
))
(declare-fun e!369002 () Unit!21783)

(declare-fun Unit!21785 () Unit!21783)

(assert (=> b!644099 (= e!369002 Unit!21785)))

(declare-fun b!644100 () Bool)

(declare-fun res!417161 () Bool)

(assert (=> b!644100 (=> (not res!417161) (not e!369003))))

(assert (=> b!644100 (= res!417161 (validKeyInArray!0 (select (arr!18418 a!2986) j!136)))))

(declare-fun b!644101 () Bool)

(declare-fun e!368992 () Bool)

(assert (=> b!644101 (= e!368996 e!368992)))

(declare-fun res!417160 () Bool)

(assert (=> b!644101 (=> (not res!417160) (not e!368992))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!644101 (= res!417160 (and (= lt!298444 (Found!6814 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18418 a!2986) index!984) (select (arr!18418 a!2986) j!136))) (not (= (select (arr!18418 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38415 (_ BitVec 32)) SeekEntryResult!6814)

(assert (=> b!644101 (= lt!298444 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18418 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!644102 () Bool)

(declare-fun e!369004 () Bool)

(assert (=> b!644102 (= e!368992 (not e!369004))))

(declare-fun res!417152 () Bool)

(assert (=> b!644102 (=> res!417152 e!369004)))

(declare-fun lt!298430 () SeekEntryResult!6814)

(assert (=> b!644102 (= res!417152 (not (= lt!298430 (Found!6814 index!984))))))

(declare-fun lt!298432 () Unit!21783)

(declare-fun e!369001 () Unit!21783)

(assert (=> b!644102 (= lt!298432 e!369001)))

(declare-fun c!73840 () Bool)

(assert (=> b!644102 (= c!73840 (= lt!298430 Undefined!6814))))

(assert (=> b!644102 (= lt!298430 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!298431 lt!298440 mask!3053))))

(assert (=> b!644102 e!369000))

(declare-fun res!417164 () Bool)

(assert (=> b!644102 (=> (not res!417164) (not e!369000))))

(declare-fun lt!298433 () (_ BitVec 32))

(assert (=> b!644102 (= res!417164 (= lt!298438 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298433 vacantSpotIndex!68 lt!298431 lt!298440 mask!3053)))))

(assert (=> b!644102 (= lt!298438 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298433 vacantSpotIndex!68 (select (arr!18418 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!644102 (= lt!298431 (select (store (arr!18418 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!298439 () Unit!21783)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38415 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21783)

(assert (=> b!644102 (= lt!298439 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!298433 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!644102 (= lt!298433 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!644103 () Bool)

(declare-fun res!417150 () Bool)

(assert (=> b!644103 (=> (not res!417150) (not e!369003))))

(assert (=> b!644103 (= res!417150 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!644104 () Bool)

(declare-fun res!417158 () Bool)

(assert (=> b!644104 (=> (not res!417158) (not e!368994))))

(assert (=> b!644104 (= res!417158 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18418 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!644105 () Bool)

(declare-fun Unit!21786 () Unit!21783)

(assert (=> b!644105 (= e!369001 Unit!21786)))

(declare-fun b!644106 () Bool)

(declare-fun res!417159 () Bool)

(assert (=> b!644106 (=> (not res!417159) (not e!368994))))

(declare-datatypes ((List!12366 0))(
  ( (Nil!12363) (Cons!12362 (h!13410 (_ BitVec 64)) (t!18586 List!12366)) )
))
(declare-fun arrayNoDuplicates!0 (array!38415 (_ BitVec 32) List!12366) Bool)

(assert (=> b!644106 (= res!417159 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12363))))

(declare-fun b!644107 () Bool)

(declare-fun res!417163 () Bool)

(assert (=> b!644107 (=> (not res!417163) (not e!368994))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38415 (_ BitVec 32)) Bool)

(assert (=> b!644107 (= res!417163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!644108 () Bool)

(declare-fun e!368995 () Bool)

(assert (=> b!644108 (= e!369004 e!368995)))

(declare-fun res!417149 () Bool)

(assert (=> b!644108 (=> res!417149 e!368995)))

(assert (=> b!644108 (= res!417149 (or (not (= (select (arr!18418 a!2986) j!136) lt!298431)) (not (= (select (arr!18418 a!2986) j!136) lt!298434))))))

(assert (=> b!644108 e!369005))

(declare-fun res!417151 () Bool)

(assert (=> b!644108 (=> (not res!417151) (not e!369005))))

(assert (=> b!644108 (= res!417151 (= lt!298434 (select (arr!18418 a!2986) j!136)))))

(assert (=> b!644108 (= lt!298434 (select (store (arr!18418 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!644109 () Bool)

(declare-fun Unit!21787 () Unit!21783)

(assert (=> b!644109 (= e!369002 Unit!21787)))

(declare-fun lt!298437 () Unit!21783)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38415 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21783)

(assert (=> b!644109 (= lt!298437 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!298440 (select (arr!18418 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!644109 (arrayContainsKey!0 lt!298440 (select (arr!18418 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!298435 () Unit!21783)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38415 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12366) Unit!21783)

(assert (=> b!644109 (= lt!298435 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12363))))

(assert (=> b!644109 (arrayNoDuplicates!0 lt!298440 #b00000000000000000000000000000000 Nil!12363)))

(declare-fun lt!298442 () Unit!21783)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38415 (_ BitVec 32) (_ BitVec 32)) Unit!21783)

(assert (=> b!644109 (= lt!298442 (lemmaNoDuplicateFromThenFromBigger!0 lt!298440 #b00000000000000000000000000000000 j!136))))

(assert (=> b!644109 (arrayNoDuplicates!0 lt!298440 j!136 Nil!12363)))

(declare-fun lt!298441 () Unit!21783)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38415 (_ BitVec 64) (_ BitVec 32) List!12366) Unit!21783)

(assert (=> b!644109 (= lt!298441 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!298440 (select (arr!18418 a!2986) j!136) j!136 Nil!12363))))

(assert (=> b!644109 false))

(declare-fun res!417165 () Bool)

(assert (=> start!58380 (=> (not res!417165) (not e!369003))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58380 (= res!417165 (validMask!0 mask!3053))))

(assert (=> start!58380 e!369003))

(assert (=> start!58380 true))

(declare-fun array_inv!14277 (array!38415) Bool)

(assert (=> start!58380 (array_inv!14277 a!2986)))

(declare-fun b!644095 () Bool)

(declare-fun Unit!21788 () Unit!21783)

(assert (=> b!644095 (= e!369001 Unit!21788)))

(assert (=> b!644095 false))

(declare-fun b!644110 () Bool)

(declare-fun res!417156 () Bool)

(assert (=> b!644110 (=> (not res!417156) (not e!369003))))

(assert (=> b!644110 (= res!417156 (and (= (size!18782 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18782 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18782 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!644111 () Bool)

(assert (=> b!644111 (= e!368993 (arrayContainsKey!0 lt!298440 (select (arr!18418 a!2986) j!136) index!984))))

(declare-fun b!644112 () Bool)

(assert (=> b!644112 (= e!369003 e!368994)))

(declare-fun res!417166 () Bool)

(assert (=> b!644112 (=> (not res!417166) (not e!368994))))

(declare-fun lt!298436 () SeekEntryResult!6814)

(assert (=> b!644112 (= res!417166 (or (= lt!298436 (MissingZero!6814 i!1108)) (= lt!298436 (MissingVacant!6814 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38415 (_ BitVec 32)) SeekEntryResult!6814)

(assert (=> b!644112 (= lt!298436 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!644113 () Bool)

(assert (=> b!644113 (= e!368995 e!368999)))

(declare-fun res!417155 () Bool)

(assert (=> b!644113 (=> res!417155 e!368999)))

(assert (=> b!644113 (= res!417155 (bvsge index!984 j!136))))

(declare-fun lt!298443 () Unit!21783)

(assert (=> b!644113 (= lt!298443 e!369002)))

(declare-fun c!73841 () Bool)

(assert (=> b!644113 (= c!73841 (bvslt j!136 index!984))))

(assert (= (and start!58380 res!417165) b!644110))

(assert (= (and b!644110 res!417156) b!644100))

(assert (= (and b!644100 res!417161) b!644091))

(assert (= (and b!644091 res!417154) b!644103))

(assert (= (and b!644103 res!417150) b!644112))

(assert (= (and b!644112 res!417166) b!644107))

(assert (= (and b!644107 res!417163) b!644106))

(assert (= (and b!644106 res!417159) b!644104))

(assert (= (and b!644104 res!417158) b!644097))

(assert (= (and b!644097 res!417148) b!644101))

(assert (= (and b!644101 res!417160) b!644102))

(assert (= (and b!644102 res!417164) b!644093))

(assert (= (and b!644102 c!73840) b!644095))

(assert (= (and b!644102 (not c!73840)) b!644105))

(assert (= (and b!644102 (not res!417152)) b!644108))

(assert (= (and b!644108 res!417151) b!644098))

(assert (= (and b!644098 (not res!417162)) b!644094))

(assert (= (and b!644094 res!417157) b!644111))

(assert (= (and b!644108 (not res!417149)) b!644113))

(assert (= (and b!644113 c!73841) b!644109))

(assert (= (and b!644113 (not c!73841)) b!644099))

(assert (= (and b!644113 (not res!417155)) b!644096))

(assert (= (and b!644096 res!417153) b!644092))

(declare-fun m!618175 () Bool)

(assert (=> b!644109 m!618175))

(declare-fun m!618177 () Bool)

(assert (=> b!644109 m!618177))

(assert (=> b!644109 m!618175))

(declare-fun m!618179 () Bool)

(assert (=> b!644109 m!618179))

(assert (=> b!644109 m!618175))

(declare-fun m!618181 () Bool)

(assert (=> b!644109 m!618181))

(declare-fun m!618183 () Bool)

(assert (=> b!644109 m!618183))

(declare-fun m!618185 () Bool)

(assert (=> b!644109 m!618185))

(assert (=> b!644109 m!618175))

(declare-fun m!618187 () Bool)

(assert (=> b!644109 m!618187))

(declare-fun m!618189 () Bool)

(assert (=> b!644109 m!618189))

(declare-fun m!618191 () Bool)

(assert (=> b!644103 m!618191))

(assert (=> b!644111 m!618175))

(assert (=> b!644111 m!618175))

(declare-fun m!618193 () Bool)

(assert (=> b!644111 m!618193))

(declare-fun m!618195 () Bool)

(assert (=> b!644104 m!618195))

(assert (=> b!644108 m!618175))

(declare-fun m!618197 () Bool)

(assert (=> b!644108 m!618197))

(declare-fun m!618199 () Bool)

(assert (=> b!644108 m!618199))

(declare-fun m!618201 () Bool)

(assert (=> b!644091 m!618201))

(assert (=> b!644097 m!618197))

(declare-fun m!618203 () Bool)

(assert (=> b!644097 m!618203))

(declare-fun m!618205 () Bool)

(assert (=> b!644106 m!618205))

(declare-fun m!618207 () Bool)

(assert (=> b!644107 m!618207))

(assert (=> b!644094 m!618175))

(assert (=> b!644094 m!618175))

(declare-fun m!618209 () Bool)

(assert (=> b!644094 m!618209))

(assert (=> b!644098 m!618175))

(declare-fun m!618211 () Bool)

(assert (=> b!644112 m!618211))

(declare-fun m!618213 () Bool)

(assert (=> b!644102 m!618213))

(declare-fun m!618215 () Bool)

(assert (=> b!644102 m!618215))

(assert (=> b!644102 m!618175))

(declare-fun m!618217 () Bool)

(assert (=> b!644102 m!618217))

(assert (=> b!644102 m!618175))

(declare-fun m!618219 () Bool)

(assert (=> b!644102 m!618219))

(assert (=> b!644102 m!618197))

(declare-fun m!618221 () Bool)

(assert (=> b!644102 m!618221))

(declare-fun m!618223 () Bool)

(assert (=> b!644102 m!618223))

(assert (=> b!644092 m!618175))

(assert (=> b!644092 m!618175))

(assert (=> b!644092 m!618193))

(assert (=> b!644100 m!618175))

(assert (=> b!644100 m!618175))

(declare-fun m!618225 () Bool)

(assert (=> b!644100 m!618225))

(declare-fun m!618227 () Bool)

(assert (=> start!58380 m!618227))

(declare-fun m!618229 () Bool)

(assert (=> start!58380 m!618229))

(assert (=> b!644096 m!618175))

(assert (=> b!644096 m!618175))

(assert (=> b!644096 m!618209))

(declare-fun m!618231 () Bool)

(assert (=> b!644101 m!618231))

(assert (=> b!644101 m!618175))

(assert (=> b!644101 m!618175))

(declare-fun m!618233 () Bool)

(assert (=> b!644101 m!618233))

(check-sat (not b!644107) (not b!644109) (not b!644101) (not b!644092) (not b!644106) (not b!644091) (not b!644111) (not b!644094) (not start!58380) (not b!644100) (not b!644112) (not b!644102) (not b!644096) (not b!644103))
(check-sat)
