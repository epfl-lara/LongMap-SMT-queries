; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65976 () Bool)

(assert start!65976)

(declare-fun b!759394 () Bool)

(declare-fun e!423444 () Bool)

(declare-fun e!423441 () Bool)

(assert (=> b!759394 (= e!423444 e!423441)))

(declare-fun res!513586 () Bool)

(assert (=> b!759394 (=> (not res!513586) (not e!423441))))

(declare-datatypes ((SeekEntryResult!7675 0))(
  ( (MissingZero!7675 (index!33068 (_ BitVec 32))) (Found!7675 (index!33069 (_ BitVec 32))) (Intermediate!7675 (undefined!8487 Bool) (index!33070 (_ BitVec 32)) (x!64117 (_ BitVec 32))) (Undefined!7675) (MissingVacant!7675 (index!33071 (_ BitVec 32))) )
))
(declare-fun lt!338334 () SeekEntryResult!7675)

(declare-fun lt!338329 () SeekEntryResult!7675)

(assert (=> b!759394 (= res!513586 (= lt!338334 lt!338329))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!338333 () (_ BitVec 64))

(declare-datatypes ((array!42019 0))(
  ( (array!42020 (arr!20119 (Array (_ BitVec 32) (_ BitVec 64))) (size!20539 (_ BitVec 32))) )
))
(declare-fun lt!338335 () array!42019)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42019 (_ BitVec 32)) SeekEntryResult!7675)

(assert (=> b!759394 (= lt!338329 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338333 lt!338335 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!759394 (= lt!338334 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338333 mask!3328) lt!338333 lt!338335 mask!3328))))

(declare-fun a!3186 () array!42019)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!759394 (= lt!338333 (select (store (arr!20119 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!759394 (= lt!338335 (array!42020 (store (arr!20119 a!3186) i!1173 k0!2102) (size!20539 a!3186)))))

(declare-fun res!513570 () Bool)

(declare-fun e!423437 () Bool)

(assert (=> start!65976 (=> (not res!513570) (not e!423437))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65976 (= res!513570 (validMask!0 mask!3328))))

(assert (=> start!65976 e!423437))

(assert (=> start!65976 true))

(declare-fun array_inv!15978 (array!42019) Bool)

(assert (=> start!65976 (array_inv!15978 a!3186)))

(declare-fun b!759395 () Bool)

(declare-fun res!513583 () Bool)

(declare-fun e!423447 () Bool)

(assert (=> b!759395 (=> (not res!513583) (not e!423447))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42019 (_ BitVec 32)) Bool)

(assert (=> b!759395 (= res!513583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!759396 () Bool)

(declare-fun e!423439 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42019 (_ BitVec 32)) SeekEntryResult!7675)

(assert (=> b!759396 (= e!423439 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20119 a!3186) j!159) a!3186 mask!3328) (Found!7675 j!159)))))

(declare-fun b!759397 () Bool)

(declare-fun e!423442 () Bool)

(declare-fun e!423438 () Bool)

(assert (=> b!759397 (= e!423442 e!423438)))

(declare-fun res!513581 () Bool)

(assert (=> b!759397 (=> res!513581 e!423438)))

(declare-fun lt!338332 () (_ BitVec 64))

(assert (=> b!759397 (= res!513581 (= lt!338332 lt!338333))))

(assert (=> b!759397 (= lt!338332 (select (store (arr!20119 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!759398 () Bool)

(assert (=> b!759398 (= e!423447 e!423444)))

(declare-fun res!513576 () Bool)

(assert (=> b!759398 (=> (not res!513576) (not e!423444))))

(declare-fun lt!338336 () SeekEntryResult!7675)

(assert (=> b!759398 (= res!513576 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20119 a!3186) j!159) mask!3328) (select (arr!20119 a!3186) j!159) a!3186 mask!3328) lt!338336))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!759398 (= lt!338336 (Intermediate!7675 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!759399 () Bool)

(declare-fun res!513577 () Bool)

(assert (=> b!759399 (=> (not res!513577) (not e!423437))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!759399 (= res!513577 (validKeyInArray!0 (select (arr!20119 a!3186) j!159)))))

(declare-fun e!423443 () Bool)

(declare-fun b!759400 () Bool)

(declare-fun lt!338327 () SeekEntryResult!7675)

(assert (=> b!759400 (= e!423443 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20119 a!3186) j!159) a!3186 mask!3328) lt!338327))))

(declare-fun b!759401 () Bool)

(declare-fun res!513579 () Bool)

(assert (=> b!759401 (=> (not res!513579) (not e!423437))))

