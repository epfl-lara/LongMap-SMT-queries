; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67688 () Bool)

(assert start!67688)

(declare-fun b!784957 () Bool)

(declare-datatypes ((Unit!27104 0))(
  ( (Unit!27105) )
))
(declare-fun e!436381 () Unit!27104)

(declare-fun Unit!27106 () Unit!27104)

(assert (=> b!784957 (= e!436381 Unit!27106)))

(assert (=> b!784957 false))

(declare-fun res!531364 () Bool)

(declare-fun e!436389 () Bool)

(assert (=> start!67688 (=> (not res!531364) (not e!436389))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67688 (= res!531364 (validMask!0 mask!3328))))

(assert (=> start!67688 e!436389))

(assert (=> start!67688 true))

(declare-datatypes ((array!42747 0))(
  ( (array!42748 (arr!20462 (Array (_ BitVec 32) (_ BitVec 64))) (size!20883 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42747)

(declare-fun array_inv!16345 (array!42747) Bool)

(assert (=> start!67688 (array_inv!16345 a!3186)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!436387 () Bool)

(declare-fun b!784958 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8059 0))(
  ( (MissingZero!8059 (index!34604 (_ BitVec 32))) (Found!8059 (index!34605 (_ BitVec 32))) (Intermediate!8059 (undefined!8871 Bool) (index!34606 (_ BitVec 32)) (x!65562 (_ BitVec 32))) (Undefined!8059) (MissingVacant!8059 (index!34607 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42747 (_ BitVec 32)) SeekEntryResult!8059)

(assert (=> b!784958 (= e!436387 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20462 a!3186) j!159) a!3186 mask!3328) (Found!8059 j!159)))))

(declare-fun b!784959 () Bool)

(declare-fun e!436380 () Bool)

(assert (=> b!784959 (= e!436380 true)))

(declare-fun e!436385 () Bool)

(assert (=> b!784959 e!436385))

(declare-fun res!531372 () Bool)

(assert (=> b!784959 (=> (not res!531372) (not e!436385))))

(declare-fun lt!349853 () (_ BitVec 64))

(assert (=> b!784959 (= res!531372 (= lt!349853 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!349847 () Unit!27104)

(assert (=> b!784959 (= lt!349847 e!436381)))

(declare-fun c!87207 () Bool)

(assert (=> b!784959 (= c!87207 (= lt!349853 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!349848 () SeekEntryResult!8059)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!436388 () Bool)

(declare-fun b!784960 () Bool)

(assert (=> b!784960 (= e!436388 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20462 a!3186) j!159) a!3186 mask!3328) lt!349848))))

(declare-fun b!784961 () Bool)

(declare-fun e!436386 () Bool)

(assert (=> b!784961 (= e!436386 e!436380)))

(declare-fun res!531363 () Bool)

(assert (=> b!784961 (=> res!531363 e!436380)))

(declare-fun lt!349851 () (_ BitVec 64))

(assert (=> b!784961 (= res!531363 (= lt!349853 lt!349851))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!784961 (= lt!349853 (select (store (arr!20462 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!784962 () Bool)

(declare-fun res!531373 () Bool)

(assert (=> b!784962 (=> (not res!531373) (not e!436389))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!784962 (= res!531373 (validKeyInArray!0 (select (arr!20462 a!3186) j!159)))))

(declare-fun b!784963 () Bool)

(declare-fun res!531361 () Bool)

(declare-fun e!436390 () Bool)

(assert (=> b!784963 (=> (not res!531361) (not e!436390))))

(assert (=> b!784963 (= res!531361 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20462 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!784964 () Bool)

(declare-fun Unit!27107 () Unit!27104)

(assert (=> b!784964 (= e!436381 Unit!27107)))

(declare-fun b!784965 () Bool)

(declare-fun res!531368 () Bool)

(declare-fun e!436384 () Bool)

(assert (=> b!784965 (=> (not res!531368) (not e!436384))))

(declare-datatypes ((List!14503 0))(
  ( (Nil!14500) (Cons!14499 (h!15622 (_ BitVec 64)) (t!20809 List!14503)) )
))
(declare-fun arrayNoDuplicates!0 (array!42747 (_ BitVec 32) List!14503) Bool)

(assert (=> b!784965 (= res!531368 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14500))))

(declare-fun b!784966 () Bool)

(declare-fun res!531365 () Bool)

(assert (=> b!784966 (=> (not res!531365) (not e!436384))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42747 (_ BitVec 32)) Bool)

(assert (=> b!784966 (= res!531365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!784967 () Bool)

(assert (=> b!784967 (= e!436389 e!436384)))

(declare-fun res!531376 () Bool)

(assert (=> b!784967 (=> (not res!531376) (not e!436384))))

(declare-fun lt!349856 () SeekEntryResult!8059)

(assert (=> b!784967 (= res!531376 (or (= lt!349856 (MissingZero!8059 i!1173)) (= lt!349856 (MissingVacant!8059 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42747 (_ BitVec 32)) SeekEntryResult!8059)

(assert (=> b!784967 (= lt!349856 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun lt!349845 () SeekEntryResult!8059)

(declare-fun b!784968 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42747 (_ BitVec 32)) SeekEntryResult!8059)

(assert (=> b!784968 (= e!436387 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20462 a!3186) j!159) a!3186 mask!3328) lt!349845))))

(declare-fun b!784969 () Bool)

(declare-fun res!531367 () Bool)

(assert (=> b!784969 (=> (not res!531367) (not e!436384))))

(assert (=> b!784969 (= res!531367 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20883 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20883 a!3186))))))

(declare-fun b!784970 () Bool)

(declare-fun e!436379 () Bool)

(declare-fun e!436382 () Bool)

(assert (=> b!784970 (= e!436379 (not e!436382))))

(declare-fun res!531360 () Bool)

(assert (=> b!784970 (=> res!531360 e!436382)))

(declare-fun lt!349846 () SeekEntryResult!8059)

(get-info :version)

(assert (=> b!784970 (= res!531360 (or (not ((_ is Intermediate!8059) lt!349846)) (bvslt x!1131 (x!65562 lt!349846)) (not (= x!1131 (x!65562 lt!349846))) (not (= index!1321 (index!34606 lt!349846)))))))

(assert (=> b!784970 e!436388))

(declare-fun res!531369 () Bool)

(assert (=> b!784970 (=> (not res!531369) (not e!436388))))

(declare-fun lt!349855 () SeekEntryResult!8059)

(assert (=> b!784970 (= res!531369 (= lt!349855 lt!349848))))

(assert (=> b!784970 (= lt!349848 (Found!8059 j!159))))

(assert (=> b!784970 (= lt!349855 (seekEntryOrOpen!0 (select (arr!20462 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!784970 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!349849 () Unit!27104)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42747 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27104)

(assert (=> b!784970 (= lt!349849 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!784971 () Bool)

(declare-fun res!531366 () Bool)

(assert (=> b!784971 (=> (not res!531366) (not e!436389))))

(assert (=> b!784971 (= res!531366 (validKeyInArray!0 k0!2102))))

(declare-fun b!784972 () Bool)

(declare-fun res!531375 () Bool)

(assert (=> b!784972 (=> (not res!531375) (not e!436385))))

(declare-fun lt!349852 () array!42747)

(assert (=> b!784972 (= res!531375 (= (seekEntryOrOpen!0 lt!349851 lt!349852 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349851 lt!349852 mask!3328)))))

(declare-fun b!784973 () Bool)

(declare-fun res!531362 () Bool)

(assert (=> b!784973 (=> (not res!531362) (not e!436389))))

(assert (=> b!784973 (= res!531362 (and (= (size!20883 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20883 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20883 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!784974 () Bool)

(assert (=> b!784974 (= e!436390 e!436379)))

(declare-fun res!531377 () Bool)

(assert (=> b!784974 (=> (not res!531377) (not e!436379))))

(declare-fun lt!349850 () SeekEntryResult!8059)

(assert (=> b!784974 (= res!531377 (= lt!349850 lt!349846))))

(assert (=> b!784974 (= lt!349846 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349851 lt!349852 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!784974 (= lt!349850 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349851 mask!3328) lt!349851 lt!349852 mask!3328))))

(assert (=> b!784974 (= lt!349851 (select (store (arr!20462 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!784974 (= lt!349852 (array!42748 (store (arr!20462 a!3186) i!1173 k0!2102) (size!20883 a!3186)))))

(declare-fun b!784975 () Bool)

(declare-fun res!531374 () Bool)

(assert (=> b!784975 (=> (not res!531374) (not e!436389))))

(declare-fun arrayContainsKey!0 (array!42747 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!784975 (= res!531374 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!784976 () Bool)

(assert (=> b!784976 (= e!436382 e!436386)))

(declare-fun res!531378 () Bool)

(assert (=> b!784976 (=> res!531378 e!436386)))

(declare-fun lt!349854 () SeekEntryResult!8059)

(assert (=> b!784976 (= res!531378 (not (= lt!349854 lt!349848)))))

(assert (=> b!784976 (= lt!349854 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20462 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!784977 () Bool)

(assert (=> b!784977 (= e!436385 (= lt!349855 lt!349854))))

(declare-fun b!784978 () Bool)

(declare-fun res!531371 () Bool)

(assert (=> b!784978 (=> (not res!531371) (not e!436390))))

(assert (=> b!784978 (= res!531371 e!436387)))

(declare-fun c!87206 () Bool)

(assert (=> b!784978 (= c!87206 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!784979 () Bool)

(assert (=> b!784979 (= e!436384 e!436390)))

(declare-fun res!531370 () Bool)

(assert (=> b!784979 (=> (not res!531370) (not e!436390))))

(assert (=> b!784979 (= res!531370 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20462 a!3186) j!159) mask!3328) (select (arr!20462 a!3186) j!159) a!3186 mask!3328) lt!349845))))

(assert (=> b!784979 (= lt!349845 (Intermediate!8059 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!67688 res!531364) b!784973))

(assert (= (and b!784973 res!531362) b!784962))

(assert (= (and b!784962 res!531373) b!784971))

(assert (= (and b!784971 res!531366) b!784975))

(assert (= (and b!784975 res!531374) b!784967))

(assert (= (and b!784967 res!531376) b!784966))

(assert (= (and b!784966 res!531365) b!784965))

(assert (= (and b!784965 res!531368) b!784969))

(assert (= (and b!784969 res!531367) b!784979))

(assert (= (and b!784979 res!531370) b!784963))

(assert (= (and b!784963 res!531361) b!784978))

(assert (= (and b!784978 c!87206) b!784968))

(assert (= (and b!784978 (not c!87206)) b!784958))

(assert (= (and b!784978 res!531371) b!784974))

(assert (= (and b!784974 res!531377) b!784970))

(assert (= (and b!784970 res!531369) b!784960))

(assert (= (and b!784970 (not res!531360)) b!784976))

(assert (= (and b!784976 (not res!531378)) b!784961))

(assert (= (and b!784961 (not res!531363)) b!784959))

(assert (= (and b!784959 c!87207) b!784957))

(assert (= (and b!784959 (not c!87207)) b!784964))

(assert (= (and b!784959 res!531372) b!784972))

(assert (= (and b!784972 res!531375) b!784977))

(declare-fun m!726579 () Bool)

(assert (=> b!784970 m!726579))

(assert (=> b!784970 m!726579))

(declare-fun m!726581 () Bool)

(assert (=> b!784970 m!726581))

(declare-fun m!726583 () Bool)

(assert (=> b!784970 m!726583))

(declare-fun m!726585 () Bool)

(assert (=> b!784970 m!726585))

(assert (=> b!784962 m!726579))

(assert (=> b!784962 m!726579))

(declare-fun m!726587 () Bool)

(assert (=> b!784962 m!726587))

(assert (=> b!784960 m!726579))

(assert (=> b!784960 m!726579))

(declare-fun m!726589 () Bool)

(assert (=> b!784960 m!726589))

(assert (=> b!784976 m!726579))

(assert (=> b!784976 m!726579))

(declare-fun m!726591 () Bool)

(assert (=> b!784976 m!726591))

(declare-fun m!726593 () Bool)

(assert (=> b!784966 m!726593))

(assert (=> b!784958 m!726579))

(assert (=> b!784958 m!726579))

(assert (=> b!784958 m!726591))

(declare-fun m!726595 () Bool)

(assert (=> b!784975 m!726595))

(assert (=> b!784979 m!726579))

(assert (=> b!784979 m!726579))

(declare-fun m!726597 () Bool)

(assert (=> b!784979 m!726597))

(assert (=> b!784979 m!726597))

(assert (=> b!784979 m!726579))

(declare-fun m!726599 () Bool)

(assert (=> b!784979 m!726599))

(declare-fun m!726601 () Bool)

(assert (=> b!784971 m!726601))

(declare-fun m!726603 () Bool)

(assert (=> b!784963 m!726603))

(declare-fun m!726605 () Bool)

(assert (=> b!784972 m!726605))

(declare-fun m!726607 () Bool)

(assert (=> b!784972 m!726607))

(declare-fun m!726609 () Bool)

(assert (=> b!784961 m!726609))

(declare-fun m!726611 () Bool)

(assert (=> b!784961 m!726611))

(assert (=> b!784968 m!726579))

(assert (=> b!784968 m!726579))

(declare-fun m!726613 () Bool)

(assert (=> b!784968 m!726613))

(declare-fun m!726615 () Bool)

(assert (=> b!784974 m!726615))

(assert (=> b!784974 m!726615))

(declare-fun m!726617 () Bool)

(assert (=> b!784974 m!726617))

(declare-fun m!726619 () Bool)

(assert (=> b!784974 m!726619))

(assert (=> b!784974 m!726609))

(declare-fun m!726621 () Bool)

(assert (=> b!784974 m!726621))

(declare-fun m!726623 () Bool)

(assert (=> b!784967 m!726623))

(declare-fun m!726625 () Bool)

(assert (=> b!784965 m!726625))

(declare-fun m!726627 () Bool)

(assert (=> start!67688 m!726627))

(declare-fun m!726629 () Bool)

(assert (=> start!67688 m!726629))

(check-sat (not b!784958) (not b!784960) (not b!784965) (not b!784971) (not start!67688) (not b!784972) (not b!784970) (not b!784968) (not b!784975) (not b!784976) (not b!784966) (not b!784974) (not b!784962) (not b!784979) (not b!784967))
(check-sat)
