; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56784 () Bool)

(assert start!56784)

(declare-fun b!628755 () Bool)

(declare-fun res!406208 () Bool)

(declare-fun e!359765 () Bool)

(assert (=> b!628755 (=> (not res!406208) (not e!359765))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37968 0))(
  ( (array!37969 (arr!18220 (Array (_ BitVec 32) (_ BitVec 64))) (size!18584 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37968)

(assert (=> b!628755 (= res!406208 (and (= (size!18584 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18584 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18584 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!628756 () Bool)

(declare-fun res!406206 () Bool)

(declare-fun e!359766 () Bool)

(assert (=> b!628756 (=> (not res!406206) (not e!359766))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37968 (_ BitVec 32)) Bool)

(assert (=> b!628756 (= res!406206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!628757 () Bool)

(declare-fun res!406215 () Bool)

(assert (=> b!628757 (=> (not res!406215) (not e!359766))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6616 0))(
  ( (MissingZero!6616 (index!28748 (_ BitVec 32))) (Found!6616 (index!28749 (_ BitVec 32))) (Intermediate!6616 (undefined!7428 Bool) (index!28750 (_ BitVec 32)) (x!57637 (_ BitVec 32))) (Undefined!6616) (MissingVacant!6616 (index!28751 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37968 (_ BitVec 32)) SeekEntryResult!6616)

(assert (=> b!628757 (= res!406215 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18220 a!2986) j!136) a!2986 mask!3053) (Found!6616 j!136)))))

(declare-fun b!628758 () Bool)

(declare-fun res!406211 () Bool)

(assert (=> b!628758 (=> (not res!406211) (not e!359765))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!628758 (= res!406211 (validKeyInArray!0 (select (arr!18220 a!2986) j!136)))))

(declare-fun b!628759 () Bool)

(declare-fun res!406214 () Bool)

(assert (=> b!628759 (=> (not res!406214) (not e!359766))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!628759 (= res!406214 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18220 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18220 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!628760 () Bool)

(assert (=> b!628760 (= e!359765 e!359766)))

(declare-fun res!406212 () Bool)

(assert (=> b!628760 (=> (not res!406212) (not e!359766))))

(declare-fun lt!290626 () SeekEntryResult!6616)

(assert (=> b!628760 (= res!406212 (or (= lt!290626 (MissingZero!6616 i!1108)) (= lt!290626 (MissingVacant!6616 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37968 (_ BitVec 32)) SeekEntryResult!6616)

(assert (=> b!628760 (= lt!290626 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!628761 () Bool)

(declare-fun lt!290625 () (_ BitVec 32))

(assert (=> b!628761 (= e!359766 (and (bvsge lt!290625 #b00000000000000000000000000000000) (bvslt lt!290625 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!628761 (= lt!290625 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun res!406210 () Bool)

(assert (=> start!56784 (=> (not res!406210) (not e!359765))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56784 (= res!406210 (validMask!0 mask!3053))))

(assert (=> start!56784 e!359765))

(assert (=> start!56784 true))

(declare-fun array_inv!14079 (array!37968) Bool)

(assert (=> start!56784 (array_inv!14079 a!2986)))

(declare-fun b!628762 () Bool)

(declare-fun res!406213 () Bool)

(assert (=> b!628762 (=> (not res!406213) (not e!359766))))

(declare-datatypes ((List!12168 0))(
  ( (Nil!12165) (Cons!12164 (h!13212 (_ BitVec 64)) (t!18388 List!12168)) )
))
(declare-fun arrayNoDuplicates!0 (array!37968 (_ BitVec 32) List!12168) Bool)

(assert (=> b!628762 (= res!406213 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12165))))

(declare-fun b!628763 () Bool)

(declare-fun res!406207 () Bool)

(assert (=> b!628763 (=> (not res!406207) (not e!359765))))

(declare-fun arrayContainsKey!0 (array!37968 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!628763 (= res!406207 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!628764 () Bool)

(declare-fun res!406209 () Bool)

(assert (=> b!628764 (=> (not res!406209) (not e!359765))))

(assert (=> b!628764 (= res!406209 (validKeyInArray!0 k0!1786))))

(declare-fun b!628765 () Bool)

(declare-fun res!406216 () Bool)

(assert (=> b!628765 (=> (not res!406216) (not e!359766))))

(assert (=> b!628765 (= res!406216 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18220 a!2986) index!984) (select (arr!18220 a!2986) j!136))) (not (= (select (arr!18220 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (= (and start!56784 res!406210) b!628755))

(assert (= (and b!628755 res!406208) b!628758))

(assert (= (and b!628758 res!406211) b!628764))

(assert (= (and b!628764 res!406209) b!628763))

(assert (= (and b!628763 res!406207) b!628760))

(assert (= (and b!628760 res!406212) b!628756))

(assert (= (and b!628756 res!406206) b!628762))

(assert (= (and b!628762 res!406213) b!628759))

(assert (= (and b!628759 res!406214) b!628757))

(assert (= (and b!628757 res!406215) b!628765))

(assert (= (and b!628765 res!406216) b!628761))

(declare-fun m!604183 () Bool)

(assert (=> b!628758 m!604183))

(assert (=> b!628758 m!604183))

(declare-fun m!604185 () Bool)

(assert (=> b!628758 m!604185))

(declare-fun m!604187 () Bool)

(assert (=> b!628759 m!604187))

(declare-fun m!604189 () Bool)

(assert (=> b!628759 m!604189))

(declare-fun m!604191 () Bool)

(assert (=> b!628759 m!604191))

(declare-fun m!604193 () Bool)

(assert (=> b!628762 m!604193))

(declare-fun m!604195 () Bool)

(assert (=> b!628760 m!604195))

(declare-fun m!604197 () Bool)

(assert (=> b!628756 m!604197))

(assert (=> b!628757 m!604183))

(assert (=> b!628757 m!604183))

(declare-fun m!604199 () Bool)

(assert (=> b!628757 m!604199))

(declare-fun m!604201 () Bool)

(assert (=> b!628763 m!604201))

(declare-fun m!604203 () Bool)

(assert (=> b!628765 m!604203))

(assert (=> b!628765 m!604183))

(declare-fun m!604205 () Bool)

(assert (=> b!628761 m!604205))

(declare-fun m!604207 () Bool)

(assert (=> b!628764 m!604207))

(declare-fun m!604209 () Bool)

(assert (=> start!56784 m!604209))

(declare-fun m!604211 () Bool)

(assert (=> start!56784 m!604211))

(check-sat (not b!628756) (not b!628764) (not b!628757) (not b!628761) (not start!56784) (not b!628763) (not b!628758) (not b!628762) (not b!628760))
(check-sat)
