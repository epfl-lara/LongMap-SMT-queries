; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45836 () Bool)

(assert start!45836)

(declare-fun b!507681 () Bool)

(declare-fun res!308699 () Bool)

(declare-fun e!297092 () Bool)

(assert (=> b!507681 (=> (not res!308699) (not e!297092))))

(declare-datatypes ((array!32593 0))(
  ( (array!32594 (arr!15676 (Array (_ BitVec 32) (_ BitVec 64))) (size!16040 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32593)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32593 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507681 (= res!308699 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507682 () Bool)

(declare-fun res!308700 () Bool)

(assert (=> b!507682 (=> (not res!308700) (not e!297092))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507682 (= res!308700 (validKeyInArray!0 (select (arr!15676 a!3235) j!176)))))

(declare-fun b!507683 () Bool)

(declare-fun e!297089 () Bool)

(assert (=> b!507683 (= e!297092 e!297089)))

(declare-fun res!308698 () Bool)

(assert (=> b!507683 (=> (not res!308698) (not e!297089))))

(declare-datatypes ((SeekEntryResult!4099 0))(
  ( (MissingZero!4099 (index!18584 (_ BitVec 32))) (Found!4099 (index!18585 (_ BitVec 32))) (Intermediate!4099 (undefined!4911 Bool) (index!18586 (_ BitVec 32)) (x!47721 (_ BitVec 32))) (Undefined!4099) (MissingVacant!4099 (index!18587 (_ BitVec 32))) )
))
(declare-fun lt!231984 () SeekEntryResult!4099)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507683 (= res!308698 (or (= lt!231984 (MissingZero!4099 i!1204)) (= lt!231984 (MissingVacant!4099 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32593 (_ BitVec 32)) SeekEntryResult!4099)

(assert (=> b!507683 (= lt!231984 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!507684 () Bool)

(declare-fun e!297091 () Bool)

(assert (=> b!507684 (= e!297091 true)))

(declare-fun lt!231991 () array!32593)

(declare-fun lt!231987 () SeekEntryResult!4099)

(declare-fun lt!231985 () (_ BitVec 64))

(assert (=> b!507684 (= lt!231987 (seekEntryOrOpen!0 lt!231985 lt!231991 mask!3524))))

(assert (=> b!507684 false))

(declare-fun b!507685 () Bool)

(declare-fun res!308703 () Bool)

(assert (=> b!507685 (=> (not res!308703) (not e!297089))))

(declare-datatypes ((List!9741 0))(
  ( (Nil!9738) (Cons!9737 (h!10614 (_ BitVec 64)) (t!15961 List!9741)) )
))
(declare-fun arrayNoDuplicates!0 (array!32593 (_ BitVec 32) List!9741) Bool)

(assert (=> b!507685 (= res!308703 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9738))))

(declare-fun b!507686 () Bool)

(declare-fun e!297093 () Bool)

(assert (=> b!507686 (= e!297089 (not e!297093))))

(declare-fun res!308701 () Bool)

(assert (=> b!507686 (=> res!308701 e!297093)))

(declare-fun lt!231989 () (_ BitVec 32))

(declare-fun lt!231983 () SeekEntryResult!4099)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32593 (_ BitVec 32)) SeekEntryResult!4099)

(assert (=> b!507686 (= res!308701 (= lt!231983 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231989 lt!231985 lt!231991 mask!3524)))))

(declare-fun lt!231986 () (_ BitVec 32))

(assert (=> b!507686 (= lt!231983 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231986 (select (arr!15676 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507686 (= lt!231989 (toIndex!0 lt!231985 mask!3524))))

(assert (=> b!507686 (= lt!231985 (select (store (arr!15676 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!507686 (= lt!231986 (toIndex!0 (select (arr!15676 a!3235) j!176) mask!3524))))

(assert (=> b!507686 (= lt!231991 (array!32594 (store (arr!15676 a!3235) i!1204 k0!2280) (size!16040 a!3235)))))

(declare-fun e!297090 () Bool)

(assert (=> b!507686 e!297090))

(declare-fun res!308704 () Bool)

(assert (=> b!507686 (=> (not res!308704) (not e!297090))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32593 (_ BitVec 32)) Bool)

(assert (=> b!507686 (= res!308704 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15547 0))(
  ( (Unit!15548) )
))
(declare-fun lt!231990 () Unit!15547)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32593 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15547)

(assert (=> b!507686 (= lt!231990 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!507687 () Bool)

(declare-fun res!308696 () Bool)

(assert (=> b!507687 (=> (not res!308696) (not e!297092))))

(assert (=> b!507687 (= res!308696 (and (= (size!16040 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16040 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16040 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507688 () Bool)

(assert (=> b!507688 (= e!297090 (= (seekEntryOrOpen!0 (select (arr!15676 a!3235) j!176) a!3235 mask!3524) (Found!4099 j!176)))))

(declare-fun b!507689 () Bool)

(declare-fun res!308694 () Bool)

(assert (=> b!507689 (=> (not res!308694) (not e!297089))))

(assert (=> b!507689 (= res!308694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507690 () Bool)

(assert (=> b!507690 (= e!297093 e!297091)))

(declare-fun res!308697 () Bool)

(assert (=> b!507690 (=> res!308697 e!297091)))

(declare-fun lt!231988 () Bool)

(assert (=> b!507690 (= res!308697 (or (and (not lt!231988) (undefined!4911 lt!231983)) (and (not lt!231988) (not (undefined!4911 lt!231983)))))))

(get-info :version)

(assert (=> b!507690 (= lt!231988 (not ((_ is Intermediate!4099) lt!231983)))))

(declare-fun res!308702 () Bool)

(assert (=> start!45836 (=> (not res!308702) (not e!297092))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45836 (= res!308702 (validMask!0 mask!3524))))

(assert (=> start!45836 e!297092))

(assert (=> start!45836 true))

(declare-fun array_inv!11535 (array!32593) Bool)

(assert (=> start!45836 (array_inv!11535 a!3235)))

(declare-fun b!507691 () Bool)

(declare-fun res!308695 () Bool)

(assert (=> b!507691 (=> (not res!308695) (not e!297092))))

(assert (=> b!507691 (= res!308695 (validKeyInArray!0 k0!2280))))

(assert (= (and start!45836 res!308702) b!507687))

(assert (= (and b!507687 res!308696) b!507682))

(assert (= (and b!507682 res!308700) b!507691))

(assert (= (and b!507691 res!308695) b!507681))

(assert (= (and b!507681 res!308699) b!507683))

(assert (= (and b!507683 res!308698) b!507689))

(assert (= (and b!507689 res!308694) b!507685))

(assert (= (and b!507685 res!308703) b!507686))

(assert (= (and b!507686 res!308704) b!507688))

(assert (= (and b!507686 (not res!308701)) b!507690))

(assert (= (and b!507690 (not res!308697)) b!507684))

(declare-fun m!488743 () Bool)

(assert (=> b!507682 m!488743))

(assert (=> b!507682 m!488743))

(declare-fun m!488745 () Bool)

(assert (=> b!507682 m!488745))

(declare-fun m!488747 () Bool)

(assert (=> b!507683 m!488747))

(declare-fun m!488749 () Bool)

(assert (=> b!507691 m!488749))

(declare-fun m!488751 () Bool)

(assert (=> b!507685 m!488751))

(declare-fun m!488753 () Bool)

(assert (=> b!507689 m!488753))

(declare-fun m!488755 () Bool)

(assert (=> start!45836 m!488755))

(declare-fun m!488757 () Bool)

(assert (=> start!45836 m!488757))

(declare-fun m!488759 () Bool)

(assert (=> b!507681 m!488759))

(declare-fun m!488761 () Bool)

(assert (=> b!507684 m!488761))

(assert (=> b!507688 m!488743))

(assert (=> b!507688 m!488743))

(declare-fun m!488763 () Bool)

(assert (=> b!507688 m!488763))

(declare-fun m!488765 () Bool)

(assert (=> b!507686 m!488765))

(declare-fun m!488767 () Bool)

(assert (=> b!507686 m!488767))

(declare-fun m!488769 () Bool)

(assert (=> b!507686 m!488769))

(assert (=> b!507686 m!488743))

(declare-fun m!488771 () Bool)

(assert (=> b!507686 m!488771))

(assert (=> b!507686 m!488743))

(declare-fun m!488773 () Bool)

(assert (=> b!507686 m!488773))

(assert (=> b!507686 m!488743))

(declare-fun m!488775 () Bool)

(assert (=> b!507686 m!488775))

(declare-fun m!488777 () Bool)

(assert (=> b!507686 m!488777))

(declare-fun m!488779 () Bool)

(assert (=> b!507686 m!488779))

(check-sat (not b!507689) (not b!507683) (not b!507685) (not b!507686) (not b!507684) (not b!507691) (not b!507688) (not b!507682) (not b!507681) (not start!45836))
(check-sat)
