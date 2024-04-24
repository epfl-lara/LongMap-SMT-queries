; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67780 () Bool)

(assert start!67780)

(declare-fun res!530380 () Bool)

(declare-fun e!436093 () Bool)

(assert (=> start!67780 (=> (not res!530380) (not e!436093))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67780 (= res!530380 (validMask!0 mask!3328))))

(assert (=> start!67780 e!436093))

(assert (=> start!67780 true))

(declare-datatypes ((array!42700 0))(
  ( (array!42701 (arr!20434 (Array (_ BitVec 32) (_ BitVec 64))) (size!20854 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42700)

(declare-fun array_inv!16293 (array!42700) Bool)

(assert (=> start!67780 (array_inv!16293 a!3186)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!784203 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!436091 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7990 0))(
  ( (MissingZero!7990 (index!34328 (_ BitVec 32))) (Found!7990 (index!34329 (_ BitVec 32))) (Intermediate!7990 (undefined!8802 Bool) (index!34330 (_ BitVec 32)) (x!65445 (_ BitVec 32))) (Undefined!7990) (MissingVacant!7990 (index!34331 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42700 (_ BitVec 32)) SeekEntryResult!7990)

(assert (=> b!784203 (= e!436091 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20434 a!3186) j!159) a!3186 mask!3328) (Found!7990 j!159)))))

(declare-fun b!784204 () Bool)

(declare-datatypes ((Unit!27025 0))(
  ( (Unit!27026) )
))
(declare-fun e!436089 () Unit!27025)

(declare-fun Unit!27027 () Unit!27025)

(assert (=> b!784204 (= e!436089 Unit!27027)))

(declare-fun b!784205 () Bool)

(declare-fun Unit!27028 () Unit!27025)

(assert (=> b!784205 (= e!436089 Unit!27028)))

(assert (=> b!784205 false))

(declare-fun lt!349494 () (_ BitVec 64))

(declare-fun e!436095 () Bool)

(declare-fun b!784206 () Bool)

(declare-fun lt!349493 () array!42700)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42700 (_ BitVec 32)) SeekEntryResult!7990)

(assert (=> b!784206 (= e!436095 (= (seekEntryOrOpen!0 lt!349494 lt!349493 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349494 lt!349493 mask!3328)))))

(declare-fun b!784207 () Bool)

(declare-fun res!530389 () Bool)

(declare-fun e!436085 () Bool)

(assert (=> b!784207 (=> (not res!530389) (not e!436085))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!784207 (= res!530389 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20854 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20854 a!3186))))))

(declare-fun b!784208 () Bool)

(declare-fun e!436096 () Bool)

(declare-fun e!436094 () Bool)

(assert (=> b!784208 (= e!436096 e!436094)))

(declare-fun res!530385 () Bool)

(assert (=> b!784208 (=> (not res!530385) (not e!436094))))

(declare-fun lt!349504 () SeekEntryResult!7990)

(declare-fun lt!349500 () SeekEntryResult!7990)

(assert (=> b!784208 (= res!530385 (= lt!349504 lt!349500))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42700 (_ BitVec 32)) SeekEntryResult!7990)

