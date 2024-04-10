; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30438 () Bool)

(assert start!30438)

(declare-fun b!304728 () Bool)

(declare-fun e!191465 () Bool)

(declare-fun e!191464 () Bool)

(assert (=> b!304728 (= e!191465 e!191464)))

(declare-fun res!162079 () Bool)

(assert (=> b!304728 (=> (not res!162079) (not e!191464))))

(declare-datatypes ((array!15493 0))(
  ( (array!15494 (arr!7333 (Array (_ BitVec 32) (_ BitVec 64))) (size!7685 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15493)

(declare-datatypes ((SeekEntryResult!2473 0))(
  ( (MissingZero!2473 (index!12068 (_ BitVec 32))) (Found!2473 (index!12069 (_ BitVec 32))) (Intermediate!2473 (undefined!3285 Bool) (index!12070 (_ BitVec 32)) (x!30323 (_ BitVec 32))) (Undefined!2473) (MissingVacant!2473 (index!12071 (_ BitVec 32))) )
))
(declare-fun lt!150515 () SeekEntryResult!2473)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15493 (_ BitVec 32)) SeekEntryResult!2473)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304728 (= res!162079 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150515))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!304728 (= lt!150515 (Intermediate!2473 false resIndex!52 resX!52))))

(declare-fun b!304729 () Bool)

(declare-fun res!162073 () Bool)

(assert (=> b!304729 (=> (not res!162073) (not e!191465))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15493 (_ BitVec 32)) Bool)

(assert (=> b!304729 (= res!162073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!304730 () Bool)

(declare-fun res!162080 () Bool)

(assert (=> b!304730 (=> (not res!162080) (not e!191465))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15493 (_ BitVec 32)) SeekEntryResult!2473)

(assert (=> b!304730 (= res!162080 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2473 i!1240)))))

(declare-fun b!304731 () Bool)

(declare-fun res!162081 () Bool)

(assert (=> b!304731 (=> (not res!162081) (not e!191464))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!304731 (= res!162081 (and (= (select (arr!7333 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7685 a!3293))))))

(declare-fun b!304732 () Bool)

(declare-fun res!162078 () Bool)

(assert (=> b!304732 (=> (not res!162078) (not e!191465))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304732 (= res!162078 (validKeyInArray!0 k!2441))))

(declare-fun b!304733 () Bool)

(declare-fun res!162075 () Bool)

(assert (=> b!304733 (=> (not res!162075) (not e!191465))))

(declare-fun arrayContainsKey!0 (array!15493 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304733 (= res!162075 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304734 () Bool)

(declare-fun e!191466 () Bool)

(assert (=> b!304734 (= e!191466 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsle x!1427 #b01111111111111111111111111111110))))))

(declare-fun lt!150516 () SeekEntryResult!2473)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304734 (= lt!150516 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!304735 () Bool)

(assert (=> b!304735 (= e!191464 e!191466)))

(declare-fun res!162076 () Bool)

(assert (=> b!304735 (=> (not res!162076) (not e!191466))))

(assert (=> b!304735 (= res!162076 (and (= lt!150516 lt!150515) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7333 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7333 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7333 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!304735 (= lt!150516 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun res!162074 () Bool)

(assert (=> start!30438 (=> (not res!162074) (not e!191465))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30438 (= res!162074 (validMask!0 mask!3709))))

(assert (=> start!30438 e!191465))

(declare-fun array_inv!5296 (array!15493) Bool)

(assert (=> start!30438 (array_inv!5296 a!3293)))

(assert (=> start!30438 true))

(declare-fun b!304736 () Bool)

(declare-fun res!162077 () Bool)

(assert (=> b!304736 (=> (not res!162077) (not e!191465))))

(assert (=> b!304736 (= res!162077 (and (= (size!7685 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7685 a!3293))))))

(assert (= (and start!30438 res!162074) b!304736))

(assert (= (and b!304736 res!162077) b!304732))

(assert (= (and b!304732 res!162078) b!304733))

(assert (= (and b!304733 res!162075) b!304730))

(assert (= (and b!304730 res!162080) b!304729))

(assert (= (and b!304729 res!162073) b!304728))

(assert (= (and b!304728 res!162079) b!304731))

(assert (= (and b!304731 res!162081) b!304735))

(assert (= (and b!304735 res!162076) b!304734))

(declare-fun m!315813 () Bool)

(assert (=> b!304734 m!315813))

(assert (=> b!304734 m!315813))

(declare-fun m!315815 () Bool)

(assert (=> b!304734 m!315815))

(declare-fun m!315817 () Bool)

(assert (=> b!304733 m!315817))

(declare-fun m!315819 () Bool)

(assert (=> b!304728 m!315819))

(assert (=> b!304728 m!315819))

(declare-fun m!315821 () Bool)

(assert (=> b!304728 m!315821))

(declare-fun m!315823 () Bool)

(assert (=> b!304735 m!315823))

(declare-fun m!315825 () Bool)

(assert (=> b!304735 m!315825))

(declare-fun m!315827 () Bool)

(assert (=> start!30438 m!315827))

(declare-fun m!315829 () Bool)

(assert (=> start!30438 m!315829))

(declare-fun m!315831 () Bool)

(assert (=> b!304729 m!315831))

(declare-fun m!315833 () Bool)

(assert (=> b!304732 m!315833))

(declare-fun m!315835 () Bool)

(assert (=> b!304731 m!315835))

(declare-fun m!315837 () Bool)

(assert (=> b!304730 m!315837))

(push 1)

(assert (not start!30438))

(assert (not b!304732))

(assert (not b!304733))

(assert (not b!304728))

(assert (not b!304735))

(assert (not b!304734))

(assert (not b!304729))

