; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30824 () Bool)

(assert start!30824)

(declare-fun b!309498 () Bool)

(declare-fun res!166116 () Bool)

(declare-fun e!193340 () Bool)

(assert (=> b!309498 (=> (not res!166116) (not e!193340))))

(declare-datatypes ((array!15777 0))(
  ( (array!15778 (arr!7472 (Array (_ BitVec 32) (_ BitVec 64))) (size!7824 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15777)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309498 (= res!166116 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!309499 () Bool)

(declare-fun e!193342 () Bool)

(declare-fun e!193341 () Bool)

(assert (=> b!309499 (= e!193342 e!193341)))

(declare-fun res!166112 () Bool)

(assert (=> b!309499 (=> (not res!166112) (not e!193341))))

(declare-datatypes ((SeekEntryResult!2612 0))(
  ( (MissingZero!2612 (index!12624 (_ BitVec 32))) (Found!2612 (index!12625 (_ BitVec 32))) (Intermediate!2612 (undefined!3424 Bool) (index!12626 (_ BitVec 32)) (x!30856 (_ BitVec 32))) (Undefined!2612) (MissingVacant!2612 (index!12627 (_ BitVec 32))) )
))
(declare-fun lt!151601 () SeekEntryResult!2612)

(declare-fun lt!151602 () SeekEntryResult!2612)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!309499 (= res!166112 (and (= lt!151601 lt!151602) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7472 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15777 (_ BitVec 32)) SeekEntryResult!2612)

(assert (=> b!309499 (= lt!151601 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!309500 () Bool)

(declare-fun res!166113 () Bool)

(assert (=> b!309500 (=> (not res!166113) (not e!193340))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309500 (= res!166113 (validKeyInArray!0 k!2441))))

(declare-fun b!309501 () Bool)

(declare-fun res!166111 () Bool)

(assert (=> b!309501 (=> (not res!166111) (not e!193340))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15777 (_ BitVec 32)) Bool)

(assert (=> b!309501 (= res!166111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!166119 () Bool)

(assert (=> start!30824 (=> (not res!166119) (not e!193340))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30824 (= res!166119 (validMask!0 mask!3709))))

(assert (=> start!30824 e!193340))

(declare-fun array_inv!5435 (array!15777) Bool)

(assert (=> start!30824 (array_inv!5435 a!3293)))

(assert (=> start!30824 true))

(declare-fun b!309502 () Bool)

(declare-fun res!166115 () Bool)

(assert (=> b!309502 (=> (not res!166115) (not e!193340))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15777 (_ BitVec 32)) SeekEntryResult!2612)

(assert (=> b!309502 (= res!166115 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2612 i!1240)))))

(declare-fun b!309503 () Bool)

(declare-fun res!166114 () Bool)

(assert (=> b!309503 (=> (not res!166114) (not e!193342))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!309503 (= res!166114 (and (= (select (arr!7472 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7824 a!3293))))))

(declare-fun b!309504 () Bool)

(declare-fun res!166118 () Bool)

(assert (=> b!309504 (=> (not res!166118) (not e!193340))))

(assert (=> b!309504 (= res!166118 (and (= (size!7824 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7824 a!3293))))))

(declare-fun b!309505 () Bool)

(assert (=> b!309505 (= e!193341 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309505 (= lt!151601 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!309506 () Bool)

(assert (=> b!309506 (= e!193340 e!193342)))

(declare-fun res!166117 () Bool)

(assert (=> b!309506 (=> (not res!166117) (not e!193342))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309506 (= res!166117 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151602))))

(assert (=> b!309506 (= lt!151602 (Intermediate!2612 false resIndex!52 resX!52))))

(assert (= (and start!30824 res!166119) b!309504))

(assert (= (and b!309504 res!166118) b!309500))

(assert (= (and b!309500 res!166113) b!309498))

(assert (= (and b!309498 res!166116) b!309502))

(assert (= (and b!309502 res!166115) b!309501))

(assert (= (and b!309501 res!166111) b!309506))

(assert (= (and b!309506 res!166117) b!309503))

(assert (= (and b!309503 res!166114) b!309499))

(assert (= (and b!309499 res!166112) b!309505))

(declare-fun m!319499 () Bool)

(assert (=> b!309499 m!319499))

(declare-fun m!319501 () Bool)

(assert (=> b!309499 m!319501))

(declare-fun m!319503 () Bool)

(assert (=> b!309503 m!319503))

(declare-fun m!319505 () Bool)

(assert (=> b!309498 m!319505))

(declare-fun m!319507 () Bool)

(assert (=> b!309502 m!319507))

(declare-fun m!319509 () Bool)

(assert (=> b!309500 m!319509))

(declare-fun m!319511 () Bool)

(assert (=> start!30824 m!319511))

(declare-fun m!319513 () Bool)

(assert (=> start!30824 m!319513))

(declare-fun m!319515 () Bool)

(assert (=> b!309501 m!319515))

(declare-fun m!319517 () Bool)

(assert (=> b!309506 m!319517))

(assert (=> b!309506 m!319517))

(declare-fun m!319519 () Bool)

(assert (=> b!309506 m!319519))

(declare-fun m!319521 () Bool)

(assert (=> b!309505 m!319521))

(assert (=> b!309505 m!319521))

(declare-fun m!319523 () Bool)

(assert (=> b!309505 m!319523))

(push 1)

(assert (not start!30824))

(assert (not b!309505))

(assert (not b!309501))

(assert (not b!309500))

(assert (not b!309502))

(assert (not b!309498))

(assert (not b!309506))

(assert (not b!309499))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

