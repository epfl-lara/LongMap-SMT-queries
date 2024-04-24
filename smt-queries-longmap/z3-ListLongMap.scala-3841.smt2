; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52842 () Bool)

(assert start!52842)

(declare-fun b!576001 () Bool)

(declare-fun e!331440 () Bool)

(declare-fun e!331439 () Bool)

(assert (=> b!576001 (= e!331440 e!331439)))

(declare-fun res!364319 () Bool)

(assert (=> b!576001 (=> (not res!364319) (not e!331439))))

(declare-fun lt!263547 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5653 0))(
  ( (MissingZero!5653 (index!24839 (_ BitVec 32))) (Found!5653 (index!24840 (_ BitVec 32))) (Intermediate!5653 (undefined!6465 Bool) (index!24841 (_ BitVec 32)) (x!53881 (_ BitVec 32))) (Undefined!5653) (MissingVacant!5653 (index!24842 (_ BitVec 32))) )
))
(declare-fun lt!263551 () SeekEntryResult!5653)

(declare-datatypes ((array!35934 0))(
  ( (array!35935 (arr!17248 (Array (_ BitVec 32) (_ BitVec 64))) (size!17612 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35934)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35934 (_ BitVec 32)) SeekEntryResult!5653)

(assert (=> b!576001 (= res!364319 (= lt!263551 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263547 (select (store (arr!17248 a!3118) i!1132 k0!1914) j!142) (array!35935 (store (arr!17248 a!3118) i!1132 k0!1914) (size!17612 a!3118)) mask!3119)))))

(declare-fun lt!263549 () (_ BitVec 32))

(assert (=> b!576001 (= lt!263551 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263549 (select (arr!17248 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!576001 (= lt!263547 (toIndex!0 (select (store (arr!17248 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!576001 (= lt!263549 (toIndex!0 (select (arr!17248 a!3118) j!142) mask!3119))))

(declare-fun res!364318 () Bool)

(declare-fun e!331436 () Bool)

(assert (=> start!52842 (=> (not res!364318) (not e!331436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52842 (= res!364318 (validMask!0 mask!3119))))

(assert (=> start!52842 e!331436))

(assert (=> start!52842 true))

(declare-fun array_inv!13107 (array!35934) Bool)

(assert (=> start!52842 (array_inv!13107 a!3118)))

(declare-fun b!576002 () Bool)

(assert (=> b!576002 (= e!331436 e!331440)))

(declare-fun res!364315 () Bool)

(assert (=> b!576002 (=> (not res!364315) (not e!331440))))

(declare-fun lt!263546 () SeekEntryResult!5653)

(assert (=> b!576002 (= res!364315 (or (= lt!263546 (MissingZero!5653 i!1132)) (= lt!263546 (MissingVacant!5653 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35934 (_ BitVec 32)) SeekEntryResult!5653)

(assert (=> b!576002 (= lt!263546 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!576003 () Bool)

(declare-fun res!364317 () Bool)

(assert (=> b!576003 (=> (not res!364317) (not e!331436))))

(assert (=> b!576003 (= res!364317 (and (= (size!17612 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17612 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17612 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!576004 () Bool)

(declare-fun lt!263550 () Bool)

(assert (=> b!576004 (= e!331439 (not (or (and (not lt!263550) (undefined!6465 lt!263551)) (and (not lt!263550) (not (undefined!6465 lt!263551))))))))

(get-info :version)

(assert (=> b!576004 (= lt!263550 (not ((_ is Intermediate!5653) lt!263551)))))

(declare-fun e!331437 () Bool)

(assert (=> b!576004 e!331437))

(declare-fun res!364316 () Bool)

(assert (=> b!576004 (=> (not res!364316) (not e!331437))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35934 (_ BitVec 32)) Bool)

(assert (=> b!576004 (= res!364316 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!18079 0))(
  ( (Unit!18080) )
))
(declare-fun lt!263548 () Unit!18079)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35934 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18079)

(assert (=> b!576004 (= lt!263548 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!576005 () Bool)

(declare-fun res!364320 () Bool)

(assert (=> b!576005 (=> (not res!364320) (not e!331436))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576005 (= res!364320 (validKeyInArray!0 (select (arr!17248 a!3118) j!142)))))

(declare-fun b!576006 () Bool)

(declare-fun res!364314 () Bool)

(assert (=> b!576006 (=> (not res!364314) (not e!331436))))

(assert (=> b!576006 (= res!364314 (validKeyInArray!0 k0!1914))))

(declare-fun b!576007 () Bool)

(declare-fun res!364321 () Bool)

(assert (=> b!576007 (=> (not res!364321) (not e!331440))))

(declare-datatypes ((List!11235 0))(
  ( (Nil!11232) (Cons!11231 (h!12273 (_ BitVec 64)) (t!17455 List!11235)) )
))
(declare-fun arrayNoDuplicates!0 (array!35934 (_ BitVec 32) List!11235) Bool)

(assert (=> b!576007 (= res!364321 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11232))))

(declare-fun b!576008 () Bool)

(declare-fun res!364313 () Bool)

(assert (=> b!576008 (=> (not res!364313) (not e!331440))))

(assert (=> b!576008 (= res!364313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!576009 () Bool)

(assert (=> b!576009 (= e!331437 (= (seekEntryOrOpen!0 (select (arr!17248 a!3118) j!142) a!3118 mask!3119) (Found!5653 j!142)))))

(declare-fun b!576010 () Bool)

(declare-fun res!364312 () Bool)

(assert (=> b!576010 (=> (not res!364312) (not e!331436))))

(declare-fun arrayContainsKey!0 (array!35934 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!576010 (= res!364312 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!52842 res!364318) b!576003))

(assert (= (and b!576003 res!364317) b!576005))

(assert (= (and b!576005 res!364320) b!576006))

(assert (= (and b!576006 res!364314) b!576010))

(assert (= (and b!576010 res!364312) b!576002))

(assert (= (and b!576002 res!364315) b!576008))

(assert (= (and b!576008 res!364313) b!576007))

(assert (= (and b!576007 res!364321) b!576001))

(assert (= (and b!576001 res!364319) b!576004))

(assert (= (and b!576004 res!364316) b!576009))

(declare-fun m!555119 () Bool)

(assert (=> b!576002 m!555119))

(declare-fun m!555121 () Bool)

(assert (=> b!576007 m!555121))

(declare-fun m!555123 () Bool)

(assert (=> start!52842 m!555123))

(declare-fun m!555125 () Bool)

(assert (=> start!52842 m!555125))

(declare-fun m!555127 () Bool)

(assert (=> b!576004 m!555127))

(declare-fun m!555129 () Bool)

(assert (=> b!576004 m!555129))

(declare-fun m!555131 () Bool)

(assert (=> b!576005 m!555131))

(assert (=> b!576005 m!555131))

(declare-fun m!555133 () Bool)

(assert (=> b!576005 m!555133))

(declare-fun m!555135 () Bool)

(assert (=> b!576006 m!555135))

(declare-fun m!555137 () Bool)

(assert (=> b!576008 m!555137))

(declare-fun m!555139 () Bool)

(assert (=> b!576010 m!555139))

(assert (=> b!576001 m!555131))

(declare-fun m!555141 () Bool)

(assert (=> b!576001 m!555141))

(assert (=> b!576001 m!555131))

(declare-fun m!555143 () Bool)

(assert (=> b!576001 m!555143))

(declare-fun m!555145 () Bool)

(assert (=> b!576001 m!555145))

(assert (=> b!576001 m!555143))

(assert (=> b!576001 m!555131))

(declare-fun m!555147 () Bool)

(assert (=> b!576001 m!555147))

(declare-fun m!555149 () Bool)

(assert (=> b!576001 m!555149))

(assert (=> b!576001 m!555143))

(declare-fun m!555151 () Bool)

(assert (=> b!576001 m!555151))

(assert (=> b!576009 m!555131))

(assert (=> b!576009 m!555131))

(declare-fun m!555153 () Bool)

(assert (=> b!576009 m!555153))

(check-sat (not b!576009) (not b!576006) (not b!576007) (not b!576002) (not b!576001) (not start!52842) (not b!576008) (not b!576010) (not b!576004) (not b!576005))
(check-sat)
(get-model)

(declare-fun d!85413 () Bool)

(assert (=> d!85413 (= (validKeyInArray!0 (select (arr!17248 a!3118) j!142)) (and (not (= (select (arr!17248 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17248 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!576005 d!85413))

(declare-fun d!85415 () Bool)

(declare-fun res!364386 () Bool)

(declare-fun e!331475 () Bool)

(assert (=> d!85415 (=> res!364386 e!331475)))

(assert (=> d!85415 (= res!364386 (= (select (arr!17248 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!85415 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!331475)))

(declare-fun b!576075 () Bool)

(declare-fun e!331476 () Bool)

(assert (=> b!576075 (= e!331475 e!331476)))

(declare-fun res!364387 () Bool)

(assert (=> b!576075 (=> (not res!364387) (not e!331476))))

(assert (=> b!576075 (= res!364387 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17612 a!3118)))))

(declare-fun b!576076 () Bool)

(assert (=> b!576076 (= e!331476 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!85415 (not res!364386)) b!576075))

(assert (= (and b!576075 res!364387) b!576076))

(declare-fun m!555227 () Bool)

(assert (=> d!85415 m!555227))

(declare-fun m!555229 () Bool)

(assert (=> b!576076 m!555229))

(assert (=> b!576010 d!85415))

(declare-fun d!85417 () Bool)

(declare-fun res!364393 () Bool)

(declare-fun e!331483 () Bool)

(assert (=> d!85417 (=> res!364393 e!331483)))

(assert (=> d!85417 (= res!364393 (bvsge j!142 (size!17612 a!3118)))))

(assert (=> d!85417 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!331483)))

(declare-fun b!576085 () Bool)

(declare-fun e!331485 () Bool)

(declare-fun call!32715 () Bool)

(assert (=> b!576085 (= e!331485 call!32715)))

(declare-fun bm!32712 () Bool)

(assert (=> bm!32712 (= call!32715 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!576086 () Bool)

(declare-fun e!331484 () Bool)

(assert (=> b!576086 (= e!331484 e!331485)))

(declare-fun lt!263596 () (_ BitVec 64))

(assert (=> b!576086 (= lt!263596 (select (arr!17248 a!3118) j!142))))

(declare-fun lt!263595 () Unit!18079)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35934 (_ BitVec 64) (_ BitVec 32)) Unit!18079)

(assert (=> b!576086 (= lt!263595 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!263596 j!142))))

(assert (=> b!576086 (arrayContainsKey!0 a!3118 lt!263596 #b00000000000000000000000000000000)))

(declare-fun lt!263594 () Unit!18079)

(assert (=> b!576086 (= lt!263594 lt!263595)))

(declare-fun res!364392 () Bool)

(assert (=> b!576086 (= res!364392 (= (seekEntryOrOpen!0 (select (arr!17248 a!3118) j!142) a!3118 mask!3119) (Found!5653 j!142)))))

(assert (=> b!576086 (=> (not res!364392) (not e!331485))))

(declare-fun b!576087 () Bool)

(assert (=> b!576087 (= e!331483 e!331484)))

(declare-fun c!66212 () Bool)

(assert (=> b!576087 (= c!66212 (validKeyInArray!0 (select (arr!17248 a!3118) j!142)))))

(declare-fun b!576088 () Bool)

(assert (=> b!576088 (= e!331484 call!32715)))

(assert (= (and d!85417 (not res!364393)) b!576087))

(assert (= (and b!576087 c!66212) b!576086))

(assert (= (and b!576087 (not c!66212)) b!576088))

(assert (= (and b!576086 res!364392) b!576085))

(assert (= (or b!576085 b!576088) bm!32712))

(declare-fun m!555231 () Bool)

(assert (=> bm!32712 m!555231))

(assert (=> b!576086 m!555131))

(declare-fun m!555233 () Bool)

(assert (=> b!576086 m!555233))

(declare-fun m!555235 () Bool)

(assert (=> b!576086 m!555235))

(assert (=> b!576086 m!555131))

(assert (=> b!576086 m!555153))

(assert (=> b!576087 m!555131))

(assert (=> b!576087 m!555131))

(assert (=> b!576087 m!555133))

(assert (=> b!576004 d!85417))

(declare-fun d!85425 () Bool)

(assert (=> d!85425 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!263599 () Unit!18079)

(declare-fun choose!38 (array!35934 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18079)

(assert (=> d!85425 (= lt!263599 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!85425 (validMask!0 mask!3119)))

(assert (=> d!85425 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!263599)))

(declare-fun bs!17819 () Bool)

(assert (= bs!17819 d!85425))

(assert (=> bs!17819 m!555127))

(declare-fun m!555245 () Bool)

(assert (=> bs!17819 m!555245))

(assert (=> bs!17819 m!555123))

(assert (=> b!576004 d!85425))

(declare-fun e!331535 () SeekEntryResult!5653)

(declare-fun b!576164 () Bool)

(declare-fun lt!263623 () SeekEntryResult!5653)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35934 (_ BitVec 32)) SeekEntryResult!5653)

(assert (=> b!576164 (= e!331535 (seekKeyOrZeroReturnVacant!0 (x!53881 lt!263623) (index!24841 lt!263623) (index!24841 lt!263623) (select (arr!17248 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!576165 () Bool)

(declare-fun c!66239 () Bool)

(declare-fun lt!263624 () (_ BitVec 64))

(assert (=> b!576165 (= c!66239 (= lt!263624 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!331533 () SeekEntryResult!5653)

(assert (=> b!576165 (= e!331533 e!331535)))

(declare-fun b!576166 () Bool)

(assert (=> b!576166 (= e!331535 (MissingZero!5653 (index!24841 lt!263623)))))

(declare-fun b!576167 () Bool)

(declare-fun e!331534 () SeekEntryResult!5653)

(assert (=> b!576167 (= e!331534 Undefined!5653)))

(declare-fun d!85429 () Bool)

(declare-fun lt!263625 () SeekEntryResult!5653)

(assert (=> d!85429 (and (or ((_ is Undefined!5653) lt!263625) (not ((_ is Found!5653) lt!263625)) (and (bvsge (index!24840 lt!263625) #b00000000000000000000000000000000) (bvslt (index!24840 lt!263625) (size!17612 a!3118)))) (or ((_ is Undefined!5653) lt!263625) ((_ is Found!5653) lt!263625) (not ((_ is MissingZero!5653) lt!263625)) (and (bvsge (index!24839 lt!263625) #b00000000000000000000000000000000) (bvslt (index!24839 lt!263625) (size!17612 a!3118)))) (or ((_ is Undefined!5653) lt!263625) ((_ is Found!5653) lt!263625) ((_ is MissingZero!5653) lt!263625) (not ((_ is MissingVacant!5653) lt!263625)) (and (bvsge (index!24842 lt!263625) #b00000000000000000000000000000000) (bvslt (index!24842 lt!263625) (size!17612 a!3118)))) (or ((_ is Undefined!5653) lt!263625) (ite ((_ is Found!5653) lt!263625) (= (select (arr!17248 a!3118) (index!24840 lt!263625)) (select (arr!17248 a!3118) j!142)) (ite ((_ is MissingZero!5653) lt!263625) (= (select (arr!17248 a!3118) (index!24839 lt!263625)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5653) lt!263625) (= (select (arr!17248 a!3118) (index!24842 lt!263625)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85429 (= lt!263625 e!331534)))

(declare-fun c!66238 () Bool)

(assert (=> d!85429 (= c!66238 (and ((_ is Intermediate!5653) lt!263623) (undefined!6465 lt!263623)))))

(assert (=> d!85429 (= lt!263623 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17248 a!3118) j!142) mask!3119) (select (arr!17248 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!85429 (validMask!0 mask!3119)))

(assert (=> d!85429 (= (seekEntryOrOpen!0 (select (arr!17248 a!3118) j!142) a!3118 mask!3119) lt!263625)))

(declare-fun b!576168 () Bool)

(assert (=> b!576168 (= e!331533 (Found!5653 (index!24841 lt!263623)))))

(declare-fun b!576169 () Bool)

(assert (=> b!576169 (= e!331534 e!331533)))

(assert (=> b!576169 (= lt!263624 (select (arr!17248 a!3118) (index!24841 lt!263623)))))

(declare-fun c!66237 () Bool)

(assert (=> b!576169 (= c!66237 (= lt!263624 (select (arr!17248 a!3118) j!142)))))

(assert (= (and d!85429 c!66238) b!576167))

(assert (= (and d!85429 (not c!66238)) b!576169))

(assert (= (and b!576169 c!66237) b!576168))

(assert (= (and b!576169 (not c!66237)) b!576165))

(assert (= (and b!576165 c!66239) b!576166))

(assert (= (and b!576165 (not c!66239)) b!576164))

(assert (=> b!576164 m!555131))

(declare-fun m!555271 () Bool)

(assert (=> b!576164 m!555271))

(assert (=> d!85429 m!555131))

(assert (=> d!85429 m!555141))

(assert (=> d!85429 m!555141))

(assert (=> d!85429 m!555131))

(declare-fun m!555273 () Bool)

(assert (=> d!85429 m!555273))

(declare-fun m!555275 () Bool)

(assert (=> d!85429 m!555275))

(declare-fun m!555277 () Bool)

(assert (=> d!85429 m!555277))

(assert (=> d!85429 m!555123))

(declare-fun m!555279 () Bool)

(assert (=> d!85429 m!555279))

(declare-fun m!555281 () Bool)

(assert (=> b!576169 m!555281))

(assert (=> b!576009 d!85429))

(declare-fun d!85437 () Bool)

(declare-fun res!364423 () Bool)

(declare-fun e!331536 () Bool)

(assert (=> d!85437 (=> res!364423 e!331536)))

(assert (=> d!85437 (= res!364423 (bvsge #b00000000000000000000000000000000 (size!17612 a!3118)))))

(assert (=> d!85437 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!331536)))

(declare-fun b!576170 () Bool)

(declare-fun e!331538 () Bool)

(declare-fun call!32722 () Bool)

(assert (=> b!576170 (= e!331538 call!32722)))

(declare-fun bm!32719 () Bool)

(assert (=> bm!32719 (= call!32722 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!576171 () Bool)

(declare-fun e!331537 () Bool)

(assert (=> b!576171 (= e!331537 e!331538)))

(declare-fun lt!263628 () (_ BitVec 64))

(assert (=> b!576171 (= lt!263628 (select (arr!17248 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!263627 () Unit!18079)

(assert (=> b!576171 (= lt!263627 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!263628 #b00000000000000000000000000000000))))

(assert (=> b!576171 (arrayContainsKey!0 a!3118 lt!263628 #b00000000000000000000000000000000)))

(declare-fun lt!263626 () Unit!18079)

(assert (=> b!576171 (= lt!263626 lt!263627)))

(declare-fun res!364422 () Bool)

(assert (=> b!576171 (= res!364422 (= (seekEntryOrOpen!0 (select (arr!17248 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5653 #b00000000000000000000000000000000)))))

(assert (=> b!576171 (=> (not res!364422) (not e!331538))))

(declare-fun b!576172 () Bool)

(assert (=> b!576172 (= e!331536 e!331537)))

(declare-fun c!66240 () Bool)

(assert (=> b!576172 (= c!66240 (validKeyInArray!0 (select (arr!17248 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!576173 () Bool)

(assert (=> b!576173 (= e!331537 call!32722)))

(assert (= (and d!85437 (not res!364423)) b!576172))

(assert (= (and b!576172 c!66240) b!576171))

(assert (= (and b!576172 (not c!66240)) b!576173))

(assert (= (and b!576171 res!364422) b!576170))

(assert (= (or b!576170 b!576173) bm!32719))

(declare-fun m!555283 () Bool)

(assert (=> bm!32719 m!555283))

(assert (=> b!576171 m!555227))

(declare-fun m!555285 () Bool)

(assert (=> b!576171 m!555285))

(declare-fun m!555287 () Bool)

(assert (=> b!576171 m!555287))

(assert (=> b!576171 m!555227))

(declare-fun m!555289 () Bool)

(assert (=> b!576171 m!555289))

(assert (=> b!576172 m!555227))

(assert (=> b!576172 m!555227))

(declare-fun m!555291 () Bool)

(assert (=> b!576172 m!555291))

(assert (=> b!576008 d!85437))

(declare-fun d!85439 () Bool)

(assert (=> d!85439 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52842 d!85439))

(declare-fun d!85447 () Bool)

(assert (=> d!85447 (= (array_inv!13107 a!3118) (bvsge (size!17612 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52842 d!85447))

(declare-fun lt!263645 () SeekEntryResult!5653)

(declare-fun e!331561 () SeekEntryResult!5653)

(declare-fun b!576210 () Bool)

(assert (=> b!576210 (= e!331561 (seekKeyOrZeroReturnVacant!0 (x!53881 lt!263645) (index!24841 lt!263645) (index!24841 lt!263645) k0!1914 a!3118 mask!3119))))

(declare-fun b!576211 () Bool)

(declare-fun c!66255 () Bool)

(declare-fun lt!263646 () (_ BitVec 64))

(assert (=> b!576211 (= c!66255 (= lt!263646 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!331559 () SeekEntryResult!5653)

(assert (=> b!576211 (= e!331559 e!331561)))

(declare-fun b!576212 () Bool)

(assert (=> b!576212 (= e!331561 (MissingZero!5653 (index!24841 lt!263645)))))

(declare-fun b!576213 () Bool)

(declare-fun e!331560 () SeekEntryResult!5653)

(assert (=> b!576213 (= e!331560 Undefined!5653)))

(declare-fun d!85449 () Bool)

(declare-fun lt!263647 () SeekEntryResult!5653)

(assert (=> d!85449 (and (or ((_ is Undefined!5653) lt!263647) (not ((_ is Found!5653) lt!263647)) (and (bvsge (index!24840 lt!263647) #b00000000000000000000000000000000) (bvslt (index!24840 lt!263647) (size!17612 a!3118)))) (or ((_ is Undefined!5653) lt!263647) ((_ is Found!5653) lt!263647) (not ((_ is MissingZero!5653) lt!263647)) (and (bvsge (index!24839 lt!263647) #b00000000000000000000000000000000) (bvslt (index!24839 lt!263647) (size!17612 a!3118)))) (or ((_ is Undefined!5653) lt!263647) ((_ is Found!5653) lt!263647) ((_ is MissingZero!5653) lt!263647) (not ((_ is MissingVacant!5653) lt!263647)) (and (bvsge (index!24842 lt!263647) #b00000000000000000000000000000000) (bvslt (index!24842 lt!263647) (size!17612 a!3118)))) (or ((_ is Undefined!5653) lt!263647) (ite ((_ is Found!5653) lt!263647) (= (select (arr!17248 a!3118) (index!24840 lt!263647)) k0!1914) (ite ((_ is MissingZero!5653) lt!263647) (= (select (arr!17248 a!3118) (index!24839 lt!263647)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5653) lt!263647) (= (select (arr!17248 a!3118) (index!24842 lt!263647)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85449 (= lt!263647 e!331560)))

(declare-fun c!66254 () Bool)

(assert (=> d!85449 (= c!66254 (and ((_ is Intermediate!5653) lt!263645) (undefined!6465 lt!263645)))))

(assert (=> d!85449 (= lt!263645 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!85449 (validMask!0 mask!3119)))

(assert (=> d!85449 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!263647)))

(declare-fun b!576214 () Bool)

(assert (=> b!576214 (= e!331559 (Found!5653 (index!24841 lt!263645)))))

(declare-fun b!576215 () Bool)

(assert (=> b!576215 (= e!331560 e!331559)))

(assert (=> b!576215 (= lt!263646 (select (arr!17248 a!3118) (index!24841 lt!263645)))))

(declare-fun c!66253 () Bool)

(assert (=> b!576215 (= c!66253 (= lt!263646 k0!1914))))

(assert (= (and d!85449 c!66254) b!576213))

(assert (= (and d!85449 (not c!66254)) b!576215))

(assert (= (and b!576215 c!66253) b!576214))

(assert (= (and b!576215 (not c!66253)) b!576211))

(assert (= (and b!576211 c!66255) b!576212))

(assert (= (and b!576211 (not c!66255)) b!576210))

(declare-fun m!555309 () Bool)

(assert (=> b!576210 m!555309))

(declare-fun m!555311 () Bool)

(assert (=> d!85449 m!555311))

(assert (=> d!85449 m!555311))

(declare-fun m!555313 () Bool)

(assert (=> d!85449 m!555313))

(declare-fun m!555315 () Bool)

(assert (=> d!85449 m!555315))

(declare-fun m!555317 () Bool)

(assert (=> d!85449 m!555317))

(assert (=> d!85449 m!555123))

(declare-fun m!555319 () Bool)

(assert (=> d!85449 m!555319))

(declare-fun m!555321 () Bool)

(assert (=> b!576215 m!555321))

(assert (=> b!576002 d!85449))

(declare-fun b!576226 () Bool)

(declare-fun e!331572 () Bool)

(declare-fun contains!2867 (List!11235 (_ BitVec 64)) Bool)

(assert (=> b!576226 (= e!331572 (contains!2867 Nil!11232 (select (arr!17248 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!576227 () Bool)

(declare-fun e!331570 () Bool)

(declare-fun call!32725 () Bool)

(assert (=> b!576227 (= e!331570 call!32725)))

(declare-fun bm!32722 () Bool)

(declare-fun c!66258 () Bool)

(assert (=> bm!32722 (= call!32725 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!66258 (Cons!11231 (select (arr!17248 a!3118) #b00000000000000000000000000000000) Nil!11232) Nil!11232)))))

(declare-fun b!576228 () Bool)

(declare-fun e!331573 () Bool)

(assert (=> b!576228 (= e!331573 e!331570)))

(assert (=> b!576228 (= c!66258 (validKeyInArray!0 (select (arr!17248 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!576229 () Bool)

(assert (=> b!576229 (= e!331570 call!32725)))

(declare-fun d!85453 () Bool)

(declare-fun res!364443 () Bool)

(declare-fun e!331571 () Bool)

(assert (=> d!85453 (=> res!364443 e!331571)))

(assert (=> d!85453 (= res!364443 (bvsge #b00000000000000000000000000000000 (size!17612 a!3118)))))

(assert (=> d!85453 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11232) e!331571)))

(declare-fun b!576230 () Bool)

(assert (=> b!576230 (= e!331571 e!331573)))

(declare-fun res!364445 () Bool)

(assert (=> b!576230 (=> (not res!364445) (not e!331573))))

(assert (=> b!576230 (= res!364445 (not e!331572))))

(declare-fun res!364444 () Bool)

(assert (=> b!576230 (=> (not res!364444) (not e!331572))))

(assert (=> b!576230 (= res!364444 (validKeyInArray!0 (select (arr!17248 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!85453 (not res!364443)) b!576230))

(assert (= (and b!576230 res!364444) b!576226))

(assert (= (and b!576230 res!364445) b!576228))

(assert (= (and b!576228 c!66258) b!576229))

(assert (= (and b!576228 (not c!66258)) b!576227))

(assert (= (or b!576229 b!576227) bm!32722))

(assert (=> b!576226 m!555227))

(assert (=> b!576226 m!555227))

(declare-fun m!555323 () Bool)

(assert (=> b!576226 m!555323))

(assert (=> bm!32722 m!555227))

(declare-fun m!555325 () Bool)

(assert (=> bm!32722 m!555325))

(assert (=> b!576228 m!555227))

(assert (=> b!576228 m!555227))

(assert (=> b!576228 m!555291))

(assert (=> b!576230 m!555227))

(assert (=> b!576230 m!555227))

(assert (=> b!576230 m!555291))

(assert (=> b!576007 d!85453))

(declare-fun b!576291 () Bool)

(declare-fun e!331614 () SeekEntryResult!5653)

(assert (=> b!576291 (= e!331614 (Intermediate!5653 false lt!263547 #b00000000000000000000000000000000))))

(declare-fun d!85461 () Bool)

(declare-fun e!331612 () Bool)

(assert (=> d!85461 e!331612))

(declare-fun c!66280 () Bool)

(declare-fun lt!263684 () SeekEntryResult!5653)

(assert (=> d!85461 (= c!66280 (and ((_ is Intermediate!5653) lt!263684) (undefined!6465 lt!263684)))))

(declare-fun e!331615 () SeekEntryResult!5653)

(assert (=> d!85461 (= lt!263684 e!331615)))

(declare-fun c!66281 () Bool)

(assert (=> d!85461 (= c!66281 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!263685 () (_ BitVec 64))

(assert (=> d!85461 (= lt!263685 (select (arr!17248 (array!35935 (store (arr!17248 a!3118) i!1132 k0!1914) (size!17612 a!3118))) lt!263547))))

(assert (=> d!85461 (validMask!0 mask!3119)))

(assert (=> d!85461 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263547 (select (store (arr!17248 a!3118) i!1132 k0!1914) j!142) (array!35935 (store (arr!17248 a!3118) i!1132 k0!1914) (size!17612 a!3118)) mask!3119) lt!263684)))

(declare-fun b!576292 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!576292 (= e!331614 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!263547 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (store (arr!17248 a!3118) i!1132 k0!1914) j!142) (array!35935 (store (arr!17248 a!3118) i!1132 k0!1914) (size!17612 a!3118)) mask!3119))))

(declare-fun b!576293 () Bool)

(assert (=> b!576293 (and (bvsge (index!24841 lt!263684) #b00000000000000000000000000000000) (bvslt (index!24841 lt!263684) (size!17612 (array!35935 (store (arr!17248 a!3118) i!1132 k0!1914) (size!17612 a!3118)))))))

(declare-fun e!331611 () Bool)

(assert (=> b!576293 (= e!331611 (= (select (arr!17248 (array!35935 (store (arr!17248 a!3118) i!1132 k0!1914) (size!17612 a!3118))) (index!24841 lt!263684)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!576294 () Bool)

(assert (=> b!576294 (= e!331615 e!331614)))

(declare-fun c!66282 () Bool)

(assert (=> b!576294 (= c!66282 (or (= lt!263685 (select (store (arr!17248 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!263685 lt!263685) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!576295 () Bool)

(declare-fun e!331613 () Bool)

(assert (=> b!576295 (= e!331612 e!331613)))

(declare-fun res!364465 () Bool)

(assert (=> b!576295 (= res!364465 (and ((_ is Intermediate!5653) lt!263684) (not (undefined!6465 lt!263684)) (bvslt (x!53881 lt!263684) #b01111111111111111111111111111110) (bvsge (x!53881 lt!263684) #b00000000000000000000000000000000) (bvsge (x!53881 lt!263684) #b00000000000000000000000000000000)))))

(assert (=> b!576295 (=> (not res!364465) (not e!331613))))

(declare-fun b!576296 () Bool)

(assert (=> b!576296 (and (bvsge (index!24841 lt!263684) #b00000000000000000000000000000000) (bvslt (index!24841 lt!263684) (size!17612 (array!35935 (store (arr!17248 a!3118) i!1132 k0!1914) (size!17612 a!3118)))))))

(declare-fun res!364464 () Bool)

(assert (=> b!576296 (= res!364464 (= (select (arr!17248 (array!35935 (store (arr!17248 a!3118) i!1132 k0!1914) (size!17612 a!3118))) (index!24841 lt!263684)) (select (store (arr!17248 a!3118) i!1132 k0!1914) j!142)))))

(assert (=> b!576296 (=> res!364464 e!331611)))

(assert (=> b!576296 (= e!331613 e!331611)))

(declare-fun b!576297 () Bool)

(assert (=> b!576297 (= e!331612 (bvsge (x!53881 lt!263684) #b01111111111111111111111111111110))))

(declare-fun b!576298 () Bool)

(assert (=> b!576298 (= e!331615 (Intermediate!5653 true lt!263547 #b00000000000000000000000000000000))))

(declare-fun b!576299 () Bool)

(assert (=> b!576299 (and (bvsge (index!24841 lt!263684) #b00000000000000000000000000000000) (bvslt (index!24841 lt!263684) (size!17612 (array!35935 (store (arr!17248 a!3118) i!1132 k0!1914) (size!17612 a!3118)))))))

(declare-fun res!364466 () Bool)

(assert (=> b!576299 (= res!364466 (= (select (arr!17248 (array!35935 (store (arr!17248 a!3118) i!1132 k0!1914) (size!17612 a!3118))) (index!24841 lt!263684)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!576299 (=> res!364466 e!331611)))

(assert (= (and d!85461 c!66281) b!576298))

(assert (= (and d!85461 (not c!66281)) b!576294))

(assert (= (and b!576294 c!66282) b!576291))

(assert (= (and b!576294 (not c!66282)) b!576292))

(assert (= (and d!85461 c!66280) b!576297))

(assert (= (and d!85461 (not c!66280)) b!576295))

(assert (= (and b!576295 res!364465) b!576296))

(assert (= (and b!576296 (not res!364464)) b!576299))

(assert (= (and b!576299 (not res!364466)) b!576293))

(declare-fun m!555363 () Bool)

(assert (=> d!85461 m!555363))

(assert (=> d!85461 m!555123))

(declare-fun m!555365 () Bool)

(assert (=> b!576296 m!555365))

(declare-fun m!555367 () Bool)

(assert (=> b!576292 m!555367))

(assert (=> b!576292 m!555367))

(assert (=> b!576292 m!555143))

(declare-fun m!555369 () Bool)

(assert (=> b!576292 m!555369))

(assert (=> b!576299 m!555365))

(assert (=> b!576293 m!555365))

(assert (=> b!576001 d!85461))

(declare-fun b!576300 () Bool)

(declare-fun e!331619 () SeekEntryResult!5653)

(assert (=> b!576300 (= e!331619 (Intermediate!5653 false lt!263549 #b00000000000000000000000000000000))))

(declare-fun d!85477 () Bool)

(declare-fun e!331617 () Bool)

(assert (=> d!85477 e!331617))

(declare-fun c!66283 () Bool)

(declare-fun lt!263686 () SeekEntryResult!5653)

(assert (=> d!85477 (= c!66283 (and ((_ is Intermediate!5653) lt!263686) (undefined!6465 lt!263686)))))

(declare-fun e!331620 () SeekEntryResult!5653)

(assert (=> d!85477 (= lt!263686 e!331620)))

(declare-fun c!66284 () Bool)

(assert (=> d!85477 (= c!66284 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!263687 () (_ BitVec 64))

(assert (=> d!85477 (= lt!263687 (select (arr!17248 a!3118) lt!263549))))

(assert (=> d!85477 (validMask!0 mask!3119)))

(assert (=> d!85477 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263549 (select (arr!17248 a!3118) j!142) a!3118 mask!3119) lt!263686)))

(declare-fun b!576301 () Bool)

(assert (=> b!576301 (= e!331619 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!263549 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (arr!17248 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!576302 () Bool)

(assert (=> b!576302 (and (bvsge (index!24841 lt!263686) #b00000000000000000000000000000000) (bvslt (index!24841 lt!263686) (size!17612 a!3118)))))

(declare-fun e!331616 () Bool)

(assert (=> b!576302 (= e!331616 (= (select (arr!17248 a!3118) (index!24841 lt!263686)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!576303 () Bool)

(assert (=> b!576303 (= e!331620 e!331619)))

(declare-fun c!66285 () Bool)

(assert (=> b!576303 (= c!66285 (or (= lt!263687 (select (arr!17248 a!3118) j!142)) (= (bvadd lt!263687 lt!263687) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!576304 () Bool)

(declare-fun e!331618 () Bool)

(assert (=> b!576304 (= e!331617 e!331618)))

(declare-fun res!364468 () Bool)

(assert (=> b!576304 (= res!364468 (and ((_ is Intermediate!5653) lt!263686) (not (undefined!6465 lt!263686)) (bvslt (x!53881 lt!263686) #b01111111111111111111111111111110) (bvsge (x!53881 lt!263686) #b00000000000000000000000000000000) (bvsge (x!53881 lt!263686) #b00000000000000000000000000000000)))))

(assert (=> b!576304 (=> (not res!364468) (not e!331618))))

(declare-fun b!576305 () Bool)

(assert (=> b!576305 (and (bvsge (index!24841 lt!263686) #b00000000000000000000000000000000) (bvslt (index!24841 lt!263686) (size!17612 a!3118)))))

(declare-fun res!364467 () Bool)

(assert (=> b!576305 (= res!364467 (= (select (arr!17248 a!3118) (index!24841 lt!263686)) (select (arr!17248 a!3118) j!142)))))

(assert (=> b!576305 (=> res!364467 e!331616)))

(assert (=> b!576305 (= e!331618 e!331616)))

(declare-fun b!576306 () Bool)

(assert (=> b!576306 (= e!331617 (bvsge (x!53881 lt!263686) #b01111111111111111111111111111110))))

(declare-fun b!576307 () Bool)

(assert (=> b!576307 (= e!331620 (Intermediate!5653 true lt!263549 #b00000000000000000000000000000000))))

(declare-fun b!576308 () Bool)

(assert (=> b!576308 (and (bvsge (index!24841 lt!263686) #b00000000000000000000000000000000) (bvslt (index!24841 lt!263686) (size!17612 a!3118)))))

(declare-fun res!364469 () Bool)

(assert (=> b!576308 (= res!364469 (= (select (arr!17248 a!3118) (index!24841 lt!263686)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!576308 (=> res!364469 e!331616)))

(assert (= (and d!85477 c!66284) b!576307))

(assert (= (and d!85477 (not c!66284)) b!576303))

(assert (= (and b!576303 c!66285) b!576300))

(assert (= (and b!576303 (not c!66285)) b!576301))

(assert (= (and d!85477 c!66283) b!576306))

(assert (= (and d!85477 (not c!66283)) b!576304))

(assert (= (and b!576304 res!364468) b!576305))

(assert (= (and b!576305 (not res!364467)) b!576308))

(assert (= (and b!576308 (not res!364469)) b!576302))

(declare-fun m!555371 () Bool)

(assert (=> d!85477 m!555371))

(assert (=> d!85477 m!555123))

(declare-fun m!555373 () Bool)

(assert (=> b!576305 m!555373))

(declare-fun m!555375 () Bool)

(assert (=> b!576301 m!555375))

(assert (=> b!576301 m!555375))

(assert (=> b!576301 m!555131))

(declare-fun m!555377 () Bool)

(assert (=> b!576301 m!555377))

(assert (=> b!576308 m!555373))

(assert (=> b!576302 m!555373))

(assert (=> b!576001 d!85477))

(declare-fun d!85479 () Bool)

(declare-fun lt!263697 () (_ BitVec 32))

(declare-fun lt!263696 () (_ BitVec 32))

(assert (=> d!85479 (= lt!263697 (bvmul (bvxor lt!263696 (bvlshr lt!263696 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85479 (= lt!263696 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17248 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!17248 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85479 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!364470 (let ((h!12278 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17248 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!17248 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53889 (bvmul (bvxor h!12278 (bvlshr h!12278 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53889 (bvlshr x!53889 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!364470 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!364470 #b00000000000000000000000000000000))))))

(assert (=> d!85479 (= (toIndex!0 (select (store (arr!17248 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!263697 (bvlshr lt!263697 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!576001 d!85479))

(declare-fun d!85481 () Bool)

(declare-fun lt!263701 () (_ BitVec 32))

(declare-fun lt!263700 () (_ BitVec 32))

(assert (=> d!85481 (= lt!263701 (bvmul (bvxor lt!263700 (bvlshr lt!263700 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85481 (= lt!263700 ((_ extract 31 0) (bvand (bvxor (select (arr!17248 a!3118) j!142) (bvlshr (select (arr!17248 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85481 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!364470 (let ((h!12278 ((_ extract 31 0) (bvand (bvxor (select (arr!17248 a!3118) j!142) (bvlshr (select (arr!17248 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53889 (bvmul (bvxor h!12278 (bvlshr h!12278 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53889 (bvlshr x!53889 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!364470 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!364470 #b00000000000000000000000000000000))))))

(assert (=> d!85481 (= (toIndex!0 (select (arr!17248 a!3118) j!142) mask!3119) (bvand (bvxor lt!263701 (bvlshr lt!263701 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!576001 d!85481))

(declare-fun d!85483 () Bool)

(assert (=> d!85483 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!576006 d!85483))

(check-sat (not bm!32712) (not b!576226) (not b!576210) (not d!85449) (not b!576164) (not b!576087) (not b!576228) (not d!85429) (not b!576171) (not d!85425) (not b!576076) (not b!576086) (not bm!32719) (not d!85477) (not b!576230) (not d!85461) (not b!576301) (not b!576292) (not b!576172) (not bm!32722))
(check-sat)
