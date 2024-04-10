; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64306 () Bool)

(assert start!64306)

(declare-fun b!722435 () Bool)

(declare-fun res!484155 () Bool)

(declare-fun e!404928 () Bool)

(assert (=> b!722435 (=> (not res!484155) (not e!404928))))

(declare-datatypes ((array!40887 0))(
  ( (array!40888 (arr!19566 (Array (_ BitVec 32) (_ BitVec 64))) (size!19987 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40887)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722435 (= res!484155 (validKeyInArray!0 (select (arr!19566 a!3186) j!159)))))

(declare-fun b!722436 () Bool)

(declare-fun res!484150 () Bool)

(declare-fun e!404930 () Bool)

(assert (=> b!722436 (=> (not res!484150) (not e!404930))))

(declare-datatypes ((List!13568 0))(
  ( (Nil!13565) (Cons!13564 (h!14618 (_ BitVec 64)) (t!19883 List!13568)) )
))
(declare-fun arrayNoDuplicates!0 (array!40887 (_ BitVec 32) List!13568) Bool)

(assert (=> b!722436 (= res!484150 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13565))))

(declare-fun res!484148 () Bool)

(assert (=> start!64306 (=> (not res!484148) (not e!404928))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64306 (= res!484148 (validMask!0 mask!3328))))

(assert (=> start!64306 e!404928))

(assert (=> start!64306 true))

(declare-fun array_inv!15362 (array!40887) Bool)

(assert (=> start!64306 (array_inv!15362 a!3186)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!404929 () Bool)

(declare-fun b!722437 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7166 0))(
  ( (MissingZero!7166 (index!31032 (_ BitVec 32))) (Found!7166 (index!31033 (_ BitVec 32))) (Intermediate!7166 (undefined!7978 Bool) (index!31034 (_ BitVec 32)) (x!62039 (_ BitVec 32))) (Undefined!7166) (MissingVacant!7166 (index!31035 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40887 (_ BitVec 32)) SeekEntryResult!7166)

(assert (=> b!722437 (= e!404929 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19566 a!3186) j!159) a!3186 mask!3328) (Found!7166 j!159)))))

(declare-fun b!722438 () Bool)

(declare-fun res!484157 () Bool)

(assert (=> b!722438 (=> (not res!484157) (not e!404928))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40887 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722438 (= res!484157 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!722439 () Bool)

(declare-fun res!484153 () Bool)

(declare-fun e!404927 () Bool)

(assert (=> b!722439 (=> (not res!484153) (not e!404927))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!722439 (= res!484153 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19566 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!722440 () Bool)

(assert (=> b!722440 (= e!404927 false)))

(declare-fun lt!320280 () array!40887)

(declare-fun lt!320279 () SeekEntryResult!7166)

(declare-fun lt!320282 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40887 (_ BitVec 32)) SeekEntryResult!7166)

(assert (=> b!722440 (= lt!320279 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320282 lt!320280 mask!3328))))

(declare-fun lt!320281 () SeekEntryResult!7166)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722440 (= lt!320281 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320282 mask!3328) lt!320282 lt!320280 mask!3328))))

