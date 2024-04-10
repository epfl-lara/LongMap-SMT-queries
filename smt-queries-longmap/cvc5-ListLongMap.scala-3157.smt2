; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44466 () Bool)

(assert start!44466)

(declare-fun e!287298 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31621 0))(
  ( (array!31622 (arr!15201 (Array (_ BitVec 32) (_ BitVec 64))) (size!15565 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31621)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!488385 () Bool)

(declare-datatypes ((SeekEntryResult!3668 0))(
  ( (MissingZero!3668 (index!16851 (_ BitVec 32))) (Found!3668 (index!16852 (_ BitVec 32))) (Intermediate!3668 (undefined!4480 Bool) (index!16853 (_ BitVec 32)) (x!45971 (_ BitVec 32))) (Undefined!3668) (MissingVacant!3668 (index!16854 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31621 (_ BitVec 32)) SeekEntryResult!3668)

(assert (=> b!488385 (= e!287298 (= (seekEntryOrOpen!0 (select (arr!15201 a!3235) j!176) a!3235 mask!3524) (Found!3668 j!176)))))

(declare-fun b!488386 () Bool)

(declare-fun e!287300 () Bool)

(declare-fun e!287301 () Bool)

(assert (=> b!488386 (= e!287300 e!287301)))

(declare-fun res!291547 () Bool)

(assert (=> b!488386 (=> (not res!291547) (not e!287301))))

(declare-fun lt!220384 () SeekEntryResult!3668)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!488386 (= res!291547 (or (= lt!220384 (MissingZero!3668 i!1204)) (= lt!220384 (MissingVacant!3668 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!488386 (= lt!220384 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!488387 () Bool)

(declare-fun res!291551 () Bool)

(assert (=> b!488387 (=> (not res!291551) (not e!287300))))

(assert (=> b!488387 (= res!291551 (and (= (size!15565 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15565 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15565 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!488388 () Bool)

(declare-fun res!291550 () Bool)

(assert (=> b!488388 (=> (not res!291550) (not e!287300))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488388 (= res!291550 (validKeyInArray!0 (select (arr!15201 a!3235) j!176)))))

(declare-fun b!488389 () Bool)

(declare-fun res!291554 () Bool)

(assert (=> b!488389 (=> (not res!291554) (not e!287300))))

(assert (=> b!488389 (= res!291554 (validKeyInArray!0 k!2280))))

(declare-fun b!488390 () Bool)

(declare-fun res!291549 () Bool)

(assert (=> b!488390 (=> (not res!291549) (not e!287301))))

(declare-datatypes ((List!9359 0))(
  ( (Nil!9356) (Cons!9355 (h!10214 (_ BitVec 64)) (t!15587 List!9359)) )
))
(declare-fun arrayNoDuplicates!0 (array!31621 (_ BitVec 32) List!9359) Bool)

(assert (=> b!488390 (= res!291549 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9356))))

(declare-fun b!488392 () Bool)

(declare-fun res!291552 () Bool)

(assert (=> b!488392 (=> (not res!291552) (not e!287301))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31621 (_ BitVec 32)) Bool)

(assert (=> b!488392 (= res!291552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!488393 () Bool)

(declare-fun res!291546 () Bool)

(assert (=> b!488393 (=> (not res!291546) (not e!287300))))

(declare-fun arrayContainsKey!0 (array!31621 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488393 (= res!291546 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!488391 () Bool)

(assert (=> b!488391 (= e!287301 (not (or (bvslt mask!3524 #b00000000000000000000000000000000) (bvsle mask!3524 #b00111111111111111111111111111111))))))

(assert (=> b!488391 e!287298))

(declare-fun res!291553 () Bool)

(assert (=> b!488391 (=> (not res!291553) (not e!287298))))

(assert (=> b!488391 (= res!291553 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14282 0))(
  ( (Unit!14283) )
))
(declare-fun lt!220383 () Unit!14282)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31621 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14282)

(assert (=> b!488391 (= lt!220383 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!291548 () Bool)

(assert (=> start!44466 (=> (not res!291548) (not e!287300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44466 (= res!291548 (validMask!0 mask!3524))))

(assert (=> start!44466 e!287300))

(assert (=> start!44466 true))

(declare-fun array_inv!10997 (array!31621) Bool)

(assert (=> start!44466 (array_inv!10997 a!3235)))

(assert (= (and start!44466 res!291548) b!488387))

(assert (= (and b!488387 res!291551) b!488388))

(assert (= (and b!488388 res!291550) b!488389))

(assert (= (and b!488389 res!291554) b!488393))

(assert (= (and b!488393 res!291546) b!488386))

(assert (= (and b!488386 res!291547) b!488392))

(assert (= (and b!488392 res!291552) b!488390))

(assert (= (and b!488390 res!291549) b!488391))

(assert (= (and b!488391 res!291553) b!488385))

(declare-fun m!468123 () Bool)

(assert (=> b!488391 m!468123))

(declare-fun m!468125 () Bool)

(assert (=> b!488391 m!468125))

(declare-fun m!468127 () Bool)

(assert (=> b!488386 m!468127))

(declare-fun m!468129 () Bool)

(assert (=> b!488390 m!468129))

(declare-fun m!468131 () Bool)

(assert (=> b!488389 m!468131))

(declare-fun m!468133 () Bool)

(assert (=> b!488392 m!468133))

(declare-fun m!468135 () Bool)

(assert (=> start!44466 m!468135))

(declare-fun m!468137 () Bool)

(assert (=> start!44466 m!468137))

(declare-fun m!468139 () Bool)

(assert (=> b!488385 m!468139))

(assert (=> b!488385 m!468139))

(declare-fun m!468141 () Bool)

(assert (=> b!488385 m!468141))

(declare-fun m!468143 () Bool)

(assert (=> b!488393 m!468143))

(assert (=> b!488388 m!468139))

(assert (=> b!488388 m!468139))

(declare-fun m!468145 () Bool)

(assert (=> b!488388 m!468145))

(push 1)

(assert (not b!488389))

(assert (not b!488392))

(assert (not start!44466))

(assert (not b!488391))

(assert (not b!488388))

(assert (not b!488386))

(assert (not b!488393))

(assert (not b!488385))

(assert (not b!488390))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77791 () Bool)

(assert (=> d!77791 (= (validKeyInArray!0 (select (arr!15201 a!3235) j!176)) (and (not (= (select (arr!15201 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15201 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!488388 d!77791))

(declare-fun d!77793 () Bool)

(assert (=> d!77793 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!488389 d!77793))

(declare-fun b!488498 () Bool)

(declare-fun e!287365 () Bool)

(declare-fun e!287366 () Bool)

(assert (=> b!488498 (= e!287365 e!287366)))

(declare-fun lt!220414 () (_ BitVec 64))

(assert (=> b!488498 (= lt!220414 (select (arr!15201 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!220413 () Unit!14282)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31621 (_ BitVec 64) (_ BitVec 32)) Unit!14282)

(assert (=> b!488498 (= lt!220413 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!220414 #b00000000000000000000000000000000))))

(assert (=> b!488498 (arrayContainsKey!0 a!3235 lt!220414 #b00000000000000000000000000000000)))

(declare-fun lt!220412 () Unit!14282)

(assert (=> b!488498 (= lt!220412 lt!220413)))

(declare-fun res!291638 () Bool)

(assert (=> b!488498 (= res!291638 (= (seekEntryOrOpen!0 (select (arr!15201 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3668 #b00000000000000000000000000000000)))))

(assert (=> b!488498 (=> (not res!291638) (not e!287366))))

(declare-fun b!488499 () Bool)

(declare-fun call!31337 () Bool)

(assert (=> b!488499 (= e!287365 call!31337)))

(declare-fun bm!31334 () Bool)

(assert (=> bm!31334 (= call!31337 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!488500 () Bool)

(assert (=> b!488500 (= e!287366 call!31337)))

(declare-fun b!488501 () Bool)

(declare-fun e!287367 () Bool)

(assert (=> b!488501 (= e!287367 e!287365)))

(declare-fun c!58700 () Bool)

(assert (=> b!488501 (= c!58700 (validKeyInArray!0 (select (arr!15201 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!77795 () Bool)

(declare-fun res!291637 () Bool)

(assert (=> d!77795 (=> res!291637 e!287367)))

(assert (=> d!77795 (= res!291637 (bvsge #b00000000000000000000000000000000 (size!15565 a!3235)))))

(assert (=> d!77795 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!287367)))

(assert (= (and d!77795 (not res!291637)) b!488501))

(assert (= (and b!488501 c!58700) b!488498))

(assert (= (and b!488501 (not c!58700)) b!488499))

(assert (= (and b!488498 res!291638) b!488500))

(assert (= (or b!488500 b!488499) bm!31334))

(declare-fun m!468219 () Bool)

(assert (=> b!488498 m!468219))

(declare-fun m!468221 () Bool)

(assert (=> b!488498 m!468221))

(declare-fun m!468223 () Bool)

(assert (=> b!488498 m!468223))

(assert (=> b!488498 m!468219))

(declare-fun m!468225 () Bool)

(assert (=> b!488498 m!468225))

(declare-fun m!468227 () Bool)

(assert (=> bm!31334 m!468227))

(assert (=> b!488501 m!468219))

(assert (=> b!488501 m!468219))

(declare-fun m!468229 () Bool)

(assert (=> b!488501 m!468229))

(assert (=> b!488392 d!77795))

(declare-fun d!77803 () Bool)

(declare-fun res!291643 () Bool)

(declare-fun e!287372 () Bool)

(assert (=> d!77803 (=> res!291643 e!287372)))

(assert (=> d!77803 (= res!291643 (= (select (arr!15201 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!77803 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!287372)))

(declare-fun b!488506 () Bool)

(declare-fun e!287373 () Bool)

(assert (=> b!488506 (= e!287372 e!287373)))

(declare-fun res!291644 () Bool)

(assert (=> b!488506 (=> (not res!291644) (not e!287373))))

(assert (=> b!488506 (= res!291644 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15565 a!3235)))))

(declare-fun b!488507 () Bool)

(assert (=> b!488507 (= e!287373 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!77803 (not res!291643)) b!488506))

(assert (= (and b!488506 res!291644) b!488507))

(assert (=> d!77803 m!468219))

(declare-fun m!468231 () Bool)

(assert (=> b!488507 m!468231))

(assert (=> b!488393 d!77803))

(declare-fun b!488508 () Bool)

(declare-fun e!287374 () Bool)

(declare-fun e!287375 () Bool)

(assert (=> b!488508 (= e!287374 e!287375)))

(declare-fun lt!220417 () (_ BitVec 64))

(assert (=> b!488508 (= lt!220417 (select (arr!15201 a!3235) j!176))))

(declare-fun lt!220416 () Unit!14282)

(assert (=> b!488508 (= lt!220416 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!220417 j!176))))

(assert (=> b!488508 (arrayContainsKey!0 a!3235 lt!220417 #b00000000000000000000000000000000)))

(declare-fun lt!220415 () Unit!14282)

(assert (=> b!488508 (= lt!220415 lt!220416)))

(declare-fun res!291646 () Bool)

(assert (=> b!488508 (= res!291646 (= (seekEntryOrOpen!0 (select (arr!15201 a!3235) j!176) a!3235 mask!3524) (Found!3668 j!176)))))

(assert (=> b!488508 (=> (not res!291646) (not e!287375))))

(declare-fun b!488509 () Bool)

(declare-fun call!31338 () Bool)

(assert (=> b!488509 (= e!287374 call!31338)))

(declare-fun bm!31335 () Bool)

(assert (=> bm!31335 (= call!31338 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!488510 () Bool)

(assert (=> b!488510 (= e!287375 call!31338)))

(declare-fun b!488511 () Bool)

(declare-fun e!287376 () Bool)

(assert (=> b!488511 (= e!287376 e!287374)))

(declare-fun c!58701 () Bool)

(assert (=> b!488511 (= c!58701 (validKeyInArray!0 (select (arr!15201 a!3235) j!176)))))

(declare-fun d!77805 () Bool)

(declare-fun res!291645 () Bool)

(assert (=> d!77805 (=> res!291645 e!287376)))

(assert (=> d!77805 (= res!291645 (bvsge j!176 (size!15565 a!3235)))))

(assert (=> d!77805 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!287376)))

(assert (= (and d!77805 (not res!291645)) b!488511))

(assert (= (and b!488511 c!58701) b!488508))

(assert (= (and b!488511 (not c!58701)) b!488509))

(assert (= (and b!488508 res!291646) b!488510))

(assert (= (or b!488510 b!488509) bm!31335))

(assert (=> b!488508 m!468139))

(declare-fun m!468233 () Bool)

(assert (=> b!488508 m!468233))

(declare-fun m!468235 () Bool)

(assert (=> b!488508 m!468235))

(assert (=> b!488508 m!468139))

(assert (=> b!488508 m!468141))

(declare-fun m!468237 () Bool)

(assert (=> bm!31335 m!468237))

(assert (=> b!488511 m!468139))

(assert (=> b!488511 m!468139))

(assert (=> b!488511 m!468145))

(assert (=> b!488391 d!77805))

(declare-fun d!77807 () Bool)

(assert (=> d!77807 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!220420 () Unit!14282)

(declare-fun choose!38 (array!31621 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14282)

(assert (=> d!77807 (= lt!220420 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!77807 (validMask!0 mask!3524)))

(assert (=> d!77807 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!220420)))

(declare-fun bs!15568 () Bool)

(assert (= bs!15568 d!77807))

(assert (=> bs!15568 m!468123))

(declare-fun m!468239 () Bool)

(assert (=> bs!15568 m!468239))

(assert (=> bs!15568 m!468135))

(assert (=> b!488391 d!77807))

(declare-fun b!488564 () Bool)

(declare-fun c!58724 () Bool)

(declare-fun lt!220450 () (_ BitVec 64))

(assert (=> b!488564 (= c!58724 (= lt!220450 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!287409 () SeekEntryResult!3668)

(declare-fun e!287407 () SeekEntryResult!3668)

(assert (=> b!488564 (= e!287409 e!287407)))

(declare-fun b!488565 () Bool)

(declare-fun lt!220449 () SeekEntryResult!3668)

(assert (=> b!488565 (= e!287407 (MissingZero!3668 (index!16853 lt!220449)))))

(declare-fun b!488566 () Bool)

(assert (=> b!488566 (= e!287409 (Found!3668 (index!16853 lt!220449)))))

(declare-fun d!77811 () Bool)

(declare-fun lt!220448 () SeekEntryResult!3668)

(assert (=> d!77811 (and (or (is-Undefined!3668 lt!220448) (not (is-Found!3668 lt!220448)) (and (bvsge (index!16852 lt!220448) #b00000000000000000000000000000000) (bvslt (index!16852 lt!220448) (size!15565 a!3235)))) (or (is-Undefined!3668 lt!220448) (is-Found!3668 lt!220448) (not (is-MissingZero!3668 lt!220448)) (and (bvsge (index!16851 lt!220448) #b00000000000000000000000000000000) (bvslt (index!16851 lt!220448) (size!15565 a!3235)))) (or (is-Undefined!3668 lt!220448) (is-Found!3668 lt!220448) (is-MissingZero!3668 lt!220448) (not (is-MissingVacant!3668 lt!220448)) (and (bvsge (index!16854 lt!220448) #b00000000000000000000000000000000) (bvslt (index!16854 lt!220448) (size!15565 a!3235)))) (or (is-Undefined!3668 lt!220448) (ite (is-Found!3668 lt!220448) (= (select (arr!15201 a!3235) (index!16852 lt!220448)) k!2280) (ite (is-MissingZero!3668 lt!220448) (= (select (arr!15201 a!3235) (index!16851 lt!220448)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3668 lt!220448) (= (select (arr!15201 a!3235) (index!16854 lt!220448)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!287408 () SeekEntryResult!3668)

(assert (=> d!77811 (= lt!220448 e!287408)))

(declare-fun c!58726 () Bool)

(assert (=> d!77811 (= c!58726 (and (is-Intermediate!3668 lt!220449) (undefined!4480 lt!220449)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31621 (_ BitVec 32)) SeekEntryResult!3668)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!77811 (= lt!220449 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!77811 (validMask!0 mask!3524)))

(assert (=> d!77811 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!220448)))

(declare-fun b!488567 () Bool)

(assert (=> b!488567 (= e!287408 Undefined!3668)))

(declare-fun b!488568 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31621 (_ BitVec 32)) SeekEntryResult!3668)

(assert (=> b!488568 (= e!287407 (seekKeyOrZeroReturnVacant!0 (x!45971 lt!220449) (index!16853 lt!220449) (index!16853 lt!220449) k!2280 a!3235 mask!3524))))

(declare-fun b!488569 () Bool)

(assert (=> b!488569 (= e!287408 e!287409)))

(assert (=> b!488569 (= lt!220450 (select (arr!15201 a!3235) (index!16853 lt!220449)))))

(declare-fun c!58725 () Bool)

(assert (=> b!488569 (= c!58725 (= lt!220450 k!2280))))

(assert (= (and d!77811 c!58726) b!488567))

(assert (= (and d!77811 (not c!58726)) b!488569))

(assert (= (and b!488569 c!58725) b!488566))

(assert (= (and b!488569 (not c!58725)) b!488564))

(assert (= (and b!488564 c!58724) b!488565))

(assert (= (and b!488564 (not c!58724)) b!488568))

(declare-fun m!468265 () Bool)

(assert (=> d!77811 m!468265))

(declare-fun m!468267 () Bool)

(assert (=> d!77811 m!468267))

(assert (=> d!77811 m!468135))

(assert (=> d!77811 m!468265))

(declare-fun m!468269 () Bool)

(assert (=> d!77811 m!468269))

(declare-fun m!468271 () Bool)

(assert (=> d!77811 m!468271))

(declare-fun m!468273 () Bool)

(assert (=> d!77811 m!468273))

(declare-fun m!468275 () Bool)

(assert (=> b!488568 m!468275))

(declare-fun m!468277 () Bool)

(assert (=> b!488569 m!468277))

(assert (=> b!488386 d!77811))

(declare-fun b!488570 () Bool)

(declare-fun c!58727 () Bool)

(declare-fun lt!220453 () (_ BitVec 64))

(assert (=> b!488570 (= c!58727 (= lt!220453 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!287412 () SeekEntryResult!3668)

(declare-fun e!287410 () SeekEntryResult!3668)

(assert (=> b!488570 (= e!287412 e!287410)))

(declare-fun b!488571 () Bool)

(declare-fun lt!220452 () SeekEntryResult!3668)

(assert (=> b!488571 (= e!287410 (MissingZero!3668 (index!16853 lt!220452)))))

(declare-fun b!488572 () Bool)

(assert (=> b!488572 (= e!287412 (Found!3668 (index!16853 lt!220452)))))

(declare-fun d!77827 () Bool)

(declare-fun lt!220451 () SeekEntryResult!3668)

(assert (=> d!77827 (and (or (is-Undefined!3668 lt!220451) (not (is-Found!3668 lt!220451)) (and (bvsge (index!16852 lt!220451) #b00000000000000000000000000000000) (bvslt (index!16852 lt!220451) (size!15565 a!3235)))) (or (is-Undefined!3668 lt!220451) (is-Found!3668 lt!220451) (not (is-MissingZero!3668 lt!220451)) (and (bvsge (index!16851 lt!220451) #b00000000000000000000000000000000) (bvslt (index!16851 lt!220451) (size!15565 a!3235)))) (or (is-Undefined!3668 lt!220451) (is-Found!3668 lt!220451) (is-MissingZero!3668 lt!220451) (not (is-MissingVacant!3668 lt!220451)) (and (bvsge (index!16854 lt!220451) #b00000000000000000000000000000000) (bvslt (index!16854 lt!220451) (size!15565 a!3235)))) (or (is-Undefined!3668 lt!220451) (ite (is-Found!3668 lt!220451) (= (select (arr!15201 a!3235) (index!16852 lt!220451)) (select (arr!15201 a!3235) j!176)) (ite (is-MissingZero!3668 lt!220451) (= (select (arr!15201 a!3235) (index!16851 lt!220451)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3668 lt!220451) (= (select (arr!15201 a!3235) (index!16854 lt!220451)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!287411 () SeekEntryResult!3668)

(assert (=> d!77827 (= lt!220451 e!287411)))

(declare-fun c!58729 () Bool)

(assert (=> d!77827 (= c!58729 (and (is-Intermediate!3668 lt!220452) (undefined!4480 lt!220452)))))

(assert (=> d!77827 (= lt!220452 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15201 a!3235) j!176) mask!3524) (select (arr!15201 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!77827 (validMask!0 mask!3524)))

(assert (=> d!77827 (= (seekEntryOrOpen!0 (select (arr!15201 a!3235) j!176) a!3235 mask!3524) lt!220451)))

(declare-fun b!488573 () Bool)

(assert (=> b!488573 (= e!287411 Undefined!3668)))

(declare-fun b!488574 () Bool)

(assert (=> b!488574 (= e!287410 (seekKeyOrZeroReturnVacant!0 (x!45971 lt!220452) (index!16853 lt!220452) (index!16853 lt!220452) (select (arr!15201 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!488575 () Bool)

(assert (=> b!488575 (= e!287411 e!287412)))

(assert (=> b!488575 (= lt!220453 (select (arr!15201 a!3235) (index!16853 lt!220452)))))

(declare-fun c!58728 () Bool)

(assert (=> b!488575 (= c!58728 (= lt!220453 (select (arr!15201 a!3235) j!176)))))

(assert (= (and d!77827 c!58729) b!488573))

(assert (= (and d!77827 (not c!58729)) b!488575))

(assert (= (and b!488575 c!58728) b!488572))

(assert (= (and b!488575 (not c!58728)) b!488570))

(assert (= (and b!488570 c!58727) b!488571))

(assert (= (and b!488570 (not c!58727)) b!488574))

(assert (=> d!77827 m!468139))

(declare-fun m!468279 () Bool)

(assert (=> d!77827 m!468279))

(declare-fun m!468281 () Bool)

(assert (=> d!77827 m!468281))

(assert (=> d!77827 m!468135))

(assert (=> d!77827 m!468279))

(assert (=> d!77827 m!468139))

(declare-fun m!468283 () Bool)

(assert (=> d!77827 m!468283))

(declare-fun m!468285 () Bool)

(assert (=> d!77827 m!468285))

(declare-fun m!468287 () Bool)

(assert (=> d!77827 m!468287))

(assert (=> b!488574 m!468139))

(declare-fun m!468291 () Bool)

(assert (=> b!488574 m!468291))

(declare-fun m!468295 () Bool)

(assert (=> b!488575 m!468295))

(assert (=> b!488385 d!77827))

(declare-fun d!77829 () Bool)

(assert (=> d!77829 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44466 d!77829))

(declare-fun d!77839 () Bool)

(assert (=> d!77839 (= (array_inv!10997 a!3235) (bvsge (size!15565 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44466 d!77839))

(declare-fun b!488610 () Bool)

(declare-fun e!287439 () Bool)

(declare-fun e!287436 () Bool)

(assert (=> b!488610 (= e!287439 e!287436)))

(declare-fun c!58741 () Bool)

(assert (=> b!488610 (= c!58741 (validKeyInArray!0 (select (arr!15201 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!77843 () Bool)

(declare-fun res!291668 () Bool)

(declare-fun e!287438 () Bool)

(assert (=> d!77843 (=> res!291668 e!287438)))

