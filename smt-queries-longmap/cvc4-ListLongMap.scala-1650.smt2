; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30684 () Bool)

(assert start!30684)

(declare-fun b!308102 () Bool)

(declare-fun res!164864 () Bool)

(declare-fun e!192711 () Bool)

(assert (=> b!308102 (=> (not res!164864) (not e!192711))))

(declare-datatypes ((array!15688 0))(
  ( (array!15689 (arr!7429 (Array (_ BitVec 32) (_ BitVec 64))) (size!7781 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15688)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!308102 (= res!164864 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7429 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun b!308103 () Bool)

(declare-fun res!164863 () Bool)

(declare-fun e!192712 () Bool)

(assert (=> b!308103 (=> (not res!164863) (not e!192712))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308103 (= res!164863 (validKeyInArray!0 k!2441))))

(declare-fun b!308104 () Bool)

(declare-fun res!164865 () Bool)

(assert (=> b!308104 (=> (not res!164865) (not e!192712))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15688 (_ BitVec 32)) Bool)

(assert (=> b!308104 (= res!164865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308105 () Bool)

(declare-fun res!164859 () Bool)

(assert (=> b!308105 (=> (not res!164859) (not e!192711))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!308105 (= res!164859 (and (= (select (arr!7429 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7781 a!3293))))))

(declare-fun b!308106 () Bool)

(declare-fun res!164857 () Bool)

(assert (=> b!308106 (=> (not res!164857) (not e!192712))))

(assert (=> b!308106 (= res!164857 (and (= (size!7781 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7781 a!3293))))))

(declare-fun b!308107 () Bool)

(declare-fun res!164858 () Bool)

(assert (=> b!308107 (=> (not res!164858) (not e!192712))))

(declare-datatypes ((SeekEntryResult!2569 0))(
  ( (MissingZero!2569 (index!12452 (_ BitVec 32))) (Found!2569 (index!12453 (_ BitVec 32))) (Intermediate!2569 (undefined!3381 Bool) (index!12454 (_ BitVec 32)) (x!30684 (_ BitVec 32))) (Undefined!2569) (MissingVacant!2569 (index!12455 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15688 (_ BitVec 32)) SeekEntryResult!2569)

(assert (=> b!308107 (= res!164858 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2569 i!1240)))))

(declare-fun res!164861 () Bool)

(assert (=> start!30684 (=> (not res!164861) (not e!192712))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30684 (= res!164861 (validMask!0 mask!3709))))

(assert (=> start!30684 e!192712))

(declare-fun array_inv!5392 (array!15688) Bool)

(assert (=> start!30684 (array_inv!5392 a!3293)))

(assert (=> start!30684 true))

(declare-fun b!308108 () Bool)

(declare-fun res!164862 () Bool)

(assert (=> b!308108 (=> (not res!164862) (not e!192711))))

(declare-fun lt!151238 () SeekEntryResult!2569)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15688 (_ BitVec 32)) SeekEntryResult!2569)

(assert (=> b!308108 (= res!164862 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!151238))))

(declare-fun b!308109 () Bool)

(declare-fun res!164856 () Bool)

(assert (=> b!308109 (=> (not res!164856) (not e!192712))))

(declare-fun arrayContainsKey!0 (array!15688 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308109 (= res!164856 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!308110 () Bool)

(assert (=> b!308110 (= e!192712 e!192711)))

(declare-fun res!164860 () Bool)

(assert (=> b!308110 (=> (not res!164860) (not e!192711))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308110 (= res!164860 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151238))))

(assert (=> b!308110 (= lt!151238 (Intermediate!2569 false resIndex!52 resX!52))))

(declare-fun b!308111 () Bool)

(declare-fun lt!151239 () (_ BitVec 32))

(assert (=> b!308111 (= e!192711 (and (bvsge mask!3709 #b00000000000000000000000000000000) (or (bvslt lt!151239 #b00000000000000000000000000000000) (bvsge lt!151239 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308111 (= lt!151239 (nextIndex!0 index!1781 x!1427 mask!3709))))

(assert (= (and start!30684 res!164861) b!308106))

(assert (= (and b!308106 res!164857) b!308103))

(assert (= (and b!308103 res!164863) b!308109))

(assert (= (and b!308109 res!164856) b!308107))

(assert (= (and b!308107 res!164858) b!308104))

(assert (= (and b!308104 res!164865) b!308110))

(assert (= (and b!308110 res!164860) b!308105))

(assert (= (and b!308105 res!164859) b!308108))

(assert (= (and b!308108 res!164862) b!308102))

(assert (= (and b!308102 res!164864) b!308111))

(declare-fun m!318281 () Bool)

(assert (=> b!308102 m!318281))

(declare-fun m!318283 () Bool)

(assert (=> b!308110 m!318283))

(assert (=> b!308110 m!318283))

(declare-fun m!318285 () Bool)

(assert (=> b!308110 m!318285))

(declare-fun m!318287 () Bool)

(assert (=> b!308108 m!318287))

(declare-fun m!318289 () Bool)

(assert (=> b!308104 m!318289))

(declare-fun m!318291 () Bool)

(assert (=> b!308111 m!318291))

(declare-fun m!318293 () Bool)

(assert (=> b!308105 m!318293))

(declare-fun m!318295 () Bool)

(assert (=> start!30684 m!318295))

(declare-fun m!318297 () Bool)

(assert (=> start!30684 m!318297))

(declare-fun m!318299 () Bool)

(assert (=> b!308109 m!318299))

(declare-fun m!318301 () Bool)

(assert (=> b!308107 m!318301))

(declare-fun m!318303 () Bool)

(assert (=> b!308103 m!318303))

(push 1)

(assert (not b!308109))

(assert (not b!308107))

(assert (not b!308103))

(assert (not b!308111))

(assert (not b!308110))

(assert (not b!308108))

(assert (not start!30684))

(assert (not b!308104))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!68269 () Bool)

(declare-fun lt!151274 () (_ BitVec 32))

(assert (=> d!68269 (and (bvsge lt!151274 #b00000000000000000000000000000000) (bvslt lt!151274 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!68269 (= lt!151274 (choose!52 index!1781 x!1427 mask!3709))))

(assert (=> d!68269 (validMask!0 mask!3709)))

(assert (=> d!68269 (= (nextIndex!0 index!1781 x!1427 mask!3709) lt!151274)))

(declare-fun bs!10830 () Bool)

(assert (= bs!10830 d!68269))

(declare-fun m!318337 () Bool)

(assert (=> bs!10830 m!318337))

(assert (=> bs!10830 m!318295))

(assert (=> b!308111 d!68269))

(declare-fun d!68273 () Bool)

(assert (=> d!68273 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!30684 d!68273))

(declare-fun d!68285 () Bool)

(assert (=> d!68285 (= (array_inv!5392 a!3293) (bvsge (size!7781 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!30684 d!68285))

(declare-fun b!308274 () Bool)

(declare-fun e!192813 () SeekEntryResult!2569)

(assert (=> b!308274 (= e!192813 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!308275 () Bool)

(declare-fun e!192812 () Bool)

(declare-fun e!192811 () Bool)

(assert (=> b!308275 (= e!192812 e!192811)))

(declare-fun res!164924 () Bool)

(declare-fun lt!151317 () SeekEntryResult!2569)

(assert (=> b!308275 (= res!164924 (and (is-Intermediate!2569 lt!151317) (not (undefined!3381 lt!151317)) (bvslt (x!30684 lt!151317) #b01111111111111111111111111111110) (bvsge (x!30684 lt!151317) #b00000000000000000000000000000000) (bvsge (x!30684 lt!151317) #b00000000000000000000000000000000)))))

(assert (=> b!308275 (=> (not res!164924) (not e!192811))))

(declare-fun b!308276 () Bool)

(assert (=> b!308276 (= e!192812 (bvsge (x!30684 lt!151317) #b01111111111111111111111111111110))))

(declare-fun b!308277 () Bool)

(assert (=> b!308277 (= e!192813 (Intermediate!2569 false (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!308278 () Bool)

(declare-fun e!192814 () SeekEntryResult!2569)

(assert (=> b!308278 (= e!192814 (Intermediate!2569 true (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!308279 () Bool)

(assert (=> b!308279 (and (bvsge (index!12454 lt!151317) #b00000000000000000000000000000000) (bvslt (index!12454 lt!151317) (size!7781 a!3293)))))

(declare-fun res!164923 () Bool)

(assert (=> b!308279 (= res!164923 (= (select (arr!7429 a!3293) (index!12454 lt!151317)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!192815 () Bool)

(assert (=> b!308279 (=> res!164923 e!192815)))

(declare-fun b!308280 () Bool)

(assert (=> b!308280 (= e!192814 e!192813)))

(declare-fun c!49280 () Bool)

(declare-fun lt!151318 () (_ BitVec 64))

(assert (=> b!308280 (= c!49280 (or (= lt!151318 k!2441) (= (bvadd lt!151318 lt!151318) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!308281 () Bool)

(assert (=> b!308281 (and (bvsge (index!12454 lt!151317) #b00000000000000000000000000000000) (bvslt (index!12454 lt!151317) (size!7781 a!3293)))))

(declare-fun res!164922 () Bool)

(assert (=> b!308281 (= res!164922 (= (select (arr!7429 a!3293) (index!12454 lt!151317)) k!2441))))

(assert (=> b!308281 (=> res!164922 e!192815)))

(assert (=> b!308281 (= e!192811 e!192815)))

(declare-fun b!308282 () Bool)

(assert (=> b!308282 (and (bvsge (index!12454 lt!151317) #b00000000000000000000000000000000) (bvslt (index!12454 lt!151317) (size!7781 a!3293)))))

(assert (=> b!308282 (= e!192815 (= (select (arr!7429 a!3293) (index!12454 lt!151317)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!68287 () Bool)

(assert (=> d!68287 e!192812))

(declare-fun c!49279 () Bool)

(assert (=> d!68287 (= c!49279 (and (is-Intermediate!2569 lt!151317) (undefined!3381 lt!151317)))))

(assert (=> d!68287 (= lt!151317 e!192814)))

(declare-fun c!49281 () Bool)

(assert (=> d!68287 (= c!49281 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!68287 (= lt!151318 (select (arr!7429 a!3293) (toIndex!0 k!2441 mask!3709)))))

(assert (=> d!68287 (validMask!0 mask!3709)))

(assert (=> d!68287 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151317)))

(assert (= (and d!68287 c!49281) b!308278))

(assert (= (and d!68287 (not c!49281)) b!308280))

(assert (= (and b!308280 c!49280) b!308277))

(assert (= (and b!308280 (not c!49280)) b!308274))

(assert (= (and d!68287 c!49279) b!308276))

(assert (= (and d!68287 (not c!49279)) b!308275))

(assert (= (and b!308275 res!164924) b!308281))

(assert (= (and b!308281 (not res!164922)) b!308279))

(assert (= (and b!308279 (not res!164923)) b!308282))

(assert (=> b!308274 m!318283))

(declare-fun m!318383 () Bool)

(assert (=> b!308274 m!318383))

(assert (=> b!308274 m!318383))

(declare-fun m!318385 () Bool)

(assert (=> b!308274 m!318385))

(declare-fun m!318387 () Bool)

(assert (=> b!308281 m!318387))

(assert (=> d!68287 m!318283))

(declare-fun m!318389 () Bool)

(assert (=> d!68287 m!318389))

(assert (=> d!68287 m!318295))

(assert (=> b!308282 m!318387))

(assert (=> b!308279 m!318387))

(assert (=> b!308110 d!68287))

(declare-fun d!68301 () Bool)

(declare-fun lt!151324 () (_ BitVec 32))

(declare-fun lt!151323 () (_ BitVec 32))

(assert (=> d!68301 (= lt!151324 (bvmul (bvxor lt!151323 (bvlshr lt!151323 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68301 (= lt!151323 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68301 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!164925 (let ((h!5342 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!30693 (bvmul (bvxor h!5342 (bvlshr h!5342 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!30693 (bvlshr x!30693 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!164925 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!164925 #b00000000000000000000000000000000))))))

(assert (=> d!68301 (= (toIndex!0 k!2441 mask!3709) (bvand (bvxor lt!151324 (bvlshr lt!151324 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!308110 d!68301))

(declare-fun bm!25915 () Bool)

(declare-fun call!25918 () Bool)

(assert (=> bm!25915 (= call!25918 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!308291 () Bool)

(declare-fun e!192823 () Bool)

(declare-fun e!192822 () Bool)

(assert (=> b!308291 (= e!192823 e!192822)))

(declare-fun lt!151331 () (_ BitVec 64))

(assert (=> b!308291 (= lt!151331 (select (arr!7429 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9585 0))(
  ( (Unit!9586) )
))
(declare-fun lt!151332 () Unit!9585)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15688 (_ BitVec 64) (_ BitVec 32)) Unit!9585)

(assert (=> b!308291 (= lt!151332 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!151331 #b00000000000000000000000000000000))))

(assert (=> b!308291 (arrayContainsKey!0 a!3293 lt!151331 #b00000000000000000000000000000000)))

(declare-fun lt!151333 () Unit!9585)

(assert (=> b!308291 (= lt!151333 lt!151332)))

(declare-fun res!164930 () Bool)

(assert (=> b!308291 (= res!164930 (= (seekEntryOrOpen!0 (select (arr!7429 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2569 #b00000000000000000000000000000000)))))

(assert (=> b!308291 (=> (not res!164930) (not e!192822))))

(declare-fun b!308292 () Bool)

(assert (=> b!308292 (= e!192823 call!25918)))

(declare-fun b!308293 () Bool)

(declare-fun e!192824 () Bool)

(assert (=> b!308293 (= e!192824 e!192823)))

(declare-fun c!49284 () Bool)

(assert (=> b!308293 (= c!49284 (validKeyInArray!0 (select (arr!7429 a!3293) #b00000000000000000000000000000000)))))

(declare-fun d!68303 () Bool)

(declare-fun res!164931 () Bool)

(assert (=> d!68303 (=> res!164931 e!192824)))

(assert (=> d!68303 (= res!164931 (bvsge #b00000000000000000000000000000000 (size!7781 a!3293)))))

(assert (=> d!68303 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!192824)))

(declare-fun b!308294 () Bool)

(assert (=> b!308294 (= e!192822 call!25918)))

(assert (= (and d!68303 (not res!164931)) b!308293))

(assert (= (and b!308293 c!49284) b!308291))

(assert (= (and b!308293 (not c!49284)) b!308292))

(assert (= (and b!308291 res!164930) b!308294))

(assert (= (or b!308294 b!308292) bm!25915))

(declare-fun m!318391 () Bool)

(assert (=> bm!25915 m!318391))

(declare-fun m!318393 () Bool)

(assert (=> b!308291 m!318393))

(declare-fun m!318395 () Bool)

(assert (=> b!308291 m!318395))

(declare-fun m!318397 () Bool)

(assert (=> b!308291 m!318397))

(assert (=> b!308291 m!318393))

(declare-fun m!318399 () Bool)

(assert (=> b!308291 m!318399))

(assert (=> b!308293 m!318393))

(assert (=> b!308293 m!318393))

(declare-fun m!318401 () Bool)

(assert (=> b!308293 m!318401))

(assert (=> b!308104 d!68303))

(declare-fun d!68305 () Bool)

(declare-fun res!164936 () Bool)

(declare-fun e!192829 () Bool)

(assert (=> d!68305 (=> res!164936 e!192829)))

(assert (=> d!68305 (= res!164936 (= (select (arr!7429 a!3293) #b00000000000000000000000000000000) k!2441))))

(assert (=> d!68305 (= (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000) e!192829)))

(declare-fun b!308299 () Bool)

(declare-fun e!192830 () Bool)

(assert (=> b!308299 (= e!192829 e!192830)))

(declare-fun res!164937 () Bool)

(assert (=> b!308299 (=> (not res!164937) (not e!192830))))

(assert (=> b!308299 (= res!164937 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7781 a!3293)))))

(declare-fun b!308300 () Bool)

(assert (=> b!308300 (= e!192830 (arrayContainsKey!0 a!3293 k!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68305 (not res!164936)) b!308299))

(assert (= (and b!308299 res!164937) b!308300))

(assert (=> d!68305 m!318393))

(declare-fun m!318403 () Bool)

(assert (=> b!308300 m!318403))

(assert (=> b!308109 d!68305))

(declare-fun d!68307 () Bool)

(assert (=> d!68307 (= (validKeyInArray!0 k!2441) (and (not (= k!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!308103 d!68307))

(declare-fun e!192833 () SeekEntryResult!2569)

(declare-fun b!308301 () Bool)

(assert (=> b!308301 (= e!192833 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!308302 () Bool)

(declare-fun e!192832 () Bool)

(declare-fun e!192831 () Bool)

(assert (=> b!308302 (= e!192832 e!192831)))

(declare-fun res!164940 () Bool)

(declare-fun lt!151334 () SeekEntryResult!2569)

(assert (=> b!308302 (= res!164940 (and (is-Intermediate!2569 lt!151334) (not (undefined!3381 lt!151334)) (bvslt (x!30684 lt!151334) #b01111111111111111111111111111110) (bvsge (x!30684 lt!151334) #b00000000000000000000000000000000) (bvsge (x!30684 lt!151334) x!1427)))))

(assert (=> b!308302 (=> (not res!164940) (not e!192831))))

(declare-fun b!308303 () Bool)

(assert (=> b!308303 (= e!192832 (bvsge (x!30684 lt!151334) #b01111111111111111111111111111110))))

(declare-fun b!308304 () Bool)

(assert (=> b!308304 (= e!192833 (Intermediate!2569 false index!1781 x!1427))))

(declare-fun b!308305 () Bool)

(declare-fun e!192834 () SeekEntryResult!2569)

(assert (=> b!308305 (= e!192834 (Intermediate!2569 true index!1781 x!1427))))

(declare-fun b!308306 () Bool)

(assert (=> b!308306 (and (bvsge (index!12454 lt!151334) #b00000000000000000000000000000000) (bvslt (index!12454 lt!151334) (size!7781 a!3293)))))

(declare-fun res!164939 () Bool)

(assert (=> b!308306 (= res!164939 (= (select (arr!7429 a!3293) (index!12454 lt!151334)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!192835 () Bool)

(assert (=> b!308306 (=> res!164939 e!192835)))

(declare-fun b!308307 () Bool)

(assert (=> b!308307 (= e!192834 e!192833)))

(declare-fun c!49286 () Bool)

(declare-fun lt!151335 () (_ BitVec 64))

(assert (=> b!308307 (= c!49286 (or (= lt!151335 k!2441) (= (bvadd lt!151335 lt!151335) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!308308 () Bool)

(assert (=> b!308308 (and (bvsge (index!12454 lt!151334) #b00000000000000000000000000000000) (bvslt (index!12454 lt!151334) (size!7781 a!3293)))))

(declare-fun res!164938 () Bool)

(assert (=> b!308308 (= res!164938 (= (select (arr!7429 a!3293) (index!12454 lt!151334)) k!2441))))

(assert (=> b!308308 (=> res!164938 e!192835)))

(assert (=> b!308308 (= e!192831 e!192835)))

(declare-fun b!308309 () Bool)

(assert (=> b!308309 (and (bvsge (index!12454 lt!151334) #b00000000000000000000000000000000) (bvslt (index!12454 lt!151334) (size!7781 a!3293)))))

(assert (=> b!308309 (= e!192835 (= (select (arr!7429 a!3293) (index!12454 lt!151334)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!68309 () Bool)

(assert (=> d!68309 e!192832))

(declare-fun c!49285 () Bool)

(assert (=> d!68309 (= c!49285 (and (is-Intermediate!2569 lt!151334) (undefined!3381 lt!151334)))))

(assert (=> d!68309 (= lt!151334 e!192834)))

(declare-fun c!49287 () Bool)

(assert (=> d!68309 (= c!49287 (bvsge x!1427 #b01111111111111111111111111111110))))

(assert (=> d!68309 (= lt!151335 (select (arr!7429 a!3293) index!1781))))

(assert (=> d!68309 (validMask!0 mask!3709)))

(assert (=> d!68309 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!151334)))

(assert (= (and d!68309 c!49287) b!308305))

(assert (= (and d!68309 (not c!49287)) b!308307))

(assert (= (and b!308307 c!49286) b!308304))

(assert (= (and b!308307 (not c!49286)) b!308301))

(assert (= (and d!68309 c!49285) b!308303))

(assert (= (and d!68309 (not c!49285)) b!308302))

(assert (= (and b!308302 res!164940) b!308308))

(assert (= (and b!308308 (not res!164938)) b!308306))

(assert (= (and b!308306 (not res!164939)) b!308309))

(assert (=> b!308301 m!318291))

(assert (=> b!308301 m!318291))

(declare-fun m!318405 () Bool)

(assert (=> b!308301 m!318405))

(declare-fun m!318407 () Bool)

(assert (=> b!308308 m!318407))

(assert (=> d!68309 m!318281))

(assert (=> d!68309 m!318295))

(assert (=> b!308309 m!318407))

(assert (=> b!308306 m!318407))

(assert (=> b!308108 d!68309))

(declare-fun d!68311 () Bool)

(declare-fun lt!151343 () SeekEntryResult!2569)

(assert (=> d!68311 (and (or (is-Undefined!2569 lt!151343) (not (is-Found!2569 lt!151343)) (and (bvsge (index!12453 lt!151343) #b00000000000000000000000000000000) (bvslt (index!12453 lt!151343) (size!7781 a!3293)))) (or (is-Undefined!2569 lt!151343) (is-Found!2569 lt!151343) (not (is-MissingZero!2569 lt!151343)) (and (bvsge (index!12452 lt!151343) #b00000000000000000000000000000000) (bvslt (index!12452 lt!151343) (size!7781 a!3293)))) (or (is-Undefined!2569 lt!151343) (is-Found!2569 lt!151343) (is-MissingZero!2569 lt!151343) (not (is-MissingVacant!2569 lt!151343)) (and (bvsge (index!12455 lt!151343) #b00000000000000000000000000000000) (bvslt (index!12455 lt!151343) (size!7781 a!3293)))) (or (is-Undefined!2569 lt!151343) (ite (is-Found!2569 lt!151343) (= (select (arr!7429 a!3293) (index!12453 lt!151343)) k!2441) (ite (is-MissingZero!2569 lt!151343) (= (select (arr!7429 a!3293) (index!12452 lt!151343)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2569 lt!151343) (= (select (arr!7429 a!3293) (index!12455 lt!151343)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!192843 () SeekEntryResult!2569)

(assert (=> d!68311 (= lt!151343 e!192843)))

(declare-fun c!49295 () Bool)

(declare-fun lt!151344 () SeekEntryResult!2569)

(assert (=> d!68311 (= c!49295 (and (is-Intermediate!2569 lt!151344) (undefined!3381 lt!151344)))))

(assert (=> d!68311 (= lt!151344 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(assert (=> d!68311 (validMask!0 mask!3709)))

(assert (=> d!68311 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) lt!151343)))

(declare-fun b!308322 () Bool)

(declare-fun e!192842 () SeekEntryResult!2569)

(assert (=> b!308322 (= e!192842 (MissingZero!2569 (index!12454 lt!151344)))))

(declare-fun b!308323 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15688 (_ BitVec 32)) SeekEntryResult!2569)

(assert (=> b!308323 (= e!192842 (seekKeyOrZeroReturnVacant!0 (x!30684 lt!151344) (index!12454 lt!151344) (index!12454 lt!151344) k!2441 a!3293 mask!3709))))

(declare-fun b!308324 () Bool)

(declare-fun c!49294 () Bool)

(declare-fun lt!151342 () (_ BitVec 64))

(assert (=> b!308324 (= c!49294 (= lt!151342 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!192844 () SeekEntryResult!2569)

(assert (=> b!308324 (= e!192844 e!192842)))

(declare-fun b!308325 () Bool)

(assert (=> b!308325 (= e!192843 e!192844)))

(assert (=> b!308325 (= lt!151342 (select (arr!7429 a!3293) (index!12454 lt!151344)))))

