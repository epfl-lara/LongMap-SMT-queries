; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130716 () Bool)

(assert start!130716)

(declare-fun res!1050153 () Bool)

(declare-fun e!854127 () Bool)

(assert (=> start!130716 (=> (not res!1050153) (not e!854127))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130716 (= res!1050153 (validMask!0 mask!2480))))

(assert (=> start!130716 e!854127))

(assert (=> start!130716 true))

(declare-datatypes ((array!101814 0))(
  ( (array!101815 (arr!49123 (Array (_ BitVec 32) (_ BitVec 64))) (size!49673 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101814)

(declare-fun array_inv!38151 (array!101814) Bool)

(assert (=> start!130716 (array_inv!38151 a!2792)))

(declare-fun b!1533064 () Bool)

(declare-fun res!1050152 () Bool)

(assert (=> b!1533064 (=> (not res!1050152) (not e!854127))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101814 (_ BitVec 32)) Bool)

(assert (=> b!1533064 (= res!1050152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533065 () Bool)

(assert (=> b!1533065 (= e!854127 false)))

(declare-fun lt!663766 () Bool)

(declare-datatypes ((List!35597 0))(
  ( (Nil!35594) (Cons!35593 (h!37038 (_ BitVec 64)) (t!50291 List!35597)) )
))
(declare-fun arrayNoDuplicates!0 (array!101814 (_ BitVec 32) List!35597) Bool)

(assert (=> b!1533065 (= lt!663766 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35594))))

(declare-fun b!1533066 () Bool)

(declare-fun res!1050154 () Bool)

(assert (=> b!1533066 (=> (not res!1050154) (not e!854127))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1533066 (= res!1050154 (and (= (size!49673 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49673 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49673 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533067 () Bool)

(declare-fun res!1050150 () Bool)

(assert (=> b!1533067 (=> (not res!1050150) (not e!854127))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533067 (= res!1050150 (validKeyInArray!0 (select (arr!49123 a!2792) i!951)))))

(declare-fun b!1533068 () Bool)

(declare-fun res!1050151 () Bool)

(assert (=> b!1533068 (=> (not res!1050151) (not e!854127))))

(assert (=> b!1533068 (= res!1050151 (validKeyInArray!0 (select (arr!49123 a!2792) j!64)))))

(assert (= (and start!130716 res!1050153) b!1533066))

(assert (= (and b!1533066 res!1050154) b!1533067))

(assert (= (and b!1533067 res!1050150) b!1533068))

(assert (= (and b!1533068 res!1050151) b!1533064))

(assert (= (and b!1533064 res!1050152) b!1533065))

(declare-fun m!1415777 () Bool)

(assert (=> start!130716 m!1415777))

(declare-fun m!1415779 () Bool)

(assert (=> start!130716 m!1415779))

(declare-fun m!1415781 () Bool)

(assert (=> b!1533065 m!1415781))

(declare-fun m!1415783 () Bool)

(assert (=> b!1533068 m!1415783))

(assert (=> b!1533068 m!1415783))

(declare-fun m!1415785 () Bool)

(assert (=> b!1533068 m!1415785))

(declare-fun m!1415787 () Bool)

(assert (=> b!1533067 m!1415787))

(assert (=> b!1533067 m!1415787))

(declare-fun m!1415789 () Bool)

(assert (=> b!1533067 m!1415789))

(declare-fun m!1415791 () Bool)

(assert (=> b!1533064 m!1415791))

(push 1)

(assert (not b!1533068))

(assert (not b!1533067))

(assert (not b!1533065))

(assert (not b!1533064))

(assert (not start!130716))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

