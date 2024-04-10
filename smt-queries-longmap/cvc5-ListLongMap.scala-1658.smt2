; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30782 () Bool)

(assert start!30782)

(declare-fun b!308931 () Bool)

(declare-fun res!165549 () Bool)

(declare-fun e!193090 () Bool)

(assert (=> b!308931 (=> (not res!165549) (not e!193090))))

(declare-datatypes ((array!15735 0))(
  ( (array!15736 (arr!7451 (Array (_ BitVec 32) (_ BitVec 64))) (size!7803 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15735)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!308931 (= res!165549 (and (= (size!7803 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7803 a!3293))))))

(declare-fun b!308932 () Bool)

(declare-fun e!193089 () Bool)

(assert (=> b!308932 (= e!193090 e!193089)))

(declare-fun res!165552 () Bool)

(assert (=> b!308932 (=> (not res!165552) (not e!193089))))

(declare-datatypes ((SeekEntryResult!2591 0))(
  ( (MissingZero!2591 (index!12540 (_ BitVec 32))) (Found!2591 (index!12541 (_ BitVec 32))) (Intermediate!2591 (undefined!3403 Bool) (index!12542 (_ BitVec 32)) (x!30779 (_ BitVec 32))) (Undefined!2591) (MissingVacant!2591 (index!12543 (_ BitVec 32))) )
))
(declare-fun lt!151476 () SeekEntryResult!2591)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15735 (_ BitVec 32)) SeekEntryResult!2591)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308932 (= res!165552 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151476))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!308932 (= lt!151476 (Intermediate!2591 false resIndex!52 resX!52))))

(declare-fun b!308933 () Bool)

(declare-fun res!165546 () Bool)

(assert (=> b!308933 (=> (not res!165546) (not e!193090))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15735 (_ BitVec 32)) Bool)

(assert (=> b!308933 (= res!165546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308934 () Bool)

(declare-fun res!165548 () Bool)

(assert (=> b!308934 (=> (not res!165548) (not e!193090))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308934 (= res!165548 (validKeyInArray!0 k!2441))))

(declare-fun b!308935 () Bool)

(declare-fun e!193088 () Bool)

(assert (=> b!308935 (= e!193089 e!193088)))

(declare-fun res!165547 () Bool)

(assert (=> b!308935 (=> (not res!165547) (not e!193088))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!151475 () SeekEntryResult!2591)

(assert (=> b!308935 (= res!165547 (and (= lt!151475 lt!151476) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7451 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!308935 (= lt!151475 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun res!165544 () Bool)

(assert (=> start!30782 (=> (not res!165544) (not e!193090))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30782 (= res!165544 (validMask!0 mask!3709))))

(assert (=> start!30782 e!193090))

(declare-fun array_inv!5414 (array!15735) Bool)

(assert (=> start!30782 (array_inv!5414 a!3293)))

(assert (=> start!30782 true))

(declare-fun b!308936 () Bool)

(declare-fun res!165545 () Bool)

(assert (=> b!308936 (=> (not res!165545) (not e!193090))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15735 (_ BitVec 32)) SeekEntryResult!2591)

(assert (=> b!308936 (= res!165545 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2591 i!1240)))))

(declare-fun b!308937 () Bool)

(declare-fun res!165550 () Bool)

(assert (=> b!308937 (=> (not res!165550) (not e!193089))))

(assert (=> b!308937 (= res!165550 (and (= (select (arr!7451 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7803 a!3293))))))

(declare-fun b!308938 () Bool)

(assert (=> b!308938 (= e!193088 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308938 (= lt!151475 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!308939 () Bool)

(declare-fun res!165551 () Bool)

(assert (=> b!308939 (=> (not res!165551) (not e!193090))))

(declare-fun arrayContainsKey!0 (array!15735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308939 (= res!165551 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30782 res!165544) b!308931))

(assert (= (and b!308931 res!165549) b!308934))

(assert (= (and b!308934 res!165548) b!308939))

(assert (= (and b!308939 res!165551) b!308936))

(assert (= (and b!308936 res!165545) b!308933))

(assert (= (and b!308933 res!165546) b!308932))

(assert (= (and b!308932 res!165552) b!308937))

(assert (= (and b!308937 res!165550) b!308935))

(assert (= (and b!308935 res!165547) b!308938))

(declare-fun m!318953 () Bool)

(assert (=> b!308932 m!318953))

(assert (=> b!308932 m!318953))

(declare-fun m!318955 () Bool)

(assert (=> b!308932 m!318955))

(declare-fun m!318957 () Bool)

(assert (=> b!308937 m!318957))

(declare-fun m!318959 () Bool)

(assert (=> start!30782 m!318959))

(declare-fun m!318961 () Bool)

(assert (=> start!30782 m!318961))

(declare-fun m!318963 () Bool)

(assert (=> b!308936 m!318963))

(declare-fun m!318965 () Bool)

(assert (=> b!308935 m!318965))

(declare-fun m!318967 () Bool)

(assert (=> b!308935 m!318967))

(declare-fun m!318969 () Bool)

(assert (=> b!308934 m!318969))

(declare-fun m!318971 () Bool)

(assert (=> b!308939 m!318971))

(declare-fun m!318973 () Bool)

(assert (=> b!308938 m!318973))

(assert (=> b!308938 m!318973))

(declare-fun m!318975 () Bool)

(assert (=> b!308938 m!318975))

(declare-fun m!318977 () Bool)

(assert (=> b!308933 m!318977))

(push 1)

