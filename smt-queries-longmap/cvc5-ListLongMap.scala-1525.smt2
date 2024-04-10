; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28680 () Bool)

(assert start!28680)

(declare-fun b!293145 () Bool)

(declare-fun res!154204 () Bool)

(declare-fun e!185378 () Bool)

(assert (=> b!293145 (=> (not res!154204) (not e!185378))))

(declare-datatypes ((array!14859 0))(
  ( (array!14860 (arr!7052 (Array (_ BitVec 32) (_ BitVec 64))) (size!7404 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14859)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!293145 (= res!154204 (and (= (size!7404 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7404 a!3312))))))

(declare-fun res!154205 () Bool)

(assert (=> start!28680 (=> (not res!154205) (not e!185378))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28680 (= res!154205 (validMask!0 mask!3809))))

(assert (=> start!28680 e!185378))

(assert (=> start!28680 true))

(declare-fun array_inv!5015 (array!14859) Bool)

(assert (=> start!28680 (array_inv!5015 a!3312)))

(declare-fun b!293146 () Bool)

(declare-fun res!154202 () Bool)

(assert (=> b!293146 (=> (not res!154202) (not e!185378))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14859 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!293146 (= res!154202 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!293147 () Bool)

(declare-fun res!154201 () Bool)

(assert (=> b!293147 (=> (not res!154201) (not e!185378))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!293147 (= res!154201 (validKeyInArray!0 k!2524))))

(declare-fun b!293148 () Bool)

(declare-fun res!154206 () Bool)

(declare-fun e!185376 () Bool)

(assert (=> b!293148 (=> (not res!154206) (not e!185376))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14859 (_ BitVec 32)) Bool)

(assert (=> b!293148 (= res!154206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!293149 () Bool)

(assert (=> b!293149 (= e!185378 e!185376)))

(declare-fun res!154203 () Bool)

(assert (=> b!293149 (=> (not res!154203) (not e!185376))))

(declare-datatypes ((SeekEntryResult!2201 0))(
  ( (MissingZero!2201 (index!10974 (_ BitVec 32))) (Found!2201 (index!10975 (_ BitVec 32))) (Intermediate!2201 (undefined!3013 Bool) (index!10976 (_ BitVec 32)) (x!29152 (_ BitVec 32))) (Undefined!2201) (MissingVacant!2201 (index!10977 (_ BitVec 32))) )
))
(declare-fun lt!145298 () SeekEntryResult!2201)

(declare-fun lt!145296 () Bool)

(assert (=> b!293149 (= res!154203 (or lt!145296 (= lt!145298 (MissingVacant!2201 i!1256))))))

(assert (=> b!293149 (= lt!145296 (= lt!145298 (MissingZero!2201 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14859 (_ BitVec 32)) SeekEntryResult!2201)

(assert (=> b!293149 (= lt!145298 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!293150 () Bool)

(declare-fun lt!145300 () SeekEntryResult!2201)

(assert (=> b!293150 (= e!185376 (and lt!145296 (is-Intermediate!2201 lt!145300) (undefined!3013 lt!145300)))))

(declare-fun lt!145299 () (_ BitVec 32))

(declare-fun lt!145297 () SeekEntryResult!2201)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14859 (_ BitVec 32)) SeekEntryResult!2201)

(assert (=> b!293150 (= lt!145297 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145299 k!2524 (array!14860 (store (arr!7052 a!3312) i!1256 k!2524) (size!7404 a!3312)) mask!3809))))

(assert (=> b!293150 (= lt!145300 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145299 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293150 (= lt!145299 (toIndex!0 k!2524 mask!3809))))

(assert (= (and start!28680 res!154205) b!293145))

(assert (= (and b!293145 res!154204) b!293147))

(assert (= (and b!293147 res!154201) b!293146))

(assert (= (and b!293146 res!154202) b!293149))

(assert (= (and b!293149 res!154203) b!293148))

(assert (= (and b!293148 res!154206) b!293150))

(declare-fun m!306945 () Bool)

(assert (=> b!293146 m!306945))

(declare-fun m!306947 () Bool)

(assert (=> b!293150 m!306947))

(declare-fun m!306949 () Bool)

(assert (=> b!293150 m!306949))

(declare-fun m!306951 () Bool)

(assert (=> b!293150 m!306951))

(declare-fun m!306953 () Bool)

(assert (=> b!293150 m!306953))

(declare-fun m!306955 () Bool)

(assert (=> b!293149 m!306955))

(declare-fun m!306957 () Bool)

(assert (=> b!293147 m!306957))

(declare-fun m!306959 () Bool)

(assert (=> start!28680 m!306959))

(declare-fun m!306961 () Bool)

(assert (=> start!28680 m!306961))

(declare-fun m!306963 () Bool)

(assert (=> b!293148 m!306963))

(push 1)

(assert (not b!293150))

(assert (not b!293146))

(assert (not b!293147))

(assert (not start!28680))

(assert (not b!293148))

(assert (not b!293149))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!66517 () Bool)

(assert (=> d!66517 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!293147 d!66517))

(declare-fun d!66521 () Bool)

(declare-fun res!154259 () Bool)

(declare-fun e!185416 () Bool)

(assert (=> d!66521 (=> res!154259 e!185416)))

(assert (=> d!66521 (= res!154259 (= (select (arr!7052 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!66521 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!185416)))

(declare-fun b!293209 () Bool)

(declare-fun e!185417 () Bool)

(assert (=> b!293209 (= e!185416 e!185417)))

(declare-fun res!154260 () Bool)

(assert (=> b!293209 (=> (not res!154260) (not e!185417))))

(assert (=> b!293209 (= res!154260 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7404 a!3312)))))

(declare-fun b!293210 () Bool)

(assert (=> b!293210 (= e!185417 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66521 (not res!154259)) b!293209))

(assert (= (and b!293209 res!154260) b!293210))

(declare-fun m!307019 () Bool)

(assert (=> d!66521 m!307019))

(declare-fun m!307021 () Bool)

(assert (=> b!293210 m!307021))

(assert (=> b!293146 d!66521))

(declare-fun d!66523 () Bool)

(declare-fun e!185451 () Bool)

(assert (=> d!66523 e!185451))

(declare-fun c!47059 () Bool)

(declare-fun lt!145352 () SeekEntryResult!2201)

(assert (=> d!66523 (= c!47059 (and (is-Intermediate!2201 lt!145352) (undefined!3013 lt!145352)))))

(declare-fun e!185449 () SeekEntryResult!2201)

(assert (=> d!66523 (= lt!145352 e!185449)))

(declare-fun c!47061 () Bool)

(assert (=> d!66523 (= c!47061 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!145353 () (_ BitVec 64))

(assert (=> d!66523 (= lt!145353 (select (arr!7052 (array!14860 (store (arr!7052 a!3312) i!1256 k!2524) (size!7404 a!3312))) lt!145299))))

(assert (=> d!66523 (validMask!0 mask!3809)))

(assert (=> d!66523 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145299 k!2524 (array!14860 (store (arr!7052 a!3312) i!1256 k!2524) (size!7404 a!3312)) mask!3809) lt!145352)))

(declare-fun b!293265 () Bool)

(assert (=> b!293265 (and (bvsge (index!10976 lt!145352) #b00000000000000000000000000000000) (bvslt (index!10976 lt!145352) (size!7404 (array!14860 (store (arr!7052 a!3312) i!1256 k!2524) (size!7404 a!3312)))))))

(declare-fun res!154282 () Bool)

(assert (=> b!293265 (= res!154282 (= (select (arr!7052 (array!14860 (store (arr!7052 a!3312) i!1256 k!2524) (size!7404 a!3312))) (index!10976 lt!145352)) k!2524))))

(declare-fun e!185450 () Bool)

(assert (=> b!293265 (=> res!154282 e!185450)))

(declare-fun e!185448 () Bool)

(assert (=> b!293265 (= e!185448 e!185450)))

(declare-fun b!293266 () Bool)

(assert (=> b!293266 (and (bvsge (index!10976 lt!145352) #b00000000000000000000000000000000) (bvslt (index!10976 lt!145352) (size!7404 (array!14860 (store (arr!7052 a!3312) i!1256 k!2524) (size!7404 a!3312)))))))

(assert (=> b!293266 (= e!185450 (= (select (arr!7052 (array!14860 (store (arr!7052 a!3312) i!1256 k!2524) (size!7404 a!3312))) (index!10976 lt!145352)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!293267 () Bool)

(declare-fun e!185452 () SeekEntryResult!2201)

(assert (=> b!293267 (= e!185452 (Intermediate!2201 false lt!145299 #b00000000000000000000000000000000))))

(declare-fun b!293268 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293268 (= e!185452 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145299 #b00000000000000000000000000000000 mask!3809) k!2524 (array!14860 (store (arr!7052 a!3312) i!1256 k!2524) (size!7404 a!3312)) mask!3809))))

(declare-fun b!293269 () Bool)

(assert (=> b!293269 (= e!185449 (Intermediate!2201 true lt!145299 #b00000000000000000000000000000000))))

(declare-fun b!293270 () Bool)

(assert (=> b!293270 (= e!185451 e!185448)))

(declare-fun res!154281 () Bool)

(assert (=> b!293270 (= res!154281 (and (is-Intermediate!2201 lt!145352) (not (undefined!3013 lt!145352)) (bvslt (x!29152 lt!145352) #b01111111111111111111111111111110) (bvsge (x!29152 lt!145352) #b00000000000000000000000000000000) (bvsge (x!29152 lt!145352) #b00000000000000000000000000000000)))))

(assert (=> b!293270 (=> (not res!154281) (not e!185448))))

(declare-fun b!293271 () Bool)

(assert (=> b!293271 (and (bvsge (index!10976 lt!145352) #b00000000000000000000000000000000) (bvslt (index!10976 lt!145352) (size!7404 (array!14860 (store (arr!7052 a!3312) i!1256 k!2524) (size!7404 a!3312)))))))

(declare-fun res!154280 () Bool)

(assert (=> b!293271 (= res!154280 (= (select (arr!7052 (array!14860 (store (arr!7052 a!3312) i!1256 k!2524) (size!7404 a!3312))) (index!10976 lt!145352)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!293271 (=> res!154280 e!185450)))

(declare-fun b!293272 () Bool)

(assert (=> b!293272 (= e!185449 e!185452)))

(declare-fun c!47060 () Bool)

(assert (=> b!293272 (= c!47060 (or (= lt!145353 k!2524) (= (bvadd lt!145353 lt!145353) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!293273 () Bool)

(assert (=> b!293273 (= e!185451 (bvsge (x!29152 lt!145352) #b01111111111111111111111111111110))))

(assert (= (and d!66523 c!47061) b!293269))

(assert (= (and d!66523 (not c!47061)) b!293272))

(assert (= (and b!293272 c!47060) b!293267))

(assert (= (and b!293272 (not c!47060)) b!293268))

(assert (= (and d!66523 c!47059) b!293273))

(assert (= (and d!66523 (not c!47059)) b!293270))

(assert (= (and b!293270 res!154281) b!293265))

(assert (= (and b!293265 (not res!154282)) b!293271))

(assert (= (and b!293271 (not res!154280)) b!293266))

(declare-fun m!307037 () Bool)

(assert (=> b!293271 m!307037))

(assert (=> b!293266 m!307037))

(declare-fun m!307039 () Bool)

(assert (=> d!66523 m!307039))

(assert (=> d!66523 m!306959))

(assert (=> b!293265 m!307037))

(declare-fun m!307041 () Bool)

(assert (=> b!293268 m!307041))

(assert (=> b!293268 m!307041))

(declare-fun m!307043 () Bool)

(assert (=> b!293268 m!307043))

(assert (=> b!293150 d!66523))

(declare-fun d!66533 () Bool)

(declare-fun e!185456 () Bool)

(assert (=> d!66533 e!185456))

(declare-fun c!47062 () Bool)

(declare-fun lt!145360 () SeekEntryResult!2201)

(assert (=> d!66533 (= c!47062 (and (is-Intermediate!2201 lt!145360) (undefined!3013 lt!145360)))))

(declare-fun e!185454 () SeekEntryResult!2201)

(assert (=> d!66533 (= lt!145360 e!185454)))

(declare-fun c!47064 () Bool)

(assert (=> d!66533 (= c!47064 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!145361 () (_ BitVec 64))

(assert (=> d!66533 (= lt!145361 (select (arr!7052 a!3312) lt!145299))))

(assert (=> d!66533 (validMask!0 mask!3809)))

(assert (=> d!66533 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145299 k!2524 a!3312 mask!3809) lt!145360)))

(declare-fun b!293274 () Bool)

(assert (=> b!293274 (and (bvsge (index!10976 lt!145360) #b00000000000000000000000000000000) (bvslt (index!10976 lt!145360) (size!7404 a!3312)))))

(declare-fun res!154285 () Bool)

(assert (=> b!293274 (= res!154285 (= (select (arr!7052 a!3312) (index!10976 lt!145360)) k!2524))))

(declare-fun e!185455 () Bool)

(assert (=> b!293274 (=> res!154285 e!185455)))

(declare-fun e!185453 () Bool)

(assert (=> b!293274 (= e!185453 e!185455)))

(declare-fun b!293275 () Bool)

(assert (=> b!293275 (and (bvsge (index!10976 lt!145360) #b00000000000000000000000000000000) (bvslt (index!10976 lt!145360) (size!7404 a!3312)))))

(assert (=> b!293275 (= e!185455 (= (select (arr!7052 a!3312) (index!10976 lt!145360)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!293276 () Bool)

(declare-fun e!185457 () SeekEntryResult!2201)

(assert (=> b!293276 (= e!185457 (Intermediate!2201 false lt!145299 #b00000000000000000000000000000000))))

(declare-fun b!293277 () Bool)

(assert (=> b!293277 (= e!185457 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145299 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!293278 () Bool)

(assert (=> b!293278 (= e!185454 (Intermediate!2201 true lt!145299 #b00000000000000000000000000000000))))

(declare-fun b!293279 () Bool)

(assert (=> b!293279 (= e!185456 e!185453)))

(declare-fun res!154284 () Bool)

(assert (=> b!293279 (= res!154284 (and (is-Intermediate!2201 lt!145360) (not (undefined!3013 lt!145360)) (bvslt (x!29152 lt!145360) #b01111111111111111111111111111110) (bvsge (x!29152 lt!145360) #b00000000000000000000000000000000) (bvsge (x!29152 lt!145360) #b00000000000000000000000000000000)))))

(assert (=> b!293279 (=> (not res!154284) (not e!185453))))

(declare-fun b!293280 () Bool)

(assert (=> b!293280 (and (bvsge (index!10976 lt!145360) #b00000000000000000000000000000000) (bvslt (index!10976 lt!145360) (size!7404 a!3312)))))

(declare-fun res!154283 () Bool)

(assert (=> b!293280 (= res!154283 (= (select (arr!7052 a!3312) (index!10976 lt!145360)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!293280 (=> res!154283 e!185455)))

(declare-fun b!293281 () Bool)

(assert (=> b!293281 (= e!185454 e!185457)))

(declare-fun c!47063 () Bool)

(assert (=> b!293281 (= c!47063 (or (= lt!145361 k!2524) (= (bvadd lt!145361 lt!145361) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!293282 () Bool)

(assert (=> b!293282 (= e!185456 (bvsge (x!29152 lt!145360) #b01111111111111111111111111111110))))

(assert (= (and d!66533 c!47064) b!293278))

(assert (= (and d!66533 (not c!47064)) b!293281))

(assert (= (and b!293281 c!47063) b!293276))

(assert (= (and b!293281 (not c!47063)) b!293277))

(assert (= (and d!66533 c!47062) b!293282))

(assert (= (and d!66533 (not c!47062)) b!293279))

(assert (= (and b!293279 res!154284) b!293274))

(assert (= (and b!293274 (not res!154285)) b!293280))

(assert (= (and b!293280 (not res!154283)) b!293275))

(declare-fun m!307045 () Bool)

(assert (=> b!293280 m!307045))

(assert (=> b!293275 m!307045))

(declare-fun m!307047 () Bool)

(assert (=> d!66533 m!307047))

(assert (=> d!66533 m!306959))

(assert (=> b!293274 m!307045))

(assert (=> b!293277 m!307041))

(assert (=> b!293277 m!307041))

(declare-fun m!307049 () Bool)

(assert (=> b!293277 m!307049))

(assert (=> b!293150 d!66533))

(declare-fun d!66537 () Bool)

(declare-fun lt!145376 () (_ BitVec 32))

(declare-fun lt!145375 () (_ BitVec 32))

(assert (=> d!66537 (= lt!145376 (bvmul (bvxor lt!145375 (bvlshr lt!145375 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66537 (= lt!145375 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66537 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!154286 (let ((h!5269 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29158 (bvmul (bvxor h!5269 (bvlshr h!5269 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29158 (bvlshr x!29158 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!154286 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!154286 #b00000000000000000000000000000000))))))

(assert (=> d!66537 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!145376 (bvlshr lt!145376 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!293150 d!66537))

(declare-fun d!66539 () Bool)

(declare-fun res!154291 () Bool)

(declare-fun e!185475 () Bool)

(assert (=> d!66539 (=> res!154291 e!185475)))

(assert (=> d!66539 (= res!154291 (bvsge #b00000000000000000000000000000000 (size!7404 a!3312)))))

(assert (=> d!66539 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!185475)))

(declare-fun b!293309 () Bool)

(declare-fun e!185474 () Bool)

(assert (=> b!293309 (= e!185475 e!185474)))

(declare-fun c!47076 () Bool)

(assert (=> b!293309 (= c!47076 (validKeyInArray!0 (select (arr!7052 a!3312) #b00000000000000000000000000000000)))))

(declare-fun bm!25663 () Bool)

(declare-fun call!25666 () Bool)

(assert (=> bm!25663 (= call!25666 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!293310 () Bool)

(declare-fun e!185473 () Bool)

(assert (=> b!293310 (= e!185474 e!185473)))

(declare-fun lt!145384 () (_ BitVec 64))

(assert (=> b!293310 (= lt!145384 (select (arr!7052 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9182 0))(
  ( (Unit!9183) )
))
(declare-fun lt!145383 () Unit!9182)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14859 (_ BitVec 64) (_ BitVec 32)) Unit!9182)

(assert (=> b!293310 (= lt!145383 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!145384 #b00000000000000000000000000000000))))

(assert (=> b!293310 (arrayContainsKey!0 a!3312 lt!145384 #b00000000000000000000000000000000)))

(declare-fun lt!145385 () Unit!9182)

(assert (=> b!293310 (= lt!145385 lt!145383)))

(declare-fun res!154292 () Bool)

(assert (=> b!293310 (= res!154292 (= (seekEntryOrOpen!0 (select (arr!7052 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2201 #b00000000000000000000000000000000)))))

(assert (=> b!293310 (=> (not res!154292) (not e!185473))))

(declare-fun b!293311 () Bool)

(assert (=> b!293311 (= e!185473 call!25666)))

(declare-fun b!293312 () Bool)

(assert (=> b!293312 (= e!185474 call!25666)))

(assert (= (and d!66539 (not res!154291)) b!293309))

(assert (= (and b!293309 c!47076) b!293310))

(assert (= (and b!293309 (not c!47076)) b!293312))

(assert (= (and b!293310 res!154292) b!293311))

(assert (= (or b!293311 b!293312) bm!25663))

(assert (=> b!293309 m!307019))

(assert (=> b!293309 m!307019))

(declare-fun m!307063 () Bool)

(assert (=> b!293309 m!307063))

(declare-fun m!307065 () Bool)

(assert (=> bm!25663 m!307065))

(assert (=> b!293310 m!307019))

(declare-fun m!307067 () Bool)

(assert (=> b!293310 m!307067))

(declare-fun m!307069 () Bool)

(assert (=> b!293310 m!307069))

(assert (=> b!293310 m!307019))

(declare-fun m!307071 () Bool)

(assert (=> b!293310 m!307071))

(assert (=> b!293148 d!66539))

(declare-fun d!66545 () Bool)

(assert (=> d!66545 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28680 d!66545))

(declare-fun d!66551 () Bool)

(assert (=> d!66551 (= (array_inv!5015 a!3312) (bvsge (size!7404 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28680 d!66551))

(declare-fun b!293397 () Bool)

(declare-fun e!185527 () SeekEntryResult!2201)

(assert (=> b!293397 (= e!185527 Undefined!2201)))

(declare-fun b!293398 () Bool)

(declare-fun e!185526 () SeekEntryResult!2201)

(declare-fun lt!145424 () SeekEntryResult!2201)

(assert (=> b!293398 (= e!185526 (Found!2201 (index!10976 lt!145424)))))

(declare-fun d!66553 () Bool)

(declare-fun lt!145425 () SeekEntryResult!2201)

(assert (=> d!66553 (and (or (is-Undefined!2201 lt!145425) (not (is-Found!2201 lt!145425)) (and (bvsge (index!10975 lt!145425) #b00000000000000000000000000000000) (bvslt (index!10975 lt!145425) (size!7404 a!3312)))) (or (is-Undefined!2201 lt!145425) (is-Found!2201 lt!145425) (not (is-MissingZero!2201 lt!145425)) (and (bvsge (index!10974 lt!145425) #b00000000000000000000000000000000) (bvslt (index!10974 lt!145425) (size!7404 a!3312)))) (or (is-Undefined!2201 lt!145425) (is-Found!2201 lt!145425) (is-MissingZero!2201 lt!145425) (not (is-MissingVacant!2201 lt!145425)) (and (bvsge (index!10977 lt!145425) #b00000000000000000000000000000000) (bvslt (index!10977 lt!145425) (size!7404 a!3312)))) (or (is-Undefined!2201 lt!145425) (ite (is-Found!2201 lt!145425) (= (select (arr!7052 a!3312) (index!10975 lt!145425)) k!2524) (ite (is-MissingZero!2201 lt!145425) (= (select (arr!7052 a!3312) (index!10974 lt!145425)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2201 lt!145425) (= (select (arr!7052 a!3312) (index!10977 lt!145425)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66553 (= lt!145425 e!185527)))

(declare-fun c!47107 () Bool)

(assert (=> d!66553 (= c!47107 (and (is-Intermediate!2201 lt!145424) (undefined!3013 lt!145424)))))

(assert (=> d!66553 (= lt!145424 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!66553 (validMask!0 mask!3809)))

(assert (=> d!66553 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!145425)))

(declare-fun b!293399 () Bool)

(declare-fun c!47109 () Bool)

(declare-fun lt!145426 () (_ BitVec 64))

(assert (=> b!293399 (= c!47109 (= lt!145426 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!185528 () SeekEntryResult!2201)

(assert (=> b!293399 (= e!185526 e!185528)))

(declare-fun b!293400 () Bool)

(assert (=> b!293400 (= e!185527 e!185526)))

(assert (=> b!293400 (= lt!145426 (select (arr!7052 a!3312) (index!10976 lt!145424)))))

(declare-fun c!47108 () Bool)

(assert (=> b!293400 (= c!47108 (= lt!145426 k!2524))))

(declare-fun b!293401 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14859 (_ BitVec 32)) SeekEntryResult!2201)

(assert (=> b!293401 (= e!185528 (seekKeyOrZeroReturnVacant!0 (x!29152 lt!145424) (index!10976 lt!145424) (index!10976 lt!145424) k!2524 a!3312 mask!3809))))

