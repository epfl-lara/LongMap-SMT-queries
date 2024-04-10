; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56638 () Bool)

(assert start!56638)

(declare-fun b!627679 () Bool)

(declare-fun res!405385 () Bool)

(declare-fun e!359322 () Bool)

(assert (=> b!627679 (=> (not res!405385) (not e!359322))))

(declare-datatypes ((array!37930 0))(
  ( (array!37931 (arr!18205 (Array (_ BitVec 32) (_ BitVec 64))) (size!18569 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37930)

(declare-datatypes ((List!12246 0))(
  ( (Nil!12243) (Cons!12242 (h!13287 (_ BitVec 64)) (t!18474 List!12246)) )
))
(declare-fun arrayNoDuplicates!0 (array!37930 (_ BitVec 32) List!12246) Bool)

(assert (=> b!627679 (= res!405385 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12243))))

(declare-fun b!627681 () Bool)

(declare-fun res!405379 () Bool)

(declare-fun e!359320 () Bool)

(assert (=> b!627681 (=> (not res!405379) (not e!359320))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37930 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627681 (= res!405379 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627682 () Bool)

(declare-fun res!405382 () Bool)

(assert (=> b!627682 (=> (not res!405382) (not e!359320))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627682 (= res!405382 (validKeyInArray!0 (select (arr!18205 a!2986) j!136)))))

(declare-fun b!627683 () Bool)

(declare-fun res!405386 () Bool)

(assert (=> b!627683 (=> (not res!405386) (not e!359320))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!627683 (= res!405386 (and (= (size!18569 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18569 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18569 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627684 () Bool)

(assert (=> b!627684 (= e!359322 false)))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lt!290322 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627684 (= lt!290322 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!627685 () Bool)

(declare-fun res!405380 () Bool)

(assert (=> b!627685 (=> (not res!405380) (not e!359322))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37930 (_ BitVec 32)) Bool)

(assert (=> b!627685 (= res!405380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627686 () Bool)

(declare-fun res!405388 () Bool)

(assert (=> b!627686 (=> (not res!405388) (not e!359322))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!627686 (= res!405388 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18205 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18205 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!627687 () Bool)

(declare-fun res!405383 () Bool)

(assert (=> b!627687 (=> (not res!405383) (not e!359320))))

(assert (=> b!627687 (= res!405383 (validKeyInArray!0 k0!1786))))

(declare-fun b!627688 () Bool)

(declare-fun res!405387 () Bool)

(assert (=> b!627688 (=> (not res!405387) (not e!359322))))

(declare-datatypes ((SeekEntryResult!6645 0))(
  ( (MissingZero!6645 (index!28864 (_ BitVec 32))) (Found!6645 (index!28865 (_ BitVec 32))) (Intermediate!6645 (undefined!7457 Bool) (index!28866 (_ BitVec 32)) (x!57601 (_ BitVec 32))) (Undefined!6645) (MissingVacant!6645 (index!28867 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37930 (_ BitVec 32)) SeekEntryResult!6645)

(assert (=> b!627688 (= res!405387 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18205 a!2986) j!136) a!2986 mask!3053) (Found!6645 j!136)))))

(declare-fun b!627689 () Bool)

(assert (=> b!627689 (= e!359320 e!359322)))

(declare-fun res!405389 () Bool)

(assert (=> b!627689 (=> (not res!405389) (not e!359322))))

(declare-fun lt!290323 () SeekEntryResult!6645)

(assert (=> b!627689 (= res!405389 (or (= lt!290323 (MissingZero!6645 i!1108)) (= lt!290323 (MissingVacant!6645 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37930 (_ BitVec 32)) SeekEntryResult!6645)

(assert (=> b!627689 (= lt!290323 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!627680 () Bool)

(declare-fun res!405381 () Bool)

(assert (=> b!627680 (=> (not res!405381) (not e!359322))))

(assert (=> b!627680 (= res!405381 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18205 a!2986) index!984) (select (arr!18205 a!2986) j!136))) (not (= (select (arr!18205 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun res!405384 () Bool)

(assert (=> start!56638 (=> (not res!405384) (not e!359320))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56638 (= res!405384 (validMask!0 mask!3053))))

(assert (=> start!56638 e!359320))

(assert (=> start!56638 true))

(declare-fun array_inv!14001 (array!37930) Bool)

(assert (=> start!56638 (array_inv!14001 a!2986)))

(assert (= (and start!56638 res!405384) b!627683))

(assert (= (and b!627683 res!405386) b!627682))

(assert (= (and b!627682 res!405382) b!627687))

(assert (= (and b!627687 res!405383) b!627681))

(assert (= (and b!627681 res!405379) b!627689))

(assert (= (and b!627689 res!405389) b!627685))

(assert (= (and b!627685 res!405380) b!627679))

(assert (= (and b!627679 res!405385) b!627686))

(assert (= (and b!627686 res!405388) b!627688))

(assert (= (and b!627688 res!405387) b!627680))

(assert (= (and b!627680 res!405381) b!627684))

(declare-fun m!602967 () Bool)

(assert (=> b!627689 m!602967))

(declare-fun m!602969 () Bool)

(assert (=> b!627684 m!602969))

(declare-fun m!602971 () Bool)

(assert (=> b!627680 m!602971))

(declare-fun m!602973 () Bool)

(assert (=> b!627680 m!602973))

(declare-fun m!602975 () Bool)

(assert (=> start!56638 m!602975))

(declare-fun m!602977 () Bool)

(assert (=> start!56638 m!602977))

(assert (=> b!627682 m!602973))

(assert (=> b!627682 m!602973))

(declare-fun m!602979 () Bool)

(assert (=> b!627682 m!602979))

(assert (=> b!627688 m!602973))

(assert (=> b!627688 m!602973))

(declare-fun m!602981 () Bool)

(assert (=> b!627688 m!602981))

(declare-fun m!602983 () Bool)

(assert (=> b!627686 m!602983))

(declare-fun m!602985 () Bool)

(assert (=> b!627686 m!602985))

(declare-fun m!602987 () Bool)

(assert (=> b!627686 m!602987))

(declare-fun m!602989 () Bool)

(assert (=> b!627679 m!602989))

(declare-fun m!602991 () Bool)

(assert (=> b!627681 m!602991))

(declare-fun m!602993 () Bool)

(assert (=> b!627685 m!602993))

(declare-fun m!602995 () Bool)

(assert (=> b!627687 m!602995))

(check-sat (not b!627682) (not b!627687) (not b!627681) (not b!627685) (not b!627684) (not start!56638) (not b!627688) (not b!627679) (not b!627689))
(check-sat)
