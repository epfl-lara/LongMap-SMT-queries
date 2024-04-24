; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119796 () Bool)

(assert start!119796)

(declare-fun b!1394375 () Bool)

(declare-fun res!933104 () Bool)

(declare-fun e!789653 () Bool)

(assert (=> b!1394375 (=> (not res!933104) (not e!789653))))

(declare-datatypes ((array!95400 0))(
  ( (array!95401 (arr!46056 (Array (_ BitVec 32) (_ BitVec 64))) (size!46607 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95400)

(declare-datatypes ((List!32562 0))(
  ( (Nil!32559) (Cons!32558 (h!33799 (_ BitVec 64)) (t!47248 List!32562)) )
))
(declare-fun arrayNoDuplicates!0 (array!95400 (_ BitVec 32) List!32562) Bool)

(assert (=> b!1394375 (= res!933104 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32559))))

(declare-fun res!933099 () Bool)

(assert (=> start!119796 (=> (not res!933099) (not e!789653))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119796 (= res!933099 (validMask!0 mask!2840))))

(assert (=> start!119796 e!789653))

(assert (=> start!119796 true))

(declare-fun array_inv!35337 (array!95400) Bool)

(assert (=> start!119796 (array_inv!35337 a!2901)))

(declare-fun b!1394376 () Bool)

(declare-fun res!933103 () Bool)

(assert (=> b!1394376 (=> (not res!933103) (not e!789653))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394376 (= res!933103 (validKeyInArray!0 (select (arr!46056 a!2901) i!1037)))))

(declare-fun b!1394377 () Bool)

(declare-fun e!789654 () Bool)

(assert (=> b!1394377 (= e!789654 true)))

(declare-datatypes ((SeekEntryResult!10276 0))(
  ( (MissingZero!10276 (index!43475 (_ BitVec 32))) (Found!10276 (index!43476 (_ BitVec 32))) (Intermediate!10276 (undefined!11088 Bool) (index!43477 (_ BitVec 32)) (x!125307 (_ BitVec 32))) (Undefined!10276) (MissingVacant!10276 (index!43478 (_ BitVec 32))) )
))
(declare-fun lt!612312 () SeekEntryResult!10276)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95400 (_ BitVec 32)) SeekEntryResult!10276)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394377 (= lt!612312 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46056 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46056 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95401 (store (arr!46056 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46607 a!2901)) mask!2840))))

(declare-fun b!1394378 () Bool)

(declare-fun res!933100 () Bool)

(assert (=> b!1394378 (=> (not res!933100) (not e!789653))))

(assert (=> b!1394378 (= res!933100 (validKeyInArray!0 (select (arr!46056 a!2901) j!112)))))

(declare-fun b!1394379 () Bool)

(declare-fun res!933106 () Bool)

(assert (=> b!1394379 (=> (not res!933106) (not e!789653))))

(assert (=> b!1394379 (= res!933106 (and (= (size!46607 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46607 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46607 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394380 () Bool)

(declare-fun e!789655 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95400 (_ BitVec 32)) SeekEntryResult!10276)

(assert (=> b!1394380 (= e!789655 (= (seekEntryOrOpen!0 (select (arr!46056 a!2901) j!112) a!2901 mask!2840) (Found!10276 j!112)))))

(declare-fun b!1394381 () Bool)

(assert (=> b!1394381 (= e!789653 (not e!789654))))

(declare-fun res!933101 () Bool)

(assert (=> b!1394381 (=> res!933101 e!789654)))

(declare-fun lt!612313 () SeekEntryResult!10276)

(assert (=> b!1394381 (= res!933101 (or (not (is-Intermediate!10276 lt!612313)) (undefined!11088 lt!612313)))))

(assert (=> b!1394381 e!789655))

(declare-fun res!933102 () Bool)

(assert (=> b!1394381 (=> (not res!933102) (not e!789655))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95400 (_ BitVec 32)) Bool)

(assert (=> b!1394381 (= res!933102 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46583 0))(
  ( (Unit!46584) )
))
(declare-fun lt!612314 () Unit!46583)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95400 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46583)

(assert (=> b!1394381 (= lt!612314 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1394381 (= lt!612313 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46056 a!2901) j!112) mask!2840) (select (arr!46056 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1394382 () Bool)

(declare-fun res!933105 () Bool)

(assert (=> b!1394382 (=> (not res!933105) (not e!789653))))

(assert (=> b!1394382 (= res!933105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119796 res!933099) b!1394379))

(assert (= (and b!1394379 res!933106) b!1394376))

(assert (= (and b!1394376 res!933103) b!1394378))

(assert (= (and b!1394378 res!933100) b!1394382))

(assert (= (and b!1394382 res!933105) b!1394375))

(assert (= (and b!1394375 res!933104) b!1394381))

(assert (= (and b!1394381 res!933102) b!1394380))

(assert (= (and b!1394381 (not res!933101)) b!1394377))

(declare-fun m!1280433 () Bool)

(assert (=> b!1394380 m!1280433))

(assert (=> b!1394380 m!1280433))

(declare-fun m!1280435 () Bool)

(assert (=> b!1394380 m!1280435))

(declare-fun m!1280437 () Bool)

(assert (=> b!1394377 m!1280437))

(declare-fun m!1280439 () Bool)

(assert (=> b!1394377 m!1280439))

(assert (=> b!1394377 m!1280439))

(declare-fun m!1280441 () Bool)

(assert (=> b!1394377 m!1280441))

(assert (=> b!1394377 m!1280441))

(assert (=> b!1394377 m!1280439))

(declare-fun m!1280443 () Bool)

(assert (=> b!1394377 m!1280443))

(declare-fun m!1280445 () Bool)

(assert (=> b!1394375 m!1280445))

(declare-fun m!1280447 () Bool)

(assert (=> b!1394376 m!1280447))

(assert (=> b!1394376 m!1280447))

(declare-fun m!1280449 () Bool)

(assert (=> b!1394376 m!1280449))

(declare-fun m!1280451 () Bool)

(assert (=> b!1394382 m!1280451))

(assert (=> b!1394378 m!1280433))

(assert (=> b!1394378 m!1280433))

(declare-fun m!1280453 () Bool)

(assert (=> b!1394378 m!1280453))

(assert (=> b!1394381 m!1280433))

(declare-fun m!1280455 () Bool)

(assert (=> b!1394381 m!1280455))

(assert (=> b!1394381 m!1280433))

(declare-fun m!1280457 () Bool)

(assert (=> b!1394381 m!1280457))

(assert (=> b!1394381 m!1280455))

(assert (=> b!1394381 m!1280433))

(declare-fun m!1280459 () Bool)

(assert (=> b!1394381 m!1280459))

(declare-fun m!1280461 () Bool)

(assert (=> b!1394381 m!1280461))

(declare-fun m!1280463 () Bool)

(assert (=> start!119796 m!1280463))

(declare-fun m!1280465 () Bool)

(assert (=> start!119796 m!1280465))

(push 1)

(assert (not b!1394376))

(assert (not start!119796))

(assert (not b!1394375))

(assert (not b!1394380))

(assert (not b!1394377))

(assert (not b!1394381))

(assert (not b!1394378))

(assert (not b!1394382))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

