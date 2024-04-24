; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57144 () Bool)

(assert start!57144)

(declare-fun b!632111 () Bool)

(declare-fun res!408688 () Bool)

(declare-fun e!361414 () Bool)

(assert (=> b!632111 (=> (not res!408688) (not e!361414))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!632111 (= res!408688 (validKeyInArray!0 k0!1786))))

(declare-fun b!632112 () Bool)

(declare-fun res!408687 () Bool)

(assert (=> b!632112 (=> (not res!408687) (not e!361414))))

(declare-datatypes ((array!38106 0))(
  ( (array!38107 (arr!18283 (Array (_ BitVec 32) (_ BitVec 64))) (size!18647 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38106)

(declare-fun arrayContainsKey!0 (array!38106 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!632112 (= res!408687 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!632113 () Bool)

(declare-datatypes ((Unit!21225 0))(
  ( (Unit!21226) )
))
(declare-fun e!361419 () Unit!21225)

(declare-fun Unit!21227 () Unit!21225)

(assert (=> b!632113 (= e!361419 Unit!21227)))

(declare-fun res!408683 () Bool)

(assert (=> start!57144 (=> (not res!408683) (not e!361414))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57144 (= res!408683 (validMask!0 mask!3053))))

(assert (=> start!57144 e!361414))

(assert (=> start!57144 true))

(declare-fun array_inv!14142 (array!38106) Bool)

(assert (=> start!57144 (array_inv!14142 a!2986)))

(declare-fun b!632114 () Bool)

(declare-fun e!361415 () Bool)

(declare-fun e!361418 () Bool)

(assert (=> b!632114 (= e!361415 e!361418)))

(declare-fun res!408676 () Bool)

(assert (=> b!632114 (=> (not res!408676) (not e!361418))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6679 0))(
  ( (MissingZero!6679 (index!29009 (_ BitVec 32))) (Found!6679 (index!29010 (_ BitVec 32))) (Intermediate!6679 (undefined!7491 Bool) (index!29011 (_ BitVec 32)) (x!57901 (_ BitVec 32))) (Undefined!6679) (MissingVacant!6679 (index!29012 (_ BitVec 32))) )
))
(declare-fun lt!292075 () SeekEntryResult!6679)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!632114 (= res!408676 (and (= lt!292075 (Found!6679 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18283 a!2986) index!984) (select (arr!18283 a!2986) j!136))) (not (= (select (arr!18283 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38106 (_ BitVec 32)) SeekEntryResult!6679)

(assert (=> b!632114 (= lt!292075 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18283 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!632115 () Bool)

(declare-fun res!408686 () Bool)

(declare-fun e!361417 () Bool)

(assert (=> b!632115 (=> (not res!408686) (not e!361417))))

(declare-datatypes ((List!12231 0))(
  ( (Nil!12228) (Cons!12227 (h!13275 (_ BitVec 64)) (t!18451 List!12231)) )
))
(declare-fun arrayNoDuplicates!0 (array!38106 (_ BitVec 32) List!12231) Bool)

(assert (=> b!632115 (= res!408686 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12228))))

(declare-fun b!632116 () Bool)

(declare-fun res!408684 () Bool)

(assert (=> b!632116 (=> (not res!408684) (not e!361414))))

(assert (=> b!632116 (= res!408684 (validKeyInArray!0 (select (arr!18283 a!2986) j!136)))))

(declare-fun b!632117 () Bool)

(declare-fun res!408681 () Bool)

(assert (=> b!632117 (=> (not res!408681) (not e!361417))))

(assert (=> b!632117 (= res!408681 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18283 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!632118 () Bool)

(assert (=> b!632118 (= e!361414 e!361417)))

(declare-fun res!408677 () Bool)

(assert (=> b!632118 (=> (not res!408677) (not e!361417))))

(declare-fun lt!292072 () SeekEntryResult!6679)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!632118 (= res!408677 (or (= lt!292072 (MissingZero!6679 i!1108)) (= lt!292072 (MissingVacant!6679 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38106 (_ BitVec 32)) SeekEntryResult!6679)

(assert (=> b!632118 (= lt!292072 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!632119 () Bool)

(declare-fun res!408685 () Bool)

(assert (=> b!632119 (=> (not res!408685) (not e!361414))))

(assert (=> b!632119 (= res!408685 (and (= (size!18647 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18647 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18647 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!632120 () Bool)

(declare-fun e!361413 () Bool)

(assert (=> b!632120 (= e!361413 true)))

(assert (=> b!632120 (= (select (store (arr!18283 a!2986) i!1108 k0!1786) index!984) (select (arr!18283 a!2986) j!136))))

(declare-fun b!632121 () Bool)

(declare-fun res!408678 () Bool)

(assert (=> b!632121 (=> (not res!408678) (not e!361417))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38106 (_ BitVec 32)) Bool)

(assert (=> b!632121 (= res!408678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!632122 () Bool)

(assert (=> b!632122 (= e!361418 (not e!361413))))

(declare-fun res!408679 () Bool)

(assert (=> b!632122 (=> res!408679 e!361413)))

(declare-fun lt!292078 () SeekEntryResult!6679)

(assert (=> b!632122 (= res!408679 (not (= lt!292078 (Found!6679 index!984))))))

(declare-fun lt!292071 () Unit!21225)

(assert (=> b!632122 (= lt!292071 e!361419)))

(declare-fun c!72086 () Bool)

(assert (=> b!632122 (= c!72086 (= lt!292078 Undefined!6679))))

(declare-fun lt!292073 () (_ BitVec 64))

(declare-fun lt!292076 () array!38106)

(assert (=> b!632122 (= lt!292078 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292073 lt!292076 mask!3053))))

(declare-fun e!361412 () Bool)

(assert (=> b!632122 e!361412))

(declare-fun res!408682 () Bool)

(assert (=> b!632122 (=> (not res!408682) (not e!361412))))

(declare-fun lt!292070 () SeekEntryResult!6679)

(declare-fun lt!292077 () (_ BitVec 32))

(assert (=> b!632122 (= res!408682 (= lt!292070 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292077 vacantSpotIndex!68 lt!292073 lt!292076 mask!3053)))))

(assert (=> b!632122 (= lt!292070 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292077 vacantSpotIndex!68 (select (arr!18283 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!632122 (= lt!292073 (select (store (arr!18283 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!292074 () Unit!21225)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38106 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21225)

(assert (=> b!632122 (= lt!292074 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292077 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!632122 (= lt!292077 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!632123 () Bool)

(assert (=> b!632123 (= e!361412 (= lt!292075 lt!292070))))

(declare-fun b!632124 () Bool)

(assert (=> b!632124 (= e!361417 e!361415)))

(declare-fun res!408680 () Bool)

(assert (=> b!632124 (=> (not res!408680) (not e!361415))))

(assert (=> b!632124 (= res!408680 (= (select (store (arr!18283 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!632124 (= lt!292076 (array!38107 (store (arr!18283 a!2986) i!1108 k0!1786) (size!18647 a!2986)))))

(declare-fun b!632125 () Bool)

(declare-fun Unit!21228 () Unit!21225)

(assert (=> b!632125 (= e!361419 Unit!21228)))

(assert (=> b!632125 false))

(assert (= (and start!57144 res!408683) b!632119))

(assert (= (and b!632119 res!408685) b!632116))

(assert (= (and b!632116 res!408684) b!632111))

(assert (= (and b!632111 res!408688) b!632112))

(assert (= (and b!632112 res!408687) b!632118))

(assert (= (and b!632118 res!408677) b!632121))

(assert (= (and b!632121 res!408678) b!632115))

(assert (= (and b!632115 res!408686) b!632117))

(assert (= (and b!632117 res!408681) b!632124))

(assert (= (and b!632124 res!408680) b!632114))

(assert (= (and b!632114 res!408676) b!632122))

(assert (= (and b!632122 res!408682) b!632123))

(assert (= (and b!632122 c!72086) b!632125))

(assert (= (and b!632122 (not c!72086)) b!632113))

(assert (= (and b!632122 (not res!408679)) b!632120))

(declare-fun m!607285 () Bool)

(assert (=> b!632117 m!607285))

(declare-fun m!607287 () Bool)

(assert (=> b!632118 m!607287))

(declare-fun m!607289 () Bool)

(assert (=> b!632114 m!607289))

(declare-fun m!607291 () Bool)

(assert (=> b!632114 m!607291))

(assert (=> b!632114 m!607291))

(declare-fun m!607293 () Bool)

(assert (=> b!632114 m!607293))

(declare-fun m!607295 () Bool)

(assert (=> start!57144 m!607295))

(declare-fun m!607297 () Bool)

(assert (=> start!57144 m!607297))

(assert (=> b!632116 m!607291))

(assert (=> b!632116 m!607291))

(declare-fun m!607299 () Bool)

(assert (=> b!632116 m!607299))

(declare-fun m!607301 () Bool)

(assert (=> b!632112 m!607301))

(declare-fun m!607303 () Bool)

(assert (=> b!632120 m!607303))

(declare-fun m!607305 () Bool)

(assert (=> b!632120 m!607305))

(assert (=> b!632120 m!607291))

(assert (=> b!632124 m!607303))

(declare-fun m!607307 () Bool)

(assert (=> b!632124 m!607307))

(declare-fun m!607309 () Bool)

(assert (=> b!632115 m!607309))

(declare-fun m!607311 () Bool)

(assert (=> b!632111 m!607311))

(declare-fun m!607313 () Bool)

(assert (=> b!632122 m!607313))

(declare-fun m!607315 () Bool)

(assert (=> b!632122 m!607315))

(declare-fun m!607317 () Bool)

(assert (=> b!632122 m!607317))

(assert (=> b!632122 m!607291))

(assert (=> b!632122 m!607303))

(assert (=> b!632122 m!607291))

(declare-fun m!607319 () Bool)

(assert (=> b!632122 m!607319))

(declare-fun m!607321 () Bool)

(assert (=> b!632122 m!607321))

(declare-fun m!607323 () Bool)

(assert (=> b!632122 m!607323))

(declare-fun m!607325 () Bool)

(assert (=> b!632121 m!607325))

(check-sat (not b!632121) (not start!57144) (not b!632122) (not b!632112) (not b!632116) (not b!632114) (not b!632115) (not b!632111) (not b!632118))
(check-sat)
