; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127396 () Bool)

(assert start!127396)

(declare-fun b!1497736 () Bool)

(declare-fun res!1018869 () Bool)

(declare-fun e!838687 () Bool)

(assert (=> b!1497736 (=> (not res!1018869) (not e!838687))))

(declare-datatypes ((array!99858 0))(
  ( (array!99859 (arr!48193 (Array (_ BitVec 32) (_ BitVec 64))) (size!48743 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99858)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497736 (= res!1018869 (validKeyInArray!0 (select (arr!48193 a!2850) i!996)))))

(declare-fun b!1497737 () Bool)

(declare-fun res!1018870 () Bool)

(assert (=> b!1497737 (=> (not res!1018870) (not e!838687))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1497737 (= res!1018870 (validKeyInArray!0 (select (arr!48193 a!2850) j!87)))))

(declare-fun b!1497738 () Bool)

(assert (=> b!1497738 (= e!838687 (and (bvsle #b00000000000000000000000000000000 (size!48743 a!2850)) (bvsge (size!48743 a!2850) #b01111111111111111111111111111111)))))

(declare-fun res!1018868 () Bool)

(assert (=> start!127396 (=> (not res!1018868) (not e!838687))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127396 (= res!1018868 (validMask!0 mask!2661))))

(assert (=> start!127396 e!838687))

(assert (=> start!127396 true))

(declare-fun array_inv!37221 (array!99858) Bool)

(assert (=> start!127396 (array_inv!37221 a!2850)))

(declare-fun b!1497739 () Bool)

(declare-fun res!1018867 () Bool)

(assert (=> b!1497739 (=> (not res!1018867) (not e!838687))))

(assert (=> b!1497739 (= res!1018867 (and (= (size!48743 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48743 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48743 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1497740 () Bool)

(declare-fun res!1018866 () Bool)

(assert (=> b!1497740 (=> (not res!1018866) (not e!838687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99858 (_ BitVec 32)) Bool)

(assert (=> b!1497740 (= res!1018866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127396 res!1018868) b!1497739))

(assert (= (and b!1497739 res!1018867) b!1497736))

(assert (= (and b!1497736 res!1018869) b!1497737))

(assert (= (and b!1497737 res!1018870) b!1497740))

(assert (= (and b!1497740 res!1018866) b!1497738))

(declare-fun m!1380821 () Bool)

(assert (=> b!1497736 m!1380821))

(assert (=> b!1497736 m!1380821))

(declare-fun m!1380823 () Bool)

(assert (=> b!1497736 m!1380823))

(declare-fun m!1380825 () Bool)

(assert (=> b!1497737 m!1380825))

(assert (=> b!1497737 m!1380825))

(declare-fun m!1380827 () Bool)

(assert (=> b!1497737 m!1380827))

(declare-fun m!1380829 () Bool)

(assert (=> start!127396 m!1380829))

(declare-fun m!1380831 () Bool)

(assert (=> start!127396 m!1380831))

(declare-fun m!1380833 () Bool)

(assert (=> b!1497740 m!1380833))

(push 1)

(assert (not b!1497740))

(assert (not b!1497736))

(assert (not start!127396))

(assert (not b!1497737))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1497761 () Bool)

(declare-fun e!838705 () Bool)

(declare-fun e!838704 () Bool)

(assert (=> b!1497761 (= e!838705 e!838704)))

(declare-fun lt!652521 () (_ BitVec 64))

(assert (=> b!1497761 (= lt!652521 (select (arr!48193 a!2850) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50194 0))(
  ( (Unit!50195) )
))
(declare-fun lt!652522 () Unit!50194)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99858 (_ BitVec 64) (_ BitVec 32)) Unit!50194)

(assert (=> b!1497761 (= lt!652522 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!652521 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99858 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1497761 (arrayContainsKey!0 a!2850 lt!652521 #b00000000000000000000000000000000)))

(declare-fun lt!652520 () Unit!50194)

(assert (=> b!1497761 (= lt!652520 lt!652522)))

(declare-fun res!1018882 () Bool)

(declare-datatypes ((SeekEntryResult!12427 0))(
  ( (MissingZero!12427 (index!52100 (_ BitVec 32))) (Found!12427 (index!52101 (_ BitVec 32))) (Intermediate!12427 (undefined!13239 Bool) (index!52102 (_ BitVec 32)) (x!133733 (_ BitVec 32))) (Undefined!12427) (MissingVacant!12427 (index!52103 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99858 (_ BitVec 32)) SeekEntryResult!12427)

(assert (=> b!1497761 (= res!1018882 (= (seekEntryOrOpen!0 (select (arr!48193 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12427 #b00000000000000000000000000000000)))))

