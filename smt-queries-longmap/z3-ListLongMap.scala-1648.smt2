; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30670 () Bool)

(assert start!30670)

(declare-fun b!307892 () Bool)

(declare-fun res!164653 () Bool)

(declare-fun e!192649 () Bool)

(assert (=> b!307892 (=> (not res!164653) (not e!192649))))

(declare-datatypes ((array!15674 0))(
  ( (array!15675 (arr!7422 (Array (_ BitVec 32) (_ BitVec 64))) (size!7774 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15674)

(declare-datatypes ((SeekEntryResult!2562 0))(
  ( (MissingZero!2562 (index!12424 (_ BitVec 32))) (Found!2562 (index!12425 (_ BitVec 32))) (Intermediate!2562 (undefined!3374 Bool) (index!12426 (_ BitVec 32)) (x!30661 (_ BitVec 32))) (Undefined!2562) (MissingVacant!2562 (index!12427 (_ BitVec 32))) )
))
(declare-fun lt!151197 () SeekEntryResult!2562)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15674 (_ BitVec 32)) SeekEntryResult!2562)

(assert (=> b!307892 (= res!164653 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!151197))))

(declare-fun b!307893 () Bool)

(declare-fun res!164646 () Bool)

(assert (=> b!307893 (=> (not res!164646) (not e!192649))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!307893 (= res!164646 (and (= (select (arr!7422 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7774 a!3293))))))

(declare-fun b!307894 () Bool)

(declare-fun res!164652 () Bool)

(declare-fun e!192648 () Bool)

(assert (=> b!307894 (=> (not res!164652) (not e!192648))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15674 (_ BitVec 32)) Bool)

(assert (=> b!307894 (= res!164652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307895 () Bool)

(assert (=> b!307895 (= e!192648 e!192649)))

(declare-fun res!164650 () Bool)

(assert (=> b!307895 (=> (not res!164650) (not e!192649))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307895 (= res!164650 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151197))))

(assert (=> b!307895 (= lt!151197 (Intermediate!2562 false resIndex!52 resX!52))))

(declare-fun b!307896 () Bool)

(assert (=> b!307896 (= e!192649 (bvslt mask!3709 #b00000000000000000000000000000000))))

(declare-fun lt!151196 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307896 (= lt!151196 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!307897 () Bool)

(declare-fun res!164647 () Bool)

(assert (=> b!307897 (=> (not res!164647) (not e!192648))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307897 (= res!164647 (validKeyInArray!0 k0!2441))))

(declare-fun b!307898 () Bool)

(declare-fun res!164649 () Bool)

(assert (=> b!307898 (=> (not res!164649) (not e!192648))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15674 (_ BitVec 32)) SeekEntryResult!2562)

(assert (=> b!307898 (= res!164649 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2562 i!1240)))))

(declare-fun b!307899 () Bool)

(declare-fun res!164651 () Bool)

(assert (=> b!307899 (=> (not res!164651) (not e!192648))))

(assert (=> b!307899 (= res!164651 (and (= (size!7774 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7774 a!3293))))))

(declare-fun res!164648 () Bool)

(assert (=> start!30670 (=> (not res!164648) (not e!192648))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30670 (= res!164648 (validMask!0 mask!3709))))

(assert (=> start!30670 e!192648))

(declare-fun array_inv!5385 (array!15674) Bool)

(assert (=> start!30670 (array_inv!5385 a!3293)))

(assert (=> start!30670 true))

(declare-fun b!307900 () Bool)

(declare-fun res!164654 () Bool)

(assert (=> b!307900 (=> (not res!164654) (not e!192649))))

(assert (=> b!307900 (= res!164654 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7422 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun b!307901 () Bool)

(declare-fun res!164655 () Bool)

(assert (=> b!307901 (=> (not res!164655) (not e!192648))))

(declare-fun arrayContainsKey!0 (array!15674 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307901 (= res!164655 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30670 res!164648) b!307899))

(assert (= (and b!307899 res!164651) b!307897))

(assert (= (and b!307897 res!164647) b!307901))

(assert (= (and b!307901 res!164655) b!307898))

(assert (= (and b!307898 res!164649) b!307894))

(assert (= (and b!307894 res!164652) b!307895))

(assert (= (and b!307895 res!164650) b!307893))

(assert (= (and b!307893 res!164646) b!307892))

(assert (= (and b!307892 res!164653) b!307900))

(assert (= (and b!307900 res!164654) b!307896))

(declare-fun m!318113 () Bool)

(assert (=> start!30670 m!318113))

(declare-fun m!318115 () Bool)

(assert (=> start!30670 m!318115))

(declare-fun m!318117 () Bool)

(assert (=> b!307900 m!318117))

(declare-fun m!318119 () Bool)

(assert (=> b!307892 m!318119))

(declare-fun m!318121 () Bool)

(assert (=> b!307893 m!318121))

(declare-fun m!318123 () Bool)

(assert (=> b!307896 m!318123))

(declare-fun m!318125 () Bool)

(assert (=> b!307895 m!318125))

(assert (=> b!307895 m!318125))

(declare-fun m!318127 () Bool)

(assert (=> b!307895 m!318127))

(declare-fun m!318129 () Bool)

(assert (=> b!307898 m!318129))

(declare-fun m!318131 () Bool)

(assert (=> b!307894 m!318131))

(declare-fun m!318133 () Bool)

(assert (=> b!307901 m!318133))

(declare-fun m!318135 () Bool)

(assert (=> b!307897 m!318135))

(check-sat (not b!307894) (not b!307896) (not b!307901) (not b!307892) (not b!307895) (not b!307897) (not b!307898) (not start!30670))
(check-sat)
