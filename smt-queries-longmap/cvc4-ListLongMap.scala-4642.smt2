; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64556 () Bool)

(assert start!64556)

(declare-fun b!727297 () Bool)

(declare-fun e!407150 () Bool)

(declare-fun e!407155 () Bool)

(assert (=> b!727297 (= e!407150 e!407155)))

(declare-fun res!488191 () Bool)

(assert (=> b!727297 (=> (not res!488191) (not e!407155))))

(declare-datatypes ((SeekEntryResult!7258 0))(
  ( (MissingZero!7258 (index!31400 (_ BitVec 32))) (Found!7258 (index!31401 (_ BitVec 32))) (Intermediate!7258 (undefined!8070 Bool) (index!31402 (_ BitVec 32)) (x!62380 (_ BitVec 32))) (Undefined!7258) (MissingVacant!7258 (index!31403 (_ BitVec 32))) )
))
(declare-fun lt!322126 () SeekEntryResult!7258)

(declare-fun lt!322133 () SeekEntryResult!7258)

(assert (=> b!727297 (= res!488191 (= lt!322126 lt!322133))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!322127 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((array!41074 0))(
  ( (array!41075 (arr!19658 (Array (_ BitVec 32) (_ BitVec 64))) (size!20079 (_ BitVec 32))) )
))
(declare-fun lt!322125 () array!41074)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41074 (_ BitVec 32)) SeekEntryResult!7258)

(assert (=> b!727297 (= lt!322133 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322127 lt!322125 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!727297 (= lt!322126 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322127 mask!3328) lt!322127 lt!322125 mask!3328))))

(declare-fun a!3186 () array!41074)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!727297 (= lt!322127 (select (store (arr!19658 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!727297 (= lt!322125 (array!41075 (store (arr!19658 a!3186) i!1173 k!2102) (size!20079 a!3186)))))

(declare-fun b!727298 () Bool)

(declare-fun e!407153 () Bool)

(declare-fun e!407149 () Bool)

(assert (=> b!727298 (= e!407153 e!407149)))

(declare-fun res!488192 () Bool)

(assert (=> b!727298 (=> (not res!488192) (not e!407149))))

(declare-fun lt!322129 () SeekEntryResult!7258)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41074 (_ BitVec 32)) SeekEntryResult!7258)

(assert (=> b!727298 (= res!488192 (= (seekEntryOrOpen!0 (select (arr!19658 a!3186) j!159) a!3186 mask!3328) lt!322129))))

(assert (=> b!727298 (= lt!322129 (Found!7258 j!159))))

(declare-fun b!727299 () Bool)

(declare-fun res!488198 () Bool)

(declare-fun e!407148 () Bool)

(assert (=> b!727299 (=> (not res!488198) (not e!407148))))

(assert (=> b!727299 (= res!488198 (and (= (size!20079 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20079 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20079 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!727300 () Bool)

(declare-fun res!488187 () Bool)

(assert (=> b!727300 (=> (not res!488187) (not e!407150))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!727300 (= res!488187 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19658 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!727301 () Bool)

(declare-fun res!488183 () Bool)

(assert (=> b!727301 (=> (not res!488183) (not e!407148))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!727301 (= res!488183 (validKeyInArray!0 k!2102))))

(declare-fun b!727302 () Bool)

(declare-fun res!488195 () Bool)

(assert (=> b!727302 (=> (not res!488195) (not e!407148))))

(declare-fun arrayContainsKey!0 (array!41074 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!727302 (= res!488195 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!727303 () Bool)

(declare-fun e!407154 () Bool)

(assert (=> b!727303 (= e!407154 e!407150)))

(declare-fun res!488184 () Bool)

(assert (=> b!727303 (=> (not res!488184) (not e!407150))))

(declare-fun lt!322131 () SeekEntryResult!7258)

(assert (=> b!727303 (= res!488184 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19658 a!3186) j!159) mask!3328) (select (arr!19658 a!3186) j!159) a!3186 mask!3328) lt!322131))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!727303 (= lt!322131 (Intermediate!7258 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!727304 () Bool)

(declare-fun res!488190 () Bool)

(assert (=> b!727304 (=> (not res!488190) (not e!407150))))

(declare-fun e!407156 () Bool)

(assert (=> b!727304 (= res!488190 e!407156)))

(declare-fun c!79930 () Bool)

(assert (=> b!727304 (= c!79930 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!727306 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41074 (_ BitVec 32)) SeekEntryResult!7258)

(assert (=> b!727306 (= e!407156 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19658 a!3186) j!159) a!3186 mask!3328) (Found!7258 j!159)))))

(declare-fun b!727307 () Bool)

(assert (=> b!727307 (= e!407149 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19658 a!3186) j!159) a!3186 mask!3328) lt!322129))))

(declare-fun b!727308 () Bool)

(declare-fun res!488186 () Bool)

(assert (=> b!727308 (=> (not res!488186) (not e!407154))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41074 (_ BitVec 32)) Bool)

(assert (=> b!727308 (= res!488186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!727309 () Bool)

(declare-fun res!488188 () Bool)

(assert (=> b!727309 (=> (not res!488188) (not e!407154))))

(declare-datatypes ((List!13660 0))(
  ( (Nil!13657) (Cons!13656 (h!14713 (_ BitVec 64)) (t!19975 List!13660)) )
))
(declare-fun arrayNoDuplicates!0 (array!41074 (_ BitVec 32) List!13660) Bool)

(assert (=> b!727309 (= res!488188 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13657))))

(declare-fun b!727310 () Bool)

(declare-fun e!407152 () Bool)

(declare-fun lt!322132 () (_ BitVec 32))

(assert (=> b!727310 (= e!407152 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5) (bvslt mask!3328 #b00000000000000000000000000000000) (and (bvsge lt!322132 #b00000000000000000000000000000000) (bvslt lt!322132 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!727310 (= lt!322132 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!727311 () Bool)

(assert (=> b!727311 (= e!407155 (not e!407152))))

(declare-fun res!488189 () Bool)

(assert (=> b!727311 (=> res!488189 e!407152)))

(assert (=> b!727311 (= res!488189 (or (not (is-Intermediate!7258 lt!322133)) (bvsge x!1131 (x!62380 lt!322133))))))

(assert (=> b!727311 e!407153))

(declare-fun res!488197 () Bool)

(assert (=> b!727311 (=> (not res!488197) (not e!407153))))

(assert (=> b!727311 (= res!488197 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24834 0))(
  ( (Unit!24835) )
))
(declare-fun lt!322130 () Unit!24834)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41074 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24834)

(assert (=> b!727311 (= lt!322130 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!727312 () Bool)

(declare-fun res!488194 () Bool)

(assert (=> b!727312 (=> (not res!488194) (not e!407148))))

(assert (=> b!727312 (= res!488194 (validKeyInArray!0 (select (arr!19658 a!3186) j!159)))))

(declare-fun b!727313 () Bool)

(declare-fun res!488196 () Bool)

(assert (=> b!727313 (=> (not res!488196) (not e!407154))))

(assert (=> b!727313 (= res!488196 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20079 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20079 a!3186))))))

(declare-fun b!727314 () Bool)

(assert (=> b!727314 (= e!407156 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19658 a!3186) j!159) a!3186 mask!3328) lt!322131))))

