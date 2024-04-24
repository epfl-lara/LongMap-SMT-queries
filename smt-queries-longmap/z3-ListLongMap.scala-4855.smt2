; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66946 () Bool)

(assert start!66946)

(declare-fun b!771881 () Bool)

(declare-datatypes ((Unit!26575 0))(
  ( (Unit!26576) )
))
(declare-fun e!429773 () Unit!26575)

(declare-fun Unit!26577 () Unit!26575)

(assert (=> b!771881 (= e!429773 Unit!26577)))

(declare-datatypes ((array!42388 0))(
  ( (array!42389 (arr!20290 (Array (_ BitVec 32) (_ BitVec 64))) (size!20710 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42388)

(declare-datatypes ((SeekEntryResult!7846 0))(
  ( (MissingZero!7846 (index!33752 (_ BitVec 32))) (Found!7846 (index!33753 (_ BitVec 32))) (Intermediate!7846 (undefined!8658 Bool) (index!33754 (_ BitVec 32)) (x!64836 (_ BitVec 32))) (Undefined!7846) (MissingVacant!7846 (index!33755 (_ BitVec 32))) )
))
(declare-fun lt!343608 () SeekEntryResult!7846)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!343611 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42388 (_ BitVec 32)) SeekEntryResult!7846)

(assert (=> b!771881 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343611 (select (arr!20290 a!3186) j!159) a!3186 mask!3328) lt!343608)))

(declare-fun b!771882 () Bool)

(declare-fun e!429770 () Bool)

(declare-fun e!429771 () Bool)

(assert (=> b!771882 (= e!429770 e!429771)))

(declare-fun res!522067 () Bool)

(assert (=> b!771882 (=> (not res!522067) (not e!429771))))

(declare-fun lt!343606 () SeekEntryResult!7846)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!771882 (= res!522067 (or (= lt!343606 (MissingZero!7846 i!1173)) (= lt!343606 (MissingVacant!7846 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42388 (_ BitVec 32)) SeekEntryResult!7846)

(assert (=> b!771882 (= lt!343606 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!771883 () Bool)

(declare-fun e!429769 () Bool)

(declare-fun e!429774 () Bool)

(assert (=> b!771883 (= e!429769 e!429774)))

(declare-fun res!522071 () Bool)

(assert (=> b!771883 (=> (not res!522071) (not e!429774))))

(declare-fun lt!343607 () SeekEntryResult!7846)

(declare-fun lt!343605 () SeekEntryResult!7846)

(assert (=> b!771883 (= res!522071 (= lt!343607 lt!343605))))

(declare-fun lt!343610 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!343609 () array!42388)

(assert (=> b!771883 (= lt!343605 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343610 lt!343609 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!771883 (= lt!343607 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343610 mask!3328) lt!343610 lt!343609 mask!3328))))

(assert (=> b!771883 (= lt!343610 (select (store (arr!20290 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!771883 (= lt!343609 (array!42389 (store (arr!20290 a!3186) i!1173 k0!2102) (size!20710 a!3186)))))

(declare-fun b!771884 () Bool)

(declare-fun res!522066 () Bool)

(assert (=> b!771884 (=> (not res!522066) (not e!429769))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!771884 (= res!522066 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20290 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!429768 () Bool)

(declare-fun b!771885 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun lt!343613 () SeekEntryResult!7846)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42388 (_ BitVec 32)) SeekEntryResult!7846)

(assert (=> b!771885 (= e!429768 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20290 a!3186) j!159) a!3186 mask!3328) lt!343613))))

(declare-fun b!771886 () Bool)

(assert (=> b!771886 (= e!429771 e!429769)))

(declare-fun res!522072 () Bool)

(assert (=> b!771886 (=> (not res!522072) (not e!429769))))

(assert (=> b!771886 (= res!522072 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20290 a!3186) j!159) mask!3328) (select (arr!20290 a!3186) j!159) a!3186 mask!3328) lt!343608))))

