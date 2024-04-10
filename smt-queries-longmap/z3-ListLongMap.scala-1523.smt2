; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28670 () Bool)

(assert start!28670)

(declare-fun b!293055 () Bool)

(declare-fun res!154114 () Bool)

(declare-fun e!185333 () Bool)

(assert (=> b!293055 (=> (not res!154114) (not e!185333))))

(declare-datatypes ((array!14849 0))(
  ( (array!14850 (arr!7047 (Array (_ BitVec 32) (_ BitVec 64))) (size!7399 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14849)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14849 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!293055 (= res!154114 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!293056 () Bool)

(declare-fun res!154116 () Bool)

(assert (=> b!293056 (=> (not res!154116) (not e!185333))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!293056 (= res!154116 (validKeyInArray!0 k0!2524))))

(declare-fun res!154113 () Bool)

(assert (=> start!28670 (=> (not res!154113) (not e!185333))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28670 (= res!154113 (validMask!0 mask!3809))))

(assert (=> start!28670 e!185333))

(assert (=> start!28670 true))

(declare-fun array_inv!5010 (array!14849) Bool)

(assert (=> start!28670 (array_inv!5010 a!3312)))

(declare-fun b!293057 () Bool)

(declare-fun res!154111 () Bool)

(assert (=> b!293057 (=> (not res!154111) (not e!185333))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!293057 (= res!154111 (and (= (size!7399 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7399 a!3312))))))

(declare-fun b!293058 () Bool)

(declare-fun res!154112 () Bool)

(declare-fun e!185331 () Bool)

(assert (=> b!293058 (=> (not res!154112) (not e!185331))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14849 (_ BitVec 32)) Bool)

(assert (=> b!293058 (= res!154112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!293059 () Bool)

(assert (=> b!293059 (= e!185333 e!185331)))

(declare-fun res!154115 () Bool)

(assert (=> b!293059 (=> (not res!154115) (not e!185331))))

(declare-datatypes ((SeekEntryResult!2196 0))(
  ( (MissingZero!2196 (index!10954 (_ BitVec 32))) (Found!2196 (index!10955 (_ BitVec 32))) (Intermediate!2196 (undefined!3008 Bool) (index!10956 (_ BitVec 32)) (x!29131 (_ BitVec 32))) (Undefined!2196) (MissingVacant!2196 (index!10957 (_ BitVec 32))) )
))
(declare-fun lt!145254 () SeekEntryResult!2196)

(assert (=> b!293059 (= res!154115 (or (= lt!145254 (MissingZero!2196 i!1256)) (= lt!145254 (MissingVacant!2196 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14849 (_ BitVec 32)) SeekEntryResult!2196)

(assert (=> b!293059 (= lt!145254 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!293060 () Bool)

(assert (=> b!293060 (= e!185331 false)))

(declare-fun lt!145253 () (_ BitVec 32))

(declare-fun lt!145255 () SeekEntryResult!2196)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14849 (_ BitVec 32)) SeekEntryResult!2196)

(assert (=> b!293060 (= lt!145255 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145253 k0!2524 (array!14850 (store (arr!7047 a!3312) i!1256 k0!2524) (size!7399 a!3312)) mask!3809))))

(declare-fun lt!145252 () SeekEntryResult!2196)

(assert (=> b!293060 (= lt!145252 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145253 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293060 (= lt!145253 (toIndex!0 k0!2524 mask!3809))))

(assert (= (and start!28670 res!154113) b!293057))

(assert (= (and b!293057 res!154111) b!293056))

(assert (= (and b!293056 res!154116) b!293055))

(assert (= (and b!293055 res!154114) b!293059))

(assert (= (and b!293059 res!154115) b!293058))

(assert (= (and b!293058 res!154112) b!293060))

(declare-fun m!306857 () Bool)

(assert (=> b!293060 m!306857))

(declare-fun m!306859 () Bool)

(assert (=> b!293060 m!306859))

(declare-fun m!306861 () Bool)

(assert (=> b!293060 m!306861))

(declare-fun m!306863 () Bool)

(assert (=> b!293060 m!306863))

(declare-fun m!306865 () Bool)

(assert (=> b!293056 m!306865))

(declare-fun m!306867 () Bool)

(assert (=> b!293059 m!306867))

(declare-fun m!306869 () Bool)

(assert (=> b!293058 m!306869))

(declare-fun m!306871 () Bool)

(assert (=> start!28670 m!306871))

(declare-fun m!306873 () Bool)

(assert (=> start!28670 m!306873))

(declare-fun m!306875 () Bool)

(assert (=> b!293055 m!306875))

(check-sat (not b!293058) (not b!293055) (not b!293056) (not b!293059) (not start!28670) (not b!293060))
(check-sat)
