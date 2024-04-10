; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67004 () Bool)

(assert start!67004)

(declare-fun b!773120 () Bool)

(declare-fun res!522837 () Bool)

(declare-fun e!430383 () Bool)

(assert (=> b!773120 (=> (not res!522837) (not e!430383))))

(declare-datatypes ((array!42428 0))(
  ( (array!42429 (arr!20311 (Array (_ BitVec 32) (_ BitVec 64))) (size!20732 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42428)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!773120 (= res!522837 (validKeyInArray!0 (select (arr!20311 a!3186) j!159)))))

(declare-fun b!773121 () Bool)

(declare-fun e!430388 () Bool)

(declare-fun e!430390 () Bool)

(assert (=> b!773121 (= e!430388 e!430390)))

(declare-fun res!522833 () Bool)

(assert (=> b!773121 (=> (not res!522833) (not e!430390))))

(declare-datatypes ((SeekEntryResult!7911 0))(
  ( (MissingZero!7911 (index!34012 (_ BitVec 32))) (Found!7911 (index!34013 (_ BitVec 32))) (Intermediate!7911 (undefined!8723 Bool) (index!34014 (_ BitVec 32)) (x!64954 (_ BitVec 32))) (Undefined!7911) (MissingVacant!7911 (index!34015 (_ BitVec 32))) )
))
(declare-fun lt!344236 () SeekEntryResult!7911)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42428 (_ BitVec 32)) SeekEntryResult!7911)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773121 (= res!522833 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20311 a!3186) j!159) mask!3328) (select (arr!20311 a!3186) j!159) a!3186 mask!3328) lt!344236))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!773121 (= lt!344236 (Intermediate!7911 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!773122 () Bool)

(declare-fun e!430384 () Bool)

(assert (=> b!773122 (= e!430384 true)))

(declare-datatypes ((Unit!26658 0))(
  ( (Unit!26659) )
))
(declare-fun lt!344235 () Unit!26658)

(declare-fun e!430382 () Unit!26658)

(assert (=> b!773122 (= lt!344235 e!430382)))

(declare-fun c!85545 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!773122 (= c!85545 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!344238 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773122 (= lt!344238 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!773123 () Bool)

(declare-fun e!430387 () Bool)

(declare-fun e!430385 () Bool)

(assert (=> b!773123 (= e!430387 e!430385)))

(declare-fun res!522835 () Bool)

(assert (=> b!773123 (=> (not res!522835) (not e!430385))))

(declare-fun lt!344242 () SeekEntryResult!7911)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42428 (_ BitVec 32)) SeekEntryResult!7911)

(assert (=> b!773123 (= res!522835 (= (seekEntryOrOpen!0 (select (arr!20311 a!3186) j!159) a!3186 mask!3328) lt!344242))))

(assert (=> b!773123 (= lt!344242 (Found!7911 j!159))))

(declare-fun b!773124 () Bool)

(declare-fun Unit!26660 () Unit!26658)

(assert (=> b!773124 (= e!430382 Unit!26660)))

(declare-fun lt!344237 () SeekEntryResult!7911)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42428 (_ BitVec 32)) SeekEntryResult!7911)

(assert (=> b!773124 (= lt!344237 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20311 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!773124 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344238 resIntermediateIndex!5 (select (arr!20311 a!3186) j!159) a!3186 mask!3328) (Found!7911 j!159))))

(declare-fun b!773125 () Bool)

(declare-fun Unit!26661 () Unit!26658)

(assert (=> b!773125 (= e!430382 Unit!26661)))

(assert (=> b!773125 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344238 (select (arr!20311 a!3186) j!159) a!3186 mask!3328) lt!344236)))

(declare-fun b!773126 () Bool)

(declare-fun res!522840 () Bool)

(assert (=> b!773126 (=> (not res!522840) (not e!430390))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!773126 (= res!522840 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20311 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!773127 () Bool)

(declare-fun e!430391 () Bool)

(assert (=> b!773127 (= e!430391 (not e!430384))))

(declare-fun res!522834 () Bool)

(assert (=> b!773127 (=> res!522834 e!430384)))

(declare-fun lt!344240 () SeekEntryResult!7911)

(get-info :version)

(assert (=> b!773127 (= res!522834 (or (not ((_ is Intermediate!7911) lt!344240)) (bvsge x!1131 (x!64954 lt!344240))))))

(assert (=> b!773127 e!430387))

(declare-fun res!522830 () Bool)

(assert (=> b!773127 (=> (not res!522830) (not e!430387))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42428 (_ BitVec 32)) Bool)

(assert (=> b!773127 (= res!522830 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!344233 () Unit!26658)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42428 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26658)

(assert (=> b!773127 (= lt!344233 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!773128 () Bool)

(declare-fun e!430386 () Bool)

(assert (=> b!773128 (= e!430386 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20311 a!3186) j!159) a!3186 mask!3328) (Found!7911 j!159)))))

(declare-fun b!773129 () Bool)

(declare-fun res!522838 () Bool)

(assert (=> b!773129 (=> (not res!522838) (not e!430388))))

(assert (=> b!773129 (= res!522838 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20732 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20732 a!3186))))))

