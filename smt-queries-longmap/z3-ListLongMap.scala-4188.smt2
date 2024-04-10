; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57106 () Bool)

(assert start!57106)

(declare-fun b!632217 () Bool)

(declare-fun res!408845 () Bool)

(declare-fun e!361457 () Bool)

(assert (=> b!632217 (=> (not res!408845) (not e!361457))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!632217 (= res!408845 (validKeyInArray!0 k0!1786))))

(declare-fun b!632218 () Bool)

(declare-fun res!408846 () Bool)

(declare-fun e!361455 () Bool)

(assert (=> b!632218 (=> (not res!408846) (not e!361455))))

(declare-datatypes ((array!38125 0))(
  ( (array!38126 (arr!18295 (Array (_ BitVec 32) (_ BitVec 64))) (size!18659 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38125)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38125 (_ BitVec 32)) Bool)

(assert (=> b!632218 (= res!408846 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!632219 () Bool)

(declare-fun e!361458 () Bool)

(assert (=> b!632219 (= e!361458 true)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!632219 (= (select (store (arr!18295 a!2986) i!1108 k0!1786) index!984) (select (arr!18295 a!2986) j!136))))

(declare-fun b!632220 () Bool)

(declare-fun e!361456 () Bool)

(declare-datatypes ((SeekEntryResult!6735 0))(
  ( (MissingZero!6735 (index!29233 (_ BitVec 32))) (Found!6735 (index!29234 (_ BitVec 32))) (Intermediate!6735 (undefined!7547 Bool) (index!29235 (_ BitVec 32)) (x!57970 (_ BitVec 32))) (Undefined!6735) (MissingVacant!6735 (index!29236 (_ BitVec 32))) )
))
(declare-fun lt!292161 () SeekEntryResult!6735)

(declare-fun lt!292164 () SeekEntryResult!6735)

(assert (=> b!632220 (= e!361456 (= lt!292161 lt!292164))))

(declare-fun b!632221 () Bool)

(declare-fun res!408847 () Bool)

(assert (=> b!632221 (=> (not res!408847) (not e!361457))))

(declare-fun arrayContainsKey!0 (array!38125 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!632221 (= res!408847 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!408852 () Bool)

(assert (=> start!57106 (=> (not res!408852) (not e!361457))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57106 (= res!408852 (validMask!0 mask!3053))))

(assert (=> start!57106 e!361457))

(assert (=> start!57106 true))

(declare-fun array_inv!14091 (array!38125) Bool)

(assert (=> start!57106 (array_inv!14091 a!2986)))

(declare-fun b!632222 () Bool)

(declare-fun res!408856 () Bool)

(assert (=> b!632222 (=> (not res!408856) (not e!361455))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!632222 (= res!408856 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18295 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!632223 () Bool)

(declare-datatypes ((Unit!21274 0))(
  ( (Unit!21275) )
))
(declare-fun e!361451 () Unit!21274)

(declare-fun Unit!21276 () Unit!21274)

(assert (=> b!632223 (= e!361451 Unit!21276)))

(assert (=> b!632223 false))

(declare-fun b!632224 () Bool)

(assert (=> b!632224 (= e!361457 e!361455)))

(declare-fun res!408849 () Bool)

(assert (=> b!632224 (=> (not res!408849) (not e!361455))))

(declare-fun lt!292160 () SeekEntryResult!6735)

(assert (=> b!632224 (= res!408849 (or (= lt!292160 (MissingZero!6735 i!1108)) (= lt!292160 (MissingVacant!6735 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38125 (_ BitVec 32)) SeekEntryResult!6735)

(assert (=> b!632224 (= lt!292160 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!632225 () Bool)

(declare-fun e!361453 () Bool)

(assert (=> b!632225 (= e!361455 e!361453)))

(declare-fun res!408857 () Bool)

(assert (=> b!632225 (=> (not res!408857) (not e!361453))))

(assert (=> b!632225 (= res!408857 (= (select (store (arr!18295 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!292162 () array!38125)

(assert (=> b!632225 (= lt!292162 (array!38126 (store (arr!18295 a!2986) i!1108 k0!1786) (size!18659 a!2986)))))

(declare-fun b!632226 () Bool)

(declare-fun res!408850 () Bool)

(assert (=> b!632226 (=> (not res!408850) (not e!361455))))

(declare-datatypes ((List!12336 0))(
  ( (Nil!12333) (Cons!12332 (h!13377 (_ BitVec 64)) (t!18564 List!12336)) )
))
(declare-fun arrayNoDuplicates!0 (array!38125 (_ BitVec 32) List!12336) Bool)

(assert (=> b!632226 (= res!408850 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12333))))

(declare-fun b!632227 () Bool)

(declare-fun res!408853 () Bool)

(assert (=> b!632227 (=> (not res!408853) (not e!361457))))

(assert (=> b!632227 (= res!408853 (and (= (size!18659 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18659 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18659 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!632228 () Bool)

(declare-fun Unit!21277 () Unit!21274)

(assert (=> b!632228 (= e!361451 Unit!21277)))

(declare-fun b!632229 () Bool)

(declare-fun e!361452 () Bool)

(assert (=> b!632229 (= e!361452 (not e!361458))))

(declare-fun res!408855 () Bool)

(assert (=> b!632229 (=> res!408855 e!361458)))

(declare-fun lt!292157 () SeekEntryResult!6735)

(assert (=> b!632229 (= res!408855 (not (= lt!292157 (Found!6735 index!984))))))

(declare-fun lt!292163 () Unit!21274)

(assert (=> b!632229 (= lt!292163 e!361451)))

(declare-fun c!72053 () Bool)

(assert (=> b!632229 (= c!72053 (= lt!292157 Undefined!6735))))

(declare-fun lt!292165 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38125 (_ BitVec 32)) SeekEntryResult!6735)

(assert (=> b!632229 (= lt!292157 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292165 lt!292162 mask!3053))))

(assert (=> b!632229 e!361456))

(declare-fun res!408851 () Bool)

(assert (=> b!632229 (=> (not res!408851) (not e!361456))))

(declare-fun lt!292159 () (_ BitVec 32))

(assert (=> b!632229 (= res!408851 (= lt!292164 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292159 vacantSpotIndex!68 lt!292165 lt!292162 mask!3053)))))

(assert (=> b!632229 (= lt!292164 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292159 vacantSpotIndex!68 (select (arr!18295 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!632229 (= lt!292165 (select (store (arr!18295 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!292158 () Unit!21274)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38125 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21274)

(assert (=> b!632229 (= lt!292158 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292159 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!632229 (= lt!292159 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!632230 () Bool)

(assert (=> b!632230 (= e!361453 e!361452)))

(declare-fun res!408848 () Bool)

(assert (=> b!632230 (=> (not res!408848) (not e!361452))))

(assert (=> b!632230 (= res!408848 (and (= lt!292161 (Found!6735 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18295 a!2986) index!984) (select (arr!18295 a!2986) j!136))) (not (= (select (arr!18295 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!632230 (= lt!292161 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18295 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!632231 () Bool)

(declare-fun res!408854 () Bool)

(assert (=> b!632231 (=> (not res!408854) (not e!361457))))

(assert (=> b!632231 (= res!408854 (validKeyInArray!0 (select (arr!18295 a!2986) j!136)))))

(assert (= (and start!57106 res!408852) b!632227))

(assert (= (and b!632227 res!408853) b!632231))

(assert (= (and b!632231 res!408854) b!632217))

(assert (= (and b!632217 res!408845) b!632221))

(assert (= (and b!632221 res!408847) b!632224))

(assert (= (and b!632224 res!408849) b!632218))

(assert (= (and b!632218 res!408846) b!632226))

(assert (= (and b!632226 res!408850) b!632222))

(assert (= (and b!632222 res!408856) b!632225))

(assert (= (and b!632225 res!408857) b!632230))

(assert (= (and b!632230 res!408848) b!632229))

(assert (= (and b!632229 res!408851) b!632220))

(assert (= (and b!632229 c!72053) b!632223))

(assert (= (and b!632229 (not c!72053)) b!632228))

(assert (= (and b!632229 (not res!408855)) b!632219))

(declare-fun m!607059 () Bool)

(assert (=> b!632225 m!607059))

(declare-fun m!607061 () Bool)

(assert (=> b!632225 m!607061))

(declare-fun m!607063 () Bool)

(assert (=> b!632231 m!607063))

(assert (=> b!632231 m!607063))

(declare-fun m!607065 () Bool)

(assert (=> b!632231 m!607065))

(declare-fun m!607067 () Bool)

(assert (=> b!632218 m!607067))

(declare-fun m!607069 () Bool)

(assert (=> b!632222 m!607069))

(assert (=> b!632219 m!607059))

(declare-fun m!607071 () Bool)

(assert (=> b!632219 m!607071))

(assert (=> b!632219 m!607063))

(declare-fun m!607073 () Bool)

(assert (=> b!632217 m!607073))

(declare-fun m!607075 () Bool)

(assert (=> b!632230 m!607075))

(assert (=> b!632230 m!607063))

(assert (=> b!632230 m!607063))

(declare-fun m!607077 () Bool)

(assert (=> b!632230 m!607077))

(declare-fun m!607079 () Bool)

(assert (=> b!632224 m!607079))

(declare-fun m!607081 () Bool)

(assert (=> start!57106 m!607081))

(declare-fun m!607083 () Bool)

(assert (=> start!57106 m!607083))

(declare-fun m!607085 () Bool)

(assert (=> b!632229 m!607085))

(declare-fun m!607087 () Bool)

(assert (=> b!632229 m!607087))

(assert (=> b!632229 m!607063))

(assert (=> b!632229 m!607063))

(declare-fun m!607089 () Bool)

(assert (=> b!632229 m!607089))

(declare-fun m!607091 () Bool)

(assert (=> b!632229 m!607091))

(declare-fun m!607093 () Bool)

(assert (=> b!632229 m!607093))

(declare-fun m!607095 () Bool)

(assert (=> b!632229 m!607095))

(assert (=> b!632229 m!607059))

(declare-fun m!607097 () Bool)

(assert (=> b!632226 m!607097))

(declare-fun m!607099 () Bool)

(assert (=> b!632221 m!607099))

(check-sat (not b!632217) (not b!632224) (not b!632218) (not b!632229) (not start!57106) (not b!632221) (not b!632230) (not b!632226) (not b!632231))
(check-sat)
