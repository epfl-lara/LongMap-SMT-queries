; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53490 () Bool)

(assert start!53490)

(declare-fun res!370075 () Bool)

(declare-fun e!333794 () Bool)

(assert (=> start!53490 (=> (not res!370075) (not e!333794))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53490 (= res!370075 (validMask!0 mask!3053))))

(assert (=> start!53490 e!333794))

(assert (=> start!53490 true))

(declare-datatypes ((array!36405 0))(
  ( (array!36406 (arr!17477 (Array (_ BitVec 32) (_ BitVec 64))) (size!17842 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36405)

(declare-fun array_inv!13360 (array!36405) Bool)

(assert (=> start!53490 (array_inv!13360 a!2986)))

(declare-fun b!582110 () Bool)

(declare-fun res!370072 () Bool)

(assert (=> b!582110 (=> (not res!370072) (not e!333794))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582110 (= res!370072 (validKeyInArray!0 (select (arr!17477 a!2986) j!136)))))

(declare-fun b!582111 () Bool)

(declare-fun e!333793 () Bool)

(assert (=> b!582111 (= e!333793 false)))

(declare-datatypes ((SeekEntryResult!5914 0))(
  ( (MissingZero!5914 (index!25883 (_ BitVec 32))) (Found!5914 (index!25884 (_ BitVec 32))) (Intermediate!5914 (undefined!6726 Bool) (index!25885 (_ BitVec 32)) (x!54746 (_ BitVec 32))) (Undefined!5914) (MissingVacant!5914 (index!25886 (_ BitVec 32))) )
))
(declare-fun lt!264867 () SeekEntryResult!5914)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36405 (_ BitVec 32)) SeekEntryResult!5914)

(assert (=> b!582111 (= lt!264867 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17477 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582112 () Bool)

(declare-fun res!370076 () Bool)

(assert (=> b!582112 (=> (not res!370076) (not e!333794))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36405 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582112 (= res!370076 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582113 () Bool)

(declare-fun res!370070 () Bool)

(assert (=> b!582113 (=> (not res!370070) (not e!333793))))

(declare-datatypes ((List!11557 0))(
  ( (Nil!11554) (Cons!11553 (h!12598 (_ BitVec 64)) (t!17776 List!11557)) )
))
(declare-fun arrayNoDuplicates!0 (array!36405 (_ BitVec 32) List!11557) Bool)

(assert (=> b!582113 (= res!370070 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11554))))

(declare-fun b!582114 () Bool)

(declare-fun res!370069 () Bool)

(assert (=> b!582114 (=> (not res!370069) (not e!333793))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36405 (_ BitVec 32)) Bool)

(assert (=> b!582114 (= res!370069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582115 () Bool)

(assert (=> b!582115 (= e!333794 e!333793)))

(declare-fun res!370068 () Bool)

(assert (=> b!582115 (=> (not res!370068) (not e!333793))))

(declare-fun lt!264868 () SeekEntryResult!5914)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582115 (= res!370068 (or (= lt!264868 (MissingZero!5914 i!1108)) (= lt!264868 (MissingVacant!5914 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36405 (_ BitVec 32)) SeekEntryResult!5914)

(assert (=> b!582115 (= lt!264868 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!582116 () Bool)

(declare-fun res!370073 () Bool)

(assert (=> b!582116 (=> (not res!370073) (not e!333794))))

(assert (=> b!582116 (= res!370073 (validKeyInArray!0 k0!1786))))

(declare-fun b!582117 () Bool)

(declare-fun res!370074 () Bool)

(assert (=> b!582117 (=> (not res!370074) (not e!333794))))

(assert (=> b!582117 (= res!370074 (and (= (size!17842 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17842 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17842 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582118 () Bool)

(declare-fun res!370071 () Bool)

(assert (=> b!582118 (=> (not res!370071) (not e!333793))))

(assert (=> b!582118 (= res!370071 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17477 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17477 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53490 res!370075) b!582117))

(assert (= (and b!582117 res!370074) b!582110))

(assert (= (and b!582110 res!370072) b!582116))

(assert (= (and b!582116 res!370073) b!582112))

(assert (= (and b!582112 res!370076) b!582115))

(assert (= (and b!582115 res!370068) b!582114))

(assert (= (and b!582114 res!370069) b!582113))

(assert (= (and b!582113 res!370070) b!582118))

(assert (= (and b!582118 res!370071) b!582111))

(declare-fun m!560101 () Bool)

(assert (=> b!582116 m!560101))

(declare-fun m!560103 () Bool)

(assert (=> b!582110 m!560103))

(assert (=> b!582110 m!560103))

(declare-fun m!560105 () Bool)

(assert (=> b!582110 m!560105))

(declare-fun m!560107 () Bool)

(assert (=> b!582113 m!560107))

(declare-fun m!560109 () Bool)

(assert (=> b!582114 m!560109))

(declare-fun m!560111 () Bool)

(assert (=> start!53490 m!560111))

(declare-fun m!560113 () Bool)

(assert (=> start!53490 m!560113))

(assert (=> b!582111 m!560103))

(assert (=> b!582111 m!560103))

(declare-fun m!560115 () Bool)

(assert (=> b!582111 m!560115))

(declare-fun m!560117 () Bool)

(assert (=> b!582118 m!560117))

(declare-fun m!560119 () Bool)

(assert (=> b!582118 m!560119))

(declare-fun m!560121 () Bool)

(assert (=> b!582118 m!560121))

(declare-fun m!560123 () Bool)

(assert (=> b!582112 m!560123))

(declare-fun m!560125 () Bool)

(assert (=> b!582115 m!560125))

(check-sat (not b!582114) (not b!582116) (not b!582115) (not b!582112) (not b!582111) (not b!582113) (not start!53490) (not b!582110))
(check-sat)
