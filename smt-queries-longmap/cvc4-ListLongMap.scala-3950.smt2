; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53714 () Bool)

(assert start!53714)

(declare-fun b!585745 () Bool)

(declare-fun res!373562 () Bool)

(declare-fun e!335075 () Bool)

(assert (=> b!585745 (=> (not res!373562) (not e!335075))))

(declare-datatypes ((array!36615 0))(
  ( (array!36616 (arr!17582 (Array (_ BitVec 32) (_ BitVec 64))) (size!17946 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36615)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36615 (_ BitVec 32)) Bool)

(assert (=> b!585745 (= res!373562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585746 () Bool)

(declare-fun res!373564 () Bool)

(assert (=> b!585746 (=> (not res!373564) (not e!335075))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6022 0))(
  ( (MissingZero!6022 (index!26315 (_ BitVec 32))) (Found!6022 (index!26316 (_ BitVec 32))) (Intermediate!6022 (undefined!6834 Bool) (index!26317 (_ BitVec 32)) (x!55131 (_ BitVec 32))) (Undefined!6022) (MissingVacant!6022 (index!26318 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36615 (_ BitVec 32)) SeekEntryResult!6022)

(assert (=> b!585746 (= res!373564 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17582 a!2986) j!136) a!2986 mask!3053) (Found!6022 j!136)))))

(declare-fun b!585747 () Bool)

(declare-fun res!373567 () Bool)

(declare-fun e!335074 () Bool)

(assert (=> b!585747 (=> (not res!373567) (not e!335074))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!585747 (= res!373567 (and (= (size!17946 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17946 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17946 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!585748 () Bool)

(declare-fun res!373569 () Bool)

(assert (=> b!585748 (=> (not res!373569) (not e!335074))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585748 (= res!373569 (validKeyInArray!0 (select (arr!17582 a!2986) j!136)))))

(declare-fun b!585749 () Bool)

(declare-fun res!373561 () Bool)

(assert (=> b!585749 (=> (not res!373561) (not e!335075))))

(assert (=> b!585749 (= res!373561 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17582 a!2986) index!984) (select (arr!17582 a!2986) j!136))) (not (= (select (arr!17582 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!585750 () Bool)

(declare-fun res!373563 () Bool)

(assert (=> b!585750 (=> (not res!373563) (not e!335075))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!585750 (= res!373563 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17582 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17582 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585751 () Bool)

(assert (=> b!585751 (= e!335074 e!335075)))

(declare-fun res!373565 () Bool)

(assert (=> b!585751 (=> (not res!373565) (not e!335075))))

(declare-fun lt!265905 () SeekEntryResult!6022)

(assert (=> b!585751 (= res!373565 (or (= lt!265905 (MissingZero!6022 i!1108)) (= lt!265905 (MissingVacant!6022 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36615 (_ BitVec 32)) SeekEntryResult!6022)

(assert (=> b!585751 (= lt!265905 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!585752 () Bool)

(declare-fun res!373568 () Bool)

(assert (=> b!585752 (=> (not res!373568) (not e!335074))))

(assert (=> b!585752 (= res!373568 (validKeyInArray!0 k!1786))))

(declare-fun b!585753 () Bool)

(declare-fun res!373570 () Bool)

(assert (=> b!585753 (=> (not res!373570) (not e!335074))))

(declare-fun arrayContainsKey!0 (array!36615 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585753 (= res!373570 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!373571 () Bool)

(assert (=> start!53714 (=> (not res!373571) (not e!335074))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53714 (= res!373571 (validMask!0 mask!3053))))

(assert (=> start!53714 e!335074))

(assert (=> start!53714 true))

(declare-fun array_inv!13378 (array!36615) Bool)

(assert (=> start!53714 (array_inv!13378 a!2986)))

(declare-fun b!585754 () Bool)

(assert (=> b!585754 (= e!335075 (not (bvsge mask!3053 #b00000000000000000000000000000000)))))

(declare-fun lt!265904 () (_ BitVec 32))

(assert (=> b!585754 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265904 vacantSpotIndex!68 (select (arr!17582 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265904 vacantSpotIndex!68 (select (store (arr!17582 a!2986) i!1108 k!1786) j!136) (array!36616 (store (arr!17582 a!2986) i!1108 k!1786) (size!17946 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18164 0))(
  ( (Unit!18165) )
))
(declare-fun lt!265906 () Unit!18164)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36615 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18164)

(assert (=> b!585754 (= lt!265906 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!265904 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585754 (= lt!265904 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!585755 () Bool)

(declare-fun res!373566 () Bool)

(assert (=> b!585755 (=> (not res!373566) (not e!335075))))

(declare-datatypes ((List!11623 0))(
  ( (Nil!11620) (Cons!11619 (h!12664 (_ BitVec 64)) (t!17851 List!11623)) )
))
(declare-fun arrayNoDuplicates!0 (array!36615 (_ BitVec 32) List!11623) Bool)

(assert (=> b!585755 (= res!373566 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11620))))

(assert (= (and start!53714 res!373571) b!585747))

(assert (= (and b!585747 res!373567) b!585748))

(assert (= (and b!585748 res!373569) b!585752))

(assert (= (and b!585752 res!373568) b!585753))

(assert (= (and b!585753 res!373570) b!585751))

(assert (= (and b!585751 res!373565) b!585745))

(assert (= (and b!585745 res!373562) b!585755))

(assert (= (and b!585755 res!373566) b!585750))

(assert (= (and b!585750 res!373563) b!585746))

(assert (= (and b!585746 res!373564) b!585749))

(assert (= (and b!585749 res!373561) b!585754))

(declare-fun m!563999 () Bool)

(assert (=> b!585749 m!563999))

(declare-fun m!564001 () Bool)

(assert (=> b!585749 m!564001))

(assert (=> b!585746 m!564001))

(assert (=> b!585746 m!564001))

(declare-fun m!564003 () Bool)

(assert (=> b!585746 m!564003))

(assert (=> b!585748 m!564001))

(assert (=> b!585748 m!564001))

(declare-fun m!564005 () Bool)

(assert (=> b!585748 m!564005))

(declare-fun m!564007 () Bool)

(assert (=> b!585745 m!564007))

(declare-fun m!564009 () Bool)

(assert (=> b!585751 m!564009))

(declare-fun m!564011 () Bool)

(assert (=> b!585753 m!564011))

(declare-fun m!564013 () Bool)

(assert (=> b!585750 m!564013))

(declare-fun m!564015 () Bool)

(assert (=> b!585750 m!564015))

(declare-fun m!564017 () Bool)

(assert (=> b!585750 m!564017))

(declare-fun m!564019 () Bool)

(assert (=> start!53714 m!564019))

(declare-fun m!564021 () Bool)

(assert (=> start!53714 m!564021))

(declare-fun m!564023 () Bool)

(assert (=> b!585754 m!564023))

(declare-fun m!564025 () Bool)

(assert (=> b!585754 m!564025))

(assert (=> b!585754 m!564001))

(assert (=> b!585754 m!564015))

(assert (=> b!585754 m!564025))

(declare-fun m!564027 () Bool)

(assert (=> b!585754 m!564027))

(assert (=> b!585754 m!564001))

(declare-fun m!564029 () Bool)

(assert (=> b!585754 m!564029))

(declare-fun m!564031 () Bool)

(assert (=> b!585754 m!564031))

(declare-fun m!564033 () Bool)

(assert (=> b!585755 m!564033))

(declare-fun m!564035 () Bool)

(assert (=> b!585752 m!564035))

(push 1)

