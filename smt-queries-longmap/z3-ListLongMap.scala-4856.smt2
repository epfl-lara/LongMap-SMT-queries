; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66908 () Bool)

(assert start!66908)

(declare-fun b!771938 () Bool)

(declare-datatypes ((Unit!26610 0))(
  ( (Unit!26611) )
))
(declare-fun e!429752 () Unit!26610)

(declare-fun Unit!26612 () Unit!26610)

(assert (=> b!771938 (= e!429752 Unit!26612)))

(declare-datatypes ((array!42401 0))(
  ( (array!42402 (arr!20299 (Array (_ BitVec 32) (_ BitVec 64))) (size!20720 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42401)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7899 0))(
  ( (MissingZero!7899 (index!33964 (_ BitVec 32))) (Found!7899 (index!33965 (_ BitVec 32))) (Intermediate!7899 (undefined!8711 Bool) (index!33966 (_ BitVec 32)) (x!64898 (_ BitVec 32))) (Undefined!7899) (MissingVacant!7899 (index!33967 (_ BitVec 32))) )
))
(declare-fun lt!343658 () SeekEntryResult!7899)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42401 (_ BitVec 32)) SeekEntryResult!7899)

(assert (=> b!771938 (= lt!343658 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20299 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!343651 () (_ BitVec 32))

(assert (=> b!771938 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343651 resIntermediateIndex!5 (select (arr!20299 a!3186) j!159) a!3186 mask!3328) (Found!7899 j!159))))

(declare-fun b!771939 () Bool)

(declare-fun e!429750 () Bool)

(assert (=> b!771939 (= e!429750 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000)))))

(declare-fun lt!343657 () Unit!26610)

(assert (=> b!771939 (= lt!343657 e!429752)))

