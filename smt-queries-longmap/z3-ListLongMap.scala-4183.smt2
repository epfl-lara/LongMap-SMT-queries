; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57000 () Bool)

(assert start!57000)

(declare-fun b!630972 () Bool)

(declare-fun e!360744 () Bool)

(assert (=> b!630972 (= e!360744 (not true))))

(declare-datatypes ((Unit!21188 0))(
  ( (Unit!21189) )
))
(declare-fun lt!291397 () Unit!21188)

(declare-fun e!360738 () Unit!21188)

(assert (=> b!630972 (= lt!291397 e!360738)))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!291392 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38088 0))(
  ( (array!38089 (arr!18278 (Array (_ BitVec 32) (_ BitVec 64))) (size!18643 (_ BitVec 32))) )
))
(declare-fun lt!291394 () array!38088)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun c!71835 () Bool)

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6715 0))(
  ( (MissingZero!6715 (index!29150 (_ BitVec 32))) (Found!6715 (index!29151 (_ BitVec 32))) (Intermediate!6715 (undefined!7527 Bool) (index!29152 (_ BitVec 32)) (x!57896 (_ BitVec 32))) (Undefined!6715) (MissingVacant!6715 (index!29153 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38088 (_ BitVec 32)) SeekEntryResult!6715)

(assert (=> b!630972 (= c!71835 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291392 lt!291394 mask!3053) Undefined!6715))))

(declare-fun e!360740 () Bool)

(assert (=> b!630972 e!360740))

(declare-fun res!408039 () Bool)

(assert (=> b!630972 (=> (not res!408039) (not e!360740))))

(declare-fun lt!291396 () SeekEntryResult!6715)

(declare-fun lt!291393 () (_ BitVec 32))

