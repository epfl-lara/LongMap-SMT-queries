; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63786 () Bool)

(assert start!63786)

(declare-fun res!480166 () Bool)

(declare-fun e!402896 () Bool)

(assert (=> start!63786 (=> (not res!480166) (not e!402896))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63786 (= res!480166 (validMask!0 mask!3328))))

(assert (=> start!63786 e!402896))

(declare-datatypes ((array!40615 0))(
  ( (array!40616 (arr!19438 (Array (_ BitVec 32) (_ BitVec 64))) (size!19858 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40615)

(declare-fun array_inv!15297 (array!40615) Bool)

(assert (=> start!63786 (array_inv!15297 a!3186)))

(assert (=> start!63786 true))

(declare-fun b!717528 () Bool)

(declare-fun res!480165 () Bool)

(assert (=> b!717528 (=> (not res!480165) (not e!402896))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717528 (= res!480165 (validKeyInArray!0 (select (arr!19438 a!3186) j!159)))))

(declare-fun b!717529 () Bool)

(declare-fun res!480167 () Bool)

(assert (=> b!717529 (=> (not res!480167) (not e!402896))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40615 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717529 (= res!480167 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6994 0))(
  ( (MissingZero!6994 (index!30344 (_ BitVec 32))) (Found!6994 (index!30345 (_ BitVec 32))) (Intermediate!6994 (undefined!7806 Bool) (index!30346 (_ BitVec 32)) (x!61521 (_ BitVec 32))) (Undefined!6994) (MissingVacant!6994 (index!30347 (_ BitVec 32))) )
))
(declare-fun lt!319152 () SeekEntryResult!6994)

(declare-fun b!717530 () Bool)

(assert (=> b!717530 (= e!402896 (and (or (= lt!319152 (MissingZero!6994 i!1173)) (= lt!319152 (MissingVacant!6994 i!1173))) (bvsgt #b00000000000000000000000000000000 (size!19858 a!3186))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40615 (_ BitVec 32)) SeekEntryResult!6994)

(assert (=> b!717530 (= lt!319152 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!717531 () Bool)

(declare-fun res!480168 () Bool)

(assert (=> b!717531 (=> (not res!480168) (not e!402896))))

(assert (=> b!717531 (= res!480168 (validKeyInArray!0 k0!2102))))

(declare-fun b!717532 () Bool)

(declare-fun res!480169 () Bool)

(assert (=> b!717532 (=> (not res!480169) (not e!402896))))

(assert (=> b!717532 (= res!480169 (and (= (size!19858 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19858 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19858 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!63786 res!480166) b!717532))

(assert (= (and b!717532 res!480169) b!717528))

(assert (= (and b!717528 res!480165) b!717531))

(assert (= (and b!717531 res!480168) b!717529))

(assert (= (and b!717529 res!480167) b!717530))

(declare-fun m!674001 () Bool)

(assert (=> b!717531 m!674001))

(declare-fun m!674003 () Bool)

(assert (=> b!717529 m!674003))

(declare-fun m!674005 () Bool)

(assert (=> b!717528 m!674005))

(assert (=> b!717528 m!674005))

(declare-fun m!674007 () Bool)

(assert (=> b!717528 m!674007))

(declare-fun m!674009 () Bool)

(assert (=> b!717530 m!674009))

(declare-fun m!674011 () Bool)

(assert (=> start!63786 m!674011))

(declare-fun m!674013 () Bool)

(assert (=> start!63786 m!674013))

(check-sat (not b!717531) (not b!717530) (not start!63786) (not b!717529) (not b!717528))
(check-sat)
