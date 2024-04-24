; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29452 () Bool)

(assert start!29452)

(declare-fun b!298094 () Bool)

(declare-fun res!157175 () Bool)

(declare-fun e!188347 () Bool)

(assert (=> b!298094 (=> (not res!157175) (not e!188347))))

(declare-datatypes ((array!15072 0))(
  ( (array!15073 (arr!7141 (Array (_ BitVec 32) (_ BitVec 64))) (size!7493 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15072)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15072 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!298094 (= res!157175 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!298095 () Bool)

(declare-fun e!188346 () Bool)

(assert (=> b!298095 (= e!188347 e!188346)))

(declare-fun res!157176 () Bool)

(assert (=> b!298095 (=> (not res!157176) (not e!188346))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!148210 () Bool)

(declare-datatypes ((SeekEntryResult!2255 0))(
  ( (MissingZero!2255 (index!11193 (_ BitVec 32))) (Found!2255 (index!11194 (_ BitVec 32))) (Intermediate!2255 (undefined!3067 Bool) (index!11195 (_ BitVec 32)) (x!29527 (_ BitVec 32))) (Undefined!2255) (MissingVacant!2255 (index!11196 (_ BitVec 32))) )
))
(declare-fun lt!148212 () SeekEntryResult!2255)

(assert (=> b!298095 (= res!157176 (or lt!148210 (= lt!148212 (MissingVacant!2255 i!1256))))))

(assert (=> b!298095 (= lt!148210 (= lt!148212 (MissingZero!2255 i!1256)))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15072 (_ BitVec 32)) SeekEntryResult!2255)

(assert (=> b!298095 (= lt!148212 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun lt!148208 () SeekEntryResult!2255)

(declare-fun b!298096 () Bool)

(get-info :version)

(assert (=> b!298096 (= e!188346 (and (not lt!148210) (= lt!148212 (MissingVacant!2255 i!1256)) ((_ is Intermediate!2255) lt!148208) (undefined!3067 lt!148208)))))

(declare-fun lt!148209 () (_ BitVec 32))

(declare-fun lt!148211 () SeekEntryResult!2255)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15072 (_ BitVec 32)) SeekEntryResult!2255)

(assert (=> b!298096 (= lt!148211 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148209 k0!2524 (array!15073 (store (arr!7141 a!3312) i!1256 k0!2524) (size!7493 a!3312)) mask!3809))))

(assert (=> b!298096 (= lt!148208 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148209 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298096 (= lt!148209 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!298097 () Bool)

(declare-fun res!157178 () Bool)

(assert (=> b!298097 (=> (not res!157178) (not e!188347))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!298097 (= res!157178 (validKeyInArray!0 k0!2524))))

(declare-fun b!298098 () Bool)

(declare-fun res!157177 () Bool)

(assert (=> b!298098 (=> (not res!157177) (not e!188347))))

(assert (=> b!298098 (= res!157177 (and (= (size!7493 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7493 a!3312))))))

(declare-fun res!157179 () Bool)

(assert (=> start!29452 (=> (not res!157179) (not e!188347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29452 (= res!157179 (validMask!0 mask!3809))))

(assert (=> start!29452 e!188347))

(assert (=> start!29452 true))

(declare-fun array_inv!5091 (array!15072) Bool)

(assert (=> start!29452 (array_inv!5091 a!3312)))

(declare-fun b!298099 () Bool)

(declare-fun res!157174 () Bool)

(assert (=> b!298099 (=> (not res!157174) (not e!188346))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15072 (_ BitVec 32)) Bool)

(assert (=> b!298099 (= res!157174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!29452 res!157179) b!298098))

(assert (= (and b!298098 res!157177) b!298097))

(assert (= (and b!298097 res!157178) b!298094))

(assert (= (and b!298094 res!157175) b!298095))

(assert (= (and b!298095 res!157176) b!298099))

(assert (= (and b!298099 res!157174) b!298096))

(declare-fun m!310859 () Bool)

(assert (=> b!298097 m!310859))

(declare-fun m!310861 () Bool)

(assert (=> b!298094 m!310861))

(declare-fun m!310863 () Bool)

(assert (=> b!298095 m!310863))

(declare-fun m!310865 () Bool)

(assert (=> start!29452 m!310865))

(declare-fun m!310867 () Bool)

(assert (=> start!29452 m!310867))

(declare-fun m!310869 () Bool)

(assert (=> b!298096 m!310869))

(declare-fun m!310871 () Bool)

(assert (=> b!298096 m!310871))

(declare-fun m!310873 () Bool)

(assert (=> b!298096 m!310873))

(declare-fun m!310875 () Bool)

(assert (=> b!298096 m!310875))

(declare-fun m!310877 () Bool)

(assert (=> b!298099 m!310877))

(check-sat (not b!298094) (not b!298097) (not b!298096) (not b!298099) (not b!298095) (not start!29452))
(check-sat)
(get-model)

(declare-fun bm!25759 () Bool)

(declare-fun call!25762 () Bool)

(assert (=> bm!25759 (= call!25762 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!298144 () Bool)

(declare-fun e!188373 () Bool)

(assert (=> b!298144 (= e!188373 call!25762)))

(declare-fun b!298145 () Bool)

(declare-fun e!188374 () Bool)

(declare-fun e!188375 () Bool)

(assert (=> b!298145 (= e!188374 e!188375)))

(declare-fun c!48046 () Bool)

(assert (=> b!298145 (= c!48046 (validKeyInArray!0 (select (arr!7141 a!3312) #b00000000000000000000000000000000)))))

(declare-fun d!67359 () Bool)

(declare-fun res!157221 () Bool)

(assert (=> d!67359 (=> res!157221 e!188374)))

(assert (=> d!67359 (= res!157221 (bvsge #b00000000000000000000000000000000 (size!7493 a!3312)))))

(assert (=> d!67359 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!188374)))

(declare-fun b!298146 () Bool)

(assert (=> b!298146 (= e!188375 e!188373)))

(declare-fun lt!148249 () (_ BitVec 64))

(assert (=> b!298146 (= lt!148249 (select (arr!7141 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9263 0))(
  ( (Unit!9264) )
))
(declare-fun lt!148250 () Unit!9263)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15072 (_ BitVec 64) (_ BitVec 32)) Unit!9263)

(assert (=> b!298146 (= lt!148250 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!148249 #b00000000000000000000000000000000))))

(assert (=> b!298146 (arrayContainsKey!0 a!3312 lt!148249 #b00000000000000000000000000000000)))

(declare-fun lt!148251 () Unit!9263)

(assert (=> b!298146 (= lt!148251 lt!148250)))

(declare-fun res!157220 () Bool)

(assert (=> b!298146 (= res!157220 (= (seekEntryOrOpen!0 (select (arr!7141 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2255 #b00000000000000000000000000000000)))))

(assert (=> b!298146 (=> (not res!157220) (not e!188373))))

(declare-fun b!298147 () Bool)

(assert (=> b!298147 (= e!188375 call!25762)))

(assert (= (and d!67359 (not res!157221)) b!298145))

(assert (= (and b!298145 c!48046) b!298146))

(assert (= (and b!298145 (not c!48046)) b!298147))

(assert (= (and b!298146 res!157220) b!298144))

(assert (= (or b!298144 b!298147) bm!25759))

(declare-fun m!310919 () Bool)

(assert (=> bm!25759 m!310919))

(declare-fun m!310921 () Bool)

(assert (=> b!298145 m!310921))

(assert (=> b!298145 m!310921))

(declare-fun m!310923 () Bool)

(assert (=> b!298145 m!310923))

(assert (=> b!298146 m!310921))

(declare-fun m!310925 () Bool)

(assert (=> b!298146 m!310925))

(declare-fun m!310927 () Bool)

(assert (=> b!298146 m!310927))

(assert (=> b!298146 m!310921))

(declare-fun m!310929 () Bool)

(assert (=> b!298146 m!310929))

(assert (=> b!298099 d!67359))

(declare-fun d!67365 () Bool)

(declare-fun res!157226 () Bool)

(declare-fun e!188380 () Bool)

(assert (=> d!67365 (=> res!157226 e!188380)))

(assert (=> d!67365 (= res!157226 (= (select (arr!7141 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!67365 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!188380)))

(declare-fun b!298152 () Bool)

(declare-fun e!188381 () Bool)

(assert (=> b!298152 (= e!188380 e!188381)))

(declare-fun res!157227 () Bool)

(assert (=> b!298152 (=> (not res!157227) (not e!188381))))

(assert (=> b!298152 (= res!157227 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7493 a!3312)))))

(declare-fun b!298153 () Bool)

(assert (=> b!298153 (= e!188381 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67365 (not res!157226)) b!298152))

(assert (= (and b!298152 res!157227) b!298153))

(assert (=> d!67365 m!310921))

(declare-fun m!310931 () Bool)

(assert (=> b!298153 m!310931))

(assert (=> b!298094 d!67365))

(declare-fun d!67367 () Bool)

(assert (=> d!67367 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29452 d!67367))

(declare-fun d!67371 () Bool)

(assert (=> d!67371 (= (array_inv!5091 a!3312) (bvsge (size!7493 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29452 d!67371))

(declare-fun d!67373 () Bool)

(assert (=> d!67373 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!298097 d!67373))

(declare-fun b!298214 () Bool)

(declare-fun e!188418 () SeekEntryResult!2255)

(declare-fun e!188417 () SeekEntryResult!2255)

(assert (=> b!298214 (= e!188418 e!188417)))

(declare-fun lt!148281 () (_ BitVec 64))

(declare-fun lt!148280 () SeekEntryResult!2255)

(assert (=> b!298214 (= lt!148281 (select (arr!7141 a!3312) (index!11195 lt!148280)))))

(declare-fun c!48072 () Bool)

(assert (=> b!298214 (= c!48072 (= lt!148281 k0!2524))))

(declare-fun b!298215 () Bool)

(declare-fun e!188416 () SeekEntryResult!2255)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15072 (_ BitVec 32)) SeekEntryResult!2255)

(assert (=> b!298215 (= e!188416 (seekKeyOrZeroReturnVacant!0 (x!29527 lt!148280) (index!11195 lt!148280) (index!11195 lt!148280) k0!2524 a!3312 mask!3809))))

(declare-fun d!67375 () Bool)

(declare-fun lt!148282 () SeekEntryResult!2255)

(assert (=> d!67375 (and (or ((_ is Undefined!2255) lt!148282) (not ((_ is Found!2255) lt!148282)) (and (bvsge (index!11194 lt!148282) #b00000000000000000000000000000000) (bvslt (index!11194 lt!148282) (size!7493 a!3312)))) (or ((_ is Undefined!2255) lt!148282) ((_ is Found!2255) lt!148282) (not ((_ is MissingZero!2255) lt!148282)) (and (bvsge (index!11193 lt!148282) #b00000000000000000000000000000000) (bvslt (index!11193 lt!148282) (size!7493 a!3312)))) (or ((_ is Undefined!2255) lt!148282) ((_ is Found!2255) lt!148282) ((_ is MissingZero!2255) lt!148282) (not ((_ is MissingVacant!2255) lt!148282)) (and (bvsge (index!11196 lt!148282) #b00000000000000000000000000000000) (bvslt (index!11196 lt!148282) (size!7493 a!3312)))) (or ((_ is Undefined!2255) lt!148282) (ite ((_ is Found!2255) lt!148282) (= (select (arr!7141 a!3312) (index!11194 lt!148282)) k0!2524) (ite ((_ is MissingZero!2255) lt!148282) (= (select (arr!7141 a!3312) (index!11193 lt!148282)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2255) lt!148282) (= (select (arr!7141 a!3312) (index!11196 lt!148282)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67375 (= lt!148282 e!188418)))

(declare-fun c!48073 () Bool)

(assert (=> d!67375 (= c!48073 (and ((_ is Intermediate!2255) lt!148280) (undefined!3067 lt!148280)))))

(assert (=> d!67375 (= lt!148280 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!67375 (validMask!0 mask!3809)))

(assert (=> d!67375 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!148282)))

(declare-fun b!298216 () Bool)

(assert (=> b!298216 (= e!188418 Undefined!2255)))

(declare-fun b!298217 () Bool)

(declare-fun c!48071 () Bool)

(assert (=> b!298217 (= c!48071 (= lt!148281 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!298217 (= e!188417 e!188416)))

(declare-fun b!298218 () Bool)

(assert (=> b!298218 (= e!188416 (MissingZero!2255 (index!11195 lt!148280)))))

(declare-fun b!298219 () Bool)

(assert (=> b!298219 (= e!188417 (Found!2255 (index!11195 lt!148280)))))

(assert (= (and d!67375 c!48073) b!298216))

(assert (= (and d!67375 (not c!48073)) b!298214))

(assert (= (and b!298214 c!48072) b!298219))

(assert (= (and b!298214 (not c!48072)) b!298217))

(assert (= (and b!298217 c!48071) b!298218))

(assert (= (and b!298217 (not c!48071)) b!298215))

(declare-fun m!310957 () Bool)

(assert (=> b!298214 m!310957))

(declare-fun m!310959 () Bool)

(assert (=> b!298215 m!310959))

(declare-fun m!310961 () Bool)

(assert (=> d!67375 m!310961))

(assert (=> d!67375 m!310865))

(assert (=> d!67375 m!310875))

(declare-fun m!310963 () Bool)

(assert (=> d!67375 m!310963))

(assert (=> d!67375 m!310875))

(declare-fun m!310965 () Bool)

(assert (=> d!67375 m!310965))

(declare-fun m!310967 () Bool)

(assert (=> d!67375 m!310967))

(assert (=> b!298095 d!67375))

(declare-fun b!298278 () Bool)

(declare-fun e!188458 () Bool)

(declare-fun e!188459 () Bool)

(assert (=> b!298278 (= e!188458 e!188459)))

(declare-fun res!157263 () Bool)

(declare-fun lt!148308 () SeekEntryResult!2255)

(assert (=> b!298278 (= res!157263 (and ((_ is Intermediate!2255) lt!148308) (not (undefined!3067 lt!148308)) (bvslt (x!29527 lt!148308) #b01111111111111111111111111111110) (bvsge (x!29527 lt!148308) #b00000000000000000000000000000000) (bvsge (x!29527 lt!148308) #b00000000000000000000000000000000)))))

(assert (=> b!298278 (=> (not res!157263) (not e!188459))))

(declare-fun d!67381 () Bool)

(assert (=> d!67381 e!188458))

(declare-fun c!48092 () Bool)

(assert (=> d!67381 (= c!48092 (and ((_ is Intermediate!2255) lt!148308) (undefined!3067 lt!148308)))))

(declare-fun e!188456 () SeekEntryResult!2255)

(assert (=> d!67381 (= lt!148308 e!188456)))

(declare-fun c!48093 () Bool)

(assert (=> d!67381 (= c!48093 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!148307 () (_ BitVec 64))

(assert (=> d!67381 (= lt!148307 (select (arr!7141 (array!15073 (store (arr!7141 a!3312) i!1256 k0!2524) (size!7493 a!3312))) lt!148209))))

(assert (=> d!67381 (validMask!0 mask!3809)))

(assert (=> d!67381 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148209 k0!2524 (array!15073 (store (arr!7141 a!3312) i!1256 k0!2524) (size!7493 a!3312)) mask!3809) lt!148308)))

(declare-fun b!298279 () Bool)

(assert (=> b!298279 (= e!188456 (Intermediate!2255 true lt!148209 #b00000000000000000000000000000000))))

(declare-fun b!298280 () Bool)

(declare-fun e!188457 () SeekEntryResult!2255)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298280 (= e!188457 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148209 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 (array!15073 (store (arr!7141 a!3312) i!1256 k0!2524) (size!7493 a!3312)) mask!3809))))

(declare-fun b!298281 () Bool)

(assert (=> b!298281 (and (bvsge (index!11195 lt!148308) #b00000000000000000000000000000000) (bvslt (index!11195 lt!148308) (size!7493 (array!15073 (store (arr!7141 a!3312) i!1256 k0!2524) (size!7493 a!3312)))))))

(declare-fun res!157264 () Bool)

(assert (=> b!298281 (= res!157264 (= (select (arr!7141 (array!15073 (store (arr!7141 a!3312) i!1256 k0!2524) (size!7493 a!3312))) (index!11195 lt!148308)) k0!2524))))

(declare-fun e!188455 () Bool)

(assert (=> b!298281 (=> res!157264 e!188455)))

(assert (=> b!298281 (= e!188459 e!188455)))

(declare-fun b!298282 () Bool)

(assert (=> b!298282 (= e!188458 (bvsge (x!29527 lt!148308) #b01111111111111111111111111111110))))

(declare-fun b!298283 () Bool)

(assert (=> b!298283 (= e!188456 e!188457)))

(declare-fun c!48094 () Bool)

(assert (=> b!298283 (= c!48094 (or (= lt!148307 k0!2524) (= (bvadd lt!148307 lt!148307) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!298284 () Bool)

(assert (=> b!298284 (and (bvsge (index!11195 lt!148308) #b00000000000000000000000000000000) (bvslt (index!11195 lt!148308) (size!7493 (array!15073 (store (arr!7141 a!3312) i!1256 k0!2524) (size!7493 a!3312)))))))

(assert (=> b!298284 (= e!188455 (= (select (arr!7141 (array!15073 (store (arr!7141 a!3312) i!1256 k0!2524) (size!7493 a!3312))) (index!11195 lt!148308)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!298285 () Bool)

(assert (=> b!298285 (and (bvsge (index!11195 lt!148308) #b00000000000000000000000000000000) (bvslt (index!11195 lt!148308) (size!7493 (array!15073 (store (arr!7141 a!3312) i!1256 k0!2524) (size!7493 a!3312)))))))

(declare-fun res!157265 () Bool)

(assert (=> b!298285 (= res!157265 (= (select (arr!7141 (array!15073 (store (arr!7141 a!3312) i!1256 k0!2524) (size!7493 a!3312))) (index!11195 lt!148308)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!298285 (=> res!157265 e!188455)))

(declare-fun b!298286 () Bool)

(assert (=> b!298286 (= e!188457 (Intermediate!2255 false lt!148209 #b00000000000000000000000000000000))))

(assert (= (and d!67381 c!48093) b!298279))

(assert (= (and d!67381 (not c!48093)) b!298283))

(assert (= (and b!298283 c!48094) b!298286))

(assert (= (and b!298283 (not c!48094)) b!298280))

(assert (= (and d!67381 c!48092) b!298282))

(assert (= (and d!67381 (not c!48092)) b!298278))

(assert (= (and b!298278 res!157263) b!298281))

(assert (= (and b!298281 (not res!157264)) b!298285))

(assert (= (and b!298285 (not res!157265)) b!298284))

(declare-fun m!310985 () Bool)

(assert (=> b!298280 m!310985))

(assert (=> b!298280 m!310985))

(declare-fun m!310987 () Bool)

(assert (=> b!298280 m!310987))

(declare-fun m!310989 () Bool)

(assert (=> b!298285 m!310989))

(assert (=> b!298281 m!310989))

(assert (=> b!298284 m!310989))

(declare-fun m!310991 () Bool)

(assert (=> d!67381 m!310991))

(assert (=> d!67381 m!310865))

(assert (=> b!298096 d!67381))

(declare-fun b!298297 () Bool)

(declare-fun e!188469 () Bool)

(declare-fun e!188470 () Bool)

(assert (=> b!298297 (= e!188469 e!188470)))

(declare-fun res!157272 () Bool)

(declare-fun lt!148310 () SeekEntryResult!2255)

(assert (=> b!298297 (= res!157272 (and ((_ is Intermediate!2255) lt!148310) (not (undefined!3067 lt!148310)) (bvslt (x!29527 lt!148310) #b01111111111111111111111111111110) (bvsge (x!29527 lt!148310) #b00000000000000000000000000000000) (bvsge (x!29527 lt!148310) #b00000000000000000000000000000000)))))

(assert (=> b!298297 (=> (not res!157272) (not e!188470))))

(declare-fun d!67395 () Bool)

(assert (=> d!67395 e!188469))

(declare-fun c!48097 () Bool)

(assert (=> d!67395 (= c!48097 (and ((_ is Intermediate!2255) lt!148310) (undefined!3067 lt!148310)))))

(declare-fun e!188467 () SeekEntryResult!2255)

(assert (=> d!67395 (= lt!148310 e!188467)))

(declare-fun c!48098 () Bool)

(assert (=> d!67395 (= c!48098 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!148309 () (_ BitVec 64))

(assert (=> d!67395 (= lt!148309 (select (arr!7141 a!3312) lt!148209))))

(assert (=> d!67395 (validMask!0 mask!3809)))

(assert (=> d!67395 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148209 k0!2524 a!3312 mask!3809) lt!148310)))

(declare-fun b!298298 () Bool)

(assert (=> b!298298 (= e!188467 (Intermediate!2255 true lt!148209 #b00000000000000000000000000000000))))

(declare-fun b!298299 () Bool)

(declare-fun e!188468 () SeekEntryResult!2255)

(assert (=> b!298299 (= e!188468 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148209 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!298300 () Bool)

(assert (=> b!298300 (and (bvsge (index!11195 lt!148310) #b00000000000000000000000000000000) (bvslt (index!11195 lt!148310) (size!7493 a!3312)))))

(declare-fun res!157273 () Bool)

(assert (=> b!298300 (= res!157273 (= (select (arr!7141 a!3312) (index!11195 lt!148310)) k0!2524))))

(declare-fun e!188466 () Bool)

(assert (=> b!298300 (=> res!157273 e!188466)))

(assert (=> b!298300 (= e!188470 e!188466)))

(declare-fun b!298301 () Bool)

(assert (=> b!298301 (= e!188469 (bvsge (x!29527 lt!148310) #b01111111111111111111111111111110))))

(declare-fun b!298302 () Bool)

(assert (=> b!298302 (= e!188467 e!188468)))

(declare-fun c!48099 () Bool)

(assert (=> b!298302 (= c!48099 (or (= lt!148309 k0!2524) (= (bvadd lt!148309 lt!148309) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!298303 () Bool)

(assert (=> b!298303 (and (bvsge (index!11195 lt!148310) #b00000000000000000000000000000000) (bvslt (index!11195 lt!148310) (size!7493 a!3312)))))

(assert (=> b!298303 (= e!188466 (= (select (arr!7141 a!3312) (index!11195 lt!148310)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!298304 () Bool)

(assert (=> b!298304 (and (bvsge (index!11195 lt!148310) #b00000000000000000000000000000000) (bvslt (index!11195 lt!148310) (size!7493 a!3312)))))

(declare-fun res!157274 () Bool)

(assert (=> b!298304 (= res!157274 (= (select (arr!7141 a!3312) (index!11195 lt!148310)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!298304 (=> res!157274 e!188466)))

(declare-fun b!298305 () Bool)

(assert (=> b!298305 (= e!188468 (Intermediate!2255 false lt!148209 #b00000000000000000000000000000000))))

(assert (= (and d!67395 c!48098) b!298298))

(assert (= (and d!67395 (not c!48098)) b!298302))

(assert (= (and b!298302 c!48099) b!298305))

(assert (= (and b!298302 (not c!48099)) b!298299))

(assert (= (and d!67395 c!48097) b!298301))

(assert (= (and d!67395 (not c!48097)) b!298297))

(assert (= (and b!298297 res!157272) b!298300))

(assert (= (and b!298300 (not res!157273)) b!298304))

(assert (= (and b!298304 (not res!157274)) b!298303))

(assert (=> b!298299 m!310985))

(assert (=> b!298299 m!310985))

(declare-fun m!310993 () Bool)

(assert (=> b!298299 m!310993))

(declare-fun m!310995 () Bool)

(assert (=> b!298304 m!310995))

(assert (=> b!298300 m!310995))

(assert (=> b!298303 m!310995))

(declare-fun m!310997 () Bool)

(assert (=> d!67395 m!310997))

(assert (=> d!67395 m!310865))

(assert (=> b!298096 d!67395))

(declare-fun d!67397 () Bool)

(declare-fun lt!148323 () (_ BitVec 32))

(declare-fun lt!148322 () (_ BitVec 32))

(assert (=> d!67397 (= lt!148323 (bvmul (bvxor lt!148322 (bvlshr lt!148322 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67397 (= lt!148322 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67397 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!157277 (let ((h!5217 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29534 (bvmul (bvxor h!5217 (bvlshr h!5217 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29534 (bvlshr x!29534 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!157277 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!157277 #b00000000000000000000000000000000))))))

(assert (=> d!67397 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!148323 (bvlshr lt!148323 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!298096 d!67397))

(check-sat (not b!298280) (not bm!25759) (not d!67381) (not b!298146) (not b!298153) (not b!298215) (not d!67395) (not b!298145) (not b!298299) (not d!67375))
(check-sat)
