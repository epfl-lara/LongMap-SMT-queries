; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53556 () Bool)

(assert start!53556)

(declare-fun b!583056 () Bool)

(declare-fun res!370872 () Bool)

(declare-fun e!334194 () Bool)

(assert (=> b!583056 (=> (not res!370872) (not e!334194))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36457 0))(
  ( (array!36458 (arr!17503 (Array (_ BitVec 32) (_ BitVec 64))) (size!17867 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36457)

(assert (=> b!583056 (= res!370872 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17503 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17503 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583057 () Bool)

(declare-fun res!370875 () Bool)

(declare-fun e!334192 () Bool)

(assert (=> b!583057 (=> (not res!370875) (not e!334192))))

(declare-fun arrayContainsKey!0 (array!36457 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583057 (= res!370875 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583058 () Bool)

(declare-fun res!370878 () Bool)

(assert (=> b!583058 (=> (not res!370878) (not e!334194))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36457 (_ BitVec 32)) Bool)

(assert (=> b!583058 (= res!370878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583059 () Bool)

(assert (=> b!583059 (= e!334194 false)))

(declare-datatypes ((SeekEntryResult!5943 0))(
  ( (MissingZero!5943 (index!25999 (_ BitVec 32))) (Found!5943 (index!26000 (_ BitVec 32))) (Intermediate!5943 (undefined!6755 Bool) (index!26001 (_ BitVec 32)) (x!54844 (_ BitVec 32))) (Undefined!5943) (MissingVacant!5943 (index!26002 (_ BitVec 32))) )
))
(declare-fun lt!265252 () SeekEntryResult!5943)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36457 (_ BitVec 32)) SeekEntryResult!5943)

(assert (=> b!583059 (= lt!265252 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17503 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!583060 () Bool)

(declare-fun res!370880 () Bool)

(assert (=> b!583060 (=> (not res!370880) (not e!334194))))

(declare-datatypes ((List!11544 0))(
  ( (Nil!11541) (Cons!11540 (h!12585 (_ BitVec 64)) (t!17772 List!11544)) )
))
(declare-fun arrayNoDuplicates!0 (array!36457 (_ BitVec 32) List!11544) Bool)

(assert (=> b!583060 (= res!370880 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11541))))

(declare-fun res!370877 () Bool)

(assert (=> start!53556 (=> (not res!370877) (not e!334192))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53556 (= res!370877 (validMask!0 mask!3053))))

(assert (=> start!53556 e!334192))

(assert (=> start!53556 true))

(declare-fun array_inv!13299 (array!36457) Bool)

(assert (=> start!53556 (array_inv!13299 a!2986)))

(declare-fun b!583061 () Bool)

(declare-fun res!370873 () Bool)

(assert (=> b!583061 (=> (not res!370873) (not e!334192))))

(assert (=> b!583061 (= res!370873 (and (= (size!17867 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17867 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17867 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583062 () Bool)

(declare-fun res!370874 () Bool)

(assert (=> b!583062 (=> (not res!370874) (not e!334192))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583062 (= res!370874 (validKeyInArray!0 k0!1786))))

(declare-fun b!583063 () Bool)

(declare-fun res!370879 () Bool)

(assert (=> b!583063 (=> (not res!370879) (not e!334192))))

(assert (=> b!583063 (= res!370879 (validKeyInArray!0 (select (arr!17503 a!2986) j!136)))))

(declare-fun b!583064 () Bool)

(assert (=> b!583064 (= e!334192 e!334194)))

(declare-fun res!370876 () Bool)

(assert (=> b!583064 (=> (not res!370876) (not e!334194))))

(declare-fun lt!265251 () SeekEntryResult!5943)

(assert (=> b!583064 (= res!370876 (or (= lt!265251 (MissingZero!5943 i!1108)) (= lt!265251 (MissingVacant!5943 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36457 (_ BitVec 32)) SeekEntryResult!5943)

(assert (=> b!583064 (= lt!265251 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!53556 res!370877) b!583061))

(assert (= (and b!583061 res!370873) b!583063))

(assert (= (and b!583063 res!370879) b!583062))

(assert (= (and b!583062 res!370874) b!583057))

(assert (= (and b!583057 res!370875) b!583064))

(assert (= (and b!583064 res!370876) b!583058))

(assert (= (and b!583058 res!370878) b!583060))

(assert (= (and b!583060 res!370880) b!583056))

(assert (= (and b!583056 res!370872) b!583059))

(declare-fun m!561537 () Bool)

(assert (=> b!583056 m!561537))

(declare-fun m!561539 () Bool)

(assert (=> b!583056 m!561539))

(declare-fun m!561541 () Bool)

(assert (=> b!583056 m!561541))

(declare-fun m!561543 () Bool)

(assert (=> b!583064 m!561543))

(declare-fun m!561545 () Bool)

(assert (=> b!583057 m!561545))

(declare-fun m!561547 () Bool)

(assert (=> b!583059 m!561547))

(assert (=> b!583059 m!561547))

(declare-fun m!561549 () Bool)

(assert (=> b!583059 m!561549))

(declare-fun m!561551 () Bool)

(assert (=> b!583062 m!561551))

(declare-fun m!561553 () Bool)

(assert (=> start!53556 m!561553))

(declare-fun m!561555 () Bool)

(assert (=> start!53556 m!561555))

(declare-fun m!561557 () Bool)

(assert (=> b!583060 m!561557))

(declare-fun m!561559 () Bool)

(assert (=> b!583058 m!561559))

(assert (=> b!583063 m!561547))

(assert (=> b!583063 m!561547))

(declare-fun m!561561 () Bool)

(assert (=> b!583063 m!561561))

(check-sat (not b!583058) (not b!583062) (not b!583059) (not b!583063) (not b!583057) (not start!53556) (not b!583060) (not b!583064))
