; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64854 () Bool)

(assert start!64854)

(declare-fun b!731105 () Bool)

(declare-fun e!409204 () Bool)

(declare-fun e!409203 () Bool)

(assert (=> b!731105 (= e!409204 (not e!409203))))

(declare-fun res!490970 () Bool)

(assert (=> b!731105 (=> res!490970 e!409203)))

(declare-datatypes ((SeekEntryResult!7258 0))(
  ( (MissingZero!7258 (index!31400 (_ BitVec 32))) (Found!7258 (index!31401 (_ BitVec 32))) (Intermediate!7258 (undefined!8070 Bool) (index!31402 (_ BitVec 32)) (x!62540 (_ BitVec 32))) (Undefined!7258) (MissingVacant!7258 (index!31403 (_ BitVec 32))) )
))
(declare-fun lt!323939 () SeekEntryResult!7258)

(declare-fun x!1131 () (_ BitVec 32))

(get-info :version)

(assert (=> b!731105 (= res!490970 (or (not ((_ is Intermediate!7258) lt!323939)) (bvsge x!1131 (x!62540 lt!323939))))))

(declare-fun e!409209 () Bool)

(assert (=> b!731105 e!409209))

(declare-fun res!490974 () Bool)

(assert (=> b!731105 (=> (not res!490974) (not e!409209))))

(declare-datatypes ((array!41173 0))(
  ( (array!41174 (arr!19702 (Array (_ BitVec 32) (_ BitVec 64))) (size!20122 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41173)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41173 (_ BitVec 32)) Bool)

(assert (=> b!731105 (= res!490974 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24913 0))(
  ( (Unit!24914) )
))
(declare-fun lt!323938 () Unit!24913)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41173 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24913)

(assert (=> b!731105 (= lt!323938 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!731106 () Bool)

(declare-fun res!490980 () Bool)

(declare-fun e!409207 () Bool)

(assert (=> b!731106 (=> (not res!490980) (not e!409207))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!731106 (= res!490980 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20122 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20122 a!3186))))))

(declare-fun b!731107 () Bool)

(declare-fun e!409206 () Bool)

(assert (=> b!731107 (= e!409206 e!409207)))

(declare-fun res!490976 () Bool)

(assert (=> b!731107 (=> (not res!490976) (not e!409207))))

