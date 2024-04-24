; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85966 () Bool)

(assert start!85966)

(declare-fun res!665905 () Bool)

(declare-fun e!562122 () Bool)

(assert (=> start!85966 (=> (not res!665905) (not e!562122))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85966 (= res!665905 (validMask!0 mask!3464))))

(assert (=> start!85966 e!562122))

(declare-datatypes ((array!63009 0))(
  ( (array!63010 (arr!30337 (Array (_ BitVec 32) (_ BitVec 64))) (size!30840 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63009)

(declare-fun array_inv!23473 (array!63009) Bool)

(assert (=> start!85966 (array_inv!23473 a!3219)))

(assert (=> start!85966 true))

(declare-fun b!996033 () Bool)

(declare-fun res!665902 () Bool)

(declare-fun e!562120 () Bool)

(assert (=> b!996033 (=> (not res!665902) (not e!562120))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63009 (_ BitVec 32)) Bool)

(assert (=> b!996033 (= res!665902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996034 () Bool)

(assert (=> b!996034 (= e!562122 e!562120)))

(declare-fun res!665904 () Bool)

(assert (=> b!996034 (=> (not res!665904) (not e!562120))))

(declare-datatypes ((SeekEntryResult!9205 0))(
  ( (MissingZero!9205 (index!39191 (_ BitVec 32))) (Found!9205 (index!39192 (_ BitVec 32))) (Intermediate!9205 (undefined!10017 Bool) (index!39193 (_ BitVec 32)) (x!86788 (_ BitVec 32))) (Undefined!9205) (MissingVacant!9205 (index!39194 (_ BitVec 32))) )
))
(declare-fun lt!441218 () SeekEntryResult!9205)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996034 (= res!665904 (or (= lt!441218 (MissingVacant!9205 i!1194)) (= lt!441218 (MissingZero!9205 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63009 (_ BitVec 32)) SeekEntryResult!9205)

(assert (=> b!996034 (= lt!441218 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!996035 () Bool)

(declare-fun res!665907 () Bool)

(assert (=> b!996035 (=> (not res!665907) (not e!562120))))

(assert (=> b!996035 (= res!665907 (and (bvsle #b00000000000000000000000000000000 (size!30840 a!3219)) (bvslt (size!30840 a!3219) #b01111111111111111111111111111111)))))

(declare-fun b!996036 () Bool)

(declare-fun res!665908 () Bool)

(assert (=> b!996036 (=> (not res!665908) (not e!562122))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996036 (= res!665908 (validKeyInArray!0 (select (arr!30337 a!3219) j!170)))))

(declare-fun b!996037 () Bool)

(declare-fun res!665903 () Bool)

(assert (=> b!996037 (=> (not res!665903) (not e!562122))))

(declare-fun arrayContainsKey!0 (array!63009 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996037 (= res!665903 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996038 () Bool)

(declare-fun res!665909 () Bool)

(assert (=> b!996038 (=> (not res!665909) (not e!562122))))

(assert (=> b!996038 (= res!665909 (validKeyInArray!0 k0!2224))))

(declare-fun b!996039 () Bool)

(declare-datatypes ((List!20984 0))(
  ( (Nil!20981) (Cons!20980 (h!22148 (_ BitVec 64)) (t!29977 List!20984)) )
))
(declare-fun noDuplicate!1463 (List!20984) Bool)

(assert (=> b!996039 (= e!562120 (not (noDuplicate!1463 Nil!20981)))))

(declare-fun b!996040 () Bool)

(declare-fun res!665906 () Bool)

(assert (=> b!996040 (=> (not res!665906) (not e!562122))))

(assert (=> b!996040 (= res!665906 (and (= (size!30840 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30840 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30840 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!85966 res!665905) b!996040))

(assert (= (and b!996040 res!665906) b!996036))

(assert (= (and b!996036 res!665908) b!996038))

(assert (= (and b!996038 res!665909) b!996037))

(assert (= (and b!996037 res!665903) b!996034))

(assert (= (and b!996034 res!665904) b!996033))

(assert (= (and b!996033 res!665902) b!996035))

(assert (= (and b!996035 res!665907) b!996039))

(declare-fun m!923921 () Bool)

(assert (=> b!996038 m!923921))

(declare-fun m!923923 () Bool)

(assert (=> b!996034 m!923923))

(declare-fun m!923925 () Bool)

(assert (=> b!996039 m!923925))

(declare-fun m!923927 () Bool)

(assert (=> start!85966 m!923927))

(declare-fun m!923929 () Bool)

(assert (=> start!85966 m!923929))

(declare-fun m!923931 () Bool)

(assert (=> b!996036 m!923931))

(assert (=> b!996036 m!923931))

(declare-fun m!923933 () Bool)

(assert (=> b!996036 m!923933))

(declare-fun m!923935 () Bool)

(assert (=> b!996033 m!923935))

(declare-fun m!923937 () Bool)

(assert (=> b!996037 m!923937))

(check-sat (not b!996037) (not b!996033) (not b!996038) (not b!996036) (not b!996034) (not start!85966) (not b!996039))
(check-sat)
(get-model)

(declare-fun d!119137 () Bool)

(declare-fun res!665962 () Bool)

(declare-fun e!562145 () Bool)

(assert (=> d!119137 (=> res!665962 e!562145)))

(get-info :version)

(assert (=> d!119137 (= res!665962 ((_ is Nil!20981) Nil!20981))))

(assert (=> d!119137 (= (noDuplicate!1463 Nil!20981) e!562145)))

(declare-fun b!996093 () Bool)

(declare-fun e!562146 () Bool)

(assert (=> b!996093 (= e!562145 e!562146)))

(declare-fun res!665963 () Bool)

(assert (=> b!996093 (=> (not res!665963) (not e!562146))))

(declare-fun contains!5878 (List!20984 (_ BitVec 64)) Bool)

(assert (=> b!996093 (= res!665963 (not (contains!5878 (t!29977 Nil!20981) (h!22148 Nil!20981))))))

(declare-fun b!996094 () Bool)

(assert (=> b!996094 (= e!562146 (noDuplicate!1463 (t!29977 Nil!20981)))))

(assert (= (and d!119137 (not res!665962)) b!996093))

(assert (= (and b!996093 res!665963) b!996094))

(declare-fun m!923975 () Bool)

(assert (=> b!996093 m!923975))

(declare-fun m!923977 () Bool)

(assert (=> b!996094 m!923977))

(assert (=> b!996039 d!119137))

(declare-fun b!996143 () Bool)

(declare-fun e!562182 () SeekEntryResult!9205)

(declare-fun e!562180 () SeekEntryResult!9205)

(assert (=> b!996143 (= e!562182 e!562180)))

(declare-fun lt!441248 () (_ BitVec 64))

(declare-fun lt!441247 () SeekEntryResult!9205)

(assert (=> b!996143 (= lt!441248 (select (arr!30337 a!3219) (index!39193 lt!441247)))))

(declare-fun c!101226 () Bool)

(assert (=> b!996143 (= c!101226 (= lt!441248 k0!2224))))

(declare-fun b!996144 () Bool)

(assert (=> b!996144 (= e!562180 (Found!9205 (index!39193 lt!441247)))))

(declare-fun b!996145 () Bool)

(declare-fun c!101225 () Bool)

(assert (=> b!996145 (= c!101225 (= lt!441248 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!562181 () SeekEntryResult!9205)

(assert (=> b!996145 (= e!562180 e!562181)))

(declare-fun b!996146 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63009 (_ BitVec 32)) SeekEntryResult!9205)

(assert (=> b!996146 (= e!562181 (seekKeyOrZeroReturnVacant!0 (x!86788 lt!441247) (index!39193 lt!441247) (index!39193 lt!441247) k0!2224 a!3219 mask!3464))))

(declare-fun b!996147 () Bool)

(assert (=> b!996147 (= e!562182 Undefined!9205)))

(declare-fun d!119141 () Bool)

(declare-fun lt!441246 () SeekEntryResult!9205)

(assert (=> d!119141 (and (or ((_ is Undefined!9205) lt!441246) (not ((_ is Found!9205) lt!441246)) (and (bvsge (index!39192 lt!441246) #b00000000000000000000000000000000) (bvslt (index!39192 lt!441246) (size!30840 a!3219)))) (or ((_ is Undefined!9205) lt!441246) ((_ is Found!9205) lt!441246) (not ((_ is MissingZero!9205) lt!441246)) (and (bvsge (index!39191 lt!441246) #b00000000000000000000000000000000) (bvslt (index!39191 lt!441246) (size!30840 a!3219)))) (or ((_ is Undefined!9205) lt!441246) ((_ is Found!9205) lt!441246) ((_ is MissingZero!9205) lt!441246) (not ((_ is MissingVacant!9205) lt!441246)) (and (bvsge (index!39194 lt!441246) #b00000000000000000000000000000000) (bvslt (index!39194 lt!441246) (size!30840 a!3219)))) (or ((_ is Undefined!9205) lt!441246) (ite ((_ is Found!9205) lt!441246) (= (select (arr!30337 a!3219) (index!39192 lt!441246)) k0!2224) (ite ((_ is MissingZero!9205) lt!441246) (= (select (arr!30337 a!3219) (index!39191 lt!441246)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9205) lt!441246) (= (select (arr!30337 a!3219) (index!39194 lt!441246)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!119141 (= lt!441246 e!562182)))

(declare-fun c!101227 () Bool)

(assert (=> d!119141 (= c!101227 (and ((_ is Intermediate!9205) lt!441247) (undefined!10017 lt!441247)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63009 (_ BitVec 32)) SeekEntryResult!9205)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!119141 (= lt!441247 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!119141 (validMask!0 mask!3464)))

(assert (=> d!119141 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!441246)))

(declare-fun b!996148 () Bool)

(assert (=> b!996148 (= e!562181 (MissingZero!9205 (index!39193 lt!441247)))))

(assert (= (and d!119141 c!101227) b!996147))

(assert (= (and d!119141 (not c!101227)) b!996143))

(assert (= (and b!996143 c!101226) b!996144))

(assert (= (and b!996143 (not c!101226)) b!996145))

(assert (= (and b!996145 c!101225) b!996148))

(assert (= (and b!996145 (not c!101225)) b!996146))

(declare-fun m!923997 () Bool)

(assert (=> b!996143 m!923997))

(declare-fun m!923999 () Bool)

(assert (=> b!996146 m!923999))

(declare-fun m!924001 () Bool)

(assert (=> d!119141 m!924001))

(assert (=> d!119141 m!923927))

(declare-fun m!924003 () Bool)

(assert (=> d!119141 m!924003))

(declare-fun m!924005 () Bool)

(assert (=> d!119141 m!924005))

(declare-fun m!924007 () Bool)

(assert (=> d!119141 m!924007))

(assert (=> d!119141 m!924001))

(declare-fun m!924009 () Bool)

(assert (=> d!119141 m!924009))

(assert (=> b!996034 d!119141))

(declare-fun d!119153 () Bool)

(assert (=> d!119153 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!996038 d!119153))

(declare-fun d!119155 () Bool)

(declare-fun res!665991 () Bool)

(declare-fun e!562206 () Bool)

(assert (=> d!119155 (=> res!665991 e!562206)))

(assert (=> d!119155 (= res!665991 (bvsge #b00000000000000000000000000000000 (size!30840 a!3219)))))

(assert (=> d!119155 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!562206)))

(declare-fun bm!42237 () Bool)

(declare-fun call!42240 () Bool)

(assert (=> bm!42237 (= call!42240 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!996183 () Bool)

(declare-fun e!562205 () Bool)

(assert (=> b!996183 (= e!562205 call!42240)))

(declare-fun b!996184 () Bool)

(declare-fun e!562204 () Bool)

(assert (=> b!996184 (= e!562206 e!562204)))

(declare-fun c!101241 () Bool)

(assert (=> b!996184 (= c!101241 (validKeyInArray!0 (select (arr!30337 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!996185 () Bool)

(assert (=> b!996185 (= e!562204 call!42240)))

(declare-fun b!996186 () Bool)

(assert (=> b!996186 (= e!562204 e!562205)))

(declare-fun lt!441272 () (_ BitVec 64))

(assert (=> b!996186 (= lt!441272 (select (arr!30337 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32941 0))(
  ( (Unit!32942) )
))
(declare-fun lt!441271 () Unit!32941)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63009 (_ BitVec 64) (_ BitVec 32)) Unit!32941)

(assert (=> b!996186 (= lt!441271 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!441272 #b00000000000000000000000000000000))))

(assert (=> b!996186 (arrayContainsKey!0 a!3219 lt!441272 #b00000000000000000000000000000000)))

(declare-fun lt!441270 () Unit!32941)

(assert (=> b!996186 (= lt!441270 lt!441271)))

(declare-fun res!665990 () Bool)

(assert (=> b!996186 (= res!665990 (= (seekEntryOrOpen!0 (select (arr!30337 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9205 #b00000000000000000000000000000000)))))

(assert (=> b!996186 (=> (not res!665990) (not e!562205))))

(assert (= (and d!119155 (not res!665991)) b!996184))

(assert (= (and b!996184 c!101241) b!996186))

(assert (= (and b!996184 (not c!101241)) b!996185))

(assert (= (and b!996186 res!665990) b!996183))

(assert (= (or b!996183 b!996185) bm!42237))

(declare-fun m!924025 () Bool)

(assert (=> bm!42237 m!924025))

(declare-fun m!924027 () Bool)

(assert (=> b!996184 m!924027))

(assert (=> b!996184 m!924027))

(declare-fun m!924029 () Bool)

(assert (=> b!996184 m!924029))

(assert (=> b!996186 m!924027))

(declare-fun m!924031 () Bool)

(assert (=> b!996186 m!924031))

(declare-fun m!924033 () Bool)

(assert (=> b!996186 m!924033))

(assert (=> b!996186 m!924027))

(declare-fun m!924035 () Bool)

(assert (=> b!996186 m!924035))

(assert (=> b!996033 d!119155))

(declare-fun d!119159 () Bool)

(assert (=> d!119159 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!85966 d!119159))

(declare-fun d!119167 () Bool)

(assert (=> d!119167 (= (array_inv!23473 a!3219) (bvsge (size!30840 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!85966 d!119167))

(declare-fun d!119169 () Bool)

(declare-fun res!665998 () Bool)

(declare-fun e!562217 () Bool)

(assert (=> d!119169 (=> res!665998 e!562217)))

(assert (=> d!119169 (= res!665998 (= (select (arr!30337 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!119169 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!562217)))

(declare-fun b!996201 () Bool)

(declare-fun e!562218 () Bool)

(assert (=> b!996201 (= e!562217 e!562218)))

(declare-fun res!665999 () Bool)

(assert (=> b!996201 (=> (not res!665999) (not e!562218))))

(assert (=> b!996201 (= res!665999 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30840 a!3219)))))

(declare-fun b!996202 () Bool)

(assert (=> b!996202 (= e!562218 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119169 (not res!665998)) b!996201))

(assert (= (and b!996201 res!665999) b!996202))

(assert (=> d!119169 m!924027))

(declare-fun m!924063 () Bool)

(assert (=> b!996202 m!924063))

(assert (=> b!996037 d!119169))

(declare-fun d!119181 () Bool)

(assert (=> d!119181 (= (validKeyInArray!0 (select (arr!30337 a!3219) j!170)) (and (not (= (select (arr!30337 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30337 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!996036 d!119181))

(check-sat (not b!996094) (not b!996184) (not bm!42237) (not b!996202) (not b!996146) (not d!119141) (not b!996093) (not b!996186))
(check-sat)
