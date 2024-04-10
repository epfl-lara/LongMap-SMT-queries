; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30520 () Bool)

(assert start!30520)

(declare-fun b!305349 () Bool)

(declare-fun res!162537 () Bool)

(declare-fun e!191782 () Bool)

(assert (=> b!305349 (=> (not res!162537) (not e!191782))))

(declare-datatypes ((array!15524 0))(
  ( (array!15525 (arr!7347 (Array (_ BitVec 32) (_ BitVec 64))) (size!7699 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15524)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!305349 (= res!162537 (and (= (select (arr!7347 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7699 a!3293))))))

(declare-fun b!305350 () Bool)

(declare-fun res!162536 () Bool)

(declare-fun e!191779 () Bool)

(assert (=> b!305350 (=> (not res!162536) (not e!191779))))

(declare-fun mask!3709 () (_ BitVec 32))

(assert (=> b!305350 (= res!162536 (and (= (size!7699 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7699 a!3293))))))

(declare-fun b!305351 () Bool)

(declare-fun res!162542 () Bool)

(assert (=> b!305351 (=> (not res!162542) (not e!191779))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2487 0))(
  ( (MissingZero!2487 (index!12124 (_ BitVec 32))) (Found!2487 (index!12125 (_ BitVec 32))) (Intermediate!2487 (undefined!3299 Bool) (index!12126 (_ BitVec 32)) (x!30386 (_ BitVec 32))) (Undefined!2487) (MissingVacant!2487 (index!12127 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15524 (_ BitVec 32)) SeekEntryResult!2487)

(assert (=> b!305351 (= res!162542 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2487 i!1240)))))

(declare-fun e!191780 () Bool)

(declare-fun b!305352 () Bool)

(declare-fun lt!150725 () (_ BitVec 32))

(assert (=> b!305352 (= e!191780 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt lt!150725 #b00000000000000000000000000000000) (bvsge lt!150725 (bvadd #b00000000000000000000000000000001 mask!3709)) (and (bvsle (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000)))))))

(declare-fun lt!150726 () SeekEntryResult!2487)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15524 (_ BitVec 32)) SeekEntryResult!2487)

(assert (=> b!305352 (= lt!150726 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!150725 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305352 (= lt!150725 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun res!162540 () Bool)

(assert (=> start!30520 (=> (not res!162540) (not e!191779))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30520 (= res!162540 (validMask!0 mask!3709))))

(assert (=> start!30520 e!191779))

(declare-fun array_inv!5310 (array!15524) Bool)

(assert (=> start!30520 (array_inv!5310 a!3293)))

(assert (=> start!30520 true))

(declare-fun b!305353 () Bool)

(assert (=> b!305353 (= e!191782 e!191780)))

(declare-fun res!162539 () Bool)

(assert (=> b!305353 (=> (not res!162539) (not e!191780))))

(declare-fun lt!150724 () SeekEntryResult!2487)

(assert (=> b!305353 (= res!162539 (and (= lt!150726 lt!150724) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7347 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7347 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7347 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!305353 (= lt!150726 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!305354 () Bool)

(declare-fun res!162538 () Bool)

(assert (=> b!305354 (=> (not res!162538) (not e!191779))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!305354 (= res!162538 (validKeyInArray!0 k0!2441))))

(declare-fun b!305355 () Bool)

(assert (=> b!305355 (= e!191779 e!191782)))

(declare-fun res!162543 () Bool)

(assert (=> b!305355 (=> (not res!162543) (not e!191782))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305355 (= res!162543 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150724))))

(assert (=> b!305355 (= lt!150724 (Intermediate!2487 false resIndex!52 resX!52))))

(declare-fun b!305356 () Bool)

(declare-fun res!162535 () Bool)

(assert (=> b!305356 (=> (not res!162535) (not e!191779))))

(declare-fun arrayContainsKey!0 (array!15524 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!305356 (= res!162535 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!305357 () Bool)

(declare-fun res!162541 () Bool)

(assert (=> b!305357 (=> (not res!162541) (not e!191779))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15524 (_ BitVec 32)) Bool)

(assert (=> b!305357 (= res!162541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30520 res!162540) b!305350))

(assert (= (and b!305350 res!162536) b!305354))

(assert (= (and b!305354 res!162538) b!305356))

(assert (= (and b!305356 res!162535) b!305351))

(assert (= (and b!305351 res!162542) b!305357))

(assert (= (and b!305357 res!162541) b!305355))

(assert (= (and b!305355 res!162543) b!305349))

(assert (= (and b!305349 res!162537) b!305353))

(assert (= (and b!305353 res!162539) b!305352))

(declare-fun m!316315 () Bool)

(assert (=> b!305357 m!316315))

(declare-fun m!316317 () Bool)

(assert (=> b!305354 m!316317))

(declare-fun m!316319 () Bool)

(assert (=> start!30520 m!316319))

(declare-fun m!316321 () Bool)

(assert (=> start!30520 m!316321))

(declare-fun m!316323 () Bool)

(assert (=> b!305351 m!316323))

(declare-fun m!316325 () Bool)

(assert (=> b!305355 m!316325))

(assert (=> b!305355 m!316325))

(declare-fun m!316327 () Bool)

(assert (=> b!305355 m!316327))

(declare-fun m!316329 () Bool)

(assert (=> b!305352 m!316329))

(declare-fun m!316331 () Bool)

(assert (=> b!305352 m!316331))

(declare-fun m!316333 () Bool)

(assert (=> b!305356 m!316333))

(declare-fun m!316335 () Bool)

(assert (=> b!305353 m!316335))

(declare-fun m!316337 () Bool)

(assert (=> b!305353 m!316337))

(declare-fun m!316339 () Bool)

(assert (=> b!305349 m!316339))

(check-sat (not b!305351) (not b!305353) (not b!305352) (not b!305354) (not b!305355) (not start!30520) (not b!305357) (not b!305356))
(check-sat)
