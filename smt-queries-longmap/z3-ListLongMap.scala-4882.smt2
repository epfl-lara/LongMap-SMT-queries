; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67250 () Bool)

(assert start!67250)

(declare-fun res!526341 () Bool)

(declare-fun e!432740 () Bool)

(assert (=> start!67250 (=> (not res!526341) (not e!432740))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67250 (= res!526341 (validMask!0 mask!3328))))

(assert (=> start!67250 e!432740))

(assert (=> start!67250 true))

(declare-datatypes ((array!42561 0))(
  ( (array!42562 (arr!20375 (Array (_ BitVec 32) (_ BitVec 64))) (size!20796 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42561)

(declare-fun array_inv!16258 (array!42561) Bool)

(assert (=> start!67250 (array_inv!16258 a!3186)))

(declare-fun b!777829 () Bool)

(declare-fun res!526353 () Bool)

(declare-fun e!432741 () Bool)

(assert (=> b!777829 (=> (not res!526353) (not e!432741))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!777829 (= res!526353 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20375 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!777830 () Bool)

(declare-fun e!432745 () Bool)

(assert (=> b!777830 (= e!432745 e!432741)))

(declare-fun res!526339 () Bool)

(assert (=> b!777830 (=> (not res!526339) (not e!432741))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7972 0))(
  ( (MissingZero!7972 (index!34256 (_ BitVec 32))) (Found!7972 (index!34257 (_ BitVec 32))) (Intermediate!7972 (undefined!8784 Bool) (index!34258 (_ BitVec 32)) (x!65207 (_ BitVec 32))) (Undefined!7972) (MissingVacant!7972 (index!34259 (_ BitVec 32))) )
))
(declare-fun lt!346421 () SeekEntryResult!7972)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42561 (_ BitVec 32)) SeekEntryResult!7972)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!777830 (= res!526339 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20375 a!3186) j!159) mask!3328) (select (arr!20375 a!3186) j!159) a!3186 mask!3328) lt!346421))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!777830 (= lt!346421 (Intermediate!7972 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!777831 () Bool)

(assert (=> b!777831 (= e!432740 e!432745)))

(declare-fun res!526347 () Bool)

(assert (=> b!777831 (=> (not res!526347) (not e!432745))))

(declare-fun lt!346412 () SeekEntryResult!7972)

(assert (=> b!777831 (= res!526347 (or (= lt!346412 (MissingZero!7972 i!1173)) (= lt!346412 (MissingVacant!7972 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42561 (_ BitVec 32)) SeekEntryResult!7972)

(assert (=> b!777831 (= lt!346412 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!777832 () Bool)

(declare-fun res!526349 () Bool)

(assert (=> b!777832 (=> (not res!526349) (not e!432745))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42561 (_ BitVec 32)) Bool)

(assert (=> b!777832 (= res!526349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!777833 () Bool)

(declare-fun e!432744 () Bool)

(declare-fun e!432737 () Bool)

(assert (=> b!777833 (= e!432744 (not e!432737))))

(declare-fun res!526351 () Bool)

(assert (=> b!777833 (=> res!526351 e!432737)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!346416 () SeekEntryResult!7972)

(declare-fun index!1321 () (_ BitVec 32))

(get-info :version)

(assert (=> b!777833 (= res!526351 (or (not ((_ is Intermediate!7972) lt!346416)) (bvslt x!1131 (x!65207 lt!346416)) (not (= x!1131 (x!65207 lt!346416))) (not (= index!1321 (index!34258 lt!346416)))))))

(declare-fun lt!346418 () SeekEntryResult!7972)

(assert (=> b!777833 (= lt!346418 (Found!7972 j!159))))

(declare-fun e!432742 () Bool)

(assert (=> b!777833 e!432742))

(declare-fun res!526344 () Bool)

(assert (=> b!777833 (=> (not res!526344) (not e!432742))))

(assert (=> b!777833 (= res!526344 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26810 0))(
  ( (Unit!26811) )
))
(declare-fun lt!346413 () Unit!26810)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42561 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26810)

(assert (=> b!777833 (= lt!346413 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!777834 () Bool)

(declare-fun res!526337 () Bool)

(assert (=> b!777834 (=> (not res!526337) (not e!432745))))

(assert (=> b!777834 (= res!526337 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20796 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20796 a!3186))))))

(declare-fun b!777835 () Bool)

(declare-fun e!432739 () Bool)

(assert (=> b!777835 (= e!432742 e!432739)))

(declare-fun res!526343 () Bool)

(assert (=> b!777835 (=> (not res!526343) (not e!432739))))

(declare-fun lt!346419 () SeekEntryResult!7972)

(assert (=> b!777835 (= res!526343 (= (seekEntryOrOpen!0 (select (arr!20375 a!3186) j!159) a!3186 mask!3328) lt!346419))))

(assert (=> b!777835 (= lt!346419 (Found!7972 j!159))))

(declare-fun e!432743 () Bool)

(declare-fun b!777836 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42561 (_ BitVec 32)) SeekEntryResult!7972)

(assert (=> b!777836 (= e!432743 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20375 a!3186) j!159) a!3186 mask!3328) (Found!7972 j!159)))))

(declare-fun b!777837 () Bool)

(declare-fun res!526352 () Bool)

(assert (=> b!777837 (=> (not res!526352) (not e!432740))))

(declare-fun arrayContainsKey!0 (array!42561 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!777837 (= res!526352 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!777838 () Bool)

(declare-fun res!526336 () Bool)

(assert (=> b!777838 (=> (not res!526336) (not e!432741))))

(assert (=> b!777838 (= res!526336 e!432743)))

(declare-fun c!86148 () Bool)

(assert (=> b!777838 (= c!86148 (bvsle x!1131 resIntermediateX!5))))

(declare-fun lt!346414 () SeekEntryResult!7972)

(declare-fun b!777839 () Bool)

(assert (=> b!777839 (= e!432737 (or (not (= lt!346414 (Found!7972 index!1321))) (= lt!346414 lt!346418)))))

(declare-fun lt!346415 () (_ BitVec 64))

(declare-fun lt!346420 () array!42561)

(assert (=> b!777839 (= lt!346414 (seekEntryOrOpen!0 lt!346415 lt!346420 mask!3328))))

(declare-fun b!777840 () Bool)

(declare-fun res!526350 () Bool)

(assert (=> b!777840 (=> (not res!526350) (not e!432740))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!777840 (= res!526350 (validKeyInArray!0 (select (arr!20375 a!3186) j!159)))))

(declare-fun b!777841 () Bool)

(declare-fun res!526340 () Bool)

(assert (=> b!777841 (=> res!526340 e!432737)))

(assert (=> b!777841 (= res!526340 (or (not (= (select (store (arr!20375 a!3186) i!1173 k0!2102) index!1321) lt!346415)) (undefined!8784 lt!346416)))))

(declare-fun b!777842 () Bool)

(assert (=> b!777842 (= e!432741 e!432744)))

(declare-fun res!526342 () Bool)

(assert (=> b!777842 (=> (not res!526342) (not e!432744))))

(declare-fun lt!346417 () SeekEntryResult!7972)

(assert (=> b!777842 (= res!526342 (= lt!346417 lt!346416))))

(assert (=> b!777842 (= lt!346416 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346415 lt!346420 mask!3328))))

(assert (=> b!777842 (= lt!346417 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346415 mask!3328) lt!346415 lt!346420 mask!3328))))

(assert (=> b!777842 (= lt!346415 (select (store (arr!20375 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!777842 (= lt!346420 (array!42562 (store (arr!20375 a!3186) i!1173 k0!2102) (size!20796 a!3186)))))

(declare-fun b!777843 () Bool)

(declare-fun res!526346 () Bool)

(assert (=> b!777843 (=> (not res!526346) (not e!432740))))

(assert (=> b!777843 (= res!526346 (and (= (size!20796 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20796 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20796 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!777844 () Bool)

(declare-fun res!526348 () Bool)

(assert (=> b!777844 (=> (not res!526348) (not e!432745))))

(declare-datatypes ((List!14416 0))(
  ( (Nil!14413) (Cons!14412 (h!15523 (_ BitVec 64)) (t!20722 List!14416)) )
))
(declare-fun arrayNoDuplicates!0 (array!42561 (_ BitVec 32) List!14416) Bool)

(assert (=> b!777844 (= res!526348 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14413))))

(declare-fun b!777845 () Bool)

(assert (=> b!777845 (= e!432743 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20375 a!3186) j!159) a!3186 mask!3328) lt!346421))))

(declare-fun b!777846 () Bool)

(declare-fun res!526338 () Bool)

(assert (=> b!777846 (=> (not res!526338) (not e!432740))))

(assert (=> b!777846 (= res!526338 (validKeyInArray!0 k0!2102))))

(declare-fun b!777847 () Bool)

(assert (=> b!777847 (= e!432739 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20375 a!3186) j!159) a!3186 mask!3328) lt!346419))))

(declare-fun b!777848 () Bool)

(declare-fun res!526345 () Bool)

(assert (=> b!777848 (=> res!526345 e!432737)))

(assert (=> b!777848 (= res!526345 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20375 a!3186) j!159) a!3186 mask!3328) lt!346418)))))

