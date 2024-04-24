; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68122 () Bool)

(assert start!68122)

(declare-fun res!536430 () Bool)

(declare-fun e!440241 () Bool)

(assert (=> start!68122 (=> (not res!536430) (not e!440241))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68122 (= res!536430 (validMask!0 mask!3328))))

(assert (=> start!68122 e!440241))

(assert (=> start!68122 true))

(declare-datatypes ((array!42916 0))(
  ( (array!42917 (arr!20539 (Array (_ BitVec 32) (_ BitVec 64))) (size!20959 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42916)

(declare-fun array_inv!16398 (array!42916) Bool)

(assert (=> start!68122 (array_inv!16398 a!3186)))

(declare-fun b!792047 () Bool)

(declare-fun res!536428 () Bool)

(declare-fun e!440240 () Bool)

(assert (=> b!792047 (=> (not res!536428) (not e!440240))))

(declare-fun e!440239 () Bool)

(assert (=> b!792047 (= res!536428 e!440239)))

(declare-fun c!88226 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!792047 (= c!88226 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!792048 () Bool)

(declare-fun e!440238 () Bool)

(assert (=> b!792048 (= e!440241 e!440238)))

(declare-fun res!536427 () Bool)

(assert (=> b!792048 (=> (not res!536427) (not e!440238))))

(declare-datatypes ((SeekEntryResult!8095 0))(
  ( (MissingZero!8095 (index!34748 (_ BitVec 32))) (Found!8095 (index!34749 (_ BitVec 32))) (Intermediate!8095 (undefined!8907 Bool) (index!34750 (_ BitVec 32)) (x!65848 (_ BitVec 32))) (Undefined!8095) (MissingVacant!8095 (index!34751 (_ BitVec 32))) )
))
(declare-fun lt!353518 () SeekEntryResult!8095)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!792048 (= res!536427 (or (= lt!353518 (MissingZero!8095 i!1173)) (= lt!353518 (MissingVacant!8095 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42916 (_ BitVec 32)) SeekEntryResult!8095)

(assert (=> b!792048 (= lt!353518 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun lt!353516 () SeekEntryResult!8095)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!792049 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42916 (_ BitVec 32)) SeekEntryResult!8095)

(assert (=> b!792049 (= e!440239 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20539 a!3186) j!159) a!3186 mask!3328) lt!353516))))

(declare-fun b!792050 () Bool)

(assert (=> b!792050 (= e!440238 e!440240)))

(declare-fun res!536434 () Bool)

(assert (=> b!792050 (=> (not res!536434) (not e!440240))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!792050 (= res!536434 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20539 a!3186) j!159) mask!3328) (select (arr!20539 a!3186) j!159) a!3186 mask!3328) lt!353516))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!792050 (= lt!353516 (Intermediate!8095 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!792051 () Bool)

(declare-fun res!536422 () Bool)

(assert (=> b!792051 (=> (not res!536422) (not e!440241))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792051 (= res!536422 (validKeyInArray!0 k0!2102))))

(declare-fun b!792052 () Bool)

(declare-fun res!536432 () Bool)

(assert (=> b!792052 (=> (not res!536432) (not e!440238))))

(declare-datatypes ((List!14448 0))(
  ( (Nil!14445) (Cons!14444 (h!15579 (_ BitVec 64)) (t!20755 List!14448)) )
))
(declare-fun arrayNoDuplicates!0 (array!42916 (_ BitVec 32) List!14448) Bool)

(assert (=> b!792052 (= res!536432 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14445))))

(declare-fun b!792053 () Bool)

(declare-fun res!536425 () Bool)

(assert (=> b!792053 (=> (not res!536425) (not e!440241))))

(declare-fun arrayContainsKey!0 (array!42916 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792053 (= res!536425 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!792054 () Bool)

(declare-fun e!440237 () Bool)

(assert (=> b!792054 (= e!440240 e!440237)))

(declare-fun res!536429 () Bool)

(assert (=> b!792054 (=> (not res!536429) (not e!440237))))

(declare-fun lt!353519 () (_ BitVec 64))

(declare-fun lt!353517 () array!42916)

(assert (=> b!792054 (= res!536429 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!353519 mask!3328) lt!353519 lt!353517 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!353519 lt!353517 mask!3328)))))

(assert (=> b!792054 (= lt!353519 (select (store (arr!20539 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!792054 (= lt!353517 (array!42917 (store (arr!20539 a!3186) i!1173 k0!2102) (size!20959 a!3186)))))

(declare-fun lt!353520 () SeekEntryResult!8095)

(declare-fun b!792055 () Bool)

(declare-fun e!440235 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42916 (_ BitVec 32)) SeekEntryResult!8095)

(assert (=> b!792055 (= e!440235 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20539 a!3186) j!159) a!3186 mask!3328) lt!353520))))

(declare-fun b!792056 () Bool)

(declare-fun res!536431 () Bool)

(assert (=> b!792056 (=> (not res!536431) (not e!440238))))

(assert (=> b!792056 (= res!536431 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20959 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20959 a!3186))))))

(declare-fun b!792057 () Bool)

(declare-fun res!536436 () Bool)

(assert (=> b!792057 (=> (not res!536436) (not e!440240))))

