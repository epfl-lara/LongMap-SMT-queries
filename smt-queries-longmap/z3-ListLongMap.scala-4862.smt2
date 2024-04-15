; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66992 () Bool)

(assert start!66992)

(declare-fun b!773170 () Bool)

(declare-fun e!430386 () Bool)

(declare-fun e!430378 () Bool)

(assert (=> b!773170 (= e!430386 e!430378)))

(declare-fun res!522971 () Bool)

(assert (=> b!773170 (=> (not res!522971) (not e!430378))))

(declare-datatypes ((array!42435 0))(
  ( (array!42436 (arr!20315 (Array (_ BitVec 32) (_ BitVec 64))) (size!20736 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42435)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7912 0))(
  ( (MissingZero!7912 (index!34016 (_ BitVec 32))) (Found!7912 (index!34017 (_ BitVec 32))) (Intermediate!7912 (undefined!8724 Bool) (index!34018 (_ BitVec 32)) (x!64966 (_ BitVec 32))) (Undefined!7912) (MissingVacant!7912 (index!34019 (_ BitVec 32))) )
))
(declare-fun lt!344167 () SeekEntryResult!7912)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42435 (_ BitVec 32)) SeekEntryResult!7912)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773170 (= res!522971 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20315 a!3186) j!159) mask!3328) (select (arr!20315 a!3186) j!159) a!3186 mask!3328) lt!344167))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!773170 (= lt!344167 (Intermediate!7912 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!773171 () Bool)

(declare-fun res!522960 () Bool)

(assert (=> b!773171 (=> (not res!522960) (not e!430386))))

(declare-datatypes ((List!14356 0))(
  ( (Nil!14353) (Cons!14352 (h!15457 (_ BitVec 64)) (t!20662 List!14356)) )
))
(declare-fun arrayNoDuplicates!0 (array!42435 (_ BitVec 32) List!14356) Bool)

(assert (=> b!773171 (= res!522960 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14353))))

(declare-fun res!522968 () Bool)

(declare-fun e!430379 () Bool)

(assert (=> start!66992 (=> (not res!522968) (not e!430379))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66992 (= res!522968 (validMask!0 mask!3328))))

(assert (=> start!66992 e!430379))

(assert (=> start!66992 true))

(declare-fun array_inv!16198 (array!42435) Bool)

(assert (=> start!66992 (array_inv!16198 a!3186)))

(declare-fun b!773172 () Bool)

(declare-fun e!430384 () Bool)

(assert (=> b!773172 (= e!430378 e!430384)))

(declare-fun res!522957 () Bool)

(assert (=> b!773172 (=> (not res!522957) (not e!430384))))

(declare-fun lt!344164 () SeekEntryResult!7912)

(declare-fun lt!344158 () SeekEntryResult!7912)

(assert (=> b!773172 (= res!522957 (= lt!344164 lt!344158))))

(declare-fun lt!344166 () array!42435)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!344165 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!773172 (= lt!344158 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344165 lt!344166 mask!3328))))

(assert (=> b!773172 (= lt!344164 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344165 mask!3328) lt!344165 lt!344166 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!773172 (= lt!344165 (select (store (arr!20315 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!773172 (= lt!344166 (array!42436 (store (arr!20315 a!3186) i!1173 k0!2102) (size!20736 a!3186)))))

(declare-fun b!773173 () Bool)

(declare-fun e!430385 () Bool)

(assert (=> b!773173 (= e!430385 true)))

(declare-datatypes ((Unit!26642 0))(
  ( (Unit!26643) )
))
(declare-fun lt!344161 () Unit!26642)

(declare-fun e!430383 () Unit!26642)

(assert (=> b!773173 (= lt!344161 e!430383)))

(declare-fun c!85505 () Bool)

(assert (=> b!773173 (= c!85505 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!344168 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773173 (= lt!344168 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!773174 () Bool)

(declare-fun Unit!26644 () Unit!26642)

(assert (=> b!773174 (= e!430383 Unit!26644)))

(assert (=> b!773174 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344168 (select (arr!20315 a!3186) j!159) a!3186 mask!3328) lt!344167)))

(declare-fun b!773175 () Bool)

(declare-fun e!430382 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42435 (_ BitVec 32)) SeekEntryResult!7912)

(assert (=> b!773175 (= e!430382 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20315 a!3186) j!159) a!3186 mask!3328) (Found!7912 j!159)))))

(declare-fun b!773176 () Bool)

(declare-fun res!522969 () Bool)

(assert (=> b!773176 (=> (not res!522969) (not e!430379))))

