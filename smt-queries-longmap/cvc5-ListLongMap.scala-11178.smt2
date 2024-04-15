; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130654 () Bool)

(assert start!130654)

(declare-fun b!1532652 () Bool)

(declare-fun res!1049925 () Bool)

(declare-fun e!853893 () Bool)

(assert (=> b!1532652 (=> (not res!1049925) (not e!853893))))

(declare-datatypes ((array!101750 0))(
  ( (array!101751 (arr!49092 (Array (_ BitVec 32) (_ BitVec 64))) (size!49644 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101750)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532652 (= res!1049925 (validKeyInArray!0 (select (arr!49092 a!2792) i!951)))))

(declare-fun b!1532653 () Bool)

(declare-fun res!1049926 () Bool)

(assert (=> b!1532653 (=> (not res!1049926) (not e!853893))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101750 (_ BitVec 32)) Bool)

(assert (=> b!1532653 (= res!1049926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1532654 () Bool)

(assert (=> b!1532654 (= e!853893 false)))

(declare-fun lt!663471 () Bool)

(declare-datatypes ((List!35644 0))(
  ( (Nil!35641) (Cons!35640 (h!37086 (_ BitVec 64)) (t!50330 List!35644)) )
))
(declare-fun arrayNoDuplicates!0 (array!101750 (_ BitVec 32) List!35644) Bool)

(assert (=> b!1532654 (= lt!663471 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35641))))

(declare-fun b!1532655 () Bool)

(declare-fun res!1049922 () Bool)

(assert (=> b!1532655 (=> (not res!1049922) (not e!853893))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1532655 (= res!1049922 (validKeyInArray!0 (select (arr!49092 a!2792) j!64)))))

(declare-fun b!1532656 () Bool)

(declare-fun res!1049923 () Bool)

(assert (=> b!1532656 (=> (not res!1049923) (not e!853893))))

(assert (=> b!1532656 (= res!1049923 (and (= (size!49644 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49644 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49644 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1049924 () Bool)

(assert (=> start!130654 (=> (not res!1049924) (not e!853893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130654 (= res!1049924 (validMask!0 mask!2480))))

(assert (=> start!130654 e!853893))

(assert (=> start!130654 true))

(declare-fun array_inv!38325 (array!101750) Bool)

(assert (=> start!130654 (array_inv!38325 a!2792)))

(assert (= (and start!130654 res!1049924) b!1532656))

(assert (= (and b!1532656 res!1049923) b!1532652))

(assert (= (and b!1532652 res!1049925) b!1532655))

(assert (= (and b!1532655 res!1049922) b!1532653))

(assert (= (and b!1532653 res!1049926) b!1532654))

(declare-fun m!1414783 () Bool)

(assert (=> b!1532654 m!1414783))

(declare-fun m!1414785 () Bool)

(assert (=> start!130654 m!1414785))

(declare-fun m!1414787 () Bool)

(assert (=> start!130654 m!1414787))

(declare-fun m!1414789 () Bool)

(assert (=> b!1532652 m!1414789))

(assert (=> b!1532652 m!1414789))

(declare-fun m!1414791 () Bool)

(assert (=> b!1532652 m!1414791))

(declare-fun m!1414793 () Bool)

(assert (=> b!1532653 m!1414793))

(declare-fun m!1414795 () Bool)

(assert (=> b!1532655 m!1414795))

(assert (=> b!1532655 m!1414795))

(declare-fun m!1414797 () Bool)

(assert (=> b!1532655 m!1414797))

(push 1)

(assert (not b!1532654))

(assert (not b!1532655))

(assert (not start!130654))

(assert (not b!1532653))

(assert (not b!1532652))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

