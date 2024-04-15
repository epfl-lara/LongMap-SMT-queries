; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45864 () Bool)

(assert start!45864)

(declare-fun b!507861 () Bool)

(declare-fun res!308962 () Bool)

(declare-fun e!297137 () Bool)

(assert (=> b!507861 (=> (not res!308962) (not e!297137))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507861 (= res!308962 (validKeyInArray!0 k0!2280))))

(declare-fun b!507863 () Bool)

(declare-fun res!308963 () Bool)

(declare-fun e!297136 () Bool)

(assert (=> b!507863 (=> (not res!308963) (not e!297136))))

(declare-datatypes ((array!32630 0))(
  ( (array!32631 (arr!15695 (Array (_ BitVec 32) (_ BitVec 64))) (size!16060 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32630)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32630 (_ BitVec 32)) Bool)

(assert (=> b!507863 (= res!308963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507864 () Bool)

(declare-fun res!308966 () Bool)

(assert (=> b!507864 (=> (not res!308966) (not e!297137))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!507864 (= res!308966 (and (= (size!16060 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16060 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16060 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507865 () Bool)

(declare-fun res!308968 () Bool)

(assert (=> b!507865 (=> (not res!308968) (not e!297137))))

(declare-fun arrayContainsKey!0 (array!32630 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507865 (= res!308968 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507866 () Bool)

(declare-fun res!308965 () Bool)

(assert (=> b!507866 (=> (not res!308965) (not e!297136))))

(declare-datatypes ((List!9892 0))(
  ( (Nil!9889) (Cons!9888 (h!10765 (_ BitVec 64)) (t!16111 List!9892)) )
))
(declare-fun arrayNoDuplicates!0 (array!32630 (_ BitVec 32) List!9892) Bool)

(assert (=> b!507866 (= res!308965 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9889))))

(declare-fun b!507862 () Bool)

(assert (=> b!507862 (= e!297136 (and (bvsle #b00000000000000000000000000000000 (size!16060 a!3235)) (bvsgt j!176 (size!16060 a!3235))))))

(declare-fun res!308969 () Bool)

(assert (=> start!45864 (=> (not res!308969) (not e!297137))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45864 (= res!308969 (validMask!0 mask!3524))))

(assert (=> start!45864 e!297137))

(assert (=> start!45864 true))

(declare-fun array_inv!11578 (array!32630) Bool)

(assert (=> start!45864 (array_inv!11578 a!3235)))

(declare-fun b!507867 () Bool)

(assert (=> b!507867 (= e!297137 e!297136)))

(declare-fun res!308964 () Bool)

(assert (=> b!507867 (=> (not res!308964) (not e!297136))))

(declare-datatypes ((SeekEntryResult!4159 0))(
  ( (MissingZero!4159 (index!18824 (_ BitVec 32))) (Found!4159 (index!18825 (_ BitVec 32))) (Intermediate!4159 (undefined!4971 Bool) (index!18826 (_ BitVec 32)) (x!47819 (_ BitVec 32))) (Undefined!4159) (MissingVacant!4159 (index!18827 (_ BitVec 32))) )
))
(declare-fun lt!231928 () SeekEntryResult!4159)

(assert (=> b!507867 (= res!308964 (or (= lt!231928 (MissingZero!4159 i!1204)) (= lt!231928 (MissingVacant!4159 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32630 (_ BitVec 32)) SeekEntryResult!4159)

(assert (=> b!507867 (= lt!231928 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!507868 () Bool)

(declare-fun res!308967 () Bool)

(assert (=> b!507868 (=> (not res!308967) (not e!297137))))

(assert (=> b!507868 (= res!308967 (validKeyInArray!0 (select (arr!15695 a!3235) j!176)))))

(assert (= (and start!45864 res!308969) b!507864))

(assert (= (and b!507864 res!308966) b!507868))

(assert (= (and b!507868 res!308967) b!507861))

(assert (= (and b!507861 res!308962) b!507865))

(assert (= (and b!507865 res!308968) b!507867))

(assert (= (and b!507867 res!308964) b!507863))

(assert (= (and b!507863 res!308963) b!507866))

(assert (= (and b!507866 res!308965) b!507862))

(declare-fun m!488197 () Bool)

(assert (=> b!507867 m!488197))

(declare-fun m!488199 () Bool)

(assert (=> b!507866 m!488199))

(declare-fun m!488201 () Bool)

(assert (=> start!45864 m!488201))

(declare-fun m!488203 () Bool)

(assert (=> start!45864 m!488203))

(declare-fun m!488205 () Bool)

(assert (=> b!507868 m!488205))

(assert (=> b!507868 m!488205))

(declare-fun m!488207 () Bool)

(assert (=> b!507868 m!488207))

(declare-fun m!488209 () Bool)

(assert (=> b!507863 m!488209))

(declare-fun m!488211 () Bool)

(assert (=> b!507861 m!488211))

(declare-fun m!488213 () Bool)

(assert (=> b!507865 m!488213))

(check-sat (not b!507861) (not b!507867) (not b!507863) (not start!45864) (not b!507868) (not b!507865) (not b!507866))
(check-sat)
