; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64744 () Bool)

(assert start!64744)

(declare-fun b!730859 () Bool)

(declare-fun res!491111 () Bool)

(declare-fun e!408985 () Bool)

(assert (=> b!730859 (=> (not res!491111) (not e!408985))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41193 0))(
  ( (array!41194 (arr!19716 (Array (_ BitVec 32) (_ BitVec 64))) (size!20137 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41193)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!730859 (= res!491111 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20137 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20137 a!3186))))))

(declare-fun b!730860 () Bool)

(declare-fun res!491118 () Bool)

(assert (=> b!730860 (=> (not res!491118) (not e!408985))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41193 (_ BitVec 32)) Bool)

(assert (=> b!730860 (= res!491118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!730861 () Bool)

(declare-fun res!491107 () Bool)

(declare-fun e!408978 () Bool)

(assert (=> b!730861 (=> (not res!491107) (not e!408978))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!730861 (= res!491107 (and (= (size!20137 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20137 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20137 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!730862 () Bool)

(declare-datatypes ((SeekEntryResult!7316 0))(
  ( (MissingZero!7316 (index!31632 (_ BitVec 32))) (Found!7316 (index!31633 (_ BitVec 32))) (Intermediate!7316 (undefined!8128 Bool) (index!31634 (_ BitVec 32)) (x!62610 (_ BitVec 32))) (Undefined!7316) (MissingVacant!7316 (index!31635 (_ BitVec 32))) )
))
(declare-fun lt!323880 () SeekEntryResult!7316)

(declare-fun e!408986 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41193 (_ BitVec 32)) SeekEntryResult!7316)

(assert (=> b!730862 (= e!408986 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19716 a!3186) j!159) a!3186 mask!3328) lt!323880))))

(declare-fun b!730863 () Bool)

(assert (=> b!730863 (= e!408978 e!408985)))

(declare-fun res!491114 () Bool)

(assert (=> b!730863 (=> (not res!491114) (not e!408985))))

(declare-fun lt!323876 () SeekEntryResult!7316)

(assert (=> b!730863 (= res!491114 (or (= lt!323876 (MissingZero!7316 i!1173)) (= lt!323876 (MissingVacant!7316 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41193 (_ BitVec 32)) SeekEntryResult!7316)

(assert (=> b!730863 (= lt!323876 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!730864 () Bool)

(declare-fun res!491112 () Bool)

(declare-fun e!408982 () Bool)

(assert (=> b!730864 (=> (not res!491112) (not e!408982))))

(declare-fun e!408979 () Bool)

(assert (=> b!730864 (= res!491112 e!408979)))

(declare-fun c!80251 () Bool)

(assert (=> b!730864 (= c!80251 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!491121 () Bool)

(assert (=> start!64744 (=> (not res!491121) (not e!408978))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64744 (= res!491121 (validMask!0 mask!3328))))

(assert (=> start!64744 e!408978))

(assert (=> start!64744 true))

(declare-fun array_inv!15512 (array!41193) Bool)

(assert (=> start!64744 (array_inv!15512 a!3186)))

(declare-fun b!730865 () Bool)

(declare-fun e!408981 () Bool)

(declare-fun e!408977 () Bool)

(assert (=> b!730865 (= e!408981 e!408977)))

(declare-fun res!491123 () Bool)

(assert (=> b!730865 (=> res!491123 e!408977)))

(assert (=> b!730865 (= res!491123 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!323878 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730865 (= lt!323878 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun lt!323879 () SeekEntryResult!7316)

(declare-fun b!730866 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41193 (_ BitVec 32)) SeekEntryResult!7316)

(assert (=> b!730866 (= e!408979 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19716 a!3186) j!159) a!3186 mask!3328) lt!323879))))

(declare-fun b!730867 () Bool)

(declare-fun res!491113 () Bool)

(assert (=> b!730867 (=> (not res!491113) (not e!408985))))

(declare-datatypes ((List!13718 0))(
  ( (Nil!13715) (Cons!13714 (h!14774 (_ BitVec 64)) (t!20033 List!13718)) )
))
(declare-fun arrayNoDuplicates!0 (array!41193 (_ BitVec 32) List!13718) Bool)

(assert (=> b!730867 (= res!491113 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13715))))

(declare-fun b!730868 () Bool)

(declare-fun res!491109 () Bool)

(assert (=> b!730868 (=> res!491109 e!408977)))

(assert (=> b!730868 (= res!491109 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19716 a!3186) j!159) a!3186 mask!3328) (Found!7316 j!159))))))

(declare-fun b!730869 () Bool)

(assert (=> b!730869 (= e!408977 (bvsge mask!3328 #b00000000000000000000000000000000))))

(declare-fun b!730870 () Bool)

(declare-fun e!408983 () Bool)

(assert (=> b!730870 (= e!408983 (not e!408981))))

(declare-fun res!491106 () Bool)

(assert (=> b!730870 (=> res!491106 e!408981)))

(declare-fun lt!323877 () SeekEntryResult!7316)

(assert (=> b!730870 (= res!491106 (or (not (is-Intermediate!7316 lt!323877)) (bvsge x!1131 (x!62610 lt!323877))))))

(declare-fun e!408984 () Bool)

(assert (=> b!730870 e!408984))

(declare-fun res!491108 () Bool)

(assert (=> b!730870 (=> (not res!491108) (not e!408984))))

(assert (=> b!730870 (= res!491108 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24950 0))(
  ( (Unit!24951) )
))
(declare-fun lt!323881 () Unit!24950)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41193 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24950)

(assert (=> b!730870 (= lt!323881 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!730871 () Bool)

(assert (=> b!730871 (= e!408984 e!408986)))

(declare-fun res!491122 () Bool)

(assert (=> b!730871 (=> (not res!491122) (not e!408986))))

(assert (=> b!730871 (= res!491122 (= (seekEntryOrOpen!0 (select (arr!19716 a!3186) j!159) a!3186 mask!3328) lt!323880))))

(assert (=> b!730871 (= lt!323880 (Found!7316 j!159))))

(declare-fun b!730872 () Bool)

(declare-fun res!491115 () Bool)

(assert (=> b!730872 (=> (not res!491115) (not e!408978))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!730872 (= res!491115 (validKeyInArray!0 k!2102))))

(declare-fun b!730873 () Bool)

(assert (=> b!730873 (= e!408979 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19716 a!3186) j!159) a!3186 mask!3328) (Found!7316 j!159)))))

(declare-fun b!730874 () Bool)

(assert (=> b!730874 (= e!408982 e!408983)))

(declare-fun res!491110 () Bool)

(assert (=> b!730874 (=> (not res!491110) (not e!408983))))

(declare-fun lt!323882 () SeekEntryResult!7316)

(assert (=> b!730874 (= res!491110 (= lt!323882 lt!323877))))

(declare-fun lt!323875 () array!41193)

(declare-fun lt!323874 () (_ BitVec 64))

(assert (=> b!730874 (= lt!323877 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323874 lt!323875 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730874 (= lt!323882 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323874 mask!3328) lt!323874 lt!323875 mask!3328))))

(assert (=> b!730874 (= lt!323874 (select (store (arr!19716 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!730874 (= lt!323875 (array!41194 (store (arr!19716 a!3186) i!1173 k!2102) (size!20137 a!3186)))))

(declare-fun b!730875 () Bool)

(declare-fun res!491116 () Bool)

(assert (=> b!730875 (=> (not res!491116) (not e!408978))))

(assert (=> b!730875 (= res!491116 (validKeyInArray!0 (select (arr!19716 a!3186) j!159)))))

(declare-fun b!730876 () Bool)

(declare-fun res!491119 () Bool)

(assert (=> b!730876 (=> (not res!491119) (not e!408978))))

(declare-fun arrayContainsKey!0 (array!41193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!730876 (= res!491119 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!730877 () Bool)

(declare-fun res!491117 () Bool)

(assert (=> b!730877 (=> (not res!491117) (not e!408982))))

(assert (=> b!730877 (= res!491117 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19716 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!730878 () Bool)

(assert (=> b!730878 (= e!408985 e!408982)))

(declare-fun res!491120 () Bool)

(assert (=> b!730878 (=> (not res!491120) (not e!408982))))

(assert (=> b!730878 (= res!491120 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19716 a!3186) j!159) mask!3328) (select (arr!19716 a!3186) j!159) a!3186 mask!3328) lt!323879))))

(assert (=> b!730878 (= lt!323879 (Intermediate!7316 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!64744 res!491121) b!730861))

(assert (= (and b!730861 res!491107) b!730875))

(assert (= (and b!730875 res!491116) b!730872))

(assert (= (and b!730872 res!491115) b!730876))

(assert (= (and b!730876 res!491119) b!730863))

(assert (= (and b!730863 res!491114) b!730860))

(assert (= (and b!730860 res!491118) b!730867))

(assert (= (and b!730867 res!491113) b!730859))

(assert (= (and b!730859 res!491111) b!730878))

(assert (= (and b!730878 res!491120) b!730877))

(assert (= (and b!730877 res!491117) b!730864))

(assert (= (and b!730864 c!80251) b!730866))

(assert (= (and b!730864 (not c!80251)) b!730873))

(assert (= (and b!730864 res!491112) b!730874))

(assert (= (and b!730874 res!491110) b!730870))

(assert (= (and b!730870 res!491108) b!730871))

(assert (= (and b!730871 res!491122) b!730862))

(assert (= (and b!730870 (not res!491106)) b!730865))

(assert (= (and b!730865 (not res!491123)) b!730868))

(assert (= (and b!730868 (not res!491109)) b!730869))

(declare-fun m!684331 () Bool)

(assert (=> b!730871 m!684331))

(assert (=> b!730871 m!684331))

(declare-fun m!684333 () Bool)

(assert (=> b!730871 m!684333))

(assert (=> b!730873 m!684331))

(assert (=> b!730873 m!684331))

(declare-fun m!684335 () Bool)

(assert (=> b!730873 m!684335))

(assert (=> b!730875 m!684331))

(assert (=> b!730875 m!684331))

(declare-fun m!684337 () Bool)

(assert (=> b!730875 m!684337))

(declare-fun m!684339 () Bool)

(assert (=> b!730867 m!684339))

(declare-fun m!684341 () Bool)

(assert (=> b!730872 m!684341))

(declare-fun m!684343 () Bool)

(assert (=> b!730876 m!684343))

(declare-fun m!684345 () Bool)

(assert (=> b!730874 m!684345))

(declare-fun m!684347 () Bool)

(assert (=> b!730874 m!684347))

(declare-fun m!684349 () Bool)

(assert (=> b!730874 m!684349))

(declare-fun m!684351 () Bool)

(assert (=> b!730874 m!684351))

(assert (=> b!730874 m!684351))

(declare-fun m!684353 () Bool)

(assert (=> b!730874 m!684353))

(declare-fun m!684355 () Bool)

(assert (=> b!730863 m!684355))

(declare-fun m!684357 () Bool)

(assert (=> start!64744 m!684357))

(declare-fun m!684359 () Bool)

(assert (=> start!64744 m!684359))

(declare-fun m!684361 () Bool)

(assert (=> b!730877 m!684361))

(declare-fun m!684363 () Bool)

(assert (=> b!730860 m!684363))

(assert (=> b!730866 m!684331))

(assert (=> b!730866 m!684331))

(declare-fun m!684365 () Bool)

(assert (=> b!730866 m!684365))

(declare-fun m!684367 () Bool)

(assert (=> b!730865 m!684367))

(assert (=> b!730868 m!684331))

(assert (=> b!730868 m!684331))

(assert (=> b!730868 m!684335))

(assert (=> b!730862 m!684331))

(assert (=> b!730862 m!684331))

(declare-fun m!684369 () Bool)

(assert (=> b!730862 m!684369))

(declare-fun m!684371 () Bool)

(assert (=> b!730870 m!684371))

(declare-fun m!684373 () Bool)

(assert (=> b!730870 m!684373))

(assert (=> b!730878 m!684331))

(assert (=> b!730878 m!684331))

(declare-fun m!684375 () Bool)

(assert (=> b!730878 m!684375))

(assert (=> b!730878 m!684375))

(assert (=> b!730878 m!684331))

(declare-fun m!684377 () Bool)

(assert (=> b!730878 m!684377))

(push 1)

