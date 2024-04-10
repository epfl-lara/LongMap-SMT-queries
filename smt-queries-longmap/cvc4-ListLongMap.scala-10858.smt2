; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127196 () Bool)

(assert start!127196)

(declare-fun b!1494945 () Bool)

(declare-fun res!1017026 () Bool)

(declare-fun e!837370 () Bool)

(assert (=> b!1494945 (=> (not res!1017026) (not e!837370))))

(declare-fun e!837369 () Bool)

(assert (=> b!1494945 (= res!1017026 e!837369)))

(declare-fun c!138495 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1494945 (= c!138495 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1494946 () Bool)

(declare-fun res!1017028 () Bool)

(declare-fun e!837367 () Bool)

(assert (=> b!1494946 (=> (not res!1017028) (not e!837367))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99780 0))(
  ( (array!99781 (arr!48157 (Array (_ BitVec 32) (_ BitVec 64))) (size!48707 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99780)

(assert (=> b!1494946 (= res!1017028 (and (= (size!48707 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48707 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48707 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1494947 () Bool)

(declare-fun e!837364 () Bool)

(declare-fun e!837363 () Bool)

(assert (=> b!1494947 (= e!837364 e!837363)))

(declare-fun res!1017021 () Bool)

(assert (=> b!1494947 (=> res!1017021 e!837363)))

(declare-fun lt!651568 () (_ BitVec 32))

(assert (=> b!1494947 (= res!1017021 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!651568 #b00000000000000000000000000000000) (bvsge lt!651568 (size!48707 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1494947 (= lt!651568 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1494948 () Bool)

(assert (=> b!1494948 (= e!837370 (not e!837364))))

(declare-fun res!1017023 () Bool)

(assert (=> b!1494948 (=> res!1017023 e!837364)))

(assert (=> b!1494948 (= res!1017023 (or (and (= (select (arr!48157 a!2862) index!646) (select (store (arr!48157 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48157 a!2862) index!646) (select (arr!48157 a!2862) j!93))) (= (select (arr!48157 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!837366 () Bool)

(assert (=> b!1494948 e!837366))

(declare-fun res!1017024 () Bool)

(assert (=> b!1494948 (=> (not res!1017024) (not e!837366))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99780 (_ BitVec 32)) Bool)

(assert (=> b!1494948 (= res!1017024 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50134 0))(
  ( (Unit!50135) )
))
(declare-fun lt!651569 () Unit!50134)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99780 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50134)

(assert (=> b!1494948 (= lt!651569 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1494949 () Bool)

(declare-fun e!837365 () Bool)

(assert (=> b!1494949 (= e!837365 e!837370)))

(declare-fun res!1017020 () Bool)

(assert (=> b!1494949 (=> (not res!1017020) (not e!837370))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12397 0))(
  ( (MissingZero!12397 (index!51980 (_ BitVec 32))) (Found!12397 (index!51981 (_ BitVec 32))) (Intermediate!12397 (undefined!13209 Bool) (index!51982 (_ BitVec 32)) (x!133585 (_ BitVec 32))) (Undefined!12397) (MissingVacant!12397 (index!51983 (_ BitVec 32))) )
))
(declare-fun lt!651570 () SeekEntryResult!12397)

(assert (=> b!1494949 (= res!1017020 (= lt!651570 (Intermediate!12397 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!651572 () (_ BitVec 64))

(declare-fun lt!651573 () array!99780)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99780 (_ BitVec 32)) SeekEntryResult!12397)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1494949 (= lt!651570 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651572 mask!2687) lt!651572 lt!651573 mask!2687))))

(assert (=> b!1494949 (= lt!651572 (select (store (arr!48157 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1494950 () Bool)

(declare-fun res!1017033 () Bool)

(assert (=> b!1494950 (=> (not res!1017033) (not e!837366))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99780 (_ BitVec 32)) SeekEntryResult!12397)

(assert (=> b!1494950 (= res!1017033 (= (seekEntryOrOpen!0 (select (arr!48157 a!2862) j!93) a!2862 mask!2687) (Found!12397 j!93)))))

(declare-fun b!1494951 () Bool)

(declare-fun res!1017032 () Bool)

(assert (=> b!1494951 (=> (not res!1017032) (not e!837367))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1494951 (= res!1017032 (validKeyInArray!0 (select (arr!48157 a!2862) j!93)))))

(declare-fun b!1494952 () Bool)

(declare-fun res!1017027 () Bool)

(assert (=> b!1494952 (=> (not res!1017027) (not e!837367))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1494952 (= res!1017027 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48707 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48707 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48707 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1494953 () Bool)

(declare-fun res!1017019 () Bool)

(assert (=> b!1494953 (=> (not res!1017019) (not e!837367))))

(assert (=> b!1494953 (= res!1017019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1494954 () Bool)

(declare-fun e!837368 () Bool)

(assert (=> b!1494954 (= e!837368 e!837365)))

(declare-fun res!1017018 () Bool)

(assert (=> b!1494954 (=> (not res!1017018) (not e!837365))))

(declare-fun lt!651567 () SeekEntryResult!12397)

(assert (=> b!1494954 (= res!1017018 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48157 a!2862) j!93) mask!2687) (select (arr!48157 a!2862) j!93) a!2862 mask!2687) lt!651567))))

(assert (=> b!1494954 (= lt!651567 (Intermediate!12397 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1494955 () Bool)

(declare-fun res!1017022 () Bool)

(assert (=> b!1494955 (=> (not res!1017022) (not e!837367))))

(assert (=> b!1494955 (= res!1017022 (validKeyInArray!0 (select (arr!48157 a!2862) i!1006)))))

(declare-fun b!1494956 () Bool)

(declare-fun res!1017031 () Bool)

(assert (=> b!1494956 (=> (not res!1017031) (not e!837365))))

(assert (=> b!1494956 (= res!1017031 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48157 a!2862) j!93) a!2862 mask!2687) lt!651567))))

(declare-fun b!1494957 () Bool)

(declare-fun res!1017029 () Bool)

(assert (=> b!1494957 (=> (not res!1017029) (not e!837370))))

(assert (=> b!1494957 (= res!1017029 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1494958 () Bool)

(assert (=> b!1494958 (= e!837367 e!837368)))

(declare-fun res!1017025 () Bool)

(assert (=> b!1494958 (=> (not res!1017025) (not e!837368))))

(assert (=> b!1494958 (= res!1017025 (= (select (store (arr!48157 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494958 (= lt!651573 (array!99781 (store (arr!48157 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48707 a!2862)))))

(declare-fun res!1017030 () Bool)

(assert (=> start!127196 (=> (not res!1017030) (not e!837367))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127196 (= res!1017030 (validMask!0 mask!2687))))

(assert (=> start!127196 e!837367))

(assert (=> start!127196 true))

(declare-fun array_inv!37185 (array!99780) Bool)

(assert (=> start!127196 (array_inv!37185 a!2862)))

(declare-fun b!1494959 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99780 (_ BitVec 32)) SeekEntryResult!12397)

(assert (=> b!1494959 (= e!837369 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651572 lt!651573 mask!2687) (seekEntryOrOpen!0 lt!651572 lt!651573 mask!2687)))))

(declare-fun b!1494960 () Bool)

(assert (=> b!1494960 (= e!837366 (or (= (select (arr!48157 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48157 a!2862) intermediateBeforeIndex!19) (select (arr!48157 a!2862) j!93))))))

(declare-fun b!1494961 () Bool)

(assert (=> b!1494961 (= e!837363 true)))

(declare-fun lt!651571 () SeekEntryResult!12397)

(assert (=> b!1494961 (= lt!651571 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651568 (select (arr!48157 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1494962 () Bool)

(declare-fun res!1017034 () Bool)

(assert (=> b!1494962 (=> (not res!1017034) (not e!837367))))

(declare-datatypes ((List!34658 0))(
  ( (Nil!34655) (Cons!34654 (h!36046 (_ BitVec 64)) (t!49352 List!34658)) )
))
(declare-fun arrayNoDuplicates!0 (array!99780 (_ BitVec 32) List!34658) Bool)

(assert (=> b!1494962 (= res!1017034 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34655))))

(declare-fun b!1494963 () Bool)

(assert (=> b!1494963 (= e!837369 (= lt!651570 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651572 lt!651573 mask!2687)))))

(assert (= (and start!127196 res!1017030) b!1494946))

(assert (= (and b!1494946 res!1017028) b!1494955))

(assert (= (and b!1494955 res!1017022) b!1494951))

(assert (= (and b!1494951 res!1017032) b!1494953))

(assert (= (and b!1494953 res!1017019) b!1494962))

(assert (= (and b!1494962 res!1017034) b!1494952))

(assert (= (and b!1494952 res!1017027) b!1494958))

(assert (= (and b!1494958 res!1017025) b!1494954))

(assert (= (and b!1494954 res!1017018) b!1494956))

(assert (= (and b!1494956 res!1017031) b!1494949))

(assert (= (and b!1494949 res!1017020) b!1494945))

(assert (= (and b!1494945 c!138495) b!1494963))

(assert (= (and b!1494945 (not c!138495)) b!1494959))

(assert (= (and b!1494945 res!1017026) b!1494957))

(assert (= (and b!1494957 res!1017029) b!1494948))

(assert (= (and b!1494948 res!1017024) b!1494950))

(assert (= (and b!1494950 res!1017033) b!1494960))

(assert (= (and b!1494948 (not res!1017023)) b!1494947))

(assert (= (and b!1494947 (not res!1017021)) b!1494961))

(declare-fun m!1378531 () Bool)

(assert (=> b!1494961 m!1378531))

(assert (=> b!1494961 m!1378531))

(declare-fun m!1378533 () Bool)

(assert (=> b!1494961 m!1378533))

(declare-fun m!1378535 () Bool)

(assert (=> b!1494948 m!1378535))

(declare-fun m!1378537 () Bool)

(assert (=> b!1494948 m!1378537))

(declare-fun m!1378539 () Bool)

(assert (=> b!1494948 m!1378539))

(declare-fun m!1378541 () Bool)

(assert (=> b!1494948 m!1378541))

(declare-fun m!1378543 () Bool)

(assert (=> b!1494948 m!1378543))

(assert (=> b!1494948 m!1378531))

(assert (=> b!1494958 m!1378537))

(declare-fun m!1378545 () Bool)

(assert (=> b!1494958 m!1378545))

(declare-fun m!1378547 () Bool)

(assert (=> b!1494959 m!1378547))

(declare-fun m!1378549 () Bool)

(assert (=> b!1494959 m!1378549))

(assert (=> b!1494954 m!1378531))

(assert (=> b!1494954 m!1378531))

(declare-fun m!1378551 () Bool)

(assert (=> b!1494954 m!1378551))

(assert (=> b!1494954 m!1378551))

(assert (=> b!1494954 m!1378531))

(declare-fun m!1378553 () Bool)

(assert (=> b!1494954 m!1378553))

(declare-fun m!1378555 () Bool)

(assert (=> b!1494953 m!1378555))

(assert (=> b!1494950 m!1378531))

(assert (=> b!1494950 m!1378531))

(declare-fun m!1378557 () Bool)

(assert (=> b!1494950 m!1378557))

(declare-fun m!1378559 () Bool)

(assert (=> b!1494963 m!1378559))

(declare-fun m!1378561 () Bool)

(assert (=> b!1494955 m!1378561))

(assert (=> b!1494955 m!1378561))

(declare-fun m!1378563 () Bool)

(assert (=> b!1494955 m!1378563))

(declare-fun m!1378565 () Bool)

(assert (=> start!127196 m!1378565))

(declare-fun m!1378567 () Bool)

(assert (=> start!127196 m!1378567))

(assert (=> b!1494956 m!1378531))

(assert (=> b!1494956 m!1378531))

(declare-fun m!1378569 () Bool)

(assert (=> b!1494956 m!1378569))

(assert (=> b!1494951 m!1378531))

(assert (=> b!1494951 m!1378531))

(declare-fun m!1378571 () Bool)

(assert (=> b!1494951 m!1378571))

(declare-fun m!1378573 () Bool)

(assert (=> b!1494947 m!1378573))

(declare-fun m!1378575 () Bool)

(assert (=> b!1494962 m!1378575))

(declare-fun m!1378577 () Bool)

(assert (=> b!1494949 m!1378577))

(assert (=> b!1494949 m!1378577))

(declare-fun m!1378579 () Bool)

(assert (=> b!1494949 m!1378579))

(assert (=> b!1494949 m!1378537))

(declare-fun m!1378581 () Bool)

(assert (=> b!1494949 m!1378581))

(declare-fun m!1378583 () Bool)

(assert (=> b!1494960 m!1378583))

(assert (=> b!1494960 m!1378531))

(push 1)

