; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67856 () Bool)

(assert start!67856)

(declare-fun res!534403 () Bool)

(declare-fun e!438486 () Bool)

(assert (=> start!67856 (=> (not res!534403) (not e!438486))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67856 (= res!534403 (validMask!0 mask!3328))))

(assert (=> start!67856 e!438486))

(assert (=> start!67856 true))

(declare-datatypes ((array!42852 0))(
  ( (array!42853 (arr!20513 (Array (_ BitVec 32) (_ BitVec 64))) (size!20934 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42852)

(declare-fun array_inv!16396 (array!42852) Bool)

(assert (=> start!67856 (array_inv!16396 a!3186)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!438494 () Bool)

(declare-fun b!788929 () Bool)

(declare-datatypes ((SeekEntryResult!8110 0))(
  ( (MissingZero!8110 (index!34808 (_ BitVec 32))) (Found!8110 (index!34809 (_ BitVec 32))) (Intermediate!8110 (undefined!8922 Bool) (index!34810 (_ BitVec 32)) (x!65758 (_ BitVec 32))) (Undefined!8110) (MissingVacant!8110 (index!34811 (_ BitVec 32))) )
))
(declare-fun lt!351869 () SeekEntryResult!8110)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42852 (_ BitVec 32)) SeekEntryResult!8110)

(assert (=> b!788929 (= e!438494 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20513 a!3186) j!159) a!3186 mask!3328) lt!351869))))

(declare-fun b!788930 () Bool)

(declare-fun res!534404 () Bool)

(declare-fun e!438489 () Bool)

(assert (=> b!788930 (=> (not res!534404) (not e!438489))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42852 (_ BitVec 32)) Bool)

