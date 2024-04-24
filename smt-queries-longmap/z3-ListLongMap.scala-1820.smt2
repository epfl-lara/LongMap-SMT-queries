; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32714 () Bool)

(assert start!32714)

(declare-fun b!327166 () Bool)

(declare-fun res!180250 () Bool)

(declare-fun e!201226 () Bool)

(assert (=> b!327166 (=> (not res!180250) (not e!201226))))

(declare-datatypes ((array!16764 0))(
  ( (array!16765 (arr!7936 (Array (_ BitVec 32) (_ BitVec 64))) (size!8288 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16764)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16764 (_ BitVec 32)) Bool)

(assert (=> b!327166 (= res!180250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!327168 () Bool)

(declare-fun res!180255 () Bool)

(assert (=> b!327168 (=> (not res!180255) (not e!201226))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3032 0))(
  ( (MissingZero!3032 (index!14304 (_ BitVec 32))) (Found!3032 (index!14305 (_ BitVec 32))) (Intermediate!3032 (undefined!3844 Bool) (index!14306 (_ BitVec 32)) (x!32651 (_ BitVec 32))) (Undefined!3032) (MissingVacant!3032 (index!14307 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16764 (_ BitVec 32)) SeekEntryResult!3032)

(assert (=> b!327168 (= res!180255 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3032 i!1250)))))

(declare-fun b!327169 () Bool)

(declare-fun res!180254 () Bool)

(assert (=> b!327169 (=> (not res!180254) (not e!201226))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!327169 (= res!180254 (validKeyInArray!0 k0!2497))))

(declare-fun b!327170 () Bool)

(declare-fun res!180253 () Bool)

(declare-fun e!201227 () Bool)

(assert (=> b!327170 (=> (not res!180253) (not e!201227))))

(declare-fun lt!157497 () SeekEntryResult!3032)

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16764 (_ BitVec 32)) SeekEntryResult!3032)

(assert (=> b!327170 (= res!180253 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157497))))

(declare-fun b!327171 () Bool)

(declare-fun res!180248 () Bool)

(assert (=> b!327171 (=> (not res!180248) (not e!201226))))

(assert (=> b!327171 (= res!180248 (and (= (size!8288 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8288 a!3305))))))

(declare-fun b!327172 () Bool)

(assert (=> b!327172 (= e!201226 e!201227)))

(declare-fun res!180247 () Bool)

(assert (=> b!327172 (=> (not res!180247) (not e!201227))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327172 (= res!180247 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157497))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!327172 (= lt!157497 (Intermediate!3032 false resIndex!58 resX!58))))

(declare-fun b!327167 () Bool)

(declare-fun res!180251 () Bool)

(assert (=> b!327167 (=> (not res!180251) (not e!201227))))

