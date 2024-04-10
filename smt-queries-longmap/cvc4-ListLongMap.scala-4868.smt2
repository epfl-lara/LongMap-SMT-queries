; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67126 () Bool)

(assert start!67126)

(declare-fun b!775347 () Bool)

(declare-fun e!431538 () Bool)

(declare-fun e!431530 () Bool)

(assert (=> b!775347 (= e!431538 e!431530)))

(declare-fun res!524311 () Bool)

(assert (=> b!775347 (=> (not res!524311) (not e!431530))))

(declare-datatypes ((SeekEntryResult!7936 0))(
  ( (MissingZero!7936 (index!34112 (_ BitVec 32))) (Found!7936 (index!34113 (_ BitVec 32))) (Intermediate!7936 (undefined!8748 Bool) (index!34114 (_ BitVec 32)) (x!65055 (_ BitVec 32))) (Undefined!7936) (MissingVacant!7936 (index!34115 (_ BitVec 32))) )
))
(declare-fun lt!345389 () SeekEntryResult!7936)

(declare-datatypes ((array!42481 0))(
  ( (array!42482 (arr!20336 (Array (_ BitVec 32) (_ BitVec 64))) (size!20757 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42481)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42481 (_ BitVec 32)) SeekEntryResult!7936)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!775347 (= res!524311 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20336 a!3186) j!159) mask!3328) (select (arr!20336 a!3186) j!159) a!3186 mask!3328) lt!345389))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!775347 (= lt!345389 (Intermediate!7936 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!775349 () Bool)

(declare-fun res!524321 () Bool)

(declare-fun e!431539 () Bool)

(assert (=> b!775349 (=> res!524321 e!431539)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!345388 () (_ BitVec 32))

(declare-fun lt!345395 () (_ BitVec 64))

(declare-fun lt!345382 () SeekEntryResult!7936)

(declare-fun lt!345383 () array!42481)

(assert (=> b!775349 (= res!524321 (not (= lt!345382 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345388 lt!345395 lt!345383 mask!3328))))))

(declare-fun b!775350 () Bool)

(declare-fun res!524316 () Bool)

(assert (=> b!775350 (=> (not res!524316) (not e!431538))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42481 (_ BitVec 32)) Bool)

(assert (=> b!775350 (= res!524316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!775351 () Bool)

(declare-fun res!524313 () Bool)

(assert (=> b!775351 (=> res!524313 e!431539)))

(declare-fun e!431540 () Bool)

(assert (=> b!775351 (= res!524313 e!431540)))

(declare-fun c!85923 () Bool)

(declare-fun lt!345385 () Bool)

(assert (=> b!775351 (= c!85923 lt!345385)))

(declare-fun b!775352 () Bool)

(declare-fun e!431535 () Bool)

(declare-fun e!431531 () Bool)

(assert (=> b!775352 (= e!431535 e!431531)))

(declare-fun res!524305 () Bool)

(assert (=> b!775352 (=> (not res!524305) (not e!431531))))

(declare-fun lt!345392 () SeekEntryResult!7936)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42481 (_ BitVec 32)) SeekEntryResult!7936)

(assert (=> b!775352 (= res!524305 (= (seekEntryOrOpen!0 (select (arr!20336 a!3186) j!159) a!3186 mask!3328) lt!345392))))

(assert (=> b!775352 (= lt!345392 (Found!7936 j!159))))

(declare-fun b!775353 () Bool)

(declare-fun res!524317 () Bool)

(assert (=> b!775353 (=> (not res!524317) (not e!431530))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!775353 (= res!524317 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20336 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!775354 () Bool)

(declare-fun res!524319 () Bool)

(assert (=> b!775354 (=> (not res!524319) (not e!431538))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!775354 (= res!524319 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20757 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20757 a!3186))))))

(declare-fun b!775355 () Bool)

(declare-datatypes ((Unit!26758 0))(
  ( (Unit!26759) )
))
(declare-fun e!431534 () Unit!26758)

(declare-fun Unit!26760 () Unit!26758)

(assert (=> b!775355 (= e!431534 Unit!26760)))

