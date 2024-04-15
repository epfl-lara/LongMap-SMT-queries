; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30622 () Bool)

(assert start!30622)

(declare-fun b!307154 () Bool)

(declare-fun res!164056 () Bool)

(declare-fun e!192328 () Bool)

(assert (=> b!307154 (=> (not res!164056) (not e!192328))))

(declare-datatypes ((array!15630 0))(
  ( (array!15631 (arr!7400 (Array (_ BitVec 32) (_ BitVec 64))) (size!7753 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15630)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!307154 (= res!164056 (and (= (select (arr!7400 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7753 a!3293))))))

(declare-fun b!307155 () Bool)

(declare-fun res!164058 () Bool)

(assert (=> b!307155 (=> (not res!164058) (not e!192328))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2539 0))(
  ( (MissingZero!2539 (index!12332 (_ BitVec 32))) (Found!2539 (index!12333 (_ BitVec 32))) (Intermediate!2539 (undefined!3351 Bool) (index!12334 (_ BitVec 32)) (x!30585 (_ BitVec 32))) (Undefined!2539) (MissingVacant!2539 (index!12335 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15630 (_ BitVec 32)) SeekEntryResult!2539)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307155 (= res!164058 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2539 false resIndex!52 resX!52)))))

(declare-fun b!307156 () Bool)

(declare-fun res!164054 () Bool)

(assert (=> b!307156 (=> (not res!164054) (not e!192328))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15630 (_ BitVec 32)) SeekEntryResult!2539)

(assert (=> b!307156 (= res!164054 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2539 i!1240)))))

(declare-fun b!307157 () Bool)

(assert (=> b!307157 (= e!192328 false)))

(declare-fun lt!150896 () SeekEntryResult!2539)

(assert (=> b!307157 (= lt!150896 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun res!164059 () Bool)

(assert (=> start!30622 (=> (not res!164059) (not e!192328))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30622 (= res!164059 (validMask!0 mask!3709))))

(assert (=> start!30622 e!192328))

(declare-fun array_inv!5372 (array!15630) Bool)

(assert (=> start!30622 (array_inv!5372 a!3293)))

(assert (=> start!30622 true))

(declare-fun b!307158 () Bool)

(declare-fun res!164057 () Bool)

(assert (=> b!307158 (=> (not res!164057) (not e!192328))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307158 (= res!164057 (validKeyInArray!0 k!2441))))

(declare-fun b!307159 () Bool)

(declare-fun res!164060 () Bool)

(assert (=> b!307159 (=> (not res!164060) (not e!192328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15630 (_ BitVec 32)) Bool)

(assert (=> b!307159 (= res!164060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307160 () Bool)

(declare-fun res!164061 () Bool)

(assert (=> b!307160 (=> (not res!164061) (not e!192328))))

(declare-fun arrayContainsKey!0 (array!15630 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307160 (= res!164061 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!307161 () Bool)

(declare-fun res!164055 () Bool)

(assert (=> b!307161 (=> (not res!164055) (not e!192328))))

(assert (=> b!307161 (= res!164055 (and (= (size!7753 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7753 a!3293))))))

(assert (= (and start!30622 res!164059) b!307161))

(assert (= (and b!307161 res!164055) b!307158))

(assert (= (and b!307158 res!164057) b!307160))

(assert (= (and b!307160 res!164061) b!307156))

(assert (= (and b!307156 res!164054) b!307159))

(assert (= (and b!307159 res!164060) b!307155))

(assert (= (and b!307155 res!164058) b!307154))

(assert (= (and b!307154 res!164056) b!307157))

(declare-fun m!317009 () Bool)

(assert (=> b!307155 m!317009))

(assert (=> b!307155 m!317009))

(declare-fun m!317011 () Bool)

(assert (=> b!307155 m!317011))

(declare-fun m!317013 () Bool)

(assert (=> b!307158 m!317013))

(declare-fun m!317015 () Bool)

(assert (=> start!30622 m!317015))

(declare-fun m!317017 () Bool)

(assert (=> start!30622 m!317017))

(declare-fun m!317019 () Bool)

(assert (=> b!307156 m!317019))

(declare-fun m!317021 () Bool)

(assert (=> b!307157 m!317021))

(declare-fun m!317023 () Bool)

(assert (=> b!307154 m!317023))

(declare-fun m!317025 () Bool)

(assert (=> b!307159 m!317025))

(declare-fun m!317027 () Bool)

(assert (=> b!307160 m!317027))

(push 1)

(assert (not b!307159))

(assert (not b!307156))

(assert (not start!30622))

(assert (not b!307158))

(assert (not b!307160))

(assert (not b!307155))

(assert (not b!307157))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

