; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118486 () Bool)

(assert start!118486)

(declare-fun b!1385507 () Bool)

(declare-fun res!926755 () Bool)

(declare-fun e!785023 () Bool)

(assert (=> b!1385507 (=> (not res!926755) (not e!785023))))

(declare-datatypes ((array!94762 0))(
  ( (array!94763 (arr!45757 (Array (_ BitVec 32) (_ BitVec 64))) (size!46307 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94762)

(declare-datatypes ((List!32285 0))(
  ( (Nil!32282) (Cons!32281 (h!33490 (_ BitVec 64)) (t!46979 List!32285)) )
))
(declare-fun arrayNoDuplicates!0 (array!94762 (_ BitVec 32) List!32285) Bool)

(assert (=> b!1385507 (= res!926755 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32282))))

(declare-fun b!1385506 () Bool)

(declare-fun res!926756 () Bool)

(assert (=> b!1385506 (=> (not res!926756) (not e!785023))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385506 (= res!926756 (validKeyInArray!0 (select (arr!45757 a!2938) i!1065)))))

(declare-fun b!1385508 () Bool)

(assert (=> b!1385508 (= e!785023 false)))

(declare-fun lt!609261 () Bool)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94762 (_ BitVec 32)) Bool)

(assert (=> b!1385508 (= lt!609261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385505 () Bool)

(declare-fun res!926757 () Bool)

(assert (=> b!1385505 (=> (not res!926757) (not e!785023))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385505 (= res!926757 (and (= (size!46307 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46307 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46307 a!2938))))))

(declare-fun res!926758 () Bool)

(assert (=> start!118486 (=> (not res!926758) (not e!785023))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118486 (= res!926758 (validMask!0 mask!2987))))

(assert (=> start!118486 e!785023))

(assert (=> start!118486 true))

(declare-fun array_inv!34785 (array!94762) Bool)

(assert (=> start!118486 (array_inv!34785 a!2938)))

(assert (= (and start!118486 res!926758) b!1385505))

(assert (= (and b!1385505 res!926757) b!1385506))

(assert (= (and b!1385506 res!926756) b!1385507))

(assert (= (and b!1385507 res!926755) b!1385508))

(declare-fun m!1270797 () Bool)

(assert (=> b!1385507 m!1270797))

(declare-fun m!1270799 () Bool)

(assert (=> b!1385506 m!1270799))

(assert (=> b!1385506 m!1270799))

(declare-fun m!1270801 () Bool)

(assert (=> b!1385506 m!1270801))

(declare-fun m!1270803 () Bool)

(assert (=> b!1385508 m!1270803))

(declare-fun m!1270805 () Bool)

(assert (=> start!118486 m!1270805))

(declare-fun m!1270807 () Bool)

(assert (=> start!118486 m!1270807))

(push 1)

(assert (not start!118486))

(assert (not b!1385507))

(assert (not b!1385506))

(assert (not b!1385508))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

