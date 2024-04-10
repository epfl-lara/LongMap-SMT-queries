; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86074 () Bool)

(assert start!86074)

(declare-fun b!997127 () Bool)

(declare-fun res!667245 () Bool)

(declare-fun e!562428 () Bool)

(assert (=> b!997127 (=> (not res!667245) (not e!562428))))

(declare-datatypes ((array!63079 0))(
  ( (array!63080 (arr!30371 (Array (_ BitVec 32) (_ BitVec 64))) (size!30873 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63079)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!997127 (= res!667245 (and (= (size!30873 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30873 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30873 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!997128 () Bool)

(declare-fun res!667246 () Bool)

(declare-fun e!562426 () Bool)

(assert (=> b!997128 (=> (not res!667246) (not e!562426))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9303 0))(
  ( (MissingZero!9303 (index!39583 (_ BitVec 32))) (Found!9303 (index!39584 (_ BitVec 32))) (Intermediate!9303 (undefined!10115 Bool) (index!39585 (_ BitVec 32)) (x!87011 (_ BitVec 32))) (Undefined!9303) (MissingVacant!9303 (index!39586 (_ BitVec 32))) )
))
(declare-fun lt!441350 () SeekEntryResult!9303)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63079 (_ BitVec 32)) SeekEntryResult!9303)

(assert (=> b!997128 (= res!667246 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30371 a!3219) j!170) a!3219 mask!3464) lt!441350))))

(declare-fun b!997129 () Bool)

(declare-fun e!562427 () Bool)

(assert (=> b!997129 (= e!562428 e!562427)))

(declare-fun res!667251 () Bool)

(assert (=> b!997129 (=> (not res!667251) (not e!562427))))

(declare-fun lt!441349 () SeekEntryResult!9303)

(assert (=> b!997129 (= res!667251 (or (= lt!441349 (MissingVacant!9303 i!1194)) (= lt!441349 (MissingZero!9303 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63079 (_ BitVec 32)) SeekEntryResult!9303)

(assert (=> b!997129 (= lt!441349 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!997130 () Bool)

(assert (=> b!997130 (= e!562427 e!562426)))

(declare-fun res!667249 () Bool)

(assert (=> b!997130 (=> (not res!667249) (not e!562426))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997130 (= res!667249 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30371 a!3219) j!170) mask!3464) (select (arr!30371 a!3219) j!170) a!3219 mask!3464) lt!441350))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!997130 (= lt!441350 (Intermediate!9303 false resIndex!38 resX!38))))

(declare-fun res!667247 () Bool)

(assert (=> start!86074 (=> (not res!667247) (not e!562428))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86074 (= res!667247 (validMask!0 mask!3464))))

(assert (=> start!86074 e!562428))

(declare-fun array_inv!23495 (array!63079) Bool)

(assert (=> start!86074 (array_inv!23495 a!3219)))

(assert (=> start!86074 true))

(declare-fun b!997131 () Bool)

(declare-fun res!667250 () Bool)

(assert (=> b!997131 (=> (not res!667250) (not e!562427))))

(assert (=> b!997131 (= res!667250 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30873 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30873 a!3219))))))

(declare-fun b!997132 () Bool)

(declare-fun res!667244 () Bool)

(assert (=> b!997132 (=> (not res!667244) (not e!562428))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!997132 (= res!667244 (validKeyInArray!0 k0!2224))))

(declare-fun b!997133 () Bool)

