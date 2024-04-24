; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64824 () Bool)

(assert start!64824)

(declare-fun b!730295 () Bool)

(declare-fun e!408796 () Bool)

(declare-fun e!408797 () Bool)

(assert (=> b!730295 (= e!408796 e!408797)))

(declare-fun res!490260 () Bool)

(assert (=> b!730295 (=> (not res!490260) (not e!408797))))

(declare-datatypes ((SeekEntryResult!7243 0))(
  ( (MissingZero!7243 (index!31340 (_ BitVec 32))) (Found!7243 (index!31341 (_ BitVec 32))) (Intermediate!7243 (undefined!8055 Bool) (index!31342 (_ BitVec 32)) (x!62485 (_ BitVec 32))) (Undefined!7243) (MissingVacant!7243 (index!31343 (_ BitVec 32))) )
))
(declare-fun lt!323537 () SeekEntryResult!7243)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!730295 (= res!490260 (or (= lt!323537 (MissingZero!7243 i!1173)) (= lt!323537 (MissingVacant!7243 i!1173))))))

(declare-datatypes ((array!41143 0))(
  ( (array!41144 (arr!19687 (Array (_ BitVec 32) (_ BitVec 64))) (size!20107 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41143)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41143 (_ BitVec 32)) SeekEntryResult!7243)

(assert (=> b!730295 (= lt!323537 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!730296 () Bool)

(declare-fun e!408804 () Bool)

(declare-fun e!408798 () Bool)

(assert (=> b!730296 (= e!408804 (not e!408798))))

(declare-fun res!490258 () Bool)

(assert (=> b!730296 (=> res!490258 e!408798)))

(declare-fun lt!323532 () SeekEntryResult!7243)

(declare-fun x!1131 () (_ BitVec 32))

(get-info :version)

(assert (=> b!730296 (= res!490258 (or (not ((_ is Intermediate!7243) lt!323532)) (bvsge x!1131 (x!62485 lt!323532))))))

(declare-fun e!408801 () Bool)

(assert (=> b!730296 e!408801))

(declare-fun res!490255 () Bool)

(assert (=> b!730296 (=> (not res!490255) (not e!408801))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41143 (_ BitVec 32)) Bool)

(assert (=> b!730296 (= res!490255 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24883 0))(
  ( (Unit!24884) )
))
(declare-fun lt!323534 () Unit!24883)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41143 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24883)

(assert (=> b!730296 (= lt!323534 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!730297 () Bool)

(declare-fun e!408802 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun lt!323536 () SeekEntryResult!7243)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41143 (_ BitVec 32)) SeekEntryResult!7243)

(assert (=> b!730297 (= e!408802 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19687 a!3186) j!159) a!3186 mask!3328) lt!323536))))

(declare-fun b!730298 () Bool)

(declare-fun res!490259 () Bool)

(assert (=> b!730298 (=> (not res!490259) (not e!408796))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!730298 (= res!490259 (validKeyInArray!0 (select (arr!19687 a!3186) j!159)))))

(declare-fun b!730299 () Bool)

(declare-fun res!490248 () Bool)

(assert (=> b!730299 (=> (not res!490248) (not e!408796))))

(assert (=> b!730299 (= res!490248 (and (= (size!20107 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20107 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20107 a!3186)) (not (= i!1173 j!159))))))

(declare-fun e!408799 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!730300 () Bool)

(assert (=> b!730300 (= e!408799 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19687 a!3186) j!159) a!3186 mask!3328) (Found!7243 j!159)))))

(declare-fun b!730301 () Bool)

(assert (=> b!730301 (= e!408801 e!408802)))

(declare-fun res!490261 () Bool)

(assert (=> b!730301 (=> (not res!490261) (not e!408802))))

(assert (=> b!730301 (= res!490261 (= (seekEntryOrOpen!0 (select (arr!19687 a!3186) j!159) a!3186 mask!3328) lt!323536))))

(assert (=> b!730301 (= lt!323536 (Found!7243 j!159))))

(declare-fun res!490247 () Bool)