(declare-fun lt!345393 () SeekEntryResult!7936)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42481 (_ BitVec 32)) SeekEntryResult!7936)

(assert (=> b!775355 (= lt!345393 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20336 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!345391 () SeekEntryResult!7936)

(assert (=> b!775355 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345388 resIntermediateIndex!5 (select (arr!20336 a!3186) j!159) a!3186 mask!3328) lt!345391)))

(declare-fun b!775356 () Bool)

(declare-fun e!431536 () Bool)

(assert (=> b!775356 (= e!431530 e!431536)))

(declare-fun res!524312 () Bool)

(assert (=> b!775356 (=> (not res!524312) (not e!431536))))

(declare-fun lt!345390 () SeekEntryResult!7936)

(assert (=> b!775356 (= res!524312 (= lt!345382 lt!345390))))

(assert (=> b!775356 (= lt!345390 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345395 lt!345383 mask!3328))))

(assert (=> b!775356 (= lt!345382 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345395 mask!3328) lt!345395 lt!345383 mask!3328))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!775356 (= lt!345395 (select (store (arr!20336 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!775356 (= lt!345383 (array!42482 (store (arr!20336 a!3186) i!1173 k!2102) (size!20757 a!3186)))))

(declare-fun e!431529 () Bool)

(declare-fun b!775357 () Bool)

(assert (=> b!775357 (= e!431529 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20336 a!3186) j!159) a!3186 mask!3328) lt!345389))))

(declare-fun b!775358 () Bool)

(declare-fun res!524318 () Bool)

(declare-fun e!431537 () Bool)

(assert (=> b!775358 (=> (not res!524318) (not e!431537))))

(assert (=> b!775358 (= res!524318 (and (= (size!20757 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20757 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20757 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!524306 () Bool)

(assert (=> start!67126 (=> (not res!524306) (not e!431537))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67126 (= res!524306 (validMask!0 mask!3328))))

(assert (=> start!67126 e!431537))

(assert (=> start!67126 true))

(declare-fun array_inv!16132 (array!42481) Bool)

(assert (=> start!67126 (array_inv!16132 a!3186)))

(declare-fun b!775348 () Bool)

(assert (=> b!775348 (= e!431537 e!431538)))

(declare-fun res!524304 () Bool)

(assert (=> b!775348 (=> (not res!524304) (not e!431538))))

(declare-fun lt!345384 () SeekEntryResult!7936)

(assert (=> b!775348 (= res!524304 (or (= lt!345384 (MissingZero!7936 i!1173)) (= lt!345384 (MissingVacant!7936 i!1173))))))

(assert (=> b!775348 (= lt!345384 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!775359 () Bool)

(declare-fun res!524309 () Bool)

(assert (=> b!775359 (=> (not res!524309) (not e!431538))))

(declare-datatypes ((List!14338 0))(
  ( (Nil!14335) (Cons!14334 (h!15442 (_ BitVec 64)) (t!20653 List!14338)) )
))
(declare-fun arrayNoDuplicates!0 (array!42481 (_ BitVec 32) List!14338) Bool)

(assert (=> b!775359 (= res!524309 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14335))))

(declare-fun b!775360 () Bool)

(declare-fun res!524315 () Bool)

(assert (=> b!775360 (=> (not res!524315) (not e!431537))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!775360 (= res!524315 (validKeyInArray!0 k!2102))))

(declare-fun b!775361 () Bool)

(assert (=> b!775361 (= e!431529 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20336 a!3186) j!159) a!3186 mask!3328) (Found!7936 j!159)))))

(declare-fun b!775362 () Bool)

(declare-fun res!524308 () Bool)

(assert (=> b!775362 (=> (not res!524308) (not e!431537))))

(assert (=> b!775362 (= res!524308 (validKeyInArray!0 (select (arr!20336 a!3186) j!159)))))

(declare-fun b!775363 () Bool)

(declare-fun e!431532 () Bool)

(assert (=> b!775363 (= e!431536 (not e!431532))))

(declare-fun res!524320 () Bool)

(assert (=> b!775363 (=> res!524320 e!431532)))

(assert (=> b!775363 (= res!524320 (or (not (is-Intermediate!7936 lt!345390)) (bvsge x!1131 (x!65055 lt!345390))))))

(assert (=> b!775363 (= lt!345391 (Found!7936 j!159))))

(assert (=> b!775363 e!431535))

(declare-fun res!524310 () Bool)

(assert (=> b!775363 (=> (not res!524310) (not e!431535))))

(assert (=> b!775363 (= res!524310 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!345386 () Unit!26758)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42481 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26758)

(assert (=> b!775363 (= lt!345386 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!775364 () Bool)

(declare-fun Unit!26761 () Unit!26758)

(assert (=> b!775364 (= e!431534 Unit!26761)))

(assert (=> b!775364 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345388 (select (arr!20336 a!3186) j!159) a!3186 mask!3328) lt!345389)))

(declare-fun b!775365 () Bool)

(assert (=> b!775365 (= e!431540 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345388 resIntermediateIndex!5 (select (arr!20336 a!3186) j!159) a!3186 mask!3328) lt!345391)))))

