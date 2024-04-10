; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65512 () Bool)

(assert start!65512)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41685 0))(
  ( (array!41686 (arr!19956 (Array (_ BitVec 32) (_ BitVec 64))) (size!20377 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41685)

(declare-datatypes ((SeekEntryResult!7556 0))(
  ( (MissingZero!7556 (index!32592 (_ BitVec 32))) (Found!7556 (index!32593 (_ BitVec 32))) (Intermediate!7556 (undefined!8368 Bool) (index!32594 (_ BitVec 32)) (x!63538 (_ BitVec 32))) (Undefined!7556) (MissingVacant!7556 (index!32595 (_ BitVec 32))) )
))
(declare-fun lt!332195 () SeekEntryResult!7556)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!747343 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!417269 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41685 (_ BitVec 32)) SeekEntryResult!7556)

(assert (=> b!747343 (= e!417269 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19956 a!3186) j!159) a!3186 mask!3328) lt!332195))))

(declare-fun b!747344 () Bool)

(declare-fun res!503975 () Bool)

(declare-fun e!417270 () Bool)

(assert (=> b!747344 (=> (not res!503975) (not e!417270))))

(declare-fun e!417265 () Bool)

(assert (=> b!747344 (= res!503975 e!417265)))

(declare-fun c!82066 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!747344 (= c!82066 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!747345 () Bool)

(declare-fun res!503982 () Bool)

(declare-fun e!417271 () Bool)

(assert (=> b!747345 (=> (not res!503982) (not e!417271))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!747345 (= res!503982 (validKeyInArray!0 k!2102))))

(declare-fun b!747346 () Bool)

(declare-fun e!417267 () Bool)

(declare-fun e!417272 () Bool)

(assert (=> b!747346 (= e!417267 (not e!417272))))

(declare-fun res!503986 () Bool)

(assert (=> b!747346 (=> res!503986 e!417272)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!332190 () SeekEntryResult!7556)

(assert (=> b!747346 (= res!503986 (or (not (is-Intermediate!7556 lt!332190)) (bvslt x!1131 (x!63538 lt!332190)) (not (= x!1131 (x!63538 lt!332190))) (not (= index!1321 (index!32594 lt!332190)))))))

(assert (=> b!747346 e!417269))

(declare-fun res!503977 () Bool)

(assert (=> b!747346 (=> (not res!503977) (not e!417269))))

(declare-fun lt!332192 () SeekEntryResult!7556)

(assert (=> b!747346 (= res!503977 (= lt!332192 lt!332195))))

(assert (=> b!747346 (= lt!332195 (Found!7556 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41685 (_ BitVec 32)) SeekEntryResult!7556)

(assert (=> b!747346 (= lt!332192 (seekEntryOrOpen!0 (select (arr!19956 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41685 (_ BitVec 32)) Bool)

(assert (=> b!747346 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25604 0))(
  ( (Unit!25605) )
))
(declare-fun lt!332189 () Unit!25604)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41685 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25604)

(assert (=> b!747346 (= lt!332189 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!747347 () Bool)

(declare-fun res!503988 () Bool)

(assert (=> b!747347 (=> res!503988 e!417272)))

(declare-fun lt!332187 () (_ BitVec 64))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!747347 (= res!503988 (= (select (store (arr!19956 a!3186) i!1173 k!2102) index!1321) lt!332187))))

(declare-fun b!747348 () Bool)

(declare-fun res!503974 () Bool)

(declare-fun e!417268 () Bool)

(assert (=> b!747348 (=> (not res!503974) (not e!417268))))

(assert (=> b!747348 (= res!503974 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20377 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20377 a!3186))))))

(declare-fun b!747350 () Bool)

(declare-fun res!503987 () Bool)

(assert (=> b!747350 (=> (not res!503987) (not e!417270))))

(assert (=> b!747350 (= res!503987 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19956 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!747351 () Bool)

(declare-fun res!503989 () Bool)

(assert (=> b!747351 (=> (not res!503989) (not e!417271))))

(assert (=> b!747351 (= res!503989 (and (= (size!20377 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20377 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20377 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!747352 () Bool)

(assert (=> b!747352 (= e!417265 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19956 a!3186) j!159) a!3186 mask!3328) (Found!7556 j!159)))))

(declare-fun b!747353 () Bool)

(declare-fun res!503981 () Bool)

(assert (=> b!747353 (=> (not res!503981) (not e!417271))))

(assert (=> b!747353 (= res!503981 (validKeyInArray!0 (select (arr!19956 a!3186) j!159)))))

(declare-fun b!747354 () Bool)

(assert (=> b!747354 (= e!417271 e!417268)))

(declare-fun res!503985 () Bool)

(assert (=> b!747354 (=> (not res!503985) (not e!417268))))

(declare-fun lt!332188 () SeekEntryResult!7556)

(assert (=> b!747354 (= res!503985 (or (= lt!332188 (MissingZero!7556 i!1173)) (= lt!332188 (MissingVacant!7556 i!1173))))))

(assert (=> b!747354 (= lt!332188 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!747355 () Bool)

(declare-fun e!417264 () Unit!25604)

(declare-fun Unit!25606 () Unit!25604)

(assert (=> b!747355 (= e!417264 Unit!25606)))

(assert (=> b!747355 false))

(declare-fun b!747356 () Bool)

(declare-fun Unit!25607 () Unit!25604)

(assert (=> b!747356 (= e!417264 Unit!25607)))

(declare-fun b!747357 () Bool)

(declare-fun res!503978 () Bool)

(assert (=> b!747357 (=> (not res!503978) (not e!417268))))

(declare-datatypes ((List!13958 0))(
  ( (Nil!13955) (Cons!13954 (h!15026 (_ BitVec 64)) (t!20273 List!13958)) )
))
(declare-fun arrayNoDuplicates!0 (array!41685 (_ BitVec 32) List!13958) Bool)

(assert (=> b!747357 (= res!503978 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13955))))

(declare-fun res!503983 () Bool)

(assert (=> start!65512 (=> (not res!503983) (not e!417271))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65512 (= res!503983 (validMask!0 mask!3328))))

(assert (=> start!65512 e!417271))

(assert (=> start!65512 true))

(declare-fun array_inv!15752 (array!41685) Bool)

(assert (=> start!65512 (array_inv!15752 a!3186)))

(declare-fun b!747349 () Bool)

(assert (=> b!747349 (= e!417270 e!417267)))

(declare-fun res!503980 () Bool)

(assert (=> b!747349 (=> (not res!503980) (not e!417267))))

(declare-fun lt!332191 () SeekEntryResult!7556)

(assert (=> b!747349 (= res!503980 (= lt!332191 lt!332190))))

(declare-fun lt!332193 () array!41685)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41685 (_ BitVec 32)) SeekEntryResult!7556)

(assert (=> b!747349 (= lt!332190 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332187 lt!332193 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!747349 (= lt!332191 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332187 mask!3328) lt!332187 lt!332193 mask!3328))))

(assert (=> b!747349 (= lt!332187 (select (store (arr!19956 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!747349 (= lt!332193 (array!41686 (store (arr!19956 a!3186) i!1173 k!2102) (size!20377 a!3186)))))

(declare-fun b!747358 () Bool)

(assert (=> b!747358 (= e!417268 e!417270)))

(declare-fun res!503990 () Bool)

(assert (=> b!747358 (=> (not res!503990) (not e!417270))))

(declare-fun lt!332186 () SeekEntryResult!7556)

(assert (=> b!747358 (= res!503990 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19956 a!3186) j!159) mask!3328) (select (arr!19956 a!3186) j!159) a!3186 mask!3328) lt!332186))))

(assert (=> b!747358 (= lt!332186 (Intermediate!7556 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!747359 () Bool)

(declare-fun res!503979 () Bool)

(assert (=> b!747359 (=> res!503979 e!417272)))

(assert (=> b!747359 (= res!503979 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19956 a!3186) j!159) a!3186 mask!3328) lt!332195)))))

(declare-fun b!747360 () Bool)

(assert (=> b!747360 (= e!417272 true)))

(assert (=> b!747360 (= (select (store (arr!19956 a!3186) i!1173 k!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332194 () Unit!25604)

(assert (=> b!747360 (= lt!332194 e!417264)))

(declare-fun c!82065 () Bool)

(assert (=> b!747360 (= c!82065 (= (select (store (arr!19956 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!747361 () Bool)

(declare-fun res!503984 () Bool)

(assert (=> b!747361 (=> (not res!503984) (not e!417268))))

(assert (=> b!747361 (= res!503984 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!747362 () Bool)

(declare-fun res!503976 () Bool)

(assert (=> b!747362 (=> (not res!503976) (not e!417271))))

(declare-fun arrayContainsKey!0 (array!41685 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!747362 (= res!503976 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!747363 () Bool)

(assert (=> b!747363 (= e!417265 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19956 a!3186) j!159) a!3186 mask!3328) lt!332186))))

(assert (= (and start!65512 res!503983) b!747351))

(assert (= (and b!747351 res!503989) b!747353))

(assert (= (and b!747353 res!503981) b!747345))

(assert (= (and b!747345 res!503982) b!747362))

(assert (= (and b!747362 res!503976) b!747354))

(assert (= (and b!747354 res!503985) b!747361))

(assert (= (and b!747361 res!503984) b!747357))

(assert (= (and b!747357 res!503978) b!747348))

(assert (= (and b!747348 res!503974) b!747358))

(assert (= (and b!747358 res!503990) b!747350))

(assert (= (and b!747350 res!503987) b!747344))

(assert (= (and b!747344 c!82066) b!747363))

(assert (= (and b!747344 (not c!82066)) b!747352))

(assert (= (and b!747344 res!503975) b!747349))

(assert (= (and b!747349 res!503980) b!747346))

(assert (= (and b!747346 res!503977) b!747343))

(assert (= (and b!747346 (not res!503986)) b!747359))

(assert (= (and b!747359 (not res!503979)) b!747347))

(assert (= (and b!747347 (not res!503988)) b!747360))

(assert (= (and b!747360 c!82065) b!747355))

(assert (= (and b!747360 (not c!82065)) b!747356))

(declare-fun m!697447 () Bool)

(assert (=> b!747352 m!697447))

(assert (=> b!747352 m!697447))

(declare-fun m!697449 () Bool)

(assert (=> b!747352 m!697449))

(assert (=> b!747363 m!697447))

(assert (=> b!747363 m!697447))

(declare-fun m!697451 () Bool)

(assert (=> b!747363 m!697451))

(declare-fun m!697453 () Bool)

(assert (=> b!747345 m!697453))

(assert (=> b!747358 m!697447))

(assert (=> b!747358 m!697447))

(declare-fun m!697455 () Bool)

(assert (=> b!747358 m!697455))

(assert (=> b!747358 m!697455))

(assert (=> b!747358 m!697447))

(declare-fun m!697457 () Bool)

(assert (=> b!747358 m!697457))

(declare-fun m!697459 () Bool)

(assert (=> b!747361 m!697459))

(declare-fun m!697461 () Bool)

(assert (=> b!747347 m!697461))

(declare-fun m!697463 () Bool)

(assert (=> b!747347 m!697463))

(assert (=> b!747346 m!697447))

(assert (=> b!747346 m!697447))

(declare-fun m!697465 () Bool)

(assert (=> b!747346 m!697465))

(declare-fun m!697467 () Bool)

(assert (=> b!747346 m!697467))

(declare-fun m!697469 () Bool)

(assert (=> b!747346 m!697469))

(assert (=> b!747343 m!697447))

(assert (=> b!747343 m!697447))

(declare-fun m!697471 () Bool)

(assert (=> b!747343 m!697471))

(assert (=> b!747360 m!697461))

(assert (=> b!747360 m!697463))

(declare-fun m!697473 () Bool)

(assert (=> b!747357 m!697473))

(declare-fun m!697475 () Bool)

(assert (=> start!65512 m!697475))

(declare-fun m!697477 () Bool)

(assert (=> start!65512 m!697477))

(declare-fun m!697479 () Bool)

(assert (=> b!747350 m!697479))

(declare-fun m!697481 () Bool)

(assert (=> b!747354 m!697481))

(declare-fun m!697483 () Bool)

(assert (=> b!747362 m!697483))

(assert (=> b!747359 m!697447))

(assert (=> b!747359 m!697447))

(assert (=> b!747359 m!697449))

(declare-fun m!697485 () Bool)

(assert (=> b!747349 m!697485))

(assert (=> b!747349 m!697461))

(declare-fun m!697487 () Bool)

(assert (=> b!747349 m!697487))

(declare-fun m!697489 () Bool)

(assert (=> b!747349 m!697489))

(assert (=> b!747349 m!697485))

(declare-fun m!697491 () Bool)

(assert (=> b!747349 m!697491))

(assert (=> b!747353 m!697447))

(assert (=> b!747353 m!697447))

(declare-fun m!697493 () Bool)

(assert (=> b!747353 m!697493))

(push 1)

