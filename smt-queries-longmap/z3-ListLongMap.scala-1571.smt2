; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29944 () Bool)

(assert start!29944)

(declare-fun b!300898 () Bool)

(declare-fun e!189969 () Bool)

(assert (=> b!300898 (= e!189969 false)))

(declare-datatypes ((array!15192 0))(
  ( (array!15193 (arr!7189 (Array (_ BitVec 32) (_ BitVec 64))) (size!7541 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15192)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun lt!149754 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2303 0))(
  ( (MissingZero!2303 (index!11388 (_ BitVec 32))) (Found!2303 (index!11389 (_ BitVec 32))) (Intermediate!2303 (undefined!3115 Bool) (index!11390 (_ BitVec 32)) (x!29756 (_ BitVec 32))) (Undefined!2303) (MissingVacant!2303 (index!11391 (_ BitVec 32))) )
))
(declare-fun lt!149756 () SeekEntryResult!2303)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15192 (_ BitVec 32)) SeekEntryResult!2303)

(assert (=> b!300898 (= lt!149756 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149754 k0!2524 (array!15193 (store (arr!7189 a!3312) i!1256 k0!2524) (size!7541 a!3312)) mask!3809))))

(declare-fun lt!149755 () SeekEntryResult!2303)

(assert (=> b!300898 (= lt!149755 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149754 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300898 (= lt!149754 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!300899 () Bool)

(declare-fun e!189967 () Bool)

(assert (=> b!300899 (= e!189967 e!189969)))

(declare-fun res!158703 () Bool)

(assert (=> b!300899 (=> (not res!158703) (not e!189969))))

(declare-fun lt!149757 () SeekEntryResult!2303)

(assert (=> b!300899 (= res!158703 (or (= lt!149757 (MissingZero!2303 i!1256)) (= lt!149757 (MissingVacant!2303 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15192 (_ BitVec 32)) SeekEntryResult!2303)

(assert (=> b!300899 (= lt!149757 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!300900 () Bool)

(declare-fun res!158698 () Bool)

(assert (=> b!300900 (=> (not res!158698) (not e!189967))))

(declare-fun arrayContainsKey!0 (array!15192 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300900 (= res!158698 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!300901 () Bool)

(declare-fun res!158699 () Bool)

(assert (=> b!300901 (=> (not res!158699) (not e!189967))))

(assert (=> b!300901 (= res!158699 (and (= (size!7541 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7541 a!3312))))))

(declare-fun res!158702 () Bool)

(assert (=> start!29944 (=> (not res!158702) (not e!189967))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29944 (= res!158702 (validMask!0 mask!3809))))

(assert (=> start!29944 e!189967))

(assert (=> start!29944 true))

(declare-fun array_inv!5139 (array!15192) Bool)

(assert (=> start!29944 (array_inv!5139 a!3312)))

(declare-fun b!300902 () Bool)

(declare-fun res!158701 () Bool)

(assert (=> b!300902 (=> (not res!158701) (not e!189967))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300902 (= res!158701 (validKeyInArray!0 k0!2524))))

(declare-fun b!300903 () Bool)

(declare-fun res!158700 () Bool)

(assert (=> b!300903 (=> (not res!158700) (not e!189969))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15192 (_ BitVec 32)) Bool)

(assert (=> b!300903 (= res!158700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!29944 res!158702) b!300901))

(assert (= (and b!300901 res!158699) b!300902))

(assert (= (and b!300902 res!158701) b!300900))

(assert (= (and b!300900 res!158698) b!300899))

(assert (= (and b!300899 res!158703) b!300903))

(assert (= (and b!300903 res!158700) b!300898))

(declare-fun m!312951 () Bool)

(assert (=> b!300902 m!312951))

(declare-fun m!312953 () Bool)

(assert (=> start!29944 m!312953))

(declare-fun m!312955 () Bool)

(assert (=> start!29944 m!312955))

(declare-fun m!312957 () Bool)

(assert (=> b!300900 m!312957))

(declare-fun m!312959 () Bool)

(assert (=> b!300898 m!312959))

(declare-fun m!312961 () Bool)

(assert (=> b!300898 m!312961))

(declare-fun m!312963 () Bool)

(assert (=> b!300898 m!312963))

(declare-fun m!312965 () Bool)

(assert (=> b!300898 m!312965))

(declare-fun m!312967 () Bool)

(assert (=> b!300899 m!312967))

(declare-fun m!312969 () Bool)

(assert (=> b!300903 m!312969))

(check-sat (not b!300900) (not b!300898) (not b!300902) (not b!300899) (not start!29944) (not b!300903))
(check-sat)
