; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30786 () Bool)

(assert start!30786)

(declare-fun b!308985 () Bool)

(declare-fun res!165599 () Bool)

(declare-fun e!193111 () Bool)

(assert (=> b!308985 (=> (not res!165599) (not e!193111))))

(declare-datatypes ((array!15739 0))(
  ( (array!15740 (arr!7453 (Array (_ BitVec 32) (_ BitVec 64))) (size!7805 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15739)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!308985 (= res!165599 (and (= (size!7805 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7805 a!3293))))))

(declare-fun b!308987 () Bool)

(declare-fun res!165602 () Bool)

(assert (=> b!308987 (=> (not res!165602) (not e!193111))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15739 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308987 (= res!165602 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!308988 () Bool)

(declare-fun res!165600 () Bool)

(assert (=> b!308988 (=> (not res!165600) (not e!193111))))

(declare-datatypes ((SeekEntryResult!2593 0))(
  ( (MissingZero!2593 (index!12548 (_ BitVec 32))) (Found!2593 (index!12549 (_ BitVec 32))) (Intermediate!2593 (undefined!3405 Bool) (index!12550 (_ BitVec 32)) (x!30781 (_ BitVec 32))) (Undefined!2593) (MissingVacant!2593 (index!12551 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15739 (_ BitVec 32)) SeekEntryResult!2593)

(assert (=> b!308988 (= res!165600 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2593 i!1240)))))

(declare-fun b!308989 () Bool)

(declare-fun res!165598 () Bool)

(declare-fun e!193113 () Bool)

(assert (=> b!308989 (=> (not res!165598) (not e!193113))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!308989 (= res!165598 (and (= (select (arr!7453 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7805 a!3293))))))

(declare-fun b!308990 () Bool)

(assert (=> b!308990 (= e!193111 e!193113)))

(declare-fun res!165606 () Bool)

(assert (=> b!308990 (=> (not res!165606) (not e!193113))))

(declare-fun lt!151487 () SeekEntryResult!2593)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15739 (_ BitVec 32)) SeekEntryResult!2593)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308990 (= res!165606 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151487))))

(assert (=> b!308990 (= lt!151487 (Intermediate!2593 false resIndex!52 resX!52))))

(declare-fun b!308991 () Bool)

(declare-fun e!193114 () Bool)

(assert (=> b!308991 (= e!193114 (not true))))

(declare-fun lt!151488 () SeekEntryResult!2593)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308991 (= lt!151488 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!308992 () Bool)

(declare-fun res!165603 () Bool)

(assert (=> b!308992 (=> (not res!165603) (not e!193111))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15739 (_ BitVec 32)) Bool)

(assert (=> b!308992 (= res!165603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308993 () Bool)

(declare-fun res!165601 () Bool)

(assert (=> b!308993 (=> (not res!165601) (not e!193111))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308993 (= res!165601 (validKeyInArray!0 k!2441))))

(declare-fun res!165604 () Bool)

(assert (=> start!30786 (=> (not res!165604) (not e!193111))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30786 (= res!165604 (validMask!0 mask!3709))))

(assert (=> start!30786 e!193111))

(declare-fun array_inv!5416 (array!15739) Bool)

(assert (=> start!30786 (array_inv!5416 a!3293)))

(assert (=> start!30786 true))

(declare-fun b!308986 () Bool)

(assert (=> b!308986 (= e!193113 e!193114)))

(declare-fun res!165605 () Bool)

(assert (=> b!308986 (=> (not res!165605) (not e!193114))))

(assert (=> b!308986 (= res!165605 (and (= lt!151488 lt!151487) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7453 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!308986 (= lt!151488 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(assert (= (and start!30786 res!165604) b!308985))

(assert (= (and b!308985 res!165599) b!308993))

(assert (= (and b!308993 res!165601) b!308987))

(assert (= (and b!308987 res!165602) b!308988))

(assert (= (and b!308988 res!165600) b!308992))

(assert (= (and b!308992 res!165603) b!308990))

(assert (= (and b!308990 res!165606) b!308989))

(assert (= (and b!308989 res!165598) b!308986))

(assert (= (and b!308986 res!165605) b!308991))

(declare-fun m!319005 () Bool)

(assert (=> b!308991 m!319005))

(assert (=> b!308991 m!319005))

(declare-fun m!319007 () Bool)

(assert (=> b!308991 m!319007))

(declare-fun m!319009 () Bool)

(assert (=> b!308988 m!319009))

(declare-fun m!319011 () Bool)

(assert (=> b!308989 m!319011))

(declare-fun m!319013 () Bool)

(assert (=> b!308990 m!319013))

(assert (=> b!308990 m!319013))

(declare-fun m!319015 () Bool)

(assert (=> b!308990 m!319015))

(declare-fun m!319017 () Bool)

(assert (=> b!308986 m!319017))

(declare-fun m!319019 () Bool)

(assert (=> b!308986 m!319019))

(declare-fun m!319021 () Bool)

(assert (=> b!308993 m!319021))

(declare-fun m!319023 () Bool)

(assert (=> b!308992 m!319023))

(declare-fun m!319025 () Bool)

(assert (=> b!308987 m!319025))

(declare-fun m!319027 () Bool)

(assert (=> start!30786 m!319027))

(declare-fun m!319029 () Bool)

(assert (=> start!30786 m!319029))

(push 1)

(assert (not b!308992))

(assert (not b!308988))

(assert (not start!30786))

(assert (not b!308993))

(assert (not b!308991))

(assert (not b!308986))

