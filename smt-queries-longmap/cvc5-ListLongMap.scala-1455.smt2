; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28068 () Bool)

(assert start!28068)

(declare-fun b!287637 () Bool)

(declare-fun res!149406 () Bool)

(declare-fun e!182168 () Bool)

(assert (=> b!287637 (=> (not res!149406) (not e!182168))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14427 0))(
  ( (array!14428 (arr!6842 (Array (_ BitVec 32) (_ BitVec 64))) (size!7194 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14427)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!287637 (= res!149406 (and (= (size!7194 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7194 a!3312))))))

(declare-fun b!287638 () Bool)

(declare-fun e!182166 () Bool)

(assert (=> b!287638 (= e!182166 false)))

(declare-datatypes ((SeekEntryResult!1991 0))(
  ( (MissingZero!1991 (index!10134 (_ BitVec 32))) (Found!1991 (index!10135 (_ BitVec 32))) (Intermediate!1991 (undefined!2803 Bool) (index!10136 (_ BitVec 32)) (x!28358 (_ BitVec 32))) (Undefined!1991) (MissingVacant!1991 (index!10137 (_ BitVec 32))) )
))
(declare-fun lt!141604 () SeekEntryResult!1991)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14427 (_ BitVec 32)) SeekEntryResult!1991)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287638 (= lt!141604 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!287639 () Bool)

(declare-fun res!149402 () Bool)

(assert (=> b!287639 (=> (not res!149402) (not e!182168))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287639 (= res!149402 (validKeyInArray!0 k!2524))))

(declare-fun b!287641 () Bool)

(declare-fun res!149404 () Bool)

(assert (=> b!287641 (=> (not res!149404) (not e!182166))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14427 (_ BitVec 32)) Bool)

(assert (=> b!287641 (= res!149404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287642 () Bool)

(declare-fun res!149405 () Bool)

(assert (=> b!287642 (=> (not res!149405) (not e!182168))))

(declare-fun arrayContainsKey!0 (array!14427 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287642 (= res!149405 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!149401 () Bool)

(assert (=> start!28068 (=> (not res!149401) (not e!182168))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28068 (= res!149401 (validMask!0 mask!3809))))

(assert (=> start!28068 e!182168))

(assert (=> start!28068 true))

(declare-fun array_inv!4805 (array!14427) Bool)

(assert (=> start!28068 (array_inv!4805 a!3312)))

(declare-fun b!287640 () Bool)

(assert (=> b!287640 (= e!182168 e!182166)))

(declare-fun res!149403 () Bool)

(assert (=> b!287640 (=> (not res!149403) (not e!182166))))

(declare-fun lt!141603 () SeekEntryResult!1991)

(assert (=> b!287640 (= res!149403 (or (= lt!141603 (MissingZero!1991 i!1256)) (= lt!141603 (MissingVacant!1991 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14427 (_ BitVec 32)) SeekEntryResult!1991)

(assert (=> b!287640 (= lt!141603 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!28068 res!149401) b!287637))

(assert (= (and b!287637 res!149406) b!287639))

(assert (= (and b!287639 res!149402) b!287642))

(assert (= (and b!287642 res!149405) b!287640))

(assert (= (and b!287640 res!149403) b!287641))

(assert (= (and b!287641 res!149404) b!287638))

(declare-fun m!301977 () Bool)

(assert (=> b!287638 m!301977))

(assert (=> b!287638 m!301977))

(declare-fun m!301979 () Bool)

(assert (=> b!287638 m!301979))

(declare-fun m!301981 () Bool)

(assert (=> b!287642 m!301981))

(declare-fun m!301983 () Bool)

(assert (=> b!287640 m!301983))

(declare-fun m!301985 () Bool)

(assert (=> b!287639 m!301985))

(declare-fun m!301987 () Bool)

(assert (=> start!28068 m!301987))

(declare-fun m!301989 () Bool)

(assert (=> start!28068 m!301989))

(declare-fun m!301991 () Bool)

(assert (=> b!287641 m!301991))

(push 1)

(assert (not b!287642))

(assert (not b!287639))

(assert (not start!28068))

(assert (not b!287641))

