; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67840 () Bool)

(assert start!67840)

(declare-fun b!786267 () Bool)

(declare-fun e!437166 () Bool)

(declare-fun e!437169 () Bool)

(assert (=> b!786267 (= e!437166 e!437169)))

(declare-fun res!532100 () Bool)

(assert (=> b!786267 (=> (not res!532100) (not e!437169))))

(declare-datatypes ((array!42760 0))(
  ( (array!42761 (arr!20464 (Array (_ BitVec 32) (_ BitVec 64))) (size!20884 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42760)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8020 0))(
  ( (MissingZero!8020 (index!34448 (_ BitVec 32))) (Found!8020 (index!34449 (_ BitVec 32))) (Intermediate!8020 (undefined!8832 Bool) (index!34450 (_ BitVec 32)) (x!65555 (_ BitVec 32))) (Undefined!8020) (MissingVacant!8020 (index!34451 (_ BitVec 32))) )
))
(declare-fun lt!350583 () SeekEntryResult!8020)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42760 (_ BitVec 32)) SeekEntryResult!8020)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!786267 (= res!532100 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20464 a!3186) j!159) mask!3328) (select (arr!20464 a!3186) j!159) a!3186 mask!3328) lt!350583))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!786267 (= lt!350583 (Intermediate!8020 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!786268 () Bool)

(declare-fun res!532091 () Bool)

(declare-fun e!437171 () Bool)

(assert (=> b!786268 (=> (not res!532091) (not e!437171))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!786268 (= res!532091 (validKeyInArray!0 (select (arr!20464 a!3186) j!159)))))

(declare-fun b!786269 () Bool)

(declare-datatypes ((Unit!27145 0))(
  ( (Unit!27146) )
))
(declare-fun e!437175 () Unit!27145)

(declare-fun Unit!27147 () Unit!27145)

(assert (=> b!786269 (= e!437175 Unit!27147)))

(assert (=> b!786269 false))

(declare-fun b!786270 () Bool)

(declare-fun e!437168 () Bool)

(declare-fun e!437172 () Bool)

(assert (=> b!786270 (= e!437168 e!437172)))

(declare-fun res!532101 () Bool)

(assert (=> b!786270 (=> res!532101 e!437172)))

(declare-fun lt!350584 () SeekEntryResult!8020)

(declare-fun lt!350581 () SeekEntryResult!8020)

(assert (=> b!786270 (= res!532101 (not (= lt!350584 lt!350581)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42760 (_ BitVec 32)) SeekEntryResult!8020)

(assert (=> b!786270 (= lt!350584 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20464 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!786271 () Bool)

(declare-fun res!532094 () Bool)

(assert (=> b!786271 (=> (not res!532094) (not e!437166))))

(assert (=> b!786271 (= res!532094 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20884 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20884 a!3186))))))

(declare-fun b!786272 () Bool)

(declare-fun e!437165 () Bool)

(assert (=> b!786272 (= e!437165 (not e!437168))))

(declare-fun res!532085 () Bool)

(assert (=> b!786272 (=> res!532085 e!437168)))

(declare-fun lt!350576 () SeekEntryResult!8020)

(get-info :version)

(assert (=> b!786272 (= res!532085 (or (not ((_ is Intermediate!8020) lt!350576)) (bvslt x!1131 (x!65555 lt!350576)) (not (= x!1131 (x!65555 lt!350576))) (not (= index!1321 (index!34450 lt!350576)))))))

(declare-fun e!437170 () Bool)

(assert (=> b!786272 e!437170))

(declare-fun res!532090 () Bool)

(assert (=> b!786272 (=> (not res!532090) (not e!437170))))

(declare-fun lt!350582 () SeekEntryResult!8020)

(assert (=> b!786272 (= res!532090 (= lt!350582 lt!350581))))

(assert (=> b!786272 (= lt!350581 (Found!8020 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42760 (_ BitVec 32)) SeekEntryResult!8020)

(assert (=> b!786272 (= lt!350582 (seekEntryOrOpen!0 (select (arr!20464 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42760 (_ BitVec 32)) Bool)

(assert (=> b!786272 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350579 () Unit!27145)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42760 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27145)

(assert (=> b!786272 (= lt!350579 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!786273 () Bool)

(declare-fun res!532087 () Bool)

(assert (=> b!786273 (=> (not res!532087) (not e!437166))))

(assert (=> b!786273 (= res!532087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!786274 () Bool)

(declare-fun res!532084 () Bool)

(assert (=> b!786274 (=> (not res!532084) (not e!437169))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!786274 (= res!532084 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20464 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!786275 () Bool)

(assert (=> b!786275 (= e!437170 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20464 a!3186) j!159) a!3186 mask!3328) lt!350581))))

(declare-fun b!786276 () Bool)

(declare-fun res!532097 () Bool)

(assert (=> b!786276 (=> (not res!532097) (not e!437169))))

(declare-fun e!437167 () Bool)

(assert (=> b!786276 (= res!532097 e!437167)))

(declare-fun c!87503 () Bool)

(assert (=> b!786276 (= c!87503 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!786277 () Bool)

(declare-fun Unit!27148 () Unit!27145)

(assert (=> b!786277 (= e!437175 Unit!27148)))

(declare-fun b!786278 () Bool)

(assert (=> b!786278 (= e!437167 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20464 a!3186) j!159) a!3186 mask!3328) lt!350583))))

(declare-fun b!786266 () Bool)

(declare-fun res!532086 () Bool)

(assert (=> b!786266 (=> (not res!532086) (not e!437171))))

(assert (=> b!786266 (= res!532086 (and (= (size!20884 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20884 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20884 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!532083 () Bool)

(assert (=> start!67840 (=> (not res!532083) (not e!437171))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67840 (= res!532083 (validMask!0 mask!3328))))

(assert (=> start!67840 e!437171))

(assert (=> start!67840 true))

(declare-fun array_inv!16323 (array!42760) Bool)

(assert (=> start!67840 (array_inv!16323 a!3186)))

(declare-fun b!786279 () Bool)

(assert (=> b!786279 (= e!437167 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20464 a!3186) j!159) a!3186 mask!3328) (Found!8020 j!159)))))

(declare-fun b!786280 () Bool)

(declare-fun res!532099 () Bool)

(assert (=> b!786280 (=> (not res!532099) (not e!437171))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!786280 (= res!532099 (validKeyInArray!0 k0!2102))))

(declare-fun b!786281 () Bool)

(declare-fun e!437173 () Bool)

(assert (=> b!786281 (= e!437172 e!437173)))

(declare-fun res!532096 () Bool)

(assert (=> b!786281 (=> res!532096 e!437173)))

(declare-fun lt!350578 () (_ BitVec 64))

(declare-fun lt!350573 () (_ BitVec 64))

(assert (=> b!786281 (= res!532096 (= lt!350578 lt!350573))))

(assert (=> b!786281 (= lt!350578 (select (store (arr!20464 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!786282 () Bool)

(declare-fun e!437176 () Bool)

(assert (=> b!786282 (= e!437176 (= lt!350582 lt!350584))))

(declare-fun b!786283 () Bool)

(assert (=> b!786283 (= e!437171 e!437166)))

(declare-fun res!532093 () Bool)

(assert (=> b!786283 (=> (not res!532093) (not e!437166))))

(declare-fun lt!350575 () SeekEntryResult!8020)

(assert (=> b!786283 (= res!532093 (or (= lt!350575 (MissingZero!8020 i!1173)) (= lt!350575 (MissingVacant!8020 i!1173))))))

(assert (=> b!786283 (= lt!350575 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!786284 () Bool)

(declare-fun res!532088 () Bool)

(assert (=> b!786284 (=> (not res!532088) (not e!437171))))

(declare-fun arrayContainsKey!0 (array!42760 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!786284 (= res!532088 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!786285 () Bool)

(declare-fun res!532095 () Bool)

(assert (=> b!786285 (=> (not res!532095) (not e!437166))))

(declare-datatypes ((List!14373 0))(
  ( (Nil!14370) (Cons!14369 (h!15498 (_ BitVec 64)) (t!20680 List!14373)) )
))
(declare-fun arrayNoDuplicates!0 (array!42760 (_ BitVec 32) List!14373) Bool)

(assert (=> b!786285 (= res!532095 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14370))))

(declare-fun b!786286 () Bool)

(declare-fun res!532089 () Bool)

(assert (=> b!786286 (=> (not res!532089) (not e!437176))))

(declare-fun lt!350577 () array!42760)

(assert (=> b!786286 (= res!532089 (= (seekEntryOrOpen!0 lt!350573 lt!350577 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350573 lt!350577 mask!3328)))))

(declare-fun b!786287 () Bool)

(assert (=> b!786287 (= e!437173 true)))

(assert (=> b!786287 e!437176))

(declare-fun res!532098 () Bool)

(assert (=> b!786287 (=> (not res!532098) (not e!437176))))

(assert (=> b!786287 (= res!532098 (= lt!350578 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!350574 () Unit!27145)

(assert (=> b!786287 (= lt!350574 e!437175)))

(declare-fun c!87502 () Bool)

(assert (=> b!786287 (= c!87502 (= lt!350578 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!786288 () Bool)

(assert (=> b!786288 (= e!437169 e!437165)))

(declare-fun res!532092 () Bool)

(assert (=> b!786288 (=> (not res!532092) (not e!437165))))

(declare-fun lt!350580 () SeekEntryResult!8020)

(assert (=> b!786288 (= res!532092 (= lt!350580 lt!350576))))

(assert (=> b!786288 (= lt!350576 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350573 lt!350577 mask!3328))))

(assert (=> b!786288 (= lt!350580 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350573 mask!3328) lt!350573 lt!350577 mask!3328))))

(assert (=> b!786288 (= lt!350573 (select (store (arr!20464 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!786288 (= lt!350577 (array!42761 (store (arr!20464 a!3186) i!1173 k0!2102) (size!20884 a!3186)))))

(assert (= (and start!67840 res!532083) b!786266))

(assert (= (and b!786266 res!532086) b!786268))

(assert (= (and b!786268 res!532091) b!786280))

(assert (= (and b!786280 res!532099) b!786284))

(assert (= (and b!786284 res!532088) b!786283))

(assert (= (and b!786283 res!532093) b!786273))

(assert (= (and b!786273 res!532087) b!786285))

(assert (= (and b!786285 res!532095) b!786271))

(assert (= (and b!786271 res!532094) b!786267))

(assert (= (and b!786267 res!532100) b!786274))

(assert (= (and b!786274 res!532084) b!786276))

(assert (= (and b!786276 c!87503) b!786278))

(assert (= (and b!786276 (not c!87503)) b!786279))

(assert (= (and b!786276 res!532097) b!786288))

(assert (= (and b!786288 res!532092) b!786272))

(assert (= (and b!786272 res!532090) b!786275))

(assert (= (and b!786272 (not res!532085)) b!786270))

(assert (= (and b!786270 (not res!532101)) b!786281))

(assert (= (and b!786281 (not res!532096)) b!786287))

(assert (= (and b!786287 c!87502) b!786269))

(assert (= (and b!786287 (not c!87502)) b!786277))

(assert (= (and b!786287 res!532098) b!786286))

(assert (= (and b!786286 res!532089) b!786282))

(declare-fun m!728711 () Bool)

(assert (=> b!786279 m!728711))

(assert (=> b!786279 m!728711))

(declare-fun m!728713 () Bool)

(assert (=> b!786279 m!728713))

(declare-fun m!728715 () Bool)

(assert (=> b!786284 m!728715))

(assert (=> b!786268 m!728711))

(assert (=> b!786268 m!728711))

(declare-fun m!728717 () Bool)

(assert (=> b!786268 m!728717))

(declare-fun m!728719 () Bool)

(assert (=> start!67840 m!728719))

(declare-fun m!728721 () Bool)

(assert (=> start!67840 m!728721))

(declare-fun m!728723 () Bool)

(assert (=> b!786281 m!728723))

(declare-fun m!728725 () Bool)

(assert (=> b!786281 m!728725))

(assert (=> b!786270 m!728711))

(assert (=> b!786270 m!728711))

(assert (=> b!786270 m!728713))

(declare-fun m!728727 () Bool)

(assert (=> b!786288 m!728727))

(declare-fun m!728729 () Bool)

(assert (=> b!786288 m!728729))

(assert (=> b!786288 m!728727))

(assert (=> b!786288 m!728723))

(declare-fun m!728731 () Bool)

(assert (=> b!786288 m!728731))

(declare-fun m!728733 () Bool)

(assert (=> b!786288 m!728733))

(declare-fun m!728735 () Bool)

(assert (=> b!786286 m!728735))

(declare-fun m!728737 () Bool)

(assert (=> b!786286 m!728737))

(declare-fun m!728739 () Bool)

(assert (=> b!786273 m!728739))

(declare-fun m!728741 () Bool)

(assert (=> b!786285 m!728741))

(declare-fun m!728743 () Bool)

(assert (=> b!786274 m!728743))

(assert (=> b!786275 m!728711))

(assert (=> b!786275 m!728711))

(declare-fun m!728745 () Bool)

(assert (=> b!786275 m!728745))

(declare-fun m!728747 () Bool)

(assert (=> b!786280 m!728747))

(assert (=> b!786267 m!728711))

(assert (=> b!786267 m!728711))

(declare-fun m!728749 () Bool)

(assert (=> b!786267 m!728749))

(assert (=> b!786267 m!728749))

(assert (=> b!786267 m!728711))

(declare-fun m!728751 () Bool)

(assert (=> b!786267 m!728751))

(assert (=> b!786272 m!728711))

(assert (=> b!786272 m!728711))

(declare-fun m!728753 () Bool)

(assert (=> b!786272 m!728753))

(declare-fun m!728755 () Bool)

(assert (=> b!786272 m!728755))

(declare-fun m!728757 () Bool)

(assert (=> b!786272 m!728757))

(assert (=> b!786278 m!728711))

(assert (=> b!786278 m!728711))

(declare-fun m!728759 () Bool)

(assert (=> b!786278 m!728759))

(declare-fun m!728761 () Bool)

(assert (=> b!786283 m!728761))

(check-sat (not b!786273) (not b!786285) (not start!67840) (not b!786283) (not b!786267) (not b!786268) (not b!786270) (not b!786275) (not b!786279) (not b!786278) (not b!786284) (not b!786272) (not b!786288) (not b!786286) (not b!786280))
(check-sat)
