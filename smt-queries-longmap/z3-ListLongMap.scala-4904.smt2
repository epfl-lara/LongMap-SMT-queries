; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67670 () Bool)

(assert start!67670)

(declare-fun b!783827 () Bool)

(declare-datatypes ((Unit!27060 0))(
  ( (Unit!27061) )
))
(declare-fun e!435817 () Unit!27060)

(declare-fun Unit!27062 () Unit!27060)

(assert (=> b!783827 (= e!435817 Unit!27062)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42710 0))(
  ( (array!42711 (arr!20443 (Array (_ BitVec 32) (_ BitVec 64))) (size!20864 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42710)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!783828 () Bool)

(declare-fun e!435820 () Bool)

(declare-datatypes ((SeekEntryResult!8043 0))(
  ( (MissingZero!8043 (index!34540 (_ BitVec 32))) (Found!8043 (index!34541 (_ BitVec 32))) (Intermediate!8043 (undefined!8855 Bool) (index!34542 (_ BitVec 32)) (x!65495 (_ BitVec 32))) (Undefined!8043) (MissingVacant!8043 (index!34543 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42710 (_ BitVec 32)) SeekEntryResult!8043)

(assert (=> b!783828 (= e!435820 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20443 a!3186) j!159) a!3186 mask!3328) (Found!8043 j!159)))))

(declare-fun b!783829 () Bool)

(declare-fun e!435818 () Bool)

(declare-fun e!435814 () Bool)

(assert (=> b!783829 (= e!435818 e!435814)))

(declare-fun res!530347 () Bool)

(assert (=> b!783829 (=> (not res!530347) (not e!435814))))

(declare-fun lt!349375 () SeekEntryResult!8043)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42710 (_ BitVec 32)) SeekEntryResult!8043)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!783829 (= res!530347 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20443 a!3186) j!159) mask!3328) (select (arr!20443 a!3186) j!159) a!3186 mask!3328) lt!349375))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!783829 (= lt!349375 (Intermediate!8043 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!783830 () Bool)

(declare-fun res!530337 () Bool)

(declare-fun e!435821 () Bool)

(assert (=> b!783830 (=> (not res!530337) (not e!435821))))

(declare-fun lt!349366 () array!42710)

(declare-fun lt!349370 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42710 (_ BitVec 32)) SeekEntryResult!8043)

(assert (=> b!783830 (= res!530337 (= (seekEntryOrOpen!0 lt!349370 lt!349366 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349370 lt!349366 mask!3328)))))

(declare-fun b!783831 () Bool)

(declare-fun res!530343 () Bool)

