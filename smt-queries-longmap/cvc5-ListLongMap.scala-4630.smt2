; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64480 () Bool)

(assert start!64480)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7220 0))(
  ( (MissingZero!7220 (index!31248 (_ BitVec 32))) (Found!7220 (index!31249 (_ BitVec 32))) (Intermediate!7220 (undefined!8032 Bool) (index!31250 (_ BitVec 32)) (x!62246 (_ BitVec 32))) (Undefined!7220) (MissingVacant!7220 (index!31251 (_ BitVec 32))) )
))
(declare-fun lt!321303 () SeekEntryResult!7220)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40998 0))(
  ( (array!40999 (arr!19620 (Array (_ BitVec 32) (_ BitVec 64))) (size!20041 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40998)

(declare-fun b!725315 () Bool)

(declare-fun e!406199 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40998 (_ BitVec 32)) SeekEntryResult!7220)

(assert (=> b!725315 (= e!406199 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19620 a!3186) j!159) a!3186 mask!3328) lt!321303))))

(declare-fun b!725316 () Bool)

(declare-fun e!406193 () Bool)

(assert (=> b!725316 (= e!406193 e!406199)))

(declare-fun res!486441 () Bool)

(assert (=> b!725316 (=> (not res!486441) (not e!406199))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40998 (_ BitVec 32)) SeekEntryResult!7220)

(assert (=> b!725316 (= res!486441 (= (seekEntryOrOpen!0 (select (arr!19620 a!3186) j!159) a!3186 mask!3328) lt!321303))))

(assert (=> b!725316 (= lt!321303 (Found!7220 j!159))))

(declare-fun b!725317 () Bool)

(declare-fun res!486436 () Bool)

(declare-fun e!406194 () Bool)

(assert (=> b!725317 (=> (not res!486436) (not e!406194))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!725317 (= res!486436 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20041 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20041 a!3186))))))

(declare-fun b!725318 () Bool)

(declare-fun res!486443 () Bool)

(declare-fun e!406192 () Bool)

(assert (=> b!725318 (=> (not res!486443) (not e!406192))))

(declare-fun e!406196 () Bool)

(assert (=> b!725318 (= res!486443 e!406196)))

(declare-fun c!79816 () Bool)

