; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63712 () Bool)

(assert start!63712)

(declare-fun b!717110 () Bool)

(declare-fun res!479899 () Bool)

(declare-fun e!402635 () Bool)

(assert (=> b!717110 (=> (not res!479899) (not e!402635))))

(declare-datatypes ((array!40608 0))(
  ( (array!40609 (arr!19437 (Array (_ BitVec 32) (_ BitVec 64))) (size!19858 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40608)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717110 (= res!479899 (validKeyInArray!0 (select (arr!19437 a!3186) j!159)))))

(declare-fun b!717111 () Bool)

(declare-fun res!479898 () Bool)

(assert (=> b!717111 (=> (not res!479898) (not e!402635))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!717111 (= res!479898 (and (= (size!19858 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19858 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19858 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717112 () Bool)

(declare-fun res!479896 () Bool)

(assert (=> b!717112 (=> (not res!479896) (not e!402635))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!717112 (= res!479896 (validKeyInArray!0 k!2102))))

(declare-fun res!479897 () Bool)

(assert (=> start!63712 (=> (not res!479897) (not e!402635))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63712 (= res!479897 (validMask!0 mask!3328))))

(assert (=> start!63712 e!402635))

(declare-fun array_inv!15233 (array!40608) Bool)

(assert (=> start!63712 (array_inv!15233 a!3186)))

(assert (=> start!63712 true))

(declare-fun b!717113 () Bool)

(declare-fun res!479900 () Bool)

(assert (=> b!717113 (=> (not res!479900) (not e!402635))))

(declare-fun arrayContainsKey!0 (array!40608 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717113 (= res!479900 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!717114 () Bool)

(assert (=> b!717114 (= e!402635 false)))

(declare-datatypes ((SeekEntryResult!7037 0))(
  ( (MissingZero!7037 (index!30516 (_ BitVec 32))) (Found!7037 (index!30517 (_ BitVec 32))) (Intermediate!7037 (undefined!7849 Bool) (index!30518 (_ BitVec 32)) (x!61545 (_ BitVec 32))) (Undefined!7037) (MissingVacant!7037 (index!30519 (_ BitVec 32))) )
))
(declare-fun lt!319004 () SeekEntryResult!7037)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40608 (_ BitVec 32)) SeekEntryResult!7037)

(assert (=> b!717114 (= lt!319004 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!63712 res!479897) b!717111))

(assert (= (and b!717111 res!479898) b!717110))

(assert (= (and b!717110 res!479899) b!717112))

(assert (= (and b!717112 res!479896) b!717113))

(assert (= (and b!717113 res!479900) b!717114))

(declare-fun m!673069 () Bool)

(assert (=> b!717112 m!673069))

(declare-fun m!673071 () Bool)

(assert (=> start!63712 m!673071))

(declare-fun m!673073 () Bool)

(assert (=> start!63712 m!673073))

(declare-fun m!673075 () Bool)

(assert (=> b!717114 m!673075))

(declare-fun m!673077 () Bool)

(assert (=> b!717110 m!673077))

(assert (=> b!717110 m!673077))

(declare-fun m!673079 () Bool)

(assert (=> b!717110 m!673079))

(declare-fun m!673081 () Bool)

(assert (=> b!717113 m!673081))

(push 1)

(assert (not start!63712))

(assert (not b!717112))

(assert (not b!717110))

(assert (not b!717114))

(assert (not b!717113))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