(assert (=> b!783831 (=> (not res!530343) (not e!435814))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!783831 (= res!530343 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20443 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!783832 () Bool)

(declare-fun e!435816 () Bool)

(declare-fun e!435815 () Bool)

(assert (=> b!783832 (= e!435816 e!435815)))

(declare-fun res!530334 () Bool)

(assert (=> b!783832 (=> res!530334 e!435815)))

(declare-fun lt!349372 () SeekEntryResult!8043)

(declare-fun lt!349368 () SeekEntryResult!8043)

(assert (=> b!783832 (= res!530334 (not (= lt!349372 lt!349368)))))

(assert (=> b!783832 (= lt!349372 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20443 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!783833 () Bool)

(declare-fun res!530338 () Bool)

(declare-fun e!435819 () Bool)

(assert (=> b!783833 (=> (not res!530338) (not e!435819))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!783833 (= res!530338 (validKeyInArray!0 (select (arr!20443 a!3186) j!159)))))

(declare-fun b!783834 () Bool)

(declare-fun e!435823 () Bool)

(assert (=> b!783834 (= e!435815 e!435823)))

(declare-fun res!530331 () Bool)

(assert (=> b!783834 (=> res!530331 e!435823)))

(declare-fun lt!349374 () (_ BitVec 64))

(assert (=> b!783834 (= res!530331 (= lt!349374 lt!349370))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!783834 (= lt!349374 (select (store (arr!20443 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun e!435813 () Bool)

(declare-fun b!783835 () Bool)

(assert (=> b!783835 (= e!435813 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20443 a!3186) j!159) a!3186 mask!3328) lt!349368))))

(declare-fun b!783836 () Bool)

(declare-fun res!530346 () Bool)

(assert (=> b!783836 (=> (not res!530346) (not e!435819))))

(assert (=> b!783836 (= res!530346 (validKeyInArray!0 k0!2102))))

(declare-fun b!783837 () Bool)

(assert (=> b!783837 (= e!435820 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20443 a!3186) j!159) a!3186 mask!3328) lt!349375))))

(declare-fun b!783838 () Bool)

(declare-fun res!530330 () Bool)

(assert (=> b!783838 (=> (not res!530330) (not e!435819))))

(assert (=> b!783838 (= res!530330 (and (= (size!20864 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20864 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20864 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!783839 () Bool)

(declare-fun res!530336 () Bool)

(assert (=> b!783839 (=> (not res!530336) (not e!435819))))

(declare-fun arrayContainsKey!0 (array!42710 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!783839 (= res!530336 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!783840 () Bool)

(declare-fun res!530339 () Bool)

(assert (=> b!783840 (=> (not res!530339) (not e!435818))))

(assert (=> b!783840 (= res!530339 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20864 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20864 a!3186))))))

(declare-fun b!783841 () Bool)

(declare-fun res!530332 () Bool)

(assert (=> b!783841 (=> (not res!530332) (not e!435814))))

(assert (=> b!783841 (= res!530332 e!435820)))

(declare-fun c!87156 () Bool)

(assert (=> b!783841 (= c!87156 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!783842 () Bool)

(declare-fun res!530341 () Bool)

(assert (=> b!783842 (=> (not res!530341) (not e!435818))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42710 (_ BitVec 32)) Bool)

(assert (=> b!783842 (= res!530341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!783843 () Bool)

(assert (=> b!783843 (= e!435823 true)))

(assert (=> b!783843 e!435821))

(declare-fun res!530333 () Bool)

(assert (=> b!783843 (=> (not res!530333) (not e!435821))))

(assert (=> b!783843 (= res!530333 (= lt!349374 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!349376 () Unit!27060)

(assert (=> b!783843 (= lt!349376 e!435817)))

(declare-fun c!87157 () Bool)

(assert (=> b!783843 (= c!87157 (= lt!349374 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!783844 () Bool)

(declare-fun e!435824 () Bool)

(assert (=> b!783844 (= e!435814 e!435824)))

(declare-fun res!530348 () Bool)

(assert (=> b!783844 (=> (not res!530348) (not e!435824))))

(declare-fun lt!349365 () SeekEntryResult!8043)

(declare-fun lt!349373 () SeekEntryResult!8043)

(assert (=> b!783844 (= res!530348 (= lt!349365 lt!349373))))

(assert (=> b!783844 (= lt!349373 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349370 lt!349366 mask!3328))))

(assert (=> b!783844 (= lt!349365 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349370 mask!3328) lt!349370 lt!349366 mask!3328))))

(assert (=> b!783844 (= lt!349370 (select (store (arr!20443 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!783844 (= lt!349366 (array!42711 (store (arr!20443 a!3186) i!1173 k0!2102) (size!20864 a!3186)))))

(declare-fun res!530335 () Bool)

(assert (=> start!67670 (=> (not res!530335) (not e!435819))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67670 (= res!530335 (validMask!0 mask!3328))))

(assert (=> start!67670 e!435819))

(assert (=> start!67670 true))

(declare-fun array_inv!16239 (array!42710) Bool)

(assert (=> start!67670 (array_inv!16239 a!3186)))

(declare-fun b!783845 () Bool)

(declare-fun res!530345 () Bool)

(assert (=> b!783845 (=> (not res!530345) (not e!435818))))

(declare-datatypes ((List!14445 0))(
  ( (Nil!14442) (Cons!14441 (h!15564 (_ BitVec 64)) (t!20760 List!14445)) )
))
(declare-fun arrayNoDuplicates!0 (array!42710 (_ BitVec 32) List!14445) Bool)

(assert (=> b!783845 (= res!530345 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14442))))

(declare-fun b!783846 () Bool)

(declare-fun lt!349369 () SeekEntryResult!8043)

(assert (=> b!783846 (= e!435821 (= lt!349369 lt!349372))))

(declare-fun b!783847 () Bool)

(assert (=> b!783847 (= e!435819 e!435818)))

(declare-fun res!530340 () Bool)

(assert (=> b!783847 (=> (not res!530340) (not e!435818))))

(declare-fun lt!349371 () SeekEntryResult!8043)

(assert (=> b!783847 (= res!530340 (or (= lt!349371 (MissingZero!8043 i!1173)) (= lt!349371 (MissingVacant!8043 i!1173))))))

(assert (=> b!783847 (= lt!349371 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!783848 () Bool)

(declare-fun Unit!27063 () Unit!27060)

(assert (=> b!783848 (= e!435817 Unit!27063)))

(assert (=> b!783848 false))

(declare-fun b!783849 () Bool)

(assert (=> b!783849 (= e!435824 (not e!435816))))

(declare-fun res!530342 () Bool)

(assert (=> b!783849 (=> res!530342 e!435816)))

(get-info :version)

(assert (=> b!783849 (= res!530342 (or (not ((_ is Intermediate!8043) lt!349373)) (bvslt x!1131 (x!65495 lt!349373)) (not (= x!1131 (x!65495 lt!349373))) (not (= index!1321 (index!34542 lt!349373)))))))

(assert (=> b!783849 e!435813))

(declare-fun res!530344 () Bool)

(assert (=> b!783849 (=> (not res!530344) (not e!435813))))

(assert (=> b!783849 (= res!530344 (= lt!349369 lt!349368))))

(assert (=> b!783849 (= lt!349368 (Found!8043 j!159))))

(assert (=> b!783849 (= lt!349369 (seekEntryOrOpen!0 (select (arr!20443 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!783849 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!349367 () Unit!27060)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42710 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27060)

(assert (=> b!783849 (= lt!349367 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!67670 res!530335) b!783838))

(assert (= (and b!783838 res!530330) b!783833))

(assert (= (and b!783833 res!530338) b!783836))

(assert (= (and b!783836 res!530346) b!783839))

(assert (= (and b!783839 res!530336) b!783847))

(assert (= (and b!783847 res!530340) b!783842))

(assert (= (and b!783842 res!530341) b!783845))

(assert (= (and b!783845 res!530345) b!783840))

(assert (= (and b!783840 res!530339) b!783829))

(assert (= (and b!783829 res!530347) b!783831))

(assert (= (and b!783831 res!530343) b!783841))

(assert (= (and b!783841 c!87156) b!783837))

(assert (= (and b!783841 (not c!87156)) b!783828))

(assert (= (and b!783841 res!530332) b!783844))

(assert (= (and b!783844 res!530348) b!783849))

(assert (= (and b!783849 res!530344) b!783835))

(assert (= (and b!783849 (not res!530342)) b!783832))

(assert (= (and b!783832 (not res!530334)) b!783834))

(assert (= (and b!783834 (not res!530331)) b!783843))

(assert (= (and b!783843 c!87157) b!783848))

(assert (= (and b!783843 (not c!87157)) b!783827))

(assert (= (and b!783843 res!530333) b!783830))

(assert (= (and b!783830 res!530337) b!783846))

(declare-fun m!726297 () Bool)

(assert (=> b!783847 m!726297))

(declare-fun m!726299 () Bool)

(assert (=> b!783835 m!726299))

(assert (=> b!783835 m!726299))

(declare-fun m!726301 () Bool)

(assert (=> b!783835 m!726301))

(declare-fun m!726303 () Bool)

(assert (=> b!783834 m!726303))

(declare-fun m!726305 () Bool)

(assert (=> b!783834 m!726305))

(declare-fun m!726307 () Bool)

(assert (=> b!783844 m!726307))

(assert (=> b!783844 m!726303))

(assert (=> b!783844 m!726307))

(declare-fun m!726309 () Bool)

(assert (=> b!783844 m!726309))

(declare-fun m!726311 () Bool)

(assert (=> b!783844 m!726311))

(declare-fun m!726313 () Bool)

(assert (=> b!783844 m!726313))

(declare-fun m!726315 () Bool)

(assert (=> start!67670 m!726315))

(declare-fun m!726317 () Bool)

(assert (=> start!67670 m!726317))

(declare-fun m!726319 () Bool)

(assert (=> b!783831 m!726319))

(declare-fun m!726321 () Bool)

(assert (=> b!783839 m!726321))

(assert (=> b!783829 m!726299))

(assert (=> b!783829 m!726299))

(declare-fun m!726323 () Bool)

(assert (=> b!783829 m!726323))

(assert (=> b!783829 m!726323))

(assert (=> b!783829 m!726299))

(declare-fun m!726325 () Bool)

(assert (=> b!783829 m!726325))

(declare-fun m!726327 () Bool)

(assert (=> b!783830 m!726327))

(declare-fun m!726329 () Bool)

(assert (=> b!783830 m!726329))

(declare-fun m!726331 () Bool)

(assert (=> b!783845 m!726331))

(declare-fun m!726333 () Bool)

(assert (=> b!783836 m!726333))

(assert (=> b!783828 m!726299))

(assert (=> b!783828 m!726299))

(declare-fun m!726335 () Bool)

(assert (=> b!783828 m!726335))

(assert (=> b!783833 m!726299))

(assert (=> b!783833 m!726299))

(declare-fun m!726337 () Bool)

(assert (=> b!783833 m!726337))

(assert (=> b!783832 m!726299))

(assert (=> b!783832 m!726299))

(assert (=> b!783832 m!726335))

(assert (=> b!783849 m!726299))

(assert (=> b!783849 m!726299))

(declare-fun m!726339 () Bool)

(assert (=> b!783849 m!726339))

(declare-fun m!726341 () Bool)

(assert (=> b!783849 m!726341))

(declare-fun m!726343 () Bool)

(assert (=> b!783849 m!726343))

(assert (=> b!783837 m!726299))

(assert (=> b!783837 m!726299))

(declare-fun m!726345 () Bool)

(assert (=> b!783837 m!726345))

(declare-fun m!726347 () Bool)

(assert (=> b!783842 m!726347))

(check-sat (not b!783833) (not b!783832) (not start!67670) (not b!783845) (not b!783839) (not b!783828) (not b!783842) (not b!783829) (not b!783830) (not b!783837) (not b!783844) (not b!783847) (not b!783836) (not b!783849) (not b!783835))
(check-sat)
