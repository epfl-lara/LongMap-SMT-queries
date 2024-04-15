; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53700 () Bool)

(assert start!53700)

(declare-fun b!585507 () Bool)

(declare-fun res!373470 () Bool)

(declare-fun e!334911 () Bool)

(assert (=> b!585507 (=> (not res!373470) (not e!334911))))

(declare-datatypes ((array!36615 0))(
  ( (array!36616 (arr!17582 (Array (_ BitVec 32) (_ BitVec 64))) (size!17947 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36615)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36615 (_ BitVec 32)) Bool)

(assert (=> b!585507 (= res!373470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585508 () Bool)

(declare-fun res!373471 () Bool)

(assert (=> b!585508 (=> (not res!373471) (not e!334911))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!585508 (= res!373471 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17582 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17582 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585509 () Bool)

(declare-fun res!373475 () Bool)

(declare-fun e!334910 () Bool)

(assert (=> b!585509 (=> (not res!373475) (not e!334910))))

(declare-fun arrayContainsKey!0 (array!36615 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585509 (= res!373475 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585510 () Bool)

(declare-fun res!373466 () Bool)

(assert (=> b!585510 (=> (not res!373466) (not e!334911))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6019 0))(
  ( (MissingZero!6019 (index!26303 (_ BitVec 32))) (Found!6019 (index!26304 (_ BitVec 32))) (Intermediate!6019 (undefined!6831 Bool) (index!26305 (_ BitVec 32)) (x!55131 (_ BitVec 32))) (Undefined!6019) (MissingVacant!6019 (index!26306 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36615 (_ BitVec 32)) SeekEntryResult!6019)

(assert (=> b!585510 (= res!373466 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17582 a!2986) j!136) a!2986 mask!3053) (Found!6019 j!136)))))

(declare-fun b!585511 () Bool)

(declare-fun res!373465 () Bool)

(assert (=> b!585511 (=> (not res!373465) (not e!334910))))

(assert (=> b!585511 (= res!373465 (and (= (size!17947 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17947 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17947 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!585512 () Bool)

(declare-fun res!373467 () Bool)

(assert (=> b!585512 (=> (not res!373467) (not e!334911))))

(declare-datatypes ((List!11662 0))(
  ( (Nil!11659) (Cons!11658 (h!12703 (_ BitVec 64)) (t!17881 List!11662)) )
))
(declare-fun arrayNoDuplicates!0 (array!36615 (_ BitVec 32) List!11662) Bool)

(assert (=> b!585512 (= res!373467 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11659))))

(declare-fun b!585514 () Bool)

(declare-fun res!373469 () Bool)

(assert (=> b!585514 (=> (not res!373469) (not e!334910))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585514 (= res!373469 (validKeyInArray!0 (select (arr!17582 a!2986) j!136)))))

(declare-fun b!585515 () Bool)

(assert (=> b!585515 (= e!334910 e!334911)))

(declare-fun res!373473 () Bool)

(assert (=> b!585515 (=> (not res!373473) (not e!334911))))

(declare-fun lt!265681 () SeekEntryResult!6019)

(assert (=> b!585515 (= res!373473 (or (= lt!265681 (MissingZero!6019 i!1108)) (= lt!265681 (MissingVacant!6019 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36615 (_ BitVec 32)) SeekEntryResult!6019)

(assert (=> b!585515 (= lt!265681 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!585516 () Bool)

(assert (=> b!585516 (= e!334911 (not true))))

(declare-fun lt!265679 () (_ BitVec 32))

(assert (=> b!585516 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265679 vacantSpotIndex!68 (select (arr!17582 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265679 vacantSpotIndex!68 (select (store (arr!17582 a!2986) i!1108 k0!1786) j!136) (array!36616 (store (arr!17582 a!2986) i!1108 k0!1786) (size!17947 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18144 0))(
  ( (Unit!18145) )
))
(declare-fun lt!265680 () Unit!18144)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36615 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18144)

(assert (=> b!585516 (= lt!265680 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!265679 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585516 (= lt!265679 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!585517 () Bool)

(declare-fun res!373468 () Bool)

(assert (=> b!585517 (=> (not res!373468) (not e!334911))))

(assert (=> b!585517 (= res!373468 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17582 a!2986) index!984) (select (arr!17582 a!2986) j!136))) (not (= (select (arr!17582 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun res!373472 () Bool)

(assert (=> start!53700 (=> (not res!373472) (not e!334910))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53700 (= res!373472 (validMask!0 mask!3053))))

(assert (=> start!53700 e!334910))

(assert (=> start!53700 true))

(declare-fun array_inv!13465 (array!36615) Bool)

(assert (=> start!53700 (array_inv!13465 a!2986)))

(declare-fun b!585513 () Bool)

(declare-fun res!373474 () Bool)

(assert (=> b!585513 (=> (not res!373474) (not e!334910))))

(assert (=> b!585513 (= res!373474 (validKeyInArray!0 k0!1786))))

(assert (= (and start!53700 res!373472) b!585511))

(assert (= (and b!585511 res!373465) b!585514))

(assert (= (and b!585514 res!373469) b!585513))

(assert (= (and b!585513 res!373474) b!585509))

(assert (= (and b!585509 res!373475) b!585515))

(assert (= (and b!585515 res!373473) b!585507))

(assert (= (and b!585507 res!373470) b!585512))

(assert (= (and b!585512 res!373467) b!585508))

(assert (= (and b!585508 res!373471) b!585510))

(assert (= (and b!585510 res!373466) b!585517))

(assert (= (and b!585517 res!373468) b!585516))

(declare-fun m!563251 () Bool)

(assert (=> b!585514 m!563251))

(assert (=> b!585514 m!563251))

(declare-fun m!563253 () Bool)

(assert (=> b!585514 m!563253))

(declare-fun m!563255 () Bool)

(assert (=> b!585513 m!563255))

(declare-fun m!563257 () Bool)

(assert (=> b!585517 m!563257))

(assert (=> b!585517 m!563251))

(declare-fun m!563259 () Bool)

(assert (=> b!585515 m!563259))

(declare-fun m!563261 () Bool)

(assert (=> b!585507 m!563261))

(declare-fun m!563263 () Bool)

(assert (=> b!585516 m!563263))

(assert (=> b!585516 m!563251))

(assert (=> b!585516 m!563251))

(declare-fun m!563265 () Bool)

(assert (=> b!585516 m!563265))

(declare-fun m!563267 () Bool)

(assert (=> b!585516 m!563267))

(declare-fun m!563269 () Bool)

(assert (=> b!585516 m!563269))

(declare-fun m!563271 () Bool)

(assert (=> b!585516 m!563271))

(declare-fun m!563273 () Bool)

(assert (=> b!585516 m!563273))

(assert (=> b!585516 m!563269))

(declare-fun m!563275 () Bool)

(assert (=> b!585508 m!563275))

(assert (=> b!585508 m!563267))

(declare-fun m!563277 () Bool)

(assert (=> b!585508 m!563277))

(declare-fun m!563279 () Bool)

(assert (=> start!53700 m!563279))

(declare-fun m!563281 () Bool)

(assert (=> start!53700 m!563281))

(declare-fun m!563283 () Bool)

(assert (=> b!585509 m!563283))

(assert (=> b!585510 m!563251))

(assert (=> b!585510 m!563251))

(declare-fun m!563285 () Bool)

(assert (=> b!585510 m!563285))

(declare-fun m!563287 () Bool)

(assert (=> b!585512 m!563287))

(check-sat (not b!585513) (not b!585514) (not b!585515) (not start!53700) (not b!585507) (not b!585516) (not b!585512) (not b!585509) (not b!585510))
(check-sat)