(assert (=> b!788930 (= res!534404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!788931 () Bool)

(declare-fun res!534400 () Bool)

(assert (=> b!788931 (=> (not res!534400) (not e!438486))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!788931 (= res!534400 (validKeyInArray!0 (select (arr!20513 a!3186) j!159)))))

(declare-fun b!788932 () Bool)

(declare-fun res!534395 () Bool)

(declare-fun e!438491 () Bool)

(assert (=> b!788932 (=> (not res!534395) (not e!438491))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!788932 (= res!534395 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20513 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!788933 () Bool)

(assert (=> b!788933 (= e!438486 e!438489)))

(declare-fun res!534407 () Bool)

(assert (=> b!788933 (=> (not res!534407) (not e!438489))))

(declare-fun lt!351871 () SeekEntryResult!8110)

(assert (=> b!788933 (= res!534407 (or (= lt!351871 (MissingZero!8110 i!1173)) (= lt!351871 (MissingVacant!8110 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42852 (_ BitVec 32)) SeekEntryResult!8110)

(assert (=> b!788933 (= lt!351871 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!788934 () Bool)

(declare-fun e!438495 () Bool)

(declare-fun lt!351870 () SeekEntryResult!8110)

(declare-fun lt!351868 () SeekEntryResult!8110)

(assert (=> b!788934 (= e!438495 (= lt!351870 lt!351868))))

(declare-fun b!788935 () Bool)

(declare-fun e!438492 () Bool)

(declare-fun e!438490 () Bool)

(assert (=> b!788935 (= e!438492 e!438490)))

(declare-fun res!534394 () Bool)

(assert (=> b!788935 (=> res!534394 e!438490)))

(declare-fun lt!351863 () SeekEntryResult!8110)

(assert (=> b!788935 (= res!534394 (not (= lt!351868 lt!351863)))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42852 (_ BitVec 32)) SeekEntryResult!8110)

(assert (=> b!788935 (= lt!351868 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20513 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!788936 () Bool)

(declare-fun res!534398 () Bool)

(assert (=> b!788936 (=> (not res!534398) (not e!438486))))

(declare-fun arrayContainsKey!0 (array!42852 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!788936 (= res!534398 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!788937 () Bool)

(declare-fun res!534406 () Bool)

(assert (=> b!788937 (=> (not res!534406) (not e!438489))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!788937 (= res!534406 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20934 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20934 a!3186))))))

(declare-fun b!788938 () Bool)

(assert (=> b!788938 (= e!438494 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20513 a!3186) j!159) a!3186 mask!3328) (Found!8110 j!159)))))

(declare-fun b!788939 () Bool)

(declare-fun res!534405 () Bool)

(assert (=> b!788939 (=> (not res!534405) (not e!438495))))

(declare-fun lt!351864 () (_ BitVec 64))

(declare-fun lt!351867 () array!42852)

(assert (=> b!788939 (= res!534405 (= (seekEntryOrOpen!0 lt!351864 lt!351867 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351864 lt!351867 mask!3328)))))

(declare-fun b!788940 () Bool)

(declare-fun res!534401 () Bool)

(assert (=> b!788940 (=> (not res!534401) (not e!438489))))

(declare-datatypes ((List!14554 0))(
  ( (Nil!14551) (Cons!14550 (h!15676 (_ BitVec 64)) (t!20860 List!14554)) )
))
(declare-fun arrayNoDuplicates!0 (array!42852 (_ BitVec 32) List!14554) Bool)

(assert (=> b!788940 (= res!534401 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14551))))

(declare-fun b!788941 () Bool)

(declare-fun res!534411 () Bool)

(assert (=> b!788941 (=> (not res!534411) (not e!438486))))

(assert (=> b!788941 (= res!534411 (validKeyInArray!0 k0!2102))))

(declare-fun b!788942 () Bool)

(declare-datatypes ((Unit!27308 0))(
  ( (Unit!27309) )
))
(declare-fun e!438496 () Unit!27308)

(declare-fun Unit!27310 () Unit!27308)

(assert (=> b!788942 (= e!438496 Unit!27310)))

(declare-fun b!788943 () Bool)

(assert (=> b!788943 (= e!438489 e!438491)))

(declare-fun res!534397 () Bool)

(assert (=> b!788943 (=> (not res!534397) (not e!438491))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!788943 (= res!534397 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20513 a!3186) j!159) mask!3328) (select (arr!20513 a!3186) j!159) a!3186 mask!3328) lt!351869))))

(assert (=> b!788943 (= lt!351869 (Intermediate!8110 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!788944 () Bool)

(declare-fun Unit!27311 () Unit!27308)

(assert (=> b!788944 (= e!438496 Unit!27311)))

(assert (=> b!788944 false))

(declare-fun b!788945 () Bool)

(declare-fun res!534408 () Bool)

(assert (=> b!788945 (=> (not res!534408) (not e!438491))))

(assert (=> b!788945 (= res!534408 e!438494)))

(declare-fun c!87677 () Bool)

(assert (=> b!788945 (= c!87677 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!788946 () Bool)

(declare-fun res!534410 () Bool)

(assert (=> b!788946 (=> (not res!534410) (not e!438486))))

(assert (=> b!788946 (= res!534410 (and (= (size!20934 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20934 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20934 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!788947 () Bool)

(declare-fun e!438493 () Bool)

(assert (=> b!788947 (= e!438491 e!438493)))

(declare-fun res!534402 () Bool)

(assert (=> b!788947 (=> (not res!534402) (not e!438493))))

(declare-fun lt!351861 () SeekEntryResult!8110)

(declare-fun lt!351862 () SeekEntryResult!8110)

(assert (=> b!788947 (= res!534402 (= lt!351861 lt!351862))))

(assert (=> b!788947 (= lt!351862 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351864 lt!351867 mask!3328))))

(assert (=> b!788947 (= lt!351861 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351864 mask!3328) lt!351864 lt!351867 mask!3328))))

(assert (=> b!788947 (= lt!351864 (select (store (arr!20513 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!788947 (= lt!351867 (array!42853 (store (arr!20513 a!3186) i!1173 k0!2102) (size!20934 a!3186)))))

(declare-fun e!438487 () Bool)

(declare-fun b!788948 () Bool)

(assert (=> b!788948 (= e!438487 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20513 a!3186) j!159) a!3186 mask!3328) lt!351863))))

(declare-fun b!788949 () Bool)

(declare-fun e!438488 () Bool)

(assert (=> b!788949 (= e!438490 e!438488)))

(declare-fun res!534393 () Bool)

(assert (=> b!788949 (=> res!534393 e!438488)))

(declare-fun lt!351872 () (_ BitVec 64))

(assert (=> b!788949 (= res!534393 (= lt!351872 lt!351864))))

(assert (=> b!788949 (= lt!351872 (select (store (arr!20513 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!788950 () Bool)

(assert (=> b!788950 (= e!438488 true)))

(assert (=> b!788950 e!438495))

(declare-fun res!534409 () Bool)

(assert (=> b!788950 (=> (not res!534409) (not e!438495))))

(assert (=> b!788950 (= res!534409 (= lt!351872 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!351866 () Unit!27308)

(assert (=> b!788950 (= lt!351866 e!438496)))

(declare-fun c!87678 () Bool)

(assert (=> b!788950 (= c!87678 (= lt!351872 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!788951 () Bool)

(assert (=> b!788951 (= e!438493 (not e!438492))))

(declare-fun res!534396 () Bool)

(assert (=> b!788951 (=> res!534396 e!438492)))

(get-info :version)

(assert (=> b!788951 (= res!534396 (or (not ((_ is Intermediate!8110) lt!351862)) (bvslt x!1131 (x!65758 lt!351862)) (not (= x!1131 (x!65758 lt!351862))) (not (= index!1321 (index!34810 lt!351862)))))))

(assert (=> b!788951 e!438487))

(declare-fun res!534399 () Bool)

(assert (=> b!788951 (=> (not res!534399) (not e!438487))))

(assert (=> b!788951 (= res!534399 (= lt!351870 lt!351863))))

(assert (=> b!788951 (= lt!351863 (Found!8110 j!159))))

(assert (=> b!788951 (= lt!351870 (seekEntryOrOpen!0 (select (arr!20513 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!788951 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!351865 () Unit!27308)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42852 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27308)

(assert (=> b!788951 (= lt!351865 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!67856 res!534403) b!788946))

(assert (= (and b!788946 res!534410) b!788931))

(assert (= (and b!788931 res!534400) b!788941))

(assert (= (and b!788941 res!534411) b!788936))

(assert (= (and b!788936 res!534398) b!788933))

(assert (= (and b!788933 res!534407) b!788930))

(assert (= (and b!788930 res!534404) b!788940))

(assert (= (and b!788940 res!534401) b!788937))

(assert (= (and b!788937 res!534406) b!788943))

(assert (= (and b!788943 res!534397) b!788932))

(assert (= (and b!788932 res!534395) b!788945))

(assert (= (and b!788945 c!87677) b!788929))

(assert (= (and b!788945 (not c!87677)) b!788938))

(assert (= (and b!788945 res!534408) b!788947))

(assert (= (and b!788947 res!534402) b!788951))

(assert (= (and b!788951 res!534399) b!788948))

(assert (= (and b!788951 (not res!534396)) b!788935))

(assert (= (and b!788935 (not res!534394)) b!788949))

(assert (= (and b!788949 (not res!534393)) b!788950))

(assert (= (and b!788950 c!87678) b!788944))

(assert (= (and b!788950 (not c!87678)) b!788942))

(assert (= (and b!788950 res!534409) b!788939))

(assert (= (and b!788939 res!534405) b!788934))

(declare-fun m!729567 () Bool)

(assert (=> b!788940 m!729567))

(declare-fun m!729569 () Bool)

(assert (=> b!788947 m!729569))

(declare-fun m!729571 () Bool)

(assert (=> b!788947 m!729571))

(declare-fun m!729573 () Bool)

(assert (=> b!788947 m!729573))

(declare-fun m!729575 () Bool)

(assert (=> b!788947 m!729575))

(assert (=> b!788947 m!729569))

(declare-fun m!729577 () Bool)

(assert (=> b!788947 m!729577))

(declare-fun m!729579 () Bool)

(assert (=> b!788931 m!729579))

(assert (=> b!788931 m!729579))

(declare-fun m!729581 () Bool)

(assert (=> b!788931 m!729581))

(assert (=> b!788929 m!729579))

(assert (=> b!788929 m!729579))

(declare-fun m!729583 () Bool)

(assert (=> b!788929 m!729583))

(assert (=> b!788935 m!729579))

(assert (=> b!788935 m!729579))

(declare-fun m!729585 () Bool)

(assert (=> b!788935 m!729585))

(declare-fun m!729587 () Bool)

(assert (=> b!788941 m!729587))

(declare-fun m!729589 () Bool)

(assert (=> b!788939 m!729589))

(declare-fun m!729591 () Bool)

(assert (=> b!788939 m!729591))

(assert (=> b!788938 m!729579))

(assert (=> b!788938 m!729579))

(assert (=> b!788938 m!729585))

(declare-fun m!729593 () Bool)

(assert (=> b!788933 m!729593))

(declare-fun m!729595 () Bool)

(assert (=> start!67856 m!729595))

(declare-fun m!729597 () Bool)

(assert (=> start!67856 m!729597))

(declare-fun m!729599 () Bool)

(assert (=> b!788932 m!729599))

(assert (=> b!788943 m!729579))

(assert (=> b!788943 m!729579))

(declare-fun m!729601 () Bool)

(assert (=> b!788943 m!729601))

(assert (=> b!788943 m!729601))

(assert (=> b!788943 m!729579))

(declare-fun m!729603 () Bool)

(assert (=> b!788943 m!729603))

(declare-fun m!729605 () Bool)

(assert (=> b!788930 m!729605))

(declare-fun m!729607 () Bool)

(assert (=> b!788936 m!729607))

(assert (=> b!788949 m!729573))

(declare-fun m!729609 () Bool)

(assert (=> b!788949 m!729609))

(assert (=> b!788948 m!729579))

(assert (=> b!788948 m!729579))

(declare-fun m!729611 () Bool)

(assert (=> b!788948 m!729611))

(assert (=> b!788951 m!729579))

(assert (=> b!788951 m!729579))

(declare-fun m!729613 () Bool)

(assert (=> b!788951 m!729613))

(declare-fun m!729615 () Bool)

(assert (=> b!788951 m!729615))

(declare-fun m!729617 () Bool)

(assert (=> b!788951 m!729617))

(check-sat (not start!67856) (not b!788940) (not b!788935) (not b!788941) (not b!788943) (not b!788930) (not b!788938) (not b!788936) (not b!788929) (not b!788951) (not b!788933) (not b!788931) (not b!788947) (not b!788948) (not b!788939))
(check-sat)
