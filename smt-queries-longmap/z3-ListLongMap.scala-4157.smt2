; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56682 () Bool)

(assert start!56682)

(declare-fun b!627756 () Bool)

(declare-fun e!359415 () Bool)

(declare-fun e!359414 () Bool)

(assert (=> b!627756 (= e!359415 e!359414)))

(declare-fun res!405356 () Bool)

(assert (=> b!627756 (=> (not res!405356) (not e!359414))))

(declare-datatypes ((SeekEntryResult!6592 0))(
  ( (MissingZero!6592 (index!28652 (_ BitVec 32))) (Found!6592 (index!28653 (_ BitVec 32))) (Intermediate!6592 (undefined!7404 Bool) (index!28654 (_ BitVec 32)) (x!57543 (_ BitVec 32))) (Undefined!6592) (MissingVacant!6592 (index!28655 (_ BitVec 32))) )
))
(declare-fun lt!290400 () SeekEntryResult!6592)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!627756 (= res!405356 (or (= lt!290400 (MissingZero!6592 i!1108)) (= lt!290400 (MissingVacant!6592 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!37917 0))(
  ( (array!37918 (arr!18196 (Array (_ BitVec 32) (_ BitVec 64))) (size!18560 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37917)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37917 (_ BitVec 32)) SeekEntryResult!6592)

(assert (=> b!627756 (= lt!290400 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!627757 () Bool)

(declare-fun res!405351 () Bool)

(assert (=> b!627757 (=> (not res!405351) (not e!359414))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!627757 (= res!405351 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18196 a!2986) index!984) (select (arr!18196 a!2986) j!136))) (not (= (select (arr!18196 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!627758 () Bool)

(declare-fun res!405354 () Bool)

(assert (=> b!627758 (=> (not res!405354) (not e!359415))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627758 (= res!405354 (validKeyInArray!0 k0!1786))))

(declare-fun b!627759 () Bool)

(declare-fun res!405358 () Bool)

(assert (=> b!627759 (=> (not res!405358) (not e!359414))))

(declare-datatypes ((List!12144 0))(
  ( (Nil!12141) (Cons!12140 (h!13188 (_ BitVec 64)) (t!18364 List!12144)) )
))
(declare-fun arrayNoDuplicates!0 (array!37917 (_ BitVec 32) List!12144) Bool)

(assert (=> b!627759 (= res!405358 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12141))))

(declare-fun b!627760 () Bool)

(declare-fun res!405355 () Bool)

(assert (=> b!627760 (=> (not res!405355) (not e!359415))))

(declare-fun arrayContainsKey!0 (array!37917 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627760 (= res!405355 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627761 () Bool)

(declare-fun res!405360 () Bool)

(assert (=> b!627761 (=> (not res!405360) (not e!359415))))

(assert (=> b!627761 (= res!405360 (and (= (size!18560 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18560 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18560 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627762 () Bool)

(declare-fun res!405353 () Bool)

(assert (=> b!627762 (=> (not res!405353) (not e!359415))))

(assert (=> b!627762 (= res!405353 (validKeyInArray!0 (select (arr!18196 a!2986) j!136)))))

(declare-fun b!627763 () Bool)

(declare-fun res!405352 () Bool)

(assert (=> b!627763 (=> (not res!405352) (not e!359414))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37917 (_ BitVec 32)) SeekEntryResult!6592)

(assert (=> b!627763 (= res!405352 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18196 a!2986) j!136) a!2986 mask!3053) (Found!6592 j!136)))))

(declare-fun b!627764 () Bool)

(declare-fun res!405359 () Bool)

(assert (=> b!627764 (=> (not res!405359) (not e!359414))))

(assert (=> b!627764 (= res!405359 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18196 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18196 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!405361 () Bool)

(assert (=> start!56682 (=> (not res!405361) (not e!359415))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56682 (= res!405361 (validMask!0 mask!3053))))

(assert (=> start!56682 e!359415))

(assert (=> start!56682 true))

(declare-fun array_inv!14055 (array!37917) Bool)

(assert (=> start!56682 (array_inv!14055 a!2986)))

(declare-fun b!627765 () Bool)

(declare-fun res!405357 () Bool)

(assert (=> b!627765 (=> (not res!405357) (not e!359414))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37917 (_ BitVec 32)) Bool)

(assert (=> b!627765 (= res!405357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627766 () Bool)

(assert (=> b!627766 (= e!359414 false)))

(declare-fun lt!290401 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627766 (= lt!290401 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (= (and start!56682 res!405361) b!627761))

(assert (= (and b!627761 res!405360) b!627762))

(assert (= (and b!627762 res!405353) b!627758))

(assert (= (and b!627758 res!405354) b!627760))

(assert (= (and b!627760 res!405355) b!627756))

(assert (= (and b!627756 res!405356) b!627765))

(assert (= (and b!627765 res!405357) b!627759))

(assert (= (and b!627759 res!405358) b!627764))

(assert (= (and b!627764 res!405359) b!627763))

(assert (= (and b!627763 res!405352) b!627757))

(assert (= (and b!627757 res!405351) b!627766))

(declare-fun m!603337 () Bool)

(assert (=> b!627764 m!603337))

(declare-fun m!603339 () Bool)

(assert (=> b!627764 m!603339))

(declare-fun m!603341 () Bool)

(assert (=> b!627764 m!603341))

(declare-fun m!603343 () Bool)

(assert (=> b!627765 m!603343))

(declare-fun m!603345 () Bool)

(assert (=> b!627757 m!603345))

(declare-fun m!603347 () Bool)

(assert (=> b!627757 m!603347))

(declare-fun m!603349 () Bool)

(assert (=> b!627756 m!603349))

(declare-fun m!603351 () Bool)

(assert (=> start!56682 m!603351))

(declare-fun m!603353 () Bool)

(assert (=> start!56682 m!603353))

(assert (=> b!627763 m!603347))

(assert (=> b!627763 m!603347))

(declare-fun m!603355 () Bool)

(assert (=> b!627763 m!603355))

(declare-fun m!603357 () Bool)

(assert (=> b!627759 m!603357))

(declare-fun m!603359 () Bool)

(assert (=> b!627758 m!603359))

(declare-fun m!603361 () Bool)

(assert (=> b!627766 m!603361))

(declare-fun m!603363 () Bool)

(assert (=> b!627760 m!603363))

(assert (=> b!627762 m!603347))

(assert (=> b!627762 m!603347))

(declare-fun m!603365 () Bool)

(assert (=> b!627762 m!603365))

(check-sat (not start!56682) (not b!627760) (not b!627765) (not b!627763) (not b!627762) (not b!627758) (not b!627759) (not b!627756) (not b!627766))
(check-sat)
