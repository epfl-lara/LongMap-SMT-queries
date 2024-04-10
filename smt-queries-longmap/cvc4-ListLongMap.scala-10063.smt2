; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118516 () Bool)

(assert start!118516)

(declare-fun b!1385685 () Bool)

(declare-fun res!926936 () Bool)

(declare-fun e!785113 () Bool)

(assert (=> b!1385685 (=> (not res!926936) (not e!785113))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94792 0))(
  ( (array!94793 (arr!45772 (Array (_ BitVec 32) (_ BitVec 64))) (size!46322 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94792)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385685 (= res!926936 (and (= (size!46322 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46322 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46322 a!2938))))))

(declare-fun res!926938 () Bool)

(assert (=> start!118516 (=> (not res!926938) (not e!785113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118516 (= res!926938 (validMask!0 mask!2987))))

(assert (=> start!118516 e!785113))

(assert (=> start!118516 true))

(declare-fun array_inv!34800 (array!94792) Bool)

(assert (=> start!118516 (array_inv!34800 a!2938)))

(declare-fun b!1385688 () Bool)

(assert (=> b!1385688 (= e!785113 false)))

(declare-fun lt!609306 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94792 (_ BitVec 32)) Bool)

(assert (=> b!1385688 (= lt!609306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385686 () Bool)

(declare-fun res!926935 () Bool)

(assert (=> b!1385686 (=> (not res!926935) (not e!785113))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385686 (= res!926935 (validKeyInArray!0 (select (arr!45772 a!2938) i!1065)))))

(declare-fun b!1385687 () Bool)

(declare-fun res!926937 () Bool)

(assert (=> b!1385687 (=> (not res!926937) (not e!785113))))

(declare-datatypes ((List!32300 0))(
  ( (Nil!32297) (Cons!32296 (h!33505 (_ BitVec 64)) (t!46994 List!32300)) )
))
(declare-fun arrayNoDuplicates!0 (array!94792 (_ BitVec 32) List!32300) Bool)

(assert (=> b!1385687 (= res!926937 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32297))))

(assert (= (and start!118516 res!926938) b!1385685))

(assert (= (and b!1385685 res!926936) b!1385686))

(assert (= (and b!1385686 res!926935) b!1385687))

(assert (= (and b!1385687 res!926937) b!1385688))

(declare-fun m!1270977 () Bool)

(assert (=> start!118516 m!1270977))

(declare-fun m!1270979 () Bool)

(assert (=> start!118516 m!1270979))

(declare-fun m!1270981 () Bool)

(assert (=> b!1385688 m!1270981))

(declare-fun m!1270983 () Bool)

(assert (=> b!1385686 m!1270983))

(assert (=> b!1385686 m!1270983))

(declare-fun m!1270985 () Bool)

(assert (=> b!1385686 m!1270985))

(declare-fun m!1270987 () Bool)

(assert (=> b!1385687 m!1270987))

(push 1)

(assert (not start!118516))

(assert (not b!1385687))

(assert (not b!1385688))

(assert (not b!1385686))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

