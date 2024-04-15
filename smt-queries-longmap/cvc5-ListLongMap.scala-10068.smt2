; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118542 () Bool)

(assert start!118542)

(declare-fun b!1385825 () Bool)

(declare-fun res!927116 () Bool)

(declare-fun e!785172 () Bool)

(assert (=> b!1385825 (=> (not res!927116) (not e!785172))))

(declare-datatypes ((array!94771 0))(
  ( (array!94772 (arr!45762 (Array (_ BitVec 32) (_ BitVec 64))) (size!46314 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94771)

(declare-datatypes ((List!32368 0))(
  ( (Nil!32365) (Cons!32364 (h!33573 (_ BitVec 64)) (t!47054 List!32368)) )
))
(declare-fun arrayNoDuplicates!0 (array!94771 (_ BitVec 32) List!32368) Bool)

(assert (=> b!1385825 (= res!927116 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32365))))

(declare-fun b!1385823 () Bool)

(declare-fun res!927117 () Bool)

(assert (=> b!1385823 (=> (not res!927117) (not e!785172))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1385823 (= res!927117 (and (= (size!46314 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46314 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46314 a!2938))))))

(declare-fun b!1385824 () Bool)

(declare-fun res!927118 () Bool)

(assert (=> b!1385824 (=> (not res!927118) (not e!785172))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385824 (= res!927118 (validKeyInArray!0 (select (arr!45762 a!2938) i!1065)))))

(declare-fun b!1385826 () Bool)

(assert (=> b!1385826 (= e!785172 false)))

(declare-fun lt!609158 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94771 (_ BitVec 32)) Bool)

(assert (=> b!1385826 (= lt!609158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!927119 () Bool)

(assert (=> start!118542 (=> (not res!927119) (not e!785172))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118542 (= res!927119 (validMask!0 mask!2987))))

(assert (=> start!118542 e!785172))

(assert (=> start!118542 true))

(declare-fun array_inv!34995 (array!94771) Bool)

(assert (=> start!118542 (array_inv!34995 a!2938)))

(assert (= (and start!118542 res!927119) b!1385823))

(assert (= (and b!1385823 res!927117) b!1385824))

(assert (= (and b!1385824 res!927118) b!1385825))

(assert (= (and b!1385825 res!927116) b!1385826))

(declare-fun m!1270665 () Bool)

(assert (=> b!1385825 m!1270665))

(declare-fun m!1270667 () Bool)

(assert (=> b!1385824 m!1270667))

(assert (=> b!1385824 m!1270667))

(declare-fun m!1270669 () Bool)

(assert (=> b!1385824 m!1270669))

(declare-fun m!1270671 () Bool)

(assert (=> b!1385826 m!1270671))

(declare-fun m!1270673 () Bool)

(assert (=> start!118542 m!1270673))

(declare-fun m!1270675 () Bool)

(assert (=> start!118542 m!1270675))

(push 1)

(assert (not b!1385824))

(assert (not b!1385825))

(assert (not start!118542))

(assert (not b!1385826))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

