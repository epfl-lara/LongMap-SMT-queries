; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45968 () Bool)

(assert start!45968)

(declare-fun b!508866 () Bool)

(declare-fun res!309715 () Bool)

(declare-fun e!297669 () Bool)

(assert (=> b!508866 (=> (not res!309715) (not e!297669))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508866 (= res!309715 (validKeyInArray!0 k0!2280))))

(declare-fun b!508867 () Bool)

(declare-fun res!309718 () Bool)

(assert (=> b!508867 (=> (not res!309718) (not e!297669))))

(declare-datatypes ((array!32679 0))(
  ( (array!32680 (arr!15718 (Array (_ BitVec 32) (_ BitVec 64))) (size!16082 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32679)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!508867 (= res!309718 (validKeyInArray!0 (select (arr!15718 a!3235) j!176)))))

(declare-fun b!508868 () Bool)

(declare-fun e!297668 () Bool)

(assert (=> b!508868 (= e!297669 e!297668)))

(declare-fun res!309714 () Bool)

(assert (=> b!508868 (=> (not res!309714) (not e!297668))))

(declare-datatypes ((SeekEntryResult!4185 0))(
  ( (MissingZero!4185 (index!18928 (_ BitVec 32))) (Found!4185 (index!18929 (_ BitVec 32))) (Intermediate!4185 (undefined!4997 Bool) (index!18930 (_ BitVec 32)) (x!47906 (_ BitVec 32))) (Undefined!4185) (MissingVacant!4185 (index!18931 (_ BitVec 32))) )
))
(declare-fun lt!232378 () SeekEntryResult!4185)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!508868 (= res!309714 (or (= lt!232378 (MissingZero!4185 i!1204)) (= lt!232378 (MissingVacant!4185 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32679 (_ BitVec 32)) SeekEntryResult!4185)

(assert (=> b!508868 (= lt!232378 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!508869 () Bool)

(declare-fun res!309711 () Bool)

(assert (=> b!508869 (=> (not res!309711) (not e!297668))))

(declare-datatypes ((List!9876 0))(
  ( (Nil!9873) (Cons!9872 (h!10749 (_ BitVec 64)) (t!16104 List!9876)) )
))
(declare-fun arrayNoDuplicates!0 (array!32679 (_ BitVec 32) List!9876) Bool)

(assert (=> b!508869 (= res!309711 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9873))))

(declare-fun b!508870 () Bool)

(assert (=> b!508870 (= e!297668 (not true))))

(declare-fun e!297666 () Bool)

(assert (=> b!508870 e!297666))

(declare-fun res!309713 () Bool)

(assert (=> b!508870 (=> (not res!309713) (not e!297666))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32679 (_ BitVec 32)) Bool)

(assert (=> b!508870 (= res!309713 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15628 0))(
  ( (Unit!15629) )
))
(declare-fun lt!232377 () Unit!15628)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32679 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15628)

(assert (=> b!508870 (= lt!232377 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!508871 () Bool)

(assert (=> b!508871 (= e!297666 (= (seekEntryOrOpen!0 (select (arr!15718 a!3235) j!176) a!3235 mask!3524) (Found!4185 j!176)))))

(declare-fun b!508872 () Bool)

(declare-fun res!309716 () Bool)

(assert (=> b!508872 (=> (not res!309716) (not e!297669))))

(assert (=> b!508872 (= res!309716 (and (= (size!16082 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16082 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16082 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508873 () Bool)

(declare-fun res!309719 () Bool)

(assert (=> b!508873 (=> (not res!309719) (not e!297669))))

(declare-fun arrayContainsKey!0 (array!32679 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508873 (= res!309719 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508874 () Bool)

(declare-fun res!309712 () Bool)

(assert (=> b!508874 (=> (not res!309712) (not e!297668))))

(assert (=> b!508874 (= res!309712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!309717 () Bool)

(assert (=> start!45968 (=> (not res!309717) (not e!297669))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45968 (= res!309717 (validMask!0 mask!3524))))

(assert (=> start!45968 e!297669))

(assert (=> start!45968 true))

(declare-fun array_inv!11514 (array!32679) Bool)

(assert (=> start!45968 (array_inv!11514 a!3235)))

(assert (= (and start!45968 res!309717) b!508872))

(assert (= (and b!508872 res!309716) b!508867))

(assert (= (and b!508867 res!309718) b!508866))

(assert (= (and b!508866 res!309715) b!508873))

(assert (= (and b!508873 res!309719) b!508868))

(assert (= (and b!508868 res!309714) b!508874))

(assert (= (and b!508874 res!309712) b!508869))

(assert (= (and b!508869 res!309711) b!508870))

(assert (= (and b!508870 res!309713) b!508871))

(declare-fun m!489603 () Bool)

(assert (=> b!508869 m!489603))

(declare-fun m!489605 () Bool)

(assert (=> b!508871 m!489605))

(assert (=> b!508871 m!489605))

(declare-fun m!489607 () Bool)

(assert (=> b!508871 m!489607))

(declare-fun m!489609 () Bool)

(assert (=> b!508874 m!489609))

(declare-fun m!489611 () Bool)

(assert (=> b!508868 m!489611))

(declare-fun m!489613 () Bool)

(assert (=> b!508866 m!489613))

(declare-fun m!489615 () Bool)

(assert (=> start!45968 m!489615))

(declare-fun m!489617 () Bool)

(assert (=> start!45968 m!489617))

(declare-fun m!489619 () Bool)

(assert (=> b!508870 m!489619))

(declare-fun m!489621 () Bool)

(assert (=> b!508870 m!489621))

(assert (=> b!508867 m!489605))

(assert (=> b!508867 m!489605))

(declare-fun m!489623 () Bool)

(assert (=> b!508867 m!489623))

(declare-fun m!489625 () Bool)

(assert (=> b!508873 m!489625))

(check-sat (not b!508874) (not b!508866) (not b!508871) (not b!508869) (not b!508868) (not b!508870) (not b!508873) (not b!508867) (not start!45968))
(check-sat)
