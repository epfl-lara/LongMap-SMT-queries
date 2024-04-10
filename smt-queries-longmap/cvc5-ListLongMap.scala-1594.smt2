; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30236 () Bool)

(assert start!30236)

(declare-fun b!302514 () Bool)

(declare-fun res!160000 () Bool)

(declare-fun e!190687 () Bool)

(assert (=> b!302514 (=> (not res!160000) (not e!190687))))

(declare-datatypes ((array!15342 0))(
  ( (array!15343 (arr!7259 (Array (_ BitVec 32) (_ BitVec 64))) (size!7611 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15342)

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2399 0))(
  ( (MissingZero!2399 (index!11772 (_ BitVec 32))) (Found!2399 (index!11773 (_ BitVec 32))) (Intermediate!2399 (undefined!3211 Bool) (index!11774 (_ BitVec 32)) (x!30048 (_ BitVec 32))) (Undefined!2399) (MissingVacant!2399 (index!11775 (_ BitVec 32))) )
))
(declare-fun lt!150099 () SeekEntryResult!2399)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15342 (_ BitVec 32)) SeekEntryResult!2399)

(assert (=> b!302514 (= res!160000 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150099))))

(declare-fun b!302515 () Bool)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!302515 (= e!190687 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7259 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (or (= (select (arr!7259 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7259 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3709 #b00000000000000000000000000000000)))))

(declare-fun b!302516 () Bool)

(declare-fun res!160002 () Bool)

(declare-fun e!190685 () Bool)

(assert (=> b!302516 (=> (not res!160002) (not e!190685))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!302516 (= res!160002 (and (= (size!7611 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7611 a!3293))))))

(declare-fun b!302517 () Bool)

(declare-fun res!160005 () Bool)

(assert (=> b!302517 (=> (not res!160005) (not e!190687))))

(assert (=> b!302517 (= res!160005 (and (= (select (arr!7259 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7611 a!3293))))))

(declare-fun b!302518 () Bool)

(declare-fun res!160004 () Bool)

(assert (=> b!302518 (=> (not res!160004) (not e!190685))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302518 (= res!160004 (validKeyInArray!0 k!2441))))

(declare-fun b!302520 () Bool)

(assert (=> b!302520 (= e!190685 e!190687)))

(declare-fun res!160006 () Bool)

(assert (=> b!302520 (=> (not res!160006) (not e!190687))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302520 (= res!160006 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150099))))

(assert (=> b!302520 (= lt!150099 (Intermediate!2399 false resIndex!52 resX!52))))

(declare-fun b!302521 () Bool)

(declare-fun res!160003 () Bool)

(assert (=> b!302521 (=> (not res!160003) (not e!190685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15342 (_ BitVec 32)) Bool)

(assert (=> b!302521 (= res!160003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!302522 () Bool)

(declare-fun res!160007 () Bool)

(assert (=> b!302522 (=> (not res!160007) (not e!190685))))

(declare-fun arrayContainsKey!0 (array!15342 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302522 (= res!160007 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!160008 () Bool)

(assert (=> start!30236 (=> (not res!160008) (not e!190685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30236 (= res!160008 (validMask!0 mask!3709))))

(assert (=> start!30236 e!190685))

(declare-fun array_inv!5222 (array!15342) Bool)

(assert (=> start!30236 (array_inv!5222 a!3293)))

(assert (=> start!30236 true))

(declare-fun b!302519 () Bool)

(declare-fun res!160001 () Bool)

(assert (=> b!302519 (=> (not res!160001) (not e!190685))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15342 (_ BitVec 32)) SeekEntryResult!2399)

(assert (=> b!302519 (= res!160001 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2399 i!1240)))))

(assert (= (and start!30236 res!160008) b!302516))

(assert (= (and b!302516 res!160002) b!302518))

(assert (= (and b!302518 res!160004) b!302522))

(assert (= (and b!302522 res!160007) b!302519))

(assert (= (and b!302519 res!160001) b!302521))

(assert (= (and b!302521 res!160003) b!302520))

(assert (= (and b!302520 res!160006) b!302517))

(assert (= (and b!302517 res!160005) b!302514))

(assert (= (and b!302514 res!160000) b!302515))

(declare-fun m!314027 () Bool)

(assert (=> b!302522 m!314027))

(declare-fun m!314029 () Bool)

(assert (=> b!302514 m!314029))

(declare-fun m!314031 () Bool)

(assert (=> b!302519 m!314031))

(declare-fun m!314033 () Bool)

(assert (=> b!302521 m!314033))

(declare-fun m!314035 () Bool)

(assert (=> start!30236 m!314035))

(declare-fun m!314037 () Bool)

(assert (=> start!30236 m!314037))

(declare-fun m!314039 () Bool)

(assert (=> b!302517 m!314039))

(declare-fun m!314041 () Bool)

(assert (=> b!302518 m!314041))

(declare-fun m!314043 () Bool)

(assert (=> b!302515 m!314043))

(declare-fun m!314045 () Bool)

(assert (=> b!302520 m!314045))

(assert (=> b!302520 m!314045))

(declare-fun m!314047 () Bool)

(assert (=> b!302520 m!314047))

(push 1)

(assert (not b!302522))

