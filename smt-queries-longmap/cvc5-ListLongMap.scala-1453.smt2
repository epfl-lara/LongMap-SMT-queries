; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28008 () Bool)

(assert start!28008)

(declare-fun b!287340 () Bool)

(declare-fun res!149230 () Bool)

(declare-fun e!181996 () Bool)

(assert (=> b!287340 (=> (not res!149230) (not e!181996))))

(declare-datatypes ((array!14412 0))(
  ( (array!14413 (arr!6836 (Array (_ BitVec 32) (_ BitVec 64))) (size!7188 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14412)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14412 (_ BitVec 32)) Bool)

(assert (=> b!287340 (= res!149230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287341 () Bool)

(declare-fun res!149229 () Bool)

(declare-fun e!181997 () Bool)

(assert (=> b!287341 (=> (not res!149229) (not e!181997))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287341 (= res!149229 (validKeyInArray!0 k!2524))))

(declare-fun res!149231 () Bool)

(assert (=> start!28008 (=> (not res!149231) (not e!181997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28008 (= res!149231 (validMask!0 mask!3809))))

(assert (=> start!28008 e!181997))

(assert (=> start!28008 true))

(declare-fun array_inv!4799 (array!14412) Bool)

(assert (=> start!28008 (array_inv!4799 a!3312)))

(declare-fun b!287342 () Bool)

(assert (=> b!287342 (= e!181997 e!181996)))

(declare-fun res!149227 () Bool)

(assert (=> b!287342 (=> (not res!149227) (not e!181996))))

(declare-datatypes ((SeekEntryResult!1985 0))(
  ( (MissingZero!1985 (index!10110 (_ BitVec 32))) (Found!1985 (index!10111 (_ BitVec 32))) (Intermediate!1985 (undefined!2797 Bool) (index!10112 (_ BitVec 32)) (x!28330 (_ BitVec 32))) (Undefined!1985) (MissingVacant!1985 (index!10113 (_ BitVec 32))) )
))
(declare-fun lt!141468 () SeekEntryResult!1985)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!287342 (= res!149227 (or (= lt!141468 (MissingZero!1985 i!1256)) (= lt!141468 (MissingVacant!1985 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14412 (_ BitVec 32)) SeekEntryResult!1985)

(assert (=> b!287342 (= lt!141468 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!287343 () Bool)

(declare-fun res!149232 () Bool)

(assert (=> b!287343 (=> (not res!149232) (not e!181997))))

(assert (=> b!287343 (= res!149232 (and (= (size!7188 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7188 a!3312))))))

(declare-fun b!287344 () Bool)

(declare-fun res!149228 () Bool)

(assert (=> b!287344 (=> (not res!149228) (not e!181997))))

(declare-fun arrayContainsKey!0 (array!14412 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287344 (= res!149228 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!287345 () Bool)

(assert (=> b!287345 (= e!181996 false)))

(declare-fun lt!141469 () SeekEntryResult!1985)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14412 (_ BitVec 32)) SeekEntryResult!1985)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287345 (= lt!141469 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (= (and start!28008 res!149231) b!287343))

(assert (= (and b!287343 res!149232) b!287341))

(assert (= (and b!287341 res!149229) b!287344))

(assert (= (and b!287344 res!149228) b!287342))

(assert (= (and b!287342 res!149227) b!287340))

(assert (= (and b!287340 res!149230) b!287345))

(declare-fun m!301779 () Bool)

(assert (=> start!28008 m!301779))

(declare-fun m!301781 () Bool)

(assert (=> start!28008 m!301781))

(declare-fun m!301783 () Bool)

(assert (=> b!287344 m!301783))

(declare-fun m!301785 () Bool)

(assert (=> b!287345 m!301785))

(assert (=> b!287345 m!301785))

(declare-fun m!301787 () Bool)

(assert (=> b!287345 m!301787))

(declare-fun m!301789 () Bool)

(assert (=> b!287341 m!301789))

(declare-fun m!301791 () Bool)

(assert (=> b!287340 m!301791))

(declare-fun m!301793 () Bool)

(assert (=> b!287342 m!301793))

(push 1)

(assert (not b!287344))

(assert (not b!287345))

(assert (not b!287342))

(assert (not b!287341))

(assert (not b!287340))

(assert (not start!28008))

(check-sat)

(pop 1)

