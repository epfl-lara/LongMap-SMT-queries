; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67900 () Bool)

(assert start!67900)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42820 0))(
  ( (array!42821 (arr!20494 (Array (_ BitVec 32) (_ BitVec 64))) (size!20914 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42820)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!438250 () Bool)

(declare-fun b!788336 () Bool)

(declare-datatypes ((SeekEntryResult!8050 0))(
  ( (MissingZero!8050 (index!34568 (_ BitVec 32))) (Found!8050 (index!34569 (_ BitVec 32))) (Intermediate!8050 (undefined!8862 Bool) (index!34570 (_ BitVec 32)) (x!65665 (_ BitVec 32))) (Undefined!8050) (MissingVacant!8050 (index!34571 (_ BitVec 32))) )
))
(declare-fun lt!351657 () SeekEntryResult!8050)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42820 (_ BitVec 32)) SeekEntryResult!8050)

(assert (=> b!788336 (= e!438250 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20494 a!3186) j!159) a!3186 mask!3328) lt!351657))))

(declare-fun b!788337 () Bool)

(declare-fun res!533808 () Bool)

(declare-fun e!438246 () Bool)

(assert (=> b!788337 (=> (not res!533808) (not e!438246))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!788337 (= res!533808 (and (= (size!20914 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20914 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20914 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!788338 () Bool)

(declare-fun res!533802 () Bool)

(declare-fun e!438254 () Bool)

(assert (=> b!788338 (=> (not res!533802) (not e!438254))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!351658 () array!42820)

(declare-fun lt!351664 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42820 (_ BitVec 32)) SeekEntryResult!8050)

(assert (=> b!788338 (= res!533802 (= (seekEntryOrOpen!0 lt!351664 lt!351658 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351664 lt!351658 mask!3328)))))

(declare-fun b!788340 () Bool)

(declare-datatypes ((Unit!27265 0))(
  ( (Unit!27266) )
))
(declare-fun e!438245 () Unit!27265)

(declare-fun Unit!27267 () Unit!27265)

(assert (=> b!788340 (= e!438245 Unit!27267)))

(assert (=> b!788340 false))

(declare-fun e!438256 () Bool)

(declare-fun lt!351661 () SeekEntryResult!8050)

(declare-fun b!788341 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42820 (_ BitVec 32)) SeekEntryResult!8050)

(assert (=> b!788341 (= e!438256 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20494 a!3186) j!159) a!3186 mask!3328) lt!351661))))

(declare-fun b!788342 () Bool)

(declare-fun res!533801 () Bool)

(declare-fun e!438252 () Bool)

(assert (=> b!788342 (=> (not res!533801) (not e!438252))))

(assert (=> b!788342 (= res!533801 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20494 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!788343 () Bool)

(declare-fun e!438247 () Bool)

(assert (=> b!788343 (= e!438247 e!438252)))

(declare-fun res!533800 () Bool)

(assert (=> b!788343 (=> (not res!533800) (not e!438252))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!788343 (= res!533800 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20494 a!3186) j!159) mask!3328) (select (arr!20494 a!3186) j!159) a!3186 mask!3328) lt!351661))))

