; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119962 () Bool)

(assert start!119962)

(declare-fun res!935361 () Bool)

(declare-fun e!790581 () Bool)

(assert (=> start!119962 (=> (not res!935361) (not e!790581))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119962 (= res!935361 (validMask!0 mask!2840))))

(assert (=> start!119962 e!790581))

(assert (=> start!119962 true))

(declare-datatypes ((array!95491 0))(
  ( (array!95492 (arr!46099 (Array (_ BitVec 32) (_ BitVec 64))) (size!46649 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95491)

(declare-fun array_inv!35127 (array!95491) Bool)

(assert (=> start!119962 (array_inv!35127 a!2901)))

(declare-fun b!1396447 () Bool)

(declare-fun res!935368 () Bool)

(assert (=> b!1396447 (=> (not res!935368) (not e!790581))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1396447 (= res!935368 (and (= (size!46649 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46649 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46649 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1396448 () Bool)

(declare-fun res!935360 () Bool)

(assert (=> b!1396448 (=> (not res!935360) (not e!790581))))

(declare-datatypes ((List!32618 0))(
  ( (Nil!32615) (Cons!32614 (h!33856 (_ BitVec 64)) (t!47312 List!32618)) )
))
(declare-fun arrayNoDuplicates!0 (array!95491 (_ BitVec 32) List!32618) Bool)

(assert (=> b!1396448 (= res!935360 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32615))))

(declare-fun b!1396449 () Bool)

(declare-fun res!935365 () Bool)

(assert (=> b!1396449 (=> (not res!935365) (not e!790581))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95491 (_ BitVec 32)) Bool)

(assert (=> b!1396449 (= res!935365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1396450 () Bool)

(declare-fun e!790579 () Bool)

(declare-fun e!790582 () Bool)

(assert (=> b!1396450 (= e!790579 e!790582)))

(declare-fun res!935366 () Bool)

(assert (=> b!1396450 (=> res!935366 e!790582)))

(declare-datatypes ((SeekEntryResult!10416 0))(
  ( (MissingZero!10416 (index!44035 (_ BitVec 32))) (Found!10416 (index!44036 (_ BitVec 32))) (Intermediate!10416 (undefined!11228 Bool) (index!44037 (_ BitVec 32)) (x!125702 (_ BitVec 32))) (Undefined!10416) (MissingVacant!10416 (index!44038 (_ BitVec 32))) )
))
(declare-fun lt!613435 () SeekEntryResult!10416)

(declare-fun lt!613431 () SeekEntryResult!10416)

(declare-fun lt!613434 () (_ BitVec 32))

(assert (=> b!1396450 (= res!935366 (or (= lt!613435 lt!613431) (not (is-Intermediate!10416 lt!613431)) (bvslt (x!125702 lt!613435) #b00000000000000000000000000000000) (bvsgt (x!125702 lt!613435) #b01111111111111111111111111111110) (bvslt lt!613434 #b00000000000000000000000000000000) (bvsge lt!613434 (size!46649 a!2901)) (bvslt (index!44037 lt!613435) #b00000000000000000000000000000000) (bvsge (index!44037 lt!613435) (size!46649 a!2901)) (not (= lt!613435 (Intermediate!10416 false (index!44037 lt!613435) (x!125702 lt!613435)))) (not (= lt!613431 (Intermediate!10416 (undefined!11228 lt!613431) (index!44037 lt!613431) (x!125702 lt!613431))))))))

(declare-fun lt!613432 () array!95491)

(declare-fun lt!613437 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95491 (_ BitVec 32)) SeekEntryResult!10416)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396450 (= lt!613431 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613437 mask!2840) lt!613437 lt!613432 mask!2840))))

(assert (=> b!1396450 (= lt!613437 (select (store (arr!46099 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1396450 (= lt!613432 (array!95492 (store (arr!46099 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46649 a!2901)))))

(declare-fun b!1396451 () Bool)

(assert (=> b!1396451 (= e!790582 true)))

(declare-fun lt!613436 () SeekEntryResult!10416)

(assert (=> b!1396451 (= lt!613436 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613434 lt!613437 lt!613432 mask!2840))))

(declare-fun b!1396452 () Bool)

(assert (=> b!1396452 (= e!790581 (not e!790579))))

(declare-fun res!935363 () Bool)

(assert (=> b!1396452 (=> res!935363 e!790579)))

(assert (=> b!1396452 (= res!935363 (or (not (is-Intermediate!10416 lt!613435)) (undefined!11228 lt!613435)))))

(declare-fun e!790583 () Bool)

(assert (=> b!1396452 e!790583))

(declare-fun res!935367 () Bool)

(assert (=> b!1396452 (=> (not res!935367) (not e!790583))))

(assert (=> b!1396452 (= res!935367 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46836 0))(
  ( (Unit!46837) )
))
(declare-fun lt!613433 () Unit!46836)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95491 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46836)

(assert (=> b!1396452 (= lt!613433 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1396452 (= lt!613435 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613434 (select (arr!46099 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1396452 (= lt!613434 (toIndex!0 (select (arr!46099 a!2901) j!112) mask!2840))))

(declare-fun b!1396453 () Bool)

(declare-fun res!935364 () Bool)

(assert (=> b!1396453 (=> (not res!935364) (not e!790581))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396453 (= res!935364 (validKeyInArray!0 (select (arr!46099 a!2901) j!112)))))

(declare-fun b!1396454 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95491 (_ BitVec 32)) SeekEntryResult!10416)

(assert (=> b!1396454 (= e!790583 (= (seekEntryOrOpen!0 (select (arr!46099 a!2901) j!112) a!2901 mask!2840) (Found!10416 j!112)))))

(declare-fun b!1396455 () Bool)

(declare-fun res!935362 () Bool)

(assert (=> b!1396455 (=> (not res!935362) (not e!790581))))

(assert (=> b!1396455 (= res!935362 (validKeyInArray!0 (select (arr!46099 a!2901) i!1037)))))

(assert (= (and start!119962 res!935361) b!1396447))

(assert (= (and b!1396447 res!935368) b!1396455))

(assert (= (and b!1396455 res!935362) b!1396453))

(assert (= (and b!1396453 res!935364) b!1396449))

(assert (= (and b!1396449 res!935365) b!1396448))

(assert (= (and b!1396448 res!935360) b!1396452))

(assert (= (and b!1396452 res!935367) b!1396454))

(assert (= (and b!1396452 (not res!935363)) b!1396450))

(assert (= (and b!1396450 (not res!935366)) b!1396451))

(declare-fun m!1282887 () Bool)

(assert (=> b!1396448 m!1282887))

(declare-fun m!1282889 () Bool)

(assert (=> b!1396451 m!1282889))

(declare-fun m!1282891 () Bool)

(assert (=> b!1396450 m!1282891))

(assert (=> b!1396450 m!1282891))

(declare-fun m!1282893 () Bool)

(assert (=> b!1396450 m!1282893))

(declare-fun m!1282895 () Bool)

(assert (=> b!1396450 m!1282895))

(declare-fun m!1282897 () Bool)

(assert (=> b!1396450 m!1282897))

(declare-fun m!1282899 () Bool)

(assert (=> b!1396453 m!1282899))

(assert (=> b!1396453 m!1282899))

(declare-fun m!1282901 () Bool)

(assert (=> b!1396453 m!1282901))

(declare-fun m!1282903 () Bool)

(assert (=> b!1396449 m!1282903))

(assert (=> b!1396452 m!1282899))

(declare-fun m!1282905 () Bool)

(assert (=> b!1396452 m!1282905))

(assert (=> b!1396452 m!1282899))

(declare-fun m!1282907 () Bool)

(assert (=> b!1396452 m!1282907))

(declare-fun m!1282909 () Bool)

(assert (=> b!1396452 m!1282909))

(assert (=> b!1396452 m!1282899))

(declare-fun m!1282911 () Bool)

(assert (=> b!1396452 m!1282911))

(declare-fun m!1282913 () Bool)

(assert (=> start!119962 m!1282913))

(declare-fun m!1282915 () Bool)

(assert (=> start!119962 m!1282915))

(assert (=> b!1396454 m!1282899))

(assert (=> b!1396454 m!1282899))

(declare-fun m!1282917 () Bool)

(assert (=> b!1396454 m!1282917))

(declare-fun m!1282919 () Bool)

(assert (=> b!1396455 m!1282919))

(assert (=> b!1396455 m!1282919))

(declare-fun m!1282921 () Bool)

(assert (=> b!1396455 m!1282921))

(push 1)

(assert (not b!1396455))

(assert (not b!1396451))

(assert (not b!1396449))

(assert (not b!1396450))

(assert (not start!119962))

(assert (not b!1396448))

(assert (not b!1396453))

(assert (not b!1396454))

(assert (not b!1396452))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

