; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52618 () Bool)

(assert start!52618)

(declare-fun b!574202 () Bool)

(declare-fun res!363176 () Bool)

(declare-fun e!330354 () Bool)

(assert (=> b!574202 (=> (not res!363176) (not e!330354))))

(declare-datatypes ((array!35889 0))(
  ( (array!35890 (arr!17230 (Array (_ BitVec 32) (_ BitVec 64))) (size!17594 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35889)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35889 (_ BitVec 32)) Bool)

(assert (=> b!574202 (= res!363176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!574203 () Bool)

(declare-fun res!363174 () Bool)

(declare-fun e!330357 () Bool)

(assert (=> b!574203 (=> (not res!363174) (not e!330357))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!574203 (= res!363174 (validKeyInArray!0 k0!1914))))

(declare-fun b!574204 () Bool)

(declare-datatypes ((SeekEntryResult!5679 0))(
  ( (MissingZero!5679 (index!24943 (_ BitVec 32))) (Found!5679 (index!24944 (_ BitVec 32))) (Intermediate!5679 (undefined!6491 Bool) (index!24945 (_ BitVec 32)) (x!53822 (_ BitVec 32))) (Undefined!5679) (MissingVacant!5679 (index!24946 (_ BitVec 32))) )
))
(declare-fun lt!262258 () SeekEntryResult!5679)

(declare-fun lt!262261 () (_ BitVec 64))

(declare-fun e!330359 () Bool)

(declare-fun lt!262254 () array!35889)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35889 (_ BitVec 32)) SeekEntryResult!5679)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35889 (_ BitVec 32)) SeekEntryResult!5679)

(assert (=> b!574204 (= e!330359 (= (seekEntryOrOpen!0 lt!262261 lt!262254 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53822 lt!262258) (index!24945 lt!262258) (index!24945 lt!262258) lt!262261 lt!262254 mask!3119)))))

(declare-fun b!574205 () Bool)

(declare-fun e!330353 () Bool)

(declare-fun e!330356 () Bool)

(assert (=> b!574205 (= e!330353 e!330356)))

(declare-fun res!363167 () Bool)

(assert (=> b!574205 (=> res!363167 e!330356)))

(get-info :version)

(assert (=> b!574205 (= res!363167 (or (undefined!6491 lt!262258) (not ((_ is Intermediate!5679) lt!262258))))))

(declare-fun b!574206 () Bool)

(declare-fun res!363166 () Bool)

(assert (=> b!574206 (=> (not res!363166) (not e!330354))))

(declare-datatypes ((List!11310 0))(
  ( (Nil!11307) (Cons!11306 (h!12339 (_ BitVec 64)) (t!17538 List!11310)) )
))
(declare-fun arrayNoDuplicates!0 (array!35889 (_ BitVec 32) List!11310) Bool)

(assert (=> b!574206 (= res!363166 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11307))))

(declare-fun b!574207 () Bool)

(declare-fun res!363173 () Bool)

