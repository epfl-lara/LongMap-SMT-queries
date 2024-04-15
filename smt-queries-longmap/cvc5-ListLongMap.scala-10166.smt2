; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119814 () Bool)

(assert start!119814)

(declare-fun b!1395389 () Bool)

(declare-fun e!789982 () Bool)

(assert (=> b!1395389 (= e!789982 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95398 0))(
  ( (array!95399 (arr!46056 (Array (_ BitVec 32) (_ BitVec 64))) (size!46608 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95398)

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10399 0))(
  ( (MissingZero!10399 (index!43967 (_ BitVec 32))) (Found!10399 (index!43968 (_ BitVec 32))) (Intermediate!10399 (undefined!11211 Bool) (index!43969 (_ BitVec 32)) (x!125622 (_ BitVec 32))) (Undefined!10399) (MissingVacant!10399 (index!43970 (_ BitVec 32))) )
))
(declare-fun lt!612809 () SeekEntryResult!10399)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95398 (_ BitVec 32)) SeekEntryResult!10399)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395389 (= lt!612809 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46056 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46056 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95399 (store (arr!46056 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46608 a!2901)) mask!2840))))

(declare-fun b!1395390 () Bool)

(declare-fun res!934689 () Bool)

(declare-fun e!789983 () Bool)

(assert (=> b!1395390 (=> (not res!934689) (not e!789983))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95398 (_ BitVec 32)) Bool)

(assert (=> b!1395390 (= res!934689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!934684 () Bool)

(assert (=> start!119814 (=> (not res!934684) (not e!789983))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119814 (= res!934684 (validMask!0 mask!2840))))

(assert (=> start!119814 e!789983))

(assert (=> start!119814 true))

(declare-fun array_inv!35289 (array!95398) Bool)

(assert (=> start!119814 (array_inv!35289 a!2901)))

(declare-fun b!1395391 () Bool)

(declare-fun res!934686 () Bool)

(assert (=> b!1395391 (=> (not res!934686) (not e!789983))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395391 (= res!934686 (validKeyInArray!0 (select (arr!46056 a!2901) i!1037)))))

(declare-fun b!1395392 () Bool)

(declare-fun e!789980 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95398 (_ BitVec 32)) SeekEntryResult!10399)

(assert (=> b!1395392 (= e!789980 (= (seekEntryOrOpen!0 (select (arr!46056 a!2901) j!112) a!2901 mask!2840) (Found!10399 j!112)))))

(declare-fun b!1395393 () Bool)

(assert (=> b!1395393 (= e!789983 (not e!789982))))

(declare-fun res!934685 () Bool)

(assert (=> b!1395393 (=> res!934685 e!789982)))

(declare-fun lt!612807 () SeekEntryResult!10399)

(assert (=> b!1395393 (= res!934685 (or (not (is-Intermediate!10399 lt!612807)) (undefined!11211 lt!612807)))))

(assert (=> b!1395393 e!789980))

(declare-fun res!934687 () Bool)

(assert (=> b!1395393 (=> (not res!934687) (not e!789980))))

(assert (=> b!1395393 (= res!934687 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46645 0))(
  ( (Unit!46646) )
))
(declare-fun lt!612808 () Unit!46645)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95398 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46645)

(assert (=> b!1395393 (= lt!612808 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1395393 (= lt!612807 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46056 a!2901) j!112) mask!2840) (select (arr!46056 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1395394 () Bool)

(declare-fun res!934688 () Bool)

(assert (=> b!1395394 (=> (not res!934688) (not e!789983))))

(assert (=> b!1395394 (= res!934688 (validKeyInArray!0 (select (arr!46056 a!2901) j!112)))))

(declare-fun b!1395395 () Bool)

(declare-fun res!934683 () Bool)

(assert (=> b!1395395 (=> (not res!934683) (not e!789983))))

(assert (=> b!1395395 (= res!934683 (and (= (size!46608 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46608 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46608 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1395396 () Bool)

(declare-fun res!934690 () Bool)

(assert (=> b!1395396 (=> (not res!934690) (not e!789983))))

(declare-datatypes ((List!32653 0))(
  ( (Nil!32650) (Cons!32649 (h!33885 (_ BitVec 64)) (t!47339 List!32653)) )
))
(declare-fun arrayNoDuplicates!0 (array!95398 (_ BitVec 32) List!32653) Bool)

(assert (=> b!1395396 (= res!934690 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32650))))

(assert (= (and start!119814 res!934684) b!1395395))

(assert (= (and b!1395395 res!934683) b!1395391))

(assert (= (and b!1395391 res!934686) b!1395394))

(assert (= (and b!1395394 res!934688) b!1395390))

(assert (= (and b!1395390 res!934689) b!1395396))

(assert (= (and b!1395396 res!934690) b!1395393))

(assert (= (and b!1395393 res!934687) b!1395392))

(assert (= (and b!1395393 (not res!934685)) b!1395389))

(declare-fun m!1281429 () Bool)

(assert (=> b!1395396 m!1281429))

(declare-fun m!1281431 () Bool)

(assert (=> b!1395392 m!1281431))

(assert (=> b!1395392 m!1281431))

(declare-fun m!1281433 () Bool)

(assert (=> b!1395392 m!1281433))

(declare-fun m!1281435 () Bool)

(assert (=> b!1395390 m!1281435))

(declare-fun m!1281437 () Bool)

(assert (=> b!1395389 m!1281437))

(declare-fun m!1281439 () Bool)

(assert (=> b!1395389 m!1281439))

(assert (=> b!1395389 m!1281439))

(declare-fun m!1281441 () Bool)

(assert (=> b!1395389 m!1281441))

(assert (=> b!1395389 m!1281441))

(assert (=> b!1395389 m!1281439))

(declare-fun m!1281443 () Bool)

(assert (=> b!1395389 m!1281443))

(declare-fun m!1281445 () Bool)

(assert (=> start!119814 m!1281445))

(declare-fun m!1281447 () Bool)

(assert (=> start!119814 m!1281447))

(assert (=> b!1395393 m!1281431))

(declare-fun m!1281449 () Bool)

(assert (=> b!1395393 m!1281449))

(assert (=> b!1395393 m!1281431))

(declare-fun m!1281451 () Bool)

(assert (=> b!1395393 m!1281451))

(assert (=> b!1395393 m!1281449))

(assert (=> b!1395393 m!1281431))

(declare-fun m!1281453 () Bool)

(assert (=> b!1395393 m!1281453))

(declare-fun m!1281455 () Bool)

(assert (=> b!1395393 m!1281455))

(declare-fun m!1281457 () Bool)

(assert (=> b!1395391 m!1281457))

(assert (=> b!1395391 m!1281457))

(declare-fun m!1281459 () Bool)

(assert (=> b!1395391 m!1281459))

(assert (=> b!1395394 m!1281431))

(assert (=> b!1395394 m!1281431))

(declare-fun m!1281461 () Bool)

(assert (=> b!1395394 m!1281461))

(push 1)

(assert (not b!1395394))

(assert (not b!1395392))

(assert (not b!1395396))

(assert (not b!1395391))

(assert (not start!119814))

(assert (not b!1395389))

(assert (not b!1395390))

(assert (not b!1395393))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

