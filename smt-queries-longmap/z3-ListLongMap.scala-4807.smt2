; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66236 () Bool)

(assert start!66236)

(declare-fun b!762224 () Bool)

(declare-fun res!515276 () Bool)

(declare-fun e!424991 () Bool)

(assert (=> b!762224 (=> (not res!515276) (not e!424991))))

(declare-datatypes ((array!42082 0))(
  ( (array!42083 (arr!20146 (Array (_ BitVec 32) (_ BitVec 64))) (size!20566 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42082)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762224 (= res!515276 (validKeyInArray!0 (select (arr!20146 a!3186) j!159)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!762225 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!424988 () Bool)

(declare-datatypes ((SeekEntryResult!7702 0))(
  ( (MissingZero!7702 (index!33176 (_ BitVec 32))) (Found!7702 (index!33177 (_ BitVec 32))) (Intermediate!7702 (undefined!8514 Bool) (index!33178 (_ BitVec 32)) (x!64244 (_ BitVec 32))) (Undefined!7702) (MissingVacant!7702 (index!33179 (_ BitVec 32))) )
))
(declare-fun lt!339551 () SeekEntryResult!7702)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42082 (_ BitVec 32)) SeekEntryResult!7702)

(assert (=> b!762225 (= e!424988 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20146 a!3186) j!159) a!3186 mask!3328) lt!339551))))

(declare-fun b!762226 () Bool)

(declare-fun res!515274 () Bool)

(declare-fun e!424989 () Bool)

(assert (=> b!762226 (=> (not res!515274) (not e!424989))))

(declare-datatypes ((List!14055 0))(
  ( (Nil!14052) (Cons!14051 (h!15138 (_ BitVec 64)) (t!20362 List!14055)) )
))
(declare-fun arrayNoDuplicates!0 (array!42082 (_ BitVec 32) List!14055) Bool)

(assert (=> b!762226 (= res!515274 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14052))))

(declare-fun e!424993 () Bool)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun lt!339548 () (_ BitVec 64))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun b!762227 () Bool)

(declare-fun lt!339555 () SeekEntryResult!7702)

(assert (=> b!762227 (= e!424993 (or (not (= (select (store (arr!20146 a!3186) i!1173 k0!2102) index!1321) lt!339548)) (not (undefined!8514 lt!339555))))))

(declare-fun b!762228 () Bool)

(declare-fun res!515268 () Bool)

(assert (=> b!762228 (=> (not res!515268) (not e!424991))))

(declare-fun arrayContainsKey!0 (array!42082 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762228 (= res!515268 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!762229 () Bool)

(declare-fun e!424994 () Bool)

(assert (=> b!762229 (= e!424989 e!424994)))

(declare-fun res!515273 () Bool)

(assert (=> b!762229 (=> (not res!515273) (not e!424994))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!762229 (= res!515273 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20146 a!3186) j!159) mask!3328) (select (arr!20146 a!3186) j!159) a!3186 mask!3328) lt!339551))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!762229 (= lt!339551 (Intermediate!7702 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!762230 () Bool)

(declare-fun res!515271 () Bool)

(assert (=> b!762230 (=> (not res!515271) (not e!424989))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42082 (_ BitVec 32)) Bool)

(assert (=> b!762230 (= res!515271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!762231 () Bool)

(declare-fun e!424992 () Bool)

(declare-fun e!424986 () Bool)

(assert (=> b!762231 (= e!424992 e!424986)))

(declare-fun res!515269 () Bool)

(assert (=> b!762231 (=> (not res!515269) (not e!424986))))

(declare-fun lt!339553 () SeekEntryResult!7702)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42082 (_ BitVec 32)) SeekEntryResult!7702)

(assert (=> b!762231 (= res!515269 (= (seekEntryOrOpen!0 (select (arr!20146 a!3186) j!159) a!3186 mask!3328) lt!339553))))

(assert (=> b!762231 (= lt!339553 (Found!7702 j!159))))

(declare-fun b!762232 () Bool)

(declare-fun res!515278 () Bool)

(assert (=> b!762232 (=> (not res!515278) (not e!424989))))

(assert (=> b!762232 (= res!515278 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20566 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20566 a!3186))))))

(declare-fun res!515280 () Bool)

(assert (=> start!66236 (=> (not res!515280) (not e!424991))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66236 (= res!515280 (validMask!0 mask!3328))))

(assert (=> start!66236 e!424991))

(assert (=> start!66236 true))

(declare-fun array_inv!16005 (array!42082) Bool)

(assert (=> start!66236 (array_inv!16005 a!3186)))

(declare-fun b!762233 () Bool)

(assert (=> b!762233 (= e!424991 e!424989)))

(declare-fun res!515266 () Bool)

(assert (=> b!762233 (=> (not res!515266) (not e!424989))))

(declare-fun lt!339552 () SeekEntryResult!7702)

(assert (=> b!762233 (= res!515266 (or (= lt!339552 (MissingZero!7702 i!1173)) (= lt!339552 (MissingVacant!7702 i!1173))))))

(assert (=> b!762233 (= lt!339552 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!762234 () Bool)

(declare-fun res!515279 () Bool)

(assert (=> b!762234 (=> (not res!515279) (not e!424991))))

(assert (=> b!762234 (= res!515279 (and (= (size!20566 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20566 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20566 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!762235 () Bool)

(declare-fun e!424987 () Bool)

(assert (=> b!762235 (= e!424987 (not e!424993))))

(declare-fun res!515277 () Bool)

(assert (=> b!762235 (=> res!515277 e!424993)))

(get-info :version)

(assert (=> b!762235 (= res!515277 (or (not ((_ is Intermediate!7702) lt!339555)) (bvslt x!1131 (x!64244 lt!339555)) (not (= x!1131 (x!64244 lt!339555))) (not (= index!1321 (index!33178 lt!339555)))))))

(assert (=> b!762235 e!424992))

(declare-fun res!515267 () Bool)

(assert (=> b!762235 (=> (not res!515267) (not e!424992))))

(assert (=> b!762235 (= res!515267 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26323 0))(
  ( (Unit!26324) )
))
(declare-fun lt!339549 () Unit!26323)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42082 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26323)

(assert (=> b!762235 (= lt!339549 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!762236 () Bool)

(declare-fun res!515272 () Bool)

(assert (=> b!762236 (=> res!515272 e!424993)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42082 (_ BitVec 32)) SeekEntryResult!7702)

(assert (=> b!762236 (= res!515272 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20146 a!3186) j!159) a!3186 mask!3328) (Found!7702 j!159))))))

(declare-fun b!762237 () Bool)

(declare-fun res!515281 () Bool)

(assert (=> b!762237 (=> (not res!515281) (not e!424994))))

(assert (=> b!762237 (= res!515281 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20146 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!762238 () Bool)

(assert (=> b!762238 (= e!424986 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20146 a!3186) j!159) a!3186 mask!3328) lt!339553))))

(declare-fun b!762239 () Bool)

(declare-fun res!515275 () Bool)

(assert (=> b!762239 (=> (not res!515275) (not e!424994))))

(assert (=> b!762239 (= res!515275 e!424988)))

(declare-fun c!83867 () Bool)

(assert (=> b!762239 (= c!83867 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!762240 () Bool)

(assert (=> b!762240 (= e!424994 e!424987)))

(declare-fun res!515282 () Bool)

(assert (=> b!762240 (=> (not res!515282) (not e!424987))))

(declare-fun lt!339550 () SeekEntryResult!7702)

(assert (=> b!762240 (= res!515282 (= lt!339550 lt!339555))))

(declare-fun lt!339554 () array!42082)

(assert (=> b!762240 (= lt!339555 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!339548 lt!339554 mask!3328))))

(assert (=> b!762240 (= lt!339550 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!339548 mask!3328) lt!339548 lt!339554 mask!3328))))

