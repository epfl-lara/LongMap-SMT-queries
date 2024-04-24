; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47534 () Bool)

(assert start!47534)

(declare-fun b!523272 () Bool)

(declare-fun e!305173 () Bool)

(declare-fun e!305171 () Bool)

(assert (=> b!523272 (= e!305173 (not e!305171))))

(declare-fun res!320710 () Bool)

(assert (=> b!523272 (=> res!320710 e!305171)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33298 0))(
  ( (array!33299 (arr!16003 (Array (_ BitVec 32) (_ BitVec 64))) (size!16367 (_ BitVec 32))) )
))
(declare-fun lt!240124 () array!33298)

(declare-fun lt!240129 () (_ BitVec 64))

(declare-fun lt!240126 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4426 0))(
  ( (MissingZero!4426 (index!19910 (_ BitVec 32))) (Found!4426 (index!19911 (_ BitVec 32))) (Intermediate!4426 (undefined!5238 Bool) (index!19912 (_ BitVec 32)) (x!49034 (_ BitVec 32))) (Undefined!4426) (MissingVacant!4426 (index!19913 (_ BitVec 32))) )
))
(declare-fun lt!240130 () SeekEntryResult!4426)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33298 (_ BitVec 32)) SeekEntryResult!4426)

(assert (=> b!523272 (= res!320710 (= lt!240130 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240126 lt!240129 lt!240124 mask!3524)))))

(declare-fun lt!240128 () (_ BitVec 32))

