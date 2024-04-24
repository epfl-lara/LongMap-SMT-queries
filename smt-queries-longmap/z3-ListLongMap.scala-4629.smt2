; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64536 () Bool)

(assert start!64536)

(declare-fun b!725490 () Bool)

(declare-fun res!486474 () Bool)

(declare-fun e!406346 () Bool)

(assert (=> b!725490 (=> (not res!486474) (not e!406346))))

(declare-datatypes ((array!40987 0))(
  ( (array!40988 (arr!19612 (Array (_ BitVec 32) (_ BitVec 64))) (size!20032 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40987)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40987 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!725490 (= res!486474 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!406349 () Bool)

(declare-datatypes ((SeekEntryResult!7168 0))(
  ( (MissingZero!7168 (index!31040 (_ BitVec 32))) (Found!7168 (index!31041 (_ BitVec 32))) (Intermediate!7168 (undefined!7980 Bool) (index!31042 (_ BitVec 32)) (x!62189 (_ BitVec 32))) (Undefined!7168) (MissingVacant!7168 (index!31043 (_ BitVec 32))) )
))
(declare-fun lt!321381 () SeekEntryResult!7168)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!725491 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40987 (_ BitVec 32)) SeekEntryResult!7168)

(assert (=> b!725491 (= e!406349 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19612 a!3186) j!159) a!3186 mask!3328) lt!321381))))

(declare-fun b!725492 () Bool)

(declare-fun res!486480 () Bool)

(assert (=> b!725492 (=> (not res!486480) (not e!406346))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!725492 (= res!486480 (validKeyInArray!0 k0!2102))))

(declare-fun b!725493 () Bool)

(declare-fun res!486484 () Bool)

(declare-fun e!406351 () Bool)

(assert (=> b!725493 (=> (not res!486484) (not e!406351))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!725493 (= res!486484 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20032 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20032 a!3186))))))

(declare-fun b!725494 () Bool)

(declare-fun res!486475 () Bool)

(assert (=> b!725494 (=> (not res!486475) (not e!406351))))

(declare-datatypes ((List!13521 0))(
  ( (Nil!13518) (Cons!13517 (h!14577 (_ BitVec 64)) (t!19828 List!13521)) )
))
(declare-fun arrayNoDuplicates!0 (array!40987 (_ BitVec 32) List!13521) Bool)

(assert (=> b!725494 (= res!486475 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13518))))

(declare-fun b!725495 () Bool)

(declare-fun res!486479 () Bool)

(assert (=> b!725495 (=> (not res!486479) (not e!406351))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40987 (_ BitVec 32)) Bool)

