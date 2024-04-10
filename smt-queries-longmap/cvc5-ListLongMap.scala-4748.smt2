; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65548 () Bool)

(assert start!65548)

(declare-fun b!748486 () Bool)

(declare-fun e!417767 () Bool)

(declare-fun e!417759 () Bool)

(assert (=> b!748486 (= e!417767 e!417759)))

(declare-fun res!504917 () Bool)

(assert (=> b!748486 (=> (not res!504917) (not e!417759))))

(declare-datatypes ((array!41721 0))(
  ( (array!41722 (arr!19974 (Array (_ BitVec 32) (_ BitVec 64))) (size!20395 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41721)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7574 0))(
  ( (MissingZero!7574 (index!32664 (_ BitVec 32))) (Found!7574 (index!32665 (_ BitVec 32))) (Intermediate!7574 (undefined!8386 Bool) (index!32666 (_ BitVec 32)) (x!63604 (_ BitVec 32))) (Undefined!7574) (MissingVacant!7574 (index!32667 (_ BitVec 32))) )
))
(declare-fun lt!332730 () SeekEntryResult!7574)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41721 (_ BitVec 32)) SeekEntryResult!7574)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!748486 (= res!504917 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19974 a!3186) j!159) mask!3328) (select (arr!19974 a!3186) j!159) a!3186 mask!3328) lt!332730))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!748486 (= lt!332730 (Intermediate!7574 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!748487 () Bool)

(declare-fun res!504903 () Bool)

(declare-fun e!417762 () Bool)

(assert (=> b!748487 (=> (not res!504903) (not e!417762))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!748487 (= res!504903 (validKeyInArray!0 (select (arr!19974 a!3186) j!159)))))

(declare-fun b!748489 () Bool)

(declare-fun e!417764 () Bool)

(assert (=> b!748489 (= e!417759 e!417764)))

(declare-fun res!504905 () Bool)

(assert (=> b!748489 (=> (not res!504905) (not e!417764))))

(declare-fun lt!332729 () SeekEntryResult!7574)

(declare-fun lt!332726 () SeekEntryResult!7574)

(assert (=> b!748489 (= res!504905 (= lt!332729 lt!332726))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!332728 () array!41721)

(declare-fun lt!332727 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!748489 (= lt!332726 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332727 lt!332728 mask!3328))))

(assert (=> b!748489 (= lt!332729 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332727 mask!3328) lt!332727 lt!332728 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!748489 (= lt!332727 (select (store (arr!19974 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!748489 (= lt!332728 (array!41722 (store (arr!19974 a!3186) i!1173 k!2102) (size!20395 a!3186)))))

(declare-fun b!748490 () Bool)

(declare-fun lt!332731 () SeekEntryResult!7574)

(declare-fun e!417766 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41721 (_ BitVec 32)) SeekEntryResult!7574)

(assert (=> b!748490 (= e!417766 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19974 a!3186) j!159) a!3186 mask!3328) lt!332731))))

(declare-fun b!748491 () Bool)

(declare-datatypes ((Unit!25676 0))(
  ( (Unit!25677) )
))
(declare-fun e!417765 () Unit!25676)

(declare-fun Unit!25678 () Unit!25676)

(assert (=> b!748491 (= e!417765 Unit!25678)))

(declare-fun b!748492 () Bool)

(declare-fun res!504904 () Bool)

(declare-fun e!417760 () Bool)

(assert (=> b!748492 (=> res!504904 e!417760)))

(assert (=> b!748492 (= res!504904 (= (select (store (arr!19974 a!3186) i!1173 k!2102) index!1321) lt!332727))))

(declare-fun b!748493 () Bool)

(declare-fun e!417763 () Bool)

(assert (=> b!748493 (= e!417763 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19974 a!3186) j!159) a!3186 mask!3328) lt!332730))))

(declare-fun b!748494 () Bool)

(assert (=> b!748494 (= e!417764 (not e!417760))))

(declare-fun res!504909 () Bool)

(assert (=> b!748494 (=> res!504909 e!417760)))

(assert (=> b!748494 (= res!504909 (or (not (is-Intermediate!7574 lt!332726)) (bvslt x!1131 (x!63604 lt!332726)) (not (= x!1131 (x!63604 lt!332726))) (not (= index!1321 (index!32666 lt!332726)))))))

(assert (=> b!748494 e!417766))

(declare-fun res!504902 () Bool)

(assert (=> b!748494 (=> (not res!504902) (not e!417766))))

