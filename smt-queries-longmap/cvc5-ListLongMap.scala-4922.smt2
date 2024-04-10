; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67776 () Bool)

(assert start!67776)

(declare-fun b!787484 () Bool)

(declare-fun res!533359 () Bool)

(declare-fun e!437728 () Bool)

(assert (=> b!787484 (=> (not res!533359) (not e!437728))))

(declare-datatypes ((array!42816 0))(
  ( (array!42817 (arr!20496 (Array (_ BitVec 32) (_ BitVec 64))) (size!20917 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42816)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!787484 (= res!533359 (validKeyInArray!0 (select (arr!20496 a!3186) j!159)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!787485 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!437729 () Bool)

(declare-datatypes ((SeekEntryResult!8096 0))(
  ( (MissingZero!8096 (index!34752 (_ BitVec 32))) (Found!8096 (index!34753 (_ BitVec 32))) (Intermediate!8096 (undefined!8908 Bool) (index!34754 (_ BitVec 32)) (x!65692 (_ BitVec 32))) (Undefined!8096) (MissingVacant!8096 (index!34755 (_ BitVec 32))) )
))
(declare-fun lt!351284 () SeekEntryResult!8096)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42816 (_ BitVec 32)) SeekEntryResult!8096)

(assert (=> b!787485 (= e!437729 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20496 a!3186) j!159) a!3186 mask!3328) lt!351284))))

(declare-fun b!787486 () Bool)

(declare-datatypes ((Unit!27272 0))(
  ( (Unit!27273) )
))
(declare-fun e!437721 () Unit!27272)

(declare-fun Unit!27274 () Unit!27272)

(assert (=> b!787486 (= e!437721 Unit!27274)))

(assert (=> b!787486 false))

(declare-fun b!787488 () Bool)

(declare-fun e!437725 () Bool)

(assert (=> b!787488 (= e!437725 true)))

(declare-fun e!437730 () Bool)

(assert (=> b!787488 e!437730))

(declare-fun res!533364 () Bool)

(assert (=> b!787488 (=> (not res!533364) (not e!437730))))

(declare-fun lt!351273 () (_ BitVec 64))

(assert (=> b!787488 (= res!533364 (= lt!351273 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!351279 () Unit!27272)

(assert (=> b!787488 (= lt!351279 e!437721)))

(declare-fun c!87475 () Bool)

(assert (=> b!787488 (= c!87475 (= lt!351273 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!787489 () Bool)

(declare-fun res!533352 () Bool)

(assert (=> b!787489 (=> (not res!533352) (not e!437728))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!787489 (= res!533352 (validKeyInArray!0 k!2102))))

(declare-fun e!437723 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!787490 () Bool)

(declare-fun lt!351281 () SeekEntryResult!8096)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42816 (_ BitVec 32)) SeekEntryResult!8096)

(assert (=> b!787490 (= e!437723 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20496 a!3186) j!159) a!3186 mask!3328) lt!351281))))

(declare-fun b!787491 () Bool)

(assert (=> b!787491 (= e!437723 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20496 a!3186) j!159) a!3186 mask!3328) (Found!8096 j!159)))))

(declare-fun b!787492 () Bool)

(declare-fun lt!351275 () SeekEntryResult!8096)

(declare-fun lt!351278 () SeekEntryResult!8096)

(assert (=> b!787492 (= e!437730 (= lt!351275 lt!351278))))

(declare-fun b!787493 () Bool)

(declare-fun e!437724 () Bool)

(assert (=> b!787493 (= e!437728 e!437724)))

(declare-fun res!533357 () Bool)

(assert (=> b!787493 (=> (not res!533357) (not e!437724))))