(declare-fun b!775366 () Bool)

(assert (=> b!775366 (= e!431531 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20336 a!3186) j!159) a!3186 mask!3328) lt!345392))))

(declare-fun b!775367 () Bool)

(declare-fun res!524307 () Bool)

(assert (=> b!775367 (=> (not res!524307) (not e!431537))))

(declare-fun arrayContainsKey!0 (array!42481 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!775367 (= res!524307 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!775368 () Bool)

(declare-fun res!524303 () Bool)

(assert (=> b!775368 (=> (not res!524303) (not e!431530))))

(assert (=> b!775368 (= res!524303 e!431529)))

(declare-fun c!85924 () Bool)

(assert (=> b!775368 (= c!85924 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!775369 () Bool)

(assert (=> b!775369 (= e!431539 true)))

(assert (=> b!775369 (= (seekEntryOrOpen!0 lt!345395 lt!345383 mask!3328) lt!345391)))

(declare-fun lt!345387 () Unit!26758)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!42481 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26758)

(assert (=> b!775369 (= lt!345387 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k!2102 j!159 lt!345388 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun b!775370 () Bool)

(assert (=> b!775370 (= e!431532 e!431539)))

(declare-fun res!524314 () Bool)

(assert (=> b!775370 (=> res!524314 e!431539)))

(assert (=> b!775370 (= res!524314 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!345388 #b00000000000000000000000000000000) (bvsge lt!345388 (size!20757 a!3186))))))

(declare-fun lt!345394 () Unit!26758)

(assert (=> b!775370 (= lt!345394 e!431534)))

(declare-fun c!85922 () Bool)

(assert (=> b!775370 (= c!85922 lt!345385)))

(assert (=> b!775370 (= lt!345385 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!775370 (= lt!345388 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!775371 () Bool)

(assert (=> b!775371 (= e!431540 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345388 (select (arr!20336 a!3186) j!159) a!3186 mask!3328) lt!345389)))))

(assert (= (and start!67126 res!524306) b!775358))

(assert (= (and b!775358 res!524318) b!775362))

(assert (= (and b!775362 res!524308) b!775360))

(assert (= (and b!775360 res!524315) b!775367))

(assert (= (and b!775367 res!524307) b!775348))

(assert (= (and b!775348 res!524304) b!775350))

(assert (= (and b!775350 res!524316) b!775359))

(assert (= (and b!775359 res!524309) b!775354))

(assert (= (and b!775354 res!524319) b!775347))

(assert (= (and b!775347 res!524311) b!775353))

(assert (= (and b!775353 res!524317) b!775368))

(assert (= (and b!775368 c!85924) b!775357))

(assert (= (and b!775368 (not c!85924)) b!775361))

(assert (= (and b!775368 res!524303) b!775356))

(assert (= (and b!775356 res!524312) b!775363))

(assert (= (and b!775363 res!524310) b!775352))

(assert (= (and b!775352 res!524305) b!775366))

(assert (= (and b!775363 (not res!524320)) b!775370))

(assert (= (and b!775370 c!85922) b!775364))

(assert (= (and b!775370 (not c!85922)) b!775355))

(assert (= (and b!775370 (not res!524314)) b!775351))

(assert (= (and b!775351 c!85923) b!775371))

(assert (= (and b!775351 (not c!85923)) b!775365))

(assert (= (and b!775351 (not res!524313)) b!775349))

(assert (= (and b!775349 (not res!524321)) b!775369))

(declare-fun m!719593 () Bool)

(assert (=> b!775352 m!719593))

(assert (=> b!775352 m!719593))

(declare-fun m!719595 () Bool)

(assert (=> b!775352 m!719595))

(assert (=> b!775366 m!719593))

(assert (=> b!775366 m!719593))

(declare-fun m!719597 () Bool)

(assert (=> b!775366 m!719597))

(declare-fun m!719599 () Bool)

(assert (=> b!775370 m!719599))

(assert (=> b!775355 m!719593))

(assert (=> b!775355 m!719593))

(declare-fun m!719601 () Bool)

(assert (=> b!775355 m!719601))

(assert (=> b!775355 m!719593))

(declare-fun m!719603 () Bool)

(assert (=> b!775355 m!719603))

(declare-fun m!719605 () Bool)

(assert (=> b!775350 m!719605))

(declare-fun m!719607 () Bool)

(assert (=> start!67126 m!719607))

(declare-fun m!719609 () Bool)

(assert (=> start!67126 m!719609))

(declare-fun m!719611 () Bool)

(assert (=> b!775359 m!719611))

(assert (=> b!775357 m!719593))

(assert (=> b!775357 m!719593))

(declare-fun m!719613 () Bool)

(assert (=> b!775357 m!719613))

(declare-fun m!719615 () Bool)

(assert (=> b!775367 m!719615))

(assert (=> b!775347 m!719593))

(assert (=> b!775347 m!719593))

(declare-fun m!719617 () Bool)

(assert (=> b!775347 m!719617))

(assert (=> b!775347 m!719617))

(assert (=> b!775347 m!719593))

(declare-fun m!719619 () Bool)

(assert (=> b!775347 m!719619))

(declare-fun m!719621 () Bool)

(assert (=> b!775356 m!719621))

(declare-fun m!719623 () Bool)

(assert (=> b!775356 m!719623))

(declare-fun m!719625 () Bool)

(assert (=> b!775356 m!719625))

(declare-fun m!719627 () Bool)

(assert (=> b!775356 m!719627))

(assert (=> b!775356 m!719623))

(declare-fun m!719629 () Bool)

(assert (=> b!775356 m!719629))

(declare-fun m!719631 () Bool)

(assert (=> b!775369 m!719631))

(declare-fun m!719633 () Bool)

(assert (=> b!775369 m!719633))

(declare-fun m!719635 () Bool)

(assert (=> b!775353 m!719635))

(assert (=> b!775361 m!719593))

(assert (=> b!775361 m!719593))

(assert (=> b!775361 m!719601))

(declare-fun m!719637 () Bool)

(assert (=> b!775349 m!719637))

(assert (=> b!775371 m!719593))

(assert (=> b!775371 m!719593))

(declare-fun m!719639 () Bool)

(assert (=> b!775371 m!719639))

(declare-fun m!719641 () Bool)

(assert (=> b!775363 m!719641))

(declare-fun m!719643 () Bool)

(assert (=> b!775363 m!719643))

(declare-fun m!719645 () Bool)

(assert (=> b!775360 m!719645))

(assert (=> b!775364 m!719593))

(assert (=> b!775364 m!719593))

(assert (=> b!775364 m!719639))

(assert (=> b!775362 m!719593))

(assert (=> b!775362 m!719593))

(declare-fun m!719647 () Bool)

(assert (=> b!775362 m!719647))

(assert (=> b!775365 m!719593))

(assert (=> b!775365 m!719593))

(assert (=> b!775365 m!719603))

(declare-fun m!719649 () Bool)

(assert (=> b!775348 m!719649))

(push 1)

