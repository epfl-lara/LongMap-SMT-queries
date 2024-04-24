; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56802 () Bool)

(assert start!56802)

(declare-fun b!629052 () Bool)

(declare-fun res!406505 () Bool)

(declare-fun e!359847 () Bool)

(assert (=> b!629052 (=> (not res!406505) (not e!359847))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37986 0))(
  ( (array!37987 (arr!18229 (Array (_ BitVec 32) (_ BitVec 64))) (size!18593 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37986)

(assert (=> b!629052 (= res!406505 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18229 a!2986) index!984) (select (arr!18229 a!2986) j!136))) (not (= (select (arr!18229 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!629053 () Bool)

(declare-fun res!406507 () Bool)

(declare-fun e!359845 () Bool)

(assert (=> b!629053 (=> (not res!406507) (not e!359845))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!629053 (= res!406507 (validKeyInArray!0 (select (arr!18229 a!2986) j!136)))))

(declare-fun b!629054 () Bool)

(assert (=> b!629054 (= e!359847 false)))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!290679 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!629054 (= lt!290679 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!629055 () Bool)

(declare-fun res!406509 () Bool)

(assert (=> b!629055 (=> (not res!406509) (not e!359847))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6625 0))(
  ( (MissingZero!6625 (index!28784 (_ BitVec 32))) (Found!6625 (index!28785 (_ BitVec 32))) (Intermediate!6625 (undefined!7437 Bool) (index!28786 (_ BitVec 32)) (x!57670 (_ BitVec 32))) (Undefined!6625) (MissingVacant!6625 (index!28787 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37986 (_ BitVec 32)) SeekEntryResult!6625)

(assert (=> b!629055 (= res!406509 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18229 a!2986) j!136) a!2986 mask!3053) (Found!6625 j!136)))))

(declare-fun b!629056 () Bool)

(declare-fun res!406512 () Bool)

(assert (=> b!629056 (=> (not res!406512) (not e!359847))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!629056 (= res!406512 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18229 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18229 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!629057 () Bool)

(declare-fun res!406504 () Bool)

(assert (=> b!629057 (=> (not res!406504) (not e!359845))))

(declare-fun arrayContainsKey!0 (array!37986 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!629057 (= res!406504 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!629058 () Bool)

(assert (=> b!629058 (= e!359845 e!359847)))

(declare-fun res!406508 () Bool)

(assert (=> b!629058 (=> (not res!406508) (not e!359847))))

(declare-fun lt!290680 () SeekEntryResult!6625)

(assert (=> b!629058 (= res!406508 (or (= lt!290680 (MissingZero!6625 i!1108)) (= lt!290680 (MissingVacant!6625 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37986 (_ BitVec 32)) SeekEntryResult!6625)

(assert (=> b!629058 (= lt!290680 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!406510 () Bool)

(assert (=> start!56802 (=> (not res!406510) (not e!359845))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56802 (= res!406510 (validMask!0 mask!3053))))

(assert (=> start!56802 e!359845))

(assert (=> start!56802 true))

(declare-fun array_inv!14088 (array!37986) Bool)

(assert (=> start!56802 (array_inv!14088 a!2986)))

(declare-fun b!629059 () Bool)

(declare-fun res!406513 () Bool)

(assert (=> b!629059 (=> (not res!406513) (not e!359847))))

(declare-datatypes ((List!12177 0))(
  ( (Nil!12174) (Cons!12173 (h!13221 (_ BitVec 64)) (t!18397 List!12177)) )
))
(declare-fun arrayNoDuplicates!0 (array!37986 (_ BitVec 32) List!12177) Bool)

(assert (=> b!629059 (= res!406513 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12174))))

(declare-fun b!629060 () Bool)

(declare-fun res!406506 () Bool)

(assert (=> b!629060 (=> (not res!406506) (not e!359845))))

(assert (=> b!629060 (= res!406506 (and (= (size!18593 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18593 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18593 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!629061 () Bool)

(declare-fun res!406511 () Bool)

(assert (=> b!629061 (=> (not res!406511) (not e!359847))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37986 (_ BitVec 32)) Bool)

(assert (=> b!629061 (= res!406511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!629062 () Bool)

(declare-fun res!406503 () Bool)

(assert (=> b!629062 (=> (not res!406503) (not e!359845))))

(assert (=> b!629062 (= res!406503 (validKeyInArray!0 k0!1786))))

(assert (= (and start!56802 res!406510) b!629060))

(assert (= (and b!629060 res!406506) b!629053))

(assert (= (and b!629053 res!406507) b!629062))

(assert (= (and b!629062 res!406503) b!629057))

(assert (= (and b!629057 res!406504) b!629058))

(assert (= (and b!629058 res!406508) b!629061))

(assert (= (and b!629061 res!406511) b!629059))

(assert (= (and b!629059 res!406513) b!629056))

(assert (= (and b!629056 res!406512) b!629055))

(assert (= (and b!629055 res!406509) b!629052))

(assert (= (and b!629052 res!406505) b!629054))

(declare-fun m!604453 () Bool)

(assert (=> b!629059 m!604453))

(declare-fun m!604455 () Bool)

(assert (=> b!629055 m!604455))

(assert (=> b!629055 m!604455))

(declare-fun m!604457 () Bool)

(assert (=> b!629055 m!604457))

(declare-fun m!604459 () Bool)

(assert (=> b!629054 m!604459))

(declare-fun m!604461 () Bool)

(assert (=> start!56802 m!604461))

(declare-fun m!604463 () Bool)

(assert (=> start!56802 m!604463))

(declare-fun m!604465 () Bool)

(assert (=> b!629062 m!604465))

(declare-fun m!604467 () Bool)

(assert (=> b!629052 m!604467))

(assert (=> b!629052 m!604455))

(assert (=> b!629053 m!604455))

(assert (=> b!629053 m!604455))

(declare-fun m!604469 () Bool)

(assert (=> b!629053 m!604469))

(declare-fun m!604471 () Bool)

(assert (=> b!629057 m!604471))

(declare-fun m!604473 () Bool)

(assert (=> b!629061 m!604473))

(declare-fun m!604475 () Bool)

(assert (=> b!629058 m!604475))

(declare-fun m!604477 () Bool)

(assert (=> b!629056 m!604477))

(declare-fun m!604479 () Bool)

(assert (=> b!629056 m!604479))

(declare-fun m!604481 () Bool)

(assert (=> b!629056 m!604481))

(check-sat (not b!629058) (not b!629055) (not b!629053) (not b!629057) (not b!629062) (not b!629061) (not b!629059) (not b!629054) (not start!56802))
(check-sat)
