; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65504 () Bool)

(assert start!65504)

(declare-fun res!503784 () Bool)

(declare-fun e!417162 () Bool)

(assert (=> start!65504 (=> (not res!503784) (not e!417162))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65504 (= res!503784 (validMask!0 mask!3328))))

(assert (=> start!65504 e!417162))

(assert (=> start!65504 true))

(declare-datatypes ((array!41677 0))(
  ( (array!41678 (arr!19952 (Array (_ BitVec 32) (_ BitVec 64))) (size!20373 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41677)

(declare-fun array_inv!15748 (array!41677) Bool)

(assert (=> start!65504 (array_inv!15748 a!3186)))

(declare-fun b!747091 () Bool)

(declare-fun res!503772 () Bool)

(declare-fun e!417164 () Bool)

(assert (=> b!747091 (=> (not res!503772) (not e!417164))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!747091 (= res!503772 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20373 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20373 a!3186))))))

(declare-fun b!747092 () Bool)

(declare-fun res!503779 () Bool)

(declare-fun e!417161 () Bool)

(assert (=> b!747092 (=> (not res!503779) (not e!417161))))

(declare-fun e!417160 () Bool)

(assert (=> b!747092 (= res!503779 e!417160)))

(declare-fun c!82041 () Bool)

(assert (=> b!747092 (= c!82041 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!747093 () Bool)

(declare-datatypes ((Unit!25588 0))(
  ( (Unit!25589) )
))
(declare-fun e!417163 () Unit!25588)

(declare-fun Unit!25590 () Unit!25588)

(assert (=> b!747093 (= e!417163 Unit!25590)))

(assert (=> b!747093 false))

(declare-fun b!747094 () Bool)

(declare-fun res!503782 () Bool)

(assert (=> b!747094 (=> (not res!503782) (not e!417162))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!747094 (= res!503782 (validKeyInArray!0 (select (arr!19952 a!3186) j!159)))))

(declare-fun b!747095 () Bool)

(declare-fun Unit!25591 () Unit!25588)

(assert (=> b!747095 (= e!417163 Unit!25591)))

(declare-fun b!747096 () Bool)

(declare-fun res!503783 () Bool)

(declare-fun e!417158 () Bool)

(assert (=> b!747096 (=> res!503783 e!417158)))

(declare-fun lt!332075 () (_ BitVec 64))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!747096 (= res!503783 (= (select (store (arr!19952 a!3186) i!1173 k!2102) index!1321) lt!332075))))

(declare-fun b!747097 () Bool)

(assert (=> b!747097 (= e!417164 e!417161)))

(declare-fun res!503771 () Bool)

(assert (=> b!747097 (=> (not res!503771) (not e!417161))))

(declare-datatypes ((SeekEntryResult!7552 0))(
  ( (MissingZero!7552 (index!32576 (_ BitVec 32))) (Found!7552 (index!32577 (_ BitVec 32))) (Intermediate!7552 (undefined!8364 Bool) (index!32578 (_ BitVec 32)) (x!63518 (_ BitVec 32))) (Undefined!7552) (MissingVacant!7552 (index!32579 (_ BitVec 32))) )
))
(declare-fun lt!332074 () SeekEntryResult!7552)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41677 (_ BitVec 32)) SeekEntryResult!7552)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!747097 (= res!503771 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19952 a!3186) j!159) mask!3328) (select (arr!19952 a!3186) j!159) a!3186 mask!3328) lt!332074))))

(assert (=> b!747097 (= lt!332074 (Intermediate!7552 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!747098 () Bool)

(declare-fun e!417156 () Bool)

(assert (=> b!747098 (= e!417161 e!417156)))

(declare-fun res!503776 () Bool)

(assert (=> b!747098 (=> (not res!503776) (not e!417156))))

(declare-fun lt!332071 () SeekEntryResult!7552)

(declare-fun lt!332068 () SeekEntryResult!7552)

(assert (=> b!747098 (= res!503776 (= lt!332071 lt!332068))))

(declare-fun lt!332072 () array!41677)

(assert (=> b!747098 (= lt!332068 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332075 lt!332072 mask!3328))))

(assert (=> b!747098 (= lt!332071 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332075 mask!3328) lt!332075 lt!332072 mask!3328))))