(declare-fun lt!323942 () SeekEntryResult!7258)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!731107 (= res!490976 (or (= lt!323942 (MissingZero!7258 i!1173)) (= lt!323942 (MissingVacant!7258 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41173 (_ BitVec 32)) SeekEntryResult!7258)

(assert (=> b!731107 (= lt!323942 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!731108 () Bool)

(declare-fun res!490981 () Bool)

(declare-fun e!409205 () Bool)

(assert (=> b!731108 (=> (not res!490981) (not e!409205))))

(assert (=> b!731108 (= res!490981 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19702 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!731109 () Bool)

(declare-fun e!409208 () Bool)

(assert (=> b!731109 (= e!409209 e!409208)))

(declare-fun res!490969 () Bool)

(assert (=> b!731109 (=> (not res!490969) (not e!409208))))

(declare-fun lt!323937 () SeekEntryResult!7258)

(assert (=> b!731109 (= res!490969 (= (seekEntryOrOpen!0 (select (arr!19702 a!3186) j!159) a!3186 mask!3328) lt!323937))))

(assert (=> b!731109 (= lt!323937 (Found!7258 j!159))))

(declare-fun b!731110 () Bool)

(declare-fun res!490978 () Bool)

(assert (=> b!731110 (=> (not res!490978) (not e!409206))))

(declare-fun arrayContainsKey!0 (array!41173 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!731110 (= res!490978 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!731111 () Bool)

(declare-fun res!490968 () Bool)

(assert (=> b!731111 (=> (not res!490968) (not e!409205))))

(declare-fun e!409202 () Bool)

(assert (=> b!731111 (= res!490968 e!409202)))

(declare-fun c!80447 () Bool)

(assert (=> b!731111 (= c!80447 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!731112 () Bool)

(declare-fun res!490977 () Bool)

(assert (=> b!731112 (=> (not res!490977) (not e!409207))))

(assert (=> b!731112 (= res!490977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!731113 () Bool)

(assert (=> b!731113 (= e!409203 true)))

(declare-fun lt!323936 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!731113 (= lt!323936 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!731114 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41173 (_ BitVec 32)) SeekEntryResult!7258)

(assert (=> b!731114 (= e!409208 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19702 a!3186) j!159) a!3186 mask!3328) lt!323937))))

(declare-fun b!731115 () Bool)

(declare-fun res!490967 () Bool)

(assert (=> b!731115 (=> (not res!490967) (not e!409206))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!731115 (= res!490967 (validKeyInArray!0 (select (arr!19702 a!3186) j!159)))))

(declare-fun b!731116 () Bool)

(declare-fun res!490979 () Bool)

(assert (=> b!731116 (=> (not res!490979) (not e!409206))))

(assert (=> b!731116 (= res!490979 (and (= (size!20122 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20122 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20122 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!490966 () Bool)

(assert (=> start!64854 (=> (not res!490966) (not e!409206))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64854 (= res!490966 (validMask!0 mask!3328))))

(assert (=> start!64854 e!409206))

(assert (=> start!64854 true))

(declare-fun array_inv!15561 (array!41173) Bool)

(assert (=> start!64854 (array_inv!15561 a!3186)))

(declare-fun b!731117 () Bool)

(declare-fun res!490972 () Bool)

(assert (=> b!731117 (=> (not res!490972) (not e!409207))))

(declare-datatypes ((List!13611 0))(
  ( (Nil!13608) (Cons!13607 (h!14673 (_ BitVec 64)) (t!19918 List!13611)) )
))
(declare-fun arrayNoDuplicates!0 (array!41173 (_ BitVec 32) List!13611) Bool)

(assert (=> b!731117 (= res!490972 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13608))))

(declare-fun b!731118 () Bool)

(assert (=> b!731118 (= e!409202 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19702 a!3186) j!159) a!3186 mask!3328) (Found!7258 j!159)))))

(declare-fun lt!323943 () SeekEntryResult!7258)

(declare-fun b!731119 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41173 (_ BitVec 32)) SeekEntryResult!7258)

(assert (=> b!731119 (= e!409202 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19702 a!3186) j!159) a!3186 mask!3328) lt!323943))))

(declare-fun b!731120 () Bool)

(declare-fun res!490971 () Bool)

(assert (=> b!731120 (=> (not res!490971) (not e!409206))))

(assert (=> b!731120 (= res!490971 (validKeyInArray!0 k0!2102))))

(declare-fun b!731121 () Bool)

(assert (=> b!731121 (= e!409207 e!409205)))

(declare-fun res!490975 () Bool)

(assert (=> b!731121 (=> (not res!490975) (not e!409205))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!731121 (= res!490975 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19702 a!3186) j!159) mask!3328) (select (arr!19702 a!3186) j!159) a!3186 mask!3328) lt!323943))))

(assert (=> b!731121 (= lt!323943 (Intermediate!7258 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!731122 () Bool)

(assert (=> b!731122 (= e!409205 e!409204)))

(declare-fun res!490973 () Bool)

(assert (=> b!731122 (=> (not res!490973) (not e!409204))))

(declare-fun lt!323935 () SeekEntryResult!7258)

(assert (=> b!731122 (= res!490973 (= lt!323935 lt!323939))))

(declare-fun lt!323940 () array!41173)

(declare-fun lt!323941 () (_ BitVec 64))

(assert (=> b!731122 (= lt!323939 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323941 lt!323940 mask!3328))))

(assert (=> b!731122 (= lt!323935 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323941 mask!3328) lt!323941 lt!323940 mask!3328))))

