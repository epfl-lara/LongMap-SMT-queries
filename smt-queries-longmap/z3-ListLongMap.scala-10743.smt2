; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125874 () Bool)

(assert start!125874)

(declare-datatypes ((SeekEntryResult!12000 0))(
  ( (MissingZero!12000 (index!50392 (_ BitVec 32))) (Found!12000 (index!50393 (_ BitVec 32))) (Intermediate!12000 (undefined!12812 Bool) (index!50394 (_ BitVec 32)) (x!132154 (_ BitVec 32))) (Undefined!12000) (MissingVacant!12000 (index!50395 (_ BitVec 32))) )
))
(declare-fun lt!643302 () SeekEntryResult!12000)

(declare-datatypes ((array!99160 0))(
  ( (array!99161 (arr!47863 (Array (_ BitVec 32) (_ BitVec 64))) (size!48414 (_ BitVec 32))) )
))
(declare-fun lt!643301 () array!99160)

(declare-fun lt!643299 () (_ BitVec 64))

(declare-fun e!826162 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1471474 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99160 (_ BitVec 32)) SeekEntryResult!12000)

(assert (=> b!1471474 (= e!826162 (not (= lt!643302 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643299 lt!643301 mask!2687))))))

(declare-fun b!1471475 () Bool)

(declare-fun e!826160 () Bool)

(declare-fun e!826163 () Bool)

(assert (=> b!1471475 (= e!826160 e!826163)))

(declare-fun res!998822 () Bool)

