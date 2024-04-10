; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64510 () Bool)

(assert start!64510)

(declare-fun b!726089 () Bool)

(declare-fun res!487122 () Bool)

(declare-fun e!406564 () Bool)

(assert (=> b!726089 (=> (not res!487122) (not e!406564))))

(declare-datatypes ((array!41028 0))(
  ( (array!41029 (arr!19635 (Array (_ BitVec 32) (_ BitVec 64))) (size!20056 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41028)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!726089 (= res!487122 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20056 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20056 a!3186))))))

(declare-fun b!726090 () Bool)

(declare-fun res!487116 () Bool)

(declare-fun e!406565 () Bool)

(assert (=> b!726090 (=> (not res!487116) (not e!406565))))

(declare-fun e!406566 () Bool)

(assert (=> b!726090 (= res!487116 e!406566)))

(declare-fun c!79861 () Bool)

(assert (=> b!726090 (= c!79861 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!726091 () Bool)

(declare-fun res!487121 () Bool)

(declare-fun e!406562 () Bool)

(assert (=> b!726091 (=> (not res!487121) (not e!406562))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!726091 (= res!487121 (validKeyInArray!0 (select (arr!19635 a!3186) j!159)))))

(declare-fun b!726092 () Bool)

(declare-fun res!487118 () Bool)

(assert (=> b!726092 (=> (not res!487118) (not e!406562))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!726092 (= res!487118 (and (= (size!20056 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20056 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20056 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!726093 () Bool)

(declare-fun res!487115 () Bool)

(assert (=> b!726093 (=> (not res!487115) (not e!406564))))

(declare-datatypes ((List!13637 0))(
  ( (Nil!13634) (Cons!13633 (h!14690 (_ BitVec 64)) (t!19952 List!13637)) )
))
(declare-fun arrayNoDuplicates!0 (array!41028 (_ BitVec 32) List!13637) Bool)

(assert (=> b!726093 (= res!487115 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13634))))

(declare-fun b!726094 () Bool)

(declare-fun e!406561 () Bool)

(assert (=> b!726094 (= e!406561 (not true))))

(declare-fun e!406563 () Bool)

(assert (=> b!726094 e!406563))

(declare-fun res!487125 () Bool)

(assert (=> b!726094 (=> (not res!487125) (not e!406563))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41028 (_ BitVec 32)) Bool)

(assert (=> b!726094 (= res!487125 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24788 0))(
  ( (Unit!24789) )
))
(declare-fun lt!321570 () Unit!24788)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41028 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24788)

(assert (=> b!726094 (= lt!321570 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!726096 () Bool)

(declare-fun e!406568 () Bool)

(assert (=> b!726096 (= e!406563 e!406568)))

(declare-fun res!487117 () Bool)

(assert (=> b!726096 (=> (not res!487117) (not e!406568))))

(declare-datatypes ((SeekEntryResult!7235 0))(
  ( (MissingZero!7235 (index!31308 (_ BitVec 32))) (Found!7235 (index!31309 (_ BitVec 32))) (Intermediate!7235 (undefined!8047 Bool) (index!31310 (_ BitVec 32)) (x!62301 (_ BitVec 32))) (Undefined!7235) (MissingVacant!7235 (index!31311 (_ BitVec 32))) )
))
(declare-fun lt!321574 () SeekEntryResult!7235)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41028 (_ BitVec 32)) SeekEntryResult!7235)

(assert (=> b!726096 (= res!487117 (= (seekEntryOrOpen!0 (select (arr!19635 a!3186) j!159) a!3186 mask!3328) lt!321574))))

(assert (=> b!726096 (= lt!321574 (Found!7235 j!159))))

(declare-fun lt!321573 () SeekEntryResult!7235)

(declare-fun b!726097 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41028 (_ BitVec 32)) SeekEntryResult!7235)

(assert (=> b!726097 (= e!406566 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19635 a!3186) j!159) a!3186 mask!3328) lt!321573))))

(declare-fun b!726098 () Bool)

(declare-fun res!487113 () Bool)

(assert (=> b!726098 (=> (not res!487113) (not e!406564))))