(assert (=> b!327167 (= res!180251 (and (= (select (arr!7936 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8288 a!3305))))))

(declare-fun res!180252 () Bool)

(assert (=> start!32714 (=> (not res!180252) (not e!201226))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32714 (= res!180252 (validMask!0 mask!3777))))

(assert (=> start!32714 e!201226))

(declare-fun array_inv!5886 (array!16764) Bool)

(assert (=> start!32714 (array_inv!5886 a!3305)))

(assert (=> start!32714 true))

(declare-fun b!327173 () Bool)

(declare-fun res!180249 () Bool)

(assert (=> b!327173 (=> (not res!180249) (not e!201226))))

(declare-fun arrayContainsKey!0 (array!16764 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!327173 (= res!180249 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!327174 () Bool)

(assert (=> b!327174 (= e!201227 (bvsge resX!58 #b01111111111111111111111111111110))))

(assert (= (and start!32714 res!180252) b!327171))

(assert (= (and b!327171 res!180248) b!327169))

(assert (= (and b!327169 res!180254) b!327173))

(assert (= (and b!327173 res!180249) b!327168))

(assert (= (and b!327168 res!180255) b!327166))

(assert (= (and b!327166 res!180250) b!327172))

(assert (= (and b!327172 res!180247) b!327167))

(assert (= (and b!327167 res!180251) b!327170))

(assert (= (and b!327170 res!180253) b!327174))

(declare-fun m!333859 () Bool)

(assert (=> b!327168 m!333859))

(declare-fun m!333861 () Bool)

(assert (=> b!327172 m!333861))

(assert (=> b!327172 m!333861))

(declare-fun m!333863 () Bool)

(assert (=> b!327172 m!333863))

(declare-fun m!333865 () Bool)

(assert (=> b!327170 m!333865))

(declare-fun m!333867 () Bool)

(assert (=> b!327169 m!333867))

(declare-fun m!333869 () Bool)

(assert (=> b!327173 m!333869))

(declare-fun m!333871 () Bool)

(assert (=> start!32714 m!333871))

(declare-fun m!333873 () Bool)

(assert (=> start!32714 m!333873))

(declare-fun m!333875 () Bool)

(assert (=> b!327166 m!333875))

(declare-fun m!333877 () Bool)

(assert (=> b!327167 m!333877))

(check-sat (not b!327172) (not b!327168) (not b!327169) (not b!327166) (not b!327173) (not start!32714) (not b!327170))
(check-sat)
(get-model)

(declare-fun b!327249 () Bool)

(declare-fun e!201259 () SeekEntryResult!3032)

(declare-fun lt!157517 () SeekEntryResult!3032)

(assert (=> b!327249 (= e!201259 (MissingZero!3032 (index!14306 lt!157517)))))

(declare-fun b!327250 () Bool)

(declare-fun c!51098 () Bool)

(declare-fun lt!157516 () (_ BitVec 64))

(assert (=> b!327250 (= c!51098 (= lt!157516 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!201261 () SeekEntryResult!3032)

(assert (=> b!327250 (= e!201261 e!201259)))

(declare-fun b!327251 () Bool)

(assert (=> b!327251 (= e!201261 (Found!3032 (index!14306 lt!157517)))))

(declare-fun d!69829 () Bool)

(declare-fun lt!157518 () SeekEntryResult!3032)

(get-info :version)

(assert (=> d!69829 (and (or ((_ is Undefined!3032) lt!157518) (not ((_ is Found!3032) lt!157518)) (and (bvsge (index!14305 lt!157518) #b00000000000000000000000000000000) (bvslt (index!14305 lt!157518) (size!8288 a!3305)))) (or ((_ is Undefined!3032) lt!157518) ((_ is Found!3032) lt!157518) (not ((_ is MissingZero!3032) lt!157518)) (and (bvsge (index!14304 lt!157518) #b00000000000000000000000000000000) (bvslt (index!14304 lt!157518) (size!8288 a!3305)))) (or ((_ is Undefined!3032) lt!157518) ((_ is Found!3032) lt!157518) ((_ is MissingZero!3032) lt!157518) (not ((_ is MissingVacant!3032) lt!157518)) (and (bvsge (index!14307 lt!157518) #b00000000000000000000000000000000) (bvslt (index!14307 lt!157518) (size!8288 a!3305)))) (or ((_ is Undefined!3032) lt!157518) (ite ((_ is Found!3032) lt!157518) (= (select (arr!7936 a!3305) (index!14305 lt!157518)) k0!2497) (ite ((_ is MissingZero!3032) lt!157518) (= (select (arr!7936 a!3305) (index!14304 lt!157518)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3032) lt!157518) (= (select (arr!7936 a!3305) (index!14307 lt!157518)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!201260 () SeekEntryResult!3032)

(assert (=> d!69829 (= lt!157518 e!201260)))

(declare-fun c!51099 () Bool)

(assert (=> d!69829 (= c!51099 (and ((_ is Intermediate!3032) lt!157517) (undefined!3844 lt!157517)))))

(assert (=> d!69829 (= lt!157517 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!69829 (validMask!0 mask!3777)))

(assert (=> d!69829 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!157518)))

(declare-fun b!327252 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16764 (_ BitVec 32)) SeekEntryResult!3032)

(assert (=> b!327252 (= e!201259 (seekKeyOrZeroReturnVacant!0 (x!32651 lt!157517) (index!14306 lt!157517) (index!14306 lt!157517) k0!2497 a!3305 mask!3777))))

(declare-fun b!327253 () Bool)

(assert (=> b!327253 (= e!201260 Undefined!3032)))

(declare-fun b!327254 () Bool)

(assert (=> b!327254 (= e!201260 e!201261)))

(assert (=> b!327254 (= lt!157516 (select (arr!7936 a!3305) (index!14306 lt!157517)))))

(declare-fun c!51100 () Bool)

(assert (=> b!327254 (= c!51100 (= lt!157516 k0!2497))))

(assert (= (and d!69829 c!51099) b!327253))

(assert (= (and d!69829 (not c!51099)) b!327254))

(assert (= (and b!327254 c!51100) b!327251))

(assert (= (and b!327254 (not c!51100)) b!327250))

(assert (= (and b!327250 c!51098) b!327249))

(assert (= (and b!327250 (not c!51098)) b!327252))

(declare-fun m!333919 () Bool)

(assert (=> d!69829 m!333919))

(declare-fun m!333921 () Bool)

(assert (=> d!69829 m!333921))

(assert (=> d!69829 m!333861))

(assert (=> d!69829 m!333863))

(assert (=> d!69829 m!333861))

(declare-fun m!333923 () Bool)

(assert (=> d!69829 m!333923))

(assert (=> d!69829 m!333871))

(declare-fun m!333925 () Bool)

(assert (=> b!327252 m!333925))

(declare-fun m!333927 () Bool)

(assert (=> b!327254 m!333927))

(assert (=> b!327168 d!69829))

(declare-fun d!69835 () Bool)

(declare-fun res!180320 () Bool)

(declare-fun e!201275 () Bool)

(assert (=> d!69835 (=> res!180320 e!201275)))

(assert (=> d!69835 (= res!180320 (= (select (arr!7936 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!69835 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!201275)))

(declare-fun b!327275 () Bool)

(declare-fun e!201276 () Bool)

(assert (=> b!327275 (= e!201275 e!201276)))

(declare-fun res!180321 () Bool)

(assert (=> b!327275 (=> (not res!180321) (not e!201276))))

(assert (=> b!327275 (= res!180321 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8288 a!3305)))))

(declare-fun b!327276 () Bool)

(assert (=> b!327276 (= e!201276 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69835 (not res!180320)) b!327275))

(assert (= (and b!327275 res!180321) b!327276))

(declare-fun m!333941 () Bool)

(assert (=> d!69835 m!333941))

(declare-fun m!333943 () Bool)

(assert (=> b!327276 m!333943))

(assert (=> b!327173 d!69835))

(declare-fun b!327325 () Bool)

(declare-fun e!201309 () SeekEntryResult!3032)

(assert (=> b!327325 (= e!201309 (Intermediate!3032 false (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!327326 () Bool)

(declare-fun lt!157539 () SeekEntryResult!3032)

(assert (=> b!327326 (and (bvsge (index!14306 lt!157539) #b00000000000000000000000000000000) (bvslt (index!14306 lt!157539) (size!8288 a!3305)))))

(declare-fun res!180341 () Bool)

(assert (=> b!327326 (= res!180341 (= (select (arr!7936 a!3305) (index!14306 lt!157539)) k0!2497))))

(declare-fun e!201306 () Bool)

(assert (=> b!327326 (=> res!180341 e!201306)))

(declare-fun e!201310 () Bool)

(assert (=> b!327326 (= e!201310 e!201306)))

(declare-fun d!69839 () Bool)

(declare-fun e!201308 () Bool)

(assert (=> d!69839 e!201308))

(declare-fun c!51125 () Bool)

(assert (=> d!69839 (= c!51125 (and ((_ is Intermediate!3032) lt!157539) (undefined!3844 lt!157539)))))

(declare-fun e!201307 () SeekEntryResult!3032)

(assert (=> d!69839 (= lt!157539 e!201307)))

(declare-fun c!51124 () Bool)

(assert (=> d!69839 (= c!51124 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!157540 () (_ BitVec 64))

(assert (=> d!69839 (= lt!157540 (select (arr!7936 a!3305) (toIndex!0 k0!2497 mask!3777)))))

(assert (=> d!69839 (validMask!0 mask!3777)))

(assert (=> d!69839 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157539)))

(declare-fun b!327327 () Bool)

(assert (=> b!327327 (= e!201308 e!201310)))

(declare-fun res!180342 () Bool)

(assert (=> b!327327 (= res!180342 (and ((_ is Intermediate!3032) lt!157539) (not (undefined!3844 lt!157539)) (bvslt (x!32651 lt!157539) #b01111111111111111111111111111110) (bvsge (x!32651 lt!157539) #b00000000000000000000000000000000) (bvsge (x!32651 lt!157539) #b00000000000000000000000000000000)))))

(assert (=> b!327327 (=> (not res!180342) (not e!201310))))

(declare-fun b!327328 () Bool)

(assert (=> b!327328 (and (bvsge (index!14306 lt!157539) #b00000000000000000000000000000000) (bvslt (index!14306 lt!157539) (size!8288 a!3305)))))

(declare-fun res!180340 () Bool)

(assert (=> b!327328 (= res!180340 (= (select (arr!7936 a!3305) (index!14306 lt!157539)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!327328 (=> res!180340 e!201306)))

(declare-fun b!327329 () Bool)

(assert (=> b!327329 (= e!201307 e!201309)))

(declare-fun c!51123 () Bool)

(assert (=> b!327329 (= c!51123 (or (= lt!157540 k0!2497) (= (bvadd lt!157540 lt!157540) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!327330 () Bool)

(assert (=> b!327330 (= e!201308 (bvsge (x!32651 lt!157539) #b01111111111111111111111111111110))))

(declare-fun b!327331 () Bool)

(assert (=> b!327331 (= e!201307 (Intermediate!3032 true (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!327332 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327332 (= e!201309 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2497 mask!3777) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!327333 () Bool)

(assert (=> b!327333 (and (bvsge (index!14306 lt!157539) #b00000000000000000000000000000000) (bvslt (index!14306 lt!157539) (size!8288 a!3305)))))

(assert (=> b!327333 (= e!201306 (= (select (arr!7936 a!3305) (index!14306 lt!157539)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!69839 c!51124) b!327331))

(assert (= (and d!69839 (not c!51124)) b!327329))

(assert (= (and b!327329 c!51123) b!327325))

(assert (= (and b!327329 (not c!51123)) b!327332))

(assert (= (and d!69839 c!51125) b!327330))

(assert (= (and d!69839 (not c!51125)) b!327327))

(assert (= (and b!327327 res!180342) b!327326))

(assert (= (and b!327326 (not res!180341)) b!327328))

(assert (= (and b!327328 (not res!180340)) b!327333))

(declare-fun m!333959 () Bool)

(assert (=> b!327333 m!333959))

(assert (=> b!327328 m!333959))

(assert (=> b!327326 m!333959))

(assert (=> d!69839 m!333861))

(declare-fun m!333961 () Bool)

(assert (=> d!69839 m!333961))

(assert (=> d!69839 m!333871))

(assert (=> b!327332 m!333861))

(declare-fun m!333965 () Bool)

(assert (=> b!327332 m!333965))

(assert (=> b!327332 m!333965))

(declare-fun m!333969 () Bool)

(assert (=> b!327332 m!333969))

(assert (=> b!327172 d!69839))

(declare-fun d!69853 () Bool)

(declare-fun lt!157554 () (_ BitVec 32))

(declare-fun lt!157553 () (_ BitVec 32))

(assert (=> d!69853 (= lt!157554 (bvmul (bvxor lt!157553 (bvlshr lt!157553 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69853 (= lt!157553 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69853 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!180346 (let ((h!5309 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32656 (bvmul (bvxor h!5309 (bvlshr h!5309 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32656 (bvlshr x!32656 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!180346 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!180346 #b00000000000000000000000000000000))))))

(assert (=> d!69853 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!157554 (bvlshr lt!157554 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!327172 d!69853))

(declare-fun d!69857 () Bool)

(assert (=> d!69857 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32714 d!69857))

(declare-fun d!69867 () Bool)

(assert (=> d!69867 (= (array_inv!5886 a!3305) (bvsge (size!8288 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32714 d!69867))

(declare-fun b!327387 () Bool)

(declare-fun e!201347 () Bool)

(declare-fun e!201348 () Bool)

(assert (=> b!327387 (= e!201347 e!201348)))

(declare-fun c!51140 () Bool)

(assert (=> b!327387 (= c!51140 (validKeyInArray!0 (select (arr!7936 a!3305) #b00000000000000000000000000000000)))))

(declare-fun b!327388 () Bool)

(declare-fun e!201349 () Bool)

(declare-fun call!26084 () Bool)

(assert (=> b!327388 (= e!201349 call!26084)))

(declare-fun b!327389 () Bool)

(assert (=> b!327389 (= e!201348 call!26084)))

(declare-fun d!69869 () Bool)

(declare-fun res!180369 () Bool)

(assert (=> d!69869 (=> res!180369 e!201347)))

(assert (=> d!69869 (= res!180369 (bvsge #b00000000000000000000000000000000 (size!8288 a!3305)))))

(assert (=> d!69869 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!201347)))

(declare-fun bm!26081 () Bool)

(assert (=> bm!26081 (= call!26084 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!327390 () Bool)

(assert (=> b!327390 (= e!201348 e!201349)))

(declare-fun lt!157569 () (_ BitVec 64))

(assert (=> b!327390 (= lt!157569 (select (arr!7936 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10136 0))(
  ( (Unit!10137) )
))
(declare-fun lt!157570 () Unit!10136)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16764 (_ BitVec 64) (_ BitVec 32)) Unit!10136)

(assert (=> b!327390 (= lt!157570 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!157569 #b00000000000000000000000000000000))))

(assert (=> b!327390 (arrayContainsKey!0 a!3305 lt!157569 #b00000000000000000000000000000000)))

(declare-fun lt!157568 () Unit!10136)

(assert (=> b!327390 (= lt!157568 lt!157570)))

(declare-fun res!180370 () Bool)

(assert (=> b!327390 (= res!180370 (= (seekEntryOrOpen!0 (select (arr!7936 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3032 #b00000000000000000000000000000000)))))

(assert (=> b!327390 (=> (not res!180370) (not e!201349))))

(assert (= (and d!69869 (not res!180369)) b!327387))

(assert (= (and b!327387 c!51140) b!327390))

(assert (= (and b!327387 (not c!51140)) b!327389))

(assert (= (and b!327390 res!180370) b!327388))

(assert (= (or b!327388 b!327389) bm!26081))

(assert (=> b!327387 m!333941))

(assert (=> b!327387 m!333941))

(declare-fun m!333987 () Bool)

(assert (=> b!327387 m!333987))

(declare-fun m!333989 () Bool)

(assert (=> bm!26081 m!333989))

(assert (=> b!327390 m!333941))

(declare-fun m!333991 () Bool)

(assert (=> b!327390 m!333991))

(declare-fun m!333993 () Bool)

(assert (=> b!327390 m!333993))

(assert (=> b!327390 m!333941))

(declare-fun m!333995 () Bool)

(assert (=> b!327390 m!333995))

(assert (=> b!327166 d!69869))

(declare-fun b!327391 () Bool)

(declare-fun e!201353 () SeekEntryResult!3032)

(assert (=> b!327391 (= e!201353 (Intermediate!3032 false index!1840 x!1490))))

(declare-fun b!327392 () Bool)

(declare-fun lt!157571 () SeekEntryResult!3032)

(assert (=> b!327392 (and (bvsge (index!14306 lt!157571) #b00000000000000000000000000000000) (bvslt (index!14306 lt!157571) (size!8288 a!3305)))))

(declare-fun res!180372 () Bool)

(assert (=> b!327392 (= res!180372 (= (select (arr!7936 a!3305) (index!14306 lt!157571)) k0!2497))))

(declare-fun e!201350 () Bool)

(assert (=> b!327392 (=> res!180372 e!201350)))

(declare-fun e!201354 () Bool)

(assert (=> b!327392 (= e!201354 e!201350)))

(declare-fun d!69871 () Bool)

(declare-fun e!201352 () Bool)

(assert (=> d!69871 e!201352))

(declare-fun c!51143 () Bool)

(assert (=> d!69871 (= c!51143 (and ((_ is Intermediate!3032) lt!157571) (undefined!3844 lt!157571)))))

(declare-fun e!201351 () SeekEntryResult!3032)

(assert (=> d!69871 (= lt!157571 e!201351)))

(declare-fun c!51142 () Bool)

(assert (=> d!69871 (= c!51142 (bvsge x!1490 #b01111111111111111111111111111110))))

(declare-fun lt!157572 () (_ BitVec 64))

(assert (=> d!69871 (= lt!157572 (select (arr!7936 a!3305) index!1840))))

(assert (=> d!69871 (validMask!0 mask!3777)))

(assert (=> d!69871 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157571)))

(declare-fun b!327393 () Bool)

(assert (=> b!327393 (= e!201352 e!201354)))

(declare-fun res!180373 () Bool)

(assert (=> b!327393 (= res!180373 (and ((_ is Intermediate!3032) lt!157571) (not (undefined!3844 lt!157571)) (bvslt (x!32651 lt!157571) #b01111111111111111111111111111110) (bvsge (x!32651 lt!157571) #b00000000000000000000000000000000) (bvsge (x!32651 lt!157571) x!1490)))))

(assert (=> b!327393 (=> (not res!180373) (not e!201354))))

(declare-fun b!327394 () Bool)

(assert (=> b!327394 (and (bvsge (index!14306 lt!157571) #b00000000000000000000000000000000) (bvslt (index!14306 lt!157571) (size!8288 a!3305)))))

(declare-fun res!180371 () Bool)

(assert (=> b!327394 (= res!180371 (= (select (arr!7936 a!3305) (index!14306 lt!157571)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!327394 (=> res!180371 e!201350)))

(declare-fun b!327395 () Bool)

(assert (=> b!327395 (= e!201351 e!201353)))

(declare-fun c!51141 () Bool)

(assert (=> b!327395 (= c!51141 (or (= lt!157572 k0!2497) (= (bvadd lt!157572 lt!157572) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!327396 () Bool)

(assert (=> b!327396 (= e!201352 (bvsge (x!32651 lt!157571) #b01111111111111111111111111111110))))

(declare-fun b!327397 () Bool)

(assert (=> b!327397 (= e!201351 (Intermediate!3032 true index!1840 x!1490))))

(declare-fun b!327398 () Bool)

(assert (=> b!327398 (= e!201353 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 (bvadd x!1490 #b00000000000000000000000000000001) mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!327399 () Bool)

(assert (=> b!327399 (and (bvsge (index!14306 lt!157571) #b00000000000000000000000000000000) (bvslt (index!14306 lt!157571) (size!8288 a!3305)))))

(assert (=> b!327399 (= e!201350 (= (select (arr!7936 a!3305) (index!14306 lt!157571)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!69871 c!51142) b!327397))

(assert (= (and d!69871 (not c!51142)) b!327395))

(assert (= (and b!327395 c!51141) b!327391))

(assert (= (and b!327395 (not c!51141)) b!327398))

(assert (= (and d!69871 c!51143) b!327396))

(assert (= (and d!69871 (not c!51143)) b!327393))

(assert (= (and b!327393 res!180373) b!327392))

(assert (= (and b!327392 (not res!180372)) b!327394))

(assert (= (and b!327394 (not res!180371)) b!327399))

(declare-fun m!333997 () Bool)

(assert (=> b!327399 m!333997))

(assert (=> b!327394 m!333997))

(assert (=> b!327392 m!333997))

(declare-fun m!333999 () Bool)

(assert (=> d!69871 m!333999))

(assert (=> d!69871 m!333871))

(declare-fun m!334001 () Bool)

(assert (=> b!327398 m!334001))

(assert (=> b!327398 m!334001))

(declare-fun m!334003 () Bool)

(assert (=> b!327398 m!334003))

(assert (=> b!327170 d!69871))

(declare-fun d!69873 () Bool)

(assert (=> d!69873 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!327169 d!69873))

(check-sat (not b!327276) (not b!327398) (not b!327390) (not d!69839) (not d!69829) (not b!327332) (not b!327252) (not b!327387) (not d!69871) (not bm!26081))
(check-sat)
