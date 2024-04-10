; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66786 () Bool)

(assert start!66786)

(declare-fun b!769976 () Bool)

(declare-fun e!428721 () Bool)

(declare-fun e!428726 () Bool)

(assert (=> b!769976 (= e!428721 e!428726)))

(declare-fun res!520787 () Bool)

(assert (=> b!769976 (=> (not res!520787) (not e!428726))))

(declare-datatypes ((SeekEntryResult!7874 0))(
  ( (MissingZero!7874 (index!33864 (_ BitVec 32))) (Found!7874 (index!33865 (_ BitVec 32))) (Intermediate!7874 (undefined!8686 Bool) (index!33866 (_ BitVec 32)) (x!64797 (_ BitVec 32))) (Undefined!7874) (MissingVacant!7874 (index!33867 (_ BitVec 32))) )
))
(declare-fun lt!342648 () SeekEntryResult!7874)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!769976 (= res!520787 (or (= lt!342648 (MissingZero!7874 i!1173)) (= lt!342648 (MissingVacant!7874 i!1173))))))

(declare-datatypes ((array!42348 0))(
  ( (array!42349 (arr!20274 (Array (_ BitVec 32) (_ BitVec 64))) (size!20695 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42348)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42348 (_ BitVec 32)) SeekEntryResult!7874)

(assert (=> b!769976 (= lt!342648 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!769977 () Bool)

(declare-fun res!520782 () Bool)

(assert (=> b!769977 (=> (not res!520782) (not e!428721))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!769977 (= res!520782 (validKeyInArray!0 k!2102))))

(declare-fun e!428723 () Bool)

(declare-fun lt!342649 () SeekEntryResult!7874)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!769978 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42348 (_ BitVec 32)) SeekEntryResult!7874)

(assert (=> b!769978 (= e!428723 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20274 a!3186) j!159) a!3186 mask!3328) lt!342649))))

(declare-fun b!769979 () Bool)

(declare-fun e!428724 () Bool)

(declare-fun e!428722 () Bool)

(assert (=> b!769979 (= e!428724 (not e!428722))))

(declare-fun res!520785 () Bool)

(assert (=> b!769979 (=> res!520785 e!428722)))

(declare-fun lt!342640 () SeekEntryResult!7874)

(assert (=> b!769979 (= res!520785 (or (not (is-Intermediate!7874 lt!342640)) (bvsge x!1131 (x!64797 lt!342640))))))

(declare-fun e!428729 () Bool)

(assert (=> b!769979 e!428729))

(declare-fun res!520792 () Bool)

(assert (=> b!769979 (=> (not res!520792) (not e!428729))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42348 (_ BitVec 32)) Bool)

(assert (=> b!769979 (= res!520792 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26510 0))(
  ( (Unit!26511) )
))
(declare-fun lt!342641 () Unit!26510)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42348 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26510)

(assert (=> b!769979 (= lt!342641 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!769980 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!342646 () SeekEntryResult!7874)

(declare-fun e!428720 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42348 (_ BitVec 32)) SeekEntryResult!7874)

(assert (=> b!769980 (= e!428720 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20274 a!3186) j!159) a!3186 mask!3328) lt!342646))))

(declare-fun b!769981 () Bool)

(assert (=> b!769981 (= e!428722 true)))

(declare-fun lt!342645 () Unit!26510)

(declare-fun e!428727 () Unit!26510)

(assert (=> b!769981 (= lt!342645 e!428727)))

(declare-fun c!84994 () Bool)

