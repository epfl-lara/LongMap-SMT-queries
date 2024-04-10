; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53588 () Bool)

(assert start!53588)

(declare-fun b!583497 () Bool)

(declare-fun res!371321 () Bool)

(declare-fun e!334336 () Bool)

(assert (=> b!583497 (=> (not res!371321) (not e!334336))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36489 0))(
  ( (array!36490 (arr!17519 (Array (_ BitVec 32) (_ BitVec 64))) (size!17883 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36489)

(assert (=> b!583497 (= res!371321 (and (= (size!17883 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17883 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17883 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583498 () Bool)

(declare-fun res!371316 () Bool)

(declare-fun e!334338 () Bool)

(assert (=> b!583498 (=> (not res!371316) (not e!334338))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!583498 (= res!371316 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17519 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17519 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!371320 () Bool)

(assert (=> start!53588 (=> (not res!371320) (not e!334336))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53588 (= res!371320 (validMask!0 mask!3053))))

(assert (=> start!53588 e!334336))

(assert (=> start!53588 true))

(declare-fun array_inv!13315 (array!36489) Bool)

(assert (=> start!53588 (array_inv!13315 a!2986)))

(declare-fun b!583499 () Bool)

(declare-fun res!371314 () Bool)

(assert (=> b!583499 (=> (not res!371314) (not e!334336))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583499 (= res!371314 (validKeyInArray!0 k!1786))))

(declare-fun b!583500 () Bool)

(assert (=> b!583500 (= e!334336 e!334338)))

(declare-fun res!371315 () Bool)

(assert (=> b!583500 (=> (not res!371315) (not e!334338))))

(declare-datatypes ((SeekEntryResult!5959 0))(
  ( (MissingZero!5959 (index!26063 (_ BitVec 32))) (Found!5959 (index!26064 (_ BitVec 32))) (Intermediate!5959 (undefined!6771 Bool) (index!26065 (_ BitVec 32)) (x!54900 (_ BitVec 32))) (Undefined!5959) (MissingVacant!5959 (index!26066 (_ BitVec 32))) )
))
(declare-fun lt!265338 () SeekEntryResult!5959)

(assert (=> b!583500 (= res!371315 (or (= lt!265338 (MissingZero!5959 i!1108)) (= lt!265338 (MissingVacant!5959 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36489 (_ BitVec 32)) SeekEntryResult!5959)

(assert (=> b!583500 (= lt!265338 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!583501 () Bool)

(declare-fun res!371313 () Bool)

(assert (=> b!583501 (=> (not res!371313) (not e!334336))))

(declare-fun arrayContainsKey!0 (array!36489 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583501 (= res!371313 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583502 () Bool)

(declare-fun res!371319 () Bool)

(assert (=> b!583502 (=> (not res!371319) (not e!334338))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36489 (_ BitVec 32)) Bool)

(assert (=> b!583502 (= res!371319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583503 () Bool)

(declare-fun res!371318 () Bool)

(assert (=> b!583503 (=> (not res!371318) (not e!334338))))

(declare-datatypes ((List!11560 0))(
  ( (Nil!11557) (Cons!11556 (h!12601 (_ BitVec 64)) (t!17788 List!11560)) )
))
(declare-fun arrayNoDuplicates!0 (array!36489 (_ BitVec 32) List!11560) Bool)

(assert (=> b!583503 (= res!371318 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11557))))

(declare-fun b!583504 () Bool)

(declare-fun res!371317 () Bool)

(assert (=> b!583504 (=> (not res!371317) (not e!334336))))

(assert (=> b!583504 (= res!371317 (validKeyInArray!0 (select (arr!17519 a!2986) j!136)))))

(declare-fun b!583505 () Bool)

(assert (=> b!583505 (= e!334338 false)))

(declare-fun lt!265339 () SeekEntryResult!5959)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36489 (_ BitVec 32)) SeekEntryResult!5959)

(assert (=> b!583505 (= lt!265339 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17519 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53588 res!371320) b!583497))

(assert (= (and b!583497 res!371321) b!583504))

(assert (= (and b!583504 res!371317) b!583499))

(assert (= (and b!583499 res!371314) b!583501))

(assert (= (and b!583501 res!371313) b!583500))

(assert (= (and b!583500 res!371315) b!583502))

(assert (= (and b!583502 res!371319) b!583503))

(assert (= (and b!583503 res!371318) b!583498))

(assert (= (and b!583498 res!371316) b!583505))

(declare-fun m!561959 () Bool)

(assert (=> start!53588 m!561959))

(declare-fun m!561961 () Bool)

(assert (=> start!53588 m!561961))

(declare-fun m!561963 () Bool)

(assert (=> b!583502 m!561963))

(declare-fun m!561965 () Bool)

(assert (=> b!583504 m!561965))

(assert (=> b!583504 m!561965))

(declare-fun m!561967 () Bool)

(assert (=> b!583504 m!561967))

(declare-fun m!561969 () Bool)

(assert (=> b!583500 m!561969))

(assert (=> b!583505 m!561965))

(assert (=> b!583505 m!561965))

(declare-fun m!561971 () Bool)

(assert (=> b!583505 m!561971))

(declare-fun m!561973 () Bool)

(assert (=> b!583501 m!561973))

(declare-fun m!561975 () Bool)

(assert (=> b!583499 m!561975))

(declare-fun m!561977 () Bool)

(assert (=> b!583498 m!561977))

(declare-fun m!561979 () Bool)

(assert (=> b!583498 m!561979))

(declare-fun m!561981 () Bool)

(assert (=> b!583498 m!561981))

(declare-fun m!561983 () Bool)

(assert (=> b!583503 m!561983))

(push 1)

(assert (not b!583499))

(assert (not b!583501))

(assert (not b!583505))

(assert (not b!583503))

(assert (not b!583502))

(assert (not start!53588))

(assert (not b!583504))

(assert (not b!583500))

(check-sat)

(pop 1)

