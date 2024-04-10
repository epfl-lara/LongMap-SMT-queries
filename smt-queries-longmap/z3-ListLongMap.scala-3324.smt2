; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45890 () Bool)

(assert start!45890)

(declare-fun res!309255 () Bool)

(declare-fun e!297374 () Bool)

(assert (=> start!45890 (=> (not res!309255) (not e!297374))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45890 (= res!309255 (validMask!0 mask!3524))))

(assert (=> start!45890 e!297374))

(assert (=> start!45890 true))

(declare-datatypes ((array!32646 0))(
  ( (array!32647 (arr!15703 (Array (_ BitVec 32) (_ BitVec 64))) (size!16067 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32646)

(declare-fun array_inv!11499 (array!32646) Bool)

(assert (=> start!45890 (array_inv!11499 a!3235)))

(declare-fun b!508291 () Bool)

(declare-fun res!309257 () Bool)

(assert (=> b!508291 (=> (not res!309257) (not e!297374))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!508291 (= res!309257 (and (= (size!16067 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16067 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16067 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508292 () Bool)

(declare-fun res!309250 () Bool)

(assert (=> b!508292 (=> (not res!309250) (not e!297374))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508292 (= res!309250 (validKeyInArray!0 k0!2280))))

(declare-fun b!508293 () Bool)

(declare-fun res!309251 () Bool)

(declare-fun e!297375 () Bool)

(assert (=> b!508293 (=> (not res!309251) (not e!297375))))

(declare-datatypes ((List!9861 0))(
  ( (Nil!9858) (Cons!9857 (h!10734 (_ BitVec 64)) (t!16089 List!9861)) )
))
(declare-fun arrayNoDuplicates!0 (array!32646 (_ BitVec 32) List!9861) Bool)

(assert (=> b!508293 (= res!309251 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9858))))

(declare-fun b!508294 () Bool)

(assert (=> b!508294 (= e!297375 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32646 (_ BitVec 32)) Bool)

(assert (=> b!508294 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15598 0))(
  ( (Unit!15599) )
))
(declare-fun lt!232198 () Unit!15598)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32646 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15598)

(assert (=> b!508294 (= lt!232198 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!508295 () Bool)

(declare-fun res!309256 () Bool)

(assert (=> b!508295 (=> (not res!309256) (not e!297374))))

(declare-fun arrayContainsKey!0 (array!32646 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508295 (= res!309256 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508296 () Bool)

(declare-fun res!309252 () Bool)

(assert (=> b!508296 (=> (not res!309252) (not e!297375))))

(assert (=> b!508296 (= res!309252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508297 () Bool)

(declare-fun res!309254 () Bool)

(assert (=> b!508297 (=> (not res!309254) (not e!297374))))

(assert (=> b!508297 (= res!309254 (validKeyInArray!0 (select (arr!15703 a!3235) j!176)))))

(declare-fun b!508298 () Bool)

(assert (=> b!508298 (= e!297374 e!297375)))

(declare-fun res!309253 () Bool)

(assert (=> b!508298 (=> (not res!309253) (not e!297375))))

(declare-datatypes ((SeekEntryResult!4170 0))(
  ( (MissingZero!4170 (index!18868 (_ BitVec 32))) (Found!4170 (index!18869 (_ BitVec 32))) (Intermediate!4170 (undefined!4982 Bool) (index!18870 (_ BitVec 32)) (x!47851 (_ BitVec 32))) (Undefined!4170) (MissingVacant!4170 (index!18871 (_ BitVec 32))) )
))
(declare-fun lt!232197 () SeekEntryResult!4170)

(assert (=> b!508298 (= res!309253 (or (= lt!232197 (MissingZero!4170 i!1204)) (= lt!232197 (MissingVacant!4170 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32646 (_ BitVec 32)) SeekEntryResult!4170)

(assert (=> b!508298 (= lt!232197 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!45890 res!309255) b!508291))

(assert (= (and b!508291 res!309257) b!508297))

(assert (= (and b!508297 res!309254) b!508292))

(assert (= (and b!508292 res!309250) b!508295))

(assert (= (and b!508295 res!309256) b!508298))

(assert (= (and b!508298 res!309253) b!508296))

(assert (= (and b!508296 res!309252) b!508293))

(assert (= (and b!508293 res!309251) b!508294))

(declare-fun m!489079 () Bool)

(assert (=> b!508293 m!489079))

(declare-fun m!489081 () Bool)

(assert (=> b!508297 m!489081))

(assert (=> b!508297 m!489081))

(declare-fun m!489083 () Bool)

(assert (=> b!508297 m!489083))

(declare-fun m!489085 () Bool)

(assert (=> start!45890 m!489085))

(declare-fun m!489087 () Bool)

(assert (=> start!45890 m!489087))

(declare-fun m!489089 () Bool)

(assert (=> b!508296 m!489089))

(declare-fun m!489091 () Bool)

(assert (=> b!508292 m!489091))

(declare-fun m!489093 () Bool)

(assert (=> b!508295 m!489093))

(declare-fun m!489095 () Bool)

(assert (=> b!508298 m!489095))

(declare-fun m!489097 () Bool)

(assert (=> b!508294 m!489097))

(declare-fun m!489099 () Bool)

(assert (=> b!508294 m!489099))

(check-sat (not b!508298) (not b!508297) (not b!508293) (not b!508296) (not b!508292) (not b!508295) (not start!45890) (not b!508294))
(check-sat)
