; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30544 () Bool)

(assert start!30544)

(declare-fun b!305788 () Bool)

(assert (=> b!305788 false))

(declare-datatypes ((Unit!9436 0))(
  ( (Unit!9437) )
))
(declare-fun e!191948 () Unit!9436)

(declare-fun Unit!9438 () Unit!9436)

(assert (=> b!305788 (= e!191948 Unit!9438)))

(declare-fun b!305789 () Bool)

(declare-fun res!162891 () Bool)

(declare-fun e!191949 () Bool)

(assert (=> b!305789 (=> (not res!162891) (not e!191949))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!305789 (= res!162891 (validKeyInArray!0 k0!2441))))

(declare-fun b!305790 () Bool)

(declare-fun res!162884 () Bool)

(assert (=> b!305790 (=> (not res!162884) (not e!191949))))

(declare-datatypes ((array!15548 0))(
  ( (array!15549 (arr!7359 (Array (_ BitVec 32) (_ BitVec 64))) (size!7711 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15548)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2499 0))(
  ( (MissingZero!2499 (index!12172 (_ BitVec 32))) (Found!2499 (index!12173 (_ BitVec 32))) (Intermediate!2499 (undefined!3311 Bool) (index!12174 (_ BitVec 32)) (x!30430 (_ BitVec 32))) (Undefined!2499) (MissingVacant!2499 (index!12175 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15548 (_ BitVec 32)) SeekEntryResult!2499)

(assert (=> b!305790 (= res!162884 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2499 i!1240)))))

(declare-fun b!305791 () Bool)

(declare-fun res!162890 () Bool)

(declare-fun e!191947 () Bool)

(assert (=> b!305791 (=> (not res!162890) (not e!191947))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!305791 (= res!162890 (and (= (select (arr!7359 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7711 a!3293))))))

(declare-fun res!162886 () Bool)

(assert (=> start!30544 (=> (not res!162886) (not e!191949))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30544 (= res!162886 (validMask!0 mask!3709))))

(assert (=> start!30544 e!191949))

(declare-fun array_inv!5322 (array!15548) Bool)

(assert (=> start!30544 (array_inv!5322 a!3293)))

(assert (=> start!30544 true))

(declare-fun b!305792 () Bool)

(assert (=> b!305792 false))

(declare-fun lt!150825 () SeekEntryResult!2499)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15548 (_ BitVec 32)) SeekEntryResult!2499)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305792 (= lt!150825 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun Unit!9439 () Unit!9436)

(assert (=> b!305792 (= e!191948 Unit!9439)))

(declare-fun b!305793 () Bool)

(declare-fun res!162885 () Bool)

(assert (=> b!305793 (=> (not res!162885) (not e!191947))))

(assert (=> b!305793 (= res!162885 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7359 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun b!305794 () Bool)

(declare-fun e!191950 () Unit!9436)

(assert (=> b!305794 (= e!191950 e!191948)))

(declare-fun c!49055 () Bool)

(assert (=> b!305794 (= c!49055 (or (= (select (arr!7359 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7359 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!305795 () Bool)

(declare-fun Unit!9440 () Unit!9436)

(assert (=> b!305795 (= e!191950 Unit!9440)))

(declare-fun b!305796 () Bool)

(declare-fun res!162889 () Bool)

(assert (=> b!305796 (=> (not res!162889) (not e!191949))))

(declare-fun arrayContainsKey!0 (array!15548 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!305796 (= res!162889 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!305797 () Bool)

(declare-fun res!162883 () Bool)

(assert (=> b!305797 (=> (not res!162883) (not e!191949))))

(assert (=> b!305797 (= res!162883 (and (= (size!7711 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7711 a!3293))))))

(declare-fun b!305798 () Bool)

(assert (=> b!305798 (= e!191947 (not true))))

(assert (=> b!305798 (= index!1781 resIndex!52)))

(declare-fun lt!150823 () Unit!9436)

(assert (=> b!305798 (= lt!150823 e!191950)))

(declare-fun c!49056 () Bool)

(assert (=> b!305798 (= c!49056 (not (= resIndex!52 index!1781)))))

(declare-fun b!305799 () Bool)

(declare-fun res!162887 () Bool)

(assert (=> b!305799 (=> (not res!162887) (not e!191949))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15548 (_ BitVec 32)) Bool)

(assert (=> b!305799 (= res!162887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!305800 () Bool)

(declare-fun res!162882 () Bool)

(assert (=> b!305800 (=> (not res!162882) (not e!191947))))

(declare-fun lt!150824 () SeekEntryResult!2499)

(assert (=> b!305800 (= res!162882 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150824))))

(declare-fun b!305801 () Bool)

(assert (=> b!305801 (= e!191949 e!191947)))

(declare-fun res!162888 () Bool)

(assert (=> b!305801 (=> (not res!162888) (not e!191947))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305801 (= res!162888 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150824))))

(assert (=> b!305801 (= lt!150824 (Intermediate!2499 false resIndex!52 resX!52))))

(assert (= (and start!30544 res!162886) b!305797))

(assert (= (and b!305797 res!162883) b!305789))

(assert (= (and b!305789 res!162891) b!305796))

(assert (= (and b!305796 res!162889) b!305790))

(assert (= (and b!305790 res!162884) b!305799))

(assert (= (and b!305799 res!162887) b!305801))

(assert (= (and b!305801 res!162888) b!305791))

(assert (= (and b!305791 res!162890) b!305800))

(assert (= (and b!305800 res!162882) b!305793))

(assert (= (and b!305793 res!162885) b!305798))

(assert (= (and b!305798 c!49056) b!305794))

(assert (= (and b!305798 (not c!49056)) b!305795))

(assert (= (and b!305794 c!49055) b!305788))

(assert (= (and b!305794 (not c!49055)) b!305792))

(declare-fun m!316627 () Bool)

(assert (=> b!305792 m!316627))

(assert (=> b!305792 m!316627))

(declare-fun m!316629 () Bool)

(assert (=> b!305792 m!316629))

(declare-fun m!316631 () Bool)

(assert (=> b!305801 m!316631))

(assert (=> b!305801 m!316631))

(declare-fun m!316633 () Bool)

(assert (=> b!305801 m!316633))

(declare-fun m!316635 () Bool)

(assert (=> b!305790 m!316635))

(declare-fun m!316637 () Bool)

(assert (=> b!305791 m!316637))

(declare-fun m!316639 () Bool)

(assert (=> b!305793 m!316639))

(declare-fun m!316641 () Bool)

(assert (=> b!305789 m!316641))

(declare-fun m!316643 () Bool)

(assert (=> b!305799 m!316643))

(declare-fun m!316645 () Bool)

(assert (=> start!30544 m!316645))

(declare-fun m!316647 () Bool)

(assert (=> start!30544 m!316647))

(declare-fun m!316649 () Bool)

(assert (=> b!305796 m!316649))

(assert (=> b!305794 m!316639))

(declare-fun m!316651 () Bool)

(assert (=> b!305800 m!316651))

(check-sat (not b!305790) (not start!30544) (not b!305789) (not b!305792) (not b!305799) (not b!305796) (not b!305800) (not b!305801))
(check-sat)
