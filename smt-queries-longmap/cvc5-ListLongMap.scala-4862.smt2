; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67014 () Bool)

(assert start!67014)

(declare-fun res!523075 () Bool)

(declare-fun e!430534 () Bool)

(assert (=> start!67014 (=> (not res!523075) (not e!430534))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67014 (= res!523075 (validMask!0 mask!3328))))

(assert (=> start!67014 e!430534))

(assert (=> start!67014 true))

(declare-datatypes ((array!42438 0))(
  ( (array!42439 (arr!20316 (Array (_ BitVec 32) (_ BitVec 64))) (size!20737 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42438)

(declare-fun array_inv!16112 (array!42438) Bool)

(assert (=> start!67014 (array_inv!16112 a!3186)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!430538 () Bool)

(declare-fun b!773420 () Bool)

(declare-datatypes ((SeekEntryResult!7916 0))(
  ( (MissingZero!7916 (index!34032 (_ BitVec 32))) (Found!7916 (index!34033 (_ BitVec 32))) (Intermediate!7916 (undefined!8728 Bool) (index!34034 (_ BitVec 32)) (x!64975 (_ BitVec 32))) (Undefined!7916) (MissingVacant!7916 (index!34035 (_ BitVec 32))) )
))
(declare-fun lt!344407 () SeekEntryResult!7916)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42438 (_ BitVec 32)) SeekEntryResult!7916)

(assert (=> b!773420 (= e!430538 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20316 a!3186) j!159) a!3186 mask!3328) lt!344407))))

(declare-fun b!773421 () Bool)

(declare-fun e!430535 () Bool)

(declare-fun e!430537 () Bool)

(assert (=> b!773421 (= e!430535 e!430537)))

(declare-fun res!523073 () Bool)

(assert (=> b!773421 (=> (not res!523073) (not e!430537))))

(declare-fun lt!344401 () SeekEntryResult!7916)

(declare-fun lt!344405 () SeekEntryResult!7916)

(assert (=> b!773421 (= res!523073 (= lt!344401 lt!344405))))

(declare-fun lt!344408 () array!42438)

(declare-fun lt!344403 () (_ BitVec 64))

