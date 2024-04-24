; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131086 () Bool)

(assert start!131086)

(declare-fun b!1535257 () Bool)

(declare-fun res!1050861 () Bool)

(declare-fun e!855510 () Bool)

(assert (=> b!1535257 (=> (not res!1050861) (not e!855510))))

(declare-datatypes ((array!101921 0))(
  ( (array!101922 (arr!49170 (Array (_ BitVec 32) (_ BitVec 64))) (size!49721 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101921)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535257 (= res!1050861 (and (= (size!49721 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49721 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49721 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535258 () Bool)

(declare-fun res!1050860 () Bool)

(assert (=> b!1535258 (=> (not res!1050860) (not e!855510))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535258 (= res!1050860 (validKeyInArray!0 (select (arr!49170 a!2792) i!951)))))

(declare-fun b!1535259 () Bool)

(declare-fun res!1050858 () Bool)

(assert (=> b!1535259 (=> (not res!1050858) (not e!855510))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101921 (_ BitVec 32)) Bool)

(assert (=> b!1535259 (= res!1050858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535260 () Bool)

(declare-fun res!1050859 () Bool)

(assert (=> b!1535260 (=> (not res!1050859) (not e!855510))))

(assert (=> b!1535260 (= res!1050859 (validKeyInArray!0 (select (arr!49170 a!2792) j!64)))))

(declare-fun b!1535261 () Bool)

(assert (=> b!1535261 (= e!855510 false)))

(declare-fun lt!664632 () Bool)

(declare-datatypes ((List!35631 0))(
  ( (Nil!35628) (Cons!35627 (h!37090 (_ BitVec 64)) (t!50317 List!35631)) )
))
(declare-fun arrayNoDuplicates!0 (array!101921 (_ BitVec 32) List!35631) Bool)

(assert (=> b!1535261 (= lt!664632 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35628))))

(declare-fun res!1050857 () Bool)

(assert (=> start!131086 (=> (not res!1050857) (not e!855510))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131086 (= res!1050857 (validMask!0 mask!2480))))

(assert (=> start!131086 e!855510))

(assert (=> start!131086 true))

(declare-fun array_inv!38451 (array!101921) Bool)

(assert (=> start!131086 (array_inv!38451 a!2792)))

(assert (= (and start!131086 res!1050857) b!1535257))

(assert (= (and b!1535257 res!1050861) b!1535258))

(assert (= (and b!1535258 res!1050860) b!1535260))

(assert (= (and b!1535260 res!1050859) b!1535259))

(assert (= (and b!1535259 res!1050858) b!1535261))

(declare-fun m!1417833 () Bool)

(assert (=> b!1535261 m!1417833))

(declare-fun m!1417835 () Bool)

(assert (=> b!1535260 m!1417835))

(assert (=> b!1535260 m!1417835))

(declare-fun m!1417837 () Bool)

(assert (=> b!1535260 m!1417837))

(declare-fun m!1417839 () Bool)

(assert (=> b!1535258 m!1417839))

(assert (=> b!1535258 m!1417839))

(declare-fun m!1417841 () Bool)

(assert (=> b!1535258 m!1417841))

(declare-fun m!1417843 () Bool)

(assert (=> start!131086 m!1417843))

(declare-fun m!1417845 () Bool)

(assert (=> start!131086 m!1417845))

(declare-fun m!1417847 () Bool)

(assert (=> b!1535259 m!1417847))

(push 1)

(assert (not b!1535258))

(assert (not start!131086))

(assert (not b!1535259))

(assert (not b!1535260))

(assert (not b!1535261))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

