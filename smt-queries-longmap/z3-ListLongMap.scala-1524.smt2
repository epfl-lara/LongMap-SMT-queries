; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28676 () Bool)

(assert start!28676)

(declare-fun b!293109 () Bool)

(declare-fun e!185358 () Bool)

(assert (=> b!293109 (= e!185358 false)))

(declare-datatypes ((array!14855 0))(
  ( (array!14856 (arr!7050 (Array (_ BitVec 32) (_ BitVec 64))) (size!7402 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14855)

(declare-datatypes ((SeekEntryResult!2199 0))(
  ( (MissingZero!2199 (index!10966 (_ BitVec 32))) (Found!2199 (index!10967 (_ BitVec 32))) (Intermediate!2199 (undefined!3011 Bool) (index!10968 (_ BitVec 32)) (x!29142 (_ BitVec 32))) (Undefined!2199) (MissingVacant!2199 (index!10969 (_ BitVec 32))) )
))
(declare-fun lt!145278 () SeekEntryResult!2199)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14855 (_ BitVec 32)) SeekEntryResult!2199)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293109 (= lt!145278 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun res!154167 () Bool)

(declare-fun e!185360 () Bool)

(assert (=> start!28676 (=> (not res!154167) (not e!185360))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28676 (= res!154167 (validMask!0 mask!3809))))

(assert (=> start!28676 e!185360))

(assert (=> start!28676 true))

(declare-fun array_inv!5013 (array!14855) Bool)

(assert (=> start!28676 (array_inv!5013 a!3312)))

(declare-fun b!293110 () Bool)

(declare-fun res!154170 () Bool)

(assert (=> b!293110 (=> (not res!154170) (not e!185360))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!293110 (= res!154170 (validKeyInArray!0 k0!2524))))

(declare-fun b!293111 () Bool)

(declare-fun res!154165 () Bool)

(assert (=> b!293111 (=> (not res!154165) (not e!185360))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!293111 (= res!154165 (and (= (size!7402 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7402 a!3312))))))

(declare-fun b!293112 () Bool)

(declare-fun res!154168 () Bool)

(assert (=> b!293112 (=> (not res!154168) (not e!185360))))

(declare-fun arrayContainsKey!0 (array!14855 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!293112 (= res!154168 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!293113 () Bool)

(assert (=> b!293113 (= e!185360 e!185358)))

(declare-fun res!154169 () Bool)

(assert (=> b!293113 (=> (not res!154169) (not e!185358))))

(declare-fun lt!145279 () SeekEntryResult!2199)

(assert (=> b!293113 (= res!154169 (or (= lt!145279 (MissingZero!2199 i!1256)) (= lt!145279 (MissingVacant!2199 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14855 (_ BitVec 32)) SeekEntryResult!2199)

(assert (=> b!293113 (= lt!145279 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!293114 () Bool)

(declare-fun res!154166 () Bool)

(assert (=> b!293114 (=> (not res!154166) (not e!185358))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14855 (_ BitVec 32)) Bool)

(assert (=> b!293114 (= res!154166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28676 res!154167) b!293111))

(assert (= (and b!293111 res!154165) b!293110))

(assert (= (and b!293110 res!154170) b!293112))

(assert (= (and b!293112 res!154168) b!293113))

(assert (= (and b!293113 res!154169) b!293114))

(assert (= (and b!293114 res!154166) b!293109))

(declare-fun m!306913 () Bool)

(assert (=> b!293109 m!306913))

(assert (=> b!293109 m!306913))

(declare-fun m!306915 () Bool)

(assert (=> b!293109 m!306915))

(declare-fun m!306917 () Bool)

(assert (=> b!293110 m!306917))

(declare-fun m!306919 () Bool)

(assert (=> start!28676 m!306919))

(declare-fun m!306921 () Bool)

(assert (=> start!28676 m!306921))

(declare-fun m!306923 () Bool)

(assert (=> b!293113 m!306923))

(declare-fun m!306925 () Bool)

(assert (=> b!293112 m!306925))

(declare-fun m!306927 () Bool)

(assert (=> b!293114 m!306927))

(check-sat (not b!293110) (not b!293109) (not start!28676) (not b!293113) (not b!293112) (not b!293114))
(check-sat)
