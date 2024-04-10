; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29964 () Bool)

(assert start!29964)

(declare-fun b!300969 () Bool)

(declare-fun res!158722 () Bool)

(declare-fun e!190011 () Bool)

(assert (=> b!300969 (=> (not res!158722) (not e!190011))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300969 (= res!158722 (validKeyInArray!0 k0!2524))))

(declare-fun b!300970 () Bool)

(declare-fun res!158723 () Bool)

(assert (=> b!300970 (=> (not res!158723) (not e!190011))))

(declare-datatypes ((array!15197 0))(
  ( (array!15198 (arr!7191 (Array (_ BitVec 32) (_ BitVec 64))) (size!7543 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15197)

(declare-fun arrayContainsKey!0 (array!15197 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300970 (= res!158723 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!300971 () Bool)

(declare-fun e!190012 () Bool)

(assert (=> b!300971 (= e!190011 e!190012)))

(declare-fun res!158720 () Bool)

(assert (=> b!300971 (=> (not res!158720) (not e!190012))))

(declare-datatypes ((SeekEntryResult!2340 0))(
  ( (MissingZero!2340 (index!11536 (_ BitVec 32))) (Found!2340 (index!11537 (_ BitVec 32))) (Intermediate!2340 (undefined!3152 Bool) (index!11538 (_ BitVec 32)) (x!29796 (_ BitVec 32))) (Undefined!2340) (MissingVacant!2340 (index!11539 (_ BitVec 32))) )
))
(declare-fun lt!149750 () SeekEntryResult!2340)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!300971 (= res!158720 (or (= lt!149750 (MissingZero!2340 i!1256)) (= lt!149750 (MissingVacant!2340 i!1256))))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15197 (_ BitVec 32)) SeekEntryResult!2340)

(assert (=> b!300971 (= lt!149750 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!300972 () Bool)

(declare-fun res!158721 () Bool)

(assert (=> b!300972 (=> (not res!158721) (not e!190011))))

(assert (=> b!300972 (= res!158721 (and (= (size!7543 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7543 a!3312))))))

(declare-fun res!158724 () Bool)

(assert (=> start!29964 (=> (not res!158724) (not e!190011))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29964 (= res!158724 (validMask!0 mask!3809))))

(assert (=> start!29964 e!190011))

(assert (=> start!29964 true))

(declare-fun array_inv!5154 (array!15197) Bool)

(assert (=> start!29964 (array_inv!5154 a!3312)))

(declare-fun b!300973 () Bool)

(declare-fun res!158719 () Bool)

(assert (=> b!300973 (=> (not res!158719) (not e!190012))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15197 (_ BitVec 32)) Bool)

(assert (=> b!300973 (= res!158719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!300974 () Bool)

(assert (=> b!300974 (= e!190012 false)))

(declare-fun lt!149751 () (_ BitVec 32))

(declare-fun lt!149748 () SeekEntryResult!2340)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15197 (_ BitVec 32)) SeekEntryResult!2340)

(assert (=> b!300974 (= lt!149748 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149751 k0!2524 (array!15198 (store (arr!7191 a!3312) i!1256 k0!2524) (size!7543 a!3312)) mask!3809))))

(declare-fun lt!149749 () SeekEntryResult!2340)

(assert (=> b!300974 (= lt!149749 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149751 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300974 (= lt!149751 (toIndex!0 k0!2524 mask!3809))))

(assert (= (and start!29964 res!158724) b!300972))

(assert (= (and b!300972 res!158721) b!300969))

(assert (= (and b!300969 res!158722) b!300970))

(assert (= (and b!300970 res!158723) b!300971))

(assert (= (and b!300971 res!158720) b!300973))

(assert (= (and b!300973 res!158719) b!300974))

(declare-fun m!312869 () Bool)

(assert (=> b!300971 m!312869))

(declare-fun m!312871 () Bool)

(assert (=> b!300969 m!312871))

(declare-fun m!312873 () Bool)

(assert (=> b!300974 m!312873))

(declare-fun m!312875 () Bool)

(assert (=> b!300974 m!312875))

(declare-fun m!312877 () Bool)

(assert (=> b!300974 m!312877))

(declare-fun m!312879 () Bool)

(assert (=> b!300974 m!312879))

(declare-fun m!312881 () Bool)

(assert (=> b!300973 m!312881))

(declare-fun m!312883 () Bool)

(assert (=> start!29964 m!312883))

(declare-fun m!312885 () Bool)

(assert (=> start!29964 m!312885))

(declare-fun m!312887 () Bool)

(assert (=> b!300970 m!312887))

(check-sat (not b!300970) (not start!29964) (not b!300974) (not b!300973) (not b!300971) (not b!300969))
(check-sat)
