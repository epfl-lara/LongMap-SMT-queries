; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66252 () Bool)

(assert start!66252)

(declare-fun b!763374 () Bool)

(declare-fun res!516469 () Bool)

(declare-fun e!425284 () Bool)

(assert (=> b!763374 (=> (not res!516469) (not e!425284))))

(declare-fun e!425283 () Bool)

(assert (=> b!763374 (= res!516469 e!425283)))

(declare-fun c!83844 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!763374 (= c!83844 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!763375 () Bool)

(declare-fun res!516466 () Bool)

(declare-fun e!425285 () Bool)

(assert (=> b!763375 (=> (not res!516466) (not e!425285))))

(declare-datatypes ((array!42174 0))(
  ( (array!42175 (arr!20195 (Array (_ BitVec 32) (_ BitVec 64))) (size!20616 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42174)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!763375 (= res!516466 (and (= (size!20616 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20616 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20616 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!763376 () Bool)

(declare-fun e!425282 () Bool)

(assert (=> b!763376 (= e!425285 e!425282)))

(declare-fun res!516459 () Bool)

(assert (=> b!763376 (=> (not res!516459) (not e!425282))))

(declare-datatypes ((SeekEntryResult!7792 0))(
  ( (MissingZero!7792 (index!33536 (_ BitVec 32))) (Found!7792 (index!33537 (_ BitVec 32))) (Intermediate!7792 (undefined!8604 Bool) (index!33538 (_ BitVec 32)) (x!64447 (_ BitVec 32))) (Undefined!7792) (MissingVacant!7792 (index!33539 (_ BitVec 32))) )
))
(declare-fun lt!339635 () SeekEntryResult!7792)

(assert (=> b!763376 (= res!516459 (or (= lt!339635 (MissingZero!7792 i!1173)) (= lt!339635 (MissingVacant!7792 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42174 (_ BitVec 32)) SeekEntryResult!7792)

(assert (=> b!763376 (= lt!339635 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!763377 () Bool)

(declare-fun res!516461 () Bool)

(assert (=> b!763377 (=> (not res!516461) (not e!425285))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763377 (= res!516461 (validKeyInArray!0 k0!2102))))

(declare-fun lt!339631 () SeekEntryResult!7792)

(declare-fun b!763378 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42174 (_ BitVec 32)) SeekEntryResult!7792)

(assert (=> b!763378 (= e!425283 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20195 a!3186) j!159) a!3186 mask!3328) lt!339631))))

(declare-fun b!763379 () Bool)

(assert (=> b!763379 (= e!425282 e!425284)))

(declare-fun res!516462 () Bool)

(assert (=> b!763379 (=> (not res!516462) (not e!425284))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763379 (= res!516462 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20195 a!3186) j!159) mask!3328) (select (arr!20195 a!3186) j!159) a!3186 mask!3328) lt!339631))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!763379 (= lt!339631 (Intermediate!7792 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!763380 () Bool)

(declare-fun res!516465 () Bool)

(assert (=> b!763380 (=> (not res!516465) (not e!425282))))

(assert (=> b!763380 (= res!516465 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20616 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20616 a!3186))))))

(declare-fun b!763382 () Bool)

(declare-fun res!516467 () Bool)

(assert (=> b!763382 (=> (not res!516467) (not e!425285))))

(declare-fun arrayContainsKey!0 (array!42174 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763382 (= res!516467 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!763383 () Bool)

(declare-fun res!516460 () Bool)

(assert (=> b!763383 (=> (not res!516460) (not e!425285))))

(assert (=> b!763383 (= res!516460 (validKeyInArray!0 (select (arr!20195 a!3186) j!159)))))

(declare-fun b!763384 () Bool)

(declare-fun res!516470 () Bool)

(assert (=> b!763384 (=> (not res!516470) (not e!425282))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42174 (_ BitVec 32)) Bool)

(assert (=> b!763384 (= res!516470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!763385 () Bool)

(assert (=> b!763385 (= e!425284 false)))

(declare-fun lt!339634 () array!42174)

(declare-fun lt!339630 () (_ BitVec 64))

(declare-fun lt!339633 () SeekEntryResult!7792)

(assert (=> b!763385 (= lt!339633 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!339630 lt!339634 mask!3328))))

(declare-fun lt!339632 () SeekEntryResult!7792)

(assert (=> b!763385 (= lt!339632 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!339630 mask!3328) lt!339630 lt!339634 mask!3328))))

(assert (=> b!763385 (= lt!339630 (select (store (arr!20195 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!763385 (= lt!339634 (array!42175 (store (arr!20195 a!3186) i!1173 k0!2102) (size!20616 a!3186)))))

(declare-fun res!516464 () Bool)

(assert (=> start!66252 (=> (not res!516464) (not e!425285))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66252 (= res!516464 (validMask!0 mask!3328))))

(assert (=> start!66252 e!425285))

(assert (=> start!66252 true))

(declare-fun array_inv!16078 (array!42174) Bool)

(assert (=> start!66252 (array_inv!16078 a!3186)))

(declare-fun b!763381 () Bool)

(declare-fun res!516468 () Bool)

(assert (=> b!763381 (=> (not res!516468) (not e!425282))))

(declare-datatypes ((List!14236 0))(
  ( (Nil!14233) (Cons!14232 (h!15316 (_ BitVec 64)) (t!20542 List!14236)) )
))
(declare-fun arrayNoDuplicates!0 (array!42174 (_ BitVec 32) List!14236) Bool)

(assert (=> b!763381 (= res!516468 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14233))))

(declare-fun b!763386 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42174 (_ BitVec 32)) SeekEntryResult!7792)

(assert (=> b!763386 (= e!425283 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20195 a!3186) j!159) a!3186 mask!3328) (Found!7792 j!159)))))

(declare-fun b!763387 () Bool)

(declare-fun res!516463 () Bool)

(assert (=> b!763387 (=> (not res!516463) (not e!425284))))

(assert (=> b!763387 (= res!516463 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20195 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!66252 res!516464) b!763375))

(assert (= (and b!763375 res!516466) b!763383))

(assert (= (and b!763383 res!516460) b!763377))

(assert (= (and b!763377 res!516461) b!763382))

(assert (= (and b!763382 res!516467) b!763376))

(assert (= (and b!763376 res!516459) b!763384))

(assert (= (and b!763384 res!516470) b!763381))

(assert (= (and b!763381 res!516468) b!763380))

(assert (= (and b!763380 res!516465) b!763379))

(assert (= (and b!763379 res!516462) b!763387))

(assert (= (and b!763387 res!516463) b!763374))

(assert (= (and b!763374 c!83844) b!763378))

(assert (= (and b!763374 (not c!83844)) b!763386))

(assert (= (and b!763374 res!516469) b!763385))

(declare-fun m!709327 () Bool)

(assert (=> b!763382 m!709327))

(declare-fun m!709329 () Bool)

(assert (=> b!763379 m!709329))

(assert (=> b!763379 m!709329))

(declare-fun m!709331 () Bool)

(assert (=> b!763379 m!709331))

(assert (=> b!763379 m!709331))

(assert (=> b!763379 m!709329))

(declare-fun m!709333 () Bool)

(assert (=> b!763379 m!709333))

(assert (=> b!763386 m!709329))

(assert (=> b!763386 m!709329))

(declare-fun m!709335 () Bool)

(assert (=> b!763386 m!709335))

(declare-fun m!709337 () Bool)

(assert (=> b!763376 m!709337))

(declare-fun m!709339 () Bool)

(assert (=> b!763384 m!709339))

(assert (=> b!763383 m!709329))

(assert (=> b!763383 m!709329))

(declare-fun m!709341 () Bool)

(assert (=> b!763383 m!709341))

(declare-fun m!709343 () Bool)

(assert (=> b!763387 m!709343))

(assert (=> b!763378 m!709329))

(assert (=> b!763378 m!709329))

(declare-fun m!709345 () Bool)

(assert (=> b!763378 m!709345))

(declare-fun m!709347 () Bool)

(assert (=> start!66252 m!709347))

(declare-fun m!709349 () Bool)

(assert (=> start!66252 m!709349))

(declare-fun m!709351 () Bool)

(assert (=> b!763381 m!709351))

(declare-fun m!709353 () Bool)

(assert (=> b!763377 m!709353))

(declare-fun m!709355 () Bool)

(assert (=> b!763385 m!709355))

(declare-fun m!709357 () Bool)

(assert (=> b!763385 m!709357))

(declare-fun m!709359 () Bool)

(assert (=> b!763385 m!709359))

(declare-fun m!709361 () Bool)

(assert (=> b!763385 m!709361))

(assert (=> b!763385 m!709355))

(declare-fun m!709363 () Bool)

(assert (=> b!763385 m!709363))

(check-sat (not b!763379) (not b!763386) (not b!763383) (not b!763384) (not b!763385) (not start!66252) (not b!763381) (not b!763376) (not b!763377) (not b!763378) (not b!763382))
(check-sat)
