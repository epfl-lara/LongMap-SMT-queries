; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121392 () Bool)

(assert start!121392)

(declare-fun b!1410434 () Bool)

(declare-fun res!947472 () Bool)

(declare-fun e!798260 () Bool)

(assert (=> b!1410434 (=> (not res!947472) (not e!798260))))

(declare-datatypes ((array!96468 0))(
  ( (array!96469 (arr!46575 (Array (_ BitVec 32) (_ BitVec 64))) (size!47126 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96468)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410434 (= res!947472 (validKeyInArray!0 (select (arr!46575 a!2901) j!112)))))

(declare-fun b!1410435 () Bool)

(declare-fun e!798262 () Bool)

(assert (=> b!1410435 (= e!798262 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10789 0))(
  ( (MissingZero!10789 (index!45533 (_ BitVec 32))) (Found!10789 (index!45534 (_ BitVec 32))) (Intermediate!10789 (undefined!11601 Bool) (index!45535 (_ BitVec 32)) (x!127273 (_ BitVec 32))) (Undefined!10789) (MissingVacant!10789 (index!45536 (_ BitVec 32))) )
))
(declare-fun lt!621068 () SeekEntryResult!10789)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96468 (_ BitVec 32)) SeekEntryResult!10789)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410435 (= lt!621068 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46575 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46575 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96469 (store (arr!46575 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47126 a!2901)) mask!2840))))

(declare-fun b!1410436 () Bool)

(declare-fun res!947479 () Bool)

(assert (=> b!1410436 (=> (not res!947479) (not e!798260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96468 (_ BitVec 32)) Bool)

(assert (=> b!1410436 (= res!947479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1410437 () Bool)

(declare-fun res!947476 () Bool)

(assert (=> b!1410437 (=> (not res!947476) (not e!798260))))

(assert (=> b!1410437 (= res!947476 (validKeyInArray!0 (select (arr!46575 a!2901) i!1037)))))

(declare-fun res!947475 () Bool)

(assert (=> start!121392 (=> (not res!947475) (not e!798260))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121392 (= res!947475 (validMask!0 mask!2840))))

(assert (=> start!121392 e!798260))

(assert (=> start!121392 true))

(declare-fun array_inv!35856 (array!96468) Bool)

(assert (=> start!121392 (array_inv!35856 a!2901)))

(declare-fun b!1410438 () Bool)

(assert (=> b!1410438 (= e!798260 (not e!798262))))

(declare-fun res!947473 () Bool)

(assert (=> b!1410438 (=> res!947473 e!798262)))

(declare-fun lt!621066 () SeekEntryResult!10789)

(assert (=> b!1410438 (= res!947473 (or (not (is-Intermediate!10789 lt!621066)) (undefined!11601 lt!621066)))))

(declare-fun e!798263 () Bool)

(assert (=> b!1410438 e!798263))

(declare-fun res!947477 () Bool)

(assert (=> b!1410438 (=> (not res!947477) (not e!798263))))

(assert (=> b!1410438 (= res!947477 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47579 0))(
  ( (Unit!47580) )
))
(declare-fun lt!621067 () Unit!47579)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96468 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47579)

(assert (=> b!1410438 (= lt!621067 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1410438 (= lt!621066 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46575 a!2901) j!112) mask!2840) (select (arr!46575 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1410439 () Bool)

(declare-fun res!947478 () Bool)

(assert (=> b!1410439 (=> (not res!947478) (not e!798260))))

(assert (=> b!1410439 (= res!947478 (and (= (size!47126 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47126 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47126 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1410440 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96468 (_ BitVec 32)) SeekEntryResult!10789)

(assert (=> b!1410440 (= e!798263 (= (seekEntryOrOpen!0 (select (arr!46575 a!2901) j!112) a!2901 mask!2840) (Found!10789 j!112)))))

(declare-fun b!1410441 () Bool)

(declare-fun res!947474 () Bool)

(assert (=> b!1410441 (=> (not res!947474) (not e!798260))))

(declare-datatypes ((List!33081 0))(
  ( (Nil!33078) (Cons!33077 (h!34348 (_ BitVec 64)) (t!47767 List!33081)) )
))
(declare-fun arrayNoDuplicates!0 (array!96468 (_ BitVec 32) List!33081) Bool)

(assert (=> b!1410441 (= res!947474 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33078))))

(assert (= (and start!121392 res!947475) b!1410439))

(assert (= (and b!1410439 res!947478) b!1410437))

(assert (= (and b!1410437 res!947476) b!1410434))

(assert (= (and b!1410434 res!947472) b!1410436))

(assert (= (and b!1410436 res!947479) b!1410441))

(assert (= (and b!1410441 res!947474) b!1410438))

(assert (= (and b!1410438 res!947477) b!1410440))

(assert (= (and b!1410438 (not res!947473)) b!1410435))

(declare-fun m!1300323 () Bool)

(assert (=> b!1410438 m!1300323))

(declare-fun m!1300325 () Bool)

(assert (=> b!1410438 m!1300325))

(assert (=> b!1410438 m!1300323))

(declare-fun m!1300327 () Bool)

(assert (=> b!1410438 m!1300327))

(assert (=> b!1410438 m!1300325))

(assert (=> b!1410438 m!1300323))

(declare-fun m!1300329 () Bool)

(assert (=> b!1410438 m!1300329))

(declare-fun m!1300331 () Bool)

(assert (=> b!1410438 m!1300331))

(declare-fun m!1300333 () Bool)

(assert (=> b!1410435 m!1300333))

(declare-fun m!1300335 () Bool)

(assert (=> b!1410435 m!1300335))

(assert (=> b!1410435 m!1300335))

(declare-fun m!1300337 () Bool)

(assert (=> b!1410435 m!1300337))

(assert (=> b!1410435 m!1300337))

(assert (=> b!1410435 m!1300335))

(declare-fun m!1300339 () Bool)

(assert (=> b!1410435 m!1300339))

(assert (=> b!1410440 m!1300323))

(assert (=> b!1410440 m!1300323))

(declare-fun m!1300341 () Bool)

(assert (=> b!1410440 m!1300341))

(declare-fun m!1300343 () Bool)

(assert (=> b!1410437 m!1300343))

(assert (=> b!1410437 m!1300343))

(declare-fun m!1300345 () Bool)

(assert (=> b!1410437 m!1300345))

(assert (=> b!1410434 m!1300323))

(assert (=> b!1410434 m!1300323))

(declare-fun m!1300347 () Bool)

(assert (=> b!1410434 m!1300347))

(declare-fun m!1300349 () Bool)

(assert (=> b!1410436 m!1300349))

(declare-fun m!1300351 () Bool)

(assert (=> b!1410441 m!1300351))

(declare-fun m!1300353 () Bool)

(assert (=> start!121392 m!1300353))

(declare-fun m!1300355 () Bool)

(assert (=> start!121392 m!1300355))

(push 1)

(assert (not b!1410441))

(assert (not b!1410437))

(assert (not start!121392))

(assert (not b!1410438))

(assert (not b!1410434))

(assert (not b!1410435))

(assert (not b!1410440))

(assert (not b!1410436))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

