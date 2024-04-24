; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93600 () Bool)

(assert start!93600)

(declare-fun b!1059208 () Bool)

(declare-fun e!602586 () Bool)

(declare-fun e!602585 () Bool)

(assert (=> b!1059208 (= e!602586 (not e!602585))))

(declare-fun res!707022 () Bool)

(assert (=> b!1059208 (=> res!707022 e!602585)))

(declare-fun lt!467159 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1059208 (= res!707022 (or (bvsgt lt!467159 i!1381) (bvsle i!1381 lt!467159)))))

(declare-fun e!602579 () Bool)

(assert (=> b!1059208 e!602579))

(declare-fun res!707023 () Bool)

(assert (=> b!1059208 (=> (not res!707023) (not e!602579))))

(declare-datatypes ((array!66769 0))(
  ( (array!66770 (arr!32098 (Array (_ BitVec 32) (_ BitVec 64))) (size!32635 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66769)

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1059208 (= res!707023 (= (select (store (arr!32098 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!467159) k0!2747))))

(declare-fun b!1059209 () Bool)

(declare-fun e!602582 () Bool)

(assert (=> b!1059209 (= e!602585 e!602582)))

(declare-fun res!707029 () Bool)

(assert (=> b!1059209 (=> res!707029 e!602582)))

(declare-fun lt!467158 () (_ BitVec 32))

(assert (=> b!1059209 (= res!707029 (or (bvslt lt!467159 #b00000000000000000000000000000000) (bvsge lt!467158 (size!32635 a!3488)) (bvsge lt!467159 (size!32635 a!3488))))))

(declare-fun arrayContainsKey!0 (array!66769 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1059209 (arrayContainsKey!0 a!3488 k0!2747 lt!467158)))

(declare-datatypes ((Unit!34687 0))(
  ( (Unit!34688) )
))
(declare-fun lt!467162 () Unit!34687)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66769 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34687)

(assert (=> b!1059209 (= lt!467162 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!467158))))

(assert (=> b!1059209 (= lt!467158 (bvadd #b00000000000000000000000000000001 lt!467159))))

(declare-datatypes ((List!22380 0))(
  ( (Nil!22377) (Cons!22376 (h!23594 (_ BitVec 64)) (t!31679 List!22380)) )
))
(declare-fun arrayNoDuplicates!0 (array!66769 (_ BitVec 32) List!22380) Bool)

(assert (=> b!1059209 (arrayNoDuplicates!0 a!3488 lt!467159 Nil!22377)))

(declare-fun lt!467160 () Unit!34687)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66769 (_ BitVec 32) (_ BitVec 32)) Unit!34687)

(assert (=> b!1059209 (= lt!467160 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!467159))))

(declare-fun e!602583 () Bool)

(declare-fun b!1059210 () Bool)

(assert (=> b!1059210 (= e!602583 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1059211 () Bool)

(assert (=> b!1059211 (= e!602579 e!602583)))

(declare-fun res!707025 () Bool)

(assert (=> b!1059211 (=> res!707025 e!602583)))

(assert (=> b!1059211 (= res!707025 (or (bvsgt lt!467159 i!1381) (bvsle i!1381 lt!467159)))))

(declare-fun b!1059212 () Bool)

(declare-fun res!707024 () Bool)

(declare-fun e!602587 () Bool)

(assert (=> b!1059212 (=> (not res!707024) (not e!602587))))

(assert (=> b!1059212 (= res!707024 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22377))))

(declare-fun res!707027 () Bool)

(assert (=> start!93600 (=> (not res!707027) (not e!602587))))

(assert (=> start!93600 (= res!707027 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32635 a!3488)) (bvslt (size!32635 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93600 e!602587))

(assert (=> start!93600 true))

(declare-fun array_inv!24880 (array!66769) Bool)

(assert (=> start!93600 (array_inv!24880 a!3488)))

(declare-fun b!1059213 () Bool)

(declare-fun res!707030 () Bool)

(assert (=> b!1059213 (=> res!707030 e!602582)))

(declare-fun noDuplicate!1576 (List!22380) Bool)

(assert (=> b!1059213 (= res!707030 (not (noDuplicate!1576 Nil!22377)))))

(declare-fun b!1059214 () Bool)

(declare-fun e!602581 () Bool)

(assert (=> b!1059214 (= e!602581 e!602586)))

(declare-fun res!707019 () Bool)

(assert (=> b!1059214 (=> (not res!707019) (not e!602586))))

(assert (=> b!1059214 (= res!707019 (not (= lt!467159 i!1381)))))

(declare-fun lt!467161 () array!66769)

(declare-fun arrayScanForKey!0 (array!66769 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1059214 (= lt!467159 (arrayScanForKey!0 lt!467161 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1059215 () Bool)

(declare-fun e!602584 () Bool)

(declare-fun contains!6227 (List!22380 (_ BitVec 64)) Bool)

(assert (=> b!1059215 (= e!602584 (not (contains!6227 Nil!22377 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1059216 () Bool)

(assert (=> b!1059216 (= e!602587 e!602581)))

(declare-fun res!707020 () Bool)

(assert (=> b!1059216 (=> (not res!707020) (not e!602581))))

(assert (=> b!1059216 (= res!707020 (arrayContainsKey!0 lt!467161 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1059216 (= lt!467161 (array!66770 (store (arr!32098 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32635 a!3488)))))

(declare-fun b!1059217 () Bool)

(declare-fun res!707028 () Bool)

(assert (=> b!1059217 (=> (not res!707028) (not e!602587))))

(assert (=> b!1059217 (= res!707028 (= (select (arr!32098 a!3488) i!1381) k0!2747))))

(declare-fun b!1059218 () Bool)

(declare-fun res!707021 () Bool)

(assert (=> b!1059218 (=> (not res!707021) (not e!602587))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1059218 (= res!707021 (validKeyInArray!0 k0!2747))))

(declare-fun b!1059219 () Bool)

(assert (=> b!1059219 (= e!602582 e!602584)))

(declare-fun res!707026 () Bool)

(assert (=> b!1059219 (=> (not res!707026) (not e!602584))))

(assert (=> b!1059219 (= res!707026 (not (contains!6227 Nil!22377 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!93600 res!707027) b!1059212))

(assert (= (and b!1059212 res!707024) b!1059218))

(assert (= (and b!1059218 res!707021) b!1059217))

(assert (= (and b!1059217 res!707028) b!1059216))

(assert (= (and b!1059216 res!707020) b!1059214))

(assert (= (and b!1059214 res!707019) b!1059208))

(assert (= (and b!1059208 res!707023) b!1059211))

(assert (= (and b!1059211 (not res!707025)) b!1059210))

(assert (= (and b!1059208 (not res!707022)) b!1059209))

(assert (= (and b!1059209 (not res!707029)) b!1059213))

(assert (= (and b!1059213 (not res!707030)) b!1059219))

(assert (= (and b!1059219 res!707026) b!1059215))

(declare-fun m!979223 () Bool)

(assert (=> b!1059210 m!979223))

(declare-fun m!979225 () Bool)

(assert (=> b!1059214 m!979225))

(declare-fun m!979227 () Bool)

(assert (=> b!1059219 m!979227))

(declare-fun m!979229 () Bool)

(assert (=> b!1059209 m!979229))

(declare-fun m!979231 () Bool)

(assert (=> b!1059209 m!979231))

(declare-fun m!979233 () Bool)

(assert (=> b!1059209 m!979233))

(declare-fun m!979235 () Bool)

(assert (=> b!1059209 m!979235))

(declare-fun m!979237 () Bool)

(assert (=> b!1059217 m!979237))

(declare-fun m!979239 () Bool)

(assert (=> b!1059208 m!979239))

(declare-fun m!979241 () Bool)

(assert (=> b!1059208 m!979241))

(declare-fun m!979243 () Bool)

(assert (=> start!93600 m!979243))

(declare-fun m!979245 () Bool)

(assert (=> b!1059216 m!979245))

(assert (=> b!1059216 m!979239))

(declare-fun m!979247 () Bool)

(assert (=> b!1059212 m!979247))

(declare-fun m!979249 () Bool)

(assert (=> b!1059215 m!979249))

(declare-fun m!979251 () Bool)

(assert (=> b!1059213 m!979251))

(declare-fun m!979253 () Bool)

(assert (=> b!1059218 m!979253))

(check-sat (not b!1059212) (not b!1059210) (not b!1059219) (not b!1059218) (not b!1059214) (not b!1059215) (not start!93600) (not b!1059213) (not b!1059209) (not b!1059216))
(check-sat)
(get-model)

(declare-fun d!128983 () Bool)

(declare-fun res!707107 () Bool)

(declare-fun e!602646 () Bool)

(assert (=> d!128983 (=> res!707107 e!602646)))

(assert (=> d!128983 (= res!707107 (= (select (arr!32098 a!3488) lt!467158) k0!2747))))

(assert (=> d!128983 (= (arrayContainsKey!0 a!3488 k0!2747 lt!467158) e!602646)))

(declare-fun b!1059296 () Bool)

(declare-fun e!602647 () Bool)

(assert (=> b!1059296 (= e!602646 e!602647)))

(declare-fun res!707108 () Bool)

(assert (=> b!1059296 (=> (not res!707108) (not e!602647))))

(assert (=> b!1059296 (= res!707108 (bvslt (bvadd lt!467158 #b00000000000000000000000000000001) (size!32635 a!3488)))))

(declare-fun b!1059297 () Bool)

(assert (=> b!1059297 (= e!602647 (arrayContainsKey!0 a!3488 k0!2747 (bvadd lt!467158 #b00000000000000000000000000000001)))))

(assert (= (and d!128983 (not res!707107)) b!1059296))

(assert (= (and b!1059296 res!707108) b!1059297))

(declare-fun m!979319 () Bool)

(assert (=> d!128983 m!979319))

(declare-fun m!979321 () Bool)

(assert (=> b!1059297 m!979321))

(assert (=> b!1059209 d!128983))

(declare-fun d!128985 () Bool)

(assert (=> d!128985 (arrayContainsKey!0 a!3488 k0!2747 lt!467158)))

(declare-fun lt!467195 () Unit!34687)

(declare-fun choose!114 (array!66769 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34687)

(assert (=> d!128985 (= lt!467195 (choose!114 a!3488 k0!2747 i!1381 lt!467158))))

(assert (=> d!128985 (bvsge i!1381 #b00000000000000000000000000000000)))

(assert (=> d!128985 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!467158) lt!467195)))

(declare-fun bs!31047 () Bool)

(assert (= bs!31047 d!128985))

(assert (=> bs!31047 m!979229))

(declare-fun m!979323 () Bool)

(assert (=> bs!31047 m!979323))

(assert (=> b!1059209 d!128985))

(declare-fun b!1059308 () Bool)

(declare-fun e!602656 () Bool)

(declare-fun e!602659 () Bool)

(assert (=> b!1059308 (= e!602656 e!602659)))

(declare-fun res!707115 () Bool)

(assert (=> b!1059308 (=> (not res!707115) (not e!602659))))

(declare-fun e!602658 () Bool)

(assert (=> b!1059308 (= res!707115 (not e!602658))))

(declare-fun res!707116 () Bool)

(assert (=> b!1059308 (=> (not res!707116) (not e!602658))))

(assert (=> b!1059308 (= res!707116 (validKeyInArray!0 (select (arr!32098 a!3488) lt!467159)))))

(declare-fun b!1059309 () Bool)

(declare-fun e!602657 () Bool)

(declare-fun call!44930 () Bool)

(assert (=> b!1059309 (= e!602657 call!44930)))

(declare-fun b!1059310 () Bool)

(assert (=> b!1059310 (= e!602658 (contains!6227 Nil!22377 (select (arr!32098 a!3488) lt!467159)))))

(declare-fun b!1059311 () Bool)

(assert (=> b!1059311 (= e!602657 call!44930)))

(declare-fun b!1059312 () Bool)

(assert (=> b!1059312 (= e!602659 e!602657)))

(declare-fun c!107564 () Bool)

(assert (=> b!1059312 (= c!107564 (validKeyInArray!0 (select (arr!32098 a!3488) lt!467159)))))

(declare-fun bm!44927 () Bool)

(assert (=> bm!44927 (= call!44930 (arrayNoDuplicates!0 a!3488 (bvadd lt!467159 #b00000000000000000000000000000001) (ite c!107564 (Cons!22376 (select (arr!32098 a!3488) lt!467159) Nil!22377) Nil!22377)))))

(declare-fun d!128987 () Bool)

(declare-fun res!707117 () Bool)

(assert (=> d!128987 (=> res!707117 e!602656)))

(assert (=> d!128987 (= res!707117 (bvsge lt!467159 (size!32635 a!3488)))))

(assert (=> d!128987 (= (arrayNoDuplicates!0 a!3488 lt!467159 Nil!22377) e!602656)))

(assert (= (and d!128987 (not res!707117)) b!1059308))

(assert (= (and b!1059308 res!707116) b!1059310))

(assert (= (and b!1059308 res!707115) b!1059312))

(assert (= (and b!1059312 c!107564) b!1059311))

(assert (= (and b!1059312 (not c!107564)) b!1059309))

(assert (= (or b!1059311 b!1059309) bm!44927))

(declare-fun m!979325 () Bool)

(assert (=> b!1059308 m!979325))

(assert (=> b!1059308 m!979325))

(declare-fun m!979327 () Bool)

(assert (=> b!1059308 m!979327))

(assert (=> b!1059310 m!979325))

(assert (=> b!1059310 m!979325))

(declare-fun m!979329 () Bool)

(assert (=> b!1059310 m!979329))

(assert (=> b!1059312 m!979325))

(assert (=> b!1059312 m!979325))

(assert (=> b!1059312 m!979327))

(assert (=> bm!44927 m!979325))

(declare-fun m!979331 () Bool)

(assert (=> bm!44927 m!979331))

(assert (=> b!1059209 d!128987))

(declare-fun d!128989 () Bool)

(assert (=> d!128989 (arrayNoDuplicates!0 a!3488 lt!467159 Nil!22377)))

(declare-fun lt!467198 () Unit!34687)

(declare-fun choose!39 (array!66769 (_ BitVec 32) (_ BitVec 32)) Unit!34687)

(assert (=> d!128989 (= lt!467198 (choose!39 a!3488 #b00000000000000000000000000000000 lt!467159))))

(assert (=> d!128989 (bvslt (size!32635 a!3488) #b01111111111111111111111111111111)))

(assert (=> d!128989 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!467159) lt!467198)))

(declare-fun bs!31048 () Bool)

(assert (= bs!31048 d!128989))

(assert (=> bs!31048 m!979233))

(declare-fun m!979333 () Bool)

(assert (=> bs!31048 m!979333))

(assert (=> b!1059209 d!128989))

(declare-fun d!128993 () Bool)

(declare-fun lt!467204 () (_ BitVec 32))

(assert (=> d!128993 (and (or (bvslt lt!467204 #b00000000000000000000000000000000) (bvsge lt!467204 (size!32635 lt!467161)) (and (bvsge lt!467204 #b00000000000000000000000000000000) (bvslt lt!467204 (size!32635 lt!467161)))) (bvsge lt!467204 #b00000000000000000000000000000000) (bvslt lt!467204 (size!32635 lt!467161)) (= (select (arr!32098 lt!467161) lt!467204) k0!2747))))

(declare-fun e!602668 () (_ BitVec 32))

(assert (=> d!128993 (= lt!467204 e!602668)))

(declare-fun c!107567 () Bool)

(assert (=> d!128993 (= c!107567 (= (select (arr!32098 lt!467161) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128993 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32635 lt!467161)) (bvslt (size!32635 lt!467161) #b01111111111111111111111111111111))))

(assert (=> d!128993 (= (arrayScanForKey!0 lt!467161 k0!2747 #b00000000000000000000000000000000) lt!467204)))

(declare-fun b!1059323 () Bool)

(assert (=> b!1059323 (= e!602668 #b00000000000000000000000000000000)))

(declare-fun b!1059324 () Bool)

(assert (=> b!1059324 (= e!602668 (arrayScanForKey!0 lt!467161 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128993 c!107567) b!1059323))

(assert (= (and d!128993 (not c!107567)) b!1059324))

(declare-fun m!979341 () Bool)

(assert (=> d!128993 m!979341))

(declare-fun m!979343 () Bool)

(assert (=> d!128993 m!979343))

(declare-fun m!979345 () Bool)

(assert (=> b!1059324 m!979345))

(assert (=> b!1059214 d!128993))

(declare-fun d!128999 () Bool)

(declare-fun lt!467207 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!535 (List!22380) (InoxSet (_ BitVec 64)))

(assert (=> d!128999 (= lt!467207 (select (content!535 Nil!22377) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!602685 () Bool)

(assert (=> d!128999 (= lt!467207 e!602685)))

(declare-fun res!707138 () Bool)

(assert (=> d!128999 (=> (not res!707138) (not e!602685))))

(get-info :version)

(assert (=> d!128999 (= res!707138 ((_ is Cons!22376) Nil!22377))))

(assert (=> d!128999 (= (contains!6227 Nil!22377 #b1000000000000000000000000000000000000000000000000000000000000000) lt!467207)))

(declare-fun b!1059343 () Bool)

(declare-fun e!602686 () Bool)

(assert (=> b!1059343 (= e!602685 e!602686)))

(declare-fun res!707139 () Bool)

(assert (=> b!1059343 (=> res!707139 e!602686)))

(assert (=> b!1059343 (= res!707139 (= (h!23594 Nil!22377) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1059344 () Bool)

(assert (=> b!1059344 (= e!602686 (contains!6227 (t!31679 Nil!22377) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!128999 res!707138) b!1059343))

(assert (= (and b!1059343 (not res!707139)) b!1059344))

(declare-fun m!979347 () Bool)

(assert (=> d!128999 m!979347))

(declare-fun m!979349 () Bool)

(assert (=> d!128999 m!979349))

(declare-fun m!979351 () Bool)

(assert (=> b!1059344 m!979351))

(assert (=> b!1059215 d!128999))

(declare-fun d!129003 () Bool)

(declare-fun res!707149 () Bool)

(declare-fun e!602697 () Bool)

(assert (=> d!129003 (=> res!707149 e!602697)))

(assert (=> d!129003 (= res!707149 ((_ is Nil!22377) Nil!22377))))

(assert (=> d!129003 (= (noDuplicate!1576 Nil!22377) e!602697)))

(declare-fun b!1059356 () Bool)

(declare-fun e!602698 () Bool)

(assert (=> b!1059356 (= e!602697 e!602698)))

(declare-fun res!707150 () Bool)

(assert (=> b!1059356 (=> (not res!707150) (not e!602698))))

(assert (=> b!1059356 (= res!707150 (not (contains!6227 (t!31679 Nil!22377) (h!23594 Nil!22377))))))

(declare-fun b!1059357 () Bool)

(assert (=> b!1059357 (= e!602698 (noDuplicate!1576 (t!31679 Nil!22377)))))

(assert (= (and d!129003 (not res!707149)) b!1059356))

(assert (= (and b!1059356 res!707150) b!1059357))

(declare-fun m!979365 () Bool)

(assert (=> b!1059356 m!979365))

(declare-fun m!979367 () Bool)

(assert (=> b!1059357 m!979367))

(assert (=> b!1059213 d!129003))

(declare-fun d!129009 () Bool)

(assert (=> d!129009 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1059218 d!129009))

(declare-fun d!129011 () Bool)

(declare-fun lt!467210 () Bool)

(assert (=> d!129011 (= lt!467210 (select (content!535 Nil!22377) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!602701 () Bool)

(assert (=> d!129011 (= lt!467210 e!602701)))

(declare-fun res!707153 () Bool)

(assert (=> d!129011 (=> (not res!707153) (not e!602701))))

(assert (=> d!129011 (= res!707153 ((_ is Cons!22376) Nil!22377))))

(assert (=> d!129011 (= (contains!6227 Nil!22377 #b0000000000000000000000000000000000000000000000000000000000000000) lt!467210)))

(declare-fun b!1059360 () Bool)

(declare-fun e!602702 () Bool)

(assert (=> b!1059360 (= e!602701 e!602702)))

(declare-fun res!707154 () Bool)

(assert (=> b!1059360 (=> res!707154 e!602702)))

(assert (=> b!1059360 (= res!707154 (= (h!23594 Nil!22377) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1059361 () Bool)

(assert (=> b!1059361 (= e!602702 (contains!6227 (t!31679 Nil!22377) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!129011 res!707153) b!1059360))

(assert (= (and b!1059360 (not res!707154)) b!1059361))

(assert (=> d!129011 m!979347))

(declare-fun m!979369 () Bool)

(assert (=> d!129011 m!979369))

(declare-fun m!979371 () Bool)

(assert (=> b!1059361 m!979371))

(assert (=> b!1059219 d!129011))

(declare-fun d!129013 () Bool)

(assert (=> d!129013 (= (array_inv!24880 a!3488) (bvsge (size!32635 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!93600 d!129013))

(declare-fun b!1059372 () Bool)

(declare-fun e!602711 () Bool)

(declare-fun e!602714 () Bool)

(assert (=> b!1059372 (= e!602711 e!602714)))

(declare-fun res!707161 () Bool)

(assert (=> b!1059372 (=> (not res!707161) (not e!602714))))

(declare-fun e!602713 () Bool)

(assert (=> b!1059372 (= res!707161 (not e!602713))))

(declare-fun res!707162 () Bool)

(assert (=> b!1059372 (=> (not res!707162) (not e!602713))))

(assert (=> b!1059372 (= res!707162 (validKeyInArray!0 (select (arr!32098 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1059373 () Bool)

(declare-fun e!602712 () Bool)

(declare-fun call!44936 () Bool)

(assert (=> b!1059373 (= e!602712 call!44936)))

(declare-fun b!1059374 () Bool)

(assert (=> b!1059374 (= e!602713 (contains!6227 Nil!22377 (select (arr!32098 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1059375 () Bool)

(assert (=> b!1059375 (= e!602712 call!44936)))

(declare-fun b!1059376 () Bool)

(assert (=> b!1059376 (= e!602714 e!602712)))

(declare-fun c!107573 () Bool)

(assert (=> b!1059376 (= c!107573 (validKeyInArray!0 (select (arr!32098 a!3488) #b00000000000000000000000000000000)))))

(declare-fun bm!44933 () Bool)

(assert (=> bm!44933 (= call!44936 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107573 (Cons!22376 (select (arr!32098 a!3488) #b00000000000000000000000000000000) Nil!22377) Nil!22377)))))

(declare-fun d!129019 () Bool)

(declare-fun res!707163 () Bool)

(assert (=> d!129019 (=> res!707163 e!602711)))

(assert (=> d!129019 (= res!707163 (bvsge #b00000000000000000000000000000000 (size!32635 a!3488)))))

(assert (=> d!129019 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22377) e!602711)))

(assert (= (and d!129019 (not res!707163)) b!1059372))

(assert (= (and b!1059372 res!707162) b!1059374))

(assert (= (and b!1059372 res!707161) b!1059376))

(assert (= (and b!1059376 c!107573) b!1059375))

(assert (= (and b!1059376 (not c!107573)) b!1059373))

(assert (= (or b!1059375 b!1059373) bm!44933))

(declare-fun m!979377 () Bool)

(assert (=> b!1059372 m!979377))

(assert (=> b!1059372 m!979377))

(declare-fun m!979379 () Bool)

(assert (=> b!1059372 m!979379))

(assert (=> b!1059374 m!979377))

(assert (=> b!1059374 m!979377))

(declare-fun m!979381 () Bool)

(assert (=> b!1059374 m!979381))

(assert (=> b!1059376 m!979377))

(assert (=> b!1059376 m!979377))

(assert (=> b!1059376 m!979379))

(assert (=> bm!44933 m!979377))

(declare-fun m!979383 () Bool)

(assert (=> bm!44933 m!979383))

(assert (=> b!1059212 d!129019))

(declare-fun d!129023 () Bool)

(declare-fun res!707167 () Bool)

(declare-fun e!602719 () Bool)

(assert (=> d!129023 (=> res!707167 e!602719)))

(assert (=> d!129023 (= res!707167 (= (select (arr!32098 a!3488) i!1381) k0!2747))))

(assert (=> d!129023 (= (arrayContainsKey!0 a!3488 k0!2747 i!1381) e!602719)))

(declare-fun b!1059382 () Bool)

(declare-fun e!602720 () Bool)

(assert (=> b!1059382 (= e!602719 e!602720)))

(declare-fun res!707168 () Bool)

(assert (=> b!1059382 (=> (not res!707168) (not e!602720))))

(assert (=> b!1059382 (= res!707168 (bvslt (bvadd i!1381 #b00000000000000000000000000000001) (size!32635 a!3488)))))

(declare-fun b!1059383 () Bool)

(assert (=> b!1059383 (= e!602720 (arrayContainsKey!0 a!3488 k0!2747 (bvadd i!1381 #b00000000000000000000000000000001)))))

(assert (= (and d!129023 (not res!707167)) b!1059382))

(assert (= (and b!1059382 res!707168) b!1059383))

(assert (=> d!129023 m!979237))

(declare-fun m!979385 () Bool)

(assert (=> b!1059383 m!979385))

(assert (=> b!1059210 d!129023))

(declare-fun d!129025 () Bool)

(declare-fun res!707169 () Bool)

(declare-fun e!602721 () Bool)

(assert (=> d!129025 (=> res!707169 e!602721)))

(assert (=> d!129025 (= res!707169 (= (select (arr!32098 lt!467161) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!129025 (= (arrayContainsKey!0 lt!467161 k0!2747 #b00000000000000000000000000000000) e!602721)))

(declare-fun b!1059384 () Bool)

(declare-fun e!602722 () Bool)

(assert (=> b!1059384 (= e!602721 e!602722)))

(declare-fun res!707170 () Bool)

(assert (=> b!1059384 (=> (not res!707170) (not e!602722))))

(assert (=> b!1059384 (= res!707170 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32635 lt!467161)))))

(declare-fun b!1059385 () Bool)

(assert (=> b!1059385 (= e!602722 (arrayContainsKey!0 lt!467161 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!129025 (not res!707169)) b!1059384))

(assert (= (and b!1059384 res!707170) b!1059385))

(assert (=> d!129025 m!979343))

(declare-fun m!979395 () Bool)

(assert (=> b!1059385 m!979395))

(assert (=> b!1059216 d!129025))

(check-sat (not d!129011) (not b!1059376) (not b!1059374) (not b!1059357) (not b!1059297) (not d!128999) (not b!1059372) (not b!1059310) (not b!1059324) (not b!1059308) (not d!128985) (not b!1059344) (not bm!44927) (not b!1059383) (not b!1059361) (not b!1059356) (not b!1059385) (not b!1059312) (not d!128989) (not bm!44933))
(check-sat)
