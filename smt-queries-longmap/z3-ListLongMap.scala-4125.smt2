; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56298 () Bool)

(assert start!56298)

(declare-fun e!358007 () Bool)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun b!624235 () Bool)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37723 0))(
  ( (array!37724 (arr!18106 (Array (_ BitVec 32) (_ BitVec 64))) (size!18470 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37723)

(assert (=> b!624235 (= e!358007 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge vacantSpotIndex!68 (size!18470 a!2986))))))

(declare-fun res!402390 () Bool)

(declare-fun e!358006 () Bool)

(assert (=> start!56298 (=> (not res!402390) (not e!358006))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56298 (= res!402390 (validMask!0 mask!3053))))

(assert (=> start!56298 e!358006))

(assert (=> start!56298 true))

(declare-fun array_inv!13902 (array!37723) Bool)

(assert (=> start!56298 (array_inv!13902 a!2986)))

(declare-fun b!624236 () Bool)

(assert (=> b!624236 (= e!358006 e!358007)))

(declare-fun res!402392 () Bool)

(assert (=> b!624236 (=> (not res!402392) (not e!358007))))

(declare-datatypes ((SeekEntryResult!6546 0))(
  ( (MissingZero!6546 (index!28468 (_ BitVec 32))) (Found!6546 (index!28469 (_ BitVec 32))) (Intermediate!6546 (undefined!7358 Bool) (index!28470 (_ BitVec 32)) (x!57229 (_ BitVec 32))) (Undefined!6546) (MissingVacant!6546 (index!28471 (_ BitVec 32))) )
))
(declare-fun lt!289555 () SeekEntryResult!6546)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!624236 (= res!402392 (or (= lt!289555 (MissingZero!6546 i!1108)) (= lt!289555 (MissingVacant!6546 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37723 (_ BitVec 32)) SeekEntryResult!6546)

(assert (=> b!624236 (= lt!289555 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!624237 () Bool)

(declare-fun res!402389 () Bool)

(assert (=> b!624237 (=> (not res!402389) (not e!358006))))

(declare-fun arrayContainsKey!0 (array!37723 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624237 (= res!402389 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624238 () Bool)

(declare-fun res!402386 () Bool)

(assert (=> b!624238 (=> (not res!402386) (not e!358007))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37723 (_ BitVec 32)) Bool)

(assert (=> b!624238 (= res!402386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!624239 () Bool)

(declare-fun res!402391 () Bool)

(assert (=> b!624239 (=> (not res!402391) (not e!358007))))

(declare-datatypes ((List!12147 0))(
  ( (Nil!12144) (Cons!12143 (h!13188 (_ BitVec 64)) (t!18375 List!12147)) )
))
(declare-fun arrayNoDuplicates!0 (array!37723 (_ BitVec 32) List!12147) Bool)

(assert (=> b!624239 (= res!402391 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12144))))

(declare-fun b!624240 () Bool)

(declare-fun res!402385 () Bool)

(assert (=> b!624240 (=> (not res!402385) (not e!358006))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!624240 (= res!402385 (and (= (size!18470 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18470 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18470 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624241 () Bool)

(declare-fun res!402388 () Bool)

(assert (=> b!624241 (=> (not res!402388) (not e!358006))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624241 (= res!402388 (validKeyInArray!0 k0!1786))))

(declare-fun b!624242 () Bool)

(declare-fun res!402387 () Bool)

(assert (=> b!624242 (=> (not res!402387) (not e!358006))))

(assert (=> b!624242 (= res!402387 (validKeyInArray!0 (select (arr!18106 a!2986) j!136)))))

(assert (= (and start!56298 res!402390) b!624240))

(assert (= (and b!624240 res!402385) b!624242))

(assert (= (and b!624242 res!402387) b!624241))

(assert (= (and b!624241 res!402388) b!624237))

(assert (= (and b!624237 res!402389) b!624236))

(assert (= (and b!624236 res!402392) b!624238))

(assert (= (and b!624238 res!402386) b!624239))

(assert (= (and b!624239 res!402391) b!624235))

(declare-fun m!599975 () Bool)

(assert (=> b!624242 m!599975))

(assert (=> b!624242 m!599975))

(declare-fun m!599977 () Bool)

(assert (=> b!624242 m!599977))

(declare-fun m!599979 () Bool)

(assert (=> b!624239 m!599979))

(declare-fun m!599981 () Bool)

(assert (=> start!56298 m!599981))

(declare-fun m!599983 () Bool)

(assert (=> start!56298 m!599983))

(declare-fun m!599985 () Bool)

(assert (=> b!624241 m!599985))

(declare-fun m!599987 () Bool)

(assert (=> b!624237 m!599987))

(declare-fun m!599989 () Bool)

(assert (=> b!624238 m!599989))

(declare-fun m!599991 () Bool)

(assert (=> b!624236 m!599991))

(check-sat (not b!624237) (not b!624239) (not b!624241) (not b!624238) (not b!624236) (not start!56298) (not b!624242))
(check-sat)
