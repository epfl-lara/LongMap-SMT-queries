; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126792 () Bool)

(assert start!126792)

(declare-fun b!1485689 () Bool)

(declare-fun e!833125 () Bool)

(declare-fun e!833124 () Bool)

(assert (=> b!1485689 (= e!833125 e!833124)))

(declare-fun res!1009428 () Bool)

(assert (=> b!1485689 (=> res!1009428 e!833124)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!648249 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99592 0))(
  ( (array!99593 (arr!48067 (Array (_ BitVec 32) (_ BitVec 64))) (size!48618 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99592)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1485689 (= res!1009428 (or (and (= (select (arr!48067 a!2862) index!646) lt!648249) (= (select (arr!48067 a!2862) index!646) (select (arr!48067 a!2862) j!93))) (= (select (arr!48067 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1485689 (= lt!648249 (select (store (arr!48067 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1485690 () Bool)

(declare-fun e!833127 () Bool)

(assert (=> b!1485690 (= e!833124 e!833127)))

(declare-fun res!1009413 () Bool)

(assert (=> b!1485690 (=> (not res!1009413) (not e!833127))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1485690 (= res!1009413 (and (= index!646 intermediateAfterIndex!19) (= lt!648249 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1485691 () Bool)

(declare-fun e!833126 () Bool)

(declare-fun e!833121 () Bool)

(assert (=> b!1485691 (= e!833126 (not e!833121))))

(declare-fun res!1009417 () Bool)

(assert (=> b!1485691 (=> res!1009417 e!833121)))

(assert (=> b!1485691 (= res!1009417 (or (and (= (select (arr!48067 a!2862) index!646) (select (store (arr!48067 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48067 a!2862) index!646) (select (arr!48067 a!2862) j!93))) (= (select (arr!48067 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1485691 e!833125))

(declare-fun res!1009426 () Bool)

(assert (=> b!1485691 (=> (not res!1009426) (not e!833125))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99592 (_ BitVec 32)) Bool)

(assert (=> b!1485691 (= res!1009426 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49781 0))(
  ( (Unit!49782) )
))
(declare-fun lt!648248 () Unit!49781)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99592 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49781)

(assert (=> b!1485691 (= lt!648248 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1485692 () Bool)

(declare-fun lt!648245 () (_ BitVec 64))

(declare-fun lt!648244 () array!99592)

(declare-datatypes ((SeekEntryResult!12204 0))(
  ( (MissingZero!12204 (index!51208 (_ BitVec 32))) (Found!12204 (index!51209 (_ BitVec 32))) (Intermediate!12204 (undefined!13016 Bool) (index!51210 (_ BitVec 32)) (x!132977 (_ BitVec 32))) (Undefined!12204) (MissingVacant!12204 (index!51211 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99592 (_ BitVec 32)) SeekEntryResult!12204)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99592 (_ BitVec 32)) SeekEntryResult!12204)

(assert (=> b!1485692 (= e!833127 (= (seekEntryOrOpen!0 lt!648245 lt!648244 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648245 lt!648244 mask!2687)))))

(declare-fun b!1485693 () Bool)

(assert (=> b!1485693 (= e!833121 true)))

(declare-fun lt!648247 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485693 (= lt!648247 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1485694 () Bool)

(declare-fun res!1009412 () Bool)

(assert (=> b!1485694 (=> (not res!1009412) (not e!833126))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1485694 (= res!1009412 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1485695 () Bool)

(declare-fun res!1009425 () Bool)

(declare-fun e!833130 () Bool)

(assert (=> b!1485695 (=> (not res!1009425) (not e!833130))))

(declare-datatypes ((List!34555 0))(
  ( (Nil!34552) (Cons!34551 (h!35939 (_ BitVec 64)) (t!49241 List!34555)) )
))
(declare-fun arrayNoDuplicates!0 (array!99592 (_ BitVec 32) List!34555) Bool)

(assert (=> b!1485695 (= res!1009425 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34552))))

(declare-fun b!1485696 () Bool)

(declare-fun res!1009418 () Bool)

(assert (=> b!1485696 (=> (not res!1009418) (not e!833130))))

(assert (=> b!1485696 (= res!1009418 (and (= (size!48618 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48618 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48618 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!1009421 () Bool)

(assert (=> start!126792 (=> (not res!1009421) (not e!833130))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126792 (= res!1009421 (validMask!0 mask!2687))))

(assert (=> start!126792 e!833130))

(assert (=> start!126792 true))

(declare-fun array_inv!37348 (array!99592) Bool)

(assert (=> start!126792 (array_inv!37348 a!2862)))

(declare-fun b!1485697 () Bool)

(declare-fun e!833123 () Bool)

(assert (=> b!1485697 (= e!833130 e!833123)))

(declare-fun res!1009424 () Bool)

(assert (=> b!1485697 (=> (not res!1009424) (not e!833123))))

(assert (=> b!1485697 (= res!1009424 (= (select (store (arr!48067 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1485697 (= lt!648244 (array!99593 (store (arr!48067 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48618 a!2862)))))

(declare-fun b!1485698 () Bool)

(declare-fun res!1009414 () Bool)

(assert (=> b!1485698 (=> (not res!1009414) (not e!833125))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1485698 (= res!1009414 (or (= (select (arr!48067 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48067 a!2862) intermediateBeforeIndex!19) (select (arr!48067 a!2862) j!93))))))

(declare-fun b!1485699 () Bool)

(declare-fun res!1009427 () Bool)

(declare-fun e!833129 () Bool)

(assert (=> b!1485699 (=> (not res!1009427) (not e!833129))))

(declare-fun lt!648250 () SeekEntryResult!12204)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99592 (_ BitVec 32)) SeekEntryResult!12204)

(assert (=> b!1485699 (= res!1009427 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48067 a!2862) j!93) a!2862 mask!2687) lt!648250))))

(declare-fun b!1485700 () Bool)

(declare-fun res!1009415 () Bool)

(assert (=> b!1485700 (=> (not res!1009415) (not e!833130))))

(assert (=> b!1485700 (= res!1009415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1485701 () Bool)

(declare-fun res!1009429 () Bool)

(assert (=> b!1485701 (=> (not res!1009429) (not e!833130))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1485701 (= res!1009429 (validKeyInArray!0 (select (arr!48067 a!2862) i!1006)))))

(declare-fun b!1485702 () Bool)

(declare-fun e!833122 () Bool)

(assert (=> b!1485702 (= e!833122 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648245 lt!648244 mask!2687) (seekEntryOrOpen!0 lt!648245 lt!648244 mask!2687)))))

(declare-fun lt!648246 () SeekEntryResult!12204)

(declare-fun b!1485703 () Bool)

(assert (=> b!1485703 (= e!833122 (= lt!648246 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648245 lt!648244 mask!2687)))))

(declare-fun b!1485704 () Bool)

(declare-fun res!1009430 () Bool)

(assert (=> b!1485704 (=> (not res!1009430) (not e!833130))))

(assert (=> b!1485704 (= res!1009430 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48618 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48618 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48618 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1485705 () Bool)

(declare-fun res!1009419 () Bool)

(assert (=> b!1485705 (=> (not res!1009419) (not e!833125))))

(assert (=> b!1485705 (= res!1009419 (= (seekEntryOrOpen!0 (select (arr!48067 a!2862) j!93) a!2862 mask!2687) (Found!12204 j!93)))))

(declare-fun b!1485706 () Bool)

(assert (=> b!1485706 (= e!833129 e!833126)))

(declare-fun res!1009420 () Bool)

(assert (=> b!1485706 (=> (not res!1009420) (not e!833126))))

(assert (=> b!1485706 (= res!1009420 (= lt!648246 (Intermediate!12204 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485706 (= lt!648246 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648245 mask!2687) lt!648245 lt!648244 mask!2687))))

(assert (=> b!1485706 (= lt!648245 (select (store (arr!48067 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1485707 () Bool)

(assert (=> b!1485707 (= e!833123 e!833129)))

(declare-fun res!1009423 () Bool)

(assert (=> b!1485707 (=> (not res!1009423) (not e!833129))))

(assert (=> b!1485707 (= res!1009423 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48067 a!2862) j!93) mask!2687) (select (arr!48067 a!2862) j!93) a!2862 mask!2687) lt!648250))))

(assert (=> b!1485707 (= lt!648250 (Intermediate!12204 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1485708 () Bool)

(declare-fun res!1009416 () Bool)

(assert (=> b!1485708 (=> (not res!1009416) (not e!833130))))

(assert (=> b!1485708 (= res!1009416 (validKeyInArray!0 (select (arr!48067 a!2862) j!93)))))

(declare-fun b!1485709 () Bool)

(declare-fun res!1009422 () Bool)

(assert (=> b!1485709 (=> (not res!1009422) (not e!833126))))

(assert (=> b!1485709 (= res!1009422 e!833122)))

(declare-fun c!137671 () Bool)

(assert (=> b!1485709 (= c!137671 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!126792 res!1009421) b!1485696))

(assert (= (and b!1485696 res!1009418) b!1485701))

(assert (= (and b!1485701 res!1009429) b!1485708))

(assert (= (and b!1485708 res!1009416) b!1485700))

(assert (= (and b!1485700 res!1009415) b!1485695))

(assert (= (and b!1485695 res!1009425) b!1485704))

(assert (= (and b!1485704 res!1009430) b!1485697))

(assert (= (and b!1485697 res!1009424) b!1485707))

(assert (= (and b!1485707 res!1009423) b!1485699))

(assert (= (and b!1485699 res!1009427) b!1485706))

(assert (= (and b!1485706 res!1009420) b!1485709))

(assert (= (and b!1485709 c!137671) b!1485703))

(assert (= (and b!1485709 (not c!137671)) b!1485702))

(assert (= (and b!1485709 res!1009422) b!1485694))

(assert (= (and b!1485694 res!1009412) b!1485691))

(assert (= (and b!1485691 res!1009426) b!1485705))

(assert (= (and b!1485705 res!1009419) b!1485698))

(assert (= (and b!1485698 res!1009414) b!1485689))

(assert (= (and b!1485689 (not res!1009428)) b!1485690))

(assert (= (and b!1485690 res!1009413) b!1485692))

(assert (= (and b!1485691 (not res!1009417)) b!1485693))

(declare-fun m!1371055 () Bool)

(assert (=> b!1485692 m!1371055))

(declare-fun m!1371057 () Bool)

(assert (=> b!1485692 m!1371057))

(declare-fun m!1371059 () Bool)

(assert (=> b!1485701 m!1371059))

(assert (=> b!1485701 m!1371059))

(declare-fun m!1371061 () Bool)

(assert (=> b!1485701 m!1371061))

(declare-fun m!1371063 () Bool)

(assert (=> start!126792 m!1371063))

(declare-fun m!1371065 () Bool)

(assert (=> start!126792 m!1371065))

(declare-fun m!1371067 () Bool)

(assert (=> b!1485699 m!1371067))

(assert (=> b!1485699 m!1371067))

(declare-fun m!1371069 () Bool)

(assert (=> b!1485699 m!1371069))

(declare-fun m!1371071 () Bool)

(assert (=> b!1485697 m!1371071))

(declare-fun m!1371073 () Bool)

(assert (=> b!1485697 m!1371073))

(declare-fun m!1371075 () Bool)

(assert (=> b!1485698 m!1371075))

(assert (=> b!1485698 m!1371067))

(declare-fun m!1371077 () Bool)

(assert (=> b!1485691 m!1371077))

(assert (=> b!1485691 m!1371071))

(declare-fun m!1371079 () Bool)

(assert (=> b!1485691 m!1371079))

(declare-fun m!1371081 () Bool)

(assert (=> b!1485691 m!1371081))

(declare-fun m!1371083 () Bool)

(assert (=> b!1485691 m!1371083))

(assert (=> b!1485691 m!1371067))

(assert (=> b!1485707 m!1371067))

(assert (=> b!1485707 m!1371067))

(declare-fun m!1371085 () Bool)

(assert (=> b!1485707 m!1371085))

(assert (=> b!1485707 m!1371085))

(assert (=> b!1485707 m!1371067))

(declare-fun m!1371087 () Bool)

(assert (=> b!1485707 m!1371087))

(declare-fun m!1371089 () Bool)

(assert (=> b!1485695 m!1371089))

(declare-fun m!1371091 () Bool)

(assert (=> b!1485700 m!1371091))

(declare-fun m!1371093 () Bool)

(assert (=> b!1485693 m!1371093))

(declare-fun m!1371095 () Bool)

(assert (=> b!1485703 m!1371095))

(assert (=> b!1485689 m!1371081))

(assert (=> b!1485689 m!1371067))

(assert (=> b!1485689 m!1371071))

(assert (=> b!1485689 m!1371079))

(declare-fun m!1371097 () Bool)

(assert (=> b!1485706 m!1371097))

(assert (=> b!1485706 m!1371097))

(declare-fun m!1371099 () Bool)

(assert (=> b!1485706 m!1371099))

(assert (=> b!1485706 m!1371071))

(declare-fun m!1371101 () Bool)

(assert (=> b!1485706 m!1371101))

(assert (=> b!1485705 m!1371067))

(assert (=> b!1485705 m!1371067))

(declare-fun m!1371103 () Bool)

(assert (=> b!1485705 m!1371103))

(assert (=> b!1485708 m!1371067))

(assert (=> b!1485708 m!1371067))

(declare-fun m!1371105 () Bool)

(assert (=> b!1485708 m!1371105))

(assert (=> b!1485702 m!1371057))

(assert (=> b!1485702 m!1371055))

(check-sat (not b!1485706) (not b!1485703) (not b!1485692) (not b!1485707) (not start!126792) (not b!1485701) (not b!1485693) (not b!1485699) (not b!1485691) (not b!1485700) (not b!1485705) (not b!1485702) (not b!1485708) (not b!1485695))
(check-sat)
