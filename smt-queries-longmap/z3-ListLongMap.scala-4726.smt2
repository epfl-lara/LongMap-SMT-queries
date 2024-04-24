; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65544 () Bool)

(assert start!65544)

(declare-fun b!745418 () Bool)

(declare-fun e!416453 () Bool)

(declare-fun e!416446 () Bool)

(assert (=> b!745418 (= e!416453 e!416446)))

(declare-fun res!501943 () Bool)

(assert (=> b!745418 (=> (not res!501943) (not e!416446))))

(declare-datatypes ((SeekEntryResult!7459 0))(
  ( (MissingZero!7459 (index!32204 (_ BitVec 32))) (Found!7459 (index!32205 (_ BitVec 32))) (Intermediate!7459 (undefined!8271 Bool) (index!32206 (_ BitVec 32)) (x!63325 (_ BitVec 32))) (Undefined!7459) (MissingVacant!7459 (index!32207 (_ BitVec 32))) )
))
(declare-fun lt!331133 () SeekEntryResult!7459)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!745418 (= res!501943 (or (= lt!331133 (MissingZero!7459 i!1173)) (= lt!331133 (MissingVacant!7459 i!1173))))))

(declare-datatypes ((array!41587 0))(
  ( (array!41588 (arr!19903 (Array (_ BitVec 32) (_ BitVec 64))) (size!20323 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41587)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41587 (_ BitVec 32)) SeekEntryResult!7459)

(assert (=> b!745418 (= lt!331133 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!501951 () Bool)

(assert (=> start!65544 (=> (not res!501951) (not e!416453))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65544 (= res!501951 (validMask!0 mask!3328))))

(assert (=> start!65544 e!416453))

(assert (=> start!65544 true))

(declare-fun array_inv!15762 (array!41587) Bool)

(assert (=> start!65544 (array_inv!15762 a!3186)))

(declare-fun b!745419 () Bool)

(declare-fun res!501937 () Bool)

(assert (=> b!745419 (=> (not res!501937) (not e!416446))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!745419 (= res!501937 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20323 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20323 a!3186))))))

(declare-fun b!745420 () Bool)

(declare-fun res!501944 () Bool)

(declare-fun e!416447 () Bool)

(assert (=> b!745420 (=> (not res!501944) (not e!416447))))

(declare-fun e!416451 () Bool)

(assert (=> b!745420 (= res!501944 e!416451)))

(declare-fun c!82124 () Bool)

(assert (=> b!745420 (= c!82124 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!745421 () Bool)

(assert (=> b!745421 (= e!416446 e!416447)))

(declare-fun res!501948 () Bool)

(assert (=> b!745421 (=> (not res!501948) (not e!416447))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!331137 () SeekEntryResult!7459)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41587 (_ BitVec 32)) SeekEntryResult!7459)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!745421 (= res!501948 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19903 a!3186) j!159) mask!3328) (select (arr!19903 a!3186) j!159) a!3186 mask!3328) lt!331137))))

(assert (=> b!745421 (= lt!331137 (Intermediate!7459 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!745422 () Bool)

(declare-fun res!501950 () Bool)

(assert (=> b!745422 (=> (not res!501950) (not e!416447))))

(assert (=> b!745422 (= res!501950 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19903 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!745423 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41587 (_ BitVec 32)) SeekEntryResult!7459)

(assert (=> b!745423 (= e!416451 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19903 a!3186) j!159) a!3186 mask!3328) (Found!7459 j!159)))))

(declare-fun b!745424 () Bool)

(declare-fun res!501939 () Bool)

(assert (=> b!745424 (=> (not res!501939) (not e!416453))))

