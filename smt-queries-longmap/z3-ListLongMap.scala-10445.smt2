; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122828 () Bool)

(assert start!122828)

(declare-fun b!1424526 () Bool)

(declare-fun res!960011 () Bool)

(declare-fun e!805053 () Bool)

(assert (=> b!1424526 (=> (not res!960011) (not e!805053))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97146 0))(
  ( (array!97147 (arr!46891 (Array (_ BitVec 32) (_ BitVec 64))) (size!47443 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97146)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(assert (=> b!1424526 (= res!960011 (and (= (size!47443 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47443 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47443 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1424527 () Bool)

(declare-fun e!805052 () Bool)

(declare-datatypes ((SeekEntryResult!11203 0))(
  ( (MissingZero!11203 (index!47204 (_ BitVec 32))) (Found!11203 (index!47205 (_ BitVec 32))) (Intermediate!11203 (undefined!12015 Bool) (index!47206 (_ BitVec 32)) (x!128826 (_ BitVec 32))) (Undefined!11203) (MissingVacant!11203 (index!47207 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97146 (_ BitVec 32)) SeekEntryResult!11203)

(assert (=> b!1424527 (= e!805052 (= (seekEntryOrOpen!0 (select (arr!46891 a!2831) j!81) a!2831 mask!2608) (Found!11203 j!81)))))

(declare-fun b!1424528 () Bool)

(declare-fun res!960019 () Bool)

(declare-fun e!805050 () Bool)

(assert (=> b!1424528 (=> (not res!960019) (not e!805050))))

(declare-fun lt!627440 () SeekEntryResult!11203)

(declare-fun lt!627436 () array!97146)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!627438 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97146 (_ BitVec 32)) SeekEntryResult!11203)

(assert (=> b!1424528 (= res!960019 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627438 lt!627436 mask!2608) lt!627440))))

(declare-fun b!1424529 () Bool)

(declare-fun e!805051 () Bool)

(assert (=> b!1424529 (= e!805053 e!805051)))

(declare-fun res!960014 () Bool)

(assert (=> b!1424529 (=> (not res!960014) (not e!805051))))

(declare-fun lt!627435 () SeekEntryResult!11203)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424529 (= res!960014 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46891 a!2831) j!81) mask!2608) (select (arr!46891 a!2831) j!81) a!2831 mask!2608) lt!627435))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1424529 (= lt!627435 (Intermediate!11203 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1424530 () Bool)

(declare-fun res!960022 () Bool)

(assert (=> b!1424530 (=> (not res!960022) (not e!805050))))

(assert (=> b!1424530 (= res!960022 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46891 a!2831) j!81) a!2831 mask!2608) lt!627435))))

(declare-fun b!1424531 () Bool)

(declare-fun e!805054 () Bool)

(assert (=> b!1424531 (= e!805050 (not e!805054))))

(declare-fun res!960024 () Bool)

(assert (=> b!1424531 (=> res!960024 e!805054)))

