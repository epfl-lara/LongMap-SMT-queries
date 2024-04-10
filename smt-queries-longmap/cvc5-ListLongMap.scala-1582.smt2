; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30074 () Bool)

(assert start!30074)

(declare-fun b!301518 () Bool)

(declare-fun res!159200 () Bool)

(declare-fun e!190279 () Bool)

(assert (=> b!301518 (=> (not res!159200) (not e!190279))))

(declare-datatypes ((array!15264 0))(
  ( (array!15265 (arr!7223 (Array (_ BitVec 32) (_ BitVec 64))) (size!7575 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15264)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2363 0))(
  ( (MissingZero!2363 (index!11628 (_ BitVec 32))) (Found!2363 (index!11629 (_ BitVec 32))) (Intermediate!2363 (undefined!3175 Bool) (index!11630 (_ BitVec 32)) (x!29907 (_ BitVec 32))) (Undefined!2363) (MissingVacant!2363 (index!11631 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15264 (_ BitVec 32)) SeekEntryResult!2363)

(assert (=> b!301518 (= res!159200 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2363 i!1240)))))

(declare-fun b!301519 () Bool)

(assert (=> b!301519 (= e!190279 (bvslt mask!3709 #b00000000000000000000000000000000))))

(declare-fun lt!149856 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301519 (= lt!149856 (toIndex!0 k!2441 mask!3709))))

(declare-fun res!159198 () Bool)

(assert (=> start!30074 (=> (not res!159198) (not e!190279))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30074 (= res!159198 (validMask!0 mask!3709))))

(assert (=> start!30074 e!190279))

(assert (=> start!30074 true))

(declare-fun array_inv!5186 (array!15264) Bool)

(assert (=> start!30074 (array_inv!5186 a!3293)))

(declare-fun b!301520 () Bool)

(declare-fun res!159201 () Bool)

(assert (=> b!301520 (=> (not res!159201) (not e!190279))))

(declare-fun arrayContainsKey!0 (array!15264 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301520 (= res!159201 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301521 () Bool)

(declare-fun res!159196 () Bool)

(assert (=> b!301521 (=> (not res!159196) (not e!190279))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301521 (= res!159196 (validKeyInArray!0 k!2441))))

(declare-fun b!301522 () Bool)

(declare-fun res!159197 () Bool)

(assert (=> b!301522 (=> (not res!159197) (not e!190279))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15264 (_ BitVec 32)) Bool)

(assert (=> b!301522 (= res!159197 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301523 () Bool)

(declare-fun res!159199 () Bool)

(assert (=> b!301523 (=> (not res!159199) (not e!190279))))

(assert (=> b!301523 (= res!159199 (and (= (size!7575 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7575 a!3293))))))

(assert (= (and start!30074 res!159198) b!301523))

(assert (= (and b!301523 res!159199) b!301521))

(assert (= (and b!301521 res!159196) b!301520))

(assert (= (and b!301520 res!159201) b!301518))

(assert (= (and b!301518 res!159200) b!301522))

(assert (= (and b!301522 res!159197) b!301519))

(declare-fun m!313277 () Bool)

(assert (=> b!301520 m!313277))

(declare-fun m!313279 () Bool)

(assert (=> b!301519 m!313279))

(declare-fun m!313281 () Bool)

(assert (=> start!30074 m!313281))

(declare-fun m!313283 () Bool)

(assert (=> start!30074 m!313283))

(declare-fun m!313285 () Bool)

(assert (=> b!301518 m!313285))

(declare-fun m!313287 () Bool)

(assert (=> b!301521 m!313287))

(declare-fun m!313289 () Bool)

(assert (=> b!301522 m!313289))

(push 1)

(assert (not b!301518))

(assert (not b!301521))

(assert (not b!301520))

(assert (not b!301522))

(assert (not start!30074))

(assert (not b!301519))

(check-sat)

(pop 1)

(push 1)

(check-sat)

