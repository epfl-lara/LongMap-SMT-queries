; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64682 () Bool)

(assert start!64682)

(declare-fun b!729172 () Bool)

(declare-fun res!489615 () Bool)

(declare-fun e!408136 () Bool)

(assert (=> b!729172 (=> (not res!489615) (not e!408136))))

(declare-datatypes ((array!41131 0))(
  ( (array!41132 (arr!19685 (Array (_ BitVec 32) (_ BitVec 64))) (size!20106 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41131)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!729172 (= res!489615 (and (= (size!20106 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20106 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20106 a!3186)) (not (= i!1173 j!159))))))

(declare-datatypes ((SeekEntryResult!7285 0))(
  ( (MissingZero!7285 (index!31508 (_ BitVec 32))) (Found!7285 (index!31509 (_ BitVec 32))) (Intermediate!7285 (undefined!8097 Bool) (index!31510 (_ BitVec 32)) (x!62491 (_ BitVec 32))) (Undefined!7285) (MissingVacant!7285 (index!31511 (_ BitVec 32))) )
))
(declare-fun lt!323034 () SeekEntryResult!7285)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!408133 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!729174 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41131 (_ BitVec 32)) SeekEntryResult!7285)

(assert (=> b!729174 (= e!408133 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19685 a!3186) j!159) a!3186 mask!3328) lt!323034))))

(declare-fun b!729175 () Bool)

(declare-fun e!408135 () Bool)

(assert (=> b!729175 (= e!408135 e!408133)))

(declare-fun res!489614 () Bool)

(assert (=> b!729175 (=> (not res!489614) (not e!408133))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41131 (_ BitVec 32)) SeekEntryResult!7285)

(assert (=> b!729175 (= res!489614 (= (seekEntryOrOpen!0 (select (arr!19685 a!3186) j!159) a!3186 mask!3328) lt!323034))))

(assert (=> b!729175 (= lt!323034 (Found!7285 j!159))))

(declare-fun e!408131 () Bool)

(declare-fun lt!323028 () SeekEntryResult!7285)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!729176 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41131 (_ BitVec 32)) SeekEntryResult!7285)

(assert (=> b!729176 (= e!408131 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19685 a!3186) j!159) a!3186 mask!3328) lt!323028))))

(declare-fun b!729177 () Bool)

(declare-fun res!489610 () Bool)

(assert (=> b!729177 (=> (not res!489610) (not e!408136))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!729177 (= res!489610 (validKeyInArray!0 k!2102))))

(declare-fun b!729178 () Bool)

(declare-fun e!408129 () Bool)

(declare-fun e!408134 () Bool)

(assert (=> b!729178 (= e!408129 e!408134)))

(declare-fun res!489605 () Bool)

(assert (=> b!729178 (=> (not res!489605) (not e!408134))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729178 (= res!489605 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19685 a!3186) j!159) mask!3328) (select (arr!19685 a!3186) j!159) a!3186 mask!3328) lt!323028))))

(assert (=> b!729178 (= lt!323028 (Intermediate!7285 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!729179 () Bool)

(declare-fun res!489619 () Bool)

(assert (=> b!729179 (=> (not res!489619) (not e!408129))))

(assert (=> b!729179 (= res!489619 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20106 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20106 a!3186))))))

(declare-fun b!729180 () Bool)

(declare-fun res!489618 () Bool)

(assert (=> b!729180 (=> (not res!489618) (not e!408134))))

(assert (=> b!729180 (= res!489618 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19685 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!729181 () Bool)

(assert (=> b!729181 (= e!408131 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19685 a!3186) j!159) a!3186 mask!3328) (Found!7285 j!159)))))

(declare-fun b!729182 () Bool)

(declare-fun res!489611 () Bool)

(assert (=> b!729182 (=> (not res!489611) (not e!408129))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41131 (_ BitVec 32)) Bool)