(declare-fun lt!332732 () SeekEntryResult!7574)

(assert (=> b!748494 (= res!504902 (= lt!332732 lt!332731))))

(assert (=> b!748494 (= lt!332731 (Found!7574 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41721 (_ BitVec 32)) SeekEntryResult!7574)

(assert (=> b!748494 (= lt!332732 (seekEntryOrOpen!0 (select (arr!19974 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41721 (_ BitVec 32)) Bool)

(assert (=> b!748494 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!332734 () Unit!25676)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41721 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25676)

(assert (=> b!748494 (= lt!332734 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!748495 () Bool)

(declare-fun res!504912 () Bool)

(assert (=> b!748495 (=> (not res!504912) (not e!417767))))

(assert (=> b!748495 (= res!504912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!748496 () Bool)

(assert (=> b!748496 (= e!417760 true)))

(assert (=> b!748496 (= (select (store (arr!19974 a!3186) i!1173 k!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332733 () Unit!25676)

(assert (=> b!748496 (= lt!332733 e!417765)))

(declare-fun c!82173 () Bool)

(assert (=> b!748496 (= c!82173 (= (select (store (arr!19974 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!748497 () Bool)

(declare-fun res!504913 () Bool)

(assert (=> b!748497 (=> (not res!504913) (not e!417759))))

(assert (=> b!748497 (= res!504913 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19974 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!748498 () Bool)

(declare-fun res!504901 () Bool)

(assert (=> b!748498 (=> (not res!504901) (not e!417762))))

(assert (=> b!748498 (= res!504901 (validKeyInArray!0 k!2102))))

(declare-fun b!748488 () Bool)

(declare-fun Unit!25679 () Unit!25676)

(assert (=> b!748488 (= e!417765 Unit!25679)))

(assert (=> b!748488 false))

(declare-fun res!504914 () Bool)

(assert (=> start!65548 (=> (not res!504914) (not e!417762))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65548 (= res!504914 (validMask!0 mask!3328))))

(assert (=> start!65548 e!417762))

(assert (=> start!65548 true))

(declare-fun array_inv!15770 (array!41721) Bool)

(assert (=> start!65548 (array_inv!15770 a!3186)))

(declare-fun b!748499 () Bool)

(declare-fun res!504906 () Bool)

(assert (=> b!748499 (=> (not res!504906) (not e!417767))))

(assert (=> b!748499 (= res!504906 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20395 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20395 a!3186))))))

(declare-fun b!748500 () Bool)

(declare-fun res!504908 () Bool)

(assert (=> b!748500 (=> (not res!504908) (not e!417767))))

(declare-datatypes ((List!13976 0))(
  ( (Nil!13973) (Cons!13972 (h!15044 (_ BitVec 64)) (t!20291 List!13976)) )
))
(declare-fun arrayNoDuplicates!0 (array!41721 (_ BitVec 32) List!13976) Bool)

(assert (=> b!748500 (= res!504908 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13973))))

(declare-fun b!748501 () Bool)

(declare-fun res!504915 () Bool)

(assert (=> b!748501 (=> (not res!504915) (not e!417762))))

(declare-fun arrayContainsKey!0 (array!41721 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!748501 (= res!504915 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!748502 () Bool)

(declare-fun res!504907 () Bool)

(assert (=> b!748502 (=> (not res!504907) (not e!417762))))

(assert (=> b!748502 (= res!504907 (and (= (size!20395 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20395 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20395 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!748503 () Bool)

(assert (=> b!748503 (= e!417763 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19974 a!3186) j!159) a!3186 mask!3328) (Found!7574 j!159)))))

(declare-fun b!748504 () Bool)

(declare-fun res!504911 () Bool)

(assert (=> b!748504 (=> res!504911 e!417760)))

(assert (=> b!748504 (= res!504911 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19974 a!3186) j!159) a!3186 mask!3328) lt!332731)))))

(declare-fun b!748505 () Bool)

(declare-fun res!504916 () Bool)

(assert (=> b!748505 (=> (not res!504916) (not e!417759))))

(assert (=> b!748505 (= res!504916 e!417763)))

(declare-fun c!82174 () Bool)

(assert (=> b!748505 (= c!82174 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!748506 () Bool)

(assert (=> b!748506 (= e!417762 e!417767)))

(declare-fun res!504910 () Bool)

(assert (=> b!748506 (=> (not res!504910) (not e!417767))))

(declare-fun lt!332735 () SeekEntryResult!7574)

(assert (=> b!748506 (= res!504910 (or (= lt!332735 (MissingZero!7574 i!1173)) (= lt!332735 (MissingVacant!7574 i!1173))))))

(assert (=> b!748506 (= lt!332735 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!65548 res!504914) b!748502))

(assert (= (and b!748502 res!504907) b!748487))

(assert (= (and b!748487 res!504903) b!748498))

(assert (= (and b!748498 res!504901) b!748501))

(assert (= (and b!748501 res!504915) b!748506))

(assert (= (and b!748506 res!504910) b!748495))

(assert (= (and b!748495 res!504912) b!748500))

(assert (= (and b!748500 res!504908) b!748499))

(assert (= (and b!748499 res!504906) b!748486))

(assert (= (and b!748486 res!504917) b!748497))

(assert (= (and b!748497 res!504913) b!748505))

(assert (= (and b!748505 c!82174) b!748493))

(assert (= (and b!748505 (not c!82174)) b!748503))

(assert (= (and b!748505 res!504916) b!748489))

(assert (= (and b!748489 res!504905) b!748494))

(assert (= (and b!748494 res!504902) b!748490))

(assert (= (and b!748494 (not res!504909)) b!748504))

(assert (= (and b!748504 (not res!504911)) b!748492))

(assert (= (and b!748492 (not res!504904)) b!748496))

(assert (= (and b!748496 c!82173) b!748488))

(assert (= (and b!748496 (not c!82173)) b!748491))

(declare-fun m!698317 () Bool)

(assert (=> b!748493 m!698317))

(assert (=> b!748493 m!698317))

(declare-fun m!698319 () Bool)

(assert (=> b!748493 m!698319))

(declare-fun m!698321 () Bool)

(assert (=> start!65548 m!698321))

(declare-fun m!698323 () Bool)

(assert (=> start!65548 m!698323))

(declare-fun m!698325 () Bool)

(assert (=> b!748498 m!698325))

(assert (=> b!748504 m!698317))

(assert (=> b!748504 m!698317))

(declare-fun m!698327 () Bool)

(assert (=> b!748504 m!698327))

(declare-fun m!698329 () Bool)

(assert (=> b!748497 m!698329))

(assert (=> b!748487 m!698317))

(assert (=> b!748487 m!698317))

(declare-fun m!698331 () Bool)

(assert (=> b!748487 m!698331))

(declare-fun m!698333 () Bool)

(assert (=> b!748506 m!698333))

(declare-fun m!698335 () Bool)

(assert (=> b!748495 m!698335))

(assert (=> b!748503 m!698317))

(assert (=> b!748503 m!698317))

(assert (=> b!748503 m!698327))

(assert (=> b!748490 m!698317))

(assert (=> b!748490 m!698317))

(declare-fun m!698337 () Bool)

(assert (=> b!748490 m!698337))

(declare-fun m!698339 () Bool)

(assert (=> b!748496 m!698339))

(declare-fun m!698341 () Bool)

(assert (=> b!748496 m!698341))

(declare-fun m!698343 () Bool)

(assert (=> b!748500 m!698343))

(assert (=> b!748492 m!698339))

(assert (=> b!748492 m!698341))

(assert (=> b!748494 m!698317))

(assert (=> b!748494 m!698317))

(declare-fun m!698345 () Bool)

(assert (=> b!748494 m!698345))

(declare-fun m!698347 () Bool)

(assert (=> b!748494 m!698347))

(declare-fun m!698349 () Bool)

(assert (=> b!748494 m!698349))

(declare-fun m!698351 () Bool)

(assert (=> b!748501 m!698351))

(assert (=> b!748486 m!698317))

(assert (=> b!748486 m!698317))

(declare-fun m!698353 () Bool)

(assert (=> b!748486 m!698353))

(assert (=> b!748486 m!698353))

(assert (=> b!748486 m!698317))

(declare-fun m!698355 () Bool)

(assert (=> b!748486 m!698355))

(declare-fun m!698357 () Bool)

(assert (=> b!748489 m!698357))

(declare-fun m!698359 () Bool)

(assert (=> b!748489 m!698359))

(declare-fun m!698361 () Bool)

(assert (=> b!748489 m!698361))

(assert (=> b!748489 m!698339))

(declare-fun m!698363 () Bool)

(assert (=> b!748489 m!698363))

(assert (=> b!748489 m!698357))

(push 1)

