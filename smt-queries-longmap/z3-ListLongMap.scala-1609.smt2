; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30312 () Bool)

(assert start!30312)

(declare-fun b!303624 () Bool)

(declare-fun res!161165 () Bool)

(declare-fun e!191004 () Bool)

(assert (=> b!303624 (=> (not res!161165) (not e!191004))))

(declare-datatypes ((array!15431 0))(
  ( (array!15432 (arr!7303 (Array (_ BitVec 32) (_ BitVec 64))) (size!7655 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15431)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15431 (_ BitVec 32)) Bool)

(assert (=> b!303624 (= res!161165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303625 () Bool)

(declare-fun res!161162 () Bool)

(assert (=> b!303625 (=> (not res!161162) (not e!191004))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!303625 (= res!161162 (and (= (size!7655 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7655 a!3293))))))

(declare-fun b!303626 () Bool)

(declare-fun res!161166 () Bool)

(declare-fun e!191003 () Bool)

(assert (=> b!303626 (=> (not res!161166) (not e!191003))))

(declare-datatypes ((SeekEntryResult!2408 0))(
  ( (MissingZero!2408 (index!11808 (_ BitVec 32))) (Found!2408 (index!11809 (_ BitVec 32))) (Intermediate!2408 (undefined!3220 Bool) (index!11810 (_ BitVec 32)) (x!30174 (_ BitVec 32))) (Undefined!2408) (MissingVacant!2408 (index!11811 (_ BitVec 32))) )
))
(declare-fun lt!150255 () SeekEntryResult!2408)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15431 (_ BitVec 32)) SeekEntryResult!2408)

(assert (=> b!303626 (= res!161166 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150255))))

(declare-fun b!303628 () Bool)

(declare-fun res!161160 () Bool)

(assert (=> b!303628 (=> (not res!161160) (not e!191003))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!303628 (= res!161160 (and (= (select (arr!7303 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7655 a!3293))))))

(declare-fun b!303629 () Bool)

(declare-fun res!161169 () Bool)

(assert (=> b!303629 (=> (not res!161169) (not e!191003))))

(assert (=> b!303629 (= res!161169 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7303 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7303 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7303 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!303630 () Bool)

(declare-fun res!161164 () Bool)

(assert (=> b!303630 (=> (not res!161164) (not e!191004))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15431 (_ BitVec 32)) SeekEntryResult!2408)

(assert (=> b!303630 (= res!161164 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2408 i!1240)))))

(declare-fun b!303631 () Bool)

(declare-fun res!161163 () Bool)

(assert (=> b!303631 (=> (not res!161163) (not e!191004))))

(declare-fun arrayContainsKey!0 (array!15431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303631 (= res!161163 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303627 () Bool)

(assert (=> b!303627 (= e!191003 false)))

(declare-fun lt!150254 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303627 (= lt!150254 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun res!161168 () Bool)

(assert (=> start!30312 (=> (not res!161168) (not e!191004))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30312 (= res!161168 (validMask!0 mask!3709))))

(assert (=> start!30312 e!191004))

(declare-fun array_inv!5253 (array!15431) Bool)

(assert (=> start!30312 (array_inv!5253 a!3293)))

(assert (=> start!30312 true))

(declare-fun b!303632 () Bool)

(assert (=> b!303632 (= e!191004 e!191003)))

(declare-fun res!161161 () Bool)

(assert (=> b!303632 (=> (not res!161161) (not e!191003))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303632 (= res!161161 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150255))))

(assert (=> b!303632 (= lt!150255 (Intermediate!2408 false resIndex!52 resX!52))))

(declare-fun b!303633 () Bool)

(declare-fun res!161167 () Bool)

(assert (=> b!303633 (=> (not res!161167) (not e!191004))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303633 (= res!161167 (validKeyInArray!0 k0!2441))))

(assert (= (and start!30312 res!161168) b!303625))

(assert (= (and b!303625 res!161162) b!303633))

(assert (= (and b!303633 res!161167) b!303631))

(assert (= (and b!303631 res!161163) b!303630))

(assert (= (and b!303630 res!161164) b!303624))

(assert (= (and b!303624 res!161165) b!303632))

(assert (= (and b!303632 res!161161) b!303628))

(assert (= (and b!303628 res!161160) b!303626))

(assert (= (and b!303626 res!161166) b!303629))

(assert (= (and b!303629 res!161169) b!303627))

(declare-fun m!315091 () Bool)

(assert (=> b!303633 m!315091))

(declare-fun m!315093 () Bool)

(assert (=> start!30312 m!315093))

(declare-fun m!315095 () Bool)

(assert (=> start!30312 m!315095))

(declare-fun m!315097 () Bool)

(assert (=> b!303631 m!315097))

(declare-fun m!315099 () Bool)

(assert (=> b!303624 m!315099))

(declare-fun m!315101 () Bool)

(assert (=> b!303628 m!315101))

(declare-fun m!315103 () Bool)

(assert (=> b!303630 m!315103))

(declare-fun m!315105 () Bool)

(assert (=> b!303629 m!315105))

(declare-fun m!315107 () Bool)

(assert (=> b!303632 m!315107))

(assert (=> b!303632 m!315107))

(declare-fun m!315109 () Bool)

(assert (=> b!303632 m!315109))

(declare-fun m!315111 () Bool)

(assert (=> b!303626 m!315111))

(declare-fun m!315113 () Bool)

(assert (=> b!303627 m!315113))

(check-sat (not b!303633) (not b!303630) (not b!303627) (not b!303626) (not b!303624) (not b!303632) (not b!303631) (not start!30312))
(check-sat)
