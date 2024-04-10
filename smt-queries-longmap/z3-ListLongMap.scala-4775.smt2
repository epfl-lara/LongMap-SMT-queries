; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65712 () Bool)

(assert start!65712)

(declare-fun e!420515 () Bool)

(declare-datatypes ((array!41885 0))(
  ( (array!41886 (arr!20056 (Array (_ BitVec 32) (_ BitVec 64))) (size!20477 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41885)

(declare-fun b!753977 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7656 0))(
  ( (MissingZero!7656 (index!32992 (_ BitVec 32))) (Found!7656 (index!32993 (_ BitVec 32))) (Intermediate!7656 (undefined!8468 Bool) (index!32994 (_ BitVec 32)) (x!63902 (_ BitVec 32))) (Undefined!7656) (MissingVacant!7656 (index!32995 (_ BitVec 32))) )
))
(declare-fun lt!335512 () SeekEntryResult!7656)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41885 (_ BitVec 32)) SeekEntryResult!7656)

(assert (=> b!753977 (= e!420515 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20056 a!3186) j!159) a!3186 mask!3328) lt!335512))))

(declare-fun b!753978 () Bool)

(declare-fun res!509413 () Bool)

(declare-fun e!420520 () Bool)

(assert (=> b!753978 (=> (not res!509413) (not e!420520))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!753978 (= res!509413 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20477 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20477 a!3186))))))

(declare-fun lt!335507 () SeekEntryResult!7656)

(declare-fun b!753979 () Bool)

(declare-fun e!420519 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41885 (_ BitVec 32)) SeekEntryResult!7656)

(assert (=> b!753979 (= e!420519 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20056 a!3186) j!159) a!3186 mask!3328) lt!335507))))

(declare-fun b!753980 () Bool)

(declare-fun res!509421 () Bool)

(declare-fun e!420511 () Bool)

(assert (=> b!753980 (=> (not res!509421) (not e!420511))))

(declare-fun lt!335506 () array!41885)

(declare-fun lt!335513 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41885 (_ BitVec 32)) SeekEntryResult!7656)

(assert (=> b!753980 (= res!509421 (= (seekEntryOrOpen!0 lt!335513 lt!335506 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335513 lt!335506 mask!3328)))))

(declare-fun b!753981 () Bool)

(declare-fun e!420517 () Bool)

(assert (=> b!753981 (= e!420520 e!420517)))

(declare-fun res!509414 () Bool)

(assert (=> b!753981 (=> (not res!509414) (not e!420517))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!753981 (= res!509414 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20056 a!3186) j!159) mask!3328) (select (arr!20056 a!3186) j!159) a!3186 mask!3328) lt!335512))))

