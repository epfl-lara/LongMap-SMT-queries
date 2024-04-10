; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129878 () Bool)

(assert start!129878)

(declare-fun b!1524337 () Bool)

(declare-fun res!1042996 () Bool)

(declare-fun e!849760 () Bool)

(assert (=> b!1524337 (=> (not res!1042996) (not e!849760))))

(declare-datatypes ((array!101417 0))(
  ( (array!101418 (arr!48938 (Array (_ BitVec 32) (_ BitVec 64))) (size!49488 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101417)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1524337 (= res!1042996 (validKeyInArray!0 (select (arr!48938 a!2804) j!70)))))

(declare-fun b!1524338 () Bool)

(declare-fun e!849763 () Bool)

(assert (=> b!1524338 (= e!849760 e!849763)))

(declare-fun res!1042990 () Bool)

(assert (=> b!1524338 (=> (not res!1042990) (not e!849763))))

(declare-datatypes ((SeekEntryResult!13103 0))(
  ( (MissingZero!13103 (index!54807 (_ BitVec 32))) (Found!13103 (index!54808 (_ BitVec 32))) (Intermediate!13103 (undefined!13915 Bool) (index!54809 (_ BitVec 32)) (x!136499 (_ BitVec 32))) (Undefined!13103) (MissingVacant!13103 (index!54810 (_ BitVec 32))) )
))
(declare-fun lt!660288 () SeekEntryResult!13103)

(declare-fun lt!660287 () SeekEntryResult!13103)

(assert (=> b!1524338 (= res!1042990 (= lt!660288 lt!660287))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1524338 (= lt!660287 (Intermediate!13103 false resIndex!21 resX!21))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101417 (_ BitVec 32)) SeekEntryResult!13103)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1524338 (= lt!660288 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48938 a!2804) j!70) mask!2512) (select (arr!48938 a!2804) j!70) a!2804 mask!2512))))

(declare-fun e!849761 () Bool)

(declare-fun b!1524339 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101417 (_ BitVec 32)) SeekEntryResult!13103)

(assert (=> b!1524339 (= e!849761 (= (seekEntry!0 (select (arr!48938 a!2804) j!70) a!2804 mask!2512) (Found!13103 j!70)))))

(declare-fun b!1524340 () Bool)

(assert (=> b!1524340 (= e!849763 (not true))))

(assert (=> b!1524340 e!849761))

(declare-fun res!1042999 () Bool)

(assert (=> b!1524340 (=> (not res!1042999) (not e!849761))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101417 (_ BitVec 32)) Bool)

(assert (=> b!1524340 (= res!1042999 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50990 0))(
  ( (Unit!50991) )
))
(declare-fun lt!660289 () Unit!50990)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101417 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50990)

(assert (=> b!1524340 (= lt!660289 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1524341 () Bool)

(declare-fun res!1042998 () Bool)

(assert (=> b!1524341 (=> (not res!1042998) (not e!849760))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1524341 (= res!1042998 (and (= (size!49488 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49488 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49488 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1524342 () Bool)

(declare-fun res!1042992 () Bool)

(assert (=> b!1524342 (=> (not res!1042992) (not e!849760))))

(assert (=> b!1524342 (= res!1042992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1524343 () Bool)

(declare-fun res!1042991 () Bool)

(assert (=> b!1524343 (=> (not res!1042991) (not e!849763))))

(assert (=> b!1524343 (= res!1042991 (= lt!660288 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48938 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48938 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101418 (store (arr!48938 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49488 a!2804)) mask!2512)))))

(declare-fun b!1524344 () Bool)

(declare-fun res!1042993 () Bool)

(assert (=> b!1524344 (=> (not res!1042993) (not e!849760))))

(assert (=> b!1524344 (= res!1042993 (validKeyInArray!0 (select (arr!48938 a!2804) i!961)))))

(declare-fun b!1524346 () Bool)

(declare-fun res!1042989 () Bool)

(assert (=> b!1524346 (=> (not res!1042989) (not e!849760))))

(declare-datatypes ((List!35421 0))(
  ( (Nil!35418) (Cons!35417 (h!36844 (_ BitVec 64)) (t!50115 List!35421)) )
))
(declare-fun arrayNoDuplicates!0 (array!101417 (_ BitVec 32) List!35421) Bool)

(assert (=> b!1524346 (= res!1042989 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35418))))

(declare-fun b!1524347 () Bool)

(declare-fun res!1042997 () Bool)

(assert (=> b!1524347 (=> (not res!1042997) (not e!849760))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1524347 (= res!1042997 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49488 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49488 a!2804))))))

(declare-fun res!1042995 () Bool)

(assert (=> start!129878 (=> (not res!1042995) (not e!849760))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129878 (= res!1042995 (validMask!0 mask!2512))))

(assert (=> start!129878 e!849760))

(assert (=> start!129878 true))

(declare-fun array_inv!37966 (array!101417) Bool)

(assert (=> start!129878 (array_inv!37966 a!2804)))

(declare-fun b!1524345 () Bool)

(declare-fun res!1042994 () Bool)

(assert (=> b!1524345 (=> (not res!1042994) (not e!849763))))

(assert (=> b!1524345 (= res!1042994 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48938 a!2804) j!70) a!2804 mask!2512) lt!660287))))