(declare-fun b!773130 () Bool)

(declare-fun res!522828 () Bool)

(assert (=> b!773130 (=> (not res!522828) (not e!430383))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42428 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!773130 (= res!522828 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!773131 () Bool)

(declare-fun res!522836 () Bool)

(assert (=> b!773131 (=> (not res!522836) (not e!430390))))

(assert (=> b!773131 (= res!522836 e!430386)))

(declare-fun c!85546 () Bool)

(assert (=> b!773131 (= c!85546 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!773132 () Bool)

(assert (=> b!773132 (= e!430386 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20311 a!3186) j!159) a!3186 mask!3328) lt!344236))))

(declare-fun b!773133 () Bool)

(assert (=> b!773133 (= e!430385 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20311 a!3186) j!159) a!3186 mask!3328) lt!344242))))

(declare-fun b!773134 () Bool)

(declare-fun res!522831 () Bool)

(assert (=> b!773134 (=> (not res!522831) (not e!430383))))

(assert (=> b!773134 (= res!522831 (validKeyInArray!0 k0!2102))))

(declare-fun b!773135 () Bool)

(assert (=> b!773135 (= e!430390 e!430391)))

(declare-fun res!522832 () Bool)

(assert (=> b!773135 (=> (not res!522832) (not e!430391))))

(declare-fun lt!344241 () SeekEntryResult!7911)

(assert (=> b!773135 (= res!522832 (= lt!344241 lt!344240))))

(declare-fun lt!344239 () (_ BitVec 64))

(declare-fun lt!344243 () array!42428)

(assert (=> b!773135 (= lt!344240 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344239 lt!344243 mask!3328))))

(assert (=> b!773135 (= lt!344241 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344239 mask!3328) lt!344239 lt!344243 mask!3328))))

