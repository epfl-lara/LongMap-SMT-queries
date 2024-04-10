; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31068 () Bool)

(assert start!31068)

(declare-fun res!169011 () Bool)

(declare-fun e!194881 () Bool)

(assert (=> start!31068 (=> (not res!169011) (not e!194881))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31068 (= res!169011 (validMask!0 mask!3709))))

(assert (=> start!31068 e!194881))

(declare-datatypes ((array!15970 0))(
  ( (array!15971 (arr!7567 (Array (_ BitVec 32) (_ BitVec 64))) (size!7919 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15970)

(declare-fun array_inv!5530 (array!15970) Bool)

(assert (=> start!31068 (array_inv!5530 a!3293)))

(assert (=> start!31068 true))

(declare-fun b!312557 () Bool)

(declare-fun e!194878 () Bool)

(assert (=> b!312557 (= e!194878 true)))

(declare-datatypes ((SeekEntryResult!2707 0))(
  ( (MissingZero!2707 (index!13004 (_ BitVec 32))) (Found!2707 (index!13005 (_ BitVec 32))) (Intermediate!2707 (undefined!3519 Bool) (index!13006 (_ BitVec 32)) (x!31208 (_ BitVec 32))) (Undefined!2707) (MissingVacant!2707 (index!13007 (_ BitVec 32))) )
))
(declare-fun lt!153127 () SeekEntryResult!2707)

(declare-fun lt!153128 () SeekEntryResult!2707)

(assert (=> b!312557 (= lt!153127 lt!153128)))

(declare-datatypes ((Unit!9645 0))(
  ( (Unit!9646) )
))
(declare-fun lt!153125 () Unit!9645)

(declare-fun lt!153124 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15970 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9645)

(assert (=> b!312557 (= lt!153125 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!153124 resIndex!52 resX!52 mask!3709))))

(declare-fun b!312558 () Bool)

(declare-fun e!194880 () Bool)

(assert (=> b!312558 (= e!194880 (not e!194878))))

(declare-fun res!169013 () Bool)

(assert (=> b!312558 (=> res!169013 e!194878)))

(declare-fun lt!153122 () SeekEntryResult!2707)

(assert (=> b!312558 (= res!169013 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!153124 #b00000000000000000000000000000000) (bvsge lt!153124 (size!7919 a!3293)) (not (= lt!153128 lt!153122))))))

(declare-fun lt!153129 () SeekEntryResult!2707)

(assert (=> b!312558 (= lt!153129 lt!153127)))

(declare-fun lt!153123 () array!15970)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15970 (_ BitVec 32)) SeekEntryResult!2707)

(assert (=> b!312558 (= lt!153127 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153124 k!2441 lt!153123 mask!3709))))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!312558 (= lt!153129 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!153123 mask!3709))))

(assert (=> b!312558 (= lt!153123 (array!15971 (store (arr!7567 a!3293) i!1240 k!2441) (size!7919 a!3293)))))

(declare-fun lt!153126 () SeekEntryResult!2707)

(assert (=> b!312558 (= lt!153126 lt!153128)))

(assert (=> b!312558 (= lt!153128 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153124 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312558 (= lt!153124 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!312559 () Bool)

(declare-fun e!194877 () Bool)

(assert (=> b!312559 (= e!194877 e!194880)))

(declare-fun res!169018 () Bool)

(assert (=> b!312559 (=> (not res!169018) (not e!194880))))

(assert (=> b!312559 (= res!169018 (and (= lt!153126 lt!153122) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7567 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!312559 (= lt!153126 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!312560 () Bool)

(declare-fun res!169012 () Bool)

(assert (=> b!312560 (=> (not res!169012) (not e!194881))))

(declare-fun arrayContainsKey!0 (array!15970 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312560 (= res!169012 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!312561 () Bool)

(declare-fun res!169014 () Bool)

(assert (=> b!312561 (=> (not res!169014) (not e!194881))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15970 (_ BitVec 32)) Bool)

(assert (=> b!312561 (= res!169014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312562 () Bool)

(declare-fun res!169016 () Bool)

(assert (=> b!312562 (=> (not res!169016) (not e!194881))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15970 (_ BitVec 32)) SeekEntryResult!2707)

(assert (=> b!312562 (= res!169016 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2707 i!1240)))))

(declare-fun b!312563 () Bool)

(assert (=> b!312563 (= e!194881 e!194877)))

(declare-fun res!169017 () Bool)

(assert (=> b!312563 (=> (not res!169017) (not e!194877))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312563 (= res!169017 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!153122))))

(assert (=> b!312563 (= lt!153122 (Intermediate!2707 false resIndex!52 resX!52))))

(declare-fun b!312564 () Bool)

(declare-fun res!169015 () Bool)

(assert (=> b!312564 (=> (not res!169015) (not e!194881))))

(assert (=> b!312564 (= res!169015 (and (= (size!7919 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7919 a!3293))))))

(declare-fun b!312565 () Bool)

(declare-fun res!169019 () Bool)

(assert (=> b!312565 (=> (not res!169019) (not e!194877))))

(assert (=> b!312565 (= res!169019 (and (= (select (arr!7567 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7919 a!3293))))))

(declare-fun b!312566 () Bool)

(declare-fun res!169020 () Bool)

(assert (=> b!312566 (=> (not res!169020) (not e!194881))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312566 (= res!169020 (validKeyInArray!0 k!2441))))

(assert (= (and start!31068 res!169011) b!312564))

(assert (= (and b!312564 res!169015) b!312566))

(assert (= (and b!312566 res!169020) b!312560))

(assert (= (and b!312560 res!169012) b!312562))

(assert (= (and b!312562 res!169016) b!312561))

(assert (= (and b!312561 res!169014) b!312563))

(assert (= (and b!312563 res!169017) b!312565))

(assert (= (and b!312565 res!169019) b!312559))

(assert (= (and b!312559 res!169018) b!312558))

(assert (= (and b!312558 (not res!169013)) b!312557))

(declare-fun m!322657 () Bool)

(assert (=> b!312566 m!322657))

(declare-fun m!322659 () Bool)

(assert (=> start!31068 m!322659))

(declare-fun m!322661 () Bool)

(assert (=> start!31068 m!322661))

(declare-fun m!322663 () Bool)

(assert (=> b!312561 m!322663))

(declare-fun m!322665 () Bool)

(assert (=> b!312560 m!322665))

(declare-fun m!322667 () Bool)

(assert (=> b!312565 m!322667))

(declare-fun m!322669 () Bool)

(assert (=> b!312557 m!322669))

(declare-fun m!322671 () Bool)

(assert (=> b!312562 m!322671))

(declare-fun m!322673 () Bool)

(assert (=> b!312559 m!322673))

(declare-fun m!322675 () Bool)

(assert (=> b!312559 m!322675))

(declare-fun m!322677 () Bool)

(assert (=> b!312558 m!322677))

(declare-fun m!322679 () Bool)

(assert (=> b!312558 m!322679))

(declare-fun m!322681 () Bool)

(assert (=> b!312558 m!322681))

(declare-fun m!322683 () Bool)

(assert (=> b!312558 m!322683))

(declare-fun m!322685 () Bool)

(assert (=> b!312558 m!322685))

(declare-fun m!322687 () Bool)

(assert (=> b!312563 m!322687))

(assert (=> b!312563 m!322687))

(declare-fun m!322689 () Bool)

(assert (=> b!312563 m!322689))

(push 1)

(assert (not b!312563))

(assert (not b!312558))

(assert (not b!312560))

(assert (not b!312566))

