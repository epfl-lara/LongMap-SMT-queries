; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45878 () Bool)

(assert start!45878)

(declare-fun b!508206 () Bool)

(declare-fun res!309220 () Bool)

(declare-fun e!297327 () Bool)

(assert (=> b!508206 (=> (not res!309220) (not e!297327))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508206 (= res!309220 (validKeyInArray!0 k0!2280))))

(declare-fun b!508207 () Bool)

(declare-fun res!309226 () Bool)

(declare-fun e!297325 () Bool)

(assert (=> b!508207 (=> (not res!309226) (not e!297325))))

(declare-datatypes ((array!32635 0))(
  ( (array!32636 (arr!15697 (Array (_ BitVec 32) (_ BitVec 64))) (size!16061 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32635)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32635 (_ BitVec 32)) Bool)

(assert (=> b!508207 (= res!309226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!309224 () Bool)

(assert (=> start!45878 (=> (not res!309224) (not e!297327))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45878 (= res!309224 (validMask!0 mask!3524))))

(assert (=> start!45878 e!297327))

(assert (=> start!45878 true))

(declare-fun array_inv!11556 (array!32635) Bool)

(assert (=> start!45878 (array_inv!11556 a!3235)))

(declare-fun b!508208 () Bool)

(declare-fun res!309223 () Bool)

(assert (=> b!508208 (=> (not res!309223) (not e!297325))))

(declare-datatypes ((List!9762 0))(
  ( (Nil!9759) (Cons!9758 (h!10635 (_ BitVec 64)) (t!15982 List!9762)) )
))
(declare-fun arrayNoDuplicates!0 (array!32635 (_ BitVec 32) List!9762) Bool)

(assert (=> b!508208 (= res!309223 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9759))))

(declare-fun b!508209 () Bool)

(declare-fun res!309221 () Bool)

(assert (=> b!508209 (=> (not res!309221) (not e!297327))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!508209 (= res!309221 (and (= (size!16061 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16061 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16061 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508210 () Bool)

(assert (=> b!508210 (= e!297327 e!297325)))

(declare-fun res!309222 () Bool)

(assert (=> b!508210 (=> (not res!309222) (not e!297325))))

(declare-datatypes ((SeekEntryResult!4120 0))(
  ( (MissingZero!4120 (index!18668 (_ BitVec 32))) (Found!4120 (index!18669 (_ BitVec 32))) (Intermediate!4120 (undefined!4932 Bool) (index!18670 (_ BitVec 32)) (x!47798 (_ BitVec 32))) (Undefined!4120) (MissingVacant!4120 (index!18671 (_ BitVec 32))) )
))
(declare-fun lt!232204 () SeekEntryResult!4120)

(assert (=> b!508210 (= res!309222 (or (= lt!232204 (MissingZero!4120 i!1204)) (= lt!232204 (MissingVacant!4120 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32635 (_ BitVec 32)) SeekEntryResult!4120)

(assert (=> b!508210 (= lt!232204 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!508211 () Bool)

(declare-fun res!309219 () Bool)

(assert (=> b!508211 (=> (not res!309219) (not e!297327))))

(declare-fun arrayContainsKey!0 (array!32635 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508211 (= res!309219 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508212 () Bool)

(declare-fun res!309225 () Bool)

(assert (=> b!508212 (=> (not res!309225) (not e!297327))))

(assert (=> b!508212 (= res!309225 (validKeyInArray!0 (select (arr!15697 a!3235) j!176)))))

(declare-fun b!508213 () Bool)

(assert (=> b!508213 (= e!297325 (not true))))

(assert (=> b!508213 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15559 0))(
  ( (Unit!15560) )
))
(declare-fun lt!232203 () Unit!15559)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32635 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15559)

(assert (=> b!508213 (= lt!232203 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45878 res!309224) b!508209))

(assert (= (and b!508209 res!309221) b!508212))

(assert (= (and b!508212 res!309225) b!508206))

(assert (= (and b!508206 res!309220) b!508211))

(assert (= (and b!508211 res!309219) b!508210))

(assert (= (and b!508210 res!309222) b!508207))

(assert (= (and b!508207 res!309226) b!508208))

(assert (= (and b!508208 res!309223) b!508213))

(declare-fun m!489241 () Bool)

(assert (=> start!45878 m!489241))

(declare-fun m!489243 () Bool)

(assert (=> start!45878 m!489243))

(declare-fun m!489245 () Bool)

(assert (=> b!508206 m!489245))

(declare-fun m!489247 () Bool)

(assert (=> b!508207 m!489247))

(declare-fun m!489249 () Bool)

(assert (=> b!508212 m!489249))

(assert (=> b!508212 m!489249))

(declare-fun m!489251 () Bool)

(assert (=> b!508212 m!489251))

(declare-fun m!489253 () Bool)

(assert (=> b!508211 m!489253))

(declare-fun m!489255 () Bool)

(assert (=> b!508213 m!489255))

(declare-fun m!489257 () Bool)

(assert (=> b!508213 m!489257))

(declare-fun m!489259 () Bool)

(assert (=> b!508208 m!489259))

(declare-fun m!489261 () Bool)

(assert (=> b!508210 m!489261))

(check-sat (not b!508213) (not start!45878) (not b!508212) (not b!508208) (not b!508206) (not b!508207) (not b!508211) (not b!508210))
(check-sat)