(assert (=> b!574207 (=> (not res!363173) (not e!330357))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!574207 (= res!363173 (and (= (size!17594 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17594 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17594 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!574209 () Bool)

(declare-fun res!363169 () Bool)

(assert (=> b!574209 (=> (not res!363169) (not e!330357))))

(declare-fun arrayContainsKey!0 (array!35889 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!574209 (= res!363169 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!574210 () Bool)

(declare-fun e!330358 () Bool)

(assert (=> b!574210 (= e!330358 e!330359)))

(declare-fun res!363168 () Bool)

(assert (=> b!574210 (=> (not res!363168) (not e!330359))))

(declare-fun lt!262257 () SeekEntryResult!5679)

(assert (=> b!574210 (= res!363168 (= lt!262257 (seekKeyOrZeroReturnVacant!0 (x!53822 lt!262258) (index!24945 lt!262258) (index!24945 lt!262258) (select (arr!17230 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!574211 () Bool)

(assert (=> b!574211 (= e!330357 e!330354)))

(declare-fun res!363170 () Bool)

(assert (=> b!574211 (=> (not res!363170) (not e!330354))))

(declare-fun lt!262256 () SeekEntryResult!5679)

(assert (=> b!574211 (= res!363170 (or (= lt!262256 (MissingZero!5679 i!1132)) (= lt!262256 (MissingVacant!5679 i!1132))))))

(assert (=> b!574211 (= lt!262256 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun e!330355 () Bool)

(declare-fun b!574212 () Bool)

(assert (=> b!574212 (= e!330355 (not (or (undefined!6491 lt!262258) (not ((_ is Intermediate!5679) lt!262258)) (let ((bdg!18009 (select (arr!17230 a!3118) (index!24945 lt!262258)))) (or (= bdg!18009 (select (arr!17230 a!3118) j!142)) (= bdg!18009 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt (index!24945 lt!262258) #b00000000000000000000000000000000) (bvsge (index!24945 lt!262258) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53822 lt!262258) #b01111111111111111111111111111110) (bvslt (x!53822 lt!262258) #b00000000000000000000000000000000) (= bdg!18009 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!574212 e!330353))

(declare-fun res!363165 () Bool)

(assert (=> b!574212 (=> (not res!363165) (not e!330353))))

(assert (=> b!574212 (= res!363165 (= lt!262257 (Found!5679 j!142)))))

(assert (=> b!574212 (= lt!262257 (seekEntryOrOpen!0 (select (arr!17230 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!574212 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18060 0))(
  ( (Unit!18061) )
))
(declare-fun lt!262253 () Unit!18060)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35889 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18060)

(assert (=> b!574212 (= lt!262253 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!574213 () Bool)

(assert (=> b!574213 (= e!330354 e!330355)))

(declare-fun res!363164 () Bool)

(assert (=> b!574213 (=> (not res!363164) (not e!330355))))

(declare-fun lt!262259 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35889 (_ BitVec 32)) SeekEntryResult!5679)

(assert (=> b!574213 (= res!363164 (= lt!262258 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262259 lt!262261 lt!262254 mask!3119)))))

(declare-fun lt!262255 () (_ BitVec 32))

(assert (=> b!574213 (= lt!262258 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262255 (select (arr!17230 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!574213 (= lt!262259 (toIndex!0 lt!262261 mask!3119))))

(assert (=> b!574213 (= lt!262261 (select (store (arr!17230 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!574213 (= lt!262255 (toIndex!0 (select (arr!17230 a!3118) j!142) mask!3119))))

(assert (=> b!574213 (= lt!262254 (array!35890 (store (arr!17230 a!3118) i!1132 k0!1914) (size!17594 a!3118)))))

(declare-fun b!574214 () Bool)

(declare-fun res!363171 () Bool)

(assert (=> b!574214 (=> (not res!363171) (not e!330357))))

(assert (=> b!574214 (= res!363171 (validKeyInArray!0 (select (arr!17230 a!3118) j!142)))))

(declare-fun b!574208 () Bool)

(assert (=> b!574208 (= e!330356 e!330358)))

(declare-fun res!363172 () Bool)

(assert (=> b!574208 (=> res!363172 e!330358)))

(declare-fun lt!262260 () (_ BitVec 64))

(assert (=> b!574208 (= res!363172 (or (= lt!262260 (select (arr!17230 a!3118) j!142)) (= lt!262260 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!574208 (= lt!262260 (select (arr!17230 a!3118) (index!24945 lt!262258)))))

(declare-fun res!363175 () Bool)

(assert (=> start!52618 (=> (not res!363175) (not e!330357))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52618 (= res!363175 (validMask!0 mask!3119))))

(assert (=> start!52618 e!330357))

(assert (=> start!52618 true))

(declare-fun array_inv!13026 (array!35889) Bool)

(assert (=> start!52618 (array_inv!13026 a!3118)))

(assert (= (and start!52618 res!363175) b!574207))

(assert (= (and b!574207 res!363173) b!574214))

(assert (= (and b!574214 res!363171) b!574203))

(assert (= (and b!574203 res!363174) b!574209))

(assert (= (and b!574209 res!363169) b!574211))

(assert (= (and b!574211 res!363170) b!574202))

(assert (= (and b!574202 res!363176) b!574206))

(assert (= (and b!574206 res!363166) b!574213))

(assert (= (and b!574213 res!363164) b!574212))

(assert (= (and b!574212 res!363165) b!574205))

(assert (= (and b!574205 (not res!363167)) b!574208))

(assert (= (and b!574208 (not res!363172)) b!574210))

(assert (= (and b!574210 res!363168) b!574204))

(declare-fun m!553121 () Bool)

(assert (=> b!574208 m!553121))

(declare-fun m!553123 () Bool)

(assert (=> b!574208 m!553123))

(declare-fun m!553125 () Bool)

(assert (=> b!574204 m!553125))

(declare-fun m!553127 () Bool)

(assert (=> b!574204 m!553127))

(assert (=> b!574213 m!553121))

(declare-fun m!553129 () Bool)

(assert (=> b!574213 m!553129))

(assert (=> b!574213 m!553121))

(declare-fun m!553131 () Bool)

(assert (=> b!574213 m!553131))

(assert (=> b!574213 m!553121))

(declare-fun m!553133 () Bool)

(assert (=> b!574213 m!553133))

(declare-fun m!553135 () Bool)

(assert (=> b!574213 m!553135))

(declare-fun m!553137 () Bool)

(assert (=> b!574213 m!553137))

(declare-fun m!553139 () Bool)

(assert (=> b!574213 m!553139))

(declare-fun m!553141 () Bool)

(assert (=> b!574209 m!553141))

(assert (=> b!574214 m!553121))

(assert (=> b!574214 m!553121))

(declare-fun m!553143 () Bool)

(assert (=> b!574214 m!553143))

(declare-fun m!553145 () Bool)

(assert (=> b!574203 m!553145))

(declare-fun m!553147 () Bool)

(assert (=> b!574211 m!553147))

(assert (=> b!574212 m!553123))

(assert (=> b!574212 m!553121))

(declare-fun m!553149 () Bool)

(assert (=> b!574212 m!553149))

(declare-fun m!553151 () Bool)

(assert (=> b!574212 m!553151))

(assert (=> b!574212 m!553121))

(declare-fun m!553153 () Bool)

(assert (=> b!574212 m!553153))

(declare-fun m!553155 () Bool)

(assert (=> start!52618 m!553155))

(declare-fun m!553157 () Bool)

(assert (=> start!52618 m!553157))

(declare-fun m!553159 () Bool)

(assert (=> b!574206 m!553159))

(declare-fun m!553161 () Bool)

(assert (=> b!574202 m!553161))

(assert (=> b!574210 m!553121))

(assert (=> b!574210 m!553121))

(declare-fun m!553163 () Bool)

(assert (=> b!574210 m!553163))

(check-sat (not b!574206) (not b!574203) (not b!574213) (not b!574214) (not b!574204) (not b!574202) (not b!574212) (not b!574210) (not b!574209) (not start!52618) (not b!574211))
(check-sat)
(get-model)

(declare-fun b!574266 () Bool)

(declare-fun e!330393 () SeekEntryResult!5679)

(assert (=> b!574266 (= e!330393 Undefined!5679)))

(declare-fun b!574267 () Bool)

(declare-fun e!330392 () SeekEntryResult!5679)

(declare-fun lt!262297 () SeekEntryResult!5679)

(assert (=> b!574267 (= e!330392 (Found!5679 (index!24945 lt!262297)))))

(declare-fun d!85071 () Bool)

(declare-fun lt!262296 () SeekEntryResult!5679)

(assert (=> d!85071 (and (or ((_ is Undefined!5679) lt!262296) (not ((_ is Found!5679) lt!262296)) (and (bvsge (index!24944 lt!262296) #b00000000000000000000000000000000) (bvslt (index!24944 lt!262296) (size!17594 a!3118)))) (or ((_ is Undefined!5679) lt!262296) ((_ is Found!5679) lt!262296) (not ((_ is MissingZero!5679) lt!262296)) (and (bvsge (index!24943 lt!262296) #b00000000000000000000000000000000) (bvslt (index!24943 lt!262296) (size!17594 a!3118)))) (or ((_ is Undefined!5679) lt!262296) ((_ is Found!5679) lt!262296) ((_ is MissingZero!5679) lt!262296) (not ((_ is MissingVacant!5679) lt!262296)) (and (bvsge (index!24946 lt!262296) #b00000000000000000000000000000000) (bvslt (index!24946 lt!262296) (size!17594 a!3118)))) (or ((_ is Undefined!5679) lt!262296) (ite ((_ is Found!5679) lt!262296) (= (select (arr!17230 a!3118) (index!24944 lt!262296)) (select (arr!17230 a!3118) j!142)) (ite ((_ is MissingZero!5679) lt!262296) (= (select (arr!17230 a!3118) (index!24943 lt!262296)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5679) lt!262296) (= (select (arr!17230 a!3118) (index!24946 lt!262296)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85071 (= lt!262296 e!330393)))

(declare-fun c!65888 () Bool)

(assert (=> d!85071 (= c!65888 (and ((_ is Intermediate!5679) lt!262297) (undefined!6491 lt!262297)))))

(assert (=> d!85071 (= lt!262297 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17230 a!3118) j!142) mask!3119) (select (arr!17230 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!85071 (validMask!0 mask!3119)))

(assert (=> d!85071 (= (seekEntryOrOpen!0 (select (arr!17230 a!3118) j!142) a!3118 mask!3119) lt!262296)))

(declare-fun b!574268 () Bool)

(assert (=> b!574268 (= e!330393 e!330392)))

(declare-fun lt!262295 () (_ BitVec 64))

(assert (=> b!574268 (= lt!262295 (select (arr!17230 a!3118) (index!24945 lt!262297)))))

(declare-fun c!65886 () Bool)

(assert (=> b!574268 (= c!65886 (= lt!262295 (select (arr!17230 a!3118) j!142)))))

(declare-fun b!574269 () Bool)

(declare-fun e!330391 () SeekEntryResult!5679)

(assert (=> b!574269 (= e!330391 (seekKeyOrZeroReturnVacant!0 (x!53822 lt!262297) (index!24945 lt!262297) (index!24945 lt!262297) (select (arr!17230 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!574270 () Bool)

(declare-fun c!65887 () Bool)

(assert (=> b!574270 (= c!65887 (= lt!262295 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!574270 (= e!330392 e!330391)))

(declare-fun b!574271 () Bool)

(assert (=> b!574271 (= e!330391 (MissingZero!5679 (index!24945 lt!262297)))))

(assert (= (and d!85071 c!65888) b!574266))

(assert (= (and d!85071 (not c!65888)) b!574268))

(assert (= (and b!574268 c!65886) b!574267))

(assert (= (and b!574268 (not c!65886)) b!574270))

(assert (= (and b!574270 c!65887) b!574271))

(assert (= (and b!574270 (not c!65887)) b!574269))

(assert (=> d!85071 m!553155))

(declare-fun m!553209 () Bool)

(assert (=> d!85071 m!553209))

(declare-fun m!553211 () Bool)

(assert (=> d!85071 m!553211))

(declare-fun m!553213 () Bool)

(assert (=> d!85071 m!553213))

(assert (=> d!85071 m!553121))

(assert (=> d!85071 m!553129))

(assert (=> d!85071 m!553129))

(assert (=> d!85071 m!553121))

(declare-fun m!553215 () Bool)

(assert (=> d!85071 m!553215))

(declare-fun m!553217 () Bool)

(assert (=> b!574268 m!553217))

(assert (=> b!574269 m!553121))

(declare-fun m!553219 () Bool)

(assert (=> b!574269 m!553219))

(assert (=> b!574212 d!85071))

(declare-fun b!574292 () Bool)

(declare-fun e!330406 () Bool)

(declare-fun call!32669 () Bool)

(assert (=> b!574292 (= e!330406 call!32669)))

(declare-fun b!574293 () Bool)

(declare-fun e!330408 () Bool)

(assert (=> b!574293 (= e!330408 e!330406)))

(declare-fun c!65897 () Bool)

(assert (=> b!574293 (= c!65897 (validKeyInArray!0 (select (arr!17230 a!3118) j!142)))))

(declare-fun bm!32666 () Bool)

(assert (=> bm!32666 (= call!32669 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun d!85075 () Bool)

(declare-fun res!363221 () Bool)

(assert (=> d!85075 (=> res!363221 e!330408)))

(assert (=> d!85075 (= res!363221 (bvsge j!142 (size!17594 a!3118)))))

(assert (=> d!85075 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!330408)))

(declare-fun b!574294 () Bool)

(declare-fun e!330407 () Bool)

(assert (=> b!574294 (= e!330406 e!330407)))

(declare-fun lt!262310 () (_ BitVec 64))

(assert (=> b!574294 (= lt!262310 (select (arr!17230 a!3118) j!142))))

(declare-fun lt!262312 () Unit!18060)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35889 (_ BitVec 64) (_ BitVec 32)) Unit!18060)

(assert (=> b!574294 (= lt!262312 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!262310 j!142))))

(assert (=> b!574294 (arrayContainsKey!0 a!3118 lt!262310 #b00000000000000000000000000000000)))

(declare-fun lt!262311 () Unit!18060)

(assert (=> b!574294 (= lt!262311 lt!262312)))

(declare-fun res!363220 () Bool)

(assert (=> b!574294 (= res!363220 (= (seekEntryOrOpen!0 (select (arr!17230 a!3118) j!142) a!3118 mask!3119) (Found!5679 j!142)))))

(assert (=> b!574294 (=> (not res!363220) (not e!330407))))

(declare-fun b!574295 () Bool)

(assert (=> b!574295 (= e!330407 call!32669)))

(assert (= (and d!85075 (not res!363221)) b!574293))

(assert (= (and b!574293 c!65897) b!574294))

(assert (= (and b!574293 (not c!65897)) b!574292))

(assert (= (and b!574294 res!363220) b!574295))

(assert (= (or b!574295 b!574292) bm!32666))

(assert (=> b!574293 m!553121))

(assert (=> b!574293 m!553121))

(assert (=> b!574293 m!553143))

(declare-fun m!553221 () Bool)

(assert (=> bm!32666 m!553221))

(assert (=> b!574294 m!553121))

(declare-fun m!553223 () Bool)

(assert (=> b!574294 m!553223))

(declare-fun m!553225 () Bool)

(assert (=> b!574294 m!553225))

(assert (=> b!574294 m!553121))

(assert (=> b!574294 m!553153))

(assert (=> b!574212 d!85075))

(declare-fun d!85079 () Bool)

(assert (=> d!85079 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!262322 () Unit!18060)

(declare-fun choose!38 (array!35889 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18060)

(assert (=> d!85079 (= lt!262322 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!85079 (validMask!0 mask!3119)))

(assert (=> d!85079 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!262322)))

(declare-fun bs!17770 () Bool)

(assert (= bs!17770 d!85079))

(assert (=> bs!17770 m!553149))

(declare-fun m!553239 () Bool)

(assert (=> bs!17770 m!553239))

(assert (=> bs!17770 m!553155))

(assert (=> b!574212 d!85079))

(declare-fun b!574314 () Bool)

(declare-fun e!330418 () Bool)

(declare-fun call!32670 () Bool)

(assert (=> b!574314 (= e!330418 call!32670)))

(declare-fun b!574315 () Bool)

(declare-fun e!330420 () Bool)

(assert (=> b!574315 (= e!330420 e!330418)))

(declare-fun c!65907 () Bool)

(assert (=> b!574315 (= c!65907 (validKeyInArray!0 (select (arr!17230 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32667 () Bool)

(assert (=> bm!32667 (= call!32670 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun d!85083 () Bool)

(declare-fun res!363223 () Bool)

(assert (=> d!85083 (=> res!363223 e!330420)))

(assert (=> d!85083 (= res!363223 (bvsge #b00000000000000000000000000000000 (size!17594 a!3118)))))

(assert (=> d!85083 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!330420)))

(declare-fun b!574316 () Bool)

(declare-fun e!330419 () Bool)

(assert (=> b!574316 (= e!330418 e!330419)))

(declare-fun lt!262323 () (_ BitVec 64))

(assert (=> b!574316 (= lt!262323 (select (arr!17230 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!262325 () Unit!18060)

(assert (=> b!574316 (= lt!262325 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!262323 #b00000000000000000000000000000000))))

(assert (=> b!574316 (arrayContainsKey!0 a!3118 lt!262323 #b00000000000000000000000000000000)))

(declare-fun lt!262324 () Unit!18060)

(assert (=> b!574316 (= lt!262324 lt!262325)))

(declare-fun res!363222 () Bool)

(assert (=> b!574316 (= res!363222 (= (seekEntryOrOpen!0 (select (arr!17230 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5679 #b00000000000000000000000000000000)))))

(assert (=> b!574316 (=> (not res!363222) (not e!330419))))

(declare-fun b!574317 () Bool)

(assert (=> b!574317 (= e!330419 call!32670)))

(assert (= (and d!85083 (not res!363223)) b!574315))

(assert (= (and b!574315 c!65907) b!574316))

(assert (= (and b!574315 (not c!65907)) b!574314))

(assert (= (and b!574316 res!363222) b!574317))

(assert (= (or b!574317 b!574314) bm!32667))

(declare-fun m!553241 () Bool)

(assert (=> b!574315 m!553241))

(assert (=> b!574315 m!553241))

(declare-fun m!553243 () Bool)

(assert (=> b!574315 m!553243))

(declare-fun m!553245 () Bool)

(assert (=> bm!32667 m!553245))

(assert (=> b!574316 m!553241))

(declare-fun m!553247 () Bool)

(assert (=> b!574316 m!553247))

(declare-fun m!553249 () Bool)

(assert (=> b!574316 m!553249))

(assert (=> b!574316 m!553241))

(declare-fun m!553251 () Bool)

(assert (=> b!574316 m!553251))

(assert (=> b!574202 d!85083))

(declare-fun b!574366 () Bool)

(declare-fun e!330448 () SeekEntryResult!5679)

(declare-fun e!330447 () SeekEntryResult!5679)

(assert (=> b!574366 (= e!330448 e!330447)))

(declare-fun c!65929 () Bool)

(declare-fun lt!262342 () (_ BitVec 64))

(assert (=> b!574366 (= c!65929 (or (= lt!262342 lt!262261) (= (bvadd lt!262342 lt!262342) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!574367 () Bool)

(declare-fun e!330450 () Bool)

(declare-fun lt!262341 () SeekEntryResult!5679)

(assert (=> b!574367 (= e!330450 (bvsge (x!53822 lt!262341) #b01111111111111111111111111111110))))

(declare-fun b!574368 () Bool)

(assert (=> b!574368 (and (bvsge (index!24945 lt!262341) #b00000000000000000000000000000000) (bvslt (index!24945 lt!262341) (size!17594 lt!262254)))))

(declare-fun res!363232 () Bool)

(assert (=> b!574368 (= res!363232 (= (select (arr!17230 lt!262254) (index!24945 lt!262341)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330446 () Bool)

(assert (=> b!574368 (=> res!363232 e!330446)))

(declare-fun b!574369 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!574369 (= e!330447 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!262259 #b00000000000000000000000000000000 mask!3119) lt!262261 lt!262254 mask!3119))))

(declare-fun d!85085 () Bool)

(assert (=> d!85085 e!330450))

(declare-fun c!65930 () Bool)

(assert (=> d!85085 (= c!65930 (and ((_ is Intermediate!5679) lt!262341) (undefined!6491 lt!262341)))))

(assert (=> d!85085 (= lt!262341 e!330448)))

(declare-fun c!65931 () Bool)

(assert (=> d!85085 (= c!65931 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!85085 (= lt!262342 (select (arr!17230 lt!262254) lt!262259))))

(assert (=> d!85085 (validMask!0 mask!3119)))

(assert (=> d!85085 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262259 lt!262261 lt!262254 mask!3119) lt!262341)))

(declare-fun b!574370 () Bool)

(assert (=> b!574370 (= e!330447 (Intermediate!5679 false lt!262259 #b00000000000000000000000000000000))))

(declare-fun b!574371 () Bool)

(declare-fun e!330449 () Bool)

(assert (=> b!574371 (= e!330450 e!330449)))

(declare-fun res!363230 () Bool)

(assert (=> b!574371 (= res!363230 (and ((_ is Intermediate!5679) lt!262341) (not (undefined!6491 lt!262341)) (bvslt (x!53822 lt!262341) #b01111111111111111111111111111110) (bvsge (x!53822 lt!262341) #b00000000000000000000000000000000) (bvsge (x!53822 lt!262341) #b00000000000000000000000000000000)))))

(assert (=> b!574371 (=> (not res!363230) (not e!330449))))

(declare-fun b!574372 () Bool)

(assert (=> b!574372 (and (bvsge (index!24945 lt!262341) #b00000000000000000000000000000000) (bvslt (index!24945 lt!262341) (size!17594 lt!262254)))))

(assert (=> b!574372 (= e!330446 (= (select (arr!17230 lt!262254) (index!24945 lt!262341)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!574373 () Bool)

(assert (=> b!574373 (and (bvsge (index!24945 lt!262341) #b00000000000000000000000000000000) (bvslt (index!24945 lt!262341) (size!17594 lt!262254)))))

(declare-fun res!363231 () Bool)

(assert (=> b!574373 (= res!363231 (= (select (arr!17230 lt!262254) (index!24945 lt!262341)) lt!262261))))

(assert (=> b!574373 (=> res!363231 e!330446)))

(assert (=> b!574373 (= e!330449 e!330446)))

(declare-fun b!574374 () Bool)

(assert (=> b!574374 (= e!330448 (Intermediate!5679 true lt!262259 #b00000000000000000000000000000000))))

(assert (= (and d!85085 c!65931) b!574374))

(assert (= (and d!85085 (not c!65931)) b!574366))

(assert (= (and b!574366 c!65929) b!574370))

(assert (= (and b!574366 (not c!65929)) b!574369))

(assert (= (and d!85085 c!65930) b!574367))

(assert (= (and d!85085 (not c!65930)) b!574371))

(assert (= (and b!574371 res!363230) b!574373))

(assert (= (and b!574373 (not res!363231)) b!574368))

(assert (= (and b!574368 (not res!363232)) b!574372))

(declare-fun m!553283 () Bool)

(assert (=> b!574372 m!553283))

(declare-fun m!553285 () Bool)

(assert (=> d!85085 m!553285))

(assert (=> d!85085 m!553155))

(assert (=> b!574373 m!553283))

(declare-fun m!553287 () Bool)

(assert (=> b!574369 m!553287))

(assert (=> b!574369 m!553287))

(declare-fun m!553289 () Bool)

(assert (=> b!574369 m!553289))

(assert (=> b!574368 m!553283))

(assert (=> b!574213 d!85085))

(declare-fun b!574383 () Bool)

(declare-fun e!330459 () SeekEntryResult!5679)

(declare-fun e!330458 () SeekEntryResult!5679)

(assert (=> b!574383 (= e!330459 e!330458)))

(declare-fun lt!262350 () (_ BitVec 64))

(declare-fun c!65934 () Bool)

(assert (=> b!574383 (= c!65934 (or (= lt!262350 (select (arr!17230 a!3118) j!142)) (= (bvadd lt!262350 lt!262350) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!574384 () Bool)

(declare-fun e!330461 () Bool)

(declare-fun lt!262349 () SeekEntryResult!5679)

(assert (=> b!574384 (= e!330461 (bvsge (x!53822 lt!262349) #b01111111111111111111111111111110))))

(declare-fun b!574385 () Bool)

(assert (=> b!574385 (and (bvsge (index!24945 lt!262349) #b00000000000000000000000000000000) (bvslt (index!24945 lt!262349) (size!17594 a!3118)))))

(declare-fun res!363239 () Bool)

(assert (=> b!574385 (= res!363239 (= (select (arr!17230 a!3118) (index!24945 lt!262349)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330457 () Bool)

(assert (=> b!574385 (=> res!363239 e!330457)))

(declare-fun b!574386 () Bool)

(assert (=> b!574386 (= e!330458 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!262255 #b00000000000000000000000000000000 mask!3119) (select (arr!17230 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!85103 () Bool)

(assert (=> d!85103 e!330461))

(declare-fun c!65935 () Bool)

(assert (=> d!85103 (= c!65935 (and ((_ is Intermediate!5679) lt!262349) (undefined!6491 lt!262349)))))

(assert (=> d!85103 (= lt!262349 e!330459)))

(declare-fun c!65936 () Bool)

(assert (=> d!85103 (= c!65936 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!85103 (= lt!262350 (select (arr!17230 a!3118) lt!262255))))

(assert (=> d!85103 (validMask!0 mask!3119)))

(assert (=> d!85103 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262255 (select (arr!17230 a!3118) j!142) a!3118 mask!3119) lt!262349)))

(declare-fun b!574387 () Bool)

(assert (=> b!574387 (= e!330458 (Intermediate!5679 false lt!262255 #b00000000000000000000000000000000))))

(declare-fun b!574388 () Bool)

(declare-fun e!330460 () Bool)

(assert (=> b!574388 (= e!330461 e!330460)))

(declare-fun res!363237 () Bool)

(assert (=> b!574388 (= res!363237 (and ((_ is Intermediate!5679) lt!262349) (not (undefined!6491 lt!262349)) (bvslt (x!53822 lt!262349) #b01111111111111111111111111111110) (bvsge (x!53822 lt!262349) #b00000000000000000000000000000000) (bvsge (x!53822 lt!262349) #b00000000000000000000000000000000)))))

(assert (=> b!574388 (=> (not res!363237) (not e!330460))))

(declare-fun b!574389 () Bool)

(assert (=> b!574389 (and (bvsge (index!24945 lt!262349) #b00000000000000000000000000000000) (bvslt (index!24945 lt!262349) (size!17594 a!3118)))))

(assert (=> b!574389 (= e!330457 (= (select (arr!17230 a!3118) (index!24945 lt!262349)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!574390 () Bool)

(assert (=> b!574390 (and (bvsge (index!24945 lt!262349) #b00000000000000000000000000000000) (bvslt (index!24945 lt!262349) (size!17594 a!3118)))))

(declare-fun res!363238 () Bool)

(assert (=> b!574390 (= res!363238 (= (select (arr!17230 a!3118) (index!24945 lt!262349)) (select (arr!17230 a!3118) j!142)))))

(assert (=> b!574390 (=> res!363238 e!330457)))

(assert (=> b!574390 (= e!330460 e!330457)))

(declare-fun b!574391 () Bool)

(assert (=> b!574391 (= e!330459 (Intermediate!5679 true lt!262255 #b00000000000000000000000000000000))))

(assert (= (and d!85103 c!65936) b!574391))

(assert (= (and d!85103 (not c!65936)) b!574383))

(assert (= (and b!574383 c!65934) b!574387))

(assert (= (and b!574383 (not c!65934)) b!574386))

(assert (= (and d!85103 c!65935) b!574384))

(assert (= (and d!85103 (not c!65935)) b!574388))

(assert (= (and b!574388 res!363237) b!574390))

(assert (= (and b!574390 (not res!363238)) b!574385))

(assert (= (and b!574385 (not res!363239)) b!574389))

(declare-fun m!553291 () Bool)

(assert (=> b!574389 m!553291))

(declare-fun m!553293 () Bool)

(assert (=> d!85103 m!553293))

(assert (=> d!85103 m!553155))

(assert (=> b!574390 m!553291))

(declare-fun m!553295 () Bool)

(assert (=> b!574386 m!553295))

(assert (=> b!574386 m!553295))

(assert (=> b!574386 m!553121))

(declare-fun m!553297 () Bool)

(assert (=> b!574386 m!553297))

(assert (=> b!574385 m!553291))

(assert (=> b!574213 d!85103))

(declare-fun d!85105 () Bool)

(declare-fun lt!262359 () (_ BitVec 32))

(declare-fun lt!262358 () (_ BitVec 32))

(assert (=> d!85105 (= lt!262359 (bvmul (bvxor lt!262358 (bvlshr lt!262358 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85105 (= lt!262358 ((_ extract 31 0) (bvand (bvxor lt!262261 (bvlshr lt!262261 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85105 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!363240 (let ((h!12341 ((_ extract 31 0) (bvand (bvxor lt!262261 (bvlshr lt!262261 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53827 (bvmul (bvxor h!12341 (bvlshr h!12341 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53827 (bvlshr x!53827 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!363240 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!363240 #b00000000000000000000000000000000))))))

(assert (=> d!85105 (= (toIndex!0 lt!262261 mask!3119) (bvand (bvxor lt!262359 (bvlshr lt!262359 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!574213 d!85105))

(declare-fun d!85109 () Bool)

(declare-fun lt!262361 () (_ BitVec 32))

(declare-fun lt!262360 () (_ BitVec 32))

(assert (=> d!85109 (= lt!262361 (bvmul (bvxor lt!262360 (bvlshr lt!262360 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85109 (= lt!262360 ((_ extract 31 0) (bvand (bvxor (select (arr!17230 a!3118) j!142) (bvlshr (select (arr!17230 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85109 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!363240 (let ((h!12341 ((_ extract 31 0) (bvand (bvxor (select (arr!17230 a!3118) j!142) (bvlshr (select (arr!17230 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53827 (bvmul (bvxor h!12341 (bvlshr h!12341 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53827 (bvlshr x!53827 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!363240 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!363240 #b00000000000000000000000000000000))))))

(assert (=> d!85109 (= (toIndex!0 (select (arr!17230 a!3118) j!142) mask!3119) (bvand (bvxor lt!262361 (bvlshr lt!262361 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!574213 d!85109))

(declare-fun d!85111 () Bool)

(assert (=> d!85111 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!574203 d!85111))

(declare-fun d!85113 () Bool)

(assert (=> d!85113 (= (validKeyInArray!0 (select (arr!17230 a!3118) j!142)) (and (not (= (select (arr!17230 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17230 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!574214 d!85113))

(declare-fun d!85115 () Bool)

(declare-fun res!363247 () Bool)

(declare-fun e!330475 () Bool)

(assert (=> d!85115 (=> res!363247 e!330475)))

(assert (=> d!85115 (= res!363247 (= (select (arr!17230 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!85115 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!330475)))

(declare-fun b!574412 () Bool)

(declare-fun e!330476 () Bool)

(assert (=> b!574412 (= e!330475 e!330476)))

(declare-fun res!363248 () Bool)

(assert (=> b!574412 (=> (not res!363248) (not e!330476))))

(assert (=> b!574412 (= res!363248 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17594 a!3118)))))

(declare-fun b!574413 () Bool)

(assert (=> b!574413 (= e!330476 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!85115 (not res!363247)) b!574412))

(assert (= (and b!574412 res!363248) b!574413))

(assert (=> d!85115 m!553241))

(declare-fun m!553307 () Bool)

(assert (=> b!574413 m!553307))

(assert (=> b!574209 d!85115))

(declare-fun b!574414 () Bool)

(declare-fun e!330479 () SeekEntryResult!5679)

(assert (=> b!574414 (= e!330479 Undefined!5679)))

(declare-fun b!574415 () Bool)

(declare-fun e!330478 () SeekEntryResult!5679)

(declare-fun lt!262373 () SeekEntryResult!5679)

(assert (=> b!574415 (= e!330478 (Found!5679 (index!24945 lt!262373)))))

(declare-fun d!85119 () Bool)

(declare-fun lt!262372 () SeekEntryResult!5679)

(assert (=> d!85119 (and (or ((_ is Undefined!5679) lt!262372) (not ((_ is Found!5679) lt!262372)) (and (bvsge (index!24944 lt!262372) #b00000000000000000000000000000000) (bvslt (index!24944 lt!262372) (size!17594 lt!262254)))) (or ((_ is Undefined!5679) lt!262372) ((_ is Found!5679) lt!262372) (not ((_ is MissingZero!5679) lt!262372)) (and (bvsge (index!24943 lt!262372) #b00000000000000000000000000000000) (bvslt (index!24943 lt!262372) (size!17594 lt!262254)))) (or ((_ is Undefined!5679) lt!262372) ((_ is Found!5679) lt!262372) ((_ is MissingZero!5679) lt!262372) (not ((_ is MissingVacant!5679) lt!262372)) (and (bvsge (index!24946 lt!262372) #b00000000000000000000000000000000) (bvslt (index!24946 lt!262372) (size!17594 lt!262254)))) (or ((_ is Undefined!5679) lt!262372) (ite ((_ is Found!5679) lt!262372) (= (select (arr!17230 lt!262254) (index!24944 lt!262372)) lt!262261) (ite ((_ is MissingZero!5679) lt!262372) (= (select (arr!17230 lt!262254) (index!24943 lt!262372)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5679) lt!262372) (= (select (arr!17230 lt!262254) (index!24946 lt!262372)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85119 (= lt!262372 e!330479)))

(declare-fun c!65946 () Bool)

(assert (=> d!85119 (= c!65946 (and ((_ is Intermediate!5679) lt!262373) (undefined!6491 lt!262373)))))

(assert (=> d!85119 (= lt!262373 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!262261 mask!3119) lt!262261 lt!262254 mask!3119))))

(assert (=> d!85119 (validMask!0 mask!3119)))

(assert (=> d!85119 (= (seekEntryOrOpen!0 lt!262261 lt!262254 mask!3119) lt!262372)))

(declare-fun b!574416 () Bool)

(assert (=> b!574416 (= e!330479 e!330478)))

(declare-fun lt!262371 () (_ BitVec 64))

(assert (=> b!574416 (= lt!262371 (select (arr!17230 lt!262254) (index!24945 lt!262373)))))

(declare-fun c!65944 () Bool)

(assert (=> b!574416 (= c!65944 (= lt!262371 lt!262261))))

(declare-fun e!330477 () SeekEntryResult!5679)

(declare-fun b!574417 () Bool)

(assert (=> b!574417 (= e!330477 (seekKeyOrZeroReturnVacant!0 (x!53822 lt!262373) (index!24945 lt!262373) (index!24945 lt!262373) lt!262261 lt!262254 mask!3119))))

(declare-fun b!574418 () Bool)

(declare-fun c!65945 () Bool)

(assert (=> b!574418 (= c!65945 (= lt!262371 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!574418 (= e!330478 e!330477)))

(declare-fun b!574419 () Bool)

(assert (=> b!574419 (= e!330477 (MissingZero!5679 (index!24945 lt!262373)))))

(assert (= (and d!85119 c!65946) b!574414))

(assert (= (and d!85119 (not c!65946)) b!574416))

(assert (= (and b!574416 c!65944) b!574415))

(assert (= (and b!574416 (not c!65944)) b!574418))

(assert (= (and b!574418 c!65945) b!574419))

(assert (= (and b!574418 (not c!65945)) b!574417))

(assert (=> d!85119 m!553155))

(declare-fun m!553309 () Bool)

(assert (=> d!85119 m!553309))

(declare-fun m!553311 () Bool)

(assert (=> d!85119 m!553311))

(declare-fun m!553313 () Bool)

(assert (=> d!85119 m!553313))

(assert (=> d!85119 m!553135))

(assert (=> d!85119 m!553135))

(declare-fun m!553315 () Bool)

(assert (=> d!85119 m!553315))

(declare-fun m!553317 () Bool)

(assert (=> b!574416 m!553317))

(declare-fun m!553319 () Bool)

(assert (=> b!574417 m!553319))

(assert (=> b!574204 d!85119))

(declare-fun e!330503 () SeekEntryResult!5679)

(declare-fun b!574456 () Bool)

(assert (=> b!574456 (= e!330503 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53822 lt!262258) #b00000000000000000000000000000001) (nextIndex!0 (index!24945 lt!262258) (x!53822 lt!262258) mask!3119) (index!24945 lt!262258) lt!262261 lt!262254 mask!3119))))

(declare-fun b!574457 () Bool)

(declare-fun c!65963 () Bool)

(declare-fun lt!262392 () (_ BitVec 64))

(assert (=> b!574457 (= c!65963 (= lt!262392 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330502 () SeekEntryResult!5679)

(assert (=> b!574457 (= e!330502 e!330503)))

(declare-fun d!85121 () Bool)

(declare-fun lt!262393 () SeekEntryResult!5679)

(assert (=> d!85121 (and (or ((_ is Undefined!5679) lt!262393) (not ((_ is Found!5679) lt!262393)) (and (bvsge (index!24944 lt!262393) #b00000000000000000000000000000000) (bvslt (index!24944 lt!262393) (size!17594 lt!262254)))) (or ((_ is Undefined!5679) lt!262393) ((_ is Found!5679) lt!262393) (not ((_ is MissingVacant!5679) lt!262393)) (not (= (index!24946 lt!262393) (index!24945 lt!262258))) (and (bvsge (index!24946 lt!262393) #b00000000000000000000000000000000) (bvslt (index!24946 lt!262393) (size!17594 lt!262254)))) (or ((_ is Undefined!5679) lt!262393) (ite ((_ is Found!5679) lt!262393) (= (select (arr!17230 lt!262254) (index!24944 lt!262393)) lt!262261) (and ((_ is MissingVacant!5679) lt!262393) (= (index!24946 lt!262393) (index!24945 lt!262258)) (= (select (arr!17230 lt!262254) (index!24946 lt!262393)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!330501 () SeekEntryResult!5679)

(assert (=> d!85121 (= lt!262393 e!330501)))

(declare-fun c!65962 () Bool)

(assert (=> d!85121 (= c!65962 (bvsge (x!53822 lt!262258) #b01111111111111111111111111111110))))

(assert (=> d!85121 (= lt!262392 (select (arr!17230 lt!262254) (index!24945 lt!262258)))))

(assert (=> d!85121 (validMask!0 mask!3119)))

(assert (=> d!85121 (= (seekKeyOrZeroReturnVacant!0 (x!53822 lt!262258) (index!24945 lt!262258) (index!24945 lt!262258) lt!262261 lt!262254 mask!3119) lt!262393)))

(declare-fun b!574458 () Bool)

(assert (=> b!574458 (= e!330501 Undefined!5679)))

(declare-fun b!574459 () Bool)

(assert (=> b!574459 (= e!330502 (Found!5679 (index!24945 lt!262258)))))

(declare-fun b!574460 () Bool)

(assert (=> b!574460 (= e!330503 (MissingVacant!5679 (index!24945 lt!262258)))))

(declare-fun b!574461 () Bool)

(assert (=> b!574461 (= e!330501 e!330502)))

(declare-fun c!65964 () Bool)

(assert (=> b!574461 (= c!65964 (= lt!262392 lt!262261))))

(assert (= (and d!85121 c!65962) b!574458))

(assert (= (and d!85121 (not c!65962)) b!574461))

(assert (= (and b!574461 c!65964) b!574459))

(assert (= (and b!574461 (not c!65964)) b!574457))

(assert (= (and b!574457 c!65963) b!574460))

(assert (= (and b!574457 (not c!65963)) b!574456))

(declare-fun m!553345 () Bool)

(assert (=> b!574456 m!553345))

(assert (=> b!574456 m!553345))

(declare-fun m!553347 () Bool)

(assert (=> b!574456 m!553347))

(declare-fun m!553349 () Bool)

(assert (=> d!85121 m!553349))

(declare-fun m!553351 () Bool)

(assert (=> d!85121 m!553351))

(declare-fun m!553353 () Bool)

(assert (=> d!85121 m!553353))

(assert (=> d!85121 m!553155))

(assert (=> b!574204 d!85121))

(declare-fun b!574462 () Bool)

(declare-fun e!330506 () SeekEntryResult!5679)

(assert (=> b!574462 (= e!330506 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53822 lt!262258) #b00000000000000000000000000000001) (nextIndex!0 (index!24945 lt!262258) (x!53822 lt!262258) mask!3119) (index!24945 lt!262258) (select (arr!17230 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!574463 () Bool)

(declare-fun c!65966 () Bool)

(declare-fun lt!262396 () (_ BitVec 64))

(assert (=> b!574463 (= c!65966 (= lt!262396 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330505 () SeekEntryResult!5679)

(assert (=> b!574463 (= e!330505 e!330506)))

(declare-fun d!85133 () Bool)

(declare-fun lt!262397 () SeekEntryResult!5679)

(assert (=> d!85133 (and (or ((_ is Undefined!5679) lt!262397) (not ((_ is Found!5679) lt!262397)) (and (bvsge (index!24944 lt!262397) #b00000000000000000000000000000000) (bvslt (index!24944 lt!262397) (size!17594 a!3118)))) (or ((_ is Undefined!5679) lt!262397) ((_ is Found!5679) lt!262397) (not ((_ is MissingVacant!5679) lt!262397)) (not (= (index!24946 lt!262397) (index!24945 lt!262258))) (and (bvsge (index!24946 lt!262397) #b00000000000000000000000000000000) (bvslt (index!24946 lt!262397) (size!17594 a!3118)))) (or ((_ is Undefined!5679) lt!262397) (ite ((_ is Found!5679) lt!262397) (= (select (arr!17230 a!3118) (index!24944 lt!262397)) (select (arr!17230 a!3118) j!142)) (and ((_ is MissingVacant!5679) lt!262397) (= (index!24946 lt!262397) (index!24945 lt!262258)) (= (select (arr!17230 a!3118) (index!24946 lt!262397)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!330504 () SeekEntryResult!5679)

(assert (=> d!85133 (= lt!262397 e!330504)))

(declare-fun c!65965 () Bool)

(assert (=> d!85133 (= c!65965 (bvsge (x!53822 lt!262258) #b01111111111111111111111111111110))))

(assert (=> d!85133 (= lt!262396 (select (arr!17230 a!3118) (index!24945 lt!262258)))))

(assert (=> d!85133 (validMask!0 mask!3119)))

(assert (=> d!85133 (= (seekKeyOrZeroReturnVacant!0 (x!53822 lt!262258) (index!24945 lt!262258) (index!24945 lt!262258) (select (arr!17230 a!3118) j!142) a!3118 mask!3119) lt!262397)))

(declare-fun b!574464 () Bool)

(assert (=> b!574464 (= e!330504 Undefined!5679)))

(declare-fun b!574465 () Bool)

(assert (=> b!574465 (= e!330505 (Found!5679 (index!24945 lt!262258)))))

(declare-fun b!574466 () Bool)

(assert (=> b!574466 (= e!330506 (MissingVacant!5679 (index!24945 lt!262258)))))

(declare-fun b!574467 () Bool)

(assert (=> b!574467 (= e!330504 e!330505)))

(declare-fun c!65967 () Bool)

(assert (=> b!574467 (= c!65967 (= lt!262396 (select (arr!17230 a!3118) j!142)))))

(assert (= (and d!85133 c!65965) b!574464))

(assert (= (and d!85133 (not c!65965)) b!574467))

(assert (= (and b!574467 c!65967) b!574465))

(assert (= (and b!574467 (not c!65967)) b!574463))

(assert (= (and b!574463 c!65966) b!574466))

(assert (= (and b!574463 (not c!65966)) b!574462))

(assert (=> b!574462 m!553345))

(assert (=> b!574462 m!553345))

(assert (=> b!574462 m!553121))

(declare-fun m!553357 () Bool)

(assert (=> b!574462 m!553357))

(declare-fun m!553359 () Bool)

(assert (=> d!85133 m!553359))

(declare-fun m!553361 () Bool)

(assert (=> d!85133 m!553361))

(assert (=> d!85133 m!553123))

(assert (=> d!85133 m!553155))

(assert (=> b!574210 d!85133))

(declare-fun b!574472 () Bool)

(declare-fun e!330512 () SeekEntryResult!5679)

(assert (=> b!574472 (= e!330512 Undefined!5679)))

(declare-fun b!574473 () Bool)

(declare-fun e!330511 () SeekEntryResult!5679)

(declare-fun lt!262404 () SeekEntryResult!5679)

(assert (=> b!574473 (= e!330511 (Found!5679 (index!24945 lt!262404)))))

(declare-fun d!85137 () Bool)

(declare-fun lt!262403 () SeekEntryResult!5679)

(assert (=> d!85137 (and (or ((_ is Undefined!5679) lt!262403) (not ((_ is Found!5679) lt!262403)) (and (bvsge (index!24944 lt!262403) #b00000000000000000000000000000000) (bvslt (index!24944 lt!262403) (size!17594 a!3118)))) (or ((_ is Undefined!5679) lt!262403) ((_ is Found!5679) lt!262403) (not ((_ is MissingZero!5679) lt!262403)) (and (bvsge (index!24943 lt!262403) #b00000000000000000000000000000000) (bvslt (index!24943 lt!262403) (size!17594 a!3118)))) (or ((_ is Undefined!5679) lt!262403) ((_ is Found!5679) lt!262403) ((_ is MissingZero!5679) lt!262403) (not ((_ is MissingVacant!5679) lt!262403)) (and (bvsge (index!24946 lt!262403) #b00000000000000000000000000000000) (bvslt (index!24946 lt!262403) (size!17594 a!3118)))) (or ((_ is Undefined!5679) lt!262403) (ite ((_ is Found!5679) lt!262403) (= (select (arr!17230 a!3118) (index!24944 lt!262403)) k0!1914) (ite ((_ is MissingZero!5679) lt!262403) (= (select (arr!17230 a!3118) (index!24943 lt!262403)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5679) lt!262403) (= (select (arr!17230 a!3118) (index!24946 lt!262403)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85137 (= lt!262403 e!330512)))

(declare-fun c!65971 () Bool)

(assert (=> d!85137 (= c!65971 (and ((_ is Intermediate!5679) lt!262404) (undefined!6491 lt!262404)))))

(assert (=> d!85137 (= lt!262404 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!85137 (validMask!0 mask!3119)))

(assert (=> d!85137 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!262403)))

(declare-fun b!574474 () Bool)

(assert (=> b!574474 (= e!330512 e!330511)))

(declare-fun lt!262402 () (_ BitVec 64))

(assert (=> b!574474 (= lt!262402 (select (arr!17230 a!3118) (index!24945 lt!262404)))))

(declare-fun c!65969 () Bool)

(assert (=> b!574474 (= c!65969 (= lt!262402 k0!1914))))

(declare-fun e!330510 () SeekEntryResult!5679)

(declare-fun b!574475 () Bool)

(assert (=> b!574475 (= e!330510 (seekKeyOrZeroReturnVacant!0 (x!53822 lt!262404) (index!24945 lt!262404) (index!24945 lt!262404) k0!1914 a!3118 mask!3119))))

(declare-fun b!574476 () Bool)

(declare-fun c!65970 () Bool)

(assert (=> b!574476 (= c!65970 (= lt!262402 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!574476 (= e!330511 e!330510)))

(declare-fun b!574477 () Bool)

(assert (=> b!574477 (= e!330510 (MissingZero!5679 (index!24945 lt!262404)))))

(assert (= (and d!85137 c!65971) b!574472))

(assert (= (and d!85137 (not c!65971)) b!574474))

(assert (= (and b!574474 c!65969) b!574473))

(assert (= (and b!574474 (not c!65969)) b!574476))

(assert (= (and b!574476 c!65970) b!574477))

(assert (= (and b!574476 (not c!65970)) b!574475))

(assert (=> d!85137 m!553155))

(declare-fun m!553375 () Bool)

(assert (=> d!85137 m!553375))

(declare-fun m!553377 () Bool)

(assert (=> d!85137 m!553377))

(declare-fun m!553379 () Bool)

(assert (=> d!85137 m!553379))

(declare-fun m!553381 () Bool)

(assert (=> d!85137 m!553381))

(assert (=> d!85137 m!553381))

(declare-fun m!553383 () Bool)

(assert (=> d!85137 m!553383))

(declare-fun m!553385 () Bool)

(assert (=> b!574474 m!553385))

(declare-fun m!553387 () Bool)

(assert (=> b!574475 m!553387))

(assert (=> b!574211 d!85137))

(declare-fun d!85141 () Bool)

(assert (=> d!85141 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52618 d!85141))

(declare-fun d!85143 () Bool)

(assert (=> d!85143 (= (array_inv!13026 a!3118) (bvsge (size!17594 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52618 d!85143))

(declare-fun bm!32677 () Bool)

(declare-fun call!32680 () Bool)

(declare-fun c!65992 () Bool)

(assert (=> bm!32677 (= call!32680 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!65992 (Cons!11306 (select (arr!17230 a!3118) #b00000000000000000000000000000000) Nil!11307) Nil!11307)))))

(declare-fun b!574542 () Bool)

(declare-fun e!330553 () Bool)

(declare-fun contains!2889 (List!11310 (_ BitVec 64)) Bool)

(assert (=> b!574542 (= e!330553 (contains!2889 Nil!11307 (select (arr!17230 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!574543 () Bool)

(declare-fun e!330554 () Bool)

(assert (=> b!574543 (= e!330554 call!32680)))

(declare-fun b!574544 () Bool)

(declare-fun e!330552 () Bool)

(assert (=> b!574544 (= e!330552 e!330554)))

(assert (=> b!574544 (= c!65992 (validKeyInArray!0 (select (arr!17230 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!85147 () Bool)

(declare-fun res!363283 () Bool)

(declare-fun e!330551 () Bool)

(assert (=> d!85147 (=> res!363283 e!330551)))

(assert (=> d!85147 (= res!363283 (bvsge #b00000000000000000000000000000000 (size!17594 a!3118)))))

(assert (=> d!85147 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11307) e!330551)))

(declare-fun b!574545 () Bool)

(assert (=> b!574545 (= e!330551 e!330552)))

(declare-fun res!363282 () Bool)

(assert (=> b!574545 (=> (not res!363282) (not e!330552))))

(assert (=> b!574545 (= res!363282 (not e!330553))))

(declare-fun res!363284 () Bool)

(assert (=> b!574545 (=> (not res!363284) (not e!330553))))

(assert (=> b!574545 (= res!363284 (validKeyInArray!0 (select (arr!17230 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!574546 () Bool)

(assert (=> b!574546 (= e!330554 call!32680)))

(assert (= (and d!85147 (not res!363283)) b!574545))

(assert (= (and b!574545 res!363284) b!574542))

(assert (= (and b!574545 res!363282) b!574544))

(assert (= (and b!574544 c!65992) b!574546))

(assert (= (and b!574544 (not c!65992)) b!574543))

(assert (= (or b!574546 b!574543) bm!32677))

(assert (=> bm!32677 m!553241))

(declare-fun m!553405 () Bool)

(assert (=> bm!32677 m!553405))

(assert (=> b!574542 m!553241))

(assert (=> b!574542 m!553241))

(declare-fun m!553407 () Bool)

(assert (=> b!574542 m!553407))

(assert (=> b!574544 m!553241))

(assert (=> b!574544 m!553241))

(assert (=> b!574544 m!553243))

(assert (=> b!574545 m!553241))

(assert (=> b!574545 m!553241))

(assert (=> b!574545 m!553243))

(assert (=> b!574206 d!85147))

(check-sat (not b!574545) (not b!574386) (not d!85071) (not b!574542) (not b!574413) (not d!85085) (not b!574269) (not b!574462) (not b!574369) (not b!574456) (not d!85079) (not d!85121) (not b!574417) (not b!574316) (not b!574544) (not bm!32677) (not b!574315) (not bm!32666) (not d!85137) (not b!574294) (not b!574293) (not d!85119) (not b!574475) (not d!85103) (not d!85133) (not bm!32667))
(check-sat)
