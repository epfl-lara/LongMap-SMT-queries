; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31776 () Bool)

(assert start!31776)

(declare-fun b!317217 () Bool)

(declare-fun res!171950 () Bool)

(declare-fun e!197218 () Bool)

(assert (=> b!317217 (=> (not res!171950) (not e!197218))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317217 (= res!171950 (validKeyInArray!0 k0!2441))))

(declare-fun b!317218 () Bool)

(declare-fun e!197217 () Bool)

(assert (=> b!317218 (= e!197218 e!197217)))

(declare-fun res!171944 () Bool)

(assert (=> b!317218 (=> (not res!171944) (not e!197217))))

(declare-datatypes ((array!16151 0))(
  ( (array!16152 (arr!7641 (Array (_ BitVec 32) (_ BitVec 64))) (size!7994 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16151)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2780 0))(
  ( (MissingZero!2780 (index!13296 (_ BitVec 32))) (Found!2780 (index!13297 (_ BitVec 32))) (Intermediate!2780 (undefined!3592 Bool) (index!13298 (_ BitVec 32)) (x!31576 (_ BitVec 32))) (Undefined!2780) (MissingVacant!2780 (index!13299 (_ BitVec 32))) )
))
(declare-fun lt!154739 () SeekEntryResult!2780)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16151 (_ BitVec 32)) SeekEntryResult!2780)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317218 (= res!171944 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154739))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!317218 (= lt!154739 (Intermediate!2780 false resIndex!52 resX!52))))

(declare-fun b!317219 () Bool)

(declare-fun res!171942 () Bool)

(assert (=> b!317219 (=> (not res!171942) (not e!197218))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16151 (_ BitVec 32)) SeekEntryResult!2780)

(assert (=> b!317219 (= res!171942 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2780 i!1240)))))

(declare-fun b!317220 () Bool)

(declare-fun e!197215 () Bool)

(assert (=> b!317220 (= e!197217 e!197215)))

(declare-fun res!171946 () Bool)

(assert (=> b!317220 (=> (not res!171946) (not e!197215))))

(declare-fun lt!154737 () SeekEntryResult!2780)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!317220 (= res!171946 (and (= lt!154737 lt!154739) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7641 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!317220 (= lt!154737 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!317221 () Bool)

(declare-fun res!171945 () Bool)

(assert (=> b!317221 (=> (not res!171945) (not e!197218))))

(assert (=> b!317221 (= res!171945 (and (= (size!7994 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7994 a!3293))))))

(declare-fun b!317222 () Bool)

(declare-fun res!171951 () Bool)

(assert (=> b!317222 (=> (not res!171951) (not e!197218))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16151 (_ BitVec 32)) Bool)

(assert (=> b!317222 (= res!171951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!317223 () Bool)

(declare-fun res!171948 () Bool)

(assert (=> b!317223 (=> (not res!171948) (not e!197217))))

(assert (=> b!317223 (= res!171948 (and (= (select (arr!7641 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7994 a!3293))))))

(declare-fun b!317224 () Bool)

(assert (=> b!317224 (= e!197215 (not true))))

(declare-fun e!197219 () Bool)

(assert (=> b!317224 e!197219))

(declare-fun res!171949 () Bool)

(assert (=> b!317224 (=> (not res!171949) (not e!197219))))

(declare-fun lt!154736 () (_ BitVec 32))

(assert (=> b!317224 (= res!171949 (= lt!154737 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154736 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317224 (= lt!154736 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun res!171943 () Bool)

(assert (=> start!31776 (=> (not res!171943) (not e!197218))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31776 (= res!171943 (validMask!0 mask!3709))))

(assert (=> start!31776 e!197218))

(declare-fun array_inv!5613 (array!16151) Bool)

(assert (=> start!31776 (array_inv!5613 a!3293)))

(assert (=> start!31776 true))

(declare-fun b!317225 () Bool)

(declare-fun res!171947 () Bool)

(assert (=> b!317225 (=> (not res!171947) (not e!197218))))

(declare-fun arrayContainsKey!0 (array!16151 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317225 (= res!171947 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!317226 () Bool)

(declare-fun lt!154738 () array!16151)

(assert (=> b!317226 (= e!197219 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!154738 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154736 k0!2441 lt!154738 mask!3709)))))

(assert (=> b!317226 (= lt!154738 (array!16152 (store (arr!7641 a!3293) i!1240 k0!2441) (size!7994 a!3293)))))

(assert (= (and start!31776 res!171943) b!317221))

(assert (= (and b!317221 res!171945) b!317217))

(assert (= (and b!317217 res!171950) b!317225))

(assert (= (and b!317225 res!171947) b!317219))

(assert (= (and b!317219 res!171942) b!317222))

(assert (= (and b!317222 res!171951) b!317218))

(assert (= (and b!317218 res!171944) b!317223))

(assert (= (and b!317223 res!171948) b!317220))

(assert (= (and b!317220 res!171946) b!317224))

(assert (= (and b!317224 res!171949) b!317226))

(declare-fun m!325399 () Bool)

(assert (=> b!317225 m!325399))

(declare-fun m!325401 () Bool)

(assert (=> b!317217 m!325401))

(declare-fun m!325403 () Bool)

(assert (=> b!317218 m!325403))

(assert (=> b!317218 m!325403))

(declare-fun m!325405 () Bool)

(assert (=> b!317218 m!325405))

(declare-fun m!325407 () Bool)

(assert (=> b!317219 m!325407))

(declare-fun m!325409 () Bool)

(assert (=> b!317224 m!325409))

(declare-fun m!325411 () Bool)

(assert (=> b!317224 m!325411))

(declare-fun m!325413 () Bool)

(assert (=> b!317223 m!325413))

(declare-fun m!325415 () Bool)

(assert (=> b!317226 m!325415))

(declare-fun m!325417 () Bool)

(assert (=> b!317226 m!325417))

(declare-fun m!325419 () Bool)

(assert (=> b!317226 m!325419))

(declare-fun m!325421 () Bool)

(assert (=> b!317220 m!325421))

(declare-fun m!325423 () Bool)

(assert (=> b!317220 m!325423))

(declare-fun m!325425 () Bool)

(assert (=> start!31776 m!325425))

(declare-fun m!325427 () Bool)

(assert (=> start!31776 m!325427))

(declare-fun m!325429 () Bool)

(assert (=> b!317222 m!325429))

(check-sat (not b!317225) (not b!317222) (not b!317226) (not start!31776) (not b!317224) (not b!317219) (not b!317217) (not b!317220) (not b!317218))
(check-sat)
