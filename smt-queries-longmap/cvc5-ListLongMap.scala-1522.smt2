; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28662 () Bool)

(assert start!28662)

(declare-fun b!292983 () Bool)

(declare-fun res!154039 () Bool)

(declare-fun e!185297 () Bool)

(assert (=> b!292983 (=> (not res!154039) (not e!185297))))

(declare-datatypes ((array!14841 0))(
  ( (array!14842 (arr!7043 (Array (_ BitVec 32) (_ BitVec 64))) (size!7395 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14841)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14841 (_ BitVec 32)) Bool)

(assert (=> b!292983 (= res!154039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!154042 () Bool)

(declare-fun e!185295 () Bool)

(assert (=> start!28662 (=> (not res!154042) (not e!185295))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28662 (= res!154042 (validMask!0 mask!3809))))

(assert (=> start!28662 e!185295))

(assert (=> start!28662 true))

(declare-fun array_inv!5006 (array!14841) Bool)

(assert (=> start!28662 (array_inv!5006 a!3312)))

(declare-fun b!292984 () Bool)

(declare-fun res!154040 () Bool)

(assert (=> b!292984 (=> (not res!154040) (not e!185295))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292984 (= res!154040 (validKeyInArray!0 k!2524))))

(declare-fun b!292985 () Bool)

(assert (=> b!292985 (= e!185295 e!185297)))

(declare-fun res!154041 () Bool)

(assert (=> b!292985 (=> (not res!154041) (not e!185297))))

(declare-datatypes ((SeekEntryResult!2192 0))(
  ( (MissingZero!2192 (index!10938 (_ BitVec 32))) (Found!2192 (index!10939 (_ BitVec 32))) (Intermediate!2192 (undefined!3004 Bool) (index!10940 (_ BitVec 32)) (x!29119 (_ BitVec 32))) (Undefined!2192) (MissingVacant!2192 (index!10941 (_ BitVec 32))) )
))
(declare-fun lt!145205 () SeekEntryResult!2192)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292985 (= res!154041 (or (= lt!145205 (MissingZero!2192 i!1256)) (= lt!145205 (MissingVacant!2192 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14841 (_ BitVec 32)) SeekEntryResult!2192)

(assert (=> b!292985 (= lt!145205 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!292986 () Bool)

(declare-fun res!154043 () Bool)

(assert (=> b!292986 (=> (not res!154043) (not e!185295))))

(declare-fun arrayContainsKey!0 (array!14841 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292986 (= res!154043 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292987 () Bool)

(declare-fun res!154044 () Bool)

(assert (=> b!292987 (=> (not res!154044) (not e!185295))))

(assert (=> b!292987 (= res!154044 (and (= (size!7395 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7395 a!3312))))))

(declare-fun b!292988 () Bool)

(assert (=> b!292988 (= e!185297 false)))

(declare-fun lt!145207 () SeekEntryResult!2192)

(declare-fun lt!145206 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14841 (_ BitVec 32)) SeekEntryResult!2192)

(assert (=> b!292988 (= lt!145207 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145206 k!2524 (array!14842 (store (arr!7043 a!3312) i!1256 k!2524) (size!7395 a!3312)) mask!3809))))

(declare-fun lt!145204 () SeekEntryResult!2192)

(assert (=> b!292988 (= lt!145204 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145206 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292988 (= lt!145206 (toIndex!0 k!2524 mask!3809))))

(assert (= (and start!28662 res!154042) b!292987))

(assert (= (and b!292987 res!154044) b!292984))

(assert (= (and b!292984 res!154040) b!292986))

(assert (= (and b!292986 res!154043) b!292985))

(assert (= (and b!292985 res!154041) b!292983))

(assert (= (and b!292983 res!154039) b!292988))

(declare-fun m!306777 () Bool)

(assert (=> b!292986 m!306777))

(declare-fun m!306779 () Bool)

(assert (=> b!292988 m!306779))

(declare-fun m!306781 () Bool)

(assert (=> b!292988 m!306781))

(declare-fun m!306783 () Bool)

(assert (=> b!292988 m!306783))

(declare-fun m!306785 () Bool)

(assert (=> b!292988 m!306785))

(declare-fun m!306787 () Bool)

(assert (=> start!28662 m!306787))

(declare-fun m!306789 () Bool)

(assert (=> start!28662 m!306789))

(declare-fun m!306791 () Bool)

(assert (=> b!292984 m!306791))

(declare-fun m!306793 () Bool)

(assert (=> b!292983 m!306793))

(declare-fun m!306795 () Bool)

(assert (=> b!292985 m!306795))

(push 1)

