; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125860 () Bool)

(assert start!125860)

(declare-fun b!1473532 () Bool)

(declare-fun res!1000934 () Bool)

(declare-fun e!826847 () Bool)

(assert (=> b!1473532 (=> (not res!1000934) (not e!826847))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99115 0))(
  ( (array!99116 (arr!47842 (Array (_ BitVec 32) (_ BitVec 64))) (size!48394 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99115)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1473532 (= res!1000934 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48394 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48394 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48394 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!1000933 () Bool)

(assert (=> start!125860 (=> (not res!1000933) (not e!826847))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125860 (= res!1000933 (validMask!0 mask!2687))))

(assert (=> start!125860 e!826847))

(assert (=> start!125860 true))

(declare-fun array_inv!37075 (array!99115) Bool)

(assert (=> start!125860 (array_inv!37075 a!2862)))

(declare-fun e!826852 () Bool)

(declare-fun b!1473533 () Bool)

(declare-fun lt!643792 () (_ BitVec 64))

(declare-fun lt!643793 () array!99115)

(declare-datatypes ((SeekEntryResult!12107 0))(
  ( (MissingZero!12107 (index!50820 (_ BitVec 32))) (Found!12107 (index!50821 (_ BitVec 32))) (Intermediate!12107 (undefined!12919 Bool) (index!50822 (_ BitVec 32)) (x!132402 (_ BitVec 32))) (Undefined!12107) (MissingVacant!12107 (index!50823 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99115 (_ BitVec 32)) SeekEntryResult!12107)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99115 (_ BitVec 32)) SeekEntryResult!12107)

(assert (=> b!1473533 (= e!826852 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643792 lt!643793 mask!2687) (seekEntryOrOpen!0 lt!643792 lt!643793 mask!2687)))))

(declare-fun b!1473534 () Bool)

(declare-fun e!826848 () Bool)

(declare-fun e!826849 () Bool)

(assert (=> b!1473534 (= e!826848 (not e!826849))))

(declare-fun res!1000947 () Bool)

(assert (=> b!1473534 (=> res!1000947 e!826849)))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1473534 (= res!1000947 (or (not (= (select (arr!47842 a!2862) index!646) (select (store (arr!47842 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47842 a!2862) index!646) (select (arr!47842 a!2862) j!93)))))))

(declare-fun e!826853 () Bool)

(assert (=> b!1473534 e!826853))

(declare-fun res!1000939 () Bool)

(assert (=> b!1473534 (=> (not res!1000939) (not e!826853))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99115 (_ BitVec 32)) Bool)

(assert (=> b!1473534 (= res!1000939 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49395 0))(
  ( (Unit!49396) )
))
(declare-fun lt!643794 () Unit!49395)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99115 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49395)

