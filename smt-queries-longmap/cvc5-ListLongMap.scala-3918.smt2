; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53518 () Bool)

(assert start!53518)

(declare-fun b!582543 () Bool)

(declare-fun e!334022 () Bool)

(assert (=> b!582543 (= e!334022 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5924 0))(
  ( (MissingZero!5924 (index!25923 (_ BitVec 32))) (Found!5924 (index!25924 (_ BitVec 32))) (Intermediate!5924 (undefined!6736 Bool) (index!25925 (_ BitVec 32)) (x!54777 (_ BitVec 32))) (Undefined!5924) (MissingVacant!5924 (index!25926 (_ BitVec 32))) )
))
(declare-fun lt!265137 () SeekEntryResult!5924)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36419 0))(
  ( (array!36420 (arr!17484 (Array (_ BitVec 32) (_ BitVec 64))) (size!17848 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36419)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36419 (_ BitVec 32)) SeekEntryResult!5924)

(assert (=> b!582543 (= lt!265137 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17484 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582544 () Bool)

(declare-fun res!370367 () Bool)

(declare-fun e!334023 () Bool)

(assert (=> b!582544 (=> (not res!370367) (not e!334023))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582544 (= res!370367 (validKeyInArray!0 k!1786))))

(declare-fun b!582545 () Bool)

(declare-fun res!370366 () Bool)

(assert (=> b!582545 (=> (not res!370366) (not e!334023))))

(assert (=> b!582545 (= res!370366 (validKeyInArray!0 (select (arr!17484 a!2986) j!136)))))

(declare-fun b!582547 () Bool)

(assert (=> b!582547 (= e!334023 e!334022)))

(declare-fun res!370364 () Bool)

(assert (=> b!582547 (=> (not res!370364) (not e!334022))))

(declare-fun lt!265138 () SeekEntryResult!5924)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582547 (= res!370364 (or (= lt!265138 (MissingZero!5924 i!1108)) (= lt!265138 (MissingVacant!5924 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36419 (_ BitVec 32)) SeekEntryResult!5924)

(assert (=> b!582547 (= lt!265138 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!582548 () Bool)

(declare-fun res!370362 () Bool)

(assert (=> b!582548 (=> (not res!370362) (not e!334022))))

(assert (=> b!582548 (= res!370362 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17484 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17484 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582549 () Bool)

(declare-fun res!370363 () Bool)

(assert (=> b!582549 (=> (not res!370363) (not e!334022))))

(declare-datatypes ((List!11525 0))(
  ( (Nil!11522) (Cons!11521 (h!12566 (_ BitVec 64)) (t!17753 List!11525)) )
))
(declare-fun arrayNoDuplicates!0 (array!36419 (_ BitVec 32) List!11525) Bool)

(assert (=> b!582549 (= res!370363 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11522))))

(declare-fun b!582546 () Bool)

(declare-fun res!370359 () Bool)

(assert (=> b!582546 (=> (not res!370359) (not e!334023))))

(assert (=> b!582546 (= res!370359 (and (= (size!17848 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17848 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17848 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!370361 () Bool)

(assert (=> start!53518 (=> (not res!370361) (not e!334023))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53518 (= res!370361 (validMask!0 mask!3053))))

(assert (=> start!53518 e!334023))

(assert (=> start!53518 true))

(declare-fun array_inv!13280 (array!36419) Bool)

(assert (=> start!53518 (array_inv!13280 a!2986)))

(declare-fun b!582550 () Bool)

(declare-fun res!370360 () Bool)

(assert (=> b!582550 (=> (not res!370360) (not e!334023))))

(declare-fun arrayContainsKey!0 (array!36419 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582550 (= res!370360 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582551 () Bool)

(declare-fun res!370365 () Bool)

(assert (=> b!582551 (=> (not res!370365) (not e!334022))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36419 (_ BitVec 32)) Bool)

(assert (=> b!582551 (= res!370365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53518 res!370361) b!582546))

(assert (= (and b!582546 res!370359) b!582545))

(assert (= (and b!582545 res!370366) b!582544))

(assert (= (and b!582544 res!370367) b!582550))

(assert (= (and b!582550 res!370360) b!582547))

(assert (= (and b!582547 res!370364) b!582551))

(assert (= (and b!582551 res!370365) b!582549))

(assert (= (and b!582549 res!370363) b!582548))

(assert (= (and b!582548 res!370362) b!582543))

(declare-fun m!561043 () Bool)

(assert (=> b!582551 m!561043))

(declare-fun m!561045 () Bool)

(assert (=> b!582543 m!561045))

(assert (=> b!582543 m!561045))

(declare-fun m!561047 () Bool)

(assert (=> b!582543 m!561047))

(declare-fun m!561049 () Bool)

(assert (=> b!582547 m!561049))

(assert (=> b!582545 m!561045))

(assert (=> b!582545 m!561045))

(declare-fun m!561051 () Bool)

(assert (=> b!582545 m!561051))

(declare-fun m!561053 () Bool)

(assert (=> b!582548 m!561053))

(declare-fun m!561055 () Bool)

(assert (=> b!582548 m!561055))

(declare-fun m!561057 () Bool)

(assert (=> b!582548 m!561057))

(declare-fun m!561059 () Bool)

(assert (=> b!582549 m!561059))

(declare-fun m!561061 () Bool)

(assert (=> b!582550 m!561061))

(declare-fun m!561063 () Bool)

(assert (=> b!582544 m!561063))

(declare-fun m!561065 () Bool)

(assert (=> start!53518 m!561065))

(declare-fun m!561067 () Bool)

(assert (=> start!53518 m!561067))

(push 1)

(assert (not start!53518))

(assert (not b!582551))

(assert (not b!582549))

(assert (not b!582544))

(assert (not b!582550))

(assert (not b!582543))

(assert (not b!582545))

(assert (not b!582547))

(check-sat)

