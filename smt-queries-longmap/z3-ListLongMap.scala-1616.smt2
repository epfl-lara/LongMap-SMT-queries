; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30424 () Bool)

(assert start!30424)

(declare-fun b!304539 () Bool)

(declare-fun res!161889 () Bool)

(declare-fun e!191382 () Bool)

(assert (=> b!304539 (=> (not res!161889) (not e!191382))))

(declare-datatypes ((array!15479 0))(
  ( (array!15480 (arr!7326 (Array (_ BitVec 32) (_ BitVec 64))) (size!7678 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15479)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2466 0))(
  ( (MissingZero!2466 (index!12040 (_ BitVec 32))) (Found!2466 (index!12041 (_ BitVec 32))) (Intermediate!2466 (undefined!3278 Bool) (index!12042 (_ BitVec 32)) (x!30300 (_ BitVec 32))) (Undefined!2466) (MissingVacant!2466 (index!12043 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15479 (_ BitVec 32)) SeekEntryResult!2466)

(assert (=> b!304539 (= res!161889 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2466 i!1240)))))

(declare-fun b!304540 () Bool)

(declare-fun res!161885 () Bool)

(assert (=> b!304540 (=> (not res!161885) (not e!191382))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304540 (= res!161885 (validKeyInArray!0 k0!2441))))

(declare-fun b!304541 () Bool)

(declare-fun e!191383 () Bool)

(declare-fun e!191381 () Bool)

(assert (=> b!304541 (= e!191383 e!191381)))

(declare-fun res!161887 () Bool)

(assert (=> b!304541 (=> (not res!161887) (not e!191381))))

(declare-fun lt!150474 () SeekEntryResult!2466)

(declare-fun lt!150473 () SeekEntryResult!2466)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!304541 (= res!161887 (and (= lt!150473 lt!150474) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7326 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7326 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7326 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15479 (_ BitVec 32)) SeekEntryResult!2466)

(assert (=> b!304541 (= lt!150473 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!304542 () Bool)

(assert (=> b!304542 (= e!191382 e!191383)))

(declare-fun res!161888 () Bool)

(assert (=> b!304542 (=> (not res!161888) (not e!191383))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304542 (= res!161888 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150474))))

(assert (=> b!304542 (= lt!150474 (Intermediate!2466 false resIndex!52 resX!52))))

(declare-fun b!304543 () Bool)

(declare-fun res!161884 () Bool)

(assert (=> b!304543 (=> (not res!161884) (not e!191382))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15479 (_ BitVec 32)) Bool)

(assert (=> b!304543 (= res!161884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!161891 () Bool)

(assert (=> start!30424 (=> (not res!161891) (not e!191382))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30424 (= res!161891 (validMask!0 mask!3709))))

(assert (=> start!30424 e!191382))

(declare-fun array_inv!5289 (array!15479) Bool)

(assert (=> start!30424 (array_inv!5289 a!3293)))

(assert (=> start!30424 true))

(declare-fun b!304544 () Bool)

(assert (=> b!304544 (= e!191381 (not (bvsge mask!3709 #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304544 (= lt!150473 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!304545 () Bool)

(declare-fun res!161890 () Bool)

(assert (=> b!304545 (=> (not res!161890) (not e!191383))))

(assert (=> b!304545 (= res!161890 (and (= (select (arr!7326 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7678 a!3293))))))

(declare-fun b!304546 () Bool)

(declare-fun res!161892 () Bool)

(assert (=> b!304546 (=> (not res!161892) (not e!191382))))

(declare-fun arrayContainsKey!0 (array!15479 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304546 (= res!161892 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304547 () Bool)

(declare-fun res!161886 () Bool)

(assert (=> b!304547 (=> (not res!161886) (not e!191382))))

(assert (=> b!304547 (= res!161886 (and (= (size!7678 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7678 a!3293))))))

(assert (= (and start!30424 res!161891) b!304547))

(assert (= (and b!304547 res!161886) b!304540))

(assert (= (and b!304540 res!161885) b!304546))

(assert (= (and b!304546 res!161892) b!304539))

(assert (= (and b!304539 res!161889) b!304543))

(assert (= (and b!304543 res!161884) b!304542))

(assert (= (and b!304542 res!161888) b!304545))

(assert (= (and b!304545 res!161890) b!304541))

(assert (= (and b!304541 res!161887) b!304544))

(declare-fun m!315631 () Bool)

(assert (=> b!304545 m!315631))

(declare-fun m!315633 () Bool)

(assert (=> b!304546 m!315633))

(declare-fun m!315635 () Bool)

(assert (=> start!30424 m!315635))

(declare-fun m!315637 () Bool)

(assert (=> start!30424 m!315637))

(declare-fun m!315639 () Bool)

(assert (=> b!304539 m!315639))

(declare-fun m!315641 () Bool)

(assert (=> b!304543 m!315641))

(declare-fun m!315643 () Bool)

(assert (=> b!304540 m!315643))

(declare-fun m!315645 () Bool)

(assert (=> b!304542 m!315645))

(assert (=> b!304542 m!315645))

(declare-fun m!315647 () Bool)

(assert (=> b!304542 m!315647))

(declare-fun m!315649 () Bool)

(assert (=> b!304544 m!315649))

(assert (=> b!304544 m!315649))

(declare-fun m!315651 () Bool)

(assert (=> b!304544 m!315651))

(declare-fun m!315653 () Bool)

(assert (=> b!304541 m!315653))

(declare-fun m!315655 () Bool)

(assert (=> b!304541 m!315655))

(check-sat (not b!304546) (not b!304541) (not b!304540) (not b!304542) (not b!304544) (not b!304539) (not start!30424) (not b!304543))
(check-sat)
