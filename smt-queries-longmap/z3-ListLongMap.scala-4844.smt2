; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66740 () Bool)

(assert start!66740)

(declare-fun b!769006 () Bool)

(declare-fun e!428214 () Bool)

(declare-fun e!428212 () Bool)

(assert (=> b!769006 (= e!428214 e!428212)))

(declare-fun res!520108 () Bool)

(assert (=> b!769006 (=> (not res!520108) (not e!428212))))

(declare-datatypes ((SeekEntryResult!7858 0))(
  ( (MissingZero!7858 (index!33800 (_ BitVec 32))) (Found!7858 (index!33801 (_ BitVec 32))) (Intermediate!7858 (undefined!8670 Bool) (index!33802 (_ BitVec 32)) (x!64744 (_ BitVec 32))) (Undefined!7858) (MissingVacant!7858 (index!33803 (_ BitVec 32))) )
))
(declare-fun lt!342014 () SeekEntryResult!7858)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!769006 (= res!520108 (or (= lt!342014 (MissingZero!7858 i!1173)) (= lt!342014 (MissingVacant!7858 i!1173))))))

(declare-datatypes ((array!42321 0))(
  ( (array!42322 (arr!20261 (Array (_ BitVec 32) (_ BitVec 64))) (size!20682 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42321)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42321 (_ BitVec 32)) SeekEntryResult!7858)

(assert (=> b!769006 (= lt!342014 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!769007 () Bool)

(declare-fun res!520100 () Bool)

(declare-fun e!428206 () Bool)

(assert (=> b!769007 (=> (not res!520100) (not e!428206))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!769007 (= res!520100 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20261 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!769008 () Bool)

(declare-fun res!520099 () Bool)

(assert (=> b!769008 (=> (not res!520099) (not e!428206))))

(declare-fun e!428208 () Bool)

(assert (=> b!769008 (= res!520099 e!428208)))

(declare-fun c!84852 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!769008 (= c!84852 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!769009 () Bool)

(declare-fun res!520097 () Bool)

(assert (=> b!769009 (=> (not res!520097) (not e!428212))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42321 (_ BitVec 32)) Bool)

(assert (=> b!769009 (= res!520097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!342012 () SeekEntryResult!7858)

(declare-fun b!769010 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42321 (_ BitVec 32)) SeekEntryResult!7858)

(assert (=> b!769010 (= e!428208 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20261 a!3186) j!159) a!3186 mask!3328) lt!342012))))

(declare-fun b!769011 () Bool)

(assert (=> b!769011 (= e!428212 e!428206)))

(declare-fun res!520103 () Bool)

(assert (=> b!769011 (=> (not res!520103) (not e!428206))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769011 (= res!520103 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20261 a!3186) j!159) mask!3328) (select (arr!20261 a!3186) j!159) a!3186 mask!3328) lt!342012))))

(assert (=> b!769011 (= lt!342012 (Intermediate!7858 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!769012 () Bool)

(declare-fun e!428215 () Bool)

(assert (=> b!769012 (= e!428206 e!428215)))

(declare-fun res!520105 () Bool)

(assert (=> b!769012 (=> (not res!520105) (not e!428215))))

(declare-fun lt!342008 () SeekEntryResult!7858)

(declare-fun lt!342013 () SeekEntryResult!7858)

(assert (=> b!769012 (= res!520105 (= lt!342008 lt!342013))))

(declare-fun lt!342009 () array!42321)

(declare-fun lt!342004 () (_ BitVec 64))

(assert (=> b!769012 (= lt!342013 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342004 lt!342009 mask!3328))))

(assert (=> b!769012 (= lt!342008 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342004 mask!3328) lt!342004 lt!342009 mask!3328))))

