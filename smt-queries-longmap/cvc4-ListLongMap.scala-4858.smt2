; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66922 () Bool)

(assert start!66922)

(declare-fun b!772358 () Bool)

(declare-fun e!429959 () Bool)

(declare-fun e!429960 () Bool)

(assert (=> b!772358 (= e!429959 (not e!429960))))

(declare-fun res!522454 () Bool)

(assert (=> b!772358 (=> res!522454 e!429960)))

(declare-datatypes ((SeekEntryResult!7906 0))(
  ( (MissingZero!7906 (index!33992 (_ BitVec 32))) (Found!7906 (index!33993 (_ BitVec 32))) (Intermediate!7906 (undefined!8718 Bool) (index!33994 (_ BitVec 32)) (x!64921 (_ BitVec 32))) (Undefined!7906) (MissingVacant!7906 (index!33995 (_ BitVec 32))) )
))
(declare-fun lt!343892 () SeekEntryResult!7906)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!772358 (= res!522454 (or (not (is-Intermediate!7906 lt!343892)) (bvsge x!1131 (x!64921 lt!343892))))))

(declare-fun e!429965 () Bool)

(assert (=> b!772358 e!429965))

(declare-fun res!522452 () Bool)

(assert (=> b!772358 (=> (not res!522452) (not e!429965))))

(declare-datatypes ((array!42415 0))(
  ( (array!42416 (arr!20306 (Array (_ BitVec 32) (_ BitVec 64))) (size!20727 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42415)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42415 (_ BitVec 32)) Bool)

(assert (=> b!772358 (= res!522452 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26638 0))(
  ( (Unit!26639) )
))
(declare-fun lt!343884 () Unit!26638)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42415 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26638)

(assert (=> b!772358 (= lt!343884 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!772359 () Bool)

(declare-fun res!522457 () Bool)

(declare-fun e!429964 () Bool)

(assert (=> b!772359 (=> (not res!522457) (not e!429964))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!772359 (= res!522457 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20727 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20727 a!3186))))))

(declare-fun res!522453 () Bool)

(declare-fun e!429963 () Bool)

(assert (=> start!66922 (=> (not res!522453) (not e!429963))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66922 (= res!522453 (validMask!0 mask!3328))))

(assert (=> start!66922 e!429963))

(assert (=> start!66922 true))

(declare-fun array_inv!16102 (array!42415) Bool)

(assert (=> start!66922 (array_inv!16102 a!3186)))

(declare-fun b!772360 () Bool)

(declare-fun lt!343889 () SeekEntryResult!7906)

(declare-fun e!429958 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42415 (_ BitVec 32)) SeekEntryResult!7906)

(assert (=> b!772360 (= e!429958 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20306 a!3186) j!159) a!3186 mask!3328) lt!343889))))

(declare-fun b!772361 () Bool)

(declare-fun lt!343885 () (_ BitVec 32))

