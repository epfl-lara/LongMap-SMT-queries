; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45896 () Bool)

(assert start!45896)

(declare-fun b!508363 () Bool)

(declare-fun res!309326 () Bool)

(declare-fun e!297402 () Bool)

(assert (=> b!508363 (=> (not res!309326) (not e!297402))))

(declare-datatypes ((array!32652 0))(
  ( (array!32653 (arr!15706 (Array (_ BitVec 32) (_ BitVec 64))) (size!16070 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32652)

(declare-datatypes ((List!9864 0))(
  ( (Nil!9861) (Cons!9860 (h!10737 (_ BitVec 64)) (t!16092 List!9864)) )
))
(declare-fun arrayNoDuplicates!0 (array!32652 (_ BitVec 32) List!9864) Bool)

(assert (=> b!508363 (= res!309326 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9861))))

(declare-fun res!309325 () Bool)

(declare-fun e!297401 () Bool)

(assert (=> start!45896 (=> (not res!309325) (not e!297401))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45896 (= res!309325 (validMask!0 mask!3524))))

(assert (=> start!45896 e!297401))

(assert (=> start!45896 true))

(declare-fun array_inv!11502 (array!32652) Bool)

(assert (=> start!45896 (array_inv!11502 a!3235)))

(declare-fun b!508364 () Bool)

(assert (=> b!508364 (= e!297401 e!297402)))

(declare-fun res!309329 () Bool)

(assert (=> b!508364 (=> (not res!309329) (not e!297402))))

(declare-datatypes ((SeekEntryResult!4173 0))(
  ( (MissingZero!4173 (index!18880 (_ BitVec 32))) (Found!4173 (index!18881 (_ BitVec 32))) (Intermediate!4173 (undefined!4985 Bool) (index!18882 (_ BitVec 32)) (x!47862 (_ BitVec 32))) (Undefined!4173) (MissingVacant!4173 (index!18883 (_ BitVec 32))) )
))
(declare-fun lt!232215 () SeekEntryResult!4173)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!508364 (= res!309329 (or (= lt!232215 (MissingZero!4173 i!1204)) (= lt!232215 (MissingVacant!4173 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32652 (_ BitVec 32)) SeekEntryResult!4173)

(assert (=> b!508364 (= lt!232215 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!508365 () Bool)

(declare-fun res!309322 () Bool)

(assert (=> b!508365 (=> (not res!309322) (not e!297401))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508365 (= res!309322 (validKeyInArray!0 (select (arr!15706 a!3235) j!176)))))

(declare-fun b!508366 () Bool)

(assert (=> b!508366 (= e!297402 (not (= (seekEntryOrOpen!0 (select (arr!15706 a!3235) j!176) a!3235 mask!3524) (Found!4173 j!176))))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32652 (_ BitVec 32)) Bool)

(assert (=> b!508366 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15604 0))(
  ( (Unit!15605) )
))
(declare-fun lt!232216 () Unit!15604)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32652 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15604)

(assert (=> b!508366 (= lt!232216 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!508367 () Bool)

(declare-fun res!309324 () Bool)

(assert (=> b!508367 (=> (not res!309324) (not e!297401))))

(declare-fun arrayContainsKey!0 (array!32652 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508367 (= res!309324 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508368 () Bool)

(declare-fun res!309328 () Bool)

(assert (=> b!508368 (=> (not res!309328) (not e!297401))))

(assert (=> b!508368 (= res!309328 (and (= (size!16070 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16070 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16070 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508369 () Bool)

(declare-fun res!309323 () Bool)

(assert (=> b!508369 (=> (not res!309323) (not e!297402))))

(assert (=> b!508369 (= res!309323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508370 () Bool)

(declare-fun res!309327 () Bool)

(assert (=> b!508370 (=> (not res!309327) (not e!297401))))

(assert (=> b!508370 (= res!309327 (validKeyInArray!0 k0!2280))))

(assert (= (and start!45896 res!309325) b!508368))

(assert (= (and b!508368 res!309328) b!508365))

(assert (= (and b!508365 res!309322) b!508370))

(assert (= (and b!508370 res!309327) b!508367))

(assert (= (and b!508367 res!309324) b!508364))

(assert (= (and b!508364 res!309329) b!508369))

(assert (= (and b!508369 res!309323) b!508363))

(assert (= (and b!508363 res!309326) b!508366))

(declare-fun m!489147 () Bool)

(assert (=> b!508363 m!489147))

(declare-fun m!489149 () Bool)

(assert (=> b!508365 m!489149))

(assert (=> b!508365 m!489149))

(declare-fun m!489151 () Bool)

(assert (=> b!508365 m!489151))

(assert (=> b!508366 m!489149))

(assert (=> b!508366 m!489149))

(declare-fun m!489153 () Bool)

(assert (=> b!508366 m!489153))

(declare-fun m!489155 () Bool)

(assert (=> b!508366 m!489155))

(declare-fun m!489157 () Bool)

(assert (=> b!508366 m!489157))

(declare-fun m!489159 () Bool)

(assert (=> b!508369 m!489159))

(declare-fun m!489161 () Bool)

(assert (=> b!508364 m!489161))

(declare-fun m!489163 () Bool)

(assert (=> b!508370 m!489163))

(declare-fun m!489165 () Bool)

(assert (=> b!508367 m!489165))

(declare-fun m!489167 () Bool)

(assert (=> start!45896 m!489167))

(declare-fun m!489169 () Bool)

(assert (=> start!45896 m!489169))

(check-sat (not b!508369) (not start!45896) (not b!508370) (not b!508367) (not b!508364) (not b!508363) (not b!508366) (not b!508365))
(check-sat)
(get-model)

(declare-fun d!78741 () Bool)

(declare-fun lt!232237 () SeekEntryResult!4173)

(get-info :version)

(assert (=> d!78741 (and (or ((_ is Undefined!4173) lt!232237) (not ((_ is Found!4173) lt!232237)) (and (bvsge (index!18881 lt!232237) #b00000000000000000000000000000000) (bvslt (index!18881 lt!232237) (size!16070 a!3235)))) (or ((_ is Undefined!4173) lt!232237) ((_ is Found!4173) lt!232237) (not ((_ is MissingZero!4173) lt!232237)) (and (bvsge (index!18880 lt!232237) #b00000000000000000000000000000000) (bvslt (index!18880 lt!232237) (size!16070 a!3235)))) (or ((_ is Undefined!4173) lt!232237) ((_ is Found!4173) lt!232237) ((_ is MissingZero!4173) lt!232237) (not ((_ is MissingVacant!4173) lt!232237)) (and (bvsge (index!18883 lt!232237) #b00000000000000000000000000000000) (bvslt (index!18883 lt!232237) (size!16070 a!3235)))) (or ((_ is Undefined!4173) lt!232237) (ite ((_ is Found!4173) lt!232237) (= (select (arr!15706 a!3235) (index!18881 lt!232237)) (select (arr!15706 a!3235) j!176)) (ite ((_ is MissingZero!4173) lt!232237) (= (select (arr!15706 a!3235) (index!18880 lt!232237)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4173) lt!232237) (= (select (arr!15706 a!3235) (index!18883 lt!232237)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!297436 () SeekEntryResult!4173)

(assert (=> d!78741 (= lt!232237 e!297436)))

(declare-fun c!59812 () Bool)

(declare-fun lt!232235 () SeekEntryResult!4173)

(assert (=> d!78741 (= c!59812 (and ((_ is Intermediate!4173) lt!232235) (undefined!4985 lt!232235)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32652 (_ BitVec 32)) SeekEntryResult!4173)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!78741 (= lt!232235 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15706 a!3235) j!176) mask!3524) (select (arr!15706 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!78741 (validMask!0 mask!3524)))

(assert (=> d!78741 (= (seekEntryOrOpen!0 (select (arr!15706 a!3235) j!176) a!3235 mask!3524) lt!232237)))

(declare-fun b!508430 () Bool)

(declare-fun c!59810 () Bool)

(declare-fun lt!232236 () (_ BitVec 64))

(assert (=> b!508430 (= c!59810 (= lt!232236 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!297437 () SeekEntryResult!4173)

(declare-fun e!297438 () SeekEntryResult!4173)

(assert (=> b!508430 (= e!297437 e!297438)))

(declare-fun b!508431 () Bool)

(assert (=> b!508431 (= e!297436 Undefined!4173)))

(declare-fun b!508432 () Bool)

(assert (=> b!508432 (= e!297437 (Found!4173 (index!18882 lt!232235)))))

(declare-fun b!508433 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32652 (_ BitVec 32)) SeekEntryResult!4173)

(assert (=> b!508433 (= e!297438 (seekKeyOrZeroReturnVacant!0 (x!47862 lt!232235) (index!18882 lt!232235) (index!18882 lt!232235) (select (arr!15706 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!508434 () Bool)

(assert (=> b!508434 (= e!297436 e!297437)))

(assert (=> b!508434 (= lt!232236 (select (arr!15706 a!3235) (index!18882 lt!232235)))))

(declare-fun c!59811 () Bool)

(assert (=> b!508434 (= c!59811 (= lt!232236 (select (arr!15706 a!3235) j!176)))))

(declare-fun b!508435 () Bool)

(assert (=> b!508435 (= e!297438 (MissingZero!4173 (index!18882 lt!232235)))))

(assert (= (and d!78741 c!59812) b!508431))

(assert (= (and d!78741 (not c!59812)) b!508434))

(assert (= (and b!508434 c!59811) b!508432))

(assert (= (and b!508434 (not c!59811)) b!508430))

(assert (= (and b!508430 c!59810) b!508435))

(assert (= (and b!508430 (not c!59810)) b!508433))

(declare-fun m!489203 () Bool)

(assert (=> d!78741 m!489203))

(declare-fun m!489205 () Bool)

(assert (=> d!78741 m!489205))

(assert (=> d!78741 m!489149))

(declare-fun m!489207 () Bool)

(assert (=> d!78741 m!489207))

(assert (=> d!78741 m!489149))

(assert (=> d!78741 m!489205))

(assert (=> d!78741 m!489167))

(declare-fun m!489209 () Bool)

(assert (=> d!78741 m!489209))

(declare-fun m!489211 () Bool)

(assert (=> d!78741 m!489211))

(assert (=> b!508433 m!489149))

(declare-fun m!489215 () Bool)

(assert (=> b!508433 m!489215))

(declare-fun m!489221 () Bool)

(assert (=> b!508434 m!489221))

(assert (=> b!508366 d!78741))

(declare-fun call!31484 () Bool)

(declare-fun bm!31481 () Bool)

(assert (=> bm!31481 (= call!31484 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!508460 () Bool)

(declare-fun e!297457 () Bool)

(declare-fun e!297458 () Bool)

(assert (=> b!508460 (= e!297457 e!297458)))

(declare-fun lt!232257 () (_ BitVec 64))

(assert (=> b!508460 (= lt!232257 (select (arr!15706 a!3235) j!176))))

(declare-fun lt!232258 () Unit!15604)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32652 (_ BitVec 64) (_ BitVec 32)) Unit!15604)

(assert (=> b!508460 (= lt!232258 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!232257 j!176))))

(assert (=> b!508460 (arrayContainsKey!0 a!3235 lt!232257 #b00000000000000000000000000000000)))

(declare-fun lt!232256 () Unit!15604)

(assert (=> b!508460 (= lt!232256 lt!232258)))

(declare-fun res!309379 () Bool)

(assert (=> b!508460 (= res!309379 (= (seekEntryOrOpen!0 (select (arr!15706 a!3235) j!176) a!3235 mask!3524) (Found!4173 j!176)))))

(assert (=> b!508460 (=> (not res!309379) (not e!297458))))

(declare-fun b!508461 () Bool)

(assert (=> b!508461 (= e!297457 call!31484)))

(declare-fun b!508462 () Bool)

(declare-fun e!297459 () Bool)

(assert (=> b!508462 (= e!297459 e!297457)))

(declare-fun c!59819 () Bool)

(assert (=> b!508462 (= c!59819 (validKeyInArray!0 (select (arr!15706 a!3235) j!176)))))

(declare-fun d!78749 () Bool)

(declare-fun res!309380 () Bool)

(assert (=> d!78749 (=> res!309380 e!297459)))

(assert (=> d!78749 (= res!309380 (bvsge j!176 (size!16070 a!3235)))))

(assert (=> d!78749 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!297459)))

(declare-fun b!508463 () Bool)

(assert (=> b!508463 (= e!297458 call!31484)))

(assert (= (and d!78749 (not res!309380)) b!508462))

(assert (= (and b!508462 c!59819) b!508460))

(assert (= (and b!508462 (not c!59819)) b!508461))

(assert (= (and b!508460 res!309379) b!508463))

(assert (= (or b!508463 b!508461) bm!31481))

(declare-fun m!489237 () Bool)

(assert (=> bm!31481 m!489237))

(assert (=> b!508460 m!489149))

(declare-fun m!489239 () Bool)

(assert (=> b!508460 m!489239))

(declare-fun m!489241 () Bool)

(assert (=> b!508460 m!489241))

(assert (=> b!508460 m!489149))

(assert (=> b!508460 m!489153))

(assert (=> b!508462 m!489149))

(assert (=> b!508462 m!489149))

(assert (=> b!508462 m!489151))

(assert (=> b!508366 d!78749))

(declare-fun d!78755 () Bool)

(assert (=> d!78755 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!232261 () Unit!15604)

(declare-fun choose!38 (array!32652 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15604)

(assert (=> d!78755 (= lt!232261 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!78755 (validMask!0 mask!3524)))

(assert (=> d!78755 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!232261)))

(declare-fun bs!16096 () Bool)

(assert (= bs!16096 d!78755))

(assert (=> bs!16096 m!489155))

(declare-fun m!489243 () Bool)

(assert (=> bs!16096 m!489243))

(assert (=> bs!16096 m!489167))

(assert (=> b!508366 d!78755))

(declare-fun d!78757 () Bool)

(assert (=> d!78757 (= (validKeyInArray!0 (select (arr!15706 a!3235) j!176)) (and (not (= (select (arr!15706 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15706 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!508365 d!78757))

(declare-fun d!78759 () Bool)

(declare-fun res!309385 () Bool)

(declare-fun e!297470 () Bool)

(assert (=> d!78759 (=> res!309385 e!297470)))

(assert (=> d!78759 (= res!309385 (= (select (arr!15706 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!78759 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!297470)))

(declare-fun b!508480 () Bool)

(declare-fun e!297471 () Bool)

(assert (=> b!508480 (= e!297470 e!297471)))

(declare-fun res!309386 () Bool)

(assert (=> b!508480 (=> (not res!309386) (not e!297471))))

(assert (=> b!508480 (= res!309386 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16070 a!3235)))))

(declare-fun b!508481 () Bool)

(assert (=> b!508481 (= e!297471 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!78759 (not res!309385)) b!508480))

(assert (= (and b!508480 res!309386) b!508481))

(declare-fun m!489245 () Bool)

(assert (=> d!78759 m!489245))

(declare-fun m!489247 () Bool)

(assert (=> b!508481 m!489247))

(assert (=> b!508367 d!78759))

(declare-fun d!78761 () Bool)

(assert (=> d!78761 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!45896 d!78761))

(declare-fun d!78773 () Bool)

(assert (=> d!78773 (= (array_inv!11502 a!3235) (bvsge (size!16070 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!45896 d!78773))

(declare-fun b!508530 () Bool)

(declare-fun e!297502 () Bool)

(declare-fun e!297503 () Bool)

(assert (=> b!508530 (= e!297502 e!297503)))

(declare-fun res!309397 () Bool)

(assert (=> b!508530 (=> (not res!309397) (not e!297503))))

(declare-fun e!297501 () Bool)

(assert (=> b!508530 (= res!309397 (not e!297501))))

(declare-fun res!309399 () Bool)

(assert (=> b!508530 (=> (not res!309399) (not e!297501))))

(assert (=> b!508530 (= res!309399 (validKeyInArray!0 (select (arr!15706 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!508531 () Bool)

(declare-fun e!297504 () Bool)

(declare-fun call!31489 () Bool)

(assert (=> b!508531 (= e!297504 call!31489)))

(declare-fun d!78775 () Bool)

(declare-fun res!309398 () Bool)

(assert (=> d!78775 (=> res!309398 e!297502)))

(assert (=> d!78775 (= res!309398 (bvsge #b00000000000000000000000000000000 (size!16070 a!3235)))))

(assert (=> d!78775 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9861) e!297502)))

(declare-fun bm!31486 () Bool)

(declare-fun c!59845 () Bool)

(assert (=> bm!31486 (= call!31489 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!59845 (Cons!9860 (select (arr!15706 a!3235) #b00000000000000000000000000000000) Nil!9861) Nil!9861)))))

(declare-fun b!508532 () Bool)

(declare-fun contains!2720 (List!9864 (_ BitVec 64)) Bool)

(assert (=> b!508532 (= e!297501 (contains!2720 Nil!9861 (select (arr!15706 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!508533 () Bool)

(assert (=> b!508533 (= e!297503 e!297504)))

(assert (=> b!508533 (= c!59845 (validKeyInArray!0 (select (arr!15706 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!508534 () Bool)

(assert (=> b!508534 (= e!297504 call!31489)))

(assert (= (and d!78775 (not res!309398)) b!508530))

(assert (= (and b!508530 res!309399) b!508532))

(assert (= (and b!508530 res!309397) b!508533))

(assert (= (and b!508533 c!59845) b!508531))

(assert (= (and b!508533 (not c!59845)) b!508534))

(assert (= (or b!508531 b!508534) bm!31486))

(assert (=> b!508530 m!489245))

(assert (=> b!508530 m!489245))

(declare-fun m!489307 () Bool)

(assert (=> b!508530 m!489307))

(assert (=> bm!31486 m!489245))

(declare-fun m!489309 () Bool)

(assert (=> bm!31486 m!489309))

(assert (=> b!508532 m!489245))

(assert (=> b!508532 m!489245))

(declare-fun m!489311 () Bool)

(assert (=> b!508532 m!489311))

(assert (=> b!508533 m!489245))

(assert (=> b!508533 m!489245))

(assert (=> b!508533 m!489307))

(assert (=> b!508363 d!78775))

(declare-fun d!78785 () Bool)

(assert (=> d!78785 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!508370 d!78785))

(declare-fun d!78787 () Bool)

(declare-fun lt!232297 () SeekEntryResult!4173)

(assert (=> d!78787 (and (or ((_ is Undefined!4173) lt!232297) (not ((_ is Found!4173) lt!232297)) (and (bvsge (index!18881 lt!232297) #b00000000000000000000000000000000) (bvslt (index!18881 lt!232297) (size!16070 a!3235)))) (or ((_ is Undefined!4173) lt!232297) ((_ is Found!4173) lt!232297) (not ((_ is MissingZero!4173) lt!232297)) (and (bvsge (index!18880 lt!232297) #b00000000000000000000000000000000) (bvslt (index!18880 lt!232297) (size!16070 a!3235)))) (or ((_ is Undefined!4173) lt!232297) ((_ is Found!4173) lt!232297) ((_ is MissingZero!4173) lt!232297) (not ((_ is MissingVacant!4173) lt!232297)) (and (bvsge (index!18883 lt!232297) #b00000000000000000000000000000000) (bvslt (index!18883 lt!232297) (size!16070 a!3235)))) (or ((_ is Undefined!4173) lt!232297) (ite ((_ is Found!4173) lt!232297) (= (select (arr!15706 a!3235) (index!18881 lt!232297)) k0!2280) (ite ((_ is MissingZero!4173) lt!232297) (= (select (arr!15706 a!3235) (index!18880 lt!232297)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4173) lt!232297) (= (select (arr!15706 a!3235) (index!18883 lt!232297)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!297505 () SeekEntryResult!4173)

(assert (=> d!78787 (= lt!232297 e!297505)))

(declare-fun c!59848 () Bool)

(declare-fun lt!232295 () SeekEntryResult!4173)

(assert (=> d!78787 (= c!59848 (and ((_ is Intermediate!4173) lt!232295) (undefined!4985 lt!232295)))))

(assert (=> d!78787 (= lt!232295 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!78787 (validMask!0 mask!3524)))

(assert (=> d!78787 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!232297)))

(declare-fun b!508535 () Bool)

(declare-fun c!59846 () Bool)

(declare-fun lt!232296 () (_ BitVec 64))

(assert (=> b!508535 (= c!59846 (= lt!232296 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!297506 () SeekEntryResult!4173)

(declare-fun e!297507 () SeekEntryResult!4173)

(assert (=> b!508535 (= e!297506 e!297507)))

(declare-fun b!508536 () Bool)

(assert (=> b!508536 (= e!297505 Undefined!4173)))

(declare-fun b!508537 () Bool)

(assert (=> b!508537 (= e!297506 (Found!4173 (index!18882 lt!232295)))))

(declare-fun b!508538 () Bool)

(assert (=> b!508538 (= e!297507 (seekKeyOrZeroReturnVacant!0 (x!47862 lt!232295) (index!18882 lt!232295) (index!18882 lt!232295) k0!2280 a!3235 mask!3524))))

(declare-fun b!508539 () Bool)

(assert (=> b!508539 (= e!297505 e!297506)))

(assert (=> b!508539 (= lt!232296 (select (arr!15706 a!3235) (index!18882 lt!232295)))))

(declare-fun c!59847 () Bool)

(assert (=> b!508539 (= c!59847 (= lt!232296 k0!2280))))

(declare-fun b!508540 () Bool)

(assert (=> b!508540 (= e!297507 (MissingZero!4173 (index!18882 lt!232295)))))

(assert (= (and d!78787 c!59848) b!508536))

(assert (= (and d!78787 (not c!59848)) b!508539))

(assert (= (and b!508539 c!59847) b!508537))

(assert (= (and b!508539 (not c!59847)) b!508535))

(assert (= (and b!508535 c!59846) b!508540))

(assert (= (and b!508535 (not c!59846)) b!508538))

(declare-fun m!489313 () Bool)

(assert (=> d!78787 m!489313))

(declare-fun m!489315 () Bool)

(assert (=> d!78787 m!489315))

(declare-fun m!489317 () Bool)

(assert (=> d!78787 m!489317))

(assert (=> d!78787 m!489315))

(assert (=> d!78787 m!489167))

(declare-fun m!489319 () Bool)

(assert (=> d!78787 m!489319))

(declare-fun m!489321 () Bool)

(assert (=> d!78787 m!489321))

(declare-fun m!489323 () Bool)

(assert (=> b!508538 m!489323))

(declare-fun m!489325 () Bool)

(assert (=> b!508539 m!489325))

(assert (=> b!508364 d!78787))

(declare-fun bm!31487 () Bool)

(declare-fun call!31490 () Bool)

(assert (=> bm!31487 (= call!31490 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!508541 () Bool)

(declare-fun e!297508 () Bool)

(declare-fun e!297509 () Bool)

(assert (=> b!508541 (= e!297508 e!297509)))

(declare-fun lt!232299 () (_ BitVec 64))

(assert (=> b!508541 (= lt!232299 (select (arr!15706 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!232300 () Unit!15604)

(assert (=> b!508541 (= lt!232300 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!232299 #b00000000000000000000000000000000))))

(assert (=> b!508541 (arrayContainsKey!0 a!3235 lt!232299 #b00000000000000000000000000000000)))

(declare-fun lt!232298 () Unit!15604)

(assert (=> b!508541 (= lt!232298 lt!232300)))

(declare-fun res!309400 () Bool)

(assert (=> b!508541 (= res!309400 (= (seekEntryOrOpen!0 (select (arr!15706 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4173 #b00000000000000000000000000000000)))))

(assert (=> b!508541 (=> (not res!309400) (not e!297509))))

(declare-fun b!508542 () Bool)

(assert (=> b!508542 (= e!297508 call!31490)))

(declare-fun b!508543 () Bool)

(declare-fun e!297510 () Bool)

(assert (=> b!508543 (= e!297510 e!297508)))

(declare-fun c!59849 () Bool)

(assert (=> b!508543 (= c!59849 (validKeyInArray!0 (select (arr!15706 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!78791 () Bool)

(declare-fun res!309401 () Bool)

(assert (=> d!78791 (=> res!309401 e!297510)))

(assert (=> d!78791 (= res!309401 (bvsge #b00000000000000000000000000000000 (size!16070 a!3235)))))

(assert (=> d!78791 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!297510)))

(declare-fun b!508544 () Bool)

(assert (=> b!508544 (= e!297509 call!31490)))

(assert (= (and d!78791 (not res!309401)) b!508543))

(assert (= (and b!508543 c!59849) b!508541))

(assert (= (and b!508543 (not c!59849)) b!508542))

(assert (= (and b!508541 res!309400) b!508544))

(assert (= (or b!508544 b!508542) bm!31487))

(declare-fun m!489327 () Bool)

(assert (=> bm!31487 m!489327))

(assert (=> b!508541 m!489245))

(declare-fun m!489329 () Bool)

(assert (=> b!508541 m!489329))

(declare-fun m!489331 () Bool)

(assert (=> b!508541 m!489331))

(assert (=> b!508541 m!489245))

(declare-fun m!489333 () Bool)

(assert (=> b!508541 m!489333))

(assert (=> b!508543 m!489245))

(assert (=> b!508543 m!489245))

(assert (=> b!508543 m!489307))

(assert (=> b!508369 d!78791))

(check-sat (not d!78741) (not d!78787) (not b!508462) (not b!508538) (not b!508533) (not b!508530) (not b!508433) (not b!508532) (not b!508460) (not bm!31487) (not d!78755) (not b!508481) (not b!508543) (not bm!31481) (not bm!31486) (not b!508541))
(check-sat)
