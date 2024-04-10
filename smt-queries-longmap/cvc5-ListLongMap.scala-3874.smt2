; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53254 () Bool)

(assert start!53254)

(declare-fun b!578943 () Bool)

(declare-fun res!366764 () Bool)

(declare-fun e!332835 () Bool)

(assert (=> b!578943 (=> (not res!366764) (not e!332835))))

(declare-datatypes ((array!36155 0))(
  ( (array!36156 (arr!17352 (Array (_ BitVec 32) (_ BitVec 64))) (size!17716 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36155)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36155 (_ BitVec 32)) Bool)

(assert (=> b!578943 (= res!366764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578944 () Bool)

(declare-fun res!366760 () Bool)

(declare-fun e!332833 () Bool)

(assert (=> b!578944 (=> (not res!366760) (not e!332833))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578944 (= res!366760 (validKeyInArray!0 k!1786))))

(declare-fun res!366766 () Bool)

(assert (=> start!53254 (=> (not res!366766) (not e!332833))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53254 (= res!366766 (validMask!0 mask!3053))))

(assert (=> start!53254 e!332833))

(assert (=> start!53254 true))

(declare-fun array_inv!13148 (array!36155) Bool)

(assert (=> start!53254 (array_inv!13148 a!2986)))

(declare-fun b!578945 () Bool)

(assert (=> b!578945 (= e!332833 e!332835)))

(declare-fun res!366763 () Bool)

(assert (=> b!578945 (=> (not res!366763) (not e!332835))))

(declare-datatypes ((SeekEntryResult!5792 0))(
  ( (MissingZero!5792 (index!25395 (_ BitVec 32))) (Found!5792 (index!25396 (_ BitVec 32))) (Intermediate!5792 (undefined!6604 Bool) (index!25397 (_ BitVec 32)) (x!54293 (_ BitVec 32))) (Undefined!5792) (MissingVacant!5792 (index!25398 (_ BitVec 32))) )
))
(declare-fun lt!264373 () SeekEntryResult!5792)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578945 (= res!366763 (or (= lt!264373 (MissingZero!5792 i!1108)) (= lt!264373 (MissingVacant!5792 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36155 (_ BitVec 32)) SeekEntryResult!5792)

(assert (=> b!578945 (= lt!264373 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!578946 () Bool)

(declare-fun res!366759 () Bool)

(assert (=> b!578946 (=> (not res!366759) (not e!332833))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!578946 (= res!366759 (validKeyInArray!0 (select (arr!17352 a!2986) j!136)))))

(declare-fun b!578947 () Bool)

(assert (=> b!578947 (= e!332835 false)))

(declare-fun lt!264372 () SeekEntryResult!5792)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36155 (_ BitVec 32)) SeekEntryResult!5792)

(assert (=> b!578947 (= lt!264372 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17352 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!578948 () Bool)

(declare-fun res!366762 () Bool)

(assert (=> b!578948 (=> (not res!366762) (not e!332833))))

(assert (=> b!578948 (= res!366762 (and (= (size!17716 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17716 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17716 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578949 () Bool)

(declare-fun res!366767 () Bool)

(assert (=> b!578949 (=> (not res!366767) (not e!332835))))

(assert (=> b!578949 (= res!366767 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17352 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17352 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!578950 () Bool)

(declare-fun res!366765 () Bool)

(assert (=> b!578950 (=> (not res!366765) (not e!332835))))

(declare-datatypes ((List!11393 0))(
  ( (Nil!11390) (Cons!11389 (h!12434 (_ BitVec 64)) (t!17621 List!11393)) )
))
(declare-fun arrayNoDuplicates!0 (array!36155 (_ BitVec 32) List!11393) Bool)

(assert (=> b!578950 (= res!366765 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11390))))

(declare-fun b!578951 () Bool)

(declare-fun res!366761 () Bool)

(assert (=> b!578951 (=> (not res!366761) (not e!332833))))

(declare-fun arrayContainsKey!0 (array!36155 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578951 (= res!366761 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53254 res!366766) b!578948))

(assert (= (and b!578948 res!366762) b!578946))

(assert (= (and b!578946 res!366759) b!578944))

(assert (= (and b!578944 res!366760) b!578951))

(assert (= (and b!578951 res!366761) b!578945))

(assert (= (and b!578945 res!366763) b!578943))

(assert (= (and b!578943 res!366764) b!578950))

(assert (= (and b!578950 res!366765) b!578949))

(assert (= (and b!578949 res!366767) b!578947))

(declare-fun m!557581 () Bool)

(assert (=> b!578945 m!557581))

(declare-fun m!557583 () Bool)

(assert (=> b!578946 m!557583))

(assert (=> b!578946 m!557583))

(declare-fun m!557585 () Bool)

(assert (=> b!578946 m!557585))

(declare-fun m!557587 () Bool)

(assert (=> b!578950 m!557587))

(assert (=> b!578947 m!557583))

(assert (=> b!578947 m!557583))

(declare-fun m!557589 () Bool)

(assert (=> b!578947 m!557589))

(declare-fun m!557591 () Bool)

(assert (=> b!578949 m!557591))

(declare-fun m!557593 () Bool)

(assert (=> b!578949 m!557593))

(declare-fun m!557595 () Bool)

(assert (=> b!578949 m!557595))

(declare-fun m!557597 () Bool)

(assert (=> start!53254 m!557597))

(declare-fun m!557599 () Bool)

(assert (=> start!53254 m!557599))

(declare-fun m!557601 () Bool)

(assert (=> b!578951 m!557601))

(declare-fun m!557603 () Bool)

(assert (=> b!578944 m!557603))

(declare-fun m!557605 () Bool)

(assert (=> b!578943 m!557605))

(push 1)

(assert (not start!53254))

(assert (not b!578946))

(assert (not b!578943))

(assert (not b!578951))

(assert (not b!578945))

(assert (not b!578944))

(assert (not b!578950))

