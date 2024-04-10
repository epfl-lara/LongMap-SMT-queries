; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68138 () Bool)

(assert start!68138)

(declare-fun b!792281 () Bool)

(declare-fun res!536944 () Bool)

(declare-fun e!440214 () Bool)

(assert (=> b!792281 (=> (not res!536944) (not e!440214))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792281 (= res!536944 (validKeyInArray!0 k0!2044))))

(declare-fun b!792282 () Bool)

(declare-fun e!440215 () Bool)

(assert (=> b!792282 (= e!440214 e!440215)))

(declare-fun res!536950 () Bool)

(assert (=> b!792282 (=> (not res!536950) (not e!440215))))

(declare-datatypes ((SeekEntryResult!8178 0))(
  ( (MissingZero!8178 (index!35080 (_ BitVec 32))) (Found!8178 (index!35081 (_ BitVec 32))) (Intermediate!8178 (undefined!8990 Bool) (index!35082 (_ BitVec 32)) (x!66032 (_ BitVec 32))) (Undefined!8178) (MissingVacant!8178 (index!35083 (_ BitVec 32))) )
))
(declare-fun lt!353426 () SeekEntryResult!8178)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!792282 (= res!536950 (or (= lt!353426 (MissingZero!8178 i!1163)) (= lt!353426 (MissingVacant!8178 i!1163))))))