(assert (=> b!788343 (= lt!351661 (Intermediate!8050 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!788344 () Bool)

(declare-fun res!533803 () Bool)

(assert (=> b!788344 (=> (not res!533803) (not e!438246))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!788344 (= res!533803 (validKeyInArray!0 k0!2102))))

(declare-fun b!788345 () Bool)

(declare-fun e!438249 () Bool)

(declare-fun e!438255 () Bool)

(assert (=> b!788345 (= e!438249 e!438255)))

(declare-fun res!533794 () Bool)

(assert (=> b!788345 (=> res!533794 e!438255)))

(declare-fun lt!351660 () (_ BitVec 64))

(assert (=> b!788345 (= res!533794 (= lt!351660 lt!351664))))

(assert (=> b!788345 (= lt!351660 (select (store (arr!20494 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!788346 () Bool)

(declare-fun res!533796 () Bool)

(assert (=> b!788346 (=> (not res!533796) (not e!438252))))

(assert (=> b!788346 (= res!533796 e!438256)))

(declare-fun c!87682 () Bool)

(assert (=> b!788346 (= c!87682 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!788347 () Bool)

(declare-fun res!533807 () Bool)

(assert (=> b!788347 (=> (not res!533807) (not e!438246))))

(assert (=> b!788347 (= res!533807 (validKeyInArray!0 (select (arr!20494 a!3186) j!159)))))

(declare-fun b!788348 () Bool)

(assert (=> b!788348 (= e!438255 true)))

(assert (=> b!788348 e!438254))

(declare-fun res!533810 () Bool)

(assert (=> b!788348 (=> (not res!533810) (not e!438254))))

(assert (=> b!788348 (= res!533810 (= lt!351660 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!351653 () Unit!27265)

(assert (=> b!788348 (= lt!351653 e!438245)))

(declare-fun c!87683 () Bool)

(assert (=> b!788348 (= c!87683 (= lt!351660 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!788349 () Bool)

(assert (=> b!788349 (= e!438246 e!438247)))

(declare-fun res!533793 () Bool)

(assert (=> b!788349 (=> (not res!533793) (not e!438247))))

(declare-fun lt!351654 () SeekEntryResult!8050)

(assert (=> b!788349 (= res!533793 (or (= lt!351654 (MissingZero!8050 i!1173)) (= lt!351654 (MissingVacant!8050 i!1173))))))

(assert (=> b!788349 (= lt!351654 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!533799 () Bool)

(assert (=> start!67900 (=> (not res!533799) (not e!438246))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67900 (= res!533799 (validMask!0 mask!3328))))

(assert (=> start!67900 e!438246))

(assert (=> start!67900 true))

(declare-fun array_inv!16353 (array!42820) Bool)

(assert (=> start!67900 (array_inv!16353 a!3186)))

(declare-fun b!788339 () Bool)

(declare-fun e!438253 () Bool)

(declare-fun e!438251 () Bool)

(assert (=> b!788339 (= e!438253 (not e!438251))))

(declare-fun res!533798 () Bool)

(assert (=> b!788339 (=> res!533798 e!438251)))

(declare-fun lt!351656 () SeekEntryResult!8050)

(get-info :version)

(assert (=> b!788339 (= res!533798 (or (not ((_ is Intermediate!8050) lt!351656)) (bvslt x!1131 (x!65665 lt!351656)) (not (= x!1131 (x!65665 lt!351656))) (not (= index!1321 (index!34570 lt!351656)))))))

(assert (=> b!788339 e!438250))

(declare-fun res!533805 () Bool)

(assert (=> b!788339 (=> (not res!533805) (not e!438250))))

(declare-fun lt!351662 () SeekEntryResult!8050)

(assert (=> b!788339 (= res!533805 (= lt!351662 lt!351657))))

(assert (=> b!788339 (= lt!351657 (Found!8050 j!159))))

(assert (=> b!788339 (= lt!351662 (seekEntryOrOpen!0 (select (arr!20494 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42820 (_ BitVec 32)) Bool)

(assert (=> b!788339 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!351659 () Unit!27265)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42820 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27265)

(assert (=> b!788339 (= lt!351659 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!788350 () Bool)

(declare-fun Unit!27268 () Unit!27265)

(assert (=> b!788350 (= e!438245 Unit!27268)))

(declare-fun b!788351 () Bool)

(declare-fun res!533795 () Bool)

(assert (=> b!788351 (=> (not res!533795) (not e!438247))))

(assert (=> b!788351 (= res!533795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!788352 () Bool)

(assert (=> b!788352 (= e!438256 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20494 a!3186) j!159) a!3186 mask!3328) (Found!8050 j!159)))))

(declare-fun b!788353 () Bool)

(declare-fun res!533804 () Bool)

(assert (=> b!788353 (=> (not res!533804) (not e!438247))))

(declare-datatypes ((List!14403 0))(
  ( (Nil!14400) (Cons!14399 (h!15528 (_ BitVec 64)) (t!20710 List!14403)) )
))
(declare-fun arrayNoDuplicates!0 (array!42820 (_ BitVec 32) List!14403) Bool)

(assert (=> b!788353 (= res!533804 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14400))))

(declare-fun b!788354 () Bool)

(declare-fun res!533797 () Bool)

(assert (=> b!788354 (=> (not res!533797) (not e!438247))))

(assert (=> b!788354 (= res!533797 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20914 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20914 a!3186))))))

(declare-fun b!788355 () Bool)

(assert (=> b!788355 (= e!438252 e!438253)))

(declare-fun res!533811 () Bool)

(assert (=> b!788355 (=> (not res!533811) (not e!438253))))

(declare-fun lt!351655 () SeekEntryResult!8050)

(assert (=> b!788355 (= res!533811 (= lt!351655 lt!351656))))

(assert (=> b!788355 (= lt!351656 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351664 lt!351658 mask!3328))))

(assert (=> b!788355 (= lt!351655 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351664 mask!3328) lt!351664 lt!351658 mask!3328))))

(assert (=> b!788355 (= lt!351664 (select (store (arr!20494 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!788355 (= lt!351658 (array!42821 (store (arr!20494 a!3186) i!1173 k0!2102) (size!20914 a!3186)))))

(declare-fun b!788356 () Bool)

(declare-fun res!533806 () Bool)

(assert (=> b!788356 (=> (not res!533806) (not e!438246))))

(declare-fun arrayContainsKey!0 (array!42820 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!788356 (= res!533806 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!788357 () Bool)

(declare-fun lt!351663 () SeekEntryResult!8050)

(assert (=> b!788357 (= e!438254 (= lt!351662 lt!351663))))

(declare-fun b!788358 () Bool)

(assert (=> b!788358 (= e!438251 e!438249)))

(declare-fun res!533809 () Bool)

(assert (=> b!788358 (=> res!533809 e!438249)))

(assert (=> b!788358 (= res!533809 (not (= lt!351663 lt!351657)))))

(assert (=> b!788358 (= lt!351663 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20494 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and start!67900 res!533799) b!788337))

(assert (= (and b!788337 res!533808) b!788347))

(assert (= (and b!788347 res!533807) b!788344))

(assert (= (and b!788344 res!533803) b!788356))

(assert (= (and b!788356 res!533806) b!788349))

(assert (= (and b!788349 res!533793) b!788351))

(assert (= (and b!788351 res!533795) b!788353))

(assert (= (and b!788353 res!533804) b!788354))

(assert (= (and b!788354 res!533797) b!788343))

(assert (= (and b!788343 res!533800) b!788342))

(assert (= (and b!788342 res!533801) b!788346))

(assert (= (and b!788346 c!87682) b!788341))

(assert (= (and b!788346 (not c!87682)) b!788352))

(assert (= (and b!788346 res!533796) b!788355))

(assert (= (and b!788355 res!533811) b!788339))

(assert (= (and b!788339 res!533805) b!788336))

(assert (= (and b!788339 (not res!533798)) b!788358))

(assert (= (and b!788358 (not res!533809)) b!788345))

(assert (= (and b!788345 (not res!533794)) b!788348))

(assert (= (and b!788348 c!87683) b!788340))

(assert (= (and b!788348 (not c!87683)) b!788350))

(assert (= (and b!788348 res!533810) b!788338))

(assert (= (and b!788338 res!533802) b!788357))

(declare-fun m!730271 () Bool)

(assert (=> b!788338 m!730271))

(declare-fun m!730273 () Bool)

(assert (=> b!788338 m!730273))

(declare-fun m!730275 () Bool)

(assert (=> b!788351 m!730275))

(declare-fun m!730277 () Bool)

(assert (=> b!788356 m!730277))

(declare-fun m!730279 () Bool)

(assert (=> b!788349 m!730279))

(declare-fun m!730281 () Bool)

(assert (=> b!788341 m!730281))

(assert (=> b!788341 m!730281))

(declare-fun m!730283 () Bool)

(assert (=> b!788341 m!730283))

(declare-fun m!730285 () Bool)

(assert (=> b!788342 m!730285))

(assert (=> b!788343 m!730281))

(assert (=> b!788343 m!730281))

(declare-fun m!730287 () Bool)

(assert (=> b!788343 m!730287))

(assert (=> b!788343 m!730287))

(assert (=> b!788343 m!730281))

(declare-fun m!730289 () Bool)

(assert (=> b!788343 m!730289))

(assert (=> b!788339 m!730281))

(assert (=> b!788339 m!730281))

(declare-fun m!730291 () Bool)

(assert (=> b!788339 m!730291))

(declare-fun m!730293 () Bool)

(assert (=> b!788339 m!730293))

(declare-fun m!730295 () Bool)

(assert (=> b!788339 m!730295))

(declare-fun m!730297 () Bool)

(assert (=> b!788353 m!730297))

(assert (=> b!788336 m!730281))

(assert (=> b!788336 m!730281))

(declare-fun m!730299 () Bool)

(assert (=> b!788336 m!730299))

(assert (=> b!788358 m!730281))

(assert (=> b!788358 m!730281))

(declare-fun m!730301 () Bool)

(assert (=> b!788358 m!730301))

(declare-fun m!730303 () Bool)

(assert (=> b!788355 m!730303))

(assert (=> b!788355 m!730303))

(declare-fun m!730305 () Bool)

(assert (=> b!788355 m!730305))

(declare-fun m!730307 () Bool)

(assert (=> b!788355 m!730307))

(declare-fun m!730309 () Bool)

(assert (=> b!788355 m!730309))

(declare-fun m!730311 () Bool)

(assert (=> b!788355 m!730311))

(assert (=> b!788345 m!730307))

(declare-fun m!730313 () Bool)

(assert (=> b!788345 m!730313))

(declare-fun m!730315 () Bool)

(assert (=> b!788344 m!730315))

(declare-fun m!730317 () Bool)

(assert (=> start!67900 m!730317))

(declare-fun m!730319 () Bool)

(assert (=> start!67900 m!730319))

(assert (=> b!788352 m!730281))

(assert (=> b!788352 m!730281))

(assert (=> b!788352 m!730301))

(assert (=> b!788347 m!730281))

(assert (=> b!788347 m!730281))

(declare-fun m!730321 () Bool)

(assert (=> b!788347 m!730321))

(check-sat (not b!788336) (not b!788341) (not b!788352) (not b!788339) (not b!788353) (not b!788355) (not b!788351) (not b!788344) (not b!788343) (not b!788338) (not b!788349) (not b!788356) (not b!788347) (not b!788358) (not start!67900))
(check-sat)
