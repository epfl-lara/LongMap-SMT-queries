; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67802 () Bool)

(assert start!67802)

(declare-datatypes ((SeekEntryResult!8109 0))(
  ( (MissingZero!8109 (index!34804 (_ BitVec 32))) (Found!8109 (index!34805 (_ BitVec 32))) (Intermediate!8109 (undefined!8921 Bool) (index!34806 (_ BitVec 32)) (x!65737 (_ BitVec 32))) (Undefined!8109) (MissingVacant!8109 (index!34807 (_ BitVec 32))) )
))
(declare-fun lt!351745 () SeekEntryResult!8109)

(declare-datatypes ((array!42842 0))(
  ( (array!42843 (arr!20509 (Array (_ BitVec 32) (_ BitVec 64))) (size!20930 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42842)

(declare-fun e!438191 () Bool)

(declare-fun b!788381 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42842 (_ BitVec 32)) SeekEntryResult!8109)

(assert (=> b!788381 (= e!438191 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20509 a!3186) j!159) a!3186 mask!3328) lt!351745))))

(declare-fun b!788382 () Bool)

(declare-fun e!438192 () Bool)

(declare-fun lt!351749 () SeekEntryResult!8109)

(declare-fun lt!351752 () SeekEntryResult!8109)

(assert (=> b!788382 (= e!438192 (= lt!351749 lt!351752))))

(declare-fun b!788383 () Bool)

(declare-fun res!534098 () Bool)

(declare-fun e!438199 () Bool)

(assert (=> b!788383 (=> (not res!534098) (not e!438199))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!788383 (= res!534098 (validKeyInArray!0 (select (arr!20509 a!3186) j!159)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!788384 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42842 (_ BitVec 32)) SeekEntryResult!8109)

(assert (=> b!788384 (= e!438191 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20509 a!3186) j!159) a!3186 mask!3328) (Found!8109 j!159)))))

(declare-fun b!788385 () Bool)

(declare-fun res!534101 () Bool)

