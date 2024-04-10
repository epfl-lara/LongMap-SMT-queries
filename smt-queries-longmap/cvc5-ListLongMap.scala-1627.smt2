; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30542 () Bool)

(assert start!30542)

(declare-fun b!305746 () Bool)

(declare-fun e!191932 () Bool)

(declare-fun e!191935 () Bool)

(assert (=> b!305746 (= e!191932 e!191935)))

(declare-fun res!162857 () Bool)

(assert (=> b!305746 (=> (not res!162857) (not e!191935))))

(declare-datatypes ((array!15546 0))(
  ( (array!15547 (arr!7358 (Array (_ BitVec 32) (_ BitVec 64))) (size!7710 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15546)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2498 0))(
  ( (MissingZero!2498 (index!12168 (_ BitVec 32))) (Found!2498 (index!12169 (_ BitVec 32))) (Intermediate!2498 (undefined!3310 Bool) (index!12170 (_ BitVec 32)) (x!30429 (_ BitVec 32))) (Undefined!2498) (MissingVacant!2498 (index!12171 (_ BitVec 32))) )
))
(declare-fun lt!150816 () SeekEntryResult!2498)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15546 (_ BitVec 32)) SeekEntryResult!2498)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305746 (= res!162857 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150816))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!305746 (= lt!150816 (Intermediate!2498 false resIndex!52 resX!52))))

(declare-fun b!305747 () Bool)

(declare-fun res!162853 () Bool)

(assert (=> b!305747 (=> (not res!162853) (not e!191935))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!305747 (= res!162853 (and (= (select (arr!7358 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7710 a!3293))))))

(declare-fun res!162860 () Bool)

(assert (=> start!30542 (=> (not res!162860) (not e!191932))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30542 (= res!162860 (validMask!0 mask!3709))))

(assert (=> start!30542 e!191932))

(declare-fun array_inv!5321 (array!15546) Bool)

(assert (=> start!30542 (array_inv!5321 a!3293)))

(assert (=> start!30542 true))

(declare-fun b!305748 () Bool)

(assert (=> b!305748 false))

(declare-fun lt!150814 () SeekEntryResult!2498)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305748 (= lt!150814 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-datatypes ((Unit!9431 0))(
  ( (Unit!9432) )
))
(declare-fun e!191931 () Unit!9431)

(declare-fun Unit!9433 () Unit!9431)

(assert (=> b!305748 (= e!191931 Unit!9433)))

(declare-fun b!305749 () Bool)

(declare-fun res!162852 () Bool)

(assert (=> b!305749 (=> (not res!162852) (not e!191932))))

(assert (=> b!305749 (= res!162852 (and (= (size!7710 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7710 a!3293))))))

(declare-fun b!305750 () Bool)

(declare-fun e!191934 () Unit!9431)

(assert (=> b!305750 (= e!191934 e!191931)))

(declare-fun c!49050 () Bool)

(assert (=> b!305750 (= c!49050 (or (= (select (arr!7358 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7358 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!305751 () Bool)

(declare-fun res!162854 () Bool)

(assert (=> b!305751 (=> (not res!162854) (not e!191932))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15546 (_ BitVec 32)) SeekEntryResult!2498)

(assert (=> b!305751 (= res!162854 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2498 i!1240)))))

(declare-fun b!305752 () Bool)

(assert (=> b!305752 (= e!191935 (not true))))

(assert (=> b!305752 (= index!1781 resIndex!52)))

(declare-fun lt!150815 () Unit!9431)

(assert (=> b!305752 (= lt!150815 e!191934)))

(declare-fun c!49049 () Bool)

(assert (=> b!305752 (= c!49049 (not (= resIndex!52 index!1781)))))

(declare-fun b!305753 () Bool)

(declare-fun res!162858 () Bool)

(assert (=> b!305753 (=> (not res!162858) (not e!191932))))

(declare-fun arrayContainsKey!0 (array!15546 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!305753 (= res!162858 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!305754 () Bool)

(declare-fun res!162856 () Bool)

(assert (=> b!305754 (=> (not res!162856) (not e!191935))))

(assert (=> b!305754 (= res!162856 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150816))))

(declare-fun b!305755 () Bool)

(declare-fun res!162855 () Bool)

(assert (=> b!305755 (=> (not res!162855) (not e!191932))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!305755 (= res!162855 (validKeyInArray!0 k!2441))))

(declare-fun b!305756 () Bool)

(declare-fun res!162861 () Bool)

(assert (=> b!305756 (=> (not res!162861) (not e!191935))))

(assert (=> b!305756 (= res!162861 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7358 a!3293) index!1781) k!2441)) (= x!1427 resX!52)))))

(declare-fun b!305757 () Bool)

(declare-fun res!162859 () Bool)

(assert (=> b!305757 (=> (not res!162859) (not e!191932))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15546 (_ BitVec 32)) Bool)

(assert (=> b!305757 (= res!162859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!305758 () Bool)

(assert (=> b!305758 false))

(declare-fun Unit!9434 () Unit!9431)

(assert (=> b!305758 (= e!191931 Unit!9434)))

(declare-fun b!305759 () Bool)

(declare-fun Unit!9435 () Unit!9431)

(assert (=> b!305759 (= e!191934 Unit!9435)))

(assert (= (and start!30542 res!162860) b!305749))

(assert (= (and b!305749 res!162852) b!305755))

(assert (= (and b!305755 res!162855) b!305753))

(assert (= (and b!305753 res!162858) b!305751))

(assert (= (and b!305751 res!162854) b!305757))

(assert (= (and b!305757 res!162859) b!305746))

(assert (= (and b!305746 res!162857) b!305747))

(assert (= (and b!305747 res!162853) b!305754))

(assert (= (and b!305754 res!162856) b!305756))

(assert (= (and b!305756 res!162861) b!305752))

(assert (= (and b!305752 c!49049) b!305750))

(assert (= (and b!305752 (not c!49049)) b!305759))

(assert (= (and b!305750 c!49050) b!305758))

(assert (= (and b!305750 (not c!49050)) b!305748))

(declare-fun m!316601 () Bool)

(assert (=> b!305748 m!316601))

(assert (=> b!305748 m!316601))

(declare-fun m!316603 () Bool)

(assert (=> b!305748 m!316603))

(declare-fun m!316605 () Bool)

(assert (=> b!305751 m!316605))

(declare-fun m!316607 () Bool)

(assert (=> b!305756 m!316607))

(declare-fun m!316609 () Bool)

(assert (=> start!30542 m!316609))

(declare-fun m!316611 () Bool)

(assert (=> start!30542 m!316611))

(declare-fun m!316613 () Bool)

(assert (=> b!305747 m!316613))

(assert (=> b!305750 m!316607))

(declare-fun m!316615 () Bool)

(assert (=> b!305746 m!316615))

(assert (=> b!305746 m!316615))

(declare-fun m!316617 () Bool)

(assert (=> b!305746 m!316617))

(declare-fun m!316619 () Bool)

(assert (=> b!305754 m!316619))

(declare-fun m!316621 () Bool)

(assert (=> b!305757 m!316621))

(declare-fun m!316623 () Bool)

(assert (=> b!305755 m!316623))

(declare-fun m!316625 () Bool)

(assert (=> b!305753 m!316625))

(push 1)

