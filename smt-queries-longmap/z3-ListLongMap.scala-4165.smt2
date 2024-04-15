; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56718 () Bool)

(assert start!56718)

(declare-fun res!405979 () Bool)

(declare-fun e!359461 () Bool)

(assert (=> start!56718 (=> (not res!405979) (not e!359461))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56718 (= res!405979 (validMask!0 mask!3053))))

(assert (=> start!56718 e!359461))

(assert (=> start!56718 true))

(declare-datatypes ((array!37971 0))(
  ( (array!37972 (arr!18224 (Array (_ BitVec 32) (_ BitVec 64))) (size!18589 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37971)

(declare-fun array_inv!14107 (array!37971) Bool)

(assert (=> start!56718 (array_inv!14107 a!2986)))

(declare-fun b!628275 () Bool)

(declare-fun res!405981 () Bool)

(declare-fun e!359462 () Bool)

(assert (=> b!628275 (=> (not res!405981) (not e!359462))))

(declare-datatypes ((List!12304 0))(
  ( (Nil!12301) (Cons!12300 (h!13345 (_ BitVec 64)) (t!18523 List!12304)) )
))
(declare-fun arrayNoDuplicates!0 (array!37971 (_ BitVec 32) List!12304) Bool)

(assert (=> b!628275 (= res!405981 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12301))))

(declare-fun b!628276 () Bool)

(declare-fun res!405976 () Bool)

(assert (=> b!628276 (=> (not res!405976) (not e!359462))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37971 (_ BitVec 32)) Bool)

(assert (=> b!628276 (= res!405976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!628277 () Bool)

(declare-fun res!405978 () Bool)

(assert (=> b!628277 (=> (not res!405978) (not e!359461))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!628277 (= res!405978 (validKeyInArray!0 (select (arr!18224 a!2986) j!136)))))

(declare-fun b!628278 () Bool)

(declare-fun lt!290290 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!628278 (= e!359462 (and (bvsge lt!290290 #b00000000000000000000000000000000) (bvslt lt!290290 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!628278 (= lt!290290 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!628279 () Bool)

(declare-fun res!405983 () Bool)

(assert (=> b!628279 (=> (not res!405983) (not e!359462))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!628279 (= res!405983 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18224 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18224 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!628280 () Bool)

(declare-fun res!405980 () Bool)

(assert (=> b!628280 (=> (not res!405980) (not e!359462))))

(assert (=> b!628280 (= res!405980 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18224 a!2986) index!984) (select (arr!18224 a!2986) j!136))) (not (= (select (arr!18224 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!628281 () Bool)

(assert (=> b!628281 (= e!359461 e!359462)))

(declare-fun res!405974 () Bool)

(assert (=> b!628281 (=> (not res!405974) (not e!359462))))

(declare-datatypes ((SeekEntryResult!6661 0))(
  ( (MissingZero!6661 (index!28928 (_ BitVec 32))) (Found!6661 (index!28929 (_ BitVec 32))) (Intermediate!6661 (undefined!7473 Bool) (index!28930 (_ BitVec 32)) (x!57674 (_ BitVec 32))) (Undefined!6661) (MissingVacant!6661 (index!28931 (_ BitVec 32))) )
))
(declare-fun lt!290289 () SeekEntryResult!6661)

(assert (=> b!628281 (= res!405974 (or (= lt!290289 (MissingZero!6661 i!1108)) (= lt!290289 (MissingVacant!6661 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37971 (_ BitVec 32)) SeekEntryResult!6661)

(assert (=> b!628281 (= lt!290289 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!628282 () Bool)

(declare-fun res!405982 () Bool)

(assert (=> b!628282 (=> (not res!405982) (not e!359461))))

(assert (=> b!628282 (= res!405982 (validKeyInArray!0 k0!1786))))

(declare-fun b!628283 () Bool)

(declare-fun res!405975 () Bool)

(assert (=> b!628283 (=> (not res!405975) (not e!359462))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37971 (_ BitVec 32)) SeekEntryResult!6661)

(assert (=> b!628283 (= res!405975 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18224 a!2986) j!136) a!2986 mask!3053) (Found!6661 j!136)))))

(declare-fun b!628284 () Bool)

(declare-fun res!405973 () Bool)

(assert (=> b!628284 (=> (not res!405973) (not e!359461))))

(assert (=> b!628284 (= res!405973 (and (= (size!18589 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18589 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18589 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!628285 () Bool)

(declare-fun res!405977 () Bool)

(assert (=> b!628285 (=> (not res!405977) (not e!359461))))

(declare-fun arrayContainsKey!0 (array!37971 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!628285 (= res!405977 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!56718 res!405979) b!628284))

(assert (= (and b!628284 res!405973) b!628277))

(assert (= (and b!628277 res!405978) b!628282))

(assert (= (and b!628282 res!405982) b!628285))

(assert (= (and b!628285 res!405977) b!628281))

(assert (= (and b!628281 res!405974) b!628276))

(assert (= (and b!628276 res!405976) b!628275))

(assert (= (and b!628275 res!405981) b!628279))

(assert (= (and b!628279 res!405983) b!628283))

(assert (= (and b!628283 res!405975) b!628280))

(assert (= (and b!628280 res!405980) b!628278))

(declare-fun m!602923 () Bool)

(assert (=> start!56718 m!602923))

(declare-fun m!602925 () Bool)

(assert (=> start!56718 m!602925))

(declare-fun m!602927 () Bool)

(assert (=> b!628282 m!602927))

(declare-fun m!602929 () Bool)

(assert (=> b!628281 m!602929))

(declare-fun m!602931 () Bool)

(assert (=> b!628285 m!602931))

(declare-fun m!602933 () Bool)

(assert (=> b!628280 m!602933))

(declare-fun m!602935 () Bool)

(assert (=> b!628280 m!602935))

(assert (=> b!628283 m!602935))

(assert (=> b!628283 m!602935))

(declare-fun m!602937 () Bool)

(assert (=> b!628283 m!602937))

(declare-fun m!602939 () Bool)

(assert (=> b!628279 m!602939))

(declare-fun m!602941 () Bool)

(assert (=> b!628279 m!602941))

(declare-fun m!602943 () Bool)

(assert (=> b!628279 m!602943))

(assert (=> b!628277 m!602935))

(assert (=> b!628277 m!602935))

(declare-fun m!602945 () Bool)

(assert (=> b!628277 m!602945))

(declare-fun m!602947 () Bool)

(assert (=> b!628276 m!602947))

(declare-fun m!602949 () Bool)

(assert (=> b!628278 m!602949))

(declare-fun m!602951 () Bool)

(assert (=> b!628275 m!602951))

(check-sat (not b!628275) (not b!628283) (not b!628281) (not b!628285) (not b!628277) (not b!628282) (not b!628278) (not b!628276) (not start!56718))
(check-sat)
