; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64936 () Bool)

(assert start!64936)

(declare-fun b!733097 () Bool)

(declare-fun res!492630 () Bool)

(declare-fun e!410201 () Bool)

(assert (=> b!733097 (=> (not res!492630) (not e!410201))))

(declare-datatypes ((array!41247 0))(
  ( (array!41248 (arr!19740 (Array (_ BitVec 32) (_ BitVec 64))) (size!20161 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41247)

(declare-datatypes ((List!13742 0))(
  ( (Nil!13739) (Cons!13738 (h!14804 (_ BitVec 64)) (t!20057 List!13742)) )
))
(declare-fun arrayNoDuplicates!0 (array!41247 (_ BitVec 32) List!13742) Bool)

(assert (=> b!733097 (= res!492630 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13739))))

(declare-fun b!733098 () Bool)

(declare-fun e!410206 () Bool)

(declare-fun e!410204 () Bool)

(assert (=> b!733098 (= e!410206 e!410204)))

(declare-fun res!492623 () Bool)

(assert (=> b!733098 (=> res!492623 e!410204)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!733098 (= res!492623 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!324912 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!733098 (= lt!324912 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!733099 () Bool)

(declare-fun e!410203 () Bool)

(assert (=> b!733099 (= e!410203 e!410201)))

(declare-fun res!492625 () Bool)

(assert (=> b!733099 (=> (not res!492625) (not e!410201))))

(declare-datatypes ((SeekEntryResult!7340 0))(
  ( (MissingZero!7340 (index!31728 (_ BitVec 32))) (Found!7340 (index!31729 (_ BitVec 32))) (Intermediate!7340 (undefined!8152 Bool) (index!31730 (_ BitVec 32)) (x!62722 (_ BitVec 32))) (Undefined!7340) (MissingVacant!7340 (index!31731 (_ BitVec 32))) )
))
(declare-fun lt!324911 () SeekEntryResult!7340)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!733099 (= res!492625 (or (= lt!324911 (MissingZero!7340 i!1173)) (= lt!324911 (MissingVacant!7340 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41247 (_ BitVec 32)) SeekEntryResult!7340)

(assert (=> b!733099 (= lt!324911 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!733100 () Bool)

(declare-fun res!492619 () Bool)

(assert (=> b!733100 (=> (not res!492619) (not e!410201))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!733100 (= res!492619 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20161 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20161 a!3186))))))

(declare-fun res!492628 () Bool)

(assert (=> start!64936 (=> (not res!492628) (not e!410203))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64936 (= res!492628 (validMask!0 mask!3328))))

(assert (=> start!64936 e!410203))

(assert (=> start!64936 true))

(declare-fun array_inv!15536 (array!41247) Bool)

(assert (=> start!64936 (array_inv!15536 a!3186)))

(declare-fun b!733101 () Bool)

(declare-fun e!410208 () Bool)

(declare-fun e!410207 () Bool)

(assert (=> b!733101 (= e!410208 e!410207)))

(declare-fun res!492631 () Bool)

(assert (=> b!733101 (=> (not res!492631) (not e!410207))))

(declare-fun lt!324909 () SeekEntryResult!7340)

(declare-fun lt!324907 () SeekEntryResult!7340)

(assert (=> b!733101 (= res!492631 (= lt!324909 lt!324907))))

(declare-fun lt!324910 () array!41247)

(declare-fun lt!324913 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41247 (_ BitVec 32)) SeekEntryResult!7340)

(assert (=> b!733101 (= lt!324907 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324913 lt!324910 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!733101 (= lt!324909 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324913 mask!3328) lt!324913 lt!324910 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!733101 (= lt!324913 (select (store (arr!19740 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!733101 (= lt!324910 (array!41248 (store (arr!19740 a!3186) i!1173 k!2102) (size!20161 a!3186)))))

(declare-fun b!733102 () Bool)

(assert (=> b!733102 (= e!410207 (not e!410206))))

(declare-fun res!492624 () Bool)

(assert (=> b!733102 (=> res!492624 e!410206)))

(assert (=> b!733102 (= res!492624 (or (not (is-Intermediate!7340 lt!324907)) (bvsge x!1131 (x!62722 lt!324907))))))

(declare-fun e!410202 () Bool)

(assert (=> b!733102 e!410202))

(declare-fun res!492626 () Bool)

(assert (=> b!733102 (=> (not res!492626) (not e!410202))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41247 (_ BitVec 32)) Bool)

(assert (=> b!733102 (= res!492626 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24998 0))(
  ( (Unit!24999) )
))
(declare-fun lt!324908 () Unit!24998)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41247 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24998)

(assert (=> b!733102 (= lt!324908 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!733103 () Bool)

(declare-fun res!492622 () Bool)

(assert (=> b!733103 (=> (not res!492622) (not e!410203))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!733103 (= res!492622 (validKeyInArray!0 k!2102))))

(declare-fun b!733104 () Bool)

(declare-fun res!492632 () Bool)

(assert (=> b!733104 (=> (not res!492632) (not e!410201))))

(assert (=> b!733104 (= res!492632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun lt!324906 () SeekEntryResult!7340)

(declare-fun b!733105 () Bool)

(declare-fun e!410210 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41247 (_ BitVec 32)) SeekEntryResult!7340)

(assert (=> b!733105 (= e!410210 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19740 a!3186) j!159) a!3186 mask!3328) lt!324906))))

(declare-fun b!733106 () Bool)

(assert (=> b!733106 (= e!410202 e!410210)))

(declare-fun res!492629 () Bool)

(assert (=> b!733106 (=> (not res!492629) (not e!410210))))

(assert (=> b!733106 (= res!492629 (= (seekEntryOrOpen!0 (select (arr!19740 a!3186) j!159) a!3186 mask!3328) lt!324906))))

(assert (=> b!733106 (= lt!324906 (Found!7340 j!159))))

(declare-fun e!410205 () Bool)

(declare-fun lt!324914 () SeekEntryResult!7340)

(declare-fun b!733107 () Bool)

(assert (=> b!733107 (= e!410205 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19740 a!3186) j!159) a!3186 mask!3328) lt!324914))))

(declare-fun b!733108 () Bool)

(declare-fun res!492620 () Bool)

(assert (=> b!733108 (=> (not res!492620) (not e!410208))))

(assert (=> b!733108 (= res!492620 e!410205)))

(declare-fun c!80617 () Bool)

(assert (=> b!733108 (= c!80617 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!733109 () Bool)

(assert (=> b!733109 (= e!410201 e!410208)))

(declare-fun res!492635 () Bool)

(assert (=> b!733109 (=> (not res!492635) (not e!410208))))

(assert (=> b!733109 (= res!492635 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19740 a!3186) j!159) mask!3328) (select (arr!19740 a!3186) j!159) a!3186 mask!3328) lt!324914))))

(assert (=> b!733109 (= lt!324914 (Intermediate!7340 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!733110 () Bool)

(declare-fun res!492621 () Bool)

(assert (=> b!733110 (=> (not res!492621) (not e!410203))))

(assert (=> b!733110 (= res!492621 (validKeyInArray!0 (select (arr!19740 a!3186) j!159)))))

(declare-fun b!733111 () Bool)

(declare-fun res!492627 () Bool)

(assert (=> b!733111 (=> (not res!492627) (not e!410208))))

(assert (=> b!733111 (= res!492627 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19740 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!733112 () Bool)

(declare-fun res!492633 () Bool)

(assert (=> b!733112 (=> (not res!492633) (not e!410203))))

(declare-fun arrayContainsKey!0 (array!41247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!733112 (= res!492633 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!733113 () Bool)

(assert (=> b!733113 (= e!410205 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19740 a!3186) j!159) a!3186 mask!3328) (Found!7340 j!159)))))

(declare-fun b!733114 () Bool)

(assert (=> b!733114 (= e!410204 (bvsge mask!3328 #b00000000000000000000000000000000))))

(declare-fun b!733115 () Bool)

(declare-fun res!492634 () Bool)

(assert (=> b!733115 (=> res!492634 e!410204)))

(assert (=> b!733115 (= res!492634 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19740 a!3186) j!159) a!3186 mask!3328) (Found!7340 j!159)))))

(declare-fun b!733116 () Bool)

(declare-fun res!492618 () Bool)

(assert (=> b!733116 (=> (not res!492618) (not e!410203))))

(assert (=> b!733116 (= res!492618 (and (= (size!20161 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20161 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20161 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!64936 res!492628) b!733116))

(assert (= (and b!733116 res!492618) b!733110))

(assert (= (and b!733110 res!492621) b!733103))

(assert (= (and b!733103 res!492622) b!733112))

(assert (= (and b!733112 res!492633) b!733099))

(assert (= (and b!733099 res!492625) b!733104))

(assert (= (and b!733104 res!492632) b!733097))

(assert (= (and b!733097 res!492630) b!733100))

(assert (= (and b!733100 res!492619) b!733109))

(assert (= (and b!733109 res!492635) b!733111))

(assert (= (and b!733111 res!492627) b!733108))

(assert (= (and b!733108 c!80617) b!733107))

(assert (= (and b!733108 (not c!80617)) b!733113))

(assert (= (and b!733108 res!492620) b!733101))

(assert (= (and b!733101 res!492631) b!733102))

(assert (= (and b!733102 res!492626) b!733106))

(assert (= (and b!733106 res!492629) b!733105))

(assert (= (and b!733102 (not res!492624)) b!733098))

(assert (= (and b!733098 (not res!492623)) b!733115))

(assert (= (and b!733115 (not res!492634)) b!733114))

(declare-fun m!686047 () Bool)

(assert (=> b!733098 m!686047))

(declare-fun m!686049 () Bool)

(assert (=> start!64936 m!686049))

(declare-fun m!686051 () Bool)

(assert (=> start!64936 m!686051))

(declare-fun m!686053 () Bool)

(assert (=> b!733109 m!686053))

(assert (=> b!733109 m!686053))

(declare-fun m!686055 () Bool)

(assert (=> b!733109 m!686055))

(assert (=> b!733109 m!686055))

(assert (=> b!733109 m!686053))

(declare-fun m!686057 () Bool)

(assert (=> b!733109 m!686057))

(assert (=> b!733105 m!686053))

(assert (=> b!733105 m!686053))

(declare-fun m!686059 () Bool)

(assert (=> b!733105 m!686059))

(declare-fun m!686061 () Bool)

(assert (=> b!733104 m!686061))

(declare-fun m!686063 () Bool)

(assert (=> b!733101 m!686063))

(assert (=> b!733101 m!686063))

(declare-fun m!686065 () Bool)

(assert (=> b!733101 m!686065))

(declare-fun m!686067 () Bool)

(assert (=> b!733101 m!686067))

(declare-fun m!686069 () Bool)

(assert (=> b!733101 m!686069))

(declare-fun m!686071 () Bool)

(assert (=> b!733101 m!686071))

(declare-fun m!686073 () Bool)

(assert (=> b!733097 m!686073))

(assert (=> b!733106 m!686053))

(assert (=> b!733106 m!686053))

(declare-fun m!686075 () Bool)

(assert (=> b!733106 m!686075))

(assert (=> b!733113 m!686053))

(assert (=> b!733113 m!686053))

(declare-fun m!686077 () Bool)

(assert (=> b!733113 m!686077))

(assert (=> b!733107 m!686053))

(assert (=> b!733107 m!686053))

(declare-fun m!686079 () Bool)

(assert (=> b!733107 m!686079))

(declare-fun m!686081 () Bool)

(assert (=> b!733111 m!686081))

(declare-fun m!686083 () Bool)

(assert (=> b!733112 m!686083))

(declare-fun m!686085 () Bool)

(assert (=> b!733099 m!686085))

(assert (=> b!733115 m!686053))

(assert (=> b!733115 m!686053))

(assert (=> b!733115 m!686077))

(declare-fun m!686087 () Bool)

(assert (=> b!733103 m!686087))

(assert (=> b!733110 m!686053))

(assert (=> b!733110 m!686053))

(declare-fun m!686089 () Bool)

(assert (=> b!733110 m!686089))

(declare-fun m!686091 () Bool)

(assert (=> b!733102 m!686091))

(declare-fun m!686093 () Bool)

(assert (=> b!733102 m!686093))

(push 1)

