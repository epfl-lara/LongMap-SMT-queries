; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63730 () Bool)

(assert start!63730)

(declare-fun b!717249 () Bool)

(declare-fun res!480037 () Bool)

(declare-fun e!402690 () Bool)

(assert (=> b!717249 (=> (not res!480037) (not e!402690))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717249 (= res!480037 (validKeyInArray!0 k!2102))))

(declare-fun b!717250 () Bool)

(declare-fun res!480038 () Bool)

(assert (=> b!717250 (=> (not res!480038) (not e!402690))))

(declare-datatypes ((array!40626 0))(
  ( (array!40627 (arr!19446 (Array (_ BitVec 32) (_ BitVec 64))) (size!19867 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40626)

(declare-fun arrayContainsKey!0 (array!40626 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717250 (= res!480038 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!717251 () Bool)

(declare-fun res!480041 () Bool)

(assert (=> b!717251 (=> (not res!480041) (not e!402690))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!717251 (= res!480041 (and (= (size!19867 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19867 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19867 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717252 () Bool)

(declare-fun res!480040 () Bool)

(declare-fun e!402691 () Bool)

(assert (=> b!717252 (=> (not res!480040) (not e!402691))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40626 (_ BitVec 32)) Bool)

(assert (=> b!717252 (= res!480040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!480036 () Bool)

(assert (=> start!63730 (=> (not res!480036) (not e!402690))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63730 (= res!480036 (validMask!0 mask!3328))))

(assert (=> start!63730 e!402690))

(declare-fun array_inv!15242 (array!40626) Bool)

(assert (=> start!63730 (array_inv!15242 a!3186)))

(assert (=> start!63730 true))

(declare-fun b!717253 () Bool)

(assert (=> b!717253 (= e!402690 e!402691)))

(declare-fun res!480035 () Bool)

(assert (=> b!717253 (=> (not res!480035) (not e!402691))))

(declare-datatypes ((SeekEntryResult!7046 0))(
  ( (MissingZero!7046 (index!30552 (_ BitVec 32))) (Found!7046 (index!30553 (_ BitVec 32))) (Intermediate!7046 (undefined!7858 Bool) (index!30554 (_ BitVec 32)) (x!61578 (_ BitVec 32))) (Undefined!7046) (MissingVacant!7046 (index!30555 (_ BitVec 32))) )
))
(declare-fun lt!319031 () SeekEntryResult!7046)

(assert (=> b!717253 (= res!480035 (or (= lt!319031 (MissingZero!7046 i!1173)) (= lt!319031 (MissingVacant!7046 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40626 (_ BitVec 32)) SeekEntryResult!7046)

(assert (=> b!717253 (= lt!319031 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!717254 () Bool)

(declare-fun res!480039 () Bool)

(assert (=> b!717254 (=> (not res!480039) (not e!402690))))

(assert (=> b!717254 (= res!480039 (validKeyInArray!0 (select (arr!19446 a!3186) j!159)))))

(declare-fun b!717255 () Bool)

(assert (=> b!717255 (= e!402691 (bvsgt #b00000000000000000000000000000000 (size!19867 a!3186)))))

(assert (= (and start!63730 res!480036) b!717251))

(assert (= (and b!717251 res!480041) b!717254))

(assert (= (and b!717254 res!480039) b!717249))

(assert (= (and b!717249 res!480037) b!717250))

(assert (= (and b!717250 res!480038) b!717253))

(assert (= (and b!717253 res!480035) b!717252))

(assert (= (and b!717252 res!480040) b!717255))

(declare-fun m!673195 () Bool)

(assert (=> b!717249 m!673195))

(declare-fun m!673197 () Bool)

(assert (=> b!717253 m!673197))

(declare-fun m!673199 () Bool)

(assert (=> b!717252 m!673199))

(declare-fun m!673201 () Bool)

(assert (=> start!63730 m!673201))

(declare-fun m!673203 () Bool)

(assert (=> start!63730 m!673203))

(declare-fun m!673205 () Bool)

(assert (=> b!717254 m!673205))

(assert (=> b!717254 m!673205))

(declare-fun m!673207 () Bool)

(assert (=> b!717254 m!673207))

(declare-fun m!673209 () Bool)

(assert (=> b!717250 m!673209))

(push 1)

