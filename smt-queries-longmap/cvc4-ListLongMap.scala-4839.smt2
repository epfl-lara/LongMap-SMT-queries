; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66582 () Bool)

(assert start!66582)

(declare-fun b!767509 () Bool)

(declare-fun res!519280 () Bool)

(declare-fun e!427387 () Bool)

(assert (=> b!767509 (=> (not res!519280) (not e!427387))))

(declare-datatypes ((array!42292 0))(
  ( (array!42293 (arr!20249 (Array (_ BitVec 32) (_ BitVec 64))) (size!20670 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42292)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!767509 (= res!519280 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20670 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20670 a!3186))))))

(declare-fun b!767510 () Bool)

(declare-fun e!427390 () Bool)

(declare-fun e!427386 () Bool)

(assert (=> b!767510 (= e!427390 e!427386)))

(declare-fun res!519274 () Bool)

(assert (=> b!767510 (=> (not res!519274) (not e!427386))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7849 0))(
  ( (MissingZero!7849 (index!33764 (_ BitVec 32))) (Found!7849 (index!33765 (_ BitVec 32))) (Intermediate!7849 (undefined!8661 Bool) (index!33766 (_ BitVec 32)) (x!64675 (_ BitVec 32))) (Undefined!7849) (MissingVacant!7849 (index!33767 (_ BitVec 32))) )
))
(declare-fun lt!341441 () SeekEntryResult!7849)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42292 (_ BitVec 32)) SeekEntryResult!7849)

(assert (=> b!767510 (= res!519274 (= (seekEntryOrOpen!0 (select (arr!20249 a!3186) j!159) a!3186 mask!3328) lt!341441))))

(assert (=> b!767510 (= lt!341441 (Found!7849 j!159))))

(declare-fun res!519265 () Bool)

(declare-fun e!427383 () Bool)

(assert (=> start!66582 (=> (not res!519265) (not e!427383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66582 (= res!519265 (validMask!0 mask!3328))))

(assert (=> start!66582 e!427383))

(assert (=> start!66582 true))

(declare-fun array_inv!16045 (array!42292) Bool)

(assert (=> start!66582 (array_inv!16045 a!3186)))

(declare-fun b!767511 () Bool)

(declare-fun res!519275 () Bool)

(assert (=> b!767511 (=> (not res!519275) (not e!427383))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!767511 (= res!519275 (and (= (size!20670 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20670 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20670 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!767512 () Bool)

(declare-fun res!519272 () Bool)

(declare-fun e!427388 () Bool)

(assert (=> b!767512 (=> (not res!519272) (not e!427388))))

(assert (=> b!767512 (= res!519272 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20249 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!767513 () Bool)

(declare-fun res!519277 () Bool)

(assert (=> b!767513 (=> (not res!519277) (not e!427387))))

(declare-datatypes ((List!14251 0))(
  ( (Nil!14248) (Cons!14247 (h!15340 (_ BitVec 64)) (t!20566 List!14251)) )
))
(declare-fun arrayNoDuplicates!0 (array!42292 (_ BitVec 32) List!14251) Bool)

(assert (=> b!767513 (= res!519277 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14248))))

(declare-fun b!767514 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42292 (_ BitVec 32)) SeekEntryResult!7849)

(assert (=> b!767514 (= e!427386 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20249 a!3186) j!159) a!3186 mask!3328) lt!341441))))

(declare-fun b!767515 () Bool)

(assert (=> b!767515 (= e!427387 e!427388)))

(declare-fun res!519276 () Bool)

(assert (=> b!767515 (=> (not res!519276) (not e!427388))))

(declare-fun lt!341433 () SeekEntryResult!7849)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42292 (_ BitVec 32)) SeekEntryResult!7849)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!767515 (= res!519276 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20249 a!3186) j!159) mask!3328) (select (arr!20249 a!3186) j!159) a!3186 mask!3328) lt!341433))))

(assert (=> b!767515 (= lt!341433 (Intermediate!7849 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!767516 () Bool)

(declare-fun res!519264 () Bool)

(assert (=> b!767516 (=> (not res!519264) (not e!427387))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42292 (_ BitVec 32)) Bool)

(assert (=> b!767516 (= res!519264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!767517 () Bool)

(declare-fun res!519266 () Bool)

(assert (=> b!767517 (=> (not res!519266) (not e!427383))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42292 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!767517 (= res!519266 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!767518 () Bool)

(declare-fun res!519278 () Bool)

(assert (=> b!767518 (=> (not res!519278) (not e!427388))))

(declare-fun e!427384 () Bool)

(assert (=> b!767518 (= res!519278 e!427384)))

(declare-fun c!84514 () Bool)

(assert (=> b!767518 (= c!84514 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!767519 () Bool)

(declare-fun e!427392 () Bool)

(declare-fun e!427385 () Bool)

(assert (=> b!767519 (= e!427392 e!427385)))

(declare-fun res!519267 () Bool)

(assert (=> b!767519 (=> res!519267 e!427385)))

(assert (=> b!767519 (= res!519267 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!341434 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!767519 (= lt!341434 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!767520 () Bool)

(declare-fun res!519271 () Bool)

(assert (=> b!767520 (=> (not res!519271) (not e!427383))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!767520 (= res!519271 (validKeyInArray!0 k!2102))))

(declare-fun b!767521 () Bool)

(assert (=> b!767521 (= e!427384 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20249 a!3186) j!159) a!3186 mask!3328) (Found!7849 j!159)))))

(declare-fun b!767522 () Bool)

(declare-fun res!519263 () Bool)

(assert (=> b!767522 (=> res!519263 e!427385)))

(declare-fun lt!341439 () SeekEntryResult!7849)

(assert (=> b!767522 (= res!519263 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20249 a!3186) j!159) a!3186 mask!3328) lt!341439)))))

(declare-fun b!767523 () Bool)

(declare-fun res!519269 () Bool)

(assert (=> b!767523 (=> (not res!519269) (not e!427383))))

(assert (=> b!767523 (= res!519269 (validKeyInArray!0 (select (arr!20249 a!3186) j!159)))))

(declare-fun b!767524 () Bool)

(declare-fun e!427389 () Bool)

(assert (=> b!767524 (= e!427389 (not e!427392))))

(declare-fun res!519270 () Bool)

(assert (=> b!767524 (=> res!519270 e!427392)))

(declare-fun lt!341435 () SeekEntryResult!7849)

(assert (=> b!767524 (= res!519270 (or (not (is-Intermediate!7849 lt!341435)) (bvsge x!1131 (x!64675 lt!341435))))))

(assert (=> b!767524 (= lt!341439 (Found!7849 j!159))))

(assert (=> b!767524 e!427390))

(declare-fun res!519268 () Bool)

(assert (=> b!767524 (=> (not res!519268) (not e!427390))))

(assert (=> b!767524 (= res!519268 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26424 0))(
  ( (Unit!26425) )
))
(declare-fun lt!341436 () Unit!26424)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42292 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26424)

(assert (=> b!767524 (= lt!341436 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!767525 () Bool)

(assert (=> b!767525 (= e!427383 e!427387)))

(declare-fun res!519279 () Bool)

(assert (=> b!767525 (=> (not res!519279) (not e!427387))))

(declare-fun lt!341438 () SeekEntryResult!7849)

(assert (=> b!767525 (= res!519279 (or (= lt!341438 (MissingZero!7849 i!1173)) (= lt!341438 (MissingVacant!7849 i!1173))))))

(assert (=> b!767525 (= lt!341438 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!767526 () Bool)

(assert (=> b!767526 (= e!427384 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20249 a!3186) j!159) a!3186 mask!3328) lt!341433))))

(declare-fun b!767527 () Bool)

(assert (=> b!767527 (= e!427388 e!427389)))

(declare-fun res!519273 () Bool)

(assert (=> b!767527 (=> (not res!519273) (not e!427389))))

(declare-fun lt!341440 () SeekEntryResult!7849)

(assert (=> b!767527 (= res!519273 (= lt!341440 lt!341435))))

(declare-fun lt!341432 () (_ BitVec 64))

(declare-fun lt!341437 () array!42292)

(assert (=> b!767527 (= lt!341435 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!341432 lt!341437 mask!3328))))

(assert (=> b!767527 (= lt!341440 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!341432 mask!3328) lt!341432 lt!341437 mask!3328))))

