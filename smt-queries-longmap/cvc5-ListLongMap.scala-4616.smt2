; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64330 () Bool)

(assert start!64330)

(declare-fun b!722939 () Bool)

(declare-fun res!484583 () Bool)

(declare-fun e!405108 () Bool)

(assert (=> b!722939 (=> (not res!484583) (not e!405108))))

(declare-datatypes ((array!40911 0))(
  ( (array!40912 (arr!19578 (Array (_ BitVec 32) (_ BitVec 64))) (size!19999 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40911)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!722939 (= res!484583 (and (= (size!19999 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19999 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19999 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!722940 () Bool)

(declare-fun res!484586 () Bool)

(declare-fun e!405106 () Bool)

(assert (=> b!722940 (=> (not res!484586) (not e!405106))))

(declare-fun e!405109 () Bool)

(assert (=> b!722940 (= res!484586 e!405109)))

(declare-fun c!79552 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!722940 (= c!79552 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!722941 () Bool)

(declare-fun res!484579 () Bool)

(assert (=> b!722941 (=> (not res!484579) (not e!405108))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722941 (= res!484579 (validKeyInArray!0 k!2102))))

(declare-fun b!722942 () Bool)

(declare-fun res!484580 () Bool)

(declare-fun e!405107 () Bool)

(assert (=> b!722942 (=> (not res!484580) (not e!405107))))

(declare-datatypes ((List!13580 0))(
  ( (Nil!13577) (Cons!13576 (h!14630 (_ BitVec 64)) (t!19895 List!13580)) )
))
(declare-fun arrayNoDuplicates!0 (array!40911 (_ BitVec 32) List!13580) Bool)

(assert (=> b!722942 (= res!484580 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13577))))

(declare-fun b!722943 () Bool)

(declare-fun res!484587 () Bool)

(assert (=> b!722943 (=> (not res!484587) (not e!405108))))

(assert (=> b!722943 (= res!484587 (validKeyInArray!0 (select (arr!19578 a!3186) j!159)))))

(declare-fun b!722945 () Bool)

(declare-fun res!484578 () Bool)

(assert (=> b!722945 (=> (not res!484578) (not e!405108))))

(declare-fun arrayContainsKey!0 (array!40911 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722945 (= res!484578 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!7178 0))(
  ( (MissingZero!7178 (index!31080 (_ BitVec 32))) (Found!7178 (index!31081 (_ BitVec 32))) (Intermediate!7178 (undefined!7990 Bool) (index!31082 (_ BitVec 32)) (x!62083 (_ BitVec 32))) (Undefined!7178) (MissingVacant!7178 (index!31083 (_ BitVec 32))) )
))
(declare-fun lt!320498 () SeekEntryResult!7178)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!722946 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40911 (_ BitVec 32)) SeekEntryResult!7178)

(assert (=> b!722946 (= e!405109 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19578 a!3186) j!159) a!3186 mask!3328) lt!320498))))

(declare-fun b!722947 () Bool)

(declare-fun res!484584 () Bool)

(assert (=> b!722947 (=> (not res!484584) (not e!405107))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!722947 (= res!484584 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19999 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19999 a!3186))))))

(declare-fun b!722948 () Bool)

(assert (=> b!722948 (= e!405107 e!405106)))

(declare-fun res!484588 () Bool)

(assert (=> b!722948 (=> (not res!484588) (not e!405106))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722948 (= res!484588 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19578 a!3186) j!159) mask!3328) (select (arr!19578 a!3186) j!159) a!3186 mask!3328) lt!320498))))

(assert (=> b!722948 (= lt!320498 (Intermediate!7178 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!484585 () Bool)

(assert (=> start!64330 (=> (not res!484585) (not e!405108))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64330 (= res!484585 (validMask!0 mask!3328))))

(assert (=> start!64330 e!405108))

(assert (=> start!64330 true))

(declare-fun array_inv!15374 (array!40911) Bool)

(assert (=> start!64330 (array_inv!15374 a!3186)))

(declare-fun b!722944 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40911 (_ BitVec 32)) SeekEntryResult!7178)

(assert (=> b!722944 (= e!405109 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19578 a!3186) j!159) a!3186 mask!3328) (Found!7178 j!159)))))

(declare-fun b!722949 () Bool)

(declare-fun res!484581 () Bool)

(assert (=> b!722949 (=> (not res!484581) (not e!405106))))

