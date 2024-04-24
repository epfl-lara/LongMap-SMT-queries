; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67486 () Bool)

(assert start!67486)

(declare-fun b!779981 () Bool)

(declare-fun res!527576 () Bool)

(declare-fun e!433974 () Bool)

(assert (=> b!779981 (=> (not res!527576) (not e!433974))))

(declare-fun e!433975 () Bool)

(assert (=> b!779981 (= res!527576 e!433975)))

(declare-fun c!86609 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!779981 (= c!86609 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!779982 () Bool)

(declare-fun res!527575 () Bool)

(declare-fun e!433972 () Bool)

(assert (=> b!779982 (=> (not res!527575) (not e!433972))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!779982 (= res!527575 (validKeyInArray!0 k0!2102))))

(declare-fun b!779983 () Bool)

(declare-fun res!527581 () Bool)

(assert (=> b!779983 (=> (not res!527581) (not e!433974))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42595 0))(
  ( (array!42596 (arr!20386 (Array (_ BitVec 32) (_ BitVec 64))) (size!20806 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42595)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!779983 (= res!527581 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20386 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!527580 () Bool)

(assert (=> start!67486 (=> (not res!527580) (not e!433972))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67486 (= res!527580 (validMask!0 mask!3328))))

(assert (=> start!67486 e!433972))

(assert (=> start!67486 true))

(declare-fun array_inv!16245 (array!42595) Bool)

(assert (=> start!67486 (array_inv!16245 a!3186)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7942 0))(
  ( (MissingZero!7942 (index!34136 (_ BitVec 32))) (Found!7942 (index!34137 (_ BitVec 32))) (Intermediate!7942 (undefined!8754 Bool) (index!34138 (_ BitVec 32)) (x!65242 (_ BitVec 32))) (Undefined!7942) (MissingVacant!7942 (index!34139 (_ BitVec 32))) )
))
(declare-fun lt!347519 () SeekEntryResult!7942)

(declare-fun b!779984 () Bool)

(declare-fun lt!347521 () SeekEntryResult!7942)

(declare-fun lt!347514 () (_ BitVec 64))

(declare-fun lt!347515 () SeekEntryResult!7942)

(declare-fun e!433976 () Bool)

(assert (=> b!779984 (= e!433976 (or (not (= lt!347515 lt!347519)) (= (select (store (arr!20386 a!3186) i!1173 k0!2102) index!1321) lt!347514) (not (= (select (store (arr!20386 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!347521 lt!347515)))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42595 (_ BitVec 32)) SeekEntryResult!7942)

(assert (=> b!779984 (= lt!347515 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20386 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!779985 () Bool)

(declare-fun res!527583 () Bool)

(declare-fun e!433977 () Bool)

(assert (=> b!779985 (=> (not res!527583) (not e!433977))))

(assert (=> b!779985 (= res!527583 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20806 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20806 a!3186))))))

(declare-fun b!779986 () Bool)

(declare-fun lt!347518 () SeekEntryResult!7942)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42595 (_ BitVec 32)) SeekEntryResult!7942)

(assert (=> b!779986 (= e!433975 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20386 a!3186) j!159) a!3186 mask!3328) lt!347518))))

(declare-fun b!779987 () Bool)

(declare-fun res!527587 () Bool)

(assert (=> b!779987 (=> (not res!527587) (not e!433977))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42595 (_ BitVec 32)) Bool)

(assert (=> b!779987 (= res!527587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!779988 () Bool)

(assert (=> b!779988 (= e!433975 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20386 a!3186) j!159) a!3186 mask!3328) (Found!7942 j!159)))))

(declare-fun b!779989 () Bool)

(declare-fun res!527582 () Bool)

(assert (=> b!779989 (=> (not res!527582) (not e!433977))))

(declare-datatypes ((List!14295 0))(
  ( (Nil!14292) (Cons!14291 (h!15411 (_ BitVec 64)) (t!20602 List!14295)) )
))
(declare-fun arrayNoDuplicates!0 (array!42595 (_ BitVec 32) List!14295) Bool)

(assert (=> b!779989 (= res!527582 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14292))))

