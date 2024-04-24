; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52656 () Bool)

(assert start!52656)

(declare-fun b!574246 () Bool)

(declare-fun e!330389 () Bool)

(declare-fun e!330388 () Bool)

(assert (=> b!574246 (= e!330389 e!330388)))

(declare-fun res!363115 () Bool)

(assert (=> b!574246 (=> (not res!363115) (not e!330388))))

(declare-datatypes ((SeekEntryResult!5626 0))(
  ( (MissingZero!5626 (index!24731 (_ BitVec 32))) (Found!5626 (index!24732 (_ BitVec 32))) (Intermediate!5626 (undefined!6438 Bool) (index!24733 (_ BitVec 32)) (x!53764 (_ BitVec 32))) (Undefined!5626) (MissingVacant!5626 (index!24734 (_ BitVec 32))) )
))
(declare-fun lt!262258 () SeekEntryResult!5626)

(declare-datatypes ((array!35874 0))(
  ( (array!35875 (arr!17221 (Array (_ BitVec 32) (_ BitVec 64))) (size!17585 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35874)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!262264 () SeekEntryResult!5626)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35874 (_ BitVec 32)) SeekEntryResult!5626)

(assert (=> b!574246 (= res!363115 (= lt!262258 (seekKeyOrZeroReturnVacant!0 (x!53764 lt!262264) (index!24733 lt!262264) (index!24733 lt!262264) (select (arr!17221 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!574247 () Bool)

(declare-fun res!363113 () Bool)

(declare-fun e!330391 () Bool)

(assert (=> b!574247 (=> (not res!363113) (not e!330391))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!574247 (= res!363113 (and (= (size!17585 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17585 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17585 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!574248 () Bool)

(declare-fun res!363114 () Bool)

(assert (=> b!574248 (=> (not res!363114) (not e!330391))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35874 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!574248 (= res!363114 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!574249 () Bool)

(declare-fun e!330390 () Bool)

(assert (=> b!574249 (= e!330390 e!330389)))

(declare-fun res!363103 () Bool)

(assert (=> b!574249 (=> res!363103 e!330389)))

(declare-fun lt!262257 () (_ BitVec 64))

(assert (=> b!574249 (= res!363103 (or (= lt!262257 (select (arr!17221 a!3118) j!142)) (= lt!262257 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!574249 (= lt!262257 (select (arr!17221 a!3118) (index!24733 lt!262264)))))

(declare-fun b!574250 () Bool)

(declare-fun e!330387 () Bool)

(declare-fun e!330386 () Bool)

(assert (=> b!574250 (= e!330387 e!330386)))

(declare-fun res!363111 () Bool)

(assert (=> b!574250 (=> (not res!363111) (not e!330386))))

(declare-fun lt!262263 () (_ BitVec 32))

(declare-fun lt!262261 () array!35874)

(declare-fun lt!262260 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35874 (_ BitVec 32)) SeekEntryResult!5626)

(assert (=> b!574250 (= res!363111 (= lt!262264 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262263 lt!262260 lt!262261 mask!3119)))))

(declare-fun lt!262259 () (_ BitVec 32))

(assert (=> b!574250 (= lt!262264 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262259 (select (arr!17221 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!574250 (= lt!262263 (toIndex!0 lt!262260 mask!3119))))

(assert (=> b!574250 (= lt!262260 (select (store (arr!17221 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!574250 (= lt!262259 (toIndex!0 (select (arr!17221 a!3118) j!142) mask!3119))))

(assert (=> b!574250 (= lt!262261 (array!35875 (store (arr!17221 a!3118) i!1132 k0!1914) (size!17585 a!3118)))))

(declare-fun b!574251 () Bool)

(declare-fun res!363104 () Bool)

(assert (=> b!574251 (=> (not res!363104) (not e!330387))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35874 (_ BitVec 32)) Bool)

(assert (=> b!574251 (= res!363104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!363105 () Bool)

(assert (=> start!52656 (=> (not res!363105) (not e!330391))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52656 (= res!363105 (validMask!0 mask!3119))))

(assert (=> start!52656 e!330391))

(assert (=> start!52656 true))

(declare-fun array_inv!13080 (array!35874) Bool)

(assert (=> start!52656 (array_inv!13080 a!3118)))

(declare-fun b!574252 () Bool)

(declare-fun res!363106 () Bool)

(assert (=> b!574252 (=> (not res!363106) (not e!330391))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!574252 (= res!363106 (validKeyInArray!0 k0!1914))))

(declare-fun b!574253 () Bool)

(assert (=> b!574253 (= e!330391 e!330387)))

(declare-fun res!363109 () Bool)

(assert (=> b!574253 (=> (not res!363109) (not e!330387))))

(declare-fun lt!262262 () SeekEntryResult!5626)

(assert (=> b!574253 (= res!363109 (or (= lt!262262 (MissingZero!5626 i!1132)) (= lt!262262 (MissingVacant!5626 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35874 (_ BitVec 32)) SeekEntryResult!5626)

(assert (=> b!574253 (= lt!262262 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!574254 () Bool)

(assert (=> b!574254 (= e!330388 (= (seekEntryOrOpen!0 lt!262260 lt!262261 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53764 lt!262264) (index!24733 lt!262264) (index!24733 lt!262264) lt!262260 lt!262261 mask!3119)))))

(declare-fun b!574255 () Bool)

(declare-fun e!330392 () Bool)

(assert (=> b!574255 (= e!330392 e!330390)))

(declare-fun res!363108 () Bool)

(assert (=> b!574255 (=> res!363108 e!330390)))

(get-info :version)

(assert (=> b!574255 (= res!363108 (or (undefined!6438 lt!262264) (not ((_ is Intermediate!5626) lt!262264))))))

(declare-fun b!574256 () Bool)

(declare-fun res!363107 () Bool)

(assert (=> b!574256 (=> (not res!363107) (not e!330387))))

(declare-datatypes ((List!11208 0))(
  ( (Nil!11205) (Cons!11204 (h!12240 (_ BitVec 64)) (t!17428 List!11208)) )
))
(declare-fun arrayNoDuplicates!0 (array!35874 (_ BitVec 32) List!11208) Bool)

(assert (=> b!574256 (= res!363107 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11205))))

(declare-fun b!574257 () Bool)

(assert (=> b!574257 (= e!330386 (not true))))

(assert (=> b!574257 e!330392))

(declare-fun res!363110 () Bool)

(assert (=> b!574257 (=> (not res!363110) (not e!330392))))

(assert (=> b!574257 (= res!363110 (= lt!262258 (Found!5626 j!142)))))

(assert (=> b!574257 (= lt!262258 (seekEntryOrOpen!0 (select (arr!17221 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!574257 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18025 0))(
  ( (Unit!18026) )
))
(declare-fun lt!262256 () Unit!18025)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35874 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18025)

(assert (=> b!574257 (= lt!262256 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!574258 () Bool)

(declare-fun res!363112 () Bool)

(assert (=> b!574258 (=> (not res!363112) (not e!330391))))

(assert (=> b!574258 (= res!363112 (validKeyInArray!0 (select (arr!17221 a!3118) j!142)))))

(assert (= (and start!52656 res!363105) b!574247))

(assert (= (and b!574247 res!363113) b!574258))

(assert (= (and b!574258 res!363112) b!574252))

(assert (= (and b!574252 res!363106) b!574248))

(assert (= (and b!574248 res!363114) b!574253))

(assert (= (and b!574253 res!363109) b!574251))

(assert (= (and b!574251 res!363104) b!574256))

(assert (= (and b!574256 res!363107) b!574250))

(assert (= (and b!574250 res!363111) b!574257))

(assert (= (and b!574257 res!363110) b!574255))

(assert (= (and b!574255 (not res!363108)) b!574249))

(assert (= (and b!574249 (not res!363103)) b!574246))

(assert (= (and b!574246 res!363115) b!574254))

(declare-fun m!553283 () Bool)

(assert (=> b!574246 m!553283))

(assert (=> b!574246 m!553283))

(declare-fun m!553285 () Bool)

(assert (=> b!574246 m!553285))

(declare-fun m!553287 () Bool)

(assert (=> b!574252 m!553287))

(declare-fun m!553289 () Bool)

(assert (=> b!574253 m!553289))

(declare-fun m!553291 () Bool)

(assert (=> b!574251 m!553291))

(assert (=> b!574250 m!553283))

(declare-fun m!553293 () Bool)

(assert (=> b!574250 m!553293))

(assert (=> b!574250 m!553283))

(declare-fun m!553295 () Bool)

(assert (=> b!574250 m!553295))

(assert (=> b!574250 m!553283))

(declare-fun m!553297 () Bool)

(assert (=> b!574250 m!553297))

(declare-fun m!553299 () Bool)

(assert (=> b!574250 m!553299))

(declare-fun m!553301 () Bool)

(assert (=> b!574250 m!553301))

(declare-fun m!553303 () Bool)

(assert (=> b!574250 m!553303))

(assert (=> b!574257 m!553283))

(assert (=> b!574257 m!553283))

(declare-fun m!553305 () Bool)

(assert (=> b!574257 m!553305))

(declare-fun m!553307 () Bool)

(assert (=> b!574257 m!553307))

(declare-fun m!553309 () Bool)

(assert (=> b!574257 m!553309))

(declare-fun m!553311 () Bool)

(assert (=> b!574256 m!553311))

(declare-fun m!553313 () Bool)

(assert (=> b!574248 m!553313))

(assert (=> b!574249 m!553283))

(declare-fun m!553315 () Bool)

(assert (=> b!574249 m!553315))

(assert (=> b!574258 m!553283))

(assert (=> b!574258 m!553283))

(declare-fun m!553317 () Bool)

(assert (=> b!574258 m!553317))

(declare-fun m!553319 () Bool)

(assert (=> start!52656 m!553319))

(declare-fun m!553321 () Bool)

(assert (=> start!52656 m!553321))

(declare-fun m!553323 () Bool)

(assert (=> b!574254 m!553323))

(declare-fun m!553325 () Bool)

(assert (=> b!574254 m!553325))

(check-sat (not b!574246) (not b!574251) (not b!574248) (not b!574254) (not start!52656) (not b!574256) (not b!574252) (not b!574258) (not b!574250) (not b!574257) (not b!574253))
(check-sat)
