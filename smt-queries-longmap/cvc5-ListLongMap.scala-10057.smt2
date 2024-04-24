; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118692 () Bool)

(assert start!118692)

(declare-fun b!1386780 () Bool)

(declare-fun e!785854 () Bool)

(assert (=> b!1386780 (= e!785854 false)))

(declare-fun lt!609732 () Bool)

(declare-datatypes ((array!94866 0))(
  ( (array!94867 (arr!45807 (Array (_ BitVec 32) (_ BitVec 64))) (size!46358 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94866)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94866 (_ BitVec 32)) Bool)

(assert (=> b!1386780 (= lt!609732 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386778 () Bool)

(declare-fun res!927240 () Bool)

(assert (=> b!1386778 (=> (not res!927240) (not e!785854))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386778 (= res!927240 (validKeyInArray!0 (select (arr!45807 a!2938) i!1065)))))

(declare-fun b!1386777 () Bool)

(declare-fun res!927239 () Bool)

(assert (=> b!1386777 (=> (not res!927239) (not e!785854))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1386777 (= res!927239 (and (= (size!46358 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46358 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46358 a!2938))))))

(declare-fun res!927241 () Bool)

(assert (=> start!118692 (=> (not res!927241) (not e!785854))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118692 (= res!927241 (validMask!0 mask!2987))))

(assert (=> start!118692 e!785854))

(assert (=> start!118692 true))

(declare-fun array_inv!35088 (array!94866) Bool)

(assert (=> start!118692 (array_inv!35088 a!2938)))

(declare-fun b!1386779 () Bool)

(declare-fun res!927238 () Bool)

(assert (=> b!1386779 (=> (not res!927238) (not e!785854))))

(declare-datatypes ((List!32322 0))(
  ( (Nil!32319) (Cons!32318 (h!33536 (_ BitVec 64)) (t!47008 List!32322)) )
))
(declare-fun arrayNoDuplicates!0 (array!94866 (_ BitVec 32) List!32322) Bool)

(assert (=> b!1386779 (= res!927238 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32319))))

(assert (= (and start!118692 res!927241) b!1386777))

(assert (= (and b!1386777 res!927239) b!1386778))

(assert (= (and b!1386778 res!927240) b!1386779))

(assert (= (and b!1386779 res!927238) b!1386780))

(declare-fun m!1272393 () Bool)

(assert (=> b!1386780 m!1272393))

(declare-fun m!1272395 () Bool)

(assert (=> b!1386778 m!1272395))

(assert (=> b!1386778 m!1272395))

(declare-fun m!1272397 () Bool)

(assert (=> b!1386778 m!1272397))

(declare-fun m!1272399 () Bool)

(assert (=> start!118692 m!1272399))

(declare-fun m!1272401 () Bool)

(assert (=> start!118692 m!1272401))

(declare-fun m!1272403 () Bool)

(assert (=> b!1386779 m!1272403))

(push 1)

(assert (not b!1386780))

(assert (not start!118692))

(assert (not b!1386779))

(assert (not b!1386778))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

