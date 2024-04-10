; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118476 () Bool)

(assert start!118476)

(declare-fun b!1385447 () Bool)

(declare-fun res!926697 () Bool)

(declare-fun e!784994 () Bool)

(assert (=> b!1385447 (=> (not res!926697) (not e!784994))))

(declare-datatypes ((array!94752 0))(
  ( (array!94753 (arr!45752 (Array (_ BitVec 32) (_ BitVec 64))) (size!46302 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94752)

(declare-datatypes ((List!32280 0))(
  ( (Nil!32277) (Cons!32276 (h!33485 (_ BitVec 64)) (t!46974 List!32280)) )
))
(declare-fun arrayNoDuplicates!0 (array!94752 (_ BitVec 32) List!32280) Bool)

(assert (=> b!1385447 (= res!926697 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32277))))

(declare-fun b!1385448 () Bool)

(assert (=> b!1385448 (= e!784994 false)))

(declare-fun lt!609246 () Bool)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94752 (_ BitVec 32)) Bool)

(assert (=> b!1385448 (= lt!609246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385445 () Bool)

(declare-fun res!926695 () Bool)

(assert (=> b!1385445 (=> (not res!926695) (not e!784994))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385445 (= res!926695 (and (= (size!46302 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46302 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46302 a!2938))))))

(declare-fun res!926696 () Bool)

(assert (=> start!118476 (=> (not res!926696) (not e!784994))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118476 (= res!926696 (validMask!0 mask!2987))))

(assert (=> start!118476 e!784994))

(assert (=> start!118476 true))

(declare-fun array_inv!34780 (array!94752) Bool)

(assert (=> start!118476 (array_inv!34780 a!2938)))

(declare-fun b!1385446 () Bool)

(declare-fun res!926698 () Bool)

(assert (=> b!1385446 (=> (not res!926698) (not e!784994))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385446 (= res!926698 (validKeyInArray!0 (select (arr!45752 a!2938) i!1065)))))

(assert (= (and start!118476 res!926696) b!1385445))

(assert (= (and b!1385445 res!926695) b!1385446))

(assert (= (and b!1385446 res!926698) b!1385447))

(assert (= (and b!1385447 res!926697) b!1385448))

(declare-fun m!1270737 () Bool)

(assert (=> b!1385447 m!1270737))

(declare-fun m!1270739 () Bool)

(assert (=> b!1385448 m!1270739))

(declare-fun m!1270741 () Bool)

(assert (=> start!118476 m!1270741))

(declare-fun m!1270743 () Bool)

(assert (=> start!118476 m!1270743))

(declare-fun m!1270745 () Bool)

(assert (=> b!1385446 m!1270745))

(assert (=> b!1385446 m!1270745))

(declare-fun m!1270747 () Bool)

(assert (=> b!1385446 m!1270747))

(push 1)

(assert (not b!1385448))

(assert (not b!1385447))

(assert (not start!118476))

(assert (not b!1385446))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

