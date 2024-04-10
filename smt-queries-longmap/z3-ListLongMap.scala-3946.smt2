; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53688 () Bool)

(assert start!53688)

(declare-fun b!585294 () Bool)

(declare-fun e!334935 () Bool)

(declare-fun e!334938 () Bool)

(assert (=> b!585294 (= e!334935 e!334938)))

(declare-fun res!373113 () Bool)

(assert (=> b!585294 (=> (not res!373113) (not e!334938))))

(declare-datatypes ((SeekEntryResult!6009 0))(
  ( (MissingZero!6009 (index!26263 (_ BitVec 32))) (Found!6009 (index!26264 (_ BitVec 32))) (Intermediate!6009 (undefined!6821 Bool) (index!26265 (_ BitVec 32)) (x!55086 (_ BitVec 32))) (Undefined!6009) (MissingVacant!6009 (index!26266 (_ BitVec 32))) )
))
(declare-fun lt!265788 () SeekEntryResult!6009)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!585294 (= res!373113 (or (= lt!265788 (MissingZero!6009 i!1108)) (= lt!265788 (MissingVacant!6009 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!36589 0))(
  ( (array!36590 (arr!17569 (Array (_ BitVec 32) (_ BitVec 64))) (size!17933 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36589)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36589 (_ BitVec 32)) SeekEntryResult!6009)

(assert (=> b!585294 (= lt!265788 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!585295 () Bool)

(declare-fun res!373116 () Bool)

(assert (=> b!585295 (=> (not res!373116) (not e!334938))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!585295 (= res!373116 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17569 a!2986) index!984) (select (arr!17569 a!2986) j!136))) (not (= (select (arr!17569 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!585296 () Bool)

(declare-fun res!373121 () Bool)

(assert (=> b!585296 (=> (not res!373121) (not e!334938))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36589 (_ BitVec 32)) SeekEntryResult!6009)

(assert (=> b!585296 (= res!373121 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17569 a!2986) j!136) a!2986 mask!3053) (Found!6009 j!136)))))

(declare-fun b!585297 () Bool)

(declare-fun res!373112 () Bool)

(assert (=> b!585297 (=> (not res!373112) (not e!334935))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585297 (= res!373112 (validKeyInArray!0 k0!1786))))

(declare-fun b!585298 () Bool)

(declare-fun e!334937 () Bool)

(assert (=> b!585298 (= e!334938 e!334937)))

(declare-fun res!373120 () Bool)

(assert (=> b!585298 (=> (not res!373120) (not e!334937))))

(declare-fun lt!265787 () (_ BitVec 32))

(assert (=> b!585298 (= res!373120 (and (bvsge lt!265787 #b00000000000000000000000000000000) (bvslt lt!265787 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585298 (= lt!265787 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!585299 () Bool)

(assert (=> b!585299 (= e!334937 false)))

(declare-fun lt!265789 () SeekEntryResult!6009)

(assert (=> b!585299 (= lt!265789 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265787 vacantSpotIndex!68 (select (arr!17569 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!373111 () Bool)

(assert (=> start!53688 (=> (not res!373111) (not e!334935))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53688 (= res!373111 (validMask!0 mask!3053))))

(assert (=> start!53688 e!334935))

(assert (=> start!53688 true))

(declare-fun array_inv!13365 (array!36589) Bool)

(assert (=> start!53688 (array_inv!13365 a!2986)))

(declare-fun b!585300 () Bool)

(declare-fun res!373119 () Bool)

(assert (=> b!585300 (=> (not res!373119) (not e!334935))))

(declare-fun arrayContainsKey!0 (array!36589 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585300 (= res!373119 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585301 () Bool)

(declare-fun res!373117 () Bool)

(assert (=> b!585301 (=> (not res!373117) (not e!334935))))

(assert (=> b!585301 (= res!373117 (validKeyInArray!0 (select (arr!17569 a!2986) j!136)))))

(declare-fun b!585302 () Bool)

(declare-fun res!373118 () Bool)

(assert (=> b!585302 (=> (not res!373118) (not e!334938))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36589 (_ BitVec 32)) Bool)

(assert (=> b!585302 (= res!373118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585303 () Bool)

(declare-fun res!373114 () Bool)

(assert (=> b!585303 (=> (not res!373114) (not e!334938))))

(declare-datatypes ((List!11610 0))(
  ( (Nil!11607) (Cons!11606 (h!12651 (_ BitVec 64)) (t!17838 List!11610)) )
))
(declare-fun arrayNoDuplicates!0 (array!36589 (_ BitVec 32) List!11610) Bool)

(assert (=> b!585303 (= res!373114 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11607))))

(declare-fun b!585304 () Bool)

(declare-fun res!373115 () Bool)

(assert (=> b!585304 (=> (not res!373115) (not e!334935))))

(assert (=> b!585304 (= res!373115 (and (= (size!17933 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17933 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17933 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!585305 () Bool)

(declare-fun res!373110 () Bool)

(assert (=> b!585305 (=> (not res!373110) (not e!334938))))

(assert (=> b!585305 (= res!373110 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17569 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17569 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53688 res!373111) b!585304))

(assert (= (and b!585304 res!373115) b!585301))

(assert (= (and b!585301 res!373117) b!585297))

(assert (= (and b!585297 res!373112) b!585300))

(assert (= (and b!585300 res!373119) b!585294))

(assert (= (and b!585294 res!373113) b!585302))

(assert (= (and b!585302 res!373118) b!585303))

(assert (= (and b!585303 res!373114) b!585305))

(assert (= (and b!585305 res!373110) b!585296))

(assert (= (and b!585296 res!373121) b!585295))

(assert (= (and b!585295 res!373116) b!585298))

(assert (= (and b!585298 res!373120) b!585299))

(declare-fun m!563553 () Bool)

(assert (=> b!585303 m!563553))

(declare-fun m!563555 () Bool)

(assert (=> b!585294 m!563555))

(declare-fun m!563557 () Bool)

(assert (=> b!585296 m!563557))

(assert (=> b!585296 m!563557))

(declare-fun m!563559 () Bool)

(assert (=> b!585296 m!563559))

(declare-fun m!563561 () Bool)

(assert (=> b!585300 m!563561))

(assert (=> b!585299 m!563557))

(assert (=> b!585299 m!563557))

(declare-fun m!563563 () Bool)

(assert (=> b!585299 m!563563))

(assert (=> b!585301 m!563557))

(assert (=> b!585301 m!563557))

(declare-fun m!563565 () Bool)

(assert (=> b!585301 m!563565))

(declare-fun m!563567 () Bool)

(assert (=> start!53688 m!563567))

(declare-fun m!563569 () Bool)

(assert (=> start!53688 m!563569))

(declare-fun m!563571 () Bool)

(assert (=> b!585305 m!563571))

(declare-fun m!563573 () Bool)

(assert (=> b!585305 m!563573))

(declare-fun m!563575 () Bool)

(assert (=> b!585305 m!563575))

(declare-fun m!563577 () Bool)

(assert (=> b!585297 m!563577))

(declare-fun m!563579 () Bool)

(assert (=> b!585298 m!563579))

(declare-fun m!563581 () Bool)

(assert (=> b!585302 m!563581))

(declare-fun m!563583 () Bool)

(assert (=> b!585295 m!563583))

(assert (=> b!585295 m!563557))

(check-sat (not b!585301) (not b!585297) (not b!585303) (not b!585302) (not start!53688) (not b!585299) (not b!585298) (not b!585296) (not b!585300) (not b!585294))
(check-sat)
