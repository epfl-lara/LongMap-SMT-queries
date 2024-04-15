; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56724 () Bool)

(assert start!56724)

(declare-fun b!628374 () Bool)

(declare-fun res!406074 () Bool)

(declare-fun e!359489 () Bool)

(assert (=> b!628374 (=> (not res!406074) (not e!359489))))

(declare-datatypes ((array!37977 0))(
  ( (array!37978 (arr!18227 (Array (_ BitVec 32) (_ BitVec 64))) (size!18592 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37977)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!628374 (= res!406074 (validKeyInArray!0 (select (arr!18227 a!2986) j!136)))))

(declare-fun b!628375 () Bool)

(declare-fun res!406075 () Bool)

(assert (=> b!628375 (=> (not res!406075) (not e!359489))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!628375 (= res!406075 (and (= (size!18592 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18592 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18592 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!628376 () Bool)

(declare-fun res!406080 () Bool)

(declare-fun e!359490 () Bool)

(assert (=> b!628376 (=> (not res!406080) (not e!359490))))

(declare-datatypes ((List!12307 0))(
  ( (Nil!12304) (Cons!12303 (h!13348 (_ BitVec 64)) (t!18526 List!12307)) )
))
(declare-fun arrayNoDuplicates!0 (array!37977 (_ BitVec 32) List!12307) Bool)

(assert (=> b!628376 (= res!406080 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12304))))

(declare-fun res!406076 () Bool)

(assert (=> start!56724 (=> (not res!406076) (not e!359489))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56724 (= res!406076 (validMask!0 mask!3053))))

(assert (=> start!56724 e!359489))

(assert (=> start!56724 true))

(declare-fun array_inv!14110 (array!37977) Bool)

(assert (=> start!56724 (array_inv!14110 a!2986)))

(declare-fun b!628377 () Bool)

(declare-fun res!406078 () Bool)

(assert (=> b!628377 (=> (not res!406078) (not e!359489))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!628377 (= res!406078 (validKeyInArray!0 k0!1786))))

(declare-fun b!628378 () Bool)

(assert (=> b!628378 (= e!359490 false)))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!290308 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!628378 (= lt!290308 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!628379 () Bool)

(assert (=> b!628379 (= e!359489 e!359490)))

(declare-fun res!406077 () Bool)

(assert (=> b!628379 (=> (not res!406077) (not e!359490))))

(declare-datatypes ((SeekEntryResult!6664 0))(
  ( (MissingZero!6664 (index!28940 (_ BitVec 32))) (Found!6664 (index!28941 (_ BitVec 32))) (Intermediate!6664 (undefined!7476 Bool) (index!28942 (_ BitVec 32)) (x!57685 (_ BitVec 32))) (Undefined!6664) (MissingVacant!6664 (index!28943 (_ BitVec 32))) )
))
(declare-fun lt!290307 () SeekEntryResult!6664)

(assert (=> b!628379 (= res!406077 (or (= lt!290307 (MissingZero!6664 i!1108)) (= lt!290307 (MissingVacant!6664 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37977 (_ BitVec 32)) SeekEntryResult!6664)

(assert (=> b!628379 (= lt!290307 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!628380 () Bool)

(declare-fun res!406072 () Bool)

(assert (=> b!628380 (=> (not res!406072) (not e!359490))))

(assert (=> b!628380 (= res!406072 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18227 a!2986) index!984) (select (arr!18227 a!2986) j!136))) (not (= (select (arr!18227 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!628381 () Bool)

(declare-fun res!406082 () Bool)

(assert (=> b!628381 (=> (not res!406082) (not e!359489))))

(declare-fun arrayContainsKey!0 (array!37977 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!628381 (= res!406082 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!628382 () Bool)

(declare-fun res!406073 () Bool)

(assert (=> b!628382 (=> (not res!406073) (not e!359490))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37977 (_ BitVec 32)) Bool)

(assert (=> b!628382 (= res!406073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!628383 () Bool)

(declare-fun res!406081 () Bool)

(assert (=> b!628383 (=> (not res!406081) (not e!359490))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!628383 (= res!406081 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18227 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18227 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!628384 () Bool)

(declare-fun res!406079 () Bool)

(assert (=> b!628384 (=> (not res!406079) (not e!359490))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37977 (_ BitVec 32)) SeekEntryResult!6664)

(assert (=> b!628384 (= res!406079 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18227 a!2986) j!136) a!2986 mask!3053) (Found!6664 j!136)))))

(assert (= (and start!56724 res!406076) b!628375))

(assert (= (and b!628375 res!406075) b!628374))

(assert (= (and b!628374 res!406074) b!628377))

(assert (= (and b!628377 res!406078) b!628381))

(assert (= (and b!628381 res!406082) b!628379))

(assert (= (and b!628379 res!406077) b!628382))

(assert (= (and b!628382 res!406073) b!628376))

(assert (= (and b!628376 res!406080) b!628383))

(assert (= (and b!628383 res!406081) b!628384))

(assert (= (and b!628384 res!406079) b!628380))

(assert (= (and b!628380 res!406072) b!628378))

(declare-fun m!603013 () Bool)

(assert (=> b!628378 m!603013))

(declare-fun m!603015 () Bool)

(assert (=> b!628381 m!603015))

(declare-fun m!603017 () Bool)

(assert (=> b!628376 m!603017))

(declare-fun m!603019 () Bool)

(assert (=> b!628383 m!603019))

(declare-fun m!603021 () Bool)

(assert (=> b!628383 m!603021))

(declare-fun m!603023 () Bool)

(assert (=> b!628383 m!603023))

(declare-fun m!603025 () Bool)

(assert (=> b!628380 m!603025))

(declare-fun m!603027 () Bool)

(assert (=> b!628380 m!603027))

(assert (=> b!628384 m!603027))

(assert (=> b!628384 m!603027))

(declare-fun m!603029 () Bool)

(assert (=> b!628384 m!603029))

(declare-fun m!603031 () Bool)

(assert (=> b!628382 m!603031))

(declare-fun m!603033 () Bool)

(assert (=> b!628377 m!603033))

(assert (=> b!628374 m!603027))

(assert (=> b!628374 m!603027))

(declare-fun m!603035 () Bool)

(assert (=> b!628374 m!603035))

(declare-fun m!603037 () Bool)

(assert (=> b!628379 m!603037))

(declare-fun m!603039 () Bool)

(assert (=> start!56724 m!603039))

(declare-fun m!603041 () Bool)

(assert (=> start!56724 m!603041))

(check-sat (not b!628378) (not start!56724) (not b!628381) (not b!628384) (not b!628379) (not b!628377) (not b!628374) (not b!628376) (not b!628382))
(check-sat)
