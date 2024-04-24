; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53502 () Bool)

(assert start!53502)

(declare-fun b!581834 () Bool)

(declare-fun res!369551 () Bool)

(declare-fun e!333854 () Bool)

(assert (=> b!581834 (=> (not res!369551) (not e!333854))))

(declare-datatypes ((array!36348 0))(
  ( (array!36349 (arr!17446 (Array (_ BitVec 32) (_ BitVec 64))) (size!17810 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36348)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581834 (= res!369551 (validKeyInArray!0 (select (arr!17446 a!2986) j!136)))))

(declare-fun b!581835 () Bool)

(declare-fun res!369547 () Bool)

(assert (=> b!581835 (=> (not res!369547) (not e!333854))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36348 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581835 (= res!369547 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581836 () Bool)

(declare-fun e!333855 () Bool)

(assert (=> b!581836 (= e!333854 e!333855)))

(declare-fun res!369546 () Bool)

(assert (=> b!581836 (=> (not res!369546) (not e!333855))))

(declare-datatypes ((SeekEntryResult!5842 0))(
  ( (MissingZero!5842 (index!25595 (_ BitVec 32))) (Found!5842 (index!25596 (_ BitVec 32))) (Intermediate!5842 (undefined!6654 Bool) (index!25597 (_ BitVec 32)) (x!54610 (_ BitVec 32))) (Undefined!5842) (MissingVacant!5842 (index!25598 (_ BitVec 32))) )
))
(declare-fun lt!265060 () SeekEntryResult!5842)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581836 (= res!369546 (or (= lt!265060 (MissingZero!5842 i!1108)) (= lt!265060 (MissingVacant!5842 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36348 (_ BitVec 32)) SeekEntryResult!5842)

(assert (=> b!581836 (= lt!265060 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!581837 () Bool)

(declare-fun res!369553 () Bool)

(assert (=> b!581837 (=> (not res!369553) (not e!333855))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36348 (_ BitVec 32)) Bool)

(assert (=> b!581837 (= res!369553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581838 () Bool)

(assert (=> b!581838 (= e!333855 false)))

(declare-fun lt!265059 () SeekEntryResult!5842)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36348 (_ BitVec 32)) SeekEntryResult!5842)

(assert (=> b!581838 (= lt!265059 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17446 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581839 () Bool)

(declare-fun res!369545 () Bool)

(assert (=> b!581839 (=> (not res!369545) (not e!333854))))

(assert (=> b!581839 (= res!369545 (validKeyInArray!0 k0!1786))))

(declare-fun b!581840 () Bool)

(declare-fun res!369549 () Bool)

(assert (=> b!581840 (=> (not res!369549) (not e!333855))))

(assert (=> b!581840 (= res!369549 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17446 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17446 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!369550 () Bool)

(assert (=> start!53502 (=> (not res!369550) (not e!333854))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53502 (= res!369550 (validMask!0 mask!3053))))

(assert (=> start!53502 e!333854))

(assert (=> start!53502 true))

(declare-fun array_inv!13305 (array!36348) Bool)

(assert (=> start!53502 (array_inv!13305 a!2986)))

(declare-fun b!581841 () Bool)

(declare-fun res!369548 () Bool)

(assert (=> b!581841 (=> (not res!369548) (not e!333855))))

(declare-datatypes ((List!11394 0))(
  ( (Nil!11391) (Cons!11390 (h!12438 (_ BitVec 64)) (t!17614 List!11394)) )
))
(declare-fun arrayNoDuplicates!0 (array!36348 (_ BitVec 32) List!11394) Bool)

(assert (=> b!581841 (= res!369548 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11391))))

(declare-fun b!581842 () Bool)

(declare-fun res!369552 () Bool)

(assert (=> b!581842 (=> (not res!369552) (not e!333854))))

(assert (=> b!581842 (= res!369552 (and (= (size!17810 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17810 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17810 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53502 res!369550) b!581842))

(assert (= (and b!581842 res!369552) b!581834))

(assert (= (and b!581834 res!369551) b!581839))

(assert (= (and b!581839 res!369545) b!581835))

(assert (= (and b!581835 res!369547) b!581836))

(assert (= (and b!581836 res!369546) b!581837))

(assert (= (and b!581837 res!369553) b!581841))

(assert (= (and b!581841 res!369548) b!581840))

(assert (= (and b!581840 res!369549) b!581838))

(declare-fun m!560519 () Bool)

(assert (=> b!581841 m!560519))

(declare-fun m!560521 () Bool)

(assert (=> start!53502 m!560521))

(declare-fun m!560523 () Bool)

(assert (=> start!53502 m!560523))

(declare-fun m!560525 () Bool)

(assert (=> b!581839 m!560525))

(declare-fun m!560527 () Bool)

(assert (=> b!581835 m!560527))

(declare-fun m!560529 () Bool)

(assert (=> b!581840 m!560529))

(declare-fun m!560531 () Bool)

(assert (=> b!581840 m!560531))

(declare-fun m!560533 () Bool)

(assert (=> b!581840 m!560533))

(declare-fun m!560535 () Bool)

(assert (=> b!581837 m!560535))

(declare-fun m!560537 () Bool)

(assert (=> b!581838 m!560537))

(assert (=> b!581838 m!560537))

(declare-fun m!560539 () Bool)

(assert (=> b!581838 m!560539))

(declare-fun m!560541 () Bool)

(assert (=> b!581836 m!560541))

(assert (=> b!581834 m!560537))

(assert (=> b!581834 m!560537))

(declare-fun m!560543 () Bool)

(assert (=> b!581834 m!560543))

(check-sat (not b!581836) (not b!581841) (not start!53502) (not b!581839) (not b!581838) (not b!581837) (not b!581835) (not b!581834))
(check-sat)
