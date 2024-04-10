; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63702 () Bool)

(assert start!63702)

(declare-fun res!479821 () Bool)

(declare-fun e!402604 () Bool)

(assert (=> start!63702 (=> (not res!479821) (not e!402604))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63702 (= res!479821 (validMask!0 mask!3328))))

(assert (=> start!63702 e!402604))

(declare-datatypes ((array!40598 0))(
  ( (array!40599 (arr!19432 (Array (_ BitVec 32) (_ BitVec 64))) (size!19853 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40598)

(declare-fun array_inv!15228 (array!40598) Bool)

(assert (=> start!63702 (array_inv!15228 a!3186)))

(assert (=> start!63702 true))

(declare-fun b!717035 () Bool)

(declare-fun res!479825 () Bool)

(assert (=> b!717035 (=> (not res!479825) (not e!402604))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!717035 (= res!479825 (and (= (size!19853 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19853 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19853 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717036 () Bool)

(declare-fun res!479823 () Bool)

(assert (=> b!717036 (=> (not res!479823) (not e!402604))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717036 (= res!479823 (validKeyInArray!0 k0!2102))))

(declare-fun b!717037 () Bool)

(assert (=> b!717037 (= e!402604 false)))

(declare-datatypes ((SeekEntryResult!7032 0))(
  ( (MissingZero!7032 (index!30496 (_ BitVec 32))) (Found!7032 (index!30497 (_ BitVec 32))) (Intermediate!7032 (undefined!7844 Bool) (index!30498 (_ BitVec 32)) (x!61524 (_ BitVec 32))) (Undefined!7032) (MissingVacant!7032 (index!30499 (_ BitVec 32))) )
))
(declare-fun lt!318989 () SeekEntryResult!7032)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40598 (_ BitVec 32)) SeekEntryResult!7032)

(assert (=> b!717037 (= lt!318989 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!717038 () Bool)

(declare-fun res!479824 () Bool)

(assert (=> b!717038 (=> (not res!479824) (not e!402604))))

(declare-fun arrayContainsKey!0 (array!40598 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717038 (= res!479824 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!717039 () Bool)

(declare-fun res!479822 () Bool)

(assert (=> b!717039 (=> (not res!479822) (not e!402604))))

(assert (=> b!717039 (= res!479822 (validKeyInArray!0 (select (arr!19432 a!3186) j!159)))))

(assert (= (and start!63702 res!479821) b!717035))

(assert (= (and b!717035 res!479825) b!717039))

(assert (= (and b!717039 res!479822) b!717036))

(assert (= (and b!717036 res!479823) b!717038))

(assert (= (and b!717038 res!479824) b!717037))

(declare-fun m!672999 () Bool)

(assert (=> b!717038 m!672999))

(declare-fun m!673001 () Bool)

(assert (=> start!63702 m!673001))

(declare-fun m!673003 () Bool)

(assert (=> start!63702 m!673003))

(declare-fun m!673005 () Bool)

(assert (=> b!717039 m!673005))

(assert (=> b!717039 m!673005))

(declare-fun m!673007 () Bool)

(assert (=> b!717039 m!673007))

(declare-fun m!673009 () Bool)

(assert (=> b!717037 m!673009))

(declare-fun m!673011 () Bool)

(assert (=> b!717036 m!673011))

(check-sat (not b!717036) (not b!717039) (not b!717037) (not start!63702) (not b!717038))
