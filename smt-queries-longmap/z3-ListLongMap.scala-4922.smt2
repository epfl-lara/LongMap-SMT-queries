; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67754 () Bool)

(assert start!67754)

(declare-fun b!787234 () Bool)

(declare-fun e!437567 () Bool)

(declare-fun e!437570 () Bool)

(assert (=> b!787234 (= e!437567 e!437570)))

(declare-fun res!533254 () Bool)

(assert (=> b!787234 (=> (not res!533254) (not e!437570))))

(declare-datatypes ((array!42813 0))(
  ( (array!42814 (arr!20495 (Array (_ BitVec 32) (_ BitVec 64))) (size!20916 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42813)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8092 0))(
  ( (MissingZero!8092 (index!34736 (_ BitVec 32))) (Found!8092 (index!34737 (_ BitVec 32))) (Intermediate!8092 (undefined!8904 Bool) (index!34738 (_ BitVec 32)) (x!65683 (_ BitVec 32))) (Undefined!8092) (MissingVacant!8092 (index!34739 (_ BitVec 32))) )
))
(declare-fun lt!351039 () SeekEntryResult!8092)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42813 (_ BitVec 32)) SeekEntryResult!8092)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!787234 (= res!533254 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20495 a!3186) j!159) mask!3328) (select (arr!20495 a!3186) j!159) a!3186 mask!3328) lt!351039))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!787234 (= lt!351039 (Intermediate!8092 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!787235 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun e!437574 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42813 (_ BitVec 32)) SeekEntryResult!8092)

(assert (=> b!787235 (= e!437574 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20495 a!3186) j!159) a!3186 mask!3328) (Found!8092 j!159)))))

(declare-fun b!787236 () Bool)

(declare-datatypes ((Unit!27236 0))(
  ( (Unit!27237) )
))
(declare-fun e!437571 () Unit!27236)

(declare-fun Unit!27238 () Unit!27236)

(assert (=> b!787236 (= e!437571 Unit!27238)))

(declare-fun b!787237 () Bool)

(declare-fun res!533241 () Bool)

(assert (=> b!787237 (=> (not res!533241) (not e!437567))))

(assert (=> b!787237 (= res!533241 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20916 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20916 a!3186))))))

(declare-fun b!787238 () Bool)

(declare-fun res!533252 () Bool)

(declare-fun e!437576 () Bool)

(assert (=> b!787238 (=> (not res!533252) (not e!437576))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!787238 (= res!533252 (validKeyInArray!0 k0!2102))))

(declare-fun lt!351036 () SeekEntryResult!8092)

(declare-fun b!787239 () Bool)

(declare-fun e!437569 () Bool)

(assert (=> b!787239 (= e!437569 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20495 a!3186) j!159) a!3186 mask!3328) lt!351036))))

(declare-fun b!787240 () Bool)

(declare-fun e!437578 () Bool)

(declare-fun e!437577 () Bool)

(assert (=> b!787240 (= e!437578 e!437577)))

(declare-fun res!533244 () Bool)

(assert (=> b!787240 (=> res!533244 e!437577)))

(declare-fun lt!351043 () (_ BitVec 64))

(declare-fun lt!351041 () (_ BitVec 64))

