; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65508 () Bool)

(assert start!65508)

(declare-fun b!747217 () Bool)

(declare-fun res!503878 () Bool)

(declare-fun e!417215 () Bool)

(assert (=> b!747217 (=> (not res!503878) (not e!417215))))

(declare-datatypes ((array!41681 0))(
  ( (array!41682 (arr!19954 (Array (_ BitVec 32) (_ BitVec 64))) (size!20375 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41681)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41681 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!747217 (= res!503878 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!747218 () Bool)

(declare-fun res!503876 () Bool)

(declare-fun e!417211 () Bool)

(assert (=> b!747218 (=> (not res!503876) (not e!417211))))

(declare-fun e!417218 () Bool)

(assert (=> b!747218 (= res!503876 e!417218)))

(declare-fun c!82054 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!747218 (= c!82054 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!747219 () Bool)

(declare-fun e!417212 () Bool)

(declare-fun e!417214 () Bool)

(assert (=> b!747219 (= e!417212 (not e!417214))))

(declare-fun res!503873 () Bool)

(assert (=> b!747219 (=> res!503873 e!417214)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7554 0))(
  ( (MissingZero!7554 (index!32584 (_ BitVec 32))) (Found!7554 (index!32585 (_ BitVec 32))) (Intermediate!7554 (undefined!8366 Bool) (index!32586 (_ BitVec 32)) (x!63528 (_ BitVec 32))) (Undefined!7554) (MissingVacant!7554 (index!32587 (_ BitVec 32))) )
))
(declare-fun lt!332134 () SeekEntryResult!7554)

(get-info :version)

(assert (=> b!747219 (= res!503873 (or (not ((_ is Intermediate!7554) lt!332134)) (bvslt x!1131 (x!63528 lt!332134)) (not (= x!1131 (x!63528 lt!332134))) (not (= index!1321 (index!32586 lt!332134)))))))

(declare-fun e!417217 () Bool)

(assert (=> b!747219 e!417217))

(declare-fun res!503888 () Bool)

(assert (=> b!747219 (=> (not res!503888) (not e!417217))))

(declare-fun lt!332130 () SeekEntryResult!7554)

(declare-fun lt!332127 () SeekEntryResult!7554)

(assert (=> b!747219 (= res!503888 (= lt!332130 lt!332127))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!747219 (= lt!332127 (Found!7554 j!159))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41681 (_ BitVec 32)) SeekEntryResult!7554)

(assert (=> b!747219 (= lt!332130 (seekEntryOrOpen!0 (select (arr!19954 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41681 (_ BitVec 32)) Bool)

(assert (=> b!747219 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25596 0))(
  ( (Unit!25597) )
))
(declare-fun lt!332131 () Unit!25596)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41681 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25596)

(assert (=> b!747219 (= lt!332131 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!747220 () Bool)

(declare-fun res!503884 () Bool)

(declare-fun e!417210 () Bool)

(assert (=> b!747220 (=> (not res!503884) (not e!417210))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!747220 (= res!503884 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20375 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20375 a!3186))))))

(declare-fun b!747221 () Bool)

(declare-fun res!503883 () Bool)

(assert (=> b!747221 (=> (not res!503883) (not e!417210))))

(declare-datatypes ((List!13956 0))(
  ( (Nil!13953) (Cons!13952 (h!15024 (_ BitVec 64)) (t!20271 List!13956)) )
))
(declare-fun arrayNoDuplicates!0 (array!41681 (_ BitVec 32) List!13956) Bool)

(assert (=> b!747221 (= res!503883 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13953))))

(declare-fun res!503872 () Bool)

(assert (=> start!65508 (=> (not res!503872) (not e!417215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65508 (= res!503872 (validMask!0 mask!3328))))

(assert (=> start!65508 e!417215))

(assert (=> start!65508 true))

(declare-fun array_inv!15750 (array!41681) Bool)

(assert (=> start!65508 (array_inv!15750 a!3186)))

(declare-fun b!747222 () Bool)

(declare-fun e!417216 () Unit!25596)

(declare-fun Unit!25598 () Unit!25596)

(assert (=> b!747222 (= e!417216 Unit!25598)))

(assert (=> b!747222 false))

(declare-fun b!747223 () Bool)

(declare-fun res!503881 () Bool)

(assert (=> b!747223 (=> (not res!503881) (not e!417210))))

(assert (=> b!747223 (= res!503881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!747224 () Bool)

(declare-fun res!503880 () Bool)

(assert (=> b!747224 (=> (not res!503880) (not e!417211))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!747224 (= res!503880 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19954 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!747225 () Bool)

(assert (=> b!747225 (= e!417214 (bvsge mask!3328 #b00000000000000000000000000000000))))

(assert (=> b!747225 (= (select (store (arr!19954 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332128 () Unit!25596)

(assert (=> b!747225 (= lt!332128 e!417216)))

(declare-fun c!82053 () Bool)

(assert (=> b!747225 (= c!82053 (= (select (store (arr!19954 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!747226 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41681 (_ BitVec 32)) SeekEntryResult!7554)

(assert (=> b!747226 (= e!417218 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19954 a!3186) j!159) a!3186 mask!3328) (Found!7554 j!159)))))

(declare-fun b!747227 () Bool)

(assert (=> b!747227 (= e!417211 e!417212)))

(declare-fun res!503875 () Bool)

(assert (=> b!747227 (=> (not res!503875) (not e!417212))))

(declare-fun lt!332129 () SeekEntryResult!7554)

(assert (=> b!747227 (= res!503875 (= lt!332129 lt!332134))))

(declare-fun lt!332126 () array!41681)

(declare-fun lt!332135 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41681 (_ BitVec 32)) SeekEntryResult!7554)

(assert (=> b!747227 (= lt!332134 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332135 lt!332126 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!747227 (= lt!332129 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332135 mask!3328) lt!332135 lt!332126 mask!3328))))

(assert (=> b!747227 (= lt!332135 (select (store (arr!19954 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!747227 (= lt!332126 (array!41682 (store (arr!19954 a!3186) i!1173 k0!2102) (size!20375 a!3186)))))

(declare-fun b!747228 () Bool)

(declare-fun res!503877 () Bool)

(assert (=> b!747228 (=> (not res!503877) (not e!417215))))

(assert (=> b!747228 (= res!503877 (and (= (size!20375 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20375 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20375 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!747229 () Bool)

(declare-fun res!503887 () Bool)

(assert (=> b!747229 (=> res!503887 e!417214)))

(assert (=> b!747229 (= res!503887 (= (select (store (arr!19954 a!3186) i!1173 k0!2102) index!1321) lt!332135))))

(declare-fun b!747230 () Bool)

(declare-fun lt!332132 () SeekEntryResult!7554)

(assert (=> b!747230 (= e!417218 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19954 a!3186) j!159) a!3186 mask!3328) lt!332132))))

(declare-fun b!747231 () Bool)

(assert (=> b!747231 (= e!417217 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19954 a!3186) j!159) a!3186 mask!3328) lt!332127))))

(declare-fun b!747232 () Bool)

(declare-fun Unit!25599 () Unit!25596)

(assert (=> b!747232 (= e!417216 Unit!25599)))

(declare-fun b!747233 () Bool)

(declare-fun res!503886 () Bool)

(assert (=> b!747233 (=> res!503886 e!417214)))

(assert (=> b!747233 (= res!503886 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19954 a!3186) j!159) a!3186 mask!3328) lt!332127)))))

(declare-fun b!747234 () Bool)

(declare-fun res!503885 () Bool)

(assert (=> b!747234 (=> (not res!503885) (not e!417215))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!747234 (= res!503885 (validKeyInArray!0 k0!2102))))

(declare-fun b!747235 () Bool)

(assert (=> b!747235 (= e!417215 e!417210)))

(declare-fun res!503879 () Bool)

(assert (=> b!747235 (=> (not res!503879) (not e!417210))))

(declare-fun lt!332133 () SeekEntryResult!7554)

(assert (=> b!747235 (= res!503879 (or (= lt!332133 (MissingZero!7554 i!1173)) (= lt!332133 (MissingVacant!7554 i!1173))))))

(assert (=> b!747235 (= lt!332133 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!747236 () Bool)

(assert (=> b!747236 (= e!417210 e!417211)))

(declare-fun res!503874 () Bool)

(assert (=> b!747236 (=> (not res!503874) (not e!417211))))

(assert (=> b!747236 (= res!503874 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19954 a!3186) j!159) mask!3328) (select (arr!19954 a!3186) j!159) a!3186 mask!3328) lt!332132))))

(assert (=> b!747236 (= lt!332132 (Intermediate!7554 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!747237 () Bool)

(declare-fun res!503882 () Bool)

(assert (=> b!747237 (=> (not res!503882) (not e!417215))))

(assert (=> b!747237 (= res!503882 (validKeyInArray!0 (select (arr!19954 a!3186) j!159)))))

(assert (= (and start!65508 res!503872) b!747228))

(assert (= (and b!747228 res!503877) b!747237))

(assert (= (and b!747237 res!503882) b!747234))

(assert (= (and b!747234 res!503885) b!747217))

(assert (= (and b!747217 res!503878) b!747235))

(assert (= (and b!747235 res!503879) b!747223))

(assert (= (and b!747223 res!503881) b!747221))

(assert (= (and b!747221 res!503883) b!747220))

(assert (= (and b!747220 res!503884) b!747236))

(assert (= (and b!747236 res!503874) b!747224))

(assert (= (and b!747224 res!503880) b!747218))

(assert (= (and b!747218 c!82054) b!747230))

(assert (= (and b!747218 (not c!82054)) b!747226))

(assert (= (and b!747218 res!503876) b!747227))

(assert (= (and b!747227 res!503875) b!747219))

(assert (= (and b!747219 res!503888) b!747231))

(assert (= (and b!747219 (not res!503873)) b!747233))

(assert (= (and b!747233 (not res!503886)) b!747229))

(assert (= (and b!747229 (not res!503887)) b!747225))

(assert (= (and b!747225 c!82053) b!747222))

(assert (= (and b!747225 (not c!82053)) b!747232))

(declare-fun m!697351 () Bool)

(assert (=> b!747235 m!697351))

(declare-fun m!697353 () Bool)

(assert (=> b!747233 m!697353))

(assert (=> b!747233 m!697353))

(declare-fun m!697355 () Bool)

(assert (=> b!747233 m!697355))

(assert (=> b!747230 m!697353))

(assert (=> b!747230 m!697353))

(declare-fun m!697357 () Bool)

(assert (=> b!747230 m!697357))

(assert (=> b!747231 m!697353))

(assert (=> b!747231 m!697353))

(declare-fun m!697359 () Bool)

(assert (=> b!747231 m!697359))

(declare-fun m!697361 () Bool)

(assert (=> b!747225 m!697361))

(declare-fun m!697363 () Bool)

(assert (=> b!747225 m!697363))

(assert (=> b!747219 m!697353))

(assert (=> b!747219 m!697353))

(declare-fun m!697365 () Bool)

(assert (=> b!747219 m!697365))

(declare-fun m!697367 () Bool)

(assert (=> b!747219 m!697367))

(declare-fun m!697369 () Bool)

(assert (=> b!747219 m!697369))

(assert (=> b!747229 m!697361))

(assert (=> b!747229 m!697363))

(declare-fun m!697371 () Bool)

(assert (=> start!65508 m!697371))

(declare-fun m!697373 () Bool)

(assert (=> start!65508 m!697373))

(declare-fun m!697375 () Bool)

(assert (=> b!747224 m!697375))

(declare-fun m!697377 () Bool)

(assert (=> b!747227 m!697377))

(declare-fun m!697379 () Bool)

(assert (=> b!747227 m!697379))

(assert (=> b!747227 m!697361))

(declare-fun m!697381 () Bool)

(assert (=> b!747227 m!697381))

(assert (=> b!747227 m!697377))

(declare-fun m!697383 () Bool)

(assert (=> b!747227 m!697383))

(declare-fun m!697385 () Bool)

(assert (=> b!747234 m!697385))

(assert (=> b!747226 m!697353))

(assert (=> b!747226 m!697353))

(assert (=> b!747226 m!697355))

(declare-fun m!697387 () Bool)

(assert (=> b!747221 m!697387))

(declare-fun m!697389 () Bool)

(assert (=> b!747217 m!697389))

(declare-fun m!697391 () Bool)

(assert (=> b!747223 m!697391))

(assert (=> b!747237 m!697353))

(assert (=> b!747237 m!697353))

(declare-fun m!697393 () Bool)

(assert (=> b!747237 m!697393))

(assert (=> b!747236 m!697353))

(assert (=> b!747236 m!697353))

(declare-fun m!697395 () Bool)

(assert (=> b!747236 m!697395))

(assert (=> b!747236 m!697395))

(assert (=> b!747236 m!697353))

(declare-fun m!697397 () Bool)

(assert (=> b!747236 m!697397))

(check-sat (not b!747231) (not b!747236) (not b!747217) (not b!747233) (not b!747237) (not start!65508) (not b!747223) (not b!747221) (not b!747226) (not b!747227) (not b!747234) (not b!747230) (not b!747235) (not b!747219))
(check-sat)
