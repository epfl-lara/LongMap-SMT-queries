; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53278 () Bool)

(assert start!53278)

(declare-fun b!579267 () Bool)

(declare-fun e!332942 () Bool)

(declare-fun e!332941 () Bool)

(assert (=> b!579267 (= e!332942 e!332941)))

(declare-fun res!367083 () Bool)

(assert (=> b!579267 (=> (not res!367083) (not e!332941))))

(declare-datatypes ((SeekEntryResult!5804 0))(
  ( (MissingZero!5804 (index!25443 (_ BitVec 32))) (Found!5804 (index!25444 (_ BitVec 32))) (Intermediate!5804 (undefined!6616 Bool) (index!25445 (_ BitVec 32)) (x!54337 (_ BitVec 32))) (Undefined!5804) (MissingVacant!5804 (index!25446 (_ BitVec 32))) )
))
(declare-fun lt!264445 () SeekEntryResult!5804)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579267 (= res!367083 (or (= lt!264445 (MissingZero!5804 i!1108)) (= lt!264445 (MissingVacant!5804 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36179 0))(
  ( (array!36180 (arr!17364 (Array (_ BitVec 32) (_ BitVec 64))) (size!17728 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36179)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36179 (_ BitVec 32)) SeekEntryResult!5804)

(assert (=> b!579267 (= lt!264445 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!579268 () Bool)

(declare-fun res!367088 () Bool)

(assert (=> b!579268 (=> (not res!367088) (not e!332942))))

(declare-fun arrayContainsKey!0 (array!36179 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579268 (= res!367088 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579269 () Bool)

(declare-fun res!367084 () Bool)

(assert (=> b!579269 (=> (not res!367084) (not e!332942))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579269 (= res!367084 (validKeyInArray!0 k!1786))))

(declare-fun res!367091 () Bool)

(assert (=> start!53278 (=> (not res!367091) (not e!332942))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53278 (= res!367091 (validMask!0 mask!3053))))

(assert (=> start!53278 e!332942))

(assert (=> start!53278 true))

(declare-fun array_inv!13160 (array!36179) Bool)

(assert (=> start!53278 (array_inv!13160 a!2986)))

(declare-fun b!579270 () Bool)

(declare-fun res!367086 () Bool)

(assert (=> b!579270 (=> (not res!367086) (not e!332941))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!579270 (= res!367086 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17364 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17364 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579271 () Bool)

(declare-fun res!367085 () Bool)

(assert (=> b!579271 (=> (not res!367085) (not e!332942))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!579271 (= res!367085 (and (= (size!17728 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17728 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17728 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579272 () Bool)

(assert (=> b!579272 (= e!332941 false)))

(declare-fun lt!264444 () SeekEntryResult!5804)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36179 (_ BitVec 32)) SeekEntryResult!5804)

(assert (=> b!579272 (= lt!264444 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17364 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579273 () Bool)

(declare-fun res!367087 () Bool)

(assert (=> b!579273 (=> (not res!367087) (not e!332942))))

(assert (=> b!579273 (= res!367087 (validKeyInArray!0 (select (arr!17364 a!2986) j!136)))))

(declare-fun b!579274 () Bool)

(declare-fun res!367090 () Bool)

(assert (=> b!579274 (=> (not res!367090) (not e!332941))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36179 (_ BitVec 32)) Bool)

(assert (=> b!579274 (= res!367090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579275 () Bool)

(declare-fun res!367089 () Bool)

(assert (=> b!579275 (=> (not res!367089) (not e!332941))))

(declare-datatypes ((List!11405 0))(
  ( (Nil!11402) (Cons!11401 (h!12446 (_ BitVec 64)) (t!17633 List!11405)) )
))
(declare-fun arrayNoDuplicates!0 (array!36179 (_ BitVec 32) List!11405) Bool)

(assert (=> b!579275 (= res!367089 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11402))))

(assert (= (and start!53278 res!367091) b!579271))

(assert (= (and b!579271 res!367085) b!579273))

(assert (= (and b!579273 res!367087) b!579269))

(assert (= (and b!579269 res!367084) b!579268))

(assert (= (and b!579268 res!367088) b!579267))

(assert (= (and b!579267 res!367083) b!579274))

(assert (= (and b!579274 res!367090) b!579275))

(assert (= (and b!579275 res!367089) b!579270))

(assert (= (and b!579270 res!367086) b!579272))

(declare-fun m!557893 () Bool)

(assert (=> b!579272 m!557893))

(assert (=> b!579272 m!557893))

(declare-fun m!557895 () Bool)

(assert (=> b!579272 m!557895))

(declare-fun m!557897 () Bool)

(assert (=> start!53278 m!557897))

(declare-fun m!557899 () Bool)

(assert (=> start!53278 m!557899))

(declare-fun m!557901 () Bool)

(assert (=> b!579269 m!557901))

(declare-fun m!557903 () Bool)

(assert (=> b!579268 m!557903))

(declare-fun m!557905 () Bool)

(assert (=> b!579274 m!557905))

(declare-fun m!557907 () Bool)

(assert (=> b!579267 m!557907))

(declare-fun m!557909 () Bool)

(assert (=> b!579275 m!557909))

(declare-fun m!557911 () Bool)

(assert (=> b!579270 m!557911))

(declare-fun m!557913 () Bool)

(assert (=> b!579270 m!557913))

(declare-fun m!557915 () Bool)

(assert (=> b!579270 m!557915))

(assert (=> b!579273 m!557893))

(assert (=> b!579273 m!557893))

(declare-fun m!557917 () Bool)

(assert (=> b!579273 m!557917))

(push 1)

