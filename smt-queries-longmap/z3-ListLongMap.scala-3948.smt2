; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53700 () Bool)

(assert start!53700)

(declare-fun b!585510 () Bool)

(declare-fun e!335007 () Bool)

(assert (=> b!585510 (= e!335007 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!265842 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6015 0))(
  ( (MissingZero!6015 (index!26287 (_ BitVec 32))) (Found!6015 (index!26288 (_ BitVec 32))) (Intermediate!6015 (undefined!6827 Bool) (index!26289 (_ BitVec 32)) (x!55108 (_ BitVec 32))) (Undefined!6015) (MissingVacant!6015 (index!26290 (_ BitVec 32))) )
))
(declare-fun lt!265843 () SeekEntryResult!6015)

(declare-datatypes ((array!36601 0))(
  ( (array!36602 (arr!17575 (Array (_ BitVec 32) (_ BitVec 64))) (size!17939 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36601)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36601 (_ BitVec 32)) SeekEntryResult!6015)

(assert (=> b!585510 (= lt!265843 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265842 vacantSpotIndex!68 (select (arr!17575 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!585511 () Bool)

(declare-fun res!373328 () Bool)

(declare-fun e!335008 () Bool)

(assert (=> b!585511 (=> (not res!373328) (not e!335008))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!585511 (= res!373328 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17575 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17575 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585512 () Bool)

(declare-fun res!373329 () Bool)

(declare-fun e!335009 () Bool)

(assert (=> b!585512 (=> (not res!373329) (not e!335009))))

(assert (=> b!585512 (= res!373329 (and (= (size!17939 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17939 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17939 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!585513 () Bool)

(declare-fun res!373332 () Bool)

(assert (=> b!585513 (=> (not res!373332) (not e!335008))))

(declare-datatypes ((List!11616 0))(
  ( (Nil!11613) (Cons!11612 (h!12657 (_ BitVec 64)) (t!17844 List!11616)) )
))
(declare-fun arrayNoDuplicates!0 (array!36601 (_ BitVec 32) List!11616) Bool)

(assert (=> b!585513 (= res!373332 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11613))))

(declare-fun b!585514 () Bool)

(declare-fun res!373336 () Bool)

(assert (=> b!585514 (=> (not res!373336) (not e!335008))))

(assert (=> b!585514 (= res!373336 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17575 a!2986) j!136) a!2986 mask!3053) (Found!6015 j!136)))))

(declare-fun b!585515 () Bool)

(assert (=> b!585515 (= e!335009 e!335008)))

(declare-fun res!373327 () Bool)

(assert (=> b!585515 (=> (not res!373327) (not e!335008))))

(declare-fun lt!265841 () SeekEntryResult!6015)

(assert (=> b!585515 (= res!373327 (or (= lt!265841 (MissingZero!6015 i!1108)) (= lt!265841 (MissingVacant!6015 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36601 (_ BitVec 32)) SeekEntryResult!6015)

(assert (=> b!585515 (= lt!265841 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!585517 () Bool)

(declare-fun res!373337 () Bool)

(assert (=> b!585517 (=> (not res!373337) (not e!335009))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585517 (= res!373337 (validKeyInArray!0 k0!1786))))

(declare-fun b!585518 () Bool)

(assert (=> b!585518 (= e!335008 e!335007)))

(declare-fun res!373326 () Bool)

(assert (=> b!585518 (=> (not res!373326) (not e!335007))))

(assert (=> b!585518 (= res!373326 (and (bvsge lt!265842 #b00000000000000000000000000000000) (bvslt lt!265842 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585518 (= lt!265842 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!585519 () Bool)

(declare-fun res!373334 () Bool)

(assert (=> b!585519 (=> (not res!373334) (not e!335008))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36601 (_ BitVec 32)) Bool)

(assert (=> b!585519 (= res!373334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585516 () Bool)

(declare-fun res!373333 () Bool)

(assert (=> b!585516 (=> (not res!373333) (not e!335009))))

(assert (=> b!585516 (= res!373333 (validKeyInArray!0 (select (arr!17575 a!2986) j!136)))))

(declare-fun res!373331 () Bool)

(assert (=> start!53700 (=> (not res!373331) (not e!335009))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53700 (= res!373331 (validMask!0 mask!3053))))

(assert (=> start!53700 e!335009))

(assert (=> start!53700 true))

(declare-fun array_inv!13371 (array!36601) Bool)

(assert (=> start!53700 (array_inv!13371 a!2986)))

(declare-fun b!585520 () Bool)

(declare-fun res!373335 () Bool)

(assert (=> b!585520 (=> (not res!373335) (not e!335009))))

(declare-fun arrayContainsKey!0 (array!36601 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585520 (= res!373335 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585521 () Bool)

(declare-fun res!373330 () Bool)

(assert (=> b!585521 (=> (not res!373330) (not e!335008))))

(assert (=> b!585521 (= res!373330 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17575 a!2986) index!984) (select (arr!17575 a!2986) j!136))) (not (= (select (arr!17575 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (= (and start!53700 res!373331) b!585512))

(assert (= (and b!585512 res!373329) b!585516))

(assert (= (and b!585516 res!373333) b!585517))

(assert (= (and b!585517 res!373337) b!585520))

(assert (= (and b!585520 res!373335) b!585515))

(assert (= (and b!585515 res!373327) b!585519))

(assert (= (and b!585519 res!373334) b!585513))

(assert (= (and b!585513 res!373332) b!585511))

(assert (= (and b!585511 res!373328) b!585514))

(assert (= (and b!585514 res!373336) b!585521))

(assert (= (and b!585521 res!373330) b!585518))

(assert (= (and b!585518 res!373326) b!585510))

(declare-fun m!563745 () Bool)

(assert (=> start!53700 m!563745))

(declare-fun m!563747 () Bool)

(assert (=> start!53700 m!563747))

(declare-fun m!563749 () Bool)

(assert (=> b!585516 m!563749))

(assert (=> b!585516 m!563749))

(declare-fun m!563751 () Bool)

(assert (=> b!585516 m!563751))

(declare-fun m!563753 () Bool)

(assert (=> b!585520 m!563753))

(assert (=> b!585514 m!563749))

(assert (=> b!585514 m!563749))

(declare-fun m!563755 () Bool)

(assert (=> b!585514 m!563755))

(declare-fun m!563757 () Bool)

(assert (=> b!585519 m!563757))

(declare-fun m!563759 () Bool)

(assert (=> b!585515 m!563759))

(declare-fun m!563761 () Bool)

(assert (=> b!585511 m!563761))

(declare-fun m!563763 () Bool)

(assert (=> b!585511 m!563763))

(declare-fun m!563765 () Bool)

(assert (=> b!585511 m!563765))

(declare-fun m!563767 () Bool)

(assert (=> b!585521 m!563767))

(assert (=> b!585521 m!563749))

(declare-fun m!563769 () Bool)

(assert (=> b!585513 m!563769))

(assert (=> b!585510 m!563749))

(assert (=> b!585510 m!563749))

(declare-fun m!563771 () Bool)

(assert (=> b!585510 m!563771))

(declare-fun m!563773 () Bool)

(assert (=> b!585517 m!563773))

(declare-fun m!563775 () Bool)

(assert (=> b!585518 m!563775))

(check-sat (not b!585513) (not b!585515) (not b!585518) (not b!585514) (not b!585516) (not start!53700) (not b!585520) (not b!585519) (not b!585510) (not b!585517))
(check-sat)
