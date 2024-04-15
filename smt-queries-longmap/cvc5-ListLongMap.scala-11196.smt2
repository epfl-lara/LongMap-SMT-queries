; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130762 () Bool)

(assert start!130762)

(declare-fun b!1533820 () Bool)

(declare-fun res!1051090 () Bool)

(declare-fun e!854218 () Bool)

(assert (=> b!1533820 (=> (not res!1051090) (not e!854218))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!101858 0))(
  ( (array!101859 (arr!49146 (Array (_ BitVec 32) (_ BitVec 64))) (size!49698 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101858)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1533820 (= res!1051090 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49698 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49698 a!2792)) (= (select (arr!49146 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533821 () Bool)

(declare-fun res!1051096 () Bool)

(assert (=> b!1533821 (=> (not res!1051096) (not e!854218))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1533821 (= res!1051096 (and (= (size!49698 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49698 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49698 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533822 () Bool)

(declare-fun res!1051095 () Bool)

(assert (=> b!1533822 (=> (not res!1051095) (not e!854218))))

(declare-datatypes ((List!35698 0))(
  ( (Nil!35695) (Cons!35694 (h!37140 (_ BitVec 64)) (t!50384 List!35698)) )
))
(declare-fun arrayNoDuplicates!0 (array!101858 (_ BitVec 32) List!35698) Bool)

(assert (=> b!1533822 (= res!1051095 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35695))))

(declare-fun b!1533823 () Bool)

(declare-fun res!1051092 () Bool)

(assert (=> b!1533823 (=> (not res!1051092) (not e!854218))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101858 (_ BitVec 32)) Bool)

(assert (=> b!1533823 (= res!1051092 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1051094 () Bool)

(assert (=> start!130762 (=> (not res!1051094) (not e!854218))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130762 (= res!1051094 (validMask!0 mask!2480))))

(assert (=> start!130762 e!854218))

(assert (=> start!130762 true))

(declare-fun array_inv!38379 (array!101858) Bool)

(assert (=> start!130762 (array_inv!38379 a!2792)))

(declare-fun b!1533824 () Bool)

(assert (=> b!1533824 (= e!854218 false)))

(declare-datatypes ((SeekEntryResult!13303 0))(
  ( (MissingZero!13303 (index!55607 (_ BitVec 32))) (Found!13303 (index!55608 (_ BitVec 32))) (Intermediate!13303 (undefined!14115 Bool) (index!55609 (_ BitVec 32)) (x!137364 (_ BitVec 32))) (Undefined!13303) (MissingVacant!13303 (index!55610 (_ BitVec 32))) )
))
(declare-fun lt!663552 () SeekEntryResult!13303)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101858 (_ BitVec 32)) SeekEntryResult!13303)

(assert (=> b!1533824 (= lt!663552 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49146 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1533825 () Bool)

(declare-fun res!1051091 () Bool)

(assert (=> b!1533825 (=> (not res!1051091) (not e!854218))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533825 (= res!1051091 (validKeyInArray!0 (select (arr!49146 a!2792) i!951)))))

(declare-fun b!1533826 () Bool)

(declare-fun res!1051093 () Bool)

(assert (=> b!1533826 (=> (not res!1051093) (not e!854218))))

(assert (=> b!1533826 (= res!1051093 (validKeyInArray!0 (select (arr!49146 a!2792) j!64)))))

(assert (= (and start!130762 res!1051094) b!1533821))

(assert (= (and b!1533821 res!1051096) b!1533825))

(assert (= (and b!1533825 res!1051091) b!1533826))

(assert (= (and b!1533826 res!1051093) b!1533823))

(assert (= (and b!1533823 res!1051092) b!1533822))

(assert (= (and b!1533822 res!1051095) b!1533820))

(assert (= (and b!1533820 res!1051090) b!1533824))

(declare-fun m!1415913 () Bool)

(assert (=> b!1533824 m!1415913))

(assert (=> b!1533824 m!1415913))

(declare-fun m!1415915 () Bool)

(assert (=> b!1533824 m!1415915))

(assert (=> b!1533826 m!1415913))

(assert (=> b!1533826 m!1415913))

(declare-fun m!1415917 () Bool)

(assert (=> b!1533826 m!1415917))

(declare-fun m!1415919 () Bool)

(assert (=> b!1533822 m!1415919))

(declare-fun m!1415921 () Bool)

(assert (=> b!1533820 m!1415921))

(declare-fun m!1415923 () Bool)

(assert (=> b!1533825 m!1415923))

(assert (=> b!1533825 m!1415923))

(declare-fun m!1415925 () Bool)

(assert (=> b!1533825 m!1415925))

(declare-fun m!1415927 () Bool)

(assert (=> b!1533823 m!1415927))

(declare-fun m!1415929 () Bool)

(assert (=> start!130762 m!1415929))

(declare-fun m!1415931 () Bool)

(assert (=> start!130762 m!1415931))

(push 1)

(assert (not b!1533824))

(assert (not b!1533823))

(assert (not b!1533825))

(assert (not b!1533826))

(assert (not b!1533822))

(assert (not start!130762))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

