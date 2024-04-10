; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64514 () Bool)

(assert start!64514)

(declare-fun b!726191 () Bool)

(declare-fun e!406611 () Bool)

(assert (=> b!726191 (= e!406611 (not true))))

(declare-fun e!406614 () Bool)

(assert (=> b!726191 e!406614))

(declare-fun res!487204 () Bool)

(assert (=> b!726191 (=> (not res!487204) (not e!406614))))

(declare-datatypes ((array!41032 0))(
  ( (array!41033 (arr!19637 (Array (_ BitVec 32) (_ BitVec 64))) (size!20058 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41032)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41032 (_ BitVec 32)) Bool)

(assert (=> b!726191 (= res!487204 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24792 0))(
  ( (Unit!24793) )
))
(declare-fun lt!321610 () Unit!24792)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41032 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24792)

(assert (=> b!726191 (= lt!321610 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7237 0))(
  ( (MissingZero!7237 (index!31316 (_ BitVec 32))) (Found!7237 (index!31317 (_ BitVec 32))) (Intermediate!7237 (undefined!8049 Bool) (index!31318 (_ BitVec 32)) (x!62303 (_ BitVec 32))) (Undefined!7237) (MissingVacant!7237 (index!31319 (_ BitVec 32))) )
))
(declare-fun lt!321607 () SeekEntryResult!7237)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!726192 () Bool)

(declare-fun e!406609 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41032 (_ BitVec 32)) SeekEntryResult!7237)

(assert (=> b!726192 (= e!406609 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19637 a!3186) j!159) a!3186 mask!3328) lt!321607))))

(declare-fun b!726193 () Bool)

(declare-fun res!487207 () Bool)

(declare-fun e!406612 () Bool)

(assert (=> b!726193 (=> (not res!487207) (not e!406612))))

(declare-datatypes ((List!13639 0))(
  ( (Nil!13636) (Cons!13635 (h!14692 (_ BitVec 64)) (t!19954 List!13639)) )
))
(declare-fun arrayNoDuplicates!0 (array!41032 (_ BitVec 32) List!13639) Bool)

(assert (=> b!726193 (= res!487207 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13636))))

(declare-fun b!726194 () Bool)

(declare-fun res!487211 () Bool)

(declare-fun e!406613 () Bool)

(assert (=> b!726194 (=> (not res!487211) (not e!406613))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!726194 (= res!487211 (validKeyInArray!0 k!2102))))

(declare-fun b!726195 () Bool)

(declare-fun res!487208 () Bool)

(assert (=> b!726195 (=> (not res!487208) (not e!406612))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!726195 (= res!487208 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20058 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20058 a!3186))))))

(declare-fun lt!321606 () SeekEntryResult!7237)

(declare-fun b!726196 () Bool)

(declare-fun e!406610 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41032 (_ BitVec 32)) SeekEntryResult!7237)

(assert (=> b!726196 (= e!406610 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19637 a!3186) j!159) a!3186 mask!3328) lt!321606))))

(declare-fun b!726197 () Bool)

(declare-fun res!487217 () Bool)

(assert (=> b!726197 (=> (not res!487217) (not e!406612))))

(assert (=> b!726197 (= res!487217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!726198 () Bool)

(assert (=> b!726198 (= e!406614 e!406609)))

(declare-fun res!487203 () Bool)

(assert (=> b!726198 (=> (not res!487203) (not e!406609))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41032 (_ BitVec 32)) SeekEntryResult!7237)

(assert (=> b!726198 (= res!487203 (= (seekEntryOrOpen!0 (select (arr!19637 a!3186) j!159) a!3186 mask!3328) lt!321607))))

(assert (=> b!726198 (= lt!321607 (Found!7237 j!159))))

(declare-fun b!726199 () Bool)

(assert (=> b!726199 (= e!406610 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19637 a!3186) j!159) a!3186 mask!3328) (Found!7237 j!159)))))

(declare-fun b!726200 () Bool)

(declare-fun res!487213 () Bool)

(declare-fun e!406616 () Bool)

(assert (=> b!726200 (=> (not res!487213) (not e!406616))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!726200 (= res!487213 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19637 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!726201 () Bool)

(assert (=> b!726201 (= e!406613 e!406612)))

(declare-fun res!487212 () Bool)

(assert (=> b!726201 (=> (not res!487212) (not e!406612))))

(declare-fun lt!321608 () SeekEntryResult!7237)

(assert (=> b!726201 (= res!487212 (or (= lt!321608 (MissingZero!7237 i!1173)) (= lt!321608 (MissingVacant!7237 i!1173))))))

(assert (=> b!726201 (= lt!321608 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!726202 () Bool)

(declare-fun res!487216 () Bool)

(assert (=> b!726202 (=> (not res!487216) (not e!406613))))

(assert (=> b!726202 (= res!487216 (validKeyInArray!0 (select (arr!19637 a!3186) j!159)))))

(declare-fun b!726203 () Bool)

(assert (=> b!726203 (= e!406612 e!406616)))

(declare-fun res!487205 () Bool)

(assert (=> b!726203 (=> (not res!487205) (not e!406616))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726203 (= res!487205 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19637 a!3186) j!159) mask!3328) (select (arr!19637 a!3186) j!159) a!3186 mask!3328) lt!321606))))

