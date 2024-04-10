; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29074 () Bool)

(assert start!29074)

(declare-fun b!295198 () Bool)

(declare-fun e!186587 () Bool)

(declare-fun e!186586 () Bool)

(assert (=> b!295198 (= e!186587 e!186586)))

(declare-fun res!155151 () Bool)

(assert (=> b!295198 (=> (not res!155151) (not e!186586))))

(declare-datatypes ((SeekEntryResult!2222 0))(
  ( (MissingZero!2222 (index!11058 (_ BitVec 32))) (Found!2222 (index!11059 (_ BitVec 32))) (Intermediate!2222 (undefined!3034 Bool) (index!11060 (_ BitVec 32)) (x!29276 (_ BitVec 32))) (Undefined!2222) (MissingVacant!2222 (index!11061 (_ BitVec 32))) )
))
(declare-fun lt!146351 () SeekEntryResult!2222)

(declare-fun lt!146352 () Bool)

(declare-datatypes ((array!14922 0))(
  ( (array!14923 (arr!7073 (Array (_ BitVec 32) (_ BitVec 64))) (size!7425 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14922)

(declare-fun k!2524 () (_ BitVec 64))

(assert (=> b!295198 (= res!155151 (and (or lt!146352 (not (undefined!3034 lt!146351))) (or lt!146352 (not (= (select (arr!7073 a!3312) (index!11060 lt!146351)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146352 (not (= (select (arr!7073 a!3312) (index!11060 lt!146351)) k!2524))) (not lt!146352)))))

(assert (=> b!295198 (= lt!146352 (not (is-Intermediate!2222 lt!146351)))))

(declare-fun b!295199 () Bool)

(declare-fun e!186588 () Bool)

(declare-fun e!186585 () Bool)

(assert (=> b!295199 (= e!186588 e!186585)))

(declare-fun res!155152 () Bool)

(assert (=> b!295199 (=> (not res!155152) (not e!186585))))

(declare-fun lt!146354 () SeekEntryResult!2222)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!146353 () Bool)

(assert (=> b!295199 (= res!155152 (or lt!146353 (= lt!146354 (MissingVacant!2222 i!1256))))))

(assert (=> b!295199 (= lt!146353 (= lt!146354 (MissingZero!2222 i!1256)))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14922 (_ BitVec 32)) SeekEntryResult!2222)

(assert (=> b!295199 (= lt!146354 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun res!155147 () Bool)

(assert (=> start!29074 (=> (not res!155147) (not e!186588))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29074 (= res!155147 (validMask!0 mask!3809))))

(assert (=> start!29074 e!186588))

(assert (=> start!29074 true))

(declare-fun array_inv!5036 (array!14922) Bool)

(assert (=> start!29074 (array_inv!5036 a!3312)))

(declare-fun b!295200 () Bool)

(declare-fun res!155154 () Bool)

(assert (=> b!295200 (=> (not res!155154) (not e!186588))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295200 (= res!155154 (validKeyInArray!0 k!2524))))

(declare-fun b!295201 () Bool)

(assert (=> b!295201 (= e!186586 (not (= (index!11060 lt!146351) i!1256)))))

(assert (=> b!295201 (= (select (arr!7073 a!3312) (index!11060 lt!146351)) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!295202 () Bool)

(declare-fun res!155148 () Bool)

(assert (=> b!295202 (=> (not res!155148) (not e!186585))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14922 (_ BitVec 32)) Bool)

(assert (=> b!295202 (= res!155148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!295203 () Bool)

(declare-fun res!155150 () Bool)

(assert (=> b!295203 (=> (not res!155150) (not e!186588))))

(declare-fun arrayContainsKey!0 (array!14922 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295203 (= res!155150 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!295204 () Bool)

(declare-fun res!155149 () Bool)

(assert (=> b!295204 (=> (not res!155149) (not e!186588))))

(assert (=> b!295204 (= res!155149 (and (= (size!7425 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7425 a!3312))))))

(declare-fun b!295205 () Bool)

(assert (=> b!295205 (= e!186585 e!186587)))

(declare-fun res!155153 () Bool)

(assert (=> b!295205 (=> (not res!155153) (not e!186587))))

(assert (=> b!295205 (= res!155153 lt!146353)))

(declare-fun lt!146355 () (_ BitVec 32))

(declare-fun lt!146350 () SeekEntryResult!2222)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14922 (_ BitVec 32)) SeekEntryResult!2222)

(assert (=> b!295205 (= lt!146350 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146355 k!2524 (array!14923 (store (arr!7073 a!3312) i!1256 k!2524) (size!7425 a!3312)) mask!3809))))

(assert (=> b!295205 (= lt!146351 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146355 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295205 (= lt!146355 (toIndex!0 k!2524 mask!3809))))

(assert (= (and start!29074 res!155147) b!295204))

(assert (= (and b!295204 res!155149) b!295200))

(assert (= (and b!295200 res!155154) b!295203))

(assert (= (and b!295203 res!155150) b!295199))

(assert (= (and b!295199 res!155152) b!295202))

(assert (= (and b!295202 res!155148) b!295205))

(assert (= (and b!295205 res!155153) b!295198))

(assert (= (and b!295198 res!155151) b!295201))

(declare-fun m!308403 () Bool)

(assert (=> b!295202 m!308403))

(declare-fun m!308405 () Bool)

(assert (=> b!295205 m!308405))

(declare-fun m!308407 () Bool)

(assert (=> b!295205 m!308407))

(declare-fun m!308409 () Bool)

(assert (=> b!295205 m!308409))

(declare-fun m!308411 () Bool)

(assert (=> b!295205 m!308411))

(declare-fun m!308413 () Bool)

(assert (=> b!295198 m!308413))

(assert (=> b!295201 m!308413))

(declare-fun m!308415 () Bool)

(assert (=> b!295203 m!308415))

(declare-fun m!308417 () Bool)

(assert (=> b!295199 m!308417))

(declare-fun m!308419 () Bool)

(assert (=> start!29074 m!308419))

(declare-fun m!308421 () Bool)

(assert (=> start!29074 m!308421))

(declare-fun m!308423 () Bool)

(assert (=> b!295200 m!308423))

(push 1)

(assert (not b!295200))

(assert (not b!295203))

(assert (not b!295202))

(assert (not start!29074))

(assert (not b!295205))

(assert (not b!295199))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!66965 () Bool)

(assert (=> d!66965 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29074 d!66965))

(declare-fun d!66973 () Bool)

(assert (=> d!66973 (= (array_inv!5036 a!3312) (bvsge (size!7425 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29074 d!66973))

(declare-fun d!66975 () Bool)

(declare-fun res!155207 () Bool)

(declare-fun e!186624 () Bool)

(assert (=> d!66975 (=> res!155207 e!186624)))

(assert (=> d!66975 (= res!155207 (= (select (arr!7073 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!66975 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!186624)))

(declare-fun b!295258 () Bool)

(declare-fun e!186625 () Bool)

(assert (=> b!295258 (= e!186624 e!186625)))

(declare-fun res!155208 () Bool)

(assert (=> b!295258 (=> (not res!155208) (not e!186625))))

(assert (=> b!295258 (= res!155208 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7425 a!3312)))))

(declare-fun b!295259 () Bool)

(assert (=> b!295259 (= e!186625 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66975 (not res!155207)) b!295258))

(assert (= (and b!295258 res!155208) b!295259))

(declare-fun m!308469 () Bool)

(assert (=> d!66975 m!308469))

(declare-fun m!308471 () Bool)

(assert (=> b!295259 m!308471))

(assert (=> b!295203 d!66975))

(declare-fun d!66977 () Bool)

(assert (=> d!66977 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!295200 d!66977))

(declare-fun b!295332 () Bool)

(declare-fun e!186667 () Bool)

(declare-fun lt!146419 () SeekEntryResult!2222)

(assert (=> b!295332 (= e!186667 (bvsge (x!29276 lt!146419) #b01111111111111111111111111111110))))

(declare-fun b!295333 () Bool)

(declare-fun e!186669 () SeekEntryResult!2222)

(assert (=> b!295333 (= e!186669 (Intermediate!2222 false lt!146355 #b00000000000000000000000000000000))))

(declare-fun b!295334 () Bool)

(assert (=> b!295334 (and (bvsge (index!11060 lt!146419) #b00000000000000000000000000000000) (bvslt (index!11060 lt!146419) (size!7425 (array!14923 (store (arr!7073 a!3312) i!1256 k!2524) (size!7425 a!3312)))))))

(declare-fun res!155229 () Bool)

(assert (=> b!295334 (= res!155229 (= (select (arr!7073 (array!14923 (store (arr!7073 a!3312) i!1256 k!2524) (size!7425 a!3312))) (index!11060 lt!146419)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!186665 () Bool)

(assert (=> b!295334 (=> res!155229 e!186665)))

(declare-fun b!295335 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295335 (= e!186669 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!146355 #b00000000000000000000000000000000 mask!3809) k!2524 (array!14923 (store (arr!7073 a!3312) i!1256 k!2524) (size!7425 a!3312)) mask!3809))))

(declare-fun d!66979 () Bool)

(assert (=> d!66979 e!186667))

(declare-fun c!47631 () Bool)

(assert (=> d!66979 (= c!47631 (and (is-Intermediate!2222 lt!146419) (undefined!3034 lt!146419)))))

(declare-fun e!186668 () SeekEntryResult!2222)

(assert (=> d!66979 (= lt!146419 e!186668)))

(declare-fun c!47630 () Bool)

(assert (=> d!66979 (= c!47630 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!146420 () (_ BitVec 64))

(assert (=> d!66979 (= lt!146420 (select (arr!7073 (array!14923 (store (arr!7073 a!3312) i!1256 k!2524) (size!7425 a!3312))) lt!146355))))

(assert (=> d!66979 (validMask!0 mask!3809)))

(assert (=> d!66979 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146355 k!2524 (array!14923 (store (arr!7073 a!3312) i!1256 k!2524) (size!7425 a!3312)) mask!3809) lt!146419)))

(declare-fun b!295336 () Bool)

(assert (=> b!295336 (= e!186668 e!186669)))

(declare-fun c!47629 () Bool)

(assert (=> b!295336 (= c!47629 (or (= lt!146420 k!2524) (= (bvadd lt!146420 lt!146420) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!295337 () Bool)

(assert (=> b!295337 (and (bvsge (index!11060 lt!146419) #b00000000000000000000000000000000) (bvslt (index!11060 lt!146419) (size!7425 (array!14923 (store (arr!7073 a!3312) i!1256 k!2524) (size!7425 a!3312)))))))

(declare-fun res!155228 () Bool)

(assert (=> b!295337 (= res!155228 (= (select (arr!7073 (array!14923 (store (arr!7073 a!3312) i!1256 k!2524) (size!7425 a!3312))) (index!11060 lt!146419)) k!2524))))

(assert (=> b!295337 (=> res!155228 e!186665)))

(declare-fun e!186666 () Bool)

(assert (=> b!295337 (= e!186666 e!186665)))

(declare-fun b!295338 () Bool)

(assert (=> b!295338 (= e!186668 (Intermediate!2222 true lt!146355 #b00000000000000000000000000000000))))

(declare-fun b!295339 () Bool)

(assert (=> b!295339 (and (bvsge (index!11060 lt!146419) #b00000000000000000000000000000000) (bvslt (index!11060 lt!146419) (size!7425 (array!14923 (store (arr!7073 a!3312) i!1256 k!2524) (size!7425 a!3312)))))))

(assert (=> b!295339 (= e!186665 (= (select (arr!7073 (array!14923 (store (arr!7073 a!3312) i!1256 k!2524) (size!7425 a!3312))) (index!11060 lt!146419)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!295340 () Bool)

(assert (=> b!295340 (= e!186667 e!186666)))

(declare-fun res!155230 () Bool)

(assert (=> b!295340 (= res!155230 (and (is-Intermediate!2222 lt!146419) (not (undefined!3034 lt!146419)) (bvslt (x!29276 lt!146419) #b01111111111111111111111111111110) (bvsge (x!29276 lt!146419) #b00000000000000000000000000000000) (bvsge (x!29276 lt!146419) #b00000000000000000000000000000000)))))

(assert (=> b!295340 (=> (not res!155230) (not e!186666))))

(assert (= (and d!66979 c!47630) b!295338))

(assert (= (and d!66979 (not c!47630)) b!295336))

(assert (= (and b!295336 c!47629) b!295333))

(assert (= (and b!295336 (not c!47629)) b!295335))

(assert (= (and d!66979 c!47631) b!295332))

(assert (= (and d!66979 (not c!47631)) b!295340))

(assert (= (and b!295340 res!155230) b!295337))

(assert (= (and b!295337 (not res!155228)) b!295334))

(assert (= (and b!295334 (not res!155229)) b!295339))

(declare-fun m!308499 () Bool)

(assert (=> b!295335 m!308499))

(assert (=> b!295335 m!308499))

(declare-fun m!308501 () Bool)

(assert (=> b!295335 m!308501))

(declare-fun m!308503 () Bool)

(assert (=> b!295334 m!308503))

(assert (=> b!295337 m!308503))

(declare-fun m!308505 () Bool)

(assert (=> d!66979 m!308505))

(assert (=> d!66979 m!308419))

(assert (=> b!295339 m!308503))

(assert (=> b!295205 d!66979))

(declare-fun b!295341 () Bool)

(declare-fun e!186672 () Bool)

(declare-fun lt!146421 () SeekEntryResult!2222)

(assert (=> b!295341 (= e!186672 (bvsge (x!29276 lt!146421) #b01111111111111111111111111111110))))

(declare-fun b!295342 () Bool)

(declare-fun e!186674 () SeekEntryResult!2222)

(assert (=> b!295342 (= e!186674 (Intermediate!2222 false lt!146355 #b00000000000000000000000000000000))))

(declare-fun b!295343 () Bool)

(assert (=> b!295343 (and (bvsge (index!11060 lt!146421) #b00000000000000000000000000000000) (bvslt (index!11060 lt!146421) (size!7425 a!3312)))))

(declare-fun res!155232 () Bool)

(assert (=> b!295343 (= res!155232 (= (select (arr!7073 a!3312) (index!11060 lt!146421)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!186670 () Bool)

(assert (=> b!295343 (=> res!155232 e!186670)))

(declare-fun b!295344 () Bool)

(assert (=> b!295344 (= e!186674 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!146355 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun d!66989 () Bool)

(assert (=> d!66989 e!186672))

(declare-fun c!47634 () Bool)

(assert (=> d!66989 (= c!47634 (and (is-Intermediate!2222 lt!146421) (undefined!3034 lt!146421)))))

(declare-fun e!186673 () SeekEntryResult!2222)

(assert (=> d!66989 (= lt!146421 e!186673)))

(declare-fun c!47633 () Bool)

(assert (=> d!66989 (= c!47633 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!146422 () (_ BitVec 64))

(assert (=> d!66989 (= lt!146422 (select (arr!7073 a!3312) lt!146355))))

(assert (=> d!66989 (validMask!0 mask!3809)))

(assert (=> d!66989 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146355 k!2524 a!3312 mask!3809) lt!146421)))

(declare-fun b!295345 () Bool)

(assert (=> b!295345 (= e!186673 e!186674)))

(declare-fun c!47632 () Bool)

(assert (=> b!295345 (= c!47632 (or (= lt!146422 k!2524) (= (bvadd lt!146422 lt!146422) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!295346 () Bool)

(assert (=> b!295346 (and (bvsge (index!11060 lt!146421) #b00000000000000000000000000000000) (bvslt (index!11060 lt!146421) (size!7425 a!3312)))))

(declare-fun res!155231 () Bool)

(assert (=> b!295346 (= res!155231 (= (select (arr!7073 a!3312) (index!11060 lt!146421)) k!2524))))

(assert (=> b!295346 (=> res!155231 e!186670)))

(declare-fun e!186671 () Bool)

(assert (=> b!295346 (= e!186671 e!186670)))

(declare-fun b!295347 () Bool)

(assert (=> b!295347 (= e!186673 (Intermediate!2222 true lt!146355 #b00000000000000000000000000000000))))

(declare-fun b!295348 () Bool)

(assert (=> b!295348 (and (bvsge (index!11060 lt!146421) #b00000000000000000000000000000000) (bvslt (index!11060 lt!146421) (size!7425 a!3312)))))

(assert (=> b!295348 (= e!186670 (= (select (arr!7073 a!3312) (index!11060 lt!146421)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!295349 () Bool)

(assert (=> b!295349 (= e!186672 e!186671)))

(declare-fun res!155233 () Bool)

(assert (=> b!295349 (= res!155233 (and (is-Intermediate!2222 lt!146421) (not (undefined!3034 lt!146421)) (bvslt (x!29276 lt!146421) #b01111111111111111111111111111110) (bvsge (x!29276 lt!146421) #b00000000000000000000000000000000) (bvsge (x!29276 lt!146421) #b00000000000000000000000000000000)))))

(assert (=> b!295349 (=> (not res!155233) (not e!186671))))

(assert (= (and d!66989 c!47633) b!295347))

(assert (= (and d!66989 (not c!47633)) b!295345))

(assert (= (and b!295345 c!47632) b!295342))

(assert (= (and b!295345 (not c!47632)) b!295344))

(assert (= (and d!66989 c!47634) b!295341))

(assert (= (and d!66989 (not c!47634)) b!295349))

(assert (= (and b!295349 res!155233) b!295346))

(assert (= (and b!295346 (not res!155231)) b!295343))

(assert (= (and b!295343 (not res!155232)) b!295348))

(assert (=> b!295344 m!308499))

(assert (=> b!295344 m!308499))

(declare-fun m!308507 () Bool)

(assert (=> b!295344 m!308507))

(declare-fun m!308509 () Bool)

(assert (=> b!295343 m!308509))

(assert (=> b!295346 m!308509))

(declare-fun m!308511 () Bool)

(assert (=> d!66989 m!308511))

(assert (=> d!66989 m!308419))

(assert (=> b!295348 m!308509))

(assert (=> b!295205 d!66989))

(declare-fun d!66991 () Bool)

(declare-fun lt!146432 () (_ BitVec 32))

(declare-fun lt!146431 () (_ BitVec 32))

(assert (=> d!66991 (= lt!146432 (bvmul (bvxor lt!146431 (bvlshr lt!146431 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66991 (= lt!146431 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66991 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!155234 (let ((h!5290 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29282 (bvmul (bvxor h!5290 (bvlshr h!5290 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29282 (bvlshr x!29282 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!155234 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!155234 #b00000000000000000000000000000000))))))

(assert (=> d!66991 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!146432 (bvlshr lt!146432 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!295205 d!66991))

(declare-fun b!295436 () Bool)

(declare-fun e!186727 () SeekEntryResult!2222)

(declare-fun e!186726 () SeekEntryResult!2222)

(assert (=> b!295436 (= e!186727 e!186726)))

(declare-fun lt!146475 () (_ BitVec 64))

(declare-fun lt!146473 () SeekEntryResult!2222)

(assert (=> b!295436 (= lt!146475 (select (arr!7073 a!3312) (index!11060 lt!146473)))))

(declare-fun c!47668 () Bool)

(assert (=> b!295436 (= c!47668 (= lt!146475 k!2524))))

(declare-fun b!295437 () Bool)

(assert (=> b!295437 (= e!186726 (Found!2222 (index!11060 lt!146473)))))

(declare-fun b!295438 () Bool)

(declare-fun c!47667 () Bool)

(assert (=> b!295438 (= c!47667 (= lt!146475 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!186725 () SeekEntryResult!2222)

(assert (=> b!295438 (= e!186726 e!186725)))

(declare-fun b!295439 () Bool)

(assert (=> b!295439 (= e!186725 (MissingZero!2222 (index!11060 lt!146473)))))

(declare-fun d!66993 () Bool)

(declare-fun lt!146474 () SeekEntryResult!2222)

(assert (=> d!66993 (and (or (is-Undefined!2222 lt!146474) (not (is-Found!2222 lt!146474)) (and (bvsge (index!11059 lt!146474) #b00000000000000000000000000000000) (bvslt (index!11059 lt!146474) (size!7425 a!3312)))) (or (is-Undefined!2222 lt!146474) (is-Found!2222 lt!146474) (not (is-MissingZero!2222 lt!146474)) (and (bvsge (index!11058 lt!146474) #b00000000000000000000000000000000) (bvslt (index!11058 lt!146474) (size!7425 a!3312)))) (or (is-Undefined!2222 lt!146474) (is-Found!2222 lt!146474) (is-MissingZero!2222 lt!146474) (not (is-MissingVacant!2222 lt!146474)) (and (bvsge (index!11061 lt!146474) #b00000000000000000000000000000000) (bvslt (index!11061 lt!146474) (size!7425 a!3312)))) (or (is-Undefined!2222 lt!146474) (ite (is-Found!2222 lt!146474) (= (select (arr!7073 a!3312) (index!11059 lt!146474)) k!2524) (ite (is-MissingZero!2222 lt!146474) (= (select (arr!7073 a!3312) (index!11058 lt!146474)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2222 lt!146474) (= (select (arr!7073 a!3312) (index!11061 lt!146474)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66993 (= lt!146474 e!186727)))

(declare-fun c!47669 () Bool)

(assert (=> d!66993 (= c!47669 (and (is-Intermediate!2222 lt!146473) (undefined!3034 lt!146473)))))

(assert (=> d!66993 (= lt!146473 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!66993 (validMask!0 mask!3809)))

(assert (=> d!66993 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!146474)))

(declare-fun b!295440 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14922 (_ BitVec 32)) SeekEntryResult!2222)

(assert (=> b!295440 (= e!186725 (seekKeyOrZeroReturnVacant!0 (x!29276 lt!146473) (index!11060 lt!146473) (index!11060 lt!146473) k!2524 a!3312 mask!3809))))

(declare-fun b!295441 () Bool)

(assert (=> b!295441 (= e!186727 Undefined!2222)))

(assert (= (and d!66993 c!47669) b!295441))

(assert (= (and d!66993 (not c!47669)) b!295436))

(assert (= (and b!295436 c!47668) b!295437))

(assert (= (and b!295436 (not c!47668)) b!295438))

(assert (= (and b!295438 c!47667) b!295439))

(assert (= (and b!295438 (not c!47667)) b!295440))

(declare-fun m!308551 () Bool)

(assert (=> b!295436 m!308551))

(declare-fun m!308553 () Bool)

(assert (=> d!66993 m!308553))

(declare-fun m!308555 () Bool)

(assert (=> d!66993 m!308555))

(assert (=> d!66993 m!308419))

(declare-fun m!308557 () Bool)

(assert (=> d!66993 m!308557))

(assert (=> d!66993 m!308411))

(declare-fun m!308559 () Bool)

(assert (=> d!66993 m!308559))

(assert (=> d!66993 m!308411))

(declare-fun m!308561 () Bool)

(assert (=> b!295440 m!308561))

(assert (=> b!295199 d!66993))

(declare-fun b!295460 () Bool)

(declare-fun e!186745 () Bool)

(declare-fun call!25735 () Bool)

(assert (=> b!295460 (= e!186745 call!25735)))

(declare-fun b!295461 () Bool)

(declare-fun e!186743 () Bool)

(assert (=> b!295461 (= e!186743 call!25735)))

(declare-fun d!67007 () Bool)

(declare-fun res!155271 () Bool)

(declare-fun e!186744 () Bool)

(assert (=> d!67007 (=> res!155271 e!186744)))

(assert (=> d!67007 (= res!155271 (bvsge #b00000000000000000000000000000000 (size!7425 a!3312)))))

(assert (=> d!67007 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!186744)))

(declare-fun b!295462 () Bool)

(assert (=> b!295462 (= e!186745 e!186743)))

(declare-fun lt!146485 () (_ BitVec 64))

(assert (=> b!295462 (= lt!146485 (select (arr!7073 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9222 0))(
  ( (Unit!9223) )
))
(declare-fun lt!146487 () Unit!9222)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14922 (_ BitVec 64) (_ BitVec 32)) Unit!9222)

(assert (=> b!295462 (= lt!146487 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!146485 #b00000000000000000000000000000000))))

(assert (=> b!295462 (arrayContainsKey!0 a!3312 lt!146485 #b00000000000000000000000000000000)))

(declare-fun lt!146486 () Unit!9222)

(assert (=> b!295462 (= lt!146486 lt!146487)))

(declare-fun res!155270 () Bool)

(assert (=> b!295462 (= res!155270 (= (seekEntryOrOpen!0 (select (arr!7073 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2222 #b00000000000000000000000000000000)))))

(assert (=> b!295462 (=> (not res!155270) (not e!186743))))

(declare-fun bm!25732 () Bool)

(assert (=> bm!25732 (= call!25735 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!295463 () Bool)

(assert (=> b!295463 (= e!186744 e!186745)))

(declare-fun c!47673 () Bool)

(assert (=> b!295463 (= c!47673 (validKeyInArray!0 (select (arr!7073 a!3312) #b00000000000000000000000000000000)))))

(assert (= (and d!67007 (not res!155271)) b!295463))

(assert (= (and b!295463 c!47673) b!295462))

(assert (= (and b!295463 (not c!47673)) b!295460))

(assert (= (and b!295462 res!155270) b!295461))

(assert (= (or b!295461 b!295460) bm!25732))

(assert (=> b!295462 m!308469))

(declare-fun m!308577 () Bool)

(assert (=> b!295462 m!308577))

(declare-fun m!308579 () Bool)

(assert (=> b!295462 m!308579))

(assert (=> b!295462 m!308469))

(declare-fun m!308581 () Bool)

(assert (=> b!295462 m!308581))

(declare-fun m!308583 () Bool)

(assert (=> bm!25732 m!308583))

(assert (=> b!295463 m!308469))

(assert (=> b!295463 m!308469))

(declare-fun m!308585 () Bool)

(assert (=> b!295463 m!308585))

(assert (=> b!295202 d!67007))

(push 1)

(assert (not b!295463))

(assert (not d!66979))

(assert (not b!295344))

(assert (not b!295259))

(assert (not b!295335))

(assert (not d!66989))

(assert (not b!295462))

