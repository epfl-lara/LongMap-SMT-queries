; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120862 () Bool)

(assert start!120862)

(declare-fun b!1406288 () Bool)

(declare-fun res!944511 () Bool)

(declare-fun e!795967 () Bool)

(assert (=> b!1406288 (=> (not res!944511) (not e!795967))))

(declare-datatypes ((array!96169 0))(
  ( (array!96170 (arr!46432 (Array (_ BitVec 32) (_ BitVec 64))) (size!46982 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96169)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406288 (= res!944511 (validKeyInArray!0 (select (arr!46432 a!2901) j!112)))))

(declare-fun b!1406289 () Bool)

(declare-fun res!944507 () Bool)

(assert (=> b!1406289 (=> (not res!944507) (not e!795967))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1406289 (= res!944507 (and (= (size!46982 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46982 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46982 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406290 () Bool)

(declare-fun res!944512 () Bool)

(assert (=> b!1406290 (=> (not res!944512) (not e!795967))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96169 (_ BitVec 32)) Bool)

(assert (=> b!1406290 (= res!944512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406291 () Bool)

(declare-fun e!795968 () Bool)

(assert (=> b!1406291 (= e!795967 (not e!795968))))

(declare-fun res!944510 () Bool)

(assert (=> b!1406291 (=> res!944510 e!795968)))

(declare-datatypes ((SeekEntryResult!10743 0))(
  ( (MissingZero!10743 (index!45349 (_ BitVec 32))) (Found!10743 (index!45350 (_ BitVec 32))) (Intermediate!10743 (undefined!11555 Bool) (index!45351 (_ BitVec 32)) (x!126950 (_ BitVec 32))) (Undefined!10743) (MissingVacant!10743 (index!45352 (_ BitVec 32))) )
))
(declare-fun lt!619327 () SeekEntryResult!10743)

(assert (=> b!1406291 (= res!944510 (or (not (is-Intermediate!10743 lt!619327)) (undefined!11555 lt!619327)))))

(declare-fun e!795965 () Bool)

(assert (=> b!1406291 e!795965))

(declare-fun res!944508 () Bool)

(assert (=> b!1406291 (=> (not res!944508) (not e!795965))))

(assert (=> b!1406291 (= res!944508 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47460 0))(
  ( (Unit!47461) )
))
(declare-fun lt!619328 () Unit!47460)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96169 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47460)

(assert (=> b!1406291 (= lt!619328 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96169 (_ BitVec 32)) SeekEntryResult!10743)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406291 (= lt!619327 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46432 a!2901) j!112) mask!2840) (select (arr!46432 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406292 () Bool)

(declare-fun res!944505 () Bool)

(assert (=> b!1406292 (=> (not res!944505) (not e!795967))))

(declare-datatypes ((List!32951 0))(
  ( (Nil!32948) (Cons!32947 (h!34201 (_ BitVec 64)) (t!47645 List!32951)) )
))
(declare-fun arrayNoDuplicates!0 (array!96169 (_ BitVec 32) List!32951) Bool)

(assert (=> b!1406292 (= res!944505 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32948))))

(declare-fun b!1406293 () Bool)

(declare-fun res!944506 () Bool)

(assert (=> b!1406293 (=> (not res!944506) (not e!795967))))

(assert (=> b!1406293 (= res!944506 (validKeyInArray!0 (select (arr!46432 a!2901) i!1037)))))

(declare-fun b!1406294 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96169 (_ BitVec 32)) SeekEntryResult!10743)

(assert (=> b!1406294 (= e!795965 (= (seekEntryOrOpen!0 (select (arr!46432 a!2901) j!112) a!2901 mask!2840) (Found!10743 j!112)))))

(declare-fun b!1406295 () Bool)

(assert (=> b!1406295 (= e!795968 true)))

(declare-fun lt!619329 () SeekEntryResult!10743)

(assert (=> b!1406295 (= lt!619329 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46432 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46432 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96170 (store (arr!46432 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46982 a!2901)) mask!2840))))

(declare-fun res!944509 () Bool)

(assert (=> start!120862 (=> (not res!944509) (not e!795967))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120862 (= res!944509 (validMask!0 mask!2840))))

(assert (=> start!120862 e!795967))

(assert (=> start!120862 true))

(declare-fun array_inv!35460 (array!96169) Bool)

(assert (=> start!120862 (array_inv!35460 a!2901)))

(assert (= (and start!120862 res!944509) b!1406289))

(assert (= (and b!1406289 res!944507) b!1406293))

(assert (= (and b!1406293 res!944506) b!1406288))

(assert (= (and b!1406288 res!944511) b!1406290))

(assert (= (and b!1406290 res!944512) b!1406292))

(assert (= (and b!1406292 res!944505) b!1406291))

(assert (= (and b!1406291 res!944508) b!1406294))

(assert (= (and b!1406291 (not res!944510)) b!1406295))

(declare-fun m!1295369 () Bool)

(assert (=> b!1406292 m!1295369))

(declare-fun m!1295371 () Bool)

(assert (=> b!1406288 m!1295371))

(assert (=> b!1406288 m!1295371))

(declare-fun m!1295373 () Bool)

(assert (=> b!1406288 m!1295373))

(assert (=> b!1406291 m!1295371))

(declare-fun m!1295375 () Bool)

(assert (=> b!1406291 m!1295375))

(assert (=> b!1406291 m!1295371))

(declare-fun m!1295377 () Bool)

(assert (=> b!1406291 m!1295377))

(assert (=> b!1406291 m!1295375))

(assert (=> b!1406291 m!1295371))

(declare-fun m!1295379 () Bool)

(assert (=> b!1406291 m!1295379))

(declare-fun m!1295381 () Bool)

(assert (=> b!1406291 m!1295381))

(declare-fun m!1295383 () Bool)

(assert (=> start!120862 m!1295383))

(declare-fun m!1295385 () Bool)

(assert (=> start!120862 m!1295385))

(declare-fun m!1295387 () Bool)

(assert (=> b!1406295 m!1295387))

(declare-fun m!1295389 () Bool)

(assert (=> b!1406295 m!1295389))

(assert (=> b!1406295 m!1295389))

(declare-fun m!1295391 () Bool)

(assert (=> b!1406295 m!1295391))

(assert (=> b!1406295 m!1295391))

(assert (=> b!1406295 m!1295389))

(declare-fun m!1295393 () Bool)

(assert (=> b!1406295 m!1295393))

(declare-fun m!1295395 () Bool)

(assert (=> b!1406293 m!1295395))

(assert (=> b!1406293 m!1295395))

(declare-fun m!1295397 () Bool)

(assert (=> b!1406293 m!1295397))

(declare-fun m!1295399 () Bool)

(assert (=> b!1406290 m!1295399))

(assert (=> b!1406294 m!1295371))

(assert (=> b!1406294 m!1295371))

(declare-fun m!1295401 () Bool)

(assert (=> b!1406294 m!1295401))

(push 1)

(assert (not start!120862))

(assert (not b!1406293))

(assert (not b!1406292))

(assert (not b!1406288))

(assert (not b!1406295))

