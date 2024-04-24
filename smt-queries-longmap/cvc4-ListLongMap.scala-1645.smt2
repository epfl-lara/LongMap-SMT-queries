; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30638 () Bool)

(assert start!30638)

(declare-fun b!307582 () Bool)

(declare-fun res!164393 () Bool)

(declare-fun e!192532 () Bool)

(assert (=> b!307582 (=> (not res!164393) (not e!192532))))

(declare-datatypes ((array!15655 0))(
  ( (array!15656 (arr!7412 (Array (_ BitVec 32) (_ BitVec 64))) (size!7764 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15655)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!307582 (= res!164393 (and (= (size!7764 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7764 a!3293))))))

(declare-fun b!307583 () Bool)

(declare-fun res!164388 () Bool)

(declare-fun e!192534 () Bool)

(assert (=> b!307583 (=> (not res!164388) (not e!192534))))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!307583 (= res!164388 (and (= (select (arr!7412 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7764 a!3293))))))

(declare-fun b!307584 () Bool)

(assert (=> b!307584 (= e!192532 e!192534)))

(declare-fun res!164391 () Bool)

(assert (=> b!307584 (=> (not res!164391) (not e!192534))))

(declare-datatypes ((SeekEntryResult!2517 0))(
  ( (MissingZero!2517 (index!12244 (_ BitVec 32))) (Found!2517 (index!12245 (_ BitVec 32))) (Intermediate!2517 (undefined!3329 Bool) (index!12246 (_ BitVec 32)) (x!30589 (_ BitVec 32))) (Undefined!2517) (MissingVacant!2517 (index!12247 (_ BitVec 32))) )
))
(declare-fun lt!151173 () SeekEntryResult!2517)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15655 (_ BitVec 32)) SeekEntryResult!2517)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307584 (= res!164391 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151173))))

(assert (=> b!307584 (= lt!151173 (Intermediate!2517 false resIndex!52 resX!52))))

(declare-fun res!164392 () Bool)

(assert (=> start!30638 (=> (not res!164392) (not e!192532))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30638 (= res!164392 (validMask!0 mask!3709))))

(assert (=> start!30638 e!192532))

(declare-fun array_inv!5362 (array!15655) Bool)

(assert (=> start!30638 (array_inv!5362 a!3293)))

(assert (=> start!30638 true))

(declare-fun b!307585 () Bool)

(declare-fun res!164390 () Bool)

(assert (=> b!307585 (=> (not res!164390) (not e!192532))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15655 (_ BitVec 32)) SeekEntryResult!2517)

(assert (=> b!307585 (= res!164390 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2517 i!1240)))))

(declare-fun b!307586 () Bool)

(declare-fun res!164394 () Bool)

(assert (=> b!307586 (=> (not res!164394) (not e!192532))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15655 (_ BitVec 32)) Bool)

(assert (=> b!307586 (= res!164394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307587 () Bool)

(declare-fun res!164387 () Bool)

(assert (=> b!307587 (=> (not res!164387) (not e!192532))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307587 (= res!164387 (validKeyInArray!0 k!2441))))

(declare-fun b!307588 () Bool)

(assert (=> b!307588 (= e!192534 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7412 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(declare-fun b!307589 () Bool)

(declare-fun res!164386 () Bool)

(assert (=> b!307589 (=> (not res!164386) (not e!192534))))

(assert (=> b!307589 (= res!164386 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!151173))))

(declare-fun b!307590 () Bool)

(declare-fun res!164389 () Bool)

(assert (=> b!307590 (=> (not res!164389) (not e!192532))))

(declare-fun arrayContainsKey!0 (array!15655 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307590 (= res!164389 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30638 res!164392) b!307582))

(assert (= (and b!307582 res!164393) b!307587))

(assert (= (and b!307587 res!164387) b!307590))

(assert (= (and b!307590 res!164389) b!307585))

(assert (= (and b!307585 res!164390) b!307586))

(assert (= (and b!307586 res!164394) b!307584))

(assert (= (and b!307584 res!164391) b!307583))

(assert (= (and b!307583 res!164388) b!307589))

(assert (= (and b!307589 res!164386) b!307588))

(declare-fun m!318029 () Bool)

(assert (=> start!30638 m!318029))

(declare-fun m!318031 () Bool)

(assert (=> start!30638 m!318031))

(declare-fun m!318033 () Bool)

(assert (=> b!307587 m!318033))

(declare-fun m!318035 () Bool)

(assert (=> b!307586 m!318035))

(declare-fun m!318037 () Bool)

(assert (=> b!307588 m!318037))

(declare-fun m!318039 () Bool)

(assert (=> b!307589 m!318039))

(declare-fun m!318041 () Bool)

(assert (=> b!307583 m!318041))

(declare-fun m!318043 () Bool)

(assert (=> b!307584 m!318043))

(assert (=> b!307584 m!318043))

(declare-fun m!318045 () Bool)

(assert (=> b!307584 m!318045))

(declare-fun m!318047 () Bool)

(assert (=> b!307590 m!318047))

(declare-fun m!318049 () Bool)

(assert (=> b!307585 m!318049))

(push 1)

(assert (not b!307584))

(assert (not b!307586))

(assert (not b!307587))

(assert (not b!307589))

(assert (not start!30638))

(assert (not b!307585))

(assert (not b!307590))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

