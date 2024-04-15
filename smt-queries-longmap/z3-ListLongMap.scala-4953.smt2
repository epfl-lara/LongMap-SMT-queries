; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68160 () Bool)

(assert start!68160)

(declare-fun b!792203 () Bool)

(declare-fun res!536937 () Bool)

(declare-fun e!440165 () Bool)

(assert (=> b!792203 (=> (not res!536937) (not e!440165))))

(declare-datatypes ((array!43012 0))(
  ( (array!43013 (arr!20588 (Array (_ BitVec 32) (_ BitVec 64))) (size!21009 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43012)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43012 (_ BitVec 32)) Bool)

(assert (=> b!792203 (= res!536937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!792204 () Bool)

(declare-fun e!440164 () Bool)

(assert (=> b!792204 (= e!440164 e!440165)))

(declare-fun res!536941 () Bool)

(assert (=> b!792204 (=> (not res!536941) (not e!440165))))

(declare-datatypes ((SeekEntryResult!8176 0))(
  ( (MissingZero!8176 (index!35072 (_ BitVec 32))) (Found!8176 (index!35073 (_ BitVec 32))) (Intermediate!8176 (undefined!8988 Bool) (index!35074 (_ BitVec 32)) (x!66033 (_ BitVec 32))) (Undefined!8176) (MissingVacant!8176 (index!35075 (_ BitVec 32))) )
))
(declare-fun lt!353246 () SeekEntryResult!8176)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!792204 (= res!536941 (or (= lt!353246 (MissingZero!8176 i!1163)) (= lt!353246 (MissingVacant!8176 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43012 (_ BitVec 32)) SeekEntryResult!8176)

(assert (=> b!792204 (= lt!353246 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!792205 () Bool)

(declare-fun res!536935 () Bool)

(assert (=> b!792205 (=> (not res!536935) (not e!440164))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792205 (= res!536935 (validKeyInArray!0 k0!2044))))

(declare-fun b!792206 () Bool)

(declare-fun res!536934 () Bool)

(assert (=> b!792206 (=> (not res!536934) (not e!440164))))

(declare-fun arrayContainsKey!0 (array!43012 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792206 (= res!536934 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!536939 () Bool)

(assert (=> start!68160 (=> (not res!536939) (not e!440164))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68160 (= res!536939 (validMask!0 mask!3266))))

(assert (=> start!68160 e!440164))

(assert (=> start!68160 true))

(declare-fun array_inv!16471 (array!43012) Bool)

(assert (=> start!68160 (array_inv!16471 a!3170)))

(declare-fun b!792207 () Bool)

(declare-fun e!440167 () Bool)

(declare-datatypes ((List!14590 0))(
  ( (Nil!14587) (Cons!14586 (h!15715 (_ BitVec 64)) (t!20896 List!14590)) )
))
(declare-fun contains!4096 (List!14590 (_ BitVec 64)) Bool)

(assert (=> b!792207 (= e!440167 (contains!4096 Nil!14587 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!792208 () Bool)

(declare-fun res!536943 () Bool)

(assert (=> b!792208 (=> (not res!536943) (not e!440165))))

(declare-fun noDuplicate!1292 (List!14590) Bool)

(assert (=> b!792208 (= res!536943 (noDuplicate!1292 Nil!14587))))

(declare-fun b!792209 () Bool)

(declare-fun res!536940 () Bool)

(assert (=> b!792209 (=> (not res!536940) (not e!440165))))

(assert (=> b!792209 (= res!536940 (and (bvsle #b00000000000000000000000000000000 (size!21009 a!3170)) (bvslt (size!21009 a!3170) #b01111111111111111111111111111111)))))

(declare-fun b!792210 () Bool)

(declare-fun res!536936 () Bool)

(assert (=> b!792210 (=> (not res!536936) (not e!440164))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!792210 (= res!536936 (validKeyInArray!0 (select (arr!20588 a!3170) j!153)))))

(declare-fun b!792211 () Bool)

(declare-fun res!536938 () Bool)

(assert (=> b!792211 (=> (not res!536938) (not e!440164))))

(assert (=> b!792211 (= res!536938 (and (= (size!21009 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21009 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21009 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792212 () Bool)

(assert (=> b!792212 (= e!440165 e!440167)))

(declare-fun res!536942 () Bool)

(assert (=> b!792212 (=> res!536942 e!440167)))

(assert (=> b!792212 (= res!536942 (contains!4096 Nil!14587 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!68160 res!536939) b!792211))

(assert (= (and b!792211 res!536938) b!792210))

(assert (= (and b!792210 res!536936) b!792205))

(assert (= (and b!792205 res!536935) b!792206))

(assert (= (and b!792206 res!536934) b!792204))

(assert (= (and b!792204 res!536941) b!792203))

(assert (= (and b!792203 res!536937) b!792209))

(assert (= (and b!792209 res!536940) b!792208))

(assert (= (and b!792208 res!536943) b!792212))

(assert (= (and b!792212 (not res!536942)) b!792207))

(declare-fun m!732283 () Bool)

(assert (=> b!792207 m!732283))

(declare-fun m!732285 () Bool)

(assert (=> b!792206 m!732285))

(declare-fun m!732287 () Bool)

(assert (=> b!792204 m!732287))

(declare-fun m!732289 () Bool)

(assert (=> b!792203 m!732289))

(declare-fun m!732291 () Bool)

(assert (=> b!792208 m!732291))

(declare-fun m!732293 () Bool)

(assert (=> b!792212 m!732293))

(declare-fun m!732295 () Bool)

(assert (=> b!792205 m!732295))

(declare-fun m!732297 () Bool)

(assert (=> start!68160 m!732297))

(declare-fun m!732299 () Bool)

(assert (=> start!68160 m!732299))

(declare-fun m!732301 () Bool)

(assert (=> b!792210 m!732301))

(assert (=> b!792210 m!732301))

(declare-fun m!732303 () Bool)

(assert (=> b!792210 m!732303))

(check-sat (not b!792212) (not b!792204) (not b!792205) (not b!792210) (not b!792206) (not b!792203) (not b!792207) (not b!792208) (not start!68160))
(check-sat)
(get-model)

(declare-fun d!103029 () Bool)

(declare-fun res!537008 () Bool)

(declare-fun e!440196 () Bool)

(assert (=> d!103029 (=> res!537008 e!440196)))

(assert (=> d!103029 (= res!537008 (= (select (arr!20588 a!3170) #b00000000000000000000000000000000) k0!2044))))

(assert (=> d!103029 (= (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000) e!440196)))

(declare-fun b!792277 () Bool)

(declare-fun e!440197 () Bool)

(assert (=> b!792277 (= e!440196 e!440197)))

(declare-fun res!537009 () Bool)

(assert (=> b!792277 (=> (not res!537009) (not e!440197))))

(assert (=> b!792277 (= res!537009 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21009 a!3170)))))

(declare-fun b!792278 () Bool)

(assert (=> b!792278 (= e!440197 (arrayContainsKey!0 a!3170 k0!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!103029 (not res!537008)) b!792277))

(assert (= (and b!792277 res!537009) b!792278))

(declare-fun m!732349 () Bool)

(assert (=> d!103029 m!732349))

(declare-fun m!732351 () Bool)

(assert (=> b!792278 m!732351))

(assert (=> b!792206 d!103029))

(declare-fun d!103033 () Bool)

(declare-fun lt!353255 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!380 (List!14590) (InoxSet (_ BitVec 64)))

(assert (=> d!103033 (= lt!353255 (select (content!380 Nil!14587) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!440203 () Bool)

(assert (=> d!103033 (= lt!353255 e!440203)))

(declare-fun res!537015 () Bool)

(assert (=> d!103033 (=> (not res!537015) (not e!440203))))

(get-info :version)

(assert (=> d!103033 (= res!537015 ((_ is Cons!14586) Nil!14587))))

(assert (=> d!103033 (= (contains!4096 Nil!14587 #b0000000000000000000000000000000000000000000000000000000000000000) lt!353255)))

(declare-fun b!792283 () Bool)

(declare-fun e!440202 () Bool)

(assert (=> b!792283 (= e!440203 e!440202)))

(declare-fun res!537014 () Bool)

(assert (=> b!792283 (=> res!537014 e!440202)))

(assert (=> b!792283 (= res!537014 (= (h!15715 Nil!14587) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!792284 () Bool)

(assert (=> b!792284 (= e!440202 (contains!4096 (t!20896 Nil!14587) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!103033 res!537015) b!792283))

(assert (= (and b!792283 (not res!537014)) b!792284))

(declare-fun m!732353 () Bool)

(assert (=> d!103033 m!732353))

(declare-fun m!732355 () Bool)

(assert (=> d!103033 m!732355))

(declare-fun m!732357 () Bool)

(assert (=> b!792284 m!732357))

(assert (=> b!792212 d!103033))

(declare-fun d!103037 () Bool)

(assert (=> d!103037 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!68160 d!103037))

(declare-fun d!103039 () Bool)

(assert (=> d!103039 (= (array_inv!16471 a!3170) (bvsge (size!21009 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!68160 d!103039))

(declare-fun d!103041 () Bool)

(assert (=> d!103041 (= (validKeyInArray!0 (select (arr!20588 a!3170) j!153)) (and (not (= (select (arr!20588 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20588 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!792210 d!103041))

(declare-fun d!103043 () Bool)

(assert (=> d!103043 (= (validKeyInArray!0 k0!2044) (and (not (= k0!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!792205 d!103043))

(declare-fun b!792335 () Bool)

(declare-fun e!440235 () Bool)

(declare-fun call!35314 () Bool)

(assert (=> b!792335 (= e!440235 call!35314)))

(declare-fun b!792336 () Bool)

(declare-fun e!440234 () Bool)

(assert (=> b!792336 (= e!440234 call!35314)))

(declare-fun bm!35311 () Bool)

(assert (=> bm!35311 (= call!35314 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(declare-fun d!103045 () Bool)

(declare-fun res!537026 () Bool)

(declare-fun e!440236 () Bool)

(assert (=> d!103045 (=> res!537026 e!440236)))

(assert (=> d!103045 (= res!537026 (bvsge #b00000000000000000000000000000000 (size!21009 a!3170)))))

(assert (=> d!103045 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!440236)))

(declare-fun b!792337 () Bool)

(assert (=> b!792337 (= e!440236 e!440235)))

(declare-fun c!88065 () Bool)

(assert (=> b!792337 (= c!88065 (validKeyInArray!0 (select (arr!20588 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!792338 () Bool)

(assert (=> b!792338 (= e!440235 e!440234)))

(declare-fun lt!353282 () (_ BitVec 64))

(assert (=> b!792338 (= lt!353282 (select (arr!20588 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27418 0))(
  ( (Unit!27419) )
))
(declare-fun lt!353281 () Unit!27418)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!43012 (_ BitVec 64) (_ BitVec 32)) Unit!27418)

(assert (=> b!792338 (= lt!353281 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!353282 #b00000000000000000000000000000000))))

(assert (=> b!792338 (arrayContainsKey!0 a!3170 lt!353282 #b00000000000000000000000000000000)))

(declare-fun lt!353280 () Unit!27418)

(assert (=> b!792338 (= lt!353280 lt!353281)))

(declare-fun res!537027 () Bool)

(assert (=> b!792338 (= res!537027 (= (seekEntryOrOpen!0 (select (arr!20588 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8176 #b00000000000000000000000000000000)))))

(assert (=> b!792338 (=> (not res!537027) (not e!440234))))

(assert (= (and d!103045 (not res!537026)) b!792337))

(assert (= (and b!792337 c!88065) b!792338))

(assert (= (and b!792337 (not c!88065)) b!792335))

(assert (= (and b!792338 res!537027) b!792336))

(assert (= (or b!792336 b!792335) bm!35311))

(declare-fun m!732391 () Bool)

(assert (=> bm!35311 m!732391))

(assert (=> b!792337 m!732349))

(assert (=> b!792337 m!732349))

(declare-fun m!732393 () Bool)

(assert (=> b!792337 m!732393))

(assert (=> b!792338 m!732349))

(declare-fun m!732395 () Bool)

(assert (=> b!792338 m!732395))

(declare-fun m!732397 () Bool)

(assert (=> b!792338 m!732397))

(assert (=> b!792338 m!732349))

(declare-fun m!732399 () Bool)

(assert (=> b!792338 m!732399))

(assert (=> b!792203 d!103045))

(declare-fun b!792385 () Bool)

(declare-fun e!440275 () SeekEntryResult!8176)

(assert (=> b!792385 (= e!440275 Undefined!8176)))

(declare-fun d!103053 () Bool)

(declare-fun lt!353308 () SeekEntryResult!8176)

(assert (=> d!103053 (and (or ((_ is Undefined!8176) lt!353308) (not ((_ is Found!8176) lt!353308)) (and (bvsge (index!35073 lt!353308) #b00000000000000000000000000000000) (bvslt (index!35073 lt!353308) (size!21009 a!3170)))) (or ((_ is Undefined!8176) lt!353308) ((_ is Found!8176) lt!353308) (not ((_ is MissingZero!8176) lt!353308)) (and (bvsge (index!35072 lt!353308) #b00000000000000000000000000000000) (bvslt (index!35072 lt!353308) (size!21009 a!3170)))) (or ((_ is Undefined!8176) lt!353308) ((_ is Found!8176) lt!353308) ((_ is MissingZero!8176) lt!353308) (not ((_ is MissingVacant!8176) lt!353308)) (and (bvsge (index!35075 lt!353308) #b00000000000000000000000000000000) (bvslt (index!35075 lt!353308) (size!21009 a!3170)))) (or ((_ is Undefined!8176) lt!353308) (ite ((_ is Found!8176) lt!353308) (= (select (arr!20588 a!3170) (index!35073 lt!353308)) k0!2044) (ite ((_ is MissingZero!8176) lt!353308) (= (select (arr!20588 a!3170) (index!35072 lt!353308)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8176) lt!353308) (= (select (arr!20588 a!3170) (index!35075 lt!353308)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103053 (= lt!353308 e!440275)))

(declare-fun c!88076 () Bool)

(declare-fun lt!353307 () SeekEntryResult!8176)

(assert (=> d!103053 (= c!88076 (and ((_ is Intermediate!8176) lt!353307) (undefined!8988 lt!353307)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43012 (_ BitVec 32)) SeekEntryResult!8176)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103053 (= lt!353307 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2044 mask!3266) k0!2044 a!3170 mask!3266))))

(assert (=> d!103053 (validMask!0 mask!3266)))

(assert (=> d!103053 (= (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266) lt!353308)))

(declare-fun e!440274 () SeekEntryResult!8176)

(declare-fun b!792386 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43012 (_ BitVec 32)) SeekEntryResult!8176)

(assert (=> b!792386 (= e!440274 (seekKeyOrZeroReturnVacant!0 (x!66033 lt!353307) (index!35074 lt!353307) (index!35074 lt!353307) k0!2044 a!3170 mask!3266))))

(declare-fun b!792387 () Bool)

(declare-fun c!88075 () Bool)

(declare-fun lt!353306 () (_ BitVec 64))

(assert (=> b!792387 (= c!88075 (= lt!353306 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!440276 () SeekEntryResult!8176)

(assert (=> b!792387 (= e!440276 e!440274)))

(declare-fun b!792388 () Bool)

(assert (=> b!792388 (= e!440276 (Found!8176 (index!35074 lt!353307)))))

(declare-fun b!792389 () Bool)

(assert (=> b!792389 (= e!440274 (MissingZero!8176 (index!35074 lt!353307)))))

(declare-fun b!792390 () Bool)

(assert (=> b!792390 (= e!440275 e!440276)))

(assert (=> b!792390 (= lt!353306 (select (arr!20588 a!3170) (index!35074 lt!353307)))))

(declare-fun c!88077 () Bool)

(assert (=> b!792390 (= c!88077 (= lt!353306 k0!2044))))

(assert (= (and d!103053 c!88076) b!792385))

(assert (= (and d!103053 (not c!88076)) b!792390))

(assert (= (and b!792390 c!88077) b!792388))

(assert (= (and b!792390 (not c!88077)) b!792387))

(assert (= (and b!792387 c!88075) b!792389))

(assert (= (and b!792387 (not c!88075)) b!792386))

(declare-fun m!732437 () Bool)

(assert (=> d!103053 m!732437))

(declare-fun m!732439 () Bool)

(assert (=> d!103053 m!732439))

(assert (=> d!103053 m!732297))

(declare-fun m!732441 () Bool)

(assert (=> d!103053 m!732441))

(declare-fun m!732443 () Bool)

(assert (=> d!103053 m!732443))

(assert (=> d!103053 m!732441))

(declare-fun m!732445 () Bool)

(assert (=> d!103053 m!732445))

(declare-fun m!732447 () Bool)

(assert (=> b!792386 m!732447))

(declare-fun m!732449 () Bool)

(assert (=> b!792390 m!732449))

(assert (=> b!792204 d!103053))

(declare-fun d!103079 () Bool)

(declare-fun lt!353315 () Bool)

(assert (=> d!103079 (= lt!353315 (select (content!380 Nil!14587) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!440284 () Bool)

(assert (=> d!103079 (= lt!353315 e!440284)))

(declare-fun res!537061 () Bool)

(assert (=> d!103079 (=> (not res!537061) (not e!440284))))

(assert (=> d!103079 (= res!537061 ((_ is Cons!14586) Nil!14587))))

(assert (=> d!103079 (= (contains!4096 Nil!14587 #b1000000000000000000000000000000000000000000000000000000000000000) lt!353315)))

(declare-fun b!792399 () Bool)

(declare-fun e!440283 () Bool)

(assert (=> b!792399 (= e!440284 e!440283)))

(declare-fun res!537060 () Bool)

(assert (=> b!792399 (=> res!537060 e!440283)))

(assert (=> b!792399 (= res!537060 (= (h!15715 Nil!14587) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!792400 () Bool)

(assert (=> b!792400 (= e!440283 (contains!4096 (t!20896 Nil!14587) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!103079 res!537061) b!792399))

(assert (= (and b!792399 (not res!537060)) b!792400))

(assert (=> d!103079 m!732353))

(declare-fun m!732451 () Bool)

(assert (=> d!103079 m!732451))

(declare-fun m!732453 () Bool)

(assert (=> b!792400 m!732453))

(assert (=> b!792207 d!103079))

(declare-fun d!103081 () Bool)

(declare-fun res!537070 () Bool)

(declare-fun e!440294 () Bool)

(assert (=> d!103081 (=> res!537070 e!440294)))

(assert (=> d!103081 (= res!537070 ((_ is Nil!14587) Nil!14587))))

(assert (=> d!103081 (= (noDuplicate!1292 Nil!14587) e!440294)))

(declare-fun b!792411 () Bool)

(declare-fun e!440297 () Bool)

(assert (=> b!792411 (= e!440294 e!440297)))

(declare-fun res!537072 () Bool)

(assert (=> b!792411 (=> (not res!537072) (not e!440297))))

(assert (=> b!792411 (= res!537072 (not (contains!4096 (t!20896 Nil!14587) (h!15715 Nil!14587))))))

(declare-fun b!792412 () Bool)

(assert (=> b!792412 (= e!440297 (noDuplicate!1292 (t!20896 Nil!14587)))))

(assert (= (and d!103081 (not res!537070)) b!792411))

(assert (= (and b!792411 res!537072) b!792412))

(declare-fun m!732455 () Bool)

(assert (=> b!792411 m!732455))

(declare-fun m!732457 () Bool)

(assert (=> b!792412 m!732457))

(assert (=> b!792208 d!103081))

(check-sat (not d!103033) (not b!792411) (not b!792386) (not d!103053) (not b!792278) (not b!792412) (not bm!35311) (not d!103079) (not b!792284) (not b!792338) (not b!792400) (not b!792337))
(check-sat)
