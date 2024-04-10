; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45802 () Bool)

(assert start!45802)

(declare-fun b!507016 () Bool)

(declare-fun e!296734 () Bool)

(declare-fun e!296733 () Bool)

(assert (=> b!507016 (= e!296734 e!296733)))

(declare-fun res!307975 () Bool)

(assert (=> b!507016 (=> (not res!307975) (not e!296733))))

(declare-datatypes ((SeekEntryResult!4126 0))(
  ( (MissingZero!4126 (index!18692 (_ BitVec 32))) (Found!4126 (index!18693 (_ BitVec 32))) (Intermediate!4126 (undefined!4938 Bool) (index!18694 (_ BitVec 32)) (x!47687 (_ BitVec 32))) (Undefined!4126) (MissingVacant!4126 (index!18695 (_ BitVec 32))) )
))
(declare-fun lt!231409 () SeekEntryResult!4126)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507016 (= res!307975 (or (= lt!231409 (MissingZero!4126 i!1204)) (= lt!231409 (MissingVacant!4126 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32558 0))(
  ( (array!32559 (arr!15659 (Array (_ BitVec 32) (_ BitVec 64))) (size!16023 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32558)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32558 (_ BitVec 32)) SeekEntryResult!4126)

(assert (=> b!507016 (= lt!231409 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!507017 () Bool)

(declare-fun e!296735 () Bool)

(assert (=> b!507017 (= e!296735 true)))

(assert (=> b!507017 false))

(declare-fun b!507018 () Bool)

(declare-fun e!296732 () Bool)

(assert (=> b!507018 (= e!296733 (not e!296732))))

(declare-fun res!307981 () Bool)

(assert (=> b!507018 (=> res!307981 e!296732)))

(declare-fun lt!231407 () (_ BitVec 32))

(declare-fun lt!231411 () SeekEntryResult!4126)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32558 (_ BitVec 32)) SeekEntryResult!4126)

(assert (=> b!507018 (= res!307981 (= lt!231411 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231407 (select (store (arr!15659 a!3235) i!1204 k!2280) j!176) (array!32559 (store (arr!15659 a!3235) i!1204 k!2280) (size!16023 a!3235)) mask!3524)))))

(declare-fun lt!231410 () (_ BitVec 32))

(assert (=> b!507018 (= lt!231411 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231410 (select (arr!15659 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507018 (= lt!231407 (toIndex!0 (select (store (arr!15659 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!507018 (= lt!231410 (toIndex!0 (select (arr!15659 a!3235) j!176) mask!3524))))

(declare-fun e!296736 () Bool)

(assert (=> b!507018 e!296736))

(declare-fun res!307976 () Bool)

(assert (=> b!507018 (=> (not res!307976) (not e!296736))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32558 (_ BitVec 32)) Bool)

(assert (=> b!507018 (= res!307976 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15540 0))(
  ( (Unit!15541) )
))
(declare-fun lt!231408 () Unit!15540)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32558 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15540)

(assert (=> b!507018 (= lt!231408 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!507019 () Bool)

(declare-fun res!307985 () Bool)

(assert (=> b!507019 (=> (not res!307985) (not e!296734))))

(assert (=> b!507019 (= res!307985 (and (= (size!16023 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16023 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16023 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507020 () Bool)

(assert (=> b!507020 (= e!296736 (= (seekEntryOrOpen!0 (select (arr!15659 a!3235) j!176) a!3235 mask!3524) (Found!4126 j!176)))))

(declare-fun b!507021 () Bool)

(declare-fun res!307979 () Bool)

(assert (=> b!507021 (=> (not res!307979) (not e!296733))))

(declare-datatypes ((List!9817 0))(
  ( (Nil!9814) (Cons!9813 (h!10690 (_ BitVec 64)) (t!16045 List!9817)) )
))
(declare-fun arrayNoDuplicates!0 (array!32558 (_ BitVec 32) List!9817) Bool)

(assert (=> b!507021 (= res!307979 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9814))))

(declare-fun b!507022 () Bool)

(declare-fun res!307983 () Bool)

(assert (=> b!507022 (=> (not res!307983) (not e!296733))))

(assert (=> b!507022 (= res!307983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!307982 () Bool)

(assert (=> start!45802 (=> (not res!307982) (not e!296734))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45802 (= res!307982 (validMask!0 mask!3524))))

(assert (=> start!45802 e!296734))

(assert (=> start!45802 true))

(declare-fun array_inv!11455 (array!32558) Bool)

(assert (=> start!45802 (array_inv!11455 a!3235)))

(declare-fun b!507023 () Bool)

(declare-fun res!307980 () Bool)

(assert (=> b!507023 (=> (not res!307980) (not e!296734))))

(declare-fun arrayContainsKey!0 (array!32558 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507023 (= res!307980 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507024 () Bool)

(declare-fun res!307978 () Bool)

(assert (=> b!507024 (=> (not res!307978) (not e!296734))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507024 (= res!307978 (validKeyInArray!0 k!2280))))

(declare-fun b!507025 () Bool)

(assert (=> b!507025 (= e!296732 e!296735)))

(declare-fun res!307984 () Bool)

(assert (=> b!507025 (=> res!307984 e!296735)))

(declare-fun lt!231412 () Bool)

(assert (=> b!507025 (= res!307984 (or (and (not lt!231412) (undefined!4938 lt!231411)) (and (not lt!231412) (not (undefined!4938 lt!231411)))))))

(assert (=> b!507025 (= lt!231412 (not (is-Intermediate!4126 lt!231411)))))

(declare-fun b!507026 () Bool)

(declare-fun res!307977 () Bool)

(assert (=> b!507026 (=> (not res!307977) (not e!296734))))

(assert (=> b!507026 (= res!307977 (validKeyInArray!0 (select (arr!15659 a!3235) j!176)))))

(assert (= (and start!45802 res!307982) b!507019))

(assert (= (and b!507019 res!307985) b!507026))

(assert (= (and b!507026 res!307977) b!507024))

(assert (= (and b!507024 res!307978) b!507023))

(assert (= (and b!507023 res!307980) b!507016))

(assert (= (and b!507016 res!307975) b!507022))

(assert (= (and b!507022 res!307983) b!507021))

(assert (= (and b!507021 res!307979) b!507018))

(assert (= (and b!507018 res!307976) b!507020))

(assert (= (and b!507018 (not res!307981)) b!507025))

(assert (= (and b!507025 (not res!307984)) b!507017))

(declare-fun m!487731 () Bool)

(assert (=> b!507016 m!487731))

(declare-fun m!487733 () Bool)

(assert (=> b!507024 m!487733))

(declare-fun m!487735 () Bool)

(assert (=> b!507021 m!487735))

(declare-fun m!487737 () Bool)

(assert (=> b!507018 m!487737))

(declare-fun m!487739 () Bool)

(assert (=> b!507018 m!487739))

(declare-fun m!487741 () Bool)

(assert (=> b!507018 m!487741))

(declare-fun m!487743 () Bool)

(assert (=> b!507018 m!487743))

(assert (=> b!507018 m!487737))

(declare-fun m!487745 () Bool)

(assert (=> b!507018 m!487745))

(declare-fun m!487747 () Bool)

(assert (=> b!507018 m!487747))

(assert (=> b!507018 m!487745))

(declare-fun m!487749 () Bool)

(assert (=> b!507018 m!487749))

(assert (=> b!507018 m!487745))

(declare-fun m!487751 () Bool)

(assert (=> b!507018 m!487751))

(assert (=> b!507018 m!487737))

(declare-fun m!487753 () Bool)

(assert (=> b!507018 m!487753))

(declare-fun m!487755 () Bool)

(assert (=> b!507023 m!487755))

(assert (=> b!507026 m!487745))

(assert (=> b!507026 m!487745))

(declare-fun m!487757 () Bool)

(assert (=> b!507026 m!487757))

(declare-fun m!487759 () Bool)

(assert (=> b!507022 m!487759))

(assert (=> b!507020 m!487745))

(assert (=> b!507020 m!487745))

(declare-fun m!487761 () Bool)

(assert (=> b!507020 m!487761))

(declare-fun m!487763 () Bool)

(assert (=> start!45802 m!487763))

(declare-fun m!487765 () Bool)

(assert (=> start!45802 m!487765))

(push 1)

