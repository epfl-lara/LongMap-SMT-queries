; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64332 () Bool)

(assert start!64332)

(declare-fun b!722981 () Bool)

(declare-fun e!405125 () Bool)

(declare-fun e!405122 () Bool)

(assert (=> b!722981 (= e!405125 e!405122)))

(declare-fun res!484622 () Bool)

(assert (=> b!722981 (=> (not res!484622) (not e!405122))))

(declare-datatypes ((array!40913 0))(
  ( (array!40914 (arr!19579 (Array (_ BitVec 32) (_ BitVec 64))) (size!20000 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40913)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7179 0))(
  ( (MissingZero!7179 (index!31084 (_ BitVec 32))) (Found!7179 (index!31085 (_ BitVec 32))) (Intermediate!7179 (undefined!7991 Bool) (index!31086 (_ BitVec 32)) (x!62084 (_ BitVec 32))) (Undefined!7179) (MissingVacant!7179 (index!31087 (_ BitVec 32))) )
))
(declare-fun lt!320512 () SeekEntryResult!7179)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40913 (_ BitVec 32)) SeekEntryResult!7179)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722981 (= res!484622 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19579 a!3186) j!159) mask!3328) (select (arr!19579 a!3186) j!159) a!3186 mask!3328) lt!320512))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!722981 (= lt!320512 (Intermediate!7179 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!722982 () Bool)

(declare-fun res!484625 () Bool)

(declare-fun e!405123 () Bool)

(assert (=> b!722982 (=> (not res!484625) (not e!405123))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722982 (= res!484625 (validKeyInArray!0 (select (arr!19579 a!3186) j!159)))))

(declare-fun b!722983 () Bool)

(declare-fun res!484620 () Bool)

(assert (=> b!722983 (=> (not res!484620) (not e!405123))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40913 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722983 (= res!484620 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun e!405121 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!722984 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40913 (_ BitVec 32)) SeekEntryResult!7179)

(assert (=> b!722984 (= e!405121 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19579 a!3186) j!159) a!3186 mask!3328) (Found!7179 j!159)))))

(declare-fun b!722985 () Bool)

(assert (=> b!722985 (= e!405122 false)))

(declare-fun lt!320511 () (_ BitVec 64))

(declare-fun lt!320516 () SeekEntryResult!7179)

(declare-fun lt!320513 () array!40913)

(assert (=> b!722985 (= lt!320516 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320511 lt!320513 mask!3328))))

(declare-fun lt!320515 () SeekEntryResult!7179)

