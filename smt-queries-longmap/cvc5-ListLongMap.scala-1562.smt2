; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29716 () Bool)

(assert start!29716)

(declare-fun b!299601 () Bool)

(declare-fun res!157917 () Bool)

(declare-fun e!189230 () Bool)

(assert (=> b!299601 (=> (not res!157917) (not e!189230))))

(declare-datatypes ((array!15129 0))(
  ( (array!15130 (arr!7163 (Array (_ BitVec 32) (_ BitVec 64))) (size!7515 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15129)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15129 (_ BitVec 32)) Bool)

(assert (=> b!299601 (= res!157917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!299602 () Bool)

(declare-fun res!157919 () Bool)

(declare-fun e!189231 () Bool)

(assert (=> b!299602 (=> (not res!157919) (not e!189231))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15129 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!299602 (= res!157919 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!299603 () Bool)

(declare-fun res!157920 () Bool)

(assert (=> b!299603 (=> (not res!157920) (not e!189231))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!299603 (= res!157920 (validKeyInArray!0 k!2524))))

(declare-fun b!299604 () Bool)

(declare-fun res!157916 () Bool)

(assert (=> b!299604 (=> (not res!157916) (not e!189231))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!299604 (= res!157916 (and (= (size!7515 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7515 a!3312))))))

(declare-fun b!299605 () Bool)

(declare-datatypes ((SeekEntryResult!2312 0))(
  ( (MissingZero!2312 (index!11424 (_ BitVec 32))) (Found!2312 (index!11425 (_ BitVec 32))) (Intermediate!2312 (undefined!3124 Bool) (index!11426 (_ BitVec 32)) (x!29672 (_ BitVec 32))) (Undefined!2312) (MissingVacant!2312 (index!11427 (_ BitVec 32))) )
))
(declare-fun lt!148995 () SeekEntryResult!2312)

(declare-fun lt!148997 () Bool)

(declare-fun lt!148994 () SeekEntryResult!2312)

(assert (=> b!299605 (= e!189230 (and (not lt!148997) (= lt!148995 (MissingVacant!2312 i!1256)) (let ((bdg!6446 (not (is-Intermediate!2312 lt!148994)))) (and (or bdg!6446 (not (undefined!3124 lt!148994))) (or bdg!6446 (not (= (select (arr!7163 a!3312) (index!11426 lt!148994)) #b1000000000000000000000000000000000000000000000000000000000000000))) (not bdg!6446) (or (bvslt (index!11426 lt!148994) #b00000000000000000000000000000000) (bvsge (index!11426 lt!148994) (size!7515 a!3312)))))))))

(declare-fun lt!148996 () (_ BitVec 32))

(declare-fun lt!148998 () SeekEntryResult!2312)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15129 (_ BitVec 32)) SeekEntryResult!2312)

(assert (=> b!299605 (= lt!148998 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148996 k!2524 (array!15130 (store (arr!7163 a!3312) i!1256 k!2524) (size!7515 a!3312)) mask!3809))))

(assert (=> b!299605 (= lt!148994 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148996 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!299605 (= lt!148996 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!299606 () Bool)

(assert (=> b!299606 (= e!189231 e!189230)))

(declare-fun res!157918 () Bool)

(assert (=> b!299606 (=> (not res!157918) (not e!189230))))

(assert (=> b!299606 (= res!157918 (or lt!148997 (= lt!148995 (MissingVacant!2312 i!1256))))))

(assert (=> b!299606 (= lt!148997 (= lt!148995 (MissingZero!2312 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15129 (_ BitVec 32)) SeekEntryResult!2312)

(assert (=> b!299606 (= lt!148995 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun res!157915 () Bool)

(assert (=> start!29716 (=> (not res!157915) (not e!189231))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29716 (= res!157915 (validMask!0 mask!3809))))

(assert (=> start!29716 e!189231))

(assert (=> start!29716 true))

(declare-fun array_inv!5126 (array!15129) Bool)

(assert (=> start!29716 (array_inv!5126 a!3312)))

(assert (= (and start!29716 res!157915) b!299604))

(assert (= (and b!299604 res!157916) b!299603))

(assert (= (and b!299603 res!157920) b!299602))

(assert (= (and b!299602 res!157919) b!299606))

(assert (= (and b!299606 res!157918) b!299601))

(assert (= (and b!299601 res!157917) b!299605))

(declare-fun m!311811 () Bool)

(assert (=> b!299603 m!311811))

(declare-fun m!311813 () Bool)

(assert (=> b!299606 m!311813))

(declare-fun m!311815 () Bool)

(assert (=> b!299605 m!311815))

(declare-fun m!311817 () Bool)

(assert (=> b!299605 m!311817))

(declare-fun m!311819 () Bool)

(assert (=> b!299605 m!311819))

(declare-fun m!311821 () Bool)

(assert (=> b!299605 m!311821))

(declare-fun m!311823 () Bool)

(assert (=> b!299605 m!311823))

(declare-fun m!311825 () Bool)

(assert (=> b!299602 m!311825))

(declare-fun m!311827 () Bool)

(assert (=> b!299601 m!311827))

(declare-fun m!311829 () Bool)

(assert (=> start!29716 m!311829))

(declare-fun m!311831 () Bool)

(assert (=> start!29716 m!311831))

(push 1)

(assert (not b!299606))

(assert (not b!299605))

(assert (not start!29716))

(assert (not b!299603))

(assert (not b!299601))

(assert (not b!299602))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!67605 () Bool)

(declare-fun res!157967 () Bool)

(declare-fun e!189268 () Bool)

(assert (=> d!67605 (=> res!157967 e!189268)))

(assert (=> d!67605 (= res!157967 (= (select (arr!7163 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!67605 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!189268)))

(declare-fun b!299667 () Bool)

(declare-fun e!189269 () Bool)

(assert (=> b!299667 (= e!189268 e!189269)))

(declare-fun res!157968 () Bool)

(assert (=> b!299667 (=> (not res!157968) (not e!189269))))

(assert (=> b!299667 (= res!157968 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7515 a!3312)))))

(declare-fun b!299668 () Bool)

(assert (=> b!299668 (= e!189269 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67605 (not res!157967)) b!299667))

(assert (= (and b!299667 res!157968) b!299668))

(declare-fun m!311889 () Bool)

(assert (=> d!67605 m!311889))

(declare-fun m!311891 () Bool)

(assert (=> b!299668 m!311891))

(assert (=> b!299602 d!67605))

(declare-fun b!299721 () Bool)

(declare-fun e!189302 () SeekEntryResult!2312)

(assert (=> b!299721 (= e!189302 Undefined!2312)))

(declare-fun b!299722 () Bool)

(declare-fun c!48459 () Bool)

(declare-fun lt!149067 () (_ BitVec 64))

(assert (=> b!299722 (= c!48459 (= lt!149067 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!189303 () SeekEntryResult!2312)

(declare-fun e!189301 () SeekEntryResult!2312)

(assert (=> b!299722 (= e!189303 e!189301)))

(declare-fun b!299723 () Bool)

(declare-fun lt!149069 () SeekEntryResult!2312)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15129 (_ BitVec 32)) SeekEntryResult!2312)

(assert (=> b!299723 (= e!189301 (seekKeyOrZeroReturnVacant!0 (x!29672 lt!149069) (index!11426 lt!149069) (index!11426 lt!149069) k!2524 a!3312 mask!3809))))

(declare-fun b!299724 () Bool)

(assert (=> b!299724 (= e!189303 (Found!2312 (index!11426 lt!149069)))))

(declare-fun b!299726 () Bool)

(assert (=> b!299726 (= e!189301 (MissingZero!2312 (index!11426 lt!149069)))))

(declare-fun b!299725 () Bool)

(assert (=> b!299725 (= e!189302 e!189303)))

(assert (=> b!299725 (= lt!149067 (select (arr!7163 a!3312) (index!11426 lt!149069)))))

(declare-fun c!48458 () Bool)

(assert (=> b!299725 (= c!48458 (= lt!149067 k!2524))))

(declare-fun d!67609 () Bool)

(declare-fun lt!149068 () SeekEntryResult!2312)

(assert (=> d!67609 (and (or (is-Undefined!2312 lt!149068) (not (is-Found!2312 lt!149068)) (and (bvsge (index!11425 lt!149068) #b00000000000000000000000000000000) (bvslt (index!11425 lt!149068) (size!7515 a!3312)))) (or (is-Undefined!2312 lt!149068) (is-Found!2312 lt!149068) (not (is-MissingZero!2312 lt!149068)) (and (bvsge (index!11424 lt!149068) #b00000000000000000000000000000000) (bvslt (index!11424 lt!149068) (size!7515 a!3312)))) (or (is-Undefined!2312 lt!149068) (is-Found!2312 lt!149068) (is-MissingZero!2312 lt!149068) (not (is-MissingVacant!2312 lt!149068)) (and (bvsge (index!11427 lt!149068) #b00000000000000000000000000000000) (bvslt (index!11427 lt!149068) (size!7515 a!3312)))) (or (is-Undefined!2312 lt!149068) (ite (is-Found!2312 lt!149068) (= (select (arr!7163 a!3312) (index!11425 lt!149068)) k!2524) (ite (is-MissingZero!2312 lt!149068) (= (select (arr!7163 a!3312) (index!11424 lt!149068)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2312 lt!149068) (= (select (arr!7163 a!3312) (index!11427 lt!149068)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67609 (= lt!149068 e!189302)))

(declare-fun c!48457 () Bool)

(assert (=> d!67609 (= c!48457 (and (is-Intermediate!2312 lt!149069) (undefined!3124 lt!149069)))))

(assert (=> d!67609 (= lt!149069 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!67609 (validMask!0 mask!3809)))

(assert (=> d!67609 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!149068)))

(assert (= (and d!67609 c!48457) b!299721))

(assert (= (and d!67609 (not c!48457)) b!299725))

(assert (= (and b!299725 c!48458) b!299724))

(assert (= (and b!299725 (not c!48458)) b!299722))

(assert (= (and b!299722 c!48459) b!299726))

(assert (= (and b!299722 (not c!48459)) b!299723))

(declare-fun m!311919 () Bool)

(assert (=> b!299723 m!311919))

(declare-fun m!311921 () Bool)

(assert (=> b!299725 m!311921))

(declare-fun m!311923 () Bool)

(assert (=> d!67609 m!311923))

(declare-fun m!311925 () Bool)

(assert (=> d!67609 m!311925))

(assert (=> d!67609 m!311823))

(declare-fun m!311927 () Bool)

(assert (=> d!67609 m!311927))

(declare-fun m!311929 () Bool)

(assert (=> d!67609 m!311929))

(assert (=> d!67609 m!311829))

(assert (=> d!67609 m!311823))

(assert (=> b!299606 d!67609))

(declare-fun b!299747 () Bool)

(declare-fun e!189323 () Bool)

(declare-fun call!25837 () Bool)

(assert (=> b!299747 (= e!189323 call!25837)))

(declare-fun d!67621 () Bool)

(declare-fun res!158004 () Bool)

(declare-fun e!189322 () Bool)

(assert (=> d!67621 (=> res!158004 e!189322)))

(assert (=> d!67621 (= res!158004 (bvsge #b00000000000000000000000000000000 (size!7515 a!3312)))))

(assert (=> d!67621 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!189322)))

(declare-fun bm!25834 () Bool)

(assert (=> bm!25834 (= call!25837 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!299748 () Bool)

(declare-fun e!189324 () Bool)

(assert (=> b!299748 (= e!189322 e!189324)))

(declare-fun c!48462 () Bool)

(assert (=> b!299748 (= c!48462 (validKeyInArray!0 (select (arr!7163 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!299749 () Bool)

(assert (=> b!299749 (= e!189324 call!25837)))

(declare-fun b!299750 () Bool)

(assert (=> b!299750 (= e!189324 e!189323)))

(declare-fun lt!149077 () (_ BitVec 64))

(assert (=> b!299750 (= lt!149077 (select (arr!7163 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9353 0))(
  ( (Unit!9354) )
))
(declare-fun lt!149078 () Unit!9353)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15129 (_ BitVec 64) (_ BitVec 32)) Unit!9353)

(assert (=> b!299750 (= lt!149078 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!149077 #b00000000000000000000000000000000))))

(assert (=> b!299750 (arrayContainsKey!0 a!3312 lt!149077 #b00000000000000000000000000000000)))

(declare-fun lt!149076 () Unit!9353)

(assert (=> b!299750 (= lt!149076 lt!149078)))

(declare-fun res!158005 () Bool)

(assert (=> b!299750 (= res!158005 (= (seekEntryOrOpen!0 (select (arr!7163 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2312 #b00000000000000000000000000000000)))))

(assert (=> b!299750 (=> (not res!158005) (not e!189323))))

(assert (= (and d!67621 (not res!158004)) b!299748))

(assert (= (and b!299748 c!48462) b!299750))

(assert (= (and b!299748 (not c!48462)) b!299749))

(assert (= (and b!299750 res!158005) b!299747))

(assert (= (or b!299747 b!299749) bm!25834))

(declare-fun m!311935 () Bool)

(assert (=> bm!25834 m!311935))

(assert (=> b!299748 m!311889))

(assert (=> b!299748 m!311889))

(declare-fun m!311937 () Bool)

(assert (=> b!299748 m!311937))

(assert (=> b!299750 m!311889))

(declare-fun m!311939 () Bool)

(assert (=> b!299750 m!311939))

(declare-fun m!311941 () Bool)

(assert (=> b!299750 m!311941))

(assert (=> b!299750 m!311889))

(declare-fun m!311943 () Bool)

(assert (=> b!299750 m!311943))

(assert (=> b!299601 d!67621))

(declare-fun d!67631 () Bool)

(assert (=> d!67631 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29716 d!67631))

(declare-fun d!67633 () Bool)

(assert (=> d!67633 (= (array_inv!5126 a!3312) (bvsge (size!7515 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29716 d!67633))

(declare-fun b!299806 () Bool)

(declare-fun e!189354 () SeekEntryResult!2312)

(assert (=> b!299806 (= e!189354 (Intermediate!2312 false lt!148996 #b00000000000000000000000000000000))))

(declare-fun lt!149101 () SeekEntryResult!2312)

(declare-fun b!299807 () Bool)

(assert (=> b!299807 (and (bvsge (index!11426 lt!149101) #b00000000000000000000000000000000) (bvslt (index!11426 lt!149101) (size!7515 (array!15130 (store (arr!7163 a!3312) i!1256 k!2524) (size!7515 a!3312)))))))

(declare-fun res!158012 () Bool)

(assert (=> b!299807 (= res!158012 (= (select (arr!7163 (array!15130 (store (arr!7163 a!3312) i!1256 k!2524) (size!7515 a!3312))) (index!11426 lt!149101)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!189355 () Bool)

(assert (=> b!299807 (=> res!158012 e!189355)))

(declare-fun b!299808 () Bool)

(declare-fun e!189357 () Bool)

(assert (=> b!299808 (= e!189357 (bvsge (x!29672 lt!149101) #b01111111111111111111111111111110))))

(declare-fun b!299809 () Bool)

(assert (=> b!299809 (and (bvsge (index!11426 lt!149101) #b00000000000000000000000000000000) (bvslt (index!11426 lt!149101) (size!7515 (array!15130 (store (arr!7163 a!3312) i!1256 k!2524) (size!7515 a!3312)))))))

(assert (=> b!299809 (= e!189355 (= (select (arr!7163 (array!15130 (store (arr!7163 a!3312) i!1256 k!2524) (size!7515 a!3312))) (index!11426 lt!149101)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!299805 () Bool)

(declare-fun e!189353 () Bool)

(assert (=> b!299805 (= e!189357 e!189353)))

(declare-fun res!158014 () Bool)

(assert (=> b!299805 (= res!158014 (and (is-Intermediate!2312 lt!149101) (not (undefined!3124 lt!149101)) (bvslt (x!29672 lt!149101) #b01111111111111111111111111111110) (bvsge (x!29672 lt!149101) #b00000000000000000000000000000000) (bvsge (x!29672 lt!149101) #b00000000000000000000000000000000)))))

(assert (=> b!299805 (=> (not res!158014) (not e!189353))))

(declare-fun d!67635 () Bool)

(assert (=> d!67635 e!189357))

(declare-fun c!48488 () Bool)

(assert (=> d!67635 (= c!48488 (and (is-Intermediate!2312 lt!149101) (undefined!3124 lt!149101)))))

(declare-fun e!189356 () SeekEntryResult!2312)

(assert (=> d!67635 (= lt!149101 e!189356)))

(declare-fun c!48489 () Bool)

(assert (=> d!67635 (= c!48489 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!149102 () (_ BitVec 64))

(assert (=> d!67635 (= lt!149102 (select (arr!7163 (array!15130 (store (arr!7163 a!3312) i!1256 k!2524) (size!7515 a!3312))) lt!148996))))

(assert (=> d!67635 (validMask!0 mask!3809)))

(assert (=> d!67635 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148996 k!2524 (array!15130 (store (arr!7163 a!3312) i!1256 k!2524) (size!7515 a!3312)) mask!3809) lt!149101)))

(declare-fun b!299810 () Bool)

(assert (=> b!299810 (and (bvsge (index!11426 lt!149101) #b00000000000000000000000000000000) (bvslt (index!11426 lt!149101) (size!7515 (array!15130 (store (arr!7163 a!3312) i!1256 k!2524) (size!7515 a!3312)))))))

(declare-fun res!158013 () Bool)

(assert (=> b!299810 (= res!158013 (= (select (arr!7163 (array!15130 (store (arr!7163 a!3312) i!1256 k!2524) (size!7515 a!3312))) (index!11426 lt!149101)) k!2524))))

(assert (=> b!299810 (=> res!158013 e!189355)))

(assert (=> b!299810 (= e!189353 e!189355)))

(declare-fun b!299811 () Bool)

(assert (=> b!299811 (= e!189356 (Intermediate!2312 true lt!148996 #b00000000000000000000000000000000))))

(declare-fun b!299812 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!299812 (= e!189354 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148996 #b00000000000000000000000000000000 mask!3809) k!2524 (array!15130 (store (arr!7163 a!3312) i!1256 k!2524) (size!7515 a!3312)) mask!3809))))

(declare-fun b!299813 () Bool)

(assert (=> b!299813 (= e!189356 e!189354)))

(declare-fun c!48487 () Bool)

(assert (=> b!299813 (= c!48487 (or (= lt!149102 k!2524) (= (bvadd lt!149102 lt!149102) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!67635 c!48489) b!299811))

(assert (= (and d!67635 (not c!48489)) b!299813))

(assert (= (and b!299813 c!48487) b!299806))

(assert (= (and b!299813 (not c!48487)) b!299812))

(assert (= (and d!67635 c!48488) b!299808))

(assert (= (and d!67635 (not c!48488)) b!299805))

(assert (= (and b!299805 res!158014) b!299810))

(assert (= (and b!299810 (not res!158013)) b!299807))

(assert (= (and b!299807 (not res!158012)) b!299809))

(declare-fun m!311969 () Bool)

(assert (=> b!299807 m!311969))

(assert (=> b!299810 m!311969))

(declare-fun m!311971 () Bool)

(assert (=> d!67635 m!311971))

(assert (=> d!67635 m!311829))

(declare-fun m!311973 () Bool)

(assert (=> b!299812 m!311973))

(assert (=> b!299812 m!311973))

(declare-fun m!311975 () Bool)

(assert (=> b!299812 m!311975))

(assert (=> b!299809 m!311969))

(assert (=> b!299605 d!67635))

(declare-fun b!299815 () Bool)

(declare-fun e!189359 () SeekEntryResult!2312)

(assert (=> b!299815 (= e!189359 (Intermediate!2312 false lt!148996 #b00000000000000000000000000000000))))

(declare-fun b!299816 () Bool)

(declare-fun lt!149103 () SeekEntryResult!2312)

(assert (=> b!299816 (and (bvsge (index!11426 lt!149103) #b00000000000000000000000000000000) (bvslt (index!11426 lt!149103) (size!7515 a!3312)))))

(declare-fun res!158015 () Bool)

(assert (=> b!299816 (= res!158015 (= (select (arr!7163 a!3312) (index!11426 lt!149103)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!189360 () Bool)

(assert (=> b!299816 (=> res!158015 e!189360)))

(declare-fun b!299817 () Bool)

(declare-fun e!189362 () Bool)

(assert (=> b!299817 (= e!189362 (bvsge (x!29672 lt!149103) #b01111111111111111111111111111110))))

(declare-fun b!299818 () Bool)

(assert (=> b!299818 (and (bvsge (index!11426 lt!149103) #b00000000000000000000000000000000) (bvslt (index!11426 lt!149103) (size!7515 a!3312)))))

(assert (=> b!299818 (= e!189360 (= (select (arr!7163 a!3312) (index!11426 lt!149103)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!299814 () Bool)

(declare-fun e!189358 () Bool)

(assert (=> b!299814 (= e!189362 e!189358)))

(declare-fun res!158017 () Bool)

(assert (=> b!299814 (= res!158017 (and (is-Intermediate!2312 lt!149103) (not (undefined!3124 lt!149103)) (bvslt (x!29672 lt!149103) #b01111111111111111111111111111110) (bvsge (x!29672 lt!149103) #b00000000000000000000000000000000) (bvsge (x!29672 lt!149103) #b00000000000000000000000000000000)))))

(assert (=> b!299814 (=> (not res!158017) (not e!189358))))

(declare-fun d!67639 () Bool)

(assert (=> d!67639 e!189362))

(declare-fun c!48491 () Bool)

(assert (=> d!67639 (= c!48491 (and (is-Intermediate!2312 lt!149103) (undefined!3124 lt!149103)))))

(declare-fun e!189361 () SeekEntryResult!2312)

(assert (=> d!67639 (= lt!149103 e!189361)))

(declare-fun c!48492 () Bool)

(assert (=> d!67639 (= c!48492 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!149104 () (_ BitVec 64))

(assert (=> d!67639 (= lt!149104 (select (arr!7163 a!3312) lt!148996))))

(assert (=> d!67639 (validMask!0 mask!3809)))

(assert (=> d!67639 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148996 k!2524 a!3312 mask!3809) lt!149103)))

(declare-fun b!299819 () Bool)

(assert (=> b!299819 (and (bvsge (index!11426 lt!149103) #b00000000000000000000000000000000) (bvslt (index!11426 lt!149103) (size!7515 a!3312)))))

(declare-fun res!158016 () Bool)

