; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28208 () Bool)

(assert start!28208)

(declare-fun b!288754 () Bool)

(declare-fun e!182816 () Bool)

(declare-fun e!182813 () Bool)

(assert (=> b!288754 (= e!182816 e!182813)))

(declare-fun res!150436 () Bool)

(assert (=> b!288754 (=> (not res!150436) (not e!182813))))

(declare-fun lt!142246 () Bool)

(assert (=> b!288754 (= res!150436 lt!142246)))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!142247 () (_ BitVec 32))

(declare-datatypes ((array!14515 0))(
  ( (array!14516 (arr!6885 (Array (_ BitVec 32) (_ BitVec 64))) (size!7238 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14515)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2033 0))(
  ( (MissingZero!2033 (index!10302 (_ BitVec 32))) (Found!2033 (index!10303 (_ BitVec 32))) (Intermediate!2033 (undefined!2845 Bool) (index!10304 (_ BitVec 32)) (x!28533 (_ BitVec 32))) (Undefined!2033) (MissingVacant!2033 (index!10305 (_ BitVec 32))) )
))
(declare-fun lt!142251 () SeekEntryResult!2033)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14515 (_ BitVec 32)) SeekEntryResult!2033)

(assert (=> b!288754 (= lt!142251 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142247 k0!2524 (array!14516 (store (arr!6885 a!3312) i!1256 k0!2524) (size!7238 a!3312)) mask!3809))))

(declare-fun lt!142249 () SeekEntryResult!2033)

(assert (=> b!288754 (= lt!142249 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142247 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288754 (= lt!142247 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!288755 () Bool)

(declare-fun e!182817 () Bool)

(assert (=> b!288755 (= e!182817 e!182816)))

(declare-fun res!150430 () Bool)

(assert (=> b!288755 (=> (not res!150430) (not e!182816))))

(declare-fun lt!142248 () SeekEntryResult!2033)

(assert (=> b!288755 (= res!150430 (or lt!142246 (= lt!142248 (MissingVacant!2033 i!1256))))))

(assert (=> b!288755 (= lt!142246 (= lt!142248 (MissingZero!2033 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14515 (_ BitVec 32)) SeekEntryResult!2033)

(assert (=> b!288755 (= lt!142248 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!288756 () Bool)

(declare-fun e!182815 () Bool)

(assert (=> b!288756 (= e!182815 (not true))))

(assert (=> b!288756 (and (= (select (arr!6885 a!3312) (index!10304 lt!142249)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10304 lt!142249) i!1256))))

(declare-fun b!288757 () Bool)

(declare-fun res!150433 () Bool)

(assert (=> b!288757 (=> (not res!150433) (not e!182816))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14515 (_ BitVec 32)) Bool)

(assert (=> b!288757 (= res!150433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!288758 () Bool)

(assert (=> b!288758 (= e!182813 e!182815)))

(declare-fun res!150429 () Bool)

(assert (=> b!288758 (=> (not res!150429) (not e!182815))))

(declare-fun lt!142250 () Bool)

(assert (=> b!288758 (= res!150429 (and (or lt!142250 (not (undefined!2845 lt!142249))) (or lt!142250 (not (= (select (arr!6885 a!3312) (index!10304 lt!142249)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142250 (not (= (select (arr!6885 a!3312) (index!10304 lt!142249)) k0!2524))) (not lt!142250)))))

(get-info :version)

(assert (=> b!288758 (= lt!142250 (not ((_ is Intermediate!2033) lt!142249)))))

(declare-fun b!288759 () Bool)

(declare-fun res!150431 () Bool)

(assert (=> b!288759 (=> (not res!150431) (not e!182817))))

(assert (=> b!288759 (= res!150431 (and (= (size!7238 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7238 a!3312))))))

(declare-fun b!288760 () Bool)

(declare-fun res!150434 () Bool)

(assert (=> b!288760 (=> (not res!150434) (not e!182817))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288760 (= res!150434 (validKeyInArray!0 k0!2524))))

(declare-fun b!288761 () Bool)

(declare-fun res!150432 () Bool)

(assert (=> b!288761 (=> (not res!150432) (not e!182817))))

(declare-fun arrayContainsKey!0 (array!14515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288761 (= res!150432 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!150435 () Bool)

(assert (=> start!28208 (=> (not res!150435) (not e!182817))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28208 (= res!150435 (validMask!0 mask!3809))))

(assert (=> start!28208 e!182817))

(assert (=> start!28208 true))

(declare-fun array_inv!4857 (array!14515) Bool)

(assert (=> start!28208 (array_inv!4857 a!3312)))

(assert (= (and start!28208 res!150435) b!288759))

(assert (= (and b!288759 res!150431) b!288760))

(assert (= (and b!288760 res!150434) b!288761))

(assert (= (and b!288761 res!150432) b!288755))

(assert (= (and b!288755 res!150430) b!288757))

(assert (= (and b!288757 res!150433) b!288754))

(assert (= (and b!288754 res!150436) b!288758))

(assert (= (and b!288758 res!150429) b!288756))

(declare-fun m!302501 () Bool)

(assert (=> b!288756 m!302501))

(assert (=> b!288758 m!302501))

(declare-fun m!302503 () Bool)

(assert (=> b!288757 m!302503))

(declare-fun m!302505 () Bool)

(assert (=> b!288760 m!302505))

(declare-fun m!302507 () Bool)

(assert (=> b!288754 m!302507))

(declare-fun m!302509 () Bool)

(assert (=> b!288754 m!302509))

(declare-fun m!302511 () Bool)

(assert (=> b!288754 m!302511))

(declare-fun m!302513 () Bool)

(assert (=> b!288754 m!302513))

(declare-fun m!302515 () Bool)

(assert (=> start!28208 m!302515))

(declare-fun m!302517 () Bool)

(assert (=> start!28208 m!302517))

(declare-fun m!302519 () Bool)

(assert (=> b!288755 m!302519))

(declare-fun m!302521 () Bool)

(assert (=> b!288761 m!302521))

(check-sat (not b!288754) (not start!28208) (not b!288760) (not b!288761) (not b!288755) (not b!288757))
(check-sat)