(assert (=> b!997133 (= e!562426 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvsgt mask!3464 #b00111111111111111111111111111111)))))

(declare-fun b!997134 () Bool)

(declare-fun res!667241 () Bool)

(assert (=> b!997134 (=> (not res!667241) (not e!562427))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63079 (_ BitVec 32)) Bool)

(assert (=> b!997134 (= res!667241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!997135 () Bool)

(declare-fun res!667242 () Bool)

(assert (=> b!997135 (=> (not res!667242) (not e!562427))))

(declare-datatypes ((List!21047 0))(
  ( (Nil!21044) (Cons!21043 (h!22208 (_ BitVec 64)) (t!30048 List!21047)) )
))
(declare-fun arrayNoDuplicates!0 (array!63079 (_ BitVec 32) List!21047) Bool)

(assert (=> b!997135 (= res!667242 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21044))))

(declare-fun b!997136 () Bool)

(declare-fun res!667248 () Bool)

(assert (=> b!997136 (=> (not res!667248) (not e!562428))))

(assert (=> b!997136 (= res!667248 (validKeyInArray!0 (select (arr!30371 a!3219) j!170)))))

(declare-fun b!997137 () Bool)

(declare-fun res!667243 () Bool)

(assert (=> b!997137 (=> (not res!667243) (not e!562428))))

(declare-fun arrayContainsKey!0 (array!63079 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!997137 (= res!667243 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!86074 res!667247) b!997127))

(assert (= (and b!997127 res!667245) b!997136))

(assert (= (and b!997136 res!667248) b!997132))

(assert (= (and b!997132 res!667244) b!997137))

(assert (= (and b!997137 res!667243) b!997129))

(assert (= (and b!997129 res!667251) b!997134))

(assert (= (and b!997134 res!667241) b!997135))

(assert (= (and b!997135 res!667242) b!997131))

(assert (= (and b!997131 res!667250) b!997130))

(assert (= (and b!997130 res!667249) b!997128))

(assert (= (and b!997128 res!667246) b!997133))

(declare-fun m!924077 () Bool)

(assert (=> b!997130 m!924077))

(assert (=> b!997130 m!924077))

(declare-fun m!924079 () Bool)

(assert (=> b!997130 m!924079))

(assert (=> b!997130 m!924079))

(assert (=> b!997130 m!924077))

(declare-fun m!924081 () Bool)

(assert (=> b!997130 m!924081))

(declare-fun m!924083 () Bool)

(assert (=> b!997134 m!924083))

(declare-fun m!924085 () Bool)

(assert (=> b!997137 m!924085))

(assert (=> b!997136 m!924077))

(assert (=> b!997136 m!924077))

(declare-fun m!924087 () Bool)

(assert (=> b!997136 m!924087))

(declare-fun m!924089 () Bool)

(assert (=> b!997129 m!924089))

(assert (=> b!997128 m!924077))

(assert (=> b!997128 m!924077))

(declare-fun m!924091 () Bool)

(assert (=> b!997128 m!924091))

(declare-fun m!924093 () Bool)

(assert (=> start!86074 m!924093))

(declare-fun m!924095 () Bool)

(assert (=> start!86074 m!924095))

(declare-fun m!924097 () Bool)

(assert (=> b!997135 m!924097))

(declare-fun m!924099 () Bool)

(assert (=> b!997132 m!924099))

(check-sat (not b!997128) (not b!997134) (not b!997132) (not start!86074) (not b!997135) (not b!997136) (not b!997130) (not b!997129) (not b!997137))
(check-sat)
(get-model)

(declare-fun d!119035 () Bool)

(declare-fun res!667298 () Bool)

(declare-fun e!562458 () Bool)

(assert (=> d!119035 (=> res!667298 e!562458)))

(assert (=> d!119035 (= res!667298 (= (select (arr!30371 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!119035 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!562458)))

(declare-fun b!997190 () Bool)

(declare-fun e!562459 () Bool)

(assert (=> b!997190 (= e!562458 e!562459)))

(declare-fun res!667299 () Bool)

(assert (=> b!997190 (=> (not res!667299) (not e!562459))))

(assert (=> b!997190 (= res!667299 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30873 a!3219)))))

(declare-fun b!997191 () Bool)

(assert (=> b!997191 (= e!562459 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119035 (not res!667298)) b!997190))

(assert (= (and b!997190 res!667299) b!997191))

(declare-fun m!924133 () Bool)

(assert (=> d!119035 m!924133))

(declare-fun m!924135 () Bool)

(assert (=> b!997191 m!924135))

(assert (=> b!997137 d!119035))

(declare-fun d!119039 () Bool)

(assert (=> d!119039 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!997132 d!119039))

(declare-fun d!119041 () Bool)

(assert (=> d!119041 (= (validKeyInArray!0 (select (arr!30371 a!3219) j!170)) (and (not (= (select (arr!30371 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30371 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!997136 d!119041))

(declare-fun bm!42245 () Bool)

(declare-fun call!42248 () Bool)

(declare-fun c!101093 () Bool)

(assert (=> bm!42245 (= call!42248 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101093 (Cons!21043 (select (arr!30371 a!3219) #b00000000000000000000000000000000) Nil!21044) Nil!21044)))))

(declare-fun b!997214 () Bool)

(declare-fun e!562480 () Bool)

(declare-fun e!562478 () Bool)

(assert (=> b!997214 (= e!562480 e!562478)))

(declare-fun res!667312 () Bool)

(assert (=> b!997214 (=> (not res!667312) (not e!562478))))

(declare-fun e!562479 () Bool)

(assert (=> b!997214 (= res!667312 (not e!562479))))

(declare-fun res!667314 () Bool)

(assert (=> b!997214 (=> (not res!667314) (not e!562479))))

(assert (=> b!997214 (= res!667314 (validKeyInArray!0 (select (arr!30371 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!997215 () Bool)

(declare-fun e!562477 () Bool)

(assert (=> b!997215 (= e!562477 call!42248)))

(declare-fun b!997216 () Bool)

(assert (=> b!997216 (= e!562477 call!42248)))

(declare-fun b!997218 () Bool)

(assert (=> b!997218 (= e!562478 e!562477)))

(assert (=> b!997218 (= c!101093 (validKeyInArray!0 (select (arr!30371 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!997217 () Bool)

(declare-fun contains!5869 (List!21047 (_ BitVec 64)) Bool)

(assert (=> b!997217 (= e!562479 (contains!5869 Nil!21044 (select (arr!30371 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!119043 () Bool)

(declare-fun res!667313 () Bool)

(assert (=> d!119043 (=> res!667313 e!562480)))

(assert (=> d!119043 (= res!667313 (bvsge #b00000000000000000000000000000000 (size!30873 a!3219)))))

(assert (=> d!119043 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21044) e!562480)))

(assert (= (and d!119043 (not res!667313)) b!997214))

(assert (= (and b!997214 res!667314) b!997217))

(assert (= (and b!997214 res!667312) b!997218))

(assert (= (and b!997218 c!101093) b!997215))

(assert (= (and b!997218 (not c!101093)) b!997216))

(assert (= (or b!997215 b!997216) bm!42245))

(assert (=> bm!42245 m!924133))

(declare-fun m!924145 () Bool)

(assert (=> bm!42245 m!924145))

(assert (=> b!997214 m!924133))

(assert (=> b!997214 m!924133))

(declare-fun m!924147 () Bool)

(assert (=> b!997214 m!924147))

(assert (=> b!997218 m!924133))

(assert (=> b!997218 m!924133))

(assert (=> b!997218 m!924147))

(assert (=> b!997217 m!924133))

(assert (=> b!997217 m!924133))

(declare-fun m!924149 () Bool)

(assert (=> b!997217 m!924149))

(assert (=> b!997135 d!119043))

(declare-fun b!997285 () Bool)

(declare-fun e!562522 () SeekEntryResult!9303)

(declare-fun e!562523 () SeekEntryResult!9303)

(assert (=> b!997285 (= e!562522 e!562523)))

(declare-fun lt!441392 () (_ BitVec 64))

(declare-fun c!101118 () Bool)

(assert (=> b!997285 (= c!101118 (or (= lt!441392 (select (arr!30371 a!3219) j!170)) (= (bvadd lt!441392 lt!441392) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!997286 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997286 (= e!562523 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30371 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30371 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!997287 () Bool)

(assert (=> b!997287 (= e!562522 (Intermediate!9303 true (toIndex!0 (select (arr!30371 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!997288 () Bool)

(declare-fun lt!441393 () SeekEntryResult!9303)

(assert (=> b!997288 (and (bvsge (index!39585 lt!441393) #b00000000000000000000000000000000) (bvslt (index!39585 lt!441393) (size!30873 a!3219)))))

(declare-fun e!562519 () Bool)

(assert (=> b!997288 (= e!562519 (= (select (arr!30371 a!3219) (index!39585 lt!441393)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!997289 () Bool)

(declare-fun e!562521 () Bool)

(declare-fun e!562520 () Bool)

(assert (=> b!997289 (= e!562521 e!562520)))

(declare-fun res!667334 () Bool)

(get-info :version)

(assert (=> b!997289 (= res!667334 (and ((_ is Intermediate!9303) lt!441393) (not (undefined!10115 lt!441393)) (bvslt (x!87011 lt!441393) #b01111111111111111111111111111110) (bvsge (x!87011 lt!441393) #b00000000000000000000000000000000) (bvsge (x!87011 lt!441393) #b00000000000000000000000000000000)))))

(assert (=> b!997289 (=> (not res!667334) (not e!562520))))

(declare-fun b!997290 () Bool)

(assert (=> b!997290 (and (bvsge (index!39585 lt!441393) #b00000000000000000000000000000000) (bvslt (index!39585 lt!441393) (size!30873 a!3219)))))

(declare-fun res!667335 () Bool)

(assert (=> b!997290 (= res!667335 (= (select (arr!30371 a!3219) (index!39585 lt!441393)) (select (arr!30371 a!3219) j!170)))))

(assert (=> b!997290 (=> res!667335 e!562519)))

(assert (=> b!997290 (= e!562520 e!562519)))

(declare-fun d!119053 () Bool)

(assert (=> d!119053 e!562521))

(declare-fun c!101120 () Bool)

(assert (=> d!119053 (= c!101120 (and ((_ is Intermediate!9303) lt!441393) (undefined!10115 lt!441393)))))

(assert (=> d!119053 (= lt!441393 e!562522)))

(declare-fun c!101119 () Bool)

(assert (=> d!119053 (= c!101119 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!119053 (= lt!441392 (select (arr!30371 a!3219) (toIndex!0 (select (arr!30371 a!3219) j!170) mask!3464)))))

(assert (=> d!119053 (validMask!0 mask!3464)))

(assert (=> d!119053 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30371 a!3219) j!170) mask!3464) (select (arr!30371 a!3219) j!170) a!3219 mask!3464) lt!441393)))

(declare-fun b!997291 () Bool)

(assert (=> b!997291 (= e!562521 (bvsge (x!87011 lt!441393) #b01111111111111111111111111111110))))

(declare-fun b!997292 () Bool)

(assert (=> b!997292 (= e!562523 (Intermediate!9303 false (toIndex!0 (select (arr!30371 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!997293 () Bool)

(assert (=> b!997293 (and (bvsge (index!39585 lt!441393) #b00000000000000000000000000000000) (bvslt (index!39585 lt!441393) (size!30873 a!3219)))))

(declare-fun res!667333 () Bool)

(assert (=> b!997293 (= res!667333 (= (select (arr!30371 a!3219) (index!39585 lt!441393)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!997293 (=> res!667333 e!562519)))

(assert (= (and d!119053 c!101119) b!997287))

(assert (= (and d!119053 (not c!101119)) b!997285))

(assert (= (and b!997285 c!101118) b!997292))

(assert (= (and b!997285 (not c!101118)) b!997286))

(assert (= (and d!119053 c!101120) b!997291))

(assert (= (and d!119053 (not c!101120)) b!997289))

(assert (= (and b!997289 res!667334) b!997290))

(assert (= (and b!997290 (not res!667335)) b!997293))

(assert (= (and b!997293 (not res!667333)) b!997288))

(declare-fun m!924177 () Bool)

(assert (=> b!997288 m!924177))

(assert (=> b!997290 m!924177))

(assert (=> b!997286 m!924079))

(declare-fun m!924179 () Bool)

(assert (=> b!997286 m!924179))

(assert (=> b!997286 m!924179))

(assert (=> b!997286 m!924077))

(declare-fun m!924181 () Bool)

(assert (=> b!997286 m!924181))

(assert (=> b!997293 m!924177))

(assert (=> d!119053 m!924079))

(declare-fun m!924183 () Bool)

(assert (=> d!119053 m!924183))

(assert (=> d!119053 m!924093))

(assert (=> b!997130 d!119053))

(declare-fun d!119061 () Bool)

(declare-fun lt!441407 () (_ BitVec 32))

(declare-fun lt!441406 () (_ BitVec 32))

(assert (=> d!119061 (= lt!441407 (bvmul (bvxor lt!441406 (bvlshr lt!441406 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119061 (= lt!441406 ((_ extract 31 0) (bvand (bvxor (select (arr!30371 a!3219) j!170) (bvlshr (select (arr!30371 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119061 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!667339 (let ((h!22210 ((_ extract 31 0) (bvand (bvxor (select (arr!30371 a!3219) j!170) (bvlshr (select (arr!30371 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87015 (bvmul (bvxor h!22210 (bvlshr h!22210 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87015 (bvlshr x!87015 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!667339 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!667339 #b00000000000000000000000000000000))))))

(assert (=> d!119061 (= (toIndex!0 (select (arr!30371 a!3219) j!170) mask!3464) (bvand (bvxor lt!441407 (bvlshr lt!441407 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!997130 d!119061))

(declare-fun b!997385 () Bool)

(declare-fun e!562579 () SeekEntryResult!9303)

(declare-fun lt!441433 () SeekEntryResult!9303)

(assert (=> b!997385 (= e!562579 (Found!9303 (index!39585 lt!441433)))))

(declare-fun b!997386 () Bool)

(declare-fun e!562578 () SeekEntryResult!9303)

(assert (=> b!997386 (= e!562578 (MissingZero!9303 (index!39585 lt!441433)))))

(declare-fun b!997388 () Bool)

(declare-fun e!562580 () SeekEntryResult!9303)

(assert (=> b!997388 (= e!562580 e!562579)))

(declare-fun lt!441431 () (_ BitVec 64))

(assert (=> b!997388 (= lt!441431 (select (arr!30371 a!3219) (index!39585 lt!441433)))))

(declare-fun c!101155 () Bool)

(assert (=> b!997388 (= c!101155 (= lt!441431 k0!2224))))

(declare-fun b!997389 () Bool)

(assert (=> b!997389 (= e!562580 Undefined!9303)))

(declare-fun b!997390 () Bool)

(declare-fun c!101153 () Bool)

(assert (=> b!997390 (= c!101153 (= lt!441431 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!997390 (= e!562579 e!562578)))

(declare-fun b!997387 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63079 (_ BitVec 32)) SeekEntryResult!9303)

(assert (=> b!997387 (= e!562578 (seekKeyOrZeroReturnVacant!0 (x!87011 lt!441433) (index!39585 lt!441433) (index!39585 lt!441433) k0!2224 a!3219 mask!3464))))

(declare-fun d!119071 () Bool)

(declare-fun lt!441432 () SeekEntryResult!9303)

(assert (=> d!119071 (and (or ((_ is Undefined!9303) lt!441432) (not ((_ is Found!9303) lt!441432)) (and (bvsge (index!39584 lt!441432) #b00000000000000000000000000000000) (bvslt (index!39584 lt!441432) (size!30873 a!3219)))) (or ((_ is Undefined!9303) lt!441432) ((_ is Found!9303) lt!441432) (not ((_ is MissingZero!9303) lt!441432)) (and (bvsge (index!39583 lt!441432) #b00000000000000000000000000000000) (bvslt (index!39583 lt!441432) (size!30873 a!3219)))) (or ((_ is Undefined!9303) lt!441432) ((_ is Found!9303) lt!441432) ((_ is MissingZero!9303) lt!441432) (not ((_ is MissingVacant!9303) lt!441432)) (and (bvsge (index!39586 lt!441432) #b00000000000000000000000000000000) (bvslt (index!39586 lt!441432) (size!30873 a!3219)))) (or ((_ is Undefined!9303) lt!441432) (ite ((_ is Found!9303) lt!441432) (= (select (arr!30371 a!3219) (index!39584 lt!441432)) k0!2224) (ite ((_ is MissingZero!9303) lt!441432) (= (select (arr!30371 a!3219) (index!39583 lt!441432)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9303) lt!441432) (= (select (arr!30371 a!3219) (index!39586 lt!441432)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!119071 (= lt!441432 e!562580)))

(declare-fun c!101154 () Bool)

(assert (=> d!119071 (= c!101154 (and ((_ is Intermediate!9303) lt!441433) (undefined!10115 lt!441433)))))

(assert (=> d!119071 (= lt!441433 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!119071 (validMask!0 mask!3464)))

(assert (=> d!119071 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!441432)))

(assert (= (and d!119071 c!101154) b!997389))

(assert (= (and d!119071 (not c!101154)) b!997388))

(assert (= (and b!997388 c!101155) b!997385))

(assert (= (and b!997388 (not c!101155)) b!997390))

(assert (= (and b!997390 c!101153) b!997386))

(assert (= (and b!997390 (not c!101153)) b!997387))

(declare-fun m!924225 () Bool)

(assert (=> b!997388 m!924225))

(declare-fun m!924227 () Bool)

(assert (=> b!997387 m!924227))

(declare-fun m!924229 () Bool)

(assert (=> d!119071 m!924229))

(declare-fun m!924231 () Bool)

(assert (=> d!119071 m!924231))

(declare-fun m!924233 () Bool)

(assert (=> d!119071 m!924233))

(declare-fun m!924235 () Bool)

(assert (=> d!119071 m!924235))

(assert (=> d!119071 m!924233))

(declare-fun m!924237 () Bool)

(assert (=> d!119071 m!924237))

(assert (=> d!119071 m!924093))

(assert (=> b!997129 d!119071))

(declare-fun b!997419 () Bool)

(declare-fun e!562603 () Bool)

(declare-fun e!562602 () Bool)

(assert (=> b!997419 (= e!562603 e!562602)))

(declare-fun lt!441450 () (_ BitVec 64))

(assert (=> b!997419 (= lt!441450 (select (arr!30371 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32978 0))(
  ( (Unit!32979) )
))
(declare-fun lt!441449 () Unit!32978)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63079 (_ BitVec 64) (_ BitVec 32)) Unit!32978)

(assert (=> b!997419 (= lt!441449 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!441450 #b00000000000000000000000000000000))))

(assert (=> b!997419 (arrayContainsKey!0 a!3219 lt!441450 #b00000000000000000000000000000000)))

(declare-fun lt!441448 () Unit!32978)

(assert (=> b!997419 (= lt!441448 lt!441449)))

(declare-fun res!667383 () Bool)

(assert (=> b!997419 (= res!667383 (= (seekEntryOrOpen!0 (select (arr!30371 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9303 #b00000000000000000000000000000000)))))

(assert (=> b!997419 (=> (not res!667383) (not e!562602))))

(declare-fun b!997420 () Bool)

(declare-fun call!42257 () Bool)

(assert (=> b!997420 (= e!562602 call!42257)))

(declare-fun d!119085 () Bool)

(declare-fun res!667382 () Bool)

(declare-fun e!562604 () Bool)

(assert (=> d!119085 (=> res!667382 e!562604)))

(assert (=> d!119085 (= res!667382 (bvsge #b00000000000000000000000000000000 (size!30873 a!3219)))))

(assert (=> d!119085 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!562604)))

(declare-fun b!997421 () Bool)

(assert (=> b!997421 (= e!562604 e!562603)))

(declare-fun c!101162 () Bool)

(assert (=> b!997421 (= c!101162 (validKeyInArray!0 (select (arr!30371 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!997422 () Bool)

(assert (=> b!997422 (= e!562603 call!42257)))

(declare-fun bm!42254 () Bool)

(assert (=> bm!42254 (= call!42257 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(assert (= (and d!119085 (not res!667382)) b!997421))

(assert (= (and b!997421 c!101162) b!997419))

(assert (= (and b!997421 (not c!101162)) b!997422))

(assert (= (and b!997419 res!667383) b!997420))

(assert (= (or b!997420 b!997422) bm!42254))

(assert (=> b!997419 m!924133))

(declare-fun m!924253 () Bool)

(assert (=> b!997419 m!924253))

(declare-fun m!924255 () Bool)

(assert (=> b!997419 m!924255))

(assert (=> b!997419 m!924133))

(declare-fun m!924257 () Bool)

(assert (=> b!997419 m!924257))

(assert (=> b!997421 m!924133))

(assert (=> b!997421 m!924133))

(assert (=> b!997421 m!924147))

(declare-fun m!924259 () Bool)

(assert (=> bm!42254 m!924259))

(assert (=> b!997134 d!119085))

(declare-fun d!119091 () Bool)

(assert (=> d!119091 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86074 d!119091))

(declare-fun d!119093 () Bool)

(assert (=> d!119093 (= (array_inv!23495 a!3219) (bvsge (size!30873 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86074 d!119093))

(declare-fun b!997423 () Bool)

(declare-fun e!562608 () SeekEntryResult!9303)

(declare-fun e!562609 () SeekEntryResult!9303)

(assert (=> b!997423 (= e!562608 e!562609)))

(declare-fun lt!441451 () (_ BitVec 64))

(declare-fun c!101163 () Bool)

(assert (=> b!997423 (= c!101163 (or (= lt!441451 (select (arr!30371 a!3219) j!170)) (= (bvadd lt!441451 lt!441451) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!997424 () Bool)

(assert (=> b!997424 (= e!562609 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30371 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!997425 () Bool)

(assert (=> b!997425 (= e!562608 (Intermediate!9303 true index!1507 x!1245))))

(declare-fun b!997426 () Bool)

(declare-fun lt!441452 () SeekEntryResult!9303)

(assert (=> b!997426 (and (bvsge (index!39585 lt!441452) #b00000000000000000000000000000000) (bvslt (index!39585 lt!441452) (size!30873 a!3219)))))

(declare-fun e!562605 () Bool)

(assert (=> b!997426 (= e!562605 (= (select (arr!30371 a!3219) (index!39585 lt!441452)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!997427 () Bool)

(declare-fun e!562607 () Bool)

(declare-fun e!562606 () Bool)

(assert (=> b!997427 (= e!562607 e!562606)))

(declare-fun res!667385 () Bool)

(assert (=> b!997427 (= res!667385 (and ((_ is Intermediate!9303) lt!441452) (not (undefined!10115 lt!441452)) (bvslt (x!87011 lt!441452) #b01111111111111111111111111111110) (bvsge (x!87011 lt!441452) #b00000000000000000000000000000000) (bvsge (x!87011 lt!441452) x!1245)))))

(assert (=> b!997427 (=> (not res!667385) (not e!562606))))

(declare-fun b!997428 () Bool)

(assert (=> b!997428 (and (bvsge (index!39585 lt!441452) #b00000000000000000000000000000000) (bvslt (index!39585 lt!441452) (size!30873 a!3219)))))

(declare-fun res!667386 () Bool)

(assert (=> b!997428 (= res!667386 (= (select (arr!30371 a!3219) (index!39585 lt!441452)) (select (arr!30371 a!3219) j!170)))))

(assert (=> b!997428 (=> res!667386 e!562605)))

(assert (=> b!997428 (= e!562606 e!562605)))

(declare-fun d!119095 () Bool)

(assert (=> d!119095 e!562607))

(declare-fun c!101165 () Bool)

(assert (=> d!119095 (= c!101165 (and ((_ is Intermediate!9303) lt!441452) (undefined!10115 lt!441452)))))

(assert (=> d!119095 (= lt!441452 e!562608)))

(declare-fun c!101164 () Bool)

(assert (=> d!119095 (= c!101164 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!119095 (= lt!441451 (select (arr!30371 a!3219) index!1507))))

(assert (=> d!119095 (validMask!0 mask!3464)))

(assert (=> d!119095 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30371 a!3219) j!170) a!3219 mask!3464) lt!441452)))

(declare-fun b!997429 () Bool)

(assert (=> b!997429 (= e!562607 (bvsge (x!87011 lt!441452) #b01111111111111111111111111111110))))

(declare-fun b!997430 () Bool)

(assert (=> b!997430 (= e!562609 (Intermediate!9303 false index!1507 x!1245))))

(declare-fun b!997431 () Bool)

(assert (=> b!997431 (and (bvsge (index!39585 lt!441452) #b00000000000000000000000000000000) (bvslt (index!39585 lt!441452) (size!30873 a!3219)))))

(declare-fun res!667384 () Bool)

(assert (=> b!997431 (= res!667384 (= (select (arr!30371 a!3219) (index!39585 lt!441452)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!997431 (=> res!667384 e!562605)))

(assert (= (and d!119095 c!101164) b!997425))

(assert (= (and d!119095 (not c!101164)) b!997423))

(assert (= (and b!997423 c!101163) b!997430))

(assert (= (and b!997423 (not c!101163)) b!997424))

(assert (= (and d!119095 c!101165) b!997429))

(assert (= (and d!119095 (not c!101165)) b!997427))

(assert (= (and b!997427 res!667385) b!997428))

(assert (= (and b!997428 (not res!667386)) b!997431))

(assert (= (and b!997431 (not res!667384)) b!997426))

(declare-fun m!924261 () Bool)

(assert (=> b!997426 m!924261))

(assert (=> b!997428 m!924261))

(declare-fun m!924263 () Bool)

(assert (=> b!997424 m!924263))

(assert (=> b!997424 m!924263))

(assert (=> b!997424 m!924077))

(declare-fun m!924265 () Bool)

(assert (=> b!997424 m!924265))

(assert (=> b!997431 m!924261))

(declare-fun m!924267 () Bool)

(assert (=> d!119095 m!924267))

(assert (=> d!119095 m!924093))

(assert (=> b!997128 d!119095))

(check-sat (not b!997217) (not b!997424) (not d!119095) (not b!997218) (not bm!42245) (not d!119053) (not b!997387) (not b!997419) (not d!119071) (not b!997421) (not b!997214) (not bm!42254) (not b!997286) (not b!997191))
