; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65342 () Bool)

(assert start!65342)

(declare-fun b!742539 () Bool)

(declare-fun e!414975 () Bool)

(declare-fun e!414977 () Bool)

(assert (=> b!742539 (= e!414975 e!414977)))

(declare-fun res!499736 () Bool)

(assert (=> b!742539 (=> (not res!499736) (not e!414977))))

(declare-datatypes ((SeekEntryResult!7471 0))(
  ( (MissingZero!7471 (index!32252 (_ BitVec 32))) (Found!7471 (index!32253 (_ BitVec 32))) (Intermediate!7471 (undefined!8283 Bool) (index!32254 (_ BitVec 32)) (x!63221 (_ BitVec 32))) (Undefined!7471) (MissingVacant!7471 (index!32255 (_ BitVec 32))) )
))
(declare-fun lt!329864 () SeekEntryResult!7471)

(declare-fun lt!329870 () SeekEntryResult!7471)

(assert (=> b!742539 (= res!499736 (= lt!329864 lt!329870))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!329867 () (_ BitVec 64))

(declare-datatypes ((array!41515 0))(
  ( (array!41516 (arr!19871 (Array (_ BitVec 32) (_ BitVec 64))) (size!20292 (_ BitVec 32))) )
))
(declare-fun lt!329869 () array!41515)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41515 (_ BitVec 32)) SeekEntryResult!7471)

(assert (=> b!742539 (= lt!329870 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329867 lt!329869 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!742539 (= lt!329864 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329867 mask!3328) lt!329867 lt!329869 mask!3328))))

(declare-fun a!3186 () array!41515)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!742539 (= lt!329867 (select (store (arr!19871 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!742539 (= lt!329869 (array!41516 (store (arr!19871 a!3186) i!1173 k!2102) (size!20292 a!3186)))))

(declare-fun b!742540 () Bool)

(declare-fun e!414971 () Bool)

(assert (=> b!742540 (= e!414971 e!414975)))

(declare-fun res!499723 () Bool)

(assert (=> b!742540 (=> (not res!499723) (not e!414975))))

(declare-fun lt!329866 () SeekEntryResult!7471)

(assert (=> b!742540 (= res!499723 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19871 a!3186) j!159) mask!3328) (select (arr!19871 a!3186) j!159) a!3186 mask!3328) lt!329866))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!742540 (= lt!329866 (Intermediate!7471 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!742541 () Bool)

(declare-fun e!414969 () Bool)

(declare-fun e!414976 () Bool)

(assert (=> b!742541 (= e!414969 e!414976)))

(declare-fun res!499721 () Bool)

(assert (=> b!742541 (=> (not res!499721) (not e!414976))))

(declare-fun lt!329868 () SeekEntryResult!7471)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41515 (_ BitVec 32)) SeekEntryResult!7471)

(assert (=> b!742541 (= res!499721 (= (seekEntryOrOpen!0 (select (arr!19871 a!3186) j!159) a!3186 mask!3328) lt!329868))))

(assert (=> b!742541 (= lt!329868 (Found!7471 j!159))))

(declare-fun b!742542 () Bool)

(declare-fun e!414970 () Bool)

