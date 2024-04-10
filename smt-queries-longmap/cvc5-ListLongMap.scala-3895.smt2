; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53380 () Bool)

(assert start!53380)

(declare-fun b!580646 () Bool)

(declare-fun res!368471 () Bool)

(declare-fun e!333400 () Bool)

(assert (=> b!580646 (=> (not res!368471) (not e!333400))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36281 0))(
  ( (array!36282 (arr!17415 (Array (_ BitVec 32) (_ BitVec 64))) (size!17779 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36281)

(assert (=> b!580646 (= res!368471 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17415 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17415 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580647 () Bool)

(declare-fun res!368466 () Bool)

(declare-fun e!333401 () Bool)

(assert (=> b!580647 (=> (not res!368466) (not e!333401))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!580647 (= res!368466 (and (= (size!17779 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17779 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17779 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580648 () Bool)

(declare-fun res!368465 () Bool)

(assert (=> b!580648 (=> (not res!368465) (not e!333401))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580648 (= res!368465 (validKeyInArray!0 (select (arr!17415 a!2986) j!136)))))

(declare-fun b!580649 () Bool)

(declare-fun res!368470 () Bool)

(assert (=> b!580649 (=> (not res!368470) (not e!333400))))

(declare-datatypes ((List!11456 0))(
  ( (Nil!11453) (Cons!11452 (h!12497 (_ BitVec 64)) (t!17684 List!11456)) )
))
(declare-fun arrayNoDuplicates!0 (array!36281 (_ BitVec 32) List!11456) Bool)

(assert (=> b!580649 (= res!368470 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11453))))

(declare-fun b!580650 () Bool)

(assert (=> b!580650 (= e!333400 (and (bvslt x!910 #b01111111111111111111111111111110) (= (select (arr!17415 a!2986) index!984) (select (arr!17415 a!2986) j!136)) (= index!984 j!136) (bvslt mask!3053 #b00000000000000000000000000000000)))))

(declare-fun b!580652 () Bool)

(declare-fun res!368462 () Bool)

(assert (=> b!580652 (=> (not res!368462) (not e!333400))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36281 (_ BitVec 32)) Bool)

(assert (=> b!580652 (= res!368462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580653 () Bool)

(declare-fun res!368463 () Bool)

(assert (=> b!580653 (=> (not res!368463) (not e!333401))))

(assert (=> b!580653 (= res!368463 (validKeyInArray!0 k!1786))))

(declare-fun b!580654 () Bool)

(assert (=> b!580654 (= e!333401 e!333400)))

(declare-fun res!368469 () Bool)

(assert (=> b!580654 (=> (not res!368469) (not e!333400))))

(declare-datatypes ((SeekEntryResult!5855 0))(
  ( (MissingZero!5855 (index!25647 (_ BitVec 32))) (Found!5855 (index!25648 (_ BitVec 32))) (Intermediate!5855 (undefined!6667 Bool) (index!25649 (_ BitVec 32)) (x!54524 (_ BitVec 32))) (Undefined!5855) (MissingVacant!5855 (index!25650 (_ BitVec 32))) )
))
(declare-fun lt!264748 () SeekEntryResult!5855)

(assert (=> b!580654 (= res!368469 (or (= lt!264748 (MissingZero!5855 i!1108)) (= lt!264748 (MissingVacant!5855 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36281 (_ BitVec 32)) SeekEntryResult!5855)

(assert (=> b!580654 (= lt!264748 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!580655 () Bool)

(declare-fun res!368464 () Bool)

(assert (=> b!580655 (=> (not res!368464) (not e!333400))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36281 (_ BitVec 32)) SeekEntryResult!5855)

(assert (=> b!580655 (= res!368464 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17415 a!2986) j!136) a!2986 mask!3053) (Found!5855 j!136)))))

(declare-fun res!368467 () Bool)

(assert (=> start!53380 (=> (not res!368467) (not e!333401))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53380 (= res!368467 (validMask!0 mask!3053))))

(assert (=> start!53380 e!333401))

(assert (=> start!53380 true))

(declare-fun array_inv!13211 (array!36281) Bool)

(assert (=> start!53380 (array_inv!13211 a!2986)))

(declare-fun b!580651 () Bool)

(declare-fun res!368468 () Bool)

(assert (=> b!580651 (=> (not res!368468) (not e!333401))))

(declare-fun arrayContainsKey!0 (array!36281 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580651 (= res!368468 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53380 res!368467) b!580647))

(assert (= (and b!580647 res!368466) b!580648))

(assert (= (and b!580648 res!368465) b!580653))

(assert (= (and b!580653 res!368463) b!580651))

(assert (= (and b!580651 res!368468) b!580654))

(assert (= (and b!580654 res!368469) b!580652))

(assert (= (and b!580652 res!368462) b!580649))

(assert (= (and b!580649 res!368470) b!580646))

(assert (= (and b!580646 res!368471) b!580655))

(assert (= (and b!580655 res!368464) b!580650))

(declare-fun m!559219 () Bool)

(assert (=> b!580655 m!559219))

(assert (=> b!580655 m!559219))

(declare-fun m!559221 () Bool)

(assert (=> b!580655 m!559221))

(declare-fun m!559223 () Bool)

(assert (=> b!580652 m!559223))

(declare-fun m!559225 () Bool)

(assert (=> b!580650 m!559225))

(assert (=> b!580650 m!559219))

(declare-fun m!559227 () Bool)

(assert (=> b!580646 m!559227))

(declare-fun m!559229 () Bool)

(assert (=> b!580646 m!559229))

(declare-fun m!559231 () Bool)

(assert (=> b!580646 m!559231))

(declare-fun m!559233 () Bool)

(assert (=> b!580651 m!559233))

(declare-fun m!559235 () Bool)

(assert (=> start!53380 m!559235))

(declare-fun m!559237 () Bool)

(assert (=> start!53380 m!559237))

(declare-fun m!559239 () Bool)

(assert (=> b!580653 m!559239))

(declare-fun m!559241 () Bool)

(assert (=> b!580649 m!559241))

(declare-fun m!559243 () Bool)

(assert (=> b!580654 m!559243))

(assert (=> b!580648 m!559219))

(assert (=> b!580648 m!559219))

(declare-fun m!559245 () Bool)

(assert (=> b!580648 m!559245))

(push 1)

