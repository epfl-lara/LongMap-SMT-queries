; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46674 () Bool)

(assert start!46674)

(declare-fun b!514911 () Bool)

(declare-fun e!300657 () Bool)

(declare-fun e!300660 () Bool)

(assert (=> b!514911 (= e!300657 (not e!300660))))

(declare-fun res!314618 () Bool)

(assert (=> b!514911 (=> res!314618 e!300660)))

(declare-datatypes ((SeekEntryResult!4330 0))(
  ( (MissingZero!4330 (index!19508 (_ BitVec 32))) (Found!4330 (index!19509 (_ BitVec 32))) (Intermediate!4330 (undefined!5142 Bool) (index!19510 (_ BitVec 32)) (x!48488 (_ BitVec 32))) (Undefined!4330) (MissingVacant!4330 (index!19511 (_ BitVec 32))) )
))
(declare-fun lt!235615 () SeekEntryResult!4330)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32996 0))(
  ( (array!32997 (arr!15866 (Array (_ BitVec 32) (_ BitVec 64))) (size!16231 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32996)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!235614 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32996 (_ BitVec 32)) SeekEntryResult!4330)

(assert (=> b!514911 (= res!314618 (= lt!235615 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235614 (select (store (arr!15866 a!3235) i!1204 k0!2280) j!176) (array!32997 (store (arr!15866 a!3235) i!1204 k0!2280) (size!16231 a!3235)) mask!3524)))))

(declare-fun lt!235612 () (_ BitVec 32))

