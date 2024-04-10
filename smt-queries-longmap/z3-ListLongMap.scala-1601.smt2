; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30280 () Bool)

(assert start!30280)

(declare-fun b!303076 () Bool)

(declare-fun res!160563 () Bool)

(declare-fun e!190851 () Bool)

(assert (=> b!303076 (=> (not res!160563) (not e!190851))))

(declare-datatypes ((array!15386 0))(
  ( (array!15387 (arr!7281 (Array (_ BitVec 32) (_ BitVec 64))) (size!7633 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15386)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2421 0))(
  ( (MissingZero!2421 (index!11860 (_ BitVec 32))) (Found!2421 (index!11861 (_ BitVec 32))) (Intermediate!2421 (undefined!3233 Bool) (index!11862 (_ BitVec 32)) (x!30126 (_ BitVec 32))) (Undefined!2421) (MissingVacant!2421 (index!11863 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15386 (_ BitVec 32)) SeekEntryResult!2421)

(assert (=> b!303076 (= res!160563 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2421 i!1240)))))

(declare-fun b!303077 () Bool)

(declare-fun res!160566 () Bool)

(assert (=> b!303077 (=> (not res!160566) (not e!190851))))

(declare-fun arrayContainsKey!0 (array!15386 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303077 (= res!160566 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303078 () Bool)

(declare-fun res!160568 () Bool)

(assert (=> b!303078 (=> (not res!160568) (not e!190851))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15386 (_ BitVec 32)) SeekEntryResult!2421)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303078 (= res!160568 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) (Intermediate!2421 false resIndex!52 resX!52)))))

(declare-fun b!303079 () Bool)

(declare-fun res!160569 () Bool)

(assert (=> b!303079 (=> (not res!160569) (not e!190851))))

(assert (=> b!303079 (= res!160569 (and (= (size!7633 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7633 a!3293))))))

(declare-fun b!303080 () Bool)

(assert (=> b!303080 (= e!190851 false)))

(declare-fun lt!150165 () SeekEntryResult!2421)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!303080 (= lt!150165 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!303081 () Bool)

(declare-fun res!160565 () Bool)

(assert (=> b!303081 (=> (not res!160565) (not e!190851))))

(assert (=> b!303081 (= res!160565 (and (= (select (arr!7281 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7633 a!3293))))))

(declare-fun b!303082 () Bool)

(declare-fun res!160562 () Bool)

(assert (=> b!303082 (=> (not res!160562) (not e!190851))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15386 (_ BitVec 32)) Bool)

(assert (=> b!303082 (= res!160562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303083 () Bool)

(declare-fun res!160567 () Bool)

(assert (=> b!303083 (=> (not res!160567) (not e!190851))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303083 (= res!160567 (validKeyInArray!0 k0!2441))))

(declare-fun res!160564 () Bool)

(assert (=> start!30280 (=> (not res!160564) (not e!190851))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30280 (= res!160564 (validMask!0 mask!3709))))

(assert (=> start!30280 e!190851))

(declare-fun array_inv!5244 (array!15386) Bool)

(assert (=> start!30280 (array_inv!5244 a!3293)))

(assert (=> start!30280 true))

(assert (= (and start!30280 res!160564) b!303079))

(assert (= (and b!303079 res!160569) b!303083))

(assert (= (and b!303083 res!160567) b!303077))

(assert (= (and b!303077 res!160566) b!303076))

(assert (= (and b!303076 res!160563) b!303082))

(assert (= (and b!303082 res!160562) b!303078))

(assert (= (and b!303078 res!160568) b!303081))

(assert (= (and b!303081 res!160565) b!303080))

(declare-fun m!314491 () Bool)

(assert (=> b!303076 m!314491))

(declare-fun m!314493 () Bool)

(assert (=> b!303077 m!314493))

(declare-fun m!314495 () Bool)

(assert (=> b!303080 m!314495))

(declare-fun m!314497 () Bool)

(assert (=> b!303083 m!314497))

(declare-fun m!314499 () Bool)

(assert (=> start!30280 m!314499))

(declare-fun m!314501 () Bool)

(assert (=> start!30280 m!314501))

(declare-fun m!314503 () Bool)

(assert (=> b!303081 m!314503))

(declare-fun m!314505 () Bool)

(assert (=> b!303082 m!314505))

(declare-fun m!314507 () Bool)

(assert (=> b!303078 m!314507))

(assert (=> b!303078 m!314507))

(declare-fun m!314509 () Bool)

(assert (=> b!303078 m!314509))

(check-sat (not b!303078) (not b!303083) (not b!303076) (not start!30280) (not b!303080) (not b!303082) (not b!303077))
