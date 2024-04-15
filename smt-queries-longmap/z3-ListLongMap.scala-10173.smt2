; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119960 () Bool)

(assert start!119960)

(declare-fun b!1396394 () Bool)

(declare-fun res!935365 () Bool)

(declare-fun e!790559 () Bool)

(assert (=> b!1396394 (=> (not res!935365) (not e!790559))))

(declare-datatypes ((array!95442 0))(
  ( (array!95443 (arr!46075 (Array (_ BitVec 32) (_ BitVec 64))) (size!46627 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95442)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396394 (= res!935365 (validKeyInArray!0 (select (arr!46075 a!2901) i!1037)))))

(declare-fun b!1396395 () Bool)

(declare-fun res!935357 () Bool)

(assert (=> b!1396395 (=> (not res!935357) (not e!790559))))

(declare-datatypes ((List!32672 0))(
  ( (Nil!32669) (Cons!32668 (h!33910 (_ BitVec 64)) (t!47358 List!32672)) )
))
(declare-fun arrayNoDuplicates!0 (array!95442 (_ BitVec 32) List!32672) Bool)

(assert (=> b!1396395 (= res!935357 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32669))))

(declare-fun b!1396396 () Bool)

(declare-fun res!935360 () Bool)

(assert (=> b!1396396 (=> (not res!935360) (not e!790559))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1396396 (= res!935360 (validKeyInArray!0 (select (arr!46075 a!2901) j!112)))))

(declare-fun b!1396397 () Bool)

(declare-fun e!790558 () Bool)

(declare-fun e!790556 () Bool)

(assert (=> b!1396397 (= e!790558 e!790556)))

(declare-fun res!935364 () Bool)

(assert (=> b!1396397 (=> res!935364 e!790556)))

(declare-datatypes ((SeekEntryResult!10418 0))(
  ( (MissingZero!10418 (index!44043 (_ BitVec 32))) (Found!10418 (index!44044 (_ BitVec 32))) (Intermediate!10418 (undefined!11230 Bool) (index!44045 (_ BitVec 32)) (x!125709 (_ BitVec 32))) (Undefined!10418) (MissingVacant!10418 (index!44046 (_ BitVec 32))) )
))
(declare-fun lt!613266 () SeekEntryResult!10418)

(declare-fun lt!613264 () (_ BitVec 32))

(declare-fun lt!613268 () SeekEntryResult!10418)

(get-info :version)

(assert (=> b!1396397 (= res!935364 (or (= lt!613266 lt!613268) (not ((_ is Intermediate!10418) lt!613268)) (bvslt (x!125709 lt!613266) #b00000000000000000000000000000000) (bvsgt (x!125709 lt!613266) #b01111111111111111111111111111110) (bvslt lt!613264 #b00000000000000000000000000000000) (bvsge lt!613264 (size!46627 a!2901)) (bvslt (index!44045 lt!613266) #b00000000000000000000000000000000) (bvsge (index!44045 lt!613266) (size!46627 a!2901)) (not (= lt!613266 (Intermediate!10418 false (index!44045 lt!613266) (x!125709 lt!613266)))) (not (= lt!613268 (Intermediate!10418 (undefined!11230 lt!613268) (index!44045 lt!613268) (x!125709 lt!613268))))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!613263 () array!95442)

(declare-fun lt!613265 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95442 (_ BitVec 32)) SeekEntryResult!10418)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396397 (= lt!613268 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613265 mask!2840) lt!613265 lt!613263 mask!2840))))

(assert (=> b!1396397 (= lt!613265 (select (store (arr!46075 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1396397 (= lt!613263 (array!95443 (store (arr!46075 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46627 a!2901)))))

(declare-fun b!1396398 () Bool)

(declare-fun res!935359 () Bool)

(assert (=> b!1396398 (=> (not res!935359) (not e!790559))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95442 (_ BitVec 32)) Bool)

(assert (=> b!1396398 (= res!935359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1396399 () Bool)

(declare-fun res!935362 () Bool)

(assert (=> b!1396399 (=> (not res!935362) (not e!790559))))

(assert (=> b!1396399 (= res!935362 (and (= (size!46627 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46627 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46627 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!790555 () Bool)

(declare-fun b!1396393 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95442 (_ BitVec 32)) SeekEntryResult!10418)

(assert (=> b!1396393 (= e!790555 (= (seekEntryOrOpen!0 (select (arr!46075 a!2901) j!112) a!2901 mask!2840) (Found!10418 j!112)))))

(declare-fun res!935361 () Bool)

(assert (=> start!119960 (=> (not res!935361) (not e!790559))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119960 (= res!935361 (validMask!0 mask!2840))))

(assert (=> start!119960 e!790559))

(assert (=> start!119960 true))

(declare-fun array_inv!35308 (array!95442) Bool)

(assert (=> start!119960 (array_inv!35308 a!2901)))

(declare-fun b!1396400 () Bool)

(assert (=> b!1396400 (= e!790556 true)))

(declare-fun lt!613267 () SeekEntryResult!10418)

(assert (=> b!1396400 (= lt!613267 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613264 lt!613265 lt!613263 mask!2840))))

(declare-fun b!1396401 () Bool)

(assert (=> b!1396401 (= e!790559 (not e!790558))))

(declare-fun res!935358 () Bool)

(assert (=> b!1396401 (=> res!935358 e!790558)))

(assert (=> b!1396401 (= res!935358 (or (not ((_ is Intermediate!10418) lt!613266)) (undefined!11230 lt!613266)))))

(assert (=> b!1396401 e!790555))

(declare-fun res!935363 () Bool)

(assert (=> b!1396401 (=> (not res!935363) (not e!790555))))

(assert (=> b!1396401 (= res!935363 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46683 0))(
  ( (Unit!46684) )
))
(declare-fun lt!613262 () Unit!46683)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95442 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46683)

(assert (=> b!1396401 (= lt!613262 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1396401 (= lt!613266 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613264 (select (arr!46075 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1396401 (= lt!613264 (toIndex!0 (select (arr!46075 a!2901) j!112) mask!2840))))

(assert (= (and start!119960 res!935361) b!1396399))

(assert (= (and b!1396399 res!935362) b!1396394))

(assert (= (and b!1396394 res!935365) b!1396396))

(assert (= (and b!1396396 res!935360) b!1396398))

(assert (= (and b!1396398 res!935359) b!1396395))

(assert (= (and b!1396395 res!935357) b!1396401))

(assert (= (and b!1396401 res!935363) b!1396393))

(assert (= (and b!1396401 (not res!935358)) b!1396397))

(assert (= (and b!1396397 (not res!935364)) b!1396400))

(declare-fun m!1282387 () Bool)

(assert (=> b!1396394 m!1282387))

(assert (=> b!1396394 m!1282387))

(declare-fun m!1282389 () Bool)

(assert (=> b!1396394 m!1282389))

(declare-fun m!1282391 () Bool)

(assert (=> b!1396396 m!1282391))

(assert (=> b!1396396 m!1282391))

(declare-fun m!1282393 () Bool)

(assert (=> b!1396396 m!1282393))

(declare-fun m!1282395 () Bool)

(assert (=> b!1396398 m!1282395))

(declare-fun m!1282397 () Bool)

(assert (=> b!1396397 m!1282397))

(assert (=> b!1396397 m!1282397))

(declare-fun m!1282399 () Bool)

(assert (=> b!1396397 m!1282399))

(declare-fun m!1282401 () Bool)

(assert (=> b!1396397 m!1282401))

(declare-fun m!1282403 () Bool)

(assert (=> b!1396397 m!1282403))

(declare-fun m!1282405 () Bool)

(assert (=> b!1396395 m!1282405))

(assert (=> b!1396393 m!1282391))

(assert (=> b!1396393 m!1282391))

(declare-fun m!1282407 () Bool)

(assert (=> b!1396393 m!1282407))

(declare-fun m!1282409 () Bool)

(assert (=> start!119960 m!1282409))

(declare-fun m!1282411 () Bool)

(assert (=> start!119960 m!1282411))

(assert (=> b!1396401 m!1282391))

(declare-fun m!1282413 () Bool)

(assert (=> b!1396401 m!1282413))

(assert (=> b!1396401 m!1282391))

(declare-fun m!1282415 () Bool)

(assert (=> b!1396401 m!1282415))

(assert (=> b!1396401 m!1282391))

(declare-fun m!1282417 () Bool)

(assert (=> b!1396401 m!1282417))

(declare-fun m!1282419 () Bool)

(assert (=> b!1396401 m!1282419))

(declare-fun m!1282421 () Bool)

(assert (=> b!1396400 m!1282421))

(check-sat (not b!1396395) (not b!1396396) (not b!1396401) (not start!119960) (not b!1396393) (not b!1396397) (not b!1396394) (not b!1396400) (not b!1396398))
(check-sat)
