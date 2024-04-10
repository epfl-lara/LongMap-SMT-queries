; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126648 () Bool)

(assert start!126648)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1486504 () Bool)

(declare-fun lt!648493 () (_ BitVec 64))

(declare-fun e!833308 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((array!99547 0))(
  ( (array!99548 (arr!48048 (Array (_ BitVec 32) (_ BitVec 64))) (size!48598 (_ BitVec 32))) )
))
(declare-fun lt!648489 () array!99547)

(declare-datatypes ((SeekEntryResult!12288 0))(
  ( (MissingZero!12288 (index!51544 (_ BitVec 32))) (Found!12288 (index!51545 (_ BitVec 32))) (Intermediate!12288 (undefined!13100 Bool) (index!51546 (_ BitVec 32)) (x!133128 (_ BitVec 32))) (Undefined!12288) (MissingVacant!12288 (index!51547 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99547 (_ BitVec 32)) SeekEntryResult!12288)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99547 (_ BitVec 32)) SeekEntryResult!12288)

(assert (=> b!1486504 (= e!833308 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648493 lt!648489 mask!2687) (seekEntryOrOpen!0 lt!648493 lt!648489 mask!2687)))))

(declare-fun b!1486505 () Bool)

(declare-fun res!1010863 () Bool)

(declare-fun e!833310 () Bool)

(assert (=> b!1486505 (=> (not res!1010863) (not e!833310))))

(declare-fun a!2862 () array!99547)

(declare-datatypes ((List!34549 0))(
  ( (Nil!34546) (Cons!34545 (h!35922 (_ BitVec 64)) (t!49243 List!34549)) )
))
(declare-fun arrayNoDuplicates!0 (array!99547 (_ BitVec 32) List!34549) Bool)

(assert (=> b!1486505 (= res!1010863 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34546))))

(declare-fun b!1486506 () Bool)

(declare-fun e!833305 () Bool)

(assert (=> b!1486506 (= e!833305 (= (seekEntryOrOpen!0 lt!648493 lt!648489 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648493 lt!648489 mask!2687)))))

(declare-fun b!1486507 () Bool)

(declare-fun res!1010865 () Bool)

(declare-fun e!833311 () Bool)

(assert (=> b!1486507 (=> (not res!1010865) (not e!833311))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1486507 (= res!1010865 (= (seekEntryOrOpen!0 (select (arr!48048 a!2862) j!93) a!2862 mask!2687) (Found!12288 j!93)))))

(declare-fun b!1486508 () Bool)

(declare-fun e!833309 () Bool)

(assert (=> b!1486508 (= e!833310 e!833309)))

(declare-fun res!1010852 () Bool)