(assert (=> start!64824 (=> (not res!490247) (not e!408796))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64824 (= res!490247 (validMask!0 mask!3328))))

(assert (=> start!64824 e!408796))

(assert (=> start!64824 true))

(declare-fun array_inv!15546 (array!41143) Bool)

(assert (=> start!64824 (array_inv!15546 a!3186)))

(declare-fun b!730302 () Bool)

(declare-fun res!490249 () Bool)

(assert (=> b!730302 (=> (not res!490249) (not e!408797))))

(assert (=> b!730302 (= res!490249 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20107 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20107 a!3186))))))

(declare-fun b!730303 () Bool)

(declare-fun res!490253 () Bool)

(declare-fun e!408803 () Bool)

(assert (=> b!730303 (=> (not res!490253) (not e!408803))))

(assert (=> b!730303 (= res!490253 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19687 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!730304 () Bool)

(declare-fun res!490251 () Bool)

(assert (=> b!730304 (=> (not res!490251) (not e!408797))))

(declare-datatypes ((List!13596 0))(
  ( (Nil!13593) (Cons!13592 (h!14658 (_ BitVec 64)) (t!19903 List!13596)) )
))
(declare-fun arrayNoDuplicates!0 (array!41143 (_ BitVec 32) List!13596) Bool)

(assert (=> b!730304 (= res!490251 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13593))))

(declare-fun b!730305 () Bool)

(assert (=> b!730305 (= e!408797 e!408803)))

(declare-fun res!490246 () Bool)

(assert (=> b!730305 (=> (not res!490246) (not e!408803))))

(declare-fun lt!323530 () SeekEntryResult!7243)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41143 (_ BitVec 32)) SeekEntryResult!7243)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730305 (= res!490246 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19687 a!3186) j!159) mask!3328) (select (arr!19687 a!3186) j!159) a!3186 mask!3328) lt!323530))))

