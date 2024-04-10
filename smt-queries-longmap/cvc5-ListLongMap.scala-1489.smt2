; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28320 () Bool)

(assert start!28320)

(declare-fun b!290175 () Bool)

(declare-fun res!151654 () Bool)

(declare-fun e!183632 () Bool)

(assert (=> b!290175 (=> (not res!151654) (not e!183632))))

(declare-datatypes ((array!14634 0))(
  ( (array!14635 (arr!6944 (Array (_ BitVec 32) (_ BitVec 64))) (size!7296 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14634)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14634 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290175 (= res!151654 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290176 () Bool)

(declare-fun res!151658 () Bool)

(assert (=> b!290176 (=> (not res!151658) (not e!183632))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!290176 (= res!151658 (and (= (size!7296 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7296 a!3312))))))

(declare-fun b!290177 () Bool)

(declare-fun res!151656 () Bool)

(assert (=> b!290177 (=> (not res!151656) (not e!183632))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290177 (= res!151656 (validKeyInArray!0 k!2524))))

(declare-fun b!290178 () Bool)

(declare-fun e!183630 () Bool)

(assert (=> b!290178 (= e!183632 e!183630)))

(declare-fun res!151659 () Bool)

(assert (=> b!290178 (=> (not res!151659) (not e!183630))))

(declare-datatypes ((SeekEntryResult!2093 0))(
  ( (MissingZero!2093 (index!10542 (_ BitVec 32))) (Found!2093 (index!10543 (_ BitVec 32))) (Intermediate!2093 (undefined!2905 Bool) (index!10544 (_ BitVec 32)) (x!28738 (_ BitVec 32))) (Undefined!2093) (MissingVacant!2093 (index!10545 (_ BitVec 32))) )
))
(declare-fun lt!143315 () SeekEntryResult!2093)

(assert (=> b!290178 (= res!151659 (or (= lt!143315 (MissingZero!2093 i!1256)) (= lt!143315 (MissingVacant!2093 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14634 (_ BitVec 32)) SeekEntryResult!2093)

(assert (=> b!290178 (= lt!143315 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun res!151657 () Bool)

(assert (=> start!28320 (=> (not res!151657) (not e!183632))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28320 (= res!151657 (validMask!0 mask!3809))))

(assert (=> start!28320 e!183632))

(assert (=> start!28320 true))

(declare-fun array_inv!4907 (array!14634) Bool)

(assert (=> start!28320 (array_inv!4907 a!3312)))

(declare-fun b!290179 () Bool)

(declare-fun res!151655 () Bool)

(assert (=> b!290179 (=> (not res!151655) (not e!183630))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14634 (_ BitVec 32)) Bool)

(assert (=> b!290179 (= res!151655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290180 () Bool)

(assert (=> b!290180 (= e!183630 false)))

(declare-fun lt!143316 () (_ BitVec 32))

(declare-fun lt!143314 () SeekEntryResult!2093)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14634 (_ BitVec 32)) SeekEntryResult!2093)

(assert (=> b!290180 (= lt!143314 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143316 k!2524 (array!14635 (store (arr!6944 a!3312) i!1256 k!2524) (size!7296 a!3312)) mask!3809))))

(declare-fun lt!143317 () SeekEntryResult!2093)

(assert (=> b!290180 (= lt!143317 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143316 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290180 (= lt!143316 (toIndex!0 k!2524 mask!3809))))

(assert (= (and start!28320 res!151657) b!290176))

(assert (= (and b!290176 res!151658) b!290177))

(assert (= (and b!290177 res!151656) b!290175))

(assert (= (and b!290175 res!151654) b!290178))

(assert (= (and b!290178 res!151659) b!290179))

(assert (= (and b!290179 res!151655) b!290180))

(declare-fun m!304287 () Bool)

(assert (=> b!290177 m!304287))

(declare-fun m!304289 () Bool)

(assert (=> start!28320 m!304289))

(declare-fun m!304291 () Bool)

(assert (=> start!28320 m!304291))

(declare-fun m!304293 () Bool)

(assert (=> b!290180 m!304293))

(declare-fun m!304295 () Bool)

(assert (=> b!290180 m!304295))

(declare-fun m!304297 () Bool)

(assert (=> b!290180 m!304297))

(declare-fun m!304299 () Bool)

(assert (=> b!290180 m!304299))

(declare-fun m!304301 () Bool)

(assert (=> b!290179 m!304301))

(declare-fun m!304303 () Bool)

(assert (=> b!290178 m!304303))

(declare-fun m!304305 () Bool)

(assert (=> b!290175 m!304305))

(push 1)

