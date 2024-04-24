; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65856 () Bool)

(assert start!65856)

(declare-fun b!755274 () Bool)

(declare-fun res!510175 () Bool)

(declare-fun e!421286 () Bool)

(assert (=> b!755274 (=> (not res!510175) (not e!421286))))

(declare-fun e!421282 () Bool)

(assert (=> b!755274 (= res!510175 e!421282)))

(declare-fun c!82936 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!755274 (= c!82936 (bvsle x!1131 resIntermediateX!5))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41899 0))(
  ( (array!41900 (arr!20059 (Array (_ BitVec 32) (_ BitVec 64))) (size!20479 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41899)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7615 0))(
  ( (MissingZero!7615 (index!32828 (_ BitVec 32))) (Found!7615 (index!32829 (_ BitVec 32))) (Intermediate!7615 (undefined!8427 Bool) (index!32830 (_ BitVec 32)) (x!63897 (_ BitVec 32))) (Undefined!7615) (MissingVacant!7615 (index!32831 (_ BitVec 32))) )
))
(declare-fun lt!336114 () SeekEntryResult!7615)

(declare-fun e!421281 () Bool)

(declare-fun b!755275 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41899 (_ BitVec 32)) SeekEntryResult!7615)

(assert (=> b!755275 (= e!421281 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20059 a!3186) j!159) a!3186 mask!3328) lt!336114))))

(declare-fun b!755276 () Bool)

(declare-fun res!510186 () Bool)

(assert (=> b!755276 (=> (not res!510186) (not e!421286))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!755276 (= res!510186 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20059 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!755277 () Bool)

(declare-fun res!510184 () Bool)

(declare-fun e!421277 () Bool)

(assert (=> b!755277 (=> (not res!510184) (not e!421277))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!755277 (= res!510184 (validKeyInArray!0 k0!2102))))

(declare-fun b!755278 () Bool)

(declare-fun e!421287 () Bool)

(assert (=> b!755278 (= e!421287 e!421286)))

(declare-fun res!510178 () Bool)

(assert (=> b!755278 (=> (not res!510178) (not e!421286))))

(declare-fun lt!336103 () SeekEntryResult!7615)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41899 (_ BitVec 32)) SeekEntryResult!7615)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!755278 (= res!510178 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20059 a!3186) j!159) mask!3328) (select (arr!20059 a!3186) j!159) a!3186 mask!3328) lt!336103))))

