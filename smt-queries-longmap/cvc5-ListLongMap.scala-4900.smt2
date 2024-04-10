; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67578 () Bool)

(assert start!67578)

(declare-datatypes ((array!42681 0))(
  ( (array!42682 (arr!20430 (Array (_ BitVec 32) (_ BitVec 64))) (size!20851 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42681)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!435109 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!782518 () Bool)

(declare-datatypes ((SeekEntryResult!8030 0))(
  ( (MissingZero!8030 (index!34488 (_ BitVec 32))) (Found!8030 (index!34489 (_ BitVec 32))) (Intermediate!8030 (undefined!8842 Bool) (index!34490 (_ BitVec 32)) (x!65441 (_ BitVec 32))) (Undefined!8030) (MissingVacant!8030 (index!34491 (_ BitVec 32))) )
))
(declare-fun lt!348747 () SeekEntryResult!8030)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42681 (_ BitVec 32)) SeekEntryResult!8030)

(assert (=> b!782518 (= e!435109 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20430 a!3186) j!159) a!3186 mask!3328) lt!348747))))

(declare-fun res!529515 () Bool)

(declare-fun e!435112 () Bool)

(assert (=> start!67578 (=> (not res!529515) (not e!435112))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67578 (= res!529515 (validMask!0 mask!3328))))

(assert (=> start!67578 e!435112))

(assert (=> start!67578 true))

(declare-fun array_inv!16226 (array!42681) Bool)

(assert (=> start!67578 (array_inv!16226 a!3186)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun lt!348745 () SeekEntryResult!8030)

(declare-fun e!435111 () Bool)

(declare-fun b!782519 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42681 (_ BitVec 32)) SeekEntryResult!8030)

(assert (=> b!782519 (= e!435111 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20430 a!3186) j!159) a!3186 mask!3328) lt!348745))))

(declare-fun b!782520 () Bool)

(declare-fun res!529520 () Bool)

