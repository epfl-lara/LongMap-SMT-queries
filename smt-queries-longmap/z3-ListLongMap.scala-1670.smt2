; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30910 () Bool)

(assert start!30910)

(declare-fun res!166646 () Bool)

(declare-fun e!193693 () Bool)

(assert (=> start!30910 (=> (not res!166646) (not e!193693))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30910 (= res!166646 (validMask!0 mask!3709))))

(assert (=> start!30910 e!193693))

(declare-datatypes ((array!15812 0))(
  ( (array!15813 (arr!7488 (Array (_ BitVec 32) (_ BitVec 64))) (size!7840 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15812)

(declare-fun array_inv!5451 (array!15812) Bool)

(assert (=> start!30910 (array_inv!5451 a!3293)))

(assert (=> start!30910 true))

(declare-fun b!310187 () Bool)

(declare-fun lt!151855 () array!15812)

(declare-fun e!193695 () Bool)

(declare-fun lt!151856 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2628 0))(
  ( (MissingZero!2628 (index!12688 (_ BitVec 32))) (Found!2628 (index!12689 (_ BitVec 32))) (Intermediate!2628 (undefined!3440 Bool) (index!12690 (_ BitVec 32)) (x!30921 (_ BitVec 32))) (Undefined!2628) (MissingVacant!2628 (index!12691 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15812 (_ BitVec 32)) SeekEntryResult!2628)

(assert (=> b!310187 (= e!193695 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!151855 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151856 k0!2441 lt!151855 mask!3709)))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!310187 (= lt!151855 (array!15813 (store (arr!7488 a!3293) i!1240 k0!2441) (size!7840 a!3293)))))

(declare-fun b!310188 () Bool)

(declare-fun res!166644 () Bool)

(declare-fun e!193694 () Bool)

(assert (=> b!310188 (=> (not res!166644) (not e!193694))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!310188 (= res!166644 (and (= (select (arr!7488 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7840 a!3293))))))

(declare-fun b!310189 () Bool)

(assert (=> b!310189 (= e!193693 e!193694)))

(declare-fun res!166650 () Bool)

(assert (=> b!310189 (=> (not res!166650) (not e!193694))))

(declare-fun lt!151854 () SeekEntryResult!2628)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310189 (= res!166650 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151854))))

(assert (=> b!310189 (= lt!151854 (Intermediate!2628 false resIndex!52 resX!52))))

(declare-fun b!310190 () Bool)

(declare-fun res!166642 () Bool)

(assert (=> b!310190 (=> (not res!166642) (not e!193693))))

(declare-fun arrayContainsKey!0 (array!15812 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310190 (= res!166642 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310191 () Bool)

(declare-fun e!193692 () Bool)

(assert (=> b!310191 (= e!193694 e!193692)))

(declare-fun res!166645 () Bool)

(assert (=> b!310191 (=> (not res!166645) (not e!193692))))

(declare-fun lt!151857 () SeekEntryResult!2628)

(assert (=> b!310191 (= res!166645 (and (= lt!151857 lt!151854) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7488 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310191 (= lt!151857 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!310192 () Bool)

(declare-fun res!166641 () Bool)

(assert (=> b!310192 (=> (not res!166641) (not e!193693))))

(assert (=> b!310192 (= res!166641 (and (= (size!7840 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7840 a!3293))))))

(declare-fun b!310193 () Bool)

(assert (=> b!310193 (= e!193692 (not (bvsge mask!3709 #b00000000000000000000000000000000)))))

(assert (=> b!310193 e!193695))

(declare-fun res!166648 () Bool)

(assert (=> b!310193 (=> (not res!166648) (not e!193695))))

(assert (=> b!310193 (= res!166648 (= lt!151857 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151856 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310193 (= lt!151856 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!310194 () Bool)

(declare-fun res!166643 () Bool)

(assert (=> b!310194 (=> (not res!166643) (not e!193693))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15812 (_ BitVec 32)) Bool)

(assert (=> b!310194 (= res!166643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310195 () Bool)

(declare-fun res!166647 () Bool)

(assert (=> b!310195 (=> (not res!166647) (not e!193693))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310195 (= res!166647 (validKeyInArray!0 k0!2441))))

(declare-fun b!310196 () Bool)

(declare-fun res!166649 () Bool)

(assert (=> b!310196 (=> (not res!166649) (not e!193693))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15812 (_ BitVec 32)) SeekEntryResult!2628)

(assert (=> b!310196 (= res!166649 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2628 i!1240)))))

(assert (= (and start!30910 res!166646) b!310192))

(assert (= (and b!310192 res!166641) b!310195))

(assert (= (and b!310195 res!166647) b!310190))

(assert (= (and b!310190 res!166642) b!310196))

(assert (= (and b!310196 res!166649) b!310194))

(assert (= (and b!310194 res!166643) b!310189))

(assert (= (and b!310189 res!166650) b!310188))

(assert (= (and b!310188 res!166644) b!310191))

(assert (= (and b!310191 res!166645) b!310193))

(assert (= (and b!310193 res!166648) b!310187))

(declare-fun m!320077 () Bool)

(assert (=> b!310194 m!320077))

(declare-fun m!320079 () Bool)

(assert (=> b!310189 m!320079))

(assert (=> b!310189 m!320079))

(declare-fun m!320081 () Bool)

(assert (=> b!310189 m!320081))

(declare-fun m!320083 () Bool)

(assert (=> b!310190 m!320083))

(declare-fun m!320085 () Bool)

(assert (=> b!310195 m!320085))

(declare-fun m!320087 () Bool)

(assert (=> b!310191 m!320087))

(declare-fun m!320089 () Bool)

(assert (=> b!310191 m!320089))

(declare-fun m!320091 () Bool)

(assert (=> b!310188 m!320091))

(declare-fun m!320093 () Bool)

(assert (=> start!30910 m!320093))

(declare-fun m!320095 () Bool)

(assert (=> start!30910 m!320095))

(declare-fun m!320097 () Bool)

(assert (=> b!310196 m!320097))

(declare-fun m!320099 () Bool)

(assert (=> b!310187 m!320099))

(declare-fun m!320101 () Bool)

(assert (=> b!310187 m!320101))

(declare-fun m!320103 () Bool)

(assert (=> b!310187 m!320103))

(declare-fun m!320105 () Bool)

(assert (=> b!310193 m!320105))

(declare-fun m!320107 () Bool)

(assert (=> b!310193 m!320107))

(check-sat (not b!310187) (not b!310195) (not b!310194) (not b!310190) (not b!310191) (not b!310189) (not b!310196) (not start!30910) (not b!310193))
(check-sat)
