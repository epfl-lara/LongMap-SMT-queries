; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29458 () Bool)

(assert start!29458)

(declare-fun b!298029 () Bool)

(declare-fun res!157148 () Bool)

(declare-fun e!188314 () Bool)

(assert (=> b!298029 (=> (not res!157148) (not e!188314))))

(declare-datatypes ((array!15075 0))(
  ( (array!15076 (arr!7142 (Array (_ BitVec 32) (_ BitVec 64))) (size!7494 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15075)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15075 (_ BitVec 32)) Bool)

(assert (=> b!298029 (= res!157148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!298030 () Bool)

(declare-fun res!157151 () Bool)

(declare-fun e!188312 () Bool)

(assert (=> b!298030 (=> (not res!157151) (not e!188312))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15075 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!298030 (= res!157151 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!298031 () Bool)

(assert (=> b!298031 (= e!188312 e!188314)))

(declare-fun res!157149 () Bool)

(assert (=> b!298031 (=> (not res!157149) (not e!188314))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!148142 () Bool)

(declare-datatypes ((SeekEntryResult!2291 0))(
  ( (MissingZero!2291 (index!11337 (_ BitVec 32))) (Found!2291 (index!11338 (_ BitVec 32))) (Intermediate!2291 (undefined!3103 Bool) (index!11339 (_ BitVec 32)) (x!29562 (_ BitVec 32))) (Undefined!2291) (MissingVacant!2291 (index!11340 (_ BitVec 32))) )
))
(declare-fun lt!148144 () SeekEntryResult!2291)

(assert (=> b!298031 (= res!157149 (or lt!148142 (= lt!148144 (MissingVacant!2291 i!1256))))))

(assert (=> b!298031 (= lt!148142 (= lt!148144 (MissingZero!2291 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15075 (_ BitVec 32)) SeekEntryResult!2291)

(assert (=> b!298031 (= lt!148144 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun lt!148146 () SeekEntryResult!2291)

(declare-fun b!298032 () Bool)

(assert (=> b!298032 (= e!188314 (and (not lt!148142) (= lt!148144 (MissingVacant!2291 i!1256)) (is-Intermediate!2291 lt!148146) (undefined!3103 lt!148146)))))

(declare-fun lt!148143 () SeekEntryResult!2291)

(declare-fun lt!148145 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15075 (_ BitVec 32)) SeekEntryResult!2291)

(assert (=> b!298032 (= lt!148143 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148145 k!2524 (array!15076 (store (arr!7142 a!3312) i!1256 k!2524) (size!7494 a!3312)) mask!3809))))

(assert (=> b!298032 (= lt!148146 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148145 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298032 (= lt!148145 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!298033 () Bool)

(declare-fun res!157150 () Bool)

(assert (=> b!298033 (=> (not res!157150) (not e!188312))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!298033 (= res!157150 (validKeyInArray!0 k!2524))))

(declare-fun res!157152 () Bool)

(assert (=> start!29458 (=> (not res!157152) (not e!188312))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29458 (= res!157152 (validMask!0 mask!3809))))

(assert (=> start!29458 e!188312))

(assert (=> start!29458 true))

(declare-fun array_inv!5105 (array!15075) Bool)

(assert (=> start!29458 (array_inv!5105 a!3312)))

(declare-fun b!298034 () Bool)

(declare-fun res!157147 () Bool)

(assert (=> b!298034 (=> (not res!157147) (not e!188312))))

(assert (=> b!298034 (= res!157147 (and (= (size!7494 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7494 a!3312))))))

(assert (= (and start!29458 res!157152) b!298034))

(assert (= (and b!298034 res!157147) b!298033))

(assert (= (and b!298033 res!157150) b!298030))

(assert (= (and b!298030 res!157151) b!298031))

(assert (= (and b!298031 res!157149) b!298029))

(assert (= (and b!298029 res!157148) b!298032))

(declare-fun m!310629 () Bool)

(assert (=> b!298030 m!310629))

(declare-fun m!310631 () Bool)

(assert (=> b!298033 m!310631))

(declare-fun m!310633 () Bool)

(assert (=> b!298029 m!310633))

(declare-fun m!310635 () Bool)

(assert (=> b!298032 m!310635))

(declare-fun m!310637 () Bool)

(assert (=> b!298032 m!310637))

(declare-fun m!310639 () Bool)

(assert (=> b!298032 m!310639))

(declare-fun m!310641 () Bool)

(assert (=> b!298032 m!310641))

(declare-fun m!310643 () Bool)

(assert (=> b!298031 m!310643))

(declare-fun m!310645 () Bool)

(assert (=> start!29458 m!310645))

(declare-fun m!310647 () Bool)

(assert (=> start!29458 m!310647))

(push 1)

(assert (not b!298031))

(assert (not b!298029))

(assert (not start!29458))

(assert (not b!298033))

(assert (not b!298032))

(assert (not b!298030))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!67293 () Bool)

(assert (=> d!67293 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29458 d!67293))

(declare-fun d!67297 () Bool)

(assert (=> d!67297 (= (array_inv!5105 a!3312) (bvsge (size!7494 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29458 d!67297))

(declare-fun b!298143 () Bool)

(declare-fun e!188380 () Bool)

(declare-fun e!188379 () Bool)

(assert (=> b!298143 (= e!188380 e!188379)))

(declare-fun res!157209 () Bool)

(declare-fun lt!148209 () SeekEntryResult!2291)

(assert (=> b!298143 (= res!157209 (and (is-Intermediate!2291 lt!148209) (not (undefined!3103 lt!148209)) (bvslt (x!29562 lt!148209) #b01111111111111111111111111111110) (bvsge (x!29562 lt!148209) #b00000000000000000000000000000000) (bvsge (x!29562 lt!148209) #b00000000000000000000000000000000)))))

(assert (=> b!298143 (=> (not res!157209) (not e!188379))))

(declare-fun b!298144 () Bool)

(assert (=> b!298144 (and (bvsge (index!11339 lt!148209) #b00000000000000000000000000000000) (bvslt (index!11339 lt!148209) (size!7494 (array!15076 (store (arr!7142 a!3312) i!1256 k!2524) (size!7494 a!3312)))))))

(declare-fun res!157208 () Bool)

(assert (=> b!298144 (= res!157208 (= (select (arr!7142 (array!15076 (store (arr!7142 a!3312) i!1256 k!2524) (size!7494 a!3312))) (index!11339 lt!148209)) k!2524))))

(declare-fun e!188376 () Bool)

(assert (=> b!298144 (=> res!157208 e!188376)))

(assert (=> b!298144 (= e!188379 e!188376)))

(declare-fun e!188377 () SeekEntryResult!2291)

(declare-fun b!298145 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298145 (= e!188377 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148145 #b00000000000000000000000000000000 mask!3809) k!2524 (array!15076 (store (arr!7142 a!3312) i!1256 k!2524) (size!7494 a!3312)) mask!3809))))

(declare-fun b!298146 () Bool)

(assert (=> b!298146 (= e!188380 (bvsge (x!29562 lt!148209) #b01111111111111111111111111111110))))

(declare-fun d!67299 () Bool)

(assert (=> d!67299 e!188380))

(declare-fun c!48053 () Bool)

(assert (=> d!67299 (= c!48053 (and (is-Intermediate!2291 lt!148209) (undefined!3103 lt!148209)))))

(declare-fun e!188378 () SeekEntryResult!2291)

(assert (=> d!67299 (= lt!148209 e!188378)))

(declare-fun c!48052 () Bool)

(assert (=> d!67299 (= c!48052 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!148208 () (_ BitVec 64))

(assert (=> d!67299 (= lt!148208 (select (arr!7142 (array!15076 (store (arr!7142 a!3312) i!1256 k!2524) (size!7494 a!3312))) lt!148145))))

(assert (=> d!67299 (validMask!0 mask!3809)))

(assert (=> d!67299 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148145 k!2524 (array!15076 (store (arr!7142 a!3312) i!1256 k!2524) (size!7494 a!3312)) mask!3809) lt!148209)))

(declare-fun b!298147 () Bool)

(assert (=> b!298147 (= e!188377 (Intermediate!2291 false lt!148145 #b00000000000000000000000000000000))))

(declare-fun b!298148 () Bool)

(assert (=> b!298148 (and (bvsge (index!11339 lt!148209) #b00000000000000000000000000000000) (bvslt (index!11339 lt!148209) (size!7494 (array!15076 (store (arr!7142 a!3312) i!1256 k!2524) (size!7494 a!3312)))))))

(assert (=> b!298148 (= e!188376 (= (select (arr!7142 (array!15076 (store (arr!7142 a!3312) i!1256 k!2524) (size!7494 a!3312))) (index!11339 lt!148209)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!298149 () Bool)

(assert (=> b!298149 (= e!188378 (Intermediate!2291 true lt!148145 #b00000000000000000000000000000000))))

(declare-fun b!298150 () Bool)

(assert (=> b!298150 (= e!188378 e!188377)))

(declare-fun c!48054 () Bool)

(assert (=> b!298150 (= c!48054 (or (= lt!148208 k!2524) (= (bvadd lt!148208 lt!148208) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!298151 () Bool)

(assert (=> b!298151 (and (bvsge (index!11339 lt!148209) #b00000000000000000000000000000000) (bvslt (index!11339 lt!148209) (size!7494 (array!15076 (store (arr!7142 a!3312) i!1256 k!2524) (size!7494 a!3312)))))))

(declare-fun res!157207 () Bool)

(assert (=> b!298151 (= res!157207 (= (select (arr!7142 (array!15076 (store (arr!7142 a!3312) i!1256 k!2524) (size!7494 a!3312))) (index!11339 lt!148209)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!298151 (=> res!157207 e!188376)))

(assert (= (and d!67299 c!48052) b!298149))

(assert (= (and d!67299 (not c!48052)) b!298150))

(assert (= (and b!298150 c!48054) b!298147))

(assert (= (and b!298150 (not c!48054)) b!298145))

(assert (= (and d!67299 c!48053) b!298146))

(assert (= (and d!67299 (not c!48053)) b!298143))

(assert (= (and b!298143 res!157209) b!298144))

(assert (= (and b!298144 (not res!157208)) b!298151))

(assert (= (and b!298151 (not res!157207)) b!298148))

(declare-fun m!310727 () Bool)

(assert (=> b!298144 m!310727))

(declare-fun m!310729 () Bool)

(assert (=> d!67299 m!310729))

(assert (=> d!67299 m!310645))

(assert (=> b!298151 m!310727))

(assert (=> b!298148 m!310727))

(declare-fun m!310731 () Bool)

(assert (=> b!298145 m!310731))

(assert (=> b!298145 m!310731))

(declare-fun m!310733 () Bool)

(assert (=> b!298145 m!310733))

(assert (=> b!298032 d!67299))

(declare-fun b!298152 () Bool)

(declare-fun e!188385 () Bool)

(declare-fun e!188384 () Bool)

(assert (=> b!298152 (= e!188385 e!188384)))

(declare-fun res!157212 () Bool)

(declare-fun lt!148211 () SeekEntryResult!2291)

(assert (=> b!298152 (= res!157212 (and (is-Intermediate!2291 lt!148211) (not (undefined!3103 lt!148211)) (bvslt (x!29562 lt!148211) #b01111111111111111111111111111110) (bvsge (x!29562 lt!148211) #b00000000000000000000000000000000) (bvsge (x!29562 lt!148211) #b00000000000000000000000000000000)))))

(assert (=> b!298152 (=> (not res!157212) (not e!188384))))

(declare-fun b!298153 () Bool)

(assert (=> b!298153 (and (bvsge (index!11339 lt!148211) #b00000000000000000000000000000000) (bvslt (index!11339 lt!148211) (size!7494 a!3312)))))

(declare-fun res!157211 () Bool)

(assert (=> b!298153 (= res!157211 (= (select (arr!7142 a!3312) (index!11339 lt!148211)) k!2524))))

(declare-fun e!188381 () Bool)

(assert (=> b!298153 (=> res!157211 e!188381)))

(assert (=> b!298153 (= e!188384 e!188381)))

(declare-fun b!298154 () Bool)

(declare-fun e!188382 () SeekEntryResult!2291)

(assert (=> b!298154 (= e!188382 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148145 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!298155 () Bool)

(assert (=> b!298155 (= e!188385 (bvsge (x!29562 lt!148211) #b01111111111111111111111111111110))))

(declare-fun d!67309 () Bool)

(assert (=> d!67309 e!188385))

(declare-fun c!48056 () Bool)

(assert (=> d!67309 (= c!48056 (and (is-Intermediate!2291 lt!148211) (undefined!3103 lt!148211)))))

(declare-fun e!188383 () SeekEntryResult!2291)

(assert (=> d!67309 (= lt!148211 e!188383)))

(declare-fun c!48055 () Bool)

(assert (=> d!67309 (= c!48055 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!148210 () (_ BitVec 64))

(assert (=> d!67309 (= lt!148210 (select (arr!7142 a!3312) lt!148145))))

(assert (=> d!67309 (validMask!0 mask!3809)))

(assert (=> d!67309 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148145 k!2524 a!3312 mask!3809) lt!148211)))

(declare-fun b!298156 () Bool)

(assert (=> b!298156 (= e!188382 (Intermediate!2291 false lt!148145 #b00000000000000000000000000000000))))

(declare-fun b!298157 () Bool)

(assert (=> b!298157 (and (bvsge (index!11339 lt!148211) #b00000000000000000000000000000000) (bvslt (index!11339 lt!148211) (size!7494 a!3312)))))

(assert (=> b!298157 (= e!188381 (= (select (arr!7142 a!3312) (index!11339 lt!148211)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!298158 () Bool)

(assert (=> b!298158 (= e!188383 (Intermediate!2291 true lt!148145 #b00000000000000000000000000000000))))

(declare-fun b!298159 () Bool)

(assert (=> b!298159 (= e!188383 e!188382)))

(declare-fun c!48057 () Bool)

(assert (=> b!298159 (= c!48057 (or (= lt!148210 k!2524) (= (bvadd lt!148210 lt!148210) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!298160 () Bool)

(assert (=> b!298160 (and (bvsge (index!11339 lt!148211) #b00000000000000000000000000000000) (bvslt (index!11339 lt!148211) (size!7494 a!3312)))))

(declare-fun res!157210 () Bool)

(assert (=> b!298160 (= res!157210 (= (select (arr!7142 a!3312) (index!11339 lt!148211)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!298160 (=> res!157210 e!188381)))

(assert (= (and d!67309 c!48055) b!298158))

(assert (= (and d!67309 (not c!48055)) b!298159))

(assert (= (and b!298159 c!48057) b!298156))

(assert (= (and b!298159 (not c!48057)) b!298154))

(assert (= (and d!67309 c!48056) b!298155))

(assert (= (and d!67309 (not c!48056)) b!298152))

(assert (= (and b!298152 res!157212) b!298153))

(assert (= (and b!298153 (not res!157211)) b!298160))

(assert (= (and b!298160 (not res!157210)) b!298157))

(declare-fun m!310735 () Bool)

(assert (=> b!298153 m!310735))

(declare-fun m!310737 () Bool)

(assert (=> d!67309 m!310737))

(assert (=> d!67309 m!310645))

(assert (=> b!298160 m!310735))

(assert (=> b!298157 m!310735))

(assert (=> b!298154 m!310731))

(assert (=> b!298154 m!310731))

(declare-fun m!310739 () Bool)

(assert (=> b!298154 m!310739))

(assert (=> b!298032 d!67309))

(declare-fun d!67311 () Bool)

(declare-fun lt!148217 () (_ BitVec 32))

(declare-fun lt!148216 () (_ BitVec 32))

(assert (=> d!67311 (= lt!148217 (bvmul (bvxor lt!148216 (bvlshr lt!148216 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67311 (= lt!148216 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67311 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!157213 (let ((h!5304 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29566 (bvmul (bvxor h!5304 (bvlshr h!5304 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29566 (bvlshr x!29566 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!157213 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!157213 #b00000000000000000000000000000000))))))

(assert (=> d!67311 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!148217 (bvlshr lt!148217 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!298032 d!67311))

(declare-fun d!67313 () Bool)

(assert (=> d!67313 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!298033 d!67313))

(declare-fun d!67315 () Bool)

(declare-fun res!157224 () Bool)

(declare-fun e!188400 () Bool)

(assert (=> d!67315 (=> res!157224 e!188400)))

(assert (=> d!67315 (= res!157224 (= (select (arr!7142 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!67315 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!188400)))

(declare-fun b!298183 () Bool)

(declare-fun e!188401 () Bool)

(assert (=> b!298183 (= e!188400 e!188401)))

(declare-fun res!157225 () Bool)

(assert (=> b!298183 (=> (not res!157225) (not e!188401))))

(assert (=> b!298183 (= res!157225 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7494 a!3312)))))

(declare-fun b!298184 () Bool)

(assert (=> b!298184 (= e!188401 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67315 (not res!157224)) b!298183))

(assert (= (and b!298183 res!157225) b!298184))

(declare-fun m!310741 () Bool)

(assert (=> d!67315 m!310741))

(declare-fun m!310743 () Bool)

(assert (=> b!298184 m!310743))

(assert (=> b!298030 d!67315))

(declare-fun b!298247 () Bool)

(declare-fun e!188439 () Bool)

(declare-fun e!188438 () Bool)

(assert (=> b!298247 (= e!188439 e!188438)))

(declare-fun c!48084 () Bool)

(assert (=> b!298247 (= c!48084 (validKeyInArray!0 (select (arr!7142 a!3312) #b00000000000000000000000000000000)))))

(declare-fun d!67317 () Bool)

(declare-fun res!157250 () Bool)

(assert (=> d!67317 (=> res!157250 e!188439)))

(assert (=> d!67317 (= res!157250 (bvsge #b00000000000000000000000000000000 (size!7494 a!3312)))))

(assert (=> d!67317 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!188439)))

(declare-fun b!298248 () Bool)

(declare-fun call!25777 () Bool)

(assert (=> b!298248 (= e!188438 call!25777)))

(declare-fun b!298249 () Bool)

(declare-fun e!188440 () Bool)

(assert (=> b!298249 (= e!188440 call!25777)))

(declare-fun bm!25774 () Bool)

(assert (=> bm!25774 (= call!25777 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!298250 () Bool)

(assert (=> b!298250 (= e!188438 e!188440)))

(declare-fun lt!148242 () (_ BitVec 64))

(assert (=> b!298250 (= lt!148242 (select (arr!7142 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9309 0))(
  ( (Unit!9310) )
))
(declare-fun lt!148241 () Unit!9309)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15075 (_ BitVec 64) (_ BitVec 32)) Unit!9309)

(assert (=> b!298250 (= lt!148241 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!148242 #b00000000000000000000000000000000))))

(assert (=> b!298250 (arrayContainsKey!0 a!3312 lt!148242 #b00000000000000000000000000000000)))

(declare-fun lt!148240 () Unit!9309)

(assert (=> b!298250 (= lt!148240 lt!148241)))

(declare-fun res!157251 () Bool)

(assert (=> b!298250 (= res!157251 (= (seekEntryOrOpen!0 (select (arr!7142 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2291 #b00000000000000000000000000000000)))))

(assert (=> b!298250 (=> (not res!157251) (not e!188440))))

(assert (= (and d!67317 (not res!157250)) b!298247))

(assert (= (and b!298247 c!48084) b!298250))

(assert (= (and b!298247 (not c!48084)) b!298248))

(assert (= (and b!298250 res!157251) b!298249))

(assert (= (or b!298249 b!298248) bm!25774))

(assert (=> b!298247 m!310741))

(assert (=> b!298247 m!310741))

(declare-fun m!310773 () Bool)

(assert (=> b!298247 m!310773))

(declare-fun m!310775 () Bool)

(assert (=> bm!25774 m!310775))

(assert (=> b!298250 m!310741))

(declare-fun m!310777 () Bool)

(assert (=> b!298250 m!310777))

(declare-fun m!310779 () Bool)

(assert (=> b!298250 m!310779))

(assert (=> b!298250 m!310741))

(declare-fun m!310781 () Bool)

(assert (=> b!298250 m!310781))

(assert (=> b!298029 d!67317))

(declare-fun b!298269 () Bool)

(declare-fun e!188455 () SeekEntryResult!2291)

(declare-fun lt!148261 () SeekEntryResult!2291)

(assert (=> b!298269 (= e!188455 (Found!2291 (index!11339 lt!148261)))))

(declare-fun e!188454 () SeekEntryResult!2291)

(declare-fun b!298271 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15075 (_ BitVec 32)) SeekEntryResult!2291)

(assert (=> b!298271 (= e!188454 (seekKeyOrZeroReturnVacant!0 (x!29562 lt!148261) (index!11339 lt!148261) (index!11339 lt!148261) k!2524 a!3312 mask!3809))))

(declare-fun b!298272 () Bool)

(declare-fun e!188453 () SeekEntryResult!2291)

(assert (=> b!298272 (= e!188453 e!188455)))

(declare-fun lt!148263 () (_ BitVec 64))

(assert (=> b!298272 (= lt!148263 (select (arr!7142 a!3312) (index!11339 lt!148261)))))

(declare-fun c!48092 () Bool)

(assert (=> b!298272 (= c!48092 (= lt!148263 k!2524))))

(declare-fun b!298273 () Bool)

(assert (=> b!298273 (= e!188453 Undefined!2291)))

(declare-fun b!298274 () Bool)

(assert (=> b!298274 (= e!188454 (MissingZero!2291 (index!11339 lt!148261)))))

(declare-fun d!67327 () Bool)

(declare-fun lt!148262 () SeekEntryResult!2291)

(assert (=> d!67327 (and (or (is-Undefined!2291 lt!148262) (not (is-Found!2291 lt!148262)) (and (bvsge (index!11338 lt!148262) #b00000000000000000000000000000000) (bvslt (index!11338 lt!148262) (size!7494 a!3312)))) (or (is-Undefined!2291 lt!148262) (is-Found!2291 lt!148262) (not (is-MissingZero!2291 lt!148262)) (and (bvsge (index!11337 lt!148262) #b00000000000000000000000000000000) (bvslt (index!11337 lt!148262) (size!7494 a!3312)))) (or (is-Undefined!2291 lt!148262) (is-Found!2291 lt!148262) (is-MissingZero!2291 lt!148262) (not (is-MissingVacant!2291 lt!148262)) (and (bvsge (index!11340 lt!148262) #b00000000000000000000000000000000) (bvslt (index!11340 lt!148262) (size!7494 a!3312)))) (or (is-Undefined!2291 lt!148262) (ite (is-Found!2291 lt!148262) (= (select (arr!7142 a!3312) (index!11338 lt!148262)) k!2524) (ite (is-MissingZero!2291 lt!148262) (= (select (arr!7142 a!3312) (index!11337 lt!148262)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2291 lt!148262) (= (select (arr!7142 a!3312) (index!11340 lt!148262)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67327 (= lt!148262 e!188453)))

(declare-fun c!48091 () Bool)

(assert (=> d!67327 (= c!48091 (and (is-Intermediate!2291 lt!148261) (undefined!3103 lt!148261)))))

(assert (=> d!67327 (= lt!148261 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!67327 (validMask!0 mask!3809)))

(assert (=> d!67327 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!148262)))

(declare-fun b!298270 () Bool)

(declare-fun c!48093 () Bool)

(assert (=> b!298270 (= c!48093 (= lt!148263 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!298270 (= e!188455 e!188454)))

(assert (= (and d!67327 c!48091) b!298273))

(assert (= (and d!67327 (not c!48091)) b!298272))

(assert (= (and b!298272 c!48092) b!298269))

(assert (= (and b!298272 (not c!48092)) b!298270))

(assert (= (and b!298270 c!48093) b!298274))

(assert (= (and b!298270 (not c!48093)) b!298271))

(declare-fun m!310787 () Bool)

(assert (=> b!298271 m!310787))

(declare-fun m!310789 () Bool)

(assert (=> b!298272 m!310789))

(declare-fun m!310791 () Bool)

(assert (=> d!67327 m!310791))

(declare-fun m!310793 () Bool)

(assert (=> d!67327 m!310793))

(declare-fun m!310795 () Bool)

(assert (=> d!67327 m!310795))

(assert (=> d!67327 m!310641))

(assert (=> d!67327 m!310645))

(assert (=> d!67327 m!310641))

(declare-fun m!310797 () Bool)

(assert (=> d!67327 m!310797))

(assert (=> b!298031 d!67327))

(push 1)

