; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30634 () Bool)

(assert start!30634)

(declare-fun b!307405 () Bool)

(declare-fun res!164165 () Bool)

(declare-fun e!192498 () Bool)

(assert (=> b!307405 (=> (not res!164165) (not e!192498))))

(declare-datatypes ((array!15638 0))(
  ( (array!15639 (arr!7404 (Array (_ BitVec 32) (_ BitVec 64))) (size!7756 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15638)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15638 (_ BitVec 32)) Bool)

(assert (=> b!307405 (= res!164165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307406 () Bool)

(declare-fun res!164160 () Bool)

(assert (=> b!307406 (=> (not res!164160) (not e!192498))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2544 0))(
  ( (MissingZero!2544 (index!12352 (_ BitVec 32))) (Found!2544 (index!12353 (_ BitVec 32))) (Intermediate!2544 (undefined!3356 Bool) (index!12354 (_ BitVec 32)) (x!30595 (_ BitVec 32))) (Undefined!2544) (MissingVacant!2544 (index!12355 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15638 (_ BitVec 32)) SeekEntryResult!2544)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307406 (= res!164160 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) (Intermediate!2544 false resIndex!52 resX!52)))))

(declare-fun b!307407 () Bool)

(declare-fun res!164163 () Bool)

(assert (=> b!307407 (=> (not res!164163) (not e!192498))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!307407 (= res!164163 (and (= (select (arr!7404 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7756 a!3293))))))

(declare-fun b!307408 () Bool)

(assert (=> b!307408 (= e!192498 false)))

(declare-fun lt!151128 () SeekEntryResult!2544)

(assert (=> b!307408 (= lt!151128 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!307410 () Bool)

(declare-fun res!164159 () Bool)

(assert (=> b!307410 (=> (not res!164159) (not e!192498))))

(assert (=> b!307410 (= res!164159 (and (= (size!7756 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7756 a!3293))))))

(declare-fun b!307411 () Bool)

(declare-fun res!164162 () Bool)

(assert (=> b!307411 (=> (not res!164162) (not e!192498))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307411 (= res!164162 (validKeyInArray!0 k0!2441))))

(declare-fun b!307412 () Bool)

(declare-fun res!164166 () Bool)

(assert (=> b!307412 (=> (not res!164166) (not e!192498))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15638 (_ BitVec 32)) SeekEntryResult!2544)

(assert (=> b!307412 (= res!164166 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2544 i!1240)))))

(declare-fun res!164161 () Bool)

(assert (=> start!30634 (=> (not res!164161) (not e!192498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30634 (= res!164161 (validMask!0 mask!3709))))

(assert (=> start!30634 e!192498))

(declare-fun array_inv!5367 (array!15638) Bool)

(assert (=> start!30634 (array_inv!5367 a!3293)))

(assert (=> start!30634 true))

(declare-fun b!307409 () Bool)

(declare-fun res!164164 () Bool)

(assert (=> b!307409 (=> (not res!164164) (not e!192498))))

(declare-fun arrayContainsKey!0 (array!15638 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307409 (= res!164164 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30634 res!164161) b!307410))

(assert (= (and b!307410 res!164159) b!307411))

(assert (= (and b!307411 res!164162) b!307409))

(assert (= (and b!307409 res!164164) b!307412))

(assert (= (and b!307412 res!164166) b!307405))

(assert (= (and b!307405 res!164165) b!307406))

(assert (= (and b!307406 res!164160) b!307407))

(assert (= (and b!307407 res!164163) b!307408))

(declare-fun m!317719 () Bool)

(assert (=> b!307412 m!317719))

(declare-fun m!317721 () Bool)

(assert (=> b!307409 m!317721))

(declare-fun m!317723 () Bool)

(assert (=> b!307406 m!317723))

(assert (=> b!307406 m!317723))

(declare-fun m!317725 () Bool)

(assert (=> b!307406 m!317725))

(declare-fun m!317727 () Bool)

(assert (=> b!307411 m!317727))

(declare-fun m!317729 () Bool)

(assert (=> b!307408 m!317729))

(declare-fun m!317731 () Bool)

(assert (=> start!30634 m!317731))

(declare-fun m!317733 () Bool)

(assert (=> start!30634 m!317733))

(declare-fun m!317735 () Bool)

(assert (=> b!307407 m!317735))

(declare-fun m!317737 () Bool)

(assert (=> b!307405 m!317737))

(check-sat (not b!307411) (not b!307406) (not start!30634) (not b!307405) (not b!307412) (not b!307408) (not b!307409))