(assert (=> b!722949 (= res!484581 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19578 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!722950 () Bool)

(assert (=> b!722950 (= e!405108 e!405107)))

(declare-fun res!484589 () Bool)

(assert (=> b!722950 (=> (not res!484589) (not e!405107))))

(declare-fun lt!320493 () SeekEntryResult!7178)

(assert (=> b!722950 (= res!484589 (or (= lt!320493 (MissingZero!7178 i!1173)) (= lt!320493 (MissingVacant!7178 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40911 (_ BitVec 32)) SeekEntryResult!7178)

(assert (=> b!722950 (= lt!320493 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!722951 () Bool)

(declare-fun res!484582 () Bool)

(assert (=> b!722951 (=> (not res!484582) (not e!405107))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40911 (_ BitVec 32)) Bool)

(assert (=> b!722951 (= res!484582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!722952 () Bool)

(assert (=> b!722952 (= e!405106 false)))

(declare-fun lt!320497 () array!40911)

(declare-fun lt!320494 () SeekEntryResult!7178)

(declare-fun lt!320495 () (_ BitVec 64))

(assert (=> b!722952 (= lt!320494 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320495 lt!320497 mask!3328))))

(declare-fun lt!320496 () SeekEntryResult!7178)

(assert (=> b!722952 (= lt!320496 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320495 mask!3328) lt!320495 lt!320497 mask!3328))))

(assert (=> b!722952 (= lt!320495 (select (store (arr!19578 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!722952 (= lt!320497 (array!40912 (store (arr!19578 a!3186) i!1173 k!2102) (size!19999 a!3186)))))

(assert (= (and start!64330 res!484585) b!722939))

(assert (= (and b!722939 res!484583) b!722943))

(assert (= (and b!722943 res!484587) b!722941))

(assert (= (and b!722941 res!484579) b!722945))

(assert (= (and b!722945 res!484578) b!722950))

(assert (= (and b!722950 res!484589) b!722951))

(assert (= (and b!722951 res!484582) b!722942))

(assert (= (and b!722942 res!484580) b!722947))

(assert (= (and b!722947 res!484584) b!722948))

(assert (= (and b!722948 res!484588) b!722949))

(assert (= (and b!722949 res!484581) b!722940))

(assert (= (and b!722940 c!79552) b!722946))

(assert (= (and b!722940 (not c!79552)) b!722944))

(assert (= (and b!722940 res!484586) b!722952))

(declare-fun m!677419 () Bool)

(assert (=> b!722946 m!677419))

(assert (=> b!722946 m!677419))

(declare-fun m!677421 () Bool)

(assert (=> b!722946 m!677421))

(declare-fun m!677423 () Bool)

(assert (=> b!722942 m!677423))

(assert (=> b!722944 m!677419))

(assert (=> b!722944 m!677419))

(declare-fun m!677425 () Bool)

(assert (=> b!722944 m!677425))

(declare-fun m!677427 () Bool)

(assert (=> b!722952 m!677427))

(declare-fun m!677429 () Bool)

(assert (=> b!722952 m!677429))

(declare-fun m!677431 () Bool)

(assert (=> b!722952 m!677431))

(assert (=> b!722952 m!677427))

(declare-fun m!677433 () Bool)

(assert (=> b!722952 m!677433))

(declare-fun m!677435 () Bool)

(assert (=> b!722952 m!677435))

(declare-fun m!677437 () Bool)

(assert (=> b!722950 m!677437))

(declare-fun m!677439 () Bool)

(assert (=> b!722945 m!677439))

(declare-fun m!677441 () Bool)

(assert (=> start!64330 m!677441))

(declare-fun m!677443 () Bool)

(assert (=> start!64330 m!677443))

(declare-fun m!677445 () Bool)

(assert (=> b!722949 m!677445))

(declare-fun m!677447 () Bool)

(assert (=> b!722941 m!677447))

(declare-fun m!677449 () Bool)

(assert (=> b!722951 m!677449))

(assert (=> b!722948 m!677419))

(assert (=> b!722948 m!677419))

(declare-fun m!677451 () Bool)

(assert (=> b!722948 m!677451))

(assert (=> b!722948 m!677451))

(assert (=> b!722948 m!677419))

(declare-fun m!677453 () Bool)

(assert (=> b!722948 m!677453))

(assert (=> b!722943 m!677419))

(assert (=> b!722943 m!677419))

(declare-fun m!677455 () Bool)

(assert (=> b!722943 m!677455))

(push 1)

