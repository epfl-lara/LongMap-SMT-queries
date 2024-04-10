; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32130 () Bool)

(assert start!32130)

(declare-fun b!320220 () Bool)

(declare-fun res!174463 () Bool)

(declare-fun e!198747 () Bool)

(assert (=> b!320220 (=> (not res!174463) (not e!198747))))

(declare-datatypes ((array!16365 0))(
  ( (array!16366 (arr!7743 (Array (_ BitVec 32) (_ BitVec 64))) (size!8095 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16365)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2874 0))(
  ( (MissingZero!2874 (index!13672 (_ BitVec 32))) (Found!2874 (index!13673 (_ BitVec 32))) (Intermediate!2874 (undefined!3686 Bool) (index!13674 (_ BitVec 32)) (x!31943 (_ BitVec 32))) (Undefined!2874) (MissingVacant!2874 (index!13675 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16365 (_ BitVec 32)) SeekEntryResult!2874)

(assert (=> b!320220 (= res!174463 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2874 i!1250)))))

(declare-fun b!320221 () Bool)

(declare-fun res!174468 () Bool)

(assert (=> b!320221 (=> (not res!174468) (not e!198747))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16365 (_ BitVec 32)) Bool)

(assert (=> b!320221 (= res!174468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!320222 () Bool)

(declare-fun res!174465 () Bool)

(assert (=> b!320222 (=> (not res!174465) (not e!198747))))

(declare-fun arrayContainsKey!0 (array!16365 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320222 (= res!174465 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320223 () Bool)

(declare-fun res!174467 () Bool)

(assert (=> b!320223 (=> (not res!174467) (not e!198747))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320223 (= res!174467 (validKeyInArray!0 k0!2497))))

(declare-fun b!320224 () Bool)

(declare-fun res!174464 () Bool)

(assert (=> b!320224 (=> (not res!174464) (not e!198747))))

(assert (=> b!320224 (= res!174464 (and (= (size!8095 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8095 a!3305))))))

(declare-fun b!320225 () Bool)

(assert (=> b!320225 (= e!198747 false)))

(declare-fun lt!156000 () SeekEntryResult!2874)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16365 (_ BitVec 32)) SeekEntryResult!2874)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320225 (= lt!156000 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun res!174466 () Bool)

(assert (=> start!32130 (=> (not res!174466) (not e!198747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32130 (= res!174466 (validMask!0 mask!3777))))

(assert (=> start!32130 e!198747))

(assert (=> start!32130 true))

(declare-fun array_inv!5706 (array!16365) Bool)

(assert (=> start!32130 (array_inv!5706 a!3305)))

(assert (= (and start!32130 res!174466) b!320224))

(assert (= (and b!320224 res!174464) b!320223))

(assert (= (and b!320223 res!174467) b!320222))

(assert (= (and b!320222 res!174465) b!320220))

(assert (= (and b!320220 res!174463) b!320221))

(assert (= (and b!320221 res!174468) b!320225))

(declare-fun m!328629 () Bool)

(assert (=> b!320221 m!328629))

(declare-fun m!328631 () Bool)

(assert (=> b!320222 m!328631))

(declare-fun m!328633 () Bool)

(assert (=> b!320220 m!328633))

(declare-fun m!328635 () Bool)

(assert (=> b!320225 m!328635))

(assert (=> b!320225 m!328635))

(declare-fun m!328637 () Bool)

(assert (=> b!320225 m!328637))

(declare-fun m!328639 () Bool)

(assert (=> start!32130 m!328639))

(declare-fun m!328641 () Bool)

(assert (=> start!32130 m!328641))

(declare-fun m!328643 () Bool)

(assert (=> b!320223 m!328643))

(check-sat (not b!320221) (not b!320220) (not start!32130) (not b!320222) (not b!320225) (not b!320223))
(check-sat)
