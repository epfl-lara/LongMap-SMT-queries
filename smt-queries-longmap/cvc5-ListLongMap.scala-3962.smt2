; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53782 () Bool)

(assert start!53782)

(declare-fun b!586867 () Bool)

(declare-fun res!374689 () Bool)

(declare-fun e!335380 () Bool)

(assert (=> b!586867 (=> (not res!374689) (not e!335380))))

(declare-datatypes ((array!36683 0))(
  ( (array!36684 (arr!17616 (Array (_ BitVec 32) (_ BitVec 64))) (size!17980 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36683)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36683 (_ BitVec 32)) Bool)

(assert (=> b!586867 (= res!374689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586868 () Bool)

(declare-fun res!374691 () Bool)

(assert (=> b!586868 (=> (not res!374691) (not e!335380))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6056 0))(
  ( (MissingZero!6056 (index!26451 (_ BitVec 32))) (Found!6056 (index!26452 (_ BitVec 32))) (Intermediate!6056 (undefined!6868 Bool) (index!26453 (_ BitVec 32)) (x!55261 (_ BitVec 32))) (Undefined!6056) (MissingVacant!6056 (index!26454 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36683 (_ BitVec 32)) SeekEntryResult!6056)

(assert (=> b!586868 (= res!374691 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17616 a!2986) j!136) a!2986 mask!3053) (Found!6056 j!136)))))

(declare-fun b!586869 () Bool)

(declare-fun res!374686 () Bool)

(assert (=> b!586869 (=> (not res!374686) (not e!335380))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!586869 (= res!374686 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17616 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17616 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586870 () Bool)

(declare-fun res!374687 () Bool)

(declare-fun e!335381 () Bool)

(assert (=> b!586870 (=> (not res!374687) (not e!335381))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586870 (= res!374687 (validKeyInArray!0 (select (arr!17616 a!2986) j!136)))))

(declare-fun res!374684 () Bool)

(assert (=> start!53782 (=> (not res!374684) (not e!335381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53782 (= res!374684 (validMask!0 mask!3053))))

(assert (=> start!53782 e!335381))

(assert (=> start!53782 true))

(declare-fun array_inv!13412 (array!36683) Bool)

(assert (=> start!53782 (array_inv!13412 a!2986)))

(declare-fun b!586871 () Bool)

(declare-fun res!374688 () Bool)

(assert (=> b!586871 (=> (not res!374688) (not e!335381))))

(declare-fun arrayContainsKey!0 (array!36683 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586871 (= res!374688 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586872 () Bool)

(declare-fun res!374683 () Bool)

(assert (=> b!586872 (=> (not res!374683) (not e!335380))))

(declare-datatypes ((List!11657 0))(
  ( (Nil!11654) (Cons!11653 (h!12698 (_ BitVec 64)) (t!17885 List!11657)) )
))
(declare-fun arrayNoDuplicates!0 (array!36683 (_ BitVec 32) List!11657) Bool)

(assert (=> b!586872 (= res!374683 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11654))))

(declare-fun b!586873 () Bool)

(declare-fun res!374690 () Bool)

(assert (=> b!586873 (=> (not res!374690) (not e!335381))))

(assert (=> b!586873 (= res!374690 (validKeyInArray!0 k!1786))))

(declare-fun b!586874 () Bool)

(assert (=> b!586874 (= e!335380 (not (bvsge mask!3053 #b00000000000000000000000000000000)))))

(declare-fun lt!266212 () (_ BitVec 32))

(assert (=> b!586874 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266212 vacantSpotIndex!68 (select (arr!17616 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266212 vacantSpotIndex!68 (select (store (arr!17616 a!2986) i!1108 k!1786) j!136) (array!36684 (store (arr!17616 a!2986) i!1108 k!1786) (size!17980 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18232 0))(
  ( (Unit!18233) )
))
(declare-fun lt!266211 () Unit!18232)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36683 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18232)

(assert (=> b!586874 (= lt!266211 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266212 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586874 (= lt!266212 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!586875 () Bool)

(declare-fun res!374693 () Bool)

(assert (=> b!586875 (=> (not res!374693) (not e!335380))))

(assert (=> b!586875 (= res!374693 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17616 a!2986) index!984) (select (arr!17616 a!2986) j!136))) (not (= (select (arr!17616 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!586876 () Bool)

(declare-fun res!374685 () Bool)

(assert (=> b!586876 (=> (not res!374685) (not e!335381))))

(assert (=> b!586876 (= res!374685 (and (= (size!17980 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17980 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17980 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586877 () Bool)

(assert (=> b!586877 (= e!335381 e!335380)))

(declare-fun res!374692 () Bool)

(assert (=> b!586877 (=> (not res!374692) (not e!335380))))

(declare-fun lt!266210 () SeekEntryResult!6056)

(assert (=> b!586877 (= res!374692 (or (= lt!266210 (MissingZero!6056 i!1108)) (= lt!266210 (MissingVacant!6056 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36683 (_ BitVec 32)) SeekEntryResult!6056)

(assert (=> b!586877 (= lt!266210 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!53782 res!374684) b!586876))

(assert (= (and b!586876 res!374685) b!586870))

(assert (= (and b!586870 res!374687) b!586873))

(assert (= (and b!586873 res!374690) b!586871))

(assert (= (and b!586871 res!374688) b!586877))

(assert (= (and b!586877 res!374692) b!586867))

(assert (= (and b!586867 res!374689) b!586872))

(assert (= (and b!586872 res!374683) b!586869))

(assert (= (and b!586869 res!374686) b!586868))

(assert (= (and b!586868 res!374691) b!586875))

(assert (= (and b!586875 res!374693) b!586874))

(declare-fun m!565291 () Bool)

(assert (=> b!586877 m!565291))

(declare-fun m!565293 () Bool)

(assert (=> b!586867 m!565293))

(declare-fun m!565295 () Bool)

(assert (=> b!586868 m!565295))

(assert (=> b!586868 m!565295))

(declare-fun m!565297 () Bool)

(assert (=> b!586868 m!565297))

(declare-fun m!565299 () Bool)

(assert (=> b!586875 m!565299))

(assert (=> b!586875 m!565295))

(declare-fun m!565301 () Bool)

(assert (=> start!53782 m!565301))

(declare-fun m!565303 () Bool)

(assert (=> start!53782 m!565303))

(declare-fun m!565305 () Bool)

(assert (=> b!586869 m!565305))

(declare-fun m!565307 () Bool)

(assert (=> b!586869 m!565307))

(declare-fun m!565309 () Bool)

(assert (=> b!586869 m!565309))

(declare-fun m!565311 () Bool)

(assert (=> b!586874 m!565311))

(declare-fun m!565313 () Bool)

(assert (=> b!586874 m!565313))

(assert (=> b!586874 m!565295))

(assert (=> b!586874 m!565307))

(assert (=> b!586874 m!565295))

(declare-fun m!565315 () Bool)

(assert (=> b!586874 m!565315))

(assert (=> b!586874 m!565313))

(declare-fun m!565317 () Bool)

(assert (=> b!586874 m!565317))

(declare-fun m!565319 () Bool)

(assert (=> b!586874 m!565319))

(declare-fun m!565321 () Bool)

(assert (=> b!586873 m!565321))

(declare-fun m!565323 () Bool)

(assert (=> b!586872 m!565323))

(assert (=> b!586870 m!565295))

(assert (=> b!586870 m!565295))

(declare-fun m!565325 () Bool)

(assert (=> b!586870 m!565325))

(declare-fun m!565327 () Bool)

(assert (=> b!586871 m!565327))

(push 1)