(assert (=> b!767527 (= lt!341432 (select (store (arr!20249 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!767527 (= lt!341437 (array!42293 (store (arr!20249 a!3186) i!1173 k!2102) (size!20670 a!3186)))))

(declare-fun b!767528 () Bool)

(assert (=> b!767528 (= e!427385 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!341434 resIntermediateIndex!5 (select (arr!20249 a!3186) j!159) a!3186 mask!3328) lt!341439))))

(assert (= (and start!66582 res!519265) b!767511))

(assert (= (and b!767511 res!519275) b!767523))

(assert (= (and b!767523 res!519269) b!767520))

(assert (= (and b!767520 res!519271) b!767517))

(assert (= (and b!767517 res!519266) b!767525))

(assert (= (and b!767525 res!519279) b!767516))

(assert (= (and b!767516 res!519264) b!767513))

(assert (= (and b!767513 res!519277) b!767509))

(assert (= (and b!767509 res!519280) b!767515))

(assert (= (and b!767515 res!519276) b!767512))

(assert (= (and b!767512 res!519272) b!767518))

(assert (= (and b!767518 c!84514) b!767526))

(assert (= (and b!767518 (not c!84514)) b!767521))

(assert (= (and b!767518 res!519278) b!767527))

(assert (= (and b!767527 res!519273) b!767524))

(assert (= (and b!767524 res!519268) b!767510))

(assert (= (and b!767510 res!519274) b!767514))

(assert (= (and b!767524 (not res!519270)) b!767519))

(assert (= (and b!767519 (not res!519267)) b!767522))

(assert (= (and b!767522 (not res!519263)) b!767528))

(declare-fun m!713269 () Bool)

(assert (=> start!66582 m!713269))

(declare-fun m!713271 () Bool)

(assert (=> start!66582 m!713271))

(declare-fun m!713273 () Bool)

(assert (=> b!767521 m!713273))

(assert (=> b!767521 m!713273))

(declare-fun m!713275 () Bool)

(assert (=> b!767521 m!713275))

(assert (=> b!767522 m!713273))

(assert (=> b!767522 m!713273))

(assert (=> b!767522 m!713275))

(declare-fun m!713277 () Bool)

(assert (=> b!767516 m!713277))

(declare-fun m!713279 () Bool)

(assert (=> b!767512 m!713279))

(assert (=> b!767526 m!713273))

(assert (=> b!767526 m!713273))

(declare-fun m!713281 () Bool)

(assert (=> b!767526 m!713281))

(assert (=> b!767515 m!713273))

(assert (=> b!767515 m!713273))

(declare-fun m!713283 () Bool)

(assert (=> b!767515 m!713283))

(assert (=> b!767515 m!713283))

(assert (=> b!767515 m!713273))

(declare-fun m!713285 () Bool)

(assert (=> b!767515 m!713285))

(declare-fun m!713287 () Bool)

(assert (=> b!767519 m!713287))

(declare-fun m!713289 () Bool)

(assert (=> b!767524 m!713289))

(declare-fun m!713291 () Bool)

(assert (=> b!767524 m!713291))

(assert (=> b!767514 m!713273))

(assert (=> b!767514 m!713273))

(declare-fun m!713293 () Bool)

(assert (=> b!767514 m!713293))

(assert (=> b!767528 m!713273))

(assert (=> b!767528 m!713273))

(declare-fun m!713295 () Bool)

(assert (=> b!767528 m!713295))

(declare-fun m!713297 () Bool)

(assert (=> b!767527 m!713297))

(declare-fun m!713299 () Bool)

(assert (=> b!767527 m!713299))

(declare-fun m!713301 () Bool)

(assert (=> b!767527 m!713301))

(declare-fun m!713303 () Bool)

(assert (=> b!767527 m!713303))

(declare-fun m!713305 () Bool)

(assert (=> b!767527 m!713305))

(assert (=> b!767527 m!713297))

(assert (=> b!767523 m!713273))

(assert (=> b!767523 m!713273))

(declare-fun m!713307 () Bool)

(assert (=> b!767523 m!713307))

(declare-fun m!713309 () Bool)

(assert (=> b!767513 m!713309))

(assert (=> b!767510 m!713273))

(assert (=> b!767510 m!713273))

(declare-fun m!713311 () Bool)

(assert (=> b!767510 m!713311))

(declare-fun m!713313 () Bool)

(assert (=> b!767520 m!713313))

(declare-fun m!713315 () Bool)

(assert (=> b!767525 m!713315))

(declare-fun m!713317 () Bool)

(assert (=> b!767517 m!713317))

(push 1)

(assert (not b!767528))

(assert (not b!767516))

(assert (not b!767525))

(assert (not start!66582))

(assert (not b!767524))

(assert (not b!767522))

(assert (not b!767510))

(assert (not b!767527))

(assert (not b!767517))

(assert (not b!767515))

(assert (not b!767520))

(assert (not b!767513))

(assert (not b!767521))

(assert (not b!767523))

(assert (not b!767519))

(assert (not b!767526))

(assert (not b!767514))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!101361 () Bool)

(assert (=> d!101361 (= (validKeyInArray!0 (select (arr!20249 a!3186) j!159)) (and (not (= (select (arr!20249 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20249 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!767523 d!101361))

(declare-fun b!767604 () Bool)

(declare-fun c!84544 () Bool)

(declare-fun lt!341468 () (_ BitVec 64))

(assert (=> b!767604 (= c!84544 (= lt!341468 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427439 () SeekEntryResult!7849)

(declare-fun e!427440 () SeekEntryResult!7849)

(assert (=> b!767604 (= e!427439 e!427440)))

(declare-fun b!767605 () Bool)

(declare-fun e!427441 () SeekEntryResult!7849)

(assert (=> b!767605 (= e!427441 e!427439)))

(declare-fun c!84542 () Bool)

(assert (=> b!767605 (= c!84542 (= lt!341468 (select (arr!20249 a!3186) j!159)))))

(declare-fun d!101363 () Bool)

(declare-fun lt!341469 () SeekEntryResult!7849)

(assert (=> d!101363 (and (or (is-Undefined!7849 lt!341469) (not (is-Found!7849 lt!341469)) (and (bvsge (index!33765 lt!341469) #b00000000000000000000000000000000) (bvslt (index!33765 lt!341469) (size!20670 a!3186)))) (or (is-Undefined!7849 lt!341469) (is-Found!7849 lt!341469) (not (is-MissingVacant!7849 lt!341469)) (not (= (index!33767 lt!341469) resIntermediateIndex!5)) (and (bvsge (index!33767 lt!341469) #b00000000000000000000000000000000) (bvslt (index!33767 lt!341469) (size!20670 a!3186)))) (or (is-Undefined!7849 lt!341469) (ite (is-Found!7849 lt!341469) (= (select (arr!20249 a!3186) (index!33765 lt!341469)) (select (arr!20249 a!3186) j!159)) (and (is-MissingVacant!7849 lt!341469) (= (index!33767 lt!341469) resIntermediateIndex!5) (= (select (arr!20249 a!3186) (index!33767 lt!341469)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101363 (= lt!341469 e!427441)))

(declare-fun c!84543 () Bool)

(assert (=> d!101363 (= c!84543 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101363 (= lt!341468 (select (arr!20249 a!3186) index!1321))))

(assert (=> d!101363 (validMask!0 mask!3328)))

(assert (=> d!101363 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20249 a!3186) j!159) a!3186 mask!3328) lt!341469)))

(declare-fun b!767606 () Bool)

(assert (=> b!767606 (= e!427440 (MissingVacant!7849 resIntermediateIndex!5))))

(declare-fun b!767607 () Bool)

(assert (=> b!767607 (= e!427441 Undefined!7849)))

(declare-fun b!767608 () Bool)

(assert (=> b!767608 (= e!427439 (Found!7849 index!1321))))

(declare-fun b!767609 () Bool)

(assert (=> b!767609 (= e!427440 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20249 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!101363 c!84543) b!767607))

(assert (= (and d!101363 (not c!84543)) b!767605))

(assert (= (and b!767605 c!84542) b!767608))

(assert (= (and b!767605 (not c!84542)) b!767604))

(assert (= (and b!767604 c!84544) b!767606))

(assert (= (and b!767604 (not c!84544)) b!767609))

(declare-fun m!713345 () Bool)

(assert (=> d!101363 m!713345))

(declare-fun m!713347 () Bool)

(assert (=> d!101363 m!713347))

(declare-fun m!713349 () Bool)

(assert (=> d!101363 m!713349))

(assert (=> d!101363 m!713269))

(assert (=> b!767609 m!713287))

(assert (=> b!767609 m!713287))

(assert (=> b!767609 m!713273))

(declare-fun m!713351 () Bool)

(assert (=> b!767609 m!713351))

(assert (=> b!767521 d!101363))

(assert (=> b!767522 d!101363))

(declare-fun b!767676 () Bool)

(declare-fun e!427479 () SeekEntryResult!7849)

(declare-fun e!427480 () SeekEntryResult!7849)

(assert (=> b!767676 (= e!427479 e!427480)))

(declare-fun lt!341501 () (_ BitVec 64))

(declare-fun lt!341500 () SeekEntryResult!7849)

(assert (=> b!767676 (= lt!341501 (select (arr!20249 a!3186) (index!33766 lt!341500)))))

(declare-fun c!84569 () Bool)

(assert (=> b!767676 (= c!84569 (= lt!341501 k!2102))))

(declare-fun b!767677 () Bool)

(declare-fun c!84570 () Bool)

(assert (=> b!767677 (= c!84570 (= lt!341501 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427478 () SeekEntryResult!7849)

(assert (=> b!767677 (= e!427480 e!427478)))

(declare-fun b!767678 () Bool)

(assert (=> b!767678 (= e!427478 (MissingZero!7849 (index!33766 lt!341500)))))

(declare-fun b!767679 () Bool)

(assert (=> b!767679 (= e!427480 (Found!7849 (index!33766 lt!341500)))))

(declare-fun d!101367 () Bool)

(declare-fun lt!341502 () SeekEntryResult!7849)

(assert (=> d!101367 (and (or (is-Undefined!7849 lt!341502) (not (is-Found!7849 lt!341502)) (and (bvsge (index!33765 lt!341502) #b00000000000000000000000000000000) (bvslt (index!33765 lt!341502) (size!20670 a!3186)))) (or (is-Undefined!7849 lt!341502) (is-Found!7849 lt!341502) (not (is-MissingZero!7849 lt!341502)) (and (bvsge (index!33764 lt!341502) #b00000000000000000000000000000000) (bvslt (index!33764 lt!341502) (size!20670 a!3186)))) (or (is-Undefined!7849 lt!341502) (is-Found!7849 lt!341502) (is-MissingZero!7849 lt!341502) (not (is-MissingVacant!7849 lt!341502)) (and (bvsge (index!33767 lt!341502) #b00000000000000000000000000000000) (bvslt (index!33767 lt!341502) (size!20670 a!3186)))) (or (is-Undefined!7849 lt!341502) (ite (is-Found!7849 lt!341502) (= (select (arr!20249 a!3186) (index!33765 lt!341502)) k!2102) (ite (is-MissingZero!7849 lt!341502) (= (select (arr!20249 a!3186) (index!33764 lt!341502)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7849 lt!341502) (= (select (arr!20249 a!3186) (index!33767 lt!341502)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101367 (= lt!341502 e!427479)))

(declare-fun c!84571 () Bool)

(assert (=> d!101367 (= c!84571 (and (is-Intermediate!7849 lt!341500) (undefined!8661 lt!341500)))))

(assert (=> d!101367 (= lt!341500 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!101367 (validMask!0 mask!3328)))

(assert (=> d!101367 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!341502)))

(declare-fun b!767680 () Bool)

(assert (=> b!767680 (= e!427478 (seekKeyOrZeroReturnVacant!0 (x!64675 lt!341500) (index!33766 lt!341500) (index!33766 lt!341500) k!2102 a!3186 mask!3328))))

(declare-fun b!767681 () Bool)

(assert (=> b!767681 (= e!427479 Undefined!7849)))

(assert (= (and d!101367 c!84571) b!767681))

(assert (= (and d!101367 (not c!84571)) b!767676))

(assert (= (and b!767676 c!84569) b!767679))

(assert (= (and b!767676 (not c!84569)) b!767677))

(assert (= (and b!767677 c!84570) b!767678))

(assert (= (and b!767677 (not c!84570)) b!767680))

(declare-fun m!713381 () Bool)

(assert (=> b!767676 m!713381))

(assert (=> d!101367 m!713269))

(declare-fun m!713383 () Bool)

(assert (=> d!101367 m!713383))

(declare-fun m!713385 () Bool)

(assert (=> d!101367 m!713385))

(declare-fun m!713387 () Bool)

(assert (=> d!101367 m!713387))

(declare-fun m!713389 () Bool)

(assert (=> d!101367 m!713389))

(declare-fun m!713391 () Bool)

(assert (=> d!101367 m!713391))

(assert (=> d!101367 m!713385))

(declare-fun m!713393 () Bool)

(assert (=> b!767680 m!713393))

(assert (=> b!767525 d!101367))

(declare-fun b!767751 () Bool)

(declare-fun e!427522 () SeekEntryResult!7849)

(declare-fun e!427523 () SeekEntryResult!7849)

(assert (=> b!767751 (= e!427522 e!427523)))

(declare-fun c!84599 () Bool)

(declare-fun lt!341530 () (_ BitVec 64))

(assert (=> b!767751 (= c!84599 (or (= lt!341530 (select (arr!20249 a!3186) j!159)) (= (bvadd lt!341530 lt!341530) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!767752 () Bool)

(declare-fun lt!341529 () SeekEntryResult!7849)

(assert (=> b!767752 (and (bvsge (index!33766 lt!341529) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341529) (size!20670 a!3186)))))

(declare-fun res!519337 () Bool)

(assert (=> b!767752 (= res!519337 (= (select (arr!20249 a!3186) (index!33766 lt!341529)) (select (arr!20249 a!3186) j!159)))))

(declare-fun e!427524 () Bool)

(assert (=> b!767752 (=> res!519337 e!427524)))

(declare-fun e!427520 () Bool)

(assert (=> b!767752 (= e!427520 e!427524)))

(declare-fun b!767753 () Bool)

(assert (=> b!767753 (and (bvsge (index!33766 lt!341529) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341529) (size!20670 a!3186)))))

(assert (=> b!767753 (= e!427524 (= (select (arr!20249 a!3186) (index!33766 lt!341529)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!767754 () Bool)

(assert (=> b!767754 (and (bvsge (index!33766 lt!341529) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341529) (size!20670 a!3186)))))

(declare-fun res!519338 () Bool)

(assert (=> b!767754 (= res!519338 (= (select (arr!20249 a!3186) (index!33766 lt!341529)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!767754 (=> res!519338 e!427524)))

(declare-fun b!767755 () Bool)

(declare-fun e!427521 () Bool)

(assert (=> b!767755 (= e!427521 (bvsge (x!64675 lt!341529) #b01111111111111111111111111111110))))

(declare-fun b!767757 () Bool)

(assert (=> b!767757 (= e!427522 (Intermediate!7849 true index!1321 x!1131))))

(declare-fun b!767758 () Bool)

(assert (=> b!767758 (= e!427523 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20249 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!767759 () Bool)

(assert (=> b!767759 (= e!427523 (Intermediate!7849 false index!1321 x!1131))))

(declare-fun d!101383 () Bool)

(assert (=> d!101383 e!427521))

(declare-fun c!84600 () Bool)

(assert (=> d!101383 (= c!84600 (and (is-Intermediate!7849 lt!341529) (undefined!8661 lt!341529)))))

(assert (=> d!101383 (= lt!341529 e!427522)))

(declare-fun c!84601 () Bool)

(assert (=> d!101383 (= c!84601 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101383 (= lt!341530 (select (arr!20249 a!3186) index!1321))))

(assert (=> d!101383 (validMask!0 mask!3328)))

(assert (=> d!101383 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20249 a!3186) j!159) a!3186 mask!3328) lt!341529)))

(declare-fun b!767756 () Bool)

(assert (=> b!767756 (= e!427521 e!427520)))

(declare-fun res!519339 () Bool)

(assert (=> b!767756 (= res!519339 (and (is-Intermediate!7849 lt!341529) (not (undefined!8661 lt!341529)) (bvslt (x!64675 lt!341529) #b01111111111111111111111111111110) (bvsge (x!64675 lt!341529) #b00000000000000000000000000000000) (bvsge (x!64675 lt!341529) x!1131)))))

(assert (=> b!767756 (=> (not res!519339) (not e!427520))))

(assert (= (and d!101383 c!84601) b!767757))

(assert (= (and d!101383 (not c!84601)) b!767751))

(assert (= (and b!767751 c!84599) b!767759))

(assert (= (and b!767751 (not c!84599)) b!767758))

(assert (= (and d!101383 c!84600) b!767755))

(assert (= (and d!101383 (not c!84600)) b!767756))

(assert (= (and b!767756 res!519339) b!767752))

(assert (= (and b!767752 (not res!519337)) b!767754))

(assert (= (and b!767754 (not res!519338)) b!767753))

(assert (=> b!767758 m!713287))

(assert (=> b!767758 m!713287))

(assert (=> b!767758 m!713273))

(declare-fun m!713425 () Bool)

(assert (=> b!767758 m!713425))

(declare-fun m!713427 () Bool)

(assert (=> b!767753 m!713427))

(assert (=> d!101383 m!713349))

(assert (=> d!101383 m!713269))

(assert (=> b!767752 m!713427))

(assert (=> b!767754 m!713427))

(assert (=> b!767526 d!101383))

(declare-fun b!767760 () Bool)

(declare-fun e!427527 () SeekEntryResult!7849)

(declare-fun e!427528 () SeekEntryResult!7849)

(assert (=> b!767760 (= e!427527 e!427528)))

(declare-fun c!84602 () Bool)

(declare-fun lt!341532 () (_ BitVec 64))

(assert (=> b!767760 (= c!84602 (or (= lt!341532 (select (arr!20249 a!3186) j!159)) (= (bvadd lt!341532 lt!341532) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!767761 () Bool)

(declare-fun lt!341531 () SeekEntryResult!7849)

(assert (=> b!767761 (and (bvsge (index!33766 lt!341531) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341531) (size!20670 a!3186)))))

(declare-fun res!519340 () Bool)

(assert (=> b!767761 (= res!519340 (= (select (arr!20249 a!3186) (index!33766 lt!341531)) (select (arr!20249 a!3186) j!159)))))

(declare-fun e!427529 () Bool)

(assert (=> b!767761 (=> res!519340 e!427529)))

(declare-fun e!427525 () Bool)

(assert (=> b!767761 (= e!427525 e!427529)))

(declare-fun b!767762 () Bool)

(assert (=> b!767762 (and (bvsge (index!33766 lt!341531) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341531) (size!20670 a!3186)))))

(assert (=> b!767762 (= e!427529 (= (select (arr!20249 a!3186) (index!33766 lt!341531)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!767763 () Bool)

(assert (=> b!767763 (and (bvsge (index!33766 lt!341531) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341531) (size!20670 a!3186)))))

(declare-fun res!519341 () Bool)

(assert (=> b!767763 (= res!519341 (= (select (arr!20249 a!3186) (index!33766 lt!341531)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!767763 (=> res!519341 e!427529)))

(declare-fun b!767764 () Bool)

(declare-fun e!427526 () Bool)

(assert (=> b!767764 (= e!427526 (bvsge (x!64675 lt!341531) #b01111111111111111111111111111110))))

(declare-fun b!767766 () Bool)

(assert (=> b!767766 (= e!427527 (Intermediate!7849 true (toIndex!0 (select (arr!20249 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!767767 () Bool)

(assert (=> b!767767 (= e!427528 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20249 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20249 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!767768 () Bool)

(assert (=> b!767768 (= e!427528 (Intermediate!7849 false (toIndex!0 (select (arr!20249 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun d!101401 () Bool)

(assert (=> d!101401 e!427526))

(declare-fun c!84603 () Bool)

(assert (=> d!101401 (= c!84603 (and (is-Intermediate!7849 lt!341531) (undefined!8661 lt!341531)))))

(assert (=> d!101401 (= lt!341531 e!427527)))

(declare-fun c!84604 () Bool)

(assert (=> d!101401 (= c!84604 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!101401 (= lt!341532 (select (arr!20249 a!3186) (toIndex!0 (select (arr!20249 a!3186) j!159) mask!3328)))))

(assert (=> d!101401 (validMask!0 mask!3328)))

(assert (=> d!101401 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20249 a!3186) j!159) mask!3328) (select (arr!20249 a!3186) j!159) a!3186 mask!3328) lt!341531)))

(declare-fun b!767765 () Bool)

(assert (=> b!767765 (= e!427526 e!427525)))

(declare-fun res!519342 () Bool)

(assert (=> b!767765 (= res!519342 (and (is-Intermediate!7849 lt!341531) (not (undefined!8661 lt!341531)) (bvslt (x!64675 lt!341531) #b01111111111111111111111111111110) (bvsge (x!64675 lt!341531) #b00000000000000000000000000000000) (bvsge (x!64675 lt!341531) #b00000000000000000000000000000000)))))

(assert (=> b!767765 (=> (not res!519342) (not e!427525))))

(assert (= (and d!101401 c!84604) b!767766))

(assert (= (and d!101401 (not c!84604)) b!767760))

(assert (= (and b!767760 c!84602) b!767768))

(assert (= (and b!767760 (not c!84602)) b!767767))

(assert (= (and d!101401 c!84603) b!767764))

(assert (= (and d!101401 (not c!84603)) b!767765))

(assert (= (and b!767765 res!519342) b!767761))

(assert (= (and b!767761 (not res!519340)) b!767763))

(assert (= (and b!767763 (not res!519341)) b!767762))

(assert (=> b!767767 m!713283))

(declare-fun m!713429 () Bool)

(assert (=> b!767767 m!713429))

(assert (=> b!767767 m!713429))

(assert (=> b!767767 m!713273))

(declare-fun m!713433 () Bool)

(assert (=> b!767767 m!713433))

(declare-fun m!713437 () Bool)

(assert (=> b!767762 m!713437))

(assert (=> d!101401 m!713283))

(declare-fun m!713441 () Bool)

(assert (=> d!101401 m!713441))

(assert (=> d!101401 m!713269))

(assert (=> b!767761 m!713437))

(assert (=> b!767763 m!713437))

(assert (=> b!767515 d!101401))

(declare-fun d!101403 () Bool)

(declare-fun lt!341554 () (_ BitVec 32))

(declare-fun lt!341553 () (_ BitVec 32))

(assert (=> d!101403 (= lt!341554 (bvmul (bvxor lt!341553 (bvlshr lt!341553 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101403 (= lt!341553 ((_ extract 31 0) (bvand (bvxor (select (arr!20249 a!3186) j!159) (bvlshr (select (arr!20249 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101403 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!519343 (let ((h!15343 ((_ extract 31 0) (bvand (bvxor (select (arr!20249 a!3186) j!159) (bvlshr (select (arr!20249 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64686 (bvmul (bvxor h!15343 (bvlshr h!15343 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64686 (bvlshr x!64686 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!519343 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!519343 #b00000000000000000000000000000000))))))

(assert (=> d!101403 (= (toIndex!0 (select (arr!20249 a!3186) j!159) mask!3328) (bvand (bvxor lt!341554 (bvlshr lt!341554 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!767515 d!101403))

(declare-fun d!101413 () Bool)

(declare-fun res!519354 () Bool)

(declare-fun e!427568 () Bool)

(assert (=> d!101413 (=> res!519354 e!427568)))

(assert (=> d!101413 (= res!519354 (bvsge j!159 (size!20670 a!3186)))))

(assert (=> d!101413 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!427568)))

(declare-fun b!767838 () Bool)

(declare-fun e!427569 () Bool)

(declare-fun call!35074 () Bool)

(assert (=> b!767838 (= e!427569 call!35074)))

(declare-fun b!767839 () Bool)

(declare-fun e!427570 () Bool)

(assert (=> b!767839 (= e!427569 e!427570)))

(declare-fun lt!341573 () (_ BitVec 64))

(assert (=> b!767839 (= lt!341573 (select (arr!20249 a!3186) j!159))))

(declare-fun lt!341574 () Unit!26424)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42292 (_ BitVec 64) (_ BitVec 32)) Unit!26424)

(assert (=> b!767839 (= lt!341574 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!341573 j!159))))

(assert (=> b!767839 (arrayContainsKey!0 a!3186 lt!341573 #b00000000000000000000000000000000)))

(declare-fun lt!341575 () Unit!26424)

(assert (=> b!767839 (= lt!341575 lt!341574)))

(declare-fun res!519353 () Bool)

(assert (=> b!767839 (= res!519353 (= (seekEntryOrOpen!0 (select (arr!20249 a!3186) j!159) a!3186 mask!3328) (Found!7849 j!159)))))

(assert (=> b!767839 (=> (not res!519353) (not e!427570))))

(declare-fun b!767840 () Bool)

(assert (=> b!767840 (= e!427570 call!35074)))

(declare-fun b!767841 () Bool)

(assert (=> b!767841 (= e!427568 e!427569)))

(declare-fun c!84635 () Bool)

(assert (=> b!767841 (= c!84635 (validKeyInArray!0 (select (arr!20249 a!3186) j!159)))))

(declare-fun bm!35071 () Bool)

(assert (=> bm!35071 (= call!35074 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(assert (= (and d!101413 (not res!519354)) b!767841))

(assert (= (and b!767841 c!84635) b!767839))

(assert (= (and b!767841 (not c!84635)) b!767838))

(assert (= (and b!767839 res!519353) b!767840))

(assert (= (or b!767840 b!767838) bm!35071))

(assert (=> b!767839 m!713273))

(declare-fun m!713509 () Bool)

(assert (=> b!767839 m!713509))

(declare-fun m!713511 () Bool)

(assert (=> b!767839 m!713511))

(assert (=> b!767839 m!713273))

(assert (=> b!767839 m!713311))

(assert (=> b!767841 m!713273))

(assert (=> b!767841 m!713273))

(assert (=> b!767841 m!713307))

(declare-fun m!713513 () Bool)

(assert (=> bm!35071 m!713513))

(assert (=> b!767524 d!101413))

(declare-fun d!101425 () Bool)

(assert (=> d!101425 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!341578 () Unit!26424)

(declare-fun choose!38 (array!42292 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26424)

(assert (=> d!101425 (= lt!341578 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!101425 (validMask!0 mask!3328)))

(assert (=> d!101425 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!341578)))

(declare-fun bs!21525 () Bool)

(assert (= bs!21525 d!101425))

(assert (=> bs!21525 m!713289))

(declare-fun m!713515 () Bool)

(assert (=> bs!21525 m!713515))

(assert (=> bs!21525 m!713269))

(assert (=> b!767524 d!101425))

(declare-fun b!767860 () Bool)

(declare-fun e!427588 () Bool)

(declare-fun e!427587 () Bool)

(assert (=> b!767860 (= e!427588 e!427587)))

(declare-fun c!84640 () Bool)

(assert (=> b!767860 (= c!84640 (validKeyInArray!0 (select (arr!20249 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!101431 () Bool)

(declare-fun res!519365 () Bool)

(declare-fun e!427585 () Bool)

(assert (=> d!101431 (=> res!519365 e!427585)))

(assert (=> d!101431 (= res!519365 (bvsge #b00000000000000000000000000000000 (size!20670 a!3186)))))

(assert (=> d!101431 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14248) e!427585)))

(declare-fun b!767861 () Bool)

(declare-fun call!35079 () Bool)

(assert (=> b!767861 (= e!427587 call!35079)))

(declare-fun bm!35076 () Bool)

(assert (=> bm!35076 (= call!35079 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!84640 (Cons!14247 (select (arr!20249 a!3186) #b00000000000000000000000000000000) Nil!14248) Nil!14248)))))

(declare-fun b!767862 () Bool)

(assert (=> b!767862 (= e!427587 call!35079)))

(declare-fun b!767863 () Bool)

(assert (=> b!767863 (= e!427585 e!427588)))

(declare-fun res!519366 () Bool)

(assert (=> b!767863 (=> (not res!519366) (not e!427588))))

(declare-fun e!427586 () Bool)

(assert (=> b!767863 (= res!519366 (not e!427586))))

(declare-fun res!519367 () Bool)

(assert (=> b!767863 (=> (not res!519367) (not e!427586))))

(assert (=> b!767863 (= res!519367 (validKeyInArray!0 (select (arr!20249 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!767864 () Bool)

(declare-fun contains!4084 (List!14251 (_ BitVec 64)) Bool)

(assert (=> b!767864 (= e!427586 (contains!4084 Nil!14248 (select (arr!20249 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!101431 (not res!519365)) b!767863))

(assert (= (and b!767863 res!519367) b!767864))

(assert (= (and b!767863 res!519366) b!767860))

(assert (= (and b!767860 c!84640) b!767862))

(assert (= (and b!767860 (not c!84640)) b!767861))

(assert (= (or b!767862 b!767861) bm!35076))

(declare-fun m!713517 () Bool)

(assert (=> b!767860 m!713517))

(assert (=> b!767860 m!713517))

(declare-fun m!713519 () Bool)

(assert (=> b!767860 m!713519))

(assert (=> bm!35076 m!713517))

(declare-fun m!713521 () Bool)

(assert (=> bm!35076 m!713521))

(assert (=> b!767863 m!713517))

(assert (=> b!767863 m!713517))

(assert (=> b!767863 m!713519))

(assert (=> b!767864 m!713517))

(assert (=> b!767864 m!713517))

(declare-fun m!713523 () Bool)

(assert (=> b!767864 m!713523))

(assert (=> b!767513 d!101431))

(declare-fun b!767865 () Bool)

(declare-fun c!84643 () Bool)

(declare-fun lt!341585 () (_ BitVec 64))

(assert (=> b!767865 (= c!84643 (= lt!341585 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427589 () SeekEntryResult!7849)

(declare-fun e!427590 () SeekEntryResult!7849)

(assert (=> b!767865 (= e!427589 e!427590)))

(declare-fun b!767866 () Bool)

(declare-fun e!427591 () SeekEntryResult!7849)

(assert (=> b!767866 (= e!427591 e!427589)))

(declare-fun c!84641 () Bool)

(assert (=> b!767866 (= c!84641 (= lt!341585 (select (arr!20249 a!3186) j!159)))))

(declare-fun lt!341586 () SeekEntryResult!7849)

(declare-fun d!101433 () Bool)

(assert (=> d!101433 (and (or (is-Undefined!7849 lt!341586) (not (is-Found!7849 lt!341586)) (and (bvsge (index!33765 lt!341586) #b00000000000000000000000000000000) (bvslt (index!33765 lt!341586) (size!20670 a!3186)))) (or (is-Undefined!7849 lt!341586) (is-Found!7849 lt!341586) (not (is-MissingVacant!7849 lt!341586)) (not (= (index!33767 lt!341586) resIntermediateIndex!5)) (and (bvsge (index!33767 lt!341586) #b00000000000000000000000000000000) (bvslt (index!33767 lt!341586) (size!20670 a!3186)))) (or (is-Undefined!7849 lt!341586) (ite (is-Found!7849 lt!341586) (= (select (arr!20249 a!3186) (index!33765 lt!341586)) (select (arr!20249 a!3186) j!159)) (and (is-MissingVacant!7849 lt!341586) (= (index!33767 lt!341586) resIntermediateIndex!5) (= (select (arr!20249 a!3186) (index!33767 lt!341586)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101433 (= lt!341586 e!427591)))

(declare-fun c!84642 () Bool)

(assert (=> d!101433 (= c!84642 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!101433 (= lt!341585 (select (arr!20249 a!3186) resIntermediateIndex!5))))

(assert (=> d!101433 (validMask!0 mask!3328)))

(assert (=> d!101433 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20249 a!3186) j!159) a!3186 mask!3328) lt!341586)))

(declare-fun b!767867 () Bool)

(assert (=> b!767867 (= e!427590 (MissingVacant!7849 resIntermediateIndex!5))))

(declare-fun b!767868 () Bool)

(assert (=> b!767868 (= e!427591 Undefined!7849)))

(declare-fun b!767869 () Bool)

(assert (=> b!767869 (= e!427589 (Found!7849 resIntermediateIndex!5))))

(declare-fun b!767870 () Bool)

(assert (=> b!767870 (= e!427590 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20249 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!101433 c!84642) b!767868))

(assert (= (and d!101433 (not c!84642)) b!767866))

(assert (= (and b!767866 c!84641) b!767869))

(assert (= (and b!767866 (not c!84641)) b!767865))

(assert (= (and b!767865 c!84643) b!767867))

(assert (= (and b!767865 (not c!84643)) b!767870))

(declare-fun m!713525 () Bool)

(assert (=> d!101433 m!713525))

(declare-fun m!713527 () Bool)

(assert (=> d!101433 m!713527))

(assert (=> d!101433 m!713279))

(assert (=> d!101433 m!713269))

(declare-fun m!713529 () Bool)

(assert (=> b!767870 m!713529))

(assert (=> b!767870 m!713529))

(assert (=> b!767870 m!713273))

(declare-fun m!713531 () Bool)

(assert (=> b!767870 m!713531))

(assert (=> b!767514 d!101433))

(declare-fun b!767875 () Bool)

(declare-fun c!84647 () Bool)

(declare-fun lt!341590 () (_ BitVec 64))

(assert (=> b!767875 (= c!84647 (= lt!341590 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!427595 () SeekEntryResult!7849)

(declare-fun e!427596 () SeekEntryResult!7849)

(assert (=> b!767875 (= e!427595 e!427596)))

(declare-fun b!767876 () Bool)

(declare-fun e!427597 () SeekEntryResult!7849)

(assert (=> b!767876 (= e!427597 e!427595)))

(declare-fun c!84645 () Bool)

(assert (=> b!767876 (= c!84645 (= lt!341590 (select (arr!20249 a!3186) j!159)))))

(declare-fun lt!341591 () SeekEntryResult!7849)

(declare-fun d!101435 () Bool)

(assert (=> d!101435 (and (or (is-Undefined!7849 lt!341591) (not (is-Found!7849 lt!341591)) (and (bvsge (index!33765 lt!341591) #b00000000000000000000000000000000) (bvslt (index!33765 lt!341591) (size!20670 a!3186)))) (or (is-Undefined!7849 lt!341591) (is-Found!7849 lt!341591) (not (is-MissingVacant!7849 lt!341591)) (not (= (index!33767 lt!341591) resIntermediateIndex!5)) (and (bvsge (index!33767 lt!341591) #b00000000000000000000000000000000) (bvslt (index!33767 lt!341591) (size!20670 a!3186)))) (or (is-Undefined!7849 lt!341591) (ite (is-Found!7849 lt!341591) (= (select (arr!20249 a!3186) (index!33765 lt!341591)) (select (arr!20249 a!3186) j!159)) (and (is-MissingVacant!7849 lt!341591) (= (index!33767 lt!341591) resIntermediateIndex!5) (= (select (arr!20249 a!3186) (index!33767 lt!341591)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101435 (= lt!341591 e!427597)))

(declare-fun c!84646 () Bool)

(assert (=> d!101435 (= c!84646 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(assert (=> d!101435 (= lt!341590 (select (arr!20249 a!3186) lt!341434))))

(assert (=> d!101435 (validMask!0 mask!3328)))

(assert (=> d!101435 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!341434 resIntermediateIndex!5 (select (arr!20249 a!3186) j!159) a!3186 mask!3328) lt!341591)))

(declare-fun b!767877 () Bool)

(assert (=> b!767877 (= e!427596 (MissingVacant!7849 resIntermediateIndex!5))))

(declare-fun b!767878 () Bool)

(assert (=> b!767878 (= e!427597 Undefined!7849)))

(declare-fun b!767879 () Bool)

(assert (=> b!767879 (= e!427595 (Found!7849 lt!341434))))

(declare-fun b!767880 () Bool)

(assert (=> b!767880 (= e!427596 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!341434 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) resIntermediateIndex!5 (select (arr!20249 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!101435 c!84646) b!767878))

(assert (= (and d!101435 (not c!84646)) b!767876))

(assert (= (and b!767876 c!84645) b!767879))

(assert (= (and b!767876 (not c!84645)) b!767875))

(assert (= (and b!767875 c!84647) b!767877))

(assert (= (and b!767875 (not c!84647)) b!767880))

(declare-fun m!713541 () Bool)

(assert (=> d!101435 m!713541))

(declare-fun m!713543 () Bool)

(assert (=> d!101435 m!713543))

(declare-fun m!713547 () Bool)

(assert (=> d!101435 m!713547))

(assert (=> d!101435 m!713269))

(declare-fun m!713551 () Bool)

(assert (=> b!767880 m!713551))

(assert (=> b!767880 m!713551))

(assert (=> b!767880 m!713273))

(declare-fun m!713553 () Bool)

(assert (=> b!767880 m!713553))

(assert (=> b!767528 d!101435))

(declare-fun d!101439 () Bool)

(declare-fun res!519376 () Bool)

(declare-fun e!427605 () Bool)

(assert (=> d!101439 (=> res!519376 e!427605)))

(assert (=> d!101439 (= res!519376 (= (select (arr!20249 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!101439 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!427605)))

(declare-fun b!767889 () Bool)

(declare-fun e!427606 () Bool)

(assert (=> b!767889 (= e!427605 e!427606)))

(declare-fun res!519377 () Bool)

(assert (=> b!767889 (=> (not res!519377) (not e!427606))))

(assert (=> b!767889 (= res!519377 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20670 a!3186)))))

(declare-fun b!767890 () Bool)

(assert (=> b!767890 (= e!427606 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!101439 (not res!519376)) b!767889))

(assert (= (and b!767889 res!519377) b!767890))

(assert (=> d!101439 m!713517))

(declare-fun m!713561 () Bool)

(assert (=> b!767890 m!713561))

(assert (=> b!767517 d!101439))

(declare-fun d!101443 () Bool)

(declare-fun res!519379 () Bool)

(declare-fun e!427607 () Bool)

(assert (=> d!101443 (=> res!519379 e!427607)))

(assert (=> d!101443 (= res!519379 (bvsge #b00000000000000000000000000000000 (size!20670 a!3186)))))

(assert (=> d!101443 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!427607)))

(declare-fun b!767891 () Bool)

(declare-fun e!427608 () Bool)

(declare-fun call!35082 () Bool)

(assert (=> b!767891 (= e!427608 call!35082)))

(declare-fun b!767892 () Bool)

(declare-fun e!427609 () Bool)

(assert (=> b!767892 (= e!427608 e!427609)))

(declare-fun lt!341595 () (_ BitVec 64))

(assert (=> b!767892 (= lt!341595 (select (arr!20249 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!341596 () Unit!26424)

(assert (=> b!767892 (= lt!341596 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!341595 #b00000000000000000000000000000000))))

(assert (=> b!767892 (arrayContainsKey!0 a!3186 lt!341595 #b00000000000000000000000000000000)))

(declare-fun lt!341597 () Unit!26424)

(assert (=> b!767892 (= lt!341597 lt!341596)))

(declare-fun res!519378 () Bool)

(assert (=> b!767892 (= res!519378 (= (seekEntryOrOpen!0 (select (arr!20249 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7849 #b00000000000000000000000000000000)))))

(assert (=> b!767892 (=> (not res!519378) (not e!427609))))

(declare-fun b!767893 () Bool)

(assert (=> b!767893 (= e!427609 call!35082)))

(declare-fun b!767894 () Bool)

(assert (=> b!767894 (= e!427607 e!427608)))

(declare-fun c!84649 () Bool)

(assert (=> b!767894 (= c!84649 (validKeyInArray!0 (select (arr!20249 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35079 () Bool)

(assert (=> bm!35079 (= call!35082 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(assert (= (and d!101443 (not res!519379)) b!767894))

(assert (= (and b!767894 c!84649) b!767892))

(assert (= (and b!767894 (not c!84649)) b!767891))

(assert (= (and b!767892 res!519378) b!767893))

(assert (= (or b!767893 b!767891) bm!35079))

(assert (=> b!767892 m!713517))

(declare-fun m!713563 () Bool)

(assert (=> b!767892 m!713563))

(declare-fun m!713565 () Bool)

(assert (=> b!767892 m!713565))

(assert (=> b!767892 m!713517))

(declare-fun m!713567 () Bool)

(assert (=> b!767892 m!713567))

(assert (=> b!767894 m!713517))

(assert (=> b!767894 m!713517))

(assert (=> b!767894 m!713519))

(declare-fun m!713569 () Bool)

(assert (=> bm!35079 m!713569))

(assert (=> b!767516 d!101443))

(declare-fun b!767895 () Bool)

(declare-fun e!427612 () SeekEntryResult!7849)

(declare-fun e!427613 () SeekEntryResult!7849)

(assert (=> b!767895 (= e!427612 e!427613)))

(declare-fun c!84650 () Bool)

(declare-fun lt!341599 () (_ BitVec 64))

(assert (=> b!767895 (= c!84650 (or (= lt!341599 lt!341432) (= (bvadd lt!341599 lt!341599) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!767896 () Bool)

(declare-fun lt!341598 () SeekEntryResult!7849)

(assert (=> b!767896 (and (bvsge (index!33766 lt!341598) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341598) (size!20670 lt!341437)))))

(declare-fun res!519380 () Bool)

(assert (=> b!767896 (= res!519380 (= (select (arr!20249 lt!341437) (index!33766 lt!341598)) lt!341432))))

(declare-fun e!427614 () Bool)

(assert (=> b!767896 (=> res!519380 e!427614)))

(declare-fun e!427610 () Bool)

(assert (=> b!767896 (= e!427610 e!427614)))

(declare-fun b!767897 () Bool)

(assert (=> b!767897 (and (bvsge (index!33766 lt!341598) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341598) (size!20670 lt!341437)))))

(assert (=> b!767897 (= e!427614 (= (select (arr!20249 lt!341437) (index!33766 lt!341598)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!767898 () Bool)

(assert (=> b!767898 (and (bvsge (index!33766 lt!341598) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341598) (size!20670 lt!341437)))))

(declare-fun res!519381 () Bool)

(assert (=> b!767898 (= res!519381 (= (select (arr!20249 lt!341437) (index!33766 lt!341598)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!767898 (=> res!519381 e!427614)))

(declare-fun b!767899 () Bool)

(declare-fun e!427611 () Bool)

(assert (=> b!767899 (= e!427611 (bvsge (x!64675 lt!341598) #b01111111111111111111111111111110))))

(declare-fun b!767901 () Bool)

(assert (=> b!767901 (= e!427612 (Intermediate!7849 true index!1321 x!1131))))

(declare-fun b!767902 () Bool)

(assert (=> b!767902 (= e!427613 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!341432 lt!341437 mask!3328))))

(declare-fun b!767903 () Bool)

(assert (=> b!767903 (= e!427613 (Intermediate!7849 false index!1321 x!1131))))

(declare-fun d!101445 () Bool)

(assert (=> d!101445 e!427611))

(declare-fun c!84651 () Bool)

(assert (=> d!101445 (= c!84651 (and (is-Intermediate!7849 lt!341598) (undefined!8661 lt!341598)))))

(assert (=> d!101445 (= lt!341598 e!427612)))

(declare-fun c!84652 () Bool)

(assert (=> d!101445 (= c!84652 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101445 (= lt!341599 (select (arr!20249 lt!341437) index!1321))))

(assert (=> d!101445 (validMask!0 mask!3328)))

(assert (=> d!101445 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!341432 lt!341437 mask!3328) lt!341598)))

(declare-fun b!767900 () Bool)

(assert (=> b!767900 (= e!427611 e!427610)))

(declare-fun res!519382 () Bool)

(assert (=> b!767900 (= res!519382 (and (is-Intermediate!7849 lt!341598) (not (undefined!8661 lt!341598)) (bvslt (x!64675 lt!341598) #b01111111111111111111111111111110) (bvsge (x!64675 lt!341598) #b00000000000000000000000000000000) (bvsge (x!64675 lt!341598) x!1131)))))

(assert (=> b!767900 (=> (not res!519382) (not e!427610))))

(assert (= (and d!101445 c!84652) b!767901))

(assert (= (and d!101445 (not c!84652)) b!767895))

(assert (= (and b!767895 c!84650) b!767903))

(assert (= (and b!767895 (not c!84650)) b!767902))

(assert (= (and d!101445 c!84651) b!767899))

(assert (= (and d!101445 (not c!84651)) b!767900))

(assert (= (and b!767900 res!519382) b!767896))

(assert (= (and b!767896 (not res!519380)) b!767898))

(assert (= (and b!767898 (not res!519381)) b!767897))

(assert (=> b!767902 m!713287))

(assert (=> b!767902 m!713287))

(declare-fun m!713571 () Bool)

(assert (=> b!767902 m!713571))

(declare-fun m!713573 () Bool)

(assert (=> b!767897 m!713573))

(declare-fun m!713575 () Bool)

(assert (=> d!101445 m!713575))

(assert (=> d!101445 m!713269))

(assert (=> b!767896 m!713573))

(assert (=> b!767898 m!713573))

(assert (=> b!767527 d!101445))

(declare-fun b!767904 () Bool)

(declare-fun e!427617 () SeekEntryResult!7849)

(declare-fun e!427618 () SeekEntryResult!7849)

(assert (=> b!767904 (= e!427617 e!427618)))

(declare-fun c!84653 () Bool)

(declare-fun lt!341604 () (_ BitVec 64))

(assert (=> b!767904 (= c!84653 (or (= lt!341604 lt!341432) (= (bvadd lt!341604 lt!341604) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!767905 () Bool)

(declare-fun lt!341603 () SeekEntryResult!7849)

(assert (=> b!767905 (and (bvsge (index!33766 lt!341603) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341603) (size!20670 lt!341437)))))

(declare-fun res!519383 () Bool)

(assert (=> b!767905 (= res!519383 (= (select (arr!20249 lt!341437) (index!33766 lt!341603)) lt!341432))))

(declare-fun e!427619 () Bool)

(assert (=> b!767905 (=> res!519383 e!427619)))

(declare-fun e!427615 () Bool)

(assert (=> b!767905 (= e!427615 e!427619)))

(declare-fun b!767906 () Bool)

(assert (=> b!767906 (and (bvsge (index!33766 lt!341603) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341603) (size!20670 lt!341437)))))

(assert (=> b!767906 (= e!427619 (= (select (arr!20249 lt!341437) (index!33766 lt!341603)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!767907 () Bool)

(assert (=> b!767907 (and (bvsge (index!33766 lt!341603) #b00000000000000000000000000000000) (bvslt (index!33766 lt!341603) (size!20670 lt!341437)))))

(declare-fun res!519384 () Bool)

(assert (=> b!767907 (= res!519384 (= (select (arr!20249 lt!341437) (index!33766 lt!341603)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!767907 (=> res!519384 e!427619)))

(declare-fun b!767908 () Bool)

(declare-fun e!427616 () Bool)

(assert (=> b!767908 (= e!427616 (bvsge (x!64675 lt!341603) #b01111111111111111111111111111110))))

(declare-fun b!767910 () Bool)

(assert (=> b!767910 (= e!427617 (Intermediate!7849 true (toIndex!0 lt!341432 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!767911 () Bool)

(assert (=> b!767911 (= e!427618 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!341432 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!341432 lt!341437 mask!3328))))

(declare-fun b!767912 () Bool)

(assert (=> b!767912 (= e!427618 (Intermediate!7849 false (toIndex!0 lt!341432 mask!3328) #b00000000000000000000000000000000))))

(declare-fun d!101447 () Bool)

(assert (=> d!101447 e!427616))

(declare-fun c!84654 () Bool)

(assert (=> d!101447 (= c!84654 (and (is-Intermediate!7849 lt!341603) (undefined!8661 lt!341603)))))

(assert (=> d!101447 (= lt!341603 e!427617)))

(declare-fun c!84655 () Bool)

(assert (=> d!101447 (= c!84655 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!101447 (= lt!341604 (select (arr!20249 lt!341437) (toIndex!0 lt!341432 mask!3328)))))

(assert (=> d!101447 (validMask!0 mask!3328)))

(assert (=> d!101447 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!341432 mask!3328) lt!341432 lt!341437 mask!3328) lt!341603)))

(declare-fun b!767909 () Bool)

(assert (=> b!767909 (= e!427616 e!427615)))

(declare-fun res!519385 () Bool)

(assert (=> b!767909 (= res!519385 (and (is-Intermediate!7849 lt!341603) (not (undefined!8661 lt!341603)) (bvslt (x!64675 lt!341603) #b01111111111111111111111111111110) (bvsge (x!64675 lt!341603) #b00000000000000000000000000000000) (bvsge (x!64675 lt!341603) #b00000000000000000000000000000000)))))

(assert (=> b!767909 (=> (not res!519385) (not e!427615))))

(assert (= (and d!101447 c!84655) b!767910))

(assert (= (and d!101447 (not c!84655)) b!767904))

(assert (= (and b!767904 c!84653) b!767912))

(assert (= (and b!767904 (not c!84653)) b!767911))

(assert (= (and d!101447 c!84654) b!767908))

(assert (= (and d!101447 (not c!84654)) b!767909))

(assert (= (and b!767909 res!519385) b!767905))

(assert (= (and b!767905 (not res!519383)) b!767907))

(assert (= (and b!767907 (not res!519384)) b!767906))

(assert (=> b!767911 m!713297))

(declare-fun m!713579 () Bool)

(assert (=> b!767911 m!713579))

(assert (=> b!767911 m!713579))

(declare-fun m!713581 () Bool)

(assert (=> b!767911 m!713581))

(declare-fun m!713583 () Bool)

(assert (=> b!767906 m!713583))

(assert (=> d!101447 m!713297))

(declare-fun m!713585 () Bool)

(assert (=> d!101447 m!713585))

(assert (=> d!101447 m!713269))

(assert (=> b!767905 m!713583))

(assert (=> b!767907 m!713583))

(assert (=> b!767527 d!101447))

(declare-fun d!101451 () Bool)

(declare-fun lt!341606 () (_ BitVec 32))

(declare-fun lt!341605 () (_ BitVec 32))

(assert (=> d!101451 (= lt!341606 (bvmul (bvxor lt!341605 (bvlshr lt!341605 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101451 (= lt!341605 ((_ extract 31 0) (bvand (bvxor lt!341432 (bvlshr lt!341432 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101451 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!519343 (let ((h!15343 ((_ extract 31 0) (bvand (bvxor lt!341432 (bvlshr lt!341432 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64686 (bvmul (bvxor h!15343 (bvlshr h!15343 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64686 (bvlshr x!64686 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!519343 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!519343 #b00000000000000000000000000000000))))))

(assert (=> d!101451 (= (toIndex!0 lt!341432 mask!3328) (bvand (bvxor lt!341606 (bvlshr lt!341606 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!767527 d!101451))

(declare-fun d!101453 () Bool)

(assert (=> d!101453 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!767520 d!101453))

(declare-fun b!767913 () Bool)

(declare-fun e!427621 () SeekEntryResult!7849)

(declare-fun e!427622 () SeekEntryResult!7849)

