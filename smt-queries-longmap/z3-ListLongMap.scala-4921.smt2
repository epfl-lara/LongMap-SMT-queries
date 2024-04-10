; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67772 () Bool)

(assert start!67772)

(declare-fun b!787346 () Bool)

(declare-fun res!533250 () Bool)

(declare-fun e!437658 () Bool)

(assert (=> b!787346 (=> (not res!533250) (not e!437658))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42812 0))(
  ( (array!42813 (arr!20494 (Array (_ BitVec 32) (_ BitVec 64))) (size!20915 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42812)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!787346 (= res!533250 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20915 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20915 a!3186))))))

(declare-fun b!787347 () Bool)

(declare-fun e!437651 () Bool)

(assert (=> b!787347 (= e!437651 e!437658)))

(declare-fun res!533241 () Bool)

(assert (=> b!787347 (=> (not res!533241) (not e!437658))))

(declare-datatypes ((SeekEntryResult!8094 0))(
  ( (MissingZero!8094 (index!34744 (_ BitVec 32))) (Found!8094 (index!34745 (_ BitVec 32))) (Intermediate!8094 (undefined!8906 Bool) (index!34746 (_ BitVec 32)) (x!65682 (_ BitVec 32))) (Undefined!8094) (MissingVacant!8094 (index!34747 (_ BitVec 32))) )
))
(declare-fun lt!351207 () SeekEntryResult!8094)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!787347 (= res!533241 (or (= lt!351207 (MissingZero!8094 i!1173)) (= lt!351207 (MissingVacant!8094 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42812 (_ BitVec 32)) SeekEntryResult!8094)

(assert (=> b!787347 (= lt!351207 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!787348 () Bool)

(declare-fun res!533237 () Bool)

(assert (=> b!787348 (=> (not res!533237) (not e!437651))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!787348 (= res!533237 (and (= (size!20915 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20915 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20915 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!787349 () Bool)

(declare-fun e!437659 () Bool)

(declare-fun e!437656 () Bool)

(assert (=> b!787349 (= e!437659 e!437656)))

(declare-fun res!533247 () Bool)

(assert (=> b!787349 (=> res!533247 e!437656)))

(declare-fun lt!351210 () (_ BitVec 64))

(declare-fun lt!351205 () (_ BitVec 64))

(assert (=> b!787349 (= res!533247 (= lt!351210 lt!351205))))

(assert (=> b!787349 (= lt!351210 (select (store (arr!20494 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!787350 () Bool)

(declare-fun e!437654 () Bool)

(declare-fun e!437649 () Bool)

(assert (=> b!787350 (= e!437654 (not e!437649))))

(declare-fun res!533242 () Bool)

(assert (=> b!787350 (=> res!533242 e!437649)))

(declare-fun lt!351211 () SeekEntryResult!8094)

(get-info :version)

(assert (=> b!787350 (= res!533242 (or (not ((_ is Intermediate!8094) lt!351211)) (bvslt x!1131 (x!65682 lt!351211)) (not (= x!1131 (x!65682 lt!351211))) (not (= index!1321 (index!34746 lt!351211)))))))

(declare-fun e!437653 () Bool)

(assert (=> b!787350 e!437653))

(declare-fun res!533246 () Bool)

(assert (=> b!787350 (=> (not res!533246) (not e!437653))))

(declare-fun lt!351206 () SeekEntryResult!8094)

(declare-fun lt!351201 () SeekEntryResult!8094)

(assert (=> b!787350 (= res!533246 (= lt!351206 lt!351201))))

(assert (=> b!787350 (= lt!351201 (Found!8094 j!159))))

(assert (=> b!787350 (= lt!351206 (seekEntryOrOpen!0 (select (arr!20494 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42812 (_ BitVec 32)) Bool)

(assert (=> b!787350 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!27264 0))(
  ( (Unit!27265) )
))
(declare-fun lt!351212 () Unit!27264)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42812 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27264)

(assert (=> b!787350 (= lt!351212 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun e!437650 () Bool)

(declare-fun b!787351 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42812 (_ BitVec 32)) SeekEntryResult!8094)

(assert (=> b!787351 (= e!437650 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20494 a!3186) j!159) a!3186 mask!3328) (Found!8094 j!159)))))

(declare-fun b!787353 () Bool)

(declare-fun res!533255 () Bool)

(declare-fun e!437652 () Bool)

(assert (=> b!787353 (=> (not res!533255) (not e!437652))))

(declare-fun lt!351202 () array!42812)

(assert (=> b!787353 (= res!533255 (= (seekEntryOrOpen!0 lt!351205 lt!351202 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351205 lt!351202 mask!3328)))))

(declare-fun b!787354 () Bool)

(declare-fun e!437660 () Bool)

(assert (=> b!787354 (= e!437658 e!437660)))

(declare-fun res!533240 () Bool)

(assert (=> b!787354 (=> (not res!533240) (not e!437660))))

(declare-fun lt!351208 () SeekEntryResult!8094)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42812 (_ BitVec 32)) SeekEntryResult!8094)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!787354 (= res!533240 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20494 a!3186) j!159) mask!3328) (select (arr!20494 a!3186) j!159) a!3186 mask!3328) lt!351208))))

(assert (=> b!787354 (= lt!351208 (Intermediate!8094 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!787355 () Bool)

(assert (=> b!787355 (= e!437656 true)))

(assert (=> b!787355 e!437652))

(declare-fun res!533238 () Bool)

(assert (=> b!787355 (=> (not res!533238) (not e!437652))))

(assert (=> b!787355 (= res!533238 (= lt!351210 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!351209 () Unit!27264)

(declare-fun e!437657 () Unit!27264)

(assert (=> b!787355 (= lt!351209 e!437657)))

(declare-fun c!87462 () Bool)

(assert (=> b!787355 (= c!87462 (= lt!351210 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!787356 () Bool)

(declare-fun res!533244 () Bool)

(assert (=> b!787356 (=> (not res!533244) (not e!437658))))

(assert (=> b!787356 (= res!533244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!787357 () Bool)

(declare-fun res!533253 () Bool)

(assert (=> b!787357 (=> (not res!533253) (not e!437651))))

(declare-fun arrayContainsKey!0 (array!42812 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!787357 (= res!533253 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!787358 () Bool)

(assert (=> b!787358 (= e!437650 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20494 a!3186) j!159) a!3186 mask!3328) lt!351208))))

(declare-fun b!787359 () Bool)

(declare-fun res!533251 () Bool)

(assert (=> b!787359 (=> (not res!533251) (not e!437651))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!787359 (= res!533251 (validKeyInArray!0 (select (arr!20494 a!3186) j!159)))))

(declare-fun b!787360 () Bool)

(declare-fun res!533239 () Bool)

(assert (=> b!787360 (=> (not res!533239) (not e!437651))))

(assert (=> b!787360 (= res!533239 (validKeyInArray!0 k0!2102))))

(declare-fun b!787361 () Bool)

(declare-fun res!533243 () Bool)

(assert (=> b!787361 (=> (not res!533243) (not e!437660))))

(assert (=> b!787361 (= res!533243 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20494 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!787362 () Bool)

(assert (=> b!787362 (= e!437660 e!437654)))

(declare-fun res!533252 () Bool)

(assert (=> b!787362 (=> (not res!533252) (not e!437654))))

(declare-fun lt!351204 () SeekEntryResult!8094)

(assert (=> b!787362 (= res!533252 (= lt!351204 lt!351211))))

(assert (=> b!787362 (= lt!351211 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351205 lt!351202 mask!3328))))

(assert (=> b!787362 (= lt!351204 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351205 mask!3328) lt!351205 lt!351202 mask!3328))))

(assert (=> b!787362 (= lt!351205 (select (store (arr!20494 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!787362 (= lt!351202 (array!42813 (store (arr!20494 a!3186) i!1173 k0!2102) (size!20915 a!3186)))))

(declare-fun b!787363 () Bool)

(declare-fun lt!351203 () SeekEntryResult!8094)

(assert (=> b!787363 (= e!437652 (= lt!351206 lt!351203))))

(declare-fun b!787364 () Bool)

(declare-fun res!533248 () Bool)

(assert (=> b!787364 (=> (not res!533248) (not e!437658))))

(declare-datatypes ((List!14496 0))(
  ( (Nil!14493) (Cons!14492 (h!15615 (_ BitVec 64)) (t!20811 List!14496)) )
))
(declare-fun arrayNoDuplicates!0 (array!42812 (_ BitVec 32) List!14496) Bool)

(assert (=> b!787364 (= res!533248 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14493))))

(declare-fun res!533245 () Bool)

(assert (=> start!67772 (=> (not res!533245) (not e!437651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67772 (= res!533245 (validMask!0 mask!3328))))

(assert (=> start!67772 e!437651))

(assert (=> start!67772 true))

(declare-fun array_inv!16290 (array!42812) Bool)

(assert (=> start!67772 (array_inv!16290 a!3186)))

(declare-fun b!787352 () Bool)

(assert (=> b!787352 (= e!437649 e!437659)))

(declare-fun res!533254 () Bool)

(assert (=> b!787352 (=> res!533254 e!437659)))

(assert (=> b!787352 (= res!533254 (not (= lt!351203 lt!351201)))))

(assert (=> b!787352 (= lt!351203 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20494 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!787365 () Bool)

(declare-fun Unit!27266 () Unit!27264)

(assert (=> b!787365 (= e!437657 Unit!27266)))

(declare-fun b!787366 () Bool)

(declare-fun res!533249 () Bool)

(assert (=> b!787366 (=> (not res!533249) (not e!437660))))

(assert (=> b!787366 (= res!533249 e!437650)))

(declare-fun c!87463 () Bool)

(assert (=> b!787366 (= c!87463 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!787367 () Bool)

(declare-fun Unit!27267 () Unit!27264)

(assert (=> b!787367 (= e!437657 Unit!27267)))

(assert (=> b!787367 false))

(declare-fun b!787368 () Bool)

(assert (=> b!787368 (= e!437653 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20494 a!3186) j!159) a!3186 mask!3328) lt!351201))))

(assert (= (and start!67772 res!533245) b!787348))

(assert (= (and b!787348 res!533237) b!787359))

(assert (= (and b!787359 res!533251) b!787360))

(assert (= (and b!787360 res!533239) b!787357))

(assert (= (and b!787357 res!533253) b!787347))

(assert (= (and b!787347 res!533241) b!787356))

(assert (= (and b!787356 res!533244) b!787364))

(assert (= (and b!787364 res!533248) b!787346))

(assert (= (and b!787346 res!533250) b!787354))

(assert (= (and b!787354 res!533240) b!787361))

(assert (= (and b!787361 res!533243) b!787366))

(assert (= (and b!787366 c!87463) b!787358))

(assert (= (and b!787366 (not c!87463)) b!787351))

(assert (= (and b!787366 res!533249) b!787362))

(assert (= (and b!787362 res!533252) b!787350))

(assert (= (and b!787350 res!533246) b!787368))

(assert (= (and b!787350 (not res!533242)) b!787352))

(assert (= (and b!787352 (not res!533254)) b!787349))

(assert (= (and b!787349 (not res!533247)) b!787355))

(assert (= (and b!787355 c!87462) b!787367))

(assert (= (and b!787355 (not c!87462)) b!787365))

(assert (= (and b!787355 res!533238) b!787353))

(assert (= (and b!787353 res!533255) b!787363))

(declare-fun m!728949 () Bool)

(assert (=> b!787354 m!728949))

(assert (=> b!787354 m!728949))

(declare-fun m!728951 () Bool)

(assert (=> b!787354 m!728951))

(assert (=> b!787354 m!728951))

(assert (=> b!787354 m!728949))

(declare-fun m!728953 () Bool)

(assert (=> b!787354 m!728953))

(declare-fun m!728955 () Bool)

(assert (=> b!787360 m!728955))

(declare-fun m!728957 () Bool)

(assert (=> b!787357 m!728957))

(declare-fun m!728959 () Bool)

(assert (=> b!787347 m!728959))

(declare-fun m!728961 () Bool)

(assert (=> b!787356 m!728961))

(assert (=> b!787368 m!728949))

(assert (=> b!787368 m!728949))

(declare-fun m!728963 () Bool)

(assert (=> b!787368 m!728963))

(assert (=> b!787358 m!728949))

(assert (=> b!787358 m!728949))

(declare-fun m!728965 () Bool)

(assert (=> b!787358 m!728965))

(declare-fun m!728967 () Bool)

(assert (=> b!787349 m!728967))

(declare-fun m!728969 () Bool)

(assert (=> b!787349 m!728969))

(assert (=> b!787352 m!728949))

(assert (=> b!787352 m!728949))

(declare-fun m!728971 () Bool)

(assert (=> b!787352 m!728971))

(assert (=> b!787351 m!728949))

(assert (=> b!787351 m!728949))

(assert (=> b!787351 m!728971))

(declare-fun m!728973 () Bool)

(assert (=> start!67772 m!728973))

(declare-fun m!728975 () Bool)

(assert (=> start!67772 m!728975))

(assert (=> b!787359 m!728949))

(assert (=> b!787359 m!728949))

(declare-fun m!728977 () Bool)

(assert (=> b!787359 m!728977))

(declare-fun m!728979 () Bool)

(assert (=> b!787353 m!728979))

(declare-fun m!728981 () Bool)

(assert (=> b!787353 m!728981))

(assert (=> b!787350 m!728949))

(assert (=> b!787350 m!728949))

(declare-fun m!728983 () Bool)

(assert (=> b!787350 m!728983))

(declare-fun m!728985 () Bool)

(assert (=> b!787350 m!728985))

(declare-fun m!728987 () Bool)

(assert (=> b!787350 m!728987))

(declare-fun m!728989 () Bool)

(assert (=> b!787361 m!728989))

(declare-fun m!728991 () Bool)

(assert (=> b!787364 m!728991))

(declare-fun m!728993 () Bool)

(assert (=> b!787362 m!728993))

(assert (=> b!787362 m!728967))

(declare-fun m!728995 () Bool)

(assert (=> b!787362 m!728995))

(declare-fun m!728997 () Bool)

(assert (=> b!787362 m!728997))

(declare-fun m!728999 () Bool)

(assert (=> b!787362 m!728999))

(assert (=> b!787362 m!728997))

(check-sat (not b!787352) (not b!787362) (not b!787351) (not b!787357) (not b!787354) (not b!787356) (not start!67772) (not b!787368) (not b!787347) (not b!787359) (not b!787353) (not b!787350) (not b!787364) (not b!787360) (not b!787358))
(check-sat)