(declare-fun arrayContainsKey!0 (array!42019 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!759401 (= res!513579 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!759402 () Bool)

(declare-fun res!513584 () Bool)

(assert (=> b!759402 (=> (not res!513584) (not e!423444))))

(assert (=> b!759402 (= res!513584 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20119 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!759403 () Bool)

(declare-fun e!423440 () Bool)

(assert (=> b!759403 (= e!423441 (not e!423440))))

(declare-fun res!513585 () Bool)

(assert (=> b!759403 (=> res!513585 e!423440)))

(get-info :version)

(assert (=> b!759403 (= res!513585 (or (not ((_ is Intermediate!7675) lt!338329)) (bvslt x!1131 (x!64117 lt!338329)) (not (= x!1131 (x!64117 lt!338329))) (not (= index!1321 (index!33070 lt!338329)))))))

(assert (=> b!759403 e!423443))

(declare-fun res!513574 () Bool)

(assert (=> b!759403 (=> (not res!513574) (not e!423443))))

(declare-fun lt!338326 () SeekEntryResult!7675)

(assert (=> b!759403 (= res!513574 (= lt!338326 lt!338327))))

(assert (=> b!759403 (= lt!338327 (Found!7675 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42019 (_ BitVec 32)) SeekEntryResult!7675)

(assert (=> b!759403 (= lt!338326 (seekEntryOrOpen!0 (select (arr!20119 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!759403 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26257 0))(
  ( (Unit!26258) )
))
(declare-fun lt!338328 () Unit!26257)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42019 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26257)

(assert (=> b!759403 (= lt!338328 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!759404 () Bool)

(declare-fun e!423446 () Bool)

(assert (=> b!759404 (= e!423446 true)))

(declare-fun lt!338331 () SeekEntryResult!7675)

(declare-fun lt!338330 () SeekEntryResult!7675)

(assert (=> b!759404 (= lt!338331 lt!338330)))

(declare-fun lt!338325 () Unit!26257)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42019 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26257)

(assert (=> b!759404 (= lt!338325 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k0!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun b!759405 () Bool)

(declare-fun res!513571 () Bool)

(assert (=> b!759405 (=> (not res!513571) (not e!423437))))

(assert (=> b!759405 (= res!513571 (validKeyInArray!0 k0!2102))))

(declare-fun b!759406 () Bool)

(assert (=> b!759406 (= e!423438 e!423446)))

(declare-fun res!513573 () Bool)

(assert (=> b!759406 (=> res!513573 e!423446)))

(assert (=> b!759406 (= res!513573 (or (not (= (select (arr!20119 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-fun lt!338323 () SeekEntryResult!7675)

(assert (=> b!759406 (and (= lt!338323 lt!338331) (= lt!338326 lt!338330))))

(assert (=> b!759406 (= lt!338331 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!338333 lt!338335 mask!3328))))

(assert (=> b!759406 (= lt!338323 (seekEntryOrOpen!0 lt!338333 lt!338335 mask!3328))))

(assert (=> b!759406 (= lt!338332 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!338324 () Unit!26257)

(declare-fun e!423445 () Unit!26257)

(assert (=> b!759406 (= lt!338324 e!423445)))

(declare-fun c!83296 () Bool)

(assert (=> b!759406 (= c!83296 (= lt!338332 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!759407 () Bool)

(declare-fun res!513572 () Bool)

(assert (=> b!759407 (=> (not res!513572) (not e!423444))))

(assert (=> b!759407 (= res!513572 e!423439)))

(declare-fun c!83297 () Bool)

(assert (=> b!759407 (= c!83297 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!759408 () Bool)

(declare-fun res!513578 () Bool)

(assert (=> b!759408 (=> (not res!513578) (not e!423447))))

(assert (=> b!759408 (= res!513578 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20539 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20539 a!3186))))))

(declare-fun b!759409 () Bool)

(declare-fun res!513582 () Bool)

(assert (=> b!759409 (=> (not res!513582) (not e!423437))))

(assert (=> b!759409 (= res!513582 (and (= (size!20539 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20539 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20539 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!759410 () Bool)

(declare-fun Unit!26259 () Unit!26257)

(assert (=> b!759410 (= e!423445 Unit!26259)))

(declare-fun b!759411 () Bool)

(assert (=> b!759411 (= e!423437 e!423447)))

(declare-fun res!513580 () Bool)

(assert (=> b!759411 (=> (not res!513580) (not e!423447))))

(declare-fun lt!338337 () SeekEntryResult!7675)

(assert (=> b!759411 (= res!513580 (or (= lt!338337 (MissingZero!7675 i!1173)) (= lt!338337 (MissingVacant!7675 i!1173))))))

(assert (=> b!759411 (= lt!338337 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!759412 () Bool)

(declare-fun res!513575 () Bool)

(assert (=> b!759412 (=> (not res!513575) (not e!423447))))

(declare-datatypes ((List!14028 0))(
  ( (Nil!14025) (Cons!14024 (h!15102 (_ BitVec 64)) (t!20335 List!14028)) )
))
(declare-fun arrayNoDuplicates!0 (array!42019 (_ BitVec 32) List!14028) Bool)

(assert (=> b!759412 (= res!513575 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14025))))

(declare-fun b!759413 () Bool)

(assert (=> b!759413 (= e!423439 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20119 a!3186) j!159) a!3186 mask!3328) lt!338336))))

(declare-fun b!759414 () Bool)

(assert (=> b!759414 (= e!423440 e!423442)))

(declare-fun res!513569 () Bool)

(assert (=> b!759414 (=> res!513569 e!423442)))

(assert (=> b!759414 (= res!513569 (not (= lt!338330 lt!338327)))))

(assert (=> b!759414 (= lt!338330 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20119 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!759415 () Bool)

(declare-fun Unit!26260 () Unit!26257)

(assert (=> b!759415 (= e!423445 Unit!26260)))

(assert (=> b!759415 false))

(assert (= (and start!65976 res!513570) b!759409))

(assert (= (and b!759409 res!513582) b!759399))

(assert (= (and b!759399 res!513577) b!759405))

(assert (= (and b!759405 res!513571) b!759401))

(assert (= (and b!759401 res!513579) b!759411))

(assert (= (and b!759411 res!513580) b!759395))

(assert (= (and b!759395 res!513583) b!759412))

(assert (= (and b!759412 res!513575) b!759408))

(assert (= (and b!759408 res!513578) b!759398))

(assert (= (and b!759398 res!513576) b!759402))

(assert (= (and b!759402 res!513584) b!759407))

(assert (= (and b!759407 c!83297) b!759413))

(assert (= (and b!759407 (not c!83297)) b!759396))

(assert (= (and b!759407 res!513572) b!759394))

(assert (= (and b!759394 res!513586) b!759403))

(assert (= (and b!759403 res!513574) b!759400))

(assert (= (and b!759403 (not res!513585)) b!759414))

(assert (= (and b!759414 (not res!513569)) b!759397))

(assert (= (and b!759397 (not res!513581)) b!759406))

(assert (= (and b!759406 c!83296) b!759415))

(assert (= (and b!759406 (not c!83296)) b!759410))

(assert (= (and b!759406 (not res!513573)) b!759404))

(declare-fun m!707259 () Bool)

(assert (=> b!759399 m!707259))

(assert (=> b!759399 m!707259))

(declare-fun m!707261 () Bool)

(assert (=> b!759399 m!707261))

(assert (=> b!759398 m!707259))

(assert (=> b!759398 m!707259))

(declare-fun m!707263 () Bool)

(assert (=> b!759398 m!707263))

(assert (=> b!759398 m!707263))

(assert (=> b!759398 m!707259))

(declare-fun m!707265 () Bool)

(assert (=> b!759398 m!707265))

(declare-fun m!707267 () Bool)

(assert (=> b!759411 m!707267))

(declare-fun m!707269 () Bool)

(assert (=> b!759394 m!707269))

(declare-fun m!707271 () Bool)

(assert (=> b!759394 m!707271))

(declare-fun m!707273 () Bool)

(assert (=> b!759394 m!707273))

(declare-fun m!707275 () Bool)

(assert (=> b!759394 m!707275))

(declare-fun m!707277 () Bool)

(assert (=> b!759394 m!707277))

(assert (=> b!759394 m!707275))

(declare-fun m!707279 () Bool)

(assert (=> b!759402 m!707279))

(assert (=> b!759414 m!707259))

(assert (=> b!759414 m!707259))

(declare-fun m!707281 () Bool)

(assert (=> b!759414 m!707281))

(declare-fun m!707283 () Bool)

(assert (=> start!65976 m!707283))

(declare-fun m!707285 () Bool)

(assert (=> start!65976 m!707285))

(declare-fun m!707287 () Bool)

(assert (=> b!759406 m!707287))

(declare-fun m!707289 () Bool)

(assert (=> b!759406 m!707289))

(declare-fun m!707291 () Bool)

(assert (=> b!759406 m!707291))

(declare-fun m!707293 () Bool)

(assert (=> b!759395 m!707293))

(assert (=> b!759397 m!707269))

(declare-fun m!707295 () Bool)

(assert (=> b!759397 m!707295))

(assert (=> b!759413 m!707259))

(assert (=> b!759413 m!707259))

(declare-fun m!707297 () Bool)

(assert (=> b!759413 m!707297))

(declare-fun m!707299 () Bool)

(assert (=> b!759412 m!707299))

(declare-fun m!707301 () Bool)

(assert (=> b!759405 m!707301))

(assert (=> b!759403 m!707259))

(assert (=> b!759403 m!707259))

(declare-fun m!707303 () Bool)

(assert (=> b!759403 m!707303))

(declare-fun m!707305 () Bool)

(assert (=> b!759403 m!707305))

(declare-fun m!707307 () Bool)

(assert (=> b!759403 m!707307))

(declare-fun m!707309 () Bool)

(assert (=> b!759401 m!707309))

(assert (=> b!759400 m!707259))

(assert (=> b!759400 m!707259))

(declare-fun m!707311 () Bool)

(assert (=> b!759400 m!707311))

(assert (=> b!759396 m!707259))

(assert (=> b!759396 m!707259))

(assert (=> b!759396 m!707281))

(declare-fun m!707313 () Bool)

(assert (=> b!759404 m!707313))

(check-sat (not b!759412) (not b!759400) (not b!759405) (not b!759401) (not b!759411) (not b!759404) (not b!759399) (not b!759395) (not b!759403) (not b!759414) (not b!759413) (not b!759394) (not b!759398) (not b!759396) (not b!759406) (not start!65976))
(check-sat)