(assert (=> b!772361 (= e!429960 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (and (bvsge lt!343885 #b00000000000000000000000000000000) (bvslt lt!343885 (size!20727 a!3186)))))))

(declare-fun lt!343890 () Unit!26638)

(declare-fun e!429962 () Unit!26638)

(assert (=> b!772361 (= lt!343890 e!429962)))

(declare-fun c!85351 () Bool)

(assert (=> b!772361 (= c!85351 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!772361 (= lt!343885 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!772362 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42415 (_ BitVec 32)) SeekEntryResult!7906)

(assert (=> b!772362 (= e!429958 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20306 a!3186) j!159) a!3186 mask!3328) (Found!7906 j!159)))))

(declare-fun b!772363 () Bool)

(declare-fun res!522464 () Bool)

(assert (=> b!772363 (=> (not res!522464) (not e!429964))))

(assert (=> b!772363 (= res!522464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!772364 () Bool)

(declare-fun res!522458 () Bool)

(declare-fun e!429957 () Bool)

(assert (=> b!772364 (=> (not res!522458) (not e!429957))))

(assert (=> b!772364 (= res!522458 e!429958)))

(declare-fun c!85350 () Bool)

(assert (=> b!772364 (= c!85350 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!772365 () Bool)

(declare-fun res!522455 () Bool)

(assert (=> b!772365 (=> (not res!522455) (not e!429964))))

(declare-datatypes ((List!14308 0))(
  ( (Nil!14305) (Cons!14304 (h!15406 (_ BitVec 64)) (t!20623 List!14308)) )
))
(declare-fun arrayNoDuplicates!0 (array!42415 (_ BitVec 32) List!14308) Bool)

(assert (=> b!772365 (= res!522455 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14305))))

(declare-fun e!429956 () Bool)

(declare-fun lt!343887 () SeekEntryResult!7906)

(declare-fun b!772366 () Bool)

(assert (=> b!772366 (= e!429956 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20306 a!3186) j!159) a!3186 mask!3328) lt!343887))))

(declare-fun b!772367 () Bool)

(declare-fun res!522467 () Bool)

(assert (=> b!772367 (=> (not res!522467) (not e!429963))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!772367 (= res!522467 (and (= (size!20727 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20727 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20727 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!772368 () Bool)

(declare-fun res!522465 () Bool)

(assert (=> b!772368 (=> (not res!522465) (not e!429963))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!772368 (= res!522465 (validKeyInArray!0 k!2102))))

(declare-fun b!772369 () Bool)

(assert (=> b!772369 (= e!429965 e!429956)))

(declare-fun res!522466 () Bool)

(assert (=> b!772369 (=> (not res!522466) (not e!429956))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42415 (_ BitVec 32)) SeekEntryResult!7906)

(assert (=> b!772369 (= res!522466 (= (seekEntryOrOpen!0 (select (arr!20306 a!3186) j!159) a!3186 mask!3328) lt!343887))))

(assert (=> b!772369 (= lt!343887 (Found!7906 j!159))))

(declare-fun b!772370 () Bool)

(declare-fun res!522461 () Bool)

(assert (=> b!772370 (=> (not res!522461) (not e!429963))))

(declare-fun arrayContainsKey!0 (array!42415 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!772370 (= res!522461 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!772371 () Bool)

(assert (=> b!772371 (= e!429963 e!429964)))

(declare-fun res!522463 () Bool)

(assert (=> b!772371 (=> (not res!522463) (not e!429964))))

(declare-fun lt!343882 () SeekEntryResult!7906)

(assert (=> b!772371 (= res!522463 (or (= lt!343882 (MissingZero!7906 i!1173)) (= lt!343882 (MissingVacant!7906 i!1173))))))

(assert (=> b!772371 (= lt!343882 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!772372 () Bool)

(declare-fun res!522456 () Bool)

(assert (=> b!772372 (=> (not res!522456) (not e!429963))))

(assert (=> b!772372 (= res!522456 (validKeyInArray!0 (select (arr!20306 a!3186) j!159)))))

(declare-fun b!772373 () Bool)

(declare-fun res!522459 () Bool)

(assert (=> b!772373 (=> (not res!522459) (not e!429957))))

(assert (=> b!772373 (= res!522459 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20306 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!772374 () Bool)

(declare-fun Unit!26640 () Unit!26638)

(assert (=> b!772374 (= e!429962 Unit!26640)))

(assert (=> b!772374 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343885 (select (arr!20306 a!3186) j!159) a!3186 mask!3328) lt!343889)))

(declare-fun b!772375 () Bool)

(assert (=> b!772375 (= e!429957 e!429959)))

(declare-fun res!522462 () Bool)

(assert (=> b!772375 (=> (not res!522462) (not e!429959))))

(declare-fun lt!343891 () SeekEntryResult!7906)

(assert (=> b!772375 (= res!522462 (= lt!343891 lt!343892))))

(declare-fun lt!343888 () array!42415)

(declare-fun lt!343886 () (_ BitVec 64))

(assert (=> b!772375 (= lt!343892 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343886 lt!343888 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!772375 (= lt!343891 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343886 mask!3328) lt!343886 lt!343888 mask!3328))))

(assert (=> b!772375 (= lt!343886 (select (store (arr!20306 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!772375 (= lt!343888 (array!42416 (store (arr!20306 a!3186) i!1173 k!2102) (size!20727 a!3186)))))

(declare-fun b!772376 () Bool)

(declare-fun Unit!26641 () Unit!26638)

(assert (=> b!772376 (= e!429962 Unit!26641)))

(declare-fun lt!343883 () SeekEntryResult!7906)

(assert (=> b!772376 (= lt!343883 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20306 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!772376 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343885 resIntermediateIndex!5 (select (arr!20306 a!3186) j!159) a!3186 mask!3328) (Found!7906 j!159))))

(declare-fun b!772377 () Bool)

(assert (=> b!772377 (= e!429964 e!429957)))

(declare-fun res!522460 () Bool)

(assert (=> b!772377 (=> (not res!522460) (not e!429957))))

(assert (=> b!772377 (= res!522460 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20306 a!3186) j!159) mask!3328) (select (arr!20306 a!3186) j!159) a!3186 mask!3328) lt!343889))))

(assert (=> b!772377 (= lt!343889 (Intermediate!7906 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!66922 res!522453) b!772367))

(assert (= (and b!772367 res!522467) b!772372))

(assert (= (and b!772372 res!522456) b!772368))

(assert (= (and b!772368 res!522465) b!772370))

(assert (= (and b!772370 res!522461) b!772371))

(assert (= (and b!772371 res!522463) b!772363))

(assert (= (and b!772363 res!522464) b!772365))

(assert (= (and b!772365 res!522455) b!772359))

(assert (= (and b!772359 res!522457) b!772377))

(assert (= (and b!772377 res!522460) b!772373))

(assert (= (and b!772373 res!522459) b!772364))

(assert (= (and b!772364 c!85350) b!772360))

(assert (= (and b!772364 (not c!85350)) b!772362))

(assert (= (and b!772364 res!522458) b!772375))

(assert (= (and b!772375 res!522462) b!772358))

(assert (= (and b!772358 res!522452) b!772369))

(assert (= (and b!772369 res!522466) b!772366))

(assert (= (and b!772358 (not res!522454)) b!772361))

(assert (= (and b!772361 c!85351) b!772374))

(assert (= (and b!772361 (not c!85351)) b!772376))

(declare-fun m!717307 () Bool)

(assert (=> b!772360 m!717307))

(assert (=> b!772360 m!717307))

(declare-fun m!717309 () Bool)

(assert (=> b!772360 m!717309))

(assert (=> b!772376 m!717307))

(assert (=> b!772376 m!717307))

(declare-fun m!717311 () Bool)

(assert (=> b!772376 m!717311))

(assert (=> b!772376 m!717307))

(declare-fun m!717313 () Bool)

(assert (=> b!772376 m!717313))

(declare-fun m!717315 () Bool)

(assert (=> b!772375 m!717315))

(declare-fun m!717317 () Bool)

(assert (=> b!772375 m!717317))

(declare-fun m!717319 () Bool)

(assert (=> b!772375 m!717319))

(assert (=> b!772375 m!717317))

(declare-fun m!717321 () Bool)

(assert (=> b!772375 m!717321))

(declare-fun m!717323 () Bool)

(assert (=> b!772375 m!717323))

(assert (=> b!772374 m!717307))

(assert (=> b!772374 m!717307))

(declare-fun m!717325 () Bool)

(assert (=> b!772374 m!717325))

(declare-fun m!717327 () Bool)

(assert (=> b!772373 m!717327))

(declare-fun m!717329 () Bool)

(assert (=> start!66922 m!717329))

(declare-fun m!717331 () Bool)

(assert (=> start!66922 m!717331))

(assert (=> b!772372 m!717307))

(assert (=> b!772372 m!717307))

(declare-fun m!717333 () Bool)

(assert (=> b!772372 m!717333))

(assert (=> b!772369 m!717307))

(assert (=> b!772369 m!717307))

(declare-fun m!717335 () Bool)

(assert (=> b!772369 m!717335))

(declare-fun m!717337 () Bool)

(assert (=> b!772363 m!717337))

(assert (=> b!772366 m!717307))

(assert (=> b!772366 m!717307))

(declare-fun m!717339 () Bool)

(assert (=> b!772366 m!717339))

(declare-fun m!717341 () Bool)

(assert (=> b!772368 m!717341))

(declare-fun m!717343 () Bool)

(assert (=> b!772365 m!717343))

(assert (=> b!772362 m!717307))

(assert (=> b!772362 m!717307))

(assert (=> b!772362 m!717311))

(declare-fun m!717345 () Bool)

(assert (=> b!772370 m!717345))

(declare-fun m!717347 () Bool)

(assert (=> b!772358 m!717347))

(declare-fun m!717349 () Bool)

(assert (=> b!772358 m!717349))

(assert (=> b!772377 m!717307))

(assert (=> b!772377 m!717307))

(declare-fun m!717351 () Bool)

(assert (=> b!772377 m!717351))

(assert (=> b!772377 m!717351))

(assert (=> b!772377 m!717307))

(declare-fun m!717353 () Bool)

(assert (=> b!772377 m!717353))

(declare-fun m!717355 () Bool)

(assert (=> b!772361 m!717355))

(declare-fun m!717357 () Bool)

(assert (=> b!772371 m!717357))

(push 1)

(assert (not b!772363))

(assert (not b!772375))

(assert (not b!772368))

(assert (not b!772377))

(assert (not b!772361))

(assert (not b!772371))

(assert (not b!772360))

(assert (not b!772358))

(assert (not b!772372))

(assert (not b!772366))

(assert (not b!772376))

(assert (not b!772362))

(assert (not b!772374))

(assert (not b!772365))

(assert (not b!772369))

(assert (not start!66922))

(assert (not b!772370))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!772456 () Bool)

(declare-fun e!430013 () SeekEntryResult!7906)

(declare-fun e!430011 () SeekEntryResult!7906)

(assert (=> b!772456 (= e!430013 e!430011)))

(declare-fun c!85381 () Bool)

(declare-fun lt!343927 () (_ BitVec 64))

(assert (=> b!772456 (= c!85381 (= lt!343927 (select (arr!20306 a!3186) j!159)))))

(declare-fun b!772457 () Bool)

(assert (=> b!772457 (= e!430013 Undefined!7906)))

(declare-fun b!772458 () Bool)

(declare-fun c!85380 () Bool)

(assert (=> b!772458 (= c!85380 (= lt!343927 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!430012 () SeekEntryResult!7906)

(assert (=> b!772458 (= e!430011 e!430012)))

(declare-fun b!772460 () Bool)

(assert (=> b!772460 (= e!430011 (Found!7906 index!1321))))

(declare-fun b!772461 () Bool)

(assert (=> b!772461 (= e!430012 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20306 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!772459 () Bool)

(assert (=> b!772459 (= e!430012 (MissingVacant!7906 resIntermediateIndex!5))))

(declare-fun lt!343928 () SeekEntryResult!7906)

(declare-fun d!101841 () Bool)

(assert (=> d!101841 (and (or (is-Undefined!7906 lt!343928) (not (is-Found!7906 lt!343928)) (and (bvsge (index!33993 lt!343928) #b00000000000000000000000000000000) (bvslt (index!33993 lt!343928) (size!20727 a!3186)))) (or (is-Undefined!7906 lt!343928) (is-Found!7906 lt!343928) (not (is-MissingVacant!7906 lt!343928)) (not (= (index!33995 lt!343928) resIntermediateIndex!5)) (and (bvsge (index!33995 lt!343928) #b00000000000000000000000000000000) (bvslt (index!33995 lt!343928) (size!20727 a!3186)))) (or (is-Undefined!7906 lt!343928) (ite (is-Found!7906 lt!343928) (= (select (arr!20306 a!3186) (index!33993 lt!343928)) (select (arr!20306 a!3186) j!159)) (and (is-MissingVacant!7906 lt!343928) (= (index!33995 lt!343928) resIntermediateIndex!5) (= (select (arr!20306 a!3186) (index!33995 lt!343928)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101841 (= lt!343928 e!430013)))

(declare-fun c!85379 () Bool)

(assert (=> d!101841 (= c!85379 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101841 (= lt!343927 (select (arr!20306 a!3186) index!1321))))

(assert (=> d!101841 (validMask!0 mask!3328)))

(assert (=> d!101841 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20306 a!3186) j!159) a!3186 mask!3328) lt!343928)))

(assert (= (and d!101841 c!85379) b!772457))

(assert (= (and d!101841 (not c!85379)) b!772456))

(assert (= (and b!772456 c!85381) b!772460))

(assert (= (and b!772456 (not c!85381)) b!772458))

(assert (= (and b!772458 c!85380) b!772459))

(assert (= (and b!772458 (not c!85380)) b!772461))

(assert (=> b!772461 m!717355))

(assert (=> b!772461 m!717355))

(assert (=> b!772461 m!717307))

(declare-fun m!717383 () Bool)

(assert (=> b!772461 m!717383))

(declare-fun m!717385 () Bool)

(assert (=> d!101841 m!717385))

(declare-fun m!717387 () Bool)

(assert (=> d!101841 m!717387))

(declare-fun m!717389 () Bool)

(assert (=> d!101841 m!717389))

(assert (=> d!101841 m!717329))

(assert (=> b!772376 d!101841))

(declare-fun b!772462 () Bool)

(declare-fun e!430016 () SeekEntryResult!7906)

(declare-fun e!430014 () SeekEntryResult!7906)

(assert (=> b!772462 (= e!430016 e!430014)))

(declare-fun lt!343929 () (_ BitVec 64))

(declare-fun c!85384 () Bool)

(assert (=> b!772462 (= c!85384 (= lt!343929 (select (arr!20306 a!3186) j!159)))))

(declare-fun b!772463 () Bool)

(assert (=> b!772463 (= e!430016 Undefined!7906)))

(declare-fun b!772464 () Bool)

(declare-fun c!85383 () Bool)

(assert (=> b!772464 (= c!85383 (= lt!343929 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!430015 () SeekEntryResult!7906)

(assert (=> b!772464 (= e!430014 e!430015)))

(declare-fun b!772466 () Bool)

(assert (=> b!772466 (= e!430014 (Found!7906 lt!343885))))

(declare-fun b!772467 () Bool)

(assert (=> b!772467 (= e!430015 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!343885 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) resIntermediateIndex!5 (select (arr!20306 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!772465 () Bool)

(assert (=> b!772465 (= e!430015 (MissingVacant!7906 resIntermediateIndex!5))))

(declare-fun d!101849 () Bool)

(declare-fun lt!343930 () SeekEntryResult!7906)

(assert (=> d!101849 (and (or (is-Undefined!7906 lt!343930) (not (is-Found!7906 lt!343930)) (and (bvsge (index!33993 lt!343930) #b00000000000000000000000000000000) (bvslt (index!33993 lt!343930) (size!20727 a!3186)))) (or (is-Undefined!7906 lt!343930) (is-Found!7906 lt!343930) (not (is-MissingVacant!7906 lt!343930)) (not (= (index!33995 lt!343930) resIntermediateIndex!5)) (and (bvsge (index!33995 lt!343930) #b00000000000000000000000000000000) (bvslt (index!33995 lt!343930) (size!20727 a!3186)))) (or (is-Undefined!7906 lt!343930) (ite (is-Found!7906 lt!343930) (= (select (arr!20306 a!3186) (index!33993 lt!343930)) (select (arr!20306 a!3186) j!159)) (and (is-MissingVacant!7906 lt!343930) (= (index!33995 lt!343930) resIntermediateIndex!5) (= (select (arr!20306 a!3186) (index!33995 lt!343930)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101849 (= lt!343930 e!430016)))

(declare-fun c!85382 () Bool)

(assert (=> d!101849 (= c!85382 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(assert (=> d!101849 (= lt!343929 (select (arr!20306 a!3186) lt!343885))))

(assert (=> d!101849 (validMask!0 mask!3328)))

(assert (=> d!101849 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343885 resIntermediateIndex!5 (select (arr!20306 a!3186) j!159) a!3186 mask!3328) lt!343930)))

(assert (= (and d!101849 c!85382) b!772463))

(assert (= (and d!101849 (not c!85382)) b!772462))

(assert (= (and b!772462 c!85384) b!772466))

(assert (= (and b!772462 (not c!85384)) b!772464))

(assert (= (and b!772464 c!85383) b!772465))

(assert (= (and b!772464 (not c!85383)) b!772467))

(declare-fun m!717391 () Bool)

(assert (=> b!772467 m!717391))

(assert (=> b!772467 m!717391))

(assert (=> b!772467 m!717307))

(declare-fun m!717393 () Bool)

(assert (=> b!772467 m!717393))

(declare-fun m!717395 () Bool)

(assert (=> d!101849 m!717395))

(declare-fun m!717397 () Bool)

(assert (=> d!101849 m!717397))

(declare-fun m!717399 () Bool)

(assert (=> d!101849 m!717399))

(assert (=> d!101849 m!717329))

(assert (=> b!772376 d!101849))

(declare-fun b!772505 () Bool)

(declare-fun e!430041 () Bool)

(declare-fun e!430040 () Bool)

(assert (=> b!772505 (= e!430041 e!430040)))

(declare-fun c!85399 () Bool)

(assert (=> b!772505 (= c!85399 (validKeyInArray!0 (select (arr!20306 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!772506 () Bool)

(declare-fun e!430039 () Bool)

(assert (=> b!772506 (= e!430039 e!430041)))

(declare-fun res!522504 () Bool)

(assert (=> b!772506 (=> (not res!522504) (not e!430041))))

(declare-fun e!430042 () Bool)

(assert (=> b!772506 (= res!522504 (not e!430042))))

(declare-fun res!522505 () Bool)

(assert (=> b!772506 (=> (not res!522505) (not e!430042))))

(assert (=> b!772506 (= res!522505 (validKeyInArray!0 (select (arr!20306 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35133 () Bool)

(declare-fun call!35136 () Bool)

(assert (=> bm!35133 (= call!35136 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!85399 (Cons!14304 (select (arr!20306 a!3186) #b00000000000000000000000000000000) Nil!14305) Nil!14305)))))

(declare-fun b!772508 () Bool)

(assert (=> b!772508 (= e!430040 call!35136)))

(declare-fun b!772509 () Bool)

(declare-fun contains!4092 (List!14308 (_ BitVec 64)) Bool)

(assert (=> b!772509 (= e!430042 (contains!4092 Nil!14305 (select (arr!20306 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!772507 () Bool)

(assert (=> b!772507 (= e!430040 call!35136)))

(declare-fun d!101851 () Bool)

(declare-fun res!522503 () Bool)

(assert (=> d!101851 (=> res!522503 e!430039)))

(assert (=> d!101851 (= res!522503 (bvsge #b00000000000000000000000000000000 (size!20727 a!3186)))))

(assert (=> d!101851 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14305) e!430039)))

(assert (= (and d!101851 (not res!522503)) b!772506))

(assert (= (and b!772506 res!522505) b!772509))

(assert (= (and b!772506 res!522504) b!772505))

(assert (= (and b!772505 c!85399) b!772508))

(assert (= (and b!772505 (not c!85399)) b!772507))

(assert (= (or b!772508 b!772507) bm!35133))

(declare-fun m!717417 () Bool)

(assert (=> b!772505 m!717417))

(assert (=> b!772505 m!717417))

(declare-fun m!717419 () Bool)

(assert (=> b!772505 m!717419))

(assert (=> b!772506 m!717417))

(assert (=> b!772506 m!717417))

(assert (=> b!772506 m!717419))

(assert (=> bm!35133 m!717417))

(declare-fun m!717421 () Bool)

(assert (=> bm!35133 m!717421))

(assert (=> b!772509 m!717417))

(assert (=> b!772509 m!717417))

(declare-fun m!717423 () Bool)

(assert (=> b!772509 m!717423))

(assert (=> b!772365 d!101851))

(declare-fun b!772601 () Bool)

(declare-fun e!430109 () SeekEntryResult!7906)

(assert (=> b!772601 (= e!430109 (Intermediate!7906 false index!1321 x!1131))))

(declare-fun b!772602 () Bool)

(assert (=> b!772602 (= e!430109 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!343886 lt!343888 mask!3328))))

(declare-fun b!772603 () Bool)

(declare-fun e!430110 () Bool)

(declare-fun e!430106 () Bool)

(assert (=> b!772603 (= e!430110 e!430106)))

(declare-fun res!522547 () Bool)

(declare-fun lt!343970 () SeekEntryResult!7906)

(assert (=> b!772603 (= res!522547 (and (is-Intermediate!7906 lt!343970) (not (undefined!8718 lt!343970)) (bvslt (x!64921 lt!343970) #b01111111111111111111111111111110) (bvsge (x!64921 lt!343970) #b00000000000000000000000000000000) (bvsge (x!64921 lt!343970) x!1131)))))

(assert (=> b!772603 (=> (not res!522547) (not e!430106))))

(declare-fun b!772604 () Bool)

(assert (=> b!772604 (and (bvsge (index!33994 lt!343970) #b00000000000000000000000000000000) (bvslt (index!33994 lt!343970) (size!20727 lt!343888)))))

(declare-fun res!522549 () Bool)

(assert (=> b!772604 (= res!522549 (= (select (arr!20306 lt!343888) (index!33994 lt!343970)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!430107 () Bool)

(assert (=> b!772604 (=> res!522549 e!430107)))

(declare-fun b!772605 () Bool)

(assert (=> b!772605 (= e!430110 (bvsge (x!64921 lt!343970) #b01111111111111111111111111111110))))

(declare-fun b!772606 () Bool)

(assert (=> b!772606 (and (bvsge (index!33994 lt!343970) #b00000000000000000000000000000000) (bvslt (index!33994 lt!343970) (size!20727 lt!343888)))))

(declare-fun res!522548 () Bool)

(assert (=> b!772606 (= res!522548 (= (select (arr!20306 lt!343888) (index!33994 lt!343970)) lt!343886))))

(assert (=> b!772606 (=> res!522548 e!430107)))

(assert (=> b!772606 (= e!430106 e!430107)))

(declare-fun b!772607 () Bool)

(declare-fun e!430108 () SeekEntryResult!7906)

(assert (=> b!772607 (= e!430108 (Intermediate!7906 true index!1321 x!1131))))

(declare-fun d!101859 () Bool)

(assert (=> d!101859 e!430110))

(declare-fun c!85426 () Bool)

(assert (=> d!101859 (= c!85426 (and (is-Intermediate!7906 lt!343970) (undefined!8718 lt!343970)))))

(assert (=> d!101859 (= lt!343970 e!430108)))

(declare-fun c!85427 () Bool)

(assert (=> d!101859 (= c!85427 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!343971 () (_ BitVec 64))

(assert (=> d!101859 (= lt!343971 (select (arr!20306 lt!343888) index!1321))))

(assert (=> d!101859 (validMask!0 mask!3328)))

(assert (=> d!101859 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343886 lt!343888 mask!3328) lt!343970)))

(declare-fun b!772608 () Bool)

(assert (=> b!772608 (= e!430108 e!430109)))

(declare-fun c!85425 () Bool)

(assert (=> b!772608 (= c!85425 (or (= lt!343971 lt!343886) (= (bvadd lt!343971 lt!343971) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!772609 () Bool)

(assert (=> b!772609 (and (bvsge (index!33994 lt!343970) #b00000000000000000000000000000000) (bvslt (index!33994 lt!343970) (size!20727 lt!343888)))))

(assert (=> b!772609 (= e!430107 (= (select (arr!20306 lt!343888) (index!33994 lt!343970)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!101859 c!85427) b!772607))

(assert (= (and d!101859 (not c!85427)) b!772608))

(assert (= (and b!772608 c!85425) b!772601))

(assert (= (and b!772608 (not c!85425)) b!772602))

(assert (= (and d!101859 c!85426) b!772605))

(assert (= (and d!101859 (not c!85426)) b!772603))

(assert (= (and b!772603 res!522547) b!772606))

(assert (= (and b!772606 (not res!522548)) b!772604))

(assert (= (and b!772604 (not res!522549)) b!772609))

(declare-fun m!717479 () Bool)

(assert (=> b!772609 m!717479))

(assert (=> b!772604 m!717479))

(declare-fun m!717481 () Bool)

(assert (=> d!101859 m!717481))

(assert (=> d!101859 m!717329))

(assert (=> b!772602 m!717355))

(assert (=> b!772602 m!717355))

(declare-fun m!717483 () Bool)

(assert (=> b!772602 m!717483))

(assert (=> b!772606 m!717479))

(assert (=> b!772375 d!101859))

(declare-fun b!772610 () Bool)

(declare-fun e!430114 () SeekEntryResult!7906)

(assert (=> b!772610 (= e!430114 (Intermediate!7906 false (toIndex!0 lt!343886 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!772611 () Bool)

(assert (=> b!772611 (= e!430114 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!343886 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!343886 lt!343888 mask!3328))))

(declare-fun b!772612 () Bool)

(declare-fun e!430115 () Bool)

(declare-fun e!430111 () Bool)

(assert (=> b!772612 (= e!430115 e!430111)))

(declare-fun res!522550 () Bool)

(declare-fun lt!343972 () SeekEntryResult!7906)

(assert (=> b!772612 (= res!522550 (and (is-Intermediate!7906 lt!343972) (not (undefined!8718 lt!343972)) (bvslt (x!64921 lt!343972) #b01111111111111111111111111111110) (bvsge (x!64921 lt!343972) #b00000000000000000000000000000000) (bvsge (x!64921 lt!343972) #b00000000000000000000000000000000)))))

(assert (=> b!772612 (=> (not res!522550) (not e!430111))))

(declare-fun b!772613 () Bool)

(assert (=> b!772613 (and (bvsge (index!33994 lt!343972) #b00000000000000000000000000000000) (bvslt (index!33994 lt!343972) (size!20727 lt!343888)))))

(declare-fun res!522552 () Bool)

(assert (=> b!772613 (= res!522552 (= (select (arr!20306 lt!343888) (index!33994 lt!343972)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!430112 () Bool)

(assert (=> b!772613 (=> res!522552 e!430112)))

(declare-fun b!772614 () Bool)

(assert (=> b!772614 (= e!430115 (bvsge (x!64921 lt!343972) #b01111111111111111111111111111110))))

(declare-fun b!772615 () Bool)

(assert (=> b!772615 (and (bvsge (index!33994 lt!343972) #b00000000000000000000000000000000) (bvslt (index!33994 lt!343972) (size!20727 lt!343888)))))

(declare-fun res!522551 () Bool)

(assert (=> b!772615 (= res!522551 (= (select (arr!20306 lt!343888) (index!33994 lt!343972)) lt!343886))))

(assert (=> b!772615 (=> res!522551 e!430112)))

(assert (=> b!772615 (= e!430111 e!430112)))

(declare-fun b!772616 () Bool)

(declare-fun e!430113 () SeekEntryResult!7906)

(assert (=> b!772616 (= e!430113 (Intermediate!7906 true (toIndex!0 lt!343886 mask!3328) #b00000000000000000000000000000000))))

(declare-fun d!101883 () Bool)

(assert (=> d!101883 e!430115))

(declare-fun c!85429 () Bool)

(assert (=> d!101883 (= c!85429 (and (is-Intermediate!7906 lt!343972) (undefined!8718 lt!343972)))))

(assert (=> d!101883 (= lt!343972 e!430113)))

(declare-fun c!85430 () Bool)

(assert (=> d!101883 (= c!85430 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!343973 () (_ BitVec 64))

(assert (=> d!101883 (= lt!343973 (select (arr!20306 lt!343888) (toIndex!0 lt!343886 mask!3328)))))

(assert (=> d!101883 (validMask!0 mask!3328)))

(assert (=> d!101883 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343886 mask!3328) lt!343886 lt!343888 mask!3328) lt!343972)))

(declare-fun b!772617 () Bool)

(assert (=> b!772617 (= e!430113 e!430114)))

(declare-fun c!85428 () Bool)

(assert (=> b!772617 (= c!85428 (or (= lt!343973 lt!343886) (= (bvadd lt!343973 lt!343973) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!772618 () Bool)

(assert (=> b!772618 (and (bvsge (index!33994 lt!343972) #b00000000000000000000000000000000) (bvslt (index!33994 lt!343972) (size!20727 lt!343888)))))

(assert (=> b!772618 (= e!430112 (= (select (arr!20306 lt!343888) (index!33994 lt!343972)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!101883 c!85430) b!772616))

(assert (= (and d!101883 (not c!85430)) b!772617))

(assert (= (and b!772617 c!85428) b!772610))

(assert (= (and b!772617 (not c!85428)) b!772611))

(assert (= (and d!101883 c!85429) b!772614))

(assert (= (and d!101883 (not c!85429)) b!772612))

(assert (= (and b!772612 res!522550) b!772615))

(assert (= (and b!772615 (not res!522551)) b!772613))

(assert (= (and b!772613 (not res!522552)) b!772618))

(declare-fun m!717485 () Bool)

(assert (=> b!772618 m!717485))

(assert (=> b!772613 m!717485))

(assert (=> d!101883 m!717317))

(declare-fun m!717487 () Bool)

(assert (=> d!101883 m!717487))

(assert (=> d!101883 m!717329))

(assert (=> b!772611 m!717317))

(declare-fun m!717489 () Bool)

(assert (=> b!772611 m!717489))

(assert (=> b!772611 m!717489))

(declare-fun m!717491 () Bool)

(assert (=> b!772611 m!717491))

(assert (=> b!772615 m!717485))

(assert (=> b!772375 d!101883))

(declare-fun d!101885 () Bool)

(declare-fun lt!343983 () (_ BitVec 32))

(declare-fun lt!343982 () (_ BitVec 32))

(assert (=> d!101885 (= lt!343983 (bvmul (bvxor lt!343982 (bvlshr lt!343982 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101885 (= lt!343982 ((_ extract 31 0) (bvand (bvxor lt!343886 (bvlshr lt!343886 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101885 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!522553 (let ((h!15409 ((_ extract 31 0) (bvand (bvxor lt!343886 (bvlshr lt!343886 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64930 (bvmul (bvxor h!15409 (bvlshr h!15409 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64930 (bvlshr x!64930 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!522553 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!522553 #b00000000000000000000000000000000))))))

(assert (=> d!101885 (= (toIndex!0 lt!343886 mask!3328) (bvand (bvxor lt!343983 (bvlshr lt!343983 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!772375 d!101885))

(declare-fun b!772631 () Bool)

(declare-fun e!430125 () SeekEntryResult!7906)

(assert (=> b!772631 (= e!430125 (Intermediate!7906 false lt!343885 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun b!772632 () Bool)

(assert (=> b!772632 (= e!430125 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!343885 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) (select (arr!20306 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!772633 () Bool)

(declare-fun e!430126 () Bool)

(declare-fun e!430122 () Bool)

(assert (=> b!772633 (= e!430126 e!430122)))

(declare-fun res!522554 () Bool)

(declare-fun lt!343984 () SeekEntryResult!7906)

(assert (=> b!772633 (= res!522554 (and (is-Intermediate!7906 lt!343984) (not (undefined!8718 lt!343984)) (bvslt (x!64921 lt!343984) #b01111111111111111111111111111110) (bvsge (x!64921 lt!343984) #b00000000000000000000000000000000) (bvsge (x!64921 lt!343984) (bvadd #b00000000000000000000000000000001 x!1131))))))

(assert (=> b!772633 (=> (not res!522554) (not e!430122))))

(declare-fun b!772634 () Bool)

(assert (=> b!772634 (and (bvsge (index!33994 lt!343984) #b00000000000000000000000000000000) (bvslt (index!33994 lt!343984) (size!20727 a!3186)))))

(declare-fun res!522556 () Bool)

(assert (=> b!772634 (= res!522556 (= (select (arr!20306 a!3186) (index!33994 lt!343984)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!430123 () Bool)

(assert (=> b!772634 (=> res!522556 e!430123)))

(declare-fun b!772635 () Bool)

(assert (=> b!772635 (= e!430126 (bvsge (x!64921 lt!343984) #b01111111111111111111111111111110))))

(declare-fun b!772636 () Bool)

(assert (=> b!772636 (and (bvsge (index!33994 lt!343984) #b00000000000000000000000000000000) (bvslt (index!33994 lt!343984) (size!20727 a!3186)))))

(declare-fun res!522555 () Bool)

(assert (=> b!772636 (= res!522555 (= (select (arr!20306 a!3186) (index!33994 lt!343984)) (select (arr!20306 a!3186) j!159)))))

(assert (=> b!772636 (=> res!522555 e!430123)))

(assert (=> b!772636 (= e!430122 e!430123)))

(declare-fun b!772637 () Bool)

(declare-fun e!430124 () SeekEntryResult!7906)

(assert (=> b!772637 (= e!430124 (Intermediate!7906 true lt!343885 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun d!101887 () Bool)

(assert (=> d!101887 e!430126))

(declare-fun c!85438 () Bool)

(assert (=> d!101887 (= c!85438 (and (is-Intermediate!7906 lt!343984) (undefined!8718 lt!343984)))))

(assert (=> d!101887 (= lt!343984 e!430124)))

(declare-fun c!85439 () Bool)

(assert (=> d!101887 (= c!85439 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(declare-fun lt!343985 () (_ BitVec 64))

(assert (=> d!101887 (= lt!343985 (select (arr!20306 a!3186) lt!343885))))

(assert (=> d!101887 (validMask!0 mask!3328)))

(assert (=> d!101887 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343885 (select (arr!20306 a!3186) j!159) a!3186 mask!3328) lt!343984)))

(declare-fun b!772638 () Bool)

(assert (=> b!772638 (= e!430124 e!430125)))

(declare-fun c!85437 () Bool)

(assert (=> b!772638 (= c!85437 (or (= lt!343985 (select (arr!20306 a!3186) j!159)) (= (bvadd lt!343985 lt!343985) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!772639 () Bool)

(assert (=> b!772639 (and (bvsge (index!33994 lt!343984) #b00000000000000000000000000000000) (bvslt (index!33994 lt!343984) (size!20727 a!3186)))))

(assert (=> b!772639 (= e!430123 (= (select (arr!20306 a!3186) (index!33994 lt!343984)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!101887 c!85439) b!772637))

(assert (= (and d!101887 (not c!85439)) b!772638))

(assert (= (and b!772638 c!85437) b!772631))

(assert (= (and b!772638 (not c!85437)) b!772632))

(assert (= (and d!101887 c!85438) b!772635))

(assert (= (and d!101887 (not c!85438)) b!772633))

(assert (= (and b!772633 res!522554) b!772636))

(assert (= (and b!772636 (not res!522555)) b!772634))

(assert (= (and b!772634 (not res!522556)) b!772639))

(declare-fun m!717493 () Bool)

(assert (=> b!772639 m!717493))

(assert (=> b!772634 m!717493))

(assert (=> d!101887 m!717399))

(assert (=> d!101887 m!717329))

(assert (=> b!772632 m!717391))

(assert (=> b!772632 m!717391))

(assert (=> b!772632 m!717307))

(declare-fun m!717495 () Bool)

(assert (=> b!772632 m!717495))

(assert (=> b!772636 m!717493))

(assert (=> b!772374 d!101887))

(declare-fun b!772700 () Bool)

(declare-fun e!430162 () Bool)

(declare-fun e!430163 () Bool)

(assert (=> b!772700 (= e!430162 e!430163)))

(declare-fun lt!344017 () (_ BitVec 64))

(assert (=> b!772700 (= lt!344017 (select (arr!20306 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!344016 () Unit!26638)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42415 (_ BitVec 64) (_ BitVec 32)) Unit!26638)

(assert (=> b!772700 (= lt!344016 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!344017 #b00000000000000000000000000000000))))

(assert (=> b!772700 (arrayContainsKey!0 a!3186 lt!344017 #b00000000000000000000000000000000)))

(declare-fun lt!344015 () Unit!26638)

(assert (=> b!772700 (= lt!344015 lt!344016)))

(declare-fun res!522570 () Bool)

(assert (=> b!772700 (= res!522570 (= (seekEntryOrOpen!0 (select (arr!20306 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7906 #b00000000000000000000000000000000)))))

(assert (=> b!772700 (=> (not res!522570) (not e!430163))))

(declare-fun bm!35147 () Bool)

(declare-fun call!35150 () Bool)

(assert (=> bm!35147 (= call!35150 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!772701 () Bool)

(assert (=> b!772701 (= e!430162 call!35150)))

(declare-fun d!101889 () Bool)

(declare-fun res!522569 () Bool)

(declare-fun e!430161 () Bool)

(assert (=> d!101889 (=> res!522569 e!430161)))

(assert (=> d!101889 (= res!522569 (bvsge #b00000000000000000000000000000000 (size!20727 a!3186)))))

(assert (=> d!101889 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!430161)))

(declare-fun b!772702 () Bool)

(assert (=> b!772702 (= e!430163 call!35150)))

(declare-fun b!772703 () Bool)

(assert (=> b!772703 (= e!430161 e!430162)))

(declare-fun c!85464 () Bool)

(assert (=> b!772703 (= c!85464 (validKeyInArray!0 (select (arr!20306 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!101889 (not res!522569)) b!772703))

(assert (= (and b!772703 c!85464) b!772700))

(assert (= (and b!772703 (not c!85464)) b!772701))

(assert (= (and b!772700 res!522570) b!772702))

(assert (= (or b!772702 b!772701) bm!35147))

(assert (=> b!772700 m!717417))

(declare-fun m!717549 () Bool)

(assert (=> b!772700 m!717549))

(declare-fun m!717551 () Bool)

(assert (=> b!772700 m!717551))

(assert (=> b!772700 m!717417))

(declare-fun m!717555 () Bool)

(assert (=> b!772700 m!717555))

(declare-fun m!717557 () Bool)

(assert (=> bm!35147 m!717557))

(assert (=> b!772703 m!717417))

(assert (=> b!772703 m!717417))

(assert (=> b!772703 m!717419))

(assert (=> b!772363 d!101889))

(assert (=> b!772362 d!101841))

(declare-fun d!101907 () Bool)

(assert (=> d!101907 (= (validKeyInArray!0 (select (arr!20306 a!3186) j!159)) (and (not (= (select (arr!20306 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20306 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!772372 d!101907))

(declare-fun d!101911 () Bool)

(declare-fun lt!344030 () (_ BitVec 32))

(assert (=> d!101911 (and (bvsge lt!344030 #b00000000000000000000000000000000) (bvslt lt!344030 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!101911 (= lt!344030 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!101911 (validMask!0 mask!3328)))

(assert (=> d!101911 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!344030)))

(declare-fun bs!21608 () Bool)

(assert (= bs!21608 d!101911))

(declare-fun m!717571 () Bool)

(assert (=> bs!21608 m!717571))

(assert (=> bs!21608 m!717329))

(assert (=> b!772361 d!101911))

(declare-fun b!772741 () Bool)

(declare-fun c!85481 () Bool)

(declare-fun lt!344043 () (_ BitVec 64))

(assert (=> b!772741 (= c!85481 (= lt!344043 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!430185 () SeekEntryResult!7906)

(declare-fun e!430184 () SeekEntryResult!7906)

(assert (=> b!772741 (= e!430185 e!430184)))

(declare-fun b!772742 () Bool)

(declare-fun e!430183 () SeekEntryResult!7906)

(assert (=> b!772742 (= e!430183 Undefined!7906)))

(declare-fun b!772743 () Bool)

(assert (=> b!772743 (= e!430183 e!430185)))

(declare-fun lt!344042 () SeekEntryResult!7906)

(assert (=> b!772743 (= lt!344043 (select (arr!20306 a!3186) (index!33994 lt!344042)))))

(declare-fun c!85480 () Bool)

(assert (=> b!772743 (= c!85480 (= lt!344043 k!2102))))

(declare-fun b!772744 () Bool)

(assert (=> b!772744 (= e!430184 (seekKeyOrZeroReturnVacant!0 (x!64921 lt!344042) (index!33994 lt!344042) (index!33994 lt!344042) k!2102 a!3186 mask!3328))))

(declare-fun b!772745 () Bool)

(assert (=> b!772745 (= e!430185 (Found!7906 (index!33994 lt!344042)))))

(declare-fun b!772740 () Bool)

(assert (=> b!772740 (= e!430184 (MissingZero!7906 (index!33994 lt!344042)))))

(declare-fun d!101915 () Bool)

(declare-fun lt!344041 () SeekEntryResult!7906)

(assert (=> d!101915 (and (or (is-Undefined!7906 lt!344041) (not (is-Found!7906 lt!344041)) (and (bvsge (index!33993 lt!344041) #b00000000000000000000000000000000) (bvslt (index!33993 lt!344041) (size!20727 a!3186)))) (or (is-Undefined!7906 lt!344041) (is-Found!7906 lt!344041) (not (is-MissingZero!7906 lt!344041)) (and (bvsge (index!33992 lt!344041) #b00000000000000000000000000000000) (bvslt (index!33992 lt!344041) (size!20727 a!3186)))) (or (is-Undefined!7906 lt!344041) (is-Found!7906 lt!344041) (is-MissingZero!7906 lt!344041) (not (is-MissingVacant!7906 lt!344041)) (and (bvsge (index!33995 lt!344041) #b00000000000000000000000000000000) (bvslt (index!33995 lt!344041) (size!20727 a!3186)))) (or (is-Undefined!7906 lt!344041) (ite (is-Found!7906 lt!344041) (= (select (arr!20306 a!3186) (index!33993 lt!344041)) k!2102) (ite (is-MissingZero!7906 lt!344041) (= (select (arr!20306 a!3186) (index!33992 lt!344041)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7906 lt!344041) (= (select (arr!20306 a!3186) (index!33995 lt!344041)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101915 (= lt!344041 e!430183)))

(declare-fun c!85482 () Bool)

(assert (=> d!101915 (= c!85482 (and (is-Intermediate!7906 lt!344042) (undefined!8718 lt!344042)))))

(assert (=> d!101915 (= lt!344042 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!101915 (validMask!0 mask!3328)))

(assert (=> d!101915 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!344041)))

(assert (= (and d!101915 c!85482) b!772742))

(assert (= (and d!101915 (not c!85482)) b!772743))

(assert (= (and b!772743 c!85480) b!772745))

(assert (= (and b!772743 (not c!85480)) b!772741))

(assert (= (and b!772741 c!85481) b!772740))

(assert (= (and b!772741 (not c!85481)) b!772744))

(declare-fun m!717587 () Bool)

(assert (=> b!772743 m!717587))

(declare-fun m!717589 () Bool)

(assert (=> b!772744 m!717589))

(declare-fun m!717591 () Bool)

(assert (=> d!101915 m!717591))

(declare-fun m!717593 () Bool)

(assert (=> d!101915 m!717593))

(declare-fun m!717595 () Bool)

(assert (=> d!101915 m!717595))

(declare-fun m!717597 () Bool)

(assert (=> d!101915 m!717597))

(assert (=> d!101915 m!717595))

(declare-fun m!717599 () Bool)

(assert (=> d!101915 m!717599))

(assert (=> d!101915 m!717329))

(assert (=> b!772371 d!101915))

(declare-fun b!772746 () Bool)

(declare-fun e!430189 () SeekEntryResult!7906)

(assert (=> b!772746 (= e!430189 (Intermediate!7906 false index!1321 x!1131))))

(declare-fun b!772747 () Bool)

(assert (=> b!772747 (= e!430189 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20306 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!772748 () Bool)

(declare-fun e!430190 () Bool)

(declare-fun e!430186 () Bool)

(assert (=> b!772748 (= e!430190 e!430186)))

(declare-fun res!522577 () Bool)

(declare-fun lt!344044 () SeekEntryResult!7906)

(assert (=> b!772748 (= res!522577 (and (is-Intermediate!7906 lt!344044) (not (undefined!8718 lt!344044)) (bvslt (x!64921 lt!344044) #b01111111111111111111111111111110) (bvsge (x!64921 lt!344044) #b00000000000000000000000000000000) (bvsge (x!64921 lt!344044) x!1131)))))

(assert (=> b!772748 (=> (not res!522577) (not e!430186))))

(declare-fun b!772749 () Bool)

(assert (=> b!772749 (and (bvsge (index!33994 lt!344044) #b00000000000000000000000000000000) (bvslt (index!33994 lt!344044) (size!20727 a!3186)))))

(declare-fun res!522579 () Bool)

(assert (=> b!772749 (= res!522579 (= (select (arr!20306 a!3186) (index!33994 lt!344044)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!430187 () Bool)

(assert (=> b!772749 (=> res!522579 e!430187)))

(declare-fun b!772750 () Bool)

(assert (=> b!772750 (= e!430190 (bvsge (x!64921 lt!344044) #b01111111111111111111111111111110))))

(declare-fun b!772751 () Bool)

(assert (=> b!772751 (and (bvsge (index!33994 lt!344044) #b00000000000000000000000000000000) (bvslt (index!33994 lt!344044) (size!20727 a!3186)))))

(declare-fun res!522578 () Bool)

(assert (=> b!772751 (= res!522578 (= (select (arr!20306 a!3186) (index!33994 lt!344044)) (select (arr!20306 a!3186) j!159)))))

(assert (=> b!772751 (=> res!522578 e!430187)))

(assert (=> b!772751 (= e!430186 e!430187)))

(declare-fun b!772752 () Bool)

(declare-fun e!430188 () SeekEntryResult!7906)

(assert (=> b!772752 (= e!430188 (Intermediate!7906 true index!1321 x!1131))))

(declare-fun d!101925 () Bool)

(assert (=> d!101925 e!430190))

(declare-fun c!85484 () Bool)

(assert (=> d!101925 (= c!85484 (and (is-Intermediate!7906 lt!344044) (undefined!8718 lt!344044)))))

(assert (=> d!101925 (= lt!344044 e!430188)))

(declare-fun c!85485 () Bool)

(assert (=> d!101925 (= c!85485 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!344045 () (_ BitVec 64))

(assert (=> d!101925 (= lt!344045 (select (arr!20306 a!3186) index!1321))))

(assert (=> d!101925 (validMask!0 mask!3328)))

(assert (=> d!101925 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20306 a!3186) j!159) a!3186 mask!3328) lt!344044)))

(declare-fun b!772753 () Bool)

(assert (=> b!772753 (= e!430188 e!430189)))

(declare-fun c!85483 () Bool)

(assert (=> b!772753 (= c!85483 (or (= lt!344045 (select (arr!20306 a!3186) j!159)) (= (bvadd lt!344045 lt!344045) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!772754 () Bool)

(assert (=> b!772754 (and (bvsge (index!33994 lt!344044) #b00000000000000000000000000000000) (bvslt (index!33994 lt!344044) (size!20727 a!3186)))))

(assert (=> b!772754 (= e!430187 (= (select (arr!20306 a!3186) (index!33994 lt!344044)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!101925 c!85485) b!772752))

(assert (= (and d!101925 (not c!85485)) b!772753))

(assert (= (and b!772753 c!85483) b!772746))

(assert (= (and b!772753 (not c!85483)) b!772747))

(assert (= (and d!101925 c!85484) b!772750))

(assert (= (and d!101925 (not c!85484)) b!772748))

(assert (= (and b!772748 res!522577) b!772751))

(assert (= (and b!772751 (not res!522578)) b!772749))

(assert (= (and b!772749 (not res!522579)) b!772754))

(declare-fun m!717601 () Bool)

(assert (=> b!772754 m!717601))

(assert (=> b!772749 m!717601))

(assert (=> d!101925 m!717389))

(assert (=> d!101925 m!717329))

(assert (=> b!772747 m!717355))

(assert (=> b!772747 m!717355))

(assert (=> b!772747 m!717307))

(declare-fun m!717603 () Bool)

(assert (=> b!772747 m!717603))

(assert (=> b!772751 m!717601))

(assert (=> b!772360 d!101925))

(declare-fun d!101927 () Bool)

(declare-fun res!522584 () Bool)

(declare-fun e!430201 () Bool)

(assert (=> d!101927 (=> res!522584 e!430201)))

(assert (=> d!101927 (= res!522584 (= (select (arr!20306 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!101927 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!430201)))

(declare-fun b!772771 () Bool)

(declare-fun e!430202 () Bool)

(assert (=> b!772771 (= e!430201 e!430202)))

(declare-fun res!522585 () Bool)

(assert (=> b!772771 (=> (not res!522585) (not e!430202))))

(assert (=> b!772771 (= res!522585 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20727 a!3186)))))

(declare-fun b!772772 () Bool)

(assert (=> b!772772 (= e!430202 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!101927 (not res!522584)) b!772771))

(assert (= (and b!772771 res!522585) b!772772))

(assert (=> d!101927 m!717417))

(declare-fun m!717605 () Bool)

(assert (=> b!772772 m!717605))

(assert (=> b!772370 d!101927))

(declare-fun d!101929 () Bool)

(assert (=> d!101929 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!66922 d!101929))

(declare-fun d!101935 () Bool)

(assert (=> d!101935 (= (array_inv!16102 a!3186) (bvsge (size!20727 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!66922 d!101935))

(declare-fun b!772804 () Bool)

(declare-fun c!85502 () Bool)

(declare-fun lt!344061 () (_ BitVec 64))

(assert (=> b!772804 (= c!85502 (= lt!344061 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!430224 () SeekEntryResult!7906)

(declare-fun e!430223 () SeekEntryResult!7906)

(assert (=> b!772804 (= e!430224 e!430223)))

(declare-fun b!772805 () Bool)

(declare-fun e!430222 () SeekEntryResult!7906)

(assert (=> b!772805 (= e!430222 Undefined!7906)))

(declare-fun b!772806 () Bool)

(assert (=> b!772806 (= e!430222 e!430224)))

(declare-fun lt!344060 () SeekEntryResult!7906)

(assert (=> b!772806 (= lt!344061 (select (arr!20306 a!3186) (index!33994 lt!344060)))))

(declare-fun c!85501 () Bool)

(assert (=> b!772806 (= c!85501 (= lt!344061 (select (arr!20306 a!3186) j!159)))))

(declare-fun b!772807 () Bool)

(assert (=> b!772807 (= e!430223 (seekKeyOrZeroReturnVacant!0 (x!64921 lt!344060) (index!33994 lt!344060) (index!33994 lt!344060) (select (arr!20306 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!772808 () Bool)

(assert (=> b!772808 (= e!430224 (Found!7906 (index!33994 lt!344060)))))

(declare-fun b!772803 () Bool)

(assert (=> b!772803 (= e!430223 (MissingZero!7906 (index!33994 lt!344060)))))

(declare-fun d!101939 () Bool)

(declare-fun lt!344059 () SeekEntryResult!7906)

(assert (=> d!101939 (and (or (is-Undefined!7906 lt!344059) (not (is-Found!7906 lt!344059)) (and (bvsge (index!33993 lt!344059) #b00000000000000000000000000000000) (bvslt (index!33993 lt!344059) (size!20727 a!3186)))) (or (is-Undefined!7906 lt!344059) (is-Found!7906 lt!344059) (not (is-MissingZero!7906 lt!344059)) (and (bvsge (index!33992 lt!344059) #b00000000000000000000000000000000) (bvslt (index!33992 lt!344059) (size!20727 a!3186)))) (or (is-Undefined!7906 lt!344059) (is-Found!7906 lt!344059) (is-MissingZero!7906 lt!344059) (not (is-MissingVacant!7906 lt!344059)) (and (bvsge (index!33995 lt!344059) #b00000000000000000000000000000000) (bvslt (index!33995 lt!344059) (size!20727 a!3186)))) (or (is-Undefined!7906 lt!344059) (ite (is-Found!7906 lt!344059) (= (select (arr!20306 a!3186) (index!33993 lt!344059)) (select (arr!20306 a!3186) j!159)) (ite (is-MissingZero!7906 lt!344059) (= (select (arr!20306 a!3186) (index!33992 lt!344059)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7906 lt!344059) (= (select (arr!20306 a!3186) (index!33995 lt!344059)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101939 (= lt!344059 e!430222)))

(declare-fun c!85503 () Bool)

(assert (=> d!101939 (= c!85503 (and (is-Intermediate!7906 lt!344060) (undefined!8718 lt!344060)))))

(assert (=> d!101939 (= lt!344060 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20306 a!3186) j!159) mask!3328) (select (arr!20306 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!101939 (validMask!0 mask!3328)))

(assert (=> d!101939 (= (seekEntryOrOpen!0 (select (arr!20306 a!3186) j!159) a!3186 mask!3328) lt!344059)))

(assert (= (and d!101939 c!85503) b!772805))

(assert (= (and d!101939 (not c!85503)) b!772806))

(assert (= (and b!772806 c!85501) b!772808))

(assert (= (and b!772806 (not c!85501)) b!772804))

(assert (= (and b!772804 c!85502) b!772803))

(assert (= (and b!772804 (not c!85502)) b!772807))

(declare-fun m!717629 () Bool)

(assert (=> b!772806 m!717629))

(assert (=> b!772807 m!717307))

(declare-fun m!717631 () Bool)

(assert (=> b!772807 m!717631))

(declare-fun m!717633 () Bool)

(assert (=> d!101939 m!717633))

(declare-fun m!717635 () Bool)

(assert (=> d!101939 m!717635))

(assert (=> d!101939 m!717351))

(assert (=> d!101939 m!717307))

(assert (=> d!101939 m!717353))

(assert (=> d!101939 m!717307))

(assert (=> d!101939 m!717351))

(declare-fun m!717639 () Bool)

(assert (=> d!101939 m!717639))

(assert (=> d!101939 m!717329))

(assert (=> b!772369 d!101939))

(declare-fun b!772815 () Bool)

(declare-fun e!430229 () Bool)

(declare-fun e!430230 () Bool)

(assert (=> b!772815 (= e!430229 e!430230)))

(declare-fun lt!344067 () (_ BitVec 64))

(assert (=> b!772815 (= lt!344067 (select (arr!20306 a!3186) j!159))))

(declare-fun lt!344066 () Unit!26638)

(assert (=> b!772815 (= lt!344066 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!344067 j!159))))

(assert (=> b!772815 (arrayContainsKey!0 a!3186 lt!344067 #b00000000000000000000000000000000)))

(declare-fun lt!344065 () Unit!26638)

(assert (=> b!772815 (= lt!344065 lt!344066)))

(declare-fun res!522599 () Bool)

(assert (=> b!772815 (= res!522599 (= (seekEntryOrOpen!0 (select (arr!20306 a!3186) j!159) a!3186 mask!3328) (Found!7906 j!159)))))

(assert (=> b!772815 (=> (not res!522599) (not e!430230))))

(declare-fun bm!35148 () Bool)

(declare-fun call!35151 () Bool)

(assert (=> bm!35148 (= call!35151 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!772816 () Bool)

(assert (=> b!772816 (= e!430229 call!35151)))

(declare-fun d!101943 () Bool)

(declare-fun res!522598 () Bool)

(declare-fun e!430228 () Bool)

(assert (=> d!101943 (=> res!522598 e!430228)))

(assert (=> d!101943 (= res!522598 (bvsge j!159 (size!20727 a!3186)))))

(assert (=> d!101943 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!430228)))

(declare-fun b!772817 () Bool)

(assert (=> b!772817 (= e!430230 call!35151)))

(declare-fun b!772818 () Bool)

(assert (=> b!772818 (= e!430228 e!430229)))

(declare-fun c!85507 () Bool)

(assert (=> b!772818 (= c!85507 (validKeyInArray!0 (select (arr!20306 a!3186) j!159)))))

(assert (= (and d!101943 (not res!522598)) b!772818))

(assert (= (and b!772818 c!85507) b!772815))

(assert (= (and b!772818 (not c!85507)) b!772816))

(assert (= (and b!772815 res!522599) b!772817))

(assert (= (or b!772817 b!772816) bm!35148))

(assert (=> b!772815 m!717307))

(declare-fun m!717641 () Bool)

(assert (=> b!772815 m!717641))

(declare-fun m!717643 () Bool)

(assert (=> b!772815 m!717643))

(assert (=> b!772815 m!717307))

(assert (=> b!772815 m!717335))

(declare-fun m!717645 () Bool)

(assert (=> bm!35148 m!717645))

(assert (=> b!772818 m!717307))

(assert (=> b!772818 m!717307))

(assert (=> b!772818 m!717333))

(assert (=> b!772358 d!101943))

(declare-fun d!101945 () Bool)

(assert (=> d!101945 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!344072 () Unit!26638)

(declare-fun choose!38 (array!42415 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26638)

(assert (=> d!101945 (= lt!344072 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!101945 (validMask!0 mask!3328)))

(assert (=> d!101945 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!344072)))

(declare-fun bs!21609 () Bool)

(assert (= bs!21609 d!101945))

(assert (=> bs!21609 m!717347))

(declare-fun m!717665 () Bool)

(assert (=> bs!21609 m!717665))

(assert (=> bs!21609 m!717329))

(assert (=> b!772358 d!101945))

(declare-fun d!101951 () Bool)

(assert (=> d!101951 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!772368 d!101951))

(declare-fun b!772825 () Bool)

(declare-fun e!430237 () SeekEntryResult!7906)

(assert (=> b!772825 (= e!430237 (Intermediate!7906 false (toIndex!0 (select (arr!20306 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!772826 () Bool)

(assert (=> b!772826 (= e!430237 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20306 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20306 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!772827 () Bool)

(declare-fun e!430238 () Bool)

(declare-fun e!430234 () Bool)

(assert (=> b!772827 (= e!430238 e!430234)))

(declare-fun res!522600 () Bool)

(declare-fun lt!344073 () SeekEntryResult!7906)

(assert (=> b!772827 (= res!522600 (and (is-Intermediate!7906 lt!344073) (not (undefined!8718 lt!344073)) (bvslt (x!64921 lt!344073) #b01111111111111111111111111111110) (bvsge (x!64921 lt!344073) #b00000000000000000000000000000000) (bvsge (x!64921 lt!344073) #b00000000000000000000000000000000)))))

(assert (=> b!772827 (=> (not res!522600) (not e!430234))))

(declare-fun b!772828 () Bool)

(assert (=> b!772828 (and (bvsge (index!33994 lt!344073) #b00000000000000000000000000000000) (bvslt (index!33994 lt!344073) (size!20727 a!3186)))))

(declare-fun res!522602 () Bool)

(assert (=> b!772828 (= res!522602 (= (select (arr!20306 a!3186) (index!33994 lt!344073)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!430235 () Bool)

(assert (=> b!772828 (=> res!522602 e!430235)))

(declare-fun b!772829 () Bool)

(assert (=> b!772829 (= e!430238 (bvsge (x!64921 lt!344073) #b01111111111111111111111111111110))))

(declare-fun b!772830 () Bool)

(assert (=> b!772830 (and (bvsge (index!33994 lt!344073) #b00000000000000000000000000000000) (bvslt (index!33994 lt!344073) (size!20727 a!3186)))))

(declare-fun res!522601 () Bool)

(assert (=> b!772830 (= res!522601 (= (select (arr!20306 a!3186) (index!33994 lt!344073)) (select (arr!20306 a!3186) j!159)))))

(assert (=> b!772830 (=> res!522601 e!430235)))

(assert (=> b!772830 (= e!430234 e!430235)))

(declare-fun e!430236 () SeekEntryResult!7906)

(declare-fun b!772831 () Bool)

(assert (=> b!772831 (= e!430236 (Intermediate!7906 true (toIndex!0 (select (arr!20306 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun d!101953 () Bool)

(assert (=> d!101953 e!430238))

(declare-fun c!85512 () Bool)

(assert (=> d!101953 (= c!85512 (and (is-Intermediate!7906 lt!344073) (undefined!8718 lt!344073)))))

(assert (=> d!101953 (= lt!344073 e!430236)))

(declare-fun c!85513 () Bool)

(assert (=> d!101953 (= c!85513 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!344074 () (_ BitVec 64))

(assert (=> d!101953 (= lt!344074 (select (arr!20306 a!3186) (toIndex!0 (select (arr!20306 a!3186) j!159) mask!3328)))))

(assert (=> d!101953 (validMask!0 mask!3328)))

(assert (=> d!101953 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20306 a!3186) j!159) mask!3328) (select (arr!20306 a!3186) j!159) a!3186 mask!3328) lt!344073)))

(declare-fun b!772832 () Bool)

(assert (=> b!772832 (= e!430236 e!430237)))

(declare-fun c!85511 () Bool)

(assert (=> b!772832 (= c!85511 (or (= lt!344074 (select (arr!20306 a!3186) j!159)) (= (bvadd lt!344074 lt!344074) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!772833 () Bool)

(assert (=> b!772833 (and (bvsge (index!33994 lt!344073) #b00000000000000000000000000000000) (bvslt (index!33994 lt!344073) (size!20727 a!3186)))))

(assert (=> b!772833 (= e!430235 (= (select (arr!20306 a!3186) (index!33994 lt!344073)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!101953 c!85513) b!772831))

(assert (= (and d!101953 (not c!85513)) b!772832))

(assert (= (and b!772832 c!85511) b!772825))

(assert (= (and b!772832 (not c!85511)) b!772826))

(assert (= (and d!101953 c!85512) b!772829))

(assert (= (and d!101953 (not c!85512)) b!772827))

(assert (= (and b!772827 res!522600) b!772830))

(assert (= (and b!772830 (not res!522601)) b!772828))

(assert (= (and b!772828 (not res!522602)) b!772833))

(declare-fun m!717667 () Bool)

(assert (=> b!772833 m!717667))

(assert (=> b!772828 m!717667))

(assert (=> d!101953 m!717351))

(declare-fun m!717669 () Bool)

(assert (=> d!101953 m!717669))

(assert (=> d!101953 m!717329))

(assert (=> b!772826 m!717351))

(declare-fun m!717671 () Bool)

(assert (=> b!772826 m!717671))

(assert (=> b!772826 m!717671))

(assert (=> b!772826 m!717307))

(declare-fun m!717673 () Bool)

(assert (=> b!772826 m!717673))

(assert (=> b!772830 m!717667))

(assert (=> b!772377 d!101953))

(declare-fun d!101955 () Bool)

(declare-fun lt!344076 () (_ BitVec 32))

(declare-fun lt!344075 () (_ BitVec 32))

(assert (=> d!101955 (= lt!344076 (bvmul (bvxor lt!344075 (bvlshr lt!344075 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101955 (= lt!344075 ((_ extract 31 0) (bvand (bvxor (select (arr!20306 a!3186) j!159) (bvlshr (select (arr!20306 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101955 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!522553 (let ((h!15409 ((_ extract 31 0) (bvand (bvxor (select (arr!20306 a!3186) j!159) (bvlshr (select (arr!20306 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64930 (bvmul (bvxor h!15409 (bvlshr h!15409 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64930 (bvlshr x!64930 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!522553 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!522553 #b00000000000000000000000000000000))))))

(assert (=> d!101955 (= (toIndex!0 (select (arr!20306 a!3186) j!159) mask!3328) (bvand (bvxor lt!344076 (bvlshr lt!344076 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!772377 d!101955))

(declare-fun b!772834 () Bool)

(declare-fun e!430241 () SeekEntryResult!7906)

(declare-fun e!430239 () SeekEntryResult!7906)

(assert (=> b!772834 (= e!430241 e!430239)))

(declare-fun lt!344077 () (_ BitVec 64))

(declare-fun c!85516 () Bool)

(assert (=> b!772834 (= c!85516 (= lt!344077 (select (arr!20306 a!3186) j!159)))))

(declare-fun b!772835 () Bool)

(assert (=> b!772835 (= e!430241 Undefined!7906)))

(declare-fun b!772836 () Bool)

(declare-fun c!85515 () Bool)

(assert (=> b!772836 (= c!85515 (= lt!344077 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!430240 () SeekEntryResult!7906)

(assert (=> b!772836 (= e!430239 e!430240)))

(declare-fun b!772838 () Bool)

(assert (=> b!772838 (= e!430239 (Found!7906 resIntermediateIndex!5))))

(declare-fun b!772839 () Bool)

(assert (=> b!772839 (= e!430240 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20306 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!772837 () Bool)

(assert (=> b!772837 (= e!430240 (MissingVacant!7906 resIntermediateIndex!5))))

(declare-fun lt!344078 () SeekEntryResult!7906)

(declare-fun d!101957 () Bool)

(assert (=> d!101957 (and (or (is-Undefined!7906 lt!344078) (not (is-Found!7906 lt!344078)) (and (bvsge (index!33993 lt!344078) #b00000000000000000000000000000000) (bvslt (index!33993 lt!344078) (size!20727 a!3186)))) (or (is-Undefined!7906 lt!344078) (is-Found!7906 lt!344078) (not (is-MissingVacant!7906 lt!344078)) (not (= (index!33995 lt!344078) resIntermediateIndex!5)) (and (bvsge (index!33995 lt!344078) #b00000000000000000000000000000000) (bvslt (index!33995 lt!344078) (size!20727 a!3186)))) (or (is-Undefined!7906 lt!344078) (ite (is-Found!7906 lt!344078) (= (select (arr!20306 a!3186) (index!33993 lt!344078)) (select (arr!20306 a!3186) j!159)) (and (is-MissingVacant!7906 lt!344078) (= (index!33995 lt!344078) resIntermediateIndex!5) (= (select (arr!20306 a!3186) (index!33995 lt!344078)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101957 (= lt!344078 e!430241)))

(declare-fun c!85514 () Bool)

(assert (=> d!101957 (= c!85514 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!101957 (= lt!344077 (select (arr!20306 a!3186) resIntermediateIndex!5))))

(assert (=> d!101957 (validMask!0 mask!3328)))

(assert (=> d!101957 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20306 a!3186) j!159) a!3186 mask!3328) lt!344078)))

(assert (= (and d!101957 c!85514) b!772835))

(assert (= (and d!101957 (not c!85514)) b!772834))

(assert (= (and b!772834 c!85516) b!772838))

(assert (= (and b!772834 (not c!85516)) b!772836))

(assert (= (and b!772836 c!85515) b!772837))

(assert (= (and b!772836 (not c!85515)) b!772839))

(declare-fun m!717675 () Bool)

(assert (=> b!772839 m!717675))

(assert (=> b!772839 m!717675))

(assert (=> b!772839 m!717307))

(declare-fun m!717677 () Bool)

(assert (=> b!772839 m!717677))

(declare-fun m!717679 () Bool)

(assert (=> d!101957 m!717679))

(declare-fun m!717681 () Bool)

(assert (=> d!101957 m!717681))

(assert (=> d!101957 m!717327))

(assert (=> d!101957 m!717329))

(assert (=> b!772366 d!101957))

(push 1)

(assert (not d!101883))

(assert (not d!101841))

(assert (not b!772807))

(assert (not d!101887))

(assert (not d!101925))

(assert (not d!101859))

(assert (not b!772602))

(assert (not bm!35148))

(assert (not bm!35147))

(assert (not b!772505))

(assert (not bm!35133))

(assert (not d!101911))

(assert (not b!772703))

(assert (not b!772826))

(assert (not b!772772))

(assert (not d!101849))

(assert (not b!772611))

(assert (not b!772461))

(assert (not d!101957))

(assert (not b!772747))

(assert (not b!772506))

(assert (not b!772632))

(assert (not d!101939))

(assert (not b!772815))

(assert (not b!772467))

(assert (not b!772700))

(assert (not d!101915))

(assert (not b!772509))

(assert (not b!772839))

(assert (not b!772744))

(assert (not b!772818))

(assert (not d!101945))

(assert (not d!101953))

(check-sat)

(pop 1)

(push 1)

(check-sat)

