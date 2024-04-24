; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27994 () Bool)

(assert start!27994)

(declare-fun b!287333 () Bool)

(declare-fun e!181994 () Bool)

(declare-fun e!181992 () Bool)

(assert (=> b!287333 (= e!181994 e!181992)))

(declare-fun res!149196 () Bool)

(assert (=> b!287333 (=> (not res!149196) (not e!181992))))

(declare-datatypes ((SeekEntryResult!1946 0))(
  ( (MissingZero!1946 (index!9954 (_ BitVec 32))) (Found!1946 (index!9955 (_ BitVec 32))) (Intermediate!1946 (undefined!2758 Bool) (index!9956 (_ BitVec 32)) (x!28283 (_ BitVec 32))) (Undefined!1946) (MissingVacant!1946 (index!9957 (_ BitVec 32))) )
))
(declare-fun lt!141509 () SeekEntryResult!1946)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!287333 (= res!149196 (or (= lt!141509 (MissingZero!1946 i!1256)) (= lt!141509 (MissingVacant!1946 i!1256))))))

(declare-datatypes ((array!14403 0))(
  ( (array!14404 (arr!6832 (Array (_ BitVec 32) (_ BitVec 64))) (size!7184 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14403)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14403 (_ BitVec 32)) SeekEntryResult!1946)

(assert (=> b!287333 (= lt!141509 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!287334 () Bool)

(declare-fun res!149198 () Bool)

(assert (=> b!287334 (=> (not res!149198) (not e!181994))))

(assert (=> b!287334 (= res!149198 (and (= (size!7184 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7184 a!3312))))))

(declare-fun b!287335 () Bool)

(declare-fun res!149195 () Bool)

(assert (=> b!287335 (=> (not res!149195) (not e!181994))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287335 (= res!149195 (validKeyInArray!0 k0!2524))))

(declare-fun b!287336 () Bool)

(declare-fun res!149194 () Bool)

(assert (=> b!287336 (=> (not res!149194) (not e!181992))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14403 (_ BitVec 32)) Bool)

(assert (=> b!287336 (= res!149194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287337 () Bool)

(assert (=> b!287337 (= e!181992 (bvslt mask!3809 #b00000000000000000000000000000000))))

(declare-fun lt!141510 () SeekEntryResult!1946)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14403 (_ BitVec 32)) SeekEntryResult!1946)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287337 (= lt!141510 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun res!149199 () Bool)

(assert (=> start!27994 (=> (not res!149199) (not e!181994))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27994 (= res!149199 (validMask!0 mask!3809))))

(assert (=> start!27994 e!181994))

(assert (=> start!27994 true))

(declare-fun array_inv!4782 (array!14403) Bool)

(assert (=> start!27994 (array_inv!4782 a!3312)))

(declare-fun b!287338 () Bool)

(declare-fun res!149197 () Bool)

(assert (=> b!287338 (=> (not res!149197) (not e!181994))))

(declare-fun arrayContainsKey!0 (array!14403 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287338 (= res!149197 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!27994 res!149199) b!287334))

(assert (= (and b!287334 res!149198) b!287335))

(assert (= (and b!287335 res!149195) b!287338))

(assert (= (and b!287338 res!149197) b!287333))

(assert (= (and b!287333 res!149196) b!287336))

(assert (= (and b!287336 res!149194) b!287337))

(declare-fun m!301937 () Bool)

(assert (=> b!287338 m!301937))

(declare-fun m!301939 () Bool)

(assert (=> start!27994 m!301939))

(declare-fun m!301941 () Bool)

(assert (=> start!27994 m!301941))

(declare-fun m!301943 () Bool)

(assert (=> b!287335 m!301943))

(declare-fun m!301945 () Bool)

(assert (=> b!287333 m!301945))

(declare-fun m!301947 () Bool)

(assert (=> b!287336 m!301947))

(declare-fun m!301949 () Bool)

(assert (=> b!287337 m!301949))

(assert (=> b!287337 m!301949))

(declare-fun m!301951 () Bool)

(assert (=> b!287337 m!301951))

(check-sat (not b!287336) (not start!27994) (not b!287333) (not b!287335) (not b!287338) (not b!287337))
(check-sat)
