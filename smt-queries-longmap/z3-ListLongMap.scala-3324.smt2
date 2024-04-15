; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45876 () Bool)

(assert start!45876)

(declare-fun b!507996 () Bool)

(declare-fun res!309100 () Bool)

(declare-fun e!297191 () Bool)

(assert (=> b!507996 (=> (not res!309100) (not e!297191))))

(declare-datatypes ((array!32642 0))(
  ( (array!32643 (arr!15701 (Array (_ BitVec 32) (_ BitVec 64))) (size!16066 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32642)

(declare-datatypes ((List!9898 0))(
  ( (Nil!9895) (Cons!9894 (h!10771 (_ BitVec 64)) (t!16117 List!9898)) )
))
(declare-fun arrayNoDuplicates!0 (array!32642 (_ BitVec 32) List!9898) Bool)

(assert (=> b!507996 (= res!309100 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9895))))

(declare-fun b!507997 () Bool)

(declare-fun res!309097 () Bool)

(declare-fun e!297190 () Bool)

(assert (=> b!507997 (=> (not res!309097) (not e!297190))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32642 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507997 (= res!309097 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507998 () Bool)

(declare-fun res!309101 () Bool)

(assert (=> b!507998 (=> (not res!309101) (not e!297190))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!507998 (= res!309101 (and (= (size!16066 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16066 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16066 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!309099 () Bool)

(assert (=> start!45876 (=> (not res!309099) (not e!297190))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45876 (= res!309099 (validMask!0 mask!3524))))

(assert (=> start!45876 e!297190))

(assert (=> start!45876 true))

(declare-fun array_inv!11584 (array!32642) Bool)

(assert (=> start!45876 (array_inv!11584 a!3235)))

(declare-fun b!507999 () Bool)

(assert (=> b!507999 (= e!297190 e!297191)))

(declare-fun res!309103 () Bool)

(assert (=> b!507999 (=> (not res!309103) (not e!297191))))

(declare-datatypes ((SeekEntryResult!4165 0))(
  ( (MissingZero!4165 (index!18848 (_ BitVec 32))) (Found!4165 (index!18849 (_ BitVec 32))) (Intermediate!4165 (undefined!4977 Bool) (index!18850 (_ BitVec 32)) (x!47841 (_ BitVec 32))) (Undefined!4165) (MissingVacant!4165 (index!18851 (_ BitVec 32))) )
))
(declare-fun lt!231957 () SeekEntryResult!4165)

(assert (=> b!507999 (= res!309103 (or (= lt!231957 (MissingZero!4165 i!1204)) (= lt!231957 (MissingVacant!4165 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32642 (_ BitVec 32)) SeekEntryResult!4165)

(assert (=> b!507999 (= lt!231957 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!508000 () Bool)

(declare-fun res!309098 () Bool)

(assert (=> b!508000 (=> (not res!309098) (not e!297191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32642 (_ BitVec 32)) Bool)

(assert (=> b!508000 (= res!309098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508001 () Bool)

(declare-fun res!309102 () Bool)

(assert (=> b!508001 (=> (not res!309102) (not e!297190))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508001 (= res!309102 (validKeyInArray!0 (select (arr!15701 a!3235) j!176)))))

(declare-fun b!508002 () Bool)

(declare-fun res!309104 () Bool)

(assert (=> b!508002 (=> (not res!309104) (not e!297190))))

(assert (=> b!508002 (= res!309104 (validKeyInArray!0 k0!2280))))

(declare-fun b!508003 () Bool)

(assert (=> b!508003 (= e!297191 (not true))))

(assert (=> b!508003 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15574 0))(
  ( (Unit!15575) )
))
(declare-fun lt!231958 () Unit!15574)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32642 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15574)

(assert (=> b!508003 (= lt!231958 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45876 res!309099) b!507998))

(assert (= (and b!507998 res!309101) b!508001))

(assert (= (and b!508001 res!309102) b!508002))

(assert (= (and b!508002 res!309104) b!507997))

(assert (= (and b!507997 res!309097) b!507999))

(assert (= (and b!507999 res!309103) b!508000))

(assert (= (and b!508000 res!309098) b!507996))

(assert (= (and b!507996 res!309100) b!508003))

(declare-fun m!488305 () Bool)

(assert (=> b!507999 m!488305))

(declare-fun m!488307 () Bool)

(assert (=> b!508000 m!488307))

(declare-fun m!488309 () Bool)

(assert (=> b!508001 m!488309))

(assert (=> b!508001 m!488309))

(declare-fun m!488311 () Bool)

(assert (=> b!508001 m!488311))

(declare-fun m!488313 () Bool)

(assert (=> b!508003 m!488313))

(declare-fun m!488315 () Bool)

(assert (=> b!508003 m!488315))

(declare-fun m!488317 () Bool)

(assert (=> start!45876 m!488317))

(declare-fun m!488319 () Bool)

(assert (=> start!45876 m!488319))

(declare-fun m!488321 () Bool)

(assert (=> b!508002 m!488321))

(declare-fun m!488323 () Bool)

(assert (=> b!507996 m!488323))

(declare-fun m!488325 () Bool)

(assert (=> b!507997 m!488325))

(check-sat (not b!508001) (not b!508002) (not start!45876) (not b!508000) (not b!507997) (not b!507999) (not b!508003) (not b!507996))
(check-sat)
