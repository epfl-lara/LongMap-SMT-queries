; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33024 () Bool)

(assert start!33024)

(declare-fun b!328933 () Bool)

(declare-fun res!181266 () Bool)

(declare-fun e!202111 () Bool)

(assert (=> b!328933 (=> (not res!181266) (not e!202111))))

(declare-datatypes ((array!16830 0))(
  ( (array!16831 (arr!7962 (Array (_ BitVec 32) (_ BitVec 64))) (size!8314 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16830)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16830 (_ BitVec 32)) Bool)

(assert (=> b!328933 (= res!181266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!328934 () Bool)

(declare-fun res!181261 () Bool)

(assert (=> b!328934 (=> (not res!181261) (not e!202111))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!328934 (= res!181261 (validKeyInArray!0 k0!2497))))

(declare-fun b!328935 () Bool)

(declare-fun res!181259 () Bool)

(assert (=> b!328935 (=> (not res!181259) (not e!202111))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!328935 (= res!181259 (and (= (size!8314 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8314 a!3305))))))

(declare-fun b!328936 () Bool)

(declare-fun res!181263 () Bool)

(assert (=> b!328936 (=> (not res!181263) (not e!202111))))

(declare-datatypes ((SeekEntryResult!3093 0))(
  ( (MissingZero!3093 (index!14548 (_ BitVec 32))) (Found!3093 (index!14549 (_ BitVec 32))) (Intermediate!3093 (undefined!3905 Bool) (index!14550 (_ BitVec 32)) (x!32812 (_ BitVec 32))) (Undefined!3093) (MissingVacant!3093 (index!14551 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16830 (_ BitVec 32)) SeekEntryResult!3093)

(assert (=> b!328936 (= res!181263 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3093 i!1250)))))

(declare-fun lt!158049 () SeekEntryResult!3093)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun e!202110 () Bool)

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun b!328937 () Bool)

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun lt!158048 () SeekEntryResult!3093)

(assert (=> b!328937 (= e!202110 (and (= lt!158048 lt!158049) (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7962 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (or (= (select (arr!7962 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7962 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!158048 (Intermediate!3093 false index!1840 resX!58)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16830 (_ BitVec 32)) SeekEntryResult!3093)

(assert (=> b!328937 (= lt!158048 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777))))

(declare-fun res!181264 () Bool)

(assert (=> start!33024 (=> (not res!181264) (not e!202111))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33024 (= res!181264 (validMask!0 mask!3777))))

(assert (=> start!33024 e!202111))

(declare-fun array_inv!5925 (array!16830) Bool)

(assert (=> start!33024 (array_inv!5925 a!3305)))

(assert (=> start!33024 true))

(declare-fun b!328938 () Bool)

(declare-fun res!181265 () Bool)

(assert (=> b!328938 (=> (not res!181265) (not e!202111))))

(declare-fun arrayContainsKey!0 (array!16830 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!328938 (= res!181265 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!328939 () Bool)

(assert (=> b!328939 (= e!202111 e!202110)))

(declare-fun res!181260 () Bool)

(assert (=> b!328939 (=> (not res!181260) (not e!202110))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!328939 (= res!181260 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158049))))

(assert (=> b!328939 (= lt!158049 (Intermediate!3093 false resIndex!58 resX!58))))

(declare-fun b!328940 () Bool)

(declare-fun res!181262 () Bool)

(assert (=> b!328940 (=> (not res!181262) (not e!202110))))

(assert (=> b!328940 (= res!181262 (and (= (select (arr!7962 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8314 a!3305))))))

(assert (= (and start!33024 res!181264) b!328935))

(assert (= (and b!328935 res!181259) b!328934))

(assert (= (and b!328934 res!181261) b!328938))

(assert (= (and b!328938 res!181265) b!328936))

(assert (= (and b!328936 res!181263) b!328933))

(assert (= (and b!328933 res!181266) b!328939))

(assert (= (and b!328939 res!181260) b!328940))

(assert (= (and b!328940 res!181262) b!328937))

(declare-fun m!334767 () Bool)

(assert (=> b!328939 m!334767))

(assert (=> b!328939 m!334767))

(declare-fun m!334769 () Bool)

(assert (=> b!328939 m!334769))

(declare-fun m!334771 () Bool)

(assert (=> b!328938 m!334771))

(declare-fun m!334773 () Bool)

(assert (=> b!328940 m!334773))

(declare-fun m!334775 () Bool)

(assert (=> start!33024 m!334775))

(declare-fun m!334777 () Bool)

(assert (=> start!33024 m!334777))

(declare-fun m!334779 () Bool)

(assert (=> b!328937 m!334779))

(declare-fun m!334781 () Bool)

(assert (=> b!328937 m!334781))

(declare-fun m!334783 () Bool)

(assert (=> b!328936 m!334783))

(declare-fun m!334785 () Bool)

(assert (=> b!328933 m!334785))

(declare-fun m!334787 () Bool)

(assert (=> b!328934 m!334787))

(check-sat (not b!328939) (not start!33024) (not b!328936) (not b!328937) (not b!328938) (not b!328933) (not b!328934))
(check-sat)
(get-model)

(declare-fun b!328977 () Bool)

(declare-fun e!202128 () SeekEntryResult!3093)

(assert (=> b!328977 (= e!202128 Undefined!3093)))

(declare-fun b!328978 () Bool)

(declare-fun e!202127 () SeekEntryResult!3093)

(assert (=> b!328978 (= e!202128 e!202127)))

(declare-fun lt!158064 () (_ BitVec 64))

(declare-fun lt!158062 () SeekEntryResult!3093)

(assert (=> b!328978 (= lt!158064 (select (arr!7962 a!3305) (index!14550 lt!158062)))))

(declare-fun c!51482 () Bool)

(assert (=> b!328978 (= c!51482 (= lt!158064 k0!2497))))

(declare-fun b!328979 () Bool)

(declare-fun e!202129 () SeekEntryResult!3093)

(assert (=> b!328979 (= e!202129 (MissingZero!3093 (index!14550 lt!158062)))))

(declare-fun b!328980 () Bool)

(assert (=> b!328980 (= e!202127 (Found!3093 (index!14550 lt!158062)))))

(declare-fun b!328981 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16830 (_ BitVec 32)) SeekEntryResult!3093)

(assert (=> b!328981 (= e!202129 (seekKeyOrZeroReturnVacant!0 (x!32812 lt!158062) (index!14550 lt!158062) (index!14550 lt!158062) k0!2497 a!3305 mask!3777))))

(declare-fun d!70093 () Bool)

(declare-fun lt!158063 () SeekEntryResult!3093)

(get-info :version)

(assert (=> d!70093 (and (or ((_ is Undefined!3093) lt!158063) (not ((_ is Found!3093) lt!158063)) (and (bvsge (index!14549 lt!158063) #b00000000000000000000000000000000) (bvslt (index!14549 lt!158063) (size!8314 a!3305)))) (or ((_ is Undefined!3093) lt!158063) ((_ is Found!3093) lt!158063) (not ((_ is MissingZero!3093) lt!158063)) (and (bvsge (index!14548 lt!158063) #b00000000000000000000000000000000) (bvslt (index!14548 lt!158063) (size!8314 a!3305)))) (or ((_ is Undefined!3093) lt!158063) ((_ is Found!3093) lt!158063) ((_ is MissingZero!3093) lt!158063) (not ((_ is MissingVacant!3093) lt!158063)) (and (bvsge (index!14551 lt!158063) #b00000000000000000000000000000000) (bvslt (index!14551 lt!158063) (size!8314 a!3305)))) (or ((_ is Undefined!3093) lt!158063) (ite ((_ is Found!3093) lt!158063) (= (select (arr!7962 a!3305) (index!14549 lt!158063)) k0!2497) (ite ((_ is MissingZero!3093) lt!158063) (= (select (arr!7962 a!3305) (index!14548 lt!158063)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3093) lt!158063) (= (select (arr!7962 a!3305) (index!14551 lt!158063)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70093 (= lt!158063 e!202128)))

(declare-fun c!51481 () Bool)

(assert (=> d!70093 (= c!51481 (and ((_ is Intermediate!3093) lt!158062) (undefined!3905 lt!158062)))))

(assert (=> d!70093 (= lt!158062 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!70093 (validMask!0 mask!3777)))

(assert (=> d!70093 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!158063)))

(declare-fun b!328982 () Bool)

(declare-fun c!51483 () Bool)

(assert (=> b!328982 (= c!51483 (= lt!158064 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!328982 (= e!202127 e!202129)))

(assert (= (and d!70093 c!51481) b!328977))

(assert (= (and d!70093 (not c!51481)) b!328978))

(assert (= (and b!328978 c!51482) b!328980))

(assert (= (and b!328978 (not c!51482)) b!328982))

(assert (= (and b!328982 c!51483) b!328979))

(assert (= (and b!328982 (not c!51483)) b!328981))

(declare-fun m!334811 () Bool)

(assert (=> b!328978 m!334811))

(declare-fun m!334813 () Bool)

(assert (=> b!328981 m!334813))

(assert (=> d!70093 m!334767))

(declare-fun m!334815 () Bool)

(assert (=> d!70093 m!334815))

(declare-fun m!334817 () Bool)

(assert (=> d!70093 m!334817))

(declare-fun m!334819 () Bool)

(assert (=> d!70093 m!334819))

(assert (=> d!70093 m!334767))

(assert (=> d!70093 m!334769))

(assert (=> d!70093 m!334775))

(assert (=> b!328936 d!70093))

(declare-fun d!70097 () Bool)

(assert (=> d!70097 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!33024 d!70097))

(declare-fun d!70103 () Bool)

(assert (=> d!70103 (= (array_inv!5925 a!3305) (bvsge (size!8314 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!33024 d!70103))

(declare-fun d!70105 () Bool)

(assert (=> d!70105 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!328934 d!70105))

(declare-fun b!329064 () Bool)

(declare-fun e!202175 () Bool)

(declare-fun lt!158089 () SeekEntryResult!3093)

(assert (=> b!329064 (= e!202175 (bvsge (x!32812 lt!158089) #b01111111111111111111111111111110))))

(declare-fun b!329065 () Bool)

(declare-fun e!202176 () SeekEntryResult!3093)

(declare-fun e!202179 () SeekEntryResult!3093)

(assert (=> b!329065 (= e!202176 e!202179)))

(declare-fun c!51513 () Bool)

(declare-fun lt!158090 () (_ BitVec 64))

(assert (=> b!329065 (= c!51513 (or (= lt!158090 k0!2497) (= (bvadd lt!158090 lt!158090) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!329066 () Bool)

(assert (=> b!329066 (and (bvsge (index!14550 lt!158089) #b00000000000000000000000000000000) (bvslt (index!14550 lt!158089) (size!8314 a!3305)))))

(declare-fun res!181320 () Bool)

(assert (=> b!329066 (= res!181320 (= (select (arr!7962 a!3305) (index!14550 lt!158089)) k0!2497))))

(declare-fun e!202177 () Bool)

(assert (=> b!329066 (=> res!181320 e!202177)))

(declare-fun e!202178 () Bool)

(assert (=> b!329066 (= e!202178 e!202177)))

(declare-fun b!329067 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!329067 (= e!202179 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun d!70107 () Bool)

(assert (=> d!70107 e!202175))

(declare-fun c!51512 () Bool)

(assert (=> d!70107 (= c!51512 (and ((_ is Intermediate!3093) lt!158089) (undefined!3905 lt!158089)))))

(assert (=> d!70107 (= lt!158089 e!202176)))

(declare-fun c!51511 () Bool)

(assert (=> d!70107 (= c!51511 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!70107 (= lt!158090 (select (arr!7962 a!3305) (toIndex!0 k0!2497 mask!3777)))))

(assert (=> d!70107 (validMask!0 mask!3777)))

(assert (=> d!70107 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158089)))

(declare-fun b!329068 () Bool)

(assert (=> b!329068 (= e!202175 e!202178)))

(declare-fun res!181319 () Bool)

(assert (=> b!329068 (= res!181319 (and ((_ is Intermediate!3093) lt!158089) (not (undefined!3905 lt!158089)) (bvslt (x!32812 lt!158089) #b01111111111111111111111111111110) (bvsge (x!32812 lt!158089) #b00000000000000000000000000000000) (bvsge (x!32812 lt!158089) #b00000000000000000000000000000000)))))

(assert (=> b!329068 (=> (not res!181319) (not e!202178))))

(declare-fun b!329069 () Bool)

(assert (=> b!329069 (= e!202176 (Intermediate!3093 true (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!329070 () Bool)

(assert (=> b!329070 (and (bvsge (index!14550 lt!158089) #b00000000000000000000000000000000) (bvslt (index!14550 lt!158089) (size!8314 a!3305)))))

(assert (=> b!329070 (= e!202177 (= (select (arr!7962 a!3305) (index!14550 lt!158089)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!329071 () Bool)

(assert (=> b!329071 (and (bvsge (index!14550 lt!158089) #b00000000000000000000000000000000) (bvslt (index!14550 lt!158089) (size!8314 a!3305)))))

(declare-fun res!181321 () Bool)

(assert (=> b!329071 (= res!181321 (= (select (arr!7962 a!3305) (index!14550 lt!158089)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!329071 (=> res!181321 e!202177)))

(declare-fun b!329072 () Bool)

(assert (=> b!329072 (= e!202179 (Intermediate!3093 false (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(assert (= (and d!70107 c!51511) b!329069))

(assert (= (and d!70107 (not c!51511)) b!329065))

(assert (= (and b!329065 c!51513) b!329072))

(assert (= (and b!329065 (not c!51513)) b!329067))

(assert (= (and d!70107 c!51512) b!329064))

(assert (= (and d!70107 (not c!51512)) b!329068))

(assert (= (and b!329068 res!181319) b!329066))

(assert (= (and b!329066 (not res!181320)) b!329071))

(assert (= (and b!329071 (not res!181321)) b!329070))

(declare-fun m!334841 () Bool)

(assert (=> b!329071 m!334841))

(assert (=> b!329070 m!334841))

(assert (=> b!329067 m!334767))

(declare-fun m!334843 () Bool)

(assert (=> b!329067 m!334843))

(assert (=> b!329067 m!334843))

(declare-fun m!334845 () Bool)

(assert (=> b!329067 m!334845))

(assert (=> d!70107 m!334767))

(declare-fun m!334847 () Bool)

(assert (=> d!70107 m!334847))

(assert (=> d!70107 m!334775))

(assert (=> b!329066 m!334841))

(assert (=> b!328939 d!70107))

(declare-fun d!70117 () Bool)

(declare-fun lt!158096 () (_ BitVec 32))

(declare-fun lt!158095 () (_ BitVec 32))

(assert (=> d!70117 (= lt!158096 (bvmul (bvxor lt!158095 (bvlshr lt!158095 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!70117 (= lt!158095 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!70117 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!181322 (let ((h!5413 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32818 (bvmul (bvxor h!5413 (bvlshr h!5413 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32818 (bvlshr x!32818 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!181322 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!181322 #b00000000000000000000000000000000))))))

(assert (=> d!70117 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!158096 (bvlshr lt!158096 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!328939 d!70117))

(declare-fun d!70119 () Bool)

(declare-fun res!181327 () Bool)

(declare-fun e!202190 () Bool)

(assert (=> d!70119 (=> res!181327 e!202190)))

(assert (=> d!70119 (= res!181327 (= (select (arr!7962 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!70119 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!202190)))

(declare-fun b!329089 () Bool)

(declare-fun e!202191 () Bool)

(assert (=> b!329089 (= e!202190 e!202191)))

(declare-fun res!181328 () Bool)

(assert (=> b!329089 (=> (not res!181328) (not e!202191))))

(assert (=> b!329089 (= res!181328 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8314 a!3305)))))

(declare-fun b!329090 () Bool)

(assert (=> b!329090 (= e!202191 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70119 (not res!181327)) b!329089))

(assert (= (and b!329089 res!181328) b!329090))

(declare-fun m!334849 () Bool)

(assert (=> d!70119 m!334849))

(declare-fun m!334851 () Bool)

(assert (=> b!329090 m!334851))

(assert (=> b!328938 d!70119))

(declare-fun b!329129 () Bool)

(declare-fun e!202217 () Bool)

(declare-fun call!26137 () Bool)

(assert (=> b!329129 (= e!202217 call!26137)))

(declare-fun d!70121 () Bool)

(declare-fun res!181339 () Bool)

(declare-fun e!202218 () Bool)

(assert (=> d!70121 (=> res!181339 e!202218)))

(assert (=> d!70121 (= res!181339 (bvsge #b00000000000000000000000000000000 (size!8314 a!3305)))))

(assert (=> d!70121 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!202218)))

(declare-fun bm!26134 () Bool)

(assert (=> bm!26134 (= call!26137 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!329130 () Bool)

(declare-fun e!202216 () Bool)

(assert (=> b!329130 (= e!202217 e!202216)))

(declare-fun lt!158122 () (_ BitVec 64))

(assert (=> b!329130 (= lt!158122 (select (arr!7962 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10200 0))(
  ( (Unit!10201) )
))
(declare-fun lt!158121 () Unit!10200)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16830 (_ BitVec 64) (_ BitVec 32)) Unit!10200)

(assert (=> b!329130 (= lt!158121 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!158122 #b00000000000000000000000000000000))))

(assert (=> b!329130 (arrayContainsKey!0 a!3305 lt!158122 #b00000000000000000000000000000000)))

(declare-fun lt!158123 () Unit!10200)

(assert (=> b!329130 (= lt!158123 lt!158121)))

(declare-fun res!181340 () Bool)

(assert (=> b!329130 (= res!181340 (= (seekEntryOrOpen!0 (select (arr!7962 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3093 #b00000000000000000000000000000000)))))

(assert (=> b!329130 (=> (not res!181340) (not e!202216))))

(declare-fun b!329131 () Bool)

(assert (=> b!329131 (= e!202216 call!26137)))

(declare-fun b!329132 () Bool)

(assert (=> b!329132 (= e!202218 e!202217)))

(declare-fun c!51534 () Bool)

(assert (=> b!329132 (= c!51534 (validKeyInArray!0 (select (arr!7962 a!3305) #b00000000000000000000000000000000)))))

(assert (= (and d!70121 (not res!181339)) b!329132))

(assert (= (and b!329132 c!51534) b!329130))

(assert (= (and b!329132 (not c!51534)) b!329129))

(assert (= (and b!329130 res!181340) b!329131))

(assert (= (or b!329131 b!329129) bm!26134))

(declare-fun m!334877 () Bool)

(assert (=> bm!26134 m!334877))

(assert (=> b!329130 m!334849))

(declare-fun m!334879 () Bool)

(assert (=> b!329130 m!334879))

(declare-fun m!334881 () Bool)

(assert (=> b!329130 m!334881))

(assert (=> b!329130 m!334849))

(declare-fun m!334883 () Bool)

(assert (=> b!329130 m!334883))

(assert (=> b!329132 m!334849))

(assert (=> b!329132 m!334849))

(declare-fun m!334885 () Bool)

(assert (=> b!329132 m!334885))

(assert (=> b!328933 d!70121))

(declare-fun b!329133 () Bool)

(declare-fun e!202219 () Bool)

(declare-fun lt!158124 () SeekEntryResult!3093)

(assert (=> b!329133 (= e!202219 (bvsge (x!32812 lt!158124) #b01111111111111111111111111111110))))

(declare-fun b!329134 () Bool)

(declare-fun e!202220 () SeekEntryResult!3093)

(declare-fun e!202223 () SeekEntryResult!3093)

(assert (=> b!329134 (= e!202220 e!202223)))

(declare-fun c!51537 () Bool)

(declare-fun lt!158125 () (_ BitVec 64))

(assert (=> b!329134 (= c!51537 (or (= lt!158125 k0!2497) (= (bvadd lt!158125 lt!158125) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!329135 () Bool)

(assert (=> b!329135 (and (bvsge (index!14550 lt!158124) #b00000000000000000000000000000000) (bvslt (index!14550 lt!158124) (size!8314 a!3305)))))

(declare-fun res!181342 () Bool)

(assert (=> b!329135 (= res!181342 (= (select (arr!7962 a!3305) (index!14550 lt!158124)) k0!2497))))

(declare-fun e!202221 () Bool)

(assert (=> b!329135 (=> res!181342 e!202221)))

(declare-fun e!202222 () Bool)

(assert (=> b!329135 (= e!202222 e!202221)))

(declare-fun b!329136 () Bool)

(assert (=> b!329136 (= e!202223 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun d!70129 () Bool)

(assert (=> d!70129 e!202219))

(declare-fun c!51536 () Bool)

(assert (=> d!70129 (= c!51536 (and ((_ is Intermediate!3093) lt!158124) (undefined!3905 lt!158124)))))

(assert (=> d!70129 (= lt!158124 e!202220)))

(declare-fun c!51535 () Bool)

(assert (=> d!70129 (= c!51535 (bvsge x!1490 #b01111111111111111111111111111110))))

(assert (=> d!70129 (= lt!158125 (select (arr!7962 a!3305) index!1840))))

(assert (=> d!70129 (validMask!0 mask!3777)))

(assert (=> d!70129 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!158124)))

(declare-fun b!329137 () Bool)

(assert (=> b!329137 (= e!202219 e!202222)))

(declare-fun res!181341 () Bool)

(assert (=> b!329137 (= res!181341 (and ((_ is Intermediate!3093) lt!158124) (not (undefined!3905 lt!158124)) (bvslt (x!32812 lt!158124) #b01111111111111111111111111111110) (bvsge (x!32812 lt!158124) #b00000000000000000000000000000000) (bvsge (x!32812 lt!158124) x!1490)))))

(assert (=> b!329137 (=> (not res!181341) (not e!202222))))

(declare-fun b!329138 () Bool)

(assert (=> b!329138 (= e!202220 (Intermediate!3093 true index!1840 x!1490))))

(declare-fun b!329139 () Bool)

(assert (=> b!329139 (and (bvsge (index!14550 lt!158124) #b00000000000000000000000000000000) (bvslt (index!14550 lt!158124) (size!8314 a!3305)))))

(assert (=> b!329139 (= e!202221 (= (select (arr!7962 a!3305) (index!14550 lt!158124)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!329140 () Bool)

(assert (=> b!329140 (and (bvsge (index!14550 lt!158124) #b00000000000000000000000000000000) (bvslt (index!14550 lt!158124) (size!8314 a!3305)))))

(declare-fun res!181343 () Bool)

(assert (=> b!329140 (= res!181343 (= (select (arr!7962 a!3305) (index!14550 lt!158124)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!329140 (=> res!181343 e!202221)))

(declare-fun b!329141 () Bool)

(assert (=> b!329141 (= e!202223 (Intermediate!3093 false index!1840 x!1490))))

(assert (= (and d!70129 c!51535) b!329138))

(assert (= (and d!70129 (not c!51535)) b!329134))

(assert (= (and b!329134 c!51537) b!329141))

(assert (= (and b!329134 (not c!51537)) b!329136))

(assert (= (and d!70129 c!51536) b!329133))

(assert (= (and d!70129 (not c!51536)) b!329137))

(assert (= (and b!329137 res!181341) b!329135))

(assert (= (and b!329135 (not res!181342)) b!329140))

(assert (= (and b!329140 (not res!181343)) b!329139))

(declare-fun m!334887 () Bool)

(assert (=> b!329140 m!334887))

(assert (=> b!329139 m!334887))

(declare-fun m!334889 () Bool)

(assert (=> b!329136 m!334889))

(assert (=> b!329136 m!334889))

(declare-fun m!334891 () Bool)

(assert (=> b!329136 m!334891))

(assert (=> d!70129 m!334779))

(assert (=> d!70129 m!334775))

(assert (=> b!329135 m!334887))

(assert (=> b!328937 d!70129))

(check-sat (not b!329090) (not b!329130) (not b!328981) (not d!70129) (not b!329067) (not b!329136) (not b!329132) (not d!70093) (not d!70107) (not bm!26134))
(check-sat)
