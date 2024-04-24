; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30522 () Bool)

(assert start!30522)

(declare-fun b!305567 () Bool)

(declare-fun res!162764 () Bool)

(declare-fun e!191854 () Bool)

(assert (=> b!305567 (=> (not res!162764) (not e!191854))))

(declare-datatypes ((array!15539 0))(
  ( (array!15540 (arr!7354 (Array (_ BitVec 32) (_ BitVec 64))) (size!7706 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15539)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15539 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!305567 (= res!162764 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!305568 () Bool)

(declare-fun res!162760 () Bool)

(assert (=> b!305568 (=> (not res!162760) (not e!191854))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15539 (_ BitVec 32)) Bool)

(assert (=> b!305568 (= res!162760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!162766 () Bool)

(assert (=> start!30522 (=> (not res!162766) (not e!191854))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30522 (= res!162766 (validMask!0 mask!3709))))

(assert (=> start!30522 e!191854))

(declare-fun array_inv!5304 (array!15539) Bool)

(assert (=> start!30522 (array_inv!5304 a!3293)))

(assert (=> start!30522 true))

(declare-fun b!305569 () Bool)

(assert (=> b!305569 false))

(declare-datatypes ((SeekEntryResult!2459 0))(
  ( (MissingZero!2459 (index!12012 (_ BitVec 32))) (Found!2459 (index!12013 (_ BitVec 32))) (Intermediate!2459 (undefined!3271 Bool) (index!12014 (_ BitVec 32)) (x!30379 (_ BitVec 32))) (Undefined!2459) (MissingVacant!2459 (index!12015 (_ BitVec 32))) )
))
(declare-fun lt!150806 () SeekEntryResult!2459)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15539 (_ BitVec 32)) SeekEntryResult!2459)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305569 (= lt!150806 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-datatypes ((Unit!9378 0))(
  ( (Unit!9379) )
))
(declare-fun e!191855 () Unit!9378)

(declare-fun Unit!9380 () Unit!9378)

(assert (=> b!305569 (= e!191855 Unit!9380)))

(declare-fun b!305570 () Bool)

(assert (=> b!305570 false))

(declare-fun Unit!9381 () Unit!9378)

(assert (=> b!305570 (= e!191855 Unit!9381)))

(declare-fun b!305571 () Bool)

(declare-fun e!191852 () Unit!9378)

(assert (=> b!305571 (= e!191852 e!191855)))

(declare-fun c!49007 () Bool)

(assert (=> b!305571 (= c!49007 (or (= (select (arr!7354 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7354 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!305572 () Bool)

(declare-fun Unit!9382 () Unit!9378)

(assert (=> b!305572 (= e!191852 Unit!9382)))

(declare-fun e!191856 () Bool)

(declare-fun b!305573 () Bool)

(assert (=> b!305573 (= e!191856 (not (or (not (= (select (arr!7354 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000))))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!305573 (= index!1781 resIndex!52)))

(declare-fun lt!150805 () Unit!9378)

(assert (=> b!305573 (= lt!150805 e!191852)))

(declare-fun c!49006 () Bool)

(assert (=> b!305573 (= c!49006 (not (= resIndex!52 index!1781)))))

(declare-fun b!305574 () Bool)

(declare-fun res!162768 () Bool)

(assert (=> b!305574 (=> (not res!162768) (not e!191856))))

(declare-fun lt!150807 () SeekEntryResult!2459)

(assert (=> b!305574 (= res!162768 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150807))))

(declare-fun b!305575 () Bool)

(declare-fun res!162765 () Bool)

(assert (=> b!305575 (=> (not res!162765) (not e!191854))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!305575 (= res!162765 (validKeyInArray!0 k0!2441))))

(declare-fun b!305576 () Bool)

(declare-fun res!162762 () Bool)

(assert (=> b!305576 (=> (not res!162762) (not e!191854))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15539 (_ BitVec 32)) SeekEntryResult!2459)

(assert (=> b!305576 (= res!162762 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2459 i!1240)))))

(declare-fun b!305577 () Bool)

(declare-fun res!162759 () Bool)

(assert (=> b!305577 (=> (not res!162759) (not e!191856))))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!305577 (= res!162759 (and (= (select (arr!7354 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7706 a!3293))))))

(declare-fun b!305578 () Bool)

(assert (=> b!305578 (= e!191854 e!191856)))

(declare-fun res!162767 () Bool)

(assert (=> b!305578 (=> (not res!162767) (not e!191856))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305578 (= res!162767 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150807))))

(assert (=> b!305578 (= lt!150807 (Intermediate!2459 false resIndex!52 resX!52))))

(declare-fun b!305579 () Bool)

(declare-fun res!162763 () Bool)

(assert (=> b!305579 (=> (not res!162763) (not e!191856))))

(assert (=> b!305579 (= res!162763 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7354 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun b!305580 () Bool)

(declare-fun res!162761 () Bool)

(assert (=> b!305580 (=> (not res!162761) (not e!191854))))

(assert (=> b!305580 (= res!162761 (and (= (size!7706 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7706 a!3293))))))

(assert (= (and start!30522 res!162766) b!305580))

(assert (= (and b!305580 res!162761) b!305575))

(assert (= (and b!305575 res!162765) b!305567))

(assert (= (and b!305567 res!162764) b!305576))

(assert (= (and b!305576 res!162762) b!305568))

(assert (= (and b!305568 res!162760) b!305578))

(assert (= (and b!305578 res!162767) b!305577))

(assert (= (and b!305577 res!162759) b!305574))

(assert (= (and b!305574 res!162768) b!305579))

(assert (= (and b!305579 res!162763) b!305573))

(assert (= (and b!305573 c!49006) b!305571))

(assert (= (and b!305573 (not c!49006)) b!305572))

(assert (= (and b!305571 c!49007) b!305570))

(assert (= (and b!305571 (not c!49007)) b!305569))

(declare-fun m!316645 () Bool)

(assert (=> b!305567 m!316645))

(declare-fun m!316647 () Bool)

(assert (=> b!305569 m!316647))

(assert (=> b!305569 m!316647))

(declare-fun m!316649 () Bool)

(assert (=> b!305569 m!316649))

(declare-fun m!316651 () Bool)

(assert (=> b!305571 m!316651))

(assert (=> b!305579 m!316651))

(declare-fun m!316653 () Bool)

(assert (=> b!305575 m!316653))

(assert (=> b!305573 m!316651))

(declare-fun m!316655 () Bool)

(assert (=> b!305578 m!316655))

(assert (=> b!305578 m!316655))

(declare-fun m!316657 () Bool)

(assert (=> b!305578 m!316657))

(declare-fun m!316659 () Bool)

(assert (=> b!305574 m!316659))

(declare-fun m!316661 () Bool)

(assert (=> start!30522 m!316661))

(declare-fun m!316663 () Bool)

(assert (=> start!30522 m!316663))

(declare-fun m!316665 () Bool)

(assert (=> b!305576 m!316665))

(declare-fun m!316667 () Bool)

(assert (=> b!305568 m!316667))

(declare-fun m!316669 () Bool)

(assert (=> b!305577 m!316669))

(check-sat (not b!305568) (not b!305578) (not start!30522) (not b!305574) (not b!305567) (not b!305576) (not b!305569) (not b!305575))
(check-sat)
