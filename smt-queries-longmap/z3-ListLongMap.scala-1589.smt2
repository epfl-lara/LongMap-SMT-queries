; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30160 () Bool)

(assert start!30160)

(declare-fun b!302031 () Bool)

(declare-fun res!159642 () Bool)

(declare-fun e!190483 () Bool)

(assert (=> b!302031 (=> (not res!159642) (not e!190483))))

(declare-datatypes ((array!15311 0))(
  ( (array!15312 (arr!7245 (Array (_ BitVec 32) (_ BitVec 64))) (size!7597 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15311)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2385 0))(
  ( (MissingZero!2385 (index!11716 (_ BitVec 32))) (Found!2385 (index!11717 (_ BitVec 32))) (Intermediate!2385 (undefined!3197 Bool) (index!11718 (_ BitVec 32)) (x!29988 (_ BitVec 32))) (Undefined!2385) (MissingVacant!2385 (index!11719 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15311 (_ BitVec 32)) SeekEntryResult!2385)

(assert (=> b!302031 (= res!159642 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2385 i!1240)))))

(declare-fun b!302032 () Bool)

(declare-fun res!159644 () Bool)

(assert (=> b!302032 (=> (not res!159644) (not e!190483))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15311 (_ BitVec 32)) Bool)

(assert (=> b!302032 (= res!159644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!302033 () Bool)

(declare-fun res!159641 () Bool)

(assert (=> b!302033 (=> (not res!159641) (not e!190483))))

(assert (=> b!302033 (= res!159641 (and (= (size!7597 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7597 a!3293))))))

(declare-fun b!302034 () Bool)

(declare-fun res!159640 () Bool)

(assert (=> b!302034 (=> (not res!159640) (not e!190483))))

(declare-fun arrayContainsKey!0 (array!15311 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302034 (= res!159640 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!159643 () Bool)

(assert (=> start!30160 (=> (not res!159643) (not e!190483))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30160 (= res!159643 (validMask!0 mask!3709))))

(assert (=> start!30160 e!190483))

(assert (=> start!30160 true))

(declare-fun array_inv!5208 (array!15311) Bool)

(assert (=> start!30160 (array_inv!5208 a!3293)))

(declare-fun b!302035 () Bool)

(declare-fun res!159645 () Bool)

(assert (=> b!302035 (=> (not res!159645) (not e!190483))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302035 (= res!159645 (validKeyInArray!0 k0!2441))))

(declare-fun b!302036 () Bool)

(assert (=> b!302036 (= e!190483 false)))

(declare-fun lt!149985 () SeekEntryResult!2385)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15311 (_ BitVec 32)) SeekEntryResult!2385)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302036 (= lt!149985 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (= (and start!30160 res!159643) b!302033))

(assert (= (and b!302033 res!159641) b!302035))

(assert (= (and b!302035 res!159645) b!302034))

(assert (= (and b!302034 res!159640) b!302031))

(assert (= (and b!302031 res!159642) b!302032))

(assert (= (and b!302032 res!159644) b!302036))

(declare-fun m!313683 () Bool)

(assert (=> start!30160 m!313683))

(declare-fun m!313685 () Bool)

(assert (=> start!30160 m!313685))

(declare-fun m!313687 () Bool)

(assert (=> b!302035 m!313687))

(declare-fun m!313689 () Bool)

(assert (=> b!302034 m!313689))

(declare-fun m!313691 () Bool)

(assert (=> b!302032 m!313691))

(declare-fun m!313693 () Bool)

(assert (=> b!302031 m!313693))

(declare-fun m!313695 () Bool)

(assert (=> b!302036 m!313695))

(assert (=> b!302036 m!313695))

(declare-fun m!313697 () Bool)

(assert (=> b!302036 m!313697))

(check-sat (not b!302034) (not start!30160) (not b!302035) (not b!302031) (not b!302032) (not b!302036))