(declare-fun c!85308 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!771939 (= c!85308 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!771939 (= lt!343651 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!771940 () Bool)

(declare-fun res!522120 () Bool)

(declare-fun e!429755 () Bool)

(assert (=> b!771940 (=> (not res!522120) (not e!429755))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42401 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!771940 (= res!522120 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!771941 () Bool)

(declare-fun e!429749 () Bool)

(assert (=> b!771941 (= e!429755 e!429749)))

(declare-fun res!522127 () Bool)

(assert (=> b!771941 (=> (not res!522127) (not e!429749))))

(declare-fun lt!343653 () SeekEntryResult!7899)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!771941 (= res!522127 (or (= lt!343653 (MissingZero!7899 i!1173)) (= lt!343653 (MissingVacant!7899 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42401 (_ BitVec 32)) SeekEntryResult!7899)

(assert (=> b!771941 (= lt!343653 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!771942 () Bool)

(declare-fun res!522123 () Bool)

(assert (=> b!771942 (=> (not res!522123) (not e!429755))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!771942 (= res!522123 (validKeyInArray!0 (select (arr!20299 a!3186) j!159)))))

(declare-fun b!771943 () Bool)

(declare-fun e!429746 () Bool)

(declare-fun e!429748 () Bool)

(assert (=> b!771943 (= e!429746 e!429748)))

(declare-fun res!522117 () Bool)

(assert (=> b!771943 (=> (not res!522117) (not e!429748))))

(declare-fun lt!343654 () SeekEntryResult!7899)

(declare-fun lt!343656 () SeekEntryResult!7899)

(assert (=> b!771943 (= res!522117 (= lt!343654 lt!343656))))

(declare-fun lt!343661 () array!42401)

(declare-fun lt!343660 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42401 (_ BitVec 32)) SeekEntryResult!7899)

(assert (=> b!771943 (= lt!343656 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343660 lt!343661 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!771943 (= lt!343654 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343660 mask!3328) lt!343660 lt!343661 mask!3328))))

(assert (=> b!771943 (= lt!343660 (select (store (arr!20299 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!771943 (= lt!343661 (array!42402 (store (arr!20299 a!3186) i!1173 k0!2102) (size!20720 a!3186)))))

(declare-fun b!771944 () Bool)

(declare-fun res!522130 () Bool)

(assert (=> b!771944 (=> (not res!522130) (not e!429755))))

(assert (=> b!771944 (= res!522130 (validKeyInArray!0 k0!2102))))

(declare-fun b!771945 () Bool)

(declare-fun Unit!26613 () Unit!26610)

(assert (=> b!771945 (= e!429752 Unit!26613)))

(declare-fun lt!343652 () SeekEntryResult!7899)

(assert (=> b!771945 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343651 (select (arr!20299 a!3186) j!159) a!3186 mask!3328) lt!343652)))

(declare-fun b!771946 () Bool)

(assert (=> b!771946 (= e!429748 (not e!429750))))

(declare-fun res!522118 () Bool)

(assert (=> b!771946 (=> res!522118 e!429750)))

(get-info :version)

(assert (=> b!771946 (= res!522118 (or (not ((_ is Intermediate!7899) lt!343656)) (bvsge x!1131 (x!64898 lt!343656))))))

(declare-fun e!429751 () Bool)

(assert (=> b!771946 e!429751))

(declare-fun res!522131 () Bool)

(assert (=> b!771946 (=> (not res!522131) (not e!429751))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42401 (_ BitVec 32)) Bool)

(assert (=> b!771946 (= res!522131 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!343655 () Unit!26610)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42401 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26610)

(assert (=> b!771946 (= lt!343655 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!771947 () Bool)

(assert (=> b!771947 (= e!429749 e!429746)))

(declare-fun res!522128 () Bool)

(assert (=> b!771947 (=> (not res!522128) (not e!429746))))

(assert (=> b!771947 (= res!522128 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20299 a!3186) j!159) mask!3328) (select (arr!20299 a!3186) j!159) a!3186 mask!3328) lt!343652))))

(assert (=> b!771947 (= lt!343652 (Intermediate!7899 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!771948 () Bool)

(declare-fun e!429747 () Bool)

(assert (=> b!771948 (= e!429747 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20299 a!3186) j!159) a!3186 mask!3328) lt!343652))))

(declare-fun b!771949 () Bool)

(declare-fun res!522122 () Bool)

(assert (=> b!771949 (=> (not res!522122) (not e!429749))))

(assert (=> b!771949 (= res!522122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!522129 () Bool)

(assert (=> start!66908 (=> (not res!522129) (not e!429755))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66908 (= res!522129 (validMask!0 mask!3328))))

(assert (=> start!66908 e!429755))

(assert (=> start!66908 true))

(declare-fun array_inv!16095 (array!42401) Bool)

(assert (=> start!66908 (array_inv!16095 a!3186)))

(declare-fun b!771950 () Bool)

(assert (=> b!771950 (= e!429747 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20299 a!3186) j!159) a!3186 mask!3328) (Found!7899 j!159)))))

(declare-fun b!771951 () Bool)

(declare-fun res!522125 () Bool)

(assert (=> b!771951 (=> (not res!522125) (not e!429746))))

(assert (=> b!771951 (= res!522125 e!429747)))

(declare-fun c!85309 () Bool)

(assert (=> b!771951 (= c!85309 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!771952 () Bool)

(declare-fun res!522126 () Bool)

(assert (=> b!771952 (=> (not res!522126) (not e!429746))))

(assert (=> b!771952 (= res!522126 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20299 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!771953 () Bool)

(declare-fun lt!343659 () SeekEntryResult!7899)

(declare-fun e!429754 () Bool)

(assert (=> b!771953 (= e!429754 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20299 a!3186) j!159) a!3186 mask!3328) lt!343659))))

(declare-fun b!771954 () Bool)

(assert (=> b!771954 (= e!429751 e!429754)))

(declare-fun res!522116 () Bool)

(assert (=> b!771954 (=> (not res!522116) (not e!429754))))

(assert (=> b!771954 (= res!522116 (= (seekEntryOrOpen!0 (select (arr!20299 a!3186) j!159) a!3186 mask!3328) lt!343659))))

(assert (=> b!771954 (= lt!343659 (Found!7899 j!159))))

(declare-fun b!771955 () Bool)

(declare-fun res!522119 () Bool)

(assert (=> b!771955 (=> (not res!522119) (not e!429755))))

(assert (=> b!771955 (= res!522119 (and (= (size!20720 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20720 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20720 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!771956 () Bool)

(declare-fun res!522124 () Bool)

(assert (=> b!771956 (=> (not res!522124) (not e!429749))))

(declare-datatypes ((List!14301 0))(
  ( (Nil!14298) (Cons!14297 (h!15399 (_ BitVec 64)) (t!20616 List!14301)) )
))
(declare-fun arrayNoDuplicates!0 (array!42401 (_ BitVec 32) List!14301) Bool)

(assert (=> b!771956 (= res!522124 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14298))))

(declare-fun b!771957 () Bool)

(declare-fun res!522121 () Bool)

(assert (=> b!771957 (=> (not res!522121) (not e!429749))))

(assert (=> b!771957 (= res!522121 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20720 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20720 a!3186))))))

(assert (= (and start!66908 res!522129) b!771955))

(assert (= (and b!771955 res!522119) b!771942))

(assert (= (and b!771942 res!522123) b!771944))

(assert (= (and b!771944 res!522130) b!771940))

(assert (= (and b!771940 res!522120) b!771941))

(assert (= (and b!771941 res!522127) b!771949))

(assert (= (and b!771949 res!522122) b!771956))

(assert (= (and b!771956 res!522124) b!771957))

(assert (= (and b!771957 res!522121) b!771947))

(assert (= (and b!771947 res!522128) b!771952))

(assert (= (and b!771952 res!522126) b!771951))

(assert (= (and b!771951 c!85309) b!771948))

(assert (= (and b!771951 (not c!85309)) b!771950))

(assert (= (and b!771951 res!522125) b!771943))

(assert (= (and b!771943 res!522117) b!771946))

(assert (= (and b!771946 res!522131) b!771954))

(assert (= (and b!771954 res!522116) b!771953))

(assert (= (and b!771946 (not res!522118)) b!771939))

(assert (= (and b!771939 c!85308) b!771945))

(assert (= (and b!771939 (not c!85308)) b!771938))

(declare-fun m!716943 () Bool)

(assert (=> b!771942 m!716943))

(assert (=> b!771942 m!716943))

(declare-fun m!716945 () Bool)

(assert (=> b!771942 m!716945))

(declare-fun m!716947 () Bool)

(assert (=> b!771952 m!716947))

(declare-fun m!716949 () Bool)

(assert (=> b!771940 m!716949))

(assert (=> b!771945 m!716943))

(assert (=> b!771945 m!716943))

(declare-fun m!716951 () Bool)

(assert (=> b!771945 m!716951))

(declare-fun m!716953 () Bool)

(assert (=> b!771946 m!716953))

(declare-fun m!716955 () Bool)

(assert (=> b!771946 m!716955))

(assert (=> b!771953 m!716943))

(assert (=> b!771953 m!716943))

(declare-fun m!716957 () Bool)

(assert (=> b!771953 m!716957))

(assert (=> b!771938 m!716943))

(assert (=> b!771938 m!716943))

(declare-fun m!716959 () Bool)

(assert (=> b!771938 m!716959))

(assert (=> b!771938 m!716943))

(declare-fun m!716961 () Bool)

(assert (=> b!771938 m!716961))

(declare-fun m!716963 () Bool)

(assert (=> start!66908 m!716963))

(declare-fun m!716965 () Bool)

(assert (=> start!66908 m!716965))

(declare-fun m!716967 () Bool)

(assert (=> b!771939 m!716967))

(declare-fun m!716969 () Bool)

(assert (=> b!771943 m!716969))

(declare-fun m!716971 () Bool)

(assert (=> b!771943 m!716971))

(assert (=> b!771943 m!716969))

(declare-fun m!716973 () Bool)

(assert (=> b!771943 m!716973))

(declare-fun m!716975 () Bool)

(assert (=> b!771943 m!716975))

(declare-fun m!716977 () Bool)

(assert (=> b!771943 m!716977))

(assert (=> b!771947 m!716943))

(assert (=> b!771947 m!716943))

(declare-fun m!716979 () Bool)

(assert (=> b!771947 m!716979))

(assert (=> b!771947 m!716979))

(assert (=> b!771947 m!716943))

(declare-fun m!716981 () Bool)

(assert (=> b!771947 m!716981))

(assert (=> b!771950 m!716943))

(assert (=> b!771950 m!716943))

(assert (=> b!771950 m!716959))

(declare-fun m!716983 () Bool)

(assert (=> b!771944 m!716983))

(assert (=> b!771954 m!716943))

(assert (=> b!771954 m!716943))

(declare-fun m!716985 () Bool)

(assert (=> b!771954 m!716985))

(declare-fun m!716987 () Bool)

(assert (=> b!771949 m!716987))

(assert (=> b!771948 m!716943))

(assert (=> b!771948 m!716943))

(declare-fun m!716989 () Bool)

(assert (=> b!771948 m!716989))

(declare-fun m!716991 () Bool)

(assert (=> b!771956 m!716991))

(declare-fun m!716993 () Bool)

(assert (=> b!771941 m!716993))

(check-sat (not b!771945) (not b!771953) (not b!771947) (not b!771939) (not b!771944) (not b!771940) (not b!771950) (not b!771956) (not b!771946) (not b!771954) (not b!771948) (not b!771943) (not b!771938) (not b!771941) (not b!771949) (not b!771942) (not start!66908))
(check-sat)
