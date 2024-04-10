; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30812 () Bool)

(assert start!30812)

(declare-fun b!309336 () Bool)

(declare-fun res!165957 () Bool)

(declare-fun e!193268 () Bool)

(assert (=> b!309336 (=> (not res!165957) (not e!193268))))

(declare-datatypes ((array!15765 0))(
  ( (array!15766 (arr!7466 (Array (_ BitVec 32) (_ BitVec 64))) (size!7818 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15765)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!309336 (= res!165957 (and (= (size!7818 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7818 a!3293))))))

(declare-fun res!165950 () Bool)

(assert (=> start!30812 (=> (not res!165950) (not e!193268))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30812 (= res!165950 (validMask!0 mask!3709))))

(assert (=> start!30812 e!193268))

(declare-fun array_inv!5429 (array!15765) Bool)

(assert (=> start!30812 (array_inv!5429 a!3293)))

(assert (=> start!30812 true))

(declare-fun b!309337 () Bool)

(declare-fun e!193267 () Bool)

(assert (=> b!309337 (= e!193268 e!193267)))

(declare-fun res!165949 () Bool)

(assert (=> b!309337 (=> (not res!165949) (not e!193267))))

(declare-datatypes ((SeekEntryResult!2606 0))(
  ( (MissingZero!2606 (index!12600 (_ BitVec 32))) (Found!2606 (index!12601 (_ BitVec 32))) (Intermediate!2606 (undefined!3418 Bool) (index!12602 (_ BitVec 32)) (x!30834 (_ BitVec 32))) (Undefined!2606) (MissingVacant!2606 (index!12603 (_ BitVec 32))) )
))
(declare-fun lt!151565 () SeekEntryResult!2606)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15765 (_ BitVec 32)) SeekEntryResult!2606)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309337 (= res!165949 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151565))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!309337 (= lt!151565 (Intermediate!2606 false resIndex!52 resX!52))))

(declare-fun b!309338 () Bool)

(declare-fun res!165953 () Bool)

(assert (=> b!309338 (=> (not res!165953) (not e!193267))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!309338 (= res!165953 (and (= (select (arr!7466 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7818 a!3293))))))

(declare-fun b!309339 () Bool)

(declare-fun res!165955 () Bool)

(assert (=> b!309339 (=> (not res!165955) (not e!193268))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309339 (= res!165955 (validKeyInArray!0 k!2441))))

(declare-fun b!309340 () Bool)

(declare-fun res!165954 () Bool)

(assert (=> b!309340 (=> (not res!165954) (not e!193268))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15765 (_ BitVec 32)) SeekEntryResult!2606)

(assert (=> b!309340 (= res!165954 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2606 i!1240)))))

(declare-fun b!309341 () Bool)

(declare-fun res!165951 () Bool)

(assert (=> b!309341 (=> (not res!165951) (not e!193268))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15765 (_ BitVec 32)) Bool)

(assert (=> b!309341 (= res!165951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!309342 () Bool)

(declare-fun e!193270 () Bool)

(assert (=> b!309342 (= e!193267 e!193270)))

(declare-fun res!165952 () Bool)

(assert (=> b!309342 (=> (not res!165952) (not e!193270))))

(declare-fun lt!151566 () SeekEntryResult!2606)

(assert (=> b!309342 (= res!165952 (and (= lt!151566 lt!151565) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7466 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!309342 (= lt!151566 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!309343 () Bool)

(declare-fun res!165956 () Bool)

(assert (=> b!309343 (=> (not res!165956) (not e!193268))))

(declare-fun arrayContainsKey!0 (array!15765 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309343 (= res!165956 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!309344 () Bool)

(assert (=> b!309344 (= e!193270 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309344 (= lt!151566 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(assert (= (and start!30812 res!165950) b!309336))

(assert (= (and b!309336 res!165957) b!309339))

(assert (= (and b!309339 res!165955) b!309343))

(assert (= (and b!309343 res!165956) b!309340))

(assert (= (and b!309340 res!165954) b!309341))

(assert (= (and b!309341 res!165951) b!309337))

(assert (= (and b!309337 res!165949) b!309338))

(assert (= (and b!309338 res!165953) b!309342))

(assert (= (and b!309342 res!165952) b!309344))

(declare-fun m!319343 () Bool)

(assert (=> b!309344 m!319343))

(assert (=> b!309344 m!319343))

(declare-fun m!319345 () Bool)

(assert (=> b!309344 m!319345))

(declare-fun m!319347 () Bool)

(assert (=> b!309342 m!319347))

(declare-fun m!319349 () Bool)

(assert (=> b!309342 m!319349))

(declare-fun m!319351 () Bool)

(assert (=> b!309341 m!319351))

(declare-fun m!319353 () Bool)

(assert (=> start!30812 m!319353))

(declare-fun m!319355 () Bool)

(assert (=> start!30812 m!319355))

(declare-fun m!319357 () Bool)

(assert (=> b!309337 m!319357))

(assert (=> b!309337 m!319357))

(declare-fun m!319359 () Bool)

(assert (=> b!309337 m!319359))

(declare-fun m!319361 () Bool)

(assert (=> b!309338 m!319361))

(declare-fun m!319363 () Bool)

(assert (=> b!309339 m!319363))

(declare-fun m!319365 () Bool)

(assert (=> b!309343 m!319365))

(declare-fun m!319367 () Bool)

(assert (=> b!309340 m!319367))

(push 1)

