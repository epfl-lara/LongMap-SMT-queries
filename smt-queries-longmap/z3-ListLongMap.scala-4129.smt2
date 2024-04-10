; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56322 () Bool)

(assert start!56322)

(declare-fun b!624510 () Bool)

(declare-fun e!358116 () Bool)

(assert (=> b!624510 (= e!358116 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6558 0))(
  ( (MissingZero!6558 (index!28516 (_ BitVec 32))) (Found!6558 (index!28517 (_ BitVec 32))) (Intermediate!6558 (undefined!7370 Bool) (index!28518 (_ BitVec 32)) (x!57273 (_ BitVec 32))) (Undefined!6558) (MissingVacant!6558 (index!28519 (_ BitVec 32))) )
))
(declare-fun lt!289615 () SeekEntryResult!6558)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37747 0))(
  ( (array!37748 (arr!18118 (Array (_ BitVec 32) (_ BitVec 64))) (size!18482 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37747)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37747 (_ BitVec 32)) SeekEntryResult!6558)

(assert (=> b!624510 (= lt!289615 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18118 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!624511 () Bool)

(declare-fun res!402666 () Bool)

(declare-fun e!358115 () Bool)

(assert (=> b!624511 (=> (not res!402666) (not e!358115))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!624511 (= res!402666 (and (= (size!18482 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18482 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18482 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624512 () Bool)

(declare-fun res!402660 () Bool)

(assert (=> b!624512 (=> (not res!402660) (not e!358116))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!624512 (= res!402660 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18118 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18118 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!624513 () Bool)

(assert (=> b!624513 (= e!358115 e!358116)))

(declare-fun res!402661 () Bool)

(assert (=> b!624513 (=> (not res!402661) (not e!358116))))

(declare-fun lt!289614 () SeekEntryResult!6558)

(assert (=> b!624513 (= res!402661 (or (= lt!289614 (MissingZero!6558 i!1108)) (= lt!289614 (MissingVacant!6558 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37747 (_ BitVec 32)) SeekEntryResult!6558)

(assert (=> b!624513 (= lt!289614 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!624514 () Bool)

(declare-fun res!402667 () Bool)

(assert (=> b!624514 (=> (not res!402667) (not e!358116))))

(declare-datatypes ((List!12159 0))(
  ( (Nil!12156) (Cons!12155 (h!13200 (_ BitVec 64)) (t!18387 List!12159)) )
))
(declare-fun arrayNoDuplicates!0 (array!37747 (_ BitVec 32) List!12159) Bool)

(assert (=> b!624514 (= res!402667 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12156))))

(declare-fun b!624515 () Bool)

(declare-fun res!402662 () Bool)

(assert (=> b!624515 (=> (not res!402662) (not e!358115))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624515 (= res!402662 (validKeyInArray!0 (select (arr!18118 a!2986) j!136)))))

(declare-fun b!624516 () Bool)

(declare-fun res!402668 () Bool)

(assert (=> b!624516 (=> (not res!402668) (not e!358115))))

(assert (=> b!624516 (= res!402668 (validKeyInArray!0 k0!1786))))

(declare-fun b!624517 () Bool)

(declare-fun res!402664 () Bool)

(assert (=> b!624517 (=> (not res!402664) (not e!358115))))

(declare-fun arrayContainsKey!0 (array!37747 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624517 (= res!402664 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624518 () Bool)

(declare-fun res!402665 () Bool)

(assert (=> b!624518 (=> (not res!402665) (not e!358116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37747 (_ BitVec 32)) Bool)

(assert (=> b!624518 (= res!402665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!402663 () Bool)

(assert (=> start!56322 (=> (not res!402663) (not e!358115))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56322 (= res!402663 (validMask!0 mask!3053))))

(assert (=> start!56322 e!358115))

(assert (=> start!56322 true))

(declare-fun array_inv!13914 (array!37747) Bool)

(assert (=> start!56322 (array_inv!13914 a!2986)))

(assert (= (and start!56322 res!402663) b!624511))

(assert (= (and b!624511 res!402666) b!624515))

(assert (= (and b!624515 res!402662) b!624516))

(assert (= (and b!624516 res!402668) b!624517))

(assert (= (and b!624517 res!402664) b!624513))

(assert (= (and b!624513 res!402661) b!624518))

(assert (= (and b!624518 res!402665) b!624514))

(assert (= (and b!624514 res!402667) b!624512))

(assert (= (and b!624512 res!402660) b!624510))

(declare-fun m!600205 () Bool)

(assert (=> b!624518 m!600205))

(declare-fun m!600207 () Bool)

(assert (=> b!624510 m!600207))

(assert (=> b!624510 m!600207))

(declare-fun m!600209 () Bool)

(assert (=> b!624510 m!600209))

(declare-fun m!600211 () Bool)

(assert (=> b!624512 m!600211))

(declare-fun m!600213 () Bool)

(assert (=> b!624512 m!600213))

(declare-fun m!600215 () Bool)

(assert (=> b!624512 m!600215))

(declare-fun m!600217 () Bool)

(assert (=> start!56322 m!600217))

(declare-fun m!600219 () Bool)

(assert (=> start!56322 m!600219))

(declare-fun m!600221 () Bool)

(assert (=> b!624514 m!600221))

(declare-fun m!600223 () Bool)

(assert (=> b!624513 m!600223))

(assert (=> b!624515 m!600207))

(assert (=> b!624515 m!600207))

(declare-fun m!600225 () Bool)

(assert (=> b!624515 m!600225))

(declare-fun m!600227 () Bool)

(assert (=> b!624516 m!600227))

(declare-fun m!600229 () Bool)

(assert (=> b!624517 m!600229))

(check-sat (not b!624510) (not b!624515) (not b!624514) (not b!624513) (not b!624517) (not b!624518) (not start!56322) (not b!624516))
(check-sat)
