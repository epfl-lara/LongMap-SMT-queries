; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66312 () Bool)

(assert start!66312)

(declare-fun b!764499 () Bool)

(declare-fun res!517335 () Bool)

(declare-fun e!425775 () Bool)

(assert (=> b!764499 (=> (not res!517335) (not e!425775))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!764499 (= res!517335 (validKeyInArray!0 k!2102))))

(declare-fun b!764500 () Bool)

(declare-fun e!425773 () Bool)

(assert (=> b!764500 (= e!425775 e!425773)))

(declare-fun res!517334 () Bool)

(assert (=> b!764500 (=> (not res!517334) (not e!425773))))

(declare-datatypes ((SeekEntryResult!7816 0))(
  ( (MissingZero!7816 (index!33632 (_ BitVec 32))) (Found!7816 (index!33633 (_ BitVec 32))) (Intermediate!7816 (undefined!8628 Bool) (index!33634 (_ BitVec 32)) (x!64524 (_ BitVec 32))) (Undefined!7816) (MissingVacant!7816 (index!33635 (_ BitVec 32))) )
))
(declare-fun lt!340180 () SeekEntryResult!7816)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!764500 (= res!517334 (or (= lt!340180 (MissingZero!7816 i!1173)) (= lt!340180 (MissingVacant!7816 i!1173))))))

(declare-datatypes ((array!42217 0))(
  ( (array!42218 (arr!20216 (Array (_ BitVec 32) (_ BitVec 64))) (size!20637 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42217)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42217 (_ BitVec 32)) SeekEntryResult!7816)

(assert (=> b!764500 (= lt!340180 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!764501 () Bool)

(declare-fun e!425771 () Bool)

(assert (=> b!764501 (= e!425773 e!425771)))

(declare-fun res!517324 () Bool)

(assert (=> b!764501 (=> (not res!517324) (not e!425771))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!340181 () SeekEntryResult!7816)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42217 (_ BitVec 32)) SeekEntryResult!7816)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!764501 (= res!517324 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20216 a!3186) j!159) mask!3328) (select (arr!20216 a!3186) j!159) a!3186 mask!3328) lt!340181))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!764501 (= lt!340181 (Intermediate!7816 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!764503 () Bool)

(declare-fun e!425770 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42217 (_ BitVec 32)) SeekEntryResult!7816)

(assert (=> b!764503 (= e!425770 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20216 a!3186) j!159) a!3186 mask!3328) (Found!7816 j!159)))))

(declare-fun b!764504 () Bool)

(declare-fun res!517331 () Bool)

(assert (=> b!764504 (=> (not res!517331) (not e!425771))))

(assert (=> b!764504 (= res!517331 e!425770)))

(declare-fun c!83974 () Bool)

(assert (=> b!764504 (= c!83974 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!764505 () Bool)

(declare-fun res!517330 () Bool)

(assert (=> b!764505 (=> (not res!517330) (not e!425773))))

(declare-datatypes ((List!14218 0))(
  ( (Nil!14215) (Cons!14214 (h!15298 (_ BitVec 64)) (t!20533 List!14218)) )
))
(declare-fun arrayNoDuplicates!0 (array!42217 (_ BitVec 32) List!14218) Bool)

(assert (=> b!764505 (= res!517330 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14215))))

(declare-fun b!764506 () Bool)

(declare-fun res!517329 () Bool)

(assert (=> b!764506 (=> (not res!517329) (not e!425773))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42217 (_ BitVec 32)) Bool)

(assert (=> b!764506 (= res!517329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!764507 () Bool)

(declare-fun res!517325 () Bool)

(assert (=> b!764507 (=> (not res!517325) (not e!425773))))

(assert (=> b!764507 (= res!517325 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20637 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20637 a!3186))))))

(declare-fun b!764508 () Bool)

(declare-fun res!517336 () Bool)

(assert (=> b!764508 (=> (not res!517336) (not e!425775))))

