; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65714 () Bool)

(assert start!65714)

(declare-fun b!754046 () Bool)

(declare-fun e!420546 () Bool)

(declare-fun e!420549 () Bool)

(assert (=> b!754046 (= e!420546 e!420549)))

(declare-fun res!509472 () Bool)

(assert (=> b!754046 (=> (not res!509472) (not e!420549))))

(declare-datatypes ((SeekEntryResult!7657 0))(
  ( (MissingZero!7657 (index!32996 (_ BitVec 32))) (Found!7657 (index!32997 (_ BitVec 32))) (Intermediate!7657 (undefined!8469 Bool) (index!32998 (_ BitVec 32)) (x!63903 (_ BitVec 32))) (Undefined!7657) (MissingVacant!7657 (index!32999 (_ BitVec 32))) )
))
(declare-fun lt!335541 () SeekEntryResult!7657)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!754046 (= res!509472 (or (= lt!335541 (MissingZero!7657 i!1173)) (= lt!335541 (MissingVacant!7657 i!1173))))))

(declare-datatypes ((array!41887 0))(
  ( (array!41888 (arr!20057 (Array (_ BitVec 32) (_ BitVec 64))) (size!20478 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41887)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41887 (_ BitVec 32)) SeekEntryResult!7657)

(assert (=> b!754046 (= lt!335541 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!754047 () Bool)

(declare-datatypes ((Unit!26008 0))(
  ( (Unit!26009) )
))
(declare-fun e!420552 () Unit!26008)

(declare-fun Unit!26010 () Unit!26008)

(assert (=> b!754047 (= e!420552 Unit!26010)))

(assert (=> b!754047 false))

(declare-fun b!754048 () Bool)

(declare-fun res!509469 () Bool)

(assert (=> b!754048 (=> (not res!509469) (not e!420546))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!754048 (= res!509469 (validKeyInArray!0 k!2102))))

(declare-fun b!754049 () Bool)

(declare-fun res!509477 () Bool)

(assert (=> b!754049 (=> (not res!509477) (not e!420549))))

(declare-datatypes ((List!14059 0))(
  ( (Nil!14056) (Cons!14055 (h!15127 (_ BitVec 64)) (t!20374 List!14059)) )
))
(declare-fun arrayNoDuplicates!0 (array!41887 (_ BitVec 32) List!14059) Bool)

(assert (=> b!754049 (= res!509477 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14056))))

(declare-fun b!754050 () Bool)

(declare-fun res!509480 () Bool)

(assert (=> b!754050 (=> (not res!509480) (not e!420546))))

(declare-fun arrayContainsKey!0 (array!41887 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!754050 (= res!509480 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!420557 () Bool)

(declare-fun lt!335544 () SeekEntryResult!7657)

(declare-fun b!754051 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41887 (_ BitVec 32)) SeekEntryResult!7657)

(assert (=> b!754051 (= e!420557 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20057 a!3186) j!159) a!3186 mask!3328) lt!335544))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!754052 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41887 (_ BitVec 32)) SeekEntryResult!7657)

(assert (=> b!754052 (= e!420557 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20057 a!3186) j!159) a!3186 mask!3328) (Found!7657 j!159)))))

(declare-fun b!754053 () Bool)

(declare-fun res!509481 () Bool)

(assert (=> b!754053 (=> (not res!509481) (not e!420549))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!754053 (= res!509481 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20478 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20478 a!3186))))))

(declare-fun e!420554 () Bool)

(declare-fun lt!335539 () SeekEntryResult!7657)

(declare-fun b!754054 () Bool)

(assert (=> b!754054 (= e!420554 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20057 a!3186) j!159) a!3186 mask!3328) lt!335539))))

(declare-fun b!754055 () Bool)

(declare-fun res!509475 () Bool)

(declare-fun e!420547 () Bool)

(assert (=> b!754055 (=> (not res!509475) (not e!420547))))

(assert (=> b!754055 (= res!509475 e!420557)))

(declare-fun c!82672 () Bool)

