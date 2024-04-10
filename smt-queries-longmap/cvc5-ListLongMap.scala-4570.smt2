; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63718 () Bool)

(assert start!63718)

(declare-fun b!717155 () Bool)

(declare-fun e!402653 () Bool)

(assert (=> b!717155 (= e!402653 false)))

(declare-datatypes ((array!40614 0))(
  ( (array!40615 (arr!19440 (Array (_ BitVec 32) (_ BitVec 64))) (size!19861 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40614)

(declare-datatypes ((SeekEntryResult!7040 0))(
  ( (MissingZero!7040 (index!30528 (_ BitVec 32))) (Found!7040 (index!30529 (_ BitVec 32))) (Intermediate!7040 (undefined!7852 Bool) (index!30530 (_ BitVec 32)) (x!61556 (_ BitVec 32))) (Undefined!7040) (MissingVacant!7040 (index!30531 (_ BitVec 32))) )
))
(declare-fun lt!319013 () SeekEntryResult!7040)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40614 (_ BitVec 32)) SeekEntryResult!7040)

(assert (=> b!717155 (= lt!319013 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!479943 () Bool)

(assert (=> start!63718 (=> (not res!479943) (not e!402653))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63718 (= res!479943 (validMask!0 mask!3328))))

(assert (=> start!63718 e!402653))

(declare-fun array_inv!15236 (array!40614) Bool)

(assert (=> start!63718 (array_inv!15236 a!3186)))

(assert (=> start!63718 true))

(declare-fun b!717156 () Bool)

(declare-fun res!479945 () Bool)

(assert (=> b!717156 (=> (not res!479945) (not e!402653))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717156 (= res!479945 (validKeyInArray!0 k!2102))))

(declare-fun b!717157 () Bool)

(declare-fun res!479941 () Bool)

(assert (=> b!717157 (=> (not res!479941) (not e!402653))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!717157 (= res!479941 (validKeyInArray!0 (select (arr!19440 a!3186) j!159)))))

(declare-fun b!717158 () Bool)

(declare-fun res!479942 () Bool)

(assert (=> b!717158 (=> (not res!479942) (not e!402653))))

(declare-fun arrayContainsKey!0 (array!40614 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717158 (= res!479942 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!717159 () Bool)

(declare-fun res!479944 () Bool)

(assert (=> b!717159 (=> (not res!479944) (not e!402653))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!717159 (= res!479944 (and (= (size!19861 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19861 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19861 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!63718 res!479943) b!717159))

(assert (= (and b!717159 res!479944) b!717157))

(assert (= (and b!717157 res!479941) b!717156))

(assert (= (and b!717156 res!479945) b!717158))

(assert (= (and b!717158 res!479942) b!717155))

(declare-fun m!673111 () Bool)

(assert (=> b!717156 m!673111))

(declare-fun m!673113 () Bool)

(assert (=> start!63718 m!673113))

(declare-fun m!673115 () Bool)

(assert (=> start!63718 m!673115))

(declare-fun m!673117 () Bool)

(assert (=> b!717157 m!673117))

(assert (=> b!717157 m!673117))

(declare-fun m!673119 () Bool)

(assert (=> b!717157 m!673119))

(declare-fun m!673121 () Bool)

(assert (=> b!717158 m!673121))

(declare-fun m!673123 () Bool)

(assert (=> b!717155 m!673123))

(push 1)

(assert (not b!717156))

(assert (not b!717158))

(assert (not b!717155))

(assert (not b!717157))

(assert (not start!63718))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