(assert (=> b!787240 (= res!533244 (= lt!351043 lt!351041))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!787240 (= lt!351043 (select (store (arr!20495 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!787241 () Bool)

(declare-fun e!437572 () Bool)

(assert (=> b!787241 (= e!437572 e!437578)))

(declare-fun res!533250 () Bool)

(assert (=> b!787241 (=> res!533250 e!437578)))

(declare-fun lt!351042 () SeekEntryResult!8092)

(assert (=> b!787241 (= res!533250 (not (= lt!351042 lt!351036)))))

(assert (=> b!787241 (= lt!351042 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20495 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!787242 () Bool)

(declare-fun res!533255 () Bool)

(assert (=> b!787242 (=> (not res!533255) (not e!437576))))

(declare-fun arrayContainsKey!0 (array!42813 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!787242 (= res!533255 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!533259 () Bool)

(assert (=> start!67754 (=> (not res!533259) (not e!437576))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67754 (= res!533259 (validMask!0 mask!3328))))

(assert (=> start!67754 e!437576))

(assert (=> start!67754 true))

(declare-fun array_inv!16378 (array!42813) Bool)

(assert (=> start!67754 (array_inv!16378 a!3186)))

(declare-fun b!787243 () Bool)

(declare-fun res!533257 () Bool)

(assert (=> b!787243 (=> (not res!533257) (not e!437576))))

(assert (=> b!787243 (= res!533257 (and (= (size!20916 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20916 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20916 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!787244 () Bool)

(declare-fun e!437575 () Bool)

(assert (=> b!787244 (= e!437570 e!437575)))

(declare-fun res!533247 () Bool)

(assert (=> b!787244 (=> (not res!533247) (not e!437575))))

(declare-fun lt!351044 () SeekEntryResult!8092)

(declare-fun lt!351035 () SeekEntryResult!8092)

(assert (=> b!787244 (= res!533247 (= lt!351044 lt!351035))))

(declare-fun lt!351033 () array!42813)

(assert (=> b!787244 (= lt!351035 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351041 lt!351033 mask!3328))))

(assert (=> b!787244 (= lt!351044 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351041 mask!3328) lt!351041 lt!351033 mask!3328))))

(assert (=> b!787244 (= lt!351041 (select (store (arr!20495 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!787244 (= lt!351033 (array!42814 (store (arr!20495 a!3186) i!1173 k0!2102) (size!20916 a!3186)))))

(declare-fun b!787245 () Bool)

(declare-fun res!533246 () Bool)

(assert (=> b!787245 (=> (not res!533246) (not e!437567))))

(declare-datatypes ((List!14536 0))(
  ( (Nil!14533) (Cons!14532 (h!15655 (_ BitVec 64)) (t!20842 List!14536)) )
))
(declare-fun arrayNoDuplicates!0 (array!42813 (_ BitVec 32) List!14536) Bool)

(assert (=> b!787245 (= res!533246 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14533))))

(declare-fun b!787246 () Bool)

(declare-fun res!533249 () Bool)

(declare-fun e!437573 () Bool)

(assert (=> b!787246 (=> (not res!533249) (not e!437573))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42813 (_ BitVec 32)) SeekEntryResult!8092)

(assert (=> b!787246 (= res!533249 (= (seekEntryOrOpen!0 lt!351041 lt!351033 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351041 lt!351033 mask!3328)))))

(declare-fun b!787247 () Bool)

(assert (=> b!787247 (= e!437575 (not e!437572))))

(declare-fun res!533253 () Bool)

(assert (=> b!787247 (=> res!533253 e!437572)))

(get-info :version)

(assert (=> b!787247 (= res!533253 (or (not ((_ is Intermediate!8092) lt!351035)) (bvslt x!1131 (x!65683 lt!351035)) (not (= x!1131 (x!65683 lt!351035))) (not (= index!1321 (index!34738 lt!351035)))))))

(assert (=> b!787247 e!437569))

(declare-fun res!533243 () Bool)

(assert (=> b!787247 (=> (not res!533243) (not e!437569))))

(declare-fun lt!351038 () SeekEntryResult!8092)

(assert (=> b!787247 (= res!533243 (= lt!351038 lt!351036))))

(assert (=> b!787247 (= lt!351036 (Found!8092 j!159))))

(assert (=> b!787247 (= lt!351038 (seekEntryOrOpen!0 (select (arr!20495 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42813 (_ BitVec 32)) Bool)

(assert (=> b!787247 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!351040 () Unit!27236)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42813 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27236)

(assert (=> b!787247 (= lt!351040 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!787248 () Bool)

(declare-fun res!533256 () Bool)

(assert (=> b!787248 (=> (not res!533256) (not e!437570))))

(assert (=> b!787248 (= res!533256 e!437574)))

(declare-fun c!87404 () Bool)

(assert (=> b!787248 (= c!87404 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!787249 () Bool)

(assert (=> b!787249 (= e!437576 e!437567)))

(declare-fun res!533248 () Bool)

(assert (=> b!787249 (=> (not res!533248) (not e!437567))))

(declare-fun lt!351034 () SeekEntryResult!8092)

(assert (=> b!787249 (= res!533248 (or (= lt!351034 (MissingZero!8092 i!1173)) (= lt!351034 (MissingVacant!8092 i!1173))))))

(assert (=> b!787249 (= lt!351034 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!787250 () Bool)

(assert (=> b!787250 (= e!437577 true)))

(assert (=> b!787250 e!437573))

(declare-fun res!533251 () Bool)

(assert (=> b!787250 (=> (not res!533251) (not e!437573))))

(assert (=> b!787250 (= res!533251 (= lt!351043 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!351037 () Unit!27236)

(assert (=> b!787250 (= lt!351037 e!437571)))

(declare-fun c!87405 () Bool)

(assert (=> b!787250 (= c!87405 (= lt!351043 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!787251 () Bool)

(declare-fun res!533242 () Bool)

(assert (=> b!787251 (=> (not res!533242) (not e!437576))))

(assert (=> b!787251 (= res!533242 (validKeyInArray!0 (select (arr!20495 a!3186) j!159)))))

(declare-fun b!787252 () Bool)

(declare-fun Unit!27239 () Unit!27236)

(assert (=> b!787252 (= e!437571 Unit!27239)))

(assert (=> b!787252 false))

(declare-fun b!787253 () Bool)

(declare-fun res!533245 () Bool)

(assert (=> b!787253 (=> (not res!533245) (not e!437570))))

(assert (=> b!787253 (= res!533245 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20495 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!787254 () Bool)

(declare-fun res!533258 () Bool)

(assert (=> b!787254 (=> (not res!533258) (not e!437567))))

(assert (=> b!787254 (= res!533258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!787255 () Bool)

(assert (=> b!787255 (= e!437574 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20495 a!3186) j!159) a!3186 mask!3328) lt!351039))))

(declare-fun b!787256 () Bool)

(assert (=> b!787256 (= e!437573 (= lt!351038 lt!351042))))

(assert (= (and start!67754 res!533259) b!787243))

(assert (= (and b!787243 res!533257) b!787251))

(assert (= (and b!787251 res!533242) b!787238))

(assert (= (and b!787238 res!533252) b!787242))

(assert (= (and b!787242 res!533255) b!787249))

(assert (= (and b!787249 res!533248) b!787254))

(assert (= (and b!787254 res!533258) b!787245))

(assert (= (and b!787245 res!533246) b!787237))

(assert (= (and b!787237 res!533241) b!787234))

(assert (= (and b!787234 res!533254) b!787253))

(assert (= (and b!787253 res!533245) b!787248))

(assert (= (and b!787248 c!87404) b!787255))

(assert (= (and b!787248 (not c!87404)) b!787235))

(assert (= (and b!787248 res!533256) b!787244))

(assert (= (and b!787244 res!533247) b!787247))

(assert (= (and b!787247 res!533243) b!787239))

(assert (= (and b!787247 (not res!533253)) b!787241))

(assert (= (and b!787241 (not res!533250)) b!787240))

(assert (= (and b!787240 (not res!533244)) b!787250))

(assert (= (and b!787250 c!87405) b!787252))

(assert (= (and b!787250 (not c!87405)) b!787236))

(assert (= (and b!787250 res!533251) b!787246))

(assert (= (and b!787246 res!533249) b!787256))

(declare-fun m!728295 () Bool)

(assert (=> b!787240 m!728295))

(declare-fun m!728297 () Bool)

(assert (=> b!787240 m!728297))

(declare-fun m!728299 () Bool)

(assert (=> b!787244 m!728299))

(declare-fun m!728301 () Bool)

(assert (=> b!787244 m!728301))

(assert (=> b!787244 m!728295))

(declare-fun m!728303 () Bool)

(assert (=> b!787244 m!728303))

(assert (=> b!787244 m!728299))

(declare-fun m!728305 () Bool)

(assert (=> b!787244 m!728305))

(declare-fun m!728307 () Bool)

(assert (=> b!787246 m!728307))

(declare-fun m!728309 () Bool)

(assert (=> b!787246 m!728309))

(declare-fun m!728311 () Bool)

(assert (=> b!787247 m!728311))

(assert (=> b!787247 m!728311))

(declare-fun m!728313 () Bool)

(assert (=> b!787247 m!728313))

(declare-fun m!728315 () Bool)

(assert (=> b!787247 m!728315))

(declare-fun m!728317 () Bool)

(assert (=> b!787247 m!728317))

(declare-fun m!728319 () Bool)

(assert (=> b!787242 m!728319))

(declare-fun m!728321 () Bool)

(assert (=> b!787249 m!728321))

(assert (=> b!787239 m!728311))

(assert (=> b!787239 m!728311))

(declare-fun m!728323 () Bool)

(assert (=> b!787239 m!728323))

(assert (=> b!787251 m!728311))

(assert (=> b!787251 m!728311))

(declare-fun m!728325 () Bool)

(assert (=> b!787251 m!728325))

(declare-fun m!728327 () Bool)

(assert (=> start!67754 m!728327))

(declare-fun m!728329 () Bool)

(assert (=> start!67754 m!728329))

(assert (=> b!787234 m!728311))

(assert (=> b!787234 m!728311))

(declare-fun m!728331 () Bool)

(assert (=> b!787234 m!728331))

(assert (=> b!787234 m!728331))

(assert (=> b!787234 m!728311))

(declare-fun m!728333 () Bool)

(assert (=> b!787234 m!728333))

(declare-fun m!728335 () Bool)

(assert (=> b!787254 m!728335))

(assert (=> b!787235 m!728311))

(assert (=> b!787235 m!728311))

(declare-fun m!728337 () Bool)

(assert (=> b!787235 m!728337))

(declare-fun m!728339 () Bool)

(assert (=> b!787245 m!728339))

(assert (=> b!787255 m!728311))

(assert (=> b!787255 m!728311))

(declare-fun m!728341 () Bool)

(assert (=> b!787255 m!728341))

(declare-fun m!728343 () Bool)

(assert (=> b!787238 m!728343))

(declare-fun m!728345 () Bool)

(assert (=> b!787253 m!728345))

(assert (=> b!787241 m!728311))

(assert (=> b!787241 m!728311))

(assert (=> b!787241 m!728337))

(check-sat (not b!787234) (not start!67754) (not b!787247) (not b!787246) (not b!787255) (not b!787239) (not b!787242) (not b!787251) (not b!787244) (not b!787235) (not b!787238) (not b!787254) (not b!787245) (not b!787249) (not b!787241))
(check-sat)