(assert (=> b!747098 (= lt!332075 (select (store (arr!19952 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!747098 (= lt!332072 (array!41678 (store (arr!19952 a!3186) i!1173 k!2102) (size!20373 a!3186)))))

(declare-fun b!747099 () Bool)

(declare-fun res!503780 () Bool)

(assert (=> b!747099 (=> res!503780 e!417158)))

(declare-fun lt!332066 () SeekEntryResult!7552)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41677 (_ BitVec 32)) SeekEntryResult!7552)

(assert (=> b!747099 (= res!503780 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19952 a!3186) j!159) a!3186 mask!3328) lt!332066)))))

(declare-fun b!747100 () Bool)

(declare-fun res!503778 () Bool)

(assert (=> b!747100 (=> (not res!503778) (not e!417161))))

(assert (=> b!747100 (= res!503778 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19952 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!747101 () Bool)

(declare-fun res!503773 () Bool)

(assert (=> b!747101 (=> (not res!503773) (not e!417164))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41677 (_ BitVec 32)) Bool)

(assert (=> b!747101 (= res!503773 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!747102 () Bool)

(assert (=> b!747102 (= e!417158 true)))

(assert (=> b!747102 (= (select (store (arr!19952 a!3186) i!1173 k!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332067 () Unit!25588)

(assert (=> b!747102 (= lt!332067 e!417163)))

(declare-fun c!82042 () Bool)

(assert (=> b!747102 (= c!82042 (= (select (store (arr!19952 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!747103 () Bool)

(declare-fun res!503785 () Bool)

(assert (=> b!747103 (=> (not res!503785) (not e!417162))))

(assert (=> b!747103 (= res!503785 (and (= (size!20373 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20373 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20373 a!3186)) (not (= i!1173 j!159))))))

(declare-fun e!417159 () Bool)

(declare-fun b!747104 () Bool)

(assert (=> b!747104 (= e!417159 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19952 a!3186) j!159) a!3186 mask!3328) lt!332066))))

(declare-fun b!747105 () Bool)

(declare-fun res!503775 () Bool)

(assert (=> b!747105 (=> (not res!503775) (not e!417164))))

(declare-datatypes ((List!13954 0))(
  ( (Nil!13951) (Cons!13950 (h!15022 (_ BitVec 64)) (t!20269 List!13954)) )
))
(declare-fun arrayNoDuplicates!0 (array!41677 (_ BitVec 32) List!13954) Bool)

(assert (=> b!747105 (= res!503775 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13951))))

(declare-fun b!747106 () Bool)

(assert (=> b!747106 (= e!417156 (not e!417158))))

(declare-fun res!503774 () Bool)

(assert (=> b!747106 (=> res!503774 e!417158)))

(assert (=> b!747106 (= res!503774 (or (not (is-Intermediate!7552 lt!332068)) (bvslt x!1131 (x!63518 lt!332068)) (not (= x!1131 (x!63518 lt!332068))) (not (= index!1321 (index!32578 lt!332068)))))))

(assert (=> b!747106 e!417159))

(declare-fun res!503770 () Bool)

(assert (=> b!747106 (=> (not res!503770) (not e!417159))))

(declare-fun lt!332073 () SeekEntryResult!7552)

(assert (=> b!747106 (= res!503770 (= lt!332073 lt!332066))))

(assert (=> b!747106 (= lt!332066 (Found!7552 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41677 (_ BitVec 32)) SeekEntryResult!7552)

(assert (=> b!747106 (= lt!332073 (seekEntryOrOpen!0 (select (arr!19952 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!747106 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!332069 () Unit!25588)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41677 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25588)

(assert (=> b!747106 (= lt!332069 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!747107 () Bool)

(assert (=> b!747107 (= e!417160 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19952 a!3186) j!159) a!3186 mask!3328) lt!332074))))

(declare-fun b!747108 () Bool)

(assert (=> b!747108 (= e!417162 e!417164)))

(declare-fun res!503781 () Bool)

(assert (=> b!747108 (=> (not res!503781) (not e!417164))))

(declare-fun lt!332070 () SeekEntryResult!7552)

(assert (=> b!747108 (= res!503781 (or (= lt!332070 (MissingZero!7552 i!1173)) (= lt!332070 (MissingVacant!7552 i!1173))))))

(assert (=> b!747108 (= lt!332070 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!747109 () Bool)

(assert (=> b!747109 (= e!417160 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19952 a!3186) j!159) a!3186 mask!3328) (Found!7552 j!159)))))

(declare-fun b!747110 () Bool)

(declare-fun res!503777 () Bool)

(assert (=> b!747110 (=> (not res!503777) (not e!417162))))

(declare-fun arrayContainsKey!0 (array!41677 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!747110 (= res!503777 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!747111 () Bool)

(declare-fun res!503786 () Bool)

(assert (=> b!747111 (=> (not res!503786) (not e!417162))))

(assert (=> b!747111 (= res!503786 (validKeyInArray!0 k!2102))))

(assert (= (and start!65504 res!503784) b!747103))

(assert (= (and b!747103 res!503785) b!747094))

(assert (= (and b!747094 res!503782) b!747111))

(assert (= (and b!747111 res!503786) b!747110))

(assert (= (and b!747110 res!503777) b!747108))

(assert (= (and b!747108 res!503781) b!747101))

(assert (= (and b!747101 res!503773) b!747105))

(assert (= (and b!747105 res!503775) b!747091))

(assert (= (and b!747091 res!503772) b!747097))

(assert (= (and b!747097 res!503771) b!747100))

(assert (= (and b!747100 res!503778) b!747092))

(assert (= (and b!747092 c!82041) b!747107))

(assert (= (and b!747092 (not c!82041)) b!747109))

(assert (= (and b!747092 res!503779) b!747098))

(assert (= (and b!747098 res!503776) b!747106))

(assert (= (and b!747106 res!503770) b!747104))

(assert (= (and b!747106 (not res!503774)) b!747099))

(assert (= (and b!747099 (not res!503780)) b!747096))

(assert (= (and b!747096 (not res!503783)) b!747102))

(assert (= (and b!747102 c!82042) b!747093))

(assert (= (and b!747102 (not c!82042)) b!747095))

(declare-fun m!697255 () Bool)

(assert (=> b!747099 m!697255))

(assert (=> b!747099 m!697255))

(declare-fun m!697257 () Bool)

(assert (=> b!747099 m!697257))

(assert (=> b!747107 m!697255))

(assert (=> b!747107 m!697255))

(declare-fun m!697259 () Bool)

(assert (=> b!747107 m!697259))

(assert (=> b!747094 m!697255))

(assert (=> b!747094 m!697255))

(declare-fun m!697261 () Bool)

(assert (=> b!747094 m!697261))

(declare-fun m!697263 () Bool)

(assert (=> b!747100 m!697263))

(declare-fun m!697265 () Bool)

(assert (=> b!747110 m!697265))

(assert (=> b!747106 m!697255))

(assert (=> b!747106 m!697255))

(declare-fun m!697267 () Bool)

(assert (=> b!747106 m!697267))

(declare-fun m!697269 () Bool)

(assert (=> b!747106 m!697269))

(declare-fun m!697271 () Bool)

(assert (=> b!747106 m!697271))

(assert (=> b!747104 m!697255))

(assert (=> b!747104 m!697255))

(declare-fun m!697273 () Bool)

(assert (=> b!747104 m!697273))

(declare-fun m!697275 () Bool)

(assert (=> b!747102 m!697275))

(declare-fun m!697277 () Bool)

(assert (=> b!747102 m!697277))

(declare-fun m!697279 () Bool)

(assert (=> b!747101 m!697279))

(assert (=> b!747097 m!697255))

(assert (=> b!747097 m!697255))

(declare-fun m!697281 () Bool)

(assert (=> b!747097 m!697281))

(assert (=> b!747097 m!697281))

(assert (=> b!747097 m!697255))

(declare-fun m!697283 () Bool)

(assert (=> b!747097 m!697283))

(declare-fun m!697285 () Bool)

(assert (=> b!747105 m!697285))

(declare-fun m!697287 () Bool)

(assert (=> b!747098 m!697287))

(declare-fun m!697289 () Bool)

(assert (=> b!747098 m!697289))

(declare-fun m!697291 () Bool)

(assert (=> b!747098 m!697291))

(declare-fun m!697293 () Bool)

(assert (=> b!747098 m!697293))

(assert (=> b!747098 m!697291))

(assert (=> b!747098 m!697275))

(declare-fun m!697295 () Bool)

(assert (=> b!747111 m!697295))

(declare-fun m!697297 () Bool)

(assert (=> start!65504 m!697297))

(declare-fun m!697299 () Bool)

(assert (=> start!65504 m!697299))

(assert (=> b!747109 m!697255))

(assert (=> b!747109 m!697255))

(assert (=> b!747109 m!697257))

(declare-fun m!697301 () Bool)

(assert (=> b!747108 m!697301))

(assert (=> b!747096 m!697275))

(assert (=> b!747096 m!697277))

(push 1)

