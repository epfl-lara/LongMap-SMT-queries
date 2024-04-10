; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30014 () Bool)

(assert start!30014)

(declare-fun b!301175 () Bool)

(declare-fun res!158926 () Bool)

(declare-fun e!190122 () Bool)

(assert (=> b!301175 (=> (not res!158926) (not e!190122))))

(declare-datatypes ((array!15234 0))(
  ( (array!15235 (arr!7209 (Array (_ BitVec 32) (_ BitVec 64))) (size!7561 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15234)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301175 (= res!158926 (and (= (size!7561 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7561 a!3293))))))

(declare-fun b!301176 () Bool)

(declare-fun res!158927 () Bool)

(assert (=> b!301176 (=> (not res!158927) (not e!190122))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301176 (= res!158927 (validKeyInArray!0 k0!2441))))

(declare-fun res!158928 () Bool)

(assert (=> start!30014 (=> (not res!158928) (not e!190122))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30014 (= res!158928 (validMask!0 mask!3709))))

(assert (=> start!30014 e!190122))

(assert (=> start!30014 true))

(declare-fun array_inv!5172 (array!15234) Bool)

(assert (=> start!30014 (array_inv!5172 a!3293)))

(declare-fun b!301177 () Bool)

(declare-fun res!158925 () Bool)

(assert (=> b!301177 (=> (not res!158925) (not e!190122))))

(declare-fun arrayContainsKey!0 (array!15234 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301177 (= res!158925 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301178 () Bool)

(assert (=> b!301178 (= e!190122 false)))

(declare-datatypes ((SeekEntryResult!2349 0))(
  ( (MissingZero!2349 (index!11572 (_ BitVec 32))) (Found!2349 (index!11573 (_ BitVec 32))) (Intermediate!2349 (undefined!3161 Bool) (index!11574 (_ BitVec 32)) (x!29853 (_ BitVec 32))) (Undefined!2349) (MissingVacant!2349 (index!11575 (_ BitVec 32))) )
))
(declare-fun lt!149787 () SeekEntryResult!2349)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15234 (_ BitVec 32)) SeekEntryResult!2349)

(assert (=> b!301178 (= lt!149787 (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709))))

(assert (= (and start!30014 res!158928) b!301175))

(assert (= (and b!301175 res!158926) b!301176))

(assert (= (and b!301176 res!158927) b!301177))

(assert (= (and b!301177 res!158925) b!301178))

(declare-fun m!313039 () Bool)

(assert (=> b!301176 m!313039))

(declare-fun m!313041 () Bool)

(assert (=> start!30014 m!313041))

(declare-fun m!313043 () Bool)

(assert (=> start!30014 m!313043))

(declare-fun m!313045 () Bool)

(assert (=> b!301177 m!313045))

(declare-fun m!313047 () Bool)

(assert (=> b!301178 m!313047))

(check-sat (not b!301177) (not start!30014) (not b!301178) (not b!301176))
