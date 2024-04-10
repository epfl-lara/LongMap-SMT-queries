; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53242 () Bool)

(assert start!53242)

(declare-fun b!578781 () Bool)

(declare-fun res!366598 () Bool)

(declare-fun e!332779 () Bool)

(assert (=> b!578781 (=> (not res!366598) (not e!332779))))

(declare-datatypes ((array!36143 0))(
  ( (array!36144 (arr!17346 (Array (_ BitVec 32) (_ BitVec 64))) (size!17710 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36143)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36143 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578781 (= res!366598 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578782 () Bool)

(declare-fun res!366600 () Bool)

(declare-fun e!332780 () Bool)

(assert (=> b!578782 (=> (not res!366600) (not e!332780))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36143 (_ BitVec 32)) Bool)

(assert (=> b!578782 (= res!366600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578783 () Bool)

(declare-fun res!366604 () Bool)

(assert (=> b!578783 (=> (not res!366604) (not e!332780))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!578783 (= res!366604 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17346 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17346 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!578784 () Bool)

(declare-fun res!366597 () Bool)

(assert (=> b!578784 (=> (not res!366597) (not e!332779))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!578784 (= res!366597 (and (= (size!17710 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17710 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17710 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!366605 () Bool)

(assert (=> start!53242 (=> (not res!366605) (not e!332779))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53242 (= res!366605 (validMask!0 mask!3053))))

(assert (=> start!53242 e!332779))

(assert (=> start!53242 true))

(declare-fun array_inv!13142 (array!36143) Bool)

(assert (=> start!53242 (array_inv!13142 a!2986)))

(declare-fun b!578785 () Bool)

(declare-fun res!366602 () Bool)

(assert (=> b!578785 (=> (not res!366602) (not e!332780))))

(declare-datatypes ((List!11387 0))(
  ( (Nil!11384) (Cons!11383 (h!12428 (_ BitVec 64)) (t!17615 List!11387)) )
))
(declare-fun arrayNoDuplicates!0 (array!36143 (_ BitVec 32) List!11387) Bool)

(assert (=> b!578785 (= res!366602 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11384))))

(declare-fun b!578786 () Bool)

(assert (=> b!578786 (= e!332779 e!332780)))

(declare-fun res!366603 () Bool)

(assert (=> b!578786 (=> (not res!366603) (not e!332780))))

(declare-datatypes ((SeekEntryResult!5786 0))(
  ( (MissingZero!5786 (index!25371 (_ BitVec 32))) (Found!5786 (index!25372 (_ BitVec 32))) (Intermediate!5786 (undefined!6598 Bool) (index!25373 (_ BitVec 32)) (x!54271 (_ BitVec 32))) (Undefined!5786) (MissingVacant!5786 (index!25374 (_ BitVec 32))) )
))
(declare-fun lt!264337 () SeekEntryResult!5786)

(assert (=> b!578786 (= res!366603 (or (= lt!264337 (MissingZero!5786 i!1108)) (= lt!264337 (MissingVacant!5786 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36143 (_ BitVec 32)) SeekEntryResult!5786)

(assert (=> b!578786 (= lt!264337 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!578787 () Bool)

(assert (=> b!578787 (= e!332780 false)))

(declare-fun lt!264336 () SeekEntryResult!5786)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36143 (_ BitVec 32)) SeekEntryResult!5786)

(assert (=> b!578787 (= lt!264336 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17346 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!578788 () Bool)

(declare-fun res!366601 () Bool)

(assert (=> b!578788 (=> (not res!366601) (not e!332779))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578788 (= res!366601 (validKeyInArray!0 (select (arr!17346 a!2986) j!136)))))

(declare-fun b!578789 () Bool)

(declare-fun res!366599 () Bool)

(assert (=> b!578789 (=> (not res!366599) (not e!332779))))

(assert (=> b!578789 (= res!366599 (validKeyInArray!0 k!1786))))

(assert (= (and start!53242 res!366605) b!578784))

(assert (= (and b!578784 res!366597) b!578788))

(assert (= (and b!578788 res!366601) b!578789))

(assert (= (and b!578789 res!366599) b!578781))

(assert (= (and b!578781 res!366598) b!578786))

(assert (= (and b!578786 res!366603) b!578782))

(assert (= (and b!578782 res!366600) b!578785))

(assert (= (and b!578785 res!366602) b!578783))

(assert (= (and b!578783 res!366604) b!578787))

(declare-fun m!557425 () Bool)

(assert (=> b!578782 m!557425))

(declare-fun m!557427 () Bool)

(assert (=> b!578783 m!557427))

(declare-fun m!557429 () Bool)

(assert (=> b!578783 m!557429))

(declare-fun m!557431 () Bool)

(assert (=> b!578783 m!557431))

(declare-fun m!557433 () Bool)

(assert (=> b!578781 m!557433))

(declare-fun m!557435 () Bool)

(assert (=> b!578787 m!557435))

(assert (=> b!578787 m!557435))

(declare-fun m!557437 () Bool)

(assert (=> b!578787 m!557437))

(assert (=> b!578788 m!557435))

(assert (=> b!578788 m!557435))

(declare-fun m!557439 () Bool)

(assert (=> b!578788 m!557439))

(declare-fun m!557441 () Bool)

(assert (=> b!578786 m!557441))

(declare-fun m!557443 () Bool)

(assert (=> b!578789 m!557443))

(declare-fun m!557445 () Bool)

(assert (=> start!53242 m!557445))

(declare-fun m!557447 () Bool)

(assert (=> start!53242 m!557447))

(declare-fun m!557449 () Bool)

(assert (=> b!578785 m!557449))

(push 1)

(assert (not b!578789))

(assert (not b!578787))

(assert (not b!578781))

(assert (not b!578782))

(assert (not b!578788))

(assert (not b!578786))

(assert (not start!53242))

(assert (not b!578785))

(check-sat)

