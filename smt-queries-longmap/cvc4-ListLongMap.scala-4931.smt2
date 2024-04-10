; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67900 () Bool)

(assert start!67900)

(declare-fun b!789921 () Bool)

(declare-fun e!439038 () Bool)

(declare-fun e!439037 () Bool)

(assert (=> b!789921 (= e!439038 e!439037)))

(declare-fun res!535123 () Bool)

(assert (=> b!789921 (=> res!535123 e!439037)))

(declare-datatypes ((SeekEntryResult!8125 0))(
  ( (MissingZero!8125 (index!34868 (_ BitVec 32))) (Found!8125 (index!34869 (_ BitVec 32))) (Intermediate!8125 (undefined!8937 Bool) (index!34870 (_ BitVec 32)) (x!65802 (_ BitVec 32))) (Undefined!8125) (MissingVacant!8125 (index!34871 (_ BitVec 32))) )
))
(declare-fun lt!352560 () SeekEntryResult!8125)

(declare-fun lt!352549 () SeekEntryResult!8125)

(assert (=> b!789921 (= res!535123 (not (= lt!352560 lt!352549)))))

(declare-datatypes ((array!42877 0))(
  ( (array!42878 (arr!20525 (Array (_ BitVec 32) (_ BitVec 64))) (size!20946 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42877)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42877 (_ BitVec 32)) SeekEntryResult!8125)

(assert (=> b!789921 (= lt!352560 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20525 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!789922 () Bool)

(declare-fun e!439046 () Bool)

(declare-fun e!439044 () Bool)

(assert (=> b!789922 (= e!439046 e!439044)))

(declare-fun res!535120 () Bool)

(assert (=> b!789922 (=> (not res!535120) (not e!439044))))

(declare-fun lt!352556 () SeekEntryResult!8125)

(declare-fun lt!352558 () SeekEntryResult!8125)

(assert (=> b!789922 (= res!535120 (= lt!352556 lt!352558))))

(declare-fun lt!352552 () (_ BitVec 64))

(declare-fun lt!352553 () array!42877)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42877 (_ BitVec 32)) SeekEntryResult!8125)

(assert (=> b!789922 (= lt!352558 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352552 lt!352553 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!789922 (= lt!352556 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352552 mask!3328) lt!352552 lt!352553 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!789922 (= lt!352552 (select (store (arr!20525 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!789922 (= lt!352553 (array!42878 (store (arr!20525 a!3186) i!1173 k!2102) (size!20946 a!3186)))))

(declare-fun b!789923 () Bool)

(declare-fun e!439043 () Bool)

(declare-fun e!439041 () Bool)

(assert (=> b!789923 (= e!439043 e!439041)))

(declare-fun res!535128 () Bool)

(assert (=> b!789923 (=> (not res!535128) (not e!439041))))

(declare-fun lt!352550 () SeekEntryResult!8125)

(assert (=> b!789923 (= res!535128 (or (= lt!352550 (MissingZero!8125 i!1173)) (= lt!352550 (MissingVacant!8125 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42877 (_ BitVec 32)) SeekEntryResult!8125)

(assert (=> b!789923 (= lt!352550 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!535124 () Bool)

(assert (=> start!67900 (=> (not res!535124) (not e!439043))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67900 (= res!535124 (validMask!0 mask!3328))))

(assert (=> start!67900 e!439043))

(assert (=> start!67900 true))

(declare-fun array_inv!16321 (array!42877) Bool)

(assert (=> start!67900 (array_inv!16321 a!3186)))

(declare-fun e!439035 () Bool)

(declare-fun lt!352551 () SeekEntryResult!8125)

(declare-fun b!789924 () Bool)

(assert (=> b!789924 (= e!439035 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20525 a!3186) j!159) a!3186 mask!3328) lt!352551))))

(declare-fun b!789925 () Bool)

(assert (=> b!789925 (= e!439044 (not e!439038))))

(declare-fun res!535127 () Bool)

(assert (=> b!789925 (=> res!535127 e!439038)))

(assert (=> b!789925 (= res!535127 (or (not (is-Intermediate!8125 lt!352558)) (bvslt x!1131 (x!65802 lt!352558)) (not (= x!1131 (x!65802 lt!352558))) (not (= index!1321 (index!34870 lt!352558)))))))

(declare-fun e!439039 () Bool)

(assert (=> b!789925 e!439039))

(declare-fun res!535117 () Bool)

(assert (=> b!789925 (=> (not res!535117) (not e!439039))))

(declare-fun lt!352559 () SeekEntryResult!8125)

(assert (=> b!789925 (= res!535117 (= lt!352559 lt!352549))))

(assert (=> b!789925 (= lt!352549 (Found!8125 j!159))))

(assert (=> b!789925 (= lt!352559 (seekEntryOrOpen!0 (select (arr!20525 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42877 (_ BitVec 32)) Bool)

(assert (=> b!789925 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!27388 0))(
  ( (Unit!27389) )
))
(declare-fun lt!352562 () Unit!27388)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42877 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27388)

(assert (=> b!789925 (= lt!352562 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!789926 () Bool)

(declare-fun res!535118 () Bool)

(assert (=> b!789926 (=> (not res!535118) (not e!439041))))

(declare-datatypes ((List!14527 0))(
  ( (Nil!14524) (Cons!14523 (h!15649 (_ BitVec 64)) (t!20842 List!14527)) )
))
(declare-fun arrayNoDuplicates!0 (array!42877 (_ BitVec 32) List!14527) Bool)

(assert (=> b!789926 (= res!535118 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14524))))

(declare-fun b!789927 () Bool)

(declare-fun res!535121 () Bool)

(assert (=> b!789927 (=> (not res!535121) (not e!439041))))

(assert (=> b!789927 (= res!535121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!789928 () Bool)

(declare-fun res!535119 () Bool)

(assert (=> b!789928 (=> (not res!535119) (not e!439041))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!789928 (= res!535119 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20946 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20946 a!3186))))))

(declare-fun b!789929 () Bool)

(declare-fun res!535122 () Bool)

(assert (=> b!789929 (=> (not res!535122) (not e!439043))))

(declare-fun arrayContainsKey!0 (array!42877 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!789929 (= res!535122 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!789930 () Bool)

(assert (=> b!789930 (= e!439039 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20525 a!3186) j!159) a!3186 mask!3328) lt!352549))))

(declare-fun b!789931 () Bool)

(declare-fun res!535113 () Bool)

(assert (=> b!789931 (=> (not res!535113) (not e!439046))))

(assert (=> b!789931 (= res!535113 e!439035)))

(declare-fun c!87813 () Bool)

(assert (=> b!789931 (= c!87813 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!789932 () Bool)

(declare-fun e!439045 () Bool)

(declare-fun e!439036 () Bool)

(assert (=> b!789932 (= e!439045 e!439036)))

(declare-fun res!535130 () Bool)

(assert (=> b!789932 (=> res!535130 e!439036)))

(assert (=> b!789932 (= res!535130 (or (not (= (select (arr!20525 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-fun lt!352555 () SeekEntryResult!8125)

(declare-fun lt!352561 () SeekEntryResult!8125)

(assert (=> b!789932 (and (= lt!352561 lt!352555) (= lt!352559 lt!352560))))

(assert (=> b!789932 (= lt!352555 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!352552 lt!352553 mask!3328))))

(assert (=> b!789932 (= lt!352561 (seekEntryOrOpen!0 lt!352552 lt!352553 mask!3328))))

(declare-fun lt!352557 () (_ BitVec 64))

(assert (=> b!789932 (= lt!352557 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!352548 () Unit!27388)

(declare-fun e!439042 () Unit!27388)

(assert (=> b!789932 (= lt!352548 e!439042)))

(declare-fun c!87814 () Bool)

(assert (=> b!789932 (= c!87814 (= lt!352557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!789933 () Bool)

(assert (=> b!789933 (= e!439036 true)))

(assert (=> b!789933 (= lt!352555 lt!352560)))

(declare-fun lt!352554 () Unit!27388)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42877 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27388)

(assert (=> b!789933 (= lt!352554 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun b!789934 () Bool)

(assert (=> b!789934 (= e!439037 e!439045)))

(declare-fun res!535116 () Bool)

(assert (=> b!789934 (=> res!535116 e!439045)))

(assert (=> b!789934 (= res!535116 (= lt!352557 lt!352552))))

(assert (=> b!789934 (= lt!352557 (select (store (arr!20525 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!789935 () Bool)

(declare-fun Unit!27390 () Unit!27388)

(assert (=> b!789935 (= e!439042 Unit!27390)))

(assert (=> b!789935 false))

(declare-fun b!789936 () Bool)

(declare-fun Unit!27391 () Unit!27388)

(assert (=> b!789936 (= e!439042 Unit!27391)))

(declare-fun b!789937 () Bool)

(assert (=> b!789937 (= e!439035 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20525 a!3186) j!159) a!3186 mask!3328) (Found!8125 j!159)))))

(declare-fun b!789938 () Bool)

(declare-fun res!535114 () Bool)

(assert (=> b!789938 (=> (not res!535114) (not e!439046))))

(assert (=> b!789938 (= res!535114 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20525 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!789939 () Bool)

(declare-fun res!535129 () Bool)

(assert (=> b!789939 (=> (not res!535129) (not e!439043))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!789939 (= res!535129 (validKeyInArray!0 (select (arr!20525 a!3186) j!159)))))

(declare-fun b!789940 () Bool)

(declare-fun res!535125 () Bool)

(assert (=> b!789940 (=> (not res!535125) (not e!439043))))

(assert (=> b!789940 (= res!535125 (and (= (size!20946 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20946 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20946 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!789941 () Bool)

(declare-fun res!535115 () Bool)

(assert (=> b!789941 (=> (not res!535115) (not e!439043))))

(assert (=> b!789941 (= res!535115 (validKeyInArray!0 k!2102))))

(declare-fun b!789942 () Bool)

(assert (=> b!789942 (= e!439041 e!439046)))

(declare-fun res!535126 () Bool)

(assert (=> b!789942 (=> (not res!535126) (not e!439046))))

(assert (=> b!789942 (= res!535126 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20525 a!3186) j!159) mask!3328) (select (arr!20525 a!3186) j!159) a!3186 mask!3328) lt!352551))))

(assert (=> b!789942 (= lt!352551 (Intermediate!8125 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!67900 res!535124) b!789940))

(assert (= (and b!789940 res!535125) b!789939))

(assert (= (and b!789939 res!535129) b!789941))

(assert (= (and b!789941 res!535115) b!789929))

(assert (= (and b!789929 res!535122) b!789923))

(assert (= (and b!789923 res!535128) b!789927))

(assert (= (and b!789927 res!535121) b!789926))

(assert (= (and b!789926 res!535118) b!789928))

(assert (= (and b!789928 res!535119) b!789942))

(assert (= (and b!789942 res!535126) b!789938))

(assert (= (and b!789938 res!535114) b!789931))

(assert (= (and b!789931 c!87813) b!789924))

(assert (= (and b!789931 (not c!87813)) b!789937))

(assert (= (and b!789931 res!535113) b!789922))

(assert (= (and b!789922 res!535120) b!789925))

(assert (= (and b!789925 res!535117) b!789930))

(assert (= (and b!789925 (not res!535127)) b!789921))

(assert (= (and b!789921 (not res!535123)) b!789934))

(assert (= (and b!789934 (not res!535116)) b!789932))

(assert (= (and b!789932 c!87814) b!789935))

(assert (= (and b!789932 (not c!87814)) b!789936))

(assert (= (and b!789932 (not res!535130)) b!789933))

(declare-fun m!730917 () Bool)

(assert (=> b!789939 m!730917))

(assert (=> b!789939 m!730917))

(declare-fun m!730919 () Bool)

(assert (=> b!789939 m!730919))

(declare-fun m!730921 () Bool)

(assert (=> b!789929 m!730921))

(declare-fun m!730923 () Bool)

(assert (=> b!789922 m!730923))

(declare-fun m!730925 () Bool)

(assert (=> b!789922 m!730925))

(declare-fun m!730927 () Bool)

(assert (=> b!789922 m!730927))

(declare-fun m!730929 () Bool)

(assert (=> b!789922 m!730929))

(assert (=> b!789922 m!730923))

(declare-fun m!730931 () Bool)

(assert (=> b!789922 m!730931))

(assert (=> b!789925 m!730917))

(assert (=> b!789925 m!730917))

(declare-fun m!730933 () Bool)

(assert (=> b!789925 m!730933))

(declare-fun m!730935 () Bool)

(assert (=> b!789925 m!730935))

(declare-fun m!730937 () Bool)

(assert (=> b!789925 m!730937))

(declare-fun m!730939 () Bool)

(assert (=> b!789926 m!730939))

(assert (=> b!789942 m!730917))

(assert (=> b!789942 m!730917))

(declare-fun m!730941 () Bool)

(assert (=> b!789942 m!730941))

(assert (=> b!789942 m!730941))

(assert (=> b!789942 m!730917))

(declare-fun m!730943 () Bool)

(assert (=> b!789942 m!730943))

(declare-fun m!730945 () Bool)

(assert (=> b!789923 m!730945))

(declare-fun m!730947 () Bool)

(assert (=> b!789932 m!730947))

(declare-fun m!730949 () Bool)

(assert (=> b!789932 m!730949))

(declare-fun m!730951 () Bool)

(assert (=> b!789932 m!730951))

(assert (=> b!789937 m!730917))

(assert (=> b!789937 m!730917))

(declare-fun m!730953 () Bool)

(assert (=> b!789937 m!730953))

(declare-fun m!730955 () Bool)

(assert (=> b!789927 m!730955))

(assert (=> b!789924 m!730917))

(assert (=> b!789924 m!730917))

(declare-fun m!730957 () Bool)

(assert (=> b!789924 m!730957))

(assert (=> b!789934 m!730927))

(declare-fun m!730959 () Bool)

(assert (=> b!789934 m!730959))

(declare-fun m!730961 () Bool)

(assert (=> start!67900 m!730961))

(declare-fun m!730963 () Bool)

(assert (=> start!67900 m!730963))

(declare-fun m!730965 () Bool)

(assert (=> b!789941 m!730965))

(assert (=> b!789930 m!730917))

(assert (=> b!789930 m!730917))

(declare-fun m!730967 () Bool)

(assert (=> b!789930 m!730967))

(declare-fun m!730969 () Bool)

(assert (=> b!789938 m!730969))

(assert (=> b!789921 m!730917))

(assert (=> b!789921 m!730917))

(assert (=> b!789921 m!730953))

(declare-fun m!730971 () Bool)

(assert (=> b!789933 m!730971))

(push 1)