(assert (=> b!742542 (= e!414970 (or (not (= (select (store (arr!19871 a!3186) i!1173 k!2102) index!1321) lt!329867)) (undefined!8283 lt!329870) (bvsge mask!3328 #b00000000000000000000000000000000)))))

(declare-fun b!742543 () Bool)

(declare-fun res!499733 () Bool)

(assert (=> b!742543 (=> (not res!499733) (not e!414971))))

(declare-datatypes ((List!13873 0))(
  ( (Nil!13870) (Cons!13869 (h!14941 (_ BitVec 64)) (t!20188 List!13873)) )
))
(declare-fun arrayNoDuplicates!0 (array!41515 (_ BitVec 32) List!13873) Bool)

(assert (=> b!742543 (= res!499733 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13870))))

(declare-fun b!742544 () Bool)

(declare-fun res!499734 () Bool)

(declare-fun e!414974 () Bool)

(assert (=> b!742544 (=> (not res!499734) (not e!414974))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!742544 (= res!499734 (validKeyInArray!0 (select (arr!19871 a!3186) j!159)))))

(declare-fun b!742545 () Bool)

(assert (=> b!742545 (= e!414974 e!414971)))

(declare-fun res!499729 () Bool)

(assert (=> b!742545 (=> (not res!499729) (not e!414971))))

(declare-fun lt!329863 () SeekEntryResult!7471)

(assert (=> b!742545 (= res!499729 (or (= lt!329863 (MissingZero!7471 i!1173)) (= lt!329863 (MissingVacant!7471 i!1173))))))

(assert (=> b!742545 (= lt!329863 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!742546 () Bool)

(declare-fun res!499728 () Bool)

(assert (=> b!742546 (=> res!499728 e!414970)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41515 (_ BitVec 32)) SeekEntryResult!7471)

(assert (=> b!742546 (= res!499728 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19871 a!3186) j!159) a!3186 mask!3328) (Found!7471 j!159))))))

(declare-fun b!742547 () Bool)

(declare-fun res!499727 () Bool)

(assert (=> b!742547 (=> (not res!499727) (not e!414974))))

(declare-fun arrayContainsKey!0 (array!41515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!742547 (= res!499727 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!742548 () Bool)

(assert (=> b!742548 (= e!414976 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19871 a!3186) j!159) a!3186 mask!3328) lt!329868))))

(declare-fun b!742549 () Bool)

(declare-fun res!499724 () Bool)

(assert (=> b!742549 (=> (not res!499724) (not e!414974))))

(assert (=> b!742549 (= res!499724 (validKeyInArray!0 k!2102))))

(declare-fun res!499731 () Bool)

(assert (=> start!65342 (=> (not res!499731) (not e!414974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65342 (= res!499731 (validMask!0 mask!3328))))

(assert (=> start!65342 e!414974))

(assert (=> start!65342 true))

(declare-fun array_inv!15667 (array!41515) Bool)

(assert (=> start!65342 (array_inv!15667 a!3186)))

(declare-fun b!742550 () Bool)

(declare-fun e!414973 () Bool)

(assert (=> b!742550 (= e!414973 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19871 a!3186) j!159) a!3186 mask!3328) (Found!7471 j!159)))))

(declare-fun b!742551 () Bool)

(declare-fun res!499722 () Bool)

(assert (=> b!742551 (=> (not res!499722) (not e!414974))))

