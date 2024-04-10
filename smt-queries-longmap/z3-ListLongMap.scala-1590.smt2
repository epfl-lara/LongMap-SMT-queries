; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30166 () Bool)

(assert start!30166)

(declare-fun b!302090 () Bool)

(declare-fun res!159699 () Bool)

(declare-fun e!190501 () Bool)

(assert (=> b!302090 (=> (not res!159699) (not e!190501))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((array!15317 0))(
  ( (array!15318 (arr!7248 (Array (_ BitVec 32) (_ BitVec 64))) (size!7600 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15317)

(assert (=> b!302090 (= res!159699 (and (= (size!7600 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7600 a!3293))))))

(declare-fun b!302091 () Bool)

(declare-fun res!159703 () Bool)

(assert (=> b!302091 (=> (not res!159703) (not e!190501))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302091 (= res!159703 (validKeyInArray!0 k0!2441))))

(declare-fun b!302092 () Bool)

(declare-fun res!159701 () Bool)

(assert (=> b!302092 (=> (not res!159701) (not e!190501))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2388 0))(
  ( (MissingZero!2388 (index!11728 (_ BitVec 32))) (Found!2388 (index!11729 (_ BitVec 32))) (Intermediate!2388 (undefined!3200 Bool) (index!11730 (_ BitVec 32)) (x!29999 (_ BitVec 32))) (Undefined!2388) (MissingVacant!2388 (index!11731 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15317 (_ BitVec 32)) SeekEntryResult!2388)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302092 (= res!159701 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) (Intermediate!2388 false resIndex!52 resX!52)))))

(declare-fun res!159704 () Bool)

(assert (=> start!30166 (=> (not res!159704) (not e!190501))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30166 (= res!159704 (validMask!0 mask!3709))))

(assert (=> start!30166 e!190501))

(declare-fun array_inv!5211 (array!15317) Bool)

(assert (=> start!30166 (array_inv!5211 a!3293)))

(assert (=> start!30166 true))

(declare-fun b!302093 () Bool)

(declare-fun res!159700 () Bool)

(assert (=> b!302093 (=> (not res!159700) (not e!190501))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15317 (_ BitVec 32)) Bool)

(assert (=> b!302093 (= res!159700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun b!302094 () Bool)

(assert (=> b!302094 (= e!190501 (and (= (select (arr!7248 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7600 a!3293)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(declare-fun b!302095 () Bool)

(declare-fun res!159705 () Bool)

(assert (=> b!302095 (=> (not res!159705) (not e!190501))))

(declare-fun arrayContainsKey!0 (array!15317 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302095 (= res!159705 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302096 () Bool)

(declare-fun res!159702 () Bool)

(assert (=> b!302096 (=> (not res!159702) (not e!190501))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15317 (_ BitVec 32)) SeekEntryResult!2388)

(assert (=> b!302096 (= res!159702 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2388 i!1240)))))

(assert (= (and start!30166 res!159704) b!302090))

(assert (= (and b!302090 res!159699) b!302091))

(assert (= (and b!302091 res!159703) b!302095))

(assert (= (and b!302095 res!159705) b!302096))

(assert (= (and b!302096 res!159702) b!302093))

(assert (= (and b!302093 res!159700) b!302092))

(assert (= (and b!302092 res!159701) b!302094))

(declare-fun m!313733 () Bool)

(assert (=> start!30166 m!313733))

(declare-fun m!313735 () Bool)

(assert (=> start!30166 m!313735))

(declare-fun m!313737 () Bool)

(assert (=> b!302095 m!313737))

(declare-fun m!313739 () Bool)

(assert (=> b!302093 m!313739))

(declare-fun m!313741 () Bool)

(assert (=> b!302092 m!313741))

(assert (=> b!302092 m!313741))

(declare-fun m!313743 () Bool)

(assert (=> b!302092 m!313743))

(declare-fun m!313745 () Bool)

(assert (=> b!302094 m!313745))

(declare-fun m!313747 () Bool)

(assert (=> b!302091 m!313747))

(declare-fun m!313749 () Bool)

(assert (=> b!302096 m!313749))

(check-sat (not start!30166) (not b!302096) (not b!302093) (not b!302091) (not b!302092) (not b!302095))
(check-sat)
