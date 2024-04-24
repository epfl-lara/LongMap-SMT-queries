; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30780 () Bool)

(assert start!30780)

(declare-fun b!309040 () Bool)

(declare-fun res!165710 () Bool)

(declare-fun e!193127 () Bool)

(assert (=> b!309040 (=> (not res!165710) (not e!193127))))

(declare-datatypes ((array!15746 0))(
  ( (array!15747 (arr!7456 (Array (_ BitVec 32) (_ BitVec 64))) (size!7808 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15746)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2561 0))(
  ( (MissingZero!2561 (index!12420 (_ BitVec 32))) (Found!2561 (index!12421 (_ BitVec 32))) (Intermediate!2561 (undefined!3373 Bool) (index!12422 (_ BitVec 32)) (x!30762 (_ BitVec 32))) (Undefined!2561) (MissingVacant!2561 (index!12423 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15746 (_ BitVec 32)) SeekEntryResult!2561)

(assert (=> b!309040 (= res!165710 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2561 i!1240)))))

(declare-fun b!309041 () Bool)

(declare-fun res!165705 () Bool)

(assert (=> b!309041 (=> (not res!165705) (not e!193127))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309041 (= res!165705 (validKeyInArray!0 k0!2441))))

(declare-fun b!309042 () Bool)

(declare-fun e!193125 () Bool)

(assert (=> b!309042 (= e!193125 (not (bvsge mask!3709 #b00000000000000000000000000000000)))))

(declare-fun lt!151530 () SeekEntryResult!2561)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15746 (_ BitVec 32)) SeekEntryResult!2561)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309042 (= lt!151530 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun res!165709 () Bool)

(assert (=> start!30780 (=> (not res!165709) (not e!193127))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30780 (= res!165709 (validMask!0 mask!3709))))

(assert (=> start!30780 e!193127))

(declare-fun array_inv!5406 (array!15746) Bool)

(assert (=> start!30780 (array_inv!5406 a!3293)))

(assert (=> start!30780 true))

(declare-fun b!309043 () Bool)

(declare-fun e!193126 () Bool)

(assert (=> b!309043 (= e!193126 e!193125)))

(declare-fun res!165711 () Bool)

(assert (=> b!309043 (=> (not res!165711) (not e!193125))))

(declare-fun lt!151529 () SeekEntryResult!2561)

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!309043 (= res!165711 (and (= lt!151530 lt!151529) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7456 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!309043 (= lt!151530 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!309044 () Bool)

(declare-fun res!165704 () Bool)

(assert (=> b!309044 (=> (not res!165704) (not e!193127))))

(assert (=> b!309044 (= res!165704 (and (= (size!7808 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7808 a!3293))))))

(declare-fun b!309045 () Bool)

(declare-fun res!165706 () Bool)

(assert (=> b!309045 (=> (not res!165706) (not e!193127))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15746 (_ BitVec 32)) Bool)

(assert (=> b!309045 (= res!165706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!309046 () Bool)

(assert (=> b!309046 (= e!193127 e!193126)))

(declare-fun res!165707 () Bool)

(assert (=> b!309046 (=> (not res!165707) (not e!193126))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309046 (= res!165707 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151529))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!309046 (= lt!151529 (Intermediate!2561 false resIndex!52 resX!52))))

(declare-fun b!309047 () Bool)

(declare-fun res!165703 () Bool)

(assert (=> b!309047 (=> (not res!165703) (not e!193127))))

(declare-fun arrayContainsKey!0 (array!15746 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309047 (= res!165703 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!309048 () Bool)

(declare-fun res!165708 () Bool)

(assert (=> b!309048 (=> (not res!165708) (not e!193126))))

(assert (=> b!309048 (= res!165708 (and (= (select (arr!7456 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7808 a!3293))))))

(assert (= (and start!30780 res!165709) b!309044))

(assert (= (and b!309044 res!165704) b!309041))

(assert (= (and b!309041 res!165705) b!309047))

(assert (= (and b!309047 res!165703) b!309040))

(assert (= (and b!309040 res!165710) b!309045))

(assert (= (and b!309045 res!165706) b!309046))

(assert (= (and b!309046 res!165707) b!309048))

(assert (= (and b!309048 res!165708) b!309043))

(assert (= (and b!309043 res!165711) b!309042))

(declare-fun m!319237 () Bool)

(assert (=> b!309040 m!319237))

(declare-fun m!319239 () Bool)

(assert (=> b!309047 m!319239))

(declare-fun m!319241 () Bool)

(assert (=> b!309048 m!319241))

(declare-fun m!319243 () Bool)

(assert (=> b!309042 m!319243))

(assert (=> b!309042 m!319243))

(declare-fun m!319245 () Bool)

(assert (=> b!309042 m!319245))

(declare-fun m!319247 () Bool)

(assert (=> start!30780 m!319247))

(declare-fun m!319249 () Bool)

(assert (=> start!30780 m!319249))

(declare-fun m!319251 () Bool)

(assert (=> b!309041 m!319251))

(declare-fun m!319253 () Bool)

(assert (=> b!309046 m!319253))

(assert (=> b!309046 m!319253))

(declare-fun m!319255 () Bool)

(assert (=> b!309046 m!319255))

(declare-fun m!319257 () Bool)

(assert (=> b!309043 m!319257))

(declare-fun m!319259 () Bool)

(assert (=> b!309043 m!319259))

(declare-fun m!319261 () Bool)

(assert (=> b!309045 m!319261))

(check-sat (not b!309042) (not b!309040) (not start!30780) (not b!309045) (not b!309041) (not b!309047) (not b!309046) (not b!309043))
(check-sat)
