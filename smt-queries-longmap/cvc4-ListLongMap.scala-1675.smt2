; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30942 () Bool)

(assert start!30942)

(declare-fun b!310667 () Bool)

(declare-fun res!167122 () Bool)

(declare-fun e!193936 () Bool)

(assert (=> b!310667 (=> (not res!167122) (not e!193936))))

(declare-datatypes ((array!15844 0))(
  ( (array!15845 (arr!7504 (Array (_ BitVec 32) (_ BitVec 64))) (size!7856 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15844)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!310667 (= res!167122 (and (= (select (arr!7504 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7856 a!3293))))))

(declare-fun e!193933 () Bool)

(declare-fun lt!152049 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun lt!152047 () array!15844)

(declare-fun b!310668 () Bool)

(declare-datatypes ((SeekEntryResult!2644 0))(
  ( (MissingZero!2644 (index!12752 (_ BitVec 32))) (Found!2644 (index!12753 (_ BitVec 32))) (Intermediate!2644 (undefined!3456 Bool) (index!12754 (_ BitVec 32)) (x!30977 (_ BitVec 32))) (Undefined!2644) (MissingVacant!2644 (index!12755 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15844 (_ BitVec 32)) SeekEntryResult!2644)

(assert (=> b!310668 (= e!193933 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152047 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152049 k!2441 lt!152047 mask!3709)))))

(assert (=> b!310668 (= lt!152047 (array!15845 (store (arr!7504 a!3293) i!1240 k!2441) (size!7856 a!3293)))))

(declare-fun b!310669 () Bool)

(declare-fun res!167121 () Bool)

(declare-fun e!193934 () Bool)

(assert (=> b!310669 (=> (not res!167121) (not e!193934))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15844 (_ BitVec 32)) Bool)

(assert (=> b!310669 (= res!167121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310670 () Bool)

(declare-fun res!167129 () Bool)

(assert (=> b!310670 (=> (not res!167129) (not e!193934))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15844 (_ BitVec 32)) SeekEntryResult!2644)

(assert (=> b!310670 (= res!167129 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2644 i!1240)))))

(declare-fun b!310671 () Bool)

(declare-fun res!167128 () Bool)

(assert (=> b!310671 (=> (not res!167128) (not e!193934))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310671 (= res!167128 (validKeyInArray!0 k!2441))))

(declare-fun b!310672 () Bool)

(assert (=> b!310672 (= e!193934 e!193936)))

(declare-fun res!167130 () Bool)

(assert (=> b!310672 (=> (not res!167130) (not e!193936))))

(declare-fun lt!152046 () SeekEntryResult!2644)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310672 (= res!167130 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152046))))

(assert (=> b!310672 (= lt!152046 (Intermediate!2644 false resIndex!52 resX!52))))

(declare-fun b!310673 () Bool)

(declare-fun res!167125 () Bool)

(assert (=> b!310673 (=> (not res!167125) (not e!193934))))

(declare-fun arrayContainsKey!0 (array!15844 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310673 (= res!167125 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!167126 () Bool)

(assert (=> start!30942 (=> (not res!167126) (not e!193934))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30942 (= res!167126 (validMask!0 mask!3709))))

(assert (=> start!30942 e!193934))

(declare-fun array_inv!5467 (array!15844) Bool)

(assert (=> start!30942 (array_inv!5467 a!3293)))

(assert (=> start!30942 true))

(declare-fun b!310674 () Bool)

(declare-fun e!193935 () Bool)

(assert (=> b!310674 (= e!193935 (not true))))

(assert (=> b!310674 e!193933))

(declare-fun res!167123 () Bool)

(assert (=> b!310674 (=> (not res!167123) (not e!193933))))

(declare-fun lt!152048 () SeekEntryResult!2644)

(assert (=> b!310674 (= res!167123 (= lt!152048 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152049 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310674 (= lt!152049 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!310675 () Bool)

(assert (=> b!310675 (= e!193936 e!193935)))

(declare-fun res!167127 () Bool)

(assert (=> b!310675 (=> (not res!167127) (not e!193935))))

(assert (=> b!310675 (= res!167127 (and (= lt!152048 lt!152046) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7504 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310675 (= lt!152048 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!310676 () Bool)

(declare-fun res!167124 () Bool)

(assert (=> b!310676 (=> (not res!167124) (not e!193934))))

(assert (=> b!310676 (= res!167124 (and (= (size!7856 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7856 a!3293))))))

(assert (= (and start!30942 res!167126) b!310676))

(assert (= (and b!310676 res!167124) b!310671))

(assert (= (and b!310671 res!167128) b!310673))

(assert (= (and b!310673 res!167125) b!310670))

(assert (= (and b!310670 res!167129) b!310669))

(assert (= (and b!310669 res!167121) b!310672))

(assert (= (and b!310672 res!167130) b!310667))

(assert (= (and b!310667 res!167122) b!310675))

(assert (= (and b!310675 res!167127) b!310674))

(assert (= (and b!310674 res!167123) b!310668))

(declare-fun m!320589 () Bool)

(assert (=> b!310667 m!320589))

(declare-fun m!320591 () Bool)

(assert (=> b!310673 m!320591))

(declare-fun m!320593 () Bool)

(assert (=> b!310670 m!320593))

(declare-fun m!320595 () Bool)

(assert (=> b!310672 m!320595))

(assert (=> b!310672 m!320595))

(declare-fun m!320597 () Bool)

(assert (=> b!310672 m!320597))

(declare-fun m!320599 () Bool)

(assert (=> b!310674 m!320599))

(declare-fun m!320601 () Bool)

(assert (=> b!310674 m!320601))

(declare-fun m!320603 () Bool)

(assert (=> b!310675 m!320603))

(declare-fun m!320605 () Bool)

(assert (=> b!310675 m!320605))

(declare-fun m!320607 () Bool)

(assert (=> b!310669 m!320607))

(declare-fun m!320609 () Bool)

(assert (=> b!310671 m!320609))

(declare-fun m!320611 () Bool)

(assert (=> b!310668 m!320611))

(declare-fun m!320613 () Bool)

(assert (=> b!310668 m!320613))

(declare-fun m!320615 () Bool)

(assert (=> b!310668 m!320615))

(declare-fun m!320617 () Bool)

(assert (=> start!30942 m!320617))

(declare-fun m!320619 () Bool)

(assert (=> start!30942 m!320619))

(push 1)

(assert (not b!310670))

(assert (not b!310668))

