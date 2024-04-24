; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30654 () Bool)

(assert start!30654)

(declare-fun b!307809 () Bool)

(declare-fun res!164616 () Bool)

(declare-fun e!192604 () Bool)

(assert (=> b!307809 (=> (not res!164616) (not e!192604))))

(declare-datatypes ((array!15671 0))(
  ( (array!15672 (arr!7420 (Array (_ BitVec 32) (_ BitVec 64))) (size!7772 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15671)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2525 0))(
  ( (MissingZero!2525 (index!12276 (_ BitVec 32))) (Found!2525 (index!12277 (_ BitVec 32))) (Intermediate!2525 (undefined!3337 Bool) (index!12278 (_ BitVec 32)) (x!30621 (_ BitVec 32))) (Undefined!2525) (MissingVacant!2525 (index!12279 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15671 (_ BitVec 32)) SeekEntryResult!2525)

(assert (=> b!307809 (= res!164616 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2525 i!1240)))))

(declare-fun b!307810 () Bool)

(declare-fun e!192605 () Bool)

(assert (=> b!307810 (= e!192605 (bvslt mask!3709 #b00000000000000000000000000000000))))

(declare-fun lt!151209 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307810 (= lt!151209 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!307811 () Bool)

(declare-fun res!164622 () Bool)

(assert (=> b!307811 (=> (not res!164622) (not e!192605))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!307811 (= res!164622 (and (= (select (arr!7420 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7772 a!3293))))))

(declare-fun b!307813 () Bool)

(assert (=> b!307813 (= e!192604 e!192605)))

(declare-fun res!164615 () Bool)

(assert (=> b!307813 (=> (not res!164615) (not e!192605))))

(declare-fun lt!151208 () SeekEntryResult!2525)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15671 (_ BitVec 32)) SeekEntryResult!2525)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307813 (= res!164615 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151208))))

(assert (=> b!307813 (= lt!151208 (Intermediate!2525 false resIndex!52 resX!52))))

(declare-fun b!307814 () Bool)

(declare-fun res!164620 () Bool)

(assert (=> b!307814 (=> (not res!164620) (not e!192605))))

(assert (=> b!307814 (= res!164620 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7420 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun b!307815 () Bool)

(declare-fun res!164614 () Bool)

(assert (=> b!307815 (=> (not res!164614) (not e!192604))))

(assert (=> b!307815 (= res!164614 (and (= (size!7772 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7772 a!3293))))))

(declare-fun b!307816 () Bool)

(declare-fun res!164618 () Bool)

(assert (=> b!307816 (=> (not res!164618) (not e!192604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15671 (_ BitVec 32)) Bool)

(assert (=> b!307816 (= res!164618 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307812 () Bool)

(declare-fun res!164617 () Bool)

(assert (=> b!307812 (=> (not res!164617) (not e!192604))))

(declare-fun arrayContainsKey!0 (array!15671 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307812 (= res!164617 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!164613 () Bool)

(assert (=> start!30654 (=> (not res!164613) (not e!192604))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30654 (= res!164613 (validMask!0 mask!3709))))

(assert (=> start!30654 e!192604))

(declare-fun array_inv!5370 (array!15671) Bool)

(assert (=> start!30654 (array_inv!5370 a!3293)))

(assert (=> start!30654 true))

(declare-fun b!307817 () Bool)

(declare-fun res!164619 () Bool)

(assert (=> b!307817 (=> (not res!164619) (not e!192605))))

(assert (=> b!307817 (= res!164619 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!151208))))

(declare-fun b!307818 () Bool)

(declare-fun res!164621 () Bool)

(assert (=> b!307818 (=> (not res!164621) (not e!192604))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307818 (= res!164621 (validKeyInArray!0 k0!2441))))

(assert (= (and start!30654 res!164613) b!307815))

(assert (= (and b!307815 res!164614) b!307818))

(assert (= (and b!307818 res!164621) b!307812))

(assert (= (and b!307812 res!164617) b!307809))

(assert (= (and b!307809 res!164616) b!307816))

(assert (= (and b!307816 res!164618) b!307813))

(assert (= (and b!307813 res!164615) b!307811))

(assert (= (and b!307811 res!164622) b!307817))

(assert (= (and b!307817 res!164619) b!307814))

(assert (= (and b!307814 res!164620) b!307810))

(declare-fun m!318211 () Bool)

(assert (=> start!30654 m!318211))

(declare-fun m!318213 () Bool)

(assert (=> start!30654 m!318213))

(declare-fun m!318215 () Bool)

(assert (=> b!307816 m!318215))

(declare-fun m!318217 () Bool)

(assert (=> b!307812 m!318217))

(declare-fun m!318219 () Bool)

(assert (=> b!307809 m!318219))

(declare-fun m!318221 () Bool)

(assert (=> b!307811 m!318221))

(declare-fun m!318223 () Bool)

(assert (=> b!307814 m!318223))

(declare-fun m!318225 () Bool)

(assert (=> b!307818 m!318225))

(declare-fun m!318227 () Bool)

(assert (=> b!307813 m!318227))

(assert (=> b!307813 m!318227))

(declare-fun m!318229 () Bool)

(assert (=> b!307813 m!318229))

(declare-fun m!318231 () Bool)

(assert (=> b!307810 m!318231))

(declare-fun m!318233 () Bool)

(assert (=> b!307817 m!318233))

(check-sat (not b!307809) (not b!307816) (not b!307813) (not b!307810) (not b!307812) (not b!307818) (not b!307817) (not start!30654))
(check-sat)
