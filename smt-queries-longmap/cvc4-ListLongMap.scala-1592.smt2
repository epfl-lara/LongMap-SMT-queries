; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30228 () Bool)

(assert start!30228)

(declare-fun res!159907 () Bool)

(declare-fun e!190659 () Bool)

(assert (=> start!30228 (=> (not res!159907) (not e!190659))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30228 (= res!159907 (validMask!0 mask!3709))))

(assert (=> start!30228 e!190659))

(assert (=> start!30228 true))

(declare-datatypes ((array!15334 0))(
  ( (array!15335 (arr!7255 (Array (_ BitVec 32) (_ BitVec 64))) (size!7607 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15334)

(declare-fun array_inv!5218 (array!15334) Bool)

(assert (=> start!30228 (array_inv!5218 a!3293)))

(declare-fun b!302418 () Bool)

(declare-fun res!159905 () Bool)

(assert (=> b!302418 (=> (not res!159905) (not e!190659))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!302418 (= res!159905 (and (= (size!7607 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7607 a!3293))))))

(declare-fun b!302419 () Bool)

(declare-fun res!159906 () Bool)

(assert (=> b!302419 (=> (not res!159906) (not e!190659))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15334 (_ BitVec 32)) Bool)

(assert (=> b!302419 (= res!159906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!302420 () Bool)

(declare-fun res!159908 () Bool)

(assert (=> b!302420 (=> (not res!159908) (not e!190659))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302420 (= res!159908 (validKeyInArray!0 k!2441))))

(declare-fun b!302421 () Bool)

(declare-fun res!159904 () Bool)

(assert (=> b!302421 (=> (not res!159904) (not e!190659))))

(declare-datatypes ((SeekEntryResult!2395 0))(
  ( (MissingZero!2395 (index!11756 (_ BitVec 32))) (Found!2395 (index!11757 (_ BitVec 32))) (Intermediate!2395 (undefined!3207 Bool) (index!11758 (_ BitVec 32)) (x!30028 (_ BitVec 32))) (Undefined!2395) (MissingVacant!2395 (index!11759 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15334 (_ BitVec 32)) SeekEntryResult!2395)

(assert (=> b!302421 (= res!159904 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2395 i!1240)))))

(declare-fun b!302422 () Bool)

(declare-fun res!159909 () Bool)

(assert (=> b!302422 (=> (not res!159909) (not e!190659))))

(declare-fun arrayContainsKey!0 (array!15334 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302422 (= res!159909 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302423 () Bool)

(assert (=> b!302423 (= e!190659 false)))

(declare-fun lt!150087 () SeekEntryResult!2395)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15334 (_ BitVec 32)) SeekEntryResult!2395)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302423 (= lt!150087 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(assert (= (and start!30228 res!159907) b!302418))

(assert (= (and b!302418 res!159905) b!302420))

(assert (= (and b!302420 res!159908) b!302422))

(assert (= (and b!302422 res!159909) b!302421))

(assert (= (and b!302421 res!159904) b!302419))

(assert (= (and b!302419 res!159906) b!302423))

(declare-fun m!313951 () Bool)

(assert (=> b!302420 m!313951))

(declare-fun m!313953 () Bool)

(assert (=> b!302419 m!313953))

(declare-fun m!313955 () Bool)

(assert (=> start!30228 m!313955))

(declare-fun m!313957 () Bool)

(assert (=> start!30228 m!313957))

(declare-fun m!313959 () Bool)

(assert (=> b!302423 m!313959))

(assert (=> b!302423 m!313959))

(declare-fun m!313961 () Bool)

(assert (=> b!302423 m!313961))

(declare-fun m!313963 () Bool)

(assert (=> b!302422 m!313963))

(declare-fun m!313965 () Bool)

(assert (=> b!302421 m!313965))

(push 1)

(assert (not b!302419))

(assert (not b!302422))

(assert (not b!302420))

(assert (not b!302421))

(assert (not b!302423))

(assert (not start!30228))

(check-sat)

(pop 1)

