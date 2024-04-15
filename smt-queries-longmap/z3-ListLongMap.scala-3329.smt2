; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45954 () Bool)

(assert start!45954)

(declare-fun b!508568 () Bool)

(declare-fun res!309558 () Bool)

(declare-fun e!297482 () Bool)

(assert (=> b!508568 (=> (not res!309558) (not e!297482))))

(declare-datatypes ((array!32675 0))(
  ( (array!32676 (arr!15716 (Array (_ BitVec 32) (_ BitVec 64))) (size!16081 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32675)

(declare-datatypes ((List!9913 0))(
  ( (Nil!9910) (Cons!9909 (h!10786 (_ BitVec 64)) (t!16132 List!9913)) )
))
(declare-fun arrayNoDuplicates!0 (array!32675 (_ BitVec 32) List!9913) Bool)

(assert (=> b!508568 (= res!309558 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9910))))

(declare-fun b!508569 () Bool)

(declare-fun res!309555 () Bool)

(declare-fun e!297480 () Bool)

(assert (=> b!508569 (=> (not res!309555) (not e!297480))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32675 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508569 (= res!309555 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508570 () Bool)

(assert (=> b!508570 (= e!297482 (not true))))

(declare-fun e!297481 () Bool)

(assert (=> b!508570 e!297481))

(declare-fun res!309563 () Bool)

(assert (=> b!508570 (=> (not res!309563) (not e!297481))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32675 (_ BitVec 32)) Bool)

(assert (=> b!508570 (= res!309563 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15604 0))(
  ( (Unit!15605) )
))
(declare-fun lt!232138 () Unit!15604)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32675 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15604)

(assert (=> b!508570 (= lt!232138 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!508572 () Bool)

(declare-fun res!309556 () Bool)

(assert (=> b!508572 (=> (not res!309556) (not e!297480))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508572 (= res!309556 (validKeyInArray!0 (select (arr!15716 a!3235) j!176)))))

(declare-fun b!508573 () Bool)

(assert (=> b!508573 (= e!297480 e!297482)))

(declare-fun res!309561 () Bool)

(assert (=> b!508573 (=> (not res!309561) (not e!297482))))

(declare-datatypes ((SeekEntryResult!4180 0))(
  ( (MissingZero!4180 (index!18908 (_ BitVec 32))) (Found!4180 (index!18909 (_ BitVec 32))) (Intermediate!4180 (undefined!4992 Bool) (index!18910 (_ BitVec 32)) (x!47896 (_ BitVec 32))) (Undefined!4180) (MissingVacant!4180 (index!18911 (_ BitVec 32))) )
))
(declare-fun lt!232137 () SeekEntryResult!4180)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!508573 (= res!309561 (or (= lt!232137 (MissingZero!4180 i!1204)) (= lt!232137 (MissingVacant!4180 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32675 (_ BitVec 32)) SeekEntryResult!4180)

(assert (=> b!508573 (= lt!232137 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!508574 () Bool)

(declare-fun res!309562 () Bool)

(assert (=> b!508574 (=> (not res!309562) (not e!297480))))

(assert (=> b!508574 (= res!309562 (and (= (size!16081 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16081 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16081 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508575 () Bool)

(declare-fun res!309559 () Bool)

(assert (=> b!508575 (=> (not res!309559) (not e!297480))))

(assert (=> b!508575 (= res!309559 (validKeyInArray!0 k0!2280))))

(declare-fun b!508576 () Bool)

(assert (=> b!508576 (= e!297481 (= (seekEntryOrOpen!0 (select (arr!15716 a!3235) j!176) a!3235 mask!3524) (Found!4180 j!176)))))

(declare-fun res!309557 () Bool)

(assert (=> start!45954 (=> (not res!309557) (not e!297480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45954 (= res!309557 (validMask!0 mask!3524))))

(assert (=> start!45954 e!297480))

(assert (=> start!45954 true))

(declare-fun array_inv!11599 (array!32675) Bool)

(assert (=> start!45954 (array_inv!11599 a!3235)))

(declare-fun b!508571 () Bool)

(declare-fun res!309560 () Bool)

(assert (=> b!508571 (=> (not res!309560) (not e!297482))))

(assert (=> b!508571 (= res!309560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45954 res!309557) b!508574))

(assert (= (and b!508574 res!309562) b!508572))

(assert (= (and b!508572 res!309556) b!508575))

(assert (= (and b!508575 res!309559) b!508569))

(assert (= (and b!508569 res!309555) b!508573))

(assert (= (and b!508573 res!309561) b!508571))

(assert (= (and b!508571 res!309560) b!508568))

(assert (= (and b!508568 res!309558) b!508570))

(assert (= (and b!508570 res!309563) b!508576))

(declare-fun m!488827 () Bool)

(assert (=> b!508568 m!488827))

(declare-fun m!488829 () Bool)

(assert (=> b!508576 m!488829))

(assert (=> b!508576 m!488829))

(declare-fun m!488831 () Bool)

(assert (=> b!508576 m!488831))

(declare-fun m!488833 () Bool)

(assert (=> b!508570 m!488833))

(declare-fun m!488835 () Bool)

(assert (=> b!508570 m!488835))

(declare-fun m!488837 () Bool)

(assert (=> b!508569 m!488837))

(declare-fun m!488839 () Bool)

(assert (=> b!508573 m!488839))

(declare-fun m!488841 () Bool)

(assert (=> b!508571 m!488841))

(declare-fun m!488843 () Bool)

(assert (=> start!45954 m!488843))

(declare-fun m!488845 () Bool)

(assert (=> start!45954 m!488845))

(assert (=> b!508572 m!488829))

(assert (=> b!508572 m!488829))

(declare-fun m!488847 () Bool)

(assert (=> b!508572 m!488847))

(declare-fun m!488849 () Bool)

(assert (=> b!508575 m!488849))

(check-sat (not start!45954) (not b!508570) (not b!508572) (not b!508573) (not b!508568) (not b!508571) (not b!508569) (not b!508575) (not b!508576))
(check-sat)
