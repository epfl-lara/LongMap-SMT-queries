; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53274 () Bool)

(assert start!53274)

(declare-fun b!579213 () Bool)

(declare-fun res!367033 () Bool)

(declare-fun e!332925 () Bool)

(assert (=> b!579213 (=> (not res!367033) (not e!332925))))

(declare-datatypes ((array!36175 0))(
  ( (array!36176 (arr!17362 (Array (_ BitVec 32) (_ BitVec 64))) (size!17726 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36175)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36175 (_ BitVec 32)) Bool)

(assert (=> b!579213 (= res!367033 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579214 () Bool)

(declare-fun e!332924 () Bool)

(assert (=> b!579214 (= e!332924 e!332925)))

(declare-fun res!367037 () Bool)

(assert (=> b!579214 (=> (not res!367037) (not e!332925))))

(declare-datatypes ((SeekEntryResult!5802 0))(
  ( (MissingZero!5802 (index!25435 (_ BitVec 32))) (Found!5802 (index!25436 (_ BitVec 32))) (Intermediate!5802 (undefined!6614 Bool) (index!25437 (_ BitVec 32)) (x!54327 (_ BitVec 32))) (Undefined!5802) (MissingVacant!5802 (index!25438 (_ BitVec 32))) )
))
(declare-fun lt!264432 () SeekEntryResult!5802)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579214 (= res!367037 (or (= lt!264432 (MissingZero!5802 i!1108)) (= lt!264432 (MissingVacant!5802 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36175 (_ BitVec 32)) SeekEntryResult!5802)

(assert (=> b!579214 (= lt!264432 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!579215 () Bool)

(declare-fun res!367035 () Bool)

(assert (=> b!579215 (=> (not res!367035) (not e!332924))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579215 (= res!367035 (validKeyInArray!0 (select (arr!17362 a!2986) j!136)))))

(declare-fun b!579216 () Bool)

(declare-fun res!367034 () Bool)

(assert (=> b!579216 (=> (not res!367034) (not e!332925))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!579216 (= res!367034 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17362 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17362 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579217 () Bool)

(declare-fun res!367036 () Bool)

(assert (=> b!579217 (=> (not res!367036) (not e!332924))))

(assert (=> b!579217 (= res!367036 (validKeyInArray!0 k0!1786))))

(declare-fun b!579218 () Bool)

(declare-fun res!367029 () Bool)

(assert (=> b!579218 (=> (not res!367029) (not e!332925))))

(declare-datatypes ((List!11403 0))(
  ( (Nil!11400) (Cons!11399 (h!12444 (_ BitVec 64)) (t!17631 List!11403)) )
))
(declare-fun arrayNoDuplicates!0 (array!36175 (_ BitVec 32) List!11403) Bool)

(assert (=> b!579218 (= res!367029 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11400))))

(declare-fun res!367032 () Bool)

(assert (=> start!53274 (=> (not res!367032) (not e!332924))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53274 (= res!367032 (validMask!0 mask!3053))))

(assert (=> start!53274 e!332924))

(assert (=> start!53274 true))

(declare-fun array_inv!13158 (array!36175) Bool)

(assert (=> start!53274 (array_inv!13158 a!2986)))

(declare-fun b!579219 () Bool)

(declare-fun res!367030 () Bool)

(assert (=> b!579219 (=> (not res!367030) (not e!332924))))

(declare-fun arrayContainsKey!0 (array!36175 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579219 (= res!367030 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579220 () Bool)

(declare-fun res!367031 () Bool)

(assert (=> b!579220 (=> (not res!367031) (not e!332924))))

(assert (=> b!579220 (= res!367031 (and (= (size!17726 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17726 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17726 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579221 () Bool)

(assert (=> b!579221 (= e!332925 false)))

(declare-fun lt!264433 () SeekEntryResult!5802)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36175 (_ BitVec 32)) SeekEntryResult!5802)

(assert (=> b!579221 (= lt!264433 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17362 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53274 res!367032) b!579220))

(assert (= (and b!579220 res!367031) b!579215))

(assert (= (and b!579215 res!367035) b!579217))

(assert (= (and b!579217 res!367036) b!579219))

(assert (= (and b!579219 res!367030) b!579214))

(assert (= (and b!579214 res!367037) b!579213))

(assert (= (and b!579213 res!367033) b!579218))

(assert (= (and b!579218 res!367029) b!579216))

(assert (= (and b!579216 res!367034) b!579221))

(declare-fun m!557841 () Bool)

(assert (=> b!579219 m!557841))

(declare-fun m!557843 () Bool)

(assert (=> b!579216 m!557843))

(declare-fun m!557845 () Bool)

(assert (=> b!579216 m!557845))

(declare-fun m!557847 () Bool)

(assert (=> b!579216 m!557847))

(declare-fun m!557849 () Bool)

(assert (=> start!53274 m!557849))

(declare-fun m!557851 () Bool)

(assert (=> start!53274 m!557851))

(declare-fun m!557853 () Bool)

(assert (=> b!579214 m!557853))

(declare-fun m!557855 () Bool)

(assert (=> b!579213 m!557855))

(declare-fun m!557857 () Bool)

(assert (=> b!579218 m!557857))

(declare-fun m!557859 () Bool)

(assert (=> b!579217 m!557859))

(declare-fun m!557861 () Bool)

(assert (=> b!579221 m!557861))

(assert (=> b!579221 m!557861))

(declare-fun m!557863 () Bool)

(assert (=> b!579221 m!557863))

(assert (=> b!579215 m!557861))

(assert (=> b!579215 m!557861))

(declare-fun m!557865 () Bool)

(assert (=> b!579215 m!557865))

(check-sat (not b!579221) (not b!579213) (not b!579218) (not b!579215) (not start!53274) (not b!579214) (not b!579219) (not b!579217))
