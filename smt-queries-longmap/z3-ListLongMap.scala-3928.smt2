; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53580 () Bool)

(assert start!53580)

(declare-fun b!583389 () Bool)

(declare-fun res!371210 () Bool)

(declare-fun e!334300 () Bool)

(assert (=> b!583389 (=> (not res!371210) (not e!334300))))

(declare-datatypes ((array!36481 0))(
  ( (array!36482 (arr!17515 (Array (_ BitVec 32) (_ BitVec 64))) (size!17879 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36481)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583389 (= res!371210 (validKeyInArray!0 (select (arr!17515 a!2986) j!136)))))

(declare-fun b!583390 () Bool)

(declare-fun e!334301 () Bool)

(assert (=> b!583390 (= e!334300 e!334301)))

(declare-fun res!371207 () Bool)

(assert (=> b!583390 (=> (not res!371207) (not e!334301))))

(declare-datatypes ((SeekEntryResult!5955 0))(
  ( (MissingZero!5955 (index!26047 (_ BitVec 32))) (Found!5955 (index!26048 (_ BitVec 32))) (Intermediate!5955 (undefined!6767 Bool) (index!26049 (_ BitVec 32)) (x!54888 (_ BitVec 32))) (Undefined!5955) (MissingVacant!5955 (index!26050 (_ BitVec 32))) )
))
(declare-fun lt!265315 () SeekEntryResult!5955)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!583390 (= res!371207 (or (= lt!265315 (MissingZero!5955 i!1108)) (= lt!265315 (MissingVacant!5955 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36481 (_ BitVec 32)) SeekEntryResult!5955)

(assert (=> b!583390 (= lt!265315 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!583391 () Bool)

(declare-fun res!371212 () Bool)

(assert (=> b!583391 (=> (not res!371212) (not e!334301))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!583391 (= res!371212 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17515 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17515 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583392 () Bool)

(assert (=> b!583392 (= e!334301 false)))

(declare-fun lt!265314 () SeekEntryResult!5955)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36481 (_ BitVec 32)) SeekEntryResult!5955)

(assert (=> b!583392 (= lt!265314 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17515 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!583393 () Bool)

(declare-fun res!371205 () Bool)

(assert (=> b!583393 (=> (not res!371205) (not e!334300))))

(assert (=> b!583393 (= res!371205 (validKeyInArray!0 k0!1786))))

(declare-fun b!583395 () Bool)

(declare-fun res!371209 () Bool)

(assert (=> b!583395 (=> (not res!371209) (not e!334300))))

(assert (=> b!583395 (= res!371209 (and (= (size!17879 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17879 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17879 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583396 () Bool)

(declare-fun res!371211 () Bool)

(assert (=> b!583396 (=> (not res!371211) (not e!334301))))

(declare-datatypes ((List!11556 0))(
  ( (Nil!11553) (Cons!11552 (h!12597 (_ BitVec 64)) (t!17784 List!11556)) )
))
(declare-fun arrayNoDuplicates!0 (array!36481 (_ BitVec 32) List!11556) Bool)

(assert (=> b!583396 (= res!371211 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11553))))

(declare-fun b!583397 () Bool)

(declare-fun res!371206 () Bool)

(assert (=> b!583397 (=> (not res!371206) (not e!334301))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36481 (_ BitVec 32)) Bool)

(assert (=> b!583397 (= res!371206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583394 () Bool)

(declare-fun res!371208 () Bool)

(assert (=> b!583394 (=> (not res!371208) (not e!334300))))

(declare-fun arrayContainsKey!0 (array!36481 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583394 (= res!371208 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!371213 () Bool)

(assert (=> start!53580 (=> (not res!371213) (not e!334300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53580 (= res!371213 (validMask!0 mask!3053))))

(assert (=> start!53580 e!334300))

(assert (=> start!53580 true))

(declare-fun array_inv!13311 (array!36481) Bool)

(assert (=> start!53580 (array_inv!13311 a!2986)))

(assert (= (and start!53580 res!371213) b!583395))

(assert (= (and b!583395 res!371209) b!583389))

(assert (= (and b!583389 res!371210) b!583393))

(assert (= (and b!583393 res!371205) b!583394))

(assert (= (and b!583394 res!371208) b!583390))

(assert (= (and b!583390 res!371207) b!583397))

(assert (= (and b!583397 res!371206) b!583396))

(assert (= (and b!583396 res!371211) b!583391))

(assert (= (and b!583391 res!371212) b!583392))

(declare-fun m!561855 () Bool)

(assert (=> b!583393 m!561855))

(declare-fun m!561857 () Bool)

(assert (=> b!583391 m!561857))

(declare-fun m!561859 () Bool)

(assert (=> b!583391 m!561859))

(declare-fun m!561861 () Bool)

(assert (=> b!583391 m!561861))

(declare-fun m!561863 () Bool)

(assert (=> b!583397 m!561863))

(declare-fun m!561865 () Bool)

(assert (=> b!583390 m!561865))

(declare-fun m!561867 () Bool)

(assert (=> b!583392 m!561867))

(assert (=> b!583392 m!561867))

(declare-fun m!561869 () Bool)

(assert (=> b!583392 m!561869))

(assert (=> b!583389 m!561867))

(assert (=> b!583389 m!561867))

(declare-fun m!561871 () Bool)

(assert (=> b!583389 m!561871))

(declare-fun m!561873 () Bool)

(assert (=> start!53580 m!561873))

(declare-fun m!561875 () Bool)

(assert (=> start!53580 m!561875))

(declare-fun m!561877 () Bool)

(assert (=> b!583396 m!561877))

(declare-fun m!561879 () Bool)

(assert (=> b!583394 m!561879))

(check-sat (not b!583389) (not start!53580) (not b!583396) (not b!583393) (not b!583392) (not b!583394) (not b!583390) (not b!583397))
(check-sat)
