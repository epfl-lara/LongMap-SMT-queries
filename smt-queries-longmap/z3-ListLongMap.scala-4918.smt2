; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67870 () Bool)

(assert start!67870)

(declare-fun b!787301 () Bool)

(declare-fun res!532950 () Bool)

(declare-fun e!437715 () Bool)

(assert (=> b!787301 (=> (not res!532950) (not e!437715))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!787301 (= res!532950 (validKeyInArray!0 k0!2102))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42790 0))(
  ( (array!42791 (arr!20479 (Array (_ BitVec 32) (_ BitVec 64))) (size!20899 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42790)

(declare-fun e!437707 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!787302 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8035 0))(
  ( (MissingZero!8035 (index!34508 (_ BitVec 32))) (Found!8035 (index!34509 (_ BitVec 32))) (Intermediate!8035 (undefined!8847 Bool) (index!34510 (_ BitVec 32)) (x!65610 (_ BitVec 32))) (Undefined!8035) (MissingVacant!8035 (index!34511 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42790 (_ BitVec 32)) SeekEntryResult!8035)

(assert (=> b!787302 (= e!437707 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20479 a!3186) j!159) a!3186 mask!3328) (Found!8035 j!159)))))

(declare-fun res!532938 () Bool)

(assert (=> start!67870 (=> (not res!532938) (not e!437715))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67870 (= res!532938 (validMask!0 mask!3328))))

(assert (=> start!67870 e!437715))

(assert (=> start!67870 true))

(declare-fun array_inv!16338 (array!42790) Bool)

(assert (=> start!67870 (array_inv!16338 a!3186)))

(declare-fun b!787303 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun lt!351113 () SeekEntryResult!8035)

(declare-fun e!437709 () Bool)

(assert (=> b!787303 (= e!437709 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20479 a!3186) j!159) a!3186 mask!3328) lt!351113))))

(declare-fun lt!351117 () SeekEntryResult!8035)

(declare-fun b!787304 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42790 (_ BitVec 32)) SeekEntryResult!8035)

(assert (=> b!787304 (= e!437707 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20479 a!3186) j!159) a!3186 mask!3328) lt!351117))))

(declare-fun b!787305 () Bool)

(declare-fun res!532954 () Bool)

(declare-fun e!437711 () Bool)

(assert (=> b!787305 (=> (not res!532954) (not e!437711))))

(assert (=> b!787305 (= res!532954 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20899 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20899 a!3186))))))

(declare-fun b!787306 () Bool)

(declare-datatypes ((Unit!27205 0))(
  ( (Unit!27206) )
))
(declare-fun e!437712 () Unit!27205)

(declare-fun Unit!27207 () Unit!27205)

(assert (=> b!787306 (= e!437712 Unit!27207)))

(declare-fun b!787307 () Bool)

(declare-fun e!437705 () Bool)

(declare-fun e!437713 () Bool)

(assert (=> b!787307 (= e!437705 e!437713)))

(declare-fun res!532948 () Bool)

(assert (=> b!787307 (=> res!532948 e!437713)))

(declare-fun lt!351118 () SeekEntryResult!8035)

(assert (=> b!787307 (= res!532948 (not (= lt!351118 lt!351113)))))

