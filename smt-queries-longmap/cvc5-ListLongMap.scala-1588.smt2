; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30152 () Bool)

(assert start!30152)

(declare-fun b!301952 () Bool)

(declare-fun res!159562 () Bool)

(declare-fun e!190459 () Bool)

(assert (=> b!301952 (=> (not res!159562) (not e!190459))))

(declare-datatypes ((array!15303 0))(
  ( (array!15304 (arr!7241 (Array (_ BitVec 32) (_ BitVec 64))) (size!7593 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15303)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15303 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301952 (= res!159562 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!159565 () Bool)

(assert (=> start!30152 (=> (not res!159565) (not e!190459))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30152 (= res!159565 (validMask!0 mask!3709))))

(assert (=> start!30152 e!190459))

(declare-fun array_inv!5204 (array!15303) Bool)

(assert (=> start!30152 (array_inv!5204 a!3293)))

(assert (=> start!30152 true))

(declare-fun b!301953 () Bool)

(declare-fun res!159564 () Bool)

(assert (=> b!301953 (=> (not res!159564) (not e!190459))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2381 0))(
  ( (MissingZero!2381 (index!11700 (_ BitVec 32))) (Found!2381 (index!11701 (_ BitVec 32))) (Intermediate!2381 (undefined!3193 Bool) (index!11702 (_ BitVec 32)) (x!29976 (_ BitVec 32))) (Undefined!2381) (MissingVacant!2381 (index!11703 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15303 (_ BitVec 32)) SeekEntryResult!2381)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301953 (= res!159564 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2381 false resIndex!52 resX!52)))))

(declare-fun b!301954 () Bool)

(declare-fun res!159567 () Bool)

(assert (=> b!301954 (=> (not res!159567) (not e!190459))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15303 (_ BitVec 32)) Bool)

(assert (=> b!301954 (= res!159567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301955 () Bool)

(declare-fun res!159563 () Bool)

(assert (=> b!301955 (=> (not res!159563) (not e!190459))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301955 (= res!159563 (and (= (size!7593 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7593 a!3293))))))

(declare-fun b!301956 () Bool)

(declare-fun res!159566 () Bool)

(assert (=> b!301956 (=> (not res!159566) (not e!190459))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15303 (_ BitVec 32)) SeekEntryResult!2381)

(assert (=> b!301956 (= res!159566 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2381 i!1240)))))

(declare-fun b!301957 () Bool)

(declare-fun res!159561 () Bool)

(assert (=> b!301957 (=> (not res!159561) (not e!190459))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301957 (= res!159561 (validKeyInArray!0 k!2441))))

(declare-fun b!301958 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!301958 (= e!190459 (and (= (select (arr!7241 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7593 a!3293)) (bvslt mask!3709 #b00000000000000000000000000000000)))))

(assert (= (and start!30152 res!159565) b!301955))

(assert (= (and b!301955 res!159563) b!301957))

(assert (= (and b!301957 res!159561) b!301952))

(assert (= (and b!301952 res!159562) b!301956))

(assert (= (and b!301956 res!159566) b!301954))

(assert (= (and b!301954 res!159567) b!301953))

(assert (= (and b!301953 res!159564) b!301958))

(declare-fun m!313613 () Bool)

(assert (=> b!301958 m!313613))

(declare-fun m!313615 () Bool)

(assert (=> b!301953 m!313615))

(assert (=> b!301953 m!313615))

(declare-fun m!313617 () Bool)

(assert (=> b!301953 m!313617))

(declare-fun m!313619 () Bool)

(assert (=> b!301952 m!313619))

(declare-fun m!313621 () Bool)

(assert (=> start!30152 m!313621))

(declare-fun m!313623 () Bool)

(assert (=> start!30152 m!313623))

(declare-fun m!313625 () Bool)

(assert (=> b!301957 m!313625))

(declare-fun m!313627 () Bool)

(assert (=> b!301954 m!313627))

(declare-fun m!313629 () Bool)

(assert (=> b!301956 m!313629))

(push 1)

(assert (not b!301957))

(assert (not b!301952))

(assert (not b!301953))

(assert (not b!301956))

(assert (not b!301954))

(assert (not start!30152))

