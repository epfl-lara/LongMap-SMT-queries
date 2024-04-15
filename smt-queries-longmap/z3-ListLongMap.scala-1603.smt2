; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30276 () Bool)

(assert start!30276)

(declare-fun b!302932 () Bool)

(declare-fun e!190718 () Bool)

(declare-fun e!190717 () Bool)

(assert (=> b!302932 (= e!190718 e!190717)))

(declare-fun res!160566 () Bool)

(assert (=> b!302932 (=> (not res!160566) (not e!190717))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2420 0))(
  ( (MissingZero!2420 (index!11856 (_ BitVec 32))) (Found!2420 (index!11857 (_ BitVec 32))) (Intermediate!2420 (undefined!3232 Bool) (index!11858 (_ BitVec 32)) (x!30136 (_ BitVec 32))) (Undefined!2420) (MissingVacant!2420 (index!11859 (_ BitVec 32))) )
))
(declare-fun lt!149945 () SeekEntryResult!2420)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((array!15386 0))(
  ( (array!15387 (arr!7281 (Array (_ BitVec 32) (_ BitVec 64))) (size!7634 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15386)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15386 (_ BitVec 32)) SeekEntryResult!2420)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302932 (= res!160566 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!149945))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!302932 (= lt!149945 (Intermediate!2420 false resIndex!52 resX!52))))

(declare-fun b!302933 () Bool)

(declare-fun res!160571 () Bool)

(assert (=> b!302933 (=> (not res!160571) (not e!190718))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!302933 (= res!160571 (and (= (size!7634 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7634 a!3293))))))

(declare-fun b!302934 () Bool)

(declare-fun res!160570 () Bool)

(assert (=> b!302934 (=> (not res!160570) (not e!190718))))

(declare-fun arrayContainsKey!0 (array!15386 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302934 (= res!160570 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!160568 () Bool)

(assert (=> start!30276 (=> (not res!160568) (not e!190718))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30276 (= res!160568 (validMask!0 mask!3709))))

(assert (=> start!30276 e!190718))

(declare-fun array_inv!5253 (array!15386) Bool)

(assert (=> start!30276 (array_inv!5253 a!3293)))

(assert (=> start!30276 true))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun b!302935 () Bool)

(assert (=> b!302935 (= e!190717 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7281 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7281 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7281 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsgt x!1427 #b01111111111111111111111111111110)))))

(declare-fun b!302936 () Bool)

(declare-fun res!160567 () Bool)

(assert (=> b!302936 (=> (not res!160567) (not e!190718))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302936 (= res!160567 (validKeyInArray!0 k0!2441))))

(declare-fun b!302937 () Bool)

(declare-fun res!160565 () Bool)

(assert (=> b!302937 (=> (not res!160565) (not e!190717))))

(assert (=> b!302937 (= res!160565 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!149945))))

(declare-fun b!302938 () Bool)

(declare-fun res!160564 () Bool)

(assert (=> b!302938 (=> (not res!160564) (not e!190718))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15386 (_ BitVec 32)) SeekEntryResult!2420)

(assert (=> b!302938 (= res!160564 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2420 i!1240)))))

(declare-fun b!302939 () Bool)

(declare-fun res!160569 () Bool)

(assert (=> b!302939 (=> (not res!160569) (not e!190717))))

(assert (=> b!302939 (= res!160569 (and (= (select (arr!7281 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7634 a!3293))))))

(declare-fun b!302940 () Bool)

(declare-fun res!160572 () Bool)

(assert (=> b!302940 (=> (not res!160572) (not e!190718))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15386 (_ BitVec 32)) Bool)

(assert (=> b!302940 (= res!160572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30276 res!160568) b!302933))

(assert (= (and b!302933 res!160571) b!302936))

(assert (= (and b!302936 res!160567) b!302934))

(assert (= (and b!302934 res!160570) b!302938))

(assert (= (and b!302938 res!160564) b!302940))

(assert (= (and b!302940 res!160572) b!302932))

(assert (= (and b!302932 res!160566) b!302939))

(assert (= (and b!302939 res!160569) b!302937))

(assert (= (and b!302937 res!160565) b!302935))

(declare-fun m!313867 () Bool)

(assert (=> b!302935 m!313867))

(declare-fun m!313869 () Bool)

(assert (=> b!302936 m!313869))

(declare-fun m!313871 () Bool)

(assert (=> start!30276 m!313871))

(declare-fun m!313873 () Bool)

(assert (=> start!30276 m!313873))

(declare-fun m!313875 () Bool)

(assert (=> b!302937 m!313875))

(declare-fun m!313877 () Bool)

(assert (=> b!302939 m!313877))

(declare-fun m!313879 () Bool)

(assert (=> b!302938 m!313879))

(declare-fun m!313881 () Bool)

(assert (=> b!302934 m!313881))

(declare-fun m!313883 () Bool)

(assert (=> b!302932 m!313883))

(assert (=> b!302932 m!313883))

(declare-fun m!313885 () Bool)

(assert (=> b!302932 m!313885))

(declare-fun m!313887 () Bool)

(assert (=> b!302940 m!313887))

(check-sat (not start!30276) (not b!302940) (not b!302934) (not b!302937) (not b!302936) (not b!302938) (not b!302932))
(check-sat)
