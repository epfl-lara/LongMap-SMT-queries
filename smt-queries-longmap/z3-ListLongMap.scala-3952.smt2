; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53772 () Bool)

(assert start!53772)

(declare-fun b!586086 () Bool)

(declare-fun e!335240 () Bool)

(declare-fun e!335241 () Bool)

(assert (=> b!586086 (= e!335240 e!335241)))

(declare-fun res!373797 () Bool)

(assert (=> b!586086 (=> (not res!373797) (not e!335241))))

(declare-datatypes ((SeekEntryResult!5977 0))(
  ( (MissingZero!5977 (index!26135 (_ BitVec 32))) (Found!5977 (index!26136 (_ BitVec 32))) (Intermediate!5977 (undefined!6789 Bool) (index!26137 (_ BitVec 32)) (x!55105 (_ BitVec 32))) (Undefined!5977) (MissingVacant!5977 (index!26138 (_ BitVec 32))) )
))
(declare-fun lt!266042 () SeekEntryResult!5977)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!586086 (= res!373797 (or (= lt!266042 (MissingZero!5977 i!1108)) (= lt!266042 (MissingVacant!5977 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36618 0))(
  ( (array!36619 (arr!17581 (Array (_ BitVec 32) (_ BitVec 64))) (size!17945 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36618)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36618 (_ BitVec 32)) SeekEntryResult!5977)

(assert (=> b!586086 (= lt!266042 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!586087 () Bool)

(declare-fun res!373807 () Bool)

(assert (=> b!586087 (=> (not res!373807) (not e!335240))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!586087 (= res!373807 (and (= (size!17945 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17945 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17945 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586088 () Bool)

(declare-fun res!373800 () Bool)

(assert (=> b!586088 (=> (not res!373800) (not e!335241))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36618 (_ BitVec 32)) Bool)

(assert (=> b!586088 (= res!373800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586089 () Bool)

(declare-fun res!373798 () Bool)

(assert (=> b!586089 (=> (not res!373798) (not e!335241))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!586089 (= res!373798 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17581 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17581 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586090 () Bool)

(declare-fun res!373801 () Bool)

(assert (=> b!586090 (=> (not res!373801) (not e!335241))))

(assert (=> b!586090 (= res!373801 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17581 a!2986) index!984) (select (arr!17581 a!2986) j!136))) (not (= (select (arr!17581 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!586091 () Bool)

(declare-fun res!373806 () Bool)

(assert (=> b!586091 (=> (not res!373806) (not e!335240))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586091 (= res!373806 (validKeyInArray!0 k0!1786))))

(declare-fun b!586092 () Bool)

(declare-fun res!373805 () Bool)

(assert (=> b!586092 (=> (not res!373805) (not e!335241))))

(declare-datatypes ((List!11529 0))(
  ( (Nil!11526) (Cons!11525 (h!12573 (_ BitVec 64)) (t!17749 List!11529)) )
))
(declare-fun arrayNoDuplicates!0 (array!36618 (_ BitVec 32) List!11529) Bool)

(assert (=> b!586092 (= res!373805 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11526))))

(declare-fun res!373804 () Bool)

(assert (=> start!53772 (=> (not res!373804) (not e!335240))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53772 (= res!373804 (validMask!0 mask!3053))))

(assert (=> start!53772 e!335240))

(assert (=> start!53772 true))

(declare-fun array_inv!13440 (array!36618) Bool)

(assert (=> start!53772 (array_inv!13440 a!2986)))

(declare-fun b!586093 () Bool)

(declare-fun res!373799 () Bool)

(assert (=> b!586093 (=> (not res!373799) (not e!335240))))

(declare-fun arrayContainsKey!0 (array!36618 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586093 (= res!373799 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586094 () Bool)

(assert (=> b!586094 (= e!335241 (not true))))

(declare-fun lt!266044 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36618 (_ BitVec 32)) SeekEntryResult!5977)

(assert (=> b!586094 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266044 vacantSpotIndex!68 (select (arr!17581 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266044 vacantSpotIndex!68 (select (store (arr!17581 a!2986) i!1108 k0!1786) j!136) (array!36619 (store (arr!17581 a!2986) i!1108 k0!1786) (size!17945 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18151 0))(
  ( (Unit!18152) )
))
(declare-fun lt!266043 () Unit!18151)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36618 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18151)

(assert (=> b!586094 (= lt!266043 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266044 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586094 (= lt!266044 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!586095 () Bool)

(declare-fun res!373802 () Bool)

(assert (=> b!586095 (=> (not res!373802) (not e!335240))))

(assert (=> b!586095 (= res!373802 (validKeyInArray!0 (select (arr!17581 a!2986) j!136)))))

(declare-fun b!586096 () Bool)

(declare-fun res!373803 () Bool)

(assert (=> b!586096 (=> (not res!373803) (not e!335241))))

(assert (=> b!586096 (= res!373803 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17581 a!2986) j!136) a!2986 mask!3053) (Found!5977 j!136)))))

(assert (= (and start!53772 res!373804) b!586087))

(assert (= (and b!586087 res!373807) b!586095))

(assert (= (and b!586095 res!373802) b!586091))

(assert (= (and b!586091 res!373806) b!586093))

(assert (= (and b!586093 res!373799) b!586086))

(assert (= (and b!586086 res!373797) b!586088))

(assert (= (and b!586088 res!373800) b!586092))

(assert (= (and b!586092 res!373805) b!586089))

(assert (= (and b!586089 res!373798) b!586096))

(assert (= (and b!586096 res!373803) b!586090))

(assert (= (and b!586090 res!373801) b!586094))

(declare-fun m!564509 () Bool)

(assert (=> b!586086 m!564509))

(declare-fun m!564511 () Bool)

(assert (=> b!586096 m!564511))

(assert (=> b!586096 m!564511))

(declare-fun m!564513 () Bool)

(assert (=> b!586096 m!564513))

(declare-fun m!564515 () Bool)

(assert (=> b!586092 m!564515))

(declare-fun m!564517 () Bool)

(assert (=> b!586091 m!564517))

(declare-fun m!564519 () Bool)

(assert (=> b!586094 m!564519))

(declare-fun m!564521 () Bool)

(assert (=> b!586094 m!564521))

(assert (=> b!586094 m!564511))

(declare-fun m!564523 () Bool)

(assert (=> b!586094 m!564523))

(assert (=> b!586094 m!564511))

(declare-fun m!564525 () Bool)

(assert (=> b!586094 m!564525))

(declare-fun m!564527 () Bool)

(assert (=> b!586094 m!564527))

(assert (=> b!586094 m!564521))

(declare-fun m!564529 () Bool)

(assert (=> b!586094 m!564529))

(declare-fun m!564531 () Bool)

(assert (=> start!53772 m!564531))

(declare-fun m!564533 () Bool)

(assert (=> start!53772 m!564533))

(declare-fun m!564535 () Bool)

(assert (=> b!586090 m!564535))

(assert (=> b!586090 m!564511))

(assert (=> b!586095 m!564511))

(assert (=> b!586095 m!564511))

(declare-fun m!564537 () Bool)

(assert (=> b!586095 m!564537))

(declare-fun m!564539 () Bool)

(assert (=> b!586089 m!564539))

(assert (=> b!586089 m!564523))

(declare-fun m!564541 () Bool)

(assert (=> b!586089 m!564541))

(declare-fun m!564543 () Bool)

(assert (=> b!586088 m!564543))

(declare-fun m!564545 () Bool)

(assert (=> b!586093 m!564545))

(check-sat (not b!586096) (not start!53772) (not b!586092) (not b!586093) (not b!586088) (not b!586091) (not b!586086) (not b!586094) (not b!586095))
(check-sat)
