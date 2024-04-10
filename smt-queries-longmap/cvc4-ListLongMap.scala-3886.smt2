; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53330 () Bool)

(assert start!53330)

(declare-fun b!579969 () Bool)

(declare-fun e!333175 () Bool)

(assert (=> b!579969 (= e!333175 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5830 0))(
  ( (MissingZero!5830 (index!25547 (_ BitVec 32))) (Found!5830 (index!25548 (_ BitVec 32))) (Intermediate!5830 (undefined!6642 Bool) (index!25549 (_ BitVec 32)) (x!54427 (_ BitVec 32))) (Undefined!5830) (MissingVacant!5830 (index!25550 (_ BitVec 32))) )
))
(declare-fun lt!264601 () SeekEntryResult!5830)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36231 0))(
  ( (array!36232 (arr!17390 (Array (_ BitVec 32) (_ BitVec 64))) (size!17754 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36231)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36231 (_ BitVec 32)) SeekEntryResult!5830)

(assert (=> b!579969 (= lt!264601 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17390 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579970 () Bool)

(declare-fun res!367786 () Bool)

(declare-fun e!333177 () Bool)

(assert (=> b!579970 (=> (not res!367786) (not e!333177))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579970 (= res!367786 (validKeyInArray!0 (select (arr!17390 a!2986) j!136)))))

(declare-fun b!579971 () Bool)

(assert (=> b!579971 (= e!333177 e!333175)))

(declare-fun res!367792 () Bool)

(assert (=> b!579971 (=> (not res!367792) (not e!333175))))

(declare-fun lt!264600 () SeekEntryResult!5830)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579971 (= res!367792 (or (= lt!264600 (MissingZero!5830 i!1108)) (= lt!264600 (MissingVacant!5830 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36231 (_ BitVec 32)) SeekEntryResult!5830)

(assert (=> b!579971 (= lt!264600 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!579972 () Bool)

(declare-fun res!367788 () Bool)

(assert (=> b!579972 (=> (not res!367788) (not e!333177))))

(declare-fun arrayContainsKey!0 (array!36231 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579972 (= res!367788 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579973 () Bool)

(declare-fun res!367790 () Bool)

(assert (=> b!579973 (=> (not res!367790) (not e!333177))))

(assert (=> b!579973 (= res!367790 (and (= (size!17754 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17754 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17754 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579974 () Bool)

(declare-fun res!367791 () Bool)

(assert (=> b!579974 (=> (not res!367791) (not e!333175))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36231 (_ BitVec 32)) Bool)

(assert (=> b!579974 (= res!367791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579975 () Bool)

(declare-fun res!367785 () Bool)

(assert (=> b!579975 (=> (not res!367785) (not e!333175))))

(declare-datatypes ((List!11431 0))(
  ( (Nil!11428) (Cons!11427 (h!12472 (_ BitVec 64)) (t!17659 List!11431)) )
))
(declare-fun arrayNoDuplicates!0 (array!36231 (_ BitVec 32) List!11431) Bool)

(assert (=> b!579975 (= res!367785 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11428))))

(declare-fun res!367793 () Bool)

(assert (=> start!53330 (=> (not res!367793) (not e!333177))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53330 (= res!367793 (validMask!0 mask!3053))))

(assert (=> start!53330 e!333177))

(assert (=> start!53330 true))

(declare-fun array_inv!13186 (array!36231) Bool)

(assert (=> start!53330 (array_inv!13186 a!2986)))

(declare-fun b!579976 () Bool)

(declare-fun res!367787 () Bool)

(assert (=> b!579976 (=> (not res!367787) (not e!333177))))

(assert (=> b!579976 (= res!367787 (validKeyInArray!0 k!1786))))

(declare-fun b!579977 () Bool)

(declare-fun res!367789 () Bool)

(assert (=> b!579977 (=> (not res!367789) (not e!333175))))

(assert (=> b!579977 (= res!367789 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17390 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17390 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53330 res!367793) b!579973))

(assert (= (and b!579973 res!367790) b!579970))

(assert (= (and b!579970 res!367786) b!579976))

(assert (= (and b!579976 res!367787) b!579972))

(assert (= (and b!579972 res!367788) b!579971))

(assert (= (and b!579971 res!367792) b!579974))

(assert (= (and b!579974 res!367791) b!579975))

(assert (= (and b!579975 res!367785) b!579977))

(assert (= (and b!579977 res!367789) b!579969))

(declare-fun m!558569 () Bool)

(assert (=> b!579974 m!558569))

(declare-fun m!558571 () Bool)

(assert (=> b!579976 m!558571))

(declare-fun m!558573 () Bool)

(assert (=> b!579975 m!558573))

(declare-fun m!558575 () Bool)

(assert (=> b!579970 m!558575))

(assert (=> b!579970 m!558575))

(declare-fun m!558577 () Bool)

(assert (=> b!579970 m!558577))

(declare-fun m!558579 () Bool)

(assert (=> start!53330 m!558579))

(declare-fun m!558581 () Bool)

(assert (=> start!53330 m!558581))

(declare-fun m!558583 () Bool)

(assert (=> b!579977 m!558583))

(declare-fun m!558585 () Bool)

(assert (=> b!579977 m!558585))

(declare-fun m!558587 () Bool)

(assert (=> b!579977 m!558587))

(assert (=> b!579969 m!558575))

(assert (=> b!579969 m!558575))

(declare-fun m!558589 () Bool)

(assert (=> b!579969 m!558589))

(declare-fun m!558591 () Bool)

(assert (=> b!579972 m!558591))

(declare-fun m!558593 () Bool)

(assert (=> b!579971 m!558593))

(push 1)

