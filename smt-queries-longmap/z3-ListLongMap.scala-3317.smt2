; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45848 () Bool)

(assert start!45848)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32604 0))(
  ( (array!32605 (arr!15682 (Array (_ BitVec 32) (_ BitVec 64))) (size!16046 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32604)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!297147 () Bool)

(declare-fun b!507775 () Bool)

(declare-datatypes ((SeekEntryResult!4149 0))(
  ( (MissingZero!4149 (index!18784 (_ BitVec 32))) (Found!4149 (index!18785 (_ BitVec 32))) (Intermediate!4149 (undefined!4961 Bool) (index!18786 (_ BitVec 32)) (x!47774 (_ BitVec 32))) (Undefined!4149) (MissingVacant!4149 (index!18787 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32604 (_ BitVec 32)) SeekEntryResult!4149)

(assert (=> b!507775 (= e!297147 (= (seekEntryOrOpen!0 (select (arr!15682 a!3235) j!176) a!3235 mask!3524) (Found!4149 j!176)))))

(declare-fun b!507776 () Bool)

(declare-fun res!308744 () Bool)

(declare-fun e!297145 () Bool)

(assert (=> b!507776 (=> (not res!308744) (not e!297145))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507776 (= res!308744 (validKeyInArray!0 k0!2280))))

(declare-fun b!507777 () Bool)

(declare-fun res!308735 () Bool)

(declare-fun e!297146 () Bool)

(assert (=> b!507777 (=> (not res!308735) (not e!297146))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32604 (_ BitVec 32)) Bool)

(assert (=> b!507777 (= res!308735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507778 () Bool)

(declare-fun res!308736 () Bool)

(assert (=> b!507778 (=> (not res!308736) (not e!297145))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507778 (= res!308736 (and (= (size!16046 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16046 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16046 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507779 () Bool)

(assert (=> b!507779 (= e!297145 e!297146)))

(declare-fun res!308740 () Bool)

(assert (=> b!507779 (=> (not res!308740) (not e!297146))))

(declare-fun lt!232002 () SeekEntryResult!4149)

(assert (=> b!507779 (= res!308740 (or (= lt!232002 (MissingZero!4149 i!1204)) (= lt!232002 (MissingVacant!4149 i!1204))))))

(assert (=> b!507779 (= lt!232002 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!308734 () Bool)

(assert (=> start!45848 (=> (not res!308734) (not e!297145))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45848 (= res!308734 (validMask!0 mask!3524))))

(assert (=> start!45848 e!297145))

(assert (=> start!45848 true))

(declare-fun array_inv!11478 (array!32604) Bool)

(assert (=> start!45848 (array_inv!11478 a!3235)))

(declare-fun b!507780 () Bool)

(declare-fun e!297150 () Bool)

(declare-fun e!297148 () Bool)

(assert (=> b!507780 (= e!297150 e!297148)))

(declare-fun res!308737 () Bool)

(assert (=> b!507780 (=> res!308737 e!297148)))

(declare-fun lt!231998 () Bool)

(declare-fun lt!232004 () SeekEntryResult!4149)

(assert (=> b!507780 (= res!308737 (or (and (not lt!231998) (undefined!4961 lt!232004)) (and (not lt!231998) (not (undefined!4961 lt!232004)))))))

(get-info :version)

(assert (=> b!507780 (= lt!231998 (not ((_ is Intermediate!4149) lt!232004)))))

(declare-fun b!507781 () Bool)

(declare-fun res!308741 () Bool)

(assert (=> b!507781 (=> (not res!308741) (not e!297146))))

(declare-datatypes ((List!9840 0))(
  ( (Nil!9837) (Cons!9836 (h!10713 (_ BitVec 64)) (t!16068 List!9840)) )
))
(declare-fun arrayNoDuplicates!0 (array!32604 (_ BitVec 32) List!9840) Bool)

(assert (=> b!507781 (= res!308741 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9837))))

(declare-fun b!507782 () Bool)

(declare-fun res!308743 () Bool)

(assert (=> b!507782 (=> (not res!308743) (not e!297145))))

(declare-fun arrayContainsKey!0 (array!32604 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507782 (= res!308743 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507783 () Bool)

(assert (=> b!507783 (= e!297146 (not e!297150))))

(declare-fun res!308742 () Bool)

(assert (=> b!507783 (=> res!308742 e!297150)))

(declare-fun lt!232000 () array!32604)

(declare-fun lt!232001 () (_ BitVec 64))

(declare-fun lt!232005 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32604 (_ BitVec 32)) SeekEntryResult!4149)

(assert (=> b!507783 (= res!308742 (= lt!232004 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232005 lt!232001 lt!232000 mask!3524)))))

(declare-fun lt!232003 () (_ BitVec 32))

(assert (=> b!507783 (= lt!232004 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232003 (select (arr!15682 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507783 (= lt!232005 (toIndex!0 lt!232001 mask!3524))))

(assert (=> b!507783 (= lt!232001 (select (store (arr!15682 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!507783 (= lt!232003 (toIndex!0 (select (arr!15682 a!3235) j!176) mask!3524))))

(assert (=> b!507783 (= lt!232000 (array!32605 (store (arr!15682 a!3235) i!1204 k0!2280) (size!16046 a!3235)))))

(assert (=> b!507783 e!297147))

(declare-fun res!308738 () Bool)

(assert (=> b!507783 (=> (not res!308738) (not e!297147))))

(assert (=> b!507783 (= res!308738 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15586 0))(
  ( (Unit!15587) )
))
(declare-fun lt!231999 () Unit!15586)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32604 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15586)

(assert (=> b!507783 (= lt!231999 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!507784 () Bool)

(declare-fun res!308739 () Bool)

(assert (=> b!507784 (=> (not res!308739) (not e!297145))))

(assert (=> b!507784 (= res!308739 (validKeyInArray!0 (select (arr!15682 a!3235) j!176)))))

(declare-fun b!507785 () Bool)

(assert (=> b!507785 (= e!297148 true)))

(declare-fun lt!232006 () SeekEntryResult!4149)

(assert (=> b!507785 (= lt!232006 (seekEntryOrOpen!0 lt!232001 lt!232000 mask!3524))))

(assert (=> b!507785 false))

(assert (= (and start!45848 res!308734) b!507778))

(assert (= (and b!507778 res!308736) b!507784))

(assert (= (and b!507784 res!308739) b!507776))

(assert (= (and b!507776 res!308744) b!507782))

(assert (= (and b!507782 res!308743) b!507779))

(assert (= (and b!507779 res!308740) b!507777))

(assert (= (and b!507777 res!308735) b!507781))

(assert (= (and b!507781 res!308741) b!507783))

(assert (= (and b!507783 res!308738) b!507775))

(assert (= (and b!507783 (not res!308742)) b!507780))

(assert (= (and b!507780 (not res!308737)) b!507785))

(declare-fun m!488597 () Bool)

(assert (=> b!507785 m!488597))

(declare-fun m!488599 () Bool)

(assert (=> b!507783 m!488599))

(declare-fun m!488601 () Bool)

(assert (=> b!507783 m!488601))

(declare-fun m!488603 () Bool)

(assert (=> b!507783 m!488603))

(declare-fun m!488605 () Bool)

(assert (=> b!507783 m!488605))

(declare-fun m!488607 () Bool)

(assert (=> b!507783 m!488607))

(assert (=> b!507783 m!488605))

(declare-fun m!488609 () Bool)

(assert (=> b!507783 m!488609))

(declare-fun m!488611 () Bool)

(assert (=> b!507783 m!488611))

(assert (=> b!507783 m!488605))

(declare-fun m!488613 () Bool)

(assert (=> b!507783 m!488613))

(declare-fun m!488615 () Bool)

(assert (=> b!507783 m!488615))

(declare-fun m!488617 () Bool)

(assert (=> start!45848 m!488617))

(declare-fun m!488619 () Bool)

(assert (=> start!45848 m!488619))

(declare-fun m!488621 () Bool)

(assert (=> b!507782 m!488621))

(assert (=> b!507784 m!488605))

(assert (=> b!507784 m!488605))

(declare-fun m!488623 () Bool)

(assert (=> b!507784 m!488623))

(declare-fun m!488625 () Bool)

(assert (=> b!507779 m!488625))

(declare-fun m!488627 () Bool)

(assert (=> b!507776 m!488627))

(declare-fun m!488629 () Bool)

(assert (=> b!507777 m!488629))

(assert (=> b!507775 m!488605))

(assert (=> b!507775 m!488605))

(declare-fun m!488631 () Bool)

(assert (=> b!507775 m!488631))

(declare-fun m!488633 () Bool)

(assert (=> b!507781 m!488633))

(check-sat (not b!507777) (not start!45848) (not b!507784) (not b!507782) (not b!507781) (not b!507785) (not b!507779) (not b!507783) (not b!507775) (not b!507776))
(check-sat)
