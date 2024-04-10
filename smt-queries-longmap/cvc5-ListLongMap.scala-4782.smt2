; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65752 () Bool)

(assert start!65752)

(declare-fun b!755357 () Bool)

(declare-fun res!510566 () Bool)

(declare-fun e!421240 () Bool)

(assert (=> b!755357 (=> (not res!510566) (not e!421240))))

(declare-datatypes ((array!41925 0))(
  ( (array!41926 (arr!20076 (Array (_ BitVec 32) (_ BitVec 64))) (size!20497 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41925)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41925 (_ BitVec 32)) Bool)

(assert (=> b!755357 (= res!510566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!755358 () Bool)

(declare-fun e!421230 () Bool)

(declare-fun e!421241 () Bool)

(assert (=> b!755358 (= e!421230 e!421241)))

(declare-fun res!510564 () Bool)

(assert (=> b!755358 (=> res!510564 e!421241)))

(declare-fun lt!336222 () (_ BitVec 64))

(declare-fun lt!336226 () (_ BitVec 64))

(assert (=> b!755358 (= res!510564 (= lt!336222 lt!336226))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!755358 (= lt!336222 (select (store (arr!20076 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!755359 () Bool)

(declare-fun e!421236 () Bool)

(declare-datatypes ((SeekEntryResult!7676 0))(
  ( (MissingZero!7676 (index!33072 (_ BitVec 32))) (Found!7676 (index!33073 (_ BitVec 32))) (Intermediate!7676 (undefined!8488 Bool) (index!33074 (_ BitVec 32)) (x!63978 (_ BitVec 32))) (Undefined!7676) (MissingVacant!7676 (index!33075 (_ BitVec 32))) )
))
(declare-fun lt!336224 () SeekEntryResult!7676)

(declare-fun lt!336233 () SeekEntryResult!7676)

(assert (=> b!755359 (= e!421236 (= lt!336224 lt!336233))))

(declare-fun b!755360 () Bool)

(declare-fun res!510553 () Bool)

(assert (=> b!755360 (=> (not res!510553) (not e!421236))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!336230 () array!41925)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41925 (_ BitVec 32)) SeekEntryResult!7676)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41925 (_ BitVec 32)) SeekEntryResult!7676)

(assert (=> b!755360 (= res!510553 (= (seekEntryOrOpen!0 lt!336226 lt!336230 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336226 lt!336230 mask!3328)))))

(declare-fun b!755361 () Bool)

(declare-fun res!510565 () Bool)

(declare-fun e!421234 () Bool)

(assert (=> b!755361 (=> (not res!510565) (not e!421234))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!755361 (= res!510565 (and (= (size!20497 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20497 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20497 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!755362 () Bool)

(declare-fun e!421238 () Bool)

(assert (=> b!755362 (= e!421238 e!421230)))

(declare-fun res!510552 () Bool)

(assert (=> b!755362 (=> res!510552 e!421230)))

(declare-fun lt!336229 () SeekEntryResult!7676)

(assert (=> b!755362 (= res!510552 (not (= lt!336233 lt!336229)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!755362 (= lt!336233 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20076 a!3186) j!159) a!3186 mask!3328))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!421233 () Bool)

(declare-fun b!755363 () Bool)

(assert (=> b!755363 (= e!421233 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20076 a!3186) j!159) a!3186 mask!3328) lt!336229))))

(declare-fun b!755364 () Bool)

(declare-fun res!510554 () Bool)

(assert (=> b!755364 (=> (not res!510554) (not e!421234))))

(declare-fun arrayContainsKey!0 (array!41925 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!755364 (= res!510554 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!755365 () Bool)

(declare-fun e!421232 () Bool)

(assert (=> b!755365 (= e!421240 e!421232)))

(declare-fun res!510562 () Bool)

(assert (=> b!755365 (=> (not res!510562) (not e!421232))))

(declare-fun lt!336223 () SeekEntryResult!7676)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41925 (_ BitVec 32)) SeekEntryResult!7676)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!755365 (= res!510562 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20076 a!3186) j!159) mask!3328) (select (arr!20076 a!3186) j!159) a!3186 mask!3328) lt!336223))))

