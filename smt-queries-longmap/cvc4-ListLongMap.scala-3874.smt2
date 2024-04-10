; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53258 () Bool)

(assert start!53258)

(declare-fun b!578997 () Bool)

(declare-fun res!366816 () Bool)

(declare-fun e!332851 () Bool)

(assert (=> b!578997 (=> (not res!366816) (not e!332851))))

(declare-datatypes ((array!36159 0))(
  ( (array!36160 (arr!17354 (Array (_ BitVec 32) (_ BitVec 64))) (size!17718 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36159)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36159 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578997 (= res!366816 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578998 () Bool)

(declare-fun res!366814 () Bool)

(declare-fun e!332853 () Bool)

(assert (=> b!578998 (=> (not res!366814) (not e!332853))))

(declare-datatypes ((List!11395 0))(
  ( (Nil!11392) (Cons!11391 (h!12436 (_ BitVec 64)) (t!17623 List!11395)) )
))
(declare-fun arrayNoDuplicates!0 (array!36159 (_ BitVec 32) List!11395) Bool)

(assert (=> b!578998 (= res!366814 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11392))))

(declare-fun res!366818 () Bool)

(assert (=> start!53258 (=> (not res!366818) (not e!332851))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53258 (= res!366818 (validMask!0 mask!3053))))

(assert (=> start!53258 e!332851))

(assert (=> start!53258 true))

(declare-fun array_inv!13150 (array!36159) Bool)

(assert (=> start!53258 (array_inv!13150 a!2986)))

(declare-fun b!578999 () Bool)

(declare-fun res!366813 () Bool)

(assert (=> b!578999 (=> (not res!366813) (not e!332853))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36159 (_ BitVec 32)) Bool)

(assert (=> b!578999 (= res!366813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579000 () Bool)

(assert (=> b!579000 (= e!332851 e!332853)))

(declare-fun res!366817 () Bool)

(assert (=> b!579000 (=> (not res!366817) (not e!332853))))

(declare-datatypes ((SeekEntryResult!5794 0))(
  ( (MissingZero!5794 (index!25403 (_ BitVec 32))) (Found!5794 (index!25404 (_ BitVec 32))) (Intermediate!5794 (undefined!6606 Bool) (index!25405 (_ BitVec 32)) (x!54295 (_ BitVec 32))) (Undefined!5794) (MissingVacant!5794 (index!25406 (_ BitVec 32))) )
))
(declare-fun lt!264384 () SeekEntryResult!5794)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579000 (= res!366817 (or (= lt!264384 (MissingZero!5794 i!1108)) (= lt!264384 (MissingVacant!5794 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36159 (_ BitVec 32)) SeekEntryResult!5794)

(assert (=> b!579000 (= lt!264384 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!579001 () Bool)

(assert (=> b!579001 (= e!332853 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!264385 () SeekEntryResult!5794)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36159 (_ BitVec 32)) SeekEntryResult!5794)

(assert (=> b!579001 (= lt!264385 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17354 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579002 () Bool)

(declare-fun res!366815 () Bool)

(assert (=> b!579002 (=> (not res!366815) (not e!332851))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579002 (= res!366815 (validKeyInArray!0 k!1786))))

(declare-fun b!579003 () Bool)

(declare-fun res!366820 () Bool)

(assert (=> b!579003 (=> (not res!366820) (not e!332851))))

(assert (=> b!579003 (= res!366820 (and (= (size!17718 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17718 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17718 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579004 () Bool)

(declare-fun res!366821 () Bool)

(assert (=> b!579004 (=> (not res!366821) (not e!332853))))

(assert (=> b!579004 (= res!366821 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17354 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17354 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579005 () Bool)

(declare-fun res!366819 () Bool)

(assert (=> b!579005 (=> (not res!366819) (not e!332851))))

(assert (=> b!579005 (= res!366819 (validKeyInArray!0 (select (arr!17354 a!2986) j!136)))))

(assert (= (and start!53258 res!366818) b!579003))

(assert (= (and b!579003 res!366820) b!579005))

(assert (= (and b!579005 res!366819) b!579002))

(assert (= (and b!579002 res!366815) b!578997))

(assert (= (and b!578997 res!366816) b!579000))

(assert (= (and b!579000 res!366817) b!578999))

(assert (= (and b!578999 res!366813) b!578998))

(assert (= (and b!578998 res!366814) b!579004))

(assert (= (and b!579004 res!366821) b!579001))

(declare-fun m!557633 () Bool)

(assert (=> b!579005 m!557633))

(assert (=> b!579005 m!557633))

(declare-fun m!557635 () Bool)

(assert (=> b!579005 m!557635))

(declare-fun m!557637 () Bool)

(assert (=> b!579000 m!557637))

(declare-fun m!557639 () Bool)

(assert (=> b!578999 m!557639))

(declare-fun m!557641 () Bool)

(assert (=> b!578998 m!557641))

(declare-fun m!557643 () Bool)

(assert (=> b!579004 m!557643))

(declare-fun m!557645 () Bool)

(assert (=> b!579004 m!557645))

(declare-fun m!557647 () Bool)

(assert (=> b!579004 m!557647))

(declare-fun m!557649 () Bool)

(assert (=> b!579002 m!557649))

(assert (=> b!579001 m!557633))

(assert (=> b!579001 m!557633))

(declare-fun m!557651 () Bool)

(assert (=> b!579001 m!557651))

(declare-fun m!557653 () Bool)

(assert (=> b!578997 m!557653))

(declare-fun m!557655 () Bool)

(assert (=> start!53258 m!557655))

(declare-fun m!557657 () Bool)

(assert (=> start!53258 m!557657))

(push 1)

(assert (not b!579002))

(assert (not b!578999))

(assert (not b!579005))

(assert (not b!578997))

(assert (not b!579001))

(assert (not b!579000))

(assert (not b!578998))

(assert (not start!53258))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

