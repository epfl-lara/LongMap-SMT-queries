; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64286 () Bool)

(assert start!64286)

(declare-fun b!722016 () Bool)

(declare-fun res!483790 () Bool)

(declare-fun e!404777 () Bool)

(assert (=> b!722016 (=> (not res!483790) (not e!404777))))

(declare-datatypes ((array!40867 0))(
  ( (array!40868 (arr!19556 (Array (_ BitVec 32) (_ BitVec 64))) (size!19977 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40867)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!722016 (= res!483790 (and (= (size!19977 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19977 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19977 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!722017 () Bool)

(declare-fun res!483789 () Bool)

(assert (=> b!722017 (=> (not res!483789) (not e!404777))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722017 (= res!483789 (validKeyInArray!0 k!2102))))

(declare-fun b!722018 () Bool)

(declare-fun res!483793 () Bool)

(declare-fun e!404776 () Bool)

(assert (=> b!722018 (=> (not res!483793) (not e!404776))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!722018 (= res!483793 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19556 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!722019 () Bool)

(declare-fun res!483791 () Bool)

(declare-fun e!404778 () Bool)

(assert (=> b!722019 (=> (not res!483791) (not e!404778))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40867 (_ BitVec 32)) Bool)

(assert (=> b!722019 (= res!483791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!483796 () Bool)

(assert (=> start!64286 (=> (not res!483796) (not e!404777))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64286 (= res!483796 (validMask!0 mask!3328))))

(assert (=> start!64286 e!404777))

(assert (=> start!64286 true))

(declare-fun array_inv!15352 (array!40867) Bool)

(assert (=> start!64286 (array_inv!15352 a!3186)))

(declare-fun b!722020 () Bool)

(declare-fun res!483792 () Bool)

(assert (=> b!722020 (=> (not res!483792) (not e!404778))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!722020 (= res!483792 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19977 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19977 a!3186))))))

(declare-fun b!722021 () Bool)

(declare-fun res!483787 () Bool)

(assert (=> b!722021 (=> (not res!483787) (not e!404778))))

(declare-datatypes ((List!13558 0))(
  ( (Nil!13555) (Cons!13554 (h!14608 (_ BitVec 64)) (t!19873 List!13558)) )
))
(declare-fun arrayNoDuplicates!0 (array!40867 (_ BitVec 32) List!13558) Bool)

(assert (=> b!722021 (= res!483787 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13555))))

(declare-fun e!404779 () Bool)

(declare-fun b!722022 () Bool)

(declare-datatypes ((SeekEntryResult!7156 0))(
  ( (MissingZero!7156 (index!30992 (_ BitVec 32))) (Found!7156 (index!30993 (_ BitVec 32))) (Intermediate!7156 (undefined!7968 Bool) (index!30994 (_ BitVec 32)) (x!61997 (_ BitVec 32))) (Undefined!7156) (MissingVacant!7156 (index!30995 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40867 (_ BitVec 32)) SeekEntryResult!7156)

(assert (=> b!722022 (= e!404779 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19556 a!3186) j!159) a!3186 mask!3328) (Found!7156 j!159))))))

(declare-fun b!722023 () Bool)

(declare-fun res!483797 () Bool)

(assert (=> b!722023 (=> (not res!483797) (not e!404777))))

(declare-fun arrayContainsKey!0 (array!40867 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722023 (= res!483797 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!722024 () Bool)

(declare-fun lt!320200 () SeekEntryResult!7156)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40867 (_ BitVec 32)) SeekEntryResult!7156)

(assert (=> b!722024 (= e!404779 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19556 a!3186) j!159) a!3186 mask!3328) lt!320200)))))

(declare-fun b!722025 () Bool)

(declare-fun res!483795 () Bool)

(assert (=> b!722025 (=> (not res!483795) (not e!404777))))

(assert (=> b!722025 (= res!483795 (validKeyInArray!0 (select (arr!19556 a!3186) j!159)))))

