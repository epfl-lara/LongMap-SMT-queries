; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65856 () Bool)

(assert start!65856)

(declare-fun b!758918 () Bool)

(declare-datatypes ((Unit!26292 0))(
  ( (Unit!26293) )
))
(declare-fun e!423107 () Unit!26292)

(declare-fun Unit!26294 () Unit!26292)

(assert (=> b!758918 (= e!423107 Unit!26294)))

(assert (=> b!758918 false))

(declare-fun b!758919 () Bool)

(declare-fun res!513498 () Bool)

(declare-fun e!423117 () Bool)

(assert (=> b!758919 (=> (not res!513498) (not e!423117))))

(declare-fun e!423110 () Bool)

(assert (=> b!758919 (= res!513498 e!423110)))

(declare-fun c!83098 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!758919 (= c!83098 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!758921 () Bool)

(declare-fun e!423111 () Bool)

(declare-fun e!423108 () Bool)

(assert (=> b!758921 (= e!423111 e!423108)))

(declare-fun res!513493 () Bool)

(assert (=> b!758921 (=> res!513493 e!423108)))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!758921 (= res!513493 (bvslt mask!3328 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!7728 0))(
  ( (MissingZero!7728 (index!33280 (_ BitVec 32))) (Found!7728 (index!33281 (_ BitVec 32))) (Intermediate!7728 (undefined!8540 Bool) (index!33282 (_ BitVec 32)) (x!64166 (_ BitVec 32))) (Undefined!7728) (MissingVacant!7728 (index!33283 (_ BitVec 32))) )
))
(declare-fun lt!338193 () SeekEntryResult!7728)

(declare-fun lt!338200 () SeekEntryResult!7728)

(assert (=> b!758921 (= lt!338193 lt!338200)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42029 0))(
  ( (array!42030 (arr!20128 (Array (_ BitVec 32) (_ BitVec 64))) (size!20549 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42029)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun lt!338202 () Unit!26292)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42029 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26292)

(assert (=> b!758921 (= lt!338202 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k0!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun b!758922 () Bool)

(declare-fun e!423118 () Bool)

(assert (=> b!758922 (= e!423118 e!423117)))

(declare-fun res!513486 () Bool)

(assert (=> b!758922 (=> (not res!513486) (not e!423117))))

(declare-fun lt!338190 () SeekEntryResult!7728)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42029 (_ BitVec 32)) SeekEntryResult!7728)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!758922 (= res!513486 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20128 a!3186) j!159) mask!3328) (select (arr!20128 a!3186) j!159) a!3186 mask!3328) lt!338190))))

