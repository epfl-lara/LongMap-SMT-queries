; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53376 () Bool)

(assert start!53376)

(declare-fun b!580544 () Bool)

(declare-fun res!368503 () Bool)

(declare-fun e!333282 () Bool)

(assert (=> b!580544 (=> (not res!368503) (not e!333282))))

(declare-datatypes ((array!36291 0))(
  ( (array!36292 (arr!17420 (Array (_ BitVec 32) (_ BitVec 64))) (size!17785 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36291)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580544 (= res!368503 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580545 () Bool)

(declare-fun res!368510 () Bool)

(assert (=> b!580545 (=> (not res!368510) (not e!333282))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580545 (= res!368510 (validKeyInArray!0 (select (arr!17420 a!2986) j!136)))))

(declare-fun b!580546 () Bool)

(declare-fun res!368505 () Bool)

(assert (=> b!580546 (=> (not res!368505) (not e!333282))))

(assert (=> b!580546 (= res!368505 (validKeyInArray!0 k0!1786))))

(declare-fun b!580547 () Bool)

(declare-fun res!368506 () Bool)

(declare-fun e!333281 () Bool)

(assert (=> b!580547 (=> (not res!368506) (not e!333281))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!580547 (= res!368506 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17420 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17420 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580548 () Bool)

(declare-fun res!368509 () Bool)

(assert (=> b!580548 (=> (not res!368509) (not e!333282))))

(assert (=> b!580548 (= res!368509 (and (= (size!17785 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17785 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17785 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580550 () Bool)

(declare-fun res!368508 () Bool)

(assert (=> b!580550 (=> (not res!368508) (not e!333281))))

(declare-datatypes ((List!11500 0))(
  ( (Nil!11497) (Cons!11496 (h!12541 (_ BitVec 64)) (t!17719 List!11500)) )
))
(declare-fun arrayNoDuplicates!0 (array!36291 (_ BitVec 32) List!11500) Bool)

(assert (=> b!580550 (= res!368508 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11497))))

(declare-fun b!580551 () Bool)

(assert (=> b!580551 (= e!333282 e!333281)))

(declare-fun res!368507 () Bool)

(assert (=> b!580551 (=> (not res!368507) (not e!333281))))

(declare-datatypes ((SeekEntryResult!5857 0))(
  ( (MissingZero!5857 (index!25655 (_ BitVec 32))) (Found!5857 (index!25656 (_ BitVec 32))) (Intermediate!5857 (undefined!6669 Bool) (index!25657 (_ BitVec 32)) (x!54537 (_ BitVec 32))) (Undefined!5857) (MissingVacant!5857 (index!25658 (_ BitVec 32))) )
))
(declare-fun lt!264544 () SeekEntryResult!5857)

(assert (=> b!580551 (= res!368507 (or (= lt!264544 (MissingZero!5857 i!1108)) (= lt!264544 (MissingVacant!5857 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36291 (_ BitVec 32)) SeekEntryResult!5857)

(assert (=> b!580551 (= lt!264544 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!580552 () Bool)

(declare-fun res!368504 () Bool)

(assert (=> b!580552 (=> (not res!368504) (not e!333281))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36291 (_ BitVec 32)) Bool)

(assert (=> b!580552 (= res!368504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!368502 () Bool)

(assert (=> start!53376 (=> (not res!368502) (not e!333282))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53376 (= res!368502 (validMask!0 mask!3053))))

(assert (=> start!53376 e!333282))

(assert (=> start!53376 true))

(declare-fun array_inv!13303 (array!36291) Bool)

(assert (=> start!53376 (array_inv!13303 a!2986)))

(declare-fun b!580549 () Bool)

(assert (=> b!580549 (= e!333281 false)))

(declare-fun lt!264543 () SeekEntryResult!5857)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36291 (_ BitVec 32)) SeekEntryResult!5857)

(assert (=> b!580549 (= lt!264543 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17420 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53376 res!368502) b!580548))

(assert (= (and b!580548 res!368509) b!580545))

(assert (= (and b!580545 res!368510) b!580546))

(assert (= (and b!580546 res!368505) b!580544))

(assert (= (and b!580544 res!368503) b!580551))

(assert (= (and b!580551 res!368507) b!580552))

(assert (= (and b!580552 res!368504) b!580550))

(assert (= (and b!580550 res!368508) b!580547))

(assert (= (and b!580547 res!368506) b!580549))

(declare-fun m!558595 () Bool)

(assert (=> b!580544 m!558595))

(declare-fun m!558597 () Bool)

(assert (=> b!580545 m!558597))

(assert (=> b!580545 m!558597))

(declare-fun m!558599 () Bool)

(assert (=> b!580545 m!558599))

(declare-fun m!558601 () Bool)

(assert (=> b!580547 m!558601))

(declare-fun m!558603 () Bool)

(assert (=> b!580547 m!558603))

(declare-fun m!558605 () Bool)

(assert (=> b!580547 m!558605))

(declare-fun m!558607 () Bool)

(assert (=> b!580546 m!558607))

(declare-fun m!558609 () Bool)

(assert (=> b!580552 m!558609))

(assert (=> b!580549 m!558597))

(assert (=> b!580549 m!558597))

(declare-fun m!558611 () Bool)

(assert (=> b!580549 m!558611))

(declare-fun m!558613 () Bool)

(assert (=> b!580550 m!558613))

(declare-fun m!558615 () Bool)

(assert (=> start!53376 m!558615))

(declare-fun m!558617 () Bool)

(assert (=> start!53376 m!558617))

(declare-fun m!558619 () Bool)

(assert (=> b!580551 m!558619))

(check-sat (not start!53376) (not b!580546) (not b!580550) (not b!580549) (not b!580552) (not b!580545) (not b!580544) (not b!580551))
(check-sat)