(declare-fun b!722026 () Bool)

(assert (=> b!722026 (= e!404776 false)))

(declare-fun lt!320201 () Bool)

(assert (=> b!722026 (= lt!320201 e!404779)))

(declare-fun c!79486 () Bool)

(assert (=> b!722026 (= c!79486 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!722027 () Bool)

(assert (=> b!722027 (= e!404778 e!404776)))

(declare-fun res!483788 () Bool)

(assert (=> b!722027 (=> (not res!483788) (not e!404776))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722027 (= res!483788 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19556 a!3186) j!159) mask!3328) (select (arr!19556 a!3186) j!159) a!3186 mask!3328) lt!320200))))

(assert (=> b!722027 (= lt!320200 (Intermediate!7156 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!722028 () Bool)

(assert (=> b!722028 (= e!404777 e!404778)))

(declare-fun res!483794 () Bool)

(assert (=> b!722028 (=> (not res!483794) (not e!404778))))

(declare-fun lt!320199 () SeekEntryResult!7156)

(assert (=> b!722028 (= res!483794 (or (= lt!320199 (MissingZero!7156 i!1173)) (= lt!320199 (MissingVacant!7156 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40867 (_ BitVec 32)) SeekEntryResult!7156)

(assert (=> b!722028 (= lt!320199 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!64286 res!483796) b!722016))

(assert (= (and b!722016 res!483790) b!722025))

(assert (= (and b!722025 res!483795) b!722017))

(assert (= (and b!722017 res!483789) b!722023))

(assert (= (and b!722023 res!483797) b!722028))

(assert (= (and b!722028 res!483794) b!722019))

(assert (= (and b!722019 res!483791) b!722021))

(assert (= (and b!722021 res!483787) b!722020))

(assert (= (and b!722020 res!483792) b!722027))

(assert (= (and b!722027 res!483788) b!722018))

(assert (= (and b!722018 res!483793) b!722026))

(assert (= (and b!722026 c!79486) b!722024))

(assert (= (and b!722026 (not c!79486)) b!722022))

(declare-fun m!676665 () Bool)

(assert (=> b!722025 m!676665))

(assert (=> b!722025 m!676665))

(declare-fun m!676667 () Bool)

(assert (=> b!722025 m!676667))

(declare-fun m!676669 () Bool)

(assert (=> start!64286 m!676669))

(declare-fun m!676671 () Bool)

(assert (=> start!64286 m!676671))

(assert (=> b!722024 m!676665))

(assert (=> b!722024 m!676665))

(declare-fun m!676673 () Bool)

(assert (=> b!722024 m!676673))

(declare-fun m!676675 () Bool)

(assert (=> b!722017 m!676675))

(declare-fun m!676677 () Bool)

(assert (=> b!722018 m!676677))

(declare-fun m!676679 () Bool)

(assert (=> b!722019 m!676679))

(assert (=> b!722022 m!676665))

(assert (=> b!722022 m!676665))

(declare-fun m!676681 () Bool)

(assert (=> b!722022 m!676681))

(declare-fun m!676683 () Bool)

(assert (=> b!722023 m!676683))

(declare-fun m!676685 () Bool)

(assert (=> b!722028 m!676685))

(declare-fun m!676687 () Bool)

(assert (=> b!722021 m!676687))

(assert (=> b!722027 m!676665))

(assert (=> b!722027 m!676665))

(declare-fun m!676689 () Bool)

(assert (=> b!722027 m!676689))

(assert (=> b!722027 m!676689))

(assert (=> b!722027 m!676665))

(declare-fun m!676691 () Bool)

(assert (=> b!722027 m!676691))

(push 1)

(assert (not b!722022))

(assert (not start!64286))

(assert (not b!722028))

(assert (not b!722027))

(assert (not b!722017))

(assert (not b!722023))

(assert (not b!722021))

(assert (not b!722019))