(declare-fun b!727305 () Bool)

(assert (=> b!727305 (= e!407148 e!407154)))

(declare-fun res!488185 () Bool)

(assert (=> b!727305 (=> (not res!488185) (not e!407154))))

(declare-fun lt!322128 () SeekEntryResult!7258)

(assert (=> b!727305 (= res!488185 (or (= lt!322128 (MissingZero!7258 i!1173)) (= lt!322128 (MissingVacant!7258 i!1173))))))

(assert (=> b!727305 (= lt!322128 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!488193 () Bool)

(assert (=> start!64556 (=> (not res!488193) (not e!407148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64556 (= res!488193 (validMask!0 mask!3328))))

(assert (=> start!64556 e!407148))

(assert (=> start!64556 true))

(declare-fun array_inv!15454 (array!41074) Bool)

(assert (=> start!64556 (array_inv!15454 a!3186)))

(assert (= (and start!64556 res!488193) b!727299))

(assert (= (and b!727299 res!488198) b!727312))

(assert (= (and b!727312 res!488194) b!727301))

(assert (= (and b!727301 res!488183) b!727302))

(assert (= (and b!727302 res!488195) b!727305))

(assert (= (and b!727305 res!488185) b!727308))

(assert (= (and b!727308 res!488186) b!727309))

(assert (= (and b!727309 res!488188) b!727313))

(assert (= (and b!727313 res!488196) b!727303))

(assert (= (and b!727303 res!488184) b!727300))

(assert (= (and b!727300 res!488187) b!727304))

(assert (= (and b!727304 c!79930) b!727314))

(assert (= (and b!727304 (not c!79930)) b!727306))

(assert (= (and b!727304 res!488190) b!727297))

(assert (= (and b!727297 res!488191) b!727311))

(assert (= (and b!727311 res!488197) b!727298))

(assert (= (and b!727298 res!488192) b!727307))

(assert (= (and b!727311 (not res!488189)) b!727310))

(declare-fun m!681265 () Bool)

(assert (=> b!727314 m!681265))

(assert (=> b!727314 m!681265))

(declare-fun m!681267 () Bool)

(assert (=> b!727314 m!681267))

(declare-fun m!681269 () Bool)

(assert (=> b!727309 m!681269))

(declare-fun m!681271 () Bool)

(assert (=> b!727301 m!681271))

(declare-fun m!681273 () Bool)

(assert (=> b!727310 m!681273))

(assert (=> b!727306 m!681265))

(assert (=> b!727306 m!681265))

(declare-fun m!681275 () Bool)

(assert (=> b!727306 m!681275))

(declare-fun m!681277 () Bool)

(assert (=> b!727305 m!681277))

(declare-fun m!681279 () Bool)

(assert (=> start!64556 m!681279))

(declare-fun m!681281 () Bool)

(assert (=> start!64556 m!681281))

(assert (=> b!727312 m!681265))

(assert (=> b!727312 m!681265))

(declare-fun m!681283 () Bool)

(assert (=> b!727312 m!681283))

(declare-fun m!681285 () Bool)

(assert (=> b!727308 m!681285))

(declare-fun m!681287 () Bool)

(assert (=> b!727300 m!681287))

(declare-fun m!681289 () Bool)

(assert (=> b!727302 m!681289))

(assert (=> b!727303 m!681265))

(assert (=> b!727303 m!681265))

(declare-fun m!681291 () Bool)

(assert (=> b!727303 m!681291))

(assert (=> b!727303 m!681291))

(assert (=> b!727303 m!681265))

(declare-fun m!681293 () Bool)

(assert (=> b!727303 m!681293))

(assert (=> b!727307 m!681265))

(assert (=> b!727307 m!681265))

(declare-fun m!681295 () Bool)

(assert (=> b!727307 m!681295))

(assert (=> b!727298 m!681265))

(assert (=> b!727298 m!681265))

(declare-fun m!681297 () Bool)

(assert (=> b!727298 m!681297))

(declare-fun m!681299 () Bool)

(assert (=> b!727311 m!681299))

(declare-fun m!681301 () Bool)

(assert (=> b!727311 m!681301))

(declare-fun m!681303 () Bool)

(assert (=> b!727297 m!681303))

(declare-fun m!681305 () Bool)

(assert (=> b!727297 m!681305))

(declare-fun m!681307 () Bool)

(assert (=> b!727297 m!681307))

(declare-fun m!681309 () Bool)

(assert (=> b!727297 m!681309))

(declare-fun m!681311 () Bool)

(assert (=> b!727297 m!681311))

(assert (=> b!727297 m!681307))

(push 1)

(assert (not b!727297))

(assert (not b!727314))

(assert (not b!727310))

(assert (not b!727311))

(assert (not b!727298))

(assert (not b!727305))

(assert (not b!727303))

(assert (not start!64556))

(assert (not b!727308))

(assert (not b!727312))

(assert (not b!727302))

(assert (not b!727309))

(assert (not b!727301))

(assert (not b!727307))

(assert (not b!727306))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!99455 () Bool)

(assert (=> d!99455 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!727301 d!99455))

(declare-fun d!99459 () Bool)

(assert (=> d!99459 (= (validKeyInArray!0 (select (arr!19658 a!3186) j!159)) (and (not (= (select (arr!19658 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19658 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!727312 d!99459))

(declare-fun d!99463 () Bool)

(declare-fun lt!322156 () (_ BitVec 32))

(assert (=> d!99463 (and (bvsge lt!322156 #b00000000000000000000000000000000) (bvslt lt!322156 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!99463 (= lt!322156 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!99463 (validMask!0 mask!3328)))

(assert (=> d!99463 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!322156)))

(declare-fun bs!20863 () Bool)

(assert (= bs!20863 d!99463))

(declare-fun m!681335 () Bool)

(assert (=> bs!20863 m!681335))

(assert (=> bs!20863 m!681279))

(assert (=> b!727310 d!99463))

(declare-fun call!34809 () Bool)

(declare-fun bm!34806 () Bool)

(assert (=> bm!34806 (= call!34809 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!727377 () Bool)

(declare-fun e!407193 () Bool)

(declare-fun e!407194 () Bool)

(assert (=> b!727377 (= e!407193 e!407194)))

(declare-fun c!79954 () Bool)

(assert (=> b!727377 (= c!79954 (validKeyInArray!0 (select (arr!19658 a!3186) j!159)))))

(declare-fun b!727378 () Bool)

(assert (=> b!727378 (= e!407194 call!34809)))

(declare-fun d!99465 () Bool)

(declare-fun res!488216 () Bool)

(assert (=> d!99465 (=> res!488216 e!407193)))

(assert (=> d!99465 (= res!488216 (bvsge j!159 (size!20079 a!3186)))))

(assert (=> d!99465 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!407193)))

(declare-fun b!727379 () Bool)

(declare-fun e!407192 () Bool)

(assert (=> b!727379 (= e!407192 call!34809)))

(declare-fun b!727380 () Bool)

(assert (=> b!727380 (= e!407194 e!407192)))

(declare-fun lt!322164 () (_ BitVec 64))

(assert (=> b!727380 (= lt!322164 (select (arr!19658 a!3186) j!159))))

(declare-fun lt!322163 () Unit!24834)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!41074 (_ BitVec 64) (_ BitVec 32)) Unit!24834)

(assert (=> b!727380 (= lt!322163 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!322164 j!159))))

(assert (=> b!727380 (arrayContainsKey!0 a!3186 lt!322164 #b00000000000000000000000000000000)))

(declare-fun lt!322165 () Unit!24834)

(assert (=> b!727380 (= lt!322165 lt!322163)))

(declare-fun res!488217 () Bool)

(assert (=> b!727380 (= res!488217 (= (seekEntryOrOpen!0 (select (arr!19658 a!3186) j!159) a!3186 mask!3328) (Found!7258 j!159)))))

(assert (=> b!727380 (=> (not res!488217) (not e!407192))))

(assert (= (and d!99465 (not res!488216)) b!727377))

(assert (= (and b!727377 c!79954) b!727380))

(assert (= (and b!727377 (not c!79954)) b!727378))

(assert (= (and b!727380 res!488217) b!727379))

(assert (= (or b!727379 b!727378) bm!34806))

(declare-fun m!681337 () Bool)

(assert (=> bm!34806 m!681337))

(assert (=> b!727377 m!681265))

(assert (=> b!727377 m!681265))

(assert (=> b!727377 m!681283))

(assert (=> b!727380 m!681265))

(declare-fun m!681339 () Bool)

(assert (=> b!727380 m!681339))

(declare-fun m!681341 () Bool)

(assert (=> b!727380 m!681341))

(assert (=> b!727380 m!681265))

(assert (=> b!727380 m!681297))

(assert (=> b!727311 d!99465))

(declare-fun d!99467 () Bool)

(assert (=> d!99467 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!322180 () Unit!24834)

(declare-fun choose!38 (array!41074 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24834)

(assert (=> d!99467 (= lt!322180 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!99467 (validMask!0 mask!3328)))

(assert (=> d!99467 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!322180)))

(declare-fun bs!20864 () Bool)

(assert (= bs!20864 d!99467))

(assert (=> bs!20864 m!681299))

(declare-fun m!681343 () Bool)

(assert (=> bs!20864 m!681343))

(assert (=> bs!20864 m!681279))

(assert (=> b!727311 d!99467))

(declare-fun b!727436 () Bool)

(declare-fun e!407226 () Bool)

(declare-fun e!407227 () Bool)

(assert (=> b!727436 (= e!407226 e!407227)))

(declare-fun res!488227 () Bool)

(assert (=> b!727436 (=> (not res!488227) (not e!407227))))

(declare-fun e!407229 () Bool)

(assert (=> b!727436 (= res!488227 (not e!407229))))

(declare-fun res!488228 () Bool)

(assert (=> b!727436 (=> (not res!488228) (not e!407229))))

(assert (=> b!727436 (= res!488228 (validKeyInArray!0 (select (arr!19658 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!34809 () Bool)

(declare-fun call!34812 () Bool)

(declare-fun c!79978 () Bool)

(assert (=> bm!34809 (= call!34812 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!79978 (Cons!13656 (select (arr!19658 a!3186) #b00000000000000000000000000000000) Nil!13657) Nil!13657)))))

(declare-fun b!727437 () Bool)

(declare-fun e!407228 () Bool)

(assert (=> b!727437 (= e!407228 call!34812)))

(declare-fun b!727438 () Bool)

(assert (=> b!727438 (= e!407228 call!34812)))

(declare-fun d!99469 () Bool)

(declare-fun res!488229 () Bool)

(assert (=> d!99469 (=> res!488229 e!407226)))

(assert (=> d!99469 (= res!488229 (bvsge #b00000000000000000000000000000000 (size!20079 a!3186)))))

(assert (=> d!99469 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13657) e!407226)))

(declare-fun b!727439 () Bool)

(assert (=> b!727439 (= e!407227 e!407228)))

(assert (=> b!727439 (= c!79978 (validKeyInArray!0 (select (arr!19658 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!727440 () Bool)

(declare-fun contains!4049 (List!13660 (_ BitVec 64)) Bool)

(assert (=> b!727440 (= e!407229 (contains!4049 Nil!13657 (select (arr!19658 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!99469 (not res!488229)) b!727436))

(assert (= (and b!727436 res!488228) b!727440))

(assert (= (and b!727436 res!488227) b!727439))

(assert (= (and b!727439 c!79978) b!727438))

(assert (= (and b!727439 (not c!79978)) b!727437))

(assert (= (or b!727438 b!727437) bm!34809))

(declare-fun m!681371 () Bool)

(assert (=> b!727436 m!681371))

(assert (=> b!727436 m!681371))

(declare-fun m!681373 () Bool)

(assert (=> b!727436 m!681373))

(assert (=> bm!34809 m!681371))

(declare-fun m!681375 () Bool)

(assert (=> bm!34809 m!681375))

(assert (=> b!727439 m!681371))

(assert (=> b!727439 m!681371))

(assert (=> b!727439 m!681373))

(assert (=> b!727440 m!681371))

(assert (=> b!727440 m!681371))

(declare-fun m!681377 () Bool)

(assert (=> b!727440 m!681377))

(assert (=> b!727309 d!99469))

(declare-fun d!99477 () Bool)

(declare-fun lt!322227 () SeekEntryResult!7258)

(assert (=> d!99477 (and (or (is-Undefined!7258 lt!322227) (not (is-Found!7258 lt!322227)) (and (bvsge (index!31401 lt!322227) #b00000000000000000000000000000000) (bvslt (index!31401 lt!322227) (size!20079 a!3186)))) (or (is-Undefined!7258 lt!322227) (is-Found!7258 lt!322227) (not (is-MissingZero!7258 lt!322227)) (and (bvsge (index!31400 lt!322227) #b00000000000000000000000000000000) (bvslt (index!31400 lt!322227) (size!20079 a!3186)))) (or (is-Undefined!7258 lt!322227) (is-Found!7258 lt!322227) (is-MissingZero!7258 lt!322227) (not (is-MissingVacant!7258 lt!322227)) (and (bvsge (index!31403 lt!322227) #b00000000000000000000000000000000) (bvslt (index!31403 lt!322227) (size!20079 a!3186)))) (or (is-Undefined!7258 lt!322227) (ite (is-Found!7258 lt!322227) (= (select (arr!19658 a!3186) (index!31401 lt!322227)) (select (arr!19658 a!3186) j!159)) (ite (is-MissingZero!7258 lt!322227) (= (select (arr!19658 a!3186) (index!31400 lt!322227)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7258 lt!322227) (= (select (arr!19658 a!3186) (index!31403 lt!322227)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!407274 () SeekEntryResult!7258)

(assert (=> d!99477 (= lt!322227 e!407274)))

(declare-fun c!80004 () Bool)

(declare-fun lt!322225 () SeekEntryResult!7258)

(assert (=> d!99477 (= c!80004 (and (is-Intermediate!7258 lt!322225) (undefined!8070 lt!322225)))))

(assert (=> d!99477 (= lt!322225 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19658 a!3186) j!159) mask!3328) (select (arr!19658 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!99477 (validMask!0 mask!3328)))

(assert (=> d!99477 (= (seekEntryOrOpen!0 (select (arr!19658 a!3186) j!159) a!3186 mask!3328) lt!322227)))

(declare-fun b!727514 () Bool)

(declare-fun e!407273 () SeekEntryResult!7258)

(assert (=> b!727514 (= e!407273 (seekKeyOrZeroReturnVacant!0 (x!62380 lt!322225) (index!31402 lt!322225) (index!31402 lt!322225) (select (arr!19658 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!727515 () Bool)

(declare-fun e!407275 () SeekEntryResult!7258)

(assert (=> b!727515 (= e!407274 e!407275)))

(declare-fun lt!322226 () (_ BitVec 64))

(assert (=> b!727515 (= lt!322226 (select (arr!19658 a!3186) (index!31402 lt!322225)))))

(declare-fun c!80005 () Bool)

(assert (=> b!727515 (= c!80005 (= lt!322226 (select (arr!19658 a!3186) j!159)))))

(declare-fun b!727516 () Bool)

(assert (=> b!727516 (= e!407273 (MissingZero!7258 (index!31402 lt!322225)))))

(declare-fun b!727517 () Bool)

(assert (=> b!727517 (= e!407275 (Found!7258 (index!31402 lt!322225)))))

(declare-fun b!727518 () Bool)

(assert (=> b!727518 (= e!407274 Undefined!7258)))

(declare-fun b!727519 () Bool)

(declare-fun c!80006 () Bool)

(assert (=> b!727519 (= c!80006 (= lt!322226 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!727519 (= e!407275 e!407273)))

(assert (= (and d!99477 c!80004) b!727518))

(assert (= (and d!99477 (not c!80004)) b!727515))

(assert (= (and b!727515 c!80005) b!727517))

(assert (= (and b!727515 (not c!80005)) b!727519))

(assert (= (and b!727519 c!80006) b!727516))

(assert (= (and b!727519 (not c!80006)) b!727514))

(declare-fun m!681423 () Bool)

(assert (=> d!99477 m!681423))

(declare-fun m!681425 () Bool)

(assert (=> d!99477 m!681425))

(declare-fun m!681427 () Bool)

(assert (=> d!99477 m!681427))

(assert (=> d!99477 m!681291))

(assert (=> d!99477 m!681265))

(assert (=> d!99477 m!681293))

(assert (=> d!99477 m!681265))

(assert (=> d!99477 m!681291))

(assert (=> d!99477 m!681279))

(assert (=> b!727514 m!681265))

(declare-fun m!681429 () Bool)

(assert (=> b!727514 m!681429))

(declare-fun m!681431 () Bool)

(assert (=> b!727515 m!681431))

(assert (=> b!727298 d!99477))

(declare-fun e!407330 () SeekEntryResult!7258)

(declare-fun b!727595 () Bool)

(assert (=> b!727595 (= e!407330 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!322127 lt!322125 mask!3328))))

(declare-fun d!99497 () Bool)

(declare-fun e!407331 () Bool)

(assert (=> d!99497 e!407331))

(declare-fun c!80029 () Bool)

(declare-fun lt!322245 () SeekEntryResult!7258)

(assert (=> d!99497 (= c!80029 (and (is-Intermediate!7258 lt!322245) (undefined!8070 lt!322245)))))

(declare-fun e!407327 () SeekEntryResult!7258)

(assert (=> d!99497 (= lt!322245 e!407327)))

(declare-fun c!80030 () Bool)

(assert (=> d!99497 (= c!80030 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!322246 () (_ BitVec 64))

(assert (=> d!99497 (= lt!322246 (select (arr!19658 lt!322125) index!1321))))

(assert (=> d!99497 (validMask!0 mask!3328)))

(assert (=> d!99497 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322127 lt!322125 mask!3328) lt!322245)))

(declare-fun b!727596 () Bool)

(assert (=> b!727596 (= e!407327 e!407330)))

(declare-fun c!80028 () Bool)

(assert (=> b!727596 (= c!80028 (or (= lt!322246 lt!322127) (= (bvadd lt!322246 lt!322246) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!727597 () Bool)

(declare-fun e!407329 () Bool)

(assert (=> b!727597 (= e!407331 e!407329)))

(declare-fun res!488287 () Bool)

(assert (=> b!727597 (= res!488287 (and (is-Intermediate!7258 lt!322245) (not (undefined!8070 lt!322245)) (bvslt (x!62380 lt!322245) #b01111111111111111111111111111110) (bvsge (x!62380 lt!322245) #b00000000000000000000000000000000) (bvsge (x!62380 lt!322245) x!1131)))))

(assert (=> b!727597 (=> (not res!488287) (not e!407329))))

(declare-fun b!727598 () Bool)

(assert (=> b!727598 (and (bvsge (index!31402 lt!322245) #b00000000000000000000000000000000) (bvslt (index!31402 lt!322245) (size!20079 lt!322125)))))

(declare-fun res!488289 () Bool)

(assert (=> b!727598 (= res!488289 (= (select (arr!19658 lt!322125) (index!31402 lt!322245)) lt!322127))))

(declare-fun e!407328 () Bool)

(assert (=> b!727598 (=> res!488289 e!407328)))

(assert (=> b!727598 (= e!407329 e!407328)))

(declare-fun b!727599 () Bool)

(assert (=> b!727599 (and (bvsge (index!31402 lt!322245) #b00000000000000000000000000000000) (bvslt (index!31402 lt!322245) (size!20079 lt!322125)))))

(assert (=> b!727599 (= e!407328 (= (select (arr!19658 lt!322125) (index!31402 lt!322245)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!727600 () Bool)

(assert (=> b!727600 (and (bvsge (index!31402 lt!322245) #b00000000000000000000000000000000) (bvslt (index!31402 lt!322245) (size!20079 lt!322125)))))

(declare-fun res!488288 () Bool)

(assert (=> b!727600 (= res!488288 (= (select (arr!19658 lt!322125) (index!31402 lt!322245)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!727600 (=> res!488288 e!407328)))

(declare-fun b!727601 () Bool)

(assert (=> b!727601 (= e!407327 (Intermediate!7258 true index!1321 x!1131))))

(declare-fun b!727602 () Bool)

(assert (=> b!727602 (= e!407330 (Intermediate!7258 false index!1321 x!1131))))

(declare-fun b!727603 () Bool)

(assert (=> b!727603 (= e!407331 (bvsge (x!62380 lt!322245) #b01111111111111111111111111111110))))

(assert (= (and d!99497 c!80030) b!727601))

(assert (= (and d!99497 (not c!80030)) b!727596))

(assert (= (and b!727596 c!80028) b!727602))

(assert (= (and b!727596 (not c!80028)) b!727595))

(assert (= (and d!99497 c!80029) b!727603))

(assert (= (and d!99497 (not c!80029)) b!727597))

(assert (= (and b!727597 res!488287) b!727598))

(assert (= (and b!727598 (not res!488289)) b!727600))

(assert (= (and b!727600 (not res!488288)) b!727599))

(declare-fun m!681473 () Bool)

(assert (=> d!99497 m!681473))

(assert (=> d!99497 m!681279))

(declare-fun m!681475 () Bool)

(assert (=> b!727599 m!681475))

(assert (=> b!727598 m!681475))

(assert (=> b!727595 m!681273))

(assert (=> b!727595 m!681273))

(declare-fun m!681477 () Bool)

(assert (=> b!727595 m!681477))

(assert (=> b!727600 m!681475))

(assert (=> b!727297 d!99497))

(declare-fun e!407335 () SeekEntryResult!7258)

(declare-fun b!727604 () Bool)

(assert (=> b!727604 (= e!407335 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!322127 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!322127 lt!322125 mask!3328))))

(declare-fun d!99517 () Bool)

(declare-fun e!407336 () Bool)

(assert (=> d!99517 e!407336))

(declare-fun c!80032 () Bool)

(declare-fun lt!322247 () SeekEntryResult!7258)

(assert (=> d!99517 (= c!80032 (and (is-Intermediate!7258 lt!322247) (undefined!8070 lt!322247)))))

(declare-fun e!407332 () SeekEntryResult!7258)

(assert (=> d!99517 (= lt!322247 e!407332)))

(declare-fun c!80033 () Bool)

(assert (=> d!99517 (= c!80033 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!322248 () (_ BitVec 64))

(assert (=> d!99517 (= lt!322248 (select (arr!19658 lt!322125) (toIndex!0 lt!322127 mask!3328)))))

(assert (=> d!99517 (validMask!0 mask!3328)))

(assert (=> d!99517 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322127 mask!3328) lt!322127 lt!322125 mask!3328) lt!322247)))

(declare-fun b!727605 () Bool)

(assert (=> b!727605 (= e!407332 e!407335)))

(declare-fun c!80031 () Bool)

(assert (=> b!727605 (= c!80031 (or (= lt!322248 lt!322127) (= (bvadd lt!322248 lt!322248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!727606 () Bool)

(declare-fun e!407334 () Bool)

(assert (=> b!727606 (= e!407336 e!407334)))

(declare-fun res!488290 () Bool)

(assert (=> b!727606 (= res!488290 (and (is-Intermediate!7258 lt!322247) (not (undefined!8070 lt!322247)) (bvslt (x!62380 lt!322247) #b01111111111111111111111111111110) (bvsge (x!62380 lt!322247) #b00000000000000000000000000000000) (bvsge (x!62380 lt!322247) #b00000000000000000000000000000000)))))

(assert (=> b!727606 (=> (not res!488290) (not e!407334))))

(declare-fun b!727607 () Bool)

(assert (=> b!727607 (and (bvsge (index!31402 lt!322247) #b00000000000000000000000000000000) (bvslt (index!31402 lt!322247) (size!20079 lt!322125)))))

(declare-fun res!488292 () Bool)

(assert (=> b!727607 (= res!488292 (= (select (arr!19658 lt!322125) (index!31402 lt!322247)) lt!322127))))

(declare-fun e!407333 () Bool)

(assert (=> b!727607 (=> res!488292 e!407333)))

(assert (=> b!727607 (= e!407334 e!407333)))

(declare-fun b!727608 () Bool)

(assert (=> b!727608 (and (bvsge (index!31402 lt!322247) #b00000000000000000000000000000000) (bvslt (index!31402 lt!322247) (size!20079 lt!322125)))))

(assert (=> b!727608 (= e!407333 (= (select (arr!19658 lt!322125) (index!31402 lt!322247)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!727609 () Bool)

(assert (=> b!727609 (and (bvsge (index!31402 lt!322247) #b00000000000000000000000000000000) (bvslt (index!31402 lt!322247) (size!20079 lt!322125)))))

(declare-fun res!488291 () Bool)

(assert (=> b!727609 (= res!488291 (= (select (arr!19658 lt!322125) (index!31402 lt!322247)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!727609 (=> res!488291 e!407333)))

(declare-fun b!727610 () Bool)

(assert (=> b!727610 (= e!407332 (Intermediate!7258 true (toIndex!0 lt!322127 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!727611 () Bool)

(assert (=> b!727611 (= e!407335 (Intermediate!7258 false (toIndex!0 lt!322127 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!727612 () Bool)

(assert (=> b!727612 (= e!407336 (bvsge (x!62380 lt!322247) #b01111111111111111111111111111110))))

(assert (= (and d!99517 c!80033) b!727610))

(assert (= (and d!99517 (not c!80033)) b!727605))

(assert (= (and b!727605 c!80031) b!727611))

(assert (= (and b!727605 (not c!80031)) b!727604))

(assert (= (and d!99517 c!80032) b!727612))

(assert (= (and d!99517 (not c!80032)) b!727606))

(assert (= (and b!727606 res!488290) b!727607))

(assert (= (and b!727607 (not res!488292)) b!727609))

(assert (= (and b!727609 (not res!488291)) b!727608))

(assert (=> d!99517 m!681307))

(declare-fun m!681479 () Bool)

(assert (=> d!99517 m!681479))

(assert (=> d!99517 m!681279))

(declare-fun m!681481 () Bool)

(assert (=> b!727608 m!681481))

(assert (=> b!727607 m!681481))

(assert (=> b!727604 m!681307))

(declare-fun m!681483 () Bool)

(assert (=> b!727604 m!681483))

(assert (=> b!727604 m!681483))

(declare-fun m!681485 () Bool)

(assert (=> b!727604 m!681485))

(assert (=> b!727609 m!681481))

(assert (=> b!727297 d!99517))

(declare-fun d!99519 () Bool)

(declare-fun lt!322260 () (_ BitVec 32))

(declare-fun lt!322259 () (_ BitVec 32))

(assert (=> d!99519 (= lt!322260 (bvmul (bvxor lt!322259 (bvlshr lt!322259 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99519 (= lt!322259 ((_ extract 31 0) (bvand (bvxor lt!322127 (bvlshr lt!322127 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99519 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!488293 (let ((h!14716 ((_ extract 31 0) (bvand (bvxor lt!322127 (bvlshr lt!322127 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62389 (bvmul (bvxor h!14716 (bvlshr h!14716 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62389 (bvlshr x!62389 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!488293 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!488293 #b00000000000000000000000000000000))))))

(assert (=> d!99519 (= (toIndex!0 lt!322127 mask!3328) (bvand (bvxor lt!322260 (bvlshr lt!322260 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!727297 d!99519))

(declare-fun bm!34820 () Bool)

(declare-fun call!34823 () Bool)

(assert (=> bm!34820 (= call!34823 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!727631 () Bool)

(declare-fun e!407347 () Bool)

(declare-fun e!407348 () Bool)

(assert (=> b!727631 (= e!407347 e!407348)))

(declare-fun c!80043 () Bool)

(assert (=> b!727631 (= c!80043 (validKeyInArray!0 (select (arr!19658 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!727632 () Bool)

(assert (=> b!727632 (= e!407348 call!34823)))

(declare-fun d!99521 () Bool)

(declare-fun res!488294 () Bool)

(assert (=> d!99521 (=> res!488294 e!407347)))

(assert (=> d!99521 (= res!488294 (bvsge #b00000000000000000000000000000000 (size!20079 a!3186)))))

(assert (=> d!99521 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!407347)))

(declare-fun b!727633 () Bool)

(declare-fun e!407346 () Bool)

(assert (=> b!727633 (= e!407346 call!34823)))

(declare-fun b!727634 () Bool)

(assert (=> b!727634 (= e!407348 e!407346)))

(declare-fun lt!322262 () (_ BitVec 64))

(assert (=> b!727634 (= lt!322262 (select (arr!19658 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!322261 () Unit!24834)

(assert (=> b!727634 (= lt!322261 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!322262 #b00000000000000000000000000000000))))

(assert (=> b!727634 (arrayContainsKey!0 a!3186 lt!322262 #b00000000000000000000000000000000)))

(declare-fun lt!322263 () Unit!24834)

(assert (=> b!727634 (= lt!322263 lt!322261)))

(declare-fun res!488295 () Bool)

(assert (=> b!727634 (= res!488295 (= (seekEntryOrOpen!0 (select (arr!19658 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7258 #b00000000000000000000000000000000)))))

(assert (=> b!727634 (=> (not res!488295) (not e!407346))))

(assert (= (and d!99521 (not res!488294)) b!727631))

(assert (= (and b!727631 c!80043) b!727634))

(assert (= (and b!727631 (not c!80043)) b!727632))

(assert (= (and b!727634 res!488295) b!727633))

(assert (= (or b!727633 b!727632) bm!34820))

(declare-fun m!681495 () Bool)

(assert (=> bm!34820 m!681495))

(assert (=> b!727631 m!681371))

(assert (=> b!727631 m!681371))

(assert (=> b!727631 m!681373))

(assert (=> b!727634 m!681371))

(declare-fun m!681497 () Bool)

(assert (=> b!727634 m!681497))

(declare-fun m!681499 () Bool)

(assert (=> b!727634 m!681499))

(assert (=> b!727634 m!681371))

(declare-fun m!681501 () Bool)

(assert (=> b!727634 m!681501))

(assert (=> b!727308 d!99521))

(declare-fun b!727678 () Bool)

(declare-fun c!80061 () Bool)

(declare-fun lt!322289 () (_ BitVec 64))

(assert (=> b!727678 (= c!80061 (= lt!322289 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!407377 () SeekEntryResult!7258)

(declare-fun e!407375 () SeekEntryResult!7258)

(assert (=> b!727678 (= e!407377 e!407375)))

(declare-fun b!727679 () Bool)

(assert (=> b!727679 (= e!407375 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!19658 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!727680 () Bool)

(assert (=> b!727680 (= e!407377 (Found!7258 index!1321))))

(declare-fun b!727682 () Bool)

(declare-fun e!407376 () SeekEntryResult!7258)

(assert (=> b!727682 (= e!407376 e!407377)))

(declare-fun c!80060 () Bool)

(assert (=> b!727682 (= c!80060 (= lt!322289 (select (arr!19658 a!3186) j!159)))))

(declare-fun b!727683 () Bool)

(assert (=> b!727683 (= e!407376 Undefined!7258)))

(declare-fun lt!322290 () SeekEntryResult!7258)

(declare-fun d!99525 () Bool)

(assert (=> d!99525 (and (or (is-Undefined!7258 lt!322290) (not (is-Found!7258 lt!322290)) (and (bvsge (index!31401 lt!322290) #b00000000000000000000000000000000) (bvslt (index!31401 lt!322290) (size!20079 a!3186)))) (or (is-Undefined!7258 lt!322290) (is-Found!7258 lt!322290) (not (is-MissingVacant!7258 lt!322290)) (not (= (index!31403 lt!322290) resIntermediateIndex!5)) (and (bvsge (index!31403 lt!322290) #b00000000000000000000000000000000) (bvslt (index!31403 lt!322290) (size!20079 a!3186)))) (or (is-Undefined!7258 lt!322290) (ite (is-Found!7258 lt!322290) (= (select (arr!19658 a!3186) (index!31401 lt!322290)) (select (arr!19658 a!3186) j!159)) (and (is-MissingVacant!7258 lt!322290) (= (index!31403 lt!322290) resIntermediateIndex!5) (= (select (arr!19658 a!3186) (index!31403 lt!322290)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!99525 (= lt!322290 e!407376)))

(declare-fun c!80062 () Bool)

(assert (=> d!99525 (= c!80062 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!99525 (= lt!322289 (select (arr!19658 a!3186) index!1321))))

(assert (=> d!99525 (validMask!0 mask!3328)))

(assert (=> d!99525 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19658 a!3186) j!159) a!3186 mask!3328) lt!322290)))

(declare-fun b!727681 () Bool)

(assert (=> b!727681 (= e!407375 (MissingVacant!7258 resIntermediateIndex!5))))

(assert (= (and d!99525 c!80062) b!727683))

(assert (= (and d!99525 (not c!80062)) b!727682))

(assert (= (and b!727682 c!80060) b!727680))

(assert (= (and b!727682 (not c!80060)) b!727678))

(assert (= (and b!727678 c!80061) b!727681))

(assert (= (and b!727678 (not c!80061)) b!727679))

(assert (=> b!727679 m!681273))

(assert (=> b!727679 m!681273))

(assert (=> b!727679 m!681265))

(declare-fun m!681533 () Bool)

(assert (=> b!727679 m!681533))

(declare-fun m!681535 () Bool)

(assert (=> d!99525 m!681535))

(declare-fun m!681537 () Bool)

(assert (=> d!99525 m!681537))

(declare-fun m!681539 () Bool)

(assert (=> d!99525 m!681539))

(assert (=> d!99525 m!681279))

(assert (=> b!727306 d!99525))

(declare-fun b!727684 () Bool)

(declare-fun c!80064 () Bool)

(declare-fun lt!322291 () (_ BitVec 64))

(assert (=> b!727684 (= c!80064 (= lt!322291 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!407380 () SeekEntryResult!7258)

(declare-fun e!407378 () SeekEntryResult!7258)

(assert (=> b!727684 (= e!407380 e!407378)))

(declare-fun b!727685 () Bool)

(assert (=> b!727685 (= e!407378 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!19658 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!727686 () Bool)

(assert (=> b!727686 (= e!407380 (Found!7258 resIntermediateIndex!5))))

(declare-fun b!727688 () Bool)

(declare-fun e!407379 () SeekEntryResult!7258)

(assert (=> b!727688 (= e!407379 e!407380)))

(declare-fun c!80063 () Bool)

(assert (=> b!727688 (= c!80063 (= lt!322291 (select (arr!19658 a!3186) j!159)))))

(declare-fun b!727689 () Bool)

(assert (=> b!727689 (= e!407379 Undefined!7258)))

(declare-fun d!99539 () Bool)

(declare-fun lt!322292 () SeekEntryResult!7258)

(assert (=> d!99539 (and (or (is-Undefined!7258 lt!322292) (not (is-Found!7258 lt!322292)) (and (bvsge (index!31401 lt!322292) #b00000000000000000000000000000000) (bvslt (index!31401 lt!322292) (size!20079 a!3186)))) (or (is-Undefined!7258 lt!322292) (is-Found!7258 lt!322292) (not (is-MissingVacant!7258 lt!322292)) (not (= (index!31403 lt!322292) resIntermediateIndex!5)) (and (bvsge (index!31403 lt!322292) #b00000000000000000000000000000000) (bvslt (index!31403 lt!322292) (size!20079 a!3186)))) (or (is-Undefined!7258 lt!322292) (ite (is-Found!7258 lt!322292) (= (select (arr!19658 a!3186) (index!31401 lt!322292)) (select (arr!19658 a!3186) j!159)) (and (is-MissingVacant!7258 lt!322292) (= (index!31403 lt!322292) resIntermediateIndex!5) (= (select (arr!19658 a!3186) (index!31403 lt!322292)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!99539 (= lt!322292 e!407379)))

(declare-fun c!80065 () Bool)

(assert (=> d!99539 (= c!80065 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!99539 (= lt!322291 (select (arr!19658 a!3186) resIntermediateIndex!5))))

(assert (=> d!99539 (validMask!0 mask!3328)))

(assert (=> d!99539 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19658 a!3186) j!159) a!3186 mask!3328) lt!322292)))

(declare-fun b!727687 () Bool)

(assert (=> b!727687 (= e!407378 (MissingVacant!7258 resIntermediateIndex!5))))

(assert (= (and d!99539 c!80065) b!727689))

(assert (= (and d!99539 (not c!80065)) b!727688))

(assert (= (and b!727688 c!80063) b!727686))

(assert (= (and b!727688 (not c!80063)) b!727684))

(assert (= (and b!727684 c!80064) b!727687))

(assert (= (and b!727684 (not c!80064)) b!727685))

(declare-fun m!681541 () Bool)

(assert (=> b!727685 m!681541))

(assert (=> b!727685 m!681541))

(assert (=> b!727685 m!681265))

(declare-fun m!681543 () Bool)

(assert (=> b!727685 m!681543))

(declare-fun m!681545 () Bool)

(assert (=> d!99539 m!681545))

(declare-fun m!681547 () Bool)

(assert (=> d!99539 m!681547))

(assert (=> d!99539 m!681287))

(assert (=> d!99539 m!681279))

(assert (=> b!727307 d!99539))

(declare-fun d!99541 () Bool)

(declare-fun lt!322295 () SeekEntryResult!7258)

(assert (=> d!99541 (and (or (is-Undefined!7258 lt!322295) (not (is-Found!7258 lt!322295)) (and (bvsge (index!31401 lt!322295) #b00000000000000000000000000000000) (bvslt (index!31401 lt!322295) (size!20079 a!3186)))) (or (is-Undefined!7258 lt!322295) (is-Found!7258 lt!322295) (not (is-MissingZero!7258 lt!322295)) (and (bvsge (index!31400 lt!322295) #b00000000000000000000000000000000) (bvslt (index!31400 lt!322295) (size!20079 a!3186)))) (or (is-Undefined!7258 lt!322295) (is-Found!7258 lt!322295) (is-MissingZero!7258 lt!322295) (not (is-MissingVacant!7258 lt!322295)) (and (bvsge (index!31403 lt!322295) #b00000000000000000000000000000000) (bvslt (index!31403 lt!322295) (size!20079 a!3186)))) (or (is-Undefined!7258 lt!322295) (ite (is-Found!7258 lt!322295) (= (select (arr!19658 a!3186) (index!31401 lt!322295)) k!2102) (ite (is-MissingZero!7258 lt!322295) (= (select (arr!19658 a!3186) (index!31400 lt!322295)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7258 lt!322295) (= (select (arr!19658 a!3186) (index!31403 lt!322295)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!407382 () SeekEntryResult!7258)

(assert (=> d!99541 (= lt!322295 e!407382)))

(declare-fun c!80066 () Bool)

(declare-fun lt!322293 () SeekEntryResult!7258)

(assert (=> d!99541 (= c!80066 (and (is-Intermediate!7258 lt!322293) (undefined!8070 lt!322293)))))

(assert (=> d!99541 (= lt!322293 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!99541 (validMask!0 mask!3328)))

(assert (=> d!99541 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!322295)))

(declare-fun e!407381 () SeekEntryResult!7258)

(declare-fun b!727690 () Bool)

(assert (=> b!727690 (= e!407381 (seekKeyOrZeroReturnVacant!0 (x!62380 lt!322293) (index!31402 lt!322293) (index!31402 lt!322293) k!2102 a!3186 mask!3328))))

(declare-fun b!727691 () Bool)

(declare-fun e!407383 () SeekEntryResult!7258)

(assert (=> b!727691 (= e!407382 e!407383)))

(declare-fun lt!322294 () (_ BitVec 64))

(assert (=> b!727691 (= lt!322294 (select (arr!19658 a!3186) (index!31402 lt!322293)))))

(declare-fun c!80067 () Bool)

(assert (=> b!727691 (= c!80067 (= lt!322294 k!2102))))

(declare-fun b!727692 () Bool)

(assert (=> b!727692 (= e!407381 (MissingZero!7258 (index!31402 lt!322293)))))

(declare-fun b!727693 () Bool)

(assert (=> b!727693 (= e!407383 (Found!7258 (index!31402 lt!322293)))))

(declare-fun b!727694 () Bool)

(assert (=> b!727694 (= e!407382 Undefined!7258)))

(declare-fun b!727695 () Bool)

(declare-fun c!80068 () Bool)

(assert (=> b!727695 (= c!80068 (= lt!322294 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!727695 (= e!407383 e!407381)))

(assert (= (and d!99541 c!80066) b!727694))

(assert (= (and d!99541 (not c!80066)) b!727691))

(assert (= (and b!727691 c!80067) b!727693))

(assert (= (and b!727691 (not c!80067)) b!727695))

(assert (= (and b!727695 c!80068) b!727692))

(assert (= (and b!727695 (not c!80068)) b!727690))

(declare-fun m!681549 () Bool)

(assert (=> d!99541 m!681549))

(declare-fun m!681551 () Bool)

(assert (=> d!99541 m!681551))

(declare-fun m!681553 () Bool)

(assert (=> d!99541 m!681553))

(declare-fun m!681555 () Bool)

(assert (=> d!99541 m!681555))

(declare-fun m!681557 () Bool)

(assert (=> d!99541 m!681557))

(assert (=> d!99541 m!681555))

(assert (=> d!99541 m!681279))

(declare-fun m!681559 () Bool)

(assert (=> b!727690 m!681559))

(declare-fun m!681561 () Bool)

(assert (=> b!727691 m!681561))

(assert (=> b!727305 d!99541))

(declare-fun e!407387 () SeekEntryResult!7258)

(declare-fun b!727696 () Bool)

(assert (=> b!727696 (= e!407387 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!19658 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!99543 () Bool)

(declare-fun e!407388 () Bool)

(assert (=> d!99543 e!407388))

(declare-fun c!80070 () Bool)

(declare-fun lt!322296 () SeekEntryResult!7258)

(assert (=> d!99543 (= c!80070 (and (is-Intermediate!7258 lt!322296) (undefined!8070 lt!322296)))))

(declare-fun e!407384 () SeekEntryResult!7258)

(assert (=> d!99543 (= lt!322296 e!407384)))

(declare-fun c!80071 () Bool)

(assert (=> d!99543 (= c!80071 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!322297 () (_ BitVec 64))

(assert (=> d!99543 (= lt!322297 (select (arr!19658 a!3186) index!1321))))

(assert (=> d!99543 (validMask!0 mask!3328)))

(assert (=> d!99543 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19658 a!3186) j!159) a!3186 mask!3328) lt!322296)))

(declare-fun b!727697 () Bool)

(assert (=> b!727697 (= e!407384 e!407387)))

(declare-fun c!80069 () Bool)

(assert (=> b!727697 (= c!80069 (or (= lt!322297 (select (arr!19658 a!3186) j!159)) (= (bvadd lt!322297 lt!322297) #b0000000000000000000000000000000000000000000000000000000000000000)))))

