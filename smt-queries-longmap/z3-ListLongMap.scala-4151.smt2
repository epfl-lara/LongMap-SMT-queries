; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56646 () Bool)

(assert start!56646)

(declare-fun b!627162 () Bool)

(declare-fun res!404758 () Bool)

(declare-fun e!359252 () Bool)

(assert (=> b!627162 (=> (not res!404758) (not e!359252))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37881 0))(
  ( (array!37882 (arr!18178 (Array (_ BitVec 32) (_ BitVec 64))) (size!18542 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37881)

(assert (=> b!627162 (= res!404758 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18178 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18178 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!627163 () Bool)

(declare-fun res!404759 () Bool)

(assert (=> b!627163 (=> (not res!404759) (not e!359252))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6574 0))(
  ( (MissingZero!6574 (index!28580 (_ BitVec 32))) (Found!6574 (index!28581 (_ BitVec 32))) (Intermediate!6574 (undefined!7386 Bool) (index!28582 (_ BitVec 32)) (x!57477 (_ BitVec 32))) (Undefined!6574) (MissingVacant!6574 (index!28583 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37881 (_ BitVec 32)) SeekEntryResult!6574)

(assert (=> b!627163 (= res!404759 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18178 a!2986) j!136) a!2986 mask!3053) (Found!6574 j!136)))))

(declare-fun b!627164 () Bool)

(declare-fun res!404767 () Bool)

(assert (=> b!627164 (=> (not res!404767) (not e!359252))))

(assert (=> b!627164 (= res!404767 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18178 a!2986) index!984) (select (arr!18178 a!2986) j!136))) (not (= (select (arr!18178 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!627165 () Bool)

(declare-fun res!404763 () Bool)

(declare-fun e!359253 () Bool)

(assert (=> b!627165 (=> (not res!404763) (not e!359253))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627165 (= res!404763 (validKeyInArray!0 k0!1786))))

(declare-fun b!627166 () Bool)

(declare-fun res!404765 () Bool)

(assert (=> b!627166 (=> (not res!404765) (not e!359253))))

(assert (=> b!627166 (= res!404765 (validKeyInArray!0 (select (arr!18178 a!2986) j!136)))))

(declare-fun b!627167 () Bool)

(assert (=> b!627167 (= e!359253 e!359252)))

(declare-fun res!404762 () Bool)

(assert (=> b!627167 (=> (not res!404762) (not e!359252))))

(declare-fun lt!290292 () SeekEntryResult!6574)

(assert (=> b!627167 (= res!404762 (or (= lt!290292 (MissingZero!6574 i!1108)) (= lt!290292 (MissingVacant!6574 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37881 (_ BitVec 32)) SeekEntryResult!6574)

(assert (=> b!627167 (= lt!290292 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!627168 () Bool)

(declare-fun res!404761 () Bool)

(assert (=> b!627168 (=> (not res!404761) (not e!359253))))

(assert (=> b!627168 (= res!404761 (and (= (size!18542 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18542 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18542 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627169 () Bool)

(declare-fun res!404764 () Bool)

(assert (=> b!627169 (=> (not res!404764) (not e!359253))))

(declare-fun arrayContainsKey!0 (array!37881 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627169 (= res!404764 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627170 () Bool)

(assert (=> b!627170 (= e!359252 false)))

(declare-fun lt!290293 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627170 (= lt!290293 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun res!404757 () Bool)

(assert (=> start!56646 (=> (not res!404757) (not e!359253))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56646 (= res!404757 (validMask!0 mask!3053))))

(assert (=> start!56646 e!359253))

(assert (=> start!56646 true))

(declare-fun array_inv!14037 (array!37881) Bool)

(assert (=> start!56646 (array_inv!14037 a!2986)))

(declare-fun b!627171 () Bool)

(declare-fun res!404760 () Bool)

(assert (=> b!627171 (=> (not res!404760) (not e!359252))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37881 (_ BitVec 32)) Bool)

(assert (=> b!627171 (= res!404760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627172 () Bool)

(declare-fun res!404766 () Bool)

(assert (=> b!627172 (=> (not res!404766) (not e!359252))))

(declare-datatypes ((List!12126 0))(
  ( (Nil!12123) (Cons!12122 (h!13170 (_ BitVec 64)) (t!18346 List!12126)) )
))
(declare-fun arrayNoDuplicates!0 (array!37881 (_ BitVec 32) List!12126) Bool)

(assert (=> b!627172 (= res!404766 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12123))))

(assert (= (and start!56646 res!404757) b!627168))

(assert (= (and b!627168 res!404761) b!627166))

(assert (= (and b!627166 res!404765) b!627165))

(assert (= (and b!627165 res!404763) b!627169))

(assert (= (and b!627169 res!404764) b!627167))

(assert (= (and b!627167 res!404762) b!627171))

(assert (= (and b!627171 res!404760) b!627172))

(assert (= (and b!627172 res!404766) b!627162))

(assert (= (and b!627162 res!404758) b!627163))

(assert (= (and b!627163 res!404759) b!627164))

(assert (= (and b!627164 res!404767) b!627170))

(declare-fun m!602797 () Bool)

(assert (=> b!627163 m!602797))

(assert (=> b!627163 m!602797))

(declare-fun m!602799 () Bool)

(assert (=> b!627163 m!602799))

(declare-fun m!602801 () Bool)

(assert (=> b!627167 m!602801))

(declare-fun m!602803 () Bool)

(assert (=> b!627165 m!602803))

(declare-fun m!602805 () Bool)

(assert (=> b!627171 m!602805))

(declare-fun m!602807 () Bool)

(assert (=> b!627162 m!602807))

(declare-fun m!602809 () Bool)

(assert (=> b!627162 m!602809))

(declare-fun m!602811 () Bool)

(assert (=> b!627162 m!602811))

(declare-fun m!602813 () Bool)

(assert (=> start!56646 m!602813))

(declare-fun m!602815 () Bool)

(assert (=> start!56646 m!602815))

(declare-fun m!602817 () Bool)

(assert (=> b!627170 m!602817))

(declare-fun m!602819 () Bool)

(assert (=> b!627169 m!602819))

(declare-fun m!602821 () Bool)

(assert (=> b!627172 m!602821))

(declare-fun m!602823 () Bool)

(assert (=> b!627164 m!602823))

(assert (=> b!627164 m!602797))

(assert (=> b!627166 m!602797))

(assert (=> b!627166 m!602797))

(declare-fun m!602825 () Bool)

(assert (=> b!627166 m!602825))

(check-sat (not b!627171) (not b!627165) (not start!56646) (not b!627172) (not b!627163) (not b!627169) (not b!627166) (not b!627167) (not b!627170))
(check-sat)
