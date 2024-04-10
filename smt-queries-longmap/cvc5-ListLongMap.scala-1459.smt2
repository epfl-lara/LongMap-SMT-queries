; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28092 () Bool)

(assert start!28092)

(declare-fun res!149619 () Bool)

(declare-fun e!182274 () Bool)

(assert (=> start!28092 (=> (not res!149619) (not e!182274))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28092 (= res!149619 (validMask!0 mask!3809))))

(assert (=> start!28092 e!182274))

(assert (=> start!28092 true))

(declare-datatypes ((array!14451 0))(
  ( (array!14452 (arr!6854 (Array (_ BitVec 32) (_ BitVec 64))) (size!7206 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14451)

(declare-fun array_inv!4817 (array!14451) Bool)

(assert (=> start!28092 (array_inv!4817 a!3312)))

(declare-fun b!287853 () Bool)

(declare-fun e!182275 () Bool)

(assert (=> b!287853 (= e!182275 false)))

(declare-fun lt!141716 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun k!2524 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2003 0))(
  ( (MissingZero!2003 (index!10182 (_ BitVec 32))) (Found!2003 (index!10183 (_ BitVec 32))) (Intermediate!2003 (undefined!2815 Bool) (index!10184 (_ BitVec 32)) (x!28402 (_ BitVec 32))) (Undefined!2003) (MissingVacant!2003 (index!10185 (_ BitVec 32))) )
))
(declare-fun lt!141718 () SeekEntryResult!2003)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14451 (_ BitVec 32)) SeekEntryResult!2003)

(assert (=> b!287853 (= lt!141718 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141716 k!2524 (array!14452 (store (arr!6854 a!3312) i!1256 k!2524) (size!7206 a!3312)) mask!3809))))

(declare-fun lt!141715 () SeekEntryResult!2003)

(assert (=> b!287853 (= lt!141715 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141716 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287853 (= lt!141716 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!287854 () Bool)

(declare-fun res!149622 () Bool)

(assert (=> b!287854 (=> (not res!149622) (not e!182274))))

(declare-fun arrayContainsKey!0 (array!14451 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287854 (= res!149622 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!287855 () Bool)

(assert (=> b!287855 (= e!182274 e!182275)))

(declare-fun res!149617 () Bool)

(assert (=> b!287855 (=> (not res!149617) (not e!182275))))

(declare-fun lt!141717 () SeekEntryResult!2003)

(assert (=> b!287855 (= res!149617 (or (= lt!141717 (MissingZero!2003 i!1256)) (= lt!141717 (MissingVacant!2003 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14451 (_ BitVec 32)) SeekEntryResult!2003)

(assert (=> b!287855 (= lt!141717 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!287856 () Bool)

(declare-fun res!149620 () Bool)

(assert (=> b!287856 (=> (not res!149620) (not e!182275))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14451 (_ BitVec 32)) Bool)

(assert (=> b!287856 (= res!149620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287857 () Bool)

(declare-fun res!149618 () Bool)

(assert (=> b!287857 (=> (not res!149618) (not e!182274))))

(assert (=> b!287857 (= res!149618 (and (= (size!7206 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7206 a!3312))))))

(declare-fun b!287858 () Bool)

(declare-fun res!149621 () Bool)

(assert (=> b!287858 (=> (not res!149621) (not e!182274))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287858 (= res!149621 (validKeyInArray!0 k!2524))))

(assert (= (and start!28092 res!149619) b!287857))

(assert (= (and b!287857 res!149618) b!287858))

(assert (= (and b!287858 res!149621) b!287854))

(assert (= (and b!287854 res!149622) b!287855))

(assert (= (and b!287855 res!149617) b!287856))

(assert (= (and b!287856 res!149620) b!287853))

(declare-fun m!302193 () Bool)

(assert (=> b!287855 m!302193))

(declare-fun m!302195 () Bool)

(assert (=> start!28092 m!302195))

(declare-fun m!302197 () Bool)

(assert (=> start!28092 m!302197))

(declare-fun m!302199 () Bool)

(assert (=> b!287853 m!302199))

(declare-fun m!302201 () Bool)

(assert (=> b!287853 m!302201))

(declare-fun m!302203 () Bool)

(assert (=> b!287853 m!302203))

(declare-fun m!302205 () Bool)

(assert (=> b!287853 m!302205))

(declare-fun m!302207 () Bool)

(assert (=> b!287858 m!302207))

(declare-fun m!302209 () Bool)

(assert (=> b!287856 m!302209))

(declare-fun m!302211 () Bool)

(assert (=> b!287854 m!302211))

(push 1)

