; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63698 () Bool)

(assert start!63698)

(declare-fun b!716857 () Bool)

(declare-fun res!479783 () Bool)

(declare-fun e!402487 () Bool)

(assert (=> b!716857 (=> (not res!479783) (not e!402487))))

(declare-datatypes ((array!40604 0))(
  ( (array!40605 (arr!19435 (Array (_ BitVec 32) (_ BitVec 64))) (size!19856 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40604)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!716857 (= res!479783 (validKeyInArray!0 (select (arr!19435 a!3186) j!159)))))

(declare-fun b!716858 () Bool)

(declare-fun res!479786 () Bool)

(assert (=> b!716858 (=> (not res!479786) (not e!402487))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40604 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!716858 (= res!479786 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!716859 () Bool)

(declare-fun res!479787 () Bool)

(assert (=> b!716859 (=> (not res!479787) (not e!402487))))

(assert (=> b!716859 (= res!479787 (validKeyInArray!0 k!2102))))

(declare-fun b!716860 () Bool)

(declare-fun res!479785 () Bool)

(assert (=> b!716860 (=> (not res!479785) (not e!402487))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!716860 (= res!479785 (and (= (size!19856 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19856 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19856 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!479784 () Bool)

(assert (=> start!63698 (=> (not res!479784) (not e!402487))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63698 (= res!479784 (validMask!0 mask!3328))))

(assert (=> start!63698 e!402487))

(declare-fun array_inv!15318 (array!40604) Bool)

(assert (=> start!63698 (array_inv!15318 a!3186)))

(assert (=> start!63698 true))

(declare-fun b!716861 () Bool)

(assert (=> b!716861 (= e!402487 false)))

(declare-datatypes ((SeekEntryResult!7032 0))(
  ( (MissingZero!7032 (index!30496 (_ BitVec 32))) (Found!7032 (index!30497 (_ BitVec 32))) (Intermediate!7032 (undefined!7844 Bool) (index!30498 (_ BitVec 32)) (x!61527 (_ BitVec 32))) (Undefined!7032) (MissingVacant!7032 (index!30499 (_ BitVec 32))) )
))
(declare-fun lt!318761 () SeekEntryResult!7032)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40604 (_ BitVec 32)) SeekEntryResult!7032)

(assert (=> b!716861 (= lt!318761 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!63698 res!479784) b!716860))

(assert (= (and b!716860 res!479785) b!716857))

(assert (= (and b!716857 res!479783) b!716859))

(assert (= (and b!716859 res!479787) b!716858))

(assert (= (and b!716858 res!479786) b!716861))

(declare-fun m!672355 () Bool)

(assert (=> b!716859 m!672355))

(declare-fun m!672357 () Bool)

(assert (=> b!716857 m!672357))

(assert (=> b!716857 m!672357))

(declare-fun m!672359 () Bool)

(assert (=> b!716857 m!672359))

(declare-fun m!672361 () Bool)

(assert (=> start!63698 m!672361))

(declare-fun m!672363 () Bool)

(assert (=> start!63698 m!672363))

(declare-fun m!672365 () Bool)

(assert (=> b!716861 m!672365))

(declare-fun m!672367 () Bool)

(assert (=> b!716858 m!672367))

(push 1)

(assert (not b!716861))

(assert (not b!716857))

(assert (not b!716858))

(assert (not b!716859))

(assert (not start!63698))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

