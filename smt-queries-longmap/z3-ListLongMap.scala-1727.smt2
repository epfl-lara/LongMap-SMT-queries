; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31816 () Bool)

(assert start!31816)

(declare-fun b!317882 () Bool)

(declare-fun res!172465 () Bool)

(declare-fun e!197588 () Bool)

(assert (=> b!317882 (=> (not res!172465) (not e!197588))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317882 (= res!172465 (validKeyInArray!0 k0!2441))))

(declare-fun b!317883 () Bool)

(declare-fun res!172464 () Bool)

(assert (=> b!317883 (=> (not res!172464) (not e!197588))))

(declare-datatypes ((array!16187 0))(
  ( (array!16188 (arr!7659 (Array (_ BitVec 32) (_ BitVec 64))) (size!8011 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16187)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16187 (_ BitVec 32)) Bool)

(assert (=> b!317883 (= res!172464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!317884 () Bool)

(declare-fun res!172463 () Bool)

(assert (=> b!317884 (=> (not res!172463) (not e!197588))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!317884 (= res!172463 (and (= (size!8011 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8011 a!3293))))))

(declare-fun res!172466 () Bool)

(assert (=> start!31816 (=> (not res!172466) (not e!197588))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31816 (= res!172466 (validMask!0 mask!3709))))

(assert (=> start!31816 e!197588))

(declare-fun array_inv!5622 (array!16187) Bool)

(assert (=> start!31816 (array_inv!5622 a!3293)))

(assert (=> start!31816 true))

(declare-fun b!317885 () Bool)

(declare-fun e!197590 () Bool)

(declare-fun e!197587 () Bool)

(assert (=> b!317885 (= e!197590 e!197587)))

(declare-fun res!172469 () Bool)

(assert (=> b!317885 (=> (not res!172469) (not e!197587))))

(declare-fun resX!52 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2799 0))(
  ( (MissingZero!2799 (index!13372 (_ BitVec 32))) (Found!2799 (index!13373 (_ BitVec 32))) (Intermediate!2799 (undefined!3611 Bool) (index!13374 (_ BitVec 32)) (x!31632 (_ BitVec 32))) (Undefined!2799) (MissingVacant!2799 (index!13375 (_ BitVec 32))) )
))
(declare-fun lt!155128 () SeekEntryResult!2799)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun lt!155127 () SeekEntryResult!2799)

(assert (=> b!317885 (= res!172469 (and (= lt!155127 lt!155128) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7659 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16187 (_ BitVec 32)) SeekEntryResult!2799)

(assert (=> b!317885 (= lt!155127 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!317886 () Bool)

(declare-fun res!172468 () Bool)

(assert (=> b!317886 (=> (not res!172468) (not e!197590))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!317886 (= res!172468 (and (= (select (arr!7659 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8011 a!3293))))))

(declare-fun b!317887 () Bool)

(assert (=> b!317887 (= e!197588 e!197590)))

(declare-fun res!172462 () Bool)

(assert (=> b!317887 (=> (not res!172462) (not e!197590))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317887 (= res!172462 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155128))))

(assert (=> b!317887 (= lt!155128 (Intermediate!2799 false resIndex!52 resX!52))))

(declare-fun b!317888 () Bool)

(assert (=> b!317888 (= e!197587 (not true))))

(declare-fun e!197589 () Bool)

(assert (=> b!317888 e!197589))

(declare-fun res!172461 () Bool)

(assert (=> b!317888 (=> (not res!172461) (not e!197589))))

(declare-fun lt!155129 () (_ BitVec 32))

(assert (=> b!317888 (= res!172461 (= lt!155127 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155129 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317888 (= lt!155129 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!317889 () Bool)

(declare-fun res!172470 () Bool)

(assert (=> b!317889 (=> (not res!172470) (not e!197588))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16187 (_ BitVec 32)) SeekEntryResult!2799)

(assert (=> b!317889 (= res!172470 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2799 i!1240)))))

(declare-fun b!317890 () Bool)

(declare-fun lt!155130 () array!16187)

(assert (=> b!317890 (= e!197589 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155130 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155129 k0!2441 lt!155130 mask!3709)))))

(assert (=> b!317890 (= lt!155130 (array!16188 (store (arr!7659 a!3293) i!1240 k0!2441) (size!8011 a!3293)))))

(declare-fun b!317891 () Bool)

(declare-fun res!172467 () Bool)

(assert (=> b!317891 (=> (not res!172467) (not e!197588))))

(declare-fun arrayContainsKey!0 (array!16187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317891 (= res!172467 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!31816 res!172466) b!317884))

(assert (= (and b!317884 res!172463) b!317882))

(assert (= (and b!317882 res!172465) b!317891))

(assert (= (and b!317891 res!172467) b!317889))

(assert (= (and b!317889 res!172470) b!317883))

(assert (= (and b!317883 res!172464) b!317887))

(assert (= (and b!317887 res!172462) b!317886))

(assert (= (and b!317886 res!172468) b!317885))

(assert (= (and b!317885 res!172469) b!317888))

(assert (= (and b!317888 res!172461) b!317890))

(declare-fun m!326545 () Bool)

(assert (=> start!31816 m!326545))

(declare-fun m!326547 () Bool)

(assert (=> start!31816 m!326547))

(declare-fun m!326549 () Bool)

(assert (=> b!317882 m!326549))

(declare-fun m!326551 () Bool)

(assert (=> b!317885 m!326551))

(declare-fun m!326553 () Bool)

(assert (=> b!317885 m!326553))

(declare-fun m!326555 () Bool)

(assert (=> b!317886 m!326555))

(declare-fun m!326557 () Bool)

(assert (=> b!317888 m!326557))

(declare-fun m!326559 () Bool)

(assert (=> b!317888 m!326559))

(declare-fun m!326561 () Bool)

(assert (=> b!317891 m!326561))

(declare-fun m!326563 () Bool)

(assert (=> b!317890 m!326563))

(declare-fun m!326565 () Bool)

(assert (=> b!317890 m!326565))

(declare-fun m!326567 () Bool)

(assert (=> b!317890 m!326567))

(declare-fun m!326569 () Bool)

(assert (=> b!317887 m!326569))

(assert (=> b!317887 m!326569))

(declare-fun m!326571 () Bool)

(assert (=> b!317887 m!326571))

(declare-fun m!326573 () Bool)

(assert (=> b!317883 m!326573))

(declare-fun m!326575 () Bool)

(assert (=> b!317889 m!326575))

(check-sat (not b!317889) (not b!317885) (not b!317888) (not start!31816) (not b!317883) (not b!317882) (not b!317891) (not b!317890) (not b!317887))
