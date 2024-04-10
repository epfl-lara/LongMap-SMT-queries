; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66754 () Bool)

(assert start!66754)

(declare-fun b!769016 () Bool)

(declare-fun res!520017 () Bool)

(declare-fun e!428240 () Bool)

(assert (=> b!769016 (=> (not res!520017) (not e!428240))))

(declare-fun e!428242 () Bool)

(assert (=> b!769016 (= res!520017 e!428242)))

(declare-fun c!84897 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!769016 (= c!84897 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!769017 () Bool)

(declare-fun res!520015 () Bool)

(assert (=> b!769017 (=> (not res!520015) (not e!428240))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42316 0))(
  ( (array!42317 (arr!20258 (Array (_ BitVec 32) (_ BitVec 64))) (size!20679 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42316)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!769017 (= res!520015 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20258 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!769018 () Bool)

(declare-fun res!520021 () Bool)

(declare-fun e!428241 () Bool)

(assert (=> b!769018 (=> (not res!520021) (not e!428241))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!769018 (= res!520021 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20679 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20679 a!3186))))))

(declare-fun b!769019 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!428248 () Bool)

(declare-datatypes ((SeekEntryResult!7858 0))(
  ( (MissingZero!7858 (index!33800 (_ BitVec 32))) (Found!7858 (index!33801 (_ BitVec 32))) (Intermediate!7858 (undefined!8670 Bool) (index!33802 (_ BitVec 32)) (x!64733 (_ BitVec 32))) (Undefined!7858) (MissingVacant!7858 (index!33803 (_ BitVec 32))) )
))
(declare-fun lt!342122 () SeekEntryResult!7858)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42316 (_ BitVec 32)) SeekEntryResult!7858)

(assert (=> b!769019 (= e!428248 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20258 a!3186) j!159) a!3186 mask!3328) lt!342122))))

(declare-fun b!769020 () Bool)

(declare-fun res!520025 () Bool)

(declare-fun e!428244 () Bool)

(assert (=> b!769020 (=> (not res!520025) (not e!428244))))

(assert (=> b!769020 (= res!520025 (and (= (size!20679 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20679 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20679 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!769021 () Bool)

(declare-datatypes ((Unit!26446 0))(
  ( (Unit!26447) )
))
(declare-fun e!428247 () Unit!26446)

(declare-fun Unit!26448 () Unit!26446)

(assert (=> b!769021 (= e!428247 Unit!26448)))

(declare-fun lt!342116 () SeekEntryResult!7858)

(declare-fun lt!342115 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42316 (_ BitVec 32)) SeekEntryResult!7858)

(assert (=> b!769021 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342115 (select (arr!20258 a!3186) j!159) a!3186 mask!3328) lt!342116)))

(declare-fun b!769022 () Bool)

(declare-fun e!428246 () Bool)

(assert (=> b!769022 (= e!428246 e!428248)))

(declare-fun res!520028 () Bool)

(assert (=> b!769022 (=> (not res!520028) (not e!428248))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42316 (_ BitVec 32)) SeekEntryResult!7858)

(assert (=> b!769022 (= res!520028 (= (seekEntryOrOpen!0 (select (arr!20258 a!3186) j!159) a!3186 mask!3328) lt!342122))))

(assert (=> b!769022 (= lt!342122 (Found!7858 j!159))))

(declare-fun b!769023 () Bool)

(assert (=> b!769023 (= e!428242 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20258 a!3186) j!159) a!3186 mask!3328) (Found!7858 j!159)))))

(declare-fun b!769024 () Bool)

(declare-fun res!520027 () Bool)

(assert (=> b!769024 (=> (not res!520027) (not e!428244))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42316 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!769024 (= res!520027 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!520023 () Bool)

(assert (=> start!66754 (=> (not res!520023) (not e!428244))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66754 (= res!520023 (validMask!0 mask!3328))))

(assert (=> start!66754 e!428244))

(assert (=> start!66754 true))

(declare-fun array_inv!16054 (array!42316) Bool)

(assert (=> start!66754 (array_inv!16054 a!3186)))

(declare-fun b!769025 () Bool)

(assert (=> b!769025 (= e!428242 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20258 a!3186) j!159) a!3186 mask!3328) lt!342116))))

(declare-fun b!769026 () Bool)

(declare-fun res!520020 () Bool)

(assert (=> b!769026 (=> (not res!520020) (not e!428241))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42316 (_ BitVec 32)) Bool)

