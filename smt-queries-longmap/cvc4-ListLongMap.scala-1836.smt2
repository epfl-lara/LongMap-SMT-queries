; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33230 () Bool)

(assert start!33230)

(declare-fun b!330650 () Bool)

(declare-fun res!182244 () Bool)

(declare-fun e!202933 () Bool)

(assert (=> b!330650 (=> (not res!182244) (not e!202933))))

(declare-datatypes ((array!16889 0))(
  ( (array!16890 (arr!7987 (Array (_ BitVec 32) (_ BitVec 64))) (size!8339 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16889)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!330650 (= res!182244 (and (= (select (arr!7987 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8339 a!3305))))))

(declare-fun b!330651 () Bool)

(declare-datatypes ((Unit!10316 0))(
  ( (Unit!10317) )
))
(declare-fun e!202932 () Unit!10316)

(declare-fun Unit!10318 () Unit!10316)

(assert (=> b!330651 (= e!202932 Unit!10318)))

(declare-fun b!330652 () Bool)

(declare-fun e!202928 () Unit!10316)

(assert (=> b!330652 (= e!202932 e!202928)))

(declare-fun c!51850 () Bool)

(assert (=> b!330652 (= c!51850 (or (= (select (arr!7987 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7987 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!330653 () Bool)

(declare-fun e!202931 () Bool)

(declare-fun e!202927 () Bool)

(assert (=> b!330653 (= e!202931 (not e!202927))))

(declare-fun res!182240 () Bool)

(assert (=> b!330653 (=> res!182240 e!202927)))

(assert (=> b!330653 (= res!182240 (not (= (select (arr!7987 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!330653 (= index!1840 resIndex!58)))

(declare-fun lt!158560 () Unit!10316)

(assert (=> b!330653 (= lt!158560 e!202932)))

(declare-fun c!51852 () Bool)

(assert (=> b!330653 (= c!51852 (not (= resIndex!58 index!1840)))))

(declare-fun b!330654 () Bool)

(declare-fun res!182241 () Bool)

(declare-fun e!202929 () Bool)

(assert (=> b!330654 (=> (not res!182241) (not e!202929))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3118 0))(
  ( (MissingZero!3118 (index!14648 (_ BitVec 32))) (Found!3118 (index!14649 (_ BitVec 32))) (Intermediate!3118 (undefined!3930 Bool) (index!14650 (_ BitVec 32)) (x!32925 (_ BitVec 32))) (Undefined!3118) (MissingVacant!3118 (index!14651 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16889 (_ BitVec 32)) SeekEntryResult!3118)

(assert (=> b!330654 (= res!182241 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3118 i!1250)))))

(declare-fun b!330655 () Bool)

(declare-fun e!202926 () Unit!10316)

(declare-fun Unit!10319 () Unit!10316)

(assert (=> b!330655 (= e!202926 Unit!10319)))

(assert (=> b!330655 false))

(declare-fun b!330656 () Bool)

(assert (=> b!330656 false))

(declare-fun Unit!10320 () Unit!10316)

(assert (=> b!330656 (= e!202928 Unit!10320)))

(declare-fun b!330657 () Bool)

(declare-fun res!182242 () Bool)

(assert (=> b!330657 (=> (not res!182242) (not e!202929))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!330657 (= res!182242 (validKeyInArray!0 k!2497))))

(declare-fun b!330658 () Bool)

(declare-fun res!182243 () Bool)

(assert (=> b!330658 (=> (not res!182243) (not e!202929))))

(declare-fun arrayContainsKey!0 (array!16889 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!330658 (= res!182243 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun res!182236 () Bool)

(assert (=> start!33230 (=> (not res!182236) (not e!202929))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33230 (= res!182236 (validMask!0 mask!3777))))

(assert (=> start!33230 e!202929))

(declare-fun array_inv!5950 (array!16889) Bool)

(assert (=> start!33230 (array_inv!5950 a!3305)))

(assert (=> start!33230 true))

(declare-fun b!330659 () Bool)

(declare-fun res!182235 () Bool)

(assert (=> b!330659 (=> (not res!182235) (not e!202929))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16889 (_ BitVec 32)) Bool)

(assert (=> b!330659 (= res!182235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!330660 () Bool)

(assert (=> b!330660 false))

(declare-fun lt!158559 () Unit!10316)

(assert (=> b!330660 (= lt!158559 e!202926)))

(declare-fun c!51851 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16889 (_ BitVec 32)) SeekEntryResult!3118)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330660 (= c!51851 (is-Intermediate!3118 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun Unit!10321 () Unit!10316)

(assert (=> b!330660 (= e!202928 Unit!10321)))

(declare-fun b!330661 () Bool)

(assert (=> b!330661 (= e!202929 e!202933)))

(declare-fun res!182239 () Bool)

(assert (=> b!330661 (=> (not res!182239) (not e!202933))))

(declare-fun lt!158562 () SeekEntryResult!3118)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330661 (= res!182239 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!158562))))

(assert (=> b!330661 (= lt!158562 (Intermediate!3118 false resIndex!58 resX!58))))

(declare-fun b!330662 () Bool)

(declare-fun res!182237 () Bool)

(assert (=> b!330662 (=> (not res!182237) (not e!202929))))

(assert (=> b!330662 (= res!182237 (and (= (size!8339 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8339 a!3305))))))

(declare-fun b!330663 () Bool)

(assert (=> b!330663 (= e!202933 e!202931)))

(declare-fun res!182238 () Bool)

(assert (=> b!330663 (=> (not res!182238) (not e!202931))))

(declare-fun lt!158561 () SeekEntryResult!3118)

(assert (=> b!330663 (= res!182238 (and (= lt!158561 lt!158562) (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7987 a!3305) index!1840) k!2497)) (= x!1490 resX!58)))))

(assert (=> b!330663 (= lt!158561 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(declare-fun b!330664 () Bool)

(declare-fun Unit!10322 () Unit!10316)

(assert (=> b!330664 (= e!202926 Unit!10322)))

(declare-fun b!330665 () Bool)

(assert (=> b!330665 (= e!202927 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 (array!16890 (store (arr!7987 a!3305) i!1250 k!2497) (size!8339 a!3305)) mask!3777) lt!158561))))

(assert (= (and start!33230 res!182236) b!330662))

(assert (= (and b!330662 res!182237) b!330657))

(assert (= (and b!330657 res!182242) b!330658))

(assert (= (and b!330658 res!182243) b!330654))

(assert (= (and b!330654 res!182241) b!330659))

(assert (= (and b!330659 res!182235) b!330661))

(assert (= (and b!330661 res!182239) b!330650))

(assert (= (and b!330650 res!182244) b!330663))

(assert (= (and b!330663 res!182238) b!330653))

(assert (= (and b!330653 c!51852) b!330652))

(assert (= (and b!330653 (not c!51852)) b!330651))

(assert (= (and b!330652 c!51850) b!330656))

(assert (= (and b!330652 (not c!51850)) b!330660))

(assert (= (and b!330660 c!51851) b!330664))

(assert (= (and b!330660 (not c!51851)) b!330655))

(assert (= (and b!330653 (not res!182240)) b!330665))

(declare-fun m!335795 () Bool)

(assert (=> b!330659 m!335795))

(declare-fun m!335797 () Bool)

(assert (=> b!330660 m!335797))

(assert (=> b!330660 m!335797))

(declare-fun m!335799 () Bool)

(assert (=> b!330660 m!335799))

(declare-fun m!335801 () Bool)

(assert (=> b!330650 m!335801))

(declare-fun m!335803 () Bool)

(assert (=> b!330658 m!335803))

(declare-fun m!335805 () Bool)

(assert (=> b!330654 m!335805))

(declare-fun m!335807 () Bool)

(assert (=> b!330661 m!335807))

(assert (=> b!330661 m!335807))

(declare-fun m!335809 () Bool)

(assert (=> b!330661 m!335809))

(declare-fun m!335811 () Bool)

(assert (=> b!330657 m!335811))

(declare-fun m!335813 () Bool)

(assert (=> b!330663 m!335813))

(declare-fun m!335815 () Bool)

(assert (=> b!330663 m!335815))

(assert (=> b!330653 m!335813))

(declare-fun m!335817 () Bool)

(assert (=> b!330665 m!335817))

(declare-fun m!335819 () Bool)

(assert (=> b!330665 m!335819))

(declare-fun m!335821 () Bool)

(assert (=> start!33230 m!335821))

(declare-fun m!335823 () Bool)

(assert (=> start!33230 m!335823))

(assert (=> b!330652 m!335813))

(push 1)

(assert (not b!330658))

(assert (not b!330660))

(assert (not b!330661))

(assert (not b!330659))

(assert (not b!330654))

(assert (not start!33230))

(assert (not b!330665))

(assert (not b!330663))

(assert (not b!330657))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!70296 () Bool)

(assert (=> d!70296 (= (validKeyInArray!0 k!2497) (and (not (= k!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!330657 d!70296))

(declare-fun b!330704 () Bool)

(declare-fun e!202961 () SeekEntryResult!3118)

(assert (=> b!330704 (= e!202961 (Intermediate!3118 true (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!330705 () Bool)

(declare-fun e!202959 () SeekEntryResult!3118)

(assert (=> b!330705 (= e!202959 (Intermediate!3118 false (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!330706 () Bool)

(assert (=> b!330706 (= e!202961 e!202959)))

(declare-fun c!51866 () Bool)

(declare-fun lt!158580 () (_ BitVec 64))

(assert (=> b!330706 (= c!51866 (or (= lt!158580 k!2497) (= (bvadd lt!158580 lt!158580) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!330707 () Bool)

(assert (=> b!330707 (= e!202959 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun d!70299 () Bool)

(declare-fun e!202960 () Bool)

(assert (=> d!70299 e!202960))

(declare-fun c!51867 () Bool)

(declare-fun lt!158581 () SeekEntryResult!3118)

(assert (=> d!70299 (= c!51867 (and (is-Intermediate!3118 lt!158581) (undefined!3930 lt!158581)))))

(assert (=> d!70299 (= lt!158581 e!202961)))

(declare-fun c!51868 () Bool)

(assert (=> d!70299 (= c!51868 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!70299 (= lt!158580 (select (arr!7987 a!3305) (toIndex!0 k!2497 mask!3777)))))

(assert (=> d!70299 (validMask!0 mask!3777)))

(assert (=> d!70299 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!158581)))

(declare-fun b!330708 () Bool)

(assert (=> b!330708 (and (bvsge (index!14650 lt!158581) #b00000000000000000000000000000000) (bvslt (index!14650 lt!158581) (size!8339 a!3305)))))

(declare-fun e!202958 () Bool)

(assert (=> b!330708 (= e!202958 (= (select (arr!7987 a!3305) (index!14650 lt!158581)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!330709 () Bool)

(assert (=> b!330709 (= e!202960 (bvsge (x!32925 lt!158581) #b01111111111111111111111111111110))))

(declare-fun b!330710 () Bool)

(assert (=> b!330710 (and (bvsge (index!14650 lt!158581) #b00000000000000000000000000000000) (bvslt (index!14650 lt!158581) (size!8339 a!3305)))))

(declare-fun res!182259 () Bool)

(assert (=> b!330710 (= res!182259 (= (select (arr!7987 a!3305) (index!14650 lt!158581)) k!2497))))

(assert (=> b!330710 (=> res!182259 e!202958)))

(declare-fun e!202957 () Bool)

(assert (=> b!330710 (= e!202957 e!202958)))

(declare-fun b!330711 () Bool)

(assert (=> b!330711 (and (bvsge (index!14650 lt!158581) #b00000000000000000000000000000000) (bvslt (index!14650 lt!158581) (size!8339 a!3305)))))

(declare-fun res!182257 () Bool)

(assert (=> b!330711 (= res!182257 (= (select (arr!7987 a!3305) (index!14650 lt!158581)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!330711 (=> res!182257 e!202958)))

(declare-fun b!330712 () Bool)

(assert (=> b!330712 (= e!202960 e!202957)))

(declare-fun res!182258 () Bool)

(assert (=> b!330712 (= res!182258 (and (is-Intermediate!3118 lt!158581) (not (undefined!3930 lt!158581)) (bvslt (x!32925 lt!158581) #b01111111111111111111111111111110) (bvsge (x!32925 lt!158581) #b00000000000000000000000000000000) (bvsge (x!32925 lt!158581) #b00000000000000000000000000000000)))))

(assert (=> b!330712 (=> (not res!182258) (not e!202957))))

(assert (= (and d!70299 c!51868) b!330704))

(assert (= (and d!70299 (not c!51868)) b!330706))

(assert (= (and b!330706 c!51866) b!330705))

(assert (= (and b!330706 (not c!51866)) b!330707))

(assert (= (and d!70299 c!51867) b!330709))

(assert (= (and d!70299 (not c!51867)) b!330712))

(assert (= (and b!330712 res!182258) b!330710))

(assert (= (and b!330710 (not res!182259)) b!330711))

(assert (= (and b!330711 (not res!182257)) b!330708))

(declare-fun m!335837 () Bool)

(assert (=> b!330710 m!335837))

(assert (=> b!330708 m!335837))

(assert (=> b!330711 m!335837))

(assert (=> b!330707 m!335807))

(declare-fun m!335839 () Bool)

(assert (=> b!330707 m!335839))

(assert (=> b!330707 m!335839))

(declare-fun m!335841 () Bool)

(assert (=> b!330707 m!335841))

(assert (=> d!70299 m!335807))

(declare-fun m!335843 () Bool)

(assert (=> d!70299 m!335843))

(assert (=> d!70299 m!335821))

(assert (=> b!330661 d!70299))

(declare-fun d!70309 () Bool)

(declare-fun lt!158587 () (_ BitVec 32))

(declare-fun lt!158586 () (_ BitVec 32))

(assert (=> d!70309 (= lt!158587 (bvmul (bvxor lt!158586 (bvlshr lt!158586 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!70309 (= lt!158586 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!70309 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!182264 (let ((h!5421 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32928 (bvmul (bvxor h!5421 (bvlshr h!5421 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32928 (bvlshr x!32928 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!182264 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!182264 #b00000000000000000000000000000000))))))

(assert (=> d!70309 (= (toIndex!0 k!2497 mask!3777) (bvand (bvxor lt!158587 (bvlshr lt!158587 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!330661 d!70309))

(declare-fun b!330723 () Bool)

(declare-fun e!202972 () SeekEntryResult!3118)

(assert (=> b!330723 (= e!202972 (Intermediate!3118 true index!1840 x!1490))))

(declare-fun b!330724 () Bool)

(declare-fun e!202970 () SeekEntryResult!3118)

(assert (=> b!330724 (= e!202970 (Intermediate!3118 false index!1840 x!1490))))

(declare-fun b!330725 () Bool)

(assert (=> b!330725 (= e!202972 e!202970)))

(declare-fun c!51871 () Bool)

(declare-fun lt!158588 () (_ BitVec 64))

(assert (=> b!330725 (= c!51871 (or (= lt!158588 k!2497) (= (bvadd lt!158588 lt!158588) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!330726 () Bool)

(assert (=> b!330726 (= e!202970 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 (array!16890 (store (arr!7987 a!3305) i!1250 k!2497) (size!8339 a!3305)) mask!3777))))

(declare-fun d!70311 () Bool)

(declare-fun e!202971 () Bool)

(assert (=> d!70311 e!202971))

(declare-fun c!51872 () Bool)

(declare-fun lt!158589 () SeekEntryResult!3118)

(assert (=> d!70311 (= c!51872 (and (is-Intermediate!3118 lt!158589) (undefined!3930 lt!158589)))))

(assert (=> d!70311 (= lt!158589 e!202972)))

(declare-fun c!51873 () Bool)

(assert (=> d!70311 (= c!51873 (bvsge x!1490 #b01111111111111111111111111111110))))

(assert (=> d!70311 (= lt!158588 (select (arr!7987 (array!16890 (store (arr!7987 a!3305) i!1250 k!2497) (size!8339 a!3305))) index!1840))))

(assert (=> d!70311 (validMask!0 mask!3777)))

(assert (=> d!70311 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 (array!16890 (store (arr!7987 a!3305) i!1250 k!2497) (size!8339 a!3305)) mask!3777) lt!158589)))

(declare-fun b!330727 () Bool)

(assert (=> b!330727 (and (bvsge (index!14650 lt!158589) #b00000000000000000000000000000000) (bvslt (index!14650 lt!158589) (size!8339 (array!16890 (store (arr!7987 a!3305) i!1250 k!2497) (size!8339 a!3305)))))))

(declare-fun e!202969 () Bool)

(assert (=> b!330727 (= e!202969 (= (select (arr!7987 (array!16890 (store (arr!7987 a!3305) i!1250 k!2497) (size!8339 a!3305))) (index!14650 lt!158589)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!330728 () Bool)

(assert (=> b!330728 (= e!202971 (bvsge (x!32925 lt!158589) #b01111111111111111111111111111110))))

(declare-fun b!330729 () Bool)

(assert (=> b!330729 (and (bvsge (index!14650 lt!158589) #b00000000000000000000000000000000) (bvslt (index!14650 lt!158589) (size!8339 (array!16890 (store (arr!7987 a!3305) i!1250 k!2497) (size!8339 a!3305)))))))

(declare-fun res!182269 () Bool)

(assert (=> b!330729 (= res!182269 (= (select (arr!7987 (array!16890 (store (arr!7987 a!3305) i!1250 k!2497) (size!8339 a!3305))) (index!14650 lt!158589)) k!2497))))

(assert (=> b!330729 (=> res!182269 e!202969)))

(declare-fun e!202968 () Bool)

(assert (=> b!330729 (= e!202968 e!202969)))

(declare-fun b!330730 () Bool)

(assert (=> b!330730 (and (bvsge (index!14650 lt!158589) #b00000000000000000000000000000000) (bvslt (index!14650 lt!158589) (size!8339 (array!16890 (store (arr!7987 a!3305) i!1250 k!2497) (size!8339 a!3305)))))))

(declare-fun res!182267 () Bool)

(assert (=> b!330730 (= res!182267 (= (select (arr!7987 (array!16890 (store (arr!7987 a!3305) i!1250 k!2497) (size!8339 a!3305))) (index!14650 lt!158589)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!330730 (=> res!182267 e!202969)))

(declare-fun b!330731 () Bool)

(assert (=> b!330731 (= e!202971 e!202968)))

(declare-fun res!182268 () Bool)

(assert (=> b!330731 (= res!182268 (and (is-Intermediate!3118 lt!158589) (not (undefined!3930 lt!158589)) (bvslt (x!32925 lt!158589) #b01111111111111111111111111111110) (bvsge (x!32925 lt!158589) #b00000000000000000000000000000000) (bvsge (x!32925 lt!158589) x!1490)))))

(assert (=> b!330731 (=> (not res!182268) (not e!202968))))

(assert (= (and d!70311 c!51873) b!330723))

(assert (= (and d!70311 (not c!51873)) b!330725))

(assert (= (and b!330725 c!51871) b!330724))

(assert (= (and b!330725 (not c!51871)) b!330726))

(assert (= (and d!70311 c!51872) b!330728))

(assert (= (and d!70311 (not c!51872)) b!330731))

(assert (= (and b!330731 res!182268) b!330729))

(assert (= (and b!330729 (not res!182269)) b!330730))

(assert (= (and b!330730 (not res!182267)) b!330727))

(declare-fun m!335845 () Bool)

(assert (=> b!330729 m!335845))

(assert (=> b!330727 m!335845))

(assert (=> b!330730 m!335845))

(assert (=> b!330726 m!335797))

(assert (=> b!330726 m!335797))

(declare-fun m!335847 () Bool)

(assert (=> b!330726 m!335847))

(declare-fun m!335849 () Bool)

(assert (=> d!70311 m!335849))

(assert (=> d!70311 m!335821))

(assert (=> b!330665 d!70311))

(declare-fun e!202982 () SeekEntryResult!3118)

(declare-fun b!330741 () Bool)

(assert (=> b!330741 (= e!202982 (Intermediate!3118 true (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!330742 () Bool)

(declare-fun e!202980 () SeekEntryResult!3118)

(assert (=> b!330742 (= e!202980 (Intermediate!3118 false (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!330743 () Bool)

(assert (=> b!330743 (= e!202982 e!202980)))

(declare-fun c!51877 () Bool)

(declare-fun lt!158592 () (_ BitVec 64))

(assert (=> b!330743 (= c!51877 (or (= lt!158592 k!2497) (= (bvadd lt!158592 lt!158592) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!330744 () Bool)

(assert (=> b!330744 (= e!202980 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun d!70313 () Bool)

(declare-fun e!202981 () Bool)

(assert (=> d!70313 e!202981))

(declare-fun c!51878 () Bool)

(declare-fun lt!158593 () SeekEntryResult!3118)

(assert (=> d!70313 (= c!51878 (and (is-Intermediate!3118 lt!158593) (undefined!3930 lt!158593)))))

(assert (=> d!70313 (= lt!158593 e!202982)))

(declare-fun c!51879 () Bool)

(assert (=> d!70313 (= c!51879 (bvsge (bvadd #b00000000000000000000000000000001 x!1490) #b01111111111111111111111111111110))))

(assert (=> d!70313 (= lt!158592 (select (arr!7987 a!3305) (nextIndex!0 index!1840 x!1490 mask!3777)))))

(assert (=> d!70313 (validMask!0 mask!3777)))

(assert (=> d!70313 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777) lt!158593)))

(declare-fun b!330745 () Bool)

(assert (=> b!330745 (and (bvsge (index!14650 lt!158593) #b00000000000000000000000000000000) (bvslt (index!14650 lt!158593) (size!8339 a!3305)))))

(declare-fun e!202979 () Bool)

(assert (=> b!330745 (= e!202979 (= (select (arr!7987 a!3305) (index!14650 lt!158593)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!330746 () Bool)

(assert (=> b!330746 (= e!202981 (bvsge (x!32925 lt!158593) #b01111111111111111111111111111110))))

(declare-fun b!330747 () Bool)

(assert (=> b!330747 (and (bvsge (index!14650 lt!158593) #b00000000000000000000000000000000) (bvslt (index!14650 lt!158593) (size!8339 a!3305)))))

(declare-fun res!182275 () Bool)

(assert (=> b!330747 (= res!182275 (= (select (arr!7987 a!3305) (index!14650 lt!158593)) k!2497))))

(assert (=> b!330747 (=> res!182275 e!202979)))

(declare-fun e!202978 () Bool)

(assert (=> b!330747 (= e!202978 e!202979)))

(declare-fun b!330748 () Bool)

(assert (=> b!330748 (and (bvsge (index!14650 lt!158593) #b00000000000000000000000000000000) (bvslt (index!14650 lt!158593) (size!8339 a!3305)))))

(declare-fun res!182273 () Bool)

(assert (=> b!330748 (= res!182273 (= (select (arr!7987 a!3305) (index!14650 lt!158593)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!330748 (=> res!182273 e!202979)))

(declare-fun b!330749 () Bool)

(assert (=> b!330749 (= e!202981 e!202978)))

(declare-fun res!182274 () Bool)

(assert (=> b!330749 (= res!182274 (and (is-Intermediate!3118 lt!158593) (not (undefined!3930 lt!158593)) (bvslt (x!32925 lt!158593) #b01111111111111111111111111111110) (bvsge (x!32925 lt!158593) #b00000000000000000000000000000000) (bvsge (x!32925 lt!158593) (bvadd #b00000000000000000000000000000001 x!1490))))))

(assert (=> b!330749 (=> (not res!182274) (not e!202978))))

(assert (= (and d!70313 c!51879) b!330741))

(assert (= (and d!70313 (not c!51879)) b!330743))

(assert (= (and b!330743 c!51877) b!330742))

(assert (= (and b!330743 (not c!51877)) b!330744))

(assert (= (and d!70313 c!51878) b!330746))

(assert (= (and d!70313 (not c!51878)) b!330749))

(assert (= (and b!330749 res!182274) b!330747))

(assert (= (and b!330747 (not res!182275)) b!330748))

(assert (= (and b!330748 (not res!182273)) b!330745))

(declare-fun m!335859 () Bool)

(assert (=> b!330747 m!335859))

(assert (=> b!330745 m!335859))

(assert (=> b!330748 m!335859))

(assert (=> b!330744 m!335797))

(declare-fun m!335861 () Bool)

(assert (=> b!330744 m!335861))

(assert (=> b!330744 m!335861))

(declare-fun m!335863 () Bool)

(assert (=> b!330744 m!335863))

(assert (=> d!70313 m!335797))

(declare-fun m!335865 () Bool)

(assert (=> d!70313 m!335865))

(assert (=> d!70313 m!335821))

(assert (=> b!330660 d!70313))

(declare-fun d!70317 () Bool)

(declare-fun lt!158596 () (_ BitVec 32))

(assert (=> d!70317 (and (bvsge lt!158596 #b00000000000000000000000000000000) (bvslt lt!158596 (bvadd mask!3777 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70317 (= lt!158596 (choose!52 index!1840 x!1490 mask!3777))))

(assert (=> d!70317 (validMask!0 mask!3777)))

(assert (=> d!70317 (= (nextIndex!0 index!1840 x!1490 mask!3777) lt!158596)))

(declare-fun bs!11432 () Bool)

(assert (= bs!11432 d!70317))

(declare-fun m!335867 () Bool)

(assert (=> bs!11432 m!335867))

(assert (=> bs!11432 m!335821))

(assert (=> b!330660 d!70317))

(declare-fun d!70319 () Bool)

(assert (=> d!70319 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!33230 d!70319))

(declare-fun d!70325 () Bool)

(assert (=> d!70325 (= (array_inv!5950 a!3305) (bvsge (size!8339 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!33230 d!70325))

(declare-fun b!330798 () Bool)

(declare-fun e!203014 () Bool)

(declare-fun call!26167 () Bool)

(assert (=> b!330798 (= e!203014 call!26167)))

(declare-fun bm!26164 () Bool)

(assert (=> bm!26164 (= call!26167 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun d!70327 () Bool)

(declare-fun res!182298 () Bool)

(declare-fun e!203015 () Bool)

(assert (=> d!70327 (=> res!182298 e!203015)))

(assert (=> d!70327 (= res!182298 (bvsge #b00000000000000000000000000000000 (size!8339 a!3305)))))

(assert (=> d!70327 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!203015)))

(declare-fun b!330799 () Bool)

(assert (=> b!330799 (= e!203015 e!203014)))

(declare-fun c!51894 () Bool)

(assert (=> b!330799 (= c!51894 (validKeyInArray!0 (select (arr!7987 a!3305) #b00000000000000000000000000000000)))))

(declare-fun b!330800 () Bool)

(declare-fun e!203013 () Bool)

(assert (=> b!330800 (= e!203013 call!26167)))

(declare-fun b!330801 () Bool)

(assert (=> b!330801 (= e!203014 e!203013)))

(declare-fun lt!158627 () (_ BitVec 64))

(assert (=> b!330801 (= lt!158627 (select (arr!7987 a!3305) #b00000000000000000000000000000000))))

(declare-fun lt!158626 () Unit!10316)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16889 (_ BitVec 64) (_ BitVec 32)) Unit!10316)

(assert (=> b!330801 (= lt!158626 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!158627 #b00000000000000000000000000000000))))

(assert (=> b!330801 (arrayContainsKey!0 a!3305 lt!158627 #b00000000000000000000000000000000)))

(declare-fun lt!158628 () Unit!10316)

(assert (=> b!330801 (= lt!158628 lt!158626)))

(declare-fun res!182299 () Bool)

(assert (=> b!330801 (= res!182299 (= (seekEntryOrOpen!0 (select (arr!7987 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3118 #b00000000000000000000000000000000)))))

(assert (=> b!330801 (=> (not res!182299) (not e!203013))))

(assert (= (and d!70327 (not res!182298)) b!330799))

(assert (= (and b!330799 c!51894) b!330801))

(assert (= (and b!330799 (not c!51894)) b!330798))

(assert (= (and b!330801 res!182299) b!330800))

(assert (= (or b!330800 b!330798) bm!26164))

(declare-fun m!335887 () Bool)

(assert (=> bm!26164 m!335887))

(declare-fun m!335889 () Bool)

(assert (=> b!330799 m!335889))

(assert (=> b!330799 m!335889))

(declare-fun m!335891 () Bool)

(assert (=> b!330799 m!335891))

(assert (=> b!330801 m!335889))

(declare-fun m!335893 () Bool)

(assert (=> b!330801 m!335893))

(declare-fun m!335895 () Bool)

(assert (=> b!330801 m!335895))

(assert (=> b!330801 m!335889))

(declare-fun m!335897 () Bool)

(assert (=> b!330801 m!335897))

(assert (=> b!330659 d!70327))

(declare-fun b!330876 () Bool)

(declare-fun e!203059 () SeekEntryResult!3118)

(declare-fun lt!158664 () SeekEntryResult!3118)

(assert (=> b!330876 (= e!203059 (Found!3118 (index!14650 lt!158664)))))

(declare-fun d!70335 () Bool)

(declare-fun lt!158665 () SeekEntryResult!3118)

(assert (=> d!70335 (and (or (is-Undefined!3118 lt!158665) (not (is-Found!3118 lt!158665)) (and (bvsge (index!14649 lt!158665) #b00000000000000000000000000000000) (bvslt (index!14649 lt!158665) (size!8339 a!3305)))) (or (is-Undefined!3118 lt!158665) (is-Found!3118 lt!158665) (not (is-MissingZero!3118 lt!158665)) (and (bvsge (index!14648 lt!158665) #b00000000000000000000000000000000) (bvslt (index!14648 lt!158665) (size!8339 a!3305)))) (or (is-Undefined!3118 lt!158665) (is-Found!3118 lt!158665) (is-MissingZero!3118 lt!158665) (not (is-MissingVacant!3118 lt!158665)) (and (bvsge (index!14651 lt!158665) #b00000000000000000000000000000000) (bvslt (index!14651 lt!158665) (size!8339 a!3305)))) (or (is-Undefined!3118 lt!158665) (ite (is-Found!3118 lt!158665) (= (select (arr!7987 a!3305) (index!14649 lt!158665)) k!2497) (ite (is-MissingZero!3118 lt!158665) (= (select (arr!7987 a!3305) (index!14648 lt!158665)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3118 lt!158665) (= (select (arr!7987 a!3305) (index!14651 lt!158665)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!203060 () SeekEntryResult!3118)

(assert (=> d!70335 (= lt!158665 e!203060)))

(declare-fun c!51925 () Bool)

(assert (=> d!70335 (= c!51925 (and (is-Intermediate!3118 lt!158664) (undefined!3930 lt!158664)))))

(assert (=> d!70335 (= lt!158664 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(assert (=> d!70335 (validMask!0 mask!3777)))

(assert (=> d!70335 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) lt!158665)))

(declare-fun b!330877 () Bool)

(declare-fun c!51927 () Bool)

(declare-fun lt!158663 () (_ BitVec 64))

(assert (=> b!330877 (= c!51927 (= lt!158663 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!203058 () SeekEntryResult!3118)

(assert (=> b!330877 (= e!203059 e!203058)))

(declare-fun b!330878 () Bool)

(assert (=> b!330878 (= e!203060 e!203059)))

(assert (=> b!330878 (= lt!158663 (select (arr!7987 a!3305) (index!14650 lt!158664)))))

(declare-fun c!51926 () Bool)

(assert (=> b!330878 (= c!51926 (= lt!158663 k!2497))))

(declare-fun b!330879 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16889 (_ BitVec 32)) SeekEntryResult!3118)

(assert (=> b!330879 (= e!203058 (seekKeyOrZeroReturnVacant!0 (x!32925 lt!158664) (index!14650 lt!158664) (index!14650 lt!158664) k!2497 a!3305 mask!3777))))

(declare-fun b!330880 () Bool)

(assert (=> b!330880 (= e!203058 (MissingZero!3118 (index!14650 lt!158664)))))

(declare-fun b!330881 () Bool)

(assert (=> b!330881 (= e!203060 Undefined!3118)))

(assert (= (and d!70335 c!51925) b!330881))

(assert (= (and d!70335 (not c!51925)) b!330878))

(assert (= (and b!330878 c!51926) b!330876))

(assert (= (and b!330878 (not c!51926)) b!330877))

(assert (= (and b!330877 c!51927) b!330880))

(assert (= (and b!330877 (not c!51927)) b!330879))

(assert (=> d!70335 m!335821))

(declare-fun m!335931 () Bool)

(assert (=> d!70335 m!335931))

(declare-fun m!335935 () Bool)

(assert (=> d!70335 m!335935))

(assert (=> d!70335 m!335807))

(assert (=> d!70335 m!335809))

(declare-fun m!335937 () Bool)

(assert (=> d!70335 m!335937))

(assert (=> d!70335 m!335807))

(declare-fun m!335939 () Bool)

(assert (=> b!330878 m!335939))

(declare-fun m!335941 () Bool)

(assert (=> b!330879 m!335941))

(assert (=> b!330654 d!70335))

(declare-fun b!330882 () Bool)

(declare-fun e!203065 () SeekEntryResult!3118)

(assert (=> b!330882 (= e!203065 (Intermediate!3118 true index!1840 x!1490))))

(declare-fun b!330883 () Bool)

(declare-fun e!203063 () SeekEntryResult!3118)

(assert (=> b!330883 (= e!203063 (Intermediate!3118 false index!1840 x!1490))))

(declare-fun b!330884 () Bool)

(assert (=> b!330884 (= e!203065 e!203063)))

(declare-fun c!51928 () Bool)

(declare-fun lt!158666 () (_ BitVec 64))

(assert (=> b!330884 (= c!51928 (or (= lt!158666 k!2497) (= (bvadd lt!158666 lt!158666) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!330885 () Bool)

(assert (=> b!330885 (= e!203063 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun d!70349 () Bool)

(declare-fun e!203064 () Bool)

(assert (=> d!70349 e!203064))

(declare-fun c!51929 () Bool)

(declare-fun lt!158667 () SeekEntryResult!3118)

(assert (=> d!70349 (= c!51929 (and (is-Intermediate!3118 lt!158667) (undefined!3930 lt!158667)))))

(assert (=> d!70349 (= lt!158667 e!203065)))

(declare-fun c!51930 () Bool)

(assert (=> d!70349 (= c!51930 (bvsge x!1490 #b01111111111111111111111111111110))))

(assert (=> d!70349 (= lt!158666 (select (arr!7987 a!3305) index!1840))))

(assert (=> d!70349 (validMask!0 mask!3777)))

(assert (=> d!70349 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!158667)))

(declare-fun b!330886 () Bool)

(assert (=> b!330886 (and (bvsge (index!14650 lt!158667) #b00000000000000000000000000000000) (bvslt (index!14650 lt!158667) (size!8339 a!3305)))))

(declare-fun e!203062 () Bool)

(assert (=> b!330886 (= e!203062 (= (select (arr!7987 a!3305) (index!14650 lt!158667)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!330887 () Bool)

(assert (=> b!330887 (= e!203064 (bvsge (x!32925 lt!158667) #b01111111111111111111111111111110))))

(declare-fun b!330888 () Bool)

(assert (=> b!330888 (and (bvsge (index!14650 lt!158667) #b00000000000000000000000000000000) (bvslt (index!14650 lt!158667) (size!8339 a!3305)))))

(declare-fun res!182316 () Bool)

(assert (=> b!330888 (= res!182316 (= (select (arr!7987 a!3305) (index!14650 lt!158667)) k!2497))))

(assert (=> b!330888 (=> res!182316 e!203062)))

(declare-fun e!203061 () Bool)

(assert (=> b!330888 (= e!203061 e!203062)))

(declare-fun b!330889 () Bool)

(assert (=> b!330889 (and (bvsge (index!14650 lt!158667) #b00000000000000000000000000000000) (bvslt (index!14650 lt!158667) (size!8339 a!3305)))))

(declare-fun res!182314 () Bool)

(assert (=> b!330889 (= res!182314 (= (select (arr!7987 a!3305) (index!14650 lt!158667)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!330889 (=> res!182314 e!203062)))

(declare-fun b!330890 () Bool)

(assert (=> b!330890 (= e!203064 e!203061)))

(declare-fun res!182315 () Bool)

(assert (=> b!330890 (= res!182315 (and (is-Intermediate!3118 lt!158667) (not (undefined!3930 lt!158667)) (bvslt (x!32925 lt!158667) #b01111111111111111111111111111110) (bvsge (x!32925 lt!158667) #b00000000000000000000000000000000) (bvsge (x!32925 lt!158667) x!1490)))))

(assert (=> b!330890 (=> (not res!182315) (not e!203061))))

(assert (= (and d!70349 c!51930) b!330882))

(assert (= (and d!70349 (not c!51930)) b!330884))

(assert (= (and b!330884 c!51928) b!330883))

(assert (= (and b!330884 (not c!51928)) b!330885))

(assert (= (and d!70349 c!51929) b!330887))

(assert (= (and d!70349 (not c!51929)) b!330890))

(assert (= (and b!330890 res!182315) b!330888))

(assert (= (and b!330888 (not res!182316)) b!330889))

(assert (= (and b!330889 (not res!182314)) b!330886))

(declare-fun m!335943 () Bool)

(assert (=> b!330888 m!335943))

(assert (=> b!330886 m!335943))

(assert (=> b!330889 m!335943))

(assert (=> b!330885 m!335797))

(assert (=> b!330885 m!335797))

(declare-fun m!335945 () Bool)

(assert (=> b!330885 m!335945))

(assert (=> d!70349 m!335813))

(assert (=> d!70349 m!335821))

(assert (=> b!330663 d!70349))

(declare-fun d!70353 () Bool)

(declare-fun res!182321 () Bool)

(declare-fun e!203073 () Bool)

(assert (=> d!70353 (=> res!182321 e!203073)))

(assert (=> d!70353 (= res!182321 (= (select (arr!7987 a!3305) #b00000000000000000000000000000000) k!2497))))

(assert (=> d!70353 (= (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000) e!203073)))

(declare-fun b!330901 () Bool)

(declare-fun e!203074 () Bool)

(assert (=> b!330901 (= e!203073 e!203074)))

(declare-fun res!182322 () Bool)

(assert (=> b!330901 (=> (not res!182322) (not e!203074))))

(assert (=> b!330901 (= res!182322 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8339 a!3305)))))

(declare-fun b!330902 () Bool)

(assert (=> b!330902 (= e!203074 (arrayContainsKey!0 a!3305 k!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70353 (not res!182321)) b!330901))

(assert (= (and b!330901 res!182322) b!330902))

(assert (=> d!70353 m!335889))

(declare-fun m!335957 () Bool)

(assert (=> b!330902 m!335957))

(assert (=> b!330658 d!70353))

(push 1)

