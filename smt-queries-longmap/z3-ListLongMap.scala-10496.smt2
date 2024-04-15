; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123536 () Bool)

(assert start!123536)

(declare-fun b!1432277 () Bool)

(declare-fun res!966259 () Bool)

(declare-fun e!808507 () Bool)

(assert (=> b!1432277 (=> (not res!966259) (not e!808507))))

(declare-datatypes ((array!97473 0))(
  ( (array!97474 (arr!47044 (Array (_ BitVec 32) (_ BitVec 64))) (size!47596 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97473)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1432277 (= res!966259 (validKeyInArray!0 (select (arr!47044 a!2831) j!81)))))

(declare-fun b!1432278 () Bool)

(declare-fun e!808508 () Bool)

(declare-fun e!808512 () Bool)

(assert (=> b!1432278 (= e!808508 (not e!808512))))

(declare-fun res!966249 () Bool)

(assert (=> b!1432278 (=> res!966249 e!808512)))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1432278 (= res!966249 (or (= (select (arr!47044 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47044 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47044 a!2831) index!585) (select (arr!47044 a!2831) j!81)) (= (select (store (arr!47044 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!808510 () Bool)

(assert (=> b!1432278 e!808510))

(declare-fun res!966257 () Bool)

(assert (=> b!1432278 (=> (not res!966257) (not e!808510))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97473 (_ BitVec 32)) Bool)

(assert (=> b!1432278 (= res!966257 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48285 0))(
  ( (Unit!48286) )
))
(declare-fun lt!630373 () Unit!48285)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97473 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48285)

(assert (=> b!1432278 (= lt!630373 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1432279 () Bool)

(declare-fun res!966248 () Bool)

(assert (=> b!1432279 (=> (not res!966248) (not e!808507))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1432279 (= res!966248 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47596 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47596 a!2831))))))

(declare-fun b!1432280 () Bool)

(declare-fun res!966251 () Bool)

(assert (=> b!1432280 (=> (not res!966251) (not e!808508))))

(declare-datatypes ((SeekEntryResult!11350 0))(
  ( (MissingZero!11350 (index!47792 (_ BitVec 32))) (Found!11350 (index!47793 (_ BitVec 32))) (Intermediate!11350 (undefined!12162 Bool) (index!47794 (_ BitVec 32)) (x!129427 (_ BitVec 32))) (Undefined!11350) (MissingVacant!11350 (index!47795 (_ BitVec 32))) )
))
(declare-fun lt!630371 () SeekEntryResult!11350)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97473 (_ BitVec 32)) SeekEntryResult!11350)

(assert (=> b!1432280 (= res!966251 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47044 a!2831) j!81) a!2831 mask!2608) lt!630371))))

(declare-fun b!1432281 () Bool)

(declare-fun res!966250 () Bool)

(assert (=> b!1432281 (=> (not res!966250) (not e!808507))))

(declare-datatypes ((List!33632 0))(
  ( (Nil!33629) (Cons!33628 (h!34951 (_ BitVec 64)) (t!48318 List!33632)) )
))
(declare-fun arrayNoDuplicates!0 (array!97473 (_ BitVec 32) List!33632) Bool)

(assert (=> b!1432281 (= res!966250 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33629))))

(declare-fun b!1432282 () Bool)

(declare-fun e!808511 () Bool)

(assert (=> b!1432282 (= e!808511 e!808508)))

(declare-fun res!966252 () Bool)

(assert (=> b!1432282 (=> (not res!966252) (not e!808508))))

(declare-fun lt!630370 () SeekEntryResult!11350)

(declare-fun lt!630372 () (_ BitVec 64))

