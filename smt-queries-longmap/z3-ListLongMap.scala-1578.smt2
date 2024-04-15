; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30000 () Bool)

(assert start!30000)

(declare-fun b!300926 () Bool)

(declare-fun res!158826 () Bool)

(declare-fun e!189958 () Bool)

(assert (=> b!300926 (=> (not res!158826) (not e!189958))))

(declare-datatypes ((array!15227 0))(
  ( (array!15228 (arr!7206 (Array (_ BitVec 32) (_ BitVec 64))) (size!7559 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15227)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15227 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300926 (= res!158826 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!300927 () Bool)

(declare-fun res!158824 () Bool)

(assert (=> b!300927 (=> (not res!158824) (not e!189958))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300927 (= res!158824 (validKeyInArray!0 k0!2441))))

(declare-fun b!300929 () Bool)

(assert (=> b!300929 (= e!189958 (bvsgt #b00000000000000000000000000000000 (size!7559 a!3293)))))

(declare-fun b!300930 () Bool)

(declare-fun res!158823 () Bool)

(assert (=> b!300930 (=> (not res!158823) (not e!189958))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!300930 (= res!158823 (and (= (size!7559 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7559 a!3293))))))

(declare-fun res!158822 () Bool)

(assert (=> start!30000 (=> (not res!158822) (not e!189958))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30000 (= res!158822 (validMask!0 mask!3709))))

(assert (=> start!30000 e!189958))

(assert (=> start!30000 true))

(declare-fun array_inv!5178 (array!15227) Bool)

(assert (=> start!30000 (array_inv!5178 a!3293)))

(declare-fun b!300928 () Bool)

(declare-fun res!158825 () Bool)

(assert (=> b!300928 (=> (not res!158825) (not e!189958))))

(declare-datatypes ((SeekEntryResult!2345 0))(
  ( (MissingZero!2345 (index!11556 (_ BitVec 32))) (Found!2345 (index!11557 (_ BitVec 32))) (Intermediate!2345 (undefined!3157 Bool) (index!11558 (_ BitVec 32)) (x!29852 (_ BitVec 32))) (Undefined!2345) (MissingVacant!2345 (index!11559 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15227 (_ BitVec 32)) SeekEntryResult!2345)

(assert (=> b!300928 (= res!158825 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2345 i!1240)))))

(assert (= (and start!30000 res!158822) b!300930))

(assert (= (and b!300930 res!158823) b!300927))

(assert (= (and b!300927 res!158824) b!300926))

(assert (= (and b!300926 res!158826) b!300928))

(assert (= (and b!300928 res!158825) b!300929))

(declare-fun m!312319 () Bool)

(assert (=> b!300926 m!312319))

(declare-fun m!312321 () Bool)

(assert (=> b!300927 m!312321))

(declare-fun m!312323 () Bool)

(assert (=> start!30000 m!312323))

(declare-fun m!312325 () Bool)

(assert (=> start!30000 m!312325))

(declare-fun m!312327 () Bool)

(assert (=> b!300928 m!312327))

(check-sat (not b!300926) (not start!30000) (not b!300928) (not b!300927))
(check-sat)