(assert (= (and start!67250 res!526341) b!777843))

(assert (= (and b!777843 res!526346) b!777840))

(assert (= (and b!777840 res!526350) b!777846))

(assert (= (and b!777846 res!526338) b!777837))

(assert (= (and b!777837 res!526352) b!777831))

(assert (= (and b!777831 res!526347) b!777832))

(assert (= (and b!777832 res!526349) b!777844))

(assert (= (and b!777844 res!526348) b!777834))

(assert (= (and b!777834 res!526337) b!777830))

(assert (= (and b!777830 res!526339) b!777829))

(assert (= (and b!777829 res!526353) b!777838))

(assert (= (and b!777838 c!86148) b!777845))

(assert (= (and b!777838 (not c!86148)) b!777836))

(assert (= (and b!777838 res!526336) b!777842))

(assert (= (and b!777842 res!526342) b!777833))

(assert (= (and b!777833 res!526344) b!777835))

(assert (= (and b!777835 res!526343) b!777847))

(assert (= (and b!777833 (not res!526351)) b!777848))

(assert (= (and b!777848 (not res!526345)) b!777841))

(assert (= (and b!777841 (not res!526340)) b!777839))

(declare-fun m!721083 () Bool)

(assert (=> b!777836 m!721083))

(assert (=> b!777836 m!721083))

(declare-fun m!721085 () Bool)

(assert (=> b!777836 m!721085))

(assert (=> b!777840 m!721083))

(assert (=> b!777840 m!721083))

(declare-fun m!721087 () Bool)

(assert (=> b!777840 m!721087))

(declare-fun m!721089 () Bool)

(assert (=> b!777829 m!721089))

(assert (=> b!777830 m!721083))

(assert (=> b!777830 m!721083))

(declare-fun m!721091 () Bool)

(assert (=> b!777830 m!721091))

(assert (=> b!777830 m!721091))

(assert (=> b!777830 m!721083))

(declare-fun m!721093 () Bool)

(assert (=> b!777830 m!721093))

(assert (=> b!777835 m!721083))

(assert (=> b!777835 m!721083))

(declare-fun m!721095 () Bool)

(assert (=> b!777835 m!721095))

(assert (=> b!777845 m!721083))

(assert (=> b!777845 m!721083))

(declare-fun m!721097 () Bool)

(assert (=> b!777845 m!721097))

(assert (=> b!777848 m!721083))

(assert (=> b!777848 m!721083))

(assert (=> b!777848 m!721085))

(declare-fun m!721099 () Bool)

(assert (=> b!777839 m!721099))

(declare-fun m!721101 () Bool)

(assert (=> b!777841 m!721101))

(declare-fun m!721103 () Bool)

(assert (=> b!777841 m!721103))

(declare-fun m!721105 () Bool)

(assert (=> start!67250 m!721105))

(declare-fun m!721107 () Bool)

(assert (=> start!67250 m!721107))

(declare-fun m!721109 () Bool)

(assert (=> b!777837 m!721109))

(declare-fun m!721111 () Bool)

(assert (=> b!777846 m!721111))

(assert (=> b!777847 m!721083))

(assert (=> b!777847 m!721083))

(declare-fun m!721113 () Bool)

(assert (=> b!777847 m!721113))

(declare-fun m!721115 () Bool)

(assert (=> b!777832 m!721115))

(declare-fun m!721117 () Bool)

(assert (=> b!777844 m!721117))

(declare-fun m!721119 () Bool)

(assert (=> b!777842 m!721119))

(assert (=> b!777842 m!721101))

(declare-fun m!721121 () Bool)

(assert (=> b!777842 m!721121))

(declare-fun m!721123 () Bool)

(assert (=> b!777842 m!721123))

(assert (=> b!777842 m!721119))

(declare-fun m!721125 () Bool)

(assert (=> b!777842 m!721125))

(declare-fun m!721127 () Bool)

(assert (=> b!777833 m!721127))

(declare-fun m!721129 () Bool)

(assert (=> b!777833 m!721129))

(declare-fun m!721131 () Bool)

(assert (=> b!777831 m!721131))

(check-sat (not b!777840) (not b!777830) (not b!777836) (not b!777846) (not b!777837) (not b!777848) (not b!777847) (not b!777833) (not start!67250) (not b!777832) (not b!777839) (not b!777842) (not b!777831) (not b!777845) (not b!777844) (not b!777835))
(check-sat)
(get-model)

(declare-fun b!777981 () Bool)

(declare-fun e!432806 () SeekEntryResult!7972)

(declare-fun e!432807 () SeekEntryResult!7972)

(assert (=> b!777981 (= e!432806 e!432807)))

(declare-fun lt!346486 () (_ BitVec 64))

(declare-fun c!86163 () Bool)

(assert (=> b!777981 (= c!86163 (= lt!346486 (select (arr!20375 a!3186) j!159)))))

(declare-fun b!777982 () Bool)

(assert (=> b!777982 (= e!432807 (Found!7972 resIntermediateIndex!5))))

(declare-fun b!777983 () Bool)

(assert (=> b!777983 (= e!432806 Undefined!7972)))

(declare-fun b!777984 () Bool)

(declare-fun e!432808 () SeekEntryResult!7972)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!777984 (= e!432808 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20375 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!102071 () Bool)

(declare-fun lt!346487 () SeekEntryResult!7972)