(assert (= (and start!129878 res!1042995) b!1524341))

(assert (= (and b!1524341 res!1042998) b!1524344))

(assert (= (and b!1524344 res!1042993) b!1524337))

(assert (= (and b!1524337 res!1042996) b!1524342))

(assert (= (and b!1524342 res!1042992) b!1524346))

(assert (= (and b!1524346 res!1042989) b!1524347))

(assert (= (and b!1524347 res!1042997) b!1524338))

(assert (= (and b!1524338 res!1042990) b!1524345))

(assert (= (and b!1524345 res!1042994) b!1524343))

(assert (= (and b!1524343 res!1042991) b!1524340))

(assert (= (and b!1524340 res!1042999) b!1524339))

(declare-fun m!1407375 () Bool)

(assert (=> start!129878 m!1407375))

(declare-fun m!1407377 () Bool)

(assert (=> start!129878 m!1407377))

(declare-fun m!1407379 () Bool)

(assert (=> b!1524338 m!1407379))

(assert (=> b!1524338 m!1407379))

(declare-fun m!1407381 () Bool)

(assert (=> b!1524338 m!1407381))

(assert (=> b!1524338 m!1407381))

(assert (=> b!1524338 m!1407379))

(declare-fun m!1407383 () Bool)

(assert (=> b!1524338 m!1407383))

(declare-fun m!1407385 () Bool)

(assert (=> b!1524344 m!1407385))

(assert (=> b!1524344 m!1407385))

(declare-fun m!1407387 () Bool)

(assert (=> b!1524344 m!1407387))

(declare-fun m!1407389 () Bool)

(assert (=> b!1524340 m!1407389))

(declare-fun m!1407391 () Bool)

(assert (=> b!1524340 m!1407391))

(declare-fun m!1407393 () Bool)

(assert (=> b!1524346 m!1407393))

(declare-fun m!1407395 () Bool)

(assert (=> b!1524342 m!1407395))

(assert (=> b!1524339 m!1407379))

(assert (=> b!1524339 m!1407379))

(declare-fun m!1407397 () Bool)

(assert (=> b!1524339 m!1407397))

(declare-fun m!1407399 () Bool)

(assert (=> b!1524343 m!1407399))

(declare-fun m!1407401 () Bool)

(assert (=> b!1524343 m!1407401))

(assert (=> b!1524343 m!1407401))

(declare-fun m!1407403 () Bool)

(assert (=> b!1524343 m!1407403))

(assert (=> b!1524343 m!1407403))

(assert (=> b!1524343 m!1407401))

(declare-fun m!1407405 () Bool)

(assert (=> b!1524343 m!1407405))

(assert (=> b!1524337 m!1407379))

(assert (=> b!1524337 m!1407379))

(declare-fun m!1407407 () Bool)

(assert (=> b!1524337 m!1407407))

(assert (=> b!1524345 m!1407379))

(assert (=> b!1524345 m!1407379))

(declare-fun m!1407409 () Bool)

(assert (=> b!1524345 m!1407409))

(push 1)

