; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67654 () Bool)

(assert start!67654)

(declare-fun b!783294 () Bool)

(declare-datatypes ((Unit!27028 0))(
  ( (Unit!27029) )
))
(declare-fun e!435536 () Unit!27028)

(declare-fun Unit!27030 () Unit!27028)

(assert (=> b!783294 (= e!435536 Unit!27030)))

(declare-fun b!783295 () Bool)

(declare-fun e!435538 () Bool)

(assert (=> b!783295 (= e!435538 true)))

(declare-fun e!435535 () Bool)

(assert (=> b!783295 e!435535))

(declare-fun res!529906 () Bool)

(assert (=> b!783295 (=> (not res!529906) (not e!435535))))

(declare-fun lt!349094 () (_ BitVec 64))

(assert (=> b!783295 (= res!529906 (= lt!349094 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!349090 () Unit!27028)

(assert (=> b!783295 (= lt!349090 e!435536)))

(declare-fun c!87108 () Bool)

(assert (=> b!783295 (= c!87108 (= lt!349094 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!783296 () Bool)

(declare-fun e!435540 () Bool)

(declare-fun e!435544 () Bool)

(assert (=> b!783296 (= e!435540 (not e!435544))))

(declare-fun res!529899 () Bool)

(assert (=> b!783296 (=> res!529899 e!435544)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8035 0))(
  ( (MissingZero!8035 (index!34508 (_ BitVec 32))) (Found!8035 (index!34509 (_ BitVec 32))) (Intermediate!8035 (undefined!8847 Bool) (index!34510 (_ BitVec 32)) (x!65463 (_ BitVec 32))) (Undefined!8035) (MissingVacant!8035 (index!34511 (_ BitVec 32))) )
))
(declare-fun lt!349096 () SeekEntryResult!8035)

(assert (=> b!783296 (= res!529899 (or (not (is-Intermediate!8035 lt!349096)) (bvslt x!1131 (x!65463 lt!349096)) (not (= x!1131 (x!65463 lt!349096))) (not (= index!1321 (index!34510 lt!349096)))))))

(declare-fun e!435542 () Bool)

(assert (=> b!783296 e!435542))

(declare-fun res!529907 () Bool)

(assert (=> b!783296 (=> (not res!529907) (not e!435542))))

(declare-fun lt!349095 () SeekEntryResult!8035)

(declare-fun lt!349091 () SeekEntryResult!8035)

(assert (=> b!783296 (= res!529907 (= lt!349095 lt!349091))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!783296 (= lt!349091 (Found!8035 j!159))))

(declare-datatypes ((array!42694 0))(
  ( (array!42695 (arr!20435 (Array (_ BitVec 32) (_ BitVec 64))) (size!20856 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42694)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42694 (_ BitVec 32)) SeekEntryResult!8035)

(assert (=> b!783296 (= lt!349095 (seekEntryOrOpen!0 (select (arr!20435 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42694 (_ BitVec 32)) Bool)

(assert (=> b!783296 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!349087 () Unit!27028)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42694 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27028)

(assert (=> b!783296 (= lt!349087 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!783297 () Bool)

(assert (=> b!783297 (= e!435544 e!435538)))

(declare-fun res!529894 () Bool)

(assert (=> b!783297 (=> res!529894 e!435538)))

(declare-fun lt!349097 () (_ BitVec 64))

(assert (=> b!783297 (= res!529894 (= lt!349094 lt!349097))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!783297 (= lt!349094 (select (store (arr!20435 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!783298 () Bool)

(declare-fun res!529902 () Bool)

(declare-fun e!435539 () Bool)

(assert (=> b!783298 (=> (not res!529902) (not e!435539))))

(assert (=> b!783298 (= res!529902 (and (= (size!20856 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20856 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20856 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!783299 () Bool)

(declare-fun res!529895 () Bool)

(declare-fun e!435545 () Bool)

(assert (=> b!783299 (=> (not res!529895) (not e!435545))))

(declare-datatypes ((List!14437 0))(
  ( (Nil!14434) (Cons!14433 (h!15556 (_ BitVec 64)) (t!20752 List!14437)) )
))
(declare-fun arrayNoDuplicates!0 (array!42694 (_ BitVec 32) List!14437) Bool)

(assert (=> b!783299 (= res!529895 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14434))))

(declare-fun b!783300 () Bool)

(declare-fun lt!349093 () array!42694)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42694 (_ BitVec 32)) SeekEntryResult!8035)

(assert (=> b!783300 (= e!435535 (= (seekEntryOrOpen!0 lt!349097 lt!349093 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349097 lt!349093 mask!3328)))))

(declare-fun b!783301 () Bool)

(declare-fun res!529896 () Bool)

(assert (=> b!783301 (=> (not res!529896) (not e!435539))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!783301 (= res!529896 (validKeyInArray!0 (select (arr!20435 a!3186) j!159)))))

(declare-fun b!783302 () Bool)

(declare-fun e!435541 () Bool)

(assert (=> b!783302 (= e!435545 e!435541)))

(declare-fun res!529898 () Bool)

(assert (=> b!783302 (=> (not res!529898) (not e!435541))))

(declare-fun lt!349089 () SeekEntryResult!8035)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42694 (_ BitVec 32)) SeekEntryResult!8035)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!783302 (= res!529898 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20435 a!3186) j!159) mask!3328) (select (arr!20435 a!3186) j!159) a!3186 mask!3328) lt!349089))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!783302 (= lt!349089 (Intermediate!8035 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!783303 () Bool)

(declare-fun res!529904 () Bool)

(assert (=> b!783303 (=> (not res!529904) (not e!435541))))

(declare-fun e!435537 () Bool)

(assert (=> b!783303 (= res!529904 e!435537)))

(declare-fun c!87109 () Bool)

(assert (=> b!783303 (= c!87109 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!783304 () Bool)

(declare-fun res!529901 () Bool)

(assert (=> b!783304 (=> (not res!529901) (not e!435545))))

(assert (=> b!783304 (= res!529901 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20856 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20856 a!3186))))))

(declare-fun b!783305 () Bool)

(declare-fun res!529900 () Bool)

(assert (=> b!783305 (=> (not res!529900) (not e!435539))))

(assert (=> b!783305 (= res!529900 (validKeyInArray!0 k!2102))))

(declare-fun b!783306 () Bool)

(assert (=> b!783306 (= e!435542 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20435 a!3186) j!159) a!3186 mask!3328) lt!349091))))

(declare-fun b!783307 () Bool)

(declare-fun res!529908 () Bool)

(assert (=> b!783307 (=> res!529908 e!435544)))

(assert (=> b!783307 (= res!529908 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20435 a!3186) j!159) a!3186 mask!3328) lt!349091)))))

(declare-fun b!783308 () Bool)

(assert (=> b!783308 (= e!435539 e!435545)))

(declare-fun res!529905 () Bool)

(assert (=> b!783308 (=> (not res!529905) (not e!435545))))

(declare-fun lt!349088 () SeekEntryResult!8035)

(assert (=> b!783308 (= res!529905 (or (= lt!349088 (MissingZero!8035 i!1173)) (= lt!349088 (MissingVacant!8035 i!1173))))))

(assert (=> b!783308 (= lt!349088 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!783309 () Bool)

(declare-fun Unit!27031 () Unit!27028)

(assert (=> b!783309 (= e!435536 Unit!27031)))

(assert (=> b!783309 false))

(declare-fun b!783310 () Bool)

(declare-fun res!529903 () Bool)

(assert (=> b!783310 (=> (not res!529903) (not e!435541))))

(assert (=> b!783310 (= res!529903 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20435 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!529893 () Bool)

(assert (=> start!67654 (=> (not res!529893) (not e!435539))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67654 (= res!529893 (validMask!0 mask!3328))))

(assert (=> start!67654 e!435539))

(assert (=> start!67654 true))

(declare-fun array_inv!16231 (array!42694) Bool)

(assert (=> start!67654 (array_inv!16231 a!3186)))

(declare-fun b!783311 () Bool)

(assert (=> b!783311 (= e!435537 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20435 a!3186) j!159) a!3186 mask!3328) (Found!8035 j!159)))))

(declare-fun b!783312 () Bool)

(declare-fun res!529910 () Bool)

(assert (=> b!783312 (=> (not res!529910) (not e!435545))))

(assert (=> b!783312 (= res!529910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!783313 () Bool)

(assert (=> b!783313 (= e!435541 e!435540)))

(declare-fun res!529909 () Bool)

(assert (=> b!783313 (=> (not res!529909) (not e!435540))))

(declare-fun lt!349092 () SeekEntryResult!8035)

(assert (=> b!783313 (= res!529909 (= lt!349092 lt!349096))))

(assert (=> b!783313 (= lt!349096 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349097 lt!349093 mask!3328))))

(assert (=> b!783313 (= lt!349092 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349097 mask!3328) lt!349097 lt!349093 mask!3328))))

(assert (=> b!783313 (= lt!349097 (select (store (arr!20435 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!783313 (= lt!349093 (array!42695 (store (arr!20435 a!3186) i!1173 k!2102) (size!20856 a!3186)))))

(declare-fun b!783314 () Bool)

(assert (=> b!783314 (= e!435537 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20435 a!3186) j!159) a!3186 mask!3328) lt!349089))))

(declare-fun b!783315 () Bool)

(declare-fun res!529897 () Bool)

(assert (=> b!783315 (=> (not res!529897) (not e!435539))))

(declare-fun arrayContainsKey!0 (array!42694 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!783315 (= res!529897 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!67654 res!529893) b!783298))

(assert (= (and b!783298 res!529902) b!783301))

(assert (= (and b!783301 res!529896) b!783305))

(assert (= (and b!783305 res!529900) b!783315))

(assert (= (and b!783315 res!529897) b!783308))

(assert (= (and b!783308 res!529905) b!783312))

(assert (= (and b!783312 res!529910) b!783299))

(assert (= (and b!783299 res!529895) b!783304))

(assert (= (and b!783304 res!529901) b!783302))

(assert (= (and b!783302 res!529898) b!783310))

(assert (= (and b!783310 res!529903) b!783303))

(assert (= (and b!783303 c!87109) b!783314))

(assert (= (and b!783303 (not c!87109)) b!783311))

(assert (= (and b!783303 res!529904) b!783313))

(assert (= (and b!783313 res!529909) b!783296))

(assert (= (and b!783296 res!529907) b!783306))

(assert (= (and b!783296 (not res!529899)) b!783307))

(assert (= (and b!783307 (not res!529908)) b!783297))

(assert (= (and b!783297 (not res!529894)) b!783295))

(assert (= (and b!783295 c!87108) b!783309))

(assert (= (and b!783295 (not c!87108)) b!783294))

(assert (= (and b!783295 res!529906) b!783300))

(declare-fun m!725881 () Bool)

(assert (=> b!783301 m!725881))

(assert (=> b!783301 m!725881))

(declare-fun m!725883 () Bool)

(assert (=> b!783301 m!725883))

(assert (=> b!783306 m!725881))

(assert (=> b!783306 m!725881))

(declare-fun m!725885 () Bool)

(assert (=> b!783306 m!725885))

(assert (=> b!783296 m!725881))

(assert (=> b!783296 m!725881))

(declare-fun m!725887 () Bool)

(assert (=> b!783296 m!725887))

(declare-fun m!725889 () Bool)

(assert (=> b!783296 m!725889))

(declare-fun m!725891 () Bool)

(assert (=> b!783296 m!725891))

(declare-fun m!725893 () Bool)

(assert (=> b!783299 m!725893))

(declare-fun m!725895 () Bool)

(assert (=> b!783305 m!725895))

(declare-fun m!725897 () Bool)

(assert (=> b!783313 m!725897))

(declare-fun m!725899 () Bool)

(assert (=> b!783313 m!725899))

(declare-fun m!725901 () Bool)

(assert (=> b!783313 m!725901))

(declare-fun m!725903 () Bool)

(assert (=> b!783313 m!725903))

(assert (=> b!783313 m!725899))

(declare-fun m!725905 () Bool)

(assert (=> b!783313 m!725905))

(assert (=> b!783307 m!725881))

(assert (=> b!783307 m!725881))

(declare-fun m!725907 () Bool)

(assert (=> b!783307 m!725907))

(declare-fun m!725909 () Bool)

(assert (=> start!67654 m!725909))

(declare-fun m!725911 () Bool)

(assert (=> start!67654 m!725911))

(assert (=> b!783314 m!725881))

(assert (=> b!783314 m!725881))

(declare-fun m!725913 () Bool)

(assert (=> b!783314 m!725913))

(declare-fun m!725915 () Bool)

(assert (=> b!783308 m!725915))

(assert (=> b!783297 m!725901))

(declare-fun m!725917 () Bool)

(assert (=> b!783297 m!725917))

(assert (=> b!783311 m!725881))

(assert (=> b!783311 m!725881))

(assert (=> b!783311 m!725907))

(assert (=> b!783302 m!725881))

(assert (=> b!783302 m!725881))

(declare-fun m!725919 () Bool)

(assert (=> b!783302 m!725919))

(assert (=> b!783302 m!725919))

(assert (=> b!783302 m!725881))

(declare-fun m!725921 () Bool)

(assert (=> b!783302 m!725921))

(declare-fun m!725923 () Bool)

(assert (=> b!783315 m!725923))

(declare-fun m!725925 () Bool)

(assert (=> b!783312 m!725925))

(declare-fun m!725927 () Bool)

(assert (=> b!783310 m!725927))

(declare-fun m!725929 () Bool)

(assert (=> b!783300 m!725929))

(declare-fun m!725931 () Bool)

(assert (=> b!783300 m!725931))

(push 1)

