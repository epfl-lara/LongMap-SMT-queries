; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64292 () Bool)

(assert start!64292)

(declare-fun res!484144 () Bool)

(declare-fun e!404818 () Bool)

(assert (=> start!64292 (=> (not res!484144) (not e!404818))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64292 (= res!484144 (validMask!0 mask!3328))))

(assert (=> start!64292 e!404818))

(assert (=> start!64292 true))

(declare-datatypes ((array!40890 0))(
  ( (array!40891 (arr!19568 (Array (_ BitVec 32) (_ BitVec 64))) (size!19989 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40890)

(declare-fun array_inv!15451 (array!40890) Bool)

(assert (=> start!64292 (array_inv!15451 a!3186)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!404819 () Bool)

(declare-fun b!722311 () Bool)

(declare-datatypes ((SeekEntryResult!7165 0))(
  ( (MissingZero!7165 (index!31028 (_ BitVec 32))) (Found!7165 (index!31029 (_ BitVec 32))) (Intermediate!7165 (undefined!7977 Bool) (index!31030 (_ BitVec 32)) (x!62041 (_ BitVec 32))) (Undefined!7165) (MissingVacant!7165 (index!31031 (_ BitVec 32))) )
))
(declare-fun lt!320093 () SeekEntryResult!7165)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40890 (_ BitVec 32)) SeekEntryResult!7165)

(assert (=> b!722311 (= e!404819 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19568 a!3186) j!159) a!3186 mask!3328) lt!320093))))

(declare-fun b!722312 () Bool)

(declare-fun res!484153 () Bool)

(assert (=> b!722312 (=> (not res!484153) (not e!404818))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722312 (= res!484153 (validKeyInArray!0 k0!2102))))

(declare-fun b!722313 () Bool)

(declare-fun res!484150 () Bool)

(declare-fun e!404821 () Bool)

(assert (=> b!722313 (=> (not res!484150) (not e!404821))))

(declare-datatypes ((List!13609 0))(
  ( (Nil!13606) (Cons!13605 (h!14659 (_ BitVec 64)) (t!19915 List!13609)) )
))
(declare-fun arrayNoDuplicates!0 (array!40890 (_ BitVec 32) List!13609) Bool)

(assert (=> b!722313 (= res!484150 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13606))))

(declare-fun b!722314 () Bool)

(declare-fun res!484146 () Bool)

(assert (=> b!722314 (=> (not res!484146) (not e!404818))))

(assert (=> b!722314 (= res!484146 (validKeyInArray!0 (select (arr!19568 a!3186) j!159)))))

(declare-fun b!722315 () Bool)

(assert (=> b!722315 (= e!404818 e!404821)))

(declare-fun res!484147 () Bool)

(assert (=> b!722315 (=> (not res!484147) (not e!404821))))

(declare-fun lt!320095 () SeekEntryResult!7165)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!722315 (= res!484147 (or (= lt!320095 (MissingZero!7165 i!1173)) (= lt!320095 (MissingVacant!7165 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40890 (_ BitVec 32)) SeekEntryResult!7165)

(assert (=> b!722315 (= lt!320095 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!722316 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40890 (_ BitVec 32)) SeekEntryResult!7165)

(assert (=> b!722316 (= e!404819 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19568 a!3186) j!159) a!3186 mask!3328) (Found!7165 j!159)))))

(declare-fun b!722317 () Bool)

(declare-fun res!484154 () Bool)

(assert (=> b!722317 (=> (not res!484154) (not e!404818))))

