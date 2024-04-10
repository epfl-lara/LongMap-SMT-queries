; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31032 () Bool)

(assert start!31032)

(declare-fun b!312017 () Bool)

(declare-fun e!194607 () Bool)

(assert (=> b!312017 (= e!194607 true)))

(declare-datatypes ((SeekEntryResult!2689 0))(
  ( (MissingZero!2689 (index!12932 (_ BitVec 32))) (Found!2689 (index!12933 (_ BitVec 32))) (Intermediate!2689 (undefined!3501 Bool) (index!12934 (_ BitVec 32)) (x!31142 (_ BitVec 32))) (Undefined!2689) (MissingVacant!2689 (index!12935 (_ BitVec 32))) )
))
(declare-fun lt!152691 () SeekEntryResult!2689)

(declare-fun lt!152695 () SeekEntryResult!2689)

(assert (=> b!312017 (= lt!152691 lt!152695)))

(declare-fun lt!152690 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-datatypes ((Unit!9609 0))(
  ( (Unit!9610) )
))
(declare-fun lt!152696 () Unit!9609)

(declare-datatypes ((array!15934 0))(
  ( (array!15935 (arr!7549 (Array (_ BitVec 32) (_ BitVec 64))) (size!7901 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15934)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15934 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9609)

(assert (=> b!312017 (= lt!152696 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152690 resIndex!52 resX!52 mask!3709))))

(declare-fun b!312018 () Bool)

(declare-fun e!194611 () Bool)

(declare-fun e!194610 () Bool)

(assert (=> b!312018 (= e!194611 e!194610)))

(declare-fun res!168478 () Bool)

(assert (=> b!312018 (=> (not res!168478) (not e!194610))))

(declare-fun lt!152694 () SeekEntryResult!2689)

(declare-fun lt!152692 () SeekEntryResult!2689)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!312018 (= res!168478 (and (= lt!152694 lt!152692) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7549 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15934 (_ BitVec 32)) SeekEntryResult!2689)

(assert (=> b!312018 (= lt!152694 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!312019 () Bool)

(declare-fun res!168476 () Bool)

(declare-fun e!194609 () Bool)

(assert (=> b!312019 (=> (not res!168476) (not e!194609))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312019 (= res!168476 (validKeyInArray!0 k!2441))))

(declare-fun b!312020 () Bool)

(declare-fun res!168475 () Bool)

(assert (=> b!312020 (=> (not res!168475) (not e!194609))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15934 (_ BitVec 32)) Bool)

(assert (=> b!312020 (= res!168475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312021 () Bool)

(declare-fun res!168479 () Bool)

(assert (=> b!312021 (=> (not res!168479) (not e!194609))))

(declare-fun arrayContainsKey!0 (array!15934 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312021 (= res!168479 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!312022 () Bool)

(declare-fun res!168477 () Bool)

(assert (=> b!312022 (=> (not res!168477) (not e!194609))))

(assert (=> b!312022 (= res!168477 (and (= (size!7901 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7901 a!3293))))))

(declare-fun b!312023 () Bool)

(declare-fun res!168474 () Bool)

(assert (=> b!312023 (=> (not res!168474) (not e!194611))))

(assert (=> b!312023 (= res!168474 (and (= (select (arr!7549 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7901 a!3293))))))

(declare-fun b!312024 () Bool)

(assert (=> b!312024 (= e!194609 e!194611)))

(declare-fun res!168472 () Bool)

(assert (=> b!312024 (=> (not res!168472) (not e!194611))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312024 (= res!168472 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152692))))

(assert (=> b!312024 (= lt!152692 (Intermediate!2689 false resIndex!52 resX!52))))

(declare-fun b!312025 () Bool)

(assert (=> b!312025 (= e!194610 (not e!194607))))

(declare-fun res!168480 () Bool)

(assert (=> b!312025 (=> res!168480 e!194607)))

(assert (=> b!312025 (= res!168480 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152690 #b00000000000000000000000000000000) (bvsge lt!152690 (size!7901 a!3293)) (not (= lt!152695 lt!152692))))))

(declare-fun lt!152697 () SeekEntryResult!2689)

(assert (=> b!312025 (= lt!152697 lt!152691)))

(declare-fun lt!152693 () array!15934)

(assert (=> b!312025 (= lt!152691 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152690 k!2441 lt!152693 mask!3709))))

(assert (=> b!312025 (= lt!152697 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152693 mask!3709))))

(assert (=> b!312025 (= lt!152693 (array!15935 (store (arr!7549 a!3293) i!1240 k!2441) (size!7901 a!3293)))))

(assert (=> b!312025 (= lt!152694 lt!152695)))

(assert (=> b!312025 (= lt!152695 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152690 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312025 (= lt!152690 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun res!168471 () Bool)

(assert (=> start!31032 (=> (not res!168471) (not e!194609))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31032 (= res!168471 (validMask!0 mask!3709))))

(assert (=> start!31032 e!194609))

(declare-fun array_inv!5512 (array!15934) Bool)

(assert (=> start!31032 (array_inv!5512 a!3293)))

(assert (=> start!31032 true))

(declare-fun b!312026 () Bool)

(declare-fun res!168473 () Bool)

(assert (=> b!312026 (=> (not res!168473) (not e!194609))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15934 (_ BitVec 32)) SeekEntryResult!2689)

(assert (=> b!312026 (= res!168473 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2689 i!1240)))))

(assert (= (and start!31032 res!168471) b!312022))

(assert (= (and b!312022 res!168477) b!312019))

(assert (= (and b!312019 res!168476) b!312021))

(assert (= (and b!312021 res!168479) b!312026))

(assert (= (and b!312026 res!168473) b!312020))

(assert (= (and b!312020 res!168475) b!312024))

(assert (= (and b!312024 res!168472) b!312023))

(assert (= (and b!312023 res!168474) b!312018))

(assert (= (and b!312018 res!168478) b!312025))

(assert (= (and b!312025 (not res!168480)) b!312017))

(declare-fun m!322045 () Bool)

(assert (=> b!312017 m!322045))

(declare-fun m!322047 () Bool)

(assert (=> b!312020 m!322047))

(declare-fun m!322049 () Bool)

(assert (=> start!31032 m!322049))

(declare-fun m!322051 () Bool)

(assert (=> start!31032 m!322051))

(declare-fun m!322053 () Bool)

(assert (=> b!312024 m!322053))

(assert (=> b!312024 m!322053))

(declare-fun m!322055 () Bool)

(assert (=> b!312024 m!322055))

(declare-fun m!322057 () Bool)

(assert (=> b!312019 m!322057))

(declare-fun m!322059 () Bool)

(assert (=> b!312025 m!322059))

(declare-fun m!322061 () Bool)

(assert (=> b!312025 m!322061))

(declare-fun m!322063 () Bool)

(assert (=> b!312025 m!322063))

(declare-fun m!322065 () Bool)

(assert (=> b!312025 m!322065))

(declare-fun m!322067 () Bool)

(assert (=> b!312025 m!322067))

(declare-fun m!322069 () Bool)

(assert (=> b!312018 m!322069))

(declare-fun m!322071 () Bool)

(assert (=> b!312018 m!322071))

(declare-fun m!322073 () Bool)

(assert (=> b!312023 m!322073))

(declare-fun m!322075 () Bool)

(assert (=> b!312026 m!322075))

(declare-fun m!322077 () Bool)

(assert (=> b!312021 m!322077))

(push 1)

(assert (not b!312021))

(assert (not b!312024))

(assert (not start!31032))

(assert (not b!312018))

