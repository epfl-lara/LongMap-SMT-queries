; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30090 () Bool)

(assert start!30090)

(declare-fun b!301662 () Bool)

(declare-fun res!159345 () Bool)

(declare-fun e!190327 () Bool)

(assert (=> b!301662 (=> (not res!159345) (not e!190327))))

(declare-datatypes ((array!15280 0))(
  ( (array!15281 (arr!7231 (Array (_ BitVec 32) (_ BitVec 64))) (size!7583 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15280)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301662 (= res!159345 (and (= (size!7583 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7583 a!3293))))))

(declare-fun b!301663 () Bool)

(declare-fun res!159342 () Bool)

(assert (=> b!301663 (=> (not res!159342) (not e!190327))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15280 (_ BitVec 32)) Bool)

(assert (=> b!301663 (= res!159342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301664 () Bool)

(declare-fun res!159344 () Bool)

(assert (=> b!301664 (=> (not res!159344) (not e!190327))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15280 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301664 (= res!159344 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!159340 () Bool)

(assert (=> start!30090 (=> (not res!159340) (not e!190327))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30090 (= res!159340 (validMask!0 mask!3709))))

(assert (=> start!30090 e!190327))

(assert (=> start!30090 true))

(declare-fun array_inv!5194 (array!15280) Bool)

(assert (=> start!30090 (array_inv!5194 a!3293)))

(declare-fun b!301665 () Bool)

(declare-fun lt!149880 () (_ BitVec 32))

(assert (=> b!301665 (= e!190327 (and (bvsge mask!3709 #b00000000000000000000000000000000) (or (bvslt lt!149880 #b00000000000000000000000000000000) (bvsge lt!149880 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301665 (= lt!149880 (toIndex!0 k!2441 mask!3709))))

(declare-fun b!301666 () Bool)

(declare-fun res!159341 () Bool)

(assert (=> b!301666 (=> (not res!159341) (not e!190327))))

(declare-datatypes ((SeekEntryResult!2371 0))(
  ( (MissingZero!2371 (index!11660 (_ BitVec 32))) (Found!2371 (index!11661 (_ BitVec 32))) (Intermediate!2371 (undefined!3183 Bool) (index!11662 (_ BitVec 32)) (x!29931 (_ BitVec 32))) (Undefined!2371) (MissingVacant!2371 (index!11663 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15280 (_ BitVec 32)) SeekEntryResult!2371)

(assert (=> b!301666 (= res!159341 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2371 i!1240)))))

(declare-fun b!301667 () Bool)

(declare-fun res!159343 () Bool)

(assert (=> b!301667 (=> (not res!159343) (not e!190327))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301667 (= res!159343 (validKeyInArray!0 k!2441))))

(assert (= (and start!30090 res!159340) b!301662))

(assert (= (and b!301662 res!159345) b!301667))

(assert (= (and b!301667 res!159343) b!301664))

(assert (= (and b!301664 res!159344) b!301666))

(assert (= (and b!301666 res!159341) b!301663))

(assert (= (and b!301663 res!159342) b!301665))

(declare-fun m!313389 () Bool)

(assert (=> b!301664 m!313389))

(declare-fun m!313391 () Bool)

(assert (=> start!30090 m!313391))

(declare-fun m!313393 () Bool)

(assert (=> start!30090 m!313393))

(declare-fun m!313395 () Bool)

(assert (=> b!301667 m!313395))

(declare-fun m!313397 () Bool)

(assert (=> b!301665 m!313397))

(declare-fun m!313399 () Bool)

(assert (=> b!301666 m!313399))

(declare-fun m!313401 () Bool)

(assert (=> b!301663 m!313401))

(push 1)

(assert (not b!301667))

(assert (not b!301664))

(assert (not start!30090))

(assert (not b!301666))

(assert (not b!301663))

(assert (not b!301665))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!67909 () Bool)

(declare-fun res!159350 () Bool)

(declare-fun e!190332 () Bool)

(assert (=> d!67909 (=> res!159350 e!190332)))

(assert (=> d!67909 (= res!159350 (= (select (arr!7231 a!3293) #b00000000000000000000000000000000) k!2441))))

(assert (=> d!67909 (= (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000) e!190332)))

(declare-fun b!301672 () Bool)

(declare-fun e!190333 () Bool)

(assert (=> b!301672 (= e!190332 e!190333)))

(declare-fun res!159351 () Bool)

(assert (=> b!301672 (=> (not res!159351) (not e!190333))))

(assert (=> b!301672 (= res!159351 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7583 a!3293)))))

(declare-fun b!301673 () Bool)

(assert (=> b!301673 (= e!190333 (arrayContainsKey!0 a!3293 k!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67909 (not res!159350)) b!301672))

(assert (= (and b!301672 res!159351) b!301673))

(declare-fun m!313403 () Bool)

(assert (=> d!67909 m!313403))

(declare-fun m!313405 () Bool)

(assert (=> b!301673 m!313405))

(assert (=> b!301664 d!67909))

(declare-fun d!67911 () Bool)

(assert (=> d!67911 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!30090 d!67911))

(declare-fun d!67917 () Bool)

(assert (=> d!67917 (= (array_inv!5194 a!3293) (bvsge (size!7583 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!30090 d!67917))

(declare-fun d!67919 () Bool)

(declare-fun lt!149910 () (_ BitVec 32))

(declare-fun lt!149909 () (_ BitVec 32))

(assert (=> d!67919 (= lt!149910 (bvmul (bvxor lt!149909 (bvlshr lt!149909 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67919 (= lt!149909 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67919 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!159353 (let ((h!5329 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29933 (bvmul (bvxor h!5329 (bvlshr h!5329 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29933 (bvlshr x!29933 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!159353 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!159353 #b00000000000000000000000000000000))))))

(assert (=> d!67919 (= (toIndex!0 k!2441 mask!3709) (bvand (bvxor lt!149910 (bvlshr lt!149910 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!301665 d!67919))

(declare-fun b!301756 () Bool)

(declare-fun c!48788 () Bool)

(declare-fun lt!149941 () (_ BitVec 64))

(assert (=> b!301756 (= c!48788 (= lt!149941 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!190386 () SeekEntryResult!2371)

(declare-fun e!190387 () SeekEntryResult!2371)

(assert (=> b!301756 (= e!190386 e!190387)))

(declare-fun b!301757 () Bool)

(declare-fun e!190388 () SeekEntryResult!2371)

(assert (=> b!301757 (= e!190388 e!190386)))

(declare-fun lt!149943 () SeekEntryResult!2371)

(assert (=> b!301757 (= lt!149941 (select (arr!7231 a!3293) (index!11662 lt!149943)))))

(declare-fun c!48787 () Bool)

(assert (=> b!301757 (= c!48787 (= lt!149941 k!2441))))

(declare-fun b!301758 () Bool)

(assert (=> b!301758 (= e!190387 (MissingZero!2371 (index!11662 lt!149943)))))

(declare-fun b!301759 () Bool)

(assert (=> b!301759 (= e!190388 Undefined!2371)))

(declare-fun d!67925 () Bool)

(declare-fun lt!149942 () SeekEntryResult!2371)

(assert (=> d!67925 (and (or (is-Undefined!2371 lt!149942) (not (is-Found!2371 lt!149942)) (and (bvsge (index!11661 lt!149942) #b00000000000000000000000000000000) (bvslt (index!11661 lt!149942) (size!7583 a!3293)))) (or (is-Undefined!2371 lt!149942) (is-Found!2371 lt!149942) (not (is-MissingZero!2371 lt!149942)) (and (bvsge (index!11660 lt!149942) #b00000000000000000000000000000000) (bvslt (index!11660 lt!149942) (size!7583 a!3293)))) (or (is-Undefined!2371 lt!149942) (is-Found!2371 lt!149942) (is-MissingZero!2371 lt!149942) (not (is-MissingVacant!2371 lt!149942)) (and (bvsge (index!11663 lt!149942) #b00000000000000000000000000000000) (bvslt (index!11663 lt!149942) (size!7583 a!3293)))) (or (is-Undefined!2371 lt!149942) (ite (is-Found!2371 lt!149942) (= (select (arr!7231 a!3293) (index!11661 lt!149942)) k!2441) (ite (is-MissingZero!2371 lt!149942) (= (select (arr!7231 a!3293) (index!11660 lt!149942)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2371 lt!149942) (= (select (arr!7231 a!3293) (index!11663 lt!149942)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67925 (= lt!149942 e!190388)))

(declare-fun c!48789 () Bool)

(assert (=> d!67925 (= c!48789 (and (is-Intermediate!2371 lt!149943) (undefined!3183 lt!149943)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15280 (_ BitVec 32)) SeekEntryResult!2371)

(assert (=> d!67925 (= lt!149943 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(assert (=> d!67925 (validMask!0 mask!3709)))

(assert (=> d!67925 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) lt!149942)))

(declare-fun b!301760 () Bool)

(assert (=> b!301760 (= e!190386 (Found!2371 (index!11662 lt!149943)))))

(declare-fun b!301761 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15280 (_ BitVec 32)) SeekEntryResult!2371)

(assert (=> b!301761 (= e!190387 (seekKeyOrZeroReturnVacant!0 (x!29931 lt!149943) (index!11662 lt!149943) (index!11662 lt!149943) k!2441 a!3293 mask!3709))))

(assert (= (and d!67925 c!48789) b!301759))

(assert (= (and d!67925 (not c!48789)) b!301757))

(assert (= (and b!301757 c!48787) b!301760))

(assert (= (and b!301757 (not c!48787)) b!301756))

(assert (= (and b!301756 c!48788) b!301758))

(assert (= (and b!301756 (not c!48788)) b!301761))

(declare-fun m!313457 () Bool)

(assert (=> b!301757 m!313457))

(assert (=> d!67925 m!313391))

(declare-fun m!313459 () Bool)

(assert (=> d!67925 m!313459))

(assert (=> d!67925 m!313397))

(declare-fun m!313463 () Bool)

(assert (=> d!67925 m!313463))

(assert (=> d!67925 m!313397))

(declare-fun m!313465 () Bool)

(assert (=> d!67925 m!313465))

(declare-fun m!313467 () Bool)

(assert (=> d!67925 m!313467))

(declare-fun m!313469 () Bool)

(assert (=> b!301761 m!313469))

(assert (=> b!301666 d!67925))

(declare-fun d!67941 () Bool)

(assert (=> d!67941 (= (validKeyInArray!0 k!2441) (and (not (= k!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!301667 d!67941))

(declare-fun b!301772 () Bool)

(declare-fun e!190399 () Bool)

(declare-fun call!25882 () Bool)

(assert (=> b!301772 (= e!190399 call!25882)))

(declare-fun b!301773 () Bool)

(declare-fun e!190397 () Bool)

(assert (=> b!301773 (= e!190397 call!25882)))

(declare-fun bm!25879 () Bool)

(assert (=> bm!25879 (= call!25882 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun d!67943 () Bool)

(declare-fun res!159384 () Bool)

(declare-fun e!190398 () Bool)

(assert (=> d!67943 (=> res!159384 e!190398)))

(assert (=> d!67943 (= res!159384 (bvsge #b00000000000000000000000000000000 (size!7583 a!3293)))))

(assert (=> d!67943 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!190398)))

(declare-fun b!301774 () Bool)

(assert (=> b!301774 (= e!190398 e!190397)))

(declare-fun c!48792 () Bool)

(assert (=> b!301774 (= c!48792 (validKeyInArray!0 (select (arr!7231 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!301775 () Bool)

(assert (=> b!301775 (= e!190397 e!190399)))

(declare-fun lt!149950 () (_ BitVec 64))

(assert (=> b!301775 (= lt!149950 (select (arr!7231 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9381 0))(
  ( (Unit!9382) )
))
(declare-fun lt!149952 () Unit!9381)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15280 (_ BitVec 64) (_ BitVec 32)) Unit!9381)

(assert (=> b!301775 (= lt!149952 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!149950 #b00000000000000000000000000000000))))

(assert (=> b!301775 (arrayContainsKey!0 a!3293 lt!149950 #b00000000000000000000000000000000)))

(declare-fun lt!149951 () Unit!9381)

(assert (=> b!301775 (= lt!149951 lt!149952)))

(declare-fun res!159383 () Bool)

(assert (=> b!301775 (= res!159383 (= (seekEntryOrOpen!0 (select (arr!7231 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2371 #b00000000000000000000000000000000)))))

(assert (=> b!301775 (=> (not res!159383) (not e!190399))))

(assert (= (and d!67943 (not res!159384)) b!301774))

(assert (= (and b!301774 c!48792) b!301775))

(assert (= (and b!301774 (not c!48792)) b!301773))

(assert (= (and b!301775 res!159383) b!301772))

(assert (= (or b!301772 b!301773) bm!25879))

(declare-fun m!313471 () Bool)

(assert (=> bm!25879 m!313471))

(assert (=> b!301774 m!313403))

(assert (=> b!301774 m!313403))

(declare-fun m!313473 () Bool)

(assert (=> b!301774 m!313473))

(assert (=> b!301775 m!313403))

(declare-fun m!313475 () Bool)

(assert (=> b!301775 m!313475))

(declare-fun m!313477 () Bool)

(assert (=> b!301775 m!313477))

(assert (=> b!301775 m!313403))

(declare-fun m!313479 () Bool)

(assert (=> b!301775 m!313479))

(assert (=> b!301663 d!67943))

(push 1)

