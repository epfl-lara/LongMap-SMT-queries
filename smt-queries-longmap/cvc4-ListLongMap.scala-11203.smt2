; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130854 () Bool)

(assert start!130854)

(declare-fun b!1534643 () Bool)

(declare-fun res!1051733 () Bool)

(declare-fun e!854560 () Bool)

(assert (=> b!1534643 (=> (not res!1051733) (not e!854560))))

(declare-datatypes ((array!101952 0))(
  ( (array!101953 (arr!49192 (Array (_ BitVec 32) (_ BitVec 64))) (size!49742 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101952)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534643 (= res!1051733 (validKeyInArray!0 (select (arr!49192 a!2792) j!64)))))

(declare-fun b!1534644 () Bool)

(declare-fun res!1051738 () Bool)

(assert (=> b!1534644 (=> (not res!1051738) (not e!854560))))

(declare-datatypes ((List!35666 0))(
  ( (Nil!35663) (Cons!35662 (h!37107 (_ BitVec 64)) (t!50360 List!35666)) )
))
(declare-fun arrayNoDuplicates!0 (array!101952 (_ BitVec 32) List!35666) Bool)

(assert (=> b!1534644 (= res!1051738 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35663))))

(declare-fun b!1534645 () Bool)

(declare-fun e!854558 () Bool)

(assert (=> b!1534645 (= e!854558 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun lt!663900 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13324 0))(
  ( (MissingZero!13324 (index!55691 (_ BitVec 32))) (Found!13324 (index!55692 (_ BitVec 32))) (Intermediate!13324 (undefined!14136 Bool) (index!55693 (_ BitVec 32)) (x!137446 (_ BitVec 32))) (Undefined!13324) (MissingVacant!13324 (index!55694 (_ BitVec 32))) )
))
(declare-fun lt!663901 () SeekEntryResult!13324)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101952 (_ BitVec 32)) SeekEntryResult!13324)

(assert (=> b!1534645 (= lt!663901 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663900 vacantIndex!5 (select (arr!49192 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1534646 () Bool)

(declare-fun res!1051737 () Bool)

(assert (=> b!1534646 (=> (not res!1051737) (not e!854560))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534646 (= res!1051737 (validKeyInArray!0 (select (arr!49192 a!2792) i!951)))))

(declare-fun b!1534647 () Bool)

(assert (=> b!1534647 (= e!854560 e!854558)))

(declare-fun res!1051729 () Bool)

(assert (=> b!1534647 (=> (not res!1051729) (not e!854558))))

(assert (=> b!1534647 (= res!1051729 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663900 #b00000000000000000000000000000000) (bvslt lt!663900 (size!49742 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1534647 (= lt!663900 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1534648 () Bool)

(declare-fun res!1051734 () Bool)

(assert (=> b!1534648 (=> (not res!1051734) (not e!854560))))

(assert (=> b!1534648 (= res!1051734 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49742 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49742 a!2792)) (= (select (arr!49192 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534649 () Bool)

(declare-fun res!1051735 () Bool)

(assert (=> b!1534649 (=> (not res!1051735) (not e!854560))))

(assert (=> b!1534649 (= res!1051735 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49192 a!2792) j!64) a!2792 mask!2480) (Found!13324 j!64)))))

(declare-fun b!1534650 () Bool)

(declare-fun res!1051730 () Bool)

(assert (=> b!1534650 (=> (not res!1051730) (not e!854560))))

(assert (=> b!1534650 (= res!1051730 (not (= (select (arr!49192 a!2792) index!463) (select (arr!49192 a!2792) j!64))))))

(declare-fun b!1534651 () Bool)

(declare-fun res!1051731 () Bool)

(assert (=> b!1534651 (=> (not res!1051731) (not e!854560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101952 (_ BitVec 32)) Bool)

(assert (=> b!1534651 (= res!1051731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1051736 () Bool)

(assert (=> start!130854 (=> (not res!1051736) (not e!854560))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130854 (= res!1051736 (validMask!0 mask!2480))))

(assert (=> start!130854 e!854560))

(assert (=> start!130854 true))

(declare-fun array_inv!38220 (array!101952) Bool)

(assert (=> start!130854 (array_inv!38220 a!2792)))

(declare-fun b!1534652 () Bool)

(declare-fun res!1051732 () Bool)

(assert (=> b!1534652 (=> (not res!1051732) (not e!854560))))

(assert (=> b!1534652 (= res!1051732 (and (= (size!49742 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49742 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49742 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!130854 res!1051736) b!1534652))

(assert (= (and b!1534652 res!1051732) b!1534646))

(assert (= (and b!1534646 res!1051737) b!1534643))

(assert (= (and b!1534643 res!1051733) b!1534651))

(assert (= (and b!1534651 res!1051731) b!1534644))

(assert (= (and b!1534644 res!1051738) b!1534648))

(assert (= (and b!1534648 res!1051734) b!1534649))

(assert (= (and b!1534649 res!1051735) b!1534650))

(assert (= (and b!1534650 res!1051730) b!1534647))

(assert (= (and b!1534647 res!1051729) b!1534645))

(declare-fun m!1417267 () Bool)

(assert (=> b!1534651 m!1417267))

(declare-fun m!1417269 () Bool)

(assert (=> b!1534649 m!1417269))

(assert (=> b!1534649 m!1417269))

(declare-fun m!1417271 () Bool)

(assert (=> b!1534649 m!1417271))

(declare-fun m!1417273 () Bool)

(assert (=> b!1534648 m!1417273))

(assert (=> b!1534645 m!1417269))

(assert (=> b!1534645 m!1417269))

(declare-fun m!1417275 () Bool)

(assert (=> b!1534645 m!1417275))

(declare-fun m!1417277 () Bool)

(assert (=> b!1534650 m!1417277))

(assert (=> b!1534650 m!1417269))

(declare-fun m!1417279 () Bool)

(assert (=> b!1534647 m!1417279))

(declare-fun m!1417281 () Bool)

(assert (=> b!1534644 m!1417281))

(declare-fun m!1417283 () Bool)

(assert (=> start!130854 m!1417283))

(declare-fun m!1417285 () Bool)

(assert (=> start!130854 m!1417285))

(assert (=> b!1534643 m!1417269))

(assert (=> b!1534643 m!1417269))

(declare-fun m!1417287 () Bool)

(assert (=> b!1534643 m!1417287))

(declare-fun m!1417289 () Bool)

(assert (=> b!1534646 m!1417289))

(assert (=> b!1534646 m!1417289))

(declare-fun m!1417291 () Bool)

(assert (=> b!1534646 m!1417291))

(push 1)

(assert (not start!130854))

(assert (not b!1534645))

(assert (not b!1534646))

(assert (not b!1534647))

(assert (not b!1534644))

(assert (not b!1534651))

(assert (not b!1534649))

(assert (not b!1534643))

