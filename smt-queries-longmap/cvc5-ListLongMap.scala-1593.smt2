; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30230 () Bool)

(assert start!30230)

(declare-fun b!302440 () Bool)

(declare-fun res!159932 () Bool)

(declare-fun e!190666 () Bool)

(assert (=> b!302440 (=> (not res!159932) (not e!190666))))

(declare-datatypes ((array!15336 0))(
  ( (array!15337 (arr!7256 (Array (_ BitVec 32) (_ BitVec 64))) (size!7608 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15336)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15336 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302440 (= res!159932 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302441 () Bool)

(declare-fun res!159927 () Bool)

(assert (=> b!302441 (=> (not res!159927) (not e!190666))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15336 (_ BitVec 32)) Bool)

(assert (=> b!302441 (= res!159927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!302442 () Bool)

(declare-fun res!159926 () Bool)

(assert (=> b!302442 (=> (not res!159926) (not e!190666))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!302442 (= res!159926 (and (= (select (arr!7256 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7608 a!3293))))))

(declare-fun res!159931 () Bool)

(assert (=> start!30230 (=> (not res!159931) (not e!190666))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30230 (= res!159931 (validMask!0 mask!3709))))

(assert (=> start!30230 e!190666))

(declare-fun array_inv!5219 (array!15336) Bool)

(assert (=> start!30230 (array_inv!5219 a!3293)))

(assert (=> start!30230 true))

(declare-fun b!302443 () Bool)

(declare-fun res!159933 () Bool)

(assert (=> b!302443 (=> (not res!159933) (not e!190666))))

(assert (=> b!302443 (= res!159933 (and (= (size!7608 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7608 a!3293))))))

(declare-fun b!302444 () Bool)

(declare-fun res!159930 () Bool)

(assert (=> b!302444 (=> (not res!159930) (not e!190666))))

(declare-datatypes ((SeekEntryResult!2396 0))(
  ( (MissingZero!2396 (index!11760 (_ BitVec 32))) (Found!2396 (index!11761 (_ BitVec 32))) (Intermediate!2396 (undefined!3208 Bool) (index!11762 (_ BitVec 32)) (x!30037 (_ BitVec 32))) (Undefined!2396) (MissingVacant!2396 (index!11763 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15336 (_ BitVec 32)) SeekEntryResult!2396)

(assert (=> b!302444 (= res!159930 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2396 i!1240)))))

(declare-fun b!302445 () Bool)

(declare-fun res!159929 () Bool)

(assert (=> b!302445 (=> (not res!159929) (not e!190666))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15336 (_ BitVec 32)) SeekEntryResult!2396)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302445 (= res!159929 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2396 false resIndex!52 resX!52)))))

(declare-fun b!302446 () Bool)

(declare-fun res!159928 () Bool)

(assert (=> b!302446 (=> (not res!159928) (not e!190666))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302446 (= res!159928 (validKeyInArray!0 k!2441))))

(declare-fun b!302447 () Bool)

(assert (=> b!302447 (= e!190666 false)))

(declare-fun lt!150090 () SeekEntryResult!2396)

(assert (=> b!302447 (= lt!150090 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(assert (= (and start!30230 res!159931) b!302443))

(assert (= (and b!302443 res!159933) b!302446))

(assert (= (and b!302446 res!159928) b!302440))

(assert (= (and b!302440 res!159932) b!302444))

(assert (= (and b!302444 res!159930) b!302441))

(assert (= (and b!302441 res!159927) b!302445))

(assert (= (and b!302445 res!159929) b!302442))

(assert (= (and b!302442 res!159926) b!302447))

(declare-fun m!313967 () Bool)

(assert (=> b!302447 m!313967))

(declare-fun m!313969 () Bool)

(assert (=> b!302445 m!313969))

(assert (=> b!302445 m!313969))

(declare-fun m!313971 () Bool)

(assert (=> b!302445 m!313971))

(declare-fun m!313973 () Bool)

(assert (=> start!30230 m!313973))

(declare-fun m!313975 () Bool)

(assert (=> start!30230 m!313975))

(declare-fun m!313977 () Bool)

(assert (=> b!302446 m!313977))

(declare-fun m!313979 () Bool)

(assert (=> b!302441 m!313979))

(declare-fun m!313981 () Bool)

(assert (=> b!302442 m!313981))

(declare-fun m!313983 () Bool)

(assert (=> b!302444 m!313983))

(declare-fun m!313985 () Bool)

(assert (=> b!302440 m!313985))

(push 1)

(assert (not b!302440))

(assert (not b!302445))

(assert (not b!302447))

(assert (not b!302441))

(assert (not b!302444))

(assert (not start!30230))

(assert (not b!302446))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

