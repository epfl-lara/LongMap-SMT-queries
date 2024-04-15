; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32714 () Bool)

(assert start!32714)

(declare-fun b!326944 () Bool)

(declare-fun res!180122 () Bool)

(declare-fun e!201086 () Bool)

(assert (=> b!326944 (=> (not res!180122) (not e!201086))))

(declare-datatypes ((array!16755 0))(
  ( (array!16756 (arr!7932 (Array (_ BitVec 32) (_ BitVec 64))) (size!8285 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16755)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16755 (_ BitVec 32)) Bool)

(assert (=> b!326944 (= res!180122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326945 () Bool)

(declare-fun res!180129 () Bool)

(assert (=> b!326945 (=> (not res!180129) (not e!201086))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326945 (= res!180129 (validKeyInArray!0 k0!2497))))

(declare-fun b!326946 () Bool)

(declare-fun res!180123 () Bool)

(assert (=> b!326946 (=> (not res!180123) (not e!201086))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3062 0))(
  ( (MissingZero!3062 (index!14424 (_ BitVec 32))) (Found!3062 (index!14425 (_ BitVec 32))) (Intermediate!3062 (undefined!3874 Bool) (index!14426 (_ BitVec 32)) (x!32679 (_ BitVec 32))) (Undefined!3062) (MissingVacant!3062 (index!14427 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16755 (_ BitVec 32)) SeekEntryResult!3062)

(assert (=> b!326946 (= res!180123 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3062 i!1250)))))

(declare-fun b!326947 () Bool)

(declare-fun res!180125 () Bool)

(assert (=> b!326947 (=> (not res!180125) (not e!201086))))

(declare-fun arrayContainsKey!0 (array!16755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326947 (= res!180125 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326948 () Bool)

(declare-fun res!180128 () Bool)

(declare-fun e!201085 () Bool)

(assert (=> b!326948 (=> (not res!180128) (not e!201085))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!326948 (= res!180128 (and (= (select (arr!7932 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8285 a!3305))))))

(declare-fun b!326949 () Bool)

(assert (=> b!326949 (= e!201085 (bvsge resX!58 #b01111111111111111111111111111110))))

(declare-fun b!326950 () Bool)

(assert (=> b!326950 (= e!201086 e!201085)))

(declare-fun res!180127 () Bool)

(assert (=> b!326950 (=> (not res!180127) (not e!201085))))

(declare-fun lt!157244 () SeekEntryResult!3062)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16755 (_ BitVec 32)) SeekEntryResult!3062)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326950 (= res!180127 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157244))))

(assert (=> b!326950 (= lt!157244 (Intermediate!3062 false resIndex!58 resX!58))))

(declare-fun res!180121 () Bool)

(assert (=> start!32714 (=> (not res!180121) (not e!201086))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32714 (= res!180121 (validMask!0 mask!3777))))

(assert (=> start!32714 e!201086))

(declare-fun array_inv!5904 (array!16755) Bool)

(assert (=> start!32714 (array_inv!5904 a!3305)))

(assert (=> start!32714 true))

(declare-fun b!326951 () Bool)

(declare-fun res!180124 () Bool)

(assert (=> b!326951 (=> (not res!180124) (not e!201085))))

(assert (=> b!326951 (= res!180124 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157244))))

(declare-fun b!326952 () Bool)

(declare-fun res!180126 () Bool)

(assert (=> b!326952 (=> (not res!180126) (not e!201086))))

(assert (=> b!326952 (= res!180126 (and (= (size!8285 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8285 a!3305))))))

(assert (= (and start!32714 res!180121) b!326952))

(assert (= (and b!326952 res!180126) b!326945))

(assert (= (and b!326945 res!180129) b!326947))

(assert (= (and b!326947 res!180125) b!326946))

(assert (= (and b!326946 res!180123) b!326944))

(assert (= (and b!326944 res!180122) b!326950))

(assert (= (and b!326950 res!180127) b!326948))

(assert (= (and b!326948 res!180128) b!326951))

(assert (= (and b!326951 res!180124) b!326949))

(declare-fun m!332935 () Bool)

(assert (=> b!326948 m!332935))

(declare-fun m!332937 () Bool)

(assert (=> b!326947 m!332937))

(declare-fun m!332939 () Bool)

(assert (=> b!326950 m!332939))

(assert (=> b!326950 m!332939))

(declare-fun m!332941 () Bool)

(assert (=> b!326950 m!332941))

(declare-fun m!332943 () Bool)

(assert (=> b!326945 m!332943))

(declare-fun m!332945 () Bool)

(assert (=> b!326944 m!332945))

(declare-fun m!332947 () Bool)

(assert (=> start!32714 m!332947))

(declare-fun m!332949 () Bool)

(assert (=> start!32714 m!332949))

(declare-fun m!332951 () Bool)

(assert (=> b!326946 m!332951))

(declare-fun m!332953 () Bool)

(assert (=> b!326951 m!332953))

(check-sat (not b!326947) (not b!326950) (not start!32714) (not b!326945) (not b!326951) (not b!326946) (not b!326944))
(check-sat)
(get-model)

(declare-fun d!69596 () Bool)

(declare-fun res!180188 () Bool)

(declare-fun e!201109 () Bool)

(assert (=> d!69596 (=> res!180188 e!201109)))

(assert (=> d!69596 (= res!180188 (= (select (arr!7932 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!69596 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!201109)))

(declare-fun b!327011 () Bool)

(declare-fun e!201110 () Bool)

(assert (=> b!327011 (= e!201109 e!201110)))

(declare-fun res!180189 () Bool)

(assert (=> b!327011 (=> (not res!180189) (not e!201110))))

(assert (=> b!327011 (= res!180189 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8285 a!3305)))))

(declare-fun b!327012 () Bool)

(assert (=> b!327012 (= e!201110 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69596 (not res!180188)) b!327011))

(assert (= (and b!327011 res!180189) b!327012))

(declare-fun m!332995 () Bool)

(assert (=> d!69596 m!332995))

(declare-fun m!332997 () Bool)

(assert (=> b!327012 m!332997))

(assert (=> b!326947 d!69596))

(declare-fun b!327021 () Bool)

(declare-fun e!201117 () Bool)

(declare-fun call!26066 () Bool)

(assert (=> b!327021 (= e!201117 call!26066)))

(declare-fun b!327022 () Bool)

(declare-fun e!201119 () Bool)

(assert (=> b!327022 (= e!201117 e!201119)))

(declare-fun lt!157257 () (_ BitVec 64))

(assert (=> b!327022 (= lt!157257 (select (arr!7932 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10136 0))(
  ( (Unit!10137) )
))
(declare-fun lt!157258 () Unit!10136)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16755 (_ BitVec 64) (_ BitVec 32)) Unit!10136)

(assert (=> b!327022 (= lt!157258 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!157257 #b00000000000000000000000000000000))))

(assert (=> b!327022 (arrayContainsKey!0 a!3305 lt!157257 #b00000000000000000000000000000000)))

(declare-fun lt!157259 () Unit!10136)

(assert (=> b!327022 (= lt!157259 lt!157258)))

(declare-fun res!180194 () Bool)

(assert (=> b!327022 (= res!180194 (= (seekEntryOrOpen!0 (select (arr!7932 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3062 #b00000000000000000000000000000000)))))

(assert (=> b!327022 (=> (not res!180194) (not e!201119))))

(declare-fun d!69599 () Bool)

(declare-fun res!180195 () Bool)

(declare-fun e!201118 () Bool)

(assert (=> d!69599 (=> res!180195 e!201118)))

(assert (=> d!69599 (= res!180195 (bvsge #b00000000000000000000000000000000 (size!8285 a!3305)))))

(assert (=> d!69599 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!201118)))

(declare-fun b!327023 () Bool)

(assert (=> b!327023 (= e!201119 call!26066)))

(declare-fun bm!26063 () Bool)

(assert (=> bm!26063 (= call!26066 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!327024 () Bool)

(assert (=> b!327024 (= e!201118 e!201117)))

(declare-fun c!51044 () Bool)

(assert (=> b!327024 (= c!51044 (validKeyInArray!0 (select (arr!7932 a!3305) #b00000000000000000000000000000000)))))

(assert (= (and d!69599 (not res!180195)) b!327024))

(assert (= (and b!327024 c!51044) b!327022))

(assert (= (and b!327024 (not c!51044)) b!327021))

(assert (= (and b!327022 res!180194) b!327023))

(assert (= (or b!327023 b!327021) bm!26063))

(assert (=> b!327022 m!332995))

(declare-fun m!332999 () Bool)

(assert (=> b!327022 m!332999))

(declare-fun m!333001 () Bool)

(assert (=> b!327022 m!333001))

(assert (=> b!327022 m!332995))

(declare-fun m!333003 () Bool)

(assert (=> b!327022 m!333003))

(declare-fun m!333005 () Bool)

(assert (=> bm!26063 m!333005))

(assert (=> b!327024 m!332995))

(assert (=> b!327024 m!332995))

(declare-fun m!333007 () Bool)

(assert (=> b!327024 m!333007))

(assert (=> b!326944 d!69599))

(declare-fun b!327124 () Bool)

(declare-fun lt!157294 () SeekEntryResult!3062)

(assert (=> b!327124 (and (bvsge (index!14426 lt!157294) #b00000000000000000000000000000000) (bvslt (index!14426 lt!157294) (size!8285 a!3305)))))

(declare-fun e!201176 () Bool)

(assert (=> b!327124 (= e!201176 (= (select (arr!7932 a!3305) (index!14426 lt!157294)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!327125 () Bool)

(declare-fun e!201178 () SeekEntryResult!3062)

(assert (=> b!327125 (= e!201178 (Intermediate!3062 false (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!327126 () Bool)

(declare-fun e!201175 () SeekEntryResult!3062)

(assert (=> b!327126 (= e!201175 (Intermediate!3062 true (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!327127 () Bool)

(assert (=> b!327127 (= e!201175 e!201178)))

(declare-fun c!51083 () Bool)

(declare-fun lt!157293 () (_ BitVec 64))

(assert (=> b!327127 (= c!51083 (or (= lt!157293 k0!2497) (= (bvadd lt!157293 lt!157293) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!327128 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327128 (= e!201178 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!327129 () Bool)

(declare-fun e!201177 () Bool)

(declare-fun e!201174 () Bool)

(assert (=> b!327129 (= e!201177 e!201174)))

(declare-fun res!180225 () Bool)

(get-info :version)

(assert (=> b!327129 (= res!180225 (and ((_ is Intermediate!3062) lt!157294) (not (undefined!3874 lt!157294)) (bvslt (x!32679 lt!157294) #b01111111111111111111111111111110) (bvsge (x!32679 lt!157294) #b00000000000000000000000000000000) (bvsge (x!32679 lt!157294) #b00000000000000000000000000000000)))))

(assert (=> b!327129 (=> (not res!180225) (not e!201174))))

(declare-fun b!327130 () Bool)

(assert (=> b!327130 (and (bvsge (index!14426 lt!157294) #b00000000000000000000000000000000) (bvslt (index!14426 lt!157294) (size!8285 a!3305)))))

(declare-fun res!180226 () Bool)

(assert (=> b!327130 (= res!180226 (= (select (arr!7932 a!3305) (index!14426 lt!157294)) k0!2497))))

(assert (=> b!327130 (=> res!180226 e!201176)))

(assert (=> b!327130 (= e!201174 e!201176)))

(declare-fun d!69603 () Bool)

(assert (=> d!69603 e!201177))

(declare-fun c!51082 () Bool)

(assert (=> d!69603 (= c!51082 (and ((_ is Intermediate!3062) lt!157294) (undefined!3874 lt!157294)))))

(assert (=> d!69603 (= lt!157294 e!201175)))

(declare-fun c!51081 () Bool)

(assert (=> d!69603 (= c!51081 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!69603 (= lt!157293 (select (arr!7932 a!3305) (toIndex!0 k0!2497 mask!3777)))))

(assert (=> d!69603 (validMask!0 mask!3777)))

(assert (=> d!69603 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157294)))

(declare-fun b!327131 () Bool)

(assert (=> b!327131 (= e!201177 (bvsge (x!32679 lt!157294) #b01111111111111111111111111111110))))

(declare-fun b!327132 () Bool)

(assert (=> b!327132 (and (bvsge (index!14426 lt!157294) #b00000000000000000000000000000000) (bvslt (index!14426 lt!157294) (size!8285 a!3305)))))

(declare-fun res!180224 () Bool)

(assert (=> b!327132 (= res!180224 (= (select (arr!7932 a!3305) (index!14426 lt!157294)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!327132 (=> res!180224 e!201176)))

(assert (= (and d!69603 c!51081) b!327126))

(assert (= (and d!69603 (not c!51081)) b!327127))

(assert (= (and b!327127 c!51083) b!327125))

(assert (= (and b!327127 (not c!51083)) b!327128))

(assert (= (and d!69603 c!51082) b!327131))

(assert (= (and d!69603 (not c!51082)) b!327129))

(assert (= (and b!327129 res!180225) b!327130))

(assert (= (and b!327130 (not res!180226)) b!327132))

(assert (= (and b!327132 (not res!180224)) b!327124))

(declare-fun m!333043 () Bool)

(assert (=> b!327132 m!333043))

(assert (=> b!327124 m!333043))

(assert (=> b!327130 m!333043))

(assert (=> d!69603 m!332939))

(declare-fun m!333045 () Bool)

(assert (=> d!69603 m!333045))

(assert (=> d!69603 m!332947))

(assert (=> b!327128 m!332939))

(declare-fun m!333047 () Bool)

(assert (=> b!327128 m!333047))

(assert (=> b!327128 m!333047))

(declare-fun m!333049 () Bool)

(assert (=> b!327128 m!333049))

(assert (=> b!326950 d!69603))

(declare-fun d!69615 () Bool)

(declare-fun lt!157315 () (_ BitVec 32))

(declare-fun lt!157314 () (_ BitVec 32))

(assert (=> d!69615 (= lt!157315 (bvmul (bvxor lt!157314 (bvlshr lt!157314 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69615 (= lt!157314 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69615 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!180232 (let ((h!5367 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32687 (bvmul (bvxor h!5367 (bvlshr h!5367 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32687 (bvlshr x!32687 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!180232 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!180232 #b00000000000000000000000000000000))))))

(assert (=> d!69615 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!157315 (bvlshr lt!157315 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!326950 d!69615))

(declare-fun d!69623 () Bool)

(assert (=> d!69623 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32714 d!69623))

(declare-fun d!69633 () Bool)

(assert (=> d!69633 (= (array_inv!5904 a!3305) (bvsge (size!8285 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32714 d!69633))

(declare-fun d!69635 () Bool)

(assert (=> d!69635 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!326945 d!69635))

(declare-fun b!327163 () Bool)

(declare-fun lt!157326 () SeekEntryResult!3062)

(assert (=> b!327163 (and (bvsge (index!14426 lt!157326) #b00000000000000000000000000000000) (bvslt (index!14426 lt!157326) (size!8285 a!3305)))))

(declare-fun e!201205 () Bool)

(assert (=> b!327163 (= e!201205 (= (select (arr!7932 a!3305) (index!14426 lt!157326)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!327164 () Bool)

(declare-fun e!201207 () SeekEntryResult!3062)

(assert (=> b!327164 (= e!201207 (Intermediate!3062 false index!1840 x!1490))))

(declare-fun b!327165 () Bool)

(declare-fun e!201204 () SeekEntryResult!3062)

(assert (=> b!327165 (= e!201204 (Intermediate!3062 true index!1840 x!1490))))

(declare-fun b!327166 () Bool)

(assert (=> b!327166 (= e!201204 e!201207)))

(declare-fun c!51092 () Bool)

(declare-fun lt!157325 () (_ BitVec 64))

(assert (=> b!327166 (= c!51092 (or (= lt!157325 k0!2497) (= (bvadd lt!157325 lt!157325) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!327167 () Bool)

(assert (=> b!327167 (= e!201207 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!327168 () Bool)

(declare-fun e!201206 () Bool)

(declare-fun e!201203 () Bool)

(assert (=> b!327168 (= e!201206 e!201203)))

(declare-fun res!180248 () Bool)

(assert (=> b!327168 (= res!180248 (and ((_ is Intermediate!3062) lt!157326) (not (undefined!3874 lt!157326)) (bvslt (x!32679 lt!157326) #b01111111111111111111111111111110) (bvsge (x!32679 lt!157326) #b00000000000000000000000000000000) (bvsge (x!32679 lt!157326) x!1490)))))

(assert (=> b!327168 (=> (not res!180248) (not e!201203))))

(declare-fun b!327169 () Bool)

(assert (=> b!327169 (and (bvsge (index!14426 lt!157326) #b00000000000000000000000000000000) (bvslt (index!14426 lt!157326) (size!8285 a!3305)))))

(declare-fun res!180249 () Bool)

(assert (=> b!327169 (= res!180249 (= (select (arr!7932 a!3305) (index!14426 lt!157326)) k0!2497))))

(assert (=> b!327169 (=> res!180249 e!201205)))

(assert (=> b!327169 (= e!201203 e!201205)))

(declare-fun d!69637 () Bool)

(assert (=> d!69637 e!201206))

(declare-fun c!51091 () Bool)

(assert (=> d!69637 (= c!51091 (and ((_ is Intermediate!3062) lt!157326) (undefined!3874 lt!157326)))))

(assert (=> d!69637 (= lt!157326 e!201204)))

(declare-fun c!51090 () Bool)

(assert (=> d!69637 (= c!51090 (bvsge x!1490 #b01111111111111111111111111111110))))

(assert (=> d!69637 (= lt!157325 (select (arr!7932 a!3305) index!1840))))

(assert (=> d!69637 (validMask!0 mask!3777)))

(assert (=> d!69637 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157326)))

(declare-fun b!327170 () Bool)

(assert (=> b!327170 (= e!201206 (bvsge (x!32679 lt!157326) #b01111111111111111111111111111110))))

(declare-fun b!327171 () Bool)

(assert (=> b!327171 (and (bvsge (index!14426 lt!157326) #b00000000000000000000000000000000) (bvslt (index!14426 lt!157326) (size!8285 a!3305)))))

(declare-fun res!180247 () Bool)

(assert (=> b!327171 (= res!180247 (= (select (arr!7932 a!3305) (index!14426 lt!157326)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!327171 (=> res!180247 e!201205)))

(assert (= (and d!69637 c!51090) b!327165))

(assert (= (and d!69637 (not c!51090)) b!327166))

(assert (= (and b!327166 c!51092) b!327164))

(assert (= (and b!327166 (not c!51092)) b!327167))

(assert (= (and d!69637 c!51091) b!327170))

(assert (= (and d!69637 (not c!51091)) b!327168))

(assert (= (and b!327168 res!180248) b!327169))

(assert (= (and b!327169 (not res!180249)) b!327171))

(assert (= (and b!327171 (not res!180247)) b!327163))

(declare-fun m!333083 () Bool)

(assert (=> b!327171 m!333083))

(assert (=> b!327163 m!333083))

(assert (=> b!327169 m!333083))

(declare-fun m!333087 () Bool)

(assert (=> d!69637 m!333087))

(assert (=> d!69637 m!332947))

(declare-fun m!333089 () Bool)

(assert (=> b!327167 m!333089))

(assert (=> b!327167 m!333089))

(declare-fun m!333091 () Bool)

(assert (=> b!327167 m!333091))

(assert (=> b!326951 d!69637))

(declare-fun d!69641 () Bool)

(declare-fun lt!157345 () SeekEntryResult!3062)

(assert (=> d!69641 (and (or ((_ is Undefined!3062) lt!157345) (not ((_ is Found!3062) lt!157345)) (and (bvsge (index!14425 lt!157345) #b00000000000000000000000000000000) (bvslt (index!14425 lt!157345) (size!8285 a!3305)))) (or ((_ is Undefined!3062) lt!157345) ((_ is Found!3062) lt!157345) (not ((_ is MissingZero!3062) lt!157345)) (and (bvsge (index!14424 lt!157345) #b00000000000000000000000000000000) (bvslt (index!14424 lt!157345) (size!8285 a!3305)))) (or ((_ is Undefined!3062) lt!157345) ((_ is Found!3062) lt!157345) ((_ is MissingZero!3062) lt!157345) (not ((_ is MissingVacant!3062) lt!157345)) (and (bvsge (index!14427 lt!157345) #b00000000000000000000000000000000) (bvslt (index!14427 lt!157345) (size!8285 a!3305)))) (or ((_ is Undefined!3062) lt!157345) (ite ((_ is Found!3062) lt!157345) (= (select (arr!7932 a!3305) (index!14425 lt!157345)) k0!2497) (ite ((_ is MissingZero!3062) lt!157345) (= (select (arr!7932 a!3305) (index!14424 lt!157345)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3062) lt!157345) (= (select (arr!7932 a!3305) (index!14427 lt!157345)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!201233 () SeekEntryResult!3062)

(assert (=> d!69641 (= lt!157345 e!201233)))

(declare-fun c!51111 () Bool)

(declare-fun lt!157346 () SeekEntryResult!3062)

(assert (=> d!69641 (= c!51111 (and ((_ is Intermediate!3062) lt!157346) (undefined!3874 lt!157346)))))

(assert (=> d!69641 (= lt!157346 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!69641 (validMask!0 mask!3777)))

(assert (=> d!69641 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!157345)))

(declare-fun b!327215 () Bool)

(declare-fun e!201234 () SeekEntryResult!3062)

(assert (=> b!327215 (= e!201234 (Found!3062 (index!14426 lt!157346)))))

(declare-fun b!327216 () Bool)

(assert (=> b!327216 (= e!201233 e!201234)))

(declare-fun lt!157344 () (_ BitVec 64))

(assert (=> b!327216 (= lt!157344 (select (arr!7932 a!3305) (index!14426 lt!157346)))))

(declare-fun c!51112 () Bool)

(assert (=> b!327216 (= c!51112 (= lt!157344 k0!2497))))

(declare-fun b!327217 () Bool)

(declare-fun c!51113 () Bool)

(assert (=> b!327217 (= c!51113 (= lt!157344 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!201232 () SeekEntryResult!3062)

(assert (=> b!327217 (= e!201234 e!201232)))

(declare-fun b!327218 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16755 (_ BitVec 32)) SeekEntryResult!3062)

(assert (=> b!327218 (= e!201232 (seekKeyOrZeroReturnVacant!0 (x!32679 lt!157346) (index!14426 lt!157346) (index!14426 lt!157346) k0!2497 a!3305 mask!3777))))

(declare-fun b!327219 () Bool)

(assert (=> b!327219 (= e!201232 (MissingZero!3062 (index!14426 lt!157346)))))

(declare-fun b!327220 () Bool)

(assert (=> b!327220 (= e!201233 Undefined!3062)))

(assert (= (and d!69641 c!51111) b!327220))

(assert (= (and d!69641 (not c!51111)) b!327216))

(assert (= (and b!327216 c!51112) b!327215))

(assert (= (and b!327216 (not c!51112)) b!327217))

(assert (= (and b!327217 c!51113) b!327219))

(assert (= (and b!327217 (not c!51113)) b!327218))

(declare-fun m!333105 () Bool)

(assert (=> d!69641 m!333105))

(declare-fun m!333107 () Bool)

(assert (=> d!69641 m!333107))

(declare-fun m!333109 () Bool)

(assert (=> d!69641 m!333109))

(assert (=> d!69641 m!332947))

(assert (=> d!69641 m!332939))

(assert (=> d!69641 m!332941))

(assert (=> d!69641 m!332939))

(declare-fun m!333111 () Bool)

(assert (=> b!327216 m!333111))

(declare-fun m!333113 () Bool)

(assert (=> b!327218 m!333113))

(assert (=> b!326946 d!69641))

(check-sat (not d!69603) (not bm!26063) (not b!327024) (not b!327128) (not b!327012) (not b!327218) (not b!327167) (not d!69637) (not d!69641) (not b!327022))
(check-sat)
