; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29976 () Bool)

(assert start!29976)

(declare-fun b!300780 () Bool)

(declare-fun res!158678 () Bool)

(declare-fun e!189886 () Bool)

(assert (=> b!300780 (=> (not res!158678) (not e!189886))))

(declare-datatypes ((array!15203 0))(
  ( (array!15204 (arr!7194 (Array (_ BitVec 32) (_ BitVec 64))) (size!7547 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15203)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!300780 (= res!158678 (and (= (size!7547 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7547 a!3293))))))

(declare-fun b!300782 () Bool)

(declare-fun res!158677 () Bool)

(assert (=> b!300782 (=> (not res!158677) (not e!189886))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15203 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300782 (= res!158677 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!300783 () Bool)

(assert (=> b!300783 (= e!189886 (bvslt mask!3709 #b00000000000000000000000000000000))))

(declare-fun res!158676 () Bool)

(assert (=> start!29976 (=> (not res!158676) (not e!189886))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29976 (= res!158676 (validMask!0 mask!3709))))

(assert (=> start!29976 e!189886))

(assert (=> start!29976 true))

(declare-fun array_inv!5166 (array!15203) Bool)

(assert (=> start!29976 (array_inv!5166 a!3293)))

(declare-fun b!300781 () Bool)

(declare-fun res!158679 () Bool)

(assert (=> b!300781 (=> (not res!158679) (not e!189886))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300781 (= res!158679 (validKeyInArray!0 k0!2441))))

(assert (= (and start!29976 res!158676) b!300780))

(assert (= (and b!300780 res!158678) b!300781))

(assert (= (and b!300781 res!158679) b!300782))

(assert (= (and b!300782 res!158677) b!300783))

(declare-fun m!312205 () Bool)

(assert (=> b!300782 m!312205))

(declare-fun m!312207 () Bool)

(assert (=> start!29976 m!312207))

(declare-fun m!312209 () Bool)

(assert (=> start!29976 m!312209))

(declare-fun m!312211 () Bool)

(assert (=> b!300781 m!312211))

(check-sat (not start!29976) (not b!300782) (not b!300781))
(check-sat)