(declare-fun a!3235 () array!33298)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!523272 (= lt!240130 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240128 (select (arr!16003 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!523272 (= lt!240126 (toIndex!0 lt!240129 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!523272 (= lt!240129 (select (store (arr!16003 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!523272 (= lt!240128 (toIndex!0 (select (arr!16003 a!3235) j!176) mask!3524))))

(assert (=> b!523272 (= lt!240124 (array!33299 (store (arr!16003 a!3235) i!1204 k0!2280) (size!16367 a!3235)))))

(declare-fun e!305170 () Bool)

(assert (=> b!523272 e!305170))

(declare-fun res!320702 () Bool)

(assert (=> b!523272 (=> (not res!320702) (not e!305170))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33298 (_ BitVec 32)) Bool)

(assert (=> b!523272 (= res!320702 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16315 0))(
  ( (Unit!16316) )
))
(declare-fun lt!240122 () Unit!16315)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33298 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16315)

(assert (=> b!523272 (= lt!240122 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!523273 () Bool)

(declare-fun e!305169 () Bool)

(assert (=> b!523273 (= e!305169 false)))

(declare-fun res!320699 () Bool)

(declare-fun e!305174 () Bool)

(assert (=> start!47534 (=> (not res!320699) (not e!305174))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47534 (= res!320699 (validMask!0 mask!3524))))

(assert (=> start!47534 e!305174))

(assert (=> start!47534 true))

(declare-fun array_inv!11862 (array!33298) Bool)

(assert (=> start!47534 (array_inv!11862 a!3235)))

(declare-fun b!523274 () Bool)

(declare-fun res!320707 () Bool)

(assert (=> b!523274 (=> (not res!320707) (not e!305173))))

(declare-datatypes ((List!10068 0))(
  ( (Nil!10065) (Cons!10064 (h!10989 (_ BitVec 64)) (t!16288 List!10068)) )
))
(declare-fun arrayNoDuplicates!0 (array!33298 (_ BitVec 32) List!10068) Bool)

(assert (=> b!523274 (= res!320707 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10065))))

(declare-fun b!523275 () Bool)

(declare-fun res!320705 () Bool)

(assert (=> b!523275 (=> (not res!320705) (not e!305174))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!523275 (= res!320705 (validKeyInArray!0 (select (arr!16003 a!3235) j!176)))))

(declare-fun b!523276 () Bool)

(declare-fun res!320708 () Bool)

(assert (=> b!523276 (=> (not res!320708) (not e!305174))))

(assert (=> b!523276 (= res!320708 (and (= (size!16367 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16367 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16367 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!523277 () Bool)

(declare-fun res!320706 () Bool)

(assert (=> b!523277 (=> (not res!320706) (not e!305174))))

(assert (=> b!523277 (= res!320706 (validKeyInArray!0 k0!2280))))

(declare-fun b!523278 () Bool)

(declare-fun res!320700 () Bool)

(assert (=> b!523278 (=> (not res!320700) (not e!305174))))

(declare-fun arrayContainsKey!0 (array!33298 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!523278 (= res!320700 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!523279 () Bool)

(assert (=> b!523279 (= e!305174 e!305173)))

(declare-fun res!320701 () Bool)

(assert (=> b!523279 (=> (not res!320701) (not e!305173))))

(declare-fun lt!240123 () SeekEntryResult!4426)

(assert (=> b!523279 (= res!320701 (or (= lt!240123 (MissingZero!4426 i!1204)) (= lt!240123 (MissingVacant!4426 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33298 (_ BitVec 32)) SeekEntryResult!4426)

(assert (=> b!523279 (= lt!240123 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!523280 () Bool)

(assert (=> b!523280 (= e!305171 (or (bvsgt #b00000000000000000000000000000000 (x!49034 lt!240130)) (bvsgt (x!49034 lt!240130) #b01111111111111111111111111111110) (and (bvsge lt!240128 #b00000000000000000000000000000000) (bvslt lt!240128 (size!16367 a!3235)))))))

(assert (=> b!523280 (and (or (= (select (arr!16003 a!3235) (index!19912 lt!240130)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16003 a!3235) (index!19912 lt!240130)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16003 a!3235) (index!19912 lt!240130)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16003 a!3235) (index!19912 lt!240130)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!240125 () Unit!16315)

(declare-fun e!305172 () Unit!16315)

(assert (=> b!523280 (= lt!240125 e!305172)))

(declare-fun c!61589 () Bool)

(assert (=> b!523280 (= c!61589 (= (select (arr!16003 a!3235) (index!19912 lt!240130)) (select (arr!16003 a!3235) j!176)))))

(assert (=> b!523280 (and (bvslt (x!49034 lt!240130) #b01111111111111111111111111111110) (or (= (select (arr!16003 a!3235) (index!19912 lt!240130)) (select (arr!16003 a!3235) j!176)) (= (select (arr!16003 a!3235) (index!19912 lt!240130)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16003 a!3235) (index!19912 lt!240130)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!523281 () Bool)

(declare-fun Unit!16317 () Unit!16315)

(assert (=> b!523281 (= e!305172 Unit!16317)))

(declare-fun b!523282 () Bool)

(assert (=> b!523282 (= e!305170 (= (seekEntryOrOpen!0 (select (arr!16003 a!3235) j!176) a!3235 mask!3524) (Found!4426 j!176)))))

(declare-fun b!523283 () Bool)

(declare-fun res!320709 () Bool)

(assert (=> b!523283 (=> (not res!320709) (not e!305173))))

(assert (=> b!523283 (= res!320709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!523284 () Bool)

(declare-fun Unit!16318 () Unit!16315)

(assert (=> b!523284 (= e!305172 Unit!16318)))

(declare-fun lt!240127 () Unit!16315)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33298 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16315)

(assert (=> b!523284 (= lt!240127 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!240128 #b00000000000000000000000000000000 (index!19912 lt!240130) (x!49034 lt!240130) mask!3524))))

(declare-fun res!320704 () Bool)

(assert (=> b!523284 (= res!320704 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240128 lt!240129 lt!240124 mask!3524) (Intermediate!4426 false (index!19912 lt!240130) (x!49034 lt!240130))))))

(assert (=> b!523284 (=> (not res!320704) (not e!305169))))

(assert (=> b!523284 e!305169))

(declare-fun b!523285 () Bool)

(declare-fun res!320703 () Bool)

(assert (=> b!523285 (=> res!320703 e!305171)))

(get-info :version)

(assert (=> b!523285 (= res!320703 (or (undefined!5238 lt!240130) (not ((_ is Intermediate!4426) lt!240130))))))

(assert (= (and start!47534 res!320699) b!523276))

(assert (= (and b!523276 res!320708) b!523275))

(assert (= (and b!523275 res!320705) b!523277))

(assert (= (and b!523277 res!320706) b!523278))

(assert (= (and b!523278 res!320700) b!523279))

(assert (= (and b!523279 res!320701) b!523283))

(assert (= (and b!523283 res!320709) b!523274))

(assert (= (and b!523274 res!320707) b!523272))

(assert (= (and b!523272 res!320702) b!523282))

(assert (= (and b!523272 (not res!320710)) b!523285))

(assert (= (and b!523285 (not res!320703)) b!523280))

(assert (= (and b!523280 c!61589) b!523284))

(assert (= (and b!523280 (not c!61589)) b!523281))

(assert (= (and b!523284 res!320704) b!523273))

(declare-fun m!504337 () Bool)

(assert (=> b!523284 m!504337))

(declare-fun m!504339 () Bool)

(assert (=> b!523284 m!504339))

(declare-fun m!504341 () Bool)

(assert (=> b!523282 m!504341))

(assert (=> b!523282 m!504341))

(declare-fun m!504343 () Bool)

(assert (=> b!523282 m!504343))

(declare-fun m!504345 () Bool)

(assert (=> b!523274 m!504345))

(declare-fun m!504347 () Bool)

(assert (=> start!47534 m!504347))

(declare-fun m!504349 () Bool)

(assert (=> start!47534 m!504349))

(declare-fun m!504351 () Bool)

(assert (=> b!523278 m!504351))

(assert (=> b!523275 m!504341))

(assert (=> b!523275 m!504341))

(declare-fun m!504353 () Bool)

(assert (=> b!523275 m!504353))

(declare-fun m!504355 () Bool)

(assert (=> b!523280 m!504355))

(assert (=> b!523280 m!504341))

(declare-fun m!504357 () Bool)

(assert (=> b!523279 m!504357))

(assert (=> b!523272 m!504341))

(declare-fun m!504359 () Bool)

(assert (=> b!523272 m!504359))

(declare-fun m!504361 () Bool)

(assert (=> b!523272 m!504361))

(declare-fun m!504363 () Bool)

(assert (=> b!523272 m!504363))

(declare-fun m!504365 () Bool)

(assert (=> b!523272 m!504365))

(assert (=> b!523272 m!504341))

(declare-fun m!504367 () Bool)

(assert (=> b!523272 m!504367))

(assert (=> b!523272 m!504341))

(declare-fun m!504369 () Bool)

(assert (=> b!523272 m!504369))

(declare-fun m!504371 () Bool)

(assert (=> b!523272 m!504371))

(declare-fun m!504373 () Bool)

(assert (=> b!523272 m!504373))

(declare-fun m!504375 () Bool)

(assert (=> b!523283 m!504375))

(declare-fun m!504377 () Bool)

(assert (=> b!523277 m!504377))

(check-sat (not b!523282) (not start!47534) (not b!523272) (not b!523279) (not b!523278) (not b!523283) (not b!523274) (not b!523284) (not b!523277) (not b!523275))
(check-sat)
(get-model)

(declare-fun b!523382 () Bool)

(declare-fun e!305224 () SeekEntryResult!4426)

(declare-fun lt!240191 () SeekEntryResult!4426)

(assert (=> b!523382 (= e!305224 (MissingZero!4426 (index!19912 lt!240191)))))

(declare-fun b!523383 () Bool)

(declare-fun e!305225 () SeekEntryResult!4426)

(assert (=> b!523383 (= e!305225 Undefined!4426)))

(declare-fun b!523384 () Bool)

(declare-fun c!61603 () Bool)

(declare-fun lt!240192 () (_ BitVec 64))

(assert (=> b!523384 (= c!61603 (= lt!240192 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!305226 () SeekEntryResult!4426)

(assert (=> b!523384 (= e!305226 e!305224)))

(declare-fun b!523385 () Bool)

(assert (=> b!523385 (= e!305225 e!305226)))

(assert (=> b!523385 (= lt!240192 (select (arr!16003 a!3235) (index!19912 lt!240191)))))

(declare-fun c!61604 () Bool)

(assert (=> b!523385 (= c!61604 (= lt!240192 k0!2280))))

(declare-fun b!523386 () Bool)

(assert (=> b!523386 (= e!305226 (Found!4426 (index!19912 lt!240191)))))

(declare-fun d!80555 () Bool)

(declare-fun lt!240193 () SeekEntryResult!4426)

(assert (=> d!80555 (and (or ((_ is Undefined!4426) lt!240193) (not ((_ is Found!4426) lt!240193)) (and (bvsge (index!19911 lt!240193) #b00000000000000000000000000000000) (bvslt (index!19911 lt!240193) (size!16367 a!3235)))) (or ((_ is Undefined!4426) lt!240193) ((_ is Found!4426) lt!240193) (not ((_ is MissingZero!4426) lt!240193)) (and (bvsge (index!19910 lt!240193) #b00000000000000000000000000000000) (bvslt (index!19910 lt!240193) (size!16367 a!3235)))) (or ((_ is Undefined!4426) lt!240193) ((_ is Found!4426) lt!240193) ((_ is MissingZero!4426) lt!240193) (not ((_ is MissingVacant!4426) lt!240193)) (and (bvsge (index!19913 lt!240193) #b00000000000000000000000000000000) (bvslt (index!19913 lt!240193) (size!16367 a!3235)))) (or ((_ is Undefined!4426) lt!240193) (ite ((_ is Found!4426) lt!240193) (= (select (arr!16003 a!3235) (index!19911 lt!240193)) k0!2280) (ite ((_ is MissingZero!4426) lt!240193) (= (select (arr!16003 a!3235) (index!19910 lt!240193)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4426) lt!240193) (= (select (arr!16003 a!3235) (index!19913 lt!240193)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80555 (= lt!240193 e!305225)))

(declare-fun c!61602 () Bool)

(assert (=> d!80555 (= c!61602 (and ((_ is Intermediate!4426) lt!240191) (undefined!5238 lt!240191)))))

(assert (=> d!80555 (= lt!240191 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!80555 (validMask!0 mask!3524)))

(assert (=> d!80555 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!240193)))

(declare-fun b!523387 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33298 (_ BitVec 32)) SeekEntryResult!4426)

(assert (=> b!523387 (= e!305224 (seekKeyOrZeroReturnVacant!0 (x!49034 lt!240191) (index!19912 lt!240191) (index!19912 lt!240191) k0!2280 a!3235 mask!3524))))

(assert (= (and d!80555 c!61602) b!523383))

(assert (= (and d!80555 (not c!61602)) b!523385))

(assert (= (and b!523385 c!61604) b!523386))

(assert (= (and b!523385 (not c!61604)) b!523384))

(assert (= (and b!523384 c!61603) b!523382))

(assert (= (and b!523384 (not c!61603)) b!523387))

(declare-fun m!504463 () Bool)

(assert (=> b!523385 m!504463))

(assert (=> d!80555 m!504347))

(declare-fun m!504465 () Bool)

(assert (=> d!80555 m!504465))

(declare-fun m!504467 () Bool)

(assert (=> d!80555 m!504467))

(declare-fun m!504469 () Bool)

(assert (=> d!80555 m!504469))

(declare-fun m!504471 () Bool)

(assert (=> d!80555 m!504471))

(declare-fun m!504473 () Bool)

(assert (=> d!80555 m!504473))

(assert (=> d!80555 m!504471))

(declare-fun m!504475 () Bool)

(assert (=> b!523387 m!504475))

(assert (=> b!523279 d!80555))

(declare-fun b!523398 () Bool)

(declare-fun e!305237 () Bool)

(declare-fun e!305235 () Bool)

(assert (=> b!523398 (= e!305237 e!305235)))

(declare-fun res!320791 () Bool)

(assert (=> b!523398 (=> (not res!320791) (not e!305235))))

(declare-fun e!305236 () Bool)

(assert (=> b!523398 (= res!320791 (not e!305236))))

(declare-fun res!320790 () Bool)

(assert (=> b!523398 (=> (not res!320790) (not e!305236))))

(assert (=> b!523398 (= res!320790 (validKeyInArray!0 (select (arr!16003 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!523399 () Bool)

(declare-fun e!305238 () Bool)

(assert (=> b!523399 (= e!305235 e!305238)))

(declare-fun c!61607 () Bool)

(assert (=> b!523399 (= c!61607 (validKeyInArray!0 (select (arr!16003 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!523400 () Bool)

(declare-fun call!31818 () Bool)

(assert (=> b!523400 (= e!305238 call!31818)))

(declare-fun d!80557 () Bool)

(declare-fun res!320789 () Bool)

(assert (=> d!80557 (=> res!320789 e!305237)))

(assert (=> d!80557 (= res!320789 (bvsge #b00000000000000000000000000000000 (size!16367 a!3235)))))

(assert (=> d!80557 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10065) e!305237)))

(declare-fun bm!31815 () Bool)

(assert (=> bm!31815 (= call!31818 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!61607 (Cons!10064 (select (arr!16003 a!3235) #b00000000000000000000000000000000) Nil!10065) Nil!10065)))))

(declare-fun b!523401 () Bool)

(assert (=> b!523401 (= e!305238 call!31818)))

(declare-fun b!523402 () Bool)

(declare-fun contains!2745 (List!10068 (_ BitVec 64)) Bool)

(assert (=> b!523402 (= e!305236 (contains!2745 Nil!10065 (select (arr!16003 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!80557 (not res!320789)) b!523398))

(assert (= (and b!523398 res!320790) b!523402))

(assert (= (and b!523398 res!320791) b!523399))

(assert (= (and b!523399 c!61607) b!523401))

(assert (= (and b!523399 (not c!61607)) b!523400))

(assert (= (or b!523401 b!523400) bm!31815))

(declare-fun m!504477 () Bool)

(assert (=> b!523398 m!504477))

(assert (=> b!523398 m!504477))

(declare-fun m!504479 () Bool)

(assert (=> b!523398 m!504479))

(assert (=> b!523399 m!504477))

(assert (=> b!523399 m!504477))

(assert (=> b!523399 m!504479))

(assert (=> bm!31815 m!504477))

(declare-fun m!504481 () Bool)

(assert (=> bm!31815 m!504481))

(assert (=> b!523402 m!504477))

(assert (=> b!523402 m!504477))

(declare-fun m!504483 () Bool)

(assert (=> b!523402 m!504483))

(assert (=> b!523274 d!80557))

(declare-fun b!523411 () Bool)

(declare-fun e!305245 () Bool)

(declare-fun e!305247 () Bool)

(assert (=> b!523411 (= e!305245 e!305247)))

(declare-fun lt!240202 () (_ BitVec 64))

(assert (=> b!523411 (= lt!240202 (select (arr!16003 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!240201 () Unit!16315)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33298 (_ BitVec 64) (_ BitVec 32)) Unit!16315)

(assert (=> b!523411 (= lt!240201 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!240202 #b00000000000000000000000000000000))))

(assert (=> b!523411 (arrayContainsKey!0 a!3235 lt!240202 #b00000000000000000000000000000000)))

(declare-fun lt!240200 () Unit!16315)

(assert (=> b!523411 (= lt!240200 lt!240201)))

(declare-fun res!320797 () Bool)

(assert (=> b!523411 (= res!320797 (= (seekEntryOrOpen!0 (select (arr!16003 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4426 #b00000000000000000000000000000000)))))

(assert (=> b!523411 (=> (not res!320797) (not e!305247))))

(declare-fun b!523412 () Bool)

(declare-fun call!31821 () Bool)

(assert (=> b!523412 (= e!305245 call!31821)))

(declare-fun b!523413 () Bool)

(declare-fun e!305246 () Bool)

(assert (=> b!523413 (= e!305246 e!305245)))

(declare-fun c!61610 () Bool)

(assert (=> b!523413 (= c!61610 (validKeyInArray!0 (select (arr!16003 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!80559 () Bool)

(declare-fun res!320796 () Bool)

(assert (=> d!80559 (=> res!320796 e!305246)))

(assert (=> d!80559 (= res!320796 (bvsge #b00000000000000000000000000000000 (size!16367 a!3235)))))

(assert (=> d!80559 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!305246)))

(declare-fun bm!31818 () Bool)

(assert (=> bm!31818 (= call!31821 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!523414 () Bool)

(assert (=> b!523414 (= e!305247 call!31821)))

(assert (= (and d!80559 (not res!320796)) b!523413))

(assert (= (and b!523413 c!61610) b!523411))

(assert (= (and b!523413 (not c!61610)) b!523412))

(assert (= (and b!523411 res!320797) b!523414))

(assert (= (or b!523414 b!523412) bm!31818))

(assert (=> b!523411 m!504477))

(declare-fun m!504485 () Bool)

(assert (=> b!523411 m!504485))

(declare-fun m!504487 () Bool)

(assert (=> b!523411 m!504487))

(assert (=> b!523411 m!504477))

(declare-fun m!504489 () Bool)

(assert (=> b!523411 m!504489))

(assert (=> b!523413 m!504477))

(assert (=> b!523413 m!504477))

(assert (=> b!523413 m!504479))

(declare-fun m!504491 () Bool)

(assert (=> bm!31818 m!504491))

(assert (=> b!523283 d!80559))

(declare-fun d!80561 () Bool)

(assert (=> d!80561 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47534 d!80561))

(declare-fun d!80563 () Bool)

(assert (=> d!80563 (= (array_inv!11862 a!3235) (bvsge (size!16367 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47534 d!80563))

(declare-fun d!80565 () Bool)

(declare-fun res!320802 () Bool)

(declare-fun e!305252 () Bool)

(assert (=> d!80565 (=> res!320802 e!305252)))

(assert (=> d!80565 (= res!320802 (= (select (arr!16003 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!80565 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!305252)))

(declare-fun b!523419 () Bool)

(declare-fun e!305253 () Bool)

(assert (=> b!523419 (= e!305252 e!305253)))

(declare-fun res!320803 () Bool)

(assert (=> b!523419 (=> (not res!320803) (not e!305253))))

(assert (=> b!523419 (= res!320803 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16367 a!3235)))))

(declare-fun b!523420 () Bool)

(assert (=> b!523420 (= e!305253 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80565 (not res!320802)) b!523419))

(assert (= (and b!523419 res!320803) b!523420))

(assert (=> d!80565 m!504477))

(declare-fun m!504493 () Bool)

(assert (=> b!523420 m!504493))

(assert (=> b!523278 d!80565))

(declare-fun d!80567 () Bool)

(declare-fun e!305256 () Bool)

(assert (=> d!80567 e!305256))

(declare-fun res!320806 () Bool)

(assert (=> d!80567 (=> (not res!320806) (not e!305256))))

(assert (=> d!80567 (= res!320806 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16367 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16367 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16367 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16367 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16367 a!3235))))))

(declare-fun lt!240205 () Unit!16315)

(declare-fun choose!47 (array!33298 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16315)

(assert (=> d!80567 (= lt!240205 (choose!47 a!3235 i!1204 k0!2280 j!176 lt!240128 #b00000000000000000000000000000000 (index!19912 lt!240130) (x!49034 lt!240130) mask!3524))))

(assert (=> d!80567 (validMask!0 mask!3524)))

(assert (=> d!80567 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!240128 #b00000000000000000000000000000000 (index!19912 lt!240130) (x!49034 lt!240130) mask!3524) lt!240205)))

(declare-fun b!523423 () Bool)

(assert (=> b!523423 (= e!305256 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240128 (select (store (arr!16003 a!3235) i!1204 k0!2280) j!176) (array!33299 (store (arr!16003 a!3235) i!1204 k0!2280) (size!16367 a!3235)) mask!3524) (Intermediate!4426 false (index!19912 lt!240130) (x!49034 lt!240130))))))

(assert (= (and d!80567 res!320806) b!523423))

(declare-fun m!504495 () Bool)

(assert (=> d!80567 m!504495))

(assert (=> d!80567 m!504347))

(assert (=> b!523423 m!504361))

(assert (=> b!523423 m!504365))

(assert (=> b!523423 m!504365))

(declare-fun m!504497 () Bool)

(assert (=> b!523423 m!504497))

(assert (=> b!523284 d!80567))

(declare-fun b!523444 () Bool)

(declare-fun lt!240210 () SeekEntryResult!4426)

(assert (=> b!523444 (and (bvsge (index!19912 lt!240210) #b00000000000000000000000000000000) (bvslt (index!19912 lt!240210) (size!16367 lt!240124)))))

(declare-fun e!305273 () Bool)

(assert (=> b!523444 (= e!305273 (= (select (arr!16003 lt!240124) (index!19912 lt!240210)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!523445 () Bool)

(declare-fun e!305272 () SeekEntryResult!4426)

(declare-fun e!305270 () SeekEntryResult!4426)

(assert (=> b!523445 (= e!305272 e!305270)))

(declare-fun c!61618 () Bool)

(declare-fun lt!240211 () (_ BitVec 64))

(assert (=> b!523445 (= c!61618 (or (= lt!240211 lt!240129) (= (bvadd lt!240211 lt!240211) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!80569 () Bool)

(declare-fun e!305269 () Bool)

(assert (=> d!80569 e!305269))

(declare-fun c!61619 () Bool)

(assert (=> d!80569 (= c!61619 (and ((_ is Intermediate!4426) lt!240210) (undefined!5238 lt!240210)))))

(assert (=> d!80569 (= lt!240210 e!305272)))

(declare-fun c!61617 () Bool)

(assert (=> d!80569 (= c!61617 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80569 (= lt!240211 (select (arr!16003 lt!240124) lt!240128))))

(assert (=> d!80569 (validMask!0 mask!3524)))

(assert (=> d!80569 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240128 lt!240129 lt!240124 mask!3524) lt!240210)))

(declare-fun b!523446 () Bool)

(assert (=> b!523446 (= e!305269 (bvsge (x!49034 lt!240210) #b01111111111111111111111111111110))))

(declare-fun b!523447 () Bool)

(assert (=> b!523447 (and (bvsge (index!19912 lt!240210) #b00000000000000000000000000000000) (bvslt (index!19912 lt!240210) (size!16367 lt!240124)))))

(declare-fun res!320817 () Bool)

(assert (=> b!523447 (= res!320817 (= (select (arr!16003 lt!240124) (index!19912 lt!240210)) lt!240129))))

(assert (=> b!523447 (=> res!320817 e!305273)))

(declare-fun e!305271 () Bool)

(assert (=> b!523447 (= e!305271 e!305273)))

(declare-fun b!523448 () Bool)

(assert (=> b!523448 (and (bvsge (index!19912 lt!240210) #b00000000000000000000000000000000) (bvslt (index!19912 lt!240210) (size!16367 lt!240124)))))

(declare-fun res!320815 () Bool)

(assert (=> b!523448 (= res!320815 (= (select (arr!16003 lt!240124) (index!19912 lt!240210)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!523448 (=> res!320815 e!305273)))

(declare-fun b!523449 () Bool)

(assert (=> b!523449 (= e!305270 (Intermediate!4426 false lt!240128 #b00000000000000000000000000000000))))

(declare-fun b!523450 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!523450 (= e!305270 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!240128 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) lt!240129 lt!240124 mask!3524))))

(declare-fun b!523451 () Bool)

(assert (=> b!523451 (= e!305272 (Intermediate!4426 true lt!240128 #b00000000000000000000000000000000))))

(declare-fun b!523452 () Bool)

(assert (=> b!523452 (= e!305269 e!305271)))

(declare-fun res!320818 () Bool)

(assert (=> b!523452 (= res!320818 (and ((_ is Intermediate!4426) lt!240210) (not (undefined!5238 lt!240210)) (bvslt (x!49034 lt!240210) #b01111111111111111111111111111110) (bvsge (x!49034 lt!240210) #b00000000000000000000000000000000) (bvsge (x!49034 lt!240210) #b00000000000000000000000000000000)))))

(assert (=> b!523452 (=> (not res!320818) (not e!305271))))

(assert (= (and d!80569 c!61617) b!523451))

(assert (= (and d!80569 (not c!61617)) b!523445))

(assert (= (and b!523445 c!61618) b!523449))

(assert (= (and b!523445 (not c!61618)) b!523450))

(assert (= (and d!80569 c!61619) b!523446))

(assert (= (and d!80569 (not c!61619)) b!523452))

(assert (= (and b!523452 res!320818) b!523447))

(assert (= (and b!523447 (not res!320817)) b!523448))

(assert (= (and b!523448 (not res!320815)) b!523444))

(declare-fun m!504499 () Bool)

(assert (=> b!523444 m!504499))

(declare-fun m!504501 () Bool)

(assert (=> d!80569 m!504501))

(assert (=> d!80569 m!504347))

(declare-fun m!504503 () Bool)

(assert (=> b!523450 m!504503))

(assert (=> b!523450 m!504503))

(declare-fun m!504505 () Bool)

(assert (=> b!523450 m!504505))

(assert (=> b!523448 m!504499))

(assert (=> b!523447 m!504499))

(assert (=> b!523284 d!80569))

(declare-fun b!523459 () Bool)

(declare-fun e!305278 () SeekEntryResult!4426)

(declare-fun lt!240218 () SeekEntryResult!4426)

(assert (=> b!523459 (= e!305278 (MissingZero!4426 (index!19912 lt!240218)))))

(declare-fun b!523460 () Bool)

(declare-fun e!305279 () SeekEntryResult!4426)

(assert (=> b!523460 (= e!305279 Undefined!4426)))

(declare-fun b!523461 () Bool)

(declare-fun c!61623 () Bool)

(declare-fun lt!240219 () (_ BitVec 64))

(assert (=> b!523461 (= c!61623 (= lt!240219 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!305280 () SeekEntryResult!4426)

(assert (=> b!523461 (= e!305280 e!305278)))

(declare-fun b!523462 () Bool)

(assert (=> b!523462 (= e!305279 e!305280)))

(assert (=> b!523462 (= lt!240219 (select (arr!16003 a!3235) (index!19912 lt!240218)))))

(declare-fun c!61624 () Bool)

(assert (=> b!523462 (= c!61624 (= lt!240219 (select (arr!16003 a!3235) j!176)))))

(declare-fun b!523463 () Bool)

(assert (=> b!523463 (= e!305280 (Found!4426 (index!19912 lt!240218)))))

(declare-fun d!80575 () Bool)

(declare-fun lt!240220 () SeekEntryResult!4426)

(assert (=> d!80575 (and (or ((_ is Undefined!4426) lt!240220) (not ((_ is Found!4426) lt!240220)) (and (bvsge (index!19911 lt!240220) #b00000000000000000000000000000000) (bvslt (index!19911 lt!240220) (size!16367 a!3235)))) (or ((_ is Undefined!4426) lt!240220) ((_ is Found!4426) lt!240220) (not ((_ is MissingZero!4426) lt!240220)) (and (bvsge (index!19910 lt!240220) #b00000000000000000000000000000000) (bvslt (index!19910 lt!240220) (size!16367 a!3235)))) (or ((_ is Undefined!4426) lt!240220) ((_ is Found!4426) lt!240220) ((_ is MissingZero!4426) lt!240220) (not ((_ is MissingVacant!4426) lt!240220)) (and (bvsge (index!19913 lt!240220) #b00000000000000000000000000000000) (bvslt (index!19913 lt!240220) (size!16367 a!3235)))) (or ((_ is Undefined!4426) lt!240220) (ite ((_ is Found!4426) lt!240220) (= (select (arr!16003 a!3235) (index!19911 lt!240220)) (select (arr!16003 a!3235) j!176)) (ite ((_ is MissingZero!4426) lt!240220) (= (select (arr!16003 a!3235) (index!19910 lt!240220)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4426) lt!240220) (= (select (arr!16003 a!3235) (index!19913 lt!240220)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80575 (= lt!240220 e!305279)))

(declare-fun c!61622 () Bool)

(assert (=> d!80575 (= c!61622 (and ((_ is Intermediate!4426) lt!240218) (undefined!5238 lt!240218)))))

(assert (=> d!80575 (= lt!240218 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16003 a!3235) j!176) mask!3524) (select (arr!16003 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!80575 (validMask!0 mask!3524)))

(assert (=> d!80575 (= (seekEntryOrOpen!0 (select (arr!16003 a!3235) j!176) a!3235 mask!3524) lt!240220)))

(declare-fun b!523464 () Bool)

(assert (=> b!523464 (= e!305278 (seekKeyOrZeroReturnVacant!0 (x!49034 lt!240218) (index!19912 lt!240218) (index!19912 lt!240218) (select (arr!16003 a!3235) j!176) a!3235 mask!3524))))

(assert (= (and d!80575 c!61622) b!523460))

(assert (= (and d!80575 (not c!61622)) b!523462))

(assert (= (and b!523462 c!61624) b!523463))

(assert (= (and b!523462 (not c!61624)) b!523461))

(assert (= (and b!523461 c!61623) b!523459))

(assert (= (and b!523461 (not c!61623)) b!523464))

(declare-fun m!504507 () Bool)

(assert (=> b!523462 m!504507))

(assert (=> d!80575 m!504347))

(declare-fun m!504509 () Bool)

(assert (=> d!80575 m!504509))

(declare-fun m!504511 () Bool)

(assert (=> d!80575 m!504511))

(declare-fun m!504513 () Bool)

(assert (=> d!80575 m!504513))

(assert (=> d!80575 m!504367))

(assert (=> d!80575 m!504341))

(declare-fun m!504515 () Bool)

(assert (=> d!80575 m!504515))

(assert (=> d!80575 m!504341))

(assert (=> d!80575 m!504367))

(assert (=> b!523464 m!504341))

(declare-fun m!504517 () Bool)

(assert (=> b!523464 m!504517))

(assert (=> b!523282 d!80575))

(declare-fun d!80577 () Bool)

(assert (=> d!80577 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!523277 d!80577))

(declare-fun d!80579 () Bool)

(declare-fun lt!240235 () (_ BitVec 32))

(declare-fun lt!240234 () (_ BitVec 32))

(assert (=> d!80579 (= lt!240235 (bvmul (bvxor lt!240234 (bvlshr lt!240234 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80579 (= lt!240234 ((_ extract 31 0) (bvand (bvxor (select (arr!16003 a!3235) j!176) (bvlshr (select (arr!16003 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80579 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!320823 (let ((h!10993 ((_ extract 31 0) (bvand (bvxor (select (arr!16003 a!3235) j!176) (bvlshr (select (arr!16003 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49040 (bvmul (bvxor h!10993 (bvlshr h!10993 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49040 (bvlshr x!49040 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!320823 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!320823 #b00000000000000000000000000000000))))))

(assert (=> d!80579 (= (toIndex!0 (select (arr!16003 a!3235) j!176) mask!3524) (bvand (bvxor lt!240235 (bvlshr lt!240235 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!523272 d!80579))

(declare-fun b!523469 () Bool)

(declare-fun e!305284 () Bool)

(declare-fun e!305286 () Bool)

(assert (=> b!523469 (= e!305284 e!305286)))

(declare-fun lt!240238 () (_ BitVec 64))

(assert (=> b!523469 (= lt!240238 (select (arr!16003 a!3235) j!176))))

(declare-fun lt!240237 () Unit!16315)

(assert (=> b!523469 (= lt!240237 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!240238 j!176))))

(assert (=> b!523469 (arrayContainsKey!0 a!3235 lt!240238 #b00000000000000000000000000000000)))

(declare-fun lt!240236 () Unit!16315)

(assert (=> b!523469 (= lt!240236 lt!240237)))

(declare-fun res!320825 () Bool)

(assert (=> b!523469 (= res!320825 (= (seekEntryOrOpen!0 (select (arr!16003 a!3235) j!176) a!3235 mask!3524) (Found!4426 j!176)))))

(assert (=> b!523469 (=> (not res!320825) (not e!305286))))

(declare-fun b!523470 () Bool)

(declare-fun call!31825 () Bool)

(assert (=> b!523470 (= e!305284 call!31825)))

(declare-fun b!523471 () Bool)

(declare-fun e!305285 () Bool)

(assert (=> b!523471 (= e!305285 e!305284)))

(declare-fun c!61626 () Bool)

(assert (=> b!523471 (= c!61626 (validKeyInArray!0 (select (arr!16003 a!3235) j!176)))))

(declare-fun d!80585 () Bool)

(declare-fun res!320824 () Bool)

(assert (=> d!80585 (=> res!320824 e!305285)))

(assert (=> d!80585 (= res!320824 (bvsge j!176 (size!16367 a!3235)))))

(assert (=> d!80585 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!305285)))

(declare-fun bm!31822 () Bool)

(assert (=> bm!31822 (= call!31825 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!523472 () Bool)

(assert (=> b!523472 (= e!305286 call!31825)))

(assert (= (and d!80585 (not res!320824)) b!523471))

(assert (= (and b!523471 c!61626) b!523469))

(assert (= (and b!523471 (not c!61626)) b!523470))

(assert (= (and b!523469 res!320825) b!523472))

(assert (= (or b!523472 b!523470) bm!31822))

(assert (=> b!523469 m!504341))

(declare-fun m!504531 () Bool)

(assert (=> b!523469 m!504531))

(declare-fun m!504533 () Bool)

(assert (=> b!523469 m!504533))

(assert (=> b!523469 m!504341))

(assert (=> b!523469 m!504343))

(assert (=> b!523471 m!504341))

(assert (=> b!523471 m!504341))

(assert (=> b!523471 m!504353))

(declare-fun m!504535 () Bool)

(assert (=> bm!31822 m!504535))

(assert (=> b!523272 d!80585))

(declare-fun b!523473 () Bool)

(declare-fun lt!240239 () SeekEntryResult!4426)

(assert (=> b!523473 (and (bvsge (index!19912 lt!240239) #b00000000000000000000000000000000) (bvslt (index!19912 lt!240239) (size!16367 a!3235)))))

(declare-fun e!305291 () Bool)

(assert (=> b!523473 (= e!305291 (= (select (arr!16003 a!3235) (index!19912 lt!240239)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!523474 () Bool)

(declare-fun e!305290 () SeekEntryResult!4426)

(declare-fun e!305288 () SeekEntryResult!4426)

(assert (=> b!523474 (= e!305290 e!305288)))

(declare-fun c!61628 () Bool)

(declare-fun lt!240240 () (_ BitVec 64))

(assert (=> b!523474 (= c!61628 (or (= lt!240240 (select (arr!16003 a!3235) j!176)) (= (bvadd lt!240240 lt!240240) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!80587 () Bool)

(declare-fun e!305287 () Bool)

(assert (=> d!80587 e!305287))

(declare-fun c!61629 () Bool)

(assert (=> d!80587 (= c!61629 (and ((_ is Intermediate!4426) lt!240239) (undefined!5238 lt!240239)))))

(assert (=> d!80587 (= lt!240239 e!305290)))

(declare-fun c!61627 () Bool)

(assert (=> d!80587 (= c!61627 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80587 (= lt!240240 (select (arr!16003 a!3235) lt!240128))))

(assert (=> d!80587 (validMask!0 mask!3524)))

(assert (=> d!80587 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240128 (select (arr!16003 a!3235) j!176) a!3235 mask!3524) lt!240239)))

(declare-fun b!523475 () Bool)

(assert (=> b!523475 (= e!305287 (bvsge (x!49034 lt!240239) #b01111111111111111111111111111110))))

(declare-fun b!523476 () Bool)

(assert (=> b!523476 (and (bvsge (index!19912 lt!240239) #b00000000000000000000000000000000) (bvslt (index!19912 lt!240239) (size!16367 a!3235)))))

(declare-fun res!320827 () Bool)

(assert (=> b!523476 (= res!320827 (= (select (arr!16003 a!3235) (index!19912 lt!240239)) (select (arr!16003 a!3235) j!176)))))

(assert (=> b!523476 (=> res!320827 e!305291)))

(declare-fun e!305289 () Bool)

(assert (=> b!523476 (= e!305289 e!305291)))

(declare-fun b!523477 () Bool)

(assert (=> b!523477 (and (bvsge (index!19912 lt!240239) #b00000000000000000000000000000000) (bvslt (index!19912 lt!240239) (size!16367 a!3235)))))

(declare-fun res!320826 () Bool)

(assert (=> b!523477 (= res!320826 (= (select (arr!16003 a!3235) (index!19912 lt!240239)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!523477 (=> res!320826 e!305291)))

(declare-fun b!523478 () Bool)

(assert (=> b!523478 (= e!305288 (Intermediate!4426 false lt!240128 #b00000000000000000000000000000000))))

(declare-fun b!523479 () Bool)

(assert (=> b!523479 (= e!305288 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!240128 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (arr!16003 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!523480 () Bool)

(assert (=> b!523480 (= e!305290 (Intermediate!4426 true lt!240128 #b00000000000000000000000000000000))))

(declare-fun b!523481 () Bool)

(assert (=> b!523481 (= e!305287 e!305289)))

(declare-fun res!320828 () Bool)

(assert (=> b!523481 (= res!320828 (and ((_ is Intermediate!4426) lt!240239) (not (undefined!5238 lt!240239)) (bvslt (x!49034 lt!240239) #b01111111111111111111111111111110) (bvsge (x!49034 lt!240239) #b00000000000000000000000000000000) (bvsge (x!49034 lt!240239) #b00000000000000000000000000000000)))))

(assert (=> b!523481 (=> (not res!320828) (not e!305289))))

(assert (= (and d!80587 c!61627) b!523480))

(assert (= (and d!80587 (not c!61627)) b!523474))

(assert (= (and b!523474 c!61628) b!523478))

(assert (= (and b!523474 (not c!61628)) b!523479))

(assert (= (and d!80587 c!61629) b!523475))

(assert (= (and d!80587 (not c!61629)) b!523481))

(assert (= (and b!523481 res!320828) b!523476))

(assert (= (and b!523476 (not res!320827)) b!523477))

(assert (= (and b!523477 (not res!320826)) b!523473))

(declare-fun m!504537 () Bool)

(assert (=> b!523473 m!504537))

(declare-fun m!504539 () Bool)

(assert (=> d!80587 m!504539))

(assert (=> d!80587 m!504347))

(assert (=> b!523479 m!504503))

(assert (=> b!523479 m!504503))

(assert (=> b!523479 m!504341))

(declare-fun m!504541 () Bool)

(assert (=> b!523479 m!504541))

(assert (=> b!523477 m!504537))

(assert (=> b!523476 m!504537))

(assert (=> b!523272 d!80587))

(declare-fun d!80589 () Bool)

(declare-fun lt!240242 () (_ BitVec 32))

(declare-fun lt!240241 () (_ BitVec 32))

(assert (=> d!80589 (= lt!240242 (bvmul (bvxor lt!240241 (bvlshr lt!240241 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80589 (= lt!240241 ((_ extract 31 0) (bvand (bvxor lt!240129 (bvlshr lt!240129 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80589 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!320823 (let ((h!10993 ((_ extract 31 0) (bvand (bvxor lt!240129 (bvlshr lt!240129 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49040 (bvmul (bvxor h!10993 (bvlshr h!10993 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49040 (bvlshr x!49040 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!320823 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!320823 #b00000000000000000000000000000000))))))

(assert (=> d!80589 (= (toIndex!0 lt!240129 mask!3524) (bvand (bvxor lt!240242 (bvlshr lt!240242 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!523272 d!80589))

(declare-fun d!80591 () Bool)

(assert (=> d!80591 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!240245 () Unit!16315)

(declare-fun choose!38 (array!33298 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16315)

(assert (=> d!80591 (= lt!240245 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80591 (validMask!0 mask!3524)))

(assert (=> d!80591 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!240245)))

(declare-fun bs!16466 () Bool)

(assert (= bs!16466 d!80591))

(assert (=> bs!16466 m!504371))

(declare-fun m!504543 () Bool)

(assert (=> bs!16466 m!504543))

(assert (=> bs!16466 m!504347))

(assert (=> b!523272 d!80591))

(declare-fun b!523482 () Bool)

(declare-fun lt!240246 () SeekEntryResult!4426)

(assert (=> b!523482 (and (bvsge (index!19912 lt!240246) #b00000000000000000000000000000000) (bvslt (index!19912 lt!240246) (size!16367 lt!240124)))))

(declare-fun e!305296 () Bool)

(assert (=> b!523482 (= e!305296 (= (select (arr!16003 lt!240124) (index!19912 lt!240246)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!523483 () Bool)

(declare-fun e!305295 () SeekEntryResult!4426)

(declare-fun e!305293 () SeekEntryResult!4426)

(assert (=> b!523483 (= e!305295 e!305293)))

(declare-fun c!61631 () Bool)

(declare-fun lt!240247 () (_ BitVec 64))

(assert (=> b!523483 (= c!61631 (or (= lt!240247 lt!240129) (= (bvadd lt!240247 lt!240247) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!80593 () Bool)

(declare-fun e!305292 () Bool)

(assert (=> d!80593 e!305292))

(declare-fun c!61632 () Bool)

(assert (=> d!80593 (= c!61632 (and ((_ is Intermediate!4426) lt!240246) (undefined!5238 lt!240246)))))

(assert (=> d!80593 (= lt!240246 e!305295)))

(declare-fun c!61630 () Bool)

(assert (=> d!80593 (= c!61630 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80593 (= lt!240247 (select (arr!16003 lt!240124) lt!240126))))

(assert (=> d!80593 (validMask!0 mask!3524)))

(assert (=> d!80593 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240126 lt!240129 lt!240124 mask!3524) lt!240246)))

(declare-fun b!523484 () Bool)

(assert (=> b!523484 (= e!305292 (bvsge (x!49034 lt!240246) #b01111111111111111111111111111110))))

(declare-fun b!523485 () Bool)

(assert (=> b!523485 (and (bvsge (index!19912 lt!240246) #b00000000000000000000000000000000) (bvslt (index!19912 lt!240246) (size!16367 lt!240124)))))

(declare-fun res!320830 () Bool)

(assert (=> b!523485 (= res!320830 (= (select (arr!16003 lt!240124) (index!19912 lt!240246)) lt!240129))))

(assert (=> b!523485 (=> res!320830 e!305296)))

(declare-fun e!305294 () Bool)

(assert (=> b!523485 (= e!305294 e!305296)))

(declare-fun b!523486 () Bool)

(assert (=> b!523486 (and (bvsge (index!19912 lt!240246) #b00000000000000000000000000000000) (bvslt (index!19912 lt!240246) (size!16367 lt!240124)))))

(declare-fun res!320829 () Bool)

(assert (=> b!523486 (= res!320829 (= (select (arr!16003 lt!240124) (index!19912 lt!240246)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!523486 (=> res!320829 e!305296)))

(declare-fun b!523487 () Bool)

(assert (=> b!523487 (= e!305293 (Intermediate!4426 false lt!240126 #b00000000000000000000000000000000))))

(declare-fun b!523488 () Bool)

(assert (=> b!523488 (= e!305293 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!240126 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) lt!240129 lt!240124 mask!3524))))

(declare-fun b!523489 () Bool)

(assert (=> b!523489 (= e!305295 (Intermediate!4426 true lt!240126 #b00000000000000000000000000000000))))

(declare-fun b!523490 () Bool)

(assert (=> b!523490 (= e!305292 e!305294)))

(declare-fun res!320831 () Bool)

(assert (=> b!523490 (= res!320831 (and ((_ is Intermediate!4426) lt!240246) (not (undefined!5238 lt!240246)) (bvslt (x!49034 lt!240246) #b01111111111111111111111111111110) (bvsge (x!49034 lt!240246) #b00000000000000000000000000000000) (bvsge (x!49034 lt!240246) #b00000000000000000000000000000000)))))

(assert (=> b!523490 (=> (not res!320831) (not e!305294))))

(assert (= (and d!80593 c!61630) b!523489))

(assert (= (and d!80593 (not c!61630)) b!523483))

(assert (= (and b!523483 c!61631) b!523487))

(assert (= (and b!523483 (not c!61631)) b!523488))

(assert (= (and d!80593 c!61632) b!523484))

(assert (= (and d!80593 (not c!61632)) b!523490))

(assert (= (and b!523490 res!320831) b!523485))

(assert (= (and b!523485 (not res!320830)) b!523486))

(assert (= (and b!523486 (not res!320829)) b!523482))

(declare-fun m!504545 () Bool)

(assert (=> b!523482 m!504545))

(declare-fun m!504547 () Bool)

(assert (=> d!80593 m!504547))

(assert (=> d!80593 m!504347))

(declare-fun m!504549 () Bool)

(assert (=> b!523488 m!504549))

(assert (=> b!523488 m!504549))

(declare-fun m!504551 () Bool)

(assert (=> b!523488 m!504551))

(assert (=> b!523486 m!504545))

(assert (=> b!523485 m!504545))

(assert (=> b!523272 d!80593))

(declare-fun d!80595 () Bool)

(assert (=> d!80595 (= (validKeyInArray!0 (select (arr!16003 a!3235) j!176)) (and (not (= (select (arr!16003 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16003 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!523275 d!80595))

(check-sat (not d!80555) (not b!523469) (not bm!31815) (not d!80587) (not b!523488) (not d!80593) (not d!80575) (not b!523464) (not d!80567) (not b!523423) (not b!523402) (not bm!31818) (not b!523413) (not b!523420) (not b!523479) (not bm!31822) (not b!523398) (not d!80591) (not b!523450) (not b!523471) (not b!523387) (not d!80569) (not b!523411) (not b!523399))
(check-sat)