(assert (=> b!726098 (= res!487113 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!726099 () Bool)

(declare-fun res!487114 () Bool)

(assert (=> b!726099 (=> (not res!487114) (not e!406565))))

(assert (=> b!726099 (= res!487114 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19635 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!726100 () Bool)

(declare-fun res!487120 () Bool)

(assert (=> b!726100 (=> (not res!487120) (not e!406562))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41028 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!726100 (= res!487120 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!726101 () Bool)

(assert (=> b!726101 (= e!406565 e!406561)))

(declare-fun res!487119 () Bool)

(assert (=> b!726101 (=> (not res!487119) (not e!406561))))

(declare-fun lt!321571 () array!41028)

(declare-fun lt!321575 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726101 (= res!487119 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321575 mask!3328) lt!321575 lt!321571 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321575 lt!321571 mask!3328)))))

(assert (=> b!726101 (= lt!321575 (select (store (arr!19635 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!726101 (= lt!321571 (array!41029 (store (arr!19635 a!3186) i!1173 k!2102) (size!20056 a!3186)))))

(declare-fun b!726102 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41028 (_ BitVec 32)) SeekEntryResult!7235)

(assert (=> b!726102 (= e!406568 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19635 a!3186) j!159) a!3186 mask!3328) lt!321574))))

(declare-fun b!726103 () Bool)

(declare-fun res!487124 () Bool)

(assert (=> b!726103 (=> (not res!487124) (not e!406562))))

(assert (=> b!726103 (= res!487124 (validKeyInArray!0 k!2102))))

(declare-fun b!726095 () Bool)

(assert (=> b!726095 (= e!406562 e!406564)))

(declare-fun res!487126 () Bool)

(assert (=> b!726095 (=> (not res!487126) (not e!406564))))

(declare-fun lt!321572 () SeekEntryResult!7235)

(assert (=> b!726095 (= res!487126 (or (= lt!321572 (MissingZero!7235 i!1173)) (= lt!321572 (MissingVacant!7235 i!1173))))))

(assert (=> b!726095 (= lt!321572 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!487123 () Bool)

(assert (=> start!64510 (=> (not res!487123) (not e!406562))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64510 (= res!487123 (validMask!0 mask!3328))))

(assert (=> start!64510 e!406562))

(assert (=> start!64510 true))

(declare-fun array_inv!15431 (array!41028) Bool)

(assert (=> start!64510 (array_inv!15431 a!3186)))

(declare-fun b!726104 () Bool)

(assert (=> b!726104 (= e!406566 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19635 a!3186) j!159) a!3186 mask!3328) (Found!7235 j!159)))))

(declare-fun b!726105 () Bool)

(assert (=> b!726105 (= e!406564 e!406565)))

(declare-fun res!487127 () Bool)

(assert (=> b!726105 (=> (not res!487127) (not e!406565))))

(assert (=> b!726105 (= res!487127 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19635 a!3186) j!159) mask!3328) (select (arr!19635 a!3186) j!159) a!3186 mask!3328) lt!321573))))

(assert (=> b!726105 (= lt!321573 (Intermediate!7235 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!64510 res!487123) b!726092))

(assert (= (and b!726092 res!487118) b!726091))

(assert (= (and b!726091 res!487121) b!726103))

(assert (= (and b!726103 res!487124) b!726100))

(assert (= (and b!726100 res!487120) b!726095))

(assert (= (and b!726095 res!487126) b!726098))

(assert (= (and b!726098 res!487113) b!726093))

(assert (= (and b!726093 res!487115) b!726089))

(assert (= (and b!726089 res!487122) b!726105))

(assert (= (and b!726105 res!487127) b!726099))

(assert (= (and b!726099 res!487114) b!726090))

(assert (= (and b!726090 c!79861) b!726097))

(assert (= (and b!726090 (not c!79861)) b!726104))

(assert (= (and b!726090 res!487116) b!726101))

(assert (= (and b!726101 res!487119) b!726094))

(assert (= (and b!726094 res!487125) b!726096))

(assert (= (and b!726096 res!487117) b!726102))

(declare-fun m!680185 () Bool)

(assert (=> b!726093 m!680185))

(declare-fun m!680187 () Bool)

(assert (=> b!726100 m!680187))

(declare-fun m!680189 () Bool)

(assert (=> b!726094 m!680189))

(declare-fun m!680191 () Bool)

(assert (=> b!726094 m!680191))

(declare-fun m!680193 () Bool)

(assert (=> b!726104 m!680193))

(assert (=> b!726104 m!680193))

(declare-fun m!680195 () Bool)

(assert (=> b!726104 m!680195))

(declare-fun m!680197 () Bool)

(assert (=> b!726098 m!680197))

(declare-fun m!680199 () Bool)

(assert (=> b!726103 m!680199))

(assert (=> b!726096 m!680193))

(assert (=> b!726096 m!680193))

(declare-fun m!680201 () Bool)

(assert (=> b!726096 m!680201))

(declare-fun m!680203 () Bool)

(assert (=> start!64510 m!680203))

(declare-fun m!680205 () Bool)

(assert (=> start!64510 m!680205))

(declare-fun m!680207 () Bool)

(assert (=> b!726099 m!680207))

(assert (=> b!726097 m!680193))

(assert (=> b!726097 m!680193))

(declare-fun m!680209 () Bool)

(assert (=> b!726097 m!680209))

(assert (=> b!726105 m!680193))

(assert (=> b!726105 m!680193))

(declare-fun m!680211 () Bool)

(assert (=> b!726105 m!680211))

(assert (=> b!726105 m!680211))

(assert (=> b!726105 m!680193))

(declare-fun m!680213 () Bool)

(assert (=> b!726105 m!680213))

(assert (=> b!726102 m!680193))

(assert (=> b!726102 m!680193))

(declare-fun m!680215 () Bool)

(assert (=> b!726102 m!680215))

(declare-fun m!680217 () Bool)

(assert (=> b!726101 m!680217))

(declare-fun m!680219 () Bool)

(assert (=> b!726101 m!680219))

(declare-fun m!680221 () Bool)

(assert (=> b!726101 m!680221))

(declare-fun m!680223 () Bool)

(assert (=> b!726101 m!680223))

(declare-fun m!680225 () Bool)

(assert (=> b!726101 m!680225))

(assert (=> b!726101 m!680221))

(declare-fun m!680227 () Bool)

(assert (=> b!726095 m!680227))

(assert (=> b!726091 m!680193))

(assert (=> b!726091 m!680193))

(declare-fun m!680229 () Bool)

(assert (=> b!726091 m!680229))

(push 1)

