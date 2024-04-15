; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67760 () Bool)

(assert start!67760)

(declare-fun b!787441 () Bool)

(declare-fun res!533426 () Bool)

(declare-fun e!437686 () Bool)

(assert (=> b!787441 (=> (not res!533426) (not e!437686))))

(declare-datatypes ((array!42819 0))(
  ( (array!42820 (arr!20498 (Array (_ BitVec 32) (_ BitVec 64))) (size!20919 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42819)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!787441 (= res!533426 (validKeyInArray!0 (select (arr!20498 a!3186) j!159)))))

(declare-fun b!787442 () Bool)

(declare-datatypes ((Unit!27248 0))(
  ( (Unit!27249) )
))
(declare-fun e!437679 () Unit!27248)

(declare-fun Unit!27250 () Unit!27248)

(assert (=> b!787442 (= e!437679 Unit!27250)))

(declare-fun b!787443 () Bool)

(declare-fun res!533423 () Bool)

(declare-fun e!437677 () Bool)

(assert (=> b!787443 (=> (not res!533423) (not e!437677))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!351148 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!351144 () array!42819)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8095 0))(
  ( (MissingZero!8095 (index!34748 (_ BitVec 32))) (Found!8095 (index!34749 (_ BitVec 32))) (Intermediate!8095 (undefined!8907 Bool) (index!34750 (_ BitVec 32)) (x!65694 (_ BitVec 32))) (Undefined!8095) (MissingVacant!8095 (index!34751 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42819 (_ BitVec 32)) SeekEntryResult!8095)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42819 (_ BitVec 32)) SeekEntryResult!8095)

(assert (=> b!787443 (= res!533423 (= (seekEntryOrOpen!0 lt!351148 lt!351144 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351148 lt!351144 mask!3328)))))

(declare-fun b!787444 () Bool)

(declare-fun res!533413 () Bool)

(declare-fun e!437682 () Bool)

(assert (=> b!787444 (=> (not res!533413) (not e!437682))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!787444 (= res!533413 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20498 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!787445 () Bool)

(declare-fun e!437685 () Bool)

(declare-fun e!437684 () Bool)

(assert (=> b!787445 (= e!437685 e!437684)))

(declare-fun res!533425 () Bool)

(assert (=> b!787445 (=> res!533425 e!437684)))

(declare-fun lt!351150 () SeekEntryResult!8095)

(declare-fun lt!351152 () SeekEntryResult!8095)

(assert (=> b!787445 (= res!533425 (not (= lt!351150 lt!351152)))))

(assert (=> b!787445 (= lt!351150 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20498 a!3186) j!159) a!3186 mask!3328))))

(declare-fun e!437676 () Bool)

(declare-fun b!787446 () Bool)

(declare-fun lt!351143 () SeekEntryResult!8095)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42819 (_ BitVec 32)) SeekEntryResult!8095)

(assert (=> b!787446 (= e!437676 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20498 a!3186) j!159) a!3186 mask!3328) lt!351143))))

(declare-fun b!787448 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!437681 () Bool)

(assert (=> b!787448 (= e!437681 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20498 a!3186) j!159) a!3186 mask!3328) lt!351152))))

(declare-fun b!787449 () Bool)

(declare-fun res!533427 () Bool)

(assert (=> b!787449 (=> (not res!533427) (not e!437686))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!787449 (= res!533427 (validKeyInArray!0 k0!2102))))

(declare-fun b!787450 () Bool)

(declare-fun res!533417 () Bool)

(assert (=> b!787450 (=> (not res!533417) (not e!437686))))

