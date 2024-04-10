; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64328 () Bool)

(assert start!64328)

(declare-fun b!722897 () Bool)

(declare-fun e!405095 () Bool)

(declare-fun e!405094 () Bool)

(assert (=> b!722897 (= e!405095 e!405094)))

(declare-fun res!484545 () Bool)

(assert (=> b!722897 (=> (not res!484545) (not e!405094))))

(declare-datatypes ((SeekEntryResult!7177 0))(
  ( (MissingZero!7177 (index!31076 (_ BitVec 32))) (Found!7177 (index!31077 (_ BitVec 32))) (Intermediate!7177 (undefined!7989 Bool) (index!31078 (_ BitVec 32)) (x!62074 (_ BitVec 32))) (Undefined!7177) (MissingVacant!7177 (index!31079 (_ BitVec 32))) )
))
(declare-fun lt!320477 () SeekEntryResult!7177)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!722897 (= res!484545 (or (= lt!320477 (MissingZero!7177 i!1173)) (= lt!320477 (MissingVacant!7177 i!1173))))))

(declare-datatypes ((array!40909 0))(
  ( (array!40910 (arr!19577 (Array (_ BitVec 32) (_ BitVec 64))) (size!19998 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40909)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40909 (_ BitVec 32)) SeekEntryResult!7177)

(assert (=> b!722897 (= lt!320477 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!405092 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!722898 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40909 (_ BitVec 32)) SeekEntryResult!7177)

(assert (=> b!722898 (= e!405092 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19577 a!3186) j!159) a!3186 mask!3328) (Found!7177 j!159)))))

(declare-fun b!722899 () Bool)

(declare-fun res!484544 () Bool)

(assert (=> b!722899 (=> (not res!484544) (not e!405095))))

(declare-fun arrayContainsKey!0 (array!40909 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722899 (= res!484544 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!722900 () Bool)

(declare-fun res!484550 () Bool)

(declare-fun e!405093 () Bool)

(assert (=> b!722900 (=> (not res!484550) (not e!405093))))

(assert (=> b!722900 (= res!484550 e!405092)))

(declare-fun c!79549 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!722900 (= c!79549 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!722902 () Bool)

(declare-fun res!484552 () Bool)

(assert (=> b!722902 (=> (not res!484552) (not e!405095))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722902 (= res!484552 (validKeyInArray!0 k!2102))))

(declare-fun b!722903 () Bool)

(declare-fun res!484549 () Bool)

(assert (=> b!722903 (=> (not res!484549) (not e!405094))))

(declare-datatypes ((List!13579 0))(
  ( (Nil!13576) (Cons!13575 (h!14629 (_ BitVec 64)) (t!19894 List!13579)) )
))
(declare-fun arrayNoDuplicates!0 (array!40909 (_ BitVec 32) List!13579) Bool)

(assert (=> b!722903 (= res!484549 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13576))))

(declare-fun b!722904 () Bool)

(declare-fun res!484546 () Bool)

(assert (=> b!722904 (=> (not res!484546) (not e!405093))))

(assert (=> b!722904 (= res!484546 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19577 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!722905 () Bool)

(declare-fun res!484551 () Bool)

(assert (=> b!722905 (=> (not res!484551) (not e!405094))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40909 (_ BitVec 32)) Bool)

(assert (=> b!722905 (= res!484551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!722906 () Bool)

(declare-fun res!484553 () Bool)

(assert (=> b!722906 (=> (not res!484553) (not e!405095))))

(assert (=> b!722906 (= res!484553 (and (= (size!19998 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19998 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19998 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!722907 () Bool)

(assert (=> b!722907 (= e!405094 e!405093)))

(declare-fun res!484548 () Bool)

(assert (=> b!722907 (=> (not res!484548) (not e!405093))))

(declare-fun lt!320479 () SeekEntryResult!7177)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40909 (_ BitVec 32)) SeekEntryResult!7177)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722907 (= res!484548 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19577 a!3186) j!159) mask!3328) (select (arr!19577 a!3186) j!159) a!3186 mask!3328) lt!320479))))

(assert (=> b!722907 (= lt!320479 (Intermediate!7177 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!722908 () Bool)

(assert (=> b!722908 (= e!405092 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19577 a!3186) j!159) a!3186 mask!3328) lt!320479))))

(declare-fun b!722901 () Bool)

(declare-fun res!484547 () Bool)

(assert (=> b!722901 (=> (not res!484547) (not e!405095))))

(assert (=> b!722901 (= res!484547 (validKeyInArray!0 (select (arr!19577 a!3186) j!159)))))

(declare-fun res!484543 () Bool)

(assert (=> start!64328 (=> (not res!484543) (not e!405095))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64328 (= res!484543 (validMask!0 mask!3328))))

(assert (=> start!64328 e!405095))

(assert (=> start!64328 true))

(declare-fun array_inv!15373 (array!40909) Bool)

(assert (=> start!64328 (array_inv!15373 a!3186)))

(declare-fun b!722909 () Bool)

(assert (=> b!722909 (= e!405093 false)))

(declare-fun lt!320475 () array!40909)

(declare-fun lt!320480 () SeekEntryResult!7177)

(declare-fun lt!320476 () (_ BitVec 64))

(assert (=> b!722909 (= lt!320480 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320476 lt!320475 mask!3328))))

