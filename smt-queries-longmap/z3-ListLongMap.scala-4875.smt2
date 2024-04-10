; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67166 () Bool)

(assert start!67166)

(declare-fun b!776488 () Bool)

(declare-fun res!525286 () Bool)

(declare-fun e!432094 () Bool)

(assert (=> b!776488 (=> (not res!525286) (not e!432094))))

(declare-datatypes ((array!42521 0))(
  ( (array!42522 (arr!20356 (Array (_ BitVec 32) (_ BitVec 64))) (size!20777 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42521)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!776488 (= res!525286 (and (= (size!20777 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20777 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20777 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!776489 () Bool)

(declare-fun e!432097 () Bool)

(assert (=> b!776489 (= e!432097 true)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7956 0))(
  ( (MissingZero!7956 (index!34192 (_ BitVec 32))) (Found!7956 (index!34193 (_ BitVec 32))) (Intermediate!7956 (undefined!8768 Bool) (index!34194 (_ BitVec 32)) (x!65131 (_ BitVec 32))) (Undefined!7956) (MissingVacant!7956 (index!34195 (_ BitVec 32))) )
))
(declare-fun lt!345952 () SeekEntryResult!7956)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42521 (_ BitVec 32)) SeekEntryResult!7956)

(assert (=> b!776489 (= lt!345952 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20356 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!776490 () Bool)

(declare-fun res!525291 () Bool)

(declare-fun e!432090 () Bool)

(assert (=> b!776490 (=> (not res!525291) (not e!432090))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!776490 (= res!525291 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20777 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20777 a!3186))))))

(declare-fun b!776492 () Bool)

(declare-fun e!432096 () Bool)

(assert (=> b!776492 (= e!432090 e!432096)))

(declare-fun res!525284 () Bool)

(assert (=> b!776492 (=> (not res!525284) (not e!432096))))

(declare-fun lt!345949 () SeekEntryResult!7956)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42521 (_ BitVec 32)) SeekEntryResult!7956)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!776492 (= res!525284 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20356 a!3186) j!159) mask!3328) (select (arr!20356 a!3186) j!159) a!3186 mask!3328) lt!345949))))

(assert (=> b!776492 (= lt!345949 (Intermediate!7956 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!776493 () Bool)

(declare-fun res!525294 () Bool)

(assert (=> b!776493 (=> (not res!525294) (not e!432094))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!776493 (= res!525294 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun e!432091 () Bool)

(declare-fun b!776494 () Bool)

(assert (=> b!776494 (= e!432091 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20356 a!3186) j!159) a!3186 mask!3328) lt!345949))))

(declare-fun b!776495 () Bool)

(declare-fun res!525298 () Bool)

(assert (=> b!776495 (=> (not res!525298) (not e!432090))))

(declare-datatypes ((List!14358 0))(
  ( (Nil!14355) (Cons!14354 (h!15462 (_ BitVec 64)) (t!20673 List!14358)) )
))
(declare-fun arrayNoDuplicates!0 (array!42521 (_ BitVec 32) List!14358) Bool)

(assert (=> b!776495 (= res!525298 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14355))))

(declare-fun b!776496 () Bool)

(declare-fun e!432093 () Bool)

(assert (=> b!776496 (= e!432096 e!432093)))

(declare-fun res!525299 () Bool)

(assert (=> b!776496 (=> (not res!525299) (not e!432093))))

(declare-fun lt!345950 () SeekEntryResult!7956)

(declare-fun lt!345948 () SeekEntryResult!7956)

(assert (=> b!776496 (= res!525299 (= lt!345950 lt!345948))))

(declare-fun lt!345951 () (_ BitVec 64))

(declare-fun lt!345947 () array!42521)

(assert (=> b!776496 (= lt!345948 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345951 lt!345947 mask!3328))))

(assert (=> b!776496 (= lt!345950 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345951 mask!3328) lt!345951 lt!345947 mask!3328))))

