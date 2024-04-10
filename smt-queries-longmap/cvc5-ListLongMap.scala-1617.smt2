; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30428 () Bool)

(assert start!30428)

(declare-fun b!304593 () Bool)

(declare-fun res!161939 () Bool)

(declare-fun e!191405 () Bool)

(assert (=> b!304593 (=> (not res!161939) (not e!191405))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((array!15483 0))(
  ( (array!15484 (arr!7328 (Array (_ BitVec 32) (_ BitVec 64))) (size!7680 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15483)

(declare-datatypes ((SeekEntryResult!2468 0))(
  ( (MissingZero!2468 (index!12048 (_ BitVec 32))) (Found!2468 (index!12049 (_ BitVec 32))) (Intermediate!2468 (undefined!3280 Bool) (index!12050 (_ BitVec 32)) (x!30310 (_ BitVec 32))) (Undefined!2468) (MissingVacant!2468 (index!12051 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15483 (_ BitVec 32)) SeekEntryResult!2468)

(assert (=> b!304593 (= res!161939 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2468 i!1240)))))

(declare-fun b!304594 () Bool)

(declare-fun res!161943 () Bool)

(declare-fun e!191406 () Bool)

(assert (=> b!304594 (=> (not res!161943) (not e!191406))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!304594 (= res!161943 (and (= (select (arr!7328 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7680 a!3293))))))

(declare-fun b!304595 () Bool)

(declare-fun e!191407 () Bool)

(assert (=> b!304595 (= e!191407 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(declare-fun lt!150486 () SeekEntryResult!2468)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15483 (_ BitVec 32)) SeekEntryResult!2468)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304595 (= lt!150486 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!304596 () Bool)

(declare-fun res!161945 () Bool)

(assert (=> b!304596 (=> (not res!161945) (not e!191405))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304596 (= res!161945 (validKeyInArray!0 k!2441))))

(declare-fun b!304597 () Bool)

(declare-fun res!161942 () Bool)

(assert (=> b!304597 (=> (not res!161942) (not e!191405))))

(assert (=> b!304597 (= res!161942 (and (= (size!7680 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7680 a!3293))))))

(declare-fun res!161938 () Bool)

(assert (=> start!30428 (=> (not res!161938) (not e!191405))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30428 (= res!161938 (validMask!0 mask!3709))))

(assert (=> start!30428 e!191405))

(declare-fun array_inv!5291 (array!15483) Bool)

(assert (=> start!30428 (array_inv!5291 a!3293)))

(assert (=> start!30428 true))

(declare-fun b!304598 () Bool)

(assert (=> b!304598 (= e!191405 e!191406)))

(declare-fun res!161944 () Bool)

(assert (=> b!304598 (=> (not res!161944) (not e!191406))))

(declare-fun lt!150485 () SeekEntryResult!2468)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304598 (= res!161944 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150485))))

(assert (=> b!304598 (= lt!150485 (Intermediate!2468 false resIndex!52 resX!52))))

(declare-fun b!304599 () Bool)

(declare-fun res!161941 () Bool)

(assert (=> b!304599 (=> (not res!161941) (not e!191405))))

(declare-fun arrayContainsKey!0 (array!15483 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304599 (= res!161941 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304600 () Bool)

(assert (=> b!304600 (= e!191406 e!191407)))

(declare-fun res!161946 () Bool)

(assert (=> b!304600 (=> (not res!161946) (not e!191407))))

(assert (=> b!304600 (= res!161946 (and (= lt!150486 lt!150485) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7328 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7328 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7328 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!304600 (= lt!150486 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!304601 () Bool)

(declare-fun res!161940 () Bool)

(assert (=> b!304601 (=> (not res!161940) (not e!191405))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15483 (_ BitVec 32)) Bool)

(assert (=> b!304601 (= res!161940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30428 res!161938) b!304597))

(assert (= (and b!304597 res!161942) b!304596))

(assert (= (and b!304596 res!161945) b!304599))

(assert (= (and b!304599 res!161941) b!304593))

(assert (= (and b!304593 res!161939) b!304601))

(assert (= (and b!304601 res!161940) b!304598))

(assert (= (and b!304598 res!161944) b!304594))

(assert (= (and b!304594 res!161943) b!304600))

(assert (= (and b!304600 res!161946) b!304595))

(declare-fun m!315683 () Bool)

(assert (=> b!304595 m!315683))

(assert (=> b!304595 m!315683))

(declare-fun m!315685 () Bool)

(assert (=> b!304595 m!315685))

(declare-fun m!315687 () Bool)

(assert (=> start!30428 m!315687))

(declare-fun m!315689 () Bool)

(assert (=> start!30428 m!315689))

(declare-fun m!315691 () Bool)

(assert (=> b!304600 m!315691))

(declare-fun m!315693 () Bool)

(assert (=> b!304600 m!315693))

(declare-fun m!315695 () Bool)

(assert (=> b!304596 m!315695))

(declare-fun m!315697 () Bool)

(assert (=> b!304598 m!315697))

(assert (=> b!304598 m!315697))

(declare-fun m!315699 () Bool)

(assert (=> b!304598 m!315699))

(declare-fun m!315701 () Bool)

(assert (=> b!304593 m!315701))

(declare-fun m!315703 () Bool)

(assert (=> b!304594 m!315703))

(declare-fun m!315705 () Bool)

(assert (=> b!304599 m!315705))

(declare-fun m!315707 () Bool)

(assert (=> b!304601 m!315707))

(push 1)

(assert (not b!304600))

(assert (not b!304598))

(assert (not b!304601))

(assert (not b!304596))

(assert (not b!304599))

(assert (not b!304593))

(assert (not b!304595))

(assert (not start!30428))

(check-sat)

(pop 1)

(push 1)

(check-sat)

