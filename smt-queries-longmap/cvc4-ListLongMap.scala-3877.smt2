; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53276 () Bool)

(assert start!53276)

(declare-fun b!579240 () Bool)

(declare-fun e!332934 () Bool)

(declare-fun e!332932 () Bool)

(assert (=> b!579240 (= e!332934 e!332932)))

(declare-fun res!367056 () Bool)

(assert (=> b!579240 (=> (not res!367056) (not e!332932))))

(declare-datatypes ((SeekEntryResult!5803 0))(
  ( (MissingZero!5803 (index!25439 (_ BitVec 32))) (Found!5803 (index!25440 (_ BitVec 32))) (Intermediate!5803 (undefined!6615 Bool) (index!25441 (_ BitVec 32)) (x!54328 (_ BitVec 32))) (Undefined!5803) (MissingVacant!5803 (index!25442 (_ BitVec 32))) )
))
(declare-fun lt!264438 () SeekEntryResult!5803)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579240 (= res!367056 (or (= lt!264438 (MissingZero!5803 i!1108)) (= lt!264438 (MissingVacant!5803 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36177 0))(
  ( (array!36178 (arr!17363 (Array (_ BitVec 32) (_ BitVec 64))) (size!17727 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36177)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36177 (_ BitVec 32)) SeekEntryResult!5803)

(assert (=> b!579240 (= lt!264438 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!367064 () Bool)

(assert (=> start!53276 (=> (not res!367064) (not e!332934))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53276 (= res!367064 (validMask!0 mask!3053))))

(assert (=> start!53276 e!332934))

(assert (=> start!53276 true))

(declare-fun array_inv!13159 (array!36177) Bool)

(assert (=> start!53276 (array_inv!13159 a!2986)))

(declare-fun b!579241 () Bool)

(declare-fun res!367058 () Bool)

(assert (=> b!579241 (=> (not res!367058) (not e!332934))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579241 (= res!367058 (validKeyInArray!0 (select (arr!17363 a!2986) j!136)))))

(declare-fun b!579242 () Bool)

(assert (=> b!579242 (= e!332932 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!264439 () SeekEntryResult!5803)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36177 (_ BitVec 32)) SeekEntryResult!5803)

(assert (=> b!579242 (= lt!264439 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17363 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579243 () Bool)

(declare-fun res!367059 () Bool)

(assert (=> b!579243 (=> (not res!367059) (not e!332932))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36177 (_ BitVec 32)) Bool)

(assert (=> b!579243 (= res!367059 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579244 () Bool)

(declare-fun res!367060 () Bool)

(assert (=> b!579244 (=> (not res!367060) (not e!332932))))

(declare-datatypes ((List!11404 0))(
  ( (Nil!11401) (Cons!11400 (h!12445 (_ BitVec 64)) (t!17632 List!11404)) )
))
(declare-fun arrayNoDuplicates!0 (array!36177 (_ BitVec 32) List!11404) Bool)

(assert (=> b!579244 (= res!367060 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11401))))

(declare-fun b!579245 () Bool)

(declare-fun res!367063 () Bool)

(assert (=> b!579245 (=> (not res!367063) (not e!332932))))

(assert (=> b!579245 (= res!367063 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17363 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17363 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579246 () Bool)

(declare-fun res!367061 () Bool)

(assert (=> b!579246 (=> (not res!367061) (not e!332934))))

(assert (=> b!579246 (= res!367061 (and (= (size!17727 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17727 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17727 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579247 () Bool)

(declare-fun res!367062 () Bool)

(assert (=> b!579247 (=> (not res!367062) (not e!332934))))

(declare-fun arrayContainsKey!0 (array!36177 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579247 (= res!367062 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579248 () Bool)

(declare-fun res!367057 () Bool)

(assert (=> b!579248 (=> (not res!367057) (not e!332934))))

(assert (=> b!579248 (= res!367057 (validKeyInArray!0 k!1786))))

(assert (= (and start!53276 res!367064) b!579246))

(assert (= (and b!579246 res!367061) b!579241))

(assert (= (and b!579241 res!367058) b!579248))

(assert (= (and b!579248 res!367057) b!579247))

(assert (= (and b!579247 res!367062) b!579240))

(assert (= (and b!579240 res!367056) b!579243))

(assert (= (and b!579243 res!367059) b!579244))

(assert (= (and b!579244 res!367060) b!579245))

(assert (= (and b!579245 res!367063) b!579242))

(declare-fun m!557867 () Bool)

(assert (=> b!579242 m!557867))

(assert (=> b!579242 m!557867))

(declare-fun m!557869 () Bool)

(assert (=> b!579242 m!557869))

(assert (=> b!579241 m!557867))

(assert (=> b!579241 m!557867))

(declare-fun m!557871 () Bool)

(assert (=> b!579241 m!557871))

(declare-fun m!557873 () Bool)

(assert (=> b!579240 m!557873))

(declare-fun m!557875 () Bool)

(assert (=> b!579247 m!557875))

(declare-fun m!557877 () Bool)

(assert (=> start!53276 m!557877))

(declare-fun m!557879 () Bool)

(assert (=> start!53276 m!557879))

(declare-fun m!557881 () Bool)

(assert (=> b!579248 m!557881))

(declare-fun m!557883 () Bool)

(assert (=> b!579243 m!557883))

(declare-fun m!557885 () Bool)

(assert (=> b!579245 m!557885))

(declare-fun m!557887 () Bool)

(assert (=> b!579245 m!557887))

(declare-fun m!557889 () Bool)

(assert (=> b!579245 m!557889))

(declare-fun m!557891 () Bool)

(assert (=> b!579244 m!557891))

(push 1)

(assert (not b!579243))

(assert (not b!579242))

(assert (not b!579247))

(assert (not b!579240))

(assert (not b!579244))

(assert (not b!579248))

(assert (not start!53276))

(assert (not b!579241))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

