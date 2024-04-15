; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30330 () Bool)

(assert start!30330)

(declare-fun b!303672 () Bool)

(declare-fun res!161307 () Bool)

(declare-fun e!190941 () Bool)

(assert (=> b!303672 (=> (not res!161307) (not e!190941))))

(declare-datatypes ((array!15440 0))(
  ( (array!15441 (arr!7308 (Array (_ BitVec 32) (_ BitVec 64))) (size!7661 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15440)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!303672 (= res!161307 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7308 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7308 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7308 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!303673 () Bool)

(declare-fun res!161312 () Bool)

(declare-fun e!190942 () Bool)

(assert (=> b!303673 (=> (not res!161312) (not e!190942))))

(declare-fun arrayContainsKey!0 (array!15440 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303673 (= res!161312 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303674 () Bool)

(declare-fun res!161313 () Bool)

(assert (=> b!303674 (=> (not res!161313) (not e!190941))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!303674 (= res!161313 (and (= (select (arr!7308 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7661 a!3293))))))

(declare-fun b!303676 () Bool)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun lt!150055 () (_ BitVec 32))

(assert (=> b!303676 (= e!190941 (and (bvsge mask!3709 #b00000000000000000000000000000000) (or (bvslt lt!150055 #b00000000000000000000000000000000) (bvsge lt!150055 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303676 (= lt!150055 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!303677 () Bool)

(declare-fun res!161310 () Bool)

(assert (=> b!303677 (=> (not res!161310) (not e!190942))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15440 (_ BitVec 32)) Bool)

(assert (=> b!303677 (= res!161310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303678 () Bool)

(declare-fun res!161306 () Bool)

(assert (=> b!303678 (=> (not res!161306) (not e!190941))))

(declare-datatypes ((SeekEntryResult!2447 0))(
  ( (MissingZero!2447 (index!11964 (_ BitVec 32))) (Found!2447 (index!11965 (_ BitVec 32))) (Intermediate!2447 (undefined!3259 Bool) (index!11966 (_ BitVec 32)) (x!30235 (_ BitVec 32))) (Undefined!2447) (MissingVacant!2447 (index!11967 (_ BitVec 32))) )
))
(declare-fun lt!150056 () SeekEntryResult!2447)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15440 (_ BitVec 32)) SeekEntryResult!2447)

(assert (=> b!303678 (= res!161306 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150056))))

(declare-fun b!303679 () Bool)

(declare-fun res!161309 () Bool)

(assert (=> b!303679 (=> (not res!161309) (not e!190942))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303679 (= res!161309 (validKeyInArray!0 k0!2441))))

(declare-fun b!303680 () Bool)

(declare-fun res!161304 () Bool)

(assert (=> b!303680 (=> (not res!161304) (not e!190942))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15440 (_ BitVec 32)) SeekEntryResult!2447)

(assert (=> b!303680 (= res!161304 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2447 i!1240)))))

(declare-fun b!303681 () Bool)

(assert (=> b!303681 (= e!190942 e!190941)))

(declare-fun res!161305 () Bool)

(assert (=> b!303681 (=> (not res!161305) (not e!190941))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303681 (= res!161305 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150056))))

(assert (=> b!303681 (= lt!150056 (Intermediate!2447 false resIndex!52 resX!52))))

(declare-fun b!303675 () Bool)

(declare-fun res!161308 () Bool)

(assert (=> b!303675 (=> (not res!161308) (not e!190942))))

(assert (=> b!303675 (= res!161308 (and (= (size!7661 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7661 a!3293))))))

(declare-fun res!161311 () Bool)

(assert (=> start!30330 (=> (not res!161311) (not e!190942))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30330 (= res!161311 (validMask!0 mask!3709))))

(assert (=> start!30330 e!190942))

(declare-fun array_inv!5280 (array!15440) Bool)

(assert (=> start!30330 (array_inv!5280 a!3293)))

(assert (=> start!30330 true))

(assert (= (and start!30330 res!161311) b!303675))

(assert (= (and b!303675 res!161308) b!303679))

(assert (= (and b!303679 res!161309) b!303673))

(assert (= (and b!303673 res!161312) b!303680))

(assert (= (and b!303680 res!161304) b!303677))

(assert (= (and b!303677 res!161310) b!303681))

(assert (= (and b!303681 res!161305) b!303674))

(assert (= (and b!303674 res!161313) b!303678))

(assert (= (and b!303678 res!161306) b!303672))

(assert (= (and b!303672 res!161307) b!303676))

(declare-fun m!314467 () Bool)

(assert (=> b!303680 m!314467))

(declare-fun m!314469 () Bool)

(assert (=> b!303679 m!314469))

(declare-fun m!314471 () Bool)

(assert (=> b!303678 m!314471))

(declare-fun m!314473 () Bool)

(assert (=> start!30330 m!314473))

(declare-fun m!314475 () Bool)

(assert (=> start!30330 m!314475))

(declare-fun m!314477 () Bool)

(assert (=> b!303681 m!314477))

(assert (=> b!303681 m!314477))

(declare-fun m!314479 () Bool)

(assert (=> b!303681 m!314479))

(declare-fun m!314481 () Bool)

(assert (=> b!303677 m!314481))

(declare-fun m!314483 () Bool)

(assert (=> b!303676 m!314483))

(declare-fun m!314485 () Bool)

(assert (=> b!303672 m!314485))

(declare-fun m!314487 () Bool)

(assert (=> b!303674 m!314487))

(declare-fun m!314489 () Bool)

(assert (=> b!303673 m!314489))

(check-sat (not start!30330) (not b!303677) (not b!303673) (not b!303681) (not b!303680) (not b!303676) (not b!303678) (not b!303679))
(check-sat)
(get-model)

(declare-fun b!303750 () Bool)

(declare-fun e!190970 () Bool)

(declare-fun call!25868 () Bool)

(assert (=> b!303750 (= e!190970 call!25868)))

(declare-fun b!303751 () Bool)

(declare-fun e!190968 () Bool)

(assert (=> b!303751 (= e!190970 e!190968)))

(declare-fun lt!150075 () (_ BitVec 64))

(assert (=> b!303751 (= lt!150075 (select (arr!7308 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9349 0))(
  ( (Unit!9350) )
))
(declare-fun lt!150076 () Unit!9349)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15440 (_ BitVec 64) (_ BitVec 32)) Unit!9349)

(assert (=> b!303751 (= lt!150076 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!150075 #b00000000000000000000000000000000))))

(assert (=> b!303751 (arrayContainsKey!0 a!3293 lt!150075 #b00000000000000000000000000000000)))

(declare-fun lt!150077 () Unit!9349)

(assert (=> b!303751 (= lt!150077 lt!150076)))

(declare-fun res!161379 () Bool)

(assert (=> b!303751 (= res!161379 (= (seekEntryOrOpen!0 (select (arr!7308 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2447 #b00000000000000000000000000000000)))))

(assert (=> b!303751 (=> (not res!161379) (not e!190968))))

(declare-fun b!303752 () Bool)

(assert (=> b!303752 (= e!190968 call!25868)))

(declare-fun b!303753 () Bool)

(declare-fun e!190969 () Bool)

(assert (=> b!303753 (= e!190969 e!190970)))

(declare-fun c!48785 () Bool)

(assert (=> b!303753 (= c!48785 (validKeyInArray!0 (select (arr!7308 a!3293) #b00000000000000000000000000000000)))))

(declare-fun bm!25865 () Bool)

(assert (=> bm!25865 (= call!25868 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun d!67845 () Bool)

(declare-fun res!161378 () Bool)

(assert (=> d!67845 (=> res!161378 e!190969)))

(assert (=> d!67845 (= res!161378 (bvsge #b00000000000000000000000000000000 (size!7661 a!3293)))))

(assert (=> d!67845 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!190969)))

(assert (= (and d!67845 (not res!161378)) b!303753))

(assert (= (and b!303753 c!48785) b!303751))

(assert (= (and b!303753 (not c!48785)) b!303750))

(assert (= (and b!303751 res!161379) b!303752))

(assert (= (or b!303752 b!303750) bm!25865))

(declare-fun m!314539 () Bool)

(assert (=> b!303751 m!314539))

(declare-fun m!314541 () Bool)

(assert (=> b!303751 m!314541))

(declare-fun m!314543 () Bool)

(assert (=> b!303751 m!314543))

(assert (=> b!303751 m!314539))

(declare-fun m!314545 () Bool)

(assert (=> b!303751 m!314545))

(assert (=> b!303753 m!314539))

(assert (=> b!303753 m!314539))

(declare-fun m!314547 () Bool)

(assert (=> b!303753 m!314547))

(declare-fun m!314549 () Bool)

(assert (=> bm!25865 m!314549))

(assert (=> b!303677 d!67845))

(declare-fun d!67847 () Bool)

(declare-fun lt!150080 () (_ BitVec 32))

(assert (=> d!67847 (and (bvsge lt!150080 #b00000000000000000000000000000000) (bvslt lt!150080 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!67847 (= lt!150080 (choose!52 index!1781 x!1427 mask!3709))))

(assert (=> d!67847 (validMask!0 mask!3709)))

(assert (=> d!67847 (= (nextIndex!0 index!1781 x!1427 mask!3709) lt!150080)))

(declare-fun bs!10679 () Bool)

(assert (= bs!10679 d!67847))

(declare-fun m!314551 () Bool)

(assert (=> bs!10679 m!314551))

(assert (=> bs!10679 m!314473))

(assert (=> b!303676 d!67847))

(declare-fun d!67851 () Bool)

(assert (=> d!67851 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!30330 d!67851))

(declare-fun d!67859 () Bool)

(assert (=> d!67859 (= (array_inv!5280 a!3293) (bvsge (size!7661 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!30330 d!67859))

(declare-fun b!303826 () Bool)

(declare-fun lt!150098 () SeekEntryResult!2447)

(assert (=> b!303826 (and (bvsge (index!11966 lt!150098) #b00000000000000000000000000000000) (bvslt (index!11966 lt!150098) (size!7661 a!3293)))))

(declare-fun e!191014 () Bool)

(assert (=> b!303826 (= e!191014 (= (select (arr!7308 a!3293) (index!11966 lt!150098)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!303827 () Bool)

(declare-fun e!191011 () SeekEntryResult!2447)

(assert (=> b!303827 (= e!191011 (Intermediate!2447 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!303828 () Bool)

(declare-fun e!191013 () Bool)

(declare-fun e!191015 () Bool)

(assert (=> b!303828 (= e!191013 e!191015)))

(declare-fun res!161405 () Bool)

(get-info :version)

(assert (=> b!303828 (= res!161405 (and ((_ is Intermediate!2447) lt!150098) (not (undefined!3259 lt!150098)) (bvslt (x!30235 lt!150098) #b01111111111111111111111111111110) (bvsge (x!30235 lt!150098) #b00000000000000000000000000000000) (bvsge (x!30235 lt!150098) #b00000000000000000000000000000000)))))

(assert (=> b!303828 (=> (not res!161405) (not e!191015))))

(declare-fun b!303829 () Bool)

(assert (=> b!303829 (and (bvsge (index!11966 lt!150098) #b00000000000000000000000000000000) (bvslt (index!11966 lt!150098) (size!7661 a!3293)))))

(declare-fun res!161406 () Bool)

(assert (=> b!303829 (= res!161406 (= (select (arr!7308 a!3293) (index!11966 lt!150098)) k0!2441))))

(assert (=> b!303829 (=> res!161406 e!191014)))

(assert (=> b!303829 (= e!191015 e!191014)))

(declare-fun b!303830 () Bool)

(assert (=> b!303830 (= e!191011 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!303831 () Bool)

(declare-fun e!191012 () SeekEntryResult!2447)

(assert (=> b!303831 (= e!191012 e!191011)))

(declare-fun c!48810 () Bool)

(declare-fun lt!150097 () (_ BitVec 64))

(assert (=> b!303831 (= c!48810 (or (= lt!150097 k0!2441) (= (bvadd lt!150097 lt!150097) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!303833 () Bool)

(assert (=> b!303833 (and (bvsge (index!11966 lt!150098) #b00000000000000000000000000000000) (bvslt (index!11966 lt!150098) (size!7661 a!3293)))))

(declare-fun res!161404 () Bool)

(assert (=> b!303833 (= res!161404 (= (select (arr!7308 a!3293) (index!11966 lt!150098)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!303833 (=> res!161404 e!191014)))

(declare-fun b!303834 () Bool)

(assert (=> b!303834 (= e!191013 (bvsge (x!30235 lt!150098) #b01111111111111111111111111111110))))

(declare-fun d!67861 () Bool)

(assert (=> d!67861 e!191013))

(declare-fun c!48811 () Bool)

(assert (=> d!67861 (= c!48811 (and ((_ is Intermediate!2447) lt!150098) (undefined!3259 lt!150098)))))

(assert (=> d!67861 (= lt!150098 e!191012)))

(declare-fun c!48812 () Bool)

(assert (=> d!67861 (= c!48812 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67861 (= lt!150097 (select (arr!7308 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!67861 (validMask!0 mask!3709)))

(assert (=> d!67861 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150098)))

(declare-fun b!303832 () Bool)

(assert (=> b!303832 (= e!191012 (Intermediate!2447 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(assert (= (and d!67861 c!48812) b!303832))

(assert (= (and d!67861 (not c!48812)) b!303831))

(assert (= (and b!303831 c!48810) b!303827))

(assert (= (and b!303831 (not c!48810)) b!303830))

(assert (= (and d!67861 c!48811) b!303834))

(assert (= (and d!67861 (not c!48811)) b!303828))

(assert (= (and b!303828 res!161405) b!303829))

(assert (= (and b!303829 (not res!161406)) b!303833))

(assert (= (and b!303833 (not res!161404)) b!303826))

(declare-fun m!314561 () Bool)

(assert (=> b!303829 m!314561))

(assert (=> b!303826 m!314561))

(assert (=> b!303830 m!314477))

(declare-fun m!314563 () Bool)

(assert (=> b!303830 m!314563))

(assert (=> b!303830 m!314563))

(declare-fun m!314565 () Bool)

(assert (=> b!303830 m!314565))

(assert (=> d!67861 m!314477))

(declare-fun m!314567 () Bool)

(assert (=> d!67861 m!314567))

(assert (=> d!67861 m!314473))

(assert (=> b!303833 m!314561))

(assert (=> b!303681 d!67861))

(declare-fun d!67869 () Bool)

(declare-fun lt!150104 () (_ BitVec 32))

(declare-fun lt!150103 () (_ BitVec 32))

(assert (=> d!67869 (= lt!150104 (bvmul (bvxor lt!150103 (bvlshr lt!150103 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67869 (= lt!150103 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67869 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!161407 (let ((h!5302 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!30242 (bvmul (bvxor h!5302 (bvlshr h!5302 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!30242 (bvlshr x!30242 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!161407 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!161407 #b00000000000000000000000000000000))))))

(assert (=> d!67869 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!150104 (bvlshr lt!150104 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!303681 d!67869))

(declare-fun b!303892 () Bool)

(declare-fun e!191052 () SeekEntryResult!2447)

(declare-fun e!191051 () SeekEntryResult!2447)

(assert (=> b!303892 (= e!191052 e!191051)))

(declare-fun lt!150146 () (_ BitVec 64))

(declare-fun lt!150145 () SeekEntryResult!2447)

(assert (=> b!303892 (= lt!150146 (select (arr!7308 a!3293) (index!11966 lt!150145)))))

(declare-fun c!48836 () Bool)

(assert (=> b!303892 (= c!48836 (= lt!150146 k0!2441))))

(declare-fun b!303893 () Bool)

(assert (=> b!303893 (= e!191052 Undefined!2447)))

(declare-fun d!67871 () Bool)

(declare-fun lt!150144 () SeekEntryResult!2447)

(assert (=> d!67871 (and (or ((_ is Undefined!2447) lt!150144) (not ((_ is Found!2447) lt!150144)) (and (bvsge (index!11965 lt!150144) #b00000000000000000000000000000000) (bvslt (index!11965 lt!150144) (size!7661 a!3293)))) (or ((_ is Undefined!2447) lt!150144) ((_ is Found!2447) lt!150144) (not ((_ is MissingZero!2447) lt!150144)) (and (bvsge (index!11964 lt!150144) #b00000000000000000000000000000000) (bvslt (index!11964 lt!150144) (size!7661 a!3293)))) (or ((_ is Undefined!2447) lt!150144) ((_ is Found!2447) lt!150144) ((_ is MissingZero!2447) lt!150144) (not ((_ is MissingVacant!2447) lt!150144)) (and (bvsge (index!11967 lt!150144) #b00000000000000000000000000000000) (bvslt (index!11967 lt!150144) (size!7661 a!3293)))) (or ((_ is Undefined!2447) lt!150144) (ite ((_ is Found!2447) lt!150144) (= (select (arr!7308 a!3293) (index!11965 lt!150144)) k0!2441) (ite ((_ is MissingZero!2447) lt!150144) (= (select (arr!7308 a!3293) (index!11964 lt!150144)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2447) lt!150144) (= (select (arr!7308 a!3293) (index!11967 lt!150144)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67871 (= lt!150144 e!191052)))

(declare-fun c!48835 () Bool)

(assert (=> d!67871 (= c!48835 (and ((_ is Intermediate!2447) lt!150145) (undefined!3259 lt!150145)))))

(assert (=> d!67871 (= lt!150145 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!67871 (validMask!0 mask!3709)))

(assert (=> d!67871 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!150144)))

(declare-fun b!303894 () Bool)

(assert (=> b!303894 (= e!191051 (Found!2447 (index!11966 lt!150145)))))

(declare-fun b!303895 () Bool)

(declare-fun c!48834 () Bool)

(assert (=> b!303895 (= c!48834 (= lt!150146 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!191053 () SeekEntryResult!2447)

(assert (=> b!303895 (= e!191051 e!191053)))

(declare-fun b!303896 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15440 (_ BitVec 32)) SeekEntryResult!2447)

(assert (=> b!303896 (= e!191053 (seekKeyOrZeroReturnVacant!0 (x!30235 lt!150145) (index!11966 lt!150145) (index!11966 lt!150145) k0!2441 a!3293 mask!3709))))

(declare-fun b!303897 () Bool)

(assert (=> b!303897 (= e!191053 (MissingZero!2447 (index!11966 lt!150145)))))

(assert (= (and d!67871 c!48835) b!303893))

(assert (= (and d!67871 (not c!48835)) b!303892))

(assert (= (and b!303892 c!48836) b!303894))

(assert (= (and b!303892 (not c!48836)) b!303895))

(assert (= (and b!303895 c!48834) b!303897))

(assert (= (and b!303895 (not c!48834)) b!303896))

(declare-fun m!314603 () Bool)

(assert (=> b!303892 m!314603))

(assert (=> d!67871 m!314473))

(declare-fun m!314605 () Bool)

(assert (=> d!67871 m!314605))

(assert (=> d!67871 m!314477))

(declare-fun m!314607 () Bool)

(assert (=> d!67871 m!314607))

(declare-fun m!314609 () Bool)

(assert (=> d!67871 m!314609))

(assert (=> d!67871 m!314477))

(assert (=> d!67871 m!314479))

(declare-fun m!314611 () Bool)

(assert (=> b!303896 m!314611))

(assert (=> b!303680 d!67871))

(declare-fun d!67889 () Bool)

(assert (=> d!67889 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!303679 d!67889))

(declare-fun b!303898 () Bool)

(declare-fun lt!150150 () SeekEntryResult!2447)

(assert (=> b!303898 (and (bvsge (index!11966 lt!150150) #b00000000000000000000000000000000) (bvslt (index!11966 lt!150150) (size!7661 a!3293)))))

(declare-fun e!191057 () Bool)

(assert (=> b!303898 (= e!191057 (= (select (arr!7308 a!3293) (index!11966 lt!150150)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!303899 () Bool)

(declare-fun e!191054 () SeekEntryResult!2447)

(assert (=> b!303899 (= e!191054 (Intermediate!2447 false index!1781 x!1427))))

(declare-fun b!303900 () Bool)

(declare-fun e!191056 () Bool)

(declare-fun e!191058 () Bool)

(assert (=> b!303900 (= e!191056 e!191058)))

(declare-fun res!161425 () Bool)

(assert (=> b!303900 (= res!161425 (and ((_ is Intermediate!2447) lt!150150) (not (undefined!3259 lt!150150)) (bvslt (x!30235 lt!150150) #b01111111111111111111111111111110) (bvsge (x!30235 lt!150150) #b00000000000000000000000000000000) (bvsge (x!30235 lt!150150) x!1427)))))

(assert (=> b!303900 (=> (not res!161425) (not e!191058))))

(declare-fun b!303901 () Bool)

(assert (=> b!303901 (and (bvsge (index!11966 lt!150150) #b00000000000000000000000000000000) (bvslt (index!11966 lt!150150) (size!7661 a!3293)))))

(declare-fun res!161426 () Bool)

(assert (=> b!303901 (= res!161426 (= (select (arr!7308 a!3293) (index!11966 lt!150150)) k0!2441))))

(assert (=> b!303901 (=> res!161426 e!191057)))

(assert (=> b!303901 (= e!191058 e!191057)))

(declare-fun b!303902 () Bool)

(assert (=> b!303902 (= e!191054 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!303903 () Bool)

(declare-fun e!191055 () SeekEntryResult!2447)

(assert (=> b!303903 (= e!191055 e!191054)))

(declare-fun c!48837 () Bool)

(declare-fun lt!150149 () (_ BitVec 64))

(assert (=> b!303903 (= c!48837 (or (= lt!150149 k0!2441) (= (bvadd lt!150149 lt!150149) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!303905 () Bool)

(assert (=> b!303905 (and (bvsge (index!11966 lt!150150) #b00000000000000000000000000000000) (bvslt (index!11966 lt!150150) (size!7661 a!3293)))))

(declare-fun res!161424 () Bool)

(assert (=> b!303905 (= res!161424 (= (select (arr!7308 a!3293) (index!11966 lt!150150)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!303905 (=> res!161424 e!191057)))

(declare-fun b!303906 () Bool)

(assert (=> b!303906 (= e!191056 (bvsge (x!30235 lt!150150) #b01111111111111111111111111111110))))

(declare-fun d!67891 () Bool)

(assert (=> d!67891 e!191056))

(declare-fun c!48838 () Bool)

(assert (=> d!67891 (= c!48838 (and ((_ is Intermediate!2447) lt!150150) (undefined!3259 lt!150150)))))

(assert (=> d!67891 (= lt!150150 e!191055)))

(declare-fun c!48839 () Bool)

(assert (=> d!67891 (= c!48839 (bvsge x!1427 #b01111111111111111111111111111110))))

(assert (=> d!67891 (= lt!150149 (select (arr!7308 a!3293) index!1781))))

(assert (=> d!67891 (validMask!0 mask!3709)))

(assert (=> d!67891 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150150)))

(declare-fun b!303904 () Bool)

(assert (=> b!303904 (= e!191055 (Intermediate!2447 true index!1781 x!1427))))

(assert (= (and d!67891 c!48839) b!303904))

(assert (= (and d!67891 (not c!48839)) b!303903))

(assert (= (and b!303903 c!48837) b!303899))

(assert (= (and b!303903 (not c!48837)) b!303902))

(assert (= (and d!67891 c!48838) b!303906))

(assert (= (and d!67891 (not c!48838)) b!303900))

(assert (= (and b!303900 res!161425) b!303901))

(assert (= (and b!303901 (not res!161426)) b!303905))

(assert (= (and b!303905 (not res!161424)) b!303898))

(declare-fun m!314613 () Bool)

(assert (=> b!303901 m!314613))

(assert (=> b!303898 m!314613))

(assert (=> b!303902 m!314483))

(assert (=> b!303902 m!314483))

(declare-fun m!314615 () Bool)

(assert (=> b!303902 m!314615))

(assert (=> d!67891 m!314485))

(assert (=> d!67891 m!314473))

(assert (=> b!303905 m!314613))

(assert (=> b!303678 d!67891))

(declare-fun d!67893 () Bool)

(declare-fun res!161431 () Bool)

(declare-fun e!191066 () Bool)

(assert (=> d!67893 (=> res!161431 e!191066)))

(assert (=> d!67893 (= res!161431 (= (select (arr!7308 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!67893 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!191066)))

(declare-fun b!303917 () Bool)

(declare-fun e!191067 () Bool)

(assert (=> b!303917 (= e!191066 e!191067)))

(declare-fun res!161432 () Bool)

(assert (=> b!303917 (=> (not res!161432) (not e!191067))))

(assert (=> b!303917 (= res!161432 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7661 a!3293)))))

(declare-fun b!303918 () Bool)

(assert (=> b!303918 (= e!191067 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67893 (not res!161431)) b!303917))

(assert (= (and b!303917 res!161432) b!303918))

(assert (=> d!67893 m!314539))

(declare-fun m!314627 () Bool)

(assert (=> b!303918 m!314627))

(assert (=> b!303673 d!67893))

(check-sat (not b!303918) (not b!303751) (not b!303830) (not b!303902) (not b!303896) (not d!67847) (not d!67871) (not d!67891) (not b!303753) (not d!67861) (not bm!25865))
(check-sat)
