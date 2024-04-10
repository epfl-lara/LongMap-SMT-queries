; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45794 () Bool)

(assert start!45794)

(declare-fun b!506884 () Bool)

(declare-fun e!296663 () Bool)

(declare-fun e!296660 () Bool)

(assert (=> b!506884 (= e!296663 e!296660)))

(declare-fun res!307846 () Bool)

(assert (=> b!506884 (=> res!307846 e!296660)))

(declare-fun lt!231337 () Bool)

(declare-datatypes ((SeekEntryResult!4122 0))(
  ( (MissingZero!4122 (index!18676 (_ BitVec 32))) (Found!4122 (index!18677 (_ BitVec 32))) (Intermediate!4122 (undefined!4934 Bool) (index!18678 (_ BitVec 32)) (x!47675 (_ BitVec 32))) (Undefined!4122) (MissingVacant!4122 (index!18679 (_ BitVec 32))) )
))
(declare-fun lt!231335 () SeekEntryResult!4122)

(assert (=> b!506884 (= res!307846 (or (and (not lt!231337) (undefined!4934 lt!231335)) (and (not lt!231337) (not (undefined!4934 lt!231335)))))))

(get-info :version)

(assert (=> b!506884 (= lt!231337 (not ((_ is Intermediate!4122) lt!231335)))))

(declare-fun b!506885 () Bool)

(declare-fun res!307845 () Bool)

(declare-fun e!296664 () Bool)

(assert (=> b!506885 (=> (not res!307845) (not e!296664))))

