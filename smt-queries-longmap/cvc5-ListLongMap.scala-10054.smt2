; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118458 () Bool)

(assert start!118458)

(declare-fun b!1385338 () Bool)

(declare-fun res!926587 () Bool)

(declare-fun e!784939 () Bool)

(assert (=> b!1385338 (=> (not res!926587) (not e!784939))))

(declare-datatypes ((array!94734 0))(
  ( (array!94735 (arr!45743 (Array (_ BitVec 32) (_ BitVec 64))) (size!46293 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94734)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385338 (= res!926587 (validKeyInArray!0 (select (arr!45743 a!2938) i!1065)))))

(declare-fun b!1385340 () Bool)

(assert (=> b!1385340 (= e!784939 false)))

(declare-fun lt!609219 () Bool)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94734 (_ BitVec 32)) Bool)

(assert (=> b!1385340 (= lt!609219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385339 () Bool)

(declare-fun res!926588 () Bool)

(assert (=> b!1385339 (=> (not res!926588) (not e!784939))))

(declare-datatypes ((List!32271 0))(
  ( (Nil!32268) (Cons!32267 (h!33476 (_ BitVec 64)) (t!46965 List!32271)) )
))
(declare-fun arrayNoDuplicates!0 (array!94734 (_ BitVec 32) List!32271) Bool)

(assert (=> b!1385339 (= res!926588 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32268))))

(declare-fun res!926589 () Bool)

(assert (=> start!118458 (=> (not res!926589) (not e!784939))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118458 (= res!926589 (validMask!0 mask!2987))))

(assert (=> start!118458 e!784939))

(assert (=> start!118458 true))

(declare-fun array_inv!34771 (array!94734) Bool)

(assert (=> start!118458 (array_inv!34771 a!2938)))

(declare-fun b!1385337 () Bool)

(declare-fun res!926590 () Bool)

(assert (=> b!1385337 (=> (not res!926590) (not e!784939))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385337 (= res!926590 (and (= (size!46293 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46293 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46293 a!2938))))))

(assert (= (and start!118458 res!926589) b!1385337))

(assert (= (and b!1385337 res!926590) b!1385338))

(assert (= (and b!1385338 res!926587) b!1385339))

(assert (= (and b!1385339 res!926588) b!1385340))

(declare-fun m!1270629 () Bool)

(assert (=> b!1385338 m!1270629))

(assert (=> b!1385338 m!1270629))

(declare-fun m!1270631 () Bool)

(assert (=> b!1385338 m!1270631))

(declare-fun m!1270633 () Bool)

(assert (=> b!1385340 m!1270633))

(declare-fun m!1270635 () Bool)

(assert (=> b!1385339 m!1270635))

(declare-fun m!1270637 () Bool)

(assert (=> start!118458 m!1270637))

(declare-fun m!1270639 () Bool)

(assert (=> start!118458 m!1270639))

(push 1)

(assert (not b!1385338))

(assert (not b!1385340))

(assert (not start!118458))

(assert (not b!1385339))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

