; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53966 () Bool)

(assert start!53966)

(declare-fun res!376872 () Bool)

(declare-fun e!336466 () Bool)

(assert (=> start!53966 (=> (not res!376872) (not e!336466))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53966 (= res!376872 (validMask!0 mask!3053))))

(assert (=> start!53966 e!336466))

(assert (=> start!53966 true))

(declare-datatypes ((array!36810 0))(
  ( (array!36811 (arr!17678 (Array (_ BitVec 32) (_ BitVec 64))) (size!18042 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36810)

(declare-fun array_inv!13474 (array!36810) Bool)

(assert (=> start!53966 (array_inv!13474 a!2986)))

(declare-fun b!589333 () Bool)

(declare-fun res!376869 () Bool)

(assert (=> b!589333 (=> (not res!376869) (not e!336466))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!589333 (= res!376869 (and (= (size!18042 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18042 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18042 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!589334 () Bool)

(declare-fun res!376863 () Bool)

(assert (=> b!589334 (=> (not res!376863) (not e!336466))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!589334 (= res!376863 (validKeyInArray!0 k!1786))))

(declare-fun b!589335 () Bool)

(declare-fun res!376874 () Bool)

(declare-fun e!336465 () Bool)

(assert (=> b!589335 (=> (not res!376874) (not e!336465))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!589335 (= res!376874 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17678 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!589336 () Bool)

(declare-fun e!336467 () Bool)

(assert (=> b!589336 (= e!336467 (not true))))

(declare-datatypes ((Unit!18390 0))(
  ( (Unit!18391) )
))
(declare-fun lt!267286 () Unit!18390)

(declare-fun e!336470 () Unit!18390)

(assert (=> b!589336 (= lt!267286 e!336470)))

(declare-fun lt!267279 () (_ BitVec 64))

(declare-fun c!66602 () Bool)

(declare-fun lt!267282 () array!36810)

(declare-datatypes ((SeekEntryResult!6118 0))(
  ( (MissingZero!6118 (index!26702 (_ BitVec 32))) (Found!6118 (index!26703 (_ BitVec 32))) (Intermediate!6118 (undefined!6930 Bool) (index!26704 (_ BitVec 32)) (x!55492 (_ BitVec 32))) (Undefined!6118) (MissingVacant!6118 (index!26705 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36810 (_ BitVec 32)) SeekEntryResult!6118)

(assert (=> b!589336 (= c!66602 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267279 lt!267282 mask!3053) Undefined!6118))))

(declare-fun e!336468 () Bool)

(assert (=> b!589336 e!336468))

(declare-fun res!376866 () Bool)

(assert (=> b!589336 (=> (not res!376866) (not e!336468))))

(declare-fun lt!267285 () (_ BitVec 32))

(declare-fun lt!267283 () SeekEntryResult!6118)

(assert (=> b!589336 (= res!376866 (= lt!267283 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267285 vacantSpotIndex!68 lt!267279 lt!267282 mask!3053)))))

(assert (=> b!589336 (= lt!267283 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267285 vacantSpotIndex!68 (select (arr!17678 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!589336 (= lt!267279 (select (store (arr!17678 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!267281 () Unit!18390)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36810 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18390)

(assert (=> b!589336 (= lt!267281 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267285 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!589336 (= lt!267285 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!589337 () Bool)

(declare-fun e!336469 () Bool)

(assert (=> b!589337 (= e!336465 e!336469)))

(declare-fun res!376870 () Bool)

(assert (=> b!589337 (=> (not res!376870) (not e!336469))))

(assert (=> b!589337 (= res!376870 (= (select (store (arr!17678 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!589337 (= lt!267282 (array!36811 (store (arr!17678 a!2986) i!1108 k!1786) (size!18042 a!2986)))))

(declare-fun b!589338 () Bool)

(assert (=> b!589338 (= e!336469 e!336467)))

(declare-fun res!376864 () Bool)

(assert (=> b!589338 (=> (not res!376864) (not e!336467))))

(declare-fun lt!267280 () SeekEntryResult!6118)

(assert (=> b!589338 (= res!376864 (and (= lt!267280 (Found!6118 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17678 a!2986) index!984) (select (arr!17678 a!2986) j!136))) (not (= (select (arr!17678 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!589338 (= lt!267280 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17678 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!589339 () Bool)

(declare-fun res!376865 () Bool)

(assert (=> b!589339 (=> (not res!376865) (not e!336466))))

(declare-fun arrayContainsKey!0 (array!36810 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!589339 (= res!376865 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!589340 () Bool)

(assert (=> b!589340 (= e!336466 e!336465)))

(declare-fun res!376867 () Bool)

(assert (=> b!589340 (=> (not res!376867) (not e!336465))))

(declare-fun lt!267284 () SeekEntryResult!6118)

(assert (=> b!589340 (= res!376867 (or (= lt!267284 (MissingZero!6118 i!1108)) (= lt!267284 (MissingVacant!6118 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36810 (_ BitVec 32)) SeekEntryResult!6118)

(assert (=> b!589340 (= lt!267284 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!589341 () Bool)

(declare-fun res!376871 () Bool)

(assert (=> b!589341 (=> (not res!376871) (not e!336466))))

(assert (=> b!589341 (= res!376871 (validKeyInArray!0 (select (arr!17678 a!2986) j!136)))))

(declare-fun b!589342 () Bool)

(declare-fun res!376873 () Bool)

(assert (=> b!589342 (=> (not res!376873) (not e!336465))))

(declare-datatypes ((List!11719 0))(
  ( (Nil!11716) (Cons!11715 (h!12760 (_ BitVec 64)) (t!17947 List!11719)) )
))
(declare-fun arrayNoDuplicates!0 (array!36810 (_ BitVec 32) List!11719) Bool)

(assert (=> b!589342 (= res!376873 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11716))))

(declare-fun b!589343 () Bool)

(declare-fun res!376868 () Bool)

(assert (=> b!589343 (=> (not res!376868) (not e!336465))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36810 (_ BitVec 32)) Bool)

(assert (=> b!589343 (= res!376868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!589344 () Bool)

(declare-fun Unit!18392 () Unit!18390)

(assert (=> b!589344 (= e!336470 Unit!18392)))

(assert (=> b!589344 false))

(declare-fun b!589345 () Bool)

(assert (=> b!589345 (= e!336468 (= lt!267280 lt!267283))))

(declare-fun b!589346 () Bool)

(declare-fun Unit!18393 () Unit!18390)

(assert (=> b!589346 (= e!336470 Unit!18393)))

(assert (= (and start!53966 res!376872) b!589333))

(assert (= (and b!589333 res!376869) b!589341))

(assert (= (and b!589341 res!376871) b!589334))

(assert (= (and b!589334 res!376863) b!589339))

(assert (= (and b!589339 res!376865) b!589340))

(assert (= (and b!589340 res!376867) b!589343))

(assert (= (and b!589343 res!376868) b!589342))

(assert (= (and b!589342 res!376873) b!589335))

(assert (= (and b!589335 res!376874) b!589337))

(assert (= (and b!589337 res!376870) b!589338))

(assert (= (and b!589338 res!376864) b!589336))

(assert (= (and b!589336 res!376866) b!589345))

(assert (= (and b!589336 c!66602) b!589344))

(assert (= (and b!589336 (not c!66602)) b!589346))

(declare-fun m!567867 () Bool)

(assert (=> start!53966 m!567867))

(declare-fun m!567869 () Bool)

(assert (=> start!53966 m!567869))

(declare-fun m!567871 () Bool)

(assert (=> b!589339 m!567871))

(declare-fun m!567873 () Bool)

(assert (=> b!589338 m!567873))

(declare-fun m!567875 () Bool)

(assert (=> b!589338 m!567875))

(assert (=> b!589338 m!567875))

(declare-fun m!567877 () Bool)

(assert (=> b!589338 m!567877))

(declare-fun m!567879 () Bool)

(assert (=> b!589335 m!567879))

(declare-fun m!567881 () Bool)

(assert (=> b!589336 m!567881))

(declare-fun m!567883 () Bool)

(assert (=> b!589336 m!567883))

(declare-fun m!567885 () Bool)

(assert (=> b!589336 m!567885))

(declare-fun m!567887 () Bool)

(assert (=> b!589336 m!567887))

(declare-fun m!567889 () Bool)

(assert (=> b!589336 m!567889))

(declare-fun m!567891 () Bool)

(assert (=> b!589336 m!567891))

(assert (=> b!589336 m!567875))

(declare-fun m!567893 () Bool)

(assert (=> b!589336 m!567893))

(assert (=> b!589336 m!567875))

(declare-fun m!567895 () Bool)

(assert (=> b!589343 m!567895))

(assert (=> b!589337 m!567885))

(declare-fun m!567897 () Bool)

(assert (=> b!589337 m!567897))

(declare-fun m!567899 () Bool)

(assert (=> b!589340 m!567899))

(declare-fun m!567901 () Bool)

(assert (=> b!589334 m!567901))

(declare-fun m!567903 () Bool)

(assert (=> b!589342 m!567903))

(assert (=> b!589341 m!567875))

(assert (=> b!589341 m!567875))

(declare-fun m!567905 () Bool)

(assert (=> b!589341 m!567905))

(push 1)

