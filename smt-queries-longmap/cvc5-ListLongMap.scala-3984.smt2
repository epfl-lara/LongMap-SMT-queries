; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53974 () Bool)

(assert start!53974)

(declare-fun b!589503 () Bool)

(declare-fun res!377016 () Bool)

(declare-fun e!336556 () Bool)

(assert (=> b!589503 (=> (not res!377016) (not e!336556))))

(declare-datatypes ((array!36818 0))(
  ( (array!36819 (arr!17682 (Array (_ BitVec 32) (_ BitVec 64))) (size!18046 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36818)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36818 (_ BitVec 32)) Bool)

(assert (=> b!589503 (= res!377016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!377019 () Bool)

(declare-fun e!336551 () Bool)

(assert (=> start!53974 (=> (not res!377019) (not e!336551))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53974 (= res!377019 (validMask!0 mask!3053))))

(assert (=> start!53974 e!336551))

(assert (=> start!53974 true))

(declare-fun array_inv!13478 (array!36818) Bool)

(assert (=> start!53974 (array_inv!13478 a!2986)))

(declare-fun b!589504 () Bool)

(declare-fun res!377018 () Bool)

(assert (=> b!589504 (=> (not res!377018) (not e!336556))))

(declare-datatypes ((List!11723 0))(
  ( (Nil!11720) (Cons!11719 (h!12764 (_ BitVec 64)) (t!17951 List!11723)) )
))
(declare-fun arrayNoDuplicates!0 (array!36818 (_ BitVec 32) List!11723) Bool)

(assert (=> b!589504 (= res!377018 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11720))))

(declare-fun b!589505 () Bool)

(declare-fun res!377021 () Bool)

(assert (=> b!589505 (=> (not res!377021) (not e!336556))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!589505 (= res!377021 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17682 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!589506 () Bool)

(declare-fun e!336554 () Bool)

(declare-fun e!336552 () Bool)

(assert (=> b!589506 (= e!336554 e!336552)))

(declare-fun res!377020 () Bool)

(assert (=> b!589506 (=> (not res!377020) (not e!336552))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6122 0))(
  ( (MissingZero!6122 (index!26718 (_ BitVec 32))) (Found!6122 (index!26719 (_ BitVec 32))) (Intermediate!6122 (undefined!6934 Bool) (index!26720 (_ BitVec 32)) (x!55512 (_ BitVec 32))) (Undefined!6122) (MissingVacant!6122 (index!26721 (_ BitVec 32))) )
))
(declare-fun lt!267378 () SeekEntryResult!6122)

(assert (=> b!589506 (= res!377020 (and (= lt!267378 (Found!6122 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17682 a!2986) index!984) (select (arr!17682 a!2986) j!136))) (not (= (select (arr!17682 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36818 (_ BitVec 32)) SeekEntryResult!6122)

(assert (=> b!589506 (= lt!267378 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17682 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!589507 () Bool)

(declare-fun e!336553 () Bool)

(declare-fun lt!267382 () SeekEntryResult!6122)

(assert (=> b!589507 (= e!336553 (= lt!267378 lt!267382))))

(declare-fun b!589508 () Bool)

(declare-fun res!377010 () Bool)

(assert (=> b!589508 (=> (not res!377010) (not e!336551))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36818 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!589508 (= res!377010 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!589509 () Bool)

(declare-fun res!377011 () Bool)

(assert (=> b!589509 (=> (not res!377011) (not e!336551))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!589509 (= res!377011 (validKeyInArray!0 k!1786))))

(declare-fun b!589510 () Bool)

(declare-datatypes ((Unit!18406 0))(
  ( (Unit!18407) )
))
(declare-fun e!336555 () Unit!18406)

(declare-fun Unit!18408 () Unit!18406)

(assert (=> b!589510 (= e!336555 Unit!18408)))

(assert (=> b!589510 false))

(declare-fun b!589511 () Bool)

(assert (=> b!589511 (= e!336556 e!336554)))

(declare-fun res!377015 () Bool)

(assert (=> b!589511 (=> (not res!377015) (not e!336554))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!589511 (= res!377015 (= (select (store (arr!17682 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!267379 () array!36818)

(assert (=> b!589511 (= lt!267379 (array!36819 (store (arr!17682 a!2986) i!1108 k!1786) (size!18046 a!2986)))))

(declare-fun b!589512 () Bool)

(declare-fun Unit!18409 () Unit!18406)

(assert (=> b!589512 (= e!336555 Unit!18409)))

(declare-fun b!589513 () Bool)

(declare-fun e!336557 () Bool)

(declare-fun lt!267381 () (_ BitVec 64))

(assert (=> b!589513 (= e!336557 (validKeyInArray!0 lt!267381))))

(declare-fun b!589514 () Bool)

(declare-fun res!377009 () Bool)

(assert (=> b!589514 (=> (not res!377009) (not e!336551))))

(assert (=> b!589514 (= res!377009 (and (= (size!18046 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18046 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18046 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!589515 () Bool)

(declare-fun res!377013 () Bool)

(assert (=> b!589515 (=> (not res!377013) (not e!336551))))

(assert (=> b!589515 (= res!377013 (validKeyInArray!0 (select (arr!17682 a!2986) j!136)))))

(declare-fun b!589516 () Bool)

(assert (=> b!589516 (= e!336552 (not e!336557))))

(declare-fun res!377014 () Bool)

(assert (=> b!589516 (=> res!377014 e!336557)))

(assert (=> b!589516 (= res!377014 (bvslt mask!3053 #b00000000000000000000000000000000))))

(declare-fun lt!267377 () Unit!18406)

(assert (=> b!589516 (= lt!267377 e!336555)))

(declare-fun c!66614 () Bool)

(assert (=> b!589516 (= c!66614 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267381 lt!267379 mask!3053) Undefined!6122))))

(assert (=> b!589516 e!336553))

(declare-fun res!377017 () Bool)

(assert (=> b!589516 (=> (not res!377017) (not e!336553))))

(declare-fun lt!267375 () (_ BitVec 32))

(assert (=> b!589516 (= res!377017 (= lt!267382 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267375 vacantSpotIndex!68 lt!267381 lt!267379 mask!3053)))))

(assert (=> b!589516 (= lt!267382 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267375 vacantSpotIndex!68 (select (arr!17682 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!589516 (= lt!267381 (select (store (arr!17682 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!267380 () Unit!18406)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36818 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18406)

(assert (=> b!589516 (= lt!267380 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267375 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!589516 (= lt!267375 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!589517 () Bool)

(assert (=> b!589517 (= e!336551 e!336556)))

(declare-fun res!377012 () Bool)

(assert (=> b!589517 (=> (not res!377012) (not e!336556))))

(declare-fun lt!267376 () SeekEntryResult!6122)

(assert (=> b!589517 (= res!377012 (or (= lt!267376 (MissingZero!6122 i!1108)) (= lt!267376 (MissingVacant!6122 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36818 (_ BitVec 32)) SeekEntryResult!6122)

(assert (=> b!589517 (= lt!267376 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!53974 res!377019) b!589514))

(assert (= (and b!589514 res!377009) b!589515))

(assert (= (and b!589515 res!377013) b!589509))

(assert (= (and b!589509 res!377011) b!589508))

(assert (= (and b!589508 res!377010) b!589517))

(assert (= (and b!589517 res!377012) b!589503))

(assert (= (and b!589503 res!377016) b!589504))

(assert (= (and b!589504 res!377018) b!589505))

(assert (= (and b!589505 res!377021) b!589511))

(assert (= (and b!589511 res!377015) b!589506))

(assert (= (and b!589506 res!377020) b!589516))

(assert (= (and b!589516 res!377017) b!589507))

(assert (= (and b!589516 c!66614) b!589510))

(assert (= (and b!589516 (not c!66614)) b!589512))

(assert (= (and b!589516 (not res!377014)) b!589513))

(declare-fun m!568027 () Bool)

(assert (=> b!589515 m!568027))

(assert (=> b!589515 m!568027))

(declare-fun m!568029 () Bool)

(assert (=> b!589515 m!568029))

(declare-fun m!568031 () Bool)

(assert (=> start!53974 m!568031))

(declare-fun m!568033 () Bool)

(assert (=> start!53974 m!568033))

(declare-fun m!568035 () Bool)

(assert (=> b!589503 m!568035))

(declare-fun m!568037 () Bool)

(assert (=> b!589513 m!568037))

(declare-fun m!568039 () Bool)

(assert (=> b!589511 m!568039))

(declare-fun m!568041 () Bool)

(assert (=> b!589511 m!568041))

(declare-fun m!568043 () Bool)

(assert (=> b!589504 m!568043))

(declare-fun m!568045 () Bool)

(assert (=> b!589506 m!568045))

(assert (=> b!589506 m!568027))

(assert (=> b!589506 m!568027))

(declare-fun m!568047 () Bool)

(assert (=> b!589506 m!568047))

(declare-fun m!568049 () Bool)

(assert (=> b!589516 m!568049))

(declare-fun m!568051 () Bool)

(assert (=> b!589516 m!568051))

(assert (=> b!589516 m!568027))

(assert (=> b!589516 m!568039))

(declare-fun m!568053 () Bool)

(assert (=> b!589516 m!568053))

(declare-fun m!568055 () Bool)

(assert (=> b!589516 m!568055))

(declare-fun m!568057 () Bool)

(assert (=> b!589516 m!568057))

(assert (=> b!589516 m!568027))

(declare-fun m!568059 () Bool)

(assert (=> b!589516 m!568059))

(declare-fun m!568061 () Bool)

(assert (=> b!589508 m!568061))

(declare-fun m!568063 () Bool)

(assert (=> b!589517 m!568063))

(declare-fun m!568065 () Bool)

(assert (=> b!589509 m!568065))

(declare-fun m!568067 () Bool)

(assert (=> b!589505 m!568067))

(push 1)

