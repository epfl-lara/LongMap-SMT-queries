; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67696 () Bool)

(assert start!67696)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42679 0))(
  ( (array!42680 (arr!20425 (Array (_ BitVec 32) (_ BitVec 64))) (size!20845 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42679)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!435532 () Bool)

(declare-datatypes ((SeekEntryResult!7981 0))(
  ( (MissingZero!7981 (index!34292 (_ BitVec 32))) (Found!7981 (index!34293 (_ BitVec 32))) (Intermediate!7981 (undefined!8793 Bool) (index!34294 (_ BitVec 32)) (x!65403 (_ BitVec 32))) (Undefined!7981) (MissingVacant!7981 (index!34295 (_ BitVec 32))) )
))
(declare-fun lt!349016 () SeekEntryResult!7981)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!783163 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42679 (_ BitVec 32)) SeekEntryResult!7981)

(assert (=> b!783163 (= e!435532 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20425 a!3186) j!159) a!3186 mask!3328) lt!349016))))

(declare-fun b!783164 () Bool)

(declare-fun e!435528 () Bool)

(declare-fun e!435531 () Bool)

(assert (=> b!783164 (= e!435528 (not e!435531))))

(declare-fun res!529788 () Bool)

(assert (=> b!783164 (=> res!529788 e!435531)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!349021 () SeekEntryResult!7981)

(declare-fun index!1321 () (_ BitVec 32))

(get-info :version)

(assert (=> b!783164 (= res!529788 (or (not ((_ is Intermediate!7981) lt!349021)) (bvslt x!1131 (x!65403 lt!349021)) (not (= x!1131 (x!65403 lt!349021))) (not (= index!1321 (index!34294 lt!349021)))))))

(assert (=> b!783164 e!435532))

(declare-fun res!529786 () Bool)

(assert (=> b!783164 (=> (not res!529786) (not e!435532))))

(declare-fun lt!349017 () SeekEntryResult!7981)

(assert (=> b!783164 (= res!529786 (= lt!349017 lt!349016))))

(assert (=> b!783164 (= lt!349016 (Found!7981 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42679 (_ BitVec 32)) SeekEntryResult!7981)

(assert (=> b!783164 (= lt!349017 (seekEntryOrOpen!0 (select (arr!20425 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42679 (_ BitVec 32)) Bool)

(assert (=> b!783164 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26989 0))(
  ( (Unit!26990) )
))
(declare-fun lt!349018 () Unit!26989)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42679 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26989)

(assert (=> b!783164 (= lt!349018 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!783165 () Bool)

(declare-fun res!529785 () Bool)

(declare-fun e!435530 () Bool)

(assert (=> b!783165 (=> (not res!529785) (not e!435530))))

(assert (=> b!783165 (= res!529785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!783166 () Bool)

(declare-fun res!529775 () Bool)

(assert (=> b!783166 (=> (not res!529775) (not e!435530))))

(assert (=> b!783166 (= res!529775 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20845 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20845 a!3186))))))

(declare-fun b!783167 () Bool)

(declare-fun e!435524 () Unit!26989)

(declare-fun Unit!26991 () Unit!26989)

(assert (=> b!783167 (= e!435524 Unit!26991)))

(assert (=> b!783167 false))

(declare-fun b!783168 () Bool)

(declare-fun res!529789 () Bool)

(declare-fun e!435529 () Bool)

(assert (=> b!783168 (=> (not res!529789) (not e!435529))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!783168 (= res!529789 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20425 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!783169 () Bool)

(declare-fun e!435523 () Bool)

(assert (=> b!783169 (= e!435523 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20425 a!3186) j!159) a!3186 mask!3328) (Found!7981 j!159)))))

(declare-fun b!783170 () Bool)

(declare-fun res!529779 () Bool)

(declare-fun e!435525 () Bool)

(assert (=> b!783170 (=> (not res!529779) (not e!435525))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42679 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!783170 (= res!529779 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!783171 () Bool)

(declare-fun res!529780 () Bool)

(assert (=> b!783171 (=> (not res!529780) (not e!435525))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!783171 (= res!529780 (validKeyInArray!0 (select (arr!20425 a!3186) j!159)))))

(declare-fun b!783172 () Bool)

(declare-fun res!529787 () Bool)

(assert (=> b!783172 (=> (not res!529787) (not e!435525))))

(assert (=> b!783172 (= res!529787 (and (= (size!20845 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20845 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20845 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!783173 () Bool)

(assert (=> b!783173 (= e!435530 e!435529)))

(declare-fun res!529790 () Bool)

(assert (=> b!783173 (=> (not res!529790) (not e!435529))))

(declare-fun lt!349019 () SeekEntryResult!7981)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42679 (_ BitVec 32)) SeekEntryResult!7981)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!783173 (= res!529790 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20425 a!3186) j!159) mask!3328) (select (arr!20425 a!3186) j!159) a!3186 mask!3328) lt!349019))))

(assert (=> b!783173 (= lt!349019 (Intermediate!7981 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!783174 () Bool)

(declare-fun lt!349020 () (_ BitVec 64))

(declare-fun lt!349015 () array!42679)

(declare-fun e!435527 () Bool)

(assert (=> b!783174 (= e!435527 (= (seekEntryOrOpen!0 lt!349020 lt!349015 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349020 lt!349015 mask!3328)))))

(declare-fun lt!349024 () (_ BitVec 64))

(assert (=> b!783174 (= lt!349024 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!349022 () Unit!26989)

(assert (=> b!783174 (= lt!349022 e!435524)))

(declare-fun c!87103 () Bool)

(assert (=> b!783174 (= c!87103 (= lt!349024 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!783176 () Bool)

(declare-fun res!529791 () Bool)

(assert (=> b!783176 (=> res!529791 e!435531)))

(assert (=> b!783176 (= res!529791 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20425 a!3186) j!159) a!3186 mask!3328) lt!349016)))))

(declare-fun b!783177 () Bool)

(assert (=> b!783177 (= e!435523 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20425 a!3186) j!159) a!3186 mask!3328) lt!349019))))

(declare-fun b!783178 () Bool)

(declare-fun res!529778 () Bool)

(assert (=> b!783178 (=> (not res!529778) (not e!435529))))

(assert (=> b!783178 (= res!529778 e!435523)))

(declare-fun c!87104 () Bool)

(assert (=> b!783178 (= c!87104 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!783179 () Bool)

(declare-fun res!529781 () Bool)

(assert (=> b!783179 (=> (not res!529781) (not e!435525))))

(assert (=> b!783179 (= res!529781 (validKeyInArray!0 k0!2102))))

(declare-fun b!783180 () Bool)

(declare-fun res!529777 () Bool)

(assert (=> b!783180 (=> (not res!529777) (not e!435530))))

(declare-datatypes ((List!14334 0))(
  ( (Nil!14331) (Cons!14330 (h!15456 (_ BitVec 64)) (t!20641 List!14334)) )
))
(declare-fun arrayNoDuplicates!0 (array!42679 (_ BitVec 32) List!14334) Bool)

(assert (=> b!783180 (= res!529777 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14331))))

(declare-fun b!783181 () Bool)

(declare-fun Unit!26992 () Unit!26989)

(assert (=> b!783181 (= e!435524 Unit!26992)))

(declare-fun b!783182 () Bool)

(assert (=> b!783182 (= e!435525 e!435530)))

(declare-fun res!529784 () Bool)

(assert (=> b!783182 (=> (not res!529784) (not e!435530))))

(declare-fun lt!349023 () SeekEntryResult!7981)

(assert (=> b!783182 (= res!529784 (or (= lt!349023 (MissingZero!7981 i!1173)) (= lt!349023 (MissingVacant!7981 i!1173))))))

(assert (=> b!783182 (= lt!349023 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!783183 () Bool)

(assert (=> b!783183 (= e!435529 e!435528)))

(declare-fun res!529776 () Bool)

(assert (=> b!783183 (=> (not res!529776) (not e!435528))))

(declare-fun lt!349014 () SeekEntryResult!7981)

(assert (=> b!783183 (= res!529776 (= lt!349014 lt!349021))))

(assert (=> b!783183 (= lt!349021 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349020 lt!349015 mask!3328))))

(assert (=> b!783183 (= lt!349014 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349020 mask!3328) lt!349020 lt!349015 mask!3328))))

(assert (=> b!783183 (= lt!349020 (select (store (arr!20425 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!783183 (= lt!349015 (array!42680 (store (arr!20425 a!3186) i!1173 k0!2102) (size!20845 a!3186)))))

(declare-fun res!529783 () Bool)

(assert (=> start!67696 (=> (not res!529783) (not e!435525))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67696 (= res!529783 (validMask!0 mask!3328))))

(assert (=> start!67696 e!435525))

(assert (=> start!67696 true))

(declare-fun array_inv!16284 (array!42679) Bool)

(assert (=> start!67696 (array_inv!16284 a!3186)))

(declare-fun b!783175 () Bool)

(assert (=> b!783175 (= e!435531 e!435527)))

(declare-fun res!529782 () Bool)

(assert (=> b!783175 (=> res!529782 e!435527)))

(assert (=> b!783175 (= res!529782 (= lt!349024 lt!349020))))

(assert (=> b!783175 (= lt!349024 (select (store (arr!20425 a!3186) i!1173 k0!2102) index!1321))))

(assert (= (and start!67696 res!529783) b!783172))

(assert (= (and b!783172 res!529787) b!783171))

(assert (= (and b!783171 res!529780) b!783179))

(assert (= (and b!783179 res!529781) b!783170))

(assert (= (and b!783170 res!529779) b!783182))

(assert (= (and b!783182 res!529784) b!783165))

(assert (= (and b!783165 res!529785) b!783180))

(assert (= (and b!783180 res!529777) b!783166))

(assert (= (and b!783166 res!529775) b!783173))

(assert (= (and b!783173 res!529790) b!783168))

(assert (= (and b!783168 res!529789) b!783178))

(assert (= (and b!783178 c!87104) b!783177))

(assert (= (and b!783178 (not c!87104)) b!783169))

(assert (= (and b!783178 res!529778) b!783183))

(assert (= (and b!783183 res!529776) b!783164))

(assert (= (and b!783164 res!529786) b!783163))

(assert (= (and b!783164 (not res!529788)) b!783176))

(assert (= (and b!783176 (not res!529791)) b!783175))

(assert (= (and b!783175 (not res!529782)) b!783174))

(assert (= (and b!783174 c!87103) b!783167))

(assert (= (and b!783174 (not c!87103)) b!783181))

(declare-fun m!726353 () Bool)

(assert (=> b!783170 m!726353))

(declare-fun m!726355 () Bool)

(assert (=> b!783180 m!726355))

(declare-fun m!726357 () Bool)

(assert (=> b!783169 m!726357))

(assert (=> b!783169 m!726357))

(declare-fun m!726359 () Bool)

(assert (=> b!783169 m!726359))

(declare-fun m!726361 () Bool)

(assert (=> b!783174 m!726361))

(declare-fun m!726363 () Bool)

(assert (=> b!783174 m!726363))

(assert (=> b!783171 m!726357))

(assert (=> b!783171 m!726357))

(declare-fun m!726365 () Bool)

(assert (=> b!783171 m!726365))

(declare-fun m!726367 () Bool)

(assert (=> b!783175 m!726367))

(declare-fun m!726369 () Bool)

(assert (=> b!783175 m!726369))

(declare-fun m!726371 () Bool)

(assert (=> b!783165 m!726371))

(declare-fun m!726373 () Bool)

(assert (=> b!783179 m!726373))

(declare-fun m!726375 () Bool)

(assert (=> b!783168 m!726375))

(assert (=> b!783183 m!726367))

(declare-fun m!726377 () Bool)

(assert (=> b!783183 m!726377))

(declare-fun m!726379 () Bool)

(assert (=> b!783183 m!726379))

(declare-fun m!726381 () Bool)

(assert (=> b!783183 m!726381))

(assert (=> b!783183 m!726379))

(declare-fun m!726383 () Bool)

(assert (=> b!783183 m!726383))

(assert (=> b!783164 m!726357))

(assert (=> b!783164 m!726357))

(declare-fun m!726385 () Bool)

(assert (=> b!783164 m!726385))

(declare-fun m!726387 () Bool)

(assert (=> b!783164 m!726387))

(declare-fun m!726389 () Bool)

(assert (=> b!783164 m!726389))

(declare-fun m!726391 () Bool)

(assert (=> start!67696 m!726391))

(declare-fun m!726393 () Bool)

(assert (=> start!67696 m!726393))

(assert (=> b!783163 m!726357))

(assert (=> b!783163 m!726357))

(declare-fun m!726395 () Bool)

(assert (=> b!783163 m!726395))

(assert (=> b!783177 m!726357))

(assert (=> b!783177 m!726357))

(declare-fun m!726397 () Bool)

(assert (=> b!783177 m!726397))

(assert (=> b!783173 m!726357))

(assert (=> b!783173 m!726357))

(declare-fun m!726399 () Bool)

(assert (=> b!783173 m!726399))

(assert (=> b!783173 m!726399))

(assert (=> b!783173 m!726357))

(declare-fun m!726401 () Bool)

(assert (=> b!783173 m!726401))

(declare-fun m!726403 () Bool)

(assert (=> b!783182 m!726403))

(assert (=> b!783176 m!726357))

(assert (=> b!783176 m!726357))

(assert (=> b!783176 m!726359))

(check-sat (not b!783174) (not b!783170) (not b!783183) (not b!783176) (not b!783179) (not b!783177) (not b!783163) (not b!783173) (not b!783164) (not b!783180) (not b!783169) (not start!67696) (not b!783182) (not b!783171) (not b!783165))
(check-sat)
(get-model)

(declare-fun d!102905 () Bool)

(assert (=> d!102905 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!67696 d!102905))

(declare-fun d!102907 () Bool)

(assert (=> d!102907 (= (array_inv!16284 a!3186) (bvsge (size!20845 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!67696 d!102907))

(declare-fun d!102909 () Bool)

(assert (=> d!102909 (= (validKeyInArray!0 (select (arr!20425 a!3186) j!159)) (and (not (= (select (arr!20425 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20425 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!783171 d!102909))

(declare-fun d!102911 () Bool)

(declare-fun lt!349097 () SeekEntryResult!7981)

(assert (=> d!102911 (and (or ((_ is Undefined!7981) lt!349097) (not ((_ is Found!7981) lt!349097)) (and (bvsge (index!34293 lt!349097) #b00000000000000000000000000000000) (bvslt (index!34293 lt!349097) (size!20845 a!3186)))) (or ((_ is Undefined!7981) lt!349097) ((_ is Found!7981) lt!349097) (not ((_ is MissingZero!7981) lt!349097)) (and (bvsge (index!34292 lt!349097) #b00000000000000000000000000000000) (bvslt (index!34292 lt!349097) (size!20845 a!3186)))) (or ((_ is Undefined!7981) lt!349097) ((_ is Found!7981) lt!349097) ((_ is MissingZero!7981) lt!349097) (not ((_ is MissingVacant!7981) lt!349097)) (and (bvsge (index!34295 lt!349097) #b00000000000000000000000000000000) (bvslt (index!34295 lt!349097) (size!20845 a!3186)))) (or ((_ is Undefined!7981) lt!349097) (ite ((_ is Found!7981) lt!349097) (= (select (arr!20425 a!3186) (index!34293 lt!349097)) k0!2102) (ite ((_ is MissingZero!7981) lt!349097) (= (select (arr!20425 a!3186) (index!34292 lt!349097)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7981) lt!349097) (= (select (arr!20425 a!3186) (index!34295 lt!349097)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!435600 () SeekEntryResult!7981)

(assert (=> d!102911 (= lt!349097 e!435600)))

(declare-fun c!87123 () Bool)

(declare-fun lt!349098 () SeekEntryResult!7981)

(assert (=> d!102911 (= c!87123 (and ((_ is Intermediate!7981) lt!349098) (undefined!8793 lt!349098)))))

(assert (=> d!102911 (= lt!349098 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!102911 (validMask!0 mask!3328)))

(assert (=> d!102911 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!349097)))

(declare-fun b!783322 () Bool)

(declare-fun c!87124 () Bool)

(declare-fun lt!349099 () (_ BitVec 64))

(assert (=> b!783322 (= c!87124 (= lt!349099 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!435599 () SeekEntryResult!7981)

(declare-fun e!435601 () SeekEntryResult!7981)

(assert (=> b!783322 (= e!435599 e!435601)))

(declare-fun b!783323 () Bool)

(assert (=> b!783323 (= e!435601 (seekKeyOrZeroReturnVacant!0 (x!65403 lt!349098) (index!34294 lt!349098) (index!34294 lt!349098) k0!2102 a!3186 mask!3328))))

(declare-fun b!783324 () Bool)

(assert (=> b!783324 (= e!435601 (MissingZero!7981 (index!34294 lt!349098)))))

(declare-fun b!783325 () Bool)

(assert (=> b!783325 (= e!435600 Undefined!7981)))

(declare-fun b!783326 () Bool)

(assert (=> b!783326 (= e!435600 e!435599)))

(assert (=> b!783326 (= lt!349099 (select (arr!20425 a!3186) (index!34294 lt!349098)))))

(declare-fun c!87125 () Bool)

(assert (=> b!783326 (= c!87125 (= lt!349099 k0!2102))))

(declare-fun b!783327 () Bool)

(assert (=> b!783327 (= e!435599 (Found!7981 (index!34294 lt!349098)))))

(assert (= (and d!102911 c!87123) b!783325))

(assert (= (and d!102911 (not c!87123)) b!783326))

(assert (= (and b!783326 c!87125) b!783327))

(assert (= (and b!783326 (not c!87125)) b!783322))

(assert (= (and b!783322 c!87124) b!783324))

(assert (= (and b!783322 (not c!87124)) b!783323))

(declare-fun m!726509 () Bool)

(assert (=> d!102911 m!726509))

(declare-fun m!726511 () Bool)

(assert (=> d!102911 m!726511))

(assert (=> d!102911 m!726391))

(declare-fun m!726513 () Bool)

(assert (=> d!102911 m!726513))

(declare-fun m!726515 () Bool)

(assert (=> d!102911 m!726515))

(declare-fun m!726517 () Bool)

(assert (=> d!102911 m!726517))

(assert (=> d!102911 m!726509))

(declare-fun m!726519 () Bool)

(assert (=> b!783323 m!726519))

(declare-fun m!726521 () Bool)

(assert (=> b!783326 m!726521))

(assert (=> b!783182 d!102911))

(declare-fun b!783346 () Bool)

(declare-fun e!435615 () Bool)

(declare-fun lt!349104 () SeekEntryResult!7981)

(assert (=> b!783346 (= e!435615 (bvsge (x!65403 lt!349104) #b01111111111111111111111111111110))))

(declare-fun b!783347 () Bool)

(declare-fun e!435614 () SeekEntryResult!7981)

(assert (=> b!783347 (= e!435614 (Intermediate!7981 false index!1321 x!1131))))

(declare-fun b!783348 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!783348 (= e!435614 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) lt!349020 lt!349015 mask!3328))))

(declare-fun b!783349 () Bool)

(declare-fun e!435616 () Bool)

(assert (=> b!783349 (= e!435615 e!435616)))

(declare-fun res!529901 () Bool)

(assert (=> b!783349 (= res!529901 (and ((_ is Intermediate!7981) lt!349104) (not (undefined!8793 lt!349104)) (bvslt (x!65403 lt!349104) #b01111111111111111111111111111110) (bvsge (x!65403 lt!349104) #b00000000000000000000000000000000) (bvsge (x!65403 lt!349104) x!1131)))))

(assert (=> b!783349 (=> (not res!529901) (not e!435616))))

(declare-fun b!783350 () Bool)

(assert (=> b!783350 (and (bvsge (index!34294 lt!349104) #b00000000000000000000000000000000) (bvslt (index!34294 lt!349104) (size!20845 lt!349015)))))

(declare-fun res!529902 () Bool)

(assert (=> b!783350 (= res!529902 (= (select (arr!20425 lt!349015) (index!34294 lt!349104)) lt!349020))))

(declare-fun e!435613 () Bool)

(assert (=> b!783350 (=> res!529902 e!435613)))

(assert (=> b!783350 (= e!435616 e!435613)))

(declare-fun d!102913 () Bool)

(assert (=> d!102913 e!435615))

(declare-fun c!87134 () Bool)

(assert (=> d!102913 (= c!87134 (and ((_ is Intermediate!7981) lt!349104) (undefined!8793 lt!349104)))))

(declare-fun e!435612 () SeekEntryResult!7981)

(assert (=> d!102913 (= lt!349104 e!435612)))

(declare-fun c!87132 () Bool)

(assert (=> d!102913 (= c!87132 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!349105 () (_ BitVec 64))

(assert (=> d!102913 (= lt!349105 (select (arr!20425 lt!349015) index!1321))))

(assert (=> d!102913 (validMask!0 mask!3328)))

(assert (=> d!102913 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349020 lt!349015 mask!3328) lt!349104)))

(declare-fun b!783351 () Bool)

(assert (=> b!783351 (= e!435612 (Intermediate!7981 true index!1321 x!1131))))

(declare-fun b!783352 () Bool)

(assert (=> b!783352 (and (bvsge (index!34294 lt!349104) #b00000000000000000000000000000000) (bvslt (index!34294 lt!349104) (size!20845 lt!349015)))))

(declare-fun res!529900 () Bool)

(assert (=> b!783352 (= res!529900 (= (select (arr!20425 lt!349015) (index!34294 lt!349104)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!783352 (=> res!529900 e!435613)))

(declare-fun b!783353 () Bool)

(assert (=> b!783353 (and (bvsge (index!34294 lt!349104) #b00000000000000000000000000000000) (bvslt (index!34294 lt!349104) (size!20845 lt!349015)))))

(assert (=> b!783353 (= e!435613 (= (select (arr!20425 lt!349015) (index!34294 lt!349104)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!783354 () Bool)

(assert (=> b!783354 (= e!435612 e!435614)))

(declare-fun c!87133 () Bool)

(assert (=> b!783354 (= c!87133 (or (= lt!349105 lt!349020) (= (bvadd lt!349105 lt!349105) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!102913 c!87132) b!783351))

(assert (= (and d!102913 (not c!87132)) b!783354))

(assert (= (and b!783354 c!87133) b!783347))

(assert (= (and b!783354 (not c!87133)) b!783348))

(assert (= (and d!102913 c!87134) b!783346))

(assert (= (and d!102913 (not c!87134)) b!783349))

(assert (= (and b!783349 res!529901) b!783350))

(assert (= (and b!783350 (not res!529902)) b!783352))

(assert (= (and b!783352 (not res!529900)) b!783353))

(declare-fun m!726523 () Bool)

(assert (=> d!102913 m!726523))

(assert (=> d!102913 m!726391))

(declare-fun m!726525 () Bool)

(assert (=> b!783348 m!726525))

(assert (=> b!783348 m!726525))

(declare-fun m!726527 () Bool)

(assert (=> b!783348 m!726527))

(declare-fun m!726529 () Bool)

(assert (=> b!783353 m!726529))

(assert (=> b!783350 m!726529))

(assert (=> b!783352 m!726529))

(assert (=> b!783183 d!102913))

(declare-fun b!783355 () Bool)

(declare-fun e!435620 () Bool)

(declare-fun lt!349106 () SeekEntryResult!7981)

(assert (=> b!783355 (= e!435620 (bvsge (x!65403 lt!349106) #b01111111111111111111111111111110))))

(declare-fun b!783356 () Bool)

(declare-fun e!435619 () SeekEntryResult!7981)

(assert (=> b!783356 (= e!435619 (Intermediate!7981 false (toIndex!0 lt!349020 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!783357 () Bool)

(assert (=> b!783357 (= e!435619 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!349020 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) lt!349020 lt!349015 mask!3328))))

(declare-fun b!783358 () Bool)

(declare-fun e!435621 () Bool)

(assert (=> b!783358 (= e!435620 e!435621)))

(declare-fun res!529904 () Bool)

(assert (=> b!783358 (= res!529904 (and ((_ is Intermediate!7981) lt!349106) (not (undefined!8793 lt!349106)) (bvslt (x!65403 lt!349106) #b01111111111111111111111111111110) (bvsge (x!65403 lt!349106) #b00000000000000000000000000000000) (bvsge (x!65403 lt!349106) #b00000000000000000000000000000000)))))

(assert (=> b!783358 (=> (not res!529904) (not e!435621))))

(declare-fun b!783359 () Bool)

(assert (=> b!783359 (and (bvsge (index!34294 lt!349106) #b00000000000000000000000000000000) (bvslt (index!34294 lt!349106) (size!20845 lt!349015)))))

(declare-fun res!529905 () Bool)

(assert (=> b!783359 (= res!529905 (= (select (arr!20425 lt!349015) (index!34294 lt!349106)) lt!349020))))

(declare-fun e!435618 () Bool)

(assert (=> b!783359 (=> res!529905 e!435618)))

(assert (=> b!783359 (= e!435621 e!435618)))

(declare-fun d!102917 () Bool)

(assert (=> d!102917 e!435620))

(declare-fun c!87137 () Bool)

(assert (=> d!102917 (= c!87137 (and ((_ is Intermediate!7981) lt!349106) (undefined!8793 lt!349106)))))

(declare-fun e!435617 () SeekEntryResult!7981)

(assert (=> d!102917 (= lt!349106 e!435617)))

(declare-fun c!87135 () Bool)

(assert (=> d!102917 (= c!87135 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!349107 () (_ BitVec 64))

(assert (=> d!102917 (= lt!349107 (select (arr!20425 lt!349015) (toIndex!0 lt!349020 mask!3328)))))

(assert (=> d!102917 (validMask!0 mask!3328)))

(assert (=> d!102917 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349020 mask!3328) lt!349020 lt!349015 mask!3328) lt!349106)))

(declare-fun b!783360 () Bool)

(assert (=> b!783360 (= e!435617 (Intermediate!7981 true (toIndex!0 lt!349020 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!783361 () Bool)

(assert (=> b!783361 (and (bvsge (index!34294 lt!349106) #b00000000000000000000000000000000) (bvslt (index!34294 lt!349106) (size!20845 lt!349015)))))

(declare-fun res!529903 () Bool)

(assert (=> b!783361 (= res!529903 (= (select (arr!20425 lt!349015) (index!34294 lt!349106)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!783361 (=> res!529903 e!435618)))

(declare-fun b!783362 () Bool)

(assert (=> b!783362 (and (bvsge (index!34294 lt!349106) #b00000000000000000000000000000000) (bvslt (index!34294 lt!349106) (size!20845 lt!349015)))))

(assert (=> b!783362 (= e!435618 (= (select (arr!20425 lt!349015) (index!34294 lt!349106)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!783363 () Bool)

(assert (=> b!783363 (= e!435617 e!435619)))

(declare-fun c!87136 () Bool)

(assert (=> b!783363 (= c!87136 (or (= lt!349107 lt!349020) (= (bvadd lt!349107 lt!349107) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!102917 c!87135) b!783360))

(assert (= (and d!102917 (not c!87135)) b!783363))

(assert (= (and b!783363 c!87136) b!783356))

(assert (= (and b!783363 (not c!87136)) b!783357))

(assert (= (and d!102917 c!87137) b!783355))

(assert (= (and d!102917 (not c!87137)) b!783358))

(assert (= (and b!783358 res!529904) b!783359))

(assert (= (and b!783359 (not res!529905)) b!783361))

(assert (= (and b!783361 (not res!529903)) b!783362))

(assert (=> d!102917 m!726379))

(declare-fun m!726531 () Bool)

(assert (=> d!102917 m!726531))

(assert (=> d!102917 m!726391))

(assert (=> b!783357 m!726379))

(declare-fun m!726533 () Bool)

(assert (=> b!783357 m!726533))

(assert (=> b!783357 m!726533))

(declare-fun m!726535 () Bool)

(assert (=> b!783357 m!726535))

(declare-fun m!726537 () Bool)

(assert (=> b!783362 m!726537))

(assert (=> b!783359 m!726537))

(assert (=> b!783361 m!726537))

(assert (=> b!783183 d!102917))

(declare-fun d!102919 () Bool)

(declare-fun lt!349113 () (_ BitVec 32))

(declare-fun lt!349112 () (_ BitVec 32))

(assert (=> d!102919 (= lt!349113 (bvmul (bvxor lt!349112 (bvlshr lt!349112 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102919 (= lt!349112 ((_ extract 31 0) (bvand (bvxor lt!349020 (bvlshr lt!349020 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102919 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!529906 (let ((h!15459 ((_ extract 31 0) (bvand (bvxor lt!349020 (bvlshr lt!349020 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65407 (bvmul (bvxor h!15459 (bvlshr h!15459 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65407 (bvlshr x!65407 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!529906 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!529906 #b00000000000000000000000000000000))))))

(assert (=> d!102919 (= (toIndex!0 lt!349020 mask!3328) (bvand (bvxor lt!349113 (bvlshr lt!349113 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!783183 d!102919))

(declare-fun b!783364 () Bool)

(declare-fun e!435625 () Bool)

(declare-fun lt!349114 () SeekEntryResult!7981)

(assert (=> b!783364 (= e!435625 (bvsge (x!65403 lt!349114) #b01111111111111111111111111111110))))

(declare-fun e!435624 () SeekEntryResult!7981)

(declare-fun b!783365 () Bool)

(assert (=> b!783365 (= e!435624 (Intermediate!7981 false (toIndex!0 (select (arr!20425 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!783366 () Bool)

(assert (=> b!783366 (= e!435624 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20425 a!3186) j!159) mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) (select (arr!20425 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!783367 () Bool)

(declare-fun e!435626 () Bool)

(assert (=> b!783367 (= e!435625 e!435626)))

(declare-fun res!529908 () Bool)

(assert (=> b!783367 (= res!529908 (and ((_ is Intermediate!7981) lt!349114) (not (undefined!8793 lt!349114)) (bvslt (x!65403 lt!349114) #b01111111111111111111111111111110) (bvsge (x!65403 lt!349114) #b00000000000000000000000000000000) (bvsge (x!65403 lt!349114) #b00000000000000000000000000000000)))))

(assert (=> b!783367 (=> (not res!529908) (not e!435626))))

(declare-fun b!783368 () Bool)

(assert (=> b!783368 (and (bvsge (index!34294 lt!349114) #b00000000000000000000000000000000) (bvslt (index!34294 lt!349114) (size!20845 a!3186)))))

(declare-fun res!529909 () Bool)

(assert (=> b!783368 (= res!529909 (= (select (arr!20425 a!3186) (index!34294 lt!349114)) (select (arr!20425 a!3186) j!159)))))

(declare-fun e!435623 () Bool)

(assert (=> b!783368 (=> res!529909 e!435623)))

(assert (=> b!783368 (= e!435626 e!435623)))

(declare-fun d!102921 () Bool)

(assert (=> d!102921 e!435625))

(declare-fun c!87140 () Bool)

(assert (=> d!102921 (= c!87140 (and ((_ is Intermediate!7981) lt!349114) (undefined!8793 lt!349114)))))

(declare-fun e!435622 () SeekEntryResult!7981)

(assert (=> d!102921 (= lt!349114 e!435622)))

(declare-fun c!87138 () Bool)

(assert (=> d!102921 (= c!87138 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!349115 () (_ BitVec 64))

(assert (=> d!102921 (= lt!349115 (select (arr!20425 a!3186) (toIndex!0 (select (arr!20425 a!3186) j!159) mask!3328)))))

(assert (=> d!102921 (validMask!0 mask!3328)))

(assert (=> d!102921 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20425 a!3186) j!159) mask!3328) (select (arr!20425 a!3186) j!159) a!3186 mask!3328) lt!349114)))

(declare-fun b!783369 () Bool)

(assert (=> b!783369 (= e!435622 (Intermediate!7981 true (toIndex!0 (select (arr!20425 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!783370 () Bool)

(assert (=> b!783370 (and (bvsge (index!34294 lt!349114) #b00000000000000000000000000000000) (bvslt (index!34294 lt!349114) (size!20845 a!3186)))))

(declare-fun res!529907 () Bool)

(assert (=> b!783370 (= res!529907 (= (select (arr!20425 a!3186) (index!34294 lt!349114)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!783370 (=> res!529907 e!435623)))

(declare-fun b!783371 () Bool)

(assert (=> b!783371 (and (bvsge (index!34294 lt!349114) #b00000000000000000000000000000000) (bvslt (index!34294 lt!349114) (size!20845 a!3186)))))

(assert (=> b!783371 (= e!435623 (= (select (arr!20425 a!3186) (index!34294 lt!349114)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!783372 () Bool)

(assert (=> b!783372 (= e!435622 e!435624)))

(declare-fun c!87139 () Bool)

(assert (=> b!783372 (= c!87139 (or (= lt!349115 (select (arr!20425 a!3186) j!159)) (= (bvadd lt!349115 lt!349115) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!102921 c!87138) b!783369))

(assert (= (and d!102921 (not c!87138)) b!783372))

(assert (= (and b!783372 c!87139) b!783365))

(assert (= (and b!783372 (not c!87139)) b!783366))

(assert (= (and d!102921 c!87140) b!783364))

(assert (= (and d!102921 (not c!87140)) b!783367))

(assert (= (and b!783367 res!529908) b!783368))

(assert (= (and b!783368 (not res!529909)) b!783370))

(assert (= (and b!783370 (not res!529907)) b!783371))

(assert (=> d!102921 m!726399))

(declare-fun m!726539 () Bool)

(assert (=> d!102921 m!726539))

(assert (=> d!102921 m!726391))

(assert (=> b!783366 m!726399))

(declare-fun m!726541 () Bool)

(assert (=> b!783366 m!726541))

(assert (=> b!783366 m!726541))

(assert (=> b!783366 m!726357))

(declare-fun m!726543 () Bool)

(assert (=> b!783366 m!726543))

(declare-fun m!726545 () Bool)

(assert (=> b!783371 m!726545))

(assert (=> b!783368 m!726545))

(assert (=> b!783370 m!726545))

(assert (=> b!783173 d!102921))

(declare-fun d!102923 () Bool)

(declare-fun lt!349117 () (_ BitVec 32))

(declare-fun lt!349116 () (_ BitVec 32))

(assert (=> d!102923 (= lt!349117 (bvmul (bvxor lt!349116 (bvlshr lt!349116 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102923 (= lt!349116 ((_ extract 31 0) (bvand (bvxor (select (arr!20425 a!3186) j!159) (bvlshr (select (arr!20425 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102923 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!529906 (let ((h!15459 ((_ extract 31 0) (bvand (bvxor (select (arr!20425 a!3186) j!159) (bvlshr (select (arr!20425 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65407 (bvmul (bvxor h!15459 (bvlshr h!15459 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65407 (bvlshr x!65407 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!529906 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!529906 #b00000000000000000000000000000000))))))

(assert (=> d!102923 (= (toIndex!0 (select (arr!20425 a!3186) j!159) mask!3328) (bvand (bvxor lt!349117 (bvlshr lt!349117 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!783173 d!102923))

(declare-fun b!783419 () Bool)

(declare-fun e!435656 () SeekEntryResult!7981)

(assert (=> b!783419 (= e!435656 Undefined!7981)))

(declare-fun b!783420 () Bool)

(declare-fun e!435654 () SeekEntryResult!7981)

(assert (=> b!783420 (= e!435654 (MissingVacant!7981 resIntermediateIndex!5))))

(declare-fun b!783421 () Bool)

(declare-fun c!87156 () Bool)

(declare-fun lt!349134 () (_ BitVec 64))

(assert (=> b!783421 (= c!87156 (= lt!349134 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!435655 () SeekEntryResult!7981)

(assert (=> b!783421 (= e!435655 e!435654)))

(declare-fun lt!349135 () SeekEntryResult!7981)

(declare-fun d!102925 () Bool)

(assert (=> d!102925 (and (or ((_ is Undefined!7981) lt!349135) (not ((_ is Found!7981) lt!349135)) (and (bvsge (index!34293 lt!349135) #b00000000000000000000000000000000) (bvslt (index!34293 lt!349135) (size!20845 a!3186)))) (or ((_ is Undefined!7981) lt!349135) ((_ is Found!7981) lt!349135) (not ((_ is MissingVacant!7981) lt!349135)) (not (= (index!34295 lt!349135) resIntermediateIndex!5)) (and (bvsge (index!34295 lt!349135) #b00000000000000000000000000000000) (bvslt (index!34295 lt!349135) (size!20845 a!3186)))) (or ((_ is Undefined!7981) lt!349135) (ite ((_ is Found!7981) lt!349135) (= (select (arr!20425 a!3186) (index!34293 lt!349135)) (select (arr!20425 a!3186) j!159)) (and ((_ is MissingVacant!7981) lt!349135) (= (index!34295 lt!349135) resIntermediateIndex!5) (= (select (arr!20425 a!3186) (index!34295 lt!349135)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102925 (= lt!349135 e!435656)))

(declare-fun c!87157 () Bool)

(assert (=> d!102925 (= c!87157 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!102925 (= lt!349134 (select (arr!20425 a!3186) resIntermediateIndex!5))))

(assert (=> d!102925 (validMask!0 mask!3328)))

(assert (=> d!102925 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20425 a!3186) j!159) a!3186 mask!3328) lt!349135)))

(declare-fun b!783418 () Bool)

(assert (=> b!783418 (= e!435656 e!435655)))

(declare-fun c!87158 () Bool)

(assert (=> b!783418 (= c!87158 (= lt!349134 (select (arr!20425 a!3186) j!159)))))

(declare-fun b!783422 () Bool)

(assert (=> b!783422 (= e!435654 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20425 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!783423 () Bool)

(assert (=> b!783423 (= e!435655 (Found!7981 resIntermediateIndex!5))))

(assert (= (and d!102925 c!87157) b!783419))

(assert (= (and d!102925 (not c!87157)) b!783418))

(assert (= (and b!783418 c!87158) b!783423))

(assert (= (and b!783418 (not c!87158)) b!783421))

(assert (= (and b!783421 c!87156) b!783420))

(assert (= (and b!783421 (not c!87156)) b!783422))

(declare-fun m!726559 () Bool)

(assert (=> d!102925 m!726559))

(declare-fun m!726561 () Bool)

(assert (=> d!102925 m!726561))

(assert (=> d!102925 m!726375))

(assert (=> d!102925 m!726391))

(declare-fun m!726563 () Bool)

(assert (=> b!783422 m!726563))

(assert (=> b!783422 m!726563))

(assert (=> b!783422 m!726357))

(declare-fun m!726565 () Bool)

(assert (=> b!783422 m!726565))

(assert (=> b!783163 d!102925))

(declare-fun d!102933 () Bool)

(declare-fun lt!349136 () SeekEntryResult!7981)

(assert (=> d!102933 (and (or ((_ is Undefined!7981) lt!349136) (not ((_ is Found!7981) lt!349136)) (and (bvsge (index!34293 lt!349136) #b00000000000000000000000000000000) (bvslt (index!34293 lt!349136) (size!20845 lt!349015)))) (or ((_ is Undefined!7981) lt!349136) ((_ is Found!7981) lt!349136) (not ((_ is MissingZero!7981) lt!349136)) (and (bvsge (index!34292 lt!349136) #b00000000000000000000000000000000) (bvslt (index!34292 lt!349136) (size!20845 lt!349015)))) (or ((_ is Undefined!7981) lt!349136) ((_ is Found!7981) lt!349136) ((_ is MissingZero!7981) lt!349136) (not ((_ is MissingVacant!7981) lt!349136)) (and (bvsge (index!34295 lt!349136) #b00000000000000000000000000000000) (bvslt (index!34295 lt!349136) (size!20845 lt!349015)))) (or ((_ is Undefined!7981) lt!349136) (ite ((_ is Found!7981) lt!349136) (= (select (arr!20425 lt!349015) (index!34293 lt!349136)) lt!349020) (ite ((_ is MissingZero!7981) lt!349136) (= (select (arr!20425 lt!349015) (index!34292 lt!349136)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7981) lt!349136) (= (select (arr!20425 lt!349015) (index!34295 lt!349136)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!435658 () SeekEntryResult!7981)

(assert (=> d!102933 (= lt!349136 e!435658)))

(declare-fun c!87159 () Bool)

(declare-fun lt!349137 () SeekEntryResult!7981)

(assert (=> d!102933 (= c!87159 (and ((_ is Intermediate!7981) lt!349137) (undefined!8793 lt!349137)))))

(assert (=> d!102933 (= lt!349137 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349020 mask!3328) lt!349020 lt!349015 mask!3328))))

(assert (=> d!102933 (validMask!0 mask!3328)))

(assert (=> d!102933 (= (seekEntryOrOpen!0 lt!349020 lt!349015 mask!3328) lt!349136)))

(declare-fun b!783424 () Bool)

(declare-fun c!87160 () Bool)

(declare-fun lt!349138 () (_ BitVec 64))

(assert (=> b!783424 (= c!87160 (= lt!349138 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!435657 () SeekEntryResult!7981)

(declare-fun e!435659 () SeekEntryResult!7981)

(assert (=> b!783424 (= e!435657 e!435659)))

(declare-fun b!783425 () Bool)

(assert (=> b!783425 (= e!435659 (seekKeyOrZeroReturnVacant!0 (x!65403 lt!349137) (index!34294 lt!349137) (index!34294 lt!349137) lt!349020 lt!349015 mask!3328))))

(declare-fun b!783426 () Bool)

(assert (=> b!783426 (= e!435659 (MissingZero!7981 (index!34294 lt!349137)))))

(declare-fun b!783427 () Bool)

(assert (=> b!783427 (= e!435658 Undefined!7981)))

(declare-fun b!783428 () Bool)

(assert (=> b!783428 (= e!435658 e!435657)))

(assert (=> b!783428 (= lt!349138 (select (arr!20425 lt!349015) (index!34294 lt!349137)))))

(declare-fun c!87161 () Bool)

(assert (=> b!783428 (= c!87161 (= lt!349138 lt!349020))))

(declare-fun b!783429 () Bool)

(assert (=> b!783429 (= e!435657 (Found!7981 (index!34294 lt!349137)))))

(assert (= (and d!102933 c!87159) b!783427))

(assert (= (and d!102933 (not c!87159)) b!783428))

(assert (= (and b!783428 c!87161) b!783429))

(assert (= (and b!783428 (not c!87161)) b!783424))

(assert (= (and b!783424 c!87160) b!783426))

(assert (= (and b!783424 (not c!87160)) b!783425))

(assert (=> d!102933 m!726379))

(assert (=> d!102933 m!726383))

(assert (=> d!102933 m!726391))

(declare-fun m!726567 () Bool)

(assert (=> d!102933 m!726567))

(declare-fun m!726569 () Bool)

(assert (=> d!102933 m!726569))

(declare-fun m!726571 () Bool)

(assert (=> d!102933 m!726571))

(assert (=> d!102933 m!726379))

(declare-fun m!726573 () Bool)

(assert (=> b!783425 m!726573))

(declare-fun m!726575 () Bool)

(assert (=> b!783428 m!726575))

(assert (=> b!783174 d!102933))

(declare-fun b!783431 () Bool)

(declare-fun e!435662 () SeekEntryResult!7981)

(assert (=> b!783431 (= e!435662 Undefined!7981)))

(declare-fun b!783432 () Bool)

(declare-fun e!435660 () SeekEntryResult!7981)

(assert (=> b!783432 (= e!435660 (MissingVacant!7981 index!1321))))

(declare-fun b!783433 () Bool)

(declare-fun c!87162 () Bool)

(declare-fun lt!349139 () (_ BitVec 64))

(assert (=> b!783433 (= c!87162 (= lt!349139 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!435661 () SeekEntryResult!7981)

(assert (=> b!783433 (= e!435661 e!435660)))

(declare-fun d!102935 () Bool)

(declare-fun lt!349140 () SeekEntryResult!7981)

(assert (=> d!102935 (and (or ((_ is Undefined!7981) lt!349140) (not ((_ is Found!7981) lt!349140)) (and (bvsge (index!34293 lt!349140) #b00000000000000000000000000000000) (bvslt (index!34293 lt!349140) (size!20845 lt!349015)))) (or ((_ is Undefined!7981) lt!349140) ((_ is Found!7981) lt!349140) (not ((_ is MissingVacant!7981) lt!349140)) (not (= (index!34295 lt!349140) index!1321)) (and (bvsge (index!34295 lt!349140) #b00000000000000000000000000000000) (bvslt (index!34295 lt!349140) (size!20845 lt!349015)))) (or ((_ is Undefined!7981) lt!349140) (ite ((_ is Found!7981) lt!349140) (= (select (arr!20425 lt!349015) (index!34293 lt!349140)) lt!349020) (and ((_ is MissingVacant!7981) lt!349140) (= (index!34295 lt!349140) index!1321) (= (select (arr!20425 lt!349015) (index!34295 lt!349140)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102935 (= lt!349140 e!435662)))

(declare-fun c!87163 () Bool)

(assert (=> d!102935 (= c!87163 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102935 (= lt!349139 (select (arr!20425 lt!349015) index!1321))))

(assert (=> d!102935 (validMask!0 mask!3328)))

(assert (=> d!102935 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349020 lt!349015 mask!3328) lt!349140)))

(declare-fun b!783430 () Bool)

(assert (=> b!783430 (= e!435662 e!435661)))

(declare-fun c!87164 () Bool)

(assert (=> b!783430 (= c!87164 (= lt!349139 lt!349020))))

(declare-fun b!783434 () Bool)

(assert (=> b!783434 (= e!435660 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) index!1321 lt!349020 lt!349015 mask!3328))))

(declare-fun b!783435 () Bool)

(assert (=> b!783435 (= e!435661 (Found!7981 index!1321))))

(assert (= (and d!102935 c!87163) b!783431))

(assert (= (and d!102935 (not c!87163)) b!783430))

(assert (= (and b!783430 c!87164) b!783435))

(assert (= (and b!783430 (not c!87164)) b!783433))

(assert (= (and b!783433 c!87162) b!783432))

(assert (= (and b!783433 (not c!87162)) b!783434))

(declare-fun m!726577 () Bool)

(assert (=> d!102935 m!726577))

(declare-fun m!726579 () Bool)

(assert (=> d!102935 m!726579))

(assert (=> d!102935 m!726523))

(assert (=> d!102935 m!726391))

(assert (=> b!783434 m!726525))

(assert (=> b!783434 m!726525))

(declare-fun m!726581 () Bool)

(assert (=> b!783434 m!726581))

(assert (=> b!783174 d!102935))

(declare-fun d!102937 () Bool)

(declare-fun lt!349141 () SeekEntryResult!7981)

(assert (=> d!102937 (and (or ((_ is Undefined!7981) lt!349141) (not ((_ is Found!7981) lt!349141)) (and (bvsge (index!34293 lt!349141) #b00000000000000000000000000000000) (bvslt (index!34293 lt!349141) (size!20845 a!3186)))) (or ((_ is Undefined!7981) lt!349141) ((_ is Found!7981) lt!349141) (not ((_ is MissingZero!7981) lt!349141)) (and (bvsge (index!34292 lt!349141) #b00000000000000000000000000000000) (bvslt (index!34292 lt!349141) (size!20845 a!3186)))) (or ((_ is Undefined!7981) lt!349141) ((_ is Found!7981) lt!349141) ((_ is MissingZero!7981) lt!349141) (not ((_ is MissingVacant!7981) lt!349141)) (and (bvsge (index!34295 lt!349141) #b00000000000000000000000000000000) (bvslt (index!34295 lt!349141) (size!20845 a!3186)))) (or ((_ is Undefined!7981) lt!349141) (ite ((_ is Found!7981) lt!349141) (= (select (arr!20425 a!3186) (index!34293 lt!349141)) (select (arr!20425 a!3186) j!159)) (ite ((_ is MissingZero!7981) lt!349141) (= (select (arr!20425 a!3186) (index!34292 lt!349141)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7981) lt!349141) (= (select (arr!20425 a!3186) (index!34295 lt!349141)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!435664 () SeekEntryResult!7981)

(assert (=> d!102937 (= lt!349141 e!435664)))

(declare-fun c!87165 () Bool)

(declare-fun lt!349142 () SeekEntryResult!7981)

(assert (=> d!102937 (= c!87165 (and ((_ is Intermediate!7981) lt!349142) (undefined!8793 lt!349142)))))

(assert (=> d!102937 (= lt!349142 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20425 a!3186) j!159) mask!3328) (select (arr!20425 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!102937 (validMask!0 mask!3328)))

(assert (=> d!102937 (= (seekEntryOrOpen!0 (select (arr!20425 a!3186) j!159) a!3186 mask!3328) lt!349141)))

(declare-fun b!783436 () Bool)

(declare-fun c!87166 () Bool)

(declare-fun lt!349143 () (_ BitVec 64))

(assert (=> b!783436 (= c!87166 (= lt!349143 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!435663 () SeekEntryResult!7981)

(declare-fun e!435665 () SeekEntryResult!7981)

(assert (=> b!783436 (= e!435663 e!435665)))

(declare-fun b!783437 () Bool)

(assert (=> b!783437 (= e!435665 (seekKeyOrZeroReturnVacant!0 (x!65403 lt!349142) (index!34294 lt!349142) (index!34294 lt!349142) (select (arr!20425 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!783438 () Bool)

(assert (=> b!783438 (= e!435665 (MissingZero!7981 (index!34294 lt!349142)))))

(declare-fun b!783439 () Bool)

(assert (=> b!783439 (= e!435664 Undefined!7981)))

(declare-fun b!783440 () Bool)

(assert (=> b!783440 (= e!435664 e!435663)))

(assert (=> b!783440 (= lt!349143 (select (arr!20425 a!3186) (index!34294 lt!349142)))))

(declare-fun c!87167 () Bool)

(assert (=> b!783440 (= c!87167 (= lt!349143 (select (arr!20425 a!3186) j!159)))))

(declare-fun b!783441 () Bool)

(assert (=> b!783441 (= e!435663 (Found!7981 (index!34294 lt!349142)))))

(assert (= (and d!102937 c!87165) b!783439))

(assert (= (and d!102937 (not c!87165)) b!783440))

(assert (= (and b!783440 c!87167) b!783441))

(assert (= (and b!783440 (not c!87167)) b!783436))

(assert (= (and b!783436 c!87166) b!783438))

(assert (= (and b!783436 (not c!87166)) b!783437))

(assert (=> d!102937 m!726399))

(assert (=> d!102937 m!726357))

(assert (=> d!102937 m!726401))

(assert (=> d!102937 m!726391))

(declare-fun m!726583 () Bool)

(assert (=> d!102937 m!726583))

(declare-fun m!726585 () Bool)

(assert (=> d!102937 m!726585))

(declare-fun m!726587 () Bool)

(assert (=> d!102937 m!726587))

(assert (=> d!102937 m!726357))

(assert (=> d!102937 m!726399))

(assert (=> b!783437 m!726357))

(declare-fun m!726589 () Bool)

(assert (=> b!783437 m!726589))

(declare-fun m!726591 () Bool)

(assert (=> b!783440 m!726591))

(assert (=> b!783164 d!102937))

(declare-fun b!783463 () Bool)

(declare-fun e!435678 () Bool)

(declare-fun e!435679 () Bool)

(assert (=> b!783463 (= e!435678 e!435679)))

(declare-fun lt!349155 () (_ BitVec 64))

(assert (=> b!783463 (= lt!349155 (select (arr!20425 a!3186) j!159))))

(declare-fun lt!349154 () Unit!26989)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42679 (_ BitVec 64) (_ BitVec 32)) Unit!26989)

(assert (=> b!783463 (= lt!349154 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!349155 j!159))))

(assert (=> b!783463 (arrayContainsKey!0 a!3186 lt!349155 #b00000000000000000000000000000000)))

(declare-fun lt!349156 () Unit!26989)

(assert (=> b!783463 (= lt!349156 lt!349154)))

(declare-fun res!529931 () Bool)

(assert (=> b!783463 (= res!529931 (= (seekEntryOrOpen!0 (select (arr!20425 a!3186) j!159) a!3186 mask!3328) (Found!7981 j!159)))))

(assert (=> b!783463 (=> (not res!529931) (not e!435679))))

(declare-fun b!783464 () Bool)

(declare-fun call!35286 () Bool)

(assert (=> b!783464 (= e!435679 call!35286)))

(declare-fun d!102939 () Bool)

(declare-fun res!529930 () Bool)

(declare-fun e!435680 () Bool)

(assert (=> d!102939 (=> res!529930 e!435680)))

(assert (=> d!102939 (= res!529930 (bvsge j!159 (size!20845 a!3186)))))

(assert (=> d!102939 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!435680)))

(declare-fun b!783462 () Bool)

(assert (=> b!783462 (= e!435678 call!35286)))

(declare-fun bm!35283 () Bool)

(assert (=> bm!35283 (= call!35286 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!783465 () Bool)

(assert (=> b!783465 (= e!435680 e!435678)))

(declare-fun c!87176 () Bool)

(assert (=> b!783465 (= c!87176 (validKeyInArray!0 (select (arr!20425 a!3186) j!159)))))

(assert (= (and d!102939 (not res!529930)) b!783465))

(assert (= (and b!783465 c!87176) b!783463))

(assert (= (and b!783465 (not c!87176)) b!783462))

(assert (= (and b!783463 res!529931) b!783464))

(assert (= (or b!783464 b!783462) bm!35283))

(assert (=> b!783463 m!726357))

(declare-fun m!726593 () Bool)

(assert (=> b!783463 m!726593))

(declare-fun m!726595 () Bool)

(assert (=> b!783463 m!726595))

(assert (=> b!783463 m!726357))

(assert (=> b!783463 m!726385))

(declare-fun m!726597 () Bool)

(assert (=> bm!35283 m!726597))

(assert (=> b!783465 m!726357))

(assert (=> b!783465 m!726357))

(assert (=> b!783465 m!726365))

(assert (=> b!783164 d!102939))

(declare-fun d!102943 () Bool)

(assert (=> d!102943 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!349163 () Unit!26989)

(declare-fun choose!38 (array!42679 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26989)

(assert (=> d!102943 (= lt!349163 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!102943 (validMask!0 mask!3328)))

(assert (=> d!102943 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!349163)))

(declare-fun bs!21770 () Bool)

(assert (= bs!21770 d!102943))

(assert (=> bs!21770 m!726387))

(declare-fun m!726617 () Bool)

(assert (=> bs!21770 m!726617))

(assert (=> bs!21770 m!726391))

(assert (=> b!783164 d!102943))

(declare-fun b!783479 () Bool)

(declare-fun e!435687 () Bool)

(declare-fun e!435688 () Bool)

(assert (=> b!783479 (= e!435687 e!435688)))

(declare-fun lt!349165 () (_ BitVec 64))

(assert (=> b!783479 (= lt!349165 (select (arr!20425 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!349164 () Unit!26989)

(assert (=> b!783479 (= lt!349164 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!349165 #b00000000000000000000000000000000))))

(assert (=> b!783479 (arrayContainsKey!0 a!3186 lt!349165 #b00000000000000000000000000000000)))

(declare-fun lt!349166 () Unit!26989)

(assert (=> b!783479 (= lt!349166 lt!349164)))

(declare-fun res!529933 () Bool)

(assert (=> b!783479 (= res!529933 (= (seekEntryOrOpen!0 (select (arr!20425 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7981 #b00000000000000000000000000000000)))))

(assert (=> b!783479 (=> (not res!529933) (not e!435688))))

(declare-fun b!783480 () Bool)

(declare-fun call!35287 () Bool)

(assert (=> b!783480 (= e!435688 call!35287)))

(declare-fun d!102949 () Bool)

(declare-fun res!529932 () Bool)

(declare-fun e!435689 () Bool)

(assert (=> d!102949 (=> res!529932 e!435689)))

(assert (=> d!102949 (= res!529932 (bvsge #b00000000000000000000000000000000 (size!20845 a!3186)))))

(assert (=> d!102949 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!435689)))

(declare-fun b!783478 () Bool)

(assert (=> b!783478 (= e!435687 call!35287)))

(declare-fun bm!35284 () Bool)

(assert (=> bm!35284 (= call!35287 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!783481 () Bool)

(assert (=> b!783481 (= e!435689 e!435687)))

(declare-fun c!87183 () Bool)

(assert (=> b!783481 (= c!87183 (validKeyInArray!0 (select (arr!20425 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!102949 (not res!529932)) b!783481))

(assert (= (and b!783481 c!87183) b!783479))

(assert (= (and b!783481 (not c!87183)) b!783478))

(assert (= (and b!783479 res!529933) b!783480))

(assert (= (or b!783480 b!783478) bm!35284))

(declare-fun m!726619 () Bool)

(assert (=> b!783479 m!726619))

(declare-fun m!726621 () Bool)

(assert (=> b!783479 m!726621))

(declare-fun m!726623 () Bool)

(assert (=> b!783479 m!726623))

(assert (=> b!783479 m!726619))

(declare-fun m!726625 () Bool)

(assert (=> b!783479 m!726625))

(declare-fun m!726627 () Bool)

(assert (=> bm!35284 m!726627))

(assert (=> b!783481 m!726619))

(assert (=> b!783481 m!726619))

(declare-fun m!726629 () Bool)

(assert (=> b!783481 m!726629))

(assert (=> b!783165 d!102949))

(declare-fun b!783489 () Bool)

(declare-fun e!435696 () SeekEntryResult!7981)

(assert (=> b!783489 (= e!435696 Undefined!7981)))

(declare-fun b!783490 () Bool)

(declare-fun e!435694 () SeekEntryResult!7981)

(assert (=> b!783490 (= e!435694 (MissingVacant!7981 resIntermediateIndex!5))))

(declare-fun b!783491 () Bool)

(declare-fun c!87186 () Bool)

(declare-fun lt!349167 () (_ BitVec 64))

(assert (=> b!783491 (= c!87186 (= lt!349167 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!435695 () SeekEntryResult!7981)

(assert (=> b!783491 (= e!435695 e!435694)))

(declare-fun lt!349168 () SeekEntryResult!7981)

(declare-fun d!102951 () Bool)

(assert (=> d!102951 (and (or ((_ is Undefined!7981) lt!349168) (not ((_ is Found!7981) lt!349168)) (and (bvsge (index!34293 lt!349168) #b00000000000000000000000000000000) (bvslt (index!34293 lt!349168) (size!20845 a!3186)))) (or ((_ is Undefined!7981) lt!349168) ((_ is Found!7981) lt!349168) (not ((_ is MissingVacant!7981) lt!349168)) (not (= (index!34295 lt!349168) resIntermediateIndex!5)) (and (bvsge (index!34295 lt!349168) #b00000000000000000000000000000000) (bvslt (index!34295 lt!349168) (size!20845 a!3186)))) (or ((_ is Undefined!7981) lt!349168) (ite ((_ is Found!7981) lt!349168) (= (select (arr!20425 a!3186) (index!34293 lt!349168)) (select (arr!20425 a!3186) j!159)) (and ((_ is MissingVacant!7981) lt!349168) (= (index!34295 lt!349168) resIntermediateIndex!5) (= (select (arr!20425 a!3186) (index!34295 lt!349168)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102951 (= lt!349168 e!435696)))

(declare-fun c!87187 () Bool)

(assert (=> d!102951 (= c!87187 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102951 (= lt!349167 (select (arr!20425 a!3186) index!1321))))

(assert (=> d!102951 (validMask!0 mask!3328)))

(assert (=> d!102951 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20425 a!3186) j!159) a!3186 mask!3328) lt!349168)))

(declare-fun b!783488 () Bool)

(assert (=> b!783488 (= e!435696 e!435695)))

(declare-fun c!87188 () Bool)

(assert (=> b!783488 (= c!87188 (= lt!349167 (select (arr!20425 a!3186) j!159)))))

(declare-fun b!783492 () Bool)

(assert (=> b!783492 (= e!435694 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20425 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!783493 () Bool)

(assert (=> b!783493 (= e!435695 (Found!7981 index!1321))))

(assert (= (and d!102951 c!87187) b!783489))

(assert (= (and d!102951 (not c!87187)) b!783488))

(assert (= (and b!783488 c!87188) b!783493))

(assert (= (and b!783488 (not c!87188)) b!783491))

(assert (= (and b!783491 c!87186) b!783490))

(assert (= (and b!783491 (not c!87186)) b!783492))

(declare-fun m!726631 () Bool)

(assert (=> d!102951 m!726631))

(declare-fun m!726633 () Bool)

(assert (=> d!102951 m!726633))

(declare-fun m!726635 () Bool)

(assert (=> d!102951 m!726635))

(assert (=> d!102951 m!726391))

(assert (=> b!783492 m!726525))

(assert (=> b!783492 m!726525))

(assert (=> b!783492 m!726357))

(declare-fun m!726637 () Bool)

(assert (=> b!783492 m!726637))

(assert (=> b!783176 d!102951))

(declare-fun b!783496 () Bool)

(declare-fun e!435702 () Bool)

(declare-fun lt!349175 () SeekEntryResult!7981)

(assert (=> b!783496 (= e!435702 (bvsge (x!65403 lt!349175) #b01111111111111111111111111111110))))

(declare-fun b!783497 () Bool)

(declare-fun e!435701 () SeekEntryResult!7981)

(assert (=> b!783497 (= e!435701 (Intermediate!7981 false index!1321 x!1131))))

(declare-fun b!783498 () Bool)

(assert (=> b!783498 (= e!435701 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) (select (arr!20425 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!783499 () Bool)

(declare-fun e!435703 () Bool)

(assert (=> b!783499 (= e!435702 e!435703)))

(declare-fun res!529939 () Bool)

(assert (=> b!783499 (= res!529939 (and ((_ is Intermediate!7981) lt!349175) (not (undefined!8793 lt!349175)) (bvslt (x!65403 lt!349175) #b01111111111111111111111111111110) (bvsge (x!65403 lt!349175) #b00000000000000000000000000000000) (bvsge (x!65403 lt!349175) x!1131)))))

(assert (=> b!783499 (=> (not res!529939) (not e!435703))))

(declare-fun b!783500 () Bool)

(assert (=> b!783500 (and (bvsge (index!34294 lt!349175) #b00000000000000000000000000000000) (bvslt (index!34294 lt!349175) (size!20845 a!3186)))))

(declare-fun res!529940 () Bool)

(assert (=> b!783500 (= res!529940 (= (select (arr!20425 a!3186) (index!34294 lt!349175)) (select (arr!20425 a!3186) j!159)))))

(declare-fun e!435700 () Bool)

(assert (=> b!783500 (=> res!529940 e!435700)))

(assert (=> b!783500 (= e!435703 e!435700)))

(declare-fun d!102953 () Bool)

(assert (=> d!102953 e!435702))

(declare-fun c!87191 () Bool)

(assert (=> d!102953 (= c!87191 (and ((_ is Intermediate!7981) lt!349175) (undefined!8793 lt!349175)))))

(declare-fun e!435699 () SeekEntryResult!7981)

(assert (=> d!102953 (= lt!349175 e!435699)))

(declare-fun c!87189 () Bool)

(assert (=> d!102953 (= c!87189 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!349176 () (_ BitVec 64))

(assert (=> d!102953 (= lt!349176 (select (arr!20425 a!3186) index!1321))))

(assert (=> d!102953 (validMask!0 mask!3328)))

(assert (=> d!102953 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20425 a!3186) j!159) a!3186 mask!3328) lt!349175)))

(declare-fun b!783501 () Bool)

(assert (=> b!783501 (= e!435699 (Intermediate!7981 true index!1321 x!1131))))

(declare-fun b!783502 () Bool)

(assert (=> b!783502 (and (bvsge (index!34294 lt!349175) #b00000000000000000000000000000000) (bvslt (index!34294 lt!349175) (size!20845 a!3186)))))

(declare-fun res!529938 () Bool)

(assert (=> b!783502 (= res!529938 (= (select (arr!20425 a!3186) (index!34294 lt!349175)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!783502 (=> res!529938 e!435700)))

(declare-fun b!783503 () Bool)

(assert (=> b!783503 (and (bvsge (index!34294 lt!349175) #b00000000000000000000000000000000) (bvslt (index!34294 lt!349175) (size!20845 a!3186)))))

(assert (=> b!783503 (= e!435700 (= (select (arr!20425 a!3186) (index!34294 lt!349175)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!783504 () Bool)

(assert (=> b!783504 (= e!435699 e!435701)))

(declare-fun c!87190 () Bool)

(assert (=> b!783504 (= c!87190 (or (= lt!349176 (select (arr!20425 a!3186) j!159)) (= (bvadd lt!349176 lt!349176) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!102953 c!87189) b!783501))

(assert (= (and d!102953 (not c!87189)) b!783504))

(assert (= (and b!783504 c!87190) b!783497))

(assert (= (and b!783504 (not c!87190)) b!783498))

(assert (= (and d!102953 c!87191) b!783496))

(assert (= (and d!102953 (not c!87191)) b!783499))

(assert (= (and b!783499 res!529939) b!783500))

(assert (= (and b!783500 (not res!529940)) b!783502))

(assert (= (and b!783502 (not res!529938)) b!783503))

(assert (=> d!102953 m!726635))

(assert (=> d!102953 m!726391))

(assert (=> b!783498 m!726525))

(assert (=> b!783498 m!726525))

(assert (=> b!783498 m!726357))

(declare-fun m!726639 () Bool)

(assert (=> b!783498 m!726639))

(declare-fun m!726641 () Bool)

(assert (=> b!783503 m!726641))

(assert (=> b!783500 m!726641))

(assert (=> b!783502 m!726641))

(assert (=> b!783177 d!102953))

(declare-fun d!102955 () Bool)

(assert (=> d!102955 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!783179 d!102955))

(assert (=> b!783169 d!102951))

(declare-fun b!783519 () Bool)

(declare-fun e!435717 () Bool)

(declare-fun e!435716 () Bool)

(assert (=> b!783519 (= e!435717 e!435716)))

(declare-fun c!87195 () Bool)

(assert (=> b!783519 (= c!87195 (validKeyInArray!0 (select (arr!20425 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!783520 () Bool)

(declare-fun e!435718 () Bool)

(declare-fun contains!4085 (List!14334 (_ BitVec 64)) Bool)

(assert (=> b!783520 (= e!435718 (contains!4085 Nil!14331 (select (arr!20425 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!783521 () Bool)

(declare-fun call!35293 () Bool)

(assert (=> b!783521 (= e!435716 call!35293)))

(declare-fun bm!35290 () Bool)

(assert (=> bm!35290 (= call!35293 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!87195 (Cons!14330 (select (arr!20425 a!3186) #b00000000000000000000000000000000) Nil!14331) Nil!14331)))))

(declare-fun d!102957 () Bool)

(declare-fun res!529951 () Bool)

(declare-fun e!435715 () Bool)

(assert (=> d!102957 (=> res!529951 e!435715)))

(assert (=> d!102957 (= res!529951 (bvsge #b00000000000000000000000000000000 (size!20845 a!3186)))))

(assert (=> d!102957 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14331) e!435715)))

(declare-fun b!783522 () Bool)

(assert (=> b!783522 (= e!435715 e!435717)))

(declare-fun res!529949 () Bool)

(assert (=> b!783522 (=> (not res!529949) (not e!435717))))

(assert (=> b!783522 (= res!529949 (not e!435718))))

(declare-fun res!529950 () Bool)

(assert (=> b!783522 (=> (not res!529950) (not e!435718))))

(assert (=> b!783522 (= res!529950 (validKeyInArray!0 (select (arr!20425 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!783523 () Bool)

(assert (=> b!783523 (= e!435716 call!35293)))

(assert (= (and d!102957 (not res!529951)) b!783522))

(assert (= (and b!783522 res!529950) b!783520))

(assert (= (and b!783522 res!529949) b!783519))

(assert (= (and b!783519 c!87195) b!783523))

(assert (= (and b!783519 (not c!87195)) b!783521))

(assert (= (or b!783523 b!783521) bm!35290))

(assert (=> b!783519 m!726619))

(assert (=> b!783519 m!726619))

(assert (=> b!783519 m!726629))

(assert (=> b!783520 m!726619))

(assert (=> b!783520 m!726619))

(declare-fun m!726655 () Bool)

(assert (=> b!783520 m!726655))

(assert (=> bm!35290 m!726619))

(declare-fun m!726657 () Bool)

(assert (=> bm!35290 m!726657))

(assert (=> b!783522 m!726619))

(assert (=> b!783522 m!726619))

(assert (=> b!783522 m!726629))

(assert (=> b!783180 d!102957))

(declare-fun d!102963 () Bool)

(declare-fun res!529956 () Bool)

(declare-fun e!435723 () Bool)

(assert (=> d!102963 (=> res!529956 e!435723)))

(assert (=> d!102963 (= res!529956 (= (select (arr!20425 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!102963 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!435723)))

(declare-fun b!783528 () Bool)

(declare-fun e!435724 () Bool)

(assert (=> b!783528 (= e!435723 e!435724)))

(declare-fun res!529957 () Bool)

(assert (=> b!783528 (=> (not res!529957) (not e!435724))))

(assert (=> b!783528 (= res!529957 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20845 a!3186)))))

(declare-fun b!783529 () Bool)

(assert (=> b!783529 (= e!435724 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!102963 (not res!529956)) b!783528))

(assert (= (and b!783528 res!529957) b!783529))

(assert (=> d!102963 m!726619))

(declare-fun m!726659 () Bool)

(assert (=> b!783529 m!726659))

(assert (=> b!783170 d!102963))

(check-sat (not d!102911) (not b!783465) (not b!783522) (not d!102933) (not b!783357) (not b!783425) (not d!102953) (not d!102943) (not d!102913) (not bm!35284) (not d!102951) (not b!783463) (not b!783520) (not d!102935) (not b!783479) (not b!783492) (not bm!35290) (not b!783422) (not b!783348) (not b!783434) (not b!783437) (not b!783323) (not d!102917) (not d!102921) (not b!783529) (not bm!35283) (not b!783481) (not d!102925) (not d!102937) (not b!783498) (not b!783519) (not b!783366))
(check-sat)
