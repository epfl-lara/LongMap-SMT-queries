; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65362 () Bool)

(assert start!65362)

(declare-fun b!743122 () Bool)

(declare-fun res!500247 () Bool)

(declare-fun e!415243 () Bool)

(assert (=> b!743122 (=> res!500247 e!415243)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41535 0))(
  ( (array!41536 (arr!19881 (Array (_ BitVec 32) (_ BitVec 64))) (size!20302 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41535)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7481 0))(
  ( (MissingZero!7481 (index!32292 (_ BitVec 32))) (Found!7481 (index!32293 (_ BitVec 32))) (Intermediate!7481 (undefined!8293 Bool) (index!32294 (_ BitVec 32)) (x!63263 (_ BitVec 32))) (Undefined!7481) (MissingVacant!7481 (index!32295 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41535 (_ BitVec 32)) SeekEntryResult!7481)

(assert (=> b!743122 (= res!500247 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19881 a!3186) j!159) a!3186 mask!3328) (Found!7481 j!159))))))

(declare-fun b!743123 () Bool)

(declare-fun res!500243 () Bool)

(declare-fun e!415241 () Bool)

(assert (=> b!743123 (=> (not res!500243) (not e!415241))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!743123 (= res!500243 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19881 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!743124 () Bool)

(declare-fun res!500256 () Bool)

(declare-fun e!415245 () Bool)

(assert (=> b!743124 (=> (not res!500256) (not e!415245))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!743124 (= res!500256 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20302 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20302 a!3186))))))

(declare-fun b!743125 () Bool)

(declare-fun res!500255 () Bool)

(assert (=> b!743125 (=> (not res!500255) (not e!415245))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41535 (_ BitVec 32)) Bool)

(assert (=> b!743125 (= res!500255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!743126 () Bool)

(declare-fun e!415240 () Bool)

(assert (=> b!743126 (= e!415240 (not e!415243))))

(declare-fun res!500258 () Bool)

(assert (=> b!743126 (=> res!500258 e!415243)))

(declare-fun lt!330128 () SeekEntryResult!7481)

(assert (=> b!743126 (= res!500258 (or (not (is-Intermediate!7481 lt!330128)) (bvslt x!1131 (x!63263 lt!330128)) (not (= x!1131 (x!63263 lt!330128))) (not (= index!1321 (index!32294 lt!330128)))))))

(declare-fun e!415246 () Bool)

(assert (=> b!743126 e!415246))

(declare-fun res!500250 () Bool)

(assert (=> b!743126 (=> (not res!500250) (not e!415246))))

(assert (=> b!743126 (= res!500250 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25442 0))(
  ( (Unit!25443) )
))
(declare-fun lt!330124 () Unit!25442)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41535 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25442)

(assert (=> b!743126 (= lt!330124 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!743127 () Bool)

(declare-fun res!500254 () Bool)

(assert (=> b!743127 (=> (not res!500254) (not e!415245))))

(declare-datatypes ((List!13883 0))(
  ( (Nil!13880) (Cons!13879 (h!14951 (_ BitVec 64)) (t!20198 List!13883)) )
))
(declare-fun arrayNoDuplicates!0 (array!41535 (_ BitVec 32) List!13883) Bool)

(assert (=> b!743127 (= res!500254 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13880))))

(declare-fun b!743128 () Bool)

(assert (=> b!743128 (= e!415243 (bvsge mask!3328 #b00000000000000000000000000000000))))

(declare-fun res!500246 () Bool)

(declare-fun e!415239 () Bool)

(assert (=> start!65362 (=> (not res!500246) (not e!415239))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65362 (= res!500246 (validMask!0 mask!3328))))

(assert (=> start!65362 e!415239))

(assert (=> start!65362 true))

(declare-fun array_inv!15677 (array!41535) Bool)

(assert (=> start!65362 (array_inv!15677 a!3186)))

(declare-fun b!743129 () Bool)

(declare-fun e!415244 () Bool)

(declare-fun lt!330122 () SeekEntryResult!7481)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41535 (_ BitVec 32)) SeekEntryResult!7481)

(assert (=> b!743129 (= e!415244 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19881 a!3186) j!159) a!3186 mask!3328) lt!330122))))

(declare-fun b!743130 () Bool)

(declare-fun res!500249 () Bool)

(assert (=> b!743130 (=> (not res!500249) (not e!415239))))

