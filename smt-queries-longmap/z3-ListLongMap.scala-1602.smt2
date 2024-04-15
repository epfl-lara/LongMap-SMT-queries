; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30270 () Bool)

(assert start!30270)

(declare-fun b!302851 () Bool)

(declare-fun res!160490 () Bool)

(declare-fun e!190691 () Bool)

(assert (=> b!302851 (=> (not res!160490) (not e!190691))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2417 0))(
  ( (MissingZero!2417 (index!11844 (_ BitVec 32))) (Found!2417 (index!11845 (_ BitVec 32))) (Intermediate!2417 (undefined!3229 Bool) (index!11846 (_ BitVec 32)) (x!30125 (_ BitVec 32))) (Undefined!2417) (MissingVacant!2417 (index!11847 (_ BitVec 32))) )
))
(declare-fun lt!149936 () SeekEntryResult!2417)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((array!15380 0))(
  ( (array!15381 (arr!7278 (Array (_ BitVec 32) (_ BitVec 64))) (size!7631 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15380)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15380 (_ BitVec 32)) SeekEntryResult!2417)

(assert (=> b!302851 (= res!160490 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!149936))))

(declare-fun b!302852 () Bool)

(declare-fun res!160484 () Bool)

(declare-fun e!190689 () Bool)

(assert (=> b!302852 (=> (not res!160484) (not e!190689))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302852 (= res!160484 (validKeyInArray!0 k0!2441))))

(declare-fun b!302853 () Bool)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!302853 (= e!190691 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7278 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7278 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7278 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(declare-fun b!302854 () Bool)

(declare-fun res!160489 () Bool)

(assert (=> b!302854 (=> (not res!160489) (not e!190689))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!302854 (= res!160489 (and (= (size!7631 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7631 a!3293))))))

(declare-fun b!302855 () Bool)

(declare-fun res!160491 () Bool)

(assert (=> b!302855 (=> (not res!160491) (not e!190689))))

(declare-fun arrayContainsKey!0 (array!15380 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302855 (= res!160491 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302856 () Bool)

(declare-fun res!160488 () Bool)

(assert (=> b!302856 (=> (not res!160488) (not e!190689))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15380 (_ BitVec 32)) SeekEntryResult!2417)

(assert (=> b!302856 (= res!160488 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2417 i!1240)))))

(declare-fun b!302857 () Bool)

(declare-fun res!160487 () Bool)

(assert (=> b!302857 (=> (not res!160487) (not e!190689))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15380 (_ BitVec 32)) Bool)

(assert (=> b!302857 (= res!160487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!302858 () Bool)

(declare-fun res!160485 () Bool)

(assert (=> b!302858 (=> (not res!160485) (not e!190691))))

(assert (=> b!302858 (= res!160485 (and (= (select (arr!7278 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7631 a!3293))))))

(declare-fun res!160486 () Bool)

(assert (=> start!30270 (=> (not res!160486) (not e!190689))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30270 (= res!160486 (validMask!0 mask!3709))))

(assert (=> start!30270 e!190689))

(declare-fun array_inv!5250 (array!15380) Bool)

(assert (=> start!30270 (array_inv!5250 a!3293)))

(assert (=> start!30270 true))

(declare-fun b!302859 () Bool)

(assert (=> b!302859 (= e!190689 e!190691)))

(declare-fun res!160483 () Bool)

(assert (=> b!302859 (=> (not res!160483) (not e!190691))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302859 (= res!160483 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!149936))))

(assert (=> b!302859 (= lt!149936 (Intermediate!2417 false resIndex!52 resX!52))))

(assert (= (and start!30270 res!160486) b!302854))

(assert (= (and b!302854 res!160489) b!302852))

(assert (= (and b!302852 res!160484) b!302855))

(assert (= (and b!302855 res!160491) b!302856))

(assert (= (and b!302856 res!160488) b!302857))

(assert (= (and b!302857 res!160487) b!302859))

(assert (= (and b!302859 res!160483) b!302858))

(assert (= (and b!302858 res!160485) b!302851))

(assert (= (and b!302851 res!160490) b!302853))

(declare-fun m!313801 () Bool)

(assert (=> b!302859 m!313801))

(assert (=> b!302859 m!313801))

(declare-fun m!313803 () Bool)

(assert (=> b!302859 m!313803))

(declare-fun m!313805 () Bool)

(assert (=> b!302857 m!313805))

(declare-fun m!313807 () Bool)

(assert (=> b!302853 m!313807))

(declare-fun m!313809 () Bool)

(assert (=> b!302856 m!313809))

(declare-fun m!313811 () Bool)

(assert (=> b!302858 m!313811))

(declare-fun m!313813 () Bool)

(assert (=> b!302852 m!313813))

(declare-fun m!313815 () Bool)

(assert (=> b!302855 m!313815))

(declare-fun m!313817 () Bool)

(assert (=> start!30270 m!313817))

(declare-fun m!313819 () Bool)

(assert (=> start!30270 m!313819))

(declare-fun m!313821 () Bool)

(assert (=> b!302851 m!313821))

(check-sat (not b!302852) (not b!302856) (not b!302855) (not start!30270) (not b!302859) (not b!302857) (not b!302851))
(check-sat)
