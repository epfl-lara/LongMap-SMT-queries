; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118512 () Bool)

(assert start!118512)

(declare-fun b!1385664 () Bool)

(declare-fun e!785101 () Bool)

(assert (=> b!1385664 (= e!785101 false)))

(declare-fun lt!609300 () Bool)

(declare-datatypes ((array!94788 0))(
  ( (array!94789 (arr!45770 (Array (_ BitVec 32) (_ BitVec 64))) (size!46320 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94788)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94788 (_ BitVec 32)) Bool)

(assert (=> b!1385664 (= lt!609300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385661 () Bool)

(declare-fun res!926913 () Bool)

(assert (=> b!1385661 (=> (not res!926913) (not e!785101))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385661 (= res!926913 (and (= (size!46320 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46320 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46320 a!2938))))))

(declare-fun b!1385663 () Bool)

(declare-fun res!926911 () Bool)

(assert (=> b!1385663 (=> (not res!926911) (not e!785101))))

(declare-datatypes ((List!32298 0))(
  ( (Nil!32295) (Cons!32294 (h!33503 (_ BitVec 64)) (t!46992 List!32298)) )
))
(declare-fun arrayNoDuplicates!0 (array!94788 (_ BitVec 32) List!32298) Bool)

(assert (=> b!1385663 (= res!926911 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32295))))

(declare-fun b!1385662 () Bool)

(declare-fun res!926912 () Bool)

(assert (=> b!1385662 (=> (not res!926912) (not e!785101))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385662 (= res!926912 (validKeyInArray!0 (select (arr!45770 a!2938) i!1065)))))

(declare-fun res!926914 () Bool)

(assert (=> start!118512 (=> (not res!926914) (not e!785101))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118512 (= res!926914 (validMask!0 mask!2987))))

(assert (=> start!118512 e!785101))

(assert (=> start!118512 true))

(declare-fun array_inv!34798 (array!94788) Bool)

(assert (=> start!118512 (array_inv!34798 a!2938)))

(assert (= (and start!118512 res!926914) b!1385661))

(assert (= (and b!1385661 res!926913) b!1385662))

(assert (= (and b!1385662 res!926912) b!1385663))

(assert (= (and b!1385663 res!926911) b!1385664))

(declare-fun m!1270953 () Bool)

(assert (=> b!1385664 m!1270953))

(declare-fun m!1270955 () Bool)

(assert (=> b!1385663 m!1270955))

(declare-fun m!1270957 () Bool)

(assert (=> b!1385662 m!1270957))

(assert (=> b!1385662 m!1270957))

(declare-fun m!1270959 () Bool)

(assert (=> b!1385662 m!1270959))

(declare-fun m!1270961 () Bool)

(assert (=> start!118512 m!1270961))

(declare-fun m!1270963 () Bool)

(assert (=> start!118512 m!1270963))

(push 1)

(assert (not b!1385662))

(assert (not b!1385663))

(assert (not start!118512))

(assert (not b!1385664))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