(assert (=> b!769012 (= lt!342004 (select (store (arr!20261 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!769012 (= lt!342009 (array!42322 (store (arr!20261 a!3186) i!1173 k0!2102) (size!20682 a!3186)))))

(declare-fun b!769013 () Bool)

(declare-fun res!520107 () Bool)

(assert (=> b!769013 (=> (not res!520107) (not e!428214))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!769013 (= res!520107 (validKeyInArray!0 (select (arr!20261 a!3186) j!159)))))

(declare-fun b!769014 () Bool)

(declare-fun res!520095 () Bool)

(assert (=> b!769014 (=> (not res!520095) (not e!428212))))

(declare-datatypes ((List!14302 0))(
  ( (Nil!14299) (Cons!14298 (h!15397 (_ BitVec 64)) (t!20608 List!14302)) )
))
(declare-fun arrayNoDuplicates!0 (array!42321 (_ BitVec 32) List!14302) Bool)

(assert (=> b!769014 (= res!520095 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14299))))

(declare-fun b!769015 () Bool)

(declare-fun e!428209 () Bool)

(assert (=> b!769015 (= e!428215 (not e!428209))))

(declare-fun res!520110 () Bool)

(assert (=> b!769015 (=> res!520110 e!428209)))

(get-info :version)

(assert (=> b!769015 (= res!520110 (or (not ((_ is Intermediate!7858) lt!342013)) (bvsge x!1131 (x!64744 lt!342013))))))

(declare-fun e!428210 () Bool)

(assert (=> b!769015 e!428210))

(declare-fun res!520102 () Bool)

(assert (=> b!769015 (=> (not res!520102) (not e!428210))))

(assert (=> b!769015 (= res!520102 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26426 0))(
  ( (Unit!26427) )
))
(declare-fun lt!342006 () Unit!26426)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42321 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26426)

(assert (=> b!769015 (= lt!342006 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!769016 () Bool)

(declare-fun res!520096 () Bool)

(assert (=> b!769016 (=> (not res!520096) (not e!428214))))

(assert (=> b!769016 (= res!520096 (and (= (size!20682 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20682 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20682 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!769017 () Bool)

(declare-fun res!520104 () Bool)

(assert (=> b!769017 (=> (not res!520104) (not e!428212))))

(assert (=> b!769017 (= res!520104 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20682 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20682 a!3186))))))

(declare-fun b!769018 () Bool)

(declare-fun res!520106 () Bool)

(assert (=> b!769018 (=> (not res!520106) (not e!428214))))

(assert (=> b!769018 (= res!520106 (validKeyInArray!0 k0!2102))))

(declare-fun b!769019 () Bool)

(declare-fun res!520109 () Bool)

(assert (=> b!769019 (=> (not res!520109) (not e!428214))))

(declare-fun arrayContainsKey!0 (array!42321 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!769019 (= res!520109 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!520101 () Bool)

(assert (=> start!66740 (=> (not res!520101) (not e!428214))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66740 (= res!520101 (validMask!0 mask!3328))))

(assert (=> start!66740 e!428214))

(assert (=> start!66740 true))

(declare-fun array_inv!16144 (array!42321) Bool)

(assert (=> start!66740 (array_inv!16144 a!3186)))

(declare-fun b!769020 () Bool)

(declare-fun e!428211 () Unit!26426)

(declare-fun Unit!26428 () Unit!26426)

(assert (=> b!769020 (= e!428211 Unit!26428)))

(declare-fun lt!342007 () (_ BitVec 32))

(assert (=> b!769020 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342007 (select (arr!20261 a!3186) j!159) a!3186 mask!3328) lt!342012)))

(declare-fun b!769021 () Bool)

(assert (=> b!769021 (= e!428209 true)))

(declare-fun lt!342005 () Unit!26426)

(assert (=> b!769021 (= lt!342005 e!428211)))

(declare-fun c!84851 () Bool)

(assert (=> b!769021 (= c!84851 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769021 (= lt!342007 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!769022 () Bool)

(declare-fun Unit!26429 () Unit!26426)

(assert (=> b!769022 (= e!428211 Unit!26429)))

(declare-fun lt!342011 () SeekEntryResult!7858)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42321 (_ BitVec 32)) SeekEntryResult!7858)

(assert (=> b!769022 (= lt!342011 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20261 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!769022 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342007 resIntermediateIndex!5 (select (arr!20261 a!3186) j!159) a!3186 mask!3328) (Found!7858 j!159))))

(declare-fun b!769023 () Bool)

(declare-fun e!428207 () Bool)

(assert (=> b!769023 (= e!428210 e!428207)))

(declare-fun res!520098 () Bool)

(assert (=> b!769023 (=> (not res!520098) (not e!428207))))

(declare-fun lt!342010 () SeekEntryResult!7858)

(assert (=> b!769023 (= res!520098 (= (seekEntryOrOpen!0 (select (arr!20261 a!3186) j!159) a!3186 mask!3328) lt!342010))))

(assert (=> b!769023 (= lt!342010 (Found!7858 j!159))))

(declare-fun b!769024 () Bool)

(assert (=> b!769024 (= e!428208 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20261 a!3186) j!159) a!3186 mask!3328) (Found!7858 j!159)))))

(declare-fun b!769025 () Bool)

(assert (=> b!769025 (= e!428207 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20261 a!3186) j!159) a!3186 mask!3328) lt!342010))))

