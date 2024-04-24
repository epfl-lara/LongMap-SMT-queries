; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30628 () Bool)

(assert start!30628)

(declare-fun b!307448 () Bool)

(declare-fun res!164258 () Bool)

(declare-fun e!192489 () Bool)

(assert (=> b!307448 (=> (not res!164258) (not e!192489))))

(declare-datatypes ((array!15645 0))(
  ( (array!15646 (arr!7407 (Array (_ BitVec 32) (_ BitVec 64))) (size!7759 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15645)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!307448 (= res!164258 (and (= (size!7759 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7759 a!3293))))))

(declare-fun b!307449 () Bool)

(declare-fun res!164256 () Bool)

(assert (=> b!307449 (=> (not res!164256) (not e!192489))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!307449 (= res!164256 (and (= (select (arr!7407 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7759 a!3293))))))

(declare-fun b!307450 () Bool)

(declare-fun res!164252 () Bool)

(assert (=> b!307450 (=> (not res!164252) (not e!192489))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15645 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307450 (= res!164252 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!164254 () Bool)

(assert (=> start!30628 (=> (not res!164254) (not e!192489))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30628 (= res!164254 (validMask!0 mask!3709))))

(assert (=> start!30628 e!192489))

(declare-fun array_inv!5357 (array!15645) Bool)

(assert (=> start!30628 (array_inv!5357 a!3293)))

(assert (=> start!30628 true))

(declare-fun b!307451 () Bool)

(declare-fun res!164255 () Bool)

(assert (=> b!307451 (=> (not res!164255) (not e!192489))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307451 (= res!164255 (validKeyInArray!0 k!2441))))

(declare-fun b!307452 () Bool)

(declare-fun res!164257 () Bool)

(assert (=> b!307452 (=> (not res!164257) (not e!192489))))

(declare-datatypes ((SeekEntryResult!2512 0))(
  ( (MissingZero!2512 (index!12224 (_ BitVec 32))) (Found!2512 (index!12225 (_ BitVec 32))) (Intermediate!2512 (undefined!3324 Bool) (index!12226 (_ BitVec 32)) (x!30568 (_ BitVec 32))) (Undefined!2512) (MissingVacant!2512 (index!12227 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15645 (_ BitVec 32)) SeekEntryResult!2512)

(assert (=> b!307452 (= res!164257 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2512 i!1240)))))

(declare-fun b!307453 () Bool)

(assert (=> b!307453 (= e!192489 false)))

(declare-fun lt!151158 () SeekEntryResult!2512)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15645 (_ BitVec 32)) SeekEntryResult!2512)

(assert (=> b!307453 (= lt!151158 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!307454 () Bool)

(declare-fun res!164259 () Bool)

(assert (=> b!307454 (=> (not res!164259) (not e!192489))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307454 (= res!164259 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2512 false resIndex!52 resX!52)))))

(declare-fun b!307455 () Bool)

(declare-fun res!164253 () Bool)

(assert (=> b!307455 (=> (not res!164253) (not e!192489))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15645 (_ BitVec 32)) Bool)

(assert (=> b!307455 (= res!164253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30628 res!164254) b!307448))

(assert (= (and b!307448 res!164258) b!307451))

(assert (= (and b!307451 res!164255) b!307450))

(assert (= (and b!307450 res!164252) b!307452))

(assert (= (and b!307452 res!164257) b!307455))

(assert (= (and b!307455 res!164253) b!307454))

(assert (= (and b!307454 res!164259) b!307449))

(assert (= (and b!307449 res!164256) b!307453))

(declare-fun m!317921 () Bool)

(assert (=> start!30628 m!317921))

(declare-fun m!317923 () Bool)

(assert (=> start!30628 m!317923))

(declare-fun m!317925 () Bool)

(assert (=> b!307452 m!317925))

(declare-fun m!317927 () Bool)

(assert (=> b!307455 m!317927))

(declare-fun m!317929 () Bool)

(assert (=> b!307454 m!317929))

(assert (=> b!307454 m!317929))

(declare-fun m!317931 () Bool)

(assert (=> b!307454 m!317931))

(declare-fun m!317933 () Bool)

(assert (=> b!307449 m!317933))

(declare-fun m!317935 () Bool)

(assert (=> b!307451 m!317935))

(declare-fun m!317937 () Bool)

(assert (=> b!307453 m!317937))

(declare-fun m!317939 () Bool)

(assert (=> b!307450 m!317939))

(push 1)

(assert (not b!307453))

(assert (not b!307450))

(assert (not b!307455))

(assert (not b!307452))

(assert (not start!30628))

(assert (not b!307454))

(assert (not b!307451))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