(assert (=> b!758922 (= lt!338190 (Intermediate!7728 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!758923 () Bool)

(declare-fun e!423116 () Bool)

(declare-fun e!423119 () Bool)

(assert (=> b!758923 (= e!423116 (not e!423119))))

(declare-fun res!513496 () Bool)

(assert (=> b!758923 (=> res!513496 e!423119)))

(declare-fun lt!338198 () SeekEntryResult!7728)

(get-info :version)

(assert (=> b!758923 (= res!513496 (or (not ((_ is Intermediate!7728) lt!338198)) (bvslt x!1131 (x!64166 lt!338198)) (not (= x!1131 (x!64166 lt!338198))) (not (= index!1321 (index!33282 lt!338198)))))))

(declare-fun e!423113 () Bool)

(assert (=> b!758923 e!423113))

(declare-fun res!513485 () Bool)

(assert (=> b!758923 (=> (not res!513485) (not e!423113))))

(declare-fun lt!338196 () SeekEntryResult!7728)

(declare-fun lt!338191 () SeekEntryResult!7728)

(assert (=> b!758923 (= res!513485 (= lt!338196 lt!338191))))

(assert (=> b!758923 (= lt!338191 (Found!7728 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42029 (_ BitVec 32)) SeekEntryResult!7728)

(assert (=> b!758923 (= lt!338196 (seekEntryOrOpen!0 (select (arr!20128 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42029 (_ BitVec 32)) Bool)

(assert (=> b!758923 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!338204 () Unit!26292)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42029 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26292)

(assert (=> b!758923 (= lt!338204 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!758924 () Bool)

(declare-fun res!513488 () Bool)

(assert (=> b!758924 (=> (not res!513488) (not e!423118))))

(declare-datatypes ((List!14130 0))(
  ( (Nil!14127) (Cons!14126 (h!15198 (_ BitVec 64)) (t!20445 List!14130)) )
))
(declare-fun arrayNoDuplicates!0 (array!42029 (_ BitVec 32) List!14130) Bool)

(assert (=> b!758924 (= res!513488 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14127))))

(declare-fun b!758925 () Bool)

(assert (=> b!758925 (= e!423110 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20128 a!3186) j!159) a!3186 mask!3328) lt!338190))))

(declare-fun b!758926 () Bool)

(declare-fun res!513497 () Bool)

(declare-fun e!423114 () Bool)

(assert (=> b!758926 (=> (not res!513497) (not e!423114))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!758926 (= res!513497 (validKeyInArray!0 (select (arr!20128 a!3186) j!159)))))

(declare-fun b!758927 () Bool)

(assert (=> b!758927 (= e!423114 e!423118)))

(declare-fun res!513487 () Bool)

(assert (=> b!758927 (=> (not res!513487) (not e!423118))))

(declare-fun lt!338194 () SeekEntryResult!7728)

(assert (=> b!758927 (= res!513487 (or (= lt!338194 (MissingZero!7728 i!1173)) (= lt!338194 (MissingVacant!7728 i!1173))))))

(assert (=> b!758927 (= lt!338194 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!758928 () Bool)

(declare-fun e!423115 () Bool)

(assert (=> b!758928 (= e!423115 e!423111)))

(declare-fun res!513491 () Bool)

(assert (=> b!758928 (=> res!513491 e!423111)))

(assert (=> b!758928 (= res!513491 (or (not (= (select (arr!20128 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-fun lt!338203 () SeekEntryResult!7728)

(assert (=> b!758928 (and (= lt!338203 lt!338193) (= lt!338196 lt!338200))))

(declare-fun lt!338192 () (_ BitVec 64))

(declare-fun lt!338199 () array!42029)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42029 (_ BitVec 32)) SeekEntryResult!7728)

(assert (=> b!758928 (= lt!338193 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!338192 lt!338199 mask!3328))))

(assert (=> b!758928 (= lt!338203 (seekEntryOrOpen!0 lt!338192 lt!338199 mask!3328))))

(declare-fun lt!338201 () (_ BitVec 64))

(assert (=> b!758928 (= lt!338201 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!338195 () Unit!26292)

(assert (=> b!758928 (= lt!338195 e!423107)))

(declare-fun c!83097 () Bool)

(assert (=> b!758928 (= c!83097 (= lt!338201 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!758929 () Bool)

(declare-fun res!513490 () Bool)

(assert (=> b!758929 (=> (not res!513490) (not e!423114))))

(assert (=> b!758929 (= res!513490 (validKeyInArray!0 k0!2102))))

(declare-fun res!513499 () Bool)

(assert (=> start!65856 (=> (not res!513499) (not e!423114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65856 (= res!513499 (validMask!0 mask!3328))))

(assert (=> start!65856 e!423114))

(assert (=> start!65856 true))

(declare-fun array_inv!15924 (array!42029) Bool)

(assert (=> start!65856 (array_inv!15924 a!3186)))

(declare-fun b!758920 () Bool)

(assert (=> b!758920 (= e!423117 e!423116)))

(declare-fun res!513500 () Bool)

(assert (=> b!758920 (=> (not res!513500) (not e!423116))))

(declare-fun lt!338197 () SeekEntryResult!7728)

(assert (=> b!758920 (= res!513500 (= lt!338197 lt!338198))))

(assert (=> b!758920 (= lt!338198 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338192 lt!338199 mask!3328))))

(assert (=> b!758920 (= lt!338197 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338192 mask!3328) lt!338192 lt!338199 mask!3328))))

(assert (=> b!758920 (= lt!338192 (select (store (arr!20128 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!758920 (= lt!338199 (array!42030 (store (arr!20128 a!3186) i!1173 k0!2102) (size!20549 a!3186)))))

(declare-fun b!758930 () Bool)

(declare-fun res!513492 () Bool)

(assert (=> b!758930 (=> (not res!513492) (not e!423118))))

(assert (=> b!758930 (= res!513492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!758931 () Bool)

(assert (=> b!758931 (= e!423113 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20128 a!3186) j!159) a!3186 mask!3328) lt!338191))))

(declare-fun b!758932 () Bool)

(assert (=> b!758932 (= e!423108 (validKeyInArray!0 lt!338192))))

(declare-fun b!758933 () Bool)

(declare-fun res!513501 () Bool)

(assert (=> b!758933 (=> (not res!513501) (not e!423118))))

(assert (=> b!758933 (= res!513501 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20549 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20549 a!3186))))))

(declare-fun b!758934 () Bool)

(declare-fun e!423109 () Bool)

(assert (=> b!758934 (= e!423109 e!423115)))

(declare-fun res!513503 () Bool)

(assert (=> b!758934 (=> res!513503 e!423115)))

(assert (=> b!758934 (= res!513503 (= lt!338201 lt!338192))))

(assert (=> b!758934 (= lt!338201 (select (store (arr!20128 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!758935 () Bool)

(declare-fun res!513489 () Bool)

(assert (=> b!758935 (=> (not res!513489) (not e!423114))))

(assert (=> b!758935 (= res!513489 (and (= (size!20549 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20549 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20549 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!758936 () Bool)

(declare-fun res!513495 () Bool)

(assert (=> b!758936 (=> (not res!513495) (not e!423114))))

(declare-fun arrayContainsKey!0 (array!42029 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!758936 (= res!513495 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!758937 () Bool)

(assert (=> b!758937 (= e!423110 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20128 a!3186) j!159) a!3186 mask!3328) (Found!7728 j!159)))))

(declare-fun b!758938 () Bool)

(assert (=> b!758938 (= e!423119 e!423109)))

(declare-fun res!513502 () Bool)

(assert (=> b!758938 (=> res!513502 e!423109)))

(assert (=> b!758938 (= res!513502 (not (= lt!338200 lt!338191)))))

(assert (=> b!758938 (= lt!338200 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20128 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!758939 () Bool)

(declare-fun Unit!26295 () Unit!26292)

(assert (=> b!758939 (= e!423107 Unit!26295)))

(declare-fun b!758940 () Bool)

(declare-fun res!513494 () Bool)

(assert (=> b!758940 (=> (not res!513494) (not e!423117))))

(assert (=> b!758940 (= res!513494 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20128 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!65856 res!513499) b!758935))

(assert (= (and b!758935 res!513489) b!758926))

(assert (= (and b!758926 res!513497) b!758929))

(assert (= (and b!758929 res!513490) b!758936))

(assert (= (and b!758936 res!513495) b!758927))

(assert (= (and b!758927 res!513487) b!758930))

(assert (= (and b!758930 res!513492) b!758924))

(assert (= (and b!758924 res!513488) b!758933))

(assert (= (and b!758933 res!513501) b!758922))

(assert (= (and b!758922 res!513486) b!758940))

(assert (= (and b!758940 res!513494) b!758919))

(assert (= (and b!758919 c!83098) b!758925))

(assert (= (and b!758919 (not c!83098)) b!758937))

(assert (= (and b!758919 res!513498) b!758920))

(assert (= (and b!758920 res!513500) b!758923))

(assert (= (and b!758923 res!513485) b!758931))

(assert (= (and b!758923 (not res!513496)) b!758938))

(assert (= (and b!758938 (not res!513502)) b!758934))

(assert (= (and b!758934 (not res!513503)) b!758928))

(assert (= (and b!758928 c!83097) b!758918))

(assert (= (and b!758928 (not c!83097)) b!758939))

(assert (= (and b!758928 (not res!513491)) b!758921))

(assert (= (and b!758921 (not res!513493)) b!758932))

(declare-fun m!706325 () Bool)

(assert (=> b!758934 m!706325))

(declare-fun m!706327 () Bool)

(assert (=> b!758934 m!706327))

(declare-fun m!706329 () Bool)

(assert (=> b!758937 m!706329))

(assert (=> b!758937 m!706329))

(declare-fun m!706331 () Bool)

(assert (=> b!758937 m!706331))

(declare-fun m!706333 () Bool)

(assert (=> b!758940 m!706333))

(declare-fun m!706335 () Bool)

(assert (=> b!758930 m!706335))

(declare-fun m!706337 () Bool)

(assert (=> b!758929 m!706337))

(assert (=> b!758931 m!706329))

(assert (=> b!758931 m!706329))

(declare-fun m!706339 () Bool)

(assert (=> b!758931 m!706339))

(declare-fun m!706341 () Bool)

(assert (=> b!758928 m!706341))

(declare-fun m!706343 () Bool)

(assert (=> b!758928 m!706343))

(declare-fun m!706345 () Bool)

(assert (=> b!758928 m!706345))

(assert (=> b!758926 m!706329))

(assert (=> b!758926 m!706329))

(declare-fun m!706347 () Bool)

(assert (=> b!758926 m!706347))

(assert (=> b!758922 m!706329))

(assert (=> b!758922 m!706329))

(declare-fun m!706349 () Bool)

(assert (=> b!758922 m!706349))

(assert (=> b!758922 m!706349))

(assert (=> b!758922 m!706329))

(declare-fun m!706351 () Bool)

(assert (=> b!758922 m!706351))

(declare-fun m!706353 () Bool)

(assert (=> b!758936 m!706353))

(assert (=> b!758920 m!706325))

(declare-fun m!706355 () Bool)

(assert (=> b!758920 m!706355))

(declare-fun m!706357 () Bool)

(assert (=> b!758920 m!706357))

(assert (=> b!758920 m!706357))

(declare-fun m!706359 () Bool)

(assert (=> b!758920 m!706359))

(declare-fun m!706361 () Bool)

(assert (=> b!758920 m!706361))

(declare-fun m!706363 () Bool)

(assert (=> b!758924 m!706363))

(assert (=> b!758925 m!706329))

(assert (=> b!758925 m!706329))

(declare-fun m!706365 () Bool)

(assert (=> b!758925 m!706365))

(assert (=> b!758923 m!706329))

(assert (=> b!758923 m!706329))

(declare-fun m!706367 () Bool)

(assert (=> b!758923 m!706367))

(declare-fun m!706369 () Bool)

(assert (=> b!758923 m!706369))

(declare-fun m!706371 () Bool)

(assert (=> b!758923 m!706371))

(declare-fun m!706373 () Bool)

(assert (=> b!758932 m!706373))

(declare-fun m!706375 () Bool)

(assert (=> b!758927 m!706375))

(declare-fun m!706377 () Bool)

(assert (=> start!65856 m!706377))

(declare-fun m!706379 () Bool)

(assert (=> start!65856 m!706379))

(declare-fun m!706381 () Bool)

(assert (=> b!758921 m!706381))

(assert (=> b!758938 m!706329))

(assert (=> b!758938 m!706329))

(assert (=> b!758938 m!706331))

(check-sat (not b!758921) (not b!758930) (not b!758931) (not b!758929) (not start!65856) (not b!758932) (not b!758925) (not b!758923) (not b!758928) (not b!758938) (not b!758937) (not b!758926) (not b!758922) (not b!758927) (not b!758936) (not b!758920) (not b!758924))
(check-sat)
