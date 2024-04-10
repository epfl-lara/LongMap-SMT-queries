; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28090 () Bool)

(assert start!28090)

(declare-fun b!287835 () Bool)

(declare-fun e!182266 () Bool)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!287835 (= e!182266 (bvslt mask!3809 #b00000000000000000000000000000000))))

(declare-fun lt!141706 () (_ BitVec 32))

(declare-datatypes ((array!14449 0))(
  ( (array!14450 (arr!6853 (Array (_ BitVec 32) (_ BitVec 64))) (size!7205 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14449)

(declare-datatypes ((SeekEntryResult!2002 0))(
  ( (MissingZero!2002 (index!10178 (_ BitVec 32))) (Found!2002 (index!10179 (_ BitVec 32))) (Intermediate!2002 (undefined!2814 Bool) (index!10180 (_ BitVec 32)) (x!28393 (_ BitVec 32))) (Undefined!2002) (MissingVacant!2002 (index!10181 (_ BitVec 32))) )
))
(declare-fun lt!141705 () SeekEntryResult!2002)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14449 (_ BitVec 32)) SeekEntryResult!2002)

(assert (=> b!287835 (= lt!141705 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141706 k!2524 (array!14450 (store (arr!6853 a!3312) i!1256 k!2524) (size!7205 a!3312)) mask!3809))))

(declare-fun lt!141703 () SeekEntryResult!2002)

(assert (=> b!287835 (= lt!141703 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141706 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287835 (= lt!141706 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!287836 () Bool)

(declare-fun e!182265 () Bool)

(assert (=> b!287836 (= e!182265 e!182266)))

(declare-fun res!149600 () Bool)

(assert (=> b!287836 (=> (not res!149600) (not e!182266))))

(declare-fun lt!141704 () SeekEntryResult!2002)

(assert (=> b!287836 (= res!149600 (or (= lt!141704 (MissingZero!2002 i!1256)) (= lt!141704 (MissingVacant!2002 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14449 (_ BitVec 32)) SeekEntryResult!2002)

(assert (=> b!287836 (= lt!141704 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!287837 () Bool)

(declare-fun res!149601 () Bool)

(assert (=> b!287837 (=> (not res!149601) (not e!182266))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14449 (_ BitVec 32)) Bool)

(assert (=> b!287837 (= res!149601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287838 () Bool)

(declare-fun res!149603 () Bool)

(assert (=> b!287838 (=> (not res!149603) (not e!182265))))

(assert (=> b!287838 (= res!149603 (and (= (size!7205 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7205 a!3312))))))

(declare-fun b!287839 () Bool)

(declare-fun res!149604 () Bool)

(assert (=> b!287839 (=> (not res!149604) (not e!182265))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287839 (= res!149604 (validKeyInArray!0 k!2524))))

(declare-fun b!287840 () Bool)

(declare-fun res!149602 () Bool)

(assert (=> b!287840 (=> (not res!149602) (not e!182265))))

(declare-fun arrayContainsKey!0 (array!14449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287840 (= res!149602 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!149599 () Bool)

(assert (=> start!28090 (=> (not res!149599) (not e!182265))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28090 (= res!149599 (validMask!0 mask!3809))))

(assert (=> start!28090 e!182265))

(assert (=> start!28090 true))

(declare-fun array_inv!4816 (array!14449) Bool)

(assert (=> start!28090 (array_inv!4816 a!3312)))

(assert (= (and start!28090 res!149599) b!287838))

(assert (= (and b!287838 res!149603) b!287839))

(assert (= (and b!287839 res!149604) b!287840))

(assert (= (and b!287840 res!149602) b!287836))

(assert (= (and b!287836 res!149600) b!287837))

(assert (= (and b!287837 res!149601) b!287835))

(declare-fun m!302173 () Bool)

(assert (=> start!28090 m!302173))

(declare-fun m!302175 () Bool)

(assert (=> start!28090 m!302175))

(declare-fun m!302177 () Bool)

(assert (=> b!287837 m!302177))

(declare-fun m!302179 () Bool)

(assert (=> b!287836 m!302179))

(declare-fun m!302181 () Bool)

(assert (=> b!287839 m!302181))

(declare-fun m!302183 () Bool)

(assert (=> b!287840 m!302183))

(declare-fun m!302185 () Bool)

(assert (=> b!287835 m!302185))

(declare-fun m!302187 () Bool)

(assert (=> b!287835 m!302187))

(declare-fun m!302189 () Bool)

(assert (=> b!287835 m!302189))

(declare-fun m!302191 () Bool)

(assert (=> b!287835 m!302191))

(push 1)

