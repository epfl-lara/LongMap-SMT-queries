; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30072 () Bool)

(assert start!30072)

(declare-fun b!301351 () Bool)

(declare-fun res!159179 () Bool)

(declare-fun e!190139 () Bool)

(assert (=> b!301351 (=> (not res!159179) (not e!190139))))

(declare-datatypes ((array!15266 0))(
  ( (array!15267 (arr!7224 (Array (_ BitVec 32) (_ BitVec 64))) (size!7577 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15266)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2363 0))(
  ( (MissingZero!2363 (index!11628 (_ BitVec 32))) (Found!2363 (index!11629 (_ BitVec 32))) (Intermediate!2363 (undefined!3175 Bool) (index!11630 (_ BitVec 32)) (x!29918 (_ BitVec 32))) (Undefined!2363) (MissingVacant!2363 (index!11631 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15266 (_ BitVec 32)) SeekEntryResult!2363)

(assert (=> b!301351 (= res!159179 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2363 i!1240)))))

(declare-fun b!301352 () Bool)

(declare-fun lt!149639 () (_ BitVec 32))

(assert (=> b!301352 (= e!190139 (and (bvsge mask!3709 #b00000000000000000000000000000000) (or (bvslt lt!149639 #b00000000000000000000000000000000) (bvsge lt!149639 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301352 (= lt!149639 (toIndex!0 k0!2441 mask!3709))))

(declare-fun b!301353 () Bool)

(declare-fun res!159177 () Bool)

(assert (=> b!301353 (=> (not res!159177) (not e!190139))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15266 (_ BitVec 32)) Bool)

(assert (=> b!301353 (= res!159177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301354 () Bool)

(declare-fun res!159176 () Bool)

(assert (=> b!301354 (=> (not res!159176) (not e!190139))))

(declare-fun arrayContainsKey!0 (array!15266 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301354 (= res!159176 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!159175 () Bool)

(assert (=> start!30072 (=> (not res!159175) (not e!190139))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30072 (= res!159175 (validMask!0 mask!3709))))

(assert (=> start!30072 e!190139))

(assert (=> start!30072 true))

(declare-fun array_inv!5196 (array!15266) Bool)

(assert (=> start!30072 (array_inv!5196 a!3293)))

(declare-fun b!301355 () Bool)

(declare-fun res!159180 () Bool)

(assert (=> b!301355 (=> (not res!159180) (not e!190139))))

(assert (=> b!301355 (= res!159180 (and (= (size!7577 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7577 a!3293))))))

(declare-fun b!301356 () Bool)

(declare-fun res!159178 () Bool)

(assert (=> b!301356 (=> (not res!159178) (not e!190139))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301356 (= res!159178 (validKeyInArray!0 k0!2441))))

(assert (= (and start!30072 res!159175) b!301355))

(assert (= (and b!301355 res!159180) b!301356))

(assert (= (and b!301356 res!159178) b!301354))

(assert (= (and b!301354 res!159176) b!301351))

(assert (= (and b!301351 res!159179) b!301353))

(assert (= (and b!301353 res!159177) b!301352))

(declare-fun m!312631 () Bool)

(assert (=> b!301356 m!312631))

(declare-fun m!312633 () Bool)

(assert (=> b!301354 m!312633))

(declare-fun m!312635 () Bool)

(assert (=> b!301352 m!312635))

(declare-fun m!312637 () Bool)

(assert (=> start!30072 m!312637))

(declare-fun m!312639 () Bool)

(assert (=> start!30072 m!312639))

(declare-fun m!312641 () Bool)

(assert (=> b!301353 m!312641))

(declare-fun m!312643 () Bool)

(assert (=> b!301351 m!312643))

(check-sat (not b!301354) (not b!301356) (not b!301351) (not start!30072) (not b!301353) (not b!301352))
(check-sat)
(get-model)

(declare-fun e!190165 () SeekEntryResult!2363)

(declare-fun b!301411 () Bool)

(declare-fun lt!149654 () SeekEntryResult!2363)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15266 (_ BitVec 32)) SeekEntryResult!2363)

(assert (=> b!301411 (= e!190165 (seekKeyOrZeroReturnVacant!0 (x!29918 lt!149654) (index!11630 lt!149654) (index!11630 lt!149654) k0!2441 a!3293 mask!3709))))

(declare-fun b!301412 () Bool)

(assert (=> b!301412 (= e!190165 (MissingZero!2363 (index!11630 lt!149654)))))

(declare-fun b!301413 () Bool)

(declare-fun c!48691 () Bool)

(declare-fun lt!149653 () (_ BitVec 64))

(assert (=> b!301413 (= c!48691 (= lt!149653 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!190166 () SeekEntryResult!2363)

(assert (=> b!301413 (= e!190166 e!190165)))

(declare-fun b!301414 () Bool)

(declare-fun e!190164 () SeekEntryResult!2363)

(assert (=> b!301414 (= e!190164 e!190166)))

(assert (=> b!301414 (= lt!149653 (select (arr!7224 a!3293) (index!11630 lt!149654)))))

(declare-fun c!48690 () Bool)

(assert (=> b!301414 (= c!48690 (= lt!149653 k0!2441))))

(declare-fun b!301415 () Bool)

(assert (=> b!301415 (= e!190166 (Found!2363 (index!11630 lt!149654)))))

(declare-fun d!67699 () Bool)

(declare-fun lt!149652 () SeekEntryResult!2363)

(get-info :version)

(assert (=> d!67699 (and (or ((_ is Undefined!2363) lt!149652) (not ((_ is Found!2363) lt!149652)) (and (bvsge (index!11629 lt!149652) #b00000000000000000000000000000000) (bvslt (index!11629 lt!149652) (size!7577 a!3293)))) (or ((_ is Undefined!2363) lt!149652) ((_ is Found!2363) lt!149652) (not ((_ is MissingZero!2363) lt!149652)) (and (bvsge (index!11628 lt!149652) #b00000000000000000000000000000000) (bvslt (index!11628 lt!149652) (size!7577 a!3293)))) (or ((_ is Undefined!2363) lt!149652) ((_ is Found!2363) lt!149652) ((_ is MissingZero!2363) lt!149652) (not ((_ is MissingVacant!2363) lt!149652)) (and (bvsge (index!11631 lt!149652) #b00000000000000000000000000000000) (bvslt (index!11631 lt!149652) (size!7577 a!3293)))) (or ((_ is Undefined!2363) lt!149652) (ite ((_ is Found!2363) lt!149652) (= (select (arr!7224 a!3293) (index!11629 lt!149652)) k0!2441) (ite ((_ is MissingZero!2363) lt!149652) (= (select (arr!7224 a!3293) (index!11628 lt!149652)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2363) lt!149652) (= (select (arr!7224 a!3293) (index!11631 lt!149652)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67699 (= lt!149652 e!190164)))

(declare-fun c!48692 () Bool)

(assert (=> d!67699 (= c!48692 (and ((_ is Intermediate!2363) lt!149654) (undefined!3175 lt!149654)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15266 (_ BitVec 32)) SeekEntryResult!2363)

(assert (=> d!67699 (= lt!149654 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!67699 (validMask!0 mask!3709)))

(assert (=> d!67699 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!149652)))

(declare-fun b!301416 () Bool)

(assert (=> b!301416 (= e!190164 Undefined!2363)))

(assert (= (and d!67699 c!48692) b!301416))

(assert (= (and d!67699 (not c!48692)) b!301414))

(assert (= (and b!301414 c!48690) b!301415))

(assert (= (and b!301414 (not c!48690)) b!301413))

(assert (= (and b!301413 c!48691) b!301412))

(assert (= (and b!301413 (not c!48691)) b!301411))

(declare-fun m!312677 () Bool)

(assert (=> b!301411 m!312677))

(declare-fun m!312679 () Bool)

(assert (=> b!301414 m!312679))

(assert (=> d!67699 m!312635))

(declare-fun m!312681 () Bool)

(assert (=> d!67699 m!312681))

(assert (=> d!67699 m!312635))

(declare-fun m!312683 () Bool)

(assert (=> d!67699 m!312683))

(declare-fun m!312685 () Bool)

(assert (=> d!67699 m!312685))

(declare-fun m!312687 () Bool)

(assert (=> d!67699 m!312687))

(assert (=> d!67699 m!312637))

(assert (=> b!301351 d!67699))

(declare-fun d!67713 () Bool)

(assert (=> d!67713 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!301356 d!67713))

(declare-fun d!67717 () Bool)

(declare-fun lt!149666 () (_ BitVec 32))

(declare-fun lt!149665 () (_ BitVec 32))

(assert (=> d!67717 (= lt!149666 (bvmul (bvxor lt!149665 (bvlshr lt!149665 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67717 (= lt!149665 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67717 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!159224 (let ((h!5297 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29922 (bvmul (bvxor h!5297 (bvlshr h!5297 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29922 (bvlshr x!29922 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!159224 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!159224 #b00000000000000000000000000000000))))))

(assert (=> d!67717 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!149666 (bvlshr lt!149666 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!301352 d!67717))

(declare-fun d!67721 () Bool)

(declare-fun res!159235 () Bool)

(declare-fun e!190183 () Bool)

(assert (=> d!67721 (=> res!159235 e!190183)))

(assert (=> d!67721 (= res!159235 (= (select (arr!7224 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!67721 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!190183)))

(declare-fun b!301439 () Bool)

(declare-fun e!190184 () Bool)

(assert (=> b!301439 (= e!190183 e!190184)))

(declare-fun res!159236 () Bool)

(assert (=> b!301439 (=> (not res!159236) (not e!190184))))

(assert (=> b!301439 (= res!159236 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7577 a!3293)))))

(declare-fun b!301440 () Bool)

(assert (=> b!301440 (= e!190184 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67721 (not res!159235)) b!301439))

(assert (= (and b!301439 res!159236) b!301440))

(declare-fun m!312693 () Bool)

(assert (=> d!67721 m!312693))

(declare-fun m!312695 () Bool)

(assert (=> b!301440 m!312695))

(assert (=> b!301354 d!67721))

(declare-fun d!67723 () Bool)

(assert (=> d!67723 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!30072 d!67723))

(declare-fun d!67729 () Bool)

(assert (=> d!67729 (= (array_inv!5196 a!3293) (bvsge (size!7577 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!30072 d!67729))

(declare-fun b!301473 () Bool)

(declare-fun e!190203 () Bool)

(declare-fun e!190205 () Bool)

(assert (=> b!301473 (= e!190203 e!190205)))

(declare-fun c!48713 () Bool)

(assert (=> b!301473 (= c!48713 (validKeyInArray!0 (select (arr!7224 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!301474 () Bool)

(declare-fun e!190204 () Bool)

(declare-fun call!25850 () Bool)

(assert (=> b!301474 (= e!190204 call!25850)))

(declare-fun d!67731 () Bool)

(declare-fun res!159243 () Bool)

(assert (=> d!67731 (=> res!159243 e!190203)))

(assert (=> d!67731 (= res!159243 (bvsge #b00000000000000000000000000000000 (size!7577 a!3293)))))

(assert (=> d!67731 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!190203)))

(declare-fun b!301475 () Bool)

(assert (=> b!301475 (= e!190205 e!190204)))

(declare-fun lt!149699 () (_ BitVec 64))

(assert (=> b!301475 (= lt!149699 (select (arr!7224 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9337 0))(
  ( (Unit!9338) )
))
(declare-fun lt!149697 () Unit!9337)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15266 (_ BitVec 64) (_ BitVec 32)) Unit!9337)

(assert (=> b!301475 (= lt!149697 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!149699 #b00000000000000000000000000000000))))

(assert (=> b!301475 (arrayContainsKey!0 a!3293 lt!149699 #b00000000000000000000000000000000)))

(declare-fun lt!149698 () Unit!9337)

(assert (=> b!301475 (= lt!149698 lt!149697)))

(declare-fun res!159242 () Bool)

(assert (=> b!301475 (= res!159242 (= (seekEntryOrOpen!0 (select (arr!7224 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2363 #b00000000000000000000000000000000)))))

(assert (=> b!301475 (=> (not res!159242) (not e!190204))))

(declare-fun b!301476 () Bool)

(assert (=> b!301476 (= e!190205 call!25850)))

(declare-fun bm!25847 () Bool)

(assert (=> bm!25847 (= call!25850 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(assert (= (and d!67731 (not res!159243)) b!301473))

(assert (= (and b!301473 c!48713) b!301475))

(assert (= (and b!301473 (not c!48713)) b!301476))

(assert (= (and b!301475 res!159242) b!301474))

(assert (= (or b!301474 b!301476) bm!25847))

(assert (=> b!301473 m!312693))

(assert (=> b!301473 m!312693))

(declare-fun m!312721 () Bool)

(assert (=> b!301473 m!312721))

(assert (=> b!301475 m!312693))

(declare-fun m!312723 () Bool)

(assert (=> b!301475 m!312723))

(declare-fun m!312725 () Bool)

(assert (=> b!301475 m!312725))

(assert (=> b!301475 m!312693))

(declare-fun m!312727 () Bool)

(assert (=> b!301475 m!312727))

(declare-fun m!312729 () Bool)

(assert (=> bm!25847 m!312729))

(assert (=> b!301353 d!67731))

(check-sat (not b!301411) (not b!301475) (not bm!25847) (not d!67699) (not b!301440) (not b!301473))
(check-sat)