(declare-datatypes ((array!43008 0))(
  ( (array!43009 (arr!20587 (Array (_ BitVec 32) (_ BitVec 64))) (size!21008 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43008)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43008 (_ BitVec 32)) SeekEntryResult!8178)

(assert (=> b!792282 (= lt!353426 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!792283 () Bool)

(declare-fun res!536947 () Bool)

(assert (=> b!792283 (=> (not res!536947) (not e!440215))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43008 (_ BitVec 32)) Bool)

(assert (=> b!792283 (= res!536947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!792284 () Bool)

(declare-fun res!536949 () Bool)

(assert (=> b!792284 (=> (not res!536949) (not e!440214))))

(declare-fun arrayContainsKey!0 (array!43008 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792284 (= res!536949 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!792286 () Bool)

(declare-fun res!536948 () Bool)

(assert (=> b!792286 (=> (not res!536948) (not e!440214))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!792286 (= res!536948 (validKeyInArray!0 (select (arr!20587 a!3170) j!153)))))

(declare-fun b!792287 () Bool)

(declare-fun res!536945 () Bool)

(assert (=> b!792287 (=> (not res!536945) (not e!440215))))

(assert (=> b!792287 (= res!536945 (and (bvsle #b00000000000000000000000000000000 (size!21008 a!3170)) (bvslt (size!21008 a!3170) #b01111111111111111111111111111111)))))

(declare-fun b!792288 () Bool)

(declare-fun res!536946 () Bool)

(assert (=> b!792288 (=> (not res!536946) (not e!440214))))

(assert (=> b!792288 (= res!536946 (and (= (size!21008 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21008 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21008 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!536951 () Bool)

(assert (=> start!68138 (=> (not res!536951) (not e!440214))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68138 (= res!536951 (validMask!0 mask!3266))))

(assert (=> start!68138 e!440214))

(assert (=> start!68138 true))

(declare-fun array_inv!16383 (array!43008) Bool)

(assert (=> start!68138 (array_inv!16383 a!3170)))

(declare-fun b!792285 () Bool)

(declare-datatypes ((List!14550 0))(
  ( (Nil!14547) (Cons!14546 (h!15675 (_ BitVec 64)) (t!20865 List!14550)) )
))
(declare-fun noDuplicate!1285 (List!14550) Bool)

(assert (=> b!792285 (= e!440215 (not (noDuplicate!1285 Nil!14547)))))

(assert (= (and start!68138 res!536951) b!792288))

(assert (= (and b!792288 res!536946) b!792286))

(assert (= (and b!792286 res!536948) b!792281))

(assert (= (and b!792281 res!536944) b!792284))

(assert (= (and b!792284 res!536949) b!792282))

(assert (= (and b!792282 res!536950) b!792283))

(assert (= (and b!792283 res!536947) b!792287))

(assert (= (and b!792287 res!536945) b!792285))

(declare-fun m!732911 () Bool)

(assert (=> start!68138 m!732911))

(declare-fun m!732913 () Bool)

(assert (=> start!68138 m!732913))

(declare-fun m!732915 () Bool)

(assert (=> b!792281 m!732915))

(declare-fun m!732917 () Bool)

(assert (=> b!792285 m!732917))

(declare-fun m!732919 () Bool)

(assert (=> b!792286 m!732919))

(assert (=> b!792286 m!732919))

(declare-fun m!732921 () Bool)

(assert (=> b!792286 m!732921))

(declare-fun m!732923 () Bool)

(assert (=> b!792282 m!732923))

(declare-fun m!732925 () Bool)

(assert (=> b!792284 m!732925))

(declare-fun m!732927 () Bool)

(assert (=> b!792283 m!732927))

(check-sat (not start!68138) (not b!792283) (not b!792285) (not b!792284) (not b!792282) (not b!792281) (not b!792286))
(check-sat)
(get-model)

(declare-fun d!103179 () Bool)

(declare-fun res!536980 () Bool)

(declare-fun e!440230 () Bool)

(assert (=> d!103179 (=> res!536980 e!440230)))

(assert (=> d!103179 (= res!536980 (= (select (arr!20587 a!3170) #b00000000000000000000000000000000) k0!2044))))

(assert (=> d!103179 (= (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000) e!440230)))

(declare-fun b!792317 () Bool)

(declare-fun e!440231 () Bool)

(assert (=> b!792317 (= e!440230 e!440231)))

(declare-fun res!536981 () Bool)

(assert (=> b!792317 (=> (not res!536981) (not e!440231))))

(assert (=> b!792317 (= res!536981 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21008 a!3170)))))

(declare-fun b!792318 () Bool)

(assert (=> b!792318 (= e!440231 (arrayContainsKey!0 a!3170 k0!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!103179 (not res!536980)) b!792317))

(assert (= (and b!792317 res!536981) b!792318))

(declare-fun m!732947 () Bool)

(assert (=> d!103179 m!732947))

(declare-fun m!732949 () Bool)

(assert (=> b!792318 m!732949))

(assert (=> b!792284 d!103179))

(declare-fun lt!353437 () SeekEntryResult!8178)

(declare-fun b!792337 () Bool)

(declare-fun e!440244 () SeekEntryResult!8178)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43008 (_ BitVec 32)) SeekEntryResult!8178)

(assert (=> b!792337 (= e!440244 (seekKeyOrZeroReturnVacant!0 (x!66032 lt!353437) (index!35082 lt!353437) (index!35082 lt!353437) k0!2044 a!3170 mask!3266))))

(declare-fun b!792338 () Bool)

(declare-fun e!440245 () SeekEntryResult!8178)

(assert (=> b!792338 (= e!440245 Undefined!8178)))

(declare-fun d!103181 () Bool)

(declare-fun lt!353438 () SeekEntryResult!8178)

(get-info :version)

(assert (=> d!103181 (and (or ((_ is Undefined!8178) lt!353438) (not ((_ is Found!8178) lt!353438)) (and (bvsge (index!35081 lt!353438) #b00000000000000000000000000000000) (bvslt (index!35081 lt!353438) (size!21008 a!3170)))) (or ((_ is Undefined!8178) lt!353438) ((_ is Found!8178) lt!353438) (not ((_ is MissingZero!8178) lt!353438)) (and (bvsge (index!35080 lt!353438) #b00000000000000000000000000000000) (bvslt (index!35080 lt!353438) (size!21008 a!3170)))) (or ((_ is Undefined!8178) lt!353438) ((_ is Found!8178) lt!353438) ((_ is MissingZero!8178) lt!353438) (not ((_ is MissingVacant!8178) lt!353438)) (and (bvsge (index!35083 lt!353438) #b00000000000000000000000000000000) (bvslt (index!35083 lt!353438) (size!21008 a!3170)))) (or ((_ is Undefined!8178) lt!353438) (ite ((_ is Found!8178) lt!353438) (= (select (arr!20587 a!3170) (index!35081 lt!353438)) k0!2044) (ite ((_ is MissingZero!8178) lt!353438) (= (select (arr!20587 a!3170) (index!35080 lt!353438)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8178) lt!353438) (= (select (arr!20587 a!3170) (index!35083 lt!353438)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103181 (= lt!353438 e!440245)))

(declare-fun c!88087 () Bool)

(assert (=> d!103181 (= c!88087 (and ((_ is Intermediate!8178) lt!353437) (undefined!8990 lt!353437)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43008 (_ BitVec 32)) SeekEntryResult!8178)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103181 (= lt!353437 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2044 mask!3266) k0!2044 a!3170 mask!3266))))

(assert (=> d!103181 (validMask!0 mask!3266)))

(assert (=> d!103181 (= (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266) lt!353438)))

(declare-fun b!792339 () Bool)

(assert (=> b!792339 (= e!440244 (MissingZero!8178 (index!35082 lt!353437)))))

(declare-fun b!792340 () Bool)

(declare-fun e!440246 () SeekEntryResult!8178)

(assert (=> b!792340 (= e!440246 (Found!8178 (index!35082 lt!353437)))))

(declare-fun b!792341 () Bool)

(assert (=> b!792341 (= e!440245 e!440246)))

(declare-fun lt!353436 () (_ BitVec 64))

(assert (=> b!792341 (= lt!353436 (select (arr!20587 a!3170) (index!35082 lt!353437)))))

(declare-fun c!88086 () Bool)

(assert (=> b!792341 (= c!88086 (= lt!353436 k0!2044))))

(declare-fun b!792342 () Bool)

(declare-fun c!88085 () Bool)

(assert (=> b!792342 (= c!88085 (= lt!353436 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!792342 (= e!440246 e!440244)))

(assert (= (and d!103181 c!88087) b!792338))

(assert (= (and d!103181 (not c!88087)) b!792341))

(assert (= (and b!792341 c!88086) b!792340))

(assert (= (and b!792341 (not c!88086)) b!792342))

(assert (= (and b!792342 c!88085) b!792339))

(assert (= (and b!792342 (not c!88085)) b!792337))

(declare-fun m!732955 () Bool)

(assert (=> b!792337 m!732955))

(declare-fun m!732957 () Bool)

(assert (=> d!103181 m!732957))

(declare-fun m!732959 () Bool)

(assert (=> d!103181 m!732959))

(declare-fun m!732961 () Bool)

(assert (=> d!103181 m!732961))

(assert (=> d!103181 m!732911))

(declare-fun m!732963 () Bool)

(assert (=> d!103181 m!732963))

(assert (=> d!103181 m!732957))

(declare-fun m!732965 () Bool)

(assert (=> d!103181 m!732965))

(declare-fun m!732967 () Bool)

(assert (=> b!792341 m!732967))

(assert (=> b!792282 d!103181))

(declare-fun b!792369 () Bool)

(declare-fun e!440266 () Bool)

(declare-fun call!35331 () Bool)

(assert (=> b!792369 (= e!440266 call!35331)))

(declare-fun d!103193 () Bool)

(declare-fun res!536999 () Bool)

(declare-fun e!440267 () Bool)

(assert (=> d!103193 (=> res!536999 e!440267)))

(assert (=> d!103193 (= res!536999 (bvsge #b00000000000000000000000000000000 (size!21008 a!3170)))))

(assert (=> d!103193 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!440267)))

(declare-fun bm!35328 () Bool)

(assert (=> bm!35328 (= call!35331 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(declare-fun b!792370 () Bool)

(assert (=> b!792370 (= e!440267 e!440266)))

(declare-fun c!88096 () Bool)

(assert (=> b!792370 (= c!88096 (validKeyInArray!0 (select (arr!20587 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!792371 () Bool)

(declare-fun e!440265 () Bool)

(assert (=> b!792371 (= e!440265 call!35331)))

(declare-fun b!792372 () Bool)

(assert (=> b!792372 (= e!440266 e!440265)))

(declare-fun lt!353451 () (_ BitVec 64))

(assert (=> b!792372 (= lt!353451 (select (arr!20587 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27450 0))(
  ( (Unit!27451) )
))
(declare-fun lt!353453 () Unit!27450)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!43008 (_ BitVec 64) (_ BitVec 32)) Unit!27450)

(assert (=> b!792372 (= lt!353453 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!353451 #b00000000000000000000000000000000))))

(assert (=> b!792372 (arrayContainsKey!0 a!3170 lt!353451 #b00000000000000000000000000000000)))

(declare-fun lt!353452 () Unit!27450)

(assert (=> b!792372 (= lt!353452 lt!353453)))

(declare-fun res!536998 () Bool)

(assert (=> b!792372 (= res!536998 (= (seekEntryOrOpen!0 (select (arr!20587 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8178 #b00000000000000000000000000000000)))))

(assert (=> b!792372 (=> (not res!536998) (not e!440265))))

(assert (= (and d!103193 (not res!536999)) b!792370))

(assert (= (and b!792370 c!88096) b!792372))

(assert (= (and b!792370 (not c!88096)) b!792369))

(assert (= (and b!792372 res!536998) b!792371))

(assert (= (or b!792371 b!792369) bm!35328))

(declare-fun m!732973 () Bool)

(assert (=> bm!35328 m!732973))

(assert (=> b!792370 m!732947))

(assert (=> b!792370 m!732947))

(declare-fun m!732975 () Bool)

(assert (=> b!792370 m!732975))

(assert (=> b!792372 m!732947))

(declare-fun m!732977 () Bool)

(assert (=> b!792372 m!732977))

(declare-fun m!732979 () Bool)

(assert (=> b!792372 m!732979))

(assert (=> b!792372 m!732947))

(declare-fun m!732981 () Bool)

(assert (=> b!792372 m!732981))

(assert (=> b!792283 d!103193))

(declare-fun d!103197 () Bool)

(assert (=> d!103197 (= (validKeyInArray!0 k0!2044) (and (not (= k0!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!792281 d!103197))

(declare-fun d!103201 () Bool)

(assert (=> d!103201 (= (validKeyInArray!0 (select (arr!20587 a!3170) j!153)) (and (not (= (select (arr!20587 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20587 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!792286 d!103201))

(declare-fun d!103203 () Bool)

(assert (=> d!103203 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!68138 d!103203))

(declare-fun d!103207 () Bool)

(assert (=> d!103207 (= (array_inv!16383 a!3170) (bvsge (size!21008 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!68138 d!103207))

(declare-fun d!103213 () Bool)

(declare-fun res!537016 () Bool)

(declare-fun e!440290 () Bool)

(assert (=> d!103213 (=> res!537016 e!440290)))

(assert (=> d!103213 (= res!537016 ((_ is Nil!14547) Nil!14547))))

(assert (=> d!103213 (= (noDuplicate!1285 Nil!14547) e!440290)))

(declare-fun b!792401 () Bool)

(declare-fun e!440291 () Bool)

(assert (=> b!792401 (= e!440290 e!440291)))

(declare-fun res!537017 () Bool)

(assert (=> b!792401 (=> (not res!537017) (not e!440291))))

(declare-fun contains!4117 (List!14550 (_ BitVec 64)) Bool)

(assert (=> b!792401 (= res!537017 (not (contains!4117 (t!20865 Nil!14547) (h!15675 Nil!14547))))))

(declare-fun b!792402 () Bool)

(assert (=> b!792402 (= e!440291 (noDuplicate!1285 (t!20865 Nil!14547)))))

(assert (= (and d!103213 (not res!537016)) b!792401))

(assert (= (and b!792401 res!537017) b!792402))

(declare-fun m!733011 () Bool)

(assert (=> b!792401 m!733011))

(declare-fun m!733013 () Bool)

(assert (=> b!792402 m!733013))

(assert (=> b!792285 d!103213))

(check-sat (not b!792318) (not b!792402) (not b!792401) (not bm!35328) (not b!792337) (not d!103181) (not b!792372) (not b!792370))
(check-sat)
