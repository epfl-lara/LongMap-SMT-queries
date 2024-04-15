; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65114 () Bool)

(assert start!65114)

(declare-fun b!735354 () Bool)

(declare-datatypes ((Unit!25028 0))(
  ( (Unit!25029) )
))
(declare-fun e!411408 () Unit!25028)

(declare-fun Unit!25030 () Unit!25028)

(assert (=> b!735354 (= e!411408 Unit!25030)))

(declare-datatypes ((array!41304 0))(
  ( (array!41305 (arr!19766 (Array (_ BitVec 32) (_ BitVec 64))) (size!20187 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41304)

(declare-datatypes ((SeekEntryResult!7363 0))(
  ( (MissingZero!7363 (index!31820 (_ BitVec 32))) (Found!7363 (index!31821 (_ BitVec 32))) (Intermediate!7363 (undefined!8175 Bool) (index!31822 (_ BitVec 32)) (x!62836 (_ BitVec 32))) (Undefined!7363) (MissingVacant!7363 (index!31823 (_ BitVec 32))) )
))
(declare-fun lt!325880 () SeekEntryResult!7363)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!325881 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41304 (_ BitVec 32)) SeekEntryResult!7363)

(assert (=> b!735354 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325881 (select (arr!19766 a!3186) j!159) a!3186 mask!3328) lt!325880)))

(declare-fun b!735355 () Bool)

(declare-fun e!411411 () Bool)

(declare-fun e!411407 () Bool)

(assert (=> b!735355 (= e!411411 e!411407)))

(declare-fun res!494201 () Bool)

(assert (=> b!735355 (=> (not res!494201) (not e!411407))))

(declare-fun lt!325875 () SeekEntryResult!7363)

(declare-fun lt!325882 () SeekEntryResult!7363)

(assert (=> b!735355 (= res!494201 (= lt!325875 lt!325882))))

(declare-fun lt!325883 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!325877 () array!41304)

(assert (=> b!735355 (= lt!325882 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325883 lt!325877 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735355 (= lt!325875 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325883 mask!3328) lt!325883 lt!325877 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!735355 (= lt!325883 (select (store (arr!19766 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!735355 (= lt!325877 (array!41305 (store (arr!19766 a!3186) i!1173 k0!2102) (size!20187 a!3186)))))

(declare-fun e!411402 () Bool)

(declare-fun b!735356 () Bool)

(assert (=> b!735356 (= e!411402 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19766 a!3186) j!159) a!3186 mask!3328) lt!325880))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!325876 () SeekEntryResult!7363)

(declare-fun e!411405 () Bool)

(declare-fun b!735357 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41304 (_ BitVec 32)) SeekEntryResult!7363)

(assert (=> b!735357 (= e!411405 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325881 resIntermediateIndex!5 (select (arr!19766 a!3186) j!159) a!3186 mask!3328) lt!325876)))))

(declare-fun b!735358 () Bool)

(declare-fun res!494207 () Bool)

(assert (=> b!735358 (=> (not res!494207) (not e!411411))))

(assert (=> b!735358 (= res!494207 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19766 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!735359 () Bool)

(declare-fun res!494202 () Bool)

(declare-fun e!411412 () Bool)

(assert (=> b!735359 (=> (not res!494202) (not e!411412))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!735359 (= res!494202 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20187 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20187 a!3186))))))

(declare-fun b!735360 () Bool)

(declare-fun res!494196 () Bool)

(assert (=> b!735360 (=> (not res!494196) (not e!411412))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41304 (_ BitVec 32)) Bool)

