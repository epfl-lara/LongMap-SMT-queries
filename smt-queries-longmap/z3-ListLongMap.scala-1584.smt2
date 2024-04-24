; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30072 () Bool)

(assert start!30072)

(declare-fun b!301573 () Bool)

(declare-fun res!159305 () Bool)

(declare-fun e!190281 () Bool)

(assert (=> b!301573 (=> (not res!159305) (not e!190281))))

(declare-datatypes ((array!15275 0))(
  ( (array!15276 (arr!7228 (Array (_ BitVec 32) (_ BitVec 64))) (size!7580 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15275)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15275 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301573 (= res!159305 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301574 () Bool)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun lt!149892 () (_ BitVec 32))

(assert (=> b!301574 (= e!190281 (and (bvsge mask!3709 #b00000000000000000000000000000000) (or (bvslt lt!149892 #b00000000000000000000000000000000) (bvsge lt!149892 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301574 (= lt!149892 (toIndex!0 k0!2441 mask!3709))))

(declare-fun b!301575 () Bool)

(declare-fun res!159302 () Bool)

(assert (=> b!301575 (=> (not res!159302) (not e!190281))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2333 0))(
  ( (MissingZero!2333 (index!11508 (_ BitVec 32))) (Found!2333 (index!11509 (_ BitVec 32))) (Intermediate!2333 (undefined!3145 Bool) (index!11510 (_ BitVec 32)) (x!29890 (_ BitVec 32))) (Undefined!2333) (MissingVacant!2333 (index!11511 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15275 (_ BitVec 32)) SeekEntryResult!2333)

(assert (=> b!301575 (= res!159302 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2333 i!1240)))))

(declare-fun res!159301 () Bool)

(assert (=> start!30072 (=> (not res!159301) (not e!190281))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30072 (= res!159301 (validMask!0 mask!3709))))

(assert (=> start!30072 e!190281))

(assert (=> start!30072 true))

(declare-fun array_inv!5178 (array!15275) Bool)

(assert (=> start!30072 (array_inv!5178 a!3293)))

(declare-fun b!301576 () Bool)

(declare-fun res!159304 () Bool)

(assert (=> b!301576 (=> (not res!159304) (not e!190281))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15275 (_ BitVec 32)) Bool)

(assert (=> b!301576 (= res!159304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301577 () Bool)

(declare-fun res!159303 () Bool)

(assert (=> b!301577 (=> (not res!159303) (not e!190281))))

(assert (=> b!301577 (= res!159303 (and (= (size!7580 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7580 a!3293))))))

(declare-fun b!301578 () Bool)

(declare-fun res!159306 () Bool)

(assert (=> b!301578 (=> (not res!159306) (not e!190281))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301578 (= res!159306 (validKeyInArray!0 k0!2441))))

(assert (= (and start!30072 res!159301) b!301577))

(assert (= (and b!301577 res!159303) b!301578))

(assert (= (and b!301578 res!159306) b!301573))

(assert (= (and b!301573 res!159305) b!301575))

(assert (= (and b!301575 res!159302) b!301576))

(assert (= (and b!301576 res!159304) b!301574))

(declare-fun m!313471 () Bool)

(assert (=> b!301576 m!313471))

(declare-fun m!313473 () Bool)

(assert (=> b!301578 m!313473))

(declare-fun m!313475 () Bool)

(assert (=> b!301575 m!313475))

(declare-fun m!313477 () Bool)

(assert (=> start!30072 m!313477))

(declare-fun m!313479 () Bool)

(assert (=> start!30072 m!313479))

(declare-fun m!313481 () Bool)

(assert (=> b!301574 m!313481))

(declare-fun m!313483 () Bool)

(assert (=> b!301573 m!313483))

(check-sat (not b!301576) (not b!301575) (not b!301574) (not b!301573) (not start!30072) (not b!301578))
(check-sat)
(get-model)

(declare-fun b!301639 () Bool)

(declare-fun e!190311 () SeekEntryResult!2333)

(declare-fun e!190310 () SeekEntryResult!2333)

(assert (=> b!301639 (= e!190311 e!190310)))

(declare-fun lt!149920 () (_ BitVec 64))

(declare-fun lt!149922 () SeekEntryResult!2333)

(assert (=> b!301639 (= lt!149920 (select (arr!7228 a!3293) (index!11510 lt!149922)))))

(declare-fun c!48741 () Bool)

(assert (=> b!301639 (= c!48741 (= lt!149920 k0!2441))))

(declare-fun b!301640 () Bool)

(declare-fun e!190309 () SeekEntryResult!2333)

(assert (=> b!301640 (= e!190309 (MissingZero!2333 (index!11510 lt!149922)))))

(declare-fun b!301641 () Bool)

(assert (=> b!301641 (= e!190311 Undefined!2333)))

(declare-fun b!301642 () Bool)

(assert (=> b!301642 (= e!190310 (Found!2333 (index!11510 lt!149922)))))

(declare-fun b!301643 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15275 (_ BitVec 32)) SeekEntryResult!2333)

(assert (=> b!301643 (= e!190309 (seekKeyOrZeroReturnVacant!0 (x!29890 lt!149922) (index!11510 lt!149922) (index!11510 lt!149922) k0!2441 a!3293 mask!3709))))

(declare-fun b!301644 () Bool)

(declare-fun c!48742 () Bool)

(assert (=> b!301644 (= c!48742 (= lt!149920 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!301644 (= e!190310 e!190309)))

(declare-fun d!67933 () Bool)

(declare-fun lt!149921 () SeekEntryResult!2333)

(get-info :version)

(assert (=> d!67933 (and (or ((_ is Undefined!2333) lt!149921) (not ((_ is Found!2333) lt!149921)) (and (bvsge (index!11509 lt!149921) #b00000000000000000000000000000000) (bvslt (index!11509 lt!149921) (size!7580 a!3293)))) (or ((_ is Undefined!2333) lt!149921) ((_ is Found!2333) lt!149921) (not ((_ is MissingZero!2333) lt!149921)) (and (bvsge (index!11508 lt!149921) #b00000000000000000000000000000000) (bvslt (index!11508 lt!149921) (size!7580 a!3293)))) (or ((_ is Undefined!2333) lt!149921) ((_ is Found!2333) lt!149921) ((_ is MissingZero!2333) lt!149921) (not ((_ is MissingVacant!2333) lt!149921)) (and (bvsge (index!11511 lt!149921) #b00000000000000000000000000000000) (bvslt (index!11511 lt!149921) (size!7580 a!3293)))) (or ((_ is Undefined!2333) lt!149921) (ite ((_ is Found!2333) lt!149921) (= (select (arr!7228 a!3293) (index!11509 lt!149921)) k0!2441) (ite ((_ is MissingZero!2333) lt!149921) (= (select (arr!7228 a!3293) (index!11508 lt!149921)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2333) lt!149921) (= (select (arr!7228 a!3293) (index!11511 lt!149921)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67933 (= lt!149921 e!190311)))

(declare-fun c!48743 () Bool)

(assert (=> d!67933 (= c!48743 (and ((_ is Intermediate!2333) lt!149922) (undefined!3145 lt!149922)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15275 (_ BitVec 32)) SeekEntryResult!2333)

(assert (=> d!67933 (= lt!149922 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!67933 (validMask!0 mask!3709)))

(assert (=> d!67933 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!149921)))

(assert (= (and d!67933 c!48743) b!301641))

(assert (= (and d!67933 (not c!48743)) b!301639))

(assert (= (and b!301639 c!48741) b!301642))

(assert (= (and b!301639 (not c!48741)) b!301644))

(assert (= (and b!301644 c!48742) b!301640))

(assert (= (and b!301644 (not c!48742)) b!301643))

(declare-fun m!313525 () Bool)

(assert (=> b!301639 m!313525))

(declare-fun m!313527 () Bool)

(assert (=> b!301643 m!313527))

(assert (=> d!67933 m!313477))

(declare-fun m!313529 () Bool)

(assert (=> d!67933 m!313529))

(assert (=> d!67933 m!313481))

(declare-fun m!313531 () Bool)

(assert (=> d!67933 m!313531))

(assert (=> d!67933 m!313481))

(declare-fun m!313533 () Bool)

(assert (=> d!67933 m!313533))

(declare-fun m!313535 () Bool)

(assert (=> d!67933 m!313535))

(assert (=> b!301575 d!67933))

(declare-fun b!301653 () Bool)

(declare-fun e!190319 () Bool)

(declare-fun e!190318 () Bool)

(assert (=> b!301653 (= e!190319 e!190318)))

(declare-fun c!48746 () Bool)

(assert (=> b!301653 (= c!48746 (validKeyInArray!0 (select (arr!7228 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!301654 () Bool)

(declare-fun e!190320 () Bool)

(declare-fun call!25865 () Bool)

(assert (=> b!301654 (= e!190320 call!25865)))

(declare-fun b!301655 () Bool)

(assert (=> b!301655 (= e!190318 e!190320)))

(declare-fun lt!149931 () (_ BitVec 64))

(assert (=> b!301655 (= lt!149931 (select (arr!7228 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9339 0))(
  ( (Unit!9340) )
))
(declare-fun lt!149929 () Unit!9339)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15275 (_ BitVec 64) (_ BitVec 32)) Unit!9339)

(assert (=> b!301655 (= lt!149929 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!149931 #b00000000000000000000000000000000))))

(assert (=> b!301655 (arrayContainsKey!0 a!3293 lt!149931 #b00000000000000000000000000000000)))

(declare-fun lt!149930 () Unit!9339)

(assert (=> b!301655 (= lt!149930 lt!149929)))

(declare-fun res!159355 () Bool)

(assert (=> b!301655 (= res!159355 (= (seekEntryOrOpen!0 (select (arr!7228 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2333 #b00000000000000000000000000000000)))))

(assert (=> b!301655 (=> (not res!159355) (not e!190320))))

(declare-fun d!67943 () Bool)

(declare-fun res!159354 () Bool)

(assert (=> d!67943 (=> res!159354 e!190319)))

(assert (=> d!67943 (= res!159354 (bvsge #b00000000000000000000000000000000 (size!7580 a!3293)))))

(assert (=> d!67943 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!190319)))

(declare-fun bm!25862 () Bool)

(assert (=> bm!25862 (= call!25865 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!301656 () Bool)

(assert (=> b!301656 (= e!190318 call!25865)))

(assert (= (and d!67943 (not res!159354)) b!301653))

(assert (= (and b!301653 c!48746) b!301655))

(assert (= (and b!301653 (not c!48746)) b!301656))

(assert (= (and b!301655 res!159355) b!301654))

(assert (= (or b!301654 b!301656) bm!25862))

(declare-fun m!313537 () Bool)

(assert (=> b!301653 m!313537))

(assert (=> b!301653 m!313537))

(declare-fun m!313539 () Bool)

(assert (=> b!301653 m!313539))

(assert (=> b!301655 m!313537))

(declare-fun m!313541 () Bool)

(assert (=> b!301655 m!313541))

(declare-fun m!313543 () Bool)

(assert (=> b!301655 m!313543))

(assert (=> b!301655 m!313537))

(declare-fun m!313545 () Bool)

(assert (=> b!301655 m!313545))

(declare-fun m!313547 () Bool)

(assert (=> bm!25862 m!313547))

(assert (=> b!301576 d!67943))

(declare-fun d!67945 () Bool)

(assert (=> d!67945 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!30072 d!67945))

(declare-fun d!67949 () Bool)

(assert (=> d!67949 (= (array_inv!5178 a!3293) (bvsge (size!7580 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!30072 d!67949))

(declare-fun d!67951 () Bool)

(assert (=> d!67951 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!301578 d!67951))

(declare-fun d!67955 () Bool)

(declare-fun res!159367 () Bool)

(declare-fun e!190349 () Bool)

(assert (=> d!67955 (=> res!159367 e!190349)))

(assert (=> d!67955 (= res!159367 (= (select (arr!7228 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!67955 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!190349)))

(declare-fun b!301703 () Bool)

(declare-fun e!190350 () Bool)

(assert (=> b!301703 (= e!190349 e!190350)))

(declare-fun res!159368 () Bool)

(assert (=> b!301703 (=> (not res!159368) (not e!190350))))

(assert (=> b!301703 (= res!159368 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7580 a!3293)))))

(declare-fun b!301704 () Bool)

(assert (=> b!301704 (= e!190350 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67955 (not res!159367)) b!301703))

(assert (= (and b!301703 res!159368) b!301704))

(assert (=> d!67955 m!313537))

(declare-fun m!313563 () Bool)

(assert (=> b!301704 m!313563))

(assert (=> b!301573 d!67955))

(declare-fun d!67957 () Bool)

(declare-fun lt!149961 () (_ BitVec 32))

(declare-fun lt!149960 () (_ BitVec 32))

(assert (=> d!67957 (= lt!149961 (bvmul (bvxor lt!149960 (bvlshr lt!149960 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67957 (= lt!149960 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67957 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!159369 (let ((h!5242 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29895 (bvmul (bvxor h!5242 (bvlshr h!5242 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29895 (bvlshr x!29895 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!159369 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!159369 #b00000000000000000000000000000000))))))

(assert (=> d!67957 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!149961 (bvlshr lt!149961 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!301574 d!67957))

(check-sat (not b!301653) (not b!301655) (not b!301643) (not d!67933) (not bm!25862) (not b!301704))
(check-sat)