(assert (=> b!1471475 (=> (not res!998822) (not e!826163))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1471475 (= res!998822 (= lt!643302 (Intermediate!12000 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1471475 (= lt!643302 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643299 mask!2687) lt!643299 lt!643301 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99160)

(assert (=> b!1471475 (= lt!643299 (select (store (arr!47863 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1471476 () Bool)

(declare-fun res!998825 () Bool)

(declare-fun e!826159 () Bool)

(assert (=> b!1471476 (=> (not res!998825) (not e!826159))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99160 (_ BitVec 32)) Bool)

(assert (=> b!1471476 (= res!998825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1471477 () Bool)

(declare-fun res!998829 () Bool)

(assert (=> b!1471477 (=> (not res!998829) (not e!826159))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1471477 (= res!998829 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48414 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48414 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48414 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!998831 () Bool)

(assert (=> start!125874 (=> (not res!998831) (not e!826159))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125874 (= res!998831 (validMask!0 mask!2687))))

(assert (=> start!125874 e!826159))

(assert (=> start!125874 true))

(declare-fun array_inv!37144 (array!99160) Bool)

(assert (=> start!125874 (array_inv!37144 a!2862)))

(declare-fun b!1471478 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99160 (_ BitVec 32)) SeekEntryResult!12000)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99160 (_ BitVec 32)) SeekEntryResult!12000)

(assert (=> b!1471478 (= e!826162 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643299 lt!643301 mask!2687) (seekEntryOrOpen!0 lt!643299 lt!643301 mask!2687))))))

(declare-fun b!1471479 () Bool)

(declare-fun res!998830 () Bool)

(assert (=> b!1471479 (=> (not res!998830) (not e!826159))))

(declare-datatypes ((List!34351 0))(
  ( (Nil!34348) (Cons!34347 (h!35711 (_ BitVec 64)) (t!49037 List!34351)) )
))
(declare-fun arrayNoDuplicates!0 (array!99160 (_ BitVec 32) List!34351) Bool)

(assert (=> b!1471479 (= res!998830 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34348))))

(declare-fun b!1471480 () Bool)

(assert (=> b!1471480 (= e!826163 false)))

(declare-fun lt!643300 () Bool)

(assert (=> b!1471480 (= lt!643300 e!826162)))

(declare-fun c!135847 () Bool)

(assert (=> b!1471480 (= c!135847 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1471481 () Bool)

(declare-fun res!998823 () Bool)

(assert (=> b!1471481 (=> (not res!998823) (not e!826160))))

(declare-fun lt!643303 () SeekEntryResult!12000)

(assert (=> b!1471481 (= res!998823 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47863 a!2862) j!93) a!2862 mask!2687) lt!643303))))

(declare-fun b!1471482 () Bool)

(declare-fun res!998828 () Bool)

(assert (=> b!1471482 (=> (not res!998828) (not e!826159))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1471482 (= res!998828 (validKeyInArray!0 (select (arr!47863 a!2862) j!93)))))

(declare-fun b!1471483 () Bool)

(declare-fun e!826164 () Bool)

(assert (=> b!1471483 (= e!826159 e!826164)))

(declare-fun res!998824 () Bool)

(assert (=> b!1471483 (=> (not res!998824) (not e!826164))))

(assert (=> b!1471483 (= res!998824 (= (select (store (arr!47863 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1471483 (= lt!643301 (array!99161 (store (arr!47863 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48414 a!2862)))))

(declare-fun b!1471484 () Bool)

(assert (=> b!1471484 (= e!826164 e!826160)))

(declare-fun res!998827 () Bool)

(assert (=> b!1471484 (=> (not res!998827) (not e!826160))))

(assert (=> b!1471484 (= res!998827 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47863 a!2862) j!93) mask!2687) (select (arr!47863 a!2862) j!93) a!2862 mask!2687) lt!643303))))

(assert (=> b!1471484 (= lt!643303 (Intermediate!12000 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1471485 () Bool)

(declare-fun res!998826 () Bool)

(assert (=> b!1471485 (=> (not res!998826) (not e!826159))))

(assert (=> b!1471485 (= res!998826 (validKeyInArray!0 (select (arr!47863 a!2862) i!1006)))))

(declare-fun b!1471486 () Bool)

(declare-fun res!998821 () Bool)

(assert (=> b!1471486 (=> (not res!998821) (not e!826159))))

(assert (=> b!1471486 (= res!998821 (and (= (size!48414 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48414 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48414 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125874 res!998831) b!1471486))

(assert (= (and b!1471486 res!998821) b!1471485))

(assert (= (and b!1471485 res!998826) b!1471482))

(assert (= (and b!1471482 res!998828) b!1471476))

(assert (= (and b!1471476 res!998825) b!1471479))

(assert (= (and b!1471479 res!998830) b!1471477))

(assert (= (and b!1471477 res!998829) b!1471483))

(assert (= (and b!1471483 res!998824) b!1471484))

(assert (= (and b!1471484 res!998827) b!1471481))

(assert (= (and b!1471481 res!998823) b!1471475))

(assert (= (and b!1471475 res!998822) b!1471480))

(assert (= (and b!1471480 c!135847) b!1471474))

(assert (= (and b!1471480 (not c!135847)) b!1471478))

(declare-fun m!1358605 () Bool)

(assert (=> b!1471478 m!1358605))

(declare-fun m!1358607 () Bool)

(assert (=> b!1471478 m!1358607))

(declare-fun m!1358609 () Bool)

(assert (=> b!1471482 m!1358609))

(assert (=> b!1471482 m!1358609))

(declare-fun m!1358611 () Bool)

(assert (=> b!1471482 m!1358611))

(declare-fun m!1358613 () Bool)

(assert (=> start!125874 m!1358613))

(declare-fun m!1358615 () Bool)

(assert (=> start!125874 m!1358615))

(declare-fun m!1358617 () Bool)

(assert (=> b!1471479 m!1358617))

(declare-fun m!1358619 () Bool)

(assert (=> b!1471476 m!1358619))

(assert (=> b!1471484 m!1358609))

(assert (=> b!1471484 m!1358609))

(declare-fun m!1358621 () Bool)

(assert (=> b!1471484 m!1358621))

(assert (=> b!1471484 m!1358621))

(assert (=> b!1471484 m!1358609))

(declare-fun m!1358623 () Bool)

(assert (=> b!1471484 m!1358623))

(declare-fun m!1358625 () Bool)

(assert (=> b!1471483 m!1358625))

(declare-fun m!1358627 () Bool)

(assert (=> b!1471483 m!1358627))

(assert (=> b!1471481 m!1358609))

(assert (=> b!1471481 m!1358609))

(declare-fun m!1358629 () Bool)

(assert (=> b!1471481 m!1358629))

(declare-fun m!1358631 () Bool)

(assert (=> b!1471475 m!1358631))

(assert (=> b!1471475 m!1358631))

(declare-fun m!1358633 () Bool)

(assert (=> b!1471475 m!1358633))

(assert (=> b!1471475 m!1358625))

(declare-fun m!1358635 () Bool)

(assert (=> b!1471475 m!1358635))

(declare-fun m!1358637 () Bool)

(assert (=> b!1471485 m!1358637))

(assert (=> b!1471485 m!1358637))

(declare-fun m!1358639 () Bool)

(assert (=> b!1471485 m!1358639))

(declare-fun m!1358641 () Bool)

(assert (=> b!1471474 m!1358641))

(check-sat (not b!1471478) (not b!1471474) (not b!1471482) (not b!1471484) (not b!1471475) (not b!1471485) (not b!1471481) (not b!1471479) (not start!125874) (not b!1471476))
(check-sat)
