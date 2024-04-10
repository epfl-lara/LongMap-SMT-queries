; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130848 () Bool)

(assert start!130848)

(declare-fun b!1534553 () Bool)

(declare-fun res!1051641 () Bool)

(declare-fun e!854531 () Bool)

(assert (=> b!1534553 (=> (not res!1051641) (not e!854531))))

(declare-datatypes ((array!101946 0))(
  ( (array!101947 (arr!49189 (Array (_ BitVec 32) (_ BitVec 64))) (size!49739 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101946)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534553 (= res!1051641 (and (= (size!49739 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49739 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49739 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534554 () Bool)

(declare-fun e!854533 () Bool)

(assert (=> b!1534554 (= e!854533 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!663882 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13321 0))(
  ( (MissingZero!13321 (index!55679 (_ BitVec 32))) (Found!13321 (index!55680 (_ BitVec 32))) (Intermediate!13321 (undefined!14133 Bool) (index!55681 (_ BitVec 32)) (x!137435 (_ BitVec 32))) (Undefined!13321) (MissingVacant!13321 (index!55682 (_ BitVec 32))) )
))
(declare-fun lt!663883 () SeekEntryResult!13321)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101946 (_ BitVec 32)) SeekEntryResult!13321)

(assert (=> b!1534554 (= lt!663883 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663882 vacantIndex!5 (select (arr!49189 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1534555 () Bool)

(declare-fun res!1051646 () Bool)

(assert (=> b!1534555 (=> (not res!1051646) (not e!854531))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1534555 (= res!1051646 (not (= (select (arr!49189 a!2792) index!463) (select (arr!49189 a!2792) j!64))))))

(declare-fun b!1534556 () Bool)

(declare-fun res!1051639 () Bool)

(assert (=> b!1534556 (=> (not res!1051639) (not e!854531))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534556 (= res!1051639 (validKeyInArray!0 (select (arr!49189 a!2792) j!64)))))

(declare-fun b!1534557 () Bool)

(declare-fun res!1051648 () Bool)

(assert (=> b!1534557 (=> (not res!1051648) (not e!854531))))

(declare-datatypes ((List!35663 0))(
  ( (Nil!35660) (Cons!35659 (h!37104 (_ BitVec 64)) (t!50357 List!35663)) )
))
(declare-fun arrayNoDuplicates!0 (array!101946 (_ BitVec 32) List!35663) Bool)

(assert (=> b!1534557 (= res!1051648 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35660))))

(declare-fun res!1051645 () Bool)

(assert (=> start!130848 (=> (not res!1051645) (not e!854531))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130848 (= res!1051645 (validMask!0 mask!2480))))

(assert (=> start!130848 e!854531))

(assert (=> start!130848 true))

(declare-fun array_inv!38217 (array!101946) Bool)

(assert (=> start!130848 (array_inv!38217 a!2792)))

(declare-fun b!1534558 () Bool)

(declare-fun res!1051647 () Bool)

(assert (=> b!1534558 (=> (not res!1051647) (not e!854531))))

(assert (=> b!1534558 (= res!1051647 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49189 a!2792) j!64) a!2792 mask!2480) (Found!13321 j!64)))))

(declare-fun b!1534559 () Bool)

(assert (=> b!1534559 (= e!854531 e!854533)))

(declare-fun res!1051640 () Bool)

(assert (=> b!1534559 (=> (not res!1051640) (not e!854533))))

(assert (=> b!1534559 (= res!1051640 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663882 #b00000000000000000000000000000000) (bvslt lt!663882 (size!49739 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1534559 (= lt!663882 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1534560 () Bool)

(declare-fun res!1051643 () Bool)

(assert (=> b!1534560 (=> (not res!1051643) (not e!854531))))

(assert (=> b!1534560 (= res!1051643 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49739 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49739 a!2792)) (= (select (arr!49189 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534561 () Bool)

(declare-fun res!1051642 () Bool)

(assert (=> b!1534561 (=> (not res!1051642) (not e!854531))))

(assert (=> b!1534561 (= res!1051642 (validKeyInArray!0 (select (arr!49189 a!2792) i!951)))))

(declare-fun b!1534562 () Bool)

(declare-fun res!1051644 () Bool)

(assert (=> b!1534562 (=> (not res!1051644) (not e!854531))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101946 (_ BitVec 32)) Bool)

(assert (=> b!1534562 (= res!1051644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!130848 res!1051645) b!1534553))

(assert (= (and b!1534553 res!1051641) b!1534561))

(assert (= (and b!1534561 res!1051642) b!1534556))

(assert (= (and b!1534556 res!1051639) b!1534562))

(assert (= (and b!1534562 res!1051644) b!1534557))

(assert (= (and b!1534557 res!1051648) b!1534560))

(assert (= (and b!1534560 res!1051643) b!1534558))

(assert (= (and b!1534558 res!1051647) b!1534555))

(assert (= (and b!1534555 res!1051646) b!1534559))

(assert (= (and b!1534559 res!1051640) b!1534554))

(declare-fun m!1417189 () Bool)

(assert (=> b!1534557 m!1417189))

(declare-fun m!1417191 () Bool)

(assert (=> b!1534562 m!1417191))

(declare-fun m!1417193 () Bool)

(assert (=> b!1534554 m!1417193))

(assert (=> b!1534554 m!1417193))

(declare-fun m!1417195 () Bool)

(assert (=> b!1534554 m!1417195))

(declare-fun m!1417197 () Bool)

(assert (=> b!1534555 m!1417197))

(assert (=> b!1534555 m!1417193))

(declare-fun m!1417199 () Bool)

(assert (=> b!1534559 m!1417199))

(assert (=> b!1534558 m!1417193))

(assert (=> b!1534558 m!1417193))

(declare-fun m!1417201 () Bool)

(assert (=> b!1534558 m!1417201))

(declare-fun m!1417203 () Bool)

(assert (=> start!130848 m!1417203))

(declare-fun m!1417205 () Bool)

(assert (=> start!130848 m!1417205))

(declare-fun m!1417207 () Bool)

(assert (=> b!1534560 m!1417207))

(declare-fun m!1417209 () Bool)

(assert (=> b!1534561 m!1417209))

(assert (=> b!1534561 m!1417209))

(declare-fun m!1417211 () Bool)

(assert (=> b!1534561 m!1417211))

(assert (=> b!1534556 m!1417193))

(assert (=> b!1534556 m!1417193))

(declare-fun m!1417213 () Bool)

(assert (=> b!1534556 m!1417213))

(push 1)

(assert (not b!1534557))

(assert (not start!130848))

(assert (not b!1534554))

(assert (not b!1534559))

(assert (not b!1534561))

(assert (not b!1534558))

(assert (not b!1534562))

(assert (not b!1534556))

