; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53676 () Bool)

(assert start!53676)

(declare-fun b!585095 () Bool)

(declare-fun res!373057 () Bool)

(declare-fun e!334786 () Bool)

(assert (=> b!585095 (=> (not res!373057) (not e!334786))))

(declare-datatypes ((array!36591 0))(
  ( (array!36592 (arr!17570 (Array (_ BitVec 32) (_ BitVec 64))) (size!17935 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36591)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36591 (_ BitVec 32)) Bool)

(assert (=> b!585095 (= res!373057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585096 () Bool)

(declare-fun res!373060 () Bool)

(declare-fun e!334785 () Bool)

(assert (=> b!585096 (=> (not res!373060) (not e!334785))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585096 (= res!373060 (validKeyInArray!0 k0!1786))))

(declare-fun b!585097 () Bool)

(declare-fun res!373058 () Bool)

(assert (=> b!585097 (=> (not res!373058) (not e!334786))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6007 0))(
  ( (MissingZero!6007 (index!26255 (_ BitVec 32))) (Found!6007 (index!26256 (_ BitVec 32))) (Intermediate!6007 (undefined!6819 Bool) (index!26257 (_ BitVec 32)) (x!55087 (_ BitVec 32))) (Undefined!6007) (MissingVacant!6007 (index!26258 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36591 (_ BitVec 32)) SeekEntryResult!6007)

(assert (=> b!585097 (= res!373058 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17570 a!2986) j!136) a!2986 mask!3053) (Found!6007 j!136)))))

(declare-fun b!585098 () Bool)

(declare-fun e!334788 () Bool)

(assert (=> b!585098 (= e!334786 e!334788)))

(declare-fun res!373056 () Bool)

(assert (=> b!585098 (=> (not res!373056) (not e!334788))))

(declare-fun lt!265571 () (_ BitVec 32))

(assert (=> b!585098 (= res!373056 (and (bvsge lt!265571 #b00000000000000000000000000000000) (bvslt lt!265571 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585098 (= lt!265571 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!585099 () Bool)

(declare-fun res!373064 () Bool)

(assert (=> b!585099 (=> (not res!373064) (not e!334786))))

(assert (=> b!585099 (= res!373064 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17570 a!2986) index!984) (select (arr!17570 a!2986) j!136))) (not (= (select (arr!17570 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!585100 () Bool)

(assert (=> b!585100 (= e!334788 false)))

(declare-fun lt!265573 () SeekEntryResult!6007)

(assert (=> b!585100 (= lt!265573 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265571 vacantSpotIndex!68 (select (arr!17570 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!585102 () Bool)

(assert (=> b!585102 (= e!334785 e!334786)))

(declare-fun res!373054 () Bool)

(assert (=> b!585102 (=> (not res!373054) (not e!334786))))

(declare-fun lt!265572 () SeekEntryResult!6007)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!585102 (= res!373054 (or (= lt!265572 (MissingZero!6007 i!1108)) (= lt!265572 (MissingVacant!6007 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36591 (_ BitVec 32)) SeekEntryResult!6007)

(assert (=> b!585102 (= lt!265572 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!585103 () Bool)

(declare-fun res!373061 () Bool)

(assert (=> b!585103 (=> (not res!373061) (not e!334785))))

(declare-fun arrayContainsKey!0 (array!36591 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585103 (= res!373061 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585104 () Bool)

(declare-fun res!373062 () Bool)

(assert (=> b!585104 (=> (not res!373062) (not e!334785))))

(assert (=> b!585104 (= res!373062 (validKeyInArray!0 (select (arr!17570 a!2986) j!136)))))

(declare-fun b!585105 () Bool)

(declare-fun res!373055 () Bool)

(assert (=> b!585105 (=> (not res!373055) (not e!334785))))

(assert (=> b!585105 (= res!373055 (and (= (size!17935 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17935 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17935 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!585106 () Bool)

(declare-fun res!373063 () Bool)

(assert (=> b!585106 (=> (not res!373063) (not e!334786))))

(assert (=> b!585106 (= res!373063 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17570 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17570 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585101 () Bool)

(declare-fun res!373059 () Bool)

(assert (=> b!585101 (=> (not res!373059) (not e!334786))))

(declare-datatypes ((List!11650 0))(
  ( (Nil!11647) (Cons!11646 (h!12691 (_ BitVec 64)) (t!17869 List!11650)) )
))
(declare-fun arrayNoDuplicates!0 (array!36591 (_ BitVec 32) List!11650) Bool)

(assert (=> b!585101 (= res!373059 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11647))))

(declare-fun res!373053 () Bool)

(assert (=> start!53676 (=> (not res!373053) (not e!334785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53676 (= res!373053 (validMask!0 mask!3053))))

(assert (=> start!53676 e!334785))

(assert (=> start!53676 true))

(declare-fun array_inv!13453 (array!36591) Bool)

(assert (=> start!53676 (array_inv!13453 a!2986)))

(assert (= (and start!53676 res!373053) b!585105))

(assert (= (and b!585105 res!373055) b!585104))

(assert (= (and b!585104 res!373062) b!585096))

(assert (= (and b!585096 res!373060) b!585103))

(assert (= (and b!585103 res!373061) b!585102))

(assert (= (and b!585102 res!373054) b!585095))

(assert (= (and b!585095 res!373057) b!585101))

(assert (= (and b!585101 res!373059) b!585106))

(assert (= (and b!585106 res!373063) b!585097))

(assert (= (and b!585097 res!373058) b!585099))

(assert (= (and b!585099 res!373064) b!585098))

(assert (= (and b!585098 res!373056) b!585100))

(declare-fun m!562831 () Bool)

(assert (=> b!585098 m!562831))

(declare-fun m!562833 () Bool)

(assert (=> b!585097 m!562833))

(assert (=> b!585097 m!562833))

(declare-fun m!562835 () Bool)

(assert (=> b!585097 m!562835))

(declare-fun m!562837 () Bool)

(assert (=> b!585096 m!562837))

(declare-fun m!562839 () Bool)

(assert (=> start!53676 m!562839))

(declare-fun m!562841 () Bool)

(assert (=> start!53676 m!562841))

(assert (=> b!585104 m!562833))

(assert (=> b!585104 m!562833))

(declare-fun m!562843 () Bool)

(assert (=> b!585104 m!562843))

(declare-fun m!562845 () Bool)

(assert (=> b!585106 m!562845))

(declare-fun m!562847 () Bool)

(assert (=> b!585106 m!562847))

(declare-fun m!562849 () Bool)

(assert (=> b!585106 m!562849))

(declare-fun m!562851 () Bool)

(assert (=> b!585101 m!562851))

(declare-fun m!562853 () Bool)

(assert (=> b!585095 m!562853))

(assert (=> b!585100 m!562833))

(assert (=> b!585100 m!562833))

(declare-fun m!562855 () Bool)

(assert (=> b!585100 m!562855))

(declare-fun m!562857 () Bool)

(assert (=> b!585102 m!562857))

(declare-fun m!562859 () Bool)

(assert (=> b!585103 m!562859))

(declare-fun m!562861 () Bool)

(assert (=> b!585099 m!562861))

(assert (=> b!585099 m!562833))

(check-sat (not b!585100) (not b!585102) (not b!585101) (not b!585104) (not b!585097) (not b!585098) (not b!585103) (not start!53676) (not b!585095) (not b!585096))
(check-sat)
