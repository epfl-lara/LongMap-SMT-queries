; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53246 () Bool)

(assert start!53246)

(declare-fun b!578835 () Bool)

(declare-fun res!366659 () Bool)

(declare-fun e!332798 () Bool)

(assert (=> b!578835 (=> (not res!366659) (not e!332798))))

(declare-datatypes ((array!36147 0))(
  ( (array!36148 (arr!17348 (Array (_ BitVec 32) (_ BitVec 64))) (size!17712 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36147)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36147 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578835 (= res!366659 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578836 () Bool)

(declare-fun res!366651 () Bool)

(assert (=> b!578836 (=> (not res!366651) (not e!332798))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578836 (= res!366651 (validKeyInArray!0 k!1786))))

(declare-fun res!366656 () Bool)

(assert (=> start!53246 (=> (not res!366656) (not e!332798))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53246 (= res!366656 (validMask!0 mask!3053))))

(assert (=> start!53246 e!332798))

(assert (=> start!53246 true))

(declare-fun array_inv!13144 (array!36147) Bool)

(assert (=> start!53246 (array_inv!13144 a!2986)))

(declare-fun b!578837 () Bool)

(declare-fun res!366655 () Bool)

(assert (=> b!578837 (=> (not res!366655) (not e!332798))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!578837 (= res!366655 (validKeyInArray!0 (select (arr!17348 a!2986) j!136)))))

(declare-fun b!578838 () Bool)

(declare-fun e!332797 () Bool)

(assert (=> b!578838 (= e!332798 e!332797)))

(declare-fun res!366652 () Bool)

(assert (=> b!578838 (=> (not res!366652) (not e!332797))))

(declare-datatypes ((SeekEntryResult!5788 0))(
  ( (MissingZero!5788 (index!25379 (_ BitVec 32))) (Found!5788 (index!25380 (_ BitVec 32))) (Intermediate!5788 (undefined!6600 Bool) (index!25381 (_ BitVec 32)) (x!54273 (_ BitVec 32))) (Undefined!5788) (MissingVacant!5788 (index!25382 (_ BitVec 32))) )
))
(declare-fun lt!264348 () SeekEntryResult!5788)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578838 (= res!366652 (or (= lt!264348 (MissingZero!5788 i!1108)) (= lt!264348 (MissingVacant!5788 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36147 (_ BitVec 32)) SeekEntryResult!5788)

(assert (=> b!578838 (= lt!264348 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!578839 () Bool)

(assert (=> b!578839 (= e!332797 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!264349 () SeekEntryResult!5788)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36147 (_ BitVec 32)) SeekEntryResult!5788)

(assert (=> b!578839 (= lt!264349 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17348 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!578840 () Bool)

(declare-fun res!366653 () Bool)

(assert (=> b!578840 (=> (not res!366653) (not e!332798))))

(assert (=> b!578840 (= res!366653 (and (= (size!17712 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17712 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17712 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578841 () Bool)

(declare-fun res!366654 () Bool)

(assert (=> b!578841 (=> (not res!366654) (not e!332797))))

(declare-datatypes ((List!11389 0))(
  ( (Nil!11386) (Cons!11385 (h!12430 (_ BitVec 64)) (t!17617 List!11389)) )
))
(declare-fun arrayNoDuplicates!0 (array!36147 (_ BitVec 32) List!11389) Bool)

(assert (=> b!578841 (= res!366654 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11386))))

(declare-fun b!578842 () Bool)

(declare-fun res!366658 () Bool)

(assert (=> b!578842 (=> (not res!366658) (not e!332797))))

(assert (=> b!578842 (= res!366658 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17348 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17348 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!578843 () Bool)

(declare-fun res!366657 () Bool)

(assert (=> b!578843 (=> (not res!366657) (not e!332797))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36147 (_ BitVec 32)) Bool)

(assert (=> b!578843 (= res!366657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53246 res!366656) b!578840))

(assert (= (and b!578840 res!366653) b!578837))

(assert (= (and b!578837 res!366655) b!578836))

(assert (= (and b!578836 res!366651) b!578835))

(assert (= (and b!578835 res!366659) b!578838))

(assert (= (and b!578838 res!366652) b!578843))

(assert (= (and b!578843 res!366657) b!578841))

(assert (= (and b!578841 res!366654) b!578842))

(assert (= (and b!578842 res!366658) b!578839))

(declare-fun m!557477 () Bool)

(assert (=> b!578838 m!557477))

(declare-fun m!557479 () Bool)

(assert (=> b!578836 m!557479))

(declare-fun m!557481 () Bool)

(assert (=> b!578839 m!557481))

(assert (=> b!578839 m!557481))

(declare-fun m!557483 () Bool)

(assert (=> b!578839 m!557483))

(declare-fun m!557485 () Bool)

(assert (=> b!578835 m!557485))

(assert (=> b!578837 m!557481))

(assert (=> b!578837 m!557481))

(declare-fun m!557487 () Bool)

(assert (=> b!578837 m!557487))

(declare-fun m!557489 () Bool)

(assert (=> start!53246 m!557489))

(declare-fun m!557491 () Bool)

(assert (=> start!53246 m!557491))

(declare-fun m!557493 () Bool)

(assert (=> b!578843 m!557493))

(declare-fun m!557495 () Bool)

(assert (=> b!578842 m!557495))

(declare-fun m!557497 () Bool)

(assert (=> b!578842 m!557497))

(declare-fun m!557499 () Bool)

(assert (=> b!578842 m!557499))

(declare-fun m!557501 () Bool)

(assert (=> b!578841 m!557501))

(push 1)

(assert (not start!53246))

(assert (not b!578835))

(assert (not b!578837))

(assert (not b!578841))

(assert (not b!578838))

(assert (not b!578843))

(assert (not b!578839))

(assert (not b!578836))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

