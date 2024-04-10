; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130712 () Bool)

(assert start!130712)

(declare-fun b!1533034 () Bool)

(declare-fun e!854116 () Bool)

(assert (=> b!1533034 (= e!854116 false)))

(declare-fun lt!663760 () Bool)

(declare-datatypes ((array!101810 0))(
  ( (array!101811 (arr!49121 (Array (_ BitVec 32) (_ BitVec 64))) (size!49671 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101810)

(declare-datatypes ((List!35595 0))(
  ( (Nil!35592) (Cons!35591 (h!37036 (_ BitVec 64)) (t!50289 List!35595)) )
))
(declare-fun arrayNoDuplicates!0 (array!101810 (_ BitVec 32) List!35595) Bool)

(assert (=> b!1533034 (= lt!663760 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35592))))

(declare-fun res!1050121 () Bool)

(assert (=> start!130712 (=> (not res!1050121) (not e!854116))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130712 (= res!1050121 (validMask!0 mask!2480))))

(assert (=> start!130712 e!854116))

(assert (=> start!130712 true))

(declare-fun array_inv!38149 (array!101810) Bool)

(assert (=> start!130712 (array_inv!38149 a!2792)))

(declare-fun b!1533035 () Bool)

(declare-fun res!1050120 () Bool)

(assert (=> b!1533035 (=> (not res!1050120) (not e!854116))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1533035 (= res!1050120 (and (= (size!49671 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49671 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49671 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533036 () Bool)

(declare-fun res!1050123 () Bool)

(assert (=> b!1533036 (=> (not res!1050123) (not e!854116))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533036 (= res!1050123 (validKeyInArray!0 (select (arr!49121 a!2792) i!951)))))

(declare-fun b!1533037 () Bool)

(declare-fun res!1050124 () Bool)

(assert (=> b!1533037 (=> (not res!1050124) (not e!854116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101810 (_ BitVec 32)) Bool)

(assert (=> b!1533037 (= res!1050124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533038 () Bool)

(declare-fun res!1050122 () Bool)

(assert (=> b!1533038 (=> (not res!1050122) (not e!854116))))

(assert (=> b!1533038 (= res!1050122 (validKeyInArray!0 (select (arr!49121 a!2792) j!64)))))

(assert (= (and start!130712 res!1050121) b!1533035))

(assert (= (and b!1533035 res!1050120) b!1533036))

(assert (= (and b!1533036 res!1050123) b!1533038))

(assert (= (and b!1533038 res!1050122) b!1533037))

(assert (= (and b!1533037 res!1050124) b!1533034))

(declare-fun m!1415745 () Bool)

(assert (=> b!1533036 m!1415745))

(assert (=> b!1533036 m!1415745))

(declare-fun m!1415747 () Bool)

(assert (=> b!1533036 m!1415747))

(declare-fun m!1415749 () Bool)

(assert (=> b!1533038 m!1415749))

(assert (=> b!1533038 m!1415749))

(declare-fun m!1415751 () Bool)

(assert (=> b!1533038 m!1415751))

(declare-fun m!1415753 () Bool)

(assert (=> b!1533034 m!1415753))

(declare-fun m!1415755 () Bool)

(assert (=> b!1533037 m!1415755))

(declare-fun m!1415757 () Bool)

(assert (=> start!130712 m!1415757))

(declare-fun m!1415759 () Bool)

(assert (=> start!130712 m!1415759))

(push 1)

(assert (not b!1533038))

(assert (not b!1533037))

(assert (not b!1533036))

(assert (not start!130712))

(assert (not b!1533034))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

