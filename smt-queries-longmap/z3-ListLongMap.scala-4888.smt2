; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67352 () Bool)

(assert start!67352)

(declare-fun b!779241 () Bool)

(declare-fun e!433477 () Bool)

(declare-fun e!433475 () Bool)

(assert (=> b!779241 (= e!433477 e!433475)))

(declare-fun res!527342 () Bool)

(assert (=> b!779241 (=> (not res!527342) (not e!433475))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7990 0))(
  ( (MissingZero!7990 (index!34328 (_ BitVec 32))) (Found!7990 (index!34329 (_ BitVec 32))) (Intermediate!7990 (undefined!8802 Bool) (index!34330 (_ BitVec 32)) (x!65282 (_ BitVec 32))) (Undefined!7990) (MissingVacant!7990 (index!34331 (_ BitVec 32))) )
))
(declare-fun lt!347097 () SeekEntryResult!7990)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42600 0))(
  ( (array!42601 (arr!20393 (Array (_ BitVec 32) (_ BitVec 64))) (size!20814 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42600)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42600 (_ BitVec 32)) SeekEntryResult!7990)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!779241 (= res!527342 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20393 a!3186) j!159) mask!3328) (select (arr!20393 a!3186) j!159) a!3186 mask!3328) lt!347097))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!779241 (= lt!347097 (Intermediate!7990 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!779242 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun e!433479 () Bool)

(assert (=> b!779242 (= e!433479 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20393 a!3186) j!159) a!3186 mask!3328) lt!347097))))

(declare-fun b!779243 () Bool)

(declare-fun res!527336 () Bool)

(declare-fun e!433478 () Bool)

