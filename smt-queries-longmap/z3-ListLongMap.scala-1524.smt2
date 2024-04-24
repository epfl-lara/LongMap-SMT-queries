; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28666 () Bool)

(assert start!28666)

(declare-fun b!293138 () Bool)

(declare-fun res!154168 () Bool)

(declare-fun e!185374 () Bool)

(assert (=> b!293138 (=> (not res!154168) (not e!185374))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14850 0))(
  ( (array!14851 (arr!7048 (Array (_ BitVec 32) (_ BitVec 64))) (size!7400 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14850)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!293138 (= res!154168 (and (= (size!7400 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7400 a!3312))))))

(declare-fun b!293139 () Bool)

(declare-fun e!185375 () Bool)

(assert (=> b!293139 (= e!185375 false)))

(declare-datatypes ((SeekEntryResult!2162 0))(
  ( (MissingZero!2162 (index!10818 (_ BitVec 32))) (Found!2162 (index!10819 (_ BitVec 32))) (Intermediate!2162 (undefined!2974 Bool) (index!10820 (_ BitVec 32)) (x!29105 (_ BitVec 32))) (Undefined!2162) (MissingVacant!2162 (index!10821 (_ BitVec 32))) )
))
(declare-fun lt!145332 () SeekEntryResult!2162)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14850 (_ BitVec 32)) SeekEntryResult!2162)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293139 (= lt!145332 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!293140 () Bool)

(assert (=> b!293140 (= e!185374 e!185375)))

(declare-fun res!154173 () Bool)

(assert (=> b!293140 (=> (not res!154173) (not e!185375))))

(declare-fun lt!145331 () SeekEntryResult!2162)

(assert (=> b!293140 (= res!154173 (or (= lt!145331 (MissingZero!2162 i!1256)) (= lt!145331 (MissingVacant!2162 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14850 (_ BitVec 32)) SeekEntryResult!2162)

(assert (=> b!293140 (= lt!145331 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!293141 () Bool)

(declare-fun res!154171 () Bool)

(assert (=> b!293141 (=> (not res!154171) (not e!185374))))

(declare-fun arrayContainsKey!0 (array!14850 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!293141 (= res!154171 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!293142 () Bool)

(declare-fun res!154169 () Bool)

(assert (=> b!293142 (=> (not res!154169) (not e!185375))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14850 (_ BitVec 32)) Bool)

(assert (=> b!293142 (= res!154169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!293143 () Bool)

(declare-fun res!154172 () Bool)

(assert (=> b!293143 (=> (not res!154172) (not e!185374))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!293143 (= res!154172 (validKeyInArray!0 k0!2524))))

(declare-fun res!154170 () Bool)

(assert (=> start!28666 (=> (not res!154170) (not e!185374))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28666 (= res!154170 (validMask!0 mask!3809))))

(assert (=> start!28666 e!185374))

(assert (=> start!28666 true))

(declare-fun array_inv!4998 (array!14850) Bool)

(assert (=> start!28666 (array_inv!4998 a!3312)))

(assert (= (and start!28666 res!154170) b!293138))

(assert (= (and b!293138 res!154168) b!293143))

(assert (= (and b!293143 res!154172) b!293141))

(assert (= (and b!293141 res!154171) b!293140))

(assert (= (and b!293140 res!154173) b!293142))

(assert (= (and b!293142 res!154169) b!293139))

(declare-fun m!307103 () Bool)

(assert (=> b!293139 m!307103))

(assert (=> b!293139 m!307103))

(declare-fun m!307105 () Bool)

(assert (=> b!293139 m!307105))

(declare-fun m!307107 () Bool)

(assert (=> b!293140 m!307107))

(declare-fun m!307109 () Bool)

(assert (=> b!293143 m!307109))

(declare-fun m!307111 () Bool)

(assert (=> b!293141 m!307111))

(declare-fun m!307113 () Bool)

(assert (=> b!293142 m!307113))

(declare-fun m!307115 () Bool)

(assert (=> start!28666 m!307115))

(declare-fun m!307117 () Bool)

(assert (=> start!28666 m!307117))

(check-sat (not start!28666) (not b!293141) (not b!293143) (not b!293142) (not b!293139) (not b!293140))
(check-sat)
