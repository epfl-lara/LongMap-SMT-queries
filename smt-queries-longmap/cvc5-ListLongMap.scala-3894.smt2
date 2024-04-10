; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53374 () Bool)

(assert start!53374)

(declare-fun b!580563 () Bool)

(declare-fun e!333374 () Bool)

(assert (=> b!580563 (= e!333374 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5852 0))(
  ( (MissingZero!5852 (index!25635 (_ BitVec 32))) (Found!5852 (index!25636 (_ BitVec 32))) (Intermediate!5852 (undefined!6664 Bool) (index!25637 (_ BitVec 32)) (x!54513 (_ BitVec 32))) (Undefined!5852) (MissingVacant!5852 (index!25638 (_ BitVec 32))) )
))
(declare-fun lt!264732 () SeekEntryResult!5852)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36275 0))(
  ( (array!36276 (arr!17412 (Array (_ BitVec 32) (_ BitVec 64))) (size!17776 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36275)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36275 (_ BitVec 32)) SeekEntryResult!5852)

(assert (=> b!580563 (= lt!264732 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17412 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580564 () Bool)

(declare-fun res!368379 () Bool)

(declare-fun e!333375 () Bool)

(assert (=> b!580564 (=> (not res!368379) (not e!333375))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36275 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580564 (= res!368379 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!368380 () Bool)

(assert (=> start!53374 (=> (not res!368380) (not e!333375))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53374 (= res!368380 (validMask!0 mask!3053))))

(assert (=> start!53374 e!333375))

(assert (=> start!53374 true))

(declare-fun array_inv!13208 (array!36275) Bool)

(assert (=> start!53374 (array_inv!13208 a!2986)))

(declare-fun b!580565 () Bool)

(declare-fun res!368382 () Bool)

(assert (=> b!580565 (=> (not res!368382) (not e!333374))))

(declare-datatypes ((List!11453 0))(
  ( (Nil!11450) (Cons!11449 (h!12494 (_ BitVec 64)) (t!17681 List!11453)) )
))
(declare-fun arrayNoDuplicates!0 (array!36275 (_ BitVec 32) List!11453) Bool)

(assert (=> b!580565 (= res!368382 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11450))))

(declare-fun b!580566 () Bool)

(declare-fun res!368384 () Bool)

(assert (=> b!580566 (=> (not res!368384) (not e!333375))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!580566 (= res!368384 (and (= (size!17776 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17776 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17776 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580567 () Bool)

(declare-fun res!368383 () Bool)

(assert (=> b!580567 (=> (not res!368383) (not e!333374))))

(assert (=> b!580567 (= res!368383 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17412 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17412 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580568 () Bool)

(declare-fun res!368386 () Bool)

(assert (=> b!580568 (=> (not res!368386) (not e!333375))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580568 (= res!368386 (validKeyInArray!0 k!1786))))

(declare-fun b!580569 () Bool)

(declare-fun res!368381 () Bool)

(assert (=> b!580569 (=> (not res!368381) (not e!333375))))

(assert (=> b!580569 (= res!368381 (validKeyInArray!0 (select (arr!17412 a!2986) j!136)))))

(declare-fun b!580570 () Bool)

(declare-fun res!368385 () Bool)

(assert (=> b!580570 (=> (not res!368385) (not e!333374))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36275 (_ BitVec 32)) Bool)

(assert (=> b!580570 (= res!368385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580571 () Bool)

(assert (=> b!580571 (= e!333375 e!333374)))

(declare-fun res!368387 () Bool)

(assert (=> b!580571 (=> (not res!368387) (not e!333374))))

(declare-fun lt!264733 () SeekEntryResult!5852)

(assert (=> b!580571 (= res!368387 (or (= lt!264733 (MissingZero!5852 i!1108)) (= lt!264733 (MissingVacant!5852 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36275 (_ BitVec 32)) SeekEntryResult!5852)

(assert (=> b!580571 (= lt!264733 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!53374 res!368380) b!580566))

(assert (= (and b!580566 res!368384) b!580569))

(assert (= (and b!580569 res!368381) b!580568))

(assert (= (and b!580568 res!368386) b!580564))

(assert (= (and b!580564 res!368379) b!580571))

(assert (= (and b!580571 res!368387) b!580570))

(assert (= (and b!580570 res!368385) b!580565))

(assert (= (and b!580565 res!368382) b!580567))

(assert (= (and b!580567 res!368383) b!580563))

(declare-fun m!559141 () Bool)

(assert (=> b!580564 m!559141))

(declare-fun m!559143 () Bool)

(assert (=> b!580571 m!559143))

(declare-fun m!559145 () Bool)

(assert (=> b!580568 m!559145))

(declare-fun m!559147 () Bool)

(assert (=> b!580570 m!559147))

(declare-fun m!559149 () Bool)

(assert (=> b!580563 m!559149))

(assert (=> b!580563 m!559149))

(declare-fun m!559151 () Bool)

(assert (=> b!580563 m!559151))

(declare-fun m!559153 () Bool)

(assert (=> b!580565 m!559153))

(declare-fun m!559155 () Bool)

(assert (=> b!580567 m!559155))

(declare-fun m!559157 () Bool)

(assert (=> b!580567 m!559157))

(declare-fun m!559159 () Bool)

(assert (=> b!580567 m!559159))

(assert (=> b!580569 m!559149))

(assert (=> b!580569 m!559149))

(declare-fun m!559161 () Bool)

(assert (=> b!580569 m!559161))

(declare-fun m!559163 () Bool)

(assert (=> start!53374 m!559163))

(declare-fun m!559165 () Bool)

(assert (=> start!53374 m!559165))

(push 1)

(assert (not b!580563))

(assert (not b!580564))

(assert (not b!580565))

(assert (not b!580568))

(assert (not start!53374))

(assert (not b!580571))

(assert (not b!580570))

(assert (not b!580569))

(check-sat)

