; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64098 () Bool)

(assert start!64098)

(declare-fun b!719986 () Bool)

(declare-fun res!482387 () Bool)

(declare-fun e!403877 () Bool)

(assert (=> b!719986 (=> (not res!482387) (not e!403877))))

(declare-datatypes ((array!40793 0))(
  ( (array!40794 (arr!19522 (Array (_ BitVec 32) (_ BitVec 64))) (size!19943 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40793)

(declare-datatypes ((List!13524 0))(
  ( (Nil!13521) (Cons!13520 (h!14568 (_ BitVec 64)) (t!19839 List!13524)) )
))
(declare-fun arrayNoDuplicates!0 (array!40793 (_ BitVec 32) List!13524) Bool)

(assert (=> b!719986 (= res!482387 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13521))))

(declare-fun b!719987 () Bool)

(declare-fun res!482382 () Bool)

(assert (=> b!719987 (=> (not res!482382) (not e!403877))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719987 (= res!482382 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19943 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19943 a!3186))))))

(declare-fun b!719988 () Bool)

(declare-fun e!403875 () Bool)

(assert (=> b!719988 (= e!403875 e!403877)))

(declare-fun res!482381 () Bool)

(assert (=> b!719988 (=> (not res!482381) (not e!403877))))

(declare-datatypes ((SeekEntryResult!7122 0))(
  ( (MissingZero!7122 (index!30856 (_ BitVec 32))) (Found!7122 (index!30857 (_ BitVec 32))) (Intermediate!7122 (undefined!7934 Bool) (index!30858 (_ BitVec 32)) (x!61857 (_ BitVec 32))) (Undefined!7122) (MissingVacant!7122 (index!30859 (_ BitVec 32))) )
))
(declare-fun lt!319690 () SeekEntryResult!7122)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719988 (= res!482381 (or (= lt!319690 (MissingZero!7122 i!1173)) (= lt!319690 (MissingVacant!7122 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40793 (_ BitVec 32)) SeekEntryResult!7122)

(assert (=> b!719988 (= lt!319690 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!482384 () Bool)

(assert (=> start!64098 (=> (not res!482384) (not e!403875))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64098 (= res!482384 (validMask!0 mask!3328))))

(assert (=> start!64098 e!403875))

(assert (=> start!64098 true))

(declare-fun array_inv!15318 (array!40793) Bool)

(assert (=> start!64098 (array_inv!15318 a!3186)))

(declare-fun b!719989 () Bool)

(declare-fun res!482386 () Bool)

(assert (=> b!719989 (=> (not res!482386) (not e!403875))))

(declare-fun arrayContainsKey!0 (array!40793 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719989 (= res!482386 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719990 () Bool)

(declare-fun res!482380 () Bool)

(assert (=> b!719990 (=> (not res!482380) (not e!403875))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!719990 (= res!482380 (and (= (size!19943 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19943 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19943 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719991 () Bool)

(declare-fun res!482385 () Bool)

(assert (=> b!719991 (=> (not res!482385) (not e!403875))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719991 (= res!482385 (validKeyInArray!0 (select (arr!19522 a!3186) j!159)))))

(declare-fun b!719992 () Bool)

(declare-fun res!482383 () Bool)

(assert (=> b!719992 (=> (not res!482383) (not e!403877))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40793 (_ BitVec 32)) Bool)

(assert (=> b!719992 (= res!482383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719993 () Bool)

(declare-fun res!482379 () Bool)

(assert (=> b!719993 (=> (not res!482379) (not e!403875))))

(assert (=> b!719993 (= res!482379 (validKeyInArray!0 k0!2102))))

(declare-fun b!719994 () Bool)

(assert (=> b!719994 (= e!403877 false)))

(declare-fun lt!319691 () SeekEntryResult!7122)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40793 (_ BitVec 32)) SeekEntryResult!7122)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719994 (= lt!319691 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19522 a!3186) j!159) mask!3328) (select (arr!19522 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and start!64098 res!482384) b!719990))

(assert (= (and b!719990 res!482380) b!719991))

(assert (= (and b!719991 res!482385) b!719993))

(assert (= (and b!719993 res!482379) b!719989))

(assert (= (and b!719989 res!482386) b!719988))

(assert (= (and b!719988 res!482381) b!719992))

(assert (= (and b!719992 res!482383) b!719986))

(assert (= (and b!719986 res!482387) b!719987))

(assert (= (and b!719987 res!482382) b!719994))

(declare-fun m!675287 () Bool)

(assert (=> b!719992 m!675287))

(declare-fun m!675289 () Bool)

(assert (=> start!64098 m!675289))

(declare-fun m!675291 () Bool)

(assert (=> start!64098 m!675291))

(declare-fun m!675293 () Bool)

(assert (=> b!719994 m!675293))

(assert (=> b!719994 m!675293))

(declare-fun m!675295 () Bool)

(assert (=> b!719994 m!675295))

(assert (=> b!719994 m!675295))

(assert (=> b!719994 m!675293))

(declare-fun m!675297 () Bool)

(assert (=> b!719994 m!675297))

(declare-fun m!675299 () Bool)

(assert (=> b!719988 m!675299))

(declare-fun m!675301 () Bool)

(assert (=> b!719986 m!675301))

(declare-fun m!675303 () Bool)

(assert (=> b!719989 m!675303))

(declare-fun m!675305 () Bool)

(assert (=> b!719993 m!675305))

(assert (=> b!719991 m!675293))

(assert (=> b!719991 m!675293))

(declare-fun m!675307 () Bool)

(assert (=> b!719991 m!675307))

(check-sat (not b!719992) (not b!719988) (not b!719993) (not b!719989) (not b!719994) (not b!719986) (not b!719991) (not start!64098))
(check-sat)
