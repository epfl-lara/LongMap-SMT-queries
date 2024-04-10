; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56328 () Bool)

(assert start!56328)

(declare-fun b!624591 () Bool)

(declare-fun res!402743 () Bool)

(declare-fun e!358143 () Bool)

(assert (=> b!624591 (=> (not res!402743) (not e!358143))))

(declare-datatypes ((array!37753 0))(
  ( (array!37754 (arr!18121 (Array (_ BitVec 32) (_ BitVec 64))) (size!18485 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37753)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624591 (= res!402743 (validKeyInArray!0 (select (arr!18121 a!2986) j!136)))))

(declare-fun b!624592 () Bool)

(declare-fun e!358141 () Bool)

(assert (=> b!624592 (= e!358141 false)))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6561 0))(
  ( (MissingZero!6561 (index!28528 (_ BitVec 32))) (Found!6561 (index!28529 (_ BitVec 32))) (Intermediate!6561 (undefined!7373 Bool) (index!28530 (_ BitVec 32)) (x!57284 (_ BitVec 32))) (Undefined!6561) (MissingVacant!6561 (index!28531 (_ BitVec 32))) )
))
(declare-fun lt!289632 () SeekEntryResult!6561)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37753 (_ BitVec 32)) SeekEntryResult!6561)

(assert (=> b!624592 (= lt!289632 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18121 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!624593 () Bool)

(declare-fun res!402745 () Bool)

(assert (=> b!624593 (=> (not res!402745) (not e!358143))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624593 (= res!402745 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624594 () Bool)

(declare-fun res!402744 () Bool)

(assert (=> b!624594 (=> (not res!402744) (not e!358143))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!624594 (= res!402744 (and (= (size!18485 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18485 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18485 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624595 () Bool)

(declare-fun res!402741 () Bool)

(assert (=> b!624595 (=> (not res!402741) (not e!358141))))

(declare-datatypes ((List!12162 0))(
  ( (Nil!12159) (Cons!12158 (h!13203 (_ BitVec 64)) (t!18390 List!12162)) )
))
(declare-fun arrayNoDuplicates!0 (array!37753 (_ BitVec 32) List!12162) Bool)

(assert (=> b!624595 (= res!402741 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12159))))

(declare-fun res!402747 () Bool)

(assert (=> start!56328 (=> (not res!402747) (not e!358143))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56328 (= res!402747 (validMask!0 mask!3053))))

(assert (=> start!56328 e!358143))

(assert (=> start!56328 true))

(declare-fun array_inv!13917 (array!37753) Bool)

(assert (=> start!56328 (array_inv!13917 a!2986)))

(declare-fun b!624596 () Bool)

(declare-fun res!402749 () Bool)

(assert (=> b!624596 (=> (not res!402749) (not e!358143))))

(assert (=> b!624596 (= res!402749 (validKeyInArray!0 k0!1786))))

(declare-fun b!624597 () Bool)

(assert (=> b!624597 (= e!358143 e!358141)))

(declare-fun res!402748 () Bool)

(assert (=> b!624597 (=> (not res!402748) (not e!358141))))

(declare-fun lt!289633 () SeekEntryResult!6561)

(assert (=> b!624597 (= res!402748 (or (= lt!289633 (MissingZero!6561 i!1108)) (= lt!289633 (MissingVacant!6561 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37753 (_ BitVec 32)) SeekEntryResult!6561)

(assert (=> b!624597 (= lt!289633 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!624598 () Bool)

(declare-fun res!402746 () Bool)

(assert (=> b!624598 (=> (not res!402746) (not e!358141))))

(assert (=> b!624598 (= res!402746 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18121 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18121 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!624599 () Bool)

(declare-fun res!402742 () Bool)

(assert (=> b!624599 (=> (not res!402742) (not e!358141))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37753 (_ BitVec 32)) Bool)

(assert (=> b!624599 (= res!402742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!56328 res!402747) b!624594))

(assert (= (and b!624594 res!402744) b!624591))

(assert (= (and b!624591 res!402743) b!624596))

(assert (= (and b!624596 res!402749) b!624593))

(assert (= (and b!624593 res!402745) b!624597))

(assert (= (and b!624597 res!402748) b!624599))

(assert (= (and b!624599 res!402742) b!624595))

(assert (= (and b!624595 res!402741) b!624598))

(assert (= (and b!624598 res!402746) b!624592))

(declare-fun m!600283 () Bool)

(assert (=> b!624598 m!600283))

(declare-fun m!600285 () Bool)

(assert (=> b!624598 m!600285))

(declare-fun m!600287 () Bool)

(assert (=> b!624598 m!600287))

(declare-fun m!600289 () Bool)

(assert (=> b!624599 m!600289))

(declare-fun m!600291 () Bool)

(assert (=> b!624597 m!600291))

(declare-fun m!600293 () Bool)

(assert (=> b!624596 m!600293))

(declare-fun m!600295 () Bool)

(assert (=> b!624593 m!600295))

(declare-fun m!600297 () Bool)

(assert (=> b!624595 m!600297))

(declare-fun m!600299 () Bool)

(assert (=> b!624592 m!600299))

(assert (=> b!624592 m!600299))

(declare-fun m!600301 () Bool)

(assert (=> b!624592 m!600301))

(assert (=> b!624591 m!600299))

(assert (=> b!624591 m!600299))

(declare-fun m!600303 () Bool)

(assert (=> b!624591 m!600303))

(declare-fun m!600305 () Bool)

(assert (=> start!56328 m!600305))

(declare-fun m!600307 () Bool)

(assert (=> start!56328 m!600307))

(check-sat (not b!624597) (not b!624591) (not b!624595) (not b!624596) (not b!624593) (not b!624599) (not b!624592) (not start!56328))
(check-sat)
