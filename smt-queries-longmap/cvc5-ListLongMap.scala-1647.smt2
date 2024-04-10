; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30662 () Bool)

(assert start!30662)

(declare-fun b!307772 () Bool)

(declare-fun e!192611 () Bool)

(assert (=> b!307772 (= e!192611 false)))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun lt!151173 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307772 (= lt!151173 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!307773 () Bool)

(declare-fun res!164532 () Bool)

(declare-fun e!192613 () Bool)

(assert (=> b!307773 (=> (not res!164532) (not e!192613))))

(declare-datatypes ((array!15666 0))(
  ( (array!15667 (arr!7418 (Array (_ BitVec 32) (_ BitVec 64))) (size!7770 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15666)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15666 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307773 (= res!164532 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!307774 () Bool)

(assert (=> b!307774 (= e!192613 e!192611)))

(declare-fun res!164530 () Bool)

(assert (=> b!307774 (=> (not res!164530) (not e!192611))))

(declare-datatypes ((SeekEntryResult!2558 0))(
  ( (MissingZero!2558 (index!12408 (_ BitVec 32))) (Found!2558 (index!12409 (_ BitVec 32))) (Intermediate!2558 (undefined!3370 Bool) (index!12410 (_ BitVec 32)) (x!30649 (_ BitVec 32))) (Undefined!2558) (MissingVacant!2558 (index!12411 (_ BitVec 32))) )
))
(declare-fun lt!151172 () SeekEntryResult!2558)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15666 (_ BitVec 32)) SeekEntryResult!2558)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307774 (= res!164530 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151172))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!307774 (= lt!151172 (Intermediate!2558 false resIndex!52 resX!52))))

(declare-fun b!307775 () Bool)

(declare-fun res!164528 () Bool)

(assert (=> b!307775 (=> (not res!164528) (not e!192611))))

(assert (=> b!307775 (= res!164528 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!151172))))

(declare-fun b!307776 () Bool)

(declare-fun res!164527 () Bool)

(assert (=> b!307776 (=> (not res!164527) (not e!192613))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!307776 (= res!164527 (and (= (size!7770 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7770 a!3293))))))

(declare-fun b!307777 () Bool)

(declare-fun res!164534 () Bool)

(assert (=> b!307777 (=> (not res!164534) (not e!192613))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307777 (= res!164534 (validKeyInArray!0 k!2441))))

(declare-fun b!307778 () Bool)

(declare-fun res!164535 () Bool)

(assert (=> b!307778 (=> (not res!164535) (not e!192613))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15666 (_ BitVec 32)) Bool)

(assert (=> b!307778 (= res!164535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307779 () Bool)

(declare-fun res!164529 () Bool)

(assert (=> b!307779 (=> (not res!164529) (not e!192613))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15666 (_ BitVec 32)) SeekEntryResult!2558)

(assert (=> b!307779 (= res!164529 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2558 i!1240)))))

(declare-fun res!164533 () Bool)

(assert (=> start!30662 (=> (not res!164533) (not e!192613))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30662 (= res!164533 (validMask!0 mask!3709))))

(assert (=> start!30662 e!192613))

(declare-fun array_inv!5381 (array!15666) Bool)

(assert (=> start!30662 (array_inv!5381 a!3293)))

(assert (=> start!30662 true))

(declare-fun b!307780 () Bool)

(declare-fun res!164531 () Bool)

(assert (=> b!307780 (=> (not res!164531) (not e!192611))))

(assert (=> b!307780 (= res!164531 (and (= (select (arr!7418 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7770 a!3293))))))

(declare-fun b!307781 () Bool)

(declare-fun res!164526 () Bool)

(assert (=> b!307781 (=> (not res!164526) (not e!192611))))

(assert (=> b!307781 (= res!164526 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7418 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (= (and start!30662 res!164533) b!307776))

(assert (= (and b!307776 res!164527) b!307777))

(assert (= (and b!307777 res!164534) b!307773))

(assert (= (and b!307773 res!164532) b!307779))

(assert (= (and b!307779 res!164529) b!307778))

(assert (= (and b!307778 res!164535) b!307774))

(assert (= (and b!307774 res!164530) b!307780))

(assert (= (and b!307780 res!164531) b!307775))

(assert (= (and b!307775 res!164528) b!307781))

(assert (= (and b!307781 res!164526) b!307772))

(declare-fun m!318017 () Bool)

(assert (=> b!307779 m!318017))

(declare-fun m!318019 () Bool)

(assert (=> b!307772 m!318019))

(declare-fun m!318021 () Bool)

(assert (=> start!30662 m!318021))

(declare-fun m!318023 () Bool)

(assert (=> start!30662 m!318023))

(declare-fun m!318025 () Bool)

(assert (=> b!307777 m!318025))

(declare-fun m!318027 () Bool)

(assert (=> b!307775 m!318027))

(declare-fun m!318029 () Bool)

(assert (=> b!307773 m!318029))

(declare-fun m!318031 () Bool)

(assert (=> b!307780 m!318031))

(declare-fun m!318033 () Bool)

(assert (=> b!307781 m!318033))

(declare-fun m!318035 () Bool)

(assert (=> b!307778 m!318035))

(declare-fun m!318037 () Bool)

(assert (=> b!307774 m!318037))

(assert (=> b!307774 m!318037))

(declare-fun m!318039 () Bool)

(assert (=> b!307774 m!318039))

(push 1)