(assert (=> b!1486508 (=> (not res!1010852) (not e!833309))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1486508 (= res!1010852 (= (select (store (arr!48048 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1486508 (= lt!648489 (array!99548 (store (arr!48048 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48598 a!2862)))))

(declare-fun b!1486509 () Bool)

(declare-fun res!1010850 () Bool)

(assert (=> b!1486509 (=> (not res!1010850) (not e!833310))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1486509 (= res!1010850 (validKeyInArray!0 (select (arr!48048 a!2862) j!93)))))

(declare-fun res!1010857 () Bool)

(assert (=> start!126648 (=> (not res!1010857) (not e!833310))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126648 (= res!1010857 (validMask!0 mask!2687))))

(assert (=> start!126648 e!833310))

(assert (=> start!126648 true))

(declare-fun array_inv!37076 (array!99547) Bool)

(assert (=> start!126648 (array_inv!37076 a!2862)))

(declare-fun b!1486510 () Bool)

(declare-fun res!1010854 () Bool)

(assert (=> b!1486510 (=> (not res!1010854) (not e!833310))))

(assert (=> b!1486510 (= res!1010854 (validKeyInArray!0 (select (arr!48048 a!2862) i!1006)))))

(declare-fun b!1486511 () Bool)

(declare-fun e!833307 () Bool)

(assert (=> b!1486511 (= e!833311 e!833307)))

(declare-fun res!1010855 () Bool)

(assert (=> b!1486511 (=> res!1010855 e!833307)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!648490 () (_ BitVec 64))

(assert (=> b!1486511 (= res!1010855 (or (and (= (select (arr!48048 a!2862) index!646) lt!648490) (= (select (arr!48048 a!2862) index!646) (select (arr!48048 a!2862) j!93))) (= (select (arr!48048 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1486511 (= lt!648490 (select (store (arr!48048 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1486512 () Bool)

(declare-fun e!833304 () Bool)

(declare-fun e!833306 () Bool)

(assert (=> b!1486512 (= e!833304 e!833306)))

(declare-fun res!1010848 () Bool)

(assert (=> b!1486512 (=> (not res!1010848) (not e!833306))))

(declare-fun lt!648492 () SeekEntryResult!12288)

(assert (=> b!1486512 (= res!1010848 (= lt!648492 (Intermediate!12288 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99547 (_ BitVec 32)) SeekEntryResult!12288)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486512 (= lt!648492 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648493 mask!2687) lt!648493 lt!648489 mask!2687))))

(assert (=> b!1486512 (= lt!648493 (select (store (arr!48048 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1486513 () Bool)

(assert (=> b!1486513 (= e!833308 (= lt!648492 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648493 lt!648489 mask!2687)))))

(declare-fun b!1486514 () Bool)

(declare-fun e!833303 () Bool)

(assert (=> b!1486514 (= e!833303 true)))

(declare-fun lt!648491 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486514 (= lt!648491 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1486515 () Bool)

(declare-fun res!1010864 () Bool)

(assert (=> b!1486515 (=> (not res!1010864) (not e!833310))))

(assert (=> b!1486515 (= res!1010864 (and (= (size!48598 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48598 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48598 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1486516 () Bool)

(assert (=> b!1486516 (= e!833307 e!833305)))

(declare-fun res!1010858 () Bool)

(assert (=> b!1486516 (=> (not res!1010858) (not e!833305))))

(assert (=> b!1486516 (= res!1010858 (and (= index!646 intermediateAfterIndex!19) (= lt!648490 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1486517 () Bool)

(declare-fun res!1010856 () Bool)

(assert (=> b!1486517 (=> (not res!1010856) (not e!833310))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99547 (_ BitVec 32)) Bool)

(assert (=> b!1486517 (= res!1010856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1486518 () Bool)

(declare-fun res!1010866 () Bool)

(assert (=> b!1486518 (=> (not res!1010866) (not e!833310))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1486518 (= res!1010866 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48598 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48598 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48598 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1486519 () Bool)

(declare-fun res!1010849 () Bool)

(assert (=> b!1486519 (=> (not res!1010849) (not e!833304))))

(declare-fun lt!648494 () SeekEntryResult!12288)

(assert (=> b!1486519 (= res!1010849 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48048 a!2862) j!93) a!2862 mask!2687) lt!648494))))

(declare-fun b!1486520 () Bool)

(declare-fun res!1010860 () Bool)

(assert (=> b!1486520 (=> (not res!1010860) (not e!833311))))

(assert (=> b!1486520 (= res!1010860 (or (= (select (arr!48048 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48048 a!2862) intermediateBeforeIndex!19) (select (arr!48048 a!2862) j!93))))))

(declare-fun b!1486521 () Bool)

(declare-fun res!1010859 () Bool)

(assert (=> b!1486521 (=> (not res!1010859) (not e!833306))))

(assert (=> b!1486521 (= res!1010859 e!833308)))

(declare-fun c!137352 () Bool)

(assert (=> b!1486521 (= c!137352 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1486522 () Bool)

(declare-fun res!1010853 () Bool)

(assert (=> b!1486522 (=> (not res!1010853) (not e!833306))))

(assert (=> b!1486522 (= res!1010853 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1486523 () Bool)

(assert (=> b!1486523 (= e!833306 (not e!833303))))

(declare-fun res!1010862 () Bool)

(assert (=> b!1486523 (=> res!1010862 e!833303)))

(assert (=> b!1486523 (= res!1010862 (or (and (= (select (arr!48048 a!2862) index!646) (select (store (arr!48048 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48048 a!2862) index!646) (select (arr!48048 a!2862) j!93))) (= (select (arr!48048 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1486523 e!833311))

(declare-fun res!1010861 () Bool)

(assert (=> b!1486523 (=> (not res!1010861) (not e!833311))))

(assert (=> b!1486523 (= res!1010861 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49916 0))(
  ( (Unit!49917) )
))
(declare-fun lt!648495 () Unit!49916)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99547 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49916)

(assert (=> b!1486523 (= lt!648495 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1486524 () Bool)

(assert (=> b!1486524 (= e!833309 e!833304)))

(declare-fun res!1010851 () Bool)

(assert (=> b!1486524 (=> (not res!1010851) (not e!833304))))

(assert (=> b!1486524 (= res!1010851 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48048 a!2862) j!93) mask!2687) (select (arr!48048 a!2862) j!93) a!2862 mask!2687) lt!648494))))

(assert (=> b!1486524 (= lt!648494 (Intermediate!12288 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!126648 res!1010857) b!1486515))

(assert (= (and b!1486515 res!1010864) b!1486510))

(assert (= (and b!1486510 res!1010854) b!1486509))

(assert (= (and b!1486509 res!1010850) b!1486517))

(assert (= (and b!1486517 res!1010856) b!1486505))

(assert (= (and b!1486505 res!1010863) b!1486518))

(assert (= (and b!1486518 res!1010866) b!1486508))

(assert (= (and b!1486508 res!1010852) b!1486524))

(assert (= (and b!1486524 res!1010851) b!1486519))

(assert (= (and b!1486519 res!1010849) b!1486512))

(assert (= (and b!1486512 res!1010848) b!1486521))

(assert (= (and b!1486521 c!137352) b!1486513))

(assert (= (and b!1486521 (not c!137352)) b!1486504))

(assert (= (and b!1486521 res!1010859) b!1486522))

(assert (= (and b!1486522 res!1010853) b!1486523))

(assert (= (and b!1486523 res!1010861) b!1486507))

(assert (= (and b!1486507 res!1010865) b!1486520))

(assert (= (and b!1486520 res!1010860) b!1486511))

(assert (= (and b!1486511 (not res!1010855)) b!1486516))

(assert (= (and b!1486516 res!1010858) b!1486506))

(assert (= (and b!1486523 (not res!1010862)) b!1486514))

(declare-fun m!1371371 () Bool)

(assert (=> b!1486511 m!1371371))

(declare-fun m!1371373 () Bool)

(assert (=> b!1486511 m!1371373))

(declare-fun m!1371375 () Bool)

(assert (=> b!1486511 m!1371375))

(declare-fun m!1371377 () Bool)

(assert (=> b!1486511 m!1371377))

(declare-fun m!1371379 () Bool)

(assert (=> b!1486504 m!1371379))

(declare-fun m!1371381 () Bool)

(assert (=> b!1486504 m!1371381))

(declare-fun m!1371383 () Bool)

(assert (=> start!126648 m!1371383))

(declare-fun m!1371385 () Bool)

(assert (=> start!126648 m!1371385))

(declare-fun m!1371387 () Bool)

(assert (=> b!1486513 m!1371387))

(declare-fun m!1371389 () Bool)

(assert (=> b!1486520 m!1371389))

(assert (=> b!1486520 m!1371373))

(declare-fun m!1371391 () Bool)

(assert (=> b!1486523 m!1371391))

(assert (=> b!1486523 m!1371375))

(assert (=> b!1486523 m!1371377))

(assert (=> b!1486523 m!1371371))

(declare-fun m!1371393 () Bool)

(assert (=> b!1486523 m!1371393))

(assert (=> b!1486523 m!1371373))

(declare-fun m!1371395 () Bool)

(assert (=> b!1486517 m!1371395))

(assert (=> b!1486519 m!1371373))

(assert (=> b!1486519 m!1371373))

(declare-fun m!1371397 () Bool)

(assert (=> b!1486519 m!1371397))

(declare-fun m!1371399 () Bool)

(assert (=> b!1486505 m!1371399))

(assert (=> b!1486508 m!1371375))

(declare-fun m!1371401 () Bool)

(assert (=> b!1486508 m!1371401))

(declare-fun m!1371403 () Bool)

(assert (=> b!1486512 m!1371403))

(assert (=> b!1486512 m!1371403))

(declare-fun m!1371405 () Bool)

(assert (=> b!1486512 m!1371405))

(assert (=> b!1486512 m!1371375))

(declare-fun m!1371407 () Bool)

(assert (=> b!1486512 m!1371407))

(assert (=> b!1486506 m!1371381))

(assert (=> b!1486506 m!1371379))

(declare-fun m!1371409 () Bool)

(assert (=> b!1486514 m!1371409))

(assert (=> b!1486509 m!1371373))

(assert (=> b!1486509 m!1371373))

(declare-fun m!1371411 () Bool)

(assert (=> b!1486509 m!1371411))

(assert (=> b!1486507 m!1371373))

(assert (=> b!1486507 m!1371373))

(declare-fun m!1371413 () Bool)

(assert (=> b!1486507 m!1371413))

(declare-fun m!1371415 () Bool)

(assert (=> b!1486510 m!1371415))

(assert (=> b!1486510 m!1371415))

(declare-fun m!1371417 () Bool)

(assert (=> b!1486510 m!1371417))

(assert (=> b!1486524 m!1371373))

(assert (=> b!1486524 m!1371373))

(declare-fun m!1371419 () Bool)

(assert (=> b!1486524 m!1371419))

(assert (=> b!1486524 m!1371419))

(assert (=> b!1486524 m!1371373))

(declare-fun m!1371421 () Bool)

(assert (=> b!1486524 m!1371421))

(check-sat (not b!1486504) (not b!1486524) (not start!126648) (not b!1486517) (not b!1486506) (not b!1486514) (not b!1486519) (not b!1486505) (not b!1486510) (not b!1486507) (not b!1486513) (not b!1486512) (not b!1486523) (not b!1486509))
(check-sat)
