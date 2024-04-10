; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67372 () Bool)

(assert start!67372)

(declare-fun b!779438 () Bool)

(declare-fun res!527398 () Bool)

(declare-fun e!433603 () Bool)

(assert (=> b!779438 (=> (not res!527398) (not e!433603))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42601 0))(
  ( (array!42602 (arr!20393 (Array (_ BitVec 32) (_ BitVec 64))) (size!20814 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42601)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!779438 (= res!527398 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20393 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!779439 () Bool)

(declare-fun res!527408 () Bool)

(declare-fun e!433604 () Bool)

(assert (=> b!779439 (=> (not res!527408) (not e!433604))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!779439 (= res!527408 (and (= (size!20814 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20814 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20814 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!779440 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!433607 () Bool)

(declare-datatypes ((SeekEntryResult!7993 0))(
  ( (MissingZero!7993 (index!34340 (_ BitVec 32))) (Found!7993 (index!34341 (_ BitVec 32))) (Intermediate!7993 (undefined!8805 Bool) (index!34342 (_ BitVec 32)) (x!65282 (_ BitVec 32))) (Undefined!7993) (MissingVacant!7993 (index!34343 (_ BitVec 32))) )
))
(declare-fun lt!347301 () SeekEntryResult!7993)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42601 (_ BitVec 32)) SeekEntryResult!7993)

(assert (=> b!779440 (= e!433607 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20393 a!3186) j!159) a!3186 mask!3328) lt!347301))))

(declare-fun b!779441 () Bool)

(declare-fun res!527402 () Bool)

(declare-fun e!433609 () Bool)

(assert (=> b!779441 (=> (not res!527402) (not e!433609))))

(declare-datatypes ((List!14395 0))(
  ( (Nil!14392) (Cons!14391 (h!15505 (_ BitVec 64)) (t!20710 List!14395)) )
))
(declare-fun arrayNoDuplicates!0 (array!42601 (_ BitVec 32) List!14395) Bool)

(assert (=> b!779441 (= res!527402 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14392))))

(declare-fun b!779442 () Bool)

(declare-fun e!433605 () Bool)

(assert (=> b!779442 (= e!433603 e!433605)))

(declare-fun res!527400 () Bool)

(assert (=> b!779442 (=> (not res!527400) (not e!433605))))

(declare-fun lt!347306 () SeekEntryResult!7993)

(declare-fun lt!347303 () SeekEntryResult!7993)

(assert (=> b!779442 (= res!527400 (= lt!347306 lt!347303))))

(declare-fun lt!347307 () array!42601)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!347304 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42601 (_ BitVec 32)) SeekEntryResult!7993)

