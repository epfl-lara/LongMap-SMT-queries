; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67886 () Bool)

(assert start!67886)

(declare-fun b!789935 () Bool)

(declare-datatypes ((Unit!27368 0))(
  ( (Unit!27369) )
))
(declare-fun e!439035 () Unit!27368)

(declare-fun Unit!27370 () Unit!27368)

(assert (=> b!789935 (= e!439035 Unit!27370)))

(assert (=> b!789935 false))

(declare-fun b!789936 () Bool)

(declare-fun res!535234 () Bool)

(declare-fun e!439036 () Bool)

(assert (=> b!789936 (=> (not res!535234) (not e!439036))))

(declare-datatypes ((array!42882 0))(
  ( (array!42883 (arr!20528 (Array (_ BitVec 32) (_ BitVec 64))) (size!20949 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42882)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!789936 (= res!535234 (validKeyInArray!0 (select (arr!20528 a!3186) j!159)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun b!789937 () Bool)

(declare-fun e!439028 () Bool)

(declare-datatypes ((SeekEntryResult!8125 0))(
  ( (MissingZero!8125 (index!34868 (_ BitVec 32))) (Found!8125 (index!34869 (_ BitVec 32))) (Intermediate!8125 (undefined!8937 Bool) (index!34870 (_ BitVec 32)) (x!65813 (_ BitVec 32))) (Undefined!8125) (MissingVacant!8125 (index!34871 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42882 (_ BitVec 32)) SeekEntryResult!8125)

(assert (=> b!789937 (= e!439028 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20528 a!3186) j!159) a!3186 mask!3328) (Found!8125 j!159)))))

(declare-fun b!789938 () Bool)

(declare-fun res!535231 () Bool)

(assert (=> b!789938 (=> (not res!535231) (not e!439036))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!789938 (= res!535231 (validKeyInArray!0 k0!2102))))

(declare-fun res!535233 () Bool)

(assert (=> start!67886 (=> (not res!535233) (not e!439036))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67886 (= res!535233 (validMask!0 mask!3328))))

(assert (=> start!67886 e!439036))

(assert (=> start!67886 true))

(declare-fun array_inv!16411 (array!42882) Bool)

(assert (=> start!67886 (array_inv!16411 a!3186)))

(declare-fun b!789939 () Bool)

(declare-fun e!439033 () Bool)

(declare-fun e!439034 () Bool)

(assert (=> b!789939 (= e!439033 e!439034)))

(declare-fun res!535221 () Bool)

(assert (=> b!789939 (=> (not res!535221) (not e!439034))))

(declare-fun lt!352496 () SeekEntryResult!8125)

(declare-fun lt!352501 () SeekEntryResult!8125)

(assert (=> b!789939 (= res!535221 (= lt!352496 lt!352501))))

(declare-fun lt!352489 () (_ BitVec 64))

(declare-fun lt!352488 () array!42882)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42882 (_ BitVec 32)) SeekEntryResult!8125)

(assert (=> b!789939 (= lt!352501 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352489 lt!352488 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!789939 (= lt!352496 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352489 mask!3328) lt!352489 lt!352488 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!789939 (= lt!352489 (select (store (arr!20528 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!789939 (= lt!352488 (array!42883 (store (arr!20528 a!3186) i!1173 k0!2102) (size!20949 a!3186)))))

(declare-fun b!789940 () Bool)

(declare-fun res!535219 () Bool)

(declare-fun e!439026 () Bool)

(assert (=> b!789940 (=> (not res!535219) (not e!439026))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42882 (_ BitVec 32)) Bool)

(assert (=> b!789940 (= res!535219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!789941 () Bool)

(declare-fun res!535223 () Bool)

(assert (=> b!789941 (=> (not res!535223) (not e!439026))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!789941 (= res!535223 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20949 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20949 a!3186))))))

(declare-fun lt!352494 () SeekEntryResult!8125)

(declare-fun b!789942 () Bool)

(declare-fun e!439032 () Bool)

(assert (=> b!789942 (= e!439032 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20528 a!3186) j!159) a!3186 mask!3328) lt!352494))))

(declare-fun b!789943 () Bool)

(assert (=> b!789943 (= e!439026 e!439033)))

(declare-fun res!535235 () Bool)

(assert (=> b!789943 (=> (not res!535235) (not e!439033))))

(declare-fun lt!352499 () SeekEntryResult!8125)

(assert (=> b!789943 (= res!535235 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20528 a!3186) j!159) mask!3328) (select (arr!20528 a!3186) j!159) a!3186 mask!3328) lt!352499))))

