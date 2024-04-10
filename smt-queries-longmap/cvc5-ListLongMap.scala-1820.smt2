; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32728 () Bool)

(assert start!32728)

(declare-fun res!180252 () Bool)

(declare-fun e!201262 () Bool)

(assert (=> start!32728 (=> (not res!180252) (not e!201262))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32728 (= res!180252 (validMask!0 mask!3777))))

(assert (=> start!32728 e!201262))

(declare-datatypes ((array!16765 0))(
  ( (array!16766 (arr!7937 (Array (_ BitVec 32) (_ BitVec 64))) (size!8289 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16765)

(declare-fun array_inv!5900 (array!16765) Bool)

(assert (=> start!32728 (array_inv!5900 a!3305)))

(assert (=> start!32728 true))

(declare-fun b!327219 () Bool)

(declare-fun res!180255 () Bool)

(assert (=> b!327219 (=> (not res!180255) (not e!201262))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16765 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!327219 (= res!180255 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!327220 () Bool)

(declare-fun res!180251 () Bool)

(assert (=> b!327220 (=> (not res!180251) (not e!201262))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!327220 (= res!180251 (validKeyInArray!0 k!2497))))

(declare-fun b!327221 () Bool)

(declare-fun e!201260 () Bool)

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!327221 (= e!201260 (bvsge resX!58 #b01111111111111111111111111111110))))

(declare-fun b!327222 () Bool)

(declare-fun res!180253 () Bool)

(assert (=> b!327222 (=> (not res!180253) (not e!201262))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3068 0))(
  ( (MissingZero!3068 (index!14448 (_ BitVec 32))) (Found!3068 (index!14449 (_ BitVec 32))) (Intermediate!3068 (undefined!3880 Bool) (index!14450 (_ BitVec 32)) (x!32690 (_ BitVec 32))) (Undefined!3068) (MissingVacant!3068 (index!14451 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16765 (_ BitVec 32)) SeekEntryResult!3068)

(assert (=> b!327222 (= res!180253 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3068 i!1250)))))

(declare-fun b!327223 () Bool)

(declare-fun res!180250 () Bool)

(assert (=> b!327223 (=> (not res!180250) (not e!201260))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun lt!157479 () SeekEntryResult!3068)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16765 (_ BitVec 32)) SeekEntryResult!3068)

(assert (=> b!327223 (= res!180250 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157479))))

(declare-fun b!327224 () Bool)

(declare-fun res!180257 () Bool)

(assert (=> b!327224 (=> (not res!180257) (not e!201262))))

(assert (=> b!327224 (= res!180257 (and (= (size!8289 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8289 a!3305))))))

(declare-fun b!327225 () Bool)

(assert (=> b!327225 (= e!201262 e!201260)))

(declare-fun res!180258 () Bool)

(assert (=> b!327225 (=> (not res!180258) (not e!201260))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327225 (= res!180258 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157479))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!327225 (= lt!157479 (Intermediate!3068 false resIndex!58 resX!58))))

(declare-fun b!327226 () Bool)

(declare-fun res!180256 () Bool)

(assert (=> b!327226 (=> (not res!180256) (not e!201260))))

(assert (=> b!327226 (= res!180256 (and (= (select (arr!7937 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8289 a!3305))))))

(declare-fun b!327227 () Bool)

(declare-fun res!180254 () Bool)

(assert (=> b!327227 (=> (not res!180254) (not e!201262))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16765 (_ BitVec 32)) Bool)

(assert (=> b!327227 (= res!180254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32728 res!180252) b!327224))

(assert (= (and b!327224 res!180257) b!327220))

(assert (= (and b!327220 res!180251) b!327219))

(assert (= (and b!327219 res!180255) b!327222))

(assert (= (and b!327222 res!180253) b!327227))

(assert (= (and b!327227 res!180254) b!327225))

(assert (= (and b!327225 res!180258) b!327226))

(assert (= (and b!327226 res!180256) b!327223))

(assert (= (and b!327223 res!180250) b!327221))

(declare-fun m!333665 () Bool)

(assert (=> b!327227 m!333665))

(declare-fun m!333667 () Bool)

(assert (=> b!327219 m!333667))

(declare-fun m!333669 () Bool)

(assert (=> b!327223 m!333669))

(declare-fun m!333671 () Bool)

(assert (=> start!32728 m!333671))

(declare-fun m!333673 () Bool)

(assert (=> start!32728 m!333673))

(declare-fun m!333675 () Bool)

(assert (=> b!327225 m!333675))

(assert (=> b!327225 m!333675))

(declare-fun m!333677 () Bool)

(assert (=> b!327225 m!333677))

(declare-fun m!333679 () Bool)

(assert (=> b!327222 m!333679))

(declare-fun m!333681 () Bool)

(assert (=> b!327220 m!333681))

(declare-fun m!333683 () Bool)

(assert (=> b!327226 m!333683))

(push 1)

(assert (not b!327219))

(assert (not start!32728))

(assert (not b!327220))

(assert (not b!327223))

(assert (not b!327227))

(assert (not b!327225))

(assert (not b!327222))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!69807 () Bool)

(declare-fun lt!157508 () SeekEntryResult!3068)

(assert (=> d!69807 (and (or (is-Undefined!3068 lt!157508) (not (is-Found!3068 lt!157508)) (and (bvsge (index!14449 lt!157508) #b00000000000000000000000000000000) (bvslt (index!14449 lt!157508) (size!8289 a!3305)))) (or (is-Undefined!3068 lt!157508) (is-Found!3068 lt!157508) (not (is-MissingZero!3068 lt!157508)) (and (bvsge (index!14448 lt!157508) #b00000000000000000000000000000000) (bvslt (index!14448 lt!157508) (size!8289 a!3305)))) (or (is-Undefined!3068 lt!157508) (is-Found!3068 lt!157508) (is-MissingZero!3068 lt!157508) (not (is-MissingVacant!3068 lt!157508)) (and (bvsge (index!14451 lt!157508) #b00000000000000000000000000000000) (bvslt (index!14451 lt!157508) (size!8289 a!3305)))) (or (is-Undefined!3068 lt!157508) (ite (is-Found!3068 lt!157508) (= (select (arr!7937 a!3305) (index!14449 lt!157508)) k!2497) (ite (is-MissingZero!3068 lt!157508) (= (select (arr!7937 a!3305) (index!14448 lt!157508)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3068 lt!157508) (= (select (arr!7937 a!3305) (index!14451 lt!157508)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!201319 () SeekEntryResult!3068)

(assert (=> d!69807 (= lt!157508 e!201319)))

(declare-fun c!51134 () Bool)

(declare-fun lt!157509 () SeekEntryResult!3068)

(assert (=> d!69807 (= c!51134 (and (is-Intermediate!3068 lt!157509) (undefined!3880 lt!157509)))))

(assert (=> d!69807 (= lt!157509 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(assert (=> d!69807 (validMask!0 mask!3777)))

(assert (=> d!69807 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) lt!157508)))

(declare-fun b!327339 () Bool)

(declare-fun c!51135 () Bool)

(declare-fun lt!157507 () (_ BitVec 64))

(assert (=> b!327339 (= c!51135 (= lt!157507 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!201318 () SeekEntryResult!3068)

(declare-fun e!201317 () SeekEntryResult!3068)

(assert (=> b!327339 (= e!201318 e!201317)))

(declare-fun b!327340 () Bool)

(assert (=> b!327340 (= e!201317 (MissingZero!3068 (index!14450 lt!157509)))))

(declare-fun b!327341 () Bool)

(assert (=> b!327341 (= e!201319 Undefined!3068)))

(declare-fun b!327342 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16765 (_ BitVec 32)) SeekEntryResult!3068)

(assert (=> b!327342 (= e!201317 (seekKeyOrZeroReturnVacant!0 (x!32690 lt!157509) (index!14450 lt!157509) (index!14450 lt!157509) k!2497 a!3305 mask!3777))))

(declare-fun b!327343 () Bool)

(assert (=> b!327343 (= e!201319 e!201318)))

(assert (=> b!327343 (= lt!157507 (select (arr!7937 a!3305) (index!14450 lt!157509)))))

(declare-fun c!51133 () Bool)

(assert (=> b!327343 (= c!51133 (= lt!157507 k!2497))))

(declare-fun b!327344 () Bool)

(assert (=> b!327344 (= e!201318 (Found!3068 (index!14450 lt!157509)))))

(assert (= (and d!69807 c!51134) b!327341))

(assert (= (and d!69807 (not c!51134)) b!327343))

(assert (= (and b!327343 c!51133) b!327344))

(assert (= (and b!327343 (not c!51133)) b!327339))

(assert (= (and b!327339 c!51135) b!327340))

(assert (= (and b!327339 (not c!51135)) b!327342))

(declare-fun m!333749 () Bool)

(assert (=> d!69807 m!333749))

(assert (=> d!69807 m!333671))

(declare-fun m!333751 () Bool)

(assert (=> d!69807 m!333751))

(assert (=> d!69807 m!333675))

(assert (=> d!69807 m!333677))

(assert (=> d!69807 m!333675))

(declare-fun m!333753 () Bool)

(assert (=> d!69807 m!333753))

(declare-fun m!333755 () Bool)

(assert (=> b!327342 m!333755))

(declare-fun m!333757 () Bool)

(assert (=> b!327343 m!333757))

(assert (=> b!327222 d!69807))

(declare-fun b!327371 () Bool)

(declare-fun e!201337 () Bool)

(declare-fun call!26095 () Bool)

(assert (=> b!327371 (= e!201337 call!26095)))

(declare-fun b!327372 () Bool)

(declare-fun e!201338 () Bool)

(declare-fun e!201336 () Bool)

(assert (=> b!327372 (= e!201338 e!201336)))

(declare-fun c!51144 () Bool)

(assert (=> b!327372 (= c!51144 (validKeyInArray!0 (select (arr!7937 a!3305) #b00000000000000000000000000000000)))))

(declare-fun b!327373 () Bool)

(assert (=> b!327373 (= e!201336 call!26095)))

(declare-fun d!69813 () Bool)

(declare-fun res!180345 () Bool)

(assert (=> d!69813 (=> res!180345 e!201338)))

(assert (=> d!69813 (= res!180345 (bvsge #b00000000000000000000000000000000 (size!8289 a!3305)))))

(assert (=> d!69813 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!201338)))

(declare-fun bm!26092 () Bool)

(assert (=> bm!26092 (= call!26095 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!327374 () Bool)

(assert (=> b!327374 (= e!201336 e!201337)))

(declare-fun lt!157521 () (_ BitVec 64))

(assert (=> b!327374 (= lt!157521 (select (arr!7937 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10172 0))(
  ( (Unit!10173) )
))
(declare-fun lt!157520 () Unit!10172)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16765 (_ BitVec 64) (_ BitVec 32)) Unit!10172)

(assert (=> b!327374 (= lt!157520 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!157521 #b00000000000000000000000000000000))))

(assert (=> b!327374 (arrayContainsKey!0 a!3305 lt!157521 #b00000000000000000000000000000000)))

(declare-fun lt!157522 () Unit!10172)

(assert (=> b!327374 (= lt!157522 lt!157520)))

(declare-fun res!180344 () Bool)

(assert (=> b!327374 (= res!180344 (= (seekEntryOrOpen!0 (select (arr!7937 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3068 #b00000000000000000000000000000000)))))

(assert (=> b!327374 (=> (not res!180344) (not e!201337))))

(assert (= (and d!69813 (not res!180345)) b!327372))

(assert (= (and b!327372 c!51144) b!327374))

(assert (= (and b!327372 (not c!51144)) b!327373))

(assert (= (and b!327374 res!180344) b!327371))

(assert (= (or b!327371 b!327373) bm!26092))

(declare-fun m!333759 () Bool)

(assert (=> b!327372 m!333759))

(assert (=> b!327372 m!333759))

(declare-fun m!333761 () Bool)

(assert (=> b!327372 m!333761))

(declare-fun m!333763 () Bool)

(assert (=> bm!26092 m!333763))

(assert (=> b!327374 m!333759))

(declare-fun m!333765 () Bool)

(assert (=> b!327374 m!333765))

(declare-fun m!333767 () Bool)

(assert (=> b!327374 m!333767))

(assert (=> b!327374 m!333759))

(declare-fun m!333769 () Bool)

(assert (=> b!327374 m!333769))

(assert (=> b!327227 d!69813))

(declare-fun d!69815 () Bool)

(assert (=> d!69815 (= (validKeyInArray!0 k!2497) (and (not (= k!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!327220 d!69815))

(declare-fun d!69817 () Bool)

(assert (=> d!69817 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32728 d!69817))

(declare-fun d!69823 () Bool)

(assert (=> d!69823 (= (array_inv!5900 a!3305) (bvsge (size!8289 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32728 d!69823))

(declare-fun b!327456 () Bool)

(declare-fun e!201391 () Bool)

(declare-fun e!201389 () Bool)

(assert (=> b!327456 (= e!201391 e!201389)))

(declare-fun res!180376 () Bool)

(declare-fun lt!157564 () SeekEntryResult!3068)

(assert (=> b!327456 (= res!180376 (and (is-Intermediate!3068 lt!157564) (not (undefined!3880 lt!157564)) (bvslt (x!32690 lt!157564) #b01111111111111111111111111111110) (bvsge (x!32690 lt!157564) #b00000000000000000000000000000000) (bvsge (x!32690 lt!157564) #b00000000000000000000000000000000)))))

(assert (=> b!327456 (=> (not res!180376) (not e!201389))))

(declare-fun d!69827 () Bool)

(assert (=> d!69827 e!201391))

(declare-fun c!51173 () Bool)

(assert (=> d!69827 (= c!51173 (and (is-Intermediate!3068 lt!157564) (undefined!3880 lt!157564)))))

(declare-fun e!201390 () SeekEntryResult!3068)

(assert (=> d!69827 (= lt!157564 e!201390)))

(declare-fun c!51172 () Bool)

(assert (=> d!69827 (= c!51172 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!157563 () (_ BitVec 64))

(assert (=> d!69827 (= lt!157563 (select (arr!7937 a!3305) (toIndex!0 k!2497 mask!3777)))))

(assert (=> d!69827 (validMask!0 mask!3777)))

(assert (=> d!69827 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157564)))

(declare-fun b!327457 () Bool)

(declare-fun e!201388 () SeekEntryResult!3068)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327457 (= e!201388 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!327458 () Bool)

(assert (=> b!327458 (and (bvsge (index!14450 lt!157564) #b00000000000000000000000000000000) (bvslt (index!14450 lt!157564) (size!8289 a!3305)))))

(declare-fun res!180375 () Bool)

(assert (=> b!327458 (= res!180375 (= (select (arr!7937 a!3305) (index!14450 lt!157564)) k!2497))))

(declare-fun e!201392 () Bool)

(assert (=> b!327458 (=> res!180375 e!201392)))

(assert (=> b!327458 (= e!201389 e!201392)))

(declare-fun b!327459 () Bool)

(assert (=> b!327459 (= e!201390 e!201388)))

(declare-fun c!51174 () Bool)

(assert (=> b!327459 (= c!51174 (or (= lt!157563 k!2497) (= (bvadd lt!157563 lt!157563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!327460 () Bool)

(assert (=> b!327460 (= e!201388 (Intermediate!3068 false (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!327461 () Bool)

(assert (=> b!327461 (= e!201391 (bvsge (x!32690 lt!157564) #b01111111111111111111111111111110))))

(declare-fun b!327462 () Bool)

(assert (=> b!327462 (and (bvsge (index!14450 lt!157564) #b00000000000000000000000000000000) (bvslt (index!14450 lt!157564) (size!8289 a!3305)))))

(assert (=> b!327462 (= e!201392 (= (select (arr!7937 a!3305) (index!14450 lt!157564)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!327463 () Bool)

(assert (=> b!327463 (= e!201390 (Intermediate!3068 true (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!327464 () Bool)

(assert (=> b!327464 (and (bvsge (index!14450 lt!157564) #b00000000000000000000000000000000) (bvslt (index!14450 lt!157564) (size!8289 a!3305)))))

(declare-fun res!180377 () Bool)

(assert (=> b!327464 (= res!180377 (= (select (arr!7937 a!3305) (index!14450 lt!157564)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!327464 (=> res!180377 e!201392)))

(assert (= (and d!69827 c!51172) b!327463))

(assert (= (and d!69827 (not c!51172)) b!327459))

(assert (= (and b!327459 c!51174) b!327460))

(assert (= (and b!327459 (not c!51174)) b!327457))

(assert (= (and d!69827 c!51173) b!327461))

(assert (= (and d!69827 (not c!51173)) b!327456))

(assert (= (and b!327456 res!180376) b!327458))

(assert (= (and b!327458 (not res!180375)) b!327464))

(assert (= (and b!327464 (not res!180377)) b!327462))

(declare-fun m!333817 () Bool)

(assert (=> b!327458 m!333817))

(assert (=> d!69827 m!333675))

(declare-fun m!333819 () Bool)

(assert (=> d!69827 m!333819))

(assert (=> d!69827 m!333671))

(assert (=> b!327457 m!333675))

(declare-fun m!333821 () Bool)

(assert (=> b!327457 m!333821))

(assert (=> b!327457 m!333821))

(declare-fun m!333823 () Bool)

(assert (=> b!327457 m!333823))

(assert (=> b!327462 m!333817))

(assert (=> b!327464 m!333817))

(assert (=> b!327225 d!69827))

(declare-fun d!69847 () Bool)

(declare-fun lt!157576 () (_ BitVec 32))

(declare-fun lt!157575 () (_ BitVec 32))

(assert (=> d!69847 (= lt!157576 (bvmul (bvxor lt!157575 (bvlshr lt!157575 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69847 (= lt!157575 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69847 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!180378 (let ((h!5399 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32698 (bvmul (bvxor h!5399 (bvlshr h!5399 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32698 (bvlshr x!32698 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!180378 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!180378 #b00000000000000000000000000000000))))))

(assert (=> d!69847 (= (toIndex!0 k!2497 mask!3777) (bvand (bvxor lt!157576 (bvlshr lt!157576 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!327225 d!69847))

(declare-fun d!69849 () Bool)

(declare-fun res!180383 () Bool)

(declare-fun e!201403 () Bool)

(assert (=> d!69849 (=> res!180383 e!201403)))

(assert (=> d!69849 (= res!180383 (= (select (arr!7937 a!3305) #b00000000000000000000000000000000) k!2497))))

(assert (=> d!69849 (= (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000) e!201403)))

(declare-fun b!327481 () Bool)

(declare-fun e!201404 () Bool)

(assert (=> b!327481 (= e!201403 e!201404)))

(declare-fun res!180384 () Bool)

(assert (=> b!327481 (=> (not res!180384) (not e!201404))))

(assert (=> b!327481 (= res!180384 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8289 a!3305)))))

(declare-fun b!327482 () Bool)

(assert (=> b!327482 (= e!201404 (arrayContainsKey!0 a!3305 k!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69849 (not res!180383)) b!327481))

(assert (= (and b!327481 res!180384) b!327482))

(assert (=> d!69849 m!333759))

(declare-fun m!333825 () Bool)

(assert (=> b!327482 m!333825))

(assert (=> b!327219 d!69849))

(declare-fun b!327483 () Bool)

(declare-fun e!201408 () Bool)

(declare-fun e!201406 () Bool)

(assert (=> b!327483 (= e!201408 e!201406)))

(declare-fun res!180386 () Bool)

(declare-fun lt!157578 () SeekEntryResult!3068)

(assert (=> b!327483 (= res!180386 (and (is-Intermediate!3068 lt!157578) (not (undefined!3880 lt!157578)) (bvslt (x!32690 lt!157578) #b01111111111111111111111111111110) (bvsge (x!32690 lt!157578) #b00000000000000000000000000000000) (bvsge (x!32690 lt!157578) x!1490)))))

(assert (=> b!327483 (=> (not res!180386) (not e!201406))))

(declare-fun d!69853 () Bool)

(assert (=> d!69853 e!201408))

(declare-fun c!51182 () Bool)

(assert (=> d!69853 (= c!51182 (and (is-Intermediate!3068 lt!157578) (undefined!3880 lt!157578)))))

(declare-fun e!201407 () SeekEntryResult!3068)

(assert (=> d!69853 (= lt!157578 e!201407)))

(declare-fun c!51181 () Bool)

(assert (=> d!69853 (= c!51181 (bvsge x!1490 #b01111111111111111111111111111110))))

(declare-fun lt!157577 () (_ BitVec 64))

(assert (=> d!69853 (= lt!157577 (select (arr!7937 a!3305) index!1840))))

(assert (=> d!69853 (validMask!0 mask!3777)))

(assert (=> d!69853 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157578)))

(declare-fun e!201405 () SeekEntryResult!3068)

(declare-fun b!327484 () Bool)

(assert (=> b!327484 (= e!201405 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!327485 () Bool)

(assert (=> b!327485 (and (bvsge (index!14450 lt!157578) #b00000000000000000000000000000000) (bvslt (index!14450 lt!157578) (size!8289 a!3305)))))

(declare-fun res!180385 () Bool)

(assert (=> b!327485 (= res!180385 (= (select (arr!7937 a!3305) (index!14450 lt!157578)) k!2497))))

(declare-fun e!201409 () Bool)

(assert (=> b!327485 (=> res!180385 e!201409)))

(assert (=> b!327485 (= e!201406 e!201409)))

(declare-fun b!327486 () Bool)

(assert (=> b!327486 (= e!201407 e!201405)))

(declare-fun c!51183 () Bool)

(assert (=> b!327486 (= c!51183 (or (= lt!157577 k!2497) (= (bvadd lt!157577 lt!157577) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!327487 () Bool)

(assert (=> b!327487 (= e!201405 (Intermediate!3068 false index!1840 x!1490))))

(declare-fun b!327488 () Bool)

(assert (=> b!327488 (= e!201408 (bvsge (x!32690 lt!157578) #b01111111111111111111111111111110))))

(declare-fun b!327489 () Bool)

(assert (=> b!327489 (and (bvsge (index!14450 lt!157578) #b00000000000000000000000000000000) (bvslt (index!14450 lt!157578) (size!8289 a!3305)))))

(assert (=> b!327489 (= e!201409 (= (select (arr!7937 a!3305) (index!14450 lt!157578)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!327490 () Bool)

(assert (=> b!327490 (= e!201407 (Intermediate!3068 true index!1840 x!1490))))

(declare-fun b!327491 () Bool)

(assert (=> b!327491 (and (bvsge (index!14450 lt!157578) #b00000000000000000000000000000000) (bvslt (index!14450 lt!157578) (size!8289 a!3305)))))

(declare-fun res!180387 () Bool)

(assert (=> b!327491 (= res!180387 (= (select (arr!7937 a!3305) (index!14450 lt!157578)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!327491 (=> res!180387 e!201409)))

(assert (= (and d!69853 c!51181) b!327490))

(assert (= (and d!69853 (not c!51181)) b!327486))

(assert (= (and b!327486 c!51183) b!327487))

(assert (= (and b!327486 (not c!51183)) b!327484))

(assert (= (and d!69853 c!51182) b!327488))

(assert (= (and d!69853 (not c!51182)) b!327483))

(assert (= (and b!327483 res!180386) b!327485))

(assert (= (and b!327485 (not res!180385)) b!327491))

(assert (= (and b!327491 (not res!180387)) b!327489))

(declare-fun m!333827 () Bool)

(assert (=> b!327485 m!333827))

(declare-fun m!333829 () Bool)

(assert (=> d!69853 m!333829))

(assert (=> d!69853 m!333671))

(declare-fun m!333831 () Bool)

(assert (=> b!327484 m!333831))

(assert (=> b!327484 m!333831))

(declare-fun m!333833 () Bool)

(assert (=> b!327484 m!333833))

(assert (=> b!327489 m!333827))

(assert (=> b!327491 m!333827))

(assert (=> b!327223 d!69853))

(push 1)

