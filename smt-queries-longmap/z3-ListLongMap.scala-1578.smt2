; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30000 () Bool)

(assert start!30000)

(declare-fun b!301149 () Bool)

(declare-fun e!190100 () Bool)

(declare-datatypes ((array!15236 0))(
  ( (array!15237 (arr!7210 (Array (_ BitVec 32) (_ BitVec 64))) (size!7562 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15236)

(assert (=> b!301149 (= e!190100 (bvsgt #b00000000000000000000000000000000 (size!7562 a!3293)))))

(declare-fun b!301150 () Bool)

(declare-fun res!158950 () Bool)

(assert (=> b!301150 (=> (not res!158950) (not e!190100))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301150 (= res!158950 (and (= (size!7562 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7562 a!3293))))))

(declare-fun b!301151 () Bool)

(declare-fun res!158949 () Bool)

(assert (=> b!301151 (=> (not res!158949) (not e!190100))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2315 0))(
  ( (MissingZero!2315 (index!11436 (_ BitVec 32))) (Found!2315 (index!11437 (_ BitVec 32))) (Intermediate!2315 (undefined!3127 Bool) (index!11438 (_ BitVec 32)) (x!29824 (_ BitVec 32))) (Undefined!2315) (MissingVacant!2315 (index!11439 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15236 (_ BitVec 32)) SeekEntryResult!2315)

(assert (=> b!301151 (= res!158949 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2315 i!1240)))))

(declare-fun b!301152 () Bool)

(declare-fun res!158951 () Bool)

(assert (=> b!301152 (=> (not res!158951) (not e!190100))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301152 (= res!158951 (validKeyInArray!0 k0!2441))))

(declare-fun res!158948 () Bool)

(assert (=> start!30000 (=> (not res!158948) (not e!190100))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30000 (= res!158948 (validMask!0 mask!3709))))

(assert (=> start!30000 e!190100))

(assert (=> start!30000 true))

(declare-fun array_inv!5160 (array!15236) Bool)

(assert (=> start!30000 (array_inv!5160 a!3293)))

(declare-fun b!301148 () Bool)

(declare-fun res!158952 () Bool)

(assert (=> b!301148 (=> (not res!158952) (not e!190100))))

(declare-fun arrayContainsKey!0 (array!15236 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301148 (= res!158952 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30000 res!158948) b!301150))

(assert (= (and b!301150 res!158950) b!301152))

(assert (= (and b!301152 res!158951) b!301148))

(assert (= (and b!301148 res!158952) b!301151))

(assert (= (and b!301151 res!158949) b!301149))

(declare-fun m!313161 () Bool)

(assert (=> b!301151 m!313161))

(declare-fun m!313163 () Bool)

(assert (=> b!301152 m!313163))

(declare-fun m!313165 () Bool)

(assert (=> start!30000 m!313165))

(declare-fun m!313167 () Bool)

(assert (=> start!30000 m!313167))

(declare-fun m!313169 () Bool)

(assert (=> b!301148 m!313169))

(check-sat (not b!301148) (not start!30000) (not b!301152) (not b!301151))
(check-sat)
