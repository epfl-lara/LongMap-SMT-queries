; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45884 () Bool)

(assert start!45884)

(declare-fun b!508278 () Bool)

(declare-fun res!309295 () Bool)

(declare-fun e!297354 () Bool)

(assert (=> b!508278 (=> (not res!309295) (not e!297354))))

(declare-datatypes ((array!32641 0))(
  ( (array!32642 (arr!15700 (Array (_ BitVec 32) (_ BitVec 64))) (size!16064 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32641)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32641 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508278 (= res!309295 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508279 () Bool)

(declare-fun res!309294 () Bool)

(assert (=> b!508279 (=> (not res!309294) (not e!297354))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508279 (= res!309294 (validKeyInArray!0 k0!2280))))

(declare-fun b!508280 () Bool)

(declare-fun res!309296 () Bool)

(declare-fun e!297353 () Bool)

(assert (=> b!508280 (=> (not res!309296) (not e!297353))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32641 (_ BitVec 32)) Bool)

(assert (=> b!508280 (= res!309296 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508282 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4123 0))(
  ( (MissingZero!4123 (index!18680 (_ BitVec 32))) (Found!4123 (index!18681 (_ BitVec 32))) (Intermediate!4123 (undefined!4935 Bool) (index!18682 (_ BitVec 32)) (x!47809 (_ BitVec 32))) (Undefined!4123) (MissingVacant!4123 (index!18683 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32641 (_ BitVec 32)) SeekEntryResult!4123)

(assert (=> b!508282 (= e!297353 (not (= (seekEntryOrOpen!0 (select (arr!15700 a!3235) j!176) a!3235 mask!3524) (Found!4123 j!176))))))

(assert (=> b!508282 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15565 0))(
  ( (Unit!15566) )
))
(declare-fun lt!232221 () Unit!15565)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32641 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15565)

(assert (=> b!508282 (= lt!232221 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!508283 () Bool)

(declare-fun res!309298 () Bool)

(assert (=> b!508283 (=> (not res!309298) (not e!297354))))

(assert (=> b!508283 (= res!309298 (validKeyInArray!0 (select (arr!15700 a!3235) j!176)))))

(declare-fun b!508284 () Bool)

(declare-fun res!309292 () Bool)

(assert (=> b!508284 (=> (not res!309292) (not e!297353))))

(declare-datatypes ((List!9765 0))(
  ( (Nil!9762) (Cons!9761 (h!10638 (_ BitVec 64)) (t!15985 List!9765)) )
))
(declare-fun arrayNoDuplicates!0 (array!32641 (_ BitVec 32) List!9765) Bool)

(assert (=> b!508284 (= res!309292 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9762))))

(declare-fun b!508285 () Bool)

(assert (=> b!508285 (= e!297354 e!297353)))

(declare-fun res!309297 () Bool)

(assert (=> b!508285 (=> (not res!309297) (not e!297353))))

(declare-fun lt!232222 () SeekEntryResult!4123)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!508285 (= res!309297 (or (= lt!232222 (MissingZero!4123 i!1204)) (= lt!232222 (MissingVacant!4123 i!1204))))))

(assert (=> b!508285 (= lt!232222 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!508281 () Bool)

(declare-fun res!309291 () Bool)

(assert (=> b!508281 (=> (not res!309291) (not e!297354))))

(assert (=> b!508281 (= res!309291 (and (= (size!16064 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16064 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16064 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!309293 () Bool)

(assert (=> start!45884 (=> (not res!309293) (not e!297354))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45884 (= res!309293 (validMask!0 mask!3524))))

(assert (=> start!45884 e!297354))

(assert (=> start!45884 true))

(declare-fun array_inv!11559 (array!32641) Bool)

(assert (=> start!45884 (array_inv!11559 a!3235)))

(assert (= (and start!45884 res!309293) b!508281))

(assert (= (and b!508281 res!309291) b!508283))

(assert (= (and b!508283 res!309298) b!508279))

(assert (= (and b!508279 res!309294) b!508278))

(assert (= (and b!508278 res!309295) b!508285))

(assert (= (and b!508285 res!309297) b!508280))

(assert (= (and b!508280 res!309296) b!508284))

(assert (= (and b!508284 res!309292) b!508282))

(declare-fun m!489307 () Bool)

(assert (=> start!45884 m!489307))

(declare-fun m!489309 () Bool)

(assert (=> start!45884 m!489309))

(declare-fun m!489311 () Bool)

(assert (=> b!508280 m!489311))

(declare-fun m!489313 () Bool)

(assert (=> b!508279 m!489313))

(declare-fun m!489315 () Bool)

(assert (=> b!508284 m!489315))

(declare-fun m!489317 () Bool)

(assert (=> b!508283 m!489317))

(assert (=> b!508283 m!489317))

(declare-fun m!489319 () Bool)

(assert (=> b!508283 m!489319))

(declare-fun m!489321 () Bool)

(assert (=> b!508285 m!489321))

(declare-fun m!489323 () Bool)

(assert (=> b!508278 m!489323))

(assert (=> b!508282 m!489317))

(assert (=> b!508282 m!489317))

(declare-fun m!489325 () Bool)

(assert (=> b!508282 m!489325))

(declare-fun m!489327 () Bool)

(assert (=> b!508282 m!489327))

(declare-fun m!489329 () Bool)

(assert (=> b!508282 m!489329))

(check-sat (not b!508282) (not b!508280) (not b!508278) (not b!508279) (not b!508284) (not start!45884) (not b!508283) (not b!508285))
(check-sat)
(get-model)

(declare-fun d!78775 () Bool)

(assert (=> d!78775 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!45884 d!78775))

(declare-fun d!78777 () Bool)

(assert (=> d!78777 (= (array_inv!11559 a!3235) (bvsge (size!16064 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!45884 d!78777))

(declare-fun b!508358 () Bool)

(declare-fun e!297386 () SeekEntryResult!4123)

(declare-fun lt!232248 () SeekEntryResult!4123)

(assert (=> b!508358 (= e!297386 (MissingZero!4123 (index!18682 lt!232248)))))

(declare-fun b!508359 () Bool)

(declare-fun e!297385 () SeekEntryResult!4123)

(assert (=> b!508359 (= e!297385 Undefined!4123)))

(declare-fun b!508360 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32641 (_ BitVec 32)) SeekEntryResult!4123)

(assert (=> b!508360 (= e!297386 (seekKeyOrZeroReturnVacant!0 (x!47809 lt!232248) (index!18682 lt!232248) (index!18682 lt!232248) k0!2280 a!3235 mask!3524))))

(declare-fun d!78781 () Bool)

(declare-fun lt!232247 () SeekEntryResult!4123)

(get-info :version)

(assert (=> d!78781 (and (or ((_ is Undefined!4123) lt!232247) (not ((_ is Found!4123) lt!232247)) (and (bvsge (index!18681 lt!232247) #b00000000000000000000000000000000) (bvslt (index!18681 lt!232247) (size!16064 a!3235)))) (or ((_ is Undefined!4123) lt!232247) ((_ is Found!4123) lt!232247) (not ((_ is MissingZero!4123) lt!232247)) (and (bvsge (index!18680 lt!232247) #b00000000000000000000000000000000) (bvslt (index!18680 lt!232247) (size!16064 a!3235)))) (or ((_ is Undefined!4123) lt!232247) ((_ is Found!4123) lt!232247) ((_ is MissingZero!4123) lt!232247) (not ((_ is MissingVacant!4123) lt!232247)) (and (bvsge (index!18683 lt!232247) #b00000000000000000000000000000000) (bvslt (index!18683 lt!232247) (size!16064 a!3235)))) (or ((_ is Undefined!4123) lt!232247) (ite ((_ is Found!4123) lt!232247) (= (select (arr!15700 a!3235) (index!18681 lt!232247)) k0!2280) (ite ((_ is MissingZero!4123) lt!232247) (= (select (arr!15700 a!3235) (index!18680 lt!232247)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4123) lt!232247) (= (select (arr!15700 a!3235) (index!18683 lt!232247)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78781 (= lt!232247 e!297385)))

(declare-fun c!59786 () Bool)

(assert (=> d!78781 (= c!59786 (and ((_ is Intermediate!4123) lt!232248) (undefined!4935 lt!232248)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32641 (_ BitVec 32)) SeekEntryResult!4123)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!78781 (= lt!232248 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!78781 (validMask!0 mask!3524)))

(assert (=> d!78781 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!232247)))

(declare-fun b!508361 () Bool)

(declare-fun c!59784 () Bool)

(declare-fun lt!232249 () (_ BitVec 64))

(assert (=> b!508361 (= c!59784 (= lt!232249 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!297387 () SeekEntryResult!4123)

(assert (=> b!508361 (= e!297387 e!297386)))

(declare-fun b!508362 () Bool)

(assert (=> b!508362 (= e!297385 e!297387)))

(assert (=> b!508362 (= lt!232249 (select (arr!15700 a!3235) (index!18682 lt!232248)))))

(declare-fun c!59785 () Bool)

(assert (=> b!508362 (= c!59785 (= lt!232249 k0!2280))))

(declare-fun b!508363 () Bool)

(assert (=> b!508363 (= e!297387 (Found!4123 (index!18682 lt!232248)))))

(assert (= (and d!78781 c!59786) b!508359))

(assert (= (and d!78781 (not c!59786)) b!508362))

(assert (= (and b!508362 c!59785) b!508363))

(assert (= (and b!508362 (not c!59785)) b!508361))

(assert (= (and b!508361 c!59784) b!508358))

(assert (= (and b!508361 (not c!59784)) b!508360))

(declare-fun m!489379 () Bool)

(assert (=> b!508360 m!489379))

(declare-fun m!489381 () Bool)

(assert (=> d!78781 m!489381))

(declare-fun m!489383 () Bool)

(assert (=> d!78781 m!489383))

(declare-fun m!489385 () Bool)

(assert (=> d!78781 m!489385))

(assert (=> d!78781 m!489383))

(declare-fun m!489387 () Bool)

(assert (=> d!78781 m!489387))

(declare-fun m!489389 () Bool)

(assert (=> d!78781 m!489389))

(assert (=> d!78781 m!489307))

(declare-fun m!489391 () Bool)

(assert (=> b!508362 m!489391))

(assert (=> b!508285 d!78781))

(declare-fun b!508388 () Bool)

(declare-fun e!297406 () Bool)

(declare-fun e!297407 () Bool)

(assert (=> b!508388 (= e!297406 e!297407)))

(declare-fun lt!232260 () (_ BitVec 64))

(assert (=> b!508388 (= lt!232260 (select (arr!15700 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!232259 () Unit!15565)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32641 (_ BitVec 64) (_ BitVec 32)) Unit!15565)

(assert (=> b!508388 (= lt!232259 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!232260 #b00000000000000000000000000000000))))

(assert (=> b!508388 (arrayContainsKey!0 a!3235 lt!232260 #b00000000000000000000000000000000)))

(declare-fun lt!232261 () Unit!15565)

(assert (=> b!508388 (= lt!232261 lt!232259)))

(declare-fun res!309357 () Bool)

(assert (=> b!508388 (= res!309357 (= (seekEntryOrOpen!0 (select (arr!15700 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4123 #b00000000000000000000000000000000)))))

(assert (=> b!508388 (=> (not res!309357) (not e!297407))))

(declare-fun b!508389 () Bool)

(declare-fun e!297405 () Bool)

(assert (=> b!508389 (= e!297405 e!297406)))

(declare-fun c!59794 () Bool)

(assert (=> b!508389 (= c!59794 (validKeyInArray!0 (select (arr!15700 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!508390 () Bool)

(declare-fun call!31463 () Bool)

(assert (=> b!508390 (= e!297406 call!31463)))

(declare-fun d!78785 () Bool)

(declare-fun res!309358 () Bool)

(assert (=> d!78785 (=> res!309358 e!297405)))

(assert (=> d!78785 (= res!309358 (bvsge #b00000000000000000000000000000000 (size!16064 a!3235)))))

(assert (=> d!78785 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!297405)))

(declare-fun bm!31460 () Bool)

(assert (=> bm!31460 (= call!31463 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!508391 () Bool)

(assert (=> b!508391 (= e!297407 call!31463)))

(assert (= (and d!78785 (not res!309358)) b!508389))

(assert (= (and b!508389 c!59794) b!508388))

(assert (= (and b!508389 (not c!59794)) b!508390))

(assert (= (and b!508388 res!309357) b!508391))

(assert (= (or b!508391 b!508390) bm!31460))

(declare-fun m!489407 () Bool)

(assert (=> b!508388 m!489407))

(declare-fun m!489409 () Bool)

(assert (=> b!508388 m!489409))

(declare-fun m!489411 () Bool)

(assert (=> b!508388 m!489411))

(assert (=> b!508388 m!489407))

(declare-fun m!489413 () Bool)

(assert (=> b!508388 m!489413))

(assert (=> b!508389 m!489407))

(assert (=> b!508389 m!489407))

(declare-fun m!489415 () Bool)

(assert (=> b!508389 m!489415))

(declare-fun m!489417 () Bool)

(assert (=> bm!31460 m!489417))

(assert (=> b!508280 d!78785))

(declare-fun d!78789 () Bool)

(declare-fun res!309363 () Bool)

(declare-fun e!297412 () Bool)

(assert (=> d!78789 (=> res!309363 e!297412)))

(assert (=> d!78789 (= res!309363 (= (select (arr!15700 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!78789 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!297412)))

(declare-fun b!508396 () Bool)

(declare-fun e!297413 () Bool)

(assert (=> b!508396 (= e!297412 e!297413)))

(declare-fun res!309364 () Bool)

(assert (=> b!508396 (=> (not res!309364) (not e!297413))))

(assert (=> b!508396 (= res!309364 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16064 a!3235)))))

(declare-fun b!508397 () Bool)

(assert (=> b!508397 (= e!297413 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!78789 (not res!309363)) b!508396))

(assert (= (and b!508396 res!309364) b!508397))

(assert (=> d!78789 m!489407))

(declare-fun m!489419 () Bool)

(assert (=> b!508397 m!489419))

(assert (=> b!508278 d!78789))

(declare-fun d!78793 () Bool)

(assert (=> d!78793 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!508279 d!78793))

(declare-fun b!508419 () Bool)

(declare-fun e!297431 () Bool)

(declare-fun contains!2698 (List!9765 (_ BitVec 64)) Bool)

(assert (=> b!508419 (= e!297431 (contains!2698 Nil!9762 (select (arr!15700 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!508420 () Bool)

(declare-fun e!297433 () Bool)

(declare-fun call!31467 () Bool)

(assert (=> b!508420 (= e!297433 call!31467)))

(declare-fun b!508421 () Bool)

(assert (=> b!508421 (= e!297433 call!31467)))

(declare-fun b!508422 () Bool)

(declare-fun e!297430 () Bool)

(assert (=> b!508422 (= e!297430 e!297433)))

(declare-fun c!59800 () Bool)

(assert (=> b!508422 (= c!59800 (validKeyInArray!0 (select (arr!15700 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31464 () Bool)

(assert (=> bm!31464 (= call!31467 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!59800 (Cons!9761 (select (arr!15700 a!3235) #b00000000000000000000000000000000) Nil!9762) Nil!9762)))))

(declare-fun b!508423 () Bool)

(declare-fun e!297432 () Bool)

(assert (=> b!508423 (= e!297432 e!297430)))

(declare-fun res!309377 () Bool)

(assert (=> b!508423 (=> (not res!309377) (not e!297430))))

(assert (=> b!508423 (= res!309377 (not e!297431))))

(declare-fun res!309378 () Bool)

(assert (=> b!508423 (=> (not res!309378) (not e!297431))))

(assert (=> b!508423 (= res!309378 (validKeyInArray!0 (select (arr!15700 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!78797 () Bool)

(declare-fun res!309376 () Bool)

(assert (=> d!78797 (=> res!309376 e!297432)))

(assert (=> d!78797 (= res!309376 (bvsge #b00000000000000000000000000000000 (size!16064 a!3235)))))

(assert (=> d!78797 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9762) e!297432)))

(assert (= (and d!78797 (not res!309376)) b!508423))

(assert (= (and b!508423 res!309378) b!508419))

(assert (= (and b!508423 res!309377) b!508422))

(assert (= (and b!508422 c!59800) b!508420))

(assert (= (and b!508422 (not c!59800)) b!508421))

(assert (= (or b!508420 b!508421) bm!31464))

(assert (=> b!508419 m!489407))

(assert (=> b!508419 m!489407))

(declare-fun m!489421 () Bool)

(assert (=> b!508419 m!489421))

(assert (=> b!508422 m!489407))

(assert (=> b!508422 m!489407))

(assert (=> b!508422 m!489415))

(assert (=> bm!31464 m!489407))

(declare-fun m!489425 () Bool)

(assert (=> bm!31464 m!489425))

(assert (=> b!508423 m!489407))

(assert (=> b!508423 m!489407))

(assert (=> b!508423 m!489415))

(assert (=> b!508284 d!78797))

(declare-fun b!508426 () Bool)

(declare-fun e!297437 () SeekEntryResult!4123)

(declare-fun lt!232269 () SeekEntryResult!4123)

(assert (=> b!508426 (= e!297437 (MissingZero!4123 (index!18682 lt!232269)))))

(declare-fun b!508427 () Bool)

(declare-fun e!297436 () SeekEntryResult!4123)

(assert (=> b!508427 (= e!297436 Undefined!4123)))

(declare-fun b!508428 () Bool)

(assert (=> b!508428 (= e!297437 (seekKeyOrZeroReturnVacant!0 (x!47809 lt!232269) (index!18682 lt!232269) (index!18682 lt!232269) (select (arr!15700 a!3235) j!176) a!3235 mask!3524))))

(declare-fun d!78799 () Bool)

(declare-fun lt!232268 () SeekEntryResult!4123)

(assert (=> d!78799 (and (or ((_ is Undefined!4123) lt!232268) (not ((_ is Found!4123) lt!232268)) (and (bvsge (index!18681 lt!232268) #b00000000000000000000000000000000) (bvslt (index!18681 lt!232268) (size!16064 a!3235)))) (or ((_ is Undefined!4123) lt!232268) ((_ is Found!4123) lt!232268) (not ((_ is MissingZero!4123) lt!232268)) (and (bvsge (index!18680 lt!232268) #b00000000000000000000000000000000) (bvslt (index!18680 lt!232268) (size!16064 a!3235)))) (or ((_ is Undefined!4123) lt!232268) ((_ is Found!4123) lt!232268) ((_ is MissingZero!4123) lt!232268) (not ((_ is MissingVacant!4123) lt!232268)) (and (bvsge (index!18683 lt!232268) #b00000000000000000000000000000000) (bvslt (index!18683 lt!232268) (size!16064 a!3235)))) (or ((_ is Undefined!4123) lt!232268) (ite ((_ is Found!4123) lt!232268) (= (select (arr!15700 a!3235) (index!18681 lt!232268)) (select (arr!15700 a!3235) j!176)) (ite ((_ is MissingZero!4123) lt!232268) (= (select (arr!15700 a!3235) (index!18680 lt!232268)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4123) lt!232268) (= (select (arr!15700 a!3235) (index!18683 lt!232268)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78799 (= lt!232268 e!297436)))

(declare-fun c!59803 () Bool)

(assert (=> d!78799 (= c!59803 (and ((_ is Intermediate!4123) lt!232269) (undefined!4935 lt!232269)))))

(assert (=> d!78799 (= lt!232269 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15700 a!3235) j!176) mask!3524) (select (arr!15700 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!78799 (validMask!0 mask!3524)))

(assert (=> d!78799 (= (seekEntryOrOpen!0 (select (arr!15700 a!3235) j!176) a!3235 mask!3524) lt!232268)))

(declare-fun b!508429 () Bool)

(declare-fun c!59801 () Bool)

(declare-fun lt!232270 () (_ BitVec 64))

(assert (=> b!508429 (= c!59801 (= lt!232270 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!297438 () SeekEntryResult!4123)

(assert (=> b!508429 (= e!297438 e!297437)))

(declare-fun b!508430 () Bool)

(assert (=> b!508430 (= e!297436 e!297438)))

(assert (=> b!508430 (= lt!232270 (select (arr!15700 a!3235) (index!18682 lt!232269)))))

(declare-fun c!59802 () Bool)

(assert (=> b!508430 (= c!59802 (= lt!232270 (select (arr!15700 a!3235) j!176)))))

(declare-fun b!508431 () Bool)

(assert (=> b!508431 (= e!297438 (Found!4123 (index!18682 lt!232269)))))

(assert (= (and d!78799 c!59803) b!508427))

(assert (= (and d!78799 (not c!59803)) b!508430))

(assert (= (and b!508430 c!59802) b!508431))

(assert (= (and b!508430 (not c!59802)) b!508429))

(assert (= (and b!508429 c!59801) b!508426))

(assert (= (and b!508429 (not c!59801)) b!508428))

(assert (=> b!508428 m!489317))

(declare-fun m!489433 () Bool)

(assert (=> b!508428 m!489433))

(declare-fun m!489435 () Bool)

(assert (=> d!78799 m!489435))

(declare-fun m!489437 () Bool)

(assert (=> d!78799 m!489437))

(assert (=> d!78799 m!489317))

(declare-fun m!489439 () Bool)

(assert (=> d!78799 m!489439))

(assert (=> d!78799 m!489317))

(assert (=> d!78799 m!489437))

(declare-fun m!489441 () Bool)

(assert (=> d!78799 m!489441))

(declare-fun m!489443 () Bool)

(assert (=> d!78799 m!489443))

(assert (=> d!78799 m!489307))

(declare-fun m!489445 () Bool)

(assert (=> b!508430 m!489445))

(assert (=> b!508282 d!78799))

(declare-fun b!508432 () Bool)

(declare-fun e!297440 () Bool)

(declare-fun e!297441 () Bool)

(assert (=> b!508432 (= e!297440 e!297441)))

(declare-fun lt!232272 () (_ BitVec 64))

(assert (=> b!508432 (= lt!232272 (select (arr!15700 a!3235) j!176))))

(declare-fun lt!232271 () Unit!15565)

(assert (=> b!508432 (= lt!232271 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!232272 j!176))))

(assert (=> b!508432 (arrayContainsKey!0 a!3235 lt!232272 #b00000000000000000000000000000000)))

(declare-fun lt!232273 () Unit!15565)

(assert (=> b!508432 (= lt!232273 lt!232271)))

(declare-fun res!309381 () Bool)

(assert (=> b!508432 (= res!309381 (= (seekEntryOrOpen!0 (select (arr!15700 a!3235) j!176) a!3235 mask!3524) (Found!4123 j!176)))))

(assert (=> b!508432 (=> (not res!309381) (not e!297441))))

(declare-fun b!508433 () Bool)

(declare-fun e!297439 () Bool)

(assert (=> b!508433 (= e!297439 e!297440)))

(declare-fun c!59804 () Bool)

(assert (=> b!508433 (= c!59804 (validKeyInArray!0 (select (arr!15700 a!3235) j!176)))))

(declare-fun b!508434 () Bool)

(declare-fun call!31470 () Bool)

(assert (=> b!508434 (= e!297440 call!31470)))

(declare-fun d!78803 () Bool)

(declare-fun res!309382 () Bool)

(assert (=> d!78803 (=> res!309382 e!297439)))

(assert (=> d!78803 (= res!309382 (bvsge j!176 (size!16064 a!3235)))))

(assert (=> d!78803 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!297439)))

(declare-fun bm!31467 () Bool)

(assert (=> bm!31467 (= call!31470 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!508435 () Bool)

(assert (=> b!508435 (= e!297441 call!31470)))

(assert (= (and d!78803 (not res!309382)) b!508433))

(assert (= (and b!508433 c!59804) b!508432))

(assert (= (and b!508433 (not c!59804)) b!508434))

(assert (= (and b!508432 res!309381) b!508435))

(assert (= (or b!508435 b!508434) bm!31467))

(assert (=> b!508432 m!489317))

(declare-fun m!489447 () Bool)

(assert (=> b!508432 m!489447))

(declare-fun m!489449 () Bool)

(assert (=> b!508432 m!489449))

(assert (=> b!508432 m!489317))

(assert (=> b!508432 m!489325))

(assert (=> b!508433 m!489317))

(assert (=> b!508433 m!489317))

(assert (=> b!508433 m!489319))

(declare-fun m!489451 () Bool)

(assert (=> bm!31467 m!489451))

(assert (=> b!508282 d!78803))

(declare-fun d!78805 () Bool)

(assert (=> d!78805 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!232285 () Unit!15565)

(declare-fun choose!38 (array!32641 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15565)

(assert (=> d!78805 (= lt!232285 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!78805 (validMask!0 mask!3524)))

(assert (=> d!78805 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!232285)))

(declare-fun bs!16112 () Bool)

(assert (= bs!16112 d!78805))

(assert (=> bs!16112 m!489327))

(declare-fun m!489485 () Bool)

(assert (=> bs!16112 m!489485))

(assert (=> bs!16112 m!489307))

(assert (=> b!508282 d!78805))

(declare-fun d!78813 () Bool)

(assert (=> d!78813 (= (validKeyInArray!0 (select (arr!15700 a!3235) j!176)) (and (not (= (select (arr!15700 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15700 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!508283 d!78813))

(check-sat (not bm!31464) (not d!78799) (not b!508422) (not b!508360) (not b!508389) (not d!78805) (not b!508428) (not b!508433) (not b!508397) (not d!78781) (not b!508423) (not bm!31467) (not b!508419) (not b!508388) (not bm!31460) (not b!508432))
(check-sat)
