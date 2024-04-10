; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56310 () Bool)

(assert start!56310)

(declare-fun res!402527 () Bool)

(declare-fun e!358060 () Bool)

(assert (=> start!56310 (=> (not res!402527) (not e!358060))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56310 (= res!402527 (validMask!0 mask!3053))))

(assert (=> start!56310 e!358060))

(assert (=> start!56310 true))

(declare-datatypes ((array!37735 0))(
  ( (array!37736 (arr!18112 (Array (_ BitVec 32) (_ BitVec 64))) (size!18476 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37735)

(declare-fun array_inv!13908 (array!37735) Bool)

(assert (=> start!56310 (array_inv!13908 a!2986)))

(declare-fun b!624370 () Bool)

(declare-fun res!402522 () Bool)

(assert (=> b!624370 (=> (not res!402522) (not e!358060))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!624370 (= res!402522 (and (= (size!18476 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18476 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18476 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624371 () Bool)

(declare-fun res!402526 () Bool)

(assert (=> b!624371 (=> (not res!402526) (not e!358060))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624371 (= res!402526 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624372 () Bool)

(declare-fun res!402520 () Bool)

(declare-fun e!358061 () Bool)

(assert (=> b!624372 (=> (not res!402520) (not e!358061))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37735 (_ BitVec 32)) Bool)

(assert (=> b!624372 (= res!402520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!624373 () Bool)

(declare-fun res!402521 () Bool)

(assert (=> b!624373 (=> (not res!402521) (not e!358060))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624373 (= res!402521 (validKeyInArray!0 k0!1786))))

(declare-fun b!624374 () Bool)

(declare-fun res!402525 () Bool)

(assert (=> b!624374 (=> (not res!402525) (not e!358060))))

(assert (=> b!624374 (= res!402525 (validKeyInArray!0 (select (arr!18112 a!2986) j!136)))))

(declare-fun b!624375 () Bool)

(declare-fun res!402523 () Bool)

(assert (=> b!624375 (=> (not res!402523) (not e!358061))))

(declare-datatypes ((List!12153 0))(
  ( (Nil!12150) (Cons!12149 (h!13194 (_ BitVec 64)) (t!18381 List!12153)) )
))
(declare-fun arrayNoDuplicates!0 (array!37735 (_ BitVec 32) List!12153) Bool)

(assert (=> b!624375 (= res!402523 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12150))))

(declare-fun b!624376 () Bool)

(assert (=> b!624376 (= e!358060 e!358061)))

(declare-fun res!402524 () Bool)

(assert (=> b!624376 (=> (not res!402524) (not e!358061))))

(declare-datatypes ((SeekEntryResult!6552 0))(
  ( (MissingZero!6552 (index!28492 (_ BitVec 32))) (Found!6552 (index!28493 (_ BitVec 32))) (Intermediate!6552 (undefined!7364 Bool) (index!28494 (_ BitVec 32)) (x!57251 (_ BitVec 32))) (Undefined!6552) (MissingVacant!6552 (index!28495 (_ BitVec 32))) )
))
(declare-fun lt!289582 () SeekEntryResult!6552)

(assert (=> b!624376 (= res!402524 (or (= lt!289582 (MissingZero!6552 i!1108)) (= lt!289582 (MissingVacant!6552 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37735 (_ BitVec 32)) SeekEntryResult!6552)

(assert (=> b!624376 (= lt!289582 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun b!624377 () Bool)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!624377 (= e!358061 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18112 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantSpotIndex!68 (size!18476 a!2986))))))

(assert (= (and start!56310 res!402527) b!624370))

(assert (= (and b!624370 res!402522) b!624374))

(assert (= (and b!624374 res!402525) b!624373))

(assert (= (and b!624373 res!402521) b!624371))

(assert (= (and b!624371 res!402526) b!624376))

(assert (= (and b!624376 res!402524) b!624372))

(assert (= (and b!624372 res!402520) b!624375))

(assert (= (and b!624375 res!402523) b!624377))

(declare-fun m!600085 () Bool)

(assert (=> b!624374 m!600085))

(assert (=> b!624374 m!600085))

(declare-fun m!600087 () Bool)

(assert (=> b!624374 m!600087))

(declare-fun m!600089 () Bool)

(assert (=> start!56310 m!600089))

(declare-fun m!600091 () Bool)

(assert (=> start!56310 m!600091))

(declare-fun m!600093 () Bool)

(assert (=> b!624375 m!600093))

(declare-fun m!600095 () Bool)

(assert (=> b!624373 m!600095))

(declare-fun m!600097 () Bool)

(assert (=> b!624377 m!600097))

(declare-fun m!600099 () Bool)

(assert (=> b!624372 m!600099))

(declare-fun m!600101 () Bool)

(assert (=> b!624371 m!600101))

(declare-fun m!600103 () Bool)

(assert (=> b!624376 m!600103))

(check-sat (not b!624375) (not b!624373) (not b!624372) (not b!624376) (not b!624371) (not start!56310) (not b!624374))
(check-sat)
