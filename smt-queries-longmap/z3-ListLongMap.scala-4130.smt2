; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56310 () Bool)

(assert start!56310)

(declare-fun b!624293 () Bool)

(declare-fun res!402591 () Bool)

(declare-fun e!357960 () Bool)

(assert (=> b!624293 (=> (not res!402591) (not e!357960))))

(declare-datatypes ((array!37749 0))(
  ( (array!37750 (arr!18119 (Array (_ BitVec 32) (_ BitVec 64))) (size!18484 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37749)

(declare-datatypes ((List!12199 0))(
  ( (Nil!12196) (Cons!12195 (h!13240 (_ BitVec 64)) (t!18418 List!12199)) )
))
(declare-fun arrayNoDuplicates!0 (array!37749 (_ BitVec 32) List!12199) Bool)

(assert (=> b!624293 (= res!402591 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12196))))

(declare-fun b!624294 () Bool)

(declare-fun res!402587 () Bool)

(declare-fun e!357958 () Bool)

(assert (=> b!624294 (=> (not res!402587) (not e!357958))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!624294 (= res!402587 (and (= (size!18484 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18484 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18484 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!402592 () Bool)

(assert (=> start!56310 (=> (not res!402592) (not e!357958))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56310 (= res!402592 (validMask!0 mask!3053))))

(assert (=> start!56310 e!357958))

(assert (=> start!56310 true))

(declare-fun array_inv!14002 (array!37749) Bool)

(assert (=> start!56310 (array_inv!14002 a!2986)))

(declare-fun b!624295 () Bool)

(declare-fun res!402585 () Bool)

(assert (=> b!624295 (=> (not res!402585) (not e!357958))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37749 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624295 (= res!402585 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624296 () Bool)

(declare-fun res!402588 () Bool)

(assert (=> b!624296 (=> (not res!402588) (not e!357960))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!624296 (= res!402588 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18119 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18119 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!624297 () Bool)

(declare-fun res!402590 () Bool)

(assert (=> b!624297 (=> (not res!402590) (not e!357960))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37749 (_ BitVec 32)) Bool)

(assert (=> b!624297 (= res!402590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!624298 () Bool)

(assert (=> b!624298 (= e!357958 e!357960)))

(declare-fun res!402589 () Bool)

(assert (=> b!624298 (=> (not res!402589) (not e!357960))))

(declare-datatypes ((SeekEntryResult!6556 0))(
  ( (MissingZero!6556 (index!28508 (_ BitVec 32))) (Found!6556 (index!28509 (_ BitVec 32))) (Intermediate!6556 (undefined!7368 Bool) (index!28510 (_ BitVec 32)) (x!57274 (_ BitVec 32))) (Undefined!6556) (MissingVacant!6556 (index!28511 (_ BitVec 32))) )
))
(declare-fun lt!289392 () SeekEntryResult!6556)

(assert (=> b!624298 (= res!402589 (or (= lt!289392 (MissingZero!6556 i!1108)) (= lt!289392 (MissingVacant!6556 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37749 (_ BitVec 32)) SeekEntryResult!6556)

(assert (=> b!624298 (= lt!289392 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!624299 () Bool)

(declare-fun res!402593 () Bool)

(assert (=> b!624299 (=> (not res!402593) (not e!357958))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624299 (= res!402593 (validKeyInArray!0 (select (arr!18119 a!2986) j!136)))))

(declare-fun b!624300 () Bool)

(assert (=> b!624300 (= e!357960 false)))

(declare-fun lt!289393 () SeekEntryResult!6556)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37749 (_ BitVec 32)) SeekEntryResult!6556)

(assert (=> b!624300 (= lt!289393 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18119 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!624301 () Bool)

(declare-fun res!402586 () Bool)

(assert (=> b!624301 (=> (not res!402586) (not e!357958))))

(assert (=> b!624301 (= res!402586 (validKeyInArray!0 k0!1786))))

(assert (= (and start!56310 res!402592) b!624294))

(assert (= (and b!624294 res!402587) b!624299))

(assert (= (and b!624299 res!402593) b!624301))

(assert (= (and b!624301 res!402586) b!624295))

(assert (= (and b!624295 res!402585) b!624298))

(assert (= (and b!624298 res!402589) b!624297))

(assert (= (and b!624297 res!402590) b!624293))

(assert (= (and b!624293 res!402591) b!624296))

(assert (= (and b!624296 res!402588) b!624300))

(declare-fun m!599485 () Bool)

(assert (=> b!624298 m!599485))

(declare-fun m!599487 () Bool)

(assert (=> b!624293 m!599487))

(declare-fun m!599489 () Bool)

(assert (=> b!624299 m!599489))

(assert (=> b!624299 m!599489))

(declare-fun m!599491 () Bool)

(assert (=> b!624299 m!599491))

(declare-fun m!599493 () Bool)

(assert (=> b!624301 m!599493))

(declare-fun m!599495 () Bool)

(assert (=> b!624295 m!599495))

(declare-fun m!599497 () Bool)

(assert (=> b!624296 m!599497))

(declare-fun m!599499 () Bool)

(assert (=> b!624296 m!599499))

(declare-fun m!599501 () Bool)

(assert (=> b!624296 m!599501))

(declare-fun m!599503 () Bool)

(assert (=> b!624297 m!599503))

(assert (=> b!624300 m!599489))

(assert (=> b!624300 m!599489))

(declare-fun m!599505 () Bool)

(assert (=> b!624300 m!599505))

(declare-fun m!599507 () Bool)

(assert (=> start!56310 m!599507))

(declare-fun m!599509 () Bool)

(assert (=> start!56310 m!599509))

(check-sat (not b!624300) (not b!624301) (not b!624293) (not start!56310) (not b!624299) (not b!624295) (not b!624297) (not b!624298))
(check-sat)
