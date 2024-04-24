; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56358 () Bool)

(assert start!56358)

(declare-fun b!624555 () Bool)

(declare-fun res!402606 () Bool)

(declare-fun e!358181 () Bool)

(assert (=> b!624555 (=> (not res!402606) (not e!358181))))

(declare-datatypes ((array!37728 0))(
  ( (array!37729 (arr!18106 (Array (_ BitVec 32) (_ BitVec 64))) (size!18470 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37728)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37728 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624555 (= res!402606 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624556 () Bool)

(declare-fun e!358180 () Bool)

(assert (=> b!624556 (= e!358181 e!358180)))

(declare-fun res!402604 () Bool)

(assert (=> b!624556 (=> (not res!402604) (not e!358180))))

(declare-datatypes ((SeekEntryResult!6502 0))(
  ( (MissingZero!6502 (index!28292 (_ BitVec 32))) (Found!6502 (index!28293 (_ BitVec 32))) (Intermediate!6502 (undefined!7314 Bool) (index!28294 (_ BitVec 32)) (x!57204 (_ BitVec 32))) (Undefined!6502) (MissingVacant!6502 (index!28295 (_ BitVec 32))) )
))
(declare-fun lt!289681 () SeekEntryResult!6502)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!624556 (= res!402604 (or (= lt!289681 (MissingZero!6502 i!1108)) (= lt!289681 (MissingVacant!6502 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37728 (_ BitVec 32)) SeekEntryResult!6502)

(assert (=> b!624556 (= lt!289681 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!624557 () Bool)

(declare-fun res!402600 () Bool)

(assert (=> b!624557 (=> (not res!402600) (not e!358181))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!624557 (= res!402600 (and (= (size!18470 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18470 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18470 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624558 () Bool)

(declare-fun res!402601 () Bool)

(assert (=> b!624558 (=> (not res!402601) (not e!358180))))

(declare-datatypes ((List!12054 0))(
  ( (Nil!12051) (Cons!12050 (h!13098 (_ BitVec 64)) (t!18274 List!12054)) )
))
(declare-fun arrayNoDuplicates!0 (array!37728 (_ BitVec 32) List!12054) Bool)

(assert (=> b!624558 (= res!402601 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12051))))

(declare-fun b!624559 () Bool)

(declare-fun res!402607 () Bool)

(assert (=> b!624559 (=> (not res!402607) (not e!358181))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624559 (= res!402607 (validKeyInArray!0 (select (arr!18106 a!2986) j!136)))))

(declare-fun b!624560 () Bool)

(declare-fun res!402603 () Bool)

(assert (=> b!624560 (=> (not res!402603) (not e!358180))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37728 (_ BitVec 32)) Bool)

(assert (=> b!624560 (= res!402603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun b!624561 () Bool)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!624561 (= e!358180 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18106 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantSpotIndex!68 (size!18470 a!2986))))))

(declare-fun b!624562 () Bool)

(declare-fun res!402602 () Bool)

(assert (=> b!624562 (=> (not res!402602) (not e!358181))))

(assert (=> b!624562 (= res!402602 (validKeyInArray!0 k0!1786))))

(declare-fun res!402605 () Bool)

(assert (=> start!56358 (=> (not res!402605) (not e!358181))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56358 (= res!402605 (validMask!0 mask!3053))))

(assert (=> start!56358 e!358181))

(assert (=> start!56358 true))

(declare-fun array_inv!13965 (array!37728) Bool)

(assert (=> start!56358 (array_inv!13965 a!2986)))

(assert (= (and start!56358 res!402605) b!624557))

(assert (= (and b!624557 res!402600) b!624559))

(assert (= (and b!624559 res!402607) b!624562))

(assert (= (and b!624562 res!402602) b!624555))

(assert (= (and b!624555 res!402606) b!624556))

(assert (= (and b!624556 res!402604) b!624560))

(assert (= (and b!624560 res!402603) b!624558))

(assert (= (and b!624558 res!402601) b!624561))

(declare-fun m!600547 () Bool)

(assert (=> b!624556 m!600547))

(declare-fun m!600549 () Bool)

(assert (=> b!624562 m!600549))

(declare-fun m!600551 () Bool)

(assert (=> b!624560 m!600551))

(declare-fun m!600553 () Bool)

(assert (=> start!56358 m!600553))

(declare-fun m!600555 () Bool)

(assert (=> start!56358 m!600555))

(declare-fun m!600557 () Bool)

(assert (=> b!624561 m!600557))

(declare-fun m!600559 () Bool)

(assert (=> b!624559 m!600559))

(assert (=> b!624559 m!600559))

(declare-fun m!600561 () Bool)

(assert (=> b!624559 m!600561))

(declare-fun m!600563 () Bool)

(assert (=> b!624555 m!600563))

(declare-fun m!600565 () Bool)

(assert (=> b!624558 m!600565))

(check-sat (not b!624556) (not b!624555) (not start!56358) (not b!624559) (not b!624560) (not b!624562) (not b!624558))
(check-sat)
