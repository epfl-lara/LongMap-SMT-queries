; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67570 () Bool)

(assert start!67570)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42673 0))(
  ( (array!42674 (arr!20426 (Array (_ BitVec 32) (_ BitVec 64))) (size!20847 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42673)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!434998 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8026 0))(
  ( (MissingZero!8026 (index!34472 (_ BitVec 32))) (Found!8026 (index!34473 (_ BitVec 32))) (Intermediate!8026 (undefined!8838 Bool) (index!34474 (_ BitVec 32)) (x!65421 (_ BitVec 32))) (Undefined!8026) (MissingVacant!8026 (index!34475 (_ BitVec 32))) )
))
(declare-fun lt!348620 () SeekEntryResult!8026)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!782266 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42673 (_ BitVec 32)) SeekEntryResult!8026)

(assert (=> b!782266 (= e!434998 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20426 a!3186) j!159) a!3186 mask!3328) lt!348620))))

(declare-fun b!782267 () Bool)

(declare-fun e!434999 () Bool)

(declare-fun e!435001 () Bool)

(assert (=> b!782267 (= e!434999 e!435001)))

(declare-fun res!529306 () Bool)

(assert (=> b!782267 (=> (not res!529306) (not e!435001))))

(declare-fun lt!348623 () SeekEntryResult!8026)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42673 (_ BitVec 32)) SeekEntryResult!8026)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!782267 (= res!529306 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20426 a!3186) j!159) mask!3328) (select (arr!20426 a!3186) j!159) a!3186 mask!3328) lt!348623))))