(assert (=> b!726203 (= lt!321606 (Intermediate!7237 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!726204 () Bool)

(declare-fun res!487210 () Bool)

(assert (=> b!726204 (=> (not res!487210) (not e!406613))))

(assert (=> b!726204 (= res!487210 (and (= (size!20058 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20058 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20058 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!726205 () Bool)

(assert (=> b!726205 (= e!406616 e!406611)))

(declare-fun res!487206 () Bool)

(assert (=> b!726205 (=> (not res!487206) (not e!406611))))

(declare-fun lt!321609 () (_ BitVec 64))

(declare-fun lt!321611 () array!41032)

(assert (=> b!726205 (= res!487206 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321609 mask!3328) lt!321609 lt!321611 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321609 lt!321611 mask!3328)))))

(assert (=> b!726205 (= lt!321609 (select (store (arr!19637 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!726205 (= lt!321611 (array!41033 (store (arr!19637 a!3186) i!1173 k!2102) (size!20058 a!3186)))))

(declare-fun b!726206 () Bool)

(declare-fun res!487215 () Bool)

(assert (=> b!726206 (=> (not res!487215) (not e!406613))))

(declare-fun arrayContainsKey!0 (array!41032 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!726206 (= res!487215 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!726207 () Bool)

(declare-fun res!487214 () Bool)

(assert (=> b!726207 (=> (not res!487214) (not e!406616))))

(assert (=> b!726207 (= res!487214 e!406610)))

(declare-fun c!79867 () Bool)

(assert (=> b!726207 (= c!79867 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!487209 () Bool)

(assert (=> start!64514 (=> (not res!487209) (not e!406613))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64514 (= res!487209 (validMask!0 mask!3328))))

(assert (=> start!64514 e!406613))

(assert (=> start!64514 true))

(declare-fun array_inv!15433 (array!41032) Bool)

(assert (=> start!64514 (array_inv!15433 a!3186)))

(assert (= (and start!64514 res!487209) b!726204))

(assert (= (and b!726204 res!487210) b!726202))

(assert (= (and b!726202 res!487216) b!726194))

(assert (= (and b!726194 res!487211) b!726206))

(assert (= (and b!726206 res!487215) b!726201))

(assert (= (and b!726201 res!487212) b!726197))

(assert (= (and b!726197 res!487217) b!726193))

(assert (= (and b!726193 res!487207) b!726195))

(assert (= (and b!726195 res!487208) b!726203))

(assert (= (and b!726203 res!487205) b!726200))

(assert (= (and b!726200 res!487213) b!726207))

(assert (= (and b!726207 c!79867) b!726196))

(assert (= (and b!726207 (not c!79867)) b!726199))

(assert (= (and b!726207 res!487214) b!726205))

(assert (= (and b!726205 res!487206) b!726191))

(assert (= (and b!726191 res!487204) b!726198))

(assert (= (and b!726198 res!487203) b!726192))

(declare-fun m!680277 () Bool)

(assert (=> b!726200 m!680277))

(declare-fun m!680279 () Bool)

(assert (=> b!726197 m!680279))

(declare-fun m!680281 () Bool)

(assert (=> b!726193 m!680281))

(declare-fun m!680283 () Bool)

(assert (=> start!64514 m!680283))

(declare-fun m!680285 () Bool)

(assert (=> start!64514 m!680285))

(declare-fun m!680287 () Bool)

(assert (=> b!726199 m!680287))

(assert (=> b!726199 m!680287))

(declare-fun m!680289 () Bool)

(assert (=> b!726199 m!680289))

(declare-fun m!680291 () Bool)

(assert (=> b!726201 m!680291))

(assert (=> b!726196 m!680287))

(assert (=> b!726196 m!680287))

(declare-fun m!680293 () Bool)

(assert (=> b!726196 m!680293))

(assert (=> b!726198 m!680287))

(assert (=> b!726198 m!680287))

(declare-fun m!680295 () Bool)

(assert (=> b!726198 m!680295))

(declare-fun m!680297 () Bool)

(assert (=> b!726191 m!680297))

(declare-fun m!680299 () Bool)

(assert (=> b!726191 m!680299))

(assert (=> b!726203 m!680287))

(assert (=> b!726203 m!680287))

(declare-fun m!680301 () Bool)

(assert (=> b!726203 m!680301))

(assert (=> b!726203 m!680301))

(assert (=> b!726203 m!680287))

(declare-fun m!680303 () Bool)

(assert (=> b!726203 m!680303))

(assert (=> b!726192 m!680287))

(assert (=> b!726192 m!680287))

(declare-fun m!680305 () Bool)

(assert (=> b!726192 m!680305))

(declare-fun m!680307 () Bool)

(assert (=> b!726206 m!680307))

(assert (=> b!726202 m!680287))

(assert (=> b!726202 m!680287))

(declare-fun m!680309 () Bool)

(assert (=> b!726202 m!680309))

(declare-fun m!680311 () Bool)

(assert (=> b!726205 m!680311))

(declare-fun m!680313 () Bool)

(assert (=> b!726205 m!680313))

(declare-fun m!680315 () Bool)

(assert (=> b!726205 m!680315))

(declare-fun m!680317 () Bool)

(assert (=> b!726205 m!680317))

(declare-fun m!680319 () Bool)

(assert (=> b!726205 m!680319))

(assert (=> b!726205 m!680313))

(declare-fun m!680321 () Bool)

(assert (=> b!726194 m!680321))

(push 1)