(assert (=> d!102071 (and (or ((_ is Undefined!7972) lt!346487) (not ((_ is Found!7972) lt!346487)) (and (bvsge (index!34257 lt!346487) #b00000000000000000000000000000000) (bvslt (index!34257 lt!346487) (size!20796 a!3186)))) (or ((_ is Undefined!7972) lt!346487) ((_ is Found!7972) lt!346487) (not ((_ is MissingVacant!7972) lt!346487)) (not (= (index!34259 lt!346487) resIntermediateIndex!5)) (and (bvsge (index!34259 lt!346487) #b00000000000000000000000000000000) (bvslt (index!34259 lt!346487) (size!20796 a!3186)))) (or ((_ is Undefined!7972) lt!346487) (ite ((_ is Found!7972) lt!346487) (= (select (arr!20375 a!3186) (index!34257 lt!346487)) (select (arr!20375 a!3186) j!159)) (and ((_ is MissingVacant!7972) lt!346487) (= (index!34259 lt!346487) resIntermediateIndex!5) (= (select (arr!20375 a!3186) (index!34259 lt!346487)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102071 (= lt!346487 e!432806)))

(declare-fun c!86162 () Bool)

(assert (=> d!102071 (= c!86162 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!102071 (= lt!346486 (select (arr!20375 a!3186) resIntermediateIndex!5))))

(assert (=> d!102071 (validMask!0 mask!3328)))

(assert (=> d!102071 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20375 a!3186) j!159) a!3186 mask!3328) lt!346487)))

(declare-fun b!777985 () Bool)

(declare-fun c!86161 () Bool)

(assert (=> b!777985 (= c!86161 (= lt!346486 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!777985 (= e!432807 e!432808)))

(declare-fun b!777986 () Bool)

(assert (=> b!777986 (= e!432808 (MissingVacant!7972 resIntermediateIndex!5))))

(assert (= (and d!102071 c!86162) b!777983))

(assert (= (and d!102071 (not c!86162)) b!777981))

(assert (= (and b!777981 c!86163) b!777982))

(assert (= (and b!777981 (not c!86163)) b!777985))

(assert (= (and b!777985 c!86161) b!777986))

(assert (= (and b!777985 (not c!86161)) b!777984))

(declare-fun m!721233 () Bool)

(assert (=> b!777984 m!721233))

(assert (=> b!777984 m!721233))

(assert (=> b!777984 m!721083))

(declare-fun m!721235 () Bool)

(assert (=> b!777984 m!721235))

(declare-fun m!721237 () Bool)

(assert (=> d!102071 m!721237))

(declare-fun m!721239 () Bool)

(assert (=> d!102071 m!721239))

(assert (=> d!102071 m!721089))

(assert (=> d!102071 m!721105))

(assert (=> b!777847 d!102071))

(declare-fun b!777987 () Bool)

(declare-fun e!432809 () SeekEntryResult!7972)

(declare-fun e!432810 () SeekEntryResult!7972)

(assert (=> b!777987 (= e!432809 e!432810)))

(declare-fun c!86166 () Bool)

(declare-fun lt!346488 () (_ BitVec 64))

(assert (=> b!777987 (= c!86166 (= lt!346488 (select (arr!20375 a!3186) j!159)))))

(declare-fun b!777988 () Bool)

(assert (=> b!777988 (= e!432810 (Found!7972 index!1321))))

(declare-fun b!777989 () Bool)

(assert (=> b!777989 (= e!432809 Undefined!7972)))

(declare-fun b!777990 () Bool)

(declare-fun e!432811 () SeekEntryResult!7972)

(assert (=> b!777990 (= e!432811 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20375 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!102073 () Bool)

(declare-fun lt!346489 () SeekEntryResult!7972)

(assert (=> d!102073 (and (or ((_ is Undefined!7972) lt!346489) (not ((_ is Found!7972) lt!346489)) (and (bvsge (index!34257 lt!346489) #b00000000000000000000000000000000) (bvslt (index!34257 lt!346489) (size!20796 a!3186)))) (or ((_ is Undefined!7972) lt!346489) ((_ is Found!7972) lt!346489) (not ((_ is MissingVacant!7972) lt!346489)) (not (= (index!34259 lt!346489) resIntermediateIndex!5)) (and (bvsge (index!34259 lt!346489) #b00000000000000000000000000000000) (bvslt (index!34259 lt!346489) (size!20796 a!3186)))) (or ((_ is Undefined!7972) lt!346489) (ite ((_ is Found!7972) lt!346489) (= (select (arr!20375 a!3186) (index!34257 lt!346489)) (select (arr!20375 a!3186) j!159)) (and ((_ is MissingVacant!7972) lt!346489) (= (index!34259 lt!346489) resIntermediateIndex!5) (= (select (arr!20375 a!3186) (index!34259 lt!346489)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102073 (= lt!346489 e!432809)))

(declare-fun c!86165 () Bool)

(assert (=> d!102073 (= c!86165 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102073 (= lt!346488 (select (arr!20375 a!3186) index!1321))))

(assert (=> d!102073 (validMask!0 mask!3328)))

(assert (=> d!102073 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20375 a!3186) j!159) a!3186 mask!3328) lt!346489)))

(declare-fun b!777991 () Bool)

(declare-fun c!86164 () Bool)

(assert (=> b!777991 (= c!86164 (= lt!346488 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!777991 (= e!432810 e!432811)))

(declare-fun b!777992 () Bool)

(assert (=> b!777992 (= e!432811 (MissingVacant!7972 resIntermediateIndex!5))))

(assert (= (and d!102073 c!86165) b!777989))

(assert (= (and d!102073 (not c!86165)) b!777987))

(assert (= (and b!777987 c!86166) b!777988))

(assert (= (and b!777987 (not c!86166)) b!777991))

(assert (= (and b!777991 c!86164) b!777992))

(assert (= (and b!777991 (not c!86164)) b!777990))

(declare-fun m!721241 () Bool)

(assert (=> b!777990 m!721241))

(assert (=> b!777990 m!721241))

(assert (=> b!777990 m!721083))

(declare-fun m!721243 () Bool)

(assert (=> b!777990 m!721243))

(declare-fun m!721245 () Bool)

(assert (=> d!102073 m!721245))

(declare-fun m!721247 () Bool)

(assert (=> d!102073 m!721247))

(declare-fun m!721249 () Bool)

(assert (=> d!102073 m!721249))

(assert (=> d!102073 m!721105))

(assert (=> b!777836 d!102073))

(declare-fun d!102075 () Bool)

(assert (=> d!102075 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!777846 d!102075))

(declare-fun b!778005 () Bool)

(declare-fun e!432818 () SeekEntryResult!7972)

(declare-fun lt!346498 () SeekEntryResult!7972)

(assert (=> b!778005 (= e!432818 (MissingZero!7972 (index!34258 lt!346498)))))

(declare-fun b!778006 () Bool)

(declare-fun e!432819 () SeekEntryResult!7972)

(assert (=> b!778006 (= e!432819 Undefined!7972)))

(declare-fun b!778007 () Bool)

(declare-fun e!432820 () SeekEntryResult!7972)

(assert (=> b!778007 (= e!432820 (Found!7972 (index!34258 lt!346498)))))

(declare-fun b!778008 () Bool)

(assert (=> b!778008 (= e!432819 e!432820)))

(declare-fun lt!346497 () (_ BitVec 64))

(assert (=> b!778008 (= lt!346497 (select (arr!20375 a!3186) (index!34258 lt!346498)))))

(declare-fun c!86174 () Bool)

(assert (=> b!778008 (= c!86174 (= lt!346497 (select (arr!20375 a!3186) j!159)))))

(declare-fun b!778009 () Bool)

(declare-fun c!86173 () Bool)

(assert (=> b!778009 (= c!86173 (= lt!346497 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!778009 (= e!432820 e!432818)))

(declare-fun b!778010 () Bool)

(assert (=> b!778010 (= e!432818 (seekKeyOrZeroReturnVacant!0 (x!65207 lt!346498) (index!34258 lt!346498) (index!34258 lt!346498) (select (arr!20375 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!102077 () Bool)

(declare-fun lt!346496 () SeekEntryResult!7972)

(assert (=> d!102077 (and (or ((_ is Undefined!7972) lt!346496) (not ((_ is Found!7972) lt!346496)) (and (bvsge (index!34257 lt!346496) #b00000000000000000000000000000000) (bvslt (index!34257 lt!346496) (size!20796 a!3186)))) (or ((_ is Undefined!7972) lt!346496) ((_ is Found!7972) lt!346496) (not ((_ is MissingZero!7972) lt!346496)) (and (bvsge (index!34256 lt!346496) #b00000000000000000000000000000000) (bvslt (index!34256 lt!346496) (size!20796 a!3186)))) (or ((_ is Undefined!7972) lt!346496) ((_ is Found!7972) lt!346496) ((_ is MissingZero!7972) lt!346496) (not ((_ is MissingVacant!7972) lt!346496)) (and (bvsge (index!34259 lt!346496) #b00000000000000000000000000000000) (bvslt (index!34259 lt!346496) (size!20796 a!3186)))) (or ((_ is Undefined!7972) lt!346496) (ite ((_ is Found!7972) lt!346496) (= (select (arr!20375 a!3186) (index!34257 lt!346496)) (select (arr!20375 a!3186) j!159)) (ite ((_ is MissingZero!7972) lt!346496) (= (select (arr!20375 a!3186) (index!34256 lt!346496)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7972) lt!346496) (= (select (arr!20375 a!3186) (index!34259 lt!346496)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102077 (= lt!346496 e!432819)))

(declare-fun c!86175 () Bool)

(assert (=> d!102077 (= c!86175 (and ((_ is Intermediate!7972) lt!346498) (undefined!8784 lt!346498)))))

(assert (=> d!102077 (= lt!346498 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20375 a!3186) j!159) mask!3328) (select (arr!20375 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!102077 (validMask!0 mask!3328)))

(assert (=> d!102077 (= (seekEntryOrOpen!0 (select (arr!20375 a!3186) j!159) a!3186 mask!3328) lt!346496)))

(assert (= (and d!102077 c!86175) b!778006))

(assert (= (and d!102077 (not c!86175)) b!778008))

(assert (= (and b!778008 c!86174) b!778007))

(assert (= (and b!778008 (not c!86174)) b!778009))

(assert (= (and b!778009 c!86173) b!778005))

(assert (= (and b!778009 (not c!86173)) b!778010))

(declare-fun m!721251 () Bool)

(assert (=> b!778008 m!721251))

(assert (=> b!778010 m!721083))

(declare-fun m!721253 () Bool)

(assert (=> b!778010 m!721253))

(assert (=> d!102077 m!721083))

(assert (=> d!102077 m!721091))

(assert (=> d!102077 m!721091))

(assert (=> d!102077 m!721083))

(assert (=> d!102077 m!721093))

(assert (=> d!102077 m!721105))

(declare-fun m!721255 () Bool)

(assert (=> d!102077 m!721255))

(declare-fun m!721257 () Bool)

(assert (=> d!102077 m!721257))

(declare-fun m!721259 () Bool)

(assert (=> d!102077 m!721259))

(assert (=> b!777835 d!102077))

(declare-fun b!778068 () Bool)

(declare-fun e!432855 () Bool)

(declare-fun lt!346519 () SeekEntryResult!7972)

(assert (=> b!778068 (= e!432855 (bvsge (x!65207 lt!346519) #b01111111111111111111111111111110))))

(declare-fun b!778069 () Bool)

(assert (=> b!778069 (and (bvsge (index!34258 lt!346519) #b00000000000000000000000000000000) (bvslt (index!34258 lt!346519) (size!20796 a!3186)))))

(declare-fun res!526483 () Bool)

(assert (=> b!778069 (= res!526483 (= (select (arr!20375 a!3186) (index!34258 lt!346519)) (select (arr!20375 a!3186) j!159)))))

(declare-fun e!432859 () Bool)

(assert (=> b!778069 (=> res!526483 e!432859)))

(declare-fun e!432858 () Bool)

(assert (=> b!778069 (= e!432858 e!432859)))

(declare-fun b!778070 () Bool)

(assert (=> b!778070 (and (bvsge (index!34258 lt!346519) #b00000000000000000000000000000000) (bvslt (index!34258 lt!346519) (size!20796 a!3186)))))

(assert (=> b!778070 (= e!432859 (= (select (arr!20375 a!3186) (index!34258 lt!346519)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!102081 () Bool)

(assert (=> d!102081 e!432855))

(declare-fun c!86195 () Bool)

(assert (=> d!102081 (= c!86195 (and ((_ is Intermediate!7972) lt!346519) (undefined!8784 lt!346519)))))

(declare-fun e!432857 () SeekEntryResult!7972)

(assert (=> d!102081 (= lt!346519 e!432857)))

(declare-fun c!86194 () Bool)

(assert (=> d!102081 (= c!86194 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!346518 () (_ BitVec 64))

(assert (=> d!102081 (= lt!346518 (select (arr!20375 a!3186) index!1321))))

(assert (=> d!102081 (validMask!0 mask!3328)))

(assert (=> d!102081 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20375 a!3186) j!159) a!3186 mask!3328) lt!346519)))

(declare-fun b!778071 () Bool)

(declare-fun e!432856 () SeekEntryResult!7972)

(assert (=> b!778071 (= e!432856 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20375 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!778072 () Bool)

(assert (=> b!778072 (= e!432855 e!432858)))

(declare-fun res!526485 () Bool)

(assert (=> b!778072 (= res!526485 (and ((_ is Intermediate!7972) lt!346519) (not (undefined!8784 lt!346519)) (bvslt (x!65207 lt!346519) #b01111111111111111111111111111110) (bvsge (x!65207 lt!346519) #b00000000000000000000000000000000) (bvsge (x!65207 lt!346519) x!1131)))))

(assert (=> b!778072 (=> (not res!526485) (not e!432858))))

(declare-fun b!778073 () Bool)

(assert (=> b!778073 (= e!432857 (Intermediate!7972 true index!1321 x!1131))))

(declare-fun b!778074 () Bool)

(assert (=> b!778074 (= e!432857 e!432856)))

(declare-fun c!86196 () Bool)

(assert (=> b!778074 (= c!86196 (or (= lt!346518 (select (arr!20375 a!3186) j!159)) (= (bvadd lt!346518 lt!346518) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!778075 () Bool)

(assert (=> b!778075 (= e!432856 (Intermediate!7972 false index!1321 x!1131))))

(declare-fun b!778076 () Bool)

(assert (=> b!778076 (and (bvsge (index!34258 lt!346519) #b00000000000000000000000000000000) (bvslt (index!34258 lt!346519) (size!20796 a!3186)))))

(declare-fun res!526484 () Bool)

(assert (=> b!778076 (= res!526484 (= (select (arr!20375 a!3186) (index!34258 lt!346519)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!778076 (=> res!526484 e!432859)))

(assert (= (and d!102081 c!86194) b!778073))

(assert (= (and d!102081 (not c!86194)) b!778074))

(assert (= (and b!778074 c!86196) b!778075))

(assert (= (and b!778074 (not c!86196)) b!778071))

(assert (= (and d!102081 c!86195) b!778068))

(assert (= (and d!102081 (not c!86195)) b!778072))

(assert (= (and b!778072 res!526485) b!778069))

(assert (= (and b!778069 (not res!526483)) b!778076))

(assert (= (and b!778076 (not res!526484)) b!778070))

(assert (=> d!102081 m!721249))

(assert (=> d!102081 m!721105))

(declare-fun m!721281 () Bool)

(assert (=> b!778070 m!721281))

(assert (=> b!778076 m!721281))

(assert (=> b!778071 m!721241))

(assert (=> b!778071 m!721241))

(assert (=> b!778071 m!721083))

(declare-fun m!721283 () Bool)

(assert (=> b!778071 m!721283))

(assert (=> b!778069 m!721281))

(assert (=> b!777845 d!102081))

(declare-fun b!778077 () Bool)

(declare-fun e!432860 () SeekEntryResult!7972)

(declare-fun lt!346522 () SeekEntryResult!7972)

(assert (=> b!778077 (= e!432860 (MissingZero!7972 (index!34258 lt!346522)))))

(declare-fun b!778078 () Bool)

(declare-fun e!432861 () SeekEntryResult!7972)

(assert (=> b!778078 (= e!432861 Undefined!7972)))

(declare-fun b!778079 () Bool)

(declare-fun e!432862 () SeekEntryResult!7972)

(assert (=> b!778079 (= e!432862 (Found!7972 (index!34258 lt!346522)))))

(declare-fun b!778080 () Bool)

(assert (=> b!778080 (= e!432861 e!432862)))

(declare-fun lt!346521 () (_ BitVec 64))

(assert (=> b!778080 (= lt!346521 (select (arr!20375 lt!346420) (index!34258 lt!346522)))))

(declare-fun c!86198 () Bool)

(assert (=> b!778080 (= c!86198 (= lt!346521 lt!346415))))

(declare-fun b!778081 () Bool)

(declare-fun c!86197 () Bool)

(assert (=> b!778081 (= c!86197 (= lt!346521 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!778081 (= e!432862 e!432860)))

(declare-fun b!778082 () Bool)

(assert (=> b!778082 (= e!432860 (seekKeyOrZeroReturnVacant!0 (x!65207 lt!346522) (index!34258 lt!346522) (index!34258 lt!346522) lt!346415 lt!346420 mask!3328))))

(declare-fun d!102089 () Bool)

(declare-fun lt!346520 () SeekEntryResult!7972)

(assert (=> d!102089 (and (or ((_ is Undefined!7972) lt!346520) (not ((_ is Found!7972) lt!346520)) (and (bvsge (index!34257 lt!346520) #b00000000000000000000000000000000) (bvslt (index!34257 lt!346520) (size!20796 lt!346420)))) (or ((_ is Undefined!7972) lt!346520) ((_ is Found!7972) lt!346520) (not ((_ is MissingZero!7972) lt!346520)) (and (bvsge (index!34256 lt!346520) #b00000000000000000000000000000000) (bvslt (index!34256 lt!346520) (size!20796 lt!346420)))) (or ((_ is Undefined!7972) lt!346520) ((_ is Found!7972) lt!346520) ((_ is MissingZero!7972) lt!346520) (not ((_ is MissingVacant!7972) lt!346520)) (and (bvsge (index!34259 lt!346520) #b00000000000000000000000000000000) (bvslt (index!34259 lt!346520) (size!20796 lt!346420)))) (or ((_ is Undefined!7972) lt!346520) (ite ((_ is Found!7972) lt!346520) (= (select (arr!20375 lt!346420) (index!34257 lt!346520)) lt!346415) (ite ((_ is MissingZero!7972) lt!346520) (= (select (arr!20375 lt!346420) (index!34256 lt!346520)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7972) lt!346520) (= (select (arr!20375 lt!346420) (index!34259 lt!346520)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102089 (= lt!346520 e!432861)))

(declare-fun c!86199 () Bool)

(assert (=> d!102089 (= c!86199 (and ((_ is Intermediate!7972) lt!346522) (undefined!8784 lt!346522)))))

(assert (=> d!102089 (= lt!346522 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346415 mask!3328) lt!346415 lt!346420 mask!3328))))

(assert (=> d!102089 (validMask!0 mask!3328)))

(assert (=> d!102089 (= (seekEntryOrOpen!0 lt!346415 lt!346420 mask!3328) lt!346520)))

(assert (= (and d!102089 c!86199) b!778078))

(assert (= (and d!102089 (not c!86199)) b!778080))

(assert (= (and b!778080 c!86198) b!778079))

(assert (= (and b!778080 (not c!86198)) b!778081))

(assert (= (and b!778081 c!86197) b!778077))

(assert (= (and b!778081 (not c!86197)) b!778082))

(declare-fun m!721285 () Bool)

(assert (=> b!778080 m!721285))

(declare-fun m!721287 () Bool)

(assert (=> b!778082 m!721287))

(assert (=> d!102089 m!721119))

(assert (=> d!102089 m!721119))

(assert (=> d!102089 m!721125))

(assert (=> d!102089 m!721105))

(declare-fun m!721289 () Bool)

(assert (=> d!102089 m!721289))

(declare-fun m!721291 () Bool)

(assert (=> d!102089 m!721291))

(declare-fun m!721293 () Bool)

(assert (=> d!102089 m!721293))

(assert (=> b!777839 d!102089))

(assert (=> b!777848 d!102073))

(declare-fun d!102093 () Bool)

(declare-fun res!526490 () Bool)

(declare-fun e!432867 () Bool)

(assert (=> d!102093 (=> res!526490 e!432867)))

(assert (=> d!102093 (= res!526490 (= (select (arr!20375 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!102093 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!432867)))

(declare-fun b!778087 () Bool)

(declare-fun e!432868 () Bool)

(assert (=> b!778087 (= e!432867 e!432868)))

(declare-fun res!526491 () Bool)

(assert (=> b!778087 (=> (not res!526491) (not e!432868))))

(assert (=> b!778087 (= res!526491 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20796 a!3186)))))

(declare-fun b!778088 () Bool)

(assert (=> b!778088 (= e!432868 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!102093 (not res!526490)) b!778087))

(assert (= (and b!778087 res!526491) b!778088))

(declare-fun m!721295 () Bool)

(assert (=> d!102093 m!721295))

(declare-fun m!721297 () Bool)

(assert (=> b!778088 m!721297))

(assert (=> b!777837 d!102093))

(declare-fun b!778089 () Bool)

(declare-fun e!432869 () Bool)

(declare-fun lt!346524 () SeekEntryResult!7972)

(assert (=> b!778089 (= e!432869 (bvsge (x!65207 lt!346524) #b01111111111111111111111111111110))))

(declare-fun b!778090 () Bool)

(assert (=> b!778090 (and (bvsge (index!34258 lt!346524) #b00000000000000000000000000000000) (bvslt (index!34258 lt!346524) (size!20796 lt!346420)))))

(declare-fun res!526492 () Bool)

(assert (=> b!778090 (= res!526492 (= (select (arr!20375 lt!346420) (index!34258 lt!346524)) lt!346415))))

(declare-fun e!432873 () Bool)

(assert (=> b!778090 (=> res!526492 e!432873)))

(declare-fun e!432872 () Bool)

(assert (=> b!778090 (= e!432872 e!432873)))

(declare-fun b!778091 () Bool)

(assert (=> b!778091 (and (bvsge (index!34258 lt!346524) #b00000000000000000000000000000000) (bvslt (index!34258 lt!346524) (size!20796 lt!346420)))))

(assert (=> b!778091 (= e!432873 (= (select (arr!20375 lt!346420) (index!34258 lt!346524)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!102095 () Bool)

(assert (=> d!102095 e!432869))

(declare-fun c!86201 () Bool)

(assert (=> d!102095 (= c!86201 (and ((_ is Intermediate!7972) lt!346524) (undefined!8784 lt!346524)))))

(declare-fun e!432871 () SeekEntryResult!7972)

(assert (=> d!102095 (= lt!346524 e!432871)))

(declare-fun c!86200 () Bool)

(assert (=> d!102095 (= c!86200 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!346523 () (_ BitVec 64))

(assert (=> d!102095 (= lt!346523 (select (arr!20375 lt!346420) index!1321))))

(assert (=> d!102095 (validMask!0 mask!3328)))

(assert (=> d!102095 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346415 lt!346420 mask!3328) lt!346524)))

(declare-fun b!778092 () Bool)

(declare-fun e!432870 () SeekEntryResult!7972)

(assert (=> b!778092 (= e!432870 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!346415 lt!346420 mask!3328))))

(declare-fun b!778093 () Bool)

(assert (=> b!778093 (= e!432869 e!432872)))

(declare-fun res!526494 () Bool)

(assert (=> b!778093 (= res!526494 (and ((_ is Intermediate!7972) lt!346524) (not (undefined!8784 lt!346524)) (bvslt (x!65207 lt!346524) #b01111111111111111111111111111110) (bvsge (x!65207 lt!346524) #b00000000000000000000000000000000) (bvsge (x!65207 lt!346524) x!1131)))))

(assert (=> b!778093 (=> (not res!526494) (not e!432872))))

(declare-fun b!778094 () Bool)

(assert (=> b!778094 (= e!432871 (Intermediate!7972 true index!1321 x!1131))))

(declare-fun b!778095 () Bool)

(assert (=> b!778095 (= e!432871 e!432870)))

(declare-fun c!86202 () Bool)

(assert (=> b!778095 (= c!86202 (or (= lt!346523 lt!346415) (= (bvadd lt!346523 lt!346523) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!778096 () Bool)

(assert (=> b!778096 (= e!432870 (Intermediate!7972 false index!1321 x!1131))))

(declare-fun b!778097 () Bool)

(assert (=> b!778097 (and (bvsge (index!34258 lt!346524) #b00000000000000000000000000000000) (bvslt (index!34258 lt!346524) (size!20796 lt!346420)))))

(declare-fun res!526493 () Bool)

(assert (=> b!778097 (= res!526493 (= (select (arr!20375 lt!346420) (index!34258 lt!346524)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!778097 (=> res!526493 e!432873)))

(assert (= (and d!102095 c!86200) b!778094))

(assert (= (and d!102095 (not c!86200)) b!778095))

(assert (= (and b!778095 c!86202) b!778096))

(assert (= (and b!778095 (not c!86202)) b!778092))

(assert (= (and d!102095 c!86201) b!778089))

(assert (= (and d!102095 (not c!86201)) b!778093))

(assert (= (and b!778093 res!526494) b!778090))

(assert (= (and b!778090 (not res!526492)) b!778097))

(assert (= (and b!778097 (not res!526493)) b!778091))

(declare-fun m!721299 () Bool)

(assert (=> d!102095 m!721299))

(assert (=> d!102095 m!721105))

(declare-fun m!721301 () Bool)

(assert (=> b!778091 m!721301))

(assert (=> b!778097 m!721301))

(assert (=> b!778092 m!721241))

(assert (=> b!778092 m!721241))

(declare-fun m!721303 () Bool)

(assert (=> b!778092 m!721303))

(assert (=> b!778090 m!721301))

(assert (=> b!777842 d!102095))

(declare-fun b!778098 () Bool)

(declare-fun e!432874 () Bool)

(declare-fun lt!346526 () SeekEntryResult!7972)

(assert (=> b!778098 (= e!432874 (bvsge (x!65207 lt!346526) #b01111111111111111111111111111110))))

(declare-fun b!778099 () Bool)

(assert (=> b!778099 (and (bvsge (index!34258 lt!346526) #b00000000000000000000000000000000) (bvslt (index!34258 lt!346526) (size!20796 lt!346420)))))

(declare-fun res!526495 () Bool)

(assert (=> b!778099 (= res!526495 (= (select (arr!20375 lt!346420) (index!34258 lt!346526)) lt!346415))))

(declare-fun e!432878 () Bool)

(assert (=> b!778099 (=> res!526495 e!432878)))

(declare-fun e!432877 () Bool)

(assert (=> b!778099 (= e!432877 e!432878)))

(declare-fun b!778100 () Bool)

(assert (=> b!778100 (and (bvsge (index!34258 lt!346526) #b00000000000000000000000000000000) (bvslt (index!34258 lt!346526) (size!20796 lt!346420)))))

(assert (=> b!778100 (= e!432878 (= (select (arr!20375 lt!346420) (index!34258 lt!346526)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!102097 () Bool)

(assert (=> d!102097 e!432874))

(declare-fun c!86204 () Bool)

(assert (=> d!102097 (= c!86204 (and ((_ is Intermediate!7972) lt!346526) (undefined!8784 lt!346526)))))

(declare-fun e!432876 () SeekEntryResult!7972)

(assert (=> d!102097 (= lt!346526 e!432876)))

(declare-fun c!86203 () Bool)

(assert (=> d!102097 (= c!86203 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!346525 () (_ BitVec 64))

(assert (=> d!102097 (= lt!346525 (select (arr!20375 lt!346420) (toIndex!0 lt!346415 mask!3328)))))

(assert (=> d!102097 (validMask!0 mask!3328)))

(assert (=> d!102097 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346415 mask!3328) lt!346415 lt!346420 mask!3328) lt!346526)))

(declare-fun e!432875 () SeekEntryResult!7972)

(declare-fun b!778101 () Bool)

(assert (=> b!778101 (= e!432875 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!346415 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!346415 lt!346420 mask!3328))))

(declare-fun b!778102 () Bool)

(assert (=> b!778102 (= e!432874 e!432877)))

(declare-fun res!526497 () Bool)

(assert (=> b!778102 (= res!526497 (and ((_ is Intermediate!7972) lt!346526) (not (undefined!8784 lt!346526)) (bvslt (x!65207 lt!346526) #b01111111111111111111111111111110) (bvsge (x!65207 lt!346526) #b00000000000000000000000000000000) (bvsge (x!65207 lt!346526) #b00000000000000000000000000000000)))))

(assert (=> b!778102 (=> (not res!526497) (not e!432877))))

(declare-fun b!778103 () Bool)

(assert (=> b!778103 (= e!432876 (Intermediate!7972 true (toIndex!0 lt!346415 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!778104 () Bool)

(assert (=> b!778104 (= e!432876 e!432875)))

(declare-fun c!86205 () Bool)

(assert (=> b!778104 (= c!86205 (or (= lt!346525 lt!346415) (= (bvadd lt!346525 lt!346525) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!778105 () Bool)

(assert (=> b!778105 (= e!432875 (Intermediate!7972 false (toIndex!0 lt!346415 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!778106 () Bool)

(assert (=> b!778106 (and (bvsge (index!34258 lt!346526) #b00000000000000000000000000000000) (bvslt (index!34258 lt!346526) (size!20796 lt!346420)))))

(declare-fun res!526496 () Bool)

(assert (=> b!778106 (= res!526496 (= (select (arr!20375 lt!346420) (index!34258 lt!346526)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!778106 (=> res!526496 e!432878)))

(assert (= (and d!102097 c!86203) b!778103))

(assert (= (and d!102097 (not c!86203)) b!778104))

(assert (= (and b!778104 c!86205) b!778105))

(assert (= (and b!778104 (not c!86205)) b!778101))

(assert (= (and d!102097 c!86204) b!778098))

(assert (= (and d!102097 (not c!86204)) b!778102))

(assert (= (and b!778102 res!526497) b!778099))

(assert (= (and b!778099 (not res!526495)) b!778106))

(assert (= (and b!778106 (not res!526496)) b!778100))

(assert (=> d!102097 m!721119))

(declare-fun m!721305 () Bool)

(assert (=> d!102097 m!721305))

(assert (=> d!102097 m!721105))

(declare-fun m!721307 () Bool)

(assert (=> b!778100 m!721307))

(assert (=> b!778106 m!721307))

(assert (=> b!778101 m!721119))

(declare-fun m!721309 () Bool)

(assert (=> b!778101 m!721309))

(assert (=> b!778101 m!721309))

(declare-fun m!721311 () Bool)

(assert (=> b!778101 m!721311))

(assert (=> b!778099 m!721307))

(assert (=> b!777842 d!102097))

(declare-fun d!102099 () Bool)

(declare-fun lt!346542 () (_ BitVec 32))

(declare-fun lt!346541 () (_ BitVec 32))

(assert (=> d!102099 (= lt!346542 (bvmul (bvxor lt!346541 (bvlshr lt!346541 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102099 (= lt!346541 ((_ extract 31 0) (bvand (bvxor lt!346415 (bvlshr lt!346415 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102099 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!526498 (let ((h!15526 ((_ extract 31 0) (bvand (bvxor lt!346415 (bvlshr lt!346415 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65213 (bvmul (bvxor h!15526 (bvlshr h!15526 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65213 (bvlshr x!65213 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!526498 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!526498 #b00000000000000000000000000000000))))))

(assert (=> d!102099 (= (toIndex!0 lt!346415 mask!3328) (bvand (bvxor lt!346542 (bvlshr lt!346542 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!777842 d!102099))

(declare-fun b!778127 () Bool)

(declare-fun e!432891 () SeekEntryResult!7972)

(declare-fun lt!346545 () SeekEntryResult!7972)

(assert (=> b!778127 (= e!432891 (MissingZero!7972 (index!34258 lt!346545)))))

(declare-fun b!778128 () Bool)

(declare-fun e!432892 () SeekEntryResult!7972)

(assert (=> b!778128 (= e!432892 Undefined!7972)))

(declare-fun b!778129 () Bool)

(declare-fun e!432893 () SeekEntryResult!7972)

(assert (=> b!778129 (= e!432893 (Found!7972 (index!34258 lt!346545)))))

(declare-fun b!778130 () Bool)

(assert (=> b!778130 (= e!432892 e!432893)))

(declare-fun lt!346544 () (_ BitVec 64))

(assert (=> b!778130 (= lt!346544 (select (arr!20375 a!3186) (index!34258 lt!346545)))))

(declare-fun c!86215 () Bool)

(assert (=> b!778130 (= c!86215 (= lt!346544 k0!2102))))

(declare-fun b!778131 () Bool)

(declare-fun c!86214 () Bool)

(assert (=> b!778131 (= c!86214 (= lt!346544 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!778131 (= e!432893 e!432891)))

(declare-fun b!778132 () Bool)

(assert (=> b!778132 (= e!432891 (seekKeyOrZeroReturnVacant!0 (x!65207 lt!346545) (index!34258 lt!346545) (index!34258 lt!346545) k0!2102 a!3186 mask!3328))))

(declare-fun d!102101 () Bool)

(declare-fun lt!346543 () SeekEntryResult!7972)

(assert (=> d!102101 (and (or ((_ is Undefined!7972) lt!346543) (not ((_ is Found!7972) lt!346543)) (and (bvsge (index!34257 lt!346543) #b00000000000000000000000000000000) (bvslt (index!34257 lt!346543) (size!20796 a!3186)))) (or ((_ is Undefined!7972) lt!346543) ((_ is Found!7972) lt!346543) (not ((_ is MissingZero!7972) lt!346543)) (and (bvsge (index!34256 lt!346543) #b00000000000000000000000000000000) (bvslt (index!34256 lt!346543) (size!20796 a!3186)))) (or ((_ is Undefined!7972) lt!346543) ((_ is Found!7972) lt!346543) ((_ is MissingZero!7972) lt!346543) (not ((_ is MissingVacant!7972) lt!346543)) (and (bvsge (index!34259 lt!346543) #b00000000000000000000000000000000) (bvslt (index!34259 lt!346543) (size!20796 a!3186)))) (or ((_ is Undefined!7972) lt!346543) (ite ((_ is Found!7972) lt!346543) (= (select (arr!20375 a!3186) (index!34257 lt!346543)) k0!2102) (ite ((_ is MissingZero!7972) lt!346543) (= (select (arr!20375 a!3186) (index!34256 lt!346543)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7972) lt!346543) (= (select (arr!20375 a!3186) (index!34259 lt!346543)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102101 (= lt!346543 e!432892)))

(declare-fun c!86216 () Bool)

(assert (=> d!102101 (= c!86216 (and ((_ is Intermediate!7972) lt!346545) (undefined!8784 lt!346545)))))

(assert (=> d!102101 (= lt!346545 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!102101 (validMask!0 mask!3328)))

(assert (=> d!102101 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!346543)))

(assert (= (and d!102101 c!86216) b!778128))

(assert (= (and d!102101 (not c!86216)) b!778130))

(assert (= (and b!778130 c!86215) b!778129))

(assert (= (and b!778130 (not c!86215)) b!778131))

(assert (= (and b!778131 c!86214) b!778127))

(assert (= (and b!778131 (not c!86214)) b!778132))

(declare-fun m!721313 () Bool)

(assert (=> b!778130 m!721313))

(declare-fun m!721315 () Bool)

(assert (=> b!778132 m!721315))

(declare-fun m!721317 () Bool)

(assert (=> d!102101 m!721317))

(assert (=> d!102101 m!721317))

(declare-fun m!721319 () Bool)

(assert (=> d!102101 m!721319))

(assert (=> d!102101 m!721105))

(declare-fun m!721321 () Bool)

(assert (=> d!102101 m!721321))

(declare-fun m!721323 () Bool)

(assert (=> d!102101 m!721323))

(declare-fun m!721325 () Bool)

(assert (=> d!102101 m!721325))

(assert (=> b!777831 d!102101))

(declare-fun b!778137 () Bool)

(declare-fun e!432897 () Bool)

(declare-fun lt!346550 () SeekEntryResult!7972)

(assert (=> b!778137 (= e!432897 (bvsge (x!65207 lt!346550) #b01111111111111111111111111111110))))

(declare-fun b!778138 () Bool)

(assert (=> b!778138 (and (bvsge (index!34258 lt!346550) #b00000000000000000000000000000000) (bvslt (index!34258 lt!346550) (size!20796 a!3186)))))

(declare-fun res!526505 () Bool)

(assert (=> b!778138 (= res!526505 (= (select (arr!20375 a!3186) (index!34258 lt!346550)) (select (arr!20375 a!3186) j!159)))))

(declare-fun e!432901 () Bool)

(assert (=> b!778138 (=> res!526505 e!432901)))

(declare-fun e!432900 () Bool)

(assert (=> b!778138 (= e!432900 e!432901)))

(declare-fun b!778139 () Bool)

(assert (=> b!778139 (and (bvsge (index!34258 lt!346550) #b00000000000000000000000000000000) (bvslt (index!34258 lt!346550) (size!20796 a!3186)))))

(assert (=> b!778139 (= e!432901 (= (select (arr!20375 a!3186) (index!34258 lt!346550)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!102103 () Bool)

(assert (=> d!102103 e!432897))

(declare-fun c!86219 () Bool)

(assert (=> d!102103 (= c!86219 (and ((_ is Intermediate!7972) lt!346550) (undefined!8784 lt!346550)))))

(declare-fun e!432899 () SeekEntryResult!7972)

(assert (=> d!102103 (= lt!346550 e!432899)))

(declare-fun c!86218 () Bool)

(assert (=> d!102103 (= c!86218 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!346549 () (_ BitVec 64))

(assert (=> d!102103 (= lt!346549 (select (arr!20375 a!3186) (toIndex!0 (select (arr!20375 a!3186) j!159) mask!3328)))))

(assert (=> d!102103 (validMask!0 mask!3328)))

(assert (=> d!102103 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20375 a!3186) j!159) mask!3328) (select (arr!20375 a!3186) j!159) a!3186 mask!3328) lt!346550)))

(declare-fun e!432898 () SeekEntryResult!7972)

(declare-fun b!778140 () Bool)

(assert (=> b!778140 (= e!432898 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20375 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20375 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!778141 () Bool)

(assert (=> b!778141 (= e!432897 e!432900)))

(declare-fun res!526507 () Bool)

(assert (=> b!778141 (= res!526507 (and ((_ is Intermediate!7972) lt!346550) (not (undefined!8784 lt!346550)) (bvslt (x!65207 lt!346550) #b01111111111111111111111111111110) (bvsge (x!65207 lt!346550) #b00000000000000000000000000000000) (bvsge (x!65207 lt!346550) #b00000000000000000000000000000000)))))

(assert (=> b!778141 (=> (not res!526507) (not e!432900))))

(declare-fun b!778142 () Bool)

(assert (=> b!778142 (= e!432899 (Intermediate!7972 true (toIndex!0 (select (arr!20375 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!778143 () Bool)

(assert (=> b!778143 (= e!432899 e!432898)))

(declare-fun c!86220 () Bool)

(assert (=> b!778143 (= c!86220 (or (= lt!346549 (select (arr!20375 a!3186) j!159)) (= (bvadd lt!346549 lt!346549) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!778144 () Bool)

(assert (=> b!778144 (= e!432898 (Intermediate!7972 false (toIndex!0 (select (arr!20375 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!778145 () Bool)

(assert (=> b!778145 (and (bvsge (index!34258 lt!346550) #b00000000000000000000000000000000) (bvslt (index!34258 lt!346550) (size!20796 a!3186)))))

(declare-fun res!526506 () Bool)

(assert (=> b!778145 (= res!526506 (= (select (arr!20375 a!3186) (index!34258 lt!346550)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!778145 (=> res!526506 e!432901)))

(assert (= (and d!102103 c!86218) b!778142))

(assert (= (and d!102103 (not c!86218)) b!778143))

(assert (= (and b!778143 c!86220) b!778144))

(assert (= (and b!778143 (not c!86220)) b!778140))

(assert (= (and d!102103 c!86219) b!778137))

(assert (= (and d!102103 (not c!86219)) b!778141))

(assert (= (and b!778141 res!526507) b!778138))

(assert (= (and b!778138 (not res!526505)) b!778145))

(assert (= (and b!778145 (not res!526506)) b!778139))

(assert (=> d!102103 m!721091))

(declare-fun m!721335 () Bool)

(assert (=> d!102103 m!721335))

(assert (=> d!102103 m!721105))

(declare-fun m!721339 () Bool)

(assert (=> b!778139 m!721339))

(assert (=> b!778145 m!721339))

(assert (=> b!778140 m!721091))

(declare-fun m!721343 () Bool)

(assert (=> b!778140 m!721343))

(assert (=> b!778140 m!721343))

(assert (=> b!778140 m!721083))

(declare-fun m!721345 () Bool)

(assert (=> b!778140 m!721345))

(assert (=> b!778138 m!721339))

(assert (=> b!777830 d!102103))

(declare-fun d!102107 () Bool)

(declare-fun lt!346555 () (_ BitVec 32))

(declare-fun lt!346554 () (_ BitVec 32))

(assert (=> d!102107 (= lt!346555 (bvmul (bvxor lt!346554 (bvlshr lt!346554 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102107 (= lt!346554 ((_ extract 31 0) (bvand (bvxor (select (arr!20375 a!3186) j!159) (bvlshr (select (arr!20375 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102107 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!526498 (let ((h!15526 ((_ extract 31 0) (bvand (bvxor (select (arr!20375 a!3186) j!159) (bvlshr (select (arr!20375 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65213 (bvmul (bvxor h!15526 (bvlshr h!15526 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65213 (bvlshr x!65213 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!526498 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!526498 #b00000000000000000000000000000000))))))

(assert (=> d!102107 (= (toIndex!0 (select (arr!20375 a!3186) j!159) mask!3328) (bvand (bvxor lt!346555 (bvlshr lt!346555 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!777830 d!102107))

(declare-fun d!102109 () Bool)

(assert (=> d!102109 (= (validKeyInArray!0 (select (arr!20375 a!3186) j!159)) (and (not (= (select (arr!20375 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20375 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!777840 d!102109))

(declare-fun b!778172 () Bool)

(declare-fun e!432921 () Bool)

(declare-fun e!432919 () Bool)

(assert (=> b!778172 (= e!432921 e!432919)))

(declare-fun c!86230 () Bool)

(assert (=> b!778172 (= c!86230 (validKeyInArray!0 (select (arr!20375 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!778173 () Bool)

(declare-fun e!432922 () Bool)

(declare-fun contains!4081 (List!14416 (_ BitVec 64)) Bool)

(assert (=> b!778173 (= e!432922 (contains!4081 Nil!14413 (select (arr!20375 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35174 () Bool)

(declare-fun call!35177 () Bool)

(assert (=> bm!35174 (= call!35177 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!86230 (Cons!14412 (select (arr!20375 a!3186) #b00000000000000000000000000000000) Nil!14413) Nil!14413)))))

(declare-fun b!778175 () Bool)

(assert (=> b!778175 (= e!432919 call!35177)))

(declare-fun b!778176 () Bool)

(declare-fun e!432920 () Bool)

(assert (=> b!778176 (= e!432920 e!432921)))

(declare-fun res!526516 () Bool)

(assert (=> b!778176 (=> (not res!526516) (not e!432921))))

(assert (=> b!778176 (= res!526516 (not e!432922))))

(declare-fun res!526517 () Bool)

(assert (=> b!778176 (=> (not res!526517) (not e!432922))))

(assert (=> b!778176 (= res!526517 (validKeyInArray!0 (select (arr!20375 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!102111 () Bool)

(declare-fun res!526518 () Bool)

(assert (=> d!102111 (=> res!526518 e!432920)))

(assert (=> d!102111 (= res!526518 (bvsge #b00000000000000000000000000000000 (size!20796 a!3186)))))

(assert (=> d!102111 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14413) e!432920)))

(declare-fun b!778174 () Bool)

(assert (=> b!778174 (= e!432919 call!35177)))

(assert (= (and d!102111 (not res!526518)) b!778176))

(assert (= (and b!778176 res!526517) b!778173))

(assert (= (and b!778176 res!526516) b!778172))

(assert (= (and b!778172 c!86230) b!778174))

(assert (= (and b!778172 (not c!86230)) b!778175))

(assert (= (or b!778174 b!778175) bm!35174))

(assert (=> b!778172 m!721295))

(assert (=> b!778172 m!721295))

(declare-fun m!721371 () Bool)

(assert (=> b!778172 m!721371))

(assert (=> b!778173 m!721295))

(assert (=> b!778173 m!721295))

(declare-fun m!721373 () Bool)

(assert (=> b!778173 m!721373))

(assert (=> bm!35174 m!721295))

(declare-fun m!721377 () Bool)

(assert (=> bm!35174 m!721377))

(assert (=> b!778176 m!721295))

(assert (=> b!778176 m!721295))

(assert (=> b!778176 m!721371))

(assert (=> b!777844 d!102111))

(declare-fun b!778209 () Bool)

(declare-fun e!432946 () Bool)

(declare-fun e!432947 () Bool)

(assert (=> b!778209 (= e!432946 e!432947)))

(declare-fun lt!346578 () (_ BitVec 64))

(assert (=> b!778209 (= lt!346578 (select (arr!20375 a!3186) j!159))))

(declare-fun lt!346577 () Unit!26810)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42561 (_ BitVec 64) (_ BitVec 32)) Unit!26810)

(assert (=> b!778209 (= lt!346577 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!346578 j!159))))

(assert (=> b!778209 (arrayContainsKey!0 a!3186 lt!346578 #b00000000000000000000000000000000)))

(declare-fun lt!346579 () Unit!26810)

(assert (=> b!778209 (= lt!346579 lt!346577)))

(declare-fun res!526537 () Bool)

(assert (=> b!778209 (= res!526537 (= (seekEntryOrOpen!0 (select (arr!20375 a!3186) j!159) a!3186 mask!3328) (Found!7972 j!159)))))

(assert (=> b!778209 (=> (not res!526537) (not e!432947))))

(declare-fun call!35183 () Bool)

(declare-fun bm!35180 () Bool)

(assert (=> bm!35180 (= call!35183 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun d!102121 () Bool)

(declare-fun res!526536 () Bool)

(declare-fun e!432948 () Bool)

(assert (=> d!102121 (=> res!526536 e!432948)))

(assert (=> d!102121 (= res!526536 (bvsge j!159 (size!20796 a!3186)))))

(assert (=> d!102121 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!432948)))

(declare-fun b!778210 () Bool)

(assert (=> b!778210 (= e!432948 e!432946)))

(declare-fun c!86239 () Bool)

(assert (=> b!778210 (= c!86239 (validKeyInArray!0 (select (arr!20375 a!3186) j!159)))))

(declare-fun b!778211 () Bool)

(assert (=> b!778211 (= e!432946 call!35183)))

(declare-fun b!778212 () Bool)

(assert (=> b!778212 (= e!432947 call!35183)))

(assert (= (and d!102121 (not res!526536)) b!778210))

(assert (= (and b!778210 c!86239) b!778209))

(assert (= (and b!778210 (not c!86239)) b!778211))

(assert (= (and b!778209 res!526537) b!778212))

(assert (= (or b!778212 b!778211) bm!35180))

(assert (=> b!778209 m!721083))

(declare-fun m!721391 () Bool)

(assert (=> b!778209 m!721391))

(declare-fun m!721393 () Bool)

(assert (=> b!778209 m!721393))

(assert (=> b!778209 m!721083))

(assert (=> b!778209 m!721095))

(declare-fun m!721395 () Bool)

(assert (=> bm!35180 m!721395))

(assert (=> b!778210 m!721083))

(assert (=> b!778210 m!721083))

(assert (=> b!778210 m!721087))

(assert (=> b!777833 d!102121))

(declare-fun d!102129 () Bool)

(assert (=> d!102129 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!346582 () Unit!26810)

(declare-fun choose!38 (array!42561 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26810)

(assert (=> d!102129 (= lt!346582 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!102129 (validMask!0 mask!3328)))

(assert (=> d!102129 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!346582)))

(declare-fun bs!21661 () Bool)

(assert (= bs!21661 d!102129))

(assert (=> bs!21661 m!721127))

(declare-fun m!721397 () Bool)

(assert (=> bs!21661 m!721397))

(assert (=> bs!21661 m!721105))

(assert (=> b!777833 d!102129))

(declare-fun d!102131 () Bool)

(assert (=> d!102131 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!67250 d!102131))

(declare-fun d!102139 () Bool)

(assert (=> d!102139 (= (array_inv!16258 a!3186) (bvsge (size!20796 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!67250 d!102139))

(declare-fun b!778255 () Bool)

(declare-fun e!432973 () Bool)

(declare-fun e!432974 () Bool)

(assert (=> b!778255 (= e!432973 e!432974)))

(declare-fun lt!346599 () (_ BitVec 64))

(assert (=> b!778255 (= lt!346599 (select (arr!20375 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!346598 () Unit!26810)

(assert (=> b!778255 (= lt!346598 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!346599 #b00000000000000000000000000000000))))

(assert (=> b!778255 (arrayContainsKey!0 a!3186 lt!346599 #b00000000000000000000000000000000)))

(declare-fun lt!346600 () Unit!26810)

(assert (=> b!778255 (= lt!346600 lt!346598)))

(declare-fun res!526545 () Bool)

(assert (=> b!778255 (= res!526545 (= (seekEntryOrOpen!0 (select (arr!20375 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7972 #b00000000000000000000000000000000)))))

(assert (=> b!778255 (=> (not res!526545) (not e!432974))))

(declare-fun bm!35181 () Bool)

(declare-fun call!35184 () Bool)

(assert (=> bm!35181 (= call!35184 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun d!102141 () Bool)

(declare-fun res!526544 () Bool)

(declare-fun e!432975 () Bool)

(assert (=> d!102141 (=> res!526544 e!432975)))

(assert (=> d!102141 (= res!526544 (bvsge #b00000000000000000000000000000000 (size!20796 a!3186)))))

(assert (=> d!102141 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!432975)))

(declare-fun b!778256 () Bool)

(assert (=> b!778256 (= e!432975 e!432973)))

(declare-fun c!86258 () Bool)

(assert (=> b!778256 (= c!86258 (validKeyInArray!0 (select (arr!20375 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!778257 () Bool)

(assert (=> b!778257 (= e!432973 call!35184)))

(declare-fun b!778258 () Bool)

(assert (=> b!778258 (= e!432974 call!35184)))

(assert (= (and d!102141 (not res!526544)) b!778256))

(assert (= (and b!778256 c!86258) b!778255))

(assert (= (and b!778256 (not c!86258)) b!778257))

(assert (= (and b!778255 res!526545) b!778258))

(assert (= (or b!778258 b!778257) bm!35181))

(assert (=> b!778255 m!721295))

(declare-fun m!721421 () Bool)

(assert (=> b!778255 m!721421))

(declare-fun m!721423 () Bool)

(assert (=> b!778255 m!721423))

(assert (=> b!778255 m!721295))

(declare-fun m!721425 () Bool)

(assert (=> b!778255 m!721425))

(declare-fun m!721427 () Bool)

(assert (=> bm!35181 m!721427))

(assert (=> b!778256 m!721295))

(assert (=> b!778256 m!721295))

(assert (=> b!778256 m!721371))

(assert (=> b!777832 d!102141))

(check-sat (not d!102095) (not b!778101) (not d!102071) (not bm!35180) (not d!102097) (not b!777984) (not d!102103) (not b!778132) (not d!102073) (not b!778176) (not d!102077) (not b!778088) (not b!778209) (not b!778140) (not b!778092) (not b!778173) (not bm!35181) (not b!778010) (not b!778256) (not b!777990) (not b!778082) (not b!778071) (not d!102089) (not d!102081) (not b!778255) (not d!102129) (not b!778172) (not d!102101) (not bm!35174) (not b!778210))
(check-sat)
