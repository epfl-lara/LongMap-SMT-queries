; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120824 () Bool)

(assert start!120824)

(declare-fun res!944049 () Bool)

(declare-fun e!795737 () Bool)

(assert (=> start!120824 (=> (not res!944049) (not e!795737))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120824 (= res!944049 (validMask!0 mask!2840))))

(assert (=> start!120824 e!795737))

(assert (=> start!120824 true))

(declare-datatypes ((array!96131 0))(
  ( (array!96132 (arr!46413 (Array (_ BitVec 32) (_ BitVec 64))) (size!46963 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96131)

(declare-fun array_inv!35441 (array!96131) Bool)

(assert (=> start!120824 (array_inv!35441 a!2901)))

(declare-fun b!1405832 () Bool)

(declare-fun e!795740 () Bool)

(assert (=> b!1405832 (= e!795740 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10724 0))(
  ( (MissingZero!10724 (index!45273 (_ BitVec 32))) (Found!10724 (index!45274 (_ BitVec 32))) (Intermediate!10724 (undefined!11536 Bool) (index!45275 (_ BitVec 32)) (x!126883 (_ BitVec 32))) (Undefined!10724) (MissingVacant!10724 (index!45276 (_ BitVec 32))) )
))
(declare-fun lt!619158 () SeekEntryResult!10724)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96131 (_ BitVec 32)) SeekEntryResult!10724)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405832 (= lt!619158 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46413 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46413 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96132 (store (arr!46413 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46963 a!2901)) mask!2840))))

(declare-fun b!1405833 () Bool)

(assert (=> b!1405833 (= e!795737 (not e!795740))))

(declare-fun res!944050 () Bool)

(assert (=> b!1405833 (=> res!944050 e!795740)))

(declare-fun lt!619157 () SeekEntryResult!10724)

(get-info :version)

(assert (=> b!1405833 (= res!944050 (or (not ((_ is Intermediate!10724) lt!619157)) (undefined!11536 lt!619157)))))

(declare-fun e!795739 () Bool)

(assert (=> b!1405833 e!795739))

(declare-fun res!944054 () Bool)

(assert (=> b!1405833 (=> (not res!944054) (not e!795739))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96131 (_ BitVec 32)) Bool)

(assert (=> b!1405833 (= res!944054 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47422 0))(
  ( (Unit!47423) )
))
(declare-fun lt!619156 () Unit!47422)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96131 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47422)

(assert (=> b!1405833 (= lt!619156 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1405833 (= lt!619157 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46413 a!2901) j!112) mask!2840) (select (arr!46413 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405834 () Bool)

(declare-fun res!944051 () Bool)

(assert (=> b!1405834 (=> (not res!944051) (not e!795737))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405834 (= res!944051 (validKeyInArray!0 (select (arr!46413 a!2901) j!112)))))

(declare-fun b!1405835 () Bool)

(declare-fun res!944056 () Bool)

(assert (=> b!1405835 (=> (not res!944056) (not e!795737))))

(assert (=> b!1405835 (= res!944056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405836 () Bool)

(declare-fun res!944052 () Bool)

(assert (=> b!1405836 (=> (not res!944052) (not e!795737))))

(declare-datatypes ((List!32932 0))(
  ( (Nil!32929) (Cons!32928 (h!34182 (_ BitVec 64)) (t!47626 List!32932)) )
))
(declare-fun arrayNoDuplicates!0 (array!96131 (_ BitVec 32) List!32932) Bool)

(assert (=> b!1405836 (= res!944052 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32929))))

(declare-fun b!1405837 () Bool)

(declare-fun res!944053 () Bool)

(assert (=> b!1405837 (=> (not res!944053) (not e!795737))))

(assert (=> b!1405837 (= res!944053 (and (= (size!46963 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46963 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46963 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405838 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96131 (_ BitVec 32)) SeekEntryResult!10724)

(assert (=> b!1405838 (= e!795739 (= (seekEntryOrOpen!0 (select (arr!46413 a!2901) j!112) a!2901 mask!2840) (Found!10724 j!112)))))

(declare-fun b!1405839 () Bool)

(declare-fun res!944055 () Bool)

(assert (=> b!1405839 (=> (not res!944055) (not e!795737))))

(assert (=> b!1405839 (= res!944055 (validKeyInArray!0 (select (arr!46413 a!2901) i!1037)))))

(assert (= (and start!120824 res!944049) b!1405837))

(assert (= (and b!1405837 res!944053) b!1405839))

(assert (= (and b!1405839 res!944055) b!1405834))

(assert (= (and b!1405834 res!944051) b!1405835))

(assert (= (and b!1405835 res!944056) b!1405836))

(assert (= (and b!1405836 res!944052) b!1405833))

(assert (= (and b!1405833 res!944054) b!1405838))

(assert (= (and b!1405833 (not res!944050)) b!1405832))

(declare-fun m!1294723 () Bool)

(assert (=> b!1405834 m!1294723))

(assert (=> b!1405834 m!1294723))

(declare-fun m!1294725 () Bool)

(assert (=> b!1405834 m!1294725))

(assert (=> b!1405833 m!1294723))

(declare-fun m!1294727 () Bool)

(assert (=> b!1405833 m!1294727))

(assert (=> b!1405833 m!1294723))

(declare-fun m!1294729 () Bool)

(assert (=> b!1405833 m!1294729))

(assert (=> b!1405833 m!1294727))

(assert (=> b!1405833 m!1294723))

(declare-fun m!1294731 () Bool)

(assert (=> b!1405833 m!1294731))

(declare-fun m!1294733 () Bool)

(assert (=> b!1405833 m!1294733))

(declare-fun m!1294735 () Bool)

(assert (=> b!1405839 m!1294735))

(assert (=> b!1405839 m!1294735))

(declare-fun m!1294737 () Bool)

(assert (=> b!1405839 m!1294737))

(declare-fun m!1294739 () Bool)

(assert (=> start!120824 m!1294739))

(declare-fun m!1294741 () Bool)

(assert (=> start!120824 m!1294741))

(declare-fun m!1294743 () Bool)

(assert (=> b!1405836 m!1294743))

(declare-fun m!1294745 () Bool)

(assert (=> b!1405835 m!1294745))

(declare-fun m!1294747 () Bool)

(assert (=> b!1405832 m!1294747))

(declare-fun m!1294749 () Bool)

(assert (=> b!1405832 m!1294749))

(assert (=> b!1405832 m!1294749))

(declare-fun m!1294751 () Bool)

(assert (=> b!1405832 m!1294751))

(assert (=> b!1405832 m!1294751))

(assert (=> b!1405832 m!1294749))

(declare-fun m!1294753 () Bool)

(assert (=> b!1405832 m!1294753))

(assert (=> b!1405838 m!1294723))

(assert (=> b!1405838 m!1294723))

(declare-fun m!1294755 () Bool)

(assert (=> b!1405838 m!1294755))

(check-sat (not b!1405835) (not start!120824) (not b!1405838) (not b!1405839) (not b!1405834) (not b!1405833) (not b!1405836) (not b!1405832))