(assert (=> b!755365 (= lt!336223 (Intermediate!7676 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!755366 () Bool)

(assert (=> b!755366 (= e!421234 e!421240)))

(declare-fun res!510560 () Bool)

(assert (=> b!755366 (=> (not res!510560) (not e!421240))))

(declare-fun lt!336232 () SeekEntryResult!7676)

(assert (=> b!755366 (= res!510560 (or (= lt!336232 (MissingZero!7676 i!1173)) (= lt!336232 (MissingVacant!7676 i!1173))))))

(assert (=> b!755366 (= lt!336232 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!755367 () Bool)

(declare-fun res!510551 () Bool)

(assert (=> b!755367 (=> (not res!510551) (not e!421234))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!755367 (= res!510551 (validKeyInArray!0 (select (arr!20076 a!3186) j!159)))))

(declare-fun b!755368 () Bool)

(declare-datatypes ((Unit!26084 0))(
  ( (Unit!26085) )
))
(declare-fun e!421231 () Unit!26084)

(declare-fun Unit!26086 () Unit!26084)

(assert (=> b!755368 (= e!421231 Unit!26086)))

(declare-fun b!755369 () Bool)

(declare-fun e!421237 () Bool)

(assert (=> b!755369 (= e!421237 (not e!421238))))

(declare-fun res!510548 () Bool)

(assert (=> b!755369 (=> res!510548 e!421238)))

(declare-fun lt!336228 () SeekEntryResult!7676)

(assert (=> b!755369 (= res!510548 (or (not (is-Intermediate!7676 lt!336228)) (bvslt x!1131 (x!63978 lt!336228)) (not (= x!1131 (x!63978 lt!336228))) (not (= index!1321 (index!33074 lt!336228)))))))

(assert (=> b!755369 e!421233))

(declare-fun res!510556 () Bool)

(assert (=> b!755369 (=> (not res!510556) (not e!421233))))

(assert (=> b!755369 (= res!510556 (= lt!336224 lt!336229))))

(assert (=> b!755369 (= lt!336229 (Found!7676 j!159))))

(assert (=> b!755369 (= lt!336224 (seekEntryOrOpen!0 (select (arr!20076 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!755369 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!336225 () Unit!26084)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41925 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26084)

(assert (=> b!755369 (= lt!336225 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!755370 () Bool)

(declare-fun e!421235 () Bool)

(assert (=> b!755370 (= e!421235 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20076 a!3186) j!159) a!3186 mask!3328) (Found!7676 j!159)))))

(declare-fun b!755371 () Bool)

(declare-fun res!510561 () Bool)

(assert (=> b!755371 (=> (not res!510561) (not e!421234))))

(assert (=> b!755371 (= res!510561 (validKeyInArray!0 k!2102))))

(declare-fun b!755372 () Bool)

(declare-fun res!510557 () Bool)

(assert (=> b!755372 (=> (not res!510557) (not e!421240))))

(declare-datatypes ((List!14078 0))(
  ( (Nil!14075) (Cons!14074 (h!15146 (_ BitVec 64)) (t!20393 List!14078)) )
))
(declare-fun arrayNoDuplicates!0 (array!41925 (_ BitVec 32) List!14078) Bool)

(assert (=> b!755372 (= res!510557 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14075))))

(declare-fun b!755373 () Bool)

(declare-fun res!510550 () Bool)

(assert (=> b!755373 (=> (not res!510550) (not e!421240))))

(assert (=> b!755373 (= res!510550 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20497 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20497 a!3186))))))

(declare-fun b!755374 () Bool)

(assert (=> b!755374 (= e!421232 e!421237)))

(declare-fun res!510559 () Bool)

(assert (=> b!755374 (=> (not res!510559) (not e!421237))))

(declare-fun lt!336231 () SeekEntryResult!7676)

(assert (=> b!755374 (= res!510559 (= lt!336231 lt!336228))))

(assert (=> b!755374 (= lt!336228 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336226 lt!336230 mask!3328))))

(assert (=> b!755374 (= lt!336231 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336226 mask!3328) lt!336226 lt!336230 mask!3328))))