(assert (=> b!1424531 (= res!960024 (or (= (select (arr!46891 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46891 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46891 a!2831) index!585) (select (arr!46891 a!2831) j!81)) (= (select (store (arr!46891 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1424531 e!805052))

(declare-fun res!960017 () Bool)

(assert (=> b!1424531 (=> (not res!960017) (not e!805052))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97146 (_ BitVec 32)) Bool)

(assert (=> b!1424531 (= res!960017 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48081 0))(
  ( (Unit!48082) )
))
(declare-fun lt!627437 () Unit!48081)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97146 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48081)

(assert (=> b!1424531 (= lt!627437 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1424532 () Bool)

(declare-fun res!960010 () Bool)

(assert (=> b!1424532 (=> (not res!960010) (not e!805053))))

(assert (=> b!1424532 (= res!960010 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47443 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47443 a!2831))))))

(declare-fun b!1424533 () Bool)

(declare-fun e!805055 () Bool)

(assert (=> b!1424533 (= e!805054 e!805055)))

(declare-fun res!960020 () Bool)

(assert (=> b!1424533 (=> res!960020 e!805055)))

(declare-fun lt!627439 () (_ BitVec 32))

(assert (=> b!1424533 (= res!960020 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627439 #b00000000000000000000000000000000) (bvsge lt!627439 (size!47443 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424533 (= lt!627439 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun res!960013 () Bool)

(assert (=> start!122828 (=> (not res!960013) (not e!805053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122828 (= res!960013 (validMask!0 mask!2608))))

(assert (=> start!122828 e!805053))

(assert (=> start!122828 true))

(declare-fun array_inv!36124 (array!97146) Bool)

(assert (=> start!122828 (array_inv!36124 a!2831)))

(declare-fun b!1424534 () Bool)

(declare-fun res!960016 () Bool)

(assert (=> b!1424534 (=> (not res!960016) (not e!805053))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424534 (= res!960016 (validKeyInArray!0 (select (arr!46891 a!2831) j!81)))))

(declare-fun b!1424535 () Bool)

(declare-fun res!960012 () Bool)

(assert (=> b!1424535 (=> res!960012 e!805055)))

(assert (=> b!1424535 (= res!960012 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627439 (select (arr!46891 a!2831) j!81) a!2831 mask!2608) lt!627435)))))

(declare-fun b!1424536 () Bool)

(declare-fun res!960015 () Bool)

(assert (=> b!1424536 (=> (not res!960015) (not e!805053))))

(assert (=> b!1424536 (= res!960015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1424537 () Bool)

(assert (=> b!1424537 (= e!805055 true)))

(declare-fun lt!627434 () SeekEntryResult!11203)

(assert (=> b!1424537 (= lt!627434 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627439 lt!627438 lt!627436 mask!2608))))

(declare-fun b!1424538 () Bool)

(declare-fun res!960021 () Bool)

(assert (=> b!1424538 (=> (not res!960021) (not e!805050))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1424538 (= res!960021 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1424539 () Bool)

(declare-fun res!960025 () Bool)

(assert (=> b!1424539 (=> (not res!960025) (not e!805053))))

(assert (=> b!1424539 (= res!960025 (validKeyInArray!0 (select (arr!46891 a!2831) i!982)))))

(declare-fun b!1424540 () Bool)

(assert (=> b!1424540 (= e!805051 e!805050)))

(declare-fun res!960023 () Bool)

(assert (=> b!1424540 (=> (not res!960023) (not e!805050))))

(assert (=> b!1424540 (= res!960023 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627438 mask!2608) lt!627438 lt!627436 mask!2608) lt!627440))))

(assert (=> b!1424540 (= lt!627440 (Intermediate!11203 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1424540 (= lt!627438 (select (store (arr!46891 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1424540 (= lt!627436 (array!97147 (store (arr!46891 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47443 a!2831)))))

(declare-fun b!1424541 () Bool)

(declare-fun res!960018 () Bool)

(assert (=> b!1424541 (=> (not res!960018) (not e!805053))))

(declare-datatypes ((List!33479 0))(
  ( (Nil!33476) (Cons!33475 (h!34777 (_ BitVec 64)) (t!48165 List!33479)) )
))
(declare-fun arrayNoDuplicates!0 (array!97146 (_ BitVec 32) List!33479) Bool)

(assert (=> b!1424541 (= res!960018 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33476))))

(assert (= (and start!122828 res!960013) b!1424526))

(assert (= (and b!1424526 res!960011) b!1424539))

(assert (= (and b!1424539 res!960025) b!1424534))

(assert (= (and b!1424534 res!960016) b!1424536))

(assert (= (and b!1424536 res!960015) b!1424541))

(assert (= (and b!1424541 res!960018) b!1424532))

(assert (= (and b!1424532 res!960010) b!1424529))

(assert (= (and b!1424529 res!960014) b!1424540))

(assert (= (and b!1424540 res!960023) b!1424530))

(assert (= (and b!1424530 res!960022) b!1424528))

(assert (= (and b!1424528 res!960019) b!1424538))

(assert (= (and b!1424538 res!960021) b!1424531))

(assert (= (and b!1424531 res!960017) b!1424527))

(assert (= (and b!1424531 (not res!960024)) b!1424533))

(assert (= (and b!1424533 (not res!960020)) b!1424535))

(assert (= (and b!1424535 (not res!960012)) b!1424537))

(declare-fun m!1314603 () Bool)

(assert (=> b!1424541 m!1314603))

(declare-fun m!1314605 () Bool)

(assert (=> b!1424529 m!1314605))

(assert (=> b!1424529 m!1314605))

(declare-fun m!1314607 () Bool)

(assert (=> b!1424529 m!1314607))

(assert (=> b!1424529 m!1314607))

(assert (=> b!1424529 m!1314605))

(declare-fun m!1314609 () Bool)

(assert (=> b!1424529 m!1314609))

(declare-fun m!1314611 () Bool)

(assert (=> b!1424528 m!1314611))

(declare-fun m!1314613 () Bool)

(assert (=> start!122828 m!1314613))

(declare-fun m!1314615 () Bool)

(assert (=> start!122828 m!1314615))

(declare-fun m!1314617 () Bool)

(assert (=> b!1424536 m!1314617))

(assert (=> b!1424530 m!1314605))

(assert (=> b!1424530 m!1314605))

(declare-fun m!1314619 () Bool)

(assert (=> b!1424530 m!1314619))

(declare-fun m!1314621 () Bool)

(assert (=> b!1424539 m!1314621))

(assert (=> b!1424539 m!1314621))

(declare-fun m!1314623 () Bool)

(assert (=> b!1424539 m!1314623))

(declare-fun m!1314625 () Bool)

(assert (=> b!1424531 m!1314625))

(declare-fun m!1314627 () Bool)

(assert (=> b!1424531 m!1314627))

(declare-fun m!1314629 () Bool)

(assert (=> b!1424531 m!1314629))

(declare-fun m!1314631 () Bool)

(assert (=> b!1424531 m!1314631))

(assert (=> b!1424531 m!1314605))

(declare-fun m!1314633 () Bool)

(assert (=> b!1424531 m!1314633))

(declare-fun m!1314635 () Bool)

(assert (=> b!1424540 m!1314635))

(assert (=> b!1424540 m!1314635))

(declare-fun m!1314637 () Bool)

(assert (=> b!1424540 m!1314637))

(assert (=> b!1424540 m!1314625))

(declare-fun m!1314639 () Bool)

(assert (=> b!1424540 m!1314639))

(assert (=> b!1424535 m!1314605))

(assert (=> b!1424535 m!1314605))

(declare-fun m!1314641 () Bool)

(assert (=> b!1424535 m!1314641))

(declare-fun m!1314643 () Bool)

(assert (=> b!1424537 m!1314643))

(declare-fun m!1314645 () Bool)

(assert (=> b!1424533 m!1314645))

(assert (=> b!1424534 m!1314605))

(assert (=> b!1424534 m!1314605))

(declare-fun m!1314647 () Bool)

(assert (=> b!1424534 m!1314647))

(assert (=> b!1424527 m!1314605))

(assert (=> b!1424527 m!1314605))

(declare-fun m!1314649 () Bool)

(assert (=> b!1424527 m!1314649))

(check-sat (not b!1424540) (not b!1424531) (not start!122828) (not b!1424530) (not b!1424533) (not b!1424529) (not b!1424537) (not b!1424527) (not b!1424541) (not b!1424534) (not b!1424536) (not b!1424528) (not b!1424535) (not b!1424539))
(check-sat)
