; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67884 () Bool)

(assert start!67884)

(declare-fun b!789386 () Bool)

(declare-fun res!534681 () Bool)

(declare-fun e!438748 () Bool)

(assert (=> b!789386 (=> (not res!534681) (not e!438748))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!789386 (= res!534681 (validKeyInArray!0 k!2102))))

(declare-datatypes ((SeekEntryResult!8117 0))(
  ( (MissingZero!8117 (index!34836 (_ BitVec 32))) (Found!8117 (index!34837 (_ BitVec 32))) (Intermediate!8117 (undefined!8929 Bool) (index!34838 (_ BitVec 32)) (x!65778 (_ BitVec 32))) (Undefined!8117) (MissingVacant!8117 (index!34839 (_ BitVec 32))) )
))
(declare-fun lt!352209 () SeekEntryResult!8117)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42861 0))(
  ( (array!42862 (arr!20517 (Array (_ BitVec 32) (_ BitVec 64))) (size!20938 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42861)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!789387 () Bool)

(declare-fun e!438749 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42861 (_ BitVec 32)) SeekEntryResult!8117)

(assert (=> b!789387 (= e!438749 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20517 a!3186) j!159) a!3186 mask!3328) lt!352209))))

(declare-fun b!789388 () Bool)

(declare-fun res!534688 () Bool)

(declare-fun e!438753 () Bool)

(assert (=> b!789388 (=> (not res!534688) (not e!438753))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!352216 () array!42861)

(declare-fun lt!352220 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42861 (_ BitVec 32)) SeekEntryResult!8117)

(assert (=> b!789388 (= res!534688 (= (seekEntryOrOpen!0 lt!352220 lt!352216 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!352220 lt!352216 mask!3328)))))

(declare-fun res!534682 () Bool)

(assert (=> start!67884 (=> (not res!534682) (not e!438748))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67884 (= res!534682 (validMask!0 mask!3328))))

(assert (=> start!67884 e!438748))

(assert (=> start!67884 true))

(declare-fun array_inv!16313 (array!42861) Bool)

(assert (=> start!67884 (array_inv!16313 a!3186)))

(declare-fun b!789389 () Bool)

(declare-fun res!534692 () Bool)

(declare-fun e!438754 () Bool)

(assert (=> b!789389 (=> (not res!534692) (not e!438754))))

(declare-fun e!438751 () Bool)

(assert (=> b!789389 (= res!534692 e!438751)))

(declare-fun c!87766 () Bool)

(assert (=> b!789389 (= c!87766 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!789390 () Bool)

(declare-fun e!438756 () Bool)

(assert (=> b!789390 (= e!438748 e!438756)))

(declare-fun res!534687 () Bool)

(assert (=> b!789390 (=> (not res!534687) (not e!438756))))

(declare-fun lt!352211 () SeekEntryResult!8117)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!789390 (= res!534687 (or (= lt!352211 (MissingZero!8117 i!1173)) (= lt!352211 (MissingVacant!8117 i!1173))))))

(assert (=> b!789390 (= lt!352211 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!789391 () Bool)

(declare-fun res!534676 () Bool)

(assert (=> b!789391 (=> (not res!534676) (not e!438756))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42861 (_ BitVec 32)) Bool)

(assert (=> b!789391 (= res!534676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!789392 () Bool)

(declare-fun e!438758 () Bool)

(assert (=> b!789392 (= e!438754 e!438758)))

(declare-fun res!534677 () Bool)

(assert (=> b!789392 (=> (not res!534677) (not e!438758))))

(declare-fun lt!352217 () SeekEntryResult!8117)

(declare-fun lt!352214 () SeekEntryResult!8117)

(assert (=> b!789392 (= res!534677 (= lt!352217 lt!352214))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42861 (_ BitVec 32)) SeekEntryResult!8117)

(assert (=> b!789392 (= lt!352214 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352220 lt!352216 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!789392 (= lt!352217 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352220 mask!3328) lt!352220 lt!352216 mask!3328))))

(assert (=> b!789392 (= lt!352220 (select (store (arr!20517 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!789392 (= lt!352216 (array!42862 (store (arr!20517 a!3186) i!1173 k!2102) (size!20938 a!3186)))))

(declare-fun b!789393 () Bool)

(declare-fun e!438755 () Bool)

(declare-fun e!438747 () Bool)

(assert (=> b!789393 (= e!438755 e!438747)))

(declare-fun res!534674 () Bool)

(assert (=> b!789393 (=> res!534674 e!438747)))

(declare-fun lt!352212 () SeekEntryResult!8117)

(assert (=> b!789393 (= res!534674 (not (= lt!352212 lt!352209)))))

(assert (=> b!789393 (= lt!352212 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20517 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!789394 () Bool)

(declare-fun lt!352219 () SeekEntryResult!8117)

(assert (=> b!789394 (= e!438751 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20517 a!3186) j!159) a!3186 mask!3328) lt!352219))))

(declare-fun b!789395 () Bool)

(declare-fun res!534680 () Bool)

(assert (=> b!789395 (=> (not res!534680) (not e!438756))))

(assert (=> b!789395 (= res!534680 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20938 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20938 a!3186))))))

(declare-fun b!789396 () Bool)

(declare-datatypes ((Unit!27356 0))(
  ( (Unit!27357) )
))
(declare-fun e!438752 () Unit!27356)

(declare-fun Unit!27358 () Unit!27356)

(assert (=> b!789396 (= e!438752 Unit!27358)))

(assert (=> b!789396 false))

(declare-fun b!789397 () Bool)

(assert (=> b!789397 (= e!438756 e!438754)))

(declare-fun res!534678 () Bool)

(assert (=> b!789397 (=> (not res!534678) (not e!438754))))

(assert (=> b!789397 (= res!534678 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20517 a!3186) j!159) mask!3328) (select (arr!20517 a!3186) j!159) a!3186 mask!3328) lt!352219))))

