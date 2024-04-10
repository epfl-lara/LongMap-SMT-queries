; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30536 () Bool)

(assert start!30536)

(declare-fun res!162766 () Bool)

(declare-fun e!191889 () Bool)

(assert (=> start!30536 (=> (not res!162766) (not e!191889))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30536 (= res!162766 (validMask!0 mask!3709))))

(assert (=> start!30536 e!191889))

(declare-datatypes ((array!15540 0))(
  ( (array!15541 (arr!7355 (Array (_ BitVec 32) (_ BitVec 64))) (size!7707 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15540)

(declare-fun array_inv!5318 (array!15540) Bool)

(assert (=> start!30536 (array_inv!5318 a!3293)))

(assert (=> start!30536 true))

(declare-fun b!305620 () Bool)

(declare-fun res!162762 () Bool)

(declare-fun e!191887 () Bool)

(assert (=> b!305620 (=> (not res!162762) (not e!191887))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!305620 (= res!162762 (and (= (select (arr!7355 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7707 a!3293))))))

(declare-fun b!305621 () Bool)

(declare-datatypes ((Unit!9416 0))(
  ( (Unit!9417) )
))
(declare-fun e!191888 () Unit!9416)

(declare-fun Unit!9418 () Unit!9416)

(assert (=> b!305621 (= e!191888 Unit!9418)))

(declare-fun b!305622 () Bool)

(declare-fun res!162764 () Bool)

(assert (=> b!305622 (=> (not res!162764) (not e!191889))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!305622 (= res!162764 (validKeyInArray!0 k!2441))))

(declare-fun b!305623 () Bool)

(declare-fun res!162765 () Bool)

(assert (=> b!305623 (=> (not res!162765) (not e!191889))))

(declare-fun arrayContainsKey!0 (array!15540 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!305623 (= res!162765 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!305624 () Bool)

(declare-fun res!162767 () Bool)

(assert (=> b!305624 (=> (not res!162767) (not e!191889))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15540 (_ BitVec 32)) Bool)

(assert (=> b!305624 (= res!162767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!305625 () Bool)

(declare-fun res!162768 () Bool)

(assert (=> b!305625 (=> (not res!162768) (not e!191889))))

(declare-datatypes ((SeekEntryResult!2495 0))(
  ( (MissingZero!2495 (index!12156 (_ BitVec 32))) (Found!2495 (index!12157 (_ BitVec 32))) (Intermediate!2495 (undefined!3307 Bool) (index!12158 (_ BitVec 32)) (x!30418 (_ BitVec 32))) (Undefined!2495) (MissingVacant!2495 (index!12159 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15540 (_ BitVec 32)) SeekEntryResult!2495)

(assert (=> b!305625 (= res!162768 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2495 i!1240)))))

(declare-fun b!305626 () Bool)

(declare-fun res!162771 () Bool)

(assert (=> b!305626 (=> (not res!162771) (not e!191887))))

(declare-fun lt!150787 () SeekEntryResult!2495)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15540 (_ BitVec 32)) SeekEntryResult!2495)

(assert (=> b!305626 (= res!162771 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150787))))

(declare-fun b!305627 () Bool)

(declare-fun res!162770 () Bool)

(assert (=> b!305627 (=> (not res!162770) (not e!191889))))

(assert (=> b!305627 (= res!162770 (and (= (size!7707 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7707 a!3293))))))

(declare-fun b!305628 () Bool)

(assert (=> b!305628 false))

(declare-fun e!191886 () Unit!9416)

(declare-fun Unit!9419 () Unit!9416)

(assert (=> b!305628 (= e!191886 Unit!9419)))

(declare-fun b!305629 () Bool)

(assert (=> b!305629 (= e!191889 e!191887)))

(declare-fun res!162763 () Bool)

(assert (=> b!305629 (=> (not res!162763) (not e!191887))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305629 (= res!162763 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150787))))

(assert (=> b!305629 (= lt!150787 (Intermediate!2495 false resIndex!52 resX!52))))

(declare-fun b!305630 () Bool)

(assert (=> b!305630 (= e!191888 e!191886)))

(declare-fun c!49032 () Bool)

(assert (=> b!305630 (= c!49032 (or (= (select (arr!7355 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7355 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!305631 () Bool)

(assert (=> b!305631 false))

(declare-fun lt!150789 () SeekEntryResult!2495)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305631 (= lt!150789 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun Unit!9420 () Unit!9416)

(assert (=> b!305631 (= e!191886 Unit!9420)))

(declare-fun b!305632 () Bool)

(declare-fun res!162769 () Bool)

(assert (=> b!305632 (=> (not res!162769) (not e!191887))))

(assert (=> b!305632 (= res!162769 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7355 a!3293) index!1781) k!2441)) (= x!1427 resX!52)))))

(declare-fun b!305633 () Bool)

(assert (=> b!305633 (= e!191887 (not (or (not (= (select (arr!7355 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000))))))

(assert (=> b!305633 (= index!1781 resIndex!52)))

(declare-fun lt!150788 () Unit!9416)

(assert (=> b!305633 (= lt!150788 e!191888)))

(declare-fun c!49031 () Bool)

(assert (=> b!305633 (= c!49031 (not (= resIndex!52 index!1781)))))

(assert (= (and start!30536 res!162766) b!305627))

(assert (= (and b!305627 res!162770) b!305622))

(assert (= (and b!305622 res!162764) b!305623))

(assert (= (and b!305623 res!162765) b!305625))

(assert (= (and b!305625 res!162768) b!305624))

(assert (= (and b!305624 res!162767) b!305629))

(assert (= (and b!305629 res!162763) b!305620))

(assert (= (and b!305620 res!162762) b!305626))

(assert (= (and b!305626 res!162771) b!305632))

(assert (= (and b!305632 res!162769) b!305633))

(assert (= (and b!305633 c!49031) b!305630))

(assert (= (and b!305633 (not c!49031)) b!305621))

(assert (= (and b!305630 c!49032) b!305628))

(assert (= (and b!305630 (not c!49032)) b!305631))

(declare-fun m!316523 () Bool)

(assert (=> b!305620 m!316523))

(declare-fun m!316525 () Bool)

(assert (=> b!305622 m!316525))

(declare-fun m!316527 () Bool)

(assert (=> b!305633 m!316527))

(declare-fun m!316529 () Bool)

(assert (=> b!305625 m!316529))

(declare-fun m!316531 () Bool)

(assert (=> b!305626 m!316531))

(declare-fun m!316533 () Bool)

(assert (=> start!30536 m!316533))

(declare-fun m!316535 () Bool)

(assert (=> start!30536 m!316535))

(declare-fun m!316537 () Bool)

(assert (=> b!305631 m!316537))

(assert (=> b!305631 m!316537))

(declare-fun m!316539 () Bool)

(assert (=> b!305631 m!316539))

(assert (=> b!305630 m!316527))

(assert (=> b!305632 m!316527))

(declare-fun m!316541 () Bool)

(assert (=> b!305623 m!316541))

(declare-fun m!316543 () Bool)

(assert (=> b!305624 m!316543))

(declare-fun m!316545 () Bool)

(assert (=> b!305629 m!316545))

(assert (=> b!305629 m!316545))

(declare-fun m!316547 () Bool)

(assert (=> b!305629 m!316547))

(push 1)

