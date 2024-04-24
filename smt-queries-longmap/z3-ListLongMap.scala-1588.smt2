; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30138 () Bool)

(assert start!30138)

(declare-fun res!159562 () Bool)

(declare-fun e!190425 () Bool)

(assert (=> start!30138 (=> (not res!159562) (not e!190425))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30138 (= res!159562 (validMask!0 mask!3709))))

(assert (=> start!30138 e!190425))

(declare-datatypes ((array!15302 0))(
  ( (array!15303 (arr!7240 (Array (_ BitVec 32) (_ BitVec 64))) (size!7592 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15302)

(declare-fun array_inv!5190 (array!15302) Bool)

(assert (=> start!30138 (array_inv!5190 a!3293)))

(assert (=> start!30138 true))

(declare-fun b!301899 () Bool)

(declare-fun res!159563 () Bool)

(assert (=> b!301899 (=> (not res!159563) (not e!190425))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15302 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301899 (= res!159563 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301900 () Bool)

(declare-fun res!159558 () Bool)

(assert (=> b!301900 (=> (not res!159558) (not e!190425))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15302 (_ BitVec 32)) Bool)

(assert (=> b!301900 (= res!159558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun b!301901 () Bool)

(assert (=> b!301901 (= e!190425 (and (= (select (arr!7240 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7592 a!3293)) (bvslt mask!3709 #b00000000000000000000000000000000)))))

(declare-fun b!301902 () Bool)

(declare-fun res!159560 () Bool)

(assert (=> b!301902 (=> (not res!159560) (not e!190425))))

(declare-datatypes ((SeekEntryResult!2345 0))(
  ( (MissingZero!2345 (index!11556 (_ BitVec 32))) (Found!2345 (index!11557 (_ BitVec 32))) (Intermediate!2345 (undefined!3157 Bool) (index!11558 (_ BitVec 32)) (x!29937 (_ BitVec 32))) (Undefined!2345) (MissingVacant!2345 (index!11559 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15302 (_ BitVec 32)) SeekEntryResult!2345)

(assert (=> b!301902 (= res!159560 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2345 i!1240)))))

(declare-fun b!301903 () Bool)

(declare-fun res!159564 () Bool)

(assert (=> b!301903 (=> (not res!159564) (not e!190425))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301903 (= res!159564 (validKeyInArray!0 k0!2441))))

(declare-fun b!301904 () Bool)

(declare-fun res!159559 () Bool)

(assert (=> b!301904 (=> (not res!159559) (not e!190425))))

(assert (=> b!301904 (= res!159559 (and (= (size!7592 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7592 a!3293))))))

(declare-fun b!301905 () Bool)

(declare-fun res!159561 () Bool)

(assert (=> b!301905 (=> (not res!159561) (not e!190425))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15302 (_ BitVec 32)) SeekEntryResult!2345)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301905 (= res!159561 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) (Intermediate!2345 false resIndex!52 resX!52)))))

(assert (= (and start!30138 res!159562) b!301904))

(assert (= (and b!301904 res!159559) b!301903))

(assert (= (and b!301903 res!159564) b!301899))

(assert (= (and b!301899 res!159563) b!301902))

(assert (= (and b!301902 res!159560) b!301900))

(assert (= (and b!301900 res!159558) b!301905))

(assert (= (and b!301905 res!159561) b!301901))

(declare-fun m!313723 () Bool)

(assert (=> b!301900 m!313723))

(declare-fun m!313725 () Bool)

(assert (=> b!301899 m!313725))

(declare-fun m!313727 () Bool)

(assert (=> b!301901 m!313727))

(declare-fun m!313729 () Bool)

(assert (=> b!301902 m!313729))

(declare-fun m!313731 () Bool)

(assert (=> b!301903 m!313731))

(declare-fun m!313733 () Bool)

(assert (=> start!30138 m!313733))

(declare-fun m!313735 () Bool)

(assert (=> start!30138 m!313735))

(declare-fun m!313737 () Bool)

(assert (=> b!301905 m!313737))

(assert (=> b!301905 m!313737))

(declare-fun m!313739 () Bool)

(assert (=> b!301905 m!313739))

(check-sat (not b!301902) (not start!30138) (not b!301905) (not b!301903) (not b!301899) (not b!301900))
(check-sat)
