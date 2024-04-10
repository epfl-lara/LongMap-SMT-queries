; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56434 () Bool)

(assert start!56434)

(declare-fun b!625599 () Bool)

(declare-fun res!403606 () Bool)

(declare-fun e!358538 () Bool)

(assert (=> b!625599 (=> (not res!403606) (not e!358538))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625599 (= res!403606 (validKeyInArray!0 k!1786))))

(declare-fun b!625600 () Bool)

(declare-fun res!403609 () Bool)

(declare-fun e!358539 () Bool)

(assert (=> b!625600 (=> (not res!403609) (not e!358539))))

(declare-datatypes ((array!37814 0))(
  ( (array!37815 (arr!18150 (Array (_ BitVec 32) (_ BitVec 64))) (size!18514 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37814)

(declare-datatypes ((List!12191 0))(
  ( (Nil!12188) (Cons!12187 (h!13232 (_ BitVec 64)) (t!18419 List!12191)) )
))
(declare-fun arrayNoDuplicates!0 (array!37814 (_ BitVec 32) List!12191) Bool)

(assert (=> b!625600 (= res!403609 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12188))))

(declare-fun b!625601 () Bool)

(declare-fun res!403605 () Bool)

(assert (=> b!625601 (=> (not res!403605) (not e!358539))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37814 (_ BitVec 32)) Bool)

(assert (=> b!625601 (= res!403605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625602 () Bool)

(assert (=> b!625602 (= e!358539 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6590 0))(
  ( (MissingZero!6590 (index!28644 (_ BitVec 32))) (Found!6590 (index!28645 (_ BitVec 32))) (Intermediate!6590 (undefined!7402 Bool) (index!28646 (_ BitVec 32)) (x!57396 (_ BitVec 32))) (Undefined!6590) (MissingVacant!6590 (index!28647 (_ BitVec 32))) )
))
(declare-fun lt!289860 () SeekEntryResult!6590)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37814 (_ BitVec 32)) SeekEntryResult!6590)

(assert (=> b!625602 (= lt!289860 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18150 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625603 () Bool)

(assert (=> b!625603 (= e!358538 e!358539)))

(declare-fun res!403612 () Bool)

(assert (=> b!625603 (=> (not res!403612) (not e!358539))))

(declare-fun lt!289861 () SeekEntryResult!6590)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!625603 (= res!403612 (or (= lt!289861 (MissingZero!6590 i!1108)) (= lt!289861 (MissingVacant!6590 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37814 (_ BitVec 32)) SeekEntryResult!6590)

(assert (=> b!625603 (= lt!289861 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!625604 () Bool)

(declare-fun res!403613 () Bool)

(assert (=> b!625604 (=> (not res!403613) (not e!358538))))

(declare-fun arrayContainsKey!0 (array!37814 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625604 (= res!403613 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625605 () Bool)

(declare-fun res!403610 () Bool)

(assert (=> b!625605 (=> (not res!403610) (not e!358538))))

(assert (=> b!625605 (= res!403610 (validKeyInArray!0 (select (arr!18150 a!2986) j!136)))))

(declare-fun res!403608 () Bool)

(assert (=> start!56434 (=> (not res!403608) (not e!358538))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56434 (= res!403608 (validMask!0 mask!3053))))

(assert (=> start!56434 e!358538))

(assert (=> start!56434 true))

(declare-fun array_inv!13946 (array!37814) Bool)

(assert (=> start!56434 (array_inv!13946 a!2986)))

(declare-fun b!625606 () Bool)

(declare-fun res!403607 () Bool)

(assert (=> b!625606 (=> (not res!403607) (not e!358538))))

(assert (=> b!625606 (= res!403607 (and (= (size!18514 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18514 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18514 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625607 () Bool)

(declare-fun res!403611 () Bool)

(assert (=> b!625607 (=> (not res!403611) (not e!358539))))

(assert (=> b!625607 (= res!403611 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18150 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18150 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!56434 res!403608) b!625606))

(assert (= (and b!625606 res!403607) b!625605))

(assert (= (and b!625605 res!403610) b!625599))

(assert (= (and b!625599 res!403606) b!625604))

(assert (= (and b!625604 res!403613) b!625603))

(assert (= (and b!625603 res!403612) b!625601))

(assert (= (and b!625601 res!403605) b!625600))

(assert (= (and b!625600 res!403609) b!625607))

(assert (= (and b!625607 res!403611) b!625602))

(declare-fun m!601163 () Bool)

(assert (=> start!56434 m!601163))

(declare-fun m!601165 () Bool)

(assert (=> start!56434 m!601165))

(declare-fun m!601167 () Bool)

(assert (=> b!625602 m!601167))

(assert (=> b!625602 m!601167))

(declare-fun m!601169 () Bool)

(assert (=> b!625602 m!601169))

(declare-fun m!601171 () Bool)

(assert (=> b!625604 m!601171))

(declare-fun m!601173 () Bool)

(assert (=> b!625599 m!601173))

(assert (=> b!625605 m!601167))

(assert (=> b!625605 m!601167))

(declare-fun m!601175 () Bool)

(assert (=> b!625605 m!601175))

(declare-fun m!601177 () Bool)

(assert (=> b!625607 m!601177))

(declare-fun m!601179 () Bool)

(assert (=> b!625607 m!601179))

(declare-fun m!601181 () Bool)

(assert (=> b!625607 m!601181))

(declare-fun m!601183 () Bool)

(assert (=> b!625601 m!601183))

(declare-fun m!601185 () Bool)

(assert (=> b!625603 m!601185))

(declare-fun m!601187 () Bool)

(assert (=> b!625600 m!601187))

(push 1)

