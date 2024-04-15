; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67436 () Bool)

(assert start!67436)

(declare-fun b!780150 () Bool)

(declare-fun res!527896 () Bool)

(declare-fun e!433973 () Bool)

(assert (=> b!780150 (=> (not res!527896) (not e!433973))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42621 0))(
  ( (array!42622 (arr!20402 (Array (_ BitVec 32) (_ BitVec 64))) (size!20823 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42621)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!780150 (= res!527896 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20823 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20823 a!3186))))))

(declare-fun b!780151 () Bool)

(declare-fun res!527894 () Bool)

(declare-fun e!433976 () Bool)

(assert (=> b!780151 (=> (not res!527894) (not e!433976))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!780151 (= res!527894 (validKeyInArray!0 (select (arr!20402 a!3186) j!159)))))

(declare-fun b!780152 () Bool)

(declare-datatypes ((Unit!26864 0))(
  ( (Unit!26865) )
))
(declare-fun e!433978 () Unit!26864)

(declare-fun Unit!26866 () Unit!26864)

(assert (=> b!780152 (= e!433978 Unit!26866)))

(declare-fun b!780153 () Bool)

(declare-fun e!433975 () Bool)

(declare-fun e!433971 () Bool)

(assert (=> b!780153 (= e!433975 (not e!433971))))

(declare-fun res!527902 () Bool)

(assert (=> b!780153 (=> res!527902 e!433971)))

(declare-datatypes ((SeekEntryResult!7999 0))(
  ( (MissingZero!7999 (index!34364 (_ BitVec 32))) (Found!7999 (index!34365 (_ BitVec 32))) (Intermediate!7999 (undefined!8811 Bool) (index!34366 (_ BitVec 32)) (x!65324 (_ BitVec 32))) (Undefined!7999) (MissingVacant!7999 (index!34367 (_ BitVec 32))) )
))
(declare-fun lt!347527 () SeekEntryResult!7999)

(get-info :version)

(assert (=> b!780153 (= res!527902 (or (not ((_ is Intermediate!7999) lt!347527)) (bvslt x!1131 (x!65324 lt!347527)) (not (= x!1131 (x!65324 lt!347527))) (not (= index!1321 (index!34366 lt!347527)))))))

(declare-fun e!433977 () Bool)

(assert (=> b!780153 e!433977))

(declare-fun res!527891 () Bool)

(assert (=> b!780153 (=> (not res!527891) (not e!433977))))

(declare-fun lt!347531 () SeekEntryResult!7999)

(declare-fun lt!347534 () SeekEntryResult!7999)

(assert (=> b!780153 (= res!527891 (= lt!347531 lt!347534))))

(assert (=> b!780153 (= lt!347534 (Found!7999 j!159))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42621 (_ BitVec 32)) SeekEntryResult!7999)

