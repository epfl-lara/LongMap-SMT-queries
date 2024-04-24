; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30420 () Bool)

(assert start!30420)

(declare-fun b!304621 () Bool)

(declare-fun res!162018 () Bool)

(declare-fun e!191409 () Bool)

(assert (=> b!304621 (=> (not res!162018) (not e!191409))))

(declare-datatypes ((array!15488 0))(
  ( (array!15489 (arr!7330 (Array (_ BitVec 32) (_ BitVec 64))) (size!7682 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15488)

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(assert (=> b!304621 (= res!162018 (and (= (size!7682 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7682 a!3293))))))

(declare-fun b!304622 () Bool)

(declare-fun e!191406 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!304622 (= e!191406 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (and (bvsle (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000)))))))

(declare-datatypes ((SeekEntryResult!2435 0))(
  ( (MissingZero!2435 (index!11916 (_ BitVec 32))) (Found!2435 (index!11917 (_ BitVec 32))) (Intermediate!2435 (undefined!3247 Bool) (index!11918 (_ BitVec 32)) (x!30282 (_ BitVec 32))) (Undefined!2435) (MissingVacant!2435 (index!11919 (_ BitVec 32))) )
))
(declare-fun lt!150521 () SeekEntryResult!2435)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15488 (_ BitVec 32)) SeekEntryResult!2435)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304622 (= lt!150521 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!304623 () Bool)

(declare-fun res!162022 () Bool)

(declare-fun e!191407 () Bool)

(assert (=> b!304623 (=> (not res!162022) (not e!191407))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!304623 (= res!162022 (and (= (select (arr!7330 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7682 a!3293))))))

(declare-fun b!304624 () Bool)

(declare-fun res!162023 () Bool)

(assert (=> b!304624 (=> (not res!162023) (not e!191409))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304624 (= res!162023 (validKeyInArray!0 k0!2441))))

(declare-fun res!162020 () Bool)

(assert (=> start!30420 (=> (not res!162020) (not e!191409))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30420 (= res!162020 (validMask!0 mask!3709))))

(assert (=> start!30420 e!191409))

(declare-fun array_inv!5280 (array!15488) Bool)

(assert (=> start!30420 (array_inv!5280 a!3293)))

(assert (=> start!30420 true))

(declare-fun b!304625 () Bool)

(declare-fun res!162016 () Bool)

(assert (=> b!304625 (=> (not res!162016) (not e!191409))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15488 (_ BitVec 32)) SeekEntryResult!2435)

(assert (=> b!304625 (= res!162016 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2435 i!1240)))))

(declare-fun b!304626 () Bool)

(declare-fun res!162019 () Bool)

(assert (=> b!304626 (=> (not res!162019) (not e!191409))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15488 (_ BitVec 32)) Bool)

(assert (=> b!304626 (= res!162019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!304627 () Bool)

(assert (=> b!304627 (= e!191409 e!191407)))

(declare-fun res!162021 () Bool)

(assert (=> b!304627 (=> (not res!162021) (not e!191407))))

(declare-fun lt!150522 () SeekEntryResult!2435)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304627 (= res!162021 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150522))))

(assert (=> b!304627 (= lt!150522 (Intermediate!2435 false resIndex!52 resX!52))))

(declare-fun b!304628 () Bool)

(assert (=> b!304628 (= e!191407 e!191406)))

(declare-fun res!162024 () Bool)

(assert (=> b!304628 (=> (not res!162024) (not e!191406))))

(assert (=> b!304628 (= res!162024 (and (= lt!150521 lt!150522) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7330 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7330 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7330 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!304628 (= lt!150521 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!304629 () Bool)

(declare-fun res!162017 () Bool)

(assert (=> b!304629 (=> (not res!162017) (not e!191409))))

(declare-fun arrayContainsKey!0 (array!15488 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304629 (= res!162017 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30420 res!162020) b!304621))

(assert (= (and b!304621 res!162018) b!304624))

(assert (= (and b!304624 res!162023) b!304629))

(assert (= (and b!304629 res!162017) b!304625))

(assert (= (and b!304625 res!162016) b!304626))

(assert (= (and b!304626 res!162019) b!304627))

(assert (= (and b!304627 res!162021) b!304623))

(assert (= (and b!304623 res!162022) b!304628))

(assert (= (and b!304628 res!162024) b!304622))

(declare-fun m!315877 () Bool)

(assert (=> b!304627 m!315877))

(assert (=> b!304627 m!315877))

(declare-fun m!315879 () Bool)

(assert (=> b!304627 m!315879))

(declare-fun m!315881 () Bool)

(assert (=> b!304622 m!315881))

(assert (=> b!304622 m!315881))

(declare-fun m!315883 () Bool)

(assert (=> b!304622 m!315883))

(declare-fun m!315885 () Bool)

(assert (=> b!304623 m!315885))

(declare-fun m!315887 () Bool)

(assert (=> b!304625 m!315887))

(declare-fun m!315889 () Bool)

(assert (=> start!30420 m!315889))

(declare-fun m!315891 () Bool)

(assert (=> start!30420 m!315891))

(declare-fun m!315893 () Bool)

(assert (=> b!304628 m!315893))

(declare-fun m!315895 () Bool)

(assert (=> b!304628 m!315895))

(declare-fun m!315897 () Bool)

(assert (=> b!304624 m!315897))

(declare-fun m!315899 () Bool)

(assert (=> b!304629 m!315899))

(declare-fun m!315901 () Bool)

(assert (=> b!304626 m!315901))

(check-sat (not b!304626) (not b!304622) (not b!304625) (not b!304628) (not start!30420) (not b!304627) (not b!304624) (not b!304629))
(check-sat)
