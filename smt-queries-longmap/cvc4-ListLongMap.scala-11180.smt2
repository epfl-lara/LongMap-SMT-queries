; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130664 () Bool)

(assert start!130664)

(declare-fun b!1532736 () Bool)

(declare-fun e!853923 () Bool)

(assert (=> b!1532736 (= e!853923 false)))

(declare-fun lt!663477 () Bool)

(declare-datatypes ((array!101760 0))(
  ( (array!101761 (arr!49097 (Array (_ BitVec 32) (_ BitVec 64))) (size!49649 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101760)

(declare-datatypes ((List!35649 0))(
  ( (Nil!35646) (Cons!35645 (h!37091 (_ BitVec 64)) (t!50335 List!35649)) )
))
(declare-fun arrayNoDuplicates!0 (array!101760 (_ BitVec 32) List!35649) Bool)

(assert (=> b!1532736 (= lt!663477 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35646))))

(declare-fun b!1532737 () Bool)

(declare-fun res!1050006 () Bool)

(assert (=> b!1532737 (=> (not res!1050006) (not e!853923))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532737 (= res!1050006 (validKeyInArray!0 (select (arr!49097 a!2792) j!64)))))

(declare-fun b!1532739 () Bool)

(declare-fun res!1050007 () Bool)

(assert (=> b!1532739 (=> (not res!1050007) (not e!853923))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101760 (_ BitVec 32)) Bool)

(assert (=> b!1532739 (= res!1050007 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1532740 () Bool)

(declare-fun res!1050009 () Bool)

(assert (=> b!1532740 (=> (not res!1050009) (not e!853923))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1532740 (= res!1050009 (validKeyInArray!0 (select (arr!49097 a!2792) i!951)))))

(declare-fun res!1050008 () Bool)

(assert (=> start!130664 (=> (not res!1050008) (not e!853923))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130664 (= res!1050008 (validMask!0 mask!2480))))

(assert (=> start!130664 e!853923))

(assert (=> start!130664 true))

(declare-fun array_inv!38330 (array!101760) Bool)

(assert (=> start!130664 (array_inv!38330 a!2792)))

(declare-fun b!1532738 () Bool)

(declare-fun res!1050010 () Bool)

(assert (=> b!1532738 (=> (not res!1050010) (not e!853923))))

(assert (=> b!1532738 (= res!1050010 (and (= (size!49649 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49649 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49649 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!130664 res!1050008) b!1532738))

(assert (= (and b!1532738 res!1050010) b!1532740))

(assert (= (and b!1532740 res!1050009) b!1532737))

(assert (= (and b!1532737 res!1050006) b!1532739))

(assert (= (and b!1532739 res!1050007) b!1532736))

(declare-fun m!1414869 () Bool)

(assert (=> b!1532740 m!1414869))

(assert (=> b!1532740 m!1414869))

(declare-fun m!1414871 () Bool)

(assert (=> b!1532740 m!1414871))

(declare-fun m!1414873 () Bool)

(assert (=> b!1532736 m!1414873))

(declare-fun m!1414875 () Bool)

(assert (=> b!1532737 m!1414875))

(assert (=> b!1532737 m!1414875))

(declare-fun m!1414877 () Bool)

(assert (=> b!1532737 m!1414877))

(declare-fun m!1414879 () Bool)

(assert (=> b!1532739 m!1414879))

(declare-fun m!1414881 () Bool)

(assert (=> start!130664 m!1414881))

(declare-fun m!1414883 () Bool)

(assert (=> start!130664 m!1414883))

(push 1)

(assert (not b!1532739))

(assert (not b!1532736))

(assert (not b!1532740))

(assert (not start!130664))

(assert (not b!1532737))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