(assert (=> b!731122 (= lt!323941 (select (store (arr!19702 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!731122 (= lt!323940 (array!41174 (store (arr!19702 a!3186) i!1173 k0!2102) (size!20122 a!3186)))))

(assert (= (and start!64854 res!490966) b!731116))

(assert (= (and b!731116 res!490979) b!731115))

(assert (= (and b!731115 res!490967) b!731120))

(assert (= (and b!731120 res!490971) b!731110))

(assert (= (and b!731110 res!490978) b!731107))

(assert (= (and b!731107 res!490976) b!731112))

(assert (= (and b!731112 res!490977) b!731117))

(assert (= (and b!731117 res!490972) b!731106))

(assert (= (and b!731106 res!490980) b!731121))

(assert (= (and b!731121 res!490975) b!731108))

(assert (= (and b!731108 res!490981) b!731111))

(assert (= (and b!731111 c!80447) b!731119))

(assert (= (and b!731111 (not c!80447)) b!731118))

(assert (= (and b!731111 res!490968) b!731122))

(assert (= (and b!731122 res!490973) b!731105))

(assert (= (and b!731105 res!490974) b!731109))

(assert (= (and b!731109 res!490969) b!731114))

(assert (= (and b!731105 (not res!490970)) b!731113))

(declare-fun m!685035 () Bool)

(assert (=> b!731107 m!685035))

(declare-fun m!685037 () Bool)

(assert (=> b!731118 m!685037))

(assert (=> b!731118 m!685037))

(declare-fun m!685039 () Bool)

(assert (=> b!731118 m!685039))

(declare-fun m!685041 () Bool)

(assert (=> b!731120 m!685041))

(declare-fun m!685043 () Bool)

(assert (=> b!731122 m!685043))

(declare-fun m!685045 () Bool)

(assert (=> b!731122 m!685045))

(declare-fun m!685047 () Bool)

(assert (=> b!731122 m!685047))

(declare-fun m!685049 () Bool)

(assert (=> b!731122 m!685049))

(declare-fun m!685051 () Bool)

(assert (=> b!731122 m!685051))

(assert (=> b!731122 m!685045))

(declare-fun m!685053 () Bool)

(assert (=> b!731105 m!685053))

(declare-fun m!685055 () Bool)

(assert (=> b!731105 m!685055))

(assert (=> b!731119 m!685037))

(assert (=> b!731119 m!685037))

(declare-fun m!685057 () Bool)

(assert (=> b!731119 m!685057))

(declare-fun m!685059 () Bool)

(assert (=> b!731110 m!685059))

(declare-fun m!685061 () Bool)

(assert (=> b!731112 m!685061))

(assert (=> b!731115 m!685037))

(assert (=> b!731115 m!685037))

(declare-fun m!685063 () Bool)

(assert (=> b!731115 m!685063))

(declare-fun m!685065 () Bool)

(assert (=> b!731117 m!685065))

(declare-fun m!685067 () Bool)

(assert (=> b!731108 m!685067))

(assert (=> b!731109 m!685037))

(assert (=> b!731109 m!685037))

(declare-fun m!685069 () Bool)

(assert (=> b!731109 m!685069))

(assert (=> b!731121 m!685037))

(assert (=> b!731121 m!685037))

(declare-fun m!685071 () Bool)

(assert (=> b!731121 m!685071))

(assert (=> b!731121 m!685071))

(assert (=> b!731121 m!685037))

(declare-fun m!685073 () Bool)

(assert (=> b!731121 m!685073))

(declare-fun m!685075 () Bool)

(assert (=> b!731113 m!685075))

(assert (=> b!731114 m!685037))

(assert (=> b!731114 m!685037))

(declare-fun m!685077 () Bool)

(assert (=> b!731114 m!685077))

(declare-fun m!685079 () Bool)

(assert (=> start!64854 m!685079))

(declare-fun m!685081 () Bool)

(assert (=> start!64854 m!685081))

(check-sat (not b!731117) (not b!731121) (not start!64854) (not b!731113) (not b!731119) (not b!731109) (not b!731120) (not b!731114) (not b!731107) (not b!731110) (not b!731115) (not b!731105) (not b!731112) (not b!731122) (not b!731118))
(check-sat)
