; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30438 () Bool)

(assert start!30438)

(declare-fun b!304642 () Bool)

(declare-fun e!191375 () Bool)

(declare-fun e!191374 () Bool)

(assert (=> b!304642 (= e!191375 e!191374)))

(declare-fun res!162141 () Bool)

(assert (=> b!304642 (=> (not res!162141) (not e!191374))))

(declare-datatypes ((SeekEntryResult!2474 0))(
  ( (MissingZero!2474 (index!12072 (_ BitVec 32))) (Found!2474 (index!12073 (_ BitVec 32))) (Intermediate!2474 (undefined!3286 Bool) (index!12074 (_ BitVec 32)) (x!30343 (_ BitVec 32))) (Undefined!2474) (MissingVacant!2474 (index!12075 (_ BitVec 32))) )
))
(declare-fun lt!150322 () SeekEntryResult!2474)

(declare-datatypes ((array!15497 0))(
  ( (array!15498 (arr!7335 (Array (_ BitVec 32) (_ BitVec 64))) (size!7688 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15497)

(declare-fun lt!150323 () SeekEntryResult!2474)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!304642 (= res!162141 (and (= lt!150322 lt!150323) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7335 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7335 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7335 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15497 (_ BitVec 32)) SeekEntryResult!2474)

(assert (=> b!304642 (= lt!150322 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!304643 () Bool)

(declare-fun res!162133 () Bool)

(declare-fun e!191372 () Bool)

(assert (=> b!304643 (=> (not res!162133) (not e!191372))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304643 (= res!162133 (validKeyInArray!0 k0!2441))))

(declare-fun b!304644 () Bool)

(declare-fun res!162134 () Bool)

(assert (=> b!304644 (=> (not res!162134) (not e!191372))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!304644 (= res!162134 (and (= (size!7688 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7688 a!3293))))))

(declare-fun b!304646 () Bool)

(declare-fun res!162137 () Bool)

(assert (=> b!304646 (=> (not res!162137) (not e!191372))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15497 (_ BitVec 32)) Bool)

(assert (=> b!304646 (= res!162137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!304647 () Bool)

(assert (=> b!304647 (= e!191372 e!191375)))

(declare-fun res!162138 () Bool)

(assert (=> b!304647 (=> (not res!162138) (not e!191375))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304647 (= res!162138 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150323))))

(assert (=> b!304647 (= lt!150323 (Intermediate!2474 false resIndex!52 resX!52))))

(declare-fun b!304648 () Bool)

(declare-fun res!162140 () Bool)

(assert (=> b!304648 (=> (not res!162140) (not e!191372))))

(declare-fun arrayContainsKey!0 (array!15497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304648 (= res!162140 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304649 () Bool)

(declare-fun res!162136 () Bool)

(assert (=> b!304649 (=> (not res!162136) (not e!191372))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15497 (_ BitVec 32)) SeekEntryResult!2474)

(assert (=> b!304649 (= res!162136 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2474 i!1240)))))

(declare-fun b!304650 () Bool)

(declare-fun res!162135 () Bool)

(assert (=> b!304650 (=> (not res!162135) (not e!191375))))

(assert (=> b!304650 (= res!162135 (and (= (select (arr!7335 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7688 a!3293))))))

(declare-fun res!162139 () Bool)

(assert (=> start!30438 (=> (not res!162139) (not e!191372))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30438 (= res!162139 (validMask!0 mask!3709))))

(assert (=> start!30438 e!191372))

(declare-fun array_inv!5307 (array!15497) Bool)

(assert (=> start!30438 (array_inv!5307 a!3293)))

(assert (=> start!30438 true))

(declare-fun b!304645 () Bool)

(assert (=> b!304645 (= e!191374 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304645 (= lt!150322 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (= (and start!30438 res!162139) b!304644))

(assert (= (and b!304644 res!162134) b!304643))

(assert (= (and b!304643 res!162133) b!304648))

(assert (= (and b!304648 res!162140) b!304649))

(assert (= (and b!304649 res!162136) b!304646))

(assert (= (and b!304646 res!162137) b!304647))

(assert (= (and b!304647 res!162138) b!304650))

(assert (= (and b!304650 res!162135) b!304642))

(assert (= (and b!304642 res!162141) b!304645))

(declare-fun m!315265 () Bool)

(assert (=> b!304646 m!315265))

(declare-fun m!315267 () Bool)

(assert (=> start!30438 m!315267))

(declare-fun m!315269 () Bool)

(assert (=> start!30438 m!315269))

(declare-fun m!315271 () Bool)

(assert (=> b!304645 m!315271))

(assert (=> b!304645 m!315271))

(declare-fun m!315273 () Bool)

(assert (=> b!304645 m!315273))

(declare-fun m!315275 () Bool)

(assert (=> b!304649 m!315275))

(declare-fun m!315277 () Bool)

(assert (=> b!304650 m!315277))

(declare-fun m!315279 () Bool)

(assert (=> b!304648 m!315279))

(declare-fun m!315281 () Bool)

(assert (=> b!304643 m!315281))

(declare-fun m!315283 () Bool)

(assert (=> b!304647 m!315283))

(assert (=> b!304647 m!315283))

(declare-fun m!315285 () Bool)

(assert (=> b!304647 m!315285))

(declare-fun m!315287 () Bool)

(assert (=> b!304642 m!315287))

(declare-fun m!315289 () Bool)

(assert (=> b!304642 m!315289))

(check-sat (not b!304643) (not b!304642) (not b!304648) (not b!304647) (not b!304646) (not b!304645) (not start!30438) (not b!304649))
(check-sat)
