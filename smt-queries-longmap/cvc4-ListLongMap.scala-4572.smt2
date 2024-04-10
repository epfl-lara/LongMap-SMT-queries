; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63734 () Bool)

(assert start!63734)

(declare-fun b!717291 () Bool)

(declare-fun e!402709 () Bool)

(declare-fun e!402710 () Bool)

(assert (=> b!717291 (= e!402709 e!402710)))

(declare-fun res!480080 () Bool)

(assert (=> b!717291 (=> (not res!480080) (not e!402710))))

(declare-datatypes ((SeekEntryResult!7048 0))(
  ( (MissingZero!7048 (index!30560 (_ BitVec 32))) (Found!7048 (index!30561 (_ BitVec 32))) (Intermediate!7048 (undefined!7860 Bool) (index!30562 (_ BitVec 32)) (x!61580 (_ BitVec 32))) (Undefined!7048) (MissingVacant!7048 (index!30563 (_ BitVec 32))) )
))
(declare-fun lt!319037 () SeekEntryResult!7048)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!717291 (= res!480080 (or (= lt!319037 (MissingZero!7048 i!1173)) (= lt!319037 (MissingVacant!7048 i!1173))))))

(declare-datatypes ((array!40630 0))(
  ( (array!40631 (arr!19448 (Array (_ BitVec 32) (_ BitVec 64))) (size!19869 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40630)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40630 (_ BitVec 32)) SeekEntryResult!7048)

(assert (=> b!717291 (= lt!319037 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!717293 () Bool)

(declare-fun res!480078 () Bool)

(assert (=> b!717293 (=> (not res!480078) (not e!402709))))

(declare-fun arrayContainsKey!0 (array!40630 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717293 (= res!480078 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!717294 () Bool)

(assert (=> b!717294 (= e!402710 (bvsgt #b00000000000000000000000000000000 (size!19869 a!3186)))))

(declare-fun b!717295 () Bool)

(declare-fun res!480083 () Bool)

(assert (=> b!717295 (=> (not res!480083) (not e!402709))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717295 (= res!480083 (validKeyInArray!0 k!2102))))

(declare-fun b!717292 () Bool)

(declare-fun res!480079 () Bool)

(assert (=> b!717292 (=> (not res!480079) (not e!402710))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40630 (_ BitVec 32)) Bool)

(assert (=> b!717292 (= res!480079 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!480082 () Bool)

(assert (=> start!63734 (=> (not res!480082) (not e!402709))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63734 (= res!480082 (validMask!0 mask!3328))))

(assert (=> start!63734 e!402709))

(declare-fun array_inv!15244 (array!40630) Bool)

(assert (=> start!63734 (array_inv!15244 a!3186)))

(assert (=> start!63734 true))

(declare-fun b!717296 () Bool)

(declare-fun res!480077 () Bool)

(assert (=> b!717296 (=> (not res!480077) (not e!402709))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!717296 (= res!480077 (validKeyInArray!0 (select (arr!19448 a!3186) j!159)))))

(declare-fun b!717297 () Bool)

(declare-fun res!480081 () Bool)

(assert (=> b!717297 (=> (not res!480081) (not e!402709))))

(assert (=> b!717297 (= res!480081 (and (= (size!19869 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19869 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19869 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!63734 res!480082) b!717297))

(assert (= (and b!717297 res!480081) b!717296))

(assert (= (and b!717296 res!480077) b!717295))

(assert (= (and b!717295 res!480083) b!717293))

(assert (= (and b!717293 res!480078) b!717291))

(assert (= (and b!717291 res!480080) b!717292))

(assert (= (and b!717292 res!480079) b!717294))

(declare-fun m!673227 () Bool)

(assert (=> b!717296 m!673227))

(assert (=> b!717296 m!673227))

(declare-fun m!673229 () Bool)

(assert (=> b!717296 m!673229))

(declare-fun m!673231 () Bool)

(assert (=> b!717295 m!673231))

(declare-fun m!673233 () Bool)

(assert (=> b!717291 m!673233))

(declare-fun m!673235 () Bool)

(assert (=> start!63734 m!673235))

(declare-fun m!673237 () Bool)

(assert (=> start!63734 m!673237))

(declare-fun m!673239 () Bool)

(assert (=> b!717292 m!673239))

(declare-fun m!673241 () Bool)

(assert (=> b!717293 m!673241))

(push 1)

(assert (not b!717296))

(assert (not start!63734))

(assert (not b!717291))

(assert (not b!717293))

(assert (not b!717295))

(assert (not b!717292))

(check-sat)

(pop 1)

