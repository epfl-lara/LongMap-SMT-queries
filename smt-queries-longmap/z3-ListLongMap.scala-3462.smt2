; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48104 () Bool)

(assert start!48104)

(declare-fun b!529675 () Bool)

(declare-fun e!308646 () Bool)

(declare-fun e!308649 () Bool)

(assert (=> b!529675 (= e!308646 e!308649)))

(declare-fun res!325384 () Bool)

(assert (=> b!529675 (=> res!325384 e!308649)))

(declare-fun lt!244195 () Bool)

(declare-datatypes ((SeekEntryResult!4584 0))(
  ( (MissingZero!4584 (index!20560 (_ BitVec 32))) (Found!4584 (index!20561 (_ BitVec 32))) (Intermediate!4584 (undefined!5396 Bool) (index!20562 (_ BitVec 32)) (x!49534 (_ BitVec 32))) (Undefined!4584) (MissingVacant!4584 (index!20563 (_ BitVec 32))) )
))
(declare-fun lt!244198 () SeekEntryResult!4584)

(assert (=> b!529675 (= res!325384 (or (and (not lt!244195) (undefined!5396 lt!244198)) (and (not lt!244195) (not (undefined!5396 lt!244198)))))))

(get-info :version)

(assert (=> b!529675 (= lt!244195 (not ((_ is Intermediate!4584) lt!244198)))))

(declare-fun b!529676 () Bool)

(declare-fun res!325385 () Bool)

(declare-fun e!308648 () Bool)

(assert (=> b!529676 (=> (not res!325385) (not e!308648))))

