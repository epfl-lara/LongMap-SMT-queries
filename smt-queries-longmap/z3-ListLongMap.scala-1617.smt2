; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30414 () Bool)

(assert start!30414)

(declare-fun b!304540 () Bool)

(declare-fun e!191372 () Bool)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!304540 (= e!191372 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(declare-datatypes ((array!15482 0))(
  ( (array!15483 (arr!7327 (Array (_ BitVec 32) (_ BitVec 64))) (size!7679 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15482)

(declare-datatypes ((SeekEntryResult!2432 0))(
  ( (MissingZero!2432 (index!11904 (_ BitVec 32))) (Found!2432 (index!11905 (_ BitVec 32))) (Intermediate!2432 (undefined!3244 Bool) (index!11906 (_ BitVec 32)) (x!30271 (_ BitVec 32))) (Undefined!2432) (MissingVacant!2432 (index!11907 (_ BitVec 32))) )
))
(declare-fun lt!150503 () SeekEntryResult!2432)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15482 (_ BitVec 32)) SeekEntryResult!2432)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304540 (= lt!150503 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!304541 () Bool)

(declare-fun res!161943 () Bool)

(declare-fun e!191371 () Bool)

(assert (=> b!304541 (=> (not res!161943) (not e!191371))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304541 (= res!161943 (validKeyInArray!0 k0!2441))))

(declare-fun b!304542 () Bool)

(declare-fun res!161937 () Bool)

(assert (=> b!304542 (=> (not res!161937) (not e!191371))))

(declare-fun arrayContainsKey!0 (array!15482 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304542 (= res!161937 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304543 () Bool)

(declare-fun res!161940 () Bool)

(assert (=> b!304543 (=> (not res!161940) (not e!191371))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15482 (_ BitVec 32)) Bool)

(assert (=> b!304543 (= res!161940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!304544 () Bool)

(declare-fun res!161942 () Bool)

(assert (=> b!304544 (=> (not res!161942) (not e!191371))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!304544 (= res!161942 (and (= (size!7679 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7679 a!3293))))))

(declare-fun b!304545 () Bool)

(declare-fun res!161936 () Bool)

(assert (=> b!304545 (=> (not res!161936) (not e!191371))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15482 (_ BitVec 32)) SeekEntryResult!2432)

(assert (=> b!304545 (= res!161936 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2432 i!1240)))))

(declare-fun b!304546 () Bool)

(declare-fun e!191373 () Bool)

(assert (=> b!304546 (= e!191373 e!191372)))

(declare-fun res!161939 () Bool)

(assert (=> b!304546 (=> (not res!161939) (not e!191372))))

(declare-fun lt!150504 () SeekEntryResult!2432)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!304546 (= res!161939 (and (= lt!150503 lt!150504) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7327 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7327 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7327 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!304546 (= lt!150503 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun res!161938 () Bool)

(assert (=> start!30414 (=> (not res!161938) (not e!191371))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30414 (= res!161938 (validMask!0 mask!3709))))

(assert (=> start!30414 e!191371))

(declare-fun array_inv!5277 (array!15482) Bool)

(assert (=> start!30414 (array_inv!5277 a!3293)))

(assert (=> start!30414 true))

(declare-fun b!304547 () Bool)

(assert (=> b!304547 (= e!191371 e!191373)))

(declare-fun res!161941 () Bool)

(assert (=> b!304547 (=> (not res!161941) (not e!191373))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304547 (= res!161941 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150504))))

(assert (=> b!304547 (= lt!150504 (Intermediate!2432 false resIndex!52 resX!52))))

(declare-fun b!304548 () Bool)

(declare-fun res!161935 () Bool)

(assert (=> b!304548 (=> (not res!161935) (not e!191373))))

(assert (=> b!304548 (= res!161935 (and (= (select (arr!7327 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7679 a!3293))))))

(assert (= (and start!30414 res!161938) b!304544))

(assert (= (and b!304544 res!161942) b!304541))

(assert (= (and b!304541 res!161943) b!304542))

(assert (= (and b!304542 res!161937) b!304545))

(assert (= (and b!304545 res!161936) b!304543))

(assert (= (and b!304543 res!161940) b!304547))

(assert (= (and b!304547 res!161941) b!304548))

(assert (= (and b!304548 res!161935) b!304546))

(assert (= (and b!304546 res!161939) b!304540))

(declare-fun m!315799 () Bool)

(assert (=> b!304543 m!315799))

(declare-fun m!315801 () Bool)

(assert (=> b!304548 m!315801))

(declare-fun m!315803 () Bool)

(assert (=> b!304546 m!315803))

(declare-fun m!315805 () Bool)

(assert (=> b!304546 m!315805))

(declare-fun m!315807 () Bool)

(assert (=> b!304541 m!315807))

(declare-fun m!315809 () Bool)

(assert (=> b!304542 m!315809))

(declare-fun m!315811 () Bool)

(assert (=> b!304545 m!315811))

(declare-fun m!315813 () Bool)

(assert (=> b!304540 m!315813))

(assert (=> b!304540 m!315813))

(declare-fun m!315815 () Bool)

(assert (=> b!304540 m!315815))

(declare-fun m!315817 () Bool)

(assert (=> start!30414 m!315817))

(declare-fun m!315819 () Bool)

(assert (=> start!30414 m!315819))

(declare-fun m!315821 () Bool)

(assert (=> b!304547 m!315821))

(assert (=> b!304547 m!315821))

(declare-fun m!315823 () Bool)

(assert (=> b!304547 m!315823))

(check-sat (not b!304543) (not b!304547) (not b!304545) (not b!304541) (not b!304540) (not b!304542) (not start!30414) (not b!304546))
(check-sat)
