; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31076 () Bool)

(assert start!31076)

(declare-fun b!312677 () Bool)

(declare-fun res!169139 () Bool)

(declare-fun e!194939 () Bool)

(assert (=> b!312677 (=> (not res!169139) (not e!194939))))

(declare-datatypes ((array!15978 0))(
  ( (array!15979 (arr!7571 (Array (_ BitVec 32) (_ BitVec 64))) (size!7923 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15978)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2711 0))(
  ( (MissingZero!2711 (index!13020 (_ BitVec 32))) (Found!2711 (index!13021 (_ BitVec 32))) (Intermediate!2711 (undefined!3523 Bool) (index!13022 (_ BitVec 32)) (x!31228 (_ BitVec 32))) (Undefined!2711) (MissingVacant!2711 (index!13023 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15978 (_ BitVec 32)) SeekEntryResult!2711)

(assert (=> b!312677 (= res!169139 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2711 i!1240)))))

(declare-fun res!169136 () Bool)

(assert (=> start!31076 (=> (not res!169136) (not e!194939))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31076 (= res!169136 (validMask!0 mask!3709))))

(assert (=> start!31076 e!194939))

(declare-fun array_inv!5534 (array!15978) Bool)

(assert (=> start!31076 (array_inv!5534 a!3293)))

(assert (=> start!31076 true))

(declare-fun b!312678 () Bool)

(declare-fun res!169134 () Bool)

(assert (=> b!312678 (=> (not res!169134) (not e!194939))))

(declare-fun arrayContainsKey!0 (array!15978 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312678 (= res!169134 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!312679 () Bool)

(declare-fun res!169133 () Bool)

(assert (=> b!312679 (=> (not res!169133) (not e!194939))))

(assert (=> b!312679 (= res!169133 (and (= (size!7923 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7923 a!3293))))))

(declare-fun b!312680 () Bool)

(declare-fun res!169132 () Bool)

(assert (=> b!312680 (=> (not res!169132) (not e!194939))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312680 (= res!169132 (validKeyInArray!0 k!2441))))

(declare-fun b!312681 () Bool)

(declare-fun e!194937 () Bool)

(assert (=> b!312681 (= e!194939 e!194937)))

(declare-fun res!169140 () Bool)

(assert (=> b!312681 (=> (not res!169140) (not e!194937))))

(declare-fun lt!153224 () SeekEntryResult!2711)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15978 (_ BitVec 32)) SeekEntryResult!2711)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312681 (= res!169140 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!153224))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!312681 (= lt!153224 (Intermediate!2711 false resIndex!52 resX!52))))

(declare-fun b!312682 () Bool)

(declare-fun res!169137 () Bool)

(assert (=> b!312682 (=> (not res!169137) (not e!194937))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!312682 (= res!169137 (and (= (select (arr!7571 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7923 a!3293))))))

(declare-fun b!312683 () Bool)

(declare-fun res!169138 () Bool)

(assert (=> b!312683 (=> (not res!169138) (not e!194939))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15978 (_ BitVec 32)) Bool)

(assert (=> b!312683 (= res!169138 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312684 () Bool)

(declare-fun e!194940 () Bool)

(declare-fun e!194938 () Bool)

(assert (=> b!312684 (= e!194940 (not e!194938))))

(declare-fun res!169131 () Bool)

(assert (=> b!312684 (=> res!169131 e!194938)))

(declare-fun lt!153219 () (_ BitVec 32))

(declare-fun lt!153223 () SeekEntryResult!2711)

(assert (=> b!312684 (= res!169131 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!153219 #b00000000000000000000000000000000) (bvsge lt!153219 (size!7923 a!3293)) (not (= lt!153223 lt!153224))))))

(declare-fun lt!153221 () SeekEntryResult!2711)

(declare-fun lt!153222 () SeekEntryResult!2711)

(assert (=> b!312684 (= lt!153221 lt!153222)))

(declare-fun lt!153218 () array!15978)

(assert (=> b!312684 (= lt!153222 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153219 k!2441 lt!153218 mask!3709))))

(assert (=> b!312684 (= lt!153221 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!153218 mask!3709))))

(assert (=> b!312684 (= lt!153218 (array!15979 (store (arr!7571 a!3293) i!1240 k!2441) (size!7923 a!3293)))))

(declare-fun lt!153220 () SeekEntryResult!2711)

(assert (=> b!312684 (= lt!153220 lt!153223)))

(assert (=> b!312684 (= lt!153223 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153219 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312684 (= lt!153219 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!312685 () Bool)

(assert (=> b!312685 (= e!194938 (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsle x!1427 #b01111111111111111111111111111110)))))

(assert (=> b!312685 (= lt!153222 lt!153223)))

(declare-datatypes ((Unit!9653 0))(
  ( (Unit!9654) )
))
(declare-fun lt!153225 () Unit!9653)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15978 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9653)

(assert (=> b!312685 (= lt!153225 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!153219 resIndex!52 resX!52 mask!3709))))

(declare-fun b!312686 () Bool)

(assert (=> b!312686 (= e!194937 e!194940)))

(declare-fun res!169135 () Bool)

(assert (=> b!312686 (=> (not res!169135) (not e!194940))))

(assert (=> b!312686 (= res!169135 (and (= lt!153220 lt!153224) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7571 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!312686 (= lt!153220 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(assert (= (and start!31076 res!169136) b!312679))

(assert (= (and b!312679 res!169133) b!312680))

(assert (= (and b!312680 res!169132) b!312678))

(assert (= (and b!312678 res!169134) b!312677))

(assert (= (and b!312677 res!169139) b!312683))

(assert (= (and b!312683 res!169138) b!312681))

(assert (= (and b!312681 res!169140) b!312682))

(assert (= (and b!312682 res!169137) b!312686))

(assert (= (and b!312686 res!169135) b!312684))

(assert (= (and b!312684 (not res!169131)) b!312685))

(declare-fun m!322793 () Bool)

(assert (=> start!31076 m!322793))

(declare-fun m!322795 () Bool)

(assert (=> start!31076 m!322795))

(declare-fun m!322797 () Bool)

(assert (=> b!312680 m!322797))

(declare-fun m!322799 () Bool)

(assert (=> b!312684 m!322799))

(declare-fun m!322801 () Bool)

(assert (=> b!312684 m!322801))

(declare-fun m!322803 () Bool)

(assert (=> b!312684 m!322803))

(declare-fun m!322805 () Bool)

(assert (=> b!312684 m!322805))

(declare-fun m!322807 () Bool)

(assert (=> b!312684 m!322807))

(declare-fun m!322809 () Bool)

(assert (=> b!312678 m!322809))

(declare-fun m!322811 () Bool)

(assert (=> b!312685 m!322811))

(declare-fun m!322813 () Bool)

(assert (=> b!312681 m!322813))

(assert (=> b!312681 m!322813))

(declare-fun m!322815 () Bool)

(assert (=> b!312681 m!322815))

(declare-fun m!322817 () Bool)

(assert (=> b!312677 m!322817))

(declare-fun m!322819 () Bool)

(assert (=> b!312682 m!322819))

(declare-fun m!322821 () Bool)

(assert (=> b!312683 m!322821))

(declare-fun m!322823 () Bool)

(assert (=> b!312686 m!322823))

(declare-fun m!322825 () Bool)

(assert (=> b!312686 m!322825))

(push 1)