(assert (=> b!755374 (= lt!336226 (select (store (arr!20076 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!755374 (= lt!336230 (array!41926 (store (arr!20076 a!3186) i!1173 k!2102) (size!20497 a!3186)))))

(declare-fun b!755375 () Bool)

(assert (=> b!755375 (= e!421241 true)))

(assert (=> b!755375 e!421236))

(declare-fun res!510558 () Bool)

(assert (=> b!755375 (=> (not res!510558) (not e!421236))))

(assert (=> b!755375 (= res!510558 (= lt!336222 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336227 () Unit!26084)

(assert (=> b!755375 (= lt!336227 e!421231)))

(declare-fun c!82785 () Bool)

(assert (=> b!755375 (= c!82785 (= lt!336222 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!510549 () Bool)

(assert (=> start!65752 (=> (not res!510549) (not e!421234))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65752 (= res!510549 (validMask!0 mask!3328))))

(assert (=> start!65752 e!421234))

(assert (=> start!65752 true))

(declare-fun array_inv!15872 (array!41925) Bool)

(assert (=> start!65752 (array_inv!15872 a!3186)))

(declare-fun b!755376 () Bool)

(declare-fun res!510555 () Bool)

(assert (=> b!755376 (=> (not res!510555) (not e!421232))))

(assert (=> b!755376 (= res!510555 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20076 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!755377 () Bool)

(assert (=> b!755377 (= e!421235 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20076 a!3186) j!159) a!3186 mask!3328) lt!336223))))

(declare-fun b!755378 () Bool)

(declare-fun Unit!26087 () Unit!26084)

(assert (=> b!755378 (= e!421231 Unit!26087)))

(assert (=> b!755378 false))

(declare-fun b!755379 () Bool)

(declare-fun res!510563 () Bool)

(assert (=> b!755379 (=> (not res!510563) (not e!421232))))

(assert (=> b!755379 (= res!510563 e!421235)))

(declare-fun c!82786 () Bool)

(assert (=> b!755379 (= c!82786 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!65752 res!510549) b!755361))

(assert (= (and b!755361 res!510565) b!755367))

(assert (= (and b!755367 res!510551) b!755371))

(assert (= (and b!755371 res!510561) b!755364))

(assert (= (and b!755364 res!510554) b!755366))

(assert (= (and b!755366 res!510560) b!755357))

(assert (= (and b!755357 res!510566) b!755372))

(assert (= (and b!755372 res!510557) b!755373))

(assert (= (and b!755373 res!510550) b!755365))

(assert (= (and b!755365 res!510562) b!755376))

(assert (= (and b!755376 res!510555) b!755379))

(assert (= (and b!755379 c!82786) b!755377))

(assert (= (and b!755379 (not c!82786)) b!755370))

(assert (= (and b!755379 res!510563) b!755374))

(assert (= (and b!755374 res!510559) b!755369))

(assert (= (and b!755369 res!510556) b!755363))

(assert (= (and b!755369 (not res!510548)) b!755362))

(assert (= (and b!755362 (not res!510552)) b!755358))

(assert (= (and b!755358 (not res!510564)) b!755375))

(assert (= (and b!755375 c!82785) b!755378))

(assert (= (and b!755375 (not c!82785)) b!755368))

(assert (= (and b!755375 res!510558) b!755360))

(assert (= (and b!755360 res!510553) b!755359))

(declare-fun m!703579 () Bool)

(assert (=> b!755365 m!703579))

(assert (=> b!755365 m!703579))

(declare-fun m!703581 () Bool)

(assert (=> b!755365 m!703581))

(assert (=> b!755365 m!703581))

(assert (=> b!755365 m!703579))

(declare-fun m!703583 () Bool)

(assert (=> b!755365 m!703583))

(assert (=> b!755369 m!703579))

(assert (=> b!755369 m!703579))

(declare-fun m!703585 () Bool)

(assert (=> b!755369 m!703585))

(declare-fun m!703587 () Bool)

(assert (=> b!755369 m!703587))

(declare-fun m!703589 () Bool)

(assert (=> b!755369 m!703589))

(declare-fun m!703591 () Bool)

(assert (=> b!755360 m!703591))

(declare-fun m!703593 () Bool)

(assert (=> b!755360 m!703593))

(declare-fun m!703595 () Bool)

(assert (=> b!755371 m!703595))

(declare-fun m!703597 () Bool)

(assert (=> b!755358 m!703597))

(declare-fun m!703599 () Bool)

(assert (=> b!755358 m!703599))

(declare-fun m!703601 () Bool)

(assert (=> b!755372 m!703601))

(assert (=> b!755367 m!703579))

(assert (=> b!755367 m!703579))

(declare-fun m!703603 () Bool)

(assert (=> b!755367 m!703603))

(assert (=> b!755363 m!703579))

(assert (=> b!755363 m!703579))

(declare-fun m!703605 () Bool)

(assert (=> b!755363 m!703605))

(declare-fun m!703607 () Bool)

(assert (=> b!755374 m!703607))

(declare-fun m!703609 () Bool)

(assert (=> b!755374 m!703609))

(assert (=> b!755374 m!703607))

(assert (=> b!755374 m!703597))

(declare-fun m!703611 () Bool)

(assert (=> b!755374 m!703611))

(declare-fun m!703613 () Bool)

(assert (=> b!755374 m!703613))

(declare-fun m!703615 () Bool)

(assert (=> b!755357 m!703615))

(declare-fun m!703617 () Bool)

(assert (=> start!65752 m!703617))

(declare-fun m!703619 () Bool)

(assert (=> start!65752 m!703619))

(assert (=> b!755377 m!703579))

(assert (=> b!755377 m!703579))

(declare-fun m!703621 () Bool)

(assert (=> b!755377 m!703621))

(assert (=> b!755370 m!703579))

(assert (=> b!755370 m!703579))

(declare-fun m!703623 () Bool)

(assert (=> b!755370 m!703623))

(declare-fun m!703625 () Bool)

(assert (=> b!755366 m!703625))

(declare-fun m!703627 () Bool)

(assert (=> b!755364 m!703627))

(declare-fun m!703629 () Bool)

(assert (=> b!755376 m!703629))

(assert (=> b!755362 m!703579))

(assert (=> b!755362 m!703579))

(assert (=> b!755362 m!703623))

(push 1)

