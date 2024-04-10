; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28318 () Bool)

(assert start!28318)

(declare-fun res!151641 () Bool)

(declare-fun e!183623 () Bool)

(assert (=> start!28318 (=> (not res!151641) (not e!183623))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28318 (= res!151641 (validMask!0 mask!3809))))

(assert (=> start!28318 e!183623))

(assert (=> start!28318 true))

(declare-datatypes ((array!14632 0))(
  ( (array!14633 (arr!6943 (Array (_ BitVec 32) (_ BitVec 64))) (size!7295 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14632)

(declare-fun array_inv!4906 (array!14632) Bool)

(assert (=> start!28318 (array_inv!4906 a!3312)))

(declare-fun b!290157 () Bool)

(declare-fun res!151640 () Bool)

(assert (=> b!290157 (=> (not res!151640) (not e!183623))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14632 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290157 (= res!151640 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290158 () Bool)

(declare-fun e!183622 () Bool)

(assert (=> b!290158 (= e!183622 false)))

(declare-datatypes ((SeekEntryResult!2092 0))(
  ( (MissingZero!2092 (index!10538 (_ BitVec 32))) (Found!2092 (index!10539 (_ BitVec 32))) (Intermediate!2092 (undefined!2904 Bool) (index!10540 (_ BitVec 32)) (x!28729 (_ BitVec 32))) (Undefined!2092) (MissingVacant!2092 (index!10541 (_ BitVec 32))) )
))
(declare-fun lt!143302 () SeekEntryResult!2092)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!143305 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14632 (_ BitVec 32)) SeekEntryResult!2092)

(assert (=> b!290158 (= lt!143302 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143305 k!2524 (array!14633 (store (arr!6943 a!3312) i!1256 k!2524) (size!7295 a!3312)) mask!3809))))

(declare-fun lt!143303 () SeekEntryResult!2092)

(assert (=> b!290158 (= lt!143303 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143305 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290158 (= lt!143305 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!290159 () Bool)

(declare-fun res!151639 () Bool)

(assert (=> b!290159 (=> (not res!151639) (not e!183623))))

(assert (=> b!290159 (= res!151639 (and (= (size!7295 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7295 a!3312))))))

(declare-fun b!290160 () Bool)

(declare-fun res!151638 () Bool)

(assert (=> b!290160 (=> (not res!151638) (not e!183622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14632 (_ BitVec 32)) Bool)

(assert (=> b!290160 (= res!151638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290161 () Bool)

(declare-fun res!151637 () Bool)

(assert (=> b!290161 (=> (not res!151637) (not e!183623))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290161 (= res!151637 (validKeyInArray!0 k!2524))))

(declare-fun b!290162 () Bool)

(assert (=> b!290162 (= e!183623 e!183622)))

(declare-fun res!151636 () Bool)

(assert (=> b!290162 (=> (not res!151636) (not e!183622))))

(declare-fun lt!143304 () SeekEntryResult!2092)

(assert (=> b!290162 (= res!151636 (or (= lt!143304 (MissingZero!2092 i!1256)) (= lt!143304 (MissingVacant!2092 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14632 (_ BitVec 32)) SeekEntryResult!2092)

(assert (=> b!290162 (= lt!143304 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!28318 res!151641) b!290159))

(assert (= (and b!290159 res!151639) b!290161))

(assert (= (and b!290161 res!151637) b!290157))

(assert (= (and b!290157 res!151640) b!290162))

(assert (= (and b!290162 res!151636) b!290160))

(assert (= (and b!290160 res!151638) b!290158))

(declare-fun m!304267 () Bool)

(assert (=> b!290160 m!304267))

(declare-fun m!304269 () Bool)

(assert (=> b!290157 m!304269))

(declare-fun m!304271 () Bool)

(assert (=> b!290162 m!304271))

(declare-fun m!304273 () Bool)

(assert (=> b!290161 m!304273))

(declare-fun m!304275 () Bool)

(assert (=> start!28318 m!304275))

(declare-fun m!304277 () Bool)

(assert (=> start!28318 m!304277))

(declare-fun m!304279 () Bool)

(assert (=> b!290158 m!304279))

(declare-fun m!304281 () Bool)

(assert (=> b!290158 m!304281))

(declare-fun m!304283 () Bool)

(assert (=> b!290158 m!304283))

(declare-fun m!304285 () Bool)

(assert (=> b!290158 m!304285))

(push 1)

(assert (not b!290161))

(assert (not b!290157))

(assert (not b!290162))

(assert (not b!290160))

(assert (not start!28318))

(assert (not b!290158))

(check-sat)

(pop 1)

