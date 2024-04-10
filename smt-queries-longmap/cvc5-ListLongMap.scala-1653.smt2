; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30752 () Bool)

(assert start!30752)

(declare-fun b!308526 () Bool)

(declare-fun res!165142 () Bool)

(declare-fun e!192909 () Bool)

(assert (=> b!308526 (=> (not res!165142) (not e!192909))))

(declare-datatypes ((array!15705 0))(
  ( (array!15706 (arr!7436 (Array (_ BitVec 32) (_ BitVec 64))) (size!7788 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15705)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!308526 (= res!165142 (and (= (size!7788 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7788 a!3293))))))

(declare-fun b!308527 () Bool)

(declare-fun res!165141 () Bool)

(declare-fun e!192907 () Bool)

(assert (=> b!308527 (=> (not res!165141) (not e!192907))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!308527 (= res!165141 (and (= (select (arr!7436 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7788 a!3293))))))

(declare-fun b!308528 () Bool)

(declare-fun res!165145 () Bool)

(assert (=> b!308528 (=> (not res!165145) (not e!192909))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15705 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308528 (= res!165145 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!308529 () Bool)

(declare-fun res!165146 () Bool)

(assert (=> b!308529 (=> (not res!165146) (not e!192909))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308529 (= res!165146 (validKeyInArray!0 k!2441))))

(declare-fun b!308530 () Bool)

(declare-fun res!165144 () Bool)

(assert (=> b!308530 (=> (not res!165144) (not e!192909))))

(declare-datatypes ((SeekEntryResult!2576 0))(
  ( (MissingZero!2576 (index!12480 (_ BitVec 32))) (Found!2576 (index!12481 (_ BitVec 32))) (Intermediate!2576 (undefined!3388 Bool) (index!12482 (_ BitVec 32)) (x!30724 (_ BitVec 32))) (Undefined!2576) (MissingVacant!2576 (index!12483 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15705 (_ BitVec 32)) SeekEntryResult!2576)

(assert (=> b!308530 (= res!165144 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2576 i!1240)))))

(declare-fun res!165143 () Bool)

(assert (=> start!30752 (=> (not res!165143) (not e!192909))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30752 (= res!165143 (validMask!0 mask!3709))))

(assert (=> start!30752 e!192909))

(declare-fun array_inv!5399 (array!15705) Bool)

(assert (=> start!30752 (array_inv!5399 a!3293)))

(assert (=> start!30752 true))

(declare-fun b!308531 () Bool)

(declare-fun res!165140 () Bool)

(assert (=> b!308531 (=> (not res!165140) (not e!192909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15705 (_ BitVec 32)) Bool)

(assert (=> b!308531 (= res!165140 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308532 () Bool)

(declare-fun e!192908 () Bool)

(assert (=> b!308532 (= e!192907 e!192908)))

(declare-fun res!165139 () Bool)

(assert (=> b!308532 (=> (not res!165139) (not e!192908))))

(declare-fun lt!151385 () SeekEntryResult!2576)

(declare-fun lt!151386 () SeekEntryResult!2576)

(assert (=> b!308532 (= res!165139 (and (= lt!151386 lt!151385) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7436 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15705 (_ BitVec 32)) SeekEntryResult!2576)

(assert (=> b!308532 (= lt!151386 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!308533 () Bool)

(assert (=> b!308533 (= e!192909 e!192907)))

(declare-fun res!165147 () Bool)

(assert (=> b!308533 (=> (not res!165147) (not e!192907))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308533 (= res!165147 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151385))))

(assert (=> b!308533 (= lt!151385 (Intermediate!2576 false resIndex!52 resX!52))))

(declare-fun b!308534 () Bool)

(assert (=> b!308534 (= e!192908 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308534 (= lt!151386 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(assert (= (and start!30752 res!165143) b!308526))

(assert (= (and b!308526 res!165142) b!308529))

(assert (= (and b!308529 res!165146) b!308528))

(assert (= (and b!308528 res!165145) b!308530))

(assert (= (and b!308530 res!165144) b!308531))

(assert (= (and b!308531 res!165140) b!308533))

(assert (= (and b!308533 res!165147) b!308527))

(assert (= (and b!308527 res!165141) b!308532))

(assert (= (and b!308532 res!165139) b!308534))

(declare-fun m!318563 () Bool)

(assert (=> start!30752 m!318563))

(declare-fun m!318565 () Bool)

(assert (=> start!30752 m!318565))

(declare-fun m!318567 () Bool)

(assert (=> b!308531 m!318567))

(declare-fun m!318569 () Bool)

(assert (=> b!308530 m!318569))

(declare-fun m!318571 () Bool)

(assert (=> b!308527 m!318571))

(declare-fun m!318573 () Bool)

(assert (=> b!308533 m!318573))

(assert (=> b!308533 m!318573))

(declare-fun m!318575 () Bool)

(assert (=> b!308533 m!318575))

(declare-fun m!318577 () Bool)

(assert (=> b!308532 m!318577))

(declare-fun m!318579 () Bool)

(assert (=> b!308532 m!318579))

(declare-fun m!318581 () Bool)

(assert (=> b!308529 m!318581))

(declare-fun m!318583 () Bool)

(assert (=> b!308528 m!318583))

(declare-fun m!318585 () Bool)

(assert (=> b!308534 m!318585))

(assert (=> b!308534 m!318585))

(declare-fun m!318587 () Bool)

(assert (=> b!308534 m!318587))

(push 1)

