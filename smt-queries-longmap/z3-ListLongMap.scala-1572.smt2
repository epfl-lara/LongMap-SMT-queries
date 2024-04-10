; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29970 () Bool)

(assert start!29970)

(declare-fun res!158758 () Bool)

(declare-fun e!190033 () Bool)

(assert (=> start!29970 (=> (not res!158758) (not e!190033))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29970 (= res!158758 (validMask!0 mask!3709))))

(assert (=> start!29970 e!190033))

(assert (=> start!29970 true))

(declare-datatypes ((array!15203 0))(
  ( (array!15204 (arr!7194 (Array (_ BitVec 32) (_ BitVec 64))) (size!7546 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15203)

(declare-fun array_inv!5157 (array!15203) Bool)

(assert (=> start!29970 (array_inv!5157 a!3293)))

(declare-fun b!301008 () Bool)

(declare-fun res!158759 () Bool)

(assert (=> b!301008 (=> (not res!158759) (not e!190033))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301008 (= res!158759 (and (= (size!7546 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7546 a!3293))))))

(declare-fun b!301009 () Bool)

(declare-fun res!158760 () Bool)

(assert (=> b!301009 (=> (not res!158760) (not e!190033))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301009 (= res!158760 (validKeyInArray!0 k0!2441))))

(declare-fun b!301010 () Bool)

(assert (=> b!301010 (= e!190033 (bvsge #b00000000000000000000000000000000 (size!7546 a!3293)))))

(assert (= (and start!29970 res!158758) b!301008))

(assert (= (and b!301008 res!158759) b!301009))

(assert (= (and b!301009 res!158760) b!301010))

(declare-fun m!312915 () Bool)

(assert (=> start!29970 m!312915))

(declare-fun m!312917 () Bool)

(assert (=> start!29970 m!312917))

(declare-fun m!312919 () Bool)

(assert (=> b!301009 m!312919))

(check-sat (not start!29970) (not b!301009))
(check-sat)
