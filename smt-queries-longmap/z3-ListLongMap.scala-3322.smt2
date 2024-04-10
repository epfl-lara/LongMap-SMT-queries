; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45878 () Bool)

(assert start!45878)

(declare-fun res!309115 () Bool)

(declare-fun e!297321 () Bool)

(assert (=> start!45878 (=> (not res!309115) (not e!297321))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45878 (= res!309115 (validMask!0 mask!3524))))

(assert (=> start!45878 e!297321))

(assert (=> start!45878 true))

(declare-datatypes ((array!32634 0))(
  ( (array!32635 (arr!15697 (Array (_ BitVec 32) (_ BitVec 64))) (size!16061 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32634)

(declare-fun array_inv!11493 (array!32634) Bool)

(assert (=> start!45878 (array_inv!11493 a!3235)))

(declare-fun b!508156 () Bool)

(declare-fun res!309117 () Bool)

(declare-fun e!297320 () Bool)

(assert (=> b!508156 (=> (not res!309117) (not e!297320))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32634 (_ BitVec 32)) Bool)

(assert (=> b!508156 (= res!309117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508157 () Bool)

(declare-fun res!309121 () Bool)

(assert (=> b!508157 (=> (not res!309121) (not e!297321))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508157 (= res!309121 (validKeyInArray!0 k0!2280))))

(declare-fun b!508158 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!508158 (= e!297320 (and (bvsle #b00000000000000000000000000000000 (size!16061 a!3235)) (bvsgt j!176 (size!16061 a!3235))))))

(declare-fun b!508159 () Bool)

(declare-fun res!309122 () Bool)

(assert (=> b!508159 (=> (not res!309122) (not e!297321))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!508159 (= res!309122 (and (= (size!16061 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16061 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16061 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508160 () Bool)

(declare-fun res!309119 () Bool)

(assert (=> b!508160 (=> (not res!309119) (not e!297320))))

(declare-datatypes ((List!9855 0))(
  ( (Nil!9852) (Cons!9851 (h!10728 (_ BitVec 64)) (t!16083 List!9855)) )
))
(declare-fun arrayNoDuplicates!0 (array!32634 (_ BitVec 32) List!9855) Bool)

(assert (=> b!508160 (= res!309119 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9852))))

(declare-fun b!508161 () Bool)

(declare-fun res!309116 () Bool)

(assert (=> b!508161 (=> (not res!309116) (not e!297321))))

(assert (=> b!508161 (= res!309116 (validKeyInArray!0 (select (arr!15697 a!3235) j!176)))))

(declare-fun b!508162 () Bool)

(declare-fun res!309118 () Bool)

(assert (=> b!508162 (=> (not res!309118) (not e!297321))))

(declare-fun arrayContainsKey!0 (array!32634 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508162 (= res!309118 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508163 () Bool)

(assert (=> b!508163 (= e!297321 e!297320)))

(declare-fun res!309120 () Bool)

(assert (=> b!508163 (=> (not res!309120) (not e!297320))))

(declare-datatypes ((SeekEntryResult!4164 0))(
  ( (MissingZero!4164 (index!18844 (_ BitVec 32))) (Found!4164 (index!18845 (_ BitVec 32))) (Intermediate!4164 (undefined!4976 Bool) (index!18846 (_ BitVec 32)) (x!47829 (_ BitVec 32))) (Undefined!4164) (MissingVacant!4164 (index!18847 (_ BitVec 32))) )
))
(declare-fun lt!232165 () SeekEntryResult!4164)

(assert (=> b!508163 (= res!309120 (or (= lt!232165 (MissingZero!4164 i!1204)) (= lt!232165 (MissingVacant!4164 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32634 (_ BitVec 32)) SeekEntryResult!4164)

(assert (=> b!508163 (= lt!232165 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!45878 res!309115) b!508159))

(assert (= (and b!508159 res!309122) b!508161))

(assert (= (and b!508161 res!309116) b!508157))

(assert (= (and b!508157 res!309121) b!508162))

(assert (= (and b!508162 res!309118) b!508163))

(assert (= (and b!508163 res!309120) b!508156))

(assert (= (and b!508156 res!309117) b!508160))

(assert (= (and b!508160 res!309119) b!508158))

(declare-fun m!488967 () Bool)

(assert (=> b!508160 m!488967))

(declare-fun m!488969 () Bool)

(assert (=> b!508157 m!488969))

(declare-fun m!488971 () Bool)

(assert (=> start!45878 m!488971))

(declare-fun m!488973 () Bool)

(assert (=> start!45878 m!488973))

(declare-fun m!488975 () Bool)

(assert (=> b!508163 m!488975))

(declare-fun m!488977 () Bool)

(assert (=> b!508162 m!488977))

(declare-fun m!488979 () Bool)

(assert (=> b!508156 m!488979))

(declare-fun m!488981 () Bool)

(assert (=> b!508161 m!488981))

(assert (=> b!508161 m!488981))

(declare-fun m!488983 () Bool)

(assert (=> b!508161 m!488983))

(check-sat (not b!508157) (not b!508161) (not b!508163) (not b!508162) (not b!508156) (not start!45878) (not b!508160))
(check-sat)
