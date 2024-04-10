; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47298 () Bool)

(assert start!47298)

(declare-fun b!520285 () Bool)

(declare-fun res!318408 () Bool)

(declare-fun e!303592 () Bool)

(assert (=> b!520285 (=> (not res!318408) (not e!303592))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!520285 (= res!318408 (validKeyInArray!0 k!2280))))

(declare-fun b!520286 () Bool)

(declare-fun res!318412 () Bool)

(assert (=> b!520286 (=> (not res!318412) (not e!303592))))

(declare-datatypes ((array!33187 0))(
  ( (array!33188 (arr!15951 (Array (_ BitVec 32) (_ BitVec 64))) (size!16315 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33187)

(declare-fun arrayContainsKey!0 (array!33187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!520286 (= res!318412 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!520287 () Bool)

(declare-datatypes ((Unit!16124 0))(
  ( (Unit!16125) )
))
(declare-fun e!303593 () Unit!16124)

(declare-fun Unit!16126 () Unit!16124)

(assert (=> b!520287 (= e!303593 Unit!16126)))

(declare-fun lt!238288 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4418 0))(
  ( (MissingZero!4418 (index!19872 (_ BitVec 32))) (Found!4418 (index!19873 (_ BitVec 32))) (Intermediate!4418 (undefined!5230 Bool) (index!19874 (_ BitVec 32)) (x!48859 (_ BitVec 32))) (Undefined!4418) (MissingVacant!4418 (index!19875 (_ BitVec 32))) )
))
(declare-fun lt!238290 () SeekEntryResult!4418)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!238284 () Unit!16124)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33187 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16124)

(assert (=> b!520287 (= lt!238284 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!238288 #b00000000000000000000000000000000 (index!19874 lt!238290) (x!48859 lt!238290) mask!3524))))

(declare-fun lt!238286 () (_ BitVec 64))

(declare-fun lt!238289 () array!33187)

(declare-fun res!318403 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33187 (_ BitVec 32)) SeekEntryResult!4418)

(assert (=> b!520287 (= res!318403 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238288 lt!238286 lt!238289 mask!3524) (Intermediate!4418 false (index!19874 lt!238290) (x!48859 lt!238290))))))

(declare-fun e!303594 () Bool)

(assert (=> b!520287 (=> (not res!318403) (not e!303594))))

(assert (=> b!520287 e!303594))

(declare-fun b!520288 () Bool)

(declare-fun res!318407 () Bool)

(assert (=> b!520288 (=> (not res!318407) (not e!303592))))

(assert (=> b!520288 (= res!318407 (validKeyInArray!0 (select (arr!15951 a!3235) j!176)))))

(declare-fun b!520289 () Bool)

(declare-fun res!318406 () Bool)

(declare-fun e!303595 () Bool)

(assert (=> b!520289 (=> (not res!318406) (not e!303595))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33187 (_ BitVec 32)) Bool)

(assert (=> b!520289 (= res!318406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!520290 () Bool)

(declare-fun Unit!16127 () Unit!16124)

(assert (=> b!520290 (= e!303593 Unit!16127)))

(declare-fun b!520291 () Bool)

(assert (=> b!520291 (= e!303592 e!303595)))

(declare-fun res!318410 () Bool)

(assert (=> b!520291 (=> (not res!318410) (not e!303595))))

(declare-fun lt!238283 () SeekEntryResult!4418)

(assert (=> b!520291 (= res!318410 (or (= lt!238283 (MissingZero!4418 i!1204)) (= lt!238283 (MissingVacant!4418 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33187 (_ BitVec 32)) SeekEntryResult!4418)

(assert (=> b!520291 (= lt!238283 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!520292 () Bool)

(declare-fun e!303596 () Bool)

(assert (=> b!520292 (= e!303596 (and (bvsge (index!19874 lt!238290) #b00000000000000000000000000000000) (bvslt (index!19874 lt!238290) (size!16315 a!3235))))))

(assert (=> b!520292 (and (or (= (select (arr!15951 a!3235) (index!19874 lt!238290)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15951 a!3235) (index!19874 lt!238290)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15951 a!3235) (index!19874 lt!238290)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!238291 () Unit!16124)

(assert (=> b!520292 (= lt!238291 e!303593)))

(declare-fun c!61241 () Bool)

(assert (=> b!520292 (= c!61241 (= (select (arr!15951 a!3235) (index!19874 lt!238290)) (select (arr!15951 a!3235) j!176)))))

(assert (=> b!520292 (and (bvslt (x!48859 lt!238290) #b01111111111111111111111111111110) (or (= (select (arr!15951 a!3235) (index!19874 lt!238290)) (select (arr!15951 a!3235) j!176)) (= (select (arr!15951 a!3235) (index!19874 lt!238290)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15951 a!3235) (index!19874 lt!238290)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!520293 () Bool)

(declare-fun res!318409 () Bool)

(assert (=> b!520293 (=> (not res!318409) (not e!303595))))

(declare-datatypes ((List!10109 0))(
  ( (Nil!10106) (Cons!10105 (h!11024 (_ BitVec 64)) (t!16337 List!10109)) )
))
(declare-fun arrayNoDuplicates!0 (array!33187 (_ BitVec 32) List!10109) Bool)

(assert (=> b!520293 (= res!318409 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10106))))

(declare-fun b!520294 () Bool)

(declare-fun res!318411 () Bool)

(assert (=> b!520294 (=> res!318411 e!303596)))

(assert (=> b!520294 (= res!318411 (or (undefined!5230 lt!238290) (not (is-Intermediate!4418 lt!238290))))))

(declare-fun res!318404 () Bool)

(assert (=> start!47298 (=> (not res!318404) (not e!303592))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47298 (= res!318404 (validMask!0 mask!3524))))

(assert (=> start!47298 e!303592))

(assert (=> start!47298 true))

(declare-fun array_inv!11747 (array!33187) Bool)

(assert (=> start!47298 (array_inv!11747 a!3235)))

(declare-fun e!303597 () Bool)

(declare-fun b!520295 () Bool)

(assert (=> b!520295 (= e!303597 (= (seekEntryOrOpen!0 (select (arr!15951 a!3235) j!176) a!3235 mask!3524) (Found!4418 j!176)))))

(declare-fun b!520296 () Bool)

(assert (=> b!520296 (= e!303595 (not e!303596))))

(declare-fun res!318405 () Bool)

(assert (=> b!520296 (=> res!318405 e!303596)))

(declare-fun lt!238287 () (_ BitVec 32))

(assert (=> b!520296 (= res!318405 (= lt!238290 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238287 lt!238286 lt!238289 mask!3524)))))

(assert (=> b!520296 (= lt!238290 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238288 (select (arr!15951 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!520296 (= lt!238287 (toIndex!0 lt!238286 mask!3524))))

(assert (=> b!520296 (= lt!238286 (select (store (arr!15951 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!520296 (= lt!238288 (toIndex!0 (select (arr!15951 a!3235) j!176) mask!3524))))

(assert (=> b!520296 (= lt!238289 (array!33188 (store (arr!15951 a!3235) i!1204 k!2280) (size!16315 a!3235)))))

(assert (=> b!520296 e!303597))

(declare-fun res!318402 () Bool)

(assert (=> b!520296 (=> (not res!318402) (not e!303597))))

(assert (=> b!520296 (= res!318402 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!238285 () Unit!16124)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33187 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16124)

(assert (=> b!520296 (= lt!238285 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!520297 () Bool)

(assert (=> b!520297 (= e!303594 false)))

(declare-fun b!520298 () Bool)

(declare-fun res!318413 () Bool)

(assert (=> b!520298 (=> (not res!318413) (not e!303592))))

(assert (=> b!520298 (= res!318413 (and (= (size!16315 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16315 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16315 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!47298 res!318404) b!520298))

(assert (= (and b!520298 res!318413) b!520288))

(assert (= (and b!520288 res!318407) b!520285))

(assert (= (and b!520285 res!318408) b!520286))

(assert (= (and b!520286 res!318412) b!520291))

(assert (= (and b!520291 res!318410) b!520289))

(assert (= (and b!520289 res!318406) b!520293))

(assert (= (and b!520293 res!318409) b!520296))

(assert (= (and b!520296 res!318402) b!520295))

(assert (= (and b!520296 (not res!318405)) b!520294))

(assert (= (and b!520294 (not res!318411)) b!520292))

(assert (= (and b!520292 c!61241) b!520287))

(assert (= (and b!520292 (not c!61241)) b!520290))

(assert (= (and b!520287 res!318403) b!520297))

(declare-fun m!501291 () Bool)

(assert (=> b!520291 m!501291))

(declare-fun m!501293 () Bool)

(assert (=> b!520286 m!501293))

(declare-fun m!501295 () Bool)

(assert (=> b!520287 m!501295))

(declare-fun m!501297 () Bool)

(assert (=> b!520287 m!501297))

(declare-fun m!501299 () Bool)

(assert (=> b!520292 m!501299))

(declare-fun m!501301 () Bool)

(assert (=> b!520292 m!501301))

(declare-fun m!501303 () Bool)

(assert (=> b!520289 m!501303))

(declare-fun m!501305 () Bool)

(assert (=> b!520296 m!501305))

(declare-fun m!501307 () Bool)

(assert (=> b!520296 m!501307))

(declare-fun m!501309 () Bool)

(assert (=> b!520296 m!501309))

(declare-fun m!501311 () Bool)

(assert (=> b!520296 m!501311))

(assert (=> b!520296 m!501301))

(declare-fun m!501313 () Bool)

(assert (=> b!520296 m!501313))

(assert (=> b!520296 m!501301))

(declare-fun m!501315 () Bool)

(assert (=> b!520296 m!501315))

(assert (=> b!520296 m!501301))

(declare-fun m!501317 () Bool)

(assert (=> b!520296 m!501317))

(declare-fun m!501319 () Bool)

(assert (=> b!520296 m!501319))

(declare-fun m!501321 () Bool)

(assert (=> b!520293 m!501321))

(declare-fun m!501323 () Bool)

(assert (=> start!47298 m!501323))

(declare-fun m!501325 () Bool)

(assert (=> start!47298 m!501325))

(assert (=> b!520288 m!501301))

(assert (=> b!520288 m!501301))

(declare-fun m!501327 () Bool)

(assert (=> b!520288 m!501327))

(declare-fun m!501329 () Bool)

(assert (=> b!520285 m!501329))

(assert (=> b!520295 m!501301))

(assert (=> b!520295 m!501301))

(declare-fun m!501331 () Bool)

(assert (=> b!520295 m!501331))

(push 1)

(assert (not b!520288))

(assert (not b!520289))

(assert (not start!47298))

(assert (not b!520293))

(assert (not b!520291))

(assert (not b!520287))

(assert (not b!520296))

(assert (not b!520295))

(assert (not b!520285))

(assert (not b!520286))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80291 () Bool)

(assert (=> d!80291 (= (validKeyInArray!0 (select (arr!15951 a!3235) j!176)) (and (not (= (select (arr!15951 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15951 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!520288 d!80291))

(declare-fun b!520413 () Bool)

(declare-fun e!303662 () Bool)

(declare-fun e!303661 () Bool)

(assert (=> b!520413 (= e!303662 e!303661)))

(declare-fun c!61257 () Bool)

(assert (=> b!520413 (= c!61257 (validKeyInArray!0 (select (arr!15951 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!80293 () Bool)

(declare-fun res!318500 () Bool)

(declare-fun e!303664 () Bool)

(assert (=> d!80293 (=> res!318500 e!303664)))

(assert (=> d!80293 (= res!318500 (bvsge #b00000000000000000000000000000000 (size!16315 a!3235)))))

(assert (=> d!80293 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10106) e!303664)))

(declare-fun b!520414 () Bool)

(declare-fun e!303663 () Bool)

(declare-fun contains!2762 (List!10109 (_ BitVec 64)) Bool)

(assert (=> b!520414 (= e!303663 (contains!2762 Nil!10106 (select (arr!15951 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!520415 () Bool)

(assert (=> b!520415 (= e!303664 e!303662)))

(declare-fun res!318501 () Bool)

(assert (=> b!520415 (=> (not res!318501) (not e!303662))))

(assert (=> b!520415 (= res!318501 (not e!303663))))

(declare-fun res!318499 () Bool)

(assert (=> b!520415 (=> (not res!318499) (not e!303663))))

(assert (=> b!520415 (= res!318499 (validKeyInArray!0 (select (arr!15951 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!520416 () Bool)

(declare-fun call!31793 () Bool)

(assert (=> b!520416 (= e!303661 call!31793)))

(declare-fun b!520417 () Bool)

(assert (=> b!520417 (= e!303661 call!31793)))

(declare-fun bm!31790 () Bool)

(assert (=> bm!31790 (= call!31793 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!61257 (Cons!10105 (select (arr!15951 a!3235) #b00000000000000000000000000000000) Nil!10106) Nil!10106)))))

(assert (= (and d!80293 (not res!318500)) b!520415))

(assert (= (and b!520415 res!318499) b!520414))

(assert (= (and b!520415 res!318501) b!520413))

(assert (= (and b!520413 c!61257) b!520417))

(assert (= (and b!520413 (not c!61257)) b!520416))

(assert (= (or b!520417 b!520416) bm!31790))

(declare-fun m!501423 () Bool)

(assert (=> b!520413 m!501423))

(assert (=> b!520413 m!501423))

(declare-fun m!501425 () Bool)

(assert (=> b!520413 m!501425))

(assert (=> b!520414 m!501423))

(assert (=> b!520414 m!501423))

(declare-fun m!501427 () Bool)

(assert (=> b!520414 m!501427))

(assert (=> b!520415 m!501423))

(assert (=> b!520415 m!501423))

(assert (=> b!520415 m!501425))

(assert (=> bm!31790 m!501423))

(declare-fun m!501429 () Bool)

(assert (=> bm!31790 m!501429))

(assert (=> b!520293 d!80293))

(declare-fun b!520491 () Bool)

(declare-fun lt!238391 () SeekEntryResult!4418)

(declare-fun e!303708 () SeekEntryResult!4418)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33187 (_ BitVec 32)) SeekEntryResult!4418)

(assert (=> b!520491 (= e!303708 (seekKeyOrZeroReturnVacant!0 (x!48859 lt!238391) (index!19874 lt!238391) (index!19874 lt!238391) (select (arr!15951 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!520492 () Bool)

(declare-fun c!61285 () Bool)

(declare-fun lt!238389 () (_ BitVec 64))

(assert (=> b!520492 (= c!61285 (= lt!238389 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!303709 () SeekEntryResult!4418)

(assert (=> b!520492 (= e!303709 e!303708)))

(declare-fun b!520493 () Bool)

(assert (=> b!520493 (= e!303709 (Found!4418 (index!19874 lt!238391)))))

(declare-fun d!80299 () Bool)

(declare-fun lt!238390 () SeekEntryResult!4418)

(assert (=> d!80299 (and (or (is-Undefined!4418 lt!238390) (not (is-Found!4418 lt!238390)) (and (bvsge (index!19873 lt!238390) #b00000000000000000000000000000000) (bvslt (index!19873 lt!238390) (size!16315 a!3235)))) (or (is-Undefined!4418 lt!238390) (is-Found!4418 lt!238390) (not (is-MissingZero!4418 lt!238390)) (and (bvsge (index!19872 lt!238390) #b00000000000000000000000000000000) (bvslt (index!19872 lt!238390) (size!16315 a!3235)))) (or (is-Undefined!4418 lt!238390) (is-Found!4418 lt!238390) (is-MissingZero!4418 lt!238390) (not (is-MissingVacant!4418 lt!238390)) (and (bvsge (index!19875 lt!238390) #b00000000000000000000000000000000) (bvslt (index!19875 lt!238390) (size!16315 a!3235)))) (or (is-Undefined!4418 lt!238390) (ite (is-Found!4418 lt!238390) (= (select (arr!15951 a!3235) (index!19873 lt!238390)) (select (arr!15951 a!3235) j!176)) (ite (is-MissingZero!4418 lt!238390) (= (select (arr!15951 a!3235) (index!19872 lt!238390)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4418 lt!238390) (= (select (arr!15951 a!3235) (index!19875 lt!238390)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!303710 () SeekEntryResult!4418)

(assert (=> d!80299 (= lt!238390 e!303710)))

(declare-fun c!61284 () Bool)

(assert (=> d!80299 (= c!61284 (and (is-Intermediate!4418 lt!238391) (undefined!5230 lt!238391)))))

(assert (=> d!80299 (= lt!238391 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15951 a!3235) j!176) mask!3524) (select (arr!15951 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!80299 (validMask!0 mask!3524)))

(assert (=> d!80299 (= (seekEntryOrOpen!0 (select (arr!15951 a!3235) j!176) a!3235 mask!3524) lt!238390)))

(declare-fun b!520494 () Bool)

(assert (=> b!520494 (= e!303710 e!303709)))

(assert (=> b!520494 (= lt!238389 (select (arr!15951 a!3235) (index!19874 lt!238391)))))

(declare-fun c!61286 () Bool)

(assert (=> b!520494 (= c!61286 (= lt!238389 (select (arr!15951 a!3235) j!176)))))

(declare-fun b!520495 () Bool)

(assert (=> b!520495 (= e!303710 Undefined!4418)))

(declare-fun b!520496 () Bool)

(assert (=> b!520496 (= e!303708 (MissingZero!4418 (index!19874 lt!238391)))))

(assert (= (and d!80299 c!61284) b!520495))

(assert (= (and d!80299 (not c!61284)) b!520494))

(assert (= (and b!520494 c!61286) b!520493))

(assert (= (and b!520494 (not c!61286)) b!520492))

(assert (= (and b!520492 c!61285) b!520496))

(assert (= (and b!520492 (not c!61285)) b!520491))

(assert (=> b!520491 m!501301))

(declare-fun m!501483 () Bool)

(assert (=> b!520491 m!501483))

(declare-fun m!501485 () Bool)

(assert (=> d!80299 m!501485))

(declare-fun m!501487 () Bool)

(assert (=> d!80299 m!501487))

(assert (=> d!80299 m!501301))

(assert (=> d!80299 m!501313))

(declare-fun m!501489 () Bool)

(assert (=> d!80299 m!501489))

(assert (=> d!80299 m!501313))

(assert (=> d!80299 m!501301))

(declare-fun m!501491 () Bool)

(assert (=> d!80299 m!501491))

(assert (=> d!80299 m!501323))

(declare-fun m!501493 () Bool)

(assert (=> b!520494 m!501493))

(assert (=> b!520295 d!80299))

(declare-fun b!520523 () Bool)

(declare-fun e!303729 () Bool)

(declare-fun call!31799 () Bool)

(assert (=> b!520523 (= e!303729 call!31799)))

(declare-fun b!520524 () Bool)

(declare-fun e!303730 () Bool)

(assert (=> b!520524 (= e!303730 call!31799)))

(declare-fun b!520525 () Bool)

(declare-fun e!303728 () Bool)

(assert (=> b!520525 (= e!303728 e!303729)))

(declare-fun c!61295 () Bool)

(assert (=> b!520525 (= c!61295 (validKeyInArray!0 (select (arr!15951 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!520526 () Bool)

(assert (=> b!520526 (= e!303729 e!303730)))

(declare-fun lt!238416 () (_ BitVec 64))

(assert (=> b!520526 (= lt!238416 (select (arr!15951 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!238414 () Unit!16124)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33187 (_ BitVec 64) (_ BitVec 32)) Unit!16124)

(assert (=> b!520526 (= lt!238414 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!238416 #b00000000000000000000000000000000))))

(assert (=> b!520526 (arrayContainsKey!0 a!3235 lt!238416 #b00000000000000000000000000000000)))

(declare-fun lt!238415 () Unit!16124)

(assert (=> b!520526 (= lt!238415 lt!238414)))

(declare-fun res!318534 () Bool)

(assert (=> b!520526 (= res!318534 (= (seekEntryOrOpen!0 (select (arr!15951 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4418 #b00000000000000000000000000000000)))))

(assert (=> b!520526 (=> (not res!318534) (not e!303730))))

(declare-fun bm!31796 () Bool)

(assert (=> bm!31796 (= call!31799 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!80313 () Bool)

(declare-fun res!318535 () Bool)

(assert (=> d!80313 (=> res!318535 e!303728)))

(assert (=> d!80313 (= res!318535 (bvsge #b00000000000000000000000000000000 (size!16315 a!3235)))))

(assert (=> d!80313 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!303728)))

(assert (= (and d!80313 (not res!318535)) b!520525))

(assert (= (and b!520525 c!61295) b!520526))

(assert (= (and b!520525 (not c!61295)) b!520523))

(assert (= (and b!520526 res!318534) b!520524))

(assert (= (or b!520524 b!520523) bm!31796))

(assert (=> b!520525 m!501423))

(assert (=> b!520525 m!501423))

(assert (=> b!520525 m!501425))

(assert (=> b!520526 m!501423))

(declare-fun m!501505 () Bool)

(assert (=> b!520526 m!501505))

(declare-fun m!501507 () Bool)

(assert (=> b!520526 m!501507))

(assert (=> b!520526 m!501423))

(declare-fun m!501509 () Bool)

(assert (=> b!520526 m!501509))

(declare-fun m!501511 () Bool)

(assert (=> bm!31796 m!501511))

(assert (=> b!520289 d!80313))

(declare-fun b!520527 () Bool)

(declare-fun e!303731 () SeekEntryResult!4418)

(declare-fun lt!238419 () SeekEntryResult!4418)

(assert (=> b!520527 (= e!303731 (seekKeyOrZeroReturnVacant!0 (x!48859 lt!238419) (index!19874 lt!238419) (index!19874 lt!238419) k!2280 a!3235 mask!3524))))

(declare-fun b!520528 () Bool)

(declare-fun c!61297 () Bool)

(declare-fun lt!238417 () (_ BitVec 64))

(assert (=> b!520528 (= c!61297 (= lt!238417 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!303732 () SeekEntryResult!4418)

(assert (=> b!520528 (= e!303732 e!303731)))

(declare-fun b!520529 () Bool)

(assert (=> b!520529 (= e!303732 (Found!4418 (index!19874 lt!238419)))))

(declare-fun d!80323 () Bool)

(declare-fun lt!238418 () SeekEntryResult!4418)

(assert (=> d!80323 (and (or (is-Undefined!4418 lt!238418) (not (is-Found!4418 lt!238418)) (and (bvsge (index!19873 lt!238418) #b00000000000000000000000000000000) (bvslt (index!19873 lt!238418) (size!16315 a!3235)))) (or (is-Undefined!4418 lt!238418) (is-Found!4418 lt!238418) (not (is-MissingZero!4418 lt!238418)) (and (bvsge (index!19872 lt!238418) #b00000000000000000000000000000000) (bvslt (index!19872 lt!238418) (size!16315 a!3235)))) (or (is-Undefined!4418 lt!238418) (is-Found!4418 lt!238418) (is-MissingZero!4418 lt!238418) (not (is-MissingVacant!4418 lt!238418)) (and (bvsge (index!19875 lt!238418) #b00000000000000000000000000000000) (bvslt (index!19875 lt!238418) (size!16315 a!3235)))) (or (is-Undefined!4418 lt!238418) (ite (is-Found!4418 lt!238418) (= (select (arr!15951 a!3235) (index!19873 lt!238418)) k!2280) (ite (is-MissingZero!4418 lt!238418) (= (select (arr!15951 a!3235) (index!19872 lt!238418)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4418 lt!238418) (= (select (arr!15951 a!3235) (index!19875 lt!238418)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!303733 () SeekEntryResult!4418)

(assert (=> d!80323 (= lt!238418 e!303733)))

(declare-fun c!61296 () Bool)

(assert (=> d!80323 (= c!61296 (and (is-Intermediate!4418 lt!238419) (undefined!5230 lt!238419)))))

(assert (=> d!80323 (= lt!238419 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!80323 (validMask!0 mask!3524)))

(assert (=> d!80323 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!238418)))

(declare-fun b!520530 () Bool)

(assert (=> b!520530 (= e!303733 e!303732)))

(assert (=> b!520530 (= lt!238417 (select (arr!15951 a!3235) (index!19874 lt!238419)))))

(declare-fun c!61298 () Bool)

(assert (=> b!520530 (= c!61298 (= lt!238417 k!2280))))

(declare-fun b!520531 () Bool)

(assert (=> b!520531 (= e!303733 Undefined!4418)))

(declare-fun b!520532 () Bool)

(assert (=> b!520532 (= e!303731 (MissingZero!4418 (index!19874 lt!238419)))))

(assert (= (and d!80323 c!61296) b!520531))

(assert (= (and d!80323 (not c!61296)) b!520530))

(assert (= (and b!520530 c!61298) b!520529))

(assert (= (and b!520530 (not c!61298)) b!520528))

(assert (= (and b!520528 c!61297) b!520532))

(assert (= (and b!520528 (not c!61297)) b!520527))

(declare-fun m!501513 () Bool)

(assert (=> b!520527 m!501513))

(declare-fun m!501515 () Bool)

(assert (=> d!80323 m!501515))

(declare-fun m!501517 () Bool)

(assert (=> d!80323 m!501517))

(declare-fun m!501519 () Bool)

(assert (=> d!80323 m!501519))

(declare-fun m!501521 () Bool)

(assert (=> d!80323 m!501521))

(assert (=> d!80323 m!501519))

(declare-fun m!501523 () Bool)

(assert (=> d!80323 m!501523))

(assert (=> d!80323 m!501323))

(declare-fun m!501525 () Bool)

(assert (=> b!520530 m!501525))

(assert (=> b!520291 d!80323))

(declare-fun d!80325 () Bool)

(declare-fun lt!238425 () (_ BitVec 32))

(declare-fun lt!238424 () (_ BitVec 32))

(assert (=> d!80325 (= lt!238425 (bvmul (bvxor lt!238424 (bvlshr lt!238424 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80325 (= lt!238424 ((_ extract 31 0) (bvand (bvxor (select (arr!15951 a!3235) j!176) (bvlshr (select (arr!15951 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80325 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!318536 (let ((h!11029 ((_ extract 31 0) (bvand (bvxor (select (arr!15951 a!3235) j!176) (bvlshr (select (arr!15951 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48866 (bvmul (bvxor h!11029 (bvlshr h!11029 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48866 (bvlshr x!48866 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!318536 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!318536 #b00000000000000000000000000000000))))))

(assert (=> d!80325 (= (toIndex!0 (select (arr!15951 a!3235) j!176) mask!3524) (bvand (bvxor lt!238425 (bvlshr lt!238425 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!520296 d!80325))

(declare-fun d!80327 () Bool)

(declare-fun lt!238427 () (_ BitVec 32))

(declare-fun lt!238426 () (_ BitVec 32))

(assert (=> d!80327 (= lt!238427 (bvmul (bvxor lt!238426 (bvlshr lt!238426 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80327 (= lt!238426 ((_ extract 31 0) (bvand (bvxor lt!238286 (bvlshr lt!238286 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80327 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!318536 (let ((h!11029 ((_ extract 31 0) (bvand (bvxor lt!238286 (bvlshr lt!238286 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48866 (bvmul (bvxor h!11029 (bvlshr h!11029 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48866 (bvlshr x!48866 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!318536 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!318536 #b00000000000000000000000000000000))))))

(assert (=> d!80327 (= (toIndex!0 lt!238286 mask!3524) (bvand (bvxor lt!238427 (bvlshr lt!238427 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!520296 d!80327))

(declare-fun b!520533 () Bool)

(declare-fun e!303735 () Bool)

(declare-fun call!31800 () Bool)

(assert (=> b!520533 (= e!303735 call!31800)))

(declare-fun b!520534 () Bool)

(declare-fun e!303736 () Bool)

(assert (=> b!520534 (= e!303736 call!31800)))

(declare-fun b!520535 () Bool)

(declare-fun e!303734 () Bool)

(assert (=> b!520535 (= e!303734 e!303735)))

(declare-fun c!61299 () Bool)

(assert (=> b!520535 (= c!61299 (validKeyInArray!0 (select (arr!15951 a!3235) j!176)))))

(declare-fun b!520536 () Bool)

(assert (=> b!520536 (= e!303735 e!303736)))

(declare-fun lt!238430 () (_ BitVec 64))

(assert (=> b!520536 (= lt!238430 (select (arr!15951 a!3235) j!176))))

(declare-fun lt!238428 () Unit!16124)

(assert (=> b!520536 (= lt!238428 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!238430 j!176))))

(assert (=> b!520536 (arrayContainsKey!0 a!3235 lt!238430 #b00000000000000000000000000000000)))

(declare-fun lt!238429 () Unit!16124)

(assert (=> b!520536 (= lt!238429 lt!238428)))

(declare-fun res!318537 () Bool)

(assert (=> b!520536 (= res!318537 (= (seekEntryOrOpen!0 (select (arr!15951 a!3235) j!176) a!3235 mask!3524) (Found!4418 j!176)))))

(assert (=> b!520536 (=> (not res!318537) (not e!303736))))

(declare-fun bm!31797 () Bool)

(assert (=> bm!31797 (= call!31800 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!80329 () Bool)

(declare-fun res!318538 () Bool)

(assert (=> d!80329 (=> res!318538 e!303734)))

(assert (=> d!80329 (= res!318538 (bvsge j!176 (size!16315 a!3235)))))

(assert (=> d!80329 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!303734)))

(assert (= (and d!80329 (not res!318538)) b!520535))

(assert (= (and b!520535 c!61299) b!520536))

(assert (= (and b!520535 (not c!61299)) b!520533))

(assert (= (and b!520536 res!318537) b!520534))

(assert (= (or b!520534 b!520533) bm!31797))

(assert (=> b!520535 m!501301))

(assert (=> b!520535 m!501301))

(assert (=> b!520535 m!501327))

(assert (=> b!520536 m!501301))

(declare-fun m!501527 () Bool)

(assert (=> b!520536 m!501527))

(declare-fun m!501529 () Bool)

(assert (=> b!520536 m!501529))

(assert (=> b!520536 m!501301))

(assert (=> b!520536 m!501331))

(declare-fun m!501531 () Bool)

(assert (=> bm!31797 m!501531))

(assert (=> b!520296 d!80329))

(declare-fun b!520637 () Bool)

(declare-fun e!303801 () Bool)

(declare-fun e!303797 () Bool)

(assert (=> b!520637 (= e!303801 e!303797)))

(declare-fun res!318573 () Bool)

(declare-fun lt!238471 () SeekEntryResult!4418)

(assert (=> b!520637 (= res!318573 (and (is-Intermediate!4418 lt!238471) (not (undefined!5230 lt!238471)) (bvslt (x!48859 lt!238471) #b01111111111111111111111111111110) (bvsge (x!48859 lt!238471) #b00000000000000000000000000000000) (bvsge (x!48859 lt!238471) #b00000000000000000000000000000000)))))

(assert (=> b!520637 (=> (not res!318573) (not e!303797))))

(declare-fun b!520638 () Bool)

(declare-fun e!303800 () SeekEntryResult!4418)

(assert (=> b!520638 (= e!303800 (Intermediate!4418 false lt!238287 #b00000000000000000000000000000000))))

(declare-fun b!520639 () Bool)

(assert (=> b!520639 (and (bvsge (index!19874 lt!238471) #b00000000000000000000000000000000) (bvslt (index!19874 lt!238471) (size!16315 lt!238289)))))

(declare-fun res!318572 () Bool)

(assert (=> b!520639 (= res!318572 (= (select (arr!15951 lt!238289) (index!19874 lt!238471)) lt!238286))))

(declare-fun e!303798 () Bool)

(assert (=> b!520639 (=> res!318572 e!303798)))

(assert (=> b!520639 (= e!303797 e!303798)))

(declare-fun b!520640 () Bool)

(assert (=> b!520640 (and (bvsge (index!19874 lt!238471) #b00000000000000000000000000000000) (bvslt (index!19874 lt!238471) (size!16315 lt!238289)))))

(declare-fun res!318571 () Bool)

(assert (=> b!520640 (= res!318571 (= (select (arr!15951 lt!238289) (index!19874 lt!238471)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!520640 (=> res!318571 e!303798)))

(declare-fun b!520641 () Bool)

(assert (=> b!520641 (= e!303801 (bvsge (x!48859 lt!238471) #b01111111111111111111111111111110))))

(declare-fun b!520642 () Bool)

(declare-fun e!303799 () SeekEntryResult!4418)

(assert (=> b!520642 (= e!303799 e!303800)))

(declare-fun c!61334 () Bool)

(declare-fun lt!238470 () (_ BitVec 64))

(assert (=> b!520642 (= c!61334 (or (= lt!238470 lt!238286) (= (bvadd lt!238470 lt!238470) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!80331 () Bool)

(assert (=> d!80331 e!303801))

(declare-fun c!61335 () Bool)

(assert (=> d!80331 (= c!61335 (and (is-Intermediate!4418 lt!238471) (undefined!5230 lt!238471)))))

(assert (=> d!80331 (= lt!238471 e!303799)))

(declare-fun c!61336 () Bool)

(assert (=> d!80331 (= c!61336 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80331 (= lt!238470 (select (arr!15951 lt!238289) lt!238287))))

(assert (=> d!80331 (validMask!0 mask!3524)))

(assert (=> d!80331 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238287 lt!238286 lt!238289 mask!3524) lt!238471)))

(declare-fun b!520643 () Bool)

(assert (=> b!520643 (and (bvsge (index!19874 lt!238471) #b00000000000000000000000000000000) (bvslt (index!19874 lt!238471) (size!16315 lt!238289)))))

(assert (=> b!520643 (= e!303798 (= (select (arr!15951 lt!238289) (index!19874 lt!238471)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!520644 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!520644 (= e!303800 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!238287 #b00000000000000000000000000000000 mask!3524) lt!238286 lt!238289 mask!3524))))

(declare-fun b!520645 () Bool)

(assert (=> b!520645 (= e!303799 (Intermediate!4418 true lt!238287 #b00000000000000000000000000000000))))

(assert (= (and d!80331 c!61336) b!520645))

(assert (= (and d!80331 (not c!61336)) b!520642))

(assert (= (and b!520642 c!61334) b!520638))

(assert (= (and b!520642 (not c!61334)) b!520644))

(assert (= (and d!80331 c!61335) b!520641))

(assert (= (and d!80331 (not c!61335)) b!520637))

(assert (= (and b!520637 res!318573) b!520639))

(assert (= (and b!520639 (not res!318572)) b!520640))

(assert (= (and b!520640 (not res!318571)) b!520643))

(declare-fun m!501593 () Bool)

(assert (=> b!520644 m!501593))

(assert (=> b!520644 m!501593))

(declare-fun m!501595 () Bool)

(assert (=> b!520644 m!501595))

(declare-fun m!501597 () Bool)

(assert (=> b!520640 m!501597))

(assert (=> b!520639 m!501597))

(assert (=> b!520643 m!501597))

(declare-fun m!501599 () Bool)

(assert (=> d!80331 m!501599))

(assert (=> d!80331 m!501323))

(assert (=> b!520296 d!80331))

(declare-fun d!80351 () Bool)

(assert (=> d!80351 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!238474 () Unit!16124)

(declare-fun choose!38 (array!33187 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16124)

(assert (=> d!80351 (= lt!238474 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80351 (validMask!0 mask!3524)))

(assert (=> d!80351 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!238474)))

(declare-fun bs!16389 () Bool)

(assert (= bs!16389 d!80351))

(assert (=> bs!16389 m!501315))

(declare-fun m!501601 () Bool)

(assert (=> bs!16389 m!501601))

(assert (=> bs!16389 m!501323))

(assert (=> b!520296 d!80351))

(declare-fun b!520646 () Bool)

(declare-fun e!303806 () Bool)

(declare-fun e!303802 () Bool)

(assert (=> b!520646 (= e!303806 e!303802)))

(declare-fun res!318576 () Bool)

(declare-fun lt!238476 () SeekEntryResult!4418)

(assert (=> b!520646 (= res!318576 (and (is-Intermediate!4418 lt!238476) (not (undefined!5230 lt!238476)) (bvslt (x!48859 lt!238476) #b01111111111111111111111111111110) (bvsge (x!48859 lt!238476) #b00000000000000000000000000000000) (bvsge (x!48859 lt!238476) #b00000000000000000000000000000000)))))

(assert (=> b!520646 (=> (not res!318576) (not e!303802))))

(declare-fun b!520647 () Bool)

(declare-fun e!303805 () SeekEntryResult!4418)

(assert (=> b!520647 (= e!303805 (Intermediate!4418 false lt!238288 #b00000000000000000000000000000000))))

(declare-fun b!520648 () Bool)

(assert (=> b!520648 (and (bvsge (index!19874 lt!238476) #b00000000000000000000000000000000) (bvslt (index!19874 lt!238476) (size!16315 a!3235)))))

(declare-fun res!318575 () Bool)

(assert (=> b!520648 (= res!318575 (= (select (arr!15951 a!3235) (index!19874 lt!238476)) (select (arr!15951 a!3235) j!176)))))

(declare-fun e!303803 () Bool)

(assert (=> b!520648 (=> res!318575 e!303803)))

(assert (=> b!520648 (= e!303802 e!303803)))

(declare-fun b!520649 () Bool)

(assert (=> b!520649 (and (bvsge (index!19874 lt!238476) #b00000000000000000000000000000000) (bvslt (index!19874 lt!238476) (size!16315 a!3235)))))

(declare-fun res!318574 () Bool)

(assert (=> b!520649 (= res!318574 (= (select (arr!15951 a!3235) (index!19874 lt!238476)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!520649 (=> res!318574 e!303803)))

(declare-fun b!520650 () Bool)

(assert (=> b!520650 (= e!303806 (bvsge (x!48859 lt!238476) #b01111111111111111111111111111110))))

(declare-fun b!520651 () Bool)

(declare-fun e!303804 () SeekEntryResult!4418)

(assert (=> b!520651 (= e!303804 e!303805)))

(declare-fun c!61337 () Bool)

(declare-fun lt!238475 () (_ BitVec 64))

(assert (=> b!520651 (= c!61337 (or (= lt!238475 (select (arr!15951 a!3235) j!176)) (= (bvadd lt!238475 lt!238475) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!80355 () Bool)

(assert (=> d!80355 e!303806))

(declare-fun c!61338 () Bool)

(assert (=> d!80355 (= c!61338 (and (is-Intermediate!4418 lt!238476) (undefined!5230 lt!238476)))))

(assert (=> d!80355 (= lt!238476 e!303804)))

(declare-fun c!61339 () Bool)

(assert (=> d!80355 (= c!61339 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80355 (= lt!238475 (select (arr!15951 a!3235) lt!238288))))

(assert (=> d!80355 (validMask!0 mask!3524)))

(assert (=> d!80355 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238288 (select (arr!15951 a!3235) j!176) a!3235 mask!3524) lt!238476)))

(declare-fun b!520652 () Bool)

(assert (=> b!520652 (and (bvsge (index!19874 lt!238476) #b00000000000000000000000000000000) (bvslt (index!19874 lt!238476) (size!16315 a!3235)))))

(assert (=> b!520652 (= e!303803 (= (select (arr!15951 a!3235) (index!19874 lt!238476)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!520653 () Bool)

(assert (=> b!520653 (= e!303805 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!238288 #b00000000000000000000000000000000 mask!3524) (select (arr!15951 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!520654 () Bool)

(assert (=> b!520654 (= e!303804 (Intermediate!4418 true lt!238288 #b00000000000000000000000000000000))))

(assert (= (and d!80355 c!61339) b!520654))

(assert (= (and d!80355 (not c!61339)) b!520651))

(assert (= (and b!520651 c!61337) b!520647))

(assert (= (and b!520651 (not c!61337)) b!520653))

(assert (= (and d!80355 c!61338) b!520650))

(assert (= (and d!80355 (not c!61338)) b!520646))

(assert (= (and b!520646 res!318576) b!520648))

(assert (= (and b!520648 (not res!318575)) b!520649))

(assert (= (and b!520649 (not res!318574)) b!520652))

(declare-fun m!501603 () Bool)

(assert (=> b!520653 m!501603))

(assert (=> b!520653 m!501603))

(assert (=> b!520653 m!501301))

(declare-fun m!501605 () Bool)

(assert (=> b!520653 m!501605))

(declare-fun m!501607 () Bool)

(assert (=> b!520649 m!501607))

(assert (=> b!520648 m!501607))

(assert (=> b!520652 m!501607))

(declare-fun m!501609 () Bool)

(assert (=> d!80355 m!501609))

(assert (=> d!80355 m!501323))

(assert (=> b!520296 d!80355))

(declare-fun d!80359 () Bool)

(assert (=> d!80359 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!520285 d!80359))

(declare-fun d!80361 () Bool)

(declare-fun e!303826 () Bool)

(assert (=> d!80361 e!303826))

(declare-fun res!318593 () Bool)

(assert (=> d!80361 (=> (not res!318593) (not e!303826))))

(assert (=> d!80361 (= res!318593 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16315 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16315 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16315 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16315 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16315 a!3235))))))

(declare-fun lt!238482 () Unit!16124)

(declare-fun choose!47 (array!33187 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16124)

(assert (=> d!80361 (= lt!238482 (choose!47 a!3235 i!1204 k!2280 j!176 lt!238288 #b00000000000000000000000000000000 (index!19874 lt!238290) (x!48859 lt!238290) mask!3524))))

(assert (=> d!80361 (validMask!0 mask!3524)))

(assert (=> d!80361 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!238288 #b00000000000000000000000000000000 (index!19874 lt!238290) (x!48859 lt!238290) mask!3524) lt!238482)))

(declare-fun b!520677 () Bool)

(assert (=> b!520677 (= e!303826 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238288 (select (store (arr!15951 a!3235) i!1204 k!2280) j!176) (array!33188 (store (arr!15951 a!3235) i!1204 k!2280) (size!16315 a!3235)) mask!3524) (Intermediate!4418 false (index!19874 lt!238290) (x!48859 lt!238290))))))

(assert (= (and d!80361 res!318593) b!520677))

(declare-fun m!501625 () Bool)

(assert (=> d!80361 m!501625))

(assert (=> d!80361 m!501323))

(assert (=> b!520677 m!501307))

(assert (=> b!520677 m!501311))

(assert (=> b!520677 m!501311))

(declare-fun m!501627 () Bool)

(assert (=> b!520677 m!501627))

(assert (=> b!520287 d!80361))

(declare-fun b!520683 () Bool)

(declare-fun e!303835 () Bool)

(declare-fun e!303831 () Bool)

(assert (=> b!520683 (= e!303835 e!303831)))

(declare-fun res!318599 () Bool)

(declare-fun lt!238484 () SeekEntryResult!4418)

(assert (=> b!520683 (= res!318599 (and (is-Intermediate!4418 lt!238484) (not (undefined!5230 lt!238484)) (bvslt (x!48859 lt!238484) #b01111111111111111111111111111110) (bvsge (x!48859 lt!238484) #b00000000000000000000000000000000) (bvsge (x!48859 lt!238484) #b00000000000000000000000000000000)))))

(assert (=> b!520683 (=> (not res!318599) (not e!303831))))

(declare-fun b!520684 () Bool)

(declare-fun e!303834 () SeekEntryResult!4418)

(assert (=> b!520684 (= e!303834 (Intermediate!4418 false lt!238288 #b00000000000000000000000000000000))))

(declare-fun b!520685 () Bool)

(assert (=> b!520685 (and (bvsge (index!19874 lt!238484) #b00000000000000000000000000000000) (bvslt (index!19874 lt!238484) (size!16315 lt!238289)))))

(declare-fun res!318598 () Bool)

(assert (=> b!520685 (= res!318598 (= (select (arr!15951 lt!238289) (index!19874 lt!238484)) lt!238286))))

(declare-fun e!303832 () Bool)

(assert (=> b!520685 (=> res!318598 e!303832)))

(assert (=> b!520685 (= e!303831 e!303832)))

(declare-fun b!520686 () Bool)

(assert (=> b!520686 (and (bvsge (index!19874 lt!238484) #b00000000000000000000000000000000) (bvslt (index!19874 lt!238484) (size!16315 lt!238289)))))

(declare-fun res!318597 () Bool)

(assert (=> b!520686 (= res!318597 (= (select (arr!15951 lt!238289) (index!19874 lt!238484)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!520686 (=> res!318597 e!303832)))

(declare-fun b!520687 () Bool)

(assert (=> b!520687 (= e!303835 (bvsge (x!48859 lt!238484) #b01111111111111111111111111111110))))

(declare-fun b!520688 () Bool)

(declare-fun e!303833 () SeekEntryResult!4418)

(assert (=> b!520688 (= e!303833 e!303834)))

(declare-fun c!61344 () Bool)

(declare-fun lt!238483 () (_ BitVec 64))

(assert (=> b!520688 (= c!61344 (or (= lt!238483 lt!238286) (= (bvadd lt!238483 lt!238483) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!80369 () Bool)

(assert (=> d!80369 e!303835))

(declare-fun c!61345 () Bool)

(assert (=> d!80369 (= c!61345 (and (is-Intermediate!4418 lt!238484) (undefined!5230 lt!238484)))))

(assert (=> d!80369 (= lt!238484 e!303833)))

(declare-fun c!61346 () Bool)

(assert (=> d!80369 (= c!61346 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80369 (= lt!238483 (select (arr!15951 lt!238289) lt!238288))))

(assert (=> d!80369 (validMask!0 mask!3524)))

(assert (=> d!80369 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238288 lt!238286 lt!238289 mask!3524) lt!238484)))

(declare-fun b!520689 () Bool)

(assert (=> b!520689 (and (bvsge (index!19874 lt!238484) #b00000000000000000000000000000000) (bvslt (index!19874 lt!238484) (size!16315 lt!238289)))))

(assert (=> b!520689 (= e!303832 (= (select (arr!15951 lt!238289) (index!19874 lt!238484)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!520690 () Bool)

(assert (=> b!520690 (= e!303834 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!238288 #b00000000000000000000000000000000 mask!3524) lt!238286 lt!238289 mask!3524))))

(declare-fun b!520691 () Bool)

(assert (=> b!520691 (= e!303833 (Intermediate!4418 true lt!238288 #b00000000000000000000000000000000))))

(assert (= (and d!80369 c!61346) b!520691))

(assert (= (and d!80369 (not c!61346)) b!520688))

(assert (= (and b!520688 c!61344) b!520684))

(assert (= (and b!520688 (not c!61344)) b!520690))

(assert (= (and d!80369 c!61345) b!520687))

(assert (= (and d!80369 (not c!61345)) b!520683))

(assert (= (and b!520683 res!318599) b!520685))

(assert (= (and b!520685 (not res!318598)) b!520686))

(assert (= (and b!520686 (not res!318597)) b!520689))

(assert (=> b!520690 m!501603))

(assert (=> b!520690 m!501603))

(declare-fun m!501633 () Bool)

(assert (=> b!520690 m!501633))

(declare-fun m!501635 () Bool)

(assert (=> b!520686 m!501635))

(assert (=> b!520685 m!501635))

(assert (=> b!520689 m!501635))

(declare-fun m!501637 () Bool)

(assert (=> d!80369 m!501637))

(assert (=> d!80369 m!501323))

(assert (=> b!520287 d!80369))

(declare-fun d!80373 () Bool)

(assert (=> d!80373 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47298 d!80373))

(declare-fun d!80375 () Bool)

(assert (=> d!80375 (= (array_inv!11747 a!3235) (bvsge (size!16315 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47298 d!80375))

(declare-fun d!80377 () Bool)

(declare-fun res!318606 () Bool)

(declare-fun e!303842 () Bool)

(assert (=> d!80377 (=> res!318606 e!303842)))

(assert (=> d!80377 (= res!318606 (= (select (arr!15951 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!80377 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!303842)))

(declare-fun b!520698 () Bool)

(declare-fun e!303843 () Bool)

(assert (=> b!520698 (= e!303842 e!303843)))

(declare-fun res!318607 () Bool)

(assert (=> b!520698 (=> (not res!318607) (not e!303843))))

(assert (=> b!520698 (= res!318607 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16315 a!3235)))))

(declare-fun b!520699 () Bool)

(assert (=> b!520699 (= e!303843 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80377 (not res!318606)) b!520698))

(assert (= (and b!520698 res!318607) b!520699))

(assert (=> d!80377 m!501423))

(declare-fun m!501639 () Bool)

(assert (=> b!520699 m!501639))

(assert (=> b!520286 d!80377))

(push 1)

(assert (not b!520414))

(assert (not b!520527))

(assert (not d!80323))

(assert (not b!520525))

(assert (not bm!31796))

(assert (not b!520535))

(assert (not b!520491))

(assert (not bm!31797))

(assert (not b!520653))

(assert (not b!520413))

(assert (not b!520677))

(assert (not b!520536))

(assert (not b!520644))

(assert (not d!80355))

(assert (not d!80351))

(assert (not b!520415))

(assert (not b!520526))

(assert (not bm!31790))

(assert (not d!80369))

(assert (not d!80331))

(assert (not d!80299))

(assert (not d!80361))

(assert (not b!520699))

(assert (not b!520690))

(check-sat)

(pop 1)

(push 1)

(check-sat)

