; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118500 () Bool)

(assert start!118500)

(declare-fun b!1385544 () Bool)

(declare-fun res!926840 () Bool)

(declare-fun e!785047 () Bool)

(assert (=> b!1385544 (=> (not res!926840) (not e!785047))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94729 0))(
  ( (array!94730 (arr!45741 (Array (_ BitVec 32) (_ BitVec 64))) (size!46293 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94729)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1385544 (= res!926840 (and (= (size!46293 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46293 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46293 a!2938))))))

(declare-fun res!926837 () Bool)

(assert (=> start!118500 (=> (not res!926837) (not e!785047))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118500 (= res!926837 (validMask!0 mask!2987))))

(assert (=> start!118500 e!785047))

(assert (=> start!118500 true))

(declare-fun array_inv!34974 (array!94729) Bool)

(assert (=> start!118500 (array_inv!34974 a!2938)))

(declare-fun b!1385546 () Bool)

(declare-fun res!926839 () Bool)

(assert (=> b!1385546 (=> (not res!926839) (not e!785047))))

(declare-datatypes ((List!32347 0))(
  ( (Nil!32344) (Cons!32343 (h!33552 (_ BitVec 64)) (t!47033 List!32347)) )
))
(declare-fun arrayNoDuplicates!0 (array!94729 (_ BitVec 32) List!32347) Bool)

(assert (=> b!1385546 (= res!926839 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32344))))

(declare-fun b!1385545 () Bool)

(declare-fun res!926838 () Bool)

(assert (=> b!1385545 (=> (not res!926838) (not e!785047))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385545 (= res!926838 (validKeyInArray!0 (select (arr!45741 a!2938) i!1065)))))

(declare-fun b!1385547 () Bool)

(assert (=> b!1385547 (= e!785047 false)))

(declare-fun lt!609104 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94729 (_ BitVec 32)) Bool)

(assert (=> b!1385547 (= lt!609104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(assert (= (and start!118500 res!926837) b!1385544))

(assert (= (and b!1385544 res!926840) b!1385545))

(assert (= (and b!1385545 res!926838) b!1385546))

(assert (= (and b!1385546 res!926839) b!1385547))

(declare-fun m!1270401 () Bool)

(assert (=> start!118500 m!1270401))

(declare-fun m!1270403 () Bool)

(assert (=> start!118500 m!1270403))

(declare-fun m!1270405 () Bool)

(assert (=> b!1385546 m!1270405))

(declare-fun m!1270407 () Bool)

(assert (=> b!1385545 m!1270407))

(assert (=> b!1385545 m!1270407))

(declare-fun m!1270409 () Bool)

(assert (=> b!1385545 m!1270409))

(declare-fun m!1270411 () Bool)

(assert (=> b!1385547 m!1270411))

(push 1)

(assert (not b!1385547))

(assert (not b!1385546))

(assert (not start!118500))

(assert (not b!1385545))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

