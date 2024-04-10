; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65528 () Bool)

(assert start!65528)

(declare-fun b!747856 () Bool)

(declare-fun e!417497 () Bool)

(declare-fun e!417492 () Bool)

(assert (=> b!747856 (= e!417497 (not e!417492))))

(declare-fun res!504402 () Bool)

(assert (=> b!747856 (=> res!504402 e!417492)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7564 0))(
  ( (MissingZero!7564 (index!32624 (_ BitVec 32))) (Found!7564 (index!32625 (_ BitVec 32))) (Intermediate!7564 (undefined!8376 Bool) (index!32626 (_ BitVec 32)) (x!63562 (_ BitVec 32))) (Undefined!7564) (MissingVacant!7564 (index!32627 (_ BitVec 32))) )
))
(declare-fun lt!332433 () SeekEntryResult!7564)

(assert (=> b!747856 (= res!504402 (or (not (is-Intermediate!7564 lt!332433)) (bvslt x!1131 (x!63562 lt!332433)) (not (= x!1131 (x!63562 lt!332433))) (not (= index!1321 (index!32626 lt!332433)))))))

(declare-fun e!417495 () Bool)

(assert (=> b!747856 e!417495))

(declare-fun res!504395 () Bool)

(assert (=> b!747856 (=> (not res!504395) (not e!417495))))

(declare-fun lt!332430 () SeekEntryResult!7564)

(declare-fun lt!332432 () SeekEntryResult!7564)

(assert (=> b!747856 (= res!504395 (= lt!332430 lt!332432))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!747856 (= lt!332432 (Found!7564 j!159))))

(declare-datatypes ((array!41701 0))(
  ( (array!41702 (arr!19964 (Array (_ BitVec 32) (_ BitVec 64))) (size!20385 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41701)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41701 (_ BitVec 32)) SeekEntryResult!7564)

(assert (=> b!747856 (= lt!332430 (seekEntryOrOpen!0 (select (arr!19964 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41701 (_ BitVec 32)) Bool)

(assert (=> b!747856 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25636 0))(
  ( (Unit!25637) )
))
(declare-fun lt!332434 () Unit!25636)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41701 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25636)

(assert (=> b!747856 (= lt!332434 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!747857 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41701 (_ BitVec 32)) SeekEntryResult!7564)

(assert (=> b!747857 (= e!417495 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19964 a!3186) j!159) a!3186 mask!3328) lt!332432))))

(declare-fun b!747858 () Bool)

(declare-fun e!417493 () Unit!25636)

(declare-fun Unit!25638 () Unit!25636)

(assert (=> b!747858 (= e!417493 Unit!25638)))

(declare-fun b!747859 () Bool)

(declare-fun Unit!25639 () Unit!25636)

(assert (=> b!747859 (= e!417493 Unit!25639)))

(assert (=> b!747859 false))

(declare-fun b!747860 () Bool)

(declare-fun res!504394 () Bool)

(assert (=> b!747860 (=> res!504394 e!417492)))

(assert (=> b!747860 (= res!504394 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19964 a!3186) j!159) a!3186 mask!3328) lt!332432)))))

(declare-fun b!747862 () Bool)

(declare-fun e!417490 () Bool)

(declare-fun e!417489 () Bool)

(assert (=> b!747862 (= e!417490 e!417489)))

(declare-fun res!504404 () Bool)

(assert (=> b!747862 (=> (not res!504404) (not e!417489))))

(declare-fun lt!332426 () SeekEntryResult!7564)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41701 (_ BitVec 32)) SeekEntryResult!7564)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!747862 (= res!504404 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19964 a!3186) j!159) mask!3328) (select (arr!19964 a!3186) j!159) a!3186 mask!3328) lt!332426))))

