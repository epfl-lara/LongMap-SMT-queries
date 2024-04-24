; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30516 () Bool)

(assert start!30516)

(declare-fun b!305441 () Bool)

(declare-fun e!191810 () Bool)

(assert (=> b!305441 (= e!191810 (not true))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!305441 (= index!1781 resIndex!52)))

(declare-datatypes ((Unit!9363 0))(
  ( (Unit!9364) )
))
(declare-fun lt!150780 () Unit!9363)

(declare-fun e!191807 () Unit!9363)

(assert (=> b!305441 (= lt!150780 e!191807)))

(declare-fun c!48988 () Bool)

(assert (=> b!305441 (= c!48988 (not (= resIndex!52 index!1781)))))

(declare-fun b!305442 () Bool)

(declare-fun e!191809 () Bool)

(assert (=> b!305442 (= e!191809 e!191810)))

(declare-fun res!162677 () Bool)

(assert (=> b!305442 (=> (not res!162677) (not e!191810))))

(declare-datatypes ((SeekEntryResult!2456 0))(
  ( (MissingZero!2456 (index!12000 (_ BitVec 32))) (Found!2456 (index!12001 (_ BitVec 32))) (Intermediate!2456 (undefined!3268 Bool) (index!12002 (_ BitVec 32)) (x!30368 (_ BitVec 32))) (Undefined!2456) (MissingVacant!2456 (index!12003 (_ BitVec 32))) )
))
(declare-fun lt!150779 () SeekEntryResult!2456)

(declare-datatypes ((array!15533 0))(
  ( (array!15534 (arr!7351 (Array (_ BitVec 32) (_ BitVec 64))) (size!7703 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15533)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15533 (_ BitVec 32)) SeekEntryResult!2456)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305442 (= res!162677 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150779))))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!305442 (= lt!150779 (Intermediate!2456 false resIndex!52 resX!52))))

(declare-fun b!305443 () Bool)

(declare-fun res!162678 () Bool)

(assert (=> b!305443 (=> (not res!162678) (not e!191810))))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!305443 (= res!162678 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150779))))

(declare-fun b!305444 () Bool)

(declare-fun res!162672 () Bool)

(assert (=> b!305444 (=> (not res!162672) (not e!191810))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!305444 (= res!162672 (and (= (select (arr!7351 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7703 a!3293))))))

(declare-fun res!162675 () Bool)

(assert (=> start!30516 (=> (not res!162675) (not e!191809))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30516 (= res!162675 (validMask!0 mask!3709))))

(assert (=> start!30516 e!191809))

(declare-fun array_inv!5301 (array!15533) Bool)

(assert (=> start!30516 (array_inv!5301 a!3293)))

(assert (=> start!30516 true))

(declare-fun b!305445 () Bool)

(declare-fun e!191808 () Unit!9363)

(assert (=> b!305445 (= e!191807 e!191808)))

(declare-fun c!48989 () Bool)

(assert (=> b!305445 (= c!48989 (or (= (select (arr!7351 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7351 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!305446 () Bool)

(assert (=> b!305446 false))

(declare-fun lt!150778 () SeekEntryResult!2456)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305446 (= lt!150778 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun Unit!9365 () Unit!9363)

(assert (=> b!305446 (= e!191808 Unit!9365)))

(declare-fun b!305447 () Bool)

(declare-fun res!162669 () Bool)

(assert (=> b!305447 (=> (not res!162669) (not e!191810))))

(assert (=> b!305447 (= res!162669 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7351 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun b!305448 () Bool)

(declare-fun res!162670 () Bool)

(assert (=> b!305448 (=> (not res!162670) (not e!191809))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!305448 (= res!162670 (validKeyInArray!0 k0!2441))))

(declare-fun b!305449 () Bool)

(declare-fun res!162671 () Bool)

(assert (=> b!305449 (=> (not res!162671) (not e!191809))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15533 (_ BitVec 32)) SeekEntryResult!2456)

(assert (=> b!305449 (= res!162671 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2456 i!1240)))))

(declare-fun b!305450 () Bool)

(assert (=> b!305450 false))

(declare-fun Unit!9366 () Unit!9363)

(assert (=> b!305450 (= e!191808 Unit!9366)))

(declare-fun b!305451 () Bool)

(declare-fun res!162676 () Bool)

(assert (=> b!305451 (=> (not res!162676) (not e!191809))))

(assert (=> b!305451 (= res!162676 (and (= (size!7703 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7703 a!3293))))))

(declare-fun b!305452 () Bool)

(declare-fun res!162673 () Bool)

(assert (=> b!305452 (=> (not res!162673) (not e!191809))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15533 (_ BitVec 32)) Bool)

(assert (=> b!305452 (= res!162673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!305453 () Bool)

(declare-fun res!162674 () Bool)

(assert (=> b!305453 (=> (not res!162674) (not e!191809))))

(declare-fun arrayContainsKey!0 (array!15533 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!305453 (= res!162674 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!305454 () Bool)

(declare-fun Unit!9367 () Unit!9363)

(assert (=> b!305454 (= e!191807 Unit!9367)))

(assert (= (and start!30516 res!162675) b!305451))

(assert (= (and b!305451 res!162676) b!305448))

(assert (= (and b!305448 res!162670) b!305453))

(assert (= (and b!305453 res!162674) b!305449))

(assert (= (and b!305449 res!162671) b!305452))

(assert (= (and b!305452 res!162673) b!305442))

(assert (= (and b!305442 res!162677) b!305444))

(assert (= (and b!305444 res!162672) b!305443))

(assert (= (and b!305443 res!162678) b!305447))

(assert (= (and b!305447 res!162669) b!305441))

(assert (= (and b!305441 c!48988) b!305445))

(assert (= (and b!305441 (not c!48988)) b!305454))

(assert (= (and b!305445 c!48989) b!305450))

(assert (= (and b!305445 (not c!48989)) b!305446))

(declare-fun m!316567 () Bool)

(assert (=> b!305452 m!316567))

(declare-fun m!316569 () Bool)

(assert (=> b!305444 m!316569))

(declare-fun m!316571 () Bool)

(assert (=> b!305445 m!316571))

(declare-fun m!316573 () Bool)

(assert (=> b!305446 m!316573))

(assert (=> b!305446 m!316573))

(declare-fun m!316575 () Bool)

(assert (=> b!305446 m!316575))

(declare-fun m!316577 () Bool)

(assert (=> start!30516 m!316577))

(declare-fun m!316579 () Bool)

(assert (=> start!30516 m!316579))

(declare-fun m!316581 () Bool)

(assert (=> b!305443 m!316581))

(declare-fun m!316583 () Bool)

(assert (=> b!305449 m!316583))

(declare-fun m!316585 () Bool)

(assert (=> b!305442 m!316585))

(assert (=> b!305442 m!316585))

(declare-fun m!316587 () Bool)

(assert (=> b!305442 m!316587))

(declare-fun m!316589 () Bool)

(assert (=> b!305448 m!316589))

(declare-fun m!316591 () Bool)

(assert (=> b!305453 m!316591))

(assert (=> b!305447 m!316571))

(check-sat (not b!305453) (not b!305446) (not b!305442) (not start!30516) (not b!305443) (not b!305449) (not b!305448) (not b!305452))
(check-sat)