(assert (=> b!773421 (= lt!344405 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344403 lt!344408 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773421 (= lt!344401 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344403 mask!3328) lt!344403 lt!344408 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!773421 (= lt!344403 (select (store (arr!20316 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!773421 (= lt!344408 (array!42439 (store (arr!20316 a!3186) i!1173 k!2102) (size!20737 a!3186)))))

(declare-fun b!773422 () Bool)

(declare-fun res!523077 () Bool)

(assert (=> b!773422 (=> (not res!523077) (not e!430534))))

(assert (=> b!773422 (= res!523077 (and (= (size!20737 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20737 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20737 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!773423 () Bool)

(declare-datatypes ((Unit!26678 0))(
  ( (Unit!26679) )
))
(declare-fun e!430540 () Unit!26678)

(declare-fun Unit!26680 () Unit!26678)

(assert (=> b!773423 (= e!430540 Unit!26680)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!344400 () SeekEntryResult!7916)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42438 (_ BitVec 32)) SeekEntryResult!7916)

(assert (=> b!773423 (= lt!344400 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20316 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!344404 () (_ BitVec 32))

(assert (=> b!773423 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344404 resIntermediateIndex!5 (select (arr!20316 a!3186) j!159) a!3186 mask!3328) (Found!7916 j!159))))

(declare-fun b!773424 () Bool)

(declare-fun res!523076 () Bool)

(declare-fun e!430539 () Bool)

(assert (=> b!773424 (=> (not res!523076) (not e!430539))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42438 (_ BitVec 32)) Bool)

(assert (=> b!773424 (= res!523076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!773425 () Bool)

(declare-fun res!523082 () Bool)

(assert (=> b!773425 (=> (not res!523082) (not e!430535))))

(assert (=> b!773425 (= res!523082 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20316 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!773426 () Bool)

(declare-fun Unit!26681 () Unit!26678)

(assert (=> b!773426 (= e!430540 Unit!26681)))

(assert (=> b!773426 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344404 (select (arr!20316 a!3186) j!159) a!3186 mask!3328) lt!344407)))

(declare-fun b!773427 () Bool)

(assert (=> b!773427 (= e!430534 e!430539)))

(declare-fun res!523078 () Bool)

(assert (=> b!773427 (=> (not res!523078) (not e!430539))))

(declare-fun lt!344399 () SeekEntryResult!7916)

(assert (=> b!773427 (= res!523078 (or (= lt!344399 (MissingZero!7916 i!1173)) (= lt!344399 (MissingVacant!7916 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42438 (_ BitVec 32)) SeekEntryResult!7916)

(assert (=> b!773427 (= lt!344399 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun e!430541 () Bool)

(declare-fun b!773428 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun lt!344398 () SeekEntryResult!7916)

(assert (=> b!773428 (= e!430541 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20316 a!3186) j!159) a!3186 mask!3328) lt!344398))))

(declare-fun b!773429 () Bool)

(declare-fun e!430532 () Bool)

(assert (=> b!773429 (= e!430532 true)))

(declare-fun lt!344402 () Unit!26678)

(assert (=> b!773429 (= lt!344402 e!430540)))

(declare-fun c!85575 () Bool)

(assert (=> b!773429 (= c!85575 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773429 (= lt!344404 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!773430 () Bool)

(declare-fun res!523067 () Bool)

(assert (=> b!773430 (=> (not res!523067) (not e!430534))))

(declare-fun arrayContainsKey!0 (array!42438 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!773430 (= res!523067 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!773431 () Bool)

(declare-fun res!523079 () Bool)

(assert (=> b!773431 (=> (not res!523079) (not e!430534))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!773431 (= res!523079 (validKeyInArray!0 (select (arr!20316 a!3186) j!159)))))

(declare-fun b!773432 () Bool)

(assert (=> b!773432 (= e!430539 e!430535)))

(declare-fun res!523081 () Bool)

(assert (=> b!773432 (=> (not res!523081) (not e!430535))))

(assert (=> b!773432 (= res!523081 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20316 a!3186) j!159) mask!3328) (select (arr!20316 a!3186) j!159) a!3186 mask!3328) lt!344407))))

(assert (=> b!773432 (= lt!344407 (Intermediate!7916 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!773433 () Bool)

(declare-fun e!430533 () Bool)

(assert (=> b!773433 (= e!430533 e!430541)))

(declare-fun res!523068 () Bool)

(assert (=> b!773433 (=> (not res!523068) (not e!430541))))

(assert (=> b!773433 (= res!523068 (= (seekEntryOrOpen!0 (select (arr!20316 a!3186) j!159) a!3186 mask!3328) lt!344398))))

(assert (=> b!773433 (= lt!344398 (Found!7916 j!159))))

(declare-fun b!773434 () Bool)

(declare-fun res!523072 () Bool)

(assert (=> b!773434 (=> (not res!523072) (not e!430539))))

(assert (=> b!773434 (= res!523072 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20737 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20737 a!3186))))))

(declare-fun b!773435 () Bool)

(declare-fun res!523071 () Bool)

(assert (=> b!773435 (=> (not res!523071) (not e!430539))))

(declare-datatypes ((List!14318 0))(
  ( (Nil!14315) (Cons!14314 (h!15419 (_ BitVec 64)) (t!20633 List!14318)) )
))
(declare-fun arrayNoDuplicates!0 (array!42438 (_ BitVec 32) List!14318) Bool)

(assert (=> b!773435 (= res!523071 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14315))))

(declare-fun b!773436 () Bool)

(assert (=> b!773436 (= e!430538 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20316 a!3186) j!159) a!3186 mask!3328) (Found!7916 j!159)))))

(declare-fun b!773437 () Bool)

(declare-fun res!523080 () Bool)

(assert (=> b!773437 (=> (not res!523080) (not e!430535))))

(assert (=> b!773437 (= res!523080 e!430538)))

(declare-fun c!85576 () Bool)

(assert (=> b!773437 (= c!85576 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!773438 () Bool)

(assert (=> b!773438 (= e!430537 (not e!430532))))

(declare-fun res!523070 () Bool)

(assert (=> b!773438 (=> res!523070 e!430532)))

(assert (=> b!773438 (= res!523070 (or (not (is-Intermediate!7916 lt!344405)) (bvsge x!1131 (x!64975 lt!344405))))))

(assert (=> b!773438 e!430533))

(declare-fun res!523074 () Bool)

(assert (=> b!773438 (=> (not res!523074) (not e!430533))))

(assert (=> b!773438 (= res!523074 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!344406 () Unit!26678)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42438 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26678)

(assert (=> b!773438 (= lt!344406 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!773439 () Bool)

(declare-fun res!523069 () Bool)

(assert (=> b!773439 (=> (not res!523069) (not e!430534))))

(assert (=> b!773439 (= res!523069 (validKeyInArray!0 k!2102))))

(assert (= (and start!67014 res!523075) b!773422))

(assert (= (and b!773422 res!523077) b!773431))

(assert (= (and b!773431 res!523079) b!773439))

(assert (= (and b!773439 res!523069) b!773430))

(assert (= (and b!773430 res!523067) b!773427))

(assert (= (and b!773427 res!523078) b!773424))

(assert (= (and b!773424 res!523076) b!773435))

(assert (= (and b!773435 res!523071) b!773434))

(assert (= (and b!773434 res!523072) b!773432))

(assert (= (and b!773432 res!523081) b!773425))

(assert (= (and b!773425 res!523082) b!773437))

(assert (= (and b!773437 c!85576) b!773420))

(assert (= (and b!773437 (not c!85576)) b!773436))

(assert (= (and b!773437 res!523080) b!773421))

(assert (= (and b!773421 res!523073) b!773438))

(assert (= (and b!773438 res!523074) b!773433))

(assert (= (and b!773433 res!523068) b!773428))

(assert (= (and b!773438 (not res!523070)) b!773429))

(assert (= (and b!773429 c!85575) b!773426))

(assert (= (and b!773429 (not c!85575)) b!773423))

(declare-fun m!718151 () Bool)

(assert (=> b!773435 m!718151))

(declare-fun m!718153 () Bool)

(assert (=> b!773426 m!718153))

(assert (=> b!773426 m!718153))

(declare-fun m!718155 () Bool)

(assert (=> b!773426 m!718155))

(declare-fun m!718157 () Bool)

(assert (=> b!773424 m!718157))

(assert (=> b!773420 m!718153))

(assert (=> b!773420 m!718153))

(declare-fun m!718159 () Bool)

(assert (=> b!773420 m!718159))

(declare-fun m!718161 () Bool)

(assert (=> b!773438 m!718161))

(declare-fun m!718163 () Bool)

(assert (=> b!773438 m!718163))

(declare-fun m!718165 () Bool)

(assert (=> b!773430 m!718165))

(assert (=> b!773433 m!718153))

(assert (=> b!773433 m!718153))

(declare-fun m!718167 () Bool)

(assert (=> b!773433 m!718167))

(assert (=> b!773423 m!718153))

(assert (=> b!773423 m!718153))

(declare-fun m!718169 () Bool)

(assert (=> b!773423 m!718169))

(assert (=> b!773423 m!718153))

(declare-fun m!718171 () Bool)

(assert (=> b!773423 m!718171))

(assert (=> b!773431 m!718153))

(assert (=> b!773431 m!718153))

(declare-fun m!718173 () Bool)

(assert (=> b!773431 m!718173))

(assert (=> b!773436 m!718153))

(assert (=> b!773436 m!718153))

(assert (=> b!773436 m!718169))

(declare-fun m!718175 () Bool)

(assert (=> b!773421 m!718175))

(declare-fun m!718177 () Bool)

(assert (=> b!773421 m!718177))

(declare-fun m!718179 () Bool)

(assert (=> b!773421 m!718179))

(declare-fun m!718181 () Bool)

(assert (=> b!773421 m!718181))

(declare-fun m!718183 () Bool)

(assert (=> b!773421 m!718183))

(assert (=> b!773421 m!718175))

(declare-fun m!718185 () Bool)

(assert (=> b!773429 m!718185))

(declare-fun m!718187 () Bool)

(assert (=> b!773439 m!718187))

(assert (=> b!773432 m!718153))

(assert (=> b!773432 m!718153))

(declare-fun m!718189 () Bool)

(assert (=> b!773432 m!718189))

(assert (=> b!773432 m!718189))

(assert (=> b!773432 m!718153))

(declare-fun m!718191 () Bool)

(assert (=> b!773432 m!718191))

(declare-fun m!718193 () Bool)

(assert (=> b!773425 m!718193))

(assert (=> b!773428 m!718153))

(assert (=> b!773428 m!718153))

(declare-fun m!718195 () Bool)

(assert (=> b!773428 m!718195))

(declare-fun m!718197 () Bool)

(assert (=> b!773427 m!718197))

(declare-fun m!718199 () Bool)

(assert (=> start!67014 m!718199))

(declare-fun m!718201 () Bool)

(assert (=> start!67014 m!718201))

(push 1)

