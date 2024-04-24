; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30012 () Bool)

(assert start!30012)

(declare-fun b!301249 () Bool)

(declare-fun res!159052 () Bool)

(declare-fun e!190136 () Bool)

(assert (=> b!301249 (=> (not res!159052) (not e!190136))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301249 (= res!159052 (validKeyInArray!0 k0!2441))))

(declare-fun b!301250 () Bool)

(declare-fun res!159049 () Bool)

(assert (=> b!301250 (=> (not res!159049) (not e!190136))))

(declare-datatypes ((array!15248 0))(
  ( (array!15249 (arr!7216 (Array (_ BitVec 32) (_ BitVec 64))) (size!7568 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15248)

(declare-fun arrayContainsKey!0 (array!15248 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301250 (= res!159049 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301251 () Bool)

(declare-fun res!159054 () Bool)

(assert (=> b!301251 (=> (not res!159054) (not e!190136))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15248 (_ BitVec 32)) Bool)

(assert (=> b!301251 (= res!159054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!159051 () Bool)

(assert (=> start!30012 (=> (not res!159051) (not e!190136))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30012 (= res!159051 (validMask!0 mask!3709))))

(assert (=> start!30012 e!190136))

(assert (=> start!30012 true))

(declare-fun array_inv!5166 (array!15248) Bool)

(assert (=> start!30012 (array_inv!5166 a!3293)))

(declare-fun b!301252 () Bool)

(declare-fun res!159050 () Bool)

(assert (=> b!301252 (=> (not res!159050) (not e!190136))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2321 0))(
  ( (MissingZero!2321 (index!11460 (_ BitVec 32))) (Found!2321 (index!11461 (_ BitVec 32))) (Intermediate!2321 (undefined!3133 Bool) (index!11462 (_ BitVec 32)) (x!29846 (_ BitVec 32))) (Undefined!2321) (MissingVacant!2321 (index!11463 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15248 (_ BitVec 32)) SeekEntryResult!2321)

(assert (=> b!301252 (= res!159050 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2321 i!1240)))))

(declare-fun b!301253 () Bool)

(declare-fun res!159053 () Bool)

(assert (=> b!301253 (=> (not res!159053) (not e!190136))))

(assert (=> b!301253 (= res!159053 (and (= (size!7568 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7568 a!3293))))))

(declare-fun b!301254 () Bool)

(assert (=> b!301254 (= e!190136 (and (bvsge mask!3709 #b00000000000000000000000000000000) (bvsgt mask!3709 #b00111111111111111111111111111111)))))

(assert (= (and start!30012 res!159051) b!301253))

(assert (= (and b!301253 res!159053) b!301249))

(assert (= (and b!301249 res!159052) b!301250))

(assert (= (and b!301250 res!159049) b!301252))

(assert (= (and b!301252 res!159050) b!301251))

(assert (= (and b!301251 res!159054) b!301254))

(declare-fun m!313227 () Bool)

(assert (=> b!301251 m!313227))

(declare-fun m!313229 () Bool)

(assert (=> start!30012 m!313229))

(declare-fun m!313231 () Bool)

(assert (=> start!30012 m!313231))

(declare-fun m!313233 () Bool)

(assert (=> b!301249 m!313233))

(declare-fun m!313235 () Bool)

(assert (=> b!301250 m!313235))

(declare-fun m!313237 () Bool)

(assert (=> b!301252 m!313237))

(check-sat (not b!301250) (not start!30012) (not b!301249) (not b!301252) (not b!301251))
(check-sat)
(get-model)

(declare-fun b!301321 () Bool)

(declare-fun c!48706 () Bool)

(declare-fun lt!149824 () (_ BitVec 64))

(assert (=> b!301321 (= c!48706 (= lt!149824 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!190173 () SeekEntryResult!2321)

(declare-fun e!190172 () SeekEntryResult!2321)

(assert (=> b!301321 (= e!190173 e!190172)))

(declare-fun d!67889 () Bool)

(declare-fun lt!149825 () SeekEntryResult!2321)

(get-info :version)

(assert (=> d!67889 (and (or ((_ is Undefined!2321) lt!149825) (not ((_ is Found!2321) lt!149825)) (and (bvsge (index!11461 lt!149825) #b00000000000000000000000000000000) (bvslt (index!11461 lt!149825) (size!7568 a!3293)))) (or ((_ is Undefined!2321) lt!149825) ((_ is Found!2321) lt!149825) (not ((_ is MissingZero!2321) lt!149825)) (and (bvsge (index!11460 lt!149825) #b00000000000000000000000000000000) (bvslt (index!11460 lt!149825) (size!7568 a!3293)))) (or ((_ is Undefined!2321) lt!149825) ((_ is Found!2321) lt!149825) ((_ is MissingZero!2321) lt!149825) (not ((_ is MissingVacant!2321) lt!149825)) (and (bvsge (index!11463 lt!149825) #b00000000000000000000000000000000) (bvslt (index!11463 lt!149825) (size!7568 a!3293)))) (or ((_ is Undefined!2321) lt!149825) (ite ((_ is Found!2321) lt!149825) (= (select (arr!7216 a!3293) (index!11461 lt!149825)) k0!2441) (ite ((_ is MissingZero!2321) lt!149825) (= (select (arr!7216 a!3293) (index!11460 lt!149825)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2321) lt!149825) (= (select (arr!7216 a!3293) (index!11463 lt!149825)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!190171 () SeekEntryResult!2321)

(assert (=> d!67889 (= lt!149825 e!190171)))

(declare-fun c!48705 () Bool)

(declare-fun lt!149826 () SeekEntryResult!2321)

(assert (=> d!67889 (= c!48705 (and ((_ is Intermediate!2321) lt!149826) (undefined!3133 lt!149826)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15248 (_ BitVec 32)) SeekEntryResult!2321)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!67889 (= lt!149826 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!67889 (validMask!0 mask!3709)))

(assert (=> d!67889 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!149825)))

(declare-fun b!301322 () Bool)

(assert (=> b!301322 (= e!190171 e!190173)))

(assert (=> b!301322 (= lt!149824 (select (arr!7216 a!3293) (index!11462 lt!149826)))))

(declare-fun c!48707 () Bool)

(assert (=> b!301322 (= c!48707 (= lt!149824 k0!2441))))

(declare-fun b!301323 () Bool)

(assert (=> b!301323 (= e!190173 (Found!2321 (index!11462 lt!149826)))))

(declare-fun b!301324 () Bool)

(assert (=> b!301324 (= e!190172 (MissingZero!2321 (index!11462 lt!149826)))))

(declare-fun b!301325 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15248 (_ BitVec 32)) SeekEntryResult!2321)

(assert (=> b!301325 (= e!190172 (seekKeyOrZeroReturnVacant!0 (x!29846 lt!149826) (index!11462 lt!149826) (index!11462 lt!149826) k0!2441 a!3293 mask!3709))))

(declare-fun b!301326 () Bool)

(assert (=> b!301326 (= e!190171 Undefined!2321)))

(assert (= (and d!67889 c!48705) b!301326))

(assert (= (and d!67889 (not c!48705)) b!301322))

(assert (= (and b!301322 c!48707) b!301323))

(assert (= (and b!301322 (not c!48707)) b!301321))

(assert (= (and b!301321 c!48706) b!301324))

(assert (= (and b!301321 (not c!48706)) b!301325))

(declare-fun m!313277 () Bool)

(assert (=> d!67889 m!313277))

(declare-fun m!313279 () Bool)

(assert (=> d!67889 m!313279))

(assert (=> d!67889 m!313229))

(declare-fun m!313281 () Bool)

(assert (=> d!67889 m!313281))

(assert (=> d!67889 m!313277))

(declare-fun m!313283 () Bool)

(assert (=> d!67889 m!313283))

(declare-fun m!313285 () Bool)

(assert (=> d!67889 m!313285))

(declare-fun m!313287 () Bool)

(assert (=> b!301322 m!313287))

(declare-fun m!313289 () Bool)

(assert (=> b!301325 m!313289))

(assert (=> b!301252 d!67889))

(declare-fun d!67901 () Bool)

(assert (=> d!67901 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!301249 d!67901))

(declare-fun d!67903 () Bool)

(declare-fun res!159107 () Bool)

(declare-fun e!190178 () Bool)

(assert (=> d!67903 (=> res!159107 e!190178)))

(assert (=> d!67903 (= res!159107 (= (select (arr!7216 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!67903 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!190178)))

(declare-fun b!301331 () Bool)

(declare-fun e!190179 () Bool)

(assert (=> b!301331 (= e!190178 e!190179)))

(declare-fun res!159108 () Bool)

(assert (=> b!301331 (=> (not res!159108) (not e!190179))))

(assert (=> b!301331 (= res!159108 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7568 a!3293)))))

(declare-fun b!301332 () Bool)

(assert (=> b!301332 (= e!190179 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67903 (not res!159107)) b!301331))

(assert (= (and b!301331 res!159108) b!301332))

(declare-fun m!313291 () Bool)

(assert (=> d!67903 m!313291))

(declare-fun m!313293 () Bool)

(assert (=> b!301332 m!313293))

(assert (=> b!301250 d!67903))

(declare-fun d!67905 () Bool)

(assert (=> d!67905 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!30012 d!67905))

(declare-fun d!67915 () Bool)

(assert (=> d!67915 (= (array_inv!5166 a!3293) (bvsge (size!7568 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!30012 d!67915))

(declare-fun d!67917 () Bool)

(declare-fun res!159119 () Bool)

(declare-fun e!190195 () Bool)

(assert (=> d!67917 (=> res!159119 e!190195)))

(assert (=> d!67917 (= res!159119 (bvsge #b00000000000000000000000000000000 (size!7568 a!3293)))))

(assert (=> d!67917 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!190195)))

(declare-fun b!301353 () Bool)

(declare-fun e!190197 () Bool)

(declare-fun e!190196 () Bool)

(assert (=> b!301353 (= e!190197 e!190196)))

(declare-fun lt!149842 () (_ BitVec 64))

(assert (=> b!301353 (= lt!149842 (select (arr!7216 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9337 0))(
  ( (Unit!9338) )
))
(declare-fun lt!149844 () Unit!9337)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15248 (_ BitVec 64) (_ BitVec 32)) Unit!9337)

(assert (=> b!301353 (= lt!149844 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!149842 #b00000000000000000000000000000000))))

(assert (=> b!301353 (arrayContainsKey!0 a!3293 lt!149842 #b00000000000000000000000000000000)))

(declare-fun lt!149843 () Unit!9337)

(assert (=> b!301353 (= lt!149843 lt!149844)))

(declare-fun res!159120 () Bool)

(assert (=> b!301353 (= res!159120 (= (seekEntryOrOpen!0 (select (arr!7216 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2321 #b00000000000000000000000000000000)))))

(assert (=> b!301353 (=> (not res!159120) (not e!190196))))

(declare-fun b!301354 () Bool)

(declare-fun call!25859 () Bool)

(assert (=> b!301354 (= e!190196 call!25859)))

(declare-fun b!301355 () Bool)

(assert (=> b!301355 (= e!190195 e!190197)))

(declare-fun c!48713 () Bool)

(assert (=> b!301355 (= c!48713 (validKeyInArray!0 (select (arr!7216 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!301356 () Bool)

(assert (=> b!301356 (= e!190197 call!25859)))

(declare-fun bm!25856 () Bool)

(assert (=> bm!25856 (= call!25859 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(assert (= (and d!67917 (not res!159119)) b!301355))

(assert (= (and b!301355 c!48713) b!301353))

(assert (= (and b!301355 (not c!48713)) b!301356))

(assert (= (and b!301353 res!159120) b!301354))

(assert (= (or b!301354 b!301356) bm!25856))

(assert (=> b!301353 m!313291))

(declare-fun m!313307 () Bool)

(assert (=> b!301353 m!313307))

(declare-fun m!313309 () Bool)

(assert (=> b!301353 m!313309))

(assert (=> b!301353 m!313291))

(declare-fun m!313311 () Bool)

(assert (=> b!301353 m!313311))

(assert (=> b!301355 m!313291))

(assert (=> b!301355 m!313291))

(declare-fun m!313313 () Bool)

(assert (=> b!301355 m!313313))

(declare-fun m!313315 () Bool)

(assert (=> bm!25856 m!313315))

(assert (=> b!301251 d!67917))

(check-sat (not b!301353) (not bm!25856) (not b!301355) (not b!301325) (not b!301332) (not d!67889))
(check-sat)