(declare-fun arrayContainsKey!0 (array!42217 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!764508 (= res!517336 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!764509 () Bool)

(declare-fun res!517327 () Bool)

(assert (=> b!764509 (=> (not res!517327) (not e!425771))))

(assert (=> b!764509 (= res!517327 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20216 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!764510 () Bool)

(declare-fun res!517333 () Bool)

(assert (=> b!764510 (=> (not res!517333) (not e!425775))))

(assert (=> b!764510 (= res!517333 (and (= (size!20637 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20637 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20637 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!764502 () Bool)

(declare-fun res!517332 () Bool)

(assert (=> b!764502 (=> (not res!517332) (not e!425775))))

(assert (=> b!764502 (= res!517332 (validKeyInArray!0 (select (arr!20216 a!3186) j!159)))))

(declare-fun res!517328 () Bool)

(assert (=> start!66312 (=> (not res!517328) (not e!425775))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66312 (= res!517328 (validMask!0 mask!3328))))

(assert (=> start!66312 e!425775))

(assert (=> start!66312 true))

(declare-fun array_inv!16012 (array!42217) Bool)

(assert (=> start!66312 (array_inv!16012 a!3186)))

(declare-fun b!764511 () Bool)

(declare-fun e!425772 () Bool)

(assert (=> b!764511 (= e!425771 e!425772)))

(declare-fun res!517326 () Bool)

(assert (=> b!764511 (=> (not res!517326) (not e!425772))))

(declare-fun lt!340177 () array!42217)

(declare-fun lt!340179 () (_ BitVec 64))

(assert (=> b!764511 (= res!517326 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340179 mask!3328) lt!340179 lt!340177 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340179 lt!340177 mask!3328)))))

(assert (=> b!764511 (= lt!340179 (select (store (arr!20216 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!764511 (= lt!340177 (array!42218 (store (arr!20216 a!3186) i!1173 k!2102) (size!20637 a!3186)))))

(declare-fun b!764512 () Bool)

(assert (=> b!764512 (= e!425770 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20216 a!3186) j!159) a!3186 mask!3328) lt!340181))))

(declare-fun b!764513 () Bool)

(assert (=> b!764513 (= e!425772 (not (= (seekEntryOrOpen!0 (select (arr!20216 a!3186) j!159) a!3186 mask!3328) (Found!7816 j!159))))))

(assert (=> b!764513 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26358 0))(
  ( (Unit!26359) )
))
(declare-fun lt!340178 () Unit!26358)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42217 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26358)

(assert (=> b!764513 (= lt!340178 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!66312 res!517328) b!764510))

(assert (= (and b!764510 res!517333) b!764502))

(assert (= (and b!764502 res!517332) b!764499))

(assert (= (and b!764499 res!517335) b!764508))

(assert (= (and b!764508 res!517336) b!764500))

(assert (= (and b!764500 res!517334) b!764506))

(assert (= (and b!764506 res!517329) b!764505))

(assert (= (and b!764505 res!517330) b!764507))

(assert (= (and b!764507 res!517325) b!764501))

(assert (= (and b!764501 res!517324) b!764509))

(assert (= (and b!764509 res!517327) b!764504))

(assert (= (and b!764504 c!83974) b!764512))

(assert (= (and b!764504 (not c!83974)) b!764503))

(assert (= (and b!764504 res!517331) b!764511))

(assert (= (and b!764511 res!517326) b!764513))

(declare-fun m!710869 () Bool)

(assert (=> b!764509 m!710869))

(declare-fun m!710871 () Bool)

(assert (=> b!764501 m!710871))

(assert (=> b!764501 m!710871))

(declare-fun m!710873 () Bool)

(assert (=> b!764501 m!710873))

(assert (=> b!764501 m!710873))

(assert (=> b!764501 m!710871))

(declare-fun m!710875 () Bool)

(assert (=> b!764501 m!710875))

(assert (=> b!764503 m!710871))

(assert (=> b!764503 m!710871))

(declare-fun m!710877 () Bool)

(assert (=> b!764503 m!710877))

(declare-fun m!710879 () Bool)

(assert (=> b!764511 m!710879))

(declare-fun m!710881 () Bool)

(assert (=> b!764511 m!710881))

(declare-fun m!710883 () Bool)

(assert (=> b!764511 m!710883))

(declare-fun m!710885 () Bool)

(assert (=> b!764511 m!710885))

(assert (=> b!764511 m!710879))

(declare-fun m!710887 () Bool)

(assert (=> b!764511 m!710887))

(declare-fun m!710889 () Bool)

(assert (=> b!764500 m!710889))

(declare-fun m!710891 () Bool)

(assert (=> b!764499 m!710891))

(declare-fun m!710893 () Bool)

(assert (=> b!764505 m!710893))

(declare-fun m!710895 () Bool)

(assert (=> b!764508 m!710895))

(declare-fun m!710897 () Bool)

(assert (=> b!764506 m!710897))

(declare-fun m!710899 () Bool)

(assert (=> start!66312 m!710899))

(declare-fun m!710901 () Bool)

(assert (=> start!66312 m!710901))

(assert (=> b!764513 m!710871))

(assert (=> b!764513 m!710871))

(declare-fun m!710903 () Bool)

(assert (=> b!764513 m!710903))

(declare-fun m!710905 () Bool)

(assert (=> b!764513 m!710905))

(declare-fun m!710907 () Bool)

(assert (=> b!764513 m!710907))

(assert (=> b!764512 m!710871))

(assert (=> b!764512 m!710871))

(declare-fun m!710909 () Bool)

(assert (=> b!764512 m!710909))

(assert (=> b!764502 m!710871))

(assert (=> b!764502 m!710871))

(declare-fun m!710911 () Bool)

(assert (=> b!764502 m!710911))

(push 1)

(assert (not b!764499))

(assert (not b!764502))

(assert (not b!764501))

(assert (not b!764508))

(assert (not b!764503))

(assert (not b!764511))

(assert (not b!764500))

(assert (not start!66312))

(assert (not b!764506))

(assert (not b!764505))

(assert (not b!764513))

(assert (not b!764512))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun e!425833 () SeekEntryResult!7816)

(declare-fun b!764613 () Bool)

(declare-fun lt!340217 () SeekEntryResult!7816)

(assert (=> b!764613 (= e!425833 (seekKeyOrZeroReturnVacant!0 (x!64524 lt!340217) (index!33634 lt!340217) (index!33634 lt!340217) k!2102 a!3186 mask!3328))))

(declare-fun b!764614 () Bool)

(declare-fun e!425834 () SeekEntryResult!7816)

(assert (=> b!764614 (= e!425834 (Found!7816 (index!33634 lt!340217)))))

(declare-fun b!764615 () Bool)

(declare-fun e!425832 () SeekEntryResult!7816)

(assert (=> b!764615 (= e!425832 e!425834)))

(declare-fun lt!340218 () (_ BitVec 64))

(assert (=> b!764615 (= lt!340218 (select (arr!20216 a!3186) (index!33634 lt!340217)))))

(declare-fun c!84011 () Bool)

(assert (=> b!764615 (= c!84011 (= lt!340218 k!2102))))

(declare-fun d!100993 () Bool)

(declare-fun lt!340219 () SeekEntryResult!7816)

(assert (=> d!100993 (and (or (is-Undefined!7816 lt!340219) (not (is-Found!7816 lt!340219)) (and (bvsge (index!33633 lt!340219) #b00000000000000000000000000000000) (bvslt (index!33633 lt!340219) (size!20637 a!3186)))) (or (is-Undefined!7816 lt!340219) (is-Found!7816 lt!340219) (not (is-MissingZero!7816 lt!340219)) (and (bvsge (index!33632 lt!340219) #b00000000000000000000000000000000) (bvslt (index!33632 lt!340219) (size!20637 a!3186)))) (or (is-Undefined!7816 lt!340219) (is-Found!7816 lt!340219) (is-MissingZero!7816 lt!340219) (not (is-MissingVacant!7816 lt!340219)) (and (bvsge (index!33635 lt!340219) #b00000000000000000000000000000000) (bvslt (index!33635 lt!340219) (size!20637 a!3186)))) (or (is-Undefined!7816 lt!340219) (ite (is-Found!7816 lt!340219) (= (select (arr!20216 a!3186) (index!33633 lt!340219)) k!2102) (ite (is-MissingZero!7816 lt!340219) (= (select (arr!20216 a!3186) (index!33632 lt!340219)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7816 lt!340219) (= (select (arr!20216 a!3186) (index!33635 lt!340219)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!100993 (= lt!340219 e!425832)))

(declare-fun c!84012 () Bool)

(assert (=> d!100993 (= c!84012 (and (is-Intermediate!7816 lt!340217) (undefined!8628 lt!340217)))))

(assert (=> d!100993 (= lt!340217 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!100993 (validMask!0 mask!3328)))

(assert (=> d!100993 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!340219)))

(declare-fun b!764616 () Bool)

(assert (=> b!764616 (= e!425833 (MissingZero!7816 (index!33634 lt!340217)))))

(declare-fun b!764617 () Bool)

(assert (=> b!764617 (= e!425832 Undefined!7816)))

(declare-fun b!764618 () Bool)

(declare-fun c!84013 () Bool)

(assert (=> b!764618 (= c!84013 (= lt!340218 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!764618 (= e!425834 e!425833)))

(assert (= (and d!100993 c!84012) b!764617))

(assert (= (and d!100993 (not c!84012)) b!764615))

(assert (= (and b!764615 c!84011) b!764614))

(assert (= (and b!764615 (not c!84011)) b!764618))

(assert (= (and b!764618 c!84013) b!764616))

(assert (= (and b!764618 (not c!84013)) b!764613))

(declare-fun m!710951 () Bool)

(assert (=> b!764613 m!710951))

(declare-fun m!710953 () Bool)

(assert (=> b!764615 m!710953))

(declare-fun m!710955 () Bool)

(assert (=> d!100993 m!710955))

(declare-fun m!710957 () Bool)

(assert (=> d!100993 m!710957))

(assert (=> d!100993 m!710955))

(declare-fun m!710959 () Bool)

(assert (=> d!100993 m!710959))

(declare-fun m!710961 () Bool)

(assert (=> d!100993 m!710961))

(assert (=> d!100993 m!710899))

(declare-fun m!710963 () Bool)

(assert (=> d!100993 m!710963))

(assert (=> b!764500 d!100993))

(declare-fun b!764713 () Bool)

(declare-fun e!425895 () SeekEntryResult!7816)

(declare-fun e!425894 () SeekEntryResult!7816)

(assert (=> b!764713 (= e!425895 e!425894)))

(declare-fun c!84045 () Bool)

(declare-fun lt!340271 () (_ BitVec 64))

(assert (=> b!764713 (= c!84045 (or (= lt!340271 lt!340179) (= (bvadd lt!340271 lt!340271) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!764714 () Bool)

(declare-fun lt!340270 () SeekEntryResult!7816)

(assert (=> b!764714 (and (bvsge (index!33634 lt!340270) #b00000000000000000000000000000000) (bvslt (index!33634 lt!340270) (size!20637 lt!340177)))))

(declare-fun res!517400 () Bool)

(assert (=> b!764714 (= res!517400 (= (select (arr!20216 lt!340177) (index!33634 lt!340270)) lt!340179))))

(declare-fun e!425897 () Bool)

(assert (=> b!764714 (=> res!517400 e!425897)))

(declare-fun e!425896 () Bool)

(assert (=> b!764714 (= e!425896 e!425897)))

(declare-fun b!764715 () Bool)

(declare-fun e!425898 () Bool)

(assert (=> b!764715 (= e!425898 e!425896)))

(declare-fun res!517398 () Bool)

(assert (=> b!764715 (= res!517398 (and (is-Intermediate!7816 lt!340270) (not (undefined!8628 lt!340270)) (bvslt (x!64524 lt!340270) #b01111111111111111111111111111110) (bvsge (x!64524 lt!340270) #b00000000000000000000000000000000) (bvsge (x!64524 lt!340270) #b00000000000000000000000000000000)))))

(assert (=> b!764715 (=> (not res!517398) (not e!425896))))

(declare-fun b!764716 () Bool)

(assert (=> b!764716 (= e!425898 (bvsge (x!64524 lt!340270) #b01111111111111111111111111111110))))

(declare-fun b!764717 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!764717 (= e!425894 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!340179 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!340179 lt!340177 mask!3328))))

(declare-fun b!764718 () Bool)

(assert (=> b!764718 (= e!425894 (Intermediate!7816 false (toIndex!0 lt!340179 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!764719 () Bool)

(assert (=> b!764719 (and (bvsge (index!33634 lt!340270) #b00000000000000000000000000000000) (bvslt (index!33634 lt!340270) (size!20637 lt!340177)))))

(declare-fun res!517399 () Bool)

(assert (=> b!764719 (= res!517399 (= (select (arr!20216 lt!340177) (index!33634 lt!340270)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!764719 (=> res!517399 e!425897)))

(declare-fun d!101007 () Bool)

(assert (=> d!101007 e!425898))

(declare-fun c!84046 () Bool)

(assert (=> d!101007 (= c!84046 (and (is-Intermediate!7816 lt!340270) (undefined!8628 lt!340270)))))

(assert (=> d!101007 (= lt!340270 e!425895)))

(declare-fun c!84047 () Bool)

(assert (=> d!101007 (= c!84047 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!101007 (= lt!340271 (select (arr!20216 lt!340177) (toIndex!0 lt!340179 mask!3328)))))

(assert (=> d!101007 (validMask!0 mask!3328)))

(assert (=> d!101007 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340179 mask!3328) lt!340179 lt!340177 mask!3328) lt!340270)))

(declare-fun b!764720 () Bool)

(assert (=> b!764720 (= e!425895 (Intermediate!7816 true (toIndex!0 lt!340179 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!764721 () Bool)

(assert (=> b!764721 (and (bvsge (index!33634 lt!340270) #b00000000000000000000000000000000) (bvslt (index!33634 lt!340270) (size!20637 lt!340177)))))

(assert (=> b!764721 (= e!425897 (= (select (arr!20216 lt!340177) (index!33634 lt!340270)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!101007 c!84047) b!764720))

(assert (= (and d!101007 (not c!84047)) b!764713))

(assert (= (and b!764713 c!84045) b!764718))

(assert (= (and b!764713 (not c!84045)) b!764717))

(assert (= (and d!101007 c!84046) b!764716))

(assert (= (and d!101007 (not c!84046)) b!764715))

(assert (= (and b!764715 res!517398) b!764714))

(assert (= (and b!764714 (not res!517400)) b!764719))

(assert (= (and b!764719 (not res!517399)) b!764721))

(declare-fun m!711039 () Bool)

(assert (=> b!764721 m!711039))

(assert (=> b!764717 m!710879))

(declare-fun m!711041 () Bool)

(assert (=> b!764717 m!711041))

(assert (=> b!764717 m!711041))

(declare-fun m!711043 () Bool)

(assert (=> b!764717 m!711043))

(assert (=> b!764714 m!711039))

(assert (=> d!101007 m!710879))

(declare-fun m!711045 () Bool)

(assert (=> d!101007 m!711045))

(assert (=> d!101007 m!710899))

(assert (=> b!764719 m!711039))

(assert (=> b!764511 d!101007))

(declare-fun d!101029 () Bool)

(declare-fun lt!340283 () (_ BitVec 32))

(declare-fun lt!340282 () (_ BitVec 32))

(assert (=> d!101029 (= lt!340283 (bvmul (bvxor lt!340282 (bvlshr lt!340282 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101029 (= lt!340282 ((_ extract 31 0) (bvand (bvxor lt!340179 (bvlshr lt!340179 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101029 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!517401 (let ((h!15301 ((_ extract 31 0) (bvand (bvxor lt!340179 (bvlshr lt!340179 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64530 (bvmul (bvxor h!15301 (bvlshr h!15301 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64530 (bvlshr x!64530 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!517401 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!517401 #b00000000000000000000000000000000))))))

(assert (=> d!101029 (= (toIndex!0 lt!340179 mask!3328) (bvand (bvxor lt!340283 (bvlshr lt!340283 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!764511 d!101029))

(declare-fun b!764732 () Bool)

(declare-fun e!425906 () SeekEntryResult!7816)

(declare-fun e!425905 () SeekEntryResult!7816)

(assert (=> b!764732 (= e!425906 e!425905)))

(declare-fun c!84052 () Bool)

(declare-fun lt!340285 () (_ BitVec 64))

(assert (=> b!764732 (= c!84052 (or (= lt!340285 lt!340179) (= (bvadd lt!340285 lt!340285) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!764733 () Bool)

(declare-fun lt!340284 () SeekEntryResult!7816)

(assert (=> b!764733 (and (bvsge (index!33634 lt!340284) #b00000000000000000000000000000000) (bvslt (index!33634 lt!340284) (size!20637 lt!340177)))))

(declare-fun res!517406 () Bool)

(assert (=> b!764733 (= res!517406 (= (select (arr!20216 lt!340177) (index!33634 lt!340284)) lt!340179))))

(declare-fun e!425908 () Bool)

(assert (=> b!764733 (=> res!517406 e!425908)))

(declare-fun e!425907 () Bool)

(assert (=> b!764733 (= e!425907 e!425908)))

(declare-fun b!764734 () Bool)

(declare-fun e!425909 () Bool)

(assert (=> b!764734 (= e!425909 e!425907)))

(declare-fun res!517404 () Bool)

(assert (=> b!764734 (= res!517404 (and (is-Intermediate!7816 lt!340284) (not (undefined!8628 lt!340284)) (bvslt (x!64524 lt!340284) #b01111111111111111111111111111110) (bvsge (x!64524 lt!340284) #b00000000000000000000000000000000) (bvsge (x!64524 lt!340284) x!1131)))))

(assert (=> b!764734 (=> (not res!517404) (not e!425907))))

(declare-fun b!764735 () Bool)

(assert (=> b!764735 (= e!425909 (bvsge (x!64524 lt!340284) #b01111111111111111111111111111110))))

(declare-fun b!764736 () Bool)

(assert (=> b!764736 (= e!425905 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!340179 lt!340177 mask!3328))))

(declare-fun b!764737 () Bool)

(assert (=> b!764737 (= e!425905 (Intermediate!7816 false index!1321 x!1131))))

(declare-fun b!764738 () Bool)

(assert (=> b!764738 (and (bvsge (index!33634 lt!340284) #b00000000000000000000000000000000) (bvslt (index!33634 lt!340284) (size!20637 lt!340177)))))

(declare-fun res!517405 () Bool)

(assert (=> b!764738 (= res!517405 (= (select (arr!20216 lt!340177) (index!33634 lt!340284)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!764738 (=> res!517405 e!425908)))

(declare-fun d!101041 () Bool)

(assert (=> d!101041 e!425909))

(declare-fun c!84053 () Bool)

(assert (=> d!101041 (= c!84053 (and (is-Intermediate!7816 lt!340284) (undefined!8628 lt!340284)))))

(assert (=> d!101041 (= lt!340284 e!425906)))

(declare-fun c!84054 () Bool)

(assert (=> d!101041 (= c!84054 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101041 (= lt!340285 (select (arr!20216 lt!340177) index!1321))))

(assert (=> d!101041 (validMask!0 mask!3328)))

(assert (=> d!101041 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340179 lt!340177 mask!3328) lt!340284)))

(declare-fun b!764739 () Bool)

(assert (=> b!764739 (= e!425906 (Intermediate!7816 true index!1321 x!1131))))

(declare-fun b!764740 () Bool)

(assert (=> b!764740 (and (bvsge (index!33634 lt!340284) #b00000000000000000000000000000000) (bvslt (index!33634 lt!340284) (size!20637 lt!340177)))))

(assert (=> b!764740 (= e!425908 (= (select (arr!20216 lt!340177) (index!33634 lt!340284)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!101041 c!84054) b!764739))

(assert (= (and d!101041 (not c!84054)) b!764732))

(assert (= (and b!764732 c!84052) b!764737))

(assert (= (and b!764732 (not c!84052)) b!764736))

(assert (= (and d!101041 c!84053) b!764735))

(assert (= (and d!101041 (not c!84053)) b!764734))

(assert (= (and b!764734 res!517404) b!764733))

(assert (= (and b!764733 (not res!517406)) b!764738))

(assert (= (and b!764738 (not res!517405)) b!764740))

(declare-fun m!711064 () Bool)

(assert (=> b!764740 m!711064))

(declare-fun m!711067 () Bool)

(assert (=> b!764736 m!711067))

(assert (=> b!764736 m!711067))

(declare-fun m!711069 () Bool)

(assert (=> b!764736 m!711069))

(assert (=> b!764733 m!711064))

(declare-fun m!711071 () Bool)

(assert (=> d!101041 m!711071))

(assert (=> d!101041 m!710899))

(assert (=> b!764738 m!711064))

(assert (=> b!764511 d!101041))

(declare-fun d!101045 () Bool)

(assert (=> d!101045 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!66312 d!101045))

(declare-fun d!101055 () Bool)

(assert (=> d!101055 (= (array_inv!16012 a!3186) (bvsge (size!20637 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!66312 d!101055))

(declare-fun b!764804 () Bool)

(declare-fun e!425944 () SeekEntryResult!7816)

(declare-fun e!425943 () SeekEntryResult!7816)

(assert (=> b!764804 (= e!425944 e!425943)))

(declare-fun lt!340312 () (_ BitVec 64))

(declare-fun c!84082 () Bool)

(assert (=> b!764804 (= c!84082 (or (= lt!340312 (select (arr!20216 a!3186) j!159)) (= (bvadd lt!340312 lt!340312) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!764805 () Bool)

(declare-fun lt!340311 () SeekEntryResult!7816)

(assert (=> b!764805 (and (bvsge (index!33634 lt!340311) #b00000000000000000000000000000000) (bvslt (index!33634 lt!340311) (size!20637 a!3186)))))

(declare-fun res!517418 () Bool)

(assert (=> b!764805 (= res!517418 (= (select (arr!20216 a!3186) (index!33634 lt!340311)) (select (arr!20216 a!3186) j!159)))))

(declare-fun e!425946 () Bool)

(assert (=> b!764805 (=> res!517418 e!425946)))

(declare-fun e!425945 () Bool)

(assert (=> b!764805 (= e!425945 e!425946)))

(declare-fun b!764806 () Bool)

(declare-fun e!425947 () Bool)

(assert (=> b!764806 (= e!425947 e!425945)))

(declare-fun res!517416 () Bool)

(assert (=> b!764806 (= res!517416 (and (is-Intermediate!7816 lt!340311) (not (undefined!8628 lt!340311)) (bvslt (x!64524 lt!340311) #b01111111111111111111111111111110) (bvsge (x!64524 lt!340311) #b00000000000000000000000000000000) (bvsge (x!64524 lt!340311) x!1131)))))

(assert (=> b!764806 (=> (not res!517416) (not e!425945))))

(declare-fun b!764807 () Bool)

(assert (=> b!764807 (= e!425947 (bvsge (x!64524 lt!340311) #b01111111111111111111111111111110))))

(declare-fun b!764808 () Bool)

(assert (=> b!764808 (= e!425943 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20216 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!764809 () Bool)

(assert (=> b!764809 (= e!425943 (Intermediate!7816 false index!1321 x!1131))))

(declare-fun b!764810 () Bool)

(assert (=> b!764810 (and (bvsge (index!33634 lt!340311) #b00000000000000000000000000000000) (bvslt (index!33634 lt!340311) (size!20637 a!3186)))))

(declare-fun res!517417 () Bool)

(assert (=> b!764810 (= res!517417 (= (select (arr!20216 a!3186) (index!33634 lt!340311)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!764810 (=> res!517417 e!425946)))

(declare-fun d!101061 () Bool)

(assert (=> d!101061 e!425947))

(declare-fun c!84083 () Bool)

(assert (=> d!101061 (= c!84083 (and (is-Intermediate!7816 lt!340311) (undefined!8628 lt!340311)))))

(assert (=> d!101061 (= lt!340311 e!425944)))

(declare-fun c!84084 () Bool)

(assert (=> d!101061 (= c!84084 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101061 (= lt!340312 (select (arr!20216 a!3186) index!1321))))

(assert (=> d!101061 (validMask!0 mask!3328)))

(assert (=> d!101061 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20216 a!3186) j!159) a!3186 mask!3328) lt!340311)))

(declare-fun b!764811 () Bool)

(assert (=> b!764811 (= e!425944 (Intermediate!7816 true index!1321 x!1131))))

(declare-fun b!764812 () Bool)

(assert (=> b!764812 (and (bvsge (index!33634 lt!340311) #b00000000000000000000000000000000) (bvslt (index!33634 lt!340311) (size!20637 a!3186)))))

(assert (=> b!764812 (= e!425946 (= (select (arr!20216 a!3186) (index!33634 lt!340311)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!101061 c!84084) b!764811))

(assert (= (and d!101061 (not c!84084)) b!764804))

(assert (= (and b!764804 c!84082) b!764809))

(assert (= (and b!764804 (not c!84082)) b!764808))

(assert (= (and d!101061 c!84083) b!764807))

(assert (= (and d!101061 (not c!84083)) b!764806))

(assert (= (and b!764806 res!517416) b!764805))

(assert (= (and b!764805 (not res!517418)) b!764810))

(assert (= (and b!764810 (not res!517417)) b!764812))

(declare-fun m!711107 () Bool)

(assert (=> b!764812 m!711107))

(assert (=> b!764808 m!711067))

(assert (=> b!764808 m!711067))

(assert (=> b!764808 m!710871))

(declare-fun m!711109 () Bool)

(assert (=> b!764808 m!711109))

(assert (=> b!764805 m!711107))

(declare-fun m!711111 () Bool)

(assert (=> d!101061 m!711111))

(assert (=> d!101061 m!710899))

(assert (=> b!764810 m!711107))

(assert (=> b!764512 d!101061))

(declare-fun b!764813 () Bool)

(declare-fun e!425949 () SeekEntryResult!7816)

(declare-fun e!425948 () SeekEntryResult!7816)

(assert (=> b!764813 (= e!425949 e!425948)))

(declare-fun c!84085 () Bool)

(declare-fun lt!340314 () (_ BitVec 64))

(assert (=> b!764813 (= c!84085 (or (= lt!340314 (select (arr!20216 a!3186) j!159)) (= (bvadd lt!340314 lt!340314) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!764814 () Bool)

(declare-fun lt!340313 () SeekEntryResult!7816)

(assert (=> b!764814 (and (bvsge (index!33634 lt!340313) #b00000000000000000000000000000000) (bvslt (index!33634 lt!340313) (size!20637 a!3186)))))

(declare-fun res!517421 () Bool)

(assert (=> b!764814 (= res!517421 (= (select (arr!20216 a!3186) (index!33634 lt!340313)) (select (arr!20216 a!3186) j!159)))))

(declare-fun e!425951 () Bool)

(assert (=> b!764814 (=> res!517421 e!425951)))

(declare-fun e!425950 () Bool)

(assert (=> b!764814 (= e!425950 e!425951)))

(declare-fun b!764815 () Bool)

(declare-fun e!425952 () Bool)

(assert (=> b!764815 (= e!425952 e!425950)))

(declare-fun res!517419 () Bool)

(assert (=> b!764815 (= res!517419 (and (is-Intermediate!7816 lt!340313) (not (undefined!8628 lt!340313)) (bvslt (x!64524 lt!340313) #b01111111111111111111111111111110) (bvsge (x!64524 lt!340313) #b00000000000000000000000000000000) (bvsge (x!64524 lt!340313) #b00000000000000000000000000000000)))))

(assert (=> b!764815 (=> (not res!517419) (not e!425950))))

(declare-fun b!764816 () Bool)

(assert (=> b!764816 (= e!425952 (bvsge (x!64524 lt!340313) #b01111111111111111111111111111110))))

(declare-fun b!764817 () Bool)

(assert (=> b!764817 (= e!425948 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20216 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20216 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!764818 () Bool)

(assert (=> b!764818 (= e!425948 (Intermediate!7816 false (toIndex!0 (select (arr!20216 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!764819 () Bool)

(assert (=> b!764819 (and (bvsge (index!33634 lt!340313) #b00000000000000000000000000000000) (bvslt (index!33634 lt!340313) (size!20637 a!3186)))))

(declare-fun res!517420 () Bool)

(assert (=> b!764819 (= res!517420 (= (select (arr!20216 a!3186) (index!33634 lt!340313)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!764819 (=> res!517420 e!425951)))

(declare-fun d!101065 () Bool)

(assert (=> d!101065 e!425952))

(declare-fun c!84086 () Bool)

(assert (=> d!101065 (= c!84086 (and (is-Intermediate!7816 lt!340313) (undefined!8628 lt!340313)))))

(assert (=> d!101065 (= lt!340313 e!425949)))

(declare-fun c!84087 () Bool)

(assert (=> d!101065 (= c!84087 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!101065 (= lt!340314 (select (arr!20216 a!3186) (toIndex!0 (select (arr!20216 a!3186) j!159) mask!3328)))))

(assert (=> d!101065 (validMask!0 mask!3328)))

(assert (=> d!101065 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20216 a!3186) j!159) mask!3328) (select (arr!20216 a!3186) j!159) a!3186 mask!3328) lt!340313)))

(declare-fun b!764820 () Bool)

(assert (=> b!764820 (= e!425949 (Intermediate!7816 true (toIndex!0 (select (arr!20216 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!764821 () Bool)

(assert (=> b!764821 (and (bvsge (index!33634 lt!340313) #b00000000000000000000000000000000) (bvslt (index!33634 lt!340313) (size!20637 a!3186)))))

(assert (=> b!764821 (= e!425951 (= (select (arr!20216 a!3186) (index!33634 lt!340313)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!101065 c!84087) b!764820))

(assert (= (and d!101065 (not c!84087)) b!764813))

(assert (= (and b!764813 c!84085) b!764818))

(assert (= (and b!764813 (not c!84085)) b!764817))

(assert (= (and d!101065 c!84086) b!764816))

(assert (= (and d!101065 (not c!84086)) b!764815))

(assert (= (and b!764815 res!517419) b!764814))

(assert (= (and b!764814 (not res!517421)) b!764819))

(assert (= (and b!764819 (not res!517420)) b!764821))

(declare-fun m!711113 () Bool)

(assert (=> b!764821 m!711113))

(assert (=> b!764817 m!710873))

(declare-fun m!711115 () Bool)

(assert (=> b!764817 m!711115))

(assert (=> b!764817 m!711115))

(assert (=> b!764817 m!710871))

(declare-fun m!711117 () Bool)

(assert (=> b!764817 m!711117))

(assert (=> b!764814 m!711113))

(assert (=> d!101065 m!710873))

(declare-fun m!711119 () Bool)

(assert (=> d!101065 m!711119))

(assert (=> d!101065 m!710899))

(assert (=> b!764819 m!711113))

(assert (=> b!764501 d!101065))

(declare-fun d!101067 () Bool)

(declare-fun lt!340316 () (_ BitVec 32))

(declare-fun lt!340315 () (_ BitVec 32))

(assert (=> d!101067 (= lt!340316 (bvmul (bvxor lt!340315 (bvlshr lt!340315 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101067 (= lt!340315 ((_ extract 31 0) (bvand (bvxor (select (arr!20216 a!3186) j!159) (bvlshr (select (arr!20216 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101067 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!517401 (let ((h!15301 ((_ extract 31 0) (bvand (bvxor (select (arr!20216 a!3186) j!159) (bvlshr (select (arr!20216 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64530 (bvmul (bvxor h!15301 (bvlshr h!15301 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64530 (bvlshr x!64530 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!517401 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!517401 #b00000000000000000000000000000000))))))

(assert (=> d!101067 (= (toIndex!0 (select (arr!20216 a!3186) j!159) mask!3328) (bvand (bvxor lt!340316 (bvlshr lt!340316 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!764501 d!101067))

(declare-fun b!764864 () Bool)

(declare-fun e!425985 () SeekEntryResult!7816)

(declare-fun e!425983 () SeekEntryResult!7816)

(assert (=> b!764864 (= e!425985 e!425983)))

(declare-fun lt!340322 () (_ BitVec 64))

(declare-fun c!84101 () Bool)

(assert (=> b!764864 (= c!84101 (= lt!340322 (select (arr!20216 a!3186) j!159)))))

(declare-fun b!764865 () Bool)

(declare-fun e!425984 () SeekEntryResult!7816)

(assert (=> b!764865 (= e!425984 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20216 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!764866 () Bool)

(assert (=> b!764866 (= e!425983 (Found!7816 index!1321))))

(declare-fun b!764867 () Bool)

(assert (=> b!764867 (= e!425985 Undefined!7816)))

(declare-fun lt!340321 () SeekEntryResult!7816)

(declare-fun d!101069 () Bool)

(assert (=> d!101069 (and (or (is-Undefined!7816 lt!340321) (not (is-Found!7816 lt!340321)) (and (bvsge (index!33633 lt!340321) #b00000000000000000000000000000000) (bvslt (index!33633 lt!340321) (size!20637 a!3186)))) (or (is-Undefined!7816 lt!340321) (is-Found!7816 lt!340321) (not (is-MissingVacant!7816 lt!340321)) (not (= (index!33635 lt!340321) resIntermediateIndex!5)) (and (bvsge (index!33635 lt!340321) #b00000000000000000000000000000000) (bvslt (index!33635 lt!340321) (size!20637 a!3186)))) (or (is-Undefined!7816 lt!340321) (ite (is-Found!7816 lt!340321) (= (select (arr!20216 a!3186) (index!33633 lt!340321)) (select (arr!20216 a!3186) j!159)) (and (is-MissingVacant!7816 lt!340321) (= (index!33635 lt!340321) resIntermediateIndex!5) (= (select (arr!20216 a!3186) (index!33635 lt!340321)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101069 (= lt!340321 e!425985)))

(declare-fun c!84102 () Bool)

(assert (=> d!101069 (= c!84102 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101069 (= lt!340322 (select (arr!20216 a!3186) index!1321))))