(assert (= (and start!66740 res!520101) b!769016))

(assert (= (and b!769016 res!520096) b!769013))

(assert (= (and b!769013 res!520107) b!769018))

(assert (= (and b!769018 res!520106) b!769019))

(assert (= (and b!769019 res!520109) b!769006))

(assert (= (and b!769006 res!520108) b!769009))

(assert (= (and b!769009 res!520097) b!769014))

(assert (= (and b!769014 res!520095) b!769017))

(assert (= (and b!769017 res!520104) b!769011))

(assert (= (and b!769011 res!520103) b!769007))

(assert (= (and b!769007 res!520100) b!769008))

(assert (= (and b!769008 c!84852) b!769010))

(assert (= (and b!769008 (not c!84852)) b!769024))

(assert (= (and b!769008 res!520099) b!769012))

(assert (= (and b!769012 res!520105) b!769015))

(assert (= (and b!769015 res!520102) b!769023))

(assert (= (and b!769023 res!520098) b!769025))

(assert (= (and b!769015 (not res!520110)) b!769021))

(assert (= (and b!769021 c!84851) b!769020))

(assert (= (and b!769021 (not c!84851)) b!769022))

(declare-fun m!713937 () Bool)

(assert (=> b!769022 m!713937))

(assert (=> b!769022 m!713937))

(declare-fun m!713939 () Bool)

(assert (=> b!769022 m!713939))

(assert (=> b!769022 m!713937))

(declare-fun m!713941 () Bool)

(assert (=> b!769022 m!713941))

(declare-fun m!713943 () Bool)

(assert (=> b!769014 m!713943))

(assert (=> b!769023 m!713937))

(assert (=> b!769023 m!713937))

(declare-fun m!713945 () Bool)

(assert (=> b!769023 m!713945))

(assert (=> b!769025 m!713937))

(assert (=> b!769025 m!713937))

(declare-fun m!713947 () Bool)

(assert (=> b!769025 m!713947))

(declare-fun m!713949 () Bool)

(assert (=> start!66740 m!713949))

(declare-fun m!713951 () Bool)

(assert (=> start!66740 m!713951))

(declare-fun m!713953 () Bool)

(assert (=> b!769006 m!713953))

(assert (=> b!769010 m!713937))

(assert (=> b!769010 m!713937))

(declare-fun m!713955 () Bool)

(assert (=> b!769010 m!713955))

(declare-fun m!713957 () Bool)

(assert (=> b!769019 m!713957))

(declare-fun m!713959 () Bool)

(assert (=> b!769012 m!713959))

(assert (=> b!769012 m!713959))

(declare-fun m!713961 () Bool)

(assert (=> b!769012 m!713961))

(declare-fun m!713963 () Bool)

(assert (=> b!769012 m!713963))

(declare-fun m!713965 () Bool)

(assert (=> b!769012 m!713965))

(declare-fun m!713967 () Bool)

(assert (=> b!769012 m!713967))

(declare-fun m!713969 () Bool)

(assert (=> b!769021 m!713969))

(assert (=> b!769013 m!713937))

(assert (=> b!769013 m!713937))

(declare-fun m!713971 () Bool)

(assert (=> b!769013 m!713971))

(assert (=> b!769024 m!713937))

(assert (=> b!769024 m!713937))

(assert (=> b!769024 m!713939))

(declare-fun m!713973 () Bool)

(assert (=> b!769007 m!713973))

(assert (=> b!769020 m!713937))

(assert (=> b!769020 m!713937))

(declare-fun m!713975 () Bool)

(assert (=> b!769020 m!713975))

(declare-fun m!713977 () Bool)

(assert (=> b!769018 m!713977))

(assert (=> b!769011 m!713937))

(assert (=> b!769011 m!713937))

(declare-fun m!713979 () Bool)

(assert (=> b!769011 m!713979))

(assert (=> b!769011 m!713979))

(assert (=> b!769011 m!713937))

(declare-fun m!713981 () Bool)

(assert (=> b!769011 m!713981))

(declare-fun m!713983 () Bool)

(assert (=> b!769009 m!713983))

(declare-fun m!713985 () Bool)

(assert (=> b!769015 m!713985))

(declare-fun m!713987 () Bool)

(assert (=> b!769015 m!713987))

(check-sat (not b!769014) (not b!769021) (not b!769009) (not b!769015) (not b!769025) (not b!769024) (not b!769013) (not b!769012) (not b!769020) (not start!66740) (not b!769018) (not b!769023) (not b!769010) (not b!769011) (not b!769006) (not b!769019) (not b!769022))
(check-sat)
