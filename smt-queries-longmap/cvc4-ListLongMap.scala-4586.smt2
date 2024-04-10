; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64034 () Bool)

(assert start!64034)

(declare-fun res!481481 () Bool)

(declare-fun e!403588 () Bool)

(assert (=> start!64034 (=> (not res!481481) (not e!403588))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64034 (= res!481481 (validMask!0 mask!3328))))

(assert (=> start!64034 e!403588))

(assert (=> start!64034 true))

(declare-datatypes ((array!40729 0))(
  ( (array!40730 (arr!19490 (Array (_ BitVec 32) (_ BitVec 64))) (size!19911 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40729)

(declare-fun array_inv!15286 (array!40729) Bool)

(assert (=> start!64034 (array_inv!15286 a!3186)))

(declare-fun b!719086 () Bool)

(declare-fun res!481484 () Bool)

(declare-fun e!403587 () Bool)

(assert (=> b!719086 (=> (not res!481484) (not e!403587))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719086 (= res!481484 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19911 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19911 a!3186))))))

(declare-fun b!719087 () Bool)

(declare-fun res!481480 () Bool)

(assert (=> b!719087 (=> (not res!481480) (not e!403587))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40729 (_ BitVec 32)) Bool)

(assert (=> b!719087 (= res!481480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719088 () Bool)

(declare-fun res!481482 () Bool)

(assert (=> b!719088 (=> (not res!481482) (not e!403588))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719088 (= res!481482 (validKeyInArray!0 k!2102))))

(declare-fun b!719089 () Bool)

(declare-fun res!481479 () Bool)

(assert (=> b!719089 (=> (not res!481479) (not e!403588))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!719089 (= res!481479 (validKeyInArray!0 (select (arr!19490 a!3186) j!159)))))

(declare-fun b!719090 () Bool)

(assert (=> b!719090 (= e!403588 e!403587)))

(declare-fun res!481483 () Bool)

(assert (=> b!719090 (=> (not res!481483) (not e!403587))))

(declare-datatypes ((SeekEntryResult!7090 0))(
  ( (MissingZero!7090 (index!30728 (_ BitVec 32))) (Found!7090 (index!30729 (_ BitVec 32))) (Intermediate!7090 (undefined!7902 Bool) (index!30730 (_ BitVec 32)) (x!61737 (_ BitVec 32))) (Undefined!7090) (MissingVacant!7090 (index!30731 (_ BitVec 32))) )
))
(declare-fun lt!319535 () SeekEntryResult!7090)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719090 (= res!481483 (or (= lt!319535 (MissingZero!7090 i!1173)) (= lt!319535 (MissingVacant!7090 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40729 (_ BitVec 32)) SeekEntryResult!7090)

(assert (=> b!719090 (= lt!319535 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!719091 () Bool)

(declare-fun res!481485 () Bool)

(assert (=> b!719091 (=> (not res!481485) (not e!403588))))

(assert (=> b!719091 (= res!481485 (and (= (size!19911 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19911 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19911 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719092 () Bool)

(declare-fun res!481487 () Bool)

(assert (=> b!719092 (=> (not res!481487) (not e!403587))))

(declare-datatypes ((List!13492 0))(
  ( (Nil!13489) (Cons!13488 (h!14536 (_ BitVec 64)) (t!19807 List!13492)) )
))
(declare-fun arrayNoDuplicates!0 (array!40729 (_ BitVec 32) List!13492) Bool)

(assert (=> b!719092 (= res!481487 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13489))))

(declare-fun b!719093 () Bool)

(assert (=> b!719093 (= e!403587 false)))

(declare-fun lt!319534 () SeekEntryResult!7090)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40729 (_ BitVec 32)) SeekEntryResult!7090)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719093 (= lt!319534 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19490 a!3186) j!159) mask!3328) (select (arr!19490 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!719094 () Bool)

(declare-fun res!481486 () Bool)

(assert (=> b!719094 (=> (not res!481486) (not e!403588))))

(declare-fun arrayContainsKey!0 (array!40729 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719094 (= res!481486 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!64034 res!481481) b!719091))

(assert (= (and b!719091 res!481485) b!719089))

(assert (= (and b!719089 res!481479) b!719088))

(assert (= (and b!719088 res!481482) b!719094))

(assert (= (and b!719094 res!481486) b!719090))

(assert (= (and b!719090 res!481483) b!719087))

(assert (= (and b!719087 res!481480) b!719092))

(assert (= (and b!719092 res!481487) b!719086))

(assert (= (and b!719086 res!481484) b!719093))

(declare-fun m!674559 () Bool)

(assert (=> b!719088 m!674559))

(declare-fun m!674561 () Bool)

(assert (=> b!719089 m!674561))

(assert (=> b!719089 m!674561))

(declare-fun m!674563 () Bool)

(assert (=> b!719089 m!674563))

(declare-fun m!674565 () Bool)

(assert (=> b!719090 m!674565))

(declare-fun m!674567 () Bool)

(assert (=> b!719087 m!674567))

(assert (=> b!719093 m!674561))

(assert (=> b!719093 m!674561))

(declare-fun m!674569 () Bool)

(assert (=> b!719093 m!674569))

(assert (=> b!719093 m!674569))

(assert (=> b!719093 m!674561))

(declare-fun m!674571 () Bool)

(assert (=> b!719093 m!674571))

(declare-fun m!674573 () Bool)

(assert (=> b!719092 m!674573))

(declare-fun m!674575 () Bool)

(assert (=> b!719094 m!674575))

(declare-fun m!674577 () Bool)

(assert (=> start!64034 m!674577))

(declare-fun m!674579 () Bool)

(assert (=> start!64034 m!674579))

(push 1)

(assert (not b!719087))

(assert (not b!719089))

(assert (not b!719092))

(assert (not b!719094))

(assert (not b!719090))

(assert (not b!719093))

(assert (not start!64034))

(assert (not b!719088))

(check-sat)

(pop 1)

(push 1)