(assert (=> b!779442 (= lt!347303 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347304 lt!347307 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!779442 (= lt!347306 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347304 mask!3328) lt!347304 lt!347307 mask!3328))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!779442 (= lt!347304 (select (store (arr!20393 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!779442 (= lt!347307 (array!42602 (store (arr!20393 a!3186) i!1173 k!2102) (size!20814 a!3186)))))

(declare-fun lt!347309 () SeekEntryResult!7993)

(declare-fun e!433608 () Bool)

(declare-fun lt!347300 () SeekEntryResult!7993)

(declare-fun b!779443 () Bool)

(assert (=> b!779443 (= e!433608 (or (not (= lt!347309 lt!347301)) (= (select (store (arr!20393 a!3186) i!1173 k!2102) index!1321) lt!347304) (not (= (select (store (arr!20393 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!347300 lt!347309)))))

(assert (=> b!779443 (= lt!347309 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20393 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!779444 () Bool)

(declare-fun res!527403 () Bool)

(assert (=> b!779444 (=> (not res!527403) (not e!433609))))

(assert (=> b!779444 (= res!527403 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20814 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20814 a!3186))))))

(declare-fun e!433606 () Bool)

(declare-fun b!779445 () Bool)

(assert (=> b!779445 (= e!433606 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20393 a!3186) j!159) a!3186 mask!3328) (Found!7993 j!159)))))

(declare-fun b!779446 () Bool)

(declare-fun res!527395 () Bool)

(assert (=> b!779446 (=> (not res!527395) (not e!433603))))

(assert (=> b!779446 (= res!527395 e!433606)))

(declare-fun c!86425 () Bool)

(assert (=> b!779446 (= c!86425 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!779448 () Bool)

(declare-fun res!527406 () Bool)

(assert (=> b!779448 (=> (not res!527406) (not e!433604))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!779448 (= res!527406 (validKeyInArray!0 k!2102))))

(declare-fun b!779449 () Bool)

(assert (=> b!779449 (= e!433604 e!433609)))

(declare-fun res!527397 () Bool)

(assert (=> b!779449 (=> (not res!527397) (not e!433609))))

(declare-fun lt!347302 () SeekEntryResult!7993)

(assert (=> b!779449 (= res!527397 (or (= lt!347302 (MissingZero!7993 i!1173)) (= lt!347302 (MissingVacant!7993 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42601 (_ BitVec 32)) SeekEntryResult!7993)

(assert (=> b!779449 (= lt!347302 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun lt!347305 () SeekEntryResult!7993)

(declare-fun b!779450 () Bool)

(assert (=> b!779450 (= e!433606 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20393 a!3186) j!159) a!3186 mask!3328) lt!347305))))

(declare-fun b!779451 () Bool)

(assert (=> b!779451 (= e!433605 (not e!433608))))

(declare-fun res!527407 () Bool)

(assert (=> b!779451 (=> res!527407 e!433608)))

(assert (=> b!779451 (= res!527407 (or (not (is-Intermediate!7993 lt!347303)) (bvslt x!1131 (x!65282 lt!347303)) (not (= x!1131 (x!65282 lt!347303))) (not (= index!1321 (index!34342 lt!347303)))))))

(assert (=> b!779451 e!433607))

(declare-fun res!527404 () Bool)

(assert (=> b!779451 (=> (not res!527404) (not e!433607))))

(assert (=> b!779451 (= res!527404 (= lt!347300 lt!347301))))

(assert (=> b!779451 (= lt!347301 (Found!7993 j!159))))

(assert (=> b!779451 (= lt!347300 (seekEntryOrOpen!0 (select (arr!20393 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42601 (_ BitVec 32)) Bool)

(assert (=> b!779451 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26880 0))(
  ( (Unit!26881) )
))
(declare-fun lt!347308 () Unit!26880)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42601 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26880)

(assert (=> b!779451 (= lt!347308 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!779452 () Bool)

(declare-fun res!527396 () Bool)

(assert (=> b!779452 (=> (not res!527396) (not e!433609))))

(assert (=> b!779452 (= res!527396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!779453 () Bool)

(declare-fun res!527394 () Bool)

(assert (=> b!779453 (=> (not res!527394) (not e!433604))))

(assert (=> b!779453 (= res!527394 (validKeyInArray!0 (select (arr!20393 a!3186) j!159)))))

(declare-fun b!779454 () Bool)

(assert (=> b!779454 (= e!433609 e!433603)))

(declare-fun res!527401 () Bool)

(assert (=> b!779454 (=> (not res!527401) (not e!433603))))

(assert (=> b!779454 (= res!527401 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20393 a!3186) j!159) mask!3328) (select (arr!20393 a!3186) j!159) a!3186 mask!3328) lt!347305))))

(assert (=> b!779454 (= lt!347305 (Intermediate!7993 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!779447 () Bool)

(declare-fun res!527399 () Bool)

(assert (=> b!779447 (=> (not res!527399) (not e!433604))))

(declare-fun arrayContainsKey!0 (array!42601 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!779447 (= res!527399 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!527405 () Bool)

(assert (=> start!67372 (=> (not res!527405) (not e!433604))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67372 (= res!527405 (validMask!0 mask!3328))))

(assert (=> start!67372 e!433604))

(assert (=> start!67372 true))

(declare-fun array_inv!16189 (array!42601) Bool)

(assert (=> start!67372 (array_inv!16189 a!3186)))

(assert (= (and start!67372 res!527405) b!779439))

(assert (= (and b!779439 res!527408) b!779453))

(assert (= (and b!779453 res!527394) b!779448))

(assert (= (and b!779448 res!527406) b!779447))

(assert (= (and b!779447 res!527399) b!779449))

(assert (= (and b!779449 res!527397) b!779452))

(assert (= (and b!779452 res!527396) b!779441))

(assert (= (and b!779441 res!527402) b!779444))

(assert (= (and b!779444 res!527403) b!779454))

(assert (= (and b!779454 res!527401) b!779438))

(assert (= (and b!779438 res!527398) b!779446))

(assert (= (and b!779446 c!86425) b!779450))

(assert (= (and b!779446 (not c!86425)) b!779445))

(assert (= (and b!779446 res!527395) b!779442))

(assert (= (and b!779442 res!527400) b!779451))

(assert (= (and b!779451 res!527404) b!779440))

(assert (= (and b!779451 (not res!527407)) b!779443))

(declare-fun m!722951 () Bool)

(assert (=> b!779454 m!722951))

(assert (=> b!779454 m!722951))

(declare-fun m!722953 () Bool)

(assert (=> b!779454 m!722953))

(assert (=> b!779454 m!722953))

(assert (=> b!779454 m!722951))

(declare-fun m!722955 () Bool)

(assert (=> b!779454 m!722955))

(declare-fun m!722957 () Bool)

(assert (=> b!779447 m!722957))

(assert (=> b!779445 m!722951))

(assert (=> b!779445 m!722951))

(declare-fun m!722959 () Bool)

(assert (=> b!779445 m!722959))

(declare-fun m!722961 () Bool)

(assert (=> b!779441 m!722961))

(declare-fun m!722963 () Bool)

(assert (=> b!779452 m!722963))

(assert (=> b!779453 m!722951))

(assert (=> b!779453 m!722951))

(declare-fun m!722965 () Bool)

(assert (=> b!779453 m!722965))

(declare-fun m!722967 () Bool)

(assert (=> b!779443 m!722967))

(declare-fun m!722969 () Bool)

(assert (=> b!779443 m!722969))

(assert (=> b!779443 m!722951))

(assert (=> b!779443 m!722951))

(assert (=> b!779443 m!722959))

(declare-fun m!722971 () Bool)

(assert (=> b!779442 m!722971))

(assert (=> b!779442 m!722967))

(declare-fun m!722973 () Bool)

(assert (=> b!779442 m!722973))

(declare-fun m!722975 () Bool)

(assert (=> b!779442 m!722975))

(assert (=> b!779442 m!722973))

(declare-fun m!722977 () Bool)

(assert (=> b!779442 m!722977))

(assert (=> b!779450 m!722951))

(assert (=> b!779450 m!722951))

(declare-fun m!722979 () Bool)

(assert (=> b!779450 m!722979))

(declare-fun m!722981 () Bool)

(assert (=> b!779438 m!722981))

(assert (=> b!779440 m!722951))

(assert (=> b!779440 m!722951))

(declare-fun m!722983 () Bool)

(assert (=> b!779440 m!722983))

(declare-fun m!722985 () Bool)

(assert (=> b!779448 m!722985))

(assert (=> b!779451 m!722951))

(assert (=> b!779451 m!722951))

(declare-fun m!722987 () Bool)

(assert (=> b!779451 m!722987))

(declare-fun m!722989 () Bool)

(assert (=> b!779451 m!722989))

(declare-fun m!722991 () Bool)

(assert (=> b!779451 m!722991))

(declare-fun m!722993 () Bool)

(assert (=> b!779449 m!722993))

(declare-fun m!722995 () Bool)

(assert (=> start!67372 m!722995))

(declare-fun m!722997 () Bool)

(assert (=> start!67372 m!722997))

(push 1)

