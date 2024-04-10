; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67872 () Bool)

(assert start!67872)

(declare-fun b!788972 () Bool)

(declare-fun e!438532 () Bool)

(declare-fun e!438531 () Bool)

(assert (=> b!788972 (= e!438532 e!438531)))

(declare-fun res!534336 () Bool)

(assert (=> b!788972 (=> (not res!534336) (not e!438531))))

(declare-datatypes ((SeekEntryResult!8111 0))(
  ( (MissingZero!8111 (index!34812 (_ BitVec 32))) (Found!8111 (index!34813 (_ BitVec 32))) (Intermediate!8111 (undefined!8923 Bool) (index!34814 (_ BitVec 32)) (x!65756 (_ BitVec 32))) (Undefined!8111) (MissingVacant!8111 (index!34815 (_ BitVec 32))) )
))
(declare-fun lt!351998 () SeekEntryResult!8111)

(declare-fun lt!352000 () SeekEntryResult!8111)

(assert (=> b!788972 (= res!534336 (= lt!351998 lt!352000))))

(declare-datatypes ((array!42849 0))(
  ( (array!42850 (arr!20511 (Array (_ BitVec 32) (_ BitVec 64))) (size!20932 (_ BitVec 32))) )
))
(declare-fun lt!351997 () array!42849)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!352003 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42849 (_ BitVec 32)) SeekEntryResult!8111)

(assert (=> b!788972 (= lt!352000 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352003 lt!351997 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!788972 (= lt!351998 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352003 mask!3328) lt!352003 lt!351997 mask!3328))))

