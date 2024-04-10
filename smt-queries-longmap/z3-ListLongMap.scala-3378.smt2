; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46682 () Bool)

(assert start!46682)

(declare-fun b!515116 () Bool)

(declare-fun e!300800 () Bool)

(declare-fun e!300803 () Bool)

(assert (=> b!515116 (= e!300800 e!300803)))

(declare-fun res!314683 () Bool)

(assert (=> b!515116 (=> (not res!314683) (not e!300803))))

(declare-datatypes ((SeekEntryResult!4332 0))(
  ( (MissingZero!4332 (index!19516 (_ BitVec 32))) (Found!4332 (index!19517 (_ BitVec 32))) (Intermediate!4332 (undefined!5144 Bool) (index!19518 (_ BitVec 32)) (x!48487 (_ BitVec 32))) (Undefined!4332) (MissingVacant!4332 (index!19519 (_ BitVec 32))) )
))
(declare-fun lt!235815 () SeekEntryResult!4332)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!515116 (= res!314683 (or (= lt!235815 (MissingZero!4332 i!1204)) (= lt!235815 (MissingVacant!4332 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32994 0))(
  ( (array!32995 (arr!15865 (Array (_ BitVec 32) (_ BitVec 64))) (size!16229 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32994)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32994 (_ BitVec 32)) SeekEntryResult!4332)

(assert (=> b!515116 (= lt!235815 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!515117 () Bool)

(declare-fun res!314686 () Bool)

(declare-fun e!300804 () Bool)

(assert (=> b!515117 (=> res!314686 e!300804)))

(declare-fun lt!235818 () SeekEntryResult!4332)

(get-info :version)

(assert (=> b!515117 (= res!314686 (or (undefined!5144 lt!235818) (not ((_ is Intermediate!4332) lt!235818))))))

(declare-fun b!515118 () Bool)

(assert (=> b!515118 (= e!300803 (not e!300804))))

(declare-fun res!314682 () Bool)

(assert (=> b!515118 (=> res!314682 e!300804)))

(declare-fun lt!235819 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32994 (_ BitVec 32)) SeekEntryResult!4332)

(assert (=> b!515118 (= res!314682 (= lt!235818 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235819 (select (store (arr!15865 a!3235) i!1204 k0!2280) j!176) (array!32995 (store (arr!15865 a!3235) i!1204 k0!2280) (size!16229 a!3235)) mask!3524)))))

(declare-fun lt!235817 () (_ BitVec 32))

(assert (=> b!515118 (= lt!235818 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235817 (select (arr!15865 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515118 (= lt!235819 (toIndex!0 (select (store (arr!15865 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!515118 (= lt!235817 (toIndex!0 (select (arr!15865 a!3235) j!176) mask!3524))))

(declare-fun e!300801 () Bool)

(assert (=> b!515118 e!300801))

(declare-fun res!314684 () Bool)

(assert (=> b!515118 (=> (not res!314684) (not e!300801))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32994 (_ BitVec 32)) Bool)

(assert (=> b!515118 (= res!314684 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15922 0))(
  ( (Unit!15923) )
))
(declare-fun lt!235816 () Unit!15922)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32994 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15922)

(assert (=> b!515118 (= lt!235816 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515119 () Bool)

(assert (=> b!515119 (= e!300804 true)))

(assert (=> b!515119 (and (bvslt (x!48487 lt!235818) #b01111111111111111111111111111110) (or (= (select (arr!15865 a!3235) (index!19518 lt!235818)) (select (arr!15865 a!3235) j!176)) (= (select (arr!15865 a!3235) (index!19518 lt!235818)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15865 a!3235) (index!19518 lt!235818)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515120 () Bool)

(declare-fun res!314688 () Bool)

(assert (=> b!515120 (=> (not res!314688) (not e!300800))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515120 (= res!314688 (validKeyInArray!0 k0!2280))))

(declare-fun b!515121 () Bool)

(declare-fun res!314687 () Bool)

(assert (=> b!515121 (=> (not res!314687) (not e!300800))))

(declare-fun arrayContainsKey!0 (array!32994 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515121 (= res!314687 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!515122 () Bool)

(declare-fun res!314685 () Bool)

(assert (=> b!515122 (=> (not res!314685) (not e!300800))))

(assert (=> b!515122 (= res!314685 (and (= (size!16229 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16229 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16229 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!515123 () Bool)

(declare-fun res!314680 () Bool)

(assert (=> b!515123 (=> (not res!314680) (not e!300803))))

(declare-datatypes ((List!10023 0))(
  ( (Nil!10020) (Cons!10019 (h!10917 (_ BitVec 64)) (t!16251 List!10023)) )
))
(declare-fun arrayNoDuplicates!0 (array!32994 (_ BitVec 32) List!10023) Bool)

(assert (=> b!515123 (= res!314680 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10020))))

(declare-fun b!515124 () Bool)

(assert (=> b!515124 (= e!300801 (= (seekEntryOrOpen!0 (select (arr!15865 a!3235) j!176) a!3235 mask!3524) (Found!4332 j!176)))))

(declare-fun b!515125 () Bool)

(declare-fun res!314690 () Bool)

(assert (=> b!515125 (=> (not res!314690) (not e!300800))))

(assert (=> b!515125 (= res!314690 (validKeyInArray!0 (select (arr!15865 a!3235) j!176)))))

(declare-fun res!314689 () Bool)

(assert (=> start!46682 (=> (not res!314689) (not e!300800))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46682 (= res!314689 (validMask!0 mask!3524))))

(assert (=> start!46682 e!300800))

(assert (=> start!46682 true))

(declare-fun array_inv!11661 (array!32994) Bool)

(assert (=> start!46682 (array_inv!11661 a!3235)))

(declare-fun b!515126 () Bool)

(declare-fun res!314681 () Bool)

(assert (=> b!515126 (=> (not res!314681) (not e!300803))))

(assert (=> b!515126 (= res!314681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!46682 res!314689) b!515122))

(assert (= (and b!515122 res!314685) b!515125))

(assert (= (and b!515125 res!314690) b!515120))

(assert (= (and b!515120 res!314688) b!515121))

(assert (= (and b!515121 res!314687) b!515116))

(assert (= (and b!515116 res!314683) b!515126))

(assert (= (and b!515126 res!314681) b!515123))

(assert (= (and b!515123 res!314680) b!515118))

(assert (= (and b!515118 res!314684) b!515124))

(assert (= (and b!515118 (not res!314682)) b!515117))

(assert (= (and b!515117 (not res!314686)) b!515119))

(declare-fun m!496403 () Bool)

(assert (=> b!515124 m!496403))

(assert (=> b!515124 m!496403))

(declare-fun m!496405 () Bool)

(assert (=> b!515124 m!496405))

(declare-fun m!496407 () Bool)

(assert (=> b!515116 m!496407))

(assert (=> b!515125 m!496403))

(assert (=> b!515125 m!496403))

(declare-fun m!496409 () Bool)

(assert (=> b!515125 m!496409))

(declare-fun m!496411 () Bool)

(assert (=> b!515120 m!496411))

(declare-fun m!496413 () Bool)

(assert (=> start!46682 m!496413))

(declare-fun m!496415 () Bool)

(assert (=> start!46682 m!496415))

(declare-fun m!496417 () Bool)

(assert (=> b!515123 m!496417))

(declare-fun m!496419 () Bool)

(assert (=> b!515119 m!496419))

(assert (=> b!515119 m!496403))

(declare-fun m!496421 () Bool)

(assert (=> b!515121 m!496421))

(declare-fun m!496423 () Bool)

(assert (=> b!515126 m!496423))

(assert (=> b!515118 m!496403))

(declare-fun m!496425 () Bool)

(assert (=> b!515118 m!496425))

(declare-fun m!496427 () Bool)

(assert (=> b!515118 m!496427))

(declare-fun m!496429 () Bool)

(assert (=> b!515118 m!496429))

(declare-fun m!496431 () Bool)

(assert (=> b!515118 m!496431))

(assert (=> b!515118 m!496403))

(declare-fun m!496433 () Bool)

(assert (=> b!515118 m!496433))

(assert (=> b!515118 m!496403))

(assert (=> b!515118 m!496431))

(declare-fun m!496435 () Bool)

(assert (=> b!515118 m!496435))

(assert (=> b!515118 m!496431))

(declare-fun m!496437 () Bool)

(assert (=> b!515118 m!496437))

(declare-fun m!496439 () Bool)

(assert (=> b!515118 m!496439))

(check-sat (not b!515123) (not b!515126) (not b!515125) (not b!515116) (not b!515121) (not start!46682) (not b!515118) (not b!515120) (not b!515124))
(check-sat)
