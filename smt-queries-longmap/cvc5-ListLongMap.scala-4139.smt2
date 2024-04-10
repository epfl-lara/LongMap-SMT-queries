; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56428 () Bool)

(assert start!56428)

(declare-fun res!403530 () Bool)

(declare-fun e!358512 () Bool)

(assert (=> start!56428 (=> (not res!403530) (not e!358512))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56428 (= res!403530 (validMask!0 mask!3053))))

(assert (=> start!56428 e!358512))

(assert (=> start!56428 true))

(declare-datatypes ((array!37808 0))(
  ( (array!37809 (arr!18147 (Array (_ BitVec 32) (_ BitVec 64))) (size!18511 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37808)

(declare-fun array_inv!13943 (array!37808) Bool)

(assert (=> start!56428 (array_inv!13943 a!2986)))

(declare-fun b!625518 () Bool)

(declare-fun res!403524 () Bool)

(declare-fun e!358511 () Bool)

(assert (=> b!625518 (=> (not res!403524) (not e!358511))))

(declare-datatypes ((List!12188 0))(
  ( (Nil!12185) (Cons!12184 (h!13229 (_ BitVec 64)) (t!18416 List!12188)) )
))
(declare-fun arrayNoDuplicates!0 (array!37808 (_ BitVec 32) List!12188) Bool)

(assert (=> b!625518 (= res!403524 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12185))))

(declare-fun b!625519 () Bool)

(assert (=> b!625519 (= e!358512 e!358511)))

(declare-fun res!403531 () Bool)

(assert (=> b!625519 (=> (not res!403531) (not e!358511))))

(declare-datatypes ((SeekEntryResult!6587 0))(
  ( (MissingZero!6587 (index!28632 (_ BitVec 32))) (Found!6587 (index!28633 (_ BitVec 32))) (Intermediate!6587 (undefined!7399 Bool) (index!28634 (_ BitVec 32)) (x!57385 (_ BitVec 32))) (Undefined!6587) (MissingVacant!6587 (index!28635 (_ BitVec 32))) )
))
(declare-fun lt!289843 () SeekEntryResult!6587)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!625519 (= res!403531 (or (= lt!289843 (MissingZero!6587 i!1108)) (= lt!289843 (MissingVacant!6587 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37808 (_ BitVec 32)) SeekEntryResult!6587)

(assert (=> b!625519 (= lt!289843 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!625520 () Bool)

(declare-fun res!403527 () Bool)

(assert (=> b!625520 (=> (not res!403527) (not e!358512))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625520 (= res!403527 (validKeyInArray!0 k!1786))))

(declare-fun b!625521 () Bool)

(declare-fun res!403528 () Bool)

(assert (=> b!625521 (=> (not res!403528) (not e!358512))))

(declare-fun arrayContainsKey!0 (array!37808 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625521 (= res!403528 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625522 () Bool)

(assert (=> b!625522 (= e!358511 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!289842 () SeekEntryResult!6587)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37808 (_ BitVec 32)) SeekEntryResult!6587)

(assert (=> b!625522 (= lt!289842 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18147 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625523 () Bool)

(declare-fun res!403529 () Bool)

(assert (=> b!625523 (=> (not res!403529) (not e!358512))))

(assert (=> b!625523 (= res!403529 (and (= (size!18511 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18511 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18511 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625524 () Bool)

(declare-fun res!403526 () Bool)

(assert (=> b!625524 (=> (not res!403526) (not e!358511))))

(assert (=> b!625524 (= res!403526 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18147 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18147 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!625525 () Bool)

(declare-fun res!403532 () Bool)

(assert (=> b!625525 (=> (not res!403532) (not e!358512))))

(assert (=> b!625525 (= res!403532 (validKeyInArray!0 (select (arr!18147 a!2986) j!136)))))

(declare-fun b!625526 () Bool)

(declare-fun res!403525 () Bool)

(assert (=> b!625526 (=> (not res!403525) (not e!358511))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37808 (_ BitVec 32)) Bool)

(assert (=> b!625526 (= res!403525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!56428 res!403530) b!625523))

(assert (= (and b!625523 res!403529) b!625525))

(assert (= (and b!625525 res!403532) b!625520))

(assert (= (and b!625520 res!403527) b!625521))

(assert (= (and b!625521 res!403528) b!625519))

(assert (= (and b!625519 res!403531) b!625526))

(assert (= (and b!625526 res!403525) b!625518))

(assert (= (and b!625518 res!403524) b!625524))

(assert (= (and b!625524 res!403526) b!625522))

(declare-fun m!601085 () Bool)

(assert (=> b!625522 m!601085))

(assert (=> b!625522 m!601085))

(declare-fun m!601087 () Bool)

(assert (=> b!625522 m!601087))

(declare-fun m!601089 () Bool)

(assert (=> b!625521 m!601089))

(declare-fun m!601091 () Bool)

(assert (=> b!625519 m!601091))

(assert (=> b!625525 m!601085))

(assert (=> b!625525 m!601085))

(declare-fun m!601093 () Bool)

(assert (=> b!625525 m!601093))

(declare-fun m!601095 () Bool)

(assert (=> b!625518 m!601095))

(declare-fun m!601097 () Bool)

(assert (=> b!625526 m!601097))

(declare-fun m!601099 () Bool)

(assert (=> start!56428 m!601099))

(declare-fun m!601101 () Bool)

(assert (=> start!56428 m!601101))

(declare-fun m!601103 () Bool)

(assert (=> b!625524 m!601103))

(declare-fun m!601105 () Bool)

(assert (=> b!625524 m!601105))

(declare-fun m!601107 () Bool)

(assert (=> b!625524 m!601107))

(declare-fun m!601109 () Bool)

(assert (=> b!625520 m!601109))

(push 1)

