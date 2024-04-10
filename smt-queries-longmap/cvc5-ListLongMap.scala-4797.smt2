; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65842 () Bool)

(assert start!65842)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42015 0))(
  ( (array!42016 (arr!20121 (Array (_ BitVec 32) (_ BitVec 64))) (size!20542 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42015)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7721 0))(
  ( (MissingZero!7721 (index!33252 (_ BitVec 32))) (Found!7721 (index!33253 (_ BitVec 32))) (Intermediate!7721 (undefined!8533 Bool) (index!33254 (_ BitVec 32)) (x!64143 (_ BitVec 32))) (Undefined!7721) (MissingVacant!7721 (index!33255 (_ BitVec 32))) )
))
(declare-fun lt!337886 () SeekEntryResult!7721)

(declare-fun b!758451 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!422856 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42015 (_ BitVec 32)) SeekEntryResult!7721)

(assert (=> b!758451 (= e!422856 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20121 a!3186) j!159) a!3186 mask!3328) lt!337886))))

(declare-fun b!758452 () Bool)

(declare-fun res!513109 () Bool)

(declare-fun e!422857 () Bool)

(assert (=> b!758452 (=> (not res!513109) (not e!422857))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!758452 (= res!513109 (and (= (size!20542 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20542 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20542 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!758453 () Bool)

(declare-fun res!513116 () Bool)

(declare-fun e!422853 () Bool)

(assert (=> b!758453 (=> (not res!513116) (not e!422853))))

(declare-datatypes ((List!14123 0))(
  ( (Nil!14120) (Cons!14119 (h!15191 (_ BitVec 64)) (t!20438 List!14123)) )
))
(declare-fun arrayNoDuplicates!0 (array!42015 (_ BitVec 32) List!14123) Bool)

(assert (=> b!758453 (= res!513116 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14120))))

(declare-fun b!758454 () Bool)

(assert (=> b!758454 (= e!422857 e!422853)))

(declare-fun res!513106 () Bool)

(assert (=> b!758454 (=> (not res!513106) (not e!422853))))

(declare-fun lt!337889 () SeekEntryResult!7721)

(assert (=> b!758454 (= res!513106 (or (= lt!337889 (MissingZero!7721 i!1173)) (= lt!337889 (MissingVacant!7721 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42015 (_ BitVec 32)) SeekEntryResult!7721)

(assert (=> b!758454 (= lt!337889 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!758455 () Bool)

(declare-fun e!422850 () Bool)

(declare-fun e!422852 () Bool)

(assert (=> b!758455 (= e!422850 e!422852)))

(declare-fun res!513108 () Bool)

(assert (=> b!758455 (=> res!513108 e!422852)))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!758455 (= res!513108 (or (not (= (select (arr!20121 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-fun lt!337878 () SeekEntryResult!7721)

(declare-fun lt!337887 () SeekEntryResult!7721)

(declare-fun lt!337881 () SeekEntryResult!7721)

(declare-fun lt!337885 () SeekEntryResult!7721)

(assert (=> b!758455 (and (= lt!337881 lt!337887) (= lt!337885 lt!337878))))

(declare-fun lt!337883 () array!42015)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!337880 () (_ BitVec 64))

(assert (=> b!758455 (= lt!337887 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337880 lt!337883 mask!3328))))

(assert (=> b!758455 (= lt!337881 (seekEntryOrOpen!0 lt!337880 lt!337883 mask!3328))))

(declare-fun lt!337875 () (_ BitVec 64))

(assert (=> b!758455 (= lt!337875 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-datatypes ((Unit!26264 0))(
  ( (Unit!26265) )
))
(declare-fun lt!337876 () Unit!26264)

(declare-fun e!422854 () Unit!26264)

(assert (=> b!758455 (= lt!337876 e!422854)))

(declare-fun c!83056 () Bool)

(assert (=> b!758455 (= c!83056 (= lt!337875 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!758456 () Bool)

(declare-fun res!513111 () Bool)

(declare-fun e!422858 () Bool)

(assert (=> b!758456 (=> (not res!513111) (not e!422858))))

(assert (=> b!758456 (= res!513111 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20121 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!422855 () Bool)

(declare-fun b!758457 () Bool)

(declare-fun lt!337882 () SeekEntryResult!7721)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42015 (_ BitVec 32)) SeekEntryResult!7721)

(assert (=> b!758457 (= e!422855 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20121 a!3186) j!159) a!3186 mask!3328) lt!337882))))

(declare-fun b!758458 () Bool)

(declare-fun e!422860 () Bool)

(assert (=> b!758458 (= e!422860 e!422850)))

(declare-fun res!513103 () Bool)

(assert (=> b!758458 (=> res!513103 e!422850)))

(assert (=> b!758458 (= res!513103 (= lt!337875 lt!337880))))

(assert (=> b!758458 (= lt!337875 (select (store (arr!20121 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!758459 () Bool)

(assert (=> b!758459 (= e!422852 (bvsge mask!3328 #b00000000000000000000000000000000))))

(assert (=> b!758459 (= lt!337887 lt!337878)))

(declare-fun lt!337884 () Unit!26264)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42015 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26264)

(assert (=> b!758459 (= lt!337884 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun b!758460 () Bool)

(declare-fun res!513113 () Bool)

(assert (=> b!758460 (=> (not res!513113) (not e!422857))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!758460 (= res!513113 (validKeyInArray!0 (select (arr!20121 a!3186) j!159)))))

(declare-fun b!758461 () Bool)

(declare-fun res!513107 () Bool)

(assert (=> b!758461 (=> (not res!513107) (not e!422853))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42015 (_ BitVec 32)) Bool)

(assert (=> b!758461 (= res!513107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!758462 () Bool)

(assert (=> b!758462 (= e!422855 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20121 a!3186) j!159) a!3186 mask!3328) (Found!7721 j!159)))))

(declare-fun b!758463 () Bool)

(assert (=> b!758463 (= e!422853 e!422858)))

(declare-fun res!513118 () Bool)

(assert (=> b!758463 (=> (not res!513118) (not e!422858))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!758463 (= res!513118 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20121 a!3186) j!159) mask!3328) (select (arr!20121 a!3186) j!159) a!3186 mask!3328) lt!337882))))

(assert (=> b!758463 (= lt!337882 (Intermediate!7721 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!758464 () Bool)

(declare-fun res!513105 () Bool)

(assert (=> b!758464 (=> (not res!513105) (not e!422858))))

(assert (=> b!758464 (= res!513105 e!422855)))

(declare-fun c!83055 () Bool)

(assert (=> b!758464 (= c!83055 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!758465 () Bool)

(declare-fun e!422851 () Bool)

(assert (=> b!758465 (= e!422851 e!422860)))

(declare-fun res!513115 () Bool)

(assert (=> b!758465 (=> res!513115 e!422860)))

(assert (=> b!758465 (= res!513115 (not (= lt!337878 lt!337886)))))

(assert (=> b!758465 (= lt!337878 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20121 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!758466 () Bool)

(declare-fun Unit!26266 () Unit!26264)

(assert (=> b!758466 (= e!422854 Unit!26266)))

(declare-fun b!758467 () Bool)

(declare-fun Unit!26267 () Unit!26264)

(assert (=> b!758467 (= e!422854 Unit!26267)))

(assert (=> b!758467 false))

(declare-fun b!758468 () Bool)

(declare-fun res!513114 () Bool)

(assert (=> b!758468 (=> (not res!513114) (not e!422857))))

(assert (=> b!758468 (= res!513114 (validKeyInArray!0 k!2102))))

(declare-fun res!513119 () Bool)

(assert (=> start!65842 (=> (not res!513119) (not e!422857))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65842 (= res!513119 (validMask!0 mask!3328))))

(assert (=> start!65842 e!422857))

(assert (=> start!65842 true))

(declare-fun array_inv!15917 (array!42015) Bool)

(assert (=> start!65842 (array_inv!15917 a!3186)))

(declare-fun b!758469 () Bool)

(declare-fun e!422861 () Bool)

(assert (=> b!758469 (= e!422858 e!422861)))

(declare-fun res!513110 () Bool)

(assert (=> b!758469 (=> (not res!513110) (not e!422861))))

(declare-fun lt!337888 () SeekEntryResult!7721)

(declare-fun lt!337877 () SeekEntryResult!7721)

(assert (=> b!758469 (= res!513110 (= lt!337888 lt!337877))))

(assert (=> b!758469 (= lt!337877 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337880 lt!337883 mask!3328))))

(assert (=> b!758469 (= lt!337888 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337880 mask!3328) lt!337880 lt!337883 mask!3328))))

(assert (=> b!758469 (= lt!337880 (select (store (arr!20121 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!758469 (= lt!337883 (array!42016 (store (arr!20121 a!3186) i!1173 k!2102) (size!20542 a!3186)))))

(declare-fun b!758470 () Bool)

(assert (=> b!758470 (= e!422861 (not e!422851))))

(declare-fun res!513117 () Bool)

(assert (=> b!758470 (=> res!513117 e!422851)))

(assert (=> b!758470 (= res!513117 (or (not (is-Intermediate!7721 lt!337877)) (bvslt x!1131 (x!64143 lt!337877)) (not (= x!1131 (x!64143 lt!337877))) (not (= index!1321 (index!33254 lt!337877)))))))

(assert (=> b!758470 e!422856))

(declare-fun res!513112 () Bool)

(assert (=> b!758470 (=> (not res!513112) (not e!422856))))

(assert (=> b!758470 (= res!513112 (= lt!337885 lt!337886))))

(assert (=> b!758470 (= lt!337886 (Found!7721 j!159))))

(assert (=> b!758470 (= lt!337885 (seekEntryOrOpen!0 (select (arr!20121 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!758470 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!337879 () Unit!26264)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42015 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26264)

(assert (=> b!758470 (= lt!337879 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!758471 () Bool)

(declare-fun res!513102 () Bool)

(assert (=> b!758471 (=> (not res!513102) (not e!422857))))

(declare-fun arrayContainsKey!0 (array!42015 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!758471 (= res!513102 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!758472 () Bool)

(declare-fun res!513104 () Bool)

(assert (=> b!758472 (=> (not res!513104) (not e!422853))))

(assert (=> b!758472 (= res!513104 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20542 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20542 a!3186))))))

(assert (= (and start!65842 res!513119) b!758452))

(assert (= (and b!758452 res!513109) b!758460))

(assert (= (and b!758460 res!513113) b!758468))

(assert (= (and b!758468 res!513114) b!758471))

(assert (= (and b!758471 res!513102) b!758454))

(assert (= (and b!758454 res!513106) b!758461))

(assert (= (and b!758461 res!513107) b!758453))

(assert (= (and b!758453 res!513116) b!758472))

(assert (= (and b!758472 res!513104) b!758463))

(assert (= (and b!758463 res!513118) b!758456))

(assert (= (and b!758456 res!513111) b!758464))

(assert (= (and b!758464 c!83055) b!758457))

(assert (= (and b!758464 (not c!83055)) b!758462))

(assert (= (and b!758464 res!513105) b!758469))

(assert (= (and b!758469 res!513110) b!758470))

(assert (= (and b!758470 res!513112) b!758451))

(assert (= (and b!758470 (not res!513117)) b!758465))

(assert (= (and b!758465 (not res!513115)) b!758458))

(assert (= (and b!758458 (not res!513103)) b!758455))

(assert (= (and b!758455 c!83056) b!758467))

(assert (= (and b!758455 (not c!83056)) b!758466))

(assert (= (and b!758455 (not res!513108)) b!758459))

(declare-fun m!705931 () Bool)

(assert (=> b!758463 m!705931))

(assert (=> b!758463 m!705931))

(declare-fun m!705933 () Bool)

(assert (=> b!758463 m!705933))

(assert (=> b!758463 m!705933))

(assert (=> b!758463 m!705931))

(declare-fun m!705935 () Bool)

(assert (=> b!758463 m!705935))

(declare-fun m!705937 () Bool)

(assert (=> b!758458 m!705937))

(declare-fun m!705939 () Bool)

(assert (=> b!758458 m!705939))

(declare-fun m!705941 () Bool)

(assert (=> b!758471 m!705941))

(declare-fun m!705943 () Bool)

(assert (=> b!758456 m!705943))

(declare-fun m!705945 () Bool)

(assert (=> b!758469 m!705945))

(declare-fun m!705947 () Bool)

(assert (=> b!758469 m!705947))

(assert (=> b!758469 m!705937))

(declare-fun m!705949 () Bool)

(assert (=> b!758469 m!705949))

(declare-fun m!705951 () Bool)

(assert (=> b!758469 m!705951))

(assert (=> b!758469 m!705945))

(declare-fun m!705953 () Bool)

(assert (=> b!758455 m!705953))

(declare-fun m!705955 () Bool)

(assert (=> b!758455 m!705955))

(declare-fun m!705957 () Bool)

(assert (=> b!758455 m!705957))

(declare-fun m!705959 () Bool)

(assert (=> b!758454 m!705959))

(declare-fun m!705961 () Bool)

(assert (=> b!758461 m!705961))

(assert (=> b!758457 m!705931))

(assert (=> b!758457 m!705931))

(declare-fun m!705963 () Bool)

(assert (=> b!758457 m!705963))

(assert (=> b!758465 m!705931))

(assert (=> b!758465 m!705931))

(declare-fun m!705965 () Bool)

(assert (=> b!758465 m!705965))

(declare-fun m!705967 () Bool)

(assert (=> b!758468 m!705967))

(declare-fun m!705969 () Bool)

(assert (=> b!758459 m!705969))

(declare-fun m!705971 () Bool)

(assert (=> start!65842 m!705971))

(declare-fun m!705973 () Bool)

(assert (=> start!65842 m!705973))

(assert (=> b!758462 m!705931))

(assert (=> b!758462 m!705931))

(assert (=> b!758462 m!705965))

(assert (=> b!758470 m!705931))

(assert (=> b!758470 m!705931))

(declare-fun m!705975 () Bool)

(assert (=> b!758470 m!705975))

(declare-fun m!705977 () Bool)

(assert (=> b!758470 m!705977))

(declare-fun m!705979 () Bool)

(assert (=> b!758470 m!705979))

(declare-fun m!705981 () Bool)

(assert (=> b!758453 m!705981))

(assert (=> b!758460 m!705931))

(assert (=> b!758460 m!705931))

(declare-fun m!705983 () Bool)

(assert (=> b!758460 m!705983))

(assert (=> b!758451 m!705931))

(assert (=> b!758451 m!705931))

(declare-fun m!705985 () Bool)

(assert (=> b!758451 m!705985))

(push 1)

