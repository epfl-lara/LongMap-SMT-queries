; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63714 () Bool)

(assert start!63714)

(declare-fun b!717125 () Bool)

(declare-fun res!479915 () Bool)

(declare-fun e!402641 () Bool)

(assert (=> b!717125 (=> (not res!479915) (not e!402641))))

(declare-datatypes ((array!40610 0))(
  ( (array!40611 (arr!19438 (Array (_ BitVec 32) (_ BitVec 64))) (size!19859 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40610)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!717125 (= res!479915 (and (= (size!19859 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19859 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19859 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717127 () Bool)

(declare-fun res!479914 () Bool)

(assert (=> b!717127 (=> (not res!479914) (not e!402641))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717127 (= res!479914 (validKeyInArray!0 k0!2102))))

(declare-fun b!717128 () Bool)

(assert (=> b!717128 (= e!402641 false)))

(declare-datatypes ((SeekEntryResult!7038 0))(
  ( (MissingZero!7038 (index!30520 (_ BitVec 32))) (Found!7038 (index!30521 (_ BitVec 32))) (Intermediate!7038 (undefined!7850 Bool) (index!30522 (_ BitVec 32)) (x!61546 (_ BitVec 32))) (Undefined!7038) (MissingVacant!7038 (index!30523 (_ BitVec 32))) )
))
(declare-fun lt!319007 () SeekEntryResult!7038)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40610 (_ BitVec 32)) SeekEntryResult!7038)

(assert (=> b!717128 (= lt!319007 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!717129 () Bool)

(declare-fun res!479911 () Bool)

(assert (=> b!717129 (=> (not res!479911) (not e!402641))))

(declare-fun arrayContainsKey!0 (array!40610 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717129 (= res!479911 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!717126 () Bool)

(declare-fun res!479913 () Bool)

(assert (=> b!717126 (=> (not res!479913) (not e!402641))))

(assert (=> b!717126 (= res!479913 (validKeyInArray!0 (select (arr!19438 a!3186) j!159)))))

(declare-fun res!479912 () Bool)

(assert (=> start!63714 (=> (not res!479912) (not e!402641))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63714 (= res!479912 (validMask!0 mask!3328))))

(assert (=> start!63714 e!402641))

(declare-fun array_inv!15234 (array!40610) Bool)

(assert (=> start!63714 (array_inv!15234 a!3186)))

(assert (=> start!63714 true))

(assert (= (and start!63714 res!479912) b!717125))

(assert (= (and b!717125 res!479915) b!717126))

(assert (= (and b!717126 res!479913) b!717127))

(assert (= (and b!717127 res!479914) b!717129))

(assert (= (and b!717129 res!479911) b!717128))

(declare-fun m!673083 () Bool)

(assert (=> b!717126 m!673083))

(assert (=> b!717126 m!673083))

(declare-fun m!673085 () Bool)

(assert (=> b!717126 m!673085))

(declare-fun m!673087 () Bool)

(assert (=> b!717128 m!673087))

(declare-fun m!673089 () Bool)

(assert (=> start!63714 m!673089))

(declare-fun m!673091 () Bool)

(assert (=> start!63714 m!673091))

(declare-fun m!673093 () Bool)

(assert (=> b!717127 m!673093))

(declare-fun m!673095 () Bool)

(assert (=> b!717129 m!673095))

(check-sat (not b!717129) (not b!717127) (not b!717126) (not start!63714) (not b!717128))