(assert (=> b!769026 (= res!520020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!769027 () Bool)

(declare-fun e!428243 () Bool)

(assert (=> b!769027 (= e!428240 e!428243)))

(declare-fun res!520024 () Bool)

(assert (=> b!769027 (=> (not res!520024) (not e!428243))))

(declare-fun lt!342113 () SeekEntryResult!7858)

(declare-fun lt!342112 () SeekEntryResult!7858)

(assert (=> b!769027 (= res!520024 (= lt!342113 lt!342112))))

(declare-fun lt!342118 () array!42316)

(declare-fun lt!342117 () (_ BitVec 64))

(assert (=> b!769027 (= lt!342112 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342117 lt!342118 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769027 (= lt!342113 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342117 mask!3328) lt!342117 lt!342118 mask!3328))))

(assert (=> b!769027 (= lt!342117 (select (store (arr!20258 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!769027 (= lt!342118 (array!42317 (store (arr!20258 a!3186) i!1173 k!2102) (size!20679 a!3186)))))

(declare-fun b!769028 () Bool)

(declare-fun res!520013 () Bool)

(assert (=> b!769028 (=> (not res!520013) (not e!428244))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!769028 (= res!520013 (validKeyInArray!0 k!2102))))

(declare-fun b!769029 () Bool)

(declare-fun res!520022 () Bool)

(assert (=> b!769029 (=> (not res!520022) (not e!428241))))

(declare-datatypes ((List!14260 0))(
  ( (Nil!14257) (Cons!14256 (h!15355 (_ BitVec 64)) (t!20575 List!14260)) )
))
(declare-fun arrayNoDuplicates!0 (array!42316 (_ BitVec 32) List!14260) Bool)

(assert (=> b!769029 (= res!520022 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14257))))

(declare-fun b!769030 () Bool)

(declare-fun e!428245 () Bool)

(assert (=> b!769030 (= e!428243 (not e!428245))))

(declare-fun res!520016 () Bool)

(assert (=> b!769030 (=> res!520016 e!428245)))

(assert (=> b!769030 (= res!520016 (or (not (is-Intermediate!7858 lt!342112)) (bvsge x!1131 (x!64733 lt!342112))))))

(assert (=> b!769030 e!428246))

(declare-fun res!520019 () Bool)

(assert (=> b!769030 (=> (not res!520019) (not e!428246))))

(assert (=> b!769030 (= res!520019 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!342120 () Unit!26446)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42316 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26446)

(assert (=> b!769030 (= lt!342120 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!769031 () Bool)

(declare-fun res!520014 () Bool)

(assert (=> b!769031 (=> (not res!520014) (not e!428244))))

(assert (=> b!769031 (= res!520014 (validKeyInArray!0 (select (arr!20258 a!3186) j!159)))))

(declare-fun b!769032 () Bool)

(assert (=> b!769032 (= e!428244 e!428241)))

(declare-fun res!520018 () Bool)

(assert (=> b!769032 (=> (not res!520018) (not e!428241))))

(declare-fun lt!342119 () SeekEntryResult!7858)

(assert (=> b!769032 (= res!520018 (or (= lt!342119 (MissingZero!7858 i!1173)) (= lt!342119 (MissingVacant!7858 i!1173))))))

(assert (=> b!769032 (= lt!342119 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!769033 () Bool)

(assert (=> b!769033 (= e!428245 true)))

(declare-fun lt!342114 () Unit!26446)

(assert (=> b!769033 (= lt!342114 e!428247)))

(declare-fun c!84898 () Bool)

(assert (=> b!769033 (= c!84898 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769033 (= lt!342115 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!769034 () Bool)

(declare-fun Unit!26449 () Unit!26446)

(assert (=> b!769034 (= e!428247 Unit!26449)))

(declare-fun lt!342121 () SeekEntryResult!7858)

(assert (=> b!769034 (= lt!342121 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20258 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!769034 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342115 resIntermediateIndex!5 (select (arr!20258 a!3186) j!159) a!3186 mask!3328) (Found!7858 j!159))))

(declare-fun b!769035 () Bool)

(assert (=> b!769035 (= e!428241 e!428240)))

(declare-fun res!520026 () Bool)

(assert (=> b!769035 (=> (not res!520026) (not e!428240))))

(assert (=> b!769035 (= res!520026 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20258 a!3186) j!159) mask!3328) (select (arr!20258 a!3186) j!159) a!3186 mask!3328) lt!342116))))

(assert (=> b!769035 (= lt!342116 (Intermediate!7858 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!66754 res!520023) b!769020))

(assert (= (and b!769020 res!520025) b!769031))

(assert (= (and b!769031 res!520014) b!769028))

(assert (= (and b!769028 res!520013) b!769024))

(assert (= (and b!769024 res!520027) b!769032))

(assert (= (and b!769032 res!520018) b!769026))

(assert (= (and b!769026 res!520020) b!769029))

(assert (= (and b!769029 res!520022) b!769018))

(assert (= (and b!769018 res!520021) b!769035))

(assert (= (and b!769035 res!520026) b!769017))

(assert (= (and b!769017 res!520015) b!769016))

(assert (= (and b!769016 c!84897) b!769025))

(assert (= (and b!769016 (not c!84897)) b!769023))

(assert (= (and b!769016 res!520017) b!769027))

(assert (= (and b!769027 res!520024) b!769030))

(assert (= (and b!769030 res!520019) b!769022))

(assert (= (and b!769022 res!520028) b!769019))

(assert (= (and b!769030 (not res!520016)) b!769033))

(assert (= (and b!769033 c!84898) b!769021))

(assert (= (and b!769033 (not c!84898)) b!769034))

(declare-fun m!714487 () Bool)

(assert (=> b!769025 m!714487))

(assert (=> b!769025 m!714487))

(declare-fun m!714489 () Bool)

(assert (=> b!769025 m!714489))

(declare-fun m!714491 () Bool)

(assert (=> b!769033 m!714491))

(declare-fun m!714493 () Bool)

(assert (=> b!769028 m!714493))

(declare-fun m!714495 () Bool)

(assert (=> b!769027 m!714495))

(declare-fun m!714497 () Bool)

(assert (=> b!769027 m!714497))

(declare-fun m!714499 () Bool)

(assert (=> b!769027 m!714499))

(assert (=> b!769027 m!714495))

(declare-fun m!714501 () Bool)

(assert (=> b!769027 m!714501))

(declare-fun m!714503 () Bool)

(assert (=> b!769027 m!714503))

(assert (=> b!769021 m!714487))

(assert (=> b!769021 m!714487))

(declare-fun m!714505 () Bool)

(assert (=> b!769021 m!714505))

(declare-fun m!714507 () Bool)

(assert (=> b!769032 m!714507))

(declare-fun m!714509 () Bool)

(assert (=> b!769029 m!714509))

(declare-fun m!714511 () Bool)

(assert (=> b!769026 m!714511))

(assert (=> b!769023 m!714487))

(assert (=> b!769023 m!714487))

(declare-fun m!714513 () Bool)

(assert (=> b!769023 m!714513))

(declare-fun m!714515 () Bool)

(assert (=> start!66754 m!714515))

(declare-fun m!714517 () Bool)

(assert (=> start!66754 m!714517))

(assert (=> b!769034 m!714487))

(assert (=> b!769034 m!714487))

(assert (=> b!769034 m!714513))

(assert (=> b!769034 m!714487))

(declare-fun m!714519 () Bool)

(assert (=> b!769034 m!714519))

(declare-fun m!714521 () Bool)

(assert (=> b!769017 m!714521))

(assert (=> b!769031 m!714487))

(assert (=> b!769031 m!714487))

(declare-fun m!714523 () Bool)

(assert (=> b!769031 m!714523))

(declare-fun m!714525 () Bool)

(assert (=> b!769030 m!714525))

(declare-fun m!714527 () Bool)

(assert (=> b!769030 m!714527))

(assert (=> b!769035 m!714487))

(assert (=> b!769035 m!714487))

(declare-fun m!714529 () Bool)

(assert (=> b!769035 m!714529))

(assert (=> b!769035 m!714529))

(assert (=> b!769035 m!714487))

(declare-fun m!714531 () Bool)

(assert (=> b!769035 m!714531))

(assert (=> b!769019 m!714487))

(assert (=> b!769019 m!714487))

(declare-fun m!714533 () Bool)

(assert (=> b!769019 m!714533))

(declare-fun m!714535 () Bool)

(assert (=> b!769024 m!714535))

(assert (=> b!769022 m!714487))

(assert (=> b!769022 m!714487))

(declare-fun m!714537 () Bool)

(assert (=> b!769022 m!714537))

(push 1)

