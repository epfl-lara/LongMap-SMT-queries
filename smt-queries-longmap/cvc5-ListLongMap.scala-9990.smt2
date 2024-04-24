; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118164 () Bool)

(assert start!118164)

(declare-fun b!1383092 () Bool)

(declare-fun res!923931 () Bool)

(declare-fun e!784111 () Bool)

(assert (=> b!1383092 (=> (not res!923931) (not e!784111))))

(declare-datatypes ((array!94451 0))(
  ( (array!94452 (arr!45606 (Array (_ BitVec 32) (_ BitVec 64))) (size!46157 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94451)

(declare-datatypes ((List!32127 0))(
  ( (Nil!32124) (Cons!32123 (h!33341 (_ BitVec 64)) (t!46813 List!32127)) )
))
(declare-fun arrayNoDuplicates!0 (array!94451 (_ BitVec 32) List!32127) Bool)

(assert (=> b!1383092 (= res!923931 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32124))))

(declare-fun res!923930 () Bool)

(assert (=> start!118164 (=> (not res!923930) (not e!784111))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118164 (= res!923930 (validMask!0 mask!3034))))

(assert (=> start!118164 e!784111))

(assert (=> start!118164 true))

(declare-fun array_inv!34887 (array!94451) Bool)

(assert (=> start!118164 (array_inv!34887 a!2971)))

(declare-fun b!1383093 () Bool)

(assert (=> b!1383093 (= e!784111 false)))

(declare-fun lt!608766 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94451 (_ BitVec 32)) Bool)

(assert (=> b!1383093 (= lt!608766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1383090 () Bool)

(declare-fun res!923929 () Bool)

(assert (=> b!1383090 (=> (not res!923929) (not e!784111))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1383090 (= res!923929 (and (= (size!46157 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46157 a!2971))))))

(declare-fun b!1383091 () Bool)

(declare-fun res!923932 () Bool)

(assert (=> b!1383091 (=> (not res!923932) (not e!784111))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383091 (= res!923932 (validKeyInArray!0 (select (arr!45606 a!2971) i!1094)))))

(assert (= (and start!118164 res!923930) b!1383090))

(assert (= (and b!1383090 res!923929) b!1383091))

(assert (= (and b!1383091 res!923932) b!1383092))

(assert (= (and b!1383092 res!923931) b!1383093))

(declare-fun m!1268595 () Bool)

(assert (=> b!1383092 m!1268595))

(declare-fun m!1268597 () Bool)

(assert (=> start!118164 m!1268597))

(declare-fun m!1268599 () Bool)

(assert (=> start!118164 m!1268599))

(declare-fun m!1268601 () Bool)

(assert (=> b!1383093 m!1268601))

(declare-fun m!1268603 () Bool)

(assert (=> b!1383091 m!1268603))

(assert (=> b!1383091 m!1268603))

(declare-fun m!1268605 () Bool)

(assert (=> b!1383091 m!1268605))

(push 1)

(assert (not start!118164))

(assert (not b!1383092))

(assert (not b!1383091))

(assert (not b!1383093))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

