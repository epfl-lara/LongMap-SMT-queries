; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30882 () Bool)

(assert start!30882)

(declare-fun b!309709 () Bool)

(declare-fun res!166310 () Bool)

(declare-fun e!193419 () Bool)

(assert (=> b!309709 (=> (not res!166310) (not e!193419))))

(declare-datatypes ((array!15788 0))(
  ( (array!15789 (arr!7476 (Array (_ BitVec 32) (_ BitVec 64))) (size!7829 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15788)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!309709 (= res!166310 (and (= (select (arr!7476 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7829 a!3293))))))

(declare-fun b!309710 () Bool)

(declare-fun e!193421 () Bool)

(assert (=> b!309710 (= e!193421 e!193419)))

(declare-fun res!166312 () Bool)

(assert (=> b!309710 (=> (not res!166312) (not e!193419))))

(declare-datatypes ((SeekEntryResult!2615 0))(
  ( (MissingZero!2615 (index!12636 (_ BitVec 32))) (Found!2615 (index!12637 (_ BitVec 32))) (Intermediate!2615 (undefined!3427 Bool) (index!12638 (_ BitVec 32)) (x!30887 (_ BitVec 32))) (Undefined!2615) (MissingVacant!2615 (index!12639 (_ BitVec 32))) )
))
(declare-fun lt!151549 () SeekEntryResult!2615)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15788 (_ BitVec 32)) SeekEntryResult!2615)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309710 (= res!166312 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151549))))

(assert (=> b!309710 (= lt!151549 (Intermediate!2615 false resIndex!52 resX!52))))

(declare-fun b!309711 () Bool)

(declare-fun res!166314 () Bool)

(assert (=> b!309711 (=> (not res!166314) (not e!193421))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309711 (= res!166314 (validKeyInArray!0 k0!2441))))

(declare-fun b!309712 () Bool)

(declare-fun res!166309 () Bool)

(assert (=> b!309712 (=> (not res!166309) (not e!193421))))

(assert (=> b!309712 (= res!166309 (and (= (size!7829 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7829 a!3293))))))

(declare-fun b!309713 () Bool)

(declare-fun res!166316 () Bool)

(assert (=> b!309713 (=> (not res!166316) (not e!193421))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15788 (_ BitVec 32)) SeekEntryResult!2615)

(assert (=> b!309713 (= res!166316 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2615 i!1240)))))

(declare-fun b!309714 () Bool)

(declare-fun e!193418 () Bool)

(assert (=> b!309714 (= e!193419 e!193418)))

(declare-fun res!166315 () Bool)

(assert (=> b!309714 (=> (not res!166315) (not e!193418))))

(declare-fun lt!151550 () SeekEntryResult!2615)

(assert (=> b!309714 (= res!166315 (and (= lt!151550 lt!151549) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7476 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!309714 (= lt!151550 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!309715 () Bool)

(declare-fun res!166317 () Bool)

(assert (=> b!309715 (=> (not res!166317) (not e!193421))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15788 (_ BitVec 32)) Bool)

(assert (=> b!309715 (= res!166317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!309716 () Bool)

(declare-fun res!166313 () Bool)

(assert (=> b!309716 (=> (not res!166313) (not e!193421))))

(declare-fun arrayContainsKey!0 (array!15788 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309716 (= res!166313 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!309717 () Bool)

(assert (=> b!309717 (= e!193418 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309717 (= lt!151550 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun res!166311 () Bool)

(assert (=> start!30882 (=> (not res!166311) (not e!193421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30882 (= res!166311 (validMask!0 mask!3709))))

(assert (=> start!30882 e!193421))

(declare-fun array_inv!5448 (array!15788) Bool)

(assert (=> start!30882 (array_inv!5448 a!3293)))

(assert (=> start!30882 true))

(assert (= (and start!30882 res!166311) b!309712))

(assert (= (and b!309712 res!166309) b!309711))

(assert (= (and b!309711 res!166314) b!309716))

(assert (= (and b!309716 res!166313) b!309713))

(assert (= (and b!309713 res!166316) b!309715))

(assert (= (and b!309715 res!166317) b!309710))

(assert (= (and b!309710 res!166312) b!309709))

(assert (= (and b!309709 res!166310) b!309714))

(assert (= (and b!309714 res!166315) b!309717))

(declare-fun m!319141 () Bool)

(assert (=> b!309713 m!319141))

(declare-fun m!319143 () Bool)

(assert (=> b!309717 m!319143))

(assert (=> b!309717 m!319143))

(declare-fun m!319145 () Bool)

(assert (=> b!309717 m!319145))

(declare-fun m!319147 () Bool)

(assert (=> b!309710 m!319147))

(assert (=> b!309710 m!319147))

(declare-fun m!319149 () Bool)

(assert (=> b!309710 m!319149))

(declare-fun m!319151 () Bool)

(assert (=> b!309714 m!319151))

(declare-fun m!319153 () Bool)

(assert (=> b!309714 m!319153))

(declare-fun m!319155 () Bool)

(assert (=> start!30882 m!319155))

(declare-fun m!319157 () Bool)

(assert (=> start!30882 m!319157))

(declare-fun m!319159 () Bool)

(assert (=> b!309715 m!319159))

(declare-fun m!319161 () Bool)

(assert (=> b!309709 m!319161))

(declare-fun m!319163 () Bool)

(assert (=> b!309716 m!319163))

(declare-fun m!319165 () Bool)

(assert (=> b!309711 m!319165))

(check-sat (not b!309717) (not b!309716) (not start!30882) (not b!309713) (not b!309715) (not b!309714) (not b!309711) (not b!309710))
(check-sat)
