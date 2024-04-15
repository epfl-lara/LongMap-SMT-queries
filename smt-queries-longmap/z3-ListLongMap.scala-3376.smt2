; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46536 () Bool)

(assert start!46536)

(declare-fun b!514032 () Bool)

(declare-fun e!300153 () Bool)

(declare-fun e!300151 () Bool)

(assert (=> b!514032 (= e!300153 e!300151)))

(declare-fun res!314107 () Bool)

(assert (=> b!514032 (=> (not res!314107) (not e!300151))))

(declare-datatypes ((SeekEntryResult!4321 0))(
  ( (MissingZero!4321 (index!19472 (_ BitVec 32))) (Found!4321 (index!19473 (_ BitVec 32))) (Intermediate!4321 (undefined!5133 Bool) (index!19474 (_ BitVec 32)) (x!48443 (_ BitVec 32))) (Undefined!4321) (MissingVacant!4321 (index!19475 (_ BitVec 32))) )
))
(declare-fun lt!235220 () SeekEntryResult!4321)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!514032 (= res!314107 (or (= lt!235220 (MissingZero!4321 i!1204)) (= lt!235220 (MissingVacant!4321 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32972 0))(
  ( (array!32973 (arr!15857 (Array (_ BitVec 32) (_ BitVec 64))) (size!16222 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32972)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32972 (_ BitVec 32)) SeekEntryResult!4321)

(assert (=> b!514032 (= lt!235220 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!314109 () Bool)

(assert (=> start!46536 (=> (not res!314109) (not e!300153))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46536 (= res!314109 (validMask!0 mask!3524))))

(assert (=> start!46536 e!300153))

(assert (=> start!46536 true))

(declare-fun array_inv!11740 (array!32972) Bool)

(assert (=> start!46536 (array_inv!11740 a!3235)))

(declare-fun b!514033 () Bool)

(declare-fun res!314110 () Bool)

(assert (=> b!514033 (=> (not res!314110) (not e!300151))))

(declare-datatypes ((List!10054 0))(
  ( (Nil!10051) (Cons!10050 (h!10942 (_ BitVec 64)) (t!16273 List!10054)) )
))
(declare-fun arrayNoDuplicates!0 (array!32972 (_ BitVec 32) List!10054) Bool)

(assert (=> b!514033 (= res!314110 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10051))))

(declare-fun b!514034 () Bool)

(declare-fun res!314108 () Bool)

(declare-fun e!300150 () Bool)

(assert (=> b!514034 (=> res!314108 e!300150)))

(declare-fun lt!235218 () SeekEntryResult!4321)

(get-info :version)

(assert (=> b!514034 (= res!314108 (or (undefined!5133 lt!235218) (not ((_ is Intermediate!4321) lt!235218))))))

(declare-fun b!514035 () Bool)

(declare-fun res!314106 () Bool)

(assert (=> b!514035 (=> (not res!314106) (not e!300151))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32972 (_ BitVec 32)) Bool)

(assert (=> b!514035 (= res!314106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!514036 () Bool)

(assert (=> b!514036 (= e!300150 (or (= (select (arr!15857 a!3235) (index!19474 lt!235218)) (select (arr!15857 a!3235) j!176)) (= (select (arr!15857 a!3235) (index!19474 lt!235218)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15857 a!3235) (index!19474 lt!235218)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!514036 (bvslt (x!48443 lt!235218) #b01111111111111111111111111111110)))

(declare-fun b!514037 () Bool)

(declare-fun res!314104 () Bool)

(assert (=> b!514037 (=> (not res!314104) (not e!300153))))

(declare-fun arrayContainsKey!0 (array!32972 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!514037 (= res!314104 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!514038 () Bool)

(assert (=> b!514038 (= e!300151 (not e!300150))))

(declare-fun res!314114 () Bool)

(assert (=> b!514038 (=> res!314114 e!300150)))

(declare-fun lt!235221 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32972 (_ BitVec 32)) SeekEntryResult!4321)

(assert (=> b!514038 (= res!314114 (= lt!235218 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235221 (select (store (arr!15857 a!3235) i!1204 k0!2280) j!176) (array!32973 (store (arr!15857 a!3235) i!1204 k0!2280) (size!16222 a!3235)) mask!3524)))))

(declare-fun lt!235222 () (_ BitVec 32))

(assert (=> b!514038 (= lt!235218 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235222 (select (arr!15857 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!514038 (= lt!235221 (toIndex!0 (select (store (arr!15857 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!514038 (= lt!235222 (toIndex!0 (select (arr!15857 a!3235) j!176) mask!3524))))

(declare-fun e!300149 () Bool)

(assert (=> b!514038 e!300149))

(declare-fun res!314111 () Bool)

(assert (=> b!514038 (=> (not res!314111) (not e!300149))))

(assert (=> b!514038 (= res!314111 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15886 0))(
  ( (Unit!15887) )
))
(declare-fun lt!235219 () Unit!15886)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32972 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15886)

(assert (=> b!514038 (= lt!235219 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!514039 () Bool)

(declare-fun res!314113 () Bool)

(assert (=> b!514039 (=> (not res!314113) (not e!300153))))

(assert (=> b!514039 (= res!314113 (and (= (size!16222 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16222 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16222 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!514040 () Bool)

(declare-fun res!314112 () Bool)

(assert (=> b!514040 (=> (not res!314112) (not e!300153))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!514040 (= res!314112 (validKeyInArray!0 (select (arr!15857 a!3235) j!176)))))

(declare-fun b!514041 () Bool)

(declare-fun res!314105 () Bool)

(assert (=> b!514041 (=> (not res!314105) (not e!300153))))

(assert (=> b!514041 (= res!314105 (validKeyInArray!0 k0!2280))))

(declare-fun b!514042 () Bool)

(assert (=> b!514042 (= e!300149 (= (seekEntryOrOpen!0 (select (arr!15857 a!3235) j!176) a!3235 mask!3524) (Found!4321 j!176)))))

(assert (= (and start!46536 res!314109) b!514039))

(assert (= (and b!514039 res!314113) b!514040))

(assert (= (and b!514040 res!314112) b!514041))

(assert (= (and b!514041 res!314105) b!514037))

(assert (= (and b!514037 res!314104) b!514032))

(assert (= (and b!514032 res!314107) b!514035))

(assert (= (and b!514035 res!314106) b!514033))

(assert (= (and b!514033 res!314110) b!514038))

(assert (= (and b!514038 res!314111) b!514042))

(assert (= (and b!514038 (not res!314114)) b!514034))

(assert (= (and b!514034 (not res!314108)) b!514036))

(declare-fun m!494977 () Bool)

(assert (=> b!514040 m!494977))

(assert (=> b!514040 m!494977))

(declare-fun m!494979 () Bool)

(assert (=> b!514040 m!494979))

(declare-fun m!494981 () Bool)

(assert (=> start!46536 m!494981))

(declare-fun m!494983 () Bool)

(assert (=> start!46536 m!494983))

(declare-fun m!494985 () Bool)

(assert (=> b!514033 m!494985))

(assert (=> b!514042 m!494977))

(assert (=> b!514042 m!494977))

(declare-fun m!494987 () Bool)

(assert (=> b!514042 m!494987))

(declare-fun m!494989 () Bool)

(assert (=> b!514036 m!494989))

(assert (=> b!514036 m!494977))

(declare-fun m!494991 () Bool)

(assert (=> b!514035 m!494991))

(declare-fun m!494993 () Bool)

(assert (=> b!514037 m!494993))

(declare-fun m!494995 () Bool)

(assert (=> b!514038 m!494995))

(declare-fun m!494997 () Bool)

(assert (=> b!514038 m!494997))

(declare-fun m!494999 () Bool)

(assert (=> b!514038 m!494999))

(declare-fun m!495001 () Bool)

(assert (=> b!514038 m!495001))

(assert (=> b!514038 m!494995))

(assert (=> b!514038 m!494977))

(declare-fun m!495003 () Bool)

(assert (=> b!514038 m!495003))

(assert (=> b!514038 m!494977))

(declare-fun m!495005 () Bool)

(assert (=> b!514038 m!495005))

(assert (=> b!514038 m!494977))

(declare-fun m!495007 () Bool)

(assert (=> b!514038 m!495007))

(assert (=> b!514038 m!494995))

(declare-fun m!495009 () Bool)

(assert (=> b!514038 m!495009))

(declare-fun m!495011 () Bool)

(assert (=> b!514032 m!495011))

(declare-fun m!495013 () Bool)

(assert (=> b!514041 m!495013))

(check-sat (not b!514032) (not b!514037) (not b!514035) (not b!514042) (not b!514038) (not start!46536) (not b!514041) (not b!514033) (not b!514040))
(check-sat)
(get-model)

(declare-fun d!79155 () Bool)

(declare-fun res!314185 () Bool)

(declare-fun e!300191 () Bool)

(assert (=> d!79155 (=> res!314185 e!300191)))

(assert (=> d!79155 (= res!314185 (bvsge #b00000000000000000000000000000000 (size!16222 a!3235)))))

(assert (=> d!79155 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!300191)))

(declare-fun b!514117 () Bool)

(declare-fun e!300192 () Bool)

(declare-fun call!31576 () Bool)

(assert (=> b!514117 (= e!300192 call!31576)))

(declare-fun b!514118 () Bool)

(declare-fun e!300190 () Bool)

(assert (=> b!514118 (= e!300190 call!31576)))

(declare-fun b!514119 () Bool)

(assert (=> b!514119 (= e!300191 e!300192)))

(declare-fun c!60252 () Bool)

(assert (=> b!514119 (= c!60252 (validKeyInArray!0 (select (arr!15857 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31573 () Bool)

(assert (=> bm!31573 (= call!31576 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!514120 () Bool)

(assert (=> b!514120 (= e!300192 e!300190)))

(declare-fun lt!235260 () (_ BitVec 64))

(assert (=> b!514120 (= lt!235260 (select (arr!15857 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!235261 () Unit!15886)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32972 (_ BitVec 64) (_ BitVec 32)) Unit!15886)

(assert (=> b!514120 (= lt!235261 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235260 #b00000000000000000000000000000000))))

(assert (=> b!514120 (arrayContainsKey!0 a!3235 lt!235260 #b00000000000000000000000000000000)))

(declare-fun lt!235259 () Unit!15886)

(assert (=> b!514120 (= lt!235259 lt!235261)))

(declare-fun res!314186 () Bool)

(assert (=> b!514120 (= res!314186 (= (seekEntryOrOpen!0 (select (arr!15857 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4321 #b00000000000000000000000000000000)))))

(assert (=> b!514120 (=> (not res!314186) (not e!300190))))

(assert (= (and d!79155 (not res!314185)) b!514119))

(assert (= (and b!514119 c!60252) b!514120))

(assert (= (and b!514119 (not c!60252)) b!514117))

(assert (= (and b!514120 res!314186) b!514118))

(assert (= (or b!514118 b!514117) bm!31573))

(declare-fun m!495091 () Bool)

(assert (=> b!514119 m!495091))

(assert (=> b!514119 m!495091))

(declare-fun m!495093 () Bool)

(assert (=> b!514119 m!495093))

(declare-fun m!495095 () Bool)

(assert (=> bm!31573 m!495095))

(assert (=> b!514120 m!495091))

(declare-fun m!495097 () Bool)

(assert (=> b!514120 m!495097))

(declare-fun m!495099 () Bool)

(assert (=> b!514120 m!495099))

(assert (=> b!514120 m!495091))

(declare-fun m!495101 () Bool)

(assert (=> b!514120 m!495101))

(assert (=> b!514035 d!79155))

(declare-fun d!79157 () Bool)

(assert (=> d!79157 (= (validKeyInArray!0 (select (arr!15857 a!3235) j!176)) (and (not (= (select (arr!15857 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15857 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!514040 d!79157))

(declare-fun d!79159 () Bool)

(assert (=> d!79159 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46536 d!79159))

(declare-fun d!79161 () Bool)

(assert (=> d!79161 (= (array_inv!11740 a!3235) (bvsge (size!16222 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46536 d!79161))

(declare-fun d!79163 () Bool)

(declare-fun lt!235275 () SeekEntryResult!4321)

(assert (=> d!79163 (and (or ((_ is Undefined!4321) lt!235275) (not ((_ is Found!4321) lt!235275)) (and (bvsge (index!19473 lt!235275) #b00000000000000000000000000000000) (bvslt (index!19473 lt!235275) (size!16222 a!3235)))) (or ((_ is Undefined!4321) lt!235275) ((_ is Found!4321) lt!235275) (not ((_ is MissingZero!4321) lt!235275)) (and (bvsge (index!19472 lt!235275) #b00000000000000000000000000000000) (bvslt (index!19472 lt!235275) (size!16222 a!3235)))) (or ((_ is Undefined!4321) lt!235275) ((_ is Found!4321) lt!235275) ((_ is MissingZero!4321) lt!235275) (not ((_ is MissingVacant!4321) lt!235275)) (and (bvsge (index!19475 lt!235275) #b00000000000000000000000000000000) (bvslt (index!19475 lt!235275) (size!16222 a!3235)))) (or ((_ is Undefined!4321) lt!235275) (ite ((_ is Found!4321) lt!235275) (= (select (arr!15857 a!3235) (index!19473 lt!235275)) (select (arr!15857 a!3235) j!176)) (ite ((_ is MissingZero!4321) lt!235275) (= (select (arr!15857 a!3235) (index!19472 lt!235275)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4321) lt!235275) (= (select (arr!15857 a!3235) (index!19475 lt!235275)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!300206 () SeekEntryResult!4321)

(assert (=> d!79163 (= lt!235275 e!300206)))

(declare-fun c!60261 () Bool)

(declare-fun lt!235274 () SeekEntryResult!4321)

(assert (=> d!79163 (= c!60261 (and ((_ is Intermediate!4321) lt!235274) (undefined!5133 lt!235274)))))

(assert (=> d!79163 (= lt!235274 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15857 a!3235) j!176) mask!3524) (select (arr!15857 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79163 (validMask!0 mask!3524)))

(assert (=> d!79163 (= (seekEntryOrOpen!0 (select (arr!15857 a!3235) j!176) a!3235 mask!3524) lt!235275)))

(declare-fun b!514139 () Bool)

(declare-fun e!300205 () SeekEntryResult!4321)

(assert (=> b!514139 (= e!300205 (Found!4321 (index!19474 lt!235274)))))

(declare-fun b!514140 () Bool)

(assert (=> b!514140 (= e!300206 e!300205)))

(declare-fun lt!235276 () (_ BitVec 64))

(assert (=> b!514140 (= lt!235276 (select (arr!15857 a!3235) (index!19474 lt!235274)))))

(declare-fun c!60259 () Bool)

(assert (=> b!514140 (= c!60259 (= lt!235276 (select (arr!15857 a!3235) j!176)))))

(declare-fun b!514141 () Bool)

(declare-fun e!300207 () SeekEntryResult!4321)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32972 (_ BitVec 32)) SeekEntryResult!4321)

(assert (=> b!514141 (= e!300207 (seekKeyOrZeroReturnVacant!0 (x!48443 lt!235274) (index!19474 lt!235274) (index!19474 lt!235274) (select (arr!15857 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!514142 () Bool)

(assert (=> b!514142 (= e!300207 (MissingZero!4321 (index!19474 lt!235274)))))

(declare-fun b!514143 () Bool)

(assert (=> b!514143 (= e!300206 Undefined!4321)))

(declare-fun b!514144 () Bool)

(declare-fun c!60260 () Bool)

(assert (=> b!514144 (= c!60260 (= lt!235276 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!514144 (= e!300205 e!300207)))

(assert (= (and d!79163 c!60261) b!514143))

(assert (= (and d!79163 (not c!60261)) b!514140))

(assert (= (and b!514140 c!60259) b!514139))

(assert (= (and b!514140 (not c!60259)) b!514144))

(assert (= (and b!514144 c!60260) b!514142))

(assert (= (and b!514144 (not c!60260)) b!514141))

(declare-fun m!495107 () Bool)

(assert (=> d!79163 m!495107))

(declare-fun m!495109 () Bool)

(assert (=> d!79163 m!495109))

(assert (=> d!79163 m!494981))

(assert (=> d!79163 m!494977))

(assert (=> d!79163 m!495005))

(declare-fun m!495111 () Bool)

(assert (=> d!79163 m!495111))

(assert (=> d!79163 m!495005))

(assert (=> d!79163 m!494977))

(declare-fun m!495113 () Bool)

(assert (=> d!79163 m!495113))

(declare-fun m!495115 () Bool)

(assert (=> b!514140 m!495115))

(assert (=> b!514141 m!494977))

(declare-fun m!495117 () Bool)

(assert (=> b!514141 m!495117))

(assert (=> b!514042 d!79163))

(declare-fun d!79175 () Bool)

(assert (=> d!79175 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!514041 d!79175))

(declare-fun b!514205 () Bool)

(declare-fun lt!235308 () SeekEntryResult!4321)

(assert (=> b!514205 (and (bvsge (index!19474 lt!235308) #b00000000000000000000000000000000) (bvslt (index!19474 lt!235308) (size!16222 a!3235)))))

(declare-fun res!314214 () Bool)

(assert (=> b!514205 (= res!314214 (= (select (arr!15857 a!3235) (index!19474 lt!235308)) (select (arr!15857 a!3235) j!176)))))

(declare-fun e!300245 () Bool)

(assert (=> b!514205 (=> res!314214 e!300245)))

(declare-fun e!300246 () Bool)

(assert (=> b!514205 (= e!300246 e!300245)))

(declare-fun b!514206 () Bool)

(assert (=> b!514206 (and (bvsge (index!19474 lt!235308) #b00000000000000000000000000000000) (bvslt (index!19474 lt!235308) (size!16222 a!3235)))))

(declare-fun res!314213 () Bool)

(assert (=> b!514206 (= res!314213 (= (select (arr!15857 a!3235) (index!19474 lt!235308)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!514206 (=> res!314213 e!300245)))

(declare-fun b!514207 () Bool)

(declare-fun e!300249 () Bool)

(assert (=> b!514207 (= e!300249 e!300246)))

(declare-fun res!314212 () Bool)

(assert (=> b!514207 (= res!314212 (and ((_ is Intermediate!4321) lt!235308) (not (undefined!5133 lt!235308)) (bvslt (x!48443 lt!235308) #b01111111111111111111111111111110) (bvsge (x!48443 lt!235308) #b00000000000000000000000000000000) (bvsge (x!48443 lt!235308) #b00000000000000000000000000000000)))))

(assert (=> b!514207 (=> (not res!314212) (not e!300246))))

(declare-fun b!514208 () Bool)

(assert (=> b!514208 (= e!300249 (bvsge (x!48443 lt!235308) #b01111111111111111111111111111110))))

(declare-fun d!79177 () Bool)

(assert (=> d!79177 e!300249))

(declare-fun c!60283 () Bool)

(assert (=> d!79177 (= c!60283 (and ((_ is Intermediate!4321) lt!235308) (undefined!5133 lt!235308)))))

(declare-fun e!300247 () SeekEntryResult!4321)

(assert (=> d!79177 (= lt!235308 e!300247)))

(declare-fun c!60285 () Bool)

(assert (=> d!79177 (= c!60285 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!235309 () (_ BitVec 64))

(assert (=> d!79177 (= lt!235309 (select (arr!15857 a!3235) lt!235222))))

(assert (=> d!79177 (validMask!0 mask!3524)))

(assert (=> d!79177 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235222 (select (arr!15857 a!3235) j!176) a!3235 mask!3524) lt!235308)))

(declare-fun b!514209 () Bool)

(assert (=> b!514209 (and (bvsge (index!19474 lt!235308) #b00000000000000000000000000000000) (bvslt (index!19474 lt!235308) (size!16222 a!3235)))))

(assert (=> b!514209 (= e!300245 (= (select (arr!15857 a!3235) (index!19474 lt!235308)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!514210 () Bool)

(declare-fun e!300248 () SeekEntryResult!4321)

(assert (=> b!514210 (= e!300247 e!300248)))

(declare-fun c!60284 () Bool)

(assert (=> b!514210 (= c!60284 (or (= lt!235309 (select (arr!15857 a!3235) j!176)) (= (bvadd lt!235309 lt!235309) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!514211 () Bool)

(assert (=> b!514211 (= e!300248 (Intermediate!4321 false lt!235222 #b00000000000000000000000000000000))))

(declare-fun b!514212 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!514212 (= e!300248 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!235222 #b00000000000000000000000000000000 mask!3524) (select (arr!15857 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!514213 () Bool)

(assert (=> b!514213 (= e!300247 (Intermediate!4321 true lt!235222 #b00000000000000000000000000000000))))

(assert (= (and d!79177 c!60285) b!514213))

(assert (= (and d!79177 (not c!60285)) b!514210))

(assert (= (and b!514210 c!60284) b!514211))

(assert (= (and b!514210 (not c!60284)) b!514212))

(assert (= (and d!79177 c!60283) b!514208))

(assert (= (and d!79177 (not c!60283)) b!514207))

(assert (= (and b!514207 res!314212) b!514205))

(assert (= (and b!514205 (not res!314214)) b!514206))

(assert (= (and b!514206 (not res!314213)) b!514209))

(declare-fun m!495149 () Bool)

(assert (=> b!514209 m!495149))

(declare-fun m!495151 () Bool)

(assert (=> d!79177 m!495151))

(assert (=> d!79177 m!494981))

(assert (=> b!514206 m!495149))

(declare-fun m!495153 () Bool)

(assert (=> b!514212 m!495153))

(assert (=> b!514212 m!495153))

(assert (=> b!514212 m!494977))

(declare-fun m!495155 () Bool)

(assert (=> b!514212 m!495155))

(assert (=> b!514205 m!495149))

(assert (=> b!514038 d!79177))

(declare-fun d!79189 () Bool)

(declare-fun lt!235319 () (_ BitVec 32))

(declare-fun lt!235318 () (_ BitVec 32))

(assert (=> d!79189 (= lt!235319 (bvmul (bvxor lt!235318 (bvlshr lt!235318 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79189 (= lt!235318 ((_ extract 31 0) (bvand (bvxor (select (arr!15857 a!3235) j!176) (bvlshr (select (arr!15857 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79189 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!314221 (let ((h!10946 ((_ extract 31 0) (bvand (bvxor (select (arr!15857 a!3235) j!176) (bvlshr (select (arr!15857 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48449 (bvmul (bvxor h!10946 (bvlshr h!10946 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48449 (bvlshr x!48449 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!314221 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!314221 #b00000000000000000000000000000000))))))

(assert (=> d!79189 (= (toIndex!0 (select (arr!15857 a!3235) j!176) mask!3524) (bvand (bvxor lt!235319 (bvlshr lt!235319 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!514038 d!79189))

(declare-fun d!79193 () Bool)

(declare-fun res!314232 () Bool)

(declare-fun e!300273 () Bool)

(assert (=> d!79193 (=> res!314232 e!300273)))

(assert (=> d!79193 (= res!314232 (bvsge j!176 (size!16222 a!3235)))))

(assert (=> d!79193 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!300273)))

(declare-fun b!514247 () Bool)

(declare-fun e!300274 () Bool)

(declare-fun call!31586 () Bool)

(assert (=> b!514247 (= e!300274 call!31586)))

(declare-fun b!514248 () Bool)

(declare-fun e!300272 () Bool)

(assert (=> b!514248 (= e!300272 call!31586)))

(declare-fun b!514249 () Bool)

(assert (=> b!514249 (= e!300273 e!300274)))

(declare-fun c!60295 () Bool)

(assert (=> b!514249 (= c!60295 (validKeyInArray!0 (select (arr!15857 a!3235) j!176)))))

(declare-fun bm!31583 () Bool)

(assert (=> bm!31583 (= call!31586 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!514250 () Bool)

(assert (=> b!514250 (= e!300274 e!300272)))

(declare-fun lt!235323 () (_ BitVec 64))

(assert (=> b!514250 (= lt!235323 (select (arr!15857 a!3235) j!176))))

(declare-fun lt!235326 () Unit!15886)

(assert (=> b!514250 (= lt!235326 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235323 j!176))))

(assert (=> b!514250 (arrayContainsKey!0 a!3235 lt!235323 #b00000000000000000000000000000000)))

(declare-fun lt!235322 () Unit!15886)

(assert (=> b!514250 (= lt!235322 lt!235326)))

(declare-fun res!314233 () Bool)

(assert (=> b!514250 (= res!314233 (= (seekEntryOrOpen!0 (select (arr!15857 a!3235) j!176) a!3235 mask!3524) (Found!4321 j!176)))))

(assert (=> b!514250 (=> (not res!314233) (not e!300272))))

(assert (= (and d!79193 (not res!314232)) b!514249))

(assert (= (and b!514249 c!60295) b!514250))

(assert (= (and b!514249 (not c!60295)) b!514247))

(assert (= (and b!514250 res!314233) b!514248))

(assert (= (or b!514248 b!514247) bm!31583))

(assert (=> b!514249 m!494977))

(assert (=> b!514249 m!494977))

(assert (=> b!514249 m!494979))

(declare-fun m!495161 () Bool)

(assert (=> bm!31583 m!495161))

(assert (=> b!514250 m!494977))

(declare-fun m!495163 () Bool)

(assert (=> b!514250 m!495163))

(declare-fun m!495165 () Bool)

(assert (=> b!514250 m!495165))

(assert (=> b!514250 m!494977))

(assert (=> b!514250 m!494987))

(assert (=> b!514038 d!79193))

(declare-fun lt!235334 () SeekEntryResult!4321)

(declare-fun b!514264 () Bool)

(assert (=> b!514264 (and (bvsge (index!19474 lt!235334) #b00000000000000000000000000000000) (bvslt (index!19474 lt!235334) (size!16222 (array!32973 (store (arr!15857 a!3235) i!1204 k0!2280) (size!16222 a!3235)))))))

(declare-fun res!314241 () Bool)

(assert (=> b!514264 (= res!314241 (= (select (arr!15857 (array!32973 (store (arr!15857 a!3235) i!1204 k0!2280) (size!16222 a!3235))) (index!19474 lt!235334)) (select (store (arr!15857 a!3235) i!1204 k0!2280) j!176)))))

(declare-fun e!300283 () Bool)

(assert (=> b!514264 (=> res!314241 e!300283)))

(declare-fun e!300284 () Bool)

(assert (=> b!514264 (= e!300284 e!300283)))

(declare-fun b!514265 () Bool)

(assert (=> b!514265 (and (bvsge (index!19474 lt!235334) #b00000000000000000000000000000000) (bvslt (index!19474 lt!235334) (size!16222 (array!32973 (store (arr!15857 a!3235) i!1204 k0!2280) (size!16222 a!3235)))))))

(declare-fun res!314240 () Bool)

(assert (=> b!514265 (= res!314240 (= (select (arr!15857 (array!32973 (store (arr!15857 a!3235) i!1204 k0!2280) (size!16222 a!3235))) (index!19474 lt!235334)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!514265 (=> res!314240 e!300283)))

(declare-fun b!514266 () Bool)

(declare-fun e!300287 () Bool)

(assert (=> b!514266 (= e!300287 e!300284)))

(declare-fun res!314239 () Bool)

(assert (=> b!514266 (= res!314239 (and ((_ is Intermediate!4321) lt!235334) (not (undefined!5133 lt!235334)) (bvslt (x!48443 lt!235334) #b01111111111111111111111111111110) (bvsge (x!48443 lt!235334) #b00000000000000000000000000000000) (bvsge (x!48443 lt!235334) #b00000000000000000000000000000000)))))

(assert (=> b!514266 (=> (not res!314239) (not e!300284))))

(declare-fun b!514267 () Bool)

(assert (=> b!514267 (= e!300287 (bvsge (x!48443 lt!235334) #b01111111111111111111111111111110))))

(declare-fun d!79197 () Bool)

(assert (=> d!79197 e!300287))

(declare-fun c!60300 () Bool)

(assert (=> d!79197 (= c!60300 (and ((_ is Intermediate!4321) lt!235334) (undefined!5133 lt!235334)))))

(declare-fun e!300285 () SeekEntryResult!4321)

(assert (=> d!79197 (= lt!235334 e!300285)))

(declare-fun c!60302 () Bool)

(assert (=> d!79197 (= c!60302 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!235335 () (_ BitVec 64))

(assert (=> d!79197 (= lt!235335 (select (arr!15857 (array!32973 (store (arr!15857 a!3235) i!1204 k0!2280) (size!16222 a!3235))) lt!235221))))

(assert (=> d!79197 (validMask!0 mask!3524)))

(assert (=> d!79197 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235221 (select (store (arr!15857 a!3235) i!1204 k0!2280) j!176) (array!32973 (store (arr!15857 a!3235) i!1204 k0!2280) (size!16222 a!3235)) mask!3524) lt!235334)))

(declare-fun b!514268 () Bool)

(assert (=> b!514268 (and (bvsge (index!19474 lt!235334) #b00000000000000000000000000000000) (bvslt (index!19474 lt!235334) (size!16222 (array!32973 (store (arr!15857 a!3235) i!1204 k0!2280) (size!16222 a!3235)))))))

(assert (=> b!514268 (= e!300283 (= (select (arr!15857 (array!32973 (store (arr!15857 a!3235) i!1204 k0!2280) (size!16222 a!3235))) (index!19474 lt!235334)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!514269 () Bool)

(declare-fun e!300286 () SeekEntryResult!4321)

(assert (=> b!514269 (= e!300285 e!300286)))

(declare-fun c!60301 () Bool)

(assert (=> b!514269 (= c!60301 (or (= lt!235335 (select (store (arr!15857 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!235335 lt!235335) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!514270 () Bool)

(assert (=> b!514270 (= e!300286 (Intermediate!4321 false lt!235221 #b00000000000000000000000000000000))))

(declare-fun b!514271 () Bool)

(assert (=> b!514271 (= e!300286 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!235221 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15857 a!3235) i!1204 k0!2280) j!176) (array!32973 (store (arr!15857 a!3235) i!1204 k0!2280) (size!16222 a!3235)) mask!3524))))

(declare-fun b!514272 () Bool)

(assert (=> b!514272 (= e!300285 (Intermediate!4321 true lt!235221 #b00000000000000000000000000000000))))

(assert (= (and d!79197 c!60302) b!514272))

(assert (= (and d!79197 (not c!60302)) b!514269))

(assert (= (and b!514269 c!60301) b!514270))

(assert (= (and b!514269 (not c!60301)) b!514271))

(assert (= (and d!79197 c!60300) b!514267))

(assert (= (and d!79197 (not c!60300)) b!514266))

(assert (= (and b!514266 res!314239) b!514264))

(assert (= (and b!514264 (not res!314241)) b!514265))

(assert (= (and b!514265 (not res!314240)) b!514268))

(declare-fun m!495181 () Bool)

(assert (=> b!514268 m!495181))

(declare-fun m!495183 () Bool)

(assert (=> d!79197 m!495183))

(assert (=> d!79197 m!494981))

(assert (=> b!514265 m!495181))

(declare-fun m!495185 () Bool)

(assert (=> b!514271 m!495185))

(assert (=> b!514271 m!495185))

(assert (=> b!514271 m!494995))

(declare-fun m!495187 () Bool)

(assert (=> b!514271 m!495187))

(assert (=> b!514264 m!495181))

(assert (=> b!514038 d!79197))

(declare-fun d!79203 () Bool)

(assert (=> d!79203 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!235343 () Unit!15886)

(declare-fun choose!38 (array!32972 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15886)

(assert (=> d!79203 (= lt!235343 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79203 (validMask!0 mask!3524)))

(assert (=> d!79203 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!235343)))

(declare-fun bs!16238 () Bool)

(assert (= bs!16238 d!79203))

(assert (=> bs!16238 m!495007))

(declare-fun m!495191 () Bool)

(assert (=> bs!16238 m!495191))

(assert (=> bs!16238 m!494981))

(assert (=> b!514038 d!79203))

(declare-fun d!79209 () Bool)

(declare-fun lt!235347 () (_ BitVec 32))

(declare-fun lt!235346 () (_ BitVec 32))

(assert (=> d!79209 (= lt!235347 (bvmul (bvxor lt!235346 (bvlshr lt!235346 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79209 (= lt!235346 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15857 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15857 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79209 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!314221 (let ((h!10946 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15857 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15857 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48449 (bvmul (bvxor h!10946 (bvlshr h!10946 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48449 (bvlshr x!48449 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!314221 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!314221 #b00000000000000000000000000000000))))))

(assert (=> d!79209 (= (toIndex!0 (select (store (arr!15857 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!235347 (bvlshr lt!235347 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!514038 d!79209))

(declare-fun d!79211 () Bool)

(declare-fun res!314249 () Bool)

(declare-fun e!300297 () Bool)

(assert (=> d!79211 (=> res!314249 e!300297)))

(assert (=> d!79211 (= res!314249 (= (select (arr!15857 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!79211 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!300297)))

(declare-fun b!514286 () Bool)

(declare-fun e!300298 () Bool)

(assert (=> b!514286 (= e!300297 e!300298)))

(declare-fun res!314250 () Bool)

(assert (=> b!514286 (=> (not res!314250) (not e!300298))))

(assert (=> b!514286 (= res!314250 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16222 a!3235)))))

(declare-fun b!514287 () Bool)

(assert (=> b!514287 (= e!300298 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79211 (not res!314249)) b!514286))

(assert (= (and b!514286 res!314250) b!514287))

(assert (=> d!79211 m!495091))

(declare-fun m!495201 () Bool)

(assert (=> b!514287 m!495201))

(assert (=> b!514037 d!79211))

(declare-fun d!79215 () Bool)

(declare-fun lt!235349 () SeekEntryResult!4321)

(assert (=> d!79215 (and (or ((_ is Undefined!4321) lt!235349) (not ((_ is Found!4321) lt!235349)) (and (bvsge (index!19473 lt!235349) #b00000000000000000000000000000000) (bvslt (index!19473 lt!235349) (size!16222 a!3235)))) (or ((_ is Undefined!4321) lt!235349) ((_ is Found!4321) lt!235349) (not ((_ is MissingZero!4321) lt!235349)) (and (bvsge (index!19472 lt!235349) #b00000000000000000000000000000000) (bvslt (index!19472 lt!235349) (size!16222 a!3235)))) (or ((_ is Undefined!4321) lt!235349) ((_ is Found!4321) lt!235349) ((_ is MissingZero!4321) lt!235349) (not ((_ is MissingVacant!4321) lt!235349)) (and (bvsge (index!19475 lt!235349) #b00000000000000000000000000000000) (bvslt (index!19475 lt!235349) (size!16222 a!3235)))) (or ((_ is Undefined!4321) lt!235349) (ite ((_ is Found!4321) lt!235349) (= (select (arr!15857 a!3235) (index!19473 lt!235349)) k0!2280) (ite ((_ is MissingZero!4321) lt!235349) (= (select (arr!15857 a!3235) (index!19472 lt!235349)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4321) lt!235349) (= (select (arr!15857 a!3235) (index!19475 lt!235349)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!300300 () SeekEntryResult!4321)

(assert (=> d!79215 (= lt!235349 e!300300)))

(declare-fun c!60308 () Bool)

(declare-fun lt!235348 () SeekEntryResult!4321)

(assert (=> d!79215 (= c!60308 (and ((_ is Intermediate!4321) lt!235348) (undefined!5133 lt!235348)))))

(assert (=> d!79215 (= lt!235348 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!79215 (validMask!0 mask!3524)))

(assert (=> d!79215 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!235349)))

(declare-fun b!514288 () Bool)

(declare-fun e!300299 () SeekEntryResult!4321)

(assert (=> b!514288 (= e!300299 (Found!4321 (index!19474 lt!235348)))))

(declare-fun b!514289 () Bool)

(assert (=> b!514289 (= e!300300 e!300299)))

(declare-fun lt!235350 () (_ BitVec 64))

(assert (=> b!514289 (= lt!235350 (select (arr!15857 a!3235) (index!19474 lt!235348)))))

(declare-fun c!60306 () Bool)

(assert (=> b!514289 (= c!60306 (= lt!235350 k0!2280))))

(declare-fun e!300301 () SeekEntryResult!4321)

(declare-fun b!514290 () Bool)

(assert (=> b!514290 (= e!300301 (seekKeyOrZeroReturnVacant!0 (x!48443 lt!235348) (index!19474 lt!235348) (index!19474 lt!235348) k0!2280 a!3235 mask!3524))))

(declare-fun b!514291 () Bool)

(assert (=> b!514291 (= e!300301 (MissingZero!4321 (index!19474 lt!235348)))))

(declare-fun b!514292 () Bool)

(assert (=> b!514292 (= e!300300 Undefined!4321)))

(declare-fun b!514293 () Bool)

(declare-fun c!60307 () Bool)

(assert (=> b!514293 (= c!60307 (= lt!235350 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!514293 (= e!300299 e!300301)))

(assert (= (and d!79215 c!60308) b!514292))

(assert (= (and d!79215 (not c!60308)) b!514289))

(assert (= (and b!514289 c!60306) b!514288))

(assert (= (and b!514289 (not c!60306)) b!514293))

(assert (= (and b!514293 c!60307) b!514291))

(assert (= (and b!514293 (not c!60307)) b!514290))

(declare-fun m!495203 () Bool)

(assert (=> d!79215 m!495203))

(declare-fun m!495205 () Bool)

(assert (=> d!79215 m!495205))

(assert (=> d!79215 m!494981))

(declare-fun m!495207 () Bool)

(assert (=> d!79215 m!495207))

(declare-fun m!495209 () Bool)

(assert (=> d!79215 m!495209))

(assert (=> d!79215 m!495207))

(declare-fun m!495211 () Bool)

(assert (=> d!79215 m!495211))

(declare-fun m!495213 () Bool)

(assert (=> b!514289 m!495213))

(declare-fun m!495215 () Bool)

(assert (=> b!514290 m!495215))

(assert (=> b!514032 d!79215))

(declare-fun b!514355 () Bool)

(declare-fun e!300344 () Bool)

(declare-fun e!300345 () Bool)

(assert (=> b!514355 (= e!300344 e!300345)))

(declare-fun c!60326 () Bool)

(assert (=> b!514355 (= c!60326 (validKeyInArray!0 (select (arr!15857 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!79217 () Bool)

(declare-fun res!314280 () Bool)

(declare-fun e!300343 () Bool)

(assert (=> d!79217 (=> res!314280 e!300343)))

(assert (=> d!79217 (= res!314280 (bvsge #b00000000000000000000000000000000 (size!16222 a!3235)))))

(assert (=> d!79217 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10051) e!300343)))

(declare-fun b!514356 () Bool)

(assert (=> b!514356 (= e!300343 e!300344)))

(declare-fun res!314278 () Bool)

(assert (=> b!514356 (=> (not res!314278) (not e!300344))))

(declare-fun e!300342 () Bool)

(assert (=> b!514356 (= res!314278 (not e!300342))))

(declare-fun res!314279 () Bool)

(assert (=> b!514356 (=> (not res!314279) (not e!300342))))

(assert (=> b!514356 (= res!314279 (validKeyInArray!0 (select (arr!15857 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!514357 () Bool)

(declare-fun contains!2722 (List!10054 (_ BitVec 64)) Bool)

(assert (=> b!514357 (= e!300342 (contains!2722 Nil!10051 (select (arr!15857 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!514358 () Bool)

(declare-fun call!31593 () Bool)

(assert (=> b!514358 (= e!300345 call!31593)))

(declare-fun b!514359 () Bool)

(assert (=> b!514359 (= e!300345 call!31593)))

(declare-fun bm!31590 () Bool)

(assert (=> bm!31590 (= call!31593 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60326 (Cons!10050 (select (arr!15857 a!3235) #b00000000000000000000000000000000) Nil!10051) Nil!10051)))))

(assert (= (and d!79217 (not res!314280)) b!514356))

(assert (= (and b!514356 res!314279) b!514357))

(assert (= (and b!514356 res!314278) b!514355))

(assert (= (and b!514355 c!60326) b!514358))

(assert (= (and b!514355 (not c!60326)) b!514359))

(assert (= (or b!514358 b!514359) bm!31590))

(assert (=> b!514355 m!495091))

(assert (=> b!514355 m!495091))

(assert (=> b!514355 m!495093))

(assert (=> b!514356 m!495091))

(assert (=> b!514356 m!495091))

(assert (=> b!514356 m!495093))

(assert (=> b!514357 m!495091))

(assert (=> b!514357 m!495091))

(declare-fun m!495241 () Bool)

(assert (=> b!514357 m!495241))

(assert (=> bm!31590 m!495091))

(declare-fun m!495243 () Bool)

(assert (=> bm!31590 m!495243))

(assert (=> b!514033 d!79217))

(check-sat (not b!514212) (not b!514355) (not d!79203) (not b!514250) (not b!514120) (not bm!31573) (not b!514249) (not b!514119) (not b!514290) (not b!514271) (not bm!31583) (not b!514287) (not d!79215) (not b!514357) (not d!79197) (not bm!31590) (not d!79163) (not d!79177) (not b!514356) (not b!514141))
(check-sat)
