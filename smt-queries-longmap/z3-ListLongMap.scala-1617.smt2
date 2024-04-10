; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30430 () Bool)

(assert start!30430)

(declare-fun res!161969 () Bool)

(declare-fun e!191419 () Bool)

(assert (=> start!30430 (=> (not res!161969) (not e!191419))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30430 (= res!161969 (validMask!0 mask!3709))))

(assert (=> start!30430 e!191419))

(declare-datatypes ((array!15485 0))(
  ( (array!15486 (arr!7329 (Array (_ BitVec 32) (_ BitVec 64))) (size!7681 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15485)

(declare-fun array_inv!5292 (array!15485) Bool)

(assert (=> start!30430 (array_inv!5292 a!3293)))

(assert (=> start!30430 true))

(declare-fun b!304620 () Bool)

(declare-fun e!191417 () Bool)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!304620 (= e!191417 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(declare-datatypes ((SeekEntryResult!2469 0))(
  ( (MissingZero!2469 (index!12052 (_ BitVec 32))) (Found!2469 (index!12053 (_ BitVec 32))) (Intermediate!2469 (undefined!3281 Bool) (index!12054 (_ BitVec 32)) (x!30311 (_ BitVec 32))) (Undefined!2469) (MissingVacant!2469 (index!12055 (_ BitVec 32))) )
))
(declare-fun lt!150492 () SeekEntryResult!2469)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15485 (_ BitVec 32)) SeekEntryResult!2469)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304620 (= lt!150492 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!304621 () Bool)

(declare-fun res!161965 () Bool)

(assert (=> b!304621 (=> (not res!161965) (not e!191419))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15485 (_ BitVec 32)) Bool)

(assert (=> b!304621 (= res!161965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!304622 () Bool)

(declare-fun res!161967 () Bool)

(assert (=> b!304622 (=> (not res!161967) (not e!191419))))

(declare-fun arrayContainsKey!0 (array!15485 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304622 (= res!161967 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304623 () Bool)

(declare-fun res!161973 () Bool)

(declare-fun e!191416 () Bool)

(assert (=> b!304623 (=> (not res!161973) (not e!191416))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!304623 (= res!161973 (and (= (select (arr!7329 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7681 a!3293))))))

(declare-fun b!304624 () Bool)

(declare-fun res!161966 () Bool)

(assert (=> b!304624 (=> (not res!161966) (not e!191419))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304624 (= res!161966 (validKeyInArray!0 k0!2441))))

(declare-fun b!304625 () Bool)

(assert (=> b!304625 (= e!191419 e!191416)))

(declare-fun res!161970 () Bool)

(assert (=> b!304625 (=> (not res!161970) (not e!191416))))

(declare-fun lt!150491 () SeekEntryResult!2469)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304625 (= res!161970 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150491))))

(assert (=> b!304625 (= lt!150491 (Intermediate!2469 false resIndex!52 resX!52))))

(declare-fun b!304626 () Bool)

(declare-fun res!161968 () Bool)

(assert (=> b!304626 (=> (not res!161968) (not e!191419))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15485 (_ BitVec 32)) SeekEntryResult!2469)

(assert (=> b!304626 (= res!161968 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2469 i!1240)))))

(declare-fun b!304627 () Bool)

(assert (=> b!304627 (= e!191416 e!191417)))

(declare-fun res!161971 () Bool)

(assert (=> b!304627 (=> (not res!161971) (not e!191417))))

(assert (=> b!304627 (= res!161971 (and (= lt!150492 lt!150491) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7329 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7329 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7329 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!304627 (= lt!150492 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!304628 () Bool)

(declare-fun res!161972 () Bool)

(assert (=> b!304628 (=> (not res!161972) (not e!191419))))

(assert (=> b!304628 (= res!161972 (and (= (size!7681 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7681 a!3293))))))

(assert (= (and start!30430 res!161969) b!304628))

(assert (= (and b!304628 res!161972) b!304624))

(assert (= (and b!304624 res!161966) b!304622))

(assert (= (and b!304622 res!161967) b!304626))

(assert (= (and b!304626 res!161968) b!304621))

(assert (= (and b!304621 res!161965) b!304625))

(assert (= (and b!304625 res!161970) b!304623))

(assert (= (and b!304623 res!161973) b!304627))

(assert (= (and b!304627 res!161971) b!304620))

(declare-fun m!315709 () Bool)

(assert (=> b!304620 m!315709))

(assert (=> b!304620 m!315709))

(declare-fun m!315711 () Bool)

(assert (=> b!304620 m!315711))

(declare-fun m!315713 () Bool)

(assert (=> b!304627 m!315713))

(declare-fun m!315715 () Bool)

(assert (=> b!304627 m!315715))

(declare-fun m!315717 () Bool)

(assert (=> b!304622 m!315717))

(declare-fun m!315719 () Bool)

(assert (=> b!304623 m!315719))

(declare-fun m!315721 () Bool)

(assert (=> b!304621 m!315721))

(declare-fun m!315723 () Bool)

(assert (=> start!30430 m!315723))

(declare-fun m!315725 () Bool)

(assert (=> start!30430 m!315725))

(declare-fun m!315727 () Bool)

(assert (=> b!304624 m!315727))

(declare-fun m!315729 () Bool)

(assert (=> b!304626 m!315729))

(declare-fun m!315731 () Bool)

(assert (=> b!304625 m!315731))

(assert (=> b!304625 m!315731))

(declare-fun m!315733 () Bool)

(assert (=> b!304625 m!315733))

(check-sat (not b!304621) (not b!304627) (not start!30430) (not b!304620) (not b!304622) (not b!304626) (not b!304625) (not b!304624))
(check-sat)
