; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67800 () Bool)

(assert start!67800)

(declare-fun b!788312 () Bool)

(declare-fun e!438157 () Bool)

(declare-datatypes ((SeekEntryResult!8108 0))(
  ( (MissingZero!8108 (index!34800 (_ BitVec 32))) (Found!8108 (index!34801 (_ BitVec 32))) (Intermediate!8108 (undefined!8920 Bool) (index!34802 (_ BitVec 32)) (x!65736 (_ BitVec 32))) (Undefined!8108) (MissingVacant!8108 (index!34803 (_ BitVec 32))) )
))
(declare-fun lt!351714 () SeekEntryResult!8108)

(declare-fun lt!351707 () SeekEntryResult!8108)

(assert (=> b!788312 (= e!438157 (= lt!351714 lt!351707))))

(declare-fun res!534052 () Bool)

(declare-fun e!438161 () Bool)

(assert (=> start!67800 (=> (not res!534052) (not e!438161))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67800 (= res!534052 (validMask!0 mask!3328))))

(assert (=> start!67800 e!438161))

(assert (=> start!67800 true))

(declare-datatypes ((array!42840 0))(
  ( (array!42841 (arr!20508 (Array (_ BitVec 32) (_ BitVec 64))) (size!20929 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42840)

(declare-fun array_inv!16304 (array!42840) Bool)

(assert (=> start!67800 (array_inv!16304 a!3186)))

(declare-fun b!788313 () Bool)

(declare-fun res!534044 () Bool)

(assert (=> b!788313 (=> (not res!534044) (not e!438157))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!351713 () (_ BitVec 64))

(declare-fun lt!351705 () array!42840)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42840 (_ BitVec 32)) SeekEntryResult!8108)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42840 (_ BitVec 32)) SeekEntryResult!8108)

(assert (=> b!788313 (= res!534044 (= (seekEntryOrOpen!0 lt!351713 lt!351705 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351713 lt!351705 mask!3328)))))

(declare-fun b!788314 () Bool)

(declare-fun res!534036 () Bool)

(declare-fun e!438155 () Bool)

(assert (=> b!788314 (=> (not res!534036) (not e!438155))))

(declare-fun e!438158 () Bool)

(assert (=> b!788314 (= res!534036 e!438158)))

(declare-fun c!87546 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!788314 (= c!87546 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!788315 () Bool)

(declare-fun e!438162 () Bool)

(assert (=> b!788315 (= e!438161 e!438162)))

(declare-fun res!534049 () Bool)

(assert (=> b!788315 (=> (not res!534049) (not e!438162))))

(declare-fun lt!351709 () SeekEntryResult!8108)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!788315 (= res!534049 (or (= lt!351709 (MissingZero!8108 i!1173)) (= lt!351709 (MissingVacant!8108 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!788315 (= lt!351709 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!788316 () Bool)

(declare-fun res!534037 () Bool)

(assert (=> b!788316 (=> (not res!534037) (not e!438161))))

(declare-fun arrayContainsKey!0 (array!42840 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!788316 (= res!534037 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!788317 () Bool)

(declare-fun e!438156 () Bool)

(declare-fun e!438163 () Bool)

(assert (=> b!788317 (= e!438156 e!438163)))

(declare-fun res!534039 () Bool)

(assert (=> b!788317 (=> res!534039 e!438163)))

(declare-fun lt!351712 () SeekEntryResult!8108)

(assert (=> b!788317 (= res!534039 (not (= lt!351707 lt!351712)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!788317 (= lt!351707 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20508 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!788318 () Bool)

(assert (=> b!788318 (= e!438162 e!438155)))

(declare-fun res!534051 () Bool)

(assert (=> b!788318 (=> (not res!534051) (not e!438155))))

(declare-fun lt!351708 () SeekEntryResult!8108)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42840 (_ BitVec 32)) SeekEntryResult!8108)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!788318 (= res!534051 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20508 a!3186) j!159) mask!3328) (select (arr!20508 a!3186) j!159) a!3186 mask!3328) lt!351708))))

(assert (=> b!788318 (= lt!351708 (Intermediate!8108 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!788319 () Bool)

(declare-datatypes ((Unit!27320 0))(
  ( (Unit!27321) )
))
(declare-fun e!438160 () Unit!27320)

(declare-fun Unit!27322 () Unit!27320)

(assert (=> b!788319 (= e!438160 Unit!27322)))

(assert (=> b!788319 false))

(declare-fun b!788320 () Bool)

(declare-fun e!438154 () Bool)

(assert (=> b!788320 (= e!438163 e!438154)))

(declare-fun res!534040 () Bool)

(assert (=> b!788320 (=> res!534040 e!438154)))

(declare-fun lt!351710 () (_ BitVec 64))

(assert (=> b!788320 (= res!534040 (= lt!351710 lt!351713))))

(assert (=> b!788320 (= lt!351710 (select (store (arr!20508 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!788321 () Bool)

(assert (=> b!788321 (= e!438154 (or (not (= (select (arr!20508 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= index!1321 resIntermediateIndex!5))))))

(assert (=> b!788321 e!438157))

(declare-fun res!534045 () Bool)

(assert (=> b!788321 (=> (not res!534045) (not e!438157))))

(assert (=> b!788321 (= res!534045 (= lt!351710 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!351706 () Unit!27320)

(assert (=> b!788321 (= lt!351706 e!438160)))

(declare-fun c!87547 () Bool)

(assert (=> b!788321 (= c!87547 (= lt!351710 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!788322 () Bool)

(declare-fun res!534035 () Bool)

(assert (=> b!788322 (=> (not res!534035) (not e!438161))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!788322 (= res!534035 (validKeyInArray!0 (select (arr!20508 a!3186) j!159)))))

(declare-fun b!788323 () Bool)

(assert (=> b!788323 (= e!438158 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20508 a!3186) j!159) a!3186 mask!3328) lt!351708))))

(declare-fun b!788324 () Bool)

(declare-fun res!534042 () Bool)

(assert (=> b!788324 (=> (not res!534042) (not e!438162))))

(declare-datatypes ((List!14510 0))(
  ( (Nil!14507) (Cons!14506 (h!15629 (_ BitVec 64)) (t!20825 List!14510)) )
))
(declare-fun arrayNoDuplicates!0 (array!42840 (_ BitVec 32) List!14510) Bool)

(assert (=> b!788324 (= res!534042 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14507))))

(declare-fun b!788325 () Bool)

(declare-fun res!534050 () Bool)

(assert (=> b!788325 (=> (not res!534050) (not e!438162))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42840 (_ BitVec 32)) Bool)

(assert (=> b!788325 (= res!534050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!788326 () Bool)

(declare-fun res!534048 () Bool)

(assert (=> b!788326 (=> (not res!534048) (not e!438162))))

(assert (=> b!788326 (= res!534048 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20929 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20929 a!3186))))))

(declare-fun b!788327 () Bool)

(declare-fun res!534043 () Bool)

(assert (=> b!788327 (=> (not res!534043) (not e!438161))))

(assert (=> b!788327 (= res!534043 (validKeyInArray!0 k!2102))))

(declare-fun e!438164 () Bool)

(declare-fun b!788328 () Bool)

(assert (=> b!788328 (= e!438164 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20508 a!3186) j!159) a!3186 mask!3328) lt!351712))))

(declare-fun b!788329 () Bool)

(assert (=> b!788329 (= e!438158 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20508 a!3186) j!159) a!3186 mask!3328) (Found!8108 j!159)))))

(declare-fun b!788330 () Bool)

(declare-fun Unit!27323 () Unit!27320)

(assert (=> b!788330 (= e!438160 Unit!27323)))

(declare-fun b!788331 () Bool)

(declare-fun res!534041 () Bool)

(assert (=> b!788331 (=> (not res!534041) (not e!438161))))

(assert (=> b!788331 (= res!534041 (and (= (size!20929 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20929 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20929 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!788332 () Bool)

(declare-fun res!534038 () Bool)

(assert (=> b!788332 (=> (not res!534038) (not e!438155))))

(assert (=> b!788332 (= res!534038 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20508 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!788333 () Bool)

(declare-fun e!438153 () Bool)

(assert (=> b!788333 (= e!438153 (not e!438156))))

(declare-fun res!534046 () Bool)

(assert (=> b!788333 (=> res!534046 e!438156)))

(declare-fun lt!351715 () SeekEntryResult!8108)

(assert (=> b!788333 (= res!534046 (or (not (is-Intermediate!8108 lt!351715)) (bvslt x!1131 (x!65736 lt!351715)) (not (= x!1131 (x!65736 lt!351715))) (not (= index!1321 (index!34802 lt!351715)))))))

(assert (=> b!788333 e!438164))

(declare-fun res!534053 () Bool)

(assert (=> b!788333 (=> (not res!534053) (not e!438164))))

(assert (=> b!788333 (= res!534053 (= lt!351714 lt!351712))))

(assert (=> b!788333 (= lt!351712 (Found!8108 j!159))))

(assert (=> b!788333 (= lt!351714 (seekEntryOrOpen!0 (select (arr!20508 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!788333 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!351716 () Unit!27320)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42840 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27320)

(assert (=> b!788333 (= lt!351716 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!788334 () Bool)

(assert (=> b!788334 (= e!438155 e!438153)))

(declare-fun res!534047 () Bool)

(assert (=> b!788334 (=> (not res!534047) (not e!438153))))

(declare-fun lt!351711 () SeekEntryResult!8108)

(assert (=> b!788334 (= res!534047 (= lt!351711 lt!351715))))

(assert (=> b!788334 (= lt!351715 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351713 lt!351705 mask!3328))))

(assert (=> b!788334 (= lt!351711 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351713 mask!3328) lt!351713 lt!351705 mask!3328))))

(assert (=> b!788334 (= lt!351713 (select (store (arr!20508 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!788334 (= lt!351705 (array!42841 (store (arr!20508 a!3186) i!1173 k!2102) (size!20929 a!3186)))))

(assert (= (and start!67800 res!534052) b!788331))

(assert (= (and b!788331 res!534041) b!788322))

(assert (= (and b!788322 res!534035) b!788327))

(assert (= (and b!788327 res!534043) b!788316))

(assert (= (and b!788316 res!534037) b!788315))

(assert (= (and b!788315 res!534049) b!788325))

(assert (= (and b!788325 res!534050) b!788324))

(assert (= (and b!788324 res!534042) b!788326))

(assert (= (and b!788326 res!534048) b!788318))

(assert (= (and b!788318 res!534051) b!788332))

(assert (= (and b!788332 res!534038) b!788314))

(assert (= (and b!788314 c!87546) b!788323))

(assert (= (and b!788314 (not c!87546)) b!788329))

(assert (= (and b!788314 res!534036) b!788334))

(assert (= (and b!788334 res!534047) b!788333))

(assert (= (and b!788333 res!534053) b!788328))

(assert (= (and b!788333 (not res!534046)) b!788317))

(assert (= (and b!788317 (not res!534039)) b!788320))

(assert (= (and b!788320 (not res!534040)) b!788321))

(assert (= (and b!788321 c!87547) b!788319))

(assert (= (and b!788321 (not c!87547)) b!788330))

(assert (= (and b!788321 res!534045) b!788313))

(assert (= (and b!788313 res!534044) b!788312))

(declare-fun m!729683 () Bool)

(assert (=> b!788332 m!729683))

(declare-fun m!729685 () Bool)

(assert (=> b!788316 m!729685))

(declare-fun m!729687 () Bool)

(assert (=> b!788329 m!729687))

(assert (=> b!788329 m!729687))

(declare-fun m!729689 () Bool)

(assert (=> b!788329 m!729689))

(declare-fun m!729691 () Bool)

(assert (=> b!788334 m!729691))

(declare-fun m!729693 () Bool)

(assert (=> b!788334 m!729693))

(declare-fun m!729695 () Bool)

(assert (=> b!788334 m!729695))

(declare-fun m!729697 () Bool)

(assert (=> b!788334 m!729697))

(declare-fun m!729699 () Bool)

(assert (=> b!788334 m!729699))

(assert (=> b!788334 m!729697))

(assert (=> b!788328 m!729687))

(assert (=> b!788328 m!729687))

(declare-fun m!729701 () Bool)

(assert (=> b!788328 m!729701))

(declare-fun m!729703 () Bool)

(assert (=> start!67800 m!729703))

(declare-fun m!729705 () Bool)

(assert (=> start!67800 m!729705))

(declare-fun m!729707 () Bool)

(assert (=> b!788321 m!729707))

(declare-fun m!729709 () Bool)

(assert (=> b!788327 m!729709))

(assert (=> b!788333 m!729687))

(assert (=> b!788333 m!729687))

(declare-fun m!729711 () Bool)

(assert (=> b!788333 m!729711))

(declare-fun m!729713 () Bool)

(assert (=> b!788333 m!729713))

(declare-fun m!729715 () Bool)

(assert (=> b!788333 m!729715))

(declare-fun m!729717 () Bool)

(assert (=> b!788325 m!729717))

(assert (=> b!788317 m!729687))

(assert (=> b!788317 m!729687))

(assert (=> b!788317 m!729689))

(assert (=> b!788318 m!729687))

(assert (=> b!788318 m!729687))

(declare-fun m!729719 () Bool)

(assert (=> b!788318 m!729719))

(assert (=> b!788318 m!729719))

(assert (=> b!788318 m!729687))

(declare-fun m!729721 () Bool)

(assert (=> b!788318 m!729721))

(declare-fun m!729723 () Bool)

(assert (=> b!788313 m!729723))

(declare-fun m!729725 () Bool)

(assert (=> b!788313 m!729725))

(declare-fun m!729727 () Bool)

(assert (=> b!788324 m!729727))

(assert (=> b!788323 m!729687))

(assert (=> b!788323 m!729687))

(declare-fun m!729729 () Bool)

(assert (=> b!788323 m!729729))

(declare-fun m!729731 () Bool)

(assert (=> b!788315 m!729731))

(assert (=> b!788322 m!729687))

(assert (=> b!788322 m!729687))

(declare-fun m!729733 () Bool)

(assert (=> b!788322 m!729733))

(assert (=> b!788320 m!729691))

(declare-fun m!729735 () Bool)

(assert (=> b!788320 m!729735))

(push 1)

(assert (not b!788317))

(assert (not b!788333))

(assert (not b!788334))

(assert (not b!788318))

(assert (not b!788313))

(assert (not b!788329))

(assert (not b!788322))

(assert (not b!788324))

(assert (not b!788325))

(assert (not b!788323))

(assert (not b!788327))

(assert (not start!67800))

(assert (not b!788316))

(assert (not b!788315))

(assert (not b!788328))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!788552 () Bool)

(declare-fun c!87592 () Bool)

(declare-fun lt!351825 () (_ BitVec 64))

(assert (=> b!788552 (= c!87592 (= lt!351825 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!438286 () SeekEntryResult!8108)

(declare-fun e!438285 () SeekEntryResult!8108)

(assert (=> b!788552 (= e!438286 e!438285)))

(declare-fun b!788553 () Bool)

(declare-fun lt!351827 () SeekEntryResult!8108)

(assert (=> b!788553 (= e!438286 (Found!8108 (index!34802 lt!351827)))))

(declare-fun b!788554 () Bool)

(declare-fun e!438287 () SeekEntryResult!8108)

(assert (=> b!788554 (= e!438287 e!438286)))

(assert (=> b!788554 (= lt!351825 (select (arr!20508 a!3186) (index!34802 lt!351827)))))

(declare-fun c!87593 () Bool)

(assert (=> b!788554 (= c!87593 (= lt!351825 k!2102))))

(declare-fun b!788555 () Bool)

(assert (=> b!788555 (= e!438285 (seekKeyOrZeroReturnVacant!0 (x!65736 lt!351827) (index!34802 lt!351827) (index!34802 lt!351827) k!2102 a!3186 mask!3328))))

(declare-fun d!102841 () Bool)

(declare-fun lt!351826 () SeekEntryResult!8108)

(assert (=> d!102841 (and (or (is-Undefined!8108 lt!351826) (not (is-Found!8108 lt!351826)) (and (bvsge (index!34801 lt!351826) #b00000000000000000000000000000000) (bvslt (index!34801 lt!351826) (size!20929 a!3186)))) (or (is-Undefined!8108 lt!351826) (is-Found!8108 lt!351826) (not (is-MissingZero!8108 lt!351826)) (and (bvsge (index!34800 lt!351826) #b00000000000000000000000000000000) (bvslt (index!34800 lt!351826) (size!20929 a!3186)))) (or (is-Undefined!8108 lt!351826) (is-Found!8108 lt!351826) (is-MissingZero!8108 lt!351826) (not (is-MissingVacant!8108 lt!351826)) (and (bvsge (index!34803 lt!351826) #b00000000000000000000000000000000) (bvslt (index!34803 lt!351826) (size!20929 a!3186)))) (or (is-Undefined!8108 lt!351826) (ite (is-Found!8108 lt!351826) (= (select (arr!20508 a!3186) (index!34801 lt!351826)) k!2102) (ite (is-MissingZero!8108 lt!351826) (= (select (arr!20508 a!3186) (index!34800 lt!351826)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8108 lt!351826) (= (select (arr!20508 a!3186) (index!34803 lt!351826)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102841 (= lt!351826 e!438287)))

(declare-fun c!87591 () Bool)

(assert (=> d!102841 (= c!87591 (and (is-Intermediate!8108 lt!351827) (undefined!8920 lt!351827)))))

(assert (=> d!102841 (= lt!351827 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!102841 (validMask!0 mask!3328)))

(assert (=> d!102841 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!351826)))

(declare-fun b!788556 () Bool)

(assert (=> b!788556 (= e!438287 Undefined!8108)))

(declare-fun b!788557 () Bool)

(assert (=> b!788557 (= e!438285 (MissingZero!8108 (index!34802 lt!351827)))))

(assert (= (and d!102841 c!87591) b!788556))

(assert (= (and d!102841 (not c!87591)) b!788554))

(assert (= (and b!788554 c!87593) b!788553))

(assert (= (and b!788554 (not c!87593)) b!788552))

(assert (= (and b!788552 c!87592) b!788557))

(assert (= (and b!788552 (not c!87592)) b!788555))

(declare-fun m!729887 () Bool)

(assert (=> b!788554 m!729887))

(declare-fun m!729889 () Bool)

(assert (=> b!788555 m!729889))

(declare-fun m!729891 () Bool)

(assert (=> d!102841 m!729891))

(declare-fun m!729893 () Bool)

(assert (=> d!102841 m!729893))

(declare-fun m!729895 () Bool)

(assert (=> d!102841 m!729895))

(declare-fun m!729897 () Bool)

(assert (=> d!102841 m!729897))

(assert (=> d!102841 m!729895))

(declare-fun m!729899 () Bool)

(assert (=> d!102841 m!729899))

(assert (=> d!102841 m!729703))

(assert (=> b!788315 d!102841))

(declare-fun d!102849 () Bool)

(declare-fun res!534189 () Bool)

(declare-fun e!438292 () Bool)

(assert (=> d!102849 (=> res!534189 e!438292)))

(assert (=> d!102849 (= res!534189 (= (select (arr!20508 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!102849 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!438292)))

(declare-fun b!788564 () Bool)

(declare-fun e!438293 () Bool)

(assert (=> b!788564 (= e!438292 e!438293)))

(declare-fun res!534190 () Bool)

(assert (=> b!788564 (=> (not res!534190) (not e!438293))))

(assert (=> b!788564 (= res!534190 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20929 a!3186)))))

(declare-fun b!788565 () Bool)

(assert (=> b!788565 (= e!438293 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!102849 (not res!534189)) b!788564))

(assert (= (and b!788564 res!534190) b!788565))

(declare-fun m!729901 () Bool)

(assert (=> d!102849 m!729901))

(declare-fun m!729903 () Bool)

(assert (=> b!788565 m!729903))

(assert (=> b!788316 d!102849))

(declare-fun d!102851 () Bool)

(assert (=> d!102851 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!788327 d!102851))

(declare-fun e!438356 () SeekEntryResult!8108)

(declare-fun b!788666 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!788666 (= e!438356 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20508 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!788667 () Bool)

(declare-fun e!438355 () SeekEntryResult!8108)

(assert (=> b!788667 (= e!438355 Undefined!8108)))

(declare-fun b!788668 () Bool)

(declare-fun e!438358 () SeekEntryResult!8108)

(assert (=> b!788668 (= e!438355 e!438358)))

(declare-fun lt!351868 () (_ BitVec 64))

(declare-fun c!87632 () Bool)

(assert (=> b!788668 (= c!87632 (= lt!351868 (select (arr!20508 a!3186) j!159)))))

(declare-fun lt!351870 () SeekEntryResult!8108)

(declare-fun d!102853 () Bool)

(assert (=> d!102853 (and (or (is-Undefined!8108 lt!351870) (not (is-Found!8108 lt!351870)) (and (bvsge (index!34801 lt!351870) #b00000000000000000000000000000000) (bvslt (index!34801 lt!351870) (size!20929 a!3186)))) (or (is-Undefined!8108 lt!351870) (is-Found!8108 lt!351870) (not (is-MissingVacant!8108 lt!351870)) (not (= (index!34803 lt!351870) resIntermediateIndex!5)) (and (bvsge (index!34803 lt!351870) #b00000000000000000000000000000000) (bvslt (index!34803 lt!351870) (size!20929 a!3186)))) (or (is-Undefined!8108 lt!351870) (ite (is-Found!8108 lt!351870) (= (select (arr!20508 a!3186) (index!34801 lt!351870)) (select (arr!20508 a!3186) j!159)) (and (is-MissingVacant!8108 lt!351870) (= (index!34803 lt!351870) resIntermediateIndex!5) (= (select (arr!20508 a!3186) (index!34803 lt!351870)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102853 (= lt!351870 e!438355)))

(declare-fun c!87630 () Bool)

(assert (=> d!102853 (= c!87630 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102853 (= lt!351868 (select (arr!20508 a!3186) index!1321))))

(assert (=> d!102853 (validMask!0 mask!3328)))

(assert (=> d!102853 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20508 a!3186) j!159) a!3186 mask!3328) lt!351870)))

(declare-fun b!788669 () Bool)

(assert (=> b!788669 (= e!438356 (MissingVacant!8108 resIntermediateIndex!5))))

(declare-fun b!788671 () Bool)

(declare-fun c!87631 () Bool)

(assert (=> b!788671 (= c!87631 (= lt!351868 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!788671 (= e!438358 e!438356)))

(declare-fun b!788673 () Bool)

(assert (=> b!788673 (= e!438358 (Found!8108 index!1321))))

(assert (= (and d!102853 c!87630) b!788667))

(assert (= (and d!102853 (not c!87630)) b!788668))

(assert (= (and b!788668 c!87632) b!788673))

(assert (= (and b!788668 (not c!87632)) b!788671))

(assert (= (and b!788671 c!87631) b!788669))

(assert (= (and b!788671 (not c!87631)) b!788666))

(declare-fun m!729961 () Bool)

(assert (=> b!788666 m!729961))

(assert (=> b!788666 m!729961))

(assert (=> b!788666 m!729687))

(declare-fun m!729963 () Bool)

(assert (=> b!788666 m!729963))

(declare-fun m!729967 () Bool)

(assert (=> d!102853 m!729967))

(declare-fun m!729969 () Bool)

(assert (=> d!102853 m!729969))

(assert (=> d!102853 m!729707))

(assert (=> d!102853 m!729703))

(assert (=> b!788317 d!102853))

(declare-fun b!788691 () Bool)

(declare-fun e!438369 () SeekEntryResult!8108)

(assert (=> b!788691 (= e!438369 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20508 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!788692 () Bool)

(declare-fun e!438368 () SeekEntryResult!8108)

(assert (=> b!788692 (= e!438368 Undefined!8108)))

(declare-fun b!788693 () Bool)

(declare-fun e!438370 () SeekEntryResult!8108)

(assert (=> b!788693 (= e!438368 e!438370)))

(declare-fun lt!351871 () (_ BitVec 64))

(declare-fun c!87640 () Bool)

(assert (=> b!788693 (= c!87640 (= lt!351871 (select (arr!20508 a!3186) j!159)))))

(declare-fun lt!351872 () SeekEntryResult!8108)

(declare-fun d!102875 () Bool)

(assert (=> d!102875 (and (or (is-Undefined!8108 lt!351872) (not (is-Found!8108 lt!351872)) (and (bvsge (index!34801 lt!351872) #b00000000000000000000000000000000) (bvslt (index!34801 lt!351872) (size!20929 a!3186)))) (or (is-Undefined!8108 lt!351872) (is-Found!8108 lt!351872) (not (is-MissingVacant!8108 lt!351872)) (not (= (index!34803 lt!351872) resIntermediateIndex!5)) (and (bvsge (index!34803 lt!351872) #b00000000000000000000000000000000) (bvslt (index!34803 lt!351872) (size!20929 a!3186)))) (or (is-Undefined!8108 lt!351872) (ite (is-Found!8108 lt!351872) (= (select (arr!20508 a!3186) (index!34801 lt!351872)) (select (arr!20508 a!3186) j!159)) (and (is-MissingVacant!8108 lt!351872) (= (index!34803 lt!351872) resIntermediateIndex!5) (= (select (arr!20508 a!3186) (index!34803 lt!351872)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102875 (= lt!351872 e!438368)))

(declare-fun c!87638 () Bool)

(assert (=> d!102875 (= c!87638 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!102875 (= lt!351871 (select (arr!20508 a!3186) resIntermediateIndex!5))))

(assert (=> d!102875 (validMask!0 mask!3328)))

(assert (=> d!102875 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20508 a!3186) j!159) a!3186 mask!3328) lt!351872)))

(declare-fun b!788694 () Bool)

(assert (=> b!788694 (= e!438369 (MissingVacant!8108 resIntermediateIndex!5))))

(declare-fun b!788695 () Bool)

(declare-fun c!87639 () Bool)

(assert (=> b!788695 (= c!87639 (= lt!351871 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!788695 (= e!438370 e!438369)))

(declare-fun b!788696 () Bool)

(assert (=> b!788696 (= e!438370 (Found!8108 resIntermediateIndex!5))))

(assert (= (and d!102875 c!87638) b!788692))

(assert (= (and d!102875 (not c!87638)) b!788693))

(assert (= (and b!788693 c!87640) b!788696))

(assert (= (and b!788693 (not c!87640)) b!788695))

(assert (= (and b!788695 c!87639) b!788694))

(assert (= (and b!788695 (not c!87639)) b!788691))

(declare-fun m!729975 () Bool)

(assert (=> b!788691 m!729975))

(assert (=> b!788691 m!729975))

(assert (=> b!788691 m!729687))

(declare-fun m!729977 () Bool)

(assert (=> b!788691 m!729977))

(declare-fun m!729979 () Bool)

(assert (=> d!102875 m!729979))

(declare-fun m!729981 () Bool)

(assert (=> d!102875 m!729981))

(assert (=> d!102875 m!729683))

(assert (=> d!102875 m!729703))

(assert (=> b!788328 d!102875))

(declare-fun b!788772 () Bool)

(declare-fun lt!351896 () SeekEntryResult!8108)

(assert (=> b!788772 (and (bvsge (index!34802 lt!351896) #b00000000000000000000000000000000) (bvslt (index!34802 lt!351896) (size!20929 a!3186)))))

(declare-fun res!534252 () Bool)

(assert (=> b!788772 (= res!534252 (= (select (arr!20508 a!3186) (index!34802 lt!351896)) (select (arr!20508 a!3186) j!159)))))

(declare-fun e!438413 () Bool)

(assert (=> b!788772 (=> res!534252 e!438413)))

(declare-fun e!438414 () Bool)

(assert (=> b!788772 (= e!438414 e!438413)))

(declare-fun b!788773 () Bool)

(declare-fun e!438416 () Bool)

(assert (=> b!788773 (= e!438416 (bvsge (x!65736 lt!351896) #b01111111111111111111111111111110))))

(declare-fun b!788774 () Bool)

(declare-fun e!438415 () SeekEntryResult!8108)

(assert (=> b!788774 (= e!438415 (Intermediate!8108 false index!1321 x!1131))))

(declare-fun b!788775 () Bool)

(declare-fun e!438412 () SeekEntryResult!8108)

(assert (=> b!788775 (= e!438412 (Intermediate!8108 true index!1321 x!1131))))

(declare-fun b!788776 () Bool)

(assert (=> b!788776 (= e!438415 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20508 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!788777 () Bool)

(assert (=> b!788777 (and (bvsge (index!34802 lt!351896) #b00000000000000000000000000000000) (bvslt (index!34802 lt!351896) (size!20929 a!3186)))))

(assert (=> b!788777 (= e!438413 (= (select (arr!20508 a!3186) (index!34802 lt!351896)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!102879 () Bool)

(assert (=> d!102879 e!438416))

(declare-fun c!87670 () Bool)

(assert (=> d!102879 (= c!87670 (and (is-Intermediate!8108 lt!351896) (undefined!8920 lt!351896)))))

(assert (=> d!102879 (= lt!351896 e!438412)))

(declare-fun c!87671 () Bool)

(assert (=> d!102879 (= c!87671 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!351897 () (_ BitVec 64))

(assert (=> d!102879 (= lt!351897 (select (arr!20508 a!3186) index!1321))))

(assert (=> d!102879 (validMask!0 mask!3328)))

(assert (=> d!102879 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20508 a!3186) j!159) a!3186 mask!3328) lt!351896)))

(declare-fun b!788771 () Bool)

(assert (=> b!788771 (= e!438416 e!438414)))

(declare-fun res!534250 () Bool)

(assert (=> b!788771 (= res!534250 (and (is-Intermediate!8108 lt!351896) (not (undefined!8920 lt!351896)) (bvslt (x!65736 lt!351896) #b01111111111111111111111111111110) (bvsge (x!65736 lt!351896) #b00000000000000000000000000000000) (bvsge (x!65736 lt!351896) x!1131)))))

(assert (=> b!788771 (=> (not res!534250) (not e!438414))))

(declare-fun b!788778 () Bool)

(assert (=> b!788778 (= e!438412 e!438415)))

(declare-fun c!87669 () Bool)

(assert (=> b!788778 (= c!87669 (or (= lt!351897 (select (arr!20508 a!3186) j!159)) (= (bvadd lt!351897 lt!351897) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!788779 () Bool)

(assert (=> b!788779 (and (bvsge (index!34802 lt!351896) #b00000000000000000000000000000000) (bvslt (index!34802 lt!351896) (size!20929 a!3186)))))

(declare-fun res!534251 () Bool)

(assert (=> b!788779 (= res!534251 (= (select (arr!20508 a!3186) (index!34802 lt!351896)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!788779 (=> res!534251 e!438413)))

(assert (= (and d!102879 c!87671) b!788775))

(assert (= (and d!102879 (not c!87671)) b!788778))

(assert (= (and b!788778 c!87669) b!788774))

(assert (= (and b!788778 (not c!87669)) b!788776))

(assert (= (and d!102879 c!87670) b!788773))

(assert (= (and d!102879 (not c!87670)) b!788771))

(assert (= (and b!788771 res!534250) b!788772))

(assert (= (and b!788772 (not res!534252)) b!788779))

(assert (= (and b!788779 (not res!534251)) b!788777))

(declare-fun m!730023 () Bool)

(assert (=> b!788779 m!730023))

(assert (=> b!788772 m!730023))

(assert (=> d!102879 m!729707))

(assert (=> d!102879 m!729703))

(assert (=> b!788777 m!730023))

(assert (=> b!788776 m!729961))

(assert (=> b!788776 m!729961))

(assert (=> b!788776 m!729687))

(declare-fun m!730025 () Bool)

(assert (=> b!788776 m!730025))

(assert (=> b!788323 d!102879))

(declare-fun b!788781 () Bool)

(declare-fun lt!351898 () SeekEntryResult!8108)

(assert (=> b!788781 (and (bvsge (index!34802 lt!351898) #b00000000000000000000000000000000) (bvslt (index!34802 lt!351898) (size!20929 lt!351705)))))

(declare-fun res!534255 () Bool)

(assert (=> b!788781 (= res!534255 (= (select (arr!20508 lt!351705) (index!34802 lt!351898)) lt!351713))))

(declare-fun e!438418 () Bool)

(assert (=> b!788781 (=> res!534255 e!438418)))

(declare-fun e!438419 () Bool)

(assert (=> b!788781 (= e!438419 e!438418)))

(declare-fun b!788782 () Bool)

(declare-fun e!438421 () Bool)

(assert (=> b!788782 (= e!438421 (bvsge (x!65736 lt!351898) #b01111111111111111111111111111110))))

(declare-fun b!788783 () Bool)

(declare-fun e!438420 () SeekEntryResult!8108)

(assert (=> b!788783 (= e!438420 (Intermediate!8108 false index!1321 x!1131))))

(declare-fun b!788784 () Bool)

(declare-fun e!438417 () SeekEntryResult!8108)

(assert (=> b!788784 (= e!438417 (Intermediate!8108 true index!1321 x!1131))))

(declare-fun b!788785 () Bool)

(assert (=> b!788785 (= e!438420 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!351713 lt!351705 mask!3328))))

(declare-fun b!788786 () Bool)

(assert (=> b!788786 (and (bvsge (index!34802 lt!351898) #b00000000000000000000000000000000) (bvslt (index!34802 lt!351898) (size!20929 lt!351705)))))

(assert (=> b!788786 (= e!438418 (= (select (arr!20508 lt!351705) (index!34802 lt!351898)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!102899 () Bool)

(assert (=> d!102899 e!438421))

(declare-fun c!87673 () Bool)

(assert (=> d!102899 (= c!87673 (and (is-Intermediate!8108 lt!351898) (undefined!8920 lt!351898)))))

(assert (=> d!102899 (= lt!351898 e!438417)))

(declare-fun c!87674 () Bool)

(assert (=> d!102899 (= c!87674 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!351899 () (_ BitVec 64))

(assert (=> d!102899 (= lt!351899 (select (arr!20508 lt!351705) index!1321))))

(assert (=> d!102899 (validMask!0 mask!3328)))

(assert (=> d!102899 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351713 lt!351705 mask!3328) lt!351898)))

(declare-fun b!788780 () Bool)

(assert (=> b!788780 (= e!438421 e!438419)))

(declare-fun res!534253 () Bool)

(assert (=> b!788780 (= res!534253 (and (is-Intermediate!8108 lt!351898) (not (undefined!8920 lt!351898)) (bvslt (x!65736 lt!351898) #b01111111111111111111111111111110) (bvsge (x!65736 lt!351898) #b00000000000000000000000000000000) (bvsge (x!65736 lt!351898) x!1131)))))

(assert (=> b!788780 (=> (not res!534253) (not e!438419))))

(declare-fun b!788787 () Bool)

(assert (=> b!788787 (= e!438417 e!438420)))

(declare-fun c!87672 () Bool)

(assert (=> b!788787 (= c!87672 (or (= lt!351899 lt!351713) (= (bvadd lt!351899 lt!351899) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!788788 () Bool)

(assert (=> b!788788 (and (bvsge (index!34802 lt!351898) #b00000000000000000000000000000000) (bvslt (index!34802 lt!351898) (size!20929 lt!351705)))))

(declare-fun res!534254 () Bool)

(assert (=> b!788788 (= res!534254 (= (select (arr!20508 lt!351705) (index!34802 lt!351898)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!788788 (=> res!534254 e!438418)))

(assert (= (and d!102899 c!87674) b!788784))

(assert (= (and d!102899 (not c!87674)) b!788787))

(assert (= (and b!788787 c!87672) b!788783))

(assert (= (and b!788787 (not c!87672)) b!788785))

(assert (= (and d!102899 c!87673) b!788782))

(assert (= (and d!102899 (not c!87673)) b!788780))

(assert (= (and b!788780 res!534253) b!788781))

(assert (= (and b!788781 (not res!534255)) b!788788))

(assert (= (and b!788788 (not res!534254)) b!788786))

(declare-fun m!730027 () Bool)

(assert (=> b!788788 m!730027))

(assert (=> b!788781 m!730027))

(declare-fun m!730029 () Bool)

(assert (=> d!102899 m!730029))

(assert (=> d!102899 m!729703))

(assert (=> b!788786 m!730027))

(assert (=> b!788785 m!729961))

(assert (=> b!788785 m!729961))

(declare-fun m!730031 () Bool)

(assert (=> b!788785 m!730031))

(assert (=> b!788334 d!102899))

(declare-fun b!788790 () Bool)

(declare-fun lt!351900 () SeekEntryResult!8108)

(assert (=> b!788790 (and (bvsge (index!34802 lt!351900) #b00000000000000000000000000000000) (bvslt (index!34802 lt!351900) (size!20929 lt!351705)))))

(declare-fun res!534258 () Bool)

(assert (=> b!788790 (= res!534258 (= (select (arr!20508 lt!351705) (index!34802 lt!351900)) lt!351713))))

(declare-fun e!438423 () Bool)

(assert (=> b!788790 (=> res!534258 e!438423)))

(declare-fun e!438424 () Bool)

(assert (=> b!788790 (= e!438424 e!438423)))

(declare-fun b!788791 () Bool)

(declare-fun e!438426 () Bool)

(assert (=> b!788791 (= e!438426 (bvsge (x!65736 lt!351900) #b01111111111111111111111111111110))))

(declare-fun b!788792 () Bool)

(declare-fun e!438425 () SeekEntryResult!8108)

(assert (=> b!788792 (= e!438425 (Intermediate!8108 false (toIndex!0 lt!351713 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!788793 () Bool)

(declare-fun e!438422 () SeekEntryResult!8108)

(assert (=> b!788793 (= e!438422 (Intermediate!8108 true (toIndex!0 lt!351713 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!788794 () Bool)

(assert (=> b!788794 (= e!438425 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!351713 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!351713 lt!351705 mask!3328))))

(declare-fun b!788795 () Bool)

(assert (=> b!788795 (and (bvsge (index!34802 lt!351900) #b00000000000000000000000000000000) (bvslt (index!34802 lt!351900) (size!20929 lt!351705)))))

(assert (=> b!788795 (= e!438423 (= (select (arr!20508 lt!351705) (index!34802 lt!351900)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!102901 () Bool)

(assert (=> d!102901 e!438426))

(declare-fun c!87676 () Bool)

(assert (=> d!102901 (= c!87676 (and (is-Intermediate!8108 lt!351900) (undefined!8920 lt!351900)))))

(assert (=> d!102901 (= lt!351900 e!438422)))

(declare-fun c!87677 () Bool)

(assert (=> d!102901 (= c!87677 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!351901 () (_ BitVec 64))

(assert (=> d!102901 (= lt!351901 (select (arr!20508 lt!351705) (toIndex!0 lt!351713 mask!3328)))))

(assert (=> d!102901 (validMask!0 mask!3328)))

(assert (=> d!102901 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351713 mask!3328) lt!351713 lt!351705 mask!3328) lt!351900)))

(declare-fun b!788789 () Bool)

(assert (=> b!788789 (= e!438426 e!438424)))

(declare-fun res!534256 () Bool)

(assert (=> b!788789 (= res!534256 (and (is-Intermediate!8108 lt!351900) (not (undefined!8920 lt!351900)) (bvslt (x!65736 lt!351900) #b01111111111111111111111111111110) (bvsge (x!65736 lt!351900) #b00000000000000000000000000000000) (bvsge (x!65736 lt!351900) #b00000000000000000000000000000000)))))

(assert (=> b!788789 (=> (not res!534256) (not e!438424))))

(declare-fun b!788796 () Bool)

(assert (=> b!788796 (= e!438422 e!438425)))

(declare-fun c!87675 () Bool)

(assert (=> b!788796 (= c!87675 (or (= lt!351901 lt!351713) (= (bvadd lt!351901 lt!351901) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!788797 () Bool)

(assert (=> b!788797 (and (bvsge (index!34802 lt!351900) #b00000000000000000000000000000000) (bvslt (index!34802 lt!351900) (size!20929 lt!351705)))))

(declare-fun res!534257 () Bool)

(assert (=> b!788797 (= res!534257 (= (select (arr!20508 lt!351705) (index!34802 lt!351900)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!788797 (=> res!534257 e!438423)))

(assert (= (and d!102901 c!87677) b!788793))

(assert (= (and d!102901 (not c!87677)) b!788796))

(assert (= (and b!788796 c!87675) b!788792))

(assert (= (and b!788796 (not c!87675)) b!788794))

(assert (= (and d!102901 c!87676) b!788791))

(assert (= (and d!102901 (not c!87676)) b!788789))

(assert (= (and b!788789 res!534256) b!788790))

(assert (= (and b!788790 (not res!534258)) b!788797))

(assert (= (and b!788797 (not res!534257)) b!788795))

(declare-fun m!730033 () Bool)

(assert (=> b!788797 m!730033))

(assert (=> b!788790 m!730033))

(assert (=> d!102901 m!729697))

(declare-fun m!730035 () Bool)

(assert (=> d!102901 m!730035))

(assert (=> d!102901 m!729703))

(assert (=> b!788795 m!730033))

(assert (=> b!788794 m!729697))

(declare-fun m!730037 () Bool)

(assert (=> b!788794 m!730037))

(assert (=> b!788794 m!730037))

(declare-fun m!730039 () Bool)

(assert (=> b!788794 m!730039))

(assert (=> b!788334 d!102901))

(declare-fun d!102903 () Bool)

(declare-fun lt!351910 () (_ BitVec 32))

(declare-fun lt!351909 () (_ BitVec 32))

(assert (=> d!102903 (= lt!351910 (bvmul (bvxor lt!351909 (bvlshr lt!351909 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102903 (= lt!351909 ((_ extract 31 0) (bvand (bvxor lt!351713 (bvlshr lt!351713 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102903 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!534259 (let ((h!15634 ((_ extract 31 0) (bvand (bvxor lt!351713 (bvlshr lt!351713 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65746 (bvmul (bvxor h!15634 (bvlshr h!15634 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65746 (bvlshr x!65746 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!534259 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!534259 #b00000000000000000000000000000000))))))

(assert (=> d!102903 (= (toIndex!0 lt!351713 mask!3328) (bvand (bvxor lt!351910 (bvlshr lt!351910 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!788334 d!102903))

(declare-fun b!788804 () Bool)

(declare-fun c!87682 () Bool)

(declare-fun lt!351911 () (_ BitVec 64))

(assert (=> b!788804 (= c!87682 (= lt!351911 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!438431 () SeekEntryResult!8108)

(declare-fun e!438430 () SeekEntryResult!8108)

(assert (=> b!788804 (= e!438431 e!438430)))

(declare-fun b!788805 () Bool)

(declare-fun lt!351913 () SeekEntryResult!8108)

(assert (=> b!788805 (= e!438431 (Found!8108 (index!34802 lt!351913)))))

(declare-fun b!788806 () Bool)

(declare-fun e!438432 () SeekEntryResult!8108)

(assert (=> b!788806 (= e!438432 e!438431)))

(assert (=> b!788806 (= lt!351911 (select (arr!20508 lt!351705) (index!34802 lt!351913)))))

(declare-fun c!87683 () Bool)

(assert (=> b!788806 (= c!87683 (= lt!351911 lt!351713))))

(declare-fun b!788807 () Bool)

(assert (=> b!788807 (= e!438430 (seekKeyOrZeroReturnVacant!0 (x!65736 lt!351913) (index!34802 lt!351913) (index!34802 lt!351913) lt!351713 lt!351705 mask!3328))))

(declare-fun d!102907 () Bool)

(declare-fun lt!351912 () SeekEntryResult!8108)

(assert (=> d!102907 (and (or (is-Undefined!8108 lt!351912) (not (is-Found!8108 lt!351912)) (and (bvsge (index!34801 lt!351912) #b00000000000000000000000000000000) (bvslt (index!34801 lt!351912) (size!20929 lt!351705)))) (or (is-Undefined!8108 lt!351912) (is-Found!8108 lt!351912) (not (is-MissingZero!8108 lt!351912)) (and (bvsge (index!34800 lt!351912) #b00000000000000000000000000000000) (bvslt (index!34800 lt!351912) (size!20929 lt!351705)))) (or (is-Undefined!8108 lt!351912) (is-Found!8108 lt!351912) (is-MissingZero!8108 lt!351912) (not (is-MissingVacant!8108 lt!351912)) (and (bvsge (index!34803 lt!351912) #b00000000000000000000000000000000) (bvslt (index!34803 lt!351912) (size!20929 lt!351705)))) (or (is-Undefined!8108 lt!351912) (ite (is-Found!8108 lt!351912) (= (select (arr!20508 lt!351705) (index!34801 lt!351912)) lt!351713) (ite (is-MissingZero!8108 lt!351912) (= (select (arr!20508 lt!351705) (index!34800 lt!351912)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8108 lt!351912) (= (select (arr!20508 lt!351705) (index!34803 lt!351912)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102907 (= lt!351912 e!438432)))

(declare-fun c!87681 () Bool)

(assert (=> d!102907 (= c!87681 (and (is-Intermediate!8108 lt!351913) (undefined!8920 lt!351913)))))

(assert (=> d!102907 (= lt!351913 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351713 mask!3328) lt!351713 lt!351705 mask!3328))))

(assert (=> d!102907 (validMask!0 mask!3328)))

(assert (=> d!102907 (= (seekEntryOrOpen!0 lt!351713 lt!351705 mask!3328) lt!351912)))

(declare-fun b!788808 () Bool)

(assert (=> b!788808 (= e!438432 Undefined!8108)))

(declare-fun b!788809 () Bool)

(assert (=> b!788809 (= e!438430 (MissingZero!8108 (index!34802 lt!351913)))))

(assert (= (and d!102907 c!87681) b!788808))

(assert (= (and d!102907 (not c!87681)) b!788806))

(assert (= (and b!788806 c!87683) b!788805))

(assert (= (and b!788806 (not c!87683)) b!788804))

(assert (= (and b!788804 c!87682) b!788809))

(assert (= (and b!788804 (not c!87682)) b!788807))

(declare-fun m!730051 () Bool)

(assert (=> b!788806 m!730051))

(declare-fun m!730053 () Bool)

(assert (=> b!788807 m!730053))

(declare-fun m!730055 () Bool)

(assert (=> d!102907 m!730055))

(declare-fun m!730057 () Bool)

(assert (=> d!102907 m!730057))

(assert (=> d!102907 m!729697))

(assert (=> d!102907 m!729699))

(assert (=> d!102907 m!729697))

(declare-fun m!730059 () Bool)

(assert (=> d!102907 m!730059))

(assert (=> d!102907 m!729703))

(assert (=> b!788313 d!102907))

(declare-fun e!438434 () SeekEntryResult!8108)

(declare-fun b!788810 () Bool)

(assert (=> b!788810 (= e!438434 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) index!1321 lt!351713 lt!351705 mask!3328))))

(declare-fun b!788811 () Bool)

(declare-fun e!438433 () SeekEntryResult!8108)

(assert (=> b!788811 (= e!438433 Undefined!8108)))

(declare-fun b!788812 () Bool)

(declare-fun e!438435 () SeekEntryResult!8108)

(assert (=> b!788812 (= e!438433 e!438435)))

(declare-fun c!87686 () Bool)

(declare-fun lt!351914 () (_ BitVec 64))

(assert (=> b!788812 (= c!87686 (= lt!351914 lt!351713))))

(declare-fun lt!351915 () SeekEntryResult!8108)

(declare-fun d!102909 () Bool)

(assert (=> d!102909 (and (or (is-Undefined!8108 lt!351915) (not (is-Found!8108 lt!351915)) (and (bvsge (index!34801 lt!351915) #b00000000000000000000000000000000) (bvslt (index!34801 lt!351915) (size!20929 lt!351705)))) (or (is-Undefined!8108 lt!351915) (is-Found!8108 lt!351915) (not (is-MissingVacant!8108 lt!351915)) (not (= (index!34803 lt!351915) index!1321)) (and (bvsge (index!34803 lt!351915) #b00000000000000000000000000000000) (bvslt (index!34803 lt!351915) (size!20929 lt!351705)))) (or (is-Undefined!8108 lt!351915) (ite (is-Found!8108 lt!351915) (= (select (arr!20508 lt!351705) (index!34801 lt!351915)) lt!351713) (and (is-MissingVacant!8108 lt!351915) (= (index!34803 lt!351915) index!1321) (= (select (arr!20508 lt!351705) (index!34803 lt!351915)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102909 (= lt!351915 e!438433)))

(declare-fun c!87684 () Bool)

(assert (=> d!102909 (= c!87684 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102909 (= lt!351914 (select (arr!20508 lt!351705) index!1321))))

(assert (=> d!102909 (validMask!0 mask!3328)))

(assert (=> d!102909 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351713 lt!351705 mask!3328) lt!351915)))

(declare-fun b!788813 () Bool)

(assert (=> b!788813 (= e!438434 (MissingVacant!8108 index!1321))))

(declare-fun b!788814 () Bool)

(declare-fun c!87685 () Bool)

(assert (=> b!788814 (= c!87685 (= lt!351914 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!788814 (= e!438435 e!438434)))

(declare-fun b!788815 () Bool)

(assert (=> b!788815 (= e!438435 (Found!8108 index!1321))))

(assert (= (and d!102909 c!87684) b!788811))

(assert (= (and d!102909 (not c!87684)) b!788812))

(assert (= (and b!788812 c!87686) b!788815))

(assert (= (and b!788812 (not c!87686)) b!788814))

(assert (= (and b!788814 c!87685) b!788813))

(assert (= (and b!788814 (not c!87685)) b!788810))

(assert (=> b!788810 m!729961))

(assert (=> b!788810 m!729961))

(declare-fun m!730061 () Bool)

(assert (=> b!788810 m!730061))

(declare-fun m!730063 () Bool)

(assert (=> d!102909 m!730063))

(declare-fun m!730065 () Bool)

(assert (=> d!102909 m!730065))

(assert (=> d!102909 m!730029))

(assert (=> d!102909 m!729703))

(assert (=> b!788313 d!102909))

(declare-fun d!102911 () Bool)

(declare-fun res!534273 () Bool)

(declare-fun e!438453 () Bool)

(assert (=> d!102911 (=> res!534273 e!438453)))

(assert (=> d!102911 (= res!534273 (bvsge #b00000000000000000000000000000000 (size!20929 a!3186)))))

(assert (=> d!102911 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14507) e!438453)))

(declare-fun b!788838 () Bool)

(declare-fun e!438454 () Bool)

(declare-fun e!438455 () Bool)

(assert (=> b!788838 (= e!438454 e!438455)))

(declare-fun c!87692 () Bool)

(assert (=> b!788838 (= c!87692 (validKeyInArray!0 (select (arr!20508 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35290 () Bool)

(declare-fun call!35293 () Bool)

(assert (=> bm!35290 (= call!35293 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!87692 (Cons!14506 (select (arr!20508 a!3186) #b00000000000000000000000000000000) Nil!14507) Nil!14507)))))

(declare-fun b!788839 () Bool)

(assert (=> b!788839 (= e!438455 call!35293)))

(declare-fun b!788840 () Bool)

(assert (=> b!788840 (= e!438453 e!438454)))

(declare-fun res!534272 () Bool)

(assert (=> b!788840 (=> (not res!534272) (not e!438454))))

(declare-fun e!438456 () Bool)

(assert (=> b!788840 (= res!534272 (not e!438456))))

(declare-fun res!534274 () Bool)

(assert (=> b!788840 (=> (not res!534274) (not e!438456))))

(assert (=> b!788840 (= res!534274 (validKeyInArray!0 (select (arr!20508 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!788841 () Bool)

(declare-fun contains!4112 (List!14510 (_ BitVec 64)) Bool)

(assert (=> b!788841 (= e!438456 (contains!4112 Nil!14507 (select (arr!20508 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!788842 () Bool)

(assert (=> b!788842 (= e!438455 call!35293)))

(assert (= (and d!102911 (not res!534273)) b!788840))

(assert (= (and b!788840 res!534274) b!788841))

(assert (= (and b!788840 res!534272) b!788838))

(assert (= (and b!788838 c!87692) b!788839))

(assert (= (and b!788838 (not c!87692)) b!788842))

(assert (= (or b!788839 b!788842) bm!35290))

(assert (=> b!788838 m!729901))

(assert (=> b!788838 m!729901))

(declare-fun m!730073 () Bool)

(assert (=> b!788838 m!730073))

(assert (=> bm!35290 m!729901))

(declare-fun m!730075 () Bool)

(assert (=> bm!35290 m!730075))

(assert (=> b!788840 m!729901))

(assert (=> b!788840 m!729901))

(assert (=> b!788840 m!730073))

(assert (=> b!788841 m!729901))

(assert (=> b!788841 m!729901))

(declare-fun m!730077 () Bool)

(assert (=> b!788841 m!730077))

(assert (=> b!788324 d!102911))

(declare-fun b!788851 () Bool)

(declare-fun e!438464 () Bool)

(declare-fun e!438463 () Bool)

(assert (=> b!788851 (= e!438464 e!438463)))

(declare-fun c!87695 () Bool)

(assert (=> b!788851 (= c!87695 (validKeyInArray!0 (select (arr!20508 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!788852 () Bool)

(declare-fun e!438465 () Bool)

(declare-fun call!35296 () Bool)

(assert (=> b!788852 (= e!438465 call!35296)))

(declare-fun d!102915 () Bool)

(declare-fun res!534280 () Bool)

(assert (=> d!102915 (=> res!534280 e!438464)))

(assert (=> d!102915 (= res!534280 (bvsge #b00000000000000000000000000000000 (size!20929 a!3186)))))

(assert (=> d!102915 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!438464)))

(declare-fun b!788853 () Bool)

(assert (=> b!788853 (= e!438463 e!438465)))

(declare-fun lt!351934 () (_ BitVec 64))

(assert (=> b!788853 (= lt!351934 (select (arr!20508 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!351936 () Unit!27320)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42840 (_ BitVec 64) (_ BitVec 32)) Unit!27320)

(assert (=> b!788853 (= lt!351936 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!351934 #b00000000000000000000000000000000))))

(assert (=> b!788853 (arrayContainsKey!0 a!3186 lt!351934 #b00000000000000000000000000000000)))

(declare-fun lt!351935 () Unit!27320)

(assert (=> b!788853 (= lt!351935 lt!351936)))

(declare-fun res!534279 () Bool)

(assert (=> b!788853 (= res!534279 (= (seekEntryOrOpen!0 (select (arr!20508 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!8108 #b00000000000000000000000000000000)))))

(assert (=> b!788853 (=> (not res!534279) (not e!438465))))

(declare-fun bm!35293 () Bool)

(assert (=> bm!35293 (= call!35296 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!788854 () Bool)

(assert (=> b!788854 (= e!438463 call!35296)))

(assert (= (and d!102915 (not res!534280)) b!788851))

(assert (= (and b!788851 c!87695) b!788853))

(assert (= (and b!788851 (not c!87695)) b!788854))

(assert (= (and b!788853 res!534279) b!788852))

(assert (= (or b!788852 b!788854) bm!35293))

(assert (=> b!788851 m!729901))

(assert (=> b!788851 m!729901))

(assert (=> b!788851 m!730073))

(assert (=> b!788853 m!729901))

(declare-fun m!730081 () Bool)

(assert (=> b!788853 m!730081))

(declare-fun m!730083 () Bool)

(assert (=> b!788853 m!730083))

(assert (=> b!788853 m!729901))

(declare-fun m!730085 () Bool)

(assert (=> b!788853 m!730085))

(declare-fun m!730087 () Bool)

(assert (=> bm!35293 m!730087))

(assert (=> b!788325 d!102915))

(declare-fun d!102919 () Bool)

(assert (=> d!102919 (= (validKeyInArray!0 (select (arr!20508 a!3186) j!159)) (and (not (= (select (arr!20508 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20508 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!788322 d!102919))

(declare-fun d!102921 () Bool)

(assert (=> d!102921 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!67800 d!102921))

(declare-fun d!102929 () Bool)

(assert (=> d!102929 (= (array_inv!16304 a!3186) (bvsge (size!20929 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!67800 d!102929))

(declare-fun b!788891 () Bool)

(declare-fun c!87715 () Bool)

(declare-fun lt!351950 () (_ BitVec 64))

(assert (=> b!788891 (= c!87715 (= lt!351950 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!438485 () SeekEntryResult!8108)

(declare-fun e!438484 () SeekEntryResult!8108)

(assert (=> b!788891 (= e!438485 e!438484)))

(declare-fun b!788892 () Bool)

(declare-fun lt!351952 () SeekEntryResult!8108)

(assert (=> b!788892 (= e!438485 (Found!8108 (index!34802 lt!351952)))))

(declare-fun b!788893 () Bool)

(declare-fun e!438486 () SeekEntryResult!8108)

(assert (=> b!788893 (= e!438486 e!438485)))

(assert (=> b!788893 (= lt!351950 (select (arr!20508 a!3186) (index!34802 lt!351952)))))

(declare-fun c!87716 () Bool)

(assert (=> b!788893 (= c!87716 (= lt!351950 (select (arr!20508 a!3186) j!159)))))

(declare-fun b!788894 () Bool)

(assert (=> b!788894 (= e!438484 (seekKeyOrZeroReturnVacant!0 (x!65736 lt!351952) (index!34802 lt!351952) (index!34802 lt!351952) (select (arr!20508 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!102933 () Bool)

(declare-fun lt!351951 () SeekEntryResult!8108)

(assert (=> d!102933 (and (or (is-Undefined!8108 lt!351951) (not (is-Found!8108 lt!351951)) (and (bvsge (index!34801 lt!351951) #b00000000000000000000000000000000) (bvslt (index!34801 lt!351951) (size!20929 a!3186)))) (or (is-Undefined!8108 lt!351951) (is-Found!8108 lt!351951) (not (is-MissingZero!8108 lt!351951)) (and (bvsge (index!34800 lt!351951) #b00000000000000000000000000000000) (bvslt (index!34800 lt!351951) (size!20929 a!3186)))) (or (is-Undefined!8108 lt!351951) (is-Found!8108 lt!351951) (is-MissingZero!8108 lt!351951) (not (is-MissingVacant!8108 lt!351951)) (and (bvsge (index!34803 lt!351951) #b00000000000000000000000000000000) (bvslt (index!34803 lt!351951) (size!20929 a!3186)))) (or (is-Undefined!8108 lt!351951) (ite (is-Found!8108 lt!351951) (= (select (arr!20508 a!3186) (index!34801 lt!351951)) (select (arr!20508 a!3186) j!159)) (ite (is-MissingZero!8108 lt!351951) (= (select (arr!20508 a!3186) (index!34800 lt!351951)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8108 lt!351951) (= (select (arr!20508 a!3186) (index!34803 lt!351951)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102933 (= lt!351951 e!438486)))

(declare-fun c!87714 () Bool)

(assert (=> d!102933 (= c!87714 (and (is-Intermediate!8108 lt!351952) (undefined!8920 lt!351952)))))

(assert (=> d!102933 (= lt!351952 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20508 a!3186) j!159) mask!3328) (select (arr!20508 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!102933 (validMask!0 mask!3328)))

(assert (=> d!102933 (= (seekEntryOrOpen!0 (select (arr!20508 a!3186) j!159) a!3186 mask!3328) lt!351951)))

(declare-fun b!788895 () Bool)

(assert (=> b!788895 (= e!438486 Undefined!8108)))

(declare-fun b!788896 () Bool)

(assert (=> b!788896 (= e!438484 (MissingZero!8108 (index!34802 lt!351952)))))

(assert (= (and d!102933 c!87714) b!788895))

(assert (= (and d!102933 (not c!87714)) b!788893))

(assert (= (and b!788893 c!87716) b!788892))

(assert (= (and b!788893 (not c!87716)) b!788891))

(assert (= (and b!788891 c!87715) b!788896))

(assert (= (and b!788891 (not c!87715)) b!788894))

(declare-fun m!730119 () Bool)

(assert (=> b!788893 m!730119))

(assert (=> b!788894 m!729687))

(declare-fun m!730121 () Bool)

(assert (=> b!788894 m!730121))

(declare-fun m!730123 () Bool)

(assert (=> d!102933 m!730123))

(declare-fun m!730125 () Bool)

(assert (=> d!102933 m!730125))

(assert (=> d!102933 m!729719))

(assert (=> d!102933 m!729687))

(assert (=> d!102933 m!729721))

(assert (=> d!102933 m!729687))

(assert (=> d!102933 m!729719))

(declare-fun m!730127 () Bool)

(assert (=> d!102933 m!730127))

(assert (=> d!102933 m!729703))

(assert (=> b!788333 d!102933))

(declare-fun b!788897 () Bool)

(declare-fun e!438488 () Bool)

(declare-fun e!438487 () Bool)

(assert (=> b!788897 (= e!438488 e!438487)))

(declare-fun c!87717 () Bool)

(assert (=> b!788897 (= c!87717 (validKeyInArray!0 (select (arr!20508 a!3186) j!159)))))

(declare-fun b!788898 () Bool)

(declare-fun e!438489 () Bool)

(declare-fun call!35297 () Bool)

(assert (=> b!788898 (= e!438489 call!35297)))

(declare-fun d!102937 () Bool)

(declare-fun res!534282 () Bool)

(assert (=> d!102937 (=> res!534282 e!438488)))

(assert (=> d!102937 (= res!534282 (bvsge j!159 (size!20929 a!3186)))))

(assert (=> d!102937 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!438488)))

(declare-fun b!788899 () Bool)

(assert (=> b!788899 (= e!438487 e!438489)))

(declare-fun lt!351953 () (_ BitVec 64))

(assert (=> b!788899 (= lt!351953 (select (arr!20508 a!3186) j!159))))

(declare-fun lt!351955 () Unit!27320)

(assert (=> b!788899 (= lt!351955 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!351953 j!159))))

(assert (=> b!788899 (arrayContainsKey!0 a!3186 lt!351953 #b00000000000000000000000000000000)))

(declare-fun lt!351954 () Unit!27320)

(assert (=> b!788899 (= lt!351954 lt!351955)))

(declare-fun res!534281 () Bool)

(assert (=> b!788899 (= res!534281 (= (seekEntryOrOpen!0 (select (arr!20508 a!3186) j!159) a!3186 mask!3328) (Found!8108 j!159)))))

(assert (=> b!788899 (=> (not res!534281) (not e!438489))))

(declare-fun bm!35294 () Bool)

(assert (=> bm!35294 (= call!35297 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!788900 () Bool)

(assert (=> b!788900 (= e!438487 call!35297)))

(assert (= (and d!102937 (not res!534282)) b!788897))

(assert (= (and b!788897 c!87717) b!788899))

(assert (= (and b!788897 (not c!87717)) b!788900))

(assert (= (and b!788899 res!534281) b!788898))

(assert (= (or b!788898 b!788900) bm!35294))

(assert (=> b!788897 m!729687))

(assert (=> b!788897 m!729687))

(assert (=> b!788897 m!729733))

(assert (=> b!788899 m!729687))

(declare-fun m!730129 () Bool)

(assert (=> b!788899 m!730129))

(declare-fun m!730131 () Bool)

(assert (=> b!788899 m!730131))

(assert (=> b!788899 m!729687))

(assert (=> b!788899 m!729711))

(declare-fun m!730133 () Bool)

(assert (=> bm!35294 m!730133))

(assert (=> b!788333 d!102937))

(declare-fun d!102939 () Bool)

(assert (=> d!102939 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!351958 () Unit!27320)

(declare-fun choose!38 (array!42840 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27320)

(assert (=> d!102939 (= lt!351958 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!102939 (validMask!0 mask!3328)))

(assert (=> d!102939 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!351958)))

(declare-fun bs!21837 () Bool)

(assert (= bs!21837 d!102939))

(assert (=> bs!21837 m!729713))

(declare-fun m!730137 () Bool)

(assert (=> bs!21837 m!730137))

(assert (=> bs!21837 m!729703))

(assert (=> b!788333 d!102939))

(declare-fun b!788908 () Bool)

(declare-fun lt!351959 () SeekEntryResult!8108)

(assert (=> b!788908 (and (bvsge (index!34802 lt!351959) #b00000000000000000000000000000000) (bvslt (index!34802 lt!351959) (size!20929 a!3186)))))

(declare-fun res!534291 () Bool)

(assert (=> b!788908 (= res!534291 (= (select (arr!20508 a!3186) (index!34802 lt!351959)) (select (arr!20508 a!3186) j!159)))))

(declare-fun e!438497 () Bool)

