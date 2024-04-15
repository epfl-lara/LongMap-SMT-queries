; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30432 () Bool)

(assert start!30432)

(declare-fun b!304561 () Bool)

(declare-fun e!191337 () Bool)

(declare-fun e!191338 () Bool)

(assert (=> b!304561 (= e!191337 e!191338)))

(declare-fun res!162060 () Bool)

(assert (=> b!304561 (=> (not res!162060) (not e!191338))))

(declare-datatypes ((SeekEntryResult!2471 0))(
  ( (MissingZero!2471 (index!12060 (_ BitVec 32))) (Found!2471 (index!12061 (_ BitVec 32))) (Intermediate!2471 (undefined!3283 Bool) (index!12062 (_ BitVec 32)) (x!30332 (_ BitVec 32))) (Undefined!2471) (MissingVacant!2471 (index!12063 (_ BitVec 32))) )
))
(declare-fun lt!150304 () SeekEntryResult!2471)

(declare-datatypes ((array!15491 0))(
  ( (array!15492 (arr!7332 (Array (_ BitVec 32) (_ BitVec 64))) (size!7685 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15491)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15491 (_ BitVec 32)) SeekEntryResult!2471)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304561 (= res!162060 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150304))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!304561 (= lt!150304 (Intermediate!2471 false resIndex!52 resX!52))))

(declare-fun b!304562 () Bool)

(declare-fun e!191336 () Bool)

(assert (=> b!304562 (= e!191336 (not (bvsge mask!3709 #b00000000000000000000000000000000)))))

(declare-fun lt!150305 () SeekEntryResult!2471)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304562 (= lt!150305 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun res!162055 () Bool)

(assert (=> start!30432 (=> (not res!162055) (not e!191337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30432 (= res!162055 (validMask!0 mask!3709))))

(assert (=> start!30432 e!191337))

(declare-fun array_inv!5304 (array!15491) Bool)

(assert (=> start!30432 (array_inv!5304 a!3293)))

(assert (=> start!30432 true))

(declare-fun b!304563 () Bool)

(declare-fun res!162054 () Bool)

(assert (=> b!304563 (=> (not res!162054) (not e!191337))))

(declare-fun arrayContainsKey!0 (array!15491 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304563 (= res!162054 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304564 () Bool)

(declare-fun res!162057 () Bool)

(assert (=> b!304564 (=> (not res!162057) (not e!191338))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!304564 (= res!162057 (and (= (select (arr!7332 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7685 a!3293))))))

(declare-fun b!304565 () Bool)

(assert (=> b!304565 (= e!191338 e!191336)))

(declare-fun res!162058 () Bool)

(assert (=> b!304565 (=> (not res!162058) (not e!191336))))

(assert (=> b!304565 (= res!162058 (and (= lt!150305 lt!150304) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7332 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7332 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7332 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!304565 (= lt!150305 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!304566 () Bool)

(declare-fun res!162059 () Bool)

(assert (=> b!304566 (=> (not res!162059) (not e!191337))))

(assert (=> b!304566 (= res!162059 (and (= (size!7685 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7685 a!3293))))))

(declare-fun b!304567 () Bool)

(declare-fun res!162052 () Bool)

(assert (=> b!304567 (=> (not res!162052) (not e!191337))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15491 (_ BitVec 32)) SeekEntryResult!2471)

(assert (=> b!304567 (= res!162052 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2471 i!1240)))))

(declare-fun b!304568 () Bool)

(declare-fun res!162053 () Bool)

(assert (=> b!304568 (=> (not res!162053) (not e!191337))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15491 (_ BitVec 32)) Bool)

(assert (=> b!304568 (= res!162053 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!304569 () Bool)

(declare-fun res!162056 () Bool)

(assert (=> b!304569 (=> (not res!162056) (not e!191337))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304569 (= res!162056 (validKeyInArray!0 k0!2441))))

(assert (= (and start!30432 res!162055) b!304566))

(assert (= (and b!304566 res!162059) b!304569))

(assert (= (and b!304569 res!162056) b!304563))

(assert (= (and b!304563 res!162054) b!304567))

(assert (= (and b!304567 res!162052) b!304568))

(assert (= (and b!304568 res!162053) b!304561))

(assert (= (and b!304561 res!162060) b!304564))

(assert (= (and b!304564 res!162057) b!304565))

(assert (= (and b!304565 res!162058) b!304562))

(declare-fun m!315187 () Bool)

(assert (=> b!304563 m!315187))

(declare-fun m!315189 () Bool)

(assert (=> b!304568 m!315189))

(declare-fun m!315191 () Bool)

(assert (=> b!304567 m!315191))

(declare-fun m!315193 () Bool)

(assert (=> b!304569 m!315193))

(declare-fun m!315195 () Bool)

(assert (=> b!304564 m!315195))

(declare-fun m!315197 () Bool)

(assert (=> b!304562 m!315197))

(assert (=> b!304562 m!315197))

(declare-fun m!315199 () Bool)

(assert (=> b!304562 m!315199))

(declare-fun m!315201 () Bool)

(assert (=> start!30432 m!315201))

(declare-fun m!315203 () Bool)

(assert (=> start!30432 m!315203))

(declare-fun m!315205 () Bool)

(assert (=> b!304565 m!315205))

(declare-fun m!315207 () Bool)

(assert (=> b!304565 m!315207))

(declare-fun m!315209 () Bool)

(assert (=> b!304561 m!315209))

(assert (=> b!304561 m!315209))

(declare-fun m!315211 () Bool)

(assert (=> b!304561 m!315211))

(check-sat (not b!304567) (not b!304568) (not b!304569) (not start!30432) (not b!304565) (not b!304563) (not b!304561) (not b!304562))
(check-sat)