(declare-fun b!779990 () Bool)

(declare-fun res!527586 () Bool)

(assert (=> b!779990 (=> (not res!527586) (not e!433972))))

(declare-fun arrayContainsKey!0 (array!42595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!779990 (= res!527586 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!779991 () Bool)

(declare-fun res!527584 () Bool)

(assert (=> b!779991 (=> (not res!527584) (not e!433972))))

(assert (=> b!779991 (= res!527584 (and (= (size!20806 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20806 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20806 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!779992 () Bool)

(assert (=> b!779992 (= e!433972 e!433977)))

(declare-fun res!527577 () Bool)

(assert (=> b!779992 (=> (not res!527577) (not e!433977))))

(declare-fun lt!347517 () SeekEntryResult!7942)

(assert (=> b!779992 (= res!527577 (or (= lt!347517 (MissingZero!7942 i!1173)) (= lt!347517 (MissingVacant!7942 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42595 (_ BitVec 32)) SeekEntryResult!7942)

(assert (=> b!779992 (= lt!347517 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!779993 () Bool)

(declare-fun e!433978 () Bool)

(assert (=> b!779993 (= e!433974 e!433978)))

(declare-fun res!527585 () Bool)

(assert (=> b!779993 (=> (not res!527585) (not e!433978))))

(declare-fun lt!347516 () SeekEntryResult!7942)

(declare-fun lt!347512 () SeekEntryResult!7942)

(assert (=> b!779993 (= res!527585 (= lt!347516 lt!347512))))

(declare-fun lt!347513 () array!42595)

(assert (=> b!779993 (= lt!347512 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347514 lt!347513 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!779993 (= lt!347516 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347514 mask!3328) lt!347514 lt!347513 mask!3328))))

(assert (=> b!779993 (= lt!347514 (select (store (arr!20386 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!779993 (= lt!347513 (array!42596 (store (arr!20386 a!3186) i!1173 k0!2102) (size!20806 a!3186)))))

(declare-fun b!779994 () Bool)

(assert (=> b!779994 (= e!433977 e!433974)))

(declare-fun res!527589 () Bool)

(assert (=> b!779994 (=> (not res!527589) (not e!433974))))

(assert (=> b!779994 (= res!527589 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20386 a!3186) j!159) mask!3328) (select (arr!20386 a!3186) j!159) a!3186 mask!3328) lt!347518))))

(assert (=> b!779994 (= lt!347518 (Intermediate!7942 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!779995 () Bool)

(declare-fun e!433971 () Bool)

(assert (=> b!779995 (= e!433971 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20386 a!3186) j!159) a!3186 mask!3328) lt!347519))))

(declare-fun b!779996 () Bool)

(declare-fun res!527579 () Bool)

(assert (=> b!779996 (=> (not res!527579) (not e!433972))))

(assert (=> b!779996 (= res!527579 (validKeyInArray!0 (select (arr!20386 a!3186) j!159)))))

(declare-fun b!779997 () Bool)

(assert (=> b!779997 (= e!433978 (not e!433976))))

(declare-fun res!527588 () Bool)

(assert (=> b!779997 (=> res!527588 e!433976)))

(get-info :version)

(assert (=> b!779997 (= res!527588 (or (not ((_ is Intermediate!7942) lt!347512)) (bvslt x!1131 (x!65242 lt!347512)) (not (= x!1131 (x!65242 lt!347512))) (not (= index!1321 (index!34138 lt!347512)))))))

(assert (=> b!779997 e!433971))

(declare-fun res!527578 () Bool)

(assert (=> b!779997 (=> (not res!527578) (not e!433971))))

(assert (=> b!779997 (= res!527578 (= lt!347521 lt!347519))))

(assert (=> b!779997 (= lt!347519 (Found!7942 j!159))))

(assert (=> b!779997 (= lt!347521 (seekEntryOrOpen!0 (select (arr!20386 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!779997 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26857 0))(
  ( (Unit!26858) )
))
(declare-fun lt!347520 () Unit!26857)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42595 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26857)

(assert (=> b!779997 (= lt!347520 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!67486 res!527580) b!779991))

(assert (= (and b!779991 res!527584) b!779996))

(assert (= (and b!779996 res!527579) b!779982))

(assert (= (and b!779982 res!527575) b!779990))

(assert (= (and b!779990 res!527586) b!779992))

(assert (= (and b!779992 res!527577) b!779987))

(assert (= (and b!779987 res!527587) b!779989))

(assert (= (and b!779989 res!527582) b!779985))

(assert (= (and b!779985 res!527583) b!779994))

(assert (= (and b!779994 res!527589) b!779983))

(assert (= (and b!779983 res!527581) b!779981))

(assert (= (and b!779981 c!86609) b!779986))

(assert (= (and b!779981 (not c!86609)) b!779988))

(assert (= (and b!779981 res!527576) b!779993))

(assert (= (and b!779993 res!527585) b!779997))

(assert (= (and b!779997 res!527578) b!779995))

(assert (= (and b!779997 (not res!527588)) b!779984))

(declare-fun m!723917 () Bool)

(assert (=> b!779984 m!723917))

(declare-fun m!723919 () Bool)

(assert (=> b!779984 m!723919))

(declare-fun m!723921 () Bool)

(assert (=> b!779984 m!723921))

(assert (=> b!779984 m!723921))

(declare-fun m!723923 () Bool)

(assert (=> b!779984 m!723923))

(declare-fun m!723925 () Bool)

(assert (=> b!779983 m!723925))

(assert (=> b!779996 m!723921))

(assert (=> b!779996 m!723921))

(declare-fun m!723927 () Bool)

(assert (=> b!779996 m!723927))

(assert (=> b!779986 m!723921))

(assert (=> b!779986 m!723921))

(declare-fun m!723929 () Bool)

(assert (=> b!779986 m!723929))

(declare-fun m!723931 () Bool)

(assert (=> start!67486 m!723931))

(declare-fun m!723933 () Bool)

(assert (=> start!67486 m!723933))

(declare-fun m!723935 () Bool)

(assert (=> b!779992 m!723935))

(declare-fun m!723937 () Bool)

(assert (=> b!779987 m!723937))

(assert (=> b!779988 m!723921))

(assert (=> b!779988 m!723921))

(assert (=> b!779988 m!723923))

(declare-fun m!723939 () Bool)

(assert (=> b!779982 m!723939))

(declare-fun m!723941 () Bool)

(assert (=> b!779993 m!723941))

(declare-fun m!723943 () Bool)

(assert (=> b!779993 m!723943))

(declare-fun m!723945 () Bool)

(assert (=> b!779993 m!723945))

(assert (=> b!779993 m!723943))

(assert (=> b!779993 m!723917))

(declare-fun m!723947 () Bool)

(assert (=> b!779993 m!723947))

(assert (=> b!779995 m!723921))

(assert (=> b!779995 m!723921))

(declare-fun m!723949 () Bool)

(assert (=> b!779995 m!723949))

(declare-fun m!723951 () Bool)

(assert (=> b!779989 m!723951))

(declare-fun m!723953 () Bool)

(assert (=> b!779990 m!723953))

(assert (=> b!779994 m!723921))

(assert (=> b!779994 m!723921))

(declare-fun m!723955 () Bool)

(assert (=> b!779994 m!723955))

(assert (=> b!779994 m!723955))

(assert (=> b!779994 m!723921))

(declare-fun m!723957 () Bool)

(assert (=> b!779994 m!723957))

(assert (=> b!779997 m!723921))

(assert (=> b!779997 m!723921))

(declare-fun m!723959 () Bool)

(assert (=> b!779997 m!723959))

(declare-fun m!723961 () Bool)

(assert (=> b!779997 m!723961))

(declare-fun m!723963 () Bool)

(assert (=> b!779997 m!723963))

(check-sat (not b!779993) (not b!779997) (not b!779982) (not b!779992) (not b!779994) (not b!779988) (not start!67486) (not b!779989) (not b!779987) (not b!779995) (not b!779996) (not b!779984) (not b!779986) (not b!779990))
(check-sat)
