; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31018 () Bool)

(assert start!31018)

(declare-fun b!311807 () Bool)

(declare-fun res!168268 () Bool)

(declare-fun e!194503 () Bool)

(assert (=> b!311807 (=> (not res!168268) (not e!194503))))

(declare-datatypes ((array!15920 0))(
  ( (array!15921 (arr!7542 (Array (_ BitVec 32) (_ BitVec 64))) (size!7894 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15920)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!311807 (= res!168268 (and (= (size!7894 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7894 a!3293))))))

(declare-fun b!311808 () Bool)

(declare-fun res!168266 () Bool)

(assert (=> b!311808 (=> (not res!168266) (not e!194503))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2682 0))(
  ( (MissingZero!2682 (index!12904 (_ BitVec 32))) (Found!2682 (index!12905 (_ BitVec 32))) (Intermediate!2682 (undefined!3494 Bool) (index!12906 (_ BitVec 32)) (x!31119 (_ BitVec 32))) (Undefined!2682) (MissingVacant!2682 (index!12907 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15920 (_ BitVec 32)) SeekEntryResult!2682)

(assert (=> b!311808 (= res!168266 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2682 i!1240)))))

(declare-fun res!168262 () Bool)

(assert (=> start!31018 (=> (not res!168262) (not e!194503))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31018 (= res!168262 (validMask!0 mask!3709))))

(assert (=> start!31018 e!194503))

(declare-fun array_inv!5505 (array!15920) Bool)

(assert (=> start!31018 (array_inv!5505 a!3293)))

(assert (=> start!31018 true))

(declare-fun b!311809 () Bool)

(declare-fun res!168267 () Bool)

(assert (=> b!311809 (=> (not res!168267) (not e!194503))))

(declare-fun arrayContainsKey!0 (array!15920 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311809 (= res!168267 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311810 () Bool)

(declare-fun e!194502 () Bool)

(assert (=> b!311810 (= e!194503 e!194502)))

(declare-fun res!168264 () Bool)

(assert (=> b!311810 (=> (not res!168264) (not e!194502))))

(declare-fun lt!152525 () SeekEntryResult!2682)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15920 (_ BitVec 32)) SeekEntryResult!2682)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311810 (= res!168264 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152525))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!311810 (= lt!152525 (Intermediate!2682 false resIndex!52 resX!52))))

(declare-fun b!311811 () Bool)

(declare-fun e!194505 () Bool)

(assert (=> b!311811 (= e!194505 true)))

(declare-fun lt!152527 () SeekEntryResult!2682)

(declare-fun lt!152522 () SeekEntryResult!2682)

(assert (=> b!311811 (= lt!152527 lt!152522)))

(declare-datatypes ((Unit!9595 0))(
  ( (Unit!9596) )
))
(declare-fun lt!152526 () Unit!9595)

(declare-fun lt!152523 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15920 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9595)

(assert (=> b!311811 (= lt!152526 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152523 resIndex!52 resX!52 mask!3709))))

(declare-fun b!311812 () Bool)

(declare-fun e!194506 () Bool)

(assert (=> b!311812 (= e!194502 e!194506)))

(declare-fun res!168269 () Bool)

(assert (=> b!311812 (=> (not res!168269) (not e!194506))))

(declare-fun lt!152528 () SeekEntryResult!2682)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!311812 (= res!168269 (and (= lt!152528 lt!152525) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7542 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311812 (= lt!152528 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!311813 () Bool)

(declare-fun res!168263 () Bool)

(assert (=> b!311813 (=> (not res!168263) (not e!194503))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15920 (_ BitVec 32)) Bool)

(assert (=> b!311813 (= res!168263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311814 () Bool)

(declare-fun res!168265 () Bool)

(assert (=> b!311814 (=> (not res!168265) (not e!194502))))

(assert (=> b!311814 (= res!168265 (and (= (select (arr!7542 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7894 a!3293))))))

(declare-fun b!311815 () Bool)

(declare-fun res!168261 () Bool)

(assert (=> b!311815 (=> (not res!168261) (not e!194503))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311815 (= res!168261 (validKeyInArray!0 k0!2441))))

(declare-fun b!311816 () Bool)

(assert (=> b!311816 (= e!194506 (not e!194505))))

(declare-fun res!168270 () Bool)

(assert (=> b!311816 (=> res!168270 e!194505)))

(assert (=> b!311816 (= res!168270 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152523 #b00000000000000000000000000000000) (bvsge lt!152523 (size!7894 a!3293)) (not (= lt!152522 lt!152525))))))

(declare-fun lt!152529 () SeekEntryResult!2682)

(assert (=> b!311816 (= lt!152529 lt!152527)))

(declare-fun lt!152524 () array!15920)

(assert (=> b!311816 (= lt!152527 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152523 k0!2441 lt!152524 mask!3709))))

(assert (=> b!311816 (= lt!152529 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152524 mask!3709))))

(assert (=> b!311816 (= lt!152524 (array!15921 (store (arr!7542 a!3293) i!1240 k0!2441) (size!7894 a!3293)))))

(assert (=> b!311816 (= lt!152528 lt!152522)))

(assert (=> b!311816 (= lt!152522 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152523 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311816 (= lt!152523 (nextIndex!0 index!1781 x!1427 mask!3709))))

(assert (= (and start!31018 res!168262) b!311807))

(assert (= (and b!311807 res!168268) b!311815))

(assert (= (and b!311815 res!168261) b!311809))

(assert (= (and b!311809 res!168267) b!311808))

(assert (= (and b!311808 res!168266) b!311813))

(assert (= (and b!311813 res!168263) b!311810))

(assert (= (and b!311810 res!168264) b!311814))

(assert (= (and b!311814 res!168265) b!311812))

(assert (= (and b!311812 res!168269) b!311816))

(assert (= (and b!311816 (not res!168270)) b!311811))

(declare-fun m!321807 () Bool)

(assert (=> start!31018 m!321807))

(declare-fun m!321809 () Bool)

(assert (=> start!31018 m!321809))

(declare-fun m!321811 () Bool)

(assert (=> b!311813 m!321811))

(declare-fun m!321813 () Bool)

(assert (=> b!311809 m!321813))

(declare-fun m!321815 () Bool)

(assert (=> b!311814 m!321815))

(declare-fun m!321817 () Bool)

(assert (=> b!311810 m!321817))

(assert (=> b!311810 m!321817))

(declare-fun m!321819 () Bool)

(assert (=> b!311810 m!321819))

(declare-fun m!321821 () Bool)

(assert (=> b!311811 m!321821))

(declare-fun m!321823 () Bool)

(assert (=> b!311816 m!321823))

(declare-fun m!321825 () Bool)

(assert (=> b!311816 m!321825))

(declare-fun m!321827 () Bool)

(assert (=> b!311816 m!321827))

(declare-fun m!321829 () Bool)

(assert (=> b!311816 m!321829))

(declare-fun m!321831 () Bool)

(assert (=> b!311816 m!321831))

(declare-fun m!321833 () Bool)

(assert (=> b!311808 m!321833))

(declare-fun m!321835 () Bool)

(assert (=> b!311815 m!321835))

(declare-fun m!321837 () Bool)

(assert (=> b!311812 m!321837))

(declare-fun m!321839 () Bool)

(assert (=> b!311812 m!321839))

(check-sat (not b!311813) (not b!311816) (not b!311808) (not b!311815) (not b!311811) (not b!311812) (not b!311809) (not start!31018) (not b!311810))
(check-sat)
