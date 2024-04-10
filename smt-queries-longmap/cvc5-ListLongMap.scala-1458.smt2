; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28086 () Bool)

(assert start!28086)

(declare-fun b!287799 () Bool)

(declare-fun res!149564 () Bool)

(declare-fun e!182247 () Bool)

(assert (=> b!287799 (=> (not res!149564) (not e!182247))))

(declare-datatypes ((array!14445 0))(
  ( (array!14446 (arr!6851 (Array (_ BitVec 32) (_ BitVec 64))) (size!7203 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14445)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14445 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287799 (= res!149564 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!287800 () Bool)

(declare-fun e!182248 () Bool)

(assert (=> b!287800 (= e!182247 e!182248)))

(declare-fun res!149566 () Bool)

(assert (=> b!287800 (=> (not res!149566) (not e!182248))))

(declare-datatypes ((SeekEntryResult!2000 0))(
  ( (MissingZero!2000 (index!10170 (_ BitVec 32))) (Found!2000 (index!10171 (_ BitVec 32))) (Intermediate!2000 (undefined!2812 Bool) (index!10172 (_ BitVec 32)) (x!28391 (_ BitVec 32))) (Undefined!2000) (MissingVacant!2000 (index!10173 (_ BitVec 32))) )
))
(declare-fun lt!141681 () SeekEntryResult!2000)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!287800 (= res!149566 (or (= lt!141681 (MissingZero!2000 i!1256)) (= lt!141681 (MissingVacant!2000 i!1256))))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14445 (_ BitVec 32)) SeekEntryResult!2000)

(assert (=> b!287800 (= lt!141681 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!287801 () Bool)

(assert (=> b!287801 (= e!182248 (bvslt mask!3809 #b00000000000000000000000000000000))))

(declare-fun lt!141679 () SeekEntryResult!2000)

(declare-fun lt!141682 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14445 (_ BitVec 32)) SeekEntryResult!2000)

(assert (=> b!287801 (= lt!141679 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141682 k!2524 (array!14446 (store (arr!6851 a!3312) i!1256 k!2524) (size!7203 a!3312)) mask!3809))))

(declare-fun lt!141680 () SeekEntryResult!2000)

(assert (=> b!287801 (= lt!141680 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141682 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287801 (= lt!141682 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!287802 () Bool)

(declare-fun res!149567 () Bool)

(assert (=> b!287802 (=> (not res!149567) (not e!182247))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287802 (= res!149567 (validKeyInArray!0 k!2524))))

(declare-fun res!149565 () Bool)

(assert (=> start!28086 (=> (not res!149565) (not e!182247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28086 (= res!149565 (validMask!0 mask!3809))))

(assert (=> start!28086 e!182247))

(assert (=> start!28086 true))

(declare-fun array_inv!4814 (array!14445) Bool)

(assert (=> start!28086 (array_inv!4814 a!3312)))

(declare-fun b!287803 () Bool)

(declare-fun res!149563 () Bool)

(assert (=> b!287803 (=> (not res!149563) (not e!182247))))

(assert (=> b!287803 (= res!149563 (and (= (size!7203 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7203 a!3312))))))

(declare-fun b!287804 () Bool)

(declare-fun res!149568 () Bool)

(assert (=> b!287804 (=> (not res!149568) (not e!182248))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14445 (_ BitVec 32)) Bool)

(assert (=> b!287804 (= res!149568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28086 res!149565) b!287803))

(assert (= (and b!287803 res!149563) b!287802))

(assert (= (and b!287802 res!149567) b!287799))

(assert (= (and b!287799 res!149564) b!287800))

(assert (= (and b!287800 res!149566) b!287804))

(assert (= (and b!287804 res!149568) b!287801))

(declare-fun m!302133 () Bool)

(assert (=> b!287801 m!302133))

(declare-fun m!302135 () Bool)

(assert (=> b!287801 m!302135))

(declare-fun m!302137 () Bool)

(assert (=> b!287801 m!302137))

(declare-fun m!302139 () Bool)

(assert (=> b!287801 m!302139))

(declare-fun m!302141 () Bool)

(assert (=> b!287799 m!302141))

(declare-fun m!302143 () Bool)

(assert (=> b!287802 m!302143))

(declare-fun m!302145 () Bool)

(assert (=> b!287804 m!302145))

(declare-fun m!302147 () Bool)

(assert (=> start!28086 m!302147))

(declare-fun m!302149 () Bool)

(assert (=> start!28086 m!302149))

(declare-fun m!302151 () Bool)

(assert (=> b!287800 m!302151))

(push 1)

