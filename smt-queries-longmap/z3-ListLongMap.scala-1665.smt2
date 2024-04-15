; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30810 () Bool)

(assert start!30810)

(declare-fun b!309223 () Bool)

(declare-fun res!165986 () Bool)

(declare-fun e!193163 () Bool)

(assert (=> b!309223 (=> (not res!165986) (not e!193163))))

(declare-datatypes ((array!15767 0))(
  ( (array!15768 (arr!7467 (Array (_ BitVec 32) (_ BitVec 64))) (size!7820 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15767)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2606 0))(
  ( (MissingZero!2606 (index!12600 (_ BitVec 32))) (Found!2606 (index!12601 (_ BitVec 32))) (Intermediate!2606 (undefined!3418 Bool) (index!12602 (_ BitVec 32)) (x!30845 (_ BitVec 32))) (Undefined!2606) (MissingVacant!2606 (index!12603 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15767 (_ BitVec 32)) SeekEntryResult!2606)

(assert (=> b!309223 (= res!165986 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2606 i!1240)))))

(declare-fun b!309224 () Bool)

(declare-fun e!193165 () Bool)

(assert (=> b!309224 (= e!193165 (not true))))

(declare-fun lt!151366 () SeekEntryResult!2606)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15767 (_ BitVec 32)) SeekEntryResult!2606)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309224 (= lt!151366 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!309225 () Bool)

(declare-fun res!165984 () Bool)

(assert (=> b!309225 (=> (not res!165984) (not e!193163))))

(assert (=> b!309225 (= res!165984 (and (= (size!7820 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7820 a!3293))))))

(declare-fun b!309226 () Bool)

(declare-fun res!165988 () Bool)

(declare-fun e!193164 () Bool)

(assert (=> b!309226 (=> (not res!165988) (not e!193164))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!309226 (= res!165988 (and (= (select (arr!7467 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7820 a!3293))))))

(declare-fun b!309227 () Bool)

(declare-fun res!165985 () Bool)

(assert (=> b!309227 (=> (not res!165985) (not e!193163))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309227 (= res!165985 (validKeyInArray!0 k0!2441))))

(declare-fun res!165989 () Bool)

(assert (=> start!30810 (=> (not res!165989) (not e!193163))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30810 (= res!165989 (validMask!0 mask!3709))))

(assert (=> start!30810 e!193163))

(declare-fun array_inv!5439 (array!15767) Bool)

(assert (=> start!30810 (array_inv!5439 a!3293)))

(assert (=> start!30810 true))

(declare-fun b!309228 () Bool)

(assert (=> b!309228 (= e!193164 e!193165)))

(declare-fun res!165982 () Bool)

(assert (=> b!309228 (=> (not res!165982) (not e!193165))))

(declare-fun lt!151367 () SeekEntryResult!2606)

(assert (=> b!309228 (= res!165982 (and (= lt!151366 lt!151367) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7467 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!309228 (= lt!151366 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!309229 () Bool)

(declare-fun res!165990 () Bool)

(assert (=> b!309229 (=> (not res!165990) (not e!193163))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15767 (_ BitVec 32)) Bool)

(assert (=> b!309229 (= res!165990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!309230 () Bool)

(assert (=> b!309230 (= e!193163 e!193164)))

(declare-fun res!165983 () Bool)

(assert (=> b!309230 (=> (not res!165983) (not e!193164))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309230 (= res!165983 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151367))))

(assert (=> b!309230 (= lt!151367 (Intermediate!2606 false resIndex!52 resX!52))))

(declare-fun b!309231 () Bool)

(declare-fun res!165987 () Bool)

(assert (=> b!309231 (=> (not res!165987) (not e!193163))))

(declare-fun arrayContainsKey!0 (array!15767 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309231 (= res!165987 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30810 res!165989) b!309225))

(assert (= (and b!309225 res!165984) b!309227))

(assert (= (and b!309227 res!165985) b!309231))

(assert (= (and b!309231 res!165987) b!309223))

(assert (= (and b!309223 res!165986) b!309229))

(assert (= (and b!309229 res!165990) b!309230))

(assert (= (and b!309230 res!165983) b!309226))

(assert (= (and b!309226 res!165988) b!309228))

(assert (= (and b!309228 res!165982) b!309224))

(declare-fun m!318769 () Bool)

(assert (=> b!309223 m!318769))

(declare-fun m!318771 () Bool)

(assert (=> b!309231 m!318771))

(declare-fun m!318773 () Bool)

(assert (=> b!309224 m!318773))

(assert (=> b!309224 m!318773))

(declare-fun m!318775 () Bool)

(assert (=> b!309224 m!318775))

(declare-fun m!318777 () Bool)

(assert (=> b!309230 m!318777))

(assert (=> b!309230 m!318777))

(declare-fun m!318779 () Bool)

(assert (=> b!309230 m!318779))

(declare-fun m!318781 () Bool)

(assert (=> start!30810 m!318781))

(declare-fun m!318783 () Bool)

(assert (=> start!30810 m!318783))

(declare-fun m!318785 () Bool)

(assert (=> b!309226 m!318785))

(declare-fun m!318787 () Bool)

(assert (=> b!309229 m!318787))

(declare-fun m!318789 () Bool)

(assert (=> b!309227 m!318789))

(declare-fun m!318791 () Bool)

(assert (=> b!309228 m!318791))

(declare-fun m!318793 () Bool)

(assert (=> b!309228 m!318793))

(check-sat (not start!30810) (not b!309229) (not b!309230) (not b!309223) (not b!309228) (not b!309227) (not b!309231) (not b!309224))
(check-sat)
