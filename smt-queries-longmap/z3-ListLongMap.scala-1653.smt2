; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30754 () Bool)

(assert start!30754)

(declare-fun res!165174 () Bool)

(declare-fun e!192921 () Bool)

(assert (=> start!30754 (=> (not res!165174) (not e!192921))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30754 (= res!165174 (validMask!0 mask!3709))))

(assert (=> start!30754 e!192921))

(declare-datatypes ((array!15707 0))(
  ( (array!15708 (arr!7437 (Array (_ BitVec 32) (_ BitVec 64))) (size!7789 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15707)

(declare-fun array_inv!5400 (array!15707) Bool)

(assert (=> start!30754 (array_inv!5400 a!3293)))

(assert (=> start!30754 true))

(declare-fun b!308553 () Bool)

(declare-fun res!165172 () Bool)

(assert (=> b!308553 (=> (not res!165172) (not e!192921))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2577 0))(
  ( (MissingZero!2577 (index!12484 (_ BitVec 32))) (Found!2577 (index!12485 (_ BitVec 32))) (Intermediate!2577 (undefined!3389 Bool) (index!12486 (_ BitVec 32)) (x!30725 (_ BitVec 32))) (Undefined!2577) (MissingVacant!2577 (index!12487 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15707 (_ BitVec 32)) SeekEntryResult!2577)

(assert (=> b!308553 (= res!165172 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2577 i!1240)))))

(declare-fun b!308554 () Bool)

(declare-fun res!165166 () Bool)

(assert (=> b!308554 (=> (not res!165166) (not e!192921))))

(declare-fun arrayContainsKey!0 (array!15707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308554 (= res!165166 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!308555 () Bool)

(declare-fun res!165168 () Bool)

(declare-fun e!192922 () Bool)

(assert (=> b!308555 (=> (not res!165168) (not e!192922))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!308555 (= res!165168 (and (= (select (arr!7437 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7789 a!3293))))))

(declare-fun b!308556 () Bool)

(declare-fun res!165167 () Bool)

(assert (=> b!308556 (=> (not res!165167) (not e!192921))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308556 (= res!165167 (validKeyInArray!0 k0!2441))))

(declare-fun b!308557 () Bool)

(declare-fun e!192919 () Bool)

(assert (=> b!308557 (= e!192919 (not true))))

(declare-fun lt!151391 () SeekEntryResult!2577)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15707 (_ BitVec 32)) SeekEntryResult!2577)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308557 (= lt!151391 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!308558 () Bool)

(declare-fun res!165173 () Bool)

(assert (=> b!308558 (=> (not res!165173) (not e!192921))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15707 (_ BitVec 32)) Bool)

(assert (=> b!308558 (= res!165173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308559 () Bool)

(assert (=> b!308559 (= e!192921 e!192922)))

(declare-fun res!165171 () Bool)

(assert (=> b!308559 (=> (not res!165171) (not e!192922))))

(declare-fun lt!151392 () SeekEntryResult!2577)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308559 (= res!165171 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151392))))

(assert (=> b!308559 (= lt!151392 (Intermediate!2577 false resIndex!52 resX!52))))

(declare-fun b!308560 () Bool)

(assert (=> b!308560 (= e!192922 e!192919)))

(declare-fun res!165170 () Bool)

(assert (=> b!308560 (=> (not res!165170) (not e!192919))))

(assert (=> b!308560 (= res!165170 (and (= lt!151391 lt!151392) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7437 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!308560 (= lt!151391 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!308561 () Bool)

(declare-fun res!165169 () Bool)

(assert (=> b!308561 (=> (not res!165169) (not e!192921))))

(assert (=> b!308561 (= res!165169 (and (= (size!7789 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7789 a!3293))))))

(assert (= (and start!30754 res!165174) b!308561))

(assert (= (and b!308561 res!165169) b!308556))

(assert (= (and b!308556 res!165167) b!308554))

(assert (= (and b!308554 res!165166) b!308553))

(assert (= (and b!308553 res!165172) b!308558))

(assert (= (and b!308558 res!165173) b!308559))

(assert (= (and b!308559 res!165171) b!308555))

(assert (= (and b!308555 res!165168) b!308560))

(assert (= (and b!308560 res!165170) b!308557))

(declare-fun m!318589 () Bool)

(assert (=> start!30754 m!318589))

(declare-fun m!318591 () Bool)

(assert (=> start!30754 m!318591))

(declare-fun m!318593 () Bool)

(assert (=> b!308557 m!318593))

(assert (=> b!308557 m!318593))

(declare-fun m!318595 () Bool)

(assert (=> b!308557 m!318595))

(declare-fun m!318597 () Bool)

(assert (=> b!308560 m!318597))

(declare-fun m!318599 () Bool)

(assert (=> b!308560 m!318599))

(declare-fun m!318601 () Bool)

(assert (=> b!308556 m!318601))

(declare-fun m!318603 () Bool)

(assert (=> b!308555 m!318603))

(declare-fun m!318605 () Bool)

(assert (=> b!308553 m!318605))

(declare-fun m!318607 () Bool)

(assert (=> b!308558 m!318607))

(declare-fun m!318609 () Bool)

(assert (=> b!308554 m!318609))

(declare-fun m!318611 () Bool)

(assert (=> b!308559 m!318611))

(assert (=> b!308559 m!318611))

(declare-fun m!318613 () Bool)

(assert (=> b!308559 m!318613))

(check-sat (not b!308557) (not b!308559) (not b!308556) (not start!30754) (not b!308553) (not b!308554) (not b!308558) (not b!308560))
(check-sat)