(assert (=> b!729182 (= res!489611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!729183 () Bool)

(declare-fun res!489606 () Bool)

(assert (=> b!729183 (=> (not res!489606) (not e!408136))))

(declare-fun arrayContainsKey!0 (array!41131 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!729183 (= res!489606 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!729184 () Bool)

(declare-fun res!489620 () Bool)

(assert (=> b!729184 (=> (not res!489620) (not e!408134))))

(assert (=> b!729184 (= res!489620 e!408131)))

(declare-fun c!80158 () Bool)

(assert (=> b!729184 (= c!80158 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!729185 () Bool)

(declare-fun e!408130 () Bool)

(declare-fun e!408132 () Bool)

(assert (=> b!729185 (= e!408130 (not e!408132))))

(declare-fun res!489609 () Bool)

(assert (=> b!729185 (=> res!489609 e!408132)))

(declare-fun lt!323036 () SeekEntryResult!7285)

(assert (=> b!729185 (= res!489609 (or (not (is-Intermediate!7285 lt!323036)) (bvsge x!1131 (x!62491 lt!323036))))))

(assert (=> b!729185 e!408135))

(declare-fun res!489613 () Bool)

(assert (=> b!729185 (=> (not res!489613) (not e!408135))))

(assert (=> b!729185 (= res!489613 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24888 0))(
  ( (Unit!24889) )
))
(declare-fun lt!323031 () Unit!24888)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41131 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24888)

(assert (=> b!729185 (= lt!323031 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!729186 () Bool)

(declare-fun res!489607 () Bool)

(assert (=> b!729186 (=> (not res!489607) (not e!408136))))

(assert (=> b!729186 (= res!489607 (validKeyInArray!0 (select (arr!19685 a!3186) j!159)))))

(declare-fun b!729187 () Bool)

(assert (=> b!729187 (= e!408134 e!408130)))

(declare-fun res!489612 () Bool)

(assert (=> b!729187 (=> (not res!489612) (not e!408130))))

(declare-fun lt!323029 () SeekEntryResult!7285)

(assert (=> b!729187 (= res!489612 (= lt!323029 lt!323036))))

(declare-fun lt!323035 () (_ BitVec 64))

(declare-fun lt!323032 () array!41131)

(assert (=> b!729187 (= lt!323036 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323035 lt!323032 mask!3328))))

(assert (=> b!729187 (= lt!323029 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323035 mask!3328) lt!323035 lt!323032 mask!3328))))

(assert (=> b!729187 (= lt!323035 (select (store (arr!19685 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!729187 (= lt!323032 (array!41132 (store (arr!19685 a!3186) i!1173 k!2102) (size!20106 a!3186)))))

(declare-fun b!729173 () Bool)

(assert (=> b!729173 (= e!408136 e!408129)))

(declare-fun res!489608 () Bool)

(assert (=> b!729173 (=> (not res!489608) (not e!408129))))

(declare-fun lt!323033 () SeekEntryResult!7285)

(assert (=> b!729173 (= res!489608 (or (= lt!323033 (MissingZero!7285 i!1173)) (= lt!323033 (MissingVacant!7285 i!1173))))))

(assert (=> b!729173 (= lt!323033 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!489617 () Bool)

(assert (=> start!64682 (=> (not res!489617) (not e!408136))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64682 (= res!489617 (validMask!0 mask!3328))))

(assert (=> start!64682 e!408136))

(assert (=> start!64682 true))

(declare-fun array_inv!15481 (array!41131) Bool)

(assert (=> start!64682 (array_inv!15481 a!3186)))

(declare-fun b!729188 () Bool)

(declare-fun res!489616 () Bool)

(assert (=> b!729188 (=> (not res!489616) (not e!408129))))

(declare-datatypes ((List!13687 0))(
  ( (Nil!13684) (Cons!13683 (h!14743 (_ BitVec 64)) (t!20002 List!13687)) )
))
(declare-fun arrayNoDuplicates!0 (array!41131 (_ BitVec 32) List!13687) Bool)

(assert (=> b!729188 (= res!489616 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13684))))

(declare-fun b!729189 () Bool)

(assert (=> b!729189 (= e!408132 true)))

(declare-fun lt!323030 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729189 (= lt!323030 (nextIndex!0 index!1321 x!1131 mask!3328))))

(assert (= (and start!64682 res!489617) b!729172))

(assert (= (and b!729172 res!489615) b!729186))

(assert (= (and b!729186 res!489607) b!729177))

(assert (= (and b!729177 res!489610) b!729183))

(assert (= (and b!729183 res!489606) b!729173))

(assert (= (and b!729173 res!489608) b!729182))

(assert (= (and b!729182 res!489611) b!729188))

(assert (= (and b!729188 res!489616) b!729179))

(assert (= (and b!729179 res!489619) b!729178))

(assert (= (and b!729178 res!489605) b!729180))

(assert (= (and b!729180 res!489618) b!729184))

(assert (= (and b!729184 c!80158) b!729176))

(assert (= (and b!729184 (not c!80158)) b!729181))

(assert (= (and b!729184 res!489620) b!729187))

(assert (= (and b!729187 res!489612) b!729185))

(assert (= (and b!729185 res!489613) b!729175))

(assert (= (and b!729175 res!489614) b!729174))

(assert (= (and b!729185 (not res!489609)) b!729189))

(declare-fun m!682843 () Bool)

(assert (=> b!729174 m!682843))

(assert (=> b!729174 m!682843))

(declare-fun m!682845 () Bool)

(assert (=> b!729174 m!682845))

(assert (=> b!729176 m!682843))

(assert (=> b!729176 m!682843))

(declare-fun m!682847 () Bool)

(assert (=> b!729176 m!682847))

(declare-fun m!682849 () Bool)

(assert (=> b!729177 m!682849))

(assert (=> b!729175 m!682843))

(assert (=> b!729175 m!682843))

(declare-fun m!682851 () Bool)

(assert (=> b!729175 m!682851))

(declare-fun m!682853 () Bool)

(assert (=> b!729173 m!682853))

(declare-fun m!682855 () Bool)

(assert (=> b!729180 m!682855))

(assert (=> b!729178 m!682843))

(assert (=> b!729178 m!682843))

(declare-fun m!682857 () Bool)

(assert (=> b!729178 m!682857))

(assert (=> b!729178 m!682857))

(assert (=> b!729178 m!682843))

(declare-fun m!682859 () Bool)

(assert (=> b!729178 m!682859))

(assert (=> b!729181 m!682843))

(assert (=> b!729181 m!682843))

(declare-fun m!682861 () Bool)

(assert (=> b!729181 m!682861))

(assert (=> b!729186 m!682843))

(assert (=> b!729186 m!682843))

(declare-fun m!682863 () Bool)

(assert (=> b!729186 m!682863))

(declare-fun m!682865 () Bool)

(assert (=> b!729187 m!682865))

(declare-fun m!682867 () Bool)

(assert (=> b!729187 m!682867))

(assert (=> b!729187 m!682865))

(declare-fun m!682869 () Bool)

(assert (=> b!729187 m!682869))

(declare-fun m!682871 () Bool)

(assert (=> b!729187 m!682871))

(declare-fun m!682873 () Bool)

(assert (=> b!729187 m!682873))

(declare-fun m!682875 () Bool)

(assert (=> b!729189 m!682875))

(declare-fun m!682877 () Bool)

(assert (=> b!729182 m!682877))

(declare-fun m!682879 () Bool)

(assert (=> b!729183 m!682879))

(declare-fun m!682881 () Bool)

(assert (=> start!64682 m!682881))

(declare-fun m!682883 () Bool)

(assert (=> start!64682 m!682883))

(declare-fun m!682885 () Bool)

(assert (=> b!729188 m!682885))

(declare-fun m!682887 () Bool)

(assert (=> b!729185 m!682887))

(declare-fun m!682889 () Bool)

(assert (=> b!729185 m!682889))

(push 1)

