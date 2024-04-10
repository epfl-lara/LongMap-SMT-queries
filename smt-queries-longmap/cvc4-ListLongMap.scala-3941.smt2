; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53660 () Bool)

(assert start!53660)

(declare-fun b!584790 () Bool)

(declare-fun res!372616 () Bool)

(declare-fun e!334770 () Bool)

(assert (=> b!584790 (=> (not res!372616) (not e!334770))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36561 0))(
  ( (array!36562 (arr!17555 (Array (_ BitVec 32) (_ BitVec 64))) (size!17919 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36561)

(assert (=> b!584790 (= res!372616 (and (= (size!17919 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17919 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17919 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584791 () Bool)

(declare-fun res!372612 () Bool)

(declare-fun e!334767 () Bool)

(assert (=> b!584791 (=> (not res!372612) (not e!334767))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!584791 (= res!372612 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17555 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17555 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!372609 () Bool)

(assert (=> start!53660 (=> (not res!372609) (not e!334770))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53660 (= res!372609 (validMask!0 mask!3053))))

(assert (=> start!53660 e!334770))

(assert (=> start!53660 true))

(declare-fun array_inv!13351 (array!36561) Bool)

(assert (=> start!53660 (array_inv!13351 a!2986)))

(declare-fun b!584792 () Bool)

(declare-fun res!372607 () Bool)

(assert (=> b!584792 (=> (not res!372607) (not e!334767))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36561 (_ BitVec 32)) Bool)

(assert (=> b!584792 (= res!372607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584793 () Bool)

(declare-fun res!372611 () Bool)

(assert (=> b!584793 (=> (not res!372611) (not e!334770))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584793 (= res!372611 (validKeyInArray!0 k!1786))))

(declare-fun b!584794 () Bool)

(declare-fun res!372606 () Bool)

(assert (=> b!584794 (=> (not res!372606) (not e!334767))))

(declare-datatypes ((SeekEntryResult!5995 0))(
  ( (MissingZero!5995 (index!26207 (_ BitVec 32))) (Found!5995 (index!26208 (_ BitVec 32))) (Intermediate!5995 (undefined!6807 Bool) (index!26209 (_ BitVec 32)) (x!55032 (_ BitVec 32))) (Undefined!5995) (MissingVacant!5995 (index!26210 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36561 (_ BitVec 32)) SeekEntryResult!5995)

(assert (=> b!584794 (= res!372606 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17555 a!2986) j!136) a!2986 mask!3053) (Found!5995 j!136)))))

(declare-fun b!584795 () Bool)

(assert (=> b!584795 (= e!334770 e!334767)))

(declare-fun res!372613 () Bool)

(assert (=> b!584795 (=> (not res!372613) (not e!334767))))

(declare-fun lt!265661 () SeekEntryResult!5995)

(assert (=> b!584795 (= res!372613 (or (= lt!265661 (MissingZero!5995 i!1108)) (= lt!265661 (MissingVacant!5995 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36561 (_ BitVec 32)) SeekEntryResult!5995)

(assert (=> b!584795 (= lt!265661 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!584796 () Bool)

(declare-fun res!372617 () Bool)

(assert (=> b!584796 (=> (not res!372617) (not e!334770))))

(declare-fun arrayContainsKey!0 (array!36561 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584796 (= res!372617 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!584797 () Bool)

(declare-fun e!334769 () Bool)

(assert (=> b!584797 (= e!334767 e!334769)))

(declare-fun res!372608 () Bool)

(assert (=> b!584797 (=> (not res!372608) (not e!334769))))

(declare-fun lt!265663 () (_ BitVec 32))

(assert (=> b!584797 (= res!372608 (and (bvsge lt!265663 #b00000000000000000000000000000000) (bvslt lt!265663 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584797 (= lt!265663 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!584798 () Bool)

(assert (=> b!584798 (= e!334769 false)))

(declare-fun lt!265662 () SeekEntryResult!5995)

(assert (=> b!584798 (= lt!265662 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265663 vacantSpotIndex!68 (select (arr!17555 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584799 () Bool)

(declare-fun res!372614 () Bool)

(assert (=> b!584799 (=> (not res!372614) (not e!334767))))

(declare-datatypes ((List!11596 0))(
  ( (Nil!11593) (Cons!11592 (h!12637 (_ BitVec 64)) (t!17824 List!11596)) )
))
(declare-fun arrayNoDuplicates!0 (array!36561 (_ BitVec 32) List!11596) Bool)

(assert (=> b!584799 (= res!372614 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11593))))

(declare-fun b!584800 () Bool)

(declare-fun res!372610 () Bool)

(assert (=> b!584800 (=> (not res!372610) (not e!334767))))

(assert (=> b!584800 (= res!372610 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17555 a!2986) index!984) (select (arr!17555 a!2986) j!136))) (not (= (select (arr!17555 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!584801 () Bool)

(declare-fun res!372615 () Bool)

(assert (=> b!584801 (=> (not res!372615) (not e!334770))))

(assert (=> b!584801 (= res!372615 (validKeyInArray!0 (select (arr!17555 a!2986) j!136)))))

(assert (= (and start!53660 res!372609) b!584790))

(assert (= (and b!584790 res!372616) b!584801))

(assert (= (and b!584801 res!372615) b!584793))

(assert (= (and b!584793 res!372611) b!584796))

(assert (= (and b!584796 res!372617) b!584795))

(assert (= (and b!584795 res!372613) b!584792))

(assert (= (and b!584792 res!372607) b!584799))

(assert (= (and b!584799 res!372614) b!584791))

(assert (= (and b!584791 res!372612) b!584794))

(assert (= (and b!584794 res!372606) b!584800))

(assert (= (and b!584800 res!372610) b!584797))

(assert (= (and b!584797 res!372608) b!584798))

(declare-fun m!563105 () Bool)

(assert (=> b!584797 m!563105))

(declare-fun m!563107 () Bool)

(assert (=> b!584796 m!563107))

(declare-fun m!563109 () Bool)

(assert (=> b!584800 m!563109))

(declare-fun m!563111 () Bool)

(assert (=> b!584800 m!563111))

(declare-fun m!563113 () Bool)

(assert (=> b!584792 m!563113))

(declare-fun m!563115 () Bool)

(assert (=> b!584791 m!563115))

(declare-fun m!563117 () Bool)

(assert (=> b!584791 m!563117))

(declare-fun m!563119 () Bool)

(assert (=> b!584791 m!563119))

(assert (=> b!584794 m!563111))

(assert (=> b!584794 m!563111))

(declare-fun m!563121 () Bool)

(assert (=> b!584794 m!563121))

(declare-fun m!563123 () Bool)

(assert (=> start!53660 m!563123))

(declare-fun m!563125 () Bool)

(assert (=> start!53660 m!563125))

(assert (=> b!584798 m!563111))

(assert (=> b!584798 m!563111))

(declare-fun m!563127 () Bool)

(assert (=> b!584798 m!563127))

(assert (=> b!584801 m!563111))

(assert (=> b!584801 m!563111))

(declare-fun m!563129 () Bool)

(assert (=> b!584801 m!563129))

(declare-fun m!563131 () Bool)

(assert (=> b!584793 m!563131))

(declare-fun m!563133 () Bool)

(assert (=> b!584795 m!563133))

(declare-fun m!563135 () Bool)

(assert (=> b!584799 m!563135))

(push 1)

