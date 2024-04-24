; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118740 () Bool)

(assert start!118740)

(declare-fun b!1387092 () Bool)

(declare-fun res!927556 () Bool)

(declare-fun e!785998 () Bool)

(assert (=> b!1387092 (=> (not res!927556) (not e!785998))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94914 0))(
  ( (array!94915 (arr!45831 (Array (_ BitVec 32) (_ BitVec 64))) (size!46382 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94914)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1387092 (= res!927556 (and (= (size!46382 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46382 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46382 a!2938))))))

(declare-fun res!927553 () Bool)

(assert (=> start!118740 (=> (not res!927553) (not e!785998))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118740 (= res!927553 (validMask!0 mask!2987))))

(assert (=> start!118740 e!785998))

(assert (=> start!118740 true))

(declare-fun array_inv!35112 (array!94914) Bool)

(assert (=> start!118740 (array_inv!35112 a!2938)))

(declare-fun b!1387093 () Bool)

(declare-fun res!927555 () Bool)

(assert (=> b!1387093 (=> (not res!927555) (not e!785998))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1387093 (= res!927555 (validKeyInArray!0 (select (arr!45831 a!2938) i!1065)))))

(declare-fun b!1387095 () Bool)

(assert (=> b!1387095 (= e!785998 false)))

(declare-fun lt!609795 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94914 (_ BitVec 32)) Bool)

(assert (=> b!1387095 (= lt!609795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1387094 () Bool)

(declare-fun res!927554 () Bool)

(assert (=> b!1387094 (=> (not res!927554) (not e!785998))))

(declare-datatypes ((List!32346 0))(
  ( (Nil!32343) (Cons!32342 (h!33560 (_ BitVec 64)) (t!47032 List!32346)) )
))
(declare-fun arrayNoDuplicates!0 (array!94914 (_ BitVec 32) List!32346) Bool)

(assert (=> b!1387094 (= res!927554 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32343))))

(assert (= (and start!118740 res!927553) b!1387092))

(assert (= (and b!1387092 res!927556) b!1387093))

(assert (= (and b!1387093 res!927555) b!1387094))

(assert (= (and b!1387094 res!927554) b!1387095))

(declare-fun m!1272693 () Bool)

(assert (=> start!118740 m!1272693))

(declare-fun m!1272695 () Bool)

(assert (=> start!118740 m!1272695))

(declare-fun m!1272697 () Bool)

(assert (=> b!1387093 m!1272697))

(assert (=> b!1387093 m!1272697))

(declare-fun m!1272699 () Bool)

(assert (=> b!1387093 m!1272699))

(declare-fun m!1272701 () Bool)

(assert (=> b!1387095 m!1272701))

(declare-fun m!1272703 () Bool)

(assert (=> b!1387094 m!1272703))

(push 1)

(assert (not b!1387093))

(assert (not b!1387094))

(assert (not start!118740))

(assert (not b!1387095))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