(assert (=> b!779243 (=> (not res!527336) (not e!433478))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42600 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!779243 (= res!527336 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!779244 () Bool)

(declare-fun res!527337 () Bool)

(assert (=> b!779244 (=> (not res!527337) (not e!433475))))

(assert (=> b!779244 (= res!527337 e!433479)))

(declare-fun c!86358 () Bool)

(assert (=> b!779244 (= c!86358 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!779245 () Bool)

(declare-fun res!527341 () Bool)

(assert (=> b!779245 (=> (not res!527341) (not e!433477))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42600 (_ BitVec 32)) Bool)

(assert (=> b!779245 (= res!527341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!779246 () Bool)

(declare-fun e!433480 () Bool)

(declare-fun e!433483 () Bool)

(assert (=> b!779246 (= e!433480 e!433483)))

(declare-fun res!527338 () Bool)

(assert (=> b!779246 (=> res!527338 e!433483)))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun lt!347091 () SeekEntryResult!7990)

(declare-fun lt!347094 () SeekEntryResult!7990)

(declare-fun lt!347098 () (_ BitVec 64))

(assert (=> b!779246 (= res!527338 (or (not (= lt!347091 lt!347094)) (= (select (store (arr!20393 a!3186) i!1173 k0!2102) index!1321) lt!347098) (not (= (select (store (arr!20393 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42600 (_ BitVec 32)) SeekEntryResult!7990)

(assert (=> b!779246 (= lt!347091 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20393 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!779247 () Bool)

(declare-fun e!433482 () Bool)

(assert (=> b!779247 (= e!433475 e!433482)))

(declare-fun res!527340 () Bool)

(assert (=> b!779247 (=> (not res!527340) (not e!433482))))

(declare-fun lt!347095 () SeekEntryResult!7990)

(declare-fun lt!347096 () SeekEntryResult!7990)

(assert (=> b!779247 (= res!527340 (= lt!347095 lt!347096))))

(declare-fun lt!347092 () array!42600)

(assert (=> b!779247 (= lt!347096 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347098 lt!347092 mask!3328))))

(assert (=> b!779247 (= lt!347095 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347098 mask!3328) lt!347098 lt!347092 mask!3328))))

(assert (=> b!779247 (= lt!347098 (select (store (arr!20393 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!779247 (= lt!347092 (array!42601 (store (arr!20393 a!3186) i!1173 k0!2102) (size!20814 a!3186)))))

(declare-fun b!779248 () Bool)

(declare-fun res!527345 () Bool)

(assert (=> b!779248 (=> (not res!527345) (not e!433477))))

(declare-datatypes ((List!14434 0))(
  ( (Nil!14431) (Cons!14430 (h!15544 (_ BitVec 64)) (t!20740 List!14434)) )
))
(declare-fun arrayNoDuplicates!0 (array!42600 (_ BitVec 32) List!14434) Bool)

(assert (=> b!779248 (= res!527345 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14431))))

(declare-fun b!779249 () Bool)

(declare-fun res!527335 () Bool)

(assert (=> b!779249 (=> (not res!527335) (not e!433475))))

(assert (=> b!779249 (= res!527335 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20393 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!779250 () Bool)

(assert (=> b!779250 (= e!433483 true)))

(declare-fun lt!347090 () SeekEntryResult!7990)

(assert (=> b!779250 (= lt!347090 lt!347091)))

(declare-fun res!527333 () Bool)

(assert (=> start!67352 (=> (not res!527333) (not e!433478))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67352 (= res!527333 (validMask!0 mask!3328))))

(assert (=> start!67352 e!433478))

(assert (=> start!67352 true))

(declare-fun array_inv!16276 (array!42600) Bool)

(assert (=> start!67352 (array_inv!16276 a!3186)))

(declare-fun b!779251 () Bool)

(assert (=> b!779251 (= e!433479 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20393 a!3186) j!159) a!3186 mask!3328) (Found!7990 j!159)))))

(declare-fun b!779252 () Bool)

(declare-fun res!527344 () Bool)

(assert (=> b!779252 (=> (not res!527344) (not e!433478))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!779252 (= res!527344 (validKeyInArray!0 k0!2102))))

(declare-fun b!779253 () Bool)

(assert (=> b!779253 (= e!433482 (not e!433480))))

(declare-fun res!527334 () Bool)

(assert (=> b!779253 (=> res!527334 e!433480)))

(get-info :version)

(assert (=> b!779253 (= res!527334 (or (not ((_ is Intermediate!7990) lt!347096)) (bvslt x!1131 (x!65282 lt!347096)) (not (= x!1131 (x!65282 lt!347096))) (not (= index!1321 (index!34330 lt!347096)))))))

(declare-fun e!433481 () Bool)

(assert (=> b!779253 e!433481))

(declare-fun res!527346 () Bool)

(assert (=> b!779253 (=> (not res!527346) (not e!433481))))

(assert (=> b!779253 (= res!527346 (= lt!347090 lt!347094))))

(assert (=> b!779253 (= lt!347094 (Found!7990 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42600 (_ BitVec 32)) SeekEntryResult!7990)

(assert (=> b!779253 (= lt!347090 (seekEntryOrOpen!0 (select (arr!20393 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!779253 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26846 0))(
  ( (Unit!26847) )
))
(declare-fun lt!347099 () Unit!26846)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42600 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26846)

(assert (=> b!779253 (= lt!347099 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!779254 () Bool)

(declare-fun res!527343 () Bool)

(assert (=> b!779254 (=> (not res!527343) (not e!433477))))

(assert (=> b!779254 (= res!527343 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20814 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20814 a!3186))))))

(declare-fun b!779255 () Bool)

(assert (=> b!779255 (= e!433478 e!433477)))

(declare-fun res!527331 () Bool)

(assert (=> b!779255 (=> (not res!527331) (not e!433477))))

(declare-fun lt!347093 () SeekEntryResult!7990)

(assert (=> b!779255 (= res!527331 (or (= lt!347093 (MissingZero!7990 i!1173)) (= lt!347093 (MissingVacant!7990 i!1173))))))

(assert (=> b!779255 (= lt!347093 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!779256 () Bool)

(declare-fun res!527339 () Bool)

(assert (=> b!779256 (=> (not res!527339) (not e!433478))))

(assert (=> b!779256 (= res!527339 (validKeyInArray!0 (select (arr!20393 a!3186) j!159)))))

(declare-fun b!779257 () Bool)

(assert (=> b!779257 (= e!433481 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20393 a!3186) j!159) a!3186 mask!3328) lt!347094))))

(declare-fun b!779258 () Bool)

(declare-fun res!527332 () Bool)

(assert (=> b!779258 (=> (not res!527332) (not e!433478))))

(assert (=> b!779258 (= res!527332 (and (= (size!20814 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20814 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20814 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!67352 res!527333) b!779258))

(assert (= (and b!779258 res!527332) b!779256))

(assert (= (and b!779256 res!527339) b!779252))

(assert (= (and b!779252 res!527344) b!779243))

(assert (= (and b!779243 res!527336) b!779255))

(assert (= (and b!779255 res!527331) b!779245))

(assert (= (and b!779245 res!527341) b!779248))

(assert (= (and b!779248 res!527345) b!779254))

(assert (= (and b!779254 res!527343) b!779241))

(assert (= (and b!779241 res!527342) b!779249))

(assert (= (and b!779249 res!527335) b!779244))

(assert (= (and b!779244 c!86358) b!779242))

(assert (= (and b!779244 (not c!86358)) b!779251))

(assert (= (and b!779244 res!527337) b!779247))

(assert (= (and b!779247 res!527340) b!779253))

(assert (= (and b!779253 res!527346) b!779257))

(assert (= (and b!779253 (not res!527334)) b!779246))

(assert (= (and b!779246 (not res!527338)) b!779250))

(declare-fun m!722241 () Bool)

(assert (=> b!779251 m!722241))

(assert (=> b!779251 m!722241))

(declare-fun m!722243 () Bool)

(assert (=> b!779251 m!722243))

(declare-fun m!722245 () Bool)

(assert (=> start!67352 m!722245))

(declare-fun m!722247 () Bool)

(assert (=> start!67352 m!722247))

(declare-fun m!722249 () Bool)

(assert (=> b!779252 m!722249))

(declare-fun m!722251 () Bool)

(assert (=> b!779255 m!722251))

(declare-fun m!722253 () Bool)

(assert (=> b!779249 m!722253))

(declare-fun m!722255 () Bool)

(assert (=> b!779245 m!722255))

(assert (=> b!779256 m!722241))

(assert (=> b!779256 m!722241))

(declare-fun m!722257 () Bool)

(assert (=> b!779256 m!722257))

(declare-fun m!722259 () Bool)

(assert (=> b!779246 m!722259))

(declare-fun m!722261 () Bool)

(assert (=> b!779246 m!722261))

(assert (=> b!779246 m!722241))

(assert (=> b!779246 m!722241))

(assert (=> b!779246 m!722243))

(assert (=> b!779241 m!722241))

(assert (=> b!779241 m!722241))

(declare-fun m!722263 () Bool)

(assert (=> b!779241 m!722263))

(assert (=> b!779241 m!722263))

(assert (=> b!779241 m!722241))

(declare-fun m!722265 () Bool)

(assert (=> b!779241 m!722265))

(assert (=> b!779242 m!722241))

(assert (=> b!779242 m!722241))

(declare-fun m!722267 () Bool)

(assert (=> b!779242 m!722267))

(assert (=> b!779253 m!722241))

(assert (=> b!779253 m!722241))

(declare-fun m!722269 () Bool)

(assert (=> b!779253 m!722269))

(declare-fun m!722271 () Bool)

(assert (=> b!779253 m!722271))

(declare-fun m!722273 () Bool)

(assert (=> b!779253 m!722273))

(declare-fun m!722275 () Bool)

(assert (=> b!779243 m!722275))

(declare-fun m!722277 () Bool)

(assert (=> b!779248 m!722277))

(assert (=> b!779257 m!722241))

(assert (=> b!779257 m!722241))

(declare-fun m!722279 () Bool)

(assert (=> b!779257 m!722279))

(declare-fun m!722281 () Bool)

(assert (=> b!779247 m!722281))

(declare-fun m!722283 () Bool)

(assert (=> b!779247 m!722283))

(assert (=> b!779247 m!722259))

(assert (=> b!779247 m!722281))

(declare-fun m!722285 () Bool)

(assert (=> b!779247 m!722285))

(declare-fun m!722287 () Bool)

(assert (=> b!779247 m!722287))

(check-sat (not b!779253) (not b!779257) (not b!779255) (not b!779248) (not b!779251) (not b!779252) (not b!779243) (not b!779241) (not start!67352) (not b!779245) (not b!779242) (not b!779247) (not b!779246) (not b!779256))
(check-sat)
