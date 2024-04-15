; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66186 () Bool)

(assert start!66186)

(declare-fun b!762122 () Bool)

(declare-fun e!424818 () Bool)

(declare-fun e!424819 () Bool)

(assert (=> b!762122 (= e!424818 e!424819)))

(declare-fun res!515375 () Bool)

(assert (=> b!762122 (=> (not res!515375) (not e!424819))))

(declare-datatypes ((SeekEntryResult!7759 0))(
  ( (MissingZero!7759 (index!33404 (_ BitVec 32))) (Found!7759 (index!33405 (_ BitVec 32))) (Intermediate!7759 (undefined!8571 Bool) (index!33406 (_ BitVec 32)) (x!64326 (_ BitVec 32))) (Undefined!7759) (MissingVacant!7759 (index!33407 (_ BitVec 32))) )
))
(declare-fun lt!339316 () SeekEntryResult!7759)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!762122 (= res!515375 (or (= lt!339316 (MissingZero!7759 i!1173)) (= lt!339316 (MissingVacant!7759 i!1173))))))

(declare-datatypes ((array!42108 0))(
  ( (array!42109 (arr!20162 (Array (_ BitVec 32) (_ BitVec 64))) (size!20583 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42108)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42108 (_ BitVec 32)) SeekEntryResult!7759)

(assert (=> b!762122 (= lt!339316 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!762123 () Bool)

(declare-fun res!515378 () Bool)

(assert (=> b!762123 (=> (not res!515378) (not e!424819))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!762123 (= res!515378 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20583 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20583 a!3186))))))

(declare-fun b!762124 () Bool)

(declare-fun res!515377 () Bool)

(assert (=> b!762124 (=> (not res!515377) (not e!424818))))

(declare-fun arrayContainsKey!0 (array!42108 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762124 (= res!515377 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!762125 () Bool)

(declare-fun res!515373 () Bool)

(assert (=> b!762125 (=> (not res!515373) (not e!424818))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762125 (= res!515373 (validKeyInArray!0 (select (arr!20162 a!3186) j!159)))))

(declare-fun b!762126 () Bool)

(declare-fun res!515374 () Bool)

(assert (=> b!762126 (=> (not res!515374) (not e!424818))))

(assert (=> b!762126 (= res!515374 (validKeyInArray!0 k0!2102))))

(declare-fun b!762127 () Bool)

(assert (=> b!762127 (= e!424819 false)))

(declare-fun lt!339317 () SeekEntryResult!7759)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42108 (_ BitVec 32)) SeekEntryResult!7759)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!762127 (= lt!339317 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20162 a!3186) j!159) mask!3328) (select (arr!20162 a!3186) j!159) a!3186 mask!3328))))

(declare-fun res!515376 () Bool)

(assert (=> start!66186 (=> (not res!515376) (not e!424818))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66186 (= res!515376 (validMask!0 mask!3328))))

(assert (=> start!66186 e!424818))

(assert (=> start!66186 true))

(declare-fun array_inv!16045 (array!42108) Bool)

(assert (=> start!66186 (array_inv!16045 a!3186)))

(declare-fun b!762128 () Bool)

(declare-fun res!515379 () Bool)

(assert (=> b!762128 (=> (not res!515379) (not e!424819))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42108 (_ BitVec 32)) Bool)

(assert (=> b!762128 (= res!515379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!762129 () Bool)

(declare-fun res!515381 () Bool)

(assert (=> b!762129 (=> (not res!515381) (not e!424819))))

(declare-datatypes ((List!14203 0))(
  ( (Nil!14200) (Cons!14199 (h!15283 (_ BitVec 64)) (t!20509 List!14203)) )
))
(declare-fun arrayNoDuplicates!0 (array!42108 (_ BitVec 32) List!14203) Bool)

(assert (=> b!762129 (= res!515381 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14200))))

(declare-fun b!762130 () Bool)

(declare-fun res!515380 () Bool)

(assert (=> b!762130 (=> (not res!515380) (not e!424818))))

(assert (=> b!762130 (= res!515380 (and (= (size!20583 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20583 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20583 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!66186 res!515376) b!762130))

(assert (= (and b!762130 res!515380) b!762125))

(assert (= (and b!762125 res!515373) b!762126))

(assert (= (and b!762126 res!515374) b!762124))

(assert (= (and b!762124 res!515377) b!762122))

(assert (= (and b!762122 res!515375) b!762128))

(assert (= (and b!762128 res!515379) b!762129))

(assert (= (and b!762129 res!515381) b!762123))

(assert (= (and b!762123 res!515378) b!762127))

(declare-fun m!708373 () Bool)

(assert (=> b!762124 m!708373))

(declare-fun m!708375 () Bool)

(assert (=> b!762129 m!708375))

(declare-fun m!708377 () Bool)

(assert (=> b!762125 m!708377))

(assert (=> b!762125 m!708377))

(declare-fun m!708379 () Bool)

(assert (=> b!762125 m!708379))

(assert (=> b!762127 m!708377))

(assert (=> b!762127 m!708377))

(declare-fun m!708381 () Bool)

(assert (=> b!762127 m!708381))

(assert (=> b!762127 m!708381))

(assert (=> b!762127 m!708377))

(declare-fun m!708383 () Bool)

(assert (=> b!762127 m!708383))

(declare-fun m!708385 () Bool)

(assert (=> start!66186 m!708385))

(declare-fun m!708387 () Bool)

(assert (=> start!66186 m!708387))

(declare-fun m!708389 () Bool)

(assert (=> b!762126 m!708389))

(declare-fun m!708391 () Bool)

(assert (=> b!762128 m!708391))

(declare-fun m!708393 () Bool)

(assert (=> b!762122 m!708393))

(check-sat (not b!762122) (not start!66186) (not b!762127) (not b!762126) (not b!762124) (not b!762128) (not b!762125) (not b!762129))
(check-sat)