(assert (=> b!776496 (= lt!345951 (select (store (arr!20356 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!776496 (= lt!345947 (array!42522 (store (arr!20356 a!3186) i!1173 k0!2102) (size!20777 a!3186)))))

(declare-fun b!776497 () Bool)

(declare-fun res!525295 () Bool)

(assert (=> b!776497 (=> (not res!525295) (not e!432096))))

(assert (=> b!776497 (= res!525295 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20356 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!776498 () Bool)

(assert (=> b!776498 (= e!432094 e!432090)))

(declare-fun res!525292 () Bool)

(assert (=> b!776498 (=> (not res!525292) (not e!432090))))

(declare-fun lt!345953 () SeekEntryResult!7956)

(assert (=> b!776498 (= res!525292 (or (= lt!345953 (MissingZero!7956 i!1173)) (= lt!345953 (MissingVacant!7956 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42521 (_ BitVec 32)) SeekEntryResult!7956)

(assert (=> b!776498 (= lt!345953 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!776499 () Bool)

(declare-fun e!432095 () Bool)

(declare-fun e!432092 () Bool)

(assert (=> b!776499 (= e!432095 e!432092)))

(declare-fun res!525285 () Bool)

(assert (=> b!776499 (=> (not res!525285) (not e!432092))))

(declare-fun lt!345946 () SeekEntryResult!7956)

(assert (=> b!776499 (= res!525285 (= (seekEntryOrOpen!0 (select (arr!20356 a!3186) j!159) a!3186 mask!3328) lt!345946))))

(assert (=> b!776499 (= lt!345946 (Found!7956 j!159))))

(declare-fun b!776500 () Bool)

(declare-fun res!525290 () Bool)

(assert (=> b!776500 (=> (not res!525290) (not e!432096))))

(assert (=> b!776500 (= res!525290 e!432091)))

(declare-fun c!86002 () Bool)

(assert (=> b!776500 (= c!86002 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!776501 () Bool)

(assert (=> b!776501 (= e!432091 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20356 a!3186) j!159) a!3186 mask!3328) (Found!7956 j!159)))))

(declare-fun b!776502 () Bool)

(assert (=> b!776502 (= e!432092 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20356 a!3186) j!159) a!3186 mask!3328) lt!345946))))

(declare-fun b!776503 () Bool)

(declare-fun res!525297 () Bool)

(assert (=> b!776503 (=> (not res!525297) (not e!432094))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!776503 (= res!525297 (validKeyInArray!0 k0!2102))))

(declare-fun res!525296 () Bool)

(assert (=> start!67166 (=> (not res!525296) (not e!432094))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67166 (= res!525296 (validMask!0 mask!3328))))

(assert (=> start!67166 e!432094))

(assert (=> start!67166 true))

(declare-fun array_inv!16152 (array!42521) Bool)

(assert (=> start!67166 (array_inv!16152 a!3186)))

(declare-fun b!776491 () Bool)

(declare-fun res!525288 () Bool)

(assert (=> b!776491 (=> (not res!525288) (not e!432094))))

(assert (=> b!776491 (= res!525288 (validKeyInArray!0 (select (arr!20356 a!3186) j!159)))))

(declare-fun b!776504 () Bool)

(assert (=> b!776504 (= e!432093 (not e!432097))))

(declare-fun res!525293 () Bool)

(assert (=> b!776504 (=> res!525293 e!432097)))

(get-info :version)

(assert (=> b!776504 (= res!525293 (or (not ((_ is Intermediate!7956) lt!345948)) (bvslt x!1131 (x!65131 lt!345948)) (not (= x!1131 (x!65131 lt!345948))) (not (= index!1321 (index!34194 lt!345948)))))))

(assert (=> b!776504 e!432095))

(declare-fun res!525289 () Bool)

(assert (=> b!776504 (=> (not res!525289) (not e!432095))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42521 (_ BitVec 32)) Bool)

(assert (=> b!776504 (= res!525289 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26806 0))(
  ( (Unit!26807) )
))
(declare-fun lt!345945 () Unit!26806)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42521 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26806)

(assert (=> b!776504 (= lt!345945 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!776505 () Bool)

(declare-fun res!525287 () Bool)

(assert (=> b!776505 (=> (not res!525287) (not e!432090))))

(assert (=> b!776505 (= res!525287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!67166 res!525296) b!776488))

(assert (= (and b!776488 res!525286) b!776491))

(assert (= (and b!776491 res!525288) b!776503))

(assert (= (and b!776503 res!525297) b!776493))

(assert (= (and b!776493 res!525294) b!776498))

(assert (= (and b!776498 res!525292) b!776505))

(assert (= (and b!776505 res!525287) b!776495))

(assert (= (and b!776495 res!525298) b!776490))

(assert (= (and b!776490 res!525291) b!776492))

(assert (= (and b!776492 res!525284) b!776497))

(assert (= (and b!776497 res!525295) b!776500))

(assert (= (and b!776500 c!86002) b!776494))

(assert (= (and b!776500 (not c!86002)) b!776501))

(assert (= (and b!776500 res!525290) b!776496))

(assert (= (and b!776496 res!525299) b!776504))

(assert (= (and b!776504 res!525289) b!776499))

(assert (= (and b!776499 res!525285) b!776502))

(assert (= (and b!776504 (not res!525293)) b!776489))

(declare-fun m!720561 () Bool)

(assert (=> b!776495 m!720561))

(declare-fun m!720563 () Bool)

(assert (=> b!776497 m!720563))

(declare-fun m!720565 () Bool)

(assert (=> b!776494 m!720565))

(assert (=> b!776494 m!720565))

(declare-fun m!720567 () Bool)

(assert (=> b!776494 m!720567))

(assert (=> b!776491 m!720565))

(assert (=> b!776491 m!720565))

(declare-fun m!720569 () Bool)

(assert (=> b!776491 m!720569))

(assert (=> b!776501 m!720565))

(assert (=> b!776501 m!720565))

(declare-fun m!720571 () Bool)

(assert (=> b!776501 m!720571))

(declare-fun m!720573 () Bool)

(assert (=> b!776504 m!720573))

(declare-fun m!720575 () Bool)

(assert (=> b!776504 m!720575))

(assert (=> b!776489 m!720565))

(assert (=> b!776489 m!720565))

(assert (=> b!776489 m!720571))

(declare-fun m!720577 () Bool)

(assert (=> b!776503 m!720577))

(declare-fun m!720579 () Bool)

(assert (=> b!776498 m!720579))

(assert (=> b!776502 m!720565))

(assert (=> b!776502 m!720565))

(declare-fun m!720581 () Bool)

(assert (=> b!776502 m!720581))

(assert (=> b!776499 m!720565))

(assert (=> b!776499 m!720565))

(declare-fun m!720583 () Bool)

(assert (=> b!776499 m!720583))

(declare-fun m!720585 () Bool)

(assert (=> b!776496 m!720585))

(assert (=> b!776496 m!720585))

(declare-fun m!720587 () Bool)

(assert (=> b!776496 m!720587))

(declare-fun m!720589 () Bool)

(assert (=> b!776496 m!720589))

(declare-fun m!720591 () Bool)

(assert (=> b!776496 m!720591))

(declare-fun m!720593 () Bool)

(assert (=> b!776496 m!720593))

(assert (=> b!776492 m!720565))

(assert (=> b!776492 m!720565))

(declare-fun m!720595 () Bool)

(assert (=> b!776492 m!720595))

(assert (=> b!776492 m!720595))

(assert (=> b!776492 m!720565))

(declare-fun m!720597 () Bool)

(assert (=> b!776492 m!720597))

(declare-fun m!720599 () Bool)

(assert (=> b!776493 m!720599))

(declare-fun m!720601 () Bool)

(assert (=> start!67166 m!720601))

(declare-fun m!720603 () Bool)

(assert (=> start!67166 m!720603))

(declare-fun m!720605 () Bool)

(assert (=> b!776505 m!720605))

(check-sat (not b!776491) (not b!776505) (not b!776489) (not b!776492) (not b!776501) (not b!776502) (not b!776503) (not b!776499) (not b!776494) (not b!776504) (not b!776496) (not b!776493) (not start!67166) (not b!776495) (not b!776498))
(check-sat)
