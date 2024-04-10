; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53282 () Bool)

(assert start!53282)

(declare-fun b!579321 () Bool)

(declare-fun res!367142 () Bool)

(declare-fun e!332961 () Bool)

(assert (=> b!579321 (=> (not res!367142) (not e!332961))))

(declare-datatypes ((array!36183 0))(
  ( (array!36184 (arr!17366 (Array (_ BitVec 32) (_ BitVec 64))) (size!17730 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36183)

(declare-datatypes ((List!11407 0))(
  ( (Nil!11404) (Cons!11403 (h!12448 (_ BitVec 64)) (t!17635 List!11407)) )
))
(declare-fun arrayNoDuplicates!0 (array!36183 (_ BitVec 32) List!11407) Bool)

(assert (=> b!579321 (= res!367142 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11404))))

(declare-fun b!579322 () Bool)

(declare-fun e!332959 () Bool)

(assert (=> b!579322 (= e!332959 e!332961)))

(declare-fun res!367141 () Bool)

(assert (=> b!579322 (=> (not res!367141) (not e!332961))))

(declare-datatypes ((SeekEntryResult!5806 0))(
  ( (MissingZero!5806 (index!25451 (_ BitVec 32))) (Found!5806 (index!25452 (_ BitVec 32))) (Intermediate!5806 (undefined!6618 Bool) (index!25453 (_ BitVec 32)) (x!54339 (_ BitVec 32))) (Undefined!5806) (MissingVacant!5806 (index!25454 (_ BitVec 32))) )
))
(declare-fun lt!264456 () SeekEntryResult!5806)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579322 (= res!367141 (or (= lt!264456 (MissingZero!5806 i!1108)) (= lt!264456 (MissingVacant!5806 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36183 (_ BitVec 32)) SeekEntryResult!5806)

(assert (=> b!579322 (= lt!264456 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!579323 () Bool)

(declare-fun res!367139 () Bool)

(assert (=> b!579323 (=> (not res!367139) (not e!332961))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36183 (_ BitVec 32)) Bool)

(assert (=> b!579323 (= res!367139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579324 () Bool)

(declare-fun res!367140 () Bool)

(assert (=> b!579324 (=> (not res!367140) (not e!332959))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579324 (= res!367140 (validKeyInArray!0 k!1786))))

(declare-fun b!579325 () Bool)

(declare-fun res!367137 () Bool)

(assert (=> b!579325 (=> (not res!367137) (not e!332959))))

(declare-fun arrayContainsKey!0 (array!36183 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579325 (= res!367137 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579326 () Bool)

(declare-fun res!367145 () Bool)

(assert (=> b!579326 (=> (not res!367145) (not e!332959))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!579326 (= res!367145 (and (= (size!17730 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17730 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17730 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579327 () Bool)

(declare-fun res!367138 () Bool)

(assert (=> b!579327 (=> (not res!367138) (not e!332959))))

(assert (=> b!579327 (= res!367138 (validKeyInArray!0 (select (arr!17366 a!2986) j!136)))))

(declare-fun b!579328 () Bool)

(declare-fun res!367144 () Bool)

(assert (=> b!579328 (=> (not res!367144) (not e!332961))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!579328 (= res!367144 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17366 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17366 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!367143 () Bool)

(assert (=> start!53282 (=> (not res!367143) (not e!332959))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53282 (= res!367143 (validMask!0 mask!3053))))

(assert (=> start!53282 e!332959))

(assert (=> start!53282 true))

(declare-fun array_inv!13162 (array!36183) Bool)

(assert (=> start!53282 (array_inv!13162 a!2986)))

(declare-fun b!579329 () Bool)

(assert (=> b!579329 (= e!332961 false)))

(declare-fun lt!264457 () SeekEntryResult!5806)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36183 (_ BitVec 32)) SeekEntryResult!5806)

(assert (=> b!579329 (= lt!264457 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17366 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53282 res!367143) b!579326))

(assert (= (and b!579326 res!367145) b!579327))

(assert (= (and b!579327 res!367138) b!579324))

(assert (= (and b!579324 res!367140) b!579325))

(assert (= (and b!579325 res!367137) b!579322))

(assert (= (and b!579322 res!367141) b!579323))

(assert (= (and b!579323 res!367139) b!579321))

(assert (= (and b!579321 res!367142) b!579328))

(assert (= (and b!579328 res!367144) b!579329))

(declare-fun m!557945 () Bool)

(assert (=> start!53282 m!557945))

(declare-fun m!557947 () Bool)

(assert (=> start!53282 m!557947))

(declare-fun m!557949 () Bool)

(assert (=> b!579328 m!557949))

(declare-fun m!557951 () Bool)

(assert (=> b!579328 m!557951))

(declare-fun m!557953 () Bool)

(assert (=> b!579328 m!557953))

(declare-fun m!557955 () Bool)

(assert (=> b!579327 m!557955))

(assert (=> b!579327 m!557955))

(declare-fun m!557957 () Bool)

(assert (=> b!579327 m!557957))

(declare-fun m!557959 () Bool)

(assert (=> b!579321 m!557959))

(declare-fun m!557961 () Bool)

(assert (=> b!579324 m!557961))

(assert (=> b!579329 m!557955))

(assert (=> b!579329 m!557955))

(declare-fun m!557963 () Bool)

(assert (=> b!579329 m!557963))

(declare-fun m!557965 () Bool)

(assert (=> b!579325 m!557965))

(declare-fun m!557967 () Bool)

(assert (=> b!579323 m!557967))

(declare-fun m!557969 () Bool)

(assert (=> b!579322 m!557969))

(push 1)