(assert (=> b!722317 (= res!484154 (and (= (size!19989 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19989 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19989 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!722318 () Bool)

(declare-fun res!484148 () Bool)

(assert (=> b!722318 (=> (not res!484148) (not e!404821))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40890 (_ BitVec 32)) Bool)

(assert (=> b!722318 (= res!484148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!722319 () Bool)

(declare-fun res!484145 () Bool)

(declare-fun e!404820 () Bool)

(assert (=> b!722319 (=> (not res!484145) (not e!404820))))

(assert (=> b!722319 (= res!484145 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19568 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!722320 () Bool)

(declare-fun res!484149 () Bool)

(assert (=> b!722320 (=> (not res!484149) (not e!404818))))

(declare-fun arrayContainsKey!0 (array!40890 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722320 (= res!484149 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!722321 () Bool)

(assert (=> b!722321 (= e!404821 e!404820)))

(declare-fun res!484151 () Bool)

(assert (=> b!722321 (=> (not res!484151) (not e!404820))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722321 (= res!484151 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19568 a!3186) j!159) mask!3328) (select (arr!19568 a!3186) j!159) a!3186 mask!3328) lt!320093))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!722321 (= lt!320093 (Intermediate!7165 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!722322 () Bool)

(declare-fun res!484152 () Bool)

(assert (=> b!722322 (=> (not res!484152) (not e!404821))))

(assert (=> b!722322 (= res!484152 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19989 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19989 a!3186))))))

(declare-fun b!722323 () Bool)

(assert (=> b!722323 (= e!404820 false)))

(declare-fun lt!320092 () SeekEntryResult!7165)

(declare-fun lt!320096 () (_ BitVec 64))

(declare-fun lt!320094 () array!40890)

(assert (=> b!722323 (= lt!320092 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320096 lt!320094 mask!3328))))

(declare-fun lt!320091 () SeekEntryResult!7165)

(assert (=> b!722323 (= lt!320091 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320096 mask!3328) lt!320096 lt!320094 mask!3328))))

(assert (=> b!722323 (= lt!320096 (select (store (arr!19568 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!722323 (= lt!320094 (array!40891 (store (arr!19568 a!3186) i!1173 k0!2102) (size!19989 a!3186)))))

(declare-fun b!722324 () Bool)

(declare-fun res!484155 () Bool)

(assert (=> b!722324 (=> (not res!484155) (not e!404820))))

(assert (=> b!722324 (= res!484155 e!404819)))

(declare-fun c!79455 () Bool)

(assert (=> b!722324 (= c!79455 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!64292 res!484144) b!722317))

(assert (= (and b!722317 res!484154) b!722314))

(assert (= (and b!722314 res!484146) b!722312))

(assert (= (and b!722312 res!484153) b!722320))

(assert (= (and b!722320 res!484149) b!722315))

(assert (= (and b!722315 res!484147) b!722318))

(assert (= (and b!722318 res!484148) b!722313))

(assert (= (and b!722313 res!484150) b!722322))

(assert (= (and b!722322 res!484152) b!722321))

(assert (= (and b!722321 res!484151) b!722319))

(assert (= (and b!722319 res!484145) b!722324))

(assert (= (and b!722324 c!79455) b!722311))

(assert (= (and b!722324 (not c!79455)) b!722316))

(assert (= (and b!722324 res!484155) b!722323))

(declare-fun m!676319 () Bool)

(assert (=> b!722314 m!676319))

(assert (=> b!722314 m!676319))

(declare-fun m!676321 () Bool)

(assert (=> b!722314 m!676321))

(assert (=> b!722321 m!676319))

(assert (=> b!722321 m!676319))

(declare-fun m!676323 () Bool)

(assert (=> b!722321 m!676323))

(assert (=> b!722321 m!676323))

(assert (=> b!722321 m!676319))

(declare-fun m!676325 () Bool)

(assert (=> b!722321 m!676325))

(declare-fun m!676327 () Bool)

(assert (=> b!722315 m!676327))

(declare-fun m!676329 () Bool)

(assert (=> b!722323 m!676329))

(declare-fun m!676331 () Bool)

(assert (=> b!722323 m!676331))

(declare-fun m!676333 () Bool)

(assert (=> b!722323 m!676333))

(assert (=> b!722323 m!676329))

(declare-fun m!676335 () Bool)

(assert (=> b!722323 m!676335))

(declare-fun m!676337 () Bool)

(assert (=> b!722323 m!676337))

(declare-fun m!676339 () Bool)

(assert (=> b!722313 m!676339))

(declare-fun m!676341 () Bool)

(assert (=> b!722319 m!676341))

(declare-fun m!676343 () Bool)

(assert (=> start!64292 m!676343))

(declare-fun m!676345 () Bool)

(assert (=> start!64292 m!676345))

(assert (=> b!722311 m!676319))

(assert (=> b!722311 m!676319))

(declare-fun m!676347 () Bool)

(assert (=> b!722311 m!676347))

(assert (=> b!722316 m!676319))

(assert (=> b!722316 m!676319))

(declare-fun m!676349 () Bool)

(assert (=> b!722316 m!676349))

(declare-fun m!676351 () Bool)

(assert (=> b!722320 m!676351))

(declare-fun m!676353 () Bool)

(assert (=> b!722312 m!676353))

(declare-fun m!676355 () Bool)

(assert (=> b!722318 m!676355))

(check-sat (not b!722313) (not b!722323) (not b!722314) (not b!722315) (not b!722311) (not b!722316) (not start!64292) (not b!722312) (not b!722320) (not b!722318) (not b!722321))
(check-sat)
