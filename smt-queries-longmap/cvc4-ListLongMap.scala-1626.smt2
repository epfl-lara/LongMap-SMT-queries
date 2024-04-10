; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30540 () Bool)

(assert start!30540)

(declare-fun b!305704 () Bool)

(declare-fun res!162824 () Bool)

(declare-fun e!191917 () Bool)

(assert (=> b!305704 (=> (not res!162824) (not e!191917))))

(declare-datatypes ((array!15544 0))(
  ( (array!15545 (arr!7357 (Array (_ BitVec 32) (_ BitVec 64))) (size!7709 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15544)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2497 0))(
  ( (MissingZero!2497 (index!12164 (_ BitVec 32))) (Found!2497 (index!12165 (_ BitVec 32))) (Intermediate!2497 (undefined!3309 Bool) (index!12166 (_ BitVec 32)) (x!30420 (_ BitVec 32))) (Undefined!2497) (MissingVacant!2497 (index!12167 (_ BitVec 32))) )
))
(declare-fun lt!150807 () SeekEntryResult!2497)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15544 (_ BitVec 32)) SeekEntryResult!2497)

(assert (=> b!305704 (= res!162824 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150807))))

(declare-fun b!305705 () Bool)

(assert (=> b!305705 (= e!191917 (not (or (not (= (select (arr!7357 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000))))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!305705 (= index!1781 resIndex!52)))

(declare-datatypes ((Unit!9426 0))(
  ( (Unit!9427) )
))
(declare-fun lt!150805 () Unit!9426)

(declare-fun e!191916 () Unit!9426)

(assert (=> b!305705 (= lt!150805 e!191916)))

(declare-fun c!49044 () Bool)

(assert (=> b!305705 (= c!49044 (not (= resIndex!52 index!1781)))))

(declare-fun b!305706 () Bool)

(assert (=> b!305706 false))

(declare-fun lt!150806 () SeekEntryResult!2497)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305706 (= lt!150806 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun e!191920 () Unit!9426)

(declare-fun Unit!9428 () Unit!9426)

(assert (=> b!305706 (= e!191920 Unit!9428)))

(declare-fun res!162830 () Bool)

(declare-fun e!191918 () Bool)

(assert (=> start!30540 (=> (not res!162830) (not e!191918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30540 (= res!162830 (validMask!0 mask!3709))))

(assert (=> start!30540 e!191918))

(declare-fun array_inv!5320 (array!15544) Bool)

(assert (=> start!30540 (array_inv!5320 a!3293)))

(assert (=> start!30540 true))

(declare-fun b!305707 () Bool)

(assert (=> b!305707 (= e!191918 e!191917)))

(declare-fun res!162823 () Bool)

(assert (=> b!305707 (=> (not res!162823) (not e!191917))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305707 (= res!162823 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150807))))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!305707 (= lt!150807 (Intermediate!2497 false resIndex!52 resX!52))))

(declare-fun b!305708 () Bool)

(declare-fun res!162828 () Bool)

(assert (=> b!305708 (=> (not res!162828) (not e!191918))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!305708 (= res!162828 (validKeyInArray!0 k!2441))))

(declare-fun b!305709 () Bool)

(declare-fun res!162825 () Bool)

(assert (=> b!305709 (=> (not res!162825) (not e!191918))))

(declare-fun arrayContainsKey!0 (array!15544 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!305709 (= res!162825 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!305710 () Bool)

(declare-fun res!162831 () Bool)

(assert (=> b!305710 (=> (not res!162831) (not e!191918))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15544 (_ BitVec 32)) Bool)

(assert (=> b!305710 (= res!162831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!305711 () Bool)

(declare-fun res!162822 () Bool)

(assert (=> b!305711 (=> (not res!162822) (not e!191917))))

(assert (=> b!305711 (= res!162822 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7357 a!3293) index!1781) k!2441)) (= x!1427 resX!52)))))

(declare-fun b!305712 () Bool)

(declare-fun Unit!9429 () Unit!9426)

(assert (=> b!305712 (= e!191916 Unit!9429)))

(declare-fun b!305713 () Bool)

(declare-fun res!162826 () Bool)

(assert (=> b!305713 (=> (not res!162826) (not e!191917))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!305713 (= res!162826 (and (= (select (arr!7357 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7709 a!3293))))))

(declare-fun b!305714 () Bool)

(declare-fun res!162827 () Bool)

(assert (=> b!305714 (=> (not res!162827) (not e!191918))))

(assert (=> b!305714 (= res!162827 (and (= (size!7709 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7709 a!3293))))))

(declare-fun b!305715 () Bool)

(declare-fun res!162829 () Bool)

(assert (=> b!305715 (=> (not res!162829) (not e!191918))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15544 (_ BitVec 32)) SeekEntryResult!2497)

(assert (=> b!305715 (= res!162829 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2497 i!1240)))))

(declare-fun b!305716 () Bool)

(assert (=> b!305716 false))

(declare-fun Unit!9430 () Unit!9426)

(assert (=> b!305716 (= e!191920 Unit!9430)))

(declare-fun b!305717 () Bool)

(assert (=> b!305717 (= e!191916 e!191920)))

(declare-fun c!49043 () Bool)

(assert (=> b!305717 (= c!49043 (or (= (select (arr!7357 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7357 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!30540 res!162830) b!305714))

(assert (= (and b!305714 res!162827) b!305708))

(assert (= (and b!305708 res!162828) b!305709))

(assert (= (and b!305709 res!162825) b!305715))

(assert (= (and b!305715 res!162829) b!305710))

(assert (= (and b!305710 res!162831) b!305707))

(assert (= (and b!305707 res!162823) b!305713))

(assert (= (and b!305713 res!162826) b!305704))

(assert (= (and b!305704 res!162824) b!305711))

(assert (= (and b!305711 res!162822) b!305705))

(assert (= (and b!305705 c!49044) b!305717))

(assert (= (and b!305705 (not c!49044)) b!305712))

(assert (= (and b!305717 c!49043) b!305716))

(assert (= (and b!305717 (not c!49043)) b!305706))

(declare-fun m!316575 () Bool)

(assert (=> b!305713 m!316575))

(declare-fun m!316577 () Bool)

(assert (=> b!305704 m!316577))

(declare-fun m!316579 () Bool)

(assert (=> start!30540 m!316579))

(declare-fun m!316581 () Bool)

(assert (=> start!30540 m!316581))

(declare-fun m!316583 () Bool)

(assert (=> b!305711 m!316583))

(declare-fun m!316585 () Bool)

(assert (=> b!305710 m!316585))

(declare-fun m!316587 () Bool)

(assert (=> b!305706 m!316587))

(assert (=> b!305706 m!316587))

(declare-fun m!316589 () Bool)

(assert (=> b!305706 m!316589))

(assert (=> b!305705 m!316583))

(declare-fun m!316591 () Bool)

(assert (=> b!305709 m!316591))

(declare-fun m!316593 () Bool)

(assert (=> b!305715 m!316593))

(assert (=> b!305717 m!316583))

(declare-fun m!316595 () Bool)

(assert (=> b!305708 m!316595))

(declare-fun m!316597 () Bool)

(assert (=> b!305707 m!316597))

(assert (=> b!305707 m!316597))

(declare-fun m!316599 () Bool)

(assert (=> b!305707 m!316599))

(push 1)

(assert (not b!305706))

(assert (not b!305707))

(assert (not b!305704))

(assert (not b!305715))

(assert (not start!30540))

(assert (not b!305708))

(assert (not b!305709))

(assert (not b!305710))

(check-sat)