(assert (=> b!784208 (= lt!349500 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349494 lt!349493 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!784208 (= lt!349504 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349494 mask!3328) lt!349494 lt!349493 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!784208 (= lt!349494 (select (store (arr!20434 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!784208 (= lt!349493 (array!42701 (store (arr!20434 a!3186) i!1173 k0!2102) (size!20854 a!3186)))))

(declare-fun b!784209 () Bool)

(declare-fun e!436092 () Bool)

(declare-fun e!436088 () Bool)

(assert (=> b!784209 (= e!436092 e!436088)))

(declare-fun res!530388 () Bool)

(assert (=> b!784209 (=> res!530388 e!436088)))

(declare-fun lt!349495 () SeekEntryResult!7990)

(declare-fun lt!349498 () SeekEntryResult!7990)

(assert (=> b!784209 (= res!530388 (not (= lt!349495 lt!349498)))))

(assert (=> b!784209 (= lt!349495 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20434 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!784210 () Bool)

(declare-fun e!436087 () Bool)

(declare-fun lt!349499 () SeekEntryResult!7990)

(assert (=> b!784210 (= e!436087 (= lt!349499 lt!349495))))

(assert (=> b!784210 e!436095))

(declare-fun res!530383 () Bool)

(assert (=> b!784210 (=> (not res!530383) (not e!436095))))

(declare-fun lt!349503 () (_ BitVec 64))

(assert (=> b!784210 (= res!530383 (= lt!349503 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!349497 () Unit!27025)

(assert (=> b!784210 (= lt!349497 e!436089)))

(declare-fun c!87323 () Bool)

(assert (=> b!784210 (= c!87323 (= lt!349503 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!784211 () Bool)

(assert (=> b!784211 (= e!436093 e!436085)))

(declare-fun res!530386 () Bool)

(assert (=> b!784211 (=> (not res!530386) (not e!436085))))

(declare-fun lt!349496 () SeekEntryResult!7990)

(assert (=> b!784211 (= res!530386 (or (= lt!349496 (MissingZero!7990 i!1173)) (= lt!349496 (MissingVacant!7990 i!1173))))))

(assert (=> b!784211 (= lt!349496 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!784212 () Bool)

(declare-fun res!530391 () Bool)

(assert (=> b!784212 (=> (not res!530391) (not e!436093))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!784212 (= res!530391 (validKeyInArray!0 k0!2102))))

(declare-fun b!784213 () Bool)

(assert (=> b!784213 (= e!436088 e!436087)))

(declare-fun res!530381 () Bool)

(assert (=> b!784213 (=> res!530381 e!436087)))

(assert (=> b!784213 (= res!530381 (= lt!349503 lt!349494))))

(assert (=> b!784213 (= lt!349503 (select (store (arr!20434 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!784214 () Bool)

(declare-fun res!530390 () Bool)

(assert (=> b!784214 (=> (not res!530390) (not e!436085))))

(declare-datatypes ((List!14343 0))(
  ( (Nil!14340) (Cons!14339 (h!15468 (_ BitVec 64)) (t!20650 List!14343)) )
))
(declare-fun arrayNoDuplicates!0 (array!42700 (_ BitVec 32) List!14343) Bool)

(assert (=> b!784214 (= res!530390 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14340))))

(declare-fun lt!349502 () SeekEntryResult!7990)

(declare-fun b!784215 () Bool)

(assert (=> b!784215 (= e!436091 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20434 a!3186) j!159) a!3186 mask!3328) lt!349502))))

(declare-fun b!784216 () Bool)

(declare-fun res!530394 () Bool)

(assert (=> b!784216 (=> (not res!530394) (not e!436093))))

(declare-fun arrayContainsKey!0 (array!42700 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!784216 (= res!530394 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!784217 () Bool)

(assert (=> b!784217 (= e!436085 e!436096)))

(declare-fun res!530395 () Bool)

(assert (=> b!784217 (=> (not res!530395) (not e!436096))))

(assert (=> b!784217 (= res!530395 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20434 a!3186) j!159) mask!3328) (select (arr!20434 a!3186) j!159) a!3186 mask!3328) lt!349502))))

(assert (=> b!784217 (= lt!349502 (Intermediate!7990 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!784218 () Bool)

(assert (=> b!784218 (= e!436094 (not e!436092))))

(declare-fun res!530396 () Bool)

(assert (=> b!784218 (=> res!530396 e!436092)))

(get-info :version)

(assert (=> b!784218 (= res!530396 (or (not ((_ is Intermediate!7990) lt!349500)) (bvslt x!1131 (x!65445 lt!349500)) (not (= x!1131 (x!65445 lt!349500))) (not (= index!1321 (index!34330 lt!349500)))))))

(declare-fun e!436090 () Bool)

(assert (=> b!784218 e!436090))

(declare-fun res!530397 () Bool)

(assert (=> b!784218 (=> (not res!530397) (not e!436090))))

(assert (=> b!784218 (= res!530397 (= lt!349499 lt!349498))))

(assert (=> b!784218 (= lt!349498 (Found!7990 j!159))))

(assert (=> b!784218 (= lt!349499 (seekEntryOrOpen!0 (select (arr!20434 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42700 (_ BitVec 32)) Bool)

(assert (=> b!784218 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!349501 () Unit!27025)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42700 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27025)

(assert (=> b!784218 (= lt!349501 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!784219 () Bool)

(declare-fun res!530392 () Bool)

(assert (=> b!784219 (=> (not res!530392) (not e!436096))))

(assert (=> b!784219 (= res!530392 e!436091)))

(declare-fun c!87322 () Bool)

(assert (=> b!784219 (= c!87322 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!784220 () Bool)

(declare-fun res!530393 () Bool)

(assert (=> b!784220 (=> (not res!530393) (not e!436096))))

(assert (=> b!784220 (= res!530393 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20434 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!784221 () Bool)

(declare-fun res!530387 () Bool)

(assert (=> b!784221 (=> (not res!530387) (not e!436093))))

(assert (=> b!784221 (= res!530387 (and (= (size!20854 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20854 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20854 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!784222 () Bool)

(assert (=> b!784222 (= e!436090 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20434 a!3186) j!159) a!3186 mask!3328) lt!349498))))

(declare-fun b!784223 () Bool)

(declare-fun res!530382 () Bool)

(assert (=> b!784223 (=> (not res!530382) (not e!436085))))

(assert (=> b!784223 (= res!530382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!784224 () Bool)

(declare-fun res!530384 () Bool)

(assert (=> b!784224 (=> (not res!530384) (not e!436093))))

(assert (=> b!784224 (= res!530384 (validKeyInArray!0 (select (arr!20434 a!3186) j!159)))))

(assert (= (and start!67780 res!530380) b!784221))

(assert (= (and b!784221 res!530387) b!784224))

(assert (= (and b!784224 res!530384) b!784212))

(assert (= (and b!784212 res!530391) b!784216))

(assert (= (and b!784216 res!530394) b!784211))

(assert (= (and b!784211 res!530386) b!784223))

(assert (= (and b!784223 res!530382) b!784214))

(assert (= (and b!784214 res!530390) b!784207))

(assert (= (and b!784207 res!530389) b!784217))

(assert (= (and b!784217 res!530395) b!784220))

(assert (= (and b!784220 res!530393) b!784219))

(assert (= (and b!784219 c!87322) b!784215))

(assert (= (and b!784219 (not c!87322)) b!784203))

(assert (= (and b!784219 res!530392) b!784208))

(assert (= (and b!784208 res!530385) b!784218))

(assert (= (and b!784218 res!530397) b!784222))

(assert (= (and b!784218 (not res!530396)) b!784209))

(assert (= (and b!784209 (not res!530388)) b!784213))

(assert (= (and b!784213 (not res!530381)) b!784210))

(assert (= (and b!784210 c!87323) b!784205))

(assert (= (and b!784210 (not c!87323)) b!784204))

(assert (= (and b!784210 res!530383) b!784206))

(declare-fun m!727151 () Bool)

(assert (=> b!784218 m!727151))

(assert (=> b!784218 m!727151))

(declare-fun m!727153 () Bool)

(assert (=> b!784218 m!727153))

(declare-fun m!727155 () Bool)

(assert (=> b!784218 m!727155))

(declare-fun m!727157 () Bool)

(assert (=> b!784218 m!727157))

(declare-fun m!727159 () Bool)

(assert (=> b!784211 m!727159))

(assert (=> b!784217 m!727151))

(assert (=> b!784217 m!727151))

(declare-fun m!727161 () Bool)

(assert (=> b!784217 m!727161))

(assert (=> b!784217 m!727161))

(assert (=> b!784217 m!727151))

(declare-fun m!727163 () Bool)

(assert (=> b!784217 m!727163))

(declare-fun m!727165 () Bool)

(assert (=> start!67780 m!727165))

(declare-fun m!727167 () Bool)

(assert (=> start!67780 m!727167))

(declare-fun m!727169 () Bool)

(assert (=> b!784208 m!727169))

(declare-fun m!727171 () Bool)

(assert (=> b!784208 m!727171))

(declare-fun m!727173 () Bool)

(assert (=> b!784208 m!727173))

(declare-fun m!727175 () Bool)

(assert (=> b!784208 m!727175))

(assert (=> b!784208 m!727169))

(declare-fun m!727177 () Bool)

(assert (=> b!784208 m!727177))

(assert (=> b!784222 m!727151))

(assert (=> b!784222 m!727151))

(declare-fun m!727179 () Bool)

(assert (=> b!784222 m!727179))

(declare-fun m!727181 () Bool)

(assert (=> b!784216 m!727181))

(declare-fun m!727183 () Bool)

(assert (=> b!784214 m!727183))

(declare-fun m!727185 () Bool)

(assert (=> b!784206 m!727185))

(declare-fun m!727187 () Bool)

(assert (=> b!784206 m!727187))

(assert (=> b!784215 m!727151))

(assert (=> b!784215 m!727151))

(declare-fun m!727189 () Bool)

(assert (=> b!784215 m!727189))

(assert (=> b!784213 m!727175))

(declare-fun m!727191 () Bool)

(assert (=> b!784213 m!727191))

(declare-fun m!727193 () Bool)

(assert (=> b!784223 m!727193))

(assert (=> b!784209 m!727151))

(assert (=> b!784209 m!727151))

(declare-fun m!727195 () Bool)

(assert (=> b!784209 m!727195))

(declare-fun m!727197 () Bool)

(assert (=> b!784212 m!727197))

(assert (=> b!784203 m!727151))

(assert (=> b!784203 m!727151))

(assert (=> b!784203 m!727195))

(declare-fun m!727199 () Bool)

(assert (=> b!784220 m!727199))

(assert (=> b!784224 m!727151))

(assert (=> b!784224 m!727151))

(declare-fun m!727201 () Bool)

(assert (=> b!784224 m!727201))

(check-sat (not b!784211) (not start!67780) (not b!784206) (not b!784218) (not b!784203) (not b!784224) (not b!784209) (not b!784222) (not b!784208) (not b!784214) (not b!784217) (not b!784223) (not b!784215) (not b!784216) (not b!784212))
(check-sat)
