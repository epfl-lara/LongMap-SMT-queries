; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25556 () Bool)

(assert start!25556)

(declare-fun b!265437 () Bool)

(declare-fun e!171883 () Bool)

(declare-fun e!171882 () Bool)

(assert (=> b!265437 (= e!171883 e!171882)))

(declare-fun res!129810 () Bool)

(assert (=> b!265437 (=> res!129810 e!171882)))

(declare-datatypes ((List!3860 0))(
  ( (Nil!3857) (Cons!3856 (h!4523 (_ BitVec 64)) (t!8942 List!3860)) )
))
(declare-fun contains!1921 (List!3860 (_ BitVec 64)) Bool)

(assert (=> b!265437 (= res!129810 (contains!1921 Nil!3857 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!265438 () Bool)

(declare-fun res!129807 () Bool)

(declare-fun e!171884 () Bool)

(assert (=> b!265438 (=> (not res!129807) (not e!171884))))

(declare-datatypes ((array!12780 0))(
  ( (array!12781 (arr!6046 (Array (_ BitVec 32) (_ BitVec 64))) (size!6398 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12780)

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12780 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265438 (= res!129807 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265439 () Bool)

(declare-fun res!129809 () Bool)

(assert (=> b!265439 (=> (not res!129809) (not e!171883))))

(assert (=> b!265439 (= res!129809 (and (bvsle #b00000000000000000000000000000000 (size!6398 a!3436)) (bvslt (size!6398 a!3436) #b01111111111111111111111111111111)))))

(declare-fun res!129811 () Bool)

(assert (=> start!25556 (=> (not res!129811) (not e!171884))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25556 (= res!129811 (validMask!0 mask!4002))))

(assert (=> start!25556 e!171884))

(assert (=> start!25556 true))

(declare-fun array_inv!4009 (array!12780) Bool)

(assert (=> start!25556 (array_inv!4009 a!3436)))

(declare-fun b!265440 () Bool)

(declare-fun res!129812 () Bool)

(assert (=> b!265440 (=> (not res!129812) (not e!171884))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265440 (= res!129812 (validKeyInArray!0 k!2698))))

(declare-fun b!265441 () Bool)

(assert (=> b!265441 (= e!171884 e!171883)))

(declare-fun res!129808 () Bool)

(assert (=> b!265441 (=> (not res!129808) (not e!171883))))

(declare-datatypes ((SeekEntryResult!1237 0))(
  ( (MissingZero!1237 (index!7118 (_ BitVec 32))) (Found!1237 (index!7119 (_ BitVec 32))) (Intermediate!1237 (undefined!2049 Bool) (index!7120 (_ BitVec 32)) (x!25434 (_ BitVec 32))) (Undefined!1237) (MissingVacant!1237 (index!7121 (_ BitVec 32))) )
))
(declare-fun lt!134092 () SeekEntryResult!1237)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265441 (= res!129808 (or (= lt!134092 (MissingZero!1237 i!1355)) (= lt!134092 (MissingVacant!1237 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12780 (_ BitVec 32)) SeekEntryResult!1237)

(assert (=> b!265441 (= lt!134092 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!265442 () Bool)

(declare-fun res!129813 () Bool)

(assert (=> b!265442 (=> (not res!129813) (not e!171884))))

(assert (=> b!265442 (= res!129813 (and (= (size!6398 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6398 a!3436))))))

(declare-fun b!265443 () Bool)

(assert (=> b!265443 (= e!171882 (contains!1921 Nil!3857 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!265444 () Bool)

(declare-fun res!129805 () Bool)

(assert (=> b!265444 (=> (not res!129805) (not e!171883))))

(declare-fun noDuplicate!109 (List!3860) Bool)

(assert (=> b!265444 (= res!129805 (noDuplicate!109 Nil!3857))))

(declare-fun b!265445 () Bool)

(declare-fun res!129806 () Bool)

(assert (=> b!265445 (=> (not res!129806) (not e!171883))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12780 (_ BitVec 32)) Bool)

(assert (=> b!265445 (= res!129806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(assert (= (and start!25556 res!129811) b!265442))

(assert (= (and b!265442 res!129813) b!265440))

(assert (= (and b!265440 res!129812) b!265438))

(assert (= (and b!265438 res!129807) b!265441))

(assert (= (and b!265441 res!129808) b!265445))

(assert (= (and b!265445 res!129806) b!265439))

(assert (= (and b!265439 res!129809) b!265444))

(assert (= (and b!265444 res!129805) b!265437))

(assert (= (and b!265437 (not res!129810)) b!265443))

(declare-fun m!282231 () Bool)

(assert (=> b!265437 m!282231))

(declare-fun m!282233 () Bool)

(assert (=> b!265444 m!282233))

(declare-fun m!282235 () Bool)

(assert (=> b!265445 m!282235))

(declare-fun m!282237 () Bool)

(assert (=> b!265441 m!282237))

(declare-fun m!282239 () Bool)

(assert (=> b!265443 m!282239))

(declare-fun m!282241 () Bool)

(assert (=> start!25556 m!282241))

(declare-fun m!282243 () Bool)

(assert (=> start!25556 m!282243))

(declare-fun m!282245 () Bool)

(assert (=> b!265440 m!282245))

(declare-fun m!282247 () Bool)

(assert (=> b!265438 m!282247))

(push 1)

(assert (not b!265437))

(assert (not start!25556))

(assert (not b!265438))

(assert (not b!265440))

(assert (not b!265441))

(assert (not b!265445))

(assert (not b!265443))

(assert (not b!265444))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!64189 () Bool)

(declare-fun res!129824 () Bool)

(declare-fun e!171895 () Bool)

(assert (=> d!64189 (=> res!129824 e!171895)))

(assert (=> d!64189 (= res!129824 (is-Nil!3857 Nil!3857))))

(assert (=> d!64189 (= (noDuplicate!109 Nil!3857) e!171895)))

(declare-fun b!265456 () Bool)

(declare-fun e!171896 () Bool)

(assert (=> b!265456 (= e!171895 e!171896)))

(declare-fun res!129825 () Bool)

(assert (=> b!265456 (=> (not res!129825) (not e!171896))))

(assert (=> b!265456 (= res!129825 (not (contains!1921 (t!8942 Nil!3857) (h!4523 Nil!3857))))))

(declare-fun b!265457 () Bool)

(assert (=> b!265457 (= e!171896 (noDuplicate!109 (t!8942 Nil!3857)))))

(assert (= (and d!64189 (not res!129824)) b!265456))

(assert (= (and b!265456 res!129825) b!265457))

(declare-fun m!282253 () Bool)

(assert (=> b!265456 m!282253))

(declare-fun m!282257 () Bool)

(assert (=> b!265457 m!282257))

(assert (=> b!265444 d!64189))

(declare-fun d!64193 () Bool)

(assert (=> d!64193 (= (validMask!0 mask!4002) (and (or (= mask!4002 #b00000000000000000000000000000111) (= mask!4002 #b00000000000000000000000000001111) (= mask!4002 #b00000000000000000000000000011111) (= mask!4002 #b00000000000000000000000000111111) (= mask!4002 #b00000000000000000000000001111111) (= mask!4002 #b00000000000000000000000011111111) (= mask!4002 #b00000000000000000000000111111111) (= mask!4002 #b00000000000000000000001111111111) (= mask!4002 #b00000000000000000000011111111111) (= mask!4002 #b00000000000000000000111111111111) (= mask!4002 #b00000000000000000001111111111111) (= mask!4002 #b00000000000000000011111111111111) (= mask!4002 #b00000000000000000111111111111111) (= mask!4002 #b00000000000000001111111111111111) (= mask!4002 #b00000000000000011111111111111111) (= mask!4002 #b00000000000000111111111111111111) (= mask!4002 #b00000000000001111111111111111111) (= mask!4002 #b00000000000011111111111111111111) (= mask!4002 #b00000000000111111111111111111111) (= mask!4002 #b00000000001111111111111111111111) (= mask!4002 #b00000000011111111111111111111111) (= mask!4002 #b00000000111111111111111111111111) (= mask!4002 #b00000001111111111111111111111111) (= mask!4002 #b00000011111111111111111111111111) (= mask!4002 #b00000111111111111111111111111111) (= mask!4002 #b00001111111111111111111111111111) (= mask!4002 #b00011111111111111111111111111111) (= mask!4002 #b00111111111111111111111111111111)) (bvsle mask!4002 #b00111111111111111111111111111111)))))

(assert (=> start!25556 d!64193))

(declare-fun d!64201 () Bool)

(assert (=> d!64201 (= (array_inv!4009 a!3436) (bvsge (size!6398 a!3436) #b00000000000000000000000000000000))))

(assert (=> start!25556 d!64201))

(declare-fun d!64203 () Bool)

(assert (=> d!64203 (= (validKeyInArray!0 k!2698) (and (not (= k!2698 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2698 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!265440 d!64203))

(declare-fun b!265490 () Bool)

(declare-fun e!171924 () Bool)

(declare-fun call!25336 () Bool)

(assert (=> b!265490 (= e!171924 call!25336)))

(declare-fun d!64205 () Bool)

(declare-fun res!129849 () Bool)

(declare-fun e!171926 () Bool)

(assert (=> d!64205 (=> res!129849 e!171926)))

(assert (=> d!64205 (= res!129849 (bvsge #b00000000000000000000000000000000 (size!6398 a!3436)))))

(assert (=> d!64205 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002) e!171926)))

(declare-fun b!265491 () Bool)

(assert (=> b!265491 (= e!171926 e!171924)))

(declare-fun c!45372 () Bool)

(assert (=> b!265491 (= c!45372 (validKeyInArray!0 (select (arr!6046 a!3436) #b00000000000000000000000000000000)))))

(declare-fun b!265492 () Bool)

(declare-fun e!171925 () Bool)

(assert (=> b!265492 (= e!171924 e!171925)))

(declare-fun lt!134112 () (_ BitVec 64))

(assert (=> b!265492 (= lt!134112 (select (arr!6046 a!3436) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!8265 0))(
  ( (Unit!8266) )
))
(declare-fun lt!134113 () Unit!8265)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12780 (_ BitVec 64) (_ BitVec 32)) Unit!8265)

(assert (=> b!265492 (= lt!134113 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3436 lt!134112 #b00000000000000000000000000000000))))

(assert (=> b!265492 (arrayContainsKey!0 a!3436 lt!134112 #b00000000000000000000000000000000)))

(declare-fun lt!134111 () Unit!8265)

(assert (=> b!265492 (= lt!134111 lt!134113)))

(declare-fun res!129848 () Bool)

(assert (=> b!265492 (= res!129848 (= (seekEntryOrOpen!0 (select (arr!6046 a!3436) #b00000000000000000000000000000000) a!3436 mask!4002) (Found!1237 #b00000000000000000000000000000000)))))

(assert (=> b!265492 (=> (not res!129848) (not e!171925))))

(declare-fun b!265493 () Bool)

(assert (=> b!265493 (= e!171925 call!25336)))

(declare-fun bm!25333 () Bool)

(assert (=> bm!25333 (= call!25336 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3436 mask!4002))))

(assert (= (and d!64205 (not res!129849)) b!265491))

(assert (= (and b!265491 c!45372) b!265492))

(assert (= (and b!265491 (not c!45372)) b!265490))

(assert (= (and b!265492 res!129848) b!265493))

(assert (= (or b!265493 b!265490) bm!25333))

(declare-fun m!282277 () Bool)

(assert (=> b!265491 m!282277))

(assert (=> b!265491 m!282277))

(declare-fun m!282279 () Bool)

(assert (=> b!265491 m!282279))

(assert (=> b!265492 m!282277))

(declare-fun m!282281 () Bool)

(assert (=> b!265492 m!282281))

(declare-fun m!282283 () Bool)

(assert (=> b!265492 m!282283))

(assert (=> b!265492 m!282277))

(declare-fun m!282285 () Bool)

(assert (=> b!265492 m!282285))

(declare-fun m!282287 () Bool)

(assert (=> bm!25333 m!282287))

(assert (=> b!265445 d!64205))

(declare-fun b!265520 () Bool)

(declare-fun c!45385 () Bool)

(declare-fun lt!134131 () (_ BitVec 64))

(assert (=> b!265520 (= c!45385 (= lt!134131 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!171943 () SeekEntryResult!1237)

(declare-fun e!171942 () SeekEntryResult!1237)

(assert (=> b!265520 (= e!171943 e!171942)))

(declare-fun b!265521 () Bool)

(declare-fun lt!134133 () SeekEntryResult!1237)

(assert (=> b!265521 (= e!171942 (MissingZero!1237 (index!7120 lt!134133)))))

(declare-fun b!265522 () Bool)

(assert (=> b!265522 (= e!171943 (Found!1237 (index!7120 lt!134133)))))

(declare-fun b!265523 () Bool)

(declare-fun e!171941 () SeekEntryResult!1237)

(assert (=> b!265523 (= e!171941 e!171943)))

(assert (=> b!265523 (= lt!134131 (select (arr!6046 a!3436) (index!7120 lt!134133)))))

(declare-fun c!45386 () Bool)

(assert (=> b!265523 (= c!45386 (= lt!134131 k!2698))))

(declare-fun d!64215 () Bool)

(declare-fun lt!134132 () SeekEntryResult!1237)

(assert (=> d!64215 (and (or (is-Undefined!1237 lt!134132) (not (is-Found!1237 lt!134132)) (and (bvsge (index!7119 lt!134132) #b00000000000000000000000000000000) (bvslt (index!7119 lt!134132) (size!6398 a!3436)))) (or (is-Undefined!1237 lt!134132) (is-Found!1237 lt!134132) (not (is-MissingZero!1237 lt!134132)) (and (bvsge (index!7118 lt!134132) #b00000000000000000000000000000000) (bvslt (index!7118 lt!134132) (size!6398 a!3436)))) (or (is-Undefined!1237 lt!134132) (is-Found!1237 lt!134132) (is-MissingZero!1237 lt!134132) (not (is-MissingVacant!1237 lt!134132)) (and (bvsge (index!7121 lt!134132) #b00000000000000000000000000000000) (bvslt (index!7121 lt!134132) (size!6398 a!3436)))) (or (is-Undefined!1237 lt!134132) (ite (is-Found!1237 lt!134132) (= (select (arr!6046 a!3436) (index!7119 lt!134132)) k!2698) (ite (is-MissingZero!1237 lt!134132) (= (select (arr!6046 a!3436) (index!7118 lt!134132)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1237 lt!134132) (= (select (arr!6046 a!3436) (index!7121 lt!134132)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64215 (= lt!134132 e!171941)))

(declare-fun c!45387 () Bool)

(assert (=> d!64215 (= c!45387 (and (is-Intermediate!1237 lt!134133) (undefined!2049 lt!134133)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12780 (_ BitVec 32)) SeekEntryResult!1237)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!64215 (= lt!134133 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2698 mask!4002) k!2698 a!3436 mask!4002))))

(assert (=> d!64215 (validMask!0 mask!4002)))

(assert (=> d!64215 (= (seekEntryOrOpen!0 k!2698 a!3436 mask!4002) lt!134132)))

(declare-fun b!265524 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12780 (_ BitVec 32)) SeekEntryResult!1237)

(assert (=> b!265524 (= e!171942 (seekKeyOrZeroReturnVacant!0 (x!25434 lt!134133) (index!7120 lt!134133) (index!7120 lt!134133) k!2698 a!3436 mask!4002))))

(declare-fun b!265525 () Bool)

(assert (=> b!265525 (= e!171941 Undefined!1237)))

(assert (= (and d!64215 c!45387) b!265525))

(assert (= (and d!64215 (not c!45387)) b!265523))

(assert (= (and b!265523 c!45386) b!265522))

(assert (= (and b!265523 (not c!45386)) b!265520))

(assert (= (and b!265520 c!45385) b!265521))

(assert (= (and b!265520 (not c!45385)) b!265524))

(declare-fun m!282293 () Bool)

(assert (=> b!265523 m!282293))

(declare-fun m!282295 () Bool)

(assert (=> d!64215 m!282295))

(declare-fun m!282297 () Bool)

(assert (=> d!64215 m!282297))

(assert (=> d!64215 m!282295))

(declare-fun m!282299 () Bool)

(assert (=> d!64215 m!282299))

(declare-fun m!282301 () Bool)

(assert (=> d!64215 m!282301))

(declare-fun m!282303 () Bool)

(assert (=> d!64215 m!282303))

(assert (=> d!64215 m!282241))

(declare-fun m!282305 () Bool)

(assert (=> b!265524 m!282305))

(assert (=> b!265441 d!64215))

(declare-fun d!64223 () Bool)

(declare-fun res!129856 () Bool)

(declare-fun e!171954 () Bool)

(assert (=> d!64223 (=> res!129856 e!171954)))

(assert (=> d!64223 (= res!129856 (= (select (arr!6046 a!3436) #b00000000000000000000000000000000) k!2698))))

(assert (=> d!64223 (= (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000) e!171954)))

(declare-fun b!265542 () Bool)

(declare-fun e!171955 () Bool)

(assert (=> b!265542 (= e!171954 e!171955)))

(declare-fun res!129857 () Bool)

(assert (=> b!265542 (=> (not res!129857) (not e!171955))))

(assert (=> b!265542 (= res!129857 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6398 a!3436)))))

(declare-fun b!265543 () Bool)

(assert (=> b!265543 (= e!171955 (arrayContainsKey!0 a!3436 k!2698 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!64223 (not res!129856)) b!265542))

(assert (= (and b!265542 res!129857) b!265543))

(assert (=> d!64223 m!282277))

(declare-fun m!282307 () Bool)

(assert (=> b!265543 m!282307))

(assert (=> b!265438 d!64223))

(declare-fun d!64225 () Bool)

(declare-fun lt!134144 () Bool)

(declare-fun content!179 (List!3860) (Set (_ BitVec 64)))

(assert (=> d!64225 (= lt!134144 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!179 Nil!3857)))))

(declare-fun e!171967 () Bool)

(assert (=> d!64225 (= lt!134144 e!171967)))

(declare-fun res!129863 () Bool)

(assert (=> d!64225 (=> (not res!129863) (not e!171967))))

(assert (=> d!64225 (= res!129863 (is-Cons!3856 Nil!3857))))

(assert (=> d!64225 (= (contains!1921 Nil!3857 #b1000000000000000000000000000000000000000000000000000000000000000) lt!134144)))

(declare-fun b!265560 () Bool)

(declare-fun e!171966 () Bool)

(assert (=> b!265560 (= e!171967 e!171966)))

(declare-fun res!129862 () Bool)

(assert (=> b!265560 (=> res!129862 e!171966)))

(assert (=> b!265560 (= res!129862 (= (h!4523 Nil!3857) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!265561 () Bool)

(assert (=> b!265561 (= e!171966 (contains!1921 (t!8942 Nil!3857) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!64225 res!129863) b!265560))

(assert (= (and b!265560 (not res!129862)) b!265561))

(declare-fun m!282337 () Bool)

(assert (=> d!64225 m!282337))

(declare-fun m!282339 () Bool)

(assert (=> d!64225 m!282339))

(declare-fun m!282341 () Bool)

(assert (=> b!265561 m!282341))

(assert (=> b!265443 d!64225))

(declare-fun d!64229 () Bool)

(declare-fun lt!134145 () Bool)

(assert (=> d!64229 (= lt!134145 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!179 Nil!3857)))))

(declare-fun e!171969 () Bool)

(assert (=> d!64229 (= lt!134145 e!171969)))

(declare-fun res!129865 () Bool)

(assert (=> d!64229 (=> (not res!129865) (not e!171969))))

(assert (=> d!64229 (= res!129865 (is-Cons!3856 Nil!3857))))

(assert (=> d!64229 (= (contains!1921 Nil!3857 #b0000000000000000000000000000000000000000000000000000000000000000) lt!134145)))

(declare-fun b!265562 () Bool)

(declare-fun e!171968 () Bool)

(assert (=> b!265562 (= e!171969 e!171968)))

(declare-fun res!129864 () Bool)

(assert (=> b!265562 (=> res!129864 e!171968)))

(assert (=> b!265562 (= res!129864 (= (h!4523 Nil!3857) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!265563 () Bool)

(assert (=> b!265563 (= e!171968 (contains!1921 (t!8942 Nil!3857) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!64229 res!129865) b!265562))

(assert (= (and b!265562 (not res!129864)) b!265563))

(assert (=> d!64229 m!282337))

(declare-fun m!282343 () Bool)

(assert (=> d!64229 m!282343))

(declare-fun m!282345 () Bool)

(assert (=> b!265563 m!282345))

(assert (=> b!265437 d!64229))

