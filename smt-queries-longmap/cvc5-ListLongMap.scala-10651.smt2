; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125044 () Bool)

(assert start!125044)

(declare-fun b!1455096 () Bool)

(declare-fun e!818831 () Bool)

(assert (=> b!1455096 (= e!818831 true)))

(declare-fun lt!637829 () Bool)

(declare-fun e!818823 () Bool)

(assert (=> b!1455096 (= lt!637829 e!818823)))

(declare-fun c!134147 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1455096 (= c!134147 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1455097 () Bool)

(declare-fun e!818828 () Bool)

(declare-fun e!818826 () Bool)

(assert (=> b!1455097 (= e!818828 e!818826)))

(declare-fun res!985824 () Bool)

(assert (=> b!1455097 (=> (not res!985824) (not e!818826))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98492 0))(
  ( (array!98493 (arr!47534 (Array (_ BitVec 32) (_ BitVec 64))) (size!48084 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98492)

(assert (=> b!1455097 (= res!985824 (= (select (store (arr!47534 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!637831 () array!98492)

(assert (=> b!1455097 (= lt!637831 (array!98493 (store (arr!47534 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48084 a!2862)))))

(declare-fun b!1455098 () Bool)

(declare-fun res!985833 () Bool)

(declare-fun e!818829 () Bool)

(assert (=> b!1455098 (=> (not res!985833) (not e!818829))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11786 0))(
  ( (MissingZero!11786 (index!49536 (_ BitVec 32))) (Found!11786 (index!49537 (_ BitVec 32))) (Intermediate!11786 (undefined!12598 Bool) (index!49538 (_ BitVec 32)) (x!131171 (_ BitVec 32))) (Undefined!11786) (MissingVacant!11786 (index!49539 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98492 (_ BitVec 32)) SeekEntryResult!11786)

(assert (=> b!1455098 (= res!985833 (= (seekEntryOrOpen!0 (select (arr!47534 a!2862) j!93) a!2862 mask!2687) (Found!11786 j!93)))))

(declare-fun b!1455100 () Bool)

(declare-fun res!985825 () Bool)

(assert (=> b!1455100 (=> (not res!985825) (not e!818828))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1455100 (= res!985825 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48084 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48084 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48084 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1455101 () Bool)

(declare-fun e!818822 () Bool)

(assert (=> b!1455101 (= e!818826 e!818822)))

(declare-fun res!985839 () Bool)

(assert (=> b!1455101 (=> (not res!985839) (not e!818822))))

(declare-fun lt!637828 () SeekEntryResult!11786)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98492 (_ BitVec 32)) SeekEntryResult!11786)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455101 (= res!985839 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47534 a!2862) j!93) mask!2687) (select (arr!47534 a!2862) j!93) a!2862 mask!2687) lt!637828))))

(assert (=> b!1455101 (= lt!637828 (Intermediate!11786 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1455102 () Bool)

(declare-fun e!818825 () Bool)

(assert (=> b!1455102 (= e!818822 e!818825)))

(declare-fun res!985836 () Bool)

(assert (=> b!1455102 (=> (not res!985836) (not e!818825))))

(declare-fun lt!637830 () SeekEntryResult!11786)

(assert (=> b!1455102 (= res!985836 (= lt!637830 (Intermediate!11786 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!637826 () (_ BitVec 64))

(assert (=> b!1455102 (= lt!637830 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637826 mask!2687) lt!637826 lt!637831 mask!2687))))

(assert (=> b!1455102 (= lt!637826 (select (store (arr!47534 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1455103 () Bool)

(declare-fun res!985830 () Bool)

(assert (=> b!1455103 (=> (not res!985830) (not e!818828))))

(assert (=> b!1455103 (= res!985830 (and (= (size!48084 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48084 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48084 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1455104 () Bool)

(declare-fun res!985826 () Bool)

(assert (=> b!1455104 (=> res!985826 e!818831)))

(declare-fun lt!637832 () (_ BitVec 32))

(assert (=> b!1455104 (= res!985826 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637832 (select (arr!47534 a!2862) j!93) a!2862 mask!2687) lt!637828)))))

(declare-fun e!818830 () Bool)

(declare-fun b!1455105 () Bool)

(assert (=> b!1455105 (= e!818830 (= lt!637830 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637826 lt!637831 mask!2687)))))

(declare-fun b!1455106 () Bool)

(declare-fun res!985837 () Bool)

(assert (=> b!1455106 (=> (not res!985837) (not e!818828))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1455106 (= res!985837 (validKeyInArray!0 (select (arr!47534 a!2862) i!1006)))))

(declare-fun b!1455107 () Bool)

(declare-fun res!985838 () Bool)

(assert (=> b!1455107 (=> (not res!985838) (not e!818828))))

(declare-datatypes ((List!34035 0))(
  ( (Nil!34032) (Cons!34031 (h!35381 (_ BitVec 64)) (t!48729 List!34035)) )
))
(declare-fun arrayNoDuplicates!0 (array!98492 (_ BitVec 32) List!34035) Bool)

(assert (=> b!1455107 (= res!985838 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34032))))

(declare-fun b!1455108 () Bool)

(assert (=> b!1455108 (= e!818829 (and (or (= (select (arr!47534 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47534 a!2862) intermediateBeforeIndex!19) (select (arr!47534 a!2862) j!93))) (let ((bdg!53125 (select (store (arr!47534 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47534 a!2862) index!646) bdg!53125) (= (select (arr!47534 a!2862) index!646) (select (arr!47534 a!2862) j!93))) (= (select (arr!47534 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53125 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun res!985831 () Bool)

(assert (=> start!125044 (=> (not res!985831) (not e!818828))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125044 (= res!985831 (validMask!0 mask!2687))))

(assert (=> start!125044 e!818828))

(assert (=> start!125044 true))

(declare-fun array_inv!36562 (array!98492) Bool)

(assert (=> start!125044 (array_inv!36562 a!2862)))

(declare-fun b!1455099 () Bool)

(declare-fun res!985840 () Bool)

(assert (=> b!1455099 (=> (not res!985840) (not e!818825))))

(assert (=> b!1455099 (= res!985840 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1455109 () Bool)

(declare-fun res!985828 () Bool)

(assert (=> b!1455109 (=> (not res!985828) (not e!818828))))

(assert (=> b!1455109 (= res!985828 (validKeyInArray!0 (select (arr!47534 a!2862) j!93)))))

(declare-fun b!1455110 () Bool)

(declare-fun e!818827 () Bool)

(assert (=> b!1455110 (= e!818827 e!818831)))

(declare-fun res!985823 () Bool)

(assert (=> b!1455110 (=> res!985823 e!818831)))

(assert (=> b!1455110 (= res!985823 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637832 #b00000000000000000000000000000000) (bvsge lt!637832 (size!48084 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455110 (= lt!637832 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!637833 () SeekEntryResult!11786)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98492 (_ BitVec 32)) SeekEntryResult!11786)

(assert (=> b!1455110 (= lt!637833 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637826 lt!637831 mask!2687))))

(assert (=> b!1455110 (= lt!637833 (seekEntryOrOpen!0 lt!637826 lt!637831 mask!2687))))

(declare-fun b!1455111 () Bool)

(assert (=> b!1455111 (= e!818830 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637826 lt!637831 mask!2687) (seekEntryOrOpen!0 lt!637826 lt!637831 mask!2687)))))

(declare-fun b!1455112 () Bool)

(assert (=> b!1455112 (= e!818823 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637832 intermediateAfterIndex!19 lt!637826 lt!637831 mask!2687) lt!637833)))))

(declare-fun b!1455113 () Bool)

(declare-fun res!985832 () Bool)

(assert (=> b!1455113 (=> (not res!985832) (not e!818828))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98492 (_ BitVec 32)) Bool)

(assert (=> b!1455113 (= res!985832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1455114 () Bool)

(assert (=> b!1455114 (= e!818823 (not (= lt!637830 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637832 lt!637826 lt!637831 mask!2687))))))

(declare-fun b!1455115 () Bool)

(assert (=> b!1455115 (= e!818825 (not e!818827))))

(declare-fun res!985827 () Bool)

(assert (=> b!1455115 (=> res!985827 e!818827)))

(assert (=> b!1455115 (= res!985827 (or (and (= (select (arr!47534 a!2862) index!646) (select (store (arr!47534 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47534 a!2862) index!646) (select (arr!47534 a!2862) j!93))) (= (select (arr!47534 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1455115 e!818829))

(declare-fun res!985829 () Bool)

(assert (=> b!1455115 (=> (not res!985829) (not e!818829))))

(assert (=> b!1455115 (= res!985829 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49068 0))(
  ( (Unit!49069) )
))
(declare-fun lt!637827 () Unit!49068)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98492 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49068)

(assert (=> b!1455115 (= lt!637827 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1455116 () Bool)

(declare-fun res!985835 () Bool)

(assert (=> b!1455116 (=> (not res!985835) (not e!818822))))

(assert (=> b!1455116 (= res!985835 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47534 a!2862) j!93) a!2862 mask!2687) lt!637828))))

(declare-fun b!1455117 () Bool)

(declare-fun res!985834 () Bool)

(assert (=> b!1455117 (=> (not res!985834) (not e!818825))))

(assert (=> b!1455117 (= res!985834 e!818830)))

(declare-fun c!134148 () Bool)

(assert (=> b!1455117 (= c!134148 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!125044 res!985831) b!1455103))

(assert (= (and b!1455103 res!985830) b!1455106))

(assert (= (and b!1455106 res!985837) b!1455109))

(assert (= (and b!1455109 res!985828) b!1455113))

(assert (= (and b!1455113 res!985832) b!1455107))

(assert (= (and b!1455107 res!985838) b!1455100))

(assert (= (and b!1455100 res!985825) b!1455097))

(assert (= (and b!1455097 res!985824) b!1455101))

(assert (= (and b!1455101 res!985839) b!1455116))

(assert (= (and b!1455116 res!985835) b!1455102))

(assert (= (and b!1455102 res!985836) b!1455117))

(assert (= (and b!1455117 c!134148) b!1455105))

(assert (= (and b!1455117 (not c!134148)) b!1455111))

(assert (= (and b!1455117 res!985834) b!1455099))

(assert (= (and b!1455099 res!985840) b!1455115))

(assert (= (and b!1455115 res!985829) b!1455098))

(assert (= (and b!1455098 res!985833) b!1455108))

(assert (= (and b!1455115 (not res!985827)) b!1455110))

(assert (= (and b!1455110 (not res!985823)) b!1455104))

(assert (= (and b!1455104 (not res!985826)) b!1455096))

(assert (= (and b!1455096 c!134147) b!1455114))

(assert (= (and b!1455096 (not c!134147)) b!1455112))

(declare-fun m!1343359 () Bool)

(assert (=> b!1455113 m!1343359))

(declare-fun m!1343361 () Bool)

(assert (=> b!1455116 m!1343361))

(assert (=> b!1455116 m!1343361))

(declare-fun m!1343363 () Bool)

(assert (=> b!1455116 m!1343363))

(declare-fun m!1343365 () Bool)

(assert (=> b!1455112 m!1343365))

(declare-fun m!1343367 () Bool)

(assert (=> b!1455110 m!1343367))

(declare-fun m!1343369 () Bool)

(assert (=> b!1455110 m!1343369))

(declare-fun m!1343371 () Bool)

(assert (=> b!1455110 m!1343371))

(assert (=> b!1455098 m!1343361))

(assert (=> b!1455098 m!1343361))

(declare-fun m!1343373 () Bool)

(assert (=> b!1455098 m!1343373))

(assert (=> b!1455104 m!1343361))

(assert (=> b!1455104 m!1343361))

(declare-fun m!1343375 () Bool)

(assert (=> b!1455104 m!1343375))

(declare-fun m!1343377 () Bool)

(assert (=> start!125044 m!1343377))

(declare-fun m!1343379 () Bool)

(assert (=> start!125044 m!1343379))

(declare-fun m!1343381 () Bool)

(assert (=> b!1455107 m!1343381))

(assert (=> b!1455101 m!1343361))

(assert (=> b!1455101 m!1343361))

(declare-fun m!1343383 () Bool)

(assert (=> b!1455101 m!1343383))

(assert (=> b!1455101 m!1343383))

(assert (=> b!1455101 m!1343361))

(declare-fun m!1343385 () Bool)

(assert (=> b!1455101 m!1343385))

(declare-fun m!1343387 () Bool)

(assert (=> b!1455102 m!1343387))

(assert (=> b!1455102 m!1343387))

(declare-fun m!1343389 () Bool)

(assert (=> b!1455102 m!1343389))

(declare-fun m!1343391 () Bool)

(assert (=> b!1455102 m!1343391))

(declare-fun m!1343393 () Bool)

(assert (=> b!1455102 m!1343393))

(assert (=> b!1455097 m!1343391))

(declare-fun m!1343395 () Bool)

(assert (=> b!1455097 m!1343395))

(declare-fun m!1343397 () Bool)

(assert (=> b!1455114 m!1343397))

(assert (=> b!1455108 m!1343391))

(declare-fun m!1343399 () Bool)

(assert (=> b!1455108 m!1343399))

(declare-fun m!1343401 () Bool)

(assert (=> b!1455108 m!1343401))

(declare-fun m!1343403 () Bool)

(assert (=> b!1455108 m!1343403))

(assert (=> b!1455108 m!1343361))

(assert (=> b!1455109 m!1343361))

(assert (=> b!1455109 m!1343361))

(declare-fun m!1343405 () Bool)

(assert (=> b!1455109 m!1343405))

(declare-fun m!1343407 () Bool)

(assert (=> b!1455105 m!1343407))

(declare-fun m!1343409 () Bool)

(assert (=> b!1455106 m!1343409))

(assert (=> b!1455106 m!1343409))

(declare-fun m!1343411 () Bool)

(assert (=> b!1455106 m!1343411))

(assert (=> b!1455111 m!1343369))

(assert (=> b!1455111 m!1343371))

(declare-fun m!1343413 () Bool)

(assert (=> b!1455115 m!1343413))

(assert (=> b!1455115 m!1343391))

(assert (=> b!1455115 m!1343401))

(assert (=> b!1455115 m!1343403))

(declare-fun m!1343415 () Bool)

(assert (=> b!1455115 m!1343415))

(assert (=> b!1455115 m!1343361))

(push 1)

