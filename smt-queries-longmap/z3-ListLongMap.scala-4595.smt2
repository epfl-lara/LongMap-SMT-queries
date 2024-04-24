; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64146 () Bool)

(assert start!64146)

(declare-fun b!720118 () Bool)

(declare-fun res!482365 () Bool)

(declare-fun e!404040 () Bool)

(assert (=> b!720118 (=> (not res!482365) (not e!404040))))

(declare-datatypes ((array!40774 0))(
  ( (array!40775 (arr!19510 (Array (_ BitVec 32) (_ BitVec 64))) (size!19930 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40774)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!720118 (= res!482365 (validKeyInArray!0 (select (arr!19510 a!3186) j!159)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!720119 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!404038 () Bool)

(assert (=> b!720119 (= e!404038 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19510 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsgt x!1131 resIntermediateX!5) (bvsge mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun b!720120 () Bool)

(declare-fun res!482369 () Bool)

(assert (=> b!720120 (=> (not res!482369) (not e!404038))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40774 (_ BitVec 32)) Bool)

(assert (=> b!720120 (= res!482369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!720121 () Bool)

(declare-fun res!482371 () Bool)

(assert (=> b!720121 (=> (not res!482371) (not e!404040))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40774 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!720121 (= res!482371 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!720122 () Bool)

(declare-fun res!482366 () Bool)

(assert (=> b!720122 (=> (not res!482366) (not e!404040))))

(assert (=> b!720122 (= res!482366 (and (= (size!19930 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19930 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19930 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!720123 () Bool)

(declare-fun res!482367 () Bool)

(assert (=> b!720123 (=> (not res!482367) (not e!404038))))

(declare-datatypes ((SeekEntryResult!7066 0))(
  ( (MissingZero!7066 (index!30632 (_ BitVec 32))) (Found!7066 (index!30633 (_ BitVec 32))) (Intermediate!7066 (undefined!7878 Bool) (index!30634 (_ BitVec 32)) (x!61788 (_ BitVec 32))) (Undefined!7066) (MissingVacant!7066 (index!30635 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40774 (_ BitVec 32)) SeekEntryResult!7066)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!720123 (= res!482367 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19510 a!3186) j!159) mask!3328) (select (arr!19510 a!3186) j!159) a!3186 mask!3328) (Intermediate!7066 false resIntermediateIndex!5 resIntermediateX!5)))))

(declare-fun res!482368 () Bool)

(assert (=> start!64146 (=> (not res!482368) (not e!404040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64146 (= res!482368 (validMask!0 mask!3328))))

(assert (=> start!64146 e!404040))

(assert (=> start!64146 true))

(declare-fun array_inv!15369 (array!40774) Bool)

(assert (=> start!64146 (array_inv!15369 a!3186)))

(declare-fun b!720124 () Bool)

(declare-fun res!482363 () Bool)

(assert (=> b!720124 (=> (not res!482363) (not e!404040))))

(assert (=> b!720124 (= res!482363 (validKeyInArray!0 k0!2102))))

(declare-fun b!720125 () Bool)

(declare-fun res!482362 () Bool)

(assert (=> b!720125 (=> (not res!482362) (not e!404038))))

(assert (=> b!720125 (= res!482362 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19930 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19930 a!3186))))))

(declare-fun b!720126 () Bool)

(assert (=> b!720126 (= e!404040 e!404038)))

(declare-fun res!482364 () Bool)

(assert (=> b!720126 (=> (not res!482364) (not e!404038))))

(declare-fun lt!319785 () SeekEntryResult!7066)

(assert (=> b!720126 (= res!482364 (or (= lt!319785 (MissingZero!7066 i!1173)) (= lt!319785 (MissingVacant!7066 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40774 (_ BitVec 32)) SeekEntryResult!7066)

(assert (=> b!720126 (= lt!319785 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!720127 () Bool)

(declare-fun res!482370 () Bool)

(assert (=> b!720127 (=> (not res!482370) (not e!404038))))

(declare-datatypes ((List!13419 0))(
  ( (Nil!13416) (Cons!13415 (h!14466 (_ BitVec 64)) (t!19726 List!13419)) )
))
(declare-fun arrayNoDuplicates!0 (array!40774 (_ BitVec 32) List!13419) Bool)

(assert (=> b!720127 (= res!482370 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13416))))

(assert (= (and start!64146 res!482368) b!720122))

(assert (= (and b!720122 res!482366) b!720118))

(assert (= (and b!720118 res!482365) b!720124))

(assert (= (and b!720124 res!482363) b!720121))

(assert (= (and b!720121 res!482371) b!720126))

(assert (= (and b!720126 res!482364) b!720120))

(assert (= (and b!720120 res!482369) b!720127))

(assert (= (and b!720127 res!482370) b!720125))

(assert (= (and b!720125 res!482362) b!720123))

(assert (= (and b!720123 res!482367) b!720119))

(declare-fun m!675975 () Bool)

(assert (=> start!64146 m!675975))

(declare-fun m!675977 () Bool)

(assert (=> start!64146 m!675977))

(declare-fun m!675979 () Bool)

(assert (=> b!720126 m!675979))

(declare-fun m!675981 () Bool)

(assert (=> b!720119 m!675981))

(declare-fun m!675983 () Bool)

(assert (=> b!720124 m!675983))

(declare-fun m!675985 () Bool)

(assert (=> b!720127 m!675985))

(declare-fun m!675987 () Bool)

(assert (=> b!720123 m!675987))

(assert (=> b!720123 m!675987))

(declare-fun m!675989 () Bool)

(assert (=> b!720123 m!675989))

(assert (=> b!720123 m!675989))

(assert (=> b!720123 m!675987))

(declare-fun m!675991 () Bool)

(assert (=> b!720123 m!675991))

(declare-fun m!675993 () Bool)

(assert (=> b!720120 m!675993))

(declare-fun m!675995 () Bool)

(assert (=> b!720121 m!675995))

(assert (=> b!720118 m!675987))

(assert (=> b!720118 m!675987))

(declare-fun m!675997 () Bool)

(assert (=> b!720118 m!675997))

(check-sat (not b!720126) (not b!720127) (not b!720120) (not start!64146) (not b!720118) (not b!720121) (not b!720124) (not b!720123))
(check-sat)
