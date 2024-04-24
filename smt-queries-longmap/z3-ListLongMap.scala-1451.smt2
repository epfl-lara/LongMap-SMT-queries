; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27988 () Bool)

(assert start!27988)

(declare-fun b!287279 () Bool)

(declare-fun res!149142 () Bool)

(declare-fun e!181966 () Bool)

(assert (=> b!287279 (=> (not res!149142) (not e!181966))))

(declare-datatypes ((array!14397 0))(
  ( (array!14398 (arr!6829 (Array (_ BitVec 32) (_ BitVec 64))) (size!7181 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14397)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!287279 (= res!149142 (and (= (size!7181 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7181 a!3312))))))

(declare-fun b!287280 () Bool)

(declare-fun e!181965 () Bool)

(assert (=> b!287280 (= e!181965 false)))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!1943 0))(
  ( (MissingZero!1943 (index!9942 (_ BitVec 32))) (Found!1943 (index!9943 (_ BitVec 32))) (Intermediate!1943 (undefined!2755 Bool) (index!9944 (_ BitVec 32)) (x!28272 (_ BitVec 32))) (Undefined!1943) (MissingVacant!1943 (index!9945 (_ BitVec 32))) )
))
(declare-fun lt!141492 () SeekEntryResult!1943)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14397 (_ BitVec 32)) SeekEntryResult!1943)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287280 (= lt!141492 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!287281 () Bool)

(declare-fun res!149143 () Bool)

(assert (=> b!287281 (=> (not res!149143) (not e!181966))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287281 (= res!149143 (validKeyInArray!0 k0!2524))))

(declare-fun res!149144 () Bool)

(assert (=> start!27988 (=> (not res!149144) (not e!181966))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27988 (= res!149144 (validMask!0 mask!3809))))

(assert (=> start!27988 e!181966))

(assert (=> start!27988 true))

(declare-fun array_inv!4779 (array!14397) Bool)

(assert (=> start!27988 (array_inv!4779 a!3312)))

(declare-fun b!287282 () Bool)

(assert (=> b!287282 (= e!181966 e!181965)))

(declare-fun res!149141 () Bool)

(assert (=> b!287282 (=> (not res!149141) (not e!181965))))

(declare-fun lt!141491 () SeekEntryResult!1943)

(assert (=> b!287282 (= res!149141 (or (= lt!141491 (MissingZero!1943 i!1256)) (= lt!141491 (MissingVacant!1943 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14397 (_ BitVec 32)) SeekEntryResult!1943)

(assert (=> b!287282 (= lt!141491 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!287283 () Bool)

(declare-fun res!149145 () Bool)

(assert (=> b!287283 (=> (not res!149145) (not e!181966))))

(declare-fun arrayContainsKey!0 (array!14397 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287283 (= res!149145 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!287284 () Bool)

(declare-fun res!149140 () Bool)

(assert (=> b!287284 (=> (not res!149140) (not e!181965))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14397 (_ BitVec 32)) Bool)

(assert (=> b!287284 (= res!149140 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!27988 res!149144) b!287279))

(assert (= (and b!287279 res!149142) b!287281))

(assert (= (and b!287281 res!149143) b!287283))

(assert (= (and b!287283 res!149145) b!287282))

(assert (= (and b!287282 res!149141) b!287284))

(assert (= (and b!287284 res!149140) b!287280))

(declare-fun m!301889 () Bool)

(assert (=> b!287281 m!301889))

(declare-fun m!301891 () Bool)

(assert (=> b!287282 m!301891))

(declare-fun m!301893 () Bool)

(assert (=> b!287283 m!301893))

(declare-fun m!301895 () Bool)

(assert (=> b!287284 m!301895))

(declare-fun m!301897 () Bool)

(assert (=> start!27988 m!301897))

(declare-fun m!301899 () Bool)

(assert (=> start!27988 m!301899))

(declare-fun m!301901 () Bool)

(assert (=> b!287280 m!301901))

(assert (=> b!287280 m!301901))

(declare-fun m!301903 () Bool)

(assert (=> b!287280 m!301903))

(check-sat (not start!27988) (not b!287283) (not b!287282) (not b!287284) (not b!287280) (not b!287281))
(check-sat)