(declare-fun lt!630374 () array!97473)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432282 (= res!966252 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630372 mask!2608) lt!630372 lt!630374 mask!2608) lt!630370))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1432282 (= lt!630370 (Intermediate!11350 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1432282 (= lt!630372 (select (store (arr!47044 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1432282 (= lt!630374 (array!97474 (store (arr!47044 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47596 a!2831)))))

(declare-fun b!1432284 () Bool)

(declare-fun res!966246 () Bool)

(assert (=> b!1432284 (=> (not res!966246) (not e!808507))))

(assert (=> b!1432284 (= res!966246 (validKeyInArray!0 (select (arr!47044 a!2831) i!982)))))

(declare-fun b!1432285 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97473 (_ BitVec 32)) SeekEntryResult!11350)

(assert (=> b!1432285 (= e!808510 (= (seekEntryOrOpen!0 (select (arr!47044 a!2831) j!81) a!2831 mask!2608) (Found!11350 j!81)))))

(declare-fun b!1432286 () Bool)

(declare-fun res!966256 () Bool)

(assert (=> b!1432286 (=> (not res!966256) (not e!808508))))

(assert (=> b!1432286 (= res!966256 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630372 lt!630374 mask!2608) lt!630370))))

(declare-fun b!1432287 () Bool)

(declare-fun res!966247 () Bool)

(assert (=> b!1432287 (=> (not res!966247) (not e!808508))))

(assert (=> b!1432287 (= res!966247 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun res!966258 () Bool)

(assert (=> start!123536 (=> (not res!966258) (not e!808507))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123536 (= res!966258 (validMask!0 mask!2608))))

(assert (=> start!123536 e!808507))

(assert (=> start!123536 true))

(declare-fun array_inv!36277 (array!97473) Bool)

(assert (=> start!123536 (array_inv!36277 a!2831)))

(declare-fun b!1432283 () Bool)

(declare-fun res!966253 () Bool)

(assert (=> b!1432283 (=> (not res!966253) (not e!808507))))

(assert (=> b!1432283 (= res!966253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1432288 () Bool)

(assert (=> b!1432288 (= e!808512 true)))

(declare-fun lt!630375 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432288 (= lt!630375 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1432289 () Bool)

(assert (=> b!1432289 (= e!808507 e!808511)))

(declare-fun res!966255 () Bool)

(assert (=> b!1432289 (=> (not res!966255) (not e!808511))))

(assert (=> b!1432289 (= res!966255 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47044 a!2831) j!81) mask!2608) (select (arr!47044 a!2831) j!81) a!2831 mask!2608) lt!630371))))

(assert (=> b!1432289 (= lt!630371 (Intermediate!11350 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1432290 () Bool)

(declare-fun res!966254 () Bool)

(assert (=> b!1432290 (=> (not res!966254) (not e!808507))))

(assert (=> b!1432290 (= res!966254 (and (= (size!47596 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47596 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47596 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!123536 res!966258) b!1432290))

(assert (= (and b!1432290 res!966254) b!1432284))

(assert (= (and b!1432284 res!966246) b!1432277))

(assert (= (and b!1432277 res!966259) b!1432283))

(assert (= (and b!1432283 res!966253) b!1432281))

(assert (= (and b!1432281 res!966250) b!1432279))

(assert (= (and b!1432279 res!966248) b!1432289))

(assert (= (and b!1432289 res!966255) b!1432282))

(assert (= (and b!1432282 res!966252) b!1432280))

(assert (= (and b!1432280 res!966251) b!1432286))

(assert (= (and b!1432286 res!966256) b!1432287))

(assert (= (and b!1432287 res!966247) b!1432278))

(assert (= (and b!1432278 res!966257) b!1432285))

(assert (= (and b!1432278 (not res!966249)) b!1432288))

(declare-fun m!1321601 () Bool)

(assert (=> b!1432282 m!1321601))

(assert (=> b!1432282 m!1321601))

(declare-fun m!1321603 () Bool)

(assert (=> b!1432282 m!1321603))

(declare-fun m!1321605 () Bool)

(assert (=> b!1432282 m!1321605))

(declare-fun m!1321607 () Bool)

(assert (=> b!1432282 m!1321607))

(declare-fun m!1321609 () Bool)

(assert (=> b!1432277 m!1321609))

(assert (=> b!1432277 m!1321609))

(declare-fun m!1321611 () Bool)

(assert (=> b!1432277 m!1321611))

(declare-fun m!1321613 () Bool)

(assert (=> b!1432286 m!1321613))

(declare-fun m!1321615 () Bool)

(assert (=> b!1432284 m!1321615))

(assert (=> b!1432284 m!1321615))

(declare-fun m!1321617 () Bool)

(assert (=> b!1432284 m!1321617))

(declare-fun m!1321619 () Bool)

(assert (=> b!1432288 m!1321619))

(assert (=> b!1432285 m!1321609))

(assert (=> b!1432285 m!1321609))

(declare-fun m!1321621 () Bool)

(assert (=> b!1432285 m!1321621))

(declare-fun m!1321623 () Bool)

(assert (=> start!123536 m!1321623))

(declare-fun m!1321625 () Bool)

(assert (=> start!123536 m!1321625))

(assert (=> b!1432278 m!1321605))

(declare-fun m!1321627 () Bool)

(assert (=> b!1432278 m!1321627))

(declare-fun m!1321629 () Bool)

(assert (=> b!1432278 m!1321629))

(declare-fun m!1321631 () Bool)

(assert (=> b!1432278 m!1321631))

(assert (=> b!1432278 m!1321609))

(declare-fun m!1321633 () Bool)

(assert (=> b!1432278 m!1321633))

(assert (=> b!1432280 m!1321609))

(assert (=> b!1432280 m!1321609))

(declare-fun m!1321635 () Bool)

(assert (=> b!1432280 m!1321635))

(declare-fun m!1321637 () Bool)

(assert (=> b!1432283 m!1321637))

(declare-fun m!1321639 () Bool)

(assert (=> b!1432281 m!1321639))

(assert (=> b!1432289 m!1321609))

(assert (=> b!1432289 m!1321609))

(declare-fun m!1321641 () Bool)

(assert (=> b!1432289 m!1321641))

(assert (=> b!1432289 m!1321641))

(assert (=> b!1432289 m!1321609))

(declare-fun m!1321643 () Bool)

(assert (=> b!1432289 m!1321643))

(check-sat (not b!1432280) (not b!1432288) (not b!1432283) (not b!1432286) (not b!1432282) (not b!1432289) (not b!1432277) (not b!1432281) (not start!123536) (not b!1432278) (not b!1432285) (not b!1432284))
(check-sat)