(assert (=> b!722985 (= lt!320515 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320511 mask!3328) lt!320511 lt!320513 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!722985 (= lt!320511 (select (store (arr!19579 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!722985 (= lt!320513 (array!40914 (store (arr!19579 a!3186) i!1173 k0!2102) (size!20000 a!3186)))))

(declare-fun b!722986 () Bool)

(declare-fun res!484615 () Bool)

(assert (=> b!722986 (=> (not res!484615) (not e!405123))))

(assert (=> b!722986 (= res!484615 (validKeyInArray!0 k0!2102))))

(declare-fun b!722987 () Bool)

(declare-fun res!484617 () Bool)

(assert (=> b!722987 (=> (not res!484617) (not e!405125))))

(declare-datatypes ((List!13581 0))(
  ( (Nil!13578) (Cons!13577 (h!14631 (_ BitVec 64)) (t!19896 List!13581)) )
))
(declare-fun arrayNoDuplicates!0 (array!40913 (_ BitVec 32) List!13581) Bool)

(assert (=> b!722987 (= res!484617 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13578))))

(declare-fun b!722988 () Bool)

(assert (=> b!722988 (= e!405123 e!405125)))

(declare-fun res!484621 () Bool)

(assert (=> b!722988 (=> (not res!484621) (not e!405125))))

(declare-fun lt!320514 () SeekEntryResult!7179)

(assert (=> b!722988 (= res!484621 (or (= lt!320514 (MissingZero!7179 i!1173)) (= lt!320514 (MissingVacant!7179 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40913 (_ BitVec 32)) SeekEntryResult!7179)

(assert (=> b!722988 (= lt!320514 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!722989 () Bool)

(declare-fun res!484618 () Bool)

(assert (=> b!722989 (=> (not res!484618) (not e!405123))))

(assert (=> b!722989 (= res!484618 (and (= (size!20000 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20000 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20000 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!722991 () Bool)

(declare-fun res!484614 () Bool)

(assert (=> b!722991 (=> (not res!484614) (not e!405125))))

(assert (=> b!722991 (= res!484614 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20000 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20000 a!3186))))))

(declare-fun b!722992 () Bool)

(declare-fun res!484616 () Bool)

(assert (=> b!722992 (=> (not res!484616) (not e!405125))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40913 (_ BitVec 32)) Bool)

(assert (=> b!722992 (= res!484616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!484623 () Bool)

(assert (=> start!64332 (=> (not res!484623) (not e!405123))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64332 (= res!484623 (validMask!0 mask!3328))))

(assert (=> start!64332 e!405123))

(assert (=> start!64332 true))

(declare-fun array_inv!15375 (array!40913) Bool)

(assert (=> start!64332 (array_inv!15375 a!3186)))

(declare-fun b!722990 () Bool)

(declare-fun res!484624 () Bool)

(assert (=> b!722990 (=> (not res!484624) (not e!405122))))

(assert (=> b!722990 (= res!484624 e!405121)))

(declare-fun c!79555 () Bool)

(assert (=> b!722990 (= c!79555 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!722993 () Bool)

(assert (=> b!722993 (= e!405121 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19579 a!3186) j!159) a!3186 mask!3328) lt!320512))))

(declare-fun b!722994 () Bool)

(declare-fun res!484619 () Bool)

(assert (=> b!722994 (=> (not res!484619) (not e!405122))))

(assert (=> b!722994 (= res!484619 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19579 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!64332 res!484623) b!722989))

(assert (= (and b!722989 res!484618) b!722982))

(assert (= (and b!722982 res!484625) b!722986))

(assert (= (and b!722986 res!484615) b!722983))

(assert (= (and b!722983 res!484620) b!722988))

(assert (= (and b!722988 res!484621) b!722992))

(assert (= (and b!722992 res!484616) b!722987))

(assert (= (and b!722987 res!484617) b!722991))

(assert (= (and b!722991 res!484614) b!722981))

(assert (= (and b!722981 res!484622) b!722994))

(assert (= (and b!722994 res!484619) b!722990))

(assert (= (and b!722990 c!79555) b!722993))

(assert (= (and b!722990 (not c!79555)) b!722984))

(assert (= (and b!722990 res!484624) b!722985))

(declare-fun m!677457 () Bool)

(assert (=> b!722986 m!677457))

(declare-fun m!677459 () Bool)

(assert (=> b!722985 m!677459))

(declare-fun m!677461 () Bool)

(assert (=> b!722985 m!677461))

(declare-fun m!677463 () Bool)

(assert (=> b!722985 m!677463))

(declare-fun m!677465 () Bool)

(assert (=> b!722985 m!677465))

(assert (=> b!722985 m!677459))

(declare-fun m!677467 () Bool)

(assert (=> b!722985 m!677467))

(declare-fun m!677469 () Bool)

(assert (=> b!722983 m!677469))

(declare-fun m!677471 () Bool)

(assert (=> start!64332 m!677471))

(declare-fun m!677473 () Bool)

(assert (=> start!64332 m!677473))

(declare-fun m!677475 () Bool)

(assert (=> b!722993 m!677475))

(assert (=> b!722993 m!677475))

(declare-fun m!677477 () Bool)

(assert (=> b!722993 m!677477))

(assert (=> b!722981 m!677475))

(assert (=> b!722981 m!677475))

(declare-fun m!677479 () Bool)

(assert (=> b!722981 m!677479))

(assert (=> b!722981 m!677479))

(assert (=> b!722981 m!677475))

(declare-fun m!677481 () Bool)

(assert (=> b!722981 m!677481))

(assert (=> b!722982 m!677475))

(assert (=> b!722982 m!677475))

(declare-fun m!677483 () Bool)

(assert (=> b!722982 m!677483))

(declare-fun m!677485 () Bool)

(assert (=> b!722987 m!677485))

(declare-fun m!677487 () Bool)

(assert (=> b!722994 m!677487))

(declare-fun m!677489 () Bool)

(assert (=> b!722988 m!677489))

(assert (=> b!722984 m!677475))

(assert (=> b!722984 m!677475))

(declare-fun m!677491 () Bool)

(assert (=> b!722984 m!677491))

(declare-fun m!677493 () Bool)

(assert (=> b!722992 m!677493))

(check-sat (not b!722992) (not b!722993) (not b!722986) (not b!722987) (not b!722982) (not b!722983) (not b!722988) (not b!722981) (not b!722985) (not start!64332) (not b!722984))
(check-sat)
