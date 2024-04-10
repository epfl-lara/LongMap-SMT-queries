; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45872 () Bool)

(assert start!45872)

(declare-fun b!508084 () Bool)

(declare-fun res!309047 () Bool)

(declare-fun e!297294 () Bool)

(assert (=> b!508084 (=> (not res!309047) (not e!297294))))

(declare-datatypes ((array!32628 0))(
  ( (array!32629 (arr!15694 (Array (_ BitVec 32) (_ BitVec 64))) (size!16058 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32628)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32628 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508084 (= res!309047 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508085 () Bool)

(declare-fun res!309044 () Bool)

(assert (=> b!508085 (=> (not res!309044) (not e!297294))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508085 (= res!309044 (validKeyInArray!0 k0!2280))))

(declare-fun b!508086 () Bool)

(declare-fun e!297293 () Bool)

(assert (=> b!508086 (= e!297294 e!297293)))

(declare-fun res!309049 () Bool)

(assert (=> b!508086 (=> (not res!309049) (not e!297293))))

(declare-datatypes ((SeekEntryResult!4161 0))(
  ( (MissingZero!4161 (index!18832 (_ BitVec 32))) (Found!4161 (index!18833 (_ BitVec 32))) (Intermediate!4161 (undefined!4973 Bool) (index!18834 (_ BitVec 32)) (x!47818 (_ BitVec 32))) (Undefined!4161) (MissingVacant!4161 (index!18835 (_ BitVec 32))) )
))
(declare-fun lt!232156 () SeekEntryResult!4161)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!508086 (= res!309049 (or (= lt!232156 (MissingZero!4161 i!1204)) (= lt!232156 (MissingVacant!4161 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32628 (_ BitVec 32)) SeekEntryResult!4161)

(assert (=> b!508086 (= lt!232156 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!508087 () Bool)

(assert (=> b!508087 (= e!297293 (bvsgt #b00000000000000000000000000000000 (size!16058 a!3235)))))

(declare-fun b!508088 () Bool)

(declare-fun res!309048 () Bool)

(assert (=> b!508088 (=> (not res!309048) (not e!297293))))

(declare-datatypes ((List!9852 0))(
  ( (Nil!9849) (Cons!9848 (h!10725 (_ BitVec 64)) (t!16080 List!9852)) )
))
(declare-fun arrayNoDuplicates!0 (array!32628 (_ BitVec 32) List!9852) Bool)

(assert (=> b!508088 (= res!309048 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9849))))

(declare-fun res!309043 () Bool)

(assert (=> start!45872 (=> (not res!309043) (not e!297294))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45872 (= res!309043 (validMask!0 mask!3524))))

(assert (=> start!45872 e!297294))

(assert (=> start!45872 true))

(declare-fun array_inv!11490 (array!32628) Bool)

(assert (=> start!45872 (array_inv!11490 a!3235)))

(declare-fun b!508089 () Bool)

(declare-fun res!309046 () Bool)

(assert (=> b!508089 (=> (not res!309046) (not e!297294))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!508089 (= res!309046 (and (= (size!16058 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16058 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16058 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508090 () Bool)

(declare-fun res!309045 () Bool)

(assert (=> b!508090 (=> (not res!309045) (not e!297293))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32628 (_ BitVec 32)) Bool)

(assert (=> b!508090 (= res!309045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508091 () Bool)

(declare-fun res!309050 () Bool)

(assert (=> b!508091 (=> (not res!309050) (not e!297294))))

(assert (=> b!508091 (= res!309050 (validKeyInArray!0 (select (arr!15694 a!3235) j!176)))))

(assert (= (and start!45872 res!309043) b!508089))

(assert (= (and b!508089 res!309046) b!508091))

(assert (= (and b!508091 res!309050) b!508085))

(assert (= (and b!508085 res!309044) b!508084))

(assert (= (and b!508084 res!309047) b!508086))

(assert (= (and b!508086 res!309049) b!508090))

(assert (= (and b!508090 res!309045) b!508088))

(assert (= (and b!508088 res!309048) b!508087))

(declare-fun m!488913 () Bool)

(assert (=> b!508084 m!488913))

(declare-fun m!488915 () Bool)

(assert (=> b!508086 m!488915))

(declare-fun m!488917 () Bool)

(assert (=> b!508090 m!488917))

(declare-fun m!488919 () Bool)

(assert (=> b!508085 m!488919))

(declare-fun m!488921 () Bool)

(assert (=> b!508091 m!488921))

(assert (=> b!508091 m!488921))

(declare-fun m!488923 () Bool)

(assert (=> b!508091 m!488923))

(declare-fun m!488925 () Bool)

(assert (=> start!45872 m!488925))

(declare-fun m!488927 () Bool)

(assert (=> start!45872 m!488927))

(declare-fun m!488929 () Bool)

(assert (=> b!508088 m!488929))

(check-sat (not b!508090) (not b!508085) (not start!45872) (not b!508084) (not b!508088) (not b!508086) (not b!508091))
(check-sat)
