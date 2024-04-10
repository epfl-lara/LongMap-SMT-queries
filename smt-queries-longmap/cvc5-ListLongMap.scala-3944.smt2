; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53674 () Bool)

(assert start!53674)

(declare-fun b!585042 () Bool)

(declare-fun e!334852 () Bool)

(assert (=> b!585042 (= e!334852 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!265725 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!36575 0))(
  ( (array!36576 (arr!17562 (Array (_ BitVec 32) (_ BitVec 64))) (size!17926 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36575)

(declare-datatypes ((SeekEntryResult!6002 0))(
  ( (MissingZero!6002 (index!26235 (_ BitVec 32))) (Found!6002 (index!26236 (_ BitVec 32))) (Intermediate!6002 (undefined!6814 Bool) (index!26237 (_ BitVec 32)) (x!55063 (_ BitVec 32))) (Undefined!6002) (MissingVacant!6002 (index!26238 (_ BitVec 32))) )
))
(declare-fun lt!265726 () SeekEntryResult!6002)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36575 (_ BitVec 32)) SeekEntryResult!6002)

(assert (=> b!585042 (= lt!265726 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265725 vacantSpotIndex!68 (select (arr!17562 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!585043 () Bool)

(declare-fun res!372860 () Bool)

(declare-fun e!334853 () Bool)

(assert (=> b!585043 (=> (not res!372860) (not e!334853))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!585043 (= res!372860 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17562 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17562 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585044 () Bool)

(declare-fun res!372868 () Bool)

(assert (=> b!585044 (=> (not res!372868) (not e!334853))))

(declare-datatypes ((List!11603 0))(
  ( (Nil!11600) (Cons!11599 (h!12644 (_ BitVec 64)) (t!17831 List!11603)) )
))
(declare-fun arrayNoDuplicates!0 (array!36575 (_ BitVec 32) List!11603) Bool)

(assert (=> b!585044 (= res!372868 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11600))))

(declare-fun b!585045 () Bool)

(declare-fun res!372859 () Bool)

(declare-fun e!334851 () Bool)

(assert (=> b!585045 (=> (not res!372859) (not e!334851))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585045 (= res!372859 (validKeyInArray!0 (select (arr!17562 a!2986) j!136)))))

(declare-fun b!585046 () Bool)

(declare-fun res!372866 () Bool)

(assert (=> b!585046 (=> (not res!372866) (not e!334851))))

(declare-fun arrayContainsKey!0 (array!36575 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585046 (= res!372866 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585047 () Bool)

(assert (=> b!585047 (= e!334853 e!334852)))

(declare-fun res!372858 () Bool)

(assert (=> b!585047 (=> (not res!372858) (not e!334852))))

(assert (=> b!585047 (= res!372858 (and (bvsge lt!265725 #b00000000000000000000000000000000) (bvslt lt!265725 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585047 (= lt!265725 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!585048 () Bool)

(declare-fun res!372869 () Bool)

(assert (=> b!585048 (=> (not res!372869) (not e!334851))))

(assert (=> b!585048 (= res!372869 (validKeyInArray!0 k!1786))))

(declare-fun b!585049 () Bool)

(declare-fun res!372867 () Bool)

(assert (=> b!585049 (=> (not res!372867) (not e!334851))))

(assert (=> b!585049 (= res!372867 (and (= (size!17926 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17926 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17926 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!585050 () Bool)

(declare-fun res!372863 () Bool)

(assert (=> b!585050 (=> (not res!372863) (not e!334853))))

(assert (=> b!585050 (= res!372863 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17562 a!2986) index!984) (select (arr!17562 a!2986) j!136))) (not (= (select (arr!17562 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun res!372865 () Bool)

(assert (=> start!53674 (=> (not res!372865) (not e!334851))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53674 (= res!372865 (validMask!0 mask!3053))))

(assert (=> start!53674 e!334851))

(assert (=> start!53674 true))

(declare-fun array_inv!13358 (array!36575) Bool)

(assert (=> start!53674 (array_inv!13358 a!2986)))

(declare-fun b!585051 () Bool)

(declare-fun res!372861 () Bool)

(assert (=> b!585051 (=> (not res!372861) (not e!334853))))

(assert (=> b!585051 (= res!372861 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17562 a!2986) j!136) a!2986 mask!3053) (Found!6002 j!136)))))

(declare-fun b!585052 () Bool)

(assert (=> b!585052 (= e!334851 e!334853)))

(declare-fun res!372864 () Bool)

(assert (=> b!585052 (=> (not res!372864) (not e!334853))))

(declare-fun lt!265724 () SeekEntryResult!6002)

(assert (=> b!585052 (= res!372864 (or (= lt!265724 (MissingZero!6002 i!1108)) (= lt!265724 (MissingVacant!6002 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36575 (_ BitVec 32)) SeekEntryResult!6002)

(assert (=> b!585052 (= lt!265724 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!585053 () Bool)

(declare-fun res!372862 () Bool)

(assert (=> b!585053 (=> (not res!372862) (not e!334853))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36575 (_ BitVec 32)) Bool)

(assert (=> b!585053 (= res!372862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53674 res!372865) b!585049))

(assert (= (and b!585049 res!372867) b!585045))

(assert (= (and b!585045 res!372859) b!585048))

(assert (= (and b!585048 res!372869) b!585046))

(assert (= (and b!585046 res!372866) b!585052))

(assert (= (and b!585052 res!372864) b!585053))

(assert (= (and b!585053 res!372862) b!585044))

(assert (= (and b!585044 res!372868) b!585043))

(assert (= (and b!585043 res!372860) b!585051))

(assert (= (and b!585051 res!372861) b!585050))

(assert (= (and b!585050 res!372863) b!585047))

(assert (= (and b!585047 res!372858) b!585042))

(declare-fun m!563329 () Bool)

(assert (=> b!585051 m!563329))

(assert (=> b!585051 m!563329))

(declare-fun m!563331 () Bool)

(assert (=> b!585051 m!563331))

(declare-fun m!563333 () Bool)

(assert (=> b!585043 m!563333))

(declare-fun m!563335 () Bool)

(assert (=> b!585043 m!563335))

(declare-fun m!563337 () Bool)

(assert (=> b!585043 m!563337))

(declare-fun m!563339 () Bool)

(assert (=> b!585047 m!563339))

(declare-fun m!563341 () Bool)

(assert (=> b!585046 m!563341))

(declare-fun m!563343 () Bool)

(assert (=> b!585052 m!563343))

(declare-fun m!563345 () Bool)

(assert (=> b!585053 m!563345))

(declare-fun m!563347 () Bool)

(assert (=> b!585048 m!563347))

(declare-fun m!563349 () Bool)

(assert (=> b!585044 m!563349))

(assert (=> b!585042 m!563329))

(assert (=> b!585042 m!563329))

(declare-fun m!563351 () Bool)

(assert (=> b!585042 m!563351))

(assert (=> b!585045 m!563329))

(assert (=> b!585045 m!563329))

(declare-fun m!563353 () Bool)

(assert (=> b!585045 m!563353))

(declare-fun m!563355 () Bool)

(assert (=> start!53674 m!563355))

(declare-fun m!563357 () Bool)

(assert (=> start!53674 m!563357))

(declare-fun m!563359 () Bool)

(assert (=> b!585050 m!563359))

(assert (=> b!585050 m!563329))

(push 1)

