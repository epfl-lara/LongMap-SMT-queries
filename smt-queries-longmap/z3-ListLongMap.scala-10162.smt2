; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119738 () Bool)

(assert start!119738)

(declare-fun b!1394881 () Bool)

(declare-fun res!934291 () Bool)

(declare-fun e!789705 () Bool)

(assert (=> b!1394881 (=> (not res!934291) (not e!789705))))

(declare-datatypes ((array!95420 0))(
  ( (array!95421 (arr!46068 (Array (_ BitVec 32) (_ BitVec 64))) (size!46618 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95420)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394881 (= res!934291 (validKeyInArray!0 (select (arr!46068 a!2901) i!1037)))))

(declare-fun b!1394882 () Bool)

(declare-fun e!789707 () Bool)

(assert (=> b!1394882 (= e!789705 (not e!789707))))

(declare-fun res!934297 () Bool)

(assert (=> b!1394882 (=> res!934297 e!789707)))

(declare-datatypes ((SeekEntryResult!10385 0))(
  ( (MissingZero!10385 (index!43911 (_ BitVec 32))) (Found!10385 (index!43912 (_ BitVec 32))) (Intermediate!10385 (undefined!11197 Bool) (index!43913 (_ BitVec 32)) (x!125573 (_ BitVec 32))) (Undefined!10385) (MissingVacant!10385 (index!43914 (_ BitVec 32))) )
))
(declare-fun lt!612783 () SeekEntryResult!10385)

(get-info :version)

(assert (=> b!1394882 (= res!934297 (or (not ((_ is Intermediate!10385) lt!612783)) (undefined!11197 lt!612783)))))

(declare-fun e!789706 () Bool)

(assert (=> b!1394882 e!789706))

(declare-fun res!934295 () Bool)

(assert (=> b!1394882 (=> (not res!934295) (not e!789706))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95420 (_ BitVec 32)) Bool)

(assert (=> b!1394882 (= res!934295 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46774 0))(
  ( (Unit!46775) )
))
(declare-fun lt!612782 () Unit!46774)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95420 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46774)

(assert (=> b!1394882 (= lt!612782 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95420 (_ BitVec 32)) SeekEntryResult!10385)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394882 (= lt!612783 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46068 a!2901) j!112) mask!2840) (select (arr!46068 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1394883 () Bool)

(declare-fun res!934290 () Bool)

(assert (=> b!1394883 (=> (not res!934290) (not e!789705))))

(assert (=> b!1394883 (= res!934290 (validKeyInArray!0 (select (arr!46068 a!2901) j!112)))))

(declare-fun b!1394884 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95420 (_ BitVec 32)) SeekEntryResult!10385)

(assert (=> b!1394884 (= e!789706 (= (seekEntryOrOpen!0 (select (arr!46068 a!2901) j!112) a!2901 mask!2840) (Found!10385 j!112)))))

(declare-fun b!1394885 () Bool)

(declare-fun res!934292 () Bool)

(assert (=> b!1394885 (=> res!934292 e!789707)))

(assert (=> b!1394885 (= res!934292 (= lt!612783 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46068 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46068 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95421 (store (arr!46068 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46618 a!2901)) mask!2840)))))

(declare-fun b!1394886 () Bool)

(assert (=> b!1394886 (= e!789707 (bvsge mask!2840 #b00000000000000000000000000000000))))

(declare-fun b!1394887 () Bool)

(declare-fun res!934293 () Bool)

(assert (=> b!1394887 (=> (not res!934293) (not e!789705))))

(assert (=> b!1394887 (= res!934293 (and (= (size!46618 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46618 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46618 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!934289 () Bool)

(assert (=> start!119738 (=> (not res!934289) (not e!789705))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119738 (= res!934289 (validMask!0 mask!2840))))

(assert (=> start!119738 e!789705))

(assert (=> start!119738 true))

(declare-fun array_inv!35096 (array!95420) Bool)

(assert (=> start!119738 (array_inv!35096 a!2901)))

(declare-fun b!1394888 () Bool)

(declare-fun res!934294 () Bool)

(assert (=> b!1394888 (=> (not res!934294) (not e!789705))))

(assert (=> b!1394888 (= res!934294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394889 () Bool)

(declare-fun res!934296 () Bool)

(assert (=> b!1394889 (=> (not res!934296) (not e!789705))))

(declare-datatypes ((List!32587 0))(
  ( (Nil!32584) (Cons!32583 (h!33816 (_ BitVec 64)) (t!47281 List!32587)) )
))
(declare-fun arrayNoDuplicates!0 (array!95420 (_ BitVec 32) List!32587) Bool)

(assert (=> b!1394889 (= res!934296 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32584))))

(assert (= (and start!119738 res!934289) b!1394887))

(assert (= (and b!1394887 res!934293) b!1394881))

(assert (= (and b!1394881 res!934291) b!1394883))

(assert (= (and b!1394883 res!934290) b!1394888))

(assert (= (and b!1394888 res!934294) b!1394889))

(assert (= (and b!1394889 res!934296) b!1394882))

(assert (= (and b!1394882 res!934295) b!1394884))

(assert (= (and b!1394882 (not res!934297)) b!1394885))

(assert (= (and b!1394885 (not res!934292)) b!1394886))

(declare-fun m!1281373 () Bool)

(assert (=> b!1394888 m!1281373))

(declare-fun m!1281375 () Bool)

(assert (=> b!1394885 m!1281375))

(declare-fun m!1281377 () Bool)

(assert (=> b!1394885 m!1281377))

(assert (=> b!1394885 m!1281377))

(declare-fun m!1281379 () Bool)

(assert (=> b!1394885 m!1281379))

(assert (=> b!1394885 m!1281379))

(assert (=> b!1394885 m!1281377))

(declare-fun m!1281381 () Bool)

(assert (=> b!1394885 m!1281381))

(declare-fun m!1281383 () Bool)

(assert (=> b!1394883 m!1281383))

(assert (=> b!1394883 m!1281383))

(declare-fun m!1281385 () Bool)

(assert (=> b!1394883 m!1281385))

(assert (=> b!1394884 m!1281383))

(assert (=> b!1394884 m!1281383))

(declare-fun m!1281387 () Bool)

(assert (=> b!1394884 m!1281387))

(declare-fun m!1281389 () Bool)

(assert (=> start!119738 m!1281389))

(declare-fun m!1281391 () Bool)

(assert (=> start!119738 m!1281391))

(declare-fun m!1281393 () Bool)

(assert (=> b!1394881 m!1281393))

(assert (=> b!1394881 m!1281393))

(declare-fun m!1281395 () Bool)

(assert (=> b!1394881 m!1281395))

(assert (=> b!1394882 m!1281383))

(declare-fun m!1281397 () Bool)

(assert (=> b!1394882 m!1281397))

(assert (=> b!1394882 m!1281383))

(declare-fun m!1281399 () Bool)

(assert (=> b!1394882 m!1281399))

(assert (=> b!1394882 m!1281397))

(assert (=> b!1394882 m!1281383))

(declare-fun m!1281401 () Bool)

(assert (=> b!1394882 m!1281401))

(declare-fun m!1281403 () Bool)

(assert (=> b!1394882 m!1281403))

(declare-fun m!1281405 () Bool)

(assert (=> b!1394889 m!1281405))

(check-sat (not b!1394889) (not b!1394888) (not start!119738) (not b!1394885) (not b!1394881) (not b!1394882) (not b!1394883) (not b!1394884))
(check-sat)
