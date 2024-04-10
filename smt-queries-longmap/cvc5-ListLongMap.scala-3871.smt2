; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53236 () Bool)

(assert start!53236)

(declare-fun b!578693 () Bool)

(declare-fun res!366509 () Bool)

(declare-fun e!332754 () Bool)

(assert (=> b!578693 (=> (not res!366509) (not e!332754))))

(declare-datatypes ((array!36137 0))(
  ( (array!36138 (arr!17343 (Array (_ BitVec 32) (_ BitVec 64))) (size!17707 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36137)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36137 (_ BitVec 32)) Bool)

(assert (=> b!578693 (= res!366509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578694 () Bool)

(declare-fun res!366518 () Bool)

(declare-fun e!332752 () Bool)

(assert (=> b!578694 (=> (not res!366518) (not e!332752))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578694 (= res!366518 (and (= (size!17707 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17707 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17707 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578695 () Bool)

(declare-fun res!366513 () Bool)

(assert (=> b!578695 (=> (not res!366513) (not e!332752))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36137 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578695 (= res!366513 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578696 () Bool)

(declare-fun res!366515 () Bool)

(assert (=> b!578696 (=> (not res!366515) (not e!332754))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5783 0))(
  ( (MissingZero!5783 (index!25359 (_ BitVec 32))) (Found!5783 (index!25360 (_ BitVec 32))) (Intermediate!5783 (undefined!6595 Bool) (index!25361 (_ BitVec 32)) (x!54260 (_ BitVec 32))) (Undefined!5783) (MissingVacant!5783 (index!25362 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36137 (_ BitVec 32)) SeekEntryResult!5783)

(assert (=> b!578696 (= res!366515 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17343 a!2986) j!136) a!2986 mask!3053) (Found!5783 j!136)))))

(declare-fun b!578697 () Bool)

(declare-fun res!366511 () Bool)

(assert (=> b!578697 (=> (not res!366511) (not e!332754))))

(declare-datatypes ((List!11384 0))(
  ( (Nil!11381) (Cons!11380 (h!12425 (_ BitVec 64)) (t!17612 List!11384)) )
))
(declare-fun arrayNoDuplicates!0 (array!36137 (_ BitVec 32) List!11384) Bool)

(assert (=> b!578697 (= res!366511 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11381))))

(declare-fun b!578698 () Bool)

(assert (=> b!578698 (= e!332752 e!332754)))

(declare-fun res!366512 () Bool)

(assert (=> b!578698 (=> (not res!366512) (not e!332754))))

(declare-fun lt!264325 () SeekEntryResult!5783)

(assert (=> b!578698 (= res!366512 (or (= lt!264325 (MissingZero!5783 i!1108)) (= lt!264325 (MissingVacant!5783 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36137 (_ BitVec 32)) SeekEntryResult!5783)

(assert (=> b!578698 (= lt!264325 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!578700 () Bool)

(declare-fun res!366514 () Bool)

(assert (=> b!578700 (=> (not res!366514) (not e!332752))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578700 (= res!366514 (validKeyInArray!0 (select (arr!17343 a!2986) j!136)))))

(declare-fun b!578701 () Bool)

(declare-fun res!366517 () Bool)

(assert (=> b!578701 (=> (not res!366517) (not e!332754))))

(assert (=> b!578701 (= res!366517 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17343 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17343 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!578702 () Bool)

(assert (=> b!578702 (= e!332754 (bvslt mask!3053 #b00000000000000000000000000000000))))

(declare-fun b!578699 () Bool)

(declare-fun res!366516 () Bool)

(assert (=> b!578699 (=> (not res!366516) (not e!332752))))

(assert (=> b!578699 (= res!366516 (validKeyInArray!0 k!1786))))

(declare-fun res!366510 () Bool)

(assert (=> start!53236 (=> (not res!366510) (not e!332752))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53236 (= res!366510 (validMask!0 mask!3053))))

(assert (=> start!53236 e!332752))

(assert (=> start!53236 true))

(declare-fun array_inv!13139 (array!36137) Bool)

(assert (=> start!53236 (array_inv!13139 a!2986)))

(assert (= (and start!53236 res!366510) b!578694))

(assert (= (and b!578694 res!366518) b!578700))

(assert (= (and b!578700 res!366514) b!578699))

(assert (= (and b!578699 res!366516) b!578695))

(assert (= (and b!578695 res!366513) b!578698))

(assert (= (and b!578698 res!366512) b!578693))

(assert (= (and b!578693 res!366509) b!578697))

(assert (= (and b!578697 res!366511) b!578701))

(assert (= (and b!578701 res!366517) b!578696))

(assert (= (and b!578696 res!366515) b!578702))

(declare-fun m!557347 () Bool)

(assert (=> b!578698 m!557347))

(declare-fun m!557349 () Bool)

(assert (=> start!53236 m!557349))

(declare-fun m!557351 () Bool)

(assert (=> start!53236 m!557351))

(declare-fun m!557353 () Bool)

(assert (=> b!578701 m!557353))

(declare-fun m!557355 () Bool)

(assert (=> b!578701 m!557355))

(declare-fun m!557357 () Bool)

(assert (=> b!578701 m!557357))

(declare-fun m!557359 () Bool)

(assert (=> b!578700 m!557359))

(assert (=> b!578700 m!557359))

(declare-fun m!557361 () Bool)

(assert (=> b!578700 m!557361))

(declare-fun m!557363 () Bool)

(assert (=> b!578693 m!557363))

(declare-fun m!557365 () Bool)

(assert (=> b!578695 m!557365))

(assert (=> b!578696 m!557359))

(assert (=> b!578696 m!557359))

(declare-fun m!557367 () Bool)

(assert (=> b!578696 m!557367))

(declare-fun m!557369 () Bool)

(assert (=> b!578697 m!557369))

(declare-fun m!557371 () Bool)

(assert (=> b!578699 m!557371))

(push 1)

