; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63706 () Bool)

(assert start!63706)

(declare-fun b!717065 () Bool)

(declare-fun res!479854 () Bool)

(declare-fun e!402617 () Bool)

(assert (=> b!717065 (=> (not res!479854) (not e!402617))))

(declare-datatypes ((array!40602 0))(
  ( (array!40603 (arr!19434 (Array (_ BitVec 32) (_ BitVec 64))) (size!19855 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40602)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!717065 (= res!479854 (and (= (size!19855 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19855 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19855 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717067 () Bool)

(declare-fun res!479853 () Bool)

(assert (=> b!717067 (=> (not res!479853) (not e!402617))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40602 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717067 (= res!479853 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!717068 () Bool)

(assert (=> b!717068 (= e!402617 false)))

(declare-datatypes ((SeekEntryResult!7034 0))(
  ( (MissingZero!7034 (index!30504 (_ BitVec 32))) (Found!7034 (index!30505 (_ BitVec 32))) (Intermediate!7034 (undefined!7846 Bool) (index!30506 (_ BitVec 32)) (x!61534 (_ BitVec 32))) (Undefined!7034) (MissingVacant!7034 (index!30507 (_ BitVec 32))) )
))
(declare-fun lt!318995 () SeekEntryResult!7034)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40602 (_ BitVec 32)) SeekEntryResult!7034)

(assert (=> b!717068 (= lt!318995 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!717069 () Bool)

(declare-fun res!479852 () Bool)

(assert (=> b!717069 (=> (not res!479852) (not e!402617))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717069 (= res!479852 (validKeyInArray!0 k!2102))))

(declare-fun res!479855 () Bool)

(assert (=> start!63706 (=> (not res!479855) (not e!402617))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63706 (= res!479855 (validMask!0 mask!3328))))

(assert (=> start!63706 e!402617))

(declare-fun array_inv!15230 (array!40602) Bool)

(assert (=> start!63706 (array_inv!15230 a!3186)))

(assert (=> start!63706 true))

(declare-fun b!717066 () Bool)

(declare-fun res!479851 () Bool)

(assert (=> b!717066 (=> (not res!479851) (not e!402617))))

(assert (=> b!717066 (= res!479851 (validKeyInArray!0 (select (arr!19434 a!3186) j!159)))))

(assert (= (and start!63706 res!479855) b!717065))

(assert (= (and b!717065 res!479854) b!717066))

(assert (= (and b!717066 res!479851) b!717069))

(assert (= (and b!717069 res!479852) b!717067))

(assert (= (and b!717067 res!479853) b!717068))

(declare-fun m!673027 () Bool)

(assert (=> start!63706 m!673027))

(declare-fun m!673029 () Bool)

(assert (=> start!63706 m!673029))

(declare-fun m!673031 () Bool)

(assert (=> b!717069 m!673031))

(declare-fun m!673033 () Bool)

(assert (=> b!717068 m!673033))

(declare-fun m!673035 () Bool)

(assert (=> b!717066 m!673035))

(assert (=> b!717066 m!673035))

(declare-fun m!673037 () Bool)

(assert (=> b!717066 m!673037))

(declare-fun m!673039 () Bool)

(assert (=> b!717067 m!673039))

(push 1)

(assert (not start!63706))

(assert (not b!717069))

(assert (not b!717066))

(assert (not b!717067))

(assert (not b!717068))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

