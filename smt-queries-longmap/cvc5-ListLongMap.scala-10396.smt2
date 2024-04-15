; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122496 () Bool)

(assert start!122496)

(declare-fun b!1419041 () Bool)

(declare-fun res!954612 () Bool)

(declare-fun e!802946 () Bool)

(assert (=> b!1419041 (=> (not res!954612) (not e!802946))))

(declare-datatypes ((array!96853 0))(
  ( (array!96854 (arr!46746 (Array (_ BitVec 32) (_ BitVec 64))) (size!47298 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96853)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419041 (= res!954612 (validKeyInArray!0 (select (arr!46746 a!2831) j!81)))))

(declare-fun res!954618 () Bool)

(assert (=> start!122496 (=> (not res!954618) (not e!802946))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122496 (= res!954618 (validMask!0 mask!2608))))

(assert (=> start!122496 e!802946))

(assert (=> start!122496 true))

(declare-fun array_inv!35979 (array!96853) Bool)

(assert (=> start!122496 (array_inv!35979 a!2831)))

(declare-fun b!1419042 () Bool)

(declare-fun res!954617 () Bool)

(assert (=> b!1419042 (=> (not res!954617) (not e!802946))))

(declare-datatypes ((List!33334 0))(
  ( (Nil!33331) (Cons!33330 (h!34629 (_ BitVec 64)) (t!48020 List!33334)) )
))
(declare-fun arrayNoDuplicates!0 (array!96853 (_ BitVec 32) List!33334) Bool)

(assert (=> b!1419042 (= res!954617 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33331))))

(declare-fun b!1419043 () Bool)

(declare-fun res!954615 () Bool)

(assert (=> b!1419043 (=> (not res!954615) (not e!802946))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419043 (= res!954615 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47298 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47298 a!2831))))))

(declare-fun b!1419044 () Bool)

(assert (=> b!1419044 (= e!802946 false)))

(declare-fun lt!625541 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419044 (= lt!625541 (toIndex!0 (select (store (arr!46746 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(declare-fun b!1419045 () Bool)

(declare-fun res!954619 () Bool)

(assert (=> b!1419045 (=> (not res!954619) (not e!802946))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96853 (_ BitVec 32)) Bool)

(assert (=> b!1419045 (= res!954619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419046 () Bool)

(declare-fun res!954613 () Bool)

(assert (=> b!1419046 (=> (not res!954613) (not e!802946))))

(declare-datatypes ((SeekEntryResult!11058 0))(
  ( (MissingZero!11058 (index!46624 (_ BitVec 32))) (Found!11058 (index!46625 (_ BitVec 32))) (Intermediate!11058 (undefined!11870 Bool) (index!46626 (_ BitVec 32)) (x!128283 (_ BitVec 32))) (Undefined!11058) (MissingVacant!11058 (index!46627 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96853 (_ BitVec 32)) SeekEntryResult!11058)

(assert (=> b!1419046 (= res!954613 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46746 a!2831) j!81) mask!2608) (select (arr!46746 a!2831) j!81) a!2831 mask!2608) (Intermediate!11058 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1419047 () Bool)

(declare-fun res!954616 () Bool)

(assert (=> b!1419047 (=> (not res!954616) (not e!802946))))

(assert (=> b!1419047 (= res!954616 (validKeyInArray!0 (select (arr!46746 a!2831) i!982)))))

(declare-fun b!1419048 () Bool)

(declare-fun res!954614 () Bool)

(assert (=> b!1419048 (=> (not res!954614) (not e!802946))))

(assert (=> b!1419048 (= res!954614 (and (= (size!47298 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47298 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47298 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!122496 res!954618) b!1419048))

(assert (= (and b!1419048 res!954614) b!1419047))

(assert (= (and b!1419047 res!954616) b!1419041))

(assert (= (and b!1419041 res!954612) b!1419045))

(assert (= (and b!1419045 res!954619) b!1419042))

(assert (= (and b!1419042 res!954617) b!1419043))

(assert (= (and b!1419043 res!954615) b!1419046))

(assert (= (and b!1419046 res!954613) b!1419044))

(declare-fun m!1309075 () Bool)

(assert (=> b!1419044 m!1309075))

(declare-fun m!1309077 () Bool)

(assert (=> b!1419044 m!1309077))

(assert (=> b!1419044 m!1309077))

(declare-fun m!1309079 () Bool)

(assert (=> b!1419044 m!1309079))

(declare-fun m!1309081 () Bool)

(assert (=> b!1419041 m!1309081))

(assert (=> b!1419041 m!1309081))

(declare-fun m!1309083 () Bool)

(assert (=> b!1419041 m!1309083))

(declare-fun m!1309085 () Bool)

(assert (=> start!122496 m!1309085))

(declare-fun m!1309087 () Bool)

(assert (=> start!122496 m!1309087))

(assert (=> b!1419046 m!1309081))

(assert (=> b!1419046 m!1309081))

(declare-fun m!1309089 () Bool)

(assert (=> b!1419046 m!1309089))

(assert (=> b!1419046 m!1309089))

(assert (=> b!1419046 m!1309081))

(declare-fun m!1309091 () Bool)

(assert (=> b!1419046 m!1309091))

(declare-fun m!1309093 () Bool)

(assert (=> b!1419047 m!1309093))

(assert (=> b!1419047 m!1309093))

(declare-fun m!1309095 () Bool)

(assert (=> b!1419047 m!1309095))

(declare-fun m!1309097 () Bool)

(assert (=> b!1419045 m!1309097))

(declare-fun m!1309099 () Bool)

(assert (=> b!1419042 m!1309099))

(push 1)

(assert (not b!1419046))

(assert (not b!1419044))

(assert (not b!1419042))

(assert (not b!1419045))

(assert (not b!1419047))

(assert (not b!1419041))

(assert (not start!122496))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

