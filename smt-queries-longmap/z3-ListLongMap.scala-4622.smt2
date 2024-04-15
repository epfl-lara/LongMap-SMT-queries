; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64346 () Bool)

(assert start!64346)

(declare-fun b!723503 () Bool)

(declare-fun res!485187 () Bool)

(declare-fun e!405285 () Bool)

(assert (=> b!723503 (=> (not res!485187) (not e!405285))))

(declare-datatypes ((array!40944 0))(
  ( (array!40945 (arr!19595 (Array (_ BitVec 32) (_ BitVec 64))) (size!20016 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40944)

(declare-datatypes ((List!13636 0))(
  ( (Nil!13633) (Cons!13632 (h!14686 (_ BitVec 64)) (t!19942 List!13636)) )
))
(declare-fun arrayNoDuplicates!0 (array!40944 (_ BitVec 32) List!13636) Bool)

(assert (=> b!723503 (= res!485187 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13633))))

(declare-fun b!723504 () Bool)

(declare-fun res!485178 () Bool)

(declare-fun e!405280 () Bool)

(assert (=> b!723504 (=> (not res!485178) (not e!405280))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40944 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!723504 (= res!485178 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!723505 () Bool)

(declare-fun res!485177 () Bool)

(declare-fun e!405283 () Bool)

(assert (=> b!723505 (=> (not res!485177) (not e!405283))))

(declare-fun e!405286 () Bool)

(assert (=> b!723505 (= res!485177 e!405286)))

(declare-fun c!79536 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!723505 (= c!79536 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!723506 () Bool)

(declare-fun e!405281 () Bool)

(assert (=> b!723506 (= e!405283 e!405281)))

(declare-fun res!485185 () Bool)

(assert (=> b!723506 (=> (not res!485185) (not e!405281))))

(declare-fun lt!320530 () array!40944)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!320534 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7192 0))(
  ( (MissingZero!7192 (index!31136 (_ BitVec 32))) (Found!7192 (index!31137 (_ BitVec 32))) (Intermediate!7192 (undefined!8004 Bool) (index!31138 (_ BitVec 32)) (x!62140 (_ BitVec 32))) (Undefined!7192) (MissingVacant!7192 (index!31139 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40944 (_ BitVec 32)) SeekEntryResult!7192)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!723506 (= res!485185 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320534 mask!3328) lt!320534 lt!320530 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320534 lt!320530 mask!3328)))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!723506 (= lt!320534 (select (store (arr!19595 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!723506 (= lt!320530 (array!40945 (store (arr!19595 a!3186) i!1173 k0!2102) (size!20016 a!3186)))))

(declare-fun b!723507 () Bool)

(assert (=> b!723507 (= e!405281 (not (bvsge mask!3328 #b00000000000000000000000000000000)))))

(declare-fun e!405282 () Bool)

(assert (=> b!723507 e!405282))

(declare-fun res!485186 () Bool)

(assert (=> b!723507 (=> (not res!485186) (not e!405282))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40944 (_ BitVec 32)) Bool)

(assert (=> b!723507 (= res!485186 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24674 0))(
  ( (Unit!24675) )
))
(declare-fun lt!320532 () Unit!24674)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40944 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24674)

(assert (=> b!723507 (= lt!320532 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!723508 () Bool)

(declare-fun res!485176 () Bool)

(assert (=> b!723508 (=> (not res!485176) (not e!405285))))

(assert (=> b!723508 (= res!485176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!485175 () Bool)

(assert (=> start!64346 (=> (not res!485175) (not e!405280))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64346 (= res!485175 (validMask!0 mask!3328))))

(assert (=> start!64346 e!405280))

(assert (=> start!64346 true))

(declare-fun array_inv!15478 (array!40944) Bool)

(assert (=> start!64346 (array_inv!15478 a!3186)))

(declare-fun b!723509 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40944 (_ BitVec 32)) SeekEntryResult!7192)

(assert (=> b!723509 (= e!405282 (= (seekEntryOrOpen!0 (select (arr!19595 a!3186) j!159) a!3186 mask!3328) (Found!7192 j!159)))))

(declare-fun b!723510 () Bool)

(declare-fun res!485174 () Bool)

(assert (=> b!723510 (=> (not res!485174) (not e!405280))))

(assert (=> b!723510 (= res!485174 (and (= (size!20016 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20016 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20016 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!723511 () Bool)

(declare-fun res!485181 () Bool)

(assert (=> b!723511 (=> (not res!485181) (not e!405280))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!723511 (= res!485181 (validKeyInArray!0 k0!2102))))

(declare-fun b!723512 () Bool)

(declare-fun res!485184 () Bool)

(assert (=> b!723512 (=> (not res!485184) (not e!405285))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!723512 (= res!485184 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20016 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20016 a!3186))))))

(declare-fun b!723513 () Bool)

(declare-fun res!485183 () Bool)

(assert (=> b!723513 (=> (not res!485183) (not e!405280))))

(assert (=> b!723513 (= res!485183 (validKeyInArray!0 (select (arr!19595 a!3186) j!159)))))

(declare-fun b!723514 () Bool)

(declare-fun res!485179 () Bool)

(assert (=> b!723514 (=> (not res!485179) (not e!405283))))

(assert (=> b!723514 (= res!485179 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19595 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!723515 () Bool)

(assert (=> b!723515 (= e!405285 e!405283)))

(declare-fun res!485182 () Bool)

(assert (=> b!723515 (=> (not res!485182) (not e!405283))))

(declare-fun lt!320533 () SeekEntryResult!7192)

(assert (=> b!723515 (= res!485182 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19595 a!3186) j!159) mask!3328) (select (arr!19595 a!3186) j!159) a!3186 mask!3328) lt!320533))))

(assert (=> b!723515 (= lt!320533 (Intermediate!7192 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!723516 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40944 (_ BitVec 32)) SeekEntryResult!7192)

(assert (=> b!723516 (= e!405286 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19595 a!3186) j!159) a!3186 mask!3328) (Found!7192 j!159)))))

(declare-fun b!723517 () Bool)

(assert (=> b!723517 (= e!405280 e!405285)))

(declare-fun res!485180 () Bool)

(assert (=> b!723517 (=> (not res!485180) (not e!405285))))

(declare-fun lt!320531 () SeekEntryResult!7192)

(assert (=> b!723517 (= res!485180 (or (= lt!320531 (MissingZero!7192 i!1173)) (= lt!320531 (MissingVacant!7192 i!1173))))))

(assert (=> b!723517 (= lt!320531 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!723518 () Bool)

(assert (=> b!723518 (= e!405286 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19595 a!3186) j!159) a!3186 mask!3328) lt!320533))))

(assert (= (and start!64346 res!485175) b!723510))

(assert (= (and b!723510 res!485174) b!723513))

(assert (= (and b!723513 res!485183) b!723511))

(assert (= (and b!723511 res!485181) b!723504))

(assert (= (and b!723504 res!485178) b!723517))

(assert (= (and b!723517 res!485180) b!723508))

(assert (= (and b!723508 res!485176) b!723503))

(assert (= (and b!723503 res!485187) b!723512))

(assert (= (and b!723512 res!485184) b!723515))

(assert (= (and b!723515 res!485182) b!723514))

(assert (= (and b!723514 res!485179) b!723505))

(assert (= (and b!723505 c!79536) b!723518))

(assert (= (and b!723505 (not c!79536)) b!723516))

(assert (= (and b!723505 res!485177) b!723506))

(assert (= (and b!723506 res!485185) b!723507))

(assert (= (and b!723507 res!485186) b!723509))

(declare-fun m!677411 () Bool)

(assert (=> b!723518 m!677411))

(assert (=> b!723518 m!677411))

(declare-fun m!677413 () Bool)

(assert (=> b!723518 m!677413))

(assert (=> b!723515 m!677411))

(assert (=> b!723515 m!677411))

(declare-fun m!677415 () Bool)

(assert (=> b!723515 m!677415))

(assert (=> b!723515 m!677415))

(assert (=> b!723515 m!677411))

(declare-fun m!677417 () Bool)

(assert (=> b!723515 m!677417))

(assert (=> b!723513 m!677411))

(assert (=> b!723513 m!677411))

(declare-fun m!677419 () Bool)

(assert (=> b!723513 m!677419))

(declare-fun m!677421 () Bool)

(assert (=> b!723503 m!677421))

(declare-fun m!677423 () Bool)

(assert (=> b!723506 m!677423))

(declare-fun m!677425 () Bool)

(assert (=> b!723506 m!677425))

(declare-fun m!677427 () Bool)

(assert (=> b!723506 m!677427))

(assert (=> b!723506 m!677423))

(declare-fun m!677429 () Bool)

(assert (=> b!723506 m!677429))

(declare-fun m!677431 () Bool)

(assert (=> b!723506 m!677431))

(declare-fun m!677433 () Bool)

(assert (=> b!723517 m!677433))

(declare-fun m!677435 () Bool)

(assert (=> b!723508 m!677435))

(declare-fun m!677437 () Bool)

(assert (=> start!64346 m!677437))

(declare-fun m!677439 () Bool)

(assert (=> start!64346 m!677439))

(declare-fun m!677441 () Bool)

(assert (=> b!723511 m!677441))

(declare-fun m!677443 () Bool)

(assert (=> b!723504 m!677443))

(declare-fun m!677445 () Bool)

(assert (=> b!723514 m!677445))

(assert (=> b!723509 m!677411))

(assert (=> b!723509 m!677411))

(declare-fun m!677447 () Bool)

(assert (=> b!723509 m!677447))

(declare-fun m!677449 () Bool)

(assert (=> b!723507 m!677449))

(declare-fun m!677451 () Bool)

(assert (=> b!723507 m!677451))

(assert (=> b!723516 m!677411))

(assert (=> b!723516 m!677411))

(declare-fun m!677453 () Bool)

(assert (=> b!723516 m!677453))

(check-sat (not b!723503) (not b!723508) (not b!723516) (not b!723511) (not b!723504) (not b!723513) (not b!723506) (not b!723507) (not b!723515) (not b!723517) (not start!64346) (not b!723509) (not b!723518))
(check-sat)