(assert (=> b!745424 (= res!501939 (and (= (size!20323 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20323 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20323 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!745425 () Bool)

(declare-fun e!416454 () Bool)

(assert (=> b!745425 (= e!416447 e!416454)))

(declare-fun res!501938 () Bool)

(assert (=> b!745425 (=> (not res!501938) (not e!416454))))

(declare-fun lt!331136 () SeekEntryResult!7459)

(declare-fun lt!331129 () SeekEntryResult!7459)

(assert (=> b!745425 (= res!501938 (= lt!331136 lt!331129))))

(declare-fun lt!331130 () array!41587)

(declare-fun lt!331131 () (_ BitVec 64))

(assert (=> b!745425 (= lt!331129 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331131 lt!331130 mask!3328))))

(assert (=> b!745425 (= lt!331136 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331131 mask!3328) lt!331131 lt!331130 mask!3328))))

(assert (=> b!745425 (= lt!331131 (select (store (arr!19903 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!745425 (= lt!331130 (array!41588 (store (arr!19903 a!3186) i!1173 k0!2102) (size!20323 a!3186)))))

(declare-fun e!416449 () Bool)

(declare-fun lt!331134 () SeekEntryResult!7459)

(declare-fun b!745426 () Bool)

(assert (=> b!745426 (= e!416449 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19903 a!3186) j!159) a!3186 mask!3328) lt!331134))))

(declare-fun b!745427 () Bool)

(declare-fun res!501940 () Bool)

(assert (=> b!745427 (=> (not res!501940) (not e!416453))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!745427 (= res!501940 (validKeyInArray!0 (select (arr!19903 a!3186) j!159)))))

(declare-fun b!745428 () Bool)

(declare-fun e!416448 () Bool)

(assert (=> b!745428 (= e!416454 (not e!416448))))

(declare-fun res!501946 () Bool)

(assert (=> b!745428 (=> res!501946 e!416448)))

(get-info :version)

(assert (=> b!745428 (= res!501946 (or (not ((_ is Intermediate!7459) lt!331129)) (bvslt x!1131 (x!63325 lt!331129)) (not (= x!1131 (x!63325 lt!331129))) (not (= index!1321 (index!32206 lt!331129)))))))

(declare-fun e!416452 () Bool)

(assert (=> b!745428 e!416452))

(declare-fun res!501941 () Bool)

(assert (=> b!745428 (=> (not res!501941) (not e!416452))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41587 (_ BitVec 32)) Bool)

(assert (=> b!745428 (= res!501941 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25477 0))(
  ( (Unit!25478) )
))
(declare-fun lt!331135 () Unit!25477)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41587 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25477)

(assert (=> b!745428 (= lt!331135 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!745429 () Bool)

(declare-fun res!501945 () Bool)

(assert (=> b!745429 (=> (not res!501945) (not e!416446))))

(assert (=> b!745429 (= res!501945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!745430 () Bool)

(declare-fun res!501947 () Bool)

(assert (=> b!745430 (=> (not res!501947) (not e!416453))))

(assert (=> b!745430 (= res!501947 (validKeyInArray!0 k0!2102))))

(declare-fun b!745431 () Bool)

(assert (=> b!745431 (= e!416448 true)))

(declare-fun lt!331132 () SeekEntryResult!7459)

(assert (=> b!745431 (= lt!331132 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19903 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!745432 () Bool)

(declare-fun res!501942 () Bool)

(assert (=> b!745432 (=> (not res!501942) (not e!416446))))

(declare-datatypes ((List!13812 0))(
  ( (Nil!13809) (Cons!13808 (h!14886 (_ BitVec 64)) (t!20119 List!13812)) )
))
(declare-fun arrayNoDuplicates!0 (array!41587 (_ BitVec 32) List!13812) Bool)

(assert (=> b!745432 (= res!501942 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13809))))

(declare-fun b!745433 () Bool)

(declare-fun res!501949 () Bool)

(assert (=> b!745433 (=> (not res!501949) (not e!416453))))

(declare-fun arrayContainsKey!0 (array!41587 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!745433 (= res!501949 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!745434 () Bool)

(assert (=> b!745434 (= e!416452 e!416449)))

(declare-fun res!501952 () Bool)

(assert (=> b!745434 (=> (not res!501952) (not e!416449))))

(assert (=> b!745434 (= res!501952 (= (seekEntryOrOpen!0 (select (arr!19903 a!3186) j!159) a!3186 mask!3328) lt!331134))))

(assert (=> b!745434 (= lt!331134 (Found!7459 j!159))))

(declare-fun b!745435 () Bool)

(assert (=> b!745435 (= e!416451 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19903 a!3186) j!159) a!3186 mask!3328) lt!331137))))

(assert (= (and start!65544 res!501951) b!745424))

(assert (= (and b!745424 res!501939) b!745427))

(assert (= (and b!745427 res!501940) b!745430))

(assert (= (and b!745430 res!501947) b!745433))

(assert (= (and b!745433 res!501949) b!745418))

(assert (= (and b!745418 res!501943) b!745429))

(assert (= (and b!745429 res!501945) b!745432))

(assert (= (and b!745432 res!501942) b!745419))

(assert (= (and b!745419 res!501937) b!745421))

(assert (= (and b!745421 res!501948) b!745422))

(assert (= (and b!745422 res!501950) b!745420))

(assert (= (and b!745420 c!82124) b!745435))

(assert (= (and b!745420 (not c!82124)) b!745423))

(assert (= (and b!745420 res!501944) b!745425))

(assert (= (and b!745425 res!501938) b!745428))

(assert (= (and b!745428 res!501941) b!745434))

(assert (= (and b!745434 res!501952) b!745426))

(assert (= (and b!745428 (not res!501946)) b!745431))

(declare-fun m!696327 () Bool)

(assert (=> b!745433 m!696327))

(declare-fun m!696329 () Bool)

(assert (=> b!745429 m!696329))

(declare-fun m!696331 () Bool)

(assert (=> b!745428 m!696331))

(declare-fun m!696333 () Bool)

(assert (=> b!745428 m!696333))

(declare-fun m!696335 () Bool)

(assert (=> b!745432 m!696335))

(declare-fun m!696337 () Bool)

(assert (=> b!745435 m!696337))

(assert (=> b!745435 m!696337))

(declare-fun m!696339 () Bool)

(assert (=> b!745435 m!696339))

(assert (=> b!745431 m!696337))

(assert (=> b!745431 m!696337))

(declare-fun m!696341 () Bool)

(assert (=> b!745431 m!696341))

(declare-fun m!696343 () Bool)

(assert (=> b!745425 m!696343))

(declare-fun m!696345 () Bool)

(assert (=> b!745425 m!696345))

(declare-fun m!696347 () Bool)

(assert (=> b!745425 m!696347))

(declare-fun m!696349 () Bool)

(assert (=> b!745425 m!696349))

(declare-fun m!696351 () Bool)

(assert (=> b!745425 m!696351))

(assert (=> b!745425 m!696345))

(declare-fun m!696353 () Bool)

(assert (=> b!745422 m!696353))

(assert (=> b!745423 m!696337))

(assert (=> b!745423 m!696337))

(assert (=> b!745423 m!696341))

(declare-fun m!696355 () Bool)

(assert (=> start!65544 m!696355))

(declare-fun m!696357 () Bool)

(assert (=> start!65544 m!696357))

(declare-fun m!696359 () Bool)

(assert (=> b!745430 m!696359))

(declare-fun m!696361 () Bool)

(assert (=> b!745418 m!696361))

(assert (=> b!745434 m!696337))

(assert (=> b!745434 m!696337))

(declare-fun m!696363 () Bool)

(assert (=> b!745434 m!696363))

(assert (=> b!745427 m!696337))

(assert (=> b!745427 m!696337))

(declare-fun m!696365 () Bool)

(assert (=> b!745427 m!696365))

(assert (=> b!745426 m!696337))

(assert (=> b!745426 m!696337))

(declare-fun m!696367 () Bool)

(assert (=> b!745426 m!696367))

(assert (=> b!745421 m!696337))

(assert (=> b!745421 m!696337))

(declare-fun m!696369 () Bool)

(assert (=> b!745421 m!696369))

(assert (=> b!745421 m!696369))

(assert (=> b!745421 m!696337))

(declare-fun m!696371 () Bool)

(assert (=> b!745421 m!696371))

(check-sat (not b!745430) (not b!745426) (not b!745429) (not b!745432) (not b!745423) (not b!745433) (not b!745435) (not b!745421) (not b!745428) (not b!745434) (not b!745418) (not b!745431) (not b!745425) (not start!65544) (not b!745427))
(check-sat)