(assert (=> b!743130 (= res!500249 (and (= (size!20302 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20302 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20302 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!743131 () Bool)

(assert (=> b!743131 (= e!415245 e!415241)))

(declare-fun res!500257 () Bool)

(assert (=> b!743131 (=> (not res!500257) (not e!415241))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!743131 (= res!500257 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19881 a!3186) j!159) mask!3328) (select (arr!19881 a!3186) j!159) a!3186 mask!3328) lt!330122))))

(assert (=> b!743131 (= lt!330122 (Intermediate!7481 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!743132 () Bool)

(declare-fun res!500251 () Bool)

(assert (=> b!743132 (=> (not res!500251) (not e!415239))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41535 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!743132 (= res!500251 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!743133 () Bool)

(declare-fun res!500253 () Bool)

(assert (=> b!743133 (=> (not res!500253) (not e!415239))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!743133 (= res!500253 (validKeyInArray!0 (select (arr!19881 a!3186) j!159)))))

(declare-fun b!743134 () Bool)

(declare-fun res!500244 () Bool)

(assert (=> b!743134 (=> res!500244 e!415243)))

(declare-fun lt!330123 () (_ BitVec 64))

(assert (=> b!743134 (= res!500244 (or (not (= (select (store (arr!19881 a!3186) i!1173 k!2102) index!1321) lt!330123)) (undefined!8293 lt!330128)))))

(declare-fun b!743135 () Bool)

(assert (=> b!743135 (= e!415241 e!415240)))

(declare-fun res!500260 () Bool)

(assert (=> b!743135 (=> (not res!500260) (not e!415240))))

(declare-fun lt!330126 () SeekEntryResult!7481)

(assert (=> b!743135 (= res!500260 (= lt!330126 lt!330128))))

(declare-fun lt!330127 () array!41535)

(assert (=> b!743135 (= lt!330128 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330123 lt!330127 mask!3328))))

(assert (=> b!743135 (= lt!330126 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330123 mask!3328) lt!330123 lt!330127 mask!3328))))

(assert (=> b!743135 (= lt!330123 (select (store (arr!19881 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!743135 (= lt!330127 (array!41536 (store (arr!19881 a!3186) i!1173 k!2102) (size!20302 a!3186)))))

(declare-fun lt!330121 () SeekEntryResult!7481)

(declare-fun e!415242 () Bool)

(declare-fun b!743136 () Bool)

(assert (=> b!743136 (= e!415242 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19881 a!3186) j!159) a!3186 mask!3328) lt!330121))))

(declare-fun b!743137 () Bool)

(declare-fun res!500261 () Bool)

(assert (=> b!743137 (=> res!500261 e!415243)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41535 (_ BitVec 32)) SeekEntryResult!7481)

(assert (=> b!743137 (= res!500261 (not (= (seekEntryOrOpen!0 lt!330123 lt!330127 mask!3328) (Found!7481 index!1321))))))

(declare-fun b!743138 () Bool)

(assert (=> b!743138 (= e!415244 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19881 a!3186) j!159) a!3186 mask!3328) (Found!7481 j!159)))))

(declare-fun b!743139 () Bool)

(declare-fun res!500248 () Bool)

(assert (=> b!743139 (=> (not res!500248) (not e!415239))))

(assert (=> b!743139 (= res!500248 (validKeyInArray!0 k!2102))))

(declare-fun b!743140 () Bool)

(assert (=> b!743140 (= e!415239 e!415245)))

(declare-fun res!500259 () Bool)

(assert (=> b!743140 (=> (not res!500259) (not e!415245))))

(declare-fun lt!330125 () SeekEntryResult!7481)

(assert (=> b!743140 (= res!500259 (or (= lt!330125 (MissingZero!7481 i!1173)) (= lt!330125 (MissingVacant!7481 i!1173))))))

