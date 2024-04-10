; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66568 () Bool)

(assert start!66568)

(declare-fun b!767106 () Bool)

(declare-fun e!427179 () Bool)

(declare-fun e!427180 () Bool)

(assert (=> b!767106 (= e!427179 (not e!427180))))

(declare-fun res!518914 () Bool)

(assert (=> b!767106 (=> res!518914 e!427180)))

(declare-datatypes ((SeekEntryResult!7842 0))(
  ( (MissingZero!7842 (index!33736 (_ BitVec 32))) (Found!7842 (index!33737 (_ BitVec 32))) (Intermediate!7842 (undefined!8654 Bool) (index!33738 (_ BitVec 32)) (x!64652 (_ BitVec 32))) (Undefined!7842) (MissingVacant!7842 (index!33739 (_ BitVec 32))) )
))
(declare-fun lt!341234 () SeekEntryResult!7842)

(declare-fun x!1131 () (_ BitVec 32))

(get-info :version)

(assert (=> b!767106 (= res!518914 (or (not ((_ is Intermediate!7842) lt!341234)) (bvsge x!1131 (x!64652 lt!341234))))))

(declare-fun e!427181 () Bool)

(assert (=> b!767106 e!427181))

(declare-fun res!518909 () Bool)

(assert (=> b!767106 (=> (not res!518909) (not e!427181))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42278 0))(
  ( (array!42279 (arr!20242 (Array (_ BitVec 32) (_ BitVec 64))) (size!20663 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42278)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42278 (_ BitVec 32)) Bool)

(assert (=> b!767106 (= res!518909 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26410 0))(
  ( (Unit!26411) )
))
(declare-fun lt!341232 () Unit!26410)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42278 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26410)

(assert (=> b!767106 (= lt!341232 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!767107 () Bool)

(declare-fun e!427177 () Bool)

(assert (=> b!767107 (= e!427177 e!427179)))

(declare-fun res!518908 () Bool)

(assert (=> b!767107 (=> (not res!518908) (not e!427179))))

(declare-fun lt!341226 () SeekEntryResult!7842)

(assert (=> b!767107 (= res!518908 (= lt!341226 lt!341234))))

(declare-fun lt!341231 () array!42278)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!341227 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42278 (_ BitVec 32)) SeekEntryResult!7842)

(assert (=> b!767107 (= lt!341234 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!341227 lt!341231 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!767107 (= lt!341226 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!341227 mask!3328) lt!341227 lt!341231 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!767107 (= lt!341227 (select (store (arr!20242 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!767107 (= lt!341231 (array!42279 (store (arr!20242 a!3186) i!1173 k0!2102) (size!20663 a!3186)))))

(declare-fun b!767108 () Bool)

(declare-fun res!518913 () Bool)

(assert (=> b!767108 (=> (not res!518913) (not e!427177))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!767108 (= res!518913 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20242 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!767109 () Bool)

(declare-fun res!518917 () Bool)

(assert (=> b!767109 (=> (not res!518917) (not e!427177))))

(declare-fun e!427185 () Bool)

(assert (=> b!767109 (= res!518917 e!427185)))

(declare-fun c!84493 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!767109 (= c!84493 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!767110 () Bool)

(declare-fun res!518915 () Bool)

(declare-fun e!427178 () Bool)

(assert (=> b!767110 (=> (not res!518915) (not e!427178))))

(assert (=> b!767110 (= res!518915 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20663 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20663 a!3186))))))

(declare-fun res!518912 () Bool)

(declare-fun e!427184 () Bool)

(assert (=> start!66568 (=> (not res!518912) (not e!427184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66568 (= res!518912 (validMask!0 mask!3328))))

(assert (=> start!66568 e!427184))

(assert (=> start!66568 true))

(declare-fun array_inv!16038 (array!42278) Bool)

(assert (=> start!66568 (array_inv!16038 a!3186)))

(declare-fun b!767111 () Bool)

(declare-fun res!518904 () Bool)

(assert (=> b!767111 (=> (not res!518904) (not e!427184))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!767111 (= res!518904 (validKeyInArray!0 (select (arr!20242 a!3186) j!159)))))

(declare-fun e!427182 () Bool)

(declare-fun b!767112 () Bool)

(declare-fun lt!341229 () SeekEntryResult!7842)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42278 (_ BitVec 32)) SeekEntryResult!7842)

(assert (=> b!767112 (= e!427182 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20242 a!3186) j!159) a!3186 mask!3328) lt!341229))))

(declare-fun b!767113 () Bool)

(assert (=> b!767113 (= e!427178 e!427177)))

(declare-fun res!518906 () Bool)

(assert (=> b!767113 (=> (not res!518906) (not e!427177))))

(declare-fun lt!341228 () SeekEntryResult!7842)

(assert (=> b!767113 (= res!518906 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20242 a!3186) j!159) mask!3328) (select (arr!20242 a!3186) j!159) a!3186 mask!3328) lt!341228))))

