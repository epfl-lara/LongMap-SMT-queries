; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66576 () Bool)

(assert start!66576)

(declare-fun b!767330 () Bool)

(declare-fun res!519107 () Bool)

(declare-fun e!427302 () Bool)

(assert (=> b!767330 (=> (not res!519107) (not e!427302))))

(declare-fun e!427293 () Bool)

(assert (=> b!767330 (= res!519107 e!427293)))

(declare-fun c!84505 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!767330 (= c!84505 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!767331 () Bool)

(declare-fun res!519105 () Bool)

(declare-fun e!427300 () Bool)

(assert (=> b!767331 (=> (not res!519105) (not e!427300))))

(declare-datatypes ((array!42286 0))(
  ( (array!42287 (arr!20246 (Array (_ BitVec 32) (_ BitVec 64))) (size!20667 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42286)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!767331 (= res!519105 (validKeyInArray!0 (select (arr!20246 a!3186) j!159)))))

(declare-fun e!427298 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!767332 () Bool)

(declare-datatypes ((SeekEntryResult!7846 0))(
  ( (MissingZero!7846 (index!33752 (_ BitVec 32))) (Found!7846 (index!33753 (_ BitVec 32))) (Intermediate!7846 (undefined!8658 Bool) (index!33754 (_ BitVec 32)) (x!64664 (_ BitVec 32))) (Undefined!7846) (MissingVacant!7846 (index!33755 (_ BitVec 32))) )
))
(declare-fun lt!341345 () SeekEntryResult!7846)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42286 (_ BitVec 32)) SeekEntryResult!7846)

(assert (=> b!767332 (= e!427298 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20246 a!3186) j!159) a!3186 mask!3328) lt!341345))))

(declare-fun b!767333 () Bool)

(declare-fun res!519113 () Bool)

(assert (=> b!767333 (=> (not res!519113) (not e!427300))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42286 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!767333 (= res!519113 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!767334 () Bool)

(assert (=> b!767334 (= e!427293 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20246 a!3186) j!159) a!3186 mask!3328) (Found!7846 j!159)))))

(declare-fun b!767335 () Bool)

(declare-fun res!519102 () Bool)

