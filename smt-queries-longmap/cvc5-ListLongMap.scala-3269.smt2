; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45486 () Bool)

(assert start!45486)

(declare-fun b!500898 () Bool)

(declare-fun res!302667 () Bool)

(declare-fun e!293448 () Bool)

(assert (=> b!500898 (=> (not res!302667) (not e!293448))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!500898 (= res!302667 (validKeyInArray!0 k!2280))))

(declare-fun b!500899 () Bool)

(declare-fun res!302666 () Bool)

(assert (=> b!500899 (=> (not res!302666) (not e!293448))))

(declare-datatypes ((array!32311 0))(
  ( (array!32312 (arr!15537 (Array (_ BitVec 32) (_ BitVec 64))) (size!15901 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32311)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!500899 (= res!302666 (validKeyInArray!0 (select (arr!15537 a!3235) j!176)))))

(declare-fun res!302673 () Bool)

(assert (=> start!45486 (=> (not res!302673) (not e!293448))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45486 (= res!302673 (validMask!0 mask!3524))))

(assert (=> start!45486 e!293448))

(assert (=> start!45486 true))

(declare-fun array_inv!11333 (array!32311) Bool)

(assert (=> start!45486 (array_inv!11333 a!3235)))

(declare-fun b!500900 () Bool)

(declare-fun e!293451 () Bool)

(declare-fun e!293450 () Bool)

(assert (=> b!500900 (= e!293451 (not e!293450))))

(declare-fun res!302669 () Bool)

(assert (=> b!500900 (=> res!302669 e!293450)))

(declare-fun lt!227425 () array!32311)

(declare-fun lt!227420 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4004 0))(
  ( (MissingZero!4004 (index!18198 (_ BitVec 32))) (Found!4004 (index!18199 (_ BitVec 32))) (Intermediate!4004 (undefined!4816 Bool) (index!18200 (_ BitVec 32)) (x!47233 (_ BitVec 32))) (Undefined!4004) (MissingVacant!4004 (index!18201 (_ BitVec 32))) )
))
(declare-fun lt!227421 () SeekEntryResult!4004)

(declare-fun lt!227427 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32311 (_ BitVec 32)) SeekEntryResult!4004)

(assert (=> b!500900 (= res!302669 (= lt!227421 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227427 lt!227420 lt!227425 mask!3524)))))

(declare-fun lt!227426 () (_ BitVec 32))