(assert (=> b!762240 (= lt!339548 (select (store (arr!20146 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!762240 (= lt!339554 (array!42083 (store (arr!20146 a!3186) i!1173 k0!2102) (size!20566 a!3186)))))

(declare-fun b!762241 () Bool)

(assert (=> b!762241 (= e!424988 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20146 a!3186) j!159) a!3186 mask!3328) (Found!7702 j!159)))))

(declare-fun b!762242 () Bool)

(declare-fun res!515270 () Bool)

(assert (=> b!762242 (=> (not res!515270) (not e!424991))))

(assert (=> b!762242 (= res!515270 (validKeyInArray!0 k0!2102))))

(assert (= (and start!66236 res!515280) b!762234))

(assert (= (and b!762234 res!515279) b!762224))

(assert (= (and b!762224 res!515276) b!762242))

(assert (= (and b!762242 res!515270) b!762228))

(assert (= (and b!762228 res!515268) b!762233))

(assert (= (and b!762233 res!515266) b!762230))

(assert (= (and b!762230 res!515271) b!762226))

(assert (= (and b!762226 res!515274) b!762232))

(assert (= (and b!762232 res!515278) b!762229))

(assert (= (and b!762229 res!515273) b!762237))

(assert (= (and b!762237 res!515281) b!762239))

(assert (= (and b!762239 c!83867) b!762225))

(assert (= (and b!762239 (not c!83867)) b!762241))

(assert (= (and b!762239 res!515275) b!762240))

(assert (= (and b!762240 res!515282) b!762235))

(assert (= (and b!762235 res!515267) b!762231))

(assert (= (and b!762231 res!515269) b!762238))

(assert (= (and b!762235 (not res!515277)) b!762236))

(assert (= (and b!762236 (not res!515272)) b!762227))

(declare-fun m!709549 () Bool)

(assert (=> b!762241 m!709549))

(assert (=> b!762241 m!709549))

(declare-fun m!709551 () Bool)

(assert (=> b!762241 m!709551))

(assert (=> b!762229 m!709549))

(assert (=> b!762229 m!709549))

(declare-fun m!709553 () Bool)

(assert (=> b!762229 m!709553))

(assert (=> b!762229 m!709553))

(assert (=> b!762229 m!709549))

(declare-fun m!709555 () Bool)

(assert (=> b!762229 m!709555))

(declare-fun m!709557 () Bool)

(assert (=> b!762233 m!709557))

(declare-fun m!709559 () Bool)

(assert (=> b!762230 m!709559))

(declare-fun m!709561 () Bool)

(assert (=> b!762235 m!709561))

(declare-fun m!709563 () Bool)

(assert (=> b!762235 m!709563))

(assert (=> b!762224 m!709549))

(assert (=> b!762224 m!709549))

(declare-fun m!709565 () Bool)

(assert (=> b!762224 m!709565))

(declare-fun m!709567 () Bool)

(assert (=> b!762242 m!709567))

(assert (=> b!762236 m!709549))

(assert (=> b!762236 m!709549))

(assert (=> b!762236 m!709551))

(assert (=> b!762225 m!709549))

(assert (=> b!762225 m!709549))

(declare-fun m!709569 () Bool)

(assert (=> b!762225 m!709569))

(declare-fun m!709571 () Bool)

(assert (=> start!66236 m!709571))

(declare-fun m!709573 () Bool)

(assert (=> start!66236 m!709573))

(declare-fun m!709575 () Bool)

(assert (=> b!762227 m!709575))

(declare-fun m!709577 () Bool)

(assert (=> b!762227 m!709577))

(declare-fun m!709579 () Bool)

(assert (=> b!762226 m!709579))

(assert (=> b!762238 m!709549))

(assert (=> b!762238 m!709549))

(declare-fun m!709581 () Bool)

(assert (=> b!762238 m!709581))

(declare-fun m!709583 () Bool)

(assert (=> b!762237 m!709583))

(assert (=> b!762231 m!709549))

(assert (=> b!762231 m!709549))

(declare-fun m!709585 () Bool)

(assert (=> b!762231 m!709585))

(declare-fun m!709587 () Bool)

(assert (=> b!762240 m!709587))

(assert (=> b!762240 m!709575))

(declare-fun m!709589 () Bool)

(assert (=> b!762240 m!709589))

(declare-fun m!709591 () Bool)

(assert (=> b!762240 m!709591))

(declare-fun m!709593 () Bool)

(assert (=> b!762240 m!709593))

(assert (=> b!762240 m!709591))

(declare-fun m!709595 () Bool)

(assert (=> b!762228 m!709595))

(check-sat (not b!762238) (not b!762231) (not b!762235) (not b!762226) (not b!762236) (not b!762230) (not start!66236) (not b!762225) (not b!762229) (not b!762240) (not b!762228) (not b!762233) (not b!762242) (not b!762224) (not b!762241))
(check-sat)
(get-model)

(declare-fun b!762369 () Bool)

(declare-fun e!425056 () SeekEntryResult!7702)

(declare-fun e!425055 () SeekEntryResult!7702)

(assert (=> b!762369 (= e!425056 e!425055)))

(declare-fun lt!339610 () (_ BitVec 64))

(declare-fun lt!339611 () SeekEntryResult!7702)

(assert (=> b!762369 (= lt!339610 (select (arr!20146 a!3186) (index!33178 lt!339611)))))

(declare-fun c!83882 () Bool)

(assert (=> b!762369 (= c!83882 (= lt!339610 k0!2102))))

(declare-fun d!101077 () Bool)

(declare-fun lt!339612 () SeekEntryResult!7702)

