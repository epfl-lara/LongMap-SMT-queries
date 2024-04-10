; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65236 () Bool)

(assert start!65236)

(declare-fun b!739276 () Bool)

(declare-fun e!413400 () Bool)

(assert (=> b!739276 (= e!413400 true)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7418 0))(
  ( (MissingZero!7418 (index!32040 (_ BitVec 32))) (Found!7418 (index!32041 (_ BitVec 32))) (Intermediate!7418 (undefined!8230 Bool) (index!32042 (_ BitVec 32)) (x!63032 (_ BitVec 32))) (Undefined!7418) (MissingVacant!7418 (index!32043 (_ BitVec 32))) )
))
(declare-fun lt!328265 () SeekEntryResult!7418)

(declare-fun lt!328256 () (_ BitVec 64))

(declare-fun lt!328263 () (_ BitVec 32))

(declare-datatypes ((array!41409 0))(
  ( (array!41410 (arr!19818 (Array (_ BitVec 32) (_ BitVec 64))) (size!20239 (_ BitVec 32))) )
))
(declare-fun lt!328260 () array!41409)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41409 (_ BitVec 32)) SeekEntryResult!7418)

(assert (=> b!739276 (= lt!328265 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328263 lt!328256 lt!328260 mask!3328))))

(declare-fun b!739277 () Bool)

(declare-fun e!413393 () Bool)

(declare-fun e!413391 () Bool)

(assert (=> b!739277 (= e!413393 e!413391)))

(declare-fun res!497058 () Bool)

(assert (=> b!739277 (=> (not res!497058) (not e!413391))))

(declare-fun a!3186 () array!41409)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!328252 () SeekEntryResult!7418)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41409 (_ BitVec 32)) SeekEntryResult!7418)

(assert (=> b!739277 (= res!497058 (= (seekEntryOrOpen!0 (select (arr!19818 a!3186) j!159) a!3186 mask!3328) lt!328252))))

(assert (=> b!739277 (= lt!328252 (Found!7418 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!739278 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41409 (_ BitVec 32)) SeekEntryResult!7418)

(assert (=> b!739278 (= e!413391 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19818 a!3186) j!159) a!3186 mask!3328) lt!328252))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!413396 () Bool)

(declare-fun b!739279 () Bool)

(assert (=> b!739279 (= e!413396 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19818 a!3186) j!159) a!3186 mask!3328) (Found!7418 j!159)))))

(declare-fun b!739280 () Bool)

(declare-fun res!497066 () Bool)

(declare-fun e!413402 () Bool)

(assert (=> b!739280 (=> (not res!497066) (not e!413402))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!739280 (= res!497066 (validKeyInArray!0 (select (arr!19818 a!3186) j!159)))))

(declare-fun b!739281 () Bool)

(declare-fun res!497067 () Bool)

(declare-fun e!413395 () Bool)

(assert (=> b!739281 (=> (not res!497067) (not e!413395))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41409 (_ BitVec 32)) Bool)