(assert (=> b!725495 (= res!486479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!725496 () Bool)

(declare-fun res!486477 () Bool)

(assert (=> b!725496 (=> (not res!486477) (not e!406346))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!725496 (= res!486477 (and (= (size!20032 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20032 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20032 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!486482 () Bool)

(assert (=> start!64536 (=> (not res!486482) (not e!406346))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64536 (= res!486482 (validMask!0 mask!3328))))

(assert (=> start!64536 e!406346))

(assert (=> start!64536 true))

(declare-fun array_inv!15471 (array!40987) Bool)

(assert (=> start!64536 (array_inv!15471 a!3186)))

(declare-fun b!725497 () Bool)

(declare-fun res!486481 () Bool)

(declare-fun e!406350 () Bool)

(assert (=> b!725497 (=> (not res!486481) (not e!406350))))

(declare-fun e!406348 () Bool)

(assert (=> b!725497 (= res!486481 e!406348)))

(declare-fun c!79883 () Bool)

(assert (=> b!725497 (= c!79883 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!725498 () Bool)

(declare-fun res!486487 () Bool)

(assert (=> b!725498 (=> (not res!486487) (not e!406350))))

(assert (=> b!725498 (= res!486487 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19612 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!725499 () Bool)

(declare-fun res!486473 () Bool)

(assert (=> b!725499 (=> (not res!486473) (not e!406346))))

(assert (=> b!725499 (= res!486473 (validKeyInArray!0 (select (arr!19612 a!3186) j!159)))))

(declare-fun b!725500 () Bool)

(assert (=> b!725500 (= e!406348 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19612 a!3186) j!159) a!3186 mask!3328) (Found!7168 j!159)))))

(declare-fun b!725501 () Bool)

(assert (=> b!725501 (= e!406346 e!406351)))

(declare-fun res!486483 () Bool)

(assert (=> b!725501 (=> (not res!486483) (not e!406351))))

(declare-fun lt!321379 () SeekEntryResult!7168)

(assert (=> b!725501 (= res!486483 (or (= lt!321379 (MissingZero!7168 i!1173)) (= lt!321379 (MissingVacant!7168 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40987 (_ BitVec 32)) SeekEntryResult!7168)

(assert (=> b!725501 (= lt!321379 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!725502 () Bool)

(declare-fun lt!321378 () SeekEntryResult!7168)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40987 (_ BitVec 32)) SeekEntryResult!7168)

(assert (=> b!725502 (= e!406348 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19612 a!3186) j!159) a!3186 mask!3328) lt!321378))))

(declare-fun b!725503 () Bool)

(declare-fun e!406347 () Bool)

(assert (=> b!725503 (= e!406347 e!406349)))

(declare-fun res!486486 () Bool)

(assert (=> b!725503 (=> (not res!486486) (not e!406349))))

(assert (=> b!725503 (= res!486486 (= (seekEntryOrOpen!0 (select (arr!19612 a!3186) j!159) a!3186 mask!3328) lt!321381))))

(assert (=> b!725503 (= lt!321381 (Found!7168 j!159))))

(declare-fun b!725504 () Bool)

(declare-fun e!406353 () Bool)

(assert (=> b!725504 (= e!406353 (not true))))

(assert (=> b!725504 e!406347))

(declare-fun res!486476 () Bool)

(assert (=> b!725504 (=> (not res!486476) (not e!406347))))

(assert (=> b!725504 (= res!486476 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24733 0))(
  ( (Unit!24734) )
))
(declare-fun lt!321377 () Unit!24733)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40987 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24733)

(assert (=> b!725504 (= lt!321377 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!725505 () Bool)

(assert (=> b!725505 (= e!406351 e!406350)))

(declare-fun res!486478 () Bool)

(assert (=> b!725505 (=> (not res!486478) (not e!406350))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!725505 (= res!486478 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19612 a!3186) j!159) mask!3328) (select (arr!19612 a!3186) j!159) a!3186 mask!3328) lt!321378))))

(assert (=> b!725505 (= lt!321378 (Intermediate!7168 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!725506 () Bool)

(assert (=> b!725506 (= e!406350 e!406353)))

(declare-fun res!486485 () Bool)

(assert (=> b!725506 (=> (not res!486485) (not e!406353))))

(declare-fun lt!321380 () (_ BitVec 64))

(declare-fun lt!321376 () array!40987)

(assert (=> b!725506 (= res!486485 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321380 mask!3328) lt!321380 lt!321376 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321380 lt!321376 mask!3328)))))

(assert (=> b!725506 (= lt!321380 (select (store (arr!19612 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!725506 (= lt!321376 (array!40988 (store (arr!19612 a!3186) i!1173 k0!2102) (size!20032 a!3186)))))

(assert (= (and start!64536 res!486482) b!725496))

(assert (= (and b!725496 res!486477) b!725499))

(assert (= (and b!725499 res!486473) b!725492))

(assert (= (and b!725492 res!486480) b!725490))

(assert (= (and b!725490 res!486474) b!725501))

(assert (= (and b!725501 res!486483) b!725495))

(assert (= (and b!725495 res!486479) b!725494))

(assert (= (and b!725494 res!486475) b!725493))

(assert (= (and b!725493 res!486484) b!725505))

(assert (= (and b!725505 res!486478) b!725498))

(assert (= (and b!725498 res!486487) b!725497))

(assert (= (and b!725497 c!79883) b!725502))

(assert (= (and b!725497 (not c!79883)) b!725500))

(assert (= (and b!725497 res!486481) b!725506))

(assert (= (and b!725506 res!486485) b!725504))

(assert (= (and b!725504 res!486476) b!725503))

(assert (= (and b!725503 res!486486) b!725491))

(declare-fun m!680199 () Bool)

(assert (=> b!725501 m!680199))

(declare-fun m!680201 () Bool)

(assert (=> b!725506 m!680201))

(declare-fun m!680203 () Bool)

(assert (=> b!725506 m!680203))

(assert (=> b!725506 m!680201))

(declare-fun m!680205 () Bool)

(assert (=> b!725506 m!680205))

(declare-fun m!680207 () Bool)

(assert (=> b!725506 m!680207))

(declare-fun m!680209 () Bool)

(assert (=> b!725506 m!680209))

(declare-fun m!680211 () Bool)

(assert (=> b!725492 m!680211))

(declare-fun m!680213 () Bool)

(assert (=> b!725491 m!680213))

(assert (=> b!725491 m!680213))

(declare-fun m!680215 () Bool)

(assert (=> b!725491 m!680215))

(assert (=> b!725499 m!680213))

(assert (=> b!725499 m!680213))

(declare-fun m!680217 () Bool)

(assert (=> b!725499 m!680217))

(declare-fun m!680219 () Bool)

(assert (=> b!725495 m!680219))

(declare-fun m!680221 () Bool)

(assert (=> b!725498 m!680221))

(assert (=> b!725505 m!680213))

(assert (=> b!725505 m!680213))

(declare-fun m!680223 () Bool)

(assert (=> b!725505 m!680223))

(assert (=> b!725505 m!680223))

(assert (=> b!725505 m!680213))

(declare-fun m!680225 () Bool)

(assert (=> b!725505 m!680225))

(declare-fun m!680227 () Bool)

(assert (=> b!725494 m!680227))

(declare-fun m!680229 () Bool)

(assert (=> b!725504 m!680229))

(declare-fun m!680231 () Bool)

(assert (=> b!725504 m!680231))

(declare-fun m!680233 () Bool)

(assert (=> start!64536 m!680233))

(declare-fun m!680235 () Bool)

(assert (=> start!64536 m!680235))

(assert (=> b!725503 m!680213))

(assert (=> b!725503 m!680213))

(declare-fun m!680237 () Bool)

(assert (=> b!725503 m!680237))

(declare-fun m!680239 () Bool)

(assert (=> b!725490 m!680239))

(assert (=> b!725502 m!680213))

(assert (=> b!725502 m!680213))

(declare-fun m!680241 () Bool)

(assert (=> b!725502 m!680241))

(assert (=> b!725500 m!680213))

(assert (=> b!725500 m!680213))

(declare-fun m!680243 () Bool)

(assert (=> b!725500 m!680243))

(check-sat (not b!725492) (not start!64536) (not b!725504) (not b!725494) (not b!725502) (not b!725503) (not b!725501) (not b!725506) (not b!725500) (not b!725499) (not b!725490) (not b!725495) (not b!725505) (not b!725491))
(check-sat)
