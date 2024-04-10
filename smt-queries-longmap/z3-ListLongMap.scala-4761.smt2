; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65628 () Bool)

(assert start!65628)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!419025 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!751102 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!751102 (= e!419025 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun e!419023 () Bool)

(assert (=> b!751102 e!419023))

(declare-fun res!507046 () Bool)

(assert (=> b!751102 (=> (not res!507046) (not e!419023))))

(declare-fun lt!334019 () (_ BitVec 64))

(assert (=> b!751102 (= res!507046 (= lt!334019 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!25836 0))(
  ( (Unit!25837) )
))
(declare-fun lt!334020 () Unit!25836)

(declare-fun e!419022 () Unit!25836)

(assert (=> b!751102 (= lt!334020 e!419022)))

(declare-fun c!82414 () Bool)

(assert (=> b!751102 (= c!82414 (= lt!334019 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!751103 () Bool)

(declare-fun res!507045 () Bool)

(declare-fun e!419029 () Bool)

(assert (=> b!751103 (=> (not res!507045) (not e!419029))))

(declare-datatypes ((array!41801 0))(
  ( (array!41802 (arr!20014 (Array (_ BitVec 32) (_ BitVec 64))) (size!20435 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41801)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!751103 (= res!507045 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20435 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20435 a!3186))))))

(declare-fun b!751104 () Bool)

(declare-fun e!419027 () Bool)

(declare-fun e!419028 () Bool)

(assert (=> b!751104 (= e!419027 e!419028)))

(declare-fun res!507039 () Bool)

(assert (=> b!751104 (=> (not res!507039) (not e!419028))))

(declare-datatypes ((SeekEntryResult!7614 0))(
  ( (MissingZero!7614 (index!32824 (_ BitVec 32))) (Found!7614 (index!32825 (_ BitVec 32))) (Intermediate!7614 (undefined!8426 Bool) (index!32826 (_ BitVec 32)) (x!63748 (_ BitVec 32))) (Undefined!7614) (MissingVacant!7614 (index!32827 (_ BitVec 32))) )
))
(declare-fun lt!334021 () SeekEntryResult!7614)

(declare-fun lt!334018 () SeekEntryResult!7614)

(assert (=> b!751104 (= res!507039 (= lt!334021 lt!334018))))

(declare-fun lt!334013 () (_ BitVec 64))

(declare-fun lt!334016 () array!41801)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41801 (_ BitVec 32)) SeekEntryResult!7614)

(assert (=> b!751104 (= lt!334018 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334013 lt!334016 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!751104 (= lt!334021 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334013 mask!3328) lt!334013 lt!334016 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!751104 (= lt!334013 (select (store (arr!20014 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!751104 (= lt!334016 (array!41802 (store (arr!20014 a!3186) i!1173 k0!2102) (size!20435 a!3186)))))

(declare-fun b!751105 () Bool)

(declare-fun res!507038 () Bool)

(declare-fun e!419030 () Bool)

(assert (=> b!751105 (=> res!507038 e!419030)))

(declare-fun lt!334012 () SeekEntryResult!7614)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41801 (_ BitVec 32)) SeekEntryResult!7614)

(assert (=> b!751105 (= res!507038 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20014 a!3186) j!159) a!3186 mask!3328) lt!334012)))))

(declare-fun e!419026 () Bool)

(declare-fun b!751106 () Bool)

(assert (=> b!751106 (= e!419026 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20014 a!3186) j!159) a!3186 mask!3328) (Found!7614 j!159)))))

(declare-fun b!751107 () Bool)

(assert (=> b!751107 (= e!419029 e!419027)))

(declare-fun res!507052 () Bool)

(assert (=> b!751107 (=> (not res!507052) (not e!419027))))

(declare-fun lt!334014 () SeekEntryResult!7614)

(assert (=> b!751107 (= res!507052 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20014 a!3186) j!159) mask!3328) (select (arr!20014 a!3186) j!159) a!3186 mask!3328) lt!334014))))

