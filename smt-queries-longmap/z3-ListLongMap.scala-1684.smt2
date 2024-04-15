; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30978 () Bool)

(assert start!30978)

(declare-fun b!311142 () Bool)

(declare-fun res!167749 () Bool)

(declare-fun e!194135 () Bool)

(assert (=> b!311142 (=> (not res!167749) (not e!194135))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311142 (= res!167749 (validKeyInArray!0 k0!2441))))

(declare-fun b!311143 () Bool)

(declare-fun res!167750 () Bool)

(assert (=> b!311143 (=> (not res!167750) (not e!194135))))

(declare-datatypes ((array!15884 0))(
  ( (array!15885 (arr!7524 (Array (_ BitVec 32) (_ BitVec 64))) (size!7877 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15884)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15884 (_ BitVec 32)) Bool)

(assert (=> b!311143 (= res!167750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311144 () Bool)

(declare-fun res!167743 () Bool)

(assert (=> b!311144 (=> (not res!167743) (not e!194135))))

(declare-fun arrayContainsKey!0 (array!15884 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311144 (= res!167743 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311145 () Bool)

(declare-fun e!194132 () Bool)

(assert (=> b!311145 (= e!194132 (not true))))

(declare-fun e!194133 () Bool)

(assert (=> b!311145 e!194133))

(declare-fun res!167746 () Bool)

(assert (=> b!311145 (=> (not res!167746) (not e!194133))))

(declare-datatypes ((SeekEntryResult!2663 0))(
  ( (MissingZero!2663 (index!12828 (_ BitVec 32))) (Found!2663 (index!12829 (_ BitVec 32))) (Intermediate!2663 (undefined!3475 Bool) (index!12830 (_ BitVec 32)) (x!31063 (_ BitVec 32))) (Undefined!2663) (MissingVacant!2663 (index!12831 (_ BitVec 32))) )
))
(declare-fun lt!152113 () SeekEntryResult!2663)

(declare-fun lt!152114 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15884 (_ BitVec 32)) SeekEntryResult!2663)

(assert (=> b!311145 (= res!167746 (= lt!152113 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152114 k0!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311145 (= lt!152114 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!311146 () Bool)

(declare-fun lt!152111 () array!15884)

(assert (=> b!311146 (= e!194133 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152111 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152114 k0!2441 lt!152111 mask!3709)))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!311146 (= lt!152111 (array!15885 (store (arr!7524 a!3293) i!1240 k0!2441) (size!7877 a!3293)))))

(declare-fun b!311147 () Bool)

(declare-fun e!194131 () Bool)

(assert (=> b!311147 (= e!194131 e!194132)))

(declare-fun res!167745 () Bool)

(assert (=> b!311147 (=> (not res!167745) (not e!194132))))

(declare-fun lt!152112 () SeekEntryResult!2663)

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!311147 (= res!167745 (and (= lt!152113 lt!152112) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7524 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311147 (= lt!152113 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!311148 () Bool)

(declare-fun res!167747 () Bool)

(assert (=> b!311148 (=> (not res!167747) (not e!194135))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15884 (_ BitVec 32)) SeekEntryResult!2663)

(assert (=> b!311148 (= res!167747 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2663 i!1240)))))

(declare-fun b!311149 () Bool)

(declare-fun res!167742 () Bool)

(assert (=> b!311149 (=> (not res!167742) (not e!194135))))

(assert (=> b!311149 (= res!167742 (and (= (size!7877 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7877 a!3293))))))

(declare-fun b!311150 () Bool)

(assert (=> b!311150 (= e!194135 e!194131)))

(declare-fun res!167751 () Bool)

(assert (=> b!311150 (=> (not res!167751) (not e!194131))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311150 (= res!167751 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152112))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!311150 (= lt!152112 (Intermediate!2663 false resIndex!52 resX!52))))

(declare-fun res!167744 () Bool)

(assert (=> start!30978 (=> (not res!167744) (not e!194135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30978 (= res!167744 (validMask!0 mask!3709))))

(assert (=> start!30978 e!194135))

(declare-fun array_inv!5496 (array!15884) Bool)

(assert (=> start!30978 (array_inv!5496 a!3293)))

(assert (=> start!30978 true))

(declare-fun b!311151 () Bool)

(declare-fun res!167748 () Bool)

(assert (=> b!311151 (=> (not res!167748) (not e!194131))))

(assert (=> b!311151 (= res!167748 (and (= (select (arr!7524 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7877 a!3293))))))

(assert (= (and start!30978 res!167744) b!311149))

(assert (= (and b!311149 res!167742) b!311142))

(assert (= (and b!311142 res!167749) b!311144))

(assert (= (and b!311144 res!167743) b!311148))

(assert (= (and b!311148 res!167747) b!311143))

(assert (= (and b!311143 res!167750) b!311150))

(assert (= (and b!311150 res!167751) b!311151))

(assert (= (and b!311151 res!167748) b!311147))

(assert (= (and b!311147 res!167745) b!311145))

(assert (= (and b!311145 res!167746) b!311146))

(declare-fun m!320659 () Bool)

(assert (=> b!311146 m!320659))

(declare-fun m!320661 () Bool)

(assert (=> b!311146 m!320661))

(declare-fun m!320663 () Bool)

(assert (=> b!311146 m!320663))

(declare-fun m!320665 () Bool)

(assert (=> b!311143 m!320665))

(declare-fun m!320667 () Bool)

(assert (=> start!30978 m!320667))

(declare-fun m!320669 () Bool)

(assert (=> start!30978 m!320669))

(declare-fun m!320671 () Bool)

(assert (=> b!311150 m!320671))

(assert (=> b!311150 m!320671))

(declare-fun m!320673 () Bool)

(assert (=> b!311150 m!320673))

(declare-fun m!320675 () Bool)

(assert (=> b!311142 m!320675))

(declare-fun m!320677 () Bool)

(assert (=> b!311145 m!320677))

(declare-fun m!320679 () Bool)

(assert (=> b!311145 m!320679))

(declare-fun m!320681 () Bool)

(assert (=> b!311144 m!320681))

(declare-fun m!320683 () Bool)

(assert (=> b!311147 m!320683))

(declare-fun m!320685 () Bool)

(assert (=> b!311147 m!320685))

(declare-fun m!320687 () Bool)

(assert (=> b!311151 m!320687))

(declare-fun m!320689 () Bool)

(assert (=> b!311148 m!320689))

(check-sat (not b!311147) (not b!311143) (not b!311145) (not b!311142) (not b!311146) (not start!30978) (not b!311144) (not b!311148) (not b!311150))
(check-sat)
