; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31720 () Bool)

(assert start!31720)

(declare-fun b!316968 () Bool)

(declare-fun res!171744 () Bool)

(declare-fun e!197109 () Bool)

(assert (=> b!316968 (=> (not res!171744) (not e!197109))))

(declare-datatypes ((array!16142 0))(
  ( (array!16143 (arr!7638 (Array (_ BitVec 32) (_ BitVec 64))) (size!7990 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16142)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16142 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!316968 (= res!171744 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!316969 () Bool)

(declare-fun res!171750 () Bool)

(assert (=> b!316969 (=> (not res!171750) (not e!197109))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!316969 (= res!171750 (validKeyInArray!0 k0!2441))))

(declare-fun b!316970 () Bool)

(declare-fun res!171743 () Bool)

(declare-fun e!197107 () Bool)

(assert (=> b!316970 (=> (not res!171743) (not e!197107))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!316970 (= res!171743 (and (= (select (arr!7638 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7990 a!3293))))))

(declare-fun b!316971 () Bool)

(declare-fun res!171747 () Bool)

(assert (=> b!316971 (=> (not res!171747) (not e!197109))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2778 0))(
  ( (MissingZero!2778 (index!13288 (_ BitVec 32))) (Found!2778 (index!13289 (_ BitVec 32))) (Intermediate!2778 (undefined!3590 Bool) (index!13290 (_ BitVec 32)) (x!31546 (_ BitVec 32))) (Undefined!2778) (MissingVacant!2778 (index!13291 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16142 (_ BitVec 32)) SeekEntryResult!2778)

(assert (=> b!316971 (= res!171747 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2778 i!1240)))))

(declare-fun b!316972 () Bool)

(assert (=> b!316972 (= e!197109 e!197107)))

(declare-fun res!171746 () Bool)

(assert (=> b!316972 (=> (not res!171746) (not e!197107))))

(declare-fun lt!154760 () SeekEntryResult!2778)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16142 (_ BitVec 32)) SeekEntryResult!2778)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316972 (= res!171746 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154760))))

(assert (=> b!316972 (= lt!154760 (Intermediate!2778 false resIndex!52 resX!52))))

(declare-fun b!316973 () Bool)

(declare-fun e!197110 () Bool)

(assert (=> b!316973 (= e!197107 e!197110)))

(declare-fun res!171749 () Bool)

(assert (=> b!316973 (=> (not res!171749) (not e!197110))))

(declare-fun lt!154761 () SeekEntryResult!2778)

(assert (=> b!316973 (= res!171749 (and (= lt!154761 lt!154760) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7638 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!316973 (= lt!154761 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun res!171748 () Bool)

(assert (=> start!31720 (=> (not res!171748) (not e!197109))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31720 (= res!171748 (validMask!0 mask!3709))))

(assert (=> start!31720 e!197109))

(declare-fun array_inv!5601 (array!16142) Bool)

(assert (=> start!31720 (array_inv!5601 a!3293)))

(assert (=> start!31720 true))

(declare-fun b!316974 () Bool)

(declare-fun res!171745 () Bool)

(assert (=> b!316974 (=> (not res!171745) (not e!197109))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16142 (_ BitVec 32)) Bool)

(assert (=> b!316974 (= res!171745 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!316975 () Bool)

(assert (=> b!316975 (= e!197110 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316975 (= lt!154761 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!316976 () Bool)

(declare-fun res!171742 () Bool)

(assert (=> b!316976 (=> (not res!171742) (not e!197109))))

(assert (=> b!316976 (= res!171742 (and (= (size!7990 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7990 a!3293))))))

(assert (= (and start!31720 res!171748) b!316976))

(assert (= (and b!316976 res!171742) b!316969))

(assert (= (and b!316969 res!171750) b!316968))

(assert (= (and b!316968 res!171744) b!316971))

(assert (= (and b!316971 res!171747) b!316974))

(assert (= (and b!316974 res!171745) b!316972))

(assert (= (and b!316972 res!171746) b!316970))

(assert (= (and b!316970 res!171743) b!316973))

(assert (= (and b!316973 res!171749) b!316975))

(declare-fun m!325711 () Bool)

(assert (=> b!316972 m!325711))

(assert (=> b!316972 m!325711))

(declare-fun m!325713 () Bool)

(assert (=> b!316972 m!325713))

(declare-fun m!325715 () Bool)

(assert (=> b!316973 m!325715))

(declare-fun m!325717 () Bool)

(assert (=> b!316973 m!325717))

(declare-fun m!325719 () Bool)

(assert (=> b!316970 m!325719))

(declare-fun m!325721 () Bool)

(assert (=> b!316974 m!325721))

(declare-fun m!325723 () Bool)

(assert (=> b!316969 m!325723))

(declare-fun m!325725 () Bool)

(assert (=> start!31720 m!325725))

(declare-fun m!325727 () Bool)

(assert (=> start!31720 m!325727))

(declare-fun m!325729 () Bool)

(assert (=> b!316975 m!325729))

(assert (=> b!316975 m!325729))

(declare-fun m!325731 () Bool)

(assert (=> b!316975 m!325731))

(declare-fun m!325733 () Bool)

(assert (=> b!316968 m!325733))

(declare-fun m!325735 () Bool)

(assert (=> b!316971 m!325735))

(check-sat (not start!31720) (not b!316969) (not b!316974) (not b!316968) (not b!316975) (not b!316971) (not b!316972) (not b!316973))
(check-sat)
