; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122678 () Bool)

(assert start!122678)

(declare-fun b!1421134 () Bool)

(declare-fun res!956627 () Bool)

(declare-fun e!803621 () Bool)

(assert (=> b!1421134 (=> (not res!956627) (not e!803621))))

(declare-datatypes ((array!96996 0))(
  ( (array!96997 (arr!46816 (Array (_ BitVec 32) (_ BitVec 64))) (size!47368 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96996)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96996 (_ BitVec 32)) Bool)

(assert (=> b!1421134 (= res!956627 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421135 () Bool)

(declare-fun res!956622 () Bool)

(assert (=> b!1421135 (=> (not res!956622) (not e!803621))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421135 (= res!956622 (validKeyInArray!0 (select (arr!46816 a!2831) i!982)))))

(declare-fun b!1421136 () Bool)

(declare-fun res!956618 () Bool)

(assert (=> b!1421136 (=> (not res!956618) (not e!803621))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1421136 (= res!956618 (and (= (size!47368 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47368 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47368 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421137 () Bool)

(declare-fun res!956629 () Bool)

(assert (=> b!1421137 (=> (not res!956629) (not e!803621))))

(assert (=> b!1421137 (= res!956629 (validKeyInArray!0 (select (arr!46816 a!2831) j!81)))))

(declare-fun b!1421138 () Bool)

(declare-fun e!803624 () Bool)

(assert (=> b!1421138 (= e!803624 (not (bvsge mask!2608 #b00000000000000000000000000000000)))))

(assert (=> b!1421138 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-datatypes ((Unit!47931 0))(
  ( (Unit!47932) )
))
(declare-fun lt!625982 () Unit!47931)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96996 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47931)

(assert (=> b!1421138 (= lt!625982 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1421139 () Bool)

(declare-fun res!956626 () Bool)

(assert (=> b!1421139 (=> (not res!956626) (not e!803621))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1421139 (= res!956626 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47368 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47368 a!2831))))))

(declare-fun res!956620 () Bool)

(assert (=> start!122678 (=> (not res!956620) (not e!803621))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122678 (= res!956620 (validMask!0 mask!2608))))

(assert (=> start!122678 e!803621))

(assert (=> start!122678 true))

(declare-fun array_inv!36049 (array!96996) Bool)

(assert (=> start!122678 (array_inv!36049 a!2831)))

(declare-fun b!1421140 () Bool)

(declare-fun e!803622 () Bool)

(assert (=> b!1421140 (= e!803622 e!803624)))

(declare-fun res!956624 () Bool)

(assert (=> b!1421140 (=> (not res!956624) (not e!803624))))

(declare-fun lt!625985 () (_ BitVec 64))

(declare-fun lt!625984 () array!96996)

(declare-datatypes ((SeekEntryResult!11128 0))(
  ( (MissingZero!11128 (index!46904 (_ BitVec 32))) (Found!11128 (index!46905 (_ BitVec 32))) (Intermediate!11128 (undefined!11940 Bool) (index!46906 (_ BitVec 32)) (x!128551 (_ BitVec 32))) (Undefined!11128) (MissingVacant!11128 (index!46907 (_ BitVec 32))) )
))
(declare-fun lt!625981 () SeekEntryResult!11128)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96996 (_ BitVec 32)) SeekEntryResult!11128)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421140 (= res!956624 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!625985 mask!2608) lt!625985 lt!625984 mask!2608) lt!625981))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1421140 (= lt!625981 (Intermediate!11128 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1421140 (= lt!625985 (select (store (arr!46816 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421140 (= lt!625984 (array!96997 (store (arr!46816 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47368 a!2831)))))

(declare-fun b!1421141 () Bool)

(declare-fun res!956628 () Bool)

(assert (=> b!1421141 (=> (not res!956628) (not e!803621))))

(declare-datatypes ((List!33404 0))(
  ( (Nil!33401) (Cons!33400 (h!34702 (_ BitVec 64)) (t!48090 List!33404)) )
))
(declare-fun arrayNoDuplicates!0 (array!96996 (_ BitVec 32) List!33404) Bool)

(assert (=> b!1421141 (= res!956628 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33401))))

(declare-fun b!1421142 () Bool)

(assert (=> b!1421142 (= e!803621 e!803622)))

(declare-fun res!956619 () Bool)

(assert (=> b!1421142 (=> (not res!956619) (not e!803622))))

(declare-fun lt!625983 () SeekEntryResult!11128)

(assert (=> b!1421142 (= res!956619 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46816 a!2831) j!81) mask!2608) (select (arr!46816 a!2831) j!81) a!2831 mask!2608) lt!625983))))

(assert (=> b!1421142 (= lt!625983 (Intermediate!11128 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1421143 () Bool)

(declare-fun res!956621 () Bool)

(assert (=> b!1421143 (=> (not res!956621) (not e!803624))))

(assert (=> b!1421143 (= res!956621 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46816 a!2831) j!81) a!2831 mask!2608) lt!625983))))

(declare-fun b!1421144 () Bool)

(declare-fun res!956625 () Bool)

(assert (=> b!1421144 (=> (not res!956625) (not e!803624))))

(assert (=> b!1421144 (= res!956625 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1421145 () Bool)

(declare-fun res!956623 () Bool)

(assert (=> b!1421145 (=> (not res!956623) (not e!803624))))

(assert (=> b!1421145 (= res!956623 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!625985 lt!625984 mask!2608) lt!625981))))

(assert (= (and start!122678 res!956620) b!1421136))

(assert (= (and b!1421136 res!956618) b!1421135))

(assert (= (and b!1421135 res!956622) b!1421137))

(assert (= (and b!1421137 res!956629) b!1421134))

(assert (= (and b!1421134 res!956627) b!1421141))

(assert (= (and b!1421141 res!956628) b!1421139))

(assert (= (and b!1421139 res!956626) b!1421142))

(assert (= (and b!1421142 res!956619) b!1421140))

(assert (= (and b!1421140 res!956624) b!1421143))

(assert (= (and b!1421143 res!956621) b!1421145))

(assert (= (and b!1421145 res!956623) b!1421144))

(assert (= (and b!1421144 res!956625) b!1421138))

(declare-fun m!1311207 () Bool)

(assert (=> b!1421141 m!1311207))

(declare-fun m!1311209 () Bool)

(assert (=> b!1421140 m!1311209))

(assert (=> b!1421140 m!1311209))

(declare-fun m!1311211 () Bool)

(assert (=> b!1421140 m!1311211))

(declare-fun m!1311213 () Bool)

(assert (=> b!1421140 m!1311213))

(declare-fun m!1311215 () Bool)

(assert (=> b!1421140 m!1311215))

(declare-fun m!1311217 () Bool)

(assert (=> b!1421137 m!1311217))

(assert (=> b!1421137 m!1311217))

(declare-fun m!1311219 () Bool)

(assert (=> b!1421137 m!1311219))

(declare-fun m!1311221 () Bool)

(assert (=> start!122678 m!1311221))

(declare-fun m!1311223 () Bool)

(assert (=> start!122678 m!1311223))

(assert (=> b!1421143 m!1311217))

(assert (=> b!1421143 m!1311217))

(declare-fun m!1311225 () Bool)

(assert (=> b!1421143 m!1311225))

(assert (=> b!1421142 m!1311217))

(assert (=> b!1421142 m!1311217))

(declare-fun m!1311227 () Bool)

(assert (=> b!1421142 m!1311227))

(assert (=> b!1421142 m!1311227))

(assert (=> b!1421142 m!1311217))

(declare-fun m!1311229 () Bool)

(assert (=> b!1421142 m!1311229))

(declare-fun m!1311231 () Bool)

(assert (=> b!1421134 m!1311231))

(declare-fun m!1311233 () Bool)

(assert (=> b!1421145 m!1311233))

(declare-fun m!1311235 () Bool)

(assert (=> b!1421138 m!1311235))

(declare-fun m!1311237 () Bool)

(assert (=> b!1421138 m!1311237))

(declare-fun m!1311239 () Bool)

(assert (=> b!1421135 m!1311239))

(assert (=> b!1421135 m!1311239))

(declare-fun m!1311241 () Bool)

(assert (=> b!1421135 m!1311241))

(check-sat (not b!1421134) (not b!1421140) (not b!1421141) (not b!1421142) (not b!1421135) (not b!1421138) (not start!122678) (not b!1421137) (not b!1421143) (not b!1421145))
(check-sat)