(assert (=> b!773135 (= lt!344239 (select (store (arr!20311 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!773135 (= lt!344243 (array!42429 (store (arr!20311 a!3186) i!1173 k0!2102) (size!20732 a!3186)))))

(declare-fun b!773136 () Bool)

(declare-fun res!522829 () Bool)

(assert (=> b!773136 (=> (not res!522829) (not e!430388))))

(assert (=> b!773136 (= res!522829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!773137 () Bool)

(declare-fun res!522839 () Bool)

(assert (=> b!773137 (=> (not res!522839) (not e!430383))))

(assert (=> b!773137 (= res!522839 (and (= (size!20732 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20732 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20732 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!773138 () Bool)

(assert (=> b!773138 (= e!430383 e!430388)))

(declare-fun res!522841 () Bool)

(assert (=> b!773138 (=> (not res!522841) (not e!430388))))

(declare-fun lt!344234 () SeekEntryResult!7911)

(assert (=> b!773138 (= res!522841 (or (= lt!344234 (MissingZero!7911 i!1173)) (= lt!344234 (MissingVacant!7911 i!1173))))))

(assert (=> b!773138 (= lt!344234 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!522842 () Bool)

(assert (=> start!67004 (=> (not res!522842) (not e!430383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67004 (= res!522842 (validMask!0 mask!3328))))

(assert (=> start!67004 e!430383))

(assert (=> start!67004 true))

(declare-fun array_inv!16107 (array!42428) Bool)

(assert (=> start!67004 (array_inv!16107 a!3186)))

(declare-fun b!773139 () Bool)

(declare-fun res!522827 () Bool)

(assert (=> b!773139 (=> (not res!522827) (not e!430388))))

(declare-datatypes ((List!14313 0))(
  ( (Nil!14310) (Cons!14309 (h!15414 (_ BitVec 64)) (t!20628 List!14313)) )
))
(declare-fun arrayNoDuplicates!0 (array!42428 (_ BitVec 32) List!14313) Bool)

(assert (=> b!773139 (= res!522827 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14310))))

(assert (= (and start!67004 res!522842) b!773137))

(assert (= (and b!773137 res!522839) b!773120))

(assert (= (and b!773120 res!522837) b!773134))

(assert (= (and b!773134 res!522831) b!773130))

(assert (= (and b!773130 res!522828) b!773138))

(assert (= (and b!773138 res!522841) b!773136))

(assert (= (and b!773136 res!522829) b!773139))

(assert (= (and b!773139 res!522827) b!773129))

(assert (= (and b!773129 res!522838) b!773121))

(assert (= (and b!773121 res!522833) b!773126))

(assert (= (and b!773126 res!522840) b!773131))

(assert (= (and b!773131 c!85546) b!773132))

(assert (= (and b!773131 (not c!85546)) b!773128))

(assert (= (and b!773131 res!522836) b!773135))

(assert (= (and b!773135 res!522832) b!773127))

(assert (= (and b!773127 res!522830) b!773123))

(assert (= (and b!773123 res!522835) b!773133))

(assert (= (and b!773127 (not res!522834)) b!773122))

(assert (= (and b!773122 c!85545) b!773125))

(assert (= (and b!773122 (not c!85545)) b!773124))

(declare-fun m!717891 () Bool)

(assert (=> start!67004 m!717891))

(declare-fun m!717893 () Bool)

(assert (=> start!67004 m!717893))

(declare-fun m!717895 () Bool)

(assert (=> b!773122 m!717895))

(declare-fun m!717897 () Bool)

(assert (=> b!773136 m!717897))

(declare-fun m!717899 () Bool)

(assert (=> b!773124 m!717899))

(assert (=> b!773124 m!717899))

(declare-fun m!717901 () Bool)

(assert (=> b!773124 m!717901))

(assert (=> b!773124 m!717899))

(declare-fun m!717903 () Bool)

(assert (=> b!773124 m!717903))

(assert (=> b!773120 m!717899))

(assert (=> b!773120 m!717899))

(declare-fun m!717905 () Bool)

(assert (=> b!773120 m!717905))

(declare-fun m!717907 () Bool)

(assert (=> b!773127 m!717907))

(declare-fun m!717909 () Bool)

(assert (=> b!773127 m!717909))

(declare-fun m!717911 () Bool)

(assert (=> b!773139 m!717911))

(assert (=> b!773121 m!717899))

(assert (=> b!773121 m!717899))

(declare-fun m!717913 () Bool)

(assert (=> b!773121 m!717913))

(assert (=> b!773121 m!717913))

(assert (=> b!773121 m!717899))

(declare-fun m!717915 () Bool)

(assert (=> b!773121 m!717915))

(assert (=> b!773123 m!717899))

(assert (=> b!773123 m!717899))

(declare-fun m!717917 () Bool)

(assert (=> b!773123 m!717917))

(declare-fun m!717919 () Bool)

(assert (=> b!773130 m!717919))

(assert (=> b!773132 m!717899))

(assert (=> b!773132 m!717899))

(declare-fun m!717921 () Bool)

(assert (=> b!773132 m!717921))

(assert (=> b!773128 m!717899))

(assert (=> b!773128 m!717899))

(assert (=> b!773128 m!717901))

(declare-fun m!717923 () Bool)

(assert (=> b!773135 m!717923))

(declare-fun m!717925 () Bool)

(assert (=> b!773135 m!717925))

(declare-fun m!717927 () Bool)

(assert (=> b!773135 m!717927))

(declare-fun m!717929 () Bool)

(assert (=> b!773135 m!717929))

(assert (=> b!773135 m!717923))

(declare-fun m!717931 () Bool)

(assert (=> b!773135 m!717931))

(declare-fun m!717933 () Bool)

(assert (=> b!773126 m!717933))

(declare-fun m!717935 () Bool)

(assert (=> b!773134 m!717935))

(declare-fun m!717937 () Bool)

(assert (=> b!773138 m!717937))

(assert (=> b!773133 m!717899))

(assert (=> b!773133 m!717899))

(declare-fun m!717939 () Bool)

(assert (=> b!773133 m!717939))

(assert (=> b!773125 m!717899))

(assert (=> b!773125 m!717899))

(declare-fun m!717941 () Bool)

(assert (=> b!773125 m!717941))

(check-sat (not b!773139) (not b!773130) (not b!773123) (not b!773120) (not b!773121) (not b!773127) (not b!773134) (not b!773132) (not start!67004) (not b!773135) (not b!773133) (not b!773138) (not b!773136) (not b!773122) (not b!773128) (not b!773125) (not b!773124))
(check-sat)