(assert (=> b!754055 (= c!82672 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!754056 () Bool)

(declare-fun e!420550 () Bool)

(declare-fun e!420551 () Bool)

(assert (=> b!754056 (= e!420550 e!420551)))

(declare-fun res!509467 () Bool)

(assert (=> b!754056 (=> res!509467 e!420551)))

(declare-fun lt!335547 () (_ BitVec 64))

(declare-fun lt!335540 () (_ BitVec 64))

(assert (=> b!754056 (= res!509467 (= lt!335547 lt!335540))))

(assert (=> b!754056 (= lt!335547 (select (store (arr!20057 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!754057 () Bool)

(declare-fun res!509468 () Bool)

(assert (=> b!754057 (=> (not res!509468) (not e!420547))))

(assert (=> b!754057 (= res!509468 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20057 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!754058 () Bool)

(assert (=> b!754058 (= e!420549 e!420547)))

(declare-fun res!509483 () Bool)

(assert (=> b!754058 (=> (not res!509483) (not e!420547))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!754058 (= res!509483 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20057 a!3186) j!159) mask!3328) (select (arr!20057 a!3186) j!159) a!3186 mask!3328) lt!335544))))

(assert (=> b!754058 (= lt!335544 (Intermediate!7657 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!754059 () Bool)

(declare-fun res!509482 () Bool)

(declare-fun e!420555 () Bool)

(assert (=> b!754059 (=> (not res!509482) (not e!420555))))

(declare-fun lt!335548 () array!41887)

(assert (=> b!754059 (= res!509482 (= (seekEntryOrOpen!0 lt!335540 lt!335548 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335540 lt!335548 mask!3328)))))

(declare-fun b!754060 () Bool)

(declare-fun res!509465 () Bool)

(assert (=> b!754060 (=> (not res!509465) (not e!420546))))

(assert (=> b!754060 (= res!509465 (validKeyInArray!0 (select (arr!20057 a!3186) j!159)))))

(declare-fun res!509466 () Bool)

(assert (=> start!65714 (=> (not res!509466) (not e!420546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65714 (= res!509466 (validMask!0 mask!3328))))

(assert (=> start!65714 e!420546))

(assert (=> start!65714 true))

(declare-fun array_inv!15853 (array!41887) Bool)

(assert (=> start!65714 (array_inv!15853 a!3186)))

(declare-fun b!754061 () Bool)

(declare-fun lt!335542 () SeekEntryResult!7657)

(declare-fun lt!335538 () SeekEntryResult!7657)

(assert (=> b!754061 (= e!420555 (= lt!335542 lt!335538))))

(declare-fun b!754062 () Bool)

(declare-fun e!420548 () Bool)

(assert (=> b!754062 (= e!420547 e!420548)))

(declare-fun res!509474 () Bool)

(assert (=> b!754062 (=> (not res!509474) (not e!420548))))

(declare-fun lt!335543 () SeekEntryResult!7657)

(declare-fun lt!335546 () SeekEntryResult!7657)

(assert (=> b!754062 (= res!509474 (= lt!335543 lt!335546))))

(assert (=> b!754062 (= lt!335546 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335540 lt!335548 mask!3328))))

(assert (=> b!754062 (= lt!335543 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335540 mask!3328) lt!335540 lt!335548 mask!3328))))

(assert (=> b!754062 (= lt!335540 (select (store (arr!20057 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!754062 (= lt!335548 (array!41888 (store (arr!20057 a!3186) i!1173 k!2102) (size!20478 a!3186)))))

(declare-fun b!754063 () Bool)

(declare-fun Unit!26011 () Unit!26008)

(assert (=> b!754063 (= e!420552 Unit!26011)))

(declare-fun b!754064 () Bool)

(declare-fun res!509471 () Bool)

(assert (=> b!754064 (=> (not res!509471) (not e!420546))))

(assert (=> b!754064 (= res!509471 (and (= (size!20478 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20478 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20478 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!754065 () Bool)

(declare-fun e!420556 () Bool)

(assert (=> b!754065 (= e!420556 e!420550)))

(declare-fun res!509473 () Bool)

(assert (=> b!754065 (=> res!509473 e!420550)))

(assert (=> b!754065 (= res!509473 (not (= lt!335538 lt!335539)))))

(assert (=> b!754065 (= lt!335538 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20057 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!754066 () Bool)

(declare-fun res!509476 () Bool)

(assert (=> b!754066 (=> (not res!509476) (not e!420549))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41887 (_ BitVec 32)) Bool)

(assert (=> b!754066 (= res!509476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!754067 () Bool)

(assert (=> b!754067 (= e!420548 (not e!420556))))

(declare-fun res!509478 () Bool)

(assert (=> b!754067 (=> res!509478 e!420556)))

(assert (=> b!754067 (= res!509478 (or (not (is-Intermediate!7657 lt!335546)) (bvslt x!1131 (x!63903 lt!335546)) (not (= x!1131 (x!63903 lt!335546))) (not (= index!1321 (index!32998 lt!335546)))))))

(assert (=> b!754067 e!420554))

(declare-fun res!509479 () Bool)

(assert (=> b!754067 (=> (not res!509479) (not e!420554))))

(assert (=> b!754067 (= res!509479 (= lt!335542 lt!335539))))

(assert (=> b!754067 (= lt!335539 (Found!7657 j!159))))

(assert (=> b!754067 (= lt!335542 (seekEntryOrOpen!0 (select (arr!20057 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!754067 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!335549 () Unit!26008)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41887 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26008)

(assert (=> b!754067 (= lt!335549 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!754068 () Bool)

(assert (=> b!754068 (= e!420551 true)))

(assert (=> b!754068 e!420555))

(declare-fun res!509470 () Bool)

(assert (=> b!754068 (=> (not res!509470) (not e!420555))))

(assert (=> b!754068 (= res!509470 (= lt!335547 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!335545 () Unit!26008)

(assert (=> b!754068 (= lt!335545 e!420552)))

(declare-fun c!82671 () Bool)

(assert (=> b!754068 (= c!82671 (= lt!335547 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!65714 res!509466) b!754064))

(assert (= (and b!754064 res!509471) b!754060))

(assert (= (and b!754060 res!509465) b!754048))

(assert (= (and b!754048 res!509469) b!754050))

(assert (= (and b!754050 res!509480) b!754046))

(assert (= (and b!754046 res!509472) b!754066))

(assert (= (and b!754066 res!509476) b!754049))

(assert (= (and b!754049 res!509477) b!754053))

(assert (= (and b!754053 res!509481) b!754058))

(assert (= (and b!754058 res!509483) b!754057))

(assert (= (and b!754057 res!509468) b!754055))

(assert (= (and b!754055 c!82672) b!754051))

(assert (= (and b!754055 (not c!82672)) b!754052))

(assert (= (and b!754055 res!509475) b!754062))

(assert (= (and b!754062 res!509474) b!754067))

(assert (= (and b!754067 res!509479) b!754054))

(assert (= (and b!754067 (not res!509478)) b!754065))

(assert (= (and b!754065 (not res!509473)) b!754056))

(assert (= (and b!754056 (not res!509467)) b!754068))

(assert (= (and b!754068 c!82671) b!754047))

(assert (= (and b!754068 (not c!82671)) b!754063))

(assert (= (and b!754068 res!509470) b!754059))

(assert (= (and b!754059 res!509482) b!754061))

(declare-fun m!702591 () Bool)

(assert (=> start!65714 m!702591))

(declare-fun m!702593 () Bool)

(assert (=> start!65714 m!702593))

(declare-fun m!702595 () Bool)

(assert (=> b!754067 m!702595))

(assert (=> b!754067 m!702595))

(declare-fun m!702597 () Bool)

(assert (=> b!754067 m!702597))

(declare-fun m!702599 () Bool)

(assert (=> b!754067 m!702599))

(declare-fun m!702601 () Bool)

(assert (=> b!754067 m!702601))

(assert (=> b!754065 m!702595))

(assert (=> b!754065 m!702595))

(declare-fun m!702603 () Bool)

(assert (=> b!754065 m!702603))

(assert (=> b!754060 m!702595))

(assert (=> b!754060 m!702595))

(declare-fun m!702605 () Bool)

(assert (=> b!754060 m!702605))

(declare-fun m!702607 () Bool)

(assert (=> b!754049 m!702607))

(declare-fun m!702609 () Bool)

(assert (=> b!754048 m!702609))

(declare-fun m!702611 () Bool)

(assert (=> b!754059 m!702611))

(declare-fun m!702613 () Bool)

(assert (=> b!754059 m!702613))

(declare-fun m!702615 () Bool)

(assert (=> b!754046 m!702615))

(declare-fun m!702617 () Bool)

(assert (=> b!754056 m!702617))

(declare-fun m!702619 () Bool)

(assert (=> b!754056 m!702619))

(declare-fun m!702621 () Bool)

(assert (=> b!754057 m!702621))

(declare-fun m!702623 () Bool)

(assert (=> b!754066 m!702623))

(assert (=> b!754051 m!702595))

(assert (=> b!754051 m!702595))

(declare-fun m!702625 () Bool)

(assert (=> b!754051 m!702625))

(assert (=> b!754054 m!702595))

(assert (=> b!754054 m!702595))

(declare-fun m!702627 () Bool)

(assert (=> b!754054 m!702627))

(assert (=> b!754058 m!702595))

(assert (=> b!754058 m!702595))

(declare-fun m!702629 () Bool)

(assert (=> b!754058 m!702629))

(assert (=> b!754058 m!702629))

(assert (=> b!754058 m!702595))

(declare-fun m!702631 () Bool)

(assert (=> b!754058 m!702631))

(declare-fun m!702633 () Bool)

(assert (=> b!754062 m!702633))

(assert (=> b!754062 m!702617))

(declare-fun m!702635 () Bool)

(assert (=> b!754062 m!702635))

(assert (=> b!754062 m!702635))

(declare-fun m!702637 () Bool)

(assert (=> b!754062 m!702637))

(declare-fun m!702639 () Bool)

(assert (=> b!754062 m!702639))

(assert (=> b!754052 m!702595))

(assert (=> b!754052 m!702595))

(assert (=> b!754052 m!702603))

(declare-fun m!702641 () Bool)

(assert (=> b!754050 m!702641))

(push 1)

(assert (not b!754060))

(assert (not b!754059))

(assert (not b!754050))

(assert (not b!754066))

(assert (not b!754067))

(assert (not start!65714))

(assert (not b!754049))

(assert (not b!754062))

(assert (not b!754051))

(assert (not b!754065))

(assert (not b!754048))

(assert (not b!754046))

(assert (not b!754058))

(assert (not b!754052))

(assert (not b!754054))

(check-sat)

