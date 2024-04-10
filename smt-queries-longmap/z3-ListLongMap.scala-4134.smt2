; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56400 () Bool)

(assert start!56400)

(declare-fun b!625131 () Bool)

(declare-fun res!403144 () Bool)

(declare-fun e!358386 () Bool)

(assert (=> b!625131 (=> (not res!403144) (not e!358386))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37780 0))(
  ( (array!37781 (arr!18133 (Array (_ BitVec 32) (_ BitVec 64))) (size!18497 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37780)

(assert (=> b!625131 (= res!403144 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18133 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18133 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!625132 () Bool)

(declare-fun res!403142 () Bool)

(assert (=> b!625132 (=> (not res!403142) (not e!358386))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37780 (_ BitVec 32)) Bool)

(assert (=> b!625132 (= res!403142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625133 () Bool)

(declare-fun res!403139 () Bool)

(assert (=> b!625133 (=> (not res!403139) (not e!358386))))

(declare-datatypes ((List!12174 0))(
  ( (Nil!12171) (Cons!12170 (h!13215 (_ BitVec 64)) (t!18402 List!12174)) )
))
(declare-fun arrayNoDuplicates!0 (array!37780 (_ BitVec 32) List!12174) Bool)

(assert (=> b!625133 (= res!403139 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12171))))

(declare-fun res!403137 () Bool)

(declare-fun e!358384 () Bool)

(assert (=> start!56400 (=> (not res!403137) (not e!358384))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56400 (= res!403137 (validMask!0 mask!3053))))

(assert (=> start!56400 e!358384))

(assert (=> start!56400 true))

(declare-fun array_inv!13929 (array!37780) Bool)

(assert (=> start!56400 (array_inv!13929 a!2986)))

(declare-fun b!625134 () Bool)

(declare-fun res!403140 () Bool)

(assert (=> b!625134 (=> (not res!403140) (not e!358384))))

(declare-fun arrayContainsKey!0 (array!37780 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625134 (= res!403140 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625135 () Bool)

(declare-fun res!403141 () Bool)

(assert (=> b!625135 (=> (not res!403141) (not e!358384))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625135 (= res!403141 (validKeyInArray!0 (select (arr!18133 a!2986) j!136)))))

(declare-fun b!625136 () Bool)

(assert (=> b!625136 (= e!358386 false)))

(declare-datatypes ((SeekEntryResult!6573 0))(
  ( (MissingZero!6573 (index!28576 (_ BitVec 32))) (Found!6573 (index!28577 (_ BitVec 32))) (Intermediate!6573 (undefined!7385 Bool) (index!28578 (_ BitVec 32)) (x!57331 (_ BitVec 32))) (Undefined!6573) (MissingVacant!6573 (index!28579 (_ BitVec 32))) )
))
(declare-fun lt!289767 () SeekEntryResult!6573)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37780 (_ BitVec 32)) SeekEntryResult!6573)

(assert (=> b!625136 (= lt!289767 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18133 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625137 () Bool)

(declare-fun res!403138 () Bool)

(assert (=> b!625137 (=> (not res!403138) (not e!358384))))

(assert (=> b!625137 (= res!403138 (validKeyInArray!0 k0!1786))))

(declare-fun b!625138 () Bool)

(assert (=> b!625138 (= e!358384 e!358386)))

(declare-fun res!403143 () Bool)

(assert (=> b!625138 (=> (not res!403143) (not e!358386))))

(declare-fun lt!289768 () SeekEntryResult!6573)

(assert (=> b!625138 (= res!403143 (or (= lt!289768 (MissingZero!6573 i!1108)) (= lt!289768 (MissingVacant!6573 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37780 (_ BitVec 32)) SeekEntryResult!6573)

(assert (=> b!625138 (= lt!289768 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!625139 () Bool)

(declare-fun res!403145 () Bool)

(assert (=> b!625139 (=> (not res!403145) (not e!358384))))

(assert (=> b!625139 (= res!403145 (and (= (size!18497 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18497 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18497 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!56400 res!403137) b!625139))

(assert (= (and b!625139 res!403145) b!625135))

(assert (= (and b!625135 res!403141) b!625137))

(assert (= (and b!625137 res!403138) b!625134))

(assert (= (and b!625134 res!403140) b!625138))

(assert (= (and b!625138 res!403143) b!625132))

(assert (= (and b!625132 res!403142) b!625133))

(assert (= (and b!625133 res!403139) b!625131))

(assert (= (and b!625131 res!403144) b!625136))

(declare-fun m!600721 () Bool)

(assert (=> b!625134 m!600721))

(declare-fun m!600723 () Bool)

(assert (=> b!625137 m!600723))

(declare-fun m!600725 () Bool)

(assert (=> b!625135 m!600725))

(assert (=> b!625135 m!600725))

(declare-fun m!600727 () Bool)

(assert (=> b!625135 m!600727))

(declare-fun m!600729 () Bool)

(assert (=> b!625132 m!600729))

(declare-fun m!600731 () Bool)

(assert (=> b!625131 m!600731))

(declare-fun m!600733 () Bool)

(assert (=> b!625131 m!600733))

(declare-fun m!600735 () Bool)

(assert (=> b!625131 m!600735))

(assert (=> b!625136 m!600725))

(assert (=> b!625136 m!600725))

(declare-fun m!600737 () Bool)

(assert (=> b!625136 m!600737))

(declare-fun m!600739 () Bool)

(assert (=> b!625133 m!600739))

(declare-fun m!600741 () Bool)

(assert (=> start!56400 m!600741))

(declare-fun m!600743 () Bool)

(assert (=> start!56400 m!600743))

(declare-fun m!600745 () Bool)

(assert (=> b!625138 m!600745))

(check-sat (not b!625134) (not b!625135) (not b!625138) (not b!625137) (not b!625132) (not start!56400) (not b!625136) (not b!625133))
(check-sat)
