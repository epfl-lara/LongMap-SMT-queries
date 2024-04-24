; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45842 () Bool)

(assert start!45842)

(declare-fun b!507780 () Bool)

(declare-fun e!297143 () Bool)

(declare-fun e!297146 () Bool)

(assert (=> b!507780 (= e!297143 (not e!297146))))

(declare-fun res!308794 () Bool)

(assert (=> b!507780 (=> res!308794 e!297146)))

(declare-fun lt!232071 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4102 0))(
  ( (MissingZero!4102 (index!18596 (_ BitVec 32))) (Found!4102 (index!18597 (_ BitVec 32))) (Intermediate!4102 (undefined!4914 Bool) (index!18598 (_ BitVec 32)) (x!47732 (_ BitVec 32))) (Undefined!4102) (MissingVacant!4102 (index!18599 (_ BitVec 32))) )
))
(declare-fun lt!232070 () SeekEntryResult!4102)

(declare-datatypes ((array!32599 0))(
  ( (array!32600 (arr!15679 (Array (_ BitVec 32) (_ BitVec 64))) (size!16043 (_ BitVec 32))) )
))
(declare-fun lt!232067 () array!32599)

(declare-fun lt!232069 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32599 (_ BitVec 32)) SeekEntryResult!4102)

(assert (=> b!507780 (= res!308794 (= lt!232070 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232071 lt!232069 lt!232067 mask!3524)))))

(declare-fun lt!232064 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun a!3235 () array!32599)