(assert (=> b!767335 (=> (not res!519102) (not e!427302))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!767335 (= res!519102 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20246 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!519103 () Bool)

(assert (=> start!66576 (=> (not res!519103) (not e!427300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66576 (= res!519103 (validMask!0 mask!3328))))

(assert (=> start!66576 e!427300))

(assert (=> start!66576 true))

(declare-fun array_inv!16042 (array!42286) Bool)

(assert (=> start!66576 (array_inv!16042 a!3186)))

(declare-fun b!767336 () Bool)

(declare-fun e!427297 () Bool)

(assert (=> b!767336 (= e!427297 e!427298)))

(declare-fun res!519114 () Bool)

(assert (=> b!767336 (=> (not res!519114) (not e!427298))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42286 (_ BitVec 32)) SeekEntryResult!7846)

(assert (=> b!767336 (= res!519114 (= (seekEntryOrOpen!0 (select (arr!20246 a!3186) j!159) a!3186 mask!3328) lt!341345))))

(assert (=> b!767336 (= lt!341345 (Found!7846 j!159))))

(declare-fun b!767337 () Bool)

(declare-fun e!427295 () Bool)

(assert (=> b!767337 (= e!427302 e!427295)))

(declare-fun res!519111 () Bool)

(assert (=> b!767337 (=> (not res!519111) (not e!427295))))

(declare-fun lt!341343 () SeekEntryResult!7846)

(declare-fun lt!341344 () SeekEntryResult!7846)

(assert (=> b!767337 (= res!519111 (= lt!341343 lt!341344))))

(declare-fun lt!341346 () (_ BitVec 64))

(declare-fun lt!341348 () array!42286)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42286 (_ BitVec 32)) SeekEntryResult!7846)

(assert (=> b!767337 (= lt!341344 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!341346 lt!341348 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!767337 (= lt!341343 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!341346 mask!3328) lt!341346 lt!341348 mask!3328))))

(assert (=> b!767337 (= lt!341346 (select (store (arr!20246 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!767337 (= lt!341348 (array!42287 (store (arr!20246 a!3186) i!1173 k!2102) (size!20667 a!3186)))))

(declare-fun b!767338 () Bool)

(declare-fun e!427296 () Bool)

(assert (=> b!767338 (= e!427296 true)))

(declare-fun lt!341347 () SeekEntryResult!7846)

(assert (=> b!767338 (= lt!341347 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20246 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!767339 () Bool)

(declare-fun e!427294 () Bool)

(assert (=> b!767339 (= e!427294 e!427296)))

(declare-fun res!519110 () Bool)

(assert (=> b!767339 (=> res!519110 e!427296)))

(assert (=> b!767339 (= res!519110 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!341349 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!767339 (= lt!341349 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!767340 () Bool)

(declare-fun res!519109 () Bool)

(declare-fun e!427299 () Bool)

(assert (=> b!767340 (=> (not res!519109) (not e!427299))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42286 (_ BitVec 32)) Bool)

(assert (=> b!767340 (= res!519109 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!767341 () Bool)

(assert (=> b!767341 (= e!427300 e!427299)))

(declare-fun res!519117 () Bool)

(assert (=> b!767341 (=> (not res!519117) (not e!427299))))

(declare-fun lt!341342 () SeekEntryResult!7846)

(assert (=> b!767341 (= res!519117 (or (= lt!341342 (MissingZero!7846 i!1173)) (= lt!341342 (MissingVacant!7846 i!1173))))))

(assert (=> b!767341 (= lt!341342 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!767342 () Bool)

(assert (=> b!767342 (= e!427299 e!427302)))

(declare-fun res!519104 () Bool)

(assert (=> b!767342 (=> (not res!519104) (not e!427302))))

(declare-fun lt!341351 () SeekEntryResult!7846)

(assert (=> b!767342 (= res!519104 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20246 a!3186) j!159) mask!3328) (select (arr!20246 a!3186) j!159) a!3186 mask!3328) lt!341351))))

(assert (=> b!767342 (= lt!341351 (Intermediate!7846 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!767343 () Bool)

(declare-fun res!519106 () Bool)

(assert (=> b!767343 (=> (not res!519106) (not e!427300))))

(assert (=> b!767343 (= res!519106 (and (= (size!20667 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20667 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20667 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!767344 () Bool)

(declare-fun res!519118 () Bool)

(assert (=> b!767344 (=> (not res!519118) (not e!427300))))

(assert (=> b!767344 (= res!519118 (validKeyInArray!0 k!2102))))

(declare-fun b!767345 () Bool)

(assert (=> b!767345 (= e!427293 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20246 a!3186) j!159) a!3186 mask!3328) lt!341351))))

(declare-fun b!767346 () Bool)

(declare-fun res!519115 () Bool)

(assert (=> b!767346 (=> (not res!519115) (not e!427299))))

(assert (=> b!767346 (= res!519115 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20667 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20667 a!3186))))))

(declare-fun b!767347 () Bool)

(assert (=> b!767347 (= e!427295 (not e!427294))))

(declare-fun res!519116 () Bool)

(assert (=> b!767347 (=> res!519116 e!427294)))

(assert (=> b!767347 (= res!519116 (or (not (is-Intermediate!7846 lt!341344)) (bvsge x!1131 (x!64664 lt!341344))))))

(assert (=> b!767347 e!427297))

(declare-fun res!519108 () Bool)

(assert (=> b!767347 (=> (not res!519108) (not e!427297))))

(assert (=> b!767347 (= res!519108 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26418 0))(
  ( (Unit!26419) )
))
(declare-fun lt!341350 () Unit!26418)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42286 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26418)

(assert (=> b!767347 (= lt!341350 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!767348 () Bool)

(declare-fun res!519112 () Bool)

(assert (=> b!767348 (=> (not res!519112) (not e!427299))))

(declare-datatypes ((List!14248 0))(
  ( (Nil!14245) (Cons!14244 (h!15337 (_ BitVec 64)) (t!20563 List!14248)) )
))
(declare-fun arrayNoDuplicates!0 (array!42286 (_ BitVec 32) List!14248) Bool)

(assert (=> b!767348 (= res!519112 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14245))))

(assert (= (and start!66576 res!519103) b!767343))

(assert (= (and b!767343 res!519106) b!767331))

(assert (= (and b!767331 res!519105) b!767344))

(assert (= (and b!767344 res!519118) b!767333))

(assert (= (and b!767333 res!519113) b!767341))

(assert (= (and b!767341 res!519117) b!767340))

(assert (= (and b!767340 res!519109) b!767348))

(assert (= (and b!767348 res!519112) b!767346))

(assert (= (and b!767346 res!519115) b!767342))

(assert (= (and b!767342 res!519104) b!767335))

(assert (= (and b!767335 res!519102) b!767330))

(assert (= (and b!767330 c!84505) b!767345))

(assert (= (and b!767330 (not c!84505)) b!767334))

(assert (= (and b!767330 res!519107) b!767337))

(assert (= (and b!767337 res!519111) b!767347))

(assert (= (and b!767347 res!519108) b!767336))

(assert (= (and b!767336 res!519114) b!767332))

(assert (= (and b!767347 (not res!519116)) b!767339))

(assert (= (and b!767339 (not res!519110)) b!767338))

(declare-fun m!713121 () Bool)

(assert (=> b!767333 m!713121))

(declare-fun m!713123 () Bool)

(assert (=> b!767341 m!713123))

(declare-fun m!713125 () Bool)

(assert (=> b!767334 m!713125))

(assert (=> b!767334 m!713125))

(declare-fun m!713127 () Bool)

(assert (=> b!767334 m!713127))

(declare-fun m!713129 () Bool)

(assert (=> start!66576 m!713129))

(declare-fun m!713131 () Bool)

(assert (=> start!66576 m!713131))

(declare-fun m!713133 () Bool)

(assert (=> b!767340 m!713133))

(assert (=> b!767336 m!713125))

(assert (=> b!767336 m!713125))

(declare-fun m!713135 () Bool)

(assert (=> b!767336 m!713135))

(assert (=> b!767342 m!713125))

(assert (=> b!767342 m!713125))

(declare-fun m!713137 () Bool)

(assert (=> b!767342 m!713137))

(assert (=> b!767342 m!713137))

(assert (=> b!767342 m!713125))

(declare-fun m!713139 () Bool)

(assert (=> b!767342 m!713139))

(assert (=> b!767345 m!713125))

(assert (=> b!767345 m!713125))

(declare-fun m!713141 () Bool)

(assert (=> b!767345 m!713141))

(declare-fun m!713143 () Bool)

(assert (=> b!767339 m!713143))

(assert (=> b!767331 m!713125))

(assert (=> b!767331 m!713125))

(declare-fun m!713145 () Bool)

(assert (=> b!767331 m!713145))

(assert (=> b!767338 m!713125))

(assert (=> b!767338 m!713125))

(assert (=> b!767338 m!713127))

(declare-fun m!713147 () Bool)

(assert (=> b!767337 m!713147))

(declare-fun m!713149 () Bool)

(assert (=> b!767337 m!713149))

(declare-fun m!713151 () Bool)

(assert (=> b!767337 m!713151))

(declare-fun m!713153 () Bool)

(assert (=> b!767337 m!713153))

(assert (=> b!767337 m!713147))

(declare-fun m!713155 () Bool)

(assert (=> b!767337 m!713155))

(assert (=> b!767332 m!713125))

(assert (=> b!767332 m!713125))

(declare-fun m!713157 () Bool)

(assert (=> b!767332 m!713157))

(declare-fun m!713159 () Bool)

(assert (=> b!767348 m!713159))

(declare-fun m!713161 () Bool)

(assert (=> b!767335 m!713161))

(declare-fun m!713163 () Bool)

(assert (=> b!767344 m!713163))

(declare-fun m!713165 () Bool)

(assert (=> b!767347 m!713165))

(declare-fun m!713167 () Bool)

(assert (=> b!767347 m!713167))

(push 1)

