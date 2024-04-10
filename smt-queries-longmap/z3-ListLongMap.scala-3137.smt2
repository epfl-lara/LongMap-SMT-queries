; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44156 () Bool)

(assert start!44156)

(declare-fun b!486271 () Bool)

(declare-fun e!286219 () Bool)

(declare-fun e!286221 () Bool)

(assert (=> b!486271 (= e!286219 e!286221)))

(declare-fun res!289806 () Bool)

(assert (=> b!486271 (=> (not res!289806) (not e!286221))))

(declare-datatypes ((SeekEntryResult!3609 0))(
  ( (MissingZero!3609 (index!16615 (_ BitVec 32))) (Found!3609 (index!16616 (_ BitVec 32))) (Intermediate!3609 (undefined!4421 Bool) (index!16617 (_ BitVec 32)) (x!45749 (_ BitVec 32))) (Undefined!3609) (MissingVacant!3609 (index!16618 (_ BitVec 32))) )
))
(declare-fun lt!219688 () SeekEntryResult!3609)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!486271 (= res!289806 (or (= lt!219688 (MissingZero!3609 i!1204)) (= lt!219688 (MissingVacant!3609 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31491 0))(
  ( (array!31492 (arr!15142 (Array (_ BitVec 32) (_ BitVec 64))) (size!15506 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31491)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31491 (_ BitVec 32)) SeekEntryResult!3609)

(assert (=> b!486271 (= lt!219688 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!486272 () Bool)

(declare-fun res!289804 () Bool)

(assert (=> b!486272 (=> (not res!289804) (not e!286221))))

(assert (=> b!486272 (= res!289804 (and (bvsle #b00000000000000000000000000000000 (size!15506 a!3235)) (bvslt (size!15506 a!3235) #b01111111111111111111111111111111)))))

(declare-fun b!486273 () Bool)

(declare-fun res!289805 () Bool)

(assert (=> b!486273 (=> (not res!289805) (not e!286219))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!486273 (= res!289805 (and (= (size!15506 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15506 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15506 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!486275 () Bool)

(declare-fun res!289807 () Bool)

(assert (=> b!486275 (=> (not res!289807) (not e!286221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31491 (_ BitVec 32)) Bool)

(assert (=> b!486275 (= res!289807 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!486276 () Bool)

(declare-fun res!289802 () Bool)

(assert (=> b!486276 (=> (not res!289802) (not e!286219))))

(declare-fun arrayContainsKey!0 (array!31491 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486276 (= res!289802 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!486277 () Bool)

(declare-fun res!289803 () Bool)

(assert (=> b!486277 (=> (not res!289803) (not e!286219))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486277 (= res!289803 (validKeyInArray!0 (select (arr!15142 a!3235) j!176)))))

(declare-fun b!486278 () Bool)

(declare-datatypes ((List!9300 0))(
  ( (Nil!9297) (Cons!9296 (h!10152 (_ BitVec 64)) (t!15528 List!9300)) )
))
(declare-fun noDuplicate!208 (List!9300) Bool)

(assert (=> b!486278 (= e!286221 (not (noDuplicate!208 Nil!9297)))))

(declare-fun b!486274 () Bool)

(declare-fun res!289808 () Bool)

(assert (=> b!486274 (=> (not res!289808) (not e!286219))))

(assert (=> b!486274 (= res!289808 (validKeyInArray!0 k0!2280))))

(declare-fun res!289801 () Bool)

(assert (=> start!44156 (=> (not res!289801) (not e!286219))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44156 (= res!289801 (validMask!0 mask!3524))))

(assert (=> start!44156 e!286219))

(assert (=> start!44156 true))

(declare-fun array_inv!10938 (array!31491) Bool)

(assert (=> start!44156 (array_inv!10938 a!3235)))

(assert (= (and start!44156 res!289801) b!486273))

(assert (= (and b!486273 res!289805) b!486277))

(assert (= (and b!486277 res!289803) b!486274))

(assert (= (and b!486274 res!289808) b!486276))

(assert (= (and b!486276 res!289802) b!486271))

(assert (= (and b!486271 res!289806) b!486275))

(assert (= (and b!486275 res!289807) b!486272))

(assert (= (and b!486272 res!289804) b!486278))

(declare-fun m!466263 () Bool)

(assert (=> b!486275 m!466263))

(declare-fun m!466265 () Bool)

(assert (=> b!486278 m!466265))

(declare-fun m!466267 () Bool)

(assert (=> b!486274 m!466267))

(declare-fun m!466269 () Bool)

(assert (=> b!486276 m!466269))

(declare-fun m!466271 () Bool)

(assert (=> start!44156 m!466271))

(declare-fun m!466273 () Bool)

(assert (=> start!44156 m!466273))

(declare-fun m!466275 () Bool)

(assert (=> b!486271 m!466275))

(declare-fun m!466277 () Bool)

(assert (=> b!486277 m!466277))

(assert (=> b!486277 m!466277))

(declare-fun m!466279 () Bool)

(assert (=> b!486277 m!466279))

(check-sat (not b!486278) (not b!486271) (not b!486275) (not b!486274) (not b!486277) (not b!486276) (not start!44156))
(check-sat)
(get-model)

(declare-fun d!77501 () Bool)

(assert (=> d!77501 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!486274 d!77501))

(declare-fun bm!31265 () Bool)

(declare-fun call!31268 () Bool)

(assert (=> bm!31265 (= call!31268 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!486311 () Bool)

(declare-fun e!286237 () Bool)

(declare-fun e!286239 () Bool)

(assert (=> b!486311 (= e!286237 e!286239)))

(declare-fun c!58505 () Bool)

(assert (=> b!486311 (= c!58505 (validKeyInArray!0 (select (arr!15142 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!77503 () Bool)

(declare-fun res!289838 () Bool)

(assert (=> d!77503 (=> res!289838 e!286237)))

(assert (=> d!77503 (= res!289838 (bvsge #b00000000000000000000000000000000 (size!15506 a!3235)))))

(assert (=> d!77503 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!286237)))

(declare-fun b!486312 () Bool)

(declare-fun e!286238 () Bool)

(assert (=> b!486312 (= e!286238 call!31268)))

(declare-fun b!486313 () Bool)

(assert (=> b!486313 (= e!286239 call!31268)))

(declare-fun b!486314 () Bool)

(assert (=> b!486314 (= e!286239 e!286238)))

(declare-fun lt!219698 () (_ BitVec 64))

(assert (=> b!486314 (= lt!219698 (select (arr!15142 a!3235) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!14192 0))(
  ( (Unit!14193) )
))
(declare-fun lt!219700 () Unit!14192)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31491 (_ BitVec 64) (_ BitVec 32)) Unit!14192)

(assert (=> b!486314 (= lt!219700 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!219698 #b00000000000000000000000000000000))))

(assert (=> b!486314 (arrayContainsKey!0 a!3235 lt!219698 #b00000000000000000000000000000000)))

(declare-fun lt!219699 () Unit!14192)

(assert (=> b!486314 (= lt!219699 lt!219700)))

(declare-fun res!289837 () Bool)

(assert (=> b!486314 (= res!289837 (= (seekEntryOrOpen!0 (select (arr!15142 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3609 #b00000000000000000000000000000000)))))

(assert (=> b!486314 (=> (not res!289837) (not e!286238))))

(assert (= (and d!77503 (not res!289838)) b!486311))

(assert (= (and b!486311 c!58505) b!486314))

(assert (= (and b!486311 (not c!58505)) b!486313))

(assert (= (and b!486314 res!289837) b!486312))

(assert (= (or b!486312 b!486313) bm!31265))

(declare-fun m!466299 () Bool)

(assert (=> bm!31265 m!466299))

(declare-fun m!466301 () Bool)

(assert (=> b!486311 m!466301))

(assert (=> b!486311 m!466301))

(declare-fun m!466303 () Bool)

(assert (=> b!486311 m!466303))

(assert (=> b!486314 m!466301))

(declare-fun m!466305 () Bool)

(assert (=> b!486314 m!466305))

(declare-fun m!466307 () Bool)

(assert (=> b!486314 m!466307))

(assert (=> b!486314 m!466301))

(declare-fun m!466309 () Bool)

(assert (=> b!486314 m!466309))

(assert (=> b!486275 d!77503))

(declare-fun b!486375 () Bool)

(declare-fun c!58526 () Bool)

(declare-fun lt!219725 () (_ BitVec 64))

(assert (=> b!486375 (= c!58526 (= lt!219725 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!286284 () SeekEntryResult!3609)

(declare-fun e!286282 () SeekEntryResult!3609)

(assert (=> b!486375 (= e!286284 e!286282)))

(declare-fun b!486376 () Bool)

(declare-fun lt!219726 () SeekEntryResult!3609)

(assert (=> b!486376 (= e!286284 (Found!3609 (index!16617 lt!219726)))))

(declare-fun d!77509 () Bool)

(declare-fun lt!219727 () SeekEntryResult!3609)

(get-info :version)

(assert (=> d!77509 (and (or ((_ is Undefined!3609) lt!219727) (not ((_ is Found!3609) lt!219727)) (and (bvsge (index!16616 lt!219727) #b00000000000000000000000000000000) (bvslt (index!16616 lt!219727) (size!15506 a!3235)))) (or ((_ is Undefined!3609) lt!219727) ((_ is Found!3609) lt!219727) (not ((_ is MissingZero!3609) lt!219727)) (and (bvsge (index!16615 lt!219727) #b00000000000000000000000000000000) (bvslt (index!16615 lt!219727) (size!15506 a!3235)))) (or ((_ is Undefined!3609) lt!219727) ((_ is Found!3609) lt!219727) ((_ is MissingZero!3609) lt!219727) (not ((_ is MissingVacant!3609) lt!219727)) (and (bvsge (index!16618 lt!219727) #b00000000000000000000000000000000) (bvslt (index!16618 lt!219727) (size!15506 a!3235)))) (or ((_ is Undefined!3609) lt!219727) (ite ((_ is Found!3609) lt!219727) (= (select (arr!15142 a!3235) (index!16616 lt!219727)) k0!2280) (ite ((_ is MissingZero!3609) lt!219727) (= (select (arr!15142 a!3235) (index!16615 lt!219727)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3609) lt!219727) (= (select (arr!15142 a!3235) (index!16618 lt!219727)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!286283 () SeekEntryResult!3609)

(assert (=> d!77509 (= lt!219727 e!286283)))

(declare-fun c!58524 () Bool)

(assert (=> d!77509 (= c!58524 (and ((_ is Intermediate!3609) lt!219726) (undefined!4421 lt!219726)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31491 (_ BitVec 32)) SeekEntryResult!3609)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!77509 (= lt!219726 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!77509 (validMask!0 mask!3524)))

(assert (=> d!77509 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!219727)))

(declare-fun b!486377 () Bool)

(assert (=> b!486377 (= e!286283 Undefined!3609)))

(declare-fun b!486378 () Bool)

(assert (=> b!486378 (= e!286282 (MissingZero!3609 (index!16617 lt!219726)))))

(declare-fun b!486379 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31491 (_ BitVec 32)) SeekEntryResult!3609)

(assert (=> b!486379 (= e!286282 (seekKeyOrZeroReturnVacant!0 (x!45749 lt!219726) (index!16617 lt!219726) (index!16617 lt!219726) k0!2280 a!3235 mask!3524))))

(declare-fun b!486380 () Bool)

(assert (=> b!486380 (= e!286283 e!286284)))

(assert (=> b!486380 (= lt!219725 (select (arr!15142 a!3235) (index!16617 lt!219726)))))

(declare-fun c!58525 () Bool)

(assert (=> b!486380 (= c!58525 (= lt!219725 k0!2280))))

(assert (= (and d!77509 c!58524) b!486377))

(assert (= (and d!77509 (not c!58524)) b!486380))

(assert (= (and b!486380 c!58525) b!486376))

(assert (= (and b!486380 (not c!58525)) b!486375))

(assert (= (and b!486375 c!58526) b!486378))

(assert (= (and b!486375 (not c!58526)) b!486379))

(declare-fun m!466347 () Bool)

(assert (=> d!77509 m!466347))

(assert (=> d!77509 m!466271))

(declare-fun m!466349 () Bool)

(assert (=> d!77509 m!466349))

(declare-fun m!466351 () Bool)

(assert (=> d!77509 m!466351))

(assert (=> d!77509 m!466351))

(declare-fun m!466353 () Bool)

(assert (=> d!77509 m!466353))

(declare-fun m!466355 () Bool)

(assert (=> d!77509 m!466355))

(declare-fun m!466357 () Bool)

(assert (=> b!486379 m!466357))

(declare-fun m!466359 () Bool)

(assert (=> b!486380 m!466359))

(assert (=> b!486271 d!77509))

(declare-fun d!77525 () Bool)

(declare-fun res!289867 () Bool)

(declare-fun e!286289 () Bool)

(assert (=> d!77525 (=> res!289867 e!286289)))

(assert (=> d!77525 (= res!289867 (= (select (arr!15142 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!77525 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!286289)))

(declare-fun b!486385 () Bool)

(declare-fun e!286290 () Bool)

(assert (=> b!486385 (= e!286289 e!286290)))

(declare-fun res!289868 () Bool)

(assert (=> b!486385 (=> (not res!289868) (not e!286290))))

(assert (=> b!486385 (= res!289868 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15506 a!3235)))))

(declare-fun b!486386 () Bool)

(assert (=> b!486386 (= e!286290 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!77525 (not res!289867)) b!486385))

(assert (= (and b!486385 res!289868) b!486386))

(assert (=> d!77525 m!466301))

(declare-fun m!466361 () Bool)

(assert (=> b!486386 m!466361))

(assert (=> b!486276 d!77525))

(declare-fun d!77527 () Bool)

(assert (=> d!77527 (= (validKeyInArray!0 (select (arr!15142 a!3235) j!176)) (and (not (= (select (arr!15142 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15142 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!486277 d!77527))

(declare-fun d!77529 () Bool)

(assert (=> d!77529 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44156 d!77529))

(declare-fun d!77537 () Bool)

(assert (=> d!77537 (= (array_inv!10938 a!3235) (bvsge (size!15506 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44156 d!77537))

(declare-fun d!77539 () Bool)

(declare-fun res!289873 () Bool)

(declare-fun e!286304 () Bool)

(assert (=> d!77539 (=> res!289873 e!286304)))

(assert (=> d!77539 (= res!289873 ((_ is Nil!9297) Nil!9297))))

(assert (=> d!77539 (= (noDuplicate!208 Nil!9297) e!286304)))

(declare-fun b!486409 () Bool)

(declare-fun e!286305 () Bool)

(assert (=> b!486409 (= e!286304 e!286305)))

(declare-fun res!289874 () Bool)

(assert (=> b!486409 (=> (not res!289874) (not e!286305))))

(declare-fun contains!2694 (List!9300 (_ BitVec 64)) Bool)

(assert (=> b!486409 (= res!289874 (not (contains!2694 (t!15528 Nil!9297) (h!10152 Nil!9297))))))

(declare-fun b!486410 () Bool)

(assert (=> b!486410 (= e!286305 (noDuplicate!208 (t!15528 Nil!9297)))))

(assert (= (and d!77539 (not res!289873)) b!486409))

(assert (= (and b!486409 res!289874) b!486410))

(declare-fun m!466377 () Bool)

(assert (=> b!486409 m!466377))

(declare-fun m!466379 () Bool)

(assert (=> b!486410 m!466379))

(assert (=> b!486278 d!77539))

(check-sat (not b!486410) (not b!486409) (not b!486314) (not b!486379) (not bm!31265) (not b!486311) (not d!77509) (not b!486386))
(check-sat)
