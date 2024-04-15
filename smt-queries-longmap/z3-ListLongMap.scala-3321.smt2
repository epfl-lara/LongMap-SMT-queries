; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45858 () Bool)

(assert start!45858)

(declare-fun b!507789 () Bool)

(declare-fun res!308892 () Bool)

(declare-fun e!297111 () Bool)

(assert (=> b!507789 (=> (not res!308892) (not e!297111))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32624 0))(
  ( (array!32625 (arr!15692 (Array (_ BitVec 32) (_ BitVec 64))) (size!16057 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32624)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!507789 (= res!308892 (and (= (size!16057 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16057 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16057 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507790 () Bool)

(declare-fun res!308897 () Bool)

(assert (=> b!507790 (=> (not res!308897) (not e!297111))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507790 (= res!308897 (validKeyInArray!0 k0!2280))))

(declare-fun b!507791 () Bool)

(declare-fun e!297109 () Bool)

(assert (=> b!507791 (= e!297109 (bvsgt #b00000000000000000000000000000000 (size!16057 a!3235)))))

(declare-fun b!507792 () Bool)

(declare-fun res!308895 () Bool)

(assert (=> b!507792 (=> (not res!308895) (not e!297111))))

(declare-fun arrayContainsKey!0 (array!32624 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507792 (= res!308895 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507793 () Bool)

(assert (=> b!507793 (= e!297111 e!297109)))

(declare-fun res!308894 () Bool)

(assert (=> b!507793 (=> (not res!308894) (not e!297109))))

(declare-datatypes ((SeekEntryResult!4156 0))(
  ( (MissingZero!4156 (index!18812 (_ BitVec 32))) (Found!4156 (index!18813 (_ BitVec 32))) (Intermediate!4156 (undefined!4968 Bool) (index!18814 (_ BitVec 32)) (x!47808 (_ BitVec 32))) (Undefined!4156) (MissingVacant!4156 (index!18815 (_ BitVec 32))) )
))
(declare-fun lt!231919 () SeekEntryResult!4156)

(assert (=> b!507793 (= res!308894 (or (= lt!231919 (MissingZero!4156 i!1204)) (= lt!231919 (MissingVacant!4156 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32624 (_ BitVec 32)) SeekEntryResult!4156)

(assert (=> b!507793 (= lt!231919 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!507794 () Bool)

(declare-fun res!308896 () Bool)

(assert (=> b!507794 (=> (not res!308896) (not e!297109))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32624 (_ BitVec 32)) Bool)

(assert (=> b!507794 (= res!308896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507795 () Bool)

(declare-fun res!308890 () Bool)

(assert (=> b!507795 (=> (not res!308890) (not e!297111))))

(assert (=> b!507795 (= res!308890 (validKeyInArray!0 (select (arr!15692 a!3235) j!176)))))

(declare-fun res!308893 () Bool)

(assert (=> start!45858 (=> (not res!308893) (not e!297111))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45858 (= res!308893 (validMask!0 mask!3524))))

(assert (=> start!45858 e!297111))

(assert (=> start!45858 true))

(declare-fun array_inv!11575 (array!32624) Bool)

(assert (=> start!45858 (array_inv!11575 a!3235)))

(declare-fun b!507796 () Bool)

(declare-fun res!308891 () Bool)

(assert (=> b!507796 (=> (not res!308891) (not e!297109))))

(declare-datatypes ((List!9889 0))(
  ( (Nil!9886) (Cons!9885 (h!10762 (_ BitVec 64)) (t!16108 List!9889)) )
))
(declare-fun arrayNoDuplicates!0 (array!32624 (_ BitVec 32) List!9889) Bool)

(assert (=> b!507796 (= res!308891 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9886))))

(assert (= (and start!45858 res!308893) b!507789))

(assert (= (and b!507789 res!308892) b!507795))

(assert (= (and b!507795 res!308890) b!507790))

(assert (= (and b!507790 res!308897) b!507792))

(assert (= (and b!507792 res!308895) b!507793))

(assert (= (and b!507793 res!308894) b!507794))

(assert (= (and b!507794 res!308896) b!507796))

(assert (= (and b!507796 res!308891) b!507791))

(declare-fun m!488143 () Bool)

(assert (=> b!507792 m!488143))

(declare-fun m!488145 () Bool)

(assert (=> b!507793 m!488145))

(declare-fun m!488147 () Bool)

(assert (=> b!507796 m!488147))

(declare-fun m!488149 () Bool)

(assert (=> b!507794 m!488149))

(declare-fun m!488151 () Bool)

(assert (=> b!507795 m!488151))

(assert (=> b!507795 m!488151))

(declare-fun m!488153 () Bool)

(assert (=> b!507795 m!488153))

(declare-fun m!488155 () Bool)

(assert (=> b!507790 m!488155))

(declare-fun m!488157 () Bool)

(assert (=> start!45858 m!488157))

(declare-fun m!488159 () Bool)

(assert (=> start!45858 m!488159))

(check-sat (not b!507796) (not b!507795) (not start!45858) (not b!507790) (not b!507793) (not b!507794) (not b!507792))
(check-sat)
