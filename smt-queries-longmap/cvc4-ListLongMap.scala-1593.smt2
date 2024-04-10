; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30234 () Bool)

(assert start!30234)

(declare-fun b!302488 () Bool)

(declare-fun e!190678 () Bool)

(assert (=> b!302488 (= e!190678 false)))

(declare-datatypes ((SeekEntryResult!2398 0))(
  ( (MissingZero!2398 (index!11768 (_ BitVec 32))) (Found!2398 (index!11769 (_ BitVec 32))) (Intermediate!2398 (undefined!3210 Bool) (index!11770 (_ BitVec 32)) (x!30039 (_ BitVec 32))) (Undefined!2398) (MissingVacant!2398 (index!11771 (_ BitVec 32))) )
))
(declare-fun lt!150096 () SeekEntryResult!2398)

(declare-datatypes ((array!15340 0))(
  ( (array!15341 (arr!7258 (Array (_ BitVec 32) (_ BitVec 64))) (size!7610 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15340)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15340 (_ BitVec 32)) SeekEntryResult!2398)

(assert (=> b!302488 (= lt!150096 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!302489 () Bool)

(declare-fun res!159981 () Bool)

(assert (=> b!302489 (=> (not res!159981) (not e!190678))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15340 (_ BitVec 32)) SeekEntryResult!2398)

(assert (=> b!302489 (= res!159981 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2398 i!1240)))))

(declare-fun b!302490 () Bool)

(declare-fun res!159979 () Bool)

(assert (=> b!302490 (=> (not res!159979) (not e!190678))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302490 (= res!159979 (validKeyInArray!0 k!2441))))

(declare-fun b!302491 () Bool)

(declare-fun res!159976 () Bool)

(assert (=> b!302491 (=> (not res!159976) (not e!190678))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!302491 (= res!159976 (and (= (select (arr!7258 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7610 a!3293))))))

(declare-fun b!302492 () Bool)

(declare-fun res!159974 () Bool)

(assert (=> b!302492 (=> (not res!159974) (not e!190678))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15340 (_ BitVec 32)) Bool)

(assert (=> b!302492 (= res!159974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!302493 () Bool)

(declare-fun res!159980 () Bool)

(assert (=> b!302493 (=> (not res!159980) (not e!190678))))

(assert (=> b!302493 (= res!159980 (and (= (size!7610 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7610 a!3293))))))

(declare-fun res!159977 () Bool)

(assert (=> start!30234 (=> (not res!159977) (not e!190678))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30234 (= res!159977 (validMask!0 mask!3709))))

(assert (=> start!30234 e!190678))

(declare-fun array_inv!5221 (array!15340) Bool)

(assert (=> start!30234 (array_inv!5221 a!3293)))

(assert (=> start!30234 true))

(declare-fun b!302494 () Bool)

(declare-fun res!159975 () Bool)

(assert (=> b!302494 (=> (not res!159975) (not e!190678))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302494 (= res!159975 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2398 false resIndex!52 resX!52)))))

(declare-fun b!302495 () Bool)

(declare-fun res!159978 () Bool)

(assert (=> b!302495 (=> (not res!159978) (not e!190678))))

(declare-fun arrayContainsKey!0 (array!15340 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302495 (= res!159978 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30234 res!159977) b!302493))

(assert (= (and b!302493 res!159980) b!302490))

(assert (= (and b!302490 res!159979) b!302495))

(assert (= (and b!302495 res!159978) b!302489))

(assert (= (and b!302489 res!159981) b!302492))

(assert (= (and b!302492 res!159974) b!302494))

(assert (= (and b!302494 res!159975) b!302491))

(assert (= (and b!302491 res!159976) b!302488))

(declare-fun m!314007 () Bool)

(assert (=> b!302495 m!314007))

(declare-fun m!314009 () Bool)

(assert (=> b!302491 m!314009))

(declare-fun m!314011 () Bool)

(assert (=> b!302490 m!314011))

(declare-fun m!314013 () Bool)

(assert (=> b!302492 m!314013))

(declare-fun m!314015 () Bool)

(assert (=> b!302489 m!314015))

(declare-fun m!314017 () Bool)

(assert (=> start!30234 m!314017))

(declare-fun m!314019 () Bool)

(assert (=> start!30234 m!314019))

(declare-fun m!314021 () Bool)

(assert (=> b!302494 m!314021))

(assert (=> b!302494 m!314021))

(declare-fun m!314023 () Bool)

(assert (=> b!302494 m!314023))

(declare-fun m!314025 () Bool)

(assert (=> b!302488 m!314025))

(push 1)

(assert (not b!302492))

(assert (not b!302494))

(assert (not b!302495))

(assert (not b!302488))

(assert (not b!302490))

(assert (not start!30234))

(assert (not b!302489))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