(assert (=> b!630972 (= res!408039 (= lt!291396 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291393 vacantSpotIndex!68 lt!291392 lt!291394 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!38088)

(assert (=> b!630972 (= lt!291396 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291393 vacantSpotIndex!68 (select (arr!18278 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!630972 (= lt!291392 (select (store (arr!18278 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!291390 () Unit!21188)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38088 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21188)

(assert (=> b!630972 (= lt!291390 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291393 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!630972 (= lt!291393 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!630973 () Bool)

(declare-fun res!408036 () Bool)

(declare-fun e!360742 () Bool)

(assert (=> b!630973 (=> (not res!408036) (not e!360742))))

(assert (=> b!630973 (= res!408036 (and (= (size!18643 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18643 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18643 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!630975 () Bool)

(declare-fun Unit!21190 () Unit!21188)

(assert (=> b!630975 (= e!360738 Unit!21190)))

(assert (=> b!630975 false))

(declare-fun b!630976 () Bool)

(declare-fun e!360741 () Bool)

(assert (=> b!630976 (= e!360741 e!360744)))

(declare-fun res!408041 () Bool)

(assert (=> b!630976 (=> (not res!408041) (not e!360744))))

(declare-fun lt!291395 () SeekEntryResult!6715)

(assert (=> b!630976 (= res!408041 (and (= lt!291395 (Found!6715 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18278 a!2986) index!984) (select (arr!18278 a!2986) j!136))) (not (= (select (arr!18278 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!630976 (= lt!291395 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18278 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!630977 () Bool)

(declare-fun e!360739 () Bool)

(assert (=> b!630977 (= e!360742 e!360739)))

(declare-fun res!408042 () Bool)

(assert (=> b!630977 (=> (not res!408042) (not e!360739))))

(declare-fun lt!291391 () SeekEntryResult!6715)

(assert (=> b!630977 (= res!408042 (or (= lt!291391 (MissingZero!6715 i!1108)) (= lt!291391 (MissingVacant!6715 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38088 (_ BitVec 32)) SeekEntryResult!6715)

(assert (=> b!630977 (= lt!291391 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!630978 () Bool)

(declare-fun res!408044 () Bool)

(assert (=> b!630978 (=> (not res!408044) (not e!360742))))

(declare-fun arrayContainsKey!0 (array!38088 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!630978 (= res!408044 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!630979 () Bool)

(declare-fun res!408037 () Bool)

(assert (=> b!630979 (=> (not res!408037) (not e!360739))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38088 (_ BitVec 32)) Bool)

(assert (=> b!630979 (= res!408037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!630980 () Bool)

(declare-fun res!408046 () Bool)

(assert (=> b!630980 (=> (not res!408046) (not e!360742))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!630980 (= res!408046 (validKeyInArray!0 (select (arr!18278 a!2986) j!136)))))

(declare-fun b!630981 () Bool)

(declare-fun Unit!21191 () Unit!21188)

(assert (=> b!630981 (= e!360738 Unit!21191)))

(declare-fun b!630982 () Bool)

(declare-fun res!408043 () Bool)

(assert (=> b!630982 (=> (not res!408043) (not e!360739))))

(assert (=> b!630982 (= res!408043 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18278 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!630983 () Bool)

(assert (=> b!630983 (= e!360740 (= lt!291395 lt!291396))))

(declare-fun res!408047 () Bool)

(assert (=> start!57000 (=> (not res!408047) (not e!360742))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57000 (= res!408047 (validMask!0 mask!3053))))

(assert (=> start!57000 e!360742))

(assert (=> start!57000 true))

(declare-fun array_inv!14161 (array!38088) Bool)

(assert (=> start!57000 (array_inv!14161 a!2986)))

(declare-fun b!630974 () Bool)

(declare-fun res!408038 () Bool)

(assert (=> b!630974 (=> (not res!408038) (not e!360742))))

(assert (=> b!630974 (= res!408038 (validKeyInArray!0 k0!1786))))

(declare-fun b!630984 () Bool)

(declare-fun res!408040 () Bool)

(assert (=> b!630984 (=> (not res!408040) (not e!360739))))

(declare-datatypes ((List!12358 0))(
  ( (Nil!12355) (Cons!12354 (h!13399 (_ BitVec 64)) (t!18577 List!12358)) )
))
(declare-fun arrayNoDuplicates!0 (array!38088 (_ BitVec 32) List!12358) Bool)

(assert (=> b!630984 (= res!408040 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12355))))

(declare-fun b!630985 () Bool)

(assert (=> b!630985 (= e!360739 e!360741)))

(declare-fun res!408045 () Bool)

(assert (=> b!630985 (=> (not res!408045) (not e!360741))))

(assert (=> b!630985 (= res!408045 (= (select (store (arr!18278 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!630985 (= lt!291394 (array!38089 (store (arr!18278 a!2986) i!1108 k0!1786) (size!18643 a!2986)))))

(assert (= (and start!57000 res!408047) b!630973))

(assert (= (and b!630973 res!408036) b!630980))

(assert (= (and b!630980 res!408046) b!630974))

(assert (= (and b!630974 res!408038) b!630978))

(assert (= (and b!630978 res!408044) b!630977))

(assert (= (and b!630977 res!408042) b!630979))

(assert (= (and b!630979 res!408037) b!630984))

(assert (= (and b!630984 res!408040) b!630982))

(assert (= (and b!630982 res!408043) b!630985))

(assert (= (and b!630985 res!408045) b!630976))

(assert (= (and b!630976 res!408041) b!630972))

(assert (= (and b!630972 res!408039) b!630983))

(assert (= (and b!630972 c!71835) b!630975))

(assert (= (and b!630972 (not c!71835)) b!630981))

(declare-fun m!605419 () Bool)

(assert (=> b!630977 m!605419))

(declare-fun m!605421 () Bool)

(assert (=> b!630984 m!605421))

(declare-fun m!605423 () Bool)

(assert (=> start!57000 m!605423))

(declare-fun m!605425 () Bool)

(assert (=> start!57000 m!605425))

(declare-fun m!605427 () Bool)

(assert (=> b!630978 m!605427))

(declare-fun m!605429 () Bool)

(assert (=> b!630985 m!605429))

(declare-fun m!605431 () Bool)

(assert (=> b!630985 m!605431))

(declare-fun m!605433 () Bool)

(assert (=> b!630972 m!605433))

(declare-fun m!605435 () Bool)

(assert (=> b!630972 m!605435))

(declare-fun m!605437 () Bool)

(assert (=> b!630972 m!605437))

(declare-fun m!605439 () Bool)

(assert (=> b!630972 m!605439))

(declare-fun m!605441 () Bool)

(assert (=> b!630972 m!605441))

(assert (=> b!630972 m!605441))

(declare-fun m!605443 () Bool)

(assert (=> b!630972 m!605443))

(declare-fun m!605445 () Bool)

(assert (=> b!630972 m!605445))

(assert (=> b!630972 m!605429))

(declare-fun m!605447 () Bool)

(assert (=> b!630974 m!605447))

(declare-fun m!605449 () Bool)

(assert (=> b!630979 m!605449))

(assert (=> b!630980 m!605441))

(assert (=> b!630980 m!605441))

(declare-fun m!605451 () Bool)

(assert (=> b!630980 m!605451))

(declare-fun m!605453 () Bool)

(assert (=> b!630982 m!605453))

(declare-fun m!605455 () Bool)

(assert (=> b!630976 m!605455))

(assert (=> b!630976 m!605441))

(assert (=> b!630976 m!605441))

(declare-fun m!605457 () Bool)

(assert (=> b!630976 m!605457))

(check-sat (not b!630979) (not b!630978) (not b!630984) (not b!630976) (not b!630972) (not b!630974) (not start!57000) (not b!630980) (not b!630977))
(check-sat)
