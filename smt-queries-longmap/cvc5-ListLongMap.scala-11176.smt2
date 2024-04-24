; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131074 () Bool)

(assert start!131074)

(declare-fun b!1535158 () Bool)

(declare-fun res!1050759 () Bool)

(declare-fun e!855474 () Bool)

(assert (=> b!1535158 (=> (not res!1050759) (not e!855474))))

(declare-datatypes ((array!101909 0))(
  ( (array!101910 (arr!49164 (Array (_ BitVec 32) (_ BitVec 64))) (size!49715 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101909)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535158 (= res!1050759 (and (= (size!49715 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49715 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49715 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1050762 () Bool)

(assert (=> start!131074 (=> (not res!1050762) (not e!855474))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131074 (= res!1050762 (validMask!0 mask!2480))))

(assert (=> start!131074 e!855474))

(assert (=> start!131074 true))

(declare-fun array_inv!38445 (array!101909) Bool)

(assert (=> start!131074 (array_inv!38445 a!2792)))

(declare-fun b!1535159 () Bool)

(declare-fun res!1050761 () Bool)

(assert (=> b!1535159 (=> (not res!1050761) (not e!855474))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101909 (_ BitVec 32)) Bool)

(assert (=> b!1535159 (= res!1050761 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535160 () Bool)

(declare-fun res!1050760 () Bool)

(assert (=> b!1535160 (=> (not res!1050760) (not e!855474))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535160 (= res!1050760 (validKeyInArray!0 (select (arr!49164 a!2792) j!64)))))

(declare-fun b!1535161 () Bool)

(assert (=> b!1535161 (= e!855474 false)))

(declare-fun lt!664623 () Bool)

(declare-datatypes ((List!35625 0))(
  ( (Nil!35622) (Cons!35621 (h!37084 (_ BitVec 64)) (t!50311 List!35625)) )
))
(declare-fun arrayNoDuplicates!0 (array!101909 (_ BitVec 32) List!35625) Bool)

(assert (=> b!1535161 (= lt!664623 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35622))))

(declare-fun b!1535162 () Bool)

(declare-fun res!1050758 () Bool)

(assert (=> b!1535162 (=> (not res!1050758) (not e!855474))))

(assert (=> b!1535162 (= res!1050758 (validKeyInArray!0 (select (arr!49164 a!2792) i!951)))))

(assert (= (and start!131074 res!1050762) b!1535158))

(assert (= (and b!1535158 res!1050759) b!1535162))

(assert (= (and b!1535162 res!1050758) b!1535160))

(assert (= (and b!1535160 res!1050760) b!1535159))

(assert (= (and b!1535159 res!1050761) b!1535161))

(declare-fun m!1417731 () Bool)

(assert (=> b!1535159 m!1417731))

(declare-fun m!1417733 () Bool)

(assert (=> start!131074 m!1417733))

(declare-fun m!1417735 () Bool)

(assert (=> start!131074 m!1417735))

(declare-fun m!1417737 () Bool)

(assert (=> b!1535162 m!1417737))

(assert (=> b!1535162 m!1417737))

(declare-fun m!1417739 () Bool)

(assert (=> b!1535162 m!1417739))

(declare-fun m!1417741 () Bool)

(assert (=> b!1535161 m!1417741))

(declare-fun m!1417743 () Bool)

(assert (=> b!1535160 m!1417743))

(assert (=> b!1535160 m!1417743))

(declare-fun m!1417745 () Bool)

(assert (=> b!1535160 m!1417745))

(push 1)

(assert (not b!1535161))

(assert (not b!1535160))

(assert (not b!1535162))

(assert (not start!131074))

(assert (not b!1535159))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

