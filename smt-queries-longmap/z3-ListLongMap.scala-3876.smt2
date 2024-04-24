; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53316 () Bool)

(assert start!53316)

(declare-fun b!579305 () Bool)

(declare-fun res!367017 () Bool)

(declare-fun e!333018 () Bool)

(assert (=> b!579305 (=> (not res!367017) (not e!333018))))

(declare-datatypes ((array!36162 0))(
  ( (array!36163 (arr!17353 (Array (_ BitVec 32) (_ BitVec 64))) (size!17717 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36162)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579305 (= res!367017 (validKeyInArray!0 (select (arr!17353 a!2986) j!136)))))

(declare-fun res!367024 () Bool)

(assert (=> start!53316 (=> (not res!367024) (not e!333018))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53316 (= res!367024 (validMask!0 mask!3053))))

(assert (=> start!53316 e!333018))

(assert (=> start!53316 true))

(declare-fun array_inv!13212 (array!36162) Bool)

(assert (=> start!53316 (array_inv!13212 a!2986)))

(declare-fun b!579306 () Bool)

(declare-fun e!333017 () Bool)

(assert (=> b!579306 (= e!333017 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5749 0))(
  ( (MissingZero!5749 (index!25223 (_ BitVec 32))) (Found!5749 (index!25224 (_ BitVec 32))) (Intermediate!5749 (undefined!6561 Bool) (index!25225 (_ BitVec 32)) (x!54269 (_ BitVec 32))) (Undefined!5749) (MissingVacant!5749 (index!25226 (_ BitVec 32))) )
))
(declare-fun lt!264520 () SeekEntryResult!5749)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36162 (_ BitVec 32)) SeekEntryResult!5749)

(assert (=> b!579306 (= lt!264520 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17353 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579307 () Bool)

(assert (=> b!579307 (= e!333018 e!333017)))

(declare-fun res!367019 () Bool)

(assert (=> b!579307 (=> (not res!367019) (not e!333017))))

(declare-fun lt!264519 () SeekEntryResult!5749)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579307 (= res!367019 (or (= lt!264519 (MissingZero!5749 i!1108)) (= lt!264519 (MissingVacant!5749 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36162 (_ BitVec 32)) SeekEntryResult!5749)

(assert (=> b!579307 (= lt!264519 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!579308 () Bool)

(declare-fun res!367018 () Bool)

(assert (=> b!579308 (=> (not res!367018) (not e!333018))))

(assert (=> b!579308 (= res!367018 (validKeyInArray!0 k0!1786))))

(declare-fun b!579309 () Bool)

(declare-fun res!367023 () Bool)

(assert (=> b!579309 (=> (not res!367023) (not e!333018))))

(declare-fun arrayContainsKey!0 (array!36162 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579309 (= res!367023 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579310 () Bool)

(declare-fun res!367016 () Bool)

(assert (=> b!579310 (=> (not res!367016) (not e!333018))))

(assert (=> b!579310 (= res!367016 (and (= (size!17717 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17717 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17717 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579311 () Bool)

(declare-fun res!367021 () Bool)

(assert (=> b!579311 (=> (not res!367021) (not e!333017))))

(declare-datatypes ((List!11301 0))(
  ( (Nil!11298) (Cons!11297 (h!12345 (_ BitVec 64)) (t!17521 List!11301)) )
))
(declare-fun arrayNoDuplicates!0 (array!36162 (_ BitVec 32) List!11301) Bool)

(assert (=> b!579311 (= res!367021 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11298))))

(declare-fun b!579312 () Bool)

(declare-fun res!367020 () Bool)

(assert (=> b!579312 (=> (not res!367020) (not e!333017))))

(assert (=> b!579312 (= res!367020 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17353 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17353 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579313 () Bool)

(declare-fun res!367022 () Bool)

(assert (=> b!579313 (=> (not res!367022) (not e!333017))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36162 (_ BitVec 32)) Bool)

(assert (=> b!579313 (= res!367022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53316 res!367024) b!579310))

(assert (= (and b!579310 res!367016) b!579305))

(assert (= (and b!579305 res!367017) b!579308))

(assert (= (and b!579308 res!367018) b!579309))

(assert (= (and b!579309 res!367023) b!579307))

(assert (= (and b!579307 res!367019) b!579313))

(assert (= (and b!579313 res!367022) b!579311))

(assert (= (and b!579311 res!367021) b!579312))

(assert (= (and b!579312 res!367020) b!579306))

(declare-fun m!558089 () Bool)

(assert (=> b!579309 m!558089))

(declare-fun m!558091 () Bool)

(assert (=> b!579305 m!558091))

(assert (=> b!579305 m!558091))

(declare-fun m!558093 () Bool)

(assert (=> b!579305 m!558093))

(assert (=> b!579306 m!558091))

(assert (=> b!579306 m!558091))

(declare-fun m!558095 () Bool)

(assert (=> b!579306 m!558095))

(declare-fun m!558097 () Bool)

(assert (=> b!579313 m!558097))

(declare-fun m!558099 () Bool)

(assert (=> b!579308 m!558099))

(declare-fun m!558101 () Bool)

(assert (=> b!579311 m!558101))

(declare-fun m!558103 () Bool)

(assert (=> b!579307 m!558103))

(declare-fun m!558105 () Bool)

(assert (=> b!579312 m!558105))

(declare-fun m!558107 () Bool)

(assert (=> b!579312 m!558107))

(declare-fun m!558109 () Bool)

(assert (=> b!579312 m!558109))

(declare-fun m!558111 () Bool)

(assert (=> start!53316 m!558111))

(declare-fun m!558113 () Bool)

(assert (=> start!53316 m!558113))

(check-sat (not b!579307) (not b!579305) (not start!53316) (not b!579308) (not b!579309) (not b!579311) (not b!579306) (not b!579313))
(check-sat)
