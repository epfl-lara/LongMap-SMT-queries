; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31794 () Bool)

(assert start!31794)

(declare-fun b!317709 () Bool)

(declare-fun res!172339 () Bool)

(declare-fun e!197493 () Bool)

(assert (=> b!317709 (=> (not res!172339) (not e!197493))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317709 (= res!172339 (validKeyInArray!0 k0!2441))))

(declare-fun b!317710 () Bool)

(declare-fun res!172343 () Bool)

(declare-fun e!197496 () Bool)

(assert (=> b!317710 (=> (not res!172343) (not e!197496))))

(declare-datatypes ((array!16178 0))(
  ( (array!16179 (arr!7654 (Array (_ BitVec 32) (_ BitVec 64))) (size!8006 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16178)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!317710 (= res!172343 (and (= (select (arr!7654 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8006 a!3293))))))

(declare-fun b!317711 () Bool)

(declare-fun e!197495 () Bool)

(assert (=> b!317711 (= e!197496 e!197495)))

(declare-fun res!172340 () Bool)

(assert (=> b!317711 (=> (not res!172340) (not e!197495))))

(declare-datatypes ((SeekEntryResult!2759 0))(
  ( (MissingZero!2759 (index!13212 (_ BitVec 32))) (Found!2759 (index!13213 (_ BitVec 32))) (Intermediate!2759 (undefined!3571 Bool) (index!13214 (_ BitVec 32)) (x!31581 (_ BitVec 32))) (Undefined!2759) (MissingVacant!2759 (index!13215 (_ BitVec 32))) )
))
(declare-fun lt!155100 () SeekEntryResult!2759)

(declare-fun lt!155098 () SeekEntryResult!2759)

(assert (=> b!317711 (= res!172340 (and (= lt!155098 lt!155100) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7654 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16178 (_ BitVec 32)) SeekEntryResult!2759)

(assert (=> b!317711 (= lt!155098 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!317712 () Bool)

(declare-fun res!172347 () Bool)

(assert (=> b!317712 (=> (not res!172347) (not e!197493))))

(assert (=> b!317712 (= res!172347 (and (= (size!8006 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8006 a!3293))))))

(declare-fun b!317713 () Bool)

(assert (=> b!317713 (= e!197493 e!197496)))

(declare-fun res!172345 () Bool)

(assert (=> b!317713 (=> (not res!172345) (not e!197496))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317713 (= res!172345 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155100))))

(assert (=> b!317713 (= lt!155100 (Intermediate!2759 false resIndex!52 resX!52))))

(declare-fun lt!155097 () array!16178)

(declare-fun lt!155099 () (_ BitVec 32))

(declare-fun b!317714 () Bool)

(declare-fun e!197494 () Bool)

(assert (=> b!317714 (= e!197494 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155097 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155099 k0!2441 lt!155097 mask!3709)))))

(assert (=> b!317714 (= lt!155097 (array!16179 (store (arr!7654 a!3293) i!1240 k0!2441) (size!8006 a!3293)))))

(declare-fun b!317715 () Bool)

(declare-fun res!172346 () Bool)

(assert (=> b!317715 (=> (not res!172346) (not e!197493))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16178 (_ BitVec 32)) SeekEntryResult!2759)

(assert (=> b!317715 (= res!172346 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2759 i!1240)))))

(declare-fun b!317716 () Bool)

(assert (=> b!317716 (= e!197495 (not true))))

(assert (=> b!317716 e!197494))

(declare-fun res!172341 () Bool)

(assert (=> b!317716 (=> (not res!172341) (not e!197494))))

(assert (=> b!317716 (= res!172341 (= lt!155098 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155099 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317716 (= lt!155099 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun res!172344 () Bool)

(assert (=> start!31794 (=> (not res!172344) (not e!197493))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31794 (= res!172344 (validMask!0 mask!3709))))

(assert (=> start!31794 e!197493))

(declare-fun array_inv!5604 (array!16178) Bool)

(assert (=> start!31794 (array_inv!5604 a!3293)))

(assert (=> start!31794 true))

(declare-fun b!317717 () Bool)

(declare-fun res!172342 () Bool)

(assert (=> b!317717 (=> (not res!172342) (not e!197493))))

(declare-fun arrayContainsKey!0 (array!16178 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317717 (= res!172342 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!317718 () Bool)

(declare-fun res!172338 () Bool)

(assert (=> b!317718 (=> (not res!172338) (not e!197493))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16178 (_ BitVec 32)) Bool)

(assert (=> b!317718 (= res!172338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!31794 res!172344) b!317712))

(assert (= (and b!317712 res!172347) b!317709))

(assert (= (and b!317709 res!172339) b!317717))

(assert (= (and b!317717 res!172342) b!317715))

(assert (= (and b!317715 res!172346) b!317718))

(assert (= (and b!317718 res!172338) b!317713))

(assert (= (and b!317713 res!172345) b!317710))

(assert (= (and b!317710 res!172343) b!317711))

(assert (= (and b!317711 res!172340) b!317716))

(assert (= (and b!317716 res!172341) b!317714))

(declare-fun m!326587 () Bool)

(assert (=> start!31794 m!326587))

(declare-fun m!326589 () Bool)

(assert (=> start!31794 m!326589))

(declare-fun m!326591 () Bool)

(assert (=> b!317709 m!326591))

(declare-fun m!326593 () Bool)

(assert (=> b!317718 m!326593))

(declare-fun m!326595 () Bool)

(assert (=> b!317710 m!326595))

(declare-fun m!326597 () Bool)

(assert (=> b!317717 m!326597))

(declare-fun m!326599 () Bool)

(assert (=> b!317715 m!326599))

(declare-fun m!326601 () Bool)

(assert (=> b!317714 m!326601))

(declare-fun m!326603 () Bool)

(assert (=> b!317714 m!326603))

(declare-fun m!326605 () Bool)

(assert (=> b!317714 m!326605))

(declare-fun m!326607 () Bool)

(assert (=> b!317713 m!326607))

(assert (=> b!317713 m!326607))

(declare-fun m!326609 () Bool)

(assert (=> b!317713 m!326609))

(declare-fun m!326611 () Bool)

(assert (=> b!317711 m!326611))

(declare-fun m!326613 () Bool)

(assert (=> b!317711 m!326613))

(declare-fun m!326615 () Bool)

(assert (=> b!317716 m!326615))

(declare-fun m!326617 () Bool)

(assert (=> b!317716 m!326617))

(check-sat (not b!317718) (not b!317711) (not b!317713) (not start!31794) (not b!317715) (not b!317709) (not b!317716) (not b!317717) (not b!317714))
(check-sat)
