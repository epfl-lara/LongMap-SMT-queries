; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122202 () Bool)

(assert start!122202)

(declare-fun res!953371 () Bool)

(declare-fun e!802294 () Bool)

(assert (=> start!122202 (=> (not res!953371) (not e!802294))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122202 (= res!953371 (validMask!0 mask!2840))))

(assert (=> start!122202 e!802294))

(assert (=> start!122202 true))

(declare-datatypes ((array!96786 0))(
  ( (array!96787 (arr!46721 (Array (_ BitVec 32) (_ BitVec 64))) (size!47271 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96786)

(declare-fun array_inv!35749 (array!96786) Bool)

(assert (=> start!122202 (array_inv!35749 a!2901)))

(declare-fun b!1417635 () Bool)

(assert (=> b!1417635 (= e!802294 (not true))))

(declare-fun e!802293 () Bool)

(assert (=> b!1417635 e!802293))

(declare-fun res!953369 () Bool)

(assert (=> b!1417635 (=> (not res!953369) (not e!802293))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96786 (_ BitVec 32)) Bool)

(assert (=> b!1417635 (= res!953369 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!48038 0))(
  ( (Unit!48039) )
))
(declare-fun lt!625427 () Unit!48038)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96786 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48038)

(assert (=> b!1417635 (= lt!625427 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!11032 0))(
  ( (MissingZero!11032 (index!46520 (_ BitVec 32))) (Found!11032 (index!46521 (_ BitVec 32))) (Intermediate!11032 (undefined!11844 Bool) (index!46522 (_ BitVec 32)) (x!128123 (_ BitVec 32))) (Undefined!11032) (MissingVacant!11032 (index!46523 (_ BitVec 32))) )
))
(declare-fun lt!625428 () SeekEntryResult!11032)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96786 (_ BitVec 32)) SeekEntryResult!11032)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417635 (= lt!625428 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46721 a!2901) j!112) mask!2840) (select (arr!46721 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1417636 () Bool)

(declare-fun res!953365 () Bool)

(assert (=> b!1417636 (=> (not res!953365) (not e!802294))))

(assert (=> b!1417636 (= res!953365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1417637 () Bool)

(declare-fun res!953367 () Bool)

(assert (=> b!1417637 (=> (not res!953367) (not e!802294))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417637 (= res!953367 (validKeyInArray!0 (select (arr!46721 a!2901) i!1037)))))

(declare-fun b!1417638 () Bool)

(declare-fun res!953366 () Bool)

(assert (=> b!1417638 (=> (not res!953366) (not e!802294))))

(declare-datatypes ((List!33240 0))(
  ( (Nil!33237) (Cons!33236 (h!34529 (_ BitVec 64)) (t!47934 List!33240)) )
))
(declare-fun arrayNoDuplicates!0 (array!96786 (_ BitVec 32) List!33240) Bool)

(assert (=> b!1417638 (= res!953366 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33237))))

(declare-fun b!1417639 () Bool)

(declare-fun res!953370 () Bool)

(assert (=> b!1417639 (=> (not res!953370) (not e!802294))))

(assert (=> b!1417639 (= res!953370 (validKeyInArray!0 (select (arr!46721 a!2901) j!112)))))

(declare-fun b!1417640 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96786 (_ BitVec 32)) SeekEntryResult!11032)

(assert (=> b!1417640 (= e!802293 (= (seekEntryOrOpen!0 (select (arr!46721 a!2901) j!112) a!2901 mask!2840) (Found!11032 j!112)))))

(declare-fun b!1417641 () Bool)

(declare-fun res!953368 () Bool)

(assert (=> b!1417641 (=> (not res!953368) (not e!802294))))

(assert (=> b!1417641 (= res!953368 (and (= (size!47271 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47271 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47271 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!122202 res!953371) b!1417641))

(assert (= (and b!1417641 res!953368) b!1417637))

(assert (= (and b!1417637 res!953367) b!1417639))

(assert (= (and b!1417639 res!953370) b!1417636))

(assert (= (and b!1417636 res!953365) b!1417638))

(assert (= (and b!1417638 res!953366) b!1417635))

(assert (= (and b!1417635 res!953369) b!1417640))

(declare-fun m!1308399 () Bool)

(assert (=> b!1417636 m!1308399))

(declare-fun m!1308401 () Bool)

(assert (=> b!1417639 m!1308401))

(assert (=> b!1417639 m!1308401))

(declare-fun m!1308403 () Bool)

(assert (=> b!1417639 m!1308403))

(assert (=> b!1417635 m!1308401))

(declare-fun m!1308405 () Bool)

(assert (=> b!1417635 m!1308405))

(assert (=> b!1417635 m!1308401))

(declare-fun m!1308407 () Bool)

(assert (=> b!1417635 m!1308407))

(assert (=> b!1417635 m!1308405))

(assert (=> b!1417635 m!1308401))

(declare-fun m!1308409 () Bool)

(assert (=> b!1417635 m!1308409))

(declare-fun m!1308411 () Bool)

(assert (=> b!1417635 m!1308411))

(declare-fun m!1308413 () Bool)

(assert (=> start!122202 m!1308413))

(declare-fun m!1308415 () Bool)

(assert (=> start!122202 m!1308415))

(assert (=> b!1417640 m!1308401))

(assert (=> b!1417640 m!1308401))

(declare-fun m!1308417 () Bool)

(assert (=> b!1417640 m!1308417))

(declare-fun m!1308419 () Bool)

(assert (=> b!1417638 m!1308419))

(declare-fun m!1308421 () Bool)

(assert (=> b!1417637 m!1308421))

(assert (=> b!1417637 m!1308421))

(declare-fun m!1308423 () Bool)

(assert (=> b!1417637 m!1308423))

(push 1)

(assert (not b!1417639))

(assert (not start!122202))

(assert (not b!1417638))

(assert (not b!1417637))

(assert (not b!1417636))

(assert (not b!1417640))

(assert (not b!1417635))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

