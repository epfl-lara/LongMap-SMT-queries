; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128410 () Bool)

(assert start!128410)

(declare-fun b!1506089 () Bool)

(declare-fun res!1026447 () Bool)

(declare-fun e!841767 () Bool)

(assert (=> b!1506089 (=> (not res!1026447) (not e!841767))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100455 0))(
  ( (array!100456 (arr!48472 (Array (_ BitVec 32) (_ BitVec 64))) (size!49022 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100455)

(assert (=> b!1506089 (= res!1026447 (and (= (size!49022 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49022 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49022 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506090 () Bool)

(declare-fun res!1026451 () Bool)

(assert (=> b!1506090 (=> (not res!1026451) (not e!841767))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506090 (= res!1026451 (validKeyInArray!0 (select (arr!48472 a!2804) i!961)))))

(declare-fun b!1506091 () Bool)

(assert (=> b!1506091 (= e!841767 false)))

(declare-fun lt!654151 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506091 (= lt!654151 (toIndex!0 (select (arr!48472 a!2804) j!70) mask!2512))))

(declare-fun b!1506092 () Bool)

(declare-fun res!1026449 () Bool)

(assert (=> b!1506092 (=> (not res!1026449) (not e!841767))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100455 (_ BitVec 32)) Bool)

(assert (=> b!1506092 (= res!1026449 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506093 () Bool)

(declare-fun res!1026448 () Bool)

(assert (=> b!1506093 (=> (not res!1026448) (not e!841767))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1506093 (= res!1026448 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49022 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49022 a!2804))))))

(declare-fun res!1026445 () Bool)

(assert (=> start!128410 (=> (not res!1026445) (not e!841767))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128410 (= res!1026445 (validMask!0 mask!2512))))

(assert (=> start!128410 e!841767))

(assert (=> start!128410 true))

(declare-fun array_inv!37500 (array!100455) Bool)

(assert (=> start!128410 (array_inv!37500 a!2804)))

(declare-fun b!1506094 () Bool)

(declare-fun res!1026450 () Bool)

(assert (=> b!1506094 (=> (not res!1026450) (not e!841767))))

(declare-datatypes ((List!34955 0))(
  ( (Nil!34952) (Cons!34951 (h!36348 (_ BitVec 64)) (t!49649 List!34955)) )
))
(declare-fun arrayNoDuplicates!0 (array!100455 (_ BitVec 32) List!34955) Bool)

(assert (=> b!1506094 (= res!1026450 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34952))))

(declare-fun b!1506095 () Bool)

(declare-fun res!1026446 () Bool)

(assert (=> b!1506095 (=> (not res!1026446) (not e!841767))))

(assert (=> b!1506095 (= res!1026446 (validKeyInArray!0 (select (arr!48472 a!2804) j!70)))))

(assert (= (and start!128410 res!1026445) b!1506089))

(assert (= (and b!1506089 res!1026447) b!1506090))

(assert (= (and b!1506090 res!1026451) b!1506095))

(assert (= (and b!1506095 res!1026446) b!1506092))

(assert (= (and b!1506092 res!1026449) b!1506094))

(assert (= (and b!1506094 res!1026450) b!1506093))

(assert (= (and b!1506093 res!1026448) b!1506091))

(declare-fun m!1389103 () Bool)

(assert (=> b!1506091 m!1389103))

(assert (=> b!1506091 m!1389103))

(declare-fun m!1389105 () Bool)

(assert (=> b!1506091 m!1389105))

(declare-fun m!1389107 () Bool)

(assert (=> start!128410 m!1389107))

(declare-fun m!1389109 () Bool)

(assert (=> start!128410 m!1389109))

(declare-fun m!1389111 () Bool)

(assert (=> b!1506094 m!1389111))

(declare-fun m!1389113 () Bool)

(assert (=> b!1506090 m!1389113))

(assert (=> b!1506090 m!1389113))

(declare-fun m!1389115 () Bool)

(assert (=> b!1506090 m!1389115))

(declare-fun m!1389117 () Bool)

(assert (=> b!1506092 m!1389117))

(assert (=> b!1506095 m!1389103))

(assert (=> b!1506095 m!1389103))

(declare-fun m!1389119 () Bool)

(assert (=> b!1506095 m!1389119))

(push 1)

(assert (not b!1506094))

(assert (not start!128410))

(assert (not b!1506092))

(assert (not b!1506090))

(assert (not b!1506091))

(assert (not b!1506095))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

