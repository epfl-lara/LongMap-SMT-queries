; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53620 () Bool)

(assert start!53620)

(declare-fun b!584070 () Bool)

(declare-fun res!371895 () Bool)

(declare-fun e!334527 () Bool)

(assert (=> b!584070 (=> (not res!371895) (not e!334527))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36521 0))(
  ( (array!36522 (arr!17535 (Array (_ BitVec 32) (_ BitVec 64))) (size!17899 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36521)

(declare-datatypes ((SeekEntryResult!5975 0))(
  ( (MissingZero!5975 (index!26127 (_ BitVec 32))) (Found!5975 (index!26128 (_ BitVec 32))) (Intermediate!5975 (undefined!6787 Bool) (index!26129 (_ BitVec 32)) (x!54964 (_ BitVec 32))) (Undefined!5975) (MissingVacant!5975 (index!26130 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36521 (_ BitVec 32)) SeekEntryResult!5975)

(assert (=> b!584070 (= res!371895 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17535 a!2986) j!136) a!2986 mask!3053) (Found!5975 j!136)))))

(declare-fun res!371893 () Bool)

(declare-fun e!334528 () Bool)

(assert (=> start!53620 (=> (not res!371893) (not e!334528))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53620 (= res!371893 (validMask!0 mask!3053))))

(assert (=> start!53620 e!334528))

(assert (=> start!53620 true))

(declare-fun array_inv!13331 (array!36521) Bool)

(assert (=> start!53620 (array_inv!13331 a!2986)))

(declare-fun b!584071 () Bool)

(assert (=> b!584071 (= e!334528 e!334527)))

(declare-fun res!371890 () Bool)

(assert (=> b!584071 (=> (not res!371890) (not e!334527))))

(declare-fun lt!265482 () SeekEntryResult!5975)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!584071 (= res!371890 (or (= lt!265482 (MissingZero!5975 i!1108)) (= lt!265482 (MissingVacant!5975 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36521 (_ BitVec 32)) SeekEntryResult!5975)

(assert (=> b!584071 (= lt!265482 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!584072 () Bool)

(declare-fun res!371889 () Bool)

(assert (=> b!584072 (=> (not res!371889) (not e!334528))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584072 (= res!371889 (validKeyInArray!0 (select (arr!17535 a!2986) j!136)))))

(declare-fun b!584073 () Bool)

(declare-fun res!371891 () Bool)

(assert (=> b!584073 (=> (not res!371891) (not e!334527))))

(assert (=> b!584073 (= res!371891 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17535 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17535 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584074 () Bool)

(declare-fun res!371888 () Bool)

(assert (=> b!584074 (=> (not res!371888) (not e!334527))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36521 (_ BitVec 32)) Bool)

(assert (=> b!584074 (= res!371888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584075 () Bool)

(declare-fun res!371887 () Bool)

(assert (=> b!584075 (=> (not res!371887) (not e!334527))))

(declare-datatypes ((List!11576 0))(
  ( (Nil!11573) (Cons!11572 (h!12617 (_ BitVec 64)) (t!17804 List!11576)) )
))
(declare-fun arrayNoDuplicates!0 (array!36521 (_ BitVec 32) List!11576) Bool)

(assert (=> b!584075 (= res!371887 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11573))))

(declare-fun b!584076 () Bool)

(declare-fun e!334530 () Bool)

(assert (=> b!584076 (= e!334527 e!334530)))

(declare-fun res!371894 () Bool)

(assert (=> b!584076 (=> (not res!371894) (not e!334530))))

(declare-fun lt!265483 () (_ BitVec 32))

(assert (=> b!584076 (= res!371894 (and (bvsge lt!265483 #b00000000000000000000000000000000) (bvslt lt!265483 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584076 (= lt!265483 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!584077 () Bool)

(declare-fun res!371896 () Bool)

(assert (=> b!584077 (=> (not res!371896) (not e!334528))))

(assert (=> b!584077 (= res!371896 (validKeyInArray!0 k!1786))))

(declare-fun b!584078 () Bool)

(assert (=> b!584078 (= e!334530 false)))

(declare-fun lt!265481 () SeekEntryResult!5975)

(assert (=> b!584078 (= lt!265481 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265483 vacantSpotIndex!68 (select (arr!17535 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584079 () Bool)

(declare-fun res!371886 () Bool)

(assert (=> b!584079 (=> (not res!371886) (not e!334528))))

(declare-fun arrayContainsKey!0 (array!36521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584079 (= res!371886 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!584080 () Bool)

(declare-fun res!371897 () Bool)

(assert (=> b!584080 (=> (not res!371897) (not e!334528))))

(assert (=> b!584080 (= res!371897 (and (= (size!17899 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17899 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17899 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584081 () Bool)

(declare-fun res!371892 () Bool)

(assert (=> b!584081 (=> (not res!371892) (not e!334527))))

(assert (=> b!584081 (= res!371892 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17535 a!2986) index!984) (select (arr!17535 a!2986) j!136))) (not (= (select (arr!17535 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (= (and start!53620 res!371893) b!584080))

(assert (= (and b!584080 res!371897) b!584072))

(assert (= (and b!584072 res!371889) b!584077))

(assert (= (and b!584077 res!371896) b!584079))

(assert (= (and b!584079 res!371886) b!584071))

(assert (= (and b!584071 res!371890) b!584074))

(assert (= (and b!584074 res!371888) b!584075))

(assert (= (and b!584075 res!371887) b!584073))

(assert (= (and b!584073 res!371891) b!584070))

(assert (= (and b!584070 res!371895) b!584081))

(assert (= (and b!584081 res!371892) b!584076))

(assert (= (and b!584076 res!371894) b!584078))

(declare-fun m!562465 () Bool)

(assert (=> b!584075 m!562465))

(declare-fun m!562467 () Bool)

(assert (=> b!584078 m!562467))

(assert (=> b!584078 m!562467))

(declare-fun m!562469 () Bool)

(assert (=> b!584078 m!562469))

(declare-fun m!562471 () Bool)

(assert (=> b!584076 m!562471))

(declare-fun m!562473 () Bool)

(assert (=> b!584079 m!562473))

(assert (=> b!584070 m!562467))

(assert (=> b!584070 m!562467))

(declare-fun m!562475 () Bool)

(assert (=> b!584070 m!562475))

(assert (=> b!584072 m!562467))

(assert (=> b!584072 m!562467))

(declare-fun m!562477 () Bool)

(assert (=> b!584072 m!562477))

(declare-fun m!562479 () Bool)

(assert (=> b!584073 m!562479))

(declare-fun m!562481 () Bool)

(assert (=> b!584073 m!562481))

(declare-fun m!562483 () Bool)

(assert (=> b!584073 m!562483))

(declare-fun m!562485 () Bool)

(assert (=> b!584081 m!562485))

(assert (=> b!584081 m!562467))

(declare-fun m!562487 () Bool)

(assert (=> b!584071 m!562487))

(declare-fun m!562489 () Bool)

(assert (=> start!53620 m!562489))

(declare-fun m!562491 () Bool)

(assert (=> start!53620 m!562491))

(declare-fun m!562493 () Bool)

(assert (=> b!584077 m!562493))

(declare-fun m!562495 () Bool)

(assert (=> b!584074 m!562495))

(push 1)

