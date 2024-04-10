; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119624 () Bool)

(assert start!119624)

(declare-fun res!932835 () Bool)

(declare-fun e!789014 () Bool)

(assert (=> start!119624 (=> (not res!932835) (not e!789014))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119624 (= res!932835 (validMask!0 mask!2840))))

(assert (=> start!119624 e!789014))

(assert (=> start!119624 true))

(declare-datatypes ((array!95306 0))(
  ( (array!95307 (arr!46011 (Array (_ BitVec 32) (_ BitVec 64))) (size!46561 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95306)

(declare-fun array_inv!35039 (array!95306) Bool)

(assert (=> start!119624 (array_inv!35039 a!2901)))

(declare-fun b!1393427 () Bool)

(declare-fun res!932837 () Bool)

(assert (=> b!1393427 (=> (not res!932837) (not e!789014))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95306 (_ BitVec 32)) Bool)

(assert (=> b!1393427 (= res!932837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393428 () Bool)

(declare-fun res!932840 () Bool)

(assert (=> b!1393428 (=> (not res!932840) (not e!789014))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393428 (= res!932840 (validKeyInArray!0 (select (arr!46011 a!2901) i!1037)))))

(declare-fun b!1393429 () Bool)

(declare-fun res!932842 () Bool)

(assert (=> b!1393429 (=> (not res!932842) (not e!789014))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1393429 (= res!932842 (validKeyInArray!0 (select (arr!46011 a!2901) j!112)))))

(declare-fun b!1393430 () Bool)

(declare-fun e!789013 () Bool)

(assert (=> b!1393430 (= e!789014 (not e!789013))))

(declare-fun res!932841 () Bool)

(assert (=> b!1393430 (=> res!932841 e!789013)))

(declare-datatypes ((SeekEntryResult!10328 0))(
  ( (MissingZero!10328 (index!43683 (_ BitVec 32))) (Found!10328 (index!43684 (_ BitVec 32))) (Intermediate!10328 (undefined!11140 Bool) (index!43685 (_ BitVec 32)) (x!125364 (_ BitVec 32))) (Undefined!10328) (MissingVacant!10328 (index!43686 (_ BitVec 32))) )
))
(declare-fun lt!611988 () SeekEntryResult!10328)

(get-info :version)

(assert (=> b!1393430 (= res!932841 (or (not ((_ is Intermediate!10328) lt!611988)) (undefined!11140 lt!611988)))))

(declare-fun e!789011 () Bool)

(assert (=> b!1393430 e!789011))

(declare-fun res!932839 () Bool)

(assert (=> b!1393430 (=> (not res!932839) (not e!789011))))

(assert (=> b!1393430 (= res!932839 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46660 0))(
  ( (Unit!46661) )
))
(declare-fun lt!611986 () Unit!46660)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95306 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46660)

(assert (=> b!1393430 (= lt!611986 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95306 (_ BitVec 32)) SeekEntryResult!10328)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393430 (= lt!611988 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46011 a!2901) j!112) mask!2840) (select (arr!46011 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393431 () Bool)

(declare-fun res!932836 () Bool)

(assert (=> b!1393431 (=> (not res!932836) (not e!789014))))

(declare-datatypes ((List!32530 0))(
  ( (Nil!32527) (Cons!32526 (h!33759 (_ BitVec 64)) (t!47224 List!32530)) )
))
(declare-fun arrayNoDuplicates!0 (array!95306 (_ BitVec 32) List!32530) Bool)

(assert (=> b!1393431 (= res!932836 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32527))))

(declare-fun b!1393432 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95306 (_ BitVec 32)) SeekEntryResult!10328)

(assert (=> b!1393432 (= e!789011 (= (seekEntryOrOpen!0 (select (arr!46011 a!2901) j!112) a!2901 mask!2840) (Found!10328 j!112)))))

(declare-fun b!1393433 () Bool)

(assert (=> b!1393433 (= e!789013 true)))

(declare-fun lt!611987 () SeekEntryResult!10328)

(assert (=> b!1393433 (= lt!611987 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46011 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46011 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95307 (store (arr!46011 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46561 a!2901)) mask!2840))))

(declare-fun b!1393434 () Bool)

(declare-fun res!932838 () Bool)

(assert (=> b!1393434 (=> (not res!932838) (not e!789014))))

(assert (=> b!1393434 (= res!932838 (and (= (size!46561 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46561 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46561 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119624 res!932835) b!1393434))

(assert (= (and b!1393434 res!932838) b!1393428))

(assert (= (and b!1393428 res!932840) b!1393429))

(assert (= (and b!1393429 res!932842) b!1393427))

(assert (= (and b!1393427 res!932837) b!1393431))

(assert (= (and b!1393431 res!932836) b!1393430))

(assert (= (and b!1393430 res!932839) b!1393432))

(assert (= (and b!1393430 (not res!932841)) b!1393433))

(declare-fun m!1279333 () Bool)

(assert (=> b!1393433 m!1279333))

(declare-fun m!1279335 () Bool)

(assert (=> b!1393433 m!1279335))

(assert (=> b!1393433 m!1279335))

(declare-fun m!1279337 () Bool)

(assert (=> b!1393433 m!1279337))

(assert (=> b!1393433 m!1279337))

(assert (=> b!1393433 m!1279335))

(declare-fun m!1279339 () Bool)

(assert (=> b!1393433 m!1279339))

(declare-fun m!1279341 () Bool)

(assert (=> b!1393430 m!1279341))

(declare-fun m!1279343 () Bool)

(assert (=> b!1393430 m!1279343))

(assert (=> b!1393430 m!1279341))

(declare-fun m!1279345 () Bool)

(assert (=> b!1393430 m!1279345))

(assert (=> b!1393430 m!1279343))

(assert (=> b!1393430 m!1279341))

(declare-fun m!1279347 () Bool)

(assert (=> b!1393430 m!1279347))

(declare-fun m!1279349 () Bool)

(assert (=> b!1393430 m!1279349))

(declare-fun m!1279351 () Bool)

(assert (=> start!119624 m!1279351))

(declare-fun m!1279353 () Bool)

(assert (=> start!119624 m!1279353))

(declare-fun m!1279355 () Bool)

(assert (=> b!1393431 m!1279355))

(declare-fun m!1279357 () Bool)

(assert (=> b!1393428 m!1279357))

(assert (=> b!1393428 m!1279357))

(declare-fun m!1279359 () Bool)

(assert (=> b!1393428 m!1279359))

(assert (=> b!1393429 m!1279341))

(assert (=> b!1393429 m!1279341))

(declare-fun m!1279361 () Bool)

(assert (=> b!1393429 m!1279361))

(declare-fun m!1279363 () Bool)

(assert (=> b!1393427 m!1279363))

(assert (=> b!1393432 m!1279341))

(assert (=> b!1393432 m!1279341))

(declare-fun m!1279365 () Bool)

(assert (=> b!1393432 m!1279365))

(check-sat (not b!1393429) (not b!1393428) (not b!1393431) (not start!119624) (not b!1393430) (not b!1393432) (not b!1393433) (not b!1393427))
