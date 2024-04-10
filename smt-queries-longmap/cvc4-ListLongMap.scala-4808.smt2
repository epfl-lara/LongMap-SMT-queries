; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66192 () Bool)

(assert start!66192)

(declare-fun b!762185 () Bool)

(declare-fun res!515301 () Bool)

(declare-fun e!424911 () Bool)

(assert (=> b!762185 (=> (not res!515301) (not e!424911))))

(declare-datatypes ((array!42097 0))(
  ( (array!42098 (arr!20156 (Array (_ BitVec 32) (_ BitVec 64))) (size!20577 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42097)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42097 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762185 (= res!515301 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!762186 () Bool)

(declare-fun res!515300 () Bool)

(declare-fun e!424909 () Bool)

(assert (=> b!762186 (=> (not res!515300) (not e!424909))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42097 (_ BitVec 32)) Bool)

(assert (=> b!762186 (= res!515300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!515302 () Bool)

(assert (=> start!66192 (=> (not res!515302) (not e!424911))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66192 (= res!515302 (validMask!0 mask!3328))))

(assert (=> start!66192 e!424911))

(declare-fun array_inv!15952 (array!42097) Bool)

(assert (=> start!66192 (array_inv!15952 a!3186)))

(assert (=> start!66192 true))

(declare-fun b!762187 () Bool)

(declare-fun res!515296 () Bool)

(assert (=> b!762187 (=> (not res!515296) (not e!424911))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762187 (= res!515296 (validKeyInArray!0 (select (arr!20156 a!3186) j!159)))))

(declare-fun b!762188 () Bool)

(declare-fun res!515299 () Bool)

(assert (=> b!762188 (=> (not res!515299) (not e!424911))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!762188 (= res!515299 (and (= (size!20577 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20577 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20577 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!762189 () Bool)

(assert (=> b!762189 (= e!424911 e!424909)))

(declare-fun res!515298 () Bool)

(assert (=> b!762189 (=> (not res!515298) (not e!424909))))

(declare-datatypes ((SeekEntryResult!7756 0))(
  ( (MissingZero!7756 (index!33392 (_ BitVec 32))) (Found!7756 (index!33393 (_ BitVec 32))) (Intermediate!7756 (undefined!8568 Bool) (index!33394 (_ BitVec 32)) (x!64304 (_ BitVec 32))) (Undefined!7756) (MissingVacant!7756 (index!33395 (_ BitVec 32))) )
))
(declare-fun lt!339515 () SeekEntryResult!7756)

(assert (=> b!762189 (= res!515298 (or (= lt!339515 (MissingZero!7756 i!1173)) (= lt!339515 (MissingVacant!7756 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42097 (_ BitVec 32)) SeekEntryResult!7756)

(assert (=> b!762189 (= lt!339515 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!762190 () Bool)

(declare-fun res!515297 () Bool)

(assert (=> b!762190 (=> (not res!515297) (not e!424911))))

(assert (=> b!762190 (= res!515297 (validKeyInArray!0 k!2102))))

(declare-fun b!762191 () Bool)

(assert (=> b!762191 (= e!424909 false)))

(declare-fun lt!339514 () Bool)

(declare-datatypes ((List!14158 0))(
  ( (Nil!14155) (Cons!14154 (h!15238 (_ BitVec 64)) (t!20473 List!14158)) )
))
(declare-fun arrayNoDuplicates!0 (array!42097 (_ BitVec 32) List!14158) Bool)

(assert (=> b!762191 (= lt!339514 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14155))))

(assert (= (and start!66192 res!515302) b!762188))

(assert (= (and b!762188 res!515299) b!762187))

(assert (= (and b!762187 res!515296) b!762190))

(assert (= (and b!762190 res!515297) b!762185))

(assert (= (and b!762185 res!515301) b!762189))

(assert (= (and b!762189 res!515298) b!762186))

(assert (= (and b!762186 res!515300) b!762191))

(declare-fun m!708987 () Bool)

(assert (=> b!762187 m!708987))

(assert (=> b!762187 m!708987))

(declare-fun m!708989 () Bool)

(assert (=> b!762187 m!708989))

(declare-fun m!708991 () Bool)

(assert (=> b!762191 m!708991))

(declare-fun m!708993 () Bool)

(assert (=> b!762185 m!708993))

(declare-fun m!708995 () Bool)

(assert (=> b!762190 m!708995))

(declare-fun m!708997 () Bool)

(assert (=> b!762189 m!708997))

(declare-fun m!708999 () Bool)

(assert (=> b!762186 m!708999))

(declare-fun m!709001 () Bool)

(assert (=> start!66192 m!709001))

(declare-fun m!709003 () Bool)

(assert (=> start!66192 m!709003))

(push 1)

(assert (not start!66192))

(assert (not b!762186))

(assert (not b!762185))

(assert (not b!762187))

(assert (not b!762190))

(assert (not b!762189))