(assert (=> b!739281 (= res!497067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!739282 () Bool)

(declare-fun e!413392 () Bool)

(assert (=> b!739282 (= e!413392 e!413400)))

(declare-fun res!497060 () Bool)

(assert (=> b!739282 (=> res!497060 e!413400)))

(assert (=> b!739282 (= res!497060 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328263 #b00000000000000000000000000000000) (bvsge lt!328263 (size!20239 a!3186))))))

(declare-datatypes ((Unit!25268 0))(
  ( (Unit!25269) )
))
(declare-fun lt!328255 () Unit!25268)

(declare-fun e!413394 () Unit!25268)

(assert (=> b!739282 (= lt!328255 e!413394)))

(declare-fun c!81491 () Bool)

(declare-fun lt!328258 () Bool)

(assert (=> b!739282 (= c!81491 lt!328258)))

(assert (=> b!739282 (= lt!328258 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739282 (= lt!328263 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!739283 () Bool)

(declare-fun res!497056 () Bool)

(assert (=> b!739283 (=> (not res!497056) (not e!413402))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!739283 (= res!497056 (and (= (size!20239 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20239 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20239 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!739284 () Bool)

(declare-fun res!497061 () Bool)

(assert (=> b!739284 (=> (not res!497061) (not e!413395))))

(declare-datatypes ((List!13820 0))(
  ( (Nil!13817) (Cons!13816 (h!14888 (_ BitVec 64)) (t!20135 List!13820)) )
))
(declare-fun arrayNoDuplicates!0 (array!41409 (_ BitVec 32) List!13820) Bool)

(assert (=> b!739284 (= res!497061 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13817))))

(declare-fun b!739285 () Bool)

(declare-fun Unit!25270 () Unit!25268)

(assert (=> b!739285 (= e!413394 Unit!25270)))

(declare-fun lt!328259 () SeekEntryResult!7418)

(assert (=> b!739285 (= lt!328259 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19818 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!328253 () SeekEntryResult!7418)

(assert (=> b!739285 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328263 resIntermediateIndex!5 (select (arr!19818 a!3186) j!159) a!3186 mask!3328) lt!328253)))

(declare-fun b!739286 () Bool)

(declare-fun e!413399 () Bool)

(assert (=> b!739286 (= e!413399 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328263 resIntermediateIndex!5 (select (arr!19818 a!3186) j!159) a!3186 mask!3328) lt!328253)))))

(declare-fun b!739287 () Bool)

(declare-fun lt!328262 () SeekEntryResult!7418)

(assert (=> b!739287 (= e!413399 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328263 (select (arr!19818 a!3186) j!159) a!3186 mask!3328) lt!328262)))))

(declare-fun b!739288 () Bool)

(declare-fun e!413397 () Bool)

(assert (=> b!739288 (= e!413397 (not e!413392))))

(declare-fun res!497064 () Bool)

(assert (=> b!739288 (=> res!497064 e!413392)))

(declare-fun lt!328257 () SeekEntryResult!7418)

(assert (=> b!739288 (= res!497064 (or (not (is-Intermediate!7418 lt!328257)) (bvsge x!1131 (x!63032 lt!328257))))))

(assert (=> b!739288 (= lt!328253 (Found!7418 j!159))))

(assert (=> b!739288 e!413393))

(declare-fun res!497072 () Bool)

(assert (=> b!739288 (=> (not res!497072) (not e!413393))))

(assert (=> b!739288 (= res!497072 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!328254 () Unit!25268)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41409 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25268)

(assert (=> b!739288 (= lt!328254 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!739289 () Bool)

(declare-fun res!497063 () Bool)

(assert (=> b!739289 (=> (not res!497063) (not e!413395))))

(assert (=> b!739289 (= res!497063 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20239 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20239 a!3186))))))

(declare-fun b!739290 () Bool)

(declare-fun res!497057 () Bool)

(assert (=> b!739290 (=> (not res!497057) (not e!413402))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41409 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!739290 (= res!497057 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!739291 () Bool)

(declare-fun res!497068 () Bool)

(declare-fun e!413401 () Bool)

(assert (=> b!739291 (=> (not res!497068) (not e!413401))))

(assert (=> b!739291 (= res!497068 e!413396)))

(declare-fun c!81493 () Bool)

(assert (=> b!739291 (= c!81493 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!739292 () Bool)

(assert (=> b!739292 (= e!413402 e!413395)))

(declare-fun res!497071 () Bool)

(assert (=> b!739292 (=> (not res!497071) (not e!413395))))

(declare-fun lt!328264 () SeekEntryResult!7418)

(assert (=> b!739292 (= res!497071 (or (= lt!328264 (MissingZero!7418 i!1173)) (= lt!328264 (MissingVacant!7418 i!1173))))))

(assert (=> b!739292 (= lt!328264 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!739293 () Bool)

(assert (=> b!739293 (= e!413395 e!413401)))

(declare-fun res!497055 () Bool)

(assert (=> b!739293 (=> (not res!497055) (not e!413401))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739293 (= res!497055 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19818 a!3186) j!159) mask!3328) (select (arr!19818 a!3186) j!159) a!3186 mask!3328) lt!328262))))

(assert (=> b!739293 (= lt!328262 (Intermediate!7418 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!739294 () Bool)

(assert (=> b!739294 (= e!413396 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19818 a!3186) j!159) a!3186 mask!3328) lt!328262))))

(declare-fun res!497059 () Bool)

(assert (=> start!65236 (=> (not res!497059) (not e!413402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65236 (= res!497059 (validMask!0 mask!3328))))

(assert (=> start!65236 e!413402))

(assert (=> start!65236 true))

(declare-fun array_inv!15614 (array!41409) Bool)

(assert (=> start!65236 (array_inv!15614 a!3186)))

(declare-fun b!739295 () Bool)

(declare-fun res!497069 () Bool)

(assert (=> b!739295 (=> (not res!497069) (not e!413402))))

(assert (=> b!739295 (= res!497069 (validKeyInArray!0 k!2102))))

(declare-fun b!739296 () Bool)

(declare-fun Unit!25271 () Unit!25268)

(assert (=> b!739296 (= e!413394 Unit!25271)))

(assert (=> b!739296 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328263 (select (arr!19818 a!3186) j!159) a!3186 mask!3328) lt!328262)))

(declare-fun b!739297 () Bool)

(declare-fun res!497070 () Bool)

(assert (=> b!739297 (=> res!497070 e!413400)))

(assert (=> b!739297 (= res!497070 e!413399)))

(declare-fun c!81492 () Bool)

(assert (=> b!739297 (= c!81492 lt!328258)))

(declare-fun b!739298 () Bool)

(assert (=> b!739298 (= e!413401 e!413397)))

(declare-fun res!497065 () Bool)

(assert (=> b!739298 (=> (not res!497065) (not e!413397))))

(declare-fun lt!328261 () SeekEntryResult!7418)

(assert (=> b!739298 (= res!497065 (= lt!328261 lt!328257))))

(assert (=> b!739298 (= lt!328257 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328256 lt!328260 mask!3328))))

(assert (=> b!739298 (= lt!328261 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328256 mask!3328) lt!328256 lt!328260 mask!3328))))

(assert (=> b!739298 (= lt!328256 (select (store (arr!19818 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!739298 (= lt!328260 (array!41410 (store (arr!19818 a!3186) i!1173 k!2102) (size!20239 a!3186)))))

(declare-fun b!739299 () Bool)

(declare-fun res!497062 () Bool)

(assert (=> b!739299 (=> (not res!497062) (not e!413401))))

(assert (=> b!739299 (= res!497062 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19818 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!65236 res!497059) b!739283))

(assert (= (and b!739283 res!497056) b!739280))

(assert (= (and b!739280 res!497066) b!739295))

(assert (= (and b!739295 res!497069) b!739290))

(assert (= (and b!739290 res!497057) b!739292))

(assert (= (and b!739292 res!497071) b!739281))

(assert (= (and b!739281 res!497067) b!739284))

(assert (= (and b!739284 res!497061) b!739289))

(assert (= (and b!739289 res!497063) b!739293))

(assert (= (and b!739293 res!497055) b!739299))

(assert (= (and b!739299 res!497062) b!739291))

(assert (= (and b!739291 c!81493) b!739294))

(assert (= (and b!739291 (not c!81493)) b!739279))

(assert (= (and b!739291 res!497068) b!739298))

(assert (= (and b!739298 res!497065) b!739288))

(assert (= (and b!739288 res!497072) b!739277))

(assert (= (and b!739277 res!497058) b!739278))

(assert (= (and b!739288 (not res!497064)) b!739282))

(assert (= (and b!739282 c!81491) b!739296))

(assert (= (and b!739282 (not c!81491)) b!739285))

(assert (= (and b!739282 (not res!497060)) b!739297))

(assert (= (and b!739297 c!81492) b!739287))

(assert (= (and b!739297 (not c!81492)) b!739286))

(assert (= (and b!739297 (not res!497070)) b!739276))

(declare-fun m!690697 () Bool)

(assert (=> b!739296 m!690697))

(assert (=> b!739296 m!690697))

(declare-fun m!690699 () Bool)

(assert (=> b!739296 m!690699))

(declare-fun m!690701 () Bool)

(assert (=> b!739288 m!690701))

(declare-fun m!690703 () Bool)

(assert (=> b!739288 m!690703))

(assert (=> b!739294 m!690697))

(assert (=> b!739294 m!690697))

(declare-fun m!690705 () Bool)

(assert (=> b!739294 m!690705))

(assert (=> b!739293 m!690697))

(assert (=> b!739293 m!690697))

(declare-fun m!690707 () Bool)

(assert (=> b!739293 m!690707))

(assert (=> b!739293 m!690707))

(assert (=> b!739293 m!690697))

(declare-fun m!690709 () Bool)

(assert (=> b!739293 m!690709))

(declare-fun m!690711 () Bool)

(assert (=> b!739299 m!690711))

(declare-fun m!690713 () Bool)

(assert (=> b!739276 m!690713))

(declare-fun m!690715 () Bool)

(assert (=> b!739284 m!690715))

(assert (=> b!739287 m!690697))

(assert (=> b!739287 m!690697))

(assert (=> b!739287 m!690699))

(assert (=> b!739278 m!690697))

(assert (=> b!739278 m!690697))

(declare-fun m!690717 () Bool)

(assert (=> b!739278 m!690717))

(assert (=> b!739277 m!690697))

(assert (=> b!739277 m!690697))

(declare-fun m!690719 () Bool)

(assert (=> b!739277 m!690719))

(assert (=> b!739286 m!690697))

(assert (=> b!739286 m!690697))

(declare-fun m!690721 () Bool)

(assert (=> b!739286 m!690721))

(assert (=> b!739280 m!690697))

(assert (=> b!739280 m!690697))

(declare-fun m!690723 () Bool)

(assert (=> b!739280 m!690723))

(declare-fun m!690725 () Bool)

(assert (=> b!739282 m!690725))

(declare-fun m!690727 () Bool)

(assert (=> b!739292 m!690727))

(declare-fun m!690729 () Bool)

(assert (=> b!739281 m!690729))

(declare-fun m!690731 () Bool)

(assert (=> b!739295 m!690731))

(declare-fun m!690733 () Bool)

(assert (=> b!739290 m!690733))

(declare-fun m!690735 () Bool)

(assert (=> b!739298 m!690735))

(declare-fun m!690737 () Bool)

(assert (=> b!739298 m!690737))

(declare-fun m!690739 () Bool)

(assert (=> b!739298 m!690739))

(declare-fun m!690741 () Bool)

(assert (=> b!739298 m!690741))

(declare-fun m!690743 () Bool)

(assert (=> b!739298 m!690743))

(assert (=> b!739298 m!690739))

(assert (=> b!739285 m!690697))

(assert (=> b!739285 m!690697))

(declare-fun m!690745 () Bool)

(assert (=> b!739285 m!690745))

(assert (=> b!739285 m!690697))

(assert (=> b!739285 m!690721))

(assert (=> b!739279 m!690697))

(assert (=> b!739279 m!690697))

(assert (=> b!739279 m!690745))

(declare-fun m!690747 () Bool)

(assert (=> start!65236 m!690747))

(declare-fun m!690749 () Bool)

(assert (=> start!65236 m!690749))

(push 1)