(assert (=> b!1473534 (= lt!643794 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1473535 () Bool)

(declare-fun res!1000936 () Bool)

(assert (=> b!1473535 (=> (not res!1000936) (not e!826847))))

(assert (=> b!1473535 (= res!1000936 (and (= (size!48394 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48394 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48394 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1473536 () Bool)

(declare-fun e!826854 () Bool)

(assert (=> b!1473536 (= e!826847 e!826854)))

(declare-fun res!1000944 () Bool)

(assert (=> b!1473536 (=> (not res!1000944) (not e!826854))))

(assert (=> b!1473536 (= res!1000944 (= (select (store (arr!47842 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1473536 (= lt!643793 (array!99116 (store (arr!47842 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48394 a!2862)))))

(declare-fun b!1473537 () Bool)

(declare-fun e!826850 () Bool)

(assert (=> b!1473537 (= e!826854 e!826850)))

(declare-fun res!1000935 () Bool)

(assert (=> b!1473537 (=> (not res!1000935) (not e!826850))))

(declare-fun lt!643791 () SeekEntryResult!12107)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99115 (_ BitVec 32)) SeekEntryResult!12107)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1473537 (= res!1000935 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47842 a!2862) j!93) mask!2687) (select (arr!47842 a!2862) j!93) a!2862 mask!2687) lt!643791))))

(assert (=> b!1473537 (= lt!643791 (Intermediate!12107 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1473538 () Bool)

(declare-fun res!1000941 () Bool)

(assert (=> b!1473538 (=> (not res!1000941) (not e!826848))))

(assert (=> b!1473538 (= res!1000941 e!826852)))

(declare-fun c!135817 () Bool)

(assert (=> b!1473538 (= c!135817 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1473539 () Bool)

(assert (=> b!1473539 (= e!826849 true)))

(declare-fun lt!643789 () SeekEntryResult!12107)

(assert (=> b!1473539 (= lt!643789 (seekEntryOrOpen!0 lt!643792 lt!643793 mask!2687))))

(declare-fun b!1473540 () Bool)

(declare-fun res!1000938 () Bool)

(assert (=> b!1473540 (=> (not res!1000938) (not e!826848))))

(assert (=> b!1473540 (= res!1000938 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun lt!643790 () SeekEntryResult!12107)

(declare-fun b!1473541 () Bool)

(assert (=> b!1473541 (= e!826852 (= lt!643790 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643792 lt!643793 mask!2687)))))

(declare-fun b!1473542 () Bool)

(declare-fun res!1000942 () Bool)

(assert (=> b!1473542 (=> (not res!1000942) (not e!826847))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1473542 (= res!1000942 (validKeyInArray!0 (select (arr!47842 a!2862) j!93)))))

(declare-fun b!1473543 () Bool)

(declare-fun res!1000940 () Bool)

(assert (=> b!1473543 (=> (not res!1000940) (not e!826847))))

(declare-datatypes ((List!34421 0))(
  ( (Nil!34418) (Cons!34417 (h!35776 (_ BitVec 64)) (t!49107 List!34421)) )
))
(declare-fun arrayNoDuplicates!0 (array!99115 (_ BitVec 32) List!34421) Bool)

(assert (=> b!1473543 (= res!1000940 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34418))))

(declare-fun b!1473544 () Bool)

(declare-fun res!1000948 () Bool)

(assert (=> b!1473544 (=> (not res!1000948) (not e!826853))))

(assert (=> b!1473544 (= res!1000948 (= (seekEntryOrOpen!0 (select (arr!47842 a!2862) j!93) a!2862 mask!2687) (Found!12107 j!93)))))

(declare-fun b!1473545 () Bool)

(declare-fun res!1000945 () Bool)

(assert (=> b!1473545 (=> (not res!1000945) (not e!826847))))

(assert (=> b!1473545 (= res!1000945 (validKeyInArray!0 (select (arr!47842 a!2862) i!1006)))))

(declare-fun b!1473546 () Bool)

(assert (=> b!1473546 (= e!826850 e!826848)))

(declare-fun res!1000943 () Bool)

(assert (=> b!1473546 (=> (not res!1000943) (not e!826848))))

(assert (=> b!1473546 (= res!1000943 (= lt!643790 (Intermediate!12107 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1473546 (= lt!643790 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643792 mask!2687) lt!643792 lt!643793 mask!2687))))

(assert (=> b!1473546 (= lt!643792 (select (store (arr!47842 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1473547 () Bool)

(declare-fun res!1000946 () Bool)

(assert (=> b!1473547 (=> (not res!1000946) (not e!826847))))

(assert (=> b!1473547 (= res!1000946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1473548 () Bool)

(declare-fun res!1000937 () Bool)

(assert (=> b!1473548 (=> (not res!1000937) (not e!826850))))

(assert (=> b!1473548 (= res!1000937 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47842 a!2862) j!93) a!2862 mask!2687) lt!643791))))

(declare-fun b!1473549 () Bool)

(assert (=> b!1473549 (= e!826853 (or (= (select (arr!47842 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47842 a!2862) intermediateBeforeIndex!19) (select (arr!47842 a!2862) j!93))))))

(assert (= (and start!125860 res!1000933) b!1473535))

(assert (= (and b!1473535 res!1000936) b!1473545))

(assert (= (and b!1473545 res!1000945) b!1473542))

(assert (= (and b!1473542 res!1000942) b!1473547))

(assert (= (and b!1473547 res!1000946) b!1473543))

(assert (= (and b!1473543 res!1000940) b!1473532))

(assert (= (and b!1473532 res!1000934) b!1473536))

(assert (= (and b!1473536 res!1000944) b!1473537))

(assert (= (and b!1473537 res!1000935) b!1473548))

(assert (= (and b!1473548 res!1000937) b!1473546))

(assert (= (and b!1473546 res!1000943) b!1473538))

(assert (= (and b!1473538 c!135817) b!1473541))

(assert (= (and b!1473538 (not c!135817)) b!1473533))

(assert (= (and b!1473538 res!1000941) b!1473540))

(assert (= (and b!1473540 res!1000938) b!1473534))

(assert (= (and b!1473534 res!1000939) b!1473544))

(assert (= (and b!1473544 res!1000948) b!1473549))

(assert (= (and b!1473534 (not res!1000947)) b!1473539))

(declare-fun m!1359555 () Bool)

(assert (=> b!1473537 m!1359555))

(assert (=> b!1473537 m!1359555))

(declare-fun m!1359557 () Bool)

(assert (=> b!1473537 m!1359557))

(assert (=> b!1473537 m!1359557))

(assert (=> b!1473537 m!1359555))

(declare-fun m!1359559 () Bool)

(assert (=> b!1473537 m!1359559))

(assert (=> b!1473544 m!1359555))

(assert (=> b!1473544 m!1359555))

(declare-fun m!1359561 () Bool)

(assert (=> b!1473544 m!1359561))

(declare-fun m!1359563 () Bool)

(assert (=> b!1473547 m!1359563))

(declare-fun m!1359565 () Bool)

(assert (=> b!1473541 m!1359565))

(declare-fun m!1359567 () Bool)

(assert (=> b!1473549 m!1359567))

(assert (=> b!1473549 m!1359555))

(assert (=> b!1473548 m!1359555))

(assert (=> b!1473548 m!1359555))

(declare-fun m!1359569 () Bool)

(assert (=> b!1473548 m!1359569))

(declare-fun m!1359571 () Bool)

(assert (=> b!1473546 m!1359571))

(assert (=> b!1473546 m!1359571))

(declare-fun m!1359573 () Bool)

(assert (=> b!1473546 m!1359573))

(declare-fun m!1359575 () Bool)

(assert (=> b!1473546 m!1359575))

(declare-fun m!1359577 () Bool)

(assert (=> b!1473546 m!1359577))

(assert (=> b!1473536 m!1359575))

(declare-fun m!1359579 () Bool)

(assert (=> b!1473536 m!1359579))

(assert (=> b!1473542 m!1359555))

(assert (=> b!1473542 m!1359555))

(declare-fun m!1359581 () Bool)

(assert (=> b!1473542 m!1359581))

(declare-fun m!1359583 () Bool)

(assert (=> b!1473534 m!1359583))

(assert (=> b!1473534 m!1359575))

(declare-fun m!1359585 () Bool)

(assert (=> b!1473534 m!1359585))

(declare-fun m!1359587 () Bool)

(assert (=> b!1473534 m!1359587))

(declare-fun m!1359589 () Bool)

(assert (=> b!1473534 m!1359589))

(assert (=> b!1473534 m!1359555))

(declare-fun m!1359591 () Bool)

(assert (=> b!1473533 m!1359591))

(declare-fun m!1359593 () Bool)

(assert (=> b!1473533 m!1359593))

(declare-fun m!1359595 () Bool)

(assert (=> start!125860 m!1359595))

(declare-fun m!1359597 () Bool)

(assert (=> start!125860 m!1359597))

(declare-fun m!1359599 () Bool)

(assert (=> b!1473543 m!1359599))

(declare-fun m!1359601 () Bool)

(assert (=> b!1473545 m!1359601))

(assert (=> b!1473545 m!1359601))

(declare-fun m!1359603 () Bool)

(assert (=> b!1473545 m!1359603))

(assert (=> b!1473539 m!1359593))

(check-sat (not b!1473545) (not b!1473542) (not b!1473539) (not b!1473543) (not b!1473534) (not b!1473547) (not start!125860) (not b!1473533) (not b!1473546) (not b!1473544) (not b!1473541) (not b!1473537) (not b!1473548))
(check-sat)
