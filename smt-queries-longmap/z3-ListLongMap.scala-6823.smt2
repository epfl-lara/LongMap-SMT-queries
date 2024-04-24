; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86014 () Bool)

(assert start!86014)

(declare-fun b!996235 () Bool)

(declare-fun res!666041 () Bool)

(declare-fun e!562242 () Bool)

(assert (=> b!996235 (=> (not res!666041) (not e!562242))))

(declare-datatypes ((array!63018 0))(
  ( (array!63019 (arr!30340 (Array (_ BitVec 32) (_ BitVec 64))) (size!30843 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63018)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63018 (_ BitVec 32)) Bool)

(assert (=> b!996235 (= res!666041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996236 () Bool)

(declare-fun e!562241 () Bool)

(assert (=> b!996236 (= e!562241 e!562242)))

(declare-fun res!666036 () Bool)

(assert (=> b!996236 (=> (not res!666036) (not e!562242))))

(declare-datatypes ((SeekEntryResult!9208 0))(
  ( (MissingZero!9208 (index!39203 (_ BitVec 32))) (Found!9208 (index!39204 (_ BitVec 32))) (Intermediate!9208 (undefined!10020 Bool) (index!39205 (_ BitVec 32)) (x!86799 (_ BitVec 32))) (Undefined!9208) (MissingVacant!9208 (index!39206 (_ BitVec 32))) )
))
(declare-fun lt!441281 () SeekEntryResult!9208)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996236 (= res!666036 (or (= lt!441281 (MissingVacant!9208 i!1194)) (= lt!441281 (MissingZero!9208 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63018 (_ BitVec 32)) SeekEntryResult!9208)

(assert (=> b!996236 (= lt!441281 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!996237 () Bool)

(declare-fun res!666039 () Bool)

(assert (=> b!996237 (=> (not res!666039) (not e!562241))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996237 (= res!666039 (validKeyInArray!0 k0!2224))))

(declare-fun b!996238 () Bool)

(declare-fun e!562240 () Bool)

(declare-datatypes ((List!20987 0))(
  ( (Nil!20984) (Cons!20983 (h!22151 (_ BitVec 64)) (t!29980 List!20987)) )
))
(declare-fun contains!5880 (List!20987 (_ BitVec 64)) Bool)

(assert (=> b!996238 (= e!562240 (contains!5880 Nil!20984 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!666035 () Bool)

(assert (=> start!86014 (=> (not res!666035) (not e!562241))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86014 (= res!666035 (validMask!0 mask!3464))))

(assert (=> start!86014 e!562241))

(declare-fun array_inv!23476 (array!63018) Bool)

(assert (=> start!86014 (array_inv!23476 a!3219)))

(assert (=> start!86014 true))

(declare-fun b!996239 () Bool)

(assert (=> b!996239 (= e!562242 e!562240)))

(declare-fun res!666033 () Bool)

(assert (=> b!996239 (=> res!666033 e!562240)))

(assert (=> b!996239 (= res!666033 (contains!5880 Nil!20984 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!996240 () Bool)

(declare-fun res!666037 () Bool)

(assert (=> b!996240 (=> (not res!666037) (not e!562241))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!996240 (= res!666037 (validKeyInArray!0 (select (arr!30340 a!3219) j!170)))))

(declare-fun b!996241 () Bool)

(declare-fun res!666032 () Bool)

(assert (=> b!996241 (=> (not res!666032) (not e!562241))))

(declare-fun arrayContainsKey!0 (array!63018 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996241 (= res!666032 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996242 () Bool)

(declare-fun res!666034 () Bool)

(assert (=> b!996242 (=> (not res!666034) (not e!562241))))

(assert (=> b!996242 (= res!666034 (and (= (size!30843 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30843 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30843 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!996243 () Bool)

(declare-fun res!666040 () Bool)

(assert (=> b!996243 (=> (not res!666040) (not e!562242))))

(assert (=> b!996243 (= res!666040 (and (bvsle #b00000000000000000000000000000000 (size!30843 a!3219)) (bvslt (size!30843 a!3219) #b01111111111111111111111111111111)))))

(declare-fun b!996244 () Bool)

(declare-fun res!666038 () Bool)

(assert (=> b!996244 (=> (not res!666038) (not e!562242))))

(declare-fun noDuplicate!1466 (List!20987) Bool)

(assert (=> b!996244 (= res!666038 (noDuplicate!1466 Nil!20984))))

(assert (= (and start!86014 res!666035) b!996242))

(assert (= (and b!996242 res!666034) b!996240))

(assert (= (and b!996240 res!666037) b!996237))

(assert (= (and b!996237 res!666039) b!996241))

(assert (= (and b!996241 res!666032) b!996236))

(assert (= (and b!996236 res!666036) b!996235))

(assert (= (and b!996235 res!666041) b!996243))

(assert (= (and b!996243 res!666040) b!996244))

(assert (= (and b!996244 res!666038) b!996239))

(assert (= (and b!996239 (not res!666033)) b!996238))

(declare-fun m!924071 () Bool)

(assert (=> b!996238 m!924071))

(declare-fun m!924073 () Bool)

(assert (=> b!996240 m!924073))

(assert (=> b!996240 m!924073))

(declare-fun m!924075 () Bool)

(assert (=> b!996240 m!924075))

(declare-fun m!924077 () Bool)

(assert (=> start!86014 m!924077))

(declare-fun m!924079 () Bool)

(assert (=> start!86014 m!924079))

(declare-fun m!924081 () Bool)

(assert (=> b!996235 m!924081))

(declare-fun m!924083 () Bool)

(assert (=> b!996236 m!924083))

(declare-fun m!924085 () Bool)

(assert (=> b!996241 m!924085))

(declare-fun m!924087 () Bool)

(assert (=> b!996244 m!924087))

(declare-fun m!924089 () Bool)

(assert (=> b!996237 m!924089))

(declare-fun m!924091 () Bool)

(assert (=> b!996239 m!924091))

(check-sat (not b!996239) (not b!996235) (not b!996236) (not b!996241) (not b!996237) (not start!86014) (not b!996244) (not b!996238) (not b!996240))
(check-sat)
(get-model)

(declare-fun d!119187 () Bool)

(assert (=> d!119187 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!996237 d!119187))

(declare-fun b!996317 () Bool)

(declare-fun e!562273 () SeekEntryResult!9208)

(declare-fun lt!441295 () SeekEntryResult!9208)

(assert (=> b!996317 (= e!562273 (Found!9208 (index!39205 lt!441295)))))

(declare-fun b!996318 () Bool)

(declare-fun e!562275 () SeekEntryResult!9208)

(assert (=> b!996318 (= e!562275 Undefined!9208)))

(declare-fun b!996319 () Bool)

(declare-fun e!562274 () SeekEntryResult!9208)

(assert (=> b!996319 (= e!562274 (MissingZero!9208 (index!39205 lt!441295)))))

(declare-fun d!119189 () Bool)

(declare-fun lt!441296 () SeekEntryResult!9208)

(get-info :version)

(assert (=> d!119189 (and (or ((_ is Undefined!9208) lt!441296) (not ((_ is Found!9208) lt!441296)) (and (bvsge (index!39204 lt!441296) #b00000000000000000000000000000000) (bvslt (index!39204 lt!441296) (size!30843 a!3219)))) (or ((_ is Undefined!9208) lt!441296) ((_ is Found!9208) lt!441296) (not ((_ is MissingZero!9208) lt!441296)) (and (bvsge (index!39203 lt!441296) #b00000000000000000000000000000000) (bvslt (index!39203 lt!441296) (size!30843 a!3219)))) (or ((_ is Undefined!9208) lt!441296) ((_ is Found!9208) lt!441296) ((_ is MissingZero!9208) lt!441296) (not ((_ is MissingVacant!9208) lt!441296)) (and (bvsge (index!39206 lt!441296) #b00000000000000000000000000000000) (bvslt (index!39206 lt!441296) (size!30843 a!3219)))) (or ((_ is Undefined!9208) lt!441296) (ite ((_ is Found!9208) lt!441296) (= (select (arr!30340 a!3219) (index!39204 lt!441296)) k0!2224) (ite ((_ is MissingZero!9208) lt!441296) (= (select (arr!30340 a!3219) (index!39203 lt!441296)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9208) lt!441296) (= (select (arr!30340 a!3219) (index!39206 lt!441296)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!119189 (= lt!441296 e!562275)))

(declare-fun c!101253 () Bool)

(assert (=> d!119189 (= c!101253 (and ((_ is Intermediate!9208) lt!441295) (undefined!10020 lt!441295)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63018 (_ BitVec 32)) SeekEntryResult!9208)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!119189 (= lt!441295 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!119189 (validMask!0 mask!3464)))

(assert (=> d!119189 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!441296)))

(declare-fun b!996320 () Bool)

(declare-fun c!101252 () Bool)

(declare-fun lt!441294 () (_ BitVec 64))

(assert (=> b!996320 (= c!101252 (= lt!441294 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!996320 (= e!562273 e!562274)))

(declare-fun b!996321 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63018 (_ BitVec 32)) SeekEntryResult!9208)

(assert (=> b!996321 (= e!562274 (seekKeyOrZeroReturnVacant!0 (x!86799 lt!441295) (index!39205 lt!441295) (index!39205 lt!441295) k0!2224 a!3219 mask!3464))))

(declare-fun b!996322 () Bool)

(assert (=> b!996322 (= e!562275 e!562273)))

(assert (=> b!996322 (= lt!441294 (select (arr!30340 a!3219) (index!39205 lt!441295)))))

(declare-fun c!101254 () Bool)

(assert (=> b!996322 (= c!101254 (= lt!441294 k0!2224))))

(assert (= (and d!119189 c!101253) b!996318))

(assert (= (and d!119189 (not c!101253)) b!996322))

(assert (= (and b!996322 c!101254) b!996317))

(assert (= (and b!996322 (not c!101254)) b!996320))

(assert (= (and b!996320 c!101252) b!996319))

(assert (= (and b!996320 (not c!101252)) b!996321))

(declare-fun m!924137 () Bool)

(assert (=> d!119189 m!924137))

(assert (=> d!119189 m!924077))

(declare-fun m!924139 () Bool)

(assert (=> d!119189 m!924139))

(declare-fun m!924141 () Bool)

(assert (=> d!119189 m!924141))

(declare-fun m!924143 () Bool)

(assert (=> d!119189 m!924143))

(assert (=> d!119189 m!924143))

(declare-fun m!924145 () Bool)

(assert (=> d!119189 m!924145))

(declare-fun m!924147 () Bool)

(assert (=> b!996321 m!924147))

(declare-fun m!924149 () Bool)

(assert (=> b!996322 m!924149))

(assert (=> b!996236 d!119189))

(declare-fun d!119195 () Bool)

(assert (=> d!119195 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86014 d!119195))

(declare-fun d!119203 () Bool)

(assert (=> d!119203 (= (array_inv!23476 a!3219) (bvsge (size!30843 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86014 d!119203))

(declare-fun d!119205 () Bool)

(declare-fun lt!441324 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!481 (List!20987) (InoxSet (_ BitVec 64)))

(assert (=> d!119205 (= lt!441324 (select (content!481 Nil!20984) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!562313 () Bool)

(assert (=> d!119205 (= lt!441324 e!562313)))

(declare-fun res!666120 () Bool)

(assert (=> d!119205 (=> (not res!666120) (not e!562313))))

(assert (=> d!119205 (= res!666120 ((_ is Cons!20983) Nil!20984))))

(assert (=> d!119205 (= (contains!5880 Nil!20984 #b1000000000000000000000000000000000000000000000000000000000000000) lt!441324)))

(declare-fun b!996377 () Bool)

(declare-fun e!562312 () Bool)

(assert (=> b!996377 (= e!562313 e!562312)))

(declare-fun res!666121 () Bool)

(assert (=> b!996377 (=> res!666121 e!562312)))

(assert (=> b!996377 (= res!666121 (= (h!22151 Nil!20984) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!996378 () Bool)

(assert (=> b!996378 (= e!562312 (contains!5880 (t!29980 Nil!20984) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!119205 res!666120) b!996377))

(assert (= (and b!996377 (not res!666121)) b!996378))

(declare-fun m!924195 () Bool)

(assert (=> d!119205 m!924195))

(declare-fun m!924197 () Bool)

(assert (=> d!119205 m!924197))

(declare-fun m!924199 () Bool)

(assert (=> b!996378 m!924199))

(assert (=> b!996238 d!119205))

(declare-fun d!119217 () Bool)

(declare-fun lt!441325 () Bool)

(assert (=> d!119217 (= lt!441325 (select (content!481 Nil!20984) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!562315 () Bool)

(assert (=> d!119217 (= lt!441325 e!562315)))

(declare-fun res!666122 () Bool)

(assert (=> d!119217 (=> (not res!666122) (not e!562315))))

(assert (=> d!119217 (= res!666122 ((_ is Cons!20983) Nil!20984))))

(assert (=> d!119217 (= (contains!5880 Nil!20984 #b0000000000000000000000000000000000000000000000000000000000000000) lt!441325)))

(declare-fun b!996379 () Bool)

(declare-fun e!562314 () Bool)

(assert (=> b!996379 (= e!562315 e!562314)))

(declare-fun res!666123 () Bool)

(assert (=> b!996379 (=> res!666123 e!562314)))

(assert (=> b!996379 (= res!666123 (= (h!22151 Nil!20984) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!996380 () Bool)

(assert (=> b!996380 (= e!562314 (contains!5880 (t!29980 Nil!20984) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!119217 res!666122) b!996379))

(assert (= (and b!996379 (not res!666123)) b!996380))

(assert (=> d!119217 m!924195))

(declare-fun m!924201 () Bool)

(assert (=> d!119217 m!924201))

(declare-fun m!924203 () Bool)

(assert (=> b!996380 m!924203))

(assert (=> b!996239 d!119217))

(declare-fun d!119219 () Bool)

(declare-fun res!666128 () Bool)

(declare-fun e!562320 () Bool)

(assert (=> d!119219 (=> res!666128 e!562320)))

(assert (=> d!119219 (= res!666128 ((_ is Nil!20984) Nil!20984))))

(assert (=> d!119219 (= (noDuplicate!1466 Nil!20984) e!562320)))

(declare-fun b!996385 () Bool)

(declare-fun e!562321 () Bool)

(assert (=> b!996385 (= e!562320 e!562321)))

(declare-fun res!666129 () Bool)

(assert (=> b!996385 (=> (not res!666129) (not e!562321))))

(assert (=> b!996385 (= res!666129 (not (contains!5880 (t!29980 Nil!20984) (h!22151 Nil!20984))))))

(declare-fun b!996386 () Bool)

(assert (=> b!996386 (= e!562321 (noDuplicate!1466 (t!29980 Nil!20984)))))

(assert (= (and d!119219 (not res!666128)) b!996385))

(assert (= (and b!996385 res!666129) b!996386))

(declare-fun m!924205 () Bool)

(assert (=> b!996385 m!924205))

(declare-fun m!924207 () Bool)

(assert (=> b!996386 m!924207))

(assert (=> b!996244 d!119219))

(declare-fun d!119221 () Bool)

(declare-fun res!666142 () Bool)

(declare-fun e!562338 () Bool)

(assert (=> d!119221 (=> res!666142 e!562338)))

(assert (=> d!119221 (= res!666142 (= (select (arr!30340 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!119221 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!562338)))

(declare-fun b!996407 () Bool)

(declare-fun e!562339 () Bool)

(assert (=> b!996407 (= e!562338 e!562339)))

(declare-fun res!666143 () Bool)

(assert (=> b!996407 (=> (not res!666143) (not e!562339))))

(assert (=> b!996407 (= res!666143 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30843 a!3219)))))

(declare-fun b!996408 () Bool)

(assert (=> b!996408 (= e!562339 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119221 (not res!666142)) b!996407))

(assert (= (and b!996407 res!666143) b!996408))

(declare-fun m!924209 () Bool)

(assert (=> d!119221 m!924209))

(declare-fun m!924211 () Bool)

(assert (=> b!996408 m!924211))

(assert (=> b!996241 d!119221))

(declare-fun b!996433 () Bool)

(declare-fun e!562360 () Bool)

(declare-fun e!562361 () Bool)

(assert (=> b!996433 (= e!562360 e!562361)))

(declare-fun lt!441351 () (_ BitVec 64))

(assert (=> b!996433 (= lt!441351 (select (arr!30340 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32945 0))(
  ( (Unit!32946) )
))
(declare-fun lt!441352 () Unit!32945)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63018 (_ BitVec 64) (_ BitVec 32)) Unit!32945)

(assert (=> b!996433 (= lt!441352 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!441351 #b00000000000000000000000000000000))))

(assert (=> b!996433 (arrayContainsKey!0 a!3219 lt!441351 #b00000000000000000000000000000000)))

(declare-fun lt!441353 () Unit!32945)

(assert (=> b!996433 (= lt!441353 lt!441352)))

(declare-fun res!666160 () Bool)

(assert (=> b!996433 (= res!666160 (= (seekEntryOrOpen!0 (select (arr!30340 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9208 #b00000000000000000000000000000000)))))

(assert (=> b!996433 (=> (not res!666160) (not e!562361))))

(declare-fun b!996434 () Bool)

(declare-fun call!42250 () Bool)

(assert (=> b!996434 (= e!562361 call!42250)))

(declare-fun d!119223 () Bool)

(declare-fun res!666161 () Bool)

(declare-fun e!562362 () Bool)

(assert (=> d!119223 (=> res!666161 e!562362)))

(assert (=> d!119223 (= res!666161 (bvsge #b00000000000000000000000000000000 (size!30843 a!3219)))))

(assert (=> d!119223 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!562362)))

(declare-fun b!996435 () Bool)

(assert (=> b!996435 (= e!562362 e!562360)))

(declare-fun c!101281 () Bool)

(assert (=> b!996435 (= c!101281 (validKeyInArray!0 (select (arr!30340 a!3219) #b00000000000000000000000000000000)))))

(declare-fun bm!42247 () Bool)

(assert (=> bm!42247 (= call!42250 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!996436 () Bool)

(assert (=> b!996436 (= e!562360 call!42250)))

(assert (= (and d!119223 (not res!666161)) b!996435))

(assert (= (and b!996435 c!101281) b!996433))

(assert (= (and b!996435 (not c!101281)) b!996436))

(assert (= (and b!996433 res!666160) b!996434))

(assert (= (or b!996434 b!996436) bm!42247))

(assert (=> b!996433 m!924209))

(declare-fun m!924245 () Bool)

(assert (=> b!996433 m!924245))

(declare-fun m!924247 () Bool)

(assert (=> b!996433 m!924247))

(assert (=> b!996433 m!924209))

(declare-fun m!924249 () Bool)

(assert (=> b!996433 m!924249))

(assert (=> b!996435 m!924209))

(assert (=> b!996435 m!924209))

(declare-fun m!924251 () Bool)

(assert (=> b!996435 m!924251))

(declare-fun m!924253 () Bool)

(assert (=> bm!42247 m!924253))

(assert (=> b!996235 d!119223))

(declare-fun d!119233 () Bool)

(assert (=> d!119233 (= (validKeyInArray!0 (select (arr!30340 a!3219) j!170)) (and (not (= (select (arr!30340 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30340 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!996240 d!119233))

(check-sat (not b!996378) (not b!996433) (not d!119217) (not d!119205) (not b!996408) (not b!996321) (not d!119189) (not b!996435) (not b!996380) (not b!996385) (not b!996386) (not bm!42247))
(check-sat)
