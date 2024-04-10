; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30020 () Bool)

(assert start!30020)

(declare-fun b!301216 () Bool)

(declare-fun res!158966 () Bool)

(declare-fun e!190140 () Bool)

(assert (=> b!301216 (=> (not res!158966) (not e!190140))))

(declare-datatypes ((array!15240 0))(
  ( (array!15241 (arr!7212 (Array (_ BitVec 32) (_ BitVec 64))) (size!7564 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15240)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15240 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301216 (= res!158966 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301217 () Bool)

(declare-fun res!158969 () Bool)

(assert (=> b!301217 (=> (not res!158969) (not e!190140))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2352 0))(
  ( (MissingZero!2352 (index!11584 (_ BitVec 32))) (Found!2352 (index!11585 (_ BitVec 32))) (Intermediate!2352 (undefined!3164 Bool) (index!11586 (_ BitVec 32)) (x!29864 (_ BitVec 32))) (Undefined!2352) (MissingVacant!2352 (index!11587 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15240 (_ BitVec 32)) SeekEntryResult!2352)

(assert (=> b!301217 (= res!158969 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2352 i!1240)))))

(declare-fun b!301218 () Bool)

(declare-fun res!158968 () Bool)

(assert (=> b!301218 (=> (not res!158968) (not e!190140))))

(assert (=> b!301218 (= res!158968 (and (= (size!7564 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7564 a!3293))))))

(declare-fun b!301219 () Bool)

(declare-fun res!158970 () Bool)

(assert (=> b!301219 (=> (not res!158970) (not e!190140))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301219 (= res!158970 (validKeyInArray!0 k0!2441))))

(declare-fun b!301220 () Bool)

(assert (=> b!301220 (= e!190140 (bvsgt #b00000000000000000000000000000000 (size!7564 a!3293)))))

(declare-fun res!158967 () Bool)

(assert (=> start!30020 (=> (not res!158967) (not e!190140))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30020 (= res!158967 (validMask!0 mask!3709))))

(assert (=> start!30020 e!190140))

(assert (=> start!30020 true))

(declare-fun array_inv!5175 (array!15240) Bool)

(assert (=> start!30020 (array_inv!5175 a!3293)))

(assert (= (and start!30020 res!158967) b!301218))

(assert (= (and b!301218 res!158968) b!301219))

(assert (= (and b!301219 res!158970) b!301216))

(assert (= (and b!301216 res!158966) b!301217))

(assert (= (and b!301217 res!158969) b!301220))

(declare-fun m!313069 () Bool)

(assert (=> b!301216 m!313069))

(declare-fun m!313071 () Bool)

(assert (=> b!301217 m!313071))

(declare-fun m!313073 () Bool)

(assert (=> b!301219 m!313073))

(declare-fun m!313075 () Bool)

(assert (=> start!30020 m!313075))

(declare-fun m!313077 () Bool)

(assert (=> start!30020 m!313077))

(check-sat (not b!301216) (not start!30020) (not b!301217) (not b!301219))
(check-sat)
