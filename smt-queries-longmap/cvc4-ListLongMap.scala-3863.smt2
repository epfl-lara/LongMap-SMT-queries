; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53192 () Bool)

(assert start!53192)

(declare-fun b!578207 () Bool)

(declare-fun e!332554 () Bool)

(declare-fun e!332556 () Bool)

(assert (=> b!578207 (= e!332554 e!332556)))

(declare-fun res!366024 () Bool)

(assert (=> b!578207 (=> (not res!366024) (not e!332556))))

(declare-datatypes ((SeekEntryResult!5761 0))(
  ( (MissingZero!5761 (index!25271 (_ BitVec 32))) (Found!5761 (index!25272 (_ BitVec 32))) (Intermediate!5761 (undefined!6573 Bool) (index!25273 (_ BitVec 32)) (x!54174 (_ BitVec 32))) (Undefined!5761) (MissingVacant!5761 (index!25274 (_ BitVec 32))) )
))
(declare-fun lt!264196 () SeekEntryResult!5761)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578207 (= res!366024 (or (= lt!264196 (MissingZero!5761 i!1108)) (= lt!264196 (MissingVacant!5761 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36093 0))(
  ( (array!36094 (arr!17321 (Array (_ BitVec 32) (_ BitVec 64))) (size!17685 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36093)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36093 (_ BitVec 32)) SeekEntryResult!5761)

(assert (=> b!578207 (= lt!264196 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!578208 () Bool)

(declare-fun res!366028 () Bool)

(assert (=> b!578208 (=> (not res!366028) (not e!332554))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578208 (= res!366028 (validKeyInArray!0 k!1786))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun b!578209 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!578209 (= e!332556 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17321 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17321 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3053 #b00000000000000000000000000000000)))))

(declare-fun b!578210 () Bool)

(declare-fun res!366025 () Bool)

(assert (=> b!578210 (=> (not res!366025) (not e!332554))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!578210 (= res!366025 (validKeyInArray!0 (select (arr!17321 a!2986) j!136)))))

(declare-fun b!578211 () Bool)

(declare-fun res!366022 () Bool)

(assert (=> b!578211 (=> (not res!366022) (not e!332554))))

(assert (=> b!578211 (= res!366022 (and (= (size!17685 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17685 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17685 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578212 () Bool)

(declare-fun res!366026 () Bool)

(assert (=> b!578212 (=> (not res!366026) (not e!332554))))

(declare-fun arrayContainsKey!0 (array!36093 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578212 (= res!366026 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578213 () Bool)

(declare-fun res!366023 () Bool)

(assert (=> b!578213 (=> (not res!366023) (not e!332556))))

(declare-datatypes ((List!11362 0))(
  ( (Nil!11359) (Cons!11358 (h!12403 (_ BitVec 64)) (t!17590 List!11362)) )
))
(declare-fun arrayNoDuplicates!0 (array!36093 (_ BitVec 32) List!11362) Bool)

(assert (=> b!578213 (= res!366023 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11359))))

(declare-fun b!578206 () Bool)

(declare-fun res!366029 () Bool)

(assert (=> b!578206 (=> (not res!366029) (not e!332556))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36093 (_ BitVec 32)) Bool)

(assert (=> b!578206 (= res!366029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!366027 () Bool)

(assert (=> start!53192 (=> (not res!366027) (not e!332554))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53192 (= res!366027 (validMask!0 mask!3053))))

(assert (=> start!53192 e!332554))

(assert (=> start!53192 true))

(declare-fun array_inv!13117 (array!36093) Bool)

(assert (=> start!53192 (array_inv!13117 a!2986)))

(assert (= (and start!53192 res!366027) b!578211))

(assert (= (and b!578211 res!366022) b!578210))

(assert (= (and b!578210 res!366025) b!578208))

(assert (= (and b!578208 res!366028) b!578212))

(assert (= (and b!578212 res!366026) b!578207))

(assert (= (and b!578207 res!366024) b!578206))

(assert (= (and b!578206 res!366029) b!578213))

(assert (= (and b!578213 res!366023) b!578209))

(declare-fun m!556921 () Bool)

(assert (=> b!578208 m!556921))

(declare-fun m!556923 () Bool)

(assert (=> start!53192 m!556923))

(declare-fun m!556925 () Bool)

(assert (=> start!53192 m!556925))

(declare-fun m!556927 () Bool)

(assert (=> b!578210 m!556927))

(assert (=> b!578210 m!556927))

(declare-fun m!556929 () Bool)

(assert (=> b!578210 m!556929))

(declare-fun m!556931 () Bool)

(assert (=> b!578209 m!556931))

(declare-fun m!556933 () Bool)

(assert (=> b!578209 m!556933))

(declare-fun m!556935 () Bool)

(assert (=> b!578209 m!556935))

(declare-fun m!556937 () Bool)

(assert (=> b!578207 m!556937))

(declare-fun m!556939 () Bool)

(assert (=> b!578206 m!556939))

(declare-fun m!556941 () Bool)

(assert (=> b!578213 m!556941))

(declare-fun m!556943 () Bool)

(assert (=> b!578212 m!556943))

(push 1)

(assert (not b!578207))

(assert (not b!578213))

(assert (not b!578210))

(assert (not b!578212))

(assert (not start!53192))

(assert (not b!578208))

(assert (not b!578206))

(check-sat)

(pop 1)