(assert (=> b!782520 (=> (not res!529520) (not e!435112))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42681 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!782520 (= res!529520 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!782521 () Bool)

(declare-fun res!529507 () Bool)

(assert (=> b!782521 (=> (not res!529507) (not e!435112))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!782521 (= res!529507 (validKeyInArray!0 k!2102))))

(declare-fun b!782522 () Bool)

(declare-fun e!435113 () Bool)

(declare-fun e!435107 () Bool)

(assert (=> b!782522 (= e!435113 e!435107)))

(declare-fun res!529506 () Bool)

(assert (=> b!782522 (=> (not res!529506) (not e!435107))))

(declare-fun lt!348752 () SeekEntryResult!8030)

(declare-fun lt!348742 () SeekEntryResult!8030)

(assert (=> b!782522 (= res!529506 (= lt!348752 lt!348742))))

(declare-fun lt!348749 () array!42681)

(declare-fun lt!348748 () (_ BitVec 64))

(assert (=> b!782522 (= lt!348742 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348748 lt!348749 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!782522 (= lt!348752 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348748 mask!3328) lt!348748 lt!348749 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!782522 (= lt!348748 (select (store (arr!20430 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!782522 (= lt!348749 (array!42682 (store (arr!20430 a!3186) i!1173 k!2102) (size!20851 a!3186)))))

(declare-fun b!782523 () Bool)

(declare-fun res!529516 () Bool)

(declare-fun e!435114 () Bool)

(assert (=> b!782523 (=> (not res!529516) (not e!435114))))

(declare-datatypes ((List!14432 0))(
  ( (Nil!14429) (Cons!14428 (h!15548 (_ BitVec 64)) (t!20747 List!14432)) )
))
(declare-fun arrayNoDuplicates!0 (array!42681 (_ BitVec 32) List!14432) Bool)

(assert (=> b!782523 (= res!529516 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14429))))

(declare-fun b!782524 () Bool)

(declare-fun res!529512 () Bool)

(assert (=> b!782524 (=> (not res!529512) (not e!435114))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42681 (_ BitVec 32)) Bool)

(assert (=> b!782524 (= res!529512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!782525 () Bool)

(assert (=> b!782525 (= e!435109 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20430 a!3186) j!159) a!3186 mask!3328) (Found!8030 j!159)))))

(declare-fun b!782526 () Bool)

(declare-datatypes ((Unit!27008 0))(
  ( (Unit!27009) )
))
(declare-fun e!435110 () Unit!27008)

(declare-fun Unit!27010 () Unit!27008)

(assert (=> b!782526 (= e!435110 Unit!27010)))

(declare-fun b!782527 () Bool)

(declare-fun res!529513 () Bool)

(assert (=> b!782527 (=> (not res!529513) (not e!435113))))

(assert (=> b!782527 (= res!529513 e!435109)))

(declare-fun c!86913 () Bool)

(assert (=> b!782527 (= c!86913 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!782528 () Bool)

(declare-fun res!529508 () Bool)

(assert (=> b!782528 (=> (not res!529508) (not e!435112))))

(assert (=> b!782528 (= res!529508 (validKeyInArray!0 (select (arr!20430 a!3186) j!159)))))

(declare-fun b!782529 () Bool)

(assert (=> b!782529 (= e!435112 e!435114)))

(declare-fun res!529517 () Bool)

(assert (=> b!782529 (=> (not res!529517) (not e!435114))))

(declare-fun lt!348750 () SeekEntryResult!8030)

(assert (=> b!782529 (= res!529517 (or (= lt!348750 (MissingZero!8030 i!1173)) (= lt!348750 (MissingVacant!8030 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42681 (_ BitVec 32)) SeekEntryResult!8030)

(assert (=> b!782529 (= lt!348750 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!782530 () Bool)

(declare-fun res!529514 () Bool)

(assert (=> b!782530 (=> (not res!529514) (not e!435114))))

(assert (=> b!782530 (= res!529514 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20851 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20851 a!3186))))))

(declare-fun b!782531 () Bool)

(declare-fun e!435108 () Bool)

(assert (=> b!782531 (= e!435107 (not e!435108))))

(declare-fun res!529510 () Bool)

(assert (=> b!782531 (=> res!529510 e!435108)))

(assert (=> b!782531 (= res!529510 (or (not (is-Intermediate!8030 lt!348742)) (bvslt x!1131 (x!65441 lt!348742)) (not (= x!1131 (x!65441 lt!348742))) (not (= index!1321 (index!34490 lt!348742)))))))

(assert (=> b!782531 e!435111))

(declare-fun res!529519 () Bool)

(assert (=> b!782531 (=> (not res!529519) (not e!435111))))

(declare-fun lt!348743 () SeekEntryResult!8030)

(assert (=> b!782531 (= res!529519 (= lt!348743 lt!348745))))

(assert (=> b!782531 (= lt!348745 (Found!8030 j!159))))

(assert (=> b!782531 (= lt!348743 (seekEntryOrOpen!0 (select (arr!20430 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!782531 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!348744 () Unit!27008)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42681 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27008)

(assert (=> b!782531 (= lt!348744 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!782532 () Bool)

(assert (=> b!782532 (= e!435114 e!435113)))

(declare-fun res!529511 () Bool)

(assert (=> b!782532 (=> (not res!529511) (not e!435113))))

(assert (=> b!782532 (= res!529511 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20430 a!3186) j!159) mask!3328) (select (arr!20430 a!3186) j!159) a!3186 mask!3328) lt!348747))))

(assert (=> b!782532 (= lt!348747 (Intermediate!8030 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!782533 () Bool)

(declare-fun Unit!27011 () Unit!27008)

(assert (=> b!782533 (= e!435110 Unit!27011)))

(assert (=> b!782533 false))

(declare-fun b!782534 () Bool)

(declare-fun res!529518 () Bool)

(assert (=> b!782534 (=> (not res!529518) (not e!435113))))

(assert (=> b!782534 (= res!529518 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20430 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!782535 () Bool)

(declare-fun e!435115 () Bool)

(assert (=> b!782535 (= e!435108 e!435115)))

(declare-fun res!529504 () Bool)

(assert (=> b!782535 (=> res!529504 e!435115)))

(declare-fun lt!348746 () (_ BitVec 64))

(assert (=> b!782535 (= res!529504 (= lt!348746 lt!348748))))

(assert (=> b!782535 (= lt!348746 (select (store (arr!20430 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!782536 () Bool)

(assert (=> b!782536 (= e!435115 (= (seekEntryOrOpen!0 lt!348748 lt!348749 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!348748 lt!348749 mask!3328)))))

(assert (=> b!782536 (= lt!348746 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!348751 () Unit!27008)

(assert (=> b!782536 (= lt!348751 e!435110)))

(declare-fun c!86914 () Bool)

(assert (=> b!782536 (= c!86914 (= lt!348746 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!782537 () Bool)

(declare-fun res!529509 () Bool)

(assert (=> b!782537 (=> res!529509 e!435108)))

(assert (=> b!782537 (= res!529509 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20430 a!3186) j!159) a!3186 mask!3328) lt!348745)))))

(declare-fun b!782538 () Bool)

(declare-fun res!529505 () Bool)

(assert (=> b!782538 (=> (not res!529505) (not e!435112))))

(assert (=> b!782538 (= res!529505 (and (= (size!20851 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20851 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20851 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!67578 res!529515) b!782538))

(assert (= (and b!782538 res!529505) b!782528))

(assert (= (and b!782528 res!529508) b!782521))

(assert (= (and b!782521 res!529507) b!782520))

(assert (= (and b!782520 res!529520) b!782529))

(assert (= (and b!782529 res!529517) b!782524))

(assert (= (and b!782524 res!529512) b!782523))

(assert (= (and b!782523 res!529516) b!782530))

(assert (= (and b!782530 res!529514) b!782532))

(assert (= (and b!782532 res!529511) b!782534))

(assert (= (and b!782534 res!529518) b!782527))

(assert (= (and b!782527 c!86913) b!782518))

(assert (= (and b!782527 (not c!86913)) b!782525))

(assert (= (and b!782527 res!529513) b!782522))

(assert (= (and b!782522 res!529506) b!782531))

(assert (= (and b!782531 res!529519) b!782519))

(assert (= (and b!782531 (not res!529510)) b!782537))

(assert (= (and b!782537 (not res!529509)) b!782535))

(assert (= (and b!782535 (not res!529504)) b!782536))

(assert (= (and b!782536 c!86914) b!782533))

(assert (= (and b!782536 (not c!86914)) b!782526))

(declare-fun m!725291 () Bool)

(assert (=> b!782518 m!725291))

(assert (=> b!782518 m!725291))

(declare-fun m!725293 () Bool)

(assert (=> b!782518 m!725293))

(assert (=> b!782537 m!725291))

(assert (=> b!782537 m!725291))

(declare-fun m!725295 () Bool)

(assert (=> b!782537 m!725295))

(declare-fun m!725297 () Bool)

(assert (=> start!67578 m!725297))

(declare-fun m!725299 () Bool)

(assert (=> start!67578 m!725299))

(assert (=> b!782525 m!725291))

(assert (=> b!782525 m!725291))

(assert (=> b!782525 m!725295))

(declare-fun m!725301 () Bool)

(assert (=> b!782535 m!725301))

(declare-fun m!725303 () Bool)

(assert (=> b!782535 m!725303))

(declare-fun m!725305 () Bool)

(assert (=> b!782529 m!725305))

(assert (=> b!782519 m!725291))

(assert (=> b!782519 m!725291))

(declare-fun m!725307 () Bool)

(assert (=> b!782519 m!725307))

(declare-fun m!725309 () Bool)

(assert (=> b!782524 m!725309))

(assert (=> b!782528 m!725291))

(assert (=> b!782528 m!725291))

(declare-fun m!725311 () Bool)

(assert (=> b!782528 m!725311))

(assert (=> b!782531 m!725291))

(assert (=> b!782531 m!725291))

(declare-fun m!725313 () Bool)

(assert (=> b!782531 m!725313))

(declare-fun m!725315 () Bool)

(assert (=> b!782531 m!725315))

(declare-fun m!725317 () Bool)

(assert (=> b!782531 m!725317))

(declare-fun m!725319 () Bool)

(assert (=> b!782534 m!725319))

(declare-fun m!725321 () Bool)

(assert (=> b!782522 m!725321))

(declare-fun m!725323 () Bool)

(assert (=> b!782522 m!725323))

(declare-fun m!725325 () Bool)

(assert (=> b!782522 m!725325))

(assert (=> b!782522 m!725301))

(assert (=> b!782522 m!725323))

(declare-fun m!725327 () Bool)

(assert (=> b!782522 m!725327))

(declare-fun m!725329 () Bool)

(assert (=> b!782536 m!725329))

(declare-fun m!725331 () Bool)

(assert (=> b!782536 m!725331))

(declare-fun m!725333 () Bool)

(assert (=> b!782521 m!725333))

(declare-fun m!725335 () Bool)

(assert (=> b!782523 m!725335))

(declare-fun m!725337 () Bool)

(assert (=> b!782520 m!725337))

(assert (=> b!782532 m!725291))

(assert (=> b!782532 m!725291))

(declare-fun m!725339 () Bool)

(assert (=> b!782532 m!725339))

(assert (=> b!782532 m!725339))

(assert (=> b!782532 m!725291))

(declare-fun m!725341 () Bool)

(assert (=> b!782532 m!725341))

(push 1)

(assert (not b!782536))

(assert (not b!782522))

(assert (not b!782525))

(assert (not b!782537))

(assert (not b!782519))

(assert (not b!782523))

(assert (not start!67578))

(assert (not b!782520))

(assert (not b!782531))

(assert (not b!782529))

(assert (not b!782524))

(assert (not b!782518))

(assert (not b!782532))

(assert (not b!782521))

(assert (not b!782528))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!102667 () Bool)

(assert (=> d!102667 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!67578 d!102667))

(declare-fun d!102675 () Bool)

(assert (=> d!102675 (= (array_inv!16226 a!3186) (bvsge (size!20851 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!67578 d!102675))

(declare-fun b!782839 () Bool)

(declare-fun e!435281 () SeekEntryResult!8030)

(assert (=> b!782839 (= e!435281 (MissingVacant!8030 resIntermediateIndex!5))))

(declare-fun b!782840 () Bool)

(declare-fun e!435279 () SeekEntryResult!8030)

(assert (=> b!782840 (= e!435279 Undefined!8030)))

(declare-fun b!782841 () Bool)

(declare-fun e!435280 () SeekEntryResult!8030)

(assert (=> b!782841 (= e!435280 (Found!8030 index!1321))))

(declare-fun b!782842 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!782842 (= e!435281 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20430 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!782843 () Bool)

(assert (=> b!782843 (= e!435279 e!435280)))

(declare-fun lt!348882 () (_ BitVec 64))

(declare-fun c!86992 () Bool)

(assert (=> b!782843 (= c!86992 (= lt!348882 (select (arr!20430 a!3186) j!159)))))

(declare-fun d!102677 () Bool)

(declare-fun lt!348881 () SeekEntryResult!8030)

(assert (=> d!102677 (and (or (is-Undefined!8030 lt!348881) (not (is-Found!8030 lt!348881)) (and (bvsge (index!34489 lt!348881) #b00000000000000000000000000000000) (bvslt (index!34489 lt!348881) (size!20851 a!3186)))) (or (is-Undefined!8030 lt!348881) (is-Found!8030 lt!348881) (not (is-MissingVacant!8030 lt!348881)) (not (= (index!34491 lt!348881) resIntermediateIndex!5)) (and (bvsge (index!34491 lt!348881) #b00000000000000000000000000000000) (bvslt (index!34491 lt!348881) (size!20851 a!3186)))) (or (is-Undefined!8030 lt!348881) (ite (is-Found!8030 lt!348881) (= (select (arr!20430 a!3186) (index!34489 lt!348881)) (select (arr!20430 a!3186) j!159)) (and (is-MissingVacant!8030 lt!348881) (= (index!34491 lt!348881) resIntermediateIndex!5) (= (select (arr!20430 a!3186) (index!34491 lt!348881)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102677 (= lt!348881 e!435279)))

(declare-fun c!86991 () Bool)

(assert (=> d!102677 (= c!86991 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102677 (= lt!348882 (select (arr!20430 a!3186) index!1321))))

(assert (=> d!102677 (validMask!0 mask!3328)))

(assert (=> d!102677 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20430 a!3186) j!159) a!3186 mask!3328) lt!348881)))

(declare-fun b!782844 () Bool)

(declare-fun c!86990 () Bool)

(assert (=> b!782844 (= c!86990 (= lt!348882 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!782844 (= e!435280 e!435281)))

(assert (= (and d!102677 c!86991) b!782840))

(assert (= (and d!102677 (not c!86991)) b!782843))

(assert (= (and b!782843 c!86992) b!782841))

(assert (= (and b!782843 (not c!86992)) b!782844))

(assert (= (and b!782844 c!86990) b!782839))

(assert (= (and b!782844 (not c!86990)) b!782842))

(declare-fun m!725539 () Bool)

(assert (=> b!782842 m!725539))

(assert (=> b!782842 m!725539))

(assert (=> b!782842 m!725291))

(declare-fun m!725541 () Bool)

(assert (=> b!782842 m!725541))

(declare-fun m!725543 () Bool)

(assert (=> d!102677 m!725543))

(declare-fun m!725545 () Bool)

(assert (=> d!102677 m!725545))

(declare-fun m!725547 () Bool)

(assert (=> d!102677 m!725547))

(assert (=> d!102677 m!725297))

(assert (=> b!782525 d!102677))

(declare-fun b!782906 () Bool)

(declare-fun c!87020 () Bool)

(declare-fun lt!348911 () (_ BitVec 64))

(assert (=> b!782906 (= c!87020 (= lt!348911 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!435318 () SeekEntryResult!8030)

(declare-fun e!435320 () SeekEntryResult!8030)

(assert (=> b!782906 (= e!435318 e!435320)))

(declare-fun b!782907 () Bool)

(declare-fun e!435319 () SeekEntryResult!8030)

(assert (=> b!782907 (= e!435319 e!435318)))

(declare-fun lt!348910 () SeekEntryResult!8030)

(assert (=> b!782907 (= lt!348911 (select (arr!20430 lt!348749) (index!34490 lt!348910)))))

(declare-fun c!87019 () Bool)

(assert (=> b!782907 (= c!87019 (= lt!348911 lt!348748))))

(declare-fun b!782908 () Bool)

(assert (=> b!782908 (= e!435319 Undefined!8030)))

(declare-fun b!782909 () Bool)

(assert (=> b!782909 (= e!435320 (MissingZero!8030 (index!34490 lt!348910)))))

(declare-fun b!782910 () Bool)

(assert (=> b!782910 (= e!435318 (Found!8030 (index!34490 lt!348910)))))

(declare-fun d!102695 () Bool)

(declare-fun lt!348909 () SeekEntryResult!8030)

(assert (=> d!102695 (and (or (is-Undefined!8030 lt!348909) (not (is-Found!8030 lt!348909)) (and (bvsge (index!34489 lt!348909) #b00000000000000000000000000000000) (bvslt (index!34489 lt!348909) (size!20851 lt!348749)))) (or (is-Undefined!8030 lt!348909) (is-Found!8030 lt!348909) (not (is-MissingZero!8030 lt!348909)) (and (bvsge (index!34488 lt!348909) #b00000000000000000000000000000000) (bvslt (index!34488 lt!348909) (size!20851 lt!348749)))) (or (is-Undefined!8030 lt!348909) (is-Found!8030 lt!348909) (is-MissingZero!8030 lt!348909) (not (is-MissingVacant!8030 lt!348909)) (and (bvsge (index!34491 lt!348909) #b00000000000000000000000000000000) (bvslt (index!34491 lt!348909) (size!20851 lt!348749)))) (or (is-Undefined!8030 lt!348909) (ite (is-Found!8030 lt!348909) (= (select (arr!20430 lt!348749) (index!34489 lt!348909)) lt!348748) (ite (is-MissingZero!8030 lt!348909) (= (select (arr!20430 lt!348749) (index!34488 lt!348909)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8030 lt!348909) (= (select (arr!20430 lt!348749) (index!34491 lt!348909)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102695 (= lt!348909 e!435319)))

(declare-fun c!87018 () Bool)

(assert (=> d!102695 (= c!87018 (and (is-Intermediate!8030 lt!348910) (undefined!8842 lt!348910)))))

(assert (=> d!102695 (= lt!348910 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348748 mask!3328) lt!348748 lt!348749 mask!3328))))

(assert (=> d!102695 (validMask!0 mask!3328)))

(assert (=> d!102695 (= (seekEntryOrOpen!0 lt!348748 lt!348749 mask!3328) lt!348909)))

(declare-fun b!782911 () Bool)

(assert (=> b!782911 (= e!435320 (seekKeyOrZeroReturnVacant!0 (x!65441 lt!348910) (index!34490 lt!348910) (index!34490 lt!348910) lt!348748 lt!348749 mask!3328))))

(assert (= (and d!102695 c!87018) b!782908))

(assert (= (and d!102695 (not c!87018)) b!782907))

(assert (= (and b!782907 c!87019) b!782910))

(assert (= (and b!782907 (not c!87019)) b!782906))

(assert (= (and b!782906 c!87020) b!782909))

(assert (= (and b!782906 (not c!87020)) b!782911))

(declare-fun m!725593 () Bool)

(assert (=> b!782907 m!725593))

(declare-fun m!725595 () Bool)

(assert (=> d!102695 m!725595))

(declare-fun m!725597 () Bool)

(assert (=> d!102695 m!725597))

(assert (=> d!102695 m!725323))

(assert (=> d!102695 m!725323))

(assert (=> d!102695 m!725325))

(declare-fun m!725599 () Bool)

(assert (=> d!102695 m!725599))

(assert (=> d!102695 m!725297))

(declare-fun m!725601 () Bool)

(assert (=> b!782911 m!725601))

(assert (=> b!782536 d!102695))

(declare-fun b!782912 () Bool)

(declare-fun e!435323 () SeekEntryResult!8030)

(assert (=> b!782912 (= e!435323 (MissingVacant!8030 index!1321))))

(declare-fun b!782913 () Bool)

(declare-fun e!435321 () SeekEntryResult!8030)

(assert (=> b!782913 (= e!435321 Undefined!8030)))

(declare-fun b!782914 () Bool)

(declare-fun e!435322 () SeekEntryResult!8030)

(assert (=> b!782914 (= e!435322 (Found!8030 index!1321))))

(declare-fun b!782915 () Bool)

(assert (=> b!782915 (= e!435323 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) index!1321 lt!348748 lt!348749 mask!3328))))

(declare-fun b!782916 () Bool)

(assert (=> b!782916 (= e!435321 e!435322)))

(declare-fun c!87023 () Bool)

(declare-fun lt!348913 () (_ BitVec 64))

(assert (=> b!782916 (= c!87023 (= lt!348913 lt!348748))))

(declare-fun lt!348912 () SeekEntryResult!8030)

(declare-fun d!102713 () Bool)

(assert (=> d!102713 (and (or (is-Undefined!8030 lt!348912) (not (is-Found!8030 lt!348912)) (and (bvsge (index!34489 lt!348912) #b00000000000000000000000000000000) (bvslt (index!34489 lt!348912) (size!20851 lt!348749)))) (or (is-Undefined!8030 lt!348912) (is-Found!8030 lt!348912) (not (is-MissingVacant!8030 lt!348912)) (not (= (index!34491 lt!348912) index!1321)) (and (bvsge (index!34491 lt!348912) #b00000000000000000000000000000000) (bvslt (index!34491 lt!348912) (size!20851 lt!348749)))) (or (is-Undefined!8030 lt!348912) (ite (is-Found!8030 lt!348912) (= (select (arr!20430 lt!348749) (index!34489 lt!348912)) lt!348748) (and (is-MissingVacant!8030 lt!348912) (= (index!34491 lt!348912) index!1321) (= (select (arr!20430 lt!348749) (index!34491 lt!348912)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102713 (= lt!348912 e!435321)))

(declare-fun c!87022 () Bool)

(assert (=> d!102713 (= c!87022 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102713 (= lt!348913 (select (arr!20430 lt!348749) index!1321))))

(assert (=> d!102713 (validMask!0 mask!3328)))

(assert (=> d!102713 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!348748 lt!348749 mask!3328) lt!348912)))

(declare-fun b!782917 () Bool)

(declare-fun c!87021 () Bool)

(assert (=> b!782917 (= c!87021 (= lt!348913 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!782917 (= e!435322 e!435323)))

(assert (= (and d!102713 c!87022) b!782913))

(assert (= (and d!102713 (not c!87022)) b!782916))

(assert (= (and b!782916 c!87023) b!782914))

(assert (= (and b!782916 (not c!87023)) b!782917))

(assert (= (and b!782917 c!87021) b!782912))

(assert (= (and b!782917 (not c!87021)) b!782915))

(assert (=> b!782915 m!725539))

(assert (=> b!782915 m!725539))

(declare-fun m!725603 () Bool)

(assert (=> b!782915 m!725603))

(declare-fun m!725605 () Bool)

(assert (=> d!102713 m!725605))

(declare-fun m!725607 () Bool)

(assert (=> d!102713 m!725607))

(declare-fun m!725609 () Bool)

(assert (=> d!102713 m!725609))

(assert (=> d!102713 m!725297))

(assert (=> b!782536 d!102713))

(assert (=> b!782537 d!102677))

(declare-fun b!782954 () Bool)

(declare-fun lt!348927 () SeekEntryResult!8030)

(assert (=> b!782954 (and (bvsge (index!34490 lt!348927) #b00000000000000000000000000000000) (bvslt (index!34490 lt!348927) (size!20851 a!3186)))))

(declare-fun res!529692 () Bool)

(assert (=> b!782954 (= res!529692 (= (select (arr!20430 a!3186) (index!34490 lt!348927)) (select (arr!20430 a!3186) j!159)))))

(declare-fun e!435345 () Bool)

(assert (=> b!782954 (=> res!529692 e!435345)))

(declare-fun e!435343 () Bool)

(assert (=> b!782954 (= e!435343 e!435345)))

(declare-fun b!782955 () Bool)

(declare-fun e!435344 () SeekEntryResult!8030)

(assert (=> b!782955 (= e!435344 (Intermediate!8030 true index!1321 x!1131))))

(declare-fun b!782956 () Bool)

(assert (=> b!782956 (and (bvsge (index!34490 lt!348927) #b00000000000000000000000000000000) (bvslt (index!34490 lt!348927) (size!20851 a!3186)))))

(assert (=> b!782956 (= e!435345 (= (select (arr!20430 a!3186) (index!34490 lt!348927)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!435346 () SeekEntryResult!8030)

(declare-fun b!782957 () Bool)

(assert (=> b!782957 (= e!435346 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20430 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!782958 () Bool)

(assert (=> b!782958 (and (bvsge (index!34490 lt!348927) #b00000000000000000000000000000000) (bvslt (index!34490 lt!348927) (size!20851 a!3186)))))

(declare-fun res!529691 () Bool)

(assert (=> b!782958 (= res!529691 (= (select (arr!20430 a!3186) (index!34490 lt!348927)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!782958 (=> res!529691 e!435345)))

(declare-fun d!102715 () Bool)

(declare-fun e!435347 () Bool)

(assert (=> d!102715 e!435347))

(declare-fun c!87041 () Bool)

(assert (=> d!102715 (= c!87041 (and (is-Intermediate!8030 lt!348927) (undefined!8842 lt!348927)))))

(assert (=> d!102715 (= lt!348927 e!435344)))

(declare-fun c!87040 () Bool)

(assert (=> d!102715 (= c!87040 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!348928 () (_ BitVec 64))

(assert (=> d!102715 (= lt!348928 (select (arr!20430 a!3186) index!1321))))

(assert (=> d!102715 (validMask!0 mask!3328)))

(assert (=> d!102715 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20430 a!3186) j!159) a!3186 mask!3328) lt!348927)))

(declare-fun b!782959 () Bool)

(assert (=> b!782959 (= e!435347 (bvsge (x!65441 lt!348927) #b01111111111111111111111111111110))))

(declare-fun b!782960 () Bool)

(assert (=> b!782960 (= e!435344 e!435346)))

(declare-fun c!87039 () Bool)

(assert (=> b!782960 (= c!87039 (or (= lt!348928 (select (arr!20430 a!3186) j!159)) (= (bvadd lt!348928 lt!348928) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!782961 () Bool)

(assert (=> b!782961 (= e!435346 (Intermediate!8030 false index!1321 x!1131))))

(declare-fun b!782962 () Bool)

(assert (=> b!782962 (= e!435347 e!435343)))

(declare-fun res!529690 () Bool)

(assert (=> b!782962 (= res!529690 (and (is-Intermediate!8030 lt!348927) (not (undefined!8842 lt!348927)) (bvslt (x!65441 lt!348927) #b01111111111111111111111111111110) (bvsge (x!65441 lt!348927) #b00000000000000000000000000000000) (bvsge (x!65441 lt!348927) x!1131)))))

(assert (=> b!782962 (=> (not res!529690) (not e!435343))))

(assert (= (and d!102715 c!87040) b!782955))

(assert (= (and d!102715 (not c!87040)) b!782960))

(assert (= (and b!782960 c!87039) b!782961))

(assert (= (and b!782960 (not c!87039)) b!782957))

(assert (= (and d!102715 c!87041) b!782959))

(assert (= (and d!102715 (not c!87041)) b!782962))

(assert (= (and b!782962 res!529690) b!782954))

(assert (= (and b!782954 (not res!529692)) b!782958))

(assert (= (and b!782958 (not res!529691)) b!782956))

(declare-fun m!725621 () Bool)

(assert (=> b!782956 m!725621))

(assert (=> b!782957 m!725539))

(assert (=> b!782957 m!725539))

(assert (=> b!782957 m!725291))

(declare-fun m!725623 () Bool)

(assert (=> b!782957 m!725623))

(assert (=> b!782958 m!725621))

(assert (=> b!782954 m!725621))

(assert (=> d!102715 m!725547))

(assert (=> d!102715 m!725297))

(assert (=> b!782518 d!102715))

(declare-fun d!102719 () Bool)

(assert (=> d!102719 (= (validKeyInArray!0 (select (arr!20430 a!3186) j!159)) (and (not (= (select (arr!20430 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20430 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!782528 d!102719))

(declare-fun b!782971 () Bool)

(declare-fun e!435356 () SeekEntryResult!8030)

(assert (=> b!782971 (= e!435356 (MissingVacant!8030 resIntermediateIndex!5))))

(declare-fun b!782972 () Bool)

(declare-fun e!435354 () SeekEntryResult!8030)

(assert (=> b!782972 (= e!435354 Undefined!8030)))

(declare-fun b!782973 () Bool)

(declare-fun e!435355 () SeekEntryResult!8030)

(assert (=> b!782973 (= e!435355 (Found!8030 resIntermediateIndex!5))))

(declare-fun b!782974 () Bool)

(assert (=> b!782974 (= e!435356 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20430 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!782975 () Bool)

(assert (=> b!782975 (= e!435354 e!435355)))

(declare-fun c!87046 () Bool)

(declare-fun lt!348936 () (_ BitVec 64))

(assert (=> b!782975 (= c!87046 (= lt!348936 (select (arr!20430 a!3186) j!159)))))

(declare-fun d!102721 () Bool)

(declare-fun lt!348935 () SeekEntryResult!8030)

(assert (=> d!102721 (and (or (is-Undefined!8030 lt!348935) (not (is-Found!8030 lt!348935)) (and (bvsge (index!34489 lt!348935) #b00000000000000000000000000000000) (bvslt (index!34489 lt!348935) (size!20851 a!3186)))) (or (is-Undefined!8030 lt!348935) (is-Found!8030 lt!348935) (not (is-MissingVacant!8030 lt!348935)) (not (= (index!34491 lt!348935) resIntermediateIndex!5)) (and (bvsge (index!34491 lt!348935) #b00000000000000000000000000000000) (bvslt (index!34491 lt!348935) (size!20851 a!3186)))) (or (is-Undefined!8030 lt!348935) (ite (is-Found!8030 lt!348935) (= (select (arr!20430 a!3186) (index!34489 lt!348935)) (select (arr!20430 a!3186) j!159)) (and (is-MissingVacant!8030 lt!348935) (= (index!34491 lt!348935) resIntermediateIndex!5) (= (select (arr!20430 a!3186) (index!34491 lt!348935)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102721 (= lt!348935 e!435354)))

(declare-fun c!87045 () Bool)

(assert (=> d!102721 (= c!87045 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!102721 (= lt!348936 (select (arr!20430 a!3186) resIntermediateIndex!5))))

(assert (=> d!102721 (validMask!0 mask!3328)))

(assert (=> d!102721 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20430 a!3186) j!159) a!3186 mask!3328) lt!348935)))

(declare-fun b!782976 () Bool)

(declare-fun c!87044 () Bool)

(assert (=> b!782976 (= c!87044 (= lt!348936 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!782976 (= e!435355 e!435356)))

(assert (= (and d!102721 c!87045) b!782972))

(assert (= (and d!102721 (not c!87045)) b!782975))

(assert (= (and b!782975 c!87046) b!782973))

(assert (= (and b!782975 (not c!87046)) b!782976))

(assert (= (and b!782976 c!87044) b!782971))

(assert (= (and b!782976 (not c!87044)) b!782974))

(declare-fun m!725625 () Bool)

(assert (=> b!782974 m!725625))

(assert (=> b!782974 m!725625))

(assert (=> b!782974 m!725291))

(declare-fun m!725627 () Bool)

(assert (=> b!782974 m!725627))

(declare-fun m!725629 () Bool)

(assert (=> d!102721 m!725629))

(declare-fun m!725631 () Bool)

(assert (=> d!102721 m!725631))

(assert (=> d!102721 m!725319))

(assert (=> d!102721 m!725297))

(assert (=> b!782519 d!102721))

(declare-fun b!782977 () Bool)

(declare-fun c!87049 () Bool)

(declare-fun lt!348939 () (_ BitVec 64))

(assert (=> b!782977 (= c!87049 (= lt!348939 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!435357 () SeekEntryResult!8030)

(declare-fun e!435359 () SeekEntryResult!8030)

(assert (=> b!782977 (= e!435357 e!435359)))

(declare-fun b!782978 () Bool)

(declare-fun e!435358 () SeekEntryResult!8030)

(assert (=> b!782978 (= e!435358 e!435357)))

(declare-fun lt!348938 () SeekEntryResult!8030)

(assert (=> b!782978 (= lt!348939 (select (arr!20430 a!3186) (index!34490 lt!348938)))))

(declare-fun c!87048 () Bool)

(assert (=> b!782978 (= c!87048 (= lt!348939 k!2102))))

(declare-fun b!782979 () Bool)

(assert (=> b!782979 (= e!435358 Undefined!8030)))

(declare-fun b!782980 () Bool)

(assert (=> b!782980 (= e!435359 (MissingZero!8030 (index!34490 lt!348938)))))

(declare-fun b!782981 () Bool)

(assert (=> b!782981 (= e!435357 (Found!8030 (index!34490 lt!348938)))))

(declare-fun d!102723 () Bool)

(declare-fun lt!348937 () SeekEntryResult!8030)

(assert (=> d!102723 (and (or (is-Undefined!8030 lt!348937) (not (is-Found!8030 lt!348937)) (and (bvsge (index!34489 lt!348937) #b00000000000000000000000000000000) (bvslt (index!34489 lt!348937) (size!20851 a!3186)))) (or (is-Undefined!8030 lt!348937) (is-Found!8030 lt!348937) (not (is-MissingZero!8030 lt!348937)) (and (bvsge (index!34488 lt!348937) #b00000000000000000000000000000000) (bvslt (index!34488 lt!348937) (size!20851 a!3186)))) (or (is-Undefined!8030 lt!348937) (is-Found!8030 lt!348937) (is-MissingZero!8030 lt!348937) (not (is-MissingVacant!8030 lt!348937)) (and (bvsge (index!34491 lt!348937) #b00000000000000000000000000000000) (bvslt (index!34491 lt!348937) (size!20851 a!3186)))) (or (is-Undefined!8030 lt!348937) (ite (is-Found!8030 lt!348937) (= (select (arr!20430 a!3186) (index!34489 lt!348937)) k!2102) (ite (is-MissingZero!8030 lt!348937) (= (select (arr!20430 a!3186) (index!34488 lt!348937)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8030 lt!348937) (= (select (arr!20430 a!3186) (index!34491 lt!348937)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102723 (= lt!348937 e!435358)))

(declare-fun c!87047 () Bool)

(assert (=> d!102723 (= c!87047 (and (is-Intermediate!8030 lt!348938) (undefined!8842 lt!348938)))))

(assert (=> d!102723 (= lt!348938 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!102723 (validMask!0 mask!3328)))

(assert (=> d!102723 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!348937)))

(declare-fun b!782982 () Bool)

(assert (=> b!782982 (= e!435359 (seekKeyOrZeroReturnVacant!0 (x!65441 lt!348938) (index!34490 lt!348938) (index!34490 lt!348938) k!2102 a!3186 mask!3328))))

(assert (= (and d!102723 c!87047) b!782979))

(assert (= (and d!102723 (not c!87047)) b!782978))

(assert (= (and b!782978 c!87048) b!782981))

(assert (= (and b!782978 (not c!87048)) b!782977))

(assert (= (and b!782977 c!87049) b!782980))

(assert (= (and b!782977 (not c!87049)) b!782982))

(declare-fun m!725637 () Bool)

(assert (=> b!782978 m!725637))

(declare-fun m!725639 () Bool)

(assert (=> d!102723 m!725639))

(declare-fun m!725643 () Bool)

(assert (=> d!102723 m!725643))

(declare-fun m!725645 () Bool)

(assert (=> d!102723 m!725645))

(assert (=> d!102723 m!725645))

(declare-fun m!725647 () Bool)

(assert (=> d!102723 m!725647))

(declare-fun m!725649 () Bool)

(assert (=> d!102723 m!725649))

(assert (=> d!102723 m!725297))

(declare-fun m!725651 () Bool)

(assert (=> b!782982 m!725651))

(assert (=> b!782529 d!102723))

(declare-fun b!782987 () Bool)

(declare-fun c!87053 () Bool)

(declare-fun lt!348945 () (_ BitVec 64))

(assert (=> b!782987 (= c!87053 (= lt!348945 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!435363 () SeekEntryResult!8030)

(declare-fun e!435365 () SeekEntryResult!8030)

(assert (=> b!782987 (= e!435363 e!435365)))

(declare-fun b!782988 () Bool)

(declare-fun e!435364 () SeekEntryResult!8030)

(assert (=> b!782988 (= e!435364 e!435363)))

(declare-fun lt!348944 () SeekEntryResult!8030)

(assert (=> b!782988 (= lt!348945 (select (arr!20430 a!3186) (index!34490 lt!348944)))))

(declare-fun c!87052 () Bool)

(assert (=> b!782988 (= c!87052 (= lt!348945 (select (arr!20430 a!3186) j!159)))))

(declare-fun b!782989 () Bool)

(assert (=> b!782989 (= e!435364 Undefined!8030)))

(declare-fun b!782990 () Bool)

(assert (=> b!782990 (= e!435365 (MissingZero!8030 (index!34490 lt!348944)))))

(declare-fun b!782991 () Bool)

(assert (=> b!782991 (= e!435363 (Found!8030 (index!34490 lt!348944)))))

(declare-fun d!102727 () Bool)

(declare-fun lt!348943 () SeekEntryResult!8030)

(assert (=> d!102727 (and (or (is-Undefined!8030 lt!348943) (not (is-Found!8030 lt!348943)) (and (bvsge (index!34489 lt!348943) #b00000000000000000000000000000000) (bvslt (index!34489 lt!348943) (size!20851 a!3186)))) (or (is-Undefined!8030 lt!348943) (is-Found!8030 lt!348943) (not (is-MissingZero!8030 lt!348943)) (and (bvsge (index!34488 lt!348943) #b00000000000000000000000000000000) (bvslt (index!34488 lt!348943) (size!20851 a!3186)))) (or (is-Undefined!8030 lt!348943) (is-Found!8030 lt!348943) (is-MissingZero!8030 lt!348943) (not (is-MissingVacant!8030 lt!348943)) (and (bvsge (index!34491 lt!348943) #b00000000000000000000000000000000) (bvslt (index!34491 lt!348943) (size!20851 a!3186)))) (or (is-Undefined!8030 lt!348943) (ite (is-Found!8030 lt!348943) (= (select (arr!20430 a!3186) (index!34489 lt!348943)) (select (arr!20430 a!3186) j!159)) (ite (is-MissingZero!8030 lt!348943) (= (select (arr!20430 a!3186) (index!34488 lt!348943)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8030 lt!348943) (= (select (arr!20430 a!3186) (index!34491 lt!348943)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102727 (= lt!348943 e!435364)))

(declare-fun c!87051 () Bool)

(assert (=> d!102727 (= c!87051 (and (is-Intermediate!8030 lt!348944) (undefined!8842 lt!348944)))))

(assert (=> d!102727 (= lt!348944 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20430 a!3186) j!159) mask!3328) (select (arr!20430 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!102727 (validMask!0 mask!3328)))

(assert (=> d!102727 (= (seekEntryOrOpen!0 (select (arr!20430 a!3186) j!159) a!3186 mask!3328) lt!348943)))

(declare-fun b!782992 () Bool)

(assert (=> b!782992 (= e!435365 (seekKeyOrZeroReturnVacant!0 (x!65441 lt!348944) (index!34490 lt!348944) (index!34490 lt!348944) (select (arr!20430 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!102727 c!87051) b!782989))

(assert (= (and d!102727 (not c!87051)) b!782988))

(assert (= (and b!782988 c!87052) b!782991))

(assert (= (and b!782988 (not c!87052)) b!782987))

(assert (= (and b!782987 c!87053) b!782990))

(assert (= (and b!782987 (not c!87053)) b!782992))

(declare-fun m!725653 () Bool)

(assert (=> b!782988 m!725653))

(declare-fun m!725655 () Bool)

(assert (=> d!102727 m!725655))

(declare-fun m!725657 () Bool)

(assert (=> d!102727 m!725657))

(assert (=> d!102727 m!725291))

(assert (=> d!102727 m!725339))

(assert (=> d!102727 m!725339))

(assert (=> d!102727 m!725291))

(assert (=> d!102727 m!725341))

(declare-fun m!725659 () Bool)

(assert (=> d!102727 m!725659))

(assert (=> d!102727 m!725297))

(assert (=> b!782992 m!725291))

(declare-fun m!725661 () Bool)

(assert (=> b!782992 m!725661))

(assert (=> b!782531 d!102727))

(declare-fun b!783007 () Bool)

(declare-fun e!435375 () Bool)

(declare-fun e!435376 () Bool)

(assert (=> b!783007 (= e!435375 e!435376)))

(declare-fun lt!348957 () (_ BitVec 64))

(assert (=> b!783007 (= lt!348957 (select (arr!20430 a!3186) j!159))))

(declare-fun lt!348958 () Unit!27008)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42681 (_ BitVec 64) (_ BitVec 32)) Unit!27008)

(assert (=> b!783007 (= lt!348958 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!348957 j!159))))

(assert (=> b!783007 (arrayContainsKey!0 a!3186 lt!348957 #b00000000000000000000000000000000)))

(declare-fun lt!348959 () Unit!27008)

(assert (=> b!783007 (= lt!348959 lt!348958)))

(declare-fun res!529704 () Bool)

(assert (=> b!783007 (= res!529704 (= (seekEntryOrOpen!0 (select (arr!20430 a!3186) j!159) a!3186 mask!3328) (Found!8030 j!159)))))

(assert (=> b!783007 (=> (not res!529704) (not e!435376))))

(declare-fun b!783008 () Bool)

(declare-fun call!35272 () Bool)

(assert (=> b!783008 (= e!435375 call!35272)))

(declare-fun bm!35269 () Bool)

(assert (=> bm!35269 (= call!35272 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!783009 () Bool)

(assert (=> b!783009 (= e!435376 call!35272)))

(declare-fun b!783010 () Bool)

(declare-fun e!435377 () Bool)

(assert (=> b!783010 (= e!435377 e!435375)))

(declare-fun c!87059 () Bool)

(assert (=> b!783010 (= c!87059 (validKeyInArray!0 (select (arr!20430 a!3186) j!159)))))

(declare-fun d!102729 () Bool)

(declare-fun res!529703 () Bool)

(assert (=> d!102729 (=> res!529703 e!435377)))

(assert (=> d!102729 (= res!529703 (bvsge j!159 (size!20851 a!3186)))))

(assert (=> d!102729 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!435377)))

(assert (= (and d!102729 (not res!529703)) b!783010))

(assert (= (and b!783010 c!87059) b!783007))

(assert (= (and b!783010 (not c!87059)) b!783008))

(assert (= (and b!783007 res!529704) b!783009))

(assert (= (or b!783009 b!783008) bm!35269))

(assert (=> b!783007 m!725291))

(declare-fun m!725673 () Bool)

(assert (=> b!783007 m!725673))

(declare-fun m!725675 () Bool)

(assert (=> b!783007 m!725675))

(assert (=> b!783007 m!725291))

(assert (=> b!783007 m!725313))

(declare-fun m!725677 () Bool)

(assert (=> bm!35269 m!725677))

(assert (=> b!783010 m!725291))

(assert (=> b!783010 m!725291))

(assert (=> b!783010 m!725311))

(assert (=> b!782531 d!102729))

(declare-fun d!102735 () Bool)

(assert (=> d!102735 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!348967 () Unit!27008)

(declare-fun choose!38 (array!42681 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27008)

(assert (=> d!102735 (= lt!348967 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!102735 (validMask!0 mask!3328)))

(assert (=> d!102735 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!348967)))

(declare-fun bs!21756 () Bool)

(assert (= bs!21756 d!102735))

(assert (=> bs!21756 m!725315))

(declare-fun m!725691 () Bool)

(assert (=> bs!21756 m!725691))

(assert (=> bs!21756 m!725297))

(assert (=> b!782531 d!102735))

(declare-fun d!102745 () Bool)

(declare-fun res!529720 () Bool)

(declare-fun e!435403 () Bool)

(assert (=> d!102745 (=> res!529720 e!435403)))

(assert (=> d!102745 (= res!529720 (= (select (arr!20430 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!102745 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!435403)))

(declare-fun b!783052 () Bool)

(declare-fun e!435404 () Bool)

(assert (=> b!783052 (= e!435403 e!435404)))

(declare-fun res!529721 () Bool)

(assert (=> b!783052 (=> (not res!529721) (not e!435404))))

(assert (=> b!783052 (= res!529721 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20851 a!3186)))))

(declare-fun b!783053 () Bool)

(assert (=> b!783053 (= e!435404 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!102745 (not res!529720)) b!783052))

(assert (= (and b!783052 res!529721) b!783053))

(declare-fun m!725721 () Bool)

(assert (=> d!102745 m!725721))

(declare-fun m!725723 () Bool)

(assert (=> b!783053 m!725723))

(assert (=> b!782520 d!102745))

(declare-fun b!783054 () Bool)

(declare-fun lt!348977 () SeekEntryResult!8030)

(assert (=> b!783054 (and (bvsge (index!34490 lt!348977) #b00000000000000000000000000000000) (bvslt (index!34490 lt!348977) (size!20851 lt!348749)))))

(declare-fun res!529724 () Bool)

(assert (=> b!783054 (= res!529724 (= (select (arr!20430 lt!348749) (index!34490 lt!348977)) lt!348748))))

(declare-fun e!435407 () Bool)

(assert (=> b!783054 (=> res!529724 e!435407)))

(declare-fun e!435405 () Bool)

(assert (=> b!783054 (= e!435405 e!435407)))

(declare-fun b!783055 () Bool)

(declare-fun e!435406 () SeekEntryResult!8030)

(assert (=> b!783055 (= e!435406 (Intermediate!8030 true index!1321 x!1131))))

(declare-fun b!783056 () Bool)

(assert (=> b!783056 (and (bvsge (index!34490 lt!348977) #b00000000000000000000000000000000) (bvslt (index!34490 lt!348977) (size!20851 lt!348749)))))

(assert (=> b!783056 (= e!435407 (= (select (arr!20430 lt!348749) (index!34490 lt!348977)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!435408 () SeekEntryResult!8030)

(declare-fun b!783057 () Bool)

(assert (=> b!783057 (= e!435408 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!348748 lt!348749 mask!3328))))

(declare-fun b!783058 () Bool)

(assert (=> b!783058 (and (bvsge (index!34490 lt!348977) #b00000000000000000000000000000000) (bvslt (index!34490 lt!348977) (size!20851 lt!348749)))))

(declare-fun res!529723 () Bool)

(assert (=> b!783058 (= res!529723 (= (select (arr!20430 lt!348749) (index!34490 lt!348977)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!783058 (=> res!529723 e!435407)))

(declare-fun d!102755 () Bool)

(declare-fun e!435409 () Bool)

(assert (=> d!102755 e!435409))

(declare-fun c!87075 () Bool)

(assert (=> d!102755 (= c!87075 (and (is-Intermediate!8030 lt!348977) (undefined!8842 lt!348977)))))

(assert (=> d!102755 (= lt!348977 e!435406)))

(declare-fun c!87074 () Bool)

(assert (=> d!102755 (= c!87074 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!348978 () (_ BitVec 64))

(assert (=> d!102755 (= lt!348978 (select (arr!20430 lt!348749) index!1321))))

(assert (=> d!102755 (validMask!0 mask!3328)))

(assert (=> d!102755 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348748 lt!348749 mask!3328) lt!348977)))

(declare-fun b!783059 () Bool)

(assert (=> b!783059 (= e!435409 (bvsge (x!65441 lt!348977) #b01111111111111111111111111111110))))

(declare-fun b!783060 () Bool)

(assert (=> b!783060 (= e!435406 e!435408)))

(declare-fun c!87073 () Bool)

(assert (=> b!783060 (= c!87073 (or (= lt!348978 lt!348748) (= (bvadd lt!348978 lt!348978) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!783061 () Bool)

(assert (=> b!783061 (= e!435408 (Intermediate!8030 false index!1321 x!1131))))

(declare-fun b!783062 () Bool)

(assert (=> b!783062 (= e!435409 e!435405)))

(declare-fun res!529722 () Bool)

(assert (=> b!783062 (= res!529722 (and (is-Intermediate!8030 lt!348977) (not (undefined!8842 lt!348977)) (bvslt (x!65441 lt!348977) #b01111111111111111111111111111110) (bvsge (x!65441 lt!348977) #b00000000000000000000000000000000) (bvsge (x!65441 lt!348977) x!1131)))))

(assert (=> b!783062 (=> (not res!529722) (not e!435405))))

(assert (= (and d!102755 c!87074) b!783055))

(assert (= (and d!102755 (not c!87074)) b!783060))

(assert (= (and b!783060 c!87073) b!783061))

(assert (= (and b!783060 (not c!87073)) b!783057))

(assert (= (and d!102755 c!87075) b!783059))

(assert (= (and d!102755 (not c!87075)) b!783062))

(assert (= (and b!783062 res!529722) b!783054))

(assert (= (and b!783054 (not res!529724)) b!783058))

(assert (= (and b!783058 (not res!529723)) b!783056))

(declare-fun m!725725 () Bool)

(assert (=> b!783056 m!725725))

(assert (=> b!783057 m!725539))

(assert (=> b!783057 m!725539))

(declare-fun m!725727 () Bool)

(assert (=> b!783057 m!725727))

(assert (=> b!783058 m!725725))

(assert (=> b!783054 m!725725))

(assert (=> d!102755 m!725609))

(assert (=> d!102755 m!725297))

(assert (=> b!782522 d!102755))

(declare-fun b!783065 () Bool)

(declare-fun lt!348979 () SeekEntryResult!8030)

(assert (=> b!783065 (and (bvsge (index!34490 lt!348979) #b00000000000000000000000000000000) (bvslt (index!34490 lt!348979) (size!20851 lt!348749)))))

(declare-fun res!529729 () Bool)

(assert (=> b!783065 (= res!529729 (= (select (arr!20430 lt!348749) (index!34490 lt!348979)) lt!348748))))

(declare-fun e!435414 () Bool)

(assert (=> b!783065 (=> res!529729 e!435414)))

(declare-fun e!435412 () Bool)

(assert (=> b!783065 (= e!435412 e!435414)))

(declare-fun b!783066 () Bool)

(declare-fun e!435413 () SeekEntryResult!8030)

(assert (=> b!783066 (= e!435413 (Intermediate!8030 true (toIndex!0 lt!348748 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!783067 () Bool)

(assert (=> b!783067 (and (bvsge (index!34490 lt!348979) #b00000000000000000000000000000000) (bvslt (index!34490 lt!348979) (size!20851 lt!348749)))))

(assert (=> b!783067 (= e!435414 (= (select (arr!20430 lt!348749) (index!34490 lt!348979)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!783068 () Bool)

(declare-fun e!435415 () SeekEntryResult!8030)

(assert (=> b!783068 (= e!435415 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!348748 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!348748 lt!348749 mask!3328))))

(declare-fun b!783069 () Bool)

(assert (=> b!783069 (and (bvsge (index!34490 lt!348979) #b00000000000000000000000000000000) (bvslt (index!34490 lt!348979) (size!20851 lt!348749)))))

(declare-fun res!529728 () Bool)

(assert (=> b!783069 (= res!529728 (= (select (arr!20430 lt!348749) (index!34490 lt!348979)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!783069 (=> res!529728 e!435414)))

(declare-fun d!102759 () Bool)

(declare-fun e!435416 () Bool)

(assert (=> d!102759 e!435416))

(declare-fun c!87078 () Bool)

(assert (=> d!102759 (= c!87078 (and (is-Intermediate!8030 lt!348979) (undefined!8842 lt!348979)))))

(assert (=> d!102759 (= lt!348979 e!435413)))

(declare-fun c!87077 () Bool)

(assert (=> d!102759 (= c!87077 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!348980 () (_ BitVec 64))

(assert (=> d!102759 (= lt!348980 (select (arr!20430 lt!348749) (toIndex!0 lt!348748 mask!3328)))))

(assert (=> d!102759 (validMask!0 mask!3328)))

(assert (=> d!102759 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348748 mask!3328) lt!348748 lt!348749 mask!3328) lt!348979)))

(declare-fun b!783070 () Bool)

(assert (=> b!783070 (= e!435416 (bvsge (x!65441 lt!348979) #b01111111111111111111111111111110))))

(declare-fun b!783071 () Bool)

(assert (=> b!783071 (= e!435413 e!435415)))

(declare-fun c!87076 () Bool)

(assert (=> b!783071 (= c!87076 (or (= lt!348980 lt!348748) (= (bvadd lt!348980 lt!348980) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!783072 () Bool)

(assert (=> b!783072 (= e!435415 (Intermediate!8030 false (toIndex!0 lt!348748 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!783073 () Bool)

(assert (=> b!783073 (= e!435416 e!435412)))

(declare-fun res!529727 () Bool)

(assert (=> b!783073 (= res!529727 (and (is-Intermediate!8030 lt!348979) (not (undefined!8842 lt!348979)) (bvslt (x!65441 lt!348979) #b01111111111111111111111111111110) (bvsge (x!65441 lt!348979) #b00000000000000000000000000000000) (bvsge (x!65441 lt!348979) #b00000000000000000000000000000000)))))

(assert (=> b!783073 (=> (not res!529727) (not e!435412))))

(assert (= (and d!102759 c!87077) b!783066))

(assert (= (and d!102759 (not c!87077)) b!783071))

(assert (= (and b!783071 c!87076) b!783072))

(assert (= (and b!783071 (not c!87076)) b!783068))

(assert (= (and d!102759 c!87078) b!783070))

(assert (= (and d!102759 (not c!87078)) b!783073))

(assert (= (and b!783073 res!529727) b!783065))

(assert (= (and b!783065 (not res!529729)) b!783069))

(assert (= (and b!783069 (not res!529728)) b!783067))

(declare-fun m!725729 () Bool)

(assert (=> b!783067 m!725729))

(assert (=> b!783068 m!725323))

(declare-fun m!725731 () Bool)

(assert (=> b!783068 m!725731))

(assert (=> b!783068 m!725731))

(declare-fun m!725733 () Bool)

(assert (=> b!783068 m!725733))

(assert (=> b!783069 m!725729))

(assert (=> b!783065 m!725729))

(assert (=> d!102759 m!725323))

(declare-fun m!725735 () Bool)

(assert (=> d!102759 m!725735))

(assert (=> d!102759 m!725297))

(assert (=> b!782522 d!102759))