(declare-fun a!3186 () array!42849)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!788972 (= lt!352003 (select (store (arr!20511 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!788972 (= lt!351997 (array!42850 (store (arr!20511 a!3186) i!1173 k!2102) (size!20932 a!3186)))))

(declare-fun res!534340 () Bool)

(declare-fun e!438539 () Bool)

(assert (=> start!67872 (=> (not res!534340) (not e!438539))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67872 (= res!534340 (validMask!0 mask!3328))))

(assert (=> start!67872 e!438539))

(assert (=> start!67872 true))

(declare-fun array_inv!16307 (array!42849) Bool)

(assert (=> start!67872 (array_inv!16307 a!3186)))

(declare-fun b!788973 () Bool)

(declare-fun e!438536 () Bool)

(declare-fun lt!352004 () SeekEntryResult!8111)

(declare-fun lt!351999 () SeekEntryResult!8111)

(assert (=> b!788973 (= e!438536 (= lt!352004 lt!351999))))

(declare-fun b!788974 () Bool)

(declare-fun e!438535 () Bool)

(declare-fun e!438537 () Bool)

(assert (=> b!788974 (= e!438535 e!438537)))

(declare-fun res!534350 () Bool)

(assert (=> b!788974 (=> res!534350 e!438537)))

(declare-fun lt!351994 () (_ BitVec 64))

(assert (=> b!788974 (= res!534350 (= lt!351994 lt!352003))))

(assert (=> b!788974 (= lt!351994 (select (store (arr!20511 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!788975 () Bool)

(declare-fun e!438533 () Bool)

(assert (=> b!788975 (= e!438531 (not e!438533))))

(declare-fun res!534333 () Bool)

(assert (=> b!788975 (=> res!534333 e!438533)))

(assert (=> b!788975 (= res!534333 (or (not (is-Intermediate!8111 lt!352000)) (bvslt x!1131 (x!65756 lt!352000)) (not (= x!1131 (x!65756 lt!352000))) (not (= index!1321 (index!34814 lt!352000)))))))

(declare-fun e!438542 () Bool)

(assert (=> b!788975 e!438542))

(declare-fun res!534345 () Bool)

(assert (=> b!788975 (=> (not res!534345) (not e!438542))))

(declare-fun lt!351995 () SeekEntryResult!8111)

(assert (=> b!788975 (= res!534345 (= lt!352004 lt!351995))))

(assert (=> b!788975 (= lt!351995 (Found!8111 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42849 (_ BitVec 32)) SeekEntryResult!8111)

(assert (=> b!788975 (= lt!352004 (seekEntryOrOpen!0 (select (arr!20511 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42849 (_ BitVec 32)) Bool)

(assert (=> b!788975 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!27332 0))(
  ( (Unit!27333) )
))
(declare-fun lt!351993 () Unit!27332)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42849 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27332)

(assert (=> b!788975 (= lt!351993 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!788976 () Bool)

(declare-fun e!438534 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42849 (_ BitVec 32)) SeekEntryResult!8111)

(assert (=> b!788976 (= e!438534 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20511 a!3186) j!159) a!3186 mask!3328) (Found!8111 j!159)))))

(declare-fun b!788977 () Bool)

(declare-fun res!534342 () Bool)

(assert (=> b!788977 (=> (not res!534342) (not e!438539))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!788977 (= res!534342 (validKeyInArray!0 k!2102))))

(declare-fun b!788978 () Bool)

(declare-fun res!534344 () Bool)

(declare-fun e!438538 () Bool)

(assert (=> b!788978 (=> (not res!534344) (not e!438538))))

(declare-datatypes ((List!14513 0))(
  ( (Nil!14510) (Cons!14509 (h!15635 (_ BitVec 64)) (t!20828 List!14513)) )
))
(declare-fun arrayNoDuplicates!0 (array!42849 (_ BitVec 32) List!14513) Bool)

(assert (=> b!788978 (= res!534344 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14510))))

(declare-fun b!788979 () Bool)

(declare-fun res!534347 () Bool)

(assert (=> b!788979 (=> (not res!534347) (not e!438539))))

(declare-fun arrayContainsKey!0 (array!42849 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!788979 (= res!534347 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!788980 () Bool)

(declare-fun e!438541 () Unit!27332)

(declare-fun Unit!27334 () Unit!27332)

(assert (=> b!788980 (= e!438541 Unit!27334)))

(assert (=> b!788980 false))

(declare-fun b!788981 () Bool)

(declare-fun res!534346 () Bool)

(assert (=> b!788981 (=> (not res!534346) (not e!438539))))

(assert (=> b!788981 (= res!534346 (and (= (size!20932 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20932 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20932 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!788982 () Bool)

(declare-fun res!534332 () Bool)

(assert (=> b!788982 (=> (not res!534332) (not e!438538))))

(assert (=> b!788982 (= res!534332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!788983 () Bool)

(declare-fun res!534338 () Bool)

(assert (=> b!788983 (=> (not res!534338) (not e!438532))))

(assert (=> b!788983 (= res!534338 e!438534)))

(declare-fun c!87730 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!788983 (= c!87730 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!788984 () Bool)

(assert (=> b!788984 (= e!438542 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20511 a!3186) j!159) a!3186 mask!3328) lt!351995))))

(declare-fun b!788985 () Bool)

(assert (=> b!788985 (= e!438533 e!438535)))

(declare-fun res!534335 () Bool)

(assert (=> b!788985 (=> res!534335 e!438535)))

(assert (=> b!788985 (= res!534335 (not (= lt!351999 lt!351995)))))

(assert (=> b!788985 (= lt!351999 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20511 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!788986 () Bool)

(assert (=> b!788986 (= e!438539 e!438538)))

(declare-fun res!534334 () Bool)

(assert (=> b!788986 (=> (not res!534334) (not e!438538))))

(declare-fun lt!351996 () SeekEntryResult!8111)

(assert (=> b!788986 (= res!534334 (or (= lt!351996 (MissingZero!8111 i!1173)) (= lt!351996 (MissingVacant!8111 i!1173))))))

(assert (=> b!788986 (= lt!351996 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!788987 () Bool)

(declare-fun res!534348 () Bool)

(assert (=> b!788987 (=> (not res!534348) (not e!438536))))

(assert (=> b!788987 (= res!534348 (= (seekEntryOrOpen!0 lt!352003 lt!351997 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!352003 lt!351997 mask!3328)))))

(declare-fun lt!352002 () SeekEntryResult!8111)

(declare-fun b!788988 () Bool)

(assert (=> b!788988 (= e!438534 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20511 a!3186) j!159) a!3186 mask!3328) lt!352002))))

(declare-fun b!788989 () Bool)

(declare-fun Unit!27335 () Unit!27332)

(assert (=> b!788989 (= e!438541 Unit!27335)))

(declare-fun b!788990 () Bool)

(declare-fun res!534339 () Bool)

(assert (=> b!788990 (=> (not res!534339) (not e!438539))))

(assert (=> b!788990 (= res!534339 (validKeyInArray!0 (select (arr!20511 a!3186) j!159)))))

(declare-fun b!788991 () Bool)

(declare-fun res!534349 () Bool)

(assert (=> b!788991 (=> (not res!534349) (not e!438532))))

(assert (=> b!788991 (= res!534349 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20511 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!788992 () Bool)

(assert (=> b!788992 (= e!438537 true)))

(assert (=> b!788992 e!438536))

(declare-fun res!534337 () Bool)

(assert (=> b!788992 (=> (not res!534337) (not e!438536))))

(assert (=> b!788992 (= res!534337 (= lt!351994 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!352001 () Unit!27332)

(assert (=> b!788992 (= lt!352001 e!438541)))

(declare-fun c!87729 () Bool)

(assert (=> b!788992 (= c!87729 (= lt!351994 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!788993 () Bool)

(assert (=> b!788993 (= e!438538 e!438532)))

(declare-fun res!534343 () Bool)

(assert (=> b!788993 (=> (not res!534343) (not e!438532))))

(assert (=> b!788993 (= res!534343 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20511 a!3186) j!159) mask!3328) (select (arr!20511 a!3186) j!159) a!3186 mask!3328) lt!352002))))

(assert (=> b!788993 (= lt!352002 (Intermediate!8111 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!788994 () Bool)

(declare-fun res!534341 () Bool)

(assert (=> b!788994 (=> (not res!534341) (not e!438538))))

(assert (=> b!788994 (= res!534341 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20932 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20932 a!3186))))))

(assert (= (and start!67872 res!534340) b!788981))

(assert (= (and b!788981 res!534346) b!788990))

(assert (= (and b!788990 res!534339) b!788977))

(assert (= (and b!788977 res!534342) b!788979))

(assert (= (and b!788979 res!534347) b!788986))

(assert (= (and b!788986 res!534334) b!788982))

(assert (= (and b!788982 res!534332) b!788978))

(assert (= (and b!788978 res!534344) b!788994))

(assert (= (and b!788994 res!534341) b!788993))

(assert (= (and b!788993 res!534343) b!788991))

(assert (= (and b!788991 res!534349) b!788983))

(assert (= (and b!788983 c!87730) b!788988))

(assert (= (and b!788983 (not c!87730)) b!788976))

(assert (= (and b!788983 res!534338) b!788972))

(assert (= (and b!788972 res!534336) b!788975))

(assert (= (and b!788975 res!534345) b!788984))

(assert (= (and b!788975 (not res!534333)) b!788985))

(assert (= (and b!788985 (not res!534335)) b!788974))

(assert (= (and b!788974 (not res!534350)) b!788992))

(assert (= (and b!788992 c!87729) b!788980))

(assert (= (and b!788992 (not c!87729)) b!788989))

(assert (= (and b!788992 res!534337) b!788987))

(assert (= (and b!788987 res!534348) b!788973))

(declare-fun m!730169 () Bool)

(assert (=> b!788976 m!730169))

(assert (=> b!788976 m!730169))

(declare-fun m!730171 () Bool)

(assert (=> b!788976 m!730171))

(assert (=> b!788988 m!730169))

(assert (=> b!788988 m!730169))

(declare-fun m!730173 () Bool)

(assert (=> b!788988 m!730173))

(declare-fun m!730175 () Bool)

(assert (=> b!788979 m!730175))

(assert (=> b!788975 m!730169))

(assert (=> b!788975 m!730169))

(declare-fun m!730177 () Bool)

(assert (=> b!788975 m!730177))

(declare-fun m!730179 () Bool)

(assert (=> b!788975 m!730179))

(declare-fun m!730181 () Bool)

(assert (=> b!788975 m!730181))

(declare-fun m!730183 () Bool)

(assert (=> start!67872 m!730183))

(declare-fun m!730185 () Bool)

(assert (=> start!67872 m!730185))

(declare-fun m!730187 () Bool)

(assert (=> b!788991 m!730187))

(assert (=> b!788985 m!730169))

(assert (=> b!788985 m!730169))

(assert (=> b!788985 m!730171))

(assert (=> b!788990 m!730169))

(assert (=> b!788990 m!730169))

(declare-fun m!730189 () Bool)

(assert (=> b!788990 m!730189))

(declare-fun m!730191 () Bool)

(assert (=> b!788974 m!730191))

(declare-fun m!730193 () Bool)

(assert (=> b!788974 m!730193))

(declare-fun m!730195 () Bool)

(assert (=> b!788977 m!730195))

(declare-fun m!730197 () Bool)

(assert (=> b!788972 m!730197))

(assert (=> b!788972 m!730191))

(declare-fun m!730199 () Bool)

(assert (=> b!788972 m!730199))

(declare-fun m!730201 () Bool)

(assert (=> b!788972 m!730201))

(assert (=> b!788972 m!730197))

(declare-fun m!730203 () Bool)

(assert (=> b!788972 m!730203))

(declare-fun m!730205 () Bool)

(assert (=> b!788987 m!730205))

(declare-fun m!730207 () Bool)

(assert (=> b!788987 m!730207))

(declare-fun m!730209 () Bool)

(assert (=> b!788986 m!730209))

(assert (=> b!788993 m!730169))

(assert (=> b!788993 m!730169))

(declare-fun m!730211 () Bool)

(assert (=> b!788993 m!730211))

(assert (=> b!788993 m!730211))

(assert (=> b!788993 m!730169))

(declare-fun m!730213 () Bool)

(assert (=> b!788993 m!730213))

(declare-fun m!730215 () Bool)

(assert (=> b!788978 m!730215))

(assert (=> b!788984 m!730169))

(assert (=> b!788984 m!730169))

(declare-fun m!730217 () Bool)

(assert (=> b!788984 m!730217))

(declare-fun m!730219 () Bool)

(assert (=> b!788982 m!730219))

(push 1)

