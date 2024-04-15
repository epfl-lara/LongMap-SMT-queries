; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56988 () Bool)

(assert start!56988)

(declare-fun b!630721 () Bool)

(declare-datatypes ((Unit!21164 0))(
  ( (Unit!21165) )
))
(declare-fun e!360612 () Unit!21164)

(declare-fun Unit!21166 () Unit!21164)

(assert (=> b!630721 (= e!360612 Unit!21166)))

(assert (=> b!630721 false))

(declare-fun b!630722 () Bool)

(declare-fun e!360616 () Bool)

(declare-fun e!360615 () Bool)

(assert (=> b!630722 (= e!360616 e!360615)))

(declare-fun res!407829 () Bool)

(assert (=> b!630722 (=> (not res!407829) (not e!360615))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38076 0))(
  ( (array!38077 (arr!18272 (Array (_ BitVec 32) (_ BitVec 64))) (size!18637 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38076)

(assert (=> b!630722 (= res!407829 (= (select (store (arr!18272 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!291243 () array!38076)

(assert (=> b!630722 (= lt!291243 (array!38077 (store (arr!18272 a!2986) i!1108 k0!1786) (size!18637 a!2986)))))

(declare-fun b!630723 () Bool)

(declare-fun e!360618 () Bool)

(declare-datatypes ((SeekEntryResult!6709 0))(
  ( (MissingZero!6709 (index!29126 (_ BitVec 32))) (Found!6709 (index!29127 (_ BitVec 32))) (Intermediate!6709 (undefined!7521 Bool) (index!29128 (_ BitVec 32)) (x!57874 (_ BitVec 32))) (Undefined!6709) (MissingVacant!6709 (index!29129 (_ BitVec 32))) )
))
(declare-fun lt!291241 () SeekEntryResult!6709)

(declare-fun lt!291239 () SeekEntryResult!6709)

(assert (=> b!630723 (= e!360618 (= lt!291241 lt!291239))))

(declare-fun b!630724 () Bool)

(declare-fun e!360617 () Bool)

(assert (=> b!630724 (= e!360617 (not true))))

(declare-fun lt!291237 () Unit!21164)

(assert (=> b!630724 (= lt!291237 e!360612)))

(declare-fun lt!291240 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun c!71817 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38076 (_ BitVec 32)) SeekEntryResult!6709)

(assert (=> b!630724 (= c!71817 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291240 lt!291243 mask!3053) Undefined!6709))))

(assert (=> b!630724 e!360618))

(declare-fun res!407820 () Bool)

(assert (=> b!630724 (=> (not res!407820) (not e!360618))))

(declare-fun lt!291238 () (_ BitVec 32))

(assert (=> b!630724 (= res!407820 (= lt!291239 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291238 vacantSpotIndex!68 lt!291240 lt!291243 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!630724 (= lt!291239 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291238 vacantSpotIndex!68 (select (arr!18272 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!630724 (= lt!291240 (select (store (arr!18272 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!291242 () Unit!21164)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38076 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21164)

(assert (=> b!630724 (= lt!291242 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291238 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!630724 (= lt!291238 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!630725 () Bool)

(declare-fun res!407824 () Bool)

(assert (=> b!630725 (=> (not res!407824) (not e!360616))))

(assert (=> b!630725 (= res!407824 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18272 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!630726 () Bool)

(declare-fun res!407825 () Bool)

(assert (=> b!630726 (=> (not res!407825) (not e!360616))))

(declare-datatypes ((List!12352 0))(
  ( (Nil!12349) (Cons!12348 (h!13393 (_ BitVec 64)) (t!18571 List!12352)) )
))
(declare-fun arrayNoDuplicates!0 (array!38076 (_ BitVec 32) List!12352) Bool)

(assert (=> b!630726 (= res!407825 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12349))))

(declare-fun b!630727 () Bool)

(assert (=> b!630727 (= e!360615 e!360617)))

(declare-fun res!407822 () Bool)

(assert (=> b!630727 (=> (not res!407822) (not e!360617))))

(assert (=> b!630727 (= res!407822 (and (= lt!291241 (Found!6709 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18272 a!2986) index!984) (select (arr!18272 a!2986) j!136))) (not (= (select (arr!18272 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!630727 (= lt!291241 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18272 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!630728 () Bool)

(declare-fun res!407830 () Bool)

(declare-fun e!360614 () Bool)

(assert (=> b!630728 (=> (not res!407830) (not e!360614))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!630728 (= res!407830 (validKeyInArray!0 k0!1786))))

(declare-fun b!630729 () Bool)

(declare-fun res!407821 () Bool)

(assert (=> b!630729 (=> (not res!407821) (not e!360614))))

(declare-fun arrayContainsKey!0 (array!38076 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!630729 (= res!407821 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!630730 () Bool)

(declare-fun res!407828 () Bool)

(assert (=> b!630730 (=> (not res!407828) (not e!360614))))

(assert (=> b!630730 (= res!407828 (and (= (size!18637 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18637 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18637 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!630720 () Bool)

(declare-fun res!407823 () Bool)

(assert (=> b!630720 (=> (not res!407823) (not e!360614))))

(assert (=> b!630720 (= res!407823 (validKeyInArray!0 (select (arr!18272 a!2986) j!136)))))

(declare-fun res!407826 () Bool)

(assert (=> start!56988 (=> (not res!407826) (not e!360614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56988 (= res!407826 (validMask!0 mask!3053))))

(assert (=> start!56988 e!360614))

(assert (=> start!56988 true))

(declare-fun array_inv!14155 (array!38076) Bool)

(assert (=> start!56988 (array_inv!14155 a!2986)))

(declare-fun b!630731 () Bool)

(declare-fun res!407831 () Bool)

(assert (=> b!630731 (=> (not res!407831) (not e!360616))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38076 (_ BitVec 32)) Bool)

(assert (=> b!630731 (= res!407831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!630732 () Bool)

(declare-fun Unit!21167 () Unit!21164)

(assert (=> b!630732 (= e!360612 Unit!21167)))

(declare-fun b!630733 () Bool)

(assert (=> b!630733 (= e!360614 e!360616)))

(declare-fun res!407827 () Bool)

(assert (=> b!630733 (=> (not res!407827) (not e!360616))))

(declare-fun lt!291244 () SeekEntryResult!6709)

(assert (=> b!630733 (= res!407827 (or (= lt!291244 (MissingZero!6709 i!1108)) (= lt!291244 (MissingVacant!6709 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38076 (_ BitVec 32)) SeekEntryResult!6709)

(assert (=> b!630733 (= lt!291244 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!56988 res!407826) b!630730))

(assert (= (and b!630730 res!407828) b!630720))

(assert (= (and b!630720 res!407823) b!630728))

(assert (= (and b!630728 res!407830) b!630729))

(assert (= (and b!630729 res!407821) b!630733))

(assert (= (and b!630733 res!407827) b!630731))

(assert (= (and b!630731 res!407831) b!630726))

(assert (= (and b!630726 res!407825) b!630725))

(assert (= (and b!630725 res!407824) b!630722))

(assert (= (and b!630722 res!407829) b!630727))

(assert (= (and b!630727 res!407822) b!630724))

(assert (= (and b!630724 res!407820) b!630723))

(assert (= (and b!630724 c!71817) b!630721))

(assert (= (and b!630724 (not c!71817)) b!630732))

(declare-fun m!605179 () Bool)

(assert (=> b!630731 m!605179))

(declare-fun m!605181 () Bool)

(assert (=> b!630733 m!605181))

(declare-fun m!605183 () Bool)

(assert (=> b!630722 m!605183))

(declare-fun m!605185 () Bool)

(assert (=> b!630722 m!605185))

(declare-fun m!605187 () Bool)

(assert (=> b!630726 m!605187))

(declare-fun m!605189 () Bool)

(assert (=> b!630720 m!605189))

(assert (=> b!630720 m!605189))

(declare-fun m!605191 () Bool)

(assert (=> b!630720 m!605191))

(declare-fun m!605193 () Bool)

(assert (=> b!630729 m!605193))

(declare-fun m!605195 () Bool)

(assert (=> b!630724 m!605195))

(declare-fun m!605197 () Bool)

(assert (=> b!630724 m!605197))

(declare-fun m!605199 () Bool)

(assert (=> b!630724 m!605199))

(assert (=> b!630724 m!605183))

(assert (=> b!630724 m!605189))

(declare-fun m!605201 () Bool)

(assert (=> b!630724 m!605201))

(declare-fun m!605203 () Bool)

(assert (=> b!630724 m!605203))

(assert (=> b!630724 m!605189))

(declare-fun m!605205 () Bool)

(assert (=> b!630724 m!605205))

(declare-fun m!605207 () Bool)

(assert (=> b!630727 m!605207))

(assert (=> b!630727 m!605189))

(assert (=> b!630727 m!605189))

(declare-fun m!605209 () Bool)

(assert (=> b!630727 m!605209))

(declare-fun m!605211 () Bool)

(assert (=> start!56988 m!605211))

(declare-fun m!605213 () Bool)

(assert (=> start!56988 m!605213))

(declare-fun m!605215 () Bool)

(assert (=> b!630725 m!605215))

(declare-fun m!605217 () Bool)

(assert (=> b!630728 m!605217))

(check-sat (not b!630724) (not b!630726) (not b!630720) (not b!630729) (not b!630731) (not b!630728) (not b!630727) (not b!630733) (not start!56988))
(check-sat)
