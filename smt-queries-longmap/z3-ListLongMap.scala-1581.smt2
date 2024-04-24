; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30054 () Bool)

(assert start!30054)

(declare-fun b!301411 () Bool)

(declare-fun res!159141 () Bool)

(declare-fun e!190227 () Bool)

(assert (=> b!301411 (=> (not res!159141) (not e!190227))))

(declare-datatypes ((array!15257 0))(
  ( (array!15258 (arr!7219 (Array (_ BitVec 32) (_ BitVec 64))) (size!7571 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15257)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301411 (= res!159141 (and (= (size!7571 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7571 a!3293))))))

(declare-fun b!301412 () Bool)

(assert (=> b!301412 (= e!190227 false)))

(declare-fun lt!149865 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301412 (= lt!149865 (toIndex!0 k0!2441 mask!3709))))

(declare-fun b!301413 () Bool)

(declare-fun res!159139 () Bool)

(assert (=> b!301413 (=> (not res!159139) (not e!190227))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15257 (_ BitVec 32)) Bool)

(assert (=> b!301413 (= res!159139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301414 () Bool)

(declare-fun res!159144 () Bool)

(assert (=> b!301414 (=> (not res!159144) (not e!190227))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301414 (= res!159144 (validKeyInArray!0 k0!2441))))

(declare-fun b!301415 () Bool)

(declare-fun res!159140 () Bool)

(assert (=> b!301415 (=> (not res!159140) (not e!190227))))

(declare-fun arrayContainsKey!0 (array!15257 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301415 (= res!159140 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301416 () Bool)

(declare-fun res!159142 () Bool)

(assert (=> b!301416 (=> (not res!159142) (not e!190227))))

(declare-datatypes ((SeekEntryResult!2324 0))(
  ( (MissingZero!2324 (index!11472 (_ BitVec 32))) (Found!2324 (index!11473 (_ BitVec 32))) (Intermediate!2324 (undefined!3136 Bool) (index!11474 (_ BitVec 32)) (x!29857 (_ BitVec 32))) (Undefined!2324) (MissingVacant!2324 (index!11475 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15257 (_ BitVec 32)) SeekEntryResult!2324)

(assert (=> b!301416 (= res!159142 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2324 i!1240)))))

(declare-fun res!159143 () Bool)

(assert (=> start!30054 (=> (not res!159143) (not e!190227))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30054 (= res!159143 (validMask!0 mask!3709))))

(assert (=> start!30054 e!190227))

(assert (=> start!30054 true))

(declare-fun array_inv!5169 (array!15257) Bool)

(assert (=> start!30054 (array_inv!5169 a!3293)))

(assert (= (and start!30054 res!159143) b!301411))

(assert (= (and b!301411 res!159141) b!301414))

(assert (= (and b!301414 res!159144) b!301415))

(assert (= (and b!301415 res!159140) b!301416))

(assert (= (and b!301416 res!159142) b!301413))

(assert (= (and b!301413 res!159139) b!301412))

(declare-fun m!313345 () Bool)

(assert (=> b!301413 m!313345))

(declare-fun m!313347 () Bool)

(assert (=> b!301416 m!313347))

(declare-fun m!313349 () Bool)

(assert (=> b!301414 m!313349))

(declare-fun m!313351 () Bool)

(assert (=> b!301415 m!313351))

(declare-fun m!313353 () Bool)

(assert (=> start!30054 m!313353))

(declare-fun m!313355 () Bool)

(assert (=> start!30054 m!313355))

(declare-fun m!313357 () Bool)

(assert (=> b!301412 m!313357))

(check-sat (not b!301415) (not b!301414) (not b!301416) (not b!301413) (not b!301412) (not start!30054))
(check-sat)