(assert (=> b!789943 (= lt!352499 (Intermediate!8125 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!789944 () Bool)

(declare-fun e!439027 () Bool)

(declare-fun lt!352500 () SeekEntryResult!8125)

(assert (=> b!789944 (= e!439027 (= lt!352500 lt!352494))))

(declare-fun lt!352490 () SeekEntryResult!8125)

(declare-fun lt!352497 () SeekEntryResult!8125)

(assert (=> b!789944 (= lt!352490 lt!352497)))

(declare-fun lt!352495 () Unit!27368)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42882 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27368)

(assert (=> b!789944 (= lt!352495 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k0!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun b!789945 () Bool)

(assert (=> b!789945 (= e!439036 e!439026)))

(declare-fun res!535222 () Bool)

(assert (=> b!789945 (=> (not res!535222) (not e!439026))))

(declare-fun lt!352498 () SeekEntryResult!8125)

(assert (=> b!789945 (= res!535222 (or (= lt!352498 (MissingZero!8125 i!1173)) (= lt!352498 (MissingVacant!8125 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42882 (_ BitVec 32)) SeekEntryResult!8125)

(assert (=> b!789945 (= lt!352498 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!789946 () Bool)

(declare-fun e!439029 () Bool)

(assert (=> b!789946 (= e!439029 e!439027)))

(declare-fun res!535224 () Bool)

(assert (=> b!789946 (=> res!535224 e!439027)))

(assert (=> b!789946 (= res!535224 (or (not (= (select (arr!20528 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-fun lt!352493 () SeekEntryResult!8125)

(assert (=> b!789946 (and (= lt!352500 lt!352490) (= lt!352493 lt!352497))))

(assert (=> b!789946 (= lt!352490 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!352489 lt!352488 mask!3328))))

(assert (=> b!789946 (= lt!352500 (seekEntryOrOpen!0 lt!352489 lt!352488 mask!3328))))

(declare-fun lt!352502 () (_ BitVec 64))

(assert (=> b!789946 (= lt!352502 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!352491 () Unit!27368)

(assert (=> b!789946 (= lt!352491 e!439035)))

(declare-fun c!87767 () Bool)

(assert (=> b!789946 (= c!87767 (= lt!352502 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!789947 () Bool)

(declare-fun res!535226 () Bool)

(assert (=> b!789947 (=> (not res!535226) (not e!439036))))

(declare-fun arrayContainsKey!0 (array!42882 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!789947 (= res!535226 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!789948 () Bool)

(declare-fun Unit!27371 () Unit!27368)

(assert (=> b!789948 (= e!439035 Unit!27371)))

(declare-fun b!789949 () Bool)

(assert (=> b!789949 (= e!439028 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20528 a!3186) j!159) a!3186 mask!3328) lt!352499))))

(declare-fun b!789950 () Bool)

(declare-fun e!439031 () Bool)

(assert (=> b!789950 (= e!439034 (not e!439031))))

(declare-fun res!535232 () Bool)

(assert (=> b!789950 (=> res!535232 e!439031)))

(get-info :version)

(assert (=> b!789950 (= res!535232 (or (not ((_ is Intermediate!8125) lt!352501)) (bvslt x!1131 (x!65813 lt!352501)) (not (= x!1131 (x!65813 lt!352501))) (not (= index!1321 (index!34870 lt!352501)))))))

(assert (=> b!789950 e!439032))

(declare-fun res!535228 () Bool)

(assert (=> b!789950 (=> (not res!535228) (not e!439032))))

(assert (=> b!789950 (= res!535228 (= lt!352493 lt!352494))))

(assert (=> b!789950 (= lt!352494 (Found!8125 j!159))))

(assert (=> b!789950 (= lt!352493 (seekEntryOrOpen!0 (select (arr!20528 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!789950 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!352492 () Unit!27368)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42882 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27368)

(assert (=> b!789950 (= lt!352492 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!789951 () Bool)

(declare-fun res!535229 () Bool)

(assert (=> b!789951 (=> (not res!535229) (not e!439033))))

(assert (=> b!789951 (= res!535229 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20528 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!789952 () Bool)

(declare-fun e!439030 () Bool)

(assert (=> b!789952 (= e!439030 e!439029)))

(declare-fun res!535230 () Bool)

(assert (=> b!789952 (=> res!535230 e!439029)))

(assert (=> b!789952 (= res!535230 (= lt!352502 lt!352489))))

(assert (=> b!789952 (= lt!352502 (select (store (arr!20528 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!789953 () Bool)

(declare-fun res!535220 () Bool)

(assert (=> b!789953 (=> (not res!535220) (not e!439026))))

(declare-datatypes ((List!14569 0))(
  ( (Nil!14566) (Cons!14565 (h!15691 (_ BitVec 64)) (t!20875 List!14569)) )
))
(declare-fun arrayNoDuplicates!0 (array!42882 (_ BitVec 32) List!14569) Bool)

(assert (=> b!789953 (= res!535220 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14566))))

(declare-fun b!789954 () Bool)

(assert (=> b!789954 (= e!439031 e!439030)))

(declare-fun res!535236 () Bool)

(assert (=> b!789954 (=> res!535236 e!439030)))

(assert (=> b!789954 (= res!535236 (not (= lt!352497 lt!352494)))))

(assert (=> b!789954 (= lt!352497 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20528 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!789955 () Bool)

(declare-fun res!535225 () Bool)

(assert (=> b!789955 (=> (not res!535225) (not e!439036))))

(assert (=> b!789955 (= res!535225 (and (= (size!20949 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20949 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20949 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!789956 () Bool)

(declare-fun res!535227 () Bool)

(assert (=> b!789956 (=> (not res!535227) (not e!439033))))

(assert (=> b!789956 (= res!535227 e!439028)))

(declare-fun c!87768 () Bool)

(assert (=> b!789956 (= c!87768 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!67886 res!535233) b!789955))

(assert (= (and b!789955 res!535225) b!789936))

(assert (= (and b!789936 res!535234) b!789938))

(assert (= (and b!789938 res!535231) b!789947))

(assert (= (and b!789947 res!535226) b!789945))

(assert (= (and b!789945 res!535222) b!789940))

(assert (= (and b!789940 res!535219) b!789953))

(assert (= (and b!789953 res!535220) b!789941))

(assert (= (and b!789941 res!535223) b!789943))

(assert (= (and b!789943 res!535235) b!789951))

(assert (= (and b!789951 res!535229) b!789956))

(assert (= (and b!789956 c!87768) b!789949))

(assert (= (and b!789956 (not c!87768)) b!789937))

(assert (= (and b!789956 res!535227) b!789939))

(assert (= (and b!789939 res!535221) b!789950))

(assert (= (and b!789950 res!535228) b!789942))

(assert (= (and b!789950 (not res!535232)) b!789954))

(assert (= (and b!789954 (not res!535236)) b!789952))

(assert (= (and b!789952 (not res!535230)) b!789946))

(assert (= (and b!789946 c!87767) b!789935))

(assert (= (and b!789946 (not c!87767)) b!789948))

(assert (= (and b!789946 (not res!535224)) b!789944))

(declare-fun m!730383 () Bool)

(assert (=> b!789945 m!730383))

(declare-fun m!730385 () Bool)

(assert (=> b!789943 m!730385))

(assert (=> b!789943 m!730385))

(declare-fun m!730387 () Bool)

(assert (=> b!789943 m!730387))

(assert (=> b!789943 m!730387))

(assert (=> b!789943 m!730385))

(declare-fun m!730389 () Bool)

(assert (=> b!789943 m!730389))

(declare-fun m!730391 () Bool)

(assert (=> b!789947 m!730391))

(declare-fun m!730393 () Bool)

(assert (=> b!789940 m!730393))

(assert (=> b!789936 m!730385))

(assert (=> b!789936 m!730385))

(declare-fun m!730395 () Bool)

(assert (=> b!789936 m!730395))

(assert (=> b!789942 m!730385))

(assert (=> b!789942 m!730385))

(declare-fun m!730397 () Bool)

(assert (=> b!789942 m!730397))

(declare-fun m!730399 () Bool)

(assert (=> b!789952 m!730399))

(declare-fun m!730401 () Bool)

(assert (=> b!789952 m!730401))

(declare-fun m!730403 () Bool)

(assert (=> b!789939 m!730403))

(declare-fun m!730405 () Bool)

(assert (=> b!789939 m!730405))

(assert (=> b!789939 m!730399))

(declare-fun m!730407 () Bool)

(assert (=> b!789939 m!730407))

(assert (=> b!789939 m!730403))

(declare-fun m!730409 () Bool)

(assert (=> b!789939 m!730409))

(declare-fun m!730411 () Bool)

(assert (=> b!789951 m!730411))

(declare-fun m!730413 () Bool)

(assert (=> start!67886 m!730413))

(declare-fun m!730415 () Bool)

(assert (=> start!67886 m!730415))

(declare-fun m!730417 () Bool)

(assert (=> b!789944 m!730417))

(assert (=> b!789937 m!730385))

(assert (=> b!789937 m!730385))

(declare-fun m!730419 () Bool)

(assert (=> b!789937 m!730419))

(assert (=> b!789949 m!730385))

(assert (=> b!789949 m!730385))

(declare-fun m!730421 () Bool)

(assert (=> b!789949 m!730421))

(declare-fun m!730423 () Bool)

(assert (=> b!789946 m!730423))

(declare-fun m!730425 () Bool)

(assert (=> b!789946 m!730425))

(declare-fun m!730427 () Bool)

(assert (=> b!789946 m!730427))

(assert (=> b!789954 m!730385))

(assert (=> b!789954 m!730385))

(assert (=> b!789954 m!730419))

(assert (=> b!789950 m!730385))

(assert (=> b!789950 m!730385))

(declare-fun m!730429 () Bool)

(assert (=> b!789950 m!730429))

(declare-fun m!730431 () Bool)

(assert (=> b!789950 m!730431))

(declare-fun m!730433 () Bool)

(assert (=> b!789950 m!730433))

(declare-fun m!730435 () Bool)

(assert (=> b!789953 m!730435))

(declare-fun m!730437 () Bool)

(assert (=> b!789938 m!730437))

(check-sat (not b!789945) (not b!789944) (not start!67886) (not b!789938) (not b!789943) (not b!789940) (not b!789936) (not b!789939) (not b!789949) (not b!789953) (not b!789947) (not b!789954) (not b!789950) (not b!789937) (not b!789946) (not b!789942))
(check-sat)
