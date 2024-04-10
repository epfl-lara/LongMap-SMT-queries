; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64026 () Bool)

(assert start!64026)

(declare-fun b!718974 () Bool)

(declare-fun res!481368 () Bool)

(declare-fun e!403552 () Bool)

(assert (=> b!718974 (=> (not res!481368) (not e!403552))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718974 (= res!481368 (validKeyInArray!0 k0!2102))))

(declare-fun b!718975 () Bool)

(declare-fun res!481372 () Bool)

(declare-fun e!403551 () Bool)

(assert (=> b!718975 (=> (not res!481372) (not e!403551))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40721 0))(
  ( (array!40722 (arr!19486 (Array (_ BitVec 32) (_ BitVec 64))) (size!19907 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40721)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7086 0))(
  ( (MissingZero!7086 (index!30712 (_ BitVec 32))) (Found!7086 (index!30713 (_ BitVec 32))) (Intermediate!7086 (undefined!7898 Bool) (index!30714 (_ BitVec 32)) (x!61725 (_ BitVec 32))) (Undefined!7086) (MissingVacant!7086 (index!30715 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40721 (_ BitVec 32)) SeekEntryResult!7086)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!718975 (= res!481372 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19486 a!3186) j!159) mask!3328) (select (arr!19486 a!3186) j!159) a!3186 mask!3328) (Intermediate!7086 false resIntermediateIndex!5 resIntermediateX!5)))))

(declare-fun res!481375 () Bool)

(assert (=> start!64026 (=> (not res!481375) (not e!403552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64026 (= res!481375 (validMask!0 mask!3328))))

(assert (=> start!64026 e!403552))

(assert (=> start!64026 true))

(declare-fun array_inv!15282 (array!40721) Bool)

(assert (=> start!64026 (array_inv!15282 a!3186)))

(declare-fun b!718976 () Bool)

(assert (=> b!718976 (= e!403552 e!403551)))

(declare-fun res!481376 () Bool)

(assert (=> b!718976 (=> (not res!481376) (not e!403551))))

(declare-fun lt!319514 () SeekEntryResult!7086)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!718976 (= res!481376 (or (= lt!319514 (MissingZero!7086 i!1173)) (= lt!319514 (MissingVacant!7086 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40721 (_ BitVec 32)) SeekEntryResult!7086)

(assert (=> b!718976 (= lt!319514 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!718977 () Bool)

(declare-fun res!481374 () Bool)

(assert (=> b!718977 (=> (not res!481374) (not e!403552))))

(declare-fun arrayContainsKey!0 (array!40721 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718977 (= res!481374 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!718978 () Bool)

(declare-fun res!481367 () Bool)

(assert (=> b!718978 (=> (not res!481367) (not e!403552))))

(assert (=> b!718978 (= res!481367 (validKeyInArray!0 (select (arr!19486 a!3186) j!159)))))

(declare-fun b!718979 () Bool)

(declare-fun res!481373 () Bool)

(assert (=> b!718979 (=> (not res!481373) (not e!403551))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!718979 (= res!481373 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19907 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19907 a!3186))))))

(declare-fun b!718980 () Bool)

(declare-fun res!481371 () Bool)

(assert (=> b!718980 (=> (not res!481371) (not e!403551))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40721 (_ BitVec 32)) Bool)

(assert (=> b!718980 (= res!481371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!718981 () Bool)

(declare-fun res!481369 () Bool)

(assert (=> b!718981 (=> (not res!481369) (not e!403552))))

(assert (=> b!718981 (= res!481369 (and (= (size!19907 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19907 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19907 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!718982 () Bool)

(declare-fun res!481370 () Bool)

(assert (=> b!718982 (=> (not res!481370) (not e!403551))))

(declare-datatypes ((List!13488 0))(
  ( (Nil!13485) (Cons!13484 (h!14532 (_ BitVec 64)) (t!19803 List!13488)) )
))
(declare-fun arrayNoDuplicates!0 (array!40721 (_ BitVec 32) List!13488) Bool)

(assert (=> b!718982 (= res!481370 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13485))))

(declare-fun b!718983 () Bool)

(assert (=> b!718983 (= e!403551 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19486 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsle x!1131 resIntermediateX!5) (bvslt mask!3328 #b00000000000000000000000000000000)))))

(assert (= (and start!64026 res!481375) b!718981))

(assert (= (and b!718981 res!481369) b!718978))

(assert (= (and b!718978 res!481367) b!718974))

(assert (= (and b!718974 res!481368) b!718977))

(assert (= (and b!718977 res!481374) b!718976))

(assert (= (and b!718976 res!481376) b!718980))

(assert (= (and b!718980 res!481371) b!718982))

(assert (= (and b!718982 res!481370) b!718979))

(assert (= (and b!718979 res!481373) b!718975))

(assert (= (and b!718975 res!481372) b!718983))

(declare-fun m!674467 () Bool)

(assert (=> b!718976 m!674467))

(declare-fun m!674469 () Bool)

(assert (=> b!718977 m!674469))

(declare-fun m!674471 () Bool)

(assert (=> b!718982 m!674471))

(declare-fun m!674473 () Bool)

(assert (=> b!718974 m!674473))

(declare-fun m!674475 () Bool)

(assert (=> b!718978 m!674475))

(assert (=> b!718978 m!674475))

(declare-fun m!674477 () Bool)

(assert (=> b!718978 m!674477))

(assert (=> b!718975 m!674475))

(assert (=> b!718975 m!674475))

(declare-fun m!674479 () Bool)

(assert (=> b!718975 m!674479))

(assert (=> b!718975 m!674479))

(assert (=> b!718975 m!674475))

(declare-fun m!674481 () Bool)

(assert (=> b!718975 m!674481))

(declare-fun m!674483 () Bool)

(assert (=> b!718983 m!674483))

(declare-fun m!674485 () Bool)

(assert (=> start!64026 m!674485))

(declare-fun m!674487 () Bool)

(assert (=> start!64026 m!674487))

(declare-fun m!674489 () Bool)

(assert (=> b!718980 m!674489))

(check-sat (not b!718974) (not start!64026) (not b!718976) (not b!718975) (not b!718982) (not b!718977) (not b!718978) (not b!718980))
(check-sat)
