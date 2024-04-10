; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29660 () Bool)

(assert start!29660)

(declare-fun e!189026 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!15124 0))(
  ( (array!15125 (arr!7162 (Array (_ BitVec 32) (_ BitVec 64))) (size!7514 (_ BitVec 32))) )
))
(declare-fun lt!148831 () array!15124)

(declare-fun b!299248 () Bool)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2311 0))(
  ( (MissingZero!2311 (index!11417 (_ BitVec 32))) (Found!2311 (index!11418 (_ BitVec 32))) (Intermediate!2311 (undefined!3123 Bool) (index!11419 (_ BitVec 32)) (x!29654 (_ BitVec 32))) (Undefined!2311) (MissingVacant!2311 (index!11420 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15124 (_ BitVec 32)) SeekEntryResult!2311)

(assert (=> b!299248 (= e!189026 (not (= (seekEntryOrOpen!0 k!2524 lt!148831 mask!3809) (Found!2311 i!1256))))))

(declare-datatypes ((Unit!9333 0))(
  ( (Unit!9334) )
))
(declare-fun lt!148830 () Unit!9333)

(declare-fun lt!148826 () (_ BitVec 32))

(declare-fun a!3312 () array!15124)

(declare-fun lt!148832 () SeekEntryResult!2311)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!15124 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9333)

(assert (=> b!299248 (= lt!148830 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3312 i!1256 k!2524 #b00000000000000000000000000000000 lt!148826 (index!11419 lt!148832) (x!29654 lt!148832) mask!3809))))

(assert (=> b!299248 (= (index!11419 lt!148832) i!1256)))

(declare-fun b!299249 () Bool)

(declare-fun res!157817 () Bool)

(declare-fun e!189027 () Bool)

(assert (=> b!299249 (=> (not res!157817) (not e!189027))))

(assert (=> b!299249 (= res!157817 (and (= (size!7514 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7514 a!3312))))))

(declare-fun b!299250 () Bool)

(declare-fun res!157812 () Bool)

(assert (=> b!299250 (=> (not res!157812) (not e!189027))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!299250 (= res!157812 (validKeyInArray!0 k!2524))))

(declare-fun b!299251 () Bool)

(declare-fun e!189025 () Bool)

(assert (=> b!299251 (= e!189025 e!189026)))

(declare-fun res!157816 () Bool)

(assert (=> b!299251 (=> (not res!157816) (not e!189026))))

(declare-fun lt!148829 () Bool)

(assert (=> b!299251 (= res!157816 (and (or lt!148829 (not (undefined!3123 lt!148832))) (not lt!148829) (= (select (arr!7162 a!3312) (index!11419 lt!148832)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!299251 (= lt!148829 (not (is-Intermediate!2311 lt!148832)))))

(declare-fun res!157818 () Bool)

(assert (=> start!29660 (=> (not res!157818) (not e!189027))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29660 (= res!157818 (validMask!0 mask!3809))))

(assert (=> start!29660 e!189027))

(assert (=> start!29660 true))

(declare-fun array_inv!5125 (array!15124) Bool)

(assert (=> start!29660 (array_inv!5125 a!3312)))

(declare-fun b!299252 () Bool)

(declare-fun res!157815 () Bool)

(declare-fun e!189024 () Bool)

(assert (=> b!299252 (=> (not res!157815) (not e!189024))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15124 (_ BitVec 32)) Bool)

(assert (=> b!299252 (= res!157815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!299253 () Bool)

(declare-fun res!157813 () Bool)

(assert (=> b!299253 (=> (not res!157813) (not e!189027))))

(declare-fun arrayContainsKey!0 (array!15124 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!299253 (= res!157813 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!299254 () Bool)

(assert (=> b!299254 (= e!189024 e!189025)))

(declare-fun res!157814 () Bool)

(assert (=> b!299254 (=> (not res!157814) (not e!189025))))

(declare-fun lt!148828 () Bool)

(declare-fun lt!148827 () SeekEntryResult!2311)

(assert (=> b!299254 (= res!157814 (and (not lt!148828) (= lt!148827 (MissingVacant!2311 i!1256))))))

(declare-fun lt!148833 () SeekEntryResult!2311)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15124 (_ BitVec 32)) SeekEntryResult!2311)

(assert (=> b!299254 (= lt!148833 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148826 k!2524 lt!148831 mask!3809))))

(assert (=> b!299254 (= lt!148831 (array!15125 (store (arr!7162 a!3312) i!1256 k!2524) (size!7514 a!3312)))))

(assert (=> b!299254 (= lt!148832 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148826 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!299254 (= lt!148826 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!299255 () Bool)

(assert (=> b!299255 (= e!189027 e!189024)))

(declare-fun res!157811 () Bool)

(assert (=> b!299255 (=> (not res!157811) (not e!189024))))

(assert (=> b!299255 (= res!157811 (or lt!148828 (= lt!148827 (MissingVacant!2311 i!1256))))))

(assert (=> b!299255 (= lt!148828 (= lt!148827 (MissingZero!2311 i!1256)))))

(assert (=> b!299255 (= lt!148827 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!29660 res!157818) b!299249))

(assert (= (and b!299249 res!157817) b!299250))

(assert (= (and b!299250 res!157812) b!299253))

(assert (= (and b!299253 res!157813) b!299255))

(assert (= (and b!299255 res!157811) b!299252))

(assert (= (and b!299252 res!157815) b!299254))

(assert (= (and b!299254 res!157814) b!299251))

(assert (= (and b!299251 res!157816) b!299248))

(declare-fun m!311611 () Bool)

(assert (=> b!299251 m!311611))

(declare-fun m!311613 () Bool)

(assert (=> b!299255 m!311613))

(declare-fun m!311615 () Bool)

(assert (=> start!29660 m!311615))

(declare-fun m!311617 () Bool)

(assert (=> start!29660 m!311617))

(declare-fun m!311619 () Bool)

(assert (=> b!299248 m!311619))

(declare-fun m!311621 () Bool)

(assert (=> b!299248 m!311621))

(declare-fun m!311623 () Bool)

(assert (=> b!299254 m!311623))

(declare-fun m!311625 () Bool)

(assert (=> b!299254 m!311625))

(declare-fun m!311627 () Bool)

(assert (=> b!299254 m!311627))

(declare-fun m!311629 () Bool)

(assert (=> b!299254 m!311629))

(declare-fun m!311631 () Bool)

(assert (=> b!299253 m!311631))

(declare-fun m!311633 () Bool)

(assert (=> b!299250 m!311633))

(declare-fun m!311635 () Bool)

(assert (=> b!299252 m!311635))

(push 1)

(assert (not b!299252))

(assert (not b!299253))

(assert (not b!299255))

(assert (not start!29660))

(assert (not b!299248))

(assert (not b!299250))

(assert (not b!299254))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!67539 () Bool)

(assert (=> d!67539 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!299250 d!67539))

(declare-fun d!67541 () Bool)

(declare-fun lt!148895 () SeekEntryResult!2311)

(assert (=> d!67541 (and (or (is-Undefined!2311 lt!148895) (not (is-Found!2311 lt!148895)) (and (bvsge (index!11418 lt!148895) #b00000000000000000000000000000000) (bvslt (index!11418 lt!148895) (size!7514 a!3312)))) (or (is-Undefined!2311 lt!148895) (is-Found!2311 lt!148895) (not (is-MissingZero!2311 lt!148895)) (and (bvsge (index!11417 lt!148895) #b00000000000000000000000000000000) (bvslt (index!11417 lt!148895) (size!7514 a!3312)))) (or (is-Undefined!2311 lt!148895) (is-Found!2311 lt!148895) (is-MissingZero!2311 lt!148895) (not (is-MissingVacant!2311 lt!148895)) (and (bvsge (index!11420 lt!148895) #b00000000000000000000000000000000) (bvslt (index!11420 lt!148895) (size!7514 a!3312)))) (or (is-Undefined!2311 lt!148895) (ite (is-Found!2311 lt!148895) (= (select (arr!7162 a!3312) (index!11418 lt!148895)) k!2524) (ite (is-MissingZero!2311 lt!148895) (= (select (arr!7162 a!3312) (index!11417 lt!148895)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2311 lt!148895) (= (select (arr!7162 a!3312) (index!11420 lt!148895)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!189103 () SeekEntryResult!2311)

(assert (=> d!67541 (= lt!148895 e!189103)))

(declare-fun c!48359 () Bool)

(declare-fun lt!148897 () SeekEntryResult!2311)

(assert (=> d!67541 (= c!48359 (and (is-Intermediate!2311 lt!148897) (undefined!3123 lt!148897)))))

(assert (=> d!67541 (= lt!148897 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!67541 (validMask!0 mask!3809)))

(assert (=> d!67541 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!148895)))

(declare-fun b!299388 () Bool)

(declare-fun e!189102 () SeekEntryResult!2311)

(assert (=> b!299388 (= e!189102 (Found!2311 (index!11419 lt!148897)))))

(declare-fun b!299389 () Bool)

(assert (=> b!299389 (= e!189103 e!189102)))

(declare-fun lt!148896 () (_ BitVec 64))

(assert (=> b!299389 (= lt!148896 (select (arr!7162 a!3312) (index!11419 lt!148897)))))

(declare-fun c!48360 () Bool)

(assert (=> b!299389 (= c!48360 (= lt!148896 k!2524))))

(declare-fun b!299390 () Bool)

(declare-fun e!189104 () SeekEntryResult!2311)

(assert (=> b!299390 (= e!189104 (MissingZero!2311 (index!11419 lt!148897)))))

(declare-fun b!299391 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15124 (_ BitVec 32)) SeekEntryResult!2311)

(assert (=> b!299391 (= e!189104 (seekKeyOrZeroReturnVacant!0 (x!29654 lt!148897) (index!11419 lt!148897) (index!11419 lt!148897) k!2524 a!3312 mask!3809))))

(declare-fun b!299392 () Bool)

(assert (=> b!299392 (= e!189103 Undefined!2311)))

(declare-fun b!299393 () Bool)

(declare-fun c!48358 () Bool)

(assert (=> b!299393 (= c!48358 (= lt!148896 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!299393 (= e!189102 e!189104)))

(assert (= (and d!67541 c!48359) b!299392))

(assert (= (and d!67541 (not c!48359)) b!299389))

(assert (= (and b!299389 c!48360) b!299388))

(assert (= (and b!299389 (not c!48360)) b!299393))

(assert (= (and b!299393 c!48358) b!299390))

(assert (= (and b!299393 (not c!48358)) b!299391))

(declare-fun m!311701 () Bool)

(assert (=> d!67541 m!311701))

(declare-fun m!311703 () Bool)

(assert (=> d!67541 m!311703))

(assert (=> d!67541 m!311615))

(assert (=> d!67541 m!311629))

(declare-fun m!311705 () Bool)

(assert (=> d!67541 m!311705))

(declare-fun m!311707 () Bool)

(assert (=> d!67541 m!311707))

(assert (=> d!67541 m!311629))

(declare-fun m!311709 () Bool)

(assert (=> b!299389 m!311709))

(declare-fun m!311711 () Bool)

(assert (=> b!299391 m!311711))

(assert (=> b!299255 d!67541))

(declare-fun b!299484 () Bool)

(declare-fun e!189160 () SeekEntryResult!2311)

(assert (=> b!299484 (= e!189160 (Intermediate!2311 true lt!148826 #b00000000000000000000000000000000))))

(declare-fun e!189157 () SeekEntryResult!2311)

(declare-fun b!299485 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!299485 (= e!189157 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148826 #b00000000000000000000000000000000 mask!3809) k!2524 lt!148831 mask!3809))))

(declare-fun b!299486 () Bool)

(declare-fun lt!148933 () SeekEntryResult!2311)

(assert (=> b!299486 (and (bvsge (index!11419 lt!148933) #b00000000000000000000000000000000) (bvslt (index!11419 lt!148933) (size!7514 lt!148831)))))

(declare-fun res!157870 () Bool)

(assert (=> b!299486 (= res!157870 (= (select (arr!7162 lt!148831) (index!11419 lt!148933)) k!2524))))

(declare-fun e!189159 () Bool)

(assert (=> b!299486 (=> res!157870 e!189159)))

(declare-fun e!189161 () Bool)

(assert (=> b!299486 (= e!189161 e!189159)))

(declare-fun b!299487 () Bool)

(declare-fun e!189158 () Bool)

(assert (=> b!299487 (= e!189158 e!189161)))

(declare-fun res!157871 () Bool)

(assert (=> b!299487 (= res!157871 (and (is-Intermediate!2311 lt!148933) (not (undefined!3123 lt!148933)) (bvslt (x!29654 lt!148933) #b01111111111111111111111111111110) (bvsge (x!29654 lt!148933) #b00000000000000000000000000000000) (bvsge (x!29654 lt!148933) #b00000000000000000000000000000000)))))

(assert (=> b!299487 (=> (not res!157871) (not e!189161))))

(declare-fun b!299488 () Bool)

(assert (=> b!299488 (= e!189157 (Intermediate!2311 false lt!148826 #b00000000000000000000000000000000))))

(declare-fun b!299490 () Bool)

(assert (=> b!299490 (= e!189158 (bvsge (x!29654 lt!148933) #b01111111111111111111111111111110))))

(declare-fun b!299491 () Bool)

(assert (=> b!299491 (and (bvsge (index!11419 lt!148933) #b00000000000000000000000000000000) (bvslt (index!11419 lt!148933) (size!7514 lt!148831)))))

(declare-fun res!157869 () Bool)

(assert (=> b!299491 (= res!157869 (= (select (arr!7162 lt!148831) (index!11419 lt!148933)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!299491 (=> res!157869 e!189159)))

(declare-fun b!299492 () Bool)

(assert (=> b!299492 (and (bvsge (index!11419 lt!148933) #b00000000000000000000000000000000) (bvslt (index!11419 lt!148933) (size!7514 lt!148831)))))

(assert (=> b!299492 (= e!189159 (= (select (arr!7162 lt!148831) (index!11419 lt!148933)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!67559 () Bool)

(assert (=> d!67559 e!189158))

(declare-fun c!48397 () Bool)

(assert (=> d!67559 (= c!48397 (and (is-Intermediate!2311 lt!148933) (undefined!3123 lt!148933)))))

(assert (=> d!67559 (= lt!148933 e!189160)))

(declare-fun c!48398 () Bool)

(assert (=> d!67559 (= c!48398 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!148932 () (_ BitVec 64))

(assert (=> d!67559 (= lt!148932 (select (arr!7162 lt!148831) lt!148826))))

(assert (=> d!67559 (validMask!0 mask!3809)))

(assert (=> d!67559 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148826 k!2524 lt!148831 mask!3809) lt!148933)))

(declare-fun b!299489 () Bool)

(assert (=> b!299489 (= e!189160 e!189157)))

(declare-fun c!48399 () Bool)

(assert (=> b!299489 (= c!48399 (or (= lt!148932 k!2524) (= (bvadd lt!148932 lt!148932) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!67559 c!48398) b!299484))

(assert (= (and d!67559 (not c!48398)) b!299489))

(assert (= (and b!299489 c!48399) b!299488))

(assert (= (and b!299489 (not c!48399)) b!299485))

(assert (= (and d!67559 c!48397) b!299490))

(assert (= (and d!67559 (not c!48397)) b!299487))

(assert (= (and b!299487 res!157871) b!299486))

(assert (= (and b!299486 (not res!157870)) b!299491))

(assert (= (and b!299491 (not res!157869)) b!299492))

(declare-fun m!311739 () Bool)

(assert (=> b!299491 m!311739))

(assert (=> b!299486 m!311739))

(declare-fun m!311743 () Bool)

(assert (=> b!299485 m!311743))

(assert (=> b!299485 m!311743))

(declare-fun m!311745 () Bool)

(assert (=> b!299485 m!311745))

(assert (=> b!299492 m!311739))

(declare-fun m!311747 () Bool)

(assert (=> d!67559 m!311747))

(assert (=> d!67559 m!311615))

(assert (=> b!299254 d!67559))

(declare-fun b!299499 () Bool)

(declare-fun e!189168 () SeekEntryResult!2311)

(assert (=> b!299499 (= e!189168 (Intermediate!2311 true lt!148826 #b00000000000000000000000000000000))))

(declare-fun b!299500 () Bool)

(declare-fun e!189165 () SeekEntryResult!2311)

(assert (=> b!299500 (= e!189165 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148826 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!299501 () Bool)

(declare-fun lt!148938 () SeekEntryResult!2311)

(assert (=> b!299501 (and (bvsge (index!11419 lt!148938) #b00000000000000000000000000000000) (bvslt (index!11419 lt!148938) (size!7514 a!3312)))))

(declare-fun res!157873 () Bool)

(assert (=> b!299501 (= res!157873 (= (select (arr!7162 a!3312) (index!11419 lt!148938)) k!2524))))

(declare-fun e!189167 () Bool)

(assert (=> b!299501 (=> res!157873 e!189167)))

(declare-fun e!189169 () Bool)

(assert (=> b!299501 (= e!189169 e!189167)))

(declare-fun b!299502 () Bool)

(declare-fun e!189166 () Bool)

(assert (=> b!299502 (= e!189166 e!189169)))

(declare-fun res!157874 () Bool)

(assert (=> b!299502 (= res!157874 (and (is-Intermediate!2311 lt!148938) (not (undefined!3123 lt!148938)) (bvslt (x!29654 lt!148938) #b01111111111111111111111111111110) (bvsge (x!29654 lt!148938) #b00000000000000000000000000000000) (bvsge (x!29654 lt!148938) #b00000000000000000000000000000000)))))

(assert (=> b!299502 (=> (not res!157874) (not e!189169))))

(declare-fun b!299503 () Bool)

(assert (=> b!299503 (= e!189165 (Intermediate!2311 false lt!148826 #b00000000000000000000000000000000))))

(declare-fun b!299505 () Bool)

(assert (=> b!299505 (= e!189166 (bvsge (x!29654 lt!148938) #b01111111111111111111111111111110))))

(declare-fun b!299506 () Bool)

(assert (=> b!299506 (and (bvsge (index!11419 lt!148938) #b00000000000000000000000000000000) (bvslt (index!11419 lt!148938) (size!7514 a!3312)))))

(declare-fun res!157872 () Bool)

(assert (=> b!299506 (= res!157872 (= (select (arr!7162 a!3312) (index!11419 lt!148938)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!299506 (=> res!157872 e!189167)))

(declare-fun b!299507 () Bool)

(assert (=> b!299507 (and (bvsge (index!11419 lt!148938) #b00000000000000000000000000000000) (bvslt (index!11419 lt!148938) (size!7514 a!3312)))))

(assert (=> b!299507 (= e!189167 (= (select (arr!7162 a!3312) (index!11419 lt!148938)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!67569 () Bool)

(assert (=> d!67569 e!189166))

(declare-fun c!48403 () Bool)

(assert (=> d!67569 (= c!48403 (and (is-Intermediate!2311 lt!148938) (undefined!3123 lt!148938)))))

(assert (=> d!67569 (= lt!148938 e!189168)))

(declare-fun c!48404 () Bool)

(assert (=> d!67569 (= c!48404 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!148937 () (_ BitVec 64))

(assert (=> d!67569 (= lt!148937 (select (arr!7162 a!3312) lt!148826))))

(assert (=> d!67569 (validMask!0 mask!3809)))

(assert (=> d!67569 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148826 k!2524 a!3312 mask!3809) lt!148938)))

(declare-fun b!299504 () Bool)

(assert (=> b!299504 (= e!189168 e!189165)))

(declare-fun c!48405 () Bool)

(assert (=> b!299504 (= c!48405 (or (= lt!148937 k!2524) (= (bvadd lt!148937 lt!148937) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!67569 c!48404) b!299499))

(assert (= (and d!67569 (not c!48404)) b!299504))

(assert (= (and b!299504 c!48405) b!299503))

(assert (= (and b!299504 (not c!48405)) b!299500))

(assert (= (and d!67569 c!48403) b!299505))

(assert (= (and d!67569 (not c!48403)) b!299502))

(assert (= (and b!299502 res!157874) b!299501))

(assert (= (and b!299501 (not res!157873)) b!299506))

(assert (= (and b!299506 (not res!157872)) b!299507))

(declare-fun m!311749 () Bool)

