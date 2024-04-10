; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48124 () Bool)

(assert start!48124)

(declare-fun b!530005 () Bool)

(declare-fun res!325712 () Bool)

(declare-fun e!308829 () Bool)

(assert (=> b!530005 (=> (not res!325712) (not e!308829))))

(declare-datatypes ((array!33560 0))(
  ( (array!33561 (arr!16127 (Array (_ BitVec 32) (_ BitVec 64))) (size!16491 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33560)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33560 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530005 (= res!325712 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!530006 () Bool)

(declare-fun e!308825 () Bool)

(declare-fun e!308827 () Bool)

(assert (=> b!530006 (= e!308825 e!308827)))

(declare-fun res!325717 () Bool)

(assert (=> b!530006 (=> res!325717 e!308827)))

(declare-fun lt!244424 () Bool)

(declare-datatypes ((SeekEntryResult!4594 0))(
  ( (MissingZero!4594 (index!20600 (_ BitVec 32))) (Found!4594 (index!20601 (_ BitVec 32))) (Intermediate!4594 (undefined!5406 Bool) (index!20602 (_ BitVec 32)) (x!49568 (_ BitVec 32))) (Undefined!4594) (MissingVacant!4594 (index!20603 (_ BitVec 32))) )
))
(declare-fun lt!244431 () SeekEntryResult!4594)

(assert (=> b!530006 (= res!325717 (or (and (not lt!244424) (undefined!5406 lt!244431)) (and (not lt!244424) (not (undefined!5406 lt!244431)))))))

(assert (=> b!530006 (= lt!244424 (not (is-Intermediate!4594 lt!244431)))))

(declare-fun b!530007 () Bool)

(declare-fun res!325718 () Bool)

(assert (=> b!530007 (=> (not res!325718) (not e!308829))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!530007 (= res!325718 (and (= (size!16491 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16491 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16491 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!530008 () Bool)

(declare-fun res!325711 () Bool)

(declare-fun e!308828 () Bool)

(assert (=> b!530008 (=> (not res!325711) (not e!308828))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33560 (_ BitVec 32)) Bool)

(assert (=> b!530008 (= res!325711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!530009 () Bool)

(assert (=> b!530009 (= e!308829 e!308828)))

(declare-fun res!325714 () Bool)

(assert (=> b!530009 (=> (not res!325714) (not e!308828))))

(declare-fun lt!244425 () SeekEntryResult!4594)

(assert (=> b!530009 (= res!325714 (or (= lt!244425 (MissingZero!4594 i!1204)) (= lt!244425 (MissingVacant!4594 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33560 (_ BitVec 32)) SeekEntryResult!4594)

(assert (=> b!530009 (= lt!244425 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!530011 () Bool)

(declare-fun res!325721 () Bool)

(assert (=> b!530011 (=> (not res!325721) (not e!308829))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530011 (= res!325721 (validKeyInArray!0 (select (arr!16127 a!3235) j!176)))))

(declare-fun b!530012 () Bool)

(declare-fun res!325719 () Bool)

(assert (=> b!530012 (=> (not res!325719) (not e!308829))))

(assert (=> b!530012 (= res!325719 (validKeyInArray!0 k!2280))))

(declare-fun b!530013 () Bool)

(declare-fun res!325720 () Bool)

(assert (=> b!530013 (=> (not res!325720) (not e!308828))))

(declare-datatypes ((List!10285 0))(
  ( (Nil!10282) (Cons!10281 (h!11221 (_ BitVec 64)) (t!16513 List!10285)) )
))
(declare-fun arrayNoDuplicates!0 (array!33560 (_ BitVec 32) List!10285) Bool)

(assert (=> b!530013 (= res!325720 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10282))))

(declare-fun b!530014 () Bool)

(assert (=> b!530014 (= e!308828 (not e!308825))))

(declare-fun res!325715 () Bool)

(assert (=> b!530014 (=> res!325715 e!308825)))

(declare-fun lt!244428 () (_ BitVec 32))

(declare-fun lt!244429 () array!33560)

(declare-fun lt!244432 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33560 (_ BitVec 32)) SeekEntryResult!4594)

(assert (=> b!530014 (= res!325715 (= lt!244431 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244428 lt!244432 lt!244429 mask!3524)))))

(declare-fun lt!244430 () (_ BitVec 32))

(assert (=> b!530014 (= lt!244431 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244430 (select (arr!16127 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!530014 (= lt!244428 (toIndex!0 lt!244432 mask!3524))))

(assert (=> b!530014 (= lt!244432 (select (store (arr!16127 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!530014 (= lt!244430 (toIndex!0 (select (arr!16127 a!3235) j!176) mask!3524))))

(assert (=> b!530014 (= lt!244429 (array!33561 (store (arr!16127 a!3235) i!1204 k!2280) (size!16491 a!3235)))))

(declare-fun e!308826 () Bool)

(assert (=> b!530014 e!308826))

(declare-fun res!325716 () Bool)

(assert (=> b!530014 (=> (not res!325716) (not e!308826))))

(assert (=> b!530014 (= res!325716 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16800 0))(
  ( (Unit!16801) )
))
(declare-fun lt!244426 () Unit!16800)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33560 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16800)

(assert (=> b!530014 (= lt!244426 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!530015 () Bool)

(assert (=> b!530015 (= e!308827 true)))

(declare-fun lt!244427 () SeekEntryResult!4594)

(assert (=> b!530015 (= lt!244427 (seekEntryOrOpen!0 lt!244432 lt!244429 mask!3524))))

(assert (=> b!530015 false))

(declare-fun res!325713 () Bool)

(assert (=> start!48124 (=> (not res!325713) (not e!308829))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48124 (= res!325713 (validMask!0 mask!3524))))

(assert (=> start!48124 e!308829))

(assert (=> start!48124 true))

(declare-fun array_inv!11923 (array!33560) Bool)

(assert (=> start!48124 (array_inv!11923 a!3235)))

(declare-fun b!530010 () Bool)

(assert (=> b!530010 (= e!308826 (= (seekEntryOrOpen!0 (select (arr!16127 a!3235) j!176) a!3235 mask!3524) (Found!4594 j!176)))))

(assert (= (and start!48124 res!325713) b!530007))

(assert (= (and b!530007 res!325718) b!530011))

(assert (= (and b!530011 res!325721) b!530012))

(assert (= (and b!530012 res!325719) b!530005))

(assert (= (and b!530005 res!325712) b!530009))

(assert (= (and b!530009 res!325714) b!530008))

(assert (= (and b!530008 res!325711) b!530013))

(assert (= (and b!530013 res!325720) b!530014))

(assert (= (and b!530014 res!325716) b!530010))

(assert (= (and b!530014 (not res!325715)) b!530006))

(assert (= (and b!530006 (not res!325717)) b!530015))

(declare-fun m!510523 () Bool)

(assert (=> b!530013 m!510523))

(declare-fun m!510525 () Bool)

(assert (=> b!530015 m!510525))

(declare-fun m!510527 () Bool)

(assert (=> b!530010 m!510527))

(assert (=> b!530010 m!510527))

(declare-fun m!510529 () Bool)

(assert (=> b!530010 m!510529))

(declare-fun m!510531 () Bool)

(assert (=> b!530005 m!510531))

(assert (=> b!530011 m!510527))

(assert (=> b!530011 m!510527))

(declare-fun m!510533 () Bool)

(assert (=> b!530011 m!510533))

(declare-fun m!510535 () Bool)

(assert (=> b!530012 m!510535))

(declare-fun m!510537 () Bool)

(assert (=> b!530008 m!510537))

(declare-fun m!510539 () Bool)

(assert (=> b!530009 m!510539))

(assert (=> b!530014 m!510527))

(declare-fun m!510541 () Bool)

(assert (=> b!530014 m!510541))

(declare-fun m!510543 () Bool)

(assert (=> b!530014 m!510543))

(declare-fun m!510545 () Bool)

(assert (=> b!530014 m!510545))

(assert (=> b!530014 m!510527))

(declare-fun m!510547 () Bool)

(assert (=> b!530014 m!510547))

(assert (=> b!530014 m!510527))

(declare-fun m!510549 () Bool)

(assert (=> b!530014 m!510549))

(declare-fun m!510551 () Bool)

(assert (=> b!530014 m!510551))

(declare-fun m!510553 () Bool)

(assert (=> b!530014 m!510553))

(declare-fun m!510555 () Bool)

(assert (=> b!530014 m!510555))

(declare-fun m!510557 () Bool)

(assert (=> start!48124 m!510557))

(declare-fun m!510559 () Bool)

(assert (=> start!48124 m!510559))

(push 1)

(assert (not b!530011))

(assert (not b!530014))

(assert (not b!530010))

(assert (not b!530008))

(assert (not b!530005))

(assert (not b!530009))

(assert (not b!530015))

(assert (not start!48124))

(assert (not b!530013))

(assert (not b!530012))

(check-sat)

