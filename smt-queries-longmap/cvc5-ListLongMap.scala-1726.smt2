; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31808 () Bool)

(assert start!31808)

(declare-fun b!317762 () Bool)

(declare-fun e!197527 () Bool)

(assert (=> b!317762 (= e!197527 (not true))))

(declare-fun e!197529 () Bool)

(assert (=> b!317762 e!197529))

(declare-fun res!172350 () Bool)

(assert (=> b!317762 (=> (not res!172350) (not e!197529))))

(declare-datatypes ((array!16179 0))(
  ( (array!16180 (arr!7655 (Array (_ BitVec 32) (_ BitVec 64))) (size!8007 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16179)

(declare-fun lt!155081 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2795 0))(
  ( (MissingZero!2795 (index!13356 (_ BitVec 32))) (Found!2795 (index!13357 (_ BitVec 32))) (Intermediate!2795 (undefined!3607 Bool) (index!13358 (_ BitVec 32)) (x!31620 (_ BitVec 32))) (Undefined!2795) (MissingVacant!2795 (index!13359 (_ BitVec 32))) )
))
(declare-fun lt!155080 () SeekEntryResult!2795)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16179 (_ BitVec 32)) SeekEntryResult!2795)

(assert (=> b!317762 (= res!172350 (= lt!155080 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155081 k!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317762 (= lt!155081 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!317763 () Bool)

(declare-fun e!197526 () Bool)

(assert (=> b!317763 (= e!197526 e!197527)))

(declare-fun res!172341 () Bool)

(assert (=> b!317763 (=> (not res!172341) (not e!197527))))

(declare-fun lt!155079 () SeekEntryResult!2795)

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!317763 (= res!172341 (and (= lt!155080 lt!155079) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7655 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!317763 (= lt!155080 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!317764 () Bool)

(declare-fun res!172347 () Bool)

(declare-fun e!197528 () Bool)

(assert (=> b!317764 (=> (not res!172347) (not e!197528))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!317764 (= res!172347 (and (= (size!8007 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8007 a!3293))))))

(declare-fun b!317765 () Bool)

(declare-fun res!172346 () Bool)

(assert (=> b!317765 (=> (not res!172346) (not e!197528))))

(declare-fun arrayContainsKey!0 (array!16179 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317765 (= res!172346 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!317766 () Bool)

(assert (=> b!317766 (= e!197528 e!197526)))

(declare-fun res!172344 () Bool)

(assert (=> b!317766 (=> (not res!172344) (not e!197526))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317766 (= res!172344 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!155079))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!317766 (= lt!155079 (Intermediate!2795 false resIndex!52 resX!52))))

(declare-fun b!317767 () Bool)

(declare-fun res!172349 () Bool)

(assert (=> b!317767 (=> (not res!172349) (not e!197528))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16179 (_ BitVec 32)) Bool)

(assert (=> b!317767 (= res!172349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!317768 () Bool)

(declare-fun res!172342 () Bool)

(assert (=> b!317768 (=> (not res!172342) (not e!197528))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16179 (_ BitVec 32)) SeekEntryResult!2795)

(assert (=> b!317768 (= res!172342 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2795 i!1240)))))

(declare-fun b!317769 () Bool)

(declare-fun res!172343 () Bool)

(assert (=> b!317769 (=> (not res!172343) (not e!197528))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317769 (= res!172343 (validKeyInArray!0 k!2441))))

(declare-fun b!317771 () Bool)

(declare-fun lt!155082 () array!16179)

(assert (=> b!317771 (= e!197529 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!155082 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155081 k!2441 lt!155082 mask!3709)))))

(assert (=> b!317771 (= lt!155082 (array!16180 (store (arr!7655 a!3293) i!1240 k!2441) (size!8007 a!3293)))))

(declare-fun b!317770 () Bool)

(declare-fun res!172348 () Bool)

(assert (=> b!317770 (=> (not res!172348) (not e!197526))))

(assert (=> b!317770 (= res!172348 (and (= (select (arr!7655 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8007 a!3293))))))

(declare-fun res!172345 () Bool)

(assert (=> start!31808 (=> (not res!172345) (not e!197528))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31808 (= res!172345 (validMask!0 mask!3709))))

(assert (=> start!31808 e!197528))

(declare-fun array_inv!5618 (array!16179) Bool)

(assert (=> start!31808 (array_inv!5618 a!3293)))

(assert (=> start!31808 true))

(assert (= (and start!31808 res!172345) b!317764))

(assert (= (and b!317764 res!172347) b!317769))

(assert (= (and b!317769 res!172343) b!317765))

(assert (= (and b!317765 res!172346) b!317768))

(assert (= (and b!317768 res!172342) b!317767))

(assert (= (and b!317767 res!172349) b!317766))

(assert (= (and b!317766 res!172344) b!317770))

(assert (= (and b!317770 res!172348) b!317763))

(assert (= (and b!317763 res!172341) b!317762))

(assert (= (and b!317762 res!172350) b!317771))

(declare-fun m!326417 () Bool)

(assert (=> b!317770 m!326417))

(declare-fun m!326419 () Bool)

(assert (=> start!31808 m!326419))

(declare-fun m!326421 () Bool)

(assert (=> start!31808 m!326421))

(declare-fun m!326423 () Bool)

(assert (=> b!317769 m!326423))

(declare-fun m!326425 () Bool)

(assert (=> b!317766 m!326425))

(assert (=> b!317766 m!326425))

(declare-fun m!326427 () Bool)

(assert (=> b!317766 m!326427))

(declare-fun m!326429 () Bool)

(assert (=> b!317767 m!326429))

(declare-fun m!326431 () Bool)

(assert (=> b!317771 m!326431))

(declare-fun m!326433 () Bool)

(assert (=> b!317771 m!326433))

(declare-fun m!326435 () Bool)

(assert (=> b!317771 m!326435))

(declare-fun m!326437 () Bool)

(assert (=> b!317763 m!326437))

(declare-fun m!326439 () Bool)

(assert (=> b!317763 m!326439))

(declare-fun m!326441 () Bool)

(assert (=> b!317762 m!326441))

(declare-fun m!326443 () Bool)

(assert (=> b!317762 m!326443))

(declare-fun m!326445 () Bool)

(assert (=> b!317768 m!326445))

(declare-fun m!326447 () Bool)

(assert (=> b!317765 m!326447))

(push 1)