(assert (=> b!751107 (= lt!334014 (Intermediate!7614 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!751108 () Bool)

(assert (=> b!751108 (= e!419030 e!419025)))

(declare-fun res!507041 () Bool)

(assert (=> b!751108 (=> res!507041 e!419025)))

(assert (=> b!751108 (= res!507041 (= lt!334019 lt!334013))))

(assert (=> b!751108 (= lt!334019 (select (store (arr!20014 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!751109 () Bool)

(declare-fun res!507043 () Bool)

(assert (=> b!751109 (=> (not res!507043) (not e!419029))))

(declare-datatypes ((List!14016 0))(
  ( (Nil!14013) (Cons!14012 (h!15084 (_ BitVec 64)) (t!20331 List!14016)) )
))
(declare-fun arrayNoDuplicates!0 (array!41801 (_ BitVec 32) List!14016) Bool)

(assert (=> b!751109 (= res!507043 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14013))))

(declare-fun b!751110 () Bool)

(declare-fun res!507049 () Bool)

(declare-fun e!419024 () Bool)

(assert (=> b!751110 (=> (not res!507049) (not e!419024))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!751110 (= res!507049 (validKeyInArray!0 k0!2102))))

(declare-fun b!751111 () Bool)

(assert (=> b!751111 (= e!419024 e!419029)))

(declare-fun res!507037 () Bool)

(assert (=> b!751111 (=> (not res!507037) (not e!419029))))

(declare-fun lt!334015 () SeekEntryResult!7614)

(assert (=> b!751111 (= res!507037 (or (= lt!334015 (MissingZero!7614 i!1173)) (= lt!334015 (MissingVacant!7614 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41801 (_ BitVec 32)) SeekEntryResult!7614)

(assert (=> b!751111 (= lt!334015 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!751112 () Bool)

(declare-fun Unit!25838 () Unit!25836)

(assert (=> b!751112 (= e!419022 Unit!25838)))

(declare-fun b!751113 () Bool)

(declare-fun res!507048 () Bool)

(assert (=> b!751113 (=> (not res!507048) (not e!419024))))

(assert (=> b!751113 (= res!507048 (and (= (size!20435 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20435 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20435 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!751114 () Bool)

(declare-fun res!507051 () Bool)

(assert (=> b!751114 (=> (not res!507051) (not e!419024))))

(assert (=> b!751114 (= res!507051 (validKeyInArray!0 (select (arr!20014 a!3186) j!159)))))

(declare-fun b!751115 () Bool)

(assert (=> b!751115 (= e!419023 (= (seekEntryOrOpen!0 lt!334013 lt!334016 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334013 lt!334016 mask!3328)))))

(declare-fun b!751116 () Bool)

(declare-fun Unit!25839 () Unit!25836)

(assert (=> b!751116 (= e!419022 Unit!25839)))

(assert (=> b!751116 false))

(declare-fun b!751117 () Bool)

(declare-fun e!419021 () Bool)

(assert (=> b!751117 (= e!419021 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20014 a!3186) j!159) a!3186 mask!3328) lt!334012))))

(declare-fun b!751118 () Bool)

(declare-fun res!507047 () Bool)

(assert (=> b!751118 (=> (not res!507047) (not e!419029))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41801 (_ BitVec 32)) Bool)

(assert (=> b!751118 (= res!507047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!507044 () Bool)

(assert (=> start!65628 (=> (not res!507044) (not e!419024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65628 (= res!507044 (validMask!0 mask!3328))))

(assert (=> start!65628 e!419024))

(assert (=> start!65628 true))

(declare-fun array_inv!15810 (array!41801) Bool)

(assert (=> start!65628 (array_inv!15810 a!3186)))

(declare-fun b!751101 () Bool)

(declare-fun res!507040 () Bool)

(assert (=> b!751101 (=> (not res!507040) (not e!419027))))

(assert (=> b!751101 (= res!507040 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20014 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!751119 () Bool)

(assert (=> b!751119 (= e!419028 (not e!419030))))

(declare-fun res!507053 () Bool)

(assert (=> b!751119 (=> res!507053 e!419030)))

(get-info :version)

(assert (=> b!751119 (= res!507053 (or (not ((_ is Intermediate!7614) lt!334018)) (bvslt x!1131 (x!63748 lt!334018)) (not (= x!1131 (x!63748 lt!334018))) (not (= index!1321 (index!32826 lt!334018)))))))

(assert (=> b!751119 e!419021))

(declare-fun res!507050 () Bool)

(assert (=> b!751119 (=> (not res!507050) (not e!419021))))

(declare-fun lt!334017 () SeekEntryResult!7614)

(assert (=> b!751119 (= res!507050 (= lt!334017 lt!334012))))

(assert (=> b!751119 (= lt!334012 (Found!7614 j!159))))

(assert (=> b!751119 (= lt!334017 (seekEntryOrOpen!0 (select (arr!20014 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!751119 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!334022 () Unit!25836)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41801 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25836)

(assert (=> b!751119 (= lt!334022 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!751120 () Bool)

(assert (=> b!751120 (= e!419026 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20014 a!3186) j!159) a!3186 mask!3328) lt!334014))))

(declare-fun b!751121 () Bool)

(declare-fun res!507042 () Bool)

(assert (=> b!751121 (=> (not res!507042) (not e!419027))))

(assert (=> b!751121 (= res!507042 e!419026)))

(declare-fun c!82413 () Bool)

(assert (=> b!751121 (= c!82413 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!751122 () Bool)

(declare-fun res!507036 () Bool)

(assert (=> b!751122 (=> (not res!507036) (not e!419024))))

(declare-fun arrayContainsKey!0 (array!41801 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!751122 (= res!507036 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!65628 res!507044) b!751113))

(assert (= (and b!751113 res!507048) b!751114))

(assert (= (and b!751114 res!507051) b!751110))

(assert (= (and b!751110 res!507049) b!751122))

(assert (= (and b!751122 res!507036) b!751111))

(assert (= (and b!751111 res!507037) b!751118))

(assert (= (and b!751118 res!507047) b!751109))

(assert (= (and b!751109 res!507043) b!751103))

(assert (= (and b!751103 res!507045) b!751107))

(assert (= (and b!751107 res!507052) b!751101))

(assert (= (and b!751101 res!507040) b!751121))

(assert (= (and b!751121 c!82413) b!751120))

(assert (= (and b!751121 (not c!82413)) b!751106))

(assert (= (and b!751121 res!507042) b!751104))

(assert (= (and b!751104 res!507039) b!751119))

(assert (= (and b!751119 res!507050) b!751117))

(assert (= (and b!751119 (not res!507053)) b!751105))

(assert (= (and b!751105 (not res!507038)) b!751108))

(assert (= (and b!751108 (not res!507041)) b!751102))

(assert (= (and b!751102 c!82414) b!751116))

(assert (= (and b!751102 (not c!82414)) b!751112))

(assert (= (and b!751102 res!507046) b!751115))

(declare-fun m!700355 () Bool)

(assert (=> b!751117 m!700355))

(assert (=> b!751117 m!700355))

(declare-fun m!700357 () Bool)

(assert (=> b!751117 m!700357))

(declare-fun m!700359 () Bool)

(assert (=> b!751122 m!700359))

(assert (=> b!751114 m!700355))

(assert (=> b!751114 m!700355))

(declare-fun m!700361 () Bool)

(assert (=> b!751114 m!700361))

(declare-fun m!700363 () Bool)

(assert (=> b!751101 m!700363))

(declare-fun m!700365 () Bool)

(assert (=> b!751115 m!700365))

(declare-fun m!700367 () Bool)

(assert (=> b!751115 m!700367))

(declare-fun m!700369 () Bool)

(assert (=> b!751111 m!700369))

(declare-fun m!700371 () Bool)

(assert (=> b!751118 m!700371))

(declare-fun m!700373 () Bool)

(assert (=> b!751108 m!700373))

(declare-fun m!700375 () Bool)

(assert (=> b!751108 m!700375))

(declare-fun m!700377 () Bool)

(assert (=> b!751104 m!700377))

(declare-fun m!700379 () Bool)

(assert (=> b!751104 m!700379))

(assert (=> b!751104 m!700373))

(declare-fun m!700381 () Bool)

(assert (=> b!751104 m!700381))

(assert (=> b!751104 m!700377))

(declare-fun m!700383 () Bool)

(assert (=> b!751104 m!700383))

(assert (=> b!751105 m!700355))

(assert (=> b!751105 m!700355))

(declare-fun m!700385 () Bool)

(assert (=> b!751105 m!700385))

(assert (=> b!751119 m!700355))

(assert (=> b!751119 m!700355))

(declare-fun m!700387 () Bool)

(assert (=> b!751119 m!700387))

(declare-fun m!700389 () Bool)

(assert (=> b!751119 m!700389))

(declare-fun m!700391 () Bool)

(assert (=> b!751119 m!700391))

(assert (=> b!751120 m!700355))

(assert (=> b!751120 m!700355))

(declare-fun m!700393 () Bool)

(assert (=> b!751120 m!700393))

(assert (=> b!751106 m!700355))

(assert (=> b!751106 m!700355))

(assert (=> b!751106 m!700385))

(declare-fun m!700395 () Bool)

(assert (=> b!751110 m!700395))

(declare-fun m!700397 () Bool)

(assert (=> start!65628 m!700397))

(declare-fun m!700399 () Bool)

(assert (=> start!65628 m!700399))

(declare-fun m!700401 () Bool)

(assert (=> b!751109 m!700401))

(assert (=> b!751107 m!700355))

(assert (=> b!751107 m!700355))

(declare-fun m!700403 () Bool)

(assert (=> b!751107 m!700403))

(assert (=> b!751107 m!700403))

(assert (=> b!751107 m!700355))

(declare-fun m!700405 () Bool)

(assert (=> b!751107 m!700405))

(check-sat (not b!751106) (not b!751122) (not b!751104) (not b!751119) (not b!751117) (not b!751107) (not b!751114) (not start!65628) (not b!751115) (not b!751118) (not b!751110) (not b!751109) (not b!751105) (not b!751111) (not b!751120))
(check-sat)