(declare-datatypes ((array!32550 0))(
  ( (array!32551 (arr!15655 (Array (_ BitVec 32) (_ BitVec 64))) (size!16019 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32550)

(declare-datatypes ((List!9813 0))(
  ( (Nil!9810) (Cons!9809 (h!10686 (_ BitVec 64)) (t!16041 List!9813)) )
))
(declare-fun arrayNoDuplicates!0 (array!32550 (_ BitVec 32) List!9813) Bool)

(assert (=> b!506885 (= res!307845 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9810))))

(declare-fun res!307851 () Bool)

(declare-fun e!296661 () Bool)

(assert (=> start!45794 (=> (not res!307851) (not e!296661))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45794 (= res!307851 (validMask!0 mask!3524))))

(assert (=> start!45794 e!296661))

(assert (=> start!45794 true))

(declare-fun array_inv!11451 (array!32550) Bool)

(assert (=> start!45794 (array_inv!11451 a!3235)))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!296662 () Bool)

(declare-fun b!506886 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32550 (_ BitVec 32)) SeekEntryResult!4122)

(assert (=> b!506886 (= e!296662 (= (seekEntryOrOpen!0 (select (arr!15655 a!3235) j!176) a!3235 mask!3524) (Found!4122 j!176)))))

(declare-fun b!506887 () Bool)

(declare-fun res!307853 () Bool)

(assert (=> b!506887 (=> (not res!307853) (not e!296661))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506887 (= res!307853 (validKeyInArray!0 (select (arr!15655 a!3235) j!176)))))

(declare-fun b!506888 () Bool)

(declare-fun res!307848 () Bool)

(assert (=> b!506888 (=> (not res!307848) (not e!296664))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32550 (_ BitVec 32)) Bool)

(assert (=> b!506888 (= res!307848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!506889 () Bool)

(declare-fun res!307852 () Bool)

(assert (=> b!506889 (=> (not res!307852) (not e!296661))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!506889 (= res!307852 (validKeyInArray!0 k0!2280))))

(declare-fun b!506890 () Bool)

(declare-fun res!307849 () Bool)

(assert (=> b!506890 (=> (not res!307849) (not e!296661))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!506890 (= res!307849 (and (= (size!16019 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16019 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16019 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506891 () Bool)

(assert (=> b!506891 (= e!296661 e!296664)))

(declare-fun res!307844 () Bool)

(assert (=> b!506891 (=> (not res!307844) (not e!296664))))

(declare-fun lt!231339 () SeekEntryResult!4122)

(assert (=> b!506891 (= res!307844 (or (= lt!231339 (MissingZero!4122 i!1204)) (= lt!231339 (MissingVacant!4122 i!1204))))))

(assert (=> b!506891 (= lt!231339 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!506892 () Bool)

(assert (=> b!506892 (= e!296664 (not e!296663))))

(declare-fun res!307843 () Bool)

(assert (=> b!506892 (=> res!307843 e!296663)))

(declare-fun lt!231340 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32550 (_ BitVec 32)) SeekEntryResult!4122)

(assert (=> b!506892 (= res!307843 (= lt!231335 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231340 (select (store (arr!15655 a!3235) i!1204 k0!2280) j!176) (array!32551 (store (arr!15655 a!3235) i!1204 k0!2280) (size!16019 a!3235)) mask!3524)))))

(declare-fun lt!231338 () (_ BitVec 32))

(assert (=> b!506892 (= lt!231335 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231338 (select (arr!15655 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506892 (= lt!231340 (toIndex!0 (select (store (arr!15655 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!506892 (= lt!231338 (toIndex!0 (select (arr!15655 a!3235) j!176) mask!3524))))

(assert (=> b!506892 e!296662))

(declare-fun res!307847 () Bool)

(assert (=> b!506892 (=> (not res!307847) (not e!296662))))

(assert (=> b!506892 (= res!307847 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15532 0))(
  ( (Unit!15533) )
))
(declare-fun lt!231336 () Unit!15532)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32550 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15532)

(assert (=> b!506892 (= lt!231336 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506893 () Bool)

(assert (=> b!506893 (= e!296660 true)))

(assert (=> b!506893 false))

(declare-fun b!506894 () Bool)

(declare-fun res!307850 () Bool)

(assert (=> b!506894 (=> (not res!307850) (not e!296661))))

(declare-fun arrayContainsKey!0 (array!32550 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506894 (= res!307850 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45794 res!307851) b!506890))

(assert (= (and b!506890 res!307849) b!506887))

(assert (= (and b!506887 res!307853) b!506889))

(assert (= (and b!506889 res!307852) b!506894))

(assert (= (and b!506894 res!307850) b!506891))

(assert (= (and b!506891 res!307844) b!506888))

(assert (= (and b!506888 res!307848) b!506885))

(assert (= (and b!506885 res!307845) b!506892))

(assert (= (and b!506892 res!307847) b!506886))

(assert (= (and b!506892 (not res!307843)) b!506884))

(assert (= (and b!506884 (not res!307846)) b!506893))

(declare-fun m!487587 () Bool)

(assert (=> b!506886 m!487587))

(assert (=> b!506886 m!487587))

(declare-fun m!487589 () Bool)

(assert (=> b!506886 m!487589))

(declare-fun m!487591 () Bool)

(assert (=> b!506891 m!487591))

(declare-fun m!487593 () Bool)

(assert (=> b!506888 m!487593))

(declare-fun m!487595 () Bool)

(assert (=> b!506885 m!487595))

(declare-fun m!487597 () Bool)

(assert (=> b!506889 m!487597))

(declare-fun m!487599 () Bool)

(assert (=> start!45794 m!487599))

(declare-fun m!487601 () Bool)

(assert (=> start!45794 m!487601))

(declare-fun m!487603 () Bool)

(assert (=> b!506894 m!487603))

(assert (=> b!506887 m!487587))

(assert (=> b!506887 m!487587))

(declare-fun m!487605 () Bool)

(assert (=> b!506887 m!487605))

(declare-fun m!487607 () Bool)

(assert (=> b!506892 m!487607))

(declare-fun m!487609 () Bool)

(assert (=> b!506892 m!487609))

(declare-fun m!487611 () Bool)

(assert (=> b!506892 m!487611))

(declare-fun m!487613 () Bool)

(assert (=> b!506892 m!487613))

(assert (=> b!506892 m!487587))

(declare-fun m!487615 () Bool)

(assert (=> b!506892 m!487615))

(assert (=> b!506892 m!487587))

(declare-fun m!487617 () Bool)

(assert (=> b!506892 m!487617))

(assert (=> b!506892 m!487607))

(declare-fun m!487619 () Bool)

(assert (=> b!506892 m!487619))

(assert (=> b!506892 m!487587))

(declare-fun m!487621 () Bool)

(assert (=> b!506892 m!487621))

(assert (=> b!506892 m!487607))

(check-sat (not b!506888) (not b!506887) (not b!506885) (not start!45794) (not b!506894) (not b!506889) (not b!506886) (not b!506891) (not b!506892))
(check-sat)