(assert (=> b!780153 (= lt!347531 (seekEntryOrOpen!0 (select (arr!20402 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42621 (_ BitVec 32)) Bool)

(assert (=> b!780153 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!347525 () Unit!26864)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42621 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26864)

(assert (=> b!780153 (= lt!347525 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!780154 () Bool)

(declare-fun res!527904 () Bool)

(assert (=> b!780154 (=> (not res!527904) (not e!433976))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!780154 (= res!527904 (validKeyInArray!0 k0!2102))))

(declare-fun b!780155 () Bool)

(declare-fun Unit!26867 () Unit!26864)

(assert (=> b!780155 (= e!433978 Unit!26867)))

(assert (=> b!780155 false))

(declare-fun b!780156 () Bool)

(declare-fun res!527903 () Bool)

(assert (=> b!780156 (=> (not res!527903) (not e!433973))))

(assert (=> b!780156 (= res!527903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!780157 () Bool)

(declare-fun res!527897 () Bool)

(declare-fun e!433974 () Bool)

(assert (=> b!780157 (=> (not res!527897) (not e!433974))))

(declare-fun e!433970 () Bool)

(assert (=> b!780157 (= res!527897 e!433970)))

(declare-fun c!86535 () Bool)

(assert (=> b!780157 (= c!86535 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!780158 () Bool)

(assert (=> b!780158 (= e!433974 e!433975)))

(declare-fun res!527906 () Bool)

(assert (=> b!780158 (=> (not res!527906) (not e!433975))))

(declare-fun lt!347533 () SeekEntryResult!7999)

(assert (=> b!780158 (= res!527906 (= lt!347533 lt!347527))))

(declare-fun lt!347530 () array!42621)

(declare-fun lt!347532 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42621 (_ BitVec 32)) SeekEntryResult!7999)

(assert (=> b!780158 (= lt!347527 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347532 lt!347530 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!780158 (= lt!347533 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347532 mask!3328) lt!347532 lt!347530 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!780158 (= lt!347532 (select (store (arr!20402 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!780158 (= lt!347530 (array!42622 (store (arr!20402 a!3186) i!1173 k0!2102) (size!20823 a!3186)))))

(declare-fun b!780159 () Bool)

(assert (=> b!780159 (= e!433973 e!433974)))

(declare-fun res!527907 () Bool)

(assert (=> b!780159 (=> (not res!527907) (not e!433974))))

(declare-fun lt!347529 () SeekEntryResult!7999)

(assert (=> b!780159 (= res!527907 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20402 a!3186) j!159) mask!3328) (select (arr!20402 a!3186) j!159) a!3186 mask!3328) lt!347529))))

(assert (=> b!780159 (= lt!347529 (Intermediate!7999 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!780160 () Bool)

(declare-fun res!527900 () Bool)

(assert (=> b!780160 (=> (not res!527900) (not e!433976))))

(assert (=> b!780160 (= res!527900 (and (= (size!20823 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20823 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20823 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!780162 () Bool)

(declare-fun res!527898 () Bool)

(assert (=> b!780162 (=> (not res!527898) (not e!433974))))

(assert (=> b!780162 (= res!527898 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20402 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!780163 () Bool)

(assert (=> b!780163 (= e!433976 e!433973)))

(declare-fun res!527893 () Bool)

(assert (=> b!780163 (=> (not res!527893) (not e!433973))))

(declare-fun lt!347526 () SeekEntryResult!7999)

(assert (=> b!780163 (= res!527893 (or (= lt!347526 (MissingZero!7999 i!1173)) (= lt!347526 (MissingVacant!7999 i!1173))))))

(assert (=> b!780163 (= lt!347526 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!780164 () Bool)

(declare-fun res!527899 () Bool)

(assert (=> b!780164 (=> (not res!527899) (not e!433973))))

(declare-datatypes ((List!14443 0))(
  ( (Nil!14440) (Cons!14439 (h!15556 (_ BitVec 64)) (t!20749 List!14443)) )
))
(declare-fun arrayNoDuplicates!0 (array!42621 (_ BitVec 32) List!14443) Bool)

(assert (=> b!780164 (= res!527899 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14440))))

(declare-fun b!780165 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42621 (_ BitVec 32)) SeekEntryResult!7999)

(assert (=> b!780165 (= e!433977 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20402 a!3186) j!159) a!3186 mask!3328) lt!347534))))

(declare-fun b!780166 () Bool)

(assert (=> b!780166 (= e!433970 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20402 a!3186) j!159) a!3186 mask!3328) (Found!7999 j!159)))))

(declare-fun b!780167 () Bool)

(declare-fun res!527901 () Bool)

(assert (=> b!780167 (=> (not res!527901) (not e!433976))))

(declare-fun arrayContainsKey!0 (array!42621 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!780167 (= res!527901 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!780168 () Bool)

(declare-fun res!527905 () Bool)

(assert (=> b!780168 (=> res!527905 e!433971)))

(assert (=> b!780168 (= res!527905 (= (select (store (arr!20402 a!3186) i!1173 k0!2102) index!1321) lt!347532))))

(declare-fun b!780169 () Bool)

(declare-fun res!527892 () Bool)

(assert (=> b!780169 (=> res!527892 e!433971)))

(assert (=> b!780169 (= res!527892 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20402 a!3186) j!159) a!3186 mask!3328) lt!347534)))))

(declare-fun b!780170 () Bool)

(assert (=> b!780170 (= e!433970 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20402 a!3186) j!159) a!3186 mask!3328) lt!347529))))

(declare-fun b!780161 () Bool)

(assert (=> b!780161 (= e!433971 true)))

(declare-fun lt!347528 () Unit!26864)

(assert (=> b!780161 (= lt!347528 e!433978)))

(declare-fun c!86534 () Bool)

(assert (=> b!780161 (= c!86534 (= (select (store (arr!20402 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!527895 () Bool)

(assert (=> start!67436 (=> (not res!527895) (not e!433976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67436 (= res!527895 (validMask!0 mask!3328))))

(assert (=> start!67436 e!433976))

(assert (=> start!67436 true))

(declare-fun array_inv!16285 (array!42621) Bool)

(assert (=> start!67436 (array_inv!16285 a!3186)))

(assert (= (and start!67436 res!527895) b!780160))

(assert (= (and b!780160 res!527900) b!780151))

(assert (= (and b!780151 res!527894) b!780154))

(assert (= (and b!780154 res!527904) b!780167))

(assert (= (and b!780167 res!527901) b!780163))

(assert (= (and b!780163 res!527893) b!780156))

(assert (= (and b!780156 res!527903) b!780164))

(assert (= (and b!780164 res!527899) b!780150))

(assert (= (and b!780150 res!527896) b!780159))

(assert (= (and b!780159 res!527907) b!780162))

(assert (= (and b!780162 res!527898) b!780157))

(assert (= (and b!780157 c!86535) b!780170))

(assert (= (and b!780157 (not c!86535)) b!780166))

(assert (= (and b!780157 res!527897) b!780158))

(assert (= (and b!780158 res!527906) b!780153))

(assert (= (and b!780153 res!527891) b!780165))

(assert (= (and b!780153 (not res!527902)) b!780169))

(assert (= (and b!780169 (not res!527892)) b!780168))

(assert (= (and b!780168 (not res!527905)) b!780161))

(assert (= (and b!780161 c!86534) b!780155))

(assert (= (and b!780161 (not c!86534)) b!780152))

(declare-fun m!722955 () Bool)

(assert (=> b!780166 m!722955))

(assert (=> b!780166 m!722955))

(declare-fun m!722957 () Bool)

(assert (=> b!780166 m!722957))

(assert (=> b!780170 m!722955))

(assert (=> b!780170 m!722955))

(declare-fun m!722959 () Bool)

(assert (=> b!780170 m!722959))

(declare-fun m!722961 () Bool)

(assert (=> b!780163 m!722961))

(declare-fun m!722963 () Bool)

(assert (=> b!780158 m!722963))

(declare-fun m!722965 () Bool)

(assert (=> b!780158 m!722965))

(assert (=> b!780158 m!722965))

(declare-fun m!722967 () Bool)

(assert (=> b!780158 m!722967))

(declare-fun m!722969 () Bool)

(assert (=> b!780158 m!722969))

(declare-fun m!722971 () Bool)

(assert (=> b!780158 m!722971))

(assert (=> b!780161 m!722971))

(declare-fun m!722973 () Bool)

(assert (=> b!780161 m!722973))

(declare-fun m!722975 () Bool)

(assert (=> b!780167 m!722975))

(assert (=> b!780153 m!722955))

(assert (=> b!780153 m!722955))

(declare-fun m!722977 () Bool)

(assert (=> b!780153 m!722977))

(declare-fun m!722979 () Bool)

(assert (=> b!780153 m!722979))

(declare-fun m!722981 () Bool)

(assert (=> b!780153 m!722981))

(declare-fun m!722983 () Bool)

(assert (=> b!780162 m!722983))

(assert (=> b!780165 m!722955))

(assert (=> b!780165 m!722955))

(declare-fun m!722985 () Bool)

(assert (=> b!780165 m!722985))

(declare-fun m!722987 () Bool)

(assert (=> b!780156 m!722987))

(assert (=> b!780159 m!722955))

(assert (=> b!780159 m!722955))

(declare-fun m!722989 () Bool)

(assert (=> b!780159 m!722989))

(assert (=> b!780159 m!722989))

(assert (=> b!780159 m!722955))

(declare-fun m!722991 () Bool)

(assert (=> b!780159 m!722991))

(assert (=> b!780168 m!722971))

(assert (=> b!780168 m!722973))

(assert (=> b!780169 m!722955))

(assert (=> b!780169 m!722955))

(assert (=> b!780169 m!722957))

(declare-fun m!722993 () Bool)

(assert (=> b!780154 m!722993))

(assert (=> b!780151 m!722955))

(assert (=> b!780151 m!722955))

(declare-fun m!722995 () Bool)

(assert (=> b!780151 m!722995))

(declare-fun m!722997 () Bool)

(assert (=> start!67436 m!722997))

(declare-fun m!722999 () Bool)

(assert (=> start!67436 m!722999))

(declare-fun m!723001 () Bool)

(assert (=> b!780164 m!723001))

(check-sat (not b!780154) (not b!780159) (not b!780170) (not start!67436) (not b!780151) (not b!780167) (not b!780166) (not b!780158) (not b!780169) (not b!780165) (not b!780163) (not b!780156) (not b!780164) (not b!780153))
(check-sat)
