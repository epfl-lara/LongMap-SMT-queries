; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28606 () Bool)

(assert start!28606)

(declare-fun b!292479 () Bool)

(declare-fun e!185043 () Bool)

(declare-fun e!185045 () Bool)

(assert (=> b!292479 (= e!185043 e!185045)))

(declare-fun res!153540 () Bool)

(assert (=> b!292479 (=> (not res!153540) (not e!185045))))

(declare-datatypes ((SeekEntryResult!2164 0))(
  ( (MissingZero!2164 (index!10826 (_ BitVec 32))) (Found!2164 (index!10827 (_ BitVec 32))) (Intermediate!2164 (undefined!2976 Bool) (index!10828 (_ BitVec 32)) (x!29011 (_ BitVec 32))) (Undefined!2164) (MissingVacant!2164 (index!10829 (_ BitVec 32))) )
))
(declare-fun lt!144869 () SeekEntryResult!2164)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292479 (= res!153540 (or (= lt!144869 (MissingZero!2164 i!1256)) (= lt!144869 (MissingVacant!2164 i!1256))))))

(declare-datatypes ((array!14785 0))(
  ( (array!14786 (arr!7015 (Array (_ BitVec 32) (_ BitVec 64))) (size!7367 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14785)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14785 (_ BitVec 32)) SeekEntryResult!2164)

(assert (=> b!292479 (= lt!144869 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!292480 () Bool)

(assert (=> b!292480 (= e!185045 false)))

(declare-fun lt!144870 () (_ BitVec 32))

(declare-fun lt!144868 () SeekEntryResult!2164)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14785 (_ BitVec 32)) SeekEntryResult!2164)

(assert (=> b!292480 (= lt!144868 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144870 k!2524 (array!14786 (store (arr!7015 a!3312) i!1256 k!2524) (size!7367 a!3312)) mask!3809))))

(declare-fun lt!144871 () SeekEntryResult!2164)

(assert (=> b!292480 (= lt!144871 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144870 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292480 (= lt!144870 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!292481 () Bool)

(declare-fun res!153537 () Bool)

(assert (=> b!292481 (=> (not res!153537) (not e!185043))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292481 (= res!153537 (validKeyInArray!0 k!2524))))

(declare-fun b!292482 () Bool)

(declare-fun res!153539 () Bool)

(assert (=> b!292482 (=> (not res!153539) (not e!185045))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14785 (_ BitVec 32)) Bool)

(assert (=> b!292482 (= res!153539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292483 () Bool)

(declare-fun res!153538 () Bool)

(assert (=> b!292483 (=> (not res!153538) (not e!185043))))

(declare-fun arrayContainsKey!0 (array!14785 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292483 (= res!153538 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!153535 () Bool)

(assert (=> start!28606 (=> (not res!153535) (not e!185043))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28606 (= res!153535 (validMask!0 mask!3809))))

(assert (=> start!28606 e!185043))

(assert (=> start!28606 true))

(declare-fun array_inv!4978 (array!14785) Bool)

(assert (=> start!28606 (array_inv!4978 a!3312)))

(declare-fun b!292484 () Bool)

(declare-fun res!153536 () Bool)

(assert (=> b!292484 (=> (not res!153536) (not e!185043))))

(assert (=> b!292484 (= res!153536 (and (= (size!7367 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7367 a!3312))))))

(assert (= (and start!28606 res!153535) b!292484))

(assert (= (and b!292484 res!153536) b!292481))

(assert (= (and b!292481 res!153537) b!292483))

(assert (= (and b!292483 res!153538) b!292479))

(assert (= (and b!292479 res!153540) b!292482))

(assert (= (and b!292482 res!153539) b!292480))

(declare-fun m!306217 () Bool)

(assert (=> b!292479 m!306217))

(declare-fun m!306219 () Bool)

(assert (=> b!292482 m!306219))

(declare-fun m!306221 () Bool)

(assert (=> start!28606 m!306221))

(declare-fun m!306223 () Bool)

(assert (=> start!28606 m!306223))

(declare-fun m!306225 () Bool)

(assert (=> b!292481 m!306225))

(declare-fun m!306227 () Bool)

(assert (=> b!292483 m!306227))

(declare-fun m!306229 () Bool)

(assert (=> b!292480 m!306229))

(declare-fun m!306231 () Bool)

(assert (=> b!292480 m!306231))

(declare-fun m!306233 () Bool)

(assert (=> b!292480 m!306233))

(declare-fun m!306235 () Bool)

(assert (=> b!292480 m!306235))

(push 1)

