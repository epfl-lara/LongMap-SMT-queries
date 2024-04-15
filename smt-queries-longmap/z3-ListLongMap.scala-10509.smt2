; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123854 () Bool)

(assert start!123854)

(declare-fun b!1435283 () Bool)

(declare-fun res!968394 () Bool)

(declare-fun e!810043 () Bool)

(assert (=> b!1435283 (=> (not res!968394) (not e!810043))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1435283 (= res!968394 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun res!968408 () Bool)

(declare-fun e!810045 () Bool)

(assert (=> start!123854 (=> (not res!968408) (not e!810045))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123854 (= res!968408 (validMask!0 mask!2608))))

(assert (=> start!123854 e!810045))

(assert (=> start!123854 true))

(declare-datatypes ((array!97563 0))(
  ( (array!97564 (arr!47083 (Array (_ BitVec 32) (_ BitVec 64))) (size!47635 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97563)

(declare-fun array_inv!36316 (array!97563) Bool)

(assert (=> start!123854 (array_inv!36316 a!2831)))

(declare-fun b!1435284 () Bool)

(declare-fun res!968395 () Bool)

(assert (=> b!1435284 (=> (not res!968395) (not e!810045))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97563 (_ BitVec 32)) Bool)

(assert (=> b!1435284 (= res!968395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1435285 () Bool)

(declare-fun e!810042 () Bool)

(declare-fun e!810041 () Bool)

(assert (=> b!1435285 (= e!810042 e!810041)))

(declare-fun res!968402 () Bool)

(assert (=> b!1435285 (=> res!968402 e!810041)))

(declare-fun lt!631664 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1435285 (= res!968402 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!631664 #b00000000000000000000000000000000) (bvsge lt!631664 (size!47635 a!2831))))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1435285 (= lt!631664 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1435286 () Bool)

(declare-fun res!968404 () Bool)

(assert (=> b!1435286 (=> (not res!968404) (not e!810043))))

(declare-fun lt!631663 () array!97563)

(declare-datatypes ((SeekEntryResult!11389 0))(
  ( (MissingZero!11389 (index!47948 (_ BitVec 32))) (Found!11389 (index!47949 (_ BitVec 32))) (Intermediate!11389 (undefined!12201 Bool) (index!47950 (_ BitVec 32)) (x!129606 (_ BitVec 32))) (Undefined!11389) (MissingVacant!11389 (index!47951 (_ BitVec 32))) )
))
(declare-fun lt!631666 () SeekEntryResult!11389)

(declare-fun lt!631668 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97563 (_ BitVec 32)) SeekEntryResult!11389)

(assert (=> b!1435286 (= res!968404 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631668 lt!631663 mask!2608) lt!631666))))

(declare-fun b!1435287 () Bool)

(declare-fun e!810040 () Bool)

(assert (=> b!1435287 (= e!810040 e!810043)))

(declare-fun res!968409 () Bool)

(assert (=> b!1435287 (=> (not res!968409) (not e!810043))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1435287 (= res!968409 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631668 mask!2608) lt!631668 lt!631663 mask!2608) lt!631666))))

(assert (=> b!1435287 (= lt!631666 (Intermediate!11389 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1435287 (= lt!631668 (select (store (arr!47083 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1435287 (= lt!631663 (array!97564 (store (arr!47083 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47635 a!2831)))))

(declare-fun b!1435288 () Bool)

(declare-fun res!968410 () Bool)

(assert (=> b!1435288 (=> (not res!968410) (not e!810045))))

(assert (=> b!1435288 (= res!968410 (and (= (size!47635 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47635 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47635 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1435289 () Bool)

(assert (=> b!1435289 (= e!810041 (bvslt (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!605)) (bvsub #b01111111111111111111111111111110 x!605)))))

(declare-fun b!1435290 () Bool)

(declare-fun res!968403 () Bool)

(assert (=> b!1435290 (=> (not res!968403) (not e!810045))))

(declare-datatypes ((List!33671 0))(
  ( (Nil!33668) (Cons!33667 (h!35002 (_ BitVec 64)) (t!48357 List!33671)) )
))
(declare-fun arrayNoDuplicates!0 (array!97563 (_ BitVec 32) List!33671) Bool)

(assert (=> b!1435290 (= res!968403 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33668))))

(declare-fun b!1435291 () Bool)

(assert (=> b!1435291 (= e!810045 e!810040)))

(declare-fun res!968405 () Bool)

(assert (=> b!1435291 (=> (not res!968405) (not e!810040))))

(declare-fun lt!631665 () SeekEntryResult!11389)

(assert (=> b!1435291 (= res!968405 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47083 a!2831) j!81) mask!2608) (select (arr!47083 a!2831) j!81) a!2831 mask!2608) lt!631665))))

(assert (=> b!1435291 (= lt!631665 (Intermediate!11389 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1435292 () Bool)

(declare-fun res!968400 () Bool)

(assert (=> b!1435292 (=> res!968400 e!810041)))

(assert (=> b!1435292 (= res!968400 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631664 (select (arr!47083 a!2831) j!81) a!2831 mask!2608) lt!631665)))))

(declare-fun b!1435293 () Bool)

(declare-fun res!968397 () Bool)

(assert (=> b!1435293 (=> (not res!968397) (not e!810045))))

(assert (=> b!1435293 (= res!968397 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47635 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47635 a!2831))))))

(declare-fun b!1435294 () Bool)

(declare-fun res!968398 () Bool)

(assert (=> b!1435294 (=> (not res!968398) (not e!810045))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1435294 (= res!968398 (validKeyInArray!0 (select (arr!47083 a!2831) j!81)))))

(declare-fun b!1435295 () Bool)

(declare-fun e!810044 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97563 (_ BitVec 32)) SeekEntryResult!11389)

(assert (=> b!1435295 (= e!810044 (= (seekEntryOrOpen!0 (select (arr!47083 a!2831) j!81) a!2831 mask!2608) (Found!11389 j!81)))))

(declare-fun b!1435296 () Bool)

(assert (=> b!1435296 (= e!810043 (not e!810042))))

(declare-fun res!968401 () Bool)

(assert (=> b!1435296 (=> res!968401 e!810042)))

(assert (=> b!1435296 (= res!968401 (or (= (select (arr!47083 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47083 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47083 a!2831) index!585) (select (arr!47083 a!2831) j!81)) (= (select (store (arr!47083 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1435296 e!810044))

(declare-fun res!968407 () Bool)

(assert (=> b!1435296 (=> (not res!968407) (not e!810044))))

(assert (=> b!1435296 (= res!968407 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48363 0))(
  ( (Unit!48364) )
))
(declare-fun lt!631667 () Unit!48363)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97563 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48363)

(assert (=> b!1435296 (= lt!631667 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1435297 () Bool)

(declare-fun res!968399 () Bool)

(assert (=> b!1435297 (=> res!968399 e!810041)))

(assert (=> b!1435297 (= res!968399 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631664 lt!631668 lt!631663 mask!2608) lt!631666)))))

(declare-fun b!1435298 () Bool)

(declare-fun res!968396 () Bool)

(assert (=> b!1435298 (=> (not res!968396) (not e!810043))))

(assert (=> b!1435298 (= res!968396 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47083 a!2831) j!81) a!2831 mask!2608) lt!631665))))

(declare-fun b!1435299 () Bool)

(declare-fun res!968406 () Bool)

(assert (=> b!1435299 (=> (not res!968406) (not e!810045))))

(assert (=> b!1435299 (= res!968406 (validKeyInArray!0 (select (arr!47083 a!2831) i!982)))))

(assert (= (and start!123854 res!968408) b!1435288))

(assert (= (and b!1435288 res!968410) b!1435299))

(assert (= (and b!1435299 res!968406) b!1435294))

(assert (= (and b!1435294 res!968398) b!1435284))

(assert (= (and b!1435284 res!968395) b!1435290))

(assert (= (and b!1435290 res!968403) b!1435293))

(assert (= (and b!1435293 res!968397) b!1435291))

(assert (= (and b!1435291 res!968405) b!1435287))

(assert (= (and b!1435287 res!968409) b!1435298))

(assert (= (and b!1435298 res!968396) b!1435286))

(assert (= (and b!1435286 res!968404) b!1435283))

(assert (= (and b!1435283 res!968394) b!1435296))

(assert (= (and b!1435296 res!968407) b!1435295))

(assert (= (and b!1435296 (not res!968401)) b!1435285))

(assert (= (and b!1435285 (not res!968402)) b!1435292))

(assert (= (and b!1435292 (not res!968400)) b!1435297))

(assert (= (and b!1435297 (not res!968399)) b!1435289))

(declare-fun m!1324157 () Bool)

(assert (=> b!1435285 m!1324157))

(declare-fun m!1324159 () Bool)

(assert (=> b!1435297 m!1324159))

(declare-fun m!1324161 () Bool)

(assert (=> start!123854 m!1324161))

(declare-fun m!1324163 () Bool)

(assert (=> start!123854 m!1324163))

(declare-fun m!1324165 () Bool)

(assert (=> b!1435299 m!1324165))

(assert (=> b!1435299 m!1324165))

(declare-fun m!1324167 () Bool)

(assert (=> b!1435299 m!1324167))

(declare-fun m!1324169 () Bool)

(assert (=> b!1435296 m!1324169))

(declare-fun m!1324171 () Bool)

(assert (=> b!1435296 m!1324171))

(declare-fun m!1324173 () Bool)

(assert (=> b!1435296 m!1324173))

(declare-fun m!1324175 () Bool)

(assert (=> b!1435296 m!1324175))

(declare-fun m!1324177 () Bool)

(assert (=> b!1435296 m!1324177))

(declare-fun m!1324179 () Bool)

(assert (=> b!1435296 m!1324179))

(assert (=> b!1435291 m!1324177))

(assert (=> b!1435291 m!1324177))

(declare-fun m!1324181 () Bool)

(assert (=> b!1435291 m!1324181))

(assert (=> b!1435291 m!1324181))

(assert (=> b!1435291 m!1324177))

(declare-fun m!1324183 () Bool)

(assert (=> b!1435291 m!1324183))

(assert (=> b!1435294 m!1324177))

(assert (=> b!1435294 m!1324177))

(declare-fun m!1324185 () Bool)

(assert (=> b!1435294 m!1324185))

(declare-fun m!1324187 () Bool)

(assert (=> b!1435284 m!1324187))

(assert (=> b!1435292 m!1324177))

(assert (=> b!1435292 m!1324177))

(declare-fun m!1324189 () Bool)

(assert (=> b!1435292 m!1324189))

(declare-fun m!1324191 () Bool)

(assert (=> b!1435286 m!1324191))

(declare-fun m!1324193 () Bool)

(assert (=> b!1435287 m!1324193))

(assert (=> b!1435287 m!1324193))

(declare-fun m!1324195 () Bool)

(assert (=> b!1435287 m!1324195))

(assert (=> b!1435287 m!1324169))

(declare-fun m!1324197 () Bool)

(assert (=> b!1435287 m!1324197))

(declare-fun m!1324199 () Bool)

(assert (=> b!1435290 m!1324199))

(assert (=> b!1435298 m!1324177))

(assert (=> b!1435298 m!1324177))

(declare-fun m!1324201 () Bool)

(assert (=> b!1435298 m!1324201))

(assert (=> b!1435295 m!1324177))

(assert (=> b!1435295 m!1324177))

(declare-fun m!1324203 () Bool)

(assert (=> b!1435295 m!1324203))

(check-sat (not b!1435284) (not b!1435290) (not b!1435299) (not b!1435295) (not b!1435287) (not start!123854) (not b!1435292) (not b!1435285) (not b!1435286) (not b!1435297) (not b!1435294) (not b!1435298) (not b!1435291) (not b!1435296))
(check-sat)
