; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64472 () Bool)

(assert start!64472)

(declare-fun b!725112 () Bool)

(declare-fun e!406101 () Bool)

(declare-fun e!406099 () Bool)

(assert (=> b!725112 (= e!406101 e!406099)))

(declare-fun res!486262 () Bool)

(assert (=> b!725112 (=> (not res!486262) (not e!406099))))

(declare-datatypes ((SeekEntryResult!7216 0))(
  ( (MissingZero!7216 (index!31232 (_ BitVec 32))) (Found!7216 (index!31233 (_ BitVec 32))) (Intermediate!7216 (undefined!8028 Bool) (index!31234 (_ BitVec 32)) (x!62226 (_ BitVec 32))) (Undefined!7216) (MissingVacant!7216 (index!31235 (_ BitVec 32))) )
))
(declare-fun lt!321232 () SeekEntryResult!7216)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!725112 (= res!486262 (or (= lt!321232 (MissingZero!7216 i!1173)) (= lt!321232 (MissingVacant!7216 i!1173))))))

(declare-datatypes ((array!40990 0))(
  ( (array!40991 (arr!19616 (Array (_ BitVec 32) (_ BitVec 64))) (size!20037 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40990)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40990 (_ BitVec 32)) SeekEntryResult!7216)

(assert (=> b!725112 (= lt!321232 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!725113 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!321231 () SeekEntryResult!7216)

(declare-fun e!406103 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40990 (_ BitVec 32)) SeekEntryResult!7216)

(assert (=> b!725113 (= e!406103 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19616 a!3186) j!159) a!3186 mask!3328) lt!321231))))

(declare-fun res!486253 () Bool)

(assert (=> start!64472 (=> (not res!486253) (not e!406101))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64472 (= res!486253 (validMask!0 mask!3328))))

(assert (=> start!64472 e!406101))

(assert (=> start!64472 true))

(declare-fun array_inv!15412 (array!40990) Bool)

(assert (=> start!64472 (array_inv!15412 a!3186)))

(declare-fun b!725114 () Bool)

(declare-fun res!486259 () Bool)

(assert (=> b!725114 (=> (not res!486259) (not e!406099))))

(declare-datatypes ((List!13618 0))(
  ( (Nil!13615) (Cons!13614 (h!14671 (_ BitVec 64)) (t!19933 List!13618)) )
))
(declare-fun arrayNoDuplicates!0 (array!40990 (_ BitVec 32) List!13618) Bool)

(assert (=> b!725114 (= res!486259 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13615))))

(declare-fun b!725115 () Bool)

(declare-fun res!486255 () Bool)

(assert (=> b!725115 (=> (not res!486255) (not e!406099))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!725115 (= res!486255 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20037 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20037 a!3186))))))

(declare-fun b!725116 () Bool)

(declare-fun res!486256 () Bool)

(declare-fun e!406102 () Bool)

(assert (=> b!725116 (=> (not res!486256) (not e!406102))))

(assert (=> b!725116 (= res!486256 e!406103)))

(declare-fun c!79804 () Bool)

