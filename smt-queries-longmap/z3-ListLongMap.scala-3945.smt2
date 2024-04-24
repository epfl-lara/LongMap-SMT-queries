; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53730 () Bool)

(assert start!53730)

(declare-fun b!585359 () Bool)

(declare-fun e!335018 () Bool)

(assert (=> b!585359 (= e!335018 false)))

(declare-fun lt!265853 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5956 0))(
  ( (MissingZero!5956 (index!26051 (_ BitVec 32))) (Found!5956 (index!26052 (_ BitVec 32))) (Intermediate!5956 (undefined!6768 Bool) (index!26053 (_ BitVec 32)) (x!55028 (_ BitVec 32))) (Undefined!5956) (MissingVacant!5956 (index!26054 (_ BitVec 32))) )
))
(declare-fun lt!265855 () SeekEntryResult!5956)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!36576 0))(
  ( (array!36577 (arr!17560 (Array (_ BitVec 32) (_ BitVec 64))) (size!17924 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36576)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36576 (_ BitVec 32)) SeekEntryResult!5956)

(assert (=> b!585359 (= lt!265855 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265853 vacantSpotIndex!68 (select (arr!17560 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!585360 () Bool)

(declare-fun res!373071 () Bool)

(declare-fun e!335017 () Bool)

(assert (=> b!585360 (=> (not res!373071) (not e!335017))))

(declare-datatypes ((List!11508 0))(
  ( (Nil!11505) (Cons!11504 (h!12552 (_ BitVec 64)) (t!17728 List!11508)) )
))
(declare-fun arrayNoDuplicates!0 (array!36576 (_ BitVec 32) List!11508) Bool)

(assert (=> b!585360 (= res!373071 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11505))))

(declare-fun res!373072 () Bool)

(declare-fun e!335016 () Bool)

(assert (=> start!53730 (=> (not res!373072) (not e!335016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53730 (= res!373072 (validMask!0 mask!3053))))

(assert (=> start!53730 e!335016))

(assert (=> start!53730 true))

(declare-fun array_inv!13419 (array!36576) Bool)

(assert (=> start!53730 (array_inv!13419 a!2986)))

(declare-fun b!585361 () Bool)

(declare-fun res!373080 () Bool)

(assert (=> b!585361 (=> (not res!373080) (not e!335016))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!585361 (= res!373080 (and (= (size!17924 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17924 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17924 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!585362 () Bool)

(declare-fun res!373079 () Bool)

(assert (=> b!585362 (=> (not res!373079) (not e!335016))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36576 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585362 (= res!373079 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585363 () Bool)

(assert (=> b!585363 (= e!335017 e!335018)))

(declare-fun res!373074 () Bool)

(assert (=> b!585363 (=> (not res!373074) (not e!335018))))

(assert (=> b!585363 (= res!373074 (and (bvsge lt!265853 #b00000000000000000000000000000000) (bvslt lt!265853 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585363 (= lt!265853 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!585364 () Bool)

(declare-fun res!373077 () Bool)

(assert (=> b!585364 (=> (not res!373077) (not e!335017))))

(assert (=> b!585364 (= res!373077 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17560 a!2986) index!984) (select (arr!17560 a!2986) j!136))) (not (= (select (arr!17560 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!585365 () Bool)

(declare-fun res!373073 () Bool)

(assert (=> b!585365 (=> (not res!373073) (not e!335016))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585365 (= res!373073 (validKeyInArray!0 k0!1786))))

(declare-fun b!585366 () Bool)

(declare-fun res!373075 () Bool)

(assert (=> b!585366 (=> (not res!373075) (not e!335017))))

(assert (=> b!585366 (= res!373075 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17560 a!2986) j!136) a!2986 mask!3053) (Found!5956 j!136)))))

(declare-fun b!585367 () Bool)

(declare-fun res!373076 () Bool)

(assert (=> b!585367 (=> (not res!373076) (not e!335017))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36576 (_ BitVec 32)) Bool)

(assert (=> b!585367 (= res!373076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585368 () Bool)

(declare-fun res!373081 () Bool)

(assert (=> b!585368 (=> (not res!373081) (not e!335016))))

(assert (=> b!585368 (= res!373081 (validKeyInArray!0 (select (arr!17560 a!2986) j!136)))))

(declare-fun b!585369 () Bool)

(declare-fun res!373078 () Bool)

(assert (=> b!585369 (=> (not res!373078) (not e!335017))))

(assert (=> b!585369 (= res!373078 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17560 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17560 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585370 () Bool)

(assert (=> b!585370 (= e!335016 e!335017)))

(declare-fun res!373070 () Bool)

(assert (=> b!585370 (=> (not res!373070) (not e!335017))))

(declare-fun lt!265854 () SeekEntryResult!5956)

(assert (=> b!585370 (= res!373070 (or (= lt!265854 (MissingZero!5956 i!1108)) (= lt!265854 (MissingVacant!5956 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36576 (_ BitVec 32)) SeekEntryResult!5956)

(assert (=> b!585370 (= lt!265854 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!53730 res!373072) b!585361))

(assert (= (and b!585361 res!373080) b!585368))

(assert (= (and b!585368 res!373081) b!585365))

(assert (= (and b!585365 res!373073) b!585362))

(assert (= (and b!585362 res!373079) b!585370))

(assert (= (and b!585370 res!373070) b!585367))

(assert (= (and b!585367 res!373076) b!585360))

(assert (= (and b!585360 res!373071) b!585369))

(assert (= (and b!585369 res!373078) b!585366))

(assert (= (and b!585366 res!373075) b!585364))

(assert (= (and b!585364 res!373077) b!585363))

(assert (= (and b!585363 res!373074) b!585359))

(declare-fun m!563783 () Bool)

(assert (=> b!585366 m!563783))

(assert (=> b!585366 m!563783))

(declare-fun m!563785 () Bool)

(assert (=> b!585366 m!563785))

(declare-fun m!563787 () Bool)

(assert (=> b!585362 m!563787))

(declare-fun m!563789 () Bool)

(assert (=> b!585364 m!563789))

(assert (=> b!585364 m!563783))

(assert (=> b!585368 m!563783))

(assert (=> b!585368 m!563783))

(declare-fun m!563791 () Bool)

(assert (=> b!585368 m!563791))

(declare-fun m!563793 () Bool)

(assert (=> b!585363 m!563793))

(declare-fun m!563795 () Bool)

(assert (=> b!585360 m!563795))

(declare-fun m!563797 () Bool)

(assert (=> b!585369 m!563797))

(declare-fun m!563799 () Bool)

(assert (=> b!585369 m!563799))

(declare-fun m!563801 () Bool)

(assert (=> b!585369 m!563801))

(declare-fun m!563803 () Bool)

(assert (=> start!53730 m!563803))

(declare-fun m!563805 () Bool)

(assert (=> start!53730 m!563805))

(declare-fun m!563807 () Bool)

(assert (=> b!585370 m!563807))

(declare-fun m!563809 () Bool)

(assert (=> b!585367 m!563809))

(declare-fun m!563811 () Bool)

(assert (=> b!585365 m!563811))

(assert (=> b!585359 m!563783))

(assert (=> b!585359 m!563783))

(declare-fun m!563813 () Bool)

(assert (=> b!585359 m!563813))

(check-sat (not b!585360) (not b!585365) (not b!585367) (not b!585370) (not b!585363) (not start!53730) (not b!585359) (not b!585362) (not b!585366) (not b!585368))
(check-sat)
