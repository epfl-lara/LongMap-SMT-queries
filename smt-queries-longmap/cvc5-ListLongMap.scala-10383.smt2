; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122220 () Bool)

(assert start!122220)

(declare-fun b!1417775 () Bool)

(declare-fun res!953506 () Bool)

(declare-fun e!802354 () Bool)

(assert (=> b!1417775 (=> (not res!953506) (not e!802354))))

(declare-datatypes ((array!96804 0))(
  ( (array!96805 (arr!46730 (Array (_ BitVec 32) (_ BitVec 64))) (size!47280 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96804)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96804 (_ BitVec 32)) Bool)

(assert (=> b!1417775 (= res!953506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1417776 () Bool)

(declare-fun res!953507 () Bool)

(assert (=> b!1417776 (=> (not res!953507) (not e!802354))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417776 (= res!953507 (validKeyInArray!0 (select (arr!46730 a!2831) j!81)))))

(declare-fun b!1417777 () Bool)

(declare-fun res!953505 () Bool)

(assert (=> b!1417777 (=> (not res!953505) (not e!802354))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1417777 (= res!953505 (and (= (size!47280 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47280 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47280 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1417778 () Bool)

(assert (=> b!1417778 (= e!802354 (and (bvsle #b00000000000000000000000000000000 (size!47280 a!2831)) (bvsge (size!47280 a!2831) #b01111111111111111111111111111111)))))

(declare-fun res!953509 () Bool)

(assert (=> start!122220 (=> (not res!953509) (not e!802354))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122220 (= res!953509 (validMask!0 mask!2608))))

(assert (=> start!122220 e!802354))

(assert (=> start!122220 true))

(declare-fun array_inv!35758 (array!96804) Bool)

(assert (=> start!122220 (array_inv!35758 a!2831)))

(declare-fun b!1417779 () Bool)

(declare-fun res!953508 () Bool)

(assert (=> b!1417779 (=> (not res!953508) (not e!802354))))

(assert (=> b!1417779 (= res!953508 (validKeyInArray!0 (select (arr!46730 a!2831) i!982)))))

(assert (= (and start!122220 res!953509) b!1417777))

(assert (= (and b!1417777 res!953505) b!1417779))

(assert (= (and b!1417779 res!953508) b!1417776))

(assert (= (and b!1417776 res!953507) b!1417775))

(assert (= (and b!1417775 res!953506) b!1417778))

(declare-fun m!1308555 () Bool)

(assert (=> b!1417775 m!1308555))

(declare-fun m!1308557 () Bool)

(assert (=> b!1417776 m!1308557))

(assert (=> b!1417776 m!1308557))

(declare-fun m!1308559 () Bool)

(assert (=> b!1417776 m!1308559))

(declare-fun m!1308561 () Bool)

(assert (=> start!122220 m!1308561))

(declare-fun m!1308563 () Bool)

(assert (=> start!122220 m!1308563))

(declare-fun m!1308565 () Bool)

(assert (=> b!1417779 m!1308565))

(assert (=> b!1417779 m!1308565))

(declare-fun m!1308567 () Bool)

(assert (=> b!1417779 m!1308567))

(push 1)

(assert (not b!1417776))

(assert (not b!1417775))

(assert (not start!122220))

(assert (not b!1417779))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!152715 () Bool)

(assert (=> d!152715 (= (validKeyInArray!0 (select (arr!46730 a!2831) j!81)) (and (not (= (select (arr!46730 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46730 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1417776 d!152715))

(declare-fun b!1417827 () Bool)

(declare-fun e!802382 () Bool)

(declare-fun e!802380 () Bool)

(assert (=> b!1417827 (= e!802382 e!802380)))

(declare-fun c!131621 () Bool)

(assert (=> b!1417827 (= c!131621 (validKeyInArray!0 (select (arr!46730 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1417828 () Bool)

(declare-fun e!802381 () Bool)

(assert (=> b!1417828 (= e!802380 e!802381)))

(declare-fun lt!625454 () (_ BitVec 64))

(assert (=> b!1417828 (= lt!625454 (select (arr!46730 a!2831) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48046 0))(
  ( (Unit!48047) )
))
(declare-fun lt!625455 () Unit!48046)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96804 (_ BitVec 64) (_ BitVec 32)) Unit!48046)

(assert (=> b!1417828 (= lt!625455 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!625454 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96804 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1417828 (arrayContainsKey!0 a!2831 lt!625454 #b00000000000000000000000000000000)))

(declare-fun lt!625453 () Unit!48046)

(assert (=> b!1417828 (= lt!625453 lt!625455)))

(declare-fun res!953548 () Bool)

(declare-datatypes ((SeekEntryResult!11036 0))(
  ( (MissingZero!11036 (index!46536 (_ BitVec 32))) (Found!11036 (index!46537 (_ BitVec 32))) (Intermediate!11036 (undefined!11848 Bool) (index!46538 (_ BitVec 32)) (x!128151 (_ BitVec 32))) (Undefined!11036) (MissingVacant!11036 (index!46539 (_ BitVec 32))) )
))
