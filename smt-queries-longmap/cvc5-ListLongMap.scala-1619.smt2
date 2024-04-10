; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30440 () Bool)

(assert start!30440)

(declare-fun b!304755 () Bool)

(declare-fun res!162101 () Bool)

(declare-fun e!191477 () Bool)

(assert (=> b!304755 (=> (not res!162101) (not e!191477))))

(declare-datatypes ((array!15495 0))(
  ( (array!15496 (arr!7334 (Array (_ BitVec 32) (_ BitVec 64))) (size!7686 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15495)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2474 0))(
  ( (MissingZero!2474 (index!12072 (_ BitVec 32))) (Found!2474 (index!12073 (_ BitVec 32))) (Intermediate!2474 (undefined!3286 Bool) (index!12074 (_ BitVec 32)) (x!30332 (_ BitVec 32))) (Undefined!2474) (MissingVacant!2474 (index!12075 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15495 (_ BitVec 32)) SeekEntryResult!2474)

(assert (=> b!304755 (= res!162101 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2474 i!1240)))))

(declare-fun b!304756 () Bool)

(declare-fun e!191479 () Bool)

(assert (=> b!304756 (= e!191477 e!191479)))

(declare-fun res!162106 () Bool)

(assert (=> b!304756 (=> (not res!162106) (not e!191479))))

(declare-fun lt!150521 () SeekEntryResult!2474)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15495 (_ BitVec 32)) SeekEntryResult!2474)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304756 (= res!162106 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150521))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!304756 (= lt!150521 (Intermediate!2474 false resIndex!52 resX!52))))

(declare-fun b!304757 () Bool)

(declare-fun res!162104 () Bool)

(assert (=> b!304757 (=> (not res!162104) (not e!191479))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!304757 (= res!162104 (and (= (select (arr!7334 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7686 a!3293))))))

(declare-fun b!304758 () Bool)

(declare-fun res!162107 () Bool)

(assert (=> b!304758 (=> (not res!162107) (not e!191477))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304758 (= res!162107 (validKeyInArray!0 k!2441))))

(declare-fun b!304759 () Bool)

(declare-fun res!162108 () Bool)

(assert (=> b!304759 (=> (not res!162108) (not e!191477))))

(assert (=> b!304759 (= res!162108 (and (= (size!7686 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7686 a!3293))))))

(declare-fun res!162102 () Bool)

(assert (=> start!30440 (=> (not res!162102) (not e!191477))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30440 (= res!162102 (validMask!0 mask!3709))))

(assert (=> start!30440 e!191477))

(declare-fun array_inv!5297 (array!15495) Bool)

(assert (=> start!30440 (array_inv!5297 a!3293)))

(assert (=> start!30440 true))

(declare-fun b!304760 () Bool)

(declare-fun e!191478 () Bool)

(assert (=> b!304760 (= e!191479 e!191478)))

(declare-fun res!162103 () Bool)

(assert (=> b!304760 (=> (not res!162103) (not e!191478))))

(declare-fun lt!150522 () SeekEntryResult!2474)

(assert (=> b!304760 (= res!162103 (and (= lt!150522 lt!150521) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7334 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7334 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7334 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!304760 (= lt!150522 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!304761 () Bool)

(declare-fun res!162105 () Bool)

(assert (=> b!304761 (=> (not res!162105) (not e!191477))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15495 (_ BitVec 32)) Bool)

(assert (=> b!304761 (= res!162105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!304762 () Bool)

(declare-fun res!162100 () Bool)

(assert (=> b!304762 (=> (not res!162100) (not e!191477))))

(declare-fun arrayContainsKey!0 (array!15495 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304762 (= res!162100 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304763 () Bool)

(assert (=> b!304763 (= e!191478 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304763 (= lt!150522 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(assert (= (and start!30440 res!162102) b!304759))

(assert (= (and b!304759 res!162108) b!304758))

(assert (= (and b!304758 res!162107) b!304762))

(assert (= (and b!304762 res!162100) b!304755))

(assert (= (and b!304755 res!162101) b!304761))

(assert (= (and b!304761 res!162105) b!304756))

(assert (= (and b!304756 res!162106) b!304757))

(assert (= (and b!304757 res!162104) b!304760))

(assert (= (and b!304760 res!162103) b!304763))

(declare-fun m!315839 () Bool)

(assert (=> b!304758 m!315839))

(declare-fun m!315841 () Bool)

(assert (=> b!304756 m!315841))

(assert (=> b!304756 m!315841))

(declare-fun m!315843 () Bool)

(assert (=> b!304756 m!315843))

(declare-fun m!315845 () Bool)

(assert (=> b!304760 m!315845))

(declare-fun m!315847 () Bool)

(assert (=> b!304760 m!315847))

(declare-fun m!315849 () Bool)

(assert (=> b!304757 m!315849))

(declare-fun m!315851 () Bool)

(assert (=> b!304763 m!315851))

(assert (=> b!304763 m!315851))

(declare-fun m!315853 () Bool)

(assert (=> b!304763 m!315853))

(declare-fun m!315855 () Bool)

(assert (=> b!304755 m!315855))

(declare-fun m!315857 () Bool)

(assert (=> b!304762 m!315857))

(declare-fun m!315859 () Bool)

(assert (=> b!304761 m!315859))

(declare-fun m!315861 () Bool)

(assert (=> start!30440 m!315861))

(declare-fun m!315863 () Bool)

(assert (=> start!30440 m!315863))

(push 1)

