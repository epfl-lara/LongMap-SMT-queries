; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28234 () Bool)

(assert start!28234)

(declare-fun b!289165 () Bool)

(declare-fun res!150788 () Bool)

(declare-fun e!183081 () Bool)

(assert (=> b!289165 (=> (not res!150788) (not e!183081))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14548 0))(
  ( (array!14549 (arr!6901 (Array (_ BitVec 32) (_ BitVec 64))) (size!7253 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14548)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!289165 (= res!150788 (and (= (size!7253 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7253 a!3312))))))

(declare-fun b!289166 () Bool)

(declare-fun e!183082 () Bool)

(declare-fun e!183079 () Bool)

(assert (=> b!289166 (= e!183082 e!183079)))

(declare-fun res!150795 () Bool)

(assert (=> b!289166 (=> (not res!150795) (not e!183079))))

(declare-fun lt!142627 () Bool)

(assert (=> b!289166 (= res!150795 lt!142627)))

(declare-fun lt!142630 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2050 0))(
  ( (MissingZero!2050 (index!10370 (_ BitVec 32))) (Found!2050 (index!10371 (_ BitVec 32))) (Intermediate!2050 (undefined!2862 Bool) (index!10372 (_ BitVec 32)) (x!28575 (_ BitVec 32))) (Undefined!2050) (MissingVacant!2050 (index!10373 (_ BitVec 32))) )
))
(declare-fun lt!142628 () SeekEntryResult!2050)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14548 (_ BitVec 32)) SeekEntryResult!2050)

(assert (=> b!289166 (= lt!142628 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142630 k!2524 (array!14549 (store (arr!6901 a!3312) i!1256 k!2524) (size!7253 a!3312)) mask!3809))))

(declare-fun lt!142629 () SeekEntryResult!2050)

(assert (=> b!289166 (= lt!142629 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142630 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289166 (= lt!142630 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!289167 () Bool)

(assert (=> b!289167 (= e!183081 e!183082)))

(declare-fun res!150791 () Bool)

(assert (=> b!289167 (=> (not res!150791) (not e!183082))))

(declare-fun lt!142626 () SeekEntryResult!2050)

(assert (=> b!289167 (= res!150791 (or lt!142627 (= lt!142626 (MissingVacant!2050 i!1256))))))

(assert (=> b!289167 (= lt!142627 (= lt!142626 (MissingZero!2050 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14548 (_ BitVec 32)) SeekEntryResult!2050)

(assert (=> b!289167 (= lt!142626 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!289168 () Bool)

(declare-fun res!150794 () Bool)

(assert (=> b!289168 (=> (not res!150794) (not e!183081))))

(declare-fun arrayContainsKey!0 (array!14548 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289168 (= res!150794 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!150790 () Bool)

(assert (=> start!28234 (=> (not res!150790) (not e!183081))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28234 (= res!150790 (validMask!0 mask!3809))))

(assert (=> start!28234 e!183081))

(assert (=> start!28234 true))

(declare-fun array_inv!4864 (array!14548) Bool)

(assert (=> start!28234 (array_inv!4864 a!3312)))

(declare-fun b!289169 () Bool)

(declare-fun res!150792 () Bool)

(assert (=> b!289169 (=> (not res!150792) (not e!183082))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14548 (_ BitVec 32)) Bool)

(assert (=> b!289169 (= res!150792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289170 () Bool)

(declare-fun e!183083 () Bool)

(assert (=> b!289170 (= e!183079 e!183083)))

(declare-fun res!150793 () Bool)

(assert (=> b!289170 (=> (not res!150793) (not e!183083))))

(declare-fun lt!142625 () Bool)

(assert (=> b!289170 (= res!150793 (and (or lt!142625 (not (undefined!2862 lt!142629))) (or lt!142625 (not (= (select (arr!6901 a!3312) (index!10372 lt!142629)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142625 (not (= (select (arr!6901 a!3312) (index!10372 lt!142629)) k!2524))) (not lt!142625)))))

(assert (=> b!289170 (= lt!142625 (not (is-Intermediate!2050 lt!142629)))))

(declare-fun b!289171 () Bool)

(assert (=> b!289171 (= e!183083 (not true))))

(assert (=> b!289171 (and (= (select (arr!6901 a!3312) (index!10372 lt!142629)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10372 lt!142629) i!1256))))

(declare-fun b!289172 () Bool)

(declare-fun res!150789 () Bool)

(assert (=> b!289172 (=> (not res!150789) (not e!183081))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289172 (= res!150789 (validKeyInArray!0 k!2524))))

(assert (= (and start!28234 res!150790) b!289165))

(assert (= (and b!289165 res!150788) b!289172))

(assert (= (and b!289172 res!150789) b!289168))

(assert (= (and b!289168 res!150794) b!289167))

(assert (= (and b!289167 res!150791) b!289169))

(assert (= (and b!289169 res!150792) b!289166))

(assert (= (and b!289166 res!150795) b!289170))

(assert (= (and b!289170 res!150793) b!289171))

(declare-fun m!303335 () Bool)

(assert (=> b!289172 m!303335))

(declare-fun m!303337 () Bool)

(assert (=> b!289168 m!303337))

(declare-fun m!303339 () Bool)

(assert (=> start!28234 m!303339))

(declare-fun m!303341 () Bool)

(assert (=> start!28234 m!303341))

(declare-fun m!303343 () Bool)

(assert (=> b!289171 m!303343))

(declare-fun m!303345 () Bool)

(assert (=> b!289166 m!303345))

(declare-fun m!303347 () Bool)

(assert (=> b!289166 m!303347))

(declare-fun m!303349 () Bool)

(assert (=> b!289166 m!303349))

(declare-fun m!303351 () Bool)

(assert (=> b!289166 m!303351))

(declare-fun m!303353 () Bool)

(assert (=> b!289167 m!303353))

(assert (=> b!289170 m!303343))

(declare-fun m!303355 () Bool)

(assert (=> b!289169 m!303355))

(push 1)

