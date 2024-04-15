; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53256 () Bool)

(assert start!53256)

(declare-fun b!578915 () Bool)

(declare-fun e!332741 () Bool)

(assert (=> b!578915 (= e!332741 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5797 0))(
  ( (MissingZero!5797 (index!25415 (_ BitVec 32))) (Found!5797 (index!25416 (_ BitVec 32))) (Intermediate!5797 (undefined!6609 Bool) (index!25417 (_ BitVec 32)) (x!54317 (_ BitVec 32))) (Undefined!5797) (MissingVacant!5797 (index!25418 (_ BitVec 32))) )
))
(declare-fun lt!264193 () SeekEntryResult!5797)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36171 0))(
  ( (array!36172 (arr!17360 (Array (_ BitVec 32) (_ BitVec 64))) (size!17725 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36171)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36171 (_ BitVec 32)) SeekEntryResult!5797)

(assert (=> b!578915 (= lt!264193 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17360 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!578916 () Bool)

(declare-fun res!366880 () Bool)

(declare-fun e!332740 () Bool)

(assert (=> b!578916 (=> (not res!366880) (not e!332740))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578916 (= res!366880 (validKeyInArray!0 (select (arr!17360 a!2986) j!136)))))

(declare-fun b!578917 () Bool)

(declare-fun res!366873 () Bool)

(assert (=> b!578917 (=> (not res!366873) (not e!332741))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!578917 (= res!366873 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17360 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17360 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!578918 () Bool)

(declare-fun res!366877 () Bool)

(assert (=> b!578918 (=> (not res!366877) (not e!332741))))

(declare-datatypes ((List!11440 0))(
  ( (Nil!11437) (Cons!11436 (h!12481 (_ BitVec 64)) (t!17659 List!11440)) )
))
(declare-fun arrayNoDuplicates!0 (array!36171 (_ BitVec 32) List!11440) Bool)

(assert (=> b!578918 (= res!366877 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11437))))

(declare-fun b!578920 () Bool)

(declare-fun res!366874 () Bool)

(assert (=> b!578920 (=> (not res!366874) (not e!332740))))

(declare-fun arrayContainsKey!0 (array!36171 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578920 (= res!366874 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578921 () Bool)

(declare-fun res!366876 () Bool)

(assert (=> b!578921 (=> (not res!366876) (not e!332740))))

(assert (=> b!578921 (= res!366876 (validKeyInArray!0 k0!1786))))

(declare-fun b!578922 () Bool)

(declare-fun res!366879 () Bool)

(assert (=> b!578922 (=> (not res!366879) (not e!332740))))

(assert (=> b!578922 (= res!366879 (and (= (size!17725 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17725 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17725 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578923 () Bool)

(declare-fun res!366878 () Bool)

(assert (=> b!578923 (=> (not res!366878) (not e!332741))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36171 (_ BitVec 32)) Bool)

(assert (=> b!578923 (= res!366878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578919 () Bool)

(assert (=> b!578919 (= e!332740 e!332741)))

(declare-fun res!366875 () Bool)

(assert (=> b!578919 (=> (not res!366875) (not e!332741))))

(declare-fun lt!264192 () SeekEntryResult!5797)

(assert (=> b!578919 (= res!366875 (or (= lt!264192 (MissingZero!5797 i!1108)) (= lt!264192 (MissingVacant!5797 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36171 (_ BitVec 32)) SeekEntryResult!5797)

(assert (=> b!578919 (= lt!264192 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!366881 () Bool)

(assert (=> start!53256 (=> (not res!366881) (not e!332740))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53256 (= res!366881 (validMask!0 mask!3053))))

(assert (=> start!53256 e!332740))

(assert (=> start!53256 true))

(declare-fun array_inv!13243 (array!36171) Bool)

(assert (=> start!53256 (array_inv!13243 a!2986)))

(assert (= (and start!53256 res!366881) b!578922))

(assert (= (and b!578922 res!366879) b!578916))

(assert (= (and b!578916 res!366880) b!578921))

(assert (= (and b!578921 res!366876) b!578920))

(assert (= (and b!578920 res!366874) b!578919))

(assert (= (and b!578919 res!366875) b!578923))

(assert (= (and b!578923 res!366878) b!578918))

(assert (= (and b!578918 res!366877) b!578917))

(assert (= (and b!578917 res!366873) b!578915))

(declare-fun m!557029 () Bool)

(assert (=> b!578921 m!557029))

(declare-fun m!557031 () Bool)

(assert (=> b!578920 m!557031))

(declare-fun m!557033 () Bool)

(assert (=> b!578918 m!557033))

(declare-fun m!557035 () Bool)

(assert (=> b!578917 m!557035))

(declare-fun m!557037 () Bool)

(assert (=> b!578917 m!557037))

(declare-fun m!557039 () Bool)

(assert (=> b!578917 m!557039))

(declare-fun m!557041 () Bool)

(assert (=> b!578923 m!557041))

(declare-fun m!557043 () Bool)

(assert (=> b!578915 m!557043))

(assert (=> b!578915 m!557043))

(declare-fun m!557045 () Bool)

(assert (=> b!578915 m!557045))

(declare-fun m!557047 () Bool)

(assert (=> b!578919 m!557047))

(assert (=> b!578916 m!557043))

(assert (=> b!578916 m!557043))

(declare-fun m!557049 () Bool)

(assert (=> b!578916 m!557049))

(declare-fun m!557051 () Bool)

(assert (=> start!53256 m!557051))

(declare-fun m!557053 () Bool)

(assert (=> start!53256 m!557053))

(check-sat (not start!53256) (not b!578919) (not b!578918) (not b!578915) (not b!578916) (not b!578920) (not b!578921) (not b!578923))
(check-sat)
