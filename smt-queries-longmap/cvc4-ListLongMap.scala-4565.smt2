; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63692 () Bool)

(assert start!63692)

(declare-fun b!716959 () Bool)

(declare-fun res!479748 () Bool)

(declare-fun e!402574 () Bool)

(assert (=> b!716959 (=> (not res!479748) (not e!402574))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!716959 (= res!479748 (validKeyInArray!0 k!2102))))

(declare-fun b!716960 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!716960 (= e!402574 (bvslt mask!3328 #b00000000000000000000000000000000))))

(declare-fun b!716961 () Bool)

(declare-fun res!479749 () Bool)

(assert (=> b!716961 (=> (not res!479749) (not e!402574))))

(declare-datatypes ((array!40588 0))(
  ( (array!40589 (arr!19427 (Array (_ BitVec 32) (_ BitVec 64))) (size!19848 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40588)

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!716961 (= res!479749 (validKeyInArray!0 (select (arr!19427 a!3186) j!159)))))

(declare-fun res!479750 () Bool)

(assert (=> start!63692 (=> (not res!479750) (not e!402574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63692 (= res!479750 (validMask!0 mask!3328))))

(assert (=> start!63692 e!402574))

(declare-fun array_inv!15223 (array!40588) Bool)

(assert (=> start!63692 (array_inv!15223 a!3186)))

(assert (=> start!63692 true))

(declare-fun b!716962 () Bool)

(declare-fun res!479747 () Bool)

(assert (=> b!716962 (=> (not res!479747) (not e!402574))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7027 0))(
  ( (MissingZero!7027 (index!30476 (_ BitVec 32))) (Found!7027 (index!30477 (_ BitVec 32))) (Intermediate!7027 (undefined!7839 Bool) (index!30478 (_ BitVec 32)) (x!61503 (_ BitVec 32))) (Undefined!7027) (MissingVacant!7027 (index!30479 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40588 (_ BitVec 32)) SeekEntryResult!7027)

(assert (=> b!716962 (= res!479747 (not (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) (MissingZero!7027 i!1173))))))

(declare-fun b!716963 () Bool)

(declare-fun res!479746 () Bool)

(assert (=> b!716963 (=> (not res!479746) (not e!402574))))

(declare-fun arrayContainsKey!0 (array!40588 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!716963 (= res!479746 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!716964 () Bool)

(declare-fun res!479745 () Bool)

(assert (=> b!716964 (=> (not res!479745) (not e!402574))))

(assert (=> b!716964 (= res!479745 (and (= (size!19848 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19848 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19848 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!63692 res!479750) b!716964))

(assert (= (and b!716964 res!479745) b!716961))

(assert (= (and b!716961 res!479749) b!716959))

(assert (= (and b!716959 res!479748) b!716963))

(assert (= (and b!716963 res!479746) b!716962))

(assert (= (and b!716962 res!479747) b!716960))

(declare-fun m!672929 () Bool)

(assert (=> b!716959 m!672929))

(declare-fun m!672931 () Bool)

(assert (=> b!716962 m!672931))

(declare-fun m!672933 () Bool)

(assert (=> b!716963 m!672933))

(declare-fun m!672935 () Bool)

(assert (=> b!716961 m!672935))

(assert (=> b!716961 m!672935))

(declare-fun m!672937 () Bool)

(assert (=> b!716961 m!672937))

(declare-fun m!672939 () Bool)

(assert (=> start!63692 m!672939))

(declare-fun m!672941 () Bool)

(assert (=> start!63692 m!672941))

(push 1)

(assert (not b!716962))

(assert (not b!716963))

(assert (not b!716959))

(assert (not b!716961))

(assert (not start!63692))

(check-sat)

(pop 1)

(push 1)

(check-sat)