(assert (=> b!782267 (= lt!348623 (Intermediate!8026 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!782268 () Bool)

(declare-fun res!529316 () Bool)

(declare-fun e!435002 () Bool)

(assert (=> b!782268 (=> (not res!529316) (not e!435002))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!782268 (= res!529316 (and (= (size!20847 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20847 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20847 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!782269 () Bool)

(declare-fun res!529305 () Bool)

(assert (=> b!782269 (=> (not res!529305) (not e!435002))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42673 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!782269 (= res!529305 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!782270 () Bool)

(declare-datatypes ((Unit!26992 0))(
  ( (Unit!26993) )
))
(declare-fun e!435005 () Unit!26992)

(declare-fun Unit!26994 () Unit!26992)

(assert (=> b!782270 (= e!435005 Unit!26994)))

(declare-fun b!782271 () Bool)

(assert (=> b!782271 (= e!435002 e!434999)))

(declare-fun res!529312 () Bool)

(assert (=> b!782271 (=> (not res!529312) (not e!434999))))

(declare-fun lt!348626 () SeekEntryResult!8026)

(assert (=> b!782271 (= res!529312 (or (= lt!348626 (MissingZero!8026 i!1173)) (= lt!348626 (MissingVacant!8026 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42673 (_ BitVec 32)) SeekEntryResult!8026)

(assert (=> b!782271 (= lt!348626 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!782272 () Bool)

(declare-fun e!435003 () Bool)

(assert (=> b!782272 (= e!435001 e!435003)))

(declare-fun res!529301 () Bool)

(assert (=> b!782272 (=> (not res!529301) (not e!435003))))

(declare-fun lt!348622 () SeekEntryResult!8026)

(declare-fun lt!348621 () SeekEntryResult!8026)

(assert (=> b!782272 (= res!529301 (= lt!348622 lt!348621))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!348624 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!348627 () array!42673)

(assert (=> b!782272 (= lt!348621 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348624 lt!348627 mask!3328))))

(assert (=> b!782272 (= lt!348622 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348624 mask!3328) lt!348624 lt!348627 mask!3328))))

(assert (=> b!782272 (= lt!348624 (select (store (arr!20426 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!782272 (= lt!348627 (array!42674 (store (arr!20426 a!3186) i!1173 k!2102) (size!20847 a!3186)))))

(declare-fun b!782273 () Bool)

(declare-fun res!529302 () Bool)

(assert (=> b!782273 (=> (not res!529302) (not e!435001))))

(assert (=> b!782273 (= res!529302 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20426 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!782275 () Bool)

(declare-fun res!529309 () Bool)

(assert (=> b!782275 (=> (not res!529309) (not e!435002))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!782275 (= res!529309 (validKeyInArray!0 k!2102))))

(declare-fun b!782276 () Bool)

(declare-fun e!435004 () Bool)

(assert (=> b!782276 (= e!435004 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20426 a!3186) j!159) a!3186 mask!3328) (Found!8026 j!159)))))

(declare-fun b!782277 () Bool)

(declare-fun res!529308 () Bool)

(assert (=> b!782277 (=> (not res!529308) (not e!434999))))

(assert (=> b!782277 (= res!529308 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20847 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20847 a!3186))))))

(declare-fun b!782278 () Bool)

(declare-fun res!529307 () Bool)

(assert (=> b!782278 (=> (not res!529307) (not e!434999))))

(declare-datatypes ((List!14428 0))(
  ( (Nil!14425) (Cons!14424 (h!15544 (_ BitVec 64)) (t!20743 List!14428)) )
))
(declare-fun arrayNoDuplicates!0 (array!42673 (_ BitVec 32) List!14428) Bool)

(assert (=> b!782278 (= res!529307 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14425))))

(declare-fun b!782279 () Bool)

(declare-fun res!529314 () Bool)

(assert (=> b!782279 (=> (not res!529314) (not e!435001))))

(assert (=> b!782279 (= res!529314 e!435004)))

(declare-fun c!86889 () Bool)

(assert (=> b!782279 (= c!86889 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!782280 () Bool)

(declare-fun e!434997 () Bool)

(assert (=> b!782280 (= e!435003 (not e!434997))))

(declare-fun res!529313 () Bool)

(assert (=> b!782280 (=> res!529313 e!434997)))

(assert (=> b!782280 (= res!529313 (or (not (is-Intermediate!8026 lt!348621)) (bvslt x!1131 (x!65421 lt!348621)) (not (= x!1131 (x!65421 lt!348621))) (not (= index!1321 (index!34474 lt!348621)))))))

(assert (=> b!782280 e!434998))

(declare-fun res!529304 () Bool)

(assert (=> b!782280 (=> (not res!529304) (not e!434998))))

(declare-fun lt!348629 () SeekEntryResult!8026)

(assert (=> b!782280 (= res!529304 (= lt!348629 lt!348620))))

(assert (=> b!782280 (= lt!348620 (Found!8026 j!159))))

(assert (=> b!782280 (= lt!348629 (seekEntryOrOpen!0 (select (arr!20426 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42673 (_ BitVec 32)) Bool)

(assert (=> b!782280 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!348625 () Unit!26992)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42673 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26992)

(assert (=> b!782280 (= lt!348625 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!782281 () Bool)

(declare-fun res!529303 () Bool)

(assert (=> b!782281 (=> (not res!529303) (not e!434999))))

(assert (=> b!782281 (= res!529303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!782282 () Bool)

(declare-fun res!529315 () Bool)

(assert (=> b!782282 (=> res!529315 e!434997)))

(assert (=> b!782282 (= res!529315 (= (select (store (arr!20426 a!3186) i!1173 k!2102) index!1321) lt!348624))))

(declare-fun b!782283 () Bool)

(declare-fun Unit!26995 () Unit!26992)

(assert (=> b!782283 (= e!435005 Unit!26995)))

(assert (=> b!782283 false))

(declare-fun b!782284 () Bool)

(declare-fun res!529311 () Bool)

(assert (=> b!782284 (=> (not res!529311) (not e!435002))))

(assert (=> b!782284 (= res!529311 (validKeyInArray!0 (select (arr!20426 a!3186) j!159)))))

(declare-fun b!782285 () Bool)

(assert (=> b!782285 (= e!434997 true)))

(assert (=> b!782285 (= (select (store (arr!20426 a!3186) i!1173 k!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!348628 () Unit!26992)

(assert (=> b!782285 (= lt!348628 e!435005)))

(declare-fun c!86890 () Bool)

(assert (=> b!782285 (= c!86890 (= (select (store (arr!20426 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!782286 () Bool)

(assert (=> b!782286 (= e!435004 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20426 a!3186) j!159) a!3186 mask!3328) lt!348623))))

(declare-fun res!529310 () Bool)

(assert (=> start!67570 (=> (not res!529310) (not e!435002))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67570 (= res!529310 (validMask!0 mask!3328))))

(assert (=> start!67570 e!435002))

(assert (=> start!67570 true))

(declare-fun array_inv!16222 (array!42673) Bool)

(assert (=> start!67570 (array_inv!16222 a!3186)))

(declare-fun b!782274 () Bool)

(declare-fun res!529300 () Bool)

(assert (=> b!782274 (=> res!529300 e!434997)))

(assert (=> b!782274 (= res!529300 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20426 a!3186) j!159) a!3186 mask!3328) lt!348620)))))

(assert (= (and start!67570 res!529310) b!782268))

(assert (= (and b!782268 res!529316) b!782284))

(assert (= (and b!782284 res!529311) b!782275))

(assert (= (and b!782275 res!529309) b!782269))

(assert (= (and b!782269 res!529305) b!782271))

(assert (= (and b!782271 res!529312) b!782281))

(assert (= (and b!782281 res!529303) b!782278))

(assert (= (and b!782278 res!529307) b!782277))

(assert (= (and b!782277 res!529308) b!782267))

(assert (= (and b!782267 res!529306) b!782273))

(assert (= (and b!782273 res!529302) b!782279))

(assert (= (and b!782279 c!86889) b!782286))

(assert (= (and b!782279 (not c!86889)) b!782276))

(assert (= (and b!782279 res!529314) b!782272))

(assert (= (and b!782272 res!529301) b!782280))

(assert (= (and b!782280 res!529304) b!782266))

(assert (= (and b!782280 (not res!529313)) b!782274))

(assert (= (and b!782274 (not res!529300)) b!782282))

(assert (= (and b!782282 (not res!529315)) b!782285))

(assert (= (and b!782285 c!86890) b!782283))

(assert (= (and b!782285 (not c!86890)) b!782270))

(declare-fun m!725099 () Bool)

(assert (=> b!782275 m!725099))

(declare-fun m!725101 () Bool)

(assert (=> b!782286 m!725101))

(assert (=> b!782286 m!725101))

(declare-fun m!725103 () Bool)

(assert (=> b!782286 m!725103))

(assert (=> b!782267 m!725101))

(assert (=> b!782267 m!725101))

(declare-fun m!725105 () Bool)

(assert (=> b!782267 m!725105))

(assert (=> b!782267 m!725105))

(assert (=> b!782267 m!725101))

(declare-fun m!725107 () Bool)

(assert (=> b!782267 m!725107))

(assert (=> b!782284 m!725101))

(assert (=> b!782284 m!725101))

(declare-fun m!725109 () Bool)

(assert (=> b!782284 m!725109))

(declare-fun m!725111 () Bool)

(assert (=> b!782271 m!725111))

(assert (=> b!782276 m!725101))

(assert (=> b!782276 m!725101))

(declare-fun m!725113 () Bool)

(assert (=> b!782276 m!725113))

(assert (=> b!782266 m!725101))

(assert (=> b!782266 m!725101))

(declare-fun m!725115 () Bool)

(assert (=> b!782266 m!725115))

(declare-fun m!725117 () Bool)

(assert (=> b!782278 m!725117))

(declare-fun m!725119 () Bool)

(assert (=> b!782273 m!725119))

(assert (=> b!782274 m!725101))

(assert (=> b!782274 m!725101))

(assert (=> b!782274 m!725113))

(declare-fun m!725121 () Bool)

(assert (=> b!782285 m!725121))

(declare-fun m!725123 () Bool)

(assert (=> b!782285 m!725123))

(declare-fun m!725125 () Bool)

(assert (=> start!67570 m!725125))

(declare-fun m!725127 () Bool)

(assert (=> start!67570 m!725127))

(assert (=> b!782280 m!725101))

(assert (=> b!782280 m!725101))

(declare-fun m!725129 () Bool)

(assert (=> b!782280 m!725129))

(declare-fun m!725131 () Bool)

(assert (=> b!782280 m!725131))

(declare-fun m!725133 () Bool)

(assert (=> b!782280 m!725133))

(declare-fun m!725135 () Bool)

(assert (=> b!782272 m!725135))

(declare-fun m!725137 () Bool)

(assert (=> b!782272 m!725137))

(declare-fun m!725139 () Bool)

(assert (=> b!782272 m!725139))

(assert (=> b!782272 m!725121))

(declare-fun m!725141 () Bool)

(assert (=> b!782272 m!725141))

(assert (=> b!782272 m!725137))

(declare-fun m!725143 () Bool)

(assert (=> b!782269 m!725143))

(assert (=> b!782282 m!725121))

(assert (=> b!782282 m!725123))

(declare-fun m!725145 () Bool)

(assert (=> b!782281 m!725145))

(push 1)

