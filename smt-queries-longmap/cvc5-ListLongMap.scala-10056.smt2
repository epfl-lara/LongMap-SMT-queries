; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118686 () Bool)

(assert start!118686)

(declare-fun b!1386742 () Bool)

(declare-fun res!927202 () Bool)

(declare-fun e!785836 () Bool)

(assert (=> b!1386742 (=> (not res!927202) (not e!785836))))

(declare-datatypes ((array!94860 0))(
  ( (array!94861 (arr!45804 (Array (_ BitVec 32) (_ BitVec 64))) (size!46355 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94860)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386742 (= res!927202 (validKeyInArray!0 (select (arr!45804 a!2938) i!1065)))))

(declare-fun res!927205 () Bool)

(assert (=> start!118686 (=> (not res!927205) (not e!785836))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118686 (= res!927205 (validMask!0 mask!2987))))

(assert (=> start!118686 e!785836))

(assert (=> start!118686 true))

(declare-fun array_inv!35085 (array!94860) Bool)

(assert (=> start!118686 (array_inv!35085 a!2938)))

(declare-fun b!1386741 () Bool)

(declare-fun res!927204 () Bool)

(assert (=> b!1386741 (=> (not res!927204) (not e!785836))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1386741 (= res!927204 (and (= (size!46355 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46355 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46355 a!2938))))))

(declare-fun b!1386744 () Bool)

(assert (=> b!1386744 (= e!785836 false)))

(declare-fun lt!609723 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94860 (_ BitVec 32)) Bool)

(assert (=> b!1386744 (= lt!609723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386743 () Bool)

(declare-fun res!927203 () Bool)

(assert (=> b!1386743 (=> (not res!927203) (not e!785836))))

(declare-datatypes ((List!32319 0))(
  ( (Nil!32316) (Cons!32315 (h!33533 (_ BitVec 64)) (t!47005 List!32319)) )
))
(declare-fun arrayNoDuplicates!0 (array!94860 (_ BitVec 32) List!32319) Bool)

(assert (=> b!1386743 (= res!927203 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32316))))

(assert (= (and start!118686 res!927205) b!1386741))

(assert (= (and b!1386741 res!927204) b!1386742))

(assert (= (and b!1386742 res!927202) b!1386743))

(assert (= (and b!1386743 res!927203) b!1386744))

(declare-fun m!1272357 () Bool)

(assert (=> b!1386742 m!1272357))

(assert (=> b!1386742 m!1272357))

(declare-fun m!1272359 () Bool)

(assert (=> b!1386742 m!1272359))

(declare-fun m!1272361 () Bool)

(assert (=> start!118686 m!1272361))

(declare-fun m!1272363 () Bool)

(assert (=> start!118686 m!1272363))

(declare-fun m!1272365 () Bool)

(assert (=> b!1386744 m!1272365))

(declare-fun m!1272367 () Bool)

(assert (=> b!1386743 m!1272367))

(push 1)

(assert (not b!1386743))

(assert (not start!118686))

(assert (not b!1386744))

(assert (not b!1386742))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