(assert (=> b!769981 (= c!84994 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!342643 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769981 (= lt!342643 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!769982 () Bool)

(assert (=> b!769982 (= e!428729 e!428720)))

(declare-fun res!520783 () Bool)

(assert (=> b!769982 (=> (not res!520783) (not e!428720))))

(assert (=> b!769982 (= res!520783 (= (seekEntryOrOpen!0 (select (arr!20274 a!3186) j!159) a!3186 mask!3328) lt!342646))))

(assert (=> b!769982 (= lt!342646 (Found!7874 j!159))))

(declare-fun b!769983 () Bool)

(declare-fun res!520789 () Bool)

(declare-fun e!428728 () Bool)

(assert (=> b!769983 (=> (not res!520789) (not e!428728))))

(assert (=> b!769983 (= res!520789 e!428723)))

(declare-fun c!84993 () Bool)

(assert (=> b!769983 (= c!84993 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!769984 () Bool)

(declare-fun res!520794 () Bool)

(assert (=> b!769984 (=> (not res!520794) (not e!428726))))

(assert (=> b!769984 (= res!520794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!769985 () Bool)

(declare-fun res!520796 () Bool)

(assert (=> b!769985 (=> (not res!520796) (not e!428721))))

(assert (=> b!769985 (= res!520796 (validKeyInArray!0 (select (arr!20274 a!3186) j!159)))))

(declare-fun b!769986 () Bool)

(declare-fun res!520791 () Bool)

(assert (=> b!769986 (=> (not res!520791) (not e!428721))))

(assert (=> b!769986 (= res!520791 (and (= (size!20695 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20695 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20695 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!769988 () Bool)

(declare-fun Unit!26512 () Unit!26510)

(assert (=> b!769988 (= e!428727 Unit!26512)))

(assert (=> b!769988 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342643 (select (arr!20274 a!3186) j!159) a!3186 mask!3328) lt!342649)))

(declare-fun b!769989 () Bool)

(assert (=> b!769989 (= e!428723 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20274 a!3186) j!159) a!3186 mask!3328) (Found!7874 j!159)))))

(declare-fun b!769990 () Bool)

(assert (=> b!769990 (= e!428726 e!428728)))

(declare-fun res!520786 () Bool)

(assert (=> b!769990 (=> (not res!520786) (not e!428728))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769990 (= res!520786 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20274 a!3186) j!159) mask!3328) (select (arr!20274 a!3186) j!159) a!3186 mask!3328) lt!342649))))

(assert (=> b!769990 (= lt!342649 (Intermediate!7874 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!769991 () Bool)

(declare-fun Unit!26513 () Unit!26510)

(assert (=> b!769991 (= e!428727 Unit!26513)))

(declare-fun lt!342642 () SeekEntryResult!7874)

(assert (=> b!769991 (= lt!342642 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20274 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!769991 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342643 resIntermediateIndex!5 (select (arr!20274 a!3186) j!159) a!3186 mask!3328) (Found!7874 j!159))))

(declare-fun b!769992 () Bool)

(declare-fun res!520784 () Bool)

(assert (=> b!769992 (=> (not res!520784) (not e!428721))))

(declare-fun arrayContainsKey!0 (array!42348 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!769992 (= res!520784 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!769993 () Bool)

(declare-fun res!520788 () Bool)

(assert (=> b!769993 (=> (not res!520788) (not e!428728))))

(assert (=> b!769993 (= res!520788 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20274 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!520795 () Bool)

(assert (=> start!66786 (=> (not res!520795) (not e!428721))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66786 (= res!520795 (validMask!0 mask!3328))))

(assert (=> start!66786 e!428721))

(assert (=> start!66786 true))

(declare-fun array_inv!16070 (array!42348) Bool)

(assert (=> start!66786 (array_inv!16070 a!3186)))

(declare-fun b!769987 () Bool)

(declare-fun res!520790 () Bool)

(assert (=> b!769987 (=> (not res!520790) (not e!428726))))

(declare-datatypes ((List!14276 0))(
  ( (Nil!14273) (Cons!14272 (h!15371 (_ BitVec 64)) (t!20591 List!14276)) )
))
(declare-fun arrayNoDuplicates!0 (array!42348 (_ BitVec 32) List!14276) Bool)

(assert (=> b!769987 (= res!520790 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14273))))

(declare-fun b!769994 () Bool)

(declare-fun res!520781 () Bool)

(assert (=> b!769994 (=> (not res!520781) (not e!428726))))

(assert (=> b!769994 (= res!520781 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20695 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20695 a!3186))))))

(declare-fun b!769995 () Bool)

(assert (=> b!769995 (= e!428728 e!428724)))

(declare-fun res!520793 () Bool)

(assert (=> b!769995 (=> (not res!520793) (not e!428724))))

(declare-fun lt!342650 () SeekEntryResult!7874)

(assert (=> b!769995 (= res!520793 (= lt!342650 lt!342640))))

(declare-fun lt!342647 () array!42348)

(declare-fun lt!342644 () (_ BitVec 64))

(assert (=> b!769995 (= lt!342640 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342644 lt!342647 mask!3328))))

(assert (=> b!769995 (= lt!342650 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342644 mask!3328) lt!342644 lt!342647 mask!3328))))