(assert (=> b!787307 (= lt!351118 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20479 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!787308 () Bool)

(declare-fun res!532941 () Bool)

(declare-fun e!437708 () Bool)

(assert (=> b!787308 (=> (not res!532941) (not e!437708))))

(assert (=> b!787308 (= res!532941 e!437707)))

(declare-fun c!87593 () Bool)

(assert (=> b!787308 (= c!87593 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!787309 () Bool)

(assert (=> b!787309 (= e!437715 e!437711)))

(declare-fun res!532951 () Bool)

(assert (=> b!787309 (=> (not res!532951) (not e!437711))))

(declare-fun lt!351124 () SeekEntryResult!8035)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!787309 (= res!532951 (or (= lt!351124 (MissingZero!8035 i!1173)) (= lt!351124 (MissingVacant!8035 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42790 (_ BitVec 32)) SeekEntryResult!8035)

(assert (=> b!787309 (= lt!351124 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!787310 () Bool)

(declare-fun e!437706 () Bool)

(assert (=> b!787310 (= e!437708 e!437706)))

(declare-fun res!532953 () Bool)

(assert (=> b!787310 (=> (not res!532953) (not e!437706))))

(declare-fun lt!351119 () SeekEntryResult!8035)

(declare-fun lt!351114 () SeekEntryResult!8035)

(assert (=> b!787310 (= res!532953 (= lt!351119 lt!351114))))

(declare-fun lt!351120 () (_ BitVec 64))

(declare-fun lt!351115 () array!42790)

(assert (=> b!787310 (= lt!351114 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351120 lt!351115 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!787310 (= lt!351119 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351120 mask!3328) lt!351120 lt!351115 mask!3328))))

(assert (=> b!787310 (= lt!351120 (select (store (arr!20479 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!787310 (= lt!351115 (array!42791 (store (arr!20479 a!3186) i!1173 k0!2102) (size!20899 a!3186)))))

(declare-fun b!787311 () Bool)

(declare-fun res!532947 () Bool)

(assert (=> b!787311 (=> (not res!532947) (not e!437715))))

(declare-fun arrayContainsKey!0 (array!42790 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!787311 (= res!532947 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!787312 () Bool)

(declare-fun e!437716 () Bool)

(declare-fun lt!351116 () SeekEntryResult!8035)

(assert (=> b!787312 (= e!437716 (= lt!351116 lt!351118))))

(declare-fun b!787313 () Bool)

(assert (=> b!787313 (= e!437711 e!437708)))

(declare-fun res!532939 () Bool)

(assert (=> b!787313 (=> (not res!532939) (not e!437708))))

(assert (=> b!787313 (= res!532939 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20479 a!3186) j!159) mask!3328) (select (arr!20479 a!3186) j!159) a!3186 mask!3328) lt!351117))))

(assert (=> b!787313 (= lt!351117 (Intermediate!8035 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!787314 () Bool)

(declare-fun e!437714 () Bool)

(assert (=> b!787314 (= e!437714 true)))

(assert (=> b!787314 e!437716))

(declare-fun res!532952 () Bool)

(assert (=> b!787314 (=> (not res!532952) (not e!437716))))

(declare-fun lt!351121 () (_ BitVec 64))

(assert (=> b!787314 (= res!532952 (= lt!351121 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!351122 () Unit!27205)

(assert (=> b!787314 (= lt!351122 e!437712)))

(declare-fun c!87592 () Bool)

(assert (=> b!787314 (= c!87592 (= lt!351121 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!787315 () Bool)

(declare-fun Unit!27208 () Unit!27205)

(assert (=> b!787315 (= e!437712 Unit!27208)))

(assert (=> b!787315 false))

(declare-fun b!787316 () Bool)

(declare-fun res!532942 () Bool)

(assert (=> b!787316 (=> (not res!532942) (not e!437711))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42790 (_ BitVec 32)) Bool)

(assert (=> b!787316 (= res!532942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!787317 () Bool)

(assert (=> b!787317 (= e!437706 (not e!437705))))

(declare-fun res!532940 () Bool)

(assert (=> b!787317 (=> res!532940 e!437705)))

(get-info :version)

(assert (=> b!787317 (= res!532940 (or (not ((_ is Intermediate!8035) lt!351114)) (bvslt x!1131 (x!65610 lt!351114)) (not (= x!1131 (x!65610 lt!351114))) (not (= index!1321 (index!34510 lt!351114)))))))

(assert (=> b!787317 e!437709))

(declare-fun res!532955 () Bool)

(assert (=> b!787317 (=> (not res!532955) (not e!437709))))

(assert (=> b!787317 (= res!532955 (= lt!351116 lt!351113))))

(assert (=> b!787317 (= lt!351113 (Found!8035 j!159))))

(assert (=> b!787317 (= lt!351116 (seekEntryOrOpen!0 (select (arr!20479 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!787317 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!351123 () Unit!27205)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42790 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27205)

(assert (=> b!787317 (= lt!351123 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!787318 () Bool)

(assert (=> b!787318 (= e!437713 e!437714)))

(declare-fun res!532956 () Bool)

(assert (=> b!787318 (=> res!532956 e!437714)))

(assert (=> b!787318 (= res!532956 (= lt!351121 lt!351120))))

(assert (=> b!787318 (= lt!351121 (select (store (arr!20479 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!787319 () Bool)

(declare-fun res!532944 () Bool)

(assert (=> b!787319 (=> (not res!532944) (not e!437715))))

(assert (=> b!787319 (= res!532944 (and (= (size!20899 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20899 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20899 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!787320 () Bool)

(declare-fun res!532945 () Bool)

(assert (=> b!787320 (=> (not res!532945) (not e!437708))))

(assert (=> b!787320 (= res!532945 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20479 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!787321 () Bool)

(declare-fun res!532943 () Bool)

(assert (=> b!787321 (=> (not res!532943) (not e!437716))))

(assert (=> b!787321 (= res!532943 (= (seekEntryOrOpen!0 lt!351120 lt!351115 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351120 lt!351115 mask!3328)))))

(declare-fun b!787322 () Bool)

(declare-fun res!532946 () Bool)

(assert (=> b!787322 (=> (not res!532946) (not e!437711))))

(declare-datatypes ((List!14388 0))(
  ( (Nil!14385) (Cons!14384 (h!15513 (_ BitVec 64)) (t!20695 List!14388)) )
))
(declare-fun arrayNoDuplicates!0 (array!42790 (_ BitVec 32) List!14388) Bool)

(assert (=> b!787322 (= res!532946 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14385))))

(declare-fun b!787323 () Bool)

(declare-fun res!532949 () Bool)

(assert (=> b!787323 (=> (not res!532949) (not e!437715))))

(assert (=> b!787323 (= res!532949 (validKeyInArray!0 (select (arr!20479 a!3186) j!159)))))

(assert (= (and start!67870 res!532938) b!787319))

(assert (= (and b!787319 res!532944) b!787323))

(assert (= (and b!787323 res!532949) b!787301))

(assert (= (and b!787301 res!532950) b!787311))

(assert (= (and b!787311 res!532947) b!787309))

(assert (= (and b!787309 res!532951) b!787316))

(assert (= (and b!787316 res!532942) b!787322))

(assert (= (and b!787322 res!532946) b!787305))

(assert (= (and b!787305 res!532954) b!787313))

(assert (= (and b!787313 res!532939) b!787320))

(assert (= (and b!787320 res!532945) b!787308))

(assert (= (and b!787308 c!87593) b!787304))

(assert (= (and b!787308 (not c!87593)) b!787302))

(assert (= (and b!787308 res!532941) b!787310))

(assert (= (and b!787310 res!532953) b!787317))

(assert (= (and b!787317 res!532955) b!787303))

(assert (= (and b!787317 (not res!532940)) b!787307))

(assert (= (and b!787307 (not res!532948)) b!787318))

(assert (= (and b!787318 (not res!532956)) b!787314))

(assert (= (and b!787314 c!87592) b!787315))

(assert (= (and b!787314 (not c!87592)) b!787306))

(assert (= (and b!787314 res!532952) b!787321))

(assert (= (and b!787321 res!532943) b!787312))

(declare-fun m!729491 () Bool)

(assert (=> b!787307 m!729491))

(assert (=> b!787307 m!729491))

(declare-fun m!729493 () Bool)

(assert (=> b!787307 m!729493))

(declare-fun m!729495 () Bool)

(assert (=> b!787316 m!729495))

(assert (=> b!787304 m!729491))

(assert (=> b!787304 m!729491))

(declare-fun m!729497 () Bool)

(assert (=> b!787304 m!729497))

(declare-fun m!729499 () Bool)

(assert (=> b!787301 m!729499))

(assert (=> b!787303 m!729491))

(assert (=> b!787303 m!729491))

(declare-fun m!729501 () Bool)

(assert (=> b!787303 m!729501))

(declare-fun m!729503 () Bool)

(assert (=> b!787318 m!729503))

(declare-fun m!729505 () Bool)

(assert (=> b!787318 m!729505))

(assert (=> b!787317 m!729491))

(assert (=> b!787317 m!729491))

(declare-fun m!729507 () Bool)

(assert (=> b!787317 m!729507))

(declare-fun m!729509 () Bool)

(assert (=> b!787317 m!729509))

(declare-fun m!729511 () Bool)

(assert (=> b!787317 m!729511))

(declare-fun m!729513 () Bool)

(assert (=> b!787310 m!729513))

(declare-fun m!729515 () Bool)

(assert (=> b!787310 m!729515))

(assert (=> b!787310 m!729513))

(declare-fun m!729517 () Bool)

(assert (=> b!787310 m!729517))

(assert (=> b!787310 m!729503))

(declare-fun m!729519 () Bool)

(assert (=> b!787310 m!729519))

(assert (=> b!787302 m!729491))

(assert (=> b!787302 m!729491))

(assert (=> b!787302 m!729493))

(declare-fun m!729521 () Bool)

(assert (=> b!787309 m!729521))

(declare-fun m!729523 () Bool)

(assert (=> start!67870 m!729523))

(declare-fun m!729525 () Bool)

(assert (=> start!67870 m!729525))

(declare-fun m!729527 () Bool)

(assert (=> b!787311 m!729527))

(declare-fun m!729529 () Bool)

(assert (=> b!787321 m!729529))

(declare-fun m!729531 () Bool)

(assert (=> b!787321 m!729531))

(assert (=> b!787313 m!729491))

(assert (=> b!787313 m!729491))

(declare-fun m!729533 () Bool)

(assert (=> b!787313 m!729533))

(assert (=> b!787313 m!729533))

(assert (=> b!787313 m!729491))

(declare-fun m!729535 () Bool)

(assert (=> b!787313 m!729535))

(declare-fun m!729537 () Bool)

(assert (=> b!787320 m!729537))

(declare-fun m!729539 () Bool)

(assert (=> b!787322 m!729539))

(assert (=> b!787323 m!729491))

(assert (=> b!787323 m!729491))

(declare-fun m!729541 () Bool)

(assert (=> b!787323 m!729541))

(check-sat (not b!787302) (not b!787304) (not b!787322) (not b!787317) (not b!787316) (not b!787303) (not b!787323) (not start!67870) (not b!787313) (not b!787310) (not b!787311) (not b!787301) (not b!787321) (not b!787309) (not b!787307))
(check-sat)
