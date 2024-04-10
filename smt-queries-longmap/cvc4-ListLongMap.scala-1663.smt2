; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30816 () Bool)

(assert start!30816)

(declare-fun b!309390 () Bool)

(declare-fun e!193291 () Bool)

(declare-fun e!193292 () Bool)

(assert (=> b!309390 (= e!193291 e!193292)))

(declare-fun res!166003 () Bool)

(assert (=> b!309390 (=> (not res!166003) (not e!193292))))

(declare-datatypes ((array!15769 0))(
  ( (array!15770 (arr!7468 (Array (_ BitVec 32) (_ BitVec 64))) (size!7820 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15769)

(declare-datatypes ((SeekEntryResult!2608 0))(
  ( (MissingZero!2608 (index!12608 (_ BitVec 32))) (Found!2608 (index!12609 (_ BitVec 32))) (Intermediate!2608 (undefined!3420 Bool) (index!12610 (_ BitVec 32)) (x!30836 (_ BitVec 32))) (Undefined!2608) (MissingVacant!2608 (index!12611 (_ BitVec 32))) )
))
(declare-fun lt!151578 () SeekEntryResult!2608)

(declare-fun lt!151577 () SeekEntryResult!2608)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!309390 (= res!166003 (and (= lt!151578 lt!151577) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7468 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15769 (_ BitVec 32)) SeekEntryResult!2608)

(assert (=> b!309390 (= lt!151578 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!309391 () Bool)

(declare-fun res!166006 () Bool)

(declare-fun e!193293 () Bool)

(assert (=> b!309391 (=> (not res!166006) (not e!193293))))

(declare-fun arrayContainsKey!0 (array!15769 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309391 (= res!166006 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!166004 () Bool)

(assert (=> start!30816 (=> (not res!166004) (not e!193293))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30816 (= res!166004 (validMask!0 mask!3709))))

(assert (=> start!30816 e!193293))

(declare-fun array_inv!5431 (array!15769) Bool)

(assert (=> start!30816 (array_inv!5431 a!3293)))

(assert (=> start!30816 true))

(declare-fun b!309392 () Bool)

(declare-fun res!166005 () Bool)

(assert (=> b!309392 (=> (not res!166005) (not e!193291))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!309392 (= res!166005 (and (= (select (arr!7468 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7820 a!3293))))))

(declare-fun b!309393 () Bool)

(assert (=> b!309393 (= e!193293 e!193291)))

(declare-fun res!166008 () Bool)

(assert (=> b!309393 (=> (not res!166008) (not e!193291))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309393 (= res!166008 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151577))))

(assert (=> b!309393 (= lt!151577 (Intermediate!2608 false resIndex!52 resX!52))))

(declare-fun b!309394 () Bool)

(assert (=> b!309394 (= e!193292 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309394 (= lt!151578 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!309395 () Bool)

(declare-fun res!166010 () Bool)

(assert (=> b!309395 (=> (not res!166010) (not e!193293))))

(assert (=> b!309395 (= res!166010 (and (= (size!7820 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7820 a!3293))))))

(declare-fun b!309396 () Bool)

(declare-fun res!166009 () Bool)

(assert (=> b!309396 (=> (not res!166009) (not e!193293))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15769 (_ BitVec 32)) SeekEntryResult!2608)

(assert (=> b!309396 (= res!166009 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2608 i!1240)))))

(declare-fun b!309397 () Bool)

(declare-fun res!166011 () Bool)

(assert (=> b!309397 (=> (not res!166011) (not e!193293))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309397 (= res!166011 (validKeyInArray!0 k!2441))))

(declare-fun b!309398 () Bool)

(declare-fun res!166007 () Bool)

(assert (=> b!309398 (=> (not res!166007) (not e!193293))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15769 (_ BitVec 32)) Bool)

(assert (=> b!309398 (= res!166007 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30816 res!166004) b!309395))

(assert (= (and b!309395 res!166010) b!309397))

(assert (= (and b!309397 res!166011) b!309391))

(assert (= (and b!309391 res!166006) b!309396))

(assert (= (and b!309396 res!166009) b!309398))

(assert (= (and b!309398 res!166007) b!309393))

(assert (= (and b!309393 res!166008) b!309392))

(assert (= (and b!309392 res!166005) b!309390))

(assert (= (and b!309390 res!166003) b!309394))

(declare-fun m!319395 () Bool)

(assert (=> b!309391 m!319395))

(declare-fun m!319397 () Bool)

(assert (=> b!309398 m!319397))

(declare-fun m!319399 () Bool)

(assert (=> start!30816 m!319399))

(declare-fun m!319401 () Bool)

(assert (=> start!30816 m!319401))

(declare-fun m!319403 () Bool)

(assert (=> b!309397 m!319403))

(declare-fun m!319405 () Bool)

(assert (=> b!309393 m!319405))

(assert (=> b!309393 m!319405))

(declare-fun m!319407 () Bool)

(assert (=> b!309393 m!319407))

(declare-fun m!319409 () Bool)

(assert (=> b!309392 m!319409))

(declare-fun m!319411 () Bool)

(assert (=> b!309396 m!319411))

(declare-fun m!319413 () Bool)

(assert (=> b!309390 m!319413))

(declare-fun m!319415 () Bool)

(assert (=> b!309390 m!319415))

(declare-fun m!319417 () Bool)

(assert (=> b!309394 m!319417))

(assert (=> b!309394 m!319417))

(declare-fun m!319419 () Bool)

(assert (=> b!309394 m!319419))

(push 1)

(assert (not b!309390))

(assert (not start!30816))

(assert (not b!309393))