(assert (=> b!767113 (= lt!341228 (Intermediate!7842 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!767114 () Bool)

(declare-fun res!518911 () Bool)

(assert (=> b!767114 (=> (not res!518911) (not e!427178))))

(declare-datatypes ((List!14244 0))(
  ( (Nil!14241) (Cons!14240 (h!15333 (_ BitVec 64)) (t!20559 List!14244)) )
))
(declare-fun arrayNoDuplicates!0 (array!42278 (_ BitVec 32) List!14244) Bool)

(assert (=> b!767114 (= res!518911 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14241))))

(declare-fun b!767115 () Bool)

(declare-fun res!518910 () Bool)

(assert (=> b!767115 (=> (not res!518910) (not e!427184))))

(assert (=> b!767115 (= res!518910 (validKeyInArray!0 k0!2102))))

(declare-fun b!767116 () Bool)

(declare-fun res!518916 () Bool)

(assert (=> b!767116 (=> (not res!518916) (not e!427184))))

(assert (=> b!767116 (= res!518916 (and (= (size!20663 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20663 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20663 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!767117 () Bool)

(assert (=> b!767117 (= e!427185 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20242 a!3186) j!159) a!3186 mask!3328) lt!341228))))

(declare-fun b!767118 () Bool)

(assert (=> b!767118 (= e!427180 true)))

(declare-fun lt!341233 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!767118 (= lt!341233 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!767119 () Bool)

(assert (=> b!767119 (= e!427181 e!427182)))

(declare-fun res!518902 () Bool)

(assert (=> b!767119 (=> (not res!518902) (not e!427182))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42278 (_ BitVec 32)) SeekEntryResult!7842)

(assert (=> b!767119 (= res!518902 (= (seekEntryOrOpen!0 (select (arr!20242 a!3186) j!159) a!3186 mask!3328) lt!341229))))

(assert (=> b!767119 (= lt!341229 (Found!7842 j!159))))

(declare-fun b!767120 () Bool)

(declare-fun res!518907 () Bool)

(assert (=> b!767120 (=> (not res!518907) (not e!427184))))

(declare-fun arrayContainsKey!0 (array!42278 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!767120 (= res!518907 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!767121 () Bool)

(assert (=> b!767121 (= e!427184 e!427178)))

(declare-fun res!518905 () Bool)

(assert (=> b!767121 (=> (not res!518905) (not e!427178))))

(declare-fun lt!341230 () SeekEntryResult!7842)

(assert (=> b!767121 (= res!518905 (or (= lt!341230 (MissingZero!7842 i!1173)) (= lt!341230 (MissingVacant!7842 i!1173))))))

(assert (=> b!767121 (= lt!341230 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!767122 () Bool)

(declare-fun res!518903 () Bool)

(assert (=> b!767122 (=> (not res!518903) (not e!427178))))

(assert (=> b!767122 (= res!518903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!767123 () Bool)

(assert (=> b!767123 (= e!427185 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20242 a!3186) j!159) a!3186 mask!3328) (Found!7842 j!159)))))

(assert (= (and start!66568 res!518912) b!767116))

(assert (= (and b!767116 res!518916) b!767111))

(assert (= (and b!767111 res!518904) b!767115))

(assert (= (and b!767115 res!518910) b!767120))

(assert (= (and b!767120 res!518907) b!767121))

(assert (= (and b!767121 res!518905) b!767122))

(assert (= (and b!767122 res!518903) b!767114))

(assert (= (and b!767114 res!518911) b!767110))

(assert (= (and b!767110 res!518915) b!767113))

(assert (= (and b!767113 res!518906) b!767108))

(assert (= (and b!767108 res!518913) b!767109))

(assert (= (and b!767109 c!84493) b!767117))

(assert (= (and b!767109 (not c!84493)) b!767123))

(assert (= (and b!767109 res!518917) b!767107))

(assert (= (and b!767107 res!518908) b!767106))

(assert (= (and b!767106 res!518909) b!767119))

(assert (= (and b!767119 res!518902) b!767112))

(assert (= (and b!767106 (not res!518914)) b!767118))

(declare-fun m!712929 () Bool)

(assert (=> b!767123 m!712929))

(assert (=> b!767123 m!712929))

(declare-fun m!712931 () Bool)

(assert (=> b!767123 m!712931))

(declare-fun m!712933 () Bool)

(assert (=> b!767108 m!712933))

(declare-fun m!712935 () Bool)

(assert (=> b!767121 m!712935))

(declare-fun m!712937 () Bool)

(assert (=> b!767118 m!712937))

(declare-fun m!712939 () Bool)

(assert (=> b!767120 m!712939))

(declare-fun m!712941 () Bool)

(assert (=> b!767114 m!712941))

(declare-fun m!712943 () Bool)

(assert (=> start!66568 m!712943))

(declare-fun m!712945 () Bool)

(assert (=> start!66568 m!712945))

(assert (=> b!767117 m!712929))

(assert (=> b!767117 m!712929))

(declare-fun m!712947 () Bool)

(assert (=> b!767117 m!712947))

(declare-fun m!712949 () Bool)

(assert (=> b!767115 m!712949))

(assert (=> b!767112 m!712929))

(assert (=> b!767112 m!712929))

(declare-fun m!712951 () Bool)

(assert (=> b!767112 m!712951))

(declare-fun m!712953 () Bool)

(assert (=> b!767122 m!712953))

(assert (=> b!767111 m!712929))

(assert (=> b!767111 m!712929))

(declare-fun m!712955 () Bool)

(assert (=> b!767111 m!712955))

(assert (=> b!767113 m!712929))

(assert (=> b!767113 m!712929))

(declare-fun m!712957 () Bool)

(assert (=> b!767113 m!712957))

(assert (=> b!767113 m!712957))

(assert (=> b!767113 m!712929))

(declare-fun m!712959 () Bool)

(assert (=> b!767113 m!712959))

(declare-fun m!712961 () Bool)

(assert (=> b!767106 m!712961))

(declare-fun m!712963 () Bool)

(assert (=> b!767106 m!712963))

(declare-fun m!712965 () Bool)

(assert (=> b!767107 m!712965))

(declare-fun m!712967 () Bool)

(assert (=> b!767107 m!712967))

(assert (=> b!767107 m!712965))

(declare-fun m!712969 () Bool)

(assert (=> b!767107 m!712969))

(declare-fun m!712971 () Bool)

(assert (=> b!767107 m!712971))

(declare-fun m!712973 () Bool)

(assert (=> b!767107 m!712973))

(assert (=> b!767119 m!712929))

(assert (=> b!767119 m!712929))

(declare-fun m!712975 () Bool)

(assert (=> b!767119 m!712975))

(check-sat (not start!66568) (not b!767122) (not b!767107) (not b!767115) (not b!767114) (not b!767117) (not b!767119) (not b!767111) (not b!767123) (not b!767120) (not b!767121) (not b!767113) (not b!767106) (not b!767118) (not b!767112))
(check-sat)