(assert (=> b!742551 (= res!499722 (and (= (size!20292 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20292 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20292 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!742552 () Bool)

(declare-fun res!499725 () Bool)

(assert (=> b!742552 (=> (not res!499725) (not e!414971))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41515 (_ BitVec 32)) Bool)

(assert (=> b!742552 (= res!499725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!742553 () Bool)

(declare-fun res!499732 () Bool)

(assert (=> b!742553 (=> (not res!499732) (not e!414975))))

(assert (=> b!742553 (= res!499732 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19871 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!742554 () Bool)

(assert (=> b!742554 (= e!414977 (not e!414970))))

(declare-fun res!499726 () Bool)

(assert (=> b!742554 (=> res!499726 e!414970)))

(assert (=> b!742554 (= res!499726 (or (not (is-Intermediate!7471 lt!329870)) (bvslt x!1131 (x!63221 lt!329870)) (not (= x!1131 (x!63221 lt!329870))) (not (= index!1321 (index!32254 lt!329870)))))))

(assert (=> b!742554 e!414969))

(declare-fun res!499735 () Bool)

(assert (=> b!742554 (=> (not res!499735) (not e!414969))))

(assert (=> b!742554 (= res!499735 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25422 0))(
  ( (Unit!25423) )
))
(declare-fun lt!329865 () Unit!25422)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41515 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25422)

(assert (=> b!742554 (= lt!329865 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!742555 () Bool)

(assert (=> b!742555 (= e!414973 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19871 a!3186) j!159) a!3186 mask!3328) lt!329866))))

(declare-fun b!742556 () Bool)

(declare-fun res!499720 () Bool)

(assert (=> b!742556 (=> (not res!499720) (not e!414975))))

(assert (=> b!742556 (= res!499720 e!414973)))

(declare-fun c!81790 () Bool)

(assert (=> b!742556 (= c!81790 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!742557 () Bool)

(declare-fun res!499730 () Bool)

(assert (=> b!742557 (=> (not res!499730) (not e!414971))))

(assert (=> b!742557 (= res!499730 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20292 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20292 a!3186))))))

(assert (= (and start!65342 res!499731) b!742551))

(assert (= (and b!742551 res!499722) b!742544))

(assert (= (and b!742544 res!499734) b!742549))

(assert (= (and b!742549 res!499724) b!742547))

(assert (= (and b!742547 res!499727) b!742545))

(assert (= (and b!742545 res!499729) b!742552))

(assert (= (and b!742552 res!499725) b!742543))

(assert (= (and b!742543 res!499733) b!742557))

(assert (= (and b!742557 res!499730) b!742540))

(assert (= (and b!742540 res!499723) b!742553))

(assert (= (and b!742553 res!499732) b!742556))

(assert (= (and b!742556 c!81790) b!742555))

(assert (= (and b!742556 (not c!81790)) b!742550))

(assert (= (and b!742556 res!499720) b!742539))

(assert (= (and b!742539 res!499736) b!742554))

(assert (= (and b!742554 res!499735) b!742541))

(assert (= (and b!742541 res!499721) b!742548))

(assert (= (and b!742554 (not res!499726)) b!742546))

(assert (= (and b!742546 (not res!499728)) b!742542))

(declare-fun m!693385 () Bool)

(assert (=> b!742554 m!693385))

(declare-fun m!693387 () Bool)

(assert (=> b!742554 m!693387))

(declare-fun m!693389 () Bool)

(assert (=> b!742555 m!693389))

(assert (=> b!742555 m!693389))

(declare-fun m!693391 () Bool)

(assert (=> b!742555 m!693391))

(declare-fun m!693393 () Bool)

(assert (=> b!742545 m!693393))

(assert (=> b!742550 m!693389))

(assert (=> b!742550 m!693389))

(declare-fun m!693395 () Bool)

(assert (=> b!742550 m!693395))

(declare-fun m!693397 () Bool)

(assert (=> b!742543 m!693397))

(declare-fun m!693399 () Bool)

(assert (=> b!742553 m!693399))

(assert (=> b!742546 m!693389))

(assert (=> b!742546 m!693389))

(assert (=> b!742546 m!693395))

(assert (=> b!742544 m!693389))

(assert (=> b!742544 m!693389))

(declare-fun m!693401 () Bool)

(assert (=> b!742544 m!693401))

(declare-fun m!693403 () Bool)

(assert (=> b!742547 m!693403))

(declare-fun m!693405 () Bool)

(assert (=> b!742549 m!693405))

(declare-fun m!693407 () Bool)

(assert (=> b!742552 m!693407))

(assert (=> b!742548 m!693389))

(assert (=> b!742548 m!693389))

(declare-fun m!693409 () Bool)

(assert (=> b!742548 m!693409))

(declare-fun m!693411 () Bool)

(assert (=> start!65342 m!693411))

(declare-fun m!693413 () Bool)

(assert (=> start!65342 m!693413))

(declare-fun m!693415 () Bool)

(assert (=> b!742539 m!693415))

(declare-fun m!693417 () Bool)

(assert (=> b!742539 m!693417))

(declare-fun m!693419 () Bool)

(assert (=> b!742539 m!693419))

(declare-fun m!693421 () Bool)

(assert (=> b!742539 m!693421))

(declare-fun m!693423 () Bool)

(assert (=> b!742539 m!693423))

(assert (=> b!742539 m!693417))

(assert (=> b!742542 m!693421))

(declare-fun m!693425 () Bool)

(assert (=> b!742542 m!693425))

(assert (=> b!742540 m!693389))

(assert (=> b!742540 m!693389))

(declare-fun m!693427 () Bool)

(assert (=> b!742540 m!693427))

(assert (=> b!742540 m!693427))

(assert (=> b!742540 m!693389))

(declare-fun m!693429 () Bool)

(assert (=> b!742540 m!693429))

(assert (=> b!742541 m!693389))

(assert (=> b!742541 m!693389))

(declare-fun m!693431 () Bool)

(assert (=> b!742541 m!693431))

(push 1)

