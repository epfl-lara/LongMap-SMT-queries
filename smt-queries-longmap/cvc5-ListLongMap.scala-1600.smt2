; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30272 () Bool)

(assert start!30272)

(declare-fun b!302973 () Bool)

(declare-fun res!160465 () Bool)

(declare-fun e!190821 () Bool)

(assert (=> b!302973 (=> (not res!160465) (not e!190821))))

(declare-datatypes ((array!15378 0))(
  ( (array!15379 (arr!7277 (Array (_ BitVec 32) (_ BitVec 64))) (size!7629 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15378)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15378 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302973 (= res!160465 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302974 () Bool)

(declare-fun res!160461 () Bool)

(assert (=> b!302974 (=> (not res!160461) (not e!190821))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2417 0))(
  ( (MissingZero!2417 (index!11844 (_ BitVec 32))) (Found!2417 (index!11845 (_ BitVec 32))) (Intermediate!2417 (undefined!3229 Bool) (index!11846 (_ BitVec 32)) (x!30114 (_ BitVec 32))) (Undefined!2417) (MissingVacant!2417 (index!11847 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15378 (_ BitVec 32)) SeekEntryResult!2417)

(assert (=> b!302974 (= res!160461 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2417 i!1240)))))

(declare-fun b!302975 () Bool)

(declare-fun e!190820 () Bool)

(assert (=> b!302975 (= e!190821 e!190820)))

(declare-fun res!160462 () Bool)

(assert (=> b!302975 (=> (not res!160462) (not e!190820))))

(declare-fun lt!150153 () SeekEntryResult!2417)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15378 (_ BitVec 32)) SeekEntryResult!2417)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302975 (= res!160462 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150153))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!302975 (= lt!150153 (Intermediate!2417 false resIndex!52 resX!52))))

(declare-fun b!302976 () Bool)

(declare-fun res!160466 () Bool)

(assert (=> b!302976 (=> (not res!160466) (not e!190820))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!302976 (= res!160466 (and (= (select (arr!7277 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7629 a!3293))))))

(declare-fun b!302977 () Bool)

(declare-fun res!160460 () Bool)

(assert (=> b!302977 (=> (not res!160460) (not e!190821))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302977 (= res!160460 (validKeyInArray!0 k!2441))))

(declare-fun b!302978 () Bool)

(declare-fun res!160464 () Bool)

(assert (=> b!302978 (=> (not res!160464) (not e!190820))))

(assert (=> b!302978 (= res!160464 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150153))))

(declare-fun b!302979 () Bool)

(declare-fun res!160463 () Bool)

(assert (=> b!302979 (=> (not res!160463) (not e!190821))))

(assert (=> b!302979 (= res!160463 (and (= (size!7629 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7629 a!3293))))))

(declare-fun res!160467 () Bool)

(assert (=> start!30272 (=> (not res!160467) (not e!190821))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30272 (= res!160467 (validMask!0 mask!3709))))

(assert (=> start!30272 e!190821))

(declare-fun array_inv!5240 (array!15378) Bool)

(assert (=> start!30272 (array_inv!5240 a!3293)))

(assert (=> start!30272 true))

(declare-fun b!302980 () Bool)

(assert (=> b!302980 (= e!190820 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7277 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7277 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7277 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3709 #b00000000000000000000000000000000)))))

(declare-fun b!302981 () Bool)

(declare-fun res!160459 () Bool)

(assert (=> b!302981 (=> (not res!160459) (not e!190821))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15378 (_ BitVec 32)) Bool)

(assert (=> b!302981 (= res!160459 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30272 res!160467) b!302979))

(assert (= (and b!302979 res!160463) b!302977))

(assert (= (and b!302977 res!160460) b!302973))

(assert (= (and b!302973 res!160465) b!302974))

(assert (= (and b!302974 res!160461) b!302981))

(assert (= (and b!302981 res!160459) b!302975))

(assert (= (and b!302975 res!160462) b!302976))

(assert (= (and b!302976 res!160466) b!302978))

(assert (= (and b!302978 res!160464) b!302980))

(declare-fun m!314405 () Bool)

(assert (=> b!302977 m!314405))

(declare-fun m!314407 () Bool)

(assert (=> b!302981 m!314407))

(declare-fun m!314409 () Bool)

(assert (=> b!302975 m!314409))

(assert (=> b!302975 m!314409))

(declare-fun m!314411 () Bool)

(assert (=> b!302975 m!314411))

(declare-fun m!314413 () Bool)

(assert (=> b!302974 m!314413))

(declare-fun m!314415 () Bool)

(assert (=> b!302973 m!314415))

(declare-fun m!314417 () Bool)

(assert (=> start!30272 m!314417))

(declare-fun m!314419 () Bool)

(assert (=> start!30272 m!314419))

(declare-fun m!314421 () Bool)

(assert (=> b!302978 m!314421))

(declare-fun m!314423 () Bool)

(assert (=> b!302976 m!314423))

(declare-fun m!314425 () Bool)

(assert (=> b!302980 m!314425))

(push 1)

(assert (not b!302977))

(assert (not b!302978))

(assert (not b!302981))

(assert (not start!30272))

(assert (not b!302973))

(assert (not b!302974))

(assert (not b!302975))

(check-sat)

(pop 1)

