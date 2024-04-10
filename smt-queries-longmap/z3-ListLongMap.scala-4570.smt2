; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63720 () Bool)

(assert start!63720)

(declare-fun b!717170 () Bool)

(declare-fun res!479960 () Bool)

(declare-fun e!402659 () Bool)

(assert (=> b!717170 (=> (not res!479960) (not e!402659))))

(declare-datatypes ((array!40616 0))(
  ( (array!40617 (arr!19441 (Array (_ BitVec 32) (_ BitVec 64))) (size!19862 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40616)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40616 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717170 (= res!479960 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!717171 () Bool)

(declare-fun res!479957 () Bool)

(assert (=> b!717171 (=> (not res!479957) (not e!402659))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717171 (= res!479957 (validKeyInArray!0 k0!2102))))

(declare-fun b!717172 () Bool)

(declare-fun res!479958 () Bool)

(assert (=> b!717172 (=> (not res!479958) (not e!402659))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!717172 (= res!479958 (and (= (size!19862 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19862 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19862 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717173 () Bool)

(declare-fun res!479959 () Bool)

(assert (=> b!717173 (=> (not res!479959) (not e!402659))))

(assert (=> b!717173 (= res!479959 (validKeyInArray!0 (select (arr!19441 a!3186) j!159)))))

(declare-fun b!717174 () Bool)

(assert (=> b!717174 (= e!402659 false)))

(declare-datatypes ((SeekEntryResult!7041 0))(
  ( (MissingZero!7041 (index!30532 (_ BitVec 32))) (Found!7041 (index!30533 (_ BitVec 32))) (Intermediate!7041 (undefined!7853 Bool) (index!30534 (_ BitVec 32)) (x!61557 (_ BitVec 32))) (Undefined!7041) (MissingVacant!7041 (index!30535 (_ BitVec 32))) )
))
(declare-fun lt!319016 () SeekEntryResult!7041)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40616 (_ BitVec 32)) SeekEntryResult!7041)

(assert (=> b!717174 (= lt!319016 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!479956 () Bool)

(assert (=> start!63720 (=> (not res!479956) (not e!402659))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63720 (= res!479956 (validMask!0 mask!3328))))

(assert (=> start!63720 e!402659))

(declare-fun array_inv!15237 (array!40616) Bool)

(assert (=> start!63720 (array_inv!15237 a!3186)))

(assert (=> start!63720 true))

(assert (= (and start!63720 res!479956) b!717172))

(assert (= (and b!717172 res!479958) b!717173))

(assert (= (and b!717173 res!479959) b!717171))

(assert (= (and b!717171 res!479957) b!717170))

(assert (= (and b!717170 res!479960) b!717174))

(declare-fun m!673125 () Bool)

(assert (=> start!63720 m!673125))

(declare-fun m!673127 () Bool)

(assert (=> start!63720 m!673127))

(declare-fun m!673129 () Bool)

(assert (=> b!717174 m!673129))

(declare-fun m!673131 () Bool)

(assert (=> b!717173 m!673131))

(assert (=> b!717173 m!673131))

(declare-fun m!673133 () Bool)

(assert (=> b!717173 m!673133))

(declare-fun m!673135 () Bool)

(assert (=> b!717171 m!673135))

(declare-fun m!673137 () Bool)

(assert (=> b!717170 m!673137))

(check-sat (not start!63720) (not b!717174) (not b!717170) (not b!717173) (not b!717171))