(assert (=> b!753981 (= lt!335512 (Intermediate!7656 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!753982 () Bool)

(declare-datatypes ((Unit!26004 0))(
  ( (Unit!26005) )
))
(declare-fun e!420514 () Unit!26004)

(declare-fun Unit!26006 () Unit!26004)

(assert (=> b!753982 (= e!420514 Unit!26006)))

(assert (=> b!753982 false))

(declare-fun b!753983 () Bool)

(declare-fun res!509410 () Bool)

(assert (=> b!753983 (=> (not res!509410) (not e!420520))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41885 (_ BitVec 32)) Bool)

(assert (=> b!753983 (= res!509410 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!753984 () Bool)

(declare-fun e!420512 () Bool)

(declare-fun e!420518 () Bool)

(assert (=> b!753984 (= e!420512 e!420518)))

(declare-fun res!509409 () Bool)

(assert (=> b!753984 (=> res!509409 e!420518)))

(declare-fun lt!335503 () (_ BitVec 64))

(assert (=> b!753984 (= res!509409 (= lt!335503 lt!335513))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!753984 (= lt!335503 (select (store (arr!20056 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!753985 () Bool)

(declare-fun res!509426 () Bool)

(assert (=> b!753985 (=> (not res!509426) (not e!420520))))

(declare-datatypes ((List!14058 0))(
  ( (Nil!14055) (Cons!14054 (h!15126 (_ BitVec 64)) (t!20373 List!14058)) )
))
(declare-fun arrayNoDuplicates!0 (array!41885 (_ BitVec 32) List!14058) Bool)

(assert (=> b!753985 (= res!509426 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14055))))

(declare-fun b!753986 () Bool)

(assert (=> b!753986 (= e!420518 true)))

(assert (=> b!753986 e!420511))

(declare-fun res!509420 () Bool)

(assert (=> b!753986 (=> (not res!509420) (not e!420511))))

(assert (=> b!753986 (= res!509420 (= lt!335503 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!335510 () Unit!26004)

(assert (=> b!753986 (= lt!335510 e!420514)))

(declare-fun c!82665 () Bool)

(assert (=> b!753986 (= c!82665 (= lt!335503 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!753987 () Bool)

(declare-fun res!509416 () Bool)

(declare-fun e!420516 () Bool)

(assert (=> b!753987 (=> (not res!509416) (not e!420516))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!753987 (= res!509416 (validKeyInArray!0 k0!2102))))

(declare-fun b!753988 () Bool)

(declare-fun res!509424 () Bool)

(assert (=> b!753988 (=> (not res!509424) (not e!420516))))

(declare-fun arrayContainsKey!0 (array!41885 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!753988 (= res!509424 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!753989 () Bool)

(declare-fun res!509415 () Bool)

(assert (=> b!753989 (=> (not res!509415) (not e!420516))))

(assert (=> b!753989 (= res!509415 (and (= (size!20477 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20477 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20477 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!753990 () Bool)

(declare-fun e!420510 () Bool)

(assert (=> b!753990 (= e!420510 e!420512)))

(declare-fun res!509408 () Bool)

(assert (=> b!753990 (=> res!509408 e!420512)))

(declare-fun lt!335509 () SeekEntryResult!7656)

(assert (=> b!753990 (= res!509408 (not (= lt!335509 lt!335507)))))

(assert (=> b!753990 (= lt!335509 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20056 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!753991 () Bool)

(declare-fun e!420521 () Bool)

(assert (=> b!753991 (= e!420521 (not e!420510))))

(declare-fun res!509418 () Bool)

(assert (=> b!753991 (=> res!509418 e!420510)))

(declare-fun lt!335508 () SeekEntryResult!7656)

(get-info :version)

(assert (=> b!753991 (= res!509418 (or (not ((_ is Intermediate!7656) lt!335508)) (bvslt x!1131 (x!63902 lt!335508)) (not (= x!1131 (x!63902 lt!335508))) (not (= index!1321 (index!32994 lt!335508)))))))

(assert (=> b!753991 e!420519))

(declare-fun res!509411 () Bool)

(assert (=> b!753991 (=> (not res!509411) (not e!420519))))

(declare-fun lt!335504 () SeekEntryResult!7656)

(assert (=> b!753991 (= res!509411 (= lt!335504 lt!335507))))

(assert (=> b!753991 (= lt!335507 (Found!7656 j!159))))

(assert (=> b!753991 (= lt!335504 (seekEntryOrOpen!0 (select (arr!20056 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!753991 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!335511 () Unit!26004)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41885 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26004)

(assert (=> b!753991 (= lt!335511 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!753992 () Bool)

(assert (=> b!753992 (= e!420516 e!420520)))

(declare-fun res!509419 () Bool)

(assert (=> b!753992 (=> (not res!509419) (not e!420520))))

(declare-fun lt!335502 () SeekEntryResult!7656)

(assert (=> b!753992 (= res!509419 (or (= lt!335502 (MissingZero!7656 i!1173)) (= lt!335502 (MissingVacant!7656 i!1173))))))

(assert (=> b!753992 (= lt!335502 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!753993 () Bool)

(declare-fun res!509425 () Bool)

(assert (=> b!753993 (=> (not res!509425) (not e!420517))))

(assert (=> b!753993 (= res!509425 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20056 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!753994 () Bool)

(declare-fun res!509412 () Bool)

(assert (=> b!753994 (=> (not res!509412) (not e!420516))))

(assert (=> b!753994 (= res!509412 (validKeyInArray!0 (select (arr!20056 a!3186) j!159)))))

(declare-fun b!753995 () Bool)

(declare-fun res!509417 () Bool)

(assert (=> b!753995 (=> (not res!509417) (not e!420517))))

(assert (=> b!753995 (= res!509417 e!420515)))

(declare-fun c!82666 () Bool)

(assert (=> b!753995 (= c!82666 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!753996 () Bool)

(assert (=> b!753996 (= e!420515 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20056 a!3186) j!159) a!3186 mask!3328) (Found!7656 j!159)))))

(declare-fun b!753997 () Bool)

(assert (=> b!753997 (= e!420517 e!420521)))

(declare-fun res!509423 () Bool)

(assert (=> b!753997 (=> (not res!509423) (not e!420521))))

(declare-fun lt!335505 () SeekEntryResult!7656)

(assert (=> b!753997 (= res!509423 (= lt!335505 lt!335508))))

(assert (=> b!753997 (= lt!335508 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335513 lt!335506 mask!3328))))

(assert (=> b!753997 (= lt!335505 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335513 mask!3328) lt!335513 lt!335506 mask!3328))))

(assert (=> b!753997 (= lt!335513 (select (store (arr!20056 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!753997 (= lt!335506 (array!41886 (store (arr!20056 a!3186) i!1173 k0!2102) (size!20477 a!3186)))))

(declare-fun b!753998 () Bool)

(assert (=> b!753998 (= e!420511 (= lt!335504 lt!335509))))

(declare-fun res!509422 () Bool)

(assert (=> start!65712 (=> (not res!509422) (not e!420516))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65712 (= res!509422 (validMask!0 mask!3328))))

(assert (=> start!65712 e!420516))

(assert (=> start!65712 true))

(declare-fun array_inv!15852 (array!41885) Bool)

(assert (=> start!65712 (array_inv!15852 a!3186)))

(declare-fun b!753999 () Bool)

(declare-fun Unit!26007 () Unit!26004)

(assert (=> b!753999 (= e!420514 Unit!26007)))

(assert (= (and start!65712 res!509422) b!753989))

(assert (= (and b!753989 res!509415) b!753994))

(assert (= (and b!753994 res!509412) b!753987))

(assert (= (and b!753987 res!509416) b!753988))

(assert (= (and b!753988 res!509424) b!753992))

(assert (= (and b!753992 res!509419) b!753983))

(assert (= (and b!753983 res!509410) b!753985))

(assert (= (and b!753985 res!509426) b!753978))

(assert (= (and b!753978 res!509413) b!753981))

(assert (= (and b!753981 res!509414) b!753993))

(assert (= (and b!753993 res!509425) b!753995))

(assert (= (and b!753995 c!82666) b!753977))

(assert (= (and b!753995 (not c!82666)) b!753996))

(assert (= (and b!753995 res!509417) b!753997))

(assert (= (and b!753997 res!509423) b!753991))

(assert (= (and b!753991 res!509411) b!753979))

(assert (= (and b!753991 (not res!509418)) b!753990))

(assert (= (and b!753990 (not res!509408)) b!753984))

(assert (= (and b!753984 (not res!509409)) b!753986))

(assert (= (and b!753986 c!82665) b!753982))

(assert (= (and b!753986 (not c!82665)) b!753999))

(assert (= (and b!753986 res!509420) b!753980))

(assert (= (and b!753980 res!509421) b!753998))

(declare-fun m!702539 () Bool)

(assert (=> b!753993 m!702539))

(declare-fun m!702541 () Bool)

(assert (=> b!753981 m!702541))

(assert (=> b!753981 m!702541))

(declare-fun m!702543 () Bool)

(assert (=> b!753981 m!702543))

(assert (=> b!753981 m!702543))

(assert (=> b!753981 m!702541))

(declare-fun m!702545 () Bool)

(assert (=> b!753981 m!702545))

(assert (=> b!753990 m!702541))

(assert (=> b!753990 m!702541))

(declare-fun m!702547 () Bool)

(assert (=> b!753990 m!702547))

(assert (=> b!753996 m!702541))

(assert (=> b!753996 m!702541))

(assert (=> b!753996 m!702547))

(declare-fun m!702549 () Bool)

(assert (=> b!753985 m!702549))

(declare-fun m!702551 () Bool)

(assert (=> b!753984 m!702551))

(declare-fun m!702553 () Bool)

(assert (=> b!753984 m!702553))

(assert (=> b!753979 m!702541))

(assert (=> b!753979 m!702541))

(declare-fun m!702555 () Bool)

(assert (=> b!753979 m!702555))

(declare-fun m!702557 () Bool)

(assert (=> b!753983 m!702557))

(declare-fun m!702559 () Bool)

(assert (=> start!65712 m!702559))

(declare-fun m!702561 () Bool)

(assert (=> start!65712 m!702561))

(declare-fun m!702563 () Bool)

(assert (=> b!753988 m!702563))

(assert (=> b!753977 m!702541))

(assert (=> b!753977 m!702541))

(declare-fun m!702565 () Bool)

(assert (=> b!753977 m!702565))

(declare-fun m!702567 () Bool)

(assert (=> b!753980 m!702567))

(declare-fun m!702569 () Bool)

(assert (=> b!753980 m!702569))

(declare-fun m!702571 () Bool)

(assert (=> b!753987 m!702571))

(assert (=> b!753991 m!702541))

(assert (=> b!753991 m!702541))

(declare-fun m!702573 () Bool)

(assert (=> b!753991 m!702573))

(declare-fun m!702575 () Bool)

(assert (=> b!753991 m!702575))

(declare-fun m!702577 () Bool)

(assert (=> b!753991 m!702577))

(assert (=> b!753994 m!702541))

(assert (=> b!753994 m!702541))

(declare-fun m!702579 () Bool)

(assert (=> b!753994 m!702579))

(declare-fun m!702581 () Bool)

(assert (=> b!753997 m!702581))

(assert (=> b!753997 m!702551))

(declare-fun m!702583 () Bool)

(assert (=> b!753997 m!702583))

(declare-fun m!702585 () Bool)

(assert (=> b!753997 m!702585))

(assert (=> b!753997 m!702585))

(declare-fun m!702587 () Bool)

(assert (=> b!753997 m!702587))

(declare-fun m!702589 () Bool)

(assert (=> b!753992 m!702589))

(check-sat (not b!753979) (not b!753985) (not b!753991) (not b!753990) (not b!753981) (not b!753987) (not b!753996) (not b!753992) (not b!753983) (not start!65712) (not b!753977) (not b!753997) (not b!753994) (not b!753980) (not b!753988))
(check-sat)