(assert (=> b!787450 (= res!533417 (and (= (size!20919 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20919 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20919 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!787451 () Bool)

(assert (=> b!787451 (= e!437676 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20498 a!3186) j!159) a!3186 mask!3328) (Found!8095 j!159)))))

(declare-fun b!787452 () Bool)

(declare-fun e!437678 () Bool)

(assert (=> b!787452 (= e!437678 true)))

(assert (=> b!787452 e!437677))

(declare-fun res!533429 () Bool)

(assert (=> b!787452 (=> (not res!533429) (not e!437677))))

(declare-fun lt!351147 () (_ BitVec 64))

(assert (=> b!787452 (= res!533429 (= lt!351147 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!351145 () Unit!27248)

(assert (=> b!787452 (= lt!351145 e!437679)))

(declare-fun c!87423 () Bool)

(assert (=> b!787452 (= c!87423 (= lt!351147 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!787453 () Bool)

(declare-fun res!533416 () Bool)

(declare-fun e!437680 () Bool)

(assert (=> b!787453 (=> (not res!533416) (not e!437680))))

(declare-datatypes ((List!14539 0))(
  ( (Nil!14536) (Cons!14535 (h!15658 (_ BitVec 64)) (t!20845 List!14539)) )
))
(declare-fun arrayNoDuplicates!0 (array!42819 (_ BitVec 32) List!14539) Bool)

(assert (=> b!787453 (= res!533416 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14536))))

(declare-fun b!787454 () Bool)

(declare-fun e!437683 () Bool)

(assert (=> b!787454 (= e!437682 e!437683)))

(declare-fun res!533421 () Bool)

(assert (=> b!787454 (=> (not res!533421) (not e!437683))))

(declare-fun lt!351146 () SeekEntryResult!8095)

(declare-fun lt!351151 () SeekEntryResult!8095)

(assert (=> b!787454 (= res!533421 (= lt!351146 lt!351151))))

(assert (=> b!787454 (= lt!351151 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351148 lt!351144 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!787454 (= lt!351146 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351148 mask!3328) lt!351148 lt!351144 mask!3328))))

(assert (=> b!787454 (= lt!351148 (select (store (arr!20498 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!787454 (= lt!351144 (array!42820 (store (arr!20498 a!3186) i!1173 k0!2102) (size!20919 a!3186)))))

(declare-fun b!787455 () Bool)

(declare-fun res!533415 () Bool)

(assert (=> b!787455 (=> (not res!533415) (not e!437682))))

(assert (=> b!787455 (= res!533415 e!437676)))

(declare-fun c!87422 () Bool)

(assert (=> b!787455 (= c!87422 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!787447 () Bool)

(declare-fun res!533424 () Bool)

(assert (=> b!787447 (=> (not res!533424) (not e!437680))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42819 (_ BitVec 32)) Bool)

(assert (=> b!787447 (= res!533424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!533419 () Bool)

(assert (=> start!67760 (=> (not res!533419) (not e!437686))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67760 (= res!533419 (validMask!0 mask!3328))))

(assert (=> start!67760 e!437686))

(assert (=> start!67760 true))

(declare-fun array_inv!16381 (array!42819) Bool)

(assert (=> start!67760 (array_inv!16381 a!3186)))

(declare-fun b!787456 () Bool)

(assert (=> b!787456 (= e!437686 e!437680)))

(declare-fun res!533412 () Bool)

(assert (=> b!787456 (=> (not res!533412) (not e!437680))))

(declare-fun lt!351149 () SeekEntryResult!8095)

(assert (=> b!787456 (= res!533412 (or (= lt!351149 (MissingZero!8095 i!1173)) (= lt!351149 (MissingVacant!8095 i!1173))))))

(assert (=> b!787456 (= lt!351149 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!787457 () Bool)

(declare-fun Unit!27251 () Unit!27248)

(assert (=> b!787457 (= e!437679 Unit!27251)))

(assert (=> b!787457 false))

(declare-fun b!787458 () Bool)

(declare-fun res!533428 () Bool)

(assert (=> b!787458 (=> (not res!533428) (not e!437686))))

(declare-fun arrayContainsKey!0 (array!42819 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!787458 (= res!533428 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!787459 () Bool)

(declare-fun lt!351141 () SeekEntryResult!8095)

(assert (=> b!787459 (= e!437677 (= lt!351141 lt!351150))))

(declare-fun b!787460 () Bool)

(declare-fun res!533420 () Bool)

(assert (=> b!787460 (=> (not res!533420) (not e!437680))))

(assert (=> b!787460 (= res!533420 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20919 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20919 a!3186))))))

(declare-fun b!787461 () Bool)

(assert (=> b!787461 (= e!437683 (not e!437685))))

(declare-fun res!533418 () Bool)

(assert (=> b!787461 (=> res!533418 e!437685)))

(get-info :version)

(assert (=> b!787461 (= res!533418 (or (not ((_ is Intermediate!8095) lt!351151)) (bvslt x!1131 (x!65694 lt!351151)) (not (= x!1131 (x!65694 lt!351151))) (not (= index!1321 (index!34750 lt!351151)))))))

(assert (=> b!787461 e!437681))

(declare-fun res!533414 () Bool)

(assert (=> b!787461 (=> (not res!533414) (not e!437681))))

(assert (=> b!787461 (= res!533414 (= lt!351141 lt!351152))))

(assert (=> b!787461 (= lt!351152 (Found!8095 j!159))))

(assert (=> b!787461 (= lt!351141 (seekEntryOrOpen!0 (select (arr!20498 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!787461 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!351142 () Unit!27248)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42819 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27248)

(assert (=> b!787461 (= lt!351142 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!787462 () Bool)

(assert (=> b!787462 (= e!437680 e!437682)))

(declare-fun res!533430 () Bool)

(assert (=> b!787462 (=> (not res!533430) (not e!437682))))

(assert (=> b!787462 (= res!533430 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20498 a!3186) j!159) mask!3328) (select (arr!20498 a!3186) j!159) a!3186 mask!3328) lt!351143))))

(assert (=> b!787462 (= lt!351143 (Intermediate!8095 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!787463 () Bool)

(assert (=> b!787463 (= e!437684 e!437678)))

(declare-fun res!533422 () Bool)

(assert (=> b!787463 (=> res!533422 e!437678)))

(assert (=> b!787463 (= res!533422 (= lt!351147 lt!351148))))

(assert (=> b!787463 (= lt!351147 (select (store (arr!20498 a!3186) i!1173 k0!2102) index!1321))))

(assert (= (and start!67760 res!533419) b!787450))

(assert (= (and b!787450 res!533417) b!787441))

(assert (= (and b!787441 res!533426) b!787449))

(assert (= (and b!787449 res!533427) b!787458))

(assert (= (and b!787458 res!533428) b!787456))

(assert (= (and b!787456 res!533412) b!787447))

(assert (= (and b!787447 res!533424) b!787453))

(assert (= (and b!787453 res!533416) b!787460))

(assert (= (and b!787460 res!533420) b!787462))

(assert (= (and b!787462 res!533430) b!787444))

(assert (= (and b!787444 res!533413) b!787455))

(assert (= (and b!787455 c!87422) b!787446))

(assert (= (and b!787455 (not c!87422)) b!787451))

(assert (= (and b!787455 res!533415) b!787454))

(assert (= (and b!787454 res!533421) b!787461))

(assert (= (and b!787461 res!533414) b!787448))

(assert (= (and b!787461 (not res!533418)) b!787445))

(assert (= (and b!787445 (not res!533425)) b!787463))

(assert (= (and b!787463 (not res!533422)) b!787452))

(assert (= (and b!787452 c!87423) b!787457))

(assert (= (and b!787452 (not c!87423)) b!787442))

(assert (= (and b!787452 res!533429) b!787443))

(assert (= (and b!787443 res!533423) b!787459))

(declare-fun m!728451 () Bool)

(assert (=> b!787447 m!728451))

(declare-fun m!728453 () Bool)

(assert (=> b!787461 m!728453))

(assert (=> b!787461 m!728453))

(declare-fun m!728455 () Bool)

(assert (=> b!787461 m!728455))

(declare-fun m!728457 () Bool)

(assert (=> b!787461 m!728457))

(declare-fun m!728459 () Bool)

(assert (=> b!787461 m!728459))

(assert (=> b!787448 m!728453))

(assert (=> b!787448 m!728453))

(declare-fun m!728461 () Bool)

(assert (=> b!787448 m!728461))

(assert (=> b!787451 m!728453))

(assert (=> b!787451 m!728453))

(declare-fun m!728463 () Bool)

(assert (=> b!787451 m!728463))

(assert (=> b!787441 m!728453))

(assert (=> b!787441 m!728453))

(declare-fun m!728465 () Bool)

(assert (=> b!787441 m!728465))

(declare-fun m!728467 () Bool)

(assert (=> b!787449 m!728467))

(assert (=> b!787446 m!728453))

(assert (=> b!787446 m!728453))

(declare-fun m!728469 () Bool)

(assert (=> b!787446 m!728469))

(assert (=> b!787445 m!728453))

(assert (=> b!787445 m!728453))

(assert (=> b!787445 m!728463))

(declare-fun m!728471 () Bool)

(assert (=> b!787458 m!728471))

(declare-fun m!728473 () Bool)

(assert (=> b!787453 m!728473))

(declare-fun m!728475 () Bool)

(assert (=> b!787444 m!728475))

(declare-fun m!728477 () Bool)

(assert (=> b!787454 m!728477))

(declare-fun m!728479 () Bool)

(assert (=> b!787454 m!728479))

(declare-fun m!728481 () Bool)

(assert (=> b!787454 m!728481))

(declare-fun m!728483 () Bool)

(assert (=> b!787454 m!728483))

(assert (=> b!787454 m!728479))

(declare-fun m!728485 () Bool)

(assert (=> b!787454 m!728485))

(assert (=> b!787463 m!728483))

(declare-fun m!728487 () Bool)

(assert (=> b!787463 m!728487))

(declare-fun m!728489 () Bool)

(assert (=> b!787456 m!728489))

(declare-fun m!728491 () Bool)

(assert (=> b!787443 m!728491))

(declare-fun m!728493 () Bool)

(assert (=> b!787443 m!728493))

(assert (=> b!787462 m!728453))

(assert (=> b!787462 m!728453))

(declare-fun m!728495 () Bool)

(assert (=> b!787462 m!728495))

(assert (=> b!787462 m!728495))

(assert (=> b!787462 m!728453))

(declare-fun m!728497 () Bool)

(assert (=> b!787462 m!728497))

(declare-fun m!728499 () Bool)

(assert (=> start!67760 m!728499))

(declare-fun m!728501 () Bool)

(assert (=> start!67760 m!728501))

(check-sat (not b!787461) (not b!787449) (not b!787443) (not b!787451) (not b!787462) (not b!787456) (not b!787448) (not b!787447) (not b!787441) (not start!67760) (not b!787445) (not b!787453) (not b!787454) (not b!787446) (not b!787458))
(check-sat)