(assert (=> b!789397 (= lt!352219 (Intermediate!8117 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!789398 () Bool)

(declare-fun e!438757 () Bool)

(assert (=> b!789398 (= e!438757 true)))

(assert (=> b!789398 e!438753))

(declare-fun res!534684 () Bool)

(assert (=> b!789398 (=> (not res!534684) (not e!438753))))

(declare-fun lt!352215 () (_ BitVec 64))

(assert (=> b!789398 (= res!534684 (= lt!352215 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!352210 () Unit!27356)

(assert (=> b!789398 (= lt!352210 e!438752)))

(declare-fun c!87765 () Bool)

(assert (=> b!789398 (= c!87765 (= lt!352215 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!789399 () Bool)

(declare-fun Unit!27359 () Unit!27356)

(assert (=> b!789399 (= e!438752 Unit!27359)))

(declare-fun b!789400 () Bool)

(declare-fun res!534691 () Bool)

(assert (=> b!789400 (=> (not res!534691) (not e!438756))))

(declare-datatypes ((List!14519 0))(
  ( (Nil!14516) (Cons!14515 (h!15641 (_ BitVec 64)) (t!20834 List!14519)) )
))
(declare-fun arrayNoDuplicates!0 (array!42861 (_ BitVec 32) List!14519) Bool)

(assert (=> b!789400 (= res!534691 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14516))))

(declare-fun b!789401 () Bool)

(declare-fun res!534675 () Bool)

(assert (=> b!789401 (=> (not res!534675) (not e!438748))))

(declare-fun arrayContainsKey!0 (array!42861 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!789401 (= res!534675 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!789402 () Bool)

(declare-fun lt!352213 () SeekEntryResult!8117)

(assert (=> b!789402 (= e!438753 (= lt!352213 lt!352212))))

(declare-fun b!789403 () Bool)

(assert (=> b!789403 (= e!438758 (not e!438755))))

(declare-fun res!534683 () Bool)

(assert (=> b!789403 (=> res!534683 e!438755)))

(assert (=> b!789403 (= res!534683 (or (not (is-Intermediate!8117 lt!352214)) (bvslt x!1131 (x!65778 lt!352214)) (not (= x!1131 (x!65778 lt!352214))) (not (= index!1321 (index!34838 lt!352214)))))))

(assert (=> b!789403 e!438749))

(declare-fun res!534685 () Bool)

(assert (=> b!789403 (=> (not res!534685) (not e!438749))))

(assert (=> b!789403 (= res!534685 (= lt!352213 lt!352209))))

(assert (=> b!789403 (= lt!352209 (Found!8117 j!159))))

(assert (=> b!789403 (= lt!352213 (seekEntryOrOpen!0 (select (arr!20517 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!789403 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!352218 () Unit!27356)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42861 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27356)

(assert (=> b!789403 (= lt!352218 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!789404 () Bool)

(assert (=> b!789404 (= e!438747 e!438757)))

(declare-fun res!534679 () Bool)

(assert (=> b!789404 (=> res!534679 e!438757)))

(assert (=> b!789404 (= res!534679 (= lt!352215 lt!352220))))

(assert (=> b!789404 (= lt!352215 (select (store (arr!20517 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!789405 () Bool)

(assert (=> b!789405 (= e!438751 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20517 a!3186) j!159) a!3186 mask!3328) (Found!8117 j!159)))))

(declare-fun b!789406 () Bool)

(declare-fun res!534686 () Bool)

(assert (=> b!789406 (=> (not res!534686) (not e!438754))))

(assert (=> b!789406 (= res!534686 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20517 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!789407 () Bool)

(declare-fun res!534689 () Bool)

(assert (=> b!789407 (=> (not res!534689) (not e!438748))))

(assert (=> b!789407 (= res!534689 (and (= (size!20938 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20938 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20938 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!789408 () Bool)

(declare-fun res!534690 () Bool)

(assert (=> b!789408 (=> (not res!534690) (not e!438748))))

(assert (=> b!789408 (= res!534690 (validKeyInArray!0 (select (arr!20517 a!3186) j!159)))))

(assert (= (and start!67884 res!534682) b!789407))

(assert (= (and b!789407 res!534689) b!789408))

(assert (= (and b!789408 res!534690) b!789386))

(assert (= (and b!789386 res!534681) b!789401))

(assert (= (and b!789401 res!534675) b!789390))

(assert (= (and b!789390 res!534687) b!789391))

(assert (= (and b!789391 res!534676) b!789400))

(assert (= (and b!789400 res!534691) b!789395))

(assert (= (and b!789395 res!534680) b!789397))

(assert (= (and b!789397 res!534678) b!789406))

(assert (= (and b!789406 res!534686) b!789389))

(assert (= (and b!789389 c!87766) b!789394))

(assert (= (and b!789389 (not c!87766)) b!789405))

(assert (= (and b!789389 res!534692) b!789392))

(assert (= (and b!789392 res!534677) b!789403))

(assert (= (and b!789403 res!534685) b!789387))

(assert (= (and b!789403 (not res!534683)) b!789393))

(assert (= (and b!789393 (not res!534674)) b!789404))

(assert (= (and b!789404 (not res!534679)) b!789398))

(assert (= (and b!789398 c!87765) b!789396))

(assert (= (and b!789398 (not c!87765)) b!789399))

(assert (= (and b!789398 res!534684) b!789388))

(assert (= (and b!789388 res!534688) b!789402))

(declare-fun m!730481 () Bool)

(assert (=> b!789393 m!730481))

(assert (=> b!789393 m!730481))

(declare-fun m!730483 () Bool)

(assert (=> b!789393 m!730483))

(assert (=> b!789387 m!730481))

(assert (=> b!789387 m!730481))

(declare-fun m!730485 () Bool)

(assert (=> b!789387 m!730485))

(declare-fun m!730487 () Bool)

(assert (=> b!789386 m!730487))

(declare-fun m!730489 () Bool)

(assert (=> b!789390 m!730489))

(declare-fun m!730491 () Bool)

(assert (=> b!789406 m!730491))

(declare-fun m!730493 () Bool)

(assert (=> start!67884 m!730493))

(declare-fun m!730495 () Bool)

(assert (=> start!67884 m!730495))

(declare-fun m!730497 () Bool)

(assert (=> b!789391 m!730497))

(declare-fun m!730499 () Bool)

(assert (=> b!789404 m!730499))

(declare-fun m!730501 () Bool)

(assert (=> b!789404 m!730501))

(assert (=> b!789403 m!730481))

(assert (=> b!789403 m!730481))

(declare-fun m!730503 () Bool)

(assert (=> b!789403 m!730503))

(declare-fun m!730505 () Bool)

(assert (=> b!789403 m!730505))

(declare-fun m!730507 () Bool)

(assert (=> b!789403 m!730507))

(assert (=> b!789392 m!730499))

(declare-fun m!730509 () Bool)

(assert (=> b!789392 m!730509))

(declare-fun m!730511 () Bool)

(assert (=> b!789392 m!730511))

(declare-fun m!730513 () Bool)

(assert (=> b!789392 m!730513))

(assert (=> b!789392 m!730513))

(declare-fun m!730515 () Bool)

(assert (=> b!789392 m!730515))

(assert (=> b!789405 m!730481))

(assert (=> b!789405 m!730481))

(assert (=> b!789405 m!730483))

(declare-fun m!730517 () Bool)

(assert (=> b!789388 m!730517))

(declare-fun m!730519 () Bool)

(assert (=> b!789388 m!730519))

(assert (=> b!789394 m!730481))

(assert (=> b!789394 m!730481))

(declare-fun m!730521 () Bool)

(assert (=> b!789394 m!730521))

(declare-fun m!730523 () Bool)

(assert (=> b!789400 m!730523))

(assert (=> b!789397 m!730481))

(assert (=> b!789397 m!730481))

(declare-fun m!730525 () Bool)

(assert (=> b!789397 m!730525))

(assert (=> b!789397 m!730525))

(assert (=> b!789397 m!730481))

(declare-fun m!730527 () Bool)

(assert (=> b!789397 m!730527))

(assert (=> b!789408 m!730481))

(assert (=> b!789408 m!730481))

(declare-fun m!730529 () Bool)

(assert (=> b!789408 m!730529))

(declare-fun m!730531 () Bool)

(assert (=> b!789401 m!730531))

(push 1)