(assert (=> b!735360 (= res!494196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!735361 () Bool)

(declare-fun res!494195 () Bool)

(declare-fun e!411403 () Bool)

(assert (=> b!735361 (=> (not res!494195) (not e!411403))))

(assert (=> b!735361 (= res!494195 (and (= (size!20187 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20187 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20187 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!735362 () Bool)

(declare-fun e!411404 () Bool)

(assert (=> b!735362 (= e!411404 true)))

(declare-fun lt!325871 () SeekEntryResult!7363)

(assert (=> b!735362 (= lt!325871 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325881 lt!325883 lt!325877 mask!3328))))

(declare-fun b!735363 () Bool)

(declare-fun res!494191 () Bool)

(assert (=> b!735363 (=> (not res!494191) (not e!411412))))

(declare-datatypes ((List!13807 0))(
  ( (Nil!13804) (Cons!13803 (h!14875 (_ BitVec 64)) (t!20113 List!13807)) )
))
(declare-fun arrayNoDuplicates!0 (array!41304 (_ BitVec 32) List!13807) Bool)

(assert (=> b!735363 (= res!494191 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13804))))

(declare-fun b!735364 () Bool)

(assert (=> b!735364 (= e!411412 e!411411)))

(declare-fun res!494197 () Bool)

(assert (=> b!735364 (=> (not res!494197) (not e!411411))))

(assert (=> b!735364 (= res!494197 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19766 a!3186) j!159) mask!3328) (select (arr!19766 a!3186) j!159) a!3186 mask!3328) lt!325880))))

