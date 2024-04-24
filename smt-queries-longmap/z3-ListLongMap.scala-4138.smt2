; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56472 () Bool)

(assert start!56472)

(declare-fun res!403549 () Bool)

(declare-fun e!358613 () Bool)

(assert (=> start!56472 (=> (not res!403549) (not e!358613))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56472 (= res!403549 (validMask!0 mask!3053))))

(assert (=> start!56472 e!358613))

(assert (=> start!56472 true))

(declare-datatypes ((array!37797 0))(
  ( (array!37798 (arr!18139 (Array (_ BitVec 32) (_ BitVec 64))) (size!18503 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37797)

(declare-fun array_inv!13998 (array!37797) Bool)

(assert (=> start!56472 (array_inv!13998 a!2986)))

(declare-fun b!625646 () Bool)

(declare-fun res!403553 () Bool)

(declare-fun e!358612 () Bool)

(assert (=> b!625646 (=> (not res!403553) (not e!358612))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!625646 (= res!403553 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18139 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18139 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!625647 () Bool)

(declare-fun res!403547 () Bool)

(assert (=> b!625647 (=> (not res!403547) (not e!358612))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37797 (_ BitVec 32)) Bool)

(assert (=> b!625647 (= res!403547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625648 () Bool)

(assert (=> b!625648 (= e!358613 e!358612)))

(declare-fun res!403554 () Bool)

(assert (=> b!625648 (=> (not res!403554) (not e!358612))))

(declare-datatypes ((SeekEntryResult!6535 0))(
  ( (MissingZero!6535 (index!28424 (_ BitVec 32))) (Found!6535 (index!28425 (_ BitVec 32))) (Intermediate!6535 (undefined!7347 Bool) (index!28426 (_ BitVec 32)) (x!57328 (_ BitVec 32))) (Undefined!6535) (MissingVacant!6535 (index!28427 (_ BitVec 32))) )
))
(declare-fun lt!289926 () SeekEntryResult!6535)

(assert (=> b!625648 (= res!403554 (or (= lt!289926 (MissingZero!6535 i!1108)) (= lt!289926 (MissingVacant!6535 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37797 (_ BitVec 32)) SeekEntryResult!6535)

(assert (=> b!625648 (= lt!289926 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!625649 () Bool)

(assert (=> b!625649 (= e!358612 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!289927 () SeekEntryResult!6535)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37797 (_ BitVec 32)) SeekEntryResult!6535)

(assert (=> b!625649 (= lt!289927 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18139 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625650 () Bool)

(declare-fun res!403552 () Bool)

(assert (=> b!625650 (=> (not res!403552) (not e!358613))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625650 (= res!403552 (validKeyInArray!0 k0!1786))))

(declare-fun b!625651 () Bool)

(declare-fun res!403551 () Bool)

(assert (=> b!625651 (=> (not res!403551) (not e!358613))))

(declare-fun arrayContainsKey!0 (array!37797 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625651 (= res!403551 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625652 () Bool)

(declare-fun res!403548 () Bool)

(assert (=> b!625652 (=> (not res!403548) (not e!358612))))

(declare-datatypes ((List!12087 0))(
  ( (Nil!12084) (Cons!12083 (h!13131 (_ BitVec 64)) (t!18307 List!12087)) )
))
(declare-fun arrayNoDuplicates!0 (array!37797 (_ BitVec 32) List!12087) Bool)

(assert (=> b!625652 (= res!403548 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12084))))

(declare-fun b!625653 () Bool)

(declare-fun res!403555 () Bool)

(assert (=> b!625653 (=> (not res!403555) (not e!358613))))

(assert (=> b!625653 (= res!403555 (and (= (size!18503 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18503 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18503 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625654 () Bool)

(declare-fun res!403550 () Bool)

(assert (=> b!625654 (=> (not res!403550) (not e!358613))))

(assert (=> b!625654 (= res!403550 (validKeyInArray!0 (select (arr!18139 a!2986) j!136)))))

(assert (= (and start!56472 res!403549) b!625653))

(assert (= (and b!625653 res!403555) b!625654))

(assert (= (and b!625654 res!403550) b!625650))

(assert (= (and b!625650 res!403552) b!625651))

(assert (= (and b!625651 res!403551) b!625648))

(assert (= (and b!625648 res!403554) b!625647))

(assert (= (and b!625647 res!403547) b!625652))

(assert (= (and b!625652 res!403548) b!625646))

(assert (= (and b!625646 res!403553) b!625649))

(declare-fun m!601489 () Bool)

(assert (=> b!625652 m!601489))

(declare-fun m!601491 () Bool)

(assert (=> b!625647 m!601491))

(declare-fun m!601493 () Bool)

(assert (=> start!56472 m!601493))

(declare-fun m!601495 () Bool)

(assert (=> start!56472 m!601495))

(declare-fun m!601497 () Bool)

(assert (=> b!625654 m!601497))

(assert (=> b!625654 m!601497))

(declare-fun m!601499 () Bool)

(assert (=> b!625654 m!601499))

(declare-fun m!601501 () Bool)

(assert (=> b!625651 m!601501))

(declare-fun m!601503 () Bool)

(assert (=> b!625650 m!601503))

(assert (=> b!625649 m!601497))

(assert (=> b!625649 m!601497))

(declare-fun m!601505 () Bool)

(assert (=> b!625649 m!601505))

(declare-fun m!601507 () Bool)

(assert (=> b!625646 m!601507))

(declare-fun m!601509 () Bool)

(assert (=> b!625646 m!601509))

(declare-fun m!601511 () Bool)

(assert (=> b!625646 m!601511))

(declare-fun m!601513 () Bool)

(assert (=> b!625648 m!601513))

(check-sat (not b!625651) (not b!625649) (not b!625648) (not b!625654) (not b!625652) (not start!56472) (not b!625647) (not b!625650))
(check-sat)
