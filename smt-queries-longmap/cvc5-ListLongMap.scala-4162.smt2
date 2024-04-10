; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56660 () Bool)

(assert start!56660)

(declare-fun b!628042 () Bool)

(declare-fun res!405747 () Bool)

(declare-fun e!359421 () Bool)

(assert (=> b!628042 (=> (not res!405747) (not e!359421))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!628042 (= res!405747 (validKeyInArray!0 k!1786))))

(declare-fun b!628043 () Bool)

(declare-fun res!405743 () Bool)

(declare-fun e!359419 () Bool)

(assert (=> b!628043 (=> (not res!405743) (not e!359419))))

(declare-datatypes ((array!37952 0))(
  ( (array!37953 (arr!18216 (Array (_ BitVec 32) (_ BitVec 64))) (size!18580 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37952)

(declare-datatypes ((List!12257 0))(
  ( (Nil!12254) (Cons!12253 (h!13298 (_ BitVec 64)) (t!18485 List!12257)) )
))
(declare-fun arrayNoDuplicates!0 (array!37952 (_ BitVec 32) List!12257) Bool)

(assert (=> b!628043 (= res!405743 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12254))))

(declare-fun b!628045 () Bool)

(declare-fun res!405748 () Bool)

(assert (=> b!628045 (=> (not res!405748) (not e!359419))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!628045 (= res!405748 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18216 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18216 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!628046 () Bool)

(declare-fun res!405744 () Bool)

(assert (=> b!628046 (=> (not res!405744) (not e!359419))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6656 0))(
  ( (MissingZero!6656 (index!28908 (_ BitVec 32))) (Found!6656 (index!28909 (_ BitVec 32))) (Intermediate!6656 (undefined!7468 Bool) (index!28910 (_ BitVec 32)) (x!57644 (_ BitVec 32))) (Undefined!6656) (MissingVacant!6656 (index!28911 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37952 (_ BitVec 32)) SeekEntryResult!6656)

(assert (=> b!628046 (= res!405744 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18216 a!2986) j!136) a!2986 mask!3053) (Found!6656 j!136)))))

(declare-fun b!628047 () Bool)

(declare-fun res!405752 () Bool)

(assert (=> b!628047 (=> (not res!405752) (not e!359419))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37952 (_ BitVec 32)) Bool)

(assert (=> b!628047 (= res!405752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!628048 () Bool)

(declare-fun res!405751 () Bool)

(assert (=> b!628048 (=> (not res!405751) (not e!359421))))

(declare-fun arrayContainsKey!0 (array!37952 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!628048 (= res!405751 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!628049 () Bool)

(declare-fun res!405750 () Bool)

(assert (=> b!628049 (=> (not res!405750) (not e!359421))))

(assert (=> b!628049 (= res!405750 (validKeyInArray!0 (select (arr!18216 a!2986) j!136)))))

(declare-fun b!628050 () Bool)

(declare-fun res!405749 () Bool)

(assert (=> b!628050 (=> (not res!405749) (not e!359421))))

(assert (=> b!628050 (= res!405749 (and (= (size!18580 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18580 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18580 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!628044 () Bool)

(assert (=> b!628044 (= e!359419 false)))

(declare-fun lt!290389 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!628044 (= lt!290389 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!405746 () Bool)

(assert (=> start!56660 (=> (not res!405746) (not e!359421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56660 (= res!405746 (validMask!0 mask!3053))))

(assert (=> start!56660 e!359421))

(assert (=> start!56660 true))

(declare-fun array_inv!14012 (array!37952) Bool)

(assert (=> start!56660 (array_inv!14012 a!2986)))

(declare-fun b!628051 () Bool)

(declare-fun res!405745 () Bool)

(assert (=> b!628051 (=> (not res!405745) (not e!359419))))

(assert (=> b!628051 (= res!405745 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18216 a!2986) index!984) (select (arr!18216 a!2986) j!136))) (not (= (select (arr!18216 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!628052 () Bool)

(assert (=> b!628052 (= e!359421 e!359419)))

(declare-fun res!405742 () Bool)

(assert (=> b!628052 (=> (not res!405742) (not e!359419))))

(declare-fun lt!290388 () SeekEntryResult!6656)

(assert (=> b!628052 (= res!405742 (or (= lt!290388 (MissingZero!6656 i!1108)) (= lt!290388 (MissingVacant!6656 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37952 (_ BitVec 32)) SeekEntryResult!6656)

(assert (=> b!628052 (= lt!290388 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!56660 res!405746) b!628050))

(assert (= (and b!628050 res!405749) b!628049))

(assert (= (and b!628049 res!405750) b!628042))

(assert (= (and b!628042 res!405747) b!628048))

(assert (= (and b!628048 res!405751) b!628052))

(assert (= (and b!628052 res!405742) b!628047))

(assert (= (and b!628047 res!405752) b!628043))

(assert (= (and b!628043 res!405743) b!628045))

(assert (= (and b!628045 res!405748) b!628046))

(assert (= (and b!628046 res!405744) b!628051))

(assert (= (and b!628051 res!405745) b!628044))

(declare-fun m!603297 () Bool)

(assert (=> b!628051 m!603297))

(declare-fun m!603299 () Bool)

(assert (=> b!628051 m!603299))

(declare-fun m!603301 () Bool)

(assert (=> b!628047 m!603301))

(declare-fun m!603303 () Bool)

(assert (=> b!628044 m!603303))

(declare-fun m!603305 () Bool)

(assert (=> b!628042 m!603305))

(declare-fun m!603307 () Bool)

(assert (=> start!56660 m!603307))

(declare-fun m!603309 () Bool)

(assert (=> start!56660 m!603309))

(declare-fun m!603311 () Bool)

(assert (=> b!628048 m!603311))

(declare-fun m!603313 () Bool)

(assert (=> b!628052 m!603313))

(declare-fun m!603315 () Bool)

(assert (=> b!628043 m!603315))

(assert (=> b!628046 m!603299))

(assert (=> b!628046 m!603299))

(declare-fun m!603317 () Bool)

(assert (=> b!628046 m!603317))

(assert (=> b!628049 m!603299))

(assert (=> b!628049 m!603299))

(declare-fun m!603319 () Bool)

(assert (=> b!628049 m!603319))

(declare-fun m!603321 () Bool)

(assert (=> b!628045 m!603321))

(declare-fun m!603323 () Bool)

(assert (=> b!628045 m!603323))

(declare-fun m!603325 () Bool)

(assert (=> b!628045 m!603325))

(push 1)

(assert (not b!628046))

(assert (not b!628047))

(assert (not b!628049))

(assert (not b!628042))

(assert (not b!628048))

