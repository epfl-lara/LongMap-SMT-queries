; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53280 () Bool)

(assert start!53280)

(declare-fun b!579294 () Bool)

(declare-fun res!367116 () Bool)

(declare-fun e!332952 () Bool)

(assert (=> b!579294 (=> (not res!367116) (not e!332952))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36181 0))(
  ( (array!36182 (arr!17365 (Array (_ BitVec 32) (_ BitVec 64))) (size!17729 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36181)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!579294 (= res!367116 (and (= (size!17729 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17729 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17729 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579295 () Bool)

(declare-fun res!367113 () Bool)

(declare-fun e!332950 () Bool)

(assert (=> b!579295 (=> (not res!367113) (not e!332950))))

(declare-datatypes ((List!11406 0))(
  ( (Nil!11403) (Cons!11402 (h!12447 (_ BitVec 64)) (t!17634 List!11406)) )
))
(declare-fun arrayNoDuplicates!0 (array!36181 (_ BitVec 32) List!11406) Bool)

(assert (=> b!579295 (= res!367113 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11403))))

(declare-fun b!579296 () Bool)

(declare-fun res!367112 () Bool)

(assert (=> b!579296 (=> (not res!367112) (not e!332950))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!579296 (= res!367112 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17365 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17365 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579297 () Bool)

(declare-fun res!367118 () Bool)

(assert (=> b!579297 (=> (not res!367118) (not e!332952))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579297 (= res!367118 (validKeyInArray!0 k0!1786))))

(declare-fun b!579298 () Bool)

(assert (=> b!579298 (= e!332952 e!332950)))

(declare-fun res!367111 () Bool)

(assert (=> b!579298 (=> (not res!367111) (not e!332950))))

(declare-datatypes ((SeekEntryResult!5805 0))(
  ( (MissingZero!5805 (index!25447 (_ BitVec 32))) (Found!5805 (index!25448 (_ BitVec 32))) (Intermediate!5805 (undefined!6617 Bool) (index!25449 (_ BitVec 32)) (x!54338 (_ BitVec 32))) (Undefined!5805) (MissingVacant!5805 (index!25450 (_ BitVec 32))) )
))
(declare-fun lt!264450 () SeekEntryResult!5805)

(assert (=> b!579298 (= res!367111 (or (= lt!264450 (MissingZero!5805 i!1108)) (= lt!264450 (MissingVacant!5805 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36181 (_ BitVec 32)) SeekEntryResult!5805)

(assert (=> b!579298 (= lt!264450 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!367110 () Bool)

(assert (=> start!53280 (=> (not res!367110) (not e!332952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53280 (= res!367110 (validMask!0 mask!3053))))

(assert (=> start!53280 e!332952))

(assert (=> start!53280 true))

(declare-fun array_inv!13161 (array!36181) Bool)

(assert (=> start!53280 (array_inv!13161 a!2986)))

(declare-fun b!579299 () Bool)

(assert (=> b!579299 (= e!332950 false)))

(declare-fun lt!264451 () SeekEntryResult!5805)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36181 (_ BitVec 32)) SeekEntryResult!5805)

(assert (=> b!579299 (= lt!264451 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17365 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579300 () Bool)

(declare-fun res!367117 () Bool)

(assert (=> b!579300 (=> (not res!367117) (not e!332952))))

(declare-fun arrayContainsKey!0 (array!36181 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579300 (= res!367117 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579301 () Bool)

(declare-fun res!367115 () Bool)

(assert (=> b!579301 (=> (not res!367115) (not e!332952))))

(assert (=> b!579301 (= res!367115 (validKeyInArray!0 (select (arr!17365 a!2986) j!136)))))

(declare-fun b!579302 () Bool)

(declare-fun res!367114 () Bool)

(assert (=> b!579302 (=> (not res!367114) (not e!332950))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36181 (_ BitVec 32)) Bool)

(assert (=> b!579302 (= res!367114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53280 res!367110) b!579294))

(assert (= (and b!579294 res!367116) b!579301))

(assert (= (and b!579301 res!367115) b!579297))

(assert (= (and b!579297 res!367118) b!579300))

(assert (= (and b!579300 res!367117) b!579298))

(assert (= (and b!579298 res!367111) b!579302))

(assert (= (and b!579302 res!367114) b!579295))

(assert (= (and b!579295 res!367113) b!579296))

(assert (= (and b!579296 res!367112) b!579299))

(declare-fun m!557919 () Bool)

(assert (=> b!579298 m!557919))

(declare-fun m!557921 () Bool)

(assert (=> b!579299 m!557921))

(assert (=> b!579299 m!557921))

(declare-fun m!557923 () Bool)

(assert (=> b!579299 m!557923))

(declare-fun m!557925 () Bool)

(assert (=> b!579295 m!557925))

(declare-fun m!557927 () Bool)

(assert (=> b!579297 m!557927))

(assert (=> b!579301 m!557921))

(assert (=> b!579301 m!557921))

(declare-fun m!557929 () Bool)

(assert (=> b!579301 m!557929))

(declare-fun m!557931 () Bool)

(assert (=> b!579296 m!557931))

(declare-fun m!557933 () Bool)

(assert (=> b!579296 m!557933))

(declare-fun m!557935 () Bool)

(assert (=> b!579296 m!557935))

(declare-fun m!557937 () Bool)

(assert (=> b!579302 m!557937))

(declare-fun m!557939 () Bool)

(assert (=> b!579300 m!557939))

(declare-fun m!557941 () Bool)

(assert (=> start!53280 m!557941))

(declare-fun m!557943 () Bool)

(assert (=> start!53280 m!557943))

(check-sat (not b!579295) (not b!579300) (not b!579298) (not b!579301) (not b!579299) (not b!579302) (not b!579297) (not start!53280))
(check-sat)