(assert (=> b!514911 (= lt!235615 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235612 (select (arr!15866 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!514911 (= lt!235614 (toIndex!0 (select (store (arr!15866 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!514911 (= lt!235612 (toIndex!0 (select (arr!15866 a!3235) j!176) mask!3524))))

(declare-fun e!300658 () Bool)

(assert (=> b!514911 e!300658))

(declare-fun res!314624 () Bool)

(assert (=> b!514911 (=> (not res!314624) (not e!300658))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32996 (_ BitVec 32)) Bool)

(assert (=> b!514911 (= res!314624 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15904 0))(
  ( (Unit!15905) )
))
(declare-fun lt!235611 () Unit!15904)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32996 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15904)

(assert (=> b!514911 (= lt!235611 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!514912 () Bool)

(assert (=> b!514912 (= e!300660 true)))

(assert (=> b!514912 (and (bvslt (x!48488 lt!235615) #b01111111111111111111111111111110) (or (= (select (arr!15866 a!3235) (index!19510 lt!235615)) (select (arr!15866 a!3235) j!176)) (= (select (arr!15866 a!3235) (index!19510 lt!235615)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15866 a!3235) (index!19510 lt!235615)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!514914 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32996 (_ BitVec 32)) SeekEntryResult!4330)

(assert (=> b!514914 (= e!300658 (= (seekEntryOrOpen!0 (select (arr!15866 a!3235) j!176) a!3235 mask!3524) (Found!4330 j!176)))))

(declare-fun b!514915 () Bool)

(declare-fun res!314621 () Bool)

(assert (=> b!514915 (=> res!314621 e!300660)))

(get-info :version)

(assert (=> b!514915 (= res!314621 (or (undefined!5142 lt!235615) (not ((_ is Intermediate!4330) lt!235615))))))

(declare-fun b!514916 () Bool)

(declare-fun res!314617 () Bool)

(declare-fun e!300656 () Bool)

(assert (=> b!514916 (=> (not res!314617) (not e!300656))))

(assert (=> b!514916 (= res!314617 (and (= (size!16231 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16231 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16231 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!514917 () Bool)

(assert (=> b!514917 (= e!300656 e!300657)))

(declare-fun res!314622 () Bool)

(assert (=> b!514917 (=> (not res!314622) (not e!300657))))

(declare-fun lt!235613 () SeekEntryResult!4330)

(assert (=> b!514917 (= res!314622 (or (= lt!235613 (MissingZero!4330 i!1204)) (= lt!235613 (MissingVacant!4330 i!1204))))))

(assert (=> b!514917 (= lt!235613 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!514918 () Bool)

(declare-fun res!314627 () Bool)

(assert (=> b!514918 (=> (not res!314627) (not e!300657))))

(declare-datatypes ((List!10063 0))(
  ( (Nil!10060) (Cons!10059 (h!10957 (_ BitVec 64)) (t!16282 List!10063)) )
))
(declare-fun arrayNoDuplicates!0 (array!32996 (_ BitVec 32) List!10063) Bool)

(assert (=> b!514918 (= res!314627 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10060))))

(declare-fun b!514919 () Bool)

(declare-fun res!314626 () Bool)

(assert (=> b!514919 (=> (not res!314626) (not e!300657))))

(assert (=> b!514919 (= res!314626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!314623 () Bool)

(assert (=> start!46674 (=> (not res!314623) (not e!300656))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46674 (= res!314623 (validMask!0 mask!3524))))

(assert (=> start!46674 e!300656))

(assert (=> start!46674 true))

(declare-fun array_inv!11749 (array!32996) Bool)

(assert (=> start!46674 (array_inv!11749 a!3235)))

(declare-fun b!514913 () Bool)

(declare-fun res!314625 () Bool)

(assert (=> b!514913 (=> (not res!314625) (not e!300656))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!514913 (= res!314625 (validKeyInArray!0 k0!2280))))

(declare-fun b!514920 () Bool)

(declare-fun res!314619 () Bool)

(assert (=> b!514920 (=> (not res!314619) (not e!300656))))

(declare-fun arrayContainsKey!0 (array!32996 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!514920 (= res!314619 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!514921 () Bool)

(declare-fun res!314620 () Bool)

(assert (=> b!514921 (=> (not res!314620) (not e!300656))))

(assert (=> b!514921 (= res!314620 (validKeyInArray!0 (select (arr!15866 a!3235) j!176)))))

(assert (= (and start!46674 res!314623) b!514916))

(assert (= (and b!514916 res!314617) b!514921))

(assert (= (and b!514921 res!314620) b!514913))

(assert (= (and b!514913 res!314625) b!514920))

(assert (= (and b!514920 res!314619) b!514917))

(assert (= (and b!514917 res!314622) b!514919))

(assert (= (and b!514919 res!314626) b!514918))

(assert (= (and b!514918 res!314627) b!514911))

(assert (= (and b!514911 res!314624) b!514914))

(assert (= (and b!514911 (not res!314618)) b!514915))

(assert (= (and b!514915 (not res!314621)) b!514912))

(declare-fun m!495727 () Bool)

(assert (=> b!514911 m!495727))

(declare-fun m!495729 () Bool)

(assert (=> b!514911 m!495729))

(declare-fun m!495731 () Bool)

(assert (=> b!514911 m!495731))

(declare-fun m!495733 () Bool)

(assert (=> b!514911 m!495733))

(declare-fun m!495735 () Bool)

(assert (=> b!514911 m!495735))

(assert (=> b!514911 m!495727))

(declare-fun m!495737 () Bool)

(assert (=> b!514911 m!495737))

(assert (=> b!514911 m!495727))

(declare-fun m!495739 () Bool)

(assert (=> b!514911 m!495739))

(assert (=> b!514911 m!495735))

(declare-fun m!495741 () Bool)

(assert (=> b!514911 m!495741))

(assert (=> b!514911 m!495735))

(declare-fun m!495743 () Bool)

(assert (=> b!514911 m!495743))

(declare-fun m!495745 () Bool)

(assert (=> b!514913 m!495745))

(declare-fun m!495747 () Bool)

(assert (=> b!514918 m!495747))

(declare-fun m!495749 () Bool)

(assert (=> b!514912 m!495749))

(assert (=> b!514912 m!495727))

(declare-fun m!495751 () Bool)

(assert (=> b!514919 m!495751))

(assert (=> b!514921 m!495727))

(assert (=> b!514921 m!495727))

(declare-fun m!495753 () Bool)

(assert (=> b!514921 m!495753))

(declare-fun m!495755 () Bool)

(assert (=> start!46674 m!495755))

(declare-fun m!495757 () Bool)

(assert (=> start!46674 m!495757))

(declare-fun m!495759 () Bool)

(assert (=> b!514920 m!495759))

(declare-fun m!495761 () Bool)

(assert (=> b!514917 m!495761))

(assert (=> b!514914 m!495727))

(assert (=> b!514914 m!495727))

(declare-fun m!495763 () Bool)

(assert (=> b!514914 m!495763))

(check-sat (not b!514917) (not b!514918) (not b!514919) (not b!514920) (not b!514913) (not b!514921) (not b!514911) (not start!46674) (not b!514914))
(check-sat)
