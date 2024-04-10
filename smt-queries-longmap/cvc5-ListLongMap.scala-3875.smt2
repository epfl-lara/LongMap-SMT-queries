; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53260 () Bool)

(assert start!53260)

(declare-fun b!579024 () Bool)

(declare-fun res!366842 () Bool)

(declare-fun e!332861 () Bool)

(assert (=> b!579024 (=> (not res!366842) (not e!332861))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579024 (= res!366842 (validKeyInArray!0 k!1786))))

(declare-fun b!579025 () Bool)

(declare-fun e!332860 () Bool)

(assert (=> b!579025 (= e!332860 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36161 0))(
  ( (array!36162 (arr!17355 (Array (_ BitVec 32) (_ BitVec 64))) (size!17719 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36161)

(declare-datatypes ((SeekEntryResult!5795 0))(
  ( (MissingZero!5795 (index!25407 (_ BitVec 32))) (Found!5795 (index!25408 (_ BitVec 32))) (Intermediate!5795 (undefined!6607 Bool) (index!25409 (_ BitVec 32)) (x!54304 (_ BitVec 32))) (Undefined!5795) (MissingVacant!5795 (index!25410 (_ BitVec 32))) )
))
(declare-fun lt!264390 () SeekEntryResult!5795)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36161 (_ BitVec 32)) SeekEntryResult!5795)

(assert (=> b!579025 (= lt!264390 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17355 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579026 () Bool)

(declare-fun res!366841 () Bool)

(assert (=> b!579026 (=> (not res!366841) (not e!332861))))

(assert (=> b!579026 (= res!366841 (validKeyInArray!0 (select (arr!17355 a!2986) j!136)))))

(declare-fun res!366847 () Bool)

(assert (=> start!53260 (=> (not res!366847) (not e!332861))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53260 (= res!366847 (validMask!0 mask!3053))))

(assert (=> start!53260 e!332861))

(assert (=> start!53260 true))

(declare-fun array_inv!13151 (array!36161) Bool)

(assert (=> start!53260 (array_inv!13151 a!2986)))

(declare-fun b!579027 () Bool)

(declare-fun res!366848 () Bool)

(assert (=> b!579027 (=> (not res!366848) (not e!332860))))

(declare-datatypes ((List!11396 0))(
  ( (Nil!11393) (Cons!11392 (h!12437 (_ BitVec 64)) (t!17624 List!11396)) )
))
(declare-fun arrayNoDuplicates!0 (array!36161 (_ BitVec 32) List!11396) Bool)

(assert (=> b!579027 (= res!366848 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11393))))

(declare-fun b!579028 () Bool)

(declare-fun res!366846 () Bool)

(assert (=> b!579028 (=> (not res!366846) (not e!332860))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579028 (= res!366846 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17355 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17355 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579029 () Bool)

(declare-fun res!366840 () Bool)

(assert (=> b!579029 (=> (not res!366840) (not e!332861))))

(declare-fun arrayContainsKey!0 (array!36161 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579029 (= res!366840 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579030 () Bool)

(assert (=> b!579030 (= e!332861 e!332860)))

(declare-fun res!366845 () Bool)

(assert (=> b!579030 (=> (not res!366845) (not e!332860))))

(declare-fun lt!264391 () SeekEntryResult!5795)

(assert (=> b!579030 (= res!366845 (or (= lt!264391 (MissingZero!5795 i!1108)) (= lt!264391 (MissingVacant!5795 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36161 (_ BitVec 32)) SeekEntryResult!5795)

(assert (=> b!579030 (= lt!264391 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!579031 () Bool)

(declare-fun res!366843 () Bool)

(assert (=> b!579031 (=> (not res!366843) (not e!332861))))

(assert (=> b!579031 (= res!366843 (and (= (size!17719 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17719 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17719 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579032 () Bool)

(declare-fun res!366844 () Bool)

(assert (=> b!579032 (=> (not res!366844) (not e!332860))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36161 (_ BitVec 32)) Bool)

(assert (=> b!579032 (= res!366844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53260 res!366847) b!579031))

(assert (= (and b!579031 res!366843) b!579026))

(assert (= (and b!579026 res!366841) b!579024))

(assert (= (and b!579024 res!366842) b!579029))

(assert (= (and b!579029 res!366840) b!579030))

(assert (= (and b!579030 res!366845) b!579032))

(assert (= (and b!579032 res!366844) b!579027))

(assert (= (and b!579027 res!366848) b!579028))

(assert (= (and b!579028 res!366846) b!579025))

(declare-fun m!557659 () Bool)

(assert (=> b!579032 m!557659))

(declare-fun m!557661 () Bool)

(assert (=> b!579028 m!557661))

(declare-fun m!557663 () Bool)

(assert (=> b!579028 m!557663))

(declare-fun m!557665 () Bool)

(assert (=> b!579028 m!557665))

(declare-fun m!557667 () Bool)

(assert (=> b!579024 m!557667))

(declare-fun m!557669 () Bool)

(assert (=> b!579027 m!557669))

(declare-fun m!557671 () Bool)

(assert (=> b!579026 m!557671))

(assert (=> b!579026 m!557671))

(declare-fun m!557673 () Bool)

(assert (=> b!579026 m!557673))

(declare-fun m!557675 () Bool)

(assert (=> start!53260 m!557675))

(declare-fun m!557677 () Bool)

(assert (=> start!53260 m!557677))

(declare-fun m!557679 () Bool)

(assert (=> b!579029 m!557679))

(assert (=> b!579025 m!557671))

(assert (=> b!579025 m!557671))

(declare-fun m!557681 () Bool)

(assert (=> b!579025 m!557681))

(declare-fun m!557683 () Bool)

(assert (=> b!579030 m!557683))

(push 1)

(assert (not b!579032))

(assert (not b!579024))

(assert (not b!579027))

(assert (not b!579026))

(assert (not b!579030))

(assert (not start!53260))

(assert (not b!579029))

(assert (not b!579025))

(check-sat)

