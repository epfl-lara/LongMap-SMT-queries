; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33008 () Bool)

(assert start!33008)

(declare-datatypes ((array!16827 0))(
  ( (array!16828 (arr!7960 (Array (_ BitVec 32) (_ BitVec 64))) (size!8312 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16827)

(declare-datatypes ((SeekEntryResult!3056 0))(
  ( (MissingZero!3056 (index!14400 (_ BitVec 32))) (Found!3056 (index!14401 (_ BitVec 32))) (Intermediate!3056 (undefined!3868 Bool) (index!14402 (_ BitVec 32)) (x!32772 (_ BitVec 32))) (Undefined!3056) (MissingVacant!3056 (index!14403 (_ BitVec 32))) )
))
(declare-fun lt!158060 () SeekEntryResult!3056)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun b!328856 () Bool)

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun lt!158061 () SeekEntryResult!3056)

(declare-fun e!202067 () Bool)

(assert (=> b!328856 (= e!202067 (and (= lt!158061 lt!158060) (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7960 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (or (= (select (arr!7960 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7960 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!158061 (Intermediate!3056 false index!1840 resX!58)))))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16827 (_ BitVec 32)) SeekEntryResult!3056)

(assert (=> b!328856 (= lt!158061 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777))))

(declare-fun b!328857 () Bool)

(declare-fun res!181232 () Bool)

(declare-fun e!202066 () Bool)

(assert (=> b!328857 (=> (not res!181232) (not e!202066))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!328857 (= res!181232 (and (= (size!8312 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8312 a!3305))))))

(declare-fun b!328858 () Bool)

(declare-fun res!181237 () Bool)

(assert (=> b!328858 (=> (not res!181237) (not e!202066))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16827 (_ BitVec 32)) Bool)

(assert (=> b!328858 (= res!181237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!328859 () Bool)

(assert (=> b!328859 (= e!202066 e!202067)))

(declare-fun res!181236 () Bool)

(assert (=> b!328859 (=> (not res!181236) (not e!202067))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!328859 (= res!181236 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158060))))

(assert (=> b!328859 (= lt!158060 (Intermediate!3056 false resIndex!58 resX!58))))

(declare-fun b!328860 () Bool)

(declare-fun res!181238 () Bool)

(assert (=> b!328860 (=> (not res!181238) (not e!202067))))

(assert (=> b!328860 (= res!181238 (and (= (select (arr!7960 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8312 a!3305))))))

(declare-fun b!328861 () Bool)

(declare-fun res!181233 () Bool)

(assert (=> b!328861 (=> (not res!181233) (not e!202066))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!328861 (= res!181233 (validKeyInArray!0 k0!2497))))

(declare-fun res!181239 () Bool)

(assert (=> start!33008 (=> (not res!181239) (not e!202066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33008 (= res!181239 (validMask!0 mask!3777))))

(assert (=> start!33008 e!202066))

(declare-fun array_inv!5910 (array!16827) Bool)

(assert (=> start!33008 (array_inv!5910 a!3305)))

(assert (=> start!33008 true))

(declare-fun b!328862 () Bool)

(declare-fun res!181234 () Bool)

(assert (=> b!328862 (=> (not res!181234) (not e!202066))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16827 (_ BitVec 32)) SeekEntryResult!3056)

(assert (=> b!328862 (= res!181234 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3056 i!1250)))))

(declare-fun b!328863 () Bool)

(declare-fun res!181235 () Bool)

(assert (=> b!328863 (=> (not res!181235) (not e!202066))))

(declare-fun arrayContainsKey!0 (array!16827 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!328863 (= res!181235 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!33008 res!181239) b!328857))

(assert (= (and b!328857 res!181232) b!328861))

(assert (= (and b!328861 res!181233) b!328863))

(assert (= (and b!328863 res!181235) b!328862))

(assert (= (and b!328862 res!181234) b!328858))

(assert (= (and b!328858 res!181237) b!328859))

(assert (= (and b!328859 res!181236) b!328860))

(assert (= (and b!328860 res!181238) b!328856))

(declare-fun m!334945 () Bool)

(assert (=> b!328861 m!334945))

(declare-fun m!334947 () Bool)

(assert (=> b!328858 m!334947))

(declare-fun m!334949 () Bool)

(assert (=> start!33008 m!334949))

(declare-fun m!334951 () Bool)

(assert (=> start!33008 m!334951))

(declare-fun m!334953 () Bool)

(assert (=> b!328863 m!334953))

(declare-fun m!334955 () Bool)

(assert (=> b!328859 m!334955))

(assert (=> b!328859 m!334955))

(declare-fun m!334957 () Bool)

(assert (=> b!328859 m!334957))

(declare-fun m!334959 () Bool)

(assert (=> b!328860 m!334959))

(declare-fun m!334961 () Bool)

(assert (=> b!328862 m!334961))

(declare-fun m!334963 () Bool)

(assert (=> b!328856 m!334963))

(declare-fun m!334965 () Bool)

(assert (=> b!328856 m!334965))

(check-sat (not b!328856) (not b!328859) (not start!33008) (not b!328861) (not b!328858) (not b!328862) (not b!328863))
(check-sat)
(get-model)

(declare-fun d!70127 () Bool)

(assert (=> d!70127 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!328861 d!70127))

(declare-fun b!328960 () Bool)

(declare-fun e!202116 () Bool)

(declare-fun lt!158097 () SeekEntryResult!3056)

(assert (=> b!328960 (= e!202116 (bvsge (x!32772 lt!158097) #b01111111111111111111111111111110))))

(declare-fun b!328961 () Bool)

(declare-fun e!202117 () SeekEntryResult!3056)

(assert (=> b!328961 (= e!202117 (Intermediate!3056 true (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!328962 () Bool)

(declare-fun e!202115 () SeekEntryResult!3056)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!328962 (= e!202115 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2497 mask!3777) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!328963 () Bool)

(assert (=> b!328963 (and (bvsge (index!14402 lt!158097) #b00000000000000000000000000000000) (bvslt (index!14402 lt!158097) (size!8312 a!3305)))))

(declare-fun res!181302 () Bool)

(assert (=> b!328963 (= res!181302 (= (select (arr!7960 a!3305) (index!14402 lt!158097)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!202119 () Bool)

(assert (=> b!328963 (=> res!181302 e!202119)))

(declare-fun d!70129 () Bool)

(assert (=> d!70129 e!202116))

(declare-fun c!51469 () Bool)

(get-info :version)

(assert (=> d!70129 (= c!51469 (and ((_ is Intermediate!3056) lt!158097) (undefined!3868 lt!158097)))))

(assert (=> d!70129 (= lt!158097 e!202117)))

(declare-fun c!51470 () Bool)

(assert (=> d!70129 (= c!51470 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!158096 () (_ BitVec 64))

(assert (=> d!70129 (= lt!158096 (select (arr!7960 a!3305) (toIndex!0 k0!2497 mask!3777)))))

(assert (=> d!70129 (validMask!0 mask!3777)))

(assert (=> d!70129 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158097)))

(declare-fun b!328964 () Bool)

(assert (=> b!328964 (and (bvsge (index!14402 lt!158097) #b00000000000000000000000000000000) (bvslt (index!14402 lt!158097) (size!8312 a!3305)))))

(declare-fun res!181300 () Bool)

(assert (=> b!328964 (= res!181300 (= (select (arr!7960 a!3305) (index!14402 lt!158097)) k0!2497))))

(assert (=> b!328964 (=> res!181300 e!202119)))

(declare-fun e!202118 () Bool)

(assert (=> b!328964 (= e!202118 e!202119)))

(declare-fun b!328965 () Bool)

(assert (=> b!328965 (= e!202116 e!202118)))

(declare-fun res!181301 () Bool)

(assert (=> b!328965 (= res!181301 (and ((_ is Intermediate!3056) lt!158097) (not (undefined!3868 lt!158097)) (bvslt (x!32772 lt!158097) #b01111111111111111111111111111110) (bvsge (x!32772 lt!158097) #b00000000000000000000000000000000) (bvsge (x!32772 lt!158097) #b00000000000000000000000000000000)))))

(assert (=> b!328965 (=> (not res!181301) (not e!202118))))

(declare-fun b!328966 () Bool)

(assert (=> b!328966 (and (bvsge (index!14402 lt!158097) #b00000000000000000000000000000000) (bvslt (index!14402 lt!158097) (size!8312 a!3305)))))

(assert (=> b!328966 (= e!202119 (= (select (arr!7960 a!3305) (index!14402 lt!158097)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!328967 () Bool)

(assert (=> b!328967 (= e!202115 (Intermediate!3056 false (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!328968 () Bool)

(assert (=> b!328968 (= e!202117 e!202115)))

(declare-fun c!51468 () Bool)

(assert (=> b!328968 (= c!51468 (or (= lt!158096 k0!2497) (= (bvadd lt!158096 lt!158096) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!70129 c!51470) b!328961))

(assert (= (and d!70129 (not c!51470)) b!328968))

(assert (= (and b!328968 c!51468) b!328967))

(assert (= (and b!328968 (not c!51468)) b!328962))

(assert (= (and d!70129 c!51469) b!328960))

(assert (= (and d!70129 (not c!51469)) b!328965))

(assert (= (and b!328965 res!181301) b!328964))

(assert (= (and b!328964 (not res!181300)) b!328963))

(assert (= (and b!328963 (not res!181302)) b!328966))

(assert (=> d!70129 m!334955))

(declare-fun m!335033 () Bool)

(assert (=> d!70129 m!335033))

(assert (=> d!70129 m!334949))

(assert (=> b!328962 m!334955))

(declare-fun m!335035 () Bool)

(assert (=> b!328962 m!335035))

(assert (=> b!328962 m!335035))

(declare-fun m!335037 () Bool)

(assert (=> b!328962 m!335037))

(declare-fun m!335039 () Bool)

(assert (=> b!328963 m!335039))

(assert (=> b!328966 m!335039))

(assert (=> b!328964 m!335039))

(assert (=> b!328859 d!70129))

(declare-fun d!70139 () Bool)

(declare-fun lt!158107 () (_ BitVec 32))

(declare-fun lt!158106 () (_ BitVec 32))

(assert (=> d!70139 (= lt!158107 (bvmul (bvxor lt!158106 (bvlshr lt!158106 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!70139 (= lt!158106 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!70139 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!181303 (let ((h!5324 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32776 (bvmul (bvxor h!5324 (bvlshr h!5324 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32776 (bvlshr x!32776 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!181303 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!181303 #b00000000000000000000000000000000))))))

(assert (=> d!70139 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!158107 (bvlshr lt!158107 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!328859 d!70139))

(declare-fun d!70141 () Bool)

(assert (=> d!70141 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!33008 d!70141))

(declare-fun d!70147 () Bool)

(assert (=> d!70147 (= (array_inv!5910 a!3305) (bvsge (size!8312 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!33008 d!70147))

(declare-fun b!329040 () Bool)

(declare-fun e!202162 () Bool)

(declare-fun e!202163 () Bool)

(assert (=> b!329040 (= e!202162 e!202163)))

(declare-fun c!51494 () Bool)

(assert (=> b!329040 (= c!51494 (validKeyInArray!0 (select (arr!7960 a!3305) #b00000000000000000000000000000000)))))

(declare-fun b!329041 () Bool)

(declare-fun call!26126 () Bool)

(assert (=> b!329041 (= e!202163 call!26126)))

(declare-fun b!329042 () Bool)

(declare-fun e!202161 () Bool)

(assert (=> b!329042 (= e!202163 e!202161)))

(declare-fun lt!158137 () (_ BitVec 64))

(assert (=> b!329042 (= lt!158137 (select (arr!7960 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10164 0))(
  ( (Unit!10165) )
))
(declare-fun lt!158136 () Unit!10164)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16827 (_ BitVec 64) (_ BitVec 32)) Unit!10164)

(assert (=> b!329042 (= lt!158136 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!158137 #b00000000000000000000000000000000))))

(assert (=> b!329042 (arrayContainsKey!0 a!3305 lt!158137 #b00000000000000000000000000000000)))

(declare-fun lt!158138 () Unit!10164)

(assert (=> b!329042 (= lt!158138 lt!158136)))

(declare-fun res!181331 () Bool)

(assert (=> b!329042 (= res!181331 (= (seekEntryOrOpen!0 (select (arr!7960 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3056 #b00000000000000000000000000000000)))))

(assert (=> b!329042 (=> (not res!181331) (not e!202161))))

(declare-fun b!329043 () Bool)

(assert (=> b!329043 (= e!202161 call!26126)))

(declare-fun d!70149 () Bool)

(declare-fun res!181332 () Bool)

(assert (=> d!70149 (=> res!181332 e!202162)))

(assert (=> d!70149 (= res!181332 (bvsge #b00000000000000000000000000000000 (size!8312 a!3305)))))

(assert (=> d!70149 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!202162)))

(declare-fun bm!26123 () Bool)

(assert (=> bm!26123 (= call!26126 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(assert (= (and d!70149 (not res!181332)) b!329040))

(assert (= (and b!329040 c!51494) b!329042))

(assert (= (and b!329040 (not c!51494)) b!329041))

(assert (= (and b!329042 res!181331) b!329043))

(assert (= (or b!329043 b!329041) bm!26123))

(declare-fun m!335063 () Bool)

(assert (=> b!329040 m!335063))

(assert (=> b!329040 m!335063))

(declare-fun m!335065 () Bool)

(assert (=> b!329040 m!335065))

(assert (=> b!329042 m!335063))

(declare-fun m!335067 () Bool)

(assert (=> b!329042 m!335067))

(declare-fun m!335069 () Bool)

(assert (=> b!329042 m!335069))

(assert (=> b!329042 m!335063))

(declare-fun m!335071 () Bool)

(assert (=> b!329042 m!335071))

(declare-fun m!335073 () Bool)

(assert (=> bm!26123 m!335073))

(assert (=> b!328858 d!70149))

(declare-fun d!70159 () Bool)

(declare-fun res!181343 () Bool)

(declare-fun e!202174 () Bool)

(assert (=> d!70159 (=> res!181343 e!202174)))

(assert (=> d!70159 (= res!181343 (= (select (arr!7960 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!70159 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!202174)))

(declare-fun b!329054 () Bool)

(declare-fun e!202175 () Bool)

(assert (=> b!329054 (= e!202174 e!202175)))

(declare-fun res!181344 () Bool)

(assert (=> b!329054 (=> (not res!181344) (not e!202175))))

(assert (=> b!329054 (= res!181344 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8312 a!3305)))))

(declare-fun b!329055 () Bool)

(assert (=> b!329055 (= e!202175 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70159 (not res!181343)) b!329054))

(assert (= (and b!329054 res!181344) b!329055))

(assert (=> d!70159 m!335063))

(declare-fun m!335079 () Bool)

(assert (=> b!329055 m!335079))

(assert (=> b!328863 d!70159))

(declare-fun d!70163 () Bool)

(declare-fun lt!158167 () SeekEntryResult!3056)

(assert (=> d!70163 (and (or ((_ is Undefined!3056) lt!158167) (not ((_ is Found!3056) lt!158167)) (and (bvsge (index!14401 lt!158167) #b00000000000000000000000000000000) (bvslt (index!14401 lt!158167) (size!8312 a!3305)))) (or ((_ is Undefined!3056) lt!158167) ((_ is Found!3056) lt!158167) (not ((_ is MissingZero!3056) lt!158167)) (and (bvsge (index!14400 lt!158167) #b00000000000000000000000000000000) (bvslt (index!14400 lt!158167) (size!8312 a!3305)))) (or ((_ is Undefined!3056) lt!158167) ((_ is Found!3056) lt!158167) ((_ is MissingZero!3056) lt!158167) (not ((_ is MissingVacant!3056) lt!158167)) (and (bvsge (index!14403 lt!158167) #b00000000000000000000000000000000) (bvslt (index!14403 lt!158167) (size!8312 a!3305)))) (or ((_ is Undefined!3056) lt!158167) (ite ((_ is Found!3056) lt!158167) (= (select (arr!7960 a!3305) (index!14401 lt!158167)) k0!2497) (ite ((_ is MissingZero!3056) lt!158167) (= (select (arr!7960 a!3305) (index!14400 lt!158167)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3056) lt!158167) (= (select (arr!7960 a!3305) (index!14403 lt!158167)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!202213 () SeekEntryResult!3056)

(assert (=> d!70163 (= lt!158167 e!202213)))

(declare-fun c!51516 () Bool)

(declare-fun lt!158165 () SeekEntryResult!3056)

(assert (=> d!70163 (= c!51516 (and ((_ is Intermediate!3056) lt!158165) (undefined!3868 lt!158165)))))

(assert (=> d!70163 (= lt!158165 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!70163 (validMask!0 mask!3777)))

(assert (=> d!70163 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!158167)))

(declare-fun b!329113 () Bool)

(declare-fun e!202211 () SeekEntryResult!3056)

(assert (=> b!329113 (= e!202211 (MissingZero!3056 (index!14402 lt!158165)))))

(declare-fun b!329114 () Bool)

(declare-fun e!202212 () SeekEntryResult!3056)

(assert (=> b!329114 (= e!202213 e!202212)))

(declare-fun lt!158166 () (_ BitVec 64))

(assert (=> b!329114 (= lt!158166 (select (arr!7960 a!3305) (index!14402 lt!158165)))))

(declare-fun c!51518 () Bool)

(assert (=> b!329114 (= c!51518 (= lt!158166 k0!2497))))

(declare-fun b!329115 () Bool)

(assert (=> b!329115 (= e!202213 Undefined!3056)))

(declare-fun b!329116 () Bool)

(declare-fun c!51517 () Bool)

(assert (=> b!329116 (= c!51517 (= lt!158166 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!329116 (= e!202212 e!202211)))

(declare-fun b!329117 () Bool)

(assert (=> b!329117 (= e!202212 (Found!3056 (index!14402 lt!158165)))))

(declare-fun b!329118 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16827 (_ BitVec 32)) SeekEntryResult!3056)

(assert (=> b!329118 (= e!202211 (seekKeyOrZeroReturnVacant!0 (x!32772 lt!158165) (index!14402 lt!158165) (index!14402 lt!158165) k0!2497 a!3305 mask!3777))))

(assert (= (and d!70163 c!51516) b!329115))

(assert (= (and d!70163 (not c!51516)) b!329114))

(assert (= (and b!329114 c!51518) b!329117))

(assert (= (and b!329114 (not c!51518)) b!329116))

(assert (= (and b!329116 c!51517) b!329113))

(assert (= (and b!329116 (not c!51517)) b!329118))

(declare-fun m!335109 () Bool)

(assert (=> d!70163 m!335109))

(declare-fun m!335111 () Bool)

(assert (=> d!70163 m!335111))

(assert (=> d!70163 m!334955))

(assert (=> d!70163 m!334955))

(assert (=> d!70163 m!334957))

(assert (=> d!70163 m!334949))

(declare-fun m!335113 () Bool)

(assert (=> d!70163 m!335113))

(declare-fun m!335115 () Bool)

(assert (=> b!329114 m!335115))

(declare-fun m!335117 () Bool)

(assert (=> b!329118 m!335117))

(assert (=> b!328862 d!70163))

(declare-fun b!329119 () Bool)

(declare-fun e!202215 () Bool)

(declare-fun lt!158169 () SeekEntryResult!3056)

(assert (=> b!329119 (= e!202215 (bvsge (x!32772 lt!158169) #b01111111111111111111111111111110))))

(declare-fun b!329120 () Bool)

(declare-fun e!202216 () SeekEntryResult!3056)

(assert (=> b!329120 (= e!202216 (Intermediate!3056 true index!1840 x!1490))))

(declare-fun b!329121 () Bool)

(declare-fun e!202214 () SeekEntryResult!3056)

(assert (=> b!329121 (= e!202214 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 (bvadd x!1490 #b00000000000000000000000000000001) mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!329122 () Bool)

(assert (=> b!329122 (and (bvsge (index!14402 lt!158169) #b00000000000000000000000000000000) (bvslt (index!14402 lt!158169) (size!8312 a!3305)))))

(declare-fun res!181362 () Bool)

(assert (=> b!329122 (= res!181362 (= (select (arr!7960 a!3305) (index!14402 lt!158169)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!202218 () Bool)

(assert (=> b!329122 (=> res!181362 e!202218)))

(declare-fun d!70173 () Bool)

(assert (=> d!70173 e!202215))

(declare-fun c!51520 () Bool)

(assert (=> d!70173 (= c!51520 (and ((_ is Intermediate!3056) lt!158169) (undefined!3868 lt!158169)))))

(assert (=> d!70173 (= lt!158169 e!202216)))

(declare-fun c!51521 () Bool)

(assert (=> d!70173 (= c!51521 (bvsge x!1490 #b01111111111111111111111111111110))))

(declare-fun lt!158168 () (_ BitVec 64))

(assert (=> d!70173 (= lt!158168 (select (arr!7960 a!3305) index!1840))))

(assert (=> d!70173 (validMask!0 mask!3777)))

(assert (=> d!70173 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!158169)))

(declare-fun b!329123 () Bool)

(assert (=> b!329123 (and (bvsge (index!14402 lt!158169) #b00000000000000000000000000000000) (bvslt (index!14402 lt!158169) (size!8312 a!3305)))))

(declare-fun res!181360 () Bool)

(assert (=> b!329123 (= res!181360 (= (select (arr!7960 a!3305) (index!14402 lt!158169)) k0!2497))))

(assert (=> b!329123 (=> res!181360 e!202218)))

(declare-fun e!202217 () Bool)

(assert (=> b!329123 (= e!202217 e!202218)))

(declare-fun b!329124 () Bool)

(assert (=> b!329124 (= e!202215 e!202217)))

(declare-fun res!181361 () Bool)

(assert (=> b!329124 (= res!181361 (and ((_ is Intermediate!3056) lt!158169) (not (undefined!3868 lt!158169)) (bvslt (x!32772 lt!158169) #b01111111111111111111111111111110) (bvsge (x!32772 lt!158169) #b00000000000000000000000000000000) (bvsge (x!32772 lt!158169) x!1490)))))

(assert (=> b!329124 (=> (not res!181361) (not e!202217))))

(declare-fun b!329125 () Bool)

(assert (=> b!329125 (and (bvsge (index!14402 lt!158169) #b00000000000000000000000000000000) (bvslt (index!14402 lt!158169) (size!8312 a!3305)))))

(assert (=> b!329125 (= e!202218 (= (select (arr!7960 a!3305) (index!14402 lt!158169)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!329126 () Bool)

(assert (=> b!329126 (= e!202214 (Intermediate!3056 false index!1840 x!1490))))

(declare-fun b!329127 () Bool)

(assert (=> b!329127 (= e!202216 e!202214)))

(declare-fun c!51519 () Bool)

(assert (=> b!329127 (= c!51519 (or (= lt!158168 k0!2497) (= (bvadd lt!158168 lt!158168) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!70173 c!51521) b!329120))

(assert (= (and d!70173 (not c!51521)) b!329127))

(assert (= (and b!329127 c!51519) b!329126))

(assert (= (and b!329127 (not c!51519)) b!329121))

(assert (= (and d!70173 c!51520) b!329119))

(assert (= (and d!70173 (not c!51520)) b!329124))

(assert (= (and b!329124 res!181361) b!329123))

(assert (= (and b!329123 (not res!181360)) b!329122))

(assert (= (and b!329122 (not res!181362)) b!329125))

(assert (=> d!70173 m!334963))

(assert (=> d!70173 m!334949))

(declare-fun m!335119 () Bool)

(assert (=> b!329121 m!335119))

(assert (=> b!329121 m!335119))

(declare-fun m!335121 () Bool)

(assert (=> b!329121 m!335121))

(declare-fun m!335123 () Bool)

(assert (=> b!329122 m!335123))

(assert (=> b!329125 m!335123))

(assert (=> b!329123 m!335123))

(assert (=> b!328856 d!70173))

(check-sat (not d!70173) (not b!329042) (not d!70129) (not b!329118) (not bm!26123) (not b!329121) (not d!70163) (not b!328962) (not b!329040) (not b!329055))
(check-sat)
