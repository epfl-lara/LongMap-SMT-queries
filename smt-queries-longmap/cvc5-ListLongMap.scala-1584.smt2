; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30086 () Bool)

(assert start!30086)

(declare-fun b!301626 () Bool)

(declare-fun res!159306 () Bool)

(declare-fun e!190315 () Bool)

(assert (=> b!301626 (=> (not res!159306) (not e!190315))))

(declare-datatypes ((array!15276 0))(
  ( (array!15277 (arr!7229 (Array (_ BitVec 32) (_ BitVec 64))) (size!7581 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15276)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15276 (_ BitVec 32)) Bool)

(assert (=> b!301626 (= res!159306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301627 () Bool)

(declare-fun res!159304 () Bool)

(assert (=> b!301627 (=> (not res!159304) (not e!190315))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15276 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301627 (= res!159304 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301628 () Bool)

(declare-fun res!159307 () Bool)

(assert (=> b!301628 (=> (not res!159307) (not e!190315))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301628 (= res!159307 (and (= (size!7581 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7581 a!3293))))))

(declare-fun b!301629 () Bool)

(declare-fun res!159305 () Bool)

(assert (=> b!301629 (=> (not res!159305) (not e!190315))))

(declare-datatypes ((SeekEntryResult!2369 0))(
  ( (MissingZero!2369 (index!11652 (_ BitVec 32))) (Found!2369 (index!11653 (_ BitVec 32))) (Intermediate!2369 (undefined!3181 Bool) (index!11654 (_ BitVec 32)) (x!29929 (_ BitVec 32))) (Undefined!2369) (MissingVacant!2369 (index!11655 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15276 (_ BitVec 32)) SeekEntryResult!2369)

(assert (=> b!301629 (= res!159305 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2369 i!1240)))))

(declare-fun res!159309 () Bool)

(assert (=> start!30086 (=> (not res!159309) (not e!190315))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30086 (= res!159309 (validMask!0 mask!3709))))

(assert (=> start!30086 e!190315))

(assert (=> start!30086 true))

(declare-fun array_inv!5192 (array!15276) Bool)

(assert (=> start!30086 (array_inv!5192 a!3293)))

(declare-fun b!301630 () Bool)

(declare-fun lt!149874 () (_ BitVec 32))

(assert (=> b!301630 (= e!190315 (and (bvsge mask!3709 #b00000000000000000000000000000000) (or (bvslt lt!149874 #b00000000000000000000000000000000) (bvsge lt!149874 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301630 (= lt!149874 (toIndex!0 k!2441 mask!3709))))

(declare-fun b!301631 () Bool)

(declare-fun res!159308 () Bool)

(assert (=> b!301631 (=> (not res!159308) (not e!190315))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301631 (= res!159308 (validKeyInArray!0 k!2441))))

(assert (= (and start!30086 res!159309) b!301628))

(assert (= (and b!301628 res!159307) b!301631))

(assert (= (and b!301631 res!159308) b!301627))

(assert (= (and b!301627 res!159304) b!301629))

(assert (= (and b!301629 res!159305) b!301626))

(assert (= (and b!301626 res!159306) b!301630))

(declare-fun m!313361 () Bool)

(assert (=> b!301631 m!313361))

(declare-fun m!313363 () Bool)

(assert (=> start!30086 m!313363))

(declare-fun m!313365 () Bool)

(assert (=> start!30086 m!313365))

(declare-fun m!313367 () Bool)

(assert (=> b!301629 m!313367))

(declare-fun m!313369 () Bool)

(assert (=> b!301630 m!313369))

(declare-fun m!313371 () Bool)

(assert (=> b!301626 m!313371))

(declare-fun m!313373 () Bool)

(assert (=> b!301627 m!313373))

(push 1)

(assert (not b!301630))

(assert (not b!301627))

(assert (not start!30086))

(assert (not b!301631))

(assert (not b!301626))

(assert (not b!301629))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!301704 () Bool)

(declare-fun e!190350 () SeekEntryResult!2369)

(declare-fun lt!149908 () SeekEntryResult!2369)

(assert (=> b!301704 (= e!190350 (MissingZero!2369 (index!11654 lt!149908)))))

(declare-fun d!67907 () Bool)

(declare-fun lt!149907 () SeekEntryResult!2369)

(assert (=> d!67907 (and (or (is-Undefined!2369 lt!149907) (not (is-Found!2369 lt!149907)) (and (bvsge (index!11653 lt!149907) #b00000000000000000000000000000000) (bvslt (index!11653 lt!149907) (size!7581 a!3293)))) (or (is-Undefined!2369 lt!149907) (is-Found!2369 lt!149907) (not (is-MissingZero!2369 lt!149907)) (and (bvsge (index!11652 lt!149907) #b00000000000000000000000000000000) (bvslt (index!11652 lt!149907) (size!7581 a!3293)))) (or (is-Undefined!2369 lt!149907) (is-Found!2369 lt!149907) (is-MissingZero!2369 lt!149907) (not (is-MissingVacant!2369 lt!149907)) (and (bvsge (index!11655 lt!149907) #b00000000000000000000000000000000) (bvslt (index!11655 lt!149907) (size!7581 a!3293)))) (or (is-Undefined!2369 lt!149907) (ite (is-Found!2369 lt!149907) (= (select (arr!7229 a!3293) (index!11653 lt!149907)) k!2441) (ite (is-MissingZero!2369 lt!149907) (= (select (arr!7229 a!3293) (index!11652 lt!149907)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2369 lt!149907) (= (select (arr!7229 a!3293) (index!11655 lt!149907)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!190349 () SeekEntryResult!2369)

(assert (=> d!67907 (= lt!149907 e!190349)))

(declare-fun c!48774 () Bool)

(assert (=> d!67907 (= c!48774 (and (is-Intermediate!2369 lt!149908) (undefined!3181 lt!149908)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15276 (_ BitVec 32)) SeekEntryResult!2369)

(assert (=> d!67907 (= lt!149908 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(assert (=> d!67907 (validMask!0 mask!3709)))

(assert (=> d!67907 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) lt!149907)))

(declare-fun b!301705 () Bool)

(assert (=> b!301705 (= e!190349 Undefined!2369)))

(declare-fun b!301706 () Bool)

(declare-fun e!190351 () SeekEntryResult!2369)

(assert (=> b!301706 (= e!190351 (Found!2369 (index!11654 lt!149908)))))

(declare-fun b!301707 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15276 (_ BitVec 32)) SeekEntryResult!2369)

(assert (=> b!301707 (= e!190350 (seekKeyOrZeroReturnVacant!0 (x!29929 lt!149908) (index!11654 lt!149908) (index!11654 lt!149908) k!2441 a!3293 mask!3709))))

(declare-fun b!301708 () Bool)

(declare-fun c!48773 () Bool)

(declare-fun lt!149906 () (_ BitVec 64))

(assert (=> b!301708 (= c!48773 (= lt!149906 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!301708 (= e!190351 e!190350)))

(declare-fun b!301709 () Bool)

(assert (=> b!301709 (= e!190349 e!190351)))

(assert (=> b!301709 (= lt!149906 (select (arr!7229 a!3293) (index!11654 lt!149908)))))

(declare-fun c!48772 () Bool)

(assert (=> b!301709 (= c!48772 (= lt!149906 k!2441))))

(assert (= (and d!67907 c!48774) b!301705))

(assert (= (and d!67907 (not c!48774)) b!301709))

(assert (= (and b!301709 c!48772) b!301706))

(assert (= (and b!301709 (not c!48772)) b!301708))

(assert (= (and b!301708 c!48773) b!301704))

(assert (= (and b!301708 (not c!48773)) b!301707))

(assert (=> d!67907 m!313363))

(declare-fun m!313419 () Bool)

(assert (=> d!67907 m!313419))

(assert (=> d!67907 m!313369))

(declare-fun m!313421 () Bool)

(assert (=> d!67907 m!313421))

(declare-fun m!313423 () Bool)

(assert (=> d!67907 m!313423))

(assert (=> d!67907 m!313369))

(declare-fun m!313425 () Bool)

(assert (=> d!67907 m!313425))

(declare-fun m!313427 () Bool)

(assert (=> b!301707 m!313427))

(declare-fun m!313429 () Bool)

(assert (=> b!301709 m!313429))

(assert (=> b!301629 d!67907))

(declare-fun d!67923 () Bool)

(declare-fun lt!149916 () (_ BitVec 32))

(declare-fun lt!149915 () (_ BitVec 32))

(assert (=> d!67923 (= lt!149916 (bvmul (bvxor lt!149915 (bvlshr lt!149915 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67923 (= lt!149915 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67923 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!159354 (let ((h!5330 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29934 (bvmul (bvxor h!5330 (bvlshr h!5330 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29934 (bvlshr x!29934 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!159354 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!159354 #b00000000000000000000000000000000))))))

(assert (=> d!67923 (= (toIndex!0 k!2441 mask!3709) (bvand (bvxor lt!149916 (bvlshr lt!149916 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!301630 d!67923))

(declare-fun d!67927 () Bool)

(assert (=> d!67927 (= (validKeyInArray!0 k!2441) (and (not (= k!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!301631 d!67927))

(declare-fun b!301726 () Bool)

(declare-fun e!190366 () Bool)

(declare-fun e!190364 () Bool)

(assert (=> b!301726 (= e!190366 e!190364)))

(declare-fun lt!149929 () (_ BitVec 64))

(assert (=> b!301726 (= lt!149929 (select (arr!7229 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9379 0))(
  ( (Unit!9380) )
))
(declare-fun lt!149931 () Unit!9379)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15276 (_ BitVec 64) (_ BitVec 32)) Unit!9379)

(assert (=> b!301726 (= lt!149931 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!149929 #b00000000000000000000000000000000))))

(assert (=> b!301726 (arrayContainsKey!0 a!3293 lt!149929 #b00000000000000000000000000000000)))

(declare-fun lt!149930 () Unit!9379)

(assert (=> b!301726 (= lt!149930 lt!149931)))

(declare-fun res!159364 () Bool)

(assert (=> b!301726 (= res!159364 (= (seekEntryOrOpen!0 (select (arr!7229 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2369 #b00000000000000000000000000000000)))))

(assert (=> b!301726 (=> (not res!159364) (not e!190364))))

(declare-fun b!301727 () Bool)

(declare-fun e!190365 () Bool)

(assert (=> b!301727 (= e!190365 e!190366)))

(declare-fun c!48779 () Bool)

(assert (=> b!301727 (= c!48779 (validKeyInArray!0 (select (arr!7229 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!301728 () Bool)

(declare-fun call!25878 () Bool)

(assert (=> b!301728 (= e!190364 call!25878)))

(declare-fun b!301729 () Bool)

(assert (=> b!301729 (= e!190366 call!25878)))

(declare-fun bm!25875 () Bool)

(assert (=> bm!25875 (= call!25878 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun d!67929 () Bool)

(declare-fun res!159363 () Bool)

(assert (=> d!67929 (=> res!159363 e!190365)))

(assert (=> d!67929 (= res!159363 (bvsge #b00000000000000000000000000000000 (size!7581 a!3293)))))

(assert (=> d!67929 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!190365)))

(assert (= (and d!67929 (not res!159363)) b!301727))

(assert (= (and b!301727 c!48779) b!301726))

(assert (= (and b!301727 (not c!48779)) b!301729))

(assert (= (and b!301726 res!159364) b!301728))

(assert (= (or b!301728 b!301729) bm!25875))

(declare-fun m!313431 () Bool)

(assert (=> b!301726 m!313431))

(declare-fun m!313433 () Bool)

(assert (=> b!301726 m!313433))

(declare-fun m!313435 () Bool)

(assert (=> b!301726 m!313435))

(assert (=> b!301726 m!313431))

(declare-fun m!313437 () Bool)

(assert (=> b!301726 m!313437))

(assert (=> b!301727 m!313431))

(assert (=> b!301727 m!313431))

(declare-fun m!313439 () Bool)

(assert (=> b!301727 m!313439))

(declare-fun m!313441 () Bool)

(assert (=> bm!25875 m!313441))

(assert (=> b!301626 d!67929))

(declare-fun d!67935 () Bool)

(declare-fun res!159371 () Bool)

(declare-fun e!190380 () Bool)

(assert (=> d!67935 (=> res!159371 e!190380)))

(assert (=> d!67935 (= res!159371 (= (select (arr!7229 a!3293) #b00000000000000000000000000000000) k!2441))))

(assert (=> d!67935 (= (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000) e!190380)))

(declare-fun b!301750 () Bool)

(declare-fun e!190381 () Bool)

(assert (=> b!301750 (= e!190380 e!190381)))

(declare-fun res!159372 () Bool)

(assert (=> b!301750 (=> (not res!159372) (not e!190381))))

(assert (=> b!301750 (= res!159372 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7581 a!3293)))))

(declare-fun b!301751 () Bool)

(assert (=> b!301751 (= e!190381 (arrayContainsKey!0 a!3293 k!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67935 (not res!159371)) b!301750))

(assert (= (and b!301750 res!159372) b!301751))

(assert (=> d!67935 m!313431))

(declare-fun m!313455 () Bool)

(assert (=> b!301751 m!313455))

(assert (=> b!301627 d!67935))

(declare-fun d!67939 () Bool)

(assert (=> d!67939 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!30086 d!67939))

(declare-fun d!67945 () Bool)

(assert (=> d!67945 (= (array_inv!5192 a!3293) (bvsge (size!7581 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!30086 d!67945))

(push 1)

(assert (not b!301751))

(assert (not b!301726))

(assert (not d!67907))

(assert (not bm!25875))

(assert (not b!301727))

(assert (not b!301707))

(check-sat)

(pop 1)

(push 1)

(check-sat)