(assert (=> b!769995 (= lt!342644 (select (store (arr!20274 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!769995 (= lt!342647 (array!42349 (store (arr!20274 a!3186) i!1173 k!2102) (size!20695 a!3186)))))

(assert (= (and start!66786 res!520795) b!769986))

(assert (= (and b!769986 res!520791) b!769985))

(assert (= (and b!769985 res!520796) b!769977))

(assert (= (and b!769977 res!520782) b!769992))

(assert (= (and b!769992 res!520784) b!769976))

(assert (= (and b!769976 res!520787) b!769984))

(assert (= (and b!769984 res!520794) b!769987))

(assert (= (and b!769987 res!520790) b!769994))

(assert (= (and b!769994 res!520781) b!769990))

(assert (= (and b!769990 res!520786) b!769993))

(assert (= (and b!769993 res!520788) b!769983))

(assert (= (and b!769983 c!84993) b!769978))

(assert (= (and b!769983 (not c!84993)) b!769989))

(assert (= (and b!769983 res!520789) b!769995))

(assert (= (and b!769995 res!520793) b!769979))

(assert (= (and b!769979 res!520792) b!769982))

(assert (= (and b!769982 res!520783) b!769980))

(assert (= (and b!769979 (not res!520785)) b!769981))

(assert (= (and b!769981 c!84994) b!769988))

(assert (= (and b!769981 (not c!84994)) b!769991))

(declare-fun m!715319 () Bool)

(assert (=> b!769976 m!715319))

(declare-fun m!715321 () Bool)

(assert (=> b!769979 m!715321))

(declare-fun m!715323 () Bool)

(assert (=> b!769979 m!715323))

(declare-fun m!715325 () Bool)

(assert (=> b!769978 m!715325))

(assert (=> b!769978 m!715325))

(declare-fun m!715327 () Bool)

(assert (=> b!769978 m!715327))

(assert (=> b!769989 m!715325))

(assert (=> b!769989 m!715325))

(declare-fun m!715329 () Bool)

(assert (=> b!769989 m!715329))

(assert (=> b!769985 m!715325))

(assert (=> b!769985 m!715325))

(declare-fun m!715331 () Bool)

(assert (=> b!769985 m!715331))

(declare-fun m!715333 () Bool)

(assert (=> b!769977 m!715333))

(assert (=> b!769988 m!715325))

(assert (=> b!769988 m!715325))

(declare-fun m!715335 () Bool)

(assert (=> b!769988 m!715335))

(declare-fun m!715337 () Bool)

(assert (=> b!769992 m!715337))

(declare-fun m!715339 () Bool)

(assert (=> b!769993 m!715339))

(assert (=> b!769980 m!715325))

(assert (=> b!769980 m!715325))

(declare-fun m!715341 () Bool)

(assert (=> b!769980 m!715341))

(assert (=> b!769991 m!715325))

(assert (=> b!769991 m!715325))

(assert (=> b!769991 m!715329))

(assert (=> b!769991 m!715325))

(declare-fun m!715343 () Bool)

(assert (=> b!769991 m!715343))

(assert (=> b!769982 m!715325))

(assert (=> b!769982 m!715325))

(declare-fun m!715345 () Bool)

(assert (=> b!769982 m!715345))

(declare-fun m!715347 () Bool)

(assert (=> b!769987 m!715347))

(declare-fun m!715349 () Bool)

(assert (=> start!66786 m!715349))

(declare-fun m!715351 () Bool)

(assert (=> start!66786 m!715351))

(declare-fun m!715353 () Bool)

(assert (=> b!769981 m!715353))

(assert (=> b!769990 m!715325))

(assert (=> b!769990 m!715325))

(declare-fun m!715355 () Bool)

(assert (=> b!769990 m!715355))

(assert (=> b!769990 m!715355))

(assert (=> b!769990 m!715325))

(declare-fun m!715357 () Bool)

(assert (=> b!769990 m!715357))

(declare-fun m!715359 () Bool)

(assert (=> b!769995 m!715359))

(assert (=> b!769995 m!715359))

(declare-fun m!715361 () Bool)

(assert (=> b!769995 m!715361))

(declare-fun m!715363 () Bool)

(assert (=> b!769995 m!715363))

(declare-fun m!715365 () Bool)

(assert (=> b!769995 m!715365))

(declare-fun m!715367 () Bool)

(assert (=> b!769995 m!715367))

(declare-fun m!715369 () Bool)

(assert (=> b!769984 m!715369))

(push 1)

