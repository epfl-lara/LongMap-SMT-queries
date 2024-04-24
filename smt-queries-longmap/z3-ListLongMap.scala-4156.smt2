; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56676 () Bool)

(assert start!56676)

(declare-fun b!627657 () Bool)

(declare-fun res!405253 () Bool)

(declare-fun e!359388 () Bool)

(assert (=> b!627657 (=> (not res!405253) (not e!359388))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37911 0))(
  ( (array!37912 (arr!18193 (Array (_ BitVec 32) (_ BitVec 64))) (size!18557 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37911)

(assert (=> b!627657 (= res!405253 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18193 a!2986) index!984) (select (arr!18193 a!2986) j!136))) (not (= (select (arr!18193 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!627658 () Bool)

(declare-fun res!405254 () Bool)

(declare-fun e!359386 () Bool)

(assert (=> b!627658 (=> (not res!405254) (not e!359386))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627658 (= res!405254 (validKeyInArray!0 k0!1786))))

(declare-fun b!627659 () Bool)

(declare-fun res!405262 () Bool)

(assert (=> b!627659 (=> (not res!405262) (not e!359386))))

(declare-fun arrayContainsKey!0 (array!37911 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627659 (= res!405262 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627660 () Bool)

(declare-fun res!405259 () Bool)

(assert (=> b!627660 (=> (not res!405259) (not e!359388))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!627660 (= res!405259 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18193 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18193 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!627661 () Bool)

(declare-fun res!405261 () Bool)

(assert (=> b!627661 (=> (not res!405261) (not e!359388))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37911 (_ BitVec 32)) Bool)

(assert (=> b!627661 (= res!405261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627662 () Bool)

(declare-fun res!405257 () Bool)

(assert (=> b!627662 (=> (not res!405257) (not e!359386))))

(assert (=> b!627662 (= res!405257 (and (= (size!18557 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18557 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18557 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627663 () Bool)

(declare-fun res!405260 () Bool)

(assert (=> b!627663 (=> (not res!405260) (not e!359388))))

(declare-datatypes ((SeekEntryResult!6589 0))(
  ( (MissingZero!6589 (index!28640 (_ BitVec 32))) (Found!6589 (index!28641 (_ BitVec 32))) (Intermediate!6589 (undefined!7401 Bool) (index!28642 (_ BitVec 32)) (x!57532 (_ BitVec 32))) (Undefined!6589) (MissingVacant!6589 (index!28643 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37911 (_ BitVec 32)) SeekEntryResult!6589)

(assert (=> b!627663 (= res!405260 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18193 a!2986) j!136) a!2986 mask!3053) (Found!6589 j!136)))))

(declare-fun b!627664 () Bool)

(assert (=> b!627664 (= e!359388 false)))

(declare-fun lt!290383 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627664 (= lt!290383 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!627665 () Bool)

(declare-fun res!405256 () Bool)

(assert (=> b!627665 (=> (not res!405256) (not e!359386))))

(assert (=> b!627665 (= res!405256 (validKeyInArray!0 (select (arr!18193 a!2986) j!136)))))

(declare-fun b!627666 () Bool)

(assert (=> b!627666 (= e!359386 e!359388)))

(declare-fun res!405252 () Bool)

(assert (=> b!627666 (=> (not res!405252) (not e!359388))))

(declare-fun lt!290382 () SeekEntryResult!6589)

(assert (=> b!627666 (= res!405252 (or (= lt!290382 (MissingZero!6589 i!1108)) (= lt!290382 (MissingVacant!6589 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37911 (_ BitVec 32)) SeekEntryResult!6589)

(assert (=> b!627666 (= lt!290382 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!627667 () Bool)

(declare-fun res!405258 () Bool)

(assert (=> b!627667 (=> (not res!405258) (not e!359388))))

(declare-datatypes ((List!12141 0))(
  ( (Nil!12138) (Cons!12137 (h!13185 (_ BitVec 64)) (t!18361 List!12141)) )
))
(declare-fun arrayNoDuplicates!0 (array!37911 (_ BitVec 32) List!12141) Bool)

(assert (=> b!627667 (= res!405258 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12138))))

(declare-fun res!405255 () Bool)

(assert (=> start!56676 (=> (not res!405255) (not e!359386))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56676 (= res!405255 (validMask!0 mask!3053))))

(assert (=> start!56676 e!359386))

(assert (=> start!56676 true))

(declare-fun array_inv!14052 (array!37911) Bool)

(assert (=> start!56676 (array_inv!14052 a!2986)))

(assert (= (and start!56676 res!405255) b!627662))

(assert (= (and b!627662 res!405257) b!627665))

(assert (= (and b!627665 res!405256) b!627658))

(assert (= (and b!627658 res!405254) b!627659))

(assert (= (and b!627659 res!405262) b!627666))

(assert (= (and b!627666 res!405252) b!627661))

(assert (= (and b!627661 res!405261) b!627667))

(assert (= (and b!627667 res!405258) b!627660))

(assert (= (and b!627660 res!405259) b!627663))

(assert (= (and b!627663 res!405260) b!627657))

(assert (= (and b!627657 res!405253) b!627664))

(declare-fun m!603247 () Bool)

(assert (=> b!627667 m!603247))

(declare-fun m!603249 () Bool)

(assert (=> b!627658 m!603249))

(declare-fun m!603251 () Bool)

(assert (=> start!56676 m!603251))

(declare-fun m!603253 () Bool)

(assert (=> start!56676 m!603253))

(declare-fun m!603255 () Bool)

(assert (=> b!627657 m!603255))

(declare-fun m!603257 () Bool)

(assert (=> b!627657 m!603257))

(declare-fun m!603259 () Bool)

(assert (=> b!627660 m!603259))

(declare-fun m!603261 () Bool)

(assert (=> b!627660 m!603261))

(declare-fun m!603263 () Bool)

(assert (=> b!627660 m!603263))

(declare-fun m!603265 () Bool)

(assert (=> b!627664 m!603265))

(declare-fun m!603267 () Bool)

(assert (=> b!627659 m!603267))

(declare-fun m!603269 () Bool)

(assert (=> b!627661 m!603269))

(assert (=> b!627665 m!603257))

(assert (=> b!627665 m!603257))

(declare-fun m!603271 () Bool)

(assert (=> b!627665 m!603271))

(assert (=> b!627663 m!603257))

(assert (=> b!627663 m!603257))

(declare-fun m!603273 () Bool)

(assert (=> b!627663 m!603273))

(declare-fun m!603275 () Bool)

(assert (=> b!627666 m!603275))

(check-sat (not b!627666) (not b!627661) (not b!627664) (not b!627667) (not b!627658) (not b!627663) (not start!56676) (not b!627659) (not b!627665))
(check-sat)