(assert (=> b!730305 (= lt!323530 (Intermediate!7243 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!730306 () Bool)

(declare-fun res!490250 () Bool)

(assert (=> b!730306 (=> (not res!490250) (not e!408803))))

(assert (=> b!730306 (= res!490250 e!408799)))

(declare-fun c!80402 () Bool)

(assert (=> b!730306 (= c!80402 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!730307 () Bool)

(declare-fun res!490252 () Bool)

(assert (=> b!730307 (=> (not res!490252) (not e!408796))))

(assert (=> b!730307 (= res!490252 (validKeyInArray!0 k0!2102))))

(declare-fun b!730308 () Bool)

(assert (=> b!730308 (= e!408798 (or (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5) (bvsge mask!3328 #b00000000000000000000000000000000)))))

(declare-fun lt!323531 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730308 (= lt!323531 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!730309 () Bool)

(declare-fun res!490256 () Bool)

(assert (=> b!730309 (=> (not res!490256) (not e!408797))))

(assert (=> b!730309 (= res!490256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!730310 () Bool)

(declare-fun res!490254 () Bool)

(assert (=> b!730310 (=> (not res!490254) (not e!408796))))

(declare-fun arrayContainsKey!0 (array!41143 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!730310 (= res!490254 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!730311 () Bool)

(assert (=> b!730311 (= e!408803 e!408804)))

(declare-fun res!490257 () Bool)

(assert (=> b!730311 (=> (not res!490257) (not e!408804))))

(declare-fun lt!323533 () SeekEntryResult!7243)

(assert (=> b!730311 (= res!490257 (= lt!323533 lt!323532))))

(declare-fun lt!323535 () array!41143)

(declare-fun lt!323538 () (_ BitVec 64))

(assert (=> b!730311 (= lt!323532 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323538 lt!323535 mask!3328))))

(assert (=> b!730311 (= lt!323533 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323538 mask!3328) lt!323538 lt!323535 mask!3328))))

(assert (=> b!730311 (= lt!323538 (select (store (arr!19687 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!730311 (= lt!323535 (array!41144 (store (arr!19687 a!3186) i!1173 k0!2102) (size!20107 a!3186)))))

(declare-fun b!730312 () Bool)

(assert (=> b!730312 (= e!408799 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19687 a!3186) j!159) a!3186 mask!3328) lt!323530))))

(assert (= (and start!64824 res!490247) b!730299))

(assert (= (and b!730299 res!490248) b!730298))

(assert (= (and b!730298 res!490259) b!730307))

(assert (= (and b!730307 res!490252) b!730310))

(assert (= (and b!730310 res!490254) b!730295))

(assert (= (and b!730295 res!490260) b!730309))

(assert (= (and b!730309 res!490256) b!730304))

(assert (= (and b!730304 res!490251) b!730302))

(assert (= (and b!730302 res!490249) b!730305))

(assert (= (and b!730305 res!490246) b!730303))

(assert (= (and b!730303 res!490253) b!730306))

(assert (= (and b!730306 c!80402) b!730312))

(assert (= (and b!730306 (not c!80402)) b!730300))

(assert (= (and b!730306 res!490250) b!730311))

(assert (= (and b!730311 res!490257) b!730296))

(assert (= (and b!730296 res!490255) b!730301))

(assert (= (and b!730301 res!490261) b!730297))

(assert (= (and b!730296 (not res!490258)) b!730308))

(declare-fun m!684315 () Bool)

(assert (=> b!730309 m!684315))

(declare-fun m!684317 () Bool)

(assert (=> b!730296 m!684317))

(declare-fun m!684319 () Bool)

(assert (=> b!730296 m!684319))

(declare-fun m!684321 () Bool)

(assert (=> b!730308 m!684321))

(declare-fun m!684323 () Bool)

(assert (=> start!64824 m!684323))

(declare-fun m!684325 () Bool)

(assert (=> start!64824 m!684325))

(declare-fun m!684327 () Bool)

(assert (=> b!730300 m!684327))

(assert (=> b!730300 m!684327))

(declare-fun m!684329 () Bool)

(assert (=> b!730300 m!684329))

(assert (=> b!730301 m!684327))

(assert (=> b!730301 m!684327))

(declare-fun m!684331 () Bool)

(assert (=> b!730301 m!684331))

(declare-fun m!684333 () Bool)

(assert (=> b!730295 m!684333))

(declare-fun m!684335 () Bool)

(assert (=> b!730311 m!684335))

(declare-fun m!684337 () Bool)

(assert (=> b!730311 m!684337))

(assert (=> b!730311 m!684335))

(declare-fun m!684339 () Bool)

(assert (=> b!730311 m!684339))

(declare-fun m!684341 () Bool)

(assert (=> b!730311 m!684341))

(declare-fun m!684343 () Bool)

(assert (=> b!730311 m!684343))

(declare-fun m!684345 () Bool)

(assert (=> b!730307 m!684345))

(declare-fun m!684347 () Bool)

(assert (=> b!730304 m!684347))

(declare-fun m!684349 () Bool)

(assert (=> b!730303 m!684349))

(assert (=> b!730312 m!684327))

(assert (=> b!730312 m!684327))

(declare-fun m!684351 () Bool)

(assert (=> b!730312 m!684351))

(declare-fun m!684353 () Bool)

(assert (=> b!730310 m!684353))

(assert (=> b!730305 m!684327))

(assert (=> b!730305 m!684327))

(declare-fun m!684355 () Bool)

(assert (=> b!730305 m!684355))

(assert (=> b!730305 m!684355))

(assert (=> b!730305 m!684327))

(declare-fun m!684357 () Bool)

(assert (=> b!730305 m!684357))

(assert (=> b!730298 m!684327))

(assert (=> b!730298 m!684327))

(declare-fun m!684359 () Bool)

(assert (=> b!730298 m!684359))

(assert (=> b!730297 m!684327))

(assert (=> b!730297 m!684327))

(declare-fun m!684361 () Bool)

(assert (=> b!730297 m!684361))

(check-sat (not b!730301) (not b!730310) (not b!730312) (not b!730311) (not b!730296) (not b!730309) (not b!730300) (not b!730307) (not b!730305) (not b!730298) (not start!64824) (not b!730304) (not b!730297) (not b!730308) (not b!730295))
(check-sat)
