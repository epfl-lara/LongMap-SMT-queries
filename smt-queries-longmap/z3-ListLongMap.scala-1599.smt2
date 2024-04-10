; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30268 () Bool)

(assert start!30268)

(declare-fun b!302923 () Bool)

(declare-fun res!160414 () Bool)

(declare-fun e!190807 () Bool)

(assert (=> b!302923 (=> (not res!160414) (not e!190807))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302923 (= res!160414 (validKeyInArray!0 k0!2441))))

(declare-fun b!302924 () Bool)

(assert (=> b!302924 (= e!190807 false)))

(declare-datatypes ((array!15374 0))(
  ( (array!15375 (arr!7275 (Array (_ BitVec 32) (_ BitVec 64))) (size!7627 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15374)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2415 0))(
  ( (MissingZero!2415 (index!11836 (_ BitVec 32))) (Found!2415 (index!11837 (_ BitVec 32))) (Intermediate!2415 (undefined!3227 Bool) (index!11838 (_ BitVec 32)) (x!30104 (_ BitVec 32))) (Undefined!2415) (MissingVacant!2415 (index!11839 (_ BitVec 32))) )
))
(declare-fun lt!150147 () SeekEntryResult!2415)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15374 (_ BitVec 32)) SeekEntryResult!2415)

(assert (=> b!302924 (= lt!150147 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!302925 () Bool)

(declare-fun res!160416 () Bool)

(assert (=> b!302925 (=> (not res!160416) (not e!190807))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15374 (_ BitVec 32)) Bool)

(assert (=> b!302925 (= res!160416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!302926 () Bool)

(declare-fun res!160413 () Bool)

(assert (=> b!302926 (=> (not res!160413) (not e!190807))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!302926 (= res!160413 (and (= (select (arr!7275 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7627 a!3293))))))

(declare-fun b!302927 () Bool)

(declare-fun res!160412 () Bool)

(assert (=> b!302927 (=> (not res!160412) (not e!190807))))

(assert (=> b!302927 (= res!160412 (and (= (size!7627 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7627 a!3293))))))

(declare-fun res!160411 () Bool)

(assert (=> start!30268 (=> (not res!160411) (not e!190807))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30268 (= res!160411 (validMask!0 mask!3709))))

(assert (=> start!30268 e!190807))

(declare-fun array_inv!5238 (array!15374) Bool)

(assert (=> start!30268 (array_inv!5238 a!3293)))

(assert (=> start!30268 true))

(declare-fun b!302928 () Bool)

(declare-fun res!160415 () Bool)

(assert (=> b!302928 (=> (not res!160415) (not e!190807))))

(declare-fun arrayContainsKey!0 (array!15374 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302928 (= res!160415 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302929 () Bool)

(declare-fun res!160410 () Bool)

(assert (=> b!302929 (=> (not res!160410) (not e!190807))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302929 (= res!160410 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) (Intermediate!2415 false resIndex!52 resX!52)))))

(declare-fun b!302930 () Bool)

(declare-fun res!160409 () Bool)

(assert (=> b!302930 (=> (not res!160409) (not e!190807))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15374 (_ BitVec 32)) SeekEntryResult!2415)

(assert (=> b!302930 (= res!160409 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2415 i!1240)))))

(assert (= (and start!30268 res!160411) b!302927))

(assert (= (and b!302927 res!160412) b!302923))

(assert (= (and b!302923 res!160414) b!302928))

(assert (= (and b!302928 res!160415) b!302930))

(assert (= (and b!302930 res!160409) b!302925))

(assert (= (and b!302925 res!160416) b!302929))

(assert (= (and b!302929 res!160410) b!302926))

(assert (= (and b!302926 res!160413) b!302924))

(declare-fun m!314365 () Bool)

(assert (=> b!302930 m!314365))

(declare-fun m!314367 () Bool)

(assert (=> b!302926 m!314367))

(declare-fun m!314369 () Bool)

(assert (=> b!302928 m!314369))

(declare-fun m!314371 () Bool)

(assert (=> b!302929 m!314371))

(assert (=> b!302929 m!314371))

(declare-fun m!314373 () Bool)

(assert (=> b!302929 m!314373))

(declare-fun m!314375 () Bool)

(assert (=> b!302924 m!314375))

(declare-fun m!314377 () Bool)

(assert (=> b!302925 m!314377))

(declare-fun m!314379 () Bool)

(assert (=> start!30268 m!314379))

(declare-fun m!314381 () Bool)

(assert (=> start!30268 m!314381))

(declare-fun m!314383 () Bool)

(assert (=> b!302923 m!314383))

(check-sat (not start!30268) (not b!302923) (not b!302929) (not b!302924) (not b!302930) (not b!302925) (not b!302928))
