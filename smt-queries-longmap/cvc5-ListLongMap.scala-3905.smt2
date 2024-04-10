; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53440 () Bool)

(assert start!53440)

(declare-fun b!581472 () Bool)

(declare-fun res!369292 () Bool)

(declare-fun e!333671 () Bool)

(assert (=> b!581472 (=> (not res!369292) (not e!333671))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36341 0))(
  ( (array!36342 (arr!17445 (Array (_ BitVec 32) (_ BitVec 64))) (size!17809 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36341)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!581472 (= res!369292 (and (= (size!17809 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17809 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17809 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!369294 () Bool)

(assert (=> start!53440 (=> (not res!369294) (not e!333671))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53440 (= res!369294 (validMask!0 mask!3053))))

(assert (=> start!53440 e!333671))

(assert (=> start!53440 true))

(declare-fun array_inv!13241 (array!36341) Bool)

(assert (=> start!53440 (array_inv!13241 a!2986)))

(declare-fun b!581473 () Bool)

(declare-fun e!333672 () Bool)

(assert (=> b!581473 (= e!333672 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5885 0))(
  ( (MissingZero!5885 (index!25767 (_ BitVec 32))) (Found!5885 (index!25768 (_ BitVec 32))) (Intermediate!5885 (undefined!6697 Bool) (index!25769 (_ BitVec 32)) (x!54634 (_ BitVec 32))) (Undefined!5885) (MissingVacant!5885 (index!25770 (_ BitVec 32))) )
))
(declare-fun lt!264912 () SeekEntryResult!5885)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36341 (_ BitVec 32)) SeekEntryResult!5885)

(assert (=> b!581473 (= lt!264912 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17445 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581474 () Bool)

(declare-fun res!369291 () Bool)

(assert (=> b!581474 (=> (not res!369291) (not e!333672))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36341 (_ BitVec 32)) Bool)

(assert (=> b!581474 (= res!369291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581475 () Bool)

(declare-fun res!369296 () Bool)

(assert (=> b!581475 (=> (not res!369296) (not e!333671))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581475 (= res!369296 (validKeyInArray!0 k!1786))))

(declare-fun b!581476 () Bool)

(assert (=> b!581476 (= e!333671 e!333672)))

(declare-fun res!369290 () Bool)

(assert (=> b!581476 (=> (not res!369290) (not e!333672))))

(declare-fun lt!264913 () SeekEntryResult!5885)

(assert (=> b!581476 (= res!369290 (or (= lt!264913 (MissingZero!5885 i!1108)) (= lt!264913 (MissingVacant!5885 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36341 (_ BitVec 32)) SeekEntryResult!5885)

(assert (=> b!581476 (= lt!264913 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!581477 () Bool)

(declare-fun res!369289 () Bool)

(assert (=> b!581477 (=> (not res!369289) (not e!333671))))

(declare-fun arrayContainsKey!0 (array!36341 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581477 (= res!369289 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581478 () Bool)

(declare-fun res!369293 () Bool)

(assert (=> b!581478 (=> (not res!369293) (not e!333672))))

(assert (=> b!581478 (= res!369293 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17445 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17445 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581479 () Bool)

(declare-fun res!369288 () Bool)

(assert (=> b!581479 (=> (not res!369288) (not e!333672))))

(declare-datatypes ((List!11486 0))(
  ( (Nil!11483) (Cons!11482 (h!12527 (_ BitVec 64)) (t!17714 List!11486)) )
))
(declare-fun arrayNoDuplicates!0 (array!36341 (_ BitVec 32) List!11486) Bool)

(assert (=> b!581479 (= res!369288 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11483))))

(declare-fun b!581480 () Bool)

(declare-fun res!369295 () Bool)

(assert (=> b!581480 (=> (not res!369295) (not e!333671))))

(assert (=> b!581480 (= res!369295 (validKeyInArray!0 (select (arr!17445 a!2986) j!136)))))

(assert (= (and start!53440 res!369294) b!581472))

(assert (= (and b!581472 res!369292) b!581480))

(assert (= (and b!581480 res!369295) b!581475))

(assert (= (and b!581475 res!369296) b!581477))

(assert (= (and b!581477 res!369289) b!581476))

(assert (= (and b!581476 res!369290) b!581474))

(assert (= (and b!581474 res!369291) b!581479))

(assert (= (and b!581479 res!369288) b!581478))

(assert (= (and b!581478 res!369293) b!581473))

(declare-fun m!560011 () Bool)

(assert (=> b!581475 m!560011))

(declare-fun m!560013 () Bool)

(assert (=> b!581474 m!560013))

(declare-fun m!560015 () Bool)

(assert (=> b!581473 m!560015))

(assert (=> b!581473 m!560015))

(declare-fun m!560017 () Bool)

(assert (=> b!581473 m!560017))

(assert (=> b!581480 m!560015))

(assert (=> b!581480 m!560015))

(declare-fun m!560019 () Bool)

(assert (=> b!581480 m!560019))

(declare-fun m!560021 () Bool)

(assert (=> b!581479 m!560021))

(declare-fun m!560023 () Bool)

(assert (=> start!53440 m!560023))

(declare-fun m!560025 () Bool)

(assert (=> start!53440 m!560025))

(declare-fun m!560027 () Bool)

(assert (=> b!581478 m!560027))

(declare-fun m!560029 () Bool)

(assert (=> b!581478 m!560029))

(declare-fun m!560031 () Bool)

(assert (=> b!581478 m!560031))

(declare-fun m!560033 () Bool)

(assert (=> b!581476 m!560033))

(declare-fun m!560035 () Bool)

(assert (=> b!581477 m!560035))

(push 1)

(assert (not b!581476))

(assert (not b!581474))

(assert (not b!581475))

(assert (not b!581479))

(assert (not start!53440))

(assert (not b!581473))

(assert (not b!581480))

(assert (not b!581477))

(check-sat)

