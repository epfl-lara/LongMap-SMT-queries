; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64466 () Bool)

(assert start!64466)

(declare-fun b!724968 () Bool)

(declare-fun res!486129 () Bool)

(declare-fun e!406039 () Bool)

(assert (=> b!724968 (=> (not res!486129) (not e!406039))))

(declare-datatypes ((array!40984 0))(
  ( (array!40985 (arr!19613 (Array (_ BitVec 32) (_ BitVec 64))) (size!20034 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40984)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40984 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!724968 (= res!486129 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!724969 () Bool)

(declare-fun e!406034 () Bool)

(assert (=> b!724969 (= e!406034 (not true))))

(declare-fun e!406038 () Bool)

(assert (=> b!724969 e!406038))

(declare-fun res!486124 () Bool)

(assert (=> b!724969 (=> (not res!486124) (not e!406038))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40984 (_ BitVec 32)) Bool)

(assert (=> b!724969 (= res!486124 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24744 0))(
  ( (Unit!24745) )
))
(declare-fun lt!321188 () Unit!24744)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40984 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24744)

(assert (=> b!724969 (= lt!321188 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!724970 () Bool)

(declare-fun e!406036 () Bool)

(assert (=> b!724970 (= e!406036 e!406034)))

(declare-fun res!486131 () Bool)

(assert (=> b!724970 (=> (not res!486131) (not e!406034))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!321184 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!321185 () array!40984)

(declare-datatypes ((SeekEntryResult!7213 0))(
  ( (MissingZero!7213 (index!31220 (_ BitVec 32))) (Found!7213 (index!31221 (_ BitVec 32))) (Intermediate!7213 (undefined!8025 Bool) (index!31222 (_ BitVec 32)) (x!62215 (_ BitVec 32))) (Undefined!7213) (MissingVacant!7213 (index!31223 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40984 (_ BitVec 32)) SeekEntryResult!7213)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!724970 (= res!486131 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321184 mask!3328) lt!321184 lt!321185 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321184 lt!321185 mask!3328)))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!724970 (= lt!321184 (select (store (arr!19613 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!724970 (= lt!321185 (array!40985 (store (arr!19613 a!3186) i!1173 k!2102) (size!20034 a!3186)))))

(declare-fun b!724971 () Bool)

(declare-fun e!406040 () Bool)

(assert (=> b!724971 (= e!406039 e!406040)))

(declare-fun res!486126 () Bool)

(assert (=> b!724971 (=> (not res!486126) (not e!406040))))

(declare-fun lt!321186 () SeekEntryResult!7213)

(assert (=> b!724971 (= res!486126 (or (= lt!321186 (MissingZero!7213 i!1173)) (= lt!321186 (MissingVacant!7213 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40984 (_ BitVec 32)) SeekEntryResult!7213)

(assert (=> b!724971 (= lt!321186 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!724972 () Bool)

(declare-fun res!486133 () Bool)

(assert (=> b!724972 (=> (not res!486133) (not e!406040))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!724972 (= res!486133 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20034 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20034 a!3186))))))

(declare-fun res!486127 () Bool)

(assert (=> start!64466 (=> (not res!486127) (not e!406039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64466 (= res!486127 (validMask!0 mask!3328))))

(assert (=> start!64466 e!406039))

(assert (=> start!64466 true))

(declare-fun array_inv!15409 (array!40984) Bool)

(assert (=> start!64466 (array_inv!15409 a!3186)))

(declare-fun b!724973 () Bool)

(declare-fun e!406037 () Bool)

(declare-fun lt!321187 () SeekEntryResult!7213)

(assert (=> b!724973 (= e!406037 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19613 a!3186) j!159) a!3186 mask!3328) lt!321187))))

(declare-fun b!724974 () Bool)

(assert (=> b!724974 (= e!406038 (= (seekEntryOrOpen!0 (select (arr!19613 a!3186) j!159) a!3186 mask!3328) (Found!7213 j!159)))))

(declare-fun b!724975 () Bool)

(declare-fun res!486135 () Bool)

(assert (=> b!724975 (=> (not res!486135) (not e!406036))))

(assert (=> b!724975 (= res!486135 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19613 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!724976 () Bool)

(declare-fun res!486128 () Bool)

(assert (=> b!724976 (=> (not res!486128) (not e!406039))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!724976 (= res!486128 (validKeyInArray!0 k!2102))))

(declare-fun b!724977 () Bool)

(declare-fun res!486136 () Bool)

(assert (=> b!724977 (=> (not res!486136) (not e!406040))))

(assert (=> b!724977 (= res!486136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!724978 () Bool)

(declare-fun res!486130 () Bool)

(assert (=> b!724978 (=> (not res!486130) (not e!406040))))

(declare-datatypes ((List!13615 0))(
  ( (Nil!13612) (Cons!13611 (h!14668 (_ BitVec 64)) (t!19930 List!13615)) )
))
(declare-fun arrayNoDuplicates!0 (array!40984 (_ BitVec 32) List!13615) Bool)

(assert (=> b!724978 (= res!486130 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13612))))

(declare-fun b!724979 () Bool)

(declare-fun res!486137 () Bool)

(assert (=> b!724979 (=> (not res!486137) (not e!406039))))

(assert (=> b!724979 (= res!486137 (validKeyInArray!0 (select (arr!19613 a!3186) j!159)))))

(declare-fun b!724980 () Bool)

(declare-fun res!486132 () Bool)

(assert (=> b!724980 (=> (not res!486132) (not e!406039))))

(assert (=> b!724980 (= res!486132 (and (= (size!20034 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20034 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20034 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!724981 () Bool)

(assert (=> b!724981 (= e!406040 e!406036)))

(declare-fun res!486134 () Bool)

(assert (=> b!724981 (=> (not res!486134) (not e!406036))))

(assert (=> b!724981 (= res!486134 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19613 a!3186) j!159) mask!3328) (select (arr!19613 a!3186) j!159) a!3186 mask!3328) lt!321187))))

(assert (=> b!724981 (= lt!321187 (Intermediate!7213 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!724982 () Bool)

(declare-fun res!486125 () Bool)

(assert (=> b!724982 (=> (not res!486125) (not e!406036))))

(assert (=> b!724982 (= res!486125 e!406037)))

(declare-fun c!79795 () Bool)

(assert (=> b!724982 (= c!79795 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!724983 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40984 (_ BitVec 32)) SeekEntryResult!7213)

(assert (=> b!724983 (= e!406037 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19613 a!3186) j!159) a!3186 mask!3328) (Found!7213 j!159)))))

(assert (= (and start!64466 res!486127) b!724980))

(assert (= (and b!724980 res!486132) b!724979))

(assert (= (and b!724979 res!486137) b!724976))

(assert (= (and b!724976 res!486128) b!724968))

(assert (= (and b!724968 res!486129) b!724971))

(assert (= (and b!724971 res!486126) b!724977))

(assert (= (and b!724977 res!486136) b!724978))

(assert (= (and b!724978 res!486130) b!724972))

(assert (= (and b!724972 res!486133) b!724981))

(assert (= (and b!724981 res!486134) b!724975))

(assert (= (and b!724975 res!486135) b!724982))

(assert (= (and b!724982 c!79795) b!724973))

(assert (= (and b!724982 (not c!79795)) b!724983))

(assert (= (and b!724982 res!486125) b!724970))

(assert (= (and b!724970 res!486131) b!724969))

(assert (= (and b!724969 res!486124) b!724974))

(declare-fun m!679175 () Bool)

(assert (=> b!724973 m!679175))

(assert (=> b!724973 m!679175))

(declare-fun m!679177 () Bool)

(assert (=> b!724973 m!679177))

(declare-fun m!679179 () Bool)

(assert (=> b!724971 m!679179))

(declare-fun m!679181 () Bool)

(assert (=> b!724976 m!679181))

(declare-fun m!679183 () Bool)

(assert (=> b!724969 m!679183))

(declare-fun m!679185 () Bool)

(assert (=> b!724969 m!679185))

(declare-fun m!679187 () Bool)

(assert (=> start!64466 m!679187))

(declare-fun m!679189 () Bool)

(assert (=> start!64466 m!679189))

(declare-fun m!679191 () Bool)

(assert (=> b!724968 m!679191))

(assert (=> b!724983 m!679175))

(assert (=> b!724983 m!679175))

(declare-fun m!679193 () Bool)

(assert (=> b!724983 m!679193))

(declare-fun m!679195 () Bool)

(assert (=> b!724978 m!679195))

(declare-fun m!679197 () Bool)

(assert (=> b!724975 m!679197))

(assert (=> b!724974 m!679175))

(assert (=> b!724974 m!679175))

(declare-fun m!679199 () Bool)

(assert (=> b!724974 m!679199))

(declare-fun m!679201 () Bool)

(assert (=> b!724977 m!679201))

(assert (=> b!724981 m!679175))

(assert (=> b!724981 m!679175))

(declare-fun m!679203 () Bool)

(assert (=> b!724981 m!679203))

(assert (=> b!724981 m!679203))

(assert (=> b!724981 m!679175))

(declare-fun m!679205 () Bool)

(assert (=> b!724981 m!679205))

(declare-fun m!679207 () Bool)

(assert (=> b!724970 m!679207))

(declare-fun m!679209 () Bool)

(assert (=> b!724970 m!679209))

(declare-fun m!679211 () Bool)

(assert (=> b!724970 m!679211))

(declare-fun m!679213 () Bool)

(assert (=> b!724970 m!679213))

(assert (=> b!724970 m!679213))

(declare-fun m!679215 () Bool)

(assert (=> b!724970 m!679215))

(assert (=> b!724979 m!679175))

(assert (=> b!724979 m!679175))

(declare-fun m!679217 () Bool)

(assert (=> b!724979 m!679217))

(push 1)