(assert (=> b!735364 (= lt!325880 (Intermediate!7363 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!735365 () Bool)

(declare-fun e!411401 () Bool)

(assert (=> b!735365 (= e!411401 e!411404)))

(declare-fun res!494206 () Bool)

(assert (=> b!735365 (=> res!494206 e!411404)))

(assert (=> b!735365 (= res!494206 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!325881 #b00000000000000000000000000000000) (bvsge lt!325881 (size!20187 a!3186))))))

(declare-fun lt!325874 () Unit!25028)

(assert (=> b!735365 (= lt!325874 e!411408)))

(declare-fun c!80963 () Bool)

(declare-fun lt!325878 () Bool)

(assert (=> b!735365 (= c!80963 lt!325878)))

(assert (=> b!735365 (= lt!325878 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735365 (= lt!325881 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!735366 () Bool)

(declare-fun e!411409 () Bool)

(declare-fun e!411406 () Bool)

(assert (=> b!735366 (= e!411409 e!411406)))

(declare-fun res!494193 () Bool)

(assert (=> b!735366 (=> (not res!494193) (not e!411406))))

(declare-fun lt!325879 () SeekEntryResult!7363)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41304 (_ BitVec 32)) SeekEntryResult!7363)

(assert (=> b!735366 (= res!494193 (= (seekEntryOrOpen!0 (select (arr!19766 a!3186) j!159) a!3186 mask!3328) lt!325879))))

(assert (=> b!735366 (= lt!325879 (Found!7363 j!159))))

(declare-fun b!735367 () Bool)

(declare-fun res!494203 () Bool)

(assert (=> b!735367 (=> (not res!494203) (not e!411411))))

(assert (=> b!735367 (= res!494203 e!411402)))

(declare-fun c!80962 () Bool)

(assert (=> b!735367 (= c!80962 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!494198 () Bool)

(assert (=> start!65114 (=> (not res!494198) (not e!411403))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65114 (= res!494198 (validMask!0 mask!3328))))

(assert (=> start!65114 e!411403))

(assert (=> start!65114 true))

(declare-fun array_inv!15649 (array!41304) Bool)

(assert (=> start!65114 (array_inv!15649 a!3186)))

(declare-fun b!735368 () Bool)

(assert (=> b!735368 (= e!411403 e!411412)))

(declare-fun res!494200 () Bool)

(assert (=> b!735368 (=> (not res!494200) (not e!411412))))

(declare-fun lt!325872 () SeekEntryResult!7363)

(assert (=> b!735368 (= res!494200 (or (= lt!325872 (MissingZero!7363 i!1173)) (= lt!325872 (MissingVacant!7363 i!1173))))))

(assert (=> b!735368 (= lt!325872 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!735369 () Bool)

(declare-fun Unit!25031 () Unit!25028)

(assert (=> b!735369 (= e!411408 Unit!25031)))

(declare-fun lt!325873 () SeekEntryResult!7363)

(assert (=> b!735369 (= lt!325873 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19766 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!735369 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325881 resIntermediateIndex!5 (select (arr!19766 a!3186) j!159) a!3186 mask!3328) lt!325876)))

(declare-fun b!735370 () Bool)

(assert (=> b!735370 (= e!411402 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19766 a!3186) j!159) a!3186 mask!3328) (Found!7363 j!159)))))

(declare-fun b!735371 () Bool)

(declare-fun res!494205 () Bool)

(assert (=> b!735371 (=> (not res!494205) (not e!411403))))

(declare-fun arrayContainsKey!0 (array!41304 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!735371 (= res!494205 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!735372 () Bool)

(assert (=> b!735372 (= e!411406 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19766 a!3186) j!159) a!3186 mask!3328) lt!325879))))

(declare-fun b!735373 () Bool)

(assert (=> b!735373 (= e!411405 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325881 (select (arr!19766 a!3186) j!159) a!3186 mask!3328) lt!325880)))))

(declare-fun b!735374 () Bool)

(declare-fun res!494199 () Bool)

(assert (=> b!735374 (=> (not res!494199) (not e!411403))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!735374 (= res!494199 (validKeyInArray!0 k0!2102))))

(declare-fun b!735375 () Bool)

(assert (=> b!735375 (= e!411407 (not e!411401))))

(declare-fun res!494194 () Bool)

(assert (=> b!735375 (=> res!494194 e!411401)))

(get-info :version)

(assert (=> b!735375 (= res!494194 (or (not ((_ is Intermediate!7363) lt!325882)) (bvsge x!1131 (x!62836 lt!325882))))))

(assert (=> b!735375 (= lt!325876 (Found!7363 j!159))))

(assert (=> b!735375 e!411409))

(declare-fun res!494204 () Bool)

(assert (=> b!735375 (=> (not res!494204) (not e!411409))))

(assert (=> b!735375 (= res!494204 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!325870 () Unit!25028)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41304 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25028)

(assert (=> b!735375 (= lt!325870 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!735376 () Bool)

(declare-fun res!494192 () Bool)

(assert (=> b!735376 (=> (not res!494192) (not e!411403))))

(assert (=> b!735376 (= res!494192 (validKeyInArray!0 (select (arr!19766 a!3186) j!159)))))

(declare-fun b!735377 () Bool)

(declare-fun res!494208 () Bool)

(assert (=> b!735377 (=> res!494208 e!411404)))

(assert (=> b!735377 (= res!494208 e!411405)))

(declare-fun c!80964 () Bool)

(assert (=> b!735377 (= c!80964 lt!325878)))

(assert (= (and start!65114 res!494198) b!735361))

(assert (= (and b!735361 res!494195) b!735376))

(assert (= (and b!735376 res!494192) b!735374))

(assert (= (and b!735374 res!494199) b!735371))

(assert (= (and b!735371 res!494205) b!735368))

(assert (= (and b!735368 res!494200) b!735360))

(assert (= (and b!735360 res!494196) b!735363))

(assert (= (and b!735363 res!494191) b!735359))

(assert (= (and b!735359 res!494202) b!735364))

(assert (= (and b!735364 res!494197) b!735358))

(assert (= (and b!735358 res!494207) b!735367))

(assert (= (and b!735367 c!80962) b!735356))

(assert (= (and b!735367 (not c!80962)) b!735370))

(assert (= (and b!735367 res!494203) b!735355))

(assert (= (and b!735355 res!494201) b!735375))

(assert (= (and b!735375 res!494204) b!735366))

(assert (= (and b!735366 res!494193) b!735372))

(assert (= (and b!735375 (not res!494194)) b!735365))

(assert (= (and b!735365 c!80963) b!735354))

(assert (= (and b!735365 (not c!80963)) b!735369))

(assert (= (and b!735365 (not res!494206)) b!735377))

(assert (= (and b!735377 c!80964) b!735373))

(assert (= (and b!735377 (not c!80964)) b!735357))

(assert (= (and b!735377 (not res!494208)) b!735362))

(declare-fun m!687185 () Bool)

(assert (=> b!735366 m!687185))

(assert (=> b!735366 m!687185))

(declare-fun m!687187 () Bool)

(assert (=> b!735366 m!687187))

(assert (=> b!735376 m!687185))

(assert (=> b!735376 m!687185))

(declare-fun m!687189 () Bool)

(assert (=> b!735376 m!687189))

(declare-fun m!687191 () Bool)

(assert (=> start!65114 m!687191))

(declare-fun m!687193 () Bool)

(assert (=> start!65114 m!687193))

(declare-fun m!687195 () Bool)

(assert (=> b!735363 m!687195))

(declare-fun m!687197 () Bool)

(assert (=> b!735375 m!687197))

(declare-fun m!687199 () Bool)

(assert (=> b!735375 m!687199))

(assert (=> b!735369 m!687185))

(assert (=> b!735369 m!687185))

(declare-fun m!687201 () Bool)

(assert (=> b!735369 m!687201))

(assert (=> b!735369 m!687185))

(declare-fun m!687203 () Bool)

(assert (=> b!735369 m!687203))

(declare-fun m!687205 () Bool)

(assert (=> b!735360 m!687205))

(declare-fun m!687207 () Bool)

(assert (=> b!735374 m!687207))

(assert (=> b!735357 m!687185))

(assert (=> b!735357 m!687185))

(assert (=> b!735357 m!687203))

(declare-fun m!687209 () Bool)

(assert (=> b!735371 m!687209))

(declare-fun m!687211 () Bool)

(assert (=> b!735368 m!687211))

(assert (=> b!735370 m!687185))

(assert (=> b!735370 m!687185))

(assert (=> b!735370 m!687201))

(declare-fun m!687213 () Bool)

(assert (=> b!735362 m!687213))

(assert (=> b!735356 m!687185))

(assert (=> b!735356 m!687185))

(declare-fun m!687215 () Bool)

(assert (=> b!735356 m!687215))

(assert (=> b!735354 m!687185))

(assert (=> b!735354 m!687185))

(declare-fun m!687217 () Bool)

(assert (=> b!735354 m!687217))

(declare-fun m!687219 () Bool)

(assert (=> b!735365 m!687219))

(assert (=> b!735372 m!687185))

(assert (=> b!735372 m!687185))

(declare-fun m!687221 () Bool)

(assert (=> b!735372 m!687221))

(assert (=> b!735364 m!687185))

(assert (=> b!735364 m!687185))

(declare-fun m!687223 () Bool)

(assert (=> b!735364 m!687223))

(assert (=> b!735364 m!687223))

(assert (=> b!735364 m!687185))

(declare-fun m!687225 () Bool)

(assert (=> b!735364 m!687225))

(declare-fun m!687227 () Bool)

(assert (=> b!735355 m!687227))

(declare-fun m!687229 () Bool)

(assert (=> b!735355 m!687229))

(declare-fun m!687231 () Bool)

(assert (=> b!735355 m!687231))

(declare-fun m!687233 () Bool)

(assert (=> b!735355 m!687233))

(assert (=> b!735355 m!687233))

(declare-fun m!687235 () Bool)

(assert (=> b!735355 m!687235))

(declare-fun m!687237 () Bool)

(assert (=> b!735358 m!687237))

(assert (=> b!735373 m!687185))

(assert (=> b!735373 m!687185))

(assert (=> b!735373 m!687217))

(check-sat (not b!735371) (not b!735356) (not b!735364) (not b!735373) (not b!735370) (not b!735375) (not start!65114) (not b!735369) (not b!735365) (not b!735355) (not b!735362) (not b!735374) (not b!735357) (not b!735363) (not b!735366) (not b!735376) (not b!735368) (not b!735354) (not b!735372) (not b!735360))
(check-sat)