(assert (=> b!755278 (= lt!336103 (Intermediate!7615 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!755279 () Bool)

(assert (=> b!755279 (= e!421277 e!421287)))

(declare-fun res!510176 () Bool)

(assert (=> b!755279 (=> (not res!510176) (not e!421287))))

(declare-fun lt!336113 () SeekEntryResult!7615)

(assert (=> b!755279 (= res!510176 (or (= lt!336113 (MissingZero!7615 i!1173)) (= lt!336113 (MissingVacant!7615 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41899 (_ BitVec 32)) SeekEntryResult!7615)

(assert (=> b!755279 (= lt!336113 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!755281 () Bool)

(declare-fun res!510170 () Bool)

(assert (=> b!755281 (=> (not res!510170) (not e!421277))))

(assert (=> b!755281 (= res!510170 (validKeyInArray!0 (select (arr!20059 a!3186) j!159)))))

(declare-fun b!755282 () Bool)

(declare-fun e!421276 () Bool)

(declare-fun e!421279 () Bool)

(assert (=> b!755282 (= e!421276 e!421279)))

(declare-fun res!510179 () Bool)

(assert (=> b!755282 (=> res!510179 e!421279)))

(declare-fun lt!336104 () SeekEntryResult!7615)

(assert (=> b!755282 (= res!510179 (not (= lt!336104 lt!336114)))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!755282 (= lt!336104 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20059 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!755283 () Bool)

(declare-fun res!510181 () Bool)

(assert (=> b!755283 (=> (not res!510181) (not e!421287))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41899 (_ BitVec 32)) Bool)

(assert (=> b!755283 (= res!510181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!755284 () Bool)

(declare-fun e!421283 () Bool)

(declare-fun lt!336108 () SeekEntryResult!7615)

(assert (=> b!755284 (= e!421283 (= lt!336108 lt!336104))))

(declare-fun b!755285 () Bool)

(declare-fun res!510169 () Bool)

(assert (=> b!755285 (=> (not res!510169) (not e!421277))))

(assert (=> b!755285 (= res!510169 (and (= (size!20479 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20479 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20479 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!755286 () Bool)

(declare-fun res!510183 () Bool)

(assert (=> b!755286 (=> (not res!510183) (not e!421287))))

(declare-datatypes ((List!13968 0))(
  ( (Nil!13965) (Cons!13964 (h!15042 (_ BitVec 64)) (t!20275 List!13968)) )
))
(declare-fun arrayNoDuplicates!0 (array!41899 (_ BitVec 32) List!13968) Bool)

(assert (=> b!755286 (= res!510183 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13965))))

(declare-fun b!755287 () Bool)

(assert (=> b!755287 (= e!421282 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20059 a!3186) j!159) a!3186 mask!3328) (Found!7615 j!159)))))

(declare-fun b!755288 () Bool)

(assert (=> b!755288 (= e!421282 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20059 a!3186) j!159) a!3186 mask!3328) lt!336103))))

(declare-fun b!755289 () Bool)

(declare-datatypes ((Unit!26017 0))(
  ( (Unit!26018) )
))
(declare-fun e!421280 () Unit!26017)

(declare-fun Unit!26019 () Unit!26017)

(assert (=> b!755289 (= e!421280 Unit!26019)))

(assert (=> b!755289 false))

(declare-fun b!755290 () Bool)

(declare-fun res!510173 () Bool)

(assert (=> b!755290 (=> (not res!510173) (not e!421287))))

(assert (=> b!755290 (= res!510173 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20479 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20479 a!3186))))))

(declare-fun b!755291 () Bool)

(declare-fun res!510174 () Bool)

(assert (=> b!755291 (=> (not res!510174) (not e!421277))))

(declare-fun arrayContainsKey!0 (array!41899 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!755291 (= res!510174 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!755292 () Bool)

(declare-fun res!510180 () Bool)

(assert (=> b!755292 (=> (not res!510180) (not e!421283))))

(declare-fun lt!336112 () array!41899)

(declare-fun lt!336107 () (_ BitVec 64))

(assert (=> b!755292 (= res!510180 (= (seekEntryOrOpen!0 lt!336107 lt!336112 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336107 lt!336112 mask!3328)))))

(declare-fun b!755280 () Bool)

(declare-fun Unit!26020 () Unit!26017)

(assert (=> b!755280 (= e!421280 Unit!26020)))

(declare-fun res!510185 () Bool)

(assert (=> start!65856 (=> (not res!510185) (not e!421277))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65856 (= res!510185 (validMask!0 mask!3328))))

(assert (=> start!65856 e!421277))

(assert (=> start!65856 true))

(declare-fun array_inv!15918 (array!41899) Bool)

(assert (=> start!65856 (array_inv!15918 a!3186)))

(declare-fun b!755293 () Bool)

(declare-fun e!421285 () Bool)

(assert (=> b!755293 (= e!421285 (not e!421276))))

(declare-fun res!510172 () Bool)

(assert (=> b!755293 (=> res!510172 e!421276)))

(declare-fun lt!336110 () SeekEntryResult!7615)

(get-info :version)

(assert (=> b!755293 (= res!510172 (or (not ((_ is Intermediate!7615) lt!336110)) (bvslt x!1131 (x!63897 lt!336110)) (not (= x!1131 (x!63897 lt!336110))) (not (= index!1321 (index!32830 lt!336110)))))))

(assert (=> b!755293 e!421281))

(declare-fun res!510171 () Bool)

(assert (=> b!755293 (=> (not res!510171) (not e!421281))))

(assert (=> b!755293 (= res!510171 (= lt!336108 lt!336114))))

(assert (=> b!755293 (= lt!336114 (Found!7615 j!159))))

(assert (=> b!755293 (= lt!336108 (seekEntryOrOpen!0 (select (arr!20059 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!755293 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!336106 () Unit!26017)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41899 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26017)

(assert (=> b!755293 (= lt!336106 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!755294 () Bool)

(declare-fun e!421284 () Bool)

(assert (=> b!755294 (= e!421284 true)))

(assert (=> b!755294 e!421283))

(declare-fun res!510187 () Bool)

(assert (=> b!755294 (=> (not res!510187) (not e!421283))))

(declare-fun lt!336111 () (_ BitVec 64))

(assert (=> b!755294 (= res!510187 (= lt!336111 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336105 () Unit!26017)

(assert (=> b!755294 (= lt!336105 e!421280)))

(declare-fun c!82937 () Bool)

(assert (=> b!755294 (= c!82937 (= lt!336111 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!755295 () Bool)

(assert (=> b!755295 (= e!421279 e!421284)))

(declare-fun res!510182 () Bool)

(assert (=> b!755295 (=> res!510182 e!421284)))

(assert (=> b!755295 (= res!510182 (= lt!336111 lt!336107))))

(assert (=> b!755295 (= lt!336111 (select (store (arr!20059 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!755296 () Bool)

(assert (=> b!755296 (= e!421286 e!421285)))

(declare-fun res!510177 () Bool)

(assert (=> b!755296 (=> (not res!510177) (not e!421285))))

(declare-fun lt!336109 () SeekEntryResult!7615)

(assert (=> b!755296 (= res!510177 (= lt!336109 lt!336110))))

(assert (=> b!755296 (= lt!336110 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336107 lt!336112 mask!3328))))

(assert (=> b!755296 (= lt!336109 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336107 mask!3328) lt!336107 lt!336112 mask!3328))))

(assert (=> b!755296 (= lt!336107 (select (store (arr!20059 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!755296 (= lt!336112 (array!41900 (store (arr!20059 a!3186) i!1173 k0!2102) (size!20479 a!3186)))))

(assert (= (and start!65856 res!510185) b!755285))

(assert (= (and b!755285 res!510169) b!755281))

(assert (= (and b!755281 res!510170) b!755277))

(assert (= (and b!755277 res!510184) b!755291))

(assert (= (and b!755291 res!510174) b!755279))

(assert (= (and b!755279 res!510176) b!755283))

(assert (= (and b!755283 res!510181) b!755286))

(assert (= (and b!755286 res!510183) b!755290))

(assert (= (and b!755290 res!510173) b!755278))

(assert (= (and b!755278 res!510178) b!755276))

(assert (= (and b!755276 res!510186) b!755274))

(assert (= (and b!755274 c!82936) b!755288))

(assert (= (and b!755274 (not c!82936)) b!755287))

(assert (= (and b!755274 res!510175) b!755296))

(assert (= (and b!755296 res!510177) b!755293))

(assert (= (and b!755293 res!510171) b!755275))

(assert (= (and b!755293 (not res!510172)) b!755282))

(assert (= (and b!755282 (not res!510179)) b!755295))

(assert (= (and b!755295 (not res!510182)) b!755294))

(assert (= (and b!755294 c!82937) b!755289))

(assert (= (and b!755294 (not c!82937)) b!755280))

(assert (= (and b!755294 res!510187) b!755292))

(assert (= (and b!755292 res!510180) b!755284))

(declare-fun m!704115 () Bool)

(assert (=> b!755287 m!704115))

(assert (=> b!755287 m!704115))

(declare-fun m!704117 () Bool)

(assert (=> b!755287 m!704117))

(assert (=> b!755281 m!704115))

(assert (=> b!755281 m!704115))

(declare-fun m!704119 () Bool)

(assert (=> b!755281 m!704119))

(declare-fun m!704121 () Bool)

(assert (=> b!755277 m!704121))

(declare-fun m!704123 () Bool)

(assert (=> b!755292 m!704123))

(declare-fun m!704125 () Bool)

(assert (=> b!755292 m!704125))

(declare-fun m!704127 () Bool)

(assert (=> start!65856 m!704127))

(declare-fun m!704129 () Bool)

(assert (=> start!65856 m!704129))

(declare-fun m!704131 () Bool)

(assert (=> b!755295 m!704131))

(declare-fun m!704133 () Bool)

(assert (=> b!755295 m!704133))

(assert (=> b!755282 m!704115))

(assert (=> b!755282 m!704115))

(assert (=> b!755282 m!704117))

(assert (=> b!755275 m!704115))

(assert (=> b!755275 m!704115))

(declare-fun m!704135 () Bool)

(assert (=> b!755275 m!704135))

(declare-fun m!704137 () Bool)

(assert (=> b!755283 m!704137))

(assert (=> b!755278 m!704115))

(assert (=> b!755278 m!704115))

(declare-fun m!704139 () Bool)

(assert (=> b!755278 m!704139))

(assert (=> b!755278 m!704139))

(assert (=> b!755278 m!704115))

(declare-fun m!704141 () Bool)

(assert (=> b!755278 m!704141))

(assert (=> b!755288 m!704115))

(assert (=> b!755288 m!704115))

(declare-fun m!704143 () Bool)

(assert (=> b!755288 m!704143))

(declare-fun m!704145 () Bool)

(assert (=> b!755276 m!704145))

(assert (=> b!755293 m!704115))

(assert (=> b!755293 m!704115))

(declare-fun m!704147 () Bool)

(assert (=> b!755293 m!704147))

(declare-fun m!704149 () Bool)

(assert (=> b!755293 m!704149))

(declare-fun m!704151 () Bool)

(assert (=> b!755293 m!704151))

(declare-fun m!704153 () Bool)

(assert (=> b!755291 m!704153))

(declare-fun m!704155 () Bool)

(assert (=> b!755286 m!704155))

(assert (=> b!755296 m!704131))

(declare-fun m!704157 () Bool)

(assert (=> b!755296 m!704157))

(assert (=> b!755296 m!704157))

(declare-fun m!704159 () Bool)

(assert (=> b!755296 m!704159))

(declare-fun m!704161 () Bool)

(assert (=> b!755296 m!704161))

(declare-fun m!704163 () Bool)

(assert (=> b!755296 m!704163))

(declare-fun m!704165 () Bool)

(assert (=> b!755279 m!704165))

(check-sat (not b!755296) (not b!755275) (not start!65856) (not b!755283) (not b!755287) (not b!755292) (not b!755282) (not b!755293) (not b!755281) (not b!755279) (not b!755288) (not b!755286) (not b!755277) (not b!755291) (not b!755278))
(check-sat)