(assert (=> b!788385 (=> (not res!534101) (not e!438199))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42842 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!788385 (= res!534101 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!788386 () Bool)

(declare-fun res!534105 () Bool)

(declare-fun e!438198 () Bool)

(assert (=> b!788386 (=> (not res!534105) (not e!438198))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42842 (_ BitVec 32)) Bool)

(assert (=> b!788386 (= res!534105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!534095 () Bool)

(assert (=> start!67802 (=> (not res!534095) (not e!438199))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67802 (= res!534095 (validMask!0 mask!3328))))

(assert (=> start!67802 e!438199))

(assert (=> start!67802 true))

(declare-fun array_inv!16305 (array!42842) Bool)

(assert (=> start!67802 (array_inv!16305 a!3186)))

(declare-fun b!788387 () Bool)

(declare-fun res!534093 () Bool)

(assert (=> b!788387 (=> (not res!534093) (not e!438199))))

(assert (=> b!788387 (= res!534093 (validKeyInArray!0 k0!2102))))

(declare-fun b!788388 () Bool)

(declare-fun e!438189 () Bool)

(declare-fun e!438197 () Bool)

(assert (=> b!788388 (= e!438189 e!438197)))

(declare-fun res!534102 () Bool)

(assert (=> b!788388 (=> res!534102 e!438197)))

(declare-fun lt!351741 () SeekEntryResult!8109)

(assert (=> b!788388 (= res!534102 (not (= lt!351752 lt!351741)))))

(assert (=> b!788388 (= lt!351752 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20509 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!788389 () Bool)

(declare-fun e!438193 () Bool)

(assert (=> b!788389 (= e!438197 e!438193)))

(declare-fun res!534104 () Bool)

(assert (=> b!788389 (=> res!534104 e!438193)))

(declare-fun lt!351742 () (_ BitVec 64))

(declare-fun lt!351743 () (_ BitVec 64))

(assert (=> b!788389 (= res!534104 (= lt!351742 lt!351743))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!788389 (= lt!351742 (select (store (arr!20509 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!788390 () Bool)

(assert (=> b!788390 (= e!438193 (or (not (= (select (arr!20509 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= index!1321 resIntermediateIndex!5))))))

(assert (=> b!788390 e!438192))

(declare-fun res!534099 () Bool)

(assert (=> b!788390 (=> (not res!534099) (not e!438192))))

(assert (=> b!788390 (= res!534099 (= lt!351742 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!27324 0))(
  ( (Unit!27325) )
))
(declare-fun lt!351747 () Unit!27324)

(declare-fun e!438190 () Unit!27324)

(assert (=> b!788390 (= lt!351747 e!438190)))

(declare-fun c!87552 () Bool)

(assert (=> b!788390 (= c!87552 (= lt!351742 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!788391 () Bool)

(declare-fun res!534107 () Bool)

(assert (=> b!788391 (=> (not res!534107) (not e!438198))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!788391 (= res!534107 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20930 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20930 a!3186))))))

(declare-fun b!788392 () Bool)

(declare-fun res!534097 () Bool)

(declare-fun e!438195 () Bool)

(assert (=> b!788392 (=> (not res!534097) (not e!438195))))

(assert (=> b!788392 (= res!534097 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20509 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!788393 () Bool)

(declare-fun res!534108 () Bool)

(assert (=> b!788393 (=> (not res!534108) (not e!438199))))

(assert (=> b!788393 (= res!534108 (and (= (size!20930 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20930 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20930 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!788394 () Bool)

(assert (=> b!788394 (= e!438198 e!438195)))

(declare-fun res!534109 () Bool)

(assert (=> b!788394 (=> (not res!534109) (not e!438195))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!788394 (= res!534109 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20509 a!3186) j!159) mask!3328) (select (arr!20509 a!3186) j!159) a!3186 mask!3328) lt!351745))))

(assert (=> b!788394 (= lt!351745 (Intermediate!8109 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!788395 () Bool)

(assert (=> b!788395 (= e!438199 e!438198)))

(declare-fun res!534106 () Bool)

(assert (=> b!788395 (=> (not res!534106) (not e!438198))))

(declare-fun lt!351744 () SeekEntryResult!8109)

(assert (=> b!788395 (= res!534106 (or (= lt!351744 (MissingZero!8109 i!1173)) (= lt!351744 (MissingVacant!8109 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42842 (_ BitVec 32)) SeekEntryResult!8109)

(assert (=> b!788395 (= lt!351744 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!788396 () Bool)

(declare-fun e!438196 () Bool)

(assert (=> b!788396 (= e!438196 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20509 a!3186) j!159) a!3186 mask!3328) lt!351741))))

(declare-fun b!788397 () Bool)

(declare-fun Unit!27326 () Unit!27324)

(assert (=> b!788397 (= e!438190 Unit!27326)))

(assert (=> b!788397 false))

(declare-fun b!788398 () Bool)

(declare-fun e!438194 () Bool)

(assert (=> b!788398 (= e!438194 (not e!438189))))

(declare-fun res!534092 () Bool)

(assert (=> b!788398 (=> res!534092 e!438189)))

(declare-fun lt!351751 () SeekEntryResult!8109)

(get-info :version)

(assert (=> b!788398 (= res!534092 (or (not ((_ is Intermediate!8109) lt!351751)) (bvslt x!1131 (x!65737 lt!351751)) (not (= x!1131 (x!65737 lt!351751))) (not (= index!1321 (index!34806 lt!351751)))))))

(assert (=> b!788398 e!438196))

(declare-fun res!534103 () Bool)

(assert (=> b!788398 (=> (not res!534103) (not e!438196))))

(assert (=> b!788398 (= res!534103 (= lt!351749 lt!351741))))

(assert (=> b!788398 (= lt!351741 (Found!8109 j!159))))

(assert (=> b!788398 (= lt!351749 (seekEntryOrOpen!0 (select (arr!20509 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!788398 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!351746 () Unit!27324)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42842 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27324)

(assert (=> b!788398 (= lt!351746 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!788399 () Bool)

(declare-fun res!534094 () Bool)

(assert (=> b!788399 (=> (not res!534094) (not e!438198))))

(declare-datatypes ((List!14511 0))(
  ( (Nil!14508) (Cons!14507 (h!15630 (_ BitVec 64)) (t!20826 List!14511)) )
))
(declare-fun arrayNoDuplicates!0 (array!42842 (_ BitVec 32) List!14511) Bool)

(assert (=> b!788399 (= res!534094 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14508))))

(declare-fun b!788400 () Bool)

(declare-fun res!534110 () Bool)

(assert (=> b!788400 (=> (not res!534110) (not e!438192))))

(declare-fun lt!351748 () array!42842)

(assert (=> b!788400 (= res!534110 (= (seekEntryOrOpen!0 lt!351743 lt!351748 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351743 lt!351748 mask!3328)))))

(declare-fun b!788401 () Bool)

(declare-fun Unit!27327 () Unit!27324)

(assert (=> b!788401 (= e!438190 Unit!27327)))

(declare-fun b!788402 () Bool)

(assert (=> b!788402 (= e!438195 e!438194)))

(declare-fun res!534096 () Bool)

(assert (=> b!788402 (=> (not res!534096) (not e!438194))))

(declare-fun lt!351750 () SeekEntryResult!8109)

(assert (=> b!788402 (= res!534096 (= lt!351750 lt!351751))))

(assert (=> b!788402 (= lt!351751 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351743 lt!351748 mask!3328))))

(assert (=> b!788402 (= lt!351750 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351743 mask!3328) lt!351743 lt!351748 mask!3328))))

(assert (=> b!788402 (= lt!351743 (select (store (arr!20509 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!788402 (= lt!351748 (array!42843 (store (arr!20509 a!3186) i!1173 k0!2102) (size!20930 a!3186)))))

(declare-fun b!788403 () Bool)

(declare-fun res!534100 () Bool)

(assert (=> b!788403 (=> (not res!534100) (not e!438195))))

(assert (=> b!788403 (= res!534100 e!438191)))

(declare-fun c!87553 () Bool)

(assert (=> b!788403 (= c!87553 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!67802 res!534095) b!788393))

(assert (= (and b!788393 res!534108) b!788383))

(assert (= (and b!788383 res!534098) b!788387))

(assert (= (and b!788387 res!534093) b!788385))

(assert (= (and b!788385 res!534101) b!788395))

(assert (= (and b!788395 res!534106) b!788386))

(assert (= (and b!788386 res!534105) b!788399))

(assert (= (and b!788399 res!534094) b!788391))

(assert (= (and b!788391 res!534107) b!788394))

(assert (= (and b!788394 res!534109) b!788392))

(assert (= (and b!788392 res!534097) b!788403))

(assert (= (and b!788403 c!87553) b!788381))

(assert (= (and b!788403 (not c!87553)) b!788384))

(assert (= (and b!788403 res!534100) b!788402))

(assert (= (and b!788402 res!534096) b!788398))

(assert (= (and b!788398 res!534103) b!788396))

(assert (= (and b!788398 (not res!534092)) b!788388))

(assert (= (and b!788388 (not res!534102)) b!788389))

(assert (= (and b!788389 (not res!534104)) b!788390))

(assert (= (and b!788390 c!87552) b!788397))

(assert (= (and b!788390 (not c!87552)) b!788401))

(assert (= (and b!788390 res!534099) b!788400))

(assert (= (and b!788400 res!534110) b!788382))

(declare-fun m!729737 () Bool)

(assert (=> b!788396 m!729737))

(assert (=> b!788396 m!729737))

(declare-fun m!729739 () Bool)

(assert (=> b!788396 m!729739))

(declare-fun m!729741 () Bool)

(assert (=> b!788395 m!729741))

(declare-fun m!729743 () Bool)

(assert (=> b!788386 m!729743))

(declare-fun m!729745 () Bool)

(assert (=> b!788389 m!729745))

(declare-fun m!729747 () Bool)

(assert (=> b!788389 m!729747))

(assert (=> b!788381 m!729737))

(assert (=> b!788381 m!729737))

(declare-fun m!729749 () Bool)

(assert (=> b!788381 m!729749))

(declare-fun m!729751 () Bool)

(assert (=> b!788392 m!729751))

(assert (=> b!788383 m!729737))

(assert (=> b!788383 m!729737))

(declare-fun m!729753 () Bool)

(assert (=> b!788383 m!729753))

(assert (=> b!788394 m!729737))

(assert (=> b!788394 m!729737))

(declare-fun m!729755 () Bool)

(assert (=> b!788394 m!729755))

(assert (=> b!788394 m!729755))

(assert (=> b!788394 m!729737))

(declare-fun m!729757 () Bool)

(assert (=> b!788394 m!729757))

(declare-fun m!729759 () Bool)

(assert (=> b!788400 m!729759))

(declare-fun m!729761 () Bool)

(assert (=> b!788400 m!729761))

(assert (=> b!788384 m!729737))

(assert (=> b!788384 m!729737))

(declare-fun m!729763 () Bool)

(assert (=> b!788384 m!729763))

(declare-fun m!729765 () Bool)

(assert (=> b!788385 m!729765))

(declare-fun m!729767 () Bool)

(assert (=> start!67802 m!729767))

(declare-fun m!729769 () Bool)

(assert (=> start!67802 m!729769))

(declare-fun m!729771 () Bool)

(assert (=> b!788399 m!729771))

(assert (=> b!788388 m!729737))

(assert (=> b!788388 m!729737))

(assert (=> b!788388 m!729763))

(assert (=> b!788398 m!729737))

(assert (=> b!788398 m!729737))

(declare-fun m!729773 () Bool)

(assert (=> b!788398 m!729773))

(declare-fun m!729775 () Bool)

(assert (=> b!788398 m!729775))

(declare-fun m!729777 () Bool)

(assert (=> b!788398 m!729777))

(declare-fun m!729779 () Bool)

(assert (=> b!788402 m!729779))

(assert (=> b!788402 m!729745))

(declare-fun m!729781 () Bool)

(assert (=> b!788402 m!729781))

(declare-fun m!729783 () Bool)

(assert (=> b!788402 m!729783))

(declare-fun m!729785 () Bool)

(assert (=> b!788402 m!729785))

(assert (=> b!788402 m!729781))

(declare-fun m!729787 () Bool)

(assert (=> b!788387 m!729787))

(declare-fun m!729789 () Bool)

(assert (=> b!788390 m!729789))

(check-sat (not b!788402) (not b!788381) (not b!788386) (not b!788400) (not b!788395) (not start!67802) (not b!788384) (not b!788394) (not b!788387) (not b!788383) (not b!788399) (not b!788385) (not b!788388) (not b!788398) (not b!788396))
(check-sat)
(get-model)

(declare-fun bm!35277 () Bool)

(declare-fun call!35280 () Bool)

(assert (=> bm!35277 (= call!35280 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun d!102829 () Bool)

(declare-fun res!534173 () Bool)

(declare-fun e!438243 () Bool)

(assert (=> d!102829 (=> res!534173 e!438243)))

(assert (=> d!102829 (= res!534173 (bvsge #b00000000000000000000000000000000 (size!20930 a!3186)))))

(assert (=> d!102829 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!438243)))

(declare-fun b!788481 () Bool)

(declare-fun e!438244 () Bool)

(declare-fun e!438245 () Bool)

(assert (=> b!788481 (= e!438244 e!438245)))

(declare-fun lt!351796 () (_ BitVec 64))

(assert (=> b!788481 (= lt!351796 (select (arr!20509 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!351797 () Unit!27324)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42842 (_ BitVec 64) (_ BitVec 32)) Unit!27324)

(assert (=> b!788481 (= lt!351797 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!351796 #b00000000000000000000000000000000))))

(assert (=> b!788481 (arrayContainsKey!0 a!3186 lt!351796 #b00000000000000000000000000000000)))

(declare-fun lt!351795 () Unit!27324)

(assert (=> b!788481 (= lt!351795 lt!351797)))

(declare-fun res!534172 () Bool)

(assert (=> b!788481 (= res!534172 (= (seekEntryOrOpen!0 (select (arr!20509 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!8109 #b00000000000000000000000000000000)))))

(assert (=> b!788481 (=> (not res!534172) (not e!438245))))

(declare-fun b!788482 () Bool)

(assert (=> b!788482 (= e!438243 e!438244)))

(declare-fun c!87562 () Bool)

(assert (=> b!788482 (= c!87562 (validKeyInArray!0 (select (arr!20509 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!788483 () Bool)

(assert (=> b!788483 (= e!438245 call!35280)))

(declare-fun b!788484 () Bool)

(assert (=> b!788484 (= e!438244 call!35280)))

(assert (= (and d!102829 (not res!534173)) b!788482))

(assert (= (and b!788482 c!87562) b!788481))

(assert (= (and b!788482 (not c!87562)) b!788484))

(assert (= (and b!788481 res!534172) b!788483))

(assert (= (or b!788483 b!788484) bm!35277))

(declare-fun m!729845 () Bool)

(assert (=> bm!35277 m!729845))

(declare-fun m!729847 () Bool)

(assert (=> b!788481 m!729847))

(declare-fun m!729849 () Bool)

(assert (=> b!788481 m!729849))

(declare-fun m!729851 () Bool)

(assert (=> b!788481 m!729851))

(assert (=> b!788481 m!729847))

(declare-fun m!729853 () Bool)

(assert (=> b!788481 m!729853))

(assert (=> b!788482 m!729847))

(assert (=> b!788482 m!729847))

(declare-fun m!729855 () Bool)

(assert (=> b!788482 m!729855))

(assert (=> b!788386 d!102829))

(declare-fun d!102831 () Bool)

(assert (=> d!102831 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!788387 d!102831))

(declare-fun b!788497 () Bool)

(declare-fun c!87570 () Bool)

(declare-fun lt!351804 () (_ BitVec 64))

(assert (=> b!788497 (= c!87570 (= lt!351804 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!438254 () SeekEntryResult!8109)

(declare-fun e!438253 () SeekEntryResult!8109)

(assert (=> b!788497 (= e!438254 e!438253)))

(declare-fun d!102833 () Bool)

(declare-fun lt!351806 () SeekEntryResult!8109)

(assert (=> d!102833 (and (or ((_ is Undefined!8109) lt!351806) (not ((_ is Found!8109) lt!351806)) (and (bvsge (index!34805 lt!351806) #b00000000000000000000000000000000) (bvslt (index!34805 lt!351806) (size!20930 a!3186)))) (or ((_ is Undefined!8109) lt!351806) ((_ is Found!8109) lt!351806) (not ((_ is MissingZero!8109) lt!351806)) (and (bvsge (index!34804 lt!351806) #b00000000000000000000000000000000) (bvslt (index!34804 lt!351806) (size!20930 a!3186)))) (or ((_ is Undefined!8109) lt!351806) ((_ is Found!8109) lt!351806) ((_ is MissingZero!8109) lt!351806) (not ((_ is MissingVacant!8109) lt!351806)) (and (bvsge (index!34807 lt!351806) #b00000000000000000000000000000000) (bvslt (index!34807 lt!351806) (size!20930 a!3186)))) (or ((_ is Undefined!8109) lt!351806) (ite ((_ is Found!8109) lt!351806) (= (select (arr!20509 a!3186) (index!34805 lt!351806)) (select (arr!20509 a!3186) j!159)) (ite ((_ is MissingZero!8109) lt!351806) (= (select (arr!20509 a!3186) (index!34804 lt!351806)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8109) lt!351806) (= (select (arr!20509 a!3186) (index!34807 lt!351806)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!438252 () SeekEntryResult!8109)

(assert (=> d!102833 (= lt!351806 e!438252)))

(declare-fun c!87571 () Bool)

(declare-fun lt!351805 () SeekEntryResult!8109)

(assert (=> d!102833 (= c!87571 (and ((_ is Intermediate!8109) lt!351805) (undefined!8921 lt!351805)))))

(assert (=> d!102833 (= lt!351805 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20509 a!3186) j!159) mask!3328) (select (arr!20509 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!102833 (validMask!0 mask!3328)))

(assert (=> d!102833 (= (seekEntryOrOpen!0 (select (arr!20509 a!3186) j!159) a!3186 mask!3328) lt!351806)))

(declare-fun b!788498 () Bool)

(assert (=> b!788498 (= e!438253 (seekKeyOrZeroReturnVacant!0 (x!65737 lt!351805) (index!34806 lt!351805) (index!34806 lt!351805) (select (arr!20509 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!788499 () Bool)

(assert (=> b!788499 (= e!438253 (MissingZero!8109 (index!34806 lt!351805)))))

(declare-fun b!788500 () Bool)

(assert (=> b!788500 (= e!438252 Undefined!8109)))

(declare-fun b!788501 () Bool)

(assert (=> b!788501 (= e!438254 (Found!8109 (index!34806 lt!351805)))))

(declare-fun b!788502 () Bool)

(assert (=> b!788502 (= e!438252 e!438254)))

(assert (=> b!788502 (= lt!351804 (select (arr!20509 a!3186) (index!34806 lt!351805)))))

(declare-fun c!87569 () Bool)

(assert (=> b!788502 (= c!87569 (= lt!351804 (select (arr!20509 a!3186) j!159)))))

(assert (= (and d!102833 c!87571) b!788500))

(assert (= (and d!102833 (not c!87571)) b!788502))

(assert (= (and b!788502 c!87569) b!788501))

(assert (= (and b!788502 (not c!87569)) b!788497))

(assert (= (and b!788497 c!87570) b!788499))

(assert (= (and b!788497 (not c!87570)) b!788498))

(declare-fun m!729857 () Bool)

(assert (=> d!102833 m!729857))

(declare-fun m!729859 () Bool)

(assert (=> d!102833 m!729859))

(assert (=> d!102833 m!729767))

(assert (=> d!102833 m!729755))

(assert (=> d!102833 m!729737))

(assert (=> d!102833 m!729757))

(declare-fun m!729861 () Bool)

(assert (=> d!102833 m!729861))

(assert (=> d!102833 m!729737))

(assert (=> d!102833 m!729755))

(assert (=> b!788498 m!729737))

(declare-fun m!729863 () Bool)

(assert (=> b!788498 m!729863))

(declare-fun m!729865 () Bool)

(assert (=> b!788502 m!729865))

(assert (=> b!788398 d!102833))

(declare-fun bm!35278 () Bool)

(declare-fun call!35281 () Bool)

(assert (=> bm!35278 (= call!35281 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun d!102835 () Bool)

(declare-fun res!534175 () Bool)

(declare-fun e!438255 () Bool)

(assert (=> d!102835 (=> res!534175 e!438255)))

(assert (=> d!102835 (= res!534175 (bvsge j!159 (size!20930 a!3186)))))

(assert (=> d!102835 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!438255)))

(declare-fun b!788503 () Bool)

(declare-fun e!438256 () Bool)

(declare-fun e!438257 () Bool)

(assert (=> b!788503 (= e!438256 e!438257)))

(declare-fun lt!351808 () (_ BitVec 64))

(assert (=> b!788503 (= lt!351808 (select (arr!20509 a!3186) j!159))))

(declare-fun lt!351809 () Unit!27324)

(assert (=> b!788503 (= lt!351809 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!351808 j!159))))

(assert (=> b!788503 (arrayContainsKey!0 a!3186 lt!351808 #b00000000000000000000000000000000)))

(declare-fun lt!351807 () Unit!27324)

(assert (=> b!788503 (= lt!351807 lt!351809)))

(declare-fun res!534174 () Bool)

(assert (=> b!788503 (= res!534174 (= (seekEntryOrOpen!0 (select (arr!20509 a!3186) j!159) a!3186 mask!3328) (Found!8109 j!159)))))

(assert (=> b!788503 (=> (not res!534174) (not e!438257))))

(declare-fun b!788504 () Bool)

(assert (=> b!788504 (= e!438255 e!438256)))

(declare-fun c!87572 () Bool)

(assert (=> b!788504 (= c!87572 (validKeyInArray!0 (select (arr!20509 a!3186) j!159)))))

(declare-fun b!788505 () Bool)

(assert (=> b!788505 (= e!438257 call!35281)))

(declare-fun b!788506 () Bool)

(assert (=> b!788506 (= e!438256 call!35281)))

(assert (= (and d!102835 (not res!534175)) b!788504))

(assert (= (and b!788504 c!87572) b!788503))

(assert (= (and b!788504 (not c!87572)) b!788506))

(assert (= (and b!788503 res!534174) b!788505))

(assert (= (or b!788505 b!788506) bm!35278))

(declare-fun m!729867 () Bool)

(assert (=> bm!35278 m!729867))

(assert (=> b!788503 m!729737))

(declare-fun m!729869 () Bool)

(assert (=> b!788503 m!729869))

(declare-fun m!729871 () Bool)

(assert (=> b!788503 m!729871))

(assert (=> b!788503 m!729737))

(assert (=> b!788503 m!729773))

(assert (=> b!788504 m!729737))

(assert (=> b!788504 m!729737))

(assert (=> b!788504 m!729753))

(assert (=> b!788398 d!102835))

(declare-fun d!102837 () Bool)

(assert (=> d!102837 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!351812 () Unit!27324)

(declare-fun choose!38 (array!42842 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27324)

(assert (=> d!102837 (= lt!351812 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!102837 (validMask!0 mask!3328)))

(assert (=> d!102837 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!351812)))

(declare-fun bs!21835 () Bool)

(assert (= bs!21835 d!102837))

(assert (=> bs!21835 m!729775))

(declare-fun m!729873 () Bool)

(assert (=> bs!21835 m!729873))

(assert (=> bs!21835 m!729767))

(assert (=> b!788398 d!102837))

(declare-fun b!788519 () Bool)

(declare-fun e!438264 () SeekEntryResult!8109)

(assert (=> b!788519 (= e!438264 (MissingVacant!8109 resIntermediateIndex!5))))

(declare-fun b!788520 () Bool)

(declare-fun e!438265 () SeekEntryResult!8109)

(assert (=> b!788520 (= e!438265 (Found!8109 index!1321))))

(declare-fun b!788521 () Bool)

(declare-fun e!438266 () SeekEntryResult!8109)

(assert (=> b!788521 (= e!438266 e!438265)))

(declare-fun c!87581 () Bool)

(declare-fun lt!351818 () (_ BitVec 64))

(assert (=> b!788521 (= c!87581 (= lt!351818 (select (arr!20509 a!3186) j!159)))))

(declare-fun d!102839 () Bool)

(declare-fun lt!351817 () SeekEntryResult!8109)

(assert (=> d!102839 (and (or ((_ is Undefined!8109) lt!351817) (not ((_ is Found!8109) lt!351817)) (and (bvsge (index!34805 lt!351817) #b00000000000000000000000000000000) (bvslt (index!34805 lt!351817) (size!20930 a!3186)))) (or ((_ is Undefined!8109) lt!351817) ((_ is Found!8109) lt!351817) (not ((_ is MissingVacant!8109) lt!351817)) (not (= (index!34807 lt!351817) resIntermediateIndex!5)) (and (bvsge (index!34807 lt!351817) #b00000000000000000000000000000000) (bvslt (index!34807 lt!351817) (size!20930 a!3186)))) (or ((_ is Undefined!8109) lt!351817) (ite ((_ is Found!8109) lt!351817) (= (select (arr!20509 a!3186) (index!34805 lt!351817)) (select (arr!20509 a!3186) j!159)) (and ((_ is MissingVacant!8109) lt!351817) (= (index!34807 lt!351817) resIntermediateIndex!5) (= (select (arr!20509 a!3186) (index!34807 lt!351817)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102839 (= lt!351817 e!438266)))

(declare-fun c!87580 () Bool)

(assert (=> d!102839 (= c!87580 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102839 (= lt!351818 (select (arr!20509 a!3186) index!1321))))

(assert (=> d!102839 (validMask!0 mask!3328)))

(assert (=> d!102839 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20509 a!3186) j!159) a!3186 mask!3328) lt!351817)))

(declare-fun b!788522 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!788522 (= e!438264 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20509 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!788523 () Bool)

(assert (=> b!788523 (= e!438266 Undefined!8109)))

(declare-fun b!788524 () Bool)

(declare-fun c!87579 () Bool)

(assert (=> b!788524 (= c!87579 (= lt!351818 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!788524 (= e!438265 e!438264)))

(assert (= (and d!102839 c!87580) b!788523))

(assert (= (and d!102839 (not c!87580)) b!788521))

(assert (= (and b!788521 c!87581) b!788520))

(assert (= (and b!788521 (not c!87581)) b!788524))

(assert (= (and b!788524 c!87579) b!788519))

(assert (= (and b!788524 (not c!87579)) b!788522))

(declare-fun m!729875 () Bool)

(assert (=> d!102839 m!729875))

(declare-fun m!729877 () Bool)

(assert (=> d!102839 m!729877))

(assert (=> d!102839 m!729789))

(assert (=> d!102839 m!729767))

(declare-fun m!729879 () Bool)

(assert (=> b!788522 m!729879))

(assert (=> b!788522 m!729879))

(assert (=> b!788522 m!729737))

(declare-fun m!729881 () Bool)

(assert (=> b!788522 m!729881))

(assert (=> b!788388 d!102839))

(declare-fun bm!35281 () Bool)

(declare-fun call!35284 () Bool)

(declare-fun c!87584 () Bool)

(assert (=> bm!35281 (= call!35284 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!87584 (Cons!14507 (select (arr!20509 a!3186) #b00000000000000000000000000000000) Nil!14508) Nil!14508)))))

(declare-fun b!788535 () Bool)

(declare-fun e!438276 () Bool)

(declare-fun e!438275 () Bool)

(assert (=> b!788535 (= e!438276 e!438275)))

(assert (=> b!788535 (= c!87584 (validKeyInArray!0 (select (arr!20509 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!788536 () Bool)

(declare-fun e!438277 () Bool)

(declare-fun contains!4110 (List!14511 (_ BitVec 64)) Bool)

(assert (=> b!788536 (= e!438277 (contains!4110 Nil!14508 (select (arr!20509 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!788537 () Bool)

(assert (=> b!788537 (= e!438275 call!35284)))

(declare-fun d!102843 () Bool)

(declare-fun res!534182 () Bool)

(declare-fun e!438278 () Bool)

(assert (=> d!102843 (=> res!534182 e!438278)))

(assert (=> d!102843 (= res!534182 (bvsge #b00000000000000000000000000000000 (size!20930 a!3186)))))

(assert (=> d!102843 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14508) e!438278)))

(declare-fun b!788538 () Bool)

(assert (=> b!788538 (= e!438275 call!35284)))

(declare-fun b!788539 () Bool)

(assert (=> b!788539 (= e!438278 e!438276)))

(declare-fun res!534183 () Bool)

(assert (=> b!788539 (=> (not res!534183) (not e!438276))))

(assert (=> b!788539 (= res!534183 (not e!438277))))

(declare-fun res!534184 () Bool)

(assert (=> b!788539 (=> (not res!534184) (not e!438277))))

(assert (=> b!788539 (= res!534184 (validKeyInArray!0 (select (arr!20509 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!102843 (not res!534182)) b!788539))

(assert (= (and b!788539 res!534184) b!788536))

(assert (= (and b!788539 res!534183) b!788535))

(assert (= (and b!788535 c!87584) b!788538))

(assert (= (and b!788535 (not c!87584)) b!788537))

(assert (= (or b!788538 b!788537) bm!35281))

(assert (=> bm!35281 m!729847))

(declare-fun m!729883 () Bool)

(assert (=> bm!35281 m!729883))

(assert (=> b!788535 m!729847))

(assert (=> b!788535 m!729847))

(assert (=> b!788535 m!729855))

(assert (=> b!788536 m!729847))

(assert (=> b!788536 m!729847))

(declare-fun m!729885 () Bool)

(assert (=> b!788536 m!729885))

(assert (=> b!788539 m!729847))

(assert (=> b!788539 m!729847))

(assert (=> b!788539 m!729855))

(assert (=> b!788399 d!102843))

(declare-fun b!788609 () Bool)

(declare-fun e!438319 () SeekEntryResult!8109)

(assert (=> b!788609 (= e!438319 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20509 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20509 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!102847 () Bool)

(declare-fun e!438323 () Bool)

(assert (=> d!102847 e!438323))

(declare-fun c!87611 () Bool)

(declare-fun lt!351838 () SeekEntryResult!8109)

(assert (=> d!102847 (= c!87611 (and ((_ is Intermediate!8109) lt!351838) (undefined!8921 lt!351838)))))

(declare-fun e!438321 () SeekEntryResult!8109)

(assert (=> d!102847 (= lt!351838 e!438321)))

(declare-fun c!87609 () Bool)

(assert (=> d!102847 (= c!87609 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!351839 () (_ BitVec 64))

(assert (=> d!102847 (= lt!351839 (select (arr!20509 a!3186) (toIndex!0 (select (arr!20509 a!3186) j!159) mask!3328)))))

(assert (=> d!102847 (validMask!0 mask!3328)))

(assert (=> d!102847 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20509 a!3186) j!159) mask!3328) (select (arr!20509 a!3186) j!159) a!3186 mask!3328) lt!351838)))

(declare-fun b!788610 () Bool)

(assert (=> b!788610 (= e!438319 (Intermediate!8109 false (toIndex!0 (select (arr!20509 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!788611 () Bool)

(assert (=> b!788611 (and (bvsge (index!34806 lt!351838) #b00000000000000000000000000000000) (bvslt (index!34806 lt!351838) (size!20930 a!3186)))))

(declare-fun res!534206 () Bool)

(assert (=> b!788611 (= res!534206 (= (select (arr!20509 a!3186) (index!34806 lt!351838)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!438322 () Bool)

(assert (=> b!788611 (=> res!534206 e!438322)))

(declare-fun b!788612 () Bool)

(assert (=> b!788612 (= e!438321 e!438319)))

(declare-fun c!87610 () Bool)

(assert (=> b!788612 (= c!87610 (or (= lt!351839 (select (arr!20509 a!3186) j!159)) (= (bvadd lt!351839 lt!351839) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!788613 () Bool)

(assert (=> b!788613 (= e!438321 (Intermediate!8109 true (toIndex!0 (select (arr!20509 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!788614 () Bool)

(declare-fun e!438320 () Bool)

(assert (=> b!788614 (= e!438323 e!438320)))

(declare-fun res!534207 () Bool)

(assert (=> b!788614 (= res!534207 (and ((_ is Intermediate!8109) lt!351838) (not (undefined!8921 lt!351838)) (bvslt (x!65737 lt!351838) #b01111111111111111111111111111110) (bvsge (x!65737 lt!351838) #b00000000000000000000000000000000) (bvsge (x!65737 lt!351838) #b00000000000000000000000000000000)))))

(assert (=> b!788614 (=> (not res!534207) (not e!438320))))

(declare-fun b!788615 () Bool)

(assert (=> b!788615 (and (bvsge (index!34806 lt!351838) #b00000000000000000000000000000000) (bvslt (index!34806 lt!351838) (size!20930 a!3186)))))

(declare-fun res!534208 () Bool)

(assert (=> b!788615 (= res!534208 (= (select (arr!20509 a!3186) (index!34806 lt!351838)) (select (arr!20509 a!3186) j!159)))))

(assert (=> b!788615 (=> res!534208 e!438322)))

(assert (=> b!788615 (= e!438320 e!438322)))

(declare-fun b!788616 () Bool)

(assert (=> b!788616 (= e!438323 (bvsge (x!65737 lt!351838) #b01111111111111111111111111111110))))

(declare-fun b!788617 () Bool)

(assert (=> b!788617 (and (bvsge (index!34806 lt!351838) #b00000000000000000000000000000000) (bvslt (index!34806 lt!351838) (size!20930 a!3186)))))

(assert (=> b!788617 (= e!438322 (= (select (arr!20509 a!3186) (index!34806 lt!351838)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!102847 c!87609) b!788613))

(assert (= (and d!102847 (not c!87609)) b!788612))

(assert (= (and b!788612 c!87610) b!788610))

(assert (= (and b!788612 (not c!87610)) b!788609))

(assert (= (and d!102847 c!87611) b!788616))

(assert (= (and d!102847 (not c!87611)) b!788614))

(assert (= (and b!788614 res!534207) b!788615))

(assert (= (and b!788615 (not res!534208)) b!788611))

(assert (= (and b!788611 (not res!534206)) b!788617))

(declare-fun m!729913 () Bool)

(assert (=> b!788615 m!729913))

(assert (=> b!788609 m!729755))

(declare-fun m!729915 () Bool)

(assert (=> b!788609 m!729915))

(assert (=> b!788609 m!729915))

(assert (=> b!788609 m!729737))

(declare-fun m!729917 () Bool)

(assert (=> b!788609 m!729917))

(assert (=> b!788611 m!729913))

(assert (=> b!788617 m!729913))

(assert (=> d!102847 m!729755))

(declare-fun m!729919 () Bool)

(assert (=> d!102847 m!729919))

(assert (=> d!102847 m!729767))

(assert (=> b!788394 d!102847))

(declare-fun d!102857 () Bool)

(declare-fun lt!351853 () (_ BitVec 32))

(declare-fun lt!351852 () (_ BitVec 32))

(assert (=> d!102857 (= lt!351853 (bvmul (bvxor lt!351852 (bvlshr lt!351852 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102857 (= lt!351852 ((_ extract 31 0) (bvand (bvxor (select (arr!20509 a!3186) j!159) (bvlshr (select (arr!20509 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102857 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!534210 (let ((h!15633 ((_ extract 31 0) (bvand (bvxor (select (arr!20509 a!3186) j!159) (bvlshr (select (arr!20509 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65743 (bvmul (bvxor h!15633 (bvlshr h!15633 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65743 (bvlshr x!65743 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!534210 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!534210 #b00000000000000000000000000000000))))))

(assert (=> d!102857 (= (toIndex!0 (select (arr!20509 a!3186) j!159) mask!3328) (bvand (bvxor lt!351853 (bvlshr lt!351853 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!788394 d!102857))

(assert (=> b!788384 d!102839))

(declare-fun b!788627 () Bool)

(declare-fun c!87616 () Bool)

(declare-fun lt!351854 () (_ BitVec 64))

(assert (=> b!788627 (= c!87616 (= lt!351854 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!438331 () SeekEntryResult!8109)

(declare-fun e!438330 () SeekEntryResult!8109)

(assert (=> b!788627 (= e!438331 e!438330)))

(declare-fun d!102861 () Bool)

(declare-fun lt!351856 () SeekEntryResult!8109)

(assert (=> d!102861 (and (or ((_ is Undefined!8109) lt!351856) (not ((_ is Found!8109) lt!351856)) (and (bvsge (index!34805 lt!351856) #b00000000000000000000000000000000) (bvslt (index!34805 lt!351856) (size!20930 a!3186)))) (or ((_ is Undefined!8109) lt!351856) ((_ is Found!8109) lt!351856) (not ((_ is MissingZero!8109) lt!351856)) (and (bvsge (index!34804 lt!351856) #b00000000000000000000000000000000) (bvslt (index!34804 lt!351856) (size!20930 a!3186)))) (or ((_ is Undefined!8109) lt!351856) ((_ is Found!8109) lt!351856) ((_ is MissingZero!8109) lt!351856) (not ((_ is MissingVacant!8109) lt!351856)) (and (bvsge (index!34807 lt!351856) #b00000000000000000000000000000000) (bvslt (index!34807 lt!351856) (size!20930 a!3186)))) (or ((_ is Undefined!8109) lt!351856) (ite ((_ is Found!8109) lt!351856) (= (select (arr!20509 a!3186) (index!34805 lt!351856)) k0!2102) (ite ((_ is MissingZero!8109) lt!351856) (= (select (arr!20509 a!3186) (index!34804 lt!351856)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8109) lt!351856) (= (select (arr!20509 a!3186) (index!34807 lt!351856)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!438329 () SeekEntryResult!8109)

(assert (=> d!102861 (= lt!351856 e!438329)))

(declare-fun c!87617 () Bool)

(declare-fun lt!351855 () SeekEntryResult!8109)

(assert (=> d!102861 (= c!87617 (and ((_ is Intermediate!8109) lt!351855) (undefined!8921 lt!351855)))))

(assert (=> d!102861 (= lt!351855 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!102861 (validMask!0 mask!3328)))

(assert (=> d!102861 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!351856)))

(declare-fun b!788628 () Bool)

(assert (=> b!788628 (= e!438330 (seekKeyOrZeroReturnVacant!0 (x!65737 lt!351855) (index!34806 lt!351855) (index!34806 lt!351855) k0!2102 a!3186 mask!3328))))

(declare-fun b!788629 () Bool)

(assert (=> b!788629 (= e!438330 (MissingZero!8109 (index!34806 lt!351855)))))

(declare-fun b!788630 () Bool)

(assert (=> b!788630 (= e!438329 Undefined!8109)))

(declare-fun b!788631 () Bool)

(assert (=> b!788631 (= e!438331 (Found!8109 (index!34806 lt!351855)))))

(declare-fun b!788632 () Bool)

(assert (=> b!788632 (= e!438329 e!438331)))

(assert (=> b!788632 (= lt!351854 (select (arr!20509 a!3186) (index!34806 lt!351855)))))

(declare-fun c!87615 () Bool)

(assert (=> b!788632 (= c!87615 (= lt!351854 k0!2102))))

(assert (= (and d!102861 c!87617) b!788630))

(assert (= (and d!102861 (not c!87617)) b!788632))

(assert (= (and b!788632 c!87615) b!788631))

(assert (= (and b!788632 (not c!87615)) b!788627))

(assert (= (and b!788627 c!87616) b!788629))

(assert (= (and b!788627 (not c!87616)) b!788628))

(declare-fun m!729929 () Bool)

(assert (=> d!102861 m!729929))

(declare-fun m!729931 () Bool)

(assert (=> d!102861 m!729931))

(assert (=> d!102861 m!729767))

(declare-fun m!729933 () Bool)

(assert (=> d!102861 m!729933))

(declare-fun m!729935 () Bool)

(assert (=> d!102861 m!729935))

(declare-fun m!729937 () Bool)

(assert (=> d!102861 m!729937))

(assert (=> d!102861 m!729933))

(declare-fun m!729939 () Bool)

(assert (=> b!788628 m!729939))

(declare-fun m!729941 () Bool)

(assert (=> b!788632 m!729941))

(assert (=> b!788395 d!102861))

(declare-fun d!102865 () Bool)

(declare-fun res!534221 () Bool)

(declare-fun e!438347 () Bool)

(assert (=> d!102865 (=> res!534221 e!438347)))

(assert (=> d!102865 (= res!534221 (= (select (arr!20509 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!102865 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!438347)))

(declare-fun b!788658 () Bool)

(declare-fun e!438348 () Bool)

(assert (=> b!788658 (= e!438347 e!438348)))

(declare-fun res!534222 () Bool)

(assert (=> b!788658 (=> (not res!534222) (not e!438348))))

(assert (=> b!788658 (= res!534222 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20930 a!3186)))))

(declare-fun b!788659 () Bool)

(assert (=> b!788659 (= e!438348 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!102865 (not res!534221)) b!788658))

(assert (= (and b!788658 res!534222) b!788659))

(assert (=> d!102865 m!729847))

(declare-fun m!729951 () Bool)

(assert (=> b!788659 m!729951))

(assert (=> b!788385 d!102865))

(declare-fun b!788660 () Bool)

(declare-fun e!438349 () SeekEntryResult!8109)

(assert (=> b!788660 (= e!438349 (MissingVacant!8109 resIntermediateIndex!5))))

(declare-fun b!788661 () Bool)

(declare-fun e!438350 () SeekEntryResult!8109)

(assert (=> b!788661 (= e!438350 (Found!8109 resIntermediateIndex!5))))

(declare-fun b!788662 () Bool)

(declare-fun e!438351 () SeekEntryResult!8109)

(assert (=> b!788662 (= e!438351 e!438350)))

(declare-fun lt!351866 () (_ BitVec 64))

(declare-fun c!87629 () Bool)

(assert (=> b!788662 (= c!87629 (= lt!351866 (select (arr!20509 a!3186) j!159)))))

(declare-fun lt!351865 () SeekEntryResult!8109)

(declare-fun d!102871 () Bool)

(assert (=> d!102871 (and (or ((_ is Undefined!8109) lt!351865) (not ((_ is Found!8109) lt!351865)) (and (bvsge (index!34805 lt!351865) #b00000000000000000000000000000000) (bvslt (index!34805 lt!351865) (size!20930 a!3186)))) (or ((_ is Undefined!8109) lt!351865) ((_ is Found!8109) lt!351865) (not ((_ is MissingVacant!8109) lt!351865)) (not (= (index!34807 lt!351865) resIntermediateIndex!5)) (and (bvsge (index!34807 lt!351865) #b00000000000000000000000000000000) (bvslt (index!34807 lt!351865) (size!20930 a!3186)))) (or ((_ is Undefined!8109) lt!351865) (ite ((_ is Found!8109) lt!351865) (= (select (arr!20509 a!3186) (index!34805 lt!351865)) (select (arr!20509 a!3186) j!159)) (and ((_ is MissingVacant!8109) lt!351865) (= (index!34807 lt!351865) resIntermediateIndex!5) (= (select (arr!20509 a!3186) (index!34807 lt!351865)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102871 (= lt!351865 e!438351)))

(declare-fun c!87628 () Bool)

(assert (=> d!102871 (= c!87628 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!102871 (= lt!351866 (select (arr!20509 a!3186) resIntermediateIndex!5))))

(assert (=> d!102871 (validMask!0 mask!3328)))

(assert (=> d!102871 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20509 a!3186) j!159) a!3186 mask!3328) lt!351865)))

(declare-fun b!788663 () Bool)

(assert (=> b!788663 (= e!438349 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20509 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!788664 () Bool)

(assert (=> b!788664 (= e!438351 Undefined!8109)))

(declare-fun b!788665 () Bool)

(declare-fun c!87627 () Bool)

(assert (=> b!788665 (= c!87627 (= lt!351866 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!788665 (= e!438350 e!438349)))

(assert (= (and d!102871 c!87628) b!788664))

(assert (= (and d!102871 (not c!87628)) b!788662))

(assert (= (and b!788662 c!87629) b!788661))

(assert (= (and b!788662 (not c!87629)) b!788665))

(assert (= (and b!788665 c!87627) b!788660))

(assert (= (and b!788665 (not c!87627)) b!788663))

(declare-fun m!729953 () Bool)

(assert (=> d!102871 m!729953))

(declare-fun m!729955 () Bool)

(assert (=> d!102871 m!729955))

(assert (=> d!102871 m!729751))

(assert (=> d!102871 m!729767))

(declare-fun m!729957 () Bool)

(assert (=> b!788663 m!729957))

(assert (=> b!788663 m!729957))

(assert (=> b!788663 m!729737))

(declare-fun m!729959 () Bool)

(assert (=> b!788663 m!729959))

(assert (=> b!788396 d!102871))

(declare-fun b!788670 () Bool)

(declare-fun e!438352 () SeekEntryResult!8109)

(assert (=> b!788670 (= e!438352 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!351743 lt!351748 mask!3328))))

(declare-fun d!102873 () Bool)

(declare-fun e!438359 () Bool)

(assert (=> d!102873 e!438359))

(declare-fun c!87635 () Bool)

(declare-fun lt!351867 () SeekEntryResult!8109)

(assert (=> d!102873 (= c!87635 (and ((_ is Intermediate!8109) lt!351867) (undefined!8921 lt!351867)))))

(declare-fun e!438354 () SeekEntryResult!8109)

(assert (=> d!102873 (= lt!351867 e!438354)))

(declare-fun c!87633 () Bool)

(assert (=> d!102873 (= c!87633 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!351869 () (_ BitVec 64))

(assert (=> d!102873 (= lt!351869 (select (arr!20509 lt!351748) index!1321))))

(assert (=> d!102873 (validMask!0 mask!3328)))

(assert (=> d!102873 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351743 lt!351748 mask!3328) lt!351867)))

(declare-fun b!788672 () Bool)

(assert (=> b!788672 (= e!438352 (Intermediate!8109 false index!1321 x!1131))))

(declare-fun b!788674 () Bool)

(assert (=> b!788674 (and (bvsge (index!34806 lt!351867) #b00000000000000000000000000000000) (bvslt (index!34806 lt!351867) (size!20930 lt!351748)))))

(declare-fun res!534223 () Bool)

(assert (=> b!788674 (= res!534223 (= (select (arr!20509 lt!351748) (index!34806 lt!351867)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!438357 () Bool)

(assert (=> b!788674 (=> res!534223 e!438357)))

(declare-fun b!788675 () Bool)

(assert (=> b!788675 (= e!438354 e!438352)))

(declare-fun c!87634 () Bool)

(assert (=> b!788675 (= c!87634 (or (= lt!351869 lt!351743) (= (bvadd lt!351869 lt!351869) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!788676 () Bool)

(assert (=> b!788676 (= e!438354 (Intermediate!8109 true index!1321 x!1131))))

(declare-fun b!788677 () Bool)

(declare-fun e!438353 () Bool)

(assert (=> b!788677 (= e!438359 e!438353)))

(declare-fun res!534224 () Bool)

(assert (=> b!788677 (= res!534224 (and ((_ is Intermediate!8109) lt!351867) (not (undefined!8921 lt!351867)) (bvslt (x!65737 lt!351867) #b01111111111111111111111111111110) (bvsge (x!65737 lt!351867) #b00000000000000000000000000000000) (bvsge (x!65737 lt!351867) x!1131)))))

(assert (=> b!788677 (=> (not res!534224) (not e!438353))))

(declare-fun b!788678 () Bool)

(assert (=> b!788678 (and (bvsge (index!34806 lt!351867) #b00000000000000000000000000000000) (bvslt (index!34806 lt!351867) (size!20930 lt!351748)))))

(declare-fun res!534225 () Bool)

(assert (=> b!788678 (= res!534225 (= (select (arr!20509 lt!351748) (index!34806 lt!351867)) lt!351743))))

(assert (=> b!788678 (=> res!534225 e!438357)))

(assert (=> b!788678 (= e!438353 e!438357)))

(declare-fun b!788679 () Bool)

(assert (=> b!788679 (= e!438359 (bvsge (x!65737 lt!351867) #b01111111111111111111111111111110))))

(declare-fun b!788680 () Bool)

(assert (=> b!788680 (and (bvsge (index!34806 lt!351867) #b00000000000000000000000000000000) (bvslt (index!34806 lt!351867) (size!20930 lt!351748)))))

(assert (=> b!788680 (= e!438357 (= (select (arr!20509 lt!351748) (index!34806 lt!351867)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!102873 c!87633) b!788676))

(assert (= (and d!102873 (not c!87633)) b!788675))

(assert (= (and b!788675 c!87634) b!788672))

(assert (= (and b!788675 (not c!87634)) b!788670))

(assert (= (and d!102873 c!87635) b!788679))

(assert (= (and d!102873 (not c!87635)) b!788677))

(assert (= (and b!788677 res!534224) b!788678))

(assert (= (and b!788678 (not res!534225)) b!788674))

(assert (= (and b!788674 (not res!534223)) b!788680))

(declare-fun m!729965 () Bool)

(assert (=> b!788678 m!729965))

(assert (=> b!788670 m!729879))

(assert (=> b!788670 m!729879))

(declare-fun m!729971 () Bool)

(assert (=> b!788670 m!729971))

(assert (=> b!788674 m!729965))

(assert (=> b!788680 m!729965))

(declare-fun m!729973 () Bool)

(assert (=> d!102873 m!729973))

(assert (=> d!102873 m!729767))

(assert (=> b!788402 d!102873))

(declare-fun b!788697 () Bool)

(declare-fun e!438371 () SeekEntryResult!8109)

(assert (=> b!788697 (= e!438371 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!351743 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!351743 lt!351748 mask!3328))))

(declare-fun d!102877 () Bool)

(declare-fun e!438375 () Bool)

(assert (=> d!102877 e!438375))

(declare-fun c!87643 () Bool)

(declare-fun lt!351873 () SeekEntryResult!8109)

(assert (=> d!102877 (= c!87643 (and ((_ is Intermediate!8109) lt!351873) (undefined!8921 lt!351873)))))

(declare-fun e!438373 () SeekEntryResult!8109)

(assert (=> d!102877 (= lt!351873 e!438373)))

(declare-fun c!87641 () Bool)

(assert (=> d!102877 (= c!87641 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!351874 () (_ BitVec 64))

(assert (=> d!102877 (= lt!351874 (select (arr!20509 lt!351748) (toIndex!0 lt!351743 mask!3328)))))

(assert (=> d!102877 (validMask!0 mask!3328)))

(assert (=> d!102877 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351743 mask!3328) lt!351743 lt!351748 mask!3328) lt!351873)))

(declare-fun b!788698 () Bool)

(assert (=> b!788698 (= e!438371 (Intermediate!8109 false (toIndex!0 lt!351743 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!788699 () Bool)

(assert (=> b!788699 (and (bvsge (index!34806 lt!351873) #b00000000000000000000000000000000) (bvslt (index!34806 lt!351873) (size!20930 lt!351748)))))

(declare-fun res!534232 () Bool)

(assert (=> b!788699 (= res!534232 (= (select (arr!20509 lt!351748) (index!34806 lt!351873)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!438374 () Bool)

(assert (=> b!788699 (=> res!534232 e!438374)))

(declare-fun b!788700 () Bool)

(assert (=> b!788700 (= e!438373 e!438371)))

(declare-fun c!87642 () Bool)

(assert (=> b!788700 (= c!87642 (or (= lt!351874 lt!351743) (= (bvadd lt!351874 lt!351874) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!788701 () Bool)

(assert (=> b!788701 (= e!438373 (Intermediate!8109 true (toIndex!0 lt!351743 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!788702 () Bool)

(declare-fun e!438372 () Bool)

(assert (=> b!788702 (= e!438375 e!438372)))

(declare-fun res!534233 () Bool)

(assert (=> b!788702 (= res!534233 (and ((_ is Intermediate!8109) lt!351873) (not (undefined!8921 lt!351873)) (bvslt (x!65737 lt!351873) #b01111111111111111111111111111110) (bvsge (x!65737 lt!351873) #b00000000000000000000000000000000) (bvsge (x!65737 lt!351873) #b00000000000000000000000000000000)))))

(assert (=> b!788702 (=> (not res!534233) (not e!438372))))

(declare-fun b!788703 () Bool)

(assert (=> b!788703 (and (bvsge (index!34806 lt!351873) #b00000000000000000000000000000000) (bvslt (index!34806 lt!351873) (size!20930 lt!351748)))))

(declare-fun res!534234 () Bool)

(assert (=> b!788703 (= res!534234 (= (select (arr!20509 lt!351748) (index!34806 lt!351873)) lt!351743))))

(assert (=> b!788703 (=> res!534234 e!438374)))

(assert (=> b!788703 (= e!438372 e!438374)))

(declare-fun b!788704 () Bool)

(assert (=> b!788704 (= e!438375 (bvsge (x!65737 lt!351873) #b01111111111111111111111111111110))))

(declare-fun b!788705 () Bool)

(assert (=> b!788705 (and (bvsge (index!34806 lt!351873) #b00000000000000000000000000000000) (bvslt (index!34806 lt!351873) (size!20930 lt!351748)))))

(assert (=> b!788705 (= e!438374 (= (select (arr!20509 lt!351748) (index!34806 lt!351873)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!102877 c!87641) b!788701))

(assert (= (and d!102877 (not c!87641)) b!788700))

(assert (= (and b!788700 c!87642) b!788698))

(assert (= (and b!788700 (not c!87642)) b!788697))

(assert (= (and d!102877 c!87643) b!788704))

(assert (= (and d!102877 (not c!87643)) b!788702))

(assert (= (and b!788702 res!534233) b!788703))

(assert (= (and b!788703 (not res!534234)) b!788699))

(assert (= (and b!788699 (not res!534232)) b!788705))

(declare-fun m!729983 () Bool)

(assert (=> b!788703 m!729983))

(assert (=> b!788697 m!729781))

(declare-fun m!729985 () Bool)

(assert (=> b!788697 m!729985))

(assert (=> b!788697 m!729985))

(declare-fun m!729987 () Bool)

(assert (=> b!788697 m!729987))

(assert (=> b!788699 m!729983))

(assert (=> b!788705 m!729983))

(assert (=> d!102877 m!729781))

(declare-fun m!729989 () Bool)

(assert (=> d!102877 m!729989))

(assert (=> d!102877 m!729767))

(assert (=> b!788402 d!102877))

(declare-fun d!102881 () Bool)

(declare-fun lt!351876 () (_ BitVec 32))

(declare-fun lt!351875 () (_ BitVec 32))

(assert (=> d!102881 (= lt!351876 (bvmul (bvxor lt!351875 (bvlshr lt!351875 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102881 (= lt!351875 ((_ extract 31 0) (bvand (bvxor lt!351743 (bvlshr lt!351743 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102881 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!534210 (let ((h!15633 ((_ extract 31 0) (bvand (bvxor lt!351743 (bvlshr lt!351743 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65743 (bvmul (bvxor h!15633 (bvlshr h!15633 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65743 (bvlshr x!65743 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!534210 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!534210 #b00000000000000000000000000000000))))))

(assert (=> d!102881 (= (toIndex!0 lt!351743 mask!3328) (bvand (bvxor lt!351876 (bvlshr lt!351876 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!788402 d!102881))

(declare-fun b!788706 () Bool)

(declare-fun e!438376 () SeekEntryResult!8109)

(assert (=> b!788706 (= e!438376 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20509 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!102883 () Bool)

(declare-fun e!438380 () Bool)

(assert (=> d!102883 e!438380))

(declare-fun c!87646 () Bool)

(declare-fun lt!351877 () SeekEntryResult!8109)

(assert (=> d!102883 (= c!87646 (and ((_ is Intermediate!8109) lt!351877) (undefined!8921 lt!351877)))))

(declare-fun e!438378 () SeekEntryResult!8109)

(assert (=> d!102883 (= lt!351877 e!438378)))

(declare-fun c!87644 () Bool)

(assert (=> d!102883 (= c!87644 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!351878 () (_ BitVec 64))

(assert (=> d!102883 (= lt!351878 (select (arr!20509 a!3186) index!1321))))

(assert (=> d!102883 (validMask!0 mask!3328)))

(assert (=> d!102883 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20509 a!3186) j!159) a!3186 mask!3328) lt!351877)))

(declare-fun b!788707 () Bool)

(assert (=> b!788707 (= e!438376 (Intermediate!8109 false index!1321 x!1131))))

(declare-fun b!788708 () Bool)

(assert (=> b!788708 (and (bvsge (index!34806 lt!351877) #b00000000000000000000000000000000) (bvslt (index!34806 lt!351877) (size!20930 a!3186)))))

(declare-fun res!534235 () Bool)

(assert (=> b!788708 (= res!534235 (= (select (arr!20509 a!3186) (index!34806 lt!351877)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!438379 () Bool)

(assert (=> b!788708 (=> res!534235 e!438379)))

(declare-fun b!788709 () Bool)

(assert (=> b!788709 (= e!438378 e!438376)))

(declare-fun c!87645 () Bool)

(assert (=> b!788709 (= c!87645 (or (= lt!351878 (select (arr!20509 a!3186) j!159)) (= (bvadd lt!351878 lt!351878) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!788710 () Bool)

(assert (=> b!788710 (= e!438378 (Intermediate!8109 true index!1321 x!1131))))

(declare-fun b!788711 () Bool)

(declare-fun e!438377 () Bool)

(assert (=> b!788711 (= e!438380 e!438377)))

(declare-fun res!534236 () Bool)

(assert (=> b!788711 (= res!534236 (and ((_ is Intermediate!8109) lt!351877) (not (undefined!8921 lt!351877)) (bvslt (x!65737 lt!351877) #b01111111111111111111111111111110) (bvsge (x!65737 lt!351877) #b00000000000000000000000000000000) (bvsge (x!65737 lt!351877) x!1131)))))

(assert (=> b!788711 (=> (not res!534236) (not e!438377))))

(declare-fun b!788712 () Bool)

(assert (=> b!788712 (and (bvsge (index!34806 lt!351877) #b00000000000000000000000000000000) (bvslt (index!34806 lt!351877) (size!20930 a!3186)))))

(declare-fun res!534237 () Bool)

(assert (=> b!788712 (= res!534237 (= (select (arr!20509 a!3186) (index!34806 lt!351877)) (select (arr!20509 a!3186) j!159)))))

(assert (=> b!788712 (=> res!534237 e!438379)))

(assert (=> b!788712 (= e!438377 e!438379)))

(declare-fun b!788713 () Bool)

(assert (=> b!788713 (= e!438380 (bvsge (x!65737 lt!351877) #b01111111111111111111111111111110))))

(declare-fun b!788714 () Bool)

(assert (=> b!788714 (and (bvsge (index!34806 lt!351877) #b00000000000000000000000000000000) (bvslt (index!34806 lt!351877) (size!20930 a!3186)))))

(assert (=> b!788714 (= e!438379 (= (select (arr!20509 a!3186) (index!34806 lt!351877)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!102883 c!87644) b!788710))

(assert (= (and d!102883 (not c!87644)) b!788709))

(assert (= (and b!788709 c!87645) b!788707))

(assert (= (and b!788709 (not c!87645)) b!788706))

(assert (= (and d!102883 c!87646) b!788713))

(assert (= (and d!102883 (not c!87646)) b!788711))

(assert (= (and b!788711 res!534236) b!788712))

(assert (= (and b!788712 (not res!534237)) b!788708))

(assert (= (and b!788708 (not res!534235)) b!788714))

(declare-fun m!729991 () Bool)

(assert (=> b!788712 m!729991))

(assert (=> b!788706 m!729879))

(assert (=> b!788706 m!729879))

(assert (=> b!788706 m!729737))

(declare-fun m!729993 () Bool)

(assert (=> b!788706 m!729993))

(assert (=> b!788708 m!729991))

(assert (=> b!788714 m!729991))

(assert (=> d!102883 m!729789))

(assert (=> d!102883 m!729767))

(assert (=> b!788381 d!102883))

(declare-fun d!102885 () Bool)

(assert (=> d!102885 (= (validKeyInArray!0 (select (arr!20509 a!3186) j!159)) (and (not (= (select (arr!20509 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20509 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!788383 d!102885))

(declare-fun b!788720 () Bool)

(declare-fun c!87649 () Bool)

(declare-fun lt!351879 () (_ BitVec 64))

(assert (=> b!788720 (= c!87649 (= lt!351879 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!438387 () SeekEntryResult!8109)

(declare-fun e!438386 () SeekEntryResult!8109)

(assert (=> b!788720 (= e!438387 e!438386)))

(declare-fun d!102887 () Bool)

(declare-fun lt!351881 () SeekEntryResult!8109)

(assert (=> d!102887 (and (or ((_ is Undefined!8109) lt!351881) (not ((_ is Found!8109) lt!351881)) (and (bvsge (index!34805 lt!351881) #b00000000000000000000000000000000) (bvslt (index!34805 lt!351881) (size!20930 lt!351748)))) (or ((_ is Undefined!8109) lt!351881) ((_ is Found!8109) lt!351881) (not ((_ is MissingZero!8109) lt!351881)) (and (bvsge (index!34804 lt!351881) #b00000000000000000000000000000000) (bvslt (index!34804 lt!351881) (size!20930 lt!351748)))) (or ((_ is Undefined!8109) lt!351881) ((_ is Found!8109) lt!351881) ((_ is MissingZero!8109) lt!351881) (not ((_ is MissingVacant!8109) lt!351881)) (and (bvsge (index!34807 lt!351881) #b00000000000000000000000000000000) (bvslt (index!34807 lt!351881) (size!20930 lt!351748)))) (or ((_ is Undefined!8109) lt!351881) (ite ((_ is Found!8109) lt!351881) (= (select (arr!20509 lt!351748) (index!34805 lt!351881)) lt!351743) (ite ((_ is MissingZero!8109) lt!351881) (= (select (arr!20509 lt!351748) (index!34804 lt!351881)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8109) lt!351881) (= (select (arr!20509 lt!351748) (index!34807 lt!351881)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!438385 () SeekEntryResult!8109)

(assert (=> d!102887 (= lt!351881 e!438385)))

(declare-fun c!87650 () Bool)

(declare-fun lt!351880 () SeekEntryResult!8109)

(assert (=> d!102887 (= c!87650 (and ((_ is Intermediate!8109) lt!351880) (undefined!8921 lt!351880)))))

(assert (=> d!102887 (= lt!351880 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351743 mask!3328) lt!351743 lt!351748 mask!3328))))

(assert (=> d!102887 (validMask!0 mask!3328)))

(assert (=> d!102887 (= (seekEntryOrOpen!0 lt!351743 lt!351748 mask!3328) lt!351881)))

(declare-fun b!788721 () Bool)

(assert (=> b!788721 (= e!438386 (seekKeyOrZeroReturnVacant!0 (x!65737 lt!351880) (index!34806 lt!351880) (index!34806 lt!351880) lt!351743 lt!351748 mask!3328))))

(declare-fun b!788722 () Bool)

(assert (=> b!788722 (= e!438386 (MissingZero!8109 (index!34806 lt!351880)))))

(declare-fun b!788723 () Bool)

(assert (=> b!788723 (= e!438385 Undefined!8109)))

(declare-fun b!788724 () Bool)

(assert (=> b!788724 (= e!438387 (Found!8109 (index!34806 lt!351880)))))

(declare-fun b!788725 () Bool)

(assert (=> b!788725 (= e!438385 e!438387)))

(assert (=> b!788725 (= lt!351879 (select (arr!20509 lt!351748) (index!34806 lt!351880)))))

(declare-fun c!87648 () Bool)

(assert (=> b!788725 (= c!87648 (= lt!351879 lt!351743))))

(assert (= (and d!102887 c!87650) b!788723))

(assert (= (and d!102887 (not c!87650)) b!788725))

(assert (= (and b!788725 c!87648) b!788724))

(assert (= (and b!788725 (not c!87648)) b!788720))

(assert (= (and b!788720 c!87649) b!788722))

(assert (= (and b!788720 (not c!87649)) b!788721))

(declare-fun m!730003 () Bool)

(assert (=> d!102887 m!730003))

(declare-fun m!730005 () Bool)

(assert (=> d!102887 m!730005))

(assert (=> d!102887 m!729767))

(assert (=> d!102887 m!729781))

(assert (=> d!102887 m!729783))

(declare-fun m!730007 () Bool)

(assert (=> d!102887 m!730007))

(assert (=> d!102887 m!729781))

(declare-fun m!730009 () Bool)

(assert (=> b!788721 m!730009))

(declare-fun m!730011 () Bool)

(assert (=> b!788725 m!730011))

(assert (=> b!788400 d!102887))

(declare-fun b!788735 () Bool)

(declare-fun e!438393 () SeekEntryResult!8109)

(assert (=> b!788735 (= e!438393 (MissingVacant!8109 index!1321))))

(declare-fun b!788736 () Bool)

(declare-fun e!438394 () SeekEntryResult!8109)

(assert (=> b!788736 (= e!438394 (Found!8109 index!1321))))

(declare-fun b!788737 () Bool)

(declare-fun e!438395 () SeekEntryResult!8109)

(assert (=> b!788737 (= e!438395 e!438394)))

(declare-fun c!87656 () Bool)

(declare-fun lt!351885 () (_ BitVec 64))

(assert (=> b!788737 (= c!87656 (= lt!351885 lt!351743))))

(declare-fun d!102891 () Bool)

(declare-fun lt!351884 () SeekEntryResult!8109)

(assert (=> d!102891 (and (or ((_ is Undefined!8109) lt!351884) (not ((_ is Found!8109) lt!351884)) (and (bvsge (index!34805 lt!351884) #b00000000000000000000000000000000) (bvslt (index!34805 lt!351884) (size!20930 lt!351748)))) (or ((_ is Undefined!8109) lt!351884) ((_ is Found!8109) lt!351884) (not ((_ is MissingVacant!8109) lt!351884)) (not (= (index!34807 lt!351884) index!1321)) (and (bvsge (index!34807 lt!351884) #b00000000000000000000000000000000) (bvslt (index!34807 lt!351884) (size!20930 lt!351748)))) (or ((_ is Undefined!8109) lt!351884) (ite ((_ is Found!8109) lt!351884) (= (select (arr!20509 lt!351748) (index!34805 lt!351884)) lt!351743) (and ((_ is MissingVacant!8109) lt!351884) (= (index!34807 lt!351884) index!1321) (= (select (arr!20509 lt!351748) (index!34807 lt!351884)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102891 (= lt!351884 e!438395)))

(declare-fun c!87655 () Bool)

(assert (=> d!102891 (= c!87655 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102891 (= lt!351885 (select (arr!20509 lt!351748) index!1321))))

(assert (=> d!102891 (validMask!0 mask!3328)))

(assert (=> d!102891 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351743 lt!351748 mask!3328) lt!351884)))

(declare-fun b!788738 () Bool)

(assert (=> b!788738 (= e!438393 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) index!1321 lt!351743 lt!351748 mask!3328))))

(declare-fun b!788739 () Bool)

(assert (=> b!788739 (= e!438395 Undefined!8109)))

(declare-fun b!788740 () Bool)

(declare-fun c!87654 () Bool)

(assert (=> b!788740 (= c!87654 (= lt!351885 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!788740 (= e!438394 e!438393)))

(assert (= (and d!102891 c!87655) b!788739))

(assert (= (and d!102891 (not c!87655)) b!788737))

(assert (= (and b!788737 c!87656) b!788736))

(assert (= (and b!788737 (not c!87656)) b!788740))

(assert (= (and b!788740 c!87654) b!788735))

(assert (= (and b!788740 (not c!87654)) b!788738))

(declare-fun m!730015 () Bool)

(assert (=> d!102891 m!730015))

(declare-fun m!730017 () Bool)

(assert (=> d!102891 m!730017))

(assert (=> d!102891 m!729973))

(assert (=> d!102891 m!729767))

(assert (=> b!788738 m!729879))

(assert (=> b!788738 m!729879))

(declare-fun m!730021 () Bool)

(assert (=> b!788738 m!730021))

(assert (=> b!788400 d!102891))

(declare-fun d!102895 () Bool)

(assert (=> d!102895 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!67802 d!102895))

(declare-fun d!102897 () Bool)

(assert (=> d!102897 (= (array_inv!16305 a!3186) (bvsge (size!20930 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!67802 d!102897))

(check-sat (not b!788670) (not d!102883) (not d!102847) (not b!788522) (not b!788536) (not bm!35277) (not b!788539) (not d!102877) (not d!102887) (not b!788482) (not d!102839) (not b!788504) (not b!788628) (not bm!35278) (not b!788697) (not b!788738) (not d!102871) (not b!788535) (not d!102861) (not d!102873) (not b!788663) (not b!788498) (not b!788481) (not d!102837) (not b!788609) (not d!102833) (not b!788706) (not bm!35281) (not b!788721) (not d!102891) (not b!788659) (not b!788503))
(check-sat)
