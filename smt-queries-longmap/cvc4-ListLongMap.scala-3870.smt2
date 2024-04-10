; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53234 () Bool)

(assert start!53234)

(declare-fun b!578664 () Bool)

(declare-fun res!366487 () Bool)

(declare-fun e!332745 () Bool)

(assert (=> b!578664 (=> (not res!366487) (not e!332745))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578664 (= res!366487 (validKeyInArray!0 k!1786))))

(declare-fun b!578665 () Bool)

(declare-fun e!332744 () Bool)

(assert (=> b!578665 (= e!332744 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5782 0))(
  ( (MissingZero!5782 (index!25355 (_ BitVec 32))) (Found!5782 (index!25356 (_ BitVec 32))) (Intermediate!5782 (undefined!6594 Bool) (index!25357 (_ BitVec 32)) (x!54251 (_ BitVec 32))) (Undefined!5782) (MissingVacant!5782 (index!25358 (_ BitVec 32))) )
))
(declare-fun lt!264321 () SeekEntryResult!5782)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36135 0))(
  ( (array!36136 (arr!17342 (Array (_ BitVec 32) (_ BitVec 64))) (size!17706 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36135)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36135 (_ BitVec 32)) SeekEntryResult!5782)

(assert (=> b!578665 (= lt!264321 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17342 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!578666 () Bool)

(declare-fun res!366486 () Bool)

(assert (=> b!578666 (=> (not res!366486) (not e!332744))))

(declare-datatypes ((List!11383 0))(
  ( (Nil!11380) (Cons!11379 (h!12424 (_ BitVec 64)) (t!17611 List!11383)) )
))
(declare-fun arrayNoDuplicates!0 (array!36135 (_ BitVec 32) List!11383) Bool)

(assert (=> b!578666 (= res!366486 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11380))))

(declare-fun b!578668 () Bool)

(declare-fun res!366482 () Bool)

(assert (=> b!578668 (=> (not res!366482) (not e!332745))))

(assert (=> b!578668 (= res!366482 (validKeyInArray!0 (select (arr!17342 a!2986) j!136)))))

(declare-fun b!578669 () Bool)

(declare-fun res!366480 () Bool)

(assert (=> b!578669 (=> (not res!366480) (not e!332745))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578669 (= res!366480 (and (= (size!17706 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17706 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17706 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578670 () Bool)

(assert (=> b!578670 (= e!332745 e!332744)))

(declare-fun res!366483 () Bool)

(assert (=> b!578670 (=> (not res!366483) (not e!332744))))

(declare-fun lt!264322 () SeekEntryResult!5782)

(assert (=> b!578670 (= res!366483 (or (= lt!264322 (MissingZero!5782 i!1108)) (= lt!264322 (MissingVacant!5782 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36135 (_ BitVec 32)) SeekEntryResult!5782)

(assert (=> b!578670 (= lt!264322 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!578671 () Bool)

(declare-fun res!366485 () Bool)

(assert (=> b!578671 (=> (not res!366485) (not e!332744))))

(assert (=> b!578671 (= res!366485 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17342 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17342 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!578672 () Bool)

(declare-fun res!366488 () Bool)

(assert (=> b!578672 (=> (not res!366488) (not e!332745))))

(declare-fun arrayContainsKey!0 (array!36135 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578672 (= res!366488 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578667 () Bool)

(declare-fun res!366484 () Bool)

(assert (=> b!578667 (=> (not res!366484) (not e!332744))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36135 (_ BitVec 32)) Bool)

(assert (=> b!578667 (= res!366484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!366481 () Bool)

(assert (=> start!53234 (=> (not res!366481) (not e!332745))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53234 (= res!366481 (validMask!0 mask!3053))))

(assert (=> start!53234 e!332745))

(assert (=> start!53234 true))

(declare-fun array_inv!13138 (array!36135) Bool)

(assert (=> start!53234 (array_inv!13138 a!2986)))

(assert (= (and start!53234 res!366481) b!578669))

(assert (= (and b!578669 res!366480) b!578668))

(assert (= (and b!578668 res!366482) b!578664))

(assert (= (and b!578664 res!366487) b!578672))

(assert (= (and b!578672 res!366488) b!578670))

(assert (= (and b!578670 res!366483) b!578667))

(assert (= (and b!578667 res!366484) b!578666))

(assert (= (and b!578666 res!366486) b!578671))

(assert (= (and b!578671 res!366485) b!578665))

(declare-fun m!557321 () Bool)

(assert (=> b!578665 m!557321))

(assert (=> b!578665 m!557321))

(declare-fun m!557323 () Bool)

(assert (=> b!578665 m!557323))

(declare-fun m!557325 () Bool)

(assert (=> b!578670 m!557325))

(declare-fun m!557327 () Bool)

(assert (=> b!578667 m!557327))

(declare-fun m!557329 () Bool)

(assert (=> b!578664 m!557329))

(declare-fun m!557331 () Bool)

(assert (=> b!578672 m!557331))

(declare-fun m!557333 () Bool)

(assert (=> start!53234 m!557333))

(declare-fun m!557335 () Bool)

(assert (=> start!53234 m!557335))

(assert (=> b!578668 m!557321))

(assert (=> b!578668 m!557321))

(declare-fun m!557337 () Bool)

(assert (=> b!578668 m!557337))

(declare-fun m!557339 () Bool)

(assert (=> b!578671 m!557339))

(declare-fun m!557341 () Bool)

(assert (=> b!578671 m!557341))

(declare-fun m!557343 () Bool)

(assert (=> b!578671 m!557343))

(declare-fun m!557345 () Bool)

(assert (=> b!578666 m!557345))

(push 1)

(assert (not b!578667))

(assert (not b!578664))

(assert (not b!578668))

(assert (not b!578666))

(assert (not b!578670))

(assert (not b!578665))

(assert (not start!53234))

(assert (not b!578672))

(check-sat)