(declare-datatypes ((array!33540 0))(
  ( (array!33541 (arr!16117 (Array (_ BitVec 32) (_ BitVec 64))) (size!16481 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33540)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33540 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!529676 (= res!325385 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!529678 () Bool)

(declare-fun res!325390 () Bool)

(declare-fun e!308644 () Bool)

(assert (=> b!529678 (=> (not res!325390) (not e!308644))))

(declare-datatypes ((List!10275 0))(
  ( (Nil!10272) (Cons!10271 (h!11211 (_ BitVec 64)) (t!16503 List!10275)) )
))
(declare-fun arrayNoDuplicates!0 (array!33540 (_ BitVec 32) List!10275) Bool)

(assert (=> b!529678 (= res!325390 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10272))))

(declare-fun b!529679 () Bool)

(assert (=> b!529679 (= e!308644 (not e!308646))))

(declare-fun res!325388 () Bool)

(assert (=> b!529679 (=> res!325388 e!308646)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!244197 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33540 (_ BitVec 32)) SeekEntryResult!4584)

(assert (=> b!529679 (= res!325388 (= lt!244198 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244197 (select (store (arr!16117 a!3235) i!1204 k0!2280) j!176) (array!33541 (store (arr!16117 a!3235) i!1204 k0!2280) (size!16481 a!3235)) mask!3524)))))

(declare-fun lt!244196 () (_ BitVec 32))

(assert (=> b!529679 (= lt!244198 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244196 (select (arr!16117 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!529679 (= lt!244197 (toIndex!0 (select (store (arr!16117 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!529679 (= lt!244196 (toIndex!0 (select (arr!16117 a!3235) j!176) mask!3524))))

(declare-fun e!308647 () Bool)

(assert (=> b!529679 e!308647))

(declare-fun res!325382 () Bool)

(assert (=> b!529679 (=> (not res!325382) (not e!308647))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33540 (_ BitVec 32)) Bool)

(assert (=> b!529679 (= res!325382 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16780 0))(
  ( (Unit!16781) )
))
(declare-fun lt!244194 () Unit!16780)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33540 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16780)

(assert (=> b!529679 (= lt!244194 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!529680 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33540 (_ BitVec 32)) SeekEntryResult!4584)

(assert (=> b!529680 (= e!308647 (= (seekEntryOrOpen!0 (select (arr!16117 a!3235) j!176) a!3235 mask!3524) (Found!4584 j!176)))))

(declare-fun b!529681 () Bool)

(declare-fun res!325391 () Bool)

(assert (=> b!529681 (=> (not res!325391) (not e!308648))))

(assert (=> b!529681 (= res!325391 (and (= (size!16481 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16481 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16481 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!529682 () Bool)

(declare-fun res!325387 () Bool)

(assert (=> b!529682 (=> (not res!325387) (not e!308644))))

(assert (=> b!529682 (= res!325387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!529683 () Bool)

(declare-fun res!325381 () Bool)

(assert (=> b!529683 (=> (not res!325381) (not e!308648))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!529683 (= res!325381 (validKeyInArray!0 (select (arr!16117 a!3235) j!176)))))

(declare-fun b!529684 () Bool)

(assert (=> b!529684 (= e!308648 e!308644)))

(declare-fun res!325383 () Bool)

(assert (=> b!529684 (=> (not res!325383) (not e!308644))))

(declare-fun lt!244193 () SeekEntryResult!4584)

(assert (=> b!529684 (= res!325383 (or (= lt!244193 (MissingZero!4584 i!1204)) (= lt!244193 (MissingVacant!4584 i!1204))))))

(assert (=> b!529684 (= lt!244193 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!529685 () Bool)

(assert (=> b!529685 (= e!308649 true)))

(assert (=> b!529685 false))

(declare-fun res!325389 () Bool)

(assert (=> start!48104 (=> (not res!325389) (not e!308648))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48104 (= res!325389 (validMask!0 mask!3524))))

(assert (=> start!48104 e!308648))

(assert (=> start!48104 true))

(declare-fun array_inv!11913 (array!33540) Bool)

(assert (=> start!48104 (array_inv!11913 a!3235)))

(declare-fun b!529677 () Bool)

(declare-fun res!325386 () Bool)

(assert (=> b!529677 (=> (not res!325386) (not e!308648))))

(assert (=> b!529677 (= res!325386 (validKeyInArray!0 k0!2280))))

(assert (= (and start!48104 res!325389) b!529681))

(assert (= (and b!529681 res!325391) b!529683))

(assert (= (and b!529683 res!325381) b!529677))

(assert (= (and b!529677 res!325386) b!529676))

(assert (= (and b!529676 res!325385) b!529684))

(assert (= (and b!529684 res!325383) b!529682))

(assert (= (and b!529682 res!325387) b!529678))

(assert (= (and b!529678 res!325390) b!529679))

(assert (= (and b!529679 res!325382) b!529680))

(assert (= (and b!529679 (not res!325388)) b!529675))

(assert (= (and b!529675 (not res!325384)) b!529685))

(declare-fun m!510153 () Bool)

(assert (=> b!529680 m!510153))

(assert (=> b!529680 m!510153))

(declare-fun m!510155 () Bool)

(assert (=> b!529680 m!510155))

(declare-fun m!510157 () Bool)

(assert (=> start!48104 m!510157))

(declare-fun m!510159 () Bool)

(assert (=> start!48104 m!510159))

(declare-fun m!510161 () Bool)

(assert (=> b!529678 m!510161))

(declare-fun m!510163 () Bool)

(assert (=> b!529676 m!510163))

(declare-fun m!510165 () Bool)

(assert (=> b!529682 m!510165))

(declare-fun m!510167 () Bool)

(assert (=> b!529684 m!510167))

(declare-fun m!510169 () Bool)

(assert (=> b!529679 m!510169))

(declare-fun m!510171 () Bool)

(assert (=> b!529679 m!510171))

(declare-fun m!510173 () Bool)

(assert (=> b!529679 m!510173))

(declare-fun m!510175 () Bool)

(assert (=> b!529679 m!510175))

(assert (=> b!529679 m!510171))

(assert (=> b!529679 m!510153))

(declare-fun m!510177 () Bool)

(assert (=> b!529679 m!510177))

(assert (=> b!529679 m!510153))

(declare-fun m!510179 () Bool)

(assert (=> b!529679 m!510179))

(assert (=> b!529679 m!510153))

(declare-fun m!510181 () Bool)

(assert (=> b!529679 m!510181))

(assert (=> b!529679 m!510171))

(declare-fun m!510183 () Bool)

(assert (=> b!529679 m!510183))

(assert (=> b!529683 m!510153))

(assert (=> b!529683 m!510153))

(declare-fun m!510185 () Bool)

(assert (=> b!529683 m!510185))

(declare-fun m!510187 () Bool)

(assert (=> b!529677 m!510187))

(check-sat (not b!529678) (not b!529679) (not start!48104) (not b!529676) (not b!529677) (not b!529682) (not b!529684) (not b!529683) (not b!529680))
(check-sat)
