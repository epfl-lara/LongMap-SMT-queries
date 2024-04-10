; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56418 () Bool)

(assert start!56418)

(declare-fun b!625379 () Bool)

(declare-fun res!403387 () Bool)

(declare-fun e!358466 () Bool)

(assert (=> b!625379 (=> (not res!403387) (not e!358466))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37798 0))(
  ( (array!37799 (arr!18142 (Array (_ BitVec 32) (_ BitVec 64))) (size!18506 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37798)

(assert (=> b!625379 (= res!403387 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18142 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18142 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!625380 () Bool)

(declare-fun res!403392 () Bool)

(declare-fun e!358465 () Bool)

(assert (=> b!625380 (=> (not res!403392) (not e!358465))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!625380 (= res!403392 (and (= (size!18506 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18506 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18506 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625381 () Bool)

(declare-fun res!403393 () Bool)

(assert (=> b!625381 (=> (not res!403393) (not e!358465))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625381 (= res!403393 (validKeyInArray!0 k0!1786))))

(declare-fun b!625382 () Bool)

(assert (=> b!625382 (= e!358465 e!358466)))

(declare-fun res!403385 () Bool)

(assert (=> b!625382 (=> (not res!403385) (not e!358466))))

(declare-datatypes ((SeekEntryResult!6582 0))(
  ( (MissingZero!6582 (index!28612 (_ BitVec 32))) (Found!6582 (index!28613 (_ BitVec 32))) (Intermediate!6582 (undefined!7394 Bool) (index!28614 (_ BitVec 32)) (x!57364 (_ BitVec 32))) (Undefined!6582) (MissingVacant!6582 (index!28615 (_ BitVec 32))) )
))
(declare-fun lt!289816 () SeekEntryResult!6582)

(assert (=> b!625382 (= res!403385 (or (= lt!289816 (MissingZero!6582 i!1108)) (= lt!289816 (MissingVacant!6582 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37798 (_ BitVec 32)) SeekEntryResult!6582)

(assert (=> b!625382 (= lt!289816 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!625383 () Bool)

(declare-fun res!403391 () Bool)

(assert (=> b!625383 (=> (not res!403391) (not e!358466))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37798 (_ BitVec 32)) SeekEntryResult!6582)

(assert (=> b!625383 (= res!403391 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18142 a!2986) j!136) a!2986 mask!3053) (Found!6582 j!136)))))

(declare-fun res!403389 () Bool)

(assert (=> start!56418 (=> (not res!403389) (not e!358465))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56418 (= res!403389 (validMask!0 mask!3053))))

(assert (=> start!56418 e!358465))

(assert (=> start!56418 true))

(declare-fun array_inv!13938 (array!37798) Bool)

(assert (=> start!56418 (array_inv!13938 a!2986)))

(declare-fun b!625384 () Bool)

(declare-fun res!403388 () Bool)

(assert (=> b!625384 (=> (not res!403388) (not e!358465))))

(assert (=> b!625384 (= res!403388 (validKeyInArray!0 (select (arr!18142 a!2986) j!136)))))

(declare-fun b!625385 () Bool)

(declare-fun res!403394 () Bool)

(assert (=> b!625385 (=> (not res!403394) (not e!358465))))

(declare-fun arrayContainsKey!0 (array!37798 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625385 (= res!403394 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625386 () Bool)

(assert (=> b!625386 (= e!358466 (and (bvslt x!910 #b01111111111111111111111111111110) (bvsge index!984 (size!18506 a!2986))))))

(declare-fun b!625387 () Bool)

(declare-fun res!403390 () Bool)

(assert (=> b!625387 (=> (not res!403390) (not e!358466))))

(declare-datatypes ((List!12183 0))(
  ( (Nil!12180) (Cons!12179 (h!13224 (_ BitVec 64)) (t!18411 List!12183)) )
))
(declare-fun arrayNoDuplicates!0 (array!37798 (_ BitVec 32) List!12183) Bool)

(assert (=> b!625387 (= res!403390 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12180))))

(declare-fun b!625388 () Bool)

(declare-fun res!403386 () Bool)

(assert (=> b!625388 (=> (not res!403386) (not e!358466))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37798 (_ BitVec 32)) Bool)

(assert (=> b!625388 (= res!403386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!56418 res!403389) b!625380))

(assert (= (and b!625380 res!403392) b!625384))

(assert (= (and b!625384 res!403388) b!625381))

(assert (= (and b!625381 res!403393) b!625385))

(assert (= (and b!625385 res!403394) b!625382))

(assert (= (and b!625382 res!403385) b!625388))

(assert (= (and b!625388 res!403386) b!625387))

(assert (= (and b!625387 res!403390) b!625379))

(assert (= (and b!625379 res!403387) b!625383))

(assert (= (and b!625383 res!403391) b!625386))

(declare-fun m!600955 () Bool)

(assert (=> b!625379 m!600955))

(declare-fun m!600957 () Bool)

(assert (=> b!625379 m!600957))

(declare-fun m!600959 () Bool)

(assert (=> b!625379 m!600959))

(declare-fun m!600961 () Bool)

(assert (=> b!625381 m!600961))

(declare-fun m!600963 () Bool)

(assert (=> b!625382 m!600963))

(declare-fun m!600965 () Bool)

(assert (=> b!625384 m!600965))

(assert (=> b!625384 m!600965))

(declare-fun m!600967 () Bool)

(assert (=> b!625384 m!600967))

(declare-fun m!600969 () Bool)

(assert (=> start!56418 m!600969))

(declare-fun m!600971 () Bool)

(assert (=> start!56418 m!600971))

(declare-fun m!600973 () Bool)

(assert (=> b!625385 m!600973))

(declare-fun m!600975 () Bool)

(assert (=> b!625387 m!600975))

(declare-fun m!600977 () Bool)

(assert (=> b!625388 m!600977))

(assert (=> b!625383 m!600965))

(assert (=> b!625383 m!600965))

(declare-fun m!600979 () Bool)

(assert (=> b!625383 m!600979))

(check-sat (not b!625382) (not b!625383) (not b!625387) (not b!625384) (not b!625385) (not start!56418) (not b!625388) (not b!625381))
(check-sat)