(assert (=> b!771886 (= lt!343608 (Intermediate!7846 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!771887 () Bool)

(declare-fun e!429766 () Bool)

(assert (=> b!771887 (= e!429774 (not e!429766))))

(declare-fun res!522070 () Bool)

(assert (=> b!771887 (=> res!522070 e!429766)))

(get-info :version)

(assert (=> b!771887 (= res!522070 (or (not ((_ is Intermediate!7846) lt!343605)) (bvsge x!1131 (x!64836 lt!343605))))))

(declare-fun e!429772 () Bool)

(assert (=> b!771887 e!429772))

(declare-fun res!522064 () Bool)

(assert (=> b!771887 (=> (not res!522064) (not e!429772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42388 (_ BitVec 32)) Bool)

(assert (=> b!771887 (= res!522064 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!343612 () Unit!26575)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42388 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26575)

(assert (=> b!771887 (= lt!343612 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!771888 () Bool)

(declare-fun Unit!26578 () Unit!26575)

(assert (=> b!771888 (= e!429773 Unit!26578)))

(declare-fun lt!343615 () SeekEntryResult!7846)

(assert (=> b!771888 (= lt!343615 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20290 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!771888 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343611 resIntermediateIndex!5 (select (arr!20290 a!3186) j!159) a!3186 mask!3328) (Found!7846 j!159))))

(declare-fun b!771890 () Bool)

(declare-fun res!522074 () Bool)

(assert (=> b!771890 (=> (not res!522074) (not e!429770))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!771890 (= res!522074 (validKeyInArray!0 (select (arr!20290 a!3186) j!159)))))

(declare-fun b!771891 () Bool)

(assert (=> b!771891 (= e!429772 e!429768)))

(declare-fun res!522075 () Bool)

(assert (=> b!771891 (=> (not res!522075) (not e!429768))))

(assert (=> b!771891 (= res!522075 (= (seekEntryOrOpen!0 (select (arr!20290 a!3186) j!159) a!3186 mask!3328) lt!343613))))

(assert (=> b!771891 (= lt!343613 (Found!7846 j!159))))

(declare-fun b!771892 () Bool)

(declare-fun res!522068 () Bool)

(assert (=> b!771892 (=> (not res!522068) (not e!429769))))

(declare-fun e!429775 () Bool)

(assert (=> b!771892 (= res!522068 e!429775)))

(declare-fun c!85310 () Bool)

(assert (=> b!771892 (= c!85310 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!771893 () Bool)

(assert (=> b!771893 (= e!429775 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20290 a!3186) j!159) a!3186 mask!3328) (Found!7846 j!159)))))

(declare-fun b!771894 () Bool)

(declare-fun res!522073 () Bool)

(assert (=> b!771894 (=> (not res!522073) (not e!429771))))

(declare-datatypes ((List!14199 0))(
  ( (Nil!14196) (Cons!14195 (h!15300 (_ BitVec 64)) (t!20506 List!14199)) )
))
(declare-fun arrayNoDuplicates!0 (array!42388 (_ BitVec 32) List!14199) Bool)

(assert (=> b!771894 (= res!522073 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14196))))

(declare-fun b!771895 () Bool)

(declare-fun res!522065 () Bool)

(assert (=> b!771895 (=> (not res!522065) (not e!429770))))

(declare-fun arrayContainsKey!0 (array!42388 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!771895 (= res!522065 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!771896 () Bool)

(declare-fun res!522062 () Bool)

(assert (=> b!771896 (=> (not res!522062) (not e!429770))))

(assert (=> b!771896 (= res!522062 (validKeyInArray!0 k0!2102))))

(declare-fun b!771897 () Bool)

(declare-fun res!522063 () Bool)

(assert (=> b!771897 (=> (not res!522063) (not e!429770))))

(assert (=> b!771897 (= res!522063 (and (= (size!20710 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20710 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20710 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!771898 () Bool)

(assert (=> b!771898 (= e!429775 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20290 a!3186) j!159) a!3186 mask!3328) lt!343608))))

(declare-fun b!771899 () Bool)

(declare-fun res!522060 () Bool)

(assert (=> b!771899 (=> (not res!522060) (not e!429771))))

(assert (=> b!771899 (= res!522060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!771900 () Bool)

(assert (=> b!771900 (= e!429766 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(declare-fun lt!343614 () Unit!26575)

(assert (=> b!771900 (= lt!343614 e!429773)))

(declare-fun c!85309 () Bool)

(assert (=> b!771900 (= c!85309 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!771900 (= lt!343611 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!771889 () Bool)

(declare-fun res!522061 () Bool)

(assert (=> b!771889 (=> (not res!522061) (not e!429771))))

(assert (=> b!771889 (= res!522061 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20710 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20710 a!3186))))))

(declare-fun res!522069 () Bool)

(assert (=> start!66946 (=> (not res!522069) (not e!429770))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66946 (= res!522069 (validMask!0 mask!3328))))

(assert (=> start!66946 e!429770))

(assert (=> start!66946 true))

(declare-fun array_inv!16149 (array!42388) Bool)

(assert (=> start!66946 (array_inv!16149 a!3186)))

(assert (= (and start!66946 res!522069) b!771897))

(assert (= (and b!771897 res!522063) b!771890))

(assert (= (and b!771890 res!522074) b!771896))

(assert (= (and b!771896 res!522062) b!771895))

(assert (= (and b!771895 res!522065) b!771882))

(assert (= (and b!771882 res!522067) b!771899))

(assert (= (and b!771899 res!522060) b!771894))

(assert (= (and b!771894 res!522073) b!771889))

(assert (= (and b!771889 res!522061) b!771886))

(assert (= (and b!771886 res!522072) b!771884))

(assert (= (and b!771884 res!522066) b!771892))

(assert (= (and b!771892 c!85310) b!771898))

(assert (= (and b!771892 (not c!85310)) b!771893))

(assert (= (and b!771892 res!522068) b!771883))

(assert (= (and b!771883 res!522071) b!771887))

(assert (= (and b!771887 res!522064) b!771891))

(assert (= (and b!771891 res!522075) b!771885))

(assert (= (and b!771887 (not res!522070)) b!771900))

(assert (= (and b!771900 c!85309) b!771881))

(assert (= (and b!771900 (not c!85309)) b!771888))

(declare-fun m!717455 () Bool)

(assert (=> b!771893 m!717455))

(assert (=> b!771893 m!717455))

(declare-fun m!717457 () Bool)

(assert (=> b!771893 m!717457))

(declare-fun m!717459 () Bool)

(assert (=> b!771883 m!717459))

(declare-fun m!717461 () Bool)

(assert (=> b!771883 m!717461))

(declare-fun m!717463 () Bool)

(assert (=> b!771883 m!717463))

(declare-fun m!717465 () Bool)

(assert (=> b!771883 m!717465))

(assert (=> b!771883 m!717463))

(declare-fun m!717467 () Bool)

(assert (=> b!771883 m!717467))

(declare-fun m!717469 () Bool)

(assert (=> b!771895 m!717469))

(assert (=> b!771881 m!717455))

(assert (=> b!771881 m!717455))

(declare-fun m!717471 () Bool)

(assert (=> b!771881 m!717471))

(declare-fun m!717473 () Bool)

(assert (=> b!771900 m!717473))

(declare-fun m!717475 () Bool)

(assert (=> b!771884 m!717475))

(declare-fun m!717477 () Bool)

(assert (=> b!771899 m!717477))

(assert (=> b!771886 m!717455))

(assert (=> b!771886 m!717455))

(declare-fun m!717479 () Bool)

(assert (=> b!771886 m!717479))

(assert (=> b!771886 m!717479))

(assert (=> b!771886 m!717455))

(declare-fun m!717481 () Bool)

(assert (=> b!771886 m!717481))

(declare-fun m!717483 () Bool)

(assert (=> b!771882 m!717483))

(declare-fun m!717485 () Bool)

(assert (=> start!66946 m!717485))

(declare-fun m!717487 () Bool)

(assert (=> start!66946 m!717487))

(assert (=> b!771890 m!717455))

(assert (=> b!771890 m!717455))

(declare-fun m!717489 () Bool)

(assert (=> b!771890 m!717489))

(assert (=> b!771891 m!717455))

(assert (=> b!771891 m!717455))

(declare-fun m!717491 () Bool)

(assert (=> b!771891 m!717491))

(declare-fun m!717493 () Bool)

(assert (=> b!771894 m!717493))

(assert (=> b!771885 m!717455))

(assert (=> b!771885 m!717455))

(declare-fun m!717495 () Bool)

(assert (=> b!771885 m!717495))

(declare-fun m!717497 () Bool)

(assert (=> b!771887 m!717497))

(declare-fun m!717499 () Bool)

(assert (=> b!771887 m!717499))

(assert (=> b!771888 m!717455))

(assert (=> b!771888 m!717455))

(assert (=> b!771888 m!717457))

(assert (=> b!771888 m!717455))

(declare-fun m!717501 () Bool)

(assert (=> b!771888 m!717501))

(assert (=> b!771898 m!717455))

(assert (=> b!771898 m!717455))

(declare-fun m!717503 () Bool)

(assert (=> b!771898 m!717503))

(declare-fun m!717505 () Bool)

(assert (=> b!771896 m!717505))

(check-sat (not b!771891) (not b!771886) (not b!771899) (not b!771898) (not b!771881) (not start!66946) (not b!771900) (not b!771895) (not b!771896) (not b!771893) (not b!771885) (not b!771887) (not b!771882) (not b!771890) (not b!771894) (not b!771888) (not b!771883))
(check-sat)
(get-model)

(declare-fun b!772039 () Bool)

(declare-fun e!429847 () Bool)

(declare-fun lt!343686 () SeekEntryResult!7846)

(assert (=> b!772039 (= e!429847 (bvsge (x!64836 lt!343686) #b01111111111111111111111111111110))))

(declare-fun b!772041 () Bool)

(declare-fun e!429846 () SeekEntryResult!7846)

(assert (=> b!772041 (= e!429846 (Intermediate!7846 true lt!343611 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun b!772042 () Bool)

(assert (=> b!772042 (and (bvsge (index!33754 lt!343686) #b00000000000000000000000000000000) (bvslt (index!33754 lt!343686) (size!20710 a!3186)))))

(declare-fun res!522179 () Bool)

(assert (=> b!772042 (= res!522179 (= (select (arr!20290 a!3186) (index!33754 lt!343686)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!429849 () Bool)

(assert (=> b!772042 (=> res!522179 e!429849)))

(declare-fun b!772043 () Bool)

(declare-fun e!429850 () Bool)

(assert (=> b!772043 (= e!429847 e!429850)))

(declare-fun res!522180 () Bool)

(assert (=> b!772043 (= res!522180 (and ((_ is Intermediate!7846) lt!343686) (not (undefined!8658 lt!343686)) (bvslt (x!64836 lt!343686) #b01111111111111111111111111111110) (bvsge (x!64836 lt!343686) #b00000000000000000000000000000000) (bvsge (x!64836 lt!343686) (bvadd #b00000000000000000000000000000001 x!1131))))))

(assert (=> b!772043 (=> (not res!522180) (not e!429850))))

(declare-fun b!772044 () Bool)

(declare-fun e!429848 () SeekEntryResult!7846)

(assert (=> b!772044 (= e!429848 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!343611 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) mask!3328) (select (arr!20290 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!772045 () Bool)

(assert (=> b!772045 (and (bvsge (index!33754 lt!343686) #b00000000000000000000000000000000) (bvslt (index!33754 lt!343686) (size!20710 a!3186)))))

(declare-fun res!522178 () Bool)

(assert (=> b!772045 (= res!522178 (= (select (arr!20290 a!3186) (index!33754 lt!343686)) (select (arr!20290 a!3186) j!159)))))

(assert (=> b!772045 (=> res!522178 e!429849)))

(assert (=> b!772045 (= e!429850 e!429849)))

(declare-fun b!772040 () Bool)

(assert (=> b!772040 (= e!429846 e!429848)))

(declare-fun c!85330 () Bool)

(declare-fun lt!343687 () (_ BitVec 64))

(assert (=> b!772040 (= c!85330 (or (= lt!343687 (select (arr!20290 a!3186) j!159)) (= (bvadd lt!343687 lt!343687) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!101945 () Bool)

(assert (=> d!101945 e!429847))

(declare-fun c!85331 () Bool)

(assert (=> d!101945 (= c!85331 (and ((_ is Intermediate!7846) lt!343686) (undefined!8658 lt!343686)))))

(assert (=> d!101945 (= lt!343686 e!429846)))

(declare-fun c!85329 () Bool)

(assert (=> d!101945 (= c!85329 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(assert (=> d!101945 (= lt!343687 (select (arr!20290 a!3186) lt!343611))))

(assert (=> d!101945 (validMask!0 mask!3328)))

(assert (=> d!101945 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343611 (select (arr!20290 a!3186) j!159) a!3186 mask!3328) lt!343686)))

(declare-fun b!772046 () Bool)

(assert (=> b!772046 (and (bvsge (index!33754 lt!343686) #b00000000000000000000000000000000) (bvslt (index!33754 lt!343686) (size!20710 a!3186)))))

(assert (=> b!772046 (= e!429849 (= (select (arr!20290 a!3186) (index!33754 lt!343686)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!772047 () Bool)

(assert (=> b!772047 (= e!429848 (Intermediate!7846 false lt!343611 (bvadd #b00000000000000000000000000000001 x!1131)))))

(assert (= (and d!101945 c!85329) b!772041))

(assert (= (and d!101945 (not c!85329)) b!772040))

(assert (= (and b!772040 c!85330) b!772047))

(assert (= (and b!772040 (not c!85330)) b!772044))

(assert (= (and d!101945 c!85331) b!772039))

(assert (= (and d!101945 (not c!85331)) b!772043))

(assert (= (and b!772043 res!522180) b!772045))

(assert (= (and b!772045 (not res!522178)) b!772042))

(assert (= (and b!772042 (not res!522179)) b!772046))

(declare-fun m!717611 () Bool)

(assert (=> b!772046 m!717611))

(declare-fun m!717613 () Bool)

(assert (=> d!101945 m!717613))

(assert (=> d!101945 m!717485))

(assert (=> b!772042 m!717611))

(assert (=> b!772045 m!717611))

(declare-fun m!717615 () Bool)

(assert (=> b!772044 m!717615))

(assert (=> b!772044 m!717615))

(assert (=> b!772044 m!717455))

(declare-fun m!717617 () Bool)

(assert (=> b!772044 m!717617))

(assert (=> b!771881 d!101945))

(declare-fun b!772060 () Bool)

(declare-fun e!429859 () SeekEntryResult!7846)

(declare-fun lt!343694 () SeekEntryResult!7846)

(assert (=> b!772060 (= e!429859 (Found!7846 (index!33754 lt!343694)))))

(declare-fun d!101947 () Bool)

(declare-fun lt!343695 () SeekEntryResult!7846)

(assert (=> d!101947 (and (or ((_ is Undefined!7846) lt!343695) (not ((_ is Found!7846) lt!343695)) (and (bvsge (index!33753 lt!343695) #b00000000000000000000000000000000) (bvslt (index!33753 lt!343695) (size!20710 a!3186)))) (or ((_ is Undefined!7846) lt!343695) ((_ is Found!7846) lt!343695) (not ((_ is MissingZero!7846) lt!343695)) (and (bvsge (index!33752 lt!343695) #b00000000000000000000000000000000) (bvslt (index!33752 lt!343695) (size!20710 a!3186)))) (or ((_ is Undefined!7846) lt!343695) ((_ is Found!7846) lt!343695) ((_ is MissingZero!7846) lt!343695) (not ((_ is MissingVacant!7846) lt!343695)) (and (bvsge (index!33755 lt!343695) #b00000000000000000000000000000000) (bvslt (index!33755 lt!343695) (size!20710 a!3186)))) (or ((_ is Undefined!7846) lt!343695) (ite ((_ is Found!7846) lt!343695) (= (select (arr!20290 a!3186) (index!33753 lt!343695)) (select (arr!20290 a!3186) j!159)) (ite ((_ is MissingZero!7846) lt!343695) (= (select (arr!20290 a!3186) (index!33752 lt!343695)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7846) lt!343695) (= (select (arr!20290 a!3186) (index!33755 lt!343695)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!429858 () SeekEntryResult!7846)

(assert (=> d!101947 (= lt!343695 e!429858)))

(declare-fun c!85339 () Bool)

(assert (=> d!101947 (= c!85339 (and ((_ is Intermediate!7846) lt!343694) (undefined!8658 lt!343694)))))

(assert (=> d!101947 (= lt!343694 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20290 a!3186) j!159) mask!3328) (select (arr!20290 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!101947 (validMask!0 mask!3328)))

(assert (=> d!101947 (= (seekEntryOrOpen!0 (select (arr!20290 a!3186) j!159) a!3186 mask!3328) lt!343695)))

(declare-fun b!772061 () Bool)

(declare-fun e!429857 () SeekEntryResult!7846)

(assert (=> b!772061 (= e!429857 (MissingZero!7846 (index!33754 lt!343694)))))

(declare-fun b!772062 () Bool)

(declare-fun c!85340 () Bool)

(declare-fun lt!343696 () (_ BitVec 64))

(assert (=> b!772062 (= c!85340 (= lt!343696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!772062 (= e!429859 e!429857)))

(declare-fun b!772063 () Bool)

(assert (=> b!772063 (= e!429858 e!429859)))

(assert (=> b!772063 (= lt!343696 (select (arr!20290 a!3186) (index!33754 lt!343694)))))

(declare-fun c!85338 () Bool)

(assert (=> b!772063 (= c!85338 (= lt!343696 (select (arr!20290 a!3186) j!159)))))

(declare-fun b!772064 () Bool)

(assert (=> b!772064 (= e!429857 (seekKeyOrZeroReturnVacant!0 (x!64836 lt!343694) (index!33754 lt!343694) (index!33754 lt!343694) (select (arr!20290 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!772065 () Bool)

(assert (=> b!772065 (= e!429858 Undefined!7846)))

(assert (= (and d!101947 c!85339) b!772065))

(assert (= (and d!101947 (not c!85339)) b!772063))

(assert (= (and b!772063 c!85338) b!772060))

(assert (= (and b!772063 (not c!85338)) b!772062))

(assert (= (and b!772062 c!85340) b!772061))

(assert (= (and b!772062 (not c!85340)) b!772064))

(assert (=> d!101947 m!717455))

(assert (=> d!101947 m!717479))

(declare-fun m!717619 () Bool)

(assert (=> d!101947 m!717619))

(assert (=> d!101947 m!717479))

(assert (=> d!101947 m!717455))

(assert (=> d!101947 m!717481))

(assert (=> d!101947 m!717485))

(declare-fun m!717621 () Bool)

(assert (=> d!101947 m!717621))

(declare-fun m!717623 () Bool)

(assert (=> d!101947 m!717623))

(declare-fun m!717625 () Bool)

(assert (=> b!772063 m!717625))

(assert (=> b!772064 m!717455))

(declare-fun m!717627 () Bool)

(assert (=> b!772064 m!717627))

(assert (=> b!771891 d!101947))

(declare-fun e!429867 () SeekEntryResult!7846)

(declare-fun b!772078 () Bool)

(assert (=> b!772078 (= e!429867 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20290 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!101951 () Bool)

(declare-fun lt!343701 () SeekEntryResult!7846)

(assert (=> d!101951 (and (or ((_ is Undefined!7846) lt!343701) (not ((_ is Found!7846) lt!343701)) (and (bvsge (index!33753 lt!343701) #b00000000000000000000000000000000) (bvslt (index!33753 lt!343701) (size!20710 a!3186)))) (or ((_ is Undefined!7846) lt!343701) ((_ is Found!7846) lt!343701) (not ((_ is MissingVacant!7846) lt!343701)) (not (= (index!33755 lt!343701) resIntermediateIndex!5)) (and (bvsge (index!33755 lt!343701) #b00000000000000000000000000000000) (bvslt (index!33755 lt!343701) (size!20710 a!3186)))) (or ((_ is Undefined!7846) lt!343701) (ite ((_ is Found!7846) lt!343701) (= (select (arr!20290 a!3186) (index!33753 lt!343701)) (select (arr!20290 a!3186) j!159)) (and ((_ is MissingVacant!7846) lt!343701) (= (index!33755 lt!343701) resIntermediateIndex!5) (= (select (arr!20290 a!3186) (index!33755 lt!343701)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!429868 () SeekEntryResult!7846)

(assert (=> d!101951 (= lt!343701 e!429868)))

(declare-fun c!85348 () Bool)

(assert (=> d!101951 (= c!85348 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!343702 () (_ BitVec 64))

(assert (=> d!101951 (= lt!343702 (select (arr!20290 a!3186) index!1321))))

(assert (=> d!101951 (validMask!0 mask!3328)))

(assert (=> d!101951 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20290 a!3186) j!159) a!3186 mask!3328) lt!343701)))

(declare-fun b!772079 () Bool)

(declare-fun e!429866 () SeekEntryResult!7846)

(assert (=> b!772079 (= e!429868 e!429866)))

(declare-fun c!85349 () Bool)

(assert (=> b!772079 (= c!85349 (= lt!343702 (select (arr!20290 a!3186) j!159)))))

(declare-fun b!772080 () Bool)

(assert (=> b!772080 (= e!429866 (Found!7846 index!1321))))

(declare-fun b!772081 () Bool)

(assert (=> b!772081 (= e!429867 (MissingVacant!7846 resIntermediateIndex!5))))

(declare-fun b!772082 () Bool)

(declare-fun c!85347 () Bool)

(assert (=> b!772082 (= c!85347 (= lt!343702 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!772082 (= e!429866 e!429867)))

(declare-fun b!772083 () Bool)

(assert (=> b!772083 (= e!429868 Undefined!7846)))

(assert (= (and d!101951 c!85348) b!772083))

(assert (= (and d!101951 (not c!85348)) b!772079))

(assert (= (and b!772079 c!85349) b!772080))

(assert (= (and b!772079 (not c!85349)) b!772082))

(assert (= (and b!772082 c!85347) b!772081))

(assert (= (and b!772082 (not c!85347)) b!772078))

(declare-fun m!717629 () Bool)

(assert (=> b!772078 m!717629))

(assert (=> b!772078 m!717629))

(assert (=> b!772078 m!717455))

(declare-fun m!717631 () Bool)

(assert (=> b!772078 m!717631))

(declare-fun m!717633 () Bool)

(assert (=> d!101951 m!717633))

(declare-fun m!717635 () Bool)

(assert (=> d!101951 m!717635))

(declare-fun m!717637 () Bool)

(assert (=> d!101951 m!717637))

(assert (=> d!101951 m!717485))

(assert (=> b!771893 d!101951))

(declare-fun b!772092 () Bool)

(declare-fun e!429875 () SeekEntryResult!7846)

(declare-fun lt!343707 () SeekEntryResult!7846)

(assert (=> b!772092 (= e!429875 (Found!7846 (index!33754 lt!343707)))))

(declare-fun d!101955 () Bool)

(declare-fun lt!343708 () SeekEntryResult!7846)

(assert (=> d!101955 (and (or ((_ is Undefined!7846) lt!343708) (not ((_ is Found!7846) lt!343708)) (and (bvsge (index!33753 lt!343708) #b00000000000000000000000000000000) (bvslt (index!33753 lt!343708) (size!20710 a!3186)))) (or ((_ is Undefined!7846) lt!343708) ((_ is Found!7846) lt!343708) (not ((_ is MissingZero!7846) lt!343708)) (and (bvsge (index!33752 lt!343708) #b00000000000000000000000000000000) (bvslt (index!33752 lt!343708) (size!20710 a!3186)))) (or ((_ is Undefined!7846) lt!343708) ((_ is Found!7846) lt!343708) ((_ is MissingZero!7846) lt!343708) (not ((_ is MissingVacant!7846) lt!343708)) (and (bvsge (index!33755 lt!343708) #b00000000000000000000000000000000) (bvslt (index!33755 lt!343708) (size!20710 a!3186)))) (or ((_ is Undefined!7846) lt!343708) (ite ((_ is Found!7846) lt!343708) (= (select (arr!20290 a!3186) (index!33753 lt!343708)) k0!2102) (ite ((_ is MissingZero!7846) lt!343708) (= (select (arr!20290 a!3186) (index!33752 lt!343708)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7846) lt!343708) (= (select (arr!20290 a!3186) (index!33755 lt!343708)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!429874 () SeekEntryResult!7846)

(assert (=> d!101955 (= lt!343708 e!429874)))

(declare-fun c!85355 () Bool)

(assert (=> d!101955 (= c!85355 (and ((_ is Intermediate!7846) lt!343707) (undefined!8658 lt!343707)))))

(assert (=> d!101955 (= lt!343707 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!101955 (validMask!0 mask!3328)))

(assert (=> d!101955 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!343708)))

(declare-fun b!772093 () Bool)

(declare-fun e!429873 () SeekEntryResult!7846)

(assert (=> b!772093 (= e!429873 (MissingZero!7846 (index!33754 lt!343707)))))

(declare-fun b!772094 () Bool)

(declare-fun c!85356 () Bool)

(declare-fun lt!343709 () (_ BitVec 64))

(assert (=> b!772094 (= c!85356 (= lt!343709 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!772094 (= e!429875 e!429873)))

(declare-fun b!772095 () Bool)

(assert (=> b!772095 (= e!429874 e!429875)))

(assert (=> b!772095 (= lt!343709 (select (arr!20290 a!3186) (index!33754 lt!343707)))))

(declare-fun c!85354 () Bool)

(assert (=> b!772095 (= c!85354 (= lt!343709 k0!2102))))

(declare-fun b!772096 () Bool)

(assert (=> b!772096 (= e!429873 (seekKeyOrZeroReturnVacant!0 (x!64836 lt!343707) (index!33754 lt!343707) (index!33754 lt!343707) k0!2102 a!3186 mask!3328))))

(declare-fun b!772097 () Bool)

(assert (=> b!772097 (= e!429874 Undefined!7846)))

(assert (= (and d!101955 c!85355) b!772097))

(assert (= (and d!101955 (not c!85355)) b!772095))

(assert (= (and b!772095 c!85354) b!772092))

(assert (= (and b!772095 (not c!85354)) b!772094))

(assert (= (and b!772094 c!85356) b!772093))

(assert (= (and b!772094 (not c!85356)) b!772096))

(declare-fun m!717639 () Bool)

(assert (=> d!101955 m!717639))

(declare-fun m!717641 () Bool)

(assert (=> d!101955 m!717641))

(assert (=> d!101955 m!717639))

(declare-fun m!717643 () Bool)

(assert (=> d!101955 m!717643))

(assert (=> d!101955 m!717485))

(declare-fun m!717645 () Bool)

(assert (=> d!101955 m!717645))

(declare-fun m!717647 () Bool)

(assert (=> d!101955 m!717647))

(declare-fun m!717649 () Bool)

(assert (=> b!772095 m!717649))

(declare-fun m!717651 () Bool)

(assert (=> b!772096 m!717651))

(assert (=> b!771882 d!101955))

(declare-fun d!101957 () Bool)

(assert (=> d!101957 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!66946 d!101957))

(declare-fun d!101965 () Bool)

(assert (=> d!101965 (= (array_inv!16149 a!3186) (bvsge (size!20710 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!66946 d!101965))

(declare-fun b!772117 () Bool)

(declare-fun e!429888 () Bool)

(declare-fun lt!343712 () SeekEntryResult!7846)

(assert (=> b!772117 (= e!429888 (bvsge (x!64836 lt!343712) #b01111111111111111111111111111110))))

(declare-fun b!772119 () Bool)

(declare-fun e!429887 () SeekEntryResult!7846)

(assert (=> b!772119 (= e!429887 (Intermediate!7846 true index!1321 x!1131))))

(declare-fun b!772120 () Bool)

(assert (=> b!772120 (and (bvsge (index!33754 lt!343712) #b00000000000000000000000000000000) (bvslt (index!33754 lt!343712) (size!20710 lt!343609)))))

(declare-fun res!522191 () Bool)

(assert (=> b!772120 (= res!522191 (= (select (arr!20290 lt!343609) (index!33754 lt!343712)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!429890 () Bool)

(assert (=> b!772120 (=> res!522191 e!429890)))

(declare-fun b!772121 () Bool)

(declare-fun e!429891 () Bool)

(assert (=> b!772121 (= e!429888 e!429891)))

(declare-fun res!522192 () Bool)

(assert (=> b!772121 (= res!522192 (and ((_ is Intermediate!7846) lt!343712) (not (undefined!8658 lt!343712)) (bvslt (x!64836 lt!343712) #b01111111111111111111111111111110) (bvsge (x!64836 lt!343712) #b00000000000000000000000000000000) (bvsge (x!64836 lt!343712) x!1131)))))

(assert (=> b!772121 (=> (not res!522192) (not e!429891))))

(declare-fun e!429889 () SeekEntryResult!7846)

(declare-fun b!772122 () Bool)

(assert (=> b!772122 (= e!429889 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) lt!343610 lt!343609 mask!3328))))

(declare-fun b!772123 () Bool)

(assert (=> b!772123 (and (bvsge (index!33754 lt!343712) #b00000000000000000000000000000000) (bvslt (index!33754 lt!343712) (size!20710 lt!343609)))))

(declare-fun res!522190 () Bool)

(assert (=> b!772123 (= res!522190 (= (select (arr!20290 lt!343609) (index!33754 lt!343712)) lt!343610))))

(assert (=> b!772123 (=> res!522190 e!429890)))

(assert (=> b!772123 (= e!429891 e!429890)))

(declare-fun b!772118 () Bool)

(assert (=> b!772118 (= e!429887 e!429889)))

(declare-fun c!85363 () Bool)

(declare-fun lt!343713 () (_ BitVec 64))

(assert (=> b!772118 (= c!85363 (or (= lt!343713 lt!343610) (= (bvadd lt!343713 lt!343713) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!101967 () Bool)

(assert (=> d!101967 e!429888))

(declare-fun c!85364 () Bool)

(assert (=> d!101967 (= c!85364 (and ((_ is Intermediate!7846) lt!343712) (undefined!8658 lt!343712)))))

(assert (=> d!101967 (= lt!343712 e!429887)))

(declare-fun c!85362 () Bool)

(assert (=> d!101967 (= c!85362 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101967 (= lt!343713 (select (arr!20290 lt!343609) index!1321))))

(assert (=> d!101967 (validMask!0 mask!3328)))

(assert (=> d!101967 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343610 lt!343609 mask!3328) lt!343712)))

(declare-fun b!772124 () Bool)

(assert (=> b!772124 (and (bvsge (index!33754 lt!343712) #b00000000000000000000000000000000) (bvslt (index!33754 lt!343712) (size!20710 lt!343609)))))

(assert (=> b!772124 (= e!429890 (= (select (arr!20290 lt!343609) (index!33754 lt!343712)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!772125 () Bool)

(assert (=> b!772125 (= e!429889 (Intermediate!7846 false index!1321 x!1131))))

(assert (= (and d!101967 c!85362) b!772119))

(assert (= (and d!101967 (not c!85362)) b!772118))

(assert (= (and b!772118 c!85363) b!772125))

(assert (= (and b!772118 (not c!85363)) b!772122))

(assert (= (and d!101967 c!85364) b!772117))

(assert (= (and d!101967 (not c!85364)) b!772121))

(assert (= (and b!772121 res!522192) b!772123))

(assert (= (and b!772123 (not res!522190)) b!772120))

(assert (= (and b!772120 (not res!522191)) b!772124))

(declare-fun m!717661 () Bool)

(assert (=> b!772124 m!717661))

(declare-fun m!717663 () Bool)

(assert (=> d!101967 m!717663))

(assert (=> d!101967 m!717485))

(assert (=> b!772120 m!717661))

(assert (=> b!772123 m!717661))

(assert (=> b!772122 m!717629))

(assert (=> b!772122 m!717629))

(declare-fun m!717665 () Bool)

(assert (=> b!772122 m!717665))

(assert (=> b!771883 d!101967))

(declare-fun b!772126 () Bool)

(declare-fun e!429893 () Bool)

(declare-fun lt!343714 () SeekEntryResult!7846)

(assert (=> b!772126 (= e!429893 (bvsge (x!64836 lt!343714) #b01111111111111111111111111111110))))

(declare-fun b!772128 () Bool)

(declare-fun e!429892 () SeekEntryResult!7846)

(assert (=> b!772128 (= e!429892 (Intermediate!7846 true (toIndex!0 lt!343610 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!772129 () Bool)

(assert (=> b!772129 (and (bvsge (index!33754 lt!343714) #b00000000000000000000000000000000) (bvslt (index!33754 lt!343714) (size!20710 lt!343609)))))

(declare-fun res!522194 () Bool)

(assert (=> b!772129 (= res!522194 (= (select (arr!20290 lt!343609) (index!33754 lt!343714)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!429895 () Bool)

(assert (=> b!772129 (=> res!522194 e!429895)))

(declare-fun b!772130 () Bool)

(declare-fun e!429896 () Bool)

(assert (=> b!772130 (= e!429893 e!429896)))

(declare-fun res!522195 () Bool)

(assert (=> b!772130 (= res!522195 (and ((_ is Intermediate!7846) lt!343714) (not (undefined!8658 lt!343714)) (bvslt (x!64836 lt!343714) #b01111111111111111111111111111110) (bvsge (x!64836 lt!343714) #b00000000000000000000000000000000) (bvsge (x!64836 lt!343714) #b00000000000000000000000000000000)))))

(assert (=> b!772130 (=> (not res!522195) (not e!429896))))

(declare-fun e!429894 () SeekEntryResult!7846)

(declare-fun b!772131 () Bool)

(assert (=> b!772131 (= e!429894 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!343610 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) lt!343610 lt!343609 mask!3328))))

(declare-fun b!772132 () Bool)

(assert (=> b!772132 (and (bvsge (index!33754 lt!343714) #b00000000000000000000000000000000) (bvslt (index!33754 lt!343714) (size!20710 lt!343609)))))

(declare-fun res!522193 () Bool)

(assert (=> b!772132 (= res!522193 (= (select (arr!20290 lt!343609) (index!33754 lt!343714)) lt!343610))))

(assert (=> b!772132 (=> res!522193 e!429895)))

(assert (=> b!772132 (= e!429896 e!429895)))

(declare-fun b!772127 () Bool)

(assert (=> b!772127 (= e!429892 e!429894)))

(declare-fun c!85366 () Bool)

(declare-fun lt!343715 () (_ BitVec 64))

(assert (=> b!772127 (= c!85366 (or (= lt!343715 lt!343610) (= (bvadd lt!343715 lt!343715) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!101969 () Bool)

(assert (=> d!101969 e!429893))

(declare-fun c!85367 () Bool)

(assert (=> d!101969 (= c!85367 (and ((_ is Intermediate!7846) lt!343714) (undefined!8658 lt!343714)))))

(assert (=> d!101969 (= lt!343714 e!429892)))

(declare-fun c!85365 () Bool)

(assert (=> d!101969 (= c!85365 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!101969 (= lt!343715 (select (arr!20290 lt!343609) (toIndex!0 lt!343610 mask!3328)))))

(assert (=> d!101969 (validMask!0 mask!3328)))

(assert (=> d!101969 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343610 mask!3328) lt!343610 lt!343609 mask!3328) lt!343714)))

(declare-fun b!772133 () Bool)

(assert (=> b!772133 (and (bvsge (index!33754 lt!343714) #b00000000000000000000000000000000) (bvslt (index!33754 lt!343714) (size!20710 lt!343609)))))

(assert (=> b!772133 (= e!429895 (= (select (arr!20290 lt!343609) (index!33754 lt!343714)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!772134 () Bool)

(assert (=> b!772134 (= e!429894 (Intermediate!7846 false (toIndex!0 lt!343610 mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!101969 c!85365) b!772128))

(assert (= (and d!101969 (not c!85365)) b!772127))

(assert (= (and b!772127 c!85366) b!772134))

(assert (= (and b!772127 (not c!85366)) b!772131))

(assert (= (and d!101969 c!85367) b!772126))

(assert (= (and d!101969 (not c!85367)) b!772130))

(assert (= (and b!772130 res!522195) b!772132))

(assert (= (and b!772132 (not res!522193)) b!772129))

(assert (= (and b!772129 (not res!522194)) b!772133))

(declare-fun m!717667 () Bool)

(assert (=> b!772133 m!717667))

(assert (=> d!101969 m!717463))

(declare-fun m!717669 () Bool)

(assert (=> d!101969 m!717669))

(assert (=> d!101969 m!717485))

(assert (=> b!772129 m!717667))

(assert (=> b!772132 m!717667))

(assert (=> b!772131 m!717463))

(declare-fun m!717671 () Bool)

(assert (=> b!772131 m!717671))

(assert (=> b!772131 m!717671))

(declare-fun m!717673 () Bool)

(assert (=> b!772131 m!717673))

(assert (=> b!771883 d!101969))

(declare-fun d!101971 () Bool)

(declare-fun lt!343721 () (_ BitVec 32))

(declare-fun lt!343720 () (_ BitVec 32))

(assert (=> d!101971 (= lt!343721 (bvmul (bvxor lt!343720 (bvlshr lt!343720 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101971 (= lt!343720 ((_ extract 31 0) (bvand (bvxor lt!343610 (bvlshr lt!343610 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101971 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!522196 (let ((h!15303 ((_ extract 31 0) (bvand (bvxor lt!343610 (bvlshr lt!343610 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64842 (bvmul (bvxor h!15303 (bvlshr h!15303 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64842 (bvlshr x!64842 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!522196 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!522196 #b00000000000000000000000000000000))))))

(assert (=> d!101971 (= (toIndex!0 lt!343610 mask!3328) (bvand (bvxor lt!343721 (bvlshr lt!343721 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!771883 d!101971))

(declare-fun b!772157 () Bool)

(declare-fun e!429913 () Bool)

(declare-fun call!35139 () Bool)

(assert (=> b!772157 (= e!429913 call!35139)))

(declare-fun b!772158 () Bool)

(declare-fun e!429912 () Bool)

(declare-fun contains!4069 (List!14199 (_ BitVec 64)) Bool)

(assert (=> b!772158 (= e!429912 (contains!4069 Nil!14196 (select (arr!20290 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!772159 () Bool)

(declare-fun e!429911 () Bool)

(assert (=> b!772159 (= e!429911 e!429913)))

(declare-fun c!85376 () Bool)

(assert (=> b!772159 (= c!85376 (validKeyInArray!0 (select (arr!20290 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!772160 () Bool)

(declare-fun e!429914 () Bool)

(assert (=> b!772160 (= e!429914 e!429911)))

(declare-fun res!522203 () Bool)

(assert (=> b!772160 (=> (not res!522203) (not e!429911))))

(assert (=> b!772160 (= res!522203 (not e!429912))))

(declare-fun res!522204 () Bool)

(assert (=> b!772160 (=> (not res!522204) (not e!429912))))

(assert (=> b!772160 (= res!522204 (validKeyInArray!0 (select (arr!20290 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!772161 () Bool)

(assert (=> b!772161 (= e!429913 call!35139)))

(declare-fun d!101973 () Bool)

(declare-fun res!522205 () Bool)

(assert (=> d!101973 (=> res!522205 e!429914)))

(assert (=> d!101973 (= res!522205 (bvsge #b00000000000000000000000000000000 (size!20710 a!3186)))))

(assert (=> d!101973 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14196) e!429914)))

(declare-fun bm!35136 () Bool)

(assert (=> bm!35136 (= call!35139 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!85376 (Cons!14195 (select (arr!20290 a!3186) #b00000000000000000000000000000000) Nil!14196) Nil!14196)))))

(assert (= (and d!101973 (not res!522205)) b!772160))

(assert (= (and b!772160 res!522204) b!772158))

(assert (= (and b!772160 res!522203) b!772159))

(assert (= (and b!772159 c!85376) b!772161))

(assert (= (and b!772159 (not c!85376)) b!772157))

(assert (= (or b!772161 b!772157) bm!35136))

(declare-fun m!717675 () Bool)

(assert (=> b!772158 m!717675))

(assert (=> b!772158 m!717675))

(declare-fun m!717677 () Bool)

(assert (=> b!772158 m!717677))

(assert (=> b!772159 m!717675))

(assert (=> b!772159 m!717675))

(declare-fun m!717679 () Bool)

(assert (=> b!772159 m!717679))

(assert (=> b!772160 m!717675))

(assert (=> b!772160 m!717675))

(assert (=> b!772160 m!717679))

(assert (=> bm!35136 m!717675))

(declare-fun m!717681 () Bool)

(assert (=> bm!35136 m!717681))

(assert (=> b!771894 d!101973))

(declare-fun b!772166 () Bool)

(declare-fun e!429918 () SeekEntryResult!7846)

(assert (=> b!772166 (= e!429918 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20290 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!343732 () SeekEntryResult!7846)

(declare-fun d!101975 () Bool)

(assert (=> d!101975 (and (or ((_ is Undefined!7846) lt!343732) (not ((_ is Found!7846) lt!343732)) (and (bvsge (index!33753 lt!343732) #b00000000000000000000000000000000) (bvslt (index!33753 lt!343732) (size!20710 a!3186)))) (or ((_ is Undefined!7846) lt!343732) ((_ is Found!7846) lt!343732) (not ((_ is MissingVacant!7846) lt!343732)) (not (= (index!33755 lt!343732) resIntermediateIndex!5)) (and (bvsge (index!33755 lt!343732) #b00000000000000000000000000000000) (bvslt (index!33755 lt!343732) (size!20710 a!3186)))) (or ((_ is Undefined!7846) lt!343732) (ite ((_ is Found!7846) lt!343732) (= (select (arr!20290 a!3186) (index!33753 lt!343732)) (select (arr!20290 a!3186) j!159)) (and ((_ is MissingVacant!7846) lt!343732) (= (index!33755 lt!343732) resIntermediateIndex!5) (= (select (arr!20290 a!3186) (index!33755 lt!343732)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!429919 () SeekEntryResult!7846)

(assert (=> d!101975 (= lt!343732 e!429919)))

(declare-fun c!85380 () Bool)

(assert (=> d!101975 (= c!85380 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(declare-fun lt!343733 () (_ BitVec 64))

(assert (=> d!101975 (= lt!343733 (select (arr!20290 a!3186) resIntermediateIndex!5))))

(assert (=> d!101975 (validMask!0 mask!3328)))

(assert (=> d!101975 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20290 a!3186) j!159) a!3186 mask!3328) lt!343732)))

(declare-fun b!772167 () Bool)

(declare-fun e!429917 () SeekEntryResult!7846)

(assert (=> b!772167 (= e!429919 e!429917)))

(declare-fun c!85381 () Bool)

(assert (=> b!772167 (= c!85381 (= lt!343733 (select (arr!20290 a!3186) j!159)))))

(declare-fun b!772168 () Bool)

(assert (=> b!772168 (= e!429917 (Found!7846 resIntermediateIndex!5))))

(declare-fun b!772169 () Bool)

(assert (=> b!772169 (= e!429918 (MissingVacant!7846 resIntermediateIndex!5))))

(declare-fun b!772170 () Bool)

(declare-fun c!85379 () Bool)

(assert (=> b!772170 (= c!85379 (= lt!343733 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!772170 (= e!429917 e!429918)))

(declare-fun b!772171 () Bool)

(assert (=> b!772171 (= e!429919 Undefined!7846)))

(assert (= (and d!101975 c!85380) b!772171))

(assert (= (and d!101975 (not c!85380)) b!772167))

(assert (= (and b!772167 c!85381) b!772168))

(assert (= (and b!772167 (not c!85381)) b!772170))

(assert (= (and b!772170 c!85379) b!772169))

(assert (= (and b!772170 (not c!85379)) b!772166))

(declare-fun m!717683 () Bool)

(assert (=> b!772166 m!717683))

(assert (=> b!772166 m!717683))

(assert (=> b!772166 m!717455))

(declare-fun m!717685 () Bool)

(assert (=> b!772166 m!717685))

(declare-fun m!717687 () Bool)

(assert (=> d!101975 m!717687))

(declare-fun m!717689 () Bool)

(assert (=> d!101975 m!717689))

(assert (=> d!101975 m!717475))

(assert (=> d!101975 m!717485))

(assert (=> b!771885 d!101975))

(declare-fun d!101977 () Bool)

(assert (=> d!101977 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!771896 d!101977))

(declare-fun d!101979 () Bool)

(declare-fun res!522222 () Bool)

(declare-fun e!429945 () Bool)

(assert (=> d!101979 (=> res!522222 e!429945)))

(assert (=> d!101979 (= res!522222 (= (select (arr!20290 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!101979 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!429945)))

(declare-fun b!772214 () Bool)

(declare-fun e!429946 () Bool)

(assert (=> b!772214 (= e!429945 e!429946)))

(declare-fun res!522223 () Bool)

(assert (=> b!772214 (=> (not res!522223) (not e!429946))))

(assert (=> b!772214 (= res!522223 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20710 a!3186)))))

(declare-fun b!772215 () Bool)

(assert (=> b!772215 (= e!429946 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!101979 (not res!522222)) b!772214))

(assert (= (and b!772214 res!522223) b!772215))

(assert (=> d!101979 m!717675))

(declare-fun m!717707 () Bool)

(assert (=> b!772215 m!717707))

(assert (=> b!771895 d!101979))

(declare-fun b!772216 () Bool)

(declare-fun e!429948 () Bool)

(declare-fun lt!343741 () SeekEntryResult!7846)

(assert (=> b!772216 (= e!429948 (bvsge (x!64836 lt!343741) #b01111111111111111111111111111110))))

(declare-fun b!772218 () Bool)

(declare-fun e!429947 () SeekEntryResult!7846)

(assert (=> b!772218 (= e!429947 (Intermediate!7846 true (toIndex!0 (select (arr!20290 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!772219 () Bool)

(assert (=> b!772219 (and (bvsge (index!33754 lt!343741) #b00000000000000000000000000000000) (bvslt (index!33754 lt!343741) (size!20710 a!3186)))))

(declare-fun res!522225 () Bool)

(assert (=> b!772219 (= res!522225 (= (select (arr!20290 a!3186) (index!33754 lt!343741)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!429950 () Bool)

(assert (=> b!772219 (=> res!522225 e!429950)))

(declare-fun b!772220 () Bool)

(declare-fun e!429951 () Bool)

(assert (=> b!772220 (= e!429948 e!429951)))

(declare-fun res!522226 () Bool)

(assert (=> b!772220 (= res!522226 (and ((_ is Intermediate!7846) lt!343741) (not (undefined!8658 lt!343741)) (bvslt (x!64836 lt!343741) #b01111111111111111111111111111110) (bvsge (x!64836 lt!343741) #b00000000000000000000000000000000) (bvsge (x!64836 lt!343741) #b00000000000000000000000000000000)))))

(assert (=> b!772220 (=> (not res!522226) (not e!429951))))

(declare-fun b!772221 () Bool)

(declare-fun e!429949 () SeekEntryResult!7846)

(assert (=> b!772221 (= e!429949 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20290 a!3186) j!159) mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) (select (arr!20290 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!772222 () Bool)

(assert (=> b!772222 (and (bvsge (index!33754 lt!343741) #b00000000000000000000000000000000) (bvslt (index!33754 lt!343741) (size!20710 a!3186)))))

(declare-fun res!522224 () Bool)

(assert (=> b!772222 (= res!522224 (= (select (arr!20290 a!3186) (index!33754 lt!343741)) (select (arr!20290 a!3186) j!159)))))

(assert (=> b!772222 (=> res!522224 e!429950)))

(assert (=> b!772222 (= e!429951 e!429950)))

(declare-fun b!772217 () Bool)

(assert (=> b!772217 (= e!429947 e!429949)))

(declare-fun lt!343742 () (_ BitVec 64))

(declare-fun c!85396 () Bool)

(assert (=> b!772217 (= c!85396 (or (= lt!343742 (select (arr!20290 a!3186) j!159)) (= (bvadd lt!343742 lt!343742) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!101985 () Bool)

(assert (=> d!101985 e!429948))

(declare-fun c!85397 () Bool)

(assert (=> d!101985 (= c!85397 (and ((_ is Intermediate!7846) lt!343741) (undefined!8658 lt!343741)))))

(assert (=> d!101985 (= lt!343741 e!429947)))

(declare-fun c!85395 () Bool)

(assert (=> d!101985 (= c!85395 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!101985 (= lt!343742 (select (arr!20290 a!3186) (toIndex!0 (select (arr!20290 a!3186) j!159) mask!3328)))))

(assert (=> d!101985 (validMask!0 mask!3328)))

(assert (=> d!101985 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20290 a!3186) j!159) mask!3328) (select (arr!20290 a!3186) j!159) a!3186 mask!3328) lt!343741)))

(declare-fun b!772223 () Bool)

(assert (=> b!772223 (and (bvsge (index!33754 lt!343741) #b00000000000000000000000000000000) (bvslt (index!33754 lt!343741) (size!20710 a!3186)))))

(assert (=> b!772223 (= e!429950 (= (select (arr!20290 a!3186) (index!33754 lt!343741)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!772224 () Bool)

(assert (=> b!772224 (= e!429949 (Intermediate!7846 false (toIndex!0 (select (arr!20290 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!101985 c!85395) b!772218))

(assert (= (and d!101985 (not c!85395)) b!772217))

(assert (= (and b!772217 c!85396) b!772224))

(assert (= (and b!772217 (not c!85396)) b!772221))

(assert (= (and d!101985 c!85397) b!772216))

(assert (= (and d!101985 (not c!85397)) b!772220))

(assert (= (and b!772220 res!522226) b!772222))

(assert (= (and b!772222 (not res!522224)) b!772219))

(assert (= (and b!772219 (not res!522225)) b!772223))

(declare-fun m!717717 () Bool)

(assert (=> b!772223 m!717717))

(assert (=> d!101985 m!717479))

(declare-fun m!717719 () Bool)

(assert (=> d!101985 m!717719))

(assert (=> d!101985 m!717485))

(assert (=> b!772219 m!717717))

(assert (=> b!772222 m!717717))

(assert (=> b!772221 m!717479))

(declare-fun m!717721 () Bool)

(assert (=> b!772221 m!717721))

(assert (=> b!772221 m!717721))

(assert (=> b!772221 m!717455))

(declare-fun m!717723 () Bool)

(assert (=> b!772221 m!717723))

(assert (=> b!771886 d!101985))

(declare-fun d!101989 () Bool)

(declare-fun lt!343744 () (_ BitVec 32))

(declare-fun lt!343743 () (_ BitVec 32))

(assert (=> d!101989 (= lt!343744 (bvmul (bvxor lt!343743 (bvlshr lt!343743 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101989 (= lt!343743 ((_ extract 31 0) (bvand (bvxor (select (arr!20290 a!3186) j!159) (bvlshr (select (arr!20290 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101989 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!522196 (let ((h!15303 ((_ extract 31 0) (bvand (bvxor (select (arr!20290 a!3186) j!159) (bvlshr (select (arr!20290 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64842 (bvmul (bvxor h!15303 (bvlshr h!15303 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64842 (bvlshr x!64842 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!522196 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!522196 #b00000000000000000000000000000000))))))

(assert (=> d!101989 (= (toIndex!0 (select (arr!20290 a!3186) j!159) mask!3328) (bvand (bvxor lt!343744 (bvlshr lt!343744 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!771886 d!101989))

(assert (=> b!771888 d!101951))

(declare-fun e!429953 () SeekEntryResult!7846)

(declare-fun b!772225 () Bool)

(assert (=> b!772225 (= e!429953 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!343611 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20290 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!343745 () SeekEntryResult!7846)

(declare-fun d!101991 () Bool)

(assert (=> d!101991 (and (or ((_ is Undefined!7846) lt!343745) (not ((_ is Found!7846) lt!343745)) (and (bvsge (index!33753 lt!343745) #b00000000000000000000000000000000) (bvslt (index!33753 lt!343745) (size!20710 a!3186)))) (or ((_ is Undefined!7846) lt!343745) ((_ is Found!7846) lt!343745) (not ((_ is MissingVacant!7846) lt!343745)) (not (= (index!33755 lt!343745) resIntermediateIndex!5)) (and (bvsge (index!33755 lt!343745) #b00000000000000000000000000000000) (bvslt (index!33755 lt!343745) (size!20710 a!3186)))) (or ((_ is Undefined!7846) lt!343745) (ite ((_ is Found!7846) lt!343745) (= (select (arr!20290 a!3186) (index!33753 lt!343745)) (select (arr!20290 a!3186) j!159)) (and ((_ is MissingVacant!7846) lt!343745) (= (index!33755 lt!343745) resIntermediateIndex!5) (= (select (arr!20290 a!3186) (index!33755 lt!343745)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!429954 () SeekEntryResult!7846)

(assert (=> d!101991 (= lt!343745 e!429954)))

(declare-fun c!85399 () Bool)

(assert (=> d!101991 (= c!85399 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(declare-fun lt!343746 () (_ BitVec 64))

(assert (=> d!101991 (= lt!343746 (select (arr!20290 a!3186) lt!343611))))

(assert (=> d!101991 (validMask!0 mask!3328)))

(assert (=> d!101991 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343611 resIntermediateIndex!5 (select (arr!20290 a!3186) j!159) a!3186 mask!3328) lt!343745)))

(declare-fun b!772226 () Bool)

(declare-fun e!429952 () SeekEntryResult!7846)

(assert (=> b!772226 (= e!429954 e!429952)))

(declare-fun c!85400 () Bool)

(assert (=> b!772226 (= c!85400 (= lt!343746 (select (arr!20290 a!3186) j!159)))))

(declare-fun b!772227 () Bool)

(assert (=> b!772227 (= e!429952 (Found!7846 lt!343611))))

(declare-fun b!772228 () Bool)

(assert (=> b!772228 (= e!429953 (MissingVacant!7846 resIntermediateIndex!5))))

(declare-fun b!772229 () Bool)

(declare-fun c!85398 () Bool)

(assert (=> b!772229 (= c!85398 (= lt!343746 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!772229 (= e!429952 e!429953)))

(declare-fun b!772230 () Bool)

(assert (=> b!772230 (= e!429954 Undefined!7846)))

(assert (= (and d!101991 c!85399) b!772230))

(assert (= (and d!101991 (not c!85399)) b!772226))

(assert (= (and b!772226 c!85400) b!772227))

(assert (= (and b!772226 (not c!85400)) b!772229))

(assert (= (and b!772229 c!85398) b!772228))

(assert (= (and b!772229 (not c!85398)) b!772225))

(assert (=> b!772225 m!717615))

(assert (=> b!772225 m!717615))

(assert (=> b!772225 m!717455))

(declare-fun m!717725 () Bool)

(assert (=> b!772225 m!717725))

(declare-fun m!717727 () Bool)

(assert (=> d!101991 m!717727))

(declare-fun m!717729 () Bool)

(assert (=> d!101991 m!717729))

(assert (=> d!101991 m!717613))

(assert (=> d!101991 m!717485))

(assert (=> b!771888 d!101991))

(declare-fun bm!35139 () Bool)

(declare-fun call!35142 () Bool)

(assert (=> bm!35139 (= call!35142 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!772257 () Bool)

(declare-fun e!429973 () Bool)

(declare-fun e!429972 () Bool)

(assert (=> b!772257 (= e!429973 e!429972)))

(declare-fun lt!343769 () (_ BitVec 64))

(assert (=> b!772257 (= lt!343769 (select (arr!20290 a!3186) j!159))))

(declare-fun lt!343771 () Unit!26575)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42388 (_ BitVec 64) (_ BitVec 32)) Unit!26575)

(assert (=> b!772257 (= lt!343771 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!343769 j!159))))

(assert (=> b!772257 (arrayContainsKey!0 a!3186 lt!343769 #b00000000000000000000000000000000)))

(declare-fun lt!343770 () Unit!26575)

(assert (=> b!772257 (= lt!343770 lt!343771)))

(declare-fun res!522239 () Bool)

(assert (=> b!772257 (= res!522239 (= (seekEntryOrOpen!0 (select (arr!20290 a!3186) j!159) a!3186 mask!3328) (Found!7846 j!159)))))

(assert (=> b!772257 (=> (not res!522239) (not e!429972))))

(declare-fun b!772258 () Bool)

(assert (=> b!772258 (= e!429973 call!35142)))

(declare-fun b!772259 () Bool)

(assert (=> b!772259 (= e!429972 call!35142)))

(declare-fun d!101993 () Bool)

(declare-fun res!522240 () Bool)

(declare-fun e!429971 () Bool)

(assert (=> d!101993 (=> res!522240 e!429971)))

(assert (=> d!101993 (= res!522240 (bvsge j!159 (size!20710 a!3186)))))

(assert (=> d!101993 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!429971)))

(declare-fun b!772260 () Bool)

(assert (=> b!772260 (= e!429971 e!429973)))

(declare-fun c!85409 () Bool)

(assert (=> b!772260 (= c!85409 (validKeyInArray!0 (select (arr!20290 a!3186) j!159)))))

(assert (= (and d!101993 (not res!522240)) b!772260))

(assert (= (and b!772260 c!85409) b!772257))

(assert (= (and b!772260 (not c!85409)) b!772258))

(assert (= (and b!772257 res!522239) b!772259))

(assert (= (or b!772259 b!772258) bm!35139))

(declare-fun m!717739 () Bool)

(assert (=> bm!35139 m!717739))

(assert (=> b!772257 m!717455))

(declare-fun m!717741 () Bool)

(assert (=> b!772257 m!717741))

(declare-fun m!717743 () Bool)

(assert (=> b!772257 m!717743))

(assert (=> b!772257 m!717455))

(assert (=> b!772257 m!717491))

(assert (=> b!772260 m!717455))

(assert (=> b!772260 m!717455))

(assert (=> b!772260 m!717489))

(assert (=> b!771887 d!101993))

(declare-fun d!102001 () Bool)

(assert (=> d!102001 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!343776 () Unit!26575)

(declare-fun choose!38 (array!42388 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26575)

(assert (=> d!102001 (= lt!343776 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!102001 (validMask!0 mask!3328)))

(assert (=> d!102001 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!343776)))

(declare-fun bs!21605 () Bool)

(assert (= bs!21605 d!102001))

(assert (=> bs!21605 m!717497))

(declare-fun m!717761 () Bool)

(assert (=> bs!21605 m!717761))

(assert (=> bs!21605 m!717485))

(assert (=> b!771887 d!102001))

(declare-fun b!772270 () Bool)

(declare-fun e!429980 () Bool)

(declare-fun lt!343777 () SeekEntryResult!7846)

(assert (=> b!772270 (= e!429980 (bvsge (x!64836 lt!343777) #b01111111111111111111111111111110))))

(declare-fun b!772272 () Bool)

(declare-fun e!429979 () SeekEntryResult!7846)

(assert (=> b!772272 (= e!429979 (Intermediate!7846 true index!1321 x!1131))))

(declare-fun b!772273 () Bool)

(assert (=> b!772273 (and (bvsge (index!33754 lt!343777) #b00000000000000000000000000000000) (bvslt (index!33754 lt!343777) (size!20710 a!3186)))))

(declare-fun res!522245 () Bool)

(assert (=> b!772273 (= res!522245 (= (select (arr!20290 a!3186) (index!33754 lt!343777)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!429982 () Bool)

(assert (=> b!772273 (=> res!522245 e!429982)))

(declare-fun b!772274 () Bool)

(declare-fun e!429983 () Bool)

(assert (=> b!772274 (= e!429980 e!429983)))

(declare-fun res!522246 () Bool)

(assert (=> b!772274 (= res!522246 (and ((_ is Intermediate!7846) lt!343777) (not (undefined!8658 lt!343777)) (bvslt (x!64836 lt!343777) #b01111111111111111111111111111110) (bvsge (x!64836 lt!343777) #b00000000000000000000000000000000) (bvsge (x!64836 lt!343777) x!1131)))))

(assert (=> b!772274 (=> (not res!522246) (not e!429983))))

(declare-fun e!429981 () SeekEntryResult!7846)

(declare-fun b!772275 () Bool)

(assert (=> b!772275 (= e!429981 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) (select (arr!20290 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!772276 () Bool)

(assert (=> b!772276 (and (bvsge (index!33754 lt!343777) #b00000000000000000000000000000000) (bvslt (index!33754 lt!343777) (size!20710 a!3186)))))

(declare-fun res!522244 () Bool)

(assert (=> b!772276 (= res!522244 (= (select (arr!20290 a!3186) (index!33754 lt!343777)) (select (arr!20290 a!3186) j!159)))))

(assert (=> b!772276 (=> res!522244 e!429982)))

(assert (=> b!772276 (= e!429983 e!429982)))

(declare-fun b!772271 () Bool)

(assert (=> b!772271 (= e!429979 e!429981)))

(declare-fun c!85414 () Bool)

(declare-fun lt!343778 () (_ BitVec 64))

(assert (=> b!772271 (= c!85414 (or (= lt!343778 (select (arr!20290 a!3186) j!159)) (= (bvadd lt!343778 lt!343778) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!102009 () Bool)

(assert (=> d!102009 e!429980))

(declare-fun c!85415 () Bool)

(assert (=> d!102009 (= c!85415 (and ((_ is Intermediate!7846) lt!343777) (undefined!8658 lt!343777)))))

(assert (=> d!102009 (= lt!343777 e!429979)))

(declare-fun c!85413 () Bool)

(assert (=> d!102009 (= c!85413 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102009 (= lt!343778 (select (arr!20290 a!3186) index!1321))))

(assert (=> d!102009 (validMask!0 mask!3328)))

(assert (=> d!102009 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20290 a!3186) j!159) a!3186 mask!3328) lt!343777)))

(declare-fun b!772277 () Bool)

(assert (=> b!772277 (and (bvsge (index!33754 lt!343777) #b00000000000000000000000000000000) (bvslt (index!33754 lt!343777) (size!20710 a!3186)))))

(assert (=> b!772277 (= e!429982 (= (select (arr!20290 a!3186) (index!33754 lt!343777)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!772278 () Bool)

(assert (=> b!772278 (= e!429981 (Intermediate!7846 false index!1321 x!1131))))

(assert (= (and d!102009 c!85413) b!772272))

(assert (= (and d!102009 (not c!85413)) b!772271))

(assert (= (and b!772271 c!85414) b!772278))

(assert (= (and b!772271 (not c!85414)) b!772275))

(assert (= (and d!102009 c!85415) b!772270))

(assert (= (and d!102009 (not c!85415)) b!772274))

(assert (= (and b!772274 res!522246) b!772276))

(assert (= (and b!772276 (not res!522244)) b!772273))

(assert (= (and b!772273 (not res!522245)) b!772277))

(declare-fun m!717763 () Bool)

(assert (=> b!772277 m!717763))

(assert (=> d!102009 m!717637))

(assert (=> d!102009 m!717485))

(assert (=> b!772273 m!717763))

(assert (=> b!772276 m!717763))

(assert (=> b!772275 m!717629))

(assert (=> b!772275 m!717629))

(assert (=> b!772275 m!717455))

(declare-fun m!717765 () Bool)

(assert (=> b!772275 m!717765))

(assert (=> b!771898 d!102009))

(declare-fun d!102011 () Bool)

(declare-fun lt!343785 () (_ BitVec 32))

(assert (=> d!102011 (and (bvsge lt!343785 #b00000000000000000000000000000000) (bvslt lt!343785 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!102011 (= lt!343785 (choose!52 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(assert (=> d!102011 (validMask!0 mask!3328)))

(assert (=> d!102011 (= (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) lt!343785)))

(declare-fun bs!21606 () Bool)

(assert (= bs!21606 d!102011))

(declare-fun m!717767 () Bool)

(assert (=> bs!21606 m!717767))

(assert (=> bs!21606 m!717485))

(assert (=> b!771900 d!102011))

(declare-fun bm!35140 () Bool)

(declare-fun call!35143 () Bool)

(assert (=> bm!35140 (= call!35143 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!772291 () Bool)

(declare-fun e!429992 () Bool)

(declare-fun e!429991 () Bool)

(assert (=> b!772291 (= e!429992 e!429991)))

(declare-fun lt!343786 () (_ BitVec 64))

(assert (=> b!772291 (= lt!343786 (select (arr!20290 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!343788 () Unit!26575)

(assert (=> b!772291 (= lt!343788 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!343786 #b00000000000000000000000000000000))))

(assert (=> b!772291 (arrayContainsKey!0 a!3186 lt!343786 #b00000000000000000000000000000000)))

(declare-fun lt!343787 () Unit!26575)

(assert (=> b!772291 (= lt!343787 lt!343788)))

(declare-fun res!522247 () Bool)

(assert (=> b!772291 (= res!522247 (= (seekEntryOrOpen!0 (select (arr!20290 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7846 #b00000000000000000000000000000000)))))

(assert (=> b!772291 (=> (not res!522247) (not e!429991))))

(declare-fun b!772292 () Bool)

(assert (=> b!772292 (= e!429992 call!35143)))

(declare-fun b!772293 () Bool)

(assert (=> b!772293 (= e!429991 call!35143)))

(declare-fun d!102013 () Bool)

(declare-fun res!522248 () Bool)

(declare-fun e!429990 () Bool)

(assert (=> d!102013 (=> res!522248 e!429990)))

(assert (=> d!102013 (= res!522248 (bvsge #b00000000000000000000000000000000 (size!20710 a!3186)))))

(assert (=> d!102013 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!429990)))

(declare-fun b!772294 () Bool)

(assert (=> b!772294 (= e!429990 e!429992)))

(declare-fun c!85422 () Bool)

(assert (=> b!772294 (= c!85422 (validKeyInArray!0 (select (arr!20290 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!102013 (not res!522248)) b!772294))

(assert (= (and b!772294 c!85422) b!772291))

(assert (= (and b!772294 (not c!85422)) b!772292))

(assert (= (and b!772291 res!522247) b!772293))

(assert (= (or b!772293 b!772292) bm!35140))

(declare-fun m!717769 () Bool)

(assert (=> bm!35140 m!717769))

(assert (=> b!772291 m!717675))

(declare-fun m!717771 () Bool)

(assert (=> b!772291 m!717771))

(declare-fun m!717773 () Bool)

(assert (=> b!772291 m!717773))

(assert (=> b!772291 m!717675))

(declare-fun m!717775 () Bool)

(assert (=> b!772291 m!717775))

(assert (=> b!772294 m!717675))

(assert (=> b!772294 m!717675))

(assert (=> b!772294 m!717679))

(assert (=> b!771899 d!102013))

(declare-fun d!102015 () Bool)

(assert (=> d!102015 (= (validKeyInArray!0 (select (arr!20290 a!3186) j!159)) (and (not (= (select (arr!20290 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20290 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!771890 d!102015))

(check-sat (not d!102011) (not bm!35136) (not b!772159) (not d!101969) (not b!772078) (not b!772257) (not b!772096) (not b!772291) (not b!772166) (not b!772158) (not bm!35139) (not d!101967) (not b!772275) (not b!772131) (not d!102001) (not b!772260) (not bm!35140) (not b!772215) (not b!772044) (not b!772122) (not b!772225) (not d!101951) (not b!772294) (not d!101991) (not b!772160) (not d!101947) (not d!102009) (not b!772221) (not b!772064) (not d!101975) (not d!101945) (not d!101985) (not d!101955))
(check-sat)
