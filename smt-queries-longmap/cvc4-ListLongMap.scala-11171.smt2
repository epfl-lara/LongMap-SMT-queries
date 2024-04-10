; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130572 () Bool)

(assert start!130572)

(declare-fun b!1532428 () Bool)

(declare-fun res!1049568 () Bool)

(declare-fun e!853816 () Bool)

(assert (=> b!1532428 (=> (not res!1049568) (not e!853816))))

(declare-datatypes ((array!101751 0))(
  ( (array!101752 (arr!49096 (Array (_ BitVec 32) (_ BitVec 64))) (size!49646 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101751)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532428 (= res!1049568 (validKeyInArray!0 (select (arr!49096 a!2792) j!64)))))

(declare-fun b!1532429 () Bool)

(declare-fun res!1049570 () Bool)

(assert (=> b!1532429 (=> (not res!1049570) (not e!853816))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1532429 (= res!1049570 (validKeyInArray!0 (select (arr!49096 a!2792) i!951)))))

(declare-fun b!1532430 () Bool)

(declare-fun res!1049569 () Bool)

(assert (=> b!1532430 (=> (not res!1049569) (not e!853816))))

(declare-fun mask!2480 () (_ BitVec 32))

(assert (=> b!1532430 (= res!1049569 (and (= (size!49646 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49646 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49646 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1049571 () Bool)

(assert (=> start!130572 (=> (not res!1049571) (not e!853816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130572 (= res!1049571 (validMask!0 mask!2480))))

(assert (=> start!130572 e!853816))

(assert (=> start!130572 true))

(declare-fun array_inv!38124 (array!101751) Bool)

(assert (=> start!130572 (array_inv!38124 a!2792)))

(declare-fun b!1532431 () Bool)

(assert (=> b!1532431 (= e!853816 (and (bvsle #b00000000000000000000000000000000 (size!49646 a!2792)) (bvsge (size!49646 a!2792) #b01111111111111111111111111111111)))))

(declare-fun b!1532432 () Bool)

(declare-fun res!1049572 () Bool)

(assert (=> b!1532432 (=> (not res!1049572) (not e!853816))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101751 (_ BitVec 32)) Bool)

(assert (=> b!1532432 (= res!1049572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!130572 res!1049571) b!1532430))

(assert (= (and b!1532430 res!1049569) b!1532429))

(assert (= (and b!1532429 res!1049570) b!1532428))

(assert (= (and b!1532428 res!1049568) b!1532432))

(assert (= (and b!1532432 res!1049572) b!1532431))

(declare-fun m!1415155 () Bool)

(assert (=> b!1532428 m!1415155))

(assert (=> b!1532428 m!1415155))

(declare-fun m!1415157 () Bool)

(assert (=> b!1532428 m!1415157))

(declare-fun m!1415159 () Bool)

(assert (=> b!1532429 m!1415159))

(assert (=> b!1532429 m!1415159))

(declare-fun m!1415161 () Bool)

(assert (=> b!1532429 m!1415161))

(declare-fun m!1415163 () Bool)

(assert (=> start!130572 m!1415163))

(declare-fun m!1415165 () Bool)

(assert (=> start!130572 m!1415165))

(declare-fun m!1415167 () Bool)

(assert (=> b!1532432 m!1415167))

(push 1)

(assert (not b!1532432))

(assert (not b!1532428))

(assert (not start!130572))

(assert (not b!1532429))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1532453 () Bool)

(declare-fun e!853833 () Bool)

(declare-fun call!68559 () Bool)

(assert (=> b!1532453 (= e!853833 call!68559)))

(declare-fun bm!68556 () Bool)

(assert (=> bm!68556 (= call!68559 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2792 mask!2480))))

(declare-fun d!160047 () Bool)

(declare-fun res!1049583 () Bool)

(declare-fun e!853834 () Bool)

(assert (=> d!160047 (=> res!1049583 e!853834)))

(assert (=> d!160047 (= res!1049583 (bvsge #b00000000000000000000000000000000 (size!49646 a!2792)))))

(assert (=> d!160047 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480) e!853834)))

(declare-fun b!1532454 () Bool)

(declare-fun e!853832 () Bool)

(assert (=> b!1532454 (= e!853833 e!853832)))

(declare-fun lt!663653 () (_ BitVec 64))

(assert (=> b!1532454 (= lt!663653 (select (arr!49096 a!2792) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51292 0))(
  ( (Unit!51293) )
))
(declare-fun lt!663655 () Unit!51292)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101751 (_ BitVec 64) (_ BitVec 32)) Unit!51292)

(assert (=> b!1532454 (= lt!663655 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2792 lt!663653 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101751 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1532454 (arrayContainsKey!0 a!2792 lt!663653 #b00000000000000000000000000000000)))

