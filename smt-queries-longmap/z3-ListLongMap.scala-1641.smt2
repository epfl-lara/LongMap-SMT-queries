; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30612 () Bool)

(assert start!30612)

(declare-fun b!307249 () Bool)

(declare-fun res!164061 () Bool)

(declare-fun e!192434 () Bool)

(assert (=> b!307249 (=> (not res!164061) (not e!192434))))

(declare-datatypes ((array!15629 0))(
  ( (array!15630 (arr!7399 (Array (_ BitVec 32) (_ BitVec 64))) (size!7751 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15629)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2504 0))(
  ( (MissingZero!2504 (index!12192 (_ BitVec 32))) (Found!2504 (index!12193 (_ BitVec 32))) (Intermediate!2504 (undefined!3316 Bool) (index!12194 (_ BitVec 32)) (x!30544 (_ BitVec 32))) (Undefined!2504) (MissingVacant!2504 (index!12195 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15629 (_ BitVec 32)) SeekEntryResult!2504)

(assert (=> b!307249 (= res!164061 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2504 i!1240)))))

(declare-fun b!307250 () Bool)

(declare-fun res!164060 () Bool)

(declare-fun e!192435 () Bool)

(assert (=> b!307250 (=> (not res!164060) (not e!192435))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!307250 (= res!164060 (and (= (select (arr!7399 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7751 a!3293))))))

(declare-fun b!307251 () Bool)

(declare-fun res!164059 () Bool)

(assert (=> b!307251 (=> (not res!164059) (not e!192434))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15629 (_ BitVec 32)) Bool)

(assert (=> b!307251 (= res!164059 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307252 () Bool)

(declare-fun res!164056 () Bool)

(assert (=> b!307252 (=> (not res!164056) (not e!192434))))

(assert (=> b!307252 (= res!164056 (and (= (size!7751 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7751 a!3293))))))

(declare-fun res!164058 () Bool)

(assert (=> start!30612 (=> (not res!164058) (not e!192434))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30612 (= res!164058 (validMask!0 mask!3709))))

(assert (=> start!30612 e!192434))

(declare-fun array_inv!5349 (array!15629) Bool)

(assert (=> start!30612 (array_inv!5349 a!3293)))

(assert (=> start!30612 true))

(declare-fun b!307253 () Bool)

(declare-fun res!164054 () Bool)

(assert (=> b!307253 (=> (not res!164054) (not e!192434))))

(declare-fun arrayContainsKey!0 (array!15629 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307253 (= res!164054 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!307254 () Bool)

(declare-fun res!164057 () Bool)

(assert (=> b!307254 (=> (not res!164057) (not e!192434))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307254 (= res!164057 (validKeyInArray!0 k0!2441))))

(declare-fun b!307255 () Bool)

(assert (=> b!307255 (= e!192435 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7399 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsgt x!1427 #b01111111111111111111111111111110)))))

(declare-fun b!307256 () Bool)

(assert (=> b!307256 (= e!192434 e!192435)))

(declare-fun res!164053 () Bool)

(assert (=> b!307256 (=> (not res!164053) (not e!192435))))

(declare-fun lt!151134 () SeekEntryResult!2504)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15629 (_ BitVec 32)) SeekEntryResult!2504)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307256 (= res!164053 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151134))))

(assert (=> b!307256 (= lt!151134 (Intermediate!2504 false resIndex!52 resX!52))))

(declare-fun b!307257 () Bool)

(declare-fun res!164055 () Bool)

(assert (=> b!307257 (=> (not res!164055) (not e!192435))))

(assert (=> b!307257 (= res!164055 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!151134))))

(assert (= (and start!30612 res!164058) b!307252))

(assert (= (and b!307252 res!164056) b!307254))

(assert (= (and b!307254 res!164057) b!307253))

(assert (= (and b!307253 res!164054) b!307249))

(assert (= (and b!307249 res!164061) b!307251))

(assert (= (and b!307251 res!164059) b!307256))

(assert (= (and b!307256 res!164053) b!307250))

(assert (= (and b!307250 res!164060) b!307257))

(assert (= (and b!307257 res!164055) b!307255))

(declare-fun m!317755 () Bool)

(assert (=> b!307257 m!317755))

(declare-fun m!317757 () Bool)

(assert (=> b!307250 m!317757))

(declare-fun m!317759 () Bool)

(assert (=> start!30612 m!317759))

(declare-fun m!317761 () Bool)

(assert (=> start!30612 m!317761))

(declare-fun m!317763 () Bool)

(assert (=> b!307253 m!317763))

(declare-fun m!317765 () Bool)

(assert (=> b!307254 m!317765))

(declare-fun m!317767 () Bool)

(assert (=> b!307255 m!317767))

(declare-fun m!317769 () Bool)

(assert (=> b!307256 m!317769))

(assert (=> b!307256 m!317769))

(declare-fun m!317771 () Bool)

(assert (=> b!307256 m!317771))

(declare-fun m!317773 () Bool)

(assert (=> b!307249 m!317773))

(declare-fun m!317775 () Bool)

(assert (=> b!307251 m!317775))

(check-sat (not b!307257) (not b!307256) (not b!307251) (not start!30612) (not b!307249) (not b!307253) (not b!307254))
(check-sat)