(assert (=> b!725318 (= c!79816 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!725319 () Bool)

(declare-fun res!486438 () Bool)

(assert (=> b!725319 (=> (not res!486438) (not e!406194))))

(declare-datatypes ((List!13622 0))(
  ( (Nil!13619) (Cons!13618 (h!14675 (_ BitVec 64)) (t!19937 List!13622)) )
))
(declare-fun arrayNoDuplicates!0 (array!40998 (_ BitVec 32) List!13622) Bool)

(assert (=> b!725319 (= res!486438 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13619))))

(declare-fun b!725320 () Bool)

(declare-fun e!406195 () Bool)

(assert (=> b!725320 (= e!406195 (not (bvsge mask!3328 #b00000000000000000000000000000000)))))

(assert (=> b!725320 e!406193))

(declare-fun res!486442 () Bool)

(assert (=> b!725320 (=> (not res!486442) (not e!406193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40998 (_ BitVec 32)) Bool)

(assert (=> b!725320 (= res!486442 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24758 0))(
  ( (Unit!24759) )
))
(declare-fun lt!321304 () Unit!24758)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40998 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24758)

(assert (=> b!725320 (= lt!321304 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!725321 () Bool)

(declare-fun e!406198 () Bool)

(assert (=> b!725321 (= e!406198 e!406194)))

(declare-fun res!486439 () Bool)

(assert (=> b!725321 (=> (not res!486439) (not e!406194))))

(declare-fun lt!321305 () SeekEntryResult!7220)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!725321 (= res!486439 (or (= lt!321305 (MissingZero!7220 i!1173)) (= lt!321305 (MissingVacant!7220 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!725321 (= lt!321305 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!725322 () Bool)

(declare-fun res!486440 () Bool)

(assert (=> b!725322 (=> (not res!486440) (not e!406194))))

(assert (=> b!725322 (= res!486440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!486430 () Bool)

(assert (=> start!64480 (=> (not res!486430) (not e!406198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64480 (= res!486430 (validMask!0 mask!3328))))

(assert (=> start!64480 e!406198))

(assert (=> start!64480 true))

(declare-fun array_inv!15416 (array!40998) Bool)

(assert (=> start!64480 (array_inv!15416 a!3186)))

(declare-fun b!725323 () Bool)

(declare-fun res!486432 () Bool)

(assert (=> b!725323 (=> (not res!486432) (not e!406198))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!725323 (= res!486432 (validKeyInArray!0 k!2102))))

(declare-fun b!725324 () Bool)

(declare-fun res!486433 () Bool)

(assert (=> b!725324 (=> (not res!486433) (not e!406198))))

(assert (=> b!725324 (= res!486433 (validKeyInArray!0 (select (arr!19620 a!3186) j!159)))))

(declare-fun lt!321301 () SeekEntryResult!7220)

(declare-fun b!725325 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40998 (_ BitVec 32)) SeekEntryResult!7220)

(assert (=> b!725325 (= e!406196 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19620 a!3186) j!159) a!3186 mask!3328) lt!321301))))

(declare-fun b!725326 () Bool)

(declare-fun res!486435 () Bool)

(assert (=> b!725326 (=> (not res!486435) (not e!406192))))

(assert (=> b!725326 (= res!486435 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19620 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!725327 () Bool)

(declare-fun res!486431 () Bool)

(assert (=> b!725327 (=> (not res!486431) (not e!406198))))

(assert (=> b!725327 (= res!486431 (and (= (size!20041 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20041 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20041 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!725328 () Bool)

(declare-fun res!486437 () Bool)

(assert (=> b!725328 (=> (not res!486437) (not e!406198))))

(declare-fun arrayContainsKey!0 (array!40998 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!725328 (= res!486437 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!725329 () Bool)

(assert (=> b!725329 (= e!406192 e!406195)))

(declare-fun res!486429 () Bool)

(assert (=> b!725329 (=> (not res!486429) (not e!406195))))

(declare-fun lt!321300 () (_ BitVec 64))

(declare-fun lt!321302 () array!40998)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!725329 (= res!486429 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321300 mask!3328) lt!321300 lt!321302 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321300 lt!321302 mask!3328)))))

(assert (=> b!725329 (= lt!321300 (select (store (arr!19620 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!725329 (= lt!321302 (array!40999 (store (arr!19620 a!3186) i!1173 k!2102) (size!20041 a!3186)))))

(declare-fun b!725330 () Bool)

(assert (=> b!725330 (= e!406194 e!406192)))

(declare-fun res!486434 () Bool)

(assert (=> b!725330 (=> (not res!486434) (not e!406192))))

(assert (=> b!725330 (= res!486434 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19620 a!3186) j!159) mask!3328) (select (arr!19620 a!3186) j!159) a!3186 mask!3328) lt!321301))))

(assert (=> b!725330 (= lt!321301 (Intermediate!7220 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!725331 () Bool)

(assert (=> b!725331 (= e!406196 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19620 a!3186) j!159) a!3186 mask!3328) (Found!7220 j!159)))))

(assert (= (and start!64480 res!486430) b!725327))

(assert (= (and b!725327 res!486431) b!725324))

(assert (= (and b!725324 res!486433) b!725323))

(assert (= (and b!725323 res!486432) b!725328))

(assert (= (and b!725328 res!486437) b!725321))

(assert (= (and b!725321 res!486439) b!725322))

(assert (= (and b!725322 res!486440) b!725319))

(assert (= (and b!725319 res!486438) b!725317))

(assert (= (and b!725317 res!486436) b!725330))

(assert (= (and b!725330 res!486434) b!725326))

(assert (= (and b!725326 res!486435) b!725318))

(assert (= (and b!725318 c!79816) b!725325))

(assert (= (and b!725318 (not c!79816)) b!725331))

(assert (= (and b!725318 res!486443) b!725329))

(assert (= (and b!725329 res!486429) b!725320))

(assert (= (and b!725320 res!486442) b!725316))

(assert (= (and b!725316 res!486441) b!725315))

(declare-fun m!679489 () Bool)

(assert (=> b!725323 m!679489))

(declare-fun m!679491 () Bool)

(assert (=> b!725328 m!679491))

(declare-fun m!679493 () Bool)

(assert (=> b!725326 m!679493))

(declare-fun m!679495 () Bool)

(assert (=> b!725321 m!679495))

(declare-fun m!679497 () Bool)

(assert (=> b!725324 m!679497))

(assert (=> b!725324 m!679497))

(declare-fun m!679499 () Bool)

(assert (=> b!725324 m!679499))

(assert (=> b!725316 m!679497))

(assert (=> b!725316 m!679497))

(declare-fun m!679501 () Bool)

(assert (=> b!725316 m!679501))

(assert (=> b!725331 m!679497))

(assert (=> b!725331 m!679497))

(declare-fun m!679503 () Bool)

(assert (=> b!725331 m!679503))

(declare-fun m!679505 () Bool)

(assert (=> b!725329 m!679505))

(declare-fun m!679507 () Bool)

(assert (=> b!725329 m!679507))

(declare-fun m!679509 () Bool)

(assert (=> b!725329 m!679509))

(declare-fun m!679511 () Bool)

(assert (=> b!725329 m!679511))

(assert (=> b!725329 m!679507))

(declare-fun m!679513 () Bool)

(assert (=> b!725329 m!679513))

(declare-fun m!679515 () Bool)

(assert (=> start!64480 m!679515))

(declare-fun m!679517 () Bool)

(assert (=> start!64480 m!679517))

(declare-fun m!679519 () Bool)

(assert (=> b!725322 m!679519))

(assert (=> b!725315 m!679497))

(assert (=> b!725315 m!679497))

(declare-fun m!679521 () Bool)

(assert (=> b!725315 m!679521))

(declare-fun m!679523 () Bool)

(assert (=> b!725320 m!679523))

(declare-fun m!679525 () Bool)

(assert (=> b!725320 m!679525))

(assert (=> b!725330 m!679497))

(assert (=> b!725330 m!679497))

(declare-fun m!679527 () Bool)

(assert (=> b!725330 m!679527))

(assert (=> b!725330 m!679527))

(assert (=> b!725330 m!679497))

(declare-fun m!679529 () Bool)

(assert (=> b!725330 m!679529))

(assert (=> b!725325 m!679497))

(assert (=> b!725325 m!679497))

(declare-fun m!679531 () Bool)

(assert (=> b!725325 m!679531))

(declare-fun m!679533 () Bool)

(assert (=> b!725319 m!679533))

(push 1)