(assert (=> b!722440 (= lt!320282 (select (store (arr!19566 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!722440 (= lt!320280 (array!40888 (store (arr!19566 a!3186) i!1173 k!2102) (size!19987 a!3186)))))

(declare-fun b!722441 () Bool)

(declare-fun res!484149 () Bool)

(assert (=> b!722441 (=> (not res!484149) (not e!404930))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40887 (_ BitVec 32)) Bool)

(assert (=> b!722441 (= res!484149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!722442 () Bool)

(assert (=> b!722442 (= e!404930 e!404927)))

(declare-fun res!484151 () Bool)

(assert (=> b!722442 (=> (not res!484151) (not e!404927))))

(declare-fun lt!320278 () SeekEntryResult!7166)

(assert (=> b!722442 (= res!484151 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19566 a!3186) j!159) mask!3328) (select (arr!19566 a!3186) j!159) a!3186 mask!3328) lt!320278))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!722442 (= lt!320278 (Intermediate!7166 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!722443 () Bool)

(declare-fun res!484154 () Bool)

(assert (=> b!722443 (=> (not res!484154) (not e!404927))))

(assert (=> b!722443 (= res!484154 e!404929)))

(declare-fun c!79516 () Bool)

(assert (=> b!722443 (= c!79516 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!722444 () Bool)

(assert (=> b!722444 (= e!404928 e!404930)))

(declare-fun res!484152 () Bool)

(assert (=> b!722444 (=> (not res!484152) (not e!404930))))

(declare-fun lt!320277 () SeekEntryResult!7166)

(assert (=> b!722444 (= res!484152 (or (= lt!320277 (MissingZero!7166 i!1173)) (= lt!320277 (MissingVacant!7166 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40887 (_ BitVec 32)) SeekEntryResult!7166)

(assert (=> b!722444 (= lt!320277 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!722445 () Bool)

(declare-fun res!484146 () Bool)

(assert (=> b!722445 (=> (not res!484146) (not e!404928))))

(assert (=> b!722445 (= res!484146 (and (= (size!19987 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19987 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19987 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!722446 () Bool)

(assert (=> b!722446 (= e!404929 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19566 a!3186) j!159) a!3186 mask!3328) lt!320278))))

(declare-fun b!722447 () Bool)

(declare-fun res!484147 () Bool)

(assert (=> b!722447 (=> (not res!484147) (not e!404930))))

(assert (=> b!722447 (= res!484147 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19987 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19987 a!3186))))))

(declare-fun b!722448 () Bool)

(declare-fun res!484156 () Bool)

(assert (=> b!722448 (=> (not res!484156) (not e!404928))))

(assert (=> b!722448 (= res!484156 (validKeyInArray!0 k!2102))))

(assert (= (and start!64306 res!484148) b!722445))

(assert (= (and b!722445 res!484146) b!722435))

(assert (= (and b!722435 res!484155) b!722448))

(assert (= (and b!722448 res!484156) b!722438))

(assert (= (and b!722438 res!484157) b!722444))

(assert (= (and b!722444 res!484152) b!722441))

(assert (= (and b!722441 res!484149) b!722436))

(assert (= (and b!722436 res!484150) b!722447))

(assert (= (and b!722447 res!484147) b!722442))

(assert (= (and b!722442 res!484151) b!722439))

(assert (= (and b!722439 res!484153) b!722443))

(assert (= (and b!722443 c!79516) b!722446))

(assert (= (and b!722443 (not c!79516)) b!722437))

(assert (= (and b!722443 res!484154) b!722440))

(declare-fun m!676963 () Bool)

(assert (=> b!722442 m!676963))

(assert (=> b!722442 m!676963))

(declare-fun m!676965 () Bool)

(assert (=> b!722442 m!676965))

(assert (=> b!722442 m!676965))

(assert (=> b!722442 m!676963))

(declare-fun m!676967 () Bool)

(assert (=> b!722442 m!676967))

(declare-fun m!676969 () Bool)

(assert (=> b!722439 m!676969))

(declare-fun m!676971 () Bool)

(assert (=> b!722438 m!676971))

(assert (=> b!722435 m!676963))

(assert (=> b!722435 m!676963))

(declare-fun m!676973 () Bool)

(assert (=> b!722435 m!676973))

(assert (=> b!722446 m!676963))

(assert (=> b!722446 m!676963))

(declare-fun m!676975 () Bool)

(assert (=> b!722446 m!676975))

(declare-fun m!676977 () Bool)

(assert (=> b!722441 m!676977))

(declare-fun m!676979 () Bool)

(assert (=> b!722436 m!676979))

(declare-fun m!676981 () Bool)

(assert (=> b!722440 m!676981))

(assert (=> b!722440 m!676981))

(declare-fun m!676983 () Bool)

(assert (=> b!722440 m!676983))

(declare-fun m!676985 () Bool)

(assert (=> b!722440 m!676985))

(declare-fun m!676987 () Bool)

(assert (=> b!722440 m!676987))

(declare-fun m!676989 () Bool)

(assert (=> b!722440 m!676989))

(declare-fun m!676991 () Bool)

(assert (=> b!722444 m!676991))

(declare-fun m!676993 () Bool)

(assert (=> start!64306 m!676993))

(declare-fun m!676995 () Bool)

(assert (=> start!64306 m!676995))

(assert (=> b!722437 m!676963))

(assert (=> b!722437 m!676963))

(declare-fun m!676997 () Bool)

(assert (=> b!722437 m!676997))

(declare-fun m!676999 () Bool)

(assert (=> b!722448 m!676999))

(push 1)