(assert (=> b!792057 (= res!536436 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20539 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!792058 () Bool)

(declare-fun e!440242 () Bool)

(assert (=> b!792058 (= e!440242 e!440235)))

(declare-fun res!536423 () Bool)

(assert (=> b!792058 (=> (not res!536423) (not e!440235))))

(assert (=> b!792058 (= res!536423 (= (seekEntryOrOpen!0 (select (arr!20539 a!3186) j!159) a!3186 mask!3328) lt!353520))))

(assert (=> b!792058 (= lt!353520 (Found!8095 j!159))))

(declare-fun b!792059 () Bool)

(declare-fun res!536433 () Bool)

(assert (=> b!792059 (=> (not res!536433) (not e!440241))))

(assert (=> b!792059 (= res!536433 (validKeyInArray!0 (select (arr!20539 a!3186) j!159)))))

(declare-fun b!792060 () Bool)

(assert (=> b!792060 (= e!440237 (not true))))

(assert (=> b!792060 e!440242))

(declare-fun res!536424 () Bool)

(assert (=> b!792060 (=> (not res!536424) (not e!440242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42916 (_ BitVec 32)) Bool)

(assert (=> b!792060 (= res!536424 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!27421 0))(
  ( (Unit!27422) )
))
(declare-fun lt!353521 () Unit!27421)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42916 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27421)

(assert (=> b!792060 (= lt!353521 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!792061 () Bool)

(declare-fun res!536435 () Bool)

(assert (=> b!792061 (=> (not res!536435) (not e!440238))))

(assert (=> b!792061 (= res!536435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!792062 () Bool)

(assert (=> b!792062 (= e!440239 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20539 a!3186) j!159) a!3186 mask!3328) (Found!8095 j!159)))))

(declare-fun b!792063 () Bool)

(declare-fun res!536426 () Bool)

(assert (=> b!792063 (=> (not res!536426) (not e!440241))))

(assert (=> b!792063 (= res!536426 (and (= (size!20959 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20959 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20959 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!68122 res!536430) b!792063))

(assert (= (and b!792063 res!536426) b!792059))

(assert (= (and b!792059 res!536433) b!792051))

(assert (= (and b!792051 res!536422) b!792053))

(assert (= (and b!792053 res!536425) b!792048))

(assert (= (and b!792048 res!536427) b!792061))

(assert (= (and b!792061 res!536435) b!792052))

(assert (= (and b!792052 res!536432) b!792056))

(assert (= (and b!792056 res!536431) b!792050))

(assert (= (and b!792050 res!536434) b!792057))

(assert (= (and b!792057 res!536436) b!792047))

(assert (= (and b!792047 c!88226) b!792049))

(assert (= (and b!792047 (not c!88226)) b!792062))

(assert (= (and b!792047 res!536428) b!792054))

(assert (= (and b!792054 res!536429) b!792060))

(assert (= (and b!792060 res!536424) b!792058))

(assert (= (and b!792058 res!536423) b!792055))

(declare-fun m!733205 () Bool)

(assert (=> b!792048 m!733205))

(declare-fun m!733207 () Bool)

(assert (=> b!792060 m!733207))

(declare-fun m!733209 () Bool)

(assert (=> b!792060 m!733209))

(declare-fun m!733211 () Bool)

(assert (=> b!792061 m!733211))

(declare-fun m!733213 () Bool)

(assert (=> b!792059 m!733213))

(assert (=> b!792059 m!733213))

(declare-fun m!733215 () Bool)

(assert (=> b!792059 m!733215))

(declare-fun m!733217 () Bool)

(assert (=> b!792053 m!733217))

(declare-fun m!733219 () Bool)

(assert (=> b!792052 m!733219))

(declare-fun m!733221 () Bool)

(assert (=> start!68122 m!733221))

(declare-fun m!733223 () Bool)

(assert (=> start!68122 m!733223))

(assert (=> b!792055 m!733213))

(assert (=> b!792055 m!733213))

(declare-fun m!733225 () Bool)

(assert (=> b!792055 m!733225))

(assert (=> b!792058 m!733213))

(assert (=> b!792058 m!733213))

(declare-fun m!733227 () Bool)

(assert (=> b!792058 m!733227))

(assert (=> b!792050 m!733213))

(assert (=> b!792050 m!733213))

(declare-fun m!733229 () Bool)

(assert (=> b!792050 m!733229))

(assert (=> b!792050 m!733229))

(assert (=> b!792050 m!733213))

(declare-fun m!733231 () Bool)

(assert (=> b!792050 m!733231))

(assert (=> b!792062 m!733213))

(assert (=> b!792062 m!733213))

(declare-fun m!733233 () Bool)

(assert (=> b!792062 m!733233))

(declare-fun m!733235 () Bool)

(assert (=> b!792057 m!733235))

(declare-fun m!733237 () Bool)

(assert (=> b!792051 m!733237))

(assert (=> b!792049 m!733213))

(assert (=> b!792049 m!733213))

(declare-fun m!733239 () Bool)

(assert (=> b!792049 m!733239))

(declare-fun m!733241 () Bool)

(assert (=> b!792054 m!733241))

(declare-fun m!733243 () Bool)

(assert (=> b!792054 m!733243))

(declare-fun m!733245 () Bool)

(assert (=> b!792054 m!733245))

(declare-fun m!733247 () Bool)

(assert (=> b!792054 m!733247))

(assert (=> b!792054 m!733241))

(declare-fun m!733249 () Bool)

(assert (=> b!792054 m!733249))

(check-sat (not b!792054) (not b!792051) (not b!792059) (not b!792048) (not b!792052) (not b!792055) (not b!792058) (not b!792050) (not b!792061) (not b!792049) (not b!792060) (not b!792062) (not start!68122) (not b!792053))
(check-sat)
