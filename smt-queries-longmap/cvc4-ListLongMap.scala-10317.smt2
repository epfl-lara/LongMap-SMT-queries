; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121228 () Bool)

(assert start!121228)

(declare-fun res!947308 () Bool)

(declare-fun e!797669 () Bool)

(assert (=> start!121228 (=> (not res!947308) (not e!797669))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121228 (= res!947308 (validMask!0 mask!2840))))

(assert (=> start!121228 e!797669))

(assert (=> start!121228 true))

(declare-datatypes ((array!96382 0))(
  ( (array!96383 (arr!46534 (Array (_ BitVec 32) (_ BitVec 64))) (size!47084 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96382)

(declare-fun array_inv!35562 (array!96382) Bool)

(assert (=> start!121228 (array_inv!35562 a!2901)))

(declare-fun b!1409582 () Bool)

(declare-fun res!947310 () Bool)

(assert (=> b!1409582 (=> (not res!947310) (not e!797669))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409582 (= res!947310 (validKeyInArray!0 (select (arr!46534 a!2901) j!112)))))

(declare-fun b!1409583 () Bool)

(declare-fun e!797667 () Bool)

(assert (=> b!1409583 (= e!797669 (not e!797667))))

(declare-fun res!947307 () Bool)

(assert (=> b!1409583 (=> res!947307 e!797667)))

(declare-datatypes ((SeekEntryResult!10845 0))(
  ( (MissingZero!10845 (index!45757 (_ BitVec 32))) (Found!10845 (index!45758 (_ BitVec 32))) (Intermediate!10845 (undefined!11657 Bool) (index!45759 (_ BitVec 32)) (x!127342 (_ BitVec 32))) (Undefined!10845) (MissingVacant!10845 (index!45760 (_ BitVec 32))) )
))
(declare-fun lt!620776 () SeekEntryResult!10845)

(assert (=> b!1409583 (= res!947307 (or (not (is-Intermediate!10845 lt!620776)) (undefined!11657 lt!620776)))))

(declare-fun e!797666 () Bool)

(assert (=> b!1409583 e!797666))

(declare-fun res!947311 () Bool)

(assert (=> b!1409583 (=> (not res!947311) (not e!797666))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96382 (_ BitVec 32)) Bool)

(assert (=> b!1409583 (= res!947311 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47664 0))(
  ( (Unit!47665) )
))
(declare-fun lt!620778 () Unit!47664)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96382 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47664)

(assert (=> b!1409583 (= lt!620778 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96382 (_ BitVec 32)) SeekEntryResult!10845)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409583 (= lt!620776 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46534 a!2901) j!112) mask!2840) (select (arr!46534 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409584 () Bool)

(declare-fun res!947304 () Bool)

(assert (=> b!1409584 (=> (not res!947304) (not e!797669))))

(declare-datatypes ((List!33053 0))(
  ( (Nil!33050) (Cons!33049 (h!34312 (_ BitVec 64)) (t!47747 List!33053)) )
))
(declare-fun arrayNoDuplicates!0 (array!96382 (_ BitVec 32) List!33053) Bool)

(assert (=> b!1409584 (= res!947304 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33050))))

(declare-fun b!1409585 () Bool)

(declare-fun res!947306 () Bool)

(assert (=> b!1409585 (=> (not res!947306) (not e!797669))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1409585 (= res!947306 (validKeyInArray!0 (select (arr!46534 a!2901) i!1037)))))

(declare-fun b!1409586 () Bool)

(declare-fun res!947309 () Bool)

(assert (=> b!1409586 (=> (not res!947309) (not e!797669))))

(assert (=> b!1409586 (= res!947309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409587 () Bool)

(declare-fun res!947305 () Bool)

(assert (=> b!1409587 (=> (not res!947305) (not e!797669))))

(assert (=> b!1409587 (= res!947305 (and (= (size!47084 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47084 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47084 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409588 () Bool)

(assert (=> b!1409588 (= e!797667 true)))

(declare-fun lt!620777 () SeekEntryResult!10845)

(assert (=> b!1409588 (= lt!620777 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46534 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46534 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96383 (store (arr!46534 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47084 a!2901)) mask!2840))))

(declare-fun b!1409589 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96382 (_ BitVec 32)) SeekEntryResult!10845)

(assert (=> b!1409589 (= e!797666 (= (seekEntryOrOpen!0 (select (arr!46534 a!2901) j!112) a!2901 mask!2840) (Found!10845 j!112)))))

(assert (= (and start!121228 res!947308) b!1409587))

(assert (= (and b!1409587 res!947305) b!1409585))

(assert (= (and b!1409585 res!947306) b!1409582))

(assert (= (and b!1409582 res!947310) b!1409586))

(assert (= (and b!1409586 res!947309) b!1409584))

(assert (= (and b!1409584 res!947304) b!1409583))

(assert (= (and b!1409583 res!947311) b!1409589))

(assert (= (and b!1409583 (not res!947307)) b!1409588))

(declare-fun m!1299359 () Bool)

(assert (=> b!1409584 m!1299359))

(declare-fun m!1299361 () Bool)

(assert (=> b!1409585 m!1299361))

(assert (=> b!1409585 m!1299361))

(declare-fun m!1299363 () Bool)

(assert (=> b!1409585 m!1299363))

(declare-fun m!1299365 () Bool)

(assert (=> b!1409588 m!1299365))

(declare-fun m!1299367 () Bool)

(assert (=> b!1409588 m!1299367))

(assert (=> b!1409588 m!1299367))

(declare-fun m!1299369 () Bool)

(assert (=> b!1409588 m!1299369))

(assert (=> b!1409588 m!1299369))

(assert (=> b!1409588 m!1299367))

(declare-fun m!1299371 () Bool)

(assert (=> b!1409588 m!1299371))

(declare-fun m!1299373 () Bool)

(assert (=> b!1409589 m!1299373))

(assert (=> b!1409589 m!1299373))

(declare-fun m!1299375 () Bool)

(assert (=> b!1409589 m!1299375))

(declare-fun m!1299377 () Bool)

(assert (=> start!121228 m!1299377))

(declare-fun m!1299379 () Bool)

(assert (=> start!121228 m!1299379))

(assert (=> b!1409582 m!1299373))

(assert (=> b!1409582 m!1299373))

(declare-fun m!1299381 () Bool)

(assert (=> b!1409582 m!1299381))

(declare-fun m!1299383 () Bool)

(assert (=> b!1409586 m!1299383))

(assert (=> b!1409583 m!1299373))

(declare-fun m!1299385 () Bool)

(assert (=> b!1409583 m!1299385))

(assert (=> b!1409583 m!1299373))

(declare-fun m!1299387 () Bool)

(assert (=> b!1409583 m!1299387))

(assert (=> b!1409583 m!1299385))

(assert (=> b!1409583 m!1299373))

(declare-fun m!1299389 () Bool)

(assert (=> b!1409583 m!1299389))

(declare-fun m!1299391 () Bool)

(assert (=> b!1409583 m!1299391))

(push 1)

(assert (not b!1409588))

(assert (not b!1409583))

(assert (not b!1409582))

(assert (not b!1409586))

(assert (not b!1409589))

(assert (not b!1409585))

(assert (not start!121228))

(assert (not b!1409584))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

