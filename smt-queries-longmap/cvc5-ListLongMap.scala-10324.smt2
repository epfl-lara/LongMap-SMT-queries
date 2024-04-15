; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121428 () Bool)

(assert start!121428)

(declare-fun res!948053 () Bool)

(declare-fun e!798359 () Bool)

(assert (=> start!121428 (=> (not res!948053) (not e!798359))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121428 (= res!948053 (validMask!0 mask!2840))))

(assert (=> start!121428 e!798359))

(assert (=> start!121428 true))

(declare-datatypes ((array!96382 0))(
  ( (array!96383 (arr!46530 (Array (_ BitVec 32) (_ BitVec 64))) (size!47082 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96382)

(declare-fun array_inv!35763 (array!96382) Bool)

(assert (=> start!121428 (array_inv!35763 a!2901)))

(declare-fun b!1410770 () Bool)

(declare-fun res!948049 () Bool)

(assert (=> b!1410770 (=> (not res!948049) (not e!798359))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1410770 (= res!948049 (and (= (size!47082 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47082 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47082 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1410771 () Bool)

(declare-fun e!798357 () Bool)

(assert (=> b!1410771 (= e!798359 (not e!798357))))

(declare-fun res!948054 () Bool)

(assert (=> b!1410771 (=> res!948054 e!798357)))

(declare-datatypes ((SeekEntryResult!10867 0))(
  ( (MissingZero!10867 (index!45845 (_ BitVec 32))) (Found!10867 (index!45846 (_ BitVec 32))) (Intermediate!10867 (undefined!11679 Bool) (index!45847 (_ BitVec 32)) (x!127435 (_ BitVec 32))) (Undefined!10867) (MissingVacant!10867 (index!45848 (_ BitVec 32))) )
))
(declare-fun lt!621171 () SeekEntryResult!10867)

(assert (=> b!1410771 (= res!948054 (or (not (is-Intermediate!10867 lt!621171)) (undefined!11679 lt!621171)))))

(declare-fun e!798358 () Bool)

(assert (=> b!1410771 e!798358))

(declare-fun res!948050 () Bool)

(assert (=> b!1410771 (=> (not res!948050) (not e!798358))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96382 (_ BitVec 32)) Bool)

(assert (=> b!1410771 (= res!948050 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47551 0))(
  ( (Unit!47552) )
))
(declare-fun lt!621173 () Unit!47551)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96382 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47551)

(assert (=> b!1410771 (= lt!621173 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96382 (_ BitVec 32)) SeekEntryResult!10867)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410771 (= lt!621171 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46530 a!2901) j!112) mask!2840) (select (arr!46530 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1410772 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96382 (_ BitVec 32)) SeekEntryResult!10867)

(assert (=> b!1410772 (= e!798358 (= (seekEntryOrOpen!0 (select (arr!46530 a!2901) j!112) a!2901 mask!2840) (Found!10867 j!112)))))

(declare-fun b!1410773 () Bool)

(declare-fun res!948055 () Bool)

(assert (=> b!1410773 (=> (not res!948055) (not e!798359))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410773 (= res!948055 (validKeyInArray!0 (select (arr!46530 a!2901) i!1037)))))

(declare-fun b!1410774 () Bool)

(declare-fun res!948048 () Bool)

(assert (=> b!1410774 (=> (not res!948048) (not e!798359))))

(assert (=> b!1410774 (= res!948048 (validKeyInArray!0 (select (arr!46530 a!2901) j!112)))))

(declare-fun b!1410775 () Bool)

(declare-fun res!948052 () Bool)

(assert (=> b!1410775 (=> (not res!948052) (not e!798359))))

(declare-datatypes ((List!33127 0))(
  ( (Nil!33124) (Cons!33123 (h!34395 (_ BitVec 64)) (t!47813 List!33127)) )
))
(declare-fun arrayNoDuplicates!0 (array!96382 (_ BitVec 32) List!33127) Bool)

(assert (=> b!1410775 (= res!948052 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33124))))

(declare-fun b!1410776 () Bool)

(declare-fun res!948051 () Bool)

(assert (=> b!1410776 (=> (not res!948051) (not e!798359))))

(assert (=> b!1410776 (= res!948051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1410777 () Bool)

(assert (=> b!1410777 (= e!798357 true)))

(declare-fun lt!621172 () SeekEntryResult!10867)

(assert (=> b!1410777 (= lt!621172 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46530 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46530 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96383 (store (arr!46530 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47082 a!2901)) mask!2840))))

(assert (= (and start!121428 res!948053) b!1410770))

(assert (= (and b!1410770 res!948049) b!1410773))

(assert (= (and b!1410773 res!948055) b!1410774))

(assert (= (and b!1410774 res!948048) b!1410776))

(assert (= (and b!1410776 res!948051) b!1410775))

(assert (= (and b!1410775 res!948052) b!1410771))

(assert (= (and b!1410771 res!948050) b!1410772))

(assert (= (and b!1410771 (not res!948054)) b!1410777))

(declare-fun m!1299999 () Bool)

(assert (=> b!1410776 m!1299999))

(declare-fun m!1300001 () Bool)

(assert (=> b!1410771 m!1300001))

(declare-fun m!1300003 () Bool)

(assert (=> b!1410771 m!1300003))

(assert (=> b!1410771 m!1300001))

(declare-fun m!1300005 () Bool)

(assert (=> b!1410771 m!1300005))

(assert (=> b!1410771 m!1300003))

(assert (=> b!1410771 m!1300001))

(declare-fun m!1300007 () Bool)

(assert (=> b!1410771 m!1300007))

(declare-fun m!1300009 () Bool)

(assert (=> b!1410771 m!1300009))

(declare-fun m!1300011 () Bool)

(assert (=> b!1410777 m!1300011))

(declare-fun m!1300013 () Bool)

(assert (=> b!1410777 m!1300013))

(assert (=> b!1410777 m!1300013))

(declare-fun m!1300015 () Bool)

(assert (=> b!1410777 m!1300015))

(assert (=> b!1410777 m!1300015))

(assert (=> b!1410777 m!1300013))

(declare-fun m!1300017 () Bool)

(assert (=> b!1410777 m!1300017))

(declare-fun m!1300019 () Bool)

(assert (=> b!1410773 m!1300019))

(assert (=> b!1410773 m!1300019))

(declare-fun m!1300021 () Bool)

(assert (=> b!1410773 m!1300021))

(assert (=> b!1410772 m!1300001))

(assert (=> b!1410772 m!1300001))

(declare-fun m!1300023 () Bool)

(assert (=> b!1410772 m!1300023))

(declare-fun m!1300025 () Bool)

(assert (=> b!1410775 m!1300025))

(declare-fun m!1300027 () Bool)

(assert (=> start!121428 m!1300027))

(declare-fun m!1300029 () Bool)

(assert (=> start!121428 m!1300029))

(assert (=> b!1410774 m!1300001))

(assert (=> b!1410774 m!1300001))

(declare-fun m!1300031 () Bool)

(assert (=> b!1410774 m!1300031))

(push 1)

(assert (not b!1410773))

(assert (not b!1410771))

(assert (not b!1410774))

(assert (not b!1410772))

(assert (not b!1410775))

(assert (not start!121428))

(assert (not b!1410777))

(assert (not b!1410776))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