(declare-fun lt!320478 () SeekEntryResult!7177)

(assert (=> b!722909 (= lt!320478 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320476 mask!3328) lt!320476 lt!320475 mask!3328))))

(assert (=> b!722909 (= lt!320476 (select (store (arr!19577 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!722909 (= lt!320475 (array!40910 (store (arr!19577 a!3186) i!1173 k!2102) (size!19998 a!3186)))))

(declare-fun b!722910 () Bool)

(declare-fun res!484542 () Bool)

(assert (=> b!722910 (=> (not res!484542) (not e!405094))))

(assert (=> b!722910 (= res!484542 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19998 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19998 a!3186))))))

(assert (= (and start!64328 res!484543) b!722906))

(assert (= (and b!722906 res!484553) b!722901))

(assert (= (and b!722901 res!484547) b!722902))

(assert (= (and b!722902 res!484552) b!722899))

(assert (= (and b!722899 res!484544) b!722897))

(assert (= (and b!722897 res!484545) b!722905))

(assert (= (and b!722905 res!484551) b!722903))

(assert (= (and b!722903 res!484549) b!722910))

(assert (= (and b!722910 res!484542) b!722907))

(assert (= (and b!722907 res!484548) b!722904))

(assert (= (and b!722904 res!484546) b!722900))

(assert (= (and b!722900 c!79549) b!722908))

(assert (= (and b!722900 (not c!79549)) b!722898))

(assert (= (and b!722900 res!484550) b!722909))

(declare-fun m!677381 () Bool)

(assert (=> start!64328 m!677381))

(declare-fun m!677383 () Bool)

(assert (=> start!64328 m!677383))

(declare-fun m!677385 () Bool)

(assert (=> b!722909 m!677385))

(declare-fun m!677387 () Bool)

(assert (=> b!722909 m!677387))

(declare-fun m!677389 () Bool)

(assert (=> b!722909 m!677389))

(assert (=> b!722909 m!677389))

(declare-fun m!677391 () Bool)

(assert (=> b!722909 m!677391))

(declare-fun m!677393 () Bool)

(assert (=> b!722909 m!677393))

(declare-fun m!677395 () Bool)

(assert (=> b!722899 m!677395))

(declare-fun m!677397 () Bool)

(assert (=> b!722905 m!677397))

(declare-fun m!677399 () Bool)

(assert (=> b!722897 m!677399))

(declare-fun m!677401 () Bool)

(assert (=> b!722901 m!677401))

(assert (=> b!722901 m!677401))

(declare-fun m!677403 () Bool)

(assert (=> b!722901 m!677403))

(assert (=> b!722898 m!677401))

(assert (=> b!722898 m!677401))

(declare-fun m!677405 () Bool)

(assert (=> b!722898 m!677405))

(assert (=> b!722907 m!677401))

(assert (=> b!722907 m!677401))

(declare-fun m!677407 () Bool)

(assert (=> b!722907 m!677407))

(assert (=> b!722907 m!677407))

(assert (=> b!722907 m!677401))

(declare-fun m!677409 () Bool)

(assert (=> b!722907 m!677409))

(declare-fun m!677411 () Bool)

(assert (=> b!722904 m!677411))

(assert (=> b!722908 m!677401))

(assert (=> b!722908 m!677401))

(declare-fun m!677413 () Bool)

(assert (=> b!722908 m!677413))

(declare-fun m!677415 () Bool)

(assert (=> b!722902 m!677415))

(declare-fun m!677417 () Bool)

(assert (=> b!722903 m!677417))

(push 1)

(assert (not b!722909))

(assert (not b!722901))