(assert (=> b!507780 (= lt!232070 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232064 (select (arr!15679 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507780 (= lt!232071 (toIndex!0 lt!232069 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507780 (= lt!232069 (select (store (arr!15679 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!507780 (= lt!232064 (toIndex!0 (select (arr!15679 a!3235) j!176) mask!3524))))

(assert (=> b!507780 (= lt!232067 (array!32600 (store (arr!15679 a!3235) i!1204 k0!2280) (size!16043 a!3235)))))

(declare-fun e!297144 () Bool)

(assert (=> b!507780 e!297144))

(declare-fun res!308797 () Bool)

(assert (=> b!507780 (=> (not res!308797) (not e!297144))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32599 (_ BitVec 32)) Bool)

(assert (=> b!507780 (= res!308797 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15553 0))(
  ( (Unit!15554) )
))
(declare-fun lt!232066 () Unit!15553)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32599 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15553)

(assert (=> b!507780 (= lt!232066 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!507781 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32599 (_ BitVec 32)) SeekEntryResult!4102)

(assert (=> b!507781 (= e!297144 (= (seekEntryOrOpen!0 (select (arr!15679 a!3235) j!176) a!3235 mask!3524) (Found!4102 j!176)))))

(declare-fun b!507782 () Bool)

(declare-fun e!297145 () Bool)

(assert (=> b!507782 (= e!297145 true)))

(declare-fun lt!232068 () SeekEntryResult!4102)

(assert (=> b!507782 (= lt!232068 (seekEntryOrOpen!0 lt!232069 lt!232067 mask!3524))))

(assert (=> b!507782 false))

(declare-fun b!507783 () Bool)

(declare-fun res!308799 () Bool)

(assert (=> b!507783 (=> (not res!308799) (not e!297143))))

(assert (=> b!507783 (= res!308799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507784 () Bool)

(declare-fun res!308803 () Bool)

(declare-fun e!297142 () Bool)

(assert (=> b!507784 (=> (not res!308803) (not e!297142))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507784 (= res!308803 (validKeyInArray!0 k0!2280))))

(declare-fun res!308793 () Bool)

(assert (=> start!45842 (=> (not res!308793) (not e!297142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45842 (= res!308793 (validMask!0 mask!3524))))

(assert (=> start!45842 e!297142))

(assert (=> start!45842 true))

(declare-fun array_inv!11538 (array!32599) Bool)

(assert (=> start!45842 (array_inv!11538 a!3235)))

(declare-fun b!507785 () Bool)

(declare-fun res!308802 () Bool)

(assert (=> b!507785 (=> (not res!308802) (not e!297143))))

(declare-datatypes ((List!9744 0))(
  ( (Nil!9741) (Cons!9740 (h!10617 (_ BitVec 64)) (t!15964 List!9744)) )
))
(declare-fun arrayNoDuplicates!0 (array!32599 (_ BitVec 32) List!9744) Bool)

(assert (=> b!507785 (= res!308802 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9741))))

(declare-fun b!507786 () Bool)

(declare-fun res!308796 () Bool)

(assert (=> b!507786 (=> (not res!308796) (not e!297142))))

(assert (=> b!507786 (= res!308796 (and (= (size!16043 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16043 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16043 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507787 () Bool)

(assert (=> b!507787 (= e!297146 e!297145)))

(declare-fun res!308801 () Bool)

(assert (=> b!507787 (=> res!308801 e!297145)))

(declare-fun lt!232072 () Bool)

(assert (=> b!507787 (= res!308801 (or (and (not lt!232072) (undefined!4914 lt!232070)) (and (not lt!232072) (not (undefined!4914 lt!232070)))))))

(get-info :version)

(assert (=> b!507787 (= lt!232072 (not ((_ is Intermediate!4102) lt!232070)))))

(declare-fun b!507788 () Bool)

(declare-fun res!308798 () Bool)

(assert (=> b!507788 (=> (not res!308798) (not e!297142))))

(declare-fun arrayContainsKey!0 (array!32599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507788 (= res!308798 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507789 () Bool)

(assert (=> b!507789 (= e!297142 e!297143)))

(declare-fun res!308800 () Bool)

(assert (=> b!507789 (=> (not res!308800) (not e!297143))))

(declare-fun lt!232065 () SeekEntryResult!4102)

(assert (=> b!507789 (= res!308800 (or (= lt!232065 (MissingZero!4102 i!1204)) (= lt!232065 (MissingVacant!4102 i!1204))))))

(assert (=> b!507789 (= lt!232065 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!507790 () Bool)

(declare-fun res!308795 () Bool)

(assert (=> b!507790 (=> (not res!308795) (not e!297142))))

(assert (=> b!507790 (= res!308795 (validKeyInArray!0 (select (arr!15679 a!3235) j!176)))))

(assert (= (and start!45842 res!308793) b!507786))

(assert (= (and b!507786 res!308796) b!507790))

(assert (= (and b!507790 res!308795) b!507784))

(assert (= (and b!507784 res!308803) b!507788))

(assert (= (and b!507788 res!308798) b!507789))

(assert (= (and b!507789 res!308800) b!507783))

(assert (= (and b!507783 res!308799) b!507785))

(assert (= (and b!507785 res!308802) b!507780))

(assert (= (and b!507780 res!308797) b!507781))

(assert (= (and b!507780 (not res!308794)) b!507787))

(assert (= (and b!507787 (not res!308801)) b!507782))

(declare-fun m!488857 () Bool)

(assert (=> b!507789 m!488857))

(declare-fun m!488859 () Bool)

(assert (=> b!507788 m!488859))

(declare-fun m!488861 () Bool)

(assert (=> b!507781 m!488861))

(assert (=> b!507781 m!488861))

(declare-fun m!488863 () Bool)

(assert (=> b!507781 m!488863))

(declare-fun m!488865 () Bool)

(assert (=> b!507785 m!488865))

(assert (=> b!507790 m!488861))

(assert (=> b!507790 m!488861))

(declare-fun m!488867 () Bool)

(assert (=> b!507790 m!488867))

(declare-fun m!488869 () Bool)

(assert (=> b!507784 m!488869))

(declare-fun m!488871 () Bool)

(assert (=> start!45842 m!488871))

(declare-fun m!488873 () Bool)

(assert (=> start!45842 m!488873))

(declare-fun m!488875 () Bool)

(assert (=> b!507780 m!488875))

(declare-fun m!488877 () Bool)

(assert (=> b!507780 m!488877))

(declare-fun m!488879 () Bool)

(assert (=> b!507780 m!488879))

(assert (=> b!507780 m!488861))

(declare-fun m!488881 () Bool)

(assert (=> b!507780 m!488881))

(declare-fun m!488883 () Bool)

(assert (=> b!507780 m!488883))

(declare-fun m!488885 () Bool)

(assert (=> b!507780 m!488885))

(assert (=> b!507780 m!488861))

(declare-fun m!488887 () Bool)

(assert (=> b!507780 m!488887))

(assert (=> b!507780 m!488861))

(declare-fun m!488889 () Bool)

(assert (=> b!507780 m!488889))

(declare-fun m!488891 () Bool)

(assert (=> b!507783 m!488891))

(declare-fun m!488893 () Bool)

(assert (=> b!507782 m!488893))

(check-sat (not b!507784) (not b!507790) (not b!507780) (not b!507781) (not b!507782) (not b!507789) (not b!507785) (not start!45842) (not b!507788) (not b!507783))
(check-sat)
