; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7002 () Bool)

(assert start!7002)

(declare-fun res!26568 () Bool)

(declare-fun e!28770 () Bool)

(assert (=> start!7002 (=> (not res!26568) (not e!28770))))

(declare-datatypes ((array!3013 0))(
  ( (array!3014 (arr!1450 (Array (_ BitVec 32) (_ BitVec 64))) (size!1668 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!3013)

(declare-fun size!30 () (_ BitVec 32))

(declare-fun i!1489 () (_ BitVec 32))

(assert (=> start!7002 (= res!26568 (and (bvslt (size!1668 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1668 a!4412)) (= (size!1668 a!4412) size!30) (= a!4412 (array!3014 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (not (= i!1489 size!30)) (= (select (arr!1450 a!4412) i!1489) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1489) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1489) (size!1668 a!4412))))))

(assert (=> start!7002 e!28770))

(declare-fun array_inv!862 (array!3013) Bool)

(assert (=> start!7002 (array_inv!862 a!4412)))

(assert (=> start!7002 true))

(declare-fun b!45277 () Bool)

(declare-fun arrayCountValidKeys!0 (array!3013 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!45277 (= e!28770 (not (= (arrayCountValidKeys!0 a!4412 i!1489 size!30) #b00000000000000000000000000000000)))))

(assert (=> b!45277 (= (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1269 0))(
  ( (Unit!1270) )
))
(declare-fun lt!20090 () Unit!1269)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!3013 (_ BitVec 32) (_ BitVec 32)) Unit!1269)

(assert (=> b!45277 (= lt!20090 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30))))

(assert (= (and start!7002 res!26568) b!45277))

(declare-fun m!39801 () Bool)

(assert (=> start!7002 m!39801))

(declare-fun m!39803 () Bool)

(assert (=> start!7002 m!39803))

(declare-fun m!39805 () Bool)

(assert (=> b!45277 m!39805))

(declare-fun m!39807 () Bool)

(assert (=> b!45277 m!39807))

(declare-fun m!39809 () Bool)

(assert (=> b!45277 m!39809))

(check-sat (not b!45277) (not start!7002))
(check-sat)
(get-model)

(declare-fun d!8797 () Bool)

(declare-fun lt!20096 () (_ BitVec 32))

(assert (=> d!8797 (and (bvsge lt!20096 #b00000000000000000000000000000000) (bvsle lt!20096 (bvsub (size!1668 a!4412) i!1489)))))

(declare-fun e!28783 () (_ BitVec 32))

(assert (=> d!8797 (= lt!20096 e!28783)))

(declare-fun c!6080 () Bool)

(assert (=> d!8797 (= c!6080 (bvsge i!1489 size!30))))

(assert (=> d!8797 (and (bvsle i!1489 size!30) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle size!30 (size!1668 a!4412)))))

(assert (=> d!8797 (= (arrayCountValidKeys!0 a!4412 i!1489 size!30) lt!20096)))

(declare-fun call!3689 () (_ BitVec 32))

(declare-fun bm!3686 () Bool)

(assert (=> bm!3686 (= call!3689 (arrayCountValidKeys!0 a!4412 (bvadd i!1489 #b00000000000000000000000000000001) size!30))))

(declare-fun b!45289 () Bool)

(declare-fun e!28782 () (_ BitVec 32))

(assert (=> b!45289 (= e!28782 call!3689)))

(declare-fun b!45290 () Bool)

(assert (=> b!45290 (= e!28782 (bvadd #b00000000000000000000000000000001 call!3689))))

(declare-fun b!45291 () Bool)

(assert (=> b!45291 (= e!28783 #b00000000000000000000000000000000)))

(declare-fun b!45292 () Bool)

(assert (=> b!45292 (= e!28783 e!28782)))

(declare-fun c!6079 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!45292 (= c!6079 (validKeyInArray!0 (select (arr!1450 a!4412) i!1489)))))

(assert (= (and d!8797 c!6080) b!45291))

(assert (= (and d!8797 (not c!6080)) b!45292))

(assert (= (and b!45292 c!6079) b!45290))

(assert (= (and b!45292 (not c!6079)) b!45289))

(assert (= (or b!45290 b!45289) bm!3686))

(declare-fun m!39821 () Bool)

(assert (=> bm!3686 m!39821))

(assert (=> b!45292 m!39801))

(assert (=> b!45292 m!39801))

(declare-fun m!39823 () Bool)

(assert (=> b!45292 m!39823))

(assert (=> b!45277 d!8797))

(declare-fun d!8801 () Bool)

(declare-fun lt!20097 () (_ BitVec 32))

(assert (=> d!8801 (and (bvsge lt!20097 #b00000000000000000000000000000000) (bvsle lt!20097 (bvsub (size!1668 a!4412) (bvadd #b00000000000000000000000000000001 i!1489))))))

(declare-fun e!28785 () (_ BitVec 32))

(assert (=> d!8801 (= lt!20097 e!28785)))

(declare-fun c!6082 () Bool)

(assert (=> d!8801 (= c!6082 (bvsge (bvadd #b00000000000000000000000000000001 i!1489) size!30))))

(assert (=> d!8801 (and (bvsle (bvadd #b00000000000000000000000000000001 i!1489) size!30) (bvsge (bvadd #b00000000000000000000000000000001 i!1489) #b00000000000000000000000000000000) (bvsle size!30 (size!1668 a!4412)))))

(assert (=> d!8801 (= (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30) lt!20097)))

(declare-fun bm!3687 () Bool)

(declare-fun call!3690 () (_ BitVec 32))

(assert (=> bm!3687 (= call!3690 (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489 #b00000000000000000000000000000001) size!30))))

(declare-fun b!45293 () Bool)

(declare-fun e!28784 () (_ BitVec 32))

(assert (=> b!45293 (= e!28784 call!3690)))

(declare-fun b!45294 () Bool)

(assert (=> b!45294 (= e!28784 (bvadd #b00000000000000000000000000000001 call!3690))))

(declare-fun b!45295 () Bool)

(assert (=> b!45295 (= e!28785 #b00000000000000000000000000000000)))

(declare-fun b!45296 () Bool)

(assert (=> b!45296 (= e!28785 e!28784)))

(declare-fun c!6081 () Bool)

(assert (=> b!45296 (= c!6081 (validKeyInArray!0 (select (arr!1450 a!4412) (bvadd #b00000000000000000000000000000001 i!1489))))))

(assert (= (and d!8801 c!6082) b!45295))

(assert (= (and d!8801 (not c!6082)) b!45296))

(assert (= (and b!45296 c!6081) b!45294))

(assert (= (and b!45296 (not c!6081)) b!45293))

(assert (= (or b!45294 b!45293) bm!3687))

(declare-fun m!39825 () Bool)

(assert (=> bm!3687 m!39825))

(declare-fun m!39827 () Bool)

(assert (=> b!45296 m!39827))

(assert (=> b!45296 m!39827))

(declare-fun m!39829 () Bool)

(assert (=> b!45296 m!39829))

(assert (=> b!45277 d!8801))

(declare-fun d!8803 () Bool)

(assert (=> d!8803 (= (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30) #b00000000000000000000000000000000)))

(declare-fun lt!20102 () Unit!1269)

(declare-fun choose!59 (array!3013 (_ BitVec 32) (_ BitVec 32)) Unit!1269)

(assert (=> d!8803 (= lt!20102 (choose!59 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30))))

(assert (=> d!8803 (bvslt (size!1668 a!4412) #b01111111111111111111111111111111)))

(assert (=> d!8803 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30) lt!20102)))

(declare-fun bs!2112 () Bool)

(assert (= bs!2112 d!8803))

(assert (=> bs!2112 m!39807))

(declare-fun m!39831 () Bool)

(assert (=> bs!2112 m!39831))

(assert (=> b!45277 d!8803))

(declare-fun d!8807 () Bool)

(assert (=> d!8807 (= (array_inv!862 a!4412) (bvsge (size!1668 a!4412) #b00000000000000000000000000000000))))

(assert (=> start!7002 d!8807))

(check-sat (not b!45292) (not d!8803) (not b!45296) (not bm!3686) (not bm!3687))
(check-sat)
(get-model)

(declare-fun d!8821 () Bool)

(assert (=> d!8821 (= (validKeyInArray!0 (select (arr!1450 a!4412) i!1489)) (and (not (= (select (arr!1450 a!4412) i!1489) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1450 a!4412) i!1489) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!45292 d!8821))

(declare-fun d!8823 () Bool)

(assert (=> d!8823 (= (validKeyInArray!0 (select (arr!1450 a!4412) (bvadd #b00000000000000000000000000000001 i!1489))) (and (not (= (select (arr!1450 a!4412) (bvadd #b00000000000000000000000000000001 i!1489)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1450 a!4412) (bvadd #b00000000000000000000000000000001 i!1489)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!45296 d!8823))

(declare-fun d!8825 () Bool)

(declare-fun lt!20115 () (_ BitVec 32))

(assert (=> d!8825 (and (bvsge lt!20115 #b00000000000000000000000000000000) (bvsle lt!20115 (bvsub (size!1668 a!4412) (bvadd i!1489 #b00000000000000000000000000000001))))))

(declare-fun e!28803 () (_ BitVec 32))

(assert (=> d!8825 (= lt!20115 e!28803)))

(declare-fun c!6100 () Bool)

(assert (=> d!8825 (= c!6100 (bvsge (bvadd i!1489 #b00000000000000000000000000000001) size!30))))

(assert (=> d!8825 (and (bvsle (bvadd i!1489 #b00000000000000000000000000000001) size!30) (bvsge (bvadd i!1489 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle size!30 (size!1668 a!4412)))))

(assert (=> d!8825 (= (arrayCountValidKeys!0 a!4412 (bvadd i!1489 #b00000000000000000000000000000001) size!30) lt!20115)))

(declare-fun call!3699 () (_ BitVec 32))

(declare-fun bm!3696 () Bool)

(assert (=> bm!3696 (= call!3699 (arrayCountValidKeys!0 a!4412 (bvadd i!1489 #b00000000000000000000000000000001 #b00000000000000000000000000000001) size!30))))

(declare-fun b!45329 () Bool)

(declare-fun e!28802 () (_ BitVec 32))

(assert (=> b!45329 (= e!28802 call!3699)))

(declare-fun b!45330 () Bool)

(assert (=> b!45330 (= e!28802 (bvadd #b00000000000000000000000000000001 call!3699))))

(declare-fun b!45331 () Bool)

(assert (=> b!45331 (= e!28803 #b00000000000000000000000000000000)))

(declare-fun b!45332 () Bool)

(assert (=> b!45332 (= e!28803 e!28802)))

(declare-fun c!6099 () Bool)

(assert (=> b!45332 (= c!6099 (validKeyInArray!0 (select (arr!1450 a!4412) (bvadd i!1489 #b00000000000000000000000000000001))))))

(assert (= (and d!8825 c!6100) b!45331))

(assert (= (and d!8825 (not c!6100)) b!45332))

(assert (= (and b!45332 c!6099) b!45330))

(assert (= (and b!45332 (not c!6099)) b!45329))

(assert (= (or b!45330 b!45329) bm!3696))

(declare-fun m!39857 () Bool)

(assert (=> bm!3696 m!39857))

(declare-fun m!39859 () Bool)

(assert (=> b!45332 m!39859))

(assert (=> b!45332 m!39859))

(declare-fun m!39861 () Bool)

(assert (=> b!45332 m!39861))

(assert (=> bm!3686 d!8825))

(declare-fun d!8827 () Bool)

(declare-fun lt!20116 () (_ BitVec 32))

(assert (=> d!8827 (and (bvsge lt!20116 #b00000000000000000000000000000000) (bvsle lt!20116 (bvsub (size!1668 a!4412) (bvadd #b00000000000000000000000000000001 i!1489 #b00000000000000000000000000000001))))))

(declare-fun e!28805 () (_ BitVec 32))

(assert (=> d!8827 (= lt!20116 e!28805)))

(declare-fun c!6102 () Bool)

(assert (=> d!8827 (= c!6102 (bvsge (bvadd #b00000000000000000000000000000001 i!1489 #b00000000000000000000000000000001) size!30))))

(assert (=> d!8827 (and (bvsle (bvadd #b00000000000000000000000000000001 i!1489 #b00000000000000000000000000000001) size!30) (bvsge (bvadd #b00000000000000000000000000000001 i!1489 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle size!30 (size!1668 a!4412)))))

(assert (=> d!8827 (= (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489 #b00000000000000000000000000000001) size!30) lt!20116)))

(declare-fun call!3700 () (_ BitVec 32))

(declare-fun bm!3697 () Bool)

(assert (=> bm!3697 (= call!3700 (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489 #b00000000000000000000000000000001 #b00000000000000000000000000000001) size!30))))

(declare-fun b!45333 () Bool)

(declare-fun e!28804 () (_ BitVec 32))

(assert (=> b!45333 (= e!28804 call!3700)))

(declare-fun b!45334 () Bool)

(assert (=> b!45334 (= e!28804 (bvadd #b00000000000000000000000000000001 call!3700))))

(declare-fun b!45335 () Bool)

(assert (=> b!45335 (= e!28805 #b00000000000000000000000000000000)))

(declare-fun b!45336 () Bool)

(assert (=> b!45336 (= e!28805 e!28804)))

(declare-fun c!6101 () Bool)

(assert (=> b!45336 (= c!6101 (validKeyInArray!0 (select (arr!1450 a!4412) (bvadd #b00000000000000000000000000000001 i!1489 #b00000000000000000000000000000001))))))

(assert (= (and d!8827 c!6102) b!45335))

(assert (= (and d!8827 (not c!6102)) b!45336))

(assert (= (and b!45336 c!6101) b!45334))

(assert (= (and b!45336 (not c!6101)) b!45333))

(assert (= (or b!45334 b!45333) bm!3697))

(declare-fun m!39863 () Bool)

(assert (=> bm!3697 m!39863))

(declare-fun m!39865 () Bool)

(assert (=> b!45336 m!39865))

(assert (=> b!45336 m!39865))

(declare-fun m!39867 () Bool)

(assert (=> b!45336 m!39867))

(assert (=> bm!3687 d!8827))

(assert (=> d!8803 d!8801))

(declare-fun d!8829 () Bool)

(assert (=> d!8829 (= (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30) #b00000000000000000000000000000000)))

(assert (=> d!8829 true))

(declare-fun _$88!64 () Unit!1269)

(assert (=> d!8829 (= (choose!59 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30) _$88!64)))

(declare-fun bs!2115 () Bool)

(assert (= bs!2115 d!8829))

(assert (=> bs!2115 m!39807))

(assert (=> d!8803 d!8829))

(check-sat (not bm!3697) (not bm!3696) (not d!8829) (not b!45332) (not b!45336))
(check-sat)
