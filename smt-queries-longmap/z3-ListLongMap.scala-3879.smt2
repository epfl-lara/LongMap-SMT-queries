; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53268 () Bool)

(assert start!53268)

(declare-fun b!579077 () Bool)

(declare-fun e!332794 () Bool)

(assert (=> b!579077 (= e!332794 false)))

(declare-datatypes ((SeekEntryResult!5803 0))(
  ( (MissingZero!5803 (index!25439 (_ BitVec 32))) (Found!5803 (index!25440 (_ BitVec 32))) (Intermediate!5803 (undefined!6615 Bool) (index!25441 (_ BitVec 32)) (x!54339 (_ BitVec 32))) (Undefined!5803) (MissingVacant!5803 (index!25442 (_ BitVec 32))) )
))
(declare-fun lt!264229 () SeekEntryResult!5803)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36183 0))(
  ( (array!36184 (arr!17366 (Array (_ BitVec 32) (_ BitVec 64))) (size!17731 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36183)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36183 (_ BitVec 32)) SeekEntryResult!5803)

(assert (=> b!579077 (= lt!264229 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17366 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579078 () Bool)

(declare-fun res!367040 () Bool)

(assert (=> b!579078 (=> (not res!367040) (not e!332794))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!579078 (= res!367040 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17366 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17366 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579079 () Bool)

(declare-fun res!367041 () Bool)

(declare-fun e!332796 () Bool)

(assert (=> b!579079 (=> (not res!367041) (not e!332796))))

(declare-fun arrayContainsKey!0 (array!36183 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579079 (= res!367041 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579080 () Bool)

(declare-fun res!367043 () Bool)

(assert (=> b!579080 (=> (not res!367043) (not e!332794))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36183 (_ BitVec 32)) Bool)

(assert (=> b!579080 (= res!367043 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579081 () Bool)

(declare-fun res!367036 () Bool)

(assert (=> b!579081 (=> (not res!367036) (not e!332796))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579081 (= res!367036 (validKeyInArray!0 k0!1786))))

(declare-fun b!579082 () Bool)

(declare-fun res!367039 () Bool)

(assert (=> b!579082 (=> (not res!367039) (not e!332796))))

(assert (=> b!579082 (= res!367039 (and (= (size!17731 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17731 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17731 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579083 () Bool)

(declare-fun res!367037 () Bool)

(assert (=> b!579083 (=> (not res!367037) (not e!332794))))

(declare-datatypes ((List!11446 0))(
  ( (Nil!11443) (Cons!11442 (h!12487 (_ BitVec 64)) (t!17665 List!11446)) )
))
(declare-fun arrayNoDuplicates!0 (array!36183 (_ BitVec 32) List!11446) Bool)

(assert (=> b!579083 (= res!367037 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11443))))

(declare-fun b!579084 () Bool)

(assert (=> b!579084 (= e!332796 e!332794)))

(declare-fun res!367042 () Bool)

(assert (=> b!579084 (=> (not res!367042) (not e!332794))))

(declare-fun lt!264228 () SeekEntryResult!5803)

(assert (=> b!579084 (= res!367042 (or (= lt!264228 (MissingZero!5803 i!1108)) (= lt!264228 (MissingVacant!5803 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36183 (_ BitVec 32)) SeekEntryResult!5803)

(assert (=> b!579084 (= lt!264228 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!579085 () Bool)

(declare-fun res!367035 () Bool)

(assert (=> b!579085 (=> (not res!367035) (not e!332796))))

(assert (=> b!579085 (= res!367035 (validKeyInArray!0 (select (arr!17366 a!2986) j!136)))))

(declare-fun res!367038 () Bool)

(assert (=> start!53268 (=> (not res!367038) (not e!332796))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53268 (= res!367038 (validMask!0 mask!3053))))

(assert (=> start!53268 e!332796))

(assert (=> start!53268 true))

(declare-fun array_inv!13249 (array!36183) Bool)

(assert (=> start!53268 (array_inv!13249 a!2986)))

(assert (= (and start!53268 res!367038) b!579082))

(assert (= (and b!579082 res!367039) b!579085))

(assert (= (and b!579085 res!367035) b!579081))

(assert (= (and b!579081 res!367036) b!579079))

(assert (= (and b!579079 res!367041) b!579084))

(assert (= (and b!579084 res!367042) b!579080))

(assert (= (and b!579080 res!367043) b!579083))

(assert (= (and b!579083 res!367037) b!579078))

(assert (= (and b!579078 res!367040) b!579077))

(declare-fun m!557185 () Bool)

(assert (=> start!53268 m!557185))

(declare-fun m!557187 () Bool)

(assert (=> start!53268 m!557187))

(declare-fun m!557189 () Bool)

(assert (=> b!579081 m!557189))

(declare-fun m!557191 () Bool)

(assert (=> b!579079 m!557191))

(declare-fun m!557193 () Bool)

(assert (=> b!579077 m!557193))

(assert (=> b!579077 m!557193))

(declare-fun m!557195 () Bool)

(assert (=> b!579077 m!557195))

(declare-fun m!557197 () Bool)

(assert (=> b!579083 m!557197))

(assert (=> b!579085 m!557193))

(assert (=> b!579085 m!557193))

(declare-fun m!557199 () Bool)

(assert (=> b!579085 m!557199))

(declare-fun m!557201 () Bool)

(assert (=> b!579080 m!557201))

(declare-fun m!557203 () Bool)

(assert (=> b!579084 m!557203))

(declare-fun m!557205 () Bool)

(assert (=> b!579078 m!557205))

(declare-fun m!557207 () Bool)

(assert (=> b!579078 m!557207))

(declare-fun m!557209 () Bool)

(assert (=> b!579078 m!557209))

(check-sat (not b!579080) (not b!579081) (not b!579079) (not start!53268) (not b!579084) (not b!579083) (not b!579085) (not b!579077))
(check-sat)