(assert (=> b!725116 (= c!79804 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!725117 () Bool)

(declare-fun res!486258 () Bool)

(assert (=> b!725117 (=> (not res!486258) (not e!406101))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!725117 (= res!486258 (validKeyInArray!0 k!2102))))

(declare-fun b!725118 () Bool)

(declare-fun res!486254 () Bool)

(assert (=> b!725118 (=> (not res!486254) (not e!406102))))

(assert (=> b!725118 (= res!486254 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19616 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!725119 () Bool)

(declare-fun res!486252 () Bool)

(assert (=> b!725119 (=> (not res!486252) (not e!406099))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40990 (_ BitVec 32)) Bool)

(assert (=> b!725119 (= res!486252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!725120 () Bool)

(declare-fun e!406100 () Bool)

(assert (=> b!725120 (= e!406100 (= (seekEntryOrOpen!0 (select (arr!19616 a!3186) j!159) a!3186 mask!3328) (Found!7216 j!159)))))

(declare-fun b!725121 () Bool)

(declare-fun res!486260 () Bool)

(assert (=> b!725121 (=> (not res!486260) (not e!406101))))

(assert (=> b!725121 (= res!486260 (and (= (size!20037 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20037 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20037 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!725122 () Bool)

(declare-fun e!406098 () Bool)

(assert (=> b!725122 (= e!406102 e!406098)))

(declare-fun res!486250 () Bool)

(assert (=> b!725122 (=> (not res!486250) (not e!406098))))

(declare-fun lt!321229 () array!40990)

(declare-fun lt!321233 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!725122 (= res!486250 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321233 mask!3328) lt!321233 lt!321229 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321233 lt!321229 mask!3328)))))

(assert (=> b!725122 (= lt!321233 (select (store (arr!19616 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!725122 (= lt!321229 (array!40991 (store (arr!19616 a!3186) i!1173 k!2102) (size!20037 a!3186)))))

(declare-fun b!725123 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40990 (_ BitVec 32)) SeekEntryResult!7216)

(assert (=> b!725123 (= e!406103 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19616 a!3186) j!159) a!3186 mask!3328) (Found!7216 j!159)))))

(declare-fun b!725124 () Bool)

(declare-fun res!486261 () Bool)

(assert (=> b!725124 (=> (not res!486261) (not e!406101))))

(declare-fun arrayContainsKey!0 (array!40990 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!725124 (= res!486261 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!725125 () Bool)

(declare-fun res!486263 () Bool)

(assert (=> b!725125 (=> (not res!486263) (not e!406101))))

(assert (=> b!725125 (= res!486263 (validKeyInArray!0 (select (arr!19616 a!3186) j!159)))))

(declare-fun b!725126 () Bool)

(assert (=> b!725126 (= e!406098 (not true))))

(assert (=> b!725126 e!406100))

(declare-fun res!486251 () Bool)

(assert (=> b!725126 (=> (not res!486251) (not e!406100))))

(assert (=> b!725126 (= res!486251 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24750 0))(
  ( (Unit!24751) )
))
(declare-fun lt!321230 () Unit!24750)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40990 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24750)

(assert (=> b!725126 (= lt!321230 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!725127 () Bool)

(assert (=> b!725127 (= e!406099 e!406102)))

(declare-fun res!486257 () Bool)

(assert (=> b!725127 (=> (not res!486257) (not e!406102))))

(assert (=> b!725127 (= res!486257 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19616 a!3186) j!159) mask!3328) (select (arr!19616 a!3186) j!159) a!3186 mask!3328) lt!321231))))

(assert (=> b!725127 (= lt!321231 (Intermediate!7216 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!64472 res!486253) b!725121))

(assert (= (and b!725121 res!486260) b!725125))

(assert (= (and b!725125 res!486263) b!725117))

(assert (= (and b!725117 res!486258) b!725124))

(assert (= (and b!725124 res!486261) b!725112))

(assert (= (and b!725112 res!486262) b!725119))

(assert (= (and b!725119 res!486252) b!725114))

(assert (= (and b!725114 res!486259) b!725115))

(assert (= (and b!725115 res!486255) b!725127))

(assert (= (and b!725127 res!486257) b!725118))

(assert (= (and b!725118 res!486254) b!725116))

(assert (= (and b!725116 c!79804) b!725113))

(assert (= (and b!725116 (not c!79804)) b!725123))

(assert (= (and b!725116 res!486256) b!725122))

(assert (= (and b!725122 res!486250) b!725126))

(assert (= (and b!725126 res!486251) b!725120))

(declare-fun m!679307 () Bool)

(assert (=> b!725120 m!679307))

(assert (=> b!725120 m!679307))

(declare-fun m!679309 () Bool)

(assert (=> b!725120 m!679309))

(assert (=> b!725127 m!679307))

(assert (=> b!725127 m!679307))

(declare-fun m!679311 () Bool)

(assert (=> b!725127 m!679311))

(assert (=> b!725127 m!679311))

(assert (=> b!725127 m!679307))

(declare-fun m!679313 () Bool)

(assert (=> b!725127 m!679313))

(declare-fun m!679315 () Bool)

(assert (=> b!725119 m!679315))

(declare-fun m!679317 () Bool)

(assert (=> start!64472 m!679317))

(declare-fun m!679319 () Bool)

(assert (=> start!64472 m!679319))

(declare-fun m!679321 () Bool)

(assert (=> b!725112 m!679321))

(assert (=> b!725123 m!679307))

(assert (=> b!725123 m!679307))

(declare-fun m!679323 () Bool)

(assert (=> b!725123 m!679323))

(declare-fun m!679325 () Bool)

(assert (=> b!725122 m!679325))

(declare-fun m!679327 () Bool)

(assert (=> b!725122 m!679327))

(declare-fun m!679329 () Bool)

(assert (=> b!725122 m!679329))

(assert (=> b!725122 m!679325))

(declare-fun m!679331 () Bool)

(assert (=> b!725122 m!679331))

(declare-fun m!679333 () Bool)

(assert (=> b!725122 m!679333))

(declare-fun m!679335 () Bool)

(assert (=> b!725114 m!679335))

(assert (=> b!725113 m!679307))

(assert (=> b!725113 m!679307))

(declare-fun m!679337 () Bool)

(assert (=> b!725113 m!679337))

(assert (=> b!725125 m!679307))

(assert (=> b!725125 m!679307))

(declare-fun m!679339 () Bool)

(assert (=> b!725125 m!679339))

(declare-fun m!679341 () Bool)

(assert (=> b!725126 m!679341))

(declare-fun m!679343 () Bool)

(assert (=> b!725126 m!679343))

(declare-fun m!679345 () Bool)

(assert (=> b!725117 m!679345))

(declare-fun m!679347 () Bool)

(assert (=> b!725118 m!679347))

(declare-fun m!679349 () Bool)

(assert (=> b!725124 m!679349))

(push 1)

