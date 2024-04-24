; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63784 () Bool)

(assert start!63784)

(declare-fun res!480150 () Bool)

(declare-fun e!402891 () Bool)

(assert (=> start!63784 (=> (not res!480150) (not e!402891))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63784 (= res!480150 (validMask!0 mask!3328))))

(assert (=> start!63784 e!402891))

(declare-datatypes ((array!40613 0))(
  ( (array!40614 (arr!19437 (Array (_ BitVec 32) (_ BitVec 64))) (size!19857 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40613)

(declare-fun array_inv!15296 (array!40613) Bool)

(assert (=> start!63784 (array_inv!15296 a!3186)))

(assert (=> start!63784 true))

(declare-fun b!717513 () Bool)

(declare-fun res!480152 () Bool)

(assert (=> b!717513 (=> (not res!480152) (not e!402891))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717513 (= res!480152 (validKeyInArray!0 k!2102))))

(declare-fun b!717514 () Bool)

(declare-fun res!480154 () Bool)

(assert (=> b!717514 (=> (not res!480154) (not e!402891))))

(declare-fun arrayContainsKey!0 (array!40613 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717514 (= res!480154 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!717515 () Bool)

(assert (=> b!717515 (= e!402891 false)))

(declare-datatypes ((SeekEntryResult!6993 0))(
  ( (MissingZero!6993 (index!30340 (_ BitVec 32))) (Found!6993 (index!30341 (_ BitVec 32))) (Intermediate!6993 (undefined!7805 Bool) (index!30342 (_ BitVec 32)) (x!61512 (_ BitVec 32))) (Undefined!6993) (MissingVacant!6993 (index!30343 (_ BitVec 32))) )
))
(declare-fun lt!319149 () SeekEntryResult!6993)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40613 (_ BitVec 32)) SeekEntryResult!6993)

(assert (=> b!717515 (= lt!319149 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!717516 () Bool)

(declare-fun res!480153 () Bool)

(assert (=> b!717516 (=> (not res!480153) (not e!402891))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!717516 (= res!480153 (and (= (size!19857 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19857 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19857 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717517 () Bool)

(declare-fun res!480151 () Bool)

(assert (=> b!717517 (=> (not res!480151) (not e!402891))))

(assert (=> b!717517 (= res!480151 (validKeyInArray!0 (select (arr!19437 a!3186) j!159)))))

(assert (= (and start!63784 res!480150) b!717516))

(assert (= (and b!717516 res!480153) b!717517))

(assert (= (and b!717517 res!480151) b!717513))

(assert (= (and b!717513 res!480152) b!717514))

(assert (= (and b!717514 res!480154) b!717515))

(declare-fun m!673987 () Bool)

(assert (=> b!717517 m!673987))

(assert (=> b!717517 m!673987))

(declare-fun m!673989 () Bool)

(assert (=> b!717517 m!673989))

(declare-fun m!673991 () Bool)

(assert (=> b!717515 m!673991))

(declare-fun m!673993 () Bool)

(assert (=> b!717513 m!673993))

(declare-fun m!673995 () Bool)

(assert (=> b!717514 m!673995))

(declare-fun m!673997 () Bool)

(assert (=> start!63784 m!673997))

(declare-fun m!673999 () Bool)

(assert (=> start!63784 m!673999))

(push 1)

(assert (not b!717514))

(assert (not b!717515))

(assert (not b!717517))

(assert (not b!717513))

(assert (not start!63784))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

