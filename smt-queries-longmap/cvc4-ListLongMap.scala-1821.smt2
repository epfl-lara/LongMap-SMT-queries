; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32786 () Bool)

(assert start!32786)

(declare-fun b!327570 () Bool)

(declare-fun res!180460 () Bool)

(declare-fun e!201437 () Bool)

(assert (=> b!327570 (=> (not res!180460) (not e!201437))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((array!16778 0))(
  ( (array!16779 (arr!7942 (Array (_ BitVec 32) (_ BitVec 64))) (size!8294 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16778)

(declare-datatypes ((SeekEntryResult!3073 0))(
  ( (MissingZero!3073 (index!14468 (_ BitVec 32))) (Found!3073 (index!14469 (_ BitVec 32))) (Intermediate!3073 (undefined!3885 Bool) (index!14470 (_ BitVec 32)) (x!32709 (_ BitVec 32))) (Undefined!3073) (MissingVacant!3073 (index!14471 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16778 (_ BitVec 32)) SeekEntryResult!3073)

(assert (=> b!327570 (= res!180460 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3073 i!1250)))))

(declare-fun b!327571 () Bool)

(declare-fun res!180465 () Bool)

(assert (=> b!327571 (=> (not res!180465) (not e!201437))))

(assert (=> b!327571 (= res!180465 (and (= (size!8294 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8294 a!3305))))))

(declare-fun b!327572 () Bool)

(declare-fun res!180463 () Bool)

(assert (=> b!327572 (=> (not res!180463) (not e!201437))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!327572 (= res!180463 (validKeyInArray!0 k!2497))))

(declare-fun b!327573 () Bool)

(declare-fun e!201438 () Bool)

(assert (=> b!327573 (= e!201437 e!201438)))

(declare-fun res!180466 () Bool)

(assert (=> b!327573 (=> (not res!180466) (not e!201438))))

(declare-fun lt!157590 () SeekEntryResult!3073)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16778 (_ BitVec 32)) SeekEntryResult!3073)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327573 (= res!180466 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157590))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!327573 (= lt!157590 (Intermediate!3073 false resIndex!58 resX!58))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun b!327574 () Bool)

(assert (=> b!327574 (= e!201438 (and (bvslt resX!58 #b01111111111111111111111111111110) (= (select (arr!7942 a!3305) index!1840) k!2497)))))

(declare-fun b!327575 () Bool)

(declare-fun res!180467 () Bool)

(assert (=> b!327575 (=> (not res!180467) (not e!201438))))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!327575 (= res!180467 (and (= (select (arr!7942 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8294 a!3305))))))

(declare-fun res!180461 () Bool)

(assert (=> start!32786 (=> (not res!180461) (not e!201437))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32786 (= res!180461 (validMask!0 mask!3777))))

(assert (=> start!32786 e!201437))

(declare-fun array_inv!5905 (array!16778) Bool)

(assert (=> start!32786 (array_inv!5905 a!3305)))

(assert (=> start!32786 true))

(declare-fun b!327576 () Bool)

(declare-fun res!180464 () Bool)

(assert (=> b!327576 (=> (not res!180464) (not e!201438))))

(assert (=> b!327576 (= res!180464 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157590))))

(declare-fun b!327577 () Bool)

(declare-fun res!180462 () Bool)

(assert (=> b!327577 (=> (not res!180462) (not e!201437))))

(declare-fun arrayContainsKey!0 (array!16778 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!327577 (= res!180462 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!327578 () Bool)

(declare-fun res!180468 () Bool)

(assert (=> b!327578 (=> (not res!180468) (not e!201437))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16778 (_ BitVec 32)) Bool)

(assert (=> b!327578 (= res!180468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32786 res!180461) b!327571))

(assert (= (and b!327571 res!180465) b!327572))

(assert (= (and b!327572 res!180463) b!327577))

(assert (= (and b!327577 res!180462) b!327570))

(assert (= (and b!327570 res!180460) b!327578))

(assert (= (and b!327578 res!180468) b!327573))

(assert (= (and b!327573 res!180466) b!327575))

(assert (= (and b!327575 res!180467) b!327576))

(assert (= (and b!327576 res!180464) b!327574))

(declare-fun m!333889 () Bool)

(assert (=> b!327573 m!333889))

(assert (=> b!327573 m!333889))

(declare-fun m!333891 () Bool)

(assert (=> b!327573 m!333891))

(declare-fun m!333893 () Bool)

(assert (=> b!327578 m!333893))

(declare-fun m!333895 () Bool)

(assert (=> b!327574 m!333895))

(declare-fun m!333897 () Bool)

(assert (=> b!327576 m!333897))

(declare-fun m!333899 () Bool)

(assert (=> b!327570 m!333899))

(declare-fun m!333901 () Bool)

(assert (=> start!32786 m!333901))

(declare-fun m!333903 () Bool)

(assert (=> start!32786 m!333903))

(declare-fun m!333905 () Bool)

(assert (=> b!327577 m!333905))

(declare-fun m!333907 () Bool)

(assert (=> b!327575 m!333907))

(declare-fun m!333909 () Bool)

(assert (=> b!327572 m!333909))

(push 1)

(assert (not b!327577))

(assert (not b!327570))

(assert (not b!327573))

(assert (not b!327572))

(assert (not start!32786))

(assert (not b!327576))

(assert (not b!327578))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!327617 () Bool)

(declare-fun e!201465 () Bool)

(declare-fun call!26104 () Bool)

(assert (=> b!327617 (= e!201465 call!26104)))

(declare-fun d!69865 () Bool)

(declare-fun res!180486 () Bool)

(declare-fun e!201467 () Bool)

(assert (=> d!69865 (=> res!180486 e!201467)))

(assert (=> d!69865 (= res!180486 (bvsge #b00000000000000000000000000000000 (size!8294 a!3305)))))

(assert (=> d!69865 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!201467)))

(declare-fun b!327618 () Bool)

(declare-fun e!201466 () Bool)

(assert (=> b!327618 (= e!201465 e!201466)))

(declare-fun lt!157611 () (_ BitVec 64))

(assert (=> b!327618 (= lt!157611 (select (arr!7942 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10178 0))(
  ( (Unit!10179) )
))
(declare-fun lt!157612 () Unit!10178)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16778 (_ BitVec 64) (_ BitVec 32)) Unit!10178)

(assert (=> b!327618 (= lt!157612 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!157611 #b00000000000000000000000000000000))))

(assert (=> b!327618 (arrayContainsKey!0 a!3305 lt!157611 #b00000000000000000000000000000000)))

(declare-fun lt!157610 () Unit!10178)

(assert (=> b!327618 (= lt!157610 lt!157612)))

(declare-fun res!180485 () Bool)

(assert (=> b!327618 (= res!180485 (= (seekEntryOrOpen!0 (select (arr!7942 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3073 #b00000000000000000000000000000000)))))

(assert (=> b!327618 (=> (not res!180485) (not e!201466))))

(declare-fun b!327619 () Bool)

(assert (=> b!327619 (= e!201466 call!26104)))

(declare-fun b!327620 () Bool)

(assert (=> b!327620 (= e!201467 e!201465)))

(declare-fun c!51198 () Bool)

(assert (=> b!327620 (= c!51198 (validKeyInArray!0 (select (arr!7942 a!3305) #b00000000000000000000000000000000)))))

(declare-fun bm!26101 () Bool)

(assert (=> bm!26101 (= call!26104 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(assert (= (and d!69865 (not res!180486)) b!327620))

(assert (= (and b!327620 c!51198) b!327618))

(assert (= (and b!327620 (not c!51198)) b!327617))

(assert (= (and b!327618 res!180485) b!327619))

(assert (= (or b!327619 b!327617) bm!26101))

(declare-fun m!333923 () Bool)

(assert (=> b!327618 m!333923))

(declare-fun m!333925 () Bool)

(assert (=> b!327618 m!333925))

(declare-fun m!333927 () Bool)

(assert (=> b!327618 m!333927))

(assert (=> b!327618 m!333923))

(declare-fun m!333929 () Bool)

(assert (=> b!327618 m!333929))

(assert (=> b!327620 m!333923))

(assert (=> b!327620 m!333923))

(declare-fun m!333931 () Bool)

(assert (=> b!327620 m!333931))

(declare-fun m!333933 () Bool)

(assert (=> bm!26101 m!333933))

(assert (=> b!327578 d!69865))

(declare-fun b!327702 () Bool)

(declare-fun e!201521 () Bool)

(declare-fun e!201522 () Bool)

(assert (=> b!327702 (= e!201521 e!201522)))

(declare-fun res!180522 () Bool)

(declare-fun lt!157648 () SeekEntryResult!3073)

(assert (=> b!327702 (= res!180522 (and (is-Intermediate!3073 lt!157648) (not (undefined!3885 lt!157648)) (bvslt (x!32709 lt!157648) #b01111111111111111111111111111110) (bvsge (x!32709 lt!157648) #b00000000000000000000000000000000) (bvsge (x!32709 lt!157648) #b00000000000000000000000000000000)))))

(assert (=> b!327702 (=> (not res!180522) (not e!201522))))

(declare-fun b!327703 () Bool)

(assert (=> b!327703 (and (bvsge (index!14470 lt!157648) #b00000000000000000000000000000000) (bvslt (index!14470 lt!157648) (size!8294 a!3305)))))

(declare-fun res!180523 () Bool)

(assert (=> b!327703 (= res!180523 (= (select (arr!7942 a!3305) (index!14470 lt!157648)) k!2497))))

(declare-fun e!201520 () Bool)

(assert (=> b!327703 (=> res!180523 e!201520)))

(assert (=> b!327703 (= e!201522 e!201520)))

(declare-fun e!201518 () SeekEntryResult!3073)

(declare-fun b!327704 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327704 (= e!201518 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!327705 () Bool)

(assert (=> b!327705 (and (bvsge (index!14470 lt!157648) #b00000000000000000000000000000000) (bvslt (index!14470 lt!157648) (size!8294 a!3305)))))

(assert (=> b!327705 (= e!201520 (= (select (arr!7942 a!3305) (index!14470 lt!157648)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!327706 () Bool)

(assert (=> b!327706 (= e!201521 (bvsge (x!32709 lt!157648) #b01111111111111111111111111111110))))

(declare-fun b!327707 () Bool)

(declare-fun e!201519 () SeekEntryResult!3073)

(assert (=> b!327707 (= e!201519 e!201518)))

(declare-fun c!51225 () Bool)

(declare-fun lt!157649 () (_ BitVec 64))

(assert (=> b!327707 (= c!51225 (or (= lt!157649 k!2497) (= (bvadd lt!157649 lt!157649) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!327708 () Bool)

(assert (=> b!327708 (and (bvsge (index!14470 lt!157648) #b00000000000000000000000000000000) (bvslt (index!14470 lt!157648) (size!8294 a!3305)))))

(declare-fun res!180524 () Bool)

(assert (=> b!327708 (= res!180524 (= (select (arr!7942 a!3305) (index!14470 lt!157648)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!327708 (=> res!180524 e!201520)))

(declare-fun b!327710 () Bool)

(assert (=> b!327710 (= e!201518 (Intermediate!3073 false (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!327709 () Bool)

(assert (=> b!327709 (= e!201519 (Intermediate!3073 true (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun d!69869 () Bool)

(assert (=> d!69869 e!201521))

(declare-fun c!51224 () Bool)

(assert (=> d!69869 (= c!51224 (and (is-Intermediate!3073 lt!157648) (undefined!3885 lt!157648)))))

(assert (=> d!69869 (= lt!157648 e!201519)))

(declare-fun c!51223 () Bool)

(assert (=> d!69869 (= c!51223 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!69869 (= lt!157649 (select (arr!7942 a!3305) (toIndex!0 k!2497 mask!3777)))))

(assert (=> d!69869 (validMask!0 mask!3777)))

(assert (=> d!69869 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157648)))

(assert (= (and d!69869 c!51223) b!327709))

(assert (= (and d!69869 (not c!51223)) b!327707))

(assert (= (and b!327707 c!51225) b!327710))

(assert (= (and b!327707 (not c!51225)) b!327704))

(assert (= (and d!69869 c!51224) b!327706))

(assert (= (and d!69869 (not c!51224)) b!327702))

(assert (= (and b!327702 res!180522) b!327703))

(assert (= (and b!327703 (not res!180523)) b!327708))

(assert (= (and b!327708 (not res!180524)) b!327705))

(declare-fun m!333971 () Bool)

(assert (=> b!327703 m!333971))

(assert (=> d!69869 m!333889))

(declare-fun m!333973 () Bool)

(assert (=> d!69869 m!333973))

(assert (=> d!69869 m!333901))

(assert (=> b!327705 m!333971))

(assert (=> b!327704 m!333889))

(declare-fun m!333975 () Bool)

(assert (=> b!327704 m!333975))

(assert (=> b!327704 m!333975))

(declare-fun m!333977 () Bool)

(assert (=> b!327704 m!333977))

(assert (=> b!327708 m!333971))

(assert (=> b!327573 d!69869))

(declare-fun d!69885 () Bool)

(declare-fun lt!157655 () (_ BitVec 32))

(declare-fun lt!157654 () (_ BitVec 32))

(assert (=> d!69885 (= lt!157655 (bvmul (bvxor lt!157654 (bvlshr lt!157654 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69885 (= lt!157654 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69885 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!180525 (let ((h!5402 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32715 (bvmul (bvxor h!5402 (bvlshr h!5402 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32715 (bvlshr x!32715 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!180525 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!180525 #b00000000000000000000000000000000))))))

(assert (=> d!69885 (= (toIndex!0 k!2497 mask!3777) (bvand (bvxor lt!157655 (bvlshr lt!157655 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!327573 d!69885))

(declare-fun d!69891 () Bool)

(declare-fun res!180530 () Bool)

(declare-fun e!201527 () Bool)

(assert (=> d!69891 (=> res!180530 e!201527)))

(assert (=> d!69891 (= res!180530 (= (select (arr!7942 a!3305) #b00000000000000000000000000000000) k!2497))))

(assert (=> d!69891 (= (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000) e!201527)))

(declare-fun b!327715 () Bool)

(declare-fun e!201528 () Bool)

(assert (=> b!327715 (= e!201527 e!201528)))

(declare-fun res!180531 () Bool)

(assert (=> b!327715 (=> (not res!180531) (not e!201528))))

(assert (=> b!327715 (= res!180531 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8294 a!3305)))))

(declare-fun b!327716 () Bool)

(assert (=> b!327716 (= e!201528 (arrayContainsKey!0 a!3305 k!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69891 (not res!180530)) b!327715))

(assert (= (and b!327715 res!180531) b!327716))

(assert (=> d!69891 m!333923))

(declare-fun m!333979 () Bool)

(assert (=> b!327716 m!333979))

(assert (=> b!327577 d!69891))

(declare-fun d!69893 () Bool)

(assert (=> d!69893 (= (validKeyInArray!0 k!2497) (and (not (= k!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!327572 d!69893))

(declare-fun b!327774 () Bool)

(declare-fun c!51255 () Bool)

(declare-fun lt!157684 () (_ BitVec 64))

(assert (=> b!327774 (= c!51255 (= lt!157684 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!201560 () SeekEntryResult!3073)

(declare-fun e!201559 () SeekEntryResult!3073)

(assert (=> b!327774 (= e!201560 e!201559)))

(declare-fun b!327775 () Bool)

(declare-fun e!201558 () SeekEntryResult!3073)

(assert (=> b!327775 (= e!201558 e!201560)))

(declare-fun lt!157683 () SeekEntryResult!3073)

(assert (=> b!327775 (= lt!157684 (select (arr!7942 a!3305) (index!14470 lt!157683)))))

(declare-fun c!51254 () Bool)

(assert (=> b!327775 (= c!51254 (= lt!157684 k!2497))))

(declare-fun b!327776 () Bool)

(assert (=> b!327776 (= e!201560 (Found!3073 (index!14470 lt!157683)))))

(declare-fun b!327777 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16778 (_ BitVec 32)) SeekEntryResult!3073)

(assert (=> b!327777 (= e!201559 (seekKeyOrZeroReturnVacant!0 (x!32709 lt!157683) (index!14470 lt!157683) (index!14470 lt!157683) k!2497 a!3305 mask!3777))))

(declare-fun d!69895 () Bool)

(declare-fun lt!157682 () SeekEntryResult!3073)

(assert (=> d!69895 (and (or (is-Undefined!3073 lt!157682) (not (is-Found!3073 lt!157682)) (and (bvsge (index!14469 lt!157682) #b00000000000000000000000000000000) (bvslt (index!14469 lt!157682) (size!8294 a!3305)))) (or (is-Undefined!3073 lt!157682) (is-Found!3073 lt!157682) (not (is-MissingZero!3073 lt!157682)) (and (bvsge (index!14468 lt!157682) #b00000000000000000000000000000000) (bvslt (index!14468 lt!157682) (size!8294 a!3305)))) (or (is-Undefined!3073 lt!157682) (is-Found!3073 lt!157682) (is-MissingZero!3073 lt!157682) (not (is-MissingVacant!3073 lt!157682)) (and (bvsge (index!14471 lt!157682) #b00000000000000000000000000000000) (bvslt (index!14471 lt!157682) (size!8294 a!3305)))) (or (is-Undefined!3073 lt!157682) (ite (is-Found!3073 lt!157682) (= (select (arr!7942 a!3305) (index!14469 lt!157682)) k!2497) (ite (is-MissingZero!3073 lt!157682) (= (select (arr!7942 a!3305) (index!14468 lt!157682)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3073 lt!157682) (= (select (arr!7942 a!3305) (index!14471 lt!157682)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

