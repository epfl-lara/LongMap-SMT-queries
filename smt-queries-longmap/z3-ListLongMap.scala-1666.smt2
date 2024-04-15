; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30816 () Bool)

(assert start!30816)

(declare-fun b!309304 () Bool)

(declare-fun e!193201 () Bool)

(declare-fun e!193202 () Bool)

(assert (=> b!309304 (= e!193201 e!193202)))

(declare-fun res!166065 () Bool)

(assert (=> b!309304 (=> (not res!166065) (not e!193202))))

(declare-datatypes ((array!15773 0))(
  ( (array!15774 (arr!7470 (Array (_ BitVec 32) (_ BitVec 64))) (size!7823 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15773)

(declare-datatypes ((SeekEntryResult!2609 0))(
  ( (MissingZero!2609 (index!12612 (_ BitVec 32))) (Found!2609 (index!12613 (_ BitVec 32))) (Intermediate!2609 (undefined!3421 Bool) (index!12614 (_ BitVec 32)) (x!30856 (_ BitVec 32))) (Undefined!2609) (MissingVacant!2609 (index!12615 (_ BitVec 32))) )
))
(declare-fun lt!151388 () SeekEntryResult!2609)

(declare-fun lt!151387 () SeekEntryResult!2609)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!309304 (= res!166065 (and (= lt!151387 lt!151388) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7470 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15773 (_ BitVec 32)) SeekEntryResult!2609)

(assert (=> b!309304 (= lt!151387 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!309305 () Bool)

(declare-fun res!166071 () Bool)

(assert (=> b!309305 (=> (not res!166071) (not e!193201))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!309305 (= res!166071 (and (= (select (arr!7470 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7823 a!3293))))))

(declare-fun b!309306 () Bool)

(declare-fun res!166068 () Bool)

(declare-fun e!193199 () Bool)

(assert (=> b!309306 (=> (not res!166068) (not e!193199))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15773 (_ BitVec 32)) Bool)

(assert (=> b!309306 (= res!166068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!309307 () Bool)

(declare-fun res!166069 () Bool)

(assert (=> b!309307 (=> (not res!166069) (not e!193199))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15773 (_ BitVec 32)) SeekEntryResult!2609)

(assert (=> b!309307 (= res!166069 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2609 i!1240)))))

(declare-fun b!309308 () Bool)

(declare-fun res!166066 () Bool)

(assert (=> b!309308 (=> (not res!166066) (not e!193199))))

(declare-fun arrayContainsKey!0 (array!15773 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309308 (= res!166066 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!309309 () Bool)

(declare-fun res!166063 () Bool)

(assert (=> b!309309 (=> (not res!166063) (not e!193199))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309309 (= res!166063 (validKeyInArray!0 k0!2441))))

(declare-fun res!166070 () Bool)

(assert (=> start!30816 (=> (not res!166070) (not e!193199))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30816 (= res!166070 (validMask!0 mask!3709))))

(assert (=> start!30816 e!193199))

(declare-fun array_inv!5442 (array!15773) Bool)

(assert (=> start!30816 (array_inv!5442 a!3293)))

(assert (=> start!30816 true))

(declare-fun b!309310 () Bool)

(assert (=> b!309310 (= e!193199 e!193201)))

(declare-fun res!166067 () Bool)

(assert (=> b!309310 (=> (not res!166067) (not e!193201))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309310 (= res!166067 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151388))))

(assert (=> b!309310 (= lt!151388 (Intermediate!2609 false resIndex!52 resX!52))))

(declare-fun b!309311 () Bool)

(declare-fun lt!151386 () (_ BitVec 32))

(assert (=> b!309311 (= e!193202 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (and (bvsge lt!151386 #b00000000000000000000000000000000) (bvslt lt!151386 (bvadd #b00000000000000000000000000000001 mask!3709))))))))

(assert (=> b!309311 (= lt!151387 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151386 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309311 (= lt!151386 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!309312 () Bool)

(declare-fun res!166064 () Bool)

(assert (=> b!309312 (=> (not res!166064) (not e!193199))))

(assert (=> b!309312 (= res!166064 (and (= (size!7823 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7823 a!3293))))))

(assert (= (and start!30816 res!166070) b!309312))

(assert (= (and b!309312 res!166064) b!309309))

(assert (= (and b!309309 res!166063) b!309308))

(assert (= (and b!309308 res!166066) b!309307))

(assert (= (and b!309307 res!166069) b!309306))

(assert (= (and b!309306 res!166068) b!309310))

(assert (= (and b!309310 res!166067) b!309305))

(assert (= (and b!309305 res!166071) b!309304))

(assert (= (and b!309304 res!166065) b!309311))

(declare-fun m!318847 () Bool)

(assert (=> b!309304 m!318847))

(declare-fun m!318849 () Bool)

(assert (=> b!309304 m!318849))

(declare-fun m!318851 () Bool)

(assert (=> b!309307 m!318851))

(declare-fun m!318853 () Bool)

(assert (=> b!309305 m!318853))

(declare-fun m!318855 () Bool)

(assert (=> b!309310 m!318855))

(assert (=> b!309310 m!318855))

(declare-fun m!318857 () Bool)

(assert (=> b!309310 m!318857))

(declare-fun m!318859 () Bool)

(assert (=> b!309309 m!318859))

(declare-fun m!318861 () Bool)

(assert (=> start!30816 m!318861))

(declare-fun m!318863 () Bool)

(assert (=> start!30816 m!318863))

(declare-fun m!318865 () Bool)

(assert (=> b!309311 m!318865))

(declare-fun m!318867 () Bool)

(assert (=> b!309311 m!318867))

(declare-fun m!318869 () Bool)

(assert (=> b!309308 m!318869))

(declare-fun m!318871 () Bool)

(assert (=> b!309306 m!318871))

(check-sat (not b!309304) (not start!30816) (not b!309310) (not b!309307) (not b!309309) (not b!309306) (not b!309311) (not b!309308))
(check-sat)
(get-model)

(declare-fun b!309385 () Bool)

(declare-fun e!193237 () SeekEntryResult!2609)

(declare-fun e!193238 () SeekEntryResult!2609)

(assert (=> b!309385 (= e!193237 e!193238)))

(declare-fun c!49230 () Bool)

(declare-fun lt!151411 () (_ BitVec 64))

(assert (=> b!309385 (= c!49230 (or (= lt!151411 k0!2441) (= (bvadd lt!151411 lt!151411) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!309386 () Bool)

(assert (=> b!309386 (= e!193237 (Intermediate!2609 true lt!151386 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!309387 () Bool)

(assert (=> b!309387 (= e!193238 (Intermediate!2609 false lt!151386 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!309388 () Bool)

(declare-fun lt!151412 () SeekEntryResult!2609)

(assert (=> b!309388 (and (bvsge (index!12614 lt!151412) #b00000000000000000000000000000000) (bvslt (index!12614 lt!151412) (size!7823 a!3293)))))

(declare-fun e!193240 () Bool)

(assert (=> b!309388 (= e!193240 (= (select (arr!7470 a!3293) (index!12614 lt!151412)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!309389 () Bool)

(assert (=> b!309389 (and (bvsge (index!12614 lt!151412) #b00000000000000000000000000000000) (bvslt (index!12614 lt!151412) (size!7823 a!3293)))))

(declare-fun res!166132 () Bool)

(assert (=> b!309389 (= res!166132 (= (select (arr!7470 a!3293) (index!12614 lt!151412)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!309389 (=> res!166132 e!193240)))

(declare-fun d!68139 () Bool)

(declare-fun e!193239 () Bool)

(assert (=> d!68139 e!193239))

(declare-fun c!49231 () Bool)

(get-info :version)

(assert (=> d!68139 (= c!49231 (and ((_ is Intermediate!2609) lt!151412) (undefined!3421 lt!151412)))))

(assert (=> d!68139 (= lt!151412 e!193237)))

(declare-fun c!49232 () Bool)

(assert (=> d!68139 (= c!49232 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(assert (=> d!68139 (= lt!151411 (select (arr!7470 a!3293) lt!151386))))

(assert (=> d!68139 (validMask!0 mask!3709)))

(assert (=> d!68139 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151386 k0!2441 a!3293 mask!3709) lt!151412)))

(declare-fun b!309390 () Bool)

(assert (=> b!309390 (and (bvsge (index!12614 lt!151412) #b00000000000000000000000000000000) (bvslt (index!12614 lt!151412) (size!7823 a!3293)))))

(declare-fun res!166133 () Bool)

(assert (=> b!309390 (= res!166133 (= (select (arr!7470 a!3293) (index!12614 lt!151412)) k0!2441))))

(assert (=> b!309390 (=> res!166133 e!193240)))

(declare-fun e!193241 () Bool)

(assert (=> b!309390 (= e!193241 e!193240)))

(declare-fun b!309391 () Bool)

(assert (=> b!309391 (= e!193238 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 lt!151386 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!309392 () Bool)

(assert (=> b!309392 (= e!193239 e!193241)))

(declare-fun res!166134 () Bool)

(assert (=> b!309392 (= res!166134 (and ((_ is Intermediate!2609) lt!151412) (not (undefined!3421 lt!151412)) (bvslt (x!30856 lt!151412) #b01111111111111111111111111111110) (bvsge (x!30856 lt!151412) #b00000000000000000000000000000000) (bvsge (x!30856 lt!151412) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!309392 (=> (not res!166134) (not e!193241))))

(declare-fun b!309393 () Bool)

(assert (=> b!309393 (= e!193239 (bvsge (x!30856 lt!151412) #b01111111111111111111111111111110))))

(assert (= (and d!68139 c!49232) b!309386))

(assert (= (and d!68139 (not c!49232)) b!309385))

(assert (= (and b!309385 c!49230) b!309387))

(assert (= (and b!309385 (not c!49230)) b!309391))

(assert (= (and d!68139 c!49231) b!309393))

(assert (= (and d!68139 (not c!49231)) b!309392))

(assert (= (and b!309392 res!166134) b!309390))

(assert (= (and b!309390 (not res!166133)) b!309389))

(assert (= (and b!309389 (not res!166132)) b!309388))

(declare-fun m!318925 () Bool)

(assert (=> d!68139 m!318925))

(assert (=> d!68139 m!318861))

(declare-fun m!318927 () Bool)

(assert (=> b!309389 m!318927))

(assert (=> b!309388 m!318927))

(declare-fun m!318929 () Bool)

(assert (=> b!309391 m!318929))

(assert (=> b!309391 m!318929))

(declare-fun m!318931 () Bool)

(assert (=> b!309391 m!318931))

(assert (=> b!309390 m!318927))

(assert (=> b!309311 d!68139))

(declare-fun d!68143 () Bool)

(declare-fun lt!151415 () (_ BitVec 32))

(assert (=> d!68143 (and (bvsge lt!151415 #b00000000000000000000000000000000) (bvslt lt!151415 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!68143 (= lt!151415 (choose!52 index!1781 x!1427 mask!3709))))

(assert (=> d!68143 (validMask!0 mask!3709)))

(assert (=> d!68143 (= (nextIndex!0 index!1781 x!1427 mask!3709) lt!151415)))

(declare-fun bs!10850 () Bool)

(assert (= bs!10850 d!68143))

(declare-fun m!318933 () Bool)

(assert (=> bs!10850 m!318933))

(assert (=> bs!10850 m!318861))

(assert (=> b!309311 d!68143))

(declare-fun d!68145 () Bool)

(declare-fun res!166149 () Bool)

(declare-fun e!193265 () Bool)

(assert (=> d!68145 (=> res!166149 e!193265)))

(assert (=> d!68145 (= res!166149 (bvsge #b00000000000000000000000000000000 (size!7823 a!3293)))))

(assert (=> d!68145 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!193265)))

(declare-fun b!309429 () Bool)

(declare-fun e!193263 () Bool)

(declare-fun call!25895 () Bool)

(assert (=> b!309429 (= e!193263 call!25895)))

(declare-fun b!309430 () Bool)

(declare-fun e!193264 () Bool)

(assert (=> b!309430 (= e!193263 e!193264)))

(declare-fun lt!151429 () (_ BitVec 64))

(assert (=> b!309430 (= lt!151429 (select (arr!7470 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9547 0))(
  ( (Unit!9548) )
))
(declare-fun lt!151428 () Unit!9547)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15773 (_ BitVec 64) (_ BitVec 32)) Unit!9547)

(assert (=> b!309430 (= lt!151428 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!151429 #b00000000000000000000000000000000))))

(assert (=> b!309430 (arrayContainsKey!0 a!3293 lt!151429 #b00000000000000000000000000000000)))

(declare-fun lt!151430 () Unit!9547)

(assert (=> b!309430 (= lt!151430 lt!151428)))

(declare-fun res!166148 () Bool)

(assert (=> b!309430 (= res!166148 (= (seekEntryOrOpen!0 (select (arr!7470 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2609 #b00000000000000000000000000000000)))))

(assert (=> b!309430 (=> (not res!166148) (not e!193264))))

(declare-fun b!309431 () Bool)

(assert (=> b!309431 (= e!193265 e!193263)))

(declare-fun c!49244 () Bool)

(assert (=> b!309431 (= c!49244 (validKeyInArray!0 (select (arr!7470 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!309432 () Bool)

(assert (=> b!309432 (= e!193264 call!25895)))

(declare-fun bm!25892 () Bool)

(assert (=> bm!25892 (= call!25895 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(assert (= (and d!68145 (not res!166149)) b!309431))

(assert (= (and b!309431 c!49244) b!309430))

(assert (= (and b!309431 (not c!49244)) b!309429))

(assert (= (and b!309430 res!166148) b!309432))

(assert (= (or b!309432 b!309429) bm!25892))

(declare-fun m!318943 () Bool)

(assert (=> b!309430 m!318943))

(declare-fun m!318945 () Bool)

(assert (=> b!309430 m!318945))

(declare-fun m!318947 () Bool)

(assert (=> b!309430 m!318947))

(assert (=> b!309430 m!318943))

(declare-fun m!318949 () Bool)

(assert (=> b!309430 m!318949))

(assert (=> b!309431 m!318943))

(assert (=> b!309431 m!318943))

(declare-fun m!318951 () Bool)

(assert (=> b!309431 m!318951))

(declare-fun m!318953 () Bool)

(assert (=> bm!25892 m!318953))

(assert (=> b!309306 d!68145))

(declare-fun b!309478 () Bool)

(declare-fun e!193293 () SeekEntryResult!2609)

(declare-fun lt!151457 () SeekEntryResult!2609)

(assert (=> b!309478 (= e!193293 (MissingZero!2609 (index!12614 lt!151457)))))

(declare-fun b!309479 () Bool)

(declare-fun e!193294 () SeekEntryResult!2609)

(declare-fun e!193295 () SeekEntryResult!2609)

(assert (=> b!309479 (= e!193294 e!193295)))

(declare-fun lt!151456 () (_ BitVec 64))

(assert (=> b!309479 (= lt!151456 (select (arr!7470 a!3293) (index!12614 lt!151457)))))

(declare-fun c!49260 () Bool)

(assert (=> b!309479 (= c!49260 (= lt!151456 k0!2441))))

(declare-fun b!309480 () Bool)

(declare-fun c!49262 () Bool)

(assert (=> b!309480 (= c!49262 (= lt!151456 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!309480 (= e!193295 e!193293)))

(declare-fun b!309481 () Bool)

(assert (=> b!309481 (= e!193294 Undefined!2609)))

(declare-fun b!309483 () Bool)

(assert (=> b!309483 (= e!193295 (Found!2609 (index!12614 lt!151457)))))

(declare-fun b!309482 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15773 (_ BitVec 32)) SeekEntryResult!2609)

(assert (=> b!309482 (= e!193293 (seekKeyOrZeroReturnVacant!0 (x!30856 lt!151457) (index!12614 lt!151457) (index!12614 lt!151457) k0!2441 a!3293 mask!3709))))

(declare-fun d!68151 () Bool)

(declare-fun lt!151455 () SeekEntryResult!2609)

(assert (=> d!68151 (and (or ((_ is Undefined!2609) lt!151455) (not ((_ is Found!2609) lt!151455)) (and (bvsge (index!12613 lt!151455) #b00000000000000000000000000000000) (bvslt (index!12613 lt!151455) (size!7823 a!3293)))) (or ((_ is Undefined!2609) lt!151455) ((_ is Found!2609) lt!151455) (not ((_ is MissingZero!2609) lt!151455)) (and (bvsge (index!12612 lt!151455) #b00000000000000000000000000000000) (bvslt (index!12612 lt!151455) (size!7823 a!3293)))) (or ((_ is Undefined!2609) lt!151455) ((_ is Found!2609) lt!151455) ((_ is MissingZero!2609) lt!151455) (not ((_ is MissingVacant!2609) lt!151455)) (and (bvsge (index!12615 lt!151455) #b00000000000000000000000000000000) (bvslt (index!12615 lt!151455) (size!7823 a!3293)))) (or ((_ is Undefined!2609) lt!151455) (ite ((_ is Found!2609) lt!151455) (= (select (arr!7470 a!3293) (index!12613 lt!151455)) k0!2441) (ite ((_ is MissingZero!2609) lt!151455) (= (select (arr!7470 a!3293) (index!12612 lt!151455)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2609) lt!151455) (= (select (arr!7470 a!3293) (index!12615 lt!151455)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!68151 (= lt!151455 e!193294)))

(declare-fun c!49261 () Bool)

(assert (=> d!68151 (= c!49261 (and ((_ is Intermediate!2609) lt!151457) (undefined!3421 lt!151457)))))

(assert (=> d!68151 (= lt!151457 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!68151 (validMask!0 mask!3709)))

(assert (=> d!68151 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!151455)))

(assert (= (and d!68151 c!49261) b!309481))

(assert (= (and d!68151 (not c!49261)) b!309479))

(assert (= (and b!309479 c!49260) b!309483))

(assert (= (and b!309479 (not c!49260)) b!309480))

(assert (= (and b!309480 c!49262) b!309478))

(assert (= (and b!309480 (not c!49262)) b!309482))

(declare-fun m!318967 () Bool)

(assert (=> b!309479 m!318967))

(declare-fun m!318969 () Bool)

(assert (=> b!309482 m!318969))

(assert (=> d!68151 m!318861))

(assert (=> d!68151 m!318855))

(assert (=> d!68151 m!318857))

(declare-fun m!318971 () Bool)

(assert (=> d!68151 m!318971))

(declare-fun m!318973 () Bool)

(assert (=> d!68151 m!318973))

(assert (=> d!68151 m!318855))

(declare-fun m!318975 () Bool)

(assert (=> d!68151 m!318975))

(assert (=> b!309307 d!68151))

(declare-fun d!68163 () Bool)

(assert (=> d!68163 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!30816 d!68163))

(declare-fun d!68169 () Bool)

(assert (=> d!68169 (= (array_inv!5442 a!3293) (bvsge (size!7823 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!30816 d!68169))

(declare-fun d!68171 () Bool)

(declare-fun res!166186 () Bool)

(declare-fun e!193329 () Bool)

(assert (=> d!68171 (=> res!166186 e!193329)))

(assert (=> d!68171 (= res!166186 (= (select (arr!7470 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!68171 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!193329)))

(declare-fun b!309533 () Bool)

(declare-fun e!193330 () Bool)

(assert (=> b!309533 (= e!193329 e!193330)))

(declare-fun res!166187 () Bool)

(assert (=> b!309533 (=> (not res!166187) (not e!193330))))

(assert (=> b!309533 (= res!166187 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7823 a!3293)))))

(declare-fun b!309534 () Bool)

(assert (=> b!309534 (= e!193330 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68171 (not res!166186)) b!309533))

(assert (= (and b!309533 res!166187) b!309534))

(assert (=> d!68171 m!318943))

(declare-fun m!319005 () Bool)

(assert (=> b!309534 m!319005))

(assert (=> b!309308 d!68171))

(declare-fun b!309535 () Bool)

(declare-fun e!193331 () SeekEntryResult!2609)

(declare-fun e!193332 () SeekEntryResult!2609)

(assert (=> b!309535 (= e!193331 e!193332)))

(declare-fun c!49278 () Bool)

(declare-fun lt!151478 () (_ BitVec 64))

(assert (=> b!309535 (= c!49278 (or (= lt!151478 k0!2441) (= (bvadd lt!151478 lt!151478) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!309536 () Bool)

(assert (=> b!309536 (= e!193331 (Intermediate!2609 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!309537 () Bool)

(assert (=> b!309537 (= e!193332 (Intermediate!2609 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!309538 () Bool)

(declare-fun lt!151479 () SeekEntryResult!2609)

(assert (=> b!309538 (and (bvsge (index!12614 lt!151479) #b00000000000000000000000000000000) (bvslt (index!12614 lt!151479) (size!7823 a!3293)))))

(declare-fun e!193334 () Bool)

(assert (=> b!309538 (= e!193334 (= (select (arr!7470 a!3293) (index!12614 lt!151479)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!309539 () Bool)

(assert (=> b!309539 (and (bvsge (index!12614 lt!151479) #b00000000000000000000000000000000) (bvslt (index!12614 lt!151479) (size!7823 a!3293)))))

(declare-fun res!166188 () Bool)

(assert (=> b!309539 (= res!166188 (= (select (arr!7470 a!3293) (index!12614 lt!151479)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!309539 (=> res!166188 e!193334)))

(declare-fun d!68177 () Bool)

(declare-fun e!193333 () Bool)

(assert (=> d!68177 e!193333))

(declare-fun c!49279 () Bool)

(assert (=> d!68177 (= c!49279 (and ((_ is Intermediate!2609) lt!151479) (undefined!3421 lt!151479)))))

(assert (=> d!68177 (= lt!151479 e!193331)))

(declare-fun c!49280 () Bool)

(assert (=> d!68177 (= c!49280 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!68177 (= lt!151478 (select (arr!7470 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!68177 (validMask!0 mask!3709)))

(assert (=> d!68177 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151479)))

(declare-fun b!309540 () Bool)

(assert (=> b!309540 (and (bvsge (index!12614 lt!151479) #b00000000000000000000000000000000) (bvslt (index!12614 lt!151479) (size!7823 a!3293)))))

(declare-fun res!166189 () Bool)

(assert (=> b!309540 (= res!166189 (= (select (arr!7470 a!3293) (index!12614 lt!151479)) k0!2441))))

(assert (=> b!309540 (=> res!166189 e!193334)))

(declare-fun e!193335 () Bool)

(assert (=> b!309540 (= e!193335 e!193334)))

(declare-fun b!309541 () Bool)

(assert (=> b!309541 (= e!193332 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!309542 () Bool)

(assert (=> b!309542 (= e!193333 e!193335)))

(declare-fun res!166190 () Bool)

(assert (=> b!309542 (= res!166190 (and ((_ is Intermediate!2609) lt!151479) (not (undefined!3421 lt!151479)) (bvslt (x!30856 lt!151479) #b01111111111111111111111111111110) (bvsge (x!30856 lt!151479) #b00000000000000000000000000000000) (bvsge (x!30856 lt!151479) #b00000000000000000000000000000000)))))

(assert (=> b!309542 (=> (not res!166190) (not e!193335))))

(declare-fun b!309543 () Bool)

(assert (=> b!309543 (= e!193333 (bvsge (x!30856 lt!151479) #b01111111111111111111111111111110))))

(assert (= (and d!68177 c!49280) b!309536))

(assert (= (and d!68177 (not c!49280)) b!309535))

(assert (= (and b!309535 c!49278) b!309537))

(assert (= (and b!309535 (not c!49278)) b!309541))

(assert (= (and d!68177 c!49279) b!309543))

(assert (= (and d!68177 (not c!49279)) b!309542))

(assert (= (and b!309542 res!166190) b!309540))

(assert (= (and b!309540 (not res!166189)) b!309539))

(assert (= (and b!309539 (not res!166188)) b!309538))

(assert (=> d!68177 m!318855))

(declare-fun m!319007 () Bool)

(assert (=> d!68177 m!319007))

(assert (=> d!68177 m!318861))

(declare-fun m!319009 () Bool)

(assert (=> b!309539 m!319009))

(assert (=> b!309538 m!319009))

(assert (=> b!309541 m!318855))

(declare-fun m!319011 () Bool)

(assert (=> b!309541 m!319011))

(assert (=> b!309541 m!319011))

(declare-fun m!319013 () Bool)

(assert (=> b!309541 m!319013))

(assert (=> b!309540 m!319009))

(assert (=> b!309310 d!68177))

(declare-fun d!68179 () Bool)

(declare-fun lt!151487 () (_ BitVec 32))

(declare-fun lt!151486 () (_ BitVec 32))

(assert (=> d!68179 (= lt!151487 (bvmul (bvxor lt!151486 (bvlshr lt!151486 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68179 (= lt!151486 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68179 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!166191 (let ((h!5313 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!30865 (bvmul (bvxor h!5313 (bvlshr h!5313 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!30865 (bvlshr x!30865 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!166191 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!166191 #b00000000000000000000000000000000))))))

(assert (=> d!68179 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!151487 (bvlshr lt!151487 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!309310 d!68179))

(declare-fun d!68187 () Bool)

(assert (=> d!68187 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!309309 d!68187))

(declare-fun b!309553 () Bool)

(declare-fun e!193341 () SeekEntryResult!2609)

(declare-fun e!193342 () SeekEntryResult!2609)

(assert (=> b!309553 (= e!193341 e!193342)))

(declare-fun c!49284 () Bool)

(declare-fun lt!151488 () (_ BitVec 64))

(assert (=> b!309553 (= c!49284 (or (= lt!151488 k0!2441) (= (bvadd lt!151488 lt!151488) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!309554 () Bool)

(assert (=> b!309554 (= e!193341 (Intermediate!2609 true index!1781 x!1427))))

(declare-fun b!309555 () Bool)

(assert (=> b!309555 (= e!193342 (Intermediate!2609 false index!1781 x!1427))))

(declare-fun b!309556 () Bool)

(declare-fun lt!151489 () SeekEntryResult!2609)

(assert (=> b!309556 (and (bvsge (index!12614 lt!151489) #b00000000000000000000000000000000) (bvslt (index!12614 lt!151489) (size!7823 a!3293)))))

(declare-fun e!193344 () Bool)

(assert (=> b!309556 (= e!193344 (= (select (arr!7470 a!3293) (index!12614 lt!151489)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!309557 () Bool)

(assert (=> b!309557 (and (bvsge (index!12614 lt!151489) #b00000000000000000000000000000000) (bvslt (index!12614 lt!151489) (size!7823 a!3293)))))

(declare-fun res!166195 () Bool)

(assert (=> b!309557 (= res!166195 (= (select (arr!7470 a!3293) (index!12614 lt!151489)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!309557 (=> res!166195 e!193344)))

(declare-fun d!68189 () Bool)

(declare-fun e!193343 () Bool)

(assert (=> d!68189 e!193343))

(declare-fun c!49285 () Bool)

(assert (=> d!68189 (= c!49285 (and ((_ is Intermediate!2609) lt!151489) (undefined!3421 lt!151489)))))

(assert (=> d!68189 (= lt!151489 e!193341)))

(declare-fun c!49286 () Bool)

(assert (=> d!68189 (= c!49286 (bvsge x!1427 #b01111111111111111111111111111110))))

(assert (=> d!68189 (= lt!151488 (select (arr!7470 a!3293) index!1781))))

(assert (=> d!68189 (validMask!0 mask!3709)))

(assert (=> d!68189 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!151489)))

(declare-fun b!309558 () Bool)

(assert (=> b!309558 (and (bvsge (index!12614 lt!151489) #b00000000000000000000000000000000) (bvslt (index!12614 lt!151489) (size!7823 a!3293)))))

(declare-fun res!166196 () Bool)

(assert (=> b!309558 (= res!166196 (= (select (arr!7470 a!3293) (index!12614 lt!151489)) k0!2441))))

(assert (=> b!309558 (=> res!166196 e!193344)))

(declare-fun e!193345 () Bool)

(assert (=> b!309558 (= e!193345 e!193344)))

(declare-fun b!309559 () Bool)

(assert (=> b!309559 (= e!193342 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!309560 () Bool)

(assert (=> b!309560 (= e!193343 e!193345)))

(declare-fun res!166197 () Bool)

(assert (=> b!309560 (= res!166197 (and ((_ is Intermediate!2609) lt!151489) (not (undefined!3421 lt!151489)) (bvslt (x!30856 lt!151489) #b01111111111111111111111111111110) (bvsge (x!30856 lt!151489) #b00000000000000000000000000000000) (bvsge (x!30856 lt!151489) x!1427)))))

(assert (=> b!309560 (=> (not res!166197) (not e!193345))))

(declare-fun b!309561 () Bool)

(assert (=> b!309561 (= e!193343 (bvsge (x!30856 lt!151489) #b01111111111111111111111111111110))))

(assert (= (and d!68189 c!49286) b!309554))

(assert (= (and d!68189 (not c!49286)) b!309553))

(assert (= (and b!309553 c!49284) b!309555))

(assert (= (and b!309553 (not c!49284)) b!309559))

(assert (= (and d!68189 c!49285) b!309561))

(assert (= (and d!68189 (not c!49285)) b!309560))

(assert (= (and b!309560 res!166197) b!309558))

(assert (= (and b!309558 (not res!166196)) b!309557))

(assert (= (and b!309557 (not res!166195)) b!309556))

(assert (=> d!68189 m!318847))

(assert (=> d!68189 m!318861))

(declare-fun m!319023 () Bool)

(assert (=> b!309557 m!319023))

(assert (=> b!309556 m!319023))

(assert (=> b!309559 m!318867))

(assert (=> b!309559 m!318867))

(declare-fun m!319025 () Bool)

(assert (=> b!309559 m!319025))

(assert (=> b!309558 m!319023))

(assert (=> b!309304 d!68189))

(check-sat (not d!68177) (not b!309482) (not b!309431) (not d!68189) (not b!309534) (not d!68151) (not b!309430) (not d!68143) (not b!309541) (not b!309391) (not bm!25892) (not b!309559) (not d!68139))
(check-sat)
