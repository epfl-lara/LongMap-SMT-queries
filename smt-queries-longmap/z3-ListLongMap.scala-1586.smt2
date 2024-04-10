; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30142 () Bool)

(assert start!30142)

(declare-fun b!301860 () Bool)

(declare-fun res!159473 () Bool)

(declare-fun e!190429 () Bool)

(assert (=> b!301860 (=> (not res!159473) (not e!190429))))

(declare-datatypes ((array!15293 0))(
  ( (array!15294 (arr!7236 (Array (_ BitVec 32) (_ BitVec 64))) (size!7588 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15293)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301860 (= res!159473 (and (= (size!7588 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7588 a!3293))))))

(declare-fun res!159470 () Bool)

(assert (=> start!30142 (=> (not res!159470) (not e!190429))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30142 (= res!159470 (validMask!0 mask!3709))))

(assert (=> start!30142 e!190429))

(assert (=> start!30142 true))

(declare-fun array_inv!5199 (array!15293) Bool)

(assert (=> start!30142 (array_inv!5199 a!3293)))

(declare-fun b!301861 () Bool)

(declare-fun res!159474 () Bool)

(assert (=> b!301861 (=> (not res!159474) (not e!190429))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15293 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301861 (= res!159474 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301862 () Bool)

(declare-fun res!159472 () Bool)

(assert (=> b!301862 (=> (not res!159472) (not e!190429))))

(declare-datatypes ((SeekEntryResult!2376 0))(
  ( (MissingZero!2376 (index!11680 (_ BitVec 32))) (Found!2376 (index!11681 (_ BitVec 32))) (Intermediate!2376 (undefined!3188 Bool) (index!11682 (_ BitVec 32)) (x!29955 (_ BitVec 32))) (Undefined!2376) (MissingVacant!2376 (index!11683 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15293 (_ BitVec 32)) SeekEntryResult!2376)

(assert (=> b!301862 (= res!159472 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2376 i!1240)))))

(declare-fun b!301863 () Bool)

(declare-fun res!159469 () Bool)

(assert (=> b!301863 (=> (not res!159469) (not e!190429))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15293 (_ BitVec 32)) Bool)

(assert (=> b!301863 (= res!159469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301864 () Bool)

(assert (=> b!301864 (= e!190429 false)))

(declare-fun lt!149967 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301864 (= lt!149967 (toIndex!0 k0!2441 mask!3709))))

(declare-fun b!301865 () Bool)

(declare-fun res!159471 () Bool)

(assert (=> b!301865 (=> (not res!159471) (not e!190429))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301865 (= res!159471 (validKeyInArray!0 k0!2441))))

(assert (= (and start!30142 res!159470) b!301860))

(assert (= (and b!301860 res!159473) b!301865))

(assert (= (and b!301865 res!159471) b!301861))

(assert (= (and b!301861 res!159474) b!301862))

(assert (= (and b!301862 res!159472) b!301863))

(assert (= (and b!301863 res!159469) b!301864))

(declare-fun m!313537 () Bool)

(assert (=> start!30142 m!313537))

(declare-fun m!313539 () Bool)

(assert (=> start!30142 m!313539))

(declare-fun m!313541 () Bool)

(assert (=> b!301863 m!313541))

(declare-fun m!313543 () Bool)

(assert (=> b!301862 m!313543))

(declare-fun m!313545 () Bool)

(assert (=> b!301865 m!313545))

(declare-fun m!313547 () Bool)

(assert (=> b!301861 m!313547))

(declare-fun m!313549 () Bool)

(assert (=> b!301864 m!313549))

(check-sat (not b!301865) (not b!301861) (not b!301863) (not b!301864) (not start!30142) (not b!301862))
(check-sat)
