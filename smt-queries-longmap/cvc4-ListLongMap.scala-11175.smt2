; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130686 () Bool)

(assert start!130686)

(declare-fun b!1532820 () Bool)

(declare-fun res!1049911 () Bool)

(declare-fun e!854037 () Bool)

(assert (=> b!1532820 (=> (not res!1049911) (not e!854037))))

(declare-datatypes ((array!101784 0))(
  ( (array!101785 (arr!49108 (Array (_ BitVec 32) (_ BitVec 64))) (size!49658 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101784)

(declare-datatypes ((List!35582 0))(
  ( (Nil!35579) (Cons!35578 (h!37023 (_ BitVec 64)) (t!50276 List!35582)) )
))
(declare-fun arrayNoDuplicates!0 (array!101784 (_ BitVec 32) List!35582) Bool)

(assert (=> b!1532820 (= res!1049911 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35579))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun b!1532821 () Bool)

(assert (=> b!1532821 (= e!854037 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49658 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49658 a!2792)) (= (select (arr!49108 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!2480 #b00000000000000000000000000000000)))))

(declare-fun b!1532822 () Bool)

(declare-fun res!1049907 () Bool)

(assert (=> b!1532822 (=> (not res!1049907) (not e!854037))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1532822 (= res!1049907 (and (= (size!49658 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49658 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49658 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1532823 () Bool)

(declare-fun res!1049909 () Bool)

(assert (=> b!1532823 (=> (not res!1049909) (not e!854037))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532823 (= res!1049909 (validKeyInArray!0 (select (arr!49108 a!2792) i!951)))))

(declare-fun b!1532824 () Bool)

(declare-fun res!1049910 () Bool)

(assert (=> b!1532824 (=> (not res!1049910) (not e!854037))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101784 (_ BitVec 32)) Bool)

(assert (=> b!1532824 (= res!1049910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1532825 () Bool)

(declare-fun res!1049906 () Bool)

(assert (=> b!1532825 (=> (not res!1049906) (not e!854037))))

(assert (=> b!1532825 (= res!1049906 (validKeyInArray!0 (select (arr!49108 a!2792) j!64)))))

(declare-fun res!1049908 () Bool)

(assert (=> start!130686 (=> (not res!1049908) (not e!854037))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130686 (= res!1049908 (validMask!0 mask!2480))))

(assert (=> start!130686 e!854037))

(assert (=> start!130686 true))

(declare-fun array_inv!38136 (array!101784) Bool)

(assert (=> start!130686 (array_inv!38136 a!2792)))

(assert (= (and start!130686 res!1049908) b!1532822))

(assert (= (and b!1532822 res!1049907) b!1532823))

(assert (= (and b!1532823 res!1049909) b!1532825))

(assert (= (and b!1532825 res!1049906) b!1532824))

(assert (= (and b!1532824 res!1049910) b!1532820))

(assert (= (and b!1532820 res!1049911) b!1532821))

(declare-fun m!1415523 () Bool)

(assert (=> b!1532823 m!1415523))

(assert (=> b!1532823 m!1415523))

(declare-fun m!1415525 () Bool)

(assert (=> b!1532823 m!1415525))

(declare-fun m!1415527 () Bool)

(assert (=> start!130686 m!1415527))

(declare-fun m!1415529 () Bool)

(assert (=> start!130686 m!1415529))

(declare-fun m!1415531 () Bool)

(assert (=> b!1532824 m!1415531))

(declare-fun m!1415533 () Bool)

(assert (=> b!1532825 m!1415533))

(assert (=> b!1532825 m!1415533))

(declare-fun m!1415535 () Bool)

(assert (=> b!1532825 m!1415535))

(declare-fun m!1415537 () Bool)

(assert (=> b!1532821 m!1415537))

(declare-fun m!1415539 () Bool)

(assert (=> b!1532820 m!1415539))

(push 1)

(assert (not b!1532823))

(assert (not b!1532824))

(assert (not start!130686))

(assert (not b!1532820))

(assert (not b!1532825))

(check-sat)

(pop 1)

(push 1)

(check-sat)