(assert (=> d!101077 (and (or ((_ is Undefined!7702) lt!339612) (not ((_ is Found!7702) lt!339612)) (and (bvsge (index!33177 lt!339612) #b00000000000000000000000000000000) (bvslt (index!33177 lt!339612) (size!20566 a!3186)))) (or ((_ is Undefined!7702) lt!339612) ((_ is Found!7702) lt!339612) (not ((_ is MissingZero!7702) lt!339612)) (and (bvsge (index!33176 lt!339612) #b00000000000000000000000000000000) (bvslt (index!33176 lt!339612) (size!20566 a!3186)))) (or ((_ is Undefined!7702) lt!339612) ((_ is Found!7702) lt!339612) ((_ is MissingZero!7702) lt!339612) (not ((_ is MissingVacant!7702) lt!339612)) (and (bvsge (index!33179 lt!339612) #b00000000000000000000000000000000) (bvslt (index!33179 lt!339612) (size!20566 a!3186)))) (or ((_ is Undefined!7702) lt!339612) (ite ((_ is Found!7702) lt!339612) (= (select (arr!20146 a!3186) (index!33177 lt!339612)) k0!2102) (ite ((_ is MissingZero!7702) lt!339612) (= (select (arr!20146 a!3186) (index!33176 lt!339612)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7702) lt!339612) (= (select (arr!20146 a!3186) (index!33179 lt!339612)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101077 (= lt!339612 e!425056)))

(declare-fun c!83881 () Bool)

(assert (=> d!101077 (= c!83881 (and ((_ is Intermediate!7702) lt!339611) (undefined!8514 lt!339611)))))

(assert (=> d!101077 (= lt!339611 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!101077 (validMask!0 mask!3328)))

(assert (=> d!101077 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!339612)))

(declare-fun b!762370 () Bool)

(declare-fun e!425057 () SeekEntryResult!7702)

(assert (=> b!762370 (= e!425057 (MissingZero!7702 (index!33178 lt!339611)))))

(declare-fun b!762371 () Bool)

(assert (=> b!762371 (= e!425055 (Found!7702 (index!33178 lt!339611)))))

(declare-fun b!762372 () Bool)

(assert (=> b!762372 (= e!425057 (seekKeyOrZeroReturnVacant!0 (x!64244 lt!339611) (index!33178 lt!339611) (index!33178 lt!339611) k0!2102 a!3186 mask!3328))))

(declare-fun b!762373 () Bool)

(declare-fun c!83880 () Bool)

(assert (=> b!762373 (= c!83880 (= lt!339610 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!762373 (= e!425055 e!425057)))

(declare-fun b!762374 () Bool)

(assert (=> b!762374 (= e!425056 Undefined!7702)))

(assert (= (and d!101077 c!83881) b!762374))

(assert (= (and d!101077 (not c!83881)) b!762369))

(assert (= (and b!762369 c!83882) b!762371))

(assert (= (and b!762369 (not c!83882)) b!762373))

(assert (= (and b!762373 c!83880) b!762370))

(assert (= (and b!762373 (not c!83880)) b!762372))

(declare-fun m!709693 () Bool)

(assert (=> b!762369 m!709693))

(declare-fun m!709695 () Bool)

(assert (=> d!101077 m!709695))

(declare-fun m!709697 () Bool)

(assert (=> d!101077 m!709697))

(declare-fun m!709699 () Bool)

(assert (=> d!101077 m!709699))

(declare-fun m!709701 () Bool)

(assert (=> d!101077 m!709701))

(assert (=> d!101077 m!709697))

(assert (=> d!101077 m!709571))

(declare-fun m!709703 () Bool)

(assert (=> d!101077 m!709703))

(declare-fun m!709705 () Bool)

(assert (=> b!762372 m!709705))

(assert (=> b!762233 d!101077))

(declare-fun d!101079 () Bool)

(assert (=> d!101079 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!762242 d!101079))

(declare-fun b!762375 () Bool)

(declare-fun e!425059 () SeekEntryResult!7702)

(declare-fun e!425058 () SeekEntryResult!7702)

(assert (=> b!762375 (= e!425059 e!425058)))

(declare-fun lt!339613 () (_ BitVec 64))

(declare-fun lt!339614 () SeekEntryResult!7702)

(assert (=> b!762375 (= lt!339613 (select (arr!20146 a!3186) (index!33178 lt!339614)))))

(declare-fun c!83885 () Bool)

(assert (=> b!762375 (= c!83885 (= lt!339613 (select (arr!20146 a!3186) j!159)))))

(declare-fun d!101081 () Bool)

(declare-fun lt!339615 () SeekEntryResult!7702)

(assert (=> d!101081 (and (or ((_ is Undefined!7702) lt!339615) (not ((_ is Found!7702) lt!339615)) (and (bvsge (index!33177 lt!339615) #b00000000000000000000000000000000) (bvslt (index!33177 lt!339615) (size!20566 a!3186)))) (or ((_ is Undefined!7702) lt!339615) ((_ is Found!7702) lt!339615) (not ((_ is MissingZero!7702) lt!339615)) (and (bvsge (index!33176 lt!339615) #b00000000000000000000000000000000) (bvslt (index!33176 lt!339615) (size!20566 a!3186)))) (or ((_ is Undefined!7702) lt!339615) ((_ is Found!7702) lt!339615) ((_ is MissingZero!7702) lt!339615) (not ((_ is MissingVacant!7702) lt!339615)) (and (bvsge (index!33179 lt!339615) #b00000000000000000000000000000000) (bvslt (index!33179 lt!339615) (size!20566 a!3186)))) (or ((_ is Undefined!7702) lt!339615) (ite ((_ is Found!7702) lt!339615) (= (select (arr!20146 a!3186) (index!33177 lt!339615)) (select (arr!20146 a!3186) j!159)) (ite ((_ is MissingZero!7702) lt!339615) (= (select (arr!20146 a!3186) (index!33176 lt!339615)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7702) lt!339615) (= (select (arr!20146 a!3186) (index!33179 lt!339615)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101081 (= lt!339615 e!425059)))

(declare-fun c!83884 () Bool)

(assert (=> d!101081 (= c!83884 (and ((_ is Intermediate!7702) lt!339614) (undefined!8514 lt!339614)))))

(assert (=> d!101081 (= lt!339614 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20146 a!3186) j!159) mask!3328) (select (arr!20146 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!101081 (validMask!0 mask!3328)))

(assert (=> d!101081 (= (seekEntryOrOpen!0 (select (arr!20146 a!3186) j!159) a!3186 mask!3328) lt!339615)))

(declare-fun b!762376 () Bool)

(declare-fun e!425060 () SeekEntryResult!7702)

(assert (=> b!762376 (= e!425060 (MissingZero!7702 (index!33178 lt!339614)))))

(declare-fun b!762377 () Bool)

(assert (=> b!762377 (= e!425058 (Found!7702 (index!33178 lt!339614)))))

(declare-fun b!762378 () Bool)

(assert (=> b!762378 (= e!425060 (seekKeyOrZeroReturnVacant!0 (x!64244 lt!339614) (index!33178 lt!339614) (index!33178 lt!339614) (select (arr!20146 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!762379 () Bool)

(declare-fun c!83883 () Bool)

(assert (=> b!762379 (= c!83883 (= lt!339613 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!762379 (= e!425058 e!425060)))

(declare-fun b!762380 () Bool)

(assert (=> b!762380 (= e!425059 Undefined!7702)))

(assert (= (and d!101081 c!83884) b!762380))

(assert (= (and d!101081 (not c!83884)) b!762375))

(assert (= (and b!762375 c!83885) b!762377))

(assert (= (and b!762375 (not c!83885)) b!762379))

(assert (= (and b!762379 c!83883) b!762376))

(assert (= (and b!762379 (not c!83883)) b!762378))

(declare-fun m!709707 () Bool)

(assert (=> b!762375 m!709707))

(declare-fun m!709709 () Bool)

(assert (=> d!101081 m!709709))

(assert (=> d!101081 m!709553))

(assert (=> d!101081 m!709549))

(assert (=> d!101081 m!709555))

(declare-fun m!709711 () Bool)

(assert (=> d!101081 m!709711))

(assert (=> d!101081 m!709549))

(assert (=> d!101081 m!709553))

(assert (=> d!101081 m!709571))

(declare-fun m!709713 () Bool)

(assert (=> d!101081 m!709713))

(assert (=> b!762378 m!709549))

(declare-fun m!709715 () Bool)

(assert (=> b!762378 m!709715))

(assert (=> b!762231 d!101081))

(declare-fun d!101083 () Bool)

(declare-fun res!515389 () Bool)

(declare-fun e!425068 () Bool)

(assert (=> d!101083 (=> res!515389 e!425068)))

(assert (=> d!101083 (= res!515389 (bvsge #b00000000000000000000000000000000 (size!20566 a!3186)))))

(assert (=> d!101083 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!425068)))

(declare-fun b!762389 () Bool)

(declare-fun e!425067 () Bool)

(assert (=> b!762389 (= e!425068 e!425067)))

(declare-fun c!83888 () Bool)

(assert (=> b!762389 (= c!83888 (validKeyInArray!0 (select (arr!20146 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!762390 () Bool)

(declare-fun e!425069 () Bool)

(declare-fun call!35010 () Bool)

(assert (=> b!762390 (= e!425069 call!35010)))

(declare-fun b!762391 () Bool)

(assert (=> b!762391 (= e!425067 e!425069)))

(declare-fun lt!339623 () (_ BitVec 64))

(assert (=> b!762391 (= lt!339623 (select (arr!20146 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!339622 () Unit!26323)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42082 (_ BitVec 64) (_ BitVec 32)) Unit!26323)

(assert (=> b!762391 (= lt!339622 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!339623 #b00000000000000000000000000000000))))

(assert (=> b!762391 (arrayContainsKey!0 a!3186 lt!339623 #b00000000000000000000000000000000)))

(declare-fun lt!339624 () Unit!26323)

(assert (=> b!762391 (= lt!339624 lt!339622)))

(declare-fun res!515390 () Bool)

(assert (=> b!762391 (= res!515390 (= (seekEntryOrOpen!0 (select (arr!20146 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7702 #b00000000000000000000000000000000)))))

(assert (=> b!762391 (=> (not res!515390) (not e!425069))))

(declare-fun bm!35007 () Bool)

(assert (=> bm!35007 (= call!35010 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!762392 () Bool)

(assert (=> b!762392 (= e!425067 call!35010)))

(assert (= (and d!101083 (not res!515389)) b!762389))

(assert (= (and b!762389 c!83888) b!762391))

(assert (= (and b!762389 (not c!83888)) b!762392))

(assert (= (and b!762391 res!515390) b!762390))

(assert (= (or b!762390 b!762392) bm!35007))

(declare-fun m!709717 () Bool)

(assert (=> b!762389 m!709717))

(assert (=> b!762389 m!709717))

(declare-fun m!709719 () Bool)

(assert (=> b!762389 m!709719))

(assert (=> b!762391 m!709717))

(declare-fun m!709721 () Bool)

(assert (=> b!762391 m!709721))

(declare-fun m!709723 () Bool)

(assert (=> b!762391 m!709723))

(assert (=> b!762391 m!709717))

(declare-fun m!709725 () Bool)

(assert (=> b!762391 m!709725))

(declare-fun m!709727 () Bool)

(assert (=> bm!35007 m!709727))

(assert (=> b!762230 d!101083))

(declare-fun b!762435 () Bool)

(declare-fun e!425096 () SeekEntryResult!7702)

(assert (=> b!762435 (= e!425096 Undefined!7702)))

(declare-fun b!762436 () Bool)

(declare-fun c!83909 () Bool)

(declare-fun lt!339647 () (_ BitVec 64))

(assert (=> b!762436 (= c!83909 (= lt!339647 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!425094 () SeekEntryResult!7702)

(declare-fun e!425095 () SeekEntryResult!7702)

(assert (=> b!762436 (= e!425094 e!425095)))

(declare-fun b!762438 () Bool)

(assert (=> b!762438 (= e!425094 (Found!7702 index!1321))))

(declare-fun lt!339648 () SeekEntryResult!7702)

(declare-fun d!101087 () Bool)

(assert (=> d!101087 (and (or ((_ is Undefined!7702) lt!339648) (not ((_ is Found!7702) lt!339648)) (and (bvsge (index!33177 lt!339648) #b00000000000000000000000000000000) (bvslt (index!33177 lt!339648) (size!20566 a!3186)))) (or ((_ is Undefined!7702) lt!339648) ((_ is Found!7702) lt!339648) (not ((_ is MissingVacant!7702) lt!339648)) (not (= (index!33179 lt!339648) resIntermediateIndex!5)) (and (bvsge (index!33179 lt!339648) #b00000000000000000000000000000000) (bvslt (index!33179 lt!339648) (size!20566 a!3186)))) (or ((_ is Undefined!7702) lt!339648) (ite ((_ is Found!7702) lt!339648) (= (select (arr!20146 a!3186) (index!33177 lt!339648)) (select (arr!20146 a!3186) j!159)) (and ((_ is MissingVacant!7702) lt!339648) (= (index!33179 lt!339648) resIntermediateIndex!5) (= (select (arr!20146 a!3186) (index!33179 lt!339648)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101087 (= lt!339648 e!425096)))

(declare-fun c!83907 () Bool)

(assert (=> d!101087 (= c!83907 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101087 (= lt!339647 (select (arr!20146 a!3186) index!1321))))

(assert (=> d!101087 (validMask!0 mask!3328)))

(assert (=> d!101087 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20146 a!3186) j!159) a!3186 mask!3328) lt!339648)))

(declare-fun b!762437 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!762437 (= e!425095 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20146 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!762439 () Bool)

(assert (=> b!762439 (= e!425096 e!425094)))

(declare-fun c!83908 () Bool)

(assert (=> b!762439 (= c!83908 (= lt!339647 (select (arr!20146 a!3186) j!159)))))

(declare-fun b!762440 () Bool)

(assert (=> b!762440 (= e!425095 (MissingVacant!7702 resIntermediateIndex!5))))

(assert (= (and d!101087 c!83907) b!762435))

(assert (= (and d!101087 (not c!83907)) b!762439))

(assert (= (and b!762439 c!83908) b!762438))

(assert (= (and b!762439 (not c!83908)) b!762436))

(assert (= (and b!762436 c!83909) b!762440))

(assert (= (and b!762436 (not c!83909)) b!762437))

(declare-fun m!709755 () Bool)

(assert (=> d!101087 m!709755))

(declare-fun m!709757 () Bool)

(assert (=> d!101087 m!709757))

(declare-fun m!709759 () Bool)

(assert (=> d!101087 m!709759))

(assert (=> d!101087 m!709571))

(declare-fun m!709761 () Bool)

(assert (=> b!762437 m!709761))

(assert (=> b!762437 m!709761))

(assert (=> b!762437 m!709549))

(declare-fun m!709763 () Bool)

(assert (=> b!762437 m!709763))

(assert (=> b!762241 d!101087))

(declare-fun b!762513 () Bool)

(declare-fun e!425138 () Bool)

(declare-fun e!425139 () Bool)

(assert (=> b!762513 (= e!425138 e!425139)))

(declare-fun res!515417 () Bool)

(declare-fun lt!339668 () SeekEntryResult!7702)

(assert (=> b!762513 (= res!515417 (and ((_ is Intermediate!7702) lt!339668) (not (undefined!8514 lt!339668)) (bvslt (x!64244 lt!339668) #b01111111111111111111111111111110) (bvsge (x!64244 lt!339668) #b00000000000000000000000000000000) (bvsge (x!64244 lt!339668) x!1131)))))

(assert (=> b!762513 (=> (not res!515417) (not e!425139))))

(declare-fun b!762514 () Bool)

(assert (=> b!762514 (and (bvsge (index!33178 lt!339668) #b00000000000000000000000000000000) (bvslt (index!33178 lt!339668) (size!20566 lt!339554)))))

(declare-fun res!515418 () Bool)

(assert (=> b!762514 (= res!515418 (= (select (arr!20146 lt!339554) (index!33178 lt!339668)) lt!339548))))

(declare-fun e!425137 () Bool)

(assert (=> b!762514 (=> res!515418 e!425137)))

(assert (=> b!762514 (= e!425139 e!425137)))

(declare-fun b!762515 () Bool)

(assert (=> b!762515 (and (bvsge (index!33178 lt!339668) #b00000000000000000000000000000000) (bvslt (index!33178 lt!339668) (size!20566 lt!339554)))))

(assert (=> b!762515 (= e!425137 (= (select (arr!20146 lt!339554) (index!33178 lt!339668)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!101095 () Bool)

(assert (=> d!101095 e!425138))

(declare-fun c!83937 () Bool)

(assert (=> d!101095 (= c!83937 (and ((_ is Intermediate!7702) lt!339668) (undefined!8514 lt!339668)))))

(declare-fun e!425140 () SeekEntryResult!7702)

(assert (=> d!101095 (= lt!339668 e!425140)))

(declare-fun c!83938 () Bool)

(assert (=> d!101095 (= c!83938 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!339667 () (_ BitVec 64))

(assert (=> d!101095 (= lt!339667 (select (arr!20146 lt!339554) index!1321))))

(assert (=> d!101095 (validMask!0 mask!3328)))

(assert (=> d!101095 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!339548 lt!339554 mask!3328) lt!339668)))

(declare-fun b!762516 () Bool)

(declare-fun e!425136 () SeekEntryResult!7702)

(assert (=> b!762516 (= e!425136 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) lt!339548 lt!339554 mask!3328))))

(declare-fun b!762517 () Bool)

(assert (=> b!762517 (= e!425138 (bvsge (x!64244 lt!339668) #b01111111111111111111111111111110))))

(declare-fun b!762518 () Bool)

(assert (=> b!762518 (and (bvsge (index!33178 lt!339668) #b00000000000000000000000000000000) (bvslt (index!33178 lt!339668) (size!20566 lt!339554)))))

(declare-fun res!515416 () Bool)

(assert (=> b!762518 (= res!515416 (= (select (arr!20146 lt!339554) (index!33178 lt!339668)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!762518 (=> res!515416 e!425137)))

(declare-fun b!762519 () Bool)

(assert (=> b!762519 (= e!425140 (Intermediate!7702 true index!1321 x!1131))))

(declare-fun b!762520 () Bool)

(assert (=> b!762520 (= e!425136 (Intermediate!7702 false index!1321 x!1131))))

(declare-fun b!762521 () Bool)

(assert (=> b!762521 (= e!425140 e!425136)))

(declare-fun c!83939 () Bool)

(assert (=> b!762521 (= c!83939 (or (= lt!339667 lt!339548) (= (bvadd lt!339667 lt!339667) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!101095 c!83938) b!762519))

(assert (= (and d!101095 (not c!83938)) b!762521))

(assert (= (and b!762521 c!83939) b!762520))

(assert (= (and b!762521 (not c!83939)) b!762516))

(assert (= (and d!101095 c!83937) b!762517))

(assert (= (and d!101095 (not c!83937)) b!762513))

(assert (= (and b!762513 res!515417) b!762514))

(assert (= (and b!762514 (not res!515418)) b!762518))

(assert (= (and b!762518 (not res!515416)) b!762515))

(assert (=> b!762516 m!709761))

(assert (=> b!762516 m!709761))

(declare-fun m!709791 () Bool)

(assert (=> b!762516 m!709791))

(declare-fun m!709793 () Bool)

(assert (=> b!762515 m!709793))

(assert (=> b!762514 m!709793))

(declare-fun m!709795 () Bool)

(assert (=> d!101095 m!709795))

(assert (=> d!101095 m!709571))

(assert (=> b!762518 m!709793))

(assert (=> b!762240 d!101095))

(declare-fun b!762522 () Bool)

(declare-fun e!425143 () Bool)

(declare-fun e!425144 () Bool)

(assert (=> b!762522 (= e!425143 e!425144)))

(declare-fun res!515420 () Bool)

(declare-fun lt!339672 () SeekEntryResult!7702)

(assert (=> b!762522 (= res!515420 (and ((_ is Intermediate!7702) lt!339672) (not (undefined!8514 lt!339672)) (bvslt (x!64244 lt!339672) #b01111111111111111111111111111110) (bvsge (x!64244 lt!339672) #b00000000000000000000000000000000) (bvsge (x!64244 lt!339672) #b00000000000000000000000000000000)))))

(assert (=> b!762522 (=> (not res!515420) (not e!425144))))

(declare-fun b!762523 () Bool)

(assert (=> b!762523 (and (bvsge (index!33178 lt!339672) #b00000000000000000000000000000000) (bvslt (index!33178 lt!339672) (size!20566 lt!339554)))))

(declare-fun res!515421 () Bool)

(assert (=> b!762523 (= res!515421 (= (select (arr!20146 lt!339554) (index!33178 lt!339672)) lt!339548))))

(declare-fun e!425142 () Bool)

(assert (=> b!762523 (=> res!515421 e!425142)))

(assert (=> b!762523 (= e!425144 e!425142)))

(declare-fun b!762524 () Bool)

(assert (=> b!762524 (and (bvsge (index!33178 lt!339672) #b00000000000000000000000000000000) (bvslt (index!33178 lt!339672) (size!20566 lt!339554)))))

(assert (=> b!762524 (= e!425142 (= (select (arr!20146 lt!339554) (index!33178 lt!339672)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!101103 () Bool)

(assert (=> d!101103 e!425143))

(declare-fun c!83940 () Bool)

(assert (=> d!101103 (= c!83940 (and ((_ is Intermediate!7702) lt!339672) (undefined!8514 lt!339672)))))

(declare-fun e!425145 () SeekEntryResult!7702)

(assert (=> d!101103 (= lt!339672 e!425145)))

(declare-fun c!83941 () Bool)

(assert (=> d!101103 (= c!83941 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!339669 () (_ BitVec 64))

(assert (=> d!101103 (= lt!339669 (select (arr!20146 lt!339554) (toIndex!0 lt!339548 mask!3328)))))

(assert (=> d!101103 (validMask!0 mask!3328)))

(assert (=> d!101103 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!339548 mask!3328) lt!339548 lt!339554 mask!3328) lt!339672)))

(declare-fun e!425141 () SeekEntryResult!7702)

(declare-fun b!762525 () Bool)

(assert (=> b!762525 (= e!425141 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!339548 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) lt!339548 lt!339554 mask!3328))))

(declare-fun b!762526 () Bool)

(assert (=> b!762526 (= e!425143 (bvsge (x!64244 lt!339672) #b01111111111111111111111111111110))))

(declare-fun b!762527 () Bool)

(assert (=> b!762527 (and (bvsge (index!33178 lt!339672) #b00000000000000000000000000000000) (bvslt (index!33178 lt!339672) (size!20566 lt!339554)))))

(declare-fun res!515419 () Bool)

(assert (=> b!762527 (= res!515419 (= (select (arr!20146 lt!339554) (index!33178 lt!339672)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!762527 (=> res!515419 e!425142)))

(declare-fun b!762528 () Bool)

(assert (=> b!762528 (= e!425145 (Intermediate!7702 true (toIndex!0 lt!339548 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!762529 () Bool)

(assert (=> b!762529 (= e!425141 (Intermediate!7702 false (toIndex!0 lt!339548 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!762530 () Bool)

(assert (=> b!762530 (= e!425145 e!425141)))

(declare-fun c!83942 () Bool)

(assert (=> b!762530 (= c!83942 (or (= lt!339669 lt!339548) (= (bvadd lt!339669 lt!339669) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!101103 c!83941) b!762528))

(assert (= (and d!101103 (not c!83941)) b!762530))

(assert (= (and b!762530 c!83942) b!762529))

(assert (= (and b!762530 (not c!83942)) b!762525))

(assert (= (and d!101103 c!83940) b!762526))

(assert (= (and d!101103 (not c!83940)) b!762522))

(assert (= (and b!762522 res!515420) b!762523))

(assert (= (and b!762523 (not res!515421)) b!762527))

(assert (= (and b!762527 (not res!515419)) b!762524))

(assert (=> b!762525 m!709591))

(declare-fun m!709797 () Bool)

(assert (=> b!762525 m!709797))

(assert (=> b!762525 m!709797))

(declare-fun m!709799 () Bool)

(assert (=> b!762525 m!709799))

(declare-fun m!709801 () Bool)

(assert (=> b!762524 m!709801))

(assert (=> b!762523 m!709801))

(assert (=> d!101103 m!709591))

(declare-fun m!709803 () Bool)

(assert (=> d!101103 m!709803))

(assert (=> d!101103 m!709571))

(assert (=> b!762527 m!709801))

(assert (=> b!762240 d!101103))

(declare-fun d!101105 () Bool)

(declare-fun lt!339682 () (_ BitVec 32))

(declare-fun lt!339681 () (_ BitVec 32))

(assert (=> d!101105 (= lt!339682 (bvmul (bvxor lt!339681 (bvlshr lt!339681 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101105 (= lt!339681 ((_ extract 31 0) (bvand (bvxor lt!339548 (bvlshr lt!339548 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101105 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!515422 (let ((h!15142 ((_ extract 31 0) (bvand (bvxor lt!339548 (bvlshr lt!339548 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64252 (bvmul (bvxor h!15142 (bvlshr h!15142 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64252 (bvlshr x!64252 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!515422 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!515422 #b00000000000000000000000000000000))))))

(assert (=> d!101105 (= (toIndex!0 lt!339548 mask!3328) (bvand (bvxor lt!339682 (bvlshr lt!339682 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!762240 d!101105))

(declare-fun b!762531 () Bool)

(declare-fun e!425148 () Bool)

(declare-fun e!425149 () Bool)

(assert (=> b!762531 (= e!425148 e!425149)))

(declare-fun res!515424 () Bool)

(declare-fun lt!339684 () SeekEntryResult!7702)

(assert (=> b!762531 (= res!515424 (and ((_ is Intermediate!7702) lt!339684) (not (undefined!8514 lt!339684)) (bvslt (x!64244 lt!339684) #b01111111111111111111111111111110) (bvsge (x!64244 lt!339684) #b00000000000000000000000000000000) (bvsge (x!64244 lt!339684) #b00000000000000000000000000000000)))))

(assert (=> b!762531 (=> (not res!515424) (not e!425149))))

(declare-fun b!762532 () Bool)

(assert (=> b!762532 (and (bvsge (index!33178 lt!339684) #b00000000000000000000000000000000) (bvslt (index!33178 lt!339684) (size!20566 a!3186)))))

(declare-fun res!515425 () Bool)

(assert (=> b!762532 (= res!515425 (= (select (arr!20146 a!3186) (index!33178 lt!339684)) (select (arr!20146 a!3186) j!159)))))

(declare-fun e!425147 () Bool)

(assert (=> b!762532 (=> res!515425 e!425147)))

(assert (=> b!762532 (= e!425149 e!425147)))

(declare-fun b!762533 () Bool)

(assert (=> b!762533 (and (bvsge (index!33178 lt!339684) #b00000000000000000000000000000000) (bvslt (index!33178 lt!339684) (size!20566 a!3186)))))

(assert (=> b!762533 (= e!425147 (= (select (arr!20146 a!3186) (index!33178 lt!339684)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!101111 () Bool)

(assert (=> d!101111 e!425148))

(declare-fun c!83943 () Bool)

(assert (=> d!101111 (= c!83943 (and ((_ is Intermediate!7702) lt!339684) (undefined!8514 lt!339684)))))

(declare-fun e!425150 () SeekEntryResult!7702)

(assert (=> d!101111 (= lt!339684 e!425150)))

(declare-fun c!83944 () Bool)

(assert (=> d!101111 (= c!83944 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!339683 () (_ BitVec 64))

(assert (=> d!101111 (= lt!339683 (select (arr!20146 a!3186) (toIndex!0 (select (arr!20146 a!3186) j!159) mask!3328)))))

(assert (=> d!101111 (validMask!0 mask!3328)))

(assert (=> d!101111 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20146 a!3186) j!159) mask!3328) (select (arr!20146 a!3186) j!159) a!3186 mask!3328) lt!339684)))

(declare-fun b!762534 () Bool)

(declare-fun e!425146 () SeekEntryResult!7702)

(assert (=> b!762534 (= e!425146 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20146 a!3186) j!159) mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) (select (arr!20146 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!762535 () Bool)

(assert (=> b!762535 (= e!425148 (bvsge (x!64244 lt!339684) #b01111111111111111111111111111110))))

(declare-fun b!762536 () Bool)

(assert (=> b!762536 (and (bvsge (index!33178 lt!339684) #b00000000000000000000000000000000) (bvslt (index!33178 lt!339684) (size!20566 a!3186)))))

(declare-fun res!515423 () Bool)

(assert (=> b!762536 (= res!515423 (= (select (arr!20146 a!3186) (index!33178 lt!339684)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!762536 (=> res!515423 e!425147)))

(declare-fun b!762537 () Bool)

(assert (=> b!762537 (= e!425150 (Intermediate!7702 true (toIndex!0 (select (arr!20146 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!762538 () Bool)

(assert (=> b!762538 (= e!425146 (Intermediate!7702 false (toIndex!0 (select (arr!20146 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!762539 () Bool)

(assert (=> b!762539 (= e!425150 e!425146)))

(declare-fun c!83945 () Bool)

(assert (=> b!762539 (= c!83945 (or (= lt!339683 (select (arr!20146 a!3186) j!159)) (= (bvadd lt!339683 lt!339683) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!101111 c!83944) b!762537))

(assert (= (and d!101111 (not c!83944)) b!762539))

(assert (= (and b!762539 c!83945) b!762538))

(assert (= (and b!762539 (not c!83945)) b!762534))

(assert (= (and d!101111 c!83943) b!762535))

(assert (= (and d!101111 (not c!83943)) b!762531))

(assert (= (and b!762531 res!515424) b!762532))

(assert (= (and b!762532 (not res!515425)) b!762536))

(assert (= (and b!762536 (not res!515423)) b!762533))

(assert (=> b!762534 m!709553))

(declare-fun m!709805 () Bool)

(assert (=> b!762534 m!709805))

(assert (=> b!762534 m!709805))

(assert (=> b!762534 m!709549))

(declare-fun m!709807 () Bool)

(assert (=> b!762534 m!709807))

(declare-fun m!709809 () Bool)

(assert (=> b!762533 m!709809))

(assert (=> b!762532 m!709809))

(assert (=> d!101111 m!709553))

(declare-fun m!709811 () Bool)

(assert (=> d!101111 m!709811))

(assert (=> d!101111 m!709571))

(assert (=> b!762536 m!709809))

(assert (=> b!762229 d!101111))

(declare-fun d!101117 () Bool)

(declare-fun lt!339686 () (_ BitVec 32))

(declare-fun lt!339685 () (_ BitVec 32))

(assert (=> d!101117 (= lt!339686 (bvmul (bvxor lt!339685 (bvlshr lt!339685 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101117 (= lt!339685 ((_ extract 31 0) (bvand (bvxor (select (arr!20146 a!3186) j!159) (bvlshr (select (arr!20146 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101117 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!515422 (let ((h!15142 ((_ extract 31 0) (bvand (bvxor (select (arr!20146 a!3186) j!159) (bvlshr (select (arr!20146 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64252 (bvmul (bvxor h!15142 (bvlshr h!15142 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64252 (bvlshr x!64252 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!515422 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!515422 #b00000000000000000000000000000000))))))

(assert (=> d!101117 (= (toIndex!0 (select (arr!20146 a!3186) j!159) mask!3328) (bvand (bvxor lt!339686 (bvlshr lt!339686 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!762229 d!101117))

(declare-fun d!101119 () Bool)

(assert (=> d!101119 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!66236 d!101119))

(declare-fun d!101121 () Bool)

(assert (=> d!101121 (= (array_inv!16005 a!3186) (bvsge (size!20566 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!66236 d!101121))

(declare-fun d!101125 () Bool)

(declare-fun res!515430 () Bool)

(declare-fun e!425164 () Bool)

(assert (=> d!101125 (=> res!515430 e!425164)))

(assert (=> d!101125 (= res!515430 (= (select (arr!20146 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!101125 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!425164)))

(declare-fun b!762562 () Bool)

(declare-fun e!425165 () Bool)

(assert (=> b!762562 (= e!425164 e!425165)))

(declare-fun res!515431 () Bool)

(assert (=> b!762562 (=> (not res!515431) (not e!425165))))

(assert (=> b!762562 (= res!515431 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20566 a!3186)))))

(declare-fun b!762563 () Bool)

(assert (=> b!762563 (= e!425165 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!101125 (not res!515430)) b!762562))

(assert (= (and b!762562 res!515431) b!762563))

(assert (=> d!101125 m!709717))

(declare-fun m!709821 () Bool)

(assert (=> b!762563 m!709821))

(assert (=> b!762228 d!101125))

(declare-fun b!762564 () Bool)

(declare-fun e!425168 () SeekEntryResult!7702)

(assert (=> b!762564 (= e!425168 Undefined!7702)))

(declare-fun b!762565 () Bool)

(declare-fun c!83957 () Bool)

(declare-fun lt!339693 () (_ BitVec 64))

(assert (=> b!762565 (= c!83957 (= lt!339693 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!425166 () SeekEntryResult!7702)

(declare-fun e!425167 () SeekEntryResult!7702)

(assert (=> b!762565 (= e!425166 e!425167)))

(declare-fun b!762567 () Bool)

(assert (=> b!762567 (= e!425166 (Found!7702 resIntermediateIndex!5))))

(declare-fun d!101129 () Bool)

(declare-fun lt!339694 () SeekEntryResult!7702)

(assert (=> d!101129 (and (or ((_ is Undefined!7702) lt!339694) (not ((_ is Found!7702) lt!339694)) (and (bvsge (index!33177 lt!339694) #b00000000000000000000000000000000) (bvslt (index!33177 lt!339694) (size!20566 a!3186)))) (or ((_ is Undefined!7702) lt!339694) ((_ is Found!7702) lt!339694) (not ((_ is MissingVacant!7702) lt!339694)) (not (= (index!33179 lt!339694) resIntermediateIndex!5)) (and (bvsge (index!33179 lt!339694) #b00000000000000000000000000000000) (bvslt (index!33179 lt!339694) (size!20566 a!3186)))) (or ((_ is Undefined!7702) lt!339694) (ite ((_ is Found!7702) lt!339694) (= (select (arr!20146 a!3186) (index!33177 lt!339694)) (select (arr!20146 a!3186) j!159)) (and ((_ is MissingVacant!7702) lt!339694) (= (index!33179 lt!339694) resIntermediateIndex!5) (= (select (arr!20146 a!3186) (index!33179 lt!339694)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101129 (= lt!339694 e!425168)))

(declare-fun c!83955 () Bool)

(assert (=> d!101129 (= c!83955 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!101129 (= lt!339693 (select (arr!20146 a!3186) resIntermediateIndex!5))))

(assert (=> d!101129 (validMask!0 mask!3328)))

(assert (=> d!101129 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20146 a!3186) j!159) a!3186 mask!3328) lt!339694)))

(declare-fun b!762566 () Bool)

(assert (=> b!762566 (= e!425167 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20146 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!762568 () Bool)

(assert (=> b!762568 (= e!425168 e!425166)))

(declare-fun c!83956 () Bool)

(assert (=> b!762568 (= c!83956 (= lt!339693 (select (arr!20146 a!3186) j!159)))))

(declare-fun b!762569 () Bool)

(assert (=> b!762569 (= e!425167 (MissingVacant!7702 resIntermediateIndex!5))))

(assert (= (and d!101129 c!83955) b!762564))

(assert (= (and d!101129 (not c!83955)) b!762568))

(assert (= (and b!762568 c!83956) b!762567))

(assert (= (and b!762568 (not c!83956)) b!762565))

(assert (= (and b!762565 c!83957) b!762569))

(assert (= (and b!762565 (not c!83957)) b!762566))

(declare-fun m!709823 () Bool)

(assert (=> d!101129 m!709823))

(declare-fun m!709825 () Bool)

(assert (=> d!101129 m!709825))

(assert (=> d!101129 m!709583))

(assert (=> d!101129 m!709571))

(declare-fun m!709827 () Bool)

(assert (=> b!762566 m!709827))

(assert (=> b!762566 m!709827))

(assert (=> b!762566 m!709549))

(declare-fun m!709829 () Bool)

(assert (=> b!762566 m!709829))

(assert (=> b!762238 d!101129))

(declare-fun bm!35016 () Bool)

(declare-fun call!35019 () Bool)

(declare-fun c!83972 () Bool)

(assert (=> bm!35016 (= call!35019 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!83972 (Cons!14051 (select (arr!20146 a!3186) #b00000000000000000000000000000000) Nil!14052) Nil!14052)))))

(declare-fun b!762613 () Bool)

(declare-fun e!425200 () Bool)

(assert (=> b!762613 (= e!425200 call!35019)))

(declare-fun b!762614 () Bool)

(declare-fun e!425201 () Bool)

(assert (=> b!762614 (= e!425201 e!425200)))

(assert (=> b!762614 (= c!83972 (validKeyInArray!0 (select (arr!20146 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!101131 () Bool)

(declare-fun res!515449 () Bool)

(declare-fun e!425199 () Bool)

(assert (=> d!101131 (=> res!515449 e!425199)))

(assert (=> d!101131 (= res!515449 (bvsge #b00000000000000000000000000000000 (size!20566 a!3186)))))

(assert (=> d!101131 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14052) e!425199)))

(declare-fun b!762615 () Bool)

(declare-fun e!425198 () Bool)

(declare-fun contains!4052 (List!14055 (_ BitVec 64)) Bool)

(assert (=> b!762615 (= e!425198 (contains!4052 Nil!14052 (select (arr!20146 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!762616 () Bool)

(assert (=> b!762616 (= e!425200 call!35019)))

(declare-fun b!762617 () Bool)

(assert (=> b!762617 (= e!425199 e!425201)))

(declare-fun res!515447 () Bool)

(assert (=> b!762617 (=> (not res!515447) (not e!425201))))

(assert (=> b!762617 (= res!515447 (not e!425198))))

(declare-fun res!515448 () Bool)

(assert (=> b!762617 (=> (not res!515448) (not e!425198))))

(assert (=> b!762617 (= res!515448 (validKeyInArray!0 (select (arr!20146 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!101131 (not res!515449)) b!762617))

(assert (= (and b!762617 res!515448) b!762615))

(assert (= (and b!762617 res!515447) b!762614))

(assert (= (and b!762614 c!83972) b!762613))

(assert (= (and b!762614 (not c!83972)) b!762616))

(assert (= (or b!762613 b!762616) bm!35016))

(assert (=> bm!35016 m!709717))

(declare-fun m!709851 () Bool)

(assert (=> bm!35016 m!709851))

(assert (=> b!762614 m!709717))

(assert (=> b!762614 m!709717))

(assert (=> b!762614 m!709719))

(assert (=> b!762615 m!709717))

(assert (=> b!762615 m!709717))

(declare-fun m!709857 () Bool)

(assert (=> b!762615 m!709857))

(assert (=> b!762617 m!709717))

(assert (=> b!762617 m!709717))

(assert (=> b!762617 m!709719))

(assert (=> b!762226 d!101131))

(assert (=> b!762236 d!101087))

(declare-fun b!762622 () Bool)

(declare-fun e!425207 () Bool)

(declare-fun e!425208 () Bool)

(assert (=> b!762622 (= e!425207 e!425208)))

(declare-fun res!515453 () Bool)

(declare-fun lt!339708 () SeekEntryResult!7702)

(assert (=> b!762622 (= res!515453 (and ((_ is Intermediate!7702) lt!339708) (not (undefined!8514 lt!339708)) (bvslt (x!64244 lt!339708) #b01111111111111111111111111111110) (bvsge (x!64244 lt!339708) #b00000000000000000000000000000000) (bvsge (x!64244 lt!339708) x!1131)))))

(assert (=> b!762622 (=> (not res!515453) (not e!425208))))

(declare-fun b!762623 () Bool)

(assert (=> b!762623 (and (bvsge (index!33178 lt!339708) #b00000000000000000000000000000000) (bvslt (index!33178 lt!339708) (size!20566 a!3186)))))

(declare-fun res!515454 () Bool)

(assert (=> b!762623 (= res!515454 (= (select (arr!20146 a!3186) (index!33178 lt!339708)) (select (arr!20146 a!3186) j!159)))))

(declare-fun e!425206 () Bool)

(assert (=> b!762623 (=> res!515454 e!425206)))

(assert (=> b!762623 (= e!425208 e!425206)))

(declare-fun b!762624 () Bool)

(assert (=> b!762624 (and (bvsge (index!33178 lt!339708) #b00000000000000000000000000000000) (bvslt (index!33178 lt!339708) (size!20566 a!3186)))))

(assert (=> b!762624 (= e!425206 (= (select (arr!20146 a!3186) (index!33178 lt!339708)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!101139 () Bool)

(assert (=> d!101139 e!425207))

(declare-fun c!83974 () Bool)

(assert (=> d!101139 (= c!83974 (and ((_ is Intermediate!7702) lt!339708) (undefined!8514 lt!339708)))))

(declare-fun e!425209 () SeekEntryResult!7702)

(assert (=> d!101139 (= lt!339708 e!425209)))

(declare-fun c!83975 () Bool)

(assert (=> d!101139 (= c!83975 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!339707 () (_ BitVec 64))

(assert (=> d!101139 (= lt!339707 (select (arr!20146 a!3186) index!1321))))

(assert (=> d!101139 (validMask!0 mask!3328)))

(assert (=> d!101139 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20146 a!3186) j!159) a!3186 mask!3328) lt!339708)))

(declare-fun b!762625 () Bool)

(declare-fun e!425205 () SeekEntryResult!7702)

(assert (=> b!762625 (= e!425205 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) (select (arr!20146 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!762626 () Bool)

(assert (=> b!762626 (= e!425207 (bvsge (x!64244 lt!339708) #b01111111111111111111111111111110))))

(declare-fun b!762627 () Bool)

(assert (=> b!762627 (and (bvsge (index!33178 lt!339708) #b00000000000000000000000000000000) (bvslt (index!33178 lt!339708) (size!20566 a!3186)))))

(declare-fun res!515452 () Bool)

(assert (=> b!762627 (= res!515452 (= (select (arr!20146 a!3186) (index!33178 lt!339708)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!762627 (=> res!515452 e!425206)))

(declare-fun b!762628 () Bool)

(assert (=> b!762628 (= e!425209 (Intermediate!7702 true index!1321 x!1131))))

(declare-fun b!762629 () Bool)

(assert (=> b!762629 (= e!425205 (Intermediate!7702 false index!1321 x!1131))))

(declare-fun b!762630 () Bool)

(assert (=> b!762630 (= e!425209 e!425205)))

(declare-fun c!83976 () Bool)

(assert (=> b!762630 (= c!83976 (or (= lt!339707 (select (arr!20146 a!3186) j!159)) (= (bvadd lt!339707 lt!339707) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!101139 c!83975) b!762628))

(assert (= (and d!101139 (not c!83975)) b!762630))

(assert (= (and b!762630 c!83976) b!762629))

(assert (= (and b!762630 (not c!83976)) b!762625))

(assert (= (and d!101139 c!83974) b!762626))

(assert (= (and d!101139 (not c!83974)) b!762622))

(assert (= (and b!762622 res!515453) b!762623))

(assert (= (and b!762623 (not res!515454)) b!762627))

(assert (= (and b!762627 (not res!515452)) b!762624))

(assert (=> b!762625 m!709761))

(assert (=> b!762625 m!709761))

(assert (=> b!762625 m!709549))

(declare-fun m!709859 () Bool)

(assert (=> b!762625 m!709859))

(declare-fun m!709861 () Bool)

(assert (=> b!762624 m!709861))

(assert (=> b!762623 m!709861))

(assert (=> d!101139 m!709759))

(assert (=> d!101139 m!709571))

(assert (=> b!762627 m!709861))

(assert (=> b!762225 d!101139))

(declare-fun d!101141 () Bool)

(assert (=> d!101141 (= (validKeyInArray!0 (select (arr!20146 a!3186) j!159)) (and (not (= (select (arr!20146 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20146 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!762224 d!101141))

(declare-fun d!101143 () Bool)

(declare-fun res!515455 () Bool)

(declare-fun e!425211 () Bool)

(assert (=> d!101143 (=> res!515455 e!425211)))

(assert (=> d!101143 (= res!515455 (bvsge j!159 (size!20566 a!3186)))))

(assert (=> d!101143 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!425211)))

(declare-fun b!762631 () Bool)

(declare-fun e!425210 () Bool)

(assert (=> b!762631 (= e!425211 e!425210)))

(declare-fun c!83977 () Bool)

(assert (=> b!762631 (= c!83977 (validKeyInArray!0 (select (arr!20146 a!3186) j!159)))))

(declare-fun b!762632 () Bool)

(declare-fun e!425212 () Bool)

(declare-fun call!35021 () Bool)

(assert (=> b!762632 (= e!425212 call!35021)))

(declare-fun b!762633 () Bool)

(assert (=> b!762633 (= e!425210 e!425212)))

(declare-fun lt!339710 () (_ BitVec 64))

(assert (=> b!762633 (= lt!339710 (select (arr!20146 a!3186) j!159))))

(declare-fun lt!339709 () Unit!26323)

(assert (=> b!762633 (= lt!339709 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!339710 j!159))))

(assert (=> b!762633 (arrayContainsKey!0 a!3186 lt!339710 #b00000000000000000000000000000000)))

(declare-fun lt!339711 () Unit!26323)

(assert (=> b!762633 (= lt!339711 lt!339709)))

(declare-fun res!515456 () Bool)

(assert (=> b!762633 (= res!515456 (= (seekEntryOrOpen!0 (select (arr!20146 a!3186) j!159) a!3186 mask!3328) (Found!7702 j!159)))))

(assert (=> b!762633 (=> (not res!515456) (not e!425212))))

(declare-fun bm!35018 () Bool)

(assert (=> bm!35018 (= call!35021 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!762634 () Bool)

(assert (=> b!762634 (= e!425210 call!35021)))

(assert (= (and d!101143 (not res!515455)) b!762631))

(assert (= (and b!762631 c!83977) b!762633))

(assert (= (and b!762631 (not c!83977)) b!762634))

(assert (= (and b!762633 res!515456) b!762632))

(assert (= (or b!762632 b!762634) bm!35018))

(assert (=> b!762631 m!709549))

(assert (=> b!762631 m!709549))

(assert (=> b!762631 m!709565))

(assert (=> b!762633 m!709549))

(declare-fun m!709863 () Bool)

(assert (=> b!762633 m!709863))

(declare-fun m!709865 () Bool)

(assert (=> b!762633 m!709865))

(assert (=> b!762633 m!709549))

(assert (=> b!762633 m!709585))

(declare-fun m!709867 () Bool)

(assert (=> bm!35018 m!709867))

(assert (=> b!762235 d!101143))

(declare-fun d!101145 () Bool)

(assert (=> d!101145 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!339719 () Unit!26323)

(declare-fun choose!38 (array!42082 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26323)

(assert (=> d!101145 (= lt!339719 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!101145 (validMask!0 mask!3328)))

(assert (=> d!101145 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!339719)))

(declare-fun bs!21427 () Bool)

(assert (= bs!21427 d!101145))

(assert (=> bs!21427 m!709561))

(declare-fun m!709879 () Bool)

(assert (=> bs!21427 m!709879))

(assert (=> bs!21427 m!709571))

(assert (=> b!762235 d!101145))

(check-sat (not bm!35018) (not b!762437) (not bm!35007) (not d!101139) (not d!101087) (not bm!35016) (not d!101103) (not d!101129) (not b!762378) (not d!101111) (not b!762625) (not b!762614) (not b!762391) (not b!762617) (not d!101081) (not b!762372) (not b!762525) (not b!762615) (not b!762516) (not d!101145) (not b!762563) (not d!101077) (not b!762389) (not b!762566) (not d!101095) (not b!762633) (not b!762631) (not b!762534))
(check-sat)