(assert (=> b!500900 (= lt!227421 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227426 (select (arr!15537 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!500900 (= lt!227427 (toIndex!0 lt!227420 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!500900 (= lt!227420 (select (store (arr!15537 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!500900 (= lt!227426 (toIndex!0 (select (arr!15537 a!3235) j!176) mask!3524))))

(assert (=> b!500900 (= lt!227425 (array!32312 (store (arr!15537 a!3235) i!1204 k!2280) (size!15901 a!3235)))))

(declare-fun e!293449 () Bool)

(assert (=> b!500900 e!293449))

(declare-fun res!302678 () Bool)

(assert (=> b!500900 (=> (not res!302678) (not e!293449))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32311 (_ BitVec 32)) Bool)

(assert (=> b!500900 (= res!302678 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15092 0))(
  ( (Unit!15093) )
))
(declare-fun lt!227424 () Unit!15092)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32311 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15092)

(assert (=> b!500900 (= lt!227424 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!500901 () Bool)

(declare-fun res!302674 () Bool)

(assert (=> b!500901 (=> (not res!302674) (not e!293448))))

(declare-fun arrayContainsKey!0 (array!32311 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!500901 (= res!302674 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!500902 () Bool)

(declare-fun res!302676 () Bool)

(assert (=> b!500902 (=> res!302676 e!293450)))

(assert (=> b!500902 (= res!302676 (or (undefined!4816 lt!227421) (not (is-Intermediate!4004 lt!227421))))))

(declare-fun b!500903 () Bool)

(declare-fun e!293452 () Unit!15092)

(declare-fun Unit!15094 () Unit!15092)

(assert (=> b!500903 (= e!293452 Unit!15094)))

(declare-fun lt!227428 () Unit!15092)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32311 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15092)

(assert (=> b!500903 (= lt!227428 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!227426 #b00000000000000000000000000000000 (index!18200 lt!227421) (x!47233 lt!227421) mask!3524))))

(declare-fun res!302670 () Bool)

(assert (=> b!500903 (= res!302670 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227426 lt!227420 lt!227425 mask!3524) (Intermediate!4004 false (index!18200 lt!227421) (x!47233 lt!227421))))))

(declare-fun e!293447 () Bool)

(assert (=> b!500903 (=> (not res!302670) (not e!293447))))

(assert (=> b!500903 e!293447))

(declare-fun b!500904 () Bool)

(declare-fun res!302672 () Bool)

(assert (=> b!500904 (=> (not res!302672) (not e!293451))))

(assert (=> b!500904 (= res!302672 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!500905 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32311 (_ BitVec 32)) SeekEntryResult!4004)

(assert (=> b!500905 (= e!293449 (= (seekEntryOrOpen!0 (select (arr!15537 a!3235) j!176) a!3235 mask!3524) (Found!4004 j!176)))))

(declare-fun b!500906 () Bool)

(declare-fun res!302671 () Bool)

(assert (=> b!500906 (=> (not res!302671) (not e!293451))))

(declare-datatypes ((List!9695 0))(
  ( (Nil!9692) (Cons!9691 (h!10565 (_ BitVec 64)) (t!15923 List!9695)) )
))
(declare-fun arrayNoDuplicates!0 (array!32311 (_ BitVec 32) List!9695) Bool)

(assert (=> b!500906 (= res!302671 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9692))))

(declare-fun b!500907 () Bool)

(declare-fun e!293454 () Bool)

(assert (=> b!500907 (= e!293454 true)))

(declare-fun lt!227419 () SeekEntryResult!4004)

(assert (=> b!500907 (= lt!227419 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227426 lt!227420 lt!227425 mask!3524))))

(declare-fun b!500908 () Bool)

(declare-fun Unit!15095 () Unit!15092)

(assert (=> b!500908 (= e!293452 Unit!15095)))

(declare-fun b!500909 () Bool)

(declare-fun res!302675 () Bool)

(assert (=> b!500909 (=> (not res!302675) (not e!293448))))

(assert (=> b!500909 (= res!302675 (and (= (size!15901 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15901 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15901 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!500910 () Bool)

(assert (=> b!500910 (= e!293447 false)))

(declare-fun b!500911 () Bool)

(assert (=> b!500911 (= e!293448 e!293451)))

(declare-fun res!302677 () Bool)

(assert (=> b!500911 (=> (not res!302677) (not e!293451))))

(declare-fun lt!227423 () SeekEntryResult!4004)

(assert (=> b!500911 (= res!302677 (or (= lt!227423 (MissingZero!4004 i!1204)) (= lt!227423 (MissingVacant!4004 i!1204))))))

(assert (=> b!500911 (= lt!227423 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!500912 () Bool)

(assert (=> b!500912 (= e!293450 e!293454)))

(declare-fun res!302668 () Bool)

(assert (=> b!500912 (=> res!302668 e!293454)))

(assert (=> b!500912 (= res!302668 (or (bvsgt #b00000000000000000000000000000000 (x!47233 lt!227421)) (bvsgt (x!47233 lt!227421) #b01111111111111111111111111111110) (bvslt lt!227426 #b00000000000000000000000000000000) (bvsge lt!227426 (size!15901 a!3235)) (bvslt (index!18200 lt!227421) #b00000000000000000000000000000000) (bvsge (index!18200 lt!227421) (size!15901 a!3235)) (not (= lt!227421 (Intermediate!4004 false (index!18200 lt!227421) (x!47233 lt!227421))))))))

(assert (=> b!500912 (and (or (= (select (arr!15537 a!3235) (index!18200 lt!227421)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15537 a!3235) (index!18200 lt!227421)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15537 a!3235) (index!18200 lt!227421)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15537 a!3235) (index!18200 lt!227421)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!227422 () Unit!15092)

(assert (=> b!500912 (= lt!227422 e!293452)))

(declare-fun c!59393 () Bool)

(assert (=> b!500912 (= c!59393 (= (select (arr!15537 a!3235) (index!18200 lt!227421)) (select (arr!15537 a!3235) j!176)))))

(assert (=> b!500912 (and (bvslt (x!47233 lt!227421) #b01111111111111111111111111111110) (or (= (select (arr!15537 a!3235) (index!18200 lt!227421)) (select (arr!15537 a!3235) j!176)) (= (select (arr!15537 a!3235) (index!18200 lt!227421)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15537 a!3235) (index!18200 lt!227421)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!45486 res!302673) b!500909))

(assert (= (and b!500909 res!302675) b!500899))

(assert (= (and b!500899 res!302666) b!500898))

(assert (= (and b!500898 res!302667) b!500901))

(assert (= (and b!500901 res!302674) b!500911))

(assert (= (and b!500911 res!302677) b!500904))

(assert (= (and b!500904 res!302672) b!500906))

(assert (= (and b!500906 res!302671) b!500900))

(assert (= (and b!500900 res!302678) b!500905))

(assert (= (and b!500900 (not res!302669)) b!500902))

(assert (= (and b!500902 (not res!302676)) b!500912))

(assert (= (and b!500912 c!59393) b!500903))

(assert (= (and b!500912 (not c!59393)) b!500908))

(assert (= (and b!500903 res!302670) b!500910))

(assert (= (and b!500912 (not res!302668)) b!500907))

(declare-fun m!482001 () Bool)

(assert (=> b!500907 m!482001))

(declare-fun m!482003 () Bool)

(assert (=> b!500911 m!482003))

(declare-fun m!482005 () Bool)

(assert (=> b!500904 m!482005))

(declare-fun m!482007 () Bool)

(assert (=> start!45486 m!482007))

(declare-fun m!482009 () Bool)

(assert (=> start!45486 m!482009))

(declare-fun m!482011 () Bool)

(assert (=> b!500899 m!482011))

(assert (=> b!500899 m!482011))

(declare-fun m!482013 () Bool)

(assert (=> b!500899 m!482013))

(declare-fun m!482015 () Bool)

(assert (=> b!500903 m!482015))

(assert (=> b!500903 m!482001))

(declare-fun m!482017 () Bool)

(assert (=> b!500898 m!482017))

(declare-fun m!482019 () Bool)

(assert (=> b!500906 m!482019))

(declare-fun m!482021 () Bool)

(assert (=> b!500900 m!482021))

(declare-fun m!482023 () Bool)

(assert (=> b!500900 m!482023))

(assert (=> b!500900 m!482011))

(declare-fun m!482025 () Bool)

(assert (=> b!500900 m!482025))

(declare-fun m!482027 () Bool)

(assert (=> b!500900 m!482027))

(assert (=> b!500900 m!482011))

(declare-fun m!482029 () Bool)

(assert (=> b!500900 m!482029))

(declare-fun m!482031 () Bool)

(assert (=> b!500900 m!482031))

(declare-fun m!482033 () Bool)

(assert (=> b!500900 m!482033))

(declare-fun m!482035 () Bool)

(assert (=> b!500900 m!482035))

(assert (=> b!500900 m!482011))

(declare-fun m!482037 () Bool)

(assert (=> b!500912 m!482037))

(assert (=> b!500912 m!482011))

(assert (=> b!500905 m!482011))

(assert (=> b!500905 m!482011))

(declare-fun m!482039 () Bool)

(assert (=> b!500905 m!482039))

(declare-fun m!482041 () Bool)

(assert (=> b!500901 m!482041))

(push 1)