(assert (=> b!747862 (= lt!332426 (Intermediate!7564 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!747863 () Bool)

(assert (=> b!747863 (= e!417492 true)))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!747863 (= (select (store (arr!19964 a!3186) i!1173 k!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332431 () Unit!25636)

(assert (=> b!747863 (= lt!332431 e!417493)))

(declare-fun c!82114 () Bool)

(assert (=> b!747863 (= c!82114 (= (select (store (arr!19964 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!747864 () Bool)

(declare-fun res!504398 () Bool)

(declare-fun e!417494 () Bool)

(assert (=> b!747864 (=> (not res!504398) (not e!417494))))

(declare-fun arrayContainsKey!0 (array!41701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!747864 (= res!504398 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!747865 () Bool)

(declare-fun res!504396 () Bool)

(assert (=> b!747865 (=> (not res!504396) (not e!417494))))

(assert (=> b!747865 (= res!504396 (and (= (size!20385 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20385 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20385 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!747866 () Bool)

(assert (=> b!747866 (= e!417494 e!417490)))

(declare-fun res!504403 () Bool)

(assert (=> b!747866 (=> (not res!504403) (not e!417490))))

(declare-fun lt!332427 () SeekEntryResult!7564)

(assert (=> b!747866 (= res!504403 (or (= lt!332427 (MissingZero!7564 i!1173)) (= lt!332427 (MissingVacant!7564 i!1173))))))

(assert (=> b!747866 (= lt!332427 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun e!417491 () Bool)

(declare-fun b!747867 () Bool)

(assert (=> b!747867 (= e!417491 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19964 a!3186) j!159) a!3186 mask!3328) (Found!7564 j!159)))))

(declare-fun b!747868 () Bool)

(declare-fun res!504407 () Bool)

(assert (=> b!747868 (=> (not res!504407) (not e!417494))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!747868 (= res!504407 (validKeyInArray!0 k!2102))))

(declare-fun b!747869 () Bool)

(declare-fun res!504391 () Bool)

(assert (=> b!747869 (=> res!504391 e!417492)))

(declare-fun lt!332429 () (_ BitVec 64))

(assert (=> b!747869 (= res!504391 (= (select (store (arr!19964 a!3186) i!1173 k!2102) index!1321) lt!332429))))

(declare-fun b!747870 () Bool)

(declare-fun res!504397 () Bool)

(assert (=> b!747870 (=> (not res!504397) (not e!417490))))

(declare-datatypes ((List!13966 0))(
  ( (Nil!13963) (Cons!13962 (h!15034 (_ BitVec 64)) (t!20281 List!13966)) )
))
(declare-fun arrayNoDuplicates!0 (array!41701 (_ BitVec 32) List!13966) Bool)

(assert (=> b!747870 (= res!504397 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13963))))

(declare-fun b!747871 () Bool)

(declare-fun res!504401 () Bool)

(assert (=> b!747871 (=> (not res!504401) (not e!417489))))

(assert (=> b!747871 (= res!504401 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19964 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!747872 () Bool)

(declare-fun res!504392 () Bool)

(assert (=> b!747872 (=> (not res!504392) (not e!417490))))

(assert (=> b!747872 (= res!504392 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20385 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20385 a!3186))))))

(declare-fun b!747873 () Bool)

(declare-fun res!504399 () Bool)

(assert (=> b!747873 (=> (not res!504399) (not e!417494))))

(assert (=> b!747873 (= res!504399 (validKeyInArray!0 (select (arr!19964 a!3186) j!159)))))

(declare-fun b!747874 () Bool)

(declare-fun res!504393 () Bool)

(assert (=> b!747874 (=> (not res!504393) (not e!417489))))

(assert (=> b!747874 (= res!504393 e!417491)))

(declare-fun c!82113 () Bool)

(assert (=> b!747874 (= c!82113 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!747861 () Bool)

(assert (=> b!747861 (= e!417489 e!417497)))

(declare-fun res!504406 () Bool)

(assert (=> b!747861 (=> (not res!504406) (not e!417497))))

(declare-fun lt!332428 () SeekEntryResult!7564)

(assert (=> b!747861 (= res!504406 (= lt!332428 lt!332433))))

(declare-fun lt!332435 () array!41701)

(assert (=> b!747861 (= lt!332433 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332429 lt!332435 mask!3328))))

(assert (=> b!747861 (= lt!332428 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332429 mask!3328) lt!332429 lt!332435 mask!3328))))

(assert (=> b!747861 (= lt!332429 (select (store (arr!19964 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!747861 (= lt!332435 (array!41702 (store (arr!19964 a!3186) i!1173 k!2102) (size!20385 a!3186)))))

(declare-fun res!504400 () Bool)

(assert (=> start!65528 (=> (not res!504400) (not e!417494))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65528 (= res!504400 (validMask!0 mask!3328))))

(assert (=> start!65528 e!417494))

(assert (=> start!65528 true))

(declare-fun array_inv!15760 (array!41701) Bool)

(assert (=> start!65528 (array_inv!15760 a!3186)))

(declare-fun b!747875 () Bool)

(assert (=> b!747875 (= e!417491 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19964 a!3186) j!159) a!3186 mask!3328) lt!332426))))

(declare-fun b!747876 () Bool)

(declare-fun res!504405 () Bool)

(assert (=> b!747876 (=> (not res!504405) (not e!417490))))

(assert (=> b!747876 (= res!504405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!65528 res!504400) b!747865))

(assert (= (and b!747865 res!504396) b!747873))

(assert (= (and b!747873 res!504399) b!747868))

(assert (= (and b!747868 res!504407) b!747864))

(assert (= (and b!747864 res!504398) b!747866))

(assert (= (and b!747866 res!504403) b!747876))

(assert (= (and b!747876 res!504405) b!747870))

(assert (= (and b!747870 res!504397) b!747872))

(assert (= (and b!747872 res!504392) b!747862))

(assert (= (and b!747862 res!504404) b!747871))

(assert (= (and b!747871 res!504401) b!747874))

(assert (= (and b!747874 c!82113) b!747875))

(assert (= (and b!747874 (not c!82113)) b!747867))

(assert (= (and b!747874 res!504393) b!747861))

(assert (= (and b!747861 res!504406) b!747856))

(assert (= (and b!747856 res!504395) b!747857))

(assert (= (and b!747856 (not res!504402)) b!747860))

(assert (= (and b!747860 (not res!504394)) b!747869))

(assert (= (and b!747869 (not res!504391)) b!747863))

(assert (= (and b!747863 c!82114) b!747859))

(assert (= (and b!747863 (not c!82114)) b!747858))

(declare-fun m!697837 () Bool)

(assert (=> b!747866 m!697837))

(declare-fun m!697839 () Bool)

(assert (=> b!747871 m!697839))

(declare-fun m!697841 () Bool)

(assert (=> b!747869 m!697841))

(declare-fun m!697843 () Bool)

(assert (=> b!747869 m!697843))

(declare-fun m!697845 () Bool)

(assert (=> b!747856 m!697845))

(assert (=> b!747856 m!697845))

(declare-fun m!697847 () Bool)

(assert (=> b!747856 m!697847))

(declare-fun m!697849 () Bool)

(assert (=> b!747856 m!697849))

(declare-fun m!697851 () Bool)

(assert (=> b!747856 m!697851))

(declare-fun m!697853 () Bool)

(assert (=> start!65528 m!697853))

(declare-fun m!697855 () Bool)

(assert (=> start!65528 m!697855))

(assert (=> b!747863 m!697841))

(assert (=> b!747863 m!697843))

(assert (=> b!747862 m!697845))

(assert (=> b!747862 m!697845))

(declare-fun m!697857 () Bool)

(assert (=> b!747862 m!697857))

(assert (=> b!747862 m!697857))

(assert (=> b!747862 m!697845))

(declare-fun m!697859 () Bool)

(assert (=> b!747862 m!697859))

(assert (=> b!747860 m!697845))

(assert (=> b!747860 m!697845))

(declare-fun m!697861 () Bool)

(assert (=> b!747860 m!697861))

(assert (=> b!747873 m!697845))

(assert (=> b!747873 m!697845))

(declare-fun m!697863 () Bool)

(assert (=> b!747873 m!697863))

(declare-fun m!697865 () Bool)

(assert (=> b!747876 m!697865))

(declare-fun m!697867 () Bool)

(assert (=> b!747868 m!697867))

(assert (=> b!747857 m!697845))

(assert (=> b!747857 m!697845))

(declare-fun m!697869 () Bool)

(assert (=> b!747857 m!697869))

(assert (=> b!747875 m!697845))

(assert (=> b!747875 m!697845))

(declare-fun m!697871 () Bool)

(assert (=> b!747875 m!697871))

(declare-fun m!697873 () Bool)

(assert (=> b!747870 m!697873))

(assert (=> b!747867 m!697845))

(assert (=> b!747867 m!697845))

(assert (=> b!747867 m!697861))

(declare-fun m!697875 () Bool)

(assert (=> b!747864 m!697875))

(declare-fun m!697877 () Bool)

(assert (=> b!747861 m!697877))

(assert (=> b!747861 m!697841))

(declare-fun m!697879 () Bool)

(assert (=> b!747861 m!697879))

(declare-fun m!697881 () Bool)

(assert (=> b!747861 m!697881))

(declare-fun m!697883 () Bool)

(assert (=> b!747861 m!697883))

(assert (=> b!747861 m!697879))

(push 1)

