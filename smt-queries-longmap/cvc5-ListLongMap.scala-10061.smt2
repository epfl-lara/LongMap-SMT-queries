; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118500 () Bool)

(assert start!118500)

(declare-fun b!1385592 () Bool)

(declare-fun e!785066 () Bool)

(assert (=> b!1385592 (= e!785066 false)))

(declare-fun lt!609282 () Bool)

(declare-datatypes ((array!94776 0))(
  ( (array!94777 (arr!45764 (Array (_ BitVec 32) (_ BitVec 64))) (size!46314 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94776)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94776 (_ BitVec 32)) Bool)

(assert (=> b!1385592 (= lt!609282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385590 () Bool)

(declare-fun res!926840 () Bool)

(assert (=> b!1385590 (=> (not res!926840) (not e!785066))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385590 (= res!926840 (validKeyInArray!0 (select (arr!45764 a!2938) i!1065)))))

(declare-fun b!1385591 () Bool)

(declare-fun res!926839 () Bool)

(assert (=> b!1385591 (=> (not res!926839) (not e!785066))))

(declare-datatypes ((List!32292 0))(
  ( (Nil!32289) (Cons!32288 (h!33497 (_ BitVec 64)) (t!46986 List!32292)) )
))
(declare-fun arrayNoDuplicates!0 (array!94776 (_ BitVec 32) List!32292) Bool)

(assert (=> b!1385591 (= res!926839 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32289))))

(declare-fun b!1385589 () Bool)

(declare-fun res!926841 () Bool)

(assert (=> b!1385589 (=> (not res!926841) (not e!785066))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385589 (= res!926841 (and (= (size!46314 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46314 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46314 a!2938))))))

(declare-fun res!926842 () Bool)

(assert (=> start!118500 (=> (not res!926842) (not e!785066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118500 (= res!926842 (validMask!0 mask!2987))))

(assert (=> start!118500 e!785066))

(assert (=> start!118500 true))

(declare-fun array_inv!34792 (array!94776) Bool)

(assert (=> start!118500 (array_inv!34792 a!2938)))

(assert (= (and start!118500 res!926842) b!1385589))

(assert (= (and b!1385589 res!926841) b!1385590))

(assert (= (and b!1385590 res!926840) b!1385591))

(assert (= (and b!1385591 res!926839) b!1385592))

(declare-fun m!1270881 () Bool)

(assert (=> b!1385592 m!1270881))

(declare-fun m!1270883 () Bool)

(assert (=> b!1385590 m!1270883))

(assert (=> b!1385590 m!1270883))

(declare-fun m!1270885 () Bool)

(assert (=> b!1385590 m!1270885))

(declare-fun m!1270887 () Bool)

(assert (=> b!1385591 m!1270887))

(declare-fun m!1270889 () Bool)

(assert (=> start!118500 m!1270889))

(declare-fun m!1270891 () Bool)

(assert (=> start!118500 m!1270891))

(push 1)

(assert (not start!118500))

(assert (not b!1385591))

(assert (not b!1385590))

(assert (not b!1385592))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

