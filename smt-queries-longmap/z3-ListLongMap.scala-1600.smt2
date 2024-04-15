; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30258 () Bool)

(assert start!30258)

(declare-fun b!302698 () Bool)

(declare-fun res!160333 () Bool)

(declare-fun e!190644 () Bool)

(assert (=> b!302698 (=> (not res!160333) (not e!190644))))

(declare-datatypes ((array!15368 0))(
  ( (array!15369 (arr!7272 (Array (_ BitVec 32) (_ BitVec 64))) (size!7625 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15368)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!302698 (= res!160333 (and (= (select (arr!7272 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7625 a!3293))))))

(declare-fun b!302699 () Bool)

(declare-fun res!160331 () Bool)

(declare-fun e!190645 () Bool)

(assert (=> b!302699 (=> (not res!160331) (not e!190645))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15368 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302699 (= res!160331 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun b!302700 () Bool)

(assert (=> b!302700 (= e!190644 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7272 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7272 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7272 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3709 #b00000000000000000000000000000000)))))

(declare-fun b!302701 () Bool)

(declare-fun res!160332 () Bool)

(assert (=> b!302701 (=> (not res!160332) (not e!190644))))

(declare-datatypes ((SeekEntryResult!2411 0))(
  ( (MissingZero!2411 (index!11820 (_ BitVec 32))) (Found!2411 (index!11821 (_ BitVec 32))) (Intermediate!2411 (undefined!3223 Bool) (index!11822 (_ BitVec 32)) (x!30103 (_ BitVec 32))) (Undefined!2411) (MissingVacant!2411 (index!11823 (_ BitVec 32))) )
))
(declare-fun lt!149918 () SeekEntryResult!2411)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15368 (_ BitVec 32)) SeekEntryResult!2411)

(assert (=> b!302701 (= res!160332 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!149918))))

(declare-fun b!302702 () Bool)

(assert (=> b!302702 (= e!190645 e!190644)))

(declare-fun res!160334 () Bool)

(assert (=> b!302702 (=> (not res!160334) (not e!190644))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302702 (= res!160334 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!149918))))

(assert (=> b!302702 (= lt!149918 (Intermediate!2411 false resIndex!52 resX!52))))

(declare-fun b!302703 () Bool)

(declare-fun res!160337 () Bool)

(assert (=> b!302703 (=> (not res!160337) (not e!190645))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15368 (_ BitVec 32)) SeekEntryResult!2411)

(assert (=> b!302703 (= res!160337 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2411 i!1240)))))

(declare-fun res!160335 () Bool)

(assert (=> start!30258 (=> (not res!160335) (not e!190645))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30258 (= res!160335 (validMask!0 mask!3709))))

(assert (=> start!30258 e!190645))

(declare-fun array_inv!5244 (array!15368) Bool)

(assert (=> start!30258 (array_inv!5244 a!3293)))

(assert (=> start!30258 true))

(declare-fun b!302704 () Bool)

(declare-fun res!160338 () Bool)

(assert (=> b!302704 (=> (not res!160338) (not e!190645))))

(assert (=> b!302704 (= res!160338 (and (= (size!7625 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7625 a!3293))))))

(declare-fun b!302705 () Bool)

(declare-fun res!160330 () Bool)

(assert (=> b!302705 (=> (not res!160330) (not e!190645))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302705 (= res!160330 (validKeyInArray!0 k0!2441))))

(declare-fun b!302706 () Bool)

(declare-fun res!160336 () Bool)

(assert (=> b!302706 (=> (not res!160336) (not e!190645))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15368 (_ BitVec 32)) Bool)

(assert (=> b!302706 (= res!160336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30258 res!160335) b!302704))

(assert (= (and b!302704 res!160338) b!302705))

(assert (= (and b!302705 res!160330) b!302699))

(assert (= (and b!302699 res!160331) b!302703))

(assert (= (and b!302703 res!160337) b!302706))

(assert (= (and b!302706 res!160336) b!302702))

(assert (= (and b!302702 res!160334) b!302698))

(assert (= (and b!302698 res!160333) b!302701))

(assert (= (and b!302701 res!160332) b!302700))

(declare-fun m!313675 () Bool)

(assert (=> b!302700 m!313675))

(declare-fun m!313677 () Bool)

(assert (=> b!302703 m!313677))

(declare-fun m!313679 () Bool)

(assert (=> b!302702 m!313679))

(assert (=> b!302702 m!313679))

(declare-fun m!313681 () Bool)

(assert (=> b!302702 m!313681))

(declare-fun m!313683 () Bool)

(assert (=> b!302701 m!313683))

(declare-fun m!313685 () Bool)

(assert (=> start!30258 m!313685))

(declare-fun m!313687 () Bool)

(assert (=> start!30258 m!313687))

(declare-fun m!313689 () Bool)

(assert (=> b!302706 m!313689))

(declare-fun m!313691 () Bool)

(assert (=> b!302698 m!313691))

(declare-fun m!313693 () Bool)

(assert (=> b!302699 m!313693))

(declare-fun m!313695 () Bool)

(assert (=> b!302705 m!313695))

(check-sat (not b!302702) (not b!302706) (not b!302701) (not b!302699) (not b!302703) (not b!302705) (not start!30258))
(check-sat)