(declare-fun lt!351280 () SeekEntryResult!8096)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!787493 (= res!533357 (or (= lt!351280 (MissingZero!8096 i!1173)) (= lt!351280 (MissingVacant!8096 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42816 (_ BitVec 32)) SeekEntryResult!8096)

(assert (=> b!787493 (= lt!351280 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!787494 () Bool)

(declare-fun res!533367 () Bool)

(assert (=> b!787494 (=> (not res!533367) (not e!437730))))

(declare-fun lt!351283 () array!42816)

(declare-fun lt!351282 () (_ BitVec 64))

(assert (=> b!787494 (= res!533367 (= (seekEntryOrOpen!0 lt!351282 lt!351283 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351282 lt!351283 mask!3328)))))

(declare-fun b!787495 () Bool)

(declare-fun res!533360 () Bool)

(assert (=> b!787495 (=> (not res!533360) (not e!437728))))

(declare-fun arrayContainsKey!0 (array!42816 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!787495 (= res!533360 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!787496 () Bool)

(declare-fun e!437722 () Bool)

(declare-fun e!437727 () Bool)

(assert (=> b!787496 (= e!437722 e!437727)))

(declare-fun res!533353 () Bool)

(assert (=> b!787496 (=> res!533353 e!437727)))

(assert (=> b!787496 (= res!533353 (not (= lt!351278 lt!351284)))))

(assert (=> b!787496 (= lt!351278 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20496 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!787497 () Bool)

(declare-fun e!437726 () Bool)

(declare-fun e!437732 () Bool)

(assert (=> b!787497 (= e!437726 e!437732)))

(declare-fun res!533361 () Bool)

(assert (=> b!787497 (=> (not res!533361) (not e!437732))))

(declare-fun lt!351277 () SeekEntryResult!8096)

(declare-fun lt!351274 () SeekEntryResult!8096)

(assert (=> b!787497 (= res!533361 (= lt!351277 lt!351274))))

(assert (=> b!787497 (= lt!351274 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351282 lt!351283 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!787497 (= lt!351277 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351282 mask!3328) lt!351282 lt!351283 mask!3328))))

(assert (=> b!787497 (= lt!351282 (select (store (arr!20496 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!787497 (= lt!351283 (array!42817 (store (arr!20496 a!3186) i!1173 k!2102) (size!20917 a!3186)))))

(declare-fun b!787498 () Bool)

(declare-fun res!533354 () Bool)

(assert (=> b!787498 (=> (not res!533354) (not e!437724))))

(declare-datatypes ((List!14498 0))(
  ( (Nil!14495) (Cons!14494 (h!15617 (_ BitVec 64)) (t!20813 List!14498)) )
))
(declare-fun arrayNoDuplicates!0 (array!42816 (_ BitVec 32) List!14498) Bool)

(assert (=> b!787498 (= res!533354 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14495))))

(declare-fun b!787499 () Bool)

(declare-fun Unit!27275 () Unit!27272)

(assert (=> b!787499 (= e!437721 Unit!27275)))

(declare-fun b!787500 () Bool)

(declare-fun res!533365 () Bool)

(assert (=> b!787500 (=> (not res!533365) (not e!437726))))

(assert (=> b!787500 (= res!533365 e!437723)))

(declare-fun c!87474 () Bool)

(assert (=> b!787500 (= c!87474 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!533369 () Bool)

(assert (=> start!67776 (=> (not res!533369) (not e!437728))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67776 (= res!533369 (validMask!0 mask!3328))))

(assert (=> start!67776 e!437728))

(assert (=> start!67776 true))

(declare-fun array_inv!16292 (array!42816) Bool)

(assert (=> start!67776 (array_inv!16292 a!3186)))

(declare-fun b!787487 () Bool)

(declare-fun res!533355 () Bool)

(assert (=> b!787487 (=> (not res!533355) (not e!437724))))

(assert (=> b!787487 (= res!533355 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20917 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20917 a!3186))))))

(declare-fun b!787501 () Bool)

(declare-fun res!533351 () Bool)

(assert (=> b!787501 (=> (not res!533351) (not e!437724))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42816 (_ BitVec 32)) Bool)

(assert (=> b!787501 (= res!533351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!787502 () Bool)

(declare-fun res!533362 () Bool)

(assert (=> b!787502 (=> (not res!533362) (not e!437726))))

(assert (=> b!787502 (= res!533362 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20496 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!787503 () Bool)

(assert (=> b!787503 (= e!437724 e!437726)))

(declare-fun res!533368 () Bool)

(assert (=> b!787503 (=> (not res!533368) (not e!437726))))

(assert (=> b!787503 (= res!533368 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20496 a!3186) j!159) mask!3328) (select (arr!20496 a!3186) j!159) a!3186 mask!3328) lt!351281))))

(assert (=> b!787503 (= lt!351281 (Intermediate!8096 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!787504 () Bool)

(declare-fun res!533356 () Bool)

(assert (=> b!787504 (=> (not res!533356) (not e!437728))))

(assert (=> b!787504 (= res!533356 (and (= (size!20917 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20917 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20917 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!787505 () Bool)

(assert (=> b!787505 (= e!437727 e!437725)))

(declare-fun res!533358 () Bool)

(assert (=> b!787505 (=> res!533358 e!437725)))

(assert (=> b!787505 (= res!533358 (= lt!351273 lt!351282))))

(assert (=> b!787505 (= lt!351273 (select (store (arr!20496 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!787506 () Bool)

(assert (=> b!787506 (= e!437732 (not e!437722))))

(declare-fun res!533363 () Bool)

(assert (=> b!787506 (=> res!533363 e!437722)))

(assert (=> b!787506 (= res!533363 (or (not (is-Intermediate!8096 lt!351274)) (bvslt x!1131 (x!65692 lt!351274)) (not (= x!1131 (x!65692 lt!351274))) (not (= index!1321 (index!34754 lt!351274)))))))

(assert (=> b!787506 e!437729))

(declare-fun res!533366 () Bool)

(assert (=> b!787506 (=> (not res!533366) (not e!437729))))

(assert (=> b!787506 (= res!533366 (= lt!351275 lt!351284))))

(assert (=> b!787506 (= lt!351284 (Found!8096 j!159))))

(assert (=> b!787506 (= lt!351275 (seekEntryOrOpen!0 (select (arr!20496 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!787506 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!351276 () Unit!27272)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42816 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27272)

(assert (=> b!787506 (= lt!351276 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!67776 res!533369) b!787504))

(assert (= (and b!787504 res!533356) b!787484))

(assert (= (and b!787484 res!533359) b!787489))

(assert (= (and b!787489 res!533352) b!787495))

(assert (= (and b!787495 res!533360) b!787493))

(assert (= (and b!787493 res!533357) b!787501))

(assert (= (and b!787501 res!533351) b!787498))

(assert (= (and b!787498 res!533354) b!787487))

(assert (= (and b!787487 res!533355) b!787503))

(assert (= (and b!787503 res!533368) b!787502))

(assert (= (and b!787502 res!533362) b!787500))

(assert (= (and b!787500 c!87474) b!787490))

(assert (= (and b!787500 (not c!87474)) b!787491))

(assert (= (and b!787500 res!533365) b!787497))

(assert (= (and b!787497 res!533361) b!787506))

(assert (= (and b!787506 res!533366) b!787485))

(assert (= (and b!787506 (not res!533363)) b!787496))

(assert (= (and b!787496 (not res!533353)) b!787505))

(assert (= (and b!787505 (not res!533358)) b!787488))

(assert (= (and b!787488 c!87475) b!787486))

(assert (= (and b!787488 (not c!87475)) b!787499))

(assert (= (and b!787488 res!533364) b!787494))

(assert (= (and b!787494 res!533367) b!787492))

(declare-fun m!729053 () Bool)

(assert (=> b!787493 m!729053))

(declare-fun m!729055 () Bool)

(assert (=> b!787484 m!729055))

(assert (=> b!787484 m!729055))

(declare-fun m!729057 () Bool)

(assert (=> b!787484 m!729057))

(assert (=> b!787491 m!729055))

(assert (=> b!787491 m!729055))

(declare-fun m!729059 () Bool)

(assert (=> b!787491 m!729059))

(assert (=> b!787506 m!729055))

(assert (=> b!787506 m!729055))

(declare-fun m!729061 () Bool)

(assert (=> b!787506 m!729061))

(declare-fun m!729063 () Bool)

(assert (=> b!787506 m!729063))

(declare-fun m!729065 () Bool)

(assert (=> b!787506 m!729065))

(declare-fun m!729067 () Bool)

(assert (=> b!787505 m!729067))

(declare-fun m!729069 () Bool)

(assert (=> b!787505 m!729069))

(declare-fun m!729071 () Bool)

(assert (=> b!787502 m!729071))

(assert (=> b!787490 m!729055))

(assert (=> b!787490 m!729055))

(declare-fun m!729073 () Bool)

(assert (=> b!787490 m!729073))

(declare-fun m!729075 () Bool)

(assert (=> start!67776 m!729075))

(declare-fun m!729077 () Bool)

(assert (=> start!67776 m!729077))

(assert (=> b!787496 m!729055))

(assert (=> b!787496 m!729055))

(assert (=> b!787496 m!729059))

(assert (=> b!787497 m!729067))

(declare-fun m!729079 () Bool)

(assert (=> b!787497 m!729079))

(declare-fun m!729081 () Bool)

(assert (=> b!787497 m!729081))

(assert (=> b!787497 m!729081))

(declare-fun m!729083 () Bool)

(assert (=> b!787497 m!729083))

(declare-fun m!729085 () Bool)

(assert (=> b!787497 m!729085))

(declare-fun m!729087 () Bool)

(assert (=> b!787494 m!729087))

(declare-fun m!729089 () Bool)

(assert (=> b!787494 m!729089))

(declare-fun m!729091 () Bool)

(assert (=> b!787498 m!729091))

(declare-fun m!729093 () Bool)

(assert (=> b!787501 m!729093))

(assert (=> b!787485 m!729055))

(assert (=> b!787485 m!729055))

(declare-fun m!729095 () Bool)

(assert (=> b!787485 m!729095))

(declare-fun m!729097 () Bool)

(assert (=> b!787489 m!729097))

(declare-fun m!729099 () Bool)

(assert (=> b!787495 m!729099))

(assert (=> b!787503 m!729055))

(assert (=> b!787503 m!729055))

(declare-fun m!729101 () Bool)

(assert (=> b!787503 m!729101))

(assert (=> b!787503 m!729101))

(assert (=> b!787503 m!729055))

(declare-fun m!729103 () Bool)

(assert (=> b!787503 m!729103))

(push 1)

