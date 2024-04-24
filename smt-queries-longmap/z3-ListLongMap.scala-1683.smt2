; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30972 () Bool)

(assert start!30972)

(declare-fun b!311274 () Bool)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun e!194228 () Bool)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!152329 () (_ BitVec 32))

(declare-datatypes ((array!15887 0))(
  ( (array!15888 (arr!7525 (Array (_ BitVec 32) (_ BitVec 64))) (size!7877 (_ BitVec 32))) )
))
(declare-fun lt!152330 () array!15887)

(declare-datatypes ((SeekEntryResult!2630 0))(
  ( (MissingZero!2630 (index!12696 (_ BitVec 32))) (Found!2630 (index!12697 (_ BitVec 32))) (Intermediate!2630 (undefined!3442 Bool) (index!12698 (_ BitVec 32)) (x!31024 (_ BitVec 32))) (Undefined!2630) (MissingVacant!2630 (index!12699 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15887 (_ BitVec 32)) SeekEntryResult!2630)

(assert (=> b!311274 (= e!194228 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152330 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152329 k0!2441 lt!152330 mask!3709)))))

(declare-fun a!3293 () array!15887)

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!311274 (= lt!152330 (array!15888 (store (arr!7525 a!3293) i!1240 k0!2441) (size!7877 a!3293)))))

(declare-fun b!311275 () Bool)

(declare-fun res!167781 () Bool)

(declare-fun e!194231 () Bool)

(assert (=> b!311275 (=> (not res!167781) (not e!194231))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311275 (= res!167781 (validKeyInArray!0 k0!2441))))

(declare-fun b!311276 () Bool)

(declare-fun res!167782 () Bool)

(assert (=> b!311276 (=> (not res!167782) (not e!194231))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15887 (_ BitVec 32)) SeekEntryResult!2630)

(assert (=> b!311276 (= res!167782 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2630 i!1240)))))

(declare-fun b!311277 () Bool)

(declare-fun res!167784 () Bool)

(assert (=> b!311277 (=> (not res!167784) (not e!194231))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15887 (_ BitVec 32)) Bool)

(assert (=> b!311277 (= res!167784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311278 () Bool)

(declare-fun e!194230 () Bool)

(assert (=> b!311278 (= e!194230 (not true))))

(assert (=> b!311278 e!194228))

(declare-fun res!167778 () Bool)

(assert (=> b!311278 (=> (not res!167778) (not e!194228))))

(declare-fun lt!152328 () SeekEntryResult!2630)

(assert (=> b!311278 (= res!167778 (= lt!152328 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152329 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311278 (= lt!152329 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!311279 () Bool)

(declare-fun res!167785 () Bool)

(assert (=> b!311279 (=> (not res!167785) (not e!194231))))

(declare-fun arrayContainsKey!0 (array!15887 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311279 (= res!167785 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311280 () Bool)

(declare-fun e!194232 () Bool)

(assert (=> b!311280 (= e!194231 e!194232)))

(declare-fun res!167787 () Bool)

(assert (=> b!311280 (=> (not res!167787) (not e!194232))))

(declare-fun lt!152331 () SeekEntryResult!2630)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311280 (= res!167787 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152331))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!311280 (= lt!152331 (Intermediate!2630 false resIndex!52 resX!52))))

(declare-fun b!311281 () Bool)

(declare-fun res!167779 () Bool)

(assert (=> b!311281 (=> (not res!167779) (not e!194232))))

(assert (=> b!311281 (= res!167779 (and (= (select (arr!7525 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7877 a!3293))))))

(declare-fun b!311282 () Bool)

(declare-fun res!167786 () Bool)

(assert (=> b!311282 (=> (not res!167786) (not e!194231))))

(assert (=> b!311282 (= res!167786 (and (= (size!7877 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7877 a!3293))))))

(declare-fun res!167783 () Bool)

(assert (=> start!30972 (=> (not res!167783) (not e!194231))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30972 (= res!167783 (validMask!0 mask!3709))))

(assert (=> start!30972 e!194231))

(declare-fun array_inv!5475 (array!15887) Bool)

(assert (=> start!30972 (array_inv!5475 a!3293)))

(assert (=> start!30972 true))

(declare-fun b!311283 () Bool)

(assert (=> b!311283 (= e!194232 e!194230)))

(declare-fun res!167780 () Bool)

(assert (=> b!311283 (=> (not res!167780) (not e!194230))))

(assert (=> b!311283 (= res!167780 (and (= lt!152328 lt!152331) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7525 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311283 (= lt!152328 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(assert (= (and start!30972 res!167783) b!311282))

(assert (= (and b!311282 res!167786) b!311275))

(assert (= (and b!311275 res!167781) b!311279))

(assert (= (and b!311279 res!167785) b!311276))

(assert (= (and b!311276 res!167782) b!311277))

(assert (= (and b!311277 res!167784) b!311280))

(assert (= (and b!311280 res!167787) b!311281))

(assert (= (and b!311281 res!167779) b!311283))

(assert (= (and b!311283 res!167780) b!311278))

(assert (= (and b!311278 res!167778) b!311274))

(declare-fun m!321427 () Bool)

(assert (=> b!311279 m!321427))

(declare-fun m!321429 () Bool)

(assert (=> b!311278 m!321429))

(declare-fun m!321431 () Bool)

(assert (=> b!311278 m!321431))

(declare-fun m!321433 () Bool)

(assert (=> b!311281 m!321433))

(declare-fun m!321435 () Bool)

(assert (=> b!311274 m!321435))

(declare-fun m!321437 () Bool)

(assert (=> b!311274 m!321437))

(declare-fun m!321439 () Bool)

(assert (=> b!311274 m!321439))

(declare-fun m!321441 () Bool)

(assert (=> b!311280 m!321441))

(assert (=> b!311280 m!321441))

(declare-fun m!321443 () Bool)

(assert (=> b!311280 m!321443))

(declare-fun m!321445 () Bool)

(assert (=> b!311275 m!321445))

(declare-fun m!321447 () Bool)

(assert (=> start!30972 m!321447))

(declare-fun m!321449 () Bool)

(assert (=> start!30972 m!321449))

(declare-fun m!321451 () Bool)

(assert (=> b!311276 m!321451))

(declare-fun m!321453 () Bool)

(assert (=> b!311283 m!321453))

(declare-fun m!321455 () Bool)

(assert (=> b!311283 m!321455))

(declare-fun m!321457 () Bool)

(assert (=> b!311277 m!321457))

(check-sat (not b!311274) (not b!311283) (not b!311280) (not b!311275) (not start!30972) (not b!311278) (not b!311279) (not b!311277) (not b!311276))
(check-sat)