(assert (=> b!743140 (= lt!330125 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!743141 () Bool)

(assert (=> b!743141 (= e!415246 e!415242)))

(declare-fun res!500245 () Bool)

(assert (=> b!743141 (=> (not res!500245) (not e!415242))))

(assert (=> b!743141 (= res!500245 (= (seekEntryOrOpen!0 (select (arr!19881 a!3186) j!159) a!3186 mask!3328) lt!330121))))

(assert (=> b!743141 (= lt!330121 (Found!7481 j!159))))

(declare-fun b!743142 () Bool)

(declare-fun res!500252 () Bool)

(assert (=> b!743142 (=> (not res!500252) (not e!415241))))

(assert (=> b!743142 (= res!500252 e!415244)))

(declare-fun c!81820 () Bool)

(assert (=> b!743142 (= c!81820 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!65362 res!500246) b!743130))

(assert (= (and b!743130 res!500249) b!743133))

(assert (= (and b!743133 res!500253) b!743139))

(assert (= (and b!743139 res!500248) b!743132))

(assert (= (and b!743132 res!500251) b!743140))

(assert (= (and b!743140 res!500259) b!743125))

(assert (= (and b!743125 res!500255) b!743127))

(assert (= (and b!743127 res!500254) b!743124))

(assert (= (and b!743124 res!500256) b!743131))

(assert (= (and b!743131 res!500257) b!743123))

(assert (= (and b!743123 res!500243) b!743142))

(assert (= (and b!743142 c!81820) b!743129))

(assert (= (and b!743142 (not c!81820)) b!743138))

(assert (= (and b!743142 res!500252) b!743135))

(assert (= (and b!743135 res!500260) b!743126))

(assert (= (and b!743126 res!500250) b!743141))

(assert (= (and b!743141 res!500245) b!743136))

(assert (= (and b!743126 (not res!500258)) b!743122))

(assert (= (and b!743122 (not res!500247)) b!743134))

(assert (= (and b!743134 (not res!500244)) b!743137))

(assert (= (and b!743137 (not res!500261)) b!743128))

(declare-fun m!693871 () Bool)

(assert (=> b!743123 m!693871))

(declare-fun m!693873 () Bool)

(assert (=> b!743132 m!693873))

(declare-fun m!693875 () Bool)

(assert (=> b!743131 m!693875))

(assert (=> b!743131 m!693875))

(declare-fun m!693877 () Bool)

(assert (=> b!743131 m!693877))

(assert (=> b!743131 m!693877))

(assert (=> b!743131 m!693875))

(declare-fun m!693879 () Bool)

(assert (=> b!743131 m!693879))

(declare-fun m!693881 () Bool)

(assert (=> b!743134 m!693881))

(declare-fun m!693883 () Bool)

(assert (=> b!743134 m!693883))

(assert (=> b!743138 m!693875))

(assert (=> b!743138 m!693875))

(declare-fun m!693885 () Bool)

(assert (=> b!743138 m!693885))

(declare-fun m!693887 () Bool)

(assert (=> b!743139 m!693887))

(assert (=> b!743136 m!693875))

(assert (=> b!743136 m!693875))

(declare-fun m!693889 () Bool)

(assert (=> b!743136 m!693889))

(assert (=> b!743122 m!693875))

(assert (=> b!743122 m!693875))

(assert (=> b!743122 m!693885))

(declare-fun m!693891 () Bool)

(assert (=> start!65362 m!693891))

(declare-fun m!693893 () Bool)

(assert (=> start!65362 m!693893))

(declare-fun m!693895 () Bool)

(assert (=> b!743127 m!693895))

(declare-fun m!693897 () Bool)

(assert (=> b!743125 m!693897))

(assert (=> b!743133 m!693875))

(assert (=> b!743133 m!693875))

(declare-fun m!693899 () Bool)

(assert (=> b!743133 m!693899))

(assert (=> b!743141 m!693875))

(assert (=> b!743141 m!693875))

(declare-fun m!693901 () Bool)

(assert (=> b!743141 m!693901))

(declare-fun m!693903 () Bool)

(assert (=> b!743135 m!693903))

(assert (=> b!743135 m!693881))

(assert (=> b!743135 m!693903))

(declare-fun m!693905 () Bool)

(assert (=> b!743135 m!693905))

(declare-fun m!693907 () Bool)

(assert (=> b!743135 m!693907))

(declare-fun m!693909 () Bool)

(assert (=> b!743135 m!693909))

(assert (=> b!743129 m!693875))

(assert (=> b!743129 m!693875))

(declare-fun m!693911 () Bool)

(assert (=> b!743129 m!693911))

(declare-fun m!693913 () Bool)

(assert (=> b!743126 m!693913))

(declare-fun m!693915 () Bool)

(assert (=> b!743126 m!693915))

(declare-fun m!693917 () Bool)

(assert (=> b!743140 m!693917))

(declare-fun m!693919 () Bool)

(assert (=> b!743137 m!693919))

(push 1)

