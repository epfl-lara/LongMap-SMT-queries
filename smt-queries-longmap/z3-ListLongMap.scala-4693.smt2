; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65346 () Bool)

(assert start!65346)

(declare-fun b!739373 () Bool)

(declare-fun res!496889 () Bool)

(declare-fun e!413546 () Bool)

(assert (=> b!739373 (=> (not res!496889) (not e!413546))))

(declare-datatypes ((array!41389 0))(
  ( (array!41390 (arr!19804 (Array (_ BitVec 32) (_ BitVec 64))) (size!20224 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41389)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41389 (_ BitVec 32)) Bool)

(assert (=> b!739373 (= res!496889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!739374 () Bool)

(declare-fun e!413555 () Bool)

(declare-fun e!413549 () Bool)

(assert (=> b!739374 (= e!413555 e!413549)))

(declare-fun res!496881 () Bool)

(assert (=> b!739374 (=> (not res!496881) (not e!413549))))

(declare-datatypes ((SeekEntryResult!7360 0))(
  ( (MissingZero!7360 (index!31808 (_ BitVec 32))) (Found!7360 (index!31809 (_ BitVec 32))) (Intermediate!7360 (undefined!8172 Bool) (index!31810 (_ BitVec 32)) (x!62962 (_ BitVec 32))) (Undefined!7360) (MissingVacant!7360 (index!31811 (_ BitVec 32))) )
))
(declare-fun lt!328199 () SeekEntryResult!7360)

(declare-fun lt!328189 () SeekEntryResult!7360)

(assert (=> b!739374 (= res!496881 (= lt!328199 lt!328189))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!328191 () (_ BitVec 64))

(declare-fun lt!328194 () array!41389)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41389 (_ BitVec 32)) SeekEntryResult!7360)

(assert (=> b!739374 (= lt!328189 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328191 lt!328194 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739374 (= lt!328199 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328191 mask!3328) lt!328191 lt!328194 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!739374 (= lt!328191 (select (store (arr!19804 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!739374 (= lt!328194 (array!41390 (store (arr!19804 a!3186) i!1173 k0!2102) (size!20224 a!3186)))))

(declare-fun b!739375 () Bool)

(declare-fun res!496879 () Bool)

(declare-fun e!413545 () Bool)

(assert (=> b!739375 (=> (not res!496879) (not e!413545))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!739375 (= res!496879 (validKeyInArray!0 k0!2102))))

(declare-fun b!739376 () Bool)

(declare-fun res!496874 () Bool)

(assert (=> b!739376 (=> (not res!496874) (not e!413545))))

(assert (=> b!739376 (= res!496874 (and (= (size!20224 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20224 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20224 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!739377 () Bool)

(declare-fun res!496876 () Bool)

(assert (=> b!739377 (=> (not res!496876) (not e!413555))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!739377 (= res!496876 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19804 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!739378 () Bool)

(declare-fun res!496883 () Bool)

(assert (=> b!739378 (=> (not res!496883) (not e!413545))))

(declare-fun arrayContainsKey!0 (array!41389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!739378 (= res!496883 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!496877 () Bool)

(assert (=> start!65346 (=> (not res!496877) (not e!413545))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65346 (= res!496877 (validMask!0 mask!3328))))

(assert (=> start!65346 e!413545))

(assert (=> start!65346 true))

(declare-fun array_inv!15663 (array!41389) Bool)

(assert (=> start!65346 (array_inv!15663 a!3186)))

(declare-fun b!739379 () Bool)

(declare-fun e!413554 () Bool)

(assert (=> b!739379 (= e!413554 true)))

(declare-fun lt!328187 () (_ BitVec 32))

(declare-fun lt!328192 () SeekEntryResult!7360)

(assert (=> b!739379 (= lt!328192 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328187 lt!328191 lt!328194 mask!3328))))

(declare-fun b!739380 () Bool)

(declare-fun e!413553 () Bool)

(assert (=> b!739380 (= e!413553 e!413554)))

(declare-fun res!496882 () Bool)

(assert (=> b!739380 (=> res!496882 e!413554)))

(assert (=> b!739380 (= res!496882 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328187 #b00000000000000000000000000000000) (bvsge lt!328187 (size!20224 a!3186))))))

(declare-datatypes ((Unit!25213 0))(
  ( (Unit!25214) )
))
(declare-fun lt!328200 () Unit!25213)

(declare-fun e!413548 () Unit!25213)

(assert (=> b!739380 (= lt!328200 e!413548)))

(declare-fun c!81634 () Bool)

(declare-fun lt!328193 () Bool)

(assert (=> b!739380 (= c!81634 lt!328193)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!739380 (= lt!328193 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739380 (= lt!328187 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun e!413551 () Bool)

(declare-fun b!739381 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41389 (_ BitVec 32)) SeekEntryResult!7360)

(assert (=> b!739381 (= e!413551 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19804 a!3186) j!159) a!3186 mask!3328) (Found!7360 j!159)))))

(declare-fun lt!328197 () SeekEntryResult!7360)

(declare-fun b!739382 () Bool)

(assert (=> b!739382 (= e!413551 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19804 a!3186) j!159) a!3186 mask!3328) lt!328197))))

(declare-fun b!739383 () Bool)

(declare-fun e!413552 () Bool)

(declare-fun lt!328195 () SeekEntryResult!7360)

(assert (=> b!739383 (= e!413552 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19804 a!3186) j!159) a!3186 mask!3328) lt!328195))))

(declare-fun b!739384 () Bool)

(assert (=> b!739384 (= e!413545 e!413546)))

(declare-fun res!496887 () Bool)

(assert (=> b!739384 (=> (not res!496887) (not e!413546))))

(declare-fun lt!328198 () SeekEntryResult!7360)

(assert (=> b!739384 (= res!496887 (or (= lt!328198 (MissingZero!7360 i!1173)) (= lt!328198 (MissingVacant!7360 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41389 (_ BitVec 32)) SeekEntryResult!7360)

(assert (=> b!739384 (= lt!328198 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!739385 () Bool)

(declare-fun e!413550 () Bool)

(declare-fun lt!328188 () SeekEntryResult!7360)

(assert (=> b!739385 (= e!413550 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328187 resIntermediateIndex!5 (select (arr!19804 a!3186) j!159) a!3186 mask!3328) lt!328188)))))

(declare-fun b!739386 () Bool)

(declare-fun e!413556 () Bool)

(assert (=> b!739386 (= e!413556 e!413552)))

(declare-fun res!496875 () Bool)

(assert (=> b!739386 (=> (not res!496875) (not e!413552))))

(assert (=> b!739386 (= res!496875 (= (seekEntryOrOpen!0 (select (arr!19804 a!3186) j!159) a!3186 mask!3328) lt!328195))))

(assert (=> b!739386 (= lt!328195 (Found!7360 j!159))))

(declare-fun b!739387 () Bool)

(declare-fun res!496888 () Bool)

(assert (=> b!739387 (=> (not res!496888) (not e!413545))))

(assert (=> b!739387 (= res!496888 (validKeyInArray!0 (select (arr!19804 a!3186) j!159)))))

(declare-fun b!739388 () Bool)

(assert (=> b!739388 (= e!413549 (not e!413553))))

(declare-fun res!496885 () Bool)

(assert (=> b!739388 (=> res!496885 e!413553)))

(get-info :version)

(assert (=> b!739388 (= res!496885 (or (not ((_ is Intermediate!7360) lt!328189)) (bvsge x!1131 (x!62962 lt!328189))))))

(assert (=> b!739388 (= lt!328188 (Found!7360 j!159))))

(assert (=> b!739388 e!413556))

(declare-fun res!496886 () Bool)

(assert (=> b!739388 (=> (not res!496886) (not e!413556))))

(assert (=> b!739388 (= res!496886 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!328196 () Unit!25213)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41389 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25213)

(assert (=> b!739388 (= lt!328196 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!739389 () Bool)

(declare-fun res!496890 () Bool)

(assert (=> b!739389 (=> res!496890 e!413554)))

(assert (=> b!739389 (= res!496890 e!413550)))

(declare-fun c!81635 () Bool)

(assert (=> b!739389 (= c!81635 lt!328193)))

(declare-fun b!739390 () Bool)

(declare-fun res!496884 () Bool)

(assert (=> b!739390 (=> (not res!496884) (not e!413546))))

(declare-datatypes ((List!13713 0))(
  ( (Nil!13710) (Cons!13709 (h!14787 (_ BitVec 64)) (t!20020 List!13713)) )
))
(declare-fun arrayNoDuplicates!0 (array!41389 (_ BitVec 32) List!13713) Bool)

(assert (=> b!739390 (= res!496884 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13710))))

(declare-fun b!739391 () Bool)

(declare-fun Unit!25215 () Unit!25213)

(assert (=> b!739391 (= e!413548 Unit!25215)))

(declare-fun lt!328190 () SeekEntryResult!7360)

(assert (=> b!739391 (= lt!328190 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19804 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!739391 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328187 resIntermediateIndex!5 (select (arr!19804 a!3186) j!159) a!3186 mask!3328) lt!328188)))

(declare-fun b!739392 () Bool)

(declare-fun res!496878 () Bool)

(assert (=> b!739392 (=> (not res!496878) (not e!413546))))

(assert (=> b!739392 (= res!496878 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20224 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20224 a!3186))))))

(declare-fun b!739393 () Bool)

(declare-fun res!496880 () Bool)

(assert (=> b!739393 (=> (not res!496880) (not e!413555))))

(assert (=> b!739393 (= res!496880 e!413551)))

(declare-fun c!81633 () Bool)

(assert (=> b!739393 (= c!81633 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!739394 () Bool)

(assert (=> b!739394 (= e!413550 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328187 (select (arr!19804 a!3186) j!159) a!3186 mask!3328) lt!328197)))))

(declare-fun b!739395 () Bool)

(assert (=> b!739395 (= e!413546 e!413555)))

(declare-fun res!496891 () Bool)

(assert (=> b!739395 (=> (not res!496891) (not e!413555))))

(assert (=> b!739395 (= res!496891 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19804 a!3186) j!159) mask!3328) (select (arr!19804 a!3186) j!159) a!3186 mask!3328) lt!328197))))

(assert (=> b!739395 (= lt!328197 (Intermediate!7360 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!739396 () Bool)

(declare-fun Unit!25216 () Unit!25213)

(assert (=> b!739396 (= e!413548 Unit!25216)))

(assert (=> b!739396 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328187 (select (arr!19804 a!3186) j!159) a!3186 mask!3328) lt!328197)))

(assert (= (and start!65346 res!496877) b!739376))

(assert (= (and b!739376 res!496874) b!739387))

(assert (= (and b!739387 res!496888) b!739375))

(assert (= (and b!739375 res!496879) b!739378))

(assert (= (and b!739378 res!496883) b!739384))

(assert (= (and b!739384 res!496887) b!739373))

(assert (= (and b!739373 res!496889) b!739390))

(assert (= (and b!739390 res!496884) b!739392))

(assert (= (and b!739392 res!496878) b!739395))

(assert (= (and b!739395 res!496891) b!739377))

(assert (= (and b!739377 res!496876) b!739393))

(assert (= (and b!739393 c!81633) b!739382))

(assert (= (and b!739393 (not c!81633)) b!739381))

(assert (= (and b!739393 res!496880) b!739374))

(assert (= (and b!739374 res!496881) b!739388))

(assert (= (and b!739388 res!496886) b!739386))

(assert (= (and b!739386 res!496875) b!739383))

(assert (= (and b!739388 (not res!496885)) b!739380))

(assert (= (and b!739380 c!81634) b!739396))

(assert (= (and b!739380 (not c!81634)) b!739391))

(assert (= (and b!739380 (not res!496882)) b!739389))

(assert (= (and b!739389 c!81635) b!739394))

(assert (= (and b!739389 (not c!81635)) b!739385))

(assert (= (and b!739389 (not res!496890)) b!739379))

(declare-fun m!691371 () Bool)

(assert (=> b!739375 m!691371))

(declare-fun m!691373 () Bool)

(assert (=> b!739384 m!691373))

(declare-fun m!691375 () Bool)

(assert (=> b!739385 m!691375))

(assert (=> b!739385 m!691375))

(declare-fun m!691377 () Bool)

(assert (=> b!739385 m!691377))

(assert (=> b!739394 m!691375))

(assert (=> b!739394 m!691375))

(declare-fun m!691379 () Bool)

(assert (=> b!739394 m!691379))

(declare-fun m!691381 () Bool)

(assert (=> start!65346 m!691381))

(declare-fun m!691383 () Bool)

(assert (=> start!65346 m!691383))

(assert (=> b!739387 m!691375))

(assert (=> b!739387 m!691375))

(declare-fun m!691385 () Bool)

(assert (=> b!739387 m!691385))

(assert (=> b!739396 m!691375))

(assert (=> b!739396 m!691375))

(assert (=> b!739396 m!691379))

(declare-fun m!691387 () Bool)

(assert (=> b!739377 m!691387))

(declare-fun m!691389 () Bool)

(assert (=> b!739374 m!691389))

(declare-fun m!691391 () Bool)

(assert (=> b!739374 m!691391))

(declare-fun m!691393 () Bool)

(assert (=> b!739374 m!691393))

(declare-fun m!691395 () Bool)

(assert (=> b!739374 m!691395))

(assert (=> b!739374 m!691393))

(declare-fun m!691397 () Bool)

(assert (=> b!739374 m!691397))

(declare-fun m!691399 () Bool)

(assert (=> b!739378 m!691399))

(assert (=> b!739386 m!691375))

(assert (=> b!739386 m!691375))

(declare-fun m!691401 () Bool)

(assert (=> b!739386 m!691401))

(declare-fun m!691403 () Bool)

(assert (=> b!739390 m!691403))

(assert (=> b!739383 m!691375))

(assert (=> b!739383 m!691375))

(declare-fun m!691405 () Bool)

(assert (=> b!739383 m!691405))

(declare-fun m!691407 () Bool)

(assert (=> b!739380 m!691407))

(declare-fun m!691409 () Bool)

(assert (=> b!739388 m!691409))

(declare-fun m!691411 () Bool)

(assert (=> b!739388 m!691411))

(assert (=> b!739381 m!691375))

(assert (=> b!739381 m!691375))

(declare-fun m!691413 () Bool)

(assert (=> b!739381 m!691413))

(assert (=> b!739395 m!691375))

(assert (=> b!739395 m!691375))

(declare-fun m!691415 () Bool)

(assert (=> b!739395 m!691415))

(assert (=> b!739395 m!691415))

(assert (=> b!739395 m!691375))

(declare-fun m!691417 () Bool)

(assert (=> b!739395 m!691417))

(assert (=> b!739382 m!691375))

(assert (=> b!739382 m!691375))

(declare-fun m!691419 () Bool)

(assert (=> b!739382 m!691419))

(assert (=> b!739391 m!691375))

(assert (=> b!739391 m!691375))

(assert (=> b!739391 m!691413))

(assert (=> b!739391 m!691375))

(assert (=> b!739391 m!691377))

(declare-fun m!691421 () Bool)

(assert (=> b!739373 m!691421))

(declare-fun m!691423 () Bool)

(assert (=> b!739379 m!691423))

(check-sat (not start!65346) (not b!739395) (not b!739388) (not b!739375) (not b!739384) (not b!739380) (not b!739387) (not b!739386) (not b!739385) (not b!739373) (not b!739383) (not b!739374) (not b!739391) (not b!739390) (not b!739381) (not b!739382) (not b!739394) (not b!739396) (not b!739379) (not b!739378))
(check-sat)
