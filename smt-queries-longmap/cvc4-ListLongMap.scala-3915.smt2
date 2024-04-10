; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53504 () Bool)

(assert start!53504)

(declare-fun b!582354 () Bool)

(declare-fun e!333958 () Bool)

(declare-fun e!333959 () Bool)

(assert (=> b!582354 (= e!333958 e!333959)))

(declare-fun res!370173 () Bool)

(assert (=> b!582354 (=> (not res!370173) (not e!333959))))

(declare-datatypes ((SeekEntryResult!5917 0))(
  ( (MissingZero!5917 (index!25895 (_ BitVec 32))) (Found!5917 (index!25896 (_ BitVec 32))) (Intermediate!5917 (undefined!6729 Bool) (index!25897 (_ BitVec 32)) (x!54746 (_ BitVec 32))) (Undefined!5917) (MissingVacant!5917 (index!25898 (_ BitVec 32))) )
))
(declare-fun lt!265095 () SeekEntryResult!5917)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582354 (= res!370173 (or (= lt!265095 (MissingZero!5917 i!1108)) (= lt!265095 (MissingVacant!5917 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36405 0))(
  ( (array!36406 (arr!17477 (Array (_ BitVec 32) (_ BitVec 64))) (size!17841 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36405)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36405 (_ BitVec 32)) SeekEntryResult!5917)

(assert (=> b!582354 (= lt!265095 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!582355 () Bool)

(declare-fun res!370172 () Bool)

(assert (=> b!582355 (=> (not res!370172) (not e!333958))))

(declare-fun arrayContainsKey!0 (array!36405 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582355 (= res!370172 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582356 () Bool)

(declare-fun res!370177 () Bool)

(assert (=> b!582356 (=> (not res!370177) (not e!333959))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!582356 (= res!370177 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17477 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17477 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!370178 () Bool)

(assert (=> start!53504 (=> (not res!370178) (not e!333958))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53504 (= res!370178 (validMask!0 mask!3053))))

(assert (=> start!53504 e!333958))

(assert (=> start!53504 true))

(declare-fun array_inv!13273 (array!36405) Bool)

(assert (=> start!53504 (array_inv!13273 a!2986)))

(declare-fun b!582357 () Bool)

(declare-fun res!370175 () Bool)

(assert (=> b!582357 (=> (not res!370175) (not e!333958))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!582357 (= res!370175 (and (= (size!17841 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17841 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17841 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582358 () Bool)

(declare-fun res!370170 () Bool)

(assert (=> b!582358 (=> (not res!370170) (not e!333958))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582358 (= res!370170 (validKeyInArray!0 k!1786))))

(declare-fun b!582359 () Bool)

(declare-fun res!370174 () Bool)

(assert (=> b!582359 (=> (not res!370174) (not e!333958))))

(assert (=> b!582359 (= res!370174 (validKeyInArray!0 (select (arr!17477 a!2986) j!136)))))

(declare-fun b!582360 () Bool)

(assert (=> b!582360 (= e!333959 false)))

(declare-fun lt!265096 () SeekEntryResult!5917)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36405 (_ BitVec 32)) SeekEntryResult!5917)

(assert (=> b!582360 (= lt!265096 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17477 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582361 () Bool)

(declare-fun res!370171 () Bool)

(assert (=> b!582361 (=> (not res!370171) (not e!333959))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36405 (_ BitVec 32)) Bool)

(assert (=> b!582361 (= res!370171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582362 () Bool)

(declare-fun res!370176 () Bool)

(assert (=> b!582362 (=> (not res!370176) (not e!333959))))

(declare-datatypes ((List!11518 0))(
  ( (Nil!11515) (Cons!11514 (h!12559 (_ BitVec 64)) (t!17746 List!11518)) )
))
(declare-fun arrayNoDuplicates!0 (array!36405 (_ BitVec 32) List!11518) Bool)

(assert (=> b!582362 (= res!370176 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11515))))

(assert (= (and start!53504 res!370178) b!582357))

(assert (= (and b!582357 res!370175) b!582359))

(assert (= (and b!582359 res!370174) b!582358))

(assert (= (and b!582358 res!370170) b!582355))

(assert (= (and b!582355 res!370172) b!582354))

(assert (= (and b!582354 res!370173) b!582361))

(assert (= (and b!582361 res!370171) b!582362))

(assert (= (and b!582362 res!370176) b!582356))

(assert (= (and b!582356 res!370177) b!582360))

(declare-fun m!560861 () Bool)

(assert (=> b!582358 m!560861))

(declare-fun m!560863 () Bool)

(assert (=> b!582360 m!560863))

(assert (=> b!582360 m!560863))

(declare-fun m!560865 () Bool)

(assert (=> b!582360 m!560865))

(declare-fun m!560867 () Bool)

(assert (=> b!582361 m!560867))

(declare-fun m!560869 () Bool)

(assert (=> b!582356 m!560869))

(declare-fun m!560871 () Bool)

(assert (=> b!582356 m!560871))

(declare-fun m!560873 () Bool)

(assert (=> b!582356 m!560873))

(assert (=> b!582359 m!560863))

(assert (=> b!582359 m!560863))

(declare-fun m!560875 () Bool)

(assert (=> b!582359 m!560875))

(declare-fun m!560877 () Bool)

(assert (=> b!582362 m!560877))

(declare-fun m!560879 () Bool)

(assert (=> b!582354 m!560879))

(declare-fun m!560881 () Bool)

(assert (=> start!53504 m!560881))

(declare-fun m!560883 () Bool)

(assert (=> start!53504 m!560883))

(declare-fun m!560885 () Bool)

(assert (=> b!582355 m!560885))

(push 1)

(assert (not start!53504))

(assert (not b!582358))

(assert (not b!582362))

(assert (not b!582354))

(assert (not b!582360))

(assert (not b!582359))

(assert (not b!582361))

(assert (not b!582355))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