(declare-fun arrayContainsKey!0 (array!42435 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!773176 (= res!522969 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!773177 () Bool)

(declare-fun Unit!26645 () Unit!26642)

(assert (=> b!773177 (= e!430383 Unit!26645)))

(declare-fun lt!344159 () SeekEntryResult!7912)

(assert (=> b!773177 (= lt!344159 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20315 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!773177 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344168 resIntermediateIndex!5 (select (arr!20315 a!3186) j!159) a!3186 mask!3328) (Found!7912 j!159))))

(declare-fun b!773178 () Bool)

(declare-fun res!522972 () Bool)

(assert (=> b!773178 (=> (not res!522972) (not e!430378))))

(assert (=> b!773178 (= res!522972 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20315 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!773179 () Bool)

(assert (=> b!773179 (= e!430384 (not e!430385))))

(declare-fun res!522966 () Bool)

(assert (=> b!773179 (=> res!522966 e!430385)))

(get-info :version)

(assert (=> b!773179 (= res!522966 (or (not ((_ is Intermediate!7912) lt!344158)) (bvsge x!1131 (x!64966 lt!344158))))))

(declare-fun e!430381 () Bool)

(assert (=> b!773179 e!430381))

(declare-fun res!522962 () Bool)

(assert (=> b!773179 (=> (not res!522962) (not e!430381))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42435 (_ BitVec 32)) Bool)

(assert (=> b!773179 (= res!522962 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!344160 () Unit!26642)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42435 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26642)

(assert (=> b!773179 (= lt!344160 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!773180 () Bool)

(assert (=> b!773180 (= e!430382 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20315 a!3186) j!159) a!3186 mask!3328) lt!344167))))

(declare-fun b!773181 () Bool)

(declare-fun res!522959 () Bool)

(assert (=> b!773181 (=> (not res!522959) (not e!430379))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!773181 (= res!522959 (validKeyInArray!0 (select (arr!20315 a!3186) j!159)))))

(declare-fun b!773182 () Bool)

(declare-fun res!522961 () Bool)

(assert (=> b!773182 (=> (not res!522961) (not e!430379))))

(assert (=> b!773182 (= res!522961 (validKeyInArray!0 k0!2102))))

(declare-fun b!773183 () Bool)

(declare-fun res!522958 () Bool)

(assert (=> b!773183 (=> (not res!522958) (not e!430379))))

(assert (=> b!773183 (= res!522958 (and (= (size!20736 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20736 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20736 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!773184 () Bool)

(declare-fun res!522963 () Bool)

(assert (=> b!773184 (=> (not res!522963) (not e!430386))))

(assert (=> b!773184 (= res!522963 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20736 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20736 a!3186))))))

(declare-fun b!773185 () Bool)

(assert (=> b!773185 (= e!430379 e!430386)))

(declare-fun res!522970 () Bool)

(assert (=> b!773185 (=> (not res!522970) (not e!430386))))

(declare-fun lt!344162 () SeekEntryResult!7912)

(assert (=> b!773185 (= res!522970 (or (= lt!344162 (MissingZero!7912 i!1173)) (= lt!344162 (MissingVacant!7912 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42435 (_ BitVec 32)) SeekEntryResult!7912)

(assert (=> b!773185 (= lt!344162 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!773186 () Bool)

(declare-fun res!522967 () Bool)

(assert (=> b!773186 (=> (not res!522967) (not e!430386))))

(assert (=> b!773186 (= res!522967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun lt!344163 () SeekEntryResult!7912)

(declare-fun b!773187 () Bool)

(declare-fun e!430380 () Bool)

(assert (=> b!773187 (= e!430380 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20315 a!3186) j!159) a!3186 mask!3328) lt!344163))))

(declare-fun b!773188 () Bool)

(assert (=> b!773188 (= e!430381 e!430380)))

(declare-fun res!522965 () Bool)

(assert (=> b!773188 (=> (not res!522965) (not e!430380))))

(assert (=> b!773188 (= res!522965 (= (seekEntryOrOpen!0 (select (arr!20315 a!3186) j!159) a!3186 mask!3328) lt!344163))))

(assert (=> b!773188 (= lt!344163 (Found!7912 j!159))))

(declare-fun b!773189 () Bool)

(declare-fun res!522964 () Bool)

(assert (=> b!773189 (=> (not res!522964) (not e!430378))))

(assert (=> b!773189 (= res!522964 e!430382)))

(declare-fun c!85506 () Bool)

(assert (=> b!773189 (= c!85506 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!66992 res!522968) b!773183))

(assert (= (and b!773183 res!522958) b!773181))

(assert (= (and b!773181 res!522959) b!773182))

(assert (= (and b!773182 res!522961) b!773176))

(assert (= (and b!773176 res!522969) b!773185))

(assert (= (and b!773185 res!522970) b!773186))

(assert (= (and b!773186 res!522967) b!773171))

(assert (= (and b!773171 res!522960) b!773184))

(assert (= (and b!773184 res!522963) b!773170))

(assert (= (and b!773170 res!522971) b!773178))

(assert (= (and b!773178 res!522972) b!773189))

(assert (= (and b!773189 c!85506) b!773180))

(assert (= (and b!773189 (not c!85506)) b!773175))

(assert (= (and b!773189 res!522964) b!773172))

(assert (= (and b!773172 res!522957) b!773179))

(assert (= (and b!773179 res!522962) b!773188))

(assert (= (and b!773188 res!522965) b!773187))

(assert (= (and b!773179 (not res!522966)) b!773173))

(assert (= (and b!773173 c!85505) b!773174))

(assert (= (and b!773173 (not c!85505)) b!773177))

(declare-fun m!717393 () Bool)

(assert (=> b!773185 m!717393))

(declare-fun m!717395 () Bool)

(assert (=> b!773173 m!717395))

(declare-fun m!717397 () Bool)

(assert (=> b!773175 m!717397))

(assert (=> b!773175 m!717397))

(declare-fun m!717399 () Bool)

(assert (=> b!773175 m!717399))

(assert (=> b!773180 m!717397))

(assert (=> b!773180 m!717397))

(declare-fun m!717401 () Bool)

(assert (=> b!773180 m!717401))

(declare-fun m!717403 () Bool)

(assert (=> b!773179 m!717403))

(declare-fun m!717405 () Bool)

(assert (=> b!773179 m!717405))

(assert (=> b!773170 m!717397))

(assert (=> b!773170 m!717397))

(declare-fun m!717407 () Bool)

(assert (=> b!773170 m!717407))

(assert (=> b!773170 m!717407))

(assert (=> b!773170 m!717397))

(declare-fun m!717409 () Bool)

(assert (=> b!773170 m!717409))

(declare-fun m!717411 () Bool)

(assert (=> b!773171 m!717411))

(declare-fun m!717413 () Bool)

(assert (=> b!773186 m!717413))

(assert (=> b!773177 m!717397))

(assert (=> b!773177 m!717397))

(assert (=> b!773177 m!717399))

(assert (=> b!773177 m!717397))

(declare-fun m!717415 () Bool)

(assert (=> b!773177 m!717415))

(declare-fun m!717417 () Bool)

(assert (=> b!773176 m!717417))

(assert (=> b!773174 m!717397))

(assert (=> b!773174 m!717397))

(declare-fun m!717419 () Bool)

(assert (=> b!773174 m!717419))

(assert (=> b!773187 m!717397))

(assert (=> b!773187 m!717397))

(declare-fun m!717421 () Bool)

(assert (=> b!773187 m!717421))

(declare-fun m!717423 () Bool)

(assert (=> b!773182 m!717423))

(declare-fun m!717425 () Bool)

(assert (=> b!773178 m!717425))

(declare-fun m!717427 () Bool)

(assert (=> start!66992 m!717427))

(declare-fun m!717429 () Bool)

(assert (=> start!66992 m!717429))

(assert (=> b!773181 m!717397))

(assert (=> b!773181 m!717397))

(declare-fun m!717431 () Bool)

(assert (=> b!773181 m!717431))

(assert (=> b!773188 m!717397))

(assert (=> b!773188 m!717397))

(declare-fun m!717433 () Bool)

(assert (=> b!773188 m!717433))

(declare-fun m!717435 () Bool)

(assert (=> b!773172 m!717435))

(declare-fun m!717437 () Bool)

(assert (=> b!773172 m!717437))

(declare-fun m!717439 () Bool)

(assert (=> b!773172 m!717439))

(declare-fun m!717441 () Bool)

(assert (=> b!773172 m!717441))

(declare-fun m!717443 () Bool)

(assert (=> b!773172 m!717443))

(assert (=> b!773172 m!717439))

(check-sat (not start!66992) (not b!773179) (not b!773180) (not b!773188) (not b!773182) (not b!773173) (not b!773187) (not b!773170) (not b!773172) (not b!773185) (not b!773186) (not b!773181) (not b!773176) (not b!773175) (not b!773177) (not b!773174) (not b!773171))
(check-sat)
