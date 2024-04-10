; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31000 () Bool)

(assert start!31000)

(declare-fun b!311537 () Bool)

(declare-fun res!167992 () Bool)

(declare-fun e!194367 () Bool)

(assert (=> b!311537 (=> (not res!167992) (not e!194367))))

(declare-datatypes ((array!15902 0))(
  ( (array!15903 (arr!7533 (Array (_ BitVec 32) (_ BitVec 64))) (size!7885 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15902)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2673 0))(
  ( (MissingZero!2673 (index!12868 (_ BitVec 32))) (Found!2673 (index!12869 (_ BitVec 32))) (Intermediate!2673 (undefined!3485 Bool) (index!12870 (_ BitVec 32)) (x!31086 (_ BitVec 32))) (Undefined!2673) (MissingVacant!2673 (index!12871 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15902 (_ BitVec 32)) SeekEntryResult!2673)

(assert (=> b!311537 (= res!167992 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2673 i!1240)))))

(declare-fun b!311538 () Bool)

(declare-fun e!194371 () Bool)

(declare-fun e!194369 () Bool)

(assert (=> b!311538 (= e!194371 e!194369)))

(declare-fun res!167993 () Bool)

(assert (=> b!311538 (=> (not res!167993) (not e!194369))))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun lt!152396 () SeekEntryResult!2673)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun lt!152397 () SeekEntryResult!2673)

(assert (=> b!311538 (= res!167993 (and (= lt!152397 lt!152396) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7533 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15902 (_ BitVec 32)) SeekEntryResult!2673)

(assert (=> b!311538 (= lt!152397 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!311539 () Bool)

(declare-fun res!167991 () Bool)

(assert (=> b!311539 (=> (not res!167991) (not e!194367))))

(declare-fun arrayContainsKey!0 (array!15902 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311539 (= res!167991 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311540 () Bool)

(assert (=> b!311540 (= e!194369 (not true))))

(declare-fun e!194370 () Bool)

(assert (=> b!311540 e!194370))

(declare-fun res!167994 () Bool)

(assert (=> b!311540 (=> (not res!167994) (not e!194370))))

(declare-fun lt!152395 () (_ BitVec 32))

(assert (=> b!311540 (= res!167994 (= lt!152397 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152395 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311540 (= lt!152395 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!311541 () Bool)

(assert (=> b!311541 (= e!194367 e!194371)))

(declare-fun res!167995 () Bool)

(assert (=> b!311541 (=> (not res!167995) (not e!194371))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311541 (= res!167995 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152396))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!311541 (= lt!152396 (Intermediate!2673 false resIndex!52 resX!52))))

(declare-fun res!167999 () Bool)

(assert (=> start!31000 (=> (not res!167999) (not e!194367))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31000 (= res!167999 (validMask!0 mask!3709))))

(assert (=> start!31000 e!194367))

(declare-fun array_inv!5496 (array!15902) Bool)

(assert (=> start!31000 (array_inv!5496 a!3293)))

(assert (=> start!31000 true))

(declare-fun b!311542 () Bool)

(declare-fun res!167997 () Bool)

(assert (=> b!311542 (=> (not res!167997) (not e!194367))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15902 (_ BitVec 32)) Bool)

(assert (=> b!311542 (= res!167997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311543 () Bool)

(declare-fun res!167998 () Bool)

(assert (=> b!311543 (=> (not res!167998) (not e!194371))))

(assert (=> b!311543 (= res!167998 (and (= (select (arr!7533 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7885 a!3293))))))

(declare-fun b!311544 () Bool)

(declare-fun res!167996 () Bool)

(assert (=> b!311544 (=> (not res!167996) (not e!194367))))

(assert (=> b!311544 (= res!167996 (and (= (size!7885 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7885 a!3293))))))

(declare-fun b!311545 () Bool)

(declare-fun res!168000 () Bool)

(assert (=> b!311545 (=> (not res!168000) (not e!194367))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311545 (= res!168000 (validKeyInArray!0 k0!2441))))

(declare-fun lt!152394 () array!15902)

(declare-fun b!311546 () Bool)

(assert (=> b!311546 (= e!194370 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152394 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152395 k0!2441 lt!152394 mask!3709)))))

(assert (=> b!311546 (= lt!152394 (array!15903 (store (arr!7533 a!3293) i!1240 k0!2441) (size!7885 a!3293)))))

(assert (= (and start!31000 res!167999) b!311544))

(assert (= (and b!311544 res!167996) b!311545))

(assert (= (and b!311545 res!168000) b!311539))

(assert (= (and b!311539 res!167991) b!311537))

(assert (= (and b!311537 res!167992) b!311542))

(assert (= (and b!311542 res!167997) b!311541))

(assert (= (and b!311541 res!167995) b!311543))

(assert (= (and b!311543 res!167998) b!311538))

(assert (= (and b!311538 res!167993) b!311540))

(assert (= (and b!311540 res!167994) b!311546))

(declare-fun m!321517 () Bool)

(assert (=> b!311540 m!321517))

(declare-fun m!321519 () Bool)

(assert (=> b!311540 m!321519))

(declare-fun m!321521 () Bool)

(assert (=> b!311546 m!321521))

(declare-fun m!321523 () Bool)

(assert (=> b!311546 m!321523))

(declare-fun m!321525 () Bool)

(assert (=> b!311546 m!321525))

(declare-fun m!321527 () Bool)

(assert (=> start!31000 m!321527))

(declare-fun m!321529 () Bool)

(assert (=> start!31000 m!321529))

(declare-fun m!321531 () Bool)

(assert (=> b!311541 m!321531))

(assert (=> b!311541 m!321531))

(declare-fun m!321533 () Bool)

(assert (=> b!311541 m!321533))

(declare-fun m!321535 () Bool)

(assert (=> b!311543 m!321535))

(declare-fun m!321537 () Bool)

(assert (=> b!311545 m!321537))

(declare-fun m!321539 () Bool)

(assert (=> b!311537 m!321539))

(declare-fun m!321541 () Bool)

(assert (=> b!311538 m!321541))

(declare-fun m!321543 () Bool)

(assert (=> b!311538 m!321543))

(declare-fun m!321545 () Bool)

(assert (=> b!311539 m!321545))

(declare-fun m!321547 () Bool)

(assert (=> b!311542 m!321547))

(check-sat (not b!311546) (not b!311545) (not b!311541) (not start!31000) (not b!311537) (not b!311542) (not b!311539) (not b!311540) (not b!311538))
(check-sat)
